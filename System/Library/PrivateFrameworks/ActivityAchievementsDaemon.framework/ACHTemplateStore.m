@interface ACHTemplateStore
- (ACHAwardsClient)client;
- (ACHDatabaseAssertionClient)databaseAssertionClient;
- (ACHTemplateEntityWrapper)entityWrapper;
- (ACHTemplateStore)initWithClient:(id)a3 assertionClient:(id)a4 device:(unsigned __int8)a5;
- (ACHTemplateStore)initWithProfile:(id)a3 entityWrapper:(id)a4 device:(unsigned __int8)a5;
- (BOOL)_client_loadAllTemplatesFromDatabaseIfNecessary;
- (BOOL)_daemon_loadAllTemplatesFromDatabaseIfNecessary;
- (BOOL)_queue_addTemplates:(id)a3 provenance:(int64_t)a4 databaseContext:(id)a5 triggerSync:(BOOL)a6 error:(id *)a7;
- (BOOL)_queue_client_addTemplatesToDatabase:(id)a3 error:(id *)a4;
- (BOOL)_queue_client_loadAllTemplatesFromDatabaseIfNecessary;
- (BOOL)_queue_client_removeTemplatesFromDatabase:(id)a3 error:(id *)a4;
- (BOOL)_queue_daemon_addTemplatesToDatabase:(id)a3 provenance:(int64_t)a4 databaseContext:(id)a5 error:(id *)a6;
- (BOOL)_queue_daemon_removeTemplatesFromDatabase:(id)a3 error:(id *)a4;
- (BOOL)addTemplates:(id)a3 databaseContext:(id)a4 error:(id *)a5;
- (BOOL)initialFetchComplete;
- (BOOL)loadAllTemplatesFromDatabaseIfNecessary;
- (BOOL)needsUpdateWhenProtectedDataAvailable;
- (BOOL)removeAllTemplates:(id *)a3;
- (BOOL)removeTemplates:(id)a3 error:(id *)a4;
- (BOOL)removeTemplatesForSource:(id)a3 error:(id *)a4;
- (BOOL)removeTemplatesWithUniqueNames:(id)a3 error:(id *)a4;
- (HDProfile)profile;
- (NSArray)allTemplates;
- (NSDictionary)templatesReadyToAdd;
- (NSHashTable)observers;
- (NSMutableDictionary)templatesByKey;
- (NSMutableDictionary)templatesBySource;
- (NSMutableDictionary)templatesByUniqueName;
- (NSMutableSet)templates;
- (OS_dispatch_queue)notificationQueue;
- (OS_dispatch_queue)synchronizationQueue;
- (id)_queue_orphanedTemplatesWithFetchedTemplates:(id)a3;
- (id)_queue_templatesFilteredForDuplicates:(id)a3;
- (id)_templatesWithUniqueNames:(id)a3;
- (id)availableTemplatesForDateComponents:(id)a3 countryCode:(id)a4;
- (id)templateForTemplateKey:(unint64_t)a3;
- (id)templateForUniqueName:(id)a3;
- (id)templatesForSource:(id)a3;
- (int)protectedDataToken;
- (int)syncedTemplatesToken;
- (unsigned)device;
- (void)_addTemplatesToLocalCollections:(id)a3;
- (void)_notifyObserversOfInitialFetchCompletion;
- (void)_notifyObserversOfNewTemplates:(id)a3;
- (void)_notifyObserversOfRemovedTemplates:(id)a3;
- (void)_queue_client_updateTemplatesFromDatabase;
- (void)_queue_protectedDataAvailabilityChanged:(BOOL)a3;
- (void)_removeTemplatesFromLocalCollections:(id)a3;
- (void)addObserver:(id)a3;
- (void)addTemplates:(id)a3;
- (void)daemonReady:(id)a3;
- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4;
- (void)dealloc;
- (void)removeObserver:(id)a3;
- (void)setClient:(id)a3;
- (void)setDatabaseAssertionClient:(id)a3;
- (void)setDevice:(unsigned __int8)a3;
- (void)setEntityWrapper:(id)a3;
- (void)setInitialFetchComplete:(BOOL)a3;
- (void)setNeedsUpdateWhenProtectedDataAvailable:(BOOL)a3;
- (void)setNotificationQueue:(id)a3;
- (void)setObservers:(id)a3;
- (void)setProfile:(id)a3;
- (void)setProtectedDataToken:(int)a3;
- (void)setSyncedTemplatesToken:(int)a3;
- (void)setSynchronizationQueue:(id)a3;
- (void)setTemplates:(id)a3;
- (void)setTemplatesByKey:(id)a3;
- (void)setTemplatesBySource:(id)a3;
- (void)setTemplatesByUniqueName:(id)a3;
- (void)setTemplatesReadyToAdd:(id)a3;
- (void)templateEntityDidReceiveSyncedTemplates:(id)a3 provenance:(int64_t)a4;
@end

@implementation ACHTemplateStore

- (ACHTemplateStore)initWithClient:(id)a3 assertionClient:(id)a4 device:(unsigned __int8)a5
{
  id v9 = a3;
  id v10 = a4;
  v38.receiver = self;
  v38.super_class = (Class)ACHTemplateStore;
  v11 = [(ACHTemplateStore *)&v38 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_client, a3);
    objc_storeStrong((id *)&v12->_databaseAssertionClient, a4);
    v12->_device = a5;
    v13 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    templates = v12->_templates;
    v12->_templates = v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    templatesByUniqueName = v12->_templatesByUniqueName;
    v12->_templatesByUniqueName = v15;

    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    templatesByKey = v12->_templatesByKey;
    v12->_templatesByKey = v17;

    v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    templatesBySource = v12->_templatesBySource;
    v12->_templatesBySource = v19;

    templatesReadyToAdd = v12->_templatesReadyToAdd;
    v12->_templatesReadyToAdd = (NSDictionary *)MEMORY[0x263EFFA78];

    uint64_t v22 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    observers = v12->_observers;
    v12->_observers = (NSHashTable *)v22;

    uint64_t v24 = HKCreateSerialDispatchQueue();
    notificationQueue = v12->_notificationQueue;
    v12->_notificationQueue = (OS_dispatch_queue *)v24;

    uint64_t v26 = HKCreateSerialDispatchQueue();
    synchronizationQueue = v12->_synchronizationQueue;
    v12->_synchronizationQueue = (OS_dispatch_queue *)v26;

    objc_initWeak(&location, v12);
    v28 = (const char *)[(id)*MEMORY[0x263F235A8] UTF8String];
    v29 = v12->_synchronizationQueue;
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __58__ACHTemplateStore_initWithClient_assertionClient_device___block_invoke;
    handler[3] = &unk_264515D40;
    objc_copyWeak(&v36, &location);
    notify_register_dispatch(v28, &v12->_protectedDataToken, v29, handler);
    v30 = (const char *)[(id)*MEMORY[0x263F234A8] UTF8String];
    v31 = v12->_synchronizationQueue;
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __58__ACHTemplateStore_initWithClient_assertionClient_device___block_invoke_289;
    v33[3] = &unk_264515D40;
    objc_copyWeak(&v34, &location);
    notify_register_dispatch(v30, &v12->_syncedTemplatesToken, v31, v33);
    objc_destroyWeak(&v34);
    objc_destroyWeak(&v36);
    objc_destroyWeak(&location);
  }

  return v12;
}

