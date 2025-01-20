@interface ACHEarnedInstanceStore
- (ACHAwardsClient)client;
- (ACHDatabaseAssertionClient)assertionClient;
- (ACHEarnedInstanceDuplicateUtility)duplicateUtility;
- (ACHEarnedInstanceEntityWrapper)entityWrapper;
- (ACHEarnedInstanceStore)initWithClient:(id)a3 assertionClient:(id)a4 earnedInstanceDuplicateUtility:(id)a5 device:(unsigned __int8)a6;
- (ACHEarnedInstanceStore)initWithProfile:(id)a3 earnedInstanceEntityWrapper:(id)a4 earnedInstanceDuplicateUtility:(id)a5 device:(unsigned __int8)a6;
- (BOOL)_client_removeAllEarnedInstancesWithError:(id *)a3;
- (BOOL)_daemon_removeAllEarnedInstancesWithError:(id *)a3;
- (BOOL)_queue_addEarnedInstances:(id)a3 provenance:(int64_t)a4 databaseContext:(id)a5 triggerSync:(BOOL)a6 error:(id *)a7;
- (BOOL)_queue_client_removeEarnedInstances:(id)a3 error:(id *)a4;
- (BOOL)_queue_daemon_loadAllEarnedInstancesFromDatabaseIfNecessary;
- (BOOL)_queue_daemon_removeEarnedInstances:(id)a3 error:(id *)a4;
- (BOOL)addEarnedInstances:(id)a3 databaseContext:(id)a4 error:(id *)a5;
- (BOOL)addEarnedInstances:(id)a3 error:(id *)a4;
- (BOOL)earnedInstanceEntityDidReceiveSyncedEarnedInstances:(id)a3 provenance:(int64_t)a4;
- (BOOL)initialEarnedInstanceFetchComplete;
- (BOOL)isUsingNewAwardingSystem;
- (BOOL)loadAllEarnedInstancesFromDatabaseIfNecessary;
- (BOOL)needsUpdateWhenProtectedDataAvailable;
- (BOOL)removeAllEarnedInstancesWithError:(id *)a3;
- (BOOL)removeEarnedInstances:(id)a3 error:(id *)a4;
- (HDProfile)profile;
- (NSArray)earnedInstances;
- (NSCache)earnedInstancesForEarnedDateComponentsCache;
- (NSCache)earnedInstancesForTemplateUniqueNameCache;
- (NSHashTable)observers;
- (NSMutableArray)allEarnedInstances;
- (OS_dispatch_queue)earnedInstanceQueue;
- (OS_dispatch_queue)observerQueue;
- (id)_client_earnedInstances;
- (id)_client_earnedInstancesForTemplateUniqueName:(id)a3 error:(id *)a4;
- (id)_daemon_earnedInstances;
- (id)_daemon_earnedInstancesForTemplateUniqueName:(id)a3;
- (id)_queue_client_addEarnedInstancesWithSingleTemplate:(id)a3 provenance:(int64_t)a4 error:(id *)a5;
- (id)_queue_daemon_addEarnedInstancesWithSingleTemplate:(id)a3 provenance:(int64_t)a4 databaseContext:(id)a5 error:(id *)a6;
- (id)_queue_earnedInstancesArray;
- (id)_queue_earnedInstancesFilteredForDuplicates:(id)a3;
- (id)_queue_orphanedEarnedInstancesWithFetchedInstances:(id)a3;
- (id)countOfEarnedInstancesForTemplateUniqueNames:(id)a3 error:(id *)a4;
- (id)earnedInstancesForEarnedDateComponents:(id)a3 error:(id *)a4;
- (id)earnedInstancesForTemplateUniqueName:(id)a3 error:(id *)a4;
- (id)mostRecentEarnedInstanceForTemplateUniqueName:(id)a3 error:(id *)a4;
- (id)mostRecentEarnedInstancesForTemplateUniqueNames:(id)a3 error:(id *)a4;
- (int)syncedEarnedInstancesToken;
- (unint64_t)countOfEarnedInstancesForTemplateUniqueName:(id)a3 error:(id *)a4;
- (unint64_t)countOfEarnedInstancesForTemplateUniqueName:(id)a3 inDateComponentInterval:(id)a4 withCalendar:(id)a5 error:(id *)a6;
- (unsigned)device;
- (void)_client_earnedInstances;
- (void)_notifyInitialFetchComplete;
- (void)_notifyObserversOfAddedEarnedInstances:(id)a3;
- (void)_notifyObserversOfRemovedEarnedInstances:(id)a3;
- (void)_notifyObserversOfSync;
- (void)_queue_appendOrInsertEarnedInstanceToInMemoryStore:(id)a3;
- (void)_queue_daemon_loadAllEarnedInstancesFromDatabaseIfNecessary;
- (void)_queue_purgeCaches;
- (void)_queue_removeEarnedInstanceFromInMemoryStore:(id)a3;
- (void)addObserver:(id)a3;
- (void)earnedInstanceEntityDidApplyJournalEntriesInsertedEarnedInstances:(id)a3 removedEarnedInstances:(id)a4;
- (void)removeObserver:(id)a3;
- (void)setAllEarnedInstances:(id)a3;
- (void)setAssertionClient:(id)a3;
- (void)setClient:(id)a3;
- (void)setDevice:(unsigned __int8)a3;
- (void)setDuplicateUtility:(id)a3;
- (void)setEarnedInstanceQueue:(id)a3;
- (void)setEarnedInstancesForEarnedDateComponentsCache:(id)a3;
- (void)setEarnedInstancesForTemplateUniqueNameCache:(id)a3;
- (void)setEntityWrapper:(id)a3;
- (void)setInitialEarnedInstanceFetchComplete:(BOOL)a3;
- (void)setNeedsUpdateWhenProtectedDataAvailable:(BOOL)a3;
- (void)setObserverQueue:(id)a3;
- (void)setObservers:(id)a3;
- (void)setProfile:(id)a3;
- (void)setSyncedEarnedInstancesToken:(int)a3;
@end

@implementation ACHEarnedInstanceStore

- (ACHEarnedInstanceStore)initWithClient:(id)a3 assertionClient:(id)a4 earnedInstanceDuplicateUtility:(id)a5 device:(unsigned __int8)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v34.receiver = self;
  v34.super_class = (Class)ACHEarnedInstanceStore;
  v14 = [(ACHEarnedInstanceStore *)&v34 init];
  v15 = v14;
  if (v14)
  {
    v14->_isUsingNewAwardingSystem = 1;
    objc_storeStrong((id *)&v14->_client, a3);
    objc_storeStrong((id *)&v15->_assertionClient, a4);
    objc_storeStrong((id *)&v15->_duplicateUtility, a5);
    uint64_t v16 = HKCreateSerialDispatchQueue();
    earnedInstanceQueue = v15->_earnedInstanceQueue;
    v15->_earnedInstanceQueue = (OS_dispatch_queue *)v16;

    v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    allEarnedInstances = v15->_allEarnedInstances;
    v15->_allEarnedInstances = v18;

    uint64_t v20 = HKCreateSerialDispatchQueue();
    observerQueue = v15->_observerQueue;
    v15->_observerQueue = (OS_dispatch_queue *)v20;

    uint64_t v22 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    observers = v15->_observers;
    v15->_observers = (NSHashTable *)v22;

    v24 = (NSCache *)objc_alloc_init(MEMORY[0x263EFF8E0]);
    earnedInstancesForTemplateUniqueNameCache = v15->_earnedInstancesForTemplateUniqueNameCache;
    v15->_earnedInstancesForTemplateUniqueNameCache = v24;

    v26 = (NSCache *)objc_alloc_init(MEMORY[0x263EFF8E0]);
    earnedInstancesForEarnedDateComponentsCache = v15->_earnedInstancesForEarnedDateComponentsCache;
    v15->_earnedInstancesForEarnedDateComponentsCache = v26;

    v15->_device = a6;
    objc_initWeak(&location, v15);
    v28 = (const char *)[(id)*MEMORY[0x263F23488] UTF8String];
    v29 = v15->_earnedInstanceQueue;
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __95__ACHEarnedInstanceStore_initWithClient_assertionClient_earnedInstanceDuplicateUtility_device___block_invoke;
    v31[3] = &unk_264515D40;
    objc_copyWeak(&v32, &location);
    notify_register_dispatch(v28, &v15->_syncedEarnedInstancesToken, v29, v31);
    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);
  }

  return v15;
}

void __95__ACHEarnedInstanceStore_initWithClient_assertionClient_earnedInstanceDuplicateUtility_device___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _notifyObserversOfSync];
}

