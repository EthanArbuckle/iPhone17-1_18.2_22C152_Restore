@interface BSSqliteDatabaseConnection
- (BOOL)truncateDatabaseAndReturnError:(id *)a3;
- (BSSqliteDatabaseConnection)init;
- (BSSqliteDatabaseConnection)initWithFileURL:(id)a3 dataProtectionClass:(unint64_t)a4;
- (BSSqliteDatabaseConnection)initWithInMemoryDatabase;
- (id)_initWithSqlitePath:(uint64_t)a3 dataProtectionClass:;
- (id)lastErrorMessage;
- (id)prepareStatement:(id)a3;
- (void)_closeConnection;
- (void)addObserver:(uint64_t)a1;
- (void)close;
- (void)dealloc;
- (void)performSyncWithDatabase:(uint64_t)a1;
- (void)performWithDatabase:(uint64_t)a1;
@end

@implementation BSSqliteDatabaseConnection

uint64_t __54__BSSqliteDatabaseConnection_performSyncWithDatabase___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 16));
}

- (void)performSyncWithDatabase:(uint64_t)a1
{
  if (a1)
  {
    v2 = *(NSObject **)(a1 + 8);
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __54__BSSqliteDatabaseConnection_performSyncWithDatabase___block_invoke;
    v3[3] = &unk_1E5445C90;
    v3[4] = a1;
    v3[5] = a2;
    dispatch_sync(v2, v3);
  }
}

- (id)prepareStatement:(id)a3
{
  if (!a3)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"BSSqliteDatabaseConnection.m", 72, @"Invalid parameter not satisfying: %@", @"query" object file lineNumber description];
  }
  v5 = [(NSCache *)self->_queue_queryCache objectForKey:a3];
  if (!v5)
  {
    v5 = +[BSSqlitePreparedStatement _newPreparedStatementForDatabaseConnection:withSQLQuery:]((uint64_t)BSSqlitePreparedStatement, self, a3);
    if (v5)
    {
      v6 = (void *)[a3 copy];
      [(NSCache *)self->_queue_queryCache setObject:v5 forKey:v6];
    }
  }
  return v5;
}

- (BSSqliteDatabaseConnection)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"BSSqliteDatabaseConnection.m" lineNumber:32 description:@"init is not allowed"];

  return (BSSqliteDatabaseConnection *)-[BSSqliteDatabaseConnection _initWithSqlitePath:dataProtectionClass:](self, 0, 2);
}

- (id)_initWithSqlitePath:(uint64_t)a3 dataProtectionClass:
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (!a2)
    {
      v18 = [MEMORY[0x1E4F28B00] currentHandler];
      [v18 handleFailureInMethod:sel__initWithSqlitePath_dataProtectionClass_, a1, @"BSSqliteDatabaseConnection.m", 46, @"Invalid parameter not satisfying: %@", @"path" object file lineNumber description];
    }
    v19.receiver = a1;
    v19.super_class = (Class)BSSqliteDatabaseConnection;
    id v6 = objc_msgSendSuper2(&v19, sel_init);
    if (v6)
    {
      dispatch_queue_t Serial = BSDispatchQueueCreateSerial(@"com.apple.baseboard.sqlite.database");
      v8 = (void *)*((void *)v6 + 1);
      *((void *)v6 + 1) = Serial;

      self;
      id v9 = a2;
      v10 = (const char *)[v9 UTF8String];
      if ((unint64_t)(a3 - 1) >= 3) {
        int v11 = 1048582;
      }
      else {
        int v11 = 4194310 - ((a3 - 1) << 20);
      }
      int v12 = sqlite3_open_v2(v10, (sqlite3 **)v6 + 2, v11, 0);
      if (v12)
      {
        v13 = BSLogCommon();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          id v21 = v9;
          __int16 v22 = 1024;
          int v23 = v12;
          _os_log_error_impl(&dword_18AAA8000, v13, OS_LOG_TYPE_ERROR, "Failed to open database %{public}@ due to result %d", buf, 0x12u);
        }

        -[BSSqliteDatabaseConnection _closeConnection]((uint64_t)v6);
        goto LABEL_12;
      }
      id v15 = objc_alloc_init(MEMORY[0x1E4F1C998]);
      v16 = (void *)*((void *)v6 + 3);
      *((void *)v6 + 3) = v15;
    }
    id v6 = v6;
    id v14 = v6;
    goto LABEL_15;
  }
  id v6 = 0;
