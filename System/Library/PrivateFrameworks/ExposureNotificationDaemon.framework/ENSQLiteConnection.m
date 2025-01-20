@interface ENSQLiteConnection
- (BOOL)_executeSQL:(id)a3 cacheStatement:(BOOL)a4 error:(id *)a5 bindingHandler:(id)a6 enumerationHandler:(id)a7;
- (BOOL)_prepareStatementForSQL:(id)a3 cache:(BOOL)a4 error:(id *)a5 statementHandler:(id)a6;
- (BOOL)_stepStatement:(sqlite3_stmt *)a3 hasRow:(BOOL *)a4 error:(id *)a5;
- (BOOL)executeSQL:(id)a3 error:(id *)a4;
- (BOOL)executeSQL:(id)a3 error:(id *)a4 bindingHandler:(id)a5 enumerationHandler:(id)a6;
- (BOOL)executeUncachedSQL:(id)a3 error:(id *)a4;
- (BOOL)executeUncachedSQLStatements:(id)a3 error:(id *)a4;
- (BOOL)getIntegerValue:(int64_t *)a3 forPragma:(id)a4 error:(id *)a5;
- (BOOL)getUserVersion:(int64_t *)a3 error:(id *)a4;
- (BOOL)isOpen;
- (BOOL)performTransactionWithType:(int64_t)a3 error:(id *)a4 usingBlock:(id)a5;
- (BOOL)setIntegerValue:(int64_t)a3 forPragma:(id)a4 error:(id *)a5;
- (BOOL)setUserVersion:(int64_t)a3 error:(id *)a4;
- (BOOL)truncateWithError:(id *)a3;
- (ENSQLiteConnection)init;
- (ENSQLiteConnection)initWithDatabaseURL:(id)a3;
- (NSURL)fileURL;
- (id)_initWithDatabaseURL:(id)a3;
- (id)_lastErrorWithResultCode:(int)a3;
- (int)additionalOpenFlags;
- (int)openWithError:(id *)a3;
- (int64_t)lastInsertedRowID;
- (void)close;
- (void)dealloc;
- (void)setAdditionalOpenFlags:(int)a3;
@end

@implementation ENSQLiteConnection

- (ENSQLiteConnection)init
{
  return (ENSQLiteConnection *)[(ENSQLiteConnection *)self _initWithDatabaseURL:0];
}

- (ENSQLiteConnection)initWithDatabaseURL:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v8 = [MEMORY[0x1E4F28B08] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"ENSQLiteConnection.m", 55, @"Invalid parameter not satisfying: %@", @"fileURL != nil" object file lineNumber description];
  }
  if (([v5 isFileURL] & 1) == 0)
  {
    v9 = [MEMORY[0x1E4F28B08] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"ENSQLiteConnection.m", 56, @"Invalid parameter not satisfying: %@", @"fileURL.isFileURL" object file lineNumber description];
  }
  v6 = [(ENSQLiteConnection *)self _initWithDatabaseURL:v5];

  return v6;
}

- (id)_initWithDatabaseURL:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ENSQLiteConnection;
  id v5 = [(ENSQLiteConnection *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    fileURL = v5->_fileURL;
    v5->_fileURL = (NSURL *)v6;

    v5->_statementCache = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D528], &kSQLite3StatementDictionaryValueCallbacks);
  }

  return v5;
}

- (void)dealloc
{
  [(ENSQLiteConnection *)self close];
  v3.receiver = self;
  v3.super_class = (Class)ENSQLiteConnection;
  [(ENSQLiteConnection *)&v3 dealloc];
}

- (BOOL)isOpen
{
  return self->_db != 0;
}

