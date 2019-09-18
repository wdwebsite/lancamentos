# Projeto Lançamentos bancários
# Banco de dados: Mysql
# Desenvolvedor projeto inicial: Wagner Danielli
# Projeto precisa ser desenvolvido de acordo com as regras mostradas na Wiki banco de dados design
# Este projeto esta em desenvolvimento no github no link: https://github.com/wdwebsite/lancamentos

CREATE DATABASE IF NOT EXISTS `lancamentos`;
USE `lancamentos`;


#
# Table structure for table 'TAB_BANCOS'
#

# LEMBRAMOS QUE ESTAS TABELAS SÃO APENAS UM EXEMPLO INICIAL DO PROJETO, O MESMO DEVE SER DESENVOLVIDO DE ACORDO COM AS
# INSTRUÇÕES CONTIDAS EM WIKI POIS O BANCO DE DADOS PRECISA ESTAR BEM NORMALIZADO
# PRIMEIRO SERÁ DESENVOLVIDA A PARTE DO DESENVOLVIMENTO E DEPOIS A PARTE VISUAL

DROP TABLE IF EXISTS `TAB_BANCOS`;

CREATE TABLE `TAB_BANCOS` (
  `COD_BCO` VARCHAR(3) NOT NULL, 
  `TITULO_BCO` VARCHAR(30), 
  `CONTA_BCO` VARCHAR(10), 
  `AGENCIA_BCO` VARCHAR(10), 
  `BANCO_BCO` VARCHAR(15), 
  `TIPO_BCO` VARCHAR(1), 
  PRIMARY KEY (`COD_BCO`), 
  INDEX (`TIPO_BCO`), 
  INDEX (`TITULO_BCO`)
) ENGINE=myisam DEFAULT CHARSET=utf8;

SET autocommit=1;

#
# Dumping data for table 'TAB_BANCOS'
#

INSERT INTO `TAB_BANCOS` (`COD_BCO`, `TITULO_BCO`, `CONTA_BCO`, `AGENCIA_BCO`, `BANCO_BCO`, `TIPO_BCO`) VALUES ('001', 'João da Silva neto', '21.536-2 ', '1051-0 ', 'Brasil ', 'C');
INSERT INTO `TAB_BANCOS` (`COD_BCO`, `TITULO_BCO`, `CONTA_BCO`, `AGENCIA_BCO`, `BANCO_BCO`, `TIPO_BCO`) VALUES ('002', 'Joaquim da Silva de souza', '10.798-2 ', '1051-0  ', 'Brasil  ', 'C');
INSERT INTO `TAB_BANCOS` (`COD_BCO`, `TITULO_BCO`, `CONTA_BCO`, `AGENCIA_BCO`, `BANCO_BCO`, `TIPO_BCO`) VALUES ('003', 'Paulo xavier ', '122543-7 ', '2058-3  ', 'Bradesco  ', 'C');

#
# Table structure for table 'TAB_LANCAMENTOS'
#

DROP TABLE IF EXISTS `TAB_LANCAMENTOS`;

CREATE TABLE `TAB_LANCAMENTOS` (
  `Data_Lan` DATETIME, 
  `Documento_Lan` VARCHAR(10), 
  `Historico_Lan` VARCHAR(50), 
  `Saldo_Lan` DECIMAL(19,4), 
  `Valor_Lan` DECIMAL(19,4), 
  `Tipo_Lan` VARCHAR(1), 
  `Cod_Lan` VARCHAR(6) NOT NULL, 
  `Cod_Bco` VARCHAR(3), 
  `Conciliado_Lan` VARCHAR(1), 
  INDEX (`Cod_Bco`, `Data_Lan`, `Cod_Lan`), 
  PRIMARY KEY (`Cod_Lan`)
) ENGINE=myisam DEFAULT CHARSET=utf8;

SET autocommit=1;

#
# Dumping data for table 'TAB_LANCAMENTOS'
#

INSERT INTO `TAB_LANCAMENTOS` (`Data_Lan`, `Documento_Lan`, `Historico_Lan`, `Saldo_Lan`, `Valor_Lan`, `Tipo_Lan`, `Cod_Lan`, `Cod_Bco`, `Conciliado_Lan`) VALUES ('2016-03-01 00:00:00', 'FL.PGTO.', 'VLR.SEGURO', 1306.8, 13.2, 'D', '006981', '646', ' ');
INSERT INTO `TAB_LANCAMENTOS` (`Data_Lan`, `Documento_Lan`, `Historico_Lan`, `Saldo_Lan`, `Valor_Lan`, `Tipo_Lan`, `Cod_Lan`, `Cod_Bco`, `Conciliado_Lan`) VALUES ('2016-03-01 00:00:00', 'FL.PGTO.', 'VLR.INSS', 1219.92, 86.88, 'D', '006982', '646', ' ');
INSERT INTO `TAB_LANCAMENTOS` (`Data_Lan`, `Documento_Lan`, `Historico_Lan`, `Saldo_Lan`, `Valor_Lan`, `Tipo_Lan`, `Cod_Lan`, `Cod_Bco`, `Conciliado_Lan`) VALUES ('2016-03-01 00:00:00', 'FL.PGTO.', 'VLR.SALÁRIO 02/16', 1625, 2325, 'C', '006983', '038', ' ');
