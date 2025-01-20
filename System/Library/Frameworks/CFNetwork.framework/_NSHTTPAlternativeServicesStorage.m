@interface _NSHTTPAlternativeServicesStorage
+ (id)sharedPersistentStore;
- (BOOL)canSuspendLocked;
- (NSURL)path;
- (_NSHTTPAlternativeServiceEntry)_onqueue_convertSqlRowToHTTPAlternativeServiceEntry:(uint64_t)a1;
- (_NSHTTPAlternativeServicesStorage)init;
- (id)HTTPServiceEntriesWithFilter:(id)a3;
- (id)HTTPServiceEntriesWithRegistrableDomain:(id)a3;
- (id)entries;
- (id)initInMemoryStore;
- (id)initPersistentStoreWithURL:(id)a3;
- (uint64_t)_createDBSchemaForPath:(uint64_t)a1;
- (uint64_t)_onqueue_garbageCollect;
- (uint64_t)_onqueue_initializeDatabaseIfNotEmpty:(uint64_t)a1;
- (void)dealloc;
- (void)removeHTTPAlternativeServiceEntriesCreatedAfterDate:(id)a3;
- (void)removeHTTPAlternativeServiceEntriesWithHost:(id)a3 port:(int64_t)a4;
- (void)removeHTTPAlternativeServiceEntriesWithRegistrableDomain:(id)a3;
- (void)setCanSuspendLocked:(BOOL)a3;
- (void)storeHTTPServiceEntry:(id)a3;
@end

@implementation _NSHTTPAlternativeServicesStorage

- (void)dealloc
{
  sqlite3_finalize(self->selectAllEntriesStmt);
  sqlite3_finalize(self->selectAllValidEntriesStmt);
  sqlite3_finalize(self->selectEntriesStmt);
  sqlite3_finalize(self->selectEntriesWithRegistrableDomainStmt);
  sqlite3_finalize(self->insertEntriesStmt);
  sqlite3_finalize(self->deleteWithTimeStmt);
  sqlite3_finalize(self->deleteWithHostAndPortStmt);
  sqlite3_finalize(self->deleteWithRegistrableDomainStmt);
  sqlite3_finalize(self->deleteExpiredEntriesStmt);
  sqlite3_finalize(self->trimDbStmt);
  sqlite3_close(self->dbConnection);
  v3.receiver = self;
  v3.super_class = (Class)_NSHTTPAlternativeServicesStorage;
  [(_NSHTTPAlternativeServicesStorage *)&v3 dealloc];
}

