@interface ASActivityDataManager
- (ASActivityDataManager)init;
- (ASActivityDataManager)initWithDatabaseClient:(id)a3 isWatch:(BOOL)a4;
- (ASActivitySharingManager)activitySharingManager;
- (ASCloudKitManager)cloudKitManager;
- (ASDatabaseClient)databaseClient;
- (ASFriendListManager)friendListManager;
- (ASPeriodicUpdateManager)periodicUpdateManager;
- (BOOL)_hasMoveGoalForActivitySummary:(id)a3;
- (BOOL)_isAlertSuppressionEnabled;
- (BOOL)_queue_deleteActivityDataForFriendWithUUID:(id)a3;
- (BOOL)_queue_deleteAllActivitySharingData;
- (BOOL)deleteActivityDataForFriendWithUUID:(id)a3;
- (BOOL)deleteAllActivitySharingData;
- (BOOL)isReadyToProcessChanges;
- (BOOL)isWatch;
- (HKActivitySummary)currentActivitySummary;
- (HKActivitySummary)yesterdayActivitySummary;
- (NSSet)currentAchievements;
- (NSSet)currentWorkouts;
- (NSSet)yesterdayWorkouts;
- (_HKFitnessFriendActivitySnapshot)currentActivitySnapshot;
- (_HKFitnessFriendActivitySnapshot)yesterdayActivitySnapshot;
- (id)_achievementsToPushWithYesterdaySnapshot:(id)a3 todaySnapshot:(id)a4 currentTodayAchievementAnchorToken:(id)a5 currentYesterdayAchievementAnchorToken:(id)a6;
- (id)_activitySnapshotsToPushWithYesterdaySnapshot:(id)a3 todaySnapshot:(id)a4;
- (id)_endDatePredicate;
- (id)_filterAchievements:(id)a3 forSnapshotIndex:(int64_t)a4;
- (id)_fitnessFriendAchievementPredicateForFriendUUID:(id)a3;
- (id)_fitnessFriendActivitySnapshotPredicateForFriendUUID:(id)a3;
- (id)_fitnessFriendSamplePredicateForFriendUUID:(id)a3;
- (id)_fitnessFriendWorkoutPredicateForFriendUUID:(id)a3;
- (id)_persistedAnchorTokenWithKey:(id)a3;
- (id)_persistedAnchorWithKey:(id)a3;
- (id)_workoutsAfterAnchor:(id *)a3 withPredicate:(id)a4;
- (id)_workoutsToPushWithYesterdaySnapshot:(id)a3 todaySnapshot:(id)a4 currentWorkoutAnchor:(id)a5;
- (id)achievementsFromFitnessFriendSamples:(id)a3;
- (id)activitySnapshotsFromFitnessFriendSamples:(id)a3;
- (id)fitnessFriendSamplesForFriendWithUUID:(id)a3;
- (id)localSourceUUID;
- (id)notificationEventsToPushWithYesterdaySnapshot:(id)a3 todaySnapshot:(id)a4 achievements:(id)a5 workouts:(id)a6 currentDeletedWorkoutAnchor:(id)a7 currentGoalCompletionAnchor:(id)a8;
- (id)recordIDsToDelete;
- (id)recordsFromActivityDataCodables:(id)a3 recordEncryptionType:(int64_t)a4;
- (id)recordsToSave;
- (id)workoutsFromFitnessFriendSamples:(id)a3;
- (void)_ckQueue_handleDeletedWorkoutEvents:(id)a3 completion:(id)a4;
- (void)_ckQueue_handleNewSnapshotsForSelf:(id)a3 moreComing:(BOOL)a4;
- (void)_ckQueue_processActivitySnapshotsForSelf:(id)a3;
- (void)_handleNewSnapshots:(id)a3 workouts:(id)a4 achievements:(id)a5 moreComing:(BOOL)a6;
- (void)_isAlertSuppressionEnabled;
- (void)_queue_getAndHandleAllActivitySharingData;
- (void)_queue_handleNewSnapshots:(id)a3 workouts:(id)a4 achievements:(id)a5;
- (void)_queue_insertSamples:(id)a3;
- (void)_queue_persistAnchorTokenValue:(id)a3 forKey:(id)a4;
- (void)_queue_persistAnchorValue:(id)a3 forKey:(id)a4;
- (void)_queue_samplesAdded:(id)a3;
- (void)_queue_saveFitnessFriendActivitySnapshots:(id)a3 workouts:(id)a4 achievements:(id)a5 isInvitationData:(BOOL)a6;
- (void)_queue_setLastPushedDeletedWorkoutAnchor:(id)a3;
- (void)_queue_setLastPushedGoalCompletionAnchor:(id)a3;
- (void)_queue_setLastPushedTodayAchievementAnchorToken:(id)a3;
- (void)_queue_setLastPushedWorkoutAnchor:(id)a3;
- (void)_queue_setSecureCloudGoalCompletionAnchor:(id)a3;
- (void)_workoutsForActivitySnapshot:(id)a3 anchor:(id)a4 completion:(id)a5;
- (void)achievementStore:(id)a3 didUpdateAchievements:(id)a4;
- (void)activitySharingManagerReady:(id)a3;
- (void)addObserver:(id)a3;
- (void)beginObservingData;
- (void)cloudKitManager:(id)a3 didReceiveNewActivitySnapshots:(id)a4 moreComing:(BOOL)a5 changesProcessedHandler:(id)a6;
- (void)cloudKitManager:(id)a3 didReceiveNewActivitySnapshotsForSelf:(id)a4 moreComing:(BOOL)a5 changesProcessedHandler:(id)a6;
- (void)cloudKitManager:(id)a3 didReceiveNewFriendAchievements:(id)a4 moreComing:(BOOL)a5 changesProcessedHandler:(id)a6;
- (void)cloudKitManager:(id)a3 didReceiveNewFriendWorkouts:(id)a4 moreComing:(BOOL)a5 changesProcessedHandler:(id)a6;
- (void)cloudKitManager:(id)a3 didReceiveNewNotificationEvents:(id)a4 moreComing:(BOOL)a5 changesProcessedHandler:(id)a6;
- (void)currentAchievements;
- (void)currentActivitySummaryHelper:(id)a3 didUpdateTodayActivitySummary:(id)a4 changedFields:(unint64_t)a5;
- (void)currentActivitySummaryHelper:(id)a3 didUpdateYesterdayActivitySummary:(id)a4 changedFields:(unint64_t)a5;
- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4;
- (void)dealloc;
- (void)endObservingData;
- (void)fetchAreMultipleDevicesSharingDataForSnapshotIndex:(id)a3 withCompletion:(id)a4;
- (void)findDeletedWorkoutEventsWithAnchor:(id)a3 completion:(id)a4;
- (void)loadLocalActivityDataIfNeeded;
- (void)periodicUpdateManager:(id)a3 didFailToSaveRecords:(id)a4 activity:(id)a5;
- (void)periodicUpdateManager:(id)a3 didSaveRecords:(id)a4 activity:(id)a5;
- (void)removeObserver:(id)a3;
- (void)samplesAdded:(id)a3 anchor:(id)a4;
- (void)saveActivitySnapshots:(id)a3 workouts:(id)a4 achievements:(id)a5 isInvitationData:(BOOL)a6;
- (void)setActivitySharingManager:(id)a3;
- (void)setCloudKitManager:(id)a3;
- (void)setDatabaseClient:(id)a3;
- (void)setFriendListManager:(id)a3;
- (void)setIsWatch:(BOOL)a3;
- (void)setPeriodicUpdateManager:(id)a3;
- (void)updateSecureCloudGoalCompletionAnchor:(id)a3;
@end

@implementation ASActivityDataManager

- (void)loadLocalActivityDataIfNeeded
{
  healthDataQueue = self->_healthDataQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__ASActivityDataManager_loadLocalActivityDataIfNeeded__block_invoke;
  block[3] = &unk_2652157F0;
  block[4] = self;
  dispatch_async(healthDataQueue, block);
}

uint64_t __54__ASActivityDataManager_loadLocalActivityDataIfNeeded__block_invoke(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(result + 32) + 208))
  {
    uint64_t v1 = result;
    ASLoggingInitialize();
    v2 = *MEMORY[0x263F23AA0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_2474C9000, v2, OS_LOG_TYPE_DEFAULT, "Retrying activity data load", v3, 2u);
    }
    return objc_msgSend(*(id *)(v1 + 32), "_queue_getAndHandleAllActivitySharingData");
  }
  return result;
}

- (ASActivityDataManager)init
{
  return 0;
}

- (ASActivityDataManager)initWithDatabaseClient:(id)a3 isWatch:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v24.receiver = self;
  v24.super_class = (Class)ASActivityDataManager;
  v7 = [(ASActivityDataManager *)&v24 init];
  v8 = v7;
  if (v7)
  {
    [(ASActivityDataManager *)v7 setDatabaseClient:v6];
    [(ASActivityDataManager *)v8 setIsWatch:v4];
    v8->_useNewAchievementsSystem = ACHShouldUseNewAwardsSystem();
    uint64_t v9 = HKCreateSerialDispatchQueue();
    cloudKitManagerObserverQueue = v8->_cloudKitManagerObserverQueue;
    v8->_cloudKitManagerObserverQueue = (OS_dispatch_queue *)v9;

    uint64_t v11 = HKCreateSerialDispatchQueue();
    healthDataQueue = v8->_healthDataQueue;
    v8->_healthDataQueue = (OS_dispatch_queue *)v11;

    uint64_t v13 = HKCreateSerialDispatchQueue();
    activitySummaryQueue = v8->_activitySummaryQueue;
    v8->_activitySummaryQueue = (OS_dispatch_queue *)v13;

    uint64_t v15 = HKCreateSerialDispatchQueue();
    observerQueue = v8->_observerQueue;
    v8->_observerQueue = (OS_dispatch_queue *)v15;

    uint64_t v17 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendar");
    calendar = v8->_calendar;
    v8->_calendar = (NSCalendar *)v17;

    uint64_t v19 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    observers = v8->_observers;
    v8->_observers = (NSHashTable *)v19;

    uint64_t v21 = [NSDictionary dictionary];
    snapshotSourceUUIDsByIndex = v8->_snapshotSourceUUIDsByIndex;
    v8->_snapshotSourceUUIDsByIndex = (NSDictionary *)v21;
  }
  return v8;
}

- (void)activitySharingManagerReady:(id)a3
{
  id v4 = a3;
  [(ASActivityDataManager *)self setActivitySharingManager:v4];
  v5 = [v4 cloudKitManager];
  [(ASActivityDataManager *)self setCloudKitManager:v5];

  id v6 = [v4 friendListManager];
  [(ASActivityDataManager *)self setFriendListManager:v6];

  v7 = [v4 periodicUpdateManager];

  [(ASActivityDataManager *)self setPeriodicUpdateManager:v7];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_periodicUpdateManager);
  [WeakRetained addProvider:self];
}

- (void)dealloc
{
  [(ASActivityDataManager *)self endObservingData];
  v3.receiver = self;
  v3.super_class = (Class)ASActivityDataManager;
  [(ASActivityDataManager *)&v3 dealloc];
}

- (void)beginObservingData
{
  v22[3] = *MEMORY[0x263EF8340];
  objc_super v3 = [(ASActivityDataManager *)self cloudKitManager];
  [v3 addObserver:self];

  id v4 = [(ASActivityDataManager *)self _persistedAnchorWithKey:@"LastPushedWorkoutAnchor"];
  lastPushedWorkoutAnchor = self->_lastPushedWorkoutAnchor;
  self->_lastPushedWorkoutAnchor = v4;

  objc_storeStrong((id *)&self->_currentWorkoutAnchor, self->_lastPushedWorkoutAnchor);
  id v6 = [(ASActivityDataManager *)self _persistedAnchorWithKey:@"LastPushedDeletedWorkoutAnchor"];
  lastPushedDeletedWorkoutAnchor = self->_lastPushedDeletedWorkoutAnchor;
  self->_lastPushedDeletedWorkoutAnchor = v6;

  objc_storeStrong((id *)&self->_currentDeletedWorkoutAnchor, self->_lastPushedDeletedWorkoutAnchor);
  v8 = [(ASActivityDataManager *)self _persistedAnchorTokenWithKey:@"LastPushedTodayAchievementAnchorToken"];
  lastPushedTodayAchievementAnchorToken = self->_lastPushedTodayAchievementAnchorToken;
  self->_lastPushedTodayAchievementAnchorToken = v8;

  objc_storeStrong((id *)&self->_currentTodayAchievementAnchorToken, self->_lastPushedTodayAchievementAnchorToken);
  v10 = [(ASActivityDataManager *)self _persistedAnchorWithKey:@"LastPushedGoalCompletionAnchor"];
  lastPushedGoalCompletionAnchor = self->_lastPushedGoalCompletionAnchor;
  self->_lastPushedGoalCompletionAnchor = v10;

  objc_storeStrong((id *)&self->_currentGoalCompletionAnchor, self->_lastPushedGoalCompletionAnchor);
  v12 = [(ASActivityDataManager *)self _persistedAnchorWithKey:@"SecureCloudGoalCompletionAnchor"];
  secureCloudGoalCompletionAnchor = self->_secureCloudGoalCompletionAnchor;
  self->_secureCloudGoalCompletionAnchor = v12;

  v14 = [MEMORY[0x263F0A6E8] fitnessFriendActivitySnapshotType];
  v22[0] = v14;
  uint64_t v15 = [MEMORY[0x263F0A6E8] fitnessFriendAchievementType];
  v22[1] = v15;
  v16 = [MEMORY[0x263F0A6E8] fitnessFriendWorkoutType];
  v22[2] = v16;
  uint64_t v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:3];

  [(ASDatabaseClient *)self->_databaseClient addSampleObserver:self sampleTypes:v17];
  activitySummaryQueue = self->_activitySummaryQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__ASActivityDataManager_beginObservingData__block_invoke;
  block[3] = &unk_2652157F0;
  block[4] = self;
  dispatch_async(activitySummaryQueue, block);
  [(ASDatabaseClient *)self->_databaseClient addCurrentActivitySummaryObserver:self];
  [(ASDatabaseClient *)self->_databaseClient addProtectedDataObserver:self];
  healthDataQueue = self->_healthDataQueue;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __43__ASActivityDataManager_beginObservingData__block_invoke_2;
  v20[3] = &unk_2652157F0;
  v20[4] = self;
  dispatch_async(healthDataQueue, v20);
}

void __43__ASActivityDataManager_beginObservingData__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 288) todayActivitySummary];
  uint64_t v3 = [v2 copy];
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 144);
  *(void *)(v4 + 144) = v3;

  id v9 = [*(id *)(*(void *)(a1 + 32) + 288) yesterdayActivitySummary];
  uint64_t v6 = [v9 copy];
  uint64_t v7 = *(void *)(a1 + 32);
  v8 = *(void **)(v7 + 168);
  *(void *)(v7 + 168) = v6;
}

uint64_t __43__ASActivityDataManager_beginObservingData__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_getAndHandleAllActivitySharingData");
}

- (void)endObservingData
{
  v8[3] = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263F0A6E8] fitnessFriendActivitySnapshotType];
  uint64_t v4 = objc_msgSend(MEMORY[0x263F0A6E8], "fitnessFriendAchievementType", v3);
  v8[1] = v4;
  v5 = [MEMORY[0x263F0A6E8] fitnessFriendWorkoutType];
  v8[2] = v5;
  uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:3];

  [(ASDatabaseClient *)self->_databaseClient removeSampleObserver:self sampleTypes:v6];
  [(ASDatabaseClient *)self->_databaseClient removeCurrentActivitySummaryObserver:self];
  [(ASDatabaseClient *)self->_databaseClient removeProtectedDataObserver:self];
  uint64_t v7 = [(ASActivityDataManager *)self cloudKitManager];
  [v7 removeObserver:self];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  observerQueue = self->_observerQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __37__ASActivityDataManager_addObserver___block_invoke;
  v7[3] = &unk_2652157C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(observerQueue, v7);
}

uint64_t __37__ASActivityDataManager_addObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 216) addObject:*(void *)(a1 + 40)];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  observerQueue = self->_observerQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __40__ASActivityDataManager_removeObserver___block_invoke;
  v7[3] = &unk_2652157C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(observerQueue, v7);
}

