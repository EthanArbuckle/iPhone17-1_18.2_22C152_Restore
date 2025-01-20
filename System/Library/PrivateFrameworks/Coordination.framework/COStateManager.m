@interface COStateManager
+ (id)homed_COStateManagerWithSuiteName:(id)a3 homeIdentifier:(id)a4;
- (BOOL)_onqueue_clustersValid:(id)a3;
- (COStateManager)initWithConnectionProvider:(id)a3 suite:(id)a4 clusters:(id)a5;
- (COStateManager)initWithSuiteName:(id)a3 clusters:(id)a4;
- (COStateManagerConnectionProvider)provider;
- (NSArray)observers;
- (NSDictionary)state;
- (NSSet)clusters;
- (NSString)suite;
- (NSXPCConnection)lastConnection;
- (id)_clustersForClustersTmp:(id)a3;
- (id)_remoteInterfaceWithErrorHandler:(id)a3;
- (id)_sanitizeChanges:(id)a3;
- (id)addObserverForKeyPathUsingPredicate:(id)a3 queue:(id)a4 usingBlock:(id)a5;
- (void)_invalidate;
- (void)_lostConnectionToService;
- (void)_onqueue_registerObserver:(id)a3;
- (void)_onqueue_removeObjectsForKeyPaths:(id)a3 clusters:(id)a4 cacheLocally:(BOOL)a5 completionHandler:(id)a6;
- (void)_onqueue_setDictionary:(id)a3 clusters:(id)a4 cacheLocally:(BOOL)a5 completionHandler:(id)a6;
- (void)_withLock:(id)a3;
- (void)changesObserved:(id)a3 forPredicate:(id)a4;
- (void)dealloc;
- (void)delayForDoorbellChimeWithCompletionHandler:(id)a3;
- (void)fetchCompositionForCluster:(id)a3 dispatchQueue:(id)a4 block:(id)a5;
- (void)removeObjectForKeyPath:(id)a3 clusters:(id)a4 completionHandler:(id)a5;
- (void)removeObjectsForKeyPaths:(id)a3 clusters:(id)a4 completionHandler:(id)a5;
- (void)removeObserver:(id)a3;
- (void)setBool:(BOOL)a3 forKeyPath:(id)a4 clusters:(id)a5 completionHandler:(id)a6;
- (void)setDate:(id)a3 forKeyPath:(id)a4 clusters:(id)a5 completionHandler:(id)a6;
- (void)setDictionary:(id)a3 clusters:(id)a4 completionHandler:(id)a5;
- (void)setLastConnection:(id)a3;
- (void)setNumber:(id)a3 forKeyPath:(id)a4 clusters:(id)a5 completionHandler:(id)a6;
- (void)setObservers:(id)a3;
- (void)setState:(id)a3;
- (void)setString:(id)a3 forKeyPath:(id)a4 clusters:(id)a5 completionHandler:(id)a6;
@end

@implementation COStateManager

- (COStateManager)initWithConnectionProvider:(id)a3 suite:(id)a4 clusters:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)COStateManager;
  v12 = [(COStateManager *)&v21 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_provider, a3);
    v14 = (NSArray *)objc_alloc_init(MEMORY[0x263EFF8C0]);
    observers = v13->_observers;
    v13->_observers = v14;

    objc_storeStrong((id *)&v13->_suite, a4);
    objc_storeStrong((id *)&v13->_clusters, a5);
    v13->_lock._os_unfair_lock_opaque = 0;
    v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v17 = dispatch_queue_create("com.apple.COStateManager.queue", v16);
    workQueue = v13->_workQueue;
    v13->_workQueue = (OS_dispatch_queue *)v17;

    v19 = COLogForCategory(4);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      -[COStateManager initWithConnectionProvider:suite:clusters:]((uint64_t)v13, (uint64_t)v9, v19);
    }
  }
  return v13;
}

- (COStateManager)initWithSuiteName:(id)a3 clusters:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x263EFFA08]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v20;
    do
    {
      uint64_t v13 = 0;
      v14 = v8;
      do
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        v15 = +[COCluster _clusterForCluster:](COCluster, "_clusterForCluster:", *(void *)(*((void *)&v19 + 1) + 8 * v13), (void)v19);
        id v8 = [v14 setByAddingObject:v15];

        ++v13;
        v14 = v8;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v11);
  }

  v16 = objc_alloc_init(_COStateManagerConnectionProvider);
  dispatch_queue_t v17 = [(COStateManager *)self initWithConnectionProvider:v16 suite:v6 clusters:v8];

  return v17;
}

- (void)dealloc
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __25__COStateManager_dealloc__block_invoke;
  v4[3] = &unk_2644445A8;
  v4[4] = self;
  [(COStateManager *)self _withLock:v4];
  v3.receiver = self;
  v3.super_class = (Class)COStateManager;
  [(COStateManager *)&v3 dealloc];
}

void __25__COStateManager_dealloc__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) lastConnection];
  v1 = objc_msgSend(v3, "co_originalInterruptionHandler");
  [v3 setInterruptionHandler:v1];

  v2 = objc_msgSend(v3, "co_originalInvalidationHandler");
  [v3 setInvalidationHandler:v2];

  [v3 invalidate];
}

- (void)setBool:(BOOL)a3 forKeyPath:(id)a4 clusters:(id)a5 completionHandler:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  uint64_t v12 = [(COStateManager *)self _clustersForClustersTmp:a5];
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__COStateManager_setBool_forKeyPath_clusters_completionHandler___block_invoke;
  block[3] = &unk_264444810;
  block[4] = self;
  id v18 = v10;
  BOOL v21 = a3;
  id v19 = v12;
  id v20 = v11;
  id v14 = v11;
  id v15 = v12;
  id v16 = v10;
  dispatch_async(workQueue, block);
}

void __64__COStateManager_setBool_forKeyPath_clusters_completionHandler___block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v3 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 64)];
  v6[0] = v3;
  v4 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];
  objc_msgSend(v2, "_onqueue_setDictionary:clusters:cacheLocally:completionHandler:", v4, *(void *)(a1 + 48), 1, *(void *)(a1 + 56));
}

- (void)setNumber:(id)a3 forKeyPath:(id)a4 clusters:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v13 = [(COStateManager *)self _clustersForClustersTmp:a5];
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__COStateManager_setNumber_forKeyPath_clusters_completionHandler___block_invoke;
  block[3] = &unk_264444838;
  block[4] = self;
  id v20 = v11;
  id v21 = v10;
  id v22 = v13;
  id v23 = v12;
  id v15 = v12;
  id v16 = v13;
  id v17 = v10;
  id v18 = v11;
  dispatch_async(workQueue, block);
}

void __66__COStateManager_setNumber_forKeyPath_clusters_completionHandler___block_invoke(void *a1)
{
  v6[1] = *MEMORY[0x263EF8340];
  v2 = (void *)a1[4];
  uint64_t v3 = a1[6];
  uint64_t v5 = a1[5];
  v6[0] = v3;
  v4 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];
  objc_msgSend(v2, "_onqueue_setDictionary:clusters:cacheLocally:completionHandler:", v4, a1[7], 1, a1[8]);
}

