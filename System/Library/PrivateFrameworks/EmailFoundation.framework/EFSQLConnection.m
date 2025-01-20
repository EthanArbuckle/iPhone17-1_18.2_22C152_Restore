@interface EFSQLConnection
+ (BOOL)isSuccessResultCode:(int)a3 forStep:(BOOL)a4 error:(id *)a5;
+ (BOOL)setFileProtection:(id)a3 forDatabaseAtURL:(id)a4 error:(id *)a5;
+ (OS_os_log)log;
- (BOOL)_isSuccessResultCode:(int)a3 sqlDB:(sqlite3 *)a4 error:(id *)a5;
- (BOOL)beginTransaction:(int64_t)a3 error:(id *)a4;
- (BOOL)commitTransactionWithError:(id *)a3;
- (BOOL)executeStatementString:(id)a3 error:(id *)a4;
- (BOOL)finalizeStatementsWithError:(id *)a3;
- (BOOL)isOpen;
- (BOOL)openWithError:(id *)a3;
- (BOOL)openWithFlags:(int)a3 error:(id *)a4;
- (BOOL)rollbackTransactionWithError:(id *)a3;
- (EFSQLConnection)init;
- (EFSQLConnection)initWithInMemoryDatabase;
- (EFSQLConnection)initWithSQLDB:(sqlite3 *)a3;
- (EFSQLConnection)initWithURL:(id)a3;
- (NSString)description;
- (NSURL)url;
- (id)preparedStatementForQueryString:(id)a3 transactionLabel:(id)a4 queryLogger:(id)a5;
- (id)test_resultsForQueryString:(id)a3;
- (sqlite3)sqlDB;
- (void)close;
- (void)flush;
@end

@implementation EFSQLConnection

+ (BOOL)isSuccessResultCode:(int)a3 forStep:(BOOL)a4 error:(id *)a5
{
  if ((a3 - 100) < 2)
  {
    BOOL result = a4;
    if (!a5) {
      return result;
    }
    if (!a4) {
      goto LABEL_10;
    }
    goto LABEL_7;
  }
  if (!a3)
  {
    if (!a5) {
      return 1;
    }
LABEL_7:
    *a5 = 0;
    return 1;
  }
  if (a5)
  {
LABEL_10:
    objc_msgSend(MEMORY[0x1E4F28C58], "ef_SQLiteErrorWithCode:");
    id v7 = objc_claimAutoreleasedReturnValue();
    *a5 = v7;
  }
  return 0;
}

- (BOOL)commitTransactionWithError:(id *)a3
{
  return [(EFSQLConnection *)self executeStatementString:@"COMMIT" error:a3];
}

- (BOOL)beginTransaction:(int64_t)a3 error:(id *)a4
{
  if ((unint64_t)a3 > 2) {
    v4 = 0;
  }
  else {
    v4 = off_1E6123180[a3];
  }
  return [(EFSQLConnection *)self executeStatementString:v4 error:a4];
}

- (BOOL)openWithFlags:(int)a3 error:(id *)a4
{
  if (self->_sqlDB)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"EFSQLConnection.m", 263, @"%s called when already open", "-[EFSQLConnection openWithFlags:error:]");
  }
  id v7 = [(EFSQLConnection *)self url];
  id v8 = [v7 absoluteString];
  v9 = (const char *)[v8 fileSystemRepresentation];

  ppDb = 0;
  uint64_t v10 = sqlite3_open_v2(v9, &ppDb, a3, 0);
  BOOL v11 = [(EFSQLConnection *)self _isSuccessResultCode:v10 sqlDB:ppDb error:a4];
  if (v11)
  {
    self->_sqlDB = ppDb;
  }
  else if (ppDb)
  {
    sqlite3_close(ppDb);
  }
  return v11;
}

- (NSURL)url
{
  return self->_url;
}

