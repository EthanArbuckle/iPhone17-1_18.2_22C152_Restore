@interface _BSSqlitePreparedSimpleStatement
- (BOOL)executeWithBindings:(id)a3 resultRowHandler:(id)a4 error:(id *)a5;
- (id)_initWithDatabaseConnection:(void *)a3 statement:;
- (id)_sqliteError:(uint64_t)a1;
- (void)dealloc;
- (void)sqliteDatabaseConnectionWillClose:(id)a3;
@end

@implementation _BSSqlitePreparedSimpleStatement

- (BOOL)executeWithBindings:(id)a3 resultRowHandler:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  int v21 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._dbConnection);
  if (WeakRetained && self->_statement)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __79___BSSqlitePreparedSimpleStatement_executeWithBindings_resultRowHandler_error___block_invoke;
    v14[3] = &unk_1E5445728;
    v17 = &v18;
    v14[4] = self;
    id v15 = v8;
    id v16 = v9;
    -[BSSqliteDatabaseConnection performSyncWithDatabase:]((uint64_t)WeakRetained, (uint64_t)v14);

    int v11 = *((_DWORD *)v19 + 6);
    if (!a5) {
      goto LABEL_8;
    }
  }
  else
  {
    int v11 = 21;
    *((_DWORD *)v19 + 6) = 21;
    if (!a5) {
      goto LABEL_8;
    }
  }
  if (v11)
  {
    -[_BSSqlitePreparedSimpleStatement _sqliteError:]((uint64_t)self, v11);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    int v11 = *((_DWORD *)v19 + 6);
  }
LABEL_8:
  BOOL v12 = v11 == 0;

  _Block_object_dispose(&v18, 8);
  return v12;
}

- (id)_initWithDatabaseConnection:(void *)a3 statement:
{
  id v5 = a2;
  if (a1)
  {
    v6 = -[BSSqlitePreparedStatement _initWithDatabaseConnection:](a1, v5);
    a1 = v6;
    if (v6)
    {
      v6[2] = a3;
      id WeakRetained = objc_loadWeakRetained(v6 + 1);
      -[BSSqliteDatabaseConnection addObserver:]((uint64_t)WeakRetained, (uint64_t)a1);
    }
  }

  return a1;
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._dbConnection);
  statement = self->_statement;
  if (statement)
  {
    if (WeakRetained)
    {
      self->_statement = 0;
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __43___BSSqlitePreparedSimpleStatement_dealloc__block_invoke;
      v6[3] = &__block_descriptor_40_e18_v16__0__sqlite3__8l;
      v6[4] = statement;
      -[BSSqliteDatabaseConnection performWithDatabase:]((uint64_t)WeakRetained, (uint64_t)v6);
    }
    else
    {
      sqlite3_finalize(statement);
    }
  }

  v5.receiver = self;
  v5.super_class = (Class)_BSSqlitePreparedSimpleStatement;
  [(BSSqlitePreparedStatement *)&v5 dealloc];
}

- (id)_sqliteError:(uint64_t)a1
{
  if (a1)
  {
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    objc_super v5 = [NSString stringWithUTF8String:sqlite3_errstr(a2)];
    [v4 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F28568]];

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    v7 = -[BSSqliteDatabaseConnection lastErrorMessage]((uint64_t)WeakRetained);

    if (v7) {
      [v4 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F28588]];
    }
    id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.baseboard.bssqlite" code:a2 userInfo:v4];
  }
  else
  {
    id v8 = 0;
  }
  return v8;
}

- (void)sqliteDatabaseConnectionWillClose:(id)a3
{
  statement = self->_statement;
  if (statement)
  {
    sqlite3_finalize(statement);
    self->_statement = 0;
  }
  objc_storeWeak((id *)&self->super._dbConnection, 0);
}

@end