uint64_t __40__ASActivityDataManager_removeObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 216) removeObject:*(void *)(a1 + 40)];
}

- (void)achievementStore:(id)a3 didUpdateAchievements:(id)a4
{
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_friendListManager);
  int v7 = [WeakRetained hasLegacyFriendsToShareWith];

  if (v7)
  {
    ASLoggingInitialize();
    id v8 = *MEMORY[0x263F23AA0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2474C9000, v8, OS_LOG_TYPE_DEFAULT, "Achievements updated, checking for new today achievements to push", buf, 2u);
    }
    databaseClient = self->_databaseClient;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __64__ASActivityDataManager_achievementStore_didUpdateAchievements___block_invoke;
    v10[3] = &unk_265215F38;
    v10[4] = self;
    id v11 = v5;
    [(ASDatabaseClient *)databaseClient isActivityAlertSuppressionEnabledWithCompletion:v10];
  }
}

void __64__ASActivityDataManager_achievementStore_didUpdateAchievements___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    ASLoggingInitialize();
    v2 = *MEMORY[0x263F23AA0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2474C9000, v2, OS_LOG_TYPE_DEFAULT, "Alerts are currently suppressed, not checking for achievements to push", buf, 2u);
    }
  }
  else
  {
    *(void *)buf = 0;
    v18 = buf;
    uint64_t v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__1;
    uint64_t v21 = __Block_byref_object_dispose__1;
    id v22 = 0;
    uint64_t v11 = 0;
    v12 = &v11;
    uint64_t v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__1;
    uint64_t v15 = __Block_byref_object_dispose__1;
    id v16 = 0;
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(NSObject **)(v4 + 128);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __64__ASActivityDataManager_achievementStore_didUpdateAchievements___block_invoke_319;
    block[3] = &unk_265215F10;
    block[4] = v4;
    void block[5] = buf;
    block[6] = &v11;
    dispatch_sync(v5, block);
    id v6 = objc_msgSend(*(id *)(a1 + 32), "_filterAchievements:forSnapshotIndex:", *(void *)(a1 + 40), objc_msgSend(*((id *)v18 + 5), "_activitySummaryIndex"));
    int v7 = _AchievementsNotIncludedInAnchorToken(v6, (void *)v12[5]);
    if ([v7 count])
    {
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 280));
      id v9 = ASCloudKitGroupUserActionImplicit();
      [WeakRetained requestImmediateUpdateWithCloudKitGroup:v9 completion:0];
    }
    _Block_object_dispose(&v11, 8);

    _Block_object_dispose(buf, 8);
  }
}

uint64_t __64__ASActivityDataManager_achievementStore_didUpdateAchievements___block_invoke_319(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 144) copy];
  uint64_t v3 = *(void *)(a1[5] + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 88) copy];
  return MEMORY[0x270F9A758]();
}

- (void)_handleNewSnapshots:(id)a3 workouts:(id)a4 achievements:(id)a5 moreComing:(BOOL)a6
{
  id v24 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v24)
  {
    newSnapshots = self->_newSnapshots;
    if (newSnapshots)
    {
      uint64_t v13 = [(NSArray *)newSnapshots arrayByAddingObjectsFromArray:v24];
    }
    else
    {
      uint64_t v13 = (NSArray *)[v24 copy];
    }
    v14 = self->_newSnapshots;
    self->_newSnapshots = v13;
  }
  if (v10)
  {
    newWorkouts = self->_newWorkouts;
    if (newWorkouts)
    {
      id v16 = [(NSArray *)newWorkouts arrayByAddingObjectsFromArray:v10];
    }
    else
    {
      id v16 = (NSArray *)[v10 copy];
    }
    uint64_t v17 = self->_newWorkouts;
    self->_newWorkouts = v16;
  }
  if (v11)
  {
    newAchievements = self->_newAchievements;
    if (newAchievements)
    {
      uint64_t v19 = [(NSArray *)newAchievements arrayByAddingObjectsFromArray:v11];
    }
    else
    {
      uint64_t v19 = (NSArray *)[v11 copy];
    }
    v20 = self->_newAchievements;
    self->_newAchievements = v19;
  }
  if (!a6)
  {
    [(ASActivityDataManager *)self saveActivitySnapshots:self->_newSnapshots workouts:self->_newWorkouts achievements:self->_newAchievements isInvitationData:0];
    uint64_t v21 = self->_newSnapshots;
    self->_newSnapshots = 0;

    id v22 = self->_newWorkouts;
    self->_newWorkouts = 0;

    v23 = self->_newAchievements;
    self->_newAchievements = 0;
  }
}

- (void)_ckQueue_handleNewSnapshotsForSelf:(id)a3 moreComing:(BOOL)a4
{
  id v6 = a3;
  if (v6)
  {
    newSnapshotsForSelf = self->_newSnapshotsForSelf;
    if (newSnapshotsForSelf)
    {
      id v8 = [(NSArray *)newSnapshotsForSelf arrayByAddingObjectsFromArray:v6];
    }
    else
    {
      id v8 = (NSArray *)[v6 copy];
    }
    id v9 = self->_newSnapshotsForSelf;
    self->_newSnapshotsForSelf = v8;
  }
  if (!a4)
  {
    [(ASActivityDataManager *)self _ckQueue_processActivitySnapshotsForSelf:self->_newSnapshotsForSelf];
    id v10 = self->_newSnapshotsForSelf;
    self->_newSnapshotsForSelf = 0;
  }
  MEMORY[0x270F9A758]();
}

- (BOOL)isReadyToProcessChanges
{
  return self->_hasFetchedProtectedData;
}

- (void)cloudKitManager:(id)a3 didReceiveNewActivitySnapshotsForSelf:(id)a4 moreComing:(BOOL)a5 changesProcessedHandler:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  cloudKitManagerObserverQueue = self->_cloudKitManagerObserverQueue;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __114__ASActivityDataManager_cloudKitManager_didReceiveNewActivitySnapshotsForSelf_moreComing_changesProcessedHandler___block_invoke;
  v14[3] = &unk_265215F60;
  v14[4] = self;
  id v15 = v9;
  BOOL v17 = a5;
  id v16 = v10;
  id v12 = v10;
  id v13 = v9;
  dispatch_async(cloudKitManagerObserverQueue, v14);
}

void __114__ASActivityDataManager_cloudKitManager_didReceiveNewActivitySnapshotsForSelf_moreComing_changesProcessedHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_ckQueue_handleNewSnapshotsForSelf:moreComing:", *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 56));
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __114__ASActivityDataManager_cloudKitManager_didReceiveNewActivitySnapshotsForSelf_moreComing_changesProcessedHandler___block_invoke_2;
  block[3] = &unk_2652157A0;
  id v3 = *(id *)(a1 + 48);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __114__ASActivityDataManager_cloudKitManager_didReceiveNewActivitySnapshotsForSelf_moreComing_changesProcessedHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)cloudKitManager:(id)a3 didReceiveNewActivitySnapshots:(id)a4 moreComing:(BOOL)a5 changesProcessedHandler:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  cloudKitManagerObserverQueue = self->_cloudKitManagerObserverQueue;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __107__ASActivityDataManager_cloudKitManager_didReceiveNewActivitySnapshots_moreComing_changesProcessedHandler___block_invoke;
  v14[3] = &unk_265215F60;
  v14[4] = self;
  id v15 = v9;
  BOOL v17 = a5;
  id v16 = v10;
  id v12 = v10;
  id v13 = v9;
  dispatch_async(cloudKitManagerObserverQueue, v14);
}

void __107__ASActivityDataManager_cloudKitManager_didReceiveNewActivitySnapshots_moreComing_changesProcessedHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _handleNewSnapshots:*(void *)(a1 + 40) workouts:0 achievements:0 moreComing:*(unsigned __int8 *)(a1 + 56)];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __107__ASActivityDataManager_cloudKitManager_didReceiveNewActivitySnapshots_moreComing_changesProcessedHandler___block_invoke_2;
  block[3] = &unk_2652157A0;
  id v3 = *(id *)(a1 + 48);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __107__ASActivityDataManager_cloudKitManager_didReceiveNewActivitySnapshots_moreComing_changesProcessedHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)cloudKitManager:(id)a3 didReceiveNewFriendWorkouts:(id)a4 moreComing:(BOOL)a5 changesProcessedHandler:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  cloudKitManagerObserverQueue = self->_cloudKitManagerObserverQueue;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __104__ASActivityDataManager_cloudKitManager_didReceiveNewFriendWorkouts_moreComing_changesProcessedHandler___block_invoke;
  v14[3] = &unk_265215F60;
  v14[4] = self;
  id v15 = v9;
  BOOL v17 = a5;
  id v16 = v10;
  id v12 = v10;
  id v13 = v9;
  dispatch_async(cloudKitManagerObserverQueue, v14);
}

void __104__ASActivityDataManager_cloudKitManager_didReceiveNewFriendWorkouts_moreComing_changesProcessedHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _handleNewSnapshots:0 workouts:*(void *)(a1 + 40) achievements:0 moreComing:*(unsigned __int8 *)(a1 + 56)];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __104__ASActivityDataManager_cloudKitManager_didReceiveNewFriendWorkouts_moreComing_changesProcessedHandler___block_invoke_2;
  block[3] = &unk_2652157A0;
  id v3 = *(id *)(a1 + 48);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __104__ASActivityDataManager_cloudKitManager_didReceiveNewFriendWorkouts_moreComing_changesProcessedHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)cloudKitManager:(id)a3 didReceiveNewFriendAchievements:(id)a4 moreComing:(BOOL)a5 changesProcessedHandler:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  cloudKitManagerObserverQueue = self->_cloudKitManagerObserverQueue;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __108__ASActivityDataManager_cloudKitManager_didReceiveNewFriendAchievements_moreComing_changesProcessedHandler___block_invoke;
  v14[3] = &unk_265215F60;
  v14[4] = self;
  id v15 = v9;
  BOOL v17 = a5;
  id v16 = v10;
  id v12 = v10;
  id v13 = v9;
  dispatch_async(cloudKitManagerObserverQueue, v14);
}

void __108__ASActivityDataManager_cloudKitManager_didReceiveNewFriendAchievements_moreComing_changesProcessedHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _handleNewSnapshots:0 workouts:0 achievements:*(void *)(a1 + 40) moreComing:*(unsigned __int8 *)(a1 + 56)];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __108__ASActivityDataManager_cloudKitManager_didReceiveNewFriendAchievements_moreComing_changesProcessedHandler___block_invoke_2;
  block[3] = &unk_2652157A0;
  id v3 = *(id *)(a1 + 48);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __108__ASActivityDataManager_cloudKitManager_didReceiveNewFriendAchievements_moreComing_changesProcessedHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)cloudKitManager:(id)a3 didReceiveNewNotificationEvents:(id)a4 moreComing:(BOOL)a5 changesProcessedHandler:(id)a6
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v9 = a4;
  id v10 = a6;
  ASLoggingInitialize();
  id v11 = (void *)*MEMORY[0x263F23AA0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA0], OS_LOG_TYPE_DEFAULT))
  {
    id v12 = v11;
    *(_DWORD *)buf = 134217984;
    uint64_t v22 = [v9 count];
    _os_log_impl(&dword_2474C9000, v12, OS_LOG_TYPE_DEFAULT, "Recieved %lu new notification events", buf, 0xCu);
  }
  cloudKitManagerObserverQueue = self->_cloudKitManagerObserverQueue;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __108__ASActivityDataManager_cloudKitManager_didReceiveNewNotificationEvents_moreComing_changesProcessedHandler___block_invoke;
  v16[3] = &unk_265215F60;
  id v17 = v9;
  v18 = self;
  BOOL v20 = a5;
  id v19 = v10;
  id v14 = v10;
  id v15 = v9;
  dispatch_async(cloudKitManagerObserverQueue, v16);
}

void __108__ASActivityDataManager_cloudKitManager_didReceiveNewNotificationEvents_moreComing_changesProcessedHandler___block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  ASLoggingInitialize();
  uint64_t v2 = (os_log_t *)MEMORY[0x263F23AA0];
  id v3 = (void *)*MEMORY[0x263F23AA0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA0], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void **)(a1 + 32);
    id v5 = v3;
    *(_DWORD *)buf = 134217984;
    uint64_t v34 = [v4 count];
    _os_log_impl(&dword_2474C9000, v5, OS_LOG_TYPE_DEFAULT, "Processing %lu new notification events", buf, 0xCu);
  }
  id v6 = *(void **)(a1 + 32);
  int v7 = [MEMORY[0x263F08A98] predicateWithBlock:&__block_literal_global_2];
  id v8 = [v6 filteredArrayUsingPredicate:v7];

  uint64_t v9 = *(void *)(a1 + 40);
  id v12 = *(void **)(v9 + 48);
  id v10 = (id *)(v9 + 48);
  id v11 = v12;
  if (v12) {
    id v13 = v11;
  }
  else {
    id v13 = (void *)MEMORY[0x263EFFA68];
  }
  objc_storeStrong(v10, v13);
  uint64_t v14 = [*(id *)(*(void *)(a1 + 40) + 48) arrayByAddingObjectsFromArray:v8];
  uint64_t v15 = *(void *)(a1 + 40);
  id v16 = *(void **)(v15 + 48);
  *(void *)(v15 + 48) = v14;

  int v17 = *(unsigned __int8 *)(a1 + 56);
  ASLoggingInitialize();
  v18 = *v2;
  BOOL v19 = os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT);
  if (v17)
  {
    if (!v19)
    {
LABEL_10:
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      goto LABEL_17;
    }
    *(_WORD *)buf = 0;
    BOOL v20 = "More notification events coming, calling changesProcessedHandler";
LABEL_9:
    _os_log_impl(&dword_2474C9000, v18, OS_LOG_TYPE_DEFAULT, v20, buf, 2u);
    goto LABEL_10;
  }
  if (v19)
  {
    uint64_t v21 = *(void **)(*(void *)(a1 + 40) + 48);
    uint64_t v22 = v18;
    uint64_t v23 = [v21 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v34 = v23;
    _os_log_impl(&dword_2474C9000, v22, OS_LOG_TYPE_DEFAULT, "Received events for %lu deleted workout(s)", buf, 0xCu);
  }
  uint64_t v24 = [*(id *)(*(void *)(a1 + 40) + 48) count];
  ASLoggingInitialize();
  v18 = *v2;
  BOOL v25 = os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT);
  if (!v24)
  {
    if (!v25) {
      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    BOOL v20 = "No new deleted workouts, calling changesProcessedHandler";
    goto LABEL_9;
  }
  if (v25)
  {
    v26 = *(void **)(*(void *)(a1 + 40) + 48);
    v27 = v18;
    uint64_t v28 = [v26 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v34 = v28;
    _os_log_impl(&dword_2474C9000, v27, OS_LOG_TYPE_DEFAULT, "There are %lu new deleted workouts, handling.", buf, 0xCu);
  }
  v29 = *(void **)(a1 + 40);
  uint64_t v30 = v29[6];
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __108__ASActivityDataManager_cloudKitManager_didReceiveNewNotificationEvents_moreComing_changesProcessedHandler___block_invoke_324;
  v31[3] = &unk_265215FA8;
  v31[4] = v29;
  id v32 = *(id *)(a1 + 48);
  objc_msgSend(v29, "_ckQueue_handleDeletedWorkoutEvents:completion:", v30, v31);

LABEL_17:
}

BOOL __108__ASActivityDataManager_cloudKitManager_didReceiveNewNotificationEvents_moreComing_changesProcessedHandler___block_invoke_322(uint64_t a1, void *a2)
{
  return [a2 type] == 3;
}

void __108__ASActivityDataManager_cloudKitManager_didReceiveNewNotificationEvents_moreComing_changesProcessedHandler___block_invoke_324(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (!v5 && a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 272));
    [WeakRetained updateFriendListWithDeletedWorkoutEvents:*(void *)(*(void *)(a1 + 32) + 48)];

    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = *(void **)(v7 + 48);
    *(void *)(v7 + 48) = 0;
  }
  ASLoggingInitialize();
  uint64_t v9 = *MEMORY[0x263F23AA0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl(&dword_2474C9000, v9, OS_LOG_TYPE_DEFAULT, "Finished handling deleted workouts, calling changesProcessedHandler", v10, 2u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_ckQueue_processActivitySnapshotsForSelf:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  ASLoggingInitialize();
  id v5 = (os_log_t *)MEMORY[0x263F23AA0];
  id v6 = (void *)*MEMORY[0x263F23AA0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA0], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = v6;
    *(_DWORD *)buf = 134217984;
    uint64_t v33 = [v4 count];
    _os_log_impl(&dword_2474C9000, v7, OS_LOG_TYPE_DEFAULT, "Processing %lu snapshots of self.", buf, 0xCu);
  }
  ASLoggingInitialize();
  id v8 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v33 = (uint64_t)v4;
    _os_log_impl(&dword_2474C9000, v8, OS_LOG_TYPE_DEFAULT, "Incoming snapshots for self are: %@", buf, 0xCu);
  }
  v26 = self;
  uint64_t v9 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:self->_snapshotSourceUUIDsByIndex];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v10 = v4;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v28 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        id v16 = [v15 sourceUUID];

        if (v16)
        {
          int v17 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v15, "snapshotIndex"));
          v18 = [v9 objectForKeyedSubscript:v17];

          if (!v18)
          {
            v18 = [MEMORY[0x263EFFA08] set];
          }
          BOOL v19 = [v15 sourceUUID];
          BOOL v20 = [v18 setByAddingObject:v19];

          uint64_t v21 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v15, "snapshotIndex"));
          [v9 setObject:v20 forKeyedSubscript:v21];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v12);
  }

  uint64_t v22 = [NSDictionary dictionaryWithDictionary:v9];
  snapshotSourceUUIDsByIndex = v26->_snapshotSourceUUIDsByIndex;
  v26->_snapshotSourceUUIDsByIndex = (NSDictionary *)v22;

  ASLoggingInitialize();
  uint64_t v24 = *MEMORY[0x263F23AA0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA0], OS_LOG_TYPE_DEFAULT))
  {
    BOOL v25 = v26->_snapshotSourceUUIDsByIndex;
    *(_DWORD *)buf = 138412290;
    uint64_t v33 = (uint64_t)v25;
    _os_log_impl(&dword_2474C9000, v24, OS_LOG_TYPE_DEFAULT, "Final snapshot dict for self: %@", buf, 0xCu);
  }
}

