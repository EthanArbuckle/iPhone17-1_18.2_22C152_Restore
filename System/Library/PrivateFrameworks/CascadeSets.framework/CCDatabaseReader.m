@interface CCDatabaseReader
+ (id)readerForDatabaseAtURL:(id)a3 accessAssertion:(id)a4;
- (BOOL)_commitAndCloseReadTransactionIfExists:(id *)a3;
- (BOOL)_openAndBeginReadTransactionIfNotExists:(id *)a3;
- (BOOL)enumerateRecordResultsOfSelect:(id)a3 recordClass:(Class)a4 error:(id *)a5 usingBlock:(id)a6;
- (BOOL)enumerateRowResultsOfSelect:(id)a3 error:(id *)a4 usingBlock:(id)a5;
- (CCDatabaseReader)init;
- (CCDatabaseReader)initWithConnection:(id)a3;
- (id)enumeratorForRowResultsOfSelect:(id)a3 error:(id *)a4;
- (void)dealloc;
@end

@implementation CCDatabaseReader

- (CCDatabaseReader)init
{
  id v2 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"init unsupported" userInfo:MEMORY[0x263EFFA78]];
  objc_exception_throw(v2);
}

+ (id)readerForDatabaseAtURL:(id)a3 accessAssertion:(id)a4
{
  v4 = +[CCDatabaseConnection readOnlyConnectionToDatabaseAtURL:a3 accessAssertion:a4];
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithConnection:v4];

  return v5;
}

- (CCDatabaseReader)initWithConnection:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CCDatabaseReader;
  v6 = [(CCDatabaseReader *)&v11 init];
  v7 = v6;
  if (v6 && (objc_storeStrong((id *)&v6->_connection, a3), !v7->_connection))
  {
    v9 = __biome_log_for_category();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[CCDatabaseReader initWithConnection:](v9);
    }

    v8 = 0;
  }
  else
  {
    v8 = v7;
  }

  return v8;
}

- (void)dealloc
{
  [(CCDatabaseReader *)self reset:0];
  v3.receiver = self;
  v3.super_class = (Class)CCDatabaseReader;
  [(CCDatabaseReader *)&v3 dealloc];
}

- (BOOL)_openAndBeginReadTransactionIfNotExists:(id *)a3
{
  if (self->_inTransaction) {
    return 1;
  }
  if (-[CCDatabaseConnection openWithError:](self->_connection, "openWithError:"))
  {
    if ([(CCDatabaseConnection *)self->_connection beginTransactionWithError:a3]) {
      self->_inTransaction = 1;
    }
  }
  return self->_inTransaction;
}

- (BOOL)_commitAndCloseReadTransactionIfExists:(id *)a3
{
  if (!self->_inTransaction) {
    return 1;
  }
  if (-[CCDatabaseConnection commitTransactionWithError:](self->_connection, "commitTransactionWithError:"))
  {
    if ([(CCDatabaseConnection *)self->_connection closeWithError:a3]) {
      self->_inTransaction = 0;
    }
  }
  return !self->_inTransaction;
}

- (BOOL)enumerateRecordResultsOfSelect:(id)a3 recordClass:(Class)a4 error:(id *)a5 usingBlock:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  if ([(CCDatabaseReader *)self _openAndBeginReadTransactionIfNotExists:a5])
  {
    BOOL v12 = [(CCDatabaseConnection *)self->_connection enumerateRecordResultsOfSelect:v10 recordClass:a4 error:a5 usingBlock:v11];
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)enumerateRowResultsOfSelect:(id)a3 error:(id *)a4 usingBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ([(CCDatabaseReader *)self _openAndBeginReadTransactionIfNotExists:a4])
  {
    BOOL v10 = [(CCDatabaseConnection *)self->_connection enumerateRowResultsOfSelect:v8 error:a4 usingBlock:v9];
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (id)enumeratorForRowResultsOfSelect:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(CCDatabaseReader *)self _openAndBeginReadTransactionIfNotExists:a4])
  {
    v7 = [(CCDatabaseConnection *)self->_connection enumeratorForRowResultsOfSelect:v6 error:a4];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
}

- (void)initWithConnection:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_249B92000, log, OS_LOG_TYPE_ERROR, "nil database connection.", v1, 2u);
}

@end