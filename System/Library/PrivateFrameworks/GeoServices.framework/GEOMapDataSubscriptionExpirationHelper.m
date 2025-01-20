@interface GEOMapDataSubscriptionExpirationHelper
+ (GEOMapDataSubscriptionExpirationHelper)sharedHelper;
- (GEOMapDataSubscriptionExpirationHelper)init;
- (uint64_t)_scheduleExpirationTaskIfNecessary;
- (void)_scheduleUpcomingExpirationTaskIfNecessary;
- (void)_subscriptionsDidChange:(id)a3;
- (void)configureWithDB:(id)a3;
- (void)dealloc;
- (void)offlineDataConfiguration:(id)a3 didChangeActiveVersions:(id)a4;
- (void)runBackgroundTask:(id)a3 orIdentifier:(id)a4;
- (void)tileDB:(id)a3 didExpireSubscriptions:(id)a4 forReason:(int64_t)a5;
- (void)valueChangedForGEOConfigKey:(id)a3;
@end

@implementation GEOMapDataSubscriptionExpirationHelper

+ (GEOMapDataSubscriptionExpirationHelper)sharedHelper
{
  if (_MergedGlobals_338 != -1) {
    dispatch_once(&_MergedGlobals_338, &__block_literal_global_205);
  }
  v2 = (void *)qword_1EB2A07C8;

  return (GEOMapDataSubscriptionExpirationHelper *)v2;
}

void __54__GEOMapDataSubscriptionExpirationHelper_sharedHelper__block_invoke()
{
  v0 = objc_alloc_init(GEOMapDataSubscriptionExpirationHelper);
  v1 = (void *)qword_1EB2A07C8;
  qword_1EB2A07C8 = (uint64_t)v0;
}

- (GEOMapDataSubscriptionExpirationHelper)init
{
  v7.receiver = self;
  v7.super_class = (Class)GEOMapDataSubscriptionExpirationHelper;
  v2 = [(GEOMapDataSubscriptionExpirationHelper *)&v7 init];
  if (v2)
  {
    uint64_t v3 = geo_dispatch_queue_create_with_workloop_qos();
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = v2;
  }

  return v2;
}

- (void)dealloc
{
  GEOConfigRemoveDelegateListenerForKey(GEOConfigKey_Invalid, unk_1E91186C0, self);
  int fullyDownloadedSubscriptionsChangedToken = self->_fullyDownloadedSubscriptionsChangedToken;
  if (fullyDownloadedSubscriptionsChangedToken != -1) {
    notify_cancel(fullyDownloadedSubscriptionsChangedToken);
  }
  v4.receiver = self;
  v4.super_class = (Class)GEOMapDataSubscriptionExpirationHelper;
  [(GEOMapDataSubscriptionExpirationHelper *)&v4 dealloc];
}

- (void)configureWithDB:(id)a3
{
  id v5 = a3;
  if (self->_db)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      LOWORD(location) = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: _db == ((void *)0)", (uint8_t *)&location, 2u);
    }
  }
  else
  {
    objc_storeStrong((id *)&self->_db, a3);
    [(GEOTileDB *)self->_db registerObserver:self queue:self->_queue];
    v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:self selector:sel__subscriptionsDidChange_ name:0x1ED5A1B70 object:0];

    objc_super v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 addObserver:self selector:sel__subscriptionsDidChange_ name:0x1ED5A1B90 object:0];

    v8 = +[GEOOfflineDataConfiguration sharedConfiguration];
    [v8 registerObserver:self queue:self->_queue];

    _GEOConfigAddDelegateListenerForKey(GeoOfflineConfig_OptimizeStorageEnabled, (uint64_t)off_1E91157D8, self->_queue, self);
    _GEOConfigAddDelegateListenerForKey(GeoOfflineConfig_OptimizeStorageLastUsedDeleteInterval, (uint64_t)off_1E91157E8, self->_queue, self);
    _GEOConfigAddDelegateListenerForKey(GeoOfflineConfig_OptimizeStorageNeverUsedDeleteInterval, (uint64_t)off_1E91157F8, self->_queue, self);
    _GEOConfigAddDelegateListenerForKey(GeoOfflineConfig_UpdateRequiredExpirationInterval, (uint64_t)off_1E9115818, self->_queue, self);
    _GEOConfigAddDelegateListenerForKey(GeoOfflineConfig_UpdateRequiredExpirationNoticeInterval, (uint64_t)off_1E9115828, self->_queue, self);
    _GEOConfigAddDelegateListenerForKey(GeoOfflineConfig_HasNotifiedForUpcomingUpdateRequiredExpiration, (uint64_t)off_1E9115848, self->_queue, self);
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__GEOMapDataSubscriptionExpirationHelper_configureWithDB___block_invoke;
    block[3] = &unk_1E53D79D8;
    block[4] = self;
    dispatch_async(queue, block);
    objc_initWeak(&location, self);
    v10 = GEOMapDataSubscriptionManagerFullyDownloadedSubscriptionsDidChangeDarwinNotification;
    v11 = self->_queue;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __58__GEOMapDataSubscriptionExpirationHelper_configureWithDB___block_invoke_2;
    handler[3] = &unk_1E53DD2C0;
    objc_copyWeak(&v13, &location);
    notify_register_dispatch(v10, &self->_fullyDownloadedSubscriptionsChangedToken, v11, handler);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