void __58__ACHTemplateStore_initWithClient_assertionClient_device___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = [WeakRetained client];
  uint64_t v4 = [v3 isProtectedDataAvailable];

  v5 = ACHLogTemplates();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = v4;
    _os_log_impl(&dword_21F5DA000, v5, OS_LOG_TYPE_DEFAULT, "Template store detected received notification of a change in protected data availability: %d", (uint8_t *)v8, 8u);
  }

  id v6 = objc_loadWeakRetained(v1);
  objc_msgSend(v6, "_queue_protectedDataAvailabilityChanged:", v4);

  if (v4)
  {
    id v7 = objc_loadWeakRetained(v1);
    objc_msgSend(v7, "_queue_client_loadAllTemplatesFromDatabaseIfNecessary");
  }
}

void __58__ACHTemplateStore_initWithClient_assertionClient_device___block_invoke_289(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_client_updateTemplatesFromDatabase");
}

- (void)dealloc
{
  if (notify_is_valid_token(self->_protectedDataToken)) {
    notify_cancel(self->_protectedDataToken);
  }
  if (notify_is_valid_token(self->_syncedTemplatesToken)) {
    notify_cancel(self->_syncedTemplatesToken);
  }
  v3.receiver = self;
  v3.super_class = (Class)ACHTemplateStore;
  [(ACHTemplateStore *)&v3 dealloc];
}

- (ACHTemplateStore)initWithProfile:(id)a3 entityWrapper:(id)a4 device:(unsigned __int8)a5
{
  id v8 = a3;
  id v9 = a4;
  v28.receiver = self;
  v28.super_class = (Class)ACHTemplateStore;
  id v10 = [(ACHTemplateStore *)&v28 init];
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_profile, v8);
    objc_storeStrong((id *)&v11->_entityWrapper, a4);
    [(ACHTemplateEntityWrapper *)v11->_entityWrapper setSyncedTemplatesObserver:v11];
    v11->_device = a5;
    v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    templates = v11->_templates;
    v11->_templates = v12;

    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    templatesByUniqueName = v11->_templatesByUniqueName;
    v11->_templatesByUniqueName = v14;

    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    templatesByKey = v11->_templatesByKey;
    v11->_templatesByKey = v16;

    templatesReadyToAdd = v11->_templatesReadyToAdd;
    v11->_templatesReadyToAdd = (NSDictionary *)MEMORY[0x263EFFA78];

    uint64_t v19 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    observers = v11->_observers;
    v11->_observers = (NSHashTable *)v19;

    uint64_t v21 = HKCreateSerialDispatchQueue();
    notificationQueue = v11->_notificationQueue;
    v11->_notificationQueue = (OS_dispatch_queue *)v21;

    uint64_t v23 = HKCreateSerialDispatchQueue();
    synchronizationQueue = v11->_synchronizationQueue;
    v11->_synchronizationQueue = (OS_dispatch_queue *)v23;

    id WeakRetained = objc_loadWeakRetained((id *)&v11->_profile);
    uint64_t v26 = [WeakRetained daemon];
    [v26 registerForDaemonReady:v11];
  }
  return v11;
}

- (void)daemonReady:(id)a3
{
  id v5 = [(ACHTemplateStore *)self profile];
  uint64_t v4 = [v5 database];
  [v4 addProtectedDataObserver:self];
}

- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(ACHTemplateStore *)self synchronizationQueue];
  dispatch_assert_queue_not_V2(v6);

  if (v4)
  {
    id v7 = [(ACHTemplateStore *)self synchronizationQueue];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    _DWORD v8[2] = __61__ACHTemplateStore_database_protectedDataDidBecomeAvailable___block_invoke;
    v8[3] = &unk_264516530;
    v8[4] = self;
    char v9 = 1;
    dispatch_sync(v7, v8);
  }
}

uint64_t __61__ACHTemplateStore_database_protectedDataDidBecomeAvailable___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_protectedDataAvailabilityChanged:", *(unsigned __int8 *)(a1 + 40));
}

- (void)_queue_protectedDataAvailabilityChanged:(BOOL)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if ([(ACHTemplateStore *)self needsUpdateWhenProtectedDataAvailable]) {
    [(ACHTemplateStore *)self _queue_client_updateTemplatesFromDatabase];
  }
  BOOL v4 = [(ACHTemplateStore *)self templatesReadyToAdd];
  id v5 = (void *)[v4 copy];

  [(ACHTemplateStore *)self setTemplatesReadyToAdd:MEMORY[0x263EFFA78]];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v20;
    *(void *)&long long v8 = 138543362;
    long long v17 = v8;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v6);
        }
        v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        v13 = objc_msgSend(v6, "objectForKeyedSubscript:", v12, v17);
        uint64_t v14 = [v12 longLongValue];
        id v18 = 0;
        [(ACHTemplateStore *)self _queue_addTemplates:v13 provenance:v14 databaseContext:0 triggerSync:1 error:&v18];
        id v15 = v18;
        if (v15)
        {
          v16 = ACHLogTemplates();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v17;
            id v24 = v15;
            _os_log_error_impl(&dword_21F5DA000, v16, OS_LOG_TYPE_ERROR, "Error adding templates: %{public}@", buf, 0xCu);
          }
        }
      }
      uint64_t v9 = [v6 countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v9);
  }
}

- (void)templateEntityDidReceiveSyncedTemplates:(id)a3 provenance:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(ACHTemplateStore *)self synchronizationQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __71__ACHTemplateStore_templateEntityDidReceiveSyncedTemplates_provenance___block_invoke;
  block[3] = &unk_264516558;
  block[4] = self;
  id v10 = v6;
  int64_t v11 = a4;
  id v8 = v6;
  dispatch_sync(v7, block);
}