- (void)setString:(id)a3 forKeyPath:(id)a4 clusters:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v13 = [(COStateManager *)self _clustersForClustersTmp:a5];
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__COStateManager_setString_forKeyPath_clusters_completionHandler___block_invoke;
  block[3] = &unk_264444838;
  block[4] = self;
  id v20 = v11;
  id v21 = v10;
  id v22 = v13;
  id v23 = v12;
  id v15 = v12;
  id v16 = v13;
  id v17 = v10;
  id v18 = v11;
  dispatch_async(workQueue, block);
}

void __66__COStateManager_setString_forKeyPath_clusters_completionHandler___block_invoke(void *a1)
{
  v6[1] = *MEMORY[0x263EF8340];
  v2 = (void *)a1[4];
  uint64_t v3 = a1[6];
  uint64_t v5 = a1[5];
  v6[0] = v3;
  v4 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];
  objc_msgSend(v2, "_onqueue_setDictionary:clusters:cacheLocally:completionHandler:", v4, a1[7], 1, a1[8]);
}

- (void)setDate:(id)a3 forKeyPath:(id)a4 clusters:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v13 = [(COStateManager *)self _clustersForClustersTmp:a5];
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__COStateManager_setDate_forKeyPath_clusters_completionHandler___block_invoke;
  block[3] = &unk_264444838;
  block[4] = self;
  id v20 = v11;
  id v21 = v10;
  id v22 = v13;
  id v23 = v12;
  id v15 = v12;
  id v16 = v13;
  id v17 = v10;
  id v18 = v11;
  dispatch_async(workQueue, block);
}

void __64__COStateManager_setDate_forKeyPath_clusters_completionHandler___block_invoke(void *a1)
{
  v6[1] = *MEMORY[0x263EF8340];
  v2 = (void *)a1[4];
  uint64_t v3 = a1[6];
  uint64_t v5 = a1[5];
  v6[0] = v3;
  v4 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];
  objc_msgSend(v2, "_onqueue_setDictionary:clusters:cacheLocally:completionHandler:", v4, a1[7], 1, a1[8]);
}

- (void)setDictionary:(id)a3 clusters:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(COStateManager *)self _clustersForClustersTmp:a4];
  workQueue = self->_workQueue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __59__COStateManager_setDictionary_clusters_completionHandler___block_invoke;
  v15[3] = &unk_264444508;
  v15[4] = self;
  id v16 = v8;
  id v17 = v10;
  id v18 = v9;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  dispatch_async(workQueue, v15);
}

uint64_t __59__COStateManager_setDictionary_clusters_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_setDictionary:clusters:cacheLocally:completionHandler:", *(void *)(a1 + 40), *(void *)(a1 + 48), 1, *(void *)(a1 + 56));
}

- (void)removeObjectForKeyPath:(id)a3 clusters:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(COStateManager *)self _clustersForClustersTmp:a4];
  workQueue = self->_workQueue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __68__COStateManager_removeObjectForKeyPath_clusters_completionHandler___block_invoke;
  v15[3] = &unk_264444508;
  id v16 = v8;
  id v17 = self;
  id v18 = v10;
  id v19 = v9;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  dispatch_async(workQueue, v15);
}

void __68__COStateManager_removeObjectForKeyPath_clusters_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263EFFA08] setWithObject:*(void *)(a1 + 32)];
  [*(id *)(a1 + 40) removeObjectsForKeyPaths:v2 clusters:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 56)];
}

- (void)removeObjectsForKeyPaths:(id)a3 clusters:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(COStateManager *)self _clustersForClustersTmp:a4];
  workQueue = self->_workQueue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __70__COStateManager_removeObjectsForKeyPaths_clusters_completionHandler___block_invoke;
  v15[3] = &unk_264444508;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v10;
  id v18 = v9;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  dispatch_async(workQueue, v15);
}

uint64_t __70__COStateManager_removeObjectsForKeyPaths_clusters_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_removeObjectsForKeyPaths:clusters:cacheLocally:completionHandler:", *(void *)(a1 + 40), *(void *)(a1 + 48), 1, *(void *)(a1 + 56));
}

- (id)addObserverForKeyPathUsingPredicate:(id)a3 queue:(id)a4 usingBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__2;
  v34 = __Block_byref_object_dispose__2;
  id v35 = 0;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__2;
  v28 = __Block_byref_object_dispose__2;
  dispatch_group_t v29 = dispatch_group_create();
  dispatch_group_enter((dispatch_group_t)v25[5]);
  workQueue = self->_workQueue;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __71__COStateManager_addObserverForKeyPathUsingPredicate_queue_usingBlock___block_invoke;
  v17[3] = &unk_264444860;
  id v18 = v9;
  id v19 = v8;
  id v20 = self;
  id v21 = v10;
  id v22 = &v30;
  id v23 = &v24;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(workQueue, v17);
  dispatch_group_wait((dispatch_group_t)v25[5], 0xFFFFFFFFFFFFFFFFLL);
  id v15 = (id)v31[5];

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

  return v15;
}

void __71__COStateManager_addObserverForKeyPathUsingPredicate_queue_usingBlock___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v2 = [[COStateObserver alloc] initWithDispatchQueue:*(void *)(a1 + 32) predicate:*(void *)(a1 + 40) block:*(void *)(a1 + 56)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 64) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = COLogForCategory(4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __71__COStateManager_addObserverForKeyPathUsingPredicate_queue_usingBlock___block_invoke_cold_1();
  }

  objc_msgSend(*(id *)(a1 + 48), "_onqueue_registerObserver:", *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40));
  id v6 = [*(id *)(a1 + 48) observers];
  id v7 = (void *)[v6 mutableCopy];

  [v7 addObject:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
  [*(id *)(a1 + 48) setObservers:v7];
  id v8 = COLogForCategory(4);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 48);
    int v12 = 134218498;
    uint64_t v13 = v10;
    __int16 v14 = 2048;
    uint64_t v15 = v9;
    __int16 v16 = 2112;
    uint64_t v17 = v11;
    _os_log_debug_impl(&dword_21D3E0000, v8, OS_LOG_TYPE_DEBUG, "StateManager %p added observer %p with predicate %@", (uint8_t *)&v12, 0x20u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(*(void *)(a1 + 72) + 8) + 40));
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __33__COStateManager_removeObserver___block_invoke;
  v7[3] = &unk_2644444E0;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

void __33__COStateManager_removeObserver___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) observers];
  uint64_t v4 = [v3 indexOfObject:v2];
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v5 = v4;
    id v6 = (void *)[v3 mutableCopy];
    objc_initWeak(&location, *(id *)(a1 + 40));
    id v7 = *(void **)(a1 + 40);
    uint64_t v10 = MEMORY[0x263EF8330];
    uint64_t v11 = 3221225472;
    int v12 = __33__COStateManager_removeObserver___block_invoke_2;
    uint64_t v13 = &unk_264444888;
    objc_copyWeak(&v14, &location);
    id v8 = [v7 _remoteInterfaceWithErrorHandler:&v10];
    uint64_t v9 = objc_msgSend(v2, "predicate", v10, v11, v12, v13);
    [v8 removeObserverWithPredicate:v9];

    [v6 removeObjectAtIndex:v5];
    [*(id *)(a1 + 40) setObservers:v6];
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
}

