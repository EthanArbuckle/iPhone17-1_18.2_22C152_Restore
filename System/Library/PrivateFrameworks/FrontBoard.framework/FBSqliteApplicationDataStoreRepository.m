@interface FBSqliteApplicationDataStoreRepository
+ (BOOL)_objectRequiresSerialization:(id)a3;
+ (id)_generateParameterizedQuery:(id)a3 forKeyList:(id)a4 outBindings:(id *)a5;
+ (id)_objectForResultRow:(id)a3 index:(unint64_t)a4;
- (BOOL)_dbQueue_containsKey:(id)a3 forApplication:(id)a4;
- (BOOL)_dbQueue_databaseIntegrityCheck;
- (BOOL)_dbQueue_executeStatement:(id)a3 bindings:(id)a4 resultRowHandler:(id)a5;
- (BOOL)_dbQueue_executeStatement:(id)a3 bindings:(id)a4 resultRowHandler:(id)a5 error:(id *)a6;
- (BOOL)_dbQueue_loadDatabase;
- (BOOL)_dbQueue_truncateDamagedDatabase;
- (BOOL)_dbQueue_tryPreserveDamagedDatabase;
- (BOOL)_inAlternateSystemApp;
- (BOOL)_isEligibleForSaving:(id)a3;
- (BOOL)_preserveFileAtURL:(id)a3;
- (BOOL)containsKey:(id)a3 forApplication:(id)a4;
- (FBApplicationDataStoreRepositoryDelegate)delegate;
- (FBSqliteApplicationDataStoreRepository)initWithStorePath:(id)a3;
- (id)_dbQueue_applicationIdentifiersWithState;
- (id)_dbQueue_keysForApplication:(id)a3;
- (id)_dbQueue_objectForKey:(id)a3 forApplication:(id)a4;
- (id)_dbQueue_objectsForKeys:(id)a3;
- (id)_dbQueue_openDatabase;
- (id)allObjectsForKeys:(id)a3;
- (id)applicationIdentifiersWithState;
- (id)keysForApplication:(id)a3;
- (id)migrateIdentifier:(id)a3 toIdentifier:(id)a4;
- (id)objectForKey:(id)a3 forApplication:(id)a4;
- (id)urlByAppendingString:(id)a3 toURL:(id)a4;
- (int64_t)_dbQueue_databaseVersion;
- (void)_dbQueue_createTables;
- (void)_dbQueue_databaseIntegrityCheck;
- (void)_dbQueue_load;
- (void)_dbQueue_loadDatabase;
- (void)_dbQueue_notifyDelegateOfChangeForKeys:(id)a3 application:(id)a4;
- (void)_dbQueue_notifyDelegateOfLateLoad;
- (void)_dbQueue_notifyDelegateOfStoreInvalidationForIdentifier:(id)a3;
- (void)_dbQueue_openDatabase;
- (void)_dbQueue_performWithSavepoint:(id)a3 handler:(id)a4;
- (void)_dbQueue_truncateDamagedDatabase;
- (void)beginBatchedUpdate;
- (void)close;
- (void)dealloc;
- (void)endBatchedUpdate;
- (void)flushSynchronously;
- (void)removeAllObjectsForApplication:(id)a3;
- (void)removeObjectForKey:(id)a3 forApplication:(id)a4;
- (void)removeObjectsForKeys:(id)a3 forApplication:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4 forApplication:(id)a5;
@end

@implementation FBSqliteApplicationDataStoreRepository

uint64_t __93__FBSqliteApplicationDataStoreRepository__dbQueue_notifyDelegateOfChangeForKeys_application___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) objectChangedForKeys:*(void *)(a1 + 40) application:*(void *)(a1 + 48)];
}

uint64_t __78__FBSqliteApplicationDataStoreRepository__dbQueue_containsKey_forApplication___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  return result;
}

- (void)setObject:(id)a3 forKey:(id)a4 forApplication:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = v10;
  if (!v8)
  {
    [(FBSqliteApplicationDataStoreRepository *)self removeObjectForKey:v9 forApplication:v10];
    goto LABEL_9;
  }
  if (!v9
    || !v10
    || ![(FBSqliteApplicationDataStoreRepository *)self _isEligibleForSaving:v8])
  {
    goto LABEL_9;
  }
  id v12 = v8;
  if (![(id)objc_opt_class() _objectRequiresSerialization:v12]
    || ([MEMORY[0x1E4F28F98] dataWithPropertyList:v12 format:200 options:0 error:0],
        uint64_t v13 = objc_claimAutoreleasedReturnValue(),
        v12,
        (id v12 = (id)v13) != 0))
  {
    dbQueue = self->_dbQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __74__FBSqliteApplicationDataStoreRepository_setObject_forKey_forApplication___block_invoke;
    block[3] = &unk_1E5C49838;
    block[4] = self;
    id v18 = v9;
    id v19 = v11;
    id v20 = v12;
    id v15 = v12;
    dispatch_async(dbQueue, block);

LABEL_9:
    return;
  }
  v16 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"objectToStore != nil"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
    -[FBSqliteApplicationDataStoreRepository setObject:forKey:forApplication:]();
  }
  }
  [v16 UTF8String];
  _bs_set_crash_log_message();
  __break(0);
}

- (BOOL)_isEligibleForSaving:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (_isEligibleForSaving__onceToken_0 != -1) { {
    dispatch_once(&_isEligibleForSaving__onceToken_0, &__block_literal_global_14);
  }
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = (id)_isEligibleForSaving____eligibleClassTypes_0;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) { {
          objc_enumerationMutation(v4);
        }
        }
        if (objc_opt_isKindOfClass())
        {
          LOBYTE(v5) = 1;
          goto LABEL_13;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v5) { {
        continue;
      }
      }
      break;
    }
  }
LABEL_13:

  return v5;
}

+ (BOOL)_objectRequiresSerialization:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v4 = 0;
  }
  else
  {
    objc_opt_class();
    char v4 = objc_opt_isKindOfClass() ^ 1;
  }

  return v4 & 1;
}

void __74__FBSqliteApplicationDataStoreRepository_setObject_forKey_forApplication___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __74__FBSqliteApplicationDataStoreRepository_setObject_forKey_forApplication___block_invoke_2;
  v3[3] = &unk_1E5C4AB28;
  v3[4] = v2;
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  objc_msgSend(v2, "_dbQueue_performWithSavepoint:handler:", @"setObject", v3);
}

- (id)objectForKey:(id)a3 forApplication:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  id v9 = 0;
  if (v6 && v7)
  {
    uint64_t v16 = 0;
    v17 = &v16;
    uint64_t v18 = 0x3032000000;
    id v19 = __Block_byref_object_copy__5;
    id v20 = __Block_byref_object_dispose__5;
    id v21 = 0;
    dbQueue = self->_dbQueue;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __70__FBSqliteApplicationDataStoreRepository_objectForKey_forApplication___block_invoke;
    v12[3] = &unk_1E5C4A420;
    id v15 = &v16;
    v12[4] = self;
    id v13 = v6;
    id v14 = v8;
    dispatch_sync(dbQueue, v12);
    id v9 = (id)v17[5];

    _Block_object_dispose(&v16, 8);
  }

  return v9;
}

