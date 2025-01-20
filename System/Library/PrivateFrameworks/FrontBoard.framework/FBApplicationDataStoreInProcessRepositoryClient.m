@interface FBApplicationDataStoreInProcessRepositoryClient
- (BOOL)prefetchedObjectIfAvailableForKey:(id)a3 application:(id)a4 outObject:(id *)a5;
- (FBApplicationDataStoreInProcessRepositoryClient)init;
- (FBApplicationDataStoreInProcessRepositoryClient)initWithDataStore:(id)a3;
- (id)_observers;
- (id)_prefetchQueue_prefetchedKeysForApplication:(id)a3;
- (id)availableDataStores;
- (id)migrateIdentifier:(id)a3 toIdentifier:(id)a4;
- (id)objectForKey:(id)a3 forApplication:(id)a4;
- (void)_invalidateCacheIfObjectIsNotEqual:(id)a3 forKey:(id)a4 forApplication:(id)a5;
- (void)_prefetchQueue_updateNotificationListeners;
- (void)_repositoryInvalidated:(id)a3;
- (void)_updateCacheIfNecessaryWithObject:(id)a3 forKey:(id)a4 forApplication:(id)a5;
- (void)_updateNotificationListeners;
- (void)_valueChanged:(id)a3;
- (void)addObserver:(id)a3;
- (void)addPrefetchedKeys:(id)a3;
- (void)objectForKey:(id)a3 forApplication:(id)a4 withResult:(id)a5;
- (void)removeAllObjectsForApplication:(id)a3 withCompletion:(id)a4;
- (void)removeObjectForKey:(id)a3 forApplication:(id)a4 withCompletion:(id)a5;
- (void)removeObserver:(id)a3;
- (void)removePrefetchedKeys:(id)a3 withCompletion:(id)a4;
- (void)setObject:(id)a3 forKey:(id)a4 forApplication:(id)a5 withCompletion:(id)a6;
- (void)synchronizeWithCompletion:(id)a3;
@end

@implementation FBApplicationDataStoreInProcessRepositoryClient

void __107__FBApplicationDataStoreInProcessRepositoryClient_prefetchedObjectIfAvailableForKey_application_outObject___block_invoke(void *a1)
{
  v2 = a1 + 5;
  v3 = [*(id *)(a1[4] + 24) objectForKey:a1[5]];
  v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 objectForKey:a1[6]];
    uint64_t v6 = *(void *)(a1[7] + 8);
    v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    if (*(void *)(*(void *)(a1[7] + 8) + 40)
      || [*(id *)(a1[4] + 16) containsObject:a1[6]])
    {
      *(unsigned char *)(*(void *)(a1[8] + 8) + 24) = 1;
    }
  }
  v8 = *(void **)(*(void *)(a1[7] + 8) + 40);
  v9 = +[FBApplicationDataStoreInProcessRepositoryClientInvalidationSentinel sentinel];

  if (v8 == v9)
  {
    v10 = FBLogAppDataStore();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) { {
      __107__FBApplicationDataStoreInProcessRepositoryClient_prefetchedObjectIfAvailableForKey_application_outObject___block_invoke_cold_1((uint64_t)a1, v2, v10);
    }
    }

    uint64_t v11 = [*(id *)(a1[4] + 8) objectForKey:a1[6] forApplication:a1[5]];
    uint64_t v12 = *(void *)(a1[7] + 8);
    v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;

    uint64_t v14 = *(void *)(*(void *)(a1[7] + 8) + 40);
    if (v14) { {
      [v4 setObject:v14 forKey:a1[6]];
    }
    }
    else {
      [v4 removeObjectForKey:a1[6]];
    }
  }
  v15 = *(void **)(*(void *)(a1[7] + 8) + 40);
  v16 = [MEMORY[0x1E4F1CA98] null];
  char v17 = [v15 isEqual:v16];
  uint64_t v18 = *(void *)(a1[7] + 8);
  if (v17) { {
    v19 = 0;
  }
  }
  else {
    v19 = *(void **)(v18 + 40);
  }
  objc_storeStrong((id *)(v18 + 40), v19);
}