void __33__COStateManager_removeObserver___block_invoke_2(uint64_t a1, void *a2)
{
  v10[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = WeakRetained;
  if (v3 && WeakRetained)
  {
    uint64_t v9 = *MEMORY[0x263F08608];
    v10[0] = v3;
    id v6 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
    id v7 = [MEMORY[0x263F087E8] errorWithDomain:@"COStateManagerErrorDomain" code:-1001 userInfo:v6];
    id v8 = COLogForCategory(4);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __33__COStateManager_removeObserver___block_invoke_2_cold_1();
    }
  }
}

- (void)changesObserved:(id)a3 forPredicate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__COStateManager_changesObserved_forPredicate___block_invoke;
  block[3] = &unk_2644448B0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(workQueue, block);
}

void __47__COStateManager_changesObserved_forPredicate___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v2 = COLogForCategory(4);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __47__COStateManager_changesObserved_forPredicate___block_invoke_cold_1();
  }

  id v3 = [*(id *)(a1 + 32) _sanitizeChanges:*(void *)(a1 + 40)];
  uint64_t v4 = [*(id *)(a1 + 32) observers];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v17;
    *(void *)&long long v6 = 134218240;
    long long v15 = v6;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v4);
        }
        id v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "predicate", v15);
        int v12 = [v11 isEqual:*(void *)(a1 + 48)];

        if (v12)
        {
          id v13 = COLogForCategory(4);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v14 = *(void *)(a1 + 32);
            *(_DWORD *)buf = v15;
            uint64_t v21 = v14;
            __int16 v22 = 2048;
            id v23 = v10;
            _os_log_impl(&dword_21D3E0000, v13, OS_LOG_TYPE_DEFAULT, "StateManager %p notifying observer %p of changes", buf, 0x16u);
          }

          [v10 notify:v3];
        }
      }
      uint64_t v7 = [v4 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v7);
  }
}

- (void)_onqueue_setDictionary:(id)a3 clusters:(id)a4 cacheLocally:(BOOL)a5 completionHandler:(id)a6
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  v40 = (void (**)(id, void *))a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  v39 = v11;
  if ([(COStateManager *)self _onqueue_clustersValid:v11])
  {
    val = self;
    BOOL v37 = a5;
    if (_onqueue_setDictionary_clusters_cacheLocally_completionHandler__onceToken != -1) {
      dispatch_once(&_onqueue_setDictionary_clusters_cacheLocally_completionHandler__onceToken, &__block_literal_global_2);
    }
    id v44 = [MEMORY[0x263EFF9A0] dictionary];
    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    id obj = [v10 allKeys];
    uint64_t v12 = [obj countByEnumeratingWithState:&v64 objects:v74 count:16];
    if (v12)
    {
      uint64_t v42 = *(void *)v65;
      while (1)
      {
        uint64_t v13 = 0;
LABEL_7:
        if (*(void *)v65 != v42) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void **)(*((void *)&v64 + 1) + 8 * v13);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          break;
        }
        id v15 = v14;
        long long v60 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        id v16 = (id)_onqueue_setDictionary_clusters_cacheLocally_completionHandler__supportedClasses;
        uint64_t v17 = [v16 countByEnumeratingWithState:&v60 objects:v73 count:16];
        if (!v17)
        {
LABEL_26:

          break;
        }
        uint64_t v18 = *(void *)v61;
LABEL_12:
        uint64_t v19 = 0;
        while (1)
        {
          if (*(void *)v61 != v18) {
            objc_enumerationMutation(v16);
          }
          id v20 = [v10 objectForKeyedSubscript:v15];
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass) {
            break;
          }
          if (v17 == ++v19)
          {
            uint64_t v17 = [v16 countByEnumeratingWithState:&v60 objects:v73 count:16];
            if (v17) {
              goto LABEL_12;
            }
            goto LABEL_26;
          }
        }

        __int16 v22 = [v10 objectForKeyedSubscript:v15];
        id v23 = [v15 absoluteString];
        [v44 setObject:v22 forKey:v23];

        if (++v13 != v12) {
          goto LABEL_7;
        }
        uint64_t v12 = [obj countByEnumeratingWithState:&v64 objects:v74 count:16];
        if (!v12) {
          goto LABEL_21;
        }
      }

      v31 = [MEMORY[0x263F087E8] errorWithDomain:@"COStateManagerErrorDomain" code:-1003 userInfo:0];
      uint64_t v32 = COLogForCategory(4);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)id location = 134218498;
        *(void *)&location[4] = val;
        __int16 v69 = 2112;
        id v70 = v10;
        __int16 v71 = 2112;
        v72 = v31;
        _os_log_error_impl(&dword_21D3E0000, v32, OS_LOG_TYPE_ERROR, "%p failed to set state %@ since it contains unsupported types - %@", location, 0x20u);
      }

      v40[2](v40, v31);
    }
    else
    {
LABEL_21:

      objc_initWeak((id *)location, val);
      v55[0] = MEMORY[0x263EF8330];
      v55[1] = 3221225472;
      v55[2] = __81__COStateManager__onqueue_setDictionary_clusters_cacheLocally_completionHandler___block_invoke_86;
      v55[3] = &unk_2644448D8;
      objc_copyWeak(&v59, (id *)location);
      id v24 = v39;
      id v56 = v24;
      id v44 = v44;
      id v57 = v44;
      id v25 = v10;
      id v58 = v25;
      uint64_t v26 = (void *)MEMORY[0x21D4BD7F0](v55);
      v49[0] = MEMORY[0x263EF8330];
      v49[1] = 3221225472;
      v49[2] = __81__COStateManager__onqueue_setDictionary_clusters_cacheLocally_completionHandler___block_invoke_2;
      v49[3] = &unk_264444928;
      objc_copyWeak(&v53, (id *)location);
      id v50 = v25;
      v27 = v40;
      v51 = v27;
      BOOL v54 = v37;
      id v28 = v26;
      id v52 = v28;
      v43 = [(COStateManager *)val _remoteInterfaceWithErrorHandler:v49];
      if (v24)
      {
        id v29 = v24;
      }
      else
      {
        id v29 = [(COStateManager *)val clusters];
      }
      v33 = v29;
      v34 = [(COStateManager *)val suite];
      id v35 = [(COStateManager *)val clusters];
      v45[0] = MEMORY[0x263EF8330];
      v45[1] = 3221225472;
      v45[2] = __81__COStateManager__onqueue_setDictionary_clusters_cacheLocally_completionHandler___block_invoke_88;
      v45[3] = &unk_264444950;
      objc_copyWeak(&v48, (id *)location);
      id v36 = v28;
      id v46 = v36;
      v47 = v27;
      [v43 setDictionary:v44 suite:v34 interestClusters:v35 targetCluster:v33 withCallback:v45];

      objc_destroyWeak(&v48);
      objc_destroyWeak(&v53);

      objc_destroyWeak(&v59);
      objc_destroyWeak((id *)location);
    }
  }
  else
  {
    uint64_t v30 = COLogForCategory(4);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      -[COStateManager _onqueue_setDictionary:clusters:cacheLocally:completionHandler:]();
    }

    id v44 = [MEMORY[0x263F087E8] errorWithDomain:@"COStateManagerErrorDomain" code:-1000 userInfo:0];
    v40[2](v40, v44);
  }
}

