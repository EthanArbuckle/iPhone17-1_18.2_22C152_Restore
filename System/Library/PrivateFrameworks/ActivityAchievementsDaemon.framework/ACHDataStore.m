@interface ACHDataStore
- (ACHAwardsKeyValueClient)keyValueClient;
- (ACHDataStore)initWithHealthStore:(id)a3 assertionClient:(id)a4;
- (ACHDataStore)initWithProfile:(id)a3;
- (ACHDatabaseAssertionClient)assertionClient;
- (BOOL)_forceDatabasePopulate;
- (BOOL)_queue_daemon_populateFromDatabaseForProviders:(id)a3 error:(id *)a4;
- (BOOL)_queue_healthStore_populateFromDatabaseForProviders:(id)a3 error:(id *)a4;
- (BOOL)_queue_populateAllPropertiesFromDatabase;
- (BOOL)_queue_populateFromDatabaseForProviders:(id)a3 error:(id *)a4;
- (BOOL)_queue_setDatabaseIdentifier:(id)a3 error:(id *)a4;
- (BOOL)clearAllInMemoryPropertiesWithError:(id *)a3;
- (BOOL)clearAllPropertiesWithError:(id *)a3 databaseContext:(id)a4;
- (BOOL)commitAllPropertiesWithError:(id *)a3;
- (BOOL)commitPropertiesForProvider:(id)a3 withError:(id *)a4;
- (BOOL)hasCompletedFirstPopulateFromDatabase;
- (BOOL)needsPopulationWhenProtectedDataAvailable;
- (HDKeyValueDomain)defaultsDomain;
- (HDProfile)profile;
- (HKHealthStore)healthStore;
- (NSError)injectedError;
- (NSHashTable)observers;
- (NSHashTable)propertyProviders;
- (NSString)databaseIdentifier;
- (OS_dispatch_queue)internalQueue;
- (OS_dispatch_queue)notificationQueue;
- (id)_queue_allPropertyProviderKeys;
- (id)_queue_dictionaryRepresentationOfAllProviderProperties;
- (id)populationCompleteBlock;
- (int)protectedDataToken;
- (int)syncToken;
- (void)_listenForNotifications;
- (void)_protectedDataStateDidChange;
- (void)_queue_populateAllPropertiesFromDatabase;
- (void)_startUp;
- (void)_syncEntityDidReceiveValues:(id)a3;
- (void)activate;
- (void)addObserver:(id)a3;
- (void)addPropertyProvider:(id)a3;
- (void)commitAllPropertiesToDatabaseWithContext:(id)a3 completion:(id)a4;
- (void)daemonReady:(id)a3;
- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4;
- (void)dealloc;
- (void)removeObserver:(id)a3;
- (void)setAssertionClient:(id)a3;
- (void)setDatabaseIdentifier:(id)a3;
- (void)setDefaultsDomain:(id)a3;
- (void)setHasCompletedFirstPopulateFromDatabase:(BOOL)a3;
- (void)setHealthStore:(id)a3;
- (void)setInjectedError:(id)a3;
- (void)setInternalQueue:(id)a3;
- (void)setKeyValueClient:(id)a3;
- (void)setNeedsPopulationWhenProtectedDataAvailable:(BOOL)a3;
- (void)setNotificationQueue:(id)a3;
- (void)setObservers:(id)a3;
- (void)setPopulationCompleteBlock:(id)a3;
- (void)setProfile:(id)a3;
- (void)setPropertyProviders:(id)a3;
- (void)setProtectedDataToken:(int)a3;
- (void)setSyncToken:(int)a3;
@end

@implementation ACHDataStore

- (ACHDataStore)initWithHealthStore:(id)a3 assertionClient:(id)a4
{
  id v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)ACHDataStore;
  v7 = [(ACHDataStore *)&v20 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_healthStore, a3);
    uint64_t v9 = [objc_alloc(MEMORY[0x263F23648]) initWithHealthStore:v6];
    keyValueClient = v8->_keyValueClient;
    v8->_keyValueClient = (ACHAwardsKeyValueClient *)v9;

    uint64_t v11 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    propertyProviders = v8->_propertyProviders;
    v8->_propertyProviders = (NSHashTable *)v11;

    uint64_t v13 = HKCreateSerialDispatchQueue();
    internalQueue = v8->_internalQueue;
    v8->_internalQueue = (OS_dispatch_queue *)v13;

    uint64_t v15 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    observers = v8->_observers;
    v8->_observers = (NSHashTable *)v15;

    uint64_t v17 = HKCreateSerialDispatchQueue();
    notificationQueue = v8->_notificationQueue;
    v8->_notificationQueue = (OS_dispatch_queue *)v17;
  }
  return v8;
}

- (ACHDataStore)initWithProfile:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)ACHDataStore;
  v5 = [(ACHDataStore *)&v21 init];
  id v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    uint64_t v7 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    propertyProviders = v6->_propertyProviders;
    v6->_propertyProviders = (NSHashTable *)v7;

    uint64_t v9 = [objc_alloc(MEMORY[0x263F43218]) initWithCategory:0 domainName:@"com.apple.FitnessAchievements.DataStore" profile:v4];
    defaultsDomain = v6->_defaultsDomain;
    v6->_defaultsDomain = (HDKeyValueDomain *)v9;

    uint64_t v11 = HKCreateSerialDispatchQueue();
    internalQueue = v6->_internalQueue;
    v6->_internalQueue = (OS_dispatch_queue *)v11;

    uint64_t v13 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    observers = v6->_observers;
    v6->_observers = (NSHashTable *)v13;

    uint64_t v15 = HKCreateSerialDispatchQueue();
    notificationQueue = v6->_notificationQueue;
    v6->_notificationQueue = (OS_dispatch_queue *)v15;

    uint64_t v17 = [MEMORY[0x263F08A00] defaultCenter];
    [v17 addObserver:v6 selector:sel__syncEntityDidReceiveValues_ name:@"ACHDataStoreSyncEntityDidReceiveValuesNotification" object:0];

    id WeakRetained = objc_loadWeakRetained((id *)&v6->_profile);
    v19 = [WeakRetained daemon];
    [v19 registerForDaemonReady:v6];
  }
  return v6;
}

- (void)activate
{
  [(ACHDataStore *)self _listenForNotifications];
  [(ACHDataStore *)self _startUp];
}

- (void)dealloc
{
  if (notify_is_valid_token(self->_protectedDataToken)) {
    notify_cancel(self->_protectedDataToken);
  }
  if (notify_is_valid_token(self->_syncToken)) {
    notify_cancel(self->_syncToken);
  }
  v3.receiver = self;
  v3.super_class = (Class)ACHDataStore;
  [(ACHDataStore *)&v3 dealloc];
}