void __58__GEOMapDataSubscriptionExpirationHelper_configureWithDB___block_invoke(uint64_t a1)
{
  -[GEOMapDataSubscriptionExpirationHelper _scheduleExpirationTaskIfNecessary](*(void *)(a1 + 32));
  -[GEOMapDataSubscriptionExpirationHelper _scheduleUpcomingExpirationTaskIfNecessary](*(void *)(a1 + 32));
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    if ((GEOConfigGetBOOL(GeoOfflineConfig_HasNotifiedForIncompatibleVersions, (uint64_t)off_1E9115A28) & 1) == 0)
    {
      uint64_t v3 = +[GEOMapDataSubscriptionManager sharedManager];
      uint64_t v4 = *(void *)(v2 + 8);
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __83__GEOMapDataSubscriptionExpirationHelper__notifyForIncompatibleVersionsIfNecessary__block_invoke;
      v5[3] = &unk_1E53DA9B0;
      v5[4] = v2;
      [v3 fetchAllSubscriptionsWithCallbackQueue:v4 completionHandler:v5];
    }
  }
}

- (uint64_t)_scheduleExpirationTaskIfNecessary
{
  if (result)
  {
    uint64_t v1 = result;
    result = BackgroundSystemTasksLibraryCore();
    if (result)
    {
      uint64_t v3 = *(void *)(v1 + 8);
      uint64_t v2 = *(void **)(v1 + 16);
      v4[0] = MEMORY[0x1E4F143A8];
      v4[1] = 3221225472;
      v4[2] = __76__GEOMapDataSubscriptionExpirationHelper__scheduleExpirationTaskIfNecessary__block_invoke;
      v4[3] = &unk_1E53F5EF8;
      v4[4] = v1;
      return [v2 getNextSubscriptionExpirationDateWithQueue:v3 callback:v4];
    }
  }
  return result;
}

- (void)_scheduleUpcomingExpirationTaskIfNecessary
{
  if (a1
    && (GEOConfigGetBOOL(GeoOfflineConfig_HasNotifiedForUpcomingUpdateRequiredExpiration, (uint64_t)off_1E9115848) & 1) == 0)
  {
    if (BackgroundSystemTasksLibraryCore())
    {
      uint64_t v2 = +[GEOMapDataSubscriptionManager sharedManager];
      uint64_t v3 = *(void *)(a1 + 8);
      v4[0] = MEMORY[0x1E4F143A8];
      v4[1] = 3221225472;
      v4[2] = __84__GEOMapDataSubscriptionExpirationHelper__scheduleUpcomingExpirationTaskIfNecessary__block_invoke;
      v4[3] = &unk_1E53DA9B0;
      v4[4] = a1;
      [v2 _fetchFullyDownloadedSubscriptionsOfType:1024 includeOutOfDate:1 callbackQueue:v3 completionHandler:v4];
    }
  }
}

void __58__GEOMapDataSubscriptionExpirationHelper_configureWithDB___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[GEOMapDataSubscriptionExpirationHelper _scheduleExpirationTaskIfNecessary]((uint64_t)WeakRetained);

  id v3 = objc_loadWeakRetained(v1);
  -[GEOMapDataSubscriptionExpirationHelper _scheduleUpcomingExpirationTaskIfNecessary]((uint64_t)v3);
}