- (ACHEarnedInstanceStore)initWithProfile:(id)a3 earnedInstanceEntityWrapper:(id)a4 earnedInstanceDuplicateUtility:(id)a5 device:(unsigned __int8)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v25.receiver = self;
  v25.super_class = (Class)ACHEarnedInstanceStore;
  id v13 = [(ACHEarnedInstanceStore *)&v25 init];
  v14 = v13;
  if (v13)
  {
    objc_storeWeak((id *)&v13->_profile, v10);
    objc_storeStrong((id *)&v14->_entityWrapper, a4);
    objc_storeStrong((id *)&v14->_duplicateUtility, a5);
    uint64_t v15 = HKCreateSerialDispatchQueue();
    earnedInstanceQueue = v14->_earnedInstanceQueue;
    v14->_earnedInstanceQueue = (OS_dispatch_queue *)v15;

    v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    allEarnedInstances = v14->_allEarnedInstances;
    v14->_allEarnedInstances = v17;

    uint64_t v19 = HKCreateSerialDispatchQueue();
    observerQueue = v14->_observerQueue;
    v14->_observerQueue = (OS_dispatch_queue *)v19;

    uint64_t v21 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    observers = v14->_observers;
    v14->_observers = (NSHashTable *)v21;

    v14->_device = a6;
    v23 = [(ACHEarnedInstanceStore *)v14 entityWrapper];
    [v23 setSyncedEarnedInstancesObserver:v14];
  }
  return v14;
}

- (BOOL)earnedInstanceEntityDidReceiveSyncedEarnedInstances:(id)a3 provenance:(int64_t)a4
{
  id v6 = a3;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 1;
  v7 = [(ACHEarnedInstanceStore *)self earnedInstanceQueue];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __89__ACHEarnedInstanceStore_earnedInstanceEntityDidReceiveSyncedEarnedInstances_provenance___block_invoke;
  v10[3] = &unk_2645171A8;
  id v11 = v6;
  id v12 = self;
  id v13 = &v15;
  int64_t v14 = a4;
  id v8 = v6;
  dispatch_sync(v7, v10);

  LOBYTE(self) = *((unsigned char *)v16 + 24);
  _Block_object_dispose(&v15, 8);
  return (char)self;
}

void __89__ACHEarnedInstanceStore_earnedInstanceEntityDidReceiveSyncedEarnedInstances_provenance___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = ACHLogSync();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "count"));
    *(_DWORD *)buf = 138543362;
    uint64_t v15 = v3;
    _os_log_impl(&dword_21F5DA000, v2, OS_LOG_TYPE_DEFAULT, "Earned instance store received %{public}@ earned instances from sync observing", buf, 0xCu);
  }
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = *(void **)(a1 + 40);
  uint64_t v5 = a1 + 32;
  v7 = [MEMORY[0x263EFFA08] setWithArray:v4];
  uint64_t v8 = *(void *)(v5 + 24);
  id v13 = 0;
  char v9 = objc_msgSend(v6, "_queue_addEarnedInstances:provenance:databaseContext:triggerSync:error:", v7, v8, 0, 0, &v13);
  id v10 = v13;
  *(unsigned char *)(*(void *)(*(void *)(v5 + 16) + 8) + 24) = v9;

  if (*(unsigned char *)(*(void *)(*(void *)(v5 + 16) + 8) + 24))
  {
    id v11 = ACHLogSync();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)v5, "count"));
      *(_DWORD *)buf = 138543362;
      uint64_t v15 = v12;
      _os_log_impl(&dword_21F5DA000, v11, OS_LOG_TYPE_DEFAULT, "Successfully added %{public}@ earned instances from sync observing", buf, 0xCu);
    }
  }
  else
  {
    id v11 = ACHLogDatabase();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __89__ACHEarnedInstanceStore_earnedInstanceEntityDidReceiveSyncedEarnedInstances_provenance___block_invoke_cold_1();
    }
  }
}

- (id)_queue_earnedInstancesFilteredForDuplicates:(id)a3
{
  v3 = (void *)MEMORY[0x263F08A98];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __70__ACHEarnedInstanceStore__queue_earnedInstancesFilteredForDuplicates___block_invoke;
  v8[3] = &unk_2645171D0;
  v8[4] = self;
  id v4 = a3;
  uint64_t v5 = [v3 predicateWithBlock:v8];
  id v6 = [v4 filteredArrayUsingPredicate:v5];

  return v6;
}

uint64_t __70__ACHEarnedInstanceStore__queue_earnedInstancesFilteredForDuplicates___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 allEarnedInstances];
  int v5 = [v4 containsObject:v3];

  return v5 ^ 1u;
}

- (id)_queue_orphanedEarnedInstancesWithFetchedInstances:(id)a3
{
  id v4 = a3;
  int v5 = [(ACHEarnedInstanceStore *)self allEarnedInstances];
  id v6 = (void *)MEMORY[0x263F08A98];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __77__ACHEarnedInstanceStore__queue_orphanedEarnedInstancesWithFetchedInstances___block_invoke;
  v11[3] = &unk_2645171D0;
  id v12 = v4;
  id v7 = v4;
  uint64_t v8 = [v6 predicateWithBlock:v11];
  char v9 = [v5 filteredArrayUsingPredicate:v8];

  return v9;
}

uint64_t __77__ACHEarnedInstanceStore__queue_orphanedEarnedInstancesWithFetchedInstances___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2] ^ 1;
}

- (void)earnedInstanceEntityDidApplyJournalEntriesInsertedEarnedInstances:(id)a3 removedEarnedInstances:(id)a4
{
  id v5 = a3;
  earnedInstanceQueue = self->_earnedInstanceQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __115__ACHEarnedInstanceStore_earnedInstanceEntityDidApplyJournalEntriesInsertedEarnedInstances_removedEarnedInstances___block_invoke;
  v8[3] = &unk_264515DE0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(earnedInstanceQueue, v8);
}

uint64_t __115__ACHEarnedInstanceStore_earnedInstanceEntityDidApplyJournalEntriesInsertedEarnedInstances_removedEarnedInstances___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  objc_msgSend(*(id *)(a1 + 32), "_queue_purgeCaches");
  v2 = ACHLogDatabase();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "count"));
    *(_DWORD *)buf = 138543362;
    uint64_t v17 = v3;
    _os_log_impl(&dword_21F5DA000, v2, OS_LOG_TYPE_DEFAULT, "Adding %{public}@ earned instances from journal being applied to in memory store", buf, 0xCu);
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(a1 + 32), "_queue_appendOrInsertEarnedInstanceToInMemoryStore:", *(void *)(*((void *)&v11 + 1) + 8 * v8++), (void)v11);
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  id v9 = ACHLogDatabase();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21F5DA000, v9, OS_LOG_TYPE_DEFAULT, "Notifying observers of added earned instances from journal being applied", buf, 2u);
  }

  return [*(id *)(a1 + 32) _notifyObserversOfAddedEarnedInstances:*(void *)(a1 + 40)];
}

- (id)_queue_earnedInstancesArray
{
  id v3 = [(ACHEarnedInstanceStore *)self earnedInstanceQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = objc_alloc(MEMORY[0x263EFF8C0]);
  uint64_t v5 = [(ACHEarnedInstanceStore *)self allEarnedInstances];
  uint64_t v6 = (void *)[v4 initWithArray:v5];

  return v6;
}

- (NSArray)earnedInstances
{
  if ([(ACHEarnedInstanceStore *)self isUsingNewAwardingSystem]) {
    [(ACHEarnedInstanceStore *)self _client_earnedInstances];
  }
  else {
  id v3 = [(ACHEarnedInstanceStore *)self _daemon_earnedInstances];
  }
  return (NSArray *)v3;
}

- (id)_client_earnedInstances
{
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__15;
  uint64_t v22 = __Block_byref_object_dispose__15;
  id v23 = 0;
  uint64_t v15 = 0;
  v16[0] = &v15;
  v16[1] = 0x3032000000;
  v16[2] = __Block_byref_object_copy__15;
  v16[3] = __Block_byref_object_dispose__15;
  id v17 = 0;
  id v3 = [(ACHEarnedInstanceStore *)self earnedInstanceQueue];
  dispatch_assert_queue_not_V2(v3);

  id v4 = [(ACHEarnedInstanceStore *)self earnedInstanceQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__ACHEarnedInstanceStore__client_earnedInstances__block_invoke;
  block[3] = &unk_264516BB8;
  block[4] = self;
  block[5] = &v18;
  block[6] = &v15;
  dispatch_sync(v4, block);

  if (*(void *)(v16[0] + 40))
  {
    uint64_t v5 = ACHLogDefault();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      [(ACHEarnedInstanceStore *)(uint64_t)v16 _client_earnedInstances];
    }
  }
  id v12 = (id)v19[5];
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v18, 8);
  return v12;
}

