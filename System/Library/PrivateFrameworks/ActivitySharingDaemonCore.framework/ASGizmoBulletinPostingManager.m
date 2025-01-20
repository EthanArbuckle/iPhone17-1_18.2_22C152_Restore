@interface ASGizmoBulletinPostingManager
- (ASBulletinPostingManagerDelegate)delegate;
- (ASGizmoBulletinPostingManager)initWithDatabaseClient:(id)a3;
- (BOOL)_isPostingAllowed;
- (id)_batchedNotificationRequestsFromCodableBulletins:(id)a3;
- (id)_batchedNotificationRequestsFromCodableBulletins:(id)a3 withAdditions:(id)a4;
- (id)_notificationRequestFromCodableBulletin:(id)a3;
- (id)_notificationRequestFromCodableBulletin:(id)a3 withAdditions:(id)a4;
- (id)recordIDForFriendUUID:(id)a3;
- (id)topicIdentifiers;
- (void)_postNotificationRequest:(id)a3;
- (void)_postQueuedNotificationRequestsIfPossible;
- (void)_queue_postNotificationRequests:(id)a3;
- (void)_withdrawNotificationRequestsWithIdentifiers:(id)a3;
- (void)activitySharingManagerReady:(id)a3;
- (void)dealloc;
- (void)enqueueBulletins:(id)a3 withPostingSyle:(int64_t)a4;
- (void)handleNotificationResponse:(id)a3 completion:(id)a4;
- (void)postFakeBulletins:(id)a3;
- (void)postNotificationRequest:(id)a3;
- (void)registerNotificationCategories:(id)a3;
- (void)removeCompetitionNotificationsForFriendUUID:(id)a3;
- (void)removeNotificationWithIdentifier:(id)a3;
- (void)removeRecordIDForFriendUUID:(id)a3;
- (void)setDelegate:(id)a3;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation ASGizmoBulletinPostingManager

- (ASGizmoBulletinPostingManager)initWithDatabaseClient:(id)a3
{
  id v5 = a3;
  v22.receiver = self;
  v22.super_class = (Class)ASGizmoBulletinPostingManager;
  v6 = [(ASGizmoBulletinPostingManager *)&v22 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_databaseClient, a3);
    uint64_t v8 = HKCreateSerialDispatchQueue();
    notificationQueue = v7->_notificationQueue;
    v7->_notificationQueue = (OS_dispatch_queue *)v8;

    v10 = (ASBulletinStore *)objc_alloc_init(MEMORY[0x263F23B00]);
    notificationStore = v7->_notificationStore;
    v7->_notificationStore = v10;

    uint64_t v12 = [MEMORY[0x263EFFA08] set];
    notificationRequests = v7->_notificationRequests;
    v7->_notificationRequests = (NSSet *)v12;

    v14 = objc_alloc_init(ASOnWristMonitor);
    onWristMonitor = v7->_onWristMonitor;
    v7->_onWristMonitor = v14;

    [(ASOnWristMonitor *)v7->_onWristMonitor setDelegate:v7];
    uint64_t v16 = [objc_alloc(MEMORY[0x263F1DFB0]) initWithBundleIdentifier:@"com.apple.ActivityMonitorApp"];
    userNotificationCenter = v7->_userNotificationCenter;
    v7->_userNotificationCenter = (UNUserNotificationCenter *)v16;

    v18 = v7->_notificationQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __56__ASGizmoBulletinPostingManager_initWithDatabaseClient___block_invoke;
    block[3] = &unk_2652157F0;
    v21 = v7;
    dispatch_async(v18, block);
  }
  return v7;
}

uint64_t __56__ASGizmoBulletinPostingManager_initWithDatabaseClient___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 24) loadBulletins];
  v2 = *(void **)(*(void *)(a1 + 32) + 24);
  return [v2 removeBulletinsOlderThanInterval:864000.0];
}

