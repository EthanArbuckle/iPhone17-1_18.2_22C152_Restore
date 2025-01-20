@interface CXDatabase
- (BOOL)beginTransactionWithError:(id *)a3;
- (BOOL)closeWithError:(id *)a3;
- (BOOL)commitTransactionWithError:(id *)a3;
- (BOOL)enableForeignKeysWithError:(id *)a3;
- (BOOL)executeSQL:(id)a3 error:(id *)a4;
- (BOOL)executeSQL:(id)a3 withBindings:(id)a4 error:(id *)a5;
- (BOOL)executeSQL:(id)a3 withBindings:(id)a4 transient:(BOOL)a5 error:(id *)a6;
- (BOOL)executeSQL:(id)a3 withStatementPreparationBlock:(id)a4 error:(id *)a5;
- (BOOL)executeSQL:(id)a3 withStatementPreparationBlock:(id)a4 transient:(BOOL)a5 error:(id *)a6;
- (BOOL)performTransactionWithBlock:(id)a3 error:(id *)a4;
- (BOOL)rollbackTransactionWithError:(id *)a3;
- (BOOL)selectSQL:(id)a3 withBindings:(id)a4 expectedColumnCount:(int64_t)a5 resultRowHandler:(id)a6 error:(id *)a7;
- (BOOL)selectSQL:(id)a3 withBindings:(id)a4 expectedColumnCount:(int64_t)a5 transient:(BOOL)a6 resultRowHandler:(id)a7 error:(id *)a8;
- (BOOL)setBusyTimeout:(double)a3 error:(id *)a4;
- (BOOL)vacuumWithError:(id *)a3;
- (CXDatabase)init;
- (CXDatabase)initWithURL:(id)a3 readOnly:(BOOL)a4 error:(id *)a5;
- (NSMutableDictionary)sqlQueryToStatements;
- (NSURL)url;
- (id)_statementForSQL:(id)a3 transient:(BOOL)a4 error:(id *)a5;
- (id)description;
- (id)namesOfColumnsInTableWithName:(id)a3 error:(id *)a4;
- (int)countOfRecordsModifiedByLastQuery;
- (int64_t)lastInsertedRowID;
- (sqlite3)database;
- (void)dealloc;
- (void)setDatabase:(sqlite3 *)a3;
- (void)setSqlQueryToStatements:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation CXDatabase

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sqlQueryToStatements, 0);

  objc_storeStrong((id *)&self->_url, 0);
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A6E3A000, a2, OS_LOG_TYPE_ERROR, "Error closing database: %@", (uint8_t *)&v2, 0xCu);
}

- (BOOL)setBusyTimeout:(double)a3 error:(id *)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (int)(a3 * 1000.0);
  uint64_t busy = sqlite3_busy_timeout([(CXDatabase *)self database], v6);
  int v8 = busy;
  if (a4 && busy)
  {
    v9 = [NSString stringWithFormat:@"sqlite3_busy_timeout for %@ with ms=%d returned %d", self, v6, busy];
    v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = *MEMORY[0x1E4F28568];
    v14[0] = v9;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    *a4 = [v10 errorWithDomain:@"com.apple.callkit.database.sqlite" code:v8 userInfo:v11];
  }
  return v8 == 0;
}

- (CXDatabase)initWithURL:(id)a3 readOnly:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  v25[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CXDatabase;
  v10 = [(CXDatabase *)&v23 init];
  if (v10)
  {
    id v11 = [v9 path];
    v12 = (const char *)[v11 UTF8String];

    if (v6) {
      int v13 = 131073;
    }
    else {
      int v13 = 131074;
    }
    uint64_t v14 = sqlite3_open_v2(v12, &v10->_database, v13, 0);
    if (v14)
    {
      if (a5)
      {
        int v15 = v14;
        v16 = objc_msgSend(NSString, "stringWithFormat:", @"sqlite3_open_v2 for filename %s readOnly %d returned %d", v12, v6, v14);
        v17 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v18 = v15;
        uint64_t v24 = *MEMORY[0x1E4F28568];
        v25[0] = v16;
        v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
        *a5 = [v17 errorWithDomain:@"com.apple.callkit.database.sqlite" code:v18 userInfo:v19];
      }
      sqlQueryToStatements = v10;
      v10 = 0;
    }
    else
    {
      objc_storeStrong((id *)&v10->_url, a3);
      uint64_t v21 = [MEMORY[0x1E4F1CA60] dictionary];
      sqlQueryToStatements = v10->_sqlQueryToStatements;
      v10->_sqlQueryToStatements = (NSMutableDictionary *)v21;
    }
  }
  return v10;
}