void __71__ACHTemplateStore_templateEntityDidReceiveSyncedTemplates_provenance___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v1 = a1[5];
  uint64_t v3 = a1[6];
  id v6 = 0;
  objc_msgSend(v2, "_queue_addTemplates:provenance:databaseContext:triggerSync:error:", v1, v3, 0, 0, &v6);
  id v4 = v6;
  if (v4)
  {
    id v5 = ACHLogTemplates();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __71__ACHTemplateStore_templateEntityDidReceiveSyncedTemplates_provenance___block_invoke_cold_1();
    }
  }
}

- (NSArray)allTemplates
{
  uint64_t v3 = [(ACHTemplateStore *)self synchronizationQueue];
  dispatch_assert_queue_not_V2(v3);

  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  int64_t v11 = __Block_byref_object_copy__3;
  v12 = __Block_byref_object_dispose__3;
  id v13 = 0;
  id v4 = [(ACHTemplateStore *)self synchronizationQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __32__ACHTemplateStore_allTemplates__block_invoke;
  v7[3] = &unk_264516580;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSArray *)v5;
}

void __32__ACHTemplateStore_allTemplates__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) templates];
  uint64_t v2 = ACHSortedTemplates();
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)templateForUniqueName:(id)a3
{
  id v4 = a3;
  id v5 = [(ACHTemplateStore *)self synchronizationQueue];
  dispatch_assert_queue_not_V2(v5);

  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__3;
  long long v17 = __Block_byref_object_dispose__3;
  id v18 = 0;
  id v6 = [(ACHTemplateStore *)self synchronizationQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__ACHTemplateStore_templateForUniqueName___block_invoke;
  block[3] = &unk_2645165A8;
  id v11 = v4;
  v12 = &v13;
  block[4] = self;
  id v7 = v4;
  dispatch_sync(v6, block);

  id v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __42__ACHTemplateStore_templateForUniqueName___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) templatesByUniqueName];
  uint64_t v2 = [v5 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)_templatesWithUniqueNames:(id)a3
{
  id v4 = a3;
  id v5 = [(ACHTemplateStore *)self synchronizationQueue];
  dispatch_assert_queue_not_V2(v5);

  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v7 = [(ACHTemplateStore *)self synchronizationQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__ACHTemplateStore__templatesWithUniqueNames___block_invoke;
  block[3] = &unk_264516100;
  id v13 = v4;
  uint64_t v14 = self;
  id v15 = v6;
  id v8 = v6;
  id v9 = v4;
  dispatch_sync(v7, block);

  uint64_t v10 = (void *)[v8 copy];
  return v10;
}

void __46__ACHTemplateStore__templatesWithUniqueNames___block_invoke(id *a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = a1[4];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v10 + 1) + 8 * v6);
        id v8 = objc_msgSend(a1[5], "templatesByUniqueName", (void)v10);
        id v9 = [v8 objectForKeyedSubscript:v7];

        if (v9) {
          [a1[6] addObject:v9];
        }

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

- (id)templateForTemplateKey:(unint64_t)a3
{
  uint64_t v5 = [(ACHTemplateStore *)self synchronizationQueue];
  dispatch_assert_queue_not_V2(v5);

  uint64_t v10 = 0;
  long long v11 = &v10;
  uint64_t v12 = 0x3032000000;
  long long v13 = __Block_byref_object_copy__3;
  uint64_t v14 = __Block_byref_object_dispose__3;
  id v15 = 0;
  uint64_t v6 = [(ACHTemplateStore *)self synchronizationQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__ACHTemplateStore_templateForTemplateKey___block_invoke;
  block[3] = &unk_2645165D0;
  void block[4] = self;
  void block[5] = &v10;
  block[6] = a3;
  dispatch_sync(v6, block);

  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __43__ACHTemplateStore_templateForTemplateKey___block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) templatesByKey];
  id v2 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 48)];
  uint64_t v3 = [v6 objectForKeyedSubscript:v2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)templatesForSource:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ACHTemplateStore *)self synchronizationQueue];
  dispatch_assert_queue_not_V2(v5);

  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__3;
  long long v17 = __Block_byref_object_dispose__3;
  id v18 = 0;
  id v6 = [(ACHTemplateStore *)self synchronizationQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__ACHTemplateStore_templatesForSource___block_invoke;
  block[3] = &unk_2645165A8;
  id v11 = v4;
  uint64_t v12 = &v13;
  void block[4] = self;
  id v7 = v4;
  dispatch_sync(v6, block);

  id v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __39__ACHTemplateStore_templatesForSource___block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) templatesBySource];
  id v2 = [v6 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = [v2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)availableTemplatesForDateComponents:(id)a3 countryCode:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v18 = 0;
  long long v19 = &v18;
  uint64_t v20 = 0x3032000000;
  long long v21 = __Block_byref_object_copy__3;
  long long v22 = __Block_byref_object_dispose__3;
  id v23 = 0;
  id v8 = [(ACHTemplateStore *)self synchronizationQueue];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __68__ACHTemplateStore_availableTemplatesForDateComponents_countryCode___block_invoke;
  v13[3] = &unk_2645165F8;
  id v14 = v6;
  id v15 = v7;
  v16 = self;
  long long v17 = &v18;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, v13);

  id v11 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v11;
}

void __68__ACHTemplateStore_availableTemplatesForDateComponents_countryCode___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 40);
  id v8 = [*(id *)(a1 + 48) templates];
  uint64_t v4 = ACHSortedTemplates();
  uint64_t v5 = ACHAvailableTemplatesForDateComponentsAndCountryCodeInTemplates(v2, v3, v4);
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (BOOL)loadAllTemplatesFromDatabaseIfNecessary
{
  uint64_t v3 = [(ACHTemplateStore *)self client];

  if (v3)
  {
    return [(ACHTemplateStore *)self _client_loadAllTemplatesFromDatabaseIfNecessary];
  }
  else
  {
    return [(ACHTemplateStore *)self _daemon_loadAllTemplatesFromDatabaseIfNecessary];
  }
}