void __49__ACHEarnedInstanceStore__client_earnedInstances__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) client];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v3 + 40);
  uint64_t v4 = [v2 fetchAllEarnedInstancesWithError:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (id)_daemon_earnedInstances
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__15;
  id v12 = __Block_byref_object_dispose__15;
  id v13 = 0;
  uint64_t v3 = [(ACHEarnedInstanceStore *)self earnedInstanceQueue];
  dispatch_assert_queue_not_V2(v3);

  uint64_t v4 = [(ACHEarnedInstanceStore *)self earnedInstanceQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49__ACHEarnedInstanceStore__daemon_earnedInstances__block_invoke;
  v7[3] = &unk_264516580;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

uint64_t __49__ACHEarnedInstanceStore__daemon_earnedInstances__block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_earnedInstancesArray");
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x270F9A758](v2, v4);
}

- (id)earnedInstancesForTemplateUniqueName:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(ACHEarnedInstanceStore *)self isUsingNewAwardingSystem]) {
    [(ACHEarnedInstanceStore *)self _client_earnedInstancesForTemplateUniqueName:v6 error:a4];
  }
  else {
  uint64_t v7 = [(ACHEarnedInstanceStore *)self _daemon_earnedInstancesForTemplateUniqueName:v6];
  }

  return v7;
}

- (id)_client_earnedInstancesForTemplateUniqueName:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__15;
  v27 = __Block_byref_object_dispose__15;
  id v28 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__15;
  uint64_t v21 = __Block_byref_object_dispose__15;
  id v22 = 0;
  uint64_t v7 = [(ACHEarnedInstanceStore *)self earnedInstanceQueue];
  dispatch_assert_queue_not_V2(v7);

  uint64_t v8 = [(ACHEarnedInstanceStore *)self earnedInstanceQueue];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __77__ACHEarnedInstanceStore__client_earnedInstancesForTemplateUniqueName_error___block_invoke;
  v13[3] = &unk_264516C08;
  v13[4] = self;
  id v9 = v6;
  id v14 = v9;
  uint64_t v15 = &v23;
  uint64_t v16 = &v17;
  dispatch_sync(v8, v13);

  if (v18[5])
  {
    uint64_t v10 = ACHLogDefault();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[ACHEarnedInstanceStore _client_earnedInstancesForTemplateUniqueName:error:]();
    }

    if (a4) {
      *a4 = (id) v18[5];
    }
  }
  id v11 = (id)v24[5];

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v11;
}

void __77__ACHEarnedInstanceStore__client_earnedInstancesForTemplateUniqueName_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) earnedInstancesForTemplateUniqueNameCache];
  uint64_t v3 = [v2 objectForKey:*(void *)(a1 + 40)];

  if (v3)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v3);
  }
  else
  {
    uint64_t v4 = [*(id *)(a1 + 32) client];
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
    id obj = *(id *)(v6 + 40);
    uint64_t v7 = [v4 fetchEarnedInstancesForTemplateUniqueName:v5 error:&obj];
    objc_storeStrong((id *)(v6 + 40), obj);
    uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
    {
      uint64_t v10 = [*(id *)(a1 + 32) earnedInstancesForTemplateUniqueNameCache];
      [v10 setObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) forKey:*(void *)(a1 + 40)];
    }
  }
}

- (id)_daemon_earnedInstancesForTemplateUniqueName:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__15;
  uint64_t v18 = __Block_byref_object_dispose__15;
  id v19 = 0;
  uint64_t v5 = [(ACHEarnedInstanceStore *)self earnedInstanceQueue];
  dispatch_assert_queue_not_V2(v5);

  uint64_t v6 = [(ACHEarnedInstanceStore *)self earnedInstanceQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __71__ACHEarnedInstanceStore__daemon_earnedInstancesForTemplateUniqueName___block_invoke;
  block[3] = &unk_264516580;
  block[4] = self;
  block[5] = &v14;
  dispatch_sync(v6, block);

  uint64_t v7 = (void *)v15[5];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __71__ACHEarnedInstanceStore__daemon_earnedInstancesForTemplateUniqueName___block_invoke_2;
  v11[3] = &unk_264516EE0;
  id v8 = v4;
  id v12 = v8;
  id v9 = objc_msgSend(v7, "hk_filter:", v11);

  _Block_object_dispose(&v14, 8);
  return v9;
}

uint64_t __71__ACHEarnedInstanceStore__daemon_earnedInstancesForTemplateUniqueName___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_earnedInstancesArray");
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x270F9A758](v2, v4);
}

uint64_t __71__ACHEarnedInstanceStore__daemon_earnedInstancesForTemplateUniqueName___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 templateUniqueName];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (id)earnedInstancesForEarnedDateComponents:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__15;
  id v28 = __Block_byref_object_dispose__15;
  id v29 = 0;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__15;
  id v22 = __Block_byref_object_dispose__15;
  id v23 = 0;
  uint64_t v7 = [(ACHEarnedInstanceStore *)self earnedInstanceQueue];
  dispatch_assert_queue_not_V2(v7);

  id v8 = [(ACHEarnedInstanceStore *)self earnedInstanceQueue];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __71__ACHEarnedInstanceStore_earnedInstancesForEarnedDateComponents_error___block_invoke;
  v13[3] = &unk_264516C08;
  id v9 = v6;
  id v14 = v9;
  uint64_t v15 = self;
  uint64_t v16 = &v24;
  uint64_t v17 = &v18;
  dispatch_sync(v8, v13);

  if (v19[5])
  {
    uint64_t v10 = ACHLogDefault();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[ACHEarnedInstanceStore earnedInstancesForEarnedDateComponents:error:]();
    }

    if (a4) {
      *a4 = (id) v19[5];
    }
  }
  id v11 = (id)v25[5];

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v11;
}

void __71__ACHEarnedInstanceStore_earnedInstancesForEarnedDateComponents_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = ACHYearMonthDayStringFromDateComponents();
  uint64_t v3 = [*(id *)(a1 + 40) earnedInstancesForEarnedDateComponentsCache];
  uint64_t v4 = [v3 objectForKey:v2];

  if (v4)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v4);
  }
  else
  {
    uint64_t v5 = [*(id *)(a1 + 40) client];
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
    id obj = *(id *)(v7 + 40);
    uint64_t v8 = [v5 fetchEarnedInstancesForEarnedDateComponents:v6 error:&obj];
    objc_storeStrong((id *)(v7 + 40), obj);
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
    {
      id v11 = [*(id *)(a1 + 40) earnedInstancesForEarnedDateComponentsCache];
      [v11 setObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) forKey:v2];
    }
  }
}

- (id)mostRecentEarnedInstanceForTemplateUniqueName:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = __Block_byref_object_copy__15;
  v27 = __Block_byref_object_dispose__15;
  id v28 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__15;
  uint64_t v21 = __Block_byref_object_dispose__15;
  id v22 = 0;
  uint64_t v7 = [(ACHEarnedInstanceStore *)self earnedInstanceQueue];
  dispatch_assert_queue_not_V2(v7);

  uint64_t v8 = [(ACHEarnedInstanceStore *)self earnedInstanceQueue];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __78__ACHEarnedInstanceStore_mostRecentEarnedInstanceForTemplateUniqueName_error___block_invoke;
  v13[3] = &unk_264516A38;
  uint64_t v15 = &v23;
  void v13[4] = self;
  id v9 = v6;
  id v14 = v9;
  uint64_t v16 = &v17;
  dispatch_sync(v8, v13);

  if (v18[5])
  {
    uint64_t v10 = ACHLogDefault();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[ACHEarnedInstanceStore mostRecentEarnedInstanceForTemplateUniqueName:error:]();
    }

    if (a4) {
      *a4 = (id) v18[5];
    }
  }
  id v11 = (id)v24[5];

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v11;
}

