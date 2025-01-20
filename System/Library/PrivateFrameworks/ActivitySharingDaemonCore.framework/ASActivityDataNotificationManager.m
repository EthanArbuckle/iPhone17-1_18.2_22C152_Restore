@interface ASActivityDataNotificationManager
- (ASActivityDataBulletinManager)activityDataBulletinManager;
- (ASActivityDataManager)activityDataManager;
- (ASActivityDataNotificationManager)initWithDatabaseClient:(id)a3;
- (ASActivityDataNotificationRulesEngine)notificationRulesEngine;
- (ASCloudKitManager)cloudKitManager;
- (ASContactsManager)contactsManager;
- (ASFriendListManager)friendListManager;
- (ASPeriodicUpdateManager)periodicUpdateManager;
- (BOOL)isReadyToProcessChanges;
- (NSNumber)achievementAnchor;
- (NSNumber)goalCompletionAnchor;
- (NSNumber)workoutAnchor;
- (id)_localUserDefaultsDomain;
- (id)_mostRecentAchievementEarnedDateForFriendWithUUID:(id)a3;
- (id)_mostRecentGoalCompletedSnapshotIndexForFriendWithUUID:(id)a3;
- (id)_mostRecentMonthlyAchievementEarnedDateForFriendWithUUID:(id)a3;
- (id)_mostRecentWorkoutCompletionDateForFriendWithUUID:(id)a3;
- (id)_nanoUserDefaultsDomain;
- (id)_nanoUserDefaultsDomainKeyForFriendWithUUID:(id)a3 keyTypeString:(id)a4;
- (id)_queue_selectAchievementNotifications;
- (id)_queue_selectGoalCompletionNotifications;
- (id)_queue_selectWorkoutNotifications;
- (void)_notifyAboutWorkoutsDetectionIfRequired:(id)a3;
- (void)_queue_showFriendNotificationsIfRequired;
- (void)_setMostRecentAchievementEarnedDate:(id)a3 forFriendWithUUID:(id)a4;
- (void)_setMostRecentGoalCompletedSnapshotIndex:(id)a3 forFriendWithUUID:(id)a4;
- (void)_setMostRecentMonthlyAchievementEarnedDate:(id)a3 forFriendWithUUID:(id)a4;
- (void)_setMostRecentWorkoutCompletionDate:(id)a3 forFriendWithUUID:(id)a4;
- (void)achievementAnchor;
- (void)activitySharingManagerReady:(id)a3;
- (void)beginObserving;
- (void)cloudKitManager:(id)a3 didBeginUpdatesForFetchWithType:(int64_t)a4;
- (void)cloudKitManager:(id)a3 didEndUpdatesForFetchWithType:(int64_t)a4 activity:(id)a5 cloudKitGroup:(id)a6 changesProcessedHandler:(id)a7;
- (void)cloudKitManager:(id)a3 didReceiveNewActivitySnapshots:(id)a4 moreComing:(BOOL)a5 changesProcessedHandler:(id)a6;
- (void)cloudKitManager:(id)a3 didReceiveNewFriendAchievements:(id)a4 moreComing:(BOOL)a5 changesProcessedHandler:(id)a6;
- (void)cloudKitManager:(id)a3 didReceiveNewFriendWorkouts:(id)a4 moreComing:(BOOL)a5 changesProcessedHandler:(id)a6;
- (void)cloudKitManager:(id)a3 didReceiveNewNotificationEvents:(id)a4 moreComing:(BOOL)a5 changesProcessedHandler:(id)a6;
- (void)dealloc;
- (void)endObserving;
- (void)goalCompletionAnchor;
- (void)samplesAdded:(id)a3 anchor:(id)a4;
- (void)samplesOfTypesWereRemoved:(id)a3 anchor:(id)a4;
- (void)setAchievementAnchor:(id)a3;
- (void)setActivityDataBulletinManager:(id)a3;
- (void)setActivityDataManager:(id)a3;
- (void)setCloudKitManager:(id)a3;
- (void)setContactsManager:(id)a3;
- (void)setFriendListManager:(id)a3;
- (void)setGoalCompletionAnchor:(id)a3;
- (void)setNotificationRulesEngine:(id)a3;
- (void)setPeriodicUpdateManager:(id)a3;
- (void)setWorkoutAnchor:(id)a3;
- (void)workoutAnchor;
@end

@implementation ASActivityDataNotificationManager

- (ASActivityDataNotificationManager)initWithDatabaseClient:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ASActivityDataNotificationManager;
  v6 = [(ASActivityDataNotificationManager *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_databaseClient, a3);
    uint64_t v8 = HKCreateSerialDispatchQueue();
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v8;

    *(_WORD *)&v7->_receivedChangesFromCloudKit = 0;
    v10 = (ASActivityDataNotificationRulesEngine *)objc_alloc_init(MEMORY[0x263F23AF8]);
    notificationRulesEngine = v7->_notificationRulesEngine;
    v7->_notificationRulesEngine = v10;
  }
  return v7;
}

- (void)activitySharingManagerReady:(id)a3
{
  id v4 = a3;
  id v5 = [v4 activityDataManager];
  objc_storeWeak((id *)&self->_activityDataManager, v5);

  v6 = [v4 activityDataBulletinManager];
  objc_storeWeak((id *)&self->_activityDataBulletinManager, v6);

  v7 = [v4 cloudKitManager];
  objc_storeWeak((id *)&self->_cloudKitManager, v7);

  uint64_t v8 = [v4 contactsManager];
  objc_storeWeak((id *)&self->_contactsManager, v8);

  v9 = [v4 friendListManager];
  objc_storeWeak((id *)&self->_friendListManager, v9);

  id obj = [v4 periodicUpdateManager];

  objc_storeWeak((id *)&self->_periodicUpdateManager, obj);
}

- (void)beginObserving
{
  v9[4] = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F0A6E8] workoutType];
  v9[0] = v3;
  id v4 = [MEMORY[0x263F0A6E8] fitnessFriendActivitySnapshotType];
  v9[1] = v4;
  id v5 = [MEMORY[0x263F0A6E8] fitnessFriendAchievementType];
  v9[2] = v5;
  v6 = [MEMORY[0x263F0A6E8] fitnessFriendWorkoutType];
  v9[3] = v6;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:4];

  [(ASDatabaseClient *)self->_databaseClient addSampleObserver:self sampleTypes:v7];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cloudKitManager);
  [WeakRetained addObserver:self];
}

- (void)endObserving
{
  v9[4] = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F0A6E8] workoutType];
  v9[0] = v3;
  id v4 = [MEMORY[0x263F0A6E8] fitnessFriendActivitySnapshotType];
  v9[1] = v4;
  id v5 = [MEMORY[0x263F0A6E8] fitnessFriendAchievementType];
  v9[2] = v5;
  v6 = [MEMORY[0x263F0A6E8] fitnessFriendWorkoutType];
  v9[3] = v6;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:4];

  [(ASDatabaseClient *)self->_databaseClient removeSampleObserver:self sampleTypes:v7];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cloudKitManager);
  [WeakRetained removeObserver:self];
}

- (void)dealloc
{
  [(ASActivityDataNotificationManager *)self endObserving];
  v3.receiver = self;
  v3.super_class = (Class)ASActivityDataNotificationManager;
  [(ASActivityDataNotificationManager *)&v3 dealloc];
}

- (BOOL)isReadyToProcessChanges
{
  return 1;
}

- (void)cloudKitManager:(id)a3 didBeginUpdatesForFetchWithType:(int64_t)a4
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __85__ASActivityDataNotificationManager_cloudKitManager_didBeginUpdatesForFetchWithType___block_invoke;
  block[3] = &unk_2652157F0;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __85__ASActivityDataNotificationManager_cloudKitManager_didBeginUpdatesForFetchWithType___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 32) = 0;
  *(unsigned char *)(*(void *)(result + 32) + 33) = 1;
  return result;
}