- (id)objectForKey:(id)a3 forApplication:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = FBLogAppDataStore();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) { {
    -[FBApplicationDataStoreInProcessRepositoryClient objectForKey:forApplication:]();
  }
  }

  id v14 = 0;
  BOOL v9 = [(FBApplicationDataStoreInProcessRepositoryClient *)self prefetchedObjectIfAvailableForKey:v6 application:v7 outObject:&v14];
  id v10 = v14;
  if (v9)
  {
    uint64_t v11 = FBLogAppDataStore();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) { {
      -[FBApplicationDataStoreInProcessRepositoryClient objectForKey:forApplication:](v10);
    }
    }
    uint64_t v12 = v10;
  }
  else
  {
    uint64_t v12 = [(FBApplicationDataStoreRepository *)self->_dataStore objectForKey:v6 forApplication:v7];

    if (!v12) { {
      goto LABEL_11;
    }
    }
    uint64_t v11 = FBLogAppDataStore();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) { {
      -[FBApplicationDataStoreInProcessRepositoryClient objectForKey:forApplication:](v12);
    }
    }
  }

LABEL_11:

  return v12;
}

- (BOOL)prefetchedObjectIfAvailableForKey:(id)a3 application:(id)a4 outObject:(id *)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__7;
  v40 = __Block_byref_object_dispose__7;
  id v41 = 0;
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2020000000;
  char v35 = 0;
  id v10 = FBLogAppDataStore();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) { {
    -[FBApplicationDataStoreInProcessRepositoryClient prefetchedObjectIfAvailableForKey:application:outObject:]();
  }
  }

  prefetchQueue = self->_prefetchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __107__FBApplicationDataStoreInProcessRepositoryClient_prefetchedObjectIfAvailableForKey_application_outObject___block_invoke;
  block[3] = &unk_1E5C4BB50;
  block[4] = self;
  id v12 = v9;
  id v28 = v12;
  v30 = &v36;
  id v13 = v8;
  id v29 = v13;
  v31 = &v32;
  dispatch_sync(prefetchQueue, block);
  if (*((unsigned char *)v33 + 24))
  {
    id v14 = FBLogAppDataStore();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v15 = _descriptionForObject((void *)v37[5]);
      -[FBApplicationDataStoreInProcessRepositoryClient prefetchedObjectIfAvailableForKey:application:outObject:](v15, buf, v14);
    }

    if (a5)
    {
      id v16 = (id) v37[5];
LABEL_12:
      *a5 = v16;
    }
  }
  else
  {
    char v17 = FBLogAppDataStore();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) { {
      -[FBApplicationDataStoreInProcessRepositoryClient prefetchedObjectIfAvailableForKey:application:outObject:](v17, v18, v19, v20, v21, v22, v23, v24);
    }
    }

    if (a5)
    {
      id v16 = 0;
      goto LABEL_12;
    }
  }
  BOOL v25 = *((unsigned char *)v33 + 24) != 0;

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);

  return v25;
}

- (void)setObject:(id)a3 forKey:(id)a4 forApplication:(id)a5 withCompletion:(id)a6
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = FBLogAppDataStore();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v15 = _descriptionForObject(v10);
    *(_DWORD *)buf = 138543874;
    id v20 = v11;
    __int16 v21 = 2112;
    id v22 = v12;
    __int16 v23 = 2112;
    uint64_t v24 = v15;
    _os_log_impl(&dword_1A62FC000, v14, OS_LOG_TYPE_INFO, "setting object for key=%{public}@ appID=%@ object=%@", buf, 0x20u);
  }
  [(FBApplicationDataStoreInProcessRepositoryClient *)self _updateCacheIfNecessaryWithObject:v10 forKey:v11 forApplication:v12];
  [(FBApplicationDataStoreRepository *)self->_dataStore setObject:v10 forKey:v11 forApplication:v12];
  if (v13)
  {
    clientCalloutQueue = self->_clientCalloutQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __98__FBApplicationDataStoreInProcessRepositoryClient_setObject_forKey_forApplication_withCompletion___block_invoke;
    block[3] = &unk_1E5C498D8;
    id v18 = v13;
    dispatch_async(clientCalloutQueue, block);
  }
}

