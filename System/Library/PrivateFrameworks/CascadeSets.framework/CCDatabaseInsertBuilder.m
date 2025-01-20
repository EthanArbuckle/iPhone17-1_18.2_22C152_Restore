@interface CCDatabaseInsertBuilder
- (BOOL)_setError:(id *)a3 withCode:(int64_t)a4;
- (CCDatabaseInsertBuilder)initWithTableName:(id)a3 columnNames:(id)a4;
- (id)buildWithError:(id *)a3;
- (void)setColumnValues:(id)a3;
- (void)setOnConflict:(id)a3;
- (void)setReturningColumns:(id)a3;
@end

@implementation CCDatabaseInsertBuilder

- (void)setOnConflict:(id)a3
{
}

- (void)setColumnValues:(id)a3
{
  self->_columnValues = (NSArray *)[a3 copy];

  MEMORY[0x270F9A758]();
}

- (id)buildWithError:(id *)a3
{
  unint64_t numberOfColumns = self->_numberOfColumns;
  if (numberOfColumns == [(NSArray *)self->_columnValues count])
  {
    v6 = [(CCDatabaseCommandBuilder *)self tableName];
    v7 = +[CCSQLCommandGenerator insertCommandStringWithTableName:v6 columnNames:self->_columnNames returningColumns:self->_returningColumns onConflict:self->_onConflict];

    v8 = [(CCDatabaseCommand *)[CCDatabaseInsert alloc] initWithCommandString:v7 parameters:self->_columnValues];
  }
  else
  {
    [(CCDatabaseInsertBuilder *)self _setError:a3 withCode:1];
    v9 = __biome_log_for_category();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[CCDatabaseInsertBuilder buildWithError:](v9);
    }

    v8 = 0;
  }

  return v8;
}

- (CCDatabaseInsertBuilder)initWithTableName:(id)a3 columnNames:(id)a4
{
  id v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CCDatabaseInsertBuilder;
  v7 = [(CCDatabaseCommandBuilder *)&v14 initWithTableName:a3];
  if (!v7) {
    goto LABEL_4;
  }
  uint64_t v8 = [v6 count];
  v7->_unint64_t numberOfColumns = v8;
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    columnNames = v7->_columnNames;
    v7->_columnNames = (NSArray *)v9;

LABEL_4:
    v11 = v7;
    goto LABEL_8;
  }
  v12 = __biome_log_for_category();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    -[CCDatabaseInsertBuilder initWithTableName:columnNames:](v12);
  }

  v11 = 0;
LABEL_8:

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_onConflict, 0);
  objc_storeStrong((id *)&self->_returningColumns, 0);
  objc_storeStrong((id *)&self->_columnValues, 0);

  objc_storeStrong((id *)&self->_columnNames, 0);
}

- (void)setReturningColumns:(id)a3
{
  self->_returningColumns = (NSArray *)[a3 copy];

  MEMORY[0x270F9A758]();
}

- (BOOL)_setError:(id *)a3 withCode:(int64_t)a4
{
  if (a3)
  {
    *a3 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.CascadeSets.DatabaseInsert" code:a4 userInfo:0];
  }
  return a3 != 0;
}

- (void)initWithTableName:(os_log_t)log columnNames:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_249B92000, log, OS_LOG_TYPE_ERROR, "Cannot construct DatabaseInsertBuilder with empty columnNames array", v1, 2u);
}

- (void)buildWithError:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_249B92000, log, OS_LOG_TYPE_ERROR, "columnValues array size does not match columnNames array size", v1, 2u);
}

@end