- (void)cloudKitManager:(id)a3 didReceiveNewActivitySnapshots:(id)a4 moreComing:(BOOL)a5 changesProcessedHandler:(id)a6
{
  id v8 = a4;
  id v9 = a6;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __119__ASActivityDataNotificationManager_cloudKitManager_didReceiveNewActivitySnapshots_moreComing_changesProcessedHandler___block_invoke;
  block[3] = &unk_265215FD0;
  id v14 = v8;
  v15 = self;
  id v16 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(queue, block);
}

uint64_t __119__ASActivityDataNotificationManager_cloudKitManager_didReceiveNewActivitySnapshots_moreComing_changesProcessedHandler___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  ASLoggingInitialize();
  v2 = (void *)*MEMORY[0x263F23AD0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AD0], OS_LOG_TYPE_DEFAULT))
  {
    objc_super v3 = *(void **)(a1 + 32);
    id v4 = v2;
    int v6 = 134217984;
    uint64_t v7 = [v3 count];
    _os_log_impl(&dword_2474C9000, v4, OS_LOG_TYPE_DEFAULT, "ActivityDataNotificationManager processing %lu new activity snapshots.", (uint8_t *)&v6, 0xCu);
  }
  *(unsigned char *)(*(void *)(a1 + 40) + 32) |= [*(id *)(a1 + 32) count] != 0;
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)cloudKitManager:(id)a3 didReceiveNewFriendWorkouts:(id)a4 moreComing:(BOOL)a5 changesProcessedHandler:(id)a6
{
  id v8 = a4;
  id v9 = a6;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __116__ASActivityDataNotificationManager_cloudKitManager_didReceiveNewFriendWorkouts_moreComing_changesProcessedHandler___block_invoke;
  block[3] = &unk_265215FD0;
  id v14 = v8;
  v15 = self;
  id v16 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(queue, block);
}

uint64_t __116__ASActivityDataNotificationManager_cloudKitManager_didReceiveNewFriendWorkouts_moreComing_changesProcessedHandler___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  ASLoggingInitialize();
  v2 = (void *)*MEMORY[0x263F23AD0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AD0], OS_LOG_TYPE_DEFAULT))
  {
    objc_super v3 = *(void **)(a1 + 32);
    id v4 = v2;
    int v6 = 134217984;
    uint64_t v7 = [v3 count];
    _os_log_impl(&dword_2474C9000, v4, OS_LOG_TYPE_DEFAULT, "ActivityDataNotificationManager processing %lu new workouts.", (uint8_t *)&v6, 0xCu);
  }
  *(unsigned char *)(*(void *)(a1 + 40) + 32) |= [*(id *)(a1 + 32) count] != 0;
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)cloudKitManager:(id)a3 didReceiveNewFriendAchievements:(id)a4 moreComing:(BOOL)a5 changesProcessedHandler:(id)a6
{
  id v8 = a4;
  id v9 = a6;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __120__ASActivityDataNotificationManager_cloudKitManager_didReceiveNewFriendAchievements_moreComing_changesProcessedHandler___block_invoke;
  block[3] = &unk_265215FD0;
  id v14 = v8;
  v15 = self;
  id v16 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(queue, block);
}

uint64_t __120__ASActivityDataNotificationManager_cloudKitManager_didReceiveNewFriendAchievements_moreComing_changesProcessedHandler___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  ASLoggingInitialize();
  v2 = (void *)*MEMORY[0x263F23AD0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AD0], OS_LOG_TYPE_DEFAULT))
  {
    objc_super v3 = *(void **)(a1 + 32);
    id v4 = v2;
    int v6 = 134217984;
    uint64_t v7 = [v3 count];
    _os_log_impl(&dword_2474C9000, v4, OS_LOG_TYPE_DEFAULT, "ActivityDataNotificationManager processing %lu new achievements.", (uint8_t *)&v6, 0xCu);
  }
  *(unsigned char *)(*(void *)(a1 + 40) + 32) |= [*(id *)(a1 + 32) count] != 0;
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)cloudKitManager:(id)a3 didReceiveNewNotificationEvents:(id)a4 moreComing:(BOOL)a5 changesProcessedHandler:(id)a6
{
  id v8 = a4;
  id v9 = a6;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __120__ASActivityDataNotificationManager_cloudKitManager_didReceiveNewNotificationEvents_moreComing_changesProcessedHandler___block_invoke;
  block[3] = &unk_265215FD0;
  id v14 = v8;
  v15 = self;
  id v16 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(queue, block);
}

uint64_t __120__ASActivityDataNotificationManager_cloudKitManager_didReceiveNewNotificationEvents_moreComing_changesProcessedHandler___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  ASLoggingInitialize();
  v2 = (void *)*MEMORY[0x263F23AD0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AD0], OS_LOG_TYPE_DEFAULT))
  {
    objc_super v3 = *(void **)(a1 + 32);
    id v4 = v2;
    int v6 = 134217984;
    uint64_t v7 = [v3 count];
    _os_log_impl(&dword_2474C9000, v4, OS_LOG_TYPE_DEFAULT, "ActivityDataNotificationManager processing %lu new notification events.", (uint8_t *)&v6, 0xCu);
  }
  *(unsigned char *)(*(void *)(a1 + 40) + 32) |= [*(id *)(a1 + 32) count] != 0;
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)cloudKitManager:(id)a3 didEndUpdatesForFetchWithType:(int64_t)a4 activity:(id)a5 cloudKitGroup:(id)a6 changesProcessedHandler:(id)a7
{
  id v8 = a7;
  queue = self->_queue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __130__ASActivityDataNotificationManager_cloudKitManager_didEndUpdatesForFetchWithType_activity_cloudKitGroup_changesProcessedHandler___block_invoke;
  v11[3] = &unk_265215728;
  v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  dispatch_async(queue, v11);
}

uint64_t __130__ASActivityDataNotificationManager_cloudKitManager_didEndUpdatesForFetchWithType_activity_cloudKitGroup_changesProcessedHandler___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 33) = 0;
  int v2 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 32);
  ASLoggingInitialize();
  objc_super v3 = *MEMORY[0x263F23AD0];
  BOOL v4 = os_log_type_enabled((os_log_t)*MEMORY[0x263F23AD0], OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2474C9000, v3, OS_LOG_TYPE_DEFAULT, "ActivityDataNotificationManager received new data from CloudKit, showing notifications if required.", buf, 2u);
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 32) = 0;
    objc_msgSend(*(id *)(a1 + 32), "_queue_showFriendNotificationsIfRequired");
  }
  else if (v4)
  {
    *(_WORD *)int v6 = 0;
    _os_log_impl(&dword_2474C9000, v3, OS_LOG_TYPE_DEFAULT, "ActivityDataNotificationManager didn't receive any new data from CloudKit, not showing notifications", v6, 2u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)samplesAdded:(id)a3 anchor:(id)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = v6;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    v28 = self;
    id v29 = v7;
    int v10 = 0;
    uint64_t v11 = *(void *)v35;
    id v12 = (void *)MEMORY[0x263EFFA68];
    unint64_t v13 = 0x263F0A000uLL;
    do
    {
      uint64_t v14 = 0;
      uint64_t v31 = v9;
      do
      {
        if (*(void *)v35 != v11) {
          objc_enumerationMutation(obj);
        }
        v15 = *(void **)(*((void *)&v34 + 1) + 8 * v14);
        id v16 = [v15 sampleType];
        v17 = [*(id *)(v13 + 1432) workoutType];
        int v18 = [v16 isEqual:v17];

        if (v18)
        {
          uint64_t v19 = [v12 arrayByAddingObject:v15];

          id v12 = (void *)v19;
        }
        else
        {
          v20 = [v15 sampleType];
          v21 = [*(id *)(v13 + 1432) fitnessFriendWorkoutType];
          if ([v20 isEqual:v21])
          {
            int v22 = 1;
          }
          else
          {
            v23 = [v15 sampleType];
            v24 = [*(id *)(v13 + 1432) fitnessFriendAchievementType];
            if ([v23 isEqual:v24])
            {
              int v22 = 1;
            }
            else
            {
              [v15 sampleType];
              v25 = int v30 = v10;
              v26 = [*(id *)(v13 + 1432) fitnessFriendActivitySnapshotType];
              int v22 = [v25 isEqual:v26];

              int v10 = v30;
            }

            uint64_t v9 = v31;
            unint64_t v13 = 0x263F0A000;
          }

          v10 |= v22;
        }
        ++v14;
      }
      while (v9 != v14);
      uint64_t v9 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v9);
    [(ASActivityDataNotificationManager *)v28 _notifyAboutWorkoutsDetectionIfRequired:v12];
    if (v10)
    {
      queue = v28->_queue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __57__ASActivityDataNotificationManager_samplesAdded_anchor___block_invoke;
      block[3] = &unk_2652157F0;
      void block[4] = v28;
      dispatch_async(queue, block);
    }
    id v7 = v29;
  }
  else
  {
    id v12 = (void *)MEMORY[0x263EFFA68];
    [(ASActivityDataNotificationManager *)self _notifyAboutWorkoutsDetectionIfRequired:MEMORY[0x263EFFA68]];
  }
}

