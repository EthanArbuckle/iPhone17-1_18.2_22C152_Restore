@interface GEONavdCachePersistenceManager
- (GEONavdCachePersistenceManager)init;
- (double)nextTimeStampForRefreshTimer;
- (id)entryWithRowId:(int64_t)a3;
- (id)readValueWithKey:(id)a3;
- (int64_t)dumpToDiskWithKey:(id)a3 value:(id)a4;
- (int64_t)numberOfEntries;
- (void)deleteFromDiskWithKey:(id)a3;
- (void)enumerateAllEntriesWithHandler:(id)a3;
- (void)enumerateAllForCacheEntriesWithHandler:(id)a3;
- (void)removeAllEntries;
- (void)tearDown;
@end

@implementation GEONavdCachePersistenceManager

- (GEONavdCachePersistenceManager)init
{
  v20.receiver = self;
  v20.super_class = (Class)GEONavdCachePersistenceManager;
  v2 = [(GEONavdCachePersistenceManager *)&v20 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28CB8] defaultManager];
    v4 = NSHomeDirectory();
    v5 = [v4 stringByAppendingPathComponent:@"Library/Caches/com.apple.navd"];
    v6 = [v5 stringByAppendingPathComponent:@"navd.cache"];
    [v3 removeItemAtPath:v6 error:0];

    v7 = [v5 stringByAppendingPathComponent:@"navd.cache-shm"];
    [v3 removeItemAtPath:v7 error:0];

    v8 = [v5 stringByAppendingPathComponent:@"navd.cache-wal"];
    [v3 removeItemAtPath:v8 error:0];

    v9 = [v5 stringByAppendingPathComponent:@"navd"];
    [v3 removeItemAtPath:v9 error:0];

    v10 = [v4 stringByAppendingPathComponent:@"Library/Maps"];
    v11 = [v10 stringByAppendingPathComponent:@"navd.cache"];
    [v3 removeItemAtPath:v11 error:0];

    v12 = [v10 stringByAppendingPathComponent:@"navd.cache-shm"];
    [v3 removeItemAtPath:v12 error:0];

    v13 = [v10 stringByAppendingPathComponent:@"navd.cache-wal"];
    [v3 removeItemAtPath:v13 error:0];

    v14 = [v10 stringByAppendingPathComponent:@"navd"];
    [v3 removeItemAtPath:v14 error:0];

    v15 = [GEOSQLiteDB alloc];
    v16 = GEOGetGEONavdCachePersistenceManagerLog();
    uint64_t v17 = [(GEOSQLiteDB *)v15 initWithQueueName:"com.apple.navd.GEONavdCachePersistenceManager" log:v16 databaseFileURL:0 sqliteFlags:128 pragmas:0 setupBlock:&__block_literal_global_16];
    db = v2->_db;
    v2->_db = (GEOSQLiteDB *)v17;
  }
  return v2;
}

uint64_t __38__GEONavdCachePersistenceManager_init__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = GEOGetGEONavdCachePersistenceManagerLog();
  id v4 = v2;
  if (objc_msgSend(v4, "createTable:withDrop:", "CREATE TABLE IF NOT EXISTS cache(   rowid INTEGER PRIMARY KEY NOT NULL,    hash INT NOT NULL,    key BLOB NOT NULL,    value BLOB NOT NULL,    refresh_timestamp REAL NOT NULL   );",
                       0)
    && objc_msgSend(v4, "prepareStatement:forKey:", "INSERT OR REPLACE INTO cache    (hash, key, value, refresh_timestamp)    VALUES (@hash, @key, @value, @refresh_timestamp);",
                       @"Insert")
    && objc_msgSend(v4, "prepareStatement:forKey:", "UPDATE cache    SET hash = @hash, key = @key, value = @value, refresh_timestamp = @refresh_timestamp    WHERE rowid = @rowid;",
                       @"Update")
    && objc_msgSend(v4, "prepareStatement:forKey:", "SELECT rowid, hash, key, value, refresh_timestamp    FROM cache;",
                       @"ReadAllRows")
    && objc_msgSend(v4, "prepareStatement:forKey:", "SELECT rowid, hash, key, value, refresh_timestamp    FROM cache    WHERE rowid = @rowid;",
                       @"ReadRowWithID")
    && objc_msgSend(v4, "prepareStatement:forKey:", "SELECT rowid, hash, key, value, refresh_timestamp    FROM cache    WHERE hash = @hash;",
                       @"ReadRowWithHash")
    && objc_msgSend(v4, "prepareStatement:forKey:", "SELECT refresh_timestamp    FROM cache    WHERE refresh_timestamp >= 0    ORDER BY refresh_timestamp    LIMIT 1;",
                       @"ReadNextTimerTimestamp")
    && objc_msgSend(v4, "prepareStatement:forKey:", "DELETE FROM cache    WHERE rowid = @rowid;",
                       @"DeleteRowWithID")
    && [v4 prepareStatement:"DELETE FROM cache;" forKey:@"DeleteAllRows"])
  {
    uint64_t v5 = [v4 prepareStatement:"SELECT COUNT(*)    FROM cache;" forKey:@"CountRows"];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (void)tearDown
{
  db = self->_db;
  if (db)
  {
    id v4 = [(GEOSQLiteDB *)db isolationQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __42__GEONavdCachePersistenceManager_tearDown__block_invoke;
    block[3] = &unk_1E53D79D8;
    block[4] = self;
    dispatch_sync(v4, block);
  }
}

uint64_t __42__GEONavdCachePersistenceManager_tearDown__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) tearDown];
}