- (void)activitySharingManagerReady:(id)a3
{
  [(ASDatabaseClient *)self->_databaseClient addNanoAlertSuppressionObserver:self];
  [(ASDatabaseClient *)self->_databaseClient addProtectedDataObserver:self];
  [(UNUserNotificationCenter *)self->_userNotificationCenter setDelegate:self];
  userNotificationCenter = self->_userNotificationCenter;
  [(UNUserNotificationCenter *)userNotificationCenter setWantsNotificationResponsesDelivered];
}

- (void)dealloc
{
  [(ASOnWristMonitor *)self->_onWristMonitor setDelegate:0];
  [(ASDatabaseClient *)self->_databaseClient removeNanoAlertSuppressionObserver:self];
  [(ASDatabaseClient *)self->_databaseClient removeProtectedDataObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)ASGizmoBulletinPostingManager;
  [(ASGizmoBulletinPostingManager *)&v3 dealloc];
}

- (id)recordIDForFriendUUID:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_friendUUIDToCompetitionRequestNotificationRequestRecordMap objectForKeyedSubscript:a3];
}

- (void)removeRecordIDForFriendUUID:(id)a3
{
}

- (BOOL)_isPostingAllowed
{
  id v2 = objc_alloc(MEMORY[0x263EFFA40]);
  objc_super v3 = (void *)[v2 initWithSuiteName:*MEMORY[0x263F23CC8]];
  v4 = [v3 objectForKey:*MEMORY[0x263F23D58]];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v5 = [v4 BOOLValue];
  }
  else {
    char v5 = 1;
  }

  return v5;
}

- (id)_batchedNotificationRequestsFromCodableBulletins:(id)a3
{
  return [(ASGizmoBulletinPostingManager *)self _batchedNotificationRequestsFromCodableBulletins:a3 withAdditions:MEMORY[0x263EFFA78]];
}

- (id)_batchedNotificationRequestsFromCodableBulletins:(id)a3 withAdditions:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  ASLoggingInitialize();
  uint64_t v8 = (void *)*MEMORY[0x263F23AD0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AD0], OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    *(_DWORD *)buf = 134217984;
    uint64_t v26 = [v6 count];
    _os_log_impl(&dword_2474C9000, v9, OS_LOG_TYPE_DEFAULT, "Batching %ld notifications", buf, 0xCu);
  }
  v10 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v11 = [MEMORY[0x263F08C38] UUID];
  uint64_t v12 = [v11 UUIDString];

  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __96__ASGizmoBulletinPostingManager__batchedNotificationRequestsFromCodableBulletins_withAdditions___block_invoke;
  v19[3] = &unk_265217510;
  id v20 = v7;
  id v21 = v12;
  id v22 = v6;
  id v13 = v10;
  id v23 = v13;
  v24 = self;
  id v14 = v6;
  id v15 = v12;
  id v16 = v7;
  [v14 enumerateObjectsUsingBlock:v19];
  id v17 = v13;

  return v17;
}

void __96__ASGizmoBulletinPostingManager__batchedNotificationRequestsFromCodableBulletins_withAdditions___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v12 = a2;
  char v5 = (void *)[*(id *)(a1 + 32) mutableCopy];
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = +[ASNotificationSentinelKeys awaitingSentinelKey];
  [v5 setObject:v6 forKeyedSubscript:v7];

  if ([*(id *)(a1 + 48) count] - 1 == a3)
  {
    uint64_t v8 = *(void *)(a1 + 40);
    v9 = +[ASNotificationSentinelKeys sentinelKey];
    [v5 setObject:v8 forKeyedSubscript:v9];
  }
  v10 = *(void **)(a1 + 56);
  v11 = [*(id *)(a1 + 64) _notificationRequestFromCodableBulletin:v12 withAdditions:v5];
  [v10 addObject:v11];
}

- (id)_notificationRequestFromCodableBulletin:(id)a3
{
  return [(ASGizmoBulletinPostingManager *)self _notificationRequestFromCodableBulletin:a3 withAdditions:MEMORY[0x263EFFA78]];
}