- (void)close
{
  v3 = [(EFSQLConnection *)self sqlDB];
  if (v3)
  {
    sqlite3_close(v3);
    self->_sqlDB = 0;
  }
}

- (NSString)description
{
  id v3 = [NSString alloc];
  v7.receiver = self;
  v7.super_class = (Class)EFSQLConnection;
  v4 = [(EFSQLConnection *)&v7 description];
  v5 = (void *)[v3 initWithFormat:@"%@ sqlite handle: %p", v4, -[EFSQLConnection sqlDB](self, "sqlDB")];

  return (NSString *)v5;
}

- (BOOL)finalizeStatementsWithError:(id *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v5 = [(EFSQLConnection *)self sqlDB];
  if (!v5)
  {
LABEL_15:
    LOBYTE(v12) = 1;
    return v12;
  }
  v6 = v5;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  objc_super v7 = self->_preparedStatements;
  uint64_t v8 = [(NSHashTable *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v7);
        }
        if ((objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v10), "finalizeWithError:", a3, (void)v14) & 1) == 0)
        {

          LOBYTE(v12) = 0;
          return v12;
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSHashTable *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  stmt = sqlite3_next_stmt(v6, 0);
  if (!stmt)
  {
LABEL_13:
    if (a3) {
      *a3 = 0;
    }
    goto LABEL_15;
  }
  while (1)
  {
    BOOL v12 = [(EFSQLConnection *)self _isSuccessResultCode:sqlite3_finalize(stmt) sqlDB:v6 error:a3];
    if (!v12) {
      return v12;
    }
    stmt = sqlite3_next_stmt(v6, 0);
    if (!stmt) {
      goto LABEL_13;
    }
  }
}

- (BOOL)executeStatementString:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_super v7 = [(EFSQLConnection *)self sqlDB];
  id v8 = v6;
  LOBYTE(a4) = -[EFSQLConnection _isSuccessResultCode:sqlDB:error:](self, "_isSuccessResultCode:sqlDB:error:", sqlite3_exec(v7, (const char *)[v8 UTF8String], 0, 0, 0), v7, a4);

  return (char)a4;
}

- (id)preparedStatementForQueryString:(id)a3 transactionLabel:(id)a4 queryLogger:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (![v9 length])
  {
    long long v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"EFSQLConnection.m" lineNumber:345 description:@"preparedStatementForQueryString called without a query"];
  }
  if (![(EFSQLConnection *)self isOpen])
  {
    long long v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"EFSQLConnection.m", 346, @"preparedStatementForQueryString called with NULL database and pattern %@", v9 object file lineNumber description];
  }
  BOOL v12 = [[EFSQLPreparedStatement alloc] initWithString:v9 connection:self transactionLabel:v10 queryLogger:v11];
  if (v12) {
    [(NSHashTable *)self->_preparedStatements addObject:v12];
  }

  return v12;
}

- (BOOL)isOpen
{
  return [(EFSQLConnection *)self sqlDB] != 0;
}

- (sqlite3)sqlDB
{
  return self->_sqlDB;
}

- (BOOL)_isSuccessResultCode:(int)a3 sqlDB:(sqlite3 *)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a3;
  if (a4 && a3 && a5) {
    uint64_t v6 = sqlite3_extended_errcode(a4);
  }
  objc_super v7 = objc_opt_class();
  return [v7 isSuccessResultCode:v6 forStep:0 error:a5];
}

- (BOOL)openWithError:(id *)a3
{
  return [(EFSQLConnection *)self openWithFlags:6 error:a3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_preparedStatements, 0);
}

- (EFSQLConnection)initWithURL:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)EFSQLConnection;
  uint64_t v6 = [(EFSQLConnection *)&v11 init];
  objc_super v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_url, a3);
    uint64_t v8 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    preparedStatements = v7->_preparedStatements;
    v7->_preparedStatements = (NSHashTable *)v8;
  }
  return v7;
}

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __22__EFSQLConnection_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_6 != -1) {
    dispatch_once(&log_onceToken_6, block);
  }
  v2 = (void *)log_log_6;
  return (OS_os_log *)v2;
}