LABEL_12:
  id v14 = 0;
LABEL_15:

  return v14;
}

- (BSSqliteDatabaseConnection)initWithInMemoryDatabase
{
  return (BSSqliteDatabaseConnection *)-[BSSqliteDatabaseConnection _initWithSqlitePath:dataProtectionClass:](self, @":memory:", 2);
}

- (BSSqliteDatabaseConnection)initWithFileURL:(id)a3 dataProtectionClass:(unint64_t)a4
{
  if (([a3 isFileURL] & 1) == 0)
  {
    int v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"BSSqliteDatabaseConnection.m", 41, @"url must be a fileURL : url=%@", a3 object file lineNumber description];
  }
  v8 = [a3 path];
  id v9 = (BSSqliteDatabaseConnection *)-[BSSqliteDatabaseConnection _initWithSqlitePath:dataProtectionClass:](self, v8, a4);

  return v9;
}

- (void)_closeConnection
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = *(sqlite3 **)(a1 + 16);
  if (v2)
  {
    int v3 = sqlite3_close_v2(v2);
    if (v3)
    {
      int v4 = v3;
      v5 = BSLogCommon();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        id v6 = sqlite3_errstr(v4);
        uint64_t v7 = *(void *)(a1 + 16);
        int v8 = 136315906;
        id v9 = "-[BSSqliteDatabaseConnection _closeConnection]";
        __int16 v10 = 1024;
        int v11 = v4;
        __int16 v12 = 2082;
        v13 = v6;
        __int16 v14 = 2048;
        uint64_t v15 = v7;
        _os_log_error_impl(&dword_18AAA8000, v5, OS_LOG_TYPE_ERROR, "%s: got error %d (%{public}s) closing database connection %p", (uint8_t *)&v8, 0x26u);
      }
    }
    *(void *)(a1 + 16) = 0;
  }
}

- (void)dealloc
{
  if (self->_queue_dbConnection)
  {
    int v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"BSSqliteDatabaseConnection.m" lineNumber:65 description:@"database must be closed before dealloc"];
  }
  if (self->_queue_queryCache)
  {
    v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"BSSqliteDatabaseConnection.m" lineNumber:66 description:@"database must be closed before dealloc"];
  }
  v6.receiver = self;
  v6.super_class = (Class)BSSqliteDatabaseConnection;
  [(BSSqliteDatabaseConnection *)&v6 dealloc];
}

- (BOOL)truncateDatabaseAndReturnError:(id *)a3
{
  uint64_t v11 = 0;
  __int16 v12 = &v11;
  uint64_t v13 = 0x3032000000;
  __int16 v14 = __Block_byref_object_copy__2;
  uint64_t v15 = __Block_byref_object_dispose__2;
  id v16 = 0;
  uint64_t v7 = 0;
  int v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 1;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__BSSqliteDatabaseConnection_truncateDatabaseAndReturnError___block_invoke;
  v6[3] = &unk_1E5445C68;
  v6[4] = self;
  v6[5] = &v11;
  v6[6] = &v7;
  -[BSSqliteDatabaseConnection performSyncWithDatabase:]((uint64_t)self, (uint64_t)v6);
  if (a3) {
    *a3 = (id) v12[5];
  }
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v11, 8);

  return v4;
}

