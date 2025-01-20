@interface ASCloudKitManager
+ (id)_activityDataShareRecordID;
+ (id)activityDataRecordZoneID;
+ (id)activityDataRootRecordID;
+ (id)relationshipZone;
+ (id)shareURLForShare:(id)a3;
- (ASCloudKitManager)init;
- (ASCloudKitManagerSecureCloudDelegate)secureCloudDelegate;
- (ASCloudKitUtility)cloudKitUtility;
- (BOOL)_queue_isLastCloudKitAddressDifferentFromNewCloudKitAddress:(id)a3;
- (BOOL)hasCompletedFirstFetch;
- (BOOL)readyForOperations;
- (CKContainer)container;
- (NSDate)dateOfLastSuccessfulFetch;
- (id)_observerQueue_friendUUIDForActivityDataShareRecordZoneID:(id)a3;
- (id)_queue_apsEnvironmentString;
- (id)additionalZoneIDsToFetchWithServerChangeTokenChange:(id)a3;
- (id)currentAccountInfo;
- (id)currentCloudKitAddress;
- (id)secureCloudPrivateDatabaseFetchConfigurations;
- (void)_cancelNewAccountTasksTimer;
- (void)_cloudKitAccountStatusChanged:(id)a3;
- (void)_createActivityDataShareWithCompletion:(id)a3;
- (void)_createNotificationSteps;
- (void)_fetchAllChangesWithPriority:(int64_t)a3 activity:(id)a4 group:(id)a5;
- (void)_fetchAllChangesWithPriority:(int64_t)a3 activity:(id)a4 group:(id)a5 completion:(id)a6;
- (void)_fetchCloudKitAccountStatusAndNotifyOfChanges;
- (void)_fetchCloudKitAddressWithCompletion:(id)a3;
- (void)_handleAccountStatusChange:(int64_t)a3;
- (void)_handleIncomingNotification:(id)a3;
- (void)_handleNewPrivateDatabaseRecordChanges:(id)a3 sharedDatabaseRecordChanges:(id)a4 privateDatabaseDeletedRecordIDs:(id)a5 sharedDatabaseDeletedRecordIDs:(id)a6 fetchType:(int64_t)a7 activity:(id)a8 cloudKitGroup:(id)a9;
- (void)_handleSecureCloudServerPush:(id)a3;
- (void)_observerQueue_clearFriendUUIDByZoneIDCache;
- (void)_observerQueue_notifyObserversOfBeginUpdatesForFetchWithType:(int64_t)a3;
- (void)_observerQueue_notifyObserversOfEndUpdatesForFetchWithType:(int64_t)a3 activity:(id)a4 cloudKitGroup:(id)a5;
- (void)_observerQueue_notifyObserversOfServerPushHandledWithCloudKitGroup:(id)a3;
- (void)_observerQueue_notifyOfPrivateDatabaseDeletedRecordIDs:(id)a3 sharedDatabaseDeletedRecordIDs:(id)a4;
- (void)_observerQueue_performNotificationStep:(id)a3 onRecords:(id)a4 dispatchGroup:(id)a5 activity:(id)a6 cloudKitGroup:(id)a7;
- (void)_performAndRetryNewAccountTasksIfNecessaryWithShouldCreateSubscriptions:(BOOL)a3 shouldFetch:(BOOL)a4;
- (void)_performAndRetryNewAccountTasksWithRetryInterval:(double)a3 shouldCreateSubscriptions:(BOOL)a4 shouldFetch:(BOOL)a5;
- (void)_performBlockWhenAllObserversBecomeReady:(id)a3;
- (void)_performNewAccountTasksCreatingSubscriptions:(BOOL)a3 fetching:(BOOL)a4 completion:(id)a5;
- (void)_queue_callFetchCompletionBlocksWithSuccess:(BOOL)a3 error:(id)a4;
- (void)_queue_cancelAllExecutingFetches;
- (void)_queue_clearChangeTokenCacheAndFriendListWithCompletion:(id)a3;
- (void)_queue_clearChangeTokenCaches;
- (void)_queue_notifyObserversOfStatusChanged:(int64_t)a3;
- (void)_queue_pushDisable;
- (void)_queue_pushEnable;
- (void)_queue_setHasCompletedFirstFetch:(BOOL)a3;
- (void)_queue_startFetchAllChangesOperationWithPriority:(int64_t)a3 activity:(id)a4 changeTokenCache:(id)a5 secureCloudChangeTokenCache:(id)a6 group:(id)a7 completion:(id)a8;
- (void)_saveCloudKitAddressToKeyValueStore;
- (void)_subscribeToChangesInDatabase:(id)a3 subscriptionPrefix:(id)a4 recordTypes:(id)a5 zoneNames:(id)a6 recordTypesToDelete:(id)a7 completion:(id)a8;
- (void)_subscribeToChangesInPrivateDatabaseWithCompletion:(id)a3;
- (void)_subscribeToChangesInSharedDatabaseWithCompletion:(id)a3;
- (void)_verifyOrCreateSubscriptionsWithCompletion:(id)a3;
- (void)acceptSharesWithURLs:(id)a3 cloudKitGroup:(id)a4 completion:(id)a5;
- (void)activitySharingManagerReady:(id)a3;
- (void)addObserver:(id)a3;
- (void)addParticipant:(id)a3 toShares:(id)a4 group:(id)a5 completion:(id)a6;
- (void)addParticipantWithCloudKitAddress:(id)a3 toShares:(id)a4 group:(id)a5 completion:(id)a6;
- (void)beginHandlingOperations;
- (void)clearChangeTokenCacheAndFriendListWithCompletion:(id)a3;
- (void)clearChangeTokenCachesWithCompletion:(id)a3;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6;
- (void)createShareWithRootRecord:(id)a3 otherRecordsToSave:(id)a4 completion:(id)a5;
- (void)dealloc;
- (void)endHandlingOperations;
- (void)expireChangeTokenWithCompletion:(id)a3;
- (void)fetchAllChangesIfTimeSinceLastFetchIsGreaterThan:(unint64_t)a3 priority:(int64_t)a4 activity:(id)a5 group:(id)a6 completion:(id)a7;
- (void)fetchAllChangesWithPriority:(int64_t)a3 activity:(id)a4 group:(id)a5 completion:(id)a6;
- (void)fetchCloudKitAccountInfoWithCompletion:(id)a3;
- (void)fetchCloudKitAccountStatusWithCompletion:(id)a3;
- (void)fetchCloudKitAddressWithCompletion:(id)a3;
- (void)fetchOrCreateActivityDataShareWithGroup:(id)a3 activity:(id)a4 completion:(id)a5;
- (void)fetchShareParticipantForIdentifier:(id)a3 group:(id)a4 completion:(id)a5;
- (void)fetchShareParticipantWithCloudKitAddress:(id)a3 group:(id)a4 completion:(id)a5;
- (void)fetchShareWithShareRecordID:(id)a3 activity:(id)a4 group:(id)a5 completion:(id)a6;
- (void)forceSaveRecordsIntoPrivateDatabaseIgnoringServerChanges:(id)a3 recordIDsToDelete:(id)a4 priority:(int64_t)a5 activity:(id)a6 group:(id)a7 completion:(id)a8;
- (void)notifyOfCloudKitAccountStatusUpdate:(int64_t)a3;
- (void)observerDidBecomeReadyToProcessChanges:(id)a3;
- (void)removeObserver:(id)a3;
- (void)removeParticipantWithCloudKitAddress:(id)a3 fromShares:(id)a4 group:(id)a5 completion:(id)a6;
- (void)saveRecordsIntoPrivateDatabase:(id)a3 priority:(int64_t)a4 activity:(id)a5 group:(id)a6 completion:(id)a7;
- (void)saveRecordsIntoPrivateDatabase:(id)a3 recordIDsToDelete:(id)a4 priority:(int64_t)a5 activity:(id)a6 group:(id)a7 completion:(id)a8;
- (void)setCloudKitUtility:(id)a3;
- (void)setContainer:(id)a3;
- (void)setDateOfLastSuccessfulFetch:(id)a3;
- (void)setHasCompletedFirstFetch:(BOOL)a3;
- (void)setReadyForOperations:(BOOL)a3;
- (void)setSecureCloudDelegate:(id)a3;
- (void)subscribeToCloudKitDatabaseChangesWithCompletion:(id)a3;
- (void)updateCloudKitAddress;
- (void)updateCurrentAccountInfo:(id)a3;
@end

@implementation ASCloudKitManager

- (void)fetchCloudKitAccountStatusWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(ASCloudKitManager *)self readyForOperations])
  {
    v5 = [(ASCloudKitManager *)self container];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __62__ASCloudKitManager_fetchCloudKitAccountStatusWithCompletion___block_invoke;
    v7[3] = &unk_265216FC8;
    id v8 = v4;
    [v5 accountStatusWithCompletionHandler:v7];
  }
  else
  {
    v6 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.ActivitySharing.CloudKitManager" code:0 userInfo:0];
    (*((void (**)(id, void, void, void *))v4 + 2))(v4, 0, 0, v6);
  }
}

- (BOOL)readyForOperations
{
  return self->_readyForOperations;
}

- (CKContainer)container
{
  return self->_container;
}

void __62__ASCloudKitManager_fetchCloudKitAccountStatusWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (*(void *)(a1 + 32))
  {
    id v6 = objc_alloc_init(MEMORY[0x263EFB210]);
    v7 = objc_msgSend(v6, "aa_primaryAppleAccount");
    id v8 = v7;
    BOOL v9 = a2 == 1;
    if (v7)
    {
      if (objc_msgSend(v7, "aa_isManagedAppleID"))
      {
        ASLoggingInitialize();
        v10 = *MEMORY[0x263F23AA8];
        BOOL v9 = 0;
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA8], OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v11 = 0;
          _os_log_impl(&dword_2474C9000, v10, OS_LOG_TYPE_DEFAULT, "Apple ID is a managed account, reverting to unsigned-in behavior", v11, 2u);
          BOOL v9 = 0;
        }
      }
    }
    (*(void (**)(void, BOOL, BOOL, id))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v9, v5 == 0, v5);
  }
}

- (ASCloudKitManager)init
{
  v18.receiver = self;
  v18.super_class = (Class)ASCloudKitManager;
  v2 = [(ASCloudKitManager *)&v18 init];
  v3 = v2;
  if (v2)
  {
    [(ASCloudKitManager *)v2 setReadyForOperations:0];
    uint64_t v4 = HKCreateSerialDispatchQueue();
    serialQueue = v3->_serialQueue;
    v3->_serialQueue = (OS_dispatch_queue *)v4;

    uint64_t v6 = HKCreateSerialDispatchQueue();
    observerQueue = v3->_observerQueue;
    v3->_observerQueue = (OS_dispatch_queue *)v6;

    uint64_t v8 = HKCreateSerialDispatchQueue();
    changeTokenQueue = v3->_changeTokenQueue;
    v3->_changeTokenQueue = (OS_dispatch_queue *)v8;

    uint64_t v10 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    observers = v3->_observers;
    v3->_observers = (NSHashTable *)v10;

    uint64_t v12 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    observersNotReady = v3->_observersNotReady;
    v3->_observersNotReady = (NSHashTable *)v12;

    dispatch_group_t v14 = dispatch_group_create();
    observersNotReadyGroup = v3->_observersNotReadyGroup;
    v3->_observersNotReadyGroup = (OS_dispatch_group *)v14;

    v3->_currentFetchPriority = 0;
    blocksWaitingOnFetch = v3->_blocksWaitingOnFetch;
    v3->_blocksWaitingOnFetch = (NSArray *)MEMORY[0x263EFFA68];

    v3->_cloudKitAccountStatus = 0;
    [(ASCloudKitManager *)v3 _createNotificationSteps];
  }
  return v3;
}

- (void)dealloc
{
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __28__ASCloudKitManager_dealloc__block_invoke;
  block[3] = &unk_2652157F0;
  block[4] = self;
  dispatch_sync(serialQueue, block);
  [(HDDaemonTransaction *)self->_fetchTransaction invalidate];
  v4.receiver = self;
  v4.super_class = (Class)ASCloudKitManager;
  [(ASCloudKitManager *)&v4 dealloc];
}

uint64_t __28__ASCloudKitManager_dealloc__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_pushDisable");
}

- (void)activitySharingManagerReady:(id)a3
{
  p_activitySharingManager = &self->_activitySharingManager;
  id v5 = a3;
  objc_storeWeak((id *)p_activitySharingManager, v5);
  id obj = [v5 contactsManager];

  objc_storeWeak((id *)&self->_contactsManager, obj);
}

- (void)beginHandlingOperations
{
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__ASCloudKitManager_beginHandlingOperations__block_invoke;
  block[3] = &unk_2652157F0;
  block[4] = self;
  dispatch_sync(serialQueue, block);
}

void __44__ASCloudKitManager_beginHandlingOperations__block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  if (ASUseLegacyDevelopmentContainer())
  {
    v2 = (void *)[objc_alloc(MEMORY[0x263EFD620]) initWithContainerIdentifier:@"com.apple.ActivitySharing" environment:2];
    v3 = (void *)[objc_alloc(MEMORY[0x263EFD610]) initWithContainerID:v2];
    [*(id *)(a1 + 32) setContainer:v3];
  }
  else
  {
    v2 = [MEMORY[0x263EFD610] containerWithIdentifier:@"com.apple.ActivitySharing"];
    [*(id *)(a1 + 32) setContainer:v2];
  }

  objc_super v4 = [*(id *)(a1 + 32) container];

  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) container];
    [v5 setSourceApplicationBundleIdentifier:@"com.apple.Fitness"];

    uint64_t v6 = [ASCloudKitUtility alloc];
    v7 = [*(id *)(a1 + 32) container];
    uint64_t v8 = [(ASCloudKitUtility *)v6 initWithContainer:v7];
    [*(id *)(a1 + 32) setCloudKitUtility:v8];
  }
  else
  {
    ASLoggingInitialize();
    BOOL v9 = *MEMORY[0x263F23AA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA8], OS_LOG_TYPE_ERROR)) {
      __44__ASCloudKitManager_beginHandlingOperations__block_invoke_cold_2(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  if ((ASSecureCloudEnabled() & 1) == 0)
  {
    ASLoggingInitialize();
    v17 = *MEMORY[0x263F23AA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA8], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2474C9000, v17, OS_LOG_TYPE_DEFAULT, "Legacy account monitoring enabled", buf, 2u);
    }
    objc_super v18 = [MEMORY[0x263F08A00] defaultCenter];
    [v18 addObserver:*(void *)(a1 + 32) selector:sel__cloudKitAccountStatusChanged_ name:*MEMORY[0x263EFD478] object:0];

    [*(id *)(a1 + 32) _fetchCloudKitAccountStatusAndNotifyOfChanges];
  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  v20 = [WeakRetained deviceLocalActivitySharingKeyValueDomain];

  id v30 = 0;
  v21 = [v20 numberForKey:@"ActivitySharingHasCompletedFirstCloudKitFetchKeyVersion2" error:&v30];
  id v22 = v30;
  *(unsigned char *)(*(void *)(a1 + 32) + 264) = [v21 BOOLValue];

  if (v22)
  {
    ASLoggingInitialize();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA8], OS_LOG_TYPE_ERROR)) {
      __44__ASCloudKitManager_beginHandlingOperations__block_invoke_cold_1();
    }
  }
  ASLoggingInitialize();
  v23 = *MEMORY[0x263F23AA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA8], OS_LOG_TYPE_DEFAULT))
  {
    int v24 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 264);
    *(_DWORD *)buf = 67109120;
    int v32 = v24;
    _os_log_impl(&dword_2474C9000, v23, OS_LOG_TYPE_DEFAULT, "hasCompletedFirstFetch initialized to: %d", buf, 8u);
  }
  v26 = *(void **)(a1 + 32);
  v25 = (id *)(a1 + 32);
  objc_msgSend(v26, "_queue_pushEnable");
  v27 = [MEMORY[0x263F08A00] defaultCenter];
  [v27 addObserver:*v25 selector:sel__handleSecureCloudServerPush_ name:*MEMORY[0x263F23DD0] object:0];

  uint64_t v28 = +[ASCloudKitServerChangeTokenCache changeTokenCacheFromUserDefaultsWithSerialQueue:*((void *)*v25 + 5)];
  v29 = (void *)*((void *)*v25 + 26);
  *((void *)*v25 + 26) = v28;

  [*v25 setReadyForOperations:1];
}

- (void)endHandlingOperations
{
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__ASCloudKitManager_endHandlingOperations__block_invoke;
  block[3] = &unk_2652157F0;
  block[4] = self;
  dispatch_sync(serialQueue, block);
}

uint64_t __42__ASCloudKitManager_endHandlingOperations__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setCloudKitUtility:0];
  [*(id *)(a1 + 32) setContainer:0];
  v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 removeObserver:*(void *)(a1 + 32)];

  *(unsigned char *)(*(void *)(a1 + 32) + 264) = 0;
  objc_msgSend(*(id *)(a1 + 32), "_queue_pushDisable");
  v3 = *(void **)(a1 + 32);
  return [v3 setReadyForOperations:0];
}

+ (id)activityDataRecordZoneID
{
  id v2 = objc_alloc(MEMORY[0x263EFD808]);
  v3 = (void *)[v2 initWithZoneName:@"ActivityDataZone" ownerName:*MEMORY[0x263EFD488]];
  return v3;
}

+ (id)activityDataRootRecordID
{
  id v3 = objc_alloc(MEMORY[0x263EFD7E8]);
  uint64_t v4 = *MEMORY[0x263F23998];
  id v5 = [a1 activityDataRecordZoneID];
  uint64_t v6 = (void *)[v3 initWithRecordName:v4 zoneID:v5];

  return v6;
}

+ (id)_activityDataShareRecordID
{
  id v3 = objc_alloc(MEMORY[0x263EFD7E8]);
  uint64_t v4 = [a1 activityDataRecordZoneID];
  id v5 = (void *)[v3 initWithRecordName:@"ActivityDataZone" zoneID:v4];

  return v5;
}

- (void)_createActivityDataShareWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() activityDataRootRecordID];
  uint64_t v6 = _ASCreateActivityDataRootRecordWithID();

  v7 = [(ASCloudKitManager *)self cloudKitUtility];
  uint64_t v8 = [(id)objc_opt_class() _activityDataShareRecordID];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __60__ASCloudKitManager__createActivityDataShareWithCompletion___block_invoke;
  v10[3] = &unk_265216C08;
  id v11 = v4;
  id v9 = v4;
  [v7 createShareAndAssociatedZoneWithShareRecordID:v8 rootRecord:v6 otherRecordsToSave:0 completion:v10];
}

uint64_t __60__ASCloudKitManager__createActivityDataShareWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchOrCreateActivityDataShareWithGroup:(id)a3 activity:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(ASCloudKitManager *)self readyForOperations])
  {
    objc_initWeak(&location, self);
    serialQueue = self->_serialQueue;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __81__ASCloudKitManager_fetchOrCreateActivityDataShareWithGroup_activity_completion___block_invoke;
    v13[3] = &unk_265216C80;
    objc_copyWeak(&v17, &location);
    v13[4] = self;
    id v14 = v9;
    id v15 = v8;
    id v16 = v10;
    dispatch_async(serialQueue, v13);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v12 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.ActivitySharing.CloudKitManager" code:0 userInfo:0];
    (*((void (**)(id, void, void *, void))v10 + 2))(v10, 0, v12, 0);
  }
}

void __81__ASCloudKitManager_fetchOrCreateActivityDataShareWithGroup_activity_completion___block_invoke(uint64_t a1)
{
  id v2 = (id *)(a1 + 64);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = [WeakRetained cloudKitUtility];
    uint64_t v6 = [(id)objc_opt_class() _activityDataShareRecordID];
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 48);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __81__ASCloudKitManager_fetchOrCreateActivityDataShareWithGroup_activity_completion___block_invoke_2;
    v9[3] = &unk_265216C58;
    id v10 = *(id *)(a1 + 56);
    objc_copyWeak(&v11, v2);
    [v5 fetchShareWithShareRecordID:v6 activity:v7 group:v8 completion:v9];

    objc_destroyWeak(&v11);
  }
}

void __81__ASCloudKitManager_fetchOrCreateActivityDataShareWithGroup_activity_completion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4)
  {
    id v5 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v5();
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    if (WeakRetained)
    {
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __81__ASCloudKitManager_fetchOrCreateActivityDataShareWithGroup_activity_completion___block_invoke_3;
      v7[3] = &unk_265216C30;
      id v8 = *(id *)(a1 + 32);
      [WeakRetained _createActivityDataShareWithCompletion:v7];
    }
  }
}

uint64_t __81__ASCloudKitManager_fetchOrCreateActivityDataShareWithGroup_activity_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)relationshipZone
{
  if (relationshipZone_onceToken != -1) {
    dispatch_once(&relationshipZone_onceToken, &__block_literal_global_12);
  }
  id v2 = (void *)relationshipZone_relationshipZone;
  return v2;
}

uint64_t __37__ASCloudKitManager_relationshipZone__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x263EFD808]);
  relationshipZone_relationshipZone = [v0 initWithZoneName:@"RelationshipZone" ownerName:*MEMORY[0x263EFD488]];
  return MEMORY[0x270F9A758]();
}