- (void)fetchAreMultipleDevicesSharingDataForSnapshotIndex:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  cloudKitManagerObserverQueue = self->_cloudKitManagerObserverQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __91__ASActivityDataManager_fetchAreMultipleDevicesSharingDataForSnapshotIndex_withCompletion___block_invoke;
  block[3] = &unk_265215FD0;
  id v12 = v6;
  uint64_t v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(cloudKitManagerObserverQueue, block);
}

void __91__ASActivityDataManager_fetchAreMultipleDevicesSharingDataForSnapshotIndex_withCompletion___block_invoke(void *a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)a1[4];
  if (v2)
  {
    id v3 = v2;
  }
  else
  {
    id v4 = NSNumber;
    id v5 = [MEMORY[0x263EFF910] date];
    id v6 = _HKActivityCacheDateComponentsFromDate();
    id v3 = [v4 numberWithLongLong:_HKCacheIndexFromDateComponents()];
  }
  id v7 = *(void **)(a1[5] + 288);
  id v19 = 0;
  id v8 = [v7 activeDeviceUUIDWithError:&v19];
  id v9 = v19;
  ASLoggingInitialize();
  id v10 = (os_log_t *)MEMORY[0x263F23AA0];
  uint64_t v11 = *MEMORY[0x263F23AA0];
  id v12 = *MEMORY[0x263F23AA0];
  if (v8) {
    BOOL v13 = v9 == 0;
  }
  else {
    BOOL v13 = 0;
  }
  if (v13)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v21 = v3;
      __int16 v22 = 2114;
      uint64_t v23 = v8;
      _os_log_impl(&dword_2474C9000, v11, OS_LOG_TYPE_DEFAULT, "Multiple devices sharing status requested for snapshot index: %{public}@, active device UUID: %{public}@", buf, 0x16u);
    }
    uint64_t v15 = [*(id *)(a1[5] + 200) objectForKeyedSubscript:v3];
    id v16 = [MEMORY[0x263EFFA08] setWithObject:v8];
    int v17 = [v15 isEqualToSet:v16] ^ 1;

    ASLoggingInitialize();
    v18 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v21) = v17;
      _os_log_impl(&dword_2474C9000, v18, OS_LOG_TYPE_DEFAULT, "Are multiple devices sharing: %{BOOL}d", buf, 8u);
    }
    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    BOOL v14 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
    if (v9)
    {
      if (v14) {
        __91__ASActivityDataManager_fetchAreMultipleDevicesSharingDataForSnapshotIndex_withCompletion___block_invoke_cold_1();
      }
    }
    else if (v14)
    {
      __91__ASActivityDataManager_fetchAreMultipleDevicesSharingDataForSnapshotIndex_withCompletion___block_invoke_cold_2();
    }
    (*(void (**)(void))(a1[6] + 16))();
  }
}

- (HKActivitySummary)currentActivitySummary
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__1;
  id v10 = __Block_byref_object_dispose__1;
  id v11 = 0;
  activitySummaryQueue = self->_activitySummaryQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __47__ASActivityDataManager_currentActivitySummary__block_invoke;
  v5[3] = &unk_265215FF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(activitySummaryQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (HKActivitySummary *)v3;
}

uint64_t __47__ASActivityDataManager_currentActivitySummary__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 144) copy];
  return MEMORY[0x270F9A758]();
}

- (HKActivitySummary)yesterdayActivitySummary
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__1;
  id v10 = __Block_byref_object_dispose__1;
  id v11 = 0;
  activitySummaryQueue = self->_activitySummaryQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __49__ASActivityDataManager_yesterdayActivitySummary__block_invoke;
  v5[3] = &unk_265215FF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(activitySummaryQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (HKActivitySummary *)v3;
}

uint64_t __49__ASActivityDataManager_yesterdayActivitySummary__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 168) copy];
  return MEMORY[0x270F9A758]();
}

- (_HKFitnessFriendActivitySnapshot)currentActivitySnapshot
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__1;
  id v10 = __Block_byref_object_dispose__1;
  id v11 = 0;
  activitySummaryQueue = self->_activitySummaryQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __48__ASActivityDataManager_currentActivitySnapshot__block_invoke;
  v5[3] = &unk_265215FF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(activitySummaryQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (_HKFitnessFriendActivitySnapshot *)v3;
}

uint64_t __48__ASActivityDataManager_currentActivitySnapshot__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [MEMORY[0x263F0A9D0] snapshotWithActivitySummary:*(void *)(*(void *)(a1 + 32) + 144)];
  return MEMORY[0x270F9A758]();
}

- (_HKFitnessFriendActivitySnapshot)yesterdayActivitySnapshot
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__1;
  id v10 = __Block_byref_object_dispose__1;
  id v11 = 0;
  activitySummaryQueue = self->_activitySummaryQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __50__ASActivityDataManager_yesterdayActivitySnapshot__block_invoke;
  v5[3] = &unk_265215FF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(activitySummaryQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (_HKFitnessFriendActivitySnapshot *)v3;
}

uint64_t __50__ASActivityDataManager_yesterdayActivitySnapshot__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [MEMORY[0x263F0A9D0] snapshotWithActivitySummary:*(void *)(*(void *)(a1 + 32) + 168)];
  return MEMORY[0x270F9A758]();
}

- (NSSet)currentWorkouts
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__1;
  id v11 = __Block_byref_object_dispose__1;
  id v12 = 0;
  id v3 = [(ASActivityDataManager *)self currentActivitySnapshot];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __40__ASActivityDataManager_currentWorkouts__block_invoke;
  v6[3] = &unk_265216020;
  v6[4] = &v7;
  [(ASActivityDataManager *)self _workoutsForActivitySnapshot:v3 anchor:0 completion:v6];
  id v4 = (id)v8[5];

  _Block_object_dispose(&v7, 8);
  return (NSSet *)v4;
}

void __40__ASActivityDataManager_currentWorkouts__block_invoke(uint64_t a1, void *a2)
{
}

- (NSSet)yesterdayWorkouts
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__1;
  id v11 = __Block_byref_object_dispose__1;
  id v12 = 0;
  id v3 = [(ASActivityDataManager *)self yesterdayActivitySnapshot];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __42__ASActivityDataManager_yesterdayWorkouts__block_invoke;
  v6[3] = &unk_265216020;
  v6[4] = &v7;
  [(ASActivityDataManager *)self _workoutsForActivitySnapshot:v3 anchor:0 completion:v6];
  id v4 = (id)v8[5];

  _Block_object_dispose(&v7, 8);
  return (NSSet *)v4;
}

void __42__ASActivityDataManager_yesterdayWorkouts__block_invoke(uint64_t a1, void *a2)
{
}

- (NSSet)currentAchievements
{
  id v3 = [(ASActivityDataManager *)self currentActivitySnapshot];
  if (self->_useNewAchievementsSystem)
  {
    id WeakRetained = objc_alloc_init(MEMORY[0x263F238D8]);
    id v10 = 0;
    id v5 = [WeakRetained allAchievementsWithError:&v10];
    id v6 = v10;
    if (v6)
    {
      ASLoggingInitialize();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA0], OS_LOG_TYPE_ERROR)) {
        -[ASActivityDataManager currentAchievements]();
      }
    }
    uint64_t v7 = [MEMORY[0x263EFFA08] setWithArray:v5];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_achievementStore);
    uint64_t v7 = [WeakRetained allAchievements];
  }

  uint64_t v8 = -[ASActivityDataManager _filterAchievements:forSnapshotIndex:](self, "_filterAchievements:forSnapshotIndex:", v7, [v3 snapshotIndex]);

  return (NSSet *)v8;
}

- (void)_queue_saveFitnessFriendActivitySnapshots:(id)a3 workouts:(id)a4 achievements:(id)a5 isInvitationData:(BOOL)a6
{
  BOOL v6 = a6;
  healthDataQueue = self->_healthDataQueue;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  dispatch_assert_queue_V2(healthDataQueue);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_friendListManager);
  id v15 = +[ASActivityDataValidator validatedSamplesFromAchievements:v11 workouts:v12 activitySnapshots:v13 friendListManager:WeakRetained isInvitationData:v6];

  [(ASActivityDataManager *)self _queue_insertSamples:v15];
}

- (void)_queue_insertSamples:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_healthDataQueue);
  if ([v4 count])
  {
    databaseClient = self->_databaseClient;
    id v12 = 0;
    BOOL v6 = [(ASDatabaseClient *)databaseClient insertDataObjects:v4 error:&v12];
    id v7 = v12;
    ASLoggingInitialize();
    uint64_t v8 = (void *)*MEMORY[0x263F23AA0];
    if (!v6 || v7)
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA0], OS_LOG_TYPE_ERROR)) {
        -[ASActivityDataManager _queue_insertSamples:]();
      }
    }
    else if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA0], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = v8;
      uint64_t v10 = [v4 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v14 = v10;
      _os_log_impl(&dword_2474C9000, v9, OS_LOG_TYPE_DEFAULT, "Saved activity sharing data to database: %lu samples.", buf, 0xCu);
    }
  }
  else
  {
    ASLoggingInitialize();
    id v11 = *MEMORY[0x263F23AA0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2474C9000, v11, OS_LOG_TYPE_DEFAULT, "No samples to save.", buf, 2u);
    }
  }
}

- (void)saveActivitySnapshots:(id)a3 workouts:(id)a4 achievements:(id)a5 isInvitationData:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  healthDataQueue = self->_healthDataQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __86__ASActivityDataManager_saveActivitySnapshots_workouts_achievements_isInvitationData___block_invoke;
  block[3] = &unk_265216048;
  void block[4] = self;
  id v18 = v10;
  id v19 = v11;
  id v20 = v12;
  BOOL v21 = a6;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_sync(healthDataQueue, block);
}

uint64_t __86__ASActivityDataManager_saveActivitySnapshots_workouts_achievements_isInvitationData___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_saveFitnessFriendActivitySnapshots:workouts:achievements:isInvitationData:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(unsigned __int8 *)(a1 + 64));
}

- (BOOL)_queue_deleteAllActivitySharingData
{
  v41[3] = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_healthDataQueue);
  ASLoggingInitialize();
  id v3 = *MEMORY[0x263F23AA0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2474C9000, v3, OS_LOG_TYPE_DEFAULT, "Deleting all friend data!", buf, 2u);
  }
  id v4 = [MEMORY[0x263F0A598] fitnessFriendAchievementType];
  v41[0] = v4;
  id v5 = [MEMORY[0x263F0A598] fitnessFriendActivitySnapshotType];
  v41[1] = v5;
  BOOL v6 = [MEMORY[0x263F0A598] fitnessFriendWorkoutType];
  v41[2] = v6;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v41 count:3];

  uint64_t v8 = (void *)MEMORY[0x263F0A668];
  uint64_t v9 = [MEMORY[0x263EFF910] distantPast];
  id v10 = [MEMORY[0x263EFF910] distantFuture];
  id v11 = [v8 predicateForSamplesWithStartDate:v9 endDate:v10 options:0];

  id v12 = [MEMORY[0x263F434D0] truePredicate];
  id v13 = [[ASPredicateContainer alloc] initWithHealthKitPredicate:v11 healthDaemonPredicate:v12];
  uint64_t v35 = 0;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = v7;
  uint64_t v14 = [obj countByEnumeratingWithState:&v31 objects:v40 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    long long v27 = v12;
    long long v28 = v11;
    id v16 = 0;
    uint64_t v17 = *(void *)v32;
    char v18 = 1;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        id v20 = v16;
        if (*(void *)v32 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v21 = *(void *)(*((void *)&v31 + 1) + 8 * i);
        databaseClient = self->_databaseClient;
        id v30 = v16;
        BOOL v23 = [(ASDatabaseClient *)databaseClient deleteDataObjectsOfType:v21 predicate:v13 limit:0 deletedSampleCount:&v35 notifyObservers:0 generateDeletedObjects:0 error:&v30];
        id v16 = v30;

        ASLoggingInitialize();
        uint64_t v24 = *MEMORY[0x263F23AA0];
        BOOL v25 = *MEMORY[0x263F23AA0];
        if (v23)
        {
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v37 = v21;
            __int16 v38 = 2048;
            id v39 = v35;
            _os_log_impl(&dword_2474C9000, v24, OS_LOG_TYPE_DEFAULT, "Deleted friend data of type %@ successfully, %lu samples.", buf, 0x16u);
          }
        }
        else
        {
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v37 = v21;
            __int16 v38 = 2114;
            id v39 = v16;
            _os_log_error_impl(&dword_2474C9000, v24, OS_LOG_TYPE_ERROR, "Failed to delete all friend data of type %@ with error: %{public}@", buf, 0x16u);
          }
          char v18 = 0;
        }
      }
      uint64_t v15 = [obj countByEnumeratingWithState:&v31 objects:v40 count:16];
    }
    while (v15);

    id v12 = v27;
    id v11 = v28;
  }
  else
  {
    char v18 = 1;
  }

  return v18 & 1;
}