- (int)openWithError:(id *)a3
{
  p_db = &self->_db;
  if (self->_db)
  {
    LODWORD(v4) = 0;
  }
  else
  {
    fileURL = self->_fileURL;
    if (fileURL) {
      v8 = [(NSURL *)fileURL fileSystemRepresentation];
    }
    else {
      v8 = ":memory:";
    }
    uint64_t v9 = sqlite3_open_v2(v8, p_db, self->_additionalOpenFlags | 6, 0);
    if (v9)
    {
      uint64_t v4 = v9;
    }
    else
    {
      uint64_t v10 = sqlite3_exec(*p_db, "PRAGMA auto_vacuum = 2;", 0, 0, 0);
      if (v10)
      {
        uint64_t v4 = v10;
      }
      else
      {
        uint64_t v11 = sqlite3_exec(*p_db, "PRAGMA cache_size = 512;", 0, 0, 0);
        if (v11)
        {
          uint64_t v4 = v11;
        }
        else
        {
          uint64_t v12 = sqlite3_exec(*p_db, "PRAGMA journal_mode = WAL;", 0, 0, 0);
          if (v12)
          {
            uint64_t v4 = v12;
          }
          else
          {
            uint64_t v4 = sqlite3_exec(*p_db, "PRAGMA foreign_keys = ON;", 0, 0, 0);
            if (!v4) {
              return v4;
            }
          }
        }
      }
    }
    if (gLogCategory__ENSQLiteConnection <= 90
      && (gLogCategory__ENSQLiteConnection != -1 || _LogCategory_Initialize()))
    {
      v13 = *p_db;
      v14 = (void *)MEMORY[0x1E4F29020];
      v15 = sqlite3_errmsg(v13);
      v16 = "<unavailable>";
      if (v15) {
        v16 = v15;
      }
      v18 = [v14 stringWithFormat:@"[%d, %s]", v4, v16];
      LogPrintF_safe();
    }
    if (a3)
    {
      *a3 = [(ENSQLiteConnection *)self _lastErrorWithResultCode:v4];
    }
  }
  return v4;
}

- (void)close
{
  statementCache = self->_statementCache;
  if (statementCache)
  {
    CFRelease(statementCache);
    self->_statementCache = 0;
  }
  db = self->_db;
  if (db)
  {
    sqlite3_close(db);
    self->_db = 0;
  }
}

- (int64_t)lastInsertedRowID
{
  db = self->_db;
  if (!db)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B08] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"ENSQLiteConnection.m" lineNumber:145 description:@"Database must be open"];

    db = self->_db;
  }

  return sqlite3_last_insert_rowid(db);
}

- (BOOL)performTransactionWithType:(int64_t)a3 error:(id *)a4 usingBlock:(id)a5
{
  uint64_t v9 = (uint64_t (**)(id, ENSQLiteConnection *, id *))a5;
  if (!self->_db)
  {
    v18 = [MEMORY[0x1E4F28B08] currentHandler];
    [v18 handleFailureInMethod:a2 object:self file:@"ENSQLiteConnection.m" lineNumber:153 description:@"Database must be open"];
  }
  if (self->_isInTransaction)
  {
    v19 = [MEMORY[0x1E4F28B08] currentHandler];
    [v19 handleFailureInMethod:a2 object:self file:@"ENSQLiteConnection.m" lineNumber:154 description:@"Re-entrant transactions not supported"];
  }
  if ((unint64_t)a3 > 2) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = off_1E69AE540[a3];
  }
  BOOL v11 = [(ENSQLiteConnection *)self executeUncachedSQL:v10 error:a4];
  self->_isInTransaction = v11;
  if (!v11) {
    goto LABEL_24;
  }
  uint64_t v12 = (void *)MEMORY[0x1D9439DC0]();
  id v24 = 0;
  char v13 = v9[2](v9, self, &v24);
  id v14 = v24;
  if (a4) {
    char v15 = v13;
  }
  else {
    char v15 = 1;
  }
  if ((v15 & 1) == 0)
  {
    if (v14)
    {
      *a4 = v14;
    }
    else
    {
      ENErrorF();
      id v16 = objc_claimAutoreleasedReturnValue();
      *a4 = v16;
    }
  }

  self->_isInTransaction = 0;
  if ((v13 & 1) == 0)
  {
    id v23 = 0;
    BOOL v20 = [(ENSQLiteConnection *)self executeUncachedSQL:@"ROLLBACK" error:&v23];
    id v21 = v23;
    if (v20
      && gLogCategory__ENSQLiteConnection <= 90
      && (gLogCategory__ENSQLiteConnection != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }

LABEL_24:
    BOOL v17 = 0;
    goto LABEL_25;
  }
  BOOL v17 = [(ENSQLiteConnection *)self executeUncachedSQL:@"COMMIT" error:a4];
LABEL_25:

  return v17;
}

