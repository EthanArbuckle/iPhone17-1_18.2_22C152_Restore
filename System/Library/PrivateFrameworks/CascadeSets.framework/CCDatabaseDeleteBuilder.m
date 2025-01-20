@interface CCDatabaseDeleteBuilder
- (id)build;
- (void)setCommandCriterion:(id)a3;
- (void)setReturningColumns:(id)a3;
@end

@implementation CCDatabaseDeleteBuilder

- (id)build
{
  v3 = [(CCDatabaseCommandBuilder *)self tableName];
  v4 = [(CCDatabaseCommandBuilder *)self criterion];
  v5 = +[CCSQLCommandGenerator deleteFromTableWithName:v3 criterion:v4 returningColumns:self->_returningColumns];

  return v5;
}

- (void)setCommandCriterion:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CCDatabaseDeleteBuilder;
  [(CCDatabaseCommandBuilder *)&v3 setCommandCriterion:a3];
}

- (void)setReturningColumns:(id)a3
{
  self->_returningColumns = (NSArray *)[a3 copy];

  MEMORY[0x270F9A758]();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_returningColumns, 0);
}

@end