- (id)_notificationRequestFromCodableBulletin:(id)a3 withAdditions:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x263F1DEF0]);
  [v7 setCategoryIdentifier:*MEMORY[0x263F23C68]];
  uint64_t v8 = [MEMORY[0x263EFF9A0] dictionary];
  unint64_t v9 = [v5 type];
  v10 = [NSNumber numberWithInteger:v9];
  [v8 setObject:v10 forKeyedSubscript:*MEMORY[0x263F23D48]];

  v11 = [v5 friendListData];
  [v8 setObject:v11 forKeyedSubscript:*MEMORY[0x263F23D28]];

  id v12 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v5, "competitionStage"));
  [v8 setObject:v12 forKeyedSubscript:*MEMORY[0x263F23D20]];

  id v13 = [v5 achievementData];

  if (v13)
  {
    id v14 = [v5 achievementData];
    [v8 setObject:v14 forKeyedSubscript:*MEMORY[0x263F23D10]];
  }
  id v15 = [v5 workoutData];

  if (v15)
  {
    id v16 = [v5 workoutData];
    [v8 setObject:v16 forKeyedSubscript:*MEMORY[0x263F23D50]];
  }
  id v17 = [v5 snapshotData];

  if (v17)
  {
    v18 = [v5 snapshotData];
    [v8 setObject:v18 forKeyedSubscript:*MEMORY[0x263F23D18]];
  }
  [v8 addEntriesFromDictionary:v6];
  v19 = [MEMORY[0x263EFF910] date];
  id v20 = ExpirationDateForBulletinTypeAndPublishDate(v9, v19);

  if (v20) {
    [v7 setExpirationDate:v20];
  }
  id v21 = [MEMORY[0x263F1DF00] soundWithAlertType:19];
  [v21 setAlertTopic:*MEMORY[0x263F7FCB0]];
  [v7 setSound:v21];
  id v22 = [v5 title];
  [v7 setTitle:v22];

  id v23 = ThreadIdentifierForBulletinType(v9);
  [v7 setThreadIdentifier:v23];

  [v7 setUserInfo:v8];
  v24 = (void *)MEMORY[0x263F1DF48];
  v25 = [MEMORY[0x263F08C38] UUID];
  uint64_t v26 = [v25 UUIDString];
  uint64_t v27 = [v24 requestWithIdentifier:v26 content:v7 trigger:0];

  v28 = [v5 friendUUID];
  v29 = +[ASFriendNotificationContainer containerWithNotificationRequest:v27 friendUUID:v28 bulletinType:v9];

  return v29;
}

- (void)postNotificationRequest:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  ASLoggingInitialize();
  id v5 = (void *)*MEMORY[0x263F23AD0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AD0], OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    id v7 = [v4 identifier];
    int v8 = 138412290;
    unint64_t v9 = v7;
    _os_log_impl(&dword_2474C9000, v6, OS_LOG_TYPE_DEFAULT, "Adding notification request with identifier %@", (uint8_t *)&v8, 0xCu);
  }
  [(ASGizmoBulletinPostingManager *)self _postNotificationRequest:v4];
}

- (void)enqueueBulletins:(id)a3 withPostingSyle:(int64_t)a4
{
  id v6 = a3;
  id v7 = v6;
  if (a4)
  {
    [(ASGizmoBulletinPostingManager *)self postFakeBulletins:v6];
  }
  else
  {
    notificationQueue = self->_notificationQueue;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __66__ASGizmoBulletinPostingManager_enqueueBulletins_withPostingSyle___block_invoke;
    v9[3] = &unk_2652157C8;
    v9[4] = self;
    id v10 = v6;
    dispatch_async(notificationQueue, v9);
  }
}

