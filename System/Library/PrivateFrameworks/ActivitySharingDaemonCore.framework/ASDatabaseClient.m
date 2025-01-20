@interface ASDatabaseClient
- (ASDatabaseClient)initWithHealthStore:(id)a3;
- (ASDatabaseClient)initWithHealthStore:(id)a3 profile:(id)a4;
- (ASDatabaseClient)initWithProfile:(id)a3;
- (BOOL)deleteDataObjectsOfType:(id)a3 predicate:(id)a4 limit:(unint64_t)a5 deletedSampleCount:(unint64_t *)a6 notifyObservers:(BOOL)a7 generateDeletedObjects:(BOOL)a8 error:(id *)a9;
- (BOOL)enumerateActivitySharingAchievementsWithPredicate:(id)a3 anchor:(id *)a4 error:(id *)a5 handler:(id)a6;
- (BOOL)enumerateActivitySharingSnapshotsWithPredicate:(id)a3 anchor:(id *)a4 error:(id *)a5 handler:(id)a6;
- (BOOL)enumerateActivitySharingWorkoutsWithPredicate:(id)a3 anchor:(id *)a4 error:(id *)a5 handler:(id)a6;
- (BOOL)enumerateAllActivitySharingSamplesWithPredicate:(id)a3 error:(id *)a4 handler:(id)a5;
- (BOOL)insertDataObjects:(id)a3 error:(id *)a4;
- (BOOL)isDataProtectedByFirstUnlockAvailable;
- (BOOL)isProtectedDataAvailable;
- (BOOL)performDatabaseCompetitionWriteTransactionBlock:(id)a3 error:(id *)a4;
- (BOOL)removeAllCodableDatabaseCompetitionListsWithError:(id *)a3;
- (BOOL)removeAllCodableDatabaseCompetitionsWithError:(id *)a3;
- (BOOL)removeCodableDatabaseCompetitionsWithFriendUUID:(id)a3 type:(int64_t)a4 error:(id *)a5;
- (BOOL)saveCodableDatabaseCompetitionListEntry:(id)a3 error:(id *)a4;
- (BOOL)saveCodableDatabaseCompetitions:(id)a3 error:(id *)a4;
- (id)activeDeviceUUIDWithError:(id *)a3;
- (id)allCodableDatabaseCompetitionListEntriesWithError:(id *)a3;
- (id)allCodableDatabaseCompetitionsWithError:(id *)a3;
- (id)deletedHealthKitWorkoutsWithinLastNumberOfDays:(unint64_t)a3 maxBatchSize:(unint64_t)a4 anchor:(id *)a5 error:(id *)a6;
- (id)exportedInterface;
- (id)healthKitWorkoutsWithPredicate:(id)a3 anchor:(id *)a4 error:(id *)a5;
- (id)localSourceUUIDWithError:(id *)a3;
- (id)makeASKeyValueDomainWithDomainName:(id)a3 category:(int64_t)a4;
- (id)todayActivitySummary;
- (id)yesterdayActivitySummary;
- (unint64_t)badgeCount;
- (void)_handleCurrentActivitySummary:(id)a3;
- (void)_handleNanoAlertSuppressionInvalidatedNotification:(id)a3;
- (void)_handleProtectedDataAvailabilityDidChangeNotification:(id)a3;
- (void)addCurrentActivitySummaryObserver:(id)a3;
- (void)addNanoAlertSuppressionObserver:(id)a3;
- (void)addProtectedDataObserver:(id)a3;
- (void)addSampleObserver:(id)a3 sampleTypes:(id)a4;
- (void)daemonReady:(id)a3;
- (void)dealloc;
- (void)isActivityAlertSuppressionEnabledWithCompletion:(id)a3;
- (void)performWhenDaemonReady:(id)a3;
- (void)performWhenDataProtectedByFirstUnlockIsAvailable:(id)a3;
- (void)registerFitnessAppBadgeProvider;
- (void)removeCurrentActivitySummaryObserver:(id)a3;
- (void)removeNanoAlertSuppressionObserver:(id)a3;
- (void)removeProtectedDataObserver:(id)a3;
- (void)removeSampleObserver:(id)a3 sampleTypes:(id)a4;
- (void)updateFitnessAppBadgeCount:(unint64_t)a3;
@end

@implementation ASDatabaseClient

- (ASDatabaseClient)initWithHealthStore:(id)a3
{
  id v4 = a3;
  v5 = [(ASDatabaseClient *)self initWithHealthStore:v4 profile:0];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x263F0A818]);
    v7 = ASDatabaseServerTaskIdentifier();
    v8 = [MEMORY[0x263F08C38] UUID];
    uint64_t v9 = [v6 initWithHealthStore:v4 taskIdentifier:v7 exportedObject:v5 taskUUID:v8];
    proxyProvider = v5->_proxyProvider;
    v5->_proxyProvider = (HKProxyProvider *)v9;

    uint64_t v11 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    protectedDataAvailableObservers = v5->_protectedDataAvailableObservers;
    v5->_protectedDataAvailableObservers = (NSHashTable *)v11;

    uint64_t v13 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    currentActivitySummaryObservers = v5->_currentActivitySummaryObservers;
    v5->_currentActivitySummaryObservers = (NSHashTable *)v13;

    uint64_t v15 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    nanoAlertSuppressionObservers = v5->_nanoAlertSuppressionObservers;
    v5->_nanoAlertSuppressionObservers = (NSHashTable *)v15;

    objc_initWeak(&location, v5);
    id v17 = objc_alloc(MEMORY[0x263F0A988]);
    uint64_t v25 = MEMORY[0x263EF8330];
    uint64_t v26 = 3221225472;
    v27 = __40__ASDatabaseClient_initWithHealthStore___block_invoke;
    v28 = &unk_2652156B0;
    objc_copyWeak(&v29, &location);
    uint64_t v18 = [v17 initWithUpdateHandler:&v25];
    currentActivitySummaryQuery = v5->_currentActivitySummaryQuery;
    v5->_currentActivitySummaryQuery = (_HKCurrentActivitySummaryQuery *)v18;

    objc_msgSend(v4, "executeQuery:", v5->_currentActivitySummaryQuery, v25, v26, v27, v28);
    v20 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    observerAnchoredObjectQueryMap = v5->_observerAnchoredObjectQueryMap;
    v5->_observerAnchoredObjectQueryMap = v20;

    v22 = [MEMORY[0x263F087C8] defaultCenter];
    [v22 addObserver:v5 selector:sel__handleProtectedDataAvailabilityDidChangeNotification_ name:*MEMORY[0x263F23D78] object:0];

    v23 = [MEMORY[0x263F087C8] defaultCenter];
    [v23 addObserver:v5 selector:sel__handleNanoAlertSuppressionInvalidatedNotification_ name:*MEMORY[0x263F3D190] object:0];

    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }

  return v5;
}

void __40__ASDatabaseClient_initWithHealthStore___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v3 = (id *)(a1 + 32);
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _handleCurrentActivitySummary:v4];
}

- (ASDatabaseClient)initWithProfile:(id)a3
{
  v3 = [(ASDatabaseClient *)self initWithHealthStore:0 profile:a3];
  id v4 = v3;
  if (v3)
  {
    v5 = [(HDProfile *)v3->_profile daemon];
    [v5 registerDaemonReadyObserver:v4 queue:v4->_queue];
  }
  return v4;
}

- (ASDatabaseClient)initWithHealthStore:(id)a3 profile:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)ASDatabaseClient;
  uint64_t v9 = [(ASDatabaseClient *)&v20 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_healthStore, a3);
    objc_storeStrong((id *)&v10->_profile, a4);
    v10->_isDaemonReady = 0;
    v10->_fitnessAppBadgeCount = 0;
    uint64_t v11 = HKCreateSerialDispatchQueue();
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v11;

    uint64_t v13 = HKCreateSerialDispatchQueue();
    observerQueue = v10->_observerQueue;
    v10->_observerQueue = (OS_dispatch_queue *)v13;

    uint64_t v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    queue_performWhenDaemonReadyBlocks = v10->_queue_performWhenDaemonReadyBlocks;
    v10->_queue_performWhenDaemonReadyBlocks = v15;

    id v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    queue_performWhenProtectedDataDidBecomeAvailableBlocks = v10->_queue_performWhenProtectedDataDidBecomeAvailableBlocks;
    v10->_queue_performWhenProtectedDataDidBecomeAvailableBlocks = v17;
  }
  return v10;
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  [(HKHealthStore *)self->_healthStore stopQuery:self->_currentActivitySummaryQuery];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v3 = [(NSMutableDictionary *)self->_observerAnchoredObjectQueryMap allValues];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [(HKHealthStore *)self->_healthStore stopQuery:*(void *)(*((void *)&v9 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)ASDatabaseClient;
  [(ASDatabaseClient *)&v8 dealloc];
}

- (void)performWhenDaemonReady:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (self->_profile)
  {
    queue = self->_queue;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __43__ASDatabaseClient_performWhenDaemonReady___block_invoke_301;
    v9[3] = &unk_265215728;
    v9[4] = self;
    id v10 = v4;
    dispatch_async(queue, v9);
    uint64_t v7 = v10;
  }
  else
  {
    proxyProvider = self->_proxyProvider;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __43__ASDatabaseClient_performWhenDaemonReady___block_invoke;
    v12[3] = &unk_2652156D8;
    id v13 = v4;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __43__ASDatabaseClient_performWhenDaemonReady___block_invoke_2;
    v11[3] = &unk_265215700;
    v11[4] = self;
    [(HKProxyProvider *)proxyProvider getSynchronousProxyWithHandler:v12 errorHandler:v11];
    uint64_t v7 = v13;
  }
}

uint64_t __43__ASDatabaseClient_performWhenDaemonReady___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_performWhenDaemonReady:", *(void *)(a1 + 32));
}

void __43__ASDatabaseClient_performWhenDaemonReady___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  ASLoggingInitialize();
  id v4 = (void *)*MEMORY[0x263F23AC0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC0], OS_LOG_TYPE_ERROR)) {
    __43__ASDatabaseClient_performWhenDaemonReady___block_invoke_2_cold_1(a1, v4);
  }
}