void __76__GEOMapDataSubscriptionExpirationHelper__scheduleExpirationTaskIfNecessary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  objc_super v7 = v6;
  if (!v5 && v6)
  {
    v8 = GEOGetSubscriptionExpirationLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      double v34 = *(double *)&v7;
      _os_log_impl(&dword_188D96000, v8, OS_LOG_TYPE_ERROR, "Failed to fetch next expiration date: %{public}@", buf, 0xCu);
    }
    goto LABEL_33;
  }
  v9 = [getBGSystemTaskSchedulerClass() sharedScheduler];
  v8 = [v9 taskRequestForIdentifier:@"com.apple.geod.ExpireSubscription"];

  if (v5)
  {
    v10 = [MEMORY[0x1E4F1C9C8] date];
    [v5 timeIntervalSinceDate:v10];
    double v12 = v11;

    id v13 = GEOGetSubscriptionExpirationLog();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
    if (v12 <= 0.0)
    {
      if (v14)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_188D96000, v13, OS_LOG_TYPE_INFO, "Next expiration date is in the past. Performing expiration immediately", buf, 2u);
      }

      if (v8)
      {
        v26 = [getBGSystemTaskSchedulerClass() sharedScheduler];
        uint64_t v31 = 0;
        [v26 cancelTaskRequestWithIdentifier:@"com.apple.geod.ExpireSubscription" error:&v31];
      }
      [*(id *)(a1 + 32) runBackgroundTask:0 orIdentifier:@"com.apple.geod.ExpireSubscription"];
    }
    else
    {
      if (v14)
      {
        *(_DWORD *)buf = 134217984;
        double v34 = v12;
        _os_log_impl(&dword_188D96000, v13, OS_LOG_TYPE_INFO, "Next expiration date is in %f seconds. Scheduling XPC activity", buf, 0xCu);
      }

      uint64_t v15 = _createBGNonRepeatingSystemTaskRequest(@"com.apple.geod.ExpireSubscription", v12);
      if (v15)
      {
        v16 = (void *)v15;
        v17 = [getBGSystemTaskSchedulerClass() sharedScheduler];
        v18 = v17;
        if (v8)
        {
          id v30 = 0;
          char v19 = [v17 updateTaskRequest:v16 error:&v30];
          v20 = (__CFString *)v30;

          if ((v19 & 1) == 0)
          {
            v21 = GEOGetSubscriptionExpirationLog();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
            {
              v22 = @"Unknown";
              if (v20) {
                v22 = v20;
              }
              *(_DWORD *)buf = 138412290;
              double v34 = *(double *)&v22;
              v23 = "Failed to update existing task with error: %@";
LABEL_30:
              _os_log_impl(&dword_188D96000, v21, OS_LOG_TYPE_INFO, v23, buf, 0xCu);
              goto LABEL_31;
            }
            goto LABEL_31;
          }
        }
        else
        {
          id v29 = 0;
          char v27 = [v17 submitTaskRequest:v16 error:&v29];
          v20 = (__CFString *)v29;

          if ((v27 & 1) == 0)
          {
            v21 = GEOGetSubscriptionExpirationLog();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
            {
              v28 = @"Unknown";
              if (v20) {
                v28 = v20;
              }
              *(_DWORD *)buf = 138412290;
              double v34 = *(double *)&v28;
              v23 = "Failed to submit task with error: %@";
              goto LABEL_30;
            }
LABEL_31:
          }
        }
      }
    }
  }
  else
  {
    v24 = GEOGetSubscriptionExpirationLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_188D96000, v24, OS_LOG_TYPE_DEBUG, "No upcoming subscriptions will expire. Not scheduling XPC activity", buf, 2u);
    }

    if (v8)
    {
      v25 = [getBGSystemTaskSchedulerClass() sharedScheduler];
      uint64_t v32 = 0;
      [v25 cancelTaskRequestWithIdentifier:@"com.apple.geod.ExpireSubscription" error:&v32];
    }
  }
LABEL_33:
}

