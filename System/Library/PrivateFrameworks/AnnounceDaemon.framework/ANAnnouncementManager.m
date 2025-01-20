@interface ANAnnouncementManager
+ (id)managerWithEndpointID:(id)a3;
- (ANAnnouncementManager)initWithEndpointID:(id)a3;
- (ANAnnouncementManagerDelegte)delegate;
- (BOOL)_addAnnouncement:(id)a3 home:(id)a4 groupID:(id)a5;
- (BOOL)_shouldAccept:(id)a3 accept:(id)a4;
- (BOOL)_updateAnnouncement:(id)a3 withContentsOfAnnouncement:(id)a4 home:(id)a5 groupID:(id)a6;
- (BOOL)timersSuspended;
- (NSArray)allAnnouncementsSortedByReceipt;
- (NSMutableDictionary)homeAnnouncements;
- (NSMutableDictionary)timers;
- (NSUUID)endpointID;
- (OS_dispatch_queue)serialQueue;
- (OS_os_log)log;
- (id)announcementForID:(id)a3;
- (id)announcementsForGroupID:(id)a3;
- (id)announcementsForIDs:(id)a3;
- (void)_addAnnouncementToReceiveQueue:(id)a3;
- (void)_cleanDirectory;
- (void)_handleExpiredTimer:(id)a3 withID:(id)a4;
- (void)_loadStoredAnnouncements;
- (void)_notifyDelegateAnnouncementsChangedForGroupID:(id)a3;
- (void)_removeAnnouncementWithID:(id)a3;
- (void)_removeAnnouncementsForGroupID:(id)a3;
- (void)_removeAnnouncementsHittingStorageAgeLimit;
- (void)_resetTimer:(id)a3;
- (void)_startTimer:(id)a3;
- (void)_startTimerWithID:(id)a3;
- (void)_suspendTimer:(id)a3;
- (void)addAnnouncement:(id)a3 completionHandler:(id)a4;
- (void)cleanForExit;
- (void)pauseAllTimers;
- (void)removeAllAnnouncements;
- (void)removeOldAnnouncements;
- (void)resetAllTimers;
- (void)resumeAllTimers;
- (void)setDelegate:(id)a3;
- (void)setTimersSuspended:(BOOL)a3;
- (void)updateAnnouncement:(id)a3 statusFlags:(unint64_t)a4;
@end

@implementation ANAnnouncementManager

+ (id)managerWithEndpointID:(id)a3
{
  id v3 = a3;
  v4 = [[ANAnnouncementManager alloc] initWithEndpointID:v3];

  return v4;
}

- (ANAnnouncementManager)initWithEndpointID:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)ANAnnouncementManager;
  v6 = [(ANAnnouncementManager *)&v18 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_endpointID, a3);
    ANLogBuildCategoryName();
    uint64_t v8 = ANLogWithCategory();
    log = v7->_log;
    v7->_log = (OS_os_log *)v8;

    uint64_t v10 = objc_opt_new();
    homeAnnouncements = v7->_homeAnnouncements;
    v7->_homeAnnouncements = (NSMutableDictionary *)v10;

    uint64_t v12 = objc_opt_new();
    timers = v7->_timers;
    v7->_timers = (NSMutableDictionary *)v12;

    v14 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v15 = dispatch_queue_create("com.apple.announce.announcementManager", v14);
    serialQueue = v7->_serialQueue;
    v7->_serialQueue = (OS_dispatch_queue *)v15;

    [(ANAnnouncementManager *)v7 _loadStoredAnnouncements];
    [(ANAnnouncementManager *)v7 _cleanDirectory];
  }
  return v7;
}

- (void)cleanForExit
{
  id v3 = [(ANAnnouncementManager *)self serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__ANAnnouncementManager_cleanForExit__block_invoke;
  block[3] = &unk_1E6BCE238;
  block[4] = self;
  dispatch_sync(v3, block);
}

void __37__ANAnnouncementManager_cleanForExit__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) timers];
  [v1 removeAllObjects];
}

- (void)addAnnouncement:(id)a3 completionHandler:(id)a4
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(ANAnnouncementManager *)self serialQueue];
  dispatch_assert_queue_not_V2(v8);

  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__8;
  v26 = __Block_byref_object_dispose__8;
  id v27 = 0;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__8;
  v20[4] = __Block_byref_object_dispose__8;
  id v21 = 0;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __59__ANAnnouncementManager_addAnnouncement_completionHandler___block_invoke;
  v19[3] = &unk_1E6BCEEE8;
  v19[4] = &v22;
  v19[5] = v20;
  if (![(ANAnnouncementManager *)self _shouldAccept:v6 accept:v19])
  {
    if (!v7) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  v9 = +[ANUserNotificationController sharedController];
  char v10 = [v9 canPostUserNotificationForAnnouncement:v6 home:v23[5]];

  if (v10)
  {
    objc_initWeak(location, self);
    v11 = [(ANAnnouncementManager *)self serialQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__ANAnnouncementManager_addAnnouncement_completionHandler___block_invoke_6;
    block[3] = &unk_1E6BCEF10;
    objc_copyWeak(&v18, location);
    id v14 = v6;
    v16 = &v22;
    v17 = v20;
    id v15 = v7;
    dispatch_async(v11, block);

    objc_destroyWeak(&v18);
    objc_destroyWeak(location);
    goto LABEL_10;
  }
  uint64_t v12 = [(ANAnnouncementManager *)self log];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(location[0]) = 138412290;
    *(id *)((char *)location + 4) = v6;
    _os_log_impl(&dword_1DA5ED000, v12, OS_LOG_TYPE_DEFAULT, "Can't post user notification. Dropping announcement: %@", (uint8_t *)location, 0xCu);
  }

  if (v7) {
LABEL_9:
  }
    (*((void (**)(id, void))v7 + 2))(v7, 0);
LABEL_10:
  _Block_object_dispose(v20, 8);

  _Block_object_dispose(&v22, 8);
}