- (uint64_t)_onqueue_initializeDatabaseIfNotEmpty:(uint64_t)a1
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  if (*(unsigned char *)(a1 + 25)) {
    return 1;
  }
  if (*(unsigned char *)(a1 + 26) && (a2 & 1) != 0) {
    return 0;
  }
  v4 = *(void **)(a1 + 8);
  if (!*(unsigned char *)(a1 + 26) && !v4)
  {
    v5 = [MEMORY[0x1E4F28B50] mainBundle];
    v6 = [v5 bundleIdentifier];

    if (!v6)
    {
      v6 = [NSString stringWithCString:*(void *)_CFGetProgname() encoding:4];
    }
    v7 = [MEMORY[0x1E4F28CB8] defaultManager];
    v8 = [v7 URLsForDirectory:5 inDomains:1];
    v9 = [v8 firstObject];

    id v26 = 0;
    uint64_t v10 = *MEMORY[0x1E4F1C858];
    id v25 = 0;
    int v11 = [v9 getResourceValue:&v26 forKey:v10 error:&v25];
    id v12 = v26;
    id v13 = v25;
    if (v11 && [v12 BOOLValue])
    {
      v14 = [v9 URLByAppendingPathComponent:@"HTTPStorages" isDirectory:1];
      v15 = [v14 URLByAppendingPathComponent:v6 isDirectory:1];

      v16 = [MEMORY[0x1E4F28CB8] defaultManager];
      [v16 createDirectoryAtURL:v15 withIntermediateDirectories:1 attributes:0 error:0];

      [v15 setResourceValue:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F1C630] error:0];
      uint64_t v17 = [v15 URLByAppendingPathComponent:@"httpstorages.sqlite" isDirectory:0];
      v18 = *(void **)(a1 + 8);
      *(void *)(a1 + 8) = v17;
    }
    else
    {
      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
      }
      v15 = (id)CFNLog::logger;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v28 = v9;
        __int16 v29 = 2112;
        id v30 = v13;
        _os_log_impl(&dword_184085000, v15, OS_LOG_TYPE_INFO, "Volume of %@ is not local, falling back to in memory alt-svc storage: %@", buf, 0x16u);
      }
    }

    if (!*(void *)(a1 + 8)) {
      *(unsigned char *)(a1 + 26) = 1;
    }

    v4 = *(void **)(a1 + 8);
  }
  if ((-[_NSHTTPAlternativeServicesStorage _createDBSchemaForPath:](a1, v4) & 1) == 0)
  {
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
    }
    v19 = (id)CFNLog::logger;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      v23 = *(void **)(a1 + 8);
      *(_DWORD *)buf = 138412290;
      v28 = v23;
      _os_log_debug_impl(&dword_184085000, v19, OS_LOG_TYPE_DEBUG, "Unable to create the Alternative Storage at location %@. Falling back to memory storage", buf, 0xCu);
    }

    -[_NSHTTPAlternativeServicesStorage _createDBSchemaForPath:](a1, 0);
  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 28));
  uint64_t v3 = 1;
  *(unsigned char *)(a1 + 24) = 1;
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 28));
  v20 = *(NSObject **)(a1 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75___NSHTTPAlternativeServicesStorage__onqueue_initializeDatabaseIfNotEmpty___block_invoke;
  block[3] = &unk_1E5258228;
  block[4] = a1;
  dispatch_block_t v21 = dispatch_block_create_with_qos_class((dispatch_block_flags_t)0, QOS_CLASS_UTILITY, 0, block);
  dispatch_async(v20, v21);

  *(unsigned char *)(a1 + 25) = 1;
  return v3;
}

- (id)HTTPServiceEntriesWithFilter:(id)a3
{
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__3154;
  uint64_t v17 = __Block_byref_object_dispose__3155;
  id v18 = (id)MEMORY[0x1E4F1CBF0];
  id v4 = a3;
  v5 = (void *)[v4 copy];
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66___NSHTTPAlternativeServicesStorage_HTTPServiceEntriesWithFilter___block_invoke;
  block[3] = &unk_1E5257BC8;
  block[4] = self;
  id v11 = v5;
  id v12 = &v13;
  id v7 = v5;
  dispatch_sync(workQueue, block);
  id v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);

  return v8;
}

+ (id)sharedPersistentStore
{
  v2 = (void *)sAltServiceSharedInstance;
  if (!sAltServiceSharedInstance)
  {
    if (+[_NSHTTPAlternativeServicesStorage sharedPersistentStore]::sOnce != -1) {
      dispatch_once(&+[_NSHTTPAlternativeServicesStorage sharedPersistentStore]::sOnce, &__block_literal_global_3171);
    }
    v2 = (void *)sAltServiceSharedInstance;
  }

  return v2;
}

- (_NSHTTPAlternativeServiceEntry)_onqueue_convertSqlRowToHTTPAlternativeServiceEntry:(uint64_t)a1
{
  v2 = 0;
  if (a1 && a2)
  {
    v2 = objc_alloc_init(_NSHTTPAlternativeServiceEntry);
    id v4 = objc_msgSend(NSString, "stringWithUTF8String:", sqlite3_column_text(a2, 0));
    [(_NSHTTPAlternativeServiceEntry *)v2 setPartition:v4];

    v5 = objc_msgSend(NSString, "stringWithUTF8String:", sqlite3_column_text(a2, 1));
    [(_NSHTTPAlternativeServiceEntry *)v2 setHost:v5];

    v6 = objc_msgSend(NSString, "stringWithUTF8String:", sqlite3_column_text(a2, 2));
    [(_NSHTTPAlternativeServiceEntry *)v2 setAlternateHost:v6];

    [(_NSHTTPAlternativeServiceEntry *)v2 setPort:sqlite3_column_int(a2, 3)];
    [(_NSHTTPAlternativeServiceEntry *)v2 setAlternatePort:sqlite3_column_int(a2, 4)];
    [(_NSHTTPAlternativeServiceEntry *)v2 setServiceType:sqlite3_column_int(a2, 5)];
    id v7 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSince1970:", (double)sqlite3_column_int64(a2, 7));
    [(_NSHTTPAlternativeServiceEntry *)v2 setExpirationDate:v7];
  }

  return v2;
}