- (void)_updateCacheIfNecessaryWithObject:(id)a3 forKey:(id)a4 forApplication:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  prefetchQueue = self->_prefetchQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __107__FBApplicationDataStoreInProcessRepositoryClient__updateCacheIfNecessaryWithObject_forKey_forApplication___block_invoke;
  v15[3] = &unk_1E5C49838;
  v15[4] = self;
  id v16 = v9;
  id v17 = v10;
  id v18 = v8;
  id v12 = v8;
  id v13 = v10;
  id v14 = v9;
  dispatch_sync(prefetchQueue, v15);
}

void __65__FBApplicationDataStoreInProcessRepositoryClient__valueChanged___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = objc_msgSend(*(id *)(a1 + 32), "_observers", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) { {
          objc_enumerationMutation(v2);
        }
        }
        id v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) { {
          [v7 applicationDataStoreRepositoryClient:*(void *)(a1 + 32) application:*(void *)(a1 + 40) changedObject:*(void *)(a1 + 48) forKey:*(void *)(a1 + 56)];
        }
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (id)_observers
{
  p_observersLock = &self->_observersLock;
  os_unfair_lock_assert_not_owner(&self->_observersLock);
  os_unfair_lock_lock(p_observersLock);
  uint64_t v4 = [(NSHashTable *)self->_observersLock_observers allObjects];
  os_unfair_lock_unlock(p_observersLock);

  return v4;
}

void __107__FBApplicationDataStoreInProcessRepositoryClient__updateCacheIfNecessaryWithObject_forKey_forApplication___block_invoke(uint64_t a1)
{
  uint64_t v2 = a1 + 40;
  if ([*(id *)(*(void *)(a1 + 32) + 16) containsObject:*(void *)(a1 + 40)])
  {
    uint64_t v3 = FBLogAppDataStore();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) { {
      __107__FBApplicationDataStoreInProcessRepositoryClient__updateCacheIfNecessaryWithObject_forKey_forApplication___block_invoke_cold_1(v2, a1);
    }
    }

    uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "_prefetchQueue_prefetchedKeysForApplication:", *(void *)(a1 + 48));
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)(a1 + 56);
    if (v6) { {
      [v4 setObject:v6 forKey:*(void *)(a1 + 40)];
    }
    }
    else {
      [v4 removeObjectForKey:*(void *)(a1 + 40)];
    }
  }
}

void __108__FBApplicationDataStoreInProcessRepositoryClient__invalidateCacheIfObjectIsNotEqual_forKey_forApplication___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)(a1 + 40);
  if ([*(id *)(*(void *)(a1 + 32) + 16) containsObject:*(void *)(a1 + 40)])
  {
    uint64_t v3 = FBLogAppDataStore();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) { {
      __108__FBApplicationDataStoreInProcessRepositoryClient__invalidateCacheIfObjectIsNotEqual_forKey_forApplication___block_invoke_cold_3((uint64_t)v2, a1);
    }
    }

    uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "_prefetchQueue_prefetchedKeysForApplication:", *(void *)(a1 + 48));
    uint64_t v5 = [v4 objectForKey:*(void *)(a1 + 40)];
    char v6 = BSEqualObjects();
    id v7 = FBLogAppDataStore();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
    if (v6)
    {
      if (v8) { {
        __108__FBApplicationDataStoreInProcessRepositoryClient__invalidateCacheIfObjectIsNotEqual_forKey_forApplication___block_invoke_cold_1(v7, v9, v10, v11, v12, v13, v14, v15);
      }
      }
    }
    else
    {
      if (v8) { {
        __108__FBApplicationDataStoreInProcessRepositoryClient__invalidateCacheIfObjectIsNotEqual_forKey_forApplication___block_invoke_cold_2(v7, v9, v10, v11, v12, v13, v14, v15);
      }
      }

      id v7 = +[FBApplicationDataStoreInProcessRepositoryClientInvalidationSentinel sentinel];
      [v4 setObject:v7 forKey:*v2];
    }
  }
}