- (BOOL)_client_loadAllTemplatesFromDatabaseIfNecessary
{
  id v2 = self;
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  uint64_t v3 = [(ACHTemplateStore *)self synchronizationQueue];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __67__ACHTemplateStore__client_loadAllTemplatesFromDatabaseIfNecessary__block_invoke;
  v5[3] = &unk_264516580;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __67__ACHTemplateStore__client_loadAllTemplatesFromDatabaseIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_queue_client_loadAllTemplatesFromDatabaseIfNecessary");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)_queue_client_loadAllTemplatesFromDatabaseIfNecessary
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if ([(ACHTemplateStore *)self initialFetchComplete])
  {
    uint64_t v3 = ACHLogDatabase();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21F5DA000, v3, OS_LOG_TYPE_DEFAULT, "Template Store has already completed initial fetch", buf, 2u);
    }
    BOOL v4 = 1;
  }
  else
  {
    uint64_t v5 = [(ACHTemplateStore *)self client];
    id v11 = 0;
    uint64_t v6 = [v5 fetchAllTemplatesWithError:&v11];
    uint64_t v3 = v11;

    if ([v6 count]) {
      [(ACHTemplateStore *)self _addTemplatesToLocalCollections:v6];
    }
    BOOL v4 = v3 == 0;
    id v7 = ACHLogDatabase();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v8)
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v13 = (uint64_t)v3;
        _os_log_impl(&dword_21F5DA000, v7, OS_LOG_TYPE_DEFAULT, "Error fetching templates: %@", buf, 0xCu);
      }
    }
    else
    {
      if (v8)
      {
        uint64_t v9 = [v6 count];
        *(_DWORD *)buf = 134217984;
        uint64_t v13 = v9;
        _os_log_impl(&dword_21F5DA000, v7, OS_LOG_TYPE_DEFAULT, "Initial fetch returned %lu templates, notifying observers of new templates and initial fetch complete", buf, 0xCu);
      }

      [(ACHTemplateStore *)self setInitialFetchComplete:1];
      [(ACHTemplateStore *)self _notifyObserversOfInitialFetchCompletion];
    }
  }
  return v4;
}

- (BOOL)_daemon_loadAllTemplatesFromDatabaseIfNecessary
{
  id v2 = self;
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  uint64_t v3 = [(ACHTemplateStore *)self synchronizationQueue];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __67__ACHTemplateStore__daemon_loadAllTemplatesFromDatabaseIfNecessary__block_invoke;
  v5[3] = &unk_264516620;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __67__ACHTemplateStore__daemon_loadAllTemplatesFromDatabaseIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) initialFetchComplete])
  {
    id v2 = ACHLogDatabase();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21F5DA000, v2, OS_LOG_TYPE_DEFAULT, "Template Store has already completed initial fetch", buf, 2u);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    uint64_t v3 = [*(id *)(a1 + 32) entityWrapper];
    id v9 = 0;
    BOOL v4 = [v3 allTemplatesWithError:&v9];
    id v5 = v9;

    uint64_t v6 = ACHLogDatabase();
    id v7 = v6;
    if (v5 || !v4)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __67__ACHTemplateStore__daemon_loadAllTemplatesFromDatabaseIfNecessary__block_invoke_cold_1();
      }
    }
    else
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = [v4 count];
        *(_DWORD *)buf = 134217984;
        uint64_t v11 = v8;
        _os_log_impl(&dword_21F5DA000, v7, OS_LOG_TYPE_DEFAULT, "Initial fetch returned %lu templates, notifying observers of new templates and initial fetch complete", buf, 0xCu);
      }

      [*(id *)(a1 + 32) setInitialFetchComplete:1];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      [*(id *)(a1 + 32) _addTemplatesToLocalCollections:v4];
      [*(id *)(a1 + 32) _notifyObserversOfInitialFetchCompletion];
    }
  }
}

- (void)_queue_client_updateTemplatesFromDatabase
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21F5DA000, v0, v1, "Error fetching templates: %@\nWill run again when protected data becomes available.", v2, v3, v4, v5, v6);
}

- (id)_queue_templatesFilteredForDuplicates:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x263F08A98];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  _DWORD v8[2] = __58__ACHTemplateStore__queue_templatesFilteredForDuplicates___block_invoke;
  v8[3] = &unk_264516648;
  v8[4] = self;
  id v4 = a3;
  uint64_t v5 = [v3 predicateWithBlock:v8];
  uint8_t v6 = [v4 filteredArrayUsingPredicate:v5];

  return v6;
}

BOOL __58__ACHTemplateStore__queue_templatesFilteredForDuplicates___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) templatesByUniqueName];
  uint64_t v5 = [v3 uniqueName];
  uint8_t v6 = [v4 objectForKeyedSubscript:v5];

  if (v6)
  {
    unint64_t v7 = [v6 version];
    BOOL v8 = v7 < [v3 version];
  }
  else
  {
    BOOL v8 = 1;
  }

  return v8;
}

- (id)_queue_orphanedTemplatesWithFetchedTemplates:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v12 = [v11 uniqueName];
        [v5 setObject:v11 forKeyedSubscript:v12];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v8);
  }

  uint64_t v13 = [(ACHTemplateStore *)self templates];
  uint64_t v14 = [v13 allObjects];
  id v15 = (void *)MEMORY[0x263F08A98];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __65__ACHTemplateStore__queue_orphanedTemplatesWithFetchedTemplates___block_invoke;
  v20[3] = &unk_264516648;
  id v21 = v5;
  id v16 = v5;
  long long v17 = [v15 predicateWithBlock:v20];
  uint64_t v18 = [v14 filteredArrayUsingPredicate:v17];

  return v18;
}

BOOL __65__ACHTemplateStore__queue_orphanedTemplatesWithFetchedTemplates___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [a2 uniqueName];
  id v4 = [v2 objectForKeyedSubscript:v3];

  return v4 == 0;
}

- (void)addTemplates:(id)a3
{
  id v4 = a3;
  id v5 = [(ACHTemplateStore *)self synchronizationQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __33__ACHTemplateStore_addTemplates___block_invoke;
  v7[3] = &unk_264515DE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __33__ACHTemplateStore_addTemplates___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  id v5 = 0;
  objc_msgSend(v2, "_queue_addTemplates:provenance:databaseContext:triggerSync:error:", v1, 0, 0, 1, &v5);
  id v3 = v5;
  if (v3)
  {
    id v4 = ACHLogTemplates();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __71__ACHTemplateStore_templateEntityDidReceiveSyncedTemplates_provenance___block_invoke_cold_1();
    }
  }
}

