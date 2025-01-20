@interface GEOSQLiteDB
+ (BOOL)deleteAllDBFilesFor:(id)a3;
+ (BOOL)deleteAllDBFilesForURL:(id)a3;
+ (BOOL)migrateAllDBFilesFrom:(id)a3 to:(id)a4;
+ (BOOL)renameAllDBFilesFrom:(id)a3 to:(id)a4;
+ (NSDictionary)defaultPragmas;
+ (NSDictionary)defaultReadOnlyPragmas;
+ (id)_findAllDBFilesForURL:(id)a3 error:(id *)a4;
- (BOOL)_bindParameter:(const char *)a3 inStatement:(sqlite3_stmt *)a4 error:(id *)a5 withBinder:(id)a6;
- (BOOL)_deleteAllDBFiles;
- (BOOL)_deleteAllDatabaseFilesIfCorrupt:(int)a3;
- (BOOL)_openAndConfigureWithRetryIfCorrupt;
- (BOOL)_waitForAllTransactionExternalResources;
- (BOOL)bindBlobNoCopyParameter:(const char *)a3 toValue:(id)a4 inStatement:(sqlite3_stmt *)a5 error:(id *)a6;
- (BOOL)bindBlobParameter:(const char *)a3 toValue:(id)a4 inStatement:(sqlite3_stmt *)a5 error:(id *)a6;
- (BOOL)bindInt64Parameter:(const char *)a3 toValue:(int64_t)a4 inStatement:(sqlite3_stmt *)a5 error:(id *)a6;
- (BOOL)bindIntParameter:(const char *)a3 toValue:(int)a4 inStatement:(sqlite3_stmt *)a5 error:(id *)a6;
- (BOOL)bindNullParameter:(const char *)a3 inStatement:(sqlite3_stmt *)a4 error:(id *)a5;
- (BOOL)bindRealParameter:(const char *)a3 toValue:(double)a4 inStatement:(sqlite3_stmt *)a5 error:(id *)a6;
- (BOOL)bindTextParameter:(const char *)a3 toValue:(id)a4 inStatement:(sqlite3_stmt *)a5 error:(id *)a6;
- (BOOL)bindUUIDParameter:(const char *)a3 toValue:(id)a4 inStatement:(sqlite3_stmt *)a5 error:(id *)a6;
- (BOOL)bindZeroBlobParameter:(const char *)a3 length:(unint64_t)a4 inStatement:(sqlite3_stmt *)a5 error:(id *)a6;
- (BOOL)createIndex:(const char *)a3;
- (BOOL)createTable:(const char *)a3 withDrop:(const char *)a4;
- (BOOL)deleteAllDBFiles;
- (BOOL)deleteExternalResourceAtURL:(id)a3 error:(id *)a4;
- (BOOL)dropAllTables;
- (BOOL)dropTablesLike:(id)a3;
- (BOOL)ensureInTransaction:(id)a3;
- (BOOL)executeInTransaction:(id)a3;
- (BOOL)executeStatement:(id)a3 statementBlock:(id)a4;
- (BOOL)executeStatement:(sqlite3_stmt *)a3 error:(id *)a4;
- (BOOL)isDBReady;
- (BOOL)moveExternalResourceAtURL:(id)a3 toURL:(id)a4 error:(id *)a5;
- (BOOL)prepareStatement:(const char *)a3 forKey:(id)a4;
- (BOOL)registerVirtualTable:(id)a3;
- (BOOL)reportSQLiteErrorCode:(int)a3 method:(id)a4 error:(id *)a5;
- (BOOL)setup;
- (BOOL)statementForKey:(id)a3 statementBlock:(id)a4;
- (BOOL)unregisterVirtualTable:(id)a3;
- (BOOL)vacuum;
- (BOOL)writeBlobData:(id)a3 toTable:(const char *)a4 column:(const char *)a5 rowID:(int64_t)a6 error:(id *)a7;
- (BOOL)writeExternalResourceWithData:(id)a3 toURL:(id)a4 error:(id *)a5;
- (GEOSQLiteDB)init;
- (GEOSQLiteDB)initWithQueueName:(const char *)a3 log:(id)a4 databaseFileURL:(id)a5 sqliteFlags:(int)a6 pragmas:(id)a7 setupBlock:(id)a8;
- (GEOSQLiteDB)initWithQueueName:(const char *)a3 log:(id)a4 databaseFileURL:(id)a5 sqliteFlags:(int)a6 pragmas:(id)a7 setupBlock:(id)a8 tearDownBlock:(id)a9;
- (GEOSQLiteDB)initWithQueueName:(const char *)a3 logFacility:(const char *)a4 dbFilePath:(id)a5 sqliteFlags:(int)a6 pragmas:(id)a7 setupBlock:(id)a8;
- (GEOSQLiteDB)initWithQueueName:(const char *)a3 logFacility:(const char *)a4 dbFilePath:(id)a5 sqliteFlags:(int)a6 pragmas:(id)a7 setupBlock:(id)a8 tearDownBlock:(id)a9;
- (NSDictionary)pragmas;
- (NSError)lastError;
- (NSString)dbFilePath;
- (NSURL)databaseFileURL;
- (OS_dispatch_queue)isolationQueue;
- (OS_os_log)log;
- (double)doubleForColumn:(int)a3 inStatment:(sqlite3_stmt *)a4;
- (id)UUIDForColumn:(int)a3 inStatment:(sqlite3_stmt *)a4;
- (id)_blobForColumn:(int)a3 inStatment:(sqlite3_stmt *)a4 noCopy:(BOOL)a5;
- (id)blobForColumn:(int)a3 inStatment:(sqlite3_stmt *)a4;
- (id)description;
- (id)getAllTables;
- (id)getTablesLike:(id)a3;
- (id)noCopyBlobForColumn:(int)a3 inStatment:(sqlite3_stmt *)a4;
- (id)stringForColumn:(int)a3 inStatment:(sqlite3_stmt *)a4;
- (int)_openAndConfigure;
- (int)_openDatabaseFile;
- (int)_setPragmas;
- (int)intForColumn:(int)a3 inStatment:(sqlite3_stmt *)a4;
- (int)sqliteFlags;
- (int64_t)int64ForColumn:(int)a3 inStatment:(sqlite3_stmt *)a4;
- (int64_t)lastInsertRowID;
- (int64_t)temporaryStoreMode;
- (int64_t)user_version;
- (sqlite3)sqliteDB;
- (sqlite3_stmt)statementForKey:(id)a3;
- (void)_channelCleanupFailedWithError:(int)a3;
- (void)_channelEncounteredError:(int)a3;
- (void)_closeDB;
- (void)_createParentDirectory;
- (void)_debug_lockDB:(id)a3;
- (void)_debug_unlockDB:(id)a3;
- (void)_deleteAndReopenDatabaseIfCorrupt:(int)a3;
- (void)_doneWritingToChannel:(id)a3;
- (void)_execute:(id)a3 errorHandler:(id)a4;
- (void)_writeTransactionExternalResourceWithData:(id)a3 toURL:(id)a4;
- (void)addTransactionPostCommitAction:(id)a3;
- (void)clearStatement:(id)a3;
- (void)dealloc;
- (void)executeAsync:(id)a3;
- (void)executeAsync:(id)a3 errorHandler:(id)a4;
- (void)executeFromIsolationQueue:(id)a3;
- (void)executeFromIsolationQueue:(id)a3 errorHandler:(id)a4;
- (void)executeSync:(id)a3;
- (void)executeSync:(id)a3 errorHandler:(id)a4;
- (void)performWithTemporaryStoreMode:(int64_t)a3 block:(id)a4;
- (void)setTemporaryStoreMode:(int64_t)a3;
- (void)setUser_version:(int64_t)a3;
- (void)tearDown;
@end

@implementation GEOSQLiteDB

uint64_t __41__GEOSQLiteDB_executeAsync_errorHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _execute:*(void *)(a1 + 40) errorHandler:*(void *)(a1 + 48)];
}

- (void)executeSync:(id)a3
{
}

uint64_t __40__GEOSQLiteDB_executeSync_errorHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _execute:*(void *)(a1 + 40) errorHandler:*(void *)(a1 + 48)];
}

- (void)_execute:(id)a3 errorHandler:(id)a4
{
  v8 = (void (**)(void))a3;
  v6 = (void (**)(id, NSError *))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  lastError = self->_lastError;
  self->_lastError = 0;

  if ([(GEOSQLiteDB *)self setup])
  {
    v8[2]();
  }
  else if (v6)
  {
    v6[2](v6, self->_lastError);
  }
}

- (BOOL)setup
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_db) {
    return 1;
  }
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v16 = self;
    _os_log_impl(&dword_188D96000, log, OS_LOG_TYPE_INFO, "Opening database file for %p.", buf, 0xCu);
  }
  unsigned __int8 v5 = atomic_load((unsigned __int8 *)&self->_didTearDown);
  BOOL v3 = (v5 & 1) == 0;
  if (v5)
  {
    v8 = self->_log;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_188D96000, v8, OS_LOG_TYPE_ERROR, "DB can not be accessed once tearDown has been called.", buf, 2u);
    }
    id v9 = (id)*MEMORY[0x1E4F1D138];
    id v13 = v9;
    v14 = @"Database was torn down.";
    v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v14 forKeys:&v13 count:1];

    v10 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-17 userInfo:v7];
    lastError = self->_lastError;
    self->_lastError = v10;
  }
  else
  {
    if (![(GEOSQLiteDB *)self _openAndConfigureWithRetryIfCorrupt]) {
      return 0;
    }
    v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:self selector:sel__debug_unlockDB_ name:GEOUnlockSQLiteDBNotificationName object:0];

    v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 addObserver:self selector:sel__debug_lockDB_ name:GEOLockSQLiteDBNotificationName object:0];
  }

  return v3;
}

- (OS_dispatch_queue)isolationQueue
{
  return self->_queue;
}

- (BOOL)executeStatement:(id)a3 statementBlock:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (unsigned int (**)(id, id))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_db || (v8 = [(NSMapTable *)self->_preparedStatements objectForKey:v6]) == 0)
  {
    BOOL v12 = 0;
    goto LABEL_15;
  }
  id v9 = v8;
  if (!v7[2](v7, v8))
  {
    id v11 = 0;
LABEL_9:
    BOOL v12 = 0;
    goto LABEL_10;
  }
  uint64_t v10 = sqlite3_step(v9);
  if (v10 != 101)
  {
    id v20 = 0;
    [(GEOSQLiteDB *)self reportSQLiteErrorCode:v10 method:@"step" error:&v20];
    id v11 = v20;
    goto LABEL_9;
  }
  id v11 = 0;
  BOOL v12 = 1;