- (id)_prefetchQueue_prefetchedKeysForApplication:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_prefetchQueue);
  uint64_t v5 = [(NSMutableDictionary *)self->_prefetchedKeyValues objectForKeyedSubscript:v4];
  if (!v5)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    [(NSMutableDictionary *)self->_prefetchedKeyValues setObject:v5 forKey:v4];
  }

  return v5;
}

- (void)_valueChanged:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 userInfo];
  char v6 = [v5 objectForKey:@"FBApplicationStoreRepositoryChangeApp"];

  id v7 = [v4 userInfo];
  BOOL v8 = [v7 objectForKey:@"FBApplicationStoreRepositoryChangeKey"];

  uint64_t v9 = [v4 userInfo];

  uint64_t v10 = [v9 objectForKey:@"FBApplicationStoreRepositoryChangeValue"];

  [(FBApplicationDataStoreInProcessRepositoryClient *)self _invalidateCacheIfObjectIsNotEqual:v10 forKey:v8 forApplication:v6];
  clientCalloutQueue = self->_clientCalloutQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __65__FBApplicationDataStoreInProcessRepositoryClient__valueChanged___block_invoke;
  v15[3] = &unk_1E5C49838;
  v15[4] = self;
  id v16 = v6;
  id v17 = v10;
  id v18 = v8;
  id v12 = v8;
  id v13 = v10;
  id v14 = v6;
  dispatch_async(clientCalloutQueue, v15);
}

- (void)_invalidateCacheIfObjectIsNotEqual:(id)a3 forKey:(id)a4 forApplication:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  prefetchQueue = self->_prefetchQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __108__FBApplicationDataStoreInProcessRepositoryClient__invalidateCacheIfObjectIsNotEqual_forKey_forApplication___block_invoke;
  v15[3] = &unk_1E5C49838;
  v15[4] = self;
  id v16 = v9;
  id v17 = v10;
  id v18 = v8;
  id v12 = v8;
  id v13 = v10;
  id v14 = v9;
  dispatch_async(prefetchQueue, v15);
}

- (void)removeObjectForKey:(id)a3 forApplication:(id)a4 withCompletion:(id)a5
{
  id v8 = a5;
  [(FBApplicationDataStoreRepository *)self->_dataStore removeObjectForKey:a3 forApplication:a4];
  if (v8)
  {
    clientCalloutQueue = self->_clientCalloutQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __100__FBApplicationDataStoreInProcessRepositoryClient_removeObjectForKey_forApplication_withCompletion___block_invoke;
    block[3] = &unk_1E5C498D8;
    id v11 = v8;
    dispatch_async(clientCalloutQueue, block);
  }
}

- (void)synchronizeWithCompletion:(id)a3
{
  id v4 = a3;
  [(FBApplicationDataStoreRepository *)self->_dataStore flushSynchronously];
  if (v4)
  {
    clientCalloutQueue = self->_clientCalloutQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __77__FBApplicationDataStoreInProcessRepositoryClient_synchronizeWithCompletion___block_invoke;
    block[3] = &unk_1E5C498D8;
    id v7 = v4;
    dispatch_async(clientCalloutQueue, block);
  }
}

- (FBApplicationDataStoreInProcessRepositoryClient)init
{
  uint64_t v3 = +[FBApplicationDataStoreRepositoryManager sharedInstance];
  id v4 = [v3 dataStore];
  uint64_t v5 = [(FBApplicationDataStoreInProcessRepositoryClient *)self initWithDataStore:v4];

  return v5;
}