- (BOOL)addTemplates:(id)a3 databaseContext:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  uint64_t v22 = 0;
  long long v23 = &v22;
  uint64_t v24 = 0x3032000000;
  long long v25 = __Block_byref_object_copy__3;
  uint64_t v26 = __Block_byref_object_dispose__3;
  id v27 = 0;
  id v10 = [(ACHTemplateStore *)self synchronizationQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__ACHTemplateStore_addTemplates_databaseContext_error___block_invoke;
  block[3] = &unk_264516670;
  uint64_t v20 = &v28;
  void block[4] = self;
  id v11 = v8;
  id v18 = v11;
  id v12 = v9;
  id v19 = v12;
  id v21 = &v22;
  dispatch_sync(v10, block);

  id v13 = (id)v23[5];
  uint64_t v14 = v13;
  if (v13)
  {
    if (a5) {
      *a5 = v13;
    }
    else {
      _HKLogDroppedError();
    }
  }

  char v15 = *((unsigned char *)v29 + 24);
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(&v28, 8);
  return v15;
}

void __55__ACHTemplateStore_addTemplates_databaseContext_error___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = *(void *)(a1[8] + 8);
  id obj = *(id *)(v5 + 40);
  char v6 = objc_msgSend(v2, "_queue_addTemplates:provenance:databaseContext:triggerSync:error:", v3, 0, v4, 1, &obj);
  objc_storeStrong((id *)(v5 + 40), obj);
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = v6;
}

- (BOOL)_queue_addTemplates:(id)a3 provenance:(int64_t)a4 databaseContext:(id)a5 triggerSync:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  v33[1] = *MEMORY[0x263EF8340];
  id v12 = a5;
  id v13 = a3;
  uint64_t v14 = [(ACHTemplateStore *)self synchronizationQueue];
  dispatch_assert_queue_V2(v14);

  char v15 = [(ACHTemplateStore *)self _queue_templatesFilteredForDuplicates:v13];

  id v16 = objc_msgSend(v15, "hk_filter:", &__block_literal_global_5);

  if ([v16 count])
  {
    long long v17 = [MEMORY[0x263EFF910] date];
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __85__ACHTemplateStore__queue_addTemplates_provenance_databaseContext_triggerSync_error___block_invoke_300;
    v29[3] = &unk_2645166B8;
    id v18 = v17;
    id v30 = v18;
    char v31 = self;
    id v19 = objc_msgSend(v16, "hk_map:", v29);
    uint64_t v20 = [(ACHTemplateStore *)self client];

    if (v20)
    {
      if ([(ACHTemplateStore *)self _queue_client_addTemplatesToDatabase:v19 error:a7])
      {
LABEL_4:
        [(ACHTemplateStore *)self _addTemplatesToLocalCollections:v19];
        [(ACHTemplateStore *)self _notifyObserversOfNewTemplates:v19];
        if (!v8)
        {
          BOOL v23 = 1;
LABEL_14:

          goto LABEL_15;
        }
        id v21 = [(ACHTemplateStore *)self client];

        if (v21)
        {
          uint64_t v22 = [(ACHTemplateStore *)self client];
          [v22 triggerSyncWithCompletion:&__block_literal_global_307];
        }
        else
        {
          uint64_t v22 = [(ACHTemplateStore *)self profile];
          id v27 = [v22 nanoSyncManager];
          [v27 syncHealthDataWithOptions:0 reason:@"ActivityAchievements Templates added" completion:0];
        }
        BOOL v23 = 1;
LABEL_13:

        goto LABEL_14;
      }
    }
    else if ([(ACHTemplateStore *)self _queue_daemon_addTemplatesToDatabase:v19 provenance:a4 databaseContext:v12 error:a7])
    {
      goto LABEL_4;
    }
    uint64_t v22 = [(ACHTemplateStore *)self templatesReadyToAdd];
    uint64_t v24 = [NSNumber numberWithLongLong:a4];
    v32 = v24;
    v33[0] = v16;
    long long v25 = [NSDictionary dictionaryWithObjects:v33 forKeys:&v32 count:1];
    uint64_t v26 = objc_msgSend(v22, "hk_dictionaryByAddingEntriesFromDictionary:", v25);
    [(ACHTemplateStore *)self setTemplatesReadyToAdd:v26];

    BOOL v23 = 0;
    goto LABEL_13;
  }
  BOOL v23 = 1;
LABEL_15:

  return v23;
}

uint64_t __85__ACHTemplateStore__queue_addTemplates_provenance_databaseContext_triggerSync_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 minimumEngineVersion] < 0xF)
  {
    uint64_t v4 = [v2 _isValid];
  }
  else
  {
    uint64_t v3 = ACHLogTemplates();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __85__ACHTemplateStore__queue_addTemplates_provenance_databaseContext_triggerSync_error___block_invoke_cold_1(v2, v3);
    }

    uint64_t v4 = 0;
  }

  return v4;
}

id __85__ACHTemplateStore__queue_addTemplates_provenance_databaseContext_triggerSync_error___block_invoke_300(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)[a2 copy];
  [v3 setCreatedDate:*(void *)(a1 + 32)];
  objc_msgSend(v3, "setCreatorDevice:", objc_msgSend(*(id *)(a1 + 40), "device"));
  return v3;
}

void __85__ACHTemplateStore__queue_addTemplates_provenance_databaseContext_triggerSync_error___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = ACHLogSync();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __85__ACHTemplateStore__queue_addTemplates_provenance_databaseContext_triggerSync_error___block_invoke_2_cold_2(a2, v5);
  }

  if (v4)
  {
    char v6 = ACHLogSync();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __85__ACHTemplateStore__queue_addTemplates_provenance_databaseContext_triggerSync_error___block_invoke_2_cold_1();
    }
  }
}