uint64_t __66__ASGizmoBulletinPostingManager_enqueueBulletins_withPostingSyle___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 24) removeBulletinsOlderThanInterval:864000.0];
  id v2 = *(void **)(*(void *)(a1 + 32) + 24);
  objc_super v3 = [*(id *)(a1 + 40) allObjects];
  [v2 addBulletins:v3];

  id v4 = *(void **)(a1 + 32);
  return [v4 _postQueuedNotificationRequestsIfPossible];
}

- (void)removeCompetitionNotificationsForFriendUUID:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 UUIDString];
  id v6 = [(ASGizmoBulletinPostingManager *)self recordIDForFriendUUID:v5];
  if (v6)
  {
    ASLoggingInitialize();
    id v7 = *MEMORY[0x263F23AD0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AD0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v14 = v4;
      _os_log_impl(&dword_2474C9000, v7, OS_LOG_TYPE_DEFAULT, "Found competition request bulletin record to withdraw for friend: %{public}@", buf, 0xCu);
    }
    id v12 = v6;
    int v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v12 count:1];
    [(ASGizmoBulletinPostingManager *)self _withdrawNotificationRequestsWithIdentifiers:v8];

    [(ASGizmoBulletinPostingManager *)self removeRecordIDForFriendUUID:v5];
  }
  else
  {
    notificationQueue = self->_notificationQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __77__ASGizmoBulletinPostingManager_removeCompetitionNotificationsForFriendUUID___block_invoke;
    block[3] = &unk_2652157C8;
    void block[4] = self;
    id v11 = v5;
    dispatch_async(notificationQueue, block);
  }
}

void __77__ASGizmoBulletinPostingManager_removeCompetitionNotificationsForFriendUUID___block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 24);
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __77__ASGizmoBulletinPostingManager_removeCompetitionNotificationsForFriendUUID___block_invoke_2;
  v2[3] = &unk_265217538;
  id v3 = *(id *)(a1 + 40);
  [v1 removeBulletinsMatchingCriteria:v2];
}

uint64_t __77__ASGizmoBulletinPostingManager_removeCompetitionNotificationsForFriendUUID___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 type] == 5)
  {
    id v4 = [v3 friendUUID];
    uint64_t v5 = [v4 isEqualToString:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (void)removeNotificationWithIdentifier:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  ASLoggingInitialize();
  uint64_t v5 = *MEMORY[0x263F23AD0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AD0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v9 = v4;
    _os_log_impl(&dword_2474C9000, v5, OS_LOG_TYPE_DEFAULT, "Withdrawing bulletin with identifier %@", buf, 0xCu);
  }
  id v7 = v4;
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v7 count:1];
  [(ASGizmoBulletinPostingManager *)self _withdrawNotificationRequestsWithIdentifiers:v6];
}

- (void)registerNotificationCategories:(id)a3
{
  id v4 = a3;
  userNotificationCenter = self->_userNotificationCenter;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __64__ASGizmoBulletinPostingManager_registerNotificationCategories___block_invoke;
  v7[3] = &unk_2652169B0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  [(UNUserNotificationCenter *)userNotificationCenter getNotificationCategoriesWithCompletionHandler:v7];
}

void __64__ASGizmoBulletinPostingManager_registerNotificationCategories___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 setByAddingObjectsFromSet:*(void *)(a1 + 32)];
  [*(id *)(*(void *)(a1 + 40) + 64) setNotificationCategories:v3];
}

- (id)topicIdentifiers
{
  return (id)MEMORY[0x263EFFA68];
}