void __43__ASDatabaseClient_performWhenDaemonReady___block_invoke_301(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 48))
  {
    v2 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v2();
  }
  else
  {
    id v3 = *(void **)(v1 + 56);
    id v4 = (id)MEMORY[0x24C557E50](*(void *)(a1 + 40));
    [v3 addObject:v4];
  }
}

- (BOOL)isDataProtectedByFirstUnlockAvailable
{
  if (self->_profile)
  {
    v2 = [(HDProfile *)self->_profile database];
    char v3 = [v2 isDataProtectedByFirstUnlockAvailable];

    return v3;
  }
  else
  {
    uint64_t v9 = 0;
    id v10 = &v9;
    uint64_t v11 = 0x2020000000;
    char v12 = 0;
    proxyProvider = self->_proxyProvider;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __57__ASDatabaseClient_isDataProtectedByFirstUnlockAvailable__block_invoke;
    v8[3] = &unk_265215778;
    v8[4] = &v9;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __57__ASDatabaseClient_isDataProtectedByFirstUnlockAvailable__block_invoke_3;
    v7[3] = &unk_265215700;
    v7[4] = self;
    [(HKProxyProvider *)proxyProvider getSynchronousProxyWithHandler:v8 errorHandler:v7];
    char v6 = *((unsigned char *)v10 + 24);
    _Block_object_dispose(&v9, 8);
    return v6;
  }
}

uint64_t __57__ASDatabaseClient_isDataProtectedByFirstUnlockAvailable__block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __57__ASDatabaseClient_isDataProtectedByFirstUnlockAvailable__block_invoke_2;
  v3[3] = &unk_265215750;
  v3[4] = *(void *)(a1 + 32);
  return objc_msgSend(a2, "remote_isDataProtectedByFirstUnlockAvailableWithCompletion:", v3);
}

uint64_t __57__ASDatabaseClient_isDataProtectedByFirstUnlockAvailable__block_invoke_2(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

void __57__ASDatabaseClient_isDataProtectedByFirstUnlockAvailable__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  ASLoggingInitialize();
  id v4 = (void *)*MEMORY[0x263F23AC0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC0], OS_LOG_TYPE_ERROR)) {
    __43__ASDatabaseClient_performWhenDaemonReady___block_invoke_2_cold_1(a1, v4);
  }
}

- (void)performWhenDataProtectedByFirstUnlockIsAvailable:(id)a3
{
  id v4 = a3;
  profile = self->_profile;
  if (profile)
  {
    char v6 = [(HDProfile *)profile database];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __69__ASDatabaseClient_performWhenDataProtectedByFirstUnlockIsAvailable___block_invoke_304;
    v9[3] = &unk_2652157A0;
    uint64_t v7 = &v10;
    id v10 = v4;
    [v6 performWhenDataProtectedByFirstUnlockIsAvailable:v9];
  }
  else
  {
    proxyProvider = self->_proxyProvider;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __69__ASDatabaseClient_performWhenDataProtectedByFirstUnlockIsAvailable___block_invoke;
    v12[3] = &unk_2652156D8;
    uint64_t v7 = &v13;
    id v13 = v4;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __69__ASDatabaseClient_performWhenDataProtectedByFirstUnlockIsAvailable___block_invoke_2;
    v11[3] = &unk_265215700;
    v11[4] = self;
    [(HKProxyProvider *)proxyProvider getSynchronousProxyWithHandler:v12 errorHandler:v11];
  }
}

uint64_t __69__ASDatabaseClient_performWhenDataProtectedByFirstUnlockIsAvailable___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_performWhenDataProtectedByFirstUnlockIsAvailable:", *(void *)(a1 + 32));
}

void __69__ASDatabaseClient_performWhenDataProtectedByFirstUnlockIsAvailable___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  ASLoggingInitialize();
  id v4 = (void *)*MEMORY[0x263F23AC0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC0], OS_LOG_TYPE_ERROR)) {
    __43__ASDatabaseClient_performWhenDaemonReady___block_invoke_2_cold_1(a1, v4);
  }
}

uint64_t __69__ASDatabaseClient_performWhenDataProtectedByFirstUnlockIsAvailable___block_invoke_304(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)isProtectedDataAvailable
{
  if (self->_profile)
  {
    v2 = [(HDProfile *)self->_profile database];
    char v3 = [v2 isProtectedDataAvailable];

    return v3;
  }
  else
  {
    uint64_t v9 = 0;
    id v10 = &v9;
    uint64_t v11 = 0x2020000000;
    char v12 = 0;
    proxyProvider = self->_proxyProvider;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __44__ASDatabaseClient_isProtectedDataAvailable__block_invoke;
    v8[3] = &unk_265215778;
    v8[4] = &v9;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __44__ASDatabaseClient_isProtectedDataAvailable__block_invoke_3;
    v7[3] = &unk_265215700;
    v7[4] = self;
    [(HKProxyProvider *)proxyProvider getSynchronousProxyWithHandler:v8 errorHandler:v7];
    char v6 = *((unsigned char *)v10 + 24);
    _Block_object_dispose(&v9, 8);
    return v6;
  }
}

uint64_t __44__ASDatabaseClient_isProtectedDataAvailable__block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __44__ASDatabaseClient_isProtectedDataAvailable__block_invoke_2;
  v3[3] = &unk_265215750;
  v3[4] = *(void *)(a1 + 32);
  return objc_msgSend(a2, "remote_isProtectedDataAvailableWithCompletion:", v3);
}

uint64_t __44__ASDatabaseClient_isProtectedDataAvailable__block_invoke_2(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

void __44__ASDatabaseClient_isProtectedDataAvailable__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  ASLoggingInitialize();
  id v4 = (void *)*MEMORY[0x263F23AC0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC0], OS_LOG_TYPE_ERROR)) {
    __43__ASDatabaseClient_performWhenDaemonReady___block_invoke_2_cold_1(a1, v4);
  }
}

- (void)addProtectedDataObserver:(id)a3
{
  id v4 = a3;
  profile = self->_profile;
  if (profile)
  {
    char v6 = [(HDProfile *)profile database];
    [v6 addProtectedDataObserver:v4];
  }
  else
  {
    observerQueue = self->_observerQueue;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __45__ASDatabaseClient_addProtectedDataObserver___block_invoke;
    v8[3] = &unk_2652157C8;
    v8[4] = self;
    id v9 = v4;
    dispatch_async(observerQueue, v8);
  }
}

uint64_t __45__ASDatabaseClient_addProtectedDataObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 72) addObject:*(void *)(a1 + 40)];
}

- (void)removeProtectedDataObserver:(id)a3
{
  id v4 = a3;
  profile = self->_profile;
  if (profile)
  {
    char v6 = [(HDProfile *)profile database];
    [v6 removeProtectedDataObserver:v4];
  }
  else
  {
    observerQueue = self->_observerQueue;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __48__ASDatabaseClient_removeProtectedDataObserver___block_invoke;
    v8[3] = &unk_2652157C8;
    v8[4] = self;
    id v9 = v4;
    dispatch_async(observerQueue, v8);
  }
}

uint64_t __48__ASDatabaseClient_removeProtectedDataObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 72) removeObject:*(void *)(a1 + 40)];
}

- (void)_handleProtectedDataAvailabilityDidChangeNotification:(id)a3
{
  id v4 = [a3 userInfo];
  uint64_t v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F23D80]];
  int v6 = [v5 BOOLValue];

  if (v6)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __74__ASDatabaseClient__handleProtectedDataAvailabilityDidChangeNotification___block_invoke;
    block[3] = &unk_2652157F0;
    block[4] = self;
    dispatch_async(queue, block);
  }
  observerQueue = self->_observerQueue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __74__ASDatabaseClient__handleProtectedDataAvailabilityDidChangeNotification___block_invoke_2;
  v9[3] = &unk_265215818;
  void v9[4] = self;
  char v10 = v6;
  dispatch_async(observerQueue, v9);
}

uint64_t __74__ASDatabaseClient__handleProtectedDataAvailabilityDidChangeNotification___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 64);
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
        (*(void (**)(void))(*(void *)(*((void *)&v8 + 1) + 8 * v6) + 16))(*(void *)(*((void *)&v8 + 1) + 8 * v6));
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 64), "removeAllObjects", (void)v8);
}

void __74__ASDatabaseClient__handleProtectedDataAvailabilityDidChangeNotification___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 72);
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
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "database:protectedDataDidBecomeAvailable:", 0, *(unsigned __int8 *)(a1 + 40), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (id)yesterdayActivitySummary
{
  if (self->_profile)
  {
    id v2 = [(HDProfile *)self->_profile currentActivitySummaryHelper];
    id v3 = [v2 yesterdayActivitySummary];
  }
  else
  {
    uint64_t v8 = 0;
    long long v9 = &v8;
    uint64_t v10 = 0x3032000000;
    long long v11 = __Block_byref_object_copy_;
    uint64_t v12 = __Block_byref_object_dispose_;
    id v13 = 0;
    proxyProvider = self->_proxyProvider;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __44__ASDatabaseClient_yesterdayActivitySummary__block_invoke;
    v7[3] = &unk_265215778;
    v7[4] = &v8;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __44__ASDatabaseClient_yesterdayActivitySummary__block_invoke_3;
    v6[3] = &unk_265215700;
    v6[4] = self;
    [(HKProxyProvider *)proxyProvider getSynchronousProxyWithHandler:v7 errorHandler:v6];
    id v3 = (id)v9[5];
    _Block_object_dispose(&v8, 8);
  }
  return v3;
}

uint64_t __44__ASDatabaseClient_yesterdayActivitySummary__block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __44__ASDatabaseClient_yesterdayActivitySummary__block_invoke_2;
  v3[3] = &unk_265215840;
  v3[4] = *(void *)(a1 + 32);
  return objc_msgSend(a2, "remote_yesterdayActivitySummaryWithCompletion:", v3);
}

void __44__ASDatabaseClient_yesterdayActivitySummary__block_invoke_2(uint64_t a1, void *a2)
{
}