void __84__GEOMapDataSubscriptionExpirationHelper__scheduleUpcomingExpirationTaskIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [getBGSystemTaskSchedulerClass() sharedScheduler];
  id v5 = [v4 taskRequestForIdentifier:@"com.apple.geod.ExpireSubscription.Upcoming"];

  uint64_t v6 = [v3 count];
  if (v6)
  {
    double Uint64 = (double)(unint64_t)GEOConfigGetUint64(GeoOfflineConfig_UpdateRequiredExpirationInterval, (uint64_t)off_1E9115818);
    if ((double)(unint64_t)GEOConfigGetUint64(GeoOfflineConfig_UpdateRequiredExpirationNoticeInterval, (uint64_t)off_1E9115828) < Uint64)double Uint64 = (double)(unint64_t)GEOConfigGetUint64(GeoOfflineConfig_UpdateRequiredExpirationNoticeInterval, (uint64_t)off_1E9115828); {
    v8 = _nextSubscriptionUpdateRequiredExpirationDate();
    }
    v9 = [v8 dateByAddingTimeInterval:-Uint64];

    v10 = [MEMORY[0x1E4F1C9C8] now];
    [v9 timeIntervalSinceDate:v10];
    double v12 = v11;

    id v13 = GEOGetSubscriptionExpirationLog();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
    if (v12 <= 0.0)
    {
      if (v14)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_188D96000, v13, OS_LOG_TYPE_INFO, "Next pending expiration notification date is in the past. Posting notification immediately", buf, 2u);
      }

      if (v5)
      {
        v24 = [getBGSystemTaskSchedulerClass() sharedScheduler];
        uint64_t v29 = 0;
        [v24 cancelTaskRequestWithIdentifier:@"com.apple.geod.ExpireSubscription.Upcoming" error:&v29];
      }
      [*(id *)(a1 + 32) runBackgroundTask:0 orIdentifier:@"com.apple.geod.ExpireSubscription.Upcoming"];
      goto LABEL_29;
    }
    if (v14)
    {
      *(_DWORD *)buf = 134217984;
      double v32 = v12;
      _os_log_impl(&dword_188D96000, v13, OS_LOG_TYPE_INFO, "Next pending expiration notification date is in %f seconds. Scheduling XPC activity", buf, 0xCu);
    }

    uint64_t v15 = _createBGNonRepeatingSystemTaskRequest(@"com.apple.geod.ExpireSubscription.Upcoming", v12);
    if (v15)
    {
      v16 = (void *)v15;
      v17 = [getBGSystemTaskSchedulerClass() sharedScheduler];
      v18 = v17;
      if (v5)
      {
        id v28 = 0;
        char v19 = [v17 updateTaskRequest:v16 error:&v28];
        v20 = (__CFString *)v28;

        if ((v19 & 1) == 0)
        {
          v21 = GEOGetSubscriptionExpirationLog();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            v22 = @"Unknown";
            if (v20) {
              v22 = v20;
            }
            *(_DWORD *)buf = 138412290;
            double v32 = *(double *)&v22;
            v23 = "Failed to update existing task with error: %@";
LABEL_26:
            _os_log_impl(&dword_188D96000, v21, OS_LOG_TYPE_INFO, v23, buf, 0xCu);
            goto LABEL_27;
          }
          goto LABEL_27;
        }
      }
      else
      {
        id v27 = 0;
        char v25 = [v17 submitTaskRequest:v16 error:&v27];
        v20 = (__CFString *)v27;

        if ((v25 & 1) == 0)
        {
          v21 = GEOGetSubscriptionExpirationLog();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            v26 = @"Unknown";
            if (v20) {
              v26 = v20;
            }
            *(_DWORD *)buf = 138412290;
            double v32 = *(double *)&v26;
            v23 = "Failed to submit task with error: %@";
            goto LABEL_26;
          }
LABEL_27:
        }
      }
    }
LABEL_29:

    goto LABEL_30;
  }
  if (v5)
  {
    v9 = [getBGSystemTaskSchedulerClass() sharedScheduler];
    uint64_t v30 = 0;
    [v9 cancelTaskRequestWithIdentifier:@"com.apple.geod.ExpireSubscription.Upcoming" error:&v30];
    goto LABEL_29;
  }
LABEL_30:
}

void __83__GEOMapDataSubscriptionExpirationHelper__notifyForIncompatibleVersionsIfNecessary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v17 = a3;
  v18 = v4;
  if ([v4 count])
  {
    char v19 = objc_msgSend(v4, "_geo_filtered:", &__block_literal_global_16_0);
    id v5 = v19;
    if ([v19 count])
    {
      uint64_t v6 = dispatch_group_create();
      objc_super v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v19, "count"));
      v33[0] = 0;
      v33[1] = v33;
      v33[2] = 0x3032000000;
      v33[3] = __Block_byref_object_copy__100;
      v33[4] = __Block_byref_object_dispose__100;
      id v34 = 0;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id obj = v19;
      uint64_t v8 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
      if (v8)
      {
        uint64_t v9 = *(void *)v30;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v30 != v9) {
              objc_enumerationMutation(obj);
            }
            double v11 = *(void **)(*((void *)&v29 + 1) + 8 * i);
            dispatch_group_enter(v6);
            double v12 = +[GEOMapDataSubscriptionManager sharedManager];
            id v13 = [v11 identifier];
            uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 8);
            v24[0] = MEMORY[0x1E4F143A8];
            v24[1] = 3221225472;
            v24[2] = __83__GEOMapDataSubscriptionExpirationHelper__notifyForIncompatibleVersionsIfNecessary__block_invoke_18;
            v24[3] = &unk_1E53F5F20;
            id v28 = v33;
            id v25 = v7;
            v26 = v11;
            id v27 = v6;
            [v12 fetchStateForSubscriptionWithIdentifier:v13 callbackQueue:v14 completionHandler:v24];
          }
          uint64_t v8 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
        }
        while (v8);
      }

      uint64_t v15 = *(NSObject **)(*(void *)(a1 + 32) + 8);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __83__GEOMapDataSubscriptionExpirationHelper__notifyForIncompatibleVersionsIfNecessary__block_invoke_2_20;
      block[3] = &unk_1E53D79D8;
      id v23 = v7;
      id v16 = v7;
      dispatch_group_notify(v6, v15, block);

      _Block_object_dispose(v33, 8);
      id v5 = v19;
    }
  }
}

unint64_t __83__GEOMapDataSubscriptionExpirationHelper__notifyForIncompatibleVersionsIfNecessary__block_invoke_2(uint64_t a1, void *a2)
{
  return ((unint64_t)[a2 dataTypes] >> 10) & 1;
}