void __76__FBSqliteApplicationDataStoreRepository_removeObjectForKey_forApplication___block_invoke(void *a1)
{
  v10[2] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)a1[4];
  uint64_t v2 = a1[5];
  v9[0] = @":application_identifier";
  v9[1] = @":key";
  uint64_t v4 = a1[6];
  v10[0] = v2;
  v10[1] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  objc_msgSend(v3, "_dbQueue_executeStatement:bindings:resultRowHandler:", @"DELETE FROM kvs WHERE     application_identifier IN (SELECT id FROM application_identifier_tab WHERE application_identifier = :application_identifier)     AND key IN (SELECT id FROM key_tab WHERE key = :key);",
    v5,
    0);

  id v6 = (void *)a1[4];
  uint64_t v8 = a1[6];
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v8 count:1];
  objc_msgSend(v6, "_dbQueue_notifyDelegateOfChangeForKeys:application:", v7, a1[5]);
}

void __70__FBSqliteApplicationDataStoreRepository_objectForKey_forApplication___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_dbQueue_objectForKey:forApplication:", *(void *)(a1 + 40), *(void *)(a1 + 48));
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)_dbQueue_objectForKey:(id)a3 forApplication:(id)a4
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dbQueue);
  if (!v6)
  {
    long long v11 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"key"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBSqliteApplicationDataStoreRepository _dbQueue_objectForKey:forApplication:]();
    }
    }
    [v11 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A630C7A8);
  }
  if (!v7)
  {
    long long v12 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"identifier"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBSqliteApplicationDataStoreRepository _dbQueue_objectForKey:forApplication:]();
    }
    }
    [v12 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A630C80CLL);
  }
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__5;
  uint64_t v18 = __Block_byref_object_dispose__5;
  id v19 = 0;
  v20[0] = @":application_identifier";
  v20[1] = @":key";
  v21[0] = v7;
  v21[1] = v6;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __79__FBSqliteApplicationDataStoreRepository__dbQueue_objectForKey_forApplication___block_invoke;
  v13[3] = &unk_1E5C4ABC8;
  v13[4] = self;
  v13[5] = &v14;
  -[FBSqliteApplicationDataStoreRepository _dbQueue_executeStatement:bindings:resultRowHandler:](self, "_dbQueue_executeStatement:bindings:resultRowHandler:", @"SELECT value FROM kvs, application_identifier_tab, key_tab WHERE    application_identifier_tab.application_identifier = :application_identifier    AND key_tab.key = :key    AND kvs.application_identifier = application_identifier_tab.id    AND kvs.key = key_tab.id;",
    v8,
    v13);

  id v9 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v9;
}

- (void)_dbQueue_performWithSavepoint:(id)a3 handler:(id)a4
{
  id v6 = NSString;
  id v7 = (uint64_t (**)(void))a4;
  id v8 = a3;
  id v9 = [v6 stringWithFormat:@"SAVEPOINT %@", v8];
  [(FBSqliteApplicationDataStoreRepository *)self _dbQueue_executeStatement:v9 bindings:0 resultRowHandler:0];

  LODWORD(v9) = v7[2](v7);
  if (v9) { {
    long long v10 = @"RELEASE SAVEPOINT %@";
  }
  }
  else {
    long long v10 = @"ROLLBACK TO SAVEPOINT %@";
  }
  objc_msgSend(NSString, "stringWithFormat:", v10, v8);
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  [(FBSqliteApplicationDataStoreRepository *)self _dbQueue_executeStatement:v11 bindings:0 resultRowHandler:0];
}

- (BOOL)_dbQueue_executeStatement:(id)a3 bindings:(id)a4 resultRowHandler:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v14 = 0;
  BOOL v10 = [(FBSqliteApplicationDataStoreRepository *)self _dbQueue_executeStatement:v8 bindings:v9 resultRowHandler:a5 error:&v14];
  id v11 = v14;
  if (!v10)
  {
    long long v12 = FBLogAppDataStore();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      id v16 = v11;
      __int16 v17 = 2114;
      id v18 = v8;
      __int16 v19 = 2112;
      id v20 = v9;
      _os_log_error_impl(&dword_1A62FC000, v12, OS_LOG_TYPE_ERROR, "Received unexpected query error %{public}@ for query %{public}@ bindings %@", buf, 0x20u);
    }
  }
  return v10;
}

- (BOOL)_dbQueue_executeStatement:(id)a3 bindings:(id)a4 resultRowHandler:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a5;
  long long v12 = [(BSSqliteDatabaseConnection *)self->_dbQueue_dbConnection prepareStatement:a3];
  id v13 = v12;
  if (v12) { {
    char v14 = [v12 executeWithBindings:v10 resultRowHandler:v11 error:a6];
  }
  }
  else {
    char v14 = 0;
  }

  return v14;
}

uint64_t __74__FBSqliteApplicationDataStoreRepository_setObject_forKey_forApplication___block_invoke_2(uint64_t a1)
{
  v12[3] = *MEMORY[0x1E4F143B8];
  if (objc_msgSend(*(id *)(a1 + 32), "_dbQueue_containsKey:forApplication:", *(void *)(a1 + 40), *(void *)(a1 + 48)))uint64_t v2 = @"UPDATE kvs SET value = :value WHERE     application_identifier IN (SELECT id FROM application_identifier_tab WHERE application_identifier = :application_identifier)     AND key IN (SELECT id FROM key_tab WHERE key = :key);"; { {
  else
  }
  }
    uint64_t v2 = @"INSERT OR IGNORE INTO application_identifier_tab (application_identifier) VALUES (:application_identifier);INSERT OR IGNORE INTO key_tab (key) VALUES (:key);INSERT INTO kvs (application_identifier, key, value)    SELECT application_identifier_tab.id, key_tab.id, :value FROM application_identifier_tab, key_tab WHERE         application_identifier_tab.application_identifier = :application_identifier        AND key_tab.key = :key;";
  v11[0] = @":application_identifier";
  v11[1] = @":key";
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 56);
  v12[0] = *(void *)(a1 + 48);
  v12[1] = v3;
  v11[2] = @":value";
  v12[2] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
  objc_msgSend(v4, "_dbQueue_executeStatement:bindings:resultRowHandler:", v2, v6, 0);

  id v7 = *(void **)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v10 count:1];
  objc_msgSend(v7, "_dbQueue_notifyDelegateOfChangeForKeys:application:", v8, *(void *)(a1 + 48));

  return 1;
}

- (void)_dbQueue_notifyDelegateOfChangeForKeys:(id)a3 application:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v9 = WeakRetained;
  if (WeakRetained)
  {
    calloutQueue = self->_calloutQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __93__FBSqliteApplicationDataStoreRepository__dbQueue_notifyDelegateOfChangeForKeys_application___block_invoke;
    block[3] = &unk_1E5C49860;
    id v12 = WeakRetained;
    id v13 = v6;
    id v14 = v7;
    dispatch_async(calloutQueue, block);
  }
}

- (BOOL)_dbQueue_containsKey:(id)a3 forApplication:(id)a4
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dbQueue);
  if (!v6)
  {
    id v11 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"key"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBSqliteApplicationDataStoreRepository _dbQueue_containsKey:forApplication:]();
    }
    }
    [v11 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A630D258);
  }
  if (!v7)
  {
    id v12 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"identifier"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBSqliteApplicationDataStoreRepository _dbQueue_containsKey:forApplication:]();
    }
    }
    [v12 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A630D2BCLL);
  }
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  v18[0] = @":application_identifier";
  v18[1] = @":key";
  v19[0] = v7;
  v19[1] = v6;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __78__FBSqliteApplicationDataStoreRepository__dbQueue_containsKey_forApplication___block_invoke;
  v13[3] = &unk_1E5C4AB50;
  v13[4] = &v14;
  -[FBSqliteApplicationDataStoreRepository _dbQueue_executeStatement:bindings:resultRowHandler:](self, "_dbQueue_executeStatement:bindings:resultRowHandler:", @"SELECT 1 FROM kvs, application_identifier_tab, key_tab WHERE    application_identifier_tab.application_identifier = :application_identifier    AND key_tab.key = :key    AND kvs.application_identifier = application_identifier_tab.id    AND kvs.key = key_tab.id;",
    v8,
    v13);

  BOOL v9 = *((unsigned char *)v15 + 24) != 0;
  _Block_object_dispose(&v14, 8);

  return v9;
}