unsigned char *__57__ASActivityDataNotificationManager_samplesAdded_anchor___block_invoke(uint64_t a1)
{
  result = *(unsigned char **)(a1 + 32);
  if (!result[33]) {
    return (unsigned char *)objc_msgSend(result, "_queue_showFriendNotificationsIfRequired");
  }
  return result;
}

- (void)samplesOfTypesWereRemoved:(id)a3 anchor:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a3;
  ASLoggingInitialize();
  id v6 = (os_log_t *)MEMORY[0x263F23AD0];
  id v7 = *MEMORY[0x263F23AD0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AD0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2474C9000, v7, OS_LOG_TYPE_DEFAULT, "ActivityDataNotificationManager: samples removed, checking if any are workouts", buf, 2u);
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          ASLoggingInitialize();
          unint64_t v13 = *v6;
          if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_2474C9000, v13, OS_LOG_TYPE_DEFAULT, "ActivityDataNotificationManager: at least one sample is a workout, requesting push", buf, 2u);
          }
          id WeakRetained = objc_loadWeakRetained((id *)&self->_periodicUpdateManager);
          v15 = ASCloudKitGroupUserActionImplicit();
          objc_msgSend(WeakRetained, "requestImmediateUpdateWithCloudKitGroup:completion:", v15, 0, v16);

          goto LABEL_15;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_15:
}

- (id)_mostRecentWorkoutCompletionDateForFriendWithUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(ASActivityDataNotificationManager *)self _nanoUserDefaultsDomain];
  id v6 = [(ASActivityDataNotificationManager *)self _nanoUserDefaultsDomainKeyForFriendWithUUID:v4 keyTypeString:@"workoutCompletion"];
  id v11 = 0;
  id v7 = [v5 dateForKey:v6 error:&v11];
  id v8 = v11;
  uint64_t v9 = v8;
  if (!v7)
  {
    if (v8)
    {
      ASLoggingInitialize();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AD0], OS_LOG_TYPE_ERROR)) {
        -[ASActivityDataNotificationManager _mostRecentWorkoutCompletionDateForFriendWithUUID:]();
      }
    }
  }

  return v7;
}

- (void)_setMostRecentWorkoutCompletionDate:(id)a3 forFriendWithUUID:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ASActivityDataNotificationManager *)self _nanoUserDefaultsDomain];
  uint64_t v9 = [(ASActivityDataNotificationManager *)self _nanoUserDefaultsDomainKeyForFriendWithUUID:v7 keyTypeString:@"workoutCompletion"];
  id v14 = 0;
  char v10 = [v8 setDate:v6 forKey:v9 error:&v14];
  id v11 = v14;
  id v12 = v11;
  if ((v10 & 1) == 0)
  {
    if (v11)
    {
      ASLoggingInitialize();
      unint64_t v13 = *MEMORY[0x263F23AD0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AD0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        long long v16 = v12;
        __int16 v17 = 2114;
        id v18 = v7;
        __int16 v19 = 2114;
        id v20 = v6;
        _os_log_error_impl(&dword_2474C9000, v13, OS_LOG_TYPE_ERROR, "Error: %{public}@ saving workout completion data into key value domain. %{public}@: %{public}@", buf, 0x20u);
      }
    }
  }
}

- (id)_mostRecentAchievementEarnedDateForFriendWithUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(ASActivityDataNotificationManager *)self _nanoUserDefaultsDomain];
  id v6 = [(ASActivityDataNotificationManager *)self _nanoUserDefaultsDomainKeyForFriendWithUUID:v4 keyTypeString:@"achievementEarned"];
  id v11 = 0;
  id v7 = [v5 dateForKey:v6 error:&v11];
  id v8 = v11;
  uint64_t v9 = v8;
  if (!v7)
  {
    if (v8)
    {
      ASLoggingInitialize();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AD0], OS_LOG_TYPE_ERROR)) {
        -[ASActivityDataNotificationManager _mostRecentAchievementEarnedDateForFriendWithUUID:]();
      }
    }
  }

  return v7;
}

- (void)_setMostRecentAchievementEarnedDate:(id)a3 forFriendWithUUID:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x263EFF910] date];
  int v9 = objc_msgSend(v6, "hk_isAfterDate:", v8);

  if (v9)
  {
    ASLoggingInitialize();
    char v10 = *MEMORY[0x263F23AD0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AD0], OS_LOG_TYPE_ERROR)) {
      -[ASActivityDataNotificationManager _setMostRecentAchievementEarnedDate:forFriendWithUUID:](v10);
    }
  }
  else
  {
    id v11 = [(ASActivityDataNotificationManager *)self _nanoUserDefaultsDomain];
    id v12 = [(ASActivityDataNotificationManager *)self _nanoUserDefaultsDomainKeyForFriendWithUUID:v7 keyTypeString:@"achievementEarned"];
    id v17 = 0;
    char v13 = [v11 setDate:v6 forKey:v12 error:&v17];
    id v14 = v17;
    v15 = v14;
    if ((v13 & 1) == 0)
    {
      if (v14)
      {
        ASLoggingInitialize();
        long long v16 = *MEMORY[0x263F23AD0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AD0], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543874;
          __int16 v19 = v15;
          __int16 v20 = 2114;
          id v21 = v7;
          __int16 v22 = 2114;
          id v23 = v6;
          _os_log_error_impl(&dword_2474C9000, v16, OS_LOG_TYPE_ERROR, "Error: %{public}@ saving achievement earned data into key value domain. %{public}@: %{public}@", buf, 0x20u);
        }
      }
    }
  }
}

- (id)_mostRecentMonthlyAchievementEarnedDateForFriendWithUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(ASActivityDataNotificationManager *)self _nanoUserDefaultsDomain];
  id v6 = [(ASActivityDataNotificationManager *)self _nanoUserDefaultsDomainKeyForFriendWithUUID:v4 keyTypeString:@"monthlyAchievementEarned"];
  id v11 = 0;
  id v7 = [v5 dateForKey:v6 error:&v11];
  id v8 = v11;
  int v9 = v8;
  if (!v7)
  {
    if (v8)
    {
      ASLoggingInitialize();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AD0], OS_LOG_TYPE_ERROR)) {
        -[ASActivityDataNotificationManager _mostRecentMonthlyAchievementEarnedDateForFriendWithUUID:]();
      }
    }
  }

  return v7;
}

- (void)_setMostRecentMonthlyAchievementEarnedDate:(id)a3 forFriendWithUUID:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ASActivityDataNotificationManager *)self _nanoUserDefaultsDomain];
  int v9 = [(ASActivityDataNotificationManager *)self _nanoUserDefaultsDomainKeyForFriendWithUUID:v7 keyTypeString:@"monthlyAchievementEarned"];
  id v14 = 0;
  char v10 = [v8 setDate:v6 forKey:v9 error:&v14];
  id v11 = v14;
  id v12 = v11;
  if ((v10 & 1) == 0)
  {
    if (v11)
    {
      ASLoggingInitialize();
      char v13 = *MEMORY[0x263F23AD0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AD0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        long long v16 = v12;
        __int16 v17 = 2114;
        id v18 = v7;
        __int16 v19 = 2114;
        id v20 = v6;
        _os_log_error_impl(&dword_2474C9000, v13, OS_LOG_TYPE_ERROR, "Error: %{public}@ saving monthly achievement earned data into key value domain. %{public}@: %{public}@", buf, 0x20u);
      }
    }
  }
}