uint64_t __81__COStateManager__onqueue_setDictionary_clusters_cacheLocally_completionHandler___block_invoke()
{
  v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  _onqueue_setDictionary_clusters_cacheLocally_completionHandler__supportedClasses = objc_msgSend(v0, "setWithObjects:", v1, v2, objc_opt_class(), 0);

  return MEMORY[0x270F9A758]();
}

void __81__COStateManager__onqueue_setDictionary_clusters_cacheLocally_completionHandler___block_invoke_86(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v5 = a2;
  uint64_t v35 = a1;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v7 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v8 = [WeakRetained state];
    uint64_t v32 = v7;
    if (v8)
    {
      id v9 = [v7 state];
      id v10 = (void *)[v9 mutableCopy];
    }
    else
    {
      id v10 = [MEMORY[0x263EFF9A0] dictionary];
    }

    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id obj = *(id *)(v35 + 32);
    uint64_t v11 = [obj countByEnumeratingWithState:&v40 objects:v47 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v41;
      unsigned int v31 = a3;
      id v30 = v5;
      uint64_t v33 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v41 != v13) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = *(void *)(*((void *)&v40 + 1) + 8 * i);
          if ((objc_msgSend(v5, "containsObject:", v15, v30) & 1) == 0)
          {
            id v16 = [v10 objectForKeyedSubscript:v15];
            if (v16)
            {
              [v10 objectForKeyedSubscript:v15];
              id v17 = v5;
              uint64_t v18 = v12;
              uint64_t v19 = v7;
              uint64_t v21 = v20 = a3;
              __int16 v22 = (void *)[v21 mutableCopy];

              a3 = v20;
              uint64_t v7 = v19;
              uint64_t v12 = v18;
              id v5 = v17;
            }
            else
            {
              __int16 v22 = [MEMORY[0x263EFF9A0] dictionary];
            }

            [v22 addEntriesFromDictionary:*(void *)(v35 + 40)];
            [v10 setObject:v22 forKey:v15];
            [v7 setState:v10];
            if (a3)
            {
              v45[0] = @"COStateManagerChangesCluster";
              v45[1] = @"COStateManagerChangesUpdatedKeyPaths";
              uint64_t v23 = *(void *)(v35 + 48);
              v46[0] = v15;
              v46[1] = v23;
              id v24 = [NSDictionary dictionaryWithObjects:v46 forKeys:v45 count:2];
              long long v36 = 0u;
              long long v37 = 0u;
              long long v38 = 0u;
              long long v39 = 0u;
              id v25 = [v7 observers];
              uint64_t v26 = [v25 countByEnumeratingWithState:&v36 objects:v44 count:16];
              if (v26)
              {
                uint64_t v27 = v26;
                uint64_t v28 = *(void *)v37;
                do
                {
                  for (uint64_t j = 0; j != v27; ++j)
                  {
                    if (*(void *)v37 != v28) {
                      objc_enumerationMutation(v25);
                    }
                    [*(id *)(*((void *)&v36 + 1) + 8 * j) notify:v24];
                  }
                  uint64_t v27 = [v25 countByEnumeratingWithState:&v36 objects:v44 count:16];
                }
                while (v27);
              }

              id v5 = v30;
              a3 = v31;
              uint64_t v7 = v32;
            }

            uint64_t v13 = v33;
          }
        }
        uint64_t v12 = [obj countByEnumeratingWithState:&v40 objects:v47 count:16];
      }
      while (v12);
    }
  }
}

void __81__COStateManager__onqueue_setDictionary_clusters_cacheLocally_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 56));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    long long v6 = WeakRetained[2];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __81__COStateManager__onqueue_setDictionary_clusters_cacheLocally_completionHandler___block_invoke_3;
    v7[3] = &unk_264444900;
    id v8 = v3;
    id v9 = v5;
    id v10 = *(id *)(a1 + 32);
    id v11 = *(id *)(a1 + 40);
    char v13 = *(unsigned char *)(a1 + 64);
    id v12 = *(id *)(a1 + 48);
    dispatch_async(v6, v7);
  }
}

void __81__COStateManager__onqueue_setDictionary_clusters_cacheLocally_completionHandler___block_invoke_3(uint64_t a1)
{
  v7[1] = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    uint64_t v6 = *MEMORY[0x263F08608];
    v7[0] = v1;
    id v3 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];
    uint64_t v4 = [MEMORY[0x263F087E8] errorWithDomain:@"COStateManagerErrorDomain" code:-1001 userInfo:v3];
    id v5 = COLogForCategory(4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __81__COStateManager__onqueue_setDictionary_clusters_cacheLocally_completionHandler___block_invoke_3_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    if (*(unsigned char *)(a1 + 72)) {
      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    }
  }
}

void __81__COStateManager__onqueue_setDictionary_clusters_cacheLocally_completionHandler___block_invoke_88(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v7 = WeakRetained;
  if (WeakRetained)
  {
    id v8 = WeakRetained[2];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __81__COStateManager__onqueue_setDictionary_clusters_cacheLocally_completionHandler___block_invoke_2_89;
    v9[3] = &unk_264444338;
    id v10 = v3;
    id v11 = *(id *)(a1 + 32);
    dispatch_async(v8, v9);
  }
  (*(void (**)(void, id, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v3, v5, v6);
}

void __81__COStateManager__onqueue_setDictionary_clusters_cacheLocally_completionHandler___block_invoke_2_89(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    id v3 = [v2 userInfo];
    id v4 = [v3 objectForKeyedSubscript:@"COStateManagerErrorFailedClustersKey"];
  }
  else
  {
    id v4 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_onqueue_removeObjectsForKeyPaths:(id)a3 clusters:(id)a4 cacheLocally:(BOOL)a5 completionHandler:(id)a6
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v30 = a3;
  id v10 = a4;
  id v11 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  if ([(COStateManager *)self _onqueue_clustersValid:v10])
  {
    BOOL v29 = a5;
    id v12 = [MEMORY[0x263EFF9C0] set];
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v13 = v30;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v46 objects:v50 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v47;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v47 != v15) {
            objc_enumerationMutation(v13);
          }
          id v17 = *(void **)(*((void *)&v46 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v18 = [v17 absoluteString];
            [v12 addObject:v18];
          }
        }
        uint64_t v14 = [v13 countByEnumeratingWithState:&v46 objects:v50 count:16];
      }
      while (v14);
    }

    objc_initWeak(&location, self);
    v40[0] = MEMORY[0x263EF8330];
    v40[1] = 3221225472;
    v40[2] = __92__COStateManager__onqueue_removeObjectsForKeyPaths_clusters_cacheLocally_completionHandler___block_invoke;
    v40[3] = &unk_2644448D8;
    objc_copyWeak(&v44, &location);
    id v19 = v10;
    id v41 = v19;
    id v20 = v12;
    id v42 = v20;
    id v43 = v13;
    uint64_t v21 = (void *)MEMORY[0x21D4BD7F0](v40);
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __92__COStateManager__onqueue_removeObjectsForKeyPaths_clusters_cacheLocally_completionHandler___block_invoke_2;
    v35[3] = &unk_2644449A0;
    objc_copyWeak(&v38, &location);
    id v22 = v11;
    id v36 = v22;
    BOOL v39 = v29;
    id v23 = v21;
    id v37 = v23;
    id v24 = [(COStateManager *)self _remoteInterfaceWithErrorHandler:v35];
    if (v19)
    {
      id v25 = v19;
    }
    else
    {
      id v25 = [(COStateManager *)self clusters];
    }
    uint64_t v27 = v25;
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __92__COStateManager__onqueue_removeObjectsForKeyPaths_clusters_cacheLocally_completionHandler___block_invoke_91;
    v31[3] = &unk_264444950;
    objc_copyWeak(&v34, &location);
    id v28 = v23;
    id v32 = v28;
    id v33 = v22;
    [v24 removeKeyPaths:v20 targetClusters:v27 withCallback:v31];

    objc_destroyWeak(&v34);
    objc_destroyWeak(&v38);

    objc_destroyWeak(&v44);
    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v26 = COLogForCategory(4);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      -[COStateManager _onqueue_removeObjectsForKeyPaths:clusters:cacheLocally:completionHandler:]();
    }

    id v20 = [MEMORY[0x263F087E8] errorWithDomain:@"COStateManagerErrorDomain" code:-1000 userInfo:0];
    (*((void (**)(id, id))v11 + 2))(v11, v20);
  }
}