void __83__GEOMapDataSubscriptionExpirationHelper__notifyForIncompatibleVersionsIfNecessary__block_invoke_18(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (v6)
  {
    if ([v6 loadState] == 3) {
      [*(id *)(a1 + 32) addObject:*(void *)(a1 + 40)];
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a3);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __83__GEOMapDataSubscriptionExpirationHelper__notifyForIncompatibleVersionsIfNecessary__block_invoke_2_20(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) count])
  {
    uint64_t v2 = GEOGetSubscriptionExpirationLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      uint64_t v3 = [*(id *)(a1 + 32) count];
      *(_DWORD *)buf = 134217984;
      uint64_t v28 = v3;
      _os_log_impl(&dword_188D96000, v2, OS_LOG_TYPE_INFO, "Asking to display incompatibility notification for %llu subscriptions", buf, 0xCu);
    }

    id v4 = objc_msgSend(*(id *)(a1 + 32), "_geo_map:", &__block_literal_global_24_0);
    id v5 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v6 = *(id *)(a1 + 32);
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
          double v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          double v12 = [v11 displayName];
          uint64_t v13 = [v12 length];

          if (v13)
          {
            uint64_t v14 = [v11 displayName];
            uint64_t v15 = [v11 identifier];
            [v5 setObject:v14 forKeyedSubscript:v15];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v8);
    }

    id v16 = (void *)MEMORY[0x1E4F29268];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __83__GEOMapDataSubscriptionExpirationHelper__notifyForIncompatibleVersionsIfNecessary__block_invoke_2_27;
    v19[3] = &unk_1E53F5F48;
    id v20 = v4;
    id v21 = v5;
    id v17 = v5;
    id v18 = v4;
    objc_msgSend(v16, "geo_withMapsNotificationProviderDaemon:errorHandler:", v19, &__block_literal_global_33);
  }
}

uint64_t __83__GEOMapDataSubscriptionExpirationHelper__notifyForIncompatibleVersionsIfNecessary__block_invoke_21(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

uint64_t __83__GEOMapDataSubscriptionExpirationHelper__notifyForIncompatibleVersionsIfNecessary__block_invoke_2_27(uint64_t a1, void *a2)
{
  return [a2 notifyForIncompatibleOfflineDataVersionsForIdentifiers:*(void *)(a1 + 32) displayNames:*(void *)(a1 + 40) completionHandler:&__block_literal_global_29_1];
}

void __83__GEOMapDataSubscriptionExpirationHelper__notifyForIncompatibleVersionsIfNecessary__block_invoke_3()
{
}

void __83__GEOMapDataSubscriptionExpirationHelper__notifyForIncompatibleVersionsIfNecessary__block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = GEOGetSubscriptionExpirationLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_ERROR, "Could not communicate with notification provider to display notification: %{public}@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)_subscriptionsDidChange:(id)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__GEOMapDataSubscriptionExpirationHelper__subscriptionsDidChange___block_invoke;
  block[3] = &unk_1E53D79D8;
  void block[4] = self;
  dispatch_async(queue, block);
}

void __66__GEOMapDataSubscriptionExpirationHelper__subscriptionsDidChange___block_invoke(uint64_t a1)
{
  -[GEOMapDataSubscriptionExpirationHelper _scheduleExpirationTaskIfNecessary](*(void *)(a1 + 32));
  uint64_t v2 = *(void *)(a1 + 32);

  -[GEOMapDataSubscriptionExpirationHelper _scheduleUpcomingExpirationTaskIfNecessary](v2);
}

- (void)runBackgroundTask:(id)a3 orIdentifier:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  uint64_t v9 = v8;
  if (v8)
  {
    id v10 = [v8 identifier];
  }
  else
  {
    id v10 = v7;
  }
  double v11 = v10;
  if ([v10 isEqualToString:@"com.apple.geod.ExpireSubscription"])
  {
    double v12 = GEOGetSubscriptionExpirationLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_188D96000, v12, OS_LOG_TYPE_INFO, "Asking to expire subscriptions if necessary", buf, 2u);
    }

    queue = self->_queue;
    db = self->_db;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __73__GEOMapDataSubscriptionExpirationHelper_runBackgroundTask_orIdentifier___block_invoke;
    v27[3] = &unk_1E53E33C0;
    id v28 = v9;
    uint64_t v29 = self;
    [(GEOTileDB *)db expireSubscriptionsIfNecessaryWithQueue:queue completionHandler:v27];
    id v15 = v28;