- (void)storeHTTPServiceEntry:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->lock);
  v5 = [(NSMutableSet *)self->memoryEntries member:v4];
  if (!v5) {
    goto LABEL_10;
  }
  v6 = [v4 expirationDate];
  [v6 timeIntervalSinceNow];
  if (v7 <= 0.0)
  {

    goto LABEL_10;
  }
  id v8 = [v4 expirationDate];
  v9 = [v5 expirationDate];
  [v8 timeIntervalSinceDate:v9];
  double v11 = v10;

  if (v11 >= 30.0)
  {
LABEL_10:
    CFSetSetValue((CFMutableSetRef)self->memoryEntries, v4);
    if ((unint64_t)[(NSMutableSet *)self->memoryEntries count] < 0x1F5
      || self->_garbageCollectionDispatched)
    {
      char v14 = 0;
      int v13 = 0;
    }
    else
    {
      char v14 = 0;
      int v13 = 1;
      self->_garbageCollectionDispatched = 1;
    }
    goto LABEL_13;
  }
  if (CFNLog::onceToken != -1) {
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
  }
  id v12 = (id)CFNLog::logger;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_184085000, v12, OS_LOG_TYPE_DEBUG, "Ignoring alt-svc entry", buf, 2u);
  }

  int v13 = 0;
  char v14 = 1;
LABEL_13:
  clearEntries = self->clearEntries;
  v16 = (void *)MEMORY[0x1E4F28F60];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __59___NSHTTPAlternativeServicesStorage_storeHTTPServiceEntry___block_invoke;
  v26[3] = &unk_1E5253298;
  id v17 = v4;
  id v27 = v17;
  id v18 = [v16 predicateWithBlock:v26];
  [(NSMutableSet *)clearEntries filterUsingPredicate:v18];

  os_unfair_lock_unlock(&self->lock);
  if ((v14 & 1) == 0)
  {
    workQueue = self->_workQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59___NSHTTPAlternativeServicesStorage_storeHTTPServiceEntry___block_invoke_2;
    block[3] = &unk_1E5257FB0;
    block[4] = self;
    id v25 = v17;
    dispatch_block_t v20 = dispatch_block_create_with_qos_class((dispatch_block_flags_t)0, QOS_CLASS_UTILITY, 0, block);
    dispatch_async(workQueue, v20);
  }
  if (v13)
  {
    dispatch_block_t v21 = self->_workQueue;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __59___NSHTTPAlternativeServicesStorage_storeHTTPServiceEntry___block_invoke_4;
    v23[3] = &unk_1E5258228;
    v23[4] = self;
    dispatch_block_t v22 = dispatch_block_create_with_qos_class((dispatch_block_flags_t)0, QOS_CLASS_UTILITY, 0, v23);
    dispatch_async(v21, v22);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->clearEntries, 0);
  objc_storeStrong((id *)&self->memoryEntries, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);

  objc_storeStrong((id *)&self->_path, 0);
}