- (FBApplicationDataStoreInProcessRepositoryClient)initWithDataStore:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)FBApplicationDataStoreInProcessRepositoryClient;
  char v6 = [(FBApplicationDataStoreInProcessRepositoryClient *)&v19 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dataStore, a3);
    uint64_t Serial = BSDispatchQueueCreateSerial();
    clientCalloutQueue = v7->_clientCalloutQueue;
    v7->_clientCalloutQueue = (OS_dispatch_queue *)Serial;

    id v10 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E4F28BD0]);
    prefetchedKeys = v7->_prefetchedKeys;
    v7->_prefetchedKeys = v10;

    id v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    prefetchedKeyValues = v7->_prefetchedKeyValues;
    v7->_prefetchedKeyValues = v12;

    uint64_t v14 = BSDispatchQueueCreateSerial();
    prefetchQueue = v7->_prefetchQueue;
    v7->_prefetchQueue = (OS_dispatch_queue *)v14;

    v7->_observersLock._os_unfair_lock_opaque = 0;
    uint64_t v16 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observersLock_observers = v7->_observersLock_observers;
    v7->_observersLock_observers = (NSHashTable *)v16;
  }
  return v7;
}

- (void)addPrefetchedKeys:(id)a3
{
  id v4 = a3;
  prefetchQueue = self->_prefetchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__FBApplicationDataStoreInProcessRepositoryClient_addPrefetchedKeys___block_invoke;
  v7[3] = &unk_1E5C497A0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_sync(prefetchQueue, v7);
}

void __69__FBApplicationDataStoreInProcessRepositoryClient_addPrefetchedKeys___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F1CA48] array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) { {
          objc_enumerationMutation(v3);
        }
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        [*(id *)(*(void *)(a1 + 40) + 16) addObject:v8];
        if ([*(id *)(*(void *)(a1 + 40) + 16) countForObject:v8] == 1) { {
          [v2 addObject:v8];
        }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  if ([v2 count])
  {
    id v9 = [*(id *)(*(void *)(a1 + 40) + 8) allObjectsForKeys:v2];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __69__FBApplicationDataStoreInProcessRepositoryClient_addPrefetchedKeys___block_invoke_2;
    v10[3] = &unk_1E5C4BB00;
    v10[4] = *(void *)(a1 + 40);
    [v9 enumerateKeysAndObjectsUsingBlock:v10];
    objc_msgSend(*(id *)(a1 + 40), "_prefetchQueue_updateNotificationListeners");
  }
}

void __69__FBApplicationDataStoreInProcessRepositoryClient_addPrefetchedKeys___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 24);
  id v6 = a3;
  id v7 = [v5 objectForKey:v11];
  uint64_t v8 = v7;
  if (v7)
  {
    [v7 addEntriesFromDictionary:v6];
  }
  else
  {
    id v9 = *(void **)(*(void *)(a1 + 32) + 24);
    uint64_t v10 = [v6 mutableCopy];

    [v9 setObject:v10 forKey:v11];
    id v6 = (id)v10;
  }
}

- (void)removePrefetchedKeys:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  prefetchQueue = self->_prefetchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__FBApplicationDataStoreInProcessRepositoryClient_removePrefetchedKeys_withCompletion___block_invoke;
  block[3] = &unk_1E5C497A0;
  id v9 = v6;
  id v14 = v9;
  uint64_t v15 = self;
  dispatch_sync(prefetchQueue, block);
  if (v7)
  {
    clientCalloutQueue = self->_clientCalloutQueue;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __87__FBApplicationDataStoreInProcessRepositoryClient_removePrefetchedKeys_withCompletion___block_invoke_3;
    v11[3] = &unk_1E5C498D8;
    id v12 = v7;
    dispatch_async(clientCalloutQueue, v11);
  }
}