- (void)_queue_cancelAllExecutingFetches
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  ASLoggingInitialize();
  id v3 = *MEMORY[0x263F23AC0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2474C9000, v3, OS_LOG_TYPE_DEFAULT, "Cancelling all executing fetches", buf, 2u);
  }
  id v4 = [(ASCloudKitManager *)self cloudKitUtility];
  [v4 cancelAllExecutingFetches];

  self->_currentFetchPriority = 0;
  [(HDDaemonTransaction *)self->_fetchTransaction invalidate];
  fetchTransaction = self->_fetchTransaction;
  self->_fetchTransaction = 0;

  observerQueue = self->_observerQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__ASCloudKitManager__queue_cancelAllExecutingFetches__block_invoke;
  block[3] = &unk_2652157F0;
  block[4] = self;
  dispatch_sync(observerQueue, block);
  uint64_t v7 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.ActivitySharing.CloudKitManager" code:1 userInfo:0];
  [(ASCloudKitManager *)self _queue_callFetchCompletionBlocksWithSuccess:0 error:v7];
}

void __53__ASCloudKitManager__queue_cancelAllExecutingFetches__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  dispatch_group_t v2 = dispatch_group_create();
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 248);
  *(void *)(v3 + 248) = v2;

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = *(id *)(*(void *)(a1 + 32) + 64);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend(*(id *)(*(void *)(a1 + 32) + 240), "containsObject:", *(void *)(*((void *)&v10 + 1) + 8 * v9), (void)v10))dispatch_group_enter(*(dispatch_group_t *)(*(void *)(a1 + 32) + 248)); {
        ++v9;
        }
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)_queue_startFetchAllChangesOperationWithPriority:(int64_t)a3 activity:(id)a4 changeTokenCache:(id)a5 secureCloudChangeTokenCache:(id)a6 group:(id)a7 completion:(id)a8
{
  id v37 = a4;
  id v14 = a5;
  id v34 = a6;
  id v15 = a7;
  id v33 = a8;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  id v16 = dispatch_group_create();
  v86[0] = 0;
  v86[1] = v86;
  v86[2] = 0x3032000000;
  v86[3] = __Block_byref_object_copy__9;
  v86[4] = __Block_byref_object_dispose__9;
  id v87 = 0;
  v84[0] = 0;
  v84[1] = v84;
  v84[2] = 0x3032000000;
  v84[3] = __Block_byref_object_copy__9;
  v84[4] = __Block_byref_object_dispose__9;
  id v85 = 0;
  v82[0] = 0;
  v82[1] = v82;
  v82[2] = 0x3032000000;
  v82[3] = __Block_byref_object_copy__9;
  v82[4] = __Block_byref_object_dispose__9;
  id v83 = 0;
  v80[0] = 0;
  v80[1] = v80;
  v80[2] = 0x3032000000;
  v80[3] = __Block_byref_object_copy__9;
  v80[4] = __Block_byref_object_dispose__9;
  id v81 = 0;
  v78[0] = 0;
  v78[1] = v78;
  v78[2] = 0x3032000000;
  v78[3] = __Block_byref_object_copy__9;
  v78[4] = __Block_byref_object_dispose__9;
  id v79 = 0;
  v76[0] = 0;
  v76[1] = v76;
  v76[2] = 0x3032000000;
  v76[3] = __Block_byref_object_copy__9;
  v76[4] = __Block_byref_object_dispose__9;
  id v77 = 0;
  uint64_t v17 = [(ASCloudKitManager *)self additionalZoneIDsToFetchWithServerChangeTokenChange:v14];
  objc_super v18 = (void *)v17;
  v19 = (void *)MEMORY[0x263EFFA68];
  if (v17) {
    v19 = (void *)v17;
  }
  id v36 = v19;
  v20 = [(ASCloudKitManager *)self secureCloudDelegate];
  v35 = [v20 sharedLegacyZoneIDsToSkip];

  dispatch_group_enter(v16);
  v21 = [(ASCloudKitManager *)self cloudKitUtility];
  v71[0] = MEMORY[0x263EF8330];
  v71[1] = 3221225472;
  v71[2] = __141__ASCloudKitManager__queue_startFetchAllChangesOperationWithPriority_activity_changeTokenCache_secureCloudChangeTokenCache_group_completion___block_invoke;
  v71[3] = &unk_265216CA8;
  v73 = v86;
  v74 = v78;
  v75 = v84;
  id v22 = v16;
  v72 = v22;
  uint64_t v23 = MEMORY[0x263EFFA78];
  [v21 fetchChangesInPrivateDatabaseWithServerChangeTokenCache:v14 priority:a3 activity:v37 group:v15 additionalZoneIDs:v36 zoneIDsToSkip:MEMORY[0x263EFFA68] fetchConfigurations:MEMORY[0x263EFFA78] completion:v71];

  dispatch_group_enter(v22);
  int v24 = [(ASCloudKitManager *)self cloudKitUtility];
  v66[0] = MEMORY[0x263EF8330];
  v66[1] = 3221225472;
  v66[2] = __141__ASCloudKitManager__queue_startFetchAllChangesOperationWithPriority_activity_changeTokenCache_secureCloudChangeTokenCache_group_completion___block_invoke_395;
  v66[3] = &unk_265216CA8;
  v68 = v82;
  v69 = v76;
  v70 = v80;
  v25 = v22;
  v67 = v25;
  [v24 fetchChangesInSharedDatabaseWithServerChangeTokenCache:v14 priority:a3 activity:v37 group:v15 additionalZoneIDs:MEMORY[0x263EFFA68] zoneIDsToSkip:v35 fetchConfigurations:v23 completion:v66];

  v64[0] = 0;
  v64[1] = v64;
  v64[2] = 0x3032000000;
  v64[3] = __Block_byref_object_copy__9;
  v64[4] = __Block_byref_object_dispose__9;
  id v65 = 0;
  v62[0] = 0;
  v62[1] = v62;
  v62[2] = 0x3032000000;
  v62[3] = __Block_byref_object_copy__9;
  v62[4] = __Block_byref_object_dispose__9;
  id v63 = 0;
  v60[0] = 0;
  v60[1] = v60;
  v60[2] = 0x3032000000;
  v60[3] = __Block_byref_object_copy__9;
  v60[4] = __Block_byref_object_dispose__9;
  id v61 = 0;
  v58[0] = 0;
  v58[1] = v58;
  v58[2] = 0x3032000000;
  v58[3] = __Block_byref_object_copy__9;
  v58[4] = __Block_byref_object_dispose__9;
  id v59 = 0;
  if (ASSecureCloudEnabled())
  {
    v26 = [(ASCloudKitManager *)self secureCloudDelegate];

    if (v26)
    {
      dispatch_group_enter(v25);
      v27 = [(ASCloudKitManager *)self secureCloudDelegate];
      uint64_t v28 = [(ASCloudKitManager *)self secureCloudPrivateDatabaseFetchConfigurations];
      v54[0] = MEMORY[0x263EF8330];
      v54[1] = 3221225472;
      v54[2] = __141__ASCloudKitManager__queue_startFetchAllChangesOperationWithPriority_activity_changeTokenCache_secureCloudChangeTokenCache_group_completion___block_invoke_396;
      v54[3] = &unk_265216CD0;
      v56 = v64;
      v57 = v62;
      v29 = v25;
      v55 = v29;
      [v27 cloudKitManager:self fetchPrivateDatabaseChangesWithCache:v34 priority:a3 activity:v37 group:v15 fetchConfigurations:v28 completion:v54];

      dispatch_group_enter(v29);
      id v30 = [(ASCloudKitManager *)self secureCloudDelegate];
      v50[0] = MEMORY[0x263EF8330];
      v50[1] = 3221225472;
      v50[2] = __141__ASCloudKitManager__queue_startFetchAllChangesOperationWithPriority_activity_changeTokenCache_secureCloudChangeTokenCache_group_completion___block_invoke_398;
      v50[3] = &unk_265216CD0;
      v52 = v60;
      v53 = v58;
      v51 = v29;
      [v30 cloudKitManager:self fetchSharedDatabaseChangesWithCache:v34 priority:a3 activity:v37 group:v15 completion:v50];
    }
  }
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __141__ASCloudKitManager__queue_startFetchAllChangesOperationWithPriority_activity_changeTokenCache_secureCloudChangeTokenCache_group_completion___block_invoke_399;
  block[3] = &unk_265216CF8;
  v41 = v80;
  v42 = v86;
  v43 = v64;
  v44 = v82;
  v45 = v60;
  v46 = v62;
  id v39 = v33;
  v40 = v84;
  v47 = v58;
  v48 = v78;
  v49 = v76;
  id v32 = v33;
  dispatch_group_notify(v25, serialQueue, block);

  _Block_object_dispose(v58, 8);
  _Block_object_dispose(v60, 8);

  _Block_object_dispose(v62, 8);
  _Block_object_dispose(v64, 8);

  _Block_object_dispose(v76, 8);
  _Block_object_dispose(v78, 8);

  _Block_object_dispose(v80, 8);
  _Block_object_dispose(v82, 8);

  _Block_object_dispose(v84, 8);
  _Block_object_dispose(v86, 8);
}

void __141__ASCloudKitManager__queue_startFetchAllChangesOperationWithPriority_activity_changeTokenCache_secureCloudChangeTokenCache_group_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a4);
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a5);
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a3);
  ASLoggingInitialize();
  long long v12 = *MEMORY[0x263F23AA8];
  long long v13 = *MEMORY[0x263F23AA8];
  if (v9)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __141__ASCloudKitManager__queue_startFetchAllChangesOperationWithPriority_activity_changeTokenCache_secureCloudChangeTokenCache_group_completion___block_invoke_cold_1();
    }
  }
  else if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v14 = 0;
    _os_log_impl(&dword_2474C9000, v12, OS_LOG_TYPE_DEFAULT, "Fetched changes in private database successfully.", v14, 2u);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __141__ASCloudKitManager__queue_startFetchAllChangesOperationWithPriority_activity_changeTokenCache_secureCloudChangeTokenCache_group_completion___block_invoke_395(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a4);
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a5);
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a3);
  ASLoggingInitialize();
  long long v12 = *MEMORY[0x263F23AA8];
  long long v13 = *MEMORY[0x263F23AA8];
  if (v9)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __141__ASCloudKitManager__queue_startFetchAllChangesOperationWithPriority_activity_changeTokenCache_secureCloudChangeTokenCache_group_completion___block_invoke_395_cold_1();
    }
  }
  else if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v14 = 0;
    _os_log_impl(&dword_2474C9000, v12, OS_LOG_TYPE_DEFAULT, "Fetched changes in shared database successfully.", v14, 2u);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __141__ASCloudKitManager__queue_startFetchAllChangesOperationWithPriority_activity_changeTokenCache_secureCloudChangeTokenCache_group_completion___block_invoke_396(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a4);
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
  ASLoggingInitialize();
  id v9 = *MEMORY[0x263F23AA8];
  id v10 = *MEMORY[0x263F23AA8];
  if (v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __141__ASCloudKitManager__queue_startFetchAllChangesOperationWithPriority_activity_changeTokenCache_secureCloudChangeTokenCache_group_completion___block_invoke_396_cold_1();
    }
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl(&dword_2474C9000, v9, OS_LOG_TYPE_DEFAULT, "Fetched changes in secure cloud private database successfully.", v11, 2u);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __141__ASCloudKitManager__queue_startFetchAllChangesOperationWithPriority_activity_changeTokenCache_secureCloudChangeTokenCache_group_completion___block_invoke_398(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a4);
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
  ASLoggingInitialize();
  id v9 = *MEMORY[0x263F23AA8];
  id v10 = *MEMORY[0x263F23AA8];
  if (v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __141__ASCloudKitManager__queue_startFetchAllChangesOperationWithPriority_activity_changeTokenCache_secureCloudChangeTokenCache_group_completion___block_invoke_398_cold_1();
    }
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl(&dword_2474C9000, v9, OS_LOG_TYPE_DEFAULT, "Fetched changes in secure cloud shared database successfully.", v11, 2u);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __141__ASCloudKitManager__queue_startFetchAllChangesOperationWithPriority_activity_changeTokenCache_secureCloudChangeTokenCache_group_completion___block_invoke_399(void *a1)
{
  dispatch_group_t v2 = *(void **)(*(void *)(a1[5] + 8) + 40);
  if (v2)
  {
    BOOL v3 = 0;
  }
  else
  {
    dispatch_group_t v2 = *(void **)(*(void *)(a1[6] + 8) + 40);
    BOOL v3 = v2 == 0;
  }
  id v4 = v2;
  if (!ASSecureCloudEnabled())
  {
    uint64_t v11 = a1[4];
    if (!v3)
    {
      id v27 = v4;
      (*(void (**)(uint64_t, void, id, void, void, void, void))(v11 + 16))(v11, 0, v4, 0, 0, 0, 0);
      goto LABEL_27;
    }
    id v27 = v4;
    goto LABEL_24;
  }
  uint64_t v5 = *(void *)(a1[7] + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  id v7 = *(void **)(*(void *)(a1[8] + 8) + 40);
  if (v6)
  {
    uint64_t v8 = [v6 arrayByAddingObjectsFromArray:v7];
    uint64_t v9 = *(void *)(a1[7] + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
  else
  {
    id v12 = v7;
    id v10 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v12;
  }

  uint64_t v13 = *(void *)(a1[9] + 8);
  id v14 = *(void **)(v13 + 40);
  id v15 = *(void **)(*(void *)(a1[10] + 8) + 40);
  if (v14)
  {
    uint64_t v16 = [v14 arrayByAddingObjectsFromArray:v15];
    uint64_t v17 = *(void *)(a1[9] + 8);
    objc_super v18 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = v16;
  }
  else
  {
    id v19 = v15;
    objc_super v18 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v19;
  }

  v20 = *(void **)(*(void *)(a1[11] + 8) + 40);
  if (v3)
  {
    if (v20)
    {
      LOBYTE(v3) = 0;
      goto LABEL_21;
    }
    BOOL v21 = *(void *)(*(void *)(a1[12] + 8) + 40) == 0;
  }
  else
  {
    BOOL v21 = 0;
    if (v20) {
      goto LABEL_21;
    }
  }
  v20 = *(void **)(*(void *)(a1[12] + 8) + 40);
  LOBYTE(v3) = v21;
LABEL_21:
  if (v4) {
    v20 = v4;
  }
  id v27 = v20;

  uint64_t v11 = a1[4];
  if (!v3)
  {
    uint64_t v24 = 0;
    uint64_t v22 = 0;
    uint64_t v26 = 0;
    uint64_t v23 = 0;
    uint64_t v25 = 0;
    goto LABEL_26;
  }
LABEL_24:
  uint64_t v22 = *(void *)(*(void *)(a1[7] + 8) + 40);
  uint64_t v23 = *(void *)(*(void *)(a1[9] + 8) + 40);
  uint64_t v24 = *(void *)(*(void *)(a1[13] + 8) + 40);
  uint64_t v25 = *(void *)(*(void *)(a1[14] + 8) + 40);
  uint64_t v26 = 1;
LABEL_26:
  (*(void (**)(uint64_t, uint64_t, id, uint64_t, uint64_t, uint64_t, uint64_t))(v11 + 16))(v11, v26, v27, v22, v23, v24, v25);
LABEL_27:
}

- (void)_queue_callFetchCompletionBlocksWithSuccess:(BOOL)a3 error:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v15 = self;
  id v7 = self->_blocksWaitingOnFetch;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v21;
    uint64_t v11 = MEMORY[0x263EF83A0];
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void *)(*((void *)&v20 + 1) + 8 * v12);
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __71__ASCloudKitManager__queue_callFetchCompletionBlocksWithSuccess_error___block_invoke;
        block[3] = &unk_2652162D8;
        uint64_t v18 = v13;
        BOOL v19 = a3;
        id v17 = v6;
        dispatch_async(v11, block);

        ++v12;
      }
      while (v9 != v12);
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }

  blocksWaitingOnFetch = v15->_blocksWaitingOnFetch;
  v15->_blocksWaitingOnFetch = (NSArray *)MEMORY[0x263EFFA68];
}

uint64_t __71__ASCloudKitManager__queue_callFetchCompletionBlocksWithSuccess_error___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)_fetchAllChangesWithPriority:(int64_t)a3 activity:(id)a4 group:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __65__ASCloudKitManager__fetchAllChangesWithPriority_activity_group___block_invoke;
  v12[3] = &unk_265216D98;
  v12[4] = self;
  id v13 = v8;
  id v14 = v9;
  int64_t v15 = a3;
  id v10 = v9;
  id v11 = v8;
  [(ASCloudKitManager *)self _performBlockWhenAllObserversBecomeReady:v12];
}

void __65__ASCloudKitManager__fetchAllChangesWithPriority_activity_group___block_invoke(void *a1)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1[4] + 24));
  uint64_t v2 = [MEMORY[0x263F431B0] transactionWithOwner:a1[4] activityName:@"ASCloudKitFetch"];
  uint64_t v3 = a1[4];
  id v4 = *(void **)(v3 + 256);
  *(void *)(v3 + 256) = v2;

  if (ASSecureCloudEnabled())
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 272));
    id v6 = (void *)[WeakRetained copySecureCloudChangeTokenCache];
  }
  else
  {
    id v6 = 0;
  }
  if (([*(id *)(a1[4] + 208) isExpired] & 1) != 0 || objc_msgSend(v6, "isExpired"))
  {
    ASLoggingInitialize();
    id v7 = *MEMORY[0x263F23AA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA8], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2474C9000, v7, OS_LOG_TYPE_DEFAULT, "Change token cache is expired, doing full fetch", buf, 2u);
    }
    id v8 = [[ASCloudKitServerChangeTokenCache alloc] initWithSerialQueue:*(void *)(a1[4] + 40) cloudType:0];
    id v9 = [[ASCloudKitServerChangeTokenCache alloc] initWithSerialQueue:*(void *)(a1[4] + 40) cloudType:1];
    uint64_t v10 = 0;
  }
  else
  {
    ASLoggingInitialize();
    id v11 = *MEMORY[0x263F23AA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA8], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2474C9000, v11, OS_LOG_TYPE_DEFAULT, "Change token cache is still valid, copying", buf, 2u);
    }
    id v8 = (ASCloudKitServerChangeTokenCache *)[*(id *)(a1[4] + 208) copy];
    id v9 = (ASCloudKitServerChangeTokenCache *)[v6 copy];
    uint64_t v10 = 1;
  }

  id v13 = (void *)a1[4];
  uint64_t v12 = (void *)a1[5];
  uint64_t v15 = a1[6];
  uint64_t v14 = a1[7];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __65__ASCloudKitManager__fetchAllChangesWithPriority_activity_group___block_invoke_401;
  v19[3] = &unk_265216D70;
  v19[4] = v13;
  uint64_t v24 = v10;
  id v20 = v12;
  id v21 = (id)a1[6];
  long long v22 = v8;
  uint64_t v16 = a1[7];
  long long v23 = v9;
  uint64_t v25 = v16;
  id v17 = v9;
  uint64_t v18 = v8;
  objc_msgSend(v13, "_queue_startFetchAllChangesOperationWithPriority:activity:changeTokenCache:secureCloudChangeTokenCache:group:completion:", v14, v20, v18, v17, v15, v19);
}

void __65__ASCloudKitManager__fetchAllChangesWithPriority_activity_group___block_invoke_401(uint64_t a1, char a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  uint64_t v18 = *(void *)(a1 + 32);
  BOOL v19 = *(NSObject **)(v18 + 24);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__ASCloudKitManager__fetchAllChangesWithPriority_activity_group___block_invoke_2;
  block[3] = &unk_265216D48;
  void block[4] = v18;
  id v28 = v14;
  char v39 = a2;
  id v29 = v15;
  id v30 = v13;
  id v31 = v16;
  id v32 = v17;
  uint64_t v37 = *(void *)(a1 + 72);
  id v33 = *(id *)(a1 + 40);
  id v34 = *(id *)(a1 + 48);
  id v35 = *(id *)(a1 + 56);
  id v20 = *(id *)(a1 + 64);
  uint64_t v21 = *(void *)(a1 + 80);
  id v36 = v20;
  uint64_t v38 = v21;
  id v22 = v17;
  id v23 = v16;
  id v24 = v13;
  id v25 = v15;
  id v26 = v14;
  dispatch_async(v19, block);
}

void __65__ASCloudKitManager__fetchAllChangesWithPriority_activity_group___block_invoke_2(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  *(void *)(*(void *)(a1 + 32) + 184) = 0;
  uint64_t v2 = [*(id *)(a1 + 40) count];
  uint64_t v3 = [*(id *)(a1 + 48) count];
  if (*(unsigned char *)(a1 + 128)) {
    BOOL v4 = *(void *)(a1 + 56) == 0;
  }
  else {
    BOOL v4 = 0;
  }
  ASLoggingInitialize();
  uint64_t v5 = (os_log_t *)MEMORY[0x263F23AA8];
  id v6 = *MEMORY[0x263F23AA8];
  BOOL v7 = os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA8], OS_LOG_TYPE_DEFAULT);
  if (!v4 && v2 == -v3)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2474C9000, v6, OS_LOG_TYPE_DEFAULT, "Not handling changes because we found zero changed records.", buf, 2u);
    }
    if (v4) {
      goto LABEL_9;
    }
