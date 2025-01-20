@interface ASDatabaseServer
+ (id)requiredEntitlements;
- (ASDatabaseServer)initWithUUID:(id)a3 client:(id)a4;
- (ASDatabaseServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6;
- (id)remoteInterface;
- (id)taskUUID;
- (unint64_t)badgeCount;
- (void)connectionInvalidated;
- (void)daemonReady:(id)a3;
- (void)remote_activeDeviceUUIDWithCompletion:(id)a3;
- (void)remote_allCodableDatabaseCompetitionListEntriesWithCompletion:(id)a3;
- (void)remote_allCodableDatabaseCompetitionsWithCompletion:(id)a3;
- (void)remote_deletedHealthKitWorkoutsWithinLastNumberOfDays:(unint64_t)a3 maxBatchSize:(unint64_t)a4 anchor:(id)a5 completion:(id)a6;
- (void)remote_insertDataObjects:(id)a3 completion:(id)a4;
- (void)remote_isActivityAlertSuppressionEnabledWithCompletion:(id)a3;
- (void)remote_isDataProtectedByFirstUnlockAvailableWithCompletion:(id)a3;
- (void)remote_isProtectedDataAvailableWithCompletion:(id)a3;
- (void)remote_localSourceUUIDWithCompletion:(id)a3;
- (void)remote_performWhenDaemonReady:(id)a3;
- (void)remote_performWhenDataProtectedByFirstUnlockIsAvailable:(id)a3;
- (void)remote_registerFitnessAppBadgeProvider;
- (void)remote_removeAllCodableDatabaseCompetitionListsWithCompletion:(id)a3;
- (void)remote_removeAllCodableDatabaseCompetitionsWithCompletion:(id)a3;
- (void)remote_removeCodableDatabaseCompetitionsWithFriendUUID:(id)a3 type:(int64_t)a4 completion:(id)a5;
- (void)remote_saveCodableDatabaseCompetitionListEntry:(id)a3 completion:(id)a4;
- (void)remote_saveCodableDatabaseCompetitions:(id)a3 completion:(id)a4;
- (void)remote_todayActivitySummaryWithCompletion:(id)a3;
- (void)remote_updateFitnessAppBadgeCount:(unint64_t)a3;
- (void)remote_yesterdayActivitySummaryWithCompletion:(id)a3;
@end

@implementation ASDatabaseServer

- (ASDatabaseServer)initWithUUID:(id)a3 client:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)ASDatabaseServer;
  v8 = [(ASDatabaseServer *)&v20 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    taskUUID = v8->_taskUUID;
    v8->_taskUUID = (NSUUID *)v9;

    objc_storeStrong((id *)&v8->_client, a4);
    v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    uint64_t v13 = HKCreateSerialDispatchQueue();
    serialQueue = v8->_serialQueue;
    v8->_serialQueue = (OS_dispatch_queue *)v13;

    v8->_isDaemonReady = 0;
    v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    queue_performWhenDaemonReadyBlocks = v8->_queue_performWhenDaemonReadyBlocks;
    v8->_queue_performWhenDaemonReadyBlocks = v15;

    v8->_fitnessAppBadgeCount = 0;
    v17 = [(HDHealthStoreClient *)v8->_client profile];
    v18 = [v17 daemon];
    [v18 registerDaemonReadyObserver:v8 queue:v8->_serialQueue];
  }
  return v8;
}

- (void)remote_performWhenDaemonReady:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __50__ASDatabaseServer_remote_performWhenDaemonReady___block_invoke;
  v7[3] = &unk_265215728;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(serialQueue, v7);
}

void __50__ASDatabaseServer_remote_performWhenDaemonReady___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 32))
  {
    v2 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v2();
  }
  else
  {
    v3 = *(void **)(v1 + 40);
    id v4 = (id)MEMORY[0x24C557E50](*(void *)(a1 + 40));
    [v3 addObject:v4];
  }
}

- (void)remote_isDataProtectedByFirstUnlockAvailableWithCompletion:(id)a3
{
  client = self->_client;
  id v5 = a3;
  id v7 = [(HDHealthStoreClient *)client profile];
  id v6 = [v7 database];
  (*((void (**)(id, uint64_t))a3 + 2))(v5, [v6 isDataProtectedByFirstUnlockAvailable]);
}