- (void)addPropertyProvider:(id)a3
{
  id v4 = a3;
  v5 = [(ACHDataStore *)self internalQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __36__ACHDataStore_addPropertyProvider___block_invoke;
  v7[3] = &unk_264515DE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __36__ACHDataStore_addPropertyProvider___block_invoke(uint64_t a1)
{
  v8[1] = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) propertyProviders];
  [v2 addObject:*(void *)(a1 + 40)];

  if ([*(id *)(a1 + 32) hasCompletedFirstPopulateFromDatabase])
  {
    objc_super v3 = [*(id *)(a1 + 32) injectedError];
    id v4 = *(void **)(a1 + 32);
    v8[0] = *(void *)(a1 + 40);
    v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
    id v7 = v3;
    objc_msgSend(v4, "_queue_populateFromDatabaseForProviders:error:", v5, &v7);
    id v6 = v7;
  }
}

- (void)_syncEntityDidReceiveValues:(id)a3
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__ACHDataStore__syncEntityDidReceiveValues___block_invoke;
  block[3] = &unk_264515DB8;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

uint64_t __44__ACHDataStore__syncEntityDidReceiveValues___block_invoke(uint64_t a1)
{
  v2 = ACHLogDatabase();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_21F5DA000, v2, OS_LOG_TYPE_DEFAULT, "Sync entity received new dataStore values, re-populating values from data store", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_queue_populateAllPropertiesFromDatabase");
}

- (void)daemonReady:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v5 = [WeakRetained database];
  [v5 addProtectedDataObserver:self];

  [(ACHDataStore *)self _startUp];
}

- (void)_listenForNotifications
{
  objc_initWeak(&location, self);
  objc_super v3 = (const char *)[(id)*MEMORY[0x263F235A8] UTF8String];
  internalQueue = self->_internalQueue;
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __39__ACHDataStore__listenForNotifications__block_invoke;
  handler[3] = &unk_264515D40;
  objc_copyWeak(&v10, &location);
  notify_register_dispatch(v3, &self->_protectedDataToken, internalQueue, handler);
  v5 = (const char *)[(id)*MEMORY[0x263F23490] UTF8String];
  id v6 = self->_internalQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __39__ACHDataStore__listenForNotifications__block_invoke_2;
  v7[3] = &unk_264515D40;
  objc_copyWeak(&v8, &location);
  notify_register_dispatch(v5, &self->_syncToken, v6, v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __39__ACHDataStore__listenForNotifications__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _protectedDataStateDidChange];
}

void __39__ACHDataStore__listenForNotifications__block_invoke_2(uint64_t a1)
{
  v2 = ACHLogDatabase();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_21F5DA000, v2, OS_LOG_TYPE_DEFAULT, "Sync entity received new dataStore values, re-populating values from data store", v9, 2u);
  }

  objc_super v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v3);
  v5 = [WeakRetained keyValueClient];
  int v6 = [v5 protectedDataAvailable];

  id v7 = objc_loadWeakRetained(v3);
  id v8 = v7;
  if (v6) {
    objc_msgSend(v7, "_queue_populateAllPropertiesFromDatabase");
  }
  else {
    [v7 setNeedsPopulationWhenProtectedDataAvailable:1];
  }
}

- (void)_startUp
{
  objc_super v3 = [(ACHDataStore *)self internalQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __24__ACHDataStore__startUp__block_invoke;
  block[3] = &unk_264515DB8;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __24__ACHDataStore__startUp__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_queue_populateAllPropertiesFromDatabase");
  if ((result & 1) == 0)
  {
    objc_super v3 = ACHLogDatabase();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_21F5DA000, v3, OS_LOG_TYPE_DEFAULT, "Error populating initial values. Will repopulate when protected data is available.", v4, 2u);
    }

    return [*(id *)(a1 + 32) setNeedsPopulationWhenProtectedDataAvailable:1];
  }
  return result;
}

- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4
{
  int v6 = [(ACHDataStore *)self internalQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__ACHDataStore_database_protectedDataDidBecomeAvailable___block_invoke;
  v7[3] = &unk_264516530;
  BOOL v8 = a4;
  void v7[4] = self;
  dispatch_async(v6, v7);
}

void __57__ACHDataStore_database_protectedDataDidBecomeAvailable___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40) && [*(id *)(a1 + 32) needsPopulationWhenProtectedDataAvailable])
  {
    if (objc_msgSend(*(id *)(a1 + 32), "_queue_populateAllPropertiesFromDatabase"))
    {
      v2 = *(void **)(a1 + 32);
      [v2 setNeedsPopulationWhenProtectedDataAvailable:0];
    }
    else
    {
      objc_super v3 = ACHLogDatabase();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v4 = 0;
        _os_log_impl(&dword_21F5DA000, v3, OS_LOG_TYPE_DEFAULT, "Error fetching after protected data became available", v4, 2u);
      }
    }
  }
}

- (void)_protectedDataStateDidChange
{
  objc_super v3 = [(ACHDataStore *)self internalQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__ACHDataStore__protectedDataStateDidChange__block_invoke;
  block[3] = &unk_264515DB8;
  block[4] = self;
  dispatch_async(v3, block);
}

void __44__ACHDataStore__protectedDataStateDidChange__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) keyValueClient];
  int v3 = [v2 protectedDataAvailable];

  if (v3 && [*(id *)(a1 + 32) needsPopulationWhenProtectedDataAvailable])
  {
    if (objc_msgSend(*(id *)(a1 + 32), "_queue_populateAllPropertiesFromDatabase"))
    {
      id v4 = *(void **)(a1 + 32);
      [v4 setNeedsPopulationWhenProtectedDataAvailable:0];
    }
    else
    {
      v5 = ACHLogDatabase();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)int v6 = 0;
        _os_log_impl(&dword_21F5DA000, v5, OS_LOG_TYPE_DEFAULT, "Error fetching after protected data became available", v6, 2u);
      }
    }
  }
}

- (NSString)databaseIdentifier
{
  int v3 = [(ACHDataStore *)self internalQueue];
  dispatch_assert_queue_not_V2(v3);

  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__21;
  v12 = __Block_byref_object_dispose__21;
  id v13 = 0;
  id v4 = [(ACHDataStore *)self internalQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __34__ACHDataStore_databaseIdentifier__block_invoke;
  v7[3] = &unk_264516620;
  void v7[4] = self;
  void v7[5] = &v8;
  dispatch_sync(v4, v7);

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSString *)v5;
}