void __87__FBApplicationDataStoreInProcessRepositoryClient_removePrefetchedKeys_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F1CA48] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) { {
          objc_enumerationMutation(v3);
        }
        }
        uint64_t v8 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        [*(id *)(*(void *)(a1 + 40) + 16) removeObject:v8];
        if (![*(id *)(*(void *)(a1 + 40) + 16) countForObject:v8]) { {
          [v2 addObject:v8];
        }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }

  id v9 = *(void **)(*(void *)(a1 + 40) + 24);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __87__FBApplicationDataStoreInProcessRepositoryClient_removePrefetchedKeys_withCompletion___block_invoke_2;
  v11[3] = &unk_1E5C4BB28;
  id v12 = v2;
  id v10 = v2;
  [v9 enumerateKeysAndObjectsUsingBlock:v11];
  objc_msgSend(*(id *)(a1 + 40), "_prefetchQueue_updateNotificationListeners");
}

uint64_t __87__FBApplicationDataStoreInProcessRepositoryClient_removePrefetchedKeys_withCompletion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 removeObjectsForKeys:*(void *)(a1 + 32)];
}

uint64_t __87__FBApplicationDataStoreInProcessRepositoryClient_removePrefetchedKeys_withCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_updateNotificationListeners
{
  prefetchQueue = self->_prefetchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__FBApplicationDataStoreInProcessRepositoryClient__updateNotificationListeners__block_invoke;
  block[3] = &unk_1E5C49AE0;
  void block[4] = self;
  dispatch_sync(prefetchQueue, block);
}

uint64_t __79__FBApplicationDataStoreInProcessRepositoryClient__updateNotificationListeners__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_prefetchQueue_updateNotificationListeners");
}

- (void)_prefetchQueue_updateNotificationListeners
{
  uint64_t v3 = [(NSCountedSet *)self->_prefetchedKeys count];
  uint64_t v4 = [(FBApplicationDataStoreInProcessRepositoryClient *)self _observers];
  uint64_t v5 = v3 | [v4 count];

  id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  if (v5)
  {
    [v6 addObserver:self selector:sel__valueChanged_ name:@"FBApplicationStoreRepositoryChangeNotification" object:0];
    [v6 addObserver:self selector:sel__repositoryInvalidated_ name:@"FBApplicationStoreRepositoryInvalidatedNotification" object:0];
  }
  else
  {
    [v6 removeObserver:self name:@"FBApplicationStoreRepositoryChangeNotification" object:0];
    [v6 removeObserver:self name:@"FBApplicationStoreRepositoryInvalidatedNotification" object:0];
  }
}

- (void)_repositoryInvalidated:(id)a3
{
  uint64_t v4 = [a3 userInfo];
  uint64_t v5 = [v4 objectForKey:@"FBApplicationStoreRepositoryChangeApp"];

  prefetchQueue = self->_prefetchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__FBApplicationDataStoreInProcessRepositoryClient__repositoryInvalidated___block_invoke;
  block[3] = &unk_1E5C497A0;
  void block[4] = self;
  id v7 = v5;
  id v13 = v7;
  dispatch_async(prefetchQueue, block);
  clientCalloutQueue = self->_clientCalloutQueue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __74__FBApplicationDataStoreInProcessRepositoryClient__repositoryInvalidated___block_invoke_2;
  v10[3] = &unk_1E5C497A0;
  v10[4] = self;
  id v11 = v7;
  id v9 = v7;
  dispatch_async(clientCalloutQueue, v10);
}

uint64_t __74__FBApplicationDataStoreInProcessRepositoryClient__repositoryInvalidated___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) removeObjectForKey:*(void *)(a1 + 40)];
}

void __74__FBApplicationDataStoreInProcessRepositoryClient__repositoryInvalidated___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_observers", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) { {
          objc_enumerationMutation(v2);
        }
        }
        id v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) { {
          [v7 applicationDataStoreRepositoryClient:*(void *)(a1 + 32) storeInvalidatedForApplication:*(void *)(a1 + 40)];
        }
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

uint64_t __77__FBApplicationDataStoreInProcessRepositoryClient_synchronizeWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)availableDataStores
{
  uint64_t v2 = [(FBApplicationDataStoreRepository *)self->_dataStore applicationIdentifiersWithState];
  if (!v2)
  {
    uint64_t v2 = [MEMORY[0x1E4F1C978] array];
  }

  return v2;
}