- (void)_postQueuedNotificationRequestsIfPossible
{
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  char v19 = 0;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  char v17 = 0;
  id v3 = dispatch_group_create();
  dispatch_group_enter(v3);
  databaseClient = self->_databaseClient;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __74__ASGizmoBulletinPostingManager__postQueuedNotificationRequestsIfPossible__block_invoke;
  v13[3] = &unk_265216300;
  uint64_t v15 = v18;
  uint64_t v5 = v3;
  id v14 = v5;
  [(ASDatabaseClient *)databaseClient isActivityAlertSuppressionEnabledWithCompletion:v13];
  dispatch_group_enter(v5);
  onWristMonitor = self->_onWristMonitor;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __74__ASGizmoBulletinPostingManager__postQueuedNotificationRequestsIfPossible__block_invoke_2;
  v10[3] = &unk_265216300;
  id v12 = v16;
  id v7 = v5;
  id v11 = v7;
  [(ASOnWristMonitor *)onWristMonitor getWristState:v10];
  notificationQueue = self->_notificationQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74__ASGizmoBulletinPostingManager__postQueuedNotificationRequestsIfPossible__block_invoke_3;
  block[3] = &unk_2652175A0;
  void block[4] = self;
  void block[5] = v18;
  block[6] = v16;
  dispatch_group_notify(v7, notificationQueue, block);

  _Block_object_dispose(v16, 8);
  _Block_object_dispose(v18, 8);
}

void __74__ASGizmoBulletinPostingManager__postQueuedNotificationRequestsIfPossible__block_invoke(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __74__ASGizmoBulletinPostingManager__postQueuedNotificationRequestsIfPossible__block_invoke_2(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __74__ASGizmoBulletinPostingManager__postQueuedNotificationRequestsIfPossible__block_invoke_3(uint64_t a1)
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  int v2 = [*(id *)(*(void *)(a1 + 32) + 8) isProtectedDataAvailable];
  int v3 = v2;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    char v4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) ? v2 : 0;
    if (v4)
    {
      ASLoggingInitialize();
      uint64_t v5 = (os_log_t *)MEMORY[0x263F23AD0];
      id v6 = *MEMORY[0x263F23AD0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AD0], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2474C9000, v6, OS_LOG_TYPE_DEFAULT, "Posting queued notifications", buf, 2u);
      }
      id v7 = [*(id *)(*(void *)(a1 + 32) + 24) bulletins];
      id v8 = objc_msgSend(v7, "hk_filter:", &__block_literal_global_15);

      id v9 = [*(id *)(*(void *)(a1 + 32) + 24) bulletins];
      uint64_t v10 = objc_msgSend(v9, "hk_filter:", &__block_literal_global_311);

      ASLoggingInitialize();
      os_log_t v11 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
      {
        id v12 = v11;
        uint64_t v13 = [v8 count];
        *(_DWORD *)buf = 134217984;
        *(void *)v50 = v13;
        _os_log_impl(&dword_2474C9000, v12, OS_LOG_TYPE_DEFAULT, "Notifications to post: %ld", buf, 0xCu);
      }
      ASLoggingInitialize();
      os_log_t v14 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = v14;
        uint64_t v16 = [v10 count];
        *(_DWORD *)buf = 134217984;
        *(void *)v50 = v16;
        _os_log_impl(&dword_2474C9000, v15, OS_LOG_TYPE_DEFAULT, "Notifications to defer: %ld", buf, 0xCu);
      }
      if ([v8 count])
      {
        ASLoggingInitialize();
        char v17 = *v5;
        if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2474C9000, v17, OS_LOG_TYPE_DEFAULT, "Posting standard notifications, deferring important notifications", buf, 2u);
        }
        v18 = v10;
        uint64_t v10 = v8;
      }
      else
      {
        [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
        double v23 = v22 - *(double *)(*(void *)(a1 + 32) + 48);
        ASLoggingInitialize();
        v24 = *v5;
        BOOL v25 = os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT);
        if (v23 <= 300.0)
        {
          if (v25)
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_2474C9000, v24, OS_LOG_TYPE_DEFAULT, "Not allowing important notifications - not enough time has elapsed since previous deferral", buf, 2u);
          }
          v18 = v10;
          goto LABEL_36;
        }
        if (v25)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2474C9000, v24, OS_LOG_TYPE_DEFAULT, "No standard notifications to post, allowing important notifications", buf, 2u);
        }

        v18 = 0;
      }
      v42 = v10;
      v41 = objc_msgSend(v10, "hk_filter:", &__block_literal_global_314);
      uint64_t v26 = objc_msgSend(*(id *)(a1 + 32), "_batchedNotificationRequestsFromCodableBulletins:");
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      uint64_t v27 = [v26 countByEnumeratingWithState:&v44 objects:v48 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v45;
        do
        {
          for (uint64_t i = 0; i != v28; ++i)
          {
            if (*(void *)v45 != v29) {
              objc_enumerationMutation(v26);
            }
            v31 = *(void **)(*((void *)&v44 + 1) + 8 * i);
            if ([v31 notificationRequestType] == 5)
            {
              v32 = [v31 notificationRequest];
              v33 = [v32 identifier];
              v34 = *(void **)(*(void *)(a1 + 32) + 56);
              v35 = [v31 friendUUID];
              [v34 setObject:v33 forKeyedSubscript:v35];
            }
          }
          uint64_t v28 = [v26 countByEnumeratingWithState:&v44 objects:v48 count:16];
        }
        while (v28);
      }
      v36 = *(void **)(a1 + 32);
      v37 = objc_msgSend(v26, "hk_map:", &__block_literal_global_318_0);
      objc_msgSend(v36, "_queue_postNotificationRequests:", v37);

      [*(id *)(*(void *)(a1 + 32) + 24) removeAllBulletins];
      if ([v18 count])
      {
        ASLoggingInitialize();
        v38 = *MEMORY[0x263F23AD0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AD0], OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2474C9000, v38, OS_LOG_TYPE_DEFAULT, "At least one bulletin was deferred, scheduling another attempt", buf, 2u);
        }
        [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
        *(void *)(*(void *)(a1 + 32) + 48) = v39;
        [*(id *)(*(void *)(a1 + 32) + 24) addBulletins:v18];
        dispatch_time_t v40 = dispatch_time(0, 300000000000);
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __74__ASGizmoBulletinPostingManager__postQueuedNotificationRequestsIfPossible__block_invoke_319;
        block[3] = &unk_2652157F0;
        void block[4] = *(void *)(a1 + 32);
        dispatch_after(v40, MEMORY[0x263EF83A0], block);
      }

      id v8 = v42;