void __34__ACHDataStore_databaseIdentifier__block_invoke(uint64_t a1)
{
  v2 = *(id **)(a1 + 32);
  if (v2[3])
  {
    if ([v2[3] length]) {
      goto LABEL_13;
    }
    v2 = *(id **)(a1 + 32);
  }
  int v3 = [v2 injectedError];
  id v4 = [*(id *)(a1 + 32) defaultsDomain];
  id v5 = NSStringFromSelector(sel_databaseIdentifier);
  id v11 = v3;
  int v6 = [v4 stringForKey:v5 error:&v11];
  id v7 = v11;

  if (v7)
  {
    uint64_t v8 = ACHLogDatabase();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __34__ACHDataStore_databaseIdentifier__block_invoke_cold_2();
    }
  }
  else if (v6 && [v6 length])
  {
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = v6;
    uint64_t v8 = *(NSObject **)(v9 + 24);
    *(void *)(v9 + 24) = v10;
  }
  else
  {
    uint64_t v8 = ACHLogDatabase();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __34__ACHDataStore_databaseIdentifier__block_invoke_cold_1(v8);
    }
  }

LABEL_13:
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 24));
}

- (void)setDatabaseIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(ACHDataStore *)self internalQueue];
  dispatch_assert_queue_not_V2(v5);

  int v6 = [(ACHDataStore *)self internalQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  void v8[2] = __38__ACHDataStore_setDatabaseIdentifier___block_invoke;
  v8[3] = &unk_264515DE0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_sync(v6, v8);
}

void __38__ACHDataStore_setDatabaseIdentifier___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) injectedError];
  int v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v7 = v2;
  objc_msgSend(v3, "_queue_setDatabaseIdentifier:error:", v4, &v7);
  id v5 = v7;

  if (v5)
  {
    int v6 = ACHLogDatabase();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __38__ACHDataStore_setDatabaseIdentifier___block_invoke_cold_1();
    }
  }
}

- (BOOL)clearAllPropertiesWithError:(id *)a3 databaseContext:(id)a4
{
  id v6 = a4;
  id v7 = [(ACHDataStore *)self internalQueue];
  dispatch_assert_queue_not_V2(v7);

  if (!v6)
  {
    id v6 = [MEMORY[0x263F431E0] contextForWritingProtectedData];
  }
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 1;
  dispatch_group_t v8 = dispatch_group_create();
  id v9 = [(ACHDataStore *)self internalQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__ACHDataStore_clearAllPropertiesWithError_databaseContext___block_invoke;
  block[3] = &unk_264517730;
  block[4] = self;
  objc_super v21 = &v28;
  id v10 = v6;
  id v19 = v10;
  v23 = a3;
  id v11 = v8;
  objc_super v20 = v11;
  v22 = &v24;
  dispatch_sync(v9, block);

  dispatch_time_t v12 = dispatch_time(0, 20000000000);
  if (dispatch_group_wait(v11, v12) >= 1)
  {
    id v13 = ACHLogDatabase();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl(&dword_21F5DA000, v13, OS_LOG_TYPE_DEFAULT, "OHNO: Max wait time reached in dispatch group for clearing properties for all providers.", v17, 2u);
    }
  }
  if (!*((unsigned char *)v25 + 24))
  {
    v14 = ACHLogDatabase();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl(&dword_21F5DA000, v14, OS_LOG_TYPE_DEFAULT, "Failure in resetting in-memory values for one or more property providers.", v17, 2u);
    }
  }
  char v15 = *((unsigned char *)v29 + 24);

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);

  return v15;
}

void __60__ACHDataStore_clearAllPropertiesWithError_databaseContext___block_invoke(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263EFF9A0] dictionary];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  int v3 = [*(id *)(a1 + 32) propertyProviders];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v37 != v6) {
          objc_enumerationMutation(v3);
        }
        dispatch_group_t v8 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        id v9 = [v8 dataStorePropertyKeys];
        id v10 = [v8 uniqueName];
        [v2 setObject:v9 forKeyedSubscript:v10];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v5);
  }

  id v11 = [*(id *)(a1 + 32) profile];
  dispatch_time_t v12 = [v11 database];
  id v13 = (void *)[*(id *)(a1 + 40) copyForWritingProtectedData];
  uint64_t v14 = *(void *)(a1 + 72);
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __60__ACHDataStore_clearAllPropertiesWithError_databaseContext___block_invoke_2;
  v33[3] = &unk_2645176B8;
  id v15 = v2;
  uint64_t v16 = *(void *)(a1 + 32);
  id v34 = v15;
  uint64_t v35 = v16;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v12 performTransactionWithContext:v13 error:v14 block:v33 inaccessibilityHandler:0];

  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    id v25 = v15;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v17 = [*(id *)(a1 + 32) propertyProviders];
    uint64_t v18 = [v17 countByEnumeratingWithState:&v29 objects:v40 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v30;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v30 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = *(void *)(*((void *)&v29 + 1) + 8 * j);
          dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
          v23 = dispatch_get_global_queue(21, 0);
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __60__ACHDataStore_clearAllPropertiesWithError_databaseContext___block_invoke_3;
          block[3] = &unk_264517708;
          uint64_t v24 = *(void *)(a1 + 32);
          block[4] = v22;
          void block[5] = v24;
          uint64_t v28 = *(void *)(a1 + 64);
          id v27 = *(id *)(a1 + 48);
          dispatch_async(v23, block);
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v29 objects:v40 count:16];
      }
      while (v19);
    }

    id v15 = v25;
  }
}

uint64_t __60__ACHDataStore_clearAllPropertiesWithError_databaseContext___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  obuint64_t j = [*(id *)(a1 + 32) allKeys];
  uint64_t v5 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        id v10 = [*(id *)(a1 + 32) objectForKeyedSubscript:v9];
        id v11 = [*(id *)(a1 + 40) profile];
        LODWORD(v9) = +[ACHDataStoreSyncEntity removeDataStoreValuesForKeys:v10 domain:v9 profile:v11 error:a3];

        if (!v9)
        {
          uint64_t v12 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  uint64_t v12 = 1;
LABEL_11:

  return v12;
}

void __60__ACHDataStore_clearAllPropertiesWithError_databaseContext___block_invoke_3(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __60__ACHDataStore_clearAllPropertiesWithError_databaseContext___block_invoke_4;
  v5[3] = &unk_2645176E0;
  long long v4 = *(_OWORD *)(a1 + 48);
  id v3 = (id)v4;
  long long v6 = v4;
  [v1 dataStoreDidClearAllProperties:v2 completion:v5];
}