- (void)remote_performWhenDataProtectedByFirstUnlockIsAvailable:(id)a3
{
  client = self->_client;
  id v4 = a3;
  id v6 = [(HDHealthStoreClient *)client profile];
  id v5 = [v6 database];
  [v5 performWhenDataProtectedByFirstUnlockIsAvailable:v4];
}

- (void)remote_isProtectedDataAvailableWithCompletion:(id)a3
{
  client = self->_client;
  id v5 = a3;
  id v7 = [(HDHealthStoreClient *)client profile];
  id v6 = [v7 database];
  (*((void (**)(id, uint64_t))a3 + 2))(v5, [v6 isProtectedDataAvailable]);
}

- (void)remote_yesterdayActivitySummaryWithCompletion:(id)a3
{
  client = self->_client;
  id v5 = a3;
  id v8 = [(HDHealthStoreClient *)client profile];
  id v6 = [v8 currentActivitySummaryHelper];
  id v7 = [v6 yesterdayActivitySummary];
  (*((void (**)(id, void *))a3 + 2))(v5, v7);
}

- (void)remote_todayActivitySummaryWithCompletion:(id)a3
{
  client = self->_client;
  id v5 = a3;
  id v8 = [(HDHealthStoreClient *)client profile];
  id v6 = [v8 currentActivitySummaryHelper];
  id v7 = [v6 todayActivitySummary];
  (*((void (**)(id, void *))a3 + 2))(v5, v7);
}

- (void)remote_deletedHealthKitWorkoutsWithinLastNumberOfDays:(unint64_t)a3 maxBatchSize:(unint64_t)a4 anchor:(id)a5 completion:(id)a6
{
  v41[2] = *MEMORY[0x263EF8340];
  id v10 = a5;
  v11 = (void (**)(id, void, void *, id))a6;
  v12 = [MEMORY[0x263EFF8F0] currentCalendar];
  uint64_t v13 = [MEMORY[0x263EFF910] date];
  uint64_t v27 = [v12 dateByAddingUnit:16 value:-(uint64_t)a3 toDate:v13 options:0];

  v14 = [MEMORY[0x263F434A0] predicateWithProperty:*MEMORY[0x263F42FD8] greaterThanOrEqualToValue:v27];
  v15 = HDDataEntityPredicateForType();
  v16 = (void *)MEMORY[0x263F434A8];
  v41[0] = v14;
  v41[1] = v15;
  v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v41 count:2];
  v18 = [v16 predicateMatchingAllPredicates:v17];

  v19 = (void *)MEMORY[0x263F43318];
  objc_super v20 = [MEMORY[0x263F0A598] workoutType];
  v21 = [(HDHealthStoreClient *)self->_client profile];
  v22 = [v19 entityEnumeratorWithType:v20 profile:v21];

  [v22 setPredicate:v18];
  [v22 setAnchor:v10];
  [v22 setLimitCount:a4];
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__6;
  v39 = __Block_byref_object_dispose__6;
  id v40 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x2020000000;
  uint64_t v34 = 0;
  if (v10) {
    uint64_t v23 = [v10 longValue];
  }
  else {
    uint64_t v23 = 0;
  }
  uint64_t v34 = v23;
  v29[5] = &v31;
  id v30 = 0;
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __105__ASDatabaseServer_remote_deletedHealthKitWorkoutsWithinLastNumberOfDays_maxBatchSize_anchor_completion___block_invoke;
  v29[3] = &unk_2652158E0;
  v29[4] = &v35;
  objc_msgSend(v22, "enumerateIncludingDeletedObjects:error:handler:", 1, &v30, v29, v27);
  id v24 = v30;
  uint64_t v25 = v36[5];
  v26 = [NSNumber numberWithLongLong:v32[3]];
  v11[2](v11, v25, v26, v24);

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v35, 8);
}

uint64_t __105__ASDatabaseServer_remote_deletedHealthKitWorkoutsWithinLastNumberOfDays_maxBatchSize_anchor_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
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