void __92__COStateManager__onqueue_removeObjectsForKeyPaths_clusters_cacheLocally_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v5 = a2;
  uint64_t v36 = a1;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v7 = WeakRetained;
  if (WeakRetained)
  {
    id v8 = [WeakRetained state];
    id v33 = v7;
    if (v8)
    {
      id v9 = [v7 state];
      id v10 = (void *)[v9 mutableCopy];
    }
    else
    {
      id v10 = [MEMORY[0x263EFF9A0] dictionary];
    }

    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id obj = *(id *)(v36 + 32);
    uint64_t v11 = [obj countByEnumeratingWithState:&v41 objects:v48 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v42;
      unsigned int v32 = a3;
      id v31 = v5;
      uint64_t v34 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v42 != v13) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = *(void *)(*((void *)&v41 + 1) + 8 * i);
          if ((objc_msgSend(v5, "containsObject:", v15, v31) & 1) == 0)
          {
            id v16 = [v10 objectForKeyedSubscript:v15];
            if (v16)
            {
              [v10 objectForKeyedSubscript:v15];
              id v17 = v5;
              uint64_t v18 = v12;
              id v19 = v7;
              uint64_t v21 = v20 = a3;
              id v22 = (void *)[v21 mutableCopy];

              a3 = v20;
              uint64_t v7 = v19;
              uint64_t v12 = v18;
              id v5 = v17;
            }
            else
            {
              id v22 = [MEMORY[0x263EFF9A0] dictionary];
            }

            id v23 = [*(id *)(v36 + 40) allObjects];
            [v22 removeObjectsForKeys:v23];

            [v10 setObject:v22 forKey:v15];
            [v7 setState:v10];
            if (a3)
            {
              v46[0] = @"COStateManagerChangesCluster";
              v46[1] = @"COStateManagerChangesRemovedKeyPaths";
              uint64_t v24 = *(void *)(v36 + 48);
              v47[0] = v15;
              v47[1] = v24;
              id v25 = [NSDictionary dictionaryWithObjects:v47 forKeys:v46 count:2];
              long long v37 = 0u;
              long long v38 = 0u;
              long long v39 = 0u;
              long long v40 = 0u;
              uint64_t v26 = [v7 observers];
              uint64_t v27 = [v26 countByEnumeratingWithState:&v37 objects:v45 count:16];
              if (v27)
              {
                uint64_t v28 = v27;
                uint64_t v29 = *(void *)v38;
                do
                {
                  for (uint64_t j = 0; j != v28; ++j)
                  {
                    if (*(void *)v38 != v29) {
                      objc_enumerationMutation(v26);
                    }
                    [*(id *)(*((void *)&v37 + 1) + 8 * j) notify:v25];
                  }
                  uint64_t v28 = [v26 countByEnumeratingWithState:&v37 objects:v45 count:16];
                }
                while (v28);
              }

              id v5 = v31;
              a3 = v32;
              uint64_t v7 = v33;
            }

            uint64_t v13 = v34;
          }
        }
        uint64_t v12 = [obj countByEnumeratingWithState:&v41 objects:v48 count:16];
      }
      while (v12);
    }
  }
}

void __92__COStateManager__onqueue_removeObjectsForKeyPaths_clusters_cacheLocally_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = WeakRetained;
  if (v3 && WeakRetained)
  {
    uint64_t v6 = WeakRetained[2];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __92__COStateManager__onqueue_removeObjectsForKeyPaths_clusters_cacheLocally_completionHandler___block_invoke_3;
    block[3] = &unk_264444978;
    id v8 = v3;
    id v9 = v5;
    id v10 = *(id *)(a1 + 32);
    char v12 = *(unsigned char *)(a1 + 56);
    id v11 = *(id *)(a1 + 40);
    dispatch_async(v6, block);
  }
}