void __60__ACHDataStore_clearAllPropertiesWithError_databaseContext___block_invoke_4(uint64_t a1, char a2)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v2 + 24)) {
    char v3 = a2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)(v2 + 24) = v3;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (BOOL)clearAllInMemoryPropertiesWithError:(id *)a3
{
  uint64_t v5 = [(ACHDataStore *)self internalQueue];
  dispatch_assert_queue_not_V2(v5);

  uint64_t v16 = 0;
  long long v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__21;
  uint64_t v20 = __Block_byref_object_dispose__21;
  id v21 = 0;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 1;
  long long v6 = [(ACHDataStore *)self internalQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__ACHDataStore_clearAllInMemoryPropertiesWithError___block_invoke;
  block[3] = &unk_264516BE0;
  block[4] = self;
  void block[5] = &v16;
  void block[6] = &v12;
  dispatch_sync(v6, block);

  id v7 = (id)v17[5];
  dispatch_group_t v8 = v7;
  if (v7)
  {
    if (a3) {
      *a3 = v7;
    }
    else {
      _HKLogDroppedError();
    }
  }

  char v9 = *((unsigned char *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);

  return v9;
}

void __52__ACHDataStore_clearAllInMemoryPropertiesWithError___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2810000000;
  v22[3] = &unk_21F67425F;
  int v23 = 0;
  uint64_t v2 = dispatch_group_create();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  char v3 = [*(id *)(a1 + 32) propertyProviders];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v19;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v19 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void *)(*((void *)&v18 + 1) + 8 * v6);
        dispatch_group_enter(v2);
        dispatch_group_t v8 = dispatch_get_global_queue(17, 0);
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __52__ACHDataStore_clearAllInMemoryPropertiesWithError___block_invoke_2;
        block[3] = &unk_264517780;
        uint64_t v9 = *(void *)(a1 + 32);
        block[4] = v7;
        void block[5] = v9;
        uint64_t v16 = v22;
        long long v17 = *(_OWORD *)(a1 + 40);
        char v15 = v2;
        dispatch_async(v8, block);

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v4);
  }

  dispatch_time_t v10 = dispatch_time(0, 20000000000);
  if (dispatch_group_wait(v2, v10) >= 1)
  {
    id v11 = ACHLogDatabase();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __52__ACHDataStore_clearAllInMemoryPropertiesWithError___block_invoke_cold_1(v11);
    }
  }
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    uint64_t v12 = ACHLogDatabase();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v13 = 0;
      _os_log_impl(&dword_21F5DA000, v12, OS_LOG_TYPE_DEFAULT, "Failure in resetting in-memory values for one or more property providers.", v13, 2u);
    }
  }
  _Block_object_dispose(v22, 8);
}

void __52__ACHDataStore_clearAllInMemoryPropertiesWithError___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  long long v4 = *(_OWORD *)(a1 + 48);
  long long v7 = *(_OWORD *)(a1 + 64);
  v5[2] = __52__ACHDataStore_clearAllInMemoryPropertiesWithError___block_invoke_3;
  v5[3] = &unk_264517758;
  void v5[4] = v1;
  id v3 = (id)v4;
  long long v6 = v4;
  [v1 dataStoreDidClearAllProperties:v2 completion:v5];
}

void __52__ACHDataStore_clearAllInMemoryPropertiesWithError___block_invoke_3(uint64_t a1, char a2)
{
  v16[1] = *MEMORY[0x263EF8340];
  os_unfair_lock_lock_with_options();
  if ((a2 & 1) == 0)
  {
    long long v4 = NSString;
    uint64_t v5 = [*(id *)(a1 + 32) uniqueName];
    long long v6 = [v4 stringWithFormat:@"Error clearing in memory store for property provider: %@", v5];

    long long v7 = ACHLogDatabase();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __52__ACHDataStore_clearAllInMemoryPropertiesWithError___block_invoke_3_cold_1();
    }

    dispatch_group_t v8 = (void *)MEMORY[0x263F087E8];
    uint64_t v15 = *MEMORY[0x263F08320];
    v16[0] = v6;
    uint64_t v9 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
    uint64_t v10 = [v8 errorWithDomain:@"com.apple.ActivityAchievements" code:10 userInfo:v9];
    uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
  uint64_t v13 = *(void *)(*(void *)(a1 + 64) + 8);
  if (*(unsigned char *)(v13 + 24)) {
    char v14 = a2;
  }
  else {
    char v14 = 0;
  }
  *(unsigned char *)(v13 + 24) = v14;
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 48) + 8) + 32));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (void)commitAllPropertiesToDatabaseWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_group_t v8 = [(ACHDataStore *)self internalQueue];
  dispatch_assert_queue_not_V2(v8);

  if (!v6)
  {
    id v6 = [MEMORY[0x263F431E0] contextForWritingProtectedData];
  }
  uint64_t v9 = [(ACHDataStore *)self internalQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__ACHDataStore_commitAllPropertiesToDatabaseWithContext_completion___block_invoke;
  block[3] = &unk_264516AB0;
  block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_sync(v9, block);
}

void __68__ACHDataStore_commitAllPropertiesToDatabaseWithContext_completion___block_invoke(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263EFF9A0] dictionary];
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v4 = [*(id *)(a1 + 32) propertyProviders];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v33 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        id v10 = [v9 dataStoreProperties];
        id v11 = [v9 uniqueName];
        [v2 setObject:v10 forKeyedSubscript:v11];

        uint64_t v12 = ACHLegacyKeyValueRepresentationFromProperties();
        if (v12) {
          [v3 addEntriesFromDictionary:v12];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v6);
  }

  id v13 = [*(id *)(a1 + 32) profile];
  id v14 = [v13 database];
  uint64_t v15 = (void *)[*(id *)(a1 + 40) copyForWritingProtectedData];
  id v31 = 0;
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __68__ACHDataStore_commitAllPropertiesToDatabaseWithContext_completion___block_invoke_2;
  v27[3] = &unk_264516AD8;
  id v16 = v2;
  uint64_t v17 = *(void *)(a1 + 32);
  id v28 = v16;
  uint64_t v29 = v17;
  id v18 = v3;
  id v30 = v18;
  char v19 = [v14 performTransactionWithContext:v15 error:&v31 block:v27 inaccessibilityHandler:0];
  id v20 = v31;

  long long v21 = *(void **)(a1 + 48);
  if (v21)
  {
    uint64_t v22 = dispatch_get_global_queue(21, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __68__ACHDataStore_commitAllPropertiesToDatabaseWithContext_completion___block_invoke_3;
    block[3] = &unk_264516FD0;
    id v25 = v21;
    char v26 = v19;
    id v24 = v20;
    dispatch_async(v22, block);
  }
}

