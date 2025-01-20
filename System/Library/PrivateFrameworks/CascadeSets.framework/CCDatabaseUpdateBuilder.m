@interface CCDatabaseUpdateBuilder
- (CCDatabaseUpdateBuilder)initWithTableName:(id)a3;
- (id)build;
- (void)setCommandCriterion:(id)a3;
- (void)setReturningColumns:(id)a3;
- (void)setValue:(id)a3 forColumn:(id)a4;
@end

@implementation CCDatabaseUpdateBuilder

- (CCDatabaseUpdateBuilder)initWithTableName:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CCDatabaseUpdateBuilder;
  v3 = [(CCDatabaseCommandBuilder *)&v9 initWithTableName:a3];
  if (v3)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    columnNames = v3->_columnNames;
    v3->_columnNames = v4;

    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    columnValues = v3->_columnValues;
    v3->_columnValues = v6;
  }
  return v3;
}

- (id)build
{
  v3 = [(CCDatabaseCommandBuilder *)self tableName];
  columnNames = self->_columnNames;
  columnValues = self->_columnValues;
  v6 = [(CCDatabaseCommandBuilder *)self criterion];
  v7 = +[CCSQLCommandGenerator updateWithTableName:v3 columnNames:columnNames columnValues:columnValues criterion:v6 returningColumns:self->_returningColumns];

  return v7;
}

- (void)setCommandCriterion:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CCDatabaseUpdateBuilder;
  [(CCDatabaseCommandBuilder *)&v3 setCommandCriterion:a3];
}

- (void)setValue:(id)a3 forColumn:(id)a4
{
  columnNames = self->_columnNames;
  id v7 = a3;
  [(NSMutableArray *)columnNames addObject:a4];
  [(NSMutableArray *)self->_columnValues addObject:v7];
}

- (void)setReturningColumns:(id)a3
{
  self->_returningColumns = (NSArray *)[a3 copy];

  MEMORY[0x270F9A758]();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_returningColumns, 0);
  objc_storeStrong((id *)&self->_columnValues, 0);

  objc_storeStrong((id *)&self->_columnNames, 0);
}

@end