- (id)_mostRecentGoalCompletedSnapshotIndexForFriendWithUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(ASActivityDataNotificationManager *)self _nanoUserDefaultsDomain];
  id v6 = [(ASActivityDataNotificationManager *)self _nanoUserDefaultsDomainKeyForFriendWithUUID:v4 keyTypeString:@"goalCompletionIndex"];
  id v11 = 0;
  id v7 = [v5 numberForKey:v6 error:&v11];
  id v8 = v11;
  int v9 = v8;
  if (!v7)
  {
    if (v8)
    {
      ASLoggingInitialize();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AD0], OS_LOG_TYPE_ERROR)) {
        -[ASActivityDataNotificationManager _mostRecentGoalCompletedSnapshotIndexForFriendWithUUID:]();
      }
    }
  }

  return v7;
}

- (void)_setMostRecentGoalCompletedSnapshotIndex:(id)a3 forFriendWithUUID:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ASActivityDataNotificationManager *)self _nanoUserDefaultsDomain];
  int v9 = [(ASActivityDataNotificationManager *)self _nanoUserDefaultsDomainKeyForFriendWithUUID:v7 keyTypeString:@"goalCompletionIndex"];
  id v14 = 0;
  char v10 = [v8 setNumber:v6 forKey:v9 error:&v14];
  id v11 = v14;
  id v12 = v11;
  if ((v10 & 1) == 0)
  {
    if (v11)
    {
      ASLoggingInitialize();
      char v13 = *MEMORY[0x263F23AD0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AD0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        long long v16 = v12;
        __int16 v17 = 2114;
        id v18 = v7;
        __int16 v19 = 2114;
        id v20 = v6;
        _os_log_error_impl(&dword_2474C9000, v13, OS_LOG_TYPE_ERROR, "Error: %{public}@ saving goal completion data into key value domain. %{public}@: %{public}@", buf, 0x20u);
      }
    }
  }
}

- (NSNumber)workoutAnchor
{
  int v2 = [(ASActivityDataNotificationManager *)self _localUserDefaultsDomain];
  id v6 = 0;
  objc_super v3 = [v2 numberForKey:@"fitnessFriendsWorkoutAnchorKey" error:&v6];
  id v4 = v6;
  if (v4)
  {
    ASLoggingInitialize();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AD0], OS_LOG_TYPE_ERROR)) {
      -[ASActivityDataNotificationManager workoutAnchor]();
    }

    objc_super v3 = 0;
  }

  return (NSNumber *)v3;
}

- (void)setWorkoutAnchor:(id)a3
{
  id v4 = a3;
  id v5 = [(ASActivityDataNotificationManager *)self _localUserDefaultsDomain];
  id v7 = 0;
  [v5 setNumber:v4 forKey:@"fitnessFriendsWorkoutAnchorKey" error:&v7];
  id v6 = v7;
  if (v6)
  {
    ASLoggingInitialize();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AD0], OS_LOG_TYPE_ERROR)) {
      -[ASActivityDataNotificationManager setWorkoutAnchor:]();
    }
  }
}

- (NSNumber)achievementAnchor
{
  int v2 = [(ASActivityDataNotificationManager *)self _localUserDefaultsDomain];
  id v6 = 0;
  objc_super v3 = [v2 numberForKey:@"fitnessFriendsAchievementAnchorKey" error:&v6];
  id v4 = v6;
  if (v4)
  {
    ASLoggingInitialize();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AD0], OS_LOG_TYPE_ERROR)) {
      -[ASActivityDataNotificationManager achievementAnchor]();
    }

    objc_super v3 = 0;
  }

  return (NSNumber *)v3;
}

- (void)setAchievementAnchor:(id)a3
{
  id v4 = a3;
  id v5 = [(ASActivityDataNotificationManager *)self _localUserDefaultsDomain];
  id v7 = 0;
  [v5 setNumber:v4 forKey:@"fitnessFriendsAchievementAnchorKey" error:&v7];
  id v6 = v7;
  if (v6)
  {
    ASLoggingInitialize();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AD0], OS_LOG_TYPE_ERROR)) {
      -[ASActivityDataNotificationManager setAchievementAnchor:]();
    }
  }
}

- (NSNumber)goalCompletionAnchor
{
  int v2 = [(ASActivityDataNotificationManager *)self _localUserDefaultsDomain];
  id v6 = 0;
  objc_super v3 = [v2 numberForKey:@"fitnessFriendsGoalCompletionAnchorKey" error:&v6];
  id v4 = v6;
  if (v4)
  {
    ASLoggingInitialize();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AD0], OS_LOG_TYPE_ERROR)) {
      -[ASActivityDataNotificationManager goalCompletionAnchor]();
    }

    objc_super v3 = 0;
  }

  return (NSNumber *)v3;
}

- (void)setGoalCompletionAnchor:(id)a3
{
  id v4 = a3;
  id v5 = [(ASActivityDataNotificationManager *)self _localUserDefaultsDomain];
  id v7 = 0;
  [v5 setNumber:v4 forKey:@"fitnessFriendsGoalCompletionAnchorKey" error:&v7];
  id v6 = v7;
  if (v6)
  {
    ASLoggingInitialize();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AD0], OS_LOG_TYPE_ERROR)) {
      -[ASActivityDataNotificationManager setGoalCompletionAnchor:]();
    }
  }
}

- (id)_localUserDefaultsDomain
{
  return [(ASDatabaseClient *)self->_databaseClient makeASKeyValueDomainWithDomainName:@"ActivitySharing.Notifications" category:3];
}

- (void)_queue_showFriendNotificationsIfRequired
{
  id v3 = objc_alloc(MEMORY[0x263EFFA40]);
  id v4 = (void *)[v3 initWithSuiteName:*MEMORY[0x263F23CC8]];
  id v5 = [v4 objectForKey:*MEMORY[0x263F23D58]];
  id v6 = v5;
  if (v5 && ![v5 BOOLValue])
  {
    ASLoggingInitialize();
    int v9 = *MEMORY[0x263F23AD0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AD0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2474C9000, v9, OS_LOG_TYPE_DEFAULT, "ActivityDataNotificationManager: Not showing notifications since pref is disabled.", buf, 2u);
    }
  }
  else
  {
    ASLoggingInitialize();
    id v7 = *MEMORY[0x263F23AD0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AD0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2474C9000, v7, OS_LOG_TYPE_DEFAULT, "ActivityDataNotificationManager: Showing friend notifications", buf, 2u);
    }
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __77__ASActivityDataNotificationManager__queue_showFriendNotificationsIfRequired__block_invoke;
    block[3] = &unk_2652157F0;
    void block[4] = self;
    dispatch_async(queue, block);
  }
}