void __59__ANAnnouncementManager_addAnnouncement_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  char v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void __59__ANAnnouncementManager_addAnnouncement_completionHandler___block_invoke_6(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v3 = [*(id *)(a1 + 32) identifier];
  v4 = [WeakRetained announcementForID:v3];

  if (v4)
  {
    id v5 = [WeakRetained log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [*(id *)(a1 + 32) identifier];
      int v10 = 138412290;
      id v11 = v6;
      _os_log_impl(&dword_1DA5ED000, v5, OS_LOG_TYPE_DEFAULT, "Received duplicate announcement and updating existing: %@", (uint8_t *)&v10, 0xCu);
    }
    uint64_t v7 = [WeakRetained _updateAnnouncement:v4 withContentsOfAnnouncement:*(void *)(a1 + 32) home:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) groupID:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
  }
  else
  {
    uint64_t v7 = [WeakRetained _addAnnouncement:*(void *)(a1 + 32) home:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) groupID:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
  }
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    (*(void (**)(uint64_t, uint64_t))(v9 + 16))(v9, v8);
  }
}

- (void)updateAnnouncement:(id)a3 statusFlags:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(ANAnnouncementManager *)self serialQueue];
  dispatch_assert_queue_not_V2(v7);

  uint64_t v8 = [(ANAnnouncementManager *)self serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__ANAnnouncementManager_updateAnnouncement_statusFlags___block_invoke;
  block[3] = &unk_1E6BCDFE0;
  uint64_t v12 = self;
  unint64_t v13 = a4;
  id v11 = v6;
  id v9 = v6;
  dispatch_sync(v8, block);
}

void __56__ANAnnouncementManager_updateAnnouncement_statusFlags___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "setStatusFlags:", *(void *)(a1 + 48) | objc_msgSend(*(id *)(a1 + 32), "statusFlags"));
  id v3 = [*v2 location];
  v4 = [v3 homeUUID];

  if (!v4)
  {
    int v10 = [*(id *)(a1 + 40) log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __56__ANAnnouncementManager_updateAnnouncement_statusFlags___block_invoke_cold_1(v2);
    }

    id v6 = +[ANAnalytics shared];
    id v11 = [*(id *)(a1 + 40) endpointID];
    uint64_t v12 = +[ANAnalyticsContext contextWithEndpointID:v11];
    [v6 error:5005 context:v12];

    goto LABEL_11;
  }
  id v5 = +[ANHomeManager shared];
  id v6 = [v5 homeForID:v4];

  if (!v6)
  {
    id v11 = [*(id *)(a1 + 40) log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __56__ANAnnouncementManager_updateAnnouncement_statusFlags___block_invoke_cold_2();
    }
LABEL_11:

    goto LABEL_12;
  }
  uint64_t v7 = [*(id *)(a1 + 32) groupID];
  uint64_t v8 = [*(id *)(a1 + 40) announcementsForGroupID:v7];
  if ([v8 count])
  {
    id v9 = +[ANUserNotificationController sharedController];
    [v9 updateNotificationForAnnouncements:v8 home:v6 groupID:v7];
  }
LABEL_12:
}

- (id)announcementsForGroupID:(id)a3
{
  id v3 = [(NSMutableDictionary *)self->_homeAnnouncements objectForKey:a3];
  v4 = v3;
  if (v3)
  {
    id v5 = [v3 array];
  }
  else
  {
    id v5 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v5;
}

- (id)announcementForID:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  obj = self->_homeAnnouncements;
  uint64_t v5 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = [(NSMutableDictionary *)self->_homeAnnouncements objectForKey:*(void *)(*((void *)&v16 + 1) + 8 * i)];
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __43__ANAnnouncementManager_announcementForID___block_invoke;
        v14[3] = &unk_1E6BCEAF0;
        id v15 = v4;
        uint64_t v10 = [v9 indexOfObjectPassingTest:v14];
        if (v10 != 0x7FFFFFFFFFFFFFFFLL)
        {
          id v11 = [v9 objectAtIndex:v10];

          goto LABEL_11;
        }
      }
      uint64_t v6 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v11 = 0;
LABEL_11:

  return v11;
}

uint64_t __43__ANAnnouncementManager_announcementForID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (id)announcementsForIDs:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = -[ANAnnouncementManager announcementForID:](self, "announcementForID:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        if (v11) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (NSArray)allAnnouncementsSortedByReceipt
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = objc_opt_new();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v4 = self->_homeAnnouncements;
  uint64_t v5 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [(NSMutableDictionary *)self->_homeAnnouncements objectForKey:*(void *)(*((void *)&v20 + 1) + 8 * i)];
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v24 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v17;
          do
          {
            for (uint64_t j = 0; j != v11; ++j)
            {
              if (*(void *)v17 != v12) {
                objc_enumerationMutation(v9);
              }
              [v3 addObject:*(void *)(*((void *)&v16 + 1) + 8 * j)];
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v24 count:16];
          }
          while (v11);
        }
      }
      uint64_t v6 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v6);
  }

  long long v14 = [v3 sortedArrayUsingComparator:&__block_literal_global_28];

  return (NSArray *)v14;
}