- (uint64_t)_onqueue_garbageCollect
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
    }
    v2 = (id)CFNLog::logger;
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_184085000, v2, OS_LOG_TYPE_DEFAULT, "Garbage collection for alternative services", buf, 2u);
    }

    os_unfair_lock_lock((os_unfair_lock_t)(v1 + 28));
    [*(id *)(v1 + 32) removeAllObjects];
    *(unsigned char *)(v1 + 24) = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 28));
    if (!*(unsigned char *)(v1 + 26)) {
      __retainStorageAssertion(*(void **)(v1 + 16));
    }
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    id v17 = __60___NSHTTPAlternativeServicesStorage__onqueue_garbageCollect__block_invoke;
    id v18 = &unk_1E5258228;
    uint64_t v19 = v1;
    id v4 = (sqlite3_stmt **)(v1 + 120);
    uint64_t v3 = *(sqlite3_stmt **)(v1 + 120);
    if (!v3)
    {
      if (sqlite3_prepare_v2(*(sqlite3 **)(v1 + 48), "DELETE FROM alt_services WHERE expires_time < strftime('%s','now')", -1, (sqlite3_stmt **)(v1 + 120), 0))
      {
        if (CFNLog::onceToken != -1) {
          dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
        }
        double v10 = (id)CFNLog::logger;
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_184085000, v10, OS_LOG_TYPE_ERROR, "Failed to init the deleteExpiredEntriesStmt statement for alt_services", buf, 2u);
        }
        goto LABEL_39;
      }
      uint64_t v3 = *v4;
    }
    if (sqlite3_step(v3) != 101)
    {
      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
      }
      v5 = (id)CFNLog::logger;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        int v13 = sqlite3_errmsg(*(sqlite3 **)(v1 + 48));
        *(_DWORD *)buf = 136315138;
        *(void *)&uint8_t buf[4] = v13;
        _os_log_error_impl(&dword_184085000, v5, OS_LOG_TYPE_ERROR, "Failed to delete expired entries from alt_service db. Error= %s", buf, 0xCu);
      }
    }
    sqlite3_reset(*v4);
    double v7 = (sqlite3_stmt **)(v1 + 128);
    v6 = *(sqlite3_stmt **)(v1 + 128);
    if (v6) {
      goto LABEL_16;
    }
    objc_msgSend(NSString, "stringWithFormat:", @"DELETE FROM alt_services WHERE ROWID in (SELECT ROWID FROM alt_services ORDER BY ROWID DESC LIMIT -1 OFFSET %ld)", 1500);
    id v11 = objc_claimAutoreleasedReturnValue();
    id v12 = (const char *)[v11 UTF8String];

    if (!sqlite3_prepare_v2(*(sqlite3 **)(v1 + 48), v12, -1, (sqlite3_stmt **)(v1 + 128), 0))
    {
      v6 = *v7;
LABEL_16:
      if (sqlite3_step(v6) != 101)
      {
        if (CFNLog::onceToken != -1) {
          dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
        }
        id v8 = (id)CFNLog::logger;
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          char v14 = sqlite3_errmsg(*(sqlite3 **)(v1 + 48));
          *(_DWORD *)buf = 136315138;
          *(void *)&uint8_t buf[4] = v14;
          _os_log_error_impl(&dword_184085000, v8, OS_LOG_TYPE_ERROR, "Failed to trim entries from alt_service db. Error= %s", buf, 0xCu);
        }
      }
      sqlite3_reset(*v7);
      *(void *)buf = 0;
      if (sqlite3_exec(*(sqlite3 **)(v1 + 48), "PRAGMA incremental_vacuum(10);", 0, 0, (char **)buf))
      {
        if (CFNLog::onceToken != -1) {
          dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
        }
        v9 = (id)CFNLog::logger;
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)uint64_t v15 = 0;
          _os_log_error_impl(&dword_184085000, v9, OS_LOG_TYPE_ERROR, "Failed to auto vacuum when garbage collecting alternative storages", v15, 2u);
        }
      }
      return ((uint64_t (*)(void *))v17)(v16);
    }
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
    }
    double v10 = (id)CFNLog::logger;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_184085000, v10, OS_LOG_TYPE_ERROR, "Failed to init the trimDbStmt statement for alt_services", buf, 2u);
    }
LABEL_39:

    return ((uint64_t (*)(void *))v17)(v16);
  }
  return result;
}