- (BOOL)deleteAllActivitySharingData
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  healthDataQueue = self->_healthDataQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __53__ASActivityDataManager_deleteAllActivitySharingData__block_invoke;
  v5[3] = &unk_265215FF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(healthDataQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __53__ASActivityDataManager_deleteAllActivitySharingData__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_queue_deleteAllActivitySharingData");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)_queue_deleteActivityDataForFriendWithUUID:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v30 = 0;
  databaseClient = self->_databaseClient;
  uint64_t v6 = [MEMORY[0x263F0A6E8] fitnessFriendAchievementType];
  id v7 = [(ASActivityDataManager *)self _fitnessFriendAchievementPredicateForFriendUUID:v4];
  uint64_t v8 = *MEMORY[0x263F434E8];
  id v29 = 0;
  BOOL v9 = [(ASDatabaseClient *)databaseClient deleteDataObjectsOfType:v6 predicate:v7 limit:v8 deletedSampleCount:&v30 notifyObservers:1 generateDeletedObjects:1 error:&v29];
  id v10 = v29;

  ASLoggingInitialize();
  id v11 = *MEMORY[0x263F23AA0];
  id v12 = *MEMORY[0x263F23AA0];
  if (v9 && v10 == 0)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      uint64_t v32 = v30;
      __int16 v33 = 2114;
      id v34 = v4;
      _os_log_impl(&dword_2474C9000, v11, OS_LOG_TYPE_DEFAULT, "Removed %ld ASAchievementEntity samples for friend UUUD: %{public}@", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    -[ASActivityDataManager _queue_deleteActivityDataForFriendWithUUID:]();
  }
  uint64_t v14 = self->_databaseClient;
  uint64_t v15 = [MEMORY[0x263F0A6E8] fitnessFriendActivitySnapshotType];
  id v16 = [(ASActivityDataManager *)self _fitnessFriendActivitySnapshotPredicateForFriendUUID:v4];
  id v28 = v10;
  BOOL v17 = [(ASDatabaseClient *)v14 deleteDataObjectsOfType:v15 predicate:v16 limit:v8 deletedSampleCount:&v30 notifyObservers:1 generateDeletedObjects:1 error:&v28];
  id v18 = v28;

  ASLoggingInitialize();
  id v19 = *MEMORY[0x263F23AA0];
  if (!v17 || v18)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA0], OS_LOG_TYPE_ERROR)) {
      -[ASActivityDataManager _queue_deleteActivityDataForFriendWithUUID:]();
    }
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    uint64_t v32 = v30;
    __int16 v33 = 2114;
    id v34 = v4;
    _os_log_impl(&dword_2474C9000, v19, OS_LOG_TYPE_DEFAULT, "Removed %ld ASActivitySnapshotEntity samples for friend UUUD: %{public}@", buf, 0x16u);
  }
  id v20 = self->_databaseClient;
  uint64_t v21 = [MEMORY[0x263F0A6E8] fitnessFriendWorkoutType];
  __int16 v22 = [(ASActivityDataManager *)self _fitnessFriendWorkoutPredicateForFriendUUID:v4];
  id v27 = v18;
  BOOL v23 = [(ASDatabaseClient *)v20 deleteDataObjectsOfType:v21 predicate:v22 limit:v8 deletedSampleCount:&v30 notifyObservers:1 generateDeletedObjects:1 error:&v27];
  id v24 = v27;

  ASLoggingInitialize();
  BOOL v25 = *MEMORY[0x263F23AA0];
  if (!v23 || v24)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA0], OS_LOG_TYPE_ERROR)) {
      -[ASActivityDataManager _queue_deleteActivityDataForFriendWithUUID:]();
    }
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    uint64_t v32 = v30;
    __int16 v33 = 2114;
    id v34 = v4;
    _os_log_impl(&dword_2474C9000, v25, OS_LOG_TYPE_DEFAULT, "Removed %ld ASWorkoutEntity samples for friend UUUD: %{public}@", buf, 0x16u);
  }

  return v9 && v17 && v23;
}

- (BOOL)deleteActivityDataForFriendWithUUID:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  healthDataQueue = self->_healthDataQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__ASActivityDataManager_deleteActivityDataForFriendWithUUID___block_invoke;
  block[3] = &unk_265216070;
  id v9 = v4;
  id v10 = &v11;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(healthDataQueue, block);
  LOBYTE(healthDataQueue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)healthDataQueue;
}

uint64_t __61__ASActivityDataManager_deleteActivityDataForFriendWithUUID___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_queue_deleteActivityDataForFriendWithUUID:", *(void *)(a1 + 40));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (id)_endDatePredicate
{
  if (self->_isWatch) {
    char v3 = (uint64_t *)MEMORY[0x263F23D68];
  }
  else {
    char v3 = (uint64_t *)MEMORY[0x263F23D60];
  }
  uint64_t v4 = *v3;
  calendar = self->_calendar;
  id v6 = [MEMORY[0x263EFF910] date];
  id v7 = [(NSCalendar *)calendar startOfDayForDate:v6];

  uint64_t v8 = [(NSCalendar *)self->_calendar dateByAddingUnit:16 value:-v4 toDate:v7 options:0];
  id v9 = [MEMORY[0x263F0A668] predicateForSamplesWithStartDate:v8 endDate:0 options:0];
  id v10 = HDSampleEntityPredicateForEndDate();
  uint64_t v11 = [[ASPredicateContainer alloc] initWithHealthKitPredicate:v9 healthDaemonPredicate:v10];

  return v11;
}

- (id)_fitnessFriendAchievementPredicateForFriendUUID:(id)a3
{
  char v3 = (void *)MEMORY[0x263F0A668];
  id v4 = a3;
  id v5 = [v3 predicateForFitnessFriendAchievementsForFriendUUID:v4];
  id v6 = HDFitnessFriendAchievementEntityPredicateForFriendUUID();

  id v7 = [[ASPredicateContainer alloc] initWithHealthKitPredicate:v5 healthDaemonPredicate:v6];
  return v7;
}

- (id)_fitnessFriendActivitySnapshotPredicateForFriendUUID:(id)a3
{
  char v3 = (void *)MEMORY[0x263F0A668];
  id v4 = a3;
  id v5 = [v3 predicateForFitnessFriendActivitySnapshotsForFriendUUID:v4];
  id v6 = HDFitnessFriendActivitySnapshotEntityPredicateForFriendUUID();

  id v7 = [[ASPredicateContainer alloc] initWithHealthKitPredicate:v5 healthDaemonPredicate:v6];
  return v7;
}

- (id)_fitnessFriendWorkoutPredicateForFriendUUID:(id)a3
{
  char v3 = (void *)MEMORY[0x263F0A668];
  id v4 = a3;
  id v5 = [v3 predicateForFitnessFriendWorkoutsForFriendUUID:v4];
  id v6 = HDFitnessFriendWorkoutEntityEntityPredicateForFriendUUID();

  id v7 = [[ASPredicateContainer alloc] initWithHealthKitPredicate:v5 healthDaemonPredicate:v6];
  return v7;
}

- (id)_fitnessFriendSamplePredicateForFriendUUID:(id)a3
{
  v11[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(ASActivityDataManager *)self _fitnessFriendAchievementPredicateForFriendUUID:v4];
  id v6 = -[ASActivityDataManager _fitnessFriendActivitySnapshotPredicateForFriendUUID:](self, "_fitnessFriendActivitySnapshotPredicateForFriendUUID:", v4, v5);
  v11[1] = v6;
  id v7 = [(ASActivityDataManager *)self _fitnessFriendWorkoutPredicateForFriendUUID:v4];

  v11[2] = v7;
  uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:3];

  id v9 = +[ASPredicateContainer predicateMatchingAnyPredicates:v8];

  return v9;
}

- (id)fitnessFriendSamplesForFriendWithUUID:(id)a3
{
  v19[2] = *MEMORY[0x263EF8340];
  id v4 = (objc_class *)MEMORY[0x263EFF980];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  id v7 = [(ASActivityDataManager *)self _endDatePredicate];
  uint64_t v8 = [(ASActivityDataManager *)self _fitnessFriendSamplePredicateForFriendUUID:v5];

  v19[0] = v7;
  v19[1] = v8;
  uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:2];
  id v10 = +[ASPredicateContainer predicateMatchingAllPredicates:v9];

  databaseClient = self->_databaseClient;
  id v18 = 0;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __63__ASActivityDataManager_fitnessFriendSamplesForFriendWithUUID___block_invoke;
  v16[3] = &unk_265216098;
  id v12 = v6;
  id v17 = v12;
  LOBYTE(v9) = [(ASDatabaseClient *)databaseClient enumerateAllActivitySharingSamplesWithPredicate:v10 error:&v18 handler:v16];
  id v13 = v18;
  if (v9)
  {
    char v14 = (void *)[v12 copy];
  }
  else
  {
    ASLoggingInitialize();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA0], OS_LOG_TYPE_ERROR)) {
      -[ASActivityDataManager fitnessFriendSamplesForFriendWithUUID:]();
    }
    char v14 = (void *)MEMORY[0x263EFFA68];
  }

  return v14;
}

uint64_t __63__ASActivityDataManager_fitnessFriendSamplesForFriendWithUUID___block_invoke(uint64_t a1, uint64_t a2)
{
  return 1;
}

- (id)activitySnapshotsFromFitnessFriendSamples:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v11 = NSNumber;
          id v12 = v10;
          id v13 = objc_msgSend(v11, "numberWithLongLong:", objc_msgSend(v12, "snapshotIndex", (void)v18));
          char v14 = [v4 objectForKeyedSubscript:v13];
          uint64_t v15 = [v12 _mostSignificantSnapshot:v14];

          [v4 setObject:v15 forKeyedSubscript:v13];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }

  id v16 = (void *)[v4 copy];
  return v16;
}

- (id)achievementsFromFitnessFriendSamples:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v27;
    unint64_t v8 = 0x263F08000uLL;
    do
    {
      uint64_t v9 = 0;
      uint64_t v24 = v6;
      do
      {
        if (*(void *)v27 != v7) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v26 + 1) + 8 * v9);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v11 = v10;
          id v12 = [v11 completedDate];
          uint64_t v13 = ASCacheIndexForLocalDate();

          unint64_t v14 = v8;
          uint64_t v15 = [*(id *)(v8 + 2584) numberWithLongLong:v13];
          id v16 = v4;
          id v17 = [v4 objectForKeyedSubscript:v15];
          long long v18 = v17;
          if (v17) {
            id v19 = v17;
          }
          else {
            id v19 = objc_alloc_init(MEMORY[0x263EFF9C0]);
          }
          long long v20 = v19;

          [v20 addObject:v11];
          unint64_t v8 = v14;
          long long v21 = [*(id *)(v14 + 2584) numberWithLongLong:v13];
          id v4 = v16;
          [v16 setObject:v20 forKeyedSubscript:v21];

          uint64_t v6 = v24;
        }
        ++v9;
      }
      while (v6 != v9);
      uint64_t v6 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v6);
  }

  __int16 v22 = (void *)[v4 copy];
  return v22;
}

- (id)workoutsFromFitnessFriendSamples:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v27;
    unint64_t v8 = 0x263F08000uLL;
    do
    {
      uint64_t v9 = 0;
      uint64_t v24 = v6;
      do
      {
        if (*(void *)v27 != v7) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v26 + 1) + 8 * v9);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v11 = v10;
          id v12 = [v11 endDate];
          uint64_t v13 = ASCacheIndexForLocalDate();

          unint64_t v14 = v8;
          uint64_t v15 = [*(id *)(v8 + 2584) numberWithLongLong:v13];
          id v16 = v4;
          id v17 = [v4 objectForKeyedSubscript:v15];
          long long v18 = v17;
          if (v17) {
            id v19 = v17;
          }
          else {
            id v19 = objc_alloc_init(MEMORY[0x263EFF9C0]);
          }
          long long v20 = v19;

          [v20 addObject:v11];
          unint64_t v8 = v14;
          long long v21 = [*(id *)(v14 + 2584) numberWithLongLong:v13];
          id v4 = v16;
          [v16 setObject:v20 forKeyedSubscript:v21];

          uint64_t v6 = v24;
        }
        ++v9;
      }
      while (v6 != v9);
      uint64_t v6 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v6);
  }

  __int16 v22 = (void *)[v4 copy];
  return v22;
}

- (void)_queue_getAndHandleAllActivitySharingData
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2474C9000, v0, v1, "Error fetching fitness friend samples from db: %{public}@", v2, v3, v4, v5, v6);
}

uint64_t __66__ASActivityDataManager__queue_getAndHandleAllActivitySharingData__block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = (void *)a1[4];
LABEL_7:
    [v4 addObject:v3];
    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = (void *)a1[5];
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = (void *)a1[6];
    goto LABEL_7;
  }
  ASLoggingInitialize();
  uint8_t v6 = (void *)*MEMORY[0x263F23AA0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA0], OS_LOG_TYPE_ERROR)) {
    __66__ASActivityDataManager__queue_getAndHandleAllActivitySharingData__block_invoke_cold_1(v6);
  }
LABEL_8:

  return 1;
}

- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4
{
  healthDataQueue = self->_healthDataQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__ASActivityDataManager_database_protectedDataDidBecomeAvailable___block_invoke;
  block[3] = &unk_2652157F0;
  void block[4] = self;
  dispatch_async(healthDataQueue, block);
}

uint64_t __66__ASActivityDataManager_database_protectedDataDidBecomeAvailable___block_invoke(uint64_t a1)
{
  ASLoggingInitialize();
  uint64_t v2 = *MEMORY[0x263F23AA0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_2474C9000, v2, OS_LOG_TYPE_DEFAULT, "Protected data availability changed and we haven't fetched friends' data yet", v4, 2u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_queue_getAndHandleAllActivitySharingData");
}

- (void)_queue_handleNewSnapshots:(id)a3 workouts:(id)a4 achievements:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_healthDataQueue);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __73__ASActivityDataManager__queue_handleNewSnapshots_workouts_achievements___block_invoke;
  v14[3] = &unk_2652160E8;
  v14[4] = self;
  id v15 = v8;
  id v16 = v10;
  id v17 = v9;
  id v11 = v9;
  id v12 = v10;
  id v13 = v8;
  dispatch_async(MEMORY[0x263EF83A0], v14);
}

void __73__ASActivityDataManager__queue_handleNewSnapshots_workouts_achievements___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) friendListManager];
  [v2 updateFriendListWithNewSnapshots:*(void *)(a1 + 40) achievements:*(void *)(a1 + 48) workouts:*(void *)(a1 + 56)];
}

- (void)_queue_samplesAdded:(id)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v29 = self;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_healthDataQueue);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v30 objects:v40 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = (void *)MEMORY[0x263EFFA68];
    uint64_t v9 = *(void *)v31;
    id v10 = (void *)MEMORY[0x263EFFA68];
    id v11 = (void *)MEMORY[0x263EFFA68];
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v31 != v9) {
          objc_enumerationMutation(v5);
        }
        id v13 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v14 = v13;
          uint64_t v15 = [v11 arrayByAddingObject:v14];

          id v11 = (void *)v15;
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v16 = v13;
            uint64_t v17 = [v10 arrayByAddingObject:v16];

            id v10 = (void *)v17;
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v18 = v13;
              uint64_t v19 = [v8 arrayByAddingObject:v18];

              id v8 = (void *)v19;
            }
            else
            {
              ASLoggingInitialize();
              long long v20 = (void *)*MEMORY[0x263F23AA0];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA0], OS_LOG_TYPE_DEFAULT))
              {
                long long v21 = v20;
                __int16 v22 = objc_opt_class();
                *(_DWORD *)buf = 138543362;
                uint64_t v35 = (uint64_t)v22;
                id v23 = v22;
                _os_log_impl(&dword_2474C9000, v21, OS_LOG_TYPE_DEFAULT, "Received a sample with invalid type: %{public}@", buf, 0xCu);
              }
            }
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v30 objects:v40 count:16];
    }
    while (v7);
  }
  else
  {
    id v8 = (void *)MEMORY[0x263EFFA68];
    id v10 = (void *)MEMORY[0x263EFFA68];
    id v11 = (void *)MEMORY[0x263EFFA68];
  }

  ASLoggingInitialize();
  uint64_t v24 = (void *)*MEMORY[0x263F23AA0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA0], OS_LOG_TYPE_DEFAULT))
  {
    BOOL v25 = v24;
    uint64_t v26 = [v11 count];
    uint64_t v27 = [v8 count];
    uint64_t v28 = [v10 count];
    *(_DWORD *)buf = 134218496;
    uint64_t v35 = v26;
    __int16 v36 = 2048;
    uint64_t v37 = v27;
    __int16 v38 = 2048;
    uint64_t v39 = v28;
    _os_log_impl(&dword_2474C9000, v25, OS_LOG_TYPE_DEFAULT, "Friend samples were added to database: %lu snapshots, %lu workouts, %lu achievements.", buf, 0x20u);
  }
  [(ASActivityDataManager *)v29 _queue_handleNewSnapshots:v11 workouts:v8 achievements:v10];
}

- (void)samplesAdded:(id)a3 anchor:(id)a4
{
  id v5 = a3;
  objc_initWeak(&location, self);
  healthDataQueue = self->_healthDataQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__ASActivityDataManager_samplesAdded_anchor___block_invoke;
  block[3] = &unk_265216110;
  objc_copyWeak(&v10, &location);
  id v9 = v5;
  id v7 = v5;
  dispatch_async(healthDataQueue, block);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __45__ASActivityDataManager_samplesAdded_anchor___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_queue_samplesAdded:", *(void *)(a1 + 32));
    id WeakRetained = v3;
  }
}