- (double)nextTimeStampForRefreshTimer
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = 0;
  v9 = (double *)&v8;
  uint64_t v10 = 0x2020000000;
  unint64_t v11 = 0xBFF0000000000000;
  db = self->_db;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__GEONavdCachePersistenceManager_nextTimeStampForRefreshTimer__block_invoke;
  v7[3] = &unk_1E53D7C00;
  v7[4] = self;
  v7[5] = &v8;
  [(GEOSQLiteDB *)db executeSync:v7];
  v3 = GEOGetGEONavdCachePersistenceManagerLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = *((void *)v9 + 3);
    *(_DWORD *)buf = 134217984;
    uint64_t v13 = v4;
    _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_DEBUG, "read next refresh timestamp:%f", buf, 0xCu);
  }

  double v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

void __62__GEONavdCachePersistenceManager_nextTimeStampForRefreshTimer__block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  uint64_t v8 = __62__GEONavdCachePersistenceManager_nextTimeStampForRefreshTimer__block_invoke_2;
  v9 = &unk_1E53DA4A8;
  uint64_t v10 = *(void *)(a1 + 40);
  id v2 = v1;
  v3 = &v6;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy__6;
  v15[4] = __Block_byref_object_dispose__6;
  id v16 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __ReadNextTimerTimestamp_block_invoke;
  v11[3] = &unk_1E53D7C78;
  id v4 = v2;
  id v12 = v4;
  double v5 = v3;
  uint64_t v13 = v5;
  uint64_t v14 = v15;
  objc_msgSend(v4, "statementForKey:statementBlock:", @"ReadNextTimerTimestamp", v11, v6, v7, v8, v9, v10);

  _Block_object_dispose(v15, 8);
}

uint64_t __62__GEONavdCachePersistenceManager_nextTimeStampForRefreshTimer__block_invoke_2(uint64_t a1, double a2)
{
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  return 0;
}

uint64_t __58__GEONavdCachePersistenceManager__threadUnsafeRowIdOfKey___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v6 = (void *)MEMORY[0x1E4F28DC0];
  id v7 = a4;
  uint64_t v8 = [v6 unarchivedObjectOfClass:objc_opt_class() fromData:v7 error:0];

  int v9 = [*(id *)(a1 + 32) isEqual:v8];
  if (v9) {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  }
  uint64_t v10 = v9 ^ 1u;

  return v10;
}

