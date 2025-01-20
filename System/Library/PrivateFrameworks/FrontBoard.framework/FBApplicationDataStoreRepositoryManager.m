@interface FBApplicationDataStoreRepositoryManager
+ (id)sharedInstance;
- (BOOL)migrateFromApplicationStore:(id)a3 toApplicationStore:(id)a4 error:(id *)a5;
- (BOOL)migrateFromPlistStoreAtURL:(id)a3 toSqliteStoreAtURL:(id)a4 error:(id *)a5;
- (BOOL)removeStoreAtURL:(id)a3 error:(id *)a4;
- (FBApplicationDataStoreRepository)dataStore;
- (FBApplicationDataStoreRepositoryManager)init;
- (id)_initWithDataStore:(id)a3 lsEnumerator:(id)a4;
- (id)_safeObjectForKey:(id)a3 forApplication:(id)a4 ofType:(Class)a5;
- (id)urlByAppendingString:(id)a3 toURL:(id)a4;
- (void)_handleApplicationInstalled:(id)a3;
- (void)_performAfterDeferredWork:(id)a3;
- (void)clearExpiredUninstalledApplicationsFromStoreIfNecessary;
- (void)dealloc;
- (void)migrateApplicationStorePathIfNecessary;
- (void)objectChangedForKeys:(id)a3 application:(id)a4;
- (void)setDataStore:(id)a3;
- (void)storeInvalidatedForIdentifier:(id)a3;
@end

@implementation FBApplicationDataStoreRepositoryManager

- (void)objectChangedForKeys:(id)a3 application:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = v7;
  uint64_t v10 = [obj countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v21 != v12) { {
          objc_enumerationMutation(obj);
        }
        }
        uint64_t v14 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        v15 = (void *)MEMORY[0x1AD0B8A00]();
        v16 = [(FBApplicationDataStoreRepository *)self->_dataStore objectForKey:v14 forApplication:v8];
        v24[0] = @"FBApplicationStoreRepositoryChangeKey";
        v24[1] = @"FBApplicationStoreRepositoryChangeApp";
        v25[0] = v14;
        v25[1] = v8;
        v17 = v16;
        v24[2] = @"FBApplicationStoreRepositoryChangeValue";
        if (!v16)
        {
          v4 = [MEMORY[0x1E4F1CA98] null];
          v17 = v4;
        }
        v25[2] = v17;
        v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:3];
        [v9 postNotificationName:@"FBApplicationStoreRepositoryChangeNotification" object:0 userInfo:v18];

        if (!v16) { {
      }
        }
        }
      uint64_t v11 = [obj countByEnumeratingWithState:&v20 objects:v26 count:16];
    }
    while (v11);
  }
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__FBApplicationDataStoreRepositoryManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_8 != -1) { {
    dispatch_once(&sharedInstance_onceToken_8, block);
  }
  }
  v2 = (void *)sharedInstance_sharedInstance;

  return v2;
}

void __57__FBApplicationDataStoreRepositoryManager_sharedInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v1;
}

- (FBApplicationDataStoreRepositoryManager)init
{
  return (FBApplicationDataStoreRepositoryManager *)[(FBApplicationDataStoreRepositoryManager *)self _initWithDataStore:0 lsEnumerator:0];
}

- (id)_initWithDataStore:(id)a3 lsEnumerator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)FBApplicationDataStoreRepositoryManager;
  id v8 = [(FBApplicationDataStoreRepositoryManager *)&v22 init];
  if (v8)
  {
    v9 = (void *)MEMORY[0x1E4F1CB10];
    uint64_t v10 = [@"~/Library/FrontBoard/applicationState.db" stringByExpandingTildeInPath];
    uint64_t v11 = [v9 fileURLWithPath:v10];
    dataStoreURL = v8->_dataStoreURL;
    v8->_dataStoreURL = (NSURL *)v11;

    objc_storeStrong((id *)&v8->_lsEnumerator, a4);
    DistributedCenter = CFNotificationCenterGetDistributedCenter();
    CFNotificationCenterAddObserver(DistributedCenter, v8, (CFNotificationCallback)_handleApplicationsRegisteredNotification, @"com.apple.LaunchServices.applicationRegistered", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    [(FBApplicationDataStoreRepositoryManager *)v8 migrateApplicationStorePathIfNecessary];
    if (v6) { {
      uint64_t v14 = (FBSqliteApplicationDataStoreRepository *)v6;
    }
    }
    else {
      uint64_t v14 = [[FBSqliteApplicationDataStoreRepository alloc] initWithStorePath:v8->_dataStoreURL];
    }
    dataStore = v8->_dataStore;
    v8->_dataStore = (FBApplicationDataStoreRepository *)v14;

    [(FBApplicationDataStoreRepository *)v8->_dataStore setDelegate:v8];
    uint64_t Serial = BSDispatchQueueCreateSerial();
    deferredWorkQueue = v8->_deferredWorkQueue;
    v8->_deferredWorkQueue = (OS_dispatch_queue *)Serial;

    v18 = v8->_deferredWorkQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __75__FBApplicationDataStoreRepositoryManager__initWithDataStore_lsEnumerator___block_invoke;
    block[3] = &unk_1E5C49AE0;
    long long v21 = v8;
    dispatch_async(v18, block);
  }
  return v8;
}