uint64_t __56__ANAnnouncementManager_allAnnouncementsSortedByReceipt__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v4 receiptTimestamp];
  if (v6
    && (uint64_t v7 = (void *)v6,
        [v5 receiptTimestamp],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        v8))
  {
    uint64_t v9 = [v4 receiptTimestamp];
    uint64_t v10 = [v5 receiptTimestamp];
    uint64_t v11 = [v9 compare:v10];
  }
  else
  {
    uint64_t v11 = 1;
  }

  return v11;
}

- (void)removeOldAnnouncements
{
  objc_initWeak(&location, self);
  id v3 = [(ANAnnouncementManager *)self serialQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __47__ANAnnouncementManager_removeOldAnnouncements__block_invoke;
  v4[3] = &unk_1E6BCDE80;
  objc_copyWeak(&v5, &location);
  dispatch_sync(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __47__ANAnnouncementManager_removeOldAnnouncements__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _removeAnnouncementsHittingStorageAgeLimit];
}

- (void)removeAllAnnouncements
{
  objc_initWeak(&location, self);
  id v3 = [(ANAnnouncementManager *)self serialQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __47__ANAnnouncementManager_removeAllAnnouncements__block_invoke;
  v4[3] = &unk_1E6BCDE80;
  objc_copyWeak(&v5, &location);
  dispatch_sync(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __47__ANAnnouncementManager_removeAllAnnouncements__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _cleanDirectory];
}

- (void)pauseAllTimers
{
  id v3 = [(ANAnnouncementManager *)self serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__ANAnnouncementManager_pauseAllTimers__block_invoke;
  block[3] = &unk_1E6BCE238;
  void block[4] = self;
  dispatch_sync(v3, block);
}

uint64_t __39__ANAnnouncementManager_pauseAllTimers__block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t result = [*(id *)(a1 + 32) timersSuspended];
  if ((result & 1) == 0)
  {
    id v3 = +[ANUserNotificationController sharedController];
    id v4 = [*(id *)(a1 + 32) homeAnnouncements];
    id v5 = [v4 allKeys];
    [v3 pauseExpirationForNotificationsWithGroupIDs:v5];

    uint64_t v6 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [*(id *)(a1 + 32) timers];
      *(_DWORD *)buf = 134217984;
      uint64_t v22 = [v7 count];
      _os_log_impl(&dword_1DA5ED000, v6, OS_LOG_TYPE_DEFAULT, "Pausing All Timers: (%lu) timers", buf, 0xCu);
    }
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v8 = objc_msgSend(*(id *)(a1 + 32), "timers", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8 * v12);
          long long v14 = [*(id *)(a1 + 32) timers];
          long long v15 = [v14 objectForKey:v13];

          if (v15) {
            [*(id *)(a1 + 32) _suspendTimer:v15];
          }

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
    }

    return [*(id *)(a1 + 32) setTimersSuspended:1];
  }
  return result;
}

- (void)resumeAllTimers
{
  id v3 = [(ANAnnouncementManager *)self serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__ANAnnouncementManager_resumeAllTimers__block_invoke;
  block[3] = &unk_1E6BCE238;
  void block[4] = self;
  dispatch_sync(v3, block);
}

uint64_t __40__ANAnnouncementManager_resumeAllTimers__block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t result = [*(id *)(a1 + 32) timersSuspended];
  if (result)
  {
    id v3 = +[ANUserNotificationController sharedController];
    id v4 = [*(id *)(a1 + 32) homeAnnouncements];
    id v5 = [v4 allKeys];
    [v3 resumeExpirationForNotificationsWithGroupIDs:v5];

    uint64_t v6 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [*(id *)(a1 + 32) timers];
      *(_DWORD *)buf = 134217984;
      uint64_t v22 = [v7 count];
      _os_log_impl(&dword_1DA5ED000, v6, OS_LOG_TYPE_DEFAULT, "Resuming All Timers: (%lu) timers", buf, 0xCu);
    }
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v8 = objc_msgSend(*(id *)(a1 + 32), "timers", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8 * v12);
          long long v14 = [*(id *)(a1 + 32) timers];
          long long v15 = [v14 objectForKey:v13];

          if (v15) {
            [*(id *)(a1 + 32) _startTimer:v15];
          }

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
    }

    return [*(id *)(a1 + 32) setTimersSuspended:0];
  }
  return result;
}