void __79__FBSqliteApplicationDataStoreRepository__dbQueue_objectForKey_forApplication___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [(id)objc_opt_class() _objectForResultRow:v3 index:0];

  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

+ (id)_objectForResultRow:(id)a3 index:(unint64_t)a4
{
  uint64_t v4 = [a3 objectAtIndex:a4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [MEMORY[0x1E4F28F98] propertyListWithData:v4 options:0 format:0 error:0];
  }
  else
  {
    id v5 = v4;
  }
  id v6 = v5;

  return v6;
}

uint64_t __60__FBSqliteApplicationDataStoreRepository_flushSynchronously__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_dbQueue_executeStatement:bindings:resultRowHandler:", @"PRAGMA wal_checkpoint(FULL);",
           0,
           0);
}

- (void)removeObjectForKey:(id)a3 forApplication:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6 && v7)
  {
    dbQueue = self->_dbQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __76__FBSqliteApplicationDataStoreRepository_removeObjectForKey_forApplication___block_invoke;
    block[3] = &unk_1E5C49860;
    void block[4] = self;
    id v11 = v7;
    id v12 = v6;
    dispatch_async(dbQueue, block);
  }
}

- (void)flushSynchronously
{
  dbQueue = self->_dbQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__FBSqliteApplicationDataStoreRepository_flushSynchronously__block_invoke;
  block[3] = &unk_1E5C49AE0;
  void block[4] = self;
  dispatch_sync(dbQueue, block);
}

- (FBSqliteApplicationDataStoreRepository)initWithStorePath:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)FBSqliteApplicationDataStoreRepository;
  id v6 = [(FBSqliteApplicationDataStoreRepository *)&v16 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_storeURL, a3);
    uint64_t Serial = BSDispatchQueueCreateSerial();
    dbQueue = v7->_dbQueue;
    v7->_dbQueue = (OS_dispatch_queue *)Serial;

    uint64_t v10 = BSDispatchQueueCreateSerial();
    calloutQueue = v7->_calloutQueue;
    v7->_calloutQueue = (OS_dispatch_queue *)v10;

    v7->_dbQueue_firstUnlockToken = -1;
    id v12 = v7->_dbQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__FBSqliteApplicationDataStoreRepository_initWithStorePath___block_invoke;
    block[3] = &unk_1E5C49AE0;
    id v15 = v7;
    dispatch_async(v12, block);
  }
  return v7;
}

uint64_t __60__FBSqliteApplicationDataStoreRepository_initWithStorePath___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_dbQueue_load");
}

- (void)dealloc
{
  id v3 = self->_dbQueue_dbConnection;
  dbQueue = self->_dbQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__FBSqliteApplicationDataStoreRepository_dealloc__block_invoke;
  block[3] = &unk_1E5C49AE0;
  id v8 = v3;
  id v5 = v3;
  dispatch_async(dbQueue, block);

  v6.receiver = self;
  v6.super_class = (Class)FBSqliteApplicationDataStoreRepository;
  [(FBSqliteApplicationDataStoreRepository *)&v6 dealloc];
}

uint64_t __49__FBSqliteApplicationDataStoreRepository_dealloc__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) close];
}

- (FBApplicationDataStoreRepositoryDelegate)delegate
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  BOOL v9 = __Block_byref_object_copy__5;
  uint64_t v10 = __Block_byref_object_dispose__5;
  id v11 = 0;
  dbQueue = self->_dbQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__FBSqliteApplicationDataStoreRepository_delegate__block_invoke;
  v5[3] = &unk_1E5C4A3D0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dbQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (FBApplicationDataStoreRepositoryDelegate *)v3;
}

void __50__FBSqliteApplicationDataStoreRepository_delegate__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = WeakRetained;
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  dbQueue = self->_dbQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__FBSqliteApplicationDataStoreRepository_setDelegate___block_invoke;
  v7[3] = &unk_1E5C497A0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dbQueue, v7);
}

id __54__FBSqliteApplicationDataStoreRepository_setDelegate___block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(void *)(a1 + 32) + 16), *(id *)(a1 + 40));
}

- (id)applicationIdentifiersWithState
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  BOOL v9 = __Block_byref_object_copy__5;
  uint64_t v10 = __Block_byref_object_dispose__5;
  id v11 = 0;
  dbQueue = self->_dbQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __73__FBSqliteApplicationDataStoreRepository_applicationIdentifiersWithState__block_invoke;
  v5[3] = &unk_1E5C4A3D0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dbQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __73__FBSqliteApplicationDataStoreRepository_applicationIdentifiersWithState__block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_dbQueue_applicationIdentifiersWithState");
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)keysForApplication:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    uint64_t v12 = 0;
    id v13 = &v12;
    uint64_t v14 = 0x3032000000;
    id v15 = __Block_byref_object_copy__5;
    objc_super v16 = __Block_byref_object_dispose__5;
    id v17 = 0;
    dbQueue = self->_dbQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__FBSqliteApplicationDataStoreRepository_keysForApplication___block_invoke;
    block[3] = &unk_1E5C4A448;
    id v11 = &v12;
    void block[4] = self;
    id v10 = v4;
    dispatch_sync(dbQueue, block);
    id v7 = (id)v13[5];

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    id v7 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v7;
}

void __61__FBSqliteApplicationDataStoreRepository_keysForApplication___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_dbQueue_keysForApplication:", *(void *)(a1 + 40));
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (BOOL)containsKey:(id)a3 forApplication:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  BOOL v9 = 0;
  if (v6 && v7)
  {
    uint64_t v16 = 0;
    id v17 = &v16;
    uint64_t v18 = 0x2020000000;
    char v19 = 0;
    dbQueue = self->_dbQueue;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __69__FBSqliteApplicationDataStoreRepository_containsKey_forApplication___block_invoke;
    v12[3] = &unk_1E5C4A420;
    id v15 = &v16;
    void v12[4] = self;
    id v13 = v6;
    id v14 = v8;
    dispatch_sync(dbQueue, v12);
    BOOL v9 = *((unsigned char *)v17 + 24) != 0;

    _Block_object_dispose(&v16, 8);
  }

  return v9;
}

uint64_t __69__FBSqliteApplicationDataStoreRepository_containsKey_forApplication___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_dbQueue_containsKey:forApplication:", *(void *)(a1 + 40), *(void *)(a1 + 48));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = result;
  return result;
}

- (id)allObjectsForKeys:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    uint64_t v11 = 0;
    uint64_t v12 = &v11;
    uint64_t v13 = 0x3032000000;
    id v14 = __Block_byref_object_copy__5;
    id v15 = __Block_byref_object_dispose__5;
    id v16 = 0;
    dbQueue = self->_dbQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__FBSqliteApplicationDataStoreRepository_allObjectsForKeys___block_invoke;
    block[3] = &unk_1E5C4A448;
    id v10 = &v11;
    void block[4] = self;
    id v9 = v4;
    dispatch_sync(dbQueue, block);
    id v6 = (id)v12[5];

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