- (uint64_t)_createDBSchemaForPath:(uint64_t)a1
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 fileSystemRepresentation];
  if (v4) {
    v5 = (const char *)v4;
  }
  else {
    v5 = ":memory:";
  }
  if (!*(unsigned char *)(a1 + 26)) {
    __retainStorageAssertion(*(void **)(a1 + 16));
  }
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  id v18 = __60___NSHTTPAlternativeServicesStorage__createDBSchemaForPath___block_invoke;
  uint64_t v19 = &unk_1E5258228;
  uint64_t v20 = a1;
  if (volumeSupportsFileProtection(v5)) {
    int v6 = 3145734;
  }
  else {
    int v6 = 6;
  }
  double v7 = (sqlite3 **)(a1 + 48);
  if (!sqlite3_open_v2(v5, (sqlite3 **)(a1 + 48), v6, 0))
  {
    errmsg = 0;
    int v8 = [(id)a1 canSuspendLocked] ^ 1;
    if (!v3) {
      LOBYTE(v8) = 1;
    }
    if ((v8 & 1) == 0)
    {
      char value = -1;
      if (setxattr(v5, "com.apple.runningboard.can-suspend-locked", &value, 1uLL, 0, 0) < 0)
      {
        if (CFNLog::onceToken != -1) {
          dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
        }
        v9 = (id)CFNLog::logger;
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          int v14 = *__error();
          *(_DWORD *)buf = 136315394;
          dispatch_block_t v22 = v5;
          __int16 v23 = 1024;
          int v24 = v14;
          _os_log_error_impl(&dword_184085000, v9, OS_LOG_TYPE_ERROR, "Failed to set can-suspend-locked at %s: %{errno}d", buf, 0x12u);
        }
      }
    }
    sqlite3_busy_timeout(*v7, 1000);
    if (sqlite3_exec(*v7, "PRAGMA auto_vacuum = 2;", 0, 0, &errmsg))
    {
      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
      }
      double v10 = (id)CFNLog::logger;
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        goto LABEL_36;
      }
      *(_WORD *)buf = 0;
      id v11 = "Failed to set auto_vacuum to incremental";
    }
    else if (sqlite3_exec(*v7, "PRAGMA journal_mode=WAL;", 0, 0, &errmsg))
    {
      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
      }
      double v10 = (id)CFNLog::logger;
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        goto LABEL_36;
      }
      *(_WORD *)buf = 0;
      id v11 = "Failed to set journal mode";
    }
    else
    {
      if (!sqlite3_exec(*v7, "CREATE TABLE IF NOT EXISTS alt_services(       partition text NOT NULL,        host text NOT NULL,        alternateHost text NOT NULL,        port int NOT NULL,        alternatePort int NOT NULL,        type int NOT NULL,        creation_time int,        expires_time int,        UNIQUE(partition, host, port, type)       );",
              0,
              0,
              &errmsg))
      {
        uint64_t v12 = 1;
        goto LABEL_38;
      }
      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
      }
      double v10 = (id)CFNLog::logger;
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        goto LABEL_36;
      }
      *(_WORD *)buf = 0;
      id v11 = "Failed to create schema";
    }
    _os_log_error_impl(&dword_184085000, v10, OS_LOG_TYPE_ERROR, v11, buf, 2u);
LABEL_36:

    goto LABEL_37;
  }
  sqlite3_close(*v7);
LABEL_37:
  uint64_t v12 = 0;
LABEL_38:
  ((void (*)(void *))v18)(v17);

  return v12;
}

- (BOOL)canSuspendLocked
{
  return self->_canSuspendLocked;
}

- (id)initPersistentStoreWithURL:(id)a3
{
  id v5 = a3;
  int v6 = [(_NSHTTPAlternativeServicesStorage *)self init];
  double v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_path, a3);
  }

  return v7;
}

- (id)initInMemoryStore
{
  id result = [(_NSHTTPAlternativeServicesStorage *)self init];
  if (result) {
    *((unsigned char *)result + 26) = 1;
  }
  return result;
}

- (_NSHTTPAlternativeServicesStorage)init
{
  v10.receiver = self;
  v10.super_class = (Class)_NSHTTPAlternativeServicesStorage;
  v2 = [(_NSHTTPAlternativeServicesStorage *)&v10 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.cfnetwork.altservicesstorage", 0);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v3;

    id v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    memoryEntries = v2->memoryEntries;
    v2->memoryEntries = v5;

    double v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    clearEntries = v2->clearEntries;
    v2->clearEntries = v7;

    v2->lock._os_unfair_lock_opaque = 0;
    v2->_canSuspendLocked = 1;
  }
  return v2;
}

- (void)setCanSuspendLocked:(BOOL)a3
{
  self->_canSuspendLocked = a3;
}