- (void)resetAllTimers
{
  id v3 = [(ANAnnouncementManager *)self serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__ANAnnouncementManager_resetAllTimers__block_invoke;
  block[3] = &unk_1E6BCE238;
  void block[4] = self;
  dispatch_sync(v3, block);
}

void __39__ANAnnouncementManager_resetAllTimers__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) timers];
  id v3 = [v2 allValues];

  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(a1 + 32), "_resetTimer:", *(void *)(*((void *)&v9 + 1) + 8 * v8++), (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (BOOL)_addAnnouncement:(id)a3 home:(id)a4 groupID:(id)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  long long v11 = [(ANAnnouncementManager *)self serialQueue];
  dispatch_assert_queue_V2(v11);

  long long v12 = [MEMORY[0x1E4F4A950] sharedManager];
  uint64_t v13 = *MEMORY[0x1E4F4A868];
  uint64_t v14 = [(ANAnnouncementManager *)self endpointID];
  long long v15 = [v12 transaction:v13 forEndpointUUID:v14];

  long long v16 = [MEMORY[0x1E4F4A950] sharedManager];
  [v16 transaction:v15 setActive:1];

  if (![(ANAnnouncementManager *)self timersSuspended])
  {
    long long v17 = +[ANUserNotificationController sharedController];
    char v18 = [v17 hasDeliveredNotificationsWithGroupID:v9];

    if ((v18 & 1) == 0)
    {
      long long v19 = [(ANAnnouncementManager *)self log];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v43 = v9;
        _os_log_impl(&dword_1DA5ED000, v19, OS_LOG_TYPE_DEFAULT, "No existing notifications for Group ID (%@). Will wipe announcements if any.", buf, 0xCu);
      }

      [(ANAnnouncementManager *)self _removeAnnouncementsForGroupID:v9];
    }
  }
  if (![(ANAnnouncementManager *)self timersSuspended]) {
    [(ANAnnouncementManager *)self _removeAnnouncementsHittingStorageAgeLimit];
  }
  long long v20 = +[ANAnnouncementStorageManager sharedManager];
  long long v21 = [(ANAnnouncementManager *)self endpointID];
  [v20 saveAnnouncement:v8 endpointID:v21];

  [(ANAnnouncementManager *)self _startTimerWithID:v9];
  uint64_t v22 = [v8 transcriptionText];

  if (!v22
    || ([v8 transcriptionText],
        uint64_t v23 = objc_claimAutoreleasedReturnValue(),
        int v24 = [v23 isEqualToString:&stru_1F34A0E10],
        v23,
        v24))
  {
    if (_AXSShowAudioTranscriptions())
    {
      v25 = [MEMORY[0x1E4F4A8E0] sharedInstance];
      uint64_t v26 = [v25 numberForDefault:*MEMORY[0x1E4F4A6D8]];
      [v26 doubleValue];
      double v28 = v27;

      v29 = [(ANAnnouncementManager *)self log];
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DA5ED000, v29, OS_LOG_TYPE_DEFAULT, "Processing audio transcriptions", buf, 2u);
      }

      dispatch_semaphore_t v30 = dispatch_semaphore_create(0);
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __55__ANAnnouncementManager__addAnnouncement_home_groupID___block_invoke;
      v39[3] = &unk_1E6BCEF58;
      CFAbsoluteTime v41 = Current;
      v39[4] = self;
      dispatch_semaphore_t v40 = v30;
      v32 = v30;
      [v8 processAudioTranscription:v39];
      dispatch_time_t v33 = dispatch_time(0, (uint64_t)(v28 * 1000000000.0));
      dispatch_semaphore_wait(v32, v33);
    }
  }
  [(ANAnnouncementManager *)self _addAnnouncementToReceiveQueue:v8];
  v34 = +[ANUserNotificationController sharedController];
  v35 = [(ANAnnouncementManager *)self homeAnnouncements];
  v36 = [v35 objectForKeyedSubscript:v9];
  v37 = [v36 array];
  [v34 postNotificationForAnnouncement:v8 groupAnnouncements:v37 home:v10 groupID:v9];

  [(ANAnnouncementManager *)self _notifyDelegateAnnouncementsChangedForGroupID:v9];
  return 1;
}

intptr_t __55__ANAnnouncementManager__addAnnouncement_home_groupID___block_invoke(uint64_t a1, int a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    CFAbsoluteTime v5 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 48);
    v7[0] = 67109376;
    v7[1] = a2;
    __int16 v8 = 2048;
    CFAbsoluteTime v9 = v5;
    _os_log_impl(&dword_1DA5ED000, v4, OS_LOG_TYPE_DEFAULT, "Processed audio transcription: %d in %f seconds", (uint8_t *)v7, 0x12u);
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (BOOL)_updateAnnouncement:(id)a3 withContentsOfAnnouncement:(id)a4 home:(id)a5 groupID:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  id v12 = a4;
  id v13 = a3;
  uint64_t v14 = [(ANAnnouncementManager *)self serialQueue];
  dispatch_assert_queue_V2(v14);

  char v15 = [v13 updateWithContentsOfAnnouncement:v12];
  if (v15)
  {
    long long v16 = [(ANAnnouncementManager *)self announcementsForGroupID:v11];
    if ([v16 count])
    {
      long long v17 = +[ANUserNotificationController sharedController];
      [v17 updateNotificationForAnnouncements:v16 home:v10 groupID:v11];
    }
    [(ANAnnouncementManager *)self _notifyDelegateAnnouncementsChangedForGroupID:v11];
  }
  else
  {
    char v18 = [(ANAnnouncementManager *)self log];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long v20 = 0;
      _os_log_impl(&dword_1DA5ED000, v18, OS_LOG_TYPE_INFO, "No announcement updates.", v20, 2u);
    }
  }
  return v15;
}

- (void)_notifyDelegateAnnouncementsChangedForGroupID:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  CFAbsoluteTime v5 = [(ANAnnouncementManager *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl(&dword_1DA5ED000, v5, OS_LOG_TYPE_DEFAULT, "Announcements changed for GroupID %@", (uint8_t *)&v8, 0xCu);
  }

  uint64_t v6 = [(ANAnnouncementManager *)self announcementsForGroupID:v4];
  uint64_t v7 = [(ANAnnouncementManager *)self delegate];
  [v7 announcementManager:self announcements:v6 didChangeForGroupID:v4];
}