void __60__FBSqliteApplicationDataStoreRepository_allObjectsForKeys___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_dbQueue_objectsForKeys:", *(void *)(a1 + 40));
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)close
{
  dbQueue = self->_dbQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__FBSqliteApplicationDataStoreRepository_close__block_invoke;
  block[3] = &unk_1E5C49AE0;
  void block[4] = self;
  dispatch_sync(dbQueue, block);
}

void __47__FBSqliteApplicationDataStoreRepository_close__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 32);
  *(void *)(v2 + 32) = 0;
}

- (void)removeObjectsForKeys:(id)a3 forApplication:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 count];
  if (v7 && v8)
  {
    dbQueue = self->_dbQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __78__FBSqliteApplicationDataStoreRepository_removeObjectsForKeys_forApplication___block_invoke;
    block[3] = &unk_1E5C49860;
    void block[4] = self;
    id v11 = v6;
    id v12 = v7;
    dispatch_async(dbQueue, block);
  }
}

void __78__FBSqliteApplicationDataStoreRepository_removeObjectsForKeys_forApplication___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = *(void *)(a1 + 40);
  id v6 = 0;
  objc_msgSend(v2, "_generateParameterizedQuery:forKeyList:outBindings:", @"DELETE FROM kvs WHERE     application_identifier IN (SELECT id FROM application_identifier_tab WHERE application_identifier = :application_identifier)     AND key IN (SELECT id FROM key_tab WHERE key IN (%@));",
    v3,
  id v4 = &v6);
  id v5 = v6;
  [v5 setObject:*(void *)(a1 + 48) forKeyedSubscript:@":application_identifier"];
  objc_msgSend(*(id *)(a1 + 32), "_dbQueue_executeStatement:bindings:resultRowHandler:", v4, v5, 0);
  objc_msgSend(*(id *)(a1 + 32), "_dbQueue_notifyDelegateOfChangeForKeys:application:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)removeAllObjectsForApplication:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    dbQueue = self->_dbQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __73__FBSqliteApplicationDataStoreRepository_removeAllObjectsForApplication___block_invoke;
    v7[3] = &unk_1E5C497A0;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(dbQueue, v7);
  }
}

uint64_t __73__FBSqliteApplicationDataStoreRepository_removeAllObjectsForApplication___block_invoke(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v6 = @":application_identifier";
  v7[0] = v2;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  objc_msgSend(v3, "_dbQueue_executeStatement:bindings:resultRowHandler:", @"DELETE FROM kvs WHERE     application_identifier IN (SELECT id FROM application_identifier_tab WHERE application_identifier = :application_identifier);",
    v4,
    0);

  return objc_msgSend(*(id *)(a1 + 32), "_dbQueue_notifyDelegateOfStoreInvalidationForIdentifier:", *(void *)(a1 + 40));
}

- (void)beginBatchedUpdate
{
  dbQueue = self->_dbQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__FBSqliteApplicationDataStoreRepository_beginBatchedUpdate__block_invoke;
  block[3] = &unk_1E5C49AE0;
  void block[4] = self;
  dispatch_async(dbQueue, block);
}

void *__60__FBSqliteApplicationDataStoreRepository_beginBatchedUpdate__block_invoke(uint64_t a1)
{
  uint64_t result = *(void **)(a1 + 32);
  uint64_t v3 = result[5];
  if (!v3)
  {
    objc_msgSend(result, "_dbQueue_executeStatement:bindings:resultRowHandler:", @"PRAGMA cache_size=2000;BEGIN TRANSACTION;",
      0,
      0);
    uint64_t result = *(void **)(a1 + 32);
    uint64_t v3 = result[5];
  }
  result[5] = v3 + 1;
  return result;
}

- (void)endBatchedUpdate
{
  dbQueue = self->_dbQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__FBSqliteApplicationDataStoreRepository_endBatchedUpdate__block_invoke;
  block[3] = &unk_1E5C49AE0;
  void block[4] = self;
  dispatch_async(dbQueue, block);
}

void *__58__FBSqliteApplicationDataStoreRepository_endBatchedUpdate__block_invoke(void *result)
{
  uint64_t v1 = result[4];
  uint64_t v2 = *(void *)(v1 + 40);
  if (v2)
  {
    *(void *)(v1 + 40) = v2 - 1;
    uint64_t result = (void *)result[4];
    if (!result[5]) { {
      return objc_msgSend(result, "_dbQueue_executeStatement:bindings:resultRowHandler:", @"COMMIT;PRAGMA cache_size=10;",
    }
    }
                         0,
                         0);
  }
  return result;
}

- (id)migrateIdentifier:(id)a3 toIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(FBSqliteApplicationDataStoreRepository *)self beginBatchedUpdate];
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__5;
  v25 = __Block_byref_object_dispose__5;
  id v26 = 0;
  dbQueue = self->_dbQueue;
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  id v15 = __73__FBSqliteApplicationDataStoreRepository_migrateIdentifier_toIdentifier___block_invoke;
  id v16 = &unk_1E5C4A4E8;
  id v17 = self;
  id v9 = v6;
  id v18 = v9;
  id v20 = &v21;
  id v10 = v7;
  id v19 = v10;
  dispatch_sync(dbQueue, &v13);
  [(FBSqliteApplicationDataStoreRepository *)self endBatchedUpdate];
  id v11 = (id)v22[5];

  _Block_object_dispose(&v21, 8);

  return v11;
}