void __92__COStateManager__onqueue_removeObjectsForKeyPaths_clusters_cacheLocally_completionHandler___block_invoke_3(uint64_t a1)
{
  v7[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v6 = *MEMORY[0x263F08608];
  v7[0] = v2;
  id v3 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];
  id v4 = [MEMORY[0x263F087E8] errorWithDomain:@"COStateManagerErrorDomain" code:-1001 userInfo:v3];
  id v5 = COLogForCategory(4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __92__COStateManager__onqueue_removeObjectsForKeyPaths_clusters_cacheLocally_completionHandler___block_invoke_3_cold_1(a1, (uint64_t)v4, v5);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  if (*(unsigned char *)(a1 + 64)) {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __92__COStateManager__onqueue_removeObjectsForKeyPaths_clusters_cacheLocally_completionHandler___block_invoke_91(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v7 = WeakRetained;
  if (WeakRetained)
  {
    id v8 = WeakRetained[2];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __92__COStateManager__onqueue_removeObjectsForKeyPaths_clusters_cacheLocally_completionHandler___block_invoke_2_92;
    v9[3] = &unk_264444338;
    id v10 = v3;
    id v11 = *(id *)(a1 + 32);
    dispatch_async(v8, v9);
  }
  (*(void (**)(void, id, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v3, v5, v6);
}

void __92__COStateManager__onqueue_removeObjectsForKeyPaths_clusters_cacheLocally_completionHandler___block_invoke_2_92(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    id v3 = [v2 userInfo];
    id v4 = [v3 objectForKeyedSubscript:@"COStateManagerErrorFailedClustersKey"];
  }
  else
  {
    id v4 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_onqueue_registerObserver:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  id v11 = __44__COStateManager__onqueue_registerObserver___block_invoke;
  char v12 = &unk_264444888;
  objc_copyWeak(&v13, &location);
  uint64_t v5 = [(COStateManager *)self _remoteInterfaceWithErrorHandler:&v9];
  uint64_t v6 = objc_msgSend(v4, "predicate", v9, v10, v11, v12);
  uint64_t v7 = [(COStateManager *)self suite];
  id v8 = [(COStateManager *)self clusters];
  [v5 addObserverWithPredicate:v6 suite:v7 interestClusters:v8];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __44__COStateManager__onqueue_registerObserver___block_invoke(uint64_t a1, void *a2)
{
  v10[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = WeakRetained;
  if (v3 && WeakRetained)
  {
    uint64_t v9 = *MEMORY[0x263F08608];
    v10[0] = v3;
    uint64_t v6 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
    uint64_t v7 = [MEMORY[0x263F087E8] errorWithDomain:@"COStateManagerErrorDomain" code:-1001 userInfo:v6];
    id v8 = COLogForCategory(4);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __44__COStateManager__onqueue_registerObserver___block_invoke_cold_1();
    }
  }
}

- (void)_lostConnectionToService
{
  objc_initWeak(&location, self);
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__COStateManager__lostConnectionToService__block_invoke;
  block[3] = &unk_2644449F0;
  objc_copyWeak(&v5, &location);
  void block[4] = self;
  dispatch_async(workQueue, block);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __42__COStateManager__lostConnectionToService__block_invoke(uint64_t a1)
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && !WeakRetained[24])
  {
    WeakRetained[24] = 1;
    uint64_t v27 = WeakRetained;
    uint64_t v2 = [WeakRetained observers];
    uint64_t v21 = [v27 state];
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id obj = v2;
    uint64_t v3 = [obj countByEnumeratingWithState:&v43 objects:v49 count:16];
    if (v3)
    {
      uint64_t v4 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v3; ++i)
        {
          if (*(void *)v44 != v4) {
            objc_enumerationMutation(obj);
          }
          objc_msgSend(v27, "_onqueue_registerObserver:", *(void *)(*((void *)&v43 + 1) + 8 * i));
        }
        uint64_t v3 = [obj countByEnumeratingWithState:&v43 objects:v49 count:16];
      }
      while (v3);
    }

    if ([v21 count])
    {
      uint64_t v39 = 0;
      long long v40 = &v39;
      uint64_t v41 = 0x2020000000;
      uint64_t v42 = 0;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v25 = v21;
      uint64_t v6 = [v25 countByEnumeratingWithState:&v35 objects:v48 count:16];
      if (v6)
      {
        uint64_t v22 = *(void *)v36;
        do
        {
          uint64_t v23 = v6;
          for (uint64_t j = 0; j != v23; ++j)
          {
            if (*(void *)v36 != v22) {
              objc_enumerationMutation(v25);
            }
            uint64_t v8 = *(void *)(*((void *)&v35 + 1) + 8 * j);
            uint64_t v9 = [v25 objectForKeyedSubscript:v8];
            uint64_t v10 = [MEMORY[0x263EFF9A0] dictionary];
            long long v33 = 0u;
            long long v34 = 0u;
            long long v31 = 0u;
            long long v32 = 0u;
            id v11 = v9;
            uint64_t v12 = [v11 countByEnumeratingWithState:&v31 objects:v47 count:16];
            if (v12)
            {
              uint64_t v13 = *(void *)v32;
              do
              {
                for (uint64_t k = 0; k != v12; ++k)
                {
                  if (*(void *)v32 != v13) {
                    objc_enumerationMutation(v11);
                  }
                  uint64_t v15 = *(void *)(*((void *)&v31 + 1) + 8 * k);
                  id v16 = +[COKeyPath createWithString:v15];
                  id v17 = [v11 objectForKeyedSubscript:v15];
                  [v10 setObject:v17 forKey:v16];
                }
                uint64_t v12 = [v11 countByEnumeratingWithState:&v31 objects:v47 count:16];
              }
              while (v12);
            }

            ++v40[3];
            uint64_t v18 = *(void **)(a1 + 32);
            id v19 = [MEMORY[0x263EFFA08] setWithObject:v8];
            v28[0] = MEMORY[0x263EF8330];
            v28[1] = 3221225472;
            v28[2] = __42__COStateManager__lostConnectionToService__block_invoke_2;
            v28[3] = &unk_2644449C8;
            v28[4] = v27;
            id v20 = v10;
            id v29 = v20;
            id v30 = &v39;
            objc_msgSend(v18, "_onqueue_setDictionary:clusters:cacheLocally:completionHandler:", v20, v19, 0, v28);
          }
          uint64_t v6 = [v25 countByEnumeratingWithState:&v35 objects:v48 count:16];
        }
        while (v6);
      }

      _Block_object_dispose(&v39, 8);
    }
    else
    {
      v27[24] = 0;
    }

    id WeakRetained = v27;
  }
}

void __42__COStateManager__lostConnectionToService__block_invoke_2(void *a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = COLogForCategory(4);
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __42__COStateManager__lostConnectionToService__block_invoke_2_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = a1[4];
    uint64_t v7 = a1[5];
    int v8 = 134218242;
    uint64_t v9 = v6;
    __int16 v10 = 2112;
    uint64_t v11 = v7;
    _os_log_impl(&dword_21D3E0000, v5, OS_LOG_TYPE_DEFAULT, "%p Successfully re-presented state %@", (uint8_t *)&v8, 0x16u);
  }

  if (!--*(void *)(*(void *)(a1[6] + 8) + 24)) {
    *(unsigned char *)(a1[4] + 24) = 0;
  }
}

- (BOOL)_onqueue_clustersValid:(id)a3
{
  workQueue = self->_workQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(workQueue);
  uint64_t v6 = (void *)[v5 mutableCopy];

  uint64_t v7 = [(COStateManager *)self clusters];
  [v6 minusSet:v7];

  LOBYTE(v7) = [v6 count] == 0;
  return (char)v7;
}

- (id)_clustersForClustersTmp:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x263EFFA08]);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        uint64_t v9 = 0;
        __int16 v10 = v4;
        do
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v11 = +[COCluster _clusterForCluster:](COCluster, "_clusterForCluster:", *(void *)(*((void *)&v13 + 1) + 8 * v9), (void)v13);
          id v4 = [v10 setByAddingObject:v11];

          ++v9;
          __int16 v10 = v4;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)_sanitizeChanges:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v24 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = [v3 objectForKeyedSubscript:@"COStateManagerChangesUpdatedKeyPaths"];
  id v5 = [MEMORY[0x263EFF9A0] dictionary];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v6 = [v4 allKeys];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v30 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        uint64_t v12 = +[COKeyPath createWithString:v11];
        long long v13 = [v4 objectForKeyedSubscript:v11];
        [v5 setObject:v13 forKey:v12];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v8);
  }

  long long v14 = [v3 objectForKeyedSubscript:@"COStateManagerChangesRemovedKeyPaths"];
  long long v15 = [MEMORY[0x263EFF9C0] set];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v16 = v14;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v26;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v26 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = +[COKeyPath createWithString:*(void *)(*((void *)&v25 + 1) + 8 * j)];
        [v15 addObject:v21];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v18);
  }

  uint64_t v22 = [v3 objectForKeyedSubscript:@"COStateManagerChangesCluster"];
  [v24 setObject:v22 forKey:@"COStateManagerChangesCluster"];

  [v24 setObject:v5 forKey:@"COStateManagerChangesUpdatedKeyPaths"];
  [v24 setObject:v15 forKey:@"COStateManagerChangesRemovedKeyPaths"];

  return v24;
}