LABEL_14:

    goto LABEL_15;
  }
  if ([v11 isEqualToString:@"com.apple.geod.ExpireSubscription.Upcoming"])
  {
    _nextSubscriptionUpdateRequiredExpirationDate();
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    [v15 timeIntervalSinceNow];
    double v17 = v16;
    double Double = GEOConfigGetDouble(GeoOfflineConfig_UpdateRequiredExpirationNoticeMinIntervalFromNow, (uint64_t)off_1E9115838);
    if (v17 < Double)
    {
      double v21 = Double;
      long long v22 = GEOGetSubscriptionExpirationLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134349056;
        double v31 = v21;
        _os_log_impl(&dword_188D96000, v22, OS_LOG_TYPE_INFO, "Expiration date is either in the past or within the next %{public}.1f seconds. Not displaying upcoming expiration notification", buf, 0xCu);
      }

      [v9 setTaskCompleted];
    }
    else
    {
      char v19 = +[GEOMapDataSubscriptionManager sharedManager];
      id v20 = self->_queue;
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __73__GEOMapDataSubscriptionExpirationHelper_runBackgroundTask_orIdentifier___block_invoke_34;
      v23[3] = &unk_1E53E3230;
      id v24 = v9;
      long long v25 = self;
      id v15 = v15;
      id v26 = v15;
      [v19 fetchAllSubscriptionsWithCallbackQueue:v20 completionHandler:v23];
    }
    goto LABEL_14;
  }
LABEL_15:
}

void __73__GEOMapDataSubscriptionExpirationHelper_runBackgroundTask_orIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [*(id *)(a1 + 32) setTaskCompleted];
  if (v3)
  {
    int v4 = GEOGetSubscriptionExpirationLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 138543362;
      id v6 = v3;
      _os_log_impl(&dword_188D96000, v4, OS_LOG_TYPE_ERROR, "Failed to expire subscriptions: %{public}@", (uint8_t *)&v5, 0xCu);
    }
  }
  else
  {
    -[GEOMapDataSubscriptionExpirationHelper _scheduleExpirationTaskIfNecessary](*(void *)(a1 + 40));
  }
}

void __73__GEOMapDataSubscriptionExpirationHelper_runBackgroundTask_orIdentifier___block_invoke_34(uint64_t a1, void *a2, void *a3)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v19 = a3;
  if ([v4 count])
  {
    id v20 = objc_msgSend(v4, "_geo_filtered:", &__block_literal_global_36_0);
    int v5 = v20;
    if ([v20 count])
    {
      id v6 = dispatch_group_create();
      uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v20, "count"));
      v36[0] = 0;
      v36[1] = v36;
      v36[2] = 0x3032000000;
      v36[3] = __Block_byref_object_copy__100;
      v36[4] = __Block_byref_object_dispose__100;
      id v37 = 0;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id obj = v20;
      uint64_t v8 = [obj countByEnumeratingWithState:&v32 objects:v38 count:16];
      id v18 = v4;
      if (v8)
      {
        uint64_t v9 = *(void *)v33;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v33 != v9) {
              objc_enumerationMutation(obj);
            }
            double v11 = *(void **)(*((void *)&v32 + 1) + 8 * i);
            dispatch_group_enter(v6);
            double v12 = +[GEOMapDataSubscriptionManager sharedManager];
            uint64_t v13 = [v11 identifier];
            uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
            v27[0] = MEMORY[0x1E4F143A8];
            v27[1] = 3221225472;
            v27[2] = __73__GEOMapDataSubscriptionExpirationHelper_runBackgroundTask_orIdentifier___block_invoke_3;
            v27[3] = &unk_1E53F5F20;
            double v31 = v36;
            id v28 = v7;
            uint64_t v29 = v11;
            long long v30 = v6;
            [v12 fetchStateForSubscriptionWithIdentifier:v13 callbackQueue:v14 completionHandler:v27];
          }
          uint64_t v8 = [obj countByEnumeratingWithState:&v32 objects:v38 count:16];
        }
        while (v8);
      }

      id v15 = *(NSObject **)(*(void *)(a1 + 40) + 8);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __73__GEOMapDataSubscriptionExpirationHelper_runBackgroundTask_orIdentifier___block_invoke_4;
      block[3] = &unk_1E53D99F0;
      id v24 = v7;
      id v25 = *(id *)(a1 + 32);
      id v26 = *(id *)(a1 + 48);
      id v16 = v7;
      double v17 = v15;
      id v4 = v18;
      dispatch_group_notify(v6, v17, block);

      _Block_object_dispose(v36, 8);
      int v5 = v20;
    }
    else
    {
      [*(id *)(a1 + 32) setTaskCompleted];
    }
  }
  else
  {
    [*(id *)(a1 + 32) setTaskCompleted];
  }
}

unint64_t __73__GEOMapDataSubscriptionExpirationHelper_runBackgroundTask_orIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  return ((unint64_t)[a2 dataTypes] >> 10) & 1;
}