- (id)migrateIdentifier:(id)a3 toIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v8)
  {
    id v12 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBApplicationDataStoreInProcessRepositoryClient migrateIdentifier:toIdentifier:]();
    }
    }
LABEL_19:
    [v12 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A63670B4);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v13 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBApplicationDataStoreInProcessRepositoryClient migrateIdentifier:toIdentifier:]();
    }
    }
    [v13 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A6367118);
  }

  id v9 = v7;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v9)
  {
    long long v14 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBApplicationDataStoreInProcessRepositoryClient migrateIdentifier:toIdentifier:]();
    }
    }
    [v14 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A636717CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v12 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBApplicationDataStoreInProcessRepositoryClient migrateIdentifier:toIdentifier:]();
    }
    }
    goto LABEL_19;
  }

  long long v10 = [(FBApplicationDataStoreRepository *)self->_dataStore migrateIdentifier:v8 toIdentifier:v9];

  return v10;
}

uint64_t __98__FBApplicationDataStoreInProcessRepositoryClient_setObject_forKey_forApplication_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __100__FBApplicationDataStoreInProcessRepositoryClient_removeObjectForKey_forApplication_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removeAllObjectsForApplication:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  [(FBApplicationDataStoreRepository *)self->_dataStore removeAllObjectsForApplication:a3];
  if (v6)
  {
    clientCalloutQueue = self->_clientCalloutQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __97__FBApplicationDataStoreInProcessRepositoryClient_removeAllObjectsForApplication_withCompletion___block_invoke;
    block[3] = &unk_1E5C498D8;
    id v9 = v6;
    dispatch_async(clientCalloutQueue, block);
  }
}

uint64_t __97__FBApplicationDataStoreInProcessRepositoryClient_removeAllObjectsForApplication_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)objectForKey:(id)a3 forApplication:(id)a4 withResult:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v11 = FBLogAppDataStore();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) { {
    -[FBApplicationDataStoreInProcessRepositoryClient objectForKey:forApplication:withResult:]();
  }
  }

  if (v10)
  {
    id v22 = 0;
    BOOL v12 = [(FBApplicationDataStoreInProcessRepositoryClient *)self prefetchedObjectIfAvailableForKey:v8 application:v9 outObject:&v22];
    id v13 = v22;
    if (v12)
    {
      long long v14 = FBLogAppDataStore();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) { {
        -[FBApplicationDataStoreInProcessRepositoryClient objectForKey:forApplication:](v13);
      }
      }
      long long v15 = v13;
    }
    else
    {
      long long v15 = [(FBApplicationDataStoreRepository *)self->_dataStore objectForKey:v8 forApplication:v9];

      long long v14 = FBLogAppDataStore();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        long long v16 = _descriptionForObject(v15);
        *(_DWORD *)buf = 138412290;
        uint64_t v24 = v16;
        _os_log_impl(&dword_1A62FC000, v14, OS_LOG_TYPE_INFO, "retrieved object from store: %@", buf, 0xCu);
      }
    }

    clientCalloutQueue = self->_clientCalloutQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __90__FBApplicationDataStoreInProcessRepositoryClient_objectForKey_forApplication_withResult___block_invoke;
    block[3] = &unk_1E5C4A7A8;
    id v20 = v15;
    id v21 = v10;
    id v18 = v15;
    dispatch_async(clientCalloutQueue, block);
  }
}

uint64_t __90__FBApplicationDataStoreInProcessRepositoryClient_objectForKey_forApplication_withResult___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (void)addObserver:(id)a3
{
  p_observersLock = &self->_observersLock;
  id v5 = a3;
  os_unfair_lock_assert_not_owner(p_observersLock);
  os_unfair_lock_lock(p_observersLock);
  [(NSHashTable *)self->_observersLock_observers addObject:v5];

  os_unfair_lock_unlock(p_observersLock);

  [(FBApplicationDataStoreInProcessRepositoryClient *)self _updateNotificationListeners];
}