void __77__ASActivityDataNotificationManager__queue_showFriendNotificationsIfRequired__block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263F23AF0]);
  id v3 = objc_msgSend(*(id *)(a1 + 32), "_queue_selectWorkoutNotifications");
  [v2 setWorkoutNotifications:v3];

  id v4 = objc_msgSend(*(id *)(a1 + 32), "_queue_selectAchievementNotifications");
  [v2 setAchievementNotifications:v4];

  id v5 = objc_msgSend(*(id *)(a1 + 32), "_queue_selectGoalCompletionNotifications");
  [v2 setGoalCompletionNotifications:v5];

  ASLoggingInitialize();
  id v6 = (os_log_t *)MEMORY[0x263F23AD0];
  id v7 = *MEMORY[0x263F23AD0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AD0], OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v23) = 0;
    _os_log_impl(&dword_2474C9000, v7, OS_LOG_TYPE_DEFAULT, "Selected notifications:", (uint8_t *)&v23, 2u);
  }
  ASLoggingInitialize();
  os_log_t v8 = *v6;
  if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = v8;
    char v10 = [v2 workoutNotifications];
    uint64_t v11 = [v10 count];
    int v23 = 134217984;
    uint64_t v24 = v11;
    _os_log_impl(&dword_2474C9000, v9, OS_LOG_TYPE_DEFAULT, "Workouts: %lu", (uint8_t *)&v23, 0xCu);
  }
  ASLoggingInitialize();
  os_log_t v12 = *v6;
  if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
  {
    char v13 = v12;
    id v14 = [v2 achievementNotifications];
    uint64_t v15 = [v14 count];
    int v23 = 134217984;
    uint64_t v24 = v15;
    _os_log_impl(&dword_2474C9000, v13, OS_LOG_TYPE_DEFAULT, "Achievements: %lu", (uint8_t *)&v23, 0xCu);
  }
  ASLoggingInitialize();
  os_log_t v16 = *v6;
  if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v17 = v16;
    id v18 = [v2 goalCompletionNotifications];
    uint64_t v19 = [v18 count];
    int v23 = 134217984;
    uint64_t v24 = v19;
    _os_log_impl(&dword_2474C9000, v17, OS_LOG_TYPE_DEFAULT, "Goal completions: %lu", (uint8_t *)&v23, 0xCu);
  }
  id v20 = [*(id *)(*(void *)(a1 + 32) + 40) filterNotificationGroup:v2];
  ASLoggingInitialize();
  uint64_t v21 = *v6;
  if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v23) = 0;
    _os_log_impl(&dword_2474C9000, v21, OS_LOG_TYPE_DEFAULT, "Filtered notifications, posting", (uint8_t *)&v23, 2u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 80));
  [WeakRetained showActivityNotifications:v20 withPostingStyle:0];
}

- (id)_queue_selectWorkoutNotifications
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  ASLoggingInitialize();
  id v3 = (os_log_t *)MEMORY[0x263F23AD0];
  id v4 = *MEMORY[0x263F23AD0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AD0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2474C9000, v4, OS_LOG_TYPE_DEFAULT, "Selecting workouts for notifications", buf, 2u);
  }
  id v5 = [(ASActivityDataNotificationManager *)self workoutAnchor];
  ASLoggingInitialize();
  id v6 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v29 = v5;
    _os_log_impl(&dword_2474C9000, v6, OS_LOG_TYPE_DEFAULT, "Current workout anchor is %{public}@", buf, 0xCu);
  }
  id v7 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  id v8 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v9 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  databaseClient = self->_databaseClient;
  id v26 = 0;
  id v27 = v5;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __70__ASActivityDataNotificationManager__queue_selectWorkoutNotifications__block_invoke;
  v22[3] = &unk_265217278;
  v22[4] = self;
  id v11 = v8;
  id v23 = v11;
  id v12 = v9;
  id v24 = v12;
  id v13 = v7;
  id v25 = v13;
  BOOL v14 = [(ASDatabaseClient *)databaseClient enumerateActivitySharingWorkoutsWithPredicate:0 anchor:&v27 error:&v26 handler:v22];
  id v15 = v27;

  id v16 = v26;
  if (v14)
  {
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __70__ASActivityDataNotificationManager__queue_selectWorkoutNotifications__block_invoke_315;
    v21[3] = &unk_2652172A0;
    v21[4] = self;
    [v12 enumerateKeysAndObjectsUsingBlock:v21];
    [(ASActivityDataNotificationManager *)self setWorkoutAnchor:v15];
    ASLoggingInitialize();
    __int16 v17 = *v3;
    if (!os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    *(_DWORD *)buf = 138543362;
    id v29 = v15;
    id v18 = "WorkoutAnchor set to: %{public}@";
  }
  else
  {
    ASLoggingInitialize();
    __int16 v17 = *v3;
    if (!os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    *(_DWORD *)buf = 138543362;
    id v29 = v16;
    id v18 = "Error: %{public}@ fetching workouts";
  }
  _os_log_impl(&dword_2474C9000, v17, OS_LOG_TYPE_DEFAULT, v18, buf, 0xCu);
LABEL_11:
  uint64_t v19 = (void *)[v13 copy];

  return v19;
}

uint64_t __70__ASActivityDataNotificationManager__queue_selectWorkoutNotifications__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 72));
  id v5 = [v3 friendUUID];
  id v6 = [WeakRetained friendWithUUID:v5];

  ASLoggingInitialize();
  id v7 = (os_log_t *)MEMORY[0x263F23AD0];
  id v8 = (void *)*MEMORY[0x263F23AD0];
  id v9 = *MEMORY[0x263F23AD0];
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      char v10 = v8;
      id v11 = [v6 UUID];
      id v12 = [v3 endDate];
      int v35 = 138543618;
      long long v36 = v11;
      __int16 v37 = 2114;
      v38 = v12;
      _os_log_impl(&dword_2474C9000, v10, OS_LOG_TYPE_DEFAULT, "Evaluating workout for friend with UUID %{public}@, end date (on remote device) is %{public}@", (uint8_t *)&v35, 0x16u);
    }
    id v13 = *(void **)(a1 + 40);
    BOOL v14 = [v6 UUID];
    id v15 = [v13 objectForKeyedSubscript:v14];

    if (!v15)
    {
      id v16 = *(void **)(a1 + 32);
      __int16 v17 = [v6 UUID];
      id v18 = [v17 UUIDString];
      id v15 = [v16 _mostRecentWorkoutCompletionDateForFriendWithUUID:v18];

      uint64_t v19 = *(void **)(a1 + 40);
      id v20 = [v6 UUID];
      [v19 setObject:v15 forKeyedSubscript:v20];
    }
    ASLoggingInitialize();
    uint64_t v21 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
    {
      int v35 = 138412290;
      long long v36 = v15;
      _os_log_impl(&dword_2474C9000, v21, OS_LOG_TYPE_DEFAULT, "Last known workout completion date: %@", (uint8_t *)&v35, 0xCu);
    }
    if (v15
      && ([v3 endDate],
          __int16 v22 = objc_claimAutoreleasedReturnValue(),
          char v23 = objc_msgSend(v22, "hk_isAfterDate:", v15),
          v22,
          (v23 & 1) == 0))
    {
      ASLoggingInitialize();
      long long v34 = *v7;
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v35) = 0;
        _os_log_impl(&dword_2474C9000, v34, OS_LOG_TYPE_DEFAULT, "Last known workout is newer, skip this one", (uint8_t *)&v35, 2u);
      }
    }
    else
    {
      id v24 = *(void **)(a1 + 48);
      id v25 = [v6 UUID];
      id v26 = [v24 objectForKeyedSubscript:v25];

      if (!v26
        || ([v3 endDate],
            id v27 = objc_claimAutoreleasedReturnValue(),
            int v28 = objc_msgSend(v27, "hk_isAfterDate:", v26),
            v27,
            v28))
      {
        id v29 = [v3 endDate];
        uint64_t v30 = *(void **)(a1 + 48);
        uint64_t v31 = [v6 UUID];
        [v30 setObject:v29 forKeyedSubscript:v31];
      }
      v32 = objc_opt_new();
      [v32 setFriend:v6];
      [v32 setSample:v3];
      [*(id *)(a1 + 56) addObject:v32];
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    __70__ASActivityDataNotificationManager__queue_selectWorkoutNotifications__block_invoke_cold_1(v8, v3);
  }

  return 1;
}

void __70__ASActivityDataNotificationManager__queue_selectWorkoutNotifications__block_invoke_315(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  ASLoggingInitialize();
  id v7 = *MEMORY[0x263F23AD0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AD0], OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412546;
    id v11 = v6;
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_impl(&dword_2474C9000, v7, OS_LOG_TYPE_DEFAULT, "Updating most recent workout completion date: %@, for friend: %@", (uint8_t *)&v10, 0x16u);
  }
  id v8 = *(void **)(a1 + 32);
  id v9 = [v5 UUIDString];
  [v8 _setMostRecentWorkoutCompletionDate:v6 forFriendWithUUID:v9];
}