LABEL_10:
  uint64_t v13 = sqlite3_reset(v9);
  if (v13)
  {
    uint64_t v14 = v13;
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      db = self->_db;
      v18 = log;
      v19 = sqlite3_errmsg(db);
      *(_DWORD *)buf = 67109378;
      int v22 = v14;
      __int16 v23 = 2082;
      v24 = v19;
      _os_log_error_impl(&dword_188D96000, v18, OS_LOG_TYPE_ERROR, "reset failure: %d %{public}s", buf, 0x12u);
    }
    [(GEOSQLiteDB *)self _deleteAndReopenDatabaseIfCorrupt:v14];
    BOOL v12 = 0;
  }

LABEL_15:
  return v12;
}

- (BOOL)bindTextParameter:(const char *)a3 toValue:(id)a4 inStatement:(sqlite3_stmt *)a5 error:(id *)a6
{
  id v10 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __59__GEOSQLiteDB_bindTextParameter_toValue_inStatement_error___block_invoke;
  v13[3] = &unk_1E53DD5E0;
  id v14 = v10;
  v15 = a5;
  id v11 = v10;
  LOBYTE(a6) = [(GEOSQLiteDB *)self _bindParameter:a3 inStatement:a5 error:a6 withBinder:v13];

  return (char)a6;
}

- (BOOL)statementForKey:(id)a3 statementBlock:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (uint64_t (**)(id, id))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_db && (v8 = [(NSMapTable *)self->_preparedStatements objectForKey:v6]) != 0)
  {
    id v9 = v8;
    char v10 = v7[2](v7, v8);
    uint64_t v11 = sqlite3_reset(v9);
    if (v11)
    {
      uint64_t v12 = v11;
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      {
        db = self->_db;
        v16 = log;
        v17[0] = 67109378;
        v17[1] = v12;
        __int16 v18 = 2082;
        v19 = sqlite3_errmsg(db);
        _os_log_error_impl(&dword_188D96000, v16, OS_LOG_TYPE_ERROR, "reset failure: %d %{public}s", (uint8_t *)v17, 0x12u);
      }
      [(GEOSQLiteDB *)self _deleteAndReopenDatabaseIfCorrupt:v12];
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (BOOL)bindInt64Parameter:(const char *)a3 toValue:(int64_t)a4 inStatement:(sqlite3_stmt *)a5 error:(id *)a6
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__GEOSQLiteDB_bindInt64Parameter_toValue_inStatement_error___block_invoke;
  v7[3] = &__block_descriptor_48_e8_i12__0i8l;
  v7[4] = a5;
  v7[5] = a4;
  return [(GEOSQLiteDB *)self _bindParameter:a3 inStatement:a5 error:a6 withBinder:v7];
}

- (BOOL)bindIntParameter:(const char *)a3 toValue:(int)a4 inStatement:(sqlite3_stmt *)a5 error:(id *)a6
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__GEOSQLiteDB_bindIntParameter_toValue_inStatement_error___block_invoke;
  v7[3] = &__block_descriptor_44_e8_i12__0i8l;
  v7[4] = a5;
  int v8 = a4;
  return [(GEOSQLiteDB *)self _bindParameter:a3 inStatement:a5 error:a6 withBinder:v7];
}

- (BOOL)_bindParameter:(const char *)a3 inStatement:(sqlite3_stmt *)a4 error:(id *)a5 withBinder:(id)a6
{
  char v10 = (uint64_t (**)(id, void))a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_db)
  {
    uint64_t v11 = sqlite3_bind_parameter_index(a4, a3);
    uint64_t v12 = v10[2](v10, v11);
    if (!v12)
    {
      BOOL v13 = 1;
      goto LABEL_6;
    }
    [(GEOSQLiteDB *)self reportSQLiteErrorCode:v12 method:@"bind" error:a5];
  }
  BOOL v13 = 0;
LABEL_6:

  return v13;
}

uint64_t __58__GEOSQLiteDB_bindIntParameter_toValue_inStatement_error___block_invoke(uint64_t a1, int a2)
{
  return sqlite3_bind_int(*(sqlite3_stmt **)(a1 + 32), a2, *(_DWORD *)(a1 + 40));
}

- (int)intForColumn:(int)a3 inStatment:(sqlite3_stmt *)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_db) {
    return 0;
  }

  return sqlite3_column_int(a4, a3);
}

- (int64_t)int64ForColumn:(int)a3 inStatment:(sqlite3_stmt *)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_db) {
    return 0;
  }

  return sqlite3_column_int64(a4, a3);
}

- (id)_blobForColumn:(int)a3 inStatment:(sqlite3_stmt *)a4 noCopy:(BOOL)a5
{
  BOOL v5 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_db)
  {
    id v9 = sqlite3_column_blob(a4, a3);
    int v10 = sqlite3_column_bytes(a4, a3);
    uint64_t v11 = 0;
    if (v9 && v10 >= 1)
    {
      if (v5) {
        [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v9 length:v10 freeWhenDone:0];
      }
      else {
      uint64_t v11 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v9 length:v10];
      }
    }
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

uint64_t __60__GEOSQLiteDB_bindInt64Parameter_toValue_inStatement_error___block_invoke(uint64_t a1, int a2)
{
  return sqlite3_bind_int64(*(sqlite3_stmt **)(a1 + 32), a2, *(void *)(a1 + 40));
}

uint64_t __59__GEOSQLiteDB_bindTextParameter_toValue_inStatement_error___block_invoke(uint64_t a1, int a2)
{
  BOOL v3 = *(sqlite3_stmt **)(a1 + 40);
  v4 = (const char *)[*(id *)(a1 + 32) cStringUsingEncoding:4];

  return sqlite3_bind_text(v3, a2, v4, -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
}

- (id)stringForColumn:(int)a3 inStatment:(sqlite3_stmt *)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_db)
  {
    v7 = (void *)sqlite3_column_text(a4, a3);
    if (v7)
    {
      v7 = [NSString stringWithUTF8String:v7];
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)blobForColumn:(int)a3 inStatment:(sqlite3_stmt *)a4
{
  return [(GEOSQLiteDB *)self _blobForColumn:*(void *)&a3 inStatment:a4 noCopy:0];
}

- (id)UUIDForColumn:(int)a3 inStatment:(sqlite3_stmt *)a4
{
  v4 = [(GEOSQLiteDB *)self noCopyBlobForColumn:*(void *)&a3 inStatment:a4];
  BOOL v5 = v4;
  if (v4 && [v4 length] == 16) {
    id v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F29128]), "initWithUUIDBytes:", objc_msgSend(v5, "bytes"));
  }
  else {
    id v6 = 0;
  }

  return v6;
}

- (id)noCopyBlobForColumn:(int)a3 inStatment:(sqlite3_stmt *)a4
{
  return [(GEOSQLiteDB *)self _blobForColumn:*(void *)&a3 inStatment:a4 noCopy:1];
}

BOOL __36__GEOSQLiteDB_executeInTransaction___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (sqlite3_step(a2) != 101) {
    return 0;
  }
  if (*(unsigned char *)(a1 + 48))
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v3 = *(id *)(*(void *)(a1 + 32) + 136);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v28 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void *)(*((void *)&v27 + 1) + 8 * i);
          id v9 = [MEMORY[0x1E4F28CB8] defaultManager];
          [v9 removeItemAtURL:v8 error:0];
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v5);
    }
  }
  else
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v3 = *(id *)(*(void *)(a1 + 32) + 128);
    uint64_t v10 = [v3 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v24;
      do
      {
        for (uint64_t j = 0; j != v11; ++j)
        {
          if (*(void *)v24 != v12) {
            objc_enumerationMutation(v3);
          }
          uint64_t v14 = *(void *)(*((void *)&v23 + 1) + 8 * j);
          v15 = objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager", (void)v23);
          [v15 removeItemAtURL:v14 error:0];
        }
        uint64_t v11 = [v3 countByEnumeratingWithState:&v23 objects:v31 count:16];
      }
      while (v11);
    }
  }

  uint64_t v16 = *(void *)(a1 + 32);
  uint64_t v17 = *(void **)(v16 + 128);
  *(void *)(v16 + 128) = 0;

  uint64_t v18 = *(void *)(a1 + 32);
  v19 = *(void **)(v18 + 136);
  *(void *)(v18 + 136) = 0;

  *(unsigned char *)(*(void *)(a1 + 32) + 120) = 0;
  uint64_t v20 = *(void *)(*(void *)(a1 + 40) + 8);
  v21 = *(void **)(v20 + 40);
  *(void *)(v20 + 40) = 0;

  return *(unsigned char *)(a1 + 48) != 0;
}

uint64_t __36__GEOSQLiteDB_executeInTransaction___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (sqlite3_step(a2) != 101) {
    return 0;
  }
  int v3 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v4 = @"_rollback";
  if (v3)
  {
    int v3 = [*(id *)(a1 + 32) _waitForAllTransactionExternalResources];
    if (v3) {
      uint64_t v4 = @"_commit";
    }
  }
  uint64_t v5 = *(void **)(a1 + 32);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __36__GEOSQLiteDB_executeInTransaction___block_invoke_2;
  v21[3] = &unk_1E53DD668;
  char v22 = v3;
  uint64_t v6 = *(void *)(a1 + 48);
  v21[4] = v5;
  v21[5] = v6;
  uint64_t v7 = [v5 statementForKey:v4 statementBlock:v21];
  uint64_t v8 = *(void *)(a1 + 32);
  if (v7)
  {
    id v9 = *(void **)(v8 + 144);
    if (v9)
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      id v10 = v9;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v23 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v18;
        do
        {
          uint64_t v14 = 0;
          do
          {
            if (*(void *)v18 != v13) {
              objc_enumerationMutation(v10);
            }
            (*(void (**)(void))(*(void *)(*((void *)&v17 + 1) + 8 * v14) + 16))(*(void *)(*((void *)&v17 + 1) + 8 * v14));
            ++v14;
          }
          while (v12 != v14);
          uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v23 count:16];
        }
        while (v12);
      }

      uint64_t v8 = *(void *)(a1 + 32);
    }
  }
  v15 = *(void **)(v8 + 144);
  *(void *)(v8 + 144) = 0;

  return v7;
}