- (void)_withLock:(id)a3
{
  p_locuint64_t k = &self->_lock;
  id v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (id)_remoteInterfaceWithErrorHandler:(id)a3
{
  id v4 = a3;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__2;
  uint64_t v12 = __Block_byref_object_dispose__2;
  id v13 = 0;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  void v7[2] = __51__COStateManager__remoteInterfaceWithErrorHandler___block_invoke;
  v7[3] = &unk_264444468;
  void v7[4] = self;
  v7[5] = &v8;
  [(COStateManager *)self _withLock:v7];
  id v5 = [(id)v9[5] remoteObjectProxyWithErrorHandler:v4];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __51__COStateManager__remoteInterfaceWithErrorHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) provider];
  uint64_t v3 = [v2 stateManagerServiceConnection];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  uint64_t v6 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  uint64_t v7 = [*(id *)(a1 + 32) lastConnection];

  if (v6 != v7)
  {
    uint64_t v8 = &unk_26CDD3690;
    uint64_t v9 = [MEMORY[0x263F08D80] interfaceWithProtocol:v8];
    if (+[COFeatureStatus isCOClusterEnabled])
    {
      uint64_t v10 = [v9 classesForSelector:sel_changesObserved_forPredicate_ argumentIndex:0 ofReply:0];
      uint64_t v11 = [v10 setByAddingObject:objc_opt_class()];

      [v9 setClasses:v11 forSelector:sel_changesObserved_forPredicate_ argumentIndex:0 ofReply:0];
    }
    uint64_t v12 = [[COStateManagerClientInterfaceMediator alloc] initWithStateManager:*(void *)(a1 + 32)];
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setExportedInterface:v9];
    long long v37 = v12;
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setExportedObject:v12];
    id v13 = &unk_26CDD99D8;

    long long v14 = [MEMORY[0x263F08D80] interfaceWithProtocol:v13];

    long long v15 = (void *)MEMORY[0x263EFFA08];
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = objc_opt_class();
    uint64_t v20 = objc_opt_class();
    uint64_t v21 = objc_msgSend(v15, "setWithObjects:", v16, v17, v18, v19, v20, objc_opt_class(), 0);
    [v14 setClasses:v21 forSelector:sel_requestCompositionForCluster_withCallback_ argumentIndex:0 ofReply:1];
    uint64_t v22 = +[COCluster _allowedClusterClasses];
    [v14 setClasses:v22 forSelector:sel_requestCompositionForCluster_withCallback_ argumentIndex:0 ofReply:0];

    uint64_t v23 = +[COCluster _allowedClusterClasses];
    uint64_t v24 = [v23 setByAddingObject:objc_opt_class()];

    [v14 setClasses:v24 forSelector:sel_addObserverWithPredicate_suite_interestClusters_ argumentIndex:2 ofReply:0];
    [v14 setClasses:v24 forSelector:sel_setDictionary_suite_interestClusters_targetCluster_withCallback_ argumentIndex:2 ofReply:0];
    [v14 setClasses:v24 forSelector:sel_setDictionary_suite_interestClusters_targetCluster_withCallback_ argumentIndex:3 ofReply:0];
    [v14 setClasses:v24 forSelector:sel_removeKeyPaths_targetClusters_withCallback_ argumentIndex:1 ofReply:0];
    long long v25 = [v14 classesForSelector:sel_setDictionary_suite_interestClusters_targetCluster_withCallback_ argumentIndex:0 ofReply:1];

    long long v26 = +[COCluster _allowedClusterClasses];
    long long v27 = [v25 setByAddingObjectsFromSet:v26];

    [v14 setClasses:v27 forSelector:sel_setDictionary_suite_interestClusters_targetCluster_withCallback_ argumentIndex:0 ofReply:1];
    long long v28 = [v14 classesForSelector:sel_removeKeyPaths_targetClusters_withCallback_ argumentIndex:0 ofReply:1];

    long long v29 = +[COCluster _allowedClusterClasses];
    long long v30 = [v28 setByAddingObjectsFromSet:v29];

    [v14 setClasses:v30 forSelector:sel_removeKeyPaths_targetClusters_withCallback_ argumentIndex:0 ofReply:1];
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setRemoteObjectInterface:v14];
    objc_initWeak(location, *(id *)(a1 + 32));
    long long v31 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) interruptionHandler];
    long long v32 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) invalidationHandler];
    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "co_setOriginalInterruptionHandler:", v31);
    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "co_setOriginalInvalidationHandler:", v32);
    long long v33 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    v41[0] = MEMORY[0x263EF8330];
    v41[1] = 3221225472;
    v41[2] = __51__COStateManager__remoteInterfaceWithErrorHandler___block_invoke_2;
    v41[3] = &unk_264444A18;
    id v34 = v31;
    id v42 = v34;
    objc_copyWeak(&v43, location);
    [v33 setInterruptionHandler:v41];
    uint64_t v35 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = __51__COStateManager__remoteInterfaceWithErrorHandler___block_invoke_167;
    v38[3] = &unk_264444A18;
    id v36 = v32;
    id v39 = v36;
    objc_copyWeak(&v40, location);
    [v35 setInvalidationHandler:v38];
    [*(id *)(a1 + 32) setLastConnection:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) resume];
    objc_destroyWeak(&v40);

    objc_destroyWeak(&v43);
    objc_destroyWeak(location);
  }
}

void __51__COStateManager__remoteInterfaceWithErrorHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v4 = COLogForCategory(4);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __51__COStateManager__remoteInterfaceWithErrorHandler___block_invoke_2_cold_1();
    }
  }
}

void __51__COStateManager__remoteInterfaceWithErrorHandler___block_invoke_167(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v4 = COLogForCategory(4);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __51__COStateManager__remoteInterfaceWithErrorHandler___block_invoke_167_cold_1();
    }
  }
}

- (void)_invalidate
{
  id v2 = [(COStateManagerConnectionProvider *)self->_provider stateManagerServiceConnection];
  [v2 invalidate];
}

- (NSArray)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (NSString)suite
{
  return self->_suite;
}

- (NSSet)clusters
{
  return self->_clusters;
}

- (NSXPCConnection)lastConnection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lastConnection);

  return (NSXPCConnection *)WeakRetained;
}

- (void)setLastConnection:(id)a3
{
}

- (NSDictionary)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
}