- (BOOL)executeSQL:(id)a3 error:(id *)a4
{
  return [(ENSQLiteConnection *)self _executeSQL:a3 cacheStatement:0 error:a4 bindingHandler:0 enumerationHandler:0];
}

- (BOOL)executeUncachedSQL:(id)a3 error:(id *)a4
{
  return [(ENSQLiteConnection *)self _executeSQL:a3 cacheStatement:0 error:a4 bindingHandler:0 enumerationHandler:0];
}

- (BOOL)executeUncachedSQLStatements:(id)a3 error:(id *)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = a3;
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
        if (!-[ENSQLiteConnection executeUncachedSQL:error:](self, "executeUncachedSQL:error:", *(void *)(*((void *)&v13 + 1) + 8 * i), a4, (void)v13))
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

- (BOOL)executeSQL:(id)a3 error:(id *)a4 bindingHandler:(id)a5 enumerationHandler:(id)a6
{
  return [(ENSQLiteConnection *)self _executeSQL:a3 cacheStatement:1 error:a4 bindingHandler:a5 enumerationHandler:a6];
}

- (BOOL)_executeSQL:(id)a3 cacheStatement:(BOOL)a4 error:(id *)a5 bindingHandler:(id)a6 enumerationHandler:(id)a7
{
  BOOL v10 = a4;
  id v13 = a3;
  id v14 = a6;
  id v15 = a7;
  if (!self->_db)
  {
    id v21 = [MEMORY[0x1E4F28B08] currentHandler];
    [v21 handleFailureInMethod:a2 object:self file:@"ENSQLiteConnection.m" lineNumber:230 description:@"Database must be open"];
  }
  long long v16 = self;
  objc_sync_enter(v16);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __89__ENSQLiteConnection__executeSQL_cacheStatement_error_bindingHandler_enumerationHandler___block_invoke;
  v22[3] = &unk_1E69AE500;
  id v17 = v14;
  id v23 = v17;
  id v18 = v15;
  id v24 = v18;
  v22[4] = v16;
  BOOL v19 = [(ENSQLiteConnection *)v16 _prepareStatementForSQL:v13 cache:v10 error:a5 statementHandler:v22];

  objc_sync_exit(v16);
  return v19;
}

uint64_t __89__ENSQLiteConnection__executeSQL_cacheStatement_error_bindingHandler_enumerationHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, a2);
  }
  if (!*(void *)(a1 + 48))
  {
    id v15 = *(void **)(a1 + 32);
    return [v15 _stepStatement:a2 hasRow:0 error:a3];
  }
  uint64_t v7 = 0;
  unsigned __int8 v17 = 0;
  while (1)
  {
    uint64_t v8 = [*(id *)(a1 + 32) _stepStatement:a2 hasRow:&v17 error:a3];
    int v9 = v17;
    if (v8) {
      BOOL v10 = v17 == 0;
    }
    else {
      BOOL v10 = 1;
    }
    if (v10) {
      goto LABEL_11;
    }
    BOOL v11 = (void *)MEMORY[0x1D9439DC0]();
    int v12 = (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
    id v13 = v7;

    if (!v12) {
      break;
    }
    int v9 = v17;
    uint64_t v7 = v13;
LABEL_11:
    if (v9) {
      char v14 = v8;
    }
    else {
      char v14 = 0;
    }
    if ((v14 & 1) == 0)
    {
      id v13 = v7;
      if (!v7) {
        goto LABEL_23;
      }
      goto LABEL_21;
    }
  }
  uint64_t v8 = 1;
  if (!v13) {
    goto LABEL_23;
  }
LABEL_21:
  uint64_t v8 = 0;
  if (a3) {
    *a3 = v13;
  }
LABEL_23:

  return v8;
}