- (BOOL)_waitForAllTransactionExternalResources
{
  while (dispatch_group_wait((dispatch_group_t)self->_externalFilesGroup, 0xFFFFFFFFFFFFFFFFLL))
    ;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  externalFilesQueue = self->_externalFilesQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __68__GEOSQLiteDB_ExternalFile___waitForAllTransactionExternalResources__block_invoke;
  v6[3] = &unk_1E53D89C0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(externalFilesQueue, v6);
  BOOL v4 = *((unsigned char *)v8 + 24) == 0;
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (BOOL)executeInTransaction:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_db || self->_isInTransaction)
  {
    BOOL v6 = 0;
  }
  else
  {
    self->_isInTransaction = 1;
    v12[0] = 0;
    v12[1] = v12;
    v12[2] = 0x3032000000;
    v12[3] = __Block_byref_object_copy__14;
    v12[4] = __Block_byref_object_dispose__14;
    id v5 = [(NSURL *)self->_databaseFileURL lastPathComponent];
    uint64_t v8 = [v5 UTF8String];
    _GEOCreateTransaction();
    id v13 = (id)objc_claimAutoreleasedReturnValue();

    if (![(NSMapTable *)self->_preparedStatements objectForKey:@"_begin", v8])
    {
      [(GEOSQLiteDB *)self prepareStatement:"BEGIN TRANSACTION;" forKey:@"_begin"];
      [(GEOSQLiteDB *)self prepareStatement:"COMMIT TRANSACTION;" forKey:@"_commit"];
      -[GEOSQLiteDB prepareStatement:forKey:](self, "prepareStatement:forKey:", "ROLLBACK TRANSACTION;",
        @"_rollback");
    }
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __36__GEOSQLiteDB_executeInTransaction___block_invoke;
    v9[3] = &unk_1E53DD690;
    v9[4] = self;
    id v10 = v4;
    uint64_t v11 = v12;
    BOOL v6 = [(GEOSQLiteDB *)self statementForKey:@"_begin" statementBlock:v9];

    _Block_object_dispose(v12, 8);
  }

  return v6;
}

uint64_t __59__GEOSQLiteDB_bindBlobParameter_toValue_inStatement_error___block_invoke(uint64_t a1, int a2)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = *(sqlite3_stmt **)(a1 + 40);
  if (v4)
  {
    BOOL v6 = (const void *)[v4 bytes];
    int v7 = [*(id *)(a1 + 32) length];
    return sqlite3_bind_blob(v5, a2, v6, v7, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    uint64_t v9 = *(sqlite3_stmt **)(a1 + 40);
    return sqlite3_bind_null(v9, a2);
  }
}

uint64_t __68__GEOSQLiteDB_ExternalFile___waitForAllTransactionExternalResources__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 40);
  *(unsigned char *)(*(void *)(result + 32) + 40) = 0;
  return result;
}

- (sqlite3_stmt)statementForKey:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_db) {
    id v5 = [(NSMapTable *)self->_preparedStatements objectForKey:v4];
  }
  else {
    id v5 = 0;
  }

  return v5;
}

+ (BOOL)deleteAllDBFilesForURL:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v26 = 0;
  id v4 = +[GEOSQLiteDB _findAllDBFilesForURL:v3 error:&v26];
  id v5 = v26;
  if ([v4 count])
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    obuint64_t j = v4;
    uint64_t v6 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      long long v18 = v4;
      id v19 = v3;
      uint64_t v8 = *(void *)v23;
      uint64_t v9 = MEMORY[0x1E4F14500];
      while (2)
      {
        uint64_t v10 = 0;
        uint64_t v11 = v5;
        do
        {
          if (*(void *)v23 != v8) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void **)(*((void *)&v22 + 1) + 8 * v10);
          if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
          {
            uint64_t v13 = [v12 fileSystemRepresentation];
            *(_DWORD *)buf = 136315138;
            uint64_t v29 = v13;
            _os_log_impl(&dword_188D96000, v9, OS_LOG_TYPE_INFO, "Deleting %s", buf, 0xCu);
          }
          uint64_t v14 = objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager", v18, v19);
          id v21 = v11;
          char v15 = [v14 removeItemAtURL:v12 error:&v21];
          id v5 = v21;

          if ((v15 & 1) == 0)
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v29 = (uint64_t)v12;
              __int16 v30 = 2112;
              id v31 = v5;
              _os_log_error_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to unlink file at %@: %@", buf, 0x16u);
            }
            BOOL v16 = 0;
            goto LABEL_16;
          }
          ++v10;
          uint64_t v11 = v5;
        }
        while (v7 != v10);
        uint64_t v7 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
        if (v7) {
          continue;
        }
        break;
      }
      BOOL v16 = 1;
LABEL_16:
      id v4 = v18;
      id v3 = v19;
    }
    else
    {
      BOOL v16 = 1;
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v29 = (uint64_t)v3;
      __int16 v30 = 2112;
      id v31 = v5;
      _os_log_error_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to find any files for database %@: %@", buf, 0x16u);
    }
    BOOL v16 = 1;
  }

  return v16;
}

- (void)executeAsync:(id)a3 errorHandler:(id)a4
{
  id v6 = a4;
  uint64_t v7 = (void *)[a3 copy];
  uint64_t v8 = (void *)[v6 copy];

  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__GEOSQLiteDB_executeAsync_errorHandler___block_invoke;
  block[3] = &unk_1E53DD548;
  block[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(queue, block);
}

- (void)executeAsync:(id)a3
{
}

- (void)executeSync:(id)a3 errorHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__GEOSQLiteDB_executeSync_errorHandler___block_invoke;
  block[3] = &unk_1E53DD548;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(queue, block);
}

- (BOOL)prepareStatement:(const char *)a3 forKey:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_db || ![v6 length]) {
    goto LABEL_8;
  }
  ppStmt = [(NSMapTable *)self->_preparedStatements objectForKey:v6];
  if (!ppStmt)
  {
    int v8 = sqlite3_prepare_v2(self->_db, a3, -1, &ppStmt, 0);
    if (!v8)
    {
      [(NSMapTable *)self->_preparedStatements setObject:ppStmt forKey:v6];
      goto LABEL_4;
    }
    int v9 = v8;
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      db = self->_db;
      id v13 = log;
      id v14 = sqlite3_errmsg(db);
      *(_DWORD *)buf = 136446722;
      long long v17 = a3;
      __int16 v18 = 1024;
      int v19 = v9;
      __int16 v20 = 2082;
      id v21 = v14;
      _os_log_error_impl(&dword_188D96000, v13, OS_LOG_TYPE_ERROR, "prepare failure for stmt ('%{public}s') %d %{public}s", buf, 0x1Cu);
    }
LABEL_8:
    BOOL v7 = 0;
    goto LABEL_9;
  }
LABEL_4:
  BOOL v7 = 1;
LABEL_9:

  return v7;
}

- (BOOL)writeBlobData:(id)a3 toTable:(const char *)a4 column:(const char *)a5 rowID:(int64_t)a6 error:(id *)a7
{
  id v12 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  ppBlob = 0;
  uint64_t v13 = sqlite3_blob_open([(GEOSQLiteDB *)self sqliteDB], "main", a4, a5, a6, 1, &ppBlob);
  if (v13)
  {
    [(GEOSQLiteDB *)self reportSQLiteErrorCode:v13 method:@"blob_open" error:a7];
    BOOL v14 = 0;
  }
  else
  {
    uint64_t v18 = 0;
    int v19 = &v18;
    uint64_t v20 = 0x2020000000;
    char v21 = 1;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    _DWORD v17[2] = __56__GEOSQLiteDB_writeBlobData_toTable_column_rowID_error___block_invoke;
    v17[3] = &unk_1E53DD6B8;
    v17[6] = ppBlob;
    v17[7] = a7;
    v17[4] = self;
    v17[5] = &v18;
    [v12 enumerateByteRangesUsingBlock:v17];
    uint64_t v15 = sqlite3_blob_close(ppBlob);
    BOOL v14 = *((unsigned char *)v19 + 24) != 0;
    if (*((unsigned char *)v19 + 24) && v15)
    {
      [(GEOSQLiteDB *)self reportSQLiteErrorCode:v15 method:@"blob_close" error:a7];
      BOOL v14 = 0;
    }
    _Block_object_dispose(&v18, 8);
  }

  return v14;
}

- (BOOL)bindBlobParameter:(const char *)a3 toValue:(id)a4 inStatement:(sqlite3_stmt *)a5 error:(id *)a6
{
  id v10 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __59__GEOSQLiteDB_bindBlobParameter_toValue_inStatement_error___block_invoke;
  v13[3] = &unk_1E53DD5E0;
  id v14 = v10;
  uint64_t v15 = a5;
  id v11 = v10;
  LOBYTE(a6) = [(GEOSQLiteDB *)self _bindParameter:a3 inStatement:a5 error:a6 withBinder:v13];

  return (char)a6;
}

- (BOOL)bindUUIDParameter:(const char *)a3 toValue:(id)a4 inStatement:(sqlite3_stmt *)a5 error:(id *)a6
{
  id v10 = a4;
  if (v10)
  {
    id v11 = [MEMORY[0x1E4F1CA58] dataWithLength:16];
    objc_msgSend(v10, "getUUIDBytes:", objc_msgSend(v11, "mutableBytes"));
    BOOL v12 = [(GEOSQLiteDB *)self bindBlobParameter:a3 toValue:v11 inStatement:a5 error:a6];
  }
  else
  {
    BOOL v12 = [(GEOSQLiteDB *)self bindBlobParameter:a3 toValue:0 inStatement:a5 error:a6];
  }

  return v12;
}

- (BOOL)writeExternalResourceWithData:(id)a3 toURL:(id)a4 error:(id *)a5
{
  queue = self->_queue;
  id v9 = a4;
  id v10 = a3;
  dispatch_assert_queue_V2(queue);
  if (self->_isInTransaction)
  {
    filesAddedDuringTransaction = self->_filesAddedDuringTransaction;
    if (!filesAddedDuringTransaction)
    {
      BOOL v12 = [MEMORY[0x1E4F1CA48] array];
      uint64_t v13 = self->_filesAddedDuringTransaction;
      self->_filesAddedDuringTransaction = v12;

      filesAddedDuringTransaction = self->_filesAddedDuringTransaction;
    }
    [(NSMutableArray *)filesAddedDuringTransaction addObject:v9];
    [(GEOSQLiteDB *)self _writeTransactionExternalResourceWithData:v10 toURL:v9];
    char v14 = 1;
  }
  else
  {
    unsigned int v15 = ([(GEOSQLiteDB *)self sqliteFlags] & 0x700000) - 0x100000;
    if (v15 >= 0x300000) {
      unint64_t v16 = 0;
    }
    else {
      unint64_t v16 = ((unint64_t)(v15 >> 20) << 28) + 0x20000000;
    }
    char v14 = [v10 writeToURL:v9 options:v16 error:a5];
  }

  return v14;
}