uint64_t __68__ACHDataStore_commitAllPropertiesToDatabaseWithContext_completion___block_invoke_2(id *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v5 = objc_msgSend(a1[4], "allKeys", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        id v11 = [a1[4] objectForKeyedSubscript:v10];
        uint64_t v12 = [a1[5] profile];
        LODWORD(v10) = +[ACHDataStoreSyncEntity setDataStoreValuesWithDictionary:v11 domain:v10 profile:v12 error:a3];

        if (!v10)
        {

          return 0;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  if ([a1[6] count]
    && (id v13 = a1[6],
        [a1[5] profile],
        id v14 = objc_claimAutoreleasedReturnValue(),
        BOOL v15 = +[ACHBackCompatLegacyAchievementKeyValueSyncEntity setLegacyDataStoreValuesWithDictionary:v13 profile:v14 error:a3], v14, !v15))
  {
    return 0;
  }
  else
  {
    return 1;
  }
}

uint64_t __68__ACHDataStore_commitAllPropertiesToDatabaseWithContext_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (BOOL)commitAllPropertiesWithError:(id *)a3
{
  uint64_t v5 = [(ACHDataStore *)self internalQueue];
  dispatch_assert_queue_not_V2(v5);

  uint64_t v16 = 0;
  long long v17 = &v16;
  uint64_t v18 = 0x3032000000;
  long long v19 = __Block_byref_object_copy__21;
  long long v20 = __Block_byref_object_dispose__21;
  id v21 = 0;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 1;
  uint64_t v6 = [(ACHDataStore *)self internalQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__ACHDataStore_commitAllPropertiesWithError___block_invoke;
  block[3] = &unk_264516BE0;
  void block[4] = self;
  void block[5] = &v16;
  void block[6] = &v12;
  dispatch_sync(v6, block);

  id v7 = (id)v17[5];
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

  char v9 = *((unsigned char *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);

  return v9;
}

void __45__ACHDataStore_commitAllPropertiesWithError___block_invoke(uint64_t a1)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) propertyProviders];
  uint64_t v3 = [v2 count];

  if (v3)
  {
    long long v4 = [MEMORY[0x263EFF9A0] dictionary];
    uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
    uint64_t v6 = [*(id *)(a1 + 32) assertionClient];
    id v42 = 0;
    id v7 = [v6 acquireDatabaseAssertionWithIdentifier:&stru_26D0FD8F8 error:&v42];
    id v8 = v42;

    if (v8)
    {
      char v9 = ACHLogDatabase();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        __45__ACHDataStore_commitAllPropertiesWithError___block_invoke_cold_2();
      }

      uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
      id v11 = v8;
      id v12 = *(id *)(v10 + 40);
      *(void *)(v10 + 40) = v11;
    }
    else
    {
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id v13 = [*(id *)(a1 + 32) propertyProviders];
      uint64_t v14 = [v13 countByEnumeratingWithState:&v38 objects:v43 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v39;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v39 != v16) {
              objc_enumerationMutation(v13);
            }
            uint64_t v18 = *(void **)(*((void *)&v38 + 1) + 8 * i);
            long long v19 = [v18 dataStoreProperties];
            long long v20 = [v18 uniqueName];
            [v4 setObject:v19 forKeyedSubscript:v20];

            id v21 = ACHLegacyKeyValueRepresentationFromProperties();
            if (v21) {
              [v5 addEntriesFromDictionary:v21];
            }
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v38 objects:v43 count:16];
        }
        while (v15);
      }

      uint64_t v22 = [*(id *)(a1 + 32) keyValueClient];
      id v37 = 0;
      char v23 = [v22 setValuesWithDomainDictionary:v4 error:&v37];
      id v12 = v37;

      id v24 = [*(id *)(a1 + 32) keyValueClient];
      id v36 = 0;
      char v25 = [v24 setLegacyValuesWithDictionary:v5 error:&v36];
      id v26 = v36;

      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v23 & v25;
      if (v12) {
        id v27 = v12;
      }
      else {
        id v27 = v26;
      }
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v27);
      id v28 = [*(id *)(a1 + 32) assertionClient];
      id v35 = 0;
      [v28 invalidateAssertionWithToken:v7 error:&v35];
      id v11 = v35;

      if (v11)
      {
        uint64_t v29 = ACHLogDatabase();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
          __45__ACHDataStore_commitAllPropertiesWithError___block_invoke_cold_1();
        }

        uint64_t v30 = *(void *)(*(void *)(a1 + 40) + 8);
        long long v33 = *(void **)(v30 + 40);
        id v31 = (id *)(v30 + 40);
        long long v32 = v33;
        if (v33) {
          long long v34 = v32;
        }
        else {
          long long v34 = v11;
        }
        objc_storeStrong(v31, v34);
      }
    }
  }
}

- (BOOL)commitPropertiesForProvider:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  id v7 = [(ACHDataStore *)self internalQueue];
  dispatch_assert_queue_not_V2(v7);

  uint64_t v22 = 0;
  char v23 = &v22;
  uint64_t v24 = 0x3032000000;
  char v25 = __Block_byref_object_copy__21;
  id v26 = __Block_byref_object_dispose__21;
  id v27 = 0;
  uint64_t v18 = 0;
  long long v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 1;
  id v8 = [(ACHDataStore *)self internalQueue];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __54__ACHDataStore_commitPropertiesForProvider_withError___block_invoke;
  v14[3] = &unk_264516730;
  v14[4] = self;
  uint64_t v16 = &v22;
  id v9 = v6;
  id v15 = v9;
  long long v17 = &v18;
  dispatch_sync(v8, v14);

  id v10 = (id)v23[5];
  id v11 = v10;
  if (v10)
  {
    if (a4) {
      *a4 = v10;
    }
    else {
      _HKLogDroppedError();
    }
  }

  char v12 = *((unsigned char *)v19 + 24);
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);

  return v12;
}