- (id)entryWithRowId:(int64_t)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = 0;
  unint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__6;
  uint64_t v14 = __Block_byref_object_dispose__6;
  id v15 = 0;
  db = self->_db;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __49__GEONavdCachePersistenceManager_entryWithRowId___block_invoke;
  v9[3] = &unk_1E53DA520;
  v9[5] = &v10;
  v9[6] = a3;
  v9[4] = self;
  [(GEOSQLiteDB *)db executeSync:v9];
  double v5 = GEOGetGEONavdCachePersistenceManagerLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = v11[5];
    *(_DWORD *)buf = 134218243;
    int64_t v17 = a3;
    __int16 v18 = 2113;
    uint64_t v19 = v6;
    _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_DEBUG, "returning entry for rowId: %lld entry:%{private}@", buf, 0x16u);
  }

  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __49__GEONavdCachePersistenceManager_entryWithRowId___block_invoke(void *a1)
{
  v1 = *(void **)(a1[4] + 8);
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  int v9 = __49__GEONavdCachePersistenceManager_entryWithRowId___block_invoke_2;
  uint64_t v10 = &unk_1E53DA4F8;
  uint64_t v2 = a1[6];
  uint64_t v11 = a1[5];
  uint64_t v12 = v2;
  id v3 = v1;
  id v4 = &v7;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__6;
  v18[4] = __Block_byref_object_dispose__6;
  id v19 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __ReadRowWithID_block_invoke;
  v13[3] = &unk_1E53D9BC8;
  id v5 = v3;
  id v16 = v18;
  uint64_t v17 = v2;
  id v14 = v5;
  uint64_t v6 = v4;
  id v15 = v6;
  objc_msgSend(v5, "statementForKey:statementBlock:", @"ReadRowWithID", v13, v7, v8, v9, v10, v11, v12);

  _Block_object_dispose(v18, 8);
}

uint64_t __49__GEONavdCachePersistenceManager_entryWithRowId___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  uint64_t v8 = (void *)MEMORY[0x1E4F28DC0];
  id v9 = a4;
  id v26 = 0;
  uint64_t v10 = [v8 unarchivedObjectOfClass:objc_opt_class() fromData:v9 error:&v26];

  id v11 = v26;
  if (v10) {
    BOOL v12 = v11 == 0;
  }
  else {
    BOOL v12 = 0;
  }
  if (v12)
  {
    id v25 = 0;
    id v14 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v7 error:&v25];
    id v17 = v25;
    uint64_t v13 = v17;
    if (v14) {
      BOOL v18 = v17 == 0;
    }
    else {
      BOOL v18 = 0;
    }
    uint64_t v16 = v18;
    if (v18)
    {
      [v14 setRowId:*(void *)(a1 + 40)];
      v27[0] = v10;
      v27[1] = v14;
      uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
      uint64_t v20 = *(void *)(*(void *)(a1 + 32) + 8);
      v21 = *(NSObject **)(v20 + 40);
      *(void *)(v20 + 40) = v19;
    }
    else
    {
      v21 = GEOGetGEONavdCachePersistenceManagerLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      {
        v23 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138412802;
        v29 = v10;
        __int16 v30 = 2048;
        v31 = v23;
        __int16 v32 = 2112;
        v33 = v13;
        _os_log_impl(&dword_188D96000, v21, OS_LOG_TYPE_FAULT, "couldn't find a value for key: %@ for rowId: %lld, error: %@", buf, 0x20u);
      }
    }
  }
  else
  {
    uint64_t v13 = v11;
    id v14 = GEOGetGEONavdCachePersistenceManagerLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      id v15 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 134218242;
      v29 = v15;
      __int16 v30 = 2112;
      v31 = v13;
      _os_log_impl(&dword_188D96000, v14, OS_LOG_TYPE_FAULT, "couldn't find a key for rowId: %lld, error: %@", buf, 0x16u);
    }
    uint64_t v16 = 0;
  }

  return v16;
}

- (int64_t)dumpToDiskWithKey:(id)a3 value:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = GEOGetGEONavdCachePersistenceManagerLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v9 = [v6 request];
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v9;
    _os_log_impl(&dword_188D96000, v8, OS_LOG_TYPE_DEBUG, "Dump to disk for request:%p", (uint8_t *)&buf, 0xCu);
  }
  if ([v7 canBePersistedToDisk])
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v20 = 0x2020000000;
    uint64_t v21 = 0;
    uint64_t v21 = [v7 rowId];
    db = self->_db;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __58__GEONavdCachePersistenceManager_dumpToDiskWithKey_value___block_invoke;
    v15[3] = &unk_1E53DA148;
    p_long long buf = &buf;
    v15[4] = self;
    id v16 = v6;
    id v17 = v7;
    [(GEOSQLiteDB *)db executeSync:v15];
    int64_t v11 = *(void *)(*((void *)&buf + 1) + 24);

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    BOOL v12 = GEOGetGEONavdCachePersistenceManagerLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v13 = [v6 request];
      LODWORD(buf) = 138477827;
      *(void *)((char *)&buf + 4) = v13;
      _os_log_impl(&dword_188D96000, v12, OS_LOG_TYPE_DEBUG, "Not persisting for request:%{private}@", (uint8_t *)&buf, 0xCu);
    }
    [(GEONavdCachePersistenceManager *)self deleteFromDiskWithKey:v6];
    int64_t v11 = -1;
  }

  return v11;
}

