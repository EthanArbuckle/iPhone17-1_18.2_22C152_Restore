@interface CCDatabaseCommandBuilder
- (CCDatabaseCommandBuilder)init;
- (CCDatabaseCommandBuilder)initWithTableName:(id)a3;
- (CCSQLCommandCriterion)criterion;
- (NSString)tableName;
- (void)setCommandCriterion:(id)a3;
@end

@implementation CCDatabaseCommandBuilder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_criterion, 0);

  objc_storeStrong((id *)&self->_tableName, 0);
}

- (CCDatabaseCommandBuilder)initWithTableName:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CCDatabaseCommandBuilder;
  v5 = [(CCDatabaseCommandBuilder *)&v12 init];
  if (!v5
    || (uint64_t v6 = [v4 copy],
        tableName = v5->_tableName,
        v5->_tableName = (NSString *)v6,
        tableName,
        (v8 = v5->_tableName) != 0)
    && [(NSString *)v8 length])
  {
    v9 = v5;
  }
  else
  {
    v10 = __biome_log_for_category();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[CCDatabaseCommandBuilder initWithTableName:](v10);
    }

    v9 = 0;
  }

  return v9;
}

- (void)setCommandCriterion:(id)a3
{
  self->_criterion = (CCSQLCommandCriterion *)[a3 copy];

  MEMORY[0x270F9A758]();
}

- (NSString)tableName
{
  return self->_tableName;
}

- (CCSQLCommandCriterion)criterion
{
  return self->_criterion;
}

- (CCDatabaseCommandBuilder)init
{
  id v2 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"init unsupported" userInfo:MEMORY[0x263EFFA78]];
  objc_exception_throw(v2);
}

- (void)initWithTableName:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_249B92000, log, OS_LOG_TYPE_ERROR, "Cannot construct database command builder with nil tableName", v1, 2u);
}

@end