- (BOOL)_queue_client_addTemplatesToDatabase:(id)a3 error:(id *)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v5 = a3;
  char v6 = [(ACHTemplateStore *)self synchronizationQueue];
  dispatch_assert_queue_V2(v6);

  uint64_t v7 = [(ACHTemplateStore *)self databaseAssertionClient];
  id v35 = 0;
  BOOL v8 = [v7 acquireDatabaseAssertionWithIdentifier:@"ACHTemplateStore" error:&v35];
  id v9 = v35;

  if (!v8)
  {
    id v10 = ACHLogTemplates();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v37[0] = v9;
      _os_log_impl(&dword_21F5DA000, v10, OS_LOG_TYPE_DEFAULT, "BEWARE: Unable to acquire a database assertion. The following operation may fail. %@", buf, 0xCu);
    }
  }
  uint64_t v28 = v9;
  id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v12 = v5;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v31 objects:v38 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v32;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v32 != v15) {
          objc_enumerationMutation(v12);
        }
        long long v17 = *(void **)(*((void *)&v31 + 1) + 8 * v16);
        id v18 = [(ACHTemplateStore *)self templatesByUniqueName];
        id v19 = [v17 uniqueName];
        uint64_t v20 = [v18 objectForKeyedSubscript:v19];

        if (v20) {
          [v11 addObject:v20];
        }

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v31 objects:v38 count:16];
    }
    while (v14);
  }

  id v21 = [(ACHTemplateStore *)self client];
  char v22 = [v21 addTemplates:v12 removingTemplates:v11 error:a4];

  if (v8)
  {
    BOOL v23 = [(ACHTemplateStore *)self databaseAssertionClient];
    id v30 = v28;
    int v24 = [v23 invalidateAssertionWithToken:v8 error:&v30];
    id v25 = v30;

    uint64_t v26 = ACHLogTemplates();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      LODWORD(v37[0]) = v24;
      WORD2(v37[0]) = 2112;
      *(void *)((char *)v37 + 6) = v25;
      _os_log_impl(&dword_21F5DA000, v26, OS_LOG_TYPE_DEFAULT, "Invalidated assertion with success %d; error: %@",
        buf,
        0x12u);
    }
  }
  else
  {
    id v25 = v28;
  }

  return v22;
}

- (BOOL)_queue_daemon_addTemplatesToDatabase:(id)a3 provenance:(int64_t)a4 databaseContext:(id)a5 error:(id *)a6
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  id v10 = [(ACHTemplateStore *)self synchronizationQueue];
  dispatch_assert_queue_V2(v10);

  id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v12 = v8;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v43;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v43 != v15) {
          objc_enumerationMutation(v12);
        }
        long long v17 = *(void **)(*((void *)&v42 + 1) + 8 * v16);
        id v18 = [(ACHTemplateStore *)self templatesByUniqueName];
        id v19 = [v17 uniqueName];
        uint64_t v20 = [v18 objectForKeyedSubscript:v19];

        if (v20) {
          [v11 addObject:v20];
        }

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v42 objects:v46 count:16];
    }
    while (v14);
  }

  if (!v9)
  {
    id v9 = [MEMORY[0x263F431E0] contextForWritingProtectedData];
  }
  id v21 = [(ACHTemplateStore *)self profile];
  char v22 = [v21 database];
  BOOL v23 = (void *)[v9 copyForWritingProtectedData];
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = __90__ACHTemplateStore__queue_daemon_addTemplatesToDatabase_provenance_databaseContext_error___block_invoke;
  v36[3] = &unk_2645166E0;
  id v37 = v11;
  objc_super v38 = self;
  id v40 = v9;
  int64_t v41 = a4;
  id v39 = v12;
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __90__ACHTemplateStore__queue_daemon_addTemplatesToDatabase_provenance_databaseContext_error___block_invoke_320;
  v31[3] = &unk_264516708;
  id v32 = v37;
  long long v33 = self;
  id v34 = v39;
  int64_t v35 = a4;
  id v24 = v39;
  id v25 = v37;
  id v26 = v9;
  char v27 = [v22 performTransactionWithContext:v23 error:a6 block:v36 inaccessibilityHandler:v31];

  return v27;
}

uint64_t __90__ACHTemplateStore__queue_daemon_addTemplatesToDatabase_provenance_databaseContext_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ([*(id *)(a1 + 32) count]
    && ([*(id *)(a1 + 40) entityWrapper],
        id v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 removeTemplates:*(void *)(a1 + 32) error:a3],
        v5,
        !v6))
  {
    id v10 = ACHLogTemplates();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __90__ACHTemplateStore__queue_daemon_addTemplatesToDatabase_provenance_databaseContext_error___block_invoke_cold_1(a3, v10, v11, v12, v13, v14, v15, v16);
    }

    return 0;
  }
  else
  {
    uint64_t v7 = [*(id *)(a1 + 40) entityWrapper];
    uint64_t v8 = [v7 insertTemplates:*(void *)(a1 + 48) provenance:*(void *)(a1 + 64) databaseContext:*(void *)(a1 + 56) error:a3];

    return v8;
  }
}

uint64_t __90__ACHTemplateStore__queue_daemon_addTemplatesToDatabase_provenance_databaseContext_error___block_invoke_320(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ([*(id *)(a1 + 32) count])
  {
    id v5 = ACHLogTemplates();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __90__ACHTemplateStore__queue_daemon_addTemplatesToDatabase_provenance_databaseContext_error___block_invoke_320_cold_1(v5);
    }

    return 0;
  }
  else
  {
    uint64_t v7 = [*(id *)(a1 + 40) entityWrapper];
    uint64_t v8 = [v7 insertTemplates:*(void *)(a1 + 48) provenance:*(void *)(a1 + 56) databaseContext:0 error:a3];

    return v8;
  }
}

- (void)_addTemplatesToLocalCollections:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(ACHTemplateStore *)self synchronizationQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = v4;
  uint64_t v7 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v35;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v35 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v34 + 1) + 8 * v10);
        uint64_t v12 = [(ACHTemplateStore *)self templatesByUniqueName];
        uint64_t v13 = [v11 uniqueName];
        uint64_t v14 = [v12 objectForKeyedSubscript:v13];

        unsigned int v15 = [v11 minimumEngineVersion];
        unsigned int v16 = v15;
        if (v14)
        {
          unint64_t v17 = [v11 version];
          unint64_t v18 = [v14 version];
          if (v16 > 0xE || v17 <= v18) {
            goto LABEL_18;
          }
          uint64_t v20 = [(ACHTemplateStore *)self templates];
          [v20 removeObject:v14];

          [v6 addObject:v14];
        }
        else if (v15 >= 0xF)
        {
          goto LABEL_18;
        }
        id v21 = [(ACHTemplateStore *)self templates];
        [v21 addObject:v11];

        char v22 = [(ACHTemplateStore *)self templatesByUniqueName];
        BOOL v23 = [v11 uniqueName];
        [v22 setObject:v11 forKey:v23];

        id v24 = [(ACHTemplateStore *)self templatesByKey];
        id v25 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v11, "key"));
        [v24 setObject:v11 forKey:v25];

        id v26 = [v11 sourceName];

        if (v26)
        {
          id v27 = v6;
          uint64_t v28 = [(ACHTemplateStore *)self templatesBySource];
          v29 = [v11 sourceName];
          id v30 = [v28 objectForKeyedSubscript:v29];

          if (!v30)
          {
            id v30 = objc_alloc_init(MEMORY[0x263EFF980]);
            long long v31 = [(ACHTemplateStore *)self templatesBySource];
            id v32 = [v11 sourceName];
            [v31 setObject:v30 forKeyedSubscript:v32];
          }
          [v30 addObject:v11];

          id v6 = v27;
        }