uint64_t __75__FBApplicationDataStoreRepositoryManager__initWithDataStore_lsEnumerator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) clearExpiredUninstalledApplicationsFromStoreIfNecessary];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FBApplicationDataStoreRepositoryManager;
  [(FBApplicationDataStoreRepositoryManager *)&v3 dealloc];
}

- (id)urlByAppendingString:(id)a3 toURL:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v5 lastPathComponent];
  id v8 = [v5 URLByDeletingLastPathComponent];

  v9 = [v7 stringByAppendingString:v6];

  uint64_t v10 = [v8 URLByAppendingPathComponent:v9];

  return v10;
}

- (BOOL)removeStoreAtURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  if ([v7 removeItemAtURL:self->_dataStoreURL error:a4])
  {
    id v8 = [(FBApplicationDataStoreRepositoryManager *)self urlByAppendingString:@"-shm" toURL:v6];
    v9 = [v8 path];
    int v10 = [v7 fileExistsAtPath:v9];

    if (v10 && ![v7 removeItemAtURL:v8 error:a4])
    {
      BOOL v14 = 0;
    }
    else
    {
      uint64_t v11 = [(FBApplicationDataStoreRepositoryManager *)self urlByAppendingString:@"-wal" toURL:v6];
      uint64_t v12 = [v11 path];
      int v13 = [v7 fileExistsAtPath:v12];

      BOOL v14 = !v13 || [v7 removeItemAtURL:v11 error:a4];
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (void)migrateApplicationStorePathIfNecessary
{
  v66[3] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  v4 = [(NSURL *)self->_dataStoreURL path];
  int v5 = [v3 fileExistsAtPath:v4];

  int v47 = v5;
  if ((v5 & 1) == 0)
  {
    id v6 = [(NSURL *)self->_dataStoreURL URLByDeletingLastPathComponent];
    [v3 createDirectoryAtURL:v6 withIntermediateDirectories:1 attributes:0 error:0];
  }
  id v7 = (void *)MEMORY[0x1E4F1CB10];
  id v8 = [@"~/Library/FrontBoard/applicationState.plist" stringByExpandingTildeInPath];
  v9 = [v7 fileURLWithPath:v8];
  v66[0] = v9;
  int v10 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v11 = [@"~/Library/BackBoard/applicationState.plist" stringByExpandingTildeInPath];
  uint64_t v12 = [v10 fileURLWithPath:v11];
  v66[1] = v12;
  int v13 = (void *)MEMORY[0x1E4F1CB10];
  BOOL v14 = [@"~/Library/SpringBoard/applicationstate.plist" stringByExpandingTildeInPath];
  v15 = [v13 fileURLWithPath:v14];
  v66[2] = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v66 count:3];

  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v17 = v16;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v54 objects:v65 count:16];
  if (v18)
  {
    uint64_t v20 = v18;
    uint64_t v21 = *(void *)v55;
    *(void *)&long long v19 = 138543874;
    long long v46 = v19;
    while (2)
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v55 != v21) { {
          objc_enumerationMutation(v17);
        }
        }
        long long v23 = *(void **)(*((void *)&v54 + 1) + 8 * i);
        v24 = objc_msgSend(v23, "path", v46);
        int v25 = [v3 fileExistsAtPath:v24];

        if (v25)
        {
          if (v47)
          {
            dataStoreURL = self->_dataStoreURL;
            id v53 = 0;
            BOOL v27 = [(FBApplicationDataStoreRepositoryManager *)self removeStoreAtURL:dataStoreURL error:&v53];
            id v28 = v53;
            if (!v27)
            {
              v29 = FBLogAppDataStore();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
              {
                v35 = self->_dataStoreURL;
                *(_DWORD *)buf = v46;
                v60 = v23;
                __int16 v61 = 2114;
                v62 = v35;
                __int16 v63 = 2114;
                id v64 = v28;
                _os_log_error_impl(&dword_1A62FC000, v29, OS_LOG_TYPE_ERROR, "Unable to migrate application state store from %{public}@ to %{public}@ due to error: %{public}@", buf, 0x20u);
              }
            }
          }
          else
          {
            id v28 = 0;
          }
          v30 = self->_dataStoreURL;
          id v52 = v28;
          BOOL v31 = [(FBApplicationDataStoreRepositoryManager *)self migrateFromPlistStoreAtURL:v23 toSqliteStoreAtURL:v30 error:&v52];
          id v32 = v52;

          if (v31)
          {
            v36 = FBLogAppDataStore();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
            {
              v37 = self->_dataStoreURL;
              *(_DWORD *)buf = 138543618;
              v60 = v23;
              __int16 v61 = 2114;
              v62 = v37;
              _os_log_impl(&dword_1A62FC000, v36, OS_LOG_TYPE_INFO, "Successfully migrated application state store from %{public}@ to %{public}@.", buf, 0x16u);
            }

            goto LABEL_27;
          }
          if (v32)
          {
            v33 = FBLogAppDataStore();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            {
              v34 = self->_dataStoreURL;
              *(_DWORD *)buf = v46;
              v60 = v23;
              __int16 v61 = 2114;
              v62 = v34;
              __int16 v63 = 2114;
              id v64 = v32;
              _os_log_error_impl(&dword_1A62FC000, v33, OS_LOG_TYPE_ERROR, "Unable to migrate application state store from %{public}@ to %{public}@ due to error: %{public}@", buf, 0x20u);
            }
          }
        }
      }
      uint64_t v20 = [v17 countByEnumeratingWithState:&v54 objects:v65 count:16];
      if (v20) { {
        continue;
      }
      }
      break;
    }
  }