- (BOOL)_shouldAccept:(id)a3 accept:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [MEMORY[0x1E4F4A8E0] sharedInstance];
  id v9 = [v8 numberForDefault:*MEMORY[0x1E4F4A5A8]];

  uint64_t v10 = [MEMORY[0x1E4F1C9C8] now];
  id v11 = objc_msgSend(v10, "dateByAddingTimeInterval:", (double)-objc_msgSend(v9, "integerValue"));

  id v12 = [v6 creationTimestamp];
  [v12 timeIntervalSince1970];
  double v14 = v13;
  [v11 timeIntervalSince1970];
  double v16 = v14 - v15;

  if (v16 <= 0.0)
  {
    uint64_t v23 = [(ANAnnouncementManager *)self log];
    double v24 = -v16;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      double v41 = v24;
      _os_log_impl(&dword_1DA5ED000, v23, OS_LOG_TYPE_DEFAULT, "Removing Old Announcement. Exceeded limit by: %f", buf, 0xCu);
    }

    v25 = [(ANAnnouncementManager *)self endpointID];
    char v18 = +[ANAnalyticsContext contextWithEndpointID:v25];

    uint64_t v26 = +[ANAnalytics shared];
    [v26 announcementEntryAgeLimit:v6 timeExceeded:v18 context:v24];

    goto LABEL_12;
  }
  long long v17 = [v6 location];
  char v18 = [v17 homeUUID];

  if (!v18)
  {
    double v27 = [(ANAnnouncementManager *)self log];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      -[ANAnnouncementManager _shouldAccept:accept:](v6);
    }

    double v28 = +[ANAnalytics shared];
    v29 = [(ANAnnouncementManager *)self endpointID];
    dispatch_semaphore_t v30 = +[ANAnalyticsContext contextWithEndpointID:v29];
    [v28 error:5005 context:v30];

LABEL_12:
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
    BOOL v22 = 0;
    goto LABEL_21;
  }
  long long v19 = +[ANHomeManager shared];
  long long v20 = [v19 homeForID:v18];

  if (v20)
  {
    long long v21 = [v6 groupID];
    BOOL v22 = v21 != 0;
    if (v21)
    {
      (*((void (**)(id, void *, void *))v7 + 2))(v7, v20, v21);
    }
    else
    {
      v35 = [(ANAnnouncementManager *)self log];
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
        -[ANAnnouncementManager _shouldAccept:accept:](v6);
      }

      v38 = +[ANAnalytics shared];
      v39 = [(ANAnnouncementManager *)self endpointID];
      v36 = +[ANAnalyticsContext contextWithEndpointID:v39];
      [v38 error:5007 context:v36];

      (*((void (**)(id, void *, void))v7 + 2))(v7, v20, 0);
    }
  }
  else
  {
    v31 = [(ANAnnouncementManager *)self log];
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      __56__ANAnnouncementManager_updateAnnouncement_statusFlags___block_invoke_cold_2();
    }

    v32 = +[ANAnalytics shared];
    dispatch_time_t v33 = [(ANAnnouncementManager *)self endpointID];
    v34 = +[ANAnalyticsContext contextWithEndpointID:v33];
    [v32 error:5006 context:v34];

    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
    BOOL v22 = 0;
  }

LABEL_21:
  return v22;
}

- (void)_addAnnouncementToReceiveQueue:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  CFAbsoluteTime v5 = [(ANAnnouncementManager *)self serialQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [v4 groupID];
  id v7 = [(ANAnnouncementManager *)self homeAnnouncements];
  int v8 = [v7 objectForKeyedSubscript:v6];

  if (!v8)
  {
    int v8 = objc_opt_new();
    id v9 = [(ANAnnouncementManager *)self homeAnnouncements];
    [v9 setObject:v8 forKeyedSubscript:v6];
  }
  uint64_t v10 = [(ANAnnouncementManager *)self log];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [v4 identifier];
    int v12 = 138412290;
    double v13 = v11;
    _os_log_impl(&dword_1DA5ED000, v10, OS_LOG_TYPE_DEFAULT, "Adding Announcement to received queue: %@", (uint8_t *)&v12, 0xCu);
  }
  [v8 addObject:v4];
}

- (void)_removeAnnouncementsForGroupID:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  CFAbsoluteTime v5 = [(NSMutableDictionary *)self->_homeAnnouncements objectForKey:v4];
  id v6 = (void *)[v5 copy];

  if ([v6 count])
  {
    id v7 = [(ANAnnouncementManager *)self log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));
      *(_DWORD *)buf = 138412290;
      double v27 = v8;
      _os_log_impl(&dword_1DA5ED000, v7, OS_LOG_TYPE_DEFAULT, "Removing (%@) Announcements", buf, 0xCu);
    }
    homeAnnouncements = self->_homeAnnouncements;
    uint64_t v10 = objc_opt_new();
    id v20 = v4;
    [(NSMutableDictionary *)homeAnnouncements setObject:v10 forKey:v4];

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v11 = v6;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v22;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v22 != v14) {
            objc_enumerationMutation(v11);
          }
          double v16 = *(void **)(*((void *)&v21 + 1) + 8 * v15);
          long long v17 = +[ANAnnouncementStorageManager sharedManager];
          char v18 = [v16 identifier];
          long long v19 = [(ANAnnouncementManager *)self endpointID];
          [v17 deleteAnnouncementWithID:v18 endpointID:v19];

          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v13);
    }

    id v4 = v20;
  }
}

