@interface BCSPersistentStore
+ (const)debugQueueName;
- (BCSPersistentStore)init;
- (BOOL)deleteDatabaseFile;
- (const)schema;
- (id)databasePath;
- (int64_t)schemaVersion;
- (sqlite3)openedDatabase;
- (void)beginBatch;
- (void)dealloc;
- (void)endBatch;
@end

@implementation BCSPersistentStore

+ (const)debugQueueName
{
  return "com.apple.businesschat.persistentStore";
}

- (BCSPersistentStore)init
{
  v8.receiver = self;
  v8.super_class = (Class)BCSPersistentStore;
  v2 = [(BCSPersistentStore *)&v8 init];
  v3 = v2;
  if (v2)
  {
    v2->_batchCount = 0;
    v4 = objc_msgSend(NSString, "stringWithUTF8String:", objc_msgSend((id)objc_opt_class(), "debugQueueName"));
    uint64_t Serial = BSDispatchQueueCreateSerial();
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)Serial;
  }
  return v3;
}

- (void)dealloc
{
  if (self->_batchCount >= 1)
  {
    v3 = ABSLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_2154F4000, v3, OS_LOG_TYPE_ERROR, "Dealloc'ing BCSPersistentStore with an unbalanced batchCount", buf, 2u);
    }
  }
  v4.receiver = self;
  v4.super_class = (Class)BCSPersistentStore;
  [(BCSPersistentStore *)&v4 dealloc];
}

- (BOOL)deleteDatabaseFile
{
  v3 = [MEMORY[0x263F08850] defaultManager];
  objc_super v4 = [(BCSPersistentStore *)self databasePath];
  char v5 = [v3 removeItemAtPath:v4 error:0];

  return v5;
}

void __51__BCSPersistentStore_queue_openDatabaseIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a2;
  objc_super v4 = ABSLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)ppDb = 138412290;
    *(void *)&ppDb[4] = v3;
    _os_log_debug_impl(&dword_2154F4000, v4, OS_LOG_TYPE_DEBUG, "Creating database at path: %@", ppDb, 0xCu);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (!v5) {
    goto LABEL_20;
  }
  v6 = *(NSObject **)(v5 + 24);
  id v7 = *(id *)(a1 + 40);
  dispatch_assert_queue_V2(v6);
  *(void *)ppDb = 0;
  id v8 = v7;
  v9 = (const char *)[v8 UTF8String];

  v10 = sqlite3_open_v2(v9, (sqlite3 **)ppDb, 65542, 0) ? 0 : *(sqlite3 **)ppDb;
  v11 = *(dispatch_queue_t **)(a1 + 32);
  if (v11)
  {
    dispatch_assert_queue_V2(v11[3]);
    int v12 = sqlite3_exec(v10, (const char *)[(dispatch_queue_t *)v11 schema], 0, 0, 0);
    v13 = *(dispatch_queue_t **)(a1 + 32);
    uint64_t v14 = [(dispatch_queue_t *)v13 schemaVersion];
    if (v13)
    {
      uint64_t v15 = v14;
      dispatch_assert_queue_V2(v13[3]);
      ppStmt = 0;
      objc_msgSend(NSString, "stringWithFormat:", @"PRAGMA user_version=%ld", v15);
      id v16 = objc_claimAutoreleasedReturnValue();
      v17 = (const char *)[v16 UTF8String];

      if (!sqlite3_prepare_v2(v10, v17, -1, &ppStmt, 0))
      {
        if (sqlite3_step(ppStmt) == 101)
        {
          sqlite3_finalize(ppStmt);
          if (!v12)
          {
            *(void *)(*(void *)(a1 + 32) + 8) = v10;
            goto LABEL_19;
          }
        }
        else
        {
          v18 = ABSLogCommon();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)ppDb = 134217984;
            *(void *)&ppDb[4] = v15;
            _os_log_error_impl(&dword_2154F4000, v18, OS_LOG_TYPE_ERROR, "Error while setting database to schema version:%ld", ppDb, 0xCu);
          }
        }
      }
    }
  }
  else
  {
LABEL_20:
    [0 schemaVersion];
  }
  v19 = ABSLogCommon();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)ppDb = 138412290;
    *(void *)&ppDb[4] = v3;
    _os_log_error_impl(&dword_2154F4000, v19, OS_LOG_TYPE_ERROR, "Failed to create database at path:%@", ppDb, 0xCu);
  }

  v20 = [MEMORY[0x263F08850] defaultManager];
  [v20 removeItemAtPath:*(void *)(a1 + 40) error:0];

LABEL_19:
}