void __44__ASDatabaseClient_yesterdayActivitySummary__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  ASLoggingInitialize();
  uint64_t v4 = (void *)*MEMORY[0x263F23AC0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC0], OS_LOG_TYPE_ERROR)) {
    __43__ASDatabaseClient_performWhenDaemonReady___block_invoke_2_cold_1(a1, v4);
  }
}

- (id)todayActivitySummary
{
  if (self->_profile)
  {
    id v2 = [(HDProfile *)self->_profile currentActivitySummaryHelper];
    id v3 = [v2 todayActivitySummary];
  }
  else
  {
    uint64_t v8 = 0;
    long long v9 = &v8;
    uint64_t v10 = 0x3032000000;
    long long v11 = __Block_byref_object_copy_;
    uint64_t v12 = __Block_byref_object_dispose_;
    id v13 = 0;
    proxyProvider = self->_proxyProvider;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __40__ASDatabaseClient_todayActivitySummary__block_invoke;
    v7[3] = &unk_265215778;
    v7[4] = &v8;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __40__ASDatabaseClient_todayActivitySummary__block_invoke_3;
    v6[3] = &unk_265215700;
    v6[4] = self;
    [(HKProxyProvider *)proxyProvider getSynchronousProxyWithHandler:v7 errorHandler:v6];
    id v3 = (id)v9[5];
    _Block_object_dispose(&v8, 8);
  }
  return v3;
}

uint64_t __40__ASDatabaseClient_todayActivitySummary__block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __40__ASDatabaseClient_todayActivitySummary__block_invoke_2;
  v3[3] = &unk_265215840;
  v3[4] = *(void *)(a1 + 32);
  return objc_msgSend(a2, "remote_todayActivitySummaryWithCompletion:", v3);
}

void __40__ASDatabaseClient_todayActivitySummary__block_invoke_2(uint64_t a1, void *a2)
{
}

void __40__ASDatabaseClient_todayActivitySummary__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  ASLoggingInitialize();
  uint64_t v4 = (void *)*MEMORY[0x263F23AC0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC0], OS_LOG_TYPE_ERROR)) {
    __43__ASDatabaseClient_performWhenDaemonReady___block_invoke_2_cold_1(a1, v4);
  }
}

- (void)addCurrentActivitySummaryObserver:(id)a3
{
  id v4 = a3;
  profile = self->_profile;
  if (profile)
  {
    uint64_t v6 = [(HDProfile *)profile currentActivitySummaryHelper];
    [v6 addObserver:v4];
  }
  else
  {
    long long v7 = [(ASDatabaseClient *)self todayActivitySummary];
    [v4 currentActivitySummaryHelper:0 didUpdateTodayActivitySummary:v7 changedFields:-1];

    uint64_t v8 = [(ASDatabaseClient *)self yesterdayActivitySummary];
    [v4 currentActivitySummaryHelper:0 didUpdateYesterdayActivitySummary:v8 changedFields:-1];

    observerQueue = self->_observerQueue;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __54__ASDatabaseClient_addCurrentActivitySummaryObserver___block_invoke;
    v10[3] = &unk_2652157C8;
    v10[4] = self;
    id v11 = v4;
    dispatch_async(observerQueue, v10);
  }
}

uint64_t __54__ASDatabaseClient_addCurrentActivitySummaryObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 80) addObject:*(void *)(a1 + 40)];
}

- (void)removeCurrentActivitySummaryObserver:(id)a3
{
  id v4 = a3;
  profile = self->_profile;
  if (profile)
  {
    uint64_t v6 = [(HDProfile *)profile currentActivitySummaryHelper];
    [v6 removeObserver:v4];
  }
  else
  {
    observerQueue = self->_observerQueue;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __57__ASDatabaseClient_removeCurrentActivitySummaryObserver___block_invoke;
    v8[3] = &unk_2652157C8;
    v8[4] = self;
    id v9 = v4;
    dispatch_async(observerQueue, v8);
  }
}

uint64_t __57__ASDatabaseClient_removeCurrentActivitySummaryObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 80) removeObject:*(void *)(a1 + 40)];
}

- (void)_handleCurrentActivitySummary:(id)a3
{
  id v4 = a3;
  observerQueue = self->_observerQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __50__ASDatabaseClient__handleCurrentActivitySummary___block_invoke;
  v7[3] = &unk_2652157C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(observerQueue, v7);
}

void __50__ASDatabaseClient__handleCurrentActivitySummary___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 80);
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
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "currentActivitySummaryHelper:didUpdateTodayActivitySummary:changedFields:", 0, *(void *)(a1 + 40), -1, (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (id)healthKitWorkoutsWithPredicate:(id)a3 anchor:(id *)a4 error:(id *)a5
{
  v19[1] = *MEMORY[0x263EF8340];
  if (self->_profile)
  {
    long long v8 = (void *)MEMORY[0x263F43458];
    long long v9 = (void *)MEMORY[0x263F0A598];
    id v10 = a3;
    id v11 = [v9 workoutType];
    profile = self->_profile;
    id v13 = [v10 healthDaemonPredicate];

    uint64_t v14 = [v8 samplesWithType:v11 profile:profile encodingOptions:0 predicate:v13 limit:0 anchor:a4 error:a5];
  }
  else
  {
    uint64_t v15 = (void *)MEMORY[0x263F0A6E8];
    id v16 = a3;
    id v11 = [v15 workoutType];
    v19[0] = v11;
    id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:1];
    id v17 = [v16 healthKitPredicate];

    uint64_t v14 = +[ASDatabaseSampleEntity samplesOfTypes:v13 predicate:v17 healthStore:self->_healthStore anchor:a4 error:a5];
  }
  return v14;
}

- (id)deletedHealthKitWorkoutsWithinLastNumberOfDays:(unint64_t)a3 maxBatchSize:(unint64_t)a4 anchor:(id *)a5 error:(id *)a6
{
  v50[2] = *MEMORY[0x263EF8340];
  if (self->_profile)
  {
    id v11 = [MEMORY[0x263EFF8F0] currentCalendar];
    uint64_t v12 = [MEMORY[0x263EFF910] date];
    id v13 = [v11 dateByAddingUnit:16 value:-(uint64_t)a3 toDate:v12 options:0];

    uint64_t v14 = [MEMORY[0x263F434A0] predicateWithProperty:*MEMORY[0x263F42FD8] greaterThanOrEqualToValue:v13];
    uint64_t v15 = HDDataEntityPredicateForType();
    id v16 = (void *)MEMORY[0x263F434A8];
    v50[0] = v14;
    v50[1] = v15;
    id v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v50 count:2];
    uint64_t v18 = [v16 predicateMatchingAllPredicates:v17];

    v19 = (void *)MEMORY[0x263F43318];
    objc_super v20 = [MEMORY[0x263F0A598] workoutType];
    v21 = [v19 entityEnumeratorWithType:v20 profile:self->_profile];

    [v21 setPredicate:v18];
    [v21 setAnchor:*a5];
    [v21 setLimitCount:a4];
    uint64_t v44 = 0;
    v45 = &v44;
    uint64_t v46 = 0x3032000000;
    v47 = __Block_byref_object_copy_;
    v48 = __Block_byref_object_dispose_;
    id v49 = objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v38 = 0;
    v39 = &v38;
    uint64_t v40 = 0x2020000000;
    v41 = 0;
    v41 = (uint64_t (*)(uint64_t, uint64_t))[*a5 longValue];
    v28[5] = &v38;
    id v29 = 0;
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __93__ASDatabaseClient_deletedHealthKitWorkoutsWithinLastNumberOfDays_maxBatchSize_anchor_error___block_invoke_317;
    v28[3] = &unk_2652158E0;
    v28[4] = &v44;
    [v21 enumerateIncludingDeletedObjects:1 error:&v29 handler:v28];
    id v22 = v29;
    *a5 = [NSNumber numberWithLongLong:v39[3]];
    id v23 = v22;
    *a6 = v23;
    id v24 = (id)v45[5];

    _Block_object_dispose(&v38, 8);
    _Block_object_dispose(&v44, 8);
  }
  else
  {
    uint64_t v44 = 0;
    v45 = &v44;
    uint64_t v46 = 0x3032000000;
    v47 = __Block_byref_object_copy_;
    v48 = __Block_byref_object_dispose_;
    id v49 = (id)MEMORY[0x263EFFA68];
    uint64_t v38 = 0;
    v39 = &v38;
    uint64_t v40 = 0x3032000000;
    v41 = __Block_byref_object_copy_;
    v42 = __Block_byref_object_dispose_;
    if (a5) {
      id v25 = *a5;
    }
    else {
      id v25 = 0;
    }
    id v43 = v25;
    uint64_t v32 = 0;
    v33 = &v32;
    uint64_t v34 = 0x3032000000;
    v35 = __Block_byref_object_copy_;
    v36 = __Block_byref_object_dispose_;
    id v37 = 0;
    proxyProvider = self->_proxyProvider;
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __93__ASDatabaseClient_deletedHealthKitWorkoutsWithinLastNumberOfDays_maxBatchSize_anchor_error___block_invoke;
    v31[3] = &unk_265215890;
    v31[7] = a3;
    v31[8] = a4;
    v31[4] = &v38;
    v31[5] = &v44;
    v31[6] = &v32;
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __93__ASDatabaseClient_deletedHealthKitWorkoutsWithinLastNumberOfDays_maxBatchSize_anchor_error___block_invoke_3;
    v30[3] = &unk_2652158B8;
    v30[4] = self;
    v30[5] = &v32;
    [(HKProxyProvider *)proxyProvider getSynchronousProxyWithHandler:v31 errorHandler:v30];
    if (a5) {
      *a5 = (id) v39[5];
    }
    *a6 = (id) v33[5];
    id v24 = (id)v45[5];
    _Block_object_dispose(&v32, 8);

    _Block_object_dispose(&v38, 8);
    _Block_object_dispose(&v44, 8);
  }
  return v24;
}