- (BOOL)_prepareStatementForSQL:(id)a3 cache:(BOOL)a4 error:(id *)a5 statementHandler:(id)a6
{
  BOOL v8 = a4;
  id v11 = a3;
  int v12 = (uint64_t (**)(id, sqlite3_stmt *, id *))a6;
  Value = (sqlite3_stmt *)CFDictionaryGetValue(self->_statementCache, v11);
  ppStmt = Value;
  if (Value)
  {
    char v14 = Value;
    int v15 = 0;
    goto LABEL_22;
  }
  while (1)
  {
    pzTail = 0;
    db = self->_db;
    id v18 = v11;
    uint64_t v19 = sqlite3_prepare_v2(db, (const char *)[v18 UTF8String], objc_msgSend(v18, "length"), &ppStmt, (const char **)&pzTail);
    if (!v19) {
      break;
    }
    uint64_t v16 = v19;
    if ((v19 - 5) >= 2)
    {
      BOOL v20 = +[ENLoggingPrefs sharedENLoggingPrefs];
      int v21 = [v20 isSensitiveLoggingAllowed];

      if (v21
        && gLogCategory_ENSQLiteConnection <= 90
        && (gLogCategory_ENSQLiteConnection != -1 || _LogCategory_Initialize()))
      {
        v22 = (void *)MEMORY[0x1E4F29020];
        id v23 = sqlite3_errmsg(self->_db);
        id v24 = "<unavailable>";
        if (v23) {
          id v24 = v23;
        }
        v28 = [v22 stringWithFormat:@"[%d, %s]", v16, v24];
        LogPrintF_safe();
      }
      if (a5)
      {
        [(ENSQLiteConnection *)self _lastErrorWithResultCode:v16];
        int v15 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_21;
      }
      goto LABEL_18;
    }
  }
  if (pzTail && *pzTail)
  {
    v25 = [MEMORY[0x1E4F28B08] currentHandler];
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"ENSQLiteConnection.m", 284, @"SQL strings must contain only a single statement; remaining statements will not be executed: %s",
      pzTail);

    if (v8) {
      goto LABEL_8;
    }
  }
  else if (v8)
  {
LABEL_8:
    CFDictionarySetValue(self->_statementCache, v18, ppStmt);
LABEL_18:
    int v15 = 0;
    goto LABEL_21;
  }
  int v15 = 1;
LABEL_21:
  char v14 = ppStmt;
  if (!ppStmt)
  {
    char v26 = 0;
    goto LABEL_25;
  }
LABEL_22:
  char v26 = v12[2](v12, v14, a5);
  if (v15)
  {
    sqlite3_finalize(ppStmt);
  }
  else
  {
    sqlite3_clear_bindings(ppStmt);
    sqlite3_reset(ppStmt);
  }
LABEL_25:

  return v26 & 1;
}

- (BOOL)_stepStatement:(sqlite3_stmt *)a3 hasRow:(BOOL *)a4 error:(id *)a5
{
  if (a4) {
    *a4 = 0;
  }
  if (a3)
  {
    while (1)
    {
      uint64_t v9 = sqlite3_step(a3);
      if (v9 == 101) {
        break;
      }
      if (v9 == 100)
      {
        BOOL result = 1;
        if (a4) {
          *a4 = 1;
        }
        return result;
      }
      uint64_t v10 = v9;
      uint64_t v11 = v9;
      if (v9 - 5 >= 2)
      {
        if (v9 == 19) {
          int v12 = 10;
        }
        else {
          int v12 = 90;
        }
        id v13 = +[ENLoggingPrefs sharedENLoggingPrefs];
        int v14 = [v13 isSensitiveLoggingAllowed];

        if (v14
          && v12 >= gLogCategory_ENSQLiteConnection
          && (gLogCategory_ENSQLiteConnection != -1 || _LogCategory_Initialize()))
        {
          sqlite3_sql(a3);
          int v15 = (void *)MEMORY[0x1E4F29020];
          uint64_t v16 = sqlite3_errmsg(self->_db);
          unsigned __int8 v17 = "<unavailable>";
          if (v16) {
            unsigned __int8 v17 = v16;
          }
          BOOL v20 = [v15 stringWithFormat:@"[%d, %s]", v11, v17];
          LogPrintF_safe();
        }
        if (!a5) {
          return 0;
        }
        id v19 = [(ENSQLiteConnection *)self _lastErrorWithResultCode:v10];
        BOOL result = 0;
        *a5 = v19;
        return result;
      }
    }
  }
  return 1;
}