- (id)_queue_selectAchievementNotifications
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  ASLoggingInitialize();
  id v3 = (os_log_t *)MEMORY[0x263F23AD0];
  id v4 = *MEMORY[0x263F23AD0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AD0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2474C9000, v4, OS_LOG_TYPE_DEFAULT, "Selecting achievements for notifications", buf, 2u);
  }
  id v5 = [(ASActivityDataNotificationManager *)self achievementAnchor];
  ASLoggingInitialize();
  id v6 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v36 = v5;
    _os_log_impl(&dword_2474C9000, v6, OS_LOG_TYPE_DEFAULT, "Current achievement anchor is %{public}@", buf, 0xCu);
  }
  id v7 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  id v8 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v9 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v10 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v11 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  databaseClient = self->_databaseClient;
  id v34 = v5;
  id v33 = 0;
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __74__ASActivityDataNotificationManager__queue_selectAchievementNotifications__block_invoke;
  v27[3] = &unk_2652172C8;
  v27[4] = self;
  id v13 = v10;
  id v28 = v13;
  id v14 = v8;
  id v29 = v14;
  id v15 = v11;
  id v30 = v15;
  id v16 = v9;
  id v31 = v16;
  id v17 = v7;
  id v32 = v17;
  BOOL v18 = [(ASDatabaseClient *)databaseClient enumerateActivitySharingAchievementsWithPredicate:0 anchor:&v34 error:&v33 handler:v27];
  id v19 = v34;

  id v20 = v33;
  if (v18)
  {
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __74__ASActivityDataNotificationManager__queue_selectAchievementNotifications__block_invoke_325;
    v26[3] = &unk_2652172A0;
    v26[4] = self;
    [v16 enumerateKeysAndObjectsUsingBlock:v26];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __74__ASActivityDataNotificationManager__queue_selectAchievementNotifications__block_invoke_326;
    v25[3] = &unk_2652172A0;
    v25[4] = self;
    [v15 enumerateKeysAndObjectsUsingBlock:v25];
    [(ASActivityDataNotificationManager *)self setAchievementAnchor:v19];
    ASLoggingInitialize();
    uint64_t v21 = *v3;
    if (!os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    *(_DWORD *)buf = 138543362;
    id v36 = v19;
    __int16 v22 = "AchievementAnchor set to: %{public}@";
  }
  else
  {
    ASLoggingInitialize();
    uint64_t v21 = *v3;
    if (!os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    *(_DWORD *)buf = 138543362;
    id v36 = v20;
    __int16 v22 = "Error: %{public}@ fetching achievements";
  }
  _os_log_impl(&dword_2474C9000, v21, OS_LOG_TYPE_DEFAULT, v22, buf, 0xCu);
LABEL_11:
  char v23 = (void *)[v17 copy];

  return v23;
}

uint64_t __74__ASActivityDataNotificationManager__queue_selectAchievementNotifications__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 72));
  id v5 = [v3 friendUUID];
  id v6 = [WeakRetained friendWithUUID:v5];

  id v7 = (os_log_t *)MEMORY[0x263F23AD0];
  if (!v6)
  {
    ASLoggingInitialize();
    os_log_t v28 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR)) {
      __74__ASActivityDataNotificationManager__queue_selectAchievementNotifications__block_invoke_cold_1(v28, v3);
    }
    goto LABEL_43;
  }
  id v8 = [v3 templateUniqueName];
  int IsMonthlyChallenge = ACHTemplateUniqueNameIsMonthlyChallenge();

  ASLoggingInitialize();
  os_log_t v10 = *v7;
  if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = v10;
    __int16 v12 = [v6 UUID];
    uint64_t v13 = [v3 completedDate];
    id v14 = (void *)v13;
    id v15 = @"NO";
    *(_DWORD *)buf = 138543874;
    v62 = v12;
    __int16 v63 = 2114;
    if (IsMonthlyChallenge) {
      id v15 = @"YES";
    }
    uint64_t v64 = v13;
    __int16 v65 = 2114;
    v66 = v15;
    _os_log_impl(&dword_2474C9000, v11, OS_LOG_TYPE_DEFAULT, "Evaluating new achievement for friend %{public}@, completed date %{public}@, monthly %{public}@", buf, 0x20u);
  }
  if (IsMonthlyChallenge)
  {
    id v16 = *(void **)(a1 + 40);
    id v17 = [v6 UUID];
    BOOL v18 = [v16 objectForKeyedSubscript:v17];

    if (v18) {
      goto LABEL_9;
    }
    id v19 = *(void **)(a1 + 32);
    id v20 = [v6 UUID];
    uint64_t v21 = [v20 UUIDString];
    BOOL v18 = [v19 _mostRecentMonthlyAchievementEarnedDateForFriendWithUUID:v21];

    __int16 v22 = *(void **)(a1 + 40);
    char v23 = [v6 UUID];
    [v22 setObject:v18 forKeyedSubscript:v23];

    if (v18)
    {
LABEL_9:
      id v24 = [v3 completedDate];
      char v25 = objc_msgSend(v24, "hk_isAfterDate:", v18);
    }
    else
    {
      char v25 = 1;
    }
    ASLoggingInitialize();
    id v26 = *v7;
    if (!os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_20;
    }
    *(_DWORD *)buf = 138412290;
    v62 = v18;
    id v27 = "Last known monthly achievement completion date: %@";
  }
  else
  {
    id v29 = *(void **)(a1 + 48);
    id v30 = [v6 UUID];
    BOOL v18 = [v29 objectForKeyedSubscript:v30];

    if (v18) {
      goto LABEL_16;
    }
    id v31 = *(void **)(a1 + 32);
    id v32 = [v6 UUID];
    id v33 = [v32 UUIDString];
    BOOL v18 = [v31 _mostRecentAchievementEarnedDateForFriendWithUUID:v33];

    id v34 = *(void **)(a1 + 48);
    int v35 = [v6 UUID];
    [v34 setObject:v18 forKeyedSubscript:v35];

    if (v18)
    {
LABEL_16:
      id v36 = [v3 completedDate];
      char v25 = objc_msgSend(v36, "hk_isAfterOrEqualToDate:", v18);
    }
    else
    {
      char v25 = 1;
    }
    ASLoggingInitialize();
    id v26 = *v7;
    if (!os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_20;
    }
    *(_DWORD *)buf = 138412290;
    v62 = v18;
    id v27 = "Last known achievement completion date: %@";
  }
  _os_log_impl(&dword_2474C9000, v26, OS_LOG_TYPE_DEFAULT, v27, buf, 0xCu);
LABEL_20:

  if (v25)
  {
    uint64_t v37 = [v3 templateUniqueName];
    int v38 = ASIsCompetitionVictoryTemplate();

    if (v38)
    {
      uint64_t v39 = ASEphemeralCompetitionVictoryAchievementForFriendAchievement();
      if (v39) {
        goto LABEL_23;
      }
    }
    else
    {
      if (ACHShouldUseNewAwardsSystem())
      {
        id v48 = objc_alloc_init(MEMORY[0x263F238D8]);
        v49 = [v3 templateUniqueName];
        id v60 = 0;
        uint64_t v39 = [v48 ephemeralAchievementWithTemplateUniqueName:v49 error:&v60];
        id v50 = v60;

        if (v50)
        {
          ASLoggingInitialize();
          os_log_t v51 = *v7;
          if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR)) {
            __74__ASActivityDataNotificationManager__queue_selectAchievementNotifications__block_invoke_cold_3(v51, v3, (uint64_t)v50);
          }
        }
      }
      else
      {
        id v48 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
        id v50 = [v3 templateUniqueName];
        uint64_t v39 = [v48 ephemeralAchievementWithTemplateUniqueName:v50];
      }

      if (v39)
      {
LABEL_23:
        if (IsMonthlyChallenge)
        {
          v40 = *(void **)(a1 + 56);
          v41 = [v6 UUID];
          v42 = [v40 objectForKeyedSubscript:v41];

          if (v42)
          {
            v43 = [v3 completedDate];
            int v44 = objc_msgSend(v43, "hk_isAfterDate:", v42);

            if (!v44) {
              goto LABEL_37;
            }
          }
          v45 = [v3 completedDate];
          v46 = *(void **)(a1 + 56);
        }
        else
        {
          v52 = *(void **)(a1 + 64);
          v53 = [v6 UUID];
          v42 = [v52 objectForKeyedSubscript:v53];

          if (v42)
          {
            v54 = [v3 completedDate];
            int v55 = objc_msgSend(v54, "hk_isAfterDate:", v42);

            if (!v55) {
              goto LABEL_37;
            }
          }
          v45 = [v3 completedDate];
          v46 = *(void **)(a1 + 64);
        }
        v56 = [v6 UUID];
        [v46 setObject:v45 forKeyedSubscript:v56];

LABEL_37:
        v57 = ASEphemeralEarnedAchievementForFriendAchievement();
        v58 = objc_opt_new();
        [v58 setFriend:v6];
        [v58 setSample:v57];
        [*(id *)(a1 + 72) addObject:v58];

LABEL_42:
        goto LABEL_43;
      }
    }
    ASLoggingInitialize();
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR)) {
      __74__ASActivityDataNotificationManager__queue_selectAchievementNotifications__block_invoke_cold_2();
    }
    goto LABEL_42;
  }
  ASLoggingInitialize();
  v47 = *v7;
  if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2474C9000, v47, OS_LOG_TYPE_DEFAULT, "Last known achievement is newer, skip this one", buf, 2u);
  }