uint64_t __93__ASDatabaseClient_deletedHealthKitWorkoutsWithinLastNumberOfDays_maxBatchSize_anchor_error___block_invoke(int8x16_t *a1, void *a2)
{
  uint64_t v2 = a1[3].i64[1];
  uint64_t v3 = a1[4].i64[0];
  v7[0] = MEMORY[0x263EF8330];
  int8x16_t v4 = vextq_s8(a1[2], a1[2], 8uLL);
  uint64_t v5 = *(void *)(*(void *)(a1[2].i64[0] + 8) + 40);
  v7[1] = 3221225472;
  v7[2] = __93__ASDatabaseClient_deletedHealthKitWorkoutsWithinLastNumberOfDays_maxBatchSize_anchor_error___block_invoke_2;
  v7[3] = &unk_265215868;
  int8x16_t v8 = v4;
  uint64_t v9 = a1[3].i64[0];
  return objc_msgSend(a2, "remote_deletedHealthKitWorkoutsWithinLastNumberOfDays:maxBatchSize:anchor:completion:", v2, v3, v5, v7);
}

void __93__ASDatabaseClient_deletedHealthKitWorkoutsWithinLastNumberOfDays_maxBatchSize_anchor_error___block_invoke_2(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = *(void *)(a1[4] + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v7;
  id v17 = v7;

  uint64_t v12 = *(void *)(a1[5] + 8);
  id v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v8;
  id v14 = v8;

  uint64_t v15 = *(void *)(a1[6] + 8);
  id v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v9;
}

void __93__ASDatabaseClient_deletedHealthKitWorkoutsWithinLastNumberOfDays_maxBatchSize_anchor_error___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  ASLoggingInitialize();
  int8x16_t v4 = (void *)*MEMORY[0x263F23AC0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC0], OS_LOG_TYPE_ERROR)) {
    __43__ASDatabaseClient_performWhenDaemonReady___block_invoke_2_cold_1(a1, v4);
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

uint64_t __93__ASDatabaseClient_deletedHealthKitWorkoutsWithinLastNumberOfDays_maxBatchSize_anchor_error___block_invoke_317(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a3)
  {
    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "addObject:");
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v7 = *(void *)(v6 + 24);
    if (v7 <= a4) {
      uint64_t v7 = a4;
    }
    *(void *)(v6 + 24) = v7;
  }
  return 1;
}

- (BOOL)enumerateActivitySharingSnapshotsWithPredicate:(id)a3 anchor:(id *)a4 error:(id *)a5 handler:(id)a6
{
  v24[1] = *MEMORY[0x263EF8340];
  id v10 = a6;
  if (self->_profile)
  {
    id v11 = (void *)MEMORY[0x263F43200];
    id v12 = a3;
    id v13 = [v12 healthDaemonPredicate];

    char v14 = [v11 enumerateSnapshotsWithPredicate:v13 anchor:a4 profile:self->_profile error:a5 handler:v10];
  }
  else
  {
    uint64_t v15 = (void *)MEMORY[0x263F0A6E8];
    id v16 = a3;
    id v17 = [v15 fitnessFriendActivitySnapshotType];
    v24[0] = v17;
    uint64_t v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:1];
    v19 = [v16 healthKitPredicate];

    healthStore = self->_healthStore;
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __88__ASDatabaseClient_enumerateActivitySharingSnapshotsWithPredicate_anchor_error_handler___block_invoke;
    v22[3] = &unk_265215908;
    id v23 = v10;
    char v14 = +[ASDatabaseSampleEntity enumerateSamplesOfTypes:v18 predicate:v19 healthStore:healthStore anchor:a4 error:a5 handler:v22];
  }
  return v14;
}

uint64_t __88__ASDatabaseClient_enumerateActivitySharingSnapshotsWithPredicate_anchor_error_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)enumerateActivitySharingWorkoutsWithPredicate:(id)a3 anchor:(id *)a4 error:(id *)a5 handler:(id)a6
{
  v24[1] = *MEMORY[0x263EF8340];
  id v10 = a6;
  if (self->_profile)
  {
    id v11 = (void *)MEMORY[0x263F43208];
    id v12 = a3;
    id v13 = [v12 healthDaemonPredicate];

    char v14 = [v11 enumerateWorkoutsWithPredicate:v13 anchor:a4 profile:self->_profile error:a5 handler:v10];
  }
  else
  {
    uint64_t v15 = (void *)MEMORY[0x263F0A6E8];
    id v16 = a3;
    id v17 = [v15 fitnessFriendWorkoutType];
    v24[0] = v17;
    uint64_t v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:1];
    v19 = [v16 healthKitPredicate];

    healthStore = self->_healthStore;
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __87__ASDatabaseClient_enumerateActivitySharingWorkoutsWithPredicate_anchor_error_handler___block_invoke;
    v22[3] = &unk_265215930;
    id v23 = v10;
    char v14 = +[ASDatabaseSampleEntity enumerateSamplesOfTypes:v18 predicate:v19 healthStore:healthStore anchor:a4 error:a5 handler:v22];
  }
  return v14;
}

uint64_t __87__ASDatabaseClient_enumerateActivitySharingWorkoutsWithPredicate_anchor_error_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)enumerateActivitySharingAchievementsWithPredicate:(id)a3 anchor:(id *)a4 error:(id *)a5 handler:(id)a6
{
  v24[1] = *MEMORY[0x263EF8340];
  id v10 = a6;
  if (self->_profile)
  {
    id v11 = (void *)MEMORY[0x263F431F8];
    id v12 = a3;
    id v13 = [v12 healthDaemonPredicate];

    char v14 = [v11 enumerateAchievementsWithPredicate:v13 anchor:a4 profile:self->_profile error:a5 handler:v10];
  }
  else
  {
    uint64_t v15 = (void *)MEMORY[0x263F0A6E8];
    id v16 = a3;
    id v17 = [v15 fitnessFriendAchievementType];
    v24[0] = v17;
    uint64_t v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:1];
    v19 = [v16 healthKitPredicate];

    healthStore = self->_healthStore;
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __91__ASDatabaseClient_enumerateActivitySharingAchievementsWithPredicate_anchor_error_handler___block_invoke;
    v22[3] = &unk_265215958;
    id v23 = v10;
    char v14 = +[ASDatabaseSampleEntity enumerateSamplesOfTypes:v18 predicate:v19 healthStore:healthStore anchor:a4 error:a5 handler:v22];
  }
  return v14;
}

uint64_t __91__ASDatabaseClient_enumerateActivitySharingAchievementsWithPredicate_anchor_error_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)enumerateAllActivitySharingSamplesWithPredicate:(id)a3 error:(id *)a4 handler:(id)a5
{
  v21[3] = *MEMORY[0x263EF8340];
  id v8 = a5;
  id v9 = (void *)MEMORY[0x263F0A6E8];
  id v10 = a3;
  id v11 = [v9 fitnessFriendActivitySnapshotType];
  v21[0] = v11;
  id v12 = [MEMORY[0x263F0A6E8] fitnessFriendWorkoutType];
  v21[1] = v12;
  id v13 = [MEMORY[0x263F0A6E8] fitnessFriendAchievementType];
  v21[2] = v13;
  char v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:3];

  uint64_t v15 = [v10 healthKitPredicate];

  healthStore = self->_healthStore;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  void v19[2] = __82__ASDatabaseClient_enumerateAllActivitySharingSamplesWithPredicate_error_handler___block_invoke;
  v19[3] = &unk_265215980;
  id v20 = v8;
  id v17 = v8;
  LOBYTE(a4) = +[ASDatabaseSampleEntity enumerateSamplesOfTypes:v14 predicate:v15 healthStore:healthStore anchor:0 error:a4 handler:v19];

  return (char)a4;
}

uint64_t __82__ASDatabaseClient_enumerateAllActivitySharingSamplesWithPredicate_error_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)addSampleObserver:(id)a3 sampleTypes:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (self->_profile)
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v9 = [v7 countByEnumeratingWithState:&v25 objects:v34 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v26 != v10) {
            objc_enumerationMutation(v8);
          }
          uint64_t v12 = *(void *)(*((void *)&v25 + 1) + 8 * i);
          id v13 = [(HDProfile *)self->_profile dataManager];
          [v13 addObserver:v6 forDataType:v12];
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v34 count:16];
      }
      while (v9);
    }
  }
  else
  {
    observerAnchoredObjectQueryMap = self->_observerAnchoredObjectQueryMap;
    uint64_t v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "hash"));
    id v16 = [(NSMutableDictionary *)observerAnchoredObjectQueryMap objectForKeyedSubscript:v15];

    [(HKHealthStore *)self->_healthStore stopQuery:v16];
    id v17 = objc_msgSend(v8, "hk_map:", &__block_literal_global);
    objc_initWeak(&location, self);
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __50__ASDatabaseClient_addSampleObserver_sampleTypes___block_invoke_2;
    v29[3] = &unk_2652159F0;
    objc_copyWeak(&v32, &location);
    id v18 = v6;
    id v30 = v18;
    id v31 = v8;
    v19 = (void *)MEMORY[0x24C557E50](v29);
    id v20 = objc_alloc(MEMORY[0x263F0A0C8]);
    v21 = [MEMORY[0x263F0A670] latestAnchor];
    id v22 = (void *)[v20 initWithQueryDescriptors:v17 anchor:v21 limit:0 resultsHandler:v19];

    [v22 setUpdateHandler:v19];
    [(HKHealthStore *)self->_healthStore executeQuery:v22];
    id v23 = self->_observerAnchoredObjectQueryMap;
    id v24 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v18, "hash"));
    [(NSMutableDictionary *)v23 setObject:v22 forKeyedSubscript:v24];

    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);
  }
}

uint64_t __50__ASDatabaseClient_addSampleObserver_sampleTypes___block_invoke(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x263F0A678] queryDescriptorWithSampleType:a2];
}