LABEL_20:
    id v26 = *(NSObject **)(*(void *)(a1 + 32) + 32);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __65__ASCloudKitManager__fetchAllChangesWithPriority_activity_group___block_invoke_405;
    block[3] = &unk_265216D20;
    id v27 = *(id *)(a1 + 56);
    uint64_t v28 = *(void *)(a1 + 32);
    id v32 = v27;
    uint64_t v33 = v28;
    char v34 = *(unsigned char *)(a1 + 128);
    dispatch_async(v26, block);
    id v29 = v32;
LABEL_22:

    return;
  }
  if (v7)
  {
    id v17 = *(void **)(a1 + 40);
    uint64_t v18 = v6;
    uint64_t v19 = [v17 count];
    uint64_t v20 = [*(id *)(a1 + 48) count];
    *(_DWORD *)buf = 134218240;
    uint64_t v39 = v19;
    __int16 v40 = 2048;
    uint64_t v41 = v20;
    _os_log_impl(&dword_2474C9000, v18, OS_LOG_TYPE_DEFAULT, "Fetched changes: %ld private, %ld shared changed records.", buf, 0x16u);
  }
  ASLoggingInitialize();
  os_log_t v21 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    id v22 = *(void **)(a1 + 64);
    id v23 = v21;
    uint64_t v24 = [v22 count];
    uint64_t v25 = [*(id *)(a1 + 72) count];
    *(_DWORD *)buf = 134218240;
    uint64_t v39 = v24;
    __int16 v40 = 2048;
    uint64_t v41 = v25;
    _os_log_impl(&dword_2474C9000, v23, OS_LOG_TYPE_DEFAULT, "Fetched deletions: %ld private, %ld shared changed records.", buf, 0x16u);
  }
  [*(id *)(a1 + 32) _handleNewPrivateDatabaseRecordChanges:*(void *)(a1 + 40) sharedDatabaseRecordChanges:*(void *)(a1 + 48) privateDatabaseDeletedRecordIDs:*(void *)(a1 + 64) sharedDatabaseDeletedRecordIDs:*(void *)(a1 + 72) fetchType:*(void *)(a1 + 112) activity:*(void *)(a1 + 80) cloudKitGroup:*(void *)(a1 + 88)];
  if (!v4) {
    goto LABEL_20;
  }
LABEL_9:
  uint64_t v8 = [*(id *)(a1 + 96) copy];
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void **)(v9 + 208);
  *(void *)(v9 + 208) = v8;

  if (ASSecureCloudEnabled())
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 272));
    uint64_t v12 = (void *)[*(id *)(a1 + 104) copy];
    [WeakRetained updateSecureCloudChangeTokenCache:v12];
  }
  uint64_t v13 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v13 + 192))
  {
    id v30 = *(NSObject **)(v13 + 32);
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __65__ASCloudKitManager__fetchAllChangesWithPriority_activity_group___block_invoke_402;
    v35[3] = &unk_265216D20;
    v35[4] = v13;
    char v37 = *(unsigned char *)(a1 + 128);
    id v36 = *(id *)(a1 + 56);
    dispatch_async(v30, v35);
    id v29 = v36;
    goto LABEL_22;
  }
  ASLoggingInitialize();
  id v14 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2474C9000, v14, OS_LOG_TYPE_DEFAULT, "A subscription notification came in during the last fetch, running another fetch now.", buf, 2u);
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 192) = 0;
  [*(id *)(*(void *)(a1 + 32) + 256) invalidate];
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = *(void **)(v15 + 256);
  *(void *)(v15 + 256) = 0;

  [*(id *)(a1 + 32) _fetchAllChangesWithPriority:*(void *)(a1 + 120) activity:*(void *)(a1 + 80) group:*(void *)(a1 + 88)];
}

void __65__ASCloudKitManager__fetchAllChangesWithPriority_activity_group___block_invoke_402(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(NSObject **)(v1 + 24);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__ASCloudKitManager__fetchAllChangesWithPriority_activity_group___block_invoke_2_403;
  block[3] = &unk_265216D20;
  void block[4] = v1;
  char v5 = *(unsigned char *)(a1 + 48);
  id v4 = *(id *)(a1 + 40);
  dispatch_async(v2, block);
}

void __65__ASCloudKitManager__fetchAllChangesWithPriority_activity_group___block_invoke_2_403(uint64_t a1)
{
  ASLoggingInitialize();
  uint64_t v2 = *MEMORY[0x263F23AA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v7 = 0;
    _os_log_impl(&dword_2474C9000, v2, OS_LOG_TYPE_DEFAULT, "Fetched changes successfully, calling completions.", v7, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "_queue_setHasCompletedFirstFetch:", 1);
  uint64_t v3 = [MEMORY[0x263EFF910] date];
  [*(id *)(a1 + 32) setDateOfLastSuccessfulFetch:v3];

  objc_msgSend(*(id *)(a1 + 32), "_queue_callFetchCompletionBlocksWithSuccess:error:", *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 40));
  [*(id *)(*(void *)(a1 + 32) + 208) persistToUserDefaults];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 272));
  [WeakRetained persistCurrentSecureCloudChangeTokenCache];

  [*(id *)(*(void *)(a1 + 32) + 256) invalidate];
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 256);
  *(void *)(v5 + 256) = 0;
}

void __65__ASCloudKitManager__fetchAllChangesWithPriority_activity_group___block_invoke_405(uint64_t a1)
{
  ASLoggingInitialize();
  uint64_t v2 = *MEMORY[0x263F23AA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA8], OS_LOG_TYPE_ERROR)) {
    __65__ASCloudKitManager__fetchAllChangesWithPriority_activity_group___block_invoke_405_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);
  }
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v10 = *(NSObject **)(v9 + 24);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__ASCloudKitManager__fetchAllChangesWithPriority_activity_group___block_invoke_406;
  block[3] = &unk_265216D20;
  void block[4] = v9;
  char v13 = *(unsigned char *)(a1 + 48);
  id v12 = *(id *)(a1 + 32);
  dispatch_async(v10, block);
}

uint64_t __65__ASCloudKitManager__fetchAllChangesWithPriority_activity_group___block_invoke_406(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 256) invalidate];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 256);
  *(void *)(v2 + 256) = 0;

  uint64_t v4 = *(unsigned __int8 *)(a1 + 48);
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  return objc_msgSend(v5, "_queue_callFetchCompletionBlocksWithSuccess:error:", v4, v6);
}

- (void)_fetchAllChangesWithPriority:(int64_t)a3 activity:(id)a4 group:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __76__ASCloudKitManager__fetchAllChangesWithPriority_activity_group_completion___block_invoke;
  block[3] = &unk_265216DC0;
  id v20 = v12;
  int64_t v21 = a3;
  void block[4] = self;
  id v18 = v10;
  id v19 = v11;
  id v14 = v11;
  id v15 = v10;
  id v16 = v12;
  dispatch_async(serialQueue, block);
}

void __76__ASCloudKitManager__fetchAllChangesWithPriority_activity_group_completion___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void **)(a1 + 56);
  if (v2)
  {
    uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 200);
    uint64_t v4 = (void *)[v2 copy];
    uint64_t v5 = (void *)MEMORY[0x24C557E50]();
    uint64_t v6 = [v3 arrayByAddingObject:v5];
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void **)(v7 + 200);
    *(void *)(v7 + 200) = v6;
  }
  unint64_t v9 = *(void *)(*(void *)(a1 + 32) + 184);
  if (v9 >= *(void *)(a1 + 64))
  {
    ASLoggingInitialize();
    id v15 = *MEMORY[0x263F23AA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA8], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = *(void *)(*(void *)(a1 + 32) + 184);
      uint64_t v17 = *(void *)(a1 + 64);
      int v18 = 134218240;
      uint64_t v19 = v16;
      __int16 v20 = 2048;
      uint64_t v21 = v17;
      _os_log_impl(&dword_2474C9000, v15, OS_LOG_TYPE_DEFAULT, "A same or higher priority fetch is executing, adding completion to pending completion block list; current priori"
        "ty: %lu, requested priority: %lu",
        (uint8_t *)&v18,
        0x16u);
    }
  }
  else
  {
    if (v9)
    {
      ASLoggingInitialize();
      id v10 = *MEMORY[0x263F23AA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA8], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 184);
        uint64_t v12 = *(void *)(a1 + 64);
        int v18 = 134218240;
        uint64_t v19 = v11;
        __int16 v20 = 2048;
        uint64_t v21 = v12;
        _os_log_impl(&dword_2474C9000, v10, OS_LOG_TYPE_DEFAULT, "Lower priority fetches are executing, cancelling all fetches before running higher priority fetch; current pri"
          "ority: %lu, requested priority: %lu",
          (uint8_t *)&v18,
          0x16u);
      }
      objc_msgSend(*(id *)(a1 + 32), "_queue_cancelAllExecutingFetches");
    }
    ASLoggingInitialize();
    char v13 = *MEMORY[0x263F23AA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA8], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = *(void *)(a1 + 64);
      int v18 = 134217984;
      uint64_t v19 = v14;
      _os_log_impl(&dword_2474C9000, v13, OS_LOG_TYPE_DEFAULT, "Running fetch with priority %lu now.", (uint8_t *)&v18, 0xCu);
    }
    *(void *)(*(void *)(a1 + 32) + 184) = *(void *)(a1 + 64);
    [*(id *)(a1 + 32) _fetchAllChangesWithPriority:*(void *)(a1 + 64) activity:*(void *)(a1 + 40) group:*(void *)(a1 + 48)];
  }
}

- (void)fetchAllChangesWithPriority:(int64_t)a3 activity:(id)a4 group:(id)a5 completion:(id)a6
{
  id v13 = a4;
  id v10 = a5;
  uint64_t v11 = (void (**)(id, void, void *))a6;
  if ([(ASCloudKitManager *)self readyForOperations])
  {
    [(ASCloudKitManager *)self _fetchAllChangesWithPriority:a3 activity:v13 group:v10 completion:v11];
  }
  else if (v11)
  {
    uint64_t v12 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.ActivitySharing.CloudKitManager" code:0 userInfo:0];
    v11[2](v11, 0, v12);
  }
}

- (void)fetchAllChangesIfTimeSinceLastFetchIsGreaterThan:(unint64_t)a3 priority:(int64_t)a4 activity:(id)a5 group:(id)a6 completion:(id)a7
{
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  if ([(ASCloudKitManager *)self readyForOperations])
  {
    serialQueue = self->_serialQueue;
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __105__ASCloudKitManager_fetchAllChangesIfTimeSinceLastFetchIsGreaterThan_priority_activity_group_completion___block_invoke;
    v17[3] = &unk_265216DE8;
    v17[4] = self;
    unint64_t v21 = a3;
    int64_t v22 = a4;
    id v18 = v12;
    id v19 = v13;
    id v20 = v14;
    dispatch_async(serialQueue, v17);
  }
  else
  {
    uint64_t v16 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.ActivitySharing.CloudKitManager" code:0 userInfo:0];
    (*((void (**)(id, void, void *))v14 + 2))(v14, 0, v16);
  }
}

void __105__ASCloudKitManager_fetchAllChangesIfTimeSinceLastFetchIsGreaterThan_priority_activity_group_completion___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263EFF910] date];
  [v2 timeIntervalSinceReferenceDate];
  double v4 = v3;
  uint64_t v5 = [*(id *)(a1 + 32) dateOfLastSuccessfulFetch];
  [v5 timeIntervalSinceReferenceDate];
  double v7 = v4 - v6;

  uint64_t v8 = [*(id *)(a1 + 32) dateOfLastSuccessfulFetch];

  ASLoggingInitialize();
  unint64_t v9 = (os_log_t *)MEMORY[0x263F23AA8];
  id v10 = *MEMORY[0x263F23AA8];
  BOOL v11 = os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA8], OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v11)
    {
      uint64_t v12 = *(void *)(a1 + 64);
      *(_DWORD *)int64_t v22 = 134218240;
      *(void *)&v22[4] = v12;
      *(_WORD *)&v22[12] = 2048;
      *(double *)&v22[14] = v7;
      id v13 = "Fetch requested if no fetch performed within last %lu seconds, last fetch was %lf seconds ago";
      id v14 = v10;
      uint32_t v15 = 22;
LABEL_6:
      _os_log_impl(&dword_2474C9000, v14, OS_LOG_TYPE_DEFAULT, v13, v22, v15);
    }
  }
  else if (v11)
  {
    uint64_t v16 = *(void *)(a1 + 64);
    *(_DWORD *)int64_t v22 = 134217984;
    *(void *)&v22[4] = v16;
    id v13 = "Fetch requested if no fetch performed within last %lu seconds, no successful fetch performed yet";
    id v14 = v10;
    uint32_t v15 = 12;
    goto LABEL_6;
  }
  uint64_t v17 = objc_msgSend(*(id *)(a1 + 32), "dateOfLastSuccessfulFetch", *(_OWORD *)v22, *(void *)&v22[16]);
  if (!v17) {
    goto LABEL_11;
  }
  if (v7 < 0.0) {
    double v7 = -v7;
  }
  double v18 = (double)*(unint64_t *)(a1 + 64);

  if (v7 <= v18)
  {
    ASLoggingInitialize();
    id v19 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int64_t v22 = 0;
      _os_log_impl(&dword_2474C9000, v19, OS_LOG_TYPE_DEFAULT, "Last fetch is too recent, not fetching.", v22, 2u);
    }
    uint64_t v20 = *(void *)(a1 + 56);
    if (v20)
    {
      unint64_t v21 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.ActivitySharing.CloudKitManager" code:3 userInfo:0];
      (*(void (**)(uint64_t, void, void *))(v20 + 16))(v20, 0, v21);
    }
  }
  else
  {
LABEL_11:
    [*(id *)(a1 + 32) _fetchAllChangesWithPriority:*(void *)(a1 + 72) activity:*(void *)(a1 + 40) group:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
  }
}

- (BOOL)hasCompletedFirstFetch
{
  uint64_t v6 = 0;
  double v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __43__ASCloudKitManager_hasCompletedFirstFetch__block_invoke;
  v5[3] = &unk_265215FF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __43__ASCloudKitManager_hasCompletedFirstFetch__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 264);
  return result;
}

- (void)setHasCompletedFirstFetch:(BOOL)a3
{
  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __47__ASCloudKitManager_setHasCompletedFirstFetch___block_invoke;
  v4[3] = &unk_265215818;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(serialQueue, v4);
}

uint64_t __47__ASCloudKitManager_setHasCompletedFirstFetch___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setHasCompletedFirstFetch:", *(unsigned __int8 *)(a1 + 40));
}

- (void)_queue_setHasCompletedFirstFetch:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (self->_hasCompletedFirstFetch != v3)
  {
    self->_BOOL hasCompletedFirstFetch = v3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_activitySharingManager);
    uint64_t v6 = [WeakRetained deviceLocalActivitySharingKeyValueDomain];

    double v7 = [NSNumber numberWithBool:self->_hasCompletedFirstFetch];
    id v12 = 0;
    [v6 setNumber:v7 forKey:@"ActivitySharingHasCompletedFirstCloudKitFetchKeyVersion2" error:&v12];
    id v8 = v12;

    ASLoggingInitialize();
    char v9 = *MEMORY[0x263F23AA8];
    id v10 = *MEMORY[0x263F23AA8];
    if (v8)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[ASCloudKitManager _queue_setHasCompletedFirstFetch:]();
      }
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      BOOL hasCompletedFirstFetch = self->_hasCompletedFirstFetch;
      *(_DWORD *)buf = 67109120;
      BOOL v14 = hasCompletedFirstFetch;
      _os_log_impl(&dword_2474C9000, v9, OS_LOG_TYPE_DEFAULT, "Updated has completed first fetch: %d", buf, 8u);
    }
  }
}

- (void)expireChangeTokenWithCompletion:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __53__ASCloudKitManager_expireChangeTokenWithCompletion___block_invoke;
  v7[3] = &unk_265215728;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(serialQueue, v7);
}

uint64_t __53__ASCloudKitManager_expireChangeTokenWithCompletion___block_invoke(uint64_t a1)
{
  ASLoggingInitialize();
  uint64_t v2 = *MEMORY[0x263F23AA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_2474C9000, v2, OS_LOG_TYPE_DEFAULT, "Cancelling all fetches and expiring change token immediately", v4, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "_queue_cancelAllExecutingFetches");
  [*(id *)(*(void *)(a1 + 32) + 208) setExpired:1];
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, 1, 0);
  }
  return result;
}

- (id)additionalZoneIDsToFetchWithServerChangeTokenChange:(id)a3
{
  v13[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = _MetadataZoneID();
  BOOL v5 = [v3 fetchDateForRecordZoneID:v4];

  if (v5
    && ([MEMORY[0x263EFF8F0] currentCalendar],
        id v6 = objc_claimAutoreleasedReturnValue(),
        [MEMORY[0x263EFF910] date],
        double v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v6 isDate:v5 inSameDayAsDate:v7],
        v7,
        v6,
        v8))
  {
    ASLoggingInitialize();
    char v9 = *MEMORY[0x263F23AA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA8], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v12 = 0;
      _os_log_impl(&dword_2474C9000, v9, OS_LOG_TYPE_DEFAULT, "Skipping fetch of metadata_zone", v12, 2u);
    }
    id v10 = (void *)MEMORY[0x263EFFA68];
  }
  else
  {
    v13[0] = v4;
    id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  }

  return v10;
}

- (id)secureCloudPrivateDatabaseFetchConfigurations
{
  v16[4] = *MEMORY[0x263EF8340];
  uint64_t v12 = *MEMORY[0x263F23990];
  uint64_t v2 = [[ASCloudKitFetchConfiguration alloc] initWithRecordType:v12 shouldSkip:1];
  v16[0] = v2;
  uint64_t v13 = *MEMORY[0x263F239C8];
  id v3 = [[ASCloudKitFetchConfiguration alloc] initWithRecordType:v13 shouldSkip:1];
  v16[1] = v3;
  uint64_t v14 = *MEMORY[0x263F239E0];
  id v4 = [[ASCloudKitFetchConfiguration alloc] initWithRecordType:v14 shouldSkip:1];
  v16[2] = v4;
  uint64_t v15 = *MEMORY[0x263F239A0];
  BOOL v5 = [ASCloudKitFetchConfiguration alloc];
  id v6 = [MEMORY[0x263EFF8F0] currentCalendar];
  double v7 = [MEMORY[0x263EFF910] date];
  int v8 = [v6 dateByAddingUnit:16 value:-4 toDate:v7 options:0];
  char v9 = [(ASCloudKitFetchConfiguration *)v5 initWithRecordType:v15 shouldSkip:0 shouldCoalesce:1 oldestAllowedModificationDate:v8];
  v16[3] = v9;
  id v10 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v12 count:4];

  return v10;
}

- (void)subscribeToCloudKitDatabaseChangesWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(ASCloudKitManager *)self readyForOperations])
  {
    serialQueue = self->_serialQueue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __70__ASCloudKitManager_subscribeToCloudKitDatabaseChangesWithCompletion___block_invoke;
    v7[3] = &unk_265215728;
    void v7[4] = self;
    id v8 = v4;
    dispatch_async(serialQueue, v7);
  }
  else if (v4)
  {
    id v6 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.ActivitySharing.CloudKitManager" code:0 userInfo:0];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v6);
  }
}

uint64_t __70__ASCloudKitManager_subscribeToCloudKitDatabaseChangesWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _verifyOrCreateSubscriptionsWithCompletion:*(void *)(a1 + 40)];
}