void __73__FBSqliteApplicationDataStoreRepository_migrateIdentifier_toIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v26 = objc_msgSend(*(id *)(a1 + 32), "_dbQueue_keysForApplication:", *(void *)(a1 + 40));
  if ([v26 count])
  {
    v25 = objc_msgSend(*(id *)(a1 + 32), "_dbQueue_keysForApplication:", *(void *)(a1 + 48));
    if ([v25 count])
    {
      uint64_t v2 = (void *)MEMORY[0x1E4F28C58];
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __73__FBSqliteApplicationDataStoreRepository_migrateIdentifier_toIdentifier___block_invoke_3;
      v40[3] = &unk_1E5C4A4C0;
      id v41 = *(id *)(a1 + 48);
      uint64_t v3 = objc_msgSend(v2, "bs_errorWithDomain:code:configuration:", @"FBApplicationDataStore", 1, v40);
      uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
      id v5 = *(void **)(v4 + 40);
      *(void *)(v4 + 40) = v3;
    }
    else
    {
      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id obj = v26;
      uint64_t v11 = [obj countByEnumeratingWithState:&v36 objects:v51 count:16];
      if (v11)
      {
        uint64_t v28 = *(void *)v37;
        do
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v37 != v28) { {
              objc_enumerationMutation(obj);
            }
            }
            uint64_t v13 = *(void *)(*((void *)&v36 + 1) + 8 * v12);
            uint64_t v30 = 0;
            v31 = &v30;
            uint64_t v32 = 0x3032000000;
            v33 = __Block_byref_object_copy__5;
            v34 = __Block_byref_object_dispose__5;
            id v35 = 0;
            id v15 = *(void **)(a1 + 32);
            uint64_t v14 = *(void *)(a1 + 40);
            v49[0] = @":application_identifier";
            v49[1] = @":key";
            v50[0] = v14;
            v50[1] = v13;
            id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v50 forKeys:v49 count:2];
            v29[0] = MEMORY[0x1E4F143A8];
            v29[1] = 3221225472;
            v29[2] = __73__FBSqliteApplicationDataStoreRepository_migrateIdentifier_toIdentifier___block_invoke_4;
            v29[3] = &unk_1E5C4AB50;
            v29[4] = &v30;
            objc_msgSend(v15, "_dbQueue_executeStatement:bindings:resultRowHandler:", @"SELECT value FROM kvs, application_identifier_tab, key_tab WHERE    application_identifier_tab.application_identifier = :application_identifier    AND key_tab.key = :key    AND kvs.application_identifier = application_identifier_tab.id    AND kvs.key = key_tab.id;",
              v16,
              v29);

            id v17 = *(void **)(a1 + 32);
            uint64_t v18 = *(void *)(a1 + 48);
            v47[0] = @":application_identifier";
            v47[1] = @":key";
            v48[0] = v18;
            v48[1] = v13;
            v47[2] = @":value";
            v48[2] = v31[5];
            id v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:v47 count:3];
            objc_msgSend(v17, "_dbQueue_executeStatement:bindings:resultRowHandler:", @"INSERT OR IGNORE INTO application_identifier_tab (application_identifier) VALUES (:application_identifier);INSERT OR IGNORE INTO key_tab (key) VALUES (:key);INSERT INTO kvs (application_identifier, key, value)    SELECT application_identifier_tab.id, key_tab.id, :value FROM application_identifier_tab, key_tab WHERE         application_identifier_tab.application_identifier = :application_identifier        AND key_tab.key = :key;",
              v19,
              0);

            _Block_object_dispose(&v30, 8);
            ++v12;
          }
          while (v11 != v12);
          uint64_t v11 = [obj countByEnumeratingWithState:&v36 objects:v51 count:16];
        }
        while (v11);
      }

      id v20 = *(void **)(a1 + 32);
      uint64_t v21 = *(void *)(a1 + 40);
      v45 = @":application_identifier";
      uint64_t v46 = v21;
      v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v46 forKeys:&v45 count:1];
      objc_msgSend(v20, "_dbQueue_executeStatement:bindings:resultRowHandler:", @"DELETE FROM kvs WHERE     application_identifier IN (SELECT id FROM application_identifier_tab WHERE application_identifier = :application_identifier);",
        v22,
        0);

      uint64_t v23 = *(void **)(a1 + 32);
      id v44 = obj;
      v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v44 count:1];
      objc_msgSend(v23, "_dbQueue_notifyDelegateOfChangeForKeys:application:", v24, *(void *)(a1 + 48));

      objc_msgSend(*(id *)(a1 + 32), "_dbQueue_notifyDelegateOfStoreInvalidationForIdentifier:", *(void *)(a1 + 40));
    }
    id v10 = v25;
  }
  else
  {
    id v6 = (void *)MEMORY[0x1E4F28C58];
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __73__FBSqliteApplicationDataStoreRepository_migrateIdentifier_toIdentifier___block_invoke_2;
    v42[3] = &unk_1E5C4A4C0;
    id v43 = *(id *)(a1 + 40);
    uint64_t v7 = objc_msgSend(v6, "bs_errorWithDomain:code:configuration:", @"FBApplicationDataStore", 1, v42);
    uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    id v10 = v43;
  }
}

uint64_t __73__FBSqliteApplicationDataStoreRepository_migrateIdentifier_toIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setFailureReason:@"No store exists for identifier \"%@\"", *(void *)(a1 + 32)];
}

uint64_t __73__FBSqliteApplicationDataStoreRepository_migrateIdentifier_toIdentifier___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 setFailureReason:@"Store already exists with identifier \"%@\"", *(void *)(a1 + 32)];
}

void __73__FBSqliteApplicationDataStoreRepository_migrateIdentifier_toIdentifier___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 objectAtIndex:0];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __63__FBSqliteApplicationDataStoreRepository__isEligibleForSaving___block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1C978]);
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_msgSend(v0, "initWithObjects:", v1, v2, v3, v4, v5, objc_opt_class(), 0);
  uint64_t v7 = (void *)_isEligibleForSaving____eligibleClassTypes_0;
  _isEligibleForSaving____eligibleClassTypes_0 = v6;
}

- (void)_dbQueue_load
{
  BOOL v3 = [(FBSqliteApplicationDataStoreRepository *)self _dbQueue_loadDatabase];
  uint64_t v4 = FBLogAppDataStore();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1A62FC000, v4, OS_LOG_TYPE_DEFAULT, "Successfully loaded application data store.", (uint8_t *)buf, 2u);
    }
  }
  else
  {
    if (v5)
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1A62FC000, v4, OS_LOG_TYPE_DEFAULT, "Waiting to load application data store for first unlock.", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    dbQueue = self->_dbQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    void v7[2] = __55__FBSqliteApplicationDataStoreRepository__dbQueue_load__block_invoke;
    v7[3] = &unk_1E5C4AB78;
    objc_copyWeak(&v8, buf);
    v7[4] = self;
    notify_register_dispatch("com.apple.mobile.keybagd.first_unlock", &self->_dbQueue_firstUnlockToken, dbQueue, v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(buf);
  }
}

void __55__FBSqliteApplicationDataStoreRepository__dbQueue_load__block_invoke(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v5 = objc_msgSend(WeakRetained, "_dbQueue_loadDatabase");
  uint64_t v6 = FBLogAppDataStore();
  uint64_t v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_1A62FC000, v7, OS_LOG_TYPE_DEFAULT, "Successfully loaded application data store after first unlock.", v8, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_dbQueue_notifyDelegateOfLateLoad");
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) { {
      __55__FBSqliteApplicationDataStoreRepository__dbQueue_load__block_invoke_cold_1(v7);
    }
    }
  }
  WeakRetained[12] = -1;
  notify_cancel(a2);
}

- (BOOL)_dbQueue_databaseIntegrityCheck
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __73__FBSqliteApplicationDataStoreRepository__dbQueue_databaseIntegrityCheck__block_invoke;
  void v11[3] = &unk_1E5C4ABA0;
  id v4 = v3;
  id v12 = v4;
  id v10 = 0;
  BOOL v5 = -[FBSqliteApplicationDataStoreRepository _dbQueue_executeStatement:bindings:resultRowHandler:error:](self, "_dbQueue_executeStatement:bindings:resultRowHandler:error:", @"PRAGMA quick_check;",
         0,
         v11,
         &v10);
  id v6 = v10;
  if (!v5)
  {
    id v8 = FBLogAppDataStore();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) { {
      -[FBSqliteApplicationDataStoreRepository _dbQueue_databaseIntegrityCheck]();
    }
    }
    goto LABEL_8;
  }
  if (([v4 isEqualToArray:&unk_1EFB27328] & 1) == 0)
  {
    id v8 = FBLogAppDataStore();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) { {
      -[FBSqliteApplicationDataStoreRepository _dbQueue_databaseIntegrityCheck]();
    }
    }
LABEL_8:
    char v7 = !v5;

    goto LABEL_9;
  }
  char v7 = 1;
LABEL_9:

  return v7;
}

void __73__FBSqliteApplicationDataStoreRepository__dbQueue_databaseIntegrityCheck__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [a2 stringAtIndex:0];
  [v2 addObject:v3];
}