void __61__BSSqliteDatabaseConnection_truncateDatabaseAndReturnError___block_invoke(void *a1, sqlite3 *a2)
{
  int v4 = sqlite3_file_control(a2, 0, 101, 0);
  if (v4)
  {
    int v5 = v4;
    uint64_t v6 = a1[4];
    uint64_t v7 = [NSString stringWithUTF8String:sqlite3_errmsg(a2)];
    if (v6)
    {
      int v8 = [MEMORY[0x1E4F1CA60] dictionary];
      uint64_t v9 = [NSString stringWithUTF8String:sqlite3_errstr(v5)];
      [v8 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F28568]];

      if (v7) {
        [v8 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F28588]];
      }
      uint64_t v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.baseboard.bssqlite" code:v5 userInfo:v8];
    }
    else
    {
      uint64_t v10 = 0;
    }
    uint64_t v11 = *(void *)(a1[5] + 8);
    __int16 v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
  }
}

- (void)performWithDatabase:(uint64_t)a1
{
  if (a1)
  {
    v2 = *(NSObject **)(a1 + 8);
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __50__BSSqliteDatabaseConnection_performWithDatabase___block_invoke;
    v3[3] = &unk_1E5445C90;
    v3[4] = a1;
    v3[5] = a2;
    dispatch_async(v2, v3);
  }
}

uint64_t __50__BSSqliteDatabaseConnection_performWithDatabase___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 16));
}

- (id)lastErrorMessage
{
  if (a1)
  {
    uint64_t v4 = 0;
    int v5 = &v4;
    uint64_t v6 = 0x3032000000;
    uint64_t v7 = __Block_byref_object_copy__2;
    int v8 = __Block_byref_object_dispose__2;
    id v9 = 0;
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __46__BSSqliteDatabaseConnection_lastErrorMessage__block_invoke;
    v3[3] = &unk_1E5445CB8;
    v3[4] = &v4;
    -[BSSqliteDatabaseConnection performSyncWithDatabase:](a1, (uint64_t)v3);
    id v1 = (id)v5[5];
    _Block_object_dispose(&v4, 8);
  }
  else
  {
    id v1 = 0;
  }
  return v1;
}

void __46__BSSqliteDatabaseConnection_lastErrorMessage__block_invoke(uint64_t a1, sqlite3 *a2)
{
  uint64_t v3 = [NSString stringWithUTF8String:sqlite3_errmsg(a2)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  int v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)close
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__BSSqliteDatabaseConnection_close__block_invoke;
  block[3] = &unk_1E54457C8;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __35__BSSqliteDatabaseConnection_close__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v1 + 8));
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v2 = *(id *)(v1 + 32);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v3)
    {
      uint64_t v4 = *(void *)v10;
      do
      {
        uint64_t v5 = 0;
        do
        {
          if (*(void *)v10 != v4) {
            objc_enumerationMutation(v2);
          }
          uint64_t v6 = *(void **)(*((void *)&v9 + 1) + 8 * v5);
          if (objc_opt_respondsToSelector()) {
            objc_msgSend(v6, "sqliteDatabaseConnectionWillClose:", v1, (void)v9);
          }
          ++v5;
        }
        while (v3 != v5);
        uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v3);
    }

    uint64_t v7 = *(void **)(v1 + 32);
    *(void *)(v1 + 32) = 0;

    [*(id *)(v1 + 24) removeAllObjects];
    int v8 = *(void **)(v1 + 24);
    *(void *)(v1 + 24) = 0;

    -[BSSqliteDatabaseConnection _closeConnection](v1);
  }
}

- (void)addObserver:(uint64_t)a1
{
  if (a1)
  {
    id v2 = *(NSObject **)(a1 + 8);
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __42__BSSqliteDatabaseConnection_addObserver___block_invoke;
    v3[3] = &unk_1E54456B8;
    v3[4] = a1;
    void v3[5] = a2;
    dispatch_async(v2, v3);
  }
}

uint64_t __42__BSSqliteDatabaseConnection_addObserver___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 32);
  if (!v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 32);
    *(void *)(v4 + 32) = v3;

    id v2 = *(void **)(*(void *)(a1 + 32) + 32);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  return [v2 addObject:v6];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue_observers, 0);
  objc_storeStrong((id *)&self->_queue_queryCache, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end