- (id)getTablesLike:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = [MEMORY[0x1E4F1CA80] set];
  ppStmt = 0;
  if ([v4 length])
  {
    objc_msgSend(NSString, "stringWithFormat:", @"SELECT name FROM sqlite_master WHERE type='table' AND (name LIKE '%@');",
      v4);
    id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v6 = @"SELECT name FROM sqlite_master WHERE type='table';";
  }
  db = self->_db;
  int v8 = v6;
  uint64_t v9 = sqlite3_prepare_v2(db, (const char *)[(__CFString *)v8 UTF8String], -1, &ppStmt, 0);
  if (v9)
  {
    [(GEOSQLiteDB *)self reportSQLiteErrorCode:v9 method:@"getTablesLike:" error:0];
  }
  else
  {
    uint64_t v10 = sqlite3_step(ppStmt);
    while (v10 == 100)
    {
      id v11 = objc_msgSend(NSString, "stringWithUTF8String:", sqlite3_column_text(ppStmt, 0));
      [v5 addObject:v11];
      uint64_t v10 = sqlite3_step(ppStmt);
    }
    if (v10 == 101)
    {
      sqlite3_finalize(ppStmt);
      BOOL v12 = (void *)[v5 copy];
      goto LABEL_13;
    }
    [(GEOSQLiteDB *)self reportSQLiteErrorCode:v10 method:@"getTablesLike:" error:0];
    [v5 removeAllObjects];
  }
  sqlite3_finalize(ppStmt);
  BOOL v12 = 0;
LABEL_13:

  return v12;
}

- (BOOL)createTable:(const char *)a3 withDrop:(const char *)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  db = self->_db;
  if (db)
  {
    if (a4)
    {
      int v8 = sqlite3_exec(db, a4, 0, 0, 0);
      if (v8)
      {
        int v9 = v8;
        log = self->_log;
        if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
        {
          long long v17 = self->_db;
          uint64_t v18 = log;
          int v20 = 67109378;
          int v21 = v9;
          __int16 v22 = 2082;
          long long v23 = sqlite3_errmsg(v17);
          _os_log_debug_impl(&dword_188D96000, v18, OS_LOG_TYPE_DEBUG, "drop before create failure: %d %{public}s", (uint8_t *)&v20, 0x12u);
        }
      }
    }
    int v11 = sqlite3_exec(self->_db, a3, 0, 0, 0);
    if (v11)
    {
      int v12 = v11;
      uint64_t v13 = self->_log;
      LODWORD(db) = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
      if (db)
      {
        char v14 = self->_db;
        unsigned int v15 = v13;
        unint64_t v16 = sqlite3_errmsg(v14);
        int v20 = 67109378;
        int v21 = v12;
        __int16 v22 = 2082;
        long long v23 = v16;
        _os_log_error_impl(&dword_188D96000, v15, OS_LOG_TYPE_ERROR, "table create failure: %d %{public}s", (uint8_t *)&v20, 0x12u);

        LOBYTE(db) = 0;
      }
    }
    else
    {
      LOBYTE(db) = 1;
    }
  }
  return (char)db;
}

- (NSString)dbFilePath
{
  return [(NSURL *)self->_databaseFileURL path];
}

- (BOOL)isDBReady
{
  return self->_db != 0;
}

- (NSDictionary)pragmas
{
  pragmas = self->_pragmas;
  if (pragmas)
  {
    id v3 = pragmas;
  }
  else
  {
    int sqliteFlags = self->_sqliteFlags;
    id v5 = objc_opt_class();
    if (sqliteFlags) {
      [v5 defaultReadOnlyPragmas];
    }
    else {
    id v3 = [v5 defaultPragmas];
    }
  }

  return v3;
}

+ (NSDictionary)defaultPragmas
{
  return (NSDictionary *)&unk_1ED73F310;
}

+ (NSDictionary)defaultReadOnlyPragmas
{
  return (NSDictionary *)&unk_1ED73F338;
}

- (int64_t)user_version
{
  int64_t v2 = -1;
  int64_t v5 = -1;
  db = self->_db;
  if (db)
  {
    sqlite3_exec(db, "PRAGMA user_version", (int (__cdecl *)(void *, int, char **, char **))_getFirstColumnInt64_0, &v5, 0);
    return v5;
  }
  return v2;
}

- (void)setUser_version:(int64_t)a3
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (self->_db)
  {
    snprintf(__str, 0x28uLL, "PRAGMA user_version = %lld", a3);
    sqlite3_exec(self->_db, __str, 0, 0, 0);
  }
}

- (int64_t)temporaryStoreMode
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  int64_t result = (int64_t)self->_db;
  if (result)
  {
    int64_t v4 = 0;
    sqlite3_exec((sqlite3 *)result, "PRAGMA temp_store", (int (__cdecl *)(void *, int, char **, char **))_getFirstColumnInt64_0, &v4, 0);
    return v4;
  }
  return result;
}

- (void)setTemporaryStoreMode:(int64_t)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (a3 >= 3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)__str = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: temporaryStoreMode <= GEOSQLiteDBTemporaryStoreModeMemory", __str, 2u);
    }
  }
  else if (self->_db)
  {
    snprintf((char *)__str, 0x16uLL, "PRAGMA temp_store = %lld", a3);
    sqlite3_exec(self->_db, (const char *)__str, 0, 0, 0);
  }
}

- (void)performWithTemporaryStoreMode:(int64_t)a3 block:(id)a4
{
  queue = self->_queue;
  BOOL v7 = (void (**)(void))a4;
  dispatch_assert_queue_V2(queue);
  int64_t v8 = [(GEOSQLiteDB *)self temporaryStoreMode];
  [(GEOSQLiteDB *)self setTemporaryStoreMode:a3];
  v7[2](v7);

  [(GEOSQLiteDB *)self setTemporaryStoreMode:v8];
}

- (GEOSQLiteDB)init
{
  int64_t result = (GEOSQLiteDB *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (GEOSQLiteDB)initWithQueueName:(const char *)a3 logFacility:(const char *)a4 dbFilePath:(id)a5 sqliteFlags:(int)a6 pragmas:(id)a7 setupBlock:(id)a8
{
  return [(GEOSQLiteDB *)self initWithQueueName:a3 logFacility:a4 dbFilePath:a5 sqliteFlags:*(void *)&a6 pragmas:a7 setupBlock:a8 tearDownBlock:0];
}

- (GEOSQLiteDB)initWithQueueName:(const char *)a3 logFacility:(const char *)a4 dbFilePath:(id)a5 sqliteFlags:(int)a6 pragmas:(id)a7 setupBlock:(id)a8 tearDownBlock:(id)a9
{
  uint64_t v11 = *(void *)&a6;
  id v15 = a5;
  id v16 = a9;
  id v17 = a8;
  id v18 = a7;
  if ([v15 isEqualToString:@":memory:"])
  {
    int v19 = 0;
  }
  else
  {
    int v19 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v15 isDirectory:0];
  }
  int v20 = GEOFindOrCreateLog("com.apple.GeoServices", a4);
  int v21 = [(GEOSQLiteDB *)self initWithQueueName:a3 log:v20 databaseFileURL:v19 sqliteFlags:v11 pragmas:v18 setupBlock:v17 tearDownBlock:v16];

  return v21;
}

- (GEOSQLiteDB)initWithQueueName:(const char *)a3 log:(id)a4 databaseFileURL:(id)a5 sqliteFlags:(int)a6 pragmas:(id)a7 setupBlock:(id)a8
{
  return [(GEOSQLiteDB *)self initWithQueueName:a3 log:a4 databaseFileURL:a5 sqliteFlags:*(void *)&a6 pragmas:a7 setupBlock:a8 tearDownBlock:0];
}

- (GEOSQLiteDB)initWithQueueName:(const char *)a3 log:(id)a4 databaseFileURL:(id)a5 sqliteFlags:(int)a6 pragmas:(id)a7 setupBlock:(id)a8 tearDownBlock:(id)a9
{
  id v16 = a4;
  id v17 = a5;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  v36.receiver = self;
  v36.super_class = (Class)GEOSQLiteDB;
  int v21 = [(GEOSQLiteDB *)&v36 init];
  if (v21)
  {
    uint64_t v22 = geo_dispatch_queue_create();
    queue = v21->_queue;
    v21->_queue = (OS_dispatch_queue *)v22;

    objc_msgSend(NSString, "stringWithFormat:", @"%s.externalFiles", a3);
    id v24 = objc_claimAutoreleasedReturnValue();
    [v24 UTF8String];
    uint64_t v25 = geo_dispatch_queue_create();
    externalFilesQueue = v21->_externalFilesQueue;
    v21->_externalFilesQueue = (OS_dispatch_queue *)v25;

    dispatch_group_t v27 = dispatch_group_create();
    externalFilesGroup = v21->_externalFilesGroup;
    v21->_externalFilesGroup = (OS_dispatch_group *)v27;

    objc_storeStrong((id *)&v21->_log, a4);
    v21->_isTemporaryInMemoryDatabase = v17 == 0;
    objc_storeStrong((id *)&v21->_databaseFileURL, a5);
    if ((a6 & 3) != 0)
    {
      if ((a6 & 1) != 0 && (a6 & 2) != 0) {
        a6 &= ~1u;
      }
    }
    else
    {
      a6 |= 2u;
    }
    v21->_int sqliteFlags = (2 * a6) & 4 | a6;
    uint64_t v29 = [v18 copy];
    pragmas = v21->_pragmas;
    v21->_pragmas = (NSDictionary *)v29;

    uint64_t v31 = [v19 copy];
    id setupBlock = v21->_setupBlock;
    v21->_id setupBlock = (id)v31;

    uint64_t v33 = [v20 copy];
    id tearDownBlock = v21->_tearDownBlock;
    v21->_id tearDownBlock = (id)v33;
  }
  return v21;
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p>", objc_opt_class(), self];
  int64_t v4 = v3;
  if (self->_isTemporaryInMemoryDatabase)
  {
    uint64_t v5 = @" in-memory";
  }
  else
  {
    uint64_t v5 = @"'";
    [v3 appendString:@"'"];
    uint64_t v6 = [(NSURL *)self->_databaseFileURL absoluteURL];
    BOOL v7 = [v6 path];
    [v4 appendString:v7];
  }
  [v4 appendString:v5];

  return v4;
}

- (void)executeFromIsolationQueue:(id)a3
{
}

- (void)executeFromIsolationQueue:(id)a3 errorHandler:(id)a4
{
  queue = self->_queue;
  id v7 = a4;
  id v8 = a3;
  dispatch_assert_queue_V2(queue);
  [(GEOSQLiteDB *)self _execute:v8 errorHandler:v7];
}

- (BOOL)_openAndConfigureWithRetryIfCorrupt
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  for (char i = 0; ; char i = 1)
  {
    uint64_t v4 = [(GEOSQLiteDB *)self _openAndConfigure];
    if (!v4) {
      break;
    }
    BOOL v5 = ![(GEOSQLiteDB *)self _deleteAllDatabaseFilesIfCorrupt:v4];
    char v6 = i | v5;
    if (v6) {
      return !v4 && v5;
    }
  }
  BOOL v5 = 1;
  return !v4 && v5;
}