- (void)_subscribeToChangesInDatabase:(id)a3 subscriptionPrefix:(id)a4 recordTypes:(id)a5 zoneNames:(id)a6 recordTypesToDelete:(id)a7 completion:(id)a8
{
  uint64_t v77 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v51 = a6;
  id v52 = a7;
  id v17 = a8;
  if ([v16 count] || objc_msgSend(v52, "count"))
  {
    v48 = self;
    v49 = v17;
    double v18 = [MEMORY[0x263EFF9C0] set];
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    id v50 = v16;
    id obj = v16;
    uint64_t v19 = [obj countByEnumeratingWithState:&v66 objects:v76 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v67;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v67 != v21) {
            objc_enumerationMutation(obj);
          }
          uint64_t v23 = *(void **)(*((void *)&v66 + 1) + 8 * i);
          ASLoggingInitialize();
          uint64_t v24 = (void *)*MEMORY[0x263F23AA8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA8], OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v25 = v24;
            [v14 databaseScope];
            id v26 = CKDatabaseScopeString();
            *(_DWORD *)buf = 138543618;
            v73 = v23;
            __int16 v74 = 2114;
            v75 = v26;
            _os_log_impl(&dword_2474C9000, v25, OS_LOG_TYPE_DEFAULT, "Creating subscription to records with type %{public}@ in database %{public}@", buf, 0x16u);
          }
          id v27 = [NSString stringWithFormat:@"%@-%@", v15, v23];
          uint64_t v28 = _CreateSubscription(v27, v23, 1);

          [v18 addObject:v28];
        }
        uint64_t v20 = [obj countByEnumeratingWithState:&v66 objects:v76 count:16];
      }
      while (v20);
    }

    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id obja = v51;
    uint64_t v29 = [obja countByEnumeratingWithState:&v62 objects:v71 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v63;
      do
      {
        for (uint64_t j = 0; j != v30; ++j)
        {
          if (*(void *)v63 != v31) {
            objc_enumerationMutation(obja);
          }
          uint64_t v33 = *(void **)(*((void *)&v62 + 1) + 8 * j);
          ASLoggingInitialize();
          char v34 = (void *)*MEMORY[0x263F23AA8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA8], OS_LOG_TYPE_DEFAULT))
          {
            id v35 = v34;
            [v14 databaseScope];
            id v36 = CKDatabaseScopeString();
            *(_DWORD *)buf = 138543618;
            v73 = v33;
            __int16 v74 = 2114;
            v75 = v36;
            _os_log_impl(&dword_2474C9000, v35, OS_LOG_TYPE_DEFAULT, "Creating subscription to zone with name %{public}@ in database %{public}@", buf, 0x16u);
          }
          char v37 = [NSString stringWithFormat:@"%@-%@", v15, v33];
          uint64_t v39 = _CreateZoneSubscription(v37, v38, 1);

          [v18 addObject:v39];
        }
        uint64_t v30 = [obja countByEnumeratingWithState:&v62 objects:v71 count:16];
      }
      while (v30);
    }

    __int16 v40 = [MEMORY[0x263EFF9C0] set];
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id v41 = v52;
    uint64_t v42 = [v41 countByEnumeratingWithState:&v58 objects:v70 count:16];
    if (v42)
    {
      uint64_t v43 = v42;
      uint64_t v44 = *(void *)v59;
      do
      {
        for (uint64_t k = 0; k != v43; ++k)
        {
          if (*(void *)v59 != v44) {
            objc_enumerationMutation(v41);
          }
          v46 = [NSString stringWithFormat:@"%@-%@", v15, *(void *)(*((void *)&v58 + 1) + 8 * k)];
          [v40 addObject:v46];
        }
        uint64_t v43 = [v41 countByEnumeratingWithState:&v58 objects:v70 count:16];
      }
      while (v43);
    }

    v47 = [(ASCloudKitManager *)v48 cloudKitUtility];
    v55[0] = MEMORY[0x263EF8330];
    v55[1] = 3221225472;
    v55[2] = __123__ASCloudKitManager__subscribeToChangesInDatabase_subscriptionPrefix_recordTypes_zoneNames_recordTypesToDelete_completion___block_invoke;
    v55[3] = &unk_265216E10;
    id v56 = v14;
    id v17 = v49;
    id v57 = v49;
    [v47 saveSubscriptions:v18 andDeleteSubscriptionsWithIdentifiers:v40 inDatabase:v56 completion:v55];

    id v16 = v50;
  }
  else if (v17)
  {
    (*((void (**)(id, uint64_t, void))v17 + 2))(v17, 1, 0);
  }
}

void __123__ASCloudKitManager__subscribeToChangesInDatabase_subscriptionPrefix_recordTypes_zoneNames_recordTypesToDelete_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  ASLoggingInitialize();
  char v9 = (void *)*MEMORY[0x263F23AA8];
  if (v7 || !a2)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA8], OS_LOG_TYPE_ERROR)) {
      __123__ASCloudKitManager__subscribeToChangesInDatabase_subscriptionPrefix_recordTypes_zoneNames_recordTypesToDelete_completion___block_invoke_cold_1(a1, v9, (uint64_t)v7);
    }
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA8], OS_LOG_TYPE_DEFAULT))
  {
    id v10 = v9;
    uint64_t v11 = [v8 count];
    [*(id *)(a1 + 32) databaseScope];
    uint64_t v12 = CKDatabaseScopeString();
    int v14 = 134218242;
    uint64_t v15 = v11;
    __int16 v16 = 2114;
    id v17 = v12;
    _os_log_impl(&dword_2474C9000, v10, OS_LOG_TYPE_DEFAULT, "Saved %lu subscriptions into database %{public}@.", (uint8_t *)&v14, 0x16u);
  }
  uint64_t v13 = *(void *)(a1 + 40);
  if (v13) {
    (*(void (**)(uint64_t, uint64_t, id))(v13 + 16))(v13, a2, v7);
  }
}

- (void)_subscribeToChangesInSharedDatabaseWithCompletion:(id)a3
{
  v9[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [(ASCloudKitManager *)self container];
  id v6 = [v5 sharedCloudDatabase];
  uint64_t v7 = *MEMORY[0x263F239D8];
  v9[0] = *MEMORY[0x263F239C8];
  v9[1] = v7;
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:2];
  [(ASCloudKitManager *)self _subscribeToChangesInDatabase:v6 subscriptionPrefix:@"ActivitySharingSharedDataSubscription" recordTypes:v8 zoneNames:MEMORY[0x263EFFA68] recordTypesToDelete:&unk_26FBA7F10 completion:v4];
}

- (void)_subscribeToChangesInPrivateDatabaseWithCompletion:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [(ASCloudKitManager *)self container];
  id v6 = [v5 privateCloudDatabase];
  v10[0] = *MEMORY[0x263F239D8];
  uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
  uint64_t v9 = *MEMORY[0x263F239B8];
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v9 count:1];
  [(ASCloudKitManager *)self _subscribeToChangesInDatabase:v6 subscriptionPrefix:@"ActivitySharingPrivateDataSubscription" recordTypes:v7 zoneNames:v8 recordTypesToDelete:&unk_26FBA7F28 completion:v4];
}

- (void)_handleSecureCloudServerPush:(id)a3
{
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F23DC8]];

  [(ASCloudKitManager *)self _handleIncomingNotification:v5];
}

- (void)_handleIncomingNotification:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  ASLoggingInitialize();
  id v5 = (os_log_t *)MEMORY[0x263F23AA8];
  id v6 = (void *)*MEMORY[0x263F23AA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA8], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = v6;
    id v8 = [v4 subscriptionID];
    *(_DWORD *)buf = 138543362;
    uint64_t v15 = v8;
    _os_log_impl(&dword_2474C9000, v7, OS_LOG_TYPE_DEFAULT, "Received CloudKit push notification for subscription with id: %{public}@", buf, 0xCu);
  }
  uint64_t v9 = [v4 alertBody];

  if (v9)
  {
    serialQueue = self->_serialQueue;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __49__ASCloudKitManager__handleIncomingNotification___block_invoke;
    v12[3] = &unk_2652157C8;
    v12[4] = self;
    id v13 = v4;
    dispatch_async(serialQueue, v12);
  }
  else
  {
    ASLoggingInitialize();
    uint64_t v11 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2474C9000, v11, OS_LOG_TYPE_DEFAULT, "Push notification is low-priority, not fetching.", buf, 2u);
    }
  }
}

void __49__ASCloudKitManager__handleIncomingNotification___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  int v2 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 176);
  ASLoggingInitialize();
  id v3 = (os_log_t *)MEMORY[0x263F23AA8];
  id v4 = *MEMORY[0x263F23AA8];
  BOOL v5 = os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA8], OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2474C9000, v4, OS_LOG_TYPE_DEFAULT, "CloudKit push received during coalescing period, ignoring.", buf, 2u);
    }
  }
  else
  {
    if (v5)
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v17 = 0x4000000000000000;
      _os_log_impl(&dword_2474C9000, v4, OS_LOG_TYPE_DEFAULT, "Push notification coalescing interval starting, will take %lf seconds.", buf, 0xCu);
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 176) = 1;
    dispatch_time_t v6 = dispatch_time(0, 2000000000);
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = *(NSObject **)(v7 + 24);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __49__ASCloudKitManager__handleIncomingNotification___block_invoke_433;
    block[3] = &unk_2652157F0;
    void block[4] = v7;
    dispatch_after(v6, v8, block);
  }
  uint64_t v9 = [*(id *)(a1 + 40) subscriptionID];
  id v10 = [NSString stringWithFormat:@"%@-%@", @"ActivitySharingPrivateDataSubscription", *MEMORY[0x263F239B8]];
  int v11 = [v9 isEqualToString:v10];

  if (v11)
  {
    ASLoggingInitialize();
    uint64_t v12 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2474C9000, v12, OS_LOG_TYPE_DEFAULT, "CloudKit push received for metadata_zone, clearing fetch date.", buf, 2u);
    }
    id v13 = *(void **)(*(void *)(a1 + 32) + 208);
    int v14 = _MetadataZoneID();
    [v13 setFetchDate:0 forRecordZoneID:v14];
  }
}

void __49__ASCloudKitManager__handleIncomingNotification___block_invoke_433(uint64_t a1)
{
  ASLoggingInitialize();
  int v2 = (os_log_t *)MEMORY[0x263F23AA8];
  id v3 = *MEMORY[0x263F23AA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2474C9000, v3, OS_LOG_TYPE_DEFAULT, "Push notification coalescing interval finished, fetching changes.", buf, 2u);
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 176) = 0;
  if (*(void *)(*(void *)(a1 + 32) + 184) < 2uLL)
  {
    BOOL v5 = ASCloudKitGroupPushTriggered();
    dispatch_time_t v6 = *(void **)(a1 + 32);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __49__ASCloudKitManager__handleIncomingNotification___block_invoke_434;
    v8[3] = &unk_2652168A8;
    v8[4] = v6;
    id v9 = v5;
    id v7 = v5;
    [v6 fetchAllChangesWithPriority:2 activity:0 group:v7 completion:v8];
  }
  else
  {
    ASLoggingInitialize();
    id v4 = *v2;
    if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2474C9000, v4, OS_LOG_TYPE_DEFAULT, "Push notification received during a fetch, fetching again after current fetch completes.", buf, 2u);
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 192) = 1;
  }
}

void __49__ASCloudKitManager__handleIncomingNotification___block_invoke_434(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v2 = *(void *)(a1 + 32);
    id v3 = *(NSObject **)(v2 + 32);
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __49__ASCloudKitManager__handleIncomingNotification___block_invoke_2;
    v4[3] = &unk_2652157C8;
    v4[4] = v2;
    id v5 = *(id *)(a1 + 40);
    dispatch_async(v3, v4);
  }
}

uint64_t __49__ASCloudKitManager__handleIncomingNotification___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_observerQueue_notifyObserversOfServerPushHandledWithCloudKitGroup:", *(void *)(a1 + 40));
}

- (void)_verifyOrCreateSubscriptionsWithCompletion:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __64__ASCloudKitManager__verifyOrCreateSubscriptionsWithCompletion___block_invoke;
  v7[3] = &unk_265215FA8;
  void v7[4] = self;
  id v8 = v4;
  id v5 = v4;
  dispatch_time_t v6 = self;
  [(ASCloudKitManager *)v6 _subscribeToChangesInPrivateDatabaseWithCompletion:v7];
}

uint64_t __64__ASCloudKitManager__verifyOrCreateSubscriptionsWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  if (a3 || !a2)
  {
    uint64_t v6 = *(void *)(a1 + 40);
    if (v6) {
      (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, a2);
    }
  }
  else
  {
    id v5 = *(void **)(a1 + 32);
    if (v5) {
      [v5 _subscribeToChangesInSharedDatabaseWithCompletion:*(void *)(a1 + 40)];
    }
  }
  return MEMORY[0x270F9A790]();
}

- (id)_queue_apsEnvironmentString
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (_queue_apsEnvironmentString_onceToken != -1) {
    dispatch_once(&_queue_apsEnvironmentString_onceToken, &__block_literal_global_437);
  }
  id v3 = (void *)xpc_copy_entitlement_for_token();
  id v4 = v3;
  if (v3)
  {
    id v5 = [NSString stringWithUTF8String:xpc_string_get_string_ptr(v3)];
  }
  else
  {
    id v5 = 0;
  }
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  int64_t v22 = __Block_byref_object_copy__9;
  uint64_t v23 = __Block_byref_object_dispose__9;
  id v24 = (id)*MEMORY[0x263F280D0];
  uint64_t v6 = (os_log_t *)MEMORY[0x263F23AA8];
  if (v5 && ![v5 compare:*MEMORY[0x263EFD4D0] options:1])
  {
    dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
    id v8 = [(ASCloudKitManager *)self container];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __48__ASCloudKitManager__queue_apsEnvironmentString__block_invoke_2;
    v16[3] = &unk_265216E38;
    uint64_t v18 = &v19;
    id v9 = v7;
    uint64_t v17 = v9;
    [v8 serverPreferredPushEnvironmentWithCompletionHandler:v16];

    dispatch_time_t v10 = dispatch_time(0, 10000000000);
    if (dispatch_semaphore_wait(v9, v10))
    {
      ASLoggingInitialize();
      int v11 = *v6;
      if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2474C9000, v11, OS_LOG_TYPE_DEFAULT, "Timeout getting server preferred APS push environment", buf, 2u);
      }
    }
  }
  ASLoggingInitialize();
  uint64_t v12 = *v6;
  if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = v20[5];
    *(_DWORD *)buf = 138543362;
    uint64_t v26 = v13;
    _os_log_impl(&dword_2474C9000, v12, OS_LOG_TYPE_DEFAULT, "Using APS push environment: %{public}@", buf, 0xCu);
  }
  id v14 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v14;
}

uint64_t __48__ASCloudKitManager__queue_apsEnvironmentString__block_invoke()
{
  uint64_t v0 = getpid();
  return MEMORY[0x270EDC1E8](v0, &_queue_apsEnvironmentString_auditToken);
}

void __48__ASCloudKitManager__queue_apsEnvironmentString__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    ASLoggingInitialize();
    id v8 = *MEMORY[0x263F23AA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA8], OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138543362;
      id v10 = v7;
      _os_log_impl(&dword_2474C9000, v8, OS_LOG_TYPE_DEFAULT, "Error getting server APS preferred push environment: %{public}@", (uint8_t *)&v9, 0xCu);
    }
  }
  else if (v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  ASLoggingInitialize();
  id v7 = *MEMORY[0x263F23AA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA8], OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    id v9 = v6;
    __int16 v10 = 2048;
    id v11 = v5;
    _os_log_impl(&dword_2474C9000, v7, OS_LOG_TYPE_DEFAULT, "Received public token \"%@\" on connection %p", (uint8_t *)&v8, 0x16u);
  }
}

- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  ASLoggingInitialize();
  uint64_t v13 = *MEMORY[0x263F23AA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA8], OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138413058;
    id v15 = v10;
    __int16 v16 = 2114;
    id v17 = v11;
    __int16 v18 = 2112;
    id v19 = v12;
    __int16 v20 = 2048;
    id v21 = v9;
    _os_log_impl(&dword_2474C9000, v13, OS_LOG_TYPE_DEFAULT, "Received per-topic push token \"%@\" for topic \"%{public}@\" identifier \"%@\" on connection %p", (uint8_t *)&v14, 0x2Au);
  }
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = [v5 userInfo];
  id v7 = [MEMORY[0x263EFD760] notificationFromRemoteNotificationDictionary:v6];
  ASLoggingInitialize();
  int v8 = (void *)*MEMORY[0x263F23AA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA8], OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v8;
    id v10 = [v5 topic];
    int v11 = 138412546;
    id v12 = v10;
    __int16 v13 = 2112;
    int v14 = v7;
    _os_log_impl(&dword_2474C9000, v9, OS_LOG_TYPE_DEFAULT, "APS push recieved: %@ %@", (uint8_t *)&v11, 0x16u);
  }
  [(ASCloudKitManager *)self _handleIncomingNotification:v7];
}

- (void)_queue_pushEnable
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_2474C9000, v0, v1, "Couldn't create APS push connection", v2, v3, v4, v5, v6);
}

- (void)_queue_pushDisable
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  apsConnection = self->_apsConnection;
  if (apsConnection)
  {
    uint64_t v4 = [(APSConnection *)apsConnection enabledTopics];
    uint64_t v5 = [v4 count];

    if (v5) {
      [(APSConnection *)self->_apsConnection setEnabledTopics:0];
    }
    uint8_t v6 = self->_apsConnection;
    self->_apsConnection = 0;
  }
}

- (void)forceSaveRecordsIntoPrivateDatabaseIgnoringServerChanges:(id)a3 recordIDsToDelete:(id)a4 priority:(int64_t)a5 activity:(id)a6 group:(id)a7 completion:(id)a8
{
  id v19 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  if ([(ASCloudKitManager *)self readyForOperations])
  {
    __int16 v18 = [(ASCloudKitManager *)self cloudKitUtility];
    [v18 forceSaveRecordsIntoPrivateDatabaseIgnoringServerChanges:v19 recordIDsToDelete:v14 priority:a5 activity:v15 group:v16 completion:v17];
  }
  else
  {
    __int16 v18 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.ActivitySharing.CloudKitManager" code:0 userInfo:0];
    (*((void (**)(id, void, void *, void))v17 + 2))(v17, 0, v18, 0);
  }
}

- (void)saveRecordsIntoPrivateDatabase:(id)a3 priority:(int64_t)a4 activity:(id)a5 group:(id)a6 completion:(id)a7
{
}

- (void)saveRecordsIntoPrivateDatabase:(id)a3 recordIDsToDelete:(id)a4 priority:(int64_t)a5 activity:(id)a6 group:(id)a7 completion:(id)a8
{
  id v19 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  if ([(ASCloudKitManager *)self readyForOperations])
  {
    __int16 v18 = [(ASCloudKitManager *)self cloudKitUtility];
    [v18 saveRecordsIntoPrivateDatabase:v19 recordIDsToDelete:v14 priority:a5 activity:v15 group:v16 completion:v17];
  }
  else
  {
    __int16 v18 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.ActivitySharing.CloudKitManager" code:0 userInfo:0];
    (*((void (**)(id, void, void *, void))v17 + 2))(v17, 0, v18, 0);
  }
}

- (void)_cloudKitAccountStatusChanged:(id)a3
{
  ASLoggingInitialize();
  uint64_t v4 = *MEMORY[0x263F23AA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_2474C9000, v4, OS_LOG_TYPE_DEFAULT, "Recieved local notification of CloudKit account status changes; fetching ",
      v5,
      2u);
  }
  [(ASCloudKitManager *)self _fetchCloudKitAccountStatusAndNotifyOfChanges];
}

- (void)clearChangeTokenCacheAndFriendListWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(ASCloudKitManager *)self readyForOperations])
  {
    serialQueue = self->_serialQueue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __70__ASCloudKitManager_clearChangeTokenCacheAndFriendListWithCompletion___block_invoke;
    v7[3] = &unk_265215728;
    void v7[4] = self;
    id v8 = v4;
    dispatch_async(serialQueue, v7);
  }
  else
  {
    uint8_t v6 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.ActivitySharing.CloudKitManager" code:0 userInfo:0];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v6);
  }
}

uint64_t __70__ASCloudKitManager_clearChangeTokenCacheAndFriendListWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_clearChangeTokenCacheAndFriendListWithCompletion:", *(void *)(a1 + 40));
}

- (void)clearChangeTokenCachesWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(ASCloudKitManager *)self readyForOperations])
  {
    serialQueue = self->_serialQueue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __58__ASCloudKitManager_clearChangeTokenCachesWithCompletion___block_invoke;
    v7[3] = &unk_265215728;
    void v7[4] = self;
    id v8 = v4;
    dispatch_async(serialQueue, v7);
  }
  else
  {
    uint8_t v6 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.ActivitySharing.CloudKitManager" code:0 userInfo:0];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v6);
  }
}

uint64_t __58__ASCloudKitManager_clearChangeTokenCachesWithCompletion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_clearChangeTokenCaches");
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

- (void)_queue_clearChangeTokenCacheAndFriendListWithCompletion:(id)a3
{
  serialQueue = self->_serialQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(serialQueue);
  [(ASCloudKitManager *)self _queue_clearChangeTokenCaches];
  [(ASCloudKitManager *)self _queue_cancelAllExecutingFetches];
  [(ASCloudKitManager *)self _queue_setHasCompletedFirstFetch:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activitySharingManager);
  [WeakRetained clearFriendListWithCompletion:v5];
}

- (void)_queue_clearChangeTokenCaches
{
  uint64_t v3 = [[ASCloudKitServerChangeTokenCache alloc] initWithSerialQueue:self->_changeTokenQueue];
  serverChangeTokenCache = self->_serverChangeTokenCache;
  self->_serverChangeTokenCache = v3;

  [(ASCloudKitServerChangeTokenCache *)self->_serverChangeTokenCache persistToUserDefaults];
  if (ASSecureCloudEnabled())
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_secureCloudDelegate);
    [WeakRetained cloudKitManagerDidClearServerChangeToken:self];
  }
}