- (BOOL)setIntegerValue:(int64_t)a3 forPragma:(id)a4 error:(id *)a5
{
  uint64_t v7 = [MEMORY[0x1E4F29020] stringWithFormat:@"PRAGMA %@=%lld", a4, a3];
  LOBYTE(a5) = [(ENSQLiteConnection *)self executeUncachedSQL:v7 error:a5];

  return (char)a5;
}

- (BOOL)getIntegerValue:(int64_t *)a3 forPragma:(id)a4 error:(id *)a5
{
  BOOL v8 = [MEMORY[0x1E4F29020] stringWithFormat:@"PRAGMA %@", a4];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __54__ENSQLiteConnection_getIntegerValue_forPragma_error___block_invoke;
  v10[3] = &__block_descriptor_40_e27_B24__0__sqlite3_stmt__8__16l;
  v10[4] = a3;
  LOBYTE(a5) = [(ENSQLiteConnection *)self _executeSQL:v8 cacheStatement:0 error:a5 bindingHandler:0 enumerationHandler:v10];

  return (char)a5;
}

uint64_t __54__ENSQLiteConnection_getIntegerValue_forPragma_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  **(void **)(a1 + 32) = sqlite3_column_int64(a2, 0);
  return 0;
}

- (BOOL)setUserVersion:(int64_t)a3 error:(id *)a4
{
  return [(ENSQLiteConnection *)self setIntegerValue:a3 forPragma:@"user_version" error:a4];
}

- (BOOL)getUserVersion:(int64_t *)a3 error:(id *)a4
{
  return [(ENSQLiteConnection *)self getIntegerValue:a3 forPragma:@"user_version" error:a4];
}

- (BOOL)truncateWithError:(id *)a3
{
  if (!self->_db)
  {
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F28B08], "currentHandler", a3);
    [v6 handleFailureInMethod:a2 object:self file:@"ENSQLiteConnection.m" lineNumber:382 description:@"Database must be open"];
  }
  return _sqlite3_db_truncate() == 0;
}

- (id)_lastErrorWithResultCode:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (self->_db)
  {
    if (a3) {
      goto LABEL_3;
    }
LABEL_9:
    id v5 = 0;
    goto LABEL_10;
  }
  uint64_t v11 = [MEMORY[0x1E4F28B08] currentHandler];
  [v11 handleFailureInMethod:a2 object:self file:@"ENSQLiteConnection.m" lineNumber:387 description:@"Database must be open"];

  if (!v3) {
    goto LABEL_9;
  }
LABEL_3:
  if (v3 == 23)
  {
    id v5 = ENErrorF();
  }
  else
  {
    [(NSURL *)self->_fileURL fileSystemRepresentation];
    db = self->_db;
    uint64_t v7 = (void *)MEMORY[0x1E4F29020];
    BOOL v8 = sqlite3_errmsg(db);
    uint64_t v9 = "<unavailable>";
    if (v8) {
      uint64_t v9 = v8;
    }
    id v13 = [v7 stringWithFormat:@"[%d, %s]", v3, v9];
    id v5 = ENErrorF();
  }
LABEL_10:

  return v5;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (int)additionalOpenFlags
{
  return self->_additionalOpenFlags;
}

- (void)setAdditionalOpenFlags:(int)a3
{
  self->_additionalOpenFlags = a3;
}

- (void).cxx_destruct
{
}

@end