- (void)remote_insertDataObjects:(id)a3 completion:(id)a4
{
  client = self->_client;
  uint64_t v7 = (void (**)(id, uint64_t, id))a4;
  id v8 = a3;
  uint64_t v9 = [(HDHealthStoreClient *)client profile];
  id v10 = [v9 dataManager];
  v11 = [(HDHealthStoreClient *)self->_client profile];
  v12 = [v11 dataProvenanceManager];
  uint64_t v13 = [v12 defaultLocalDataProvenance];
  id v16 = 0;
  uint64_t v14 = [v10 insertDataObjects:v8 withProvenance:v13 creationDate:1 skipInsertionFilter:&v16 error:CFAbsoluteTimeGetCurrent()];

  id v15 = v16;
  v7[2](v7, v14, v15);
}

- (void)remote_allCodableDatabaseCompetitionsWithCompletion:(id)a3
{
  client = self->_client;
  id v4 = (void (**)(id, void *, id))a3;
  id v5 = [(HDHealthStoreClient *)client profile];
  id v8 = 0;
  uint64_t v6 = +[ASDatabaseCompetitionEntity allDatabaseCompetitionsWithProfile:v5 withError:&v8];
  id v7 = v8;

  v4[2](v4, v6, v7);
}

- (void)remote_saveCodableDatabaseCompetitions:(id)a3 completion:(id)a4
{
  client = self->_client;
  uint64_t v6 = (void (**)(id, BOOL, id))a4;
  id v7 = a3;
  id v8 = [(HDHealthStoreClient *)client profile];
  id v11 = 0;
  BOOL v9 = +[ASDatabaseCompetitionEntity saveCompetitions:v7 profile:v8 withError:&v11];

  id v10 = v11;
  v6[2](v6, v9, v10);
}

- (void)remote_removeCodableDatabaseCompetitionsWithFriendUUID:(id)a3 type:(int64_t)a4 completion:(id)a5
{
  client = self->_client;
  id v8 = (void (**)(id, BOOL, id))a5;
  id v9 = a3;
  id v10 = [(HDHealthStoreClient *)client profile];
  id v13 = 0;
  BOOL v11 = +[ASDatabaseCompetitionEntity removeCompetitionsForFriendUUID:v9 type:a4 profile:v10 withError:&v13];

  id v12 = v13;
  v8[2](v8, v11, v12);
}

- (void)remote_removeAllCodableDatabaseCompetitionsWithCompletion:(id)a3
{
  client = self->_client;
  id v4 = (void (**)(id, BOOL, id))a3;
  id v5 = [(HDHealthStoreClient *)client profile];
  id v8 = 0;
  BOOL v6 = +[ASDatabaseCompetitionEntity removeAllCompetitionsWithProfile:v5 error:&v8];
  id v7 = v8;

  v4[2](v4, v6, v7);
}

- (void)remote_allCodableDatabaseCompetitionListEntriesWithCompletion:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263EFF980];
  id v5 = (void (**)(id, id, id))a3;
  id v6 = objc_alloc_init(v4);
  id v7 = [(HDHealthStoreClient *)self->_client profile];
  id v11 = v6;
  id v12 = 0;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __82__ASDatabaseServer_remote_allCodableDatabaseCompetitionListEntriesWithCompletion___block_invoke;
  v10[3] = &unk_265215B30;
  id v8 = v6;
  +[ASDatabaseCompetitionListEntryEntity enumerateAllCompetitionListsWithProfile:v7 error:&v12 handler:v10];
  id v9 = v12;

  v5[2](v5, v8, v9);
}

uint64_t __82__ASDatabaseServer_remote_allCodableDatabaseCompetitionListEntriesWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (void)remote_saveCodableDatabaseCompetitionListEntry:(id)a3 completion:(id)a4
{
  client = self->_client;
  id v6 = (void (**)(id, BOOL, id))a4;
  id v7 = a3;
  id v8 = [(HDHealthStoreClient *)client profile];
  id v11 = 0;
  BOOL v9 = +[ASDatabaseCompetitionListEntryEntity saveCompetitionList:v7 profile:v8 withError:&v11];

  id v10 = v11;
  v6[2](v6, v9, v10);
}