- (void)_removeAnnouncementsHittingStorageAgeLimit
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v3 = [(ANAnnouncementManager *)self serialQueue];
  dispatch_assert_queue_V2(v3);

  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  obuint64_t j = [(NSMutableDictionary *)self->_homeAnnouncements allKeys];
  uint64_t v4 = [obj countByEnumeratingWithState:&v54 objects:v65 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v55;
    uint64_t v45 = *MEMORY[0x1E4F4A5D8];
    *(void *)&long long v5 = 134217984;
    long long v40 = v5;
    uint64_t v41 = *(void *)v55;
    do
    {
      uint64_t v8 = 0;
      uint64_t v42 = v6;
      do
      {
        if (*(void *)v55 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v54 + 1) + 8 * v8);
        uint64_t v10 = -[NSMutableDictionary objectForKey:](self->_homeAnnouncements, "objectForKey:", v9, v40);
        id v11 = (void *)[v10 copy];

        if ([v11 count])
        {
          uint64_t v12 = [MEMORY[0x1E4F4A8E0] sharedInstance];
          uint64_t v13 = [v12 numberForDefault:v45];

          uint64_t v14 = [MEMORY[0x1E4F1C9C8] now];
          v49 = objc_msgSend(v14, "dateByAddingTimeInterval:", (double)-objc_msgSend(v13, "integerValue"));

          uint64_t v15 = objc_opt_new();
          long long v50 = 0u;
          long long v51 = 0u;
          long long v52 = 0u;
          long long v53 = 0u;
          id v16 = v11;
          uint64_t v17 = [v16 countByEnumeratingWithState:&v50 objects:v64 count:16];
          if (v17)
          {
            uint64_t v18 = v17;
            uint64_t v44 = v9;
            v46 = v13;
            v47 = v11;
            uint64_t v48 = v8;
            char v19 = 0;
            uint64_t v20 = *(void *)v51;
            long long v21 = v16;
LABEL_9:
            uint64_t v22 = 0;
            while (1)
            {
              if (*(void *)v51 != v20) {
                objc_enumerationMutation(v21);
              }
              long long v23 = *(void **)(*((void *)&v50 + 1) + 8 * v22);
              long long v24 = [v23 creationTimestamp];
              [v24 timeIntervalSince1970];
              double v26 = v25;
              [v49 timeIntervalSince1970];
              double v28 = v26 - v27;

              v29 = [(ANAnnouncementManager *)self log];
              BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);
              if (v28 > 0.0) {
                break;
              }
              if (v30)
              {
                v31 = [v23 identifier];
                *(_DWORD *)buf = 138412546;
                double v61 = *(double *)&v31;
                __int16 v62 = 2048;
                double v63 = -v28;
                _os_log_impl(&dword_1DA5ED000, v29, OS_LOG_TYPE_DEFAULT, "Removing Old Announcement %@. Exceeded limit by: %f", buf, 0x16u);
              }
              v58 = @"timeExceeded";
              float v32 = v28;
              *(float *)&double v33 = -v32;
              v34 = [NSNumber numberWithFloat:v33];
              v59 = v34;
              char v19 = 1;
              v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v59 forKeys:&v58 count:1];
              [v15 addAnnouncement:v23 metadata:v35];

              v36 = [v23 identifier];
              [(ANAnnouncementManager *)self _removeAnnouncementWithID:v36];

              if (v18 == ++v22)
              {
                uint64_t v18 = [v21 countByEnumeratingWithState:&v50 objects:v64 count:16];
                char v19 = 1;
                if (v18) {
                  goto LABEL_9;
                }

                uint64_t v7 = v41;
                uint64_t v6 = v42;
                id v11 = v47;
                uint64_t v8 = v48;
                uint64_t v13 = v46;
                goto LABEL_21;
              }
            }
            if (v30)
            {
              *(_DWORD *)buf = v40;
              double v61 = v28;
              _os_log_impl(&dword_1DA5ED000, v29, OS_LOG_TYPE_DEFAULT, "Announcement has not reached age limit. Remaining time: %f", buf, 0xCu);
            }

            uint64_t v7 = v41;
            uint64_t v6 = v42;
            id v11 = v47;
            uint64_t v8 = v48;
            uint64_t v13 = v46;
            if (v19) {
LABEL_21:
            }
              [(ANAnnouncementManager *)self _notifyDelegateAnnouncementsChangedForGroupID:v44];
          }
          else
          {
          }
          v37 = [(ANAnnouncementManager *)self endpointID];
          v38 = +[ANAnalyticsContext contextWithEndpointID:v37];

          v39 = +[ANAnalytics shared];
          [v39 announcementsStorageAgeLimit:v15 context:v38];
        }
        ++v8;
      }
      while (v8 != v6);
      uint64_t v6 = [obj countByEnumeratingWithState:&v54 objects:v65 count:16];
    }
    while (v6);
  }
}