LABEL_36:

      return;
    }
  }
  ASLoggingInitialize();
  char v19 = *MEMORY[0x263F23AD0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AD0], OS_LOG_TYPE_DEFAULT))
  {
    int v20 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    int v21 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    *(_DWORD *)buf = 67109632;
    *(_DWORD *)v50 = v20;
    *(_WORD *)&v50[4] = 1024;
    *(_DWORD *)&v50[6] = v21;
    __int16 v51 = 1024;
    int v52 = v3;
    _os_log_impl(&dword_2474C9000, v19, OS_LOG_TYPE_DEFAULT, "Not posting queued notifications, isSuppressed=%{BOOL}d isOnWrist=%{BOOL}d protectedDataAvailable=%{BOOL}d", buf, 0x14u);
  }
}

uint64_t __74__ASGizmoBulletinPostingManager__postQueuedNotificationRequestsIfPossible__block_invoke_308(uint64_t a1, void *a2)
{
  int v2 = ThreadIdentifierForBulletinType([a2 type]);
  uint64_t v3 = [v2 isEqualToString:@"com.apple.ActivitySharing.default.thread"];

  return v3;
}

uint64_t __74__ASGizmoBulletinPostingManager__postQueuedNotificationRequestsIfPossible__block_invoke_2_309(uint64_t a1, void *a2)
{
  int v2 = ThreadIdentifierForBulletinType([a2 type]);
  if ([v2 isEqualToString:@"com.apple.ActivitySharing.competitions.thread"]) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = [v2 isEqualToString:@"com.apple.ActivityMonitorApp.challenges.thread"];
  }

  return v3;
}