LABEL_18:

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v8);
  }

  if ([v6 count]) {
    [(ACHTemplateStore *)self _notifyObserversOfRemovedTemplates:v6];
  }
}

- (BOOL)removeTemplates:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  uint64_t v17 = 0;
  unint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__3;
  id v21 = __Block_byref_object_dispose__3;
  id v22 = 0;
  uint64_t v7 = [(ACHTemplateStore *)self synchronizationQueue];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __42__ACHTemplateStore_removeTemplates_error___block_invoke;
  v13[3] = &unk_264516730;
  void v13[4] = self;
  unsigned int v15 = &v23;
  id v8 = v6;
  id v14 = v8;
  unsigned int v16 = &v17;
  dispatch_sync(v7, v13);

  if (*((unsigned char *)v24 + 24))
  {
    BOOL v9 = 1;
  }
  else
  {
    id v10 = (id)v18[5];
    uint64_t v11 = v10;
    if (v10)
    {
      if (a4) {
        *a4 = v10;
      }
      else {
        _HKLogDroppedError();
      }
    }

    BOOL v9 = *((unsigned char *)v24 + 24) != 0;
  }

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v9;
}

void __42__ACHTemplateStore_removeTemplates_error___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) client];

  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v8 = *(void *)(v5 + 40);
  uint64_t v7 = (id *)(v5 + 40);
  uint64_t v6 = v8;
  if (v2)
  {
    uint64_t v12 = v6;
    BOOL v9 = (id *)&v12;
    char v10 = objc_msgSend(v3, "_queue_client_removeTemplatesFromDatabase:error:", v4, &v12);
  }
  else
  {
    uint64_t v13 = v6;
    BOOL v9 = (id *)&v13;
    char v10 = objc_msgSend(v3, "_queue_daemon_removeTemplatesFromDatabase:error:", v4, &v13);
  }
  char v11 = v10;
  objc_storeStrong(v7, *v9);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v11;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    [*(id *)(a1 + 32) _removeTemplatesFromLocalCollections:*(void *)(a1 + 40)];
  }
}

- (BOOL)removeTemplatesForSource:(id)a3 error:(id *)a4
{
  uint64_t v6 = [(ACHTemplateStore *)self templatesForSource:a3];
  LOBYTE(a4) = [(ACHTemplateStore *)self removeTemplates:v6 error:a4];

  return (char)a4;
}

- (BOOL)removeTemplatesWithUniqueNames:(id)a3 error:(id *)a4
{
  uint64_t v6 = [(ACHTemplateStore *)self _templatesWithUniqueNames:a3];
  LOBYTE(a4) = [(ACHTemplateStore *)self removeTemplates:v6 error:a4];

  return (char)a4;
}

- (BOOL)removeAllTemplates:(id *)a3
{
  uint64_t v5 = [(ACHTemplateStore *)self allTemplates];
  LOBYTE(a3) = [(ACHTemplateStore *)self removeTemplates:v5 error:a3];

  return (char)a3;
}

- (BOOL)_queue_client_removeTemplatesFromDatabase:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(ACHTemplateStore *)self synchronizationQueue];
  dispatch_assert_queue_V2(v7);

  uint64_t v8 = [(ACHTemplateStore *)self client];
  LOBYTE(a4) = [v8 removeTemplates:v6 error:a4];

  return (char)a4;
}

- (BOOL)_queue_daemon_removeTemplatesFromDatabase:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(ACHTemplateStore *)self synchronizationQueue];
  dispatch_assert_queue_V2(v7);

  uint64_t v8 = [(ACHTemplateStore *)self entityWrapper];
  char v9 = [v8 removeTemplates:v6 error:a4];

  if ((v9 & 1) == 0)
  {
    char v10 = ACHLogDatabase();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[ACHTemplateStore _queue_daemon_removeTemplatesFromDatabase:error:]();
    }
  }
  return v9;
}

- (void)_removeTemplatesFromLocalCollections:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(ACHTemplateStore *)self synchronizationQueue];
  dispatch_assert_queue_V2(v5);

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v26;
    char v10 = (void *)MEMORY[0x263EFFA68];
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v13 = [(ACHTemplateStore *)self templatesByUniqueName];
        id v14 = [v12 uniqueName];
        unsigned int v15 = [v13 objectForKeyedSubscript:v14];

        if (v15)
        {
          unsigned int v16 = [(ACHTemplateStore *)self templates];
          [v16 removeObject:v15];

          uint64_t v17 = [(ACHTemplateStore *)self templatesByUniqueName];
          unint64_t v18 = [v15 uniqueName];
          [v17 removeObjectForKey:v18];

          uint64_t v19 = [(ACHTemplateStore *)self templatesByKey];
          uint64_t v20 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v15, "key"));
          [v19 removeObjectForKey:v20];

          id v21 = [(ACHTemplateStore *)self templatesBySource];
          id v22 = [v15 sourceName];
          uint64_t v23 = [v21 objectForKeyedSubscript:v22];

          [v23 removeObject:v15];
          uint64_t v24 = [v10 arrayByAddingObject:v15];

          char v10 = (void *)v24;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v8);
  }
  else
  {
    char v10 = (void *)MEMORY[0x263EFFA68];
  }

  if ([v10 count]) {
    [(ACHTemplateStore *)self _notifyObserversOfRemovedTemplates:v10];
  }
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ACHTemplateStore *)self notificationQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __32__ACHTemplateStore_addObserver___block_invoke;
  v7[3] = &unk_264515DE0;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __32__ACHTemplateStore_addObserver___block_invoke(uint64_t a1)
{
  uint64_t v2 = a1 + 32;
  if ([*(id *)(a1 + 32) conformsToProtocol:&unk_26D122998])
  {
    uint64_t v3 = [*(id *)(a1 + 40) observers];
    [v3 addObject:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v3 = ACHLogDefault();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __32__ACHTemplateStore_addObserver___block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }

  uint64_t result = [*(id *)(a1 + 40) initialFetchComplete];
  if (result)
  {
    uint64_t result = objc_opt_respondsToSelector();
    if (result) {
      return [*(id *)(a1 + 32) templateStoreDidFinishInitialFetch:*(void *)(a1 + 40)];
    }
  }
  return result;
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ACHTemplateStore *)self notificationQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __35__ACHTemplateStore_removeObserver___block_invoke;
  v7[3] = &unk_264515DE0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __35__ACHTemplateStore_removeObserver___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) observers];
  int v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) observers];
    [v4 removeObject:*(void *)(a1 + 40)];
  }
}