void __50__ASDatabaseClient_addSampleObserver_sampleTypes___block_invoke_2(id *a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (v15)
  {
    ASLoggingInitialize();
    id v16 = (void *)*MEMORY[0x263F23AC0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC0], OS_LOG_TYPE_ERROR)) {
      __50__ASDatabaseClient_addSampleObserver_sampleTypes___block_invoke_2_cold_1((uint64_t)a1, v16, (uint64_t)v15);
    }
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    void v24[2] = __50__ASDatabaseClient_addSampleObserver_sampleTypes___block_invoke_329;
    v24[3] = &unk_2652159C8;
    objc_copyWeak(&v27, a1 + 6);
    id v25 = a1[4];
    id v26 = a1[5];
    id v17 = (void *)MEMORY[0x24C557E50](v24);
    id WeakRetained = (NSObject **)objc_loadWeakRetained(a1 + 6);
    if (!WeakRetained)
    {

      objc_destroyWeak(&v27);
      goto LABEL_12;
    }
    v19 = WeakRetained;
    id v20 = WeakRetained[4];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __50__ASDatabaseClient_addSampleObserver_sampleTypes___block_invoke_330;
    block[3] = &unk_265215728;
    block[4] = WeakRetained;
    id v23 = v17;
    id v21 = v17;
    dispatch_async(v20, block);

    objc_destroyWeak(&v27);
  }
  if ([v13 count] && (objc_opt_respondsToSelector() & 1) != 0) {
    [a1[4] samplesOfTypesWereRemoved:v13 anchor:0];
  }
  if ([v12 count]) {
    [a1[4] samplesAdded:v12 anchor:&unk_26FBA7D30];
  }
LABEL_12:
}

void __50__ASDatabaseClient_addSampleObserver_sampleTypes___block_invoke_329(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  ASLoggingInitialize();
  uint64_t v2 = (void *)*MEMORY[0x263F23AC0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC0], OS_LOG_TYPE_DEFAULT))
  {
    id v3 = v2;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    uint64_t v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    int v10 = 138543874;
    id v11 = v6;
    __int16 v12 = 2114;
    uint64_t v13 = v7;
    __int16 v14 = 2114;
    uint64_t v15 = v8;
    _os_log_impl(&dword_2474C9000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ retry create anchored object query; observer %{public}@ sampleTypes %{public}@",
      (uint8_t *)&v10,
      0x20u);
  }
  id v9 = objc_loadWeakRetained((id *)(a1 + 48));
  [v9 addSampleObserver:*(void *)(a1 + 32) sampleTypes:*(void *)(a1 + 40)];
}

void __50__ASDatabaseClient_addSampleObserver_sampleTypes___block_invoke_330(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 64);
  id v2 = (id)MEMORY[0x24C557E50](*(void *)(a1 + 40));
  [v1 addObject:v2];
}

- (void)removeSampleObserver:(id)a3 sampleTypes:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (self->_profile)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v21 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v20 + 1) + 8 * i);
          __int16 v14 = [(HDProfile *)self->_profile dataManager];
          [v14 removeObserver:v6 forDataType:v13];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v10);
    }
  }
  else
  {
    observerAnchoredObjectQueryMap = self->_observerAnchoredObjectQueryMap;
    uint64_t v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "hash"));
    id v17 = [(NSMutableDictionary *)observerAnchoredObjectQueryMap objectForKeyedSubscript:v16];

    [(HKHealthStore *)self->_healthStore stopQuery:v17];
    id v18 = self->_observerAnchoredObjectQueryMap;
    v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "hash"));
    [(NSMutableDictionary *)v18 setObject:0 forKeyedSubscript:v19];
  }
}

- (BOOL)insertDataObjects:(id)a3 error:(id *)a4
{
  id v6 = a3;
  profile = self->_profile;
  if (profile)
  {
    uint64_t v8 = [(HDProfile *)profile dataManager];
    uint64_t v9 = [(HDProfile *)self->_profile dataProvenanceManager];
    uint64_t v10 = [v9 defaultLocalDataProvenance];
    char v11 = [v8 insertDataObjects:v6 withProvenance:v10 creationDate:1 skipInsertionFilter:a4 error:CFAbsoluteTimeGetCurrent()];
  }
  else
  {
    uint64_t v25 = 0;
    id v26 = &v25;
    uint64_t v27 = 0x2020000000;
    char v28 = 0;
    uint64_t v19 = 0;
    long long v20 = &v19;
    uint64_t v21 = 0x3032000000;
    long long v22 = __Block_byref_object_copy_;
    long long v23 = __Block_byref_object_dispose_;
    id v24 = 0;
    proxyProvider = self->_proxyProvider;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __44__ASDatabaseClient_insertDataObjects_error___block_invoke;
    v15[3] = &unk_265215A40;
    id v16 = v6;
    id v17 = &v25;
    id v18 = &v19;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __44__ASDatabaseClient_insertDataObjects_error___block_invoke_3;
    v14[3] = &unk_2652158B8;
    v14[4] = self;
    v14[5] = &v19;
    [(HKProxyProvider *)proxyProvider getSynchronousProxyWithHandler:v15 errorHandler:v14];
    *a4 = (id) v20[5];
    char v11 = *((unsigned char *)v26 + 24) != 0;

    _Block_object_dispose(&v19, 8);
    _Block_object_dispose(&v25, 8);
  }

  return v11;
}

uint64_t __44__ASDatabaseClient_insertDataObjects_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __44__ASDatabaseClient_insertDataObjects_error___block_invoke_2;
  v4[3] = &unk_265215A18;
  long long v5 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(a2, "remote_insertDataObjects:completion:", v2, v4);
}

void __44__ASDatabaseClient_insertDataObjects_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

void __44__ASDatabaseClient_insertDataObjects_error___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  ASLoggingInitialize();
  int8x16_t v4 = (void *)*MEMORY[0x263F23AC0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC0], OS_LOG_TYPE_ERROR)) {
    __43__ASDatabaseClient_performWhenDaemonReady___block_invoke_2_cold_1(a1, v4);
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

- (BOOL)deleteDataObjectsOfType:(id)a3 predicate:(id)a4 limit:(unint64_t)a5 deletedSampleCount:(unint64_t *)a6 notifyObservers:(BOOL)a7 generateDeletedObjects:(BOOL)a8 error:(id *)a9
{
  BOOL v9 = a8;
  BOOL v10 = a7;
  id v15 = a3;
  id v16 = a4;
  id v17 = v16;
  if (!self->_profile)
  {
    id v29 = [v16 healthKitPredicate];
    char v28 = +[ASDatabaseSampleEntity deleteSamplesOfType:v15 predicate:v29 healthStore:self->_healthStore deletedSampleCount:a6 error:a9];
LABEL_8:

    goto LABEL_9;
  }
  unint64_t v33 = a5;
  BOOL v18 = v9;
  uint64_t v19 = [v15 identifier];
  long long v20 = [MEMORY[0x263F0A6E8] fitnessFriendAchievementType];
  uint64_t v21 = [v20 identifier];

  if (v19 == v21) {
    goto LABEL_7;
  }
  long long v22 = [v15 identifier];
  long long v23 = [MEMORY[0x263F0A6E8] fitnessFriendActivitySnapshotType];
  id v24 = [v23 identifier];

  if (v22 == v24) {
    goto LABEL_7;
  }
  uint64_t v25 = [v15 identifier];
  id v26 = [MEMORY[0x263F0A6E8] fitnessFriendWorkoutType];
  uint64_t v27 = [v26 identifier];

  if (v25 == v27)
  {
LABEL_7:
    uint64_t v30 = objc_opt_class();
    id v29 = [(HDProfile *)self->_profile dataManager];
    id v31 = [v17 healthDaemonPredicate];
    char v28 = [v29 deleteDataObjectsOfClass:v30 predicate:v31 limit:v33 deletedSampleCount:a6 notifyObservers:v10 generateDeletedObjects:v18 recursiveDeleteAuthorizationBlock:0 error:a9];

    goto LABEL_8;
  }
  char v28 = 0;
LABEL_9:

  return v28;
}

- (id)allCodableDatabaseCompetitionsWithError:(id *)a3
{
  profile = self->_profile;
  if (profile)
  {
    id v5 = +[ASDatabaseCompetitionEntity allDatabaseCompetitionsWithProfile:profile withError:a3];
  }
  else
  {
    uint64_t v16 = 0;
    id v17 = &v16;
    uint64_t v18 = 0x3032000000;
    uint64_t v19 = __Block_byref_object_copy_;
    long long v20 = __Block_byref_object_dispose_;
    id v21 = (id)MEMORY[0x263EFFA68];
    uint64_t v10 = 0;
    char v11 = &v10;
    uint64_t v12 = 0x3032000000;
    uint64_t v13 = __Block_byref_object_copy_;
    __int16 v14 = __Block_byref_object_dispose_;
    id v15 = 0;
    proxyProvider = self->_proxyProvider;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __60__ASDatabaseClient_allCodableDatabaseCompetitionsWithError___block_invoke;
    v9[3] = &unk_265215A90;
    void v9[4] = &v16;
    void v9[5] = &v10;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __60__ASDatabaseClient_allCodableDatabaseCompetitionsWithError___block_invoke_3;
    v8[3] = &unk_2652158B8;
    v8[4] = self;
    void v8[5] = &v10;
    [(HKProxyProvider *)proxyProvider getSynchronousProxyWithHandler:v9 errorHandler:v8];
    *a3 = (id) v11[5];
    id v5 = (id)v17[5];
    _Block_object_dispose(&v10, 8);

    _Block_object_dispose(&v16, 8);
  }
  return v5;
}

uint64_t __60__ASDatabaseClient_allCodableDatabaseCompetitionsWithError___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __60__ASDatabaseClient_allCodableDatabaseCompetitionsWithError___block_invoke_2;
  v3[3] = &unk_265215A68;
  long long v4 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(a2, "remote_allCodableDatabaseCompetitionsWithCompletion:", v3);
}