uint64_t __74__ASGizmoBulletinPostingManager__postQueuedNotificationRequestsIfPossible__block_invoke_312(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v2 = a2;
  unint64_t v3 = [v2 type];
  char v4 = (void *)MEMORY[0x263EFF910];
  [v2 timestamp];
  uint64_t v5 = objc_msgSend(v4, "dateWithTimeIntervalSinceReferenceDate:");
  id v6 = ExpirationDateForBulletinTypeAndPublishDate(v3, v5);
  ASLoggingInitialize();
  id v7 = (os_log_t *)MEMORY[0x263F23AD0];
  id v8 = *MEMORY[0x263F23AD0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AD0], OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412290;
    unint64_t v18 = (unint64_t)v5;
    _os_log_impl(&dword_2474C9000, v8, OS_LOG_TYPE_DEFAULT, "Publish date is %@", (uint8_t *)&v17, 0xCu);
  }
  if (v6
    && ([MEMORY[0x263EFF910] timeIntervalSinceReferenceDate],
        double v10 = v9,
        [v6 timeIntervalSinceReferenceDate],
        v10 > v11))
  {
    ASLoggingInitialize();
    os_log_t v14 = *v7;
    uint64_t v12 = 0;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = v14;
      uint64_t v16 = [v2 title];
      int v17 = 134218242;
      unint64_t v18 = v3;
      __int16 v19 = 2112;
      int v20 = v16;
      _os_log_impl(&dword_2474C9000, v15, OS_LOG_TYPE_DEFAULT, "Dropping queued bulletin because it's been queued for too long: %lu / %@", (uint8_t *)&v17, 0x16u);

      uint64_t v12 = 0;
    }
  }
  else
  {
    uint64_t v12 = 1;
  }

  return v12;
}

uint64_t __74__ASGizmoBulletinPostingManager__postQueuedNotificationRequestsIfPossible__block_invoke_315(uint64_t a1, void *a2)
{
  return [a2 notificationRequest];
}

uint64_t __74__ASGizmoBulletinPostingManager__postQueuedNotificationRequestsIfPossible__block_invoke_319(uint64_t a1)
{
  ASLoggingInitialize();
  id v2 = *MEMORY[0x263F23AD0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AD0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)char v4 = 0;
    _os_log_impl(&dword_2474C9000, v2, OS_LOG_TYPE_DEFAULT, "Deferred bulletin dispatch timer fired", v4, 2u);
  }
  return [*(id *)(a1 + 32) _postQueuedNotificationRequestsIfPossible];
}

- (void)_queue_postNotificationRequests:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  ASLoggingInitialize();
  uint64_t v5 = *MEMORY[0x263F23AD0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AD0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2474C9000, v5, OS_LOG_TYPE_DEFAULT, "GizmoBulletinPostingManager queue post notification requests", buf, 2u);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_notificationQueue);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        -[ASGizmoBulletinPostingManager _postNotificationRequest:](self, "_postNotificationRequest:", *(void *)(*((void *)&v13 + 1) + 8 * v10++), (void)v13);
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v8);
  }

  double v11 = [(NSSet *)self->_notificationRequests setByAddingObjectsFromArray:v6];
  notificationRequests = self->_notificationRequests;
  self->_notificationRequests = v11;
}

- (void)_postNotificationRequest:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  if ([(ASGizmoBulletinPostingManager *)self _isPostingAllowed])
  {
    userNotificationCenter = self->_userNotificationCenter;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __58__ASGizmoBulletinPostingManager__postNotificationRequest___block_invoke;
    v7[3] = &unk_2652169D8;
    objc_copyWeak(&v8, &location);
    [(UNUserNotificationCenter *)userNotificationCenter addNotificationRequest:v4 withCompletionHandler:v7];
    objc_destroyWeak(&v8);
  }
  else
  {
    ASLoggingInitialize();
    id v6 = *MEMORY[0x263F23AD0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AD0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2474C9000, v6, OS_LOG_TYPE_DEFAULT, "Activity sharing notifications disabled in settings", buf, 2u);
    }
  }
  objc_destroyWeak(&location);
}