- (BOOL)executeSQL:(id)a3 withBindings:(id)a4 transient:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v10 = a4;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __54__CXDatabase_executeSQL_withBindings_transient_error___block_invoke;
  v15[3] = &unk_1E5CAE488;
  id v16 = v10;
  id v11 = v10;
  id v12 = a3;
  int v13 = (void *)MEMORY[0x1AD0C5BA0](v15);
  LOBYTE(a6) = [(CXDatabase *)self executeSQL:v12 withStatementPreparationBlock:v13 transient:v7 error:a6];

  return (char)a6;
}

- (BOOL)executeSQL:(id)a3 withBindings:(id)a4 error:(id *)a5
{
  return [(CXDatabase *)self executeSQL:a3 withBindings:a4 transient:0 error:a5];
}

- (BOOL)executeSQL:(id)a3 error:(id *)a4
{
  return [(CXDatabase *)self executeSQL:a3 withBindings:MEMORY[0x1E4F1CBF0] error:a4];
}

- (BOOL)enableForeignKeysWithError:(id *)a3
{
  return [(CXDatabase *)self executeSQL:@"PRAGMA foreign_keys = ON" error:a3];
}

- (BOOL)closeWithError:(id *)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (![(CXDatabase *)self database]) {
    return 0;
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v5 = [(CXDatabase *)self sqlQueryToStatements];
  BOOL v6 = [v5 allValues];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v19 + 1) + 8 * i) finalize];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v8);
  }

  id v11 = [(CXDatabase *)self sqlQueryToStatements];
  [v11 removeAllObjects];

  uint64_t v12 = sqlite3_close([(CXDatabase *)self database]);
  int v13 = v12;
  if (a3 && v12)
  {
    uint64_t v14 = [NSString stringWithFormat:@"sqlite3_close for %@ returned %d", self, v12];
    int v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v23 = *MEMORY[0x1E4F28568];
    uint64_t v24 = v14;
    id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    *a3 = [v15 errorWithDomain:@"com.apple.callkit.database.sqlite" code:v13 userInfo:v16];
  }
  BOOL v17 = v13 == 0;
  [(CXDatabase *)self setDatabase:0];
  return v17;
}

- (sqlite3)database
{
  return self->_database;
}

- (id)_statementForSQL:(id)a3 transient:(BOOL)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v9 = [(CXDatabase *)self sqlQueryToStatements];
  id v10 = [v9 objectForKeyedSubscript:v8];

  if (!v10)
  {
    id v10 = [[CXDatabaseStatement alloc] initWithSQL:v8 database:self error:a5];
    if (!a4)
    {
      id v11 = [(CXDatabase *)self sqlQueryToStatements];
      [v11 setObject:v10 forKeyedSubscript:v8];
    }
  }

  return v10;
}

- (NSMutableDictionary)sqlQueryToStatements
{
  return self->_sqlQueryToStatements;
}

- (BOOL)executeSQL:(id)a3 withStatementPreparationBlock:(id)a4 transient:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v10 = (unsigned int (**)(id, void *, id *))a4;
  id v11 = [(CXDatabase *)self _statementForSQL:a3 transient:v7 error:a6];
  if (v11 && v10[2](v10, v11, a6)) {
    char v12 = [v11 executeWithError:a6];
  }
  else {
    char v12 = 0;
  }

  return v12;
}

uint64_t __54__CXDatabase_executeSQL_withBindings_transient_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 bind:*(void *)(a1 + 32) error:a3];
}

- (BOOL)selectSQL:(id)a3 withBindings:(id)a4 expectedColumnCount:(int64_t)a5 transient:(BOOL)a6 resultRowHandler:(id)a7 error:(id *)a8
{
  BOOL v10 = a6;
  id v14 = a4;
  id v15 = a7;
  id v16 = [(CXDatabase *)self _statementForSQL:a3 transient:v10 error:a8];
  BOOL v17 = v16;
  if (v16)
  {
    if ([v16 bind:v14 error:a8])
    {
      char v18 = [v17 executeWithExpectedColumnCount:a5 resultRowHandler:v15 error:a8];
      if (!v10) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }
    char v18 = 0;
    if (v10) {
LABEL_7:
    }
      [v17 finalize];
  }
  else
  {
    char v18 = 0;
  }
LABEL_8:

  return v18;
}