void __22__EFSQLConnection_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_6;
  log_log_6 = (uint64_t)v1;
}

+ (BOOL)setFileProtection:(id)a3 forDatabaseAtURL:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  objc_super v11 = +[EFSQLConnection log];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    +[EFSQLConnection setFileProtection:forDatabaseAtURL:error:]((uint64_t)v10, (uint64_t)v9, v11);
  }

  uint64_t v12 = 1048582;
  if (([v9 isEqualToString:*MEMORY[0x1E4F1C570]] & 1) == 0)
  {
    if ([v9 isEqualToString:*MEMORY[0x1E4F1C578]])
    {
      uint64_t v12 = 2097158;
    }
    else if ([v9 isEqualToString:*MEMORY[0x1E4F1C580]])
    {
      uint64_t v12 = 3145734;
    }
    else if ([v9 isEqualToString:*MEMORY[0x1E4F1C598]])
    {
      uint64_t v12 = 4194310;
    }
    else
    {
      v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:a2 object:a1 file:@"EFSQLConnection.m" lineNumber:212 description:@"Unknown protection class"];

      uint64_t v12 = 6;
    }
  }
  long long v14 = (void *)[objc_alloc((Class)a1) initWithURL:v10];
  if ([v14 openWithFlags:v12 error:a5])
  {
    char v15 = [v14 executeStatementString:@"SELECT 1 FROM sqlite_master" error:a5];
    [v14 close];
  }
  else
  {
    char v15 = 0;
  }

  return v15;
}

- (EFSQLConnection)init
{
}

- (EFSQLConnection)initWithInMemoryDatabase
{
  id v3 = [MEMORY[0x1E4F1CB10] URLWithString:@":memory:"];
  v4 = [(EFSQLConnection *)self initWithURL:v3];

  return v4;
}

- (EFSQLConnection)initWithSQLDB:(sqlite3 *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)EFSQLConnection;
  v4 = [(EFSQLConnection *)&v9 init];
  id v5 = v4;
  if (v4)
  {
    v4->_sqlDB = a3;
    uint64_t v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    preparedStatements = v5->_preparedStatements;
    v5->_preparedStatements = (NSHashTable *)v6;
  }
  return v5;
}

- (void)flush
{
}

- (BOOL)rollbackTransactionWithError:(id *)a3
{
  return [(EFSQLConnection *)self executeStatementString:@"ROLLBACK" error:a3];
}

- (id)test_resultsForQueryString:(id)a3
{
  id v3 = [(EFSQLConnection *)self preparedStatementForQueryString:a3 transactionLabel:0 queryLogger:0];
  if (v3)
  {
    v4 = objc_opt_new();
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __46__EFSQLConnection_test_resultsForQueryString___block_invoke;
    v8[3] = &unk_1E6123140;
    id v5 = v4;
    id v9 = v5;
    if ([v3 executeUsingBlock:v8 error:0]) {
      uint64_t v6 = (void *)[v5 copy];
    }
    else {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

void __46__EFSQLConnection_test_resultsForQueryString___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = objc_msgSend(v3, "columnNames", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        id v10 = [v3 objectForKeyedSubscript:v9];
        objc_super v11 = [v10 objectValue];
        [v4 setObject:v11 forKeyedSubscript:v9];
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  uint64_t v12 = *(void **)(a1 + 32);
  v13 = (void *)[v4 copy];
  [v12 addObject:v13];
}

+ (void)setFileProtection:(uint64_t)a1 forDatabaseAtURL:(uint64_t)a2 error:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_1B5A59000, log, OS_LOG_TYPE_DEBUG, "Setting file protection for %{public}@ to %{public}@", (uint8_t *)&v3, 0x16u);
}

@end