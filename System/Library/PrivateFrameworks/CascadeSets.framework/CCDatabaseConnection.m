@interface CCDatabaseConnection
+ (id)connectionToDatabaseAtURL:(id)a3 dataProtectionClass:(int)a4 openMode:(int64_t)a5 accessAssertion:(id)a6;
+ (id)readOnlyConnectionToDatabaseAtURL:(id)a3 accessAssertion:(id)a4;
- (BOOL)_createTableWithRecordClass:(Class)a3 error:(id *)a4;
- (BOOL)_getRowResultsOfSelect:(id)a3 outRows:(id *)a4 error:(id *)a5;
- (BOOL)beginTransactionWithError:(id *)a3;
- (BOOL)cleanup:(id *)a3;
- (BOOL)closeWithError:(id *)a3;
- (BOOL)commitTransactionWithError:(id *)a3;
- (BOOL)enumerateRecordResultsOfSelect:(id)a3 recordClass:(Class)a4 error:(id *)a5 usingBlock:(id)a6;
- (BOOL)enumerateRowResultsOfSelect:(id)a3 error:(id *)a4 usingBlock:(id)a5;
- (BOOL)executeCommand:(id)a3 error:(id *)a4;
- (BOOL)executeCommand:(id)a3 error:(id *)a4 returningRow:(id *)a5;
- (BOOL)openWithError:(id *)a3;
- (BOOL)prepareWithError:(id *)a3;
- (BOOL)rollbackTransactionWithError:(id *)a3;
- (CCDatabaseConnection)init;
- (CCDatabaseConnection)initWithDatabase:(id)a3 accessAssertion:(id)a4;
- (id)enumeratorForRowResultsOfSelect:(id)a3 error:(id *)a4;
- (int)rowsModified:(id *)a3;
- (void)dealloc;
@end

@implementation CCDatabaseConnection

- (BOOL)enumerateRowResultsOfSelect:(id)a3 error:(id *)a4 usingBlock:(id)a5
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v8 = a3;
  v9 = (uint64_t (**)(id, CCDatabaseValueRow *, id *, unsigned char *))a5;
  unsigned __int8 v38 = 0;
  v10 = (void *)MEMORY[0x24C5B1100]();
  id v36 = 0;
  id v37 = 0;
  BOOL v11 = [(CCDatabaseConnection *)self _getRowResultsOfSelect:v8 outRows:&v37 error:&v36];
  id v12 = v37;
  id v13 = v36;
  if (v11)
  {
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id obj = v12;
    uint64_t v14 = [obj countByEnumeratingWithState:&v32 objects:v39 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      id v26 = v12;
      v27 = v10;
      v28 = a4;
      id v29 = v8;
      uint64_t v16 = *(void *)v33;
LABEL_4:
      uint64_t v17 = 0;
      v18 = v13;
      while (1)
      {
        if (*(void *)v33 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void *)(*((void *)&v32 + 1) + 8 * v17);
        v20 = (void *)MEMORY[0x24C5B1100]();
        v21 = [[CCDatabaseValueRow alloc] initWithDatabaseValueArray:v19];
        id v31 = v18;
        int v22 = v9[2](v9, v21, &v31, &v38);
        id v13 = v31;

        int v23 = v38;
        if (!v22 || v23 != 0) {
          break;
        }
        ++v17;
        v18 = v13;
        if (v15 == v17)
        {
          uint64_t v15 = [obj countByEnumeratingWithState:&v32 objects:v39 count:16];
          if (v15) {
            goto LABEL_4;
          }
          LOBYTE(v22) = 1;
          break;
        }
      }
      a4 = v28;
      id v8 = v29;
      id v12 = v26;
      v10 = v27;
    }
    else
    {
      LOBYTE(v22) = 1;
    }
  }
  else
  {
    LOBYTE(v22) = 0;
  }

  CCSetError(a4, v13);

  return v22;
}