void __78__ACHEarnedInstanceStore_mostRecentEarnedInstanceForTemplateUniqueName_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) client];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = [v2 fetchMostRecentEarnedInstanceForTemplateUniqueName:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)mostRecentEarnedInstancesForTemplateUniqueNames:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = __Block_byref_object_copy__15;
  v27 = __Block_byref_object_dispose__15;
  id v28 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__15;
  uint64_t v21 = __Block_byref_object_dispose__15;
  id v22 = 0;
  uint64_t v7 = [(ACHEarnedInstanceStore *)self earnedInstanceQueue];
  dispatch_assert_queue_not_V2(v7);

  uint64_t v8 = [(ACHEarnedInstanceStore *)self earnedInstanceQueue];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __80__ACHEarnedInstanceStore_mostRecentEarnedInstancesForTemplateUniqueNames_error___block_invoke;
  v13[3] = &unk_264516A38;
  uint64_t v15 = &v23;
  void v13[4] = self;
  id v9 = v6;
  id v14 = v9;
  uint64_t v16 = &v17;
  dispatch_sync(v8, v13);

  if (v18[5])
  {
    uint64_t v10 = ACHLogDefault();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[ACHEarnedInstanceStore mostRecentEarnedInstancesForTemplateUniqueNames:error:]();
    }

    if (a4) {
      *a4 = (id) v18[5];
    }
  }
  id v11 = (id)v24[5];

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v11;
}

void __80__ACHEarnedInstanceStore_mostRecentEarnedInstancesForTemplateUniqueNames_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) client];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = [v2 fetchMostRecentEarnedInstancesForTemplateUniqueNames:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (unint64_t)countOfEarnedInstancesForTemplateUniqueName:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x2020000000;
  uint64_t v26 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__15;
  uint64_t v21 = __Block_byref_object_dispose__15;
  id v22 = 0;
  uint64_t v7 = [(ACHEarnedInstanceStore *)self earnedInstanceQueue];
  dispatch_assert_queue_not_V2(v7);

  uint64_t v8 = [(ACHEarnedInstanceStore *)self earnedInstanceQueue];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __76__ACHEarnedInstanceStore_countOfEarnedInstancesForTemplateUniqueName_error___block_invoke;
  v13[3] = &unk_264516A38;
  uint64_t v15 = &v23;
  void v13[4] = self;
  id v9 = v6;
  id v14 = v9;
  uint64_t v16 = &v17;
  dispatch_sync(v8, v13);

  if (v18[5])
  {
    uint64_t v10 = ACHLogDefault();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[ACHEarnedInstanceStore countOfEarnedInstancesForTemplateUniqueName:error:]();
    }

    if (a4) {
      *a4 = (id) v18[5];
    }
  }
  unint64_t v11 = v24[3];

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v11;
}

void __76__ACHEarnedInstanceStore_countOfEarnedInstancesForTemplateUniqueName_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) client];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = [v2 countOfEarnedInstancesForTemplateUniqueName:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v5 unsignedIntegerValue];
}

- (id)countOfEarnedInstancesForTemplateUniqueNames:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = __Block_byref_object_copy__15;
  v27 = __Block_byref_object_dispose__15;
  id v28 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__15;
  uint64_t v21 = __Block_byref_object_dispose__15;
  id v22 = 0;
  uint64_t v7 = [(ACHEarnedInstanceStore *)self earnedInstanceQueue];
  dispatch_assert_queue_not_V2(v7);

  uint64_t v8 = [(ACHEarnedInstanceStore *)self earnedInstanceQueue];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __77__ACHEarnedInstanceStore_countOfEarnedInstancesForTemplateUniqueNames_error___block_invoke;
  v13[3] = &unk_264516A38;
  uint64_t v15 = &v23;
  void v13[4] = self;
  id v9 = v6;
  id v14 = v9;
  uint64_t v16 = &v17;
  dispatch_sync(v8, v13);

  if (v18[5])
  {
    uint64_t v10 = ACHLogDefault();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[ACHEarnedInstanceStore countOfEarnedInstancesForTemplateUniqueNames:error:]();
    }

    if (a4) {
      *a4 = (id) v18[5];
    }
  }
  id v11 = (id)v24[5];

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v11;
}

void __77__ACHEarnedInstanceStore_countOfEarnedInstancesForTemplateUniqueNames_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) client];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = [v2 countOfEarnedInstancesForTemplateUniqueNames:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (unint64_t)countOfEarnedInstancesForTemplateUniqueName:(id)a3 inDateComponentInterval:(id)a4 withCalendar:(id)a5 error:(id *)a6
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = a5;
  id v12 = [(ACHEarnedInstanceStore *)self earnedInstancesForTemplateUniqueName:a3 error:a6];
  id v13 = [v10 startDateComponents];
  id v14 = [v11 dateFromComponents:v13];
  [v14 timeIntervalSinceReferenceDate];
  double v16 = v15;

  uint64_t v17 = [v10 endDateComponents];
  uint64_t v18 = [v11 dateFromComponents:v17];
  [v18 timeIntervalSinceReferenceDate];
  double v20 = v19;

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v21 = v12;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    unint64_t v24 = 0;
    uint64_t v25 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v34 != v25) {
          objc_enumerationMutation(v21);
        }
        v27 = objc_msgSend(*(id *)(*((void *)&v33 + 1) + 8 * i), "earnedDateComponents", (void)v33);
        id v28 = [v11 dateFromComponents:v27];
        [v28 timeIntervalSinceReferenceDate];
        double v30 = v29;

        uint64_t v31 = v30 <= v20 && v30 >= v16;
        v24 += v31;
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v23);
  }
  else
  {
    unint64_t v24 = 0;
  }

  return v24;
}

- (BOOL)addEarnedInstances:(id)a3 databaseContext:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  id v10 = [(ACHEarnedInstanceStore *)self earnedInstanceQueue];
  dispatch_assert_queue_not_V2(v10);

  id v11 = [(ACHEarnedInstanceStore *)self earnedInstanceQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__ACHEarnedInstanceStore_addEarnedInstances_databaseContext_error___block_invoke;
  block[3] = &unk_2645171F8;
  id v16 = v8;
  uint64_t v17 = self;
  id v18 = v9;
  double v19 = &v21;
  double v20 = a5;
  id v12 = v9;
  id v13 = v8;
  dispatch_sync(v11, block);

  LOBYTE(self) = *((unsigned char *)v22 + 24);
  _Block_object_dispose(&v21, 8);
  return (char)self;
}

void __67__ACHEarnedInstanceStore_addEarnedInstances_databaseContext_error___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263EFF910] date];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        objc_msgSend(v8, "setCreatedDate:", v2, (void)v9);
        [v8 setCreatorDevice:*(unsigned __int8 *)(*(void *)(a1 + 40) + 10)];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(a1 + 40), "_queue_addEarnedInstances:provenance:databaseContext:triggerSync:error:", *(void *)(a1 + 32), 0, *(void *)(a1 + 48), 1, *(void *)(a1 + 64));
}

- (BOOL)addEarnedInstances:(id)a3 error:(id *)a4
{
  return [(ACHEarnedInstanceStore *)self addEarnedInstances:a3 databaseContext:0 error:a4];
}

- (void)_queue_appendOrInsertEarnedInstanceToInMemoryStore:(id)a3
{
  id v4 = a3;
  if (![(ACHEarnedInstanceStore *)self isUsingNewAwardingSystem])
  {
    uint64_t v5 = [(ACHEarnedInstanceStore *)self earnedInstanceQueue];
    dispatch_assert_queue_V2(v5);

    uint64_t v6 = [(ACHEarnedInstanceStore *)self allEarnedInstances];

    if (v6)
    {
      uint64_t v7 = [(ACHEarnedInstanceStore *)self allEarnedInstances];
      id v8 = [v7 lastObject];

      if (v8
        && ([v8 earnedDateComponents],
            long long v9 = objc_claimAutoreleasedReturnValue(),
            [v4 earnedDateComponents],
            long long v10 = objc_claimAutoreleasedReturnValue(),
            uint64_t v11 = ACHCompareYearMonthDayDateComponents(),
            v10,
            v9,
            v11 == 1))
      {
        *(void *)buf = 0;
        uint64_t v26 = buf;
        uint64_t v27 = 0x2020000000;
        uint64_t v28 = 0;
        long long v12 = [(ACHEarnedInstanceStore *)self allEarnedInstances];
        v22[0] = MEMORY[0x263EF8330];
        v22[1] = 3221225472;
        v22[2] = __77__ACHEarnedInstanceStore__queue_appendOrInsertEarnedInstanceToInMemoryStore___block_invoke;
        v22[3] = &unk_264517220;
        id v13 = v4;
        id v23 = v13;
        char v24 = buf;
        [v12 enumerateObjectsUsingBlock:v22];

        unint64_t v14 = *((void *)v26 + 3);
        double v15 = [(ACHEarnedInstanceStore *)self allEarnedInstances];
        unint64_t v16 = [v15 count] - 1;

        if (v14 >= v16)
        {
          double v19 = ACHLogDatabase();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)uint64_t v21 = 0;
            _os_log_impl(&dword_21F5DA000, v19, OS_LOG_TYPE_DEFAULT, "Unable to find index for earned instance insertion!", v21, 2u);
          }

          double v20 = [(ACHEarnedInstanceStore *)self allEarnedInstances];
          [v20 addObject:v13];

          uint64_t v17 = [(ACHEarnedInstanceStore *)self allEarnedInstances];
          [v17 sortUsingComparator:&__block_literal_global_16];
        }
        else
        {
          uint64_t v17 = [(ACHEarnedInstanceStore *)self allEarnedInstances];
          [v17 insertObject:v13 atIndex:*((void *)v26 + 3)];
        }

        _Block_object_dispose(buf, 8);
      }
      else
      {
        id v18 = [(ACHEarnedInstanceStore *)self allEarnedInstances];
        [v18 addObject:v4];
      }
    }
    else
    {
      id v8 = ACHLogDatabase();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21F5DA000, v8, OS_LOG_TYPE_DEFAULT, "!!!!! Trying to append earned instance to in-memory store but it's nil!", buf, 2u);
      }
    }
  }
}