void __58__GEONavdCachePersistenceManager_dumpToDiskWithKey_value___block_invoke(uint64_t a1)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) == -1)
  {
    uint64_t v2 = *(void *)(a1 + 32);
    id v3 = *(id *)(a1 + 40);
    id v4 = v3;
    if (v2)
    {
      uint64_t v5 = -1;
      if (v3)
      {
        uint64_t v31 = 0;
        __int16 v32 = &v31;
        uint64_t v33 = 0x2020000000;
        uint64_t v34 = -1;
        id v6 = *(void **)(v2 + 8);
        uint64_t v7 = objc_msgSend(v3, "hash", 0);
        *(void *)&long long buf = MEMORY[0x1E4F143A8];
        *((void *)&buf + 1) = 3221225472;
        v38 = __58__GEONavdCachePersistenceManager__threadUnsafeRowIdOfKey___block_invoke;
        v39 = &unk_1E53DA4D0;
        id v40 = v4;
        v41 = &v31;
        ReadRowWithHash(v6, v7, &buf);
        uint64_t v5 = v32[3];

        _Block_object_dispose(&v31, 8);
      }
    }
    else
    {
      uint64_t v5 = 0;
    }

    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v5;
    [*(id *)(a1 + 48) setRowId:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  }
  uint64_t v8 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:*(void *)(a1 + 40) requiringSecureCoding:1 error:0];
  id v9 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:*(void *)(a1 + 48) requiringSecureCoding:1 error:0];
  uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  int64_t v11 = *(void **)(*(void *)(a1 + 32) + 8);
  uint64_t v12 = [*(id *)(a1 + 40) hash];
  [*(id *)(a1 + 48) valueRefreshTimeStamp];
  uint64_t v14 = v13;
  if (v10 == -1)
  {
    id v24 = v11;
    id v25 = v8;
    id v26 = v9;
    uint64_t v31 = 0;
    __int16 v32 = &v31;
    uint64_t v33 = 0x3032000000;
    uint64_t v34 = (uint64_t)__Block_byref_object_copy__6;
    v35 = __Block_byref_object_dispose__6;
    id v36 = 0;
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    v38 = __Insert_block_invoke;
    v39 = &unk_1E53DA598;
    id v27 = v24;
    v43 = &v31;
    uint64_t v44 = v12;
    id v40 = v27;
    v28 = (uint64_t *)v25;
    v41 = v28;
    id v29 = v26;
    id v42 = v29;
    uint64_t v45 = v14;
    LODWORD(v25) = [v27 executeStatement:@"Insert" statementBlock:&buf];

    _Block_object_dispose(&v31, 8);
    if (v25) {
      *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = sqlite3_last_insert_rowid((sqlite3 *)[*(id *)(*(void *)(a1 + 32) + 8) sqliteDB]);
    }
    uint64_t v21 = GEOGetGEONavdCachePersistenceManagerLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v30 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = v30;
      v23 = "Created new entry with rowId %lld";
      goto LABEL_13;
    }
  }
  else
  {
    id v15 = v11;
    id v16 = v8;
    id v17 = v9;
    uint64_t v31 = 0;
    __int16 v32 = &v31;
    uint64_t v33 = 0x3032000000;
    uint64_t v34 = (uint64_t)__Block_byref_object_copy__6;
    v35 = __Block_byref_object_dispose__6;
    id v36 = 0;
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    v38 = __Update_block_invoke;
    v39 = &unk_1E53DA5C0;
    id v18 = v15;
    id v40 = v18;
    v43 = &v31;
    uint64_t v44 = v10;
    uint64_t v45 = v12;
    uint64_t v19 = (uint64_t *)v16;
    v41 = v19;
    id v20 = v17;
    id v42 = v20;
    uint64_t v46 = v14;
    [v18 executeStatement:@"Update" statementBlock:&buf];

    _Block_object_dispose(&v31, 8);
    uint64_t v21 = GEOGetGEONavdCachePersistenceManagerLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v22 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = v22;
      v23 = "Updated entry with rowId %lld";
LABEL_13:
      _os_log_impl(&dword_188D96000, v21, OS_LOG_TYPE_DEBUG, v23, (uint8_t *)&buf, 0xCu);
    }
  }
}