- (BOOL)_getRowResultsOfSelect:(id)a3 outRows:(id *)a4 error:(id *)a5
{
  v27[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9 = [(CCDatabase *)self->_db executeCommand:v8 options:0];
    v10 = [v9 error];
    if (!v10)
    {
      *a4 = [v9 rowValueTuples];
      BOOL v13 = 1;
      goto LABEL_8;
    }
    CCSetError(a5, v10);
    BOOL v11 = __biome_log_for_category();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = [v8 commandString];
      uint64_t v16 = [v8 parameters];
      uint64_t v17 = [(CCDatabase *)self->_db path];
      int v18 = 138413058;
      uint64_t v19 = v15;
      __int16 v20 = 2112;
      v21 = v16;
      __int16 v22 = 2112;
      int v23 = v17;
      __int16 v24 = 2112;
      v25 = v10;
      _os_log_error_impl(&dword_249B92000, v11, OS_LOG_TYPE_ERROR, "Could not execute command=%@ with parameters=%@ in database file at %@, err=%@", (uint8_t *)&v18, 0x2Au);
    }
  }
  else
  {
    id v12 = (void *)MEMORY[0x263F087E8];
    uint64_t v26 = *MEMORY[0x263F07F80];
    v27[0] = @"Could not execute non-select command on read-only database connection";
    v9 = [NSDictionary dictionaryWithObjects:v27 forKeys:&v26 count:1];
    v10 = [v12 errorWithDomain:@"com.apple.CascadeSets.CCDatabase" code:14 userInfo:v9];
    CCSetError(a5, v10);
  }
  BOOL v13 = 0;
LABEL_8:

  return v13;
}

uint64_t __84__CCDatabaseConnection_enumerateRecordResultsOfSelect_recordClass_error_usingBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  v14[1] = *MEMORY[0x263EF8340];
  v7 = [*(id *)(a1 + 40) recordFromDatabaseValueRow:a2];
  if (!v7)
  {
    v9 = (void *)MEMORY[0x263F087E8];
    uint64_t v13 = *MEMORY[0x263F07F80];
    v14[0] = @"Unrecognized database record converted from SQLite value row";
    v10 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
    BOOL v11 = [v9 errorWithDomain:@"com.apple.CascadeSets.CCDatabase" code:15 userInfo:v10];
    CCSetError(a3, v11);

    goto LABEL_5;
  }
  if (((*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))() & 1) == 0)
  {
LABEL_5:
    uint64_t v8 = 0;
    *a4 = 1;
    goto LABEL_6;
  }
  uint64_t v8 = 1;
LABEL_6:

  return v8;
}

- (BOOL)enumerateRecordResultsOfSelect:(id)a3 recordClass:(Class)a4 error:(id *)a5 usingBlock:(id)a6
{
  id v10 = a6;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __84__CCDatabaseConnection_enumerateRecordResultsOfSelect_recordClass_error_usingBlock___block_invoke;
  v13[3] = &unk_26527A440;
  id v14 = v10;
  Class v15 = a4;
  id v11 = v10;
  LOBYTE(a5) = [(CCDatabaseConnection *)self enumerateRowResultsOfSelect:a3 error:a5 usingBlock:v13];

  return (char)a5;
}

- (BOOL)executeCommand:(id)a3 error:(id *)a4
{
  v5 = [(CCDatabase *)self->_db executeCommand:a3 options:2];
  v6 = [v5 error];
  if (v6) {
    CCSetError(a4, v6);
  }

  return v6 == 0;
}

- (id)enumeratorForRowResultsOfSelect:(id)a3 error:(id *)a4
{
  v25[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v10 = (void *)MEMORY[0x263F087E8];
    uint64_t v24 = *MEMORY[0x263F07F80];
    v25[0] = @"Could not execute non-select command on read-only database connection";
    v7 = [NSDictionary dictionaryWithObjects:v25 forKeys:&v24 count:1];
    uint64_t v8 = [v10 errorWithDomain:@"com.apple.CascadeSets.CCDatabase" code:14 userInfo:v7];
    CCSetError(a4, v8);
LABEL_7:
    id v11 = 0;
    goto LABEL_8;
  }
  v7 = [(CCDatabase *)self->_db enumerateCommand:v6 options:0];
  uint64_t v8 = [v7 error];
  if (v8)
  {
    CCSetError(a4, v8);
    v9 = __biome_log_for_category();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = [v6 commandString];
      id v14 = [v6 parameters];
      Class v15 = [(CCDatabase *)self->_db path];
      int v16 = 138413058;
      uint64_t v17 = v13;
      __int16 v18 = 2112;
      uint64_t v19 = v14;
      __int16 v20 = 2112;
      v21 = v15;
      __int16 v22 = 2112;
      int v23 = v8;
      _os_log_error_impl(&dword_249B92000, v9, OS_LOG_TYPE_ERROR, "Could not execute command=%@ with parameters=%@ in database file at %@, err=%@", (uint8_t *)&v16, 0x2Au);
    }
    goto LABEL_7;
  }
  id v11 = [[CCDatabaseValueRowEnumerator alloc] initWithEnumerationResult:v7];
LABEL_8:

  return v11;
}