- (void)_notifyObserversOfInitialFetchCompletion
{
  int v3 = [(ACHTemplateStore *)self notificationQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__ACHTemplateStore__notifyObserversOfInitialFetchCompletion__block_invoke;
  block[3] = &unk_264515DB8;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __60__ACHTemplateStore__notifyObserversOfInitialFetchCompletion__block_invoke(uint64_t a1)
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
          [v7 templateStoreDidFinishInitialFetch:*(void *)(a1 + 32)];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)_notifyObserversOfNewTemplates:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ACHTemplateStore *)self notificationQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __51__ACHTemplateStore__notifyObserversOfNewTemplates___block_invoke;
  v7[3] = &unk_264515DE0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __51__ACHTemplateStore__notifyObserversOfNewTemplates___block_invoke(uint64_t a1)
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
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) templateStore:*(void *)(a1 + 32) didAddNewTemplates:*(void *)(a1 + 40)];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)_notifyObserversOfRemovedTemplates:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ACHTemplateStore *)self notificationQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__ACHTemplateStore__notifyObserversOfRemovedTemplates___block_invoke;
  v7[3] = &unk_264515DE0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __55__ACHTemplateStore__notifyObserversOfRemovedTemplates___block_invoke(uint64_t a1)
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
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) templateStore:*(void *)(a1 + 32) didRemoveTemplates:*(void *)(a1 + 40)];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (ACHAwardsClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
}

- (ACHDatabaseAssertionClient)databaseAssertionClient
{
  return self->_databaseAssertionClient;
}

- (void)setDatabaseAssertionClient:(id)a3
{
}

- (int)protectedDataToken
{
  return self->_protectedDataToken;
}

- (void)setProtectedDataToken:(int)a3
{
  self->_protectedDataToken = a3;
}

- (int)syncedTemplatesToken
{
  return self->_syncedTemplatesToken;
}

- (void)setSyncedTemplatesToken:(int)a3
{
  self->_syncedTemplatesToken = a3;
}

- (HDProfile)profile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  return (HDProfile *)WeakRetained;
}

- (void)setProfile:(id)a3
{
}

- (ACHTemplateEntityWrapper)entityWrapper
{
  return self->_entityWrapper;
}

- (void)setEntityWrapper:(id)a3
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

- (NSMutableSet)templates
{
  return self->_templates;
}

- (void)setTemplates:(id)a3
{
}

- (NSMutableDictionary)templatesByUniqueName
{
  return self->_templatesByUniqueName;
}

- (void)setTemplatesByUniqueName:(id)a3
{
}

- (NSMutableDictionary)templatesByKey
{
  return self->_templatesByKey;
}

- (void)setTemplatesByKey:(id)a3
{
}

- (NSMutableDictionary)templatesBySource
{
  return self->_templatesBySource;
}

- (void)setTemplatesBySource:(id)a3
{
}

- (NSDictionary)templatesReadyToAdd
{
  return self->_templatesReadyToAdd;
}

- (void)setTemplatesReadyToAdd:(id)a3
{
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (OS_dispatch_queue)notificationQueue
{
  return self->_notificationQueue;
}

- (void)setNotificationQueue:(id)a3
{
}

- (OS_dispatch_queue)synchronizationQueue
{
  return self->_synchronizationQueue;
}

- (void)setSynchronizationQueue:(id)a3
{
}

- (BOOL)initialFetchComplete
{
  return self->_initialFetchComplete;
}

- (void)setInitialFetchComplete:(BOOL)a3
{
  self->_initialFetchComplete = a3;
}

- (BOOL)needsUpdateWhenProtectedDataAvailable
{
  return self->_needsUpdateWhenProtectedDataAvailable;
}

- (void)setNeedsUpdateWhenProtectedDataAvailable:(BOOL)a3
{
  self->_needsUpdateWhenProtectedDataAvailable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_synchronizationQueue, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_templatesReadyToAdd, 0);
  objc_storeStrong((id *)&self->_templatesBySource, 0);
  objc_storeStrong((id *)&self->_templatesByKey, 0);
  objc_storeStrong((id *)&self->_templatesByUniqueName, 0);
  objc_storeStrong((id *)&self->_templates, 0);
  objc_storeStrong((id *)&self->_entityWrapper, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_databaseAssertionClient, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

void __71__ACHTemplateStore_templateEntityDidReceiveSyncedTemplates_provenance___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21F5DA000, v0, v1, "Error adding templates: %{public}@", v2, v3, v4, v5, v6);
}

void __67__ACHTemplateStore__daemon_loadAllTemplatesFromDatabaseIfNecessary__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21F5DA000, v0, v1, "Error fetching templates: %@", v2, v3, v4, v5, v6);
}

void __85__ACHTemplateStore__queue_addTemplates_provenance_databaseContext_triggerSync_error___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 uniqueName];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_21F5DA000, a2, OS_LOG_TYPE_DEBUG, "Template minimum engine version higher than we support, not adding: %@", v4, 0xCu);
}

void __85__ACHTemplateStore__queue_addTemplates_provenance_databaseContext_triggerSync_error___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21F5DA000, v0, v1, "Error triggering sync for templates: %@", v2, v3, v4, v5, v6);
}

void __85__ACHTemplateStore__queue_addTemplates_provenance_databaseContext_triggerSync_error___block_invoke_2_cold_2(char a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = @"NO";
  if (a1) {
    uint64_t v2 = @"YES";
  }
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_21F5DA000, a2, OS_LOG_TYPE_DEBUG, "Triggered sync for templates, success: %@", (uint8_t *)&v3, 0xCu);
}

void __90__ACHTemplateStore__queue_daemon_addTemplatesToDatabase_provenance_databaseContext_error___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __90__ACHTemplateStore__queue_daemon_addTemplatesToDatabase_provenance_databaseContext_error___block_invoke_320_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_21F5DA000, log, OS_LOG_TYPE_ERROR, "Protected data unavailable trying to replace templates", v1, 2u);
}

- (void)_queue_daemon_removeTemplatesFromDatabase:error:.cold.1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_21F5DA000, v1, OS_LOG_TYPE_ERROR, "Error removing templates %@: %@", v2, 0x16u);
}

void __32__ACHTemplateStore_addObserver___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end