void __77__ACHEarnedInstanceStore__queue_appendOrInsertEarnedInstanceToInMemoryStore___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v7 = [a2 earnedDateComponents];
  id v8 = [*(id *)(a1 + 32) earnedDateComponents];
  uint64_t v9 = ACHCompareYearMonthDayDateComponents();

  if (v9 == 1)
  {
    uint64_t v10 = a3 - 1;
    if (!a3) {
      uint64_t v10 = 0;
    }
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v10;
    *a4 = 1;
  }
}

uint64_t __77__ACHEarnedInstanceStore__queue_appendOrInsertEarnedInstanceToInMemoryStore___block_invoke_298(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 earnedDateComponents];
  uint64_t v6 = [v4 earnedDateComponents];

  uint64_t v7 = ACHCompareYearMonthDayDateComponents();
  return v7;
}

- (void)_queue_removeEarnedInstanceFromInMemoryStore:(id)a3
{
  id v5 = a3;
  if (![(ACHEarnedInstanceStore *)self isUsingNewAwardingSystem])
  {
    id v4 = [(ACHEarnedInstanceStore *)self allEarnedInstances];
    [v4 removeObject:v5];
  }
}

- (void)_queue_purgeCaches
{
  id v3 = [(ACHEarnedInstanceStore *)self earnedInstanceQueue];
  dispatch_assert_queue_V2(v3);

  if ([(ACHEarnedInstanceStore *)self isUsingNewAwardingSystem])
  {
    id v4 = [(ACHEarnedInstanceStore *)self earnedInstancesForTemplateUniqueNameCache];
    [v4 removeAllObjects];

    id v5 = [(ACHEarnedInstanceStore *)self earnedInstancesForEarnedDateComponentsCache];
    [v5 removeAllObjects];
  }
}

- (BOOL)_queue_addEarnedInstances:(id)a3 provenance:(int64_t)a4 databaseContext:(id)a5 triggerSync:(BOOL)a6 error:(id *)a7
{
  BOOL v48 = a6;
  uint64_t v73 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v51 = a5;
  long long v12 = [(ACHEarnedInstanceStore *)self earnedInstanceQueue];
  dispatch_assert_queue_V2(v12);

  [(ACHEarnedInstanceStore *)self _queue_purgeCaches];
  v53 = v11;
  id v13 = objc_msgSend(v11, "hk_map:", &__block_literal_global_302);
  if ([(ACHEarnedInstanceStore *)self isUsingNewAwardingSystem])
  {
    unint64_t v14 = [(ACHEarnedInstanceStore *)self assertionClient];
    id v68 = 0;
    uint64_t v15 = [v14 acquireDatabaseAssertionWithIdentifier:@"AddEarnedInstances" error:&v68];
    id v16 = v68;

    if (v16)
    {
      uint64_t v17 = ACHLogDatabase();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[ACHEarnedInstanceStore _queue_addEarnedInstances:provenance:databaseContext:triggerSync:error:]();
      }
    }
  }
  else
  {
    uint64_t v15 = 0;
  }
  v49 = (void *)v15;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id obj = v13;
  uint64_t v54 = [obj countByEnumeratingWithState:&v64 objects:v72 count:16];
  if (v54)
  {
    uint64_t v18 = *(void *)v65;
    uint64_t v19 = 1;
    double v20 = (void *)MEMORY[0x263EFFA68];
    uint64_t v50 = *(void *)v65;
    do
    {
      for (uint64_t i = 0; i != v54; ++i)
      {
        if (*(void *)v65 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v22 = *(void *)(*((void *)&v64 + 1) + 8 * i);
        context = (void *)MEMORY[0x223C50570]();
        v63[0] = MEMORY[0x263EF8330];
        v63[1] = 3221225472;
        v63[2] = __97__ACHEarnedInstanceStore__queue_addEarnedInstances_provenance_databaseContext_triggerSync_error___block_invoke_306;
        v63[3] = &unk_264516EE0;
        v63[4] = v22;
        id v23 = objc_msgSend(v53, "hk_filter:", v63);
        if ([(ACHEarnedInstanceStore *)self isUsingNewAwardingSystem])
        {
          uint64_t v61 = 0;
          char v24 = (id *)&v61;
          [(ACHEarnedInstanceStore *)self _queue_client_addEarnedInstancesWithSingleTemplate:v23 provenance:a4 error:&v61];
        }
        else
        {
          uint64_t v62 = 0;
          char v24 = (id *)&v62;
          [(ACHEarnedInstanceStore *)self _queue_daemon_addEarnedInstancesWithSingleTemplate:v23 provenance:a4 databaseContext:v51 error:&v62];
        uint64_t v25 = };
        id v26 = *v24;
        if (v26)
        {
          uint64_t v19 = 0;
        }
        else
        {
          [v20 arrayByAddingObjectsFromArray:v25];
          int64_t v27 = a4;
          uint64_t v28 = a7;
          uint64_t v29 = v19;
          v31 = double v30 = self;

          double v20 = (void *)v31;
          self = v30;
          uint64_t v19 = v29;
          a7 = v28;
          a4 = v27;
          uint64_t v18 = v50;
        }

        if ((v19 & 1) == 0)
        {
          id v32 = v26;
          if (v26)
          {
            if (a7) {
              *a7 = v32;
            }
            else {
              _HKLogDroppedError();
            }
          }
        }
      }
      uint64_t v54 = [obj countByEnumeratingWithState:&v64 objects:v72 count:16];
    }
    while (v54);
  }
  else
  {
    LOBYTE(v19) = 1;
    double v20 = (void *)MEMORY[0x263EFFA68];
  }

  if (v49)
  {
    long long v33 = [(ACHEarnedInstanceStore *)self assertionClient];
    id v60 = 0;
    [v33 invalidateAssertionWithToken:v49 error:&v60];
    id v34 = v60;

    if (v34)
    {
      long long v35 = ACHLogDatabase();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
        -[ACHEarnedInstanceStore _queue_addEarnedInstances:provenance:databaseContext:triggerSync:error:]();
      }
    }
  }
  if (v19)
  {
    char v36 = v19;
    v37 = ACHLogDatabase();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v38 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v20, "count"));
      *(_DWORD *)buf = 138543362;
      v71 = v38;
      _os_log_impl(&dword_21F5DA000, v37, OS_LOG_TYPE_DEFAULT, "Successfully added %{public}@ earned instances to database, adding them to in-memory store.", buf, 0xCu);
    }
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id v39 = v20;
    uint64_t v40 = [v39 countByEnumeratingWithState:&v56 objects:v69 count:16];
    if (v40)
    {
      uint64_t v41 = v40;
      uint64_t v42 = *(void *)v57;
      do
      {
        for (uint64_t j = 0; j != v41; ++j)
        {
          if (*(void *)v57 != v42) {
            objc_enumerationMutation(v39);
          }
          [(ACHEarnedInstanceStore *)self _queue_appendOrInsertEarnedInstanceToInMemoryStore:*(void *)(*((void *)&v56 + 1) + 8 * j)];
        }
        uint64_t v41 = [v39 countByEnumeratingWithState:&v56 objects:v69 count:16];
      }
      while (v41);
    }

    v44 = ACHLogDatabase();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21F5DA000, v44, OS_LOG_TYPE_DEFAULT, "Notifying observers of added earned instances.", buf, 2u);
    }

    [(ACHEarnedInstanceStore *)self _notifyObserversOfAddedEarnedInstances:v39];
    LOBYTE(v19) = v36;
    if (v48 && [v39 count])
    {
      if ([(ACHEarnedInstanceStore *)self isUsingNewAwardingSystem])
      {
        v45 = [(ACHEarnedInstanceStore *)self client];
        [v45 triggerSyncWithCompletion:&__block_literal_global_310];
      }
      else
      {
        v45 = [(ACHEarnedInstanceStore *)self profile];
        v46 = [v45 nanoSyncManager];
        [v46 syncHealthDataWithOptions:0 reason:@"ActivityAchievements Earned Instances added" completion:0];
      }
    }
  }

  return v19 & 1;
}