- (void)_removeAnnouncementWithID:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  obuint64_t j = self->_homeAnnouncements;
  uint64_t v5 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = [(NSMutableDictionary *)self->_homeAnnouncements objectForKey:*(void *)(*((void *)&v18 + 1) + 8 * i)];
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __51__ANAnnouncementManager__removeAnnouncementWithID___block_invoke;
        v16[3] = &unk_1E6BCEAF0;
        id v10 = v4;
        id v17 = v10;
        uint64_t v11 = [v9 indexOfObjectPassingTest:v16];
        if (v11 != 0x7FFFFFFFFFFFFFFFLL)
        {
          [v9 removeObjectAtIndex:v11];
          uint64_t v12 = [(ANAnnouncementManager *)self log];
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v23 = v10;
            _os_log_impl(&dword_1DA5ED000, v12, OS_LOG_TYPE_DEFAULT, "Removed Announcement from queue: %@", buf, 0xCu);
          }

          goto LABEL_13;
        }
      }
      uint64_t v6 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v18 objects:v24 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  uint64_t v13 = +[ANAnnouncementStorageManager sharedManager];
  uint64_t v14 = [(ANAnnouncementManager *)self endpointID];
  [v13 deleteAnnouncementWithID:v4 endpointID:v14];
}

uint64_t __51__ANAnnouncementManager__removeAnnouncementWithID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (void)_loadStoredAnnouncements
{
  id v3 = [(ANAnnouncementManager *)self serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__ANAnnouncementManager__loadStoredAnnouncements__block_invoke;
  block[3] = &unk_1E6BCE238;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __49__ANAnnouncementManager__loadStoredAnnouncements__block_invoke(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  v2 = +[ANAnnouncementStorageManager sharedManager];
  id v3 = [*(id *)(a1 + 32) endpointID];
  uint64_t v4 = [v2 storedAnnouncementsForEndpointID:v3];

  uint64_t v5 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v37 = [v4 count];
    _os_log_impl(&dword_1DA5ED000, v5, OS_LOG_TYPE_DEFAULT, "Loaded Stored Announcements: %lu announcements", buf, 0xCu);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v31 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        if ([*(id *)(a1 + 32) _shouldAccept:v11 accept:&__block_literal_global_30])
        {
          [*(id *)(a1 + 32) _addAnnouncementToReceiveQueue:v11];
        }
        else
        {
          uint64_t v12 = +[ANAnnouncementStorageManager sharedManager];
          uint64_t v13 = [v11 identifier];
          uint64_t v14 = [*(id *)(a1 + 32) endpointID];
          [v12 deleteAnnouncementWithID:v13 endpointID:v14];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v8);
  }

  uint64_t v15 = [*(id *)(a1 + 32) homeAnnouncements];
  id v16 = [v15 allKeys];

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v17 = v16;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v27;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v27 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void *)(*((void *)&v26 + 1) + 8 * j);
        id v23 = objc_msgSend(*(id *)(a1 + 32), "homeAnnouncements", (void)v26);
        long long v24 = [v23 objectForKeyedSubscript:v22];
        uint64_t v25 = [v24 count];

        if (v25) {
          [*(id *)(a1 + 32) _startTimerWithID:v22];
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v19);
  }
}

- (void)_cleanDirectory
{
  id v3 = [(ANAnnouncementManager *)self serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__ANAnnouncementManager__cleanDirectory__block_invoke;
  block[3] = &unk_1E6BCE238;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __40__ANAnnouncementManager__cleanDirectory__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) allAnnouncementsSortedByReceipt];
  objc_msgSend(v2, "na_map:", &__block_literal_global_33);
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  id v3 = +[ANAnnouncementStorageManager sharedManager];
  uint64_t v4 = [*(id *)(a1 + 32) endpointID];
  [v3 removeAnnouncementDataExcludingDataForAnnouncementIDs:v5 endpointID:v4];
}

uint64_t __40__ANAnnouncementManager__cleanDirectory__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

- (void)_startTimerWithID:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(ANAnnouncementManager *)self timers];
  id v6 = [v5 objectForKey:v4];

  if (v6 && ![(ANAnnouncementManager *)self timersSuspended])
  {
    [(ANAnnouncementManager *)self _resetTimer:v6];
  }
  else
  {
    uint64_t v7 = [(ANAnnouncementManager *)self serialQueue];
    dispatch_source_t v8 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v7);

    if (v8)
    {
      uint64_t v9 = [(ANAnnouncementManager *)self log];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        dispatch_source_t v18 = v8;
        __int16 v19 = 2112;
        id v20 = v4;
        _os_log_impl(&dword_1DA5ED000, v9, OS_LOG_TYPE_DEFAULT, "Created Timer %@ for %@", buf, 0x16u);
      }

      objc_initWeak((id *)buf, self);
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __43__ANAnnouncementManager__startTimerWithID___block_invoke;
      handler[3] = &unk_1E6BCE448;
      objc_copyWeak(&v16, (id *)buf);
      id v10 = v8;
      uint64_t v14 = v10;
      id v11 = v4;
      id v15 = v11;
      dispatch_source_set_event_handler(v10, handler);
      uint64_t v12 = [(ANAnnouncementManager *)self timers];
      [v12 setObject:v10 forKey:v11];

      if (![(ANAnnouncementManager *)self timersSuspended]) {
        [(ANAnnouncementManager *)self _startTimer:v10];
      }

      objc_destroyWeak(&v16);
      objc_destroyWeak((id *)buf);
    }
  }
}

void __43__ANAnnouncementManager__startTimerWithID___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _handleExpiredTimer:*(void *)(a1 + 32) withID:*(void *)(a1 + 40)];
}