- (id)readValueWithKey:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__6;
  id v16 = __Block_byref_object_dispose__6;
  id v17 = 0;
  db = self->_db;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __51__GEONavdCachePersistenceManager_readValueWithKey___block_invoke;
  v9[3] = &unk_1E53D7BD8;
  v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  int64_t v11 = &v12;
  [(GEOSQLiteDB *)db executeSync:v9];
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

void __51__GEONavdCachePersistenceManager_readValueWithKey___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 8);
  uint64_t v3 = [*(id *)(a1 + 40) hash];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__GEONavdCachePersistenceManager_readValueWithKey___block_invoke_2;
  v6[3] = &unk_1E53DA4D0;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  id v7 = v4;
  uint64_t v8 = v5;
  ReadRowWithHash(v2, v3, v6);
}

uint64_t __51__GEONavdCachePersistenceManager_readValueWithKey___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  id v8 = a5;
  id v9 = (void *)MEMORY[0x1E4F28DC0];
  id v10 = a4;
  id v18 = 0;
  int64_t v11 = [v9 unarchivedObjectOfClass:objc_opt_class() fromData:v10 error:&v18];

  id v12 = v18;
  if (v12 || ![*(id *)(a1 + 32) isEqual:v11])
  {
    uint64_t v16 = 0;
  }
  else
  {
    uint64_t v13 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v8 error:0];
    uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
    id v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;

    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setRowId:a2];
    uint64_t v16 = 1;
  }

  return v16;
}

- (void)deleteFromDiskWithKey:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = GEOGetGEONavdCachePersistenceManagerLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = [v4 request];
    *(_DWORD *)long long buf = 138477827;
    id v12 = v6;
    _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_DEBUG, "Delete from disk for request:%{private}@", buf, 0xCu);
  }
  db = self->_db;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56__GEONavdCachePersistenceManager_deleteFromDiskWithKey___block_invoke;
  v9[3] = &unk_1E53D8998;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [(GEOSQLiteDB *)db executeAsync:v9];
}

void __56__GEONavdCachePersistenceManager_deleteFromDiskWithKey___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 8);
  uint64_t v4 = [*(id *)(a1 + 40) hash];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __56__GEONavdCachePersistenceManager_deleteFromDiskWithKey___block_invoke_2;
  v17[3] = &unk_1E53DA548;
  id v18 = *(id *)(a1 + 40);
  id v5 = v2;
  id v19 = v5;
  ReadRowWithHash(v3, v4, v17);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id obj = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v13 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = [*(id *)(*((void *)&v13 + 1) + 8 * v8) integerValue];
        id v10 = *(id *)(*(void *)(a1 + 32) + 8);
        v24[0] = 0;
        v24[1] = v24;
        v24[2] = 0x3032000000;
        v24[3] = __Block_byref_object_copy__6;
        v24[4] = __Block_byref_object_dispose__6;
        id v25 = 0;
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __DeleteRowWithID_block_invoke;
        v20[3] = &unk_1E53D7A50;
        id v11 = v10;
        uint64_t v22 = v24;
        uint64_t v23 = v9;
        id v21 = v11;
        [v11 executeStatement:@"DeleteRowWithID" statementBlock:v20];

        _Block_object_dispose(v24, 8);
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [obj countByEnumeratingWithState:&v13 objects:v26 count:16];
    }
    while (v6);
  }
}

uint64_t __56__GEONavdCachePersistenceManager_deleteFromDiskWithKey___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v6 = (void *)MEMORY[0x1E4F28DC0];
  id v7 = a4;
  id v13 = 0;
  uint64_t v8 = [v6 unarchivedObjectOfClass:objc_opt_class() fromData:v7 error:&v13];

  id v9 = v13;
  if (!v9 && [*(id *)(a1 + 32) isEqual:v8])
  {
    id v10 = *(void **)(a1 + 40);
    id v11 = [NSNumber numberWithLongLong:a2];
    [v10 addObject:v11];
  }
  return 1;
}

- (void)enumerateAllEntriesWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    db = self->_db;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __65__GEONavdCachePersistenceManager_enumerateAllEntriesWithHandler___block_invoke;
    v7[3] = &unk_1E53D7ED0;
    v7[4] = self;
    id v8 = v4;
    [(GEOSQLiteDB *)db executeAsync:v7];
  }
}

void __65__GEONavdCachePersistenceManager_enumerateAllEntriesWithHandler___block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 8);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __65__GEONavdCachePersistenceManager_enumerateAllEntriesWithHandler___block_invoke_2;
  v2[3] = &unk_1E53DA570;
  id v3 = *(id *)(a1 + 40);
  ReadAllRows(v1, v2);
}