- (int)_openAndConfigure
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_preparedStatements)
  {
    int result = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
    if (result)
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: _preparedStatements == nil", v11, 2u);
    }
    __break(1u);
  }
  else
  {
    char v3 = 0;
    while (1)
    {
      int v4 = [(GEOSQLiteDB *)self _openDatabaseFile];
      if (v4) {
        return v4;
      }
      int v5 = [(GEOSQLiteDB *)self _setPragmas];
      int v6 = v5;
      if (v3 & 1 | (v5 != 8)) {
        break;
      }
      char v3 = 1;
      if (![(GEOSQLiteDB *)self _deleteAllDatabaseFilesIfCorrupt:8]) {
        goto LABEL_9;
      }
    }
    if (v5)
    {
LABEL_9:
      [(GEOSQLiteDB *)self _closeDB];
      return v6;
    }
    id v8 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:0 valueOptions:258];
    preparedStatements = self->_preparedStatements;
    self->_preparedStatements = v8;

    id setupBlock = (uint64_t (**)(id, GEOSQLiteDB *))self->_setupBlock;
    if (!setupBlock || (setupBlock[2](setupBlock, self) & 1) != 0) {
      return 0;
    }
    [(GEOSQLiteDB *)self _closeDB];
    return 1;
  }
  return result;
}

- (int)_openDatabaseFile
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (self->_isTemporaryInMemoryDatabase) {
    char v3 = ":memory:";
  }
  else {
    char v3 = [(NSURL *)self->_databaseFileURL fileSystemRepresentation];
  }
  unsigned int v4 = (self->_sqliteFlags & 0x700000) - 0x100000;
  if (v4 < 0x300000) {
    uint64_t v5 = (v4 >> 20) + 1;
  }
  else {
    uint64_t v5 = 0;
  }
  if (+[GEOKeyBagNotification canAccessFilesWithProtection:v5])
  {
    [(GEOSQLiteDB *)self _createParentDirectory];
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
    {
      int sqliteFlags = self->_sqliteFlags;
      int v20 = 136315394;
      int v21 = (void *)v3;
      __int16 v22 = 1024;
      int v23 = sqliteFlags;
      _os_log_impl(&dword_188D96000, log, OS_LOG_TYPE_INFO, "Opening database at %s with flags 0x%x", (uint8_t *)&v20, 0x12u);
    }
    p_db = &self->_db;
    uint64_t v9 = sqlite3_open_v2(v3, &self->_db, self->_sqliteFlags, 0);
    if (v9)
    {
      if (![(GEOSQLiteDB *)self _deleteAllDatabaseFilesIfCorrupt:v9]) {
        goto LABEL_15;
      }
      uint64_t v10 = self->_log;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v11 = self->_sqliteFlags;
        int v20 = 136315394;
        int v21 = (void *)v3;
        __int16 v22 = 1024;
        int v23 = v11;
        _os_log_impl(&dword_188D96000, v10, OS_LOG_TYPE_INFO, "Re-opening database at %s with flags 0x%x", (uint8_t *)&v20, 0x12u);
      }
      LODWORD(v9) = sqlite3_open_v2(v3, &self->_db, self->_sqliteFlags, 0);
      if (v9)
      {
LABEL_15:
        int v12 = self->_log;
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          databaseFileURL = self->_databaseFileURL;
          db = self->_db;
          id v18 = v12;
          id v19 = sqlite3_errmsg(db);
          int v20 = 138478339;
          int v21 = databaseFileURL;
          __int16 v22 = 1024;
          int v23 = v9;
          __int16 v24 = 2082;
          uint64_t v25 = v19;
          _os_log_error_impl(&dword_188D96000, v18, OS_LOG_TYPE_ERROR, "Can't open db at %{private}@ (%d : %{public}s)", (uint8_t *)&v20, 0x1Cu);
        }
        if (*p_db)
        {
          sqlite3_close_v2(*p_db);
          *p_db = 0;
        }
      }
    }
  }
  else
  {
    uint64_t v13 = self->_log;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v15 = self->_sqliteFlags;
      int v20 = 136315394;
      int v21 = (void *)v3;
      __int16 v22 = 1024;
      int v23 = v15;
      _os_log_error_impl(&dword_188D96000, v13, OS_LOG_TYPE_ERROR, "Refusing to open database at %s with flags 0x%x due to current device lock status", (uint8_t *)&v20, 0x12u);
    }
    LODWORD(v9) = 14;
  }
  return v9;
}

- (void)_createParentDirectory
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (!self->_isTemporaryInMemoryDatabase)
  {
    char v3 = [(NSURL *)self->_databaseFileURL URLByDeletingLastPathComponent];
    unsigned int v4 = [v3 path];
    id v11 = 0;
    BOOL v5 = +[GEOFilePaths createDirectoryCopyingAttributesFromParent:v4 error:&v11];
    id v6 = v11;

    if (!v5)
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      {
        id v8 = v3;
        uint64_t v9 = log;
        uint64_t v10 = [v8 fileSystemRepresentation];
        *(_DWORD *)buf = 136446466;
        uint64_t v13 = v10;
        __int16 v14 = 2112;
        id v15 = v6;
        _os_log_error_impl(&dword_188D96000, v9, OS_LOG_TYPE_ERROR, "Unable to create parent directory at %{public}s: %@", buf, 0x16u);
      }
    }
  }
}

- (void)_deleteAndReopenDatabaseIfCorrupt:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  BOOL v6 = v3 != 26 && v3 != 11;
  if (v3 != 8 && !v6)
  {
    if (self->_db) {
      [(GEOSQLiteDB *)self _closeDB];
    }
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v8 = 0;
      _os_log_error_impl(&dword_188D96000, log, OS_LOG_TYPE_ERROR, "Detected database corruption. Will delete database file & re-open.", v8, 2u);
    }
    if ([(GEOSQLiteDB *)self _deleteAllDatabaseFilesIfCorrupt:v3]) {
      [(GEOSQLiteDB *)self _openAndConfigureWithRetryIfCorrupt];
    }
  }
}

- (BOOL)_deleteAllDatabaseFilesIfCorrupt:(int)a3
{
  BOOL v4 = a3 != 26 && a3 != 11;
  return a3 != 8 && !v4 && [(GEOSQLiteDB *)self _deleteAllDBFiles];
}

+ (id)_findAllDBFilesForURL:(id)a3 error:(id *)a4
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v31 = 0;
  int v6 = [v5 getResourceValue:&v31 forKey:*MEMORY[0x1E4F1C6F8] error:a4];
  id v7 = v31;
  id v24 = 0;
  if (v6)
  {
    id v23 = v5;
    uint64_t v26 = [v5 lastPathComponent];
    uint64_t v25 = *MEMORY[0x1E4F1C6E8];
    v33[0] = *MEMORY[0x1E4F1C6E8];
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:1];
    uint64_t v9 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v22 = v7;
    uint64_t v10 = [v9 enumeratorAtURL:v7 includingPropertiesForKeys:v8 options:1 errorHandler:&__block_literal_global_38];

    id v24 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:3];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v11 = v10;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v28 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          id v17 = [v16 resourceValuesForKeys:v8 error:a4];
          id v18 = v17;
          if (v17)
          {
            id v19 = [v17 objectForKeyedSubscript:v25];
            int v20 = [v19 hasPrefix:v26];

            if (v20) {
              [v24 addObject:v16];
            }
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v13);
    }

    id v7 = v22;
    id v5 = v23;
  }

  return v24;
}

uint64_t __43__GEOSQLiteDB__findAllDBFilesForURL_error___block_invoke()
{
  return 1;
}

- (BOOL)_deleteAllDBFiles
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_sqliteFlags)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v7 = 0;
      _os_log_error_impl(&dword_188D96000, log, OS_LOG_TYPE_ERROR, "Refusing to delete db, opened in readonly mode", v7, 2u);
    }
    return 0;
  }
  else
  {
    uint64_t v3 = objc_opt_class();
    databaseFileURL = self->_databaseFileURL;
    return [v3 deleteAllDBFilesForURL:databaseFileURL];
  }
}

+ (BOOL)deleteAllDBFilesFor:(id)a3
{
  BOOL v4 = [MEMORY[0x1E4F1CB10] fileURLWithPath:a3];
  LOBYTE(a1) = [a1 deleteAllDBFilesForURL:v4];

  return (char)a1;
}