- (void)removeHTTPAlternativeServiceEntriesCreatedAfterDate:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->lock);
  [(NSMutableSet *)self->memoryEntries removeAllObjects];
  os_unfair_lock_unlock(&self->lock);
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __89___NSHTTPAlternativeServicesStorage_removeHTTPAlternativeServiceEntriesCreatedAfterDate___block_invoke;
  v7[3] = &unk_1E5257FB0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(workQueue, v7);
}

- (void)removeHTTPAlternativeServiceEntriesWithRegistrableDomain:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[v4 copy];
  os_unfair_lock_lock(&self->lock);
  [(NSMutableSet *)self->memoryEntries removeAllObjects];
  os_unfair_lock_unlock(&self->lock);
  workQueue = self->_workQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __94___NSHTTPAlternativeServicesStorage_removeHTTPAlternativeServiceEntriesWithRegistrableDomain___block_invoke;
  v8[3] = &unk_1E5257FB0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_sync(workQueue, v8);
}

- (void)removeHTTPAlternativeServiceEntriesWithHost:(id)a3 port:(int64_t)a4
{
  id v7 = a3;
  if (v7)
  {
    os_unfair_lock_lock(&self->lock);
    id v8 = objc_alloc_init(_NSHTTPAlternativeServicesClearEntry);
    id v9 = v8;
    if (v8)
    {
      objc_storeStrong((id *)&v8->_host, a3);
      v9->_port = a4;
    }
    objc_super v10 = [(NSMutableSet *)self->clearEntries member:v9];

    if (v10)
    {
      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
      }
      id v11 = (id)CFNLog::logger;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_184085000, v11, OS_LOG_TYPE_DEBUG, "Ignoring alt-svc clear", buf, 2u);
      }
    }
    else
    {
      [(NSMutableSet *)self->clearEntries addObject:v9];
    }
    memoryEntries = self->memoryEntries;
    int v13 = (void *)MEMORY[0x1E4F28F60];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __86___NSHTTPAlternativeServicesStorage_removeHTTPAlternativeServiceEntriesWithHost_port___block_invoke;
    v21[3] = &unk_1E52532C0;
    id v14 = v7;
    id v22 = v14;
    int64_t v23 = a4;
    uint64_t v15 = [v13 predicateWithBlock:v21];
    [(NSMutableSet *)memoryEntries filterUsingPredicate:v15];

    os_unfair_lock_unlock(&self->lock);
    if (!v10)
    {
      workQueue = self->_workQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __86___NSHTTPAlternativeServicesStorage_removeHTTPAlternativeServiceEntriesWithHost_port___block_invoke_2;
      block[3] = &unk_1E5257B78;
      block[4] = self;
      id v19 = v14;
      int64_t v20 = a4;
      dispatch_block_t v17 = dispatch_block_create_with_qos_class((dispatch_block_flags_t)0, QOS_CLASS_UTILITY, 0, block);
      dispatch_async(workQueue, v17);
    }
  }
}

- (id)entries
{
  dispatch_queue_t v3 = [MEMORY[0x1E4F1CA48] array];
  workQueue = self->_workQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __44___NSHTTPAlternativeServicesStorage_entries__block_invoke;
  v9[3] = &unk_1E5257FB0;
  v9[4] = self;
  id v5 = v3;
  id v10 = v5;
  dispatch_sync(workQueue, v9);
  id v6 = v10;
  id v7 = v5;

  return v7;
}

- (id)HTTPServiceEntriesWithRegistrableDomain:(id)a3
{
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__3154;
  dispatch_block_t v17 = __Block_byref_object_dispose__3155;
  id v18 = (id)MEMORY[0x1E4F1CBF0];
  id v4 = a3;
  id v5 = (void *)[v4 copy];
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77___NSHTTPAlternativeServicesStorage_HTTPServiceEntriesWithRegistrableDomain___block_invoke;
  block[3] = &unk_1E5257BC8;
  block[4] = self;
  id v11 = v5;
  uint64_t v12 = &v13;
  id v7 = v5;
  dispatch_sync(workQueue, block);
  id v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);

  return v8;
}

- (NSURL)path
{
  return self->_path;
}

@end