void __60__ASDatabaseClient_allCodableDatabaseCompetitionsWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void __60__ASDatabaseClient_allCodableDatabaseCompetitionsWithError___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  ASLoggingInitialize();
  long long v4 = (void *)*MEMORY[0x263F23AC0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC0], OS_LOG_TYPE_ERROR)) {
    __43__ASDatabaseClient_performWhenDaemonReady___block_invoke_2_cold_1(a1, v4);
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

- (BOOL)saveCodableDatabaseCompetitions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = v6;
  profile = self->_profile;
  if (profile)
  {
    BOOL v9 = +[ASDatabaseCompetitionEntity saveCompetitions:v6 profile:profile withError:a4];
  }
  else
  {
    uint64_t v23 = 0;
    id v24 = &v23;
    uint64_t v25 = 0x2020000000;
    char v26 = 0;
    uint64_t v17 = 0;
    uint64_t v18 = &v17;
    uint64_t v19 = 0x3032000000;
    long long v20 = __Block_byref_object_copy_;
    id v21 = __Block_byref_object_dispose_;
    id v22 = 0;
    proxyProvider = self->_proxyProvider;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __58__ASDatabaseClient_saveCodableDatabaseCompetitions_error___block_invoke;
    v13[3] = &unk_265215A40;
    id v14 = v6;
    id v15 = &v23;
    uint64_t v16 = &v17;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __58__ASDatabaseClient_saveCodableDatabaseCompetitions_error___block_invoke_3;
    v12[3] = &unk_2652158B8;
    void v12[4] = self;
    v12[5] = &v17;
    [(HKProxyProvider *)proxyProvider getSynchronousProxyWithHandler:v13 errorHandler:v12];
    *a4 = (id) v18[5];
    BOOL v9 = *((unsigned char *)v24 + 24) != 0;

    _Block_object_dispose(&v17, 8);
    _Block_object_dispose(&v23, 8);
  }

  return v9;
}

uint64_t __58__ASDatabaseClient_saveCodableDatabaseCompetitions_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __58__ASDatabaseClient_saveCodableDatabaseCompetitions_error___block_invoke_2;
  v4[3] = &unk_265215A18;
  long long v5 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(a2, "remote_saveCodableDatabaseCompetitions:completion:", v2, v4);
}

void __58__ASDatabaseClient_saveCodableDatabaseCompetitions_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

void __58__ASDatabaseClient_saveCodableDatabaseCompetitions_error___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  ASLoggingInitialize();
  long long v4 = (void *)*MEMORY[0x263F23AC0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC0], OS_LOG_TYPE_ERROR)) {
    __43__ASDatabaseClient_performWhenDaemonReady___block_invoke_2_cold_1(a1, v4);
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

- (BOOL)removeCodableDatabaseCompetitionsWithFriendUUID:(id)a3 type:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  BOOL v9 = v8;
  profile = self->_profile;
  if (profile)
  {
    BOOL v11 = +[ASDatabaseCompetitionEntity removeCompetitionsForFriendUUID:v8 type:a4 profile:profile withError:a5];
  }
  else
  {
    uint64_t v26 = 0;
    uint64_t v27 = &v26;
    uint64_t v28 = 0x2020000000;
    char v29 = 0;
    uint64_t v20 = 0;
    id v21 = &v20;
    uint64_t v22 = 0x3032000000;
    uint64_t v23 = __Block_byref_object_copy_;
    id v24 = __Block_byref_object_dispose_;
    id v25 = 0;
    proxyProvider = self->_proxyProvider;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __79__ASDatabaseClient_removeCodableDatabaseCompetitionsWithFriendUUID_type_error___block_invoke;
    v15[3] = &unk_265215AB8;
    id v16 = v8;
    uint64_t v17 = &v26;
    uint64_t v18 = &v20;
    int64_t v19 = a4;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __79__ASDatabaseClient_removeCodableDatabaseCompetitionsWithFriendUUID_type_error___block_invoke_3;
    v14[3] = &unk_2652158B8;
    v14[4] = self;
    v14[5] = &v20;
    [(HKProxyProvider *)proxyProvider getSynchronousProxyWithHandler:v15 errorHandler:v14];
    *a5 = (id) v21[5];
    BOOL v11 = *((unsigned char *)v27 + 24) != 0;

    _Block_object_dispose(&v20, 8);
    _Block_object_dispose(&v26, 8);
  }

  return v11;
}

uint64_t __79__ASDatabaseClient_removeCodableDatabaseCompetitionsWithFriendUUID_type_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 56);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __79__ASDatabaseClient_removeCodableDatabaseCompetitionsWithFriendUUID_type_error___block_invoke_2;
  v5[3] = &unk_265215A18;
  long long v6 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(a2, "remote_removeCodableDatabaseCompetitionsWithFriendUUID:type:completion:", v2, v3, v5);
}

void __79__ASDatabaseClient_removeCodableDatabaseCompetitionsWithFriendUUID_type_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

void __79__ASDatabaseClient_removeCodableDatabaseCompetitionsWithFriendUUID_type_error___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  ASLoggingInitialize();
  long long v4 = (void *)*MEMORY[0x263F23AC0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC0], OS_LOG_TYPE_ERROR)) {
    __43__ASDatabaseClient_performWhenDaemonReady___block_invoke_2_cold_1(a1, v4);
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  long long v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

- (BOOL)removeAllCodableDatabaseCompetitionsWithError:(id *)a3
{
  if (self->_profile)
  {
    return +[ASDatabaseCompetitionEntity removeAllCompetitionsWithProfile:error:](ASDatabaseCompetitionEntity, "removeAllCompetitionsWithProfile:error:");
  }
  else
  {
    uint64_t v15 = 0;
    id v16 = &v15;
    uint64_t v17 = 0x2020000000;
    char v18 = 0;
    uint64_t v9 = 0;
    uint64_t v10 = &v9;
    uint64_t v11 = 0x3032000000;
    uint64_t v12 = __Block_byref_object_copy_;
    uint64_t v13 = __Block_byref_object_dispose_;
    id v14 = 0;
    proxyProvider = self->_proxyProvider;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __66__ASDatabaseClient_removeAllCodableDatabaseCompetitionsWithError___block_invoke;
    v8[3] = &unk_265215A90;
    v8[4] = &v15;
    void v8[5] = &v9;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __66__ASDatabaseClient_removeAllCodableDatabaseCompetitionsWithError___block_invoke_3;
    v7[3] = &unk_2652158B8;
    void v7[4] = self;
    void v7[5] = &v9;
    [(HKProxyProvider *)proxyProvider getSynchronousProxyWithHandler:v8 errorHandler:v7];
    *a3 = (id) v10[5];
    char v6 = *((unsigned char *)v16 + 24);
    _Block_object_dispose(&v9, 8);

    _Block_object_dispose(&v15, 8);
    return v6;
  }
}

uint64_t __66__ASDatabaseClient_removeAllCodableDatabaseCompetitionsWithError___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __66__ASDatabaseClient_removeAllCodableDatabaseCompetitionsWithError___block_invoke_2;
  v3[3] = &unk_265215A18;
  long long v4 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(a2, "remote_removeAllCodableDatabaseCompetitionsWithCompletion:", v3);
}

void __66__ASDatabaseClient_removeAllCodableDatabaseCompetitionsWithError___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

void __66__ASDatabaseClient_removeAllCodableDatabaseCompetitionsWithError___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  ASLoggingInitialize();
  long long v4 = (void *)*MEMORY[0x263F23AC0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC0], OS_LOG_TYPE_ERROR)) {
    __43__ASDatabaseClient_performWhenDaemonReady___block_invoke_2_cold_1(a1, v4);
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  char v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

- (BOOL)performDatabaseCompetitionWriteTransactionBlock:(id)a3 error:(id *)a4
{
  id v6 = a3;
  profile = self->_profile;
  if (profile)
  {
    id v8 = [(HDProfile *)profile database];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __74__ASDatabaseClient_performDatabaseCompetitionWriteTransactionBlock_error___block_invoke;
    v13[3] = &unk_265215AE0;
    id v14 = v6;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __74__ASDatabaseClient_performDatabaseCompetitionWriteTransactionBlock_error___block_invoke_2;
    v11[3] = &unk_265215B08;
    id v12 = v14;
    char v9 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v8 error:a4 block:v13 inaccessibilityHandler:v11];
  }
  else
  {
    char v9 = (*((uint64_t (**)(id, id *))v6 + 2))(v6, a4);
  }

  return v9;
}

uint64_t __74__ASDatabaseClient_performDatabaseCompetitionWriteTransactionBlock_error___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __74__ASDatabaseClient_performDatabaseCompetitionWriteTransactionBlock_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)allCodableDatabaseCompetitionListEntriesWithError:(id *)a3
{
  if (self->_profile)
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
    profile = self->_profile;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __70__ASDatabaseClient_allCodableDatabaseCompetitionListEntriesWithError___block_invoke_343;
    v11[3] = &unk_265215B30;
    id v7 = v5;
    id v12 = v7;
    +[ASDatabaseCompetitionListEntryEntity enumerateAllCompetitionListsWithProfile:profile error:a3 handler:v11];
    id v8 = v12;
  }
  else
  {
    uint64_t v21 = 0;
    uint64_t v22 = &v21;
    uint64_t v23 = 0x3032000000;
    id v24 = __Block_byref_object_copy_;
    id v25 = __Block_byref_object_dispose_;
    uint64_t v26 = (void *)MEMORY[0x263EFFA68];
    uint64_t v15 = 0;
    id v16 = &v15;
    uint64_t v17 = 0x3032000000;
    char v18 = __Block_byref_object_copy_;
    int64_t v19 = __Block_byref_object_dispose_;
    id v20 = 0;
    proxyProvider = self->_proxyProvider;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __70__ASDatabaseClient_allCodableDatabaseCompetitionListEntriesWithError___block_invoke;
    v14[3] = &unk_265215A90;
    v14[4] = &v21;
    v14[5] = &v15;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __70__ASDatabaseClient_allCodableDatabaseCompetitionListEntriesWithError___block_invoke_3;
    v13[3] = &unk_2652158B8;
    void v13[4] = self;
    v13[5] = &v15;
    [(HKProxyProvider *)proxyProvider getSynchronousProxyWithHandler:v14 errorHandler:v13];
    *a3 = (id) v16[5];
    id v7 = (id)v22[5];
    _Block_object_dispose(&v15, 8);

    _Block_object_dispose(&v21, 8);
    id v8 = v26;
  }

  return v7;
}