+ (BOOL)renameAllDBFilesFrom:(id)a3 to:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v5];
  v35 = v6;
  uint64_t v8 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v6];
  uint64_t v9 = (void *)v8;
  if (v7) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    BOOL v11 = 0;
  }
  else
  {
    id v41 = 0;
    uint64_t v12 = +[GEOSQLiteDB _findAllDBFilesForURL:v7 error:&v41];
    id v13 = v41;
    if ([v12 count])
    {
      uint64_t v14 = [v5 lastPathComponent];
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      obuint64_t j = v12;
      uint64_t v15 = [obj countByEnumeratingWithState:&v37 objects:v48 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        long long v29 = v12;
        long long v30 = v9;
        id v31 = v7;
        id v32 = v5;
        uint64_t v34 = *(void *)v38;
        while (2)
        {
          uint64_t v17 = 0;
          id v18 = v13;
          do
          {
            if (*(void *)v38 != v34) {
              objc_enumerationMutation(obj);
            }
            id v19 = *(void **)(*((void *)&v37 + 1) + 8 * v17);
            int v20 = objc_msgSend(v19, "lastPathComponent", v29, v30, v31, v32);
            unint64_t v21 = [v20 length];
            if (v21 <= [v14 length])
            {
              uint64_t v25 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v35];
            }
            else
            {
              id v22 = objc_msgSend(v20, "substringFromIndex:", objc_msgSend(v14, "length"));
              id v23 = (void *)MEMORY[0x1E4F1CB10];
              id v24 = [v35 stringByAppendingString:v22];
              uint64_t v25 = [v23 fileURLWithPath:v24];
            }
            uint64_t v26 = [MEMORY[0x1E4F28CB8] defaultManager];
            id v36 = v18;
            char v27 = [v26 moveItemAtURL:v19 toURL:v25 error:&v36];
            id v13 = v36;

            if ((v27 & 1) == 0)
            {
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412802;
                v43 = v19;
                __int16 v44 = 2112;
                id v45 = v25;
                __int16 v46 = 2112;
                id v47 = v13;
                _os_log_error_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to move file at %@ to %@: %@", buf, 0x20u);
              }

              BOOL v11 = 0;
              goto LABEL_23;
            }

            ++v17;
            id v18 = v13;
          }
          while (v16 != v17);
          uint64_t v16 = [obj countByEnumeratingWithState:&v37 objects:v48 count:16];
          if (v16) {
            continue;
          }
          break;
        }
        BOOL v11 = 1;
LABEL_23:
        id v7 = v31;
        id v5 = v32;
        uint64_t v12 = v29;
        uint64_t v9 = v30;
      }
      else
      {
        BOOL v11 = 1;
      }
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v43 = v7;
        __int16 v44 = 2112;
        id v45 = v13;
        _os_log_error_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to find any files for database %@: %@", buf, 0x16u);
      }
      BOOL v11 = 0;
    }
  }
  return v11;
}

+ (BOOL)migrateAllDBFilesFrom:(id)a3 to:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v9 = [v8 fileExistsAtPath:v6];

  if (v9)
  {
    BOOL v10 = [MEMORY[0x1E4F28CB8] defaultManager];
    int v11 = [v10 fileExistsAtPath:v7];

    if (v11) {
      char v12 = [a1 deleteAllDBFilesFor:v6];
    }
    else {
      char v12 = [a1 renameAllDBFilesFrom:v6 to:v7];
    }
    BOOL v13 = v12;
  }
  else
  {
    BOOL v13 = 1;
  }

  return v13;
}

- (int)_setPragmas
{
  int64_t v2 = self;
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  uint64_t v3 = [(GEOSQLiteDB *)self pragmas];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __26__GEOSQLiteDB__setPragmas__block_invoke;
  v5[3] = &unk_1E53DD590;
  v5[4] = v2;
  v5[5] = &v6;
  [v3 enumerateKeysAndObjectsUsingBlock:v5];

  LODWORD(v2) = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return (int)v2;
}

void __26__GEOSQLiteDB__setPragmas__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [NSString stringWithFormat:@"PRAGMA %@ = %@", a2, a3];;
  id v7 = *(sqlite3 **)(*(void *)(a1 + 32) + 48);
  id v8 = v6;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = sqlite3_exec(v7, (const char *)[v8 UTF8String], 0, 0, 0);
  int v9 = *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (v9)
  {
    uint64_t v10 = *(void *)(a1 + 32);
    int v11 = *(NSObject **)(v10 + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      char v12 = *(sqlite3 **)(v10 + 48);
      BOOL v13 = v11;
      *(_DWORD *)buf = 138543874;
      id v15 = v8;
      __int16 v16 = 1024;
      int v17 = v9;
      __int16 v18 = 2082;
      id v19 = sqlite3_errmsg(v12);
      _os_log_error_impl(&dword_188D96000, v13, OS_LOG_TYPE_ERROR, "'%{public}@' failed: %d %{public}s", buf, 0x1Cu);
    }
    *a4 = 1;
  }
}

- (BOOL)deleteAllDBFiles
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_db) {
    [(GEOSQLiteDB *)self _closeDB];
  }

  return [(GEOSQLiteDB *)self _deleteAllDBFiles];
}

- (void)tearDown
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ((atomic_exchange(&self->_didTearDown._Value, 1u) & 1) == 0)
  {
    id setupBlock = self->_setupBlock;
    self->_id setupBlock = 0;

    BOOL v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 removeObserver:self name:GEOUnlockSQLiteDBNotificationName object:0];

    id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 removeObserver:self name:GEOLockSQLiteDBNotificationName object:0];

    id tearDownBlock = (void (**)(id, GEOSQLiteDB *))self->_tearDownBlock;
    if (tearDownBlock) {
      tearDownBlock[2](tearDownBlock, self);
    }
    [(GEOSQLiteDB *)self _closeDB];
  }
}

- (void)_closeDB
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v3 = self->_preparedStatements;
  uint64_t v4 = [(NSMapTable *)v3 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v3);
        }
        sqlite3_finalize((sqlite3_stmt *)-[NSMapTable objectForKey:](self->_preparedStatements, "objectForKey:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16));
      }
      uint64_t v5 = [(NSMapTable *)v3 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v5);
  }

  preparedStatements = self->_preparedStatements;
  self->_preparedStatements = 0;

  db = self->_db;
  if (db)
  {
    int v10 = sqlite3_close(db);
    if (v10)
    {
      int v11 = v10;
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
      {
        BOOL v13 = self->_db;
        uint64_t v14 = log;
        id v15 = sqlite3_errmsg(v13);
        *(_DWORD *)buf = 67109378;
        int v21 = v11;
        __int16 v22 = 2082;
        id v23 = v15;
        _os_log_debug_impl(&dword_188D96000, v14, OS_LOG_TYPE_DEBUG, "Failed to close db %d %{public}s", buf, 0x12u);
      }
    }
    self->_db = 0;
  }
}

- (void)dealloc
{
  atomic_load((unsigned __int8 *)&self->_didTearDown);
  v2.receiver = self;
  v2.super_class = (Class)GEOSQLiteDB;
  [(GEOSQLiteDB *)&v2 dealloc];
}

- (void)_debug_unlockDB:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __31__GEOSQLiteDB__debug_unlockDB___block_invoke;
  v3[3] = &unk_1E53D79D8;
  v3[4] = self;
  [(GEOSQLiteDB *)self executeAsync:v3];
}

uint64_t __31__GEOSQLiteDB__debug_unlockDB___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v2 = sqlite3_exec(*(sqlite3 **)(*(void *)(a1 + 32) + 48), "PRAGMA locking_mode = NORMAL;", 0, 0, 0);
  uint64_t v3 = *(void *)(a1 + 32);
  if (v2)
  {
    int v4 = v2;
    uint64_t v5 = *(NSObject **)(v3 + 8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      id v7 = *(sqlite3 **)(v3 + 48);
      id v8 = v5;
      v9[0] = 67109378;
      v9[1] = v4;
      __int16 v10 = 2082;
      int v11 = sqlite3_errmsg(v7);
      _os_log_debug_impl(&dword_188D96000, v8, OS_LOG_TYPE_DEBUG, "set locking_mode failure %d %{public}s", (uint8_t *)v9, 0x12u);

      uint64_t v3 = *(void *)(a1 + 32);
    }
  }
  return sqlite3_exec(*(sqlite3 **)(v3 + 48), "SELECT name FROM sqlite_master WHERE type='table';", 0, 0, 0);
}

- (void)_debug_lockDB:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __29__GEOSQLiteDB__debug_lockDB___block_invoke;
  v3[3] = &unk_1E53D79D8;
  v3[4] = self;
  [(GEOSQLiteDB *)self executeAsync:v3];
}

void __29__GEOSQLiteDB__debug_lockDB___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v2 = sqlite3_exec(*(sqlite3 **)(*(void *)(a1 + 32) + 48), "PRAGMA locking_mode = EXCLUSIVE;", 0, 0, 0);
  if (v2)
  {
    int v3 = v2;
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(NSObject **)(v4 + 8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v6 = *(sqlite3 **)(v4 + 48);
      id v7 = v5;
      v8[0] = 67109378;
      v8[1] = v3;
      __int16 v9 = 2082;
      __int16 v10 = sqlite3_errmsg(v6);
      _os_log_debug_impl(&dword_188D96000, v7, OS_LOG_TYPE_DEBUG, "set locking_mode failure %d %{public}s", (uint8_t *)v8, 0x12u);
    }
  }
}

- (BOOL)registerVirtualTable:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_db)
  {
    uint64_t v5 = [v4 name];
    uint64_t v6 = [v5 stringByAppendingString:@"_module_"];

    db = self->_db;
    id v8 = v6;
    if (sqlite3_create_module(db, (const char *)[v8 UTF8String], (const sqlite3_module *)objc_msgSend(v4, "module"), v4))
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      {
        uint64_t v34 = log;
        v35 = [v4 name];
        id v36 = sqlite3_errmsg(self->_db);
        *(_DWORD *)buf = 138543618;
        *(void *)long long v40 = v35;
        *(_WORD *)&v40[8] = 2082;
        *(void *)&v40[10] = v36;
        _os_log_error_impl(&dword_188D96000, v34, OS_LOG_TYPE_ERROR, "Error registering module for virtual table: %{public}@. %{public}s", buf, 0x16u);
      }
      BOOL v10 = 0;
    }
    else
    {
      uint64_t v11 = NSString;
      uint64_t v12 = [v4 name];
      BOOL v13 = [v11 stringWithFormat:@"DROP TABLE IF EXISTS %@;", v12];

      uint64_t v14 = self->_db;
      id v15 = v13;
      int v16 = sqlite3_exec(v14, (const char *)[v15 UTF8String], 0, 0, 0);
      if (v16)
      {
        int v17 = v16;
        long long v18 = self->_log;
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          long long v37 = self->_db;
          long long v38 = v18;
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)long long v40 = v17;
          *(_WORD *)&v40[4] = 2082;
          *(void *)&v40[6] = sqlite3_errmsg(v37);
          _os_log_error_impl(&dword_188D96000, v38, OS_LOG_TYPE_ERROR, "table drop failure: %d %{public}s", buf, 0x12u);
        }
      }
      long long v19 = NSString;
      uint64_t v20 = [v4 name];
      int v21 = [v19 stringWithFormat:@"CREATE VIRTUAL TABLE %@ USING %@;", v20, v8];

      __int16 v22 = self->_db;
      id v23 = v21;
      int v24 = sqlite3_exec(v22, (const char *)[v23 UTF8String], 0, 0, 0);
      BOOL v10 = v24 == 0;
      if (v24)
      {
        int v25 = v24;
        uint64_t v26 = self->_log;
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          char v27 = self->_db;
          long long v28 = v26;
          long long v29 = sqlite3_errmsg(v27);
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)long long v40 = v25;
          *(_WORD *)&v40[4] = 2082;
          *(void *)&v40[6] = v29;
          _os_log_error_impl(&dword_188D96000, v28, OS_LOG_TYPE_ERROR, "table create failure: %d %{public}s", buf, 0x12u);
        }
      }
      else
      {
        virtualTables = self->_virtualTables;
        if (!virtualTables)
        {
          id v31 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
          id v32 = self->_virtualTables;
          self->_virtualTables = v31;

          virtualTables = self->_virtualTables;
        }
        [(NSMapTable *)virtualTables setObject:v8 forKey:v4];
      }
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)unregisterVirtualTable:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_db)
  {
    [(NSMapTable *)self->_virtualTables removeObjectForKey:v4];
    uint64_t v5 = NSString;
    uint64_t v6 = [v4 name];
    id v7 = [v5 stringWithFormat:@"DROP TABLE IF EXISTS %@;", v6];

    db = self->_db;
    id v9 = v7;
    int v10 = sqlite3_exec(db, (const char *)[v9 UTF8String], 0, 0, 0);
    BOOL v11 = v10 == 0;
    if (v10)
    {
      int v12 = v10;
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
      {
        id v15 = self->_db;
        int v16 = log;
        *(_DWORD *)buf = 67109378;
        int v18 = v12;
        __int16 v19 = 2082;
        uint64_t v20 = sqlite3_errmsg(v15);
        _os_log_debug_impl(&dword_188D96000, v16, OS_LOG_TYPE_DEBUG, "drop failure: %d %{public}s", buf, 0x12u);
      }
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)createIndex:(const char *)a3
{
  return [(GEOSQLiteDB *)self createTable:a3 withDrop:0];
}

- (id)getAllTables
{
  return [(GEOSQLiteDB *)self getTablesLike:&stru_1ED51F370];
}

- (BOOL)dropAllTables
{
  if ([(GEOSQLiteDB *)self dropTablesLike:&stru_1ED51F370])
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    BOOL v3 = [(GEOSQLiteDB *)self deleteAllDBFiles];
    if (v3) {
      LOBYTE(v3) = [(GEOSQLiteDB *)self _openAndConfigure] == 0;
    }
  }
  return v3;
}