- (id)_dbQueue_openDatabase
{
  storeURL = self->_storeURL;
  p_storeURL = &self->_storeURL;
  id v5 = objc_alloc(MEMORY[0x1E4F628C8]);
  if (storeURL) { {
    uint64_t v6 = [v5 initWithFileURL:*p_storeURL dataProtectionClass:1];
  }
  }
  else {
    uint64_t v6 = [v5 initWithInMemoryDatabase];
  }
  char v7 = (void *)v6;
  if (!v6)
  {
    id v8 = FBLogAppDataStore();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) { {
      [(FBSqliteApplicationDataStoreRepository *)(uint64_t)p_storeURL _dbQueue_openDatabase];
    }
    }
  }

  return v7;
}

- (id)urlByAppendingString:(id)a3 toURL:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  char v7 = [v5 lastPathComponent];
  id v8 = [v5 URLByDeletingLastPathComponent];

  uint64_t v9 = [v7 stringByAppendingString:v6];

  uint64_t v10 = [v8 URLByAppendingPathComponent:v9];

  return v10;
}

- (BOOL)_preserveFileAtURL:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (MEMORY[0x1AD0B8630]("-[FBSqliteApplicationDataStoreRepository _preserveFileAtURL:]"))
  {
    id v4 = [v3 URLByAppendingPathExtension:@"damaged"];
    id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v5 removeItemAtURL:v4 error:0];
    id v15 = 0;
    int v6 = [v5 copyItemAtURL:v3 toURL:v4 error:&v15];
    id v7 = v15;
    id v8 = v7;
    if (v6)
    {
      uint64_t v9 = *MEMORY[0x1E4F1C630];
      id v14 = v7;
      char v10 = [v4 setResourceValue:MEMORY[0x1E4F1CC38] forKey:v9 error:&v14];
      id v11 = v14;

      if (v10)
      {
LABEL_11:

        goto LABEL_12;
      }
      uint64_t v12 = FBLogAppDataStore();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) { {
        -[FBSqliteApplicationDataStoreRepository _preserveFileAtURL:]();
      }
      }
    }
    else
    {
      uint64_t v12 = FBLogAppDataStore();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        id v17 = v3;
        __int16 v18 = 2114;
        id v19 = v4;
        __int16 v20 = 2114;
        uint64_t v21 = v8;
        _os_log_error_impl(&dword_1A62FC000, v12, OS_LOG_TYPE_ERROR, "Error copying damaged database file from URL %{public}@ to URL %{public}@: %{public}@", buf, 0x20u);
      }
      id v11 = v8;
    }

    goto LABEL_11;
  }
  LOBYTE(v6) = 1;
LABEL_12:

  return v6;
}

- (BOOL)_dbQueue_tryPreserveDamagedDatabase
{
  if (self->_storeURL)
  {
    id v3 = -[FBSqliteApplicationDataStoreRepository urlByAppendingString:toURL:](self, "urlByAppendingString:toURL:", @"-wal");
    id v4 = [(FBSqliteApplicationDataStoreRepository *)self urlByAppendingString:@"-shm" toURL:self->_storeURL];
    BOOL v5 = [(FBSqliteApplicationDataStoreRepository *)self _preserveFileAtURL:self->_storeURL];
    BOOL v6 = [(FBSqliteApplicationDataStoreRepository *)self _preserveFileAtURL:v3];
    BOOL v7 = [(FBSqliteApplicationDataStoreRepository *)self _preserveFileAtURL:v4] && v6 && v5;
  }
  else
  {
    LOBYTE(v7) = 1;
  }
  return v7;
}

- (BOOL)_dbQueue_truncateDamagedDatabase
{
  dbQueue_dbConnection = self->_dbQueue_dbConnection;
  id v7 = 0;
  char v3 = [(BSSqliteDatabaseConnection *)dbQueue_dbConnection truncateDatabaseAndReturnError:&v7];
  id v4 = v7;
  if ((v3 & 1) == 0)
  {
    BOOL v5 = FBLogAppDataStore();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) { {
      -[FBSqliteApplicationDataStoreRepository _dbQueue_truncateDamagedDatabase]();
    }
    }
  }
  return v3;
}

- (BOOL)_dbQueue_loadDatabase
{
  char v3 = [(FBSqliteApplicationDataStoreRepository *)self _dbQueue_openDatabase];
  dbQueue_dbConnection = self->_dbQueue_dbConnection;
  self->_dbQueue_dbConnection = v3;

  if (!self->_dbQueue_dbConnection) { {
    goto LABEL_14;
  }
  }
  if (![(FBSqliteApplicationDataStoreRepository *)self _inAlternateSystemApp]
    && ![(FBSqliteApplicationDataStoreRepository *)self _dbQueue_databaseIntegrityCheck])
  {
    ADClientAddValueForScalarKey();
    [(BSSqliteDatabaseConnection *)self->_dbQueue_dbConnection close];
    BOOL v6 = self->_dbQueue_dbConnection;
    self->_dbQueue_dbConnection = 0;

    [(FBSqliteApplicationDataStoreRepository *)self _dbQueue_tryPreserveDamagedDatabase];
    id v7 = [(FBSqliteApplicationDataStoreRepository *)self _dbQueue_openDatabase];
    id v8 = self->_dbQueue_dbConnection;
    self->_dbQueue_dbConnection = v7;

    if (self->_dbQueue_dbConnection)
    {
      BOOL v5 = [(FBSqliteApplicationDataStoreRepository *)self _dbQueue_truncateDamagedDatabase];
      if (!v5) { {
        return v5;
      }
      }
      BOOL v9 = [(FBSqliteApplicationDataStoreRepository *)self _dbQueue_databaseIntegrityCheck];
      char v10 = FBLogAppDataStore();
      id v11 = v10;
      if (v9)
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A62FC000, v11, OS_LOG_TYPE_DEFAULT, "Successfully truncated damaged database", buf, 2u);
        }

        ADClientAddValueForScalarKey();
        goto LABEL_4;
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) { {
        -[FBSqliteApplicationDataStoreRepository _dbQueue_loadDatabase](v11);
      }
      }
    }
LABEL_14:
    LOBYTE(v5) = 0;
    return v5;
  }
LABEL_4:
  [(FBSqliteApplicationDataStoreRepository *)self _dbQueue_executeStatement:@"PRAGMA busy_timeout=1000000" bindings:0 resultRowHandler:0];
  -[FBSqliteApplicationDataStoreRepository _dbQueue_executeStatement:bindings:resultRowHandler:](self, "_dbQueue_executeStatement:bindings:resultRowHandler:", @"PRAGMA journal_mode=WAL;",
    0,
    0);
  -[FBSqliteApplicationDataStoreRepository _dbQueue_executeStatement:bindings:resultRowHandler:](self, "_dbQueue_executeStatement:bindings:resultRowHandler:", @"PRAGMA synchronous=NORMAL;",
    0,
    0);
  -[FBSqliteApplicationDataStoreRepository _dbQueue_executeStatement:bindings:resultRowHandler:](self, "_dbQueue_executeStatement:bindings:resultRowHandler:", @"PRAGMA cache_size=10;",
    0,
    0);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __63__FBSqliteApplicationDataStoreRepository__dbQueue_loadDatabase__block_invoke;
  v13[3] = &unk_1E5C49E80;
  v13[4] = self;
  [(FBSqliteApplicationDataStoreRepository *)self _dbQueue_performWithSavepoint:@"schema" handler:v13];
  -[FBSqliteApplicationDataStoreRepository _dbQueue_executeStatement:bindings:resultRowHandler:](self, "_dbQueue_executeStatement:bindings:resultRowHandler:", @"PRAGMA foreign_keys=ON;",
    0,
    0);
  -[FBSqliteApplicationDataStoreRepository _dbQueue_executeStatement:bindings:resultRowHandler:](self, "_dbQueue_executeStatement:bindings:resultRowHandler:", @"DELETE FROM application_identifier_tab WHERE application_identifier_tab.id NOT IN (SELECT DISTINCT application_identifier FROM kvs);DELETE FROM key_tab WHERE key_tab.id NOT IN (SELECT DISTINCT key FROM kvs);",
    0,
    0);
  LOBYTE(v5) = 1;
  return v5;
}