LABEL_27:

  v38 = [MEMORY[0x1E4F1CA80] setWithArray:v17];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  uint64_t v39 = [v38 countByEnumeratingWithState:&v48 objects:v58 count:16];
  if (v39)
  {
    uint64_t v40 = v39;
    uint64_t v41 = *(void *)v49;
    do
    {
      for (uint64_t j = 0; j != v40; ++j)
      {
        if (*(void *)v49 != v41) { {
          objc_enumerationMutation(v38);
        }
        }
        v43 = *(void **)(*((void *)&v48 + 1) + 8 * j);
        v44 = [v43 path];
        int v45 = [v3 fileExistsAtPath:v44];

        if (v45) { {
          [v3 removeItemAtURL:v43 error:0];
        }
        }
      }
      uint64_t v40 = [v38 countByEnumeratingWithState:&v48 objects:v58 count:16];
    }
    while (v40);
  }
}

- (BOOL)migrateFromApplicationStore:(id)a3 toApplicationStore:(id)a4 error:(id *)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [v7 beginBatchedUpdate];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v8 = [v7 applicationIdentifiersWithState];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v35 != v11) { {
          objc_enumerationMutation(v8);
        }
        }
        [v7 removeAllObjectsForApplication:*(void *)(*((void *)&v34 + 1) + 8 * i)];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v34 objects:v40 count:16];
    }
    while (v10);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = [v6 applicationIdentifiersWithState];
  uint64_t v25 = [obj countByEnumeratingWithState:&v30 objects:v39 count:16];
  if (v25)
  {
    uint64_t v24 = *(void *)v31;
    do
    {
      for (uint64_t j = 0; j != v25; ++j)
      {
        if (*(void *)v31 != v24) { {
          objc_enumerationMutation(obj);
        }
        }
        uint64_t v14 = *(void *)(*((void *)&v30 + 1) + 8 * j);
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        v15 = [v6 keysForApplication:v14];
        uint64_t v16 = [v15 countByEnumeratingWithState:&v26 objects:v38 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v27;
          do
          {
            for (uint64_t k = 0; k != v17; ++k)
            {
              if (*(void *)v27 != v18) { {
                objc_enumerationMutation(v15);
              }
              }
              uint64_t v20 = *(void *)(*((void *)&v26 + 1) + 8 * k);
              uint64_t v21 = [v6 objectForKey:v20 forApplication:v14];
              if (v21) { {
                [v7 setObject:v21 forKey:v20 forApplication:v14];
              }
              }
            }
            uint64_t v17 = [v15 countByEnumeratingWithState:&v26 objects:v38 count:16];
          }
          while (v17);
        }
      }
      uint64_t v25 = [obj countByEnumeratingWithState:&v30 objects:v39 count:16];
    }
    while (v25);
  }

  [v7 endBatchedUpdate];
  [v7 flushSynchronously];

  return 1;
}