uint64_t __70__ASDatabaseClient_allCodableDatabaseCompetitionListEntriesWithError___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __70__ASDatabaseClient_allCodableDatabaseCompetitionListEntriesWithError___block_invoke_2;
  v3[3] = &unk_265215A68;
  long long v4 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(a2, "remote_allCodableDatabaseCompetitionListEntriesWithCompletion:", v3);
}

void __70__ASDatabaseClient_allCodableDatabaseCompetitionListEntriesWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void __70__ASDatabaseClient_allCodableDatabaseCompetitionListEntriesWithError___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  ASLoggingInitialize();
  long long v4 = (void *)*MEMORY[0x263F23AC0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC0], OS_LOG_TYPE_ERROR)) {
    __43__ASDatabaseClient_performWhenDaemonReady___block_invoke_2_cold_1(a1, v4);
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

uint64_t __70__ASDatabaseClient_allCodableDatabaseCompetitionListEntriesWithError___block_invoke_343(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (BOOL)saveCodableDatabaseCompetitionListEntry:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = v6;
  profile = self->_profile;
  if (profile)
  {
    BOOL v9 = +[ASDatabaseCompetitionListEntryEntity saveCompetitionList:v6 profile:profile withError:a4];
  }
  else
  {
    uint64_t v23 = 0;
    id v24 = &v23;
    uint64_t v25 = 0x2020000000;
    char v26 = 0;
    uint64_t v17 = 0;
    char v18 = &v17;
    uint64_t v19 = 0x3032000000;
    id v20 = __Block_byref_object_copy_;
    uint64_t v21 = __Block_byref_object_dispose_;
    id v22 = 0;
    proxyProvider = self->_proxyProvider;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __66__ASDatabaseClient_saveCodableDatabaseCompetitionListEntry_error___block_invoke;
    v13[3] = &unk_265215A40;
    id v14 = v6;
    uint64_t v15 = &v23;
    id v16 = &v17;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __66__ASDatabaseClient_saveCodableDatabaseCompetitionListEntry_error___block_invoke_3;
    v12[3] = &unk_2652158B8;
    void v12[4] = self;
    v12[5] = &v17;
    [(HKProxyProvider *)proxyProvider getSynchronousProxyWithHandler:v13 errorHandler:v12];
    *a4 = (id) v18[5];
    BOOL v9 = *((unsigned char *)v24 + 24) != 0;

    _Block_object_dispose(&v17, 8);
    _Block_object_dispose(&v23, 8);
  }

  return v9;
}

uint64_t __66__ASDatabaseClient_saveCodableDatabaseCompetitionListEntry_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __66__ASDatabaseClient_saveCodableDatabaseCompetitionListEntry_error___block_invoke_2;
  v4[3] = &unk_265215A18;
  long long v5 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(a2, "remote_saveCodableDatabaseCompetitionListEntry:completion:", v2, v4);
}

void __66__ASDatabaseClient_saveCodableDatabaseCompetitionListEntry_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

void __66__ASDatabaseClient_saveCodableDatabaseCompetitionListEntry_error___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  ASLoggingInitialize();
  long long v4 = (void *)*MEMORY[0x263F23AC0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC0], OS_LOG_TYPE_ERROR)) {
    __43__ASDatabaseClient_performWhenDaemonReady___block_invoke_2_cold_1(a1, v4);
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

- (BOOL)removeAllCodableDatabaseCompetitionListsWithError:(id *)a3
{
  if (self->_profile)
  {
    return +[ASDatabaseCompetitionListEntryEntity removeAllCompetitionListsWithProfile:error:](ASDatabaseCompetitionListEntryEntity, "removeAllCompetitionListsWithProfile:error:");
  }
  else
  {
    uint64_t v15 = 0;
    id v16 = &v15;
    uint64_t v17 = 0x2020000000;
    char v18 = 0;
    uint64_t v9 = 0;
    uint64_t v10 = &v9;
    uint64_t v11 = 0x3032000000;
    id v12 = __Block_byref_object_copy_;
    uint64_t v13 = __Block_byref_object_dispose_;
    id v14 = 0;
    proxyProvider = self->_proxyProvider;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __70__ASDatabaseClient_removeAllCodableDatabaseCompetitionListsWithError___block_invoke;
    v8[3] = &unk_265215A90;
    v8[4] = &v15;
    void v8[5] = &v9;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __70__ASDatabaseClient_removeAllCodableDatabaseCompetitionListsWithError___block_invoke_3;
    v7[3] = &unk_2652158B8;
    void v7[4] = self;
    void v7[5] = &v9;
    [(HKProxyProvider *)proxyProvider getSynchronousProxyWithHandler:v8 errorHandler:v7];
    *a3 = (id) v10[5];
    char v6 = *((unsigned char *)v16 + 24);
    _Block_object_dispose(&v9, 8);

    _Block_object_dispose(&v15, 8);
    return v6;
  }
}

uint64_t __70__ASDatabaseClient_removeAllCodableDatabaseCompetitionListsWithError___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __70__ASDatabaseClient_removeAllCodableDatabaseCompetitionListsWithError___block_invoke_2;
  v3[3] = &unk_265215A18;
  long long v4 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(a2, "remote_removeAllCodableDatabaseCompetitionListsWithCompletion:", v3);
}

void __70__ASDatabaseClient_removeAllCodableDatabaseCompetitionListsWithError___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

void __70__ASDatabaseClient_removeAllCodableDatabaseCompetitionListsWithError___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  ASLoggingInitialize();
  long long v4 = (void *)*MEMORY[0x263F23AC0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC0], OS_LOG_TYPE_ERROR)) {
    __43__ASDatabaseClient_performWhenDaemonReady___block_invoke_2_cold_1(a1, v4);
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  char v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

- (id)localSourceUUIDWithError:(id *)a3
{
  profile = self->_profile;
  if (profile)
  {
    char v6 = [(HDProfile *)profile sourceManager];
    uint64_t v7 = [v6 localDeviceSourceWithError:a3];

    id v8 = [v7 sourceUUIDWithProfile:self->_profile error:a3];
  }
  else
  {
    uint64_t v19 = 0;
    id v20 = &v19;
    uint64_t v21 = 0x3032000000;
    id v22 = __Block_byref_object_copy_;
    uint64_t v23 = __Block_byref_object_dispose_;
    id v24 = 0;
    uint64_t v13 = 0;
    id v14 = &v13;
    uint64_t v15 = 0x3032000000;
    id v16 = __Block_byref_object_copy_;
    uint64_t v17 = __Block_byref_object_dispose_;
    id v18 = 0;
    proxyProvider = self->_proxyProvider;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __45__ASDatabaseClient_localSourceUUIDWithError___block_invoke;
    v12[3] = &unk_265215A90;
    void v12[4] = &v19;
    v12[5] = &v13;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __45__ASDatabaseClient_localSourceUUIDWithError___block_invoke_3;
    v11[3] = &unk_2652158B8;
    void v11[4] = self;
    void v11[5] = &v13;
    [(HKProxyProvider *)proxyProvider getSynchronousProxyWithHandler:v12 errorHandler:v11];
    *a3 = (id) v14[5];
    id v8 = (id)v20[5];
    _Block_object_dispose(&v13, 8);

    _Block_object_dispose(&v19, 8);
  }
  return v8;
}

uint64_t __45__ASDatabaseClient_localSourceUUIDWithError___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __45__ASDatabaseClient_localSourceUUIDWithError___block_invoke_2;
  v3[3] = &unk_265215B58;
  long long v4 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(a2, "remote_localSourceUUIDWithCompletion:", v3);
}

void __45__ASDatabaseClient_localSourceUUIDWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void __45__ASDatabaseClient_localSourceUUIDWithError___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  ASLoggingInitialize();
  long long v4 = (void *)*MEMORY[0x263F23AC0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC0], OS_LOG_TYPE_ERROR)) {
    __43__ASDatabaseClient_performWhenDaemonReady___block_invoke_2_cold_1(a1, v4);
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

- (id)activeDeviceUUIDWithError:(id *)a3
{
  profile = self->_profile;
  if (profile)
  {
    id v6 = [(HDProfile *)profile nanoSyncManager];
    uint64_t v7 = [v6 pairedDevicesSnapshot];
    id v8 = [v7 activeDeviceInfo];
    uint64_t v9 = [v8 sourceBundleIdentifier];

    uint64_t v10 = [(HDProfile *)self->_profile sourceManager];
    id v11 = [v10 sourceUUIDForBundleIdentifier:v9 error:a3];
  }
  else
  {
    uint64_t v22 = 0;
    uint64_t v23 = &v22;
    uint64_t v24 = 0x3032000000;
    uint64_t v25 = __Block_byref_object_copy_;
    char v26 = __Block_byref_object_dispose_;
    id v27 = 0;
    uint64_t v16 = 0;
    uint64_t v17 = &v16;
    uint64_t v18 = 0x3032000000;
    uint64_t v19 = __Block_byref_object_copy_;
    id v20 = __Block_byref_object_dispose_;
    id v21 = 0;
    proxyProvider = self->_proxyProvider;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __46__ASDatabaseClient_activeDeviceUUIDWithError___block_invoke;
    v15[3] = &unk_265215A90;
    void v15[4] = &v22;
    v15[5] = &v16;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __46__ASDatabaseClient_activeDeviceUUIDWithError___block_invoke_3;
    v14[3] = &unk_2652158B8;
    v14[4] = self;
    v14[5] = &v16;
    [(HKProxyProvider *)proxyProvider getSynchronousProxyWithHandler:v15 errorHandler:v14];
    *a3 = (id) v17[5];
    id v11 = (id)v23[5];
    _Block_object_dispose(&v16, 8);

    _Block_object_dispose(&v22, 8);
  }
  return v11;
}

uint64_t __46__ASDatabaseClient_activeDeviceUUIDWithError___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __46__ASDatabaseClient_activeDeviceUUIDWithError___block_invoke_2;
  v3[3] = &unk_265215B58;
  long long v4 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(a2, "remote_activeDeviceUUIDWithCompletion:", v3);
}