uint64_t __97__ACHEarnedInstanceStore__queue_addEarnedInstances_provenance_databaseContext_triggerSync_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 templateUniqueName];
}

uint64_t __97__ACHEarnedInstanceStore__queue_addEarnedInstances_provenance_databaseContext_triggerSync_error___block_invoke_306(uint64_t a1, void *a2)
{
  id v3 = [a2 templateUniqueName];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

void __97__ACHEarnedInstanceStore__queue_addEarnedInstances_provenance_databaseContext_triggerSync_error___block_invoke_307(uint64_t a1, char a2, void *a3)
{
  id v4 = a3;
  id v5 = ACHLogSync();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __97__ACHEarnedInstanceStore__queue_addEarnedInstances_provenance_databaseContext_triggerSync_error___block_invoke_307_cold_2(a2, v5);
  }

  if (v4)
  {
    uint64_t v6 = ACHLogSync();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __97__ACHEarnedInstanceStore__queue_addEarnedInstances_provenance_databaseContext_triggerSync_error___block_invoke_307_cold_1();
    }
  }
}

- (id)_queue_client_addEarnedInstancesWithSingleTemplate:(id)a3 provenance:(int64_t)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = [(ACHEarnedInstanceStore *)self earnedInstanceQueue];
  dispatch_assert_queue_V2(v8);

  uint64_t v9 = [v7 anyObject];
  uint64_t v10 = [v9 templateUniqueName];

  id v11 = [(ACHEarnedInstanceStore *)self client];
  id v34 = 0;
  long long v12 = [v11 fetchEarnedInstancesForTemplateUniqueName:v10 error:&v34];
  id v13 = v34;

  if (v13)
  {
    unint64_t v14 = ACHLogDatabase();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[ACHEarnedInstanceStore _queue_client_addEarnedInstancesWithSingleTemplate:provenance:error:]((uint64_t)v10);
    }

    uint64_t v15 = 0;
    if (a5) {
      *a5 = v13;
    }
  }
  else
  {
    id v16 = [MEMORY[0x263EFFA08] setWithArray:v12];
    uint64_t v17 = [(ACHEarnedInstanceStore *)self duplicateUtility];
    id v32 = v16;
    uint64_t v18 = [v16 setByAddingObjectsFromSet:v7];
    long long v33 = [v17 earnedInstancesWithoutDuplicates:v18];

    uint64_t v19 = [(ACHEarnedInstanceStore *)self duplicateUtility];
    double v20 = [v19 earnedInstancesLimitedByEarnLimit:v33];

    uint64_t v31 = [v7 intersectSet:v20];
    uint64_t v21 = objc_msgSend(v16, "hk_minus:", v20);
    uint64_t v22 = [(ACHEarnedInstanceStore *)self client];
    [v31 allObjects];
    id v23 = v7;
    char v24 = v10;
    v26 = uint64_t v25 = v12;
    uint64_t v27 = [v21 allObjects];
    uint64_t v28 = a5;
    uint64_t v29 = (void *)v27;
    uint64_t v15 = [v22 addEarnedInstances:v26 removingEarnedInstances:v27 error:v28];

    long long v12 = v25;
    uint64_t v10 = v24;
    id v7 = v23;
  }
  return v15;
}

- (id)_queue_daemon_addEarnedInstancesWithSingleTemplate:(id)a3 provenance:(int64_t)a4 databaseContext:(id)a5 error:(id *)a6
{
  id v9 = a5;
  id v10 = a3;
  id v11 = [(ACHEarnedInstanceStore *)self earnedInstanceQueue];
  dispatch_assert_queue_V2(v11);

  long long v12 = [v10 anyObject];
  id v13 = [v12 templateUniqueName];

  unint64_t v14 = (void *)MEMORY[0x263EFFA08];
  uint64_t v15 = [(ACHEarnedInstanceStore *)self allEarnedInstances];
  v40[0] = MEMORY[0x263EF8330];
  v40[1] = 3221225472;
  v40[2] = __110__ACHEarnedInstanceStore__queue_daemon_addEarnedInstancesWithSingleTemplate_provenance_databaseContext_error___block_invoke;
  v40[3] = &unk_264516EE0;
  id v16 = v13;
  id v41 = v16;
  uint64_t v17 = objc_msgSend(v15, "hk_filter:", v40);
  uint64_t v18 = [v14 setWithArray:v17];

  uint64_t v19 = [(ACHEarnedInstanceStore *)self duplicateUtility];
  double v20 = [v18 setByAddingObjectsFromSet:v10];
  uint64_t v21 = [v19 earnedInstancesWithoutDuplicates:v20];

  uint64_t v22 = [(ACHEarnedInstanceStore *)self duplicateUtility];
  id v23 = [v22 earnedInstancesLimitedByEarnLimit:v21];

  char v24 = [v10 intersectSet:v23];

  uint64_t v25 = objc_msgSend(v18, "hk_minus:", v23);
  id v26 = [(ACHEarnedInstanceStore *)self entityWrapper];
  id v39 = 0;
  uint64_t v27 = [v26 insertEarnedInstances:v24 provenance:a4 databaseContext:v9 error:&v39];

  id v28 = v39;
  if (v28)
  {
    if (a6)
    {
      id v29 = 0;
      *a6 = v28;
    }
    else
    {
      _HKLogDroppedError();
      id v29 = 0;
    }
  }
  else if ([v25 count])
  {
    id v36 = v16;
    double v30 = [v25 allObjects];
    id v38 = 0;
    BOOL v31 = [(ACHEarnedInstanceStore *)self _queue_daemon_removeEarnedInstances:v30 error:&v38];
    id v32 = v38;

    if (v31)
    {
      id v29 = v27;
    }
    else
    {
      id v33 = v32;
      id v34 = v33;
      if (v33)
      {
        if (a6) {
          *a6 = v33;
        }
        else {
          _HKLogDroppedError();
        }
      }

      id v29 = 0;
    }

    id v16 = v36;
  }
  else
  {
    id v29 = v27;
  }

  return v29;
}

uint64_t __110__ACHEarnedInstanceStore__queue_daemon_addEarnedInstancesWithSingleTemplate_provenance_databaseContext_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 templateUniqueName];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (BOOL)removeEarnedInstances:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(ACHEarnedInstanceStore *)self earnedInstanceQueue];
  dispatch_assert_queue_not_V2(v7);

  uint64_t v23 = 0;
  char v24 = &v23;
  uint64_t v25 = 0x3032000000;
  id v26 = __Block_byref_object_copy__15;
  uint64_t v27 = __Block_byref_object_dispose__15;
  id v28 = 0;
  uint64_t v19 = 0;
  double v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  id v8 = [(ACHEarnedInstanceStore *)self earnedInstanceQueue];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __54__ACHEarnedInstanceStore_removeEarnedInstances_error___block_invoke;
  v15[3] = &unk_264516730;
  v15[4] = self;
  uint64_t v17 = &v19;
  id v9 = v6;
  id v16 = v9;
  uint64_t v18 = &v23;
  dispatch_sync(v8, v15);

  id v10 = (void *)v24[5];
  if (v10)
  {
    id v11 = v10;
    long long v12 = v11;
    if (a4) {
      *a4 = v11;
    }
    else {
      _HKLogDroppedError();
    }
  }
  char v13 = *((unsigned char *)v20 + 24);

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);

  return v13;
}

void __54__ACHEarnedInstanceStore_removeEarnedInstances_error___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_purgeCaches");
  uint64_t v2 = [*(id *)(a1 + 32) client];

  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v8 = *(void *)(v5 + 40);
  id v7 = (id *)(v5 + 40);
  uint64_t v6 = v8;
  if (v2)
  {
    uint64_t v12 = v6;
    id v9 = (id *)&v12;
    char v10 = objc_msgSend(v3, "_queue_client_removeEarnedInstances:error:", v4, &v12);
  }
  else
  {
    uint64_t v13 = v6;
    id v9 = (id *)&v13;
    char v10 = objc_msgSend(v3, "_queue_daemon_removeEarnedInstances:error:", v4, &v13);
  }
  char v11 = v10;
  objc_storeStrong(v7, *v9);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v11;
}