void __54__ACHDataStore_commitPropertiesForProvider_withError___block_invoke(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) propertyProviders];
  uint64_t v3 = [v2 count];

  if (v3)
  {
    long long v4 = [*(id *)(a1 + 32) assertionClient];
    id v32 = 0;
    uint64_t v5 = [v4 acquireDatabaseAssertionWithIdentifier:@"com.apple.activityawardsd.ACHDataStoreCommit" error:&v32];
    id v6 = v32;

    if (v6)
    {
      id v7 = ACHLogDatabase();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        __45__ACHDataStore_commitAllPropertiesWithError___block_invoke_cold_2();
      }

      uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
      id v9 = v6;
      id v10 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v9;
    }
    else
    {
      id v10 = [*(id *)(a1 + 40) dataStoreProperties];
      id v11 = ACHLegacyKeyValueRepresentationFromProperties();
      char v12 = ACHLogDatabase();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        id v13 = [*(id *)(a1 + 40) uniqueName];
        *(_DWORD *)buf = 138412546;
        id v36 = v13;
        __int16 v37 = 2112;
        long long v38 = v10;
        _os_log_impl(&dword_21F5DA000, v12, OS_LOG_TYPE_DEFAULT, "Commiting properties [%@]: %@", buf, 0x16u);
      }
      uint64_t v14 = [*(id *)(a1 + 32) keyValueClient];
      id v15 = [*(id *)(a1 + 40) uniqueName];
      long long v33 = v15;
      long long v34 = v10;
      uint64_t v16 = [NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
      id v31 = 0;
      char v17 = [v14 setValuesWithDomainDictionary:v16 error:&v31];
      id v18 = v31;

      long long v19 = [*(id *)(a1 + 32) keyValueClient];
      id v30 = 0;
      LOBYTE(v16) = [v19 setLegacyValuesWithDictionary:v11 error:&v30];
      id v20 = v30;

      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v17 & v16;
      if (v18) {
        char v21 = v18;
      }
      else {
        char v21 = v20;
      }
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v21);
      uint64_t v22 = [*(id *)(a1 + 32) assertionClient];
      id v29 = 0;
      [v22 invalidateAssertionWithToken:v5 error:&v29];
      id v9 = v29;

      if (v9)
      {
        char v23 = ACHLogDatabase();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          __45__ACHDataStore_commitAllPropertiesWithError___block_invoke_cold_1();
        }

        uint64_t v24 = *(void *)(*(void *)(a1 + 48) + 8);
        id v27 = *(void **)(v24 + 40);
        char v25 = (id *)(v24 + 40);
        id v26 = v27;
        if (v27) {
          id v28 = v26;
        }
        else {
          id v28 = v9;
        }
        objc_storeStrong(v25, v28);
      }
    }
  }
}

- (BOOL)_queue_populateAllPropertiesFromDatabase
{
  uint64_t v3 = [(ACHDataStore *)self internalQueue];
  dispatch_assert_queue_V2(v3);

  long long v4 = [(ACHDataStore *)self injectedError];
  uint64_t v5 = [(ACHDataStore *)self propertyProviders];
  id v6 = [v5 allObjects];
  id v14 = v4;
  BOOL v7 = [(ACHDataStore *)self _queue_populateFromDatabaseForProviders:v6 error:&v14];
  id v8 = v14;

  id v9 = ACHLogDatabase();
  id v10 = v9;
  if (v7)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21F5DA000, v10, OS_LOG_TYPE_DEFAULT, "Data store population complete, notifying observers", buf, 2u);
    }

    id v10 = [(ACHDataStore *)self notificationQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __56__ACHDataStore__queue_populateAllPropertiesFromDatabase__block_invoke;
    block[3] = &unk_264515DB8;
    void block[4] = self;
    dispatch_async(v10, block);
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    -[ACHDataStore _queue_populateAllPropertiesFromDatabase]();
  }

  return v7;
}

void __56__ACHDataStore__queue_populateAllPropertiesFromDatabase__block_invoke(uint64_t a1)
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
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) dataStoreDidPopulate:*(void *)(a1 + 32)];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (id)_queue_dictionaryRepresentationOfAllProviderProperties
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(ACHDataStore *)self internalQueue];
  dispatch_assert_queue_V2(v3);

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = [(ACHDataStore *)self propertyProviders];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    long long v8 = (void *)MEMORY[0x263EFFA78];
    do
    {
      uint64_t v9 = 0;
      long long v10 = v8;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        id v11 = [*(id *)(*((void *)&v14 + 1) + 8 * v9) dataStoreProperties];
        uint64_t v12 = (void *)[v10 mutableCopy];
        [v12 addEntriesFromDictionary:v11];
        long long v8 = (void *)[v12 copy];

        ++v9;
        long long v10 = v8;
      }
      while (v6 != v9);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
  else
  {
    long long v8 = (void *)MEMORY[0x263EFFA78];
  }

  return v8;
}

- (id)_queue_allPropertyProviderKeys
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(ACHDataStore *)self internalQueue];
  dispatch_assert_queue_V2(v3);

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [(ACHDataStore *)self propertyProviders];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    long long v8 = (void *)MEMORY[0x263EFFA68];
    do
    {
      uint64_t v9 = 0;
      long long v10 = v8;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        id v11 = [*(id *)(*((void *)&v13 + 1) + 8 * v9) dataStorePropertyKeys];
        long long v8 = [v10 arrayByAddingObjectsFromArray:v11];

        ++v9;
        long long v10 = v8;
      }
      while (v6 != v9);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
  else
  {
    long long v8 = (void *)MEMORY[0x263EFFA68];
  }

  return v8;
}

- (BOOL)_queue_setDatabaseIdentifier:(id)a3 error:(id *)a4
{
  id v7 = a3;
  long long v8 = [(ACHDataStore *)self internalQueue];
  dispatch_assert_queue_V2(v8);

  uint64_t v9 = [(ACHDataStore *)self defaultsDomain];
  long long v10 = NSStringFromSelector(sel_databaseIdentifier);
  int v11 = [v9 setString:v7 forKey:v10 error:a4];

  if (v11) {
    objc_storeStrong((id *)&self->_databaseIdentifier, a3);
  }

  return v11;
}

- (BOOL)_queue_populateFromDatabaseForProviders:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(ACHDataStore *)self healthStore];

  if (v7) {
    BOOL v8 = [(ACHDataStore *)self _queue_healthStore_populateFromDatabaseForProviders:v6 error:a4];
  }
  else {
    BOOL v8 = [(ACHDataStore *)self _queue_daemon_populateFromDatabaseForProviders:v6 error:a4];
  }
  BOOL v9 = v8;

  return v9;
}