- (BOOL)dropTablesLike:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_db)
  {
    uint64_t v5 = [(GEOSQLiteDB *)self getTablesLike:v4];
    if ([v5 count])
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      _DWORD v8[2] = __30__GEOSQLiteDB_dropTablesLike___block_invoke;
      v8[3] = &unk_1E53DD5B8;
      id v9 = v5;
      int v10 = self;
      BOOL v6 = [(GEOSQLiteDB *)self executeInTransaction:v8];
    }
    else
    {
      BOOL v6 = v5 != 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

uint64_t __30__GEOSQLiteDB_dropTablesLike___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v14;
    while (2)
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(NSString, "stringWithFormat:", @"DROP TABLE %@;",
        id v7 = *(void *)(*((void *)&v13 + 1) + 8 * v6));
        id v8 = *(sqlite3 **)(*(void *)(a1 + 40) + 48);
        id v9 = v7;
        uint64_t v10 = sqlite3_exec(v8, (const char *)[v9 UTF8String], 0, 0, 0);
        if (v10)
        {
          [*(id *)(a1 + 40) reportSQLiteErrorCode:v10 method:@"dropTablesLike:" error:0];

          uint64_t v11 = 0;
          goto LABEL_11;
        }

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  uint64_t v11 = 1;
LABEL_11:

  return v11;
}

- (void)clearStatement:(id)a3
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_db)
  {
    uint64_t v4 = [(NSMapTable *)self->_preparedStatements objectForKey:v6];
    if (v4)
    {
      uint64_t v5 = v4;
      [(NSMapTable *)self->_preparedStatements removeObjectForKey:v6];
      sqlite3_finalize(v5);
    }
  }
}

- (BOOL)bindBlobNoCopyParameter:(const char *)a3 toValue:(id)a4 inStatement:(sqlite3_stmt *)a5 error:(id *)a6
{
  id v10 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __65__GEOSQLiteDB_bindBlobNoCopyParameter_toValue_inStatement_error___block_invoke;
  v13[3] = &unk_1E53DD5E0;
  id v14 = v10;
  long long v15 = a5;
  id v11 = v10;
  LOBYTE(a6) = [(GEOSQLiteDB *)self _bindParameter:a3 inStatement:a5 error:a6 withBinder:v13];

  return (char)a6;
}

uint64_t __65__GEOSQLiteDB_bindBlobNoCopyParameter_toValue_inStatement_error___block_invoke(uint64_t a1, int a2)
{
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(sqlite3_stmt **)(a1 + 40);
  if (v4)
  {
    id v6 = (const void *)[v4 bytes];
    int v7 = [*(id *)(a1 + 32) length];
    return sqlite3_bind_blob(v5, a2, v6, v7, 0);
  }
  else
  {
    id v9 = *(sqlite3_stmt **)(a1 + 40);
    return sqlite3_bind_null(v9, a2);
  }
}

- (BOOL)bindZeroBlobParameter:(const char *)a3 length:(unint64_t)a4 inStatement:(sqlite3_stmt *)a5 error:(id *)a6
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__GEOSQLiteDB_bindZeroBlobParameter_length_inStatement_error___block_invoke;
  v7[3] = &__block_descriptor_48_e8_i12__0i8l;
  v7[4] = a5;
  void v7[5] = a4;
  return [(GEOSQLiteDB *)self _bindParameter:a3 inStatement:a5 error:a6 withBinder:v7];
}

uint64_t __62__GEOSQLiteDB_bindZeroBlobParameter_length_inStatement_error___block_invoke(uint64_t a1, int a2)
{
  return sqlite3_bind_zeroblob64(*(sqlite3_stmt **)(a1 + 32), a2, *(void *)(a1 + 40));
}

- (BOOL)bindNullParameter:(const char *)a3 inStatement:(sqlite3_stmt *)a4 error:(id *)a5
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__GEOSQLiteDB_bindNullParameter_inStatement_error___block_invoke;
  v6[3] = &__block_descriptor_40_e8_i12__0i8l;
  v6[4] = a4;
  return [(GEOSQLiteDB *)self _bindParameter:a3 inStatement:a4 error:a5 withBinder:v6];
}

uint64_t __51__GEOSQLiteDB_bindNullParameter_inStatement_error___block_invoke(uint64_t a1, int a2)
{
  return sqlite3_bind_null(*(sqlite3_stmt **)(a1 + 32), a2);
}

- (BOOL)bindRealParameter:(const char *)a3 toValue:(double)a4 inStatement:(sqlite3_stmt *)a5 error:(id *)a6
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__GEOSQLiteDB_bindRealParameter_toValue_inStatement_error___block_invoke;
  v7[3] = &__block_descriptor_48_e8_i12__0i8l;
  v7[4] = a5;
  *(double *)&void v7[5] = a4;
  return [(GEOSQLiteDB *)self _bindParameter:a3 inStatement:a5 error:a6 withBinder:v7];
}

uint64_t __59__GEOSQLiteDB_bindRealParameter_toValue_inStatement_error___block_invoke(uint64_t a1, int a2)
{
  return sqlite3_bind_double(*(sqlite3_stmt **)(a1 + 32), a2, *(double *)(a1 + 40));
}

- (BOOL)executeStatement:(sqlite3_stmt *)a3 error:(id *)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_db) {
    return 0;
  }
  uint64_t v7 = sqlite3_step(a3);
  if (v7 != 101)
  {
    [(GEOSQLiteDB *)self reportSQLiteErrorCode:v7 method:@"step" error:a4];
    return 0;
  }
  uint64_t v8 = sqlite3_reset(a3);
  if (v8)
  {
    uint64_t v9 = v8;
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      db = self->_db;
      long long v13 = log;
      v14[0] = 67109378;
      v14[1] = v9;
      __int16 v15 = 2082;
      long long v16 = sqlite3_errmsg(db);
      _os_log_error_impl(&dword_188D96000, v13, OS_LOG_TYPE_ERROR, "reset failure: %d %{public}s", (uint8_t *)v14, 0x12u);
    }
    [(GEOSQLiteDB *)self _deleteAndReopenDatabaseIfCorrupt:v9];
    return 0;
  }
  return 1;
}

- (BOOL)vacuum
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_db) {
    return 0;
  }
  if (![(NSMapTable *)self->_preparedStatements objectForKey:@"_vacuum"]) {
    [(GEOSQLiteDB *)self prepareStatement:"VACUUM" forKey:@"_vacuum"];
  }

  return [(GEOSQLiteDB *)self executeStatement:@"_vacuum" statementBlock:&__block_literal_global_149];
}

uint64_t __21__GEOSQLiteDB_vacuum__block_invoke()
{
  return 1;
}

- (BOOL)ensureInTransaction:(id)a3
{
  uint64_t v4 = (uint64_t (**)(void))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_db)
  {
    if (self->_isInTransaction) {
      char v5 = v4[2](v4);
    }
    else {
      char v5 = [(GEOSQLiteDB *)self executeInTransaction:v4];
    }
    BOOL v6 = v5;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)addTransactionPostCommitAction:(id)a3
{
  id v9 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_db && self->_isInTransaction)
  {
    currentTransactionPostCommitActions = self->_currentTransactionPostCommitActions;
    if (!currentTransactionPostCommitActions)
    {
      char v5 = [MEMORY[0x1E4F1CA48] array];
      BOOL v6 = self->_currentTransactionPostCommitActions;
      self->_currentTransactionPostCommitActions = v5;

      currentTransactionPostCommitActions = self->_currentTransactionPostCommitActions;
    }
    uint64_t v7 = (void *)[v9 copy];
    uint64_t v8 = (void *)MEMORY[0x18C120660]();
    [(NSMutableArray *)currentTransactionPostCommitActions addObject:v8];
  }
}

- (double)doubleForColumn:(int)a3 inStatment:(sqlite3_stmt *)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_db) {
    return 0.0;
  }

  return sqlite3_column_double(a4, a3);
}