- (COStateManagerConnectionProvider)provider
{
  return self->_provider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_destroyWeak((id *)&self->_lastConnection);
  objc_storeStrong((id *)&self->_clusters, 0);
  objc_storeStrong((id *)&self->_suite, 0);
  objc_storeStrong((id *)&self->_observers, 0);

  objc_storeStrong((id *)&self->_workQueue, 0);
}

- (void)fetchCompositionForCluster:(id)a3 dispatchQueue:(id)a4 block:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __85__COStateManager_ClusterExamination__fetchCompositionForCluster_dispatchQueue_block___block_invoke;
  v17[3] = &unk_264444888;
  objc_copyWeak(&v18, &location);
  uint64_t v11 = [(COStateManager *)self _remoteInterfaceWithErrorHandler:v17];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __85__COStateManager_ClusterExamination__fetchCompositionForCluster_dispatchQueue_block___block_invoke_242;
  v14[3] = &unk_264444A68;
  id v12 = v9;
  id v15 = v12;
  id v13 = v10;
  id v16 = v13;
  [v11 requestCompositionForCluster:v8 withCallback:v14];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __85__COStateManager_ClusterExamination__fetchCompositionForCluster_dispatchQueue_block___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = COLogForCategory(4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __85__COStateManager_ClusterExamination__fetchCompositionForCluster_dispatchQueue_block___block_invoke_cold_1();
    }
  }
}

void __85__COStateManager_ClusterExamination__fetchCompositionForCluster_dispatchQueue_block___block_invoke_242(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __85__COStateManager_ClusterExamination__fetchCompositionForCluster_dispatchQueue_block___block_invoke_2;
  block[3] = &unk_264444A40;
  uint64_t v7 = *(NSObject **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __85__COStateManager_ClusterExamination__fetchCompositionForCluster_dispatchQueue_block___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)delayForDoorbellChimeWithCompletionHandler:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  void v10[2] = __71__COStateManager_Doorbell__delayForDoorbellChimeWithCompletionHandler___block_invoke;
  v10[3] = &unk_2644445D0;
  objc_copyWeak(&v12, &location);
  id v5 = v4;
  id v11 = v5;
  id v6 = [(COStateManager *)self _remoteInterfaceWithErrorHandler:v10];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __71__COStateManager_Doorbell__delayForDoorbellChimeWithCompletionHandler___block_invoke_246;
  v8[3] = &unk_264444A90;
  id v7 = v5;
  id v9 = v7;
  [v6 doorbellDelayWithCallback:v8];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __71__COStateManager_Doorbell__delayForDoorbellChimeWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  v10[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (v3 && WeakRetained)
  {
    uint64_t v9 = *MEMORY[0x263F08608];
    v10[0] = v3;
    id v6 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
    id v7 = [MEMORY[0x263F087E8] errorWithDomain:@"COStateManagerErrorDomain" code:-1001 userInfo:v6];
    id v8 = COLogForCategory(4);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __71__COStateManager_Doorbell__delayForDoorbellChimeWithCompletionHandler___block_invoke_cold_1();
    }

    (*(void (**)(double))(*(void *)(a1 + 32) + 16))(0.2);
  }
}

uint64_t __71__COStateManager_Doorbell__delayForDoorbellChimeWithCompletionHandler___block_invoke_246(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)homed_COStateManagerWithSuiteName:(id)a3 homeIdentifier:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = a3;
  id v7 = +[COCluster _homeClusterForHomeKitHomeIdentifier:v5];
  id v8 = [MEMORY[0x263EFFA08] setWithObject:v7];
  uint64_t v9 = [[COStateManager alloc] initWithSuiteName:v6 clusters:v8];

  id v10 = COLogForCategory(4);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 134218499;
    id v13 = v9;
    __int16 v14 = 2113;
    id v15 = v5;
    __int16 v16 = 2112;
    uint64_t v17 = v7;
    _os_log_impl(&dword_21D3E0000, v10, OS_LOG_TYPE_DEFAULT, "%p Created homed COStateManager instance for %{private}@, cluster %@", (uint8_t *)&v12, 0x20u);
  }

  return v9;
}

- (void)initWithConnectionProvider:(uint64_t)a1 suite:(uint64_t)a2 clusters:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  int v8 = 134218242;
  uint64_t v9 = a1;
  __int16 v10 = 2112;
  id v11 = v6;
  OUTLINED_FUNCTION_4(&dword_21D3E0000, a3, v7, "%p state manager created with %@ provider", (uint8_t *)&v8);
}

void __71__COStateManager_addObserverForKeyPathUsingPredicate_queue_usingBlock___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_21D3E0000, v0, (uint64_t)v0, "StateManager %p adding observer with predicate %@", v1);
}

void __33__COStateManager_removeObserver___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_21D3E0000, v0, v1, "%p failed to get state manager remote proxy for removal of observation - %@");
}

void __47__COStateManager_changesObserved_forPredicate___block_invoke_cold_1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_21D3E0000, v0, v1, "StateManager %p observed changes %@", v2);
}

- (void)_onqueue_setDictionary:clusters:cacheLocally:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_21D3E0000, v0, v1, "Cannot set value for clusters %@ outside scope of COStateManager", v2, v3, v4, v5, v6);
}

void __81__COStateManager__onqueue_setDictionary_clusters_cacheLocally_completionHandler___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_6(&dword_21D3E0000, v0, v1, "%p failed to get state manager remote proxy for setting state %@ - %@. Setting state locally");
}

- (void)_onqueue_removeObjectsForKeyPaths:clusters:cacheLocally:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_21D3E0000, v0, v1, "Cannot remove value for clusters %@ outside scope of COStateManager", v2, v3, v4, v5, v6);
}

void __92__COStateManager__onqueue_removeObjectsForKeyPaths_clusters_cacheLocally_completionHandler___block_invoke_3_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 134218242;
  *(void *)&v3[4] = *(void *)(a1 + 40);
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_0_0(&dword_21D3E0000, a2, a3, "%p failed to get state manager remote proxy for removing object with key - %@. Removing state locally", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

void __44__COStateManager__onqueue_registerObserver___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_21D3E0000, v0, v1, "%p failed to get state manager remote proxy for observation - %@");
}

void __42__COStateManager__lostConnectionToService__block_invoke_2_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_21D3E0000, v0, OS_LOG_TYPE_ERROR, "%p Failed to re-present state %@", v1, 0x16u);
}

void __51__COStateManager__remoteInterfaceWithErrorHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_21D3E0000, v0, v1, "%p connection to State service interrupted", v2, v3, v4, v5, v6);
}

void __51__COStateManager__remoteInterfaceWithErrorHandler___block_invoke_167_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_21D3E0000, v0, v1, "%p connection to State service invalidated", v2, v3, v4, v5, v6);
}

void __85__COStateManager_ClusterExamination__fetchCompositionForCluster_dispatchQueue_block___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_21D3E0000, v0, v1, "%p failed to get state manager remote proxy for cluster composition - %@");
}

void __71__COStateManager_Doorbell__delayForDoorbellChimeWithCompletionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6(&dword_21D3E0000, v0, v1, "%p failed to get state manager remote proxy for doorbell delay - %@. Falling back to default delay of %f seconds");
}

@end