- (void)currentActivitySummaryHelper:(id)a3 didUpdateTodayActivitySummary:(id)a4 changedFields:(unint64_t)a5
{
  id v6 = a4;
  id v7 = (void *)[v6 copy];
  activitySummaryQueue = self->_activitySummaryQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __98__ASActivityDataManager_currentActivitySummaryHelper_didUpdateTodayActivitySummary_changedFields___block_invoke;
  block[3] = &unk_265216138;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(activitySummaryQueue, block);
}

void __98__ASActivityDataManager_currentActivitySummaryHelper_didUpdateTodayActivitySummary_changedFields___block_invoke(id *a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  ASLoggingInitialize();
  id v2 = (os_log_t *)MEMORY[0x263F23AA0];
  id v3 = *MEMORY[0x263F23AA0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA0], OS_LOG_TYPE_DEFAULT))
  {
    id v4 = a1[4];
    *(_DWORD *)buf = 138412290;
    id v27 = v4;
    _os_log_impl(&dword_2474C9000, v3, OS_LOG_TYPE_DEFAULT, "New today summary %@", buf, 0xCu);
  }
  if (([a1[5] _hasMoveGoalForActivitySummary:a1[6]] & 1) == 0
    && [a1[5] _hasMoveGoalForActivitySummary:*((void *)a1[5] + 18)])
  {
    ASLoggingInitialize();
    id v5 = *v2;
    if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2474C9000, v5, OS_LOG_TYPE_DEFAULT, "New today activity summary available, but doesn't have a move goal yet - copying existing known goals", buf, 2u);
    }
    uint64_t v6 = [a1[6] activityMoveMode];
    id v7 = (void *)*((void *)a1[5] + 18);
    if (v6 == 2)
    {
      id v8 = [v7 appleMoveMinutesGoal];
      [a1[6] setAppleMoveMinutesGoal:v8];
    }
    else
    {
      id v8 = [v7 activeEnergyBurnedGoal];
      [a1[6] setActiveEnergyBurnedGoal:v8];
    }

    id v9 = [*((id *)a1[5] + 18) appleExerciseTimeGoal];
    [a1[6] setAppleExerciseTimeGoal:v9];

    id v10 = [*((id *)a1[5] + 18) appleStandHoursGoal];
    [a1[6] setAppleStandHoursGoal:v10];
  }
  objc_storeStrong((id *)a1[5] + 18, a1[6]);
  id v11 = (void *)[*((id *)a1[5] + 21) copy];
  id v12 = a1[5];
  id v13 = *((void *)v12 + 17);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __98__ASActivityDataManager_currentActivitySummaryHelper_didUpdateTodayActivitySummary_changedFields___block_invoke_343;
  block[3] = &unk_265216138;
  void block[4] = v12;
  id v24 = a1[6];
  id v14 = v11;
  id v25 = v14;
  dispatch_async(v13, block);
  uint64_t v15 = [a1[4] _activitySummaryIndex];
  BOOL v16 = v15 > [*((id *)a1[5] + 13) integerValue]
     && ASAllGoalsMetForSummary(a1[4])
     && *((unsigned char *)a1[5] + 248) != 0;
  if (ASSecureCloudEnabled())
  {
    uint64_t v17 = [a1[4] _activitySummaryIndex];
    if (v17 <= [*((id *)a1[5] + 30) integerValue] || !v16) {
      goto LABEL_25;
    }
  }
  else if (!v16)
  {
    goto LABEL_25;
  }
  ASLoggingInitialize();
  uint64_t v19 = *v2;
  if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
  {
    long long v20 = (void *)*((void *)a1[5] + 18);
    *(_DWORD *)buf = 138412290;
    id v27 = v20;
    _os_log_impl(&dword_2474C9000, v19, OS_LOG_TYPE_DEFAULT, "Today summary: %@ represents a goal completion, requesting immediate update", buf, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)a1[5] + 35);
  __int16 v22 = ASCloudKitGroupUserActionImplicit();
  [WeakRetained requestImmediateUpdateWithCloudKitGroup:v22 completion:0];

LABEL_25:
}

void __98__ASActivityDataManager_currentActivitySummaryHelper_didUpdateTodayActivitySummary_changedFields___block_invoke_343(void *a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1[4] + 216);
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
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "activityDataManager:didUpdateTodaySummary:yesterdaySummary:", a1[4], a1[5], a1[6], (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (BOOL)_hasMoveGoalForActivitySummary:(id)a3
{
  id v3 = a3;
  if ([v3 _hasAppleMoveMinutesGoal]) {
    char v4 = 1;
  }
  else {
    char v4 = [v3 _hasEnergyBurnedGoal];
  }

  return v4;
}

- (void)currentActivitySummaryHelper:(id)a3 didUpdateYesterdayActivitySummary:(id)a4 changedFields:(unint64_t)a5
{
  id v6 = a4;
  long long v7 = (void *)[v6 copy];
  activitySummaryQueue = self->_activitySummaryQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __102__ASActivityDataManager_currentActivitySummaryHelper_didUpdateYesterdayActivitySummary_changedFields___block_invoke;
  block[3] = &unk_265216138;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(activitySummaryQueue, block);
}

void __102__ASActivityDataManager_currentActivitySummaryHelper_didUpdateYesterdayActivitySummary_changedFields___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  ASLoggingInitialize();
  id v2 = *MEMORY[0x263F23AA0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA0], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_2474C9000, v2, OS_LOG_TYPE_DEFAULT, "New yesterday summary %@", (uint8_t *)&v4, 0xCu);
  }
  objc_storeStrong((id *)(*(void *)(a1 + 40) + 168), *(id *)(a1 + 48));
}

- (void)_workoutsForActivitySnapshot:(id)a3 anchor:(id)a4 completion:(id)a5
{
  v84[2] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (v7)
  {
    v64 = (void (**)(void, void *, void *))v9;
    id v11 = (void *)MEMORY[0x263F0A668];
    id v12 = [v7 startDate];
    id v13 = [v7 endDate];
    uint64_t v14 = [v11 predicateForSamplesWithStartDate:v12 endDate:v13 options:0];

    uint64_t v15 = (void *)MEMORY[0x263F434A0];
    uint64_t v16 = *MEMORY[0x263F43080];
    uint64_t v17 = [v7 startDate];
    id v18 = _HDSQLiteValueForDate();
    uint64_t v19 = [v15 predicateWithProperty:v16 greaterThanOrEqualToValue:v18];

    long long v20 = (void *)MEMORY[0x263F434A0];
    long long v21 = [v7 endDate];
    __int16 v22 = _HDSQLiteValueForDate();
    uint64_t v23 = [v20 predicateWithProperty:v16 lessThanValue:v22];

    v61 = (void *)v23;
    v62 = (void *)v19;
    [MEMORY[0x263F434D0] compoundPredicateWithPredicate:v19 otherPredicate:v23];
    v60 = v63 = (void *)v14;
    id v24 = [[ASPredicateContainer alloc] initWithHealthKitPredicate:v14 healthDaemonPredicate:v60];
    uint64_t v25 = [MEMORY[0x263F0A668] _predicateForObjectsFromAppleWatches];
    if (v25)
    {
      uint64_t v26 = [MEMORY[0x263F08730] notPredicateWithSubpredicate:v25];
    }
    else
    {
      ASLoggingInitialize();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA0], OS_LOG_TYPE_ERROR)) {
        -[ASActivityDataManager _workoutsForActivitySnapshot:anchor:completion:]();
      }
      id v27 = (void *)MEMORY[0x263F0A668];
      uint64_t v28 = [MEMORY[0x263EFF910] distantPast];
      long long v29 = [MEMORY[0x263EFF910] distantFuture];
      uint64_t v26 = [v27 predicateForSamplesWithStartDate:v28 endDate:v29 options:0];

      uint64_t v25 = 0;
    }
    uint64_t v30 = HDDataEntityPredicateForOriginProductType();
    if (v30)
    {
      uint64_t v31 = [MEMORY[0x263F434A8] negatedPredicate:v30];
    }
    else
    {
      ASLoggingInitialize();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA0], OS_LOG_TYPE_ERROR)) {
        -[ASActivityDataManager _workoutsForActivitySnapshot:anchor:completion:]();
      }
      uint64_t v31 = [MEMORY[0x263F434D0] truePredicate];
    }
    long long v32 = (void *)v31;
    v58 = (void *)v30;
    long long v33 = [[ASPredicateContainer alloc] initWithHealthKitPredicate:v25 healthDaemonPredicate:v30];
    v57 = v32;
    v68 = [[ASPredicateContainer alloc] initWithHealthKitPredicate:v26 healthDaemonPredicate:v32];
    id v34 = [MEMORY[0x263EFF9C0] set];
    id v35 = v8;
    id v36 = v35;
    v59 = (void *)v25;
    v66 = v26;
    v67 = v24;
    v65 = v33;
    if (v25)
    {
      id v56 = v8;
      v84[0] = v24;
      v84[1] = v33;
      uint64_t v37 = [MEMORY[0x263EFF8C0] arrayWithObjects:v84 count:2];
      __int16 v38 = +[ASPredicateContainer predicateMatchingAllPredicates:v37];

      id v80 = v35;
      uint64_t v39 = [(ASActivityDataManager *)self _workoutsAfterAnchor:&v80 withPredicate:v38];
      id v36 = v80;

      long long v78 = 0u;
      long long v79 = 0u;
      long long v76 = 0u;
      long long v77 = 0u;
      id v40 = v39;
      uint64_t v41 = [v40 countByEnumeratingWithState:&v76 objects:v83 count:16];
      if (v41)
      {
        uint64_t v42 = v41;
        uint64_t v43 = *(void *)v77;
        do
        {
          for (uint64_t i = 0; i != v42; ++i)
          {
            if (*(void *)v77 != v43) {
              objc_enumerationMutation(v40);
            }
            v45 = *(void **)(*((void *)&v76 + 1) + 8 * i);
            [v45 setIsWatchWorkout:1];
            [v34 addObject:v45];
          }
          uint64_t v42 = [v40 countByEnumeratingWithState:&v76 objects:v83 count:16];
        }
        while (v42);
      }

      id v8 = v56;
      uint64_t v26 = v66;
      id v24 = v67;
      long long v33 = v65;
    }
    if (v26)
    {
      v82[0] = v24;
      v82[1] = v68;
      v46 = [MEMORY[0x263EFF8C0] arrayWithObjects:v82 count:2];
      v47 = +[ASPredicateContainer predicateMatchingAllPredicates:v46];

      id v75 = v35;
      v48 = [(ASActivityDataManager *)self _workoutsAfterAnchor:&v75 withPredicate:v47];
      id v70 = v75;

      long long v73 = 0u;
      long long v74 = 0u;
      long long v71 = 0u;
      long long v72 = 0u;
      id v49 = v48;
      uint64_t v50 = [v49 countByEnumeratingWithState:&v71 objects:v81 count:16];
      if (v50)
      {
        uint64_t v51 = v50;
        uint64_t v52 = *(void *)v72;
        do
        {
          for (uint64_t j = 0; j != v51; ++j)
          {
            if (*(void *)v72 != v52) {
              objc_enumerationMutation(v49);
            }
            v54 = *(void **)(*((void *)&v71 + 1) + 8 * j);
            [v54 setIsWatchWorkout:0];
            [v34 addObject:v54];
          }
          uint64_t v51 = [v49 countByEnumeratingWithState:&v71 objects:v81 count:16];
        }
        while (v51);
      }

      id v35 = v70;
      uint64_t v26 = v66;
      id v24 = v67;
      long long v33 = v65;
    }
    v55 = ASMaxNumber();
    id v10 = v64;
    v64[2](v64, v34, v55);
  }
}

- (id)_workoutsAfterAnchor:(id *)a3 withPredicate:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a4;
  databaseClient = self->_databaseClient;
  id v24 = 0;
  id v8 = [(ASDatabaseClient *)databaseClient healthKitWorkoutsWithPredicate:v6 anchor:a3 error:&v24];
  id v9 = v24;
  if (v9)
  {
    ASLoggingInitialize();
    id v10 = *MEMORY[0x263F23AA0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA0], OS_LOG_TYPE_ERROR))
    {
      id v19 = *a3;
      *(_DWORD *)buf = 138543874;
      id v27 = v9;
      __int16 v28 = 2114;
      id v29 = v6;
      __int16 v30 = 2114;
      id v31 = v19;
      _os_log_error_impl(&dword_2474C9000, v10, OS_LOG_TYPE_ERROR, "Error: %{public}@ fetching workouts with predicate: %{public}@, anchor: %{public}@", buf, 0x20u);
    }
    id v11 = 0;
  }
  else
  {
    id v11 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(v8, "count"));
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v12 = v8;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v21 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = objc_msgSend(MEMORY[0x263F0A9D8], "fitnessFriendWorkoutFromHKWorkout:", *(void *)(*((void *)&v20 + 1) + 8 * i), (void)v20);
          [v11 addObject:v17];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v14);
    }
  }
  return v11;
}

- (id)_filterAchievements:(id)a3 forSnapshotIndex:(int64_t)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = _HKStartDateForSnapshotIndex();
  ASLoggingInitialize();
  id v8 = *MEMORY[0x263F23AA0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    int64_t v18 = a4;
    __int16 v19 = 2112;
    long long v20 = v7;
    _os_log_impl(&dword_2474C9000, v8, OS_LOG_TYPE_DEFAULT, "Looking for achievements for snapshot index: %lld, date: %@", buf, 0x16u);
  }
  id v9 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendar");
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __62__ASActivityDataManager__filterAchievements_forSnapshotIndex___block_invoke;
  v14[3] = &unk_265216160;
  v14[4] = self;
  id v15 = v9;
  id v16 = v7;
  id v10 = v7;
  id v11 = v9;
  id v12 = objc_msgSend(v6, "hk_map:", v14);

  return v12;
}

id __62__ASActivityDataManager__filterAchievements_forSnapshotIndex___block_invoke(void *a1, void *a2)
{
  v31[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (ACHIsActivityAchievementSharable())
  {
    if (*(unsigned char *)(a1[4] + 224)
      && ([v3 relevantEarnedInstance],
          int v4 = objc_claimAutoreleasedReturnValue(),
          v4,
          v4))
    {
      uint64_t v5 = [v3 relevantEarnedInstance];
      v31[0] = v5;
      id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:1];
    }
    else
    {
      id v6 = [v3 earnedInstances];
    }
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v25 = v3;
      uint64_t v11 = *(void *)v27;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v27 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          uint64_t v14 = (void *)MEMORY[0x24C557C30]();
          id v15 = (void *)a1[5];
          id v16 = [v13 createdDate];
          LODWORD(v15) = [v15 isDate:v16 inSameDayAsDate:a1[6]];

          if (v15)
          {
            uint64_t v17 = (void *)a1[5];
            int64_t v18 = [v13 earnedDateComponents];
            __int16 v19 = [v17 dateFromComponents:v18];

            long long v20 = (void *)a1[5];
            uint64_t v21 = [v13 createdDate];
            long long v22 = [v20 components:16 fromDate:v21 toDate:v19 options:0];

            if (([v22 day] & 0x8000000000000000) == 0)
            {
              id v3 = v25;
              long long v23 = [v25 template];
              id v7 = ASFriendAchievementFromTemplateAndEarnedInstance();

              goto LABEL_20;
            }
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v26 objects:v30 count:16];
        if (v10) {
          continue;
        }
        break;
      }
      id v7 = 0;
      id v3 = v25;
    }
    else
    {
      id v7 = 0;
    }
LABEL_20:
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)localSourceUUID
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__ASActivityDataManager_localSourceUUID__block_invoke;
  block[3] = &unk_2652157F0;
  void block[4] = self;
  if (localSourceUUID_onceToken != -1) {
    dispatch_once(&localSourceUUID_onceToken, block);
  }
  return (id)localSourceUUID_localSourceUUID;
}

void __40__ASActivityDataManager_localSourceUUID__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 288);
  id v6 = 0;
  uint64_t v2 = [v1 localSourceUUIDWithError:&v6];
  id v3 = v6;
  int v4 = (void *)localSourceUUID_localSourceUUID;
  localSourceUUID_localSourceUUID = v2;

  if (v3)
  {
    ASLoggingInitialize();
    uint64_t v5 = *MEMORY[0x263F23AA0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v8 = v3;
      _os_log_impl(&dword_2474C9000, v5, OS_LOG_TYPE_DEFAULT, "Error getting local source UUID to attach to snapshots: %{public}@", buf, 0xCu);
    }
  }
}