uint64_t __63__FBSqliteApplicationDataStoreRepository__dbQueue_loadDatabase__block_invoke(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "_dbQueue_databaseVersion") <= 0) { {
    objc_msgSend(*(id *)(a1 + 32), "_dbQueue_createTables");
  }
  }
  return 1;
}

- (id)_dbQueue_applicationIdentifiersWithState
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __82__FBSqliteApplicationDataStoreRepository__dbQueue_applicationIdentifiersWithState__block_invoke;
  v7[3] = &unk_1E5C4ABA0;
  id v8 = v3;
  id v4 = v3;
  [(FBSqliteApplicationDataStoreRepository *)self _dbQueue_executeStatement:@"SELECT application_identifier_tab.application_identifier FROM application_identifier_tab WHERE    application_identifier_tab.id IN (SELECT DISTINCT application_identifier FROM kvs)" bindings:0 resultRowHandler:v7];
  BOOL v5 = (void *)[v4 copy];

  return v5;
}

void __82__FBSqliteApplicationDataStoreRepository__dbQueue_applicationIdentifiersWithState__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [a2 stringAtIndex:0];
  [v2 addObject:v3];
}

- (id)_dbQueue_keysForApplication:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dbQueue);
  if (!v4)
  {
    char v10 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"identifier"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBSqliteApplicationDataStoreRepository _dbQueue_keysForApplication:]();
    }
    }
    [v10 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A634E9C4);
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v13 = @":application_identifier";
  v14[0] = v4;
  BOOL v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __70__FBSqliteApplicationDataStoreRepository__dbQueue_keysForApplication___block_invoke;
  void v11[3] = &unk_1E5C4ABA0;
  id v12 = v5;
  id v7 = v5;
  -[FBSqliteApplicationDataStoreRepository _dbQueue_executeStatement:bindings:resultRowHandler:](self, "_dbQueue_executeStatement:bindings:resultRowHandler:", @"SELECT key_tab.key FROM kvs,key_tab,application_identifier_tab WHERE    application_identifier_tab.application_identifier = :application_identifier    AND kvs.application_identifier = application_identifier_tab.id    AND kvs.key = key_tab.id;",
    v6,
    v11);

  id v8 = (void *)[v7 copy];

  return v8;
}

void __70__FBSqliteApplicationDataStoreRepository__dbQueue_keysForApplication___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [a2 stringAtIndex:0];
  [v2 addObject:v3];
}

+ (id)_generateParameterizedQuery:(id)a3 forKeyList:(id)a4 outBindings:(id *)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!a5)
  {
    v25 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"outBindings"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      +[FBSqliteApplicationDataStoreRepository _generateParameterizedQuery:forKeyList:outBindings:]();
    }
    }
    [v25 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A634EC8CLL);
  }
  BOOL v9 = v8;
  if (![v8 count])
  {
    id v26 = [NSString stringWithFormat:@"key list must contain at least one key"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      +[FBSqliteApplicationDataStoreRepository _generateParameterizedQuery:forKeyList:outBindings:]();
    }
    }
    [v26 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A634ECE4);
  }
  v27 = v7;
  uint64_t v10 = [v9 count];
  id v11 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v10];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v12 = v9;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = 0;
    uint64_t v16 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v29 != v16) { {
          objc_enumerationMutation(v12);
        }
        }
        uint64_t v18 = *(void *)(*((void *)&v28 + 1) + 8 * i);
        id v19 = objc_msgSend(NSString, "stringWithFormat:", @":k%lu", v15 + i);
        [v11 setObject:v18 forKeyedSubscript:v19];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
      v15 += i;
    }
    while (v14);
  }

  __int16 v20 = [v11 allKeys];
  uint64_t v21 = [v20 componentsJoinedByString:@","];
  uint64_t v22 = [v27 stringByReplacingOccurrencesOfString:@"%@" withString:v21];

  id v23 = v11;
  *a5 = v23;

  return v22;
}

- (id)_dbQueue_objectsForKeys:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dbQueue);
  if (v4)
  {
    id v5 = [MEMORY[0x1E4F1CA60] sharedKeySetForKeys:v4];
    id v17 = 0;
    objc_msgSend((id)objc_opt_class(), "_generateParameterizedQuery:forKeyList:outBindings:", @"SELECT application_identifier_tab.application_identifier, key_tab.key, kvs.value FROM kvs, application_identifier_tab, key_tab WHERE    key_tab.key IN (%@)    AND kvs.application_identifier = application_identifier_tab.id    AND kvs.key = key_tab.id;",
      v4,
    BOOL v6 = &v17);
    id v7 = v17;
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    void v14[2] = __66__FBSqliteApplicationDataStoreRepository__dbQueue_objectsForKeys___block_invoke;
    v14[3] = &unk_1E5C4ABF0;
    v14[4] = self;
    id v15 = v8;
    id v16 = v5;
    id v9 = v5;
    id v10 = v8;
    [(FBSqliteApplicationDataStoreRepository *)self _dbQueue_executeStatement:v6 bindings:v7 resultRowHandler:v14];
    id v11 = (void *)[v10 copy];

    return v11;
  }
  else
  {
    uint64_t v13 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"keys"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBSqliteApplicationDataStoreRepository _dbQueue_objectsForKeys:]();
    }
    }
    [v13 UTF8String];
    id result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

void __66__FBSqliteApplicationDataStoreRepository__dbQueue_objectsForKeys___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v9 = [v3 stringAtIndex:0];
  id v4 = [v3 stringAtIndex:1];
  id v5 = [(id)objc_opt_class() _objectForResultRow:v3 index:2];

  if (v5) { {
    BOOL v6 = v4 == 0;
  }
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6 && v9 != 0)
  {
    id v8 = [*(id *)(a1 + 40) objectForKeyedSubscript:v9];
    if (!v8)
    {
      id v8 = [MEMORY[0x1E4F1CA60] dictionaryWithSharedKeySet:*(void *)(a1 + 48)];
      [*(id *)(a1 + 40) setObject:v8 forKeyedSubscript:v9];
    }
    [v8 setObject:v5 forKeyedSubscript:v4];
  }
}

- (void)_dbQueue_notifyDelegateOfStoreInvalidationForIdentifier:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  BOOL v6 = WeakRetained;
  if (WeakRetained)
  {
    calloutQueue = self->_calloutQueue;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __98__FBSqliteApplicationDataStoreRepository__dbQueue_notifyDelegateOfStoreInvalidationForIdentifier___block_invoke;
    v8[3] = &unk_1E5C497A0;
    id v9 = WeakRetained;
    id v10 = v4;
    dispatch_async(calloutQueue, v8);
  }
}

uint64_t __98__FBSqliteApplicationDataStoreRepository__dbQueue_notifyDelegateOfStoreInvalidationForIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) storeInvalidatedForIdentifier:*(void *)(a1 + 40)];
}