- (BOOL)_queue_client_removeEarnedInstances:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(ACHEarnedInstanceStore *)self earnedInstanceQueue];
  dispatch_assert_queue_V2(v7);

  uint64_t v8 = [(ACHEarnedInstanceStore *)self client];
  int v9 = [v8 removeEarnedInstances:v6 error:a4];

  if (v9)
  {
    char v10 = [(ACHEarnedInstanceStore *)self allEarnedInstances];
    [v10 removeObjectsInArray:v6];

    [(ACHEarnedInstanceStore *)self _notifyObserversOfRemovedEarnedInstances:v6];
  }
  else
  {
    char v11 = ACHLogDatabase();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[ACHEarnedInstanceStore _queue_client_removeEarnedInstances:error:](a4);
    }
  }
  return v9;
}

- (BOOL)_queue_daemon_removeEarnedInstances:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(ACHEarnedInstanceStore *)self earnedInstanceQueue];
  dispatch_assert_queue_V2(v7);

  uint64_t v8 = [(ACHEarnedInstanceStore *)self entityWrapper];
  id v15 = 0;
  int v9 = [v8 removeEarnedInstances:v6 error:&v15];
  id v10 = v15;

  if (v9)
  {
    char v11 = [(ACHEarnedInstanceStore *)self allEarnedInstances];
    [v11 removeObjectsInArray:v6];

    [(ACHEarnedInstanceStore *)self _notifyObserversOfRemovedEarnedInstances:v6];
  }
  else
  {
    uint64_t v12 = ACHLogDatabase();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[ACHEarnedInstanceStore _queue_daemon_removeEarnedInstances:error:]((uint64_t)v10);
    }

    id v13 = v10;
    if (v13)
    {
      if (a4) {
        *a4 = v13;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
  return v9;
}

- (BOOL)removeAllEarnedInstancesWithError:(id *)a3
{
  if ([(ACHEarnedInstanceStore *)self isUsingNewAwardingSystem])
  {
    return [(ACHEarnedInstanceStore *)self _client_removeAllEarnedInstancesWithError:a3];
  }
  else
  {
    return [(ACHEarnedInstanceStore *)self _daemon_removeAllEarnedInstancesWithError:a3];
  }
}

- (BOOL)_client_removeAllEarnedInstancesWithError:(id *)a3
{
  uint64_t v5 = [(ACHEarnedInstanceStore *)self earnedInstanceQueue];
  dispatch_assert_queue_not_V2(v5);

  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__15;
  id v16 = __Block_byref_object_dispose__15;
  id v17 = 0;
  id v6 = [(ACHEarnedInstanceStore *)self earnedInstanceQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__ACHEarnedInstanceStore__client_removeAllEarnedInstancesWithError___block_invoke;
  block[3] = &unk_264516BE0;
  void block[4] = self;
  block[5] = &v18;
  void block[6] = &v12;
  dispatch_sync(v6, block);

  id v7 = (id)v13[5];
  uint64_t v8 = v7;
  if (v7)
  {
    if (a3) {
      *a3 = v7;
    }
    else {
      _HKLogDroppedError();
    }
  }

  char v9 = *((unsigned char *)v19 + 24);
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  return v9;
}

void __68__ACHEarnedInstanceStore__client_removeAllEarnedInstancesWithError___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_purgeCaches");
  uint64_t v2 = [*(id *)(a1 + 32) client];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v3 + 40);
  char v4 = [v2 removeAllEarnedInstancesWithError:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v4;
}

- (BOOL)_daemon_removeAllEarnedInstancesWithError:(id *)a3
{
  uint64_t v5 = [(ACHEarnedInstanceStore *)self allEarnedInstances];
  LOBYTE(a3) = [(ACHEarnedInstanceStore *)self removeEarnedInstances:v5 error:a3];

  return (char)a3;
}

- (BOOL)loadAllEarnedInstancesFromDatabaseIfNecessary
{
  uint64_t v2 = self;
  uint64_t v3 = [(ACHEarnedInstanceStore *)self earnedInstanceQueue];
  dispatch_assert_queue_not_V2(v3);

  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  char v4 = [(ACHEarnedInstanceStore *)v2 earnedInstanceQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __71__ACHEarnedInstanceStore_loadAllEarnedInstancesFromDatabaseIfNecessary__block_invoke;
  v6[3] = &unk_264516620;
  v6[4] = v2;
  v6[5] = &v7;
  dispatch_sync(v4, v6);

  LOBYTE(v2) = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)v2;
}

void __71__ACHEarnedInstanceStore_loadAllEarnedInstancesFromDatabaseIfNecessary__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) initialEarnedInstanceFetchComplete])
  {
    uint64_t v2 = ACHLogDatabase();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_21F5DA000, v2, OS_LOG_TYPE_DEFAULT, "Earn Instances store has already completed initial fetch", v6, 2u);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    char v3 = [*(id *)(a1 + 32) isUsingNewAwardingSystem];
    char v4 = *(void **)(a1 + 32);
    if (v3)
    {
      [v4 setInitialEarnedInstanceFetchComplete:1];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      uint64_t v5 = *(void **)(a1 + 32);
      [v5 _notifyInitialFetchComplete];
    }
    else
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = objc_msgSend(v4, "_queue_daemon_loadAllEarnedInstancesFromDatabaseIfNecessary");
    }
  }
}

- (BOOL)_queue_daemon_loadAllEarnedInstancesFromDatabaseIfNecessary
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  char v3 = [(ACHEarnedInstanceStore *)self earnedInstanceQueue];
  dispatch_assert_queue_V2(v3);

  char v4 = [(ACHEarnedInstanceStore *)self entityWrapper];
  id v14 = 0;
  uint64_t v5 = [v4 allEarnedInstancesWithError:&v14];
  id v6 = v14;

  if (v6)
  {
    uint64_t v7 = ACHLogDatabase();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[ACHEarnedInstanceStore _queue_daemon_loadAllEarnedInstancesFromDatabaseIfNecessary]();
    }
  }
  else
  {
    if (v5) {
      id v8 = (id)[v5 mutableCopy];
    }
    else {
      id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
    }
    uint64_t v9 = v8;
    [(ACHEarnedInstanceStore *)self setAllEarnedInstances:v8];

    [(ACHEarnedInstanceStore *)self setInitialEarnedInstanceFetchComplete:1];
    +[ACHEarnedInstanceEntity setJournalEntryAppliedObserver:self];
    char v10 = ACHLogDatabase();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      char v11 = [(ACHEarnedInstanceStore *)self allEarnedInstances];
      uint64_t v12 = [v11 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v16 = v12;
      _os_log_impl(&dword_21F5DA000, v10, OS_LOG_TYPE_DEFAULT, "Initial fetch of earned instances completed, %lu instances; notifying observers",
        buf,
        0xCu);
    }
    [(ACHEarnedInstanceStore *)self _notifyInitialFetchComplete];
  }

  return v6 == 0;
}

- (void)_notifyInitialFetchComplete
{
  char v3 = [(ACHEarnedInstanceStore *)self observerQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__ACHEarnedInstanceStore__notifyInitialFetchComplete__block_invoke;
  block[3] = &unk_264515DB8;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __53__ACHEarnedInstanceStore__notifyInitialFetchComplete__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "observers", 0);
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
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          [v7 earnedInstanceStoreDidFinishInitialFetch:*(void *)(a1 + 32)];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)_notifyObserversOfAddedEarnedInstances:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ACHEarnedInstanceStore *)self observerQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __65__ACHEarnedInstanceStore__notifyObserversOfAddedEarnedInstances___block_invoke;
  v7[3] = &unk_264515DE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __65__ACHEarnedInstanceStore__notifyObserversOfAddedEarnedInstances___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "observers", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) earnedInstanceStore:*(void *)(a1 + 32) didAddNewEarnedInstances:*(void *)(a1 + 40)];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)_notifyObserversOfSync
{
  uint64_t v3 = [(ACHEarnedInstanceStore *)self observerQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__ACHEarnedInstanceStore__notifyObserversOfSync__block_invoke;
  block[3] = &unk_264515DB8;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __48__ACHEarnedInstanceStore__notifyObserversOfSync__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "observers", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) earnedInstanceStoreDidReceiveSyncNotification:*(void *)(a1 + 32)];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)_notifyObserversOfRemovedEarnedInstances:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ACHEarnedInstanceStore *)self observerQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __67__ACHEarnedInstanceStore__notifyObserversOfRemovedEarnedInstances___block_invoke;
  v7[3] = &unk_264515DE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __67__ACHEarnedInstanceStore__notifyObserversOfRemovedEarnedInstances___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "observers", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) earnedInstanceStore:*(void *)(a1 + 32) didRemoveEarnedInstances:*(void *)(a1 + 40)];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ACHEarnedInstanceStore *)self observerQueue];
  dispatch_assert_queue_not_V2(v5);

  uint64_t v6 = [(ACHEarnedInstanceStore *)self observerQueue];
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  long long v10 = __38__ACHEarnedInstanceStore_addObserver___block_invoke;
  long long v11 = &unk_264515DE0;
  uint64_t v12 = self;
  id v7 = v4;
  id v13 = v7;
  dispatch_sync(v6, &v8);

  if ([(ACHEarnedInstanceStore *)self initialEarnedInstanceFetchComplete]&& (objc_opt_respondsToSelector() & 1) != 0)
  {
    [v7 earnedInstanceStoreDidFinishInitialFetch:self];
  }
}