- (BOOL)_queue_healthStore_populateFromDatabaseForProviders:(id)a3 error:(id *)a4
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(ACHDataStore *)self internalQueue];
  dispatch_assert_queue_V2(v7);

  BOOL v8 = [(ACHDataStore *)self keyValueClient];
  int v9 = [v8 protectedDataAvailable];

  if (v9)
  {
    long long v10 = [(ACHDataStore *)self assertionClient];
    id v41 = 0;
    int v11 = [v10 acquireDatabaseAssertionWithIdentifier:@"Populate" error:&v41];
    id v12 = v41;

    if (v12)
    {
      long long v13 = ACHLogXPC();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[ACHDataStore _queue_healthStore_populateFromDatabaseForProviders:error:]();
      }
      LOBYTE(v9) = 0;
    }
    else
    {
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v14 = v6;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v37 objects:v42 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        id v31 = a4;
        id v32 = v11;
        id v33 = v6;
        obuint64_t j = v14;
        uint64_t v17 = *(void *)v38;
        while (2)
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v38 != v17) {
              objc_enumerationMutation(obj);
            }
            uint64_t v19 = *(void **)(*((void *)&v37 + 1) + 8 * i);
            id v20 = [(ACHDataStore *)self keyValueClient];
            char v21 = [v19 dataStorePropertyKeys];
            uint64_t v22 = [v19 uniqueName];
            id v36 = 0;
            char v23 = [v20 valuesForKeys:v21 domain:v22 error:&v36];
            id v24 = v36;

            if (v24)
            {

              char v25 = v24;
              long long v14 = v25;
              if (v31)
              {
                long long v14 = v25;
                int v9 = 0;
                *id v31 = v14;
              }
              else
              {
                _HKLogDroppedError();
                int v9 = 0;
              }
              long long v13 = v14;
              goto LABEL_20;
            }
            [v19 setDataStoreProperties:v23];
          }
          long long v14 = obj;
          uint64_t v16 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
          if (v16) {
            continue;
          }
          break;
        }
        long long v13 = 0;
        int v9 = 1;
LABEL_20:
        int v11 = v32;
        id v6 = v33;
      }
      else
      {
        long long v13 = 0;
        int v9 = 1;
      }

      id v26 = [(ACHDataStore *)self assertionClient];
      id v35 = 0;
      [v26 invalidateAssertionWithToken:v11 error:&v35];
      id v12 = v35;

      if (v12)
      {
        id v27 = ACHLogDatabase();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
          __45__ACHDataStore_commitAllPropertiesWithError___block_invoke_cold_1();
        }
      }
      if (v9)
      {
        [(ACHDataStore *)self setHasCompletedFirstPopulateFromDatabase:1];
        id v28 = [(ACHDataStore *)self populationCompleteBlock];

        if (v28)
        {
          id v29 = [(ACHDataStore *)self populationCompleteBlock];
          [(ACHDataStore *)self setPopulationCompleteBlock:0];
          v29[2](v29);
        }
      }
    }
  }
  return v9;
}

- (BOOL)_queue_daemon_populateFromDatabaseForProviders:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(ACHDataStore *)self internalQueue];
  dispatch_assert_queue_V2(v7);

  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__21;
  void v22[4] = __Block_byref_object_dispose__21;
  id v23 = (id)MEMORY[0x263EFFA68];
  BOOL v8 = (void *)MEMORY[0x263F432E0];
  int v9 = [(ACHDataStore *)self profile];
  long long v10 = [v9 database];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __69__ACHDataStore__queue_daemon_populateFromDatabaseForProviders_error___block_invoke;
  v18[3] = &unk_264516CA0;
  id v11 = v6;
  id v19 = v11;
  id v20 = self;
  char v21 = v22;
  int v12 = [v8 performReadTransactionWithHealthDatabase:v10 error:a4 block:v18];

  if (v12)
  {
    long long v13 = dispatch_get_global_queue(21, 0);
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __69__ACHDataStore__queue_daemon_populateFromDatabaseForProviders_error___block_invoke_2;
    v17[3] = &unk_2645177A8;
    v17[4] = v22;
    dispatch_async(v13, v17);

    [(ACHDataStore *)self setHasCompletedFirstPopulateFromDatabase:1];
    long long v14 = [(ACHDataStore *)self populationCompleteBlock];

    if (v14)
    {
      uint64_t v15 = [(ACHDataStore *)self populationCompleteBlock];
      [(ACHDataStore *)self setPopulationCompleteBlock:0];
      v15[2](v15);
    }
  }

  _Block_object_dispose(v22, 8);
  return v12;
}

uint64_t __69__ACHDataStore__queue_daemon_populateFromDatabaseForProviders_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v34 = a2;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  uint64_t v36 = a1;
  id v5 = *(id *)(a1 + 32);
  uint64_t v31 = [v5 countByEnumeratingWithState:&v44 objects:v51 count:16];
  if (v31)
  {
    uint64_t v6 = *(void *)v45;
    id v7 = (void *)MEMORY[0x263EFFA78];
    id v33 = v5;
    uint64_t v30 = *(void *)v45;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v45 != v6) {
          objc_enumerationMutation(v5);
        }
        uint64_t v32 = v8;
        int v9 = *(void **)(*((void *)&v44 + 1) + 8 * v8);
        long long v40 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        long long v37 = v9;
        obuint64_t j = [v9 dataStorePropertyKeys];
        uint64_t v10 = [obj countByEnumeratingWithState:&v40 objects:v50 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v41;
          while (2)
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v41 != v12) {
                objc_enumerationMutation(obj);
              }
              uint64_t v14 = *(void *)(*((void *)&v40 + 1) + 8 * i);
              uint64_t v15 = [v37 uniqueName];
              uint64_t v16 = [*(id *)(v36 + 40) profile];
              uint64_t v17 = +[ACHDataStoreSyncEntity dataStoreValueForKey:v14 domain:v15 profile:v16 error:a3];

              if (v17)
              {
                uint64_t v48 = v14;
                v49 = v17;
                id v18 = [NSDictionary dictionaryWithObjects:&v49 forKeys:&v48 count:1];
                id v19 = (void *)[v7 mutableCopy];
                [v19 addEntriesFromDictionary:v18];

                uint64_t v20 = [v19 copy];
                id v7 = (void *)v20;
              }
              if (*a3)
              {
                id v28 = ACHLogDatabase();
                if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
                  __69__ACHDataStore__queue_daemon_populateFromDatabaseForProviders_error___block_invoke_cold_1();
                }

                uint64_t v27 = 0;
                id v5 = v33;
                goto LABEL_23;
              }
            }
            uint64_t v11 = [obj countByEnumeratingWithState:&v40 objects:v50 count:16];
            if (v11) {
              continue;
            }
            break;
          }
        }

        char v21 = *(void **)(*(void *)(*(void *)(v36 + 48) + 8) + 40);
        v38[0] = MEMORY[0x263EF8330];
        v38[1] = 3221225472;
        v38[2] = __69__ACHDataStore__queue_daemon_populateFromDatabaseForProviders_error___block_invoke_326;
        v38[3] = &unk_264515DE0;
        v38[4] = v37;
        id v39 = v7;
        id v22 = v7;
        id v23 = (void *)MEMORY[0x223C507A0](v38);
        uint64_t v24 = [v21 arrayByAddingObject:v23];
        uint64_t v25 = *(void *)(*(void *)(v36 + 48) + 8);
        id v26 = *(void **)(v25 + 40);
        *(void *)(v25 + 40) = v24;

        uint64_t v8 = v32 + 1;
        id v5 = v33;
        uint64_t v6 = v30;
        id v7 = (void *)MEMORY[0x263EFFA78];
      }
      while (v32 + 1 != v31);
      uint64_t v27 = 1;
      uint64_t v31 = [v33 countByEnumeratingWithState:&v44 objects:v51 count:16];
    }
    while (v31);
  }
  else
  {
    uint64_t v27 = 1;
  }