- (void)_dbQueue_notifyDelegateOfLateLoad
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    [(FBSqliteApplicationDataStoreRepository *)self _dbQueue_applicationIdentifiersWithState];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v4 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v18 != v6) { {
            objc_enumerationMutation(obj);
          }
          }
          uint64_t v8 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          id v9 = [(FBSqliteApplicationDataStoreRepository *)self _dbQueue_keysForApplication:v8];
          calloutQueue = self->_calloutQueue;
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __75__FBSqliteApplicationDataStoreRepository__dbQueue_notifyDelegateOfLateLoad__block_invoke;
          block[3] = &unk_1E5C49860;
          id v14 = WeakRetained;
          id v15 = v9;
          uint64_t v16 = v8;
          id v11 = v9;
          dispatch_async(calloutQueue, block);
        }
        uint64_t v5 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v5);
    }
  }
}

uint64_t __75__FBSqliteApplicationDataStoreRepository__dbQueue_notifyDelegateOfLateLoad__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) objectChangedForKeys:*(void *)(a1 + 40) application:*(void *)(a1 + 48)];
}

- (int64_t)_dbQueue_databaseVersion
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = -1;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __66__FBSqliteApplicationDataStoreRepository__dbQueue_databaseVersion__block_invoke;
  v4[3] = &unk_1E5C4AB50;
  v4[4] = &v5;
  [(FBSqliteApplicationDataStoreRepository *)self _dbQueue_executeStatement:@"SELECT version FROM schema" bindings:0 resultRowHandler:v4 error:0];
  int64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __66__FBSqliteApplicationDataStoreRepository__dbQueue_databaseVersion__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 integerAtIndex:0];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (void)_dbQueue_createTables
{
  id v3 = FBLogAppDataStore();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A62FC000, v3, OS_LOG_TYPE_DEFAULT, "Creating new database tables.", buf, 2u);
  }

  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __63__FBSqliteApplicationDataStoreRepository__dbQueue_createTables__block_invoke;
  v4[3] = &unk_1E5C49E80;
  v4[4] = self;
  [(FBSqliteApplicationDataStoreRepository *)self _dbQueue_performWithSavepoint:@"createTables" handler:v4];
}

uint64_t __63__FBSqliteApplicationDataStoreRepository__dbQueue_createTables__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v6 = 0;
  uint64_t v2 = objc_msgSend(v1, "_dbQueue_executeStatement:bindings:resultRowHandler:error:", @"CREATE TABLE schema(version INT NOT NULL);INSERT INTO schema (version) VALUES (1);CREATE TABLE key_tab (id INTEGER PRIMARY KEY, key TEXT NOT NULL, UNIQUE(key));CREATE TABLE application_identifier_tab (id INTEGER PRIMARY KEY, application_identifier TEXT NOT NULL, UNIQUE(application_identifier));CREATE TABLE kvs(   id INTEGER PRIMARY KEY,    application_identifier INT REFERENCES application_identifier_tab(id),    key INT REFERENCES key_tab(id),    value BLOB,    UNIQUE(application_identifier, key));CREATE INDEX kvs_keys ON kvs(key);CREATE INDEX kvs_application_identifiers ON kvs(application_identifier);CREATE VIEW kvs_debug AS     SELECT application_identifier_tab.application_identifier, key_tab.key, value FROM application_identifier_tab, key_tab, kvs WHERE         kvs.application_identifier=application_identifier_tab.id         AND kvs.key=key_tab.id;",
         0,
         0,
         &v6);
  id v3 = v6;
  if ((v2 & 1) == 0)
  {
    uint64_t v4 = FBLogAppDataStore();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) { {
      __63__FBSqliteApplicationDataStoreRepository__dbQueue_createTables__block_invoke_cold_1((uint64_t)v3, v4);
    }
    }
  }
  return v2;
}

- (BOOL)_inAlternateSystemApp
{
  if (_inAlternateSystemApp_onceToken != -1) { {
    dispatch_once(&_inAlternateSystemApp_onceToken, &__block_literal_global_177);
  }
  }
  return _inAlternateSystemApp_inAlternateSystemApp;
}

void __63__FBSqliteApplicationDataStoreRepository__inAlternateSystemApp__block_invoke()
{
  id v2 = [MEMORY[0x1E4F62888] defaultShellMachName];
  id v0 = [MEMORY[0x1E4F62848] environmentAliases];
  uint64_t v1 = [v0 resolveMachService:v2];

  _inAlternateSystemApp_inAlternateSystemApp = [v2 isEqualToString:v1] ^ 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeURL, 0);
}

- (void)setObject:forKey:forApplication:.cold.1()
{
  id v2 = (objc_class *)OUTLINED_FUNCTION_6();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

void __55__FBSqliteApplicationDataStoreRepository__dbQueue_load__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)SEL v1 = 0;
  _os_log_fault_impl(&dword_1A62FC000, log, OS_LOG_TYPE_FAULT, "Attempt to open database after first unlock failed.", v1, 2u);
}

- (void)_dbQueue_databaseIntegrityCheck
{
}

- (void)_dbQueue_openDatabase
{
}

- (void)_preserveFileAtURL:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_7_1();
  __int16 v3 = 2114;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_1A62FC000, v1, OS_LOG_TYPE_ERROR, "Error marking URL %{public}@ as excluded from backup %{public}@", v2, 0x16u);
}

- (void)_dbQueue_truncateDamagedDatabase
{
}

- (void)_dbQueue_loadDatabase
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1A62FC000, log, OS_LOG_TYPE_ERROR, "Database integrity check failed after starting fresh", v1, 2u);
}

- (void)_dbQueue_objectForKey:forApplication:.cold.1()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_10();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_dbQueue_objectForKey:forApplication:.cold.2()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_10();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_dbQueue_containsKey:forApplication:.cold.1()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_10();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_dbQueue_containsKey:forApplication:.cold.2()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_10();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_dbQueue_keysForApplication:.cold.1()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)_generateParameterizedQuery:forKeyList:outBindings:.cold.1()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)_generateParameterizedQuery:forKeyList:outBindings:.cold.2()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_dbQueue_objectsForKeys:.cold.1()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

void __63__FBSqliteApplicationDataStoreRepository__dbQueue_createTables__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = "-[FBSqliteApplicationDataStoreRepository _dbQueue_createTables]_block_invoke";
  __int16 v4 = 2114;
  uint64_t v5 = a1;
  __int16 v6 = 2114;
  uint64_t v7 = @"CREATE TABLE schema(version INT NOT NULL);INSERT INTO schema (version) VALUES (1);CREATE TABLE key_tab (id INTEGER PRIMARY KEY, key TEXT NOT NULL, UNIQUE(key));CREATE TABLE application_identifier_tab (id INTEGER PRIMARY KEY, application_identifier TEXT NOT NULL, UNIQUE(application_identifier));CREATE TABLE kvs(   id INTEGER PRIMARY KEY,    application_identifier INT REFERENCES application_identifier_tab(id),    key INT REFERENCES key_tab(id),    value BLOB,    UNIQUE(application_identifier, key));CREATE INDEX kvs_keys ON kvs(key);CREATE INDEX kvs_application_identifiers ON kvs(application_identifier);CREATE VIEW kvs_debug AS     SELECT application_identifier_tab.application_identifier, key_tab.key, value FROM application_identifier_tab, key_tab, kvs WHERE         kvs.application_identifier=application_identifier_tab.id         AND kvs.key=key_tab.id;";
  _os_log_error_impl(&dword_1A62FC000, a2, OS_LOG_TYPE_ERROR, "%s: received error %{public}@ creating tables (query = %{public}@)", (uint8_t *)&v2, 0x20u);
}

@end