void __38__ACHEarnedInstanceStore_addObserver___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) observers];
  [v2 addObject:*(void *)(a1 + 40)];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ACHEarnedInstanceStore *)self observerQueue];
  dispatch_assert_queue_not_V2(v5);

  uint64_t v6 = [(ACHEarnedInstanceStore *)self observerQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __41__ACHEarnedInstanceStore_removeObserver___block_invoke;
  v8[3] = &unk_264515DE0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_sync(v6, v8);
}

void __41__ACHEarnedInstanceStore_removeObserver___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) observers];
  [v2 removeObject:*(void *)(a1 + 40)];
}

- (BOOL)isUsingNewAwardingSystem
{
  return self->_isUsingNewAwardingSystem;
}

- (ACHAwardsClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
}

- (ACHDatabaseAssertionClient)assertionClient
{
  return self->_assertionClient;
}

- (void)setAssertionClient:(id)a3
{
}

- (HDProfile)profile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  return (HDProfile *)WeakRetained;
}

- (void)setProfile:(id)a3
{
}

- (ACHEarnedInstanceEntityWrapper)entityWrapper
{
  return self->_entityWrapper;
}

- (void)setEntityWrapper:(id)a3
{
}

- (ACHEarnedInstanceDuplicateUtility)duplicateUtility
{
  return self->_duplicateUtility;
}

- (void)setDuplicateUtility:(id)a3
{
}

- (OS_dispatch_queue)earnedInstanceQueue
{
  return self->_earnedInstanceQueue;
}

- (void)setEarnedInstanceQueue:(id)a3
{
}

- (NSMutableArray)allEarnedInstances
{
  return self->_allEarnedInstances;
}

- (void)setAllEarnedInstances:(id)a3
{
}

- (BOOL)initialEarnedInstanceFetchComplete
{
  return self->_initialEarnedInstanceFetchComplete;
}

- (void)setInitialEarnedInstanceFetchComplete:(BOOL)a3
{
  self->_initialEarnedInstanceFetchComplete = a3;
}

- (OS_dispatch_queue)observerQueue
{
  return self->_observerQueue;
}

- (void)setObserverQueue:(id)a3
{
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (unsigned)device
{
  return self->_device;
}

- (void)setDevice:(unsigned __int8)a3
{
  self->_device = a3;
}

- (int)syncedEarnedInstancesToken
{
  return self->_syncedEarnedInstancesToken;
}

- (void)setSyncedEarnedInstancesToken:(int)a3
{
  self->_syncedEarnedInstancesToken = a3;
}

- (BOOL)needsUpdateWhenProtectedDataAvailable
{
  return self->_needsUpdateWhenProtectedDataAvailable;
}

- (void)setNeedsUpdateWhenProtectedDataAvailable:(BOOL)a3
{
  self->_needsUpdateWhenProtectedDataAvailable = a3;
}

- (NSCache)earnedInstancesForTemplateUniqueNameCache
{
  return self->_earnedInstancesForTemplateUniqueNameCache;
}

- (void)setEarnedInstancesForTemplateUniqueNameCache:(id)a3
{
}

- (NSCache)earnedInstancesForEarnedDateComponentsCache
{
  return self->_earnedInstancesForEarnedDateComponentsCache;
}

- (void)setEarnedInstancesForEarnedDateComponentsCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_earnedInstancesForEarnedDateComponentsCache, 0);
  objc_storeStrong((id *)&self->_earnedInstancesForTemplateUniqueNameCache, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_observerQueue, 0);
  objc_storeStrong((id *)&self->_allEarnedInstances, 0);
  objc_storeStrong((id *)&self->_earnedInstanceQueue, 0);
  objc_storeStrong((id *)&self->_duplicateUtility, 0);
  objc_storeStrong((id *)&self->_entityWrapper, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_assertionClient, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

void __89__ACHEarnedInstanceStore_earnedInstanceEntityDidReceiveSyncedEarnedInstances_provenance___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_21F5DA000, v0, v1, "Failed to insert earned instances from sync with error: %{public}@, earned instances: %@");
}

- (void)_client_earnedInstances
{
}

- (void)_client_earnedInstancesForTemplateUniqueName:error:.cold.1()
{
  OUTLINED_FUNCTION_2_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_1_0(&dword_21F5DA000, v0, v1, "Error fetching earned instances for unique name %{public}@: %{public}@");
}

- (void)earnedInstancesForEarnedDateComponents:error:.cold.1()
{
  OUTLINED_FUNCTION_2_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_1_0(&dword_21F5DA000, v0, v1, "Error fetching earned instances for earned date components %{public}@: %{public}@");
}

- (void)mostRecentEarnedInstanceForTemplateUniqueName:error:.cold.1()
{
  OUTLINED_FUNCTION_2_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_1_0(&dword_21F5DA000, v0, v1, "Error fetching most recent earned instance for unique name %{public}@: %{public}@");
}

- (void)mostRecentEarnedInstancesForTemplateUniqueNames:error:.cold.1()
{
  OUTLINED_FUNCTION_2_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_1_0(&dword_21F5DA000, v0, v1, "Error fetching most recent earned instances for %{public}@: %{public}@");
}

- (void)countOfEarnedInstancesForTemplateUniqueName:error:.cold.1()
{
  OUTLINED_FUNCTION_2_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_1_0(&dword_21F5DA000, v0, v1, "Error counting earned instances for unique name %{public}@: %{public}@");
}

- (void)countOfEarnedInstancesForTemplateUniqueNames:error:.cold.1()
{
  OUTLINED_FUNCTION_2_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_1_0(&dword_21F5DA000, v0, v1, "Error counting earned instances for unique names %{public}@: %{public}@");
}

- (void)_queue_addEarnedInstances:provenance:databaseContext:triggerSync:error:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21F5DA000, v0, v1, "Unable to invalidate assertion: %@", v2, v3, v4, v5, v6);
}

- (void)_queue_addEarnedInstances:provenance:databaseContext:triggerSync:error:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21F5DA000, v0, v1, "Unable to acquire DB assertion: %@", v2, v3, v4, v5, v6);
}

void __97__ACHEarnedInstanceStore__queue_addEarnedInstances_provenance_databaseContext_triggerSync_error___block_invoke_307_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21F5DA000, v0, v1, "Error triggering sync for earned instances: %@", v2, v3, v4, v5, v6);
}

void __97__ACHEarnedInstanceStore__queue_addEarnedInstances_provenance_databaseContext_triggerSync_error___block_invoke_307_cold_2(char a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = @"NO";
  if (a1) {
    uint64_t v2 = @"YES";
  }
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_21F5DA000, a2, OS_LOG_TYPE_DEBUG, "Triggered sync for earned instances, success: %@", (uint8_t *)&v3, 0xCu);
}

- (void)_queue_client_addEarnedInstancesWithSingleTemplate:(uint64_t)a1 provenance:error:.cold.1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_21F5DA000, v1, v2, "Error looking up existing earned instances for (%@): %@", (void)v3, DWORD2(v3));
}

- (void)_queue_client_removeEarnedInstances:(void *)a1 error:.cold.1(void *a1)
{
  LODWORD(v3) = 138543618;
  *(void *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_21F5DA000, v1, v2, "Failed to remove earned instances with error %{public}@, earned instances: %@", (void)v3, DWORD2(v3));
}

- (void)_queue_daemon_removeEarnedInstances:(uint64_t)a1 error:.cold.1(uint64_t a1)
{
  LODWORD(v3) = 138543618;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_21F5DA000, v1, v2, "Failed to remove earned instances with error %{public}@, earned instances: %@", (void)v3, DWORD2(v3));
}

- (void)_queue_daemon_loadAllEarnedInstancesFromDatabaseIfNecessary
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21F5DA000, v0, v1, "Initial fetch of earned instances failed with error %{public}@", v2, v3, v4, v5, v6);
}

@end