- (id)_activitySnapshotsToPushWithYesterdaySnapshot:(id)a3 todaySnapshot:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  char v8 = [(HKActivitySummary *)self->_currentActivitySummary isEqual:self->_currentLastPushedActivitySummary];
  uint64_t v9 = (void *)MEMORY[0x263EFFA68];
  if (v7 && (v8 & 1) == 0 && ([(HKActivitySummary *)self->_currentActivitySummary isPaused] & 1) == 0)
  {
    uint64_t v9 = [MEMORY[0x263EFFA68] arrayByAddingObject:v7];
  }
  char v10 = [(HKActivitySummary *)self->_yesterdayActivitySummary isEqual:self->_yesterdayLastPushedActivitySummary];
  if (v6 && (v10 & 1) == 0 && ([(HKActivitySummary *)self->_yesterdayActivitySummary isPaused] & 1) == 0)
  {
    uint64_t v11 = [v9 arrayByAddingObject:v6];

    uint64_t v9 = (void *)v11;
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v12 = v9;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        int64_t v18 = [(ASActivityDataManager *)self localSourceUUID];
        [v17 setSourceUUID:v18];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v14);
  }

  return v12;
}

- (id)_achievementsToPushWithYesterdaySnapshot:(id)a3 todaySnapshot:(id)a4 currentTodayAchievementAnchorToken:(id)a5 currentYesterdayAchievementAnchorToken:(id)a6
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  if ([(ASActivityDataManager *)self _isAlertSuppressionEnabled])
  {
    ASLoggingInitialize();
    char v10 = *MEMORY[0x263F23AA0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v11 = "Alerts are currently suppressed, not pushing any achievements";
LABEL_16:
      _os_log_impl(&dword_2474C9000, v10, OS_LOG_TYPE_DEFAULT, v11, buf, 2u);
      goto LABEL_17;
    }
    goto LABEL_17;
  }
  if (!v8)
  {
    ASLoggingInitialize();
    char v10 = *MEMORY[0x263F23AA0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v11 = "Today snapshot is empty, not pushing any achievements";
      goto LABEL_16;
    }
LABEL_17:
    long long v21 = [MEMORY[0x263EFFA08] set];
    goto LABEL_31;
  }
  id v12 = (os_log_t *)MEMORY[0x263F23AA0];
  uint64_t v42 = v9;
  if (self->_useNewAchievementsSystem)
  {
    ASLoggingInitialize();
    uint64_t v13 = *v12;
    if (os_log_type_enabled(*v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2474C9000, v13, OS_LOG_TYPE_DEFAULT, "Getting achievements to push for today from the new system", buf, 2u);
    }
    id WeakRetained = objc_alloc_init(MEMORY[0x263F238D8]);
    id v46 = 0;
    uint64_t v15 = [WeakRetained allAchievementsWithError:&v46];
    id v16 = v46;
    if (v16)
    {
      ASLoggingInitialize();
      if (os_log_type_enabled(*v12, OS_LOG_TYPE_ERROR)) {
        -[ASActivityDataManager _achievementsToPushWithYesterdaySnapshot:todaySnapshot:currentTodayAchievementAnchorToken:currentYesterdayAchievementAnchorToken:]();
      }
    }
    ASLoggingInitialize();
    os_log_t v17 = *v12;
    if (os_log_type_enabled(*v12, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v18 = v17;
      uint64_t v19 = [v15 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v52 = v19;
      _os_log_impl(&dword_2474C9000, v18, OS_LOG_TYPE_DEFAULT, "Got %lu achievements from awardsClient", buf, 0xCu);
    }
    long long v20 = [MEMORY[0x263EFFA08] setWithArray:v15];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_achievementStore);
    long long v20 = [WeakRetained allAchievements];
  }

  long long v22 = -[ASActivityDataManager _filterAchievements:forSnapshotIndex:](self, "_filterAchievements:forSnapshotIndex:", v20, [v8 snapshotIndex]);
  long long v23 = [v22 allObjects];
  id v24 = objc_msgSend(v23, "hk_map:", &__block_literal_global_649);

  uint64_t v25 = [v24 sortedArrayUsingComparator:&__block_literal_global_652];

  long long v26 = [NSString string];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v27 = v25;
  uint64_t v28 = [v27 countByEnumeratingWithState:&v47 objects:buf count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v48;
    do
    {
      uint64_t v31 = 0;
      uint64_t v32 = v26;
      do
      {
        if (*(void *)v48 != v30) {
          objc_enumerationMutation(v27);
        }
        long long v26 = [v32 stringByAppendingString:*(void *)(*((void *)&v47 + 1) + 8 * v31)];

        ++v31;
        uint64_t v32 = v26;
      }
      while (v29 != v31);
      uint64_t v29 = [v27 countByEnumeratingWithState:&v47 objects:buf count:16];
    }
    while (v29);
  }

  ASLoggingInitialize();
  long long v33 = (NSObject **)MEMORY[0x263F23AA0];
  id v34 = (void *)*MEMORY[0x263F23AA0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA0], OS_LOG_TYPE_DEFAULT))
  {
    id v35 = v34;
    uint64_t v36 = [v22 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v52 = v36;
    _os_log_impl(&dword_2474C9000, v35, OS_LOG_TYPE_DEFAULT, "Found %lu achievements for today", buf, 0xCu);
  }
  id v9 = v42;
  long long v21 = _AchievementsNotIncludedInAnchorToken(v22, v42);
  ASLoggingInitialize();
  uint64_t v37 = *v33;
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v52 = (uint64_t)v26;
    _os_log_impl(&dword_2474C9000, v37, OS_LOG_TYPE_DEFAULT, "New today anchor token is: %@", buf, 0xCu);
  }
  activitySummaryQueue = self->_activitySummaryQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __154__ASActivityDataManager__achievementsToPushWithYesterdaySnapshot_todaySnapshot_currentTodayAchievementAnchorToken_currentYesterdayAchievementAnchorToken___block_invoke;
  block[3] = &unk_265216138;
  void block[4] = self;
  id v44 = v20;
  id v45 = v26;
  id v39 = v26;
  id v40 = v20;
  dispatch_async(activitySummaryQueue, block);

LABEL_31:
  return v21;
}

void __154__ASActivityDataManager__achievementsToPushWithYesterdaySnapshot_todaySnapshot_currentTodayAchievementAnchorToken_currentYesterdayAchievementAnchorToken___block_invoke(uint64_t a1)
{
  if (([*(id *)(*(void *)(a1 + 32) + 88) isEqualToString:&stru_26FB96980] & 1) != 0
    || [*(id *)(a1 + 40) count])
  {
    uint64_t v2 = *(void **)(a1 + 48);
    id v3 = (id *)(*(void *)(a1 + 32) + 88);
    objc_storeStrong(v3, v2);
  }
}

- (id)_workoutsToPushWithYesterdaySnapshot:(id)a3 todaySnapshot:(id)a4 currentWorkoutAnchor:(id)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  long long v26 = __Block_byref_object_copy__1;
  id v27 = __Block_byref_object_dispose__1;
  id v28 = [MEMORY[0x263EFFA08] set];
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__1;
  v21[4] = __Block_byref_object_dispose__1;
  id v11 = v10;
  id v22 = v11;
  ASLoggingInitialize();
  id v12 = (os_log_t *)MEMORY[0x263F23AA0];
  uint64_t v13 = *MEMORY[0x263F23AA0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v30 = v11;
    _os_log_impl(&dword_2474C9000, v13, OS_LOG_TYPE_DEFAULT, "Looking for today workouts to push with anchor %@", buf, 0xCu);
  }
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __97__ASActivityDataManager__workoutsToPushWithYesterdaySnapshot_todaySnapshot_currentWorkoutAnchor___block_invoke;
  v20[3] = &unk_265216188;
  v20[4] = &v23;
  void v20[5] = v21;
  [(ASActivityDataManager *)self _workoutsForActivitySnapshot:v9 anchor:v11 completion:v20];
  ASLoggingInitialize();
  uint64_t v14 = *v12;
  if (os_log_type_enabled(*v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v30 = v11;
    _os_log_impl(&dword_2474C9000, v14, OS_LOG_TYPE_DEFAULT, "Looking for yesterday workouts to push with anchor %@", buf, 0xCu);
  }
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __97__ASActivityDataManager__workoutsToPushWithYesterdaySnapshot_todaySnapshot_currentWorkoutAnchor___block_invoke_354;
  void v19[3] = &unk_265216188;
  v19[4] = &v23;
  v19[5] = v21;
  [(ASActivityDataManager *)self _workoutsForActivitySnapshot:v8 anchor:v11 completion:v19];
  activitySummaryQueue = self->_activitySummaryQueue;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __97__ASActivityDataManager__workoutsToPushWithYesterdaySnapshot_todaySnapshot_currentWorkoutAnchor___block_invoke_355;
  v18[3] = &unk_2652161B0;
  v18[4] = self;
  v18[5] = v21;
  dispatch_async(activitySummaryQueue, v18);
  id v16 = (id)v24[5];
  _Block_object_dispose(v21, 8);

  _Block_object_dispose(&v23, 8);
  return v16;
}

void __97__ASActivityDataManager__workoutsToPushWithYesterdaySnapshot_todaySnapshot_currentWorkoutAnchor___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  ASLoggingInitialize();
  id v7 = (void *)*MEMORY[0x263F23AA0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA0], OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v7;
    int v15 = 134217984;
    uint64_t v16 = [v5 count];
    _os_log_impl(&dword_2474C9000, v8, OS_LOG_TYPE_DEFAULT, "Found %lu workouts", (uint8_t *)&v15, 0xCu);
  }
  uint64_t v9 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setByAddingObjectsFromSet:v5];
  uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  uint64_t v12 = ASMaxNumber();

  uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;
}

void __97__ASActivityDataManager__workoutsToPushWithYesterdaySnapshot_todaySnapshot_currentWorkoutAnchor___block_invoke_354(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  ASLoggingInitialize();
  id v7 = (void *)*MEMORY[0x263F23AA0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA0], OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v7;
    int v15 = 134217984;
    uint64_t v16 = [v5 count];
    _os_log_impl(&dword_2474C9000, v8, OS_LOG_TYPE_DEFAULT, "Found %lu workouts", (uint8_t *)&v15, 0xCu);
  }
  uint64_t v9 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setByAddingObjectsFromSet:v5];
  uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  uint64_t v12 = ASMaxNumber();

  uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;
}

void __97__ASActivityDataManager__workoutsToPushWithYesterdaySnapshot_todaySnapshot_currentWorkoutAnchor___block_invoke_355(uint64_t a1)
{
}

- (id)notificationEventsToPushWithYesterdaySnapshot:(id)a3 todaySnapshot:(id)a4 achievements:(id)a5 workouts:(id)a6 currentDeletedWorkoutAnchor:(id)a7 currentGoalCompletionAnchor:(id)a8
{
  id v38 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  uint64_t v36 = v16;
  uint64_t v19 = objc_msgSend(v16, "hk_map:", &__block_literal_global_358);
  uint64_t v37 = v15;
  long long v20 = objc_msgSend(v15, "hk_map:", &__block_literal_global_362);
  uint64_t v45 = 0;
  id v46 = &v45;
  uint64_t v47 = 0x3032000000;
  long long v48 = __Block_byref_object_copy__1;
  long long v49 = __Block_byref_object_dispose__1;
  id v50 = (id)MEMORY[0x263EFFA68];
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x3032000000;
  v43[3] = __Block_byref_object_copy__1;
  v43[4] = __Block_byref_object_dispose__1;
  id v21 = v17;
  id v44 = v21;
  v42[0] = MEMORY[0x263EF8330];
  v42[1] = 3221225472;
  v42[2] = __163__ASActivityDataManager_notificationEventsToPushWithYesterdaySnapshot_todaySnapshot_achievements_workouts_currentDeletedWorkoutAnchor_currentGoalCompletionAnchor___block_invoke_3;
  v42[3] = &unk_265216218;
  v42[4] = &v45;
  v42[5] = v43;
  [(ASActivityDataManager *)self findDeletedWorkoutEventsWithAnchor:v21 completion:v42];
  id v22 = v18;
  if (ASAllGoalsMetForSnapshot()
    && (uint64_t v23 = [v14 snapshotIndex],
        v23 > [(NSNumber *)self->_lastPushedGoalCompletionAnchor integerValue]))
  {
    id v24 = (void *)MEMORY[0x263F23BE8];
    uint64_t v25 = [v14 activitySummary];
    long long v26 = [v24 goalCompletionEventWithActivitySummary:v25];

    id v27 = [MEMORY[0x263EFFA68] arrayByAddingObject:v26];
    id v28 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v14, "snapshotIndex"));
  }
  else
  {
    id v27 = (void *)MEMORY[0x263EFFA68];
    id v28 = v22;
  }
  uint64_t v29 = [MEMORY[0x263EFFA68] arrayByAddingObjectsFromArray:v19];
  id v30 = [v29 arrayByAddingObjectsFromArray:v20];

  uint64_t v31 = [v30 arrayByAddingObjectsFromArray:v46[5]];

  uint64_t v32 = [v31 arrayByAddingObjectsFromArray:v27];

  activitySummaryQueue = self->_activitySummaryQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __163__ASActivityDataManager_notificationEventsToPushWithYesterdaySnapshot_todaySnapshot_achievements_workouts_currentDeletedWorkoutAnchor_currentGoalCompletionAnchor___block_invoke_4;
  block[3] = &unk_265216240;
  id v40 = v28;
  uint64_t v41 = v43;
  void block[4] = self;
  id v34 = v28;
  dispatch_async(activitySummaryQueue, block);

  _Block_object_dispose(v43, 8);
  _Block_object_dispose(&v45, 8);

  return v32;
}

uint64_t __163__ASActivityDataManager_notificationEventsToPushWithYesterdaySnapshot_todaySnapshot_achievements_workouts_currentDeletedWorkoutAnchor_currentGoalCompletionAnchor___block_invoke(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x263F23BE8] workoutCompletionEventWithWorkout:a2];
}

uint64_t __163__ASActivityDataManager_notificationEventsToPushWithYesterdaySnapshot_todaySnapshot_achievements_workouts_currentDeletedWorkoutAnchor_currentGoalCompletionAnchor___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x263F23BE8] achievementCompletionEventWithAchievement:a2];
}

void __163__ASActivityDataManager_notificationEventsToPushWithYesterdaySnapshot_todaySnapshot_achievements_workouts_currentDeletedWorkoutAnchor_currentGoalCompletionAnchor___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) arrayByAddingObjectsFromArray:a2];
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
}

void __163__ASActivityDataManager_notificationEventsToPushWithYesterdaySnapshot_todaySnapshot_achievements_workouts_currentDeletedWorkoutAnchor_currentGoalCompletionAnchor___block_invoke_4(void *a1)
{
  objc_storeStrong((id *)(a1[4] + 72), *(id *)(*(void *)(a1[6] + 8) + 40));
  uint64_t v2 = (void *)a1[5];
  id v3 = (id *)(a1[4] + 104);
  objc_storeStrong(v3, v2);
}

- (id)recordsFromActivityDataCodables:(id)a3 recordEncryptionType:(int64_t)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = [(ASActivityDataManager *)self cloudKitManager];
  uint64_t v7 = [(id)objc_opt_class() activityDataRecordZoneID];

  uint64_t v19 = (void *)v7;
  long long v20 = v5;
  id v8 = _ASCreateRecordsFromCloudKitCodablesAndRecordZoneID();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v14 = objc_alloc(MEMORY[0x263EFD820]);
        id v15 = [(ASActivityDataManager *)self cloudKitManager];
        id v16 = [(id)objc_opt_class() activityDataRootRecordID];
        id v17 = (void *)[v14 initWithRecordID:v16 action:0];
        [v13 setParent:v17];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);
  }

  return v8;
}