LABEL_43:

  return 1;
}

void __74__ASActivityDataNotificationManager__queue_selectAchievementNotifications__block_invoke_325(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  ASLoggingInitialize();
  id v7 = *MEMORY[0x263F23AD0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AD0], OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412546;
    id v11 = v6;
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_impl(&dword_2474C9000, v7, OS_LOG_TYPE_DEFAULT, "Updating most recent achievement earned date: %@, for friend: %@", (uint8_t *)&v10, 0x16u);
  }
  id v8 = *(void **)(a1 + 32);
  id v9 = [v5 UUIDString];
  [v8 _setMostRecentAchievementEarnedDate:v6 forFriendWithUUID:v9];
}

void __74__ASActivityDataNotificationManager__queue_selectAchievementNotifications__block_invoke_326(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  ASLoggingInitialize();
  id v7 = *MEMORY[0x263F23AD0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AD0], OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412546;
    id v11 = v6;
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_impl(&dword_2474C9000, v7, OS_LOG_TYPE_DEFAULT, "Updating most recent monthly achievement earned date: %@, for friend: %@", (uint8_t *)&v10, 0x16u);
  }
  id v8 = *(void **)(a1 + 32);
  id v9 = [v5 UUIDString];
  [v8 _setMostRecentMonthlyAchievementEarnedDate:v6 forFriendWithUUID:v9];
}

- (id)_queue_selectGoalCompletionNotifications
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  ASLoggingInitialize();
  id v3 = (os_log_t *)MEMORY[0x263F23AD0];
  id v4 = *MEMORY[0x263F23AD0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AD0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2474C9000, v4, OS_LOG_TYPE_DEFAULT, "Selecting goal completion snapshot notifications", buf, 2u);
  }
  id v5 = [(ASActivityDataNotificationManager *)self goalCompletionAnchor];
  ASLoggingInitialize();
  id v6 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v29 = v5;
    _os_log_impl(&dword_2474C9000, v6, OS_LOG_TYPE_DEFAULT, "Current goal completion anchor is %{public}@", buf, 0xCu);
  }
  id v7 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  id v8 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v9 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  databaseClient = self->_databaseClient;
  id v26 = 0;
  id v27 = v5;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __77__ASActivityDataNotificationManager__queue_selectGoalCompletionNotifications__block_invoke;
  v22[3] = &unk_2652172F0;
  v22[4] = self;
  id v11 = v8;
  id v23 = v11;
  id v12 = v9;
  id v24 = v12;
  id v13 = v7;
  id v25 = v13;
  BOOL v14 = [(ASDatabaseClient *)databaseClient enumerateActivitySharingSnapshotsWithPredicate:0 anchor:&v27 error:&v26 handler:v22];
  id v15 = v27;

  id v16 = v26;
  if (v14)
  {
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __77__ASActivityDataNotificationManager__queue_selectGoalCompletionNotifications__block_invoke_329;
    v21[3] = &unk_265217318;
    v21[4] = self;
    [v12 enumerateKeysAndObjectsUsingBlock:v21];
    [(ASActivityDataNotificationManager *)self setGoalCompletionAnchor:v15];
    ASLoggingInitialize();
    id v17 = *v3;
    if (!os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    *(_DWORD *)buf = 138543362;
    id v29 = v15;
    BOOL v18 = "GoalCompletionAnchor set to: %{public}@";
  }
  else
  {
    ASLoggingInitialize();
    id v17 = *v3;
    if (!os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    *(_DWORD *)buf = 138543362;
    id v29 = v16;
    BOOL v18 = "Error: %{public}@ fetching snapshots";
  }
  _os_log_impl(&dword_2474C9000, v17, OS_LOG_TYPE_DEFAULT, v18, buf, 0xCu);
LABEL_11:
  id v19 = (void *)[v13 copy];

  return v19;
}

uint64_t __77__ASActivityDataNotificationManager__queue_selectGoalCompletionNotifications__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 72));
  id v5 = [v3 friendUUID];
  id v6 = [WeakRetained friendWithUUID:v5];

  ASLoggingInitialize();
  id v7 = (os_log_t *)MEMORY[0x263F23AD0];
  id v8 = (void *)*MEMORY[0x263F23AD0];
  id v9 = *MEMORY[0x263F23AD0];
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = v8;
      id v11 = [v6 UUID];
      uint64_t v12 = [v3 snapshotIndex];
      id v13 = [v3 snapshotUploadedDate];
      int v35 = 138543874;
      id v36 = v11;
      __int16 v37 = 2048;
      uint64_t v38 = v12;
      __int16 v39 = 2114;
      v40 = v13;
      _os_log_impl(&dword_2474C9000, v10, OS_LOG_TYPE_DEFAULT, "Evaluating new snapshot with friend UUID %{public}@, index: %lld, date: %{public}@", (uint8_t *)&v35, 0x20u);
    }
    if (ASAllGoalsMetForSnapshot())
    {
      BOOL v14 = *(void **)(a1 + 40);
      id v15 = [v6 UUID];
      id v16 = [v14 objectForKeyedSubscript:v15];

      if (!v16)
      {
        id v17 = *(void **)(a1 + 32);
        BOOL v18 = [v6 UUID];
        id v19 = [v18 UUIDString];
        id v16 = [v17 _mostRecentGoalCompletedSnapshotIndexForFriendWithUUID:v19];

        id v20 = *(void **)(a1 + 40);
        uint64_t v21 = [v6 UUID];
        [v20 setObject:v16 forKeyedSubscript:v21];
      }
      ASLoggingInitialize();
      __int16 v22 = *v7;
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
      {
        int v35 = 138412290;
        id v36 = v16;
        _os_log_impl(&dword_2474C9000, v22, OS_LOG_TYPE_DEFAULT, "Last known goal completion index: %@", (uint8_t *)&v35, 0xCu);
      }
      uint64_t v23 = [v3 snapshotIndex];
      if (v23 <= [v16 integerValue])
      {
        ASLoggingInitialize();
        id v33 = *v7;
        if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v35) = 0;
          _os_log_impl(&dword_2474C9000, v33, OS_LOG_TYPE_DEFAULT, "Last known snapshot is newer, skip this one", (uint8_t *)&v35, 2u);
        }
      }
      else
      {
        id v24 = *(void **)(a1 + 48);
        id v25 = [v6 UUID];
        id v26 = [v24 objectForKeyedSubscript:v25];

        uint64_t v27 = [v3 snapshotIndex];
        if (v27 > [v26 integerValue])
        {
          os_log_t v28 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v3, "snapshotIndex"));
          id v29 = *(void **)(a1 + 48);
          uint64_t v30 = [v6 UUID];
          [v29 setObject:v28 forKeyedSubscript:v30];
        }
        id v31 = objc_opt_new();
        [v31 setFriend:v6];
        [v31 setSample:v3];
        [*(id *)(a1 + 56) addObject:v31];
      }
    }
    else
    {
      ASLoggingInitialize();
      id v32 = *v7;
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v35) = 0;
        _os_log_impl(&dword_2474C9000, v32, OS_LOG_TYPE_DEFAULT, "Snapshot doesn't represent goal completion, skipping", (uint8_t *)&v35, 2u);
      }
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    __77__ASActivityDataNotificationManager__queue_selectGoalCompletionNotifications__block_invoke_cold_1(v8, v3);
  }

  return 1;
}