void __73__GEOMapDataSubscriptionExpirationHelper_runBackgroundTask_orIdentifier___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (v6)
  {
    if ((unint64_t)([v6 loadState] - 1) <= 1) {
      [*(id *)(a1 + 32) addObject:*(void *)(a1 + 40)];
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a3);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __73__GEOMapDataSubscriptionExpirationHelper_runBackgroundTask_orIdentifier___block_invoke_4(id *a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if ([a1[4] count])
  {
    uint64_t v2 = GEOGetSubscriptionExpirationLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_188D96000, v2, OS_LOG_TYPE_INFO, "Asking to display upcoming expiration notification", buf, 2u);
    }

    id v3 = objc_msgSend(a1[4], "_geo_map:", &__block_literal_global_39);
    id v4 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v5 = a1[4];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v24 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          double v11 = [v10 displayName];
          uint64_t v12 = [v11 length];

          if (v12)
          {
            uint64_t v13 = [v10 displayName];
            uint64_t v14 = [v10 identifier];
            [v4 setObject:v13 forKeyedSubscript:v14];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v7);
    }

    id v15 = (void *)MEMORY[0x1E4F29268];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __73__GEOMapDataSubscriptionExpirationHelper_runBackgroundTask_orIdentifier___block_invoke_2_40;
    v19[3] = &unk_1E53F5F70;
    id v20 = v3;
    id v21 = v4;
    id v22 = a1[6];
    id v16 = v4;
    id v17 = v3;
    objc_msgSend(v15, "geo_withMapsNotificationProviderDaemon:errorHandler:", v19, &__block_literal_global_46_1);
    [a1[5] setTaskCompleted];
  }
  else
  {
    id v18 = a1[5];
    [v18 setTaskCompleted];
  }
}

uint64_t __73__GEOMapDataSubscriptionExpirationHelper_runBackgroundTask_orIdentifier___block_invoke_37(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

uint64_t __73__GEOMapDataSubscriptionExpirationHelper_runBackgroundTask_orIdentifier___block_invoke_2_40(void *a1, void *a2)
{
  return [a2 willExpireOfflineSubscriptionsWithIdentifiers:a1[4] displayNames:a1[5] unlessUpdatedByDate:a1[6] completionHandler:&__block_literal_global_43];
}

void __73__GEOMapDataSubscriptionExpirationHelper_runBackgroundTask_orIdentifier___block_invoke_3_41()
{
}

void __73__GEOMapDataSubscriptionExpirationHelper_runBackgroundTask_orIdentifier___block_invoke_4_44(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = GEOGetSubscriptionExpirationLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_ERROR, "Could not communicate with notification provider to display notification: %{public}@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)valueChangedForGEOConfigKey:(id)a3
{
  var1 = a3.var1;
  unsigned int var0 = a3.var0;
  BOOL v6 = a3.var0 == GeoOfflineConfig_OptimizeStorageEnabled && a3.var1 == off_1E91157D8;
  if (v6
    || (a3.var0 == GeoOfflineConfig_OptimizeStorageLastUsedDeleteInterval
      ? (BOOL v7 = a3.var1 == off_1E91157E8)
      : (BOOL v7 = 0),
        v7
     || (a3.var0 == GeoOfflineConfig_OptimizeStorageNeverUsedDeleteInterval
       ? (BOOL v8 = a3.var1 == off_1E91157F8)
       : (BOOL v8 = 0),
         v8
      || ((int v9 = GeoOfflineConfig_UpdateRequiredExpirationInterval,
           id v10 = off_1E9115818,
           a3.var0 == GeoOfflineConfig_UpdateRequiredExpirationInterval)
        ? (BOOL v11 = a3.var1 == off_1E9115818)
        : (BOOL v11 = 0),
          v11))))
  {
    -[GEOMapDataSubscriptionExpirationHelper _scheduleExpirationTaskIfNecessary]((uint64_t)self);
    int v9 = GeoOfflineConfig_UpdateRequiredExpirationInterval;
    id v10 = off_1E9115818;
  }
  BOOL v12 = v9 == var0 && v10 == var1;
  if (v12
    || (var0 == GeoOfflineConfig_UpdateRequiredExpirationNoticeInterval
      ? (BOOL v13 = var1 == off_1E9115828)
      : (BOOL v13 = 0),
        v13
     || (var0 == GeoOfflineConfig_HasNotifiedForUpcomingUpdateRequiredExpiration
       ? (BOOL v14 = var1 == off_1E9115848)
       : (BOOL v14 = 0),
         v14)))
  {
    -[GEOMapDataSubscriptionExpirationHelper _scheduleUpcomingExpirationTaskIfNecessary]((uint64_t)self);
  }
}

- (void)tileDB:(id)a3 didExpireSubscriptions:(id)a4 forReason:(int64_t)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if ([v6 count])
  {
    BOOL v7 = GEOGetSubscriptionExpirationLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v39 = [v6 count];
      _os_log_impl(&dword_188D96000, v7, OS_LOG_TYPE_DEBUG, "Expired %llu subscriptions", buf, 0xCu);
    }

    notify_post(GEOMapDataSubscriptionManagerSubscriptionsDidChangeDarwinNotification);
    notify_post(GEOMapDataSubscriptionManagerFullyDownloadedSubscriptionsDidChangeDarwinNotification);
    unint64_t v8 = a5 - 2;
    if ((unint64_t)(a5 - 2) <= 4)
    {
      int v9 = objc_msgSend(v6, "_geo_filtered:", &__block_literal_global_48_0);
      if ([v9 count])
      {
        id v10 = [MEMORY[0x1E4F1CA60] dictionary];
        BOOL v11 = [MEMORY[0x1E4F1CA48] array];
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        id v28 = v9;
        id v12 = v9;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v33 objects:v37 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v34;
          do
          {
            for (uint64_t i = 0; i != v14; ++i)
            {
              if (*(void *)v34 != v15) {
                objc_enumerationMutation(v12);
              }
              id v17 = *(void **)(*((void *)&v33 + 1) + 8 * i);
              id v18 = objc_msgSend(v17, "identifier", v28);
              [v11 addObject:v18];

              id v19 = [v17 displayName];

              if (v19)
              {
                id v20 = [v17 displayName];
                id v21 = [v17 identifier];
                [v10 setObject:v20 forKey:v21];
              }
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v33 objects:v37 count:16];
          }
          while (v14);
        }

        if (v8 > 4) {
          uint64_t v22 = 0;
        }
        else {
          uint64_t v22 = qword_18A640CB0[v8];
        }
        long long v23 = GEOGetSubscriptionExpirationLog();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          uint64_t v24 = [v11 count];
          *(_DWORD *)buf = 134217984;
          uint64_t v39 = v24;
          _os_log_impl(&dword_188D96000, v23, OS_LOG_TYPE_INFO, "Asking to display expiration notification for %llu subscriptions", buf, 0xCu);
        }

        long long v25 = (void *)MEMORY[0x1E4F29268];
        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = __82__GEOMapDataSubscriptionExpirationHelper_tileDB_didExpireSubscriptions_forReason___block_invoke_49;
        v29[3] = &unk_1E53ED170;
        id v30 = v11;
        id v31 = v10;
        uint64_t v32 = v22;
        id v26 = v10;
        id v27 = v11;
        objc_msgSend(v25, "geo_withMapsNotificationProviderDaemon:errorHandler:", v29, &__block_literal_global_51_0);

        int v9 = v28;
      }
    }
  }
}