- (void)setDatabase:(sqlite3 *)a3
{
  self->_database = a3;
}

- (CXDatabase)init
{
  return 0;
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(CXDatabase *)self url];
  BOOL v6 = [v3 stringWithFormat:@"<%@ %p URL=%@>", v4, self, v5];

  return v6;
}

- (BOOL)vacuumWithError:(id *)a3
{
  return [(CXDatabase *)self executeSQL:@"VACUUM" error:a3];
}

- (int64_t)lastInsertedRowID
{
  int v2 = [(CXDatabase *)self database];

  return sqlite3_last_insert_rowid(v2);
}

- (int)countOfRecordsModifiedByLastQuery
{
  int v2 = [(CXDatabase *)self database];

  return sqlite3_changes(v2);
}

- (BOOL)beginTransactionWithError:(id *)a3
{
  return [(CXDatabase *)self executeSQL:@"BEGIN TRANSACTION" error:a3];
}

- (BOOL)commitTransactionWithError:(id *)a3
{
  return [(CXDatabase *)self executeSQL:@"COMMIT TRANSACTION" error:a3];
}

- (BOOL)rollbackTransactionWithError:(id *)a3
{
  return [(CXDatabase *)self executeSQL:@"ROLLBACK TRANSACTION" error:a3];
}

- (BOOL)executeSQL:(id)a3 withStatementPreparationBlock:(id)a4 error:(id *)a5
{
  return [(CXDatabase *)self executeSQL:a3 withStatementPreparationBlock:a4 transient:0 error:a5];
}

- (BOOL)selectSQL:(id)a3 withBindings:(id)a4 expectedColumnCount:(int64_t)a5 resultRowHandler:(id)a6 error:(id *)a7
{
  return [(CXDatabase *)self selectSQL:a3 withBindings:a4 expectedColumnCount:a5 transient:0 resultRowHandler:a6 error:a7];
}

- (id)namesOfColumnsInTableWithName:(id)a3 error:(id *)a4
{
  BOOL v6 = (void *)MEMORY[0x1E4F1CA48];
  id v7 = a3;
  id v8 = [v6 array];
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  id v16 = __50__CXDatabase_namesOfColumnsInTableWithName_error___block_invoke;
  BOOL v17 = &unk_1E5CAE170;
  id v9 = v8;
  id v18 = v9;
  BOOL v10 = (void *)MEMORY[0x1AD0C5BA0](&v14);
  id v11 = [NSString stringWithFormat:@"PRAGMA table_info(%@)", v7, v14, v15, v16, v17];

  if (![(CXDatabase *)self selectSQL:v11 withBindings:MEMORY[0x1E4F1CBF0] expectedColumnCount:6 resultRowHandler:v10 error:a4])
  {

    id v9 = 0;
  }
  char v12 = (void *)[v9 copy];

  return v12;
}

void __50__CXDatabase_namesOfColumnsInTableWithName_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 objectAtIndexedSubscript:1];
  [*(id *)(a1 + 32) addObject:v3];
}

- (BOOL)performTransactionWithBlock:(id)a3 error:(id *)a4
{
  BOOL v6 = (uint64_t (**)(id, void *, id *))a3;
  if ([(CXDatabase *)self beginTransactionWithError:a4])
  {
    uint64_t v11 = 0;
    char v12 = &v11;
    uint64_t v13 = 0x2020000000;
    char v14 = 0;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __48__CXDatabase_performTransactionWithBlock_error___block_invoke;
    v10[3] = &unk_1E5CAE4B0;
    v10[4] = self;
    v10[5] = &v11;
    id v7 = (void *)MEMORY[0x1AD0C5BA0](v10);
    char v8 = v6[2](v6, v7, a4);
    if (!*((unsigned char *)v12 + 24)) {
      char v8 = [(CXDatabase *)self commitTransactionWithError:a4];
    }

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

uint64_t __48__CXDatabase_performTransactionWithBlock_error___block_invoke(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  return [*(id *)(a1 + 32) rollbackTransactionWithError:a2];
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (void)setSqlQueryToStatements:(id)a3
{
}

@end