void __58__ASGizmoBulletinPostingManager__postNotificationRequest___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    ASLoggingInitialize();
    id v4 = (void *)*MEMORY[0x263F23AD0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AD0], OS_LOG_TYPE_ERROR)) {
      __58__ASGizmoBulletinPostingManager__postNotificationRequest___block_invoke_cold_1(a1, v4, (uint64_t)v3);
    }
  }
}

- (void)_withdrawNotificationRequestsWithIdentifiers:(id)a3
{
}

- (void)postFakeBulletins:(id)a3
{
  v15[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  ASLoggingInitialize();
  uint64_t v5 = *MEMORY[0x263F23AD0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AD0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2474C9000, v5, OS_LOG_TYPE_DEFAULT, "GizmoBulletinPostingManager post fake notification requests", buf, 2u);
  }
  id v6 = [v4 allObjects];

  uint64_t v14 = *MEMORY[0x263F23D38];
  v15[0] = MEMORY[0x263EFFA88];
  uint64_t v7 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
  id v8 = [(ASGizmoBulletinPostingManager *)self _batchedNotificationRequestsFromCodableBulletins:v6 withAdditions:v7];

  notificationQueue = self->_notificationQueue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __51__ASGizmoBulletinPostingManager_postFakeBulletins___block_invoke;
  v11[3] = &unk_2652157C8;
  v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  dispatch_async(notificationQueue, v11);
}

void __51__ASGizmoBulletinPostingManager_postFakeBulletins___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "hk_map:", &__block_literal_global_323_0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_queue_postNotificationRequests:", v2);
}

uint64_t __51__ASGizmoBulletinPostingManager_postFakeBulletins___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 notificationRequest];
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  ASLoggingInitialize();
  uint64_t v9 = *MEMORY[0x263F23AD0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AD0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v20 = v7;
    _os_log_impl(&dword_2474C9000, v9, OS_LOG_TYPE_DEFAULT, "GizmoBulletinPostingManager received notification response: %{public}@", buf, 0xCu);
  }
  id v10 = [v7 actionIdentifier];
  double v11 = [v7 notification];
  id v12 = [v11 request];
  long long v13 = [v12 content];
  uint64_t v14 = [v13 userInfo];

  long long v15 = (void *)[objc_alloc(MEMORY[0x263F23C10]) initWithActionIdentifier:v10 userInfo:v14];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __109__ASGizmoBulletinPostingManager_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke;
  v17[3] = &unk_265216718;
  id v18 = v8;
  id v16 = v8;
  [(ASGizmoBulletinPostingManager *)self handleNotificationResponse:v15 completion:v17];
}

uint64_t __109__ASGizmoBulletinPostingManager_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)handleNotificationResponse:(id)a3 completion:(id)a4
{
  p_delegate = &self->_delegate;
  uint64_t v9 = (void (**)(id, uint64_t, void))a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained bulletinPostingManager:self didReceiveNotificationResponse:v7];

  v9[2](v9, 1, 0);
}

- (ASBulletinPostingManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ASBulletinPostingManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_userNotificationCenter, 0);
  objc_storeStrong((id *)&self->_friendUUIDToCompetitionRequestNotificationRequestRecordMap, 0);
  objc_storeStrong((id *)&self->_onWristMonitor, 0);
  objc_storeStrong((id *)&self->_notificationRequests, 0);
  objc_storeStrong((id *)&self->_notificationStore, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_databaseClient, 0);
}

void __58__ASGizmoBulletinPostingManager__postNotificationRequest___block_invoke_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = (id *)(a1 + 32);
  uint64_t v5 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  int v8 = 138543618;
  id v9 = (id)objc_opt_class();
  __int16 v10 = 2114;
  uint64_t v11 = a3;
  id v7 = v9;
  _os_log_error_impl(&dword_2474C9000, v5, OS_LOG_TYPE_ERROR, "%{public}@ error requesting notification request %{public}@", (uint8_t *)&v8, 0x16u);
}

@end