- (void)_handleExpiredTimer:(id)a3 withID:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  dispatch_source_t v8 = [(ANAnnouncementManager *)self log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v39 = (uint64_t)v6;
    __int16 v40 = 2112;
    id v41 = v7;
    _os_log_impl(&dword_1DA5ED000, v8, OS_LOG_TYPE_DEFAULT, "Timer %@ with ID %@ Expired", buf, 0x16u);
  }

  long long v32 = v6;
  dispatch_source_cancel(v6);
  long long v31 = v7;
  uint64_t v9 = [(NSMutableDictionary *)self->_homeAnnouncements objectForKey:v7];
  id v10 = (void *)[v9 copy];

  id v11 = [(ANAnnouncementManager *)self log];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = [v10 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v39 = v12;
    _os_log_impl(&dword_1DA5ED000, v11, OS_LOG_TYPE_DEFAULT, "Removing %lu Announcements", buf, 0xCu);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v13 = v10;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v34 != v16) {
          objc_enumerationMutation(v13);
        }
        dispatch_source_t v18 = [*(id *)(*((void *)&v33 + 1) + 8 * i) identifier];
        __int16 v19 = [(ANAnnouncementManager *)self log];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v39 = (uint64_t)v18;
          _os_log_impl(&dword_1DA5ED000, v19, OS_LOG_TYPE_DEFAULT, "Removing Announcement: %@", buf, 0xCu);
        }

        [(ANAnnouncementManager *)self _removeAnnouncementWithID:v18];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v15);
  }

  id v20 = [(ANAnnouncementManager *)self timers];
  [v20 removeObjectForKey:v31];

  uint64_t v21 = [(ANAnnouncementManager *)self allAnnouncementsSortedByReceipt];
  uint64_t v22 = [v21 count];

  if (!v22)
  {
    id v23 = [MEMORY[0x1E4F4A950] sharedManager];
    uint64_t v24 = *MEMORY[0x1E4F4A868];
    uint64_t v25 = [(ANAnnouncementManager *)self endpointID];
    long long v26 = [v23 transaction:v24 forEndpointUUID:v25];

    long long v27 = [MEMORY[0x1E4F4A950] sharedManager];
    [v27 transaction:v26 setActive:0];
  }
  long long v28 = [(ANAnnouncementManager *)self endpointID];
  long long v29 = +[ANAnalyticsContext contextWithEndpointID:v28];

  long long v30 = +[ANAnalytics shared];
  objc_msgSend(v30, "announcementsExpired:ofGroupCount:context:", v13, objc_msgSend(v13, "count"), v29);
}

- (void)_startTimer:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F4A8E0] sharedInstance];
  id v6 = [v5 numberForDefault:*MEMORY[0x1E4F4A5C0]];

  uint64_t v7 = [v6 integerValue];
  dispatch_source_t v8 = [(ANAnnouncementManager *)self log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    uint64_t v12 = v4;
    __int16 v13 = 2048;
    uint64_t v14 = v7;
    _os_log_impl(&dword_1DA5ED000, v8, OS_LOG_TYPE_DEFAULT, "Starting Timer (%@) for %ld seconds", (uint8_t *)&v11, 0x16u);
  }

  uint64_t v9 = 1000000000 * v7;
  dispatch_time_t v10 = dispatch_time(0, v9);
  dispatch_source_set_timer(v4, v10, v9, 0);
  dispatch_resume(v4);
}

- (void)_resetTimer:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(ANAnnouncementManager *)self timersSuspended])
  {
    dispatch_suspend(v4);
    id v5 = [(ANAnnouncementManager *)self log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      uint64_t v7 = v4;
      _os_log_impl(&dword_1DA5ED000, v5, OS_LOG_TYPE_DEFAULT, "Restarting Timer %@", (uint8_t *)&v6, 0xCu);
    }

    [(ANAnnouncementManager *)self _startTimer:v4];
  }
}

- (void)_suspendTimer:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(ANAnnouncementManager *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    uint64_t v7 = v4;
    _os_log_impl(&dword_1DA5ED000, v5, OS_LOG_TYPE_DEFAULT, "Suspending Timer %@", (uint8_t *)&v6, 0xCu);
  }

  dispatch_suspend(v4);
}

- (NSUUID)endpointID
{
  return self->_endpointID;
}

- (ANAnnouncementManagerDelegte)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ANAnnouncementManagerDelegte *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableDictionary)timers
{
  return self->_timers;
}

- (NSMutableDictionary)homeAnnouncements
{
  return self->_homeAnnouncements;
}

- (BOOL)timersSuspended
{
  return self->_timersSuspended;
}

- (void)setTimersSuspended:(BOOL)a3
{
  self->_timersSuspended = a3;
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_homeAnnouncements, 0);
  objc_storeStrong((id *)&self->_timers, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_endpointID, 0);
}

void __56__ANAnnouncementManager_updateAnnouncement_statusFlags___block_invoke_cold_1(id *a1)
{
  id v1 = [*a1 identifier];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_1DA5ED000, v2, v3, "No home identifier in announcement: %@", v4, v5, v6, v7, v8);
}

void __56__ANAnnouncementManager_updateAnnouncement_statusFlags___block_invoke_cold_2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_1DA5ED000, v0, OS_LOG_TYPE_ERROR, "Failed to find home for ID: %@", v1, 0xCu);
}

- (void)_shouldAccept:(void *)a1 accept:.cold.1(void *a1)
{
  id v1 = [a1 identifier];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_1DA5ED000, v2, v3, "No home identifier in announcement: %@", v4, v5, v6, v7, v8);
}

- (void)_shouldAccept:(void *)a1 accept:.cold.3(void *a1)
{
  id v1 = [a1 identifier];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_1DA5ED000, v2, v3, "No Group ID in Announcement: %@", v4, v5, v6, v7, v8);
}

@end