unint64_t __82__GEOMapDataSubscriptionExpirationHelper_tileDB_didExpireSubscriptions_forReason___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 policy] == 1) {
    unint64_t v3 = ((unint64_t)[v2 dataTypes] >> 10) & 1;
  }
  else {
    unint64_t v3 = 0;
  }

  return v3;
}

uint64_t __82__GEOMapDataSubscriptionExpirationHelper_tileDB_didExpireSubscriptions_forReason___block_invoke_49(void *a1, void *a2)
{
  return [a2 expiredOfflineSubscriptions:a1[4] withDisplayNames:a1[5] forReason:a1[6]];
}

void __82__GEOMapDataSubscriptionExpirationHelper_tileDB_didExpireSubscriptions_forReason___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  unint64_t v3 = GEOGetSubscriptionExpirationLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_ERROR, "Could not communicate with notification provider to display notification: %{public}@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)offlineDataConfiguration:(id)a3 didChangeActiveVersions:(id)a4
{
  -[GEOMapDataSubscriptionExpirationHelper _scheduleExpirationTaskIfNecessary]((uint64_t)self);
  -[GEOMapDataSubscriptionExpirationHelper _scheduleUpcomingExpirationTaskIfNecessary]((uint64_t)self);
  if (GEOConfigGetBOOL(GeoOfflineConfig_HasNotifiedForIncompatibleVersions, (uint64_t)off_1E9115A28))
  {
    _setValue(GeoOfflineConfig_HasNotifiedForIncompatibleVersions, (uint64_t)off_1E9115A28, 0, 0, 0);
    id v5 = (void *)MEMORY[0x1E4F29268];
    objc_msgSend(v5, "geo_withMapsNotificationProviderDaemon:errorHandler:", &__block_literal_global_53_1, &__block_literal_global_55_3);
  }
}

uint64_t __91__GEOMapDataSubscriptionExpirationHelper_offlineDataConfiguration_didChangeActiveVersions___block_invoke(uint64_t a1, void *a2)
{
  return [a2 clearIncompatibleOfflineDataNotification];
}

void __91__GEOMapDataSubscriptionExpirationHelper_offlineDataConfiguration_didChangeActiveVersions___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  unint64_t v3 = GEOGetSubscriptionExpirationLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_ERROR, "Could not communicate with notification provider to clear notification: %{public}@", (uint8_t *)&v4, 0xCu);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_db, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end