BOOL __65__GEONavdCachePersistenceManager_enumerateAllEntriesWithHandler___block_invoke_2(uint64_t a1, void *a2, double a3, uint64_t a4, void *a5, void *a6)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v10 = a6;
  id v11 = (void *)MEMORY[0x1E4F28DC0];
  id v12 = a5;
  id v23 = 0;
  id v13 = [v11 unarchivedObjectOfClass:objc_opt_class() fromData:v12 error:&v23];

  id v14 = v23;
  if (v13) {
    BOOL v15 = v14 == 0;
  }
  else {
    BOOL v15 = 0;
  }
  if (!v15)
  {
    long long v16 = v14;
    id v17 = GEOGetGEONavdCachePersistenceManagerLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)long long buf = 134218242;
      id v25 = a2;
      __int16 v26 = 2112;
      uint64_t v27 = v16;
      _os_log_impl(&dword_188D96000, v17, OS_LOG_TYPE_FAULT, "couldn't find a key for rowId: %lld, error: %@", buf, 0x16u);
    }
LABEL_13:
    BOOL v19 = 0;
    goto LABEL_14;
  }
  id v22 = 0;
  id v17 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v10 error:&v22];
  id v18 = v22;
  long long v16 = v18;
  if (!v17 || v18)
  {
    id v20 = GEOGetGEONavdCachePersistenceManagerLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)long long buf = 138412802;
      id v25 = v13;
      __int16 v26 = 2048;
      uint64_t v27 = a2;
      __int16 v28 = 2112;
      id v29 = v16;
      _os_log_impl(&dword_188D96000, v20, OS_LOG_TYPE_FAULT, "couldn't find a value for key: %@ for rowId: %lld, error: %@", buf, 0x20u);
    }

    goto LABEL_13;
  }
  [v17 setRowId:a2];
  buf[0] = 0;
  (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3);
  BOOL v19 = buf[0] == 0;
LABEL_14:

  return v19;
}

- (void)enumerateAllForCacheEntriesWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    db = self->_db;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __73__GEONavdCachePersistenceManager_enumerateAllForCacheEntriesWithHandler___block_invoke;
    v7[3] = &unk_1E53D7ED0;
    v7[4] = self;
    id v8 = v4;
    [(GEOSQLiteDB *)db executeAsync:v7];
  }
}

void __73__GEONavdCachePersistenceManager_enumerateAllForCacheEntriesWithHandler___block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 8);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __73__GEONavdCachePersistenceManager_enumerateAllForCacheEntriesWithHandler___block_invoke_2;
  v2[3] = &unk_1E53DA570;
  id v3 = *(id *)(a1 + 40);
  ReadAllRows(v1, v2);
}

uint64_t __73__GEONavdCachePersistenceManager_enumerateAllForCacheEntriesWithHandler___block_invoke_2(uint64_t a1)
{
  return 1;
}

- (int64_t)numberOfEntries
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  db = self->_db;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__GEONavdCachePersistenceManager_numberOfEntries__block_invoke;
  v5[3] = &unk_1E53D89C0;
  v5[4] = self;
  v5[5] = &v6;
  [(GEOSQLiteDB *)db executeSync:v5];
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __49__GEONavdCachePersistenceManager_numberOfEntries__block_invoke(uint64_t a1)
{
  id v2 = *(id *)(*(void *)(a1 + 32) + 8);
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = __Block_byref_object_copy__6;
  void v13[4] = __Block_byref_object_dispose__6;
  id v14 = 0;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __CountRows_block_invoke;
  v5[3] = &unk_1E53D9BA0;
  id v7 = &v9;
  id v3 = v2;
  id v6 = v3;
  uint64_t v8 = v13;
  [v3 statementForKey:@"CountRows" statementBlock:v5];
  uint64_t v4 = v10[3];

  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(v13, 8);

  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v4;
}

- (void)removeAllEntries
{
  db = self->_db;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __50__GEONavdCachePersistenceManager_removeAllEntries__block_invoke;
  v3[3] = &unk_1E53D79D8;
  v3[4] = self;
  [(GEOSQLiteDB *)db executeAsync:v3];
}

uint64_t __50__GEONavdCachePersistenceManager_removeAllEntries__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) executeStatement:@"DeleteAllRows" statementBlock:&__block_literal_global_104];
}

- (void).cxx_destruct
{
}

@end