LABEL_23:

  return v27;
}

uint64_t __69__ACHDataStore__queue_daemon_populateFromDatabaseForProviders_error___block_invoke_326(uint64_t a1)
{
  return [*(id *)(a1 + 32) setDataStoreProperties:*(void *)(a1 + 40)];
}

void __69__ACHDataStore__queue_daemon_populateFromDatabaseForProviders_error___block_invoke_2(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v1 = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v6 + 1) + 8 * v5) + 16))(*(void *)(*((void *)&v6 + 1) + 8 * v5));
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  if ([v4 conformsToProtocol:&unk_26D125BE8])
  {
    uint64_t v5 = [(ACHDataStore *)self notificationQueue];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __28__ACHDataStore_addObserver___block_invoke;
    v7[3] = &unk_264515DE0;
    void v7[4] = self;
    id v8 = v4;
    dispatch_sync(v5, v7);
  }
  else
  {
    long long v6 = ACHLogDefault();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[ACHDataStore addObserver:]();
    }
  }
}

uint64_t __28__ACHDataStore_addObserver___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) observers];
  [v2 addObject:*(void *)(a1 + 40)];

  uint64_t result = [*(id *)(a1 + 32) hasCompletedFirstPopulateFromDatabase];
  if (result)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v4 = *(void **)(a1 + 40);
    return [v4 dataStoreDidPopulate:v5];
  }
  return result;
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ACHDataStore *)self notificationQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __31__ACHDataStore_removeObserver___block_invoke;
  v7[3] = &unk_264515DE0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __31__ACHDataStore_removeObserver___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) observers];
  int v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) observers];
    [v4 removeObject:*(void *)(a1 + 40)];
  }
}

- (BOOL)_forceDatabasePopulate
{
  uint64_t v2 = self;
  uint64_t v6 = 0;
  long long v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  int v3 = [(ACHDataStore *)self internalQueue];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __38__ACHDataStore__forceDatabasePopulate__block_invoke;
  v5[3] = &unk_264516580;
  void v5[4] = v2;
  void v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __38__ACHDataStore__forceDatabasePopulate__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_queue_populateAllPropertiesFromDatabase");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (ACHAwardsKeyValueClient)keyValueClient
{
  return self->_keyValueClient;
}

- (void)setKeyValueClient:(id)a3
{
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
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

- (HDKeyValueDomain)defaultsDomain
{
  return self->_defaultsDomain;
}

- (void)setDefaultsDomain:(id)a3
{
}

- (BOOL)needsPopulationWhenProtectedDataAvailable
{
  return self->_needsPopulationWhenProtectedDataAvailable;
}

- (void)setNeedsPopulationWhenProtectedDataAvailable:(BOOL)a3
{
  self->_needsPopulationWhenProtectedDataAvailable = a3;
}

- (BOOL)hasCompletedFirstPopulateFromDatabase
{
  return self->_hasCompletedFirstPopulateFromDatabase;
}

- (void)setHasCompletedFirstPopulateFromDatabase:(BOOL)a3
{
  self->_hasCompletedFirstPopulateFromDatabase = a3;
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (void)setInternalQueue:(id)a3
{
}

- (OS_dispatch_queue)notificationQueue
{
  return self->_notificationQueue;
}

- (void)setNotificationQueue:(id)a3
{
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (NSError)injectedError
{
  return self->_injectedError;
}

- (void)setInjectedError:(id)a3
{
}

- (id)populationCompleteBlock
{
  return self->_populationCompleteBlock;
}

- (void)setPopulationCompleteBlock:(id)a3
{
}

- (NSHashTable)propertyProviders
{
  return self->_propertyProviders;
}

- (void)setPropertyProviders:(id)a3
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

- (int)syncToken
{
  return self->_syncToken;
}

- (void)setSyncToken:(int)a3
{
  self->_syncToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyProviders, 0);
  objc_storeStrong(&self->_populationCompleteBlock, 0);
  objc_storeStrong((id *)&self->_injectedError, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_defaultsDomain, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_assertionClient, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_keyValueClient, 0);
  objc_storeStrong((id *)&self->_databaseIdentifier, 0);
}

void __34__ACHDataStore_databaseIdentifier__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_21F5DA000, log, OS_LOG_TYPE_ERROR, "Error: No database identifier", v1, 2u);
}

void __34__ACHDataStore_databaseIdentifier__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21F5DA000, v0, v1, "Error fetching database identifier from local defaults store: %@", v2, v3, v4, v5, v6);
}

void __38__ACHDataStore_setDatabaseIdentifier___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21F5DA000, v0, v1, "Error setting database identifier: %@", v2, v3, v4, v5, v6);
}

void __52__ACHDataStore_clearAllInMemoryPropertiesWithError___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_21F5DA000, log, OS_LOG_TYPE_ERROR, "OHNO: Max wait time reached in dispatch group for clearing in memory properties for all providers.", v1, 2u);
}

void __52__ACHDataStore_clearAllInMemoryPropertiesWithError___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21F5DA000, v0, v1, "%@", v2, v3, v4, v5, v6);
}

void __45__ACHDataStore_commitAllPropertiesWithError___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21F5DA000, v0, v1, "Error invalidating assertion: %@", v2, v3, v4, v5, v6);
}

void __45__ACHDataStore_commitAllPropertiesWithError___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21F5DA000, v0, v1, "Error getting assertion: %@", v2, v3, v4, v5, v6);
}

- (void)_queue_populateAllPropertiesFromDatabase
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21F5DA000, v0, v1, "Error populating data store properties: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_queue_healthStore_populateFromDatabaseForProviders:error:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21F5DA000, v0, v1, "Error acquiring assertion: %@", v2, v3, v4, v5, v6);
}

void __69__ACHDataStore__queue_daemon_populateFromDatabaseForProviders_error___block_invoke_cold_1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  __int16 v3 = 2114;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_21F5DA000, v1, OS_LOG_TYPE_ERROR, "Error pulling value from database for key %@: %{public}@", v2, 0x16u);
}

- (void)addObserver:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21F5DA000, v0, v1, "Data store did not add observer %@ since it doesn't conform to the observer protocol.", v2, v3, v4, v5, v6);
}

@end