- (void)beginBatch
{
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __32__BCSPersistentStore_beginBatch__block_invoke;
  block[3] = &unk_264248CD8;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __32__BCSPersistentStore_beginBatch__block_invoke(uint64_t a1)
{
  errmsg[1] = *(char **)MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    uint64_t v2 = *(void *)(v1 + 16);
    if (v2)
    {
LABEL_18:
      *(void *)(v1 + 16) = v2 + 1;
      return;
    }
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v1 + 24));
    if (!*(void *)(v1 + 8))
    {
      objc_super v4 = [(id)v1 databasePath];
      ppDb = 0;
      *(void *)buf = MEMORY[0x263EF8330];
      *(void *)&buf[8] = 3221225472;
      *(void *)&uint8_t buf[16] = __51__BCSPersistentStore_queue_openDatabaseIfNecessary__block_invoke;
      v21 = &unk_264248CB0;
      uint64_t v22 = v1;
      id v5 = v4;
      id v23 = v5;
      v6 = (void (**)(void, void))MEMORY[0x2166BDB40](buf);
      id v7 = [MEMORY[0x263F08850] defaultManager];
      char v8 = [v7 fileExistsAtPath:v5];

      if (v8)
      {
        id v9 = v5;
        int v10 = sqlite3_open_v2((const char *)[v9 UTF8String], &ppDb, 65538, 0);
        if (v10)
        {
          int v11 = v10;
          int v12 = ABSLogCommon();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            LODWORD(errmsg[0]) = 67109120;
            HIDWORD(errmsg[0]) = v11;
            _os_log_error_impl(&dword_2154F4000, v12, OS_LOG_TYPE_ERROR, "Failed to open database: %d", (uint8_t *)errmsg, 8u);
          }
        }
        else
        {
          uint64_t v15 = ppDb;
          dispatch_assert_queue_V2(*(dispatch_queue_t *)(v1 + 24));
          if (v15)
          {
            errmsg[0] = 0;
            int v16 = -1;
            if (!sqlite3_prepare_v2(v15, "PRAGMA user_version", -1, (sqlite3_stmt **)errmsg, 0))
            {
              if (sqlite3_step((sqlite3_stmt *)errmsg[0]) == 100)
              {
                do
                  int v16 = sqlite3_column_int((sqlite3_stmt *)errmsg[0], 0);
                while (sqlite3_step((sqlite3_stmt *)errmsg[0]) == 100);
              }
              else
              {
                int v16 = -1;
              }
              sqlite3_finalize((sqlite3_stmt *)errmsg[0]);
            }
          }
          else
          {
            int v16 = -1;
          }
          uint64_t v17 = [(id)v1 schemaVersion];
          if (v17 == v16)
          {
            *(void *)(v1 + 8) = ppDb;
          }
          else
          {
            uint64_t v18 = v17;
            [(id)v1 schemaVersionWillChangeForDatabase:ppDb fromSchemaVersion:v16 toSchemaVersion:v17];
            ((void (**)(void, id))v6)[2](v6, v9);
            [(id)v1 schemaVersionDidChangeForDatabase:ppDb fromSchemaVersion:v16 toSchemaVersion:v18];
          }
        }
      }
      else
      {
        ((void (**)(void, id))v6)[2](v6, v5);
      }
    }
    uint64_t v13 = *(void *)(a1 + 32);
    if (v13)
    {
      errmsg[0] = 0;
      sqlite3_exec(*(sqlite3 **)(v13 + 8), "BEGIN TRANSACTION", 0, 0, errmsg);
      if (errmsg[0])
      {
        uint64_t v14 = ABSLogCommon();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          *(void *)&buf[4] = "-[BCSPersistentStore beginTransaction]";
          *(_WORD *)&buf[12] = 2080;
          *(char **)&buf[14] = errmsg[0];
          _os_log_error_impl(&dword_2154F4000, v14, OS_LOG_TYPE_ERROR, "%s Error on beginning sqlite transaction: %s", buf, 0x16u);
        }

        sqlite3_free(errmsg[0]);
      }
      uint64_t v1 = *(void *)(a1 + 32);
      if (v1)
      {
        uint64_t v2 = *(void *)(v1 + 16);
        goto LABEL_18;
      }
    }
  }
}

- (void)endBatch
{
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __30__BCSPersistentStore_endBatch__block_invoke;
  block[3] = &unk_264248CD8;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __30__BCSPersistentStore_endBatch__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    --*(void *)(v1 + 16);
    uint64_t v3 = *(void *)(a1 + 32);
    if (v3)
    {
      if (!*(void *)(v3 + 16))
      {
        errmsg = 0;
        sqlite3_exec(*(sqlite3 **)(v3 + 8), "END TRANSACTION", 0, 0, &errmsg);
        if (errmsg)
        {
          objc_super v4 = ABSLogCommon();
          if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            id v9 = "-[BCSPersistentStore endTransaction]";
            __int16 v10 = 2080;
            int v11 = errmsg;
            _os_log_error_impl(&dword_2154F4000, v4, OS_LOG_TYPE_ERROR, "%s Error on ending sqlite transaction: %s", buf, 0x16u);
          }

          sqlite3_free(errmsg);
        }
        uint64_t v5 = *(void *)(a1 + 32);
        if (v5)
        {
          dispatch_assert_queue_V2(*(dispatch_queue_t *)(v5 + 24));
          v6 = *(sqlite3 **)(v5 + 8);
          if (v6)
          {
            sqlite3_close(v6);
            *(void *)(v5 + 8) = 0;
          }
        }
      }
    }
  }
}

- (id)databasePath
{
  return 0;
}

- (int64_t)schemaVersion
{
  return -1;
}

- (const)schema
{
  return 0;
}

- (sqlite3)openedDatabase
{
  return self->_openedDatabase;
}

- (void).cxx_destruct
{
}

@end