- (void)_performNewAccountTasksCreatingSubscriptions:(BOOL)a3 fetching:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = dispatch_group_create();
  ASLoggingInitialize();
  id v10 = (os_log_t *)MEMORY[0x263F23AA8];
  int v11 = *MEMORY[0x263F23AA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2474C9000, v11, OS_LOG_TYPE_DEFAULT, "New CloudKit account is now active, performing setup tasks.", buf, 2u);
  }
  v46[0] = 0;
  v46[1] = v46;
  v46[2] = 0x2020000000;
  char v47 = 1;
  *(void *)buf = 0;
  id v41 = buf;
  uint64_t v42 = 0x3032000000;
  uint64_t v43 = __Block_byref_object_copy__9;
  uint64_t v44 = __Block_byref_object_dispose__9;
  id v45 = 0;
  if (v6)
  {
    dispatch_group_enter(v9);
    ASLoggingInitialize();
    id v12 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v28 = 0;
      _os_log_impl(&dword_2474C9000, v12, OS_LOG_TYPE_DEFAULT, "Creating subscriptions.", v28, 2u);
    }
    v36[0] = MEMORY[0x263EF8330];
    v36[1] = 3221225472;
    v36[2] = __86__ASCloudKitManager__performNewAccountTasksCreatingSubscriptions_fetching_completion___block_invoke;
    v36[3] = &unk_2652168D0;
    uint64_t v38 = v46;
    uint64_t v39 = buf;
    char v37 = v9;
    [(ASCloudKitManager *)self _verifyOrCreateSubscriptionsWithCompletion:v36];
  }
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x2020000000;
  char v35 = 1;
  *(void *)uint64_t v28 = 0;
  uint64_t v29 = v28;
  uint64_t v30 = 0x3032000000;
  uint64_t v31 = __Block_byref_object_copy__9;
  id v32 = __Block_byref_object_dispose__9;
  id v33 = 0;
  if (v5)
  {
    dispatch_group_enter(v9);
    ASLoggingInitialize();
    __int16 v13 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v27 = 0;
      _os_log_impl(&dword_2474C9000, v13, OS_LOG_TYPE_DEFAULT, "Fetching changes.", v27, 2u);
    }
    id v14 = ASCloudKitGroupInitialDownload();
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __86__ASCloudKitManager__performNewAccountTasksCreatingSubscriptions_fetching_completion___block_invoke_445;
    v23[3] = &unk_2652168D0;
    uint64_t v25 = v34;
    uint64_t v26 = v28;
    id v24 = v9;
    [(ASCloudKitManager *)self fetchAllChangesWithPriority:2 activity:0 group:v14 completion:v23];
  }
  serialQueue = self->_serialQueue;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __86__ASCloudKitManager__performNewAccountTasksCreatingSubscriptions_fetching_completion___block_invoke_2;
  v17[3] = &unk_265216E60;
  __int16 v20 = v34;
  id v21 = buf;
  uint64_t v22 = v28;
  id v18 = v8;
  id v19 = v46;
  id v16 = v8;
  dispatch_group_notify(v9, serialQueue, v17);

  _Block_object_dispose(v28, 8);
  _Block_object_dispose(v34, 8);
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(v46, 8);
}

void __86__ASCloudKitManager__performNewAccountTasksCreatingSubscriptions_fetching_completion___block_invoke(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), obj);
  id v5 = obj;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __86__ASCloudKitManager__performNewAccountTasksCreatingSubscriptions_fetching_completion___block_invoke_445(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), obj);
  id v5 = obj;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __86__ASCloudKitManager__performNewAccountTasksCreatingSubscriptions_fetching_completion___block_invoke_2(void *a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (*(unsigned char *)(*(void *)(a1[5] + 8) + 24)) {
    BOOL v2 = *(unsigned char *)(*(void *)(a1[6] + 8) + 24) != 0;
  }
  else {
    BOOL v2 = 0;
  }
  uint64_t v3 = *(void **)(*(void *)(a1[7] + 8) + 40);
  if (!v3) {
    uint64_t v3 = *(void **)(*(void *)(a1[8] + 8) + 40);
  }
  id v4 = v3;
  ASLoggingInitialize();
  id v5 = *MEMORY[0x263F23AA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA8], OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109378;
    v7[1] = v2;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl(&dword_2474C9000, v5, OS_LOG_TYPE_DEFAULT, "Setup tasks complete, success: %{BOOL}d, error: %@", (uint8_t *)v7, 0x12u);
  }
  uint64_t v6 = a1[4];
  if (v6) {
    (*(void (**)(uint64_t, BOOL, id))(v6 + 16))(v6, v2, v4);
  }
}

- (void)_cancelNewAccountTasksTimer
{
  newAccountTasksTimer = self->_newAccountTasksTimer;
  if (newAccountTasksTimer)
  {
    dispatch_source_cancel(newAccountTasksTimer);
    id v4 = self->_newAccountTasksTimer;
    self->_newAccountTasksTimer = 0;
  }
}

- (void)_performAndRetryNewAccountTasksWithRetryInterval:(double)a3 shouldCreateSubscriptions:(BOOL)a4 shouldFetch:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  [(ASCloudKitManager *)self _cancelNewAccountTasksTimer];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __108__ASCloudKitManager__performAndRetryNewAccountTasksWithRetryInterval_shouldCreateSubscriptions_shouldFetch___block_invoke;
  void v9[3] = &unk_265216ED8;
  void v9[4] = self;
  *(double *)&v9[5] = a3;
  BOOL v10 = v6;
  BOOL v11 = v5;
  [(ASCloudKitManager *)self _performNewAccountTasksCreatingSubscriptions:v6 fetching:v5 completion:v9];
}

void __108__ASCloudKitManager__performAndRetryNewAccountTasksWithRetryInterval_shouldCreateSubscriptions_shouldFetch___block_invoke(uint64_t a1, char a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v2 + 24);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __108__ASCloudKitManager__performAndRetryNewAccountTasksWithRetryInterval_shouldCreateSubscriptions_shouldFetch___block_invoke_2;
  block[3] = &unk_265216EB0;
  char v5 = a2;
  void block[4] = v2;
  void block[5] = *(void *)(a1 + 40);
  __int16 v6 = *(_WORD *)(a1 + 48);
  dispatch_async(v3, block);
}

void __108__ASCloudKitManager__performAndRetryNewAccountTasksWithRetryInterval_shouldCreateSubscriptions_shouldFetch___block_invoke_2(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  int v2 = *(unsigned __int8 *)(a1 + 48);
  ASLoggingInitialize();
  uint64_t v3 = *MEMORY[0x263F23AA8];
  BOOL v4 = os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA8], OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2474C9000, v3, OS_LOG_TYPE_DEFAULT, "New account tasks are complete, not scheduling a retry.", buf, 2u);
    }
    [*(id *)(a1 + 32) _saveCloudKitAddressToKeyValueStore];
  }
  else
  {
    if (v4)
    {
      uint64_t v5 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 134217984;
      uint64_t v18 = v5;
      _os_log_impl(&dword_2474C9000, v3, OS_LOG_TYPE_DEFAULT, "New account tasks failed, scheduling a retry for %lf seconds from now", buf, 0xCu);
    }
    dispatch_source_t v6 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, *(dispatch_queue_t *)(*(void *)(a1 + 32) + 24));
    uint64_t v7 = *(void *)(a1 + 32);
    __int16 v8 = *(void **)(v7 + 224);
    *(void *)(v7 + 224) = v6;

    unint64_t v9 = (unint64_t)(*(double *)(a1 + 40) * 1000000000.0);
    uint64_t v10 = v9 / 0xA;
    dispatch_time_t v11 = dispatch_time(0, v9);
    dispatch_source_set_timer(*(dispatch_source_t *)(*(void *)(a1 + 32) + 224), v11, 0xFFFFFFFFFFFFFFFFLL, v10);
    double v12 = *(double *)(a1 + 40) + *(double *)(a1 + 40);
    if (v12 > 86400.0) {
      double v12 = 86400.0;
    }
    uint64_t v13 = *(void *)(a1 + 32);
    id v14 = *(NSObject **)(v13 + 224);
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __108__ASCloudKitManager__performAndRetryNewAccountTasksWithRetryInterval_shouldCreateSubscriptions_shouldFetch___block_invoke_446;
    handler[3] = &unk_265216E88;
    handler[4] = v13;
    *(double *)&handler[5] = v12;
    __int16 v16 = *(_WORD *)(a1 + 49);
    dispatch_source_set_event_handler(v14, handler);
    dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 224));
  }
}

uint64_t __108__ASCloudKitManager__performAndRetryNewAccountTasksWithRetryInterval_shouldCreateSubscriptions_shouldFetch___block_invoke_446(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performAndRetryNewAccountTasksWithRetryInterval:*(unsigned __int8 *)(a1 + 48) shouldCreateSubscriptions:*(unsigned __int8 *)(a1 + 49) shouldFetch:*(double *)(a1 + 40)];
}

- (void)_performAndRetryNewAccountTasksIfNecessaryWithShouldCreateSubscriptions:(BOOL)a3 shouldFetch:(BOOL)a4
{
  if (a3 || a4) {
    -[ASCloudKitManager _performAndRetryNewAccountTasksWithRetryInterval:shouldCreateSubscriptions:shouldFetch:](self, "_performAndRetryNewAccountTasksWithRetryInterval:shouldCreateSubscriptions:shouldFetch:", 120.0);
  }
}

- (void)_saveCloudKitAddressToKeyValueStore
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __56__ASCloudKitManager__saveCloudKitAddressToKeyValueStore__block_invoke;
  v2[3] = &unk_265216F00;
  v2[4] = self;
  [(ASCloudKitManager *)self _fetchCloudKitAddressWithCompletion:v2];
}

void __56__ASCloudKitManager__saveCloudKitAddressToKeyValueStore__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(NSObject **)(v4 + 24);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  _DWORD v7[2] = __56__ASCloudKitManager__saveCloudKitAddressToKeyValueStore__block_invoke_2;
  v7[3] = &unk_2652157C8;
  void v7[4] = v4;
  id v8 = v3;
  id v6 = v3;
  dispatch_async(v5, v7);
}

void __56__ASCloudKitManager__saveCloudKitAddressToKeyValueStore__block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  id v3 = [WeakRetained deviceLocalActivitySharingKeyValueDomain];

  uint64_t v4 = *(void *)(a1 + 40);
  id v9 = 0;
  [v3 setString:v4 forKey:@"ActivitySharingCloudKitAccountKey" error:&v9];
  id v5 = v9;
  ASLoggingInitialize();
  id v6 = *MEMORY[0x263F23AA8];
  uint64_t v7 = *MEMORY[0x263F23AA8];
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __56__ASCloudKitManager__saveCloudKitAddressToKeyValueStore__block_invoke_2_cold_1();
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412290;
    uint64_t v11 = v8;
    _os_log_impl(&dword_2474C9000, v6, OS_LOG_TYPE_DEFAULT, "Set %@ as CloudKit address in key value domain.", buf, 0xCu);
  }
}

- (BOOL)_queue_isLastCloudKitAddressDifferentFromNewCloudKitAddress:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activitySharingManager);
  id v6 = [WeakRetained deviceLocalActivitySharingKeyValueDomain];
  id v13 = 0;
  id v7 = [v6 stringForKey:@"ActivitySharingCloudKitAccountKey" error:&v13];
  id v8 = v13;

  id v9 = (os_log_t *)MEMORY[0x263F23AA8];
  if (v8)
  {
    ASLoggingInitialize();
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR)) {
      -[ASCloudKitManager _queue_isLastCloudKitAddressDifferentFromNewCloudKitAddress:]();
    }
  }
  if (v7 == v4 || v7 && ([v4 isEqualToString:v7] & 1) != 0)
  {
    BOOL v10 = 0;
  }
  else
  {
    ASLoggingInitialize();
    uint64_t v11 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v15 = v4;
      __int16 v16 = 2112;
      id v17 = v7;
      _os_log_impl(&dword_2474C9000, v11, OS_LOG_TYPE_DEFAULT, "CloudKit address (%@) does not match previous CloudKit address (%@)", buf, 0x16u);
    }
    BOOL v10 = 1;
  }

  return v10;
}

- (void)_fetchCloudKitAccountStatusAndNotifyOfChanges
{
  objc_initWeak(&location, self);
  id v3 = [(ASCloudKitManager *)self container];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __66__ASCloudKitManager__fetchCloudKitAccountStatusAndNotifyOfChanges__block_invoke;
  v4[3] = &unk_265216F28;
  objc_copyWeak(&v5, &location);
  [v3 accountStatusWithCompletionHandler:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __66__ASCloudKitManager__fetchCloudKitAccountStatusAndNotifyOfChanges__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    ASLoggingInitialize();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA8], OS_LOG_TYPE_ERROR)) {
      __66__ASCloudKitManager__fetchCloudKitAccountStatusAndNotifyOfChanges__block_invoke_cold_1();
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v7 = WeakRetained;
    if (WeakRetained) {
      [WeakRetained _handleAccountStatusChange:a2];
    }
  }
}

- (void)_handleAccountStatusChange:(int64_t)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __48__ASCloudKitManager__handleAccountStatusChange___block_invoke;
  v3[3] = &unk_265216FA0;
  v3[4] = self;
  v3[5] = a3;
  [(ASCloudKitManager *)self _fetchCloudKitAddressWithCompletion:v3];
}

void __48__ASCloudKitManager__handleAccountStatusChange___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(NSObject **)(v7 + 24);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __48__ASCloudKitManager__handleAccountStatusChange___block_invoke_2;
  v12[3] = &unk_265216D98;
  uint64_t v9 = *(void *)(a1 + 40);
  v12[4] = v7;
  id v13 = v6;
  id v14 = v5;
  uint64_t v15 = v9;
  id v10 = v5;
  id v11 = v6;
  dispatch_async(v8, v12);
}

void __48__ASCloudKitManager__handleAccountStatusChange___block_invoke_2(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  ASLoggingInitialize();
  int v2 = (os_log_t *)MEMORY[0x263F23AA8];
  id v3 = (void *)*MEMORY[0x263F23AA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA8], OS_LOG_TYPE_DEFAULT))
  {
    id v4 = v3;
    id v5 = CKStringFromAccountStatus();
    *(_DWORD *)buf = 138543362;
    uint64_t v31 = v5;
    _os_log_impl(&dword_2474C9000, v4, OS_LOG_TYPE_DEFAULT, "Fetched CloudKit account status: \"%{public}@\"", buf, 0xCu);
  }
  if (*(void *)(a1 + 56) != *(void *)(*(void *)(a1 + 32) + 216))
  {
    ASLoggingInitialize();
    id v6 = *v2;
    if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2474C9000, v6, OS_LOG_TYPE_DEFAULT, "CloudKit account status changed, handling", buf, 2u);
    }
    ASLoggingInitialize();
    os_log_t v7 = *v2;
    if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = v7;
      uint64_t v9 = CKStringFromAccountStatus();
      *(_DWORD *)buf = 138543362;
      uint64_t v31 = v9;
      _os_log_impl(&dword_2474C9000, v8, OS_LOG_TYPE_DEFAULT, "Previous account status: \"%{public}@\"", buf, 0xCu);
    }
    uint64_t v10 = *(void *)(a1 + 56);
    if (v10 == 1)
    {
      id v11 = *(void **)(a1 + 32);
      BOOL v12 = v11[27] == 3;
      if (!*(void *)(a1 + 40))
      {
        int v13 = objc_msgSend(v11, "_queue_isLastCloudKitAddressDifferentFromNewCloudKitAddress:", *(void *)(a1 + 48));
LABEL_13:
        if (v10 == 3) {
          int v14 = 1;
        }
        else {
          int v14 = v13;
        }
        ASLoggingInitialize();
        uint64_t v15 = *v2;
        if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v31) = v10 == 3;
          _os_log_impl(&dword_2474C9000, v15, OS_LOG_TYPE_DEFAULT, "isSignedOut=%d", buf, 8u);
        }
        ASLoggingInitialize();
        __int16 v16 = *v2;
        if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v31) = v12;
          _os_log_impl(&dword_2474C9000, v16, OS_LOG_TYPE_DEFAULT, "isSignedInAfterBeingSignedOut=%d", buf, 8u);
        }
        ASLoggingInitialize();
        id v17 = *v2;
        if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v31) = v13;
          _os_log_impl(&dword_2474C9000, v17, OS_LOG_TYPE_DEFAULT, "isSignedInToNewAccount=%d", buf, 8u);
        }
        ASLoggingInitialize();
        uint64_t v18 = *v2;
        if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v31) = v14;
          _os_log_impl(&dword_2474C9000, v18, OS_LOG_TYPE_DEFAULT, "shouldClearStateAndEraseFriendList=%d", buf, 8u);
        }
        ASLoggingInitialize();
        uint64_t v19 = *v2;
        if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v31) = v13;
          _os_log_impl(&dword_2474C9000, v19, OS_LOG_TYPE_DEFAULT, "shouldCreateSubscriptions=%d", buf, 8u);
        }
        ASLoggingInitialize();
        __int16 v20 = *v2;
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v31) = v13 | v12;
          _os_log_impl(&dword_2474C9000, v20, OS_LOG_TYPE_DEFAULT, "shouldPerformFetch=%d", buf, 8u);
        }
        *(void *)(*(void *)(a1 + 32) + 216) = *(void *)(a1 + 56);
        objc_msgSend(*(id *)(a1 + 32), "_queue_pushEnable");
        id v21 = *(void **)(a1 + 32);
        if (v14)
        {
          [v21 _cancelNewAccountTasksTimer];
          uint64_t v22 = *(void **)(a1 + 32);
          v27[0] = MEMORY[0x263EF8330];
          v27[1] = 3221225472;
          v27[2] = __48__ASCloudKitManager__handleAccountStatusChange___block_invoke_448;
          v27[3] = &unk_265216F50;
          v27[4] = v22;
          char v28 = v13;
          char v29 = v13 | v12;
          objc_msgSend(v22, "_queue_clearChangeTokenCacheAndFriendListWithCompletion:", v27);
        }
        else
        {
          [v21 _performAndRetryNewAccountTasksIfNecessaryWithShouldCreateSubscriptions:0 shouldFetch:v13 | v12];
        }
        uint64_t v23 = *(void *)(a1 + 32);
        id v24 = *(NSObject **)(v23 + 32);
        v26[0] = MEMORY[0x263EF8330];
        v26[1] = 3221225472;
        v26[2] = __48__ASCloudKitManager__handleAccountStatusChange___block_invoke_2_449;
        v26[3] = &unk_265216F78;
        uint64_t v25 = *(void *)(a1 + 56);
        v26[4] = v23;
        v26[5] = v25;
        dispatch_async(v24, v26);
        dispatch_async(MEMORY[0x263EF83A0], &__block_literal_global_451);
        return;
      }
    }
    else
    {
      BOOL v12 = 0;
    }
    int v13 = 0;
    goto LABEL_13;
  }
}

uint64_t __48__ASCloudKitManager__handleAccountStatusChange___block_invoke_448(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performAndRetryNewAccountTasksIfNecessaryWithShouldCreateSubscriptions:*(unsigned __int8 *)(a1 + 40) shouldFetch:*(unsigned __int8 *)(a1 + 41)];
}

uint64_t __48__ASCloudKitManager__handleAccountStatusChange___block_invoke_2_449(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_notifyObserversOfStatusChanged:", *(void *)(a1 + 40));
}

void __48__ASCloudKitManager__handleAccountStatusChange___block_invoke_3()
{
  notify_post((const char *)*MEMORY[0x263F23C98]);
  ASLoggingInitialize();
  uint64_t v0 = *MEMORY[0x263F23AA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl(&dword_2474C9000, v0, OS_LOG_TYPE_DEFAULT, "Posted notification of CloudKit account status change", v1, 2u);
  }
}

- (void)fetchCloudKitAddressWithCompletion:(id)a3
{
  id v5 = (void (**)(id, void, void *))a3;
  if ([(ASCloudKitManager *)self readyForOperations])
  {
    [(ASCloudKitManager *)self _fetchCloudKitAddressWithCompletion:v5];
  }
  else
  {
    id v4 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.ActivitySharing.CloudKitManager" code:0 userInfo:0];
    v5[2](v5, 0, v4);
  }
}

- (void)_fetchCloudKitAddressWithCompletion:(id)a3
{
  id v4 = a3;
  ASLoggingInitialize();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA8], OS_LOG_TYPE_DEBUG)) {
    -[ASCloudKitManager _fetchCloudKitAddressWithCompletion:]();
  }
  id v5 = [(ASCloudKitManager *)self container];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  _DWORD v7[2] = __57__ASCloudKitManager__fetchCloudKitAddressWithCompletion___block_invoke;
  v7[3] = &unk_265216FF0;
  id v8 = v4;
  id v6 = v4;
  [v5 fetchFullNameAndPrimaryEmailOnAccountWithCompletionHandler:v7];
}

void __57__ASCloudKitManager__fetchCloudKitAddressWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  ASLoggingInitialize();
  id v8 = *MEMORY[0x263F23AA8];
  uint64_t v9 = *MEMORY[0x263F23AA8];
  if (v7)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __57__ASCloudKitManager__fetchCloudKitAddressWithCompletion___block_invoke_cold_1();
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v6;
    _os_log_impl(&dword_2474C9000, v8, OS_LOG_TYPE_DEFAULT, "Fetched CloudKit address: %@", (uint8_t *)&v10, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)createShareWithRootRecord:(id)a3 otherRecordsToSave:(id)a4 completion:(id)a5
{
  id v17 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([(ASCloudKitManager *)self readyForOperations])
  {
    id v10 = objc_alloc(MEMORY[0x263EFD7E8]);
    id v11 = [MEMORY[0x263F08C38] UUID];
    uint64_t v12 = [v11 UUIDString];
    int v13 = [v17 recordID];
    int v14 = [v13 zoneID];
    uint64_t v15 = (void *)[v10 initWithRecordName:v12 zoneID:v14];

    __int16 v16 = [(ASCloudKitManager *)self cloudKitUtility];
    [v16 createShareAndAssociatedZoneWithShareRecordID:v15 rootRecord:v17 otherRecordsToSave:v8 completion:v9];

    id v9 = v16;
  }
  else
  {
    uint64_t v15 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.ActivitySharing.CloudKitManager" code:0 userInfo:0];
    (*((void (**)(id, void, void *, void, void, void))v9 + 2))(v9, 0, v15, 0, 0, 0);
  }
}