- (BOOL)migrateFromPlistStoreAtURL:(id)a3 toSqliteStoreAtURL:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [[FBPlistApplicationDataStoreRepository alloc] initWithStorePath:v9];

  uint64_t v11 = [[FBSqliteApplicationDataStoreRepository alloc] initWithStorePath:v8];
  if (v10) { {
    BOOL v12 = v11 == 0;
  }
  }
  else {
    BOOL v12 = 1;
  }
  BOOL v13 = !v12
     && [(FBApplicationDataStoreRepositoryManager *)self migrateFromApplicationStore:v10 toApplicationStore:v11 error:a5];

  return v13;
}

- (void)clearExpiredUninstalledApplicationsFromStoreIfNecessary
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_1A62FC000, log, OS_LOG_TYPE_ERROR, "LSEnumerator returned zero apps", v1, 2u);
}

uint64_t __98__FBApplicationDataStoreRepositoryManager_clearExpiredUninstalledApplicationsFromStoreIfNecessary__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) clearExpiredUninstalledApplicationsFromStoreIfNecessary];
}

uint64_t __98__FBApplicationDataStoreRepositoryManager_clearExpiredUninstalledApplicationsFromStoreIfNecessary__block_invoke_57(uint64_t a1)
{
  return [*(id *)(a1 + 32) clearExpiredUninstalledApplicationsFromStoreIfNecessary];
}

- (id)_safeObjectForKey:(id)a3 forApplication:(id)a4 ofType:(Class)a5
{
  int v5 = [(FBApplicationDataStoreRepository *)self->_dataStore objectForKey:a3 forApplication:a4];
  if (v5 && (objc_opt_isKindOfClass() & 1) != 0) { {
    id v6 = v5;
  }
  }
  else {
    id v6 = 0;
  }

  return v6;
}

- (void)_handleApplicationInstalled:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v21 != v7) { {
          objc_enumerationMutation(v4);
        }
        }
        [(FBApplicationDataStoreRepository *)self->_dataStore removeObjectForKey:@"__UninstallDate" forApplication:*(void *)(*((void *)&v20 + 1) + 8 * i)];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v6);
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = [(FBApplicationDataStoreRepository *)self->_dataStore applicationIdentifiersWithState];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t j = 0; j != v11; ++j)
      {
        if (*(void *)v17 != v12) { {
          objc_enumerationMutation(v9);
        }
        }
        uint64_t v14 = *(void **)(*((void *)&v16 + 1) + 8 * j);
        v15 = objc_msgSend(v14, "fbs_bundleIDFromAppID");
        if ([v4 containsObject:v15]) { {
          [(FBApplicationDataStoreRepository *)self->_dataStore removeObjectForKey:@"__UninstallDate" forApplication:v14];
        }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v11);
  }
}

- (void)_performAfterDeferredWork:(id)a3
{
}

- (void)storeInvalidatedForIdentifier:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F28EB8];
  id v4 = a3;
  uint64_t v5 = [v3 defaultCenter];
  uint64_t v7 = @"FBApplicationStoreRepositoryChangeApp";
  v8[0] = v4;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];

  [v5 postNotificationName:@"FBApplicationStoreRepositoryInvalidatedNotification" object:0 userInfo:v6];
}

- (FBApplicationDataStoreRepository)dataStore
{
  return self->_dataStore;
}

- (void)setDataStore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataStoreURL, 0);
}

@end