- (void)removeObserver:(id)a3
{
  p_observersLock = &self->_observersLock;
  id v5 = a3;
  os_unfair_lock_assert_not_owner(p_observersLock);
  os_unfair_lock_lock(p_observersLock);
  [(NSHashTable *)self->_observersLock_observers removeObject:v5];

  os_unfair_lock_unlock(p_observersLock);

  [(FBApplicationDataStoreInProcessRepositoryClient *)self _updateNotificationListeners];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataStore, 0);
}

void __107__FBApplicationDataStoreInProcessRepositoryClient__updateCacheIfNecessaryWithObject_forKey_forApplication___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = _descriptionForObject(*(void **)(a2 + 56));
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_8_4(&dword_1A62FC000, v3, v4, "updating cache key=%{public}@ appID=%@ object=%@", v5, v6, v7, v8, v9);
}

void __108__FBApplicationDataStoreInProcessRepositoryClient__invalidateCacheIfObjectIsNotEqual_forKey_forApplication___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __108__FBApplicationDataStoreInProcessRepositoryClient__invalidateCacheIfObjectIsNotEqual_forKey_forApplication___block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __108__FBApplicationDataStoreInProcessRepositoryClient__invalidateCacheIfObjectIsNotEqual_forKey_forApplication___block_invoke_cold_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = _descriptionForObject(*(void **)(a2 + 56));
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_8_4(&dword_1A62FC000, v3, v4, "conditionally invalidating cache key=%{public}@ appID=%@ object=%@", v5, v6, v7, v8, v9);
}

- (void)migrateIdentifier:toIdentifier:.cold.1()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)migrateIdentifier:toIdentifier:.cold.2()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)objectForKey:(void *)a1 forApplication:.cold.1(void *a1)
{
  SEL v1 = _descriptionForObject(a1);
  OUTLINED_FUNCTION_3_0(&dword_1A62FC000, v2, v3, "found prefetched object: %@", v4, v5, v6, v7, 2u);
}

- (void)objectForKey:(void *)a1 forApplication:.cold.2(void *a1)
{
  SEL v1 = _descriptionForObject(a1);
  OUTLINED_FUNCTION_3_0(&dword_1A62FC000, v2, v3, "retrieved object from store: %@", v4, v5, v6, v7, 2u);
}

- (void)objectForKey:forApplication:.cold.3()
{
  OUTLINED_FUNCTION_1_2(&dword_1A62FC000, v0, v1, "fetching object for key=%{public}@ appID=%@ (synchronously)");
}

- (void)objectForKey:forApplication:withResult:.cold.2()
{
  OUTLINED_FUNCTION_1_2(&dword_1A62FC000, v0, v1, "fetching object for key=%{public}@ appID=%@");
}

- (void)prefetchedObjectIfAvailableForKey:(uint64_t)a3 application:(uint64_t)a4 outObject:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)prefetchedObjectIfAvailableForKey:(void *)a1 application:(uint8_t *)buf outObject:(os_log_t)log .cold.2(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl(&dword_1A62FC000, log, OS_LOG_TYPE_DEBUG, "found object %@", buf, 0xCu);
}

- (void)prefetchedObjectIfAvailableForKey:application:outObject:.cold.3()
{
  OUTLINED_FUNCTION_1_2(&dword_1A62FC000, v0, v1, "checking for prefetched object for key=%{public}@ appID=%@");
}

void __107__FBApplicationDataStoreInProcessRepositoryClient_prefetchedObjectIfAvailableForKey_application_outObject___block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138543618;
  *(void *)&v3[4] = *(void *)(a1 + 48);
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = *a2;
  OUTLINED_FUNCTION_1_2(&dword_1A62FC000, (uint64_t)a2, a3, "found invalidation sentinel for key=%{public}@ appID=%@, refreshing cache", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

@end