- (id)recordsToSave
{
  uint64_t v77 = *MEMORY[0x263EF8340];
  uint64_t v62 = 0;
  v63 = &v62;
  uint64_t v64 = 0x3032000000;
  v65 = __Block_byref_object_copy__1;
  v66 = __Block_byref_object_dispose__1;
  id v67 = 0;
  uint64_t v56 = 0;
  v57 = &v56;
  uint64_t v58 = 0x3032000000;
  v59 = __Block_byref_object_copy__1;
  v60 = __Block_byref_object_dispose__1;
  id v61 = 0;
  uint64_t v50 = 0;
  uint64_t v51 = &v50;
  uint64_t v52 = 0x3032000000;
  uint64_t v53 = __Block_byref_object_copy__1;
  v54 = __Block_byref_object_dispose__1;
  id v55 = 0;
  uint64_t v44 = 0;
  uint64_t v45 = &v44;
  uint64_t v46 = 0x3032000000;
  uint64_t v47 = __Block_byref_object_copy__1;
  long long v48 = __Block_byref_object_dispose__1;
  id v49 = 0;
  uint64_t v38 = 0;
  id v39 = &v38;
  uint64_t v40 = 0x3032000000;
  uint64_t v41 = __Block_byref_object_copy__1;
  uint64_t v42 = __Block_byref_object_dispose__1;
  id v43 = 0;
  uint64_t v32 = 0;
  long long v33 = &v32;
  uint64_t v34 = 0x3032000000;
  id v35 = __Block_byref_object_copy__1;
  uint64_t v36 = __Block_byref_object_dispose__1;
  id v37 = 0;
  activitySummaryQueue = self->_activitySummaryQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__ASActivityDataManager_recordsToSave__block_invoke;
  block[3] = &unk_265216268;
  void block[4] = self;
  void block[5] = &v62;
  block[6] = &v56;
  void block[7] = &v50;
  block[8] = &v44;
  block[9] = &v38;
  block[10] = &v32;
  dispatch_sync(activitySummaryQueue, block);
  int v4 = [MEMORY[0x263F0A9D0] snapshotWithActivitySummary:v57[5]];
  id v5 = [MEMORY[0x263F0A9D0] snapshotWithActivitySummary:v63[5]];
  [(ASActivityDataManager *)self _activitySnapshotsToPushWithYesterdaySnapshot:v4 todaySnapshot:v5];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v27 objects:v76 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v28 != v8) {
          objc_enumerationMutation(v6);
        }
        ASCleanSnapshotForUpload();
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v27 objects:v76 count:16];
    }
    while (v7);
  }

  uint64_t v10 = [(ASActivityDataManager *)self _achievementsToPushWithYesterdaySnapshot:v4 todaySnapshot:v5 currentTodayAchievementAnchorToken:v39[5] currentYesterdayAchievementAnchorToken:0];
  uint64_t v11 = [v10 allObjects];

  uint64_t v12 = [(ASActivityDataManager *)self _workoutsToPushWithYesterdaySnapshot:v4 todaySnapshot:v5 currentWorkoutAnchor:v51[5]];
  uint64_t v13 = [v12 allObjects];

  id v14 = [(ASActivityDataManager *)self notificationEventsToPushWithYesterdaySnapshot:v4 todaySnapshot:v5 achievements:v11 workouts:v13 currentDeletedWorkoutAnchor:v45[5] currentGoalCompletionAnchor:v33[5]];
  ASLoggingInitialize();
  id v15 = (id)*MEMORY[0x263F23AA0];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v26 = v4;
    uint64_t v16 = [v6 count];
    uint64_t v17 = [v11 count];
    uint64_t v18 = [v13 count];
    uint64_t v19 = [v14 count];
    *(_DWORD *)buf = 134218752;
    uint64_t v69 = v16;
    __int16 v70 = 2048;
    uint64_t v71 = v17;
    __int16 v72 = 2048;
    uint64_t v73 = v18;
    __int16 v74 = 2048;
    uint64_t v75 = v19;
    _os_log_impl(&dword_2474C9000, v15, OS_LOG_TYPE_DEFAULT, "Creating records for %lu snapshots, %lu achievements, %lu workouts, %lu notification events.", buf, 0x2Au);
    int v4 = v26;
  }

  long long v20 = [MEMORY[0x263EFF8C0] arrayWithArray:v6];
  long long v21 = [v20 arrayByAddingObjectsFromArray:v11];

  long long v22 = [v21 arrayByAddingObjectsFromArray:v13];

  long long v23 = [v22 arrayByAddingObjectsFromArray:v14];

  long long v24 = [(ASActivityDataManager *)self recordsFromActivityDataCodables:v23 recordEncryptionType:0];

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v38, 8);

  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v50, 8);

  _Block_object_dispose(&v56, 8);
  _Block_object_dispose(&v62, 8);

  return v24;
}

void __38__ASActivityDataManager_recordsToSave__block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 144) copy];
  uint64_t v3 = *(void *)(a1[5] + 8);
  int v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = [*(id *)(a1[4] + 168) copy];
  uint64_t v6 = *(void *)(a1[6] + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), *(id *)(a1[4] + 64));
  objc_storeStrong((id *)(*(void *)(a1[8] + 8) + 40), *(id *)(a1[4] + 80));
  objc_storeStrong((id *)(*(void *)(a1[9] + 8) + 40), *(id *)(a1[4] + 96));
  objc_storeStrong((id *)(*(void *)(a1[10] + 8) + 40), *(id *)(a1[4] + 112));
  if (([*(id *)(*(void *)(a1[5] + 8) + 40) _hasEnergyBurnedGoal] & 1) == 0
    && ([*(id *)(*(void *)(a1[5] + 8) + 40) _hasAppleMoveMinutesGoal] & 1) == 0)
  {
    uint64_t v8 = a1[4];
    uint64_t v9 = *(void **)(v8 + 144);
    *(void *)(v8 + 144) = 0;
  }
  if (([*(id *)(*(void *)(a1[6] + 8) + 40) _hasEnergyBurnedGoal] & 1) == 0
    && ([*(id *)(*(void *)(a1[6] + 8) + 40) _hasAppleMoveMinutesGoal] & 1) == 0)
  {
    uint64_t v10 = a1[4];
    uint64_t v11 = *(void **)(v10 + 168);
    *(void *)(v10 + 168) = 0;
  }
  uint64_t v12 = a1[4];
  if (*(void *)(v12 + 152) || *(void *)(v12 + 176))
  {
    ASLoggingInitialize();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA0], OS_LOG_TYPE_ERROR)) {
      __38__ASActivityDataManager_recordsToSave__block_invoke_cold_1();
    }
    uint64_t v12 = a1[4];
  }
  objc_storeStrong((id *)(v12 + 152), *(id *)(v12 + 144));
  uint64_t v13 = a1[4];
  id v14 = *(void **)(v13 + 168);
  objc_storeStrong((id *)(v13 + 176), v14);
}

- (id)recordIDsToDelete
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  uint64_t v49 = 0;
  uint64_t v50 = &v49;
  uint64_t v51 = 0x3032000000;
  uint64_t v52 = __Block_byref_object_copy__1;
  uint64_t v53 = __Block_byref_object_dispose__1;
  id v54 = 0;
  uint64_t v43 = 0;
  uint64_t v44 = &v43;
  uint64_t v45 = 0x3032000000;
  uint64_t v46 = __Block_byref_object_copy__1;
  uint64_t v47 = __Block_byref_object_dispose__1;
  id v48 = 0;
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x3032000000;
  v41[3] = __Block_byref_object_copy__1;
  v41[4] = __Block_byref_object_dispose__1;
  id v42 = 0;
  uint64_t v35 = 0;
  uint64_t v36 = &v35;
  uint64_t v37 = 0x3032000000;
  uint64_t v38 = __Block_byref_object_copy__1;
  id v39 = __Block_byref_object_dispose__1;
  id v40 = 0;
  uint64_t v29 = 0;
  long long v30 = &v29;
  uint64_t v31 = 0x3032000000;
  uint64_t v32 = __Block_byref_object_copy__1;
  long long v33 = __Block_byref_object_dispose__1;
  id v34 = 0;
  activitySummaryQueue = self->_activitySummaryQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__ASActivityDataManager_recordIDsToDelete__block_invoke;
  block[3] = &unk_265216290;
  void block[4] = self;
  void block[5] = &v49;
  block[6] = &v43;
  void block[7] = v41;
  block[8] = &v35;
  block[9] = &v29;
  dispatch_sync(activitySummaryQueue, block);
  long long v23 = [MEMORY[0x263F0A9D0] snapshotWithActivitySummary:v44[5]];
  int v4 = [MEMORY[0x263F0A9D0] snapshotWithActivitySummary:v50[5]];
  uint64_t v5 = [(ASActivityDataManager *)self notificationEventsToPushWithYesterdaySnapshot:v23 todaySnapshot:v4 achievements:0 workouts:0 currentDeletedWorkoutAnchor:v36[5] currentGoalCompletionAnchor:v30[5]];
  uint64_t v6 = [(ASActivityDataManager *)self cloudKitManager];
  uint64_t v7 = [(id)objc_opt_class() activityDataRecordZoneID];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v57 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v25;
    uint64_t v11 = (void *)MEMORY[0x263EFFA68];
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if ([v13 type] == 3)
        {
          id v14 = [v13 triggerUUID];
          id v15 = ASWorkoutRecordIDForUUID();

          uint64_t v16 = [v11 arrayByAddingObject:v15];

          uint64_t v17 = [v13 triggerUUID];
          uint64_t v18 = ASWorkoutNotificationRecordIDForType();

          uint64_t v11 = [v16 arrayByAddingObject:v18];
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v57 count:16];
    }
    while (v9);
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x263EFFA68];
  }

  if ([v11 count])
  {
    ASLoggingInitialize();
    uint64_t v19 = (id)*MEMORY[0x263F23AA0];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = [v11 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v56 = v20;
      _os_log_impl(&dword_2474C9000, v19, OS_LOG_TYPE_DEFAULT, "Updating share: deleting %lu workout records", buf, 0xCu);
    }
  }
  id v21 = v11;

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v35, 8);

  _Block_object_dispose(v41, 8);
  _Block_object_dispose(&v43, 8);

  _Block_object_dispose(&v49, 8);
  return v21;
}

void __42__ASActivityDataManager_recordIDsToDelete__block_invoke(void *a1)
{
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), *(id *)(a1[4] + 144));
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), *(id *)(a1[4] + 168));
  objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), *(id *)(a1[4] + 64));
  objc_storeStrong((id *)(*(void *)(a1[8] + 8) + 40), *(id *)(a1[4] + 80));
  uint64_t v2 = *(void **)(a1[4] + 112);
  uint64_t v3 = (id *)(*(void *)(a1[9] + 8) + 40);
  objc_storeStrong(v3, v2);
}

- (void)periodicUpdateManager:(id)a3 didSaveRecords:(id)a4 activity:(id)a5
{
  activitySummaryQueue = self->_activitySummaryQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __71__ASActivityDataManager_periodicUpdateManager_didSaveRecords_activity___block_invoke;
  block[3] = &unk_2652157F0;
  void block[4] = self;
  dispatch_async(activitySummaryQueue, block);
}

void __71__ASActivityDataManager_periodicUpdateManager_didSaveRecords_activity___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 160), *(id *)(*(void *)(a1 + 32) + 152));
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 184), *(id *)(*(void *)(a1 + 32) + 176));
  objc_msgSend(*(id *)(a1 + 32), "_queue_setLastPushedWorkoutAnchor:", *(void *)(*(void *)(a1 + 32) + 56));
  objc_msgSend(*(id *)(a1 + 32), "_queue_setLastPushedDeletedWorkoutAnchor:", *(void *)(*(void *)(a1 + 32) + 72));
  objc_msgSend(*(id *)(a1 + 32), "_queue_setLastPushedTodayAchievementAnchorToken:", *(void *)(*(void *)(a1 + 32) + 88));
  objc_msgSend(*(id *)(a1 + 32), "_queue_setLastPushedGoalCompletionAnchor:", *(void *)(*(void *)(a1 + 32) + 104));
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 152);
  *(void *)(v2 + 152) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 176);
  *(void *)(v4 + 176) = 0;
}

- (void)periodicUpdateManager:(id)a3 didFailToSaveRecords:(id)a4 activity:(id)a5
{
  activitySummaryQueue = self->_activitySummaryQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __77__ASActivityDataManager_periodicUpdateManager_didFailToSaveRecords_activity___block_invoke;
  block[3] = &unk_2652157F0;
  void block[4] = self;
  dispatch_async(activitySummaryQueue, block);
}

void __77__ASActivityDataManager_periodicUpdateManager_didFailToSaveRecords_activity___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 152);
  *(void *)(v2 + 152) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 176);
  *(void *)(v4 + 176) = 0;
}

- (void)findDeletedWorkoutEventsWithAnchor:(id)a3 completion:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *, id))a4;
  ASLoggingInitialize();
  id v8 = (os_log_t *)MEMORY[0x263F23AA0];
  uint64_t v9 = *MEMORY[0x263F23AA0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v20 = v6;
    _os_log_impl(&dword_2474C9000, v9, OS_LOG_TYPE_DEFAULT, "Looking for deleted workouts with anchor: %{public}@", buf, 0xCu);
  }
  databaseClient = self->_databaseClient;
  id v17 = 0;
  id v18 = v6;
  id v11 = v6;
  uint64_t v12 = [(ASDatabaseClient *)databaseClient deletedHealthKitWorkoutsWithinLastNumberOfDays:7 maxBatchSize:100 anchor:&v18 error:&v17];
  id v13 = v18;

  id v14 = v17;
  id v15 = objc_msgSend(v12, "hk_map:", &__block_literal_global_367);
  ASLoggingInitialize();
  uint64_t v16 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2474C9000, v16, OS_LOG_TYPE_DEFAULT, "Finished looking for deleted workouts", buf, 2u);
  }
  if (v14)
  {
    ASLoggingInitialize();
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR)) {
      -[ASActivityDataManager findDeletedWorkoutEventsWithAnchor:completion:]();
    }
  }
  v7[2](v7, v15, v13);
}

id __71__ASActivityDataManager_findDeletedWorkoutEventsWithAnchor_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v2 = [a2 UUID];
  ASLoggingInitialize();
  uint64_t v3 = *MEMORY[0x263F23AA0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA0], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    uint64_t v7 = v2;
    _os_log_impl(&dword_2474C9000, v3, OS_LOG_TYPE_DEFAULT, "Found deleted workout with uuid=%{public}@", (uint8_t *)&v6, 0xCu);
  }
  uint64_t v4 = [MEMORY[0x263F23BE8] deletedWorkoutEventWithUUID:v2];

  return v4;
}

- (void)_ckQueue_handleDeletedWorkoutEvents:(id)a3 completion:(id)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v23 = a4;
  long long v24 = self;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_cloudKitManagerObserverQueue);
  id v7 = objc_alloc_init(MEMORY[0x263EFFA08]);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v30;
    uint64_t v12 = (os_log_t *)MEMORY[0x263F23AA0];
    do
    {
      uint64_t v13 = 0;
      id v14 = v7;
      do
      {
        if (*(void *)v30 != v11) {
          objc_enumerationMutation(v8);
        }
        id v15 = *(void **)(*((void *)&v29 + 1) + 8 * v13);
        ASLoggingInitialize();
        os_log_t v16 = *v12;
        if (os_log_type_enabled(*v12, OS_LOG_TYPE_DEFAULT))
        {
          id v17 = v16;
          id v18 = [v15 triggerUUID];
          *(_DWORD *)buf = 138412290;
          id v34 = v18;
          _os_log_impl(&dword_2474C9000, v17, OS_LOG_TYPE_DEFAULT, "Received an event for deleted workout: %@", buf, 0xCu);
        }
        uint64_t v19 = objc_msgSend(v15, "triggerUUID", v23, v24);
        id v7 = [v14 setByAddingObject:v19];

        ++v13;
        id v14 = v7;
      }
      while (v10 != v13);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v10);
  }

  healthDataQueue = v24->_healthDataQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __72__ASActivityDataManager__ckQueue_handleDeletedWorkoutEvents_completion___block_invoke;
  block[3] = &unk_265215FD0;
  id v26 = v7;
  long long v27 = v24;
  id v28 = v23;
  id v21 = v23;
  id v22 = v7;
  dispatch_async(healthDataQueue, block);
}