void __77__ASActivityDataNotificationManager__queue_selectGoalCompletionNotifications__block_invoke_329(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  ASLoggingInitialize();
  id v7 = *MEMORY[0x263F23AD0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AD0], OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412546;
    id v11 = v6;
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_impl(&dword_2474C9000, v7, OS_LOG_TYPE_DEFAULT, "Updating most recent goal completion snapshot index: %@, for friend: %@", (uint8_t *)&v10, 0x16u);
  }
  id v8 = *(void **)(a1 + 32);
  id v9 = [v5 UUIDString];
  [v8 _setMostRecentGoalCompletedSnapshotIndex:v6 forFriendWithUUID:v9];
}

- (void)_notifyAboutWorkoutsDetectionIfRequired:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF8F0] currentCalendar];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  id WeakRetained = v6;
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v6);
        }
        __int16 v12 = [*(id *)(*((void *)&v18 + 1) + 8 * i) endDate];
        char v13 = [v5 isDateInToday:v12];
        int v14 = [v5 isDateInYesterday:v12];
        if ((v13 & 1) != 0 || v14)
        {
          ASLoggingInitialize();
          id v15 = *MEMORY[0x263F23AD0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AD0], OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)id v17 = 0;
            _os_log_impl(&dword_2474C9000, v15, OS_LOG_TYPE_DEFAULT, "ActivityDataNotificationManager: at least one workout is in today or yesterday, request data push", v17, 2u);
          }

          id WeakRetained = objc_loadWeakRetained((id *)&self->_periodicUpdateManager);
          id v16 = ASCloudKitGroupUserActionImplicit();
          [WeakRetained requestImmediateUpdateWithCloudKitGroup:v16 completion:0];

          goto LABEL_14;
        }
      }
      uint64_t v9 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v9) {
        continue;
      }
      break;
    }
    id WeakRetained = v6;
  }
LABEL_14:
}

- (id)_nanoUserDefaultsDomainKeyForFriendWithUUID:(id)a3 keyTypeString:(id)a4
{
  return (id)[NSString stringWithFormat:@"%@_%@", a3, a4];
}

- (id)_nanoUserDefaultsDomain
{
  return [(ASDatabaseClient *)self->_databaseClient makeASKeyValueDomainWithDomainName:@"ActivitySharing.Notifications.Synced" category:4];
}

- (ASActivityDataNotificationRulesEngine)notificationRulesEngine
{
  return self->_notificationRulesEngine;
}

- (void)setNotificationRulesEngine:(id)a3
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

- (ASActivityDataManager)activityDataManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activityDataManager);
  return (ASActivityDataManager *)WeakRetained;
}

- (void)setActivityDataManager:(id)a3
{
}

- (ASContactsManager)contactsManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contactsManager);
  return (ASContactsManager *)WeakRetained;
}

- (void)setContactsManager:(id)a3
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

- (ASActivityDataBulletinManager)activityDataBulletinManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activityDataBulletinManager);
  return (ASActivityDataBulletinManager *)WeakRetained;
}

- (void)setActivityDataBulletinManager:(id)a3
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

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_periodicUpdateManager);
  objc_destroyWeak((id *)&self->_activityDataBulletinManager);
  objc_destroyWeak((id *)&self->_friendListManager);
  objc_destroyWeak((id *)&self->_contactsManager);
  objc_destroyWeak((id *)&self->_activityDataManager);
  objc_destroyWeak((id *)&self->_cloudKitManager);
  objc_storeStrong((id *)&self->_notificationRulesEngine, 0);
  objc_destroyWeak((id *)&self->_achievementStore);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_databaseClient, 0);
}

- (void)_mostRecentWorkoutCompletionDateForFriendWithUUID:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_0(&dword_2474C9000, v0, v1, "Error: %{public}@ retrieving workout completion data from key value domain for friendUUID: %{public}@.");
}

- (void)_mostRecentAchievementEarnedDateForFriendWithUUID:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_0(&dword_2474C9000, v0, v1, "Error: %{public}@ retrieving achievement earned data from key value domain for friendUUID: %{public}@.");
}

- (void)_setMostRecentAchievementEarnedDate:(os_log_t)log forFriendWithUUID:.cold.1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_2474C9000, log, OS_LOG_TYPE_ERROR, "Achievement earned date is later than current time, not updating defaults", v1, 2u);
}

- (void)_mostRecentMonthlyAchievementEarnedDateForFriendWithUUID:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_0(&dword_2474C9000, v0, v1, "Error: %{public}@ retrieving monthly achievement earned data from key value domain for friendUUID: %{public}@.");
}

- (void)_mostRecentGoalCompletedSnapshotIndexForFriendWithUUID:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_0(&dword_2474C9000, v0, v1, "Error: %{public}@ retrieving goal completion data from key value domain for friendUUID: %{public}@.");
}

- (void)workoutAnchor
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_0(&dword_2474C9000, v0, v1, "Error: %{public}@ retrieving workout anchor data from key value domain. anchor: %{public}@");
}

- (void)setWorkoutAnchor:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_0(&dword_2474C9000, v0, v1, "Error:%{public}@ saving workout anchor data into key value domain. anchor: %{public}@");
}

- (void)achievementAnchor
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_0(&dword_2474C9000, v0, v1, "Error: %{public}@ retrieving achievement anchor data from key value domain. anchor: %{public}@");
}

- (void)setAchievementAnchor:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_0(&dword_2474C9000, v0, v1, "Error: %{public}@ saving achievement anchor data into key value domain. anchor: %{public}@");
}

- (void)goalCompletionAnchor
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_0(&dword_2474C9000, v0, v1, "Error: %{public}@ retrieving goal completion anchor data from key value domain. anchor: %{public}@");
}

- (void)setGoalCompletionAnchor:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_0(&dword_2474C9000, v0, v1, "Error: %{public}@ saving goal completion anchor data into key value domain. anchor: %{public}@");
}

void __70__ASActivityDataNotificationManager__queue_selectWorkoutNotifications__block_invoke_cold_1(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = [a2 friendUUID];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_2(&dword_2474C9000, v5, v6, "Error: Failed to find friend with UUID %{public}@ for completed workout", v7, v8, v9, v10, v11);
}

void __74__ASActivityDataNotificationManager__queue_selectAchievementNotifications__block_invoke_cold_1(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = [a2 friendUUID];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_2(&dword_2474C9000, v5, v6, "Error: Failed to find friend with UUID %{public}@ for achievement", v7, v8, v9, v10, v11);
}

void __74__ASActivityDataNotificationManager__queue_selectAchievementNotifications__block_invoke_cold_2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_2474C9000, v0, OS_LOG_TYPE_ERROR, "Unable to find achievement matching achievement: %@", v1, 0xCu);
}

void __74__ASActivityDataNotificationManager__queue_selectAchievementNotifications__block_invoke_cold_3(void *a1, void *a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v5 = a1;
  uint64_t v6 = [a2 templateUniqueName];
  OUTLINED_FUNCTION_1_0();
  __int16 v8 = 2112;
  uint64_t v9 = a3;
  _os_log_error_impl(&dword_2474C9000, v5, OS_LOG_TYPE_ERROR, "Error fetching ephemeral Achievement for template %@: %@", v7, 0x16u);
}

void __77__ASActivityDataNotificationManager__queue_selectGoalCompletionNotifications__block_invoke_cold_1(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = [a2 friendUUID];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_2(&dword_2474C9000, v5, v6, "Error: Failed to find friend with UUID %{public}@ for goal completion", v7, v8, v9, v10, v11);
}

@end