- (void)dealloc
{
  [(CCDatabaseConnection *)self closeWithError:0];
  v3.receiver = self;
  v3.super_class = (Class)CCDatabaseConnection;
  [(CCDatabaseConnection *)&v3 dealloc];
}

- (BOOL)closeWithError:(id *)a3
{
  return [(CCDatabase *)self->_db closeWithError:a3];
}

- (BOOL)commitTransactionWithError:(id *)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  if (self->_inTransaction)
  {
    v5 = __biome_log_for_category();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[CCDatabaseConnection commitTransactionWithError:]();
    }

    int v6 = [(CCDatabase *)self->_db commitTransactionWithError:a3];
    if (v6)
    {
      self->_inTransaction = 0;
      LOBYTE(v6) = 1;
    }
  }
  else
  {
    v7 = (void *)MEMORY[0x263F087E8];
    uint64_t v11 = *MEMORY[0x263F07F80];
    v12[0] = @"Attempted to commit transaction when none are active";
    uint64_t v8 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
    v9 = [v7 errorWithDomain:@"com.apple.CascadeSets.CCDatabase" code:12 userInfo:v8];
    CCSetError(a3, v9);

    LOBYTE(v6) = 0;
  }
  return v6;
}

- (BOOL)beginTransactionWithError:(id *)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  if (self->_inTransaction)
  {
    v4 = (void *)MEMORY[0x263F087E8];
    uint64_t v11 = *MEMORY[0x263F07F80];
    v12[0] = @"Attempted to begin transaction when one is already active";
    v5 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
    int v6 = [v4 errorWithDomain:@"com.apple.CascadeSets.CCDatabase" code:11 userInfo:v5];
    CCSetError(a3, v6);

    LOBYTE(v7) = 0;
  }
  else
  {
    v9 = __biome_log_for_category();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[CCDatabaseConnection beginTransactionWithError:]();
    }

    int v7 = [(CCDatabase *)self->_db beginTransactionWithError:a3];
    if (v7)
    {
      LOBYTE(v7) = 1;
      self->_inTransaction = 1;
    }
  }
  return v7;
}

- (BOOL)openWithError:(id *)a3
{
  v5 = objc_msgSend(NSString, "stringWithFormat:", @"PRAGMA busy_timeout = %d", 500);
  int v6 = objc_msgSend(NSString, "stringWithFormat:", @"PRAGMA cache_spill = %d", 800);
  if ([(CCDatabase *)self->_db openWithError:a3]
    && [(CCDatabase *)self->_db executeCommandString:v5 error:a3]
    && -[CCDatabase executeCommandString:error:](self->_db, "executeCommandString:error:", @"PRAGMA foreign_keys = ON;",
                       a3))
  {
    char v7 = [(CCDatabase *)self->_db executeCommandString:v6 error:a3];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

+ (id)connectionToDatabaseAtURL:(id)a3 dataProtectionClass:(int)a4 openMode:(int64_t)a5 accessAssertion:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  id v9 = a6;
  id v10 = a3;
  uint64_t v11 = [CCSQLiteDatabase alloc];
  id v12 = [v10 path];

  if ((unint64_t)(a5 - 1) >= 3) {
    int64_t v13 = 0;
  }
  else {
    int64_t v13 = a5;
  }
  id v14 = [(CCSQLiteDatabase *)v11 initWithPath:v12 accessPermission:v13 threadingMode:3 dataProtectionClass:v7 databaseOptions:3];

  Class v15 = (void *)[objc_alloc((Class)objc_opt_class()) initWithDatabase:v14 accessAssertion:v9];

  return v15;
}

- (CCDatabaseConnection)initWithDatabase:(id)a3 accessAssertion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CCDatabaseConnection;
  id v9 = [(CCDatabaseConnection *)&v14 init];
  id v10 = v9;
  if (v9
    && (v9->_inTransaction = 0,
        objc_storeStrong((id *)&v9->_db, a3),
        objc_storeStrong((id *)&v10->_accessAssertion, a4),
        !v10->_db))
  {
    id v12 = __biome_log_for_category();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[CCDatabaseConnection initWithDatabase:accessAssertion:]();
    }

    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v11 = v10;
  }

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessAssertion, 0);

  objc_storeStrong((id *)&self->_db, 0);
}

- (CCDatabaseConnection)init
{
  id v2 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"init unsupported" userInfo:MEMORY[0x263EFFA78]];
  objc_exception_throw(v2);
}

+ (id)readOnlyConnectionToDatabaseAtURL:(id)a3 accessAssertion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [(id)objc_opt_class() connectionToDatabaseAtURL:v6 dataProtectionClass:0 openMode:1 accessAssertion:v5];

  return v7;
}