- (BOOL)reportSQLiteErrorCode:(int)a3 method:(id)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a3;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  db = self->_db;
  if (db)
  {
    id v10 = sqlite3_errmsg(db);
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = self->_db;
      uint64_t v21 = log;
      *(_DWORD *)buf = 138412802;
      id v25 = v8;
      __int16 v26 = 2080;
      char v27 = v10;
      __int16 v28 = 1024;
      int v29 = sqlite3_extended_errcode(v20);
      _os_log_error_impl(&dword_188D96000, v21, OS_LOG_TYPE_ERROR, "%@ failure: %s (%d)", buf, 0x1Cu);
    }
    int v12 = [NSString stringWithCString:v10 encoding:4];
    long long v13 = [NSString stringWithFormat:@"%@ failure: %s", v8, v10];
    id v14 = (id)*MEMORY[0x1E4F1D138];
    v22[0] = v14;
    v22[1] = @"method";
    v23[0] = v13;
    v23[1] = v8;
    v22[2] = @"returnCode";
    __int16 v15 = [NSNumber numberWithInt:v6];
    v22[3] = @"returnMessage";
    v23[2] = v15;
    v23[3] = v12;
    long long v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:4];

    uint64_t v17 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-17 userInfo:v16];
    lastError = self->_lastError;
    self->_lastError = v17;

    if (a5) {
      *a5 = self->_lastError;
    }
  }
  return 0;
}

- (BOOL)moveExternalResourceAtURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  queue = self->_queue;
  id v8 = a4;
  id v9 = a3;
  dispatch_assert_queue_V2(queue);
  if (self->_isInTransaction)
  {
    filesAddedDuringTransaction = self->_filesAddedDuringTransaction;
    if (!filesAddedDuringTransaction)
    {
      id v11 = [MEMORY[0x1E4F1CA48] array];
      int v12 = self->_filesAddedDuringTransaction;
      self->_filesAddedDuringTransaction = v11;

      filesAddedDuringTransaction = self->_filesAddedDuringTransaction;
    }
    [(NSMutableArray *)filesAddedDuringTransaction addObject:v8];
  }
  long long v13 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v14 = [v13 moveItemAtURL:v9 toURL:v8 error:0];

  return v14;
}

- (BOOL)deleteExternalResourceAtURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_isInTransaction)
  {
    filesDeletedDuringTransaction = self->_filesDeletedDuringTransaction;
    if (!filesDeletedDuringTransaction)
    {
      id v8 = [MEMORY[0x1E4F1CA48] array];
      id v9 = self->_filesDeletedDuringTransaction;
      self->_filesDeletedDuringTransaction = v8;

      filesDeletedDuringTransaction = self->_filesDeletedDuringTransaction;
    }
    [(NSMutableArray *)filesDeletedDuringTransaction addObject:v6];
    char v10 = 1;
  }
  else
  {
    id v11 = [MEMORY[0x1E4F28CB8] defaultManager];
    char v10 = [v11 removeItemAtURL:v6 error:a4];
  }
  return v10;
}

- (int64_t)lastInsertRowID
{
  id v2 = [(GEOSQLiteDB *)self sqliteDB];

  return sqlite3_last_insert_rowid(v2);
}

uint64_t __56__GEOSQLiteDB_writeBlobData_toTable_column_rowID_error___block_invoke(uint64_t a1, const void *a2, int iOffset, int n, unsigned char *a5)
{
  uint64_t result = sqlite3_blob_write(*(sqlite3_blob **)(a1 + 48), a2, n, iOffset);
  if (result)
  {
    uint64_t result = [*(id *)(a1 + 32) reportSQLiteErrorCode:result method:@"blob_write" error:*(void *)(a1 + 56)];
    *a5 = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  return result;
}

- (NSURL)databaseFileURL
{
  return self->_databaseFileURL;
}

- (sqlite3)sqliteDB
{
  return self->_db;
}

- (int)sqliteFlags
{
  return self->_sqliteFlags;
}

- (NSError)lastError
{
  return self->_lastError;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_virtualTables, 0);
  objc_storeStrong((id *)&self->_currentTransactionPostCommitActions, 0);
  objc_storeStrong((id *)&self->_filesDeletedDuringTransaction, 0);
  objc_storeStrong((id *)&self->_filesAddedDuringTransaction, 0);
  objc_storeStrong((id *)&self->_preparedStatements, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_tearDownBlock, 0);
  objc_storeStrong(&self->_setupBlock, 0);
  objc_storeStrong((id *)&self->_pragmas, 0);
  objc_storeStrong((id *)&self->_databaseFileURL, 0);
  objc_storeStrong((id *)&self->_lastError, 0);
  objc_storeStrong((id *)&self->_externalFilesActiveChannels, 0);
  objc_storeStrong((id *)&self->_externalFilesGroup, 0);
  objc_storeStrong((id *)&self->_externalFilesQueue, 0);

  objc_storeStrong((id *)&self->_log, 0);
}

- (void)_writeTransactionExternalResourceWithData:(id)a3 toURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6 && v7)
  {
    dispatch_group_enter((dispatch_group_t)self->_externalFilesGroup);
    id v9 = v8;
    char v10 = (const char *)[v9 fileSystemRepresentation];
    externalFilesQueue = self->_externalFilesQueue;
    cleanup_handler[0] = MEMORY[0x1E4F143A8];
    cleanup_handler[1] = 3221225472;
    cleanup_handler[2] = __77__GEOSQLiteDB_ExternalFile___writeTransactionExternalResourceWithData_toURL___block_invoke;
    cleanup_handler[3] = &unk_1E53E2238;
    cleanup_handler[4] = self;
    dispatch_io_t v12 = dispatch_io_create_with_path(1uLL, v10, 2561, 0x1A0u, externalFilesQueue, cleanup_handler);
    if (v12)
    {
      uint64_t v13 = [(GEOSQLiteDB *)self sqliteFlags];
      char v14 = (id *)MEMORY[0x1E4F1C598];
      unsigned int v15 = ((v13 & 0x700000) - 0x100000) >> 20;
      long long v16 = (id *)MEMORY[0x1E4F1C598];
      if (v15 <= 2) {
        long long v16 = (id *)qword_1E53F70F8[v15];
      }
      id v17 = *v16;
      if (v17 != *v14)
      {
        barrier[0] = MEMORY[0x1E4F143A8];
        barrier[1] = 3221225472;
        barrier[2] = __77__GEOSQLiteDB_ExternalFile___writeTransactionExternalResourceWithData_toURL___block_invoke_2;
        barrier[3] = &unk_1E53D8AF8;
        dispatch_io_t v29 = v12;
        id v30 = v9;
        id v31 = v17;
        id v32 = self;
        dispatch_io_barrier(v29, barrier);
      }
      uint64_t v18 = self->_externalFilesQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __77__GEOSQLiteDB_ExternalFile___writeTransactionExternalResourceWithData_toURL___block_invoke_3;
      block[3] = &unk_1E53D8998;
      block[4] = self;
      __int16 v19 = v12;
      char v27 = v19;
      dispatch_sync(v18, block);
      uint64_t v20 = [v6 _GEOCreateDispatchData];
      dispatch_group_enter((dispatch_group_t)self->_externalFilesGroup);
      uint64_t v21 = self->_externalFilesQueue;
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __77__GEOSQLiteDB_ExternalFile___writeTransactionExternalResourceWithData_toURL___block_invoke_2_4;
      v24[3] = &unk_1E53F70D8;
      v24[4] = self;
      dispatch_io_t v25 = v19;
      dispatch_io_write(v25, 0, v20, v21, v24);
    }
    else
    {
      __int16 v22 = self->_externalFilesQueue;
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __77__GEOSQLiteDB_ExternalFile___writeTransactionExternalResourceWithData_toURL___block_invoke_2;
      v34[3] = &unk_1E53D79D8;
      v34[4] = self;
      dispatch_sync(v22, v34);
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_188D96000, log, OS_LOG_TYPE_ERROR, "Unable to create channel for external resource.", buf, 2u);
      }
      dispatch_group_leave((dispatch_group_t)self->_externalFilesGroup);
    }
  }
}

void __77__GEOSQLiteDB_ExternalFile___writeTransactionExternalResourceWithData_toURL___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    [*(id *)(a1 + 32) _channelCleanupFailedWithError:a2];
  }
  uint64_t v3 = *(NSObject **)(*(void *)(a1 + 32) + 24);

  dispatch_group_leave(v3);
}

uint64_t __77__GEOSQLiteDB_ExternalFile___writeTransactionExternalResourceWithData_toURL___block_invoke_2(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 40) = 1;
  return result;
}

void __77__GEOSQLiteDB_ExternalFile___writeTransactionExternalResourceWithData_toURL___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  dispatch_io_get_descriptor(*(dispatch_io_t *)(a1 + 32));
  id v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *MEMORY[0x1E4F1C590];
  id v8 = 0;
  [v2 setResourceValue:v3 forKey:v4 error:&v8];
  id v5 = v8;
  if (v5)
  {
    id v6 = *(NSObject **)(*(void *)(a1 + 56) + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      uint64_t v10 = v7;
      __int16 v11 = 2112;
      id v12 = v5;
      _os_log_error_impl(&dword_188D96000, v6, OS_LOG_TYPE_ERROR, "Error setting file protection on \"%@\": %@", buf, 0x16u);
    }
  }
}

void __77__GEOSQLiteDB_ExternalFile___writeTransactionExternalResourceWithData_toURL___block_invoke_3(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 32);
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    [v2 addObject:v3];
  }
  else
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA48] arrayWithObject:*(void *)(a1 + 40)];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v4;
  }
}

void __77__GEOSQLiteDB_ExternalFile___writeTransactionExternalResourceWithData_toURL___block_invoke_2_4(uint64_t a1, int a2, void *a3, uint64_t a4)
{
  id v7 = a3;
  if (a4) {
    [*(id *)(a1 + 32) _channelEncounteredError:a4];
  }
  if (a2)
  {
    [*(id *)(a1 + 32) _doneWritingToChannel:*(void *)(a1 + 40)];
    dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 24));
  }
}

- (void)_doneWritingToChannel:(id)a3
{
  uint64_t v4 = a3;
  dispatch_io_close(v4, 0);
  [(NSMutableArray *)self->_externalFilesActiveChannels removeObject:v4];
}

- (void)_channelCleanupFailedWithError:(int)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  self->_didEncounterExternalResourceErrorInTransaction = 1;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
  {
    v5[0] = 67109120;
    v5[1] = a3;
    _os_log_error_impl(&dword_188D96000, log, OS_LOG_TYPE_ERROR, "Error during channel cleanup for external resource: %{errno}d", (uint8_t *)v5, 8u);
  }
}

- (void)_channelEncounteredError:(int)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  self->_didEncounterExternalResourceErrorInTransaction = 1;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
  {
    v5[0] = 67109120;
    v5[1] = a3;
    _os_log_error_impl(&dword_188D96000, log, OS_LOG_TYPE_ERROR, "Error while writing to channel for external resource: %{errno}d", (uint8_t *)v5, 8u);
  }
}

@end