void __46__ASDatabaseClient_activeDeviceUUIDWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void __46__ASDatabaseClient_activeDeviceUUIDWithError___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  ASLoggingInitialize();
  long long v4 = (void *)*MEMORY[0x263F23AC0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC0], OS_LOG_TYPE_ERROR)) {
    __43__ASDatabaseClient_performWhenDaemonReady___block_invoke_2_cold_1(a1, v4);
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

- (void)isActivityAlertSuppressionEnabledWithCompletion:(id)a3
{
  id v4 = a3;
  profile = self->_profile;
  if (profile)
  {
    id v6 = [(HDProfile *)profile daemon];
    uint64_t v7 = [v6 alertSuppressionService];
    [v7 fetchActivityAlertSuppressionStateWithCompletion:v4];
  }
  else
  {
    proxyProvider = self->_proxyProvider;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __68__ASDatabaseClient_isActivityAlertSuppressionEnabledWithCompletion___block_invoke;
    v10[3] = &unk_2652156D8;
    id v11 = v4;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __68__ASDatabaseClient_isActivityAlertSuppressionEnabledWithCompletion___block_invoke_2;
    v9[3] = &unk_265215700;
    void v9[4] = self;
    [(HKProxyProvider *)proxyProvider getSynchronousProxyWithHandler:v10 errorHandler:v9];
  }
}

uint64_t __68__ASDatabaseClient_isActivityAlertSuppressionEnabledWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_isActivityAlertSuppressionEnabledWithCompletion:", *(void *)(a1 + 32));
}

void __68__ASDatabaseClient_isActivityAlertSuppressionEnabledWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  ASLoggingInitialize();
  id v4 = (void *)*MEMORY[0x263F23AC0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC0], OS_LOG_TYPE_ERROR)) {
    __43__ASDatabaseClient_performWhenDaemonReady___block_invoke_2_cold_1(a1, v4);
  }
}

- (void)addNanoAlertSuppressionObserver:(id)a3
{
  id v4 = a3;
  profile = self->_profile;
  if (profile)
  {
    id v6 = [(HDProfile *)profile daemon];
    uint64_t v7 = [v6 alertSuppressionService];
    [v7 registerAlertSuppressionObserver:v4];
  }
  else
  {
    observerQueue = self->_observerQueue;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __52__ASDatabaseClient_addNanoAlertSuppressionObserver___block_invoke;
    v9[3] = &unk_2652157C8;
    void v9[4] = self;
    id v10 = v4;
    dispatch_async(observerQueue, v9);
  }
}

uint64_t __52__ASDatabaseClient_addNanoAlertSuppressionObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 104) addObject:*(void *)(a1 + 40)];
}

- (void)removeNanoAlertSuppressionObserver:(id)a3
{
  id v4 = a3;
  profile = self->_profile;
  if (profile)
  {
    id v6 = [(HDProfile *)profile daemon];
    uint64_t v7 = [v6 alertSuppressionService];
    [v7 unregisterAlertSuppressionObserver:v4];
  }
  else
  {
    observerQueue = self->_observerQueue;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __55__ASDatabaseClient_removeNanoAlertSuppressionObserver___block_invoke;
    v9[3] = &unk_2652157C8;
    void v9[4] = self;
    id v10 = v4;
    dispatch_async(observerQueue, v9);
  }
}

uint64_t __55__ASDatabaseClient_removeNanoAlertSuppressionObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 104) removeObject:*(void *)(a1 + 40)];
}

- (void)_handleNanoAlertSuppressionInvalidatedNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 userInfo];
  id v6 = [v5 objectForKeyedSubscript:*MEMORY[0x263F3D1A0]];

  uint64_t v7 = [v4 userInfo];

  id v8 = [v7 objectForKeyedSubscript:*MEMORY[0x263F3D198]];
  uint64_t v9 = (int)[v8 intValue];

  observerQueue = self->_observerQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __71__ASDatabaseClient__handleNanoAlertSuppressionInvalidatedNotification___block_invoke;
  block[3] = &unk_265215B80;
  block[4] = self;
  id v13 = v6;
  uint64_t v14 = v9;
  id v11 = v6;
  dispatch_async(observerQueue, block);
}

void __71__ASDatabaseClient__handleNanoAlertSuppressionInvalidatedNotification___block_invoke(void *a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1[4] + 104);
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
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "alertSuppressionInvalidatedForSuppressionId:reason:", a1[5], a1[6], (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)registerFitnessAppBadgeProvider
{
  if (self->_profile)
  {
    CHProfileExtensionForProfile();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [v4 registerFitnessAppBadgeCountProvider:self];
  }
  else
  {
    proxyProvider = self->_proxyProvider;
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __51__ASDatabaseClient_registerFitnessAppBadgeProvider__block_invoke_2;
    v5[3] = &unk_265215700;
    void v5[4] = self;
    [(HKProxyProvider *)proxyProvider getSynchronousProxyWithHandler:&__block_literal_global_347 errorHandler:v5];
  }
}

uint64_t __51__ASDatabaseClient_registerFitnessAppBadgeProvider__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_registerFitnessAppBadgeProvider");
}

void __51__ASDatabaseClient_registerFitnessAppBadgeProvider__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  ASLoggingInitialize();
  id v4 = (void *)*MEMORY[0x263F23AC0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC0], OS_LOG_TYPE_ERROR)) {
    __43__ASDatabaseClient_performWhenDaemonReady___block_invoke_2_cold_1(a1, v4);
  }
}

- (void)updateFitnessAppBadgeCount:(unint64_t)a3
{
  if (self->_profile)
  {
    self->_fitnessAppBadgeCount = a3;
    CHProfileExtensionForProfile();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [v4 requestFitnessAppBadgeCountUpdate];
  }
  else
  {
    proxyProvider = self->_proxyProvider;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __47__ASDatabaseClient_updateFitnessAppBadgeCount___block_invoke;
    v6[3] = &__block_descriptor_40_e37_v16__0___ASDatabaseServerInterface__8l;
    v6[4] = a3;
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __47__ASDatabaseClient_updateFitnessAppBadgeCount___block_invoke_2;
    v5[3] = &unk_265215700;
    void v5[4] = self;
    [(HKProxyProvider *)proxyProvider getSynchronousProxyWithHandler:v6 errorHandler:v5];
  }
}

uint64_t __47__ASDatabaseClient_updateFitnessAppBadgeCount___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_updateFitnessAppBadgeCount:", *(void *)(a1 + 32));
}

void __47__ASDatabaseClient_updateFitnessAppBadgeCount___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  ASLoggingInitialize();
  id v4 = (void *)*MEMORY[0x263F23AC0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC0], OS_LOG_TYPE_ERROR)) {
    __43__ASDatabaseClient_performWhenDaemonReady___block_invoke_2_cold_1(a1, v4);
  }
}

- (id)makeASKeyValueDomainWithDomainName:(id)a3 category:(int64_t)a4
{
  if (self->_profile) {
    uint64_t v5 = [objc_alloc(MEMORY[0x263F43218]) initWithCategory:a4 == 4 domainName:a3 profile:self->_profile];
  }
  else {
    uint64_t v5 = [objc_alloc(MEMORY[0x263F0A470]) initWithCategory:a4 domainName:a3 healthStore:self->_healthStore];
  }
  uint64_t v6 = (void *)v5;

  return v6;
}

- (id)exportedInterface
{
  return 0;
}

- (void)daemonReady:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  ASLoggingInitialize();
  id v4 = (void *)*MEMORY[0x263F23AB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB8], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = v4;
    uint64_t v6 = (objc_class *)objc_opt_class();
    long long v7 = NSStringFromClass(v6);
    *(_DWORD *)buf = 138412546;
    uint64_t v19 = v7;
    __int16 v20 = 2080;
    id v21 = "-[ASDatabaseClient daemonReady:]";
    _os_log_impl(&dword_2474C9000, v5, OS_LOG_TYPE_DEFAULT, "%@ received %s", buf, 0x16u);
  }
  self->_isDaemonReady = 1;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v8 = self->_queue_performWhenDaemonReadyBlocks;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v13 + 1) + 8 * v12) + 16))(*(void *)(*((void *)&v13 + 1) + 8 * v12));
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }

  [(NSMutableArray *)self->_queue_performWhenDaemonReadyBlocks removeAllObjects];
}

- (unint64_t)badgeCount
{
  return self->_fitnessAppBadgeCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nanoAlertSuppressionObservers, 0);
  objc_storeStrong((id *)&self->_observerAnchoredObjectQueryMap, 0);
  objc_storeStrong((id *)&self->_currentActivitySummaryQuery, 0);
  objc_storeStrong((id *)&self->_currentActivitySummaryObservers, 0);
  objc_storeStrong((id *)&self->_protectedDataAvailableObservers, 0);
  objc_storeStrong((id *)&self->_queue_performWhenProtectedDataDidBecomeAvailableBlocks, 0);
  objc_storeStrong((id *)&self->_queue_performWhenDaemonReadyBlocks, 0);
  objc_storeStrong((id *)&self->_observerQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_proxyProvider, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

void __43__ASDatabaseClient_performWhenDaemonReady___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_2(a1, a2);
  id v3 = (objc_class *)OUTLINED_FUNCTION_3();
  id v4 = NSStringFromClass(v3);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2474C9000, v5, v6, "%{public}@ failed to get proxy: %{public}@", v7, v8, v9, v10, v11);
}

void __50__ASDatabaseClient_addSampleObserver_sampleTypes___block_invoke_2_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v5 = (id *)(a1 + 48);
  uint64_t v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  uint64_t v8 = (objc_class *)objc_opt_class();
  uint64_t v9 = NSStringFromClass(v8);
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = *(void *)(a1 + 40);
  int v12 = 138544130;
  long long v13 = v9;
  __int16 v14 = 2114;
  uint64_t v15 = v10;
  __int16 v16 = 2114;
  uint64_t v17 = v11;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl(&dword_2474C9000, v6, OS_LOG_TYPE_ERROR, "%{public}@ failed to create anchored object query; observer %{public}@ sampleTypes %{public}@ error %{public}@",
    (uint8_t *)&v12,
    0x2Au);
}

@end