void __72__ASActivityDataManager__ckQueue_handleDeletedWorkoutEvents_completion___block_invoke(void *a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v18 = 0;
  uint64_t v2 = [MEMORY[0x263F0A668] predicateForObjectsWithUUIDs:a1[4]];
  uint64_t v3 = HDDataEntityPredicateForDataUUIDs();
  uint64_t v4 = [[ASPredicateContainer alloc] initWithHealthKitPredicate:v2 healthDaemonPredicate:v3];
  uint64_t v5 = *(void **)(a1[5] + 288);
  id v6 = [MEMORY[0x263F0A948] fitnessFriendWorkoutType];
  id v17 = 0;
  char v7 = [v5 deleteDataObjectsOfType:v6 predicate:v4 limit:0 deletedSampleCount:&v18 notifyObservers:0 generateDeletedObjects:0 error:&v17];
  id v8 = v17;

  ASLoggingInitialize();
  uint64_t v9 = *MEMORY[0x263F23AA0];
  uint64_t v10 = *MEMORY[0x263F23AA0];
  if (v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v20 = v18;
      _os_log_impl(&dword_2474C9000, v9, OS_LOG_TYPE_DEFAULT, "Successfully deleted %lu workout(s)", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    __72__ASActivityDataManager__ckQueue_handleDeletedWorkoutEvents_completion___block_invoke_cold_1();
  }
  uint64_t v11 = (void *)a1[6];
  if (v11)
  {
    uint64_t v12 = *(NSObject **)(a1[5] + 8);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __72__ASActivityDataManager__ckQueue_handleDeletedWorkoutEvents_completion___block_invoke_369;
    block[3] = &unk_2652162D8;
    id v15 = v11;
    char v16 = v7;
    id v14 = v8;
    dispatch_async(v12, block);
  }
}

uint64_t __72__ASActivityDataManager__ckQueue_handleDeletedWorkoutEvents_completion___block_invoke_369(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (id)_persistedAnchorWithKey:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activitySharingManager);
  id v6 = [WeakRetained deviceLocalActivitySharingKeyValueDomain];

  id v12 = 0;
  char v7 = [v6 numberForKey:v4 error:&v12];
  id v8 = v12;
  ASLoggingInitialize();
  uint64_t v9 = *MEMORY[0x263F23AA0];
  uint64_t v10 = *MEMORY[0x263F23AA0];
  if (v8)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[ASActivityDataManager _persistedAnchorWithKey:]();
    }
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v14 = v4;
    __int16 v15 = 2114;
    char v16 = v7;
    _os_log_impl(&dword_2474C9000, v9, OS_LOG_TYPE_DEFAULT, "Loaded %{public}@: %{public}@", buf, 0x16u);
  }

  return v7;
}

- (id)_persistedAnchorTokenWithKey:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activitySharingManager);
  id v6 = [WeakRetained deviceLocalActivitySharingKeyValueDomain];

  id v12 = 0;
  char v7 = [v6 stringForKey:v4 error:&v12];
  id v8 = v12;
  ASLoggingInitialize();
  uint64_t v9 = *MEMORY[0x263F23AA0];
  uint64_t v10 = *MEMORY[0x263F23AA0];
  if (v8)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[ASActivityDataManager _persistedAnchorWithKey:]();
    }
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v14 = v4;
    __int16 v15 = 2114;
    char v16 = v7;
    _os_log_impl(&dword_2474C9000, v9, OS_LOG_TYPE_DEFAULT, "Loaded %{public}@: [%{public}@]", buf, 0x16u);
  }

  return v7;
}

- (void)_queue_setLastPushedWorkoutAnchor:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_activitySummaryQueue);
  if (![(NSNumber *)self->_lastPushedWorkoutAnchor isEqualToNumber:v5])
  {
    objc_storeStrong((id *)&self->_lastPushedWorkoutAnchor, a3);
    [(ASActivityDataManager *)self _queue_persistAnchorValue:v5 forKey:@"LastPushedWorkoutAnchor"];
  }
}

- (void)_queue_setLastPushedDeletedWorkoutAnchor:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_activitySummaryQueue);
  if (![(NSNumber *)self->_lastPushedDeletedWorkoutAnchor isEqualToNumber:v5])
  {
    objc_storeStrong((id *)&self->_lastPushedDeletedWorkoutAnchor, a3);
    [(ASActivityDataManager *)self _queue_persistAnchorValue:v5 forKey:@"LastPushedDeletedWorkoutAnchor"];
  }
}

- (void)_queue_persistAnchorValue:(id)a3 forKey:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_activitySummaryQueue);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activitySharingManager);
  uint64_t v9 = [WeakRetained deviceLocalActivitySharingKeyValueDomain];

  id v13 = 0;
  [v9 setNumber:v6 forKey:v7 error:&v13];
  id v10 = v13;
  ASLoggingInitialize();
  uint64_t v11 = *MEMORY[0x263F23AA0];
  id v12 = *MEMORY[0x263F23AA0];
  if (v10)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[ASActivityDataManager _queue_persistAnchorValue:forKey:]();
    }
  }
  else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v15 = v7;
    __int16 v16 = 2114;
    id v17 = v6;
    _os_log_impl(&dword_2474C9000, v11, OS_LOG_TYPE_DEFAULT, "Updated %{public}@ to %{public}@", buf, 0x16u);
  }
}

- (void)_queue_setLastPushedTodayAchievementAnchorToken:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_activitySummaryQueue);
  if (![(NSString *)self->_lastPushedTodayAchievementAnchorToken isEqualToString:v5])
  {
    objc_storeStrong((id *)&self->_lastPushedTodayAchievementAnchorToken, a3);
    [(ASActivityDataManager *)self _queue_persistAnchorTokenValue:v5 forKey:@"LastPushedTodayAchievementAnchorToken"];
  }
}

- (void)_queue_setLastPushedGoalCompletionAnchor:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_activitySummaryQueue);
  if (![(NSNumber *)self->_lastPushedGoalCompletionAnchor isEqualToNumber:v5])
  {
    objc_storeStrong((id *)&self->_lastPushedGoalCompletionAnchor, a3);
    [(ASActivityDataManager *)self _queue_persistAnchorValue:self->_lastPushedGoalCompletionAnchor forKey:@"LastPushedGoalCompletionAnchor"];
  }
}

- (void)_queue_persistAnchorTokenValue:(id)a3 forKey:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_activitySummaryQueue);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activitySharingManager);
  uint64_t v9 = [WeakRetained deviceLocalActivitySharingKeyValueDomain];

  id v13 = 0;
  [v9 setString:v6 forKey:v7 error:&v13];
  id v10 = v13;
  ASLoggingInitialize();
  uint64_t v11 = *MEMORY[0x263F23AA0];
  id v12 = *MEMORY[0x263F23AA0];
  if (v10)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[ASActivityDataManager _queue_persistAnchorValue:forKey:]();
    }
  }
  else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v15 = v7;
    __int16 v16 = 2114;
    id v17 = v6;
    _os_log_impl(&dword_2474C9000, v11, OS_LOG_TYPE_DEFAULT, "Updated %{public}@ to [%{public}@]", buf, 0x16u);
  }
}

- (BOOL)_isAlertSuppressionEnabled
{
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  ASLoggingInitialize();
  id v4 = (os_log_t *)MEMORY[0x263F23AA0];
  id v5 = *MEMORY[0x263F23AA0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2474C9000, v5, OS_LOG_TYPE_DEFAULT, "Synchronously fetching alert suppression state", buf, 2u);
  }
  *(void *)buf = 0;
  id v15 = buf;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  databaseClient = self->_databaseClient;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __51__ASActivityDataManager__isAlertSuppressionEnabled__block_invoke;
  v11[3] = &unk_265216300;
  id v13 = buf;
  id v7 = v3;
  id v12 = v7;
  [(ASDatabaseClient *)databaseClient isActivityAlertSuppressionEnabledWithCompletion:v11];
  dispatch_time_t v8 = dispatch_time(0xFFFFFFFFFFFFFFFELL, 5000000000);
  if (dispatch_semaphore_wait(v7, v8))
  {
    ASLoggingInitialize();
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR)) {
      -[ASActivityDataManager _isAlertSuppressionEnabled]();
    }
    BOOL v9 = 0;
  }
  else
  {
    BOOL v9 = v15[24] != 0;
  }

  _Block_object_dispose(buf, 8);
  return v9;
}

intptr_t __51__ASActivityDataManager__isAlertSuppressionEnabled__block_invoke(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)updateSecureCloudGoalCompletionAnchor:(id)a3
{
  id v4 = a3;
  activitySummaryQueue = self->_activitySummaryQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __63__ASActivityDataManager_updateSecureCloudGoalCompletionAnchor___block_invoke;
  v7[3] = &unk_2652157C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(activitySummaryQueue, v7);
}

uint64_t __63__ASActivityDataManager_updateSecureCloudGoalCompletionAnchor___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setSecureCloudGoalCompletionAnchor:", *(void *)(a1 + 40));
}

- (void)_queue_setSecureCloudGoalCompletionAnchor:(id)a3
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_activitySummaryQueue);
  uint64_t v5 = [(NSNumber *)self->_secureCloudGoalCompletionAnchor integerValue];
  if (v5 < [v6 integerValue])
  {
    objc_storeStrong((id *)&self->_secureCloudGoalCompletionAnchor, a3);
    [(ASActivityDataManager *)self _queue_persistAnchorValue:v6 forKey:@"SecureCloudGoalCompletionAnchor"];
  }
}

- (ASActivitySharingManager)activitySharingManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activitySharingManager);
  return (ASActivitySharingManager *)WeakRetained;
}

- (void)setActivitySharingManager:(id)a3
{
}

- (ASCloudKitManager)cloudKitManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cloudKitManager);
  return (ASCloudKitManager *)WeakRetained;
}

- (void)setCloudKitManager:(id)a3
{
}

- (ASFriendListManager)friendListManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_friendListManager);
  return (ASFriendListManager *)WeakRetained;
}

- (void)setFriendListManager:(id)a3
{
}

- (ASPeriodicUpdateManager)periodicUpdateManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_periodicUpdateManager);
  return (ASPeriodicUpdateManager *)WeakRetained;
}

- (void)setPeriodicUpdateManager:(id)a3
{
}

- (ASDatabaseClient)databaseClient
{
  return self->_databaseClient;
}

- (void)setDatabaseClient:(id)a3
{
}

- (BOOL)isWatch
{
  return self->_isWatch;
}

- (void)setIsWatch:(BOOL)a3
{
  self->_isWatch = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databaseClient, 0);
  objc_destroyWeak((id *)&self->_periodicUpdateManager);
  objc_destroyWeak((id *)&self->_friendListManager);
  objc_destroyWeak((id *)&self->_cloudKitManager);
  objc_destroyWeak((id *)&self->_activitySharingManager);
  objc_storeStrong((id *)&self->_secureCloudGoalCompletionAnchor, 0);
  objc_destroyWeak((id *)&self->_achievementStore);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_snapshotSourceUUIDsByIndex, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_yesterdayLastPushedActivitySummary, 0);
  objc_storeStrong((id *)&self->_yesterdayInProgressPushActivitySummary, 0);
  objc_storeStrong((id *)&self->_yesterdayActivitySummary, 0);
  objc_storeStrong((id *)&self->_currentLastPushedActivitySummary, 0);
  objc_storeStrong((id *)&self->_currentInProgressPushActivitySummary, 0);
  objc_storeStrong((id *)&self->_currentActivitySummary, 0);
  objc_storeStrong((id *)&self->_observerQueue, 0);
  objc_storeStrong((id *)&self->_activitySummaryQueue, 0);
  objc_storeStrong((id *)&self->_healthDataQueue, 0);
  objc_storeStrong((id *)&self->_lastPushedGoalCompletionAnchor, 0);
  objc_storeStrong((id *)&self->_currentGoalCompletionAnchor, 0);
  objc_storeStrong((id *)&self->_lastPushedTodayAchievementAnchorToken, 0);
  objc_storeStrong((id *)&self->_currentTodayAchievementAnchorToken, 0);
  objc_storeStrong((id *)&self->_lastPushedDeletedWorkoutAnchor, 0);
  objc_storeStrong((id *)&self->_currentDeletedWorkoutAnchor, 0);
  objc_storeStrong((id *)&self->_lastPushedWorkoutAnchor, 0);
  objc_storeStrong((id *)&self->_currentWorkoutAnchor, 0);
  objc_storeStrong((id *)&self->_newDeletedWorkoutEvents, 0);
  objc_storeStrong((id *)&self->_newAchievements, 0);
  objc_storeStrong((id *)&self->_newWorkouts, 0);
  objc_storeStrong((id *)&self->_newSnapshots, 0);
  objc_storeStrong((id *)&self->_newSnapshotsForSelf, 0);
  objc_storeStrong((id *)&self->_cloudKitManagerObserverQueue, 0);
}

void __91__ASActivityDataManager_fetchAreMultipleDevicesSharingDataForSnapshotIndex_withCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2474C9000, v0, v1, "Error getting source UUID for active device: %{public}@", v2, v3, v4, v5, v6);
}

void __91__ASActivityDataManager_fetchAreMultipleDevicesSharingDataForSnapshotIndex_withCompletion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_2474C9000, v0, v1, "Could not find paired active device UUID.", v2, v3, v4, v5, v6);
}

- (void)currentAchievements
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2474C9000, v0, v1, "currentAchievements: Error getting all achievements: %@", v2, v3, v4, v5, v6);
}

- (void)_queue_insertSamples:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2474C9000, v0, v1, "Error %{public}@ saving activity sharing data", v2, v3, v4, v5, v6);
}

- (void)_queue_deleteActivityDataForFriendWithUUID:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2474C9000, v0, v1, "Failed to remove ASWorkoutEntity samples for friend UUUD: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_queue_deleteActivityDataForFriendWithUUID:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2474C9000, v0, v1, "Failed to remove ASActivitySnapshotEntity samples for friend UUUD: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_queue_deleteActivityDataForFriendWithUUID:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2474C9000, v0, v1, "Failed to remove ASAchievementEntity samples for friend UUUD: %{public}@", v2, v3, v4, v5, v6);
}

- (void)fitnessFriendSamplesForFriendWithUUID:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_6();
  _os_log_error_impl(&dword_2474C9000, v0, OS_LOG_TYPE_ERROR, "%s failed to get fitness friend samples from entity with error: %{public}@", (uint8_t *)v1, 0x16u);
}

void __66__ASActivityDataManager__queue_getAndHandleAllActivitySharingData__block_invoke_cold_1(void *a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v1 = a1;
  objc_opt_class();
  v4[0] = 136315394;
  OUTLINED_FUNCTION_6();
  id v3 = v2;
  _os_log_error_impl(&dword_2474C9000, v1, OS_LOG_TYPE_ERROR, "%s received unexpected type: %{public}@", (uint8_t *)v4, 0x16u);
}

- (void)_workoutsForActivitySnapshot:anchor:completion:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_2474C9000, v0, v1, "Failed to create Apple Watch samples HDSQLitePredicate", v2, v3, v4, v5, v6);
}

- (void)_workoutsForActivitySnapshot:anchor:completion:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_2474C9000, v0, v1, "Failed to create Apple Watch samples NSPredicate", v2, v3, v4, v5, v6);
}

- (void)_achievementsToPushWithYesterdaySnapshot:todaySnapshot:currentTodayAchievementAnchorToken:currentYesterdayAchievementAnchorToken:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2474C9000, v0, v1, "Error getting achievements to push for today: %@", v2, v3, v4, v5, v6);
}

void __38__ASActivityDataManager_recordsToSave__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_2474C9000, v0, v1, "Unexpected request to push activity summaries while a push is in progress", v2, v3, v4, v5, v6);
}

- (void)findDeletedWorkoutEventsWithAnchor:completion:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2474C9000, v0, v1, "Error enumerating deleted workouts: %@", v2, v3, v4, v5, v6);
}

void __72__ASActivityDataManager__ckQueue_handleDeletedWorkoutEvents_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2474C9000, v0, v1, "Error deleting workouts: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_persistedAnchorWithKey:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_0(&dword_2474C9000, v0, v1, "Error reading %{public}@ from key value domain: %{public}@");
}

- (void)_queue_persistAnchorValue:forKey:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_0(&dword_2474C9000, v0, v1, "Error updating %{public}@ in key value domain: %{public}@");
}

- (void)_isAlertSuppressionEnabled
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_2474C9000, v0, v1, "Timeout fetching alert suppression status, assuming alerts are not suppressed", v2, v3, v4, v5, v6);
}

@end