- (void)fetchShareWithShareRecordID:(id)a3 activity:(id)a4 group:(id)a5 completion:(id)a6
{
  id v14 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if ([(ASCloudKitManager *)self readyForOperations])
  {
    int v13 = [(ASCloudKitManager *)self cloudKitUtility];
    [v13 fetchShareWithShareRecordID:v14 activity:v10 group:v11 completion:v12];
  }
  else
  {
    int v13 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.ActivitySharing.CloudKitManager" code:0 userInfo:0];
    (*((void (**)(id, void, void *, void))v12 + 2))(v12, 0, v13, 0);
  }
}

+ (id)shareURLForShare:(id)a3
{
  return +[ASCloudKitUtility shareURLForShare:a3];
}

- (void)acceptSharesWithURLs:(id)a3 cloudKitGroup:(id)a4 completion:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([(ASCloudKitManager *)self readyForOperations])
  {
    id v10 = [(ASCloudKitManager *)self cloudKitUtility];
    [v10 acceptSharesWithURLs:v11 cloudKitGroup:v8 completion:v9];
  }
  else
  {
    id v10 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.ActivitySharing.CloudKitManager" code:0 userInfo:0];
    (*((void (**)(id, void, void *, void))v9 + 2))(v9, 0, v10, 0);
  }
}

- (void)addParticipantWithCloudKitAddress:(id)a3 toShares:(id)a4 group:(id)a5 completion:(id)a6
{
  id v14 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = (void (**)(id, void, void *))a6;
  if ([(ASCloudKitManager *)self readyForOperations])
  {
    int v13 = [(ASCloudKitManager *)self cloudKitUtility];
    [v13 addParticipantWithCloudKitAddress:v14 toShares:v10 group:v11 completion:v12];
  }
  else
  {
    int v13 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.ActivitySharing.CloudKitManager" code:0 userInfo:0];
    v12[2](v12, 0, v13);
  }
}

- (void)addParticipant:(id)a3 toShares:(id)a4 group:(id)a5 completion:(id)a6
{
  id v14 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = (void (**)(id, void, void *))a6;
  if ([(ASCloudKitManager *)self readyForOperations])
  {
    int v13 = [(ASCloudKitManager *)self cloudKitUtility];
    [v13 addParticipant:v14 toShares:v10 group:v11 completion:v12];
  }
  else
  {
    int v13 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.ActivitySharing.CloudKitManager" code:0 userInfo:0];
    v12[2](v12, 0, v13);
  }
}

- (void)removeParticipantWithCloudKitAddress:(id)a3 fromShares:(id)a4 group:(id)a5 completion:(id)a6
{
  id v14 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = (void (**)(id, void, void *))a6;
  if ([(ASCloudKitManager *)self readyForOperations])
  {
    int v13 = [(ASCloudKitManager *)self cloudKitUtility];
    [v13 removeParticipantWithCloudKitAddress:v14 fromShares:v10 group:v11 completion:v12];
  }
  else
  {
    int v13 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.ActivitySharing.CloudKitManager" code:0 userInfo:0];
    v12[2](v12, 0, v13);
  }
}

- (void)fetchShareParticipantWithCloudKitAddress:(id)a3 group:(id)a4 completion:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([(ASCloudKitManager *)self readyForOperations])
  {
    id v10 = [(ASCloudKitManager *)self cloudKitUtility];
    [v10 fetchShareParticipantForEmailAddress:v11 group:v8 completion:v9];
  }
  else
  {
    id v10 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.ActivitySharing.CloudKitManager" code:0 userInfo:0];
    (*((void (**)(id, void, void *, void))v9 + 2))(v9, 0, v10, 0);
  }
}

- (void)fetchShareParticipantForIdentifier:(id)a3 group:(id)a4 completion:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([(ASCloudKitManager *)self readyForOperations])
  {
    id v10 = [(ASCloudKitManager *)self cloudKitUtility];
    [v10 fetchShareParticipantForIdentifier:v11 group:v8 completion:v9];
  }
  else
  {
    id v10 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.ActivitySharing.CloudKitManager" code:0 userInfo:0];
    (*((void (**)(id, void, void *, void))v9 + 2))(v9, 0, v10, 0);
  }
}

- (void)_createNotificationSteps
{
  v47[2] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(ASNotificationStep);
  relationshipNotificationStep = self->_relationshipNotificationStep;
  self->_relationshipNotificationStep = v3;

  id v5 = (void *)MEMORY[0x263EFFA08];
  uint64_t v6 = *MEMORY[0x263F239D0];
  v47[0] = *MEMORY[0x263F239D8];
  v47[1] = v6;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v47 count:2];
  id v8 = [v5 setWithArray:v7];
  [(ASNotificationStep *)self->_relationshipNotificationStep setRecordTypes:v8];

  [(ASNotificationStep *)self->_relationshipNotificationStep setObjectsTransformationBlock:&__block_literal_global_459];
  [(ASNotificationStep *)self->_relationshipNotificationStep setShouldNotifyObserverBlock:&__block_literal_global_463];
  [(ASNotificationStep *)self->_relationshipNotificationStep setNotifyObserverBlock:&__block_literal_global_468];
  id v9 = objc_alloc_init(ASNotificationStep);
  remoteRelationshipNotificationStep = self->_remoteRelationshipNotificationStep;
  self->_remoteRelationshipNotificationStep = v9;

  id v11 = [(ASNotificationStep *)self->_relationshipNotificationStep recordTypes];
  id v12 = (void *)[v11 copy];
  [(ASNotificationStep *)self->_remoteRelationshipNotificationStep setRecordTypes:v12];

  int v13 = [(ASNotificationStep *)self->_relationshipNotificationStep objectsTransformationBlock];
  [(ASNotificationStep *)self->_remoteRelationshipNotificationStep setObjectsTransformationBlock:v13];

  [(ASNotificationStep *)self->_remoteRelationshipNotificationStep setShouldNotifyObserverBlock:&__block_literal_global_470];
  [(ASNotificationStep *)self->_remoteRelationshipNotificationStep setNotifyObserverBlock:&__block_literal_global_474];
  id v14 = objc_alloc_init(ASNotificationStep);
  privateDatabaseActivitySnapshotNotificationStep = self->_privateDatabaseActivitySnapshotNotificationStep;
  self->_privateDatabaseActivitySnapshotNotificationStep = v14;

  uint64_t v16 = *MEMORY[0x263F239A0];
  id v17 = [MEMORY[0x263EFFA08] setWithObject:*MEMORY[0x263F239A0]];
  [(ASNotificationStep *)self->_privateDatabaseActivitySnapshotNotificationStep setRecordTypes:v17];

  [(ASNotificationStep *)self->_privateDatabaseActivitySnapshotNotificationStep setObjectTransformationBlock:&__block_literal_global_477];
  [(ASNotificationStep *)self->_privateDatabaseActivitySnapshotNotificationStep setShouldNotifyObserverBlock:&__block_literal_global_480];
  [(ASNotificationStep *)self->_privateDatabaseActivitySnapshotNotificationStep setNotifyObserverBlock:&__block_literal_global_484];
  uint64_t v18 = objc_alloc_init(ASNotificationStep);
  activitySnapshotNotificationStep = self->_activitySnapshotNotificationStep;
  self->_activitySnapshotNotificationStep = v18;

  __int16 v20 = [MEMORY[0x263EFFA08] setWithObject:v16];
  [(ASNotificationStep *)self->_activitySnapshotNotificationStep setRecordTypes:v20];

  [(ASNotificationStep *)self->_activitySnapshotNotificationStep setObjectTransformationBlock:&__block_literal_global_486];
  [(ASNotificationStep *)self->_activitySnapshotNotificationStep setShouldNotifyObserverBlock:&__block_literal_global_488];
  [(ASNotificationStep *)self->_activitySnapshotNotificationStep setNotifyObserverBlock:&__block_literal_global_492];
  id v21 = objc_alloc_init(ASNotificationStep);
  workoutNotificationStep = self->_workoutNotificationStep;
  self->_workoutNotificationStep = v21;

  uint64_t v23 = [MEMORY[0x263EFFA08] setWithObject:*MEMORY[0x263F239E0]];
  [(ASNotificationStep *)self->_workoutNotificationStep setRecordTypes:v23];

  [(ASNotificationStep *)self->_workoutNotificationStep setObjectTransformationBlock:&__block_literal_global_495];
  [(ASNotificationStep *)self->_workoutNotificationStep setShouldNotifyObserverBlock:&__block_literal_global_498];
  [(ASNotificationStep *)self->_workoutNotificationStep setNotifyObserverBlock:&__block_literal_global_502];
  id v24 = objc_alloc_init(ASNotificationStep);
  achievementNotificationStep = self->_achievementNotificationStep;
  self->_achievementNotificationStep = v24;

  uint64_t v26 = [MEMORY[0x263EFFA08] setWithObject:*MEMORY[0x263F23990]];
  [(ASNotificationStep *)self->_achievementNotificationStep setRecordTypes:v26];

  [(ASNotificationStep *)self->_achievementNotificationStep setObjectTransformationBlock:&__block_literal_global_505];
  [(ASNotificationStep *)self->_achievementNotificationStep setShouldNotifyObserverBlock:&__block_literal_global_508];
  [(ASNotificationStep *)self->_achievementNotificationStep setNotifyObserverBlock:&__block_literal_global_512];
  uint64_t v27 = objc_alloc_init(ASNotificationStep);
  notificationEventNotificationStep = self->_notificationEventNotificationStep;
  self->_notificationEventNotificationStep = v27;

  char v29 = [MEMORY[0x263EFFA08] setWithObject:*MEMORY[0x263F239C8]];
  [(ASNotificationStep *)self->_notificationEventNotificationStep setRecordTypes:v29];

  [(ASNotificationStep *)self->_notificationEventNotificationStep setObjectTransformationBlock:&__block_literal_global_515];
  [(ASNotificationStep *)self->_notificationEventNotificationStep setShouldNotifyObserverBlock:&__block_literal_global_518];
  [(ASNotificationStep *)self->_notificationEventNotificationStep setNotifyObserverBlock:&__block_literal_global_522];
  uint64_t v30 = objc_alloc_init(ASNotificationStep);
  privateDatabaseCompetitionNotificationStep = self->_privateDatabaseCompetitionNotificationStep;
  self->_privateDatabaseCompetitionNotificationStep = v30;

  uint64_t v32 = *MEMORY[0x263F239B0];
  id v33 = [MEMORY[0x263EFFA08] setWithObject:*MEMORY[0x263F239B0]];
  [(ASNotificationStep *)self->_privateDatabaseCompetitionNotificationStep setRecordTypes:v33];

  [(ASNotificationStep *)self->_privateDatabaseCompetitionNotificationStep setObjectTransformationBlock:&__block_literal_global_525];
  [(ASNotificationStep *)self->_privateDatabaseCompetitionNotificationStep setShouldNotifyObserverBlock:&__block_literal_global_528];
  [(ASNotificationStep *)self->_privateDatabaseCompetitionNotificationStep setNotifyObserverBlock:&__block_literal_global_532];
  char v34 = objc_alloc_init(ASNotificationStep);
  competitionNotificationStep = self->_competitionNotificationStep;
  self->_competitionNotificationStep = v34;

  id v36 = [MEMORY[0x263EFFA08] setWithObject:v32];
  [(ASNotificationStep *)self->_competitionNotificationStep setRecordTypes:v36];

  [(ASNotificationStep *)self->_competitionNotificationStep setObjectTransformationBlock:&__block_literal_global_534];
  [(ASNotificationStep *)self->_competitionNotificationStep setShouldNotifyObserverBlock:&__block_literal_global_536];
  [(ASNotificationStep *)self->_competitionNotificationStep setNotifyObserverBlock:&__block_literal_global_540];
  char v37 = objc_alloc_init(ASNotificationStep);
  cloudDeviceNotificationStep = self->_cloudDeviceNotificationStep;
  self->_cloudDeviceNotificationStep = v37;

  uint64_t v39 = [MEMORY[0x263EFFA08] setWithObject:*MEMORY[0x263F239A8]];
  [(ASNotificationStep *)self->_cloudDeviceNotificationStep setRecordTypes:v39];

  [(ASNotificationStep *)self->_cloudDeviceNotificationStep setObjectTransformationBlock:&__block_literal_global_543];
  [(ASNotificationStep *)self->_cloudDeviceNotificationStep setShouldNotifyObserverBlock:&__block_literal_global_546];
  [(ASNotificationStep *)self->_cloudDeviceNotificationStep setNotifyObserverBlock:&__block_literal_global_550];
  __int16 v40 = objc_alloc_init(ASNotificationStep);
  privateDatabaseMigrationAvailableItemStep = self->_privateDatabaseMigrationAvailableItemStep;
  self->_privateDatabaseMigrationAvailableItemStep = v40;

  uint64_t v42 = *MEMORY[0x263F239C0];
  uint64_t v43 = [MEMORY[0x263EFFA08] setWithObject:*MEMORY[0x263F239C0]];
  [(ASNotificationStep *)self->_privateDatabaseMigrationAvailableItemStep setRecordTypes:v43];

  [(ASNotificationStep *)self->_privateDatabaseMigrationAvailableItemStep setObjectTransformationBlock:&__block_literal_global_553];
  [(ASNotificationStep *)self->_privateDatabaseMigrationAvailableItemStep setShouldNotifyObserverBlock:&__block_literal_global_556];
  [(ASNotificationStep *)self->_privateDatabaseMigrationAvailableItemStep setNotifyObserverBlock:&__block_literal_global_560];
  uint64_t v44 = objc_alloc_init(ASNotificationStep);
  migrationAvailableItemStep = self->_migrationAvailableItemStep;
  self->_migrationAvailableItemStep = v44;

  v46 = [MEMORY[0x263EFFA08] setWithObject:v42];
  [(ASNotificationStep *)self->_migrationAvailableItemStep setRecordTypes:v46];

  [(ASNotificationStep *)self->_migrationAvailableItemStep setObjectTransformationBlock:&__block_literal_global_562];
  [(ASNotificationStep *)self->_migrationAvailableItemStep setShouldNotifyObserverBlock:&__block_literal_global_564];
  [(ASNotificationStep *)self->_migrationAvailableItemStep setNotifyObserverBlock:&__block_literal_global_568];
}

id __45__ASCloudKitManager__createNotificationSteps__block_invoke()
{
  uint64_t v0 = (void *)MEMORY[0x263F23BF0];
  uint64_t v1 = objc_msgSend(MEMORY[0x263EFFA08], "setWithArray:");
  int v2 = [v0 relationshipsWithRelationshipAndEventRecords:v1];

  return v2;
}

uint64_t __45__ASCloudKitManager__createNotificationSteps__block_invoke_2()
{
  return objc_opt_respondsToSelector() & 1;
}

uint64_t __45__ASCloudKitManager__createNotificationSteps__block_invoke_3(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return [a3 cloudKitManager:a2 didReceiveNewRelationships:a6 fromRecordZoneWithID:a4 moreComing:a5 changesProcessedHandler:a9];
}

uint64_t __45__ASCloudKitManager__createNotificationSteps__block_invoke_4()
{
  return objc_opt_respondsToSelector() & 1;
}

uint64_t __45__ASCloudKitManager__createNotificationSteps__block_invoke_5(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return objc_msgSend(a3, "cloudKitManager:didReceiveNewRemoteRelationships:fromRecordZoneWithID:moreComing:activity:cloudKitGroup:changesProcessedHandler:", a2, a6, a4, a5);
}

uint64_t __45__ASCloudKitManager__createNotificationSteps__block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [MEMORY[0x263F0A9D0] fitnessFriendActivitySnapshotWithRecord:a3 friendUUID:0];
}

uint64_t __45__ASCloudKitManager__createNotificationSteps__block_invoke_7()
{
  return objc_opt_respondsToSelector() & 1;
}

uint64_t __45__ASCloudKitManager__createNotificationSteps__block_invoke_8(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return [a3 cloudKitManager:a2 didReceiveNewActivitySnapshotsForSelf:a6 moreComing:a5 changesProcessedHandler:a9];
}

id __45__ASCloudKitManager__createNotificationSteps__block_invoke_9(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  uint64_t v6 = [v4 recordID];
  id v7 = [v6 zoneID];
  id v8 = objc_msgSend(v5, "_observerQueue_friendUUIDForActivityDataShareRecordZoneID:", v7);

  if (v8)
  {
    id v9 = [MEMORY[0x263F0A9D0] fitnessFriendActivitySnapshotWithRecord:v4 friendUUID:v8];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

uint64_t __45__ASCloudKitManager__createNotificationSteps__block_invoke_10()
{
  return objc_opt_respondsToSelector() & 1;
}

uint64_t __45__ASCloudKitManager__createNotificationSteps__block_invoke_11(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return [a3 cloudKitManager:a2 didReceiveNewActivitySnapshots:a6 moreComing:a5 changesProcessedHandler:a9];
}

id __45__ASCloudKitManager__createNotificationSteps__block_invoke_12(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  uint64_t v6 = [v4 recordID];
  id v7 = [v6 zoneID];
  id v8 = objc_msgSend(v5, "_observerQueue_friendUUIDForActivityDataShareRecordZoneID:", v7);

  if (v8)
  {
    id v9 = [MEMORY[0x263F0A9D8] fitnessFriendWorkoutWithRecord:v4 friendUUID:v8];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

uint64_t __45__ASCloudKitManager__createNotificationSteps__block_invoke_13()
{
  return objc_opt_respondsToSelector() & 1;
}

uint64_t __45__ASCloudKitManager__createNotificationSteps__block_invoke_14(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return [a3 cloudKitManager:a2 didReceiveNewFriendWorkouts:a6 moreComing:a5 changesProcessedHandler:a9];
}

id __45__ASCloudKitManager__createNotificationSteps__block_invoke_15(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  uint64_t v6 = [v4 recordID];
  id v7 = [v6 zoneID];
  id v8 = objc_msgSend(v5, "_observerQueue_friendUUIDForActivityDataShareRecordZoneID:", v7);

  if (v8)
  {
    id v9 = [MEMORY[0x263F0A9C8] fitnessFriendAchievementWithRecord:v4 friendUUID:v8];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

uint64_t __45__ASCloudKitManager__createNotificationSteps__block_invoke_16()
{
  return objc_opt_respondsToSelector() & 1;
}

uint64_t __45__ASCloudKitManager__createNotificationSteps__block_invoke_17(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return [a3 cloudKitManager:a2 didReceiveNewFriendAchievements:a6 moreComing:a5 changesProcessedHandler:a9];
}

id __45__ASCloudKitManager__createNotificationSteps__block_invoke_18(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  uint64_t v6 = [v4 recordID];
  id v7 = [v6 zoneID];
  id v8 = objc_msgSend(v5, "_observerQueue_friendUUIDForActivityDataShareRecordZoneID:", v7);

  if (v8)
  {
    id v9 = [MEMORY[0x263F23BE8] notificationEventWithRecord:v4 friendUUID:v8];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

uint64_t __45__ASCloudKitManager__createNotificationSteps__block_invoke_19()
{
  return objc_opt_respondsToSelector() & 1;
}

uint64_t __45__ASCloudKitManager__createNotificationSteps__block_invoke_20(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return [a3 cloudKitManager:a2 didReceiveNewNotificationEvents:a6 moreComing:a5 changesProcessedHandler:a9];
}

uint64_t __45__ASCloudKitManager__createNotificationSteps__block_invoke_21()
{
  return objc_msgSend(MEMORY[0x263F23BB8], "competitionListWithRecord:");
}

uint64_t __45__ASCloudKitManager__createNotificationSteps__block_invoke_22()
{
  return objc_opt_respondsToSelector() & 1;
}

uint64_t __45__ASCloudKitManager__createNotificationSteps__block_invoke_23(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return [a3 cloudKitManager:a2 didReceiveNewCompetitionListsForSelf:a6 moreComing:a5 changesProcessedHandler:a9];
}

uint64_t __45__ASCloudKitManager__createNotificationSteps__block_invoke_24()
{
  return objc_msgSend(MEMORY[0x263F23BB8], "competitionListWithRecord:");
}

uint64_t __45__ASCloudKitManager__createNotificationSteps__block_invoke_25()
{
  return objc_opt_respondsToSelector() & 1;
}

uint64_t __45__ASCloudKitManager__createNotificationSteps__block_invoke_26(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return [a3 cloudKitManager:a2 didReceiveNewCompetitionLists:a6 moreComing:a5 changesProcessedHandler:a9];
}

uint64_t __45__ASCloudKitManager__createNotificationSteps__block_invoke_27()
{
  return objc_msgSend(MEMORY[0x263F23B10], "cloudDeviceWithRecord:");
}

uint64_t __45__ASCloudKitManager__createNotificationSteps__block_invoke_28()
{
  return objc_opt_respondsToSelector() & 1;
}

uint64_t __45__ASCloudKitManager__createNotificationSteps__block_invoke_29(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return [a3 cloudKitManager:a2 didReceiveNewCloudDevices:a6 moreComing:a5 changesProcessedHandler:a9];
}

uint64_t __45__ASCloudKitManager__createNotificationSteps__block_invoke_30()
{
  return objc_msgSend(MEMORY[0x263F23BE0], "migrationAvailableItemWithRecord:");
}

uint64_t __45__ASCloudKitManager__createNotificationSteps__block_invoke_31()
{
  return objc_opt_respondsToSelector() & 1;
}

uint64_t __45__ASCloudKitManager__createNotificationSteps__block_invoke_32(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return [a3 cloudKitManager:a2 didReceiveNewMigrationAvailableItemsForSelf:a6 moreComing:a5 changesProcessedHandler:a9];
}

uint64_t __45__ASCloudKitManager__createNotificationSteps__block_invoke_33()
{
  return objc_msgSend(MEMORY[0x263F23BE0], "migrationAvailableItemWithRecord:");
}

uint64_t __45__ASCloudKitManager__createNotificationSteps__block_invoke_34()
{
  return objc_opt_respondsToSelector() & 1;
}

uint64_t __45__ASCloudKitManager__createNotificationSteps__block_invoke_35(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return [a3 cloudKitManager:a2 didReceiveNewMigrationAvailableItems:a6 moreComing:a5 changesProcessedHandler:a9];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  observerQueue = self->_observerQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  _DWORD v7[2] = __33__ASCloudKitManager_addObserver___block_invoke;
  v7[3] = &unk_2652157C8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(observerQueue, v7);
}

void __33__ASCloudKitManager_addObserver___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  [*(id *)(*(void *)(a1 + 32) + 64) addObject:*(void *)(a1 + 40)];
  if (([*(id *)(a1 + 40) isReadyToProcessChanges] & 1) == 0)
  {
    ASLoggingInitialize();
    int v2 = *MEMORY[0x263F23AA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA8], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 40);
      int v4 = 138412290;
      uint64_t v5 = v3;
      _os_log_impl(&dword_2474C9000, v2, OS_LOG_TYPE_DEFAULT, "CloudKitManager added observer not yet ready to process changes: %@", (uint8_t *)&v4, 0xCu);
    }
    [*(id *)(*(void *)(a1 + 32) + 240) addObject:*(void *)(a1 + 40)];
    dispatch_group_enter(*(dispatch_group_t *)(*(void *)(a1 + 32) + 248));
  }
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  observerQueue = self->_observerQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  _DWORD v7[2] = __36__ASCloudKitManager_removeObserver___block_invoke;
  v7[3] = &unk_2652157C8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(observerQueue, v7);
}

void __36__ASCloudKitManager_removeObserver___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  [*(id *)(*(void *)(a1 + 32) + 64) removeObject:*(void *)(a1 + 40)];
  if ([*(id *)(*(void *)(a1 + 32) + 240) containsObject:*(void *)(a1 + 40)])
  {
    ASLoggingInitialize();
    int v2 = *MEMORY[0x263F23AA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA8], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 40);
      int v4 = 138412290;
      uint64_t v5 = v3;
      _os_log_impl(&dword_2474C9000, v2, OS_LOG_TYPE_DEFAULT, "CloudKitManager removing observer not yet ready to process changes: %@", (uint8_t *)&v4, 0xCu);
    }
    [*(id *)(*(void *)(a1 + 32) + 240) removeObject:*(void *)(a1 + 40)];
    dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 248));
  }
}