- (BOOL)prepareWithError:(id *)a3
{
  if ([(CCDatabaseConnection *)self _createTableWithRecordClass:objc_opt_class() error:a3]&& [(CCDatabaseConnection *)self _createTableWithRecordClass:objc_opt_class() error:a3]&& [(CCDatabaseConnection *)self _createTableWithRecordClass:objc_opt_class() error:a3]&& [(CCDatabaseConnection *)self _createTableWithRecordClass:objc_opt_class() error:a3]
    && [(CCDatabaseConnection *)self _createTableWithRecordClass:objc_opt_class() error:a3]&& [(CCDatabaseConnection *)self _createTableWithRecordClass:objc_opt_class() error:a3])
  {
    return 1;
  }
  id v6 = __biome_log_for_category();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[CCDatabaseConnection prepareWithError:]();
  }

  return 0;
}

- (BOOL)_createTableWithRecordClass:(Class)a3 error:(id *)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = [(objc_class *)a3 genSQLCreateStatements];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        if (![(CCDatabase *)self->_db executeCommandString:*(void *)(*((void *)&v13 + 1) + 8 * i) error:a4])
        {
          BOOL v11 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 1;
LABEL_11:

  return v11;
}

- (BOOL)rollbackTransactionWithError:(id *)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  if (self->_inTransaction)
  {
    id v5 = __biome_log_for_category();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[CCDatabaseConnection rollbackTransactionWithError:]();
    }

    int v6 = [(CCDatabase *)self->_db rollbackTransactionWithError:a3];
    if (v6)
    {
      self->_inTransaction = 0;
      LOBYTE(v6) = 1;
    }
  }
  else
  {
    uint64_t v7 = (void *)MEMORY[0x263F087E8];
    uint64_t v11 = *MEMORY[0x263F07F80];
    v12[0] = @"Attempted to rollback transaction when none are active";
    uint64_t v8 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
    uint64_t v9 = [v7 errorWithDomain:@"com.apple.CascadeSets.CCDatabase" code:13 userInfo:v8];
    CCSetError(a3, v9);

    LOBYTE(v6) = 0;
  }
  return v6;
}

- (BOOL)cleanup:(id *)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  if (self->_inTransaction)
  {
    v4 = (void *)MEMORY[0x263F087E8];
    uint64_t v10 = *MEMORY[0x263F07F80];
    v11[0] = @"Attempted to cleanup while transaction is active";
    id v5 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
    int v6 = [v4 errorWithDomain:@"com.apple.CascadeSets.CCDatabase" code:16 userInfo:v5];
    CCSetError(a3, v6);

    return 0;
  }
  else
  {
    uint64_t v9 = __biome_log_for_category();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[CCDatabaseConnection cleanup:]();
    }

    return [(CCDatabase *)self->_db cleanup:a3];
  }
}

- (BOOL)executeCommand:(id)a3 error:(id *)a4 returningRow:(id *)a5
{
  uint64_t v7 = [(CCDatabase *)self->_db executeCommand:a3 options:2];
  uint64_t v8 = [v7 error];
  if (v8)
  {
    CCSetError(a4, v8);
  }
  else
  {
    uint64_t v9 = [CCDatabaseValueRow alloc];
    uint64_t v10 = [v7 rowValueTuples];
    uint64_t v11 = [v10 firstObject];
    id v12 = [(CCDatabaseValueRow *)v9 initWithDatabaseValueArray:v11];

    if (a5) {
      *a5 = v12;
    }
  }
  return v8 == 0;
}

- (int)rowsModified:(id *)a3
{
  return [(CCDatabase *)self->_db rowsModified:a3];
}

- (void)initWithDatabase:accessAssertion:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  _os_log_error_impl(&dword_249B92000, v0, OS_LOG_TYPE_ERROR, "Cannot create connection with nil database.", v1, 2u);
}

- (void)prepareWithError:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  _os_log_error_impl(&dword_249B92000, v0, OS_LOG_TYPE_ERROR, "Failed to create table on prepare operation.", v1, 2u);
}

- (void)beginTransactionWithError:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_249B92000, v0, v1, "Beginning transaction", v2, v3, v4, v5, v6);
}

- (void)commitTransactionWithError:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_249B92000, v0, v1, "Committing transaction.", v2, v3, v4, v5, v6);
}

- (void)rollbackTransactionWithError:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_249B92000, v0, v1, "Rolling back transaction.", v2, v3, v4, v5, v6);
}

- (void)cleanup:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_249B92000, v0, v1, "Cleaning database.", v2, v3, v4, v5, v6);
}

@end