- (void)remote_removeAllCodableDatabaseCompetitionListsWithCompletion:(id)a3
{
  client = self->_client;
  id v4 = (void (**)(id, BOOL, id))a3;
  id v5 = [(HDHealthStoreClient *)client profile];
  id v8 = 0;
  BOOL v6 = +[ASDatabaseCompetitionListEntryEntity removeAllCompetitionListsWithProfile:v5 error:&v8];
  id v7 = v8;

  v4[2](v4, v6, v7);
}

- (void)remote_localSourceUUIDWithCompletion:(id)a3
{
  client = self->_client;
  id v5 = (void (**)(id, void *, id))a3;
  BOOL v6 = [(HDHealthStoreClient *)client profile];
  id v7 = [v6 sourceManager];
  id v14 = 0;
  id v8 = [v7 localDeviceSourceWithError:&v14];
  id v9 = v14;

  id v10 = [(HDHealthStoreClient *)self->_client profile];
  id v13 = v9;
  id v11 = [v8 sourceUUIDWithProfile:v10 error:&v13];
  id v12 = v13;

  v5[2](v5, v11, v12);
}

- (void)remote_activeDeviceUUIDWithCompletion:(id)a3
{
  client = self->_client;
  id v5 = (void (**)(id, void *, id))a3;
  BOOL v6 = [(HDHealthStoreClient *)client profile];
  id v7 = [v6 nanoSyncManager];
  id v8 = [v7 pairedDevicesSnapshot];
  id v9 = [v8 activeDeviceInfo];
  id v10 = [v9 sourceBundleIdentifier];

  id v11 = [(HDHealthStoreClient *)self->_client profile];
  id v12 = [v11 sourceManager];
  id v15 = 0;
  id v13 = [v12 sourceUUIDForBundleIdentifier:v10 error:&v15];
  id v14 = v15;

  v5[2](v5, v13, v14);
}

- (void)remote_isActivityAlertSuppressionEnabledWithCompletion:(id)a3
{
  client = self->_client;
  id v4 = (void (**)(id, void))a3;
  id v5 = [(HDHealthStoreClient *)client profile];
  BOOL v6 = [v5 daemon];
  id v7 = [v6 alertSuppressionService];

  if (v7) {
    [v7 fetchActivityAlertSuppressionStateWithCompletion:v4];
  }
  else {
    v4[2](v4, 0);
  }
}

- (void)remote_registerFitnessAppBadgeProvider
{
  id v4 = [(HDHealthStoreClient *)self->_client profile];
  v3 = CHProfileExtensionForProfile();
  [v3 registerFitnessAppBadgeCountProvider:self];
}

- (void)remote_updateFitnessAppBadgeCount:(unint64_t)a3
{
  self->_fitnessAppBadgeCount = a3;
  id v4 = [(HDHealthStoreClient *)self->_client profile];
  v3 = CHProfileExtensionForProfile();
  [v3 requestFitnessAppBadgeCountUpdate];
}

- (id)remoteInterface
{
  return 0;
}

- (void)connectionInvalidated
{
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__ASDatabaseServer_connectionInvalidated__block_invoke;
  block[3] = &unk_2652157F0;
  block[4] = self;
  dispatch_async(serialQueue, block);
}

void __41__ASDatabaseServer_connectionInvalidated__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(*(void *)(a1 + 32) + 16) connection];
  [v1 invalidate];
}

- (ASDatabaseServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  return [(ASDatabaseServer *)self initWithUUID:a3 client:a5];
}

+ (id)requiredEntitlements
{
  return &unk_26FBA7EF8;
}

- (id)taskUUID
{
  return self->_taskUUID;
}

- (void)daemonReady:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  ASLoggingInitialize();
  id v4 = (void *)*MEMORY[0x263F23AB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB8], OS_LOG_TYPE_DEFAULT))
  {
    id v5 = v4;
    BOOL v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    *(_DWORD *)buf = 138412546;
    v19 = v7;
    __int16 v20 = 2080;
    v21 = "-[ASDatabaseServer daemonReady:]";
    _os_log_impl(&dword_2474C9000, v5, OS_LOG_TYPE_DEFAULT, "%@ received %s", buf, 0x16u);
  }
  self->_isDaemonReady = 1;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = self->_queue_performWhenDaemonReadyBlocks;
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
  objc_storeStrong((id *)&self->_queue_performWhenDaemonReadyBlocks, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_taskUUID, 0);
}

@end