- (void)observerDidBecomeReadyToProcessChanges:(id)a3
{
  id v4 = a3;
  observerQueue = self->_observerQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  _DWORD v7[2] = __60__ASCloudKitManager_observerDidBecomeReadyToProcessChanges___block_invoke;
  v7[3] = &unk_2652157C8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(observerQueue, v7);
}

void __60__ASCloudKitManager_observerDidBecomeReadyToProcessChanges___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if ([*(id *)(*(void *)(a1 + 32) + 240) containsObject:*(void *)(a1 + 40)])
  {
    ASLoggingInitialize();
    int v2 = *MEMORY[0x263F23AA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA8], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 40);
      int v4 = 138412290;
      uint64_t v5 = v3;
      _os_log_impl(&dword_2474C9000, v2, OS_LOG_TYPE_DEFAULT, "CloudKitManager observer did become ready to process changes: %@", (uint8_t *)&v4, 0xCu);
    }
    [*(id *)(*(void *)(a1 + 32) + 240) removeObject:*(void *)(a1 + 40)];
    dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 248));
  }
}

- (void)_performBlockWhenAllObserversBecomeReady:(id)a3
{
}

- (void)_observerQueue_performNotificationStep:(id)a3 onRecords:(id)a4 dispatchGroup:(id)a5 activity:(id)a6 cloudKitGroup:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_observerQueue);
  uint64_t v22 = v12;
  uint64_t v23 = v13;
  id v24 = v14;
  uint64_t v25 = v15;
  uint64_t v26 = v16;
  id v17 = v16;
  id v18 = v15;
  id v19 = v14;
  id v20 = v13;
  id v21 = v12;
  HKWithAutoreleasePool();
}

uint64_t __107__ASCloudKitManager__observerQueue_performNotificationStep_onRecords_dispatchGroup_activity_cloudKitGroup___block_invoke(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  ASLoggingInitialize();
  int v2 = (void *)*MEMORY[0x263F23AA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA8], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void **)(a1 + 32);
    int v4 = v2;
    uint64_t v5 = [v3 recordTypes];
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v5;
    _os_log_impl(&dword_2474C9000, v4, OS_LOG_TYPE_DEFAULT, "Notifying observers of changes with types: %{public}@", (uint8_t *)&buf, 0xCu);
  }
  id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v34 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v31 = 0u;
  id v7 = *(id *)(a1 + 40);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v31 objects:v38 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v32;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v32 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = *(void **)(*((void *)&v31 + 1) + 8 * v10);
        id v12 = [*(id *)(a1 + 32) recordTypes];
        id v13 = [v11 recordType];
        int v14 = [v12 containsObject:v13];

        if (v14)
        {
          id v15 = [v11 recordID];
          id v16 = [v15 zoneID];

          id v17 = [v6 objectForKeyedSubscript:v16];
          if (!v17)
          {
            id v17 = objc_alloc_init(MEMORY[0x263EFF980]);
            [v6 setObject:v17 forKeyedSubscript:v16];
          }
          [v17 addObject:v11];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v31 objects:v38 count:16];
    }
    while (v8);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v36 = 0x2020000000;
  uint64_t v37 = 0;
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __107__ASCloudKitManager__observerQueue_performNotificationStep_onRecords_dispatchGroup_activity_cloudKitGroup___block_invoke_571;
  v23[3] = &unk_265217180;
  id v18 = *(id *)(a1 + 32);
  uint64_t v19 = *(void *)(a1 + 48);
  id v20 = *(void **)(a1 + 56);
  id v24 = v18;
  uint64_t v25 = v19;
  id v26 = v20;
  p_long long buf = &buf;
  id v21 = v6;
  id v27 = v21;
  id v28 = *(id *)(a1 + 64);
  id v29 = *(id *)(a1 + 72);
  [v21 enumerateKeysAndObjectsUsingBlock:v23];

  _Block_object_dispose(&buf, 8);
  return 1;
}

void __107__ASCloudKitManager__observerQueue_performNotificationStep_onRecords_dispatchGroup_activity_cloudKitGroup___block_invoke_571(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v9 = *(id *)(a1 + 32);
  uint64_t v10 = v6;
  id v11 = *(id *)(a1 + 48);
  id v12 = *(id *)(a1 + 56);
  id v13 = v5;
  id v14 = *(id *)(a1 + 64);
  id v15 = *(id *)(a1 + 72);
  id v7 = v5;
  id v8 = v6;
  HKWithAutoreleasePool();
  ++*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
}

uint64_t __107__ASCloudKitManager__observerQueue_performNotificationStep_onRecords_dispatchGroup_activity_cloudKitGroup___block_invoke_2(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v21 = [*(id *)(a1 + 32) objectsTransformedFromRecords:*(void *)(a1 + 40) cloudKitManager:*(void *)(a1 + 48)];
  if ([v21 count])
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id obj = *(id *)(*(void *)(a1 + 48) + 64);
    uint64_t v2 = [obj countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v2)
    {
      uint64_t v3 = v2;
      uint64_t v4 = *(void *)v27;
      id v5 = (os_log_t *)MEMORY[0x263F23AA8];
      uint64_t v20 = *(void *)v27;
      do
      {
        uint64_t v6 = 0;
        uint64_t v22 = v3;
        do
        {
          if (*(void *)v27 != v4) {
            objc_enumerationMutation(obj);
          }
          uint64_t v7 = *(void *)(*((void *)&v26 + 1) + 8 * v6);
          ASLoggingInitialize();
          os_log_t v8 = *v5;
          if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEBUG)) {
            __107__ASCloudKitManager__observerQueue_performNotificationStep_onRecords_dispatchGroup_activity_cloudKitGroup___block_invoke_2_cold_2(&v32, v8, v7, &v33);
          }
          id v9 = [*(id *)(a1 + 32) shouldNotifyObserverBlock];
          int v10 = v9[2](v9, v7);

          if (v10)
          {
            ASLoggingInitialize();
            os_log_t v11 = *v5;
            if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEBUG)) {
              __107__ASCloudKitManager__observerQueue_performNotificationStep_onRecords_dispatchGroup_activity_cloudKitGroup___block_invoke_2_cold_1(&v30, v11, v7, &v31);
            }
            dispatch_group_enter(*(dispatch_group_t *)(a1 + 56));
            unint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) + 1;
            BOOL v13 = v12 < [*(id *)(a1 + 64) count];
            id v14 = [*(id *)(a1 + 32) notifyObserverBlock];
            uint64_t v16 = *(void *)(a1 + 72);
            uint64_t v15 = *(void *)(a1 + 80);
            uint64_t v17 = *(void *)(a1 + 88);
            v24[0] = MEMORY[0x263EF8330];
            v24[1] = 3221225472;
            v24[2] = __107__ASCloudKitManager__observerQueue_performNotificationStep_onRecords_dispatchGroup_activity_cloudKitGroup___block_invoke_572;
            v24[3] = &unk_2652157C8;
            v24[4] = v7;
            uint64_t v18 = *(void *)(a1 + 48);
            id v25 = *(id *)(a1 + 56);
            ((void (**)(void, uint64_t, uint64_t, uint64_t, BOOL, void *, uint64_t, uint64_t, void *))v14)[2](v14, v18, v7, v16, v13, v21, v15, v17, v24);

            uint64_t v4 = v20;
            uint64_t v3 = v22;
            id v5 = (os_log_t *)MEMORY[0x263F23AA8];
          }
          ++v6;
        }
        while (v3 != v6);
        uint64_t v3 = [obj countByEnumeratingWithState:&v26 objects:v34 count:16];
      }
      while (v3);
    }
  }
  return 1;
}

void __107__ASCloudKitManager__observerQueue_performNotificationStep_onRecords_dispatchGroup_activity_cloudKitGroup___block_invoke_572(uint64_t a1)
{
  ASLoggingInitialize();
  uint64_t v2 = (void *)*MEMORY[0x263F23AA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA8], OS_LOG_TYPE_DEBUG)) {
    __107__ASCloudKitManager__observerQueue_performNotificationStep_onRecords_dispatchGroup_activity_cloudKitGroup___block_invoke_572_cold_1(a1, v2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (void)_observerQueue_notifyOfPrivateDatabaseDeletedRecordIDs:(id)a3 sharedDatabaseDeletedRecordIDs:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v13 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_observerQueue);
  uint64_t v6 = dispatch_group_create();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = self->_observers;
  uint64_t v7 = [(NSHashTable *)obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    unint64_t v12 = v19;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(obj);
        }
        os_log_t v11 = *(void **)(*((void *)&v21 + 1) + 8 * v10);
        if (objc_opt_respondsToSelector())
        {
          dispatch_group_enter(v6);
          v18[0] = MEMORY[0x263EF8330];
          v18[1] = 3221225472;
          v19[0] = __107__ASCloudKitManager__observerQueue_notifyOfPrivateDatabaseDeletedRecordIDs_sharedDatabaseDeletedRecordIDs___block_invoke;
          v19[1] = &unk_2652157F0;
          uint64_t v20 = v6;
          objc_msgSend(v11, "cloudKitManager:didDeleteRecordIDsForSelf:changesProcessedHandler:", self, v14, v18, v12);
        }
        if (objc_opt_respondsToSelector())
        {
          dispatch_group_enter(v6);
          v16[0] = MEMORY[0x263EF8330];
          v16[1] = 3221225472;
          v16[2] = __107__ASCloudKitManager__observerQueue_notifyOfPrivateDatabaseDeletedRecordIDs_sharedDatabaseDeletedRecordIDs___block_invoke_2;
          v16[3] = &unk_2652157F0;
          uint64_t v17 = v6;
          [v11 cloudKitManager:self didDeleteRecordIDs:v13 changesProcessedHandler:v16];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSHashTable *)obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v8);
  }

  dispatch_group_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
}

void __107__ASCloudKitManager__observerQueue_notifyOfPrivateDatabaseDeletedRecordIDs_sharedDatabaseDeletedRecordIDs___block_invoke(uint64_t a1)
{
}

void __107__ASCloudKitManager__observerQueue_notifyOfPrivateDatabaseDeletedRecordIDs_sharedDatabaseDeletedRecordIDs___block_invoke_2(uint64_t a1)
{
}

- (void)_observerQueue_notifyObserversOfBeginUpdatesForFetchWithType:(int64_t)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_observerQueue);
  ASLoggingInitialize();
  id v5 = *MEMORY[0x263F23AA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_2474C9000, v5, OS_LOG_TYPE_DEFAULT, "CloudKit Manager beginning update transaction.", buf, 2u);
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v6 = self->_observers;
  uint64_t v7 = [(NSHashTable *)v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        os_log_t v11 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v11, "cloudKitManager:didBeginUpdatesForFetchWithType:", self, a3, (void)v12);
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSHashTable *)v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
    }
    while (v8);
  }
}

- (void)_queue_notifyObserversOfStatusChanged:(int64_t)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  ASLoggingInitialize();
  id v5 = *MEMORY[0x263F23AA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_2474C9000, v5, OS_LOG_TYPE_DEFAULT, "CloudKit Manager status changed. Notifying observers", buf, 2u);
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v6 = self->_observers;
  uint64_t v7 = [(NSHashTable *)v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        os_log_t v11 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v11, "cloudKitManager:didUpdateAccountStatus:", self, a3, (void)v12);
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSHashTable *)v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
    }
    while (v8);
  }
}

- (void)_observerQueue_notifyObserversOfEndUpdatesForFetchWithType:(int64_t)a3 activity:(id)a4 cloudKitGroup:(id)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v17 = a4;
  id v16 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_observerQueue);
  ASLoggingInitialize();
  uint64_t v8 = *MEMORY[0x263F23AA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_2474C9000, v8, OS_LOG_TYPE_DEFAULT, "CloudKit Manager ending update transaction.", buf, 2u);
  }
  uint64_t v9 = dispatch_group_create();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v10 = self->_observers;
  uint64_t v11 = [(NSHashTable *)v10 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v21;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v10);
        }
        long long v15 = *(void **)(*((void *)&v20 + 1) + 8 * v14);
        if (objc_opt_respondsToSelector())
        {
          dispatch_group_enter(v9);
          v18[0] = MEMORY[0x263EF8330];
          v18[1] = 3221225472;
          void v18[2] = __103__ASCloudKitManager__observerQueue_notifyObserversOfEndUpdatesForFetchWithType_activity_cloudKitGroup___block_invoke;
          v18[3] = &unk_2652157F0;
          uint64_t v19 = v9;
          [v15 cloudKitManager:self didEndUpdatesForFetchWithType:a3 activity:v17 cloudKitGroup:v16 changesProcessedHandler:v18];
        }
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSHashTable *)v10 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v12);
  }

  dispatch_group_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
}

void __103__ASCloudKitManager__observerQueue_notifyObserversOfEndUpdatesForFetchWithType_activity_cloudKitGroup___block_invoke(uint64_t a1)
{
}

- (void)_observerQueue_notifyObserversOfServerPushHandledWithCloudKitGroup:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_observerQueue);
  ASLoggingInitialize();
  id v5 = *MEMORY[0x263F23AA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_2474C9000, v5, OS_LOG_TYPE_DEFAULT, "CloudKit Manager handled server push.", buf, 2u);
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v6 = self->_observers;
  uint64_t v7 = [(NSHashTable *)v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v11, "cloudKitManager:didHandleServerPushWithCloudKitGroup:", self, v4, (void)v12);
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSHashTable *)v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
    }
    while (v8);
  }
}

- (void)_handleNewPrivateDatabaseRecordChanges:(id)a3 sharedDatabaseRecordChanges:(id)a4 privateDatabaseDeletedRecordIDs:(id)a5 sharedDatabaseDeletedRecordIDs:(id)a6 fetchType:(int64_t)a7 activity:(id)a8 cloudKitGroup:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a8;
  id v20 = a9;
  observerQueue = self->_observerQueue;
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __184__ASCloudKitManager__handleNewPrivateDatabaseRecordChanges_sharedDatabaseRecordChanges_privateDatabaseDeletedRecordIDs_sharedDatabaseDeletedRecordIDs_fetchType_activity_cloudKitGroup___block_invoke;
  v28[3] = &unk_2652171D0;
  v28[4] = self;
  id v29 = v15;
  id v30 = v19;
  id v31 = v20;
  id v32 = v16;
  id v33 = v17;
  id v34 = v18;
  int64_t v35 = a7;
  id v22 = v18;
  id v23 = v17;
  id v24 = v16;
  id v25 = v20;
  id v26 = v19;
  id v27 = v15;
  dispatch_async(observerQueue, v28);
}

void __184__ASCloudKitManager__handleNewPrivateDatabaseRecordChanges_sharedDatabaseRecordChanges_privateDatabaseDeletedRecordIDs_sharedDatabaseDeletedRecordIDs_fetchType_activity_cloudKitGroup___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_observerQueue_notifyObserversOfBeginUpdatesForFetchWithType:", *(void *)(a1 + 88));
  objc_msgSend(*(id *)(a1 + 32), "_observerQueue_clearFriendUUIDByZoneIDCache");
  ASLoggingInitialize();
  uint64_t v2 = (os_log_t *)MEMORY[0x263F23AA8];
  uint64_t v3 = *MEMORY[0x263F23AA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_2474C9000, v3, OS_LOG_TYPE_DEFAULT, "Notifying observers of [non-remote] relationship changes", buf, 2u);
  }
  id v4 = dispatch_group_create();
  objc_msgSend(*(id *)(a1 + 32), "_observerQueue_performNotificationStep:onRecords:dispatchGroup:activity:cloudKitGroup:", *(void *)(*(void *)(a1 + 32) + 72), *(void *)(a1 + 40), v4, *(void *)(a1 + 48), *(void *)(a1 + 56));
  uint64_t v37 = v4;
  dispatch_group_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
  ASLoggingInitialize();
  id v5 = *v2;
  if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_2474C9000, v5, OS_LOG_TYPE_DEFAULT, "Notified observers of [non-remote] relationship changes.", buf, 2u);
  }
  ASLoggingInitialize();
  uint64_t v6 = *v2;
  if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_2474C9000, v6, OS_LOG_TYPE_DEFAULT, "Notifying observers of [non-remote] activity data changes", buf, 2u);
  }
  uint64_t v7 = dispatch_group_create();
  objc_msgSend(*(id *)(a1 + 32), "_observerQueue_performNotificationStep:onRecords:dispatchGroup:activity:cloudKitGroup:", *(void *)(*(void *)(a1 + 32) + 88), *(void *)(a1 + 40), v7, *(void *)(a1 + 48), *(void *)(a1 + 56));
  uint64_t v36 = v7;
  dispatch_group_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  ASLoggingInitialize();
  uint64_t v8 = *v2;
  if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_2474C9000, v8, OS_LOG_TYPE_DEFAULT, "Notified observers of [non-remote] activity data changes.", buf, 2u);
  }
  ASLoggingInitialize();
  uint64_t v9 = *v2;
  if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_2474C9000, v9, OS_LOG_TYPE_DEFAULT, "Notifying observers of [remote] relationship changes", buf, 2u);
  }
  uint64_t v10 = dispatch_group_create();
  objc_msgSend(*(id *)(a1 + 32), "_observerQueue_performNotificationStep:onRecords:dispatchGroup:activity:cloudKitGroup:", *(void *)(*(void *)(a1 + 32) + 80), *(void *)(a1 + 64), v10, *(void *)(a1 + 48), *(void *)(a1 + 56));
  int64_t v35 = v10;
  dispatch_group_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
  ASLoggingInitialize();
  uint64_t v11 = *v2;
  if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_2474C9000, v11, OS_LOG_TYPE_DEFAULT, "Notified observers of [remote] relationship changes.", buf, 2u);
  }
  ASLoggingInitialize();
  long long v12 = *v2;
  if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_2474C9000, v12, OS_LOG_TYPE_DEFAULT, "Notifying observers of activity data changes", buf, 2u);
  }
  long long v13 = dispatch_group_create();
  objc_msgSend(*(id *)(a1 + 32), "_observerQueue_performNotificationStep:onRecords:dispatchGroup:activity:cloudKitGroup:", *(void *)(*(void *)(a1 + 32) + 96), *(void *)(a1 + 64), v13, *(void *)(a1 + 48), *(void *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "_observerQueue_performNotificationStep:onRecords:dispatchGroup:activity:cloudKitGroup:", *(void *)(*(void *)(a1 + 32) + 104), *(void *)(a1 + 64), v13, *(void *)(a1 + 48), *(void *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "_observerQueue_performNotificationStep:onRecords:dispatchGroup:activity:cloudKitGroup:", *(void *)(*(void *)(a1 + 32) + 112), *(void *)(a1 + 64), v13, *(void *)(a1 + 48), *(void *)(a1 + 56));
  dispatch_group_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
  ASLoggingInitialize();
  long long v14 = *v2;
  if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_2474C9000, v14, OS_LOG_TYPE_DEFAULT, "Notified observers of activity data changes.", buf, 2u);
  }
  ASLoggingInitialize();
  id v15 = *v2;
  if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_2474C9000, v15, OS_LOG_TYPE_DEFAULT, "Notifying observers of notification event changes", buf, 2u);
  }
  id v16 = dispatch_group_create();
  objc_msgSend(*(id *)(a1 + 32), "_observerQueue_performNotificationStep:onRecords:dispatchGroup:activity:cloudKitGroup:", *(void *)(*(void *)(a1 + 32) + 120), *(void *)(a1 + 64), v16, *(void *)(a1 + 48), *(void *)(a1 + 56));
  dispatch_group_wait(v16, 0xFFFFFFFFFFFFFFFFLL);
  ASLoggingInitialize();
  id v17 = *v2;
  if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_2474C9000, v17, OS_LOG_TYPE_DEFAULT, "Notified observers of notification event changes.", buf, 2u);
  }
  ASLoggingInitialize();
  id v18 = *v2;
  if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_2474C9000, v18, OS_LOG_TYPE_DEFAULT, "Notifying observers of [non-remote] competition changes", buf, 2u);
  }
  id v19 = dispatch_group_create();
  objc_msgSend(*(id *)(a1 + 32), "_observerQueue_performNotificationStep:onRecords:dispatchGroup:activity:cloudKitGroup:", *(void *)(*(void *)(a1 + 32) + 128), *(void *)(a1 + 40), v19, *(void *)(a1 + 48), *(void *)(a1 + 56));
  dispatch_group_wait(v19, 0xFFFFFFFFFFFFFFFFLL);
  ASLoggingInitialize();
  id v20 = *v2;
  if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_2474C9000, v20, OS_LOG_TYPE_DEFAULT, "Notified observers of [non-remote] competition changes", buf, 2u);
  }
  ASLoggingInitialize();
  long long v21 = *v2;
  if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_2474C9000, v21, OS_LOG_TYPE_DEFAULT, "Notifying observers of [remote] competition changes", buf, 2u);
  }
  id v22 = dispatch_group_create();
  objc_msgSend(*(id *)(a1 + 32), "_observerQueue_performNotificationStep:onRecords:dispatchGroup:activity:cloudKitGroup:", *(void *)(*(void *)(a1 + 32) + 136), *(void *)(a1 + 64), v22, *(void *)(a1 + 48), *(void *)(a1 + 56));
  dispatch_group_wait(v22, 0xFFFFFFFFFFFFFFFFLL);
  ASLoggingInitialize();
  id v23 = *v2;
  if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_2474C9000, v23, OS_LOG_TYPE_DEFAULT, "Notified observers of [remote] competition changes", buf, 2u);
  }
  ASLoggingInitialize();
  id v24 = *v2;
  if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_2474C9000, v24, OS_LOG_TYPE_DEFAULT, "Notifying observers of cloud device changes", buf, 2u);
  }
  id v25 = dispatch_group_create();
  objc_msgSend(*(id *)(a1 + 32), "_observerQueue_performNotificationStep:onRecords:dispatchGroup:activity:cloudKitGroup:", *(void *)(*(void *)(a1 + 32) + 144), *(void *)(a1 + 40), v25, *(void *)(a1 + 48), *(void *)(a1 + 56));
  dispatch_group_wait(v25, 0xFFFFFFFFFFFFFFFFLL);
  ASLoggingInitialize();
  id v26 = *v2;
  if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_2474C9000, v26, OS_LOG_TYPE_DEFAULT, "Notified observers of cloud device changes", buf, 2u);
  }
  ASLoggingInitialize();
  id v27 = *v2;
  if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_2474C9000, v27, OS_LOG_TYPE_DEFAULT, "Notifying observers of [non-remote] migration available item changes", buf, 2u);
  }
  long long v28 = dispatch_group_create();
  objc_msgSend(*(id *)(a1 + 32), "_observerQueue_performNotificationStep:onRecords:dispatchGroup:activity:cloudKitGroup:", *(void *)(*(void *)(a1 + 32) + 152), *(void *)(a1 + 40), v28, *(void *)(a1 + 48), *(void *)(a1 + 56));
  dispatch_group_wait(v28, 0xFFFFFFFFFFFFFFFFLL);
  ASLoggingInitialize();
  id v29 = *v2;
  if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_2474C9000, v29, OS_LOG_TYPE_DEFAULT, "Notified observers of [non-remote] migration available item changes", buf, 2u);
  }
  ASLoggingInitialize();
  id v30 = *v2;
  if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_2474C9000, v30, OS_LOG_TYPE_DEFAULT, "Notifying observers of [remote] migration available item changes", buf, 2u);
  }
  id v31 = dispatch_group_create();
  objc_msgSend(*(id *)(a1 + 32), "_observerQueue_performNotificationStep:onRecords:dispatchGroup:activity:cloudKitGroup:", *(void *)(*(void *)(a1 + 32) + 160), *(void *)(a1 + 64), v31, *(void *)(a1 + 48), *(void *)(a1 + 56));
  dispatch_group_wait(v31, 0xFFFFFFFFFFFFFFFFLL);
  ASLoggingInitialize();
  id v32 = *v2;
  if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_2474C9000, v32, OS_LOG_TYPE_DEFAULT, "Notified observers of [remote] migration available item changes", buf, 2u);
  }
  ASLoggingInitialize();
  id v33 = *v2;
  if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_2474C9000, v33, OS_LOG_TYPE_DEFAULT, "Notifying observers of private and shared database deleted records", buf, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "_observerQueue_notifyOfPrivateDatabaseDeletedRecordIDs:sharedDatabaseDeletedRecordIDs:", *(void *)(a1 + 72), *(void *)(a1 + 80));
  ASLoggingInitialize();
  id v34 = *v2;
  if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_2474C9000, v34, OS_LOG_TYPE_DEFAULT, "Notified observers of private and shared database deleted records", buf, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "_observerQueue_clearFriendUUIDByZoneIDCache");
  objc_msgSend(*(id *)(a1 + 32), "_observerQueue_notifyObserversOfEndUpdatesForFetchWithType:activity:cloudKitGroup:", *(void *)(a1 + 88), *(void *)(a1 + 48), *(void *)(a1 + 56));
}

- (id)_observerQueue_friendUUIDForActivityDataShareRecordZoneID:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_observerQueue);
  id v5 = [(NSDictionary *)self->_friendUUIDsByZoneID objectForKeyedSubscript:v4];

  if (!v5)
  {
    int v6 = ASSecureCloudEnabled();
    id WeakRetained = objc_loadWeakRetained((id *)&self->_contactsManager);
    if (v6)
    {
      uint64_t v8 = v23;
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      uint64_t v9 = __79__ASCloudKitManager__observerQueue_friendUUIDForActivityDataShareRecordZoneID___block_invoke;
    }
    else
    {
      uint64_t v8 = &v21;
      uint64_t v21 = MEMORY[0x263EF8330];
      uint64_t v22 = 3221225472;
      uint64_t v9 = __79__ASCloudKitManager__observerQueue_friendUUIDForActivityDataShareRecordZoneID___block_invoke_2;
    }
    v8[2] = (uint64_t)v9;
    v8[3] = (uint64_t)&unk_265215C30;
    id v10 = v4;
    v8[4] = (uint64_t)v10;
    uint64_t v11 = [WeakRetained contactMatchingCriteriaBlock:v8];

    long long v12 = (void *)[(NSDictionary *)self->_friendUUIDsByZoneID mutableCopy];
    long long v13 = v12;
    if (v12)
    {
      id v14 = v12;
    }
    else
    {
      id v14 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:1];
    }
    id v15 = v14;

    id v16 = [v11 UUID];
    [v15 setObject:v16 forKeyedSubscript:v10];

    id v17 = [NSDictionary dictionaryWithDictionary:v15];
    friendUUIDsByZoneID = self->_friendUUIDsByZoneID;
    self->_friendUUIDsByZoneID = v17;
  }
  id v19 = -[NSDictionary objectForKeyedSubscript:](self->_friendUUIDsByZoneID, "objectForKeyedSubscript:", v4, v21, v22);

  return v19;
}

uint64_t __79__ASCloudKitManager__observerQueue_friendUUIDForActivityDataShareRecordZoneID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 relationshipStorage];
  id v5 = [v4 secureCloudRemoteRelationship];
  int v6 = [v5 secureCloudZoneName];

  uint64_t v7 = [v3 relationshipStorage];

  uint64_t v8 = [v7 legacyRelationship];
  uint64_t v9 = [v8 remoteActivityDataShareID];

  id v10 = [v9 zoneID];
  if ([v10 isEqual:*(void *)(a1 + 32)])
  {
    uint64_t v11 = 1;
  }
  else
  {
    long long v12 = [*(id *)(a1 + 32) zoneName];
    uint64_t v11 = [v6 isEqual:v12];
  }
  return v11;
}

uint64_t __79__ASCloudKitManager__observerQueue_friendUUIDForActivityDataShareRecordZoneID___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 relationshipStorage];
  id v4 = [v3 legacyRelationship];
  id v5 = [v4 remoteActivityDataShareID];

  int v6 = [v5 zoneID];
  uint64_t v7 = [v6 isEqual:*(void *)(a1 + 32)];

  return v7;
}

- (void)_observerQueue_clearFriendUUIDByZoneIDCache
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_observerQueue);
  friendUUIDsByZoneID = self->_friendUUIDsByZoneID;
  self->_friendUUIDsByZoneID = 0;
}

- (void)fetchCloudKitAccountInfoWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  if ([(ASCloudKitManager *)self readyForOperations])
  {
    id v5 = [(ASCloudKitManager *)self container];
    [v5 accountInfoWithCompletionHandler:v4];
  }
  else
  {
    id v5 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.ActivitySharing.CloudKitManager" code:0 userInfo:0];
    v4[2](v4, 0);
  }
}

- (id)currentAccountInfo
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__9;
  id v10 = __Block_byref_object_dispose__9;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __39__ASCloudKitManager_currentAccountInfo__block_invoke;
  v5[3] = &unk_265215FF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __39__ASCloudKitManager_currentAccountInfo__block_invoke(uint64_t a1)
{
}

- (id)currentCloudKitAddress
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__9;
  id v10 = __Block_byref_object_dispose__9;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __43__ASCloudKitManager_currentCloudKitAddress__block_invoke;
  v5[3] = &unk_265215FF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __43__ASCloudKitManager_currentCloudKitAddress__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  id v3 = [WeakRetained deviceLocalActivitySharingKeyValueDomain];
  id v8 = 0;
  uint64_t v4 = [v3 stringForKey:@"ActivitySharingCloudKitAccountKey" error:&v8];
  id v5 = v8;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v4;

  if (v5)
  {
    ASLoggingInitialize();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA8], OS_LOG_TYPE_ERROR)) {
      -[ASCloudKitManager _queue_isLastCloudKitAddressDifferentFromNewCloudKitAddress:]();
    }
  }
}

- (void)updateCurrentAccountInfo:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  _DWORD v7[2] = __46__ASCloudKitManager_updateCurrentAccountInfo___block_invoke;
  v7[3] = &unk_2652157C8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(serialQueue, v7);
}

void __46__ASCloudKitManager_updateCurrentAccountInfo___block_invoke(uint64_t a1)
{
}

- (void)updateCloudKitAddress
{
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__ASCloudKitManager_updateCloudKitAddress__block_invoke;
  block[3] = &unk_2652157F0;
  void block[4] = self;
  dispatch_async(serialQueue, block);
}

uint64_t __42__ASCloudKitManager_updateCloudKitAddress__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _saveCloudKitAddressToKeyValueStore];
}

- (void)notifyOfCloudKitAccountStatusUpdate:(int64_t)a3
{
  observerQueue = self->_observerQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __57__ASCloudKitManager_notifyOfCloudKitAccountStatusUpdate___block_invoke;
  v4[3] = &unk_265216F78;
  void v4[4] = self;
  void v4[5] = a3;
  dispatch_async(observerQueue, v4);
  dispatch_async(MEMORY[0x263EF83A0], &__block_literal_global_589);
}

uint64_t __57__ASCloudKitManager_notifyOfCloudKitAccountStatusUpdate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_notifyObserversOfStatusChanged:", *(void *)(a1 + 40));
}

void __57__ASCloudKitManager_notifyOfCloudKitAccountStatusUpdate___block_invoke_2()
{
  notify_post((const char *)*MEMORY[0x263F23C98]);
  ASLoggingInitialize();
  uint64_t v0 = *MEMORY[0x263F23AA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl(&dword_2474C9000, v0, OS_LOG_TYPE_DEFAULT, "Posted notification of CloudKit account status change", v1, 2u);
  }
}

- (ASCloudKitManagerSecureCloudDelegate)secureCloudDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_secureCloudDelegate);
  return (ASCloudKitManagerSecureCloudDelegate *)WeakRetained;
}

- (void)setSecureCloudDelegate:(id)a3
{
}

- (ASCloudKitUtility)cloudKitUtility
{
  return self->_cloudKitUtility;
}

- (void)setCloudKitUtility:(id)a3
{
}

- (void)setContainer:(id)a3
{
}

- (NSDate)dateOfLastSuccessfulFetch
{
  return self->_dateOfLastSuccessfulFetch;
}

- (void)setDateOfLastSuccessfulFetch:(id)a3
{
}

- (void)setReadyForOperations:(BOOL)a3
{
  self->_readyForOperations = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateOfLastSuccessfulFetch, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_cloudKitUtility, 0);
  objc_destroyWeak((id *)&self->_secureCloudDelegate);
  objc_storeStrong((id *)&self->_fetchTransaction, 0);
  objc_storeStrong((id *)&self->_observersNotReadyGroup, 0);
  objc_storeStrong((id *)&self->_observersNotReady, 0);
  objc_storeStrong((id *)&self->_friendUUIDsByZoneID, 0);
  objc_storeStrong((id *)&self->_newAccountTasksTimer, 0);
  objc_storeStrong((id *)&self->_serverChangeTokenCache, 0);
  objc_storeStrong((id *)&self->_blocksWaitingOnFetch, 0);
  objc_storeStrong((id *)&self->_cloudKitAccountInfo, 0);
  objc_storeStrong((id *)&self->_migrationAvailableItemStep, 0);
  objc_storeStrong((id *)&self->_privateDatabaseMigrationAvailableItemStep, 0);
  objc_storeStrong((id *)&self->_cloudDeviceNotificationStep, 0);
  objc_storeStrong((id *)&self->_competitionNotificationStep, 0);
  objc_storeStrong((id *)&self->_privateDatabaseCompetitionNotificationStep, 0);
  objc_storeStrong((id *)&self->_notificationEventNotificationStep, 0);
  objc_storeStrong((id *)&self->_achievementNotificationStep, 0);
  objc_storeStrong((id *)&self->_workoutNotificationStep, 0);
  objc_storeStrong((id *)&self->_activitySnapshotNotificationStep, 0);
  objc_storeStrong((id *)&self->_privateDatabaseActivitySnapshotNotificationStep, 0);
  objc_storeStrong((id *)&self->_remoteRelationshipNotificationStep, 0);
  objc_storeStrong((id *)&self->_relationshipNotificationStep, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_activityDataShare, 0);
  objc_storeStrong((id *)&self->_apsConnection, 0);
  objc_storeStrong((id *)&self->_changeTokenQueue, 0);
  objc_storeStrong((id *)&self->_observerQueue, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_destroyWeak((id *)&self->_contactsManager);
  objc_destroyWeak((id *)&self->_activitySharingManager);
}

void __44__ASCloudKitManager_beginHandlingOperations__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2474C9000, v0, v1, "Error initializing hasCompletedFirstFetch from key value domain: %{public}@", v2, v3, v4, v5, v6);
}

void __44__ASCloudKitManager_beginHandlingOperations__block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __44__ASCloudKitManager_beginHandlingOperations__block_invoke_cold_3(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)long long buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_2474C9000, log, OS_LOG_TYPE_ERROR, "Failed to create container with exception %{public}@", buf, 0xCu);
}

void __141__ASCloudKitManager__queue_startFetchAllChangesOperationWithPriority_activity_changeTokenCache_secureCloudChangeTokenCache_group_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2474C9000, v0, v1, "Fetching changes in private database failed with error: %{public}@", v2, v3, v4, v5, v6);
}

void __141__ASCloudKitManager__queue_startFetchAllChangesOperationWithPriority_activity_changeTokenCache_secureCloudChangeTokenCache_group_completion___block_invoke_395_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2474C9000, v0, v1, "Fetching changes in shared database failed with error: %{public}@", v2, v3, v4, v5, v6);
}

void __141__ASCloudKitManager__queue_startFetchAllChangesOperationWithPriority_activity_changeTokenCache_secureCloudChangeTokenCache_group_completion___block_invoke_396_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2474C9000, v0, v1, "Fetching changes in secure cloud private database failed with error: %{public}@", v2, v3, v4, v5, v6);
}

void __141__ASCloudKitManager__queue_startFetchAllChangesOperationWithPriority_activity_changeTokenCache_secureCloudChangeTokenCache_group_completion___block_invoke_398_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2474C9000, v0, v1, "Fetching changes in secure cloud shared database failed with error: %{public}@", v2, v3, v4, v5, v6);
}

void __65__ASCloudKitManager__fetchAllChangesWithPriority_activity_group___block_invoke_405_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_queue_setHasCompletedFirstFetch:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2474C9000, v0, v1, "Error updating key value domain with completed first fetch: %{public}@", v2, v3, v4, v5, v6);
}

void __123__ASCloudKitManager__subscribeToChangesInDatabase_subscriptionPrefix_recordTypes_zoneNames_recordTypesToDelete_completion___block_invoke_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = a2;
  [v4 databaseScope];
  uint8_t v6 = CKDatabaseScopeString();
  OUTLINED_FUNCTION_1_0();
  __int16 v8 = 2114;
  uint64_t v9 = a3;
  _os_log_error_impl(&dword_2474C9000, v5, OS_LOG_TYPE_ERROR, "Failed to save subscriptions into database %{public}@ with error: %{public}@", v7, 0x16u);
}

void __56__ASCloudKitManager__saveCloudKitAddressToKeyValueStore__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2474C9000, v0, v1, "Error setting new CloudKit address in key value domain: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_queue_isLastCloudKitAddressDifferentFromNewCloudKitAddress:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2474C9000, v0, v1, "Error reading previous CloudKit address from key value domain: %{public}@", v2, v3, v4, v5, v6);
}

void __66__ASCloudKitManager__fetchCloudKitAccountStatusAndNotifyOfChanges__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2474C9000, v0, v1, "Error getting CloudKit account status: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_fetchCloudKitAddressWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_5();
  _os_log_debug_impl(&dword_2474C9000, v0, OS_LOG_TYPE_DEBUG, "Fetching cloudKit address", v1, 2u);
}

void __57__ASCloudKitManager__fetchCloudKitAddressWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2474C9000, v0, v1, "Error fetching CloudKit address: %{public}@", v2, v3, v4, v5, v6);
}

void __107__ASCloudKitManager__observerQueue_performNotificationStep_onRecords_dispatchGroup_activity_cloudKitGroup___block_invoke_2_cold_1(_DWORD *a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  uint64_t v7 = objc_opt_class();
  *a1 = 138412290;
  *a4 = v7;
  id v8 = v7;
  OUTLINED_FUNCTION_4_0(&dword_2474C9000, v9, v10, "Notifying observer of class %@");
}

void __107__ASCloudKitManager__observerQueue_performNotificationStep_onRecords_dispatchGroup_activity_cloudKitGroup___block_invoke_2_cold_2(_DWORD *a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  uint64_t v7 = objc_opt_class();
  *a1 = 138412290;
  *a4 = v7;
  id v8 = v7;
  OUTLINED_FUNCTION_4_0(&dword_2474C9000, v9, v10, "Evaluating shouldNotifyObserverBlock for observer of class %@");
}

void __107__ASCloudKitManager__observerQueue_performNotificationStep_onRecords_dispatchGroup_activity_cloudKitGroup___block_invoke_572_cold_1(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v2 = a2;
  objc_opt_class();
  OUTLINED_FUNCTION_1_0();
  id v4 = v3;
  _os_log_debug_impl(&dword_2474C9000, v2, OS_LOG_TYPE_DEBUG, "Finished notifying observer of class %@", v5, 0xCu);
}

@end