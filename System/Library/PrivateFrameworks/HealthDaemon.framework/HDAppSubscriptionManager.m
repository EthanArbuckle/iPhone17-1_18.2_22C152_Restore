@interface HDAppSubscriptionManager
- (BOOL)unitTesting_isAwaitingLaunchForBundleID:(id)a3 dataTypeCode:(int64_t)a4;
- (BOOL)unitTesting_isObservingDataTypeCode:(int64_t)a3;
- (HDAppSubscriptionManager)init;
- (HDAppSubscriptionManager)initWithProfile:(id)a3;
- (id)_activityNameForSubscription:(void *)a1 anchor:(void *)a2;
- (id)_updateOrCreateSubscription:(void *)a1 value:(void *)a2 type:(uint64_t)a3;
- (id)unitTesting_backgroundAppRefreshStatusGenerator;
- (id)unitTesting_didUpdateObservingDataTypeCode;
- (id)unitTesting_launchEventHandler;
- (void)_isBackgroundAppRefreshDisabledForBundleIdentifier:(id)a3 completion:(id)a4;
- (void)_queue_addPendingLaunchForSubscription:(uint64_t)a3 anchor:;
- (void)_queue_scheduleLaunches:(void *)a3 anchor:(uint64_t)a4 type:;
- (void)_removeLaunchForSubscription:(uint64_t)a1 anchor:(void *)a2;
- (void)ackForBundleID:(id)a3 dataTypes:(id)a4 anchor:(id)a5 ackTime:(id)a6;
- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4;
- (void)dealloc;
- (void)profileDidBecomeReady:(id)a3;
- (void)removeBundleID:(id)a3;
- (void)removeSubscriptionForBundleID:(id)a3 dataCode:(int64_t)a4;
- (void)setAnchor:(id)a3 forDataCode:(int64_t)a4 type:(int64_t)a5;
- (void)setUnitTesting_backgroundAppRefreshStatusGenerator:(id)a3;
- (void)setUnitTesting_didUpdateObservingDataTypeCode:(id)a3;
- (void)setUnitTesting_launchEventHandler:(id)a3;
- (void)subscribeForBundleID:(id)a3 dataCode:(int64_t)a4 frequencyInSeconds:(unint64_t)a5 appSDKVersionToken:(unint64_t)a6;
- (void)unitTesting_synchronizeWithQueue;
@end

@implementation HDAppSubscriptionManager

- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_launchQueue);
  if (v4)
  {
    v6 = +[HDMutableDatabaseTransactionContext contextForWriting];
    v7 = (void *)[v6 mutableCopy];

    [v7 setCacheScope:1];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    v9 = [WeakRetained database];
    v13[4] = self;
    id v14 = 0;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __69__HDAppSubscriptionManager_database_protectedDataDidBecomeAvailable___block_invoke;
    v13[3] = &unk_1E62F6130;
    char v10 = [v9 performTransactionWithContext:v7 error:&v14 block:v13 inaccessibilityHandler:0];
    id v11 = v14;

    if ((v10 & 1) == 0)
    {
      _HKInitializeLogging();
      v12 = *MEMORY[0x1E4F29F00];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F00], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v16 = v11;
        _os_log_error_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_ERROR, "Failed to update scheduled launch times: %{public}@", buf, 0xCu);
      }
    }
  }
}

uint64_t __69__HDAppSubscriptionManager_database_protectedDataDidBecomeAvailable___block_invoke(uint64_t a1)
{
  v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 64) copy];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __69__HDAppSubscriptionManager_database_protectedDataDidBecomeAvailable___block_invoke_2;
  v4[3] = &unk_1E62FCF00;
  v4[4] = *(void *)(a1 + 32);
  [v2 enumerateKeysAndObjectsUsingBlock:v4];

  return 1;
}

- (HDAppSubscriptionManager)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HDAppSubscriptionManager)initWithProfile:(id)a3
{
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)HDAppSubscriptionManager;
  v5 = [(HDAppSubscriptionManager *)&v35 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    uint64_t v7 = HKCreateSerialDispatchQueue();
    launchQueue = v6->_launchQueue;
    v6->_launchQueue = (OS_dispatch_queue *)v7;

    uint64_t v9 = [MEMORY[0x1E4F1CA60] dictionary];
    pendingTypeCodesToAnchors = v6->_pendingTypeCodesToAnchors;
    v6->_pendingTypeCodesToAnchors = (NSMutableDictionary *)v9;

    id v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    observedDataTypeCodes = v6->_observedDataTypeCodes;
    v6->_observedDataTypeCodes = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    outstandingLaunchesByBundleIdentifier = v6->_outstandingLaunchesByBundleIdentifier;
    v6->_outstandingLaunchesByBundleIdentifier = v13;

    uint64_t v15 = [MEMORY[0x1E4F1CA60] dictionary];
    launchTimers = v6->_launchTimers;
    v6->_launchTimers = (NSMutableDictionary *)v15;

    uint64_t v17 = [MEMORY[0x1E4F1CA60] dictionary];
    launchTimerLaunchTimes = v6->_launchTimerLaunchTimes;
    v6->_launchTimerLaunchTimes = (NSMutableDictionary *)v17;

    v19 = [v4 daemon];
    uint64_t v20 = [v19 backgroundTaskScheduler];
    backgroundTaskScheduler = v6->_backgroundTaskScheduler;
    v6->_backgroundTaskScheduler = (HDBackgroundTaskScheduler *)v20;

    v22 = objc_alloc_init(HDBackgroundAppLauncher);
    backgroundAppLauncher = v6->_backgroundAppLauncher;
    v6->_backgroundAppLauncher = v22;

    objc_initWeak(&location, v6);
    v24 = v6->_backgroundTaskScheduler;
    uint64_t v29 = MEMORY[0x1E4F143A8];
    uint64_t v30 = 3221225472;
    v31 = __44__HDAppSubscriptionManager_initWithProfile___block_invoke;
    v32 = &unk_1E62FCDC0;
    objc_copyWeak(&v33, &location);
    [(HDBackgroundTaskScheduler *)v24 registerClientWithName:@"HDAppSubscriptionManager" taskHandler:&v29];
    id WeakRetained = objc_loadWeakRetained((id *)&v6->_profile);
    objc_msgSend(WeakRetained, "registerProfileReadyObserver:queue:", v6, v6->_launchQueue, v29, v30, v31, v32);

    id v26 = objc_loadWeakRetained((id *)&v6->_profile);
    v27 = [v26 database];
    [v27 addProtectedDataObserver:v6 queue:v6->_launchQueue];

    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
  }

  return v6;
}

void __44__HDAppSubscriptionManager_initWithProfile___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v4 = v3;
  if (WeakRetained)
  {
    _HKInitializeLogging();
    v5 = *MEMORY[0x1E4F29F00];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F00], OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v4;
      _os_log_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_DEFAULT, "Background task job %{public}@ has fired!", (uint8_t *)&buf, 0xCu);
    }
    v6 = WeakRetained[7];
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    uint64_t v9 = __57__HDAppSubscriptionManager__backgroundTaskFiredWithName___block_invoke;
    char v10 = &unk_1E62F31C0;
    id v11 = WeakRetained;
    id v12 = v4;
    dispatch_async(v6, &buf);
  }
}

- (void)profileDidBecomeReady:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_initWeak(&location, self);
  launchQueue = self->_launchQueue;
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __50__HDAppSubscriptionManager_profileDidBecomeReady___block_invoke;
  handler[3] = &unk_1E62F3490;
  objc_copyWeak(&v11, &location);
  notify_register_dispatch("kKeepAppsUpToDateEnabledChangedNotification", &self->_backgroundAppRefreshNotifyToken, launchQueue, handler);
  self->_shouldScheduleLaunches = HDCheckAutomaticAppUpdatesAllowed();
  _HKInitializeLogging();
  v6 = *MEMORY[0x1E4F29F00];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F00], OS_LOG_TYPE_DEFAULT))
  {
    if (self->_shouldScheduleLaunches) {
      uint64_t v7 = @"YES";
    }
    else {
      uint64_t v7 = @"NO";
    }
    *(_DWORD *)long long buf = 138543362;
    id v14 = v7;
    _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_DEFAULT, "Setting should schedule launches %{public}@", buf, 0xCu);
  }
  v8 = self->_launchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__HDAppSubscriptionManager_profileDidBecomeReady___block_invoke_311;
  block[3] = &unk_1E62F3208;
  block[4] = self;
  dispatch_async(v8, block);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __50__HDAppSubscriptionManager_profileDidBecomeReady___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[24] = HDCheckAutomaticAppUpdatesAllowed();
    _HKInitializeLogging();
    v2 = *MEMORY[0x1E4F29F00];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F00], OS_LOG_TYPE_DEFAULT))
    {
      if (WeakRetained[24]) {
        id v3 = @"YES";
      }
      else {
        id v3 = @"NO";
      }
      int v4 = 138543362;
      v5 = v3;
      _os_log_impl(&dword_1BCB7D000, v2, OS_LOG_TYPE_DEFAULT, "Updating should schedule launches %{public}@", (uint8_t *)&v4, 0xCu);
    }
    -[HDAppSubscriptionManager _queue_scheduleLaunches:anchor:type:]((uint64_t)WeakRetained, -1, 0, 0);
  }
}

- (void)_queue_scheduleLaunches:(void *)a3 anchor:(uint64_t)a4 type:
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (a1)
  {
    if (*(unsigned char *)(a1 + 24))
    {
      if (HDBackgroundObservationSupportedForDataTypeCode(a2))
      {
        if (a2 < 0
          || (v8 = *(void **)(a1 + 8),
              [NSNumber numberWithInteger:a2],
              uint64_t v9 = objc_claimAutoreleasedReturnValue(),
              LOBYTE(v8) = [v8 containsObject:v9],
              v9,
              (v8 & 1) != 0))
        {
          id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          *(void *)&long long buf = MEMORY[0x1E4F143A8];
          *((void *)&buf + 1) = 3221225472;
          v80 = __93__HDAppSubscriptionManager__updateObservationStatusForDataTypeCode_lastAppLaunchTimes_error___block_invoke;
          v81 = &unk_1E62F6600;
          uint64_t v62 = a1;
          uint64_t v82 = a1;
          uint64_t v85 = a2;
          id v12 = v11;
          id v83 = v12;
          id v13 = v10;
          id v84 = v13;
          id v14 = 0;
          if (HKWithAutoreleasePool()) {
            id v14 = (void *)[v12 copy];
          }

          id v15 = 0;
          id v16 = v15;
          if (!v14)
          {
            v28 = &unk_1F17EB6D0;
            if (v7) {
              v28 = v7;
            }
            id v29 = v15;
            uint64_t v30 = *(void **)(a1 + 64);
            v31 = NSNumber;
            id v32 = v28;
            id v33 = [v31 numberWithInteger:a2];
            v34 = [v30 objectForKeyedSubscript:v33];
            objc_super v35 = -[HDAppSubscriptionManager _updateOrCreateSubscription:value:type:](v34, v32, a4);

            v36 = *(void **)(v62 + 64);
            id v16 = v29;
            v37 = [NSNumber numberWithInteger:a2];
            [v36 setObject:v35 forKeyedSubscript:v37];

            _HKInitializeLogging();
            v38 = *MEMORY[0x1E4F29F00];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F00], OS_LOG_TYPE_ERROR))
            {
              LODWORD(buf) = 138543362;
              *(void *)((char *)&buf + 4) = v16;
              _os_log_error_impl(&dword_1BCB7D000, v38, OS_LOG_TYPE_ERROR, "Failed to look up app subscriptions: %{public}@", (uint8_t *)&buf, 0xCu);
            }
            goto LABEL_43;
          }
          if (![v14 count])
          {
LABEL_43:

            goto LABEL_44;
          }
          uint64_t v60 = a2;
          if (!_HKValidDataTypeCode())
          {
            _HKInitializeLogging();
            v39 = *MEMORY[0x1E4F29F00];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F00], OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(buf) = 0;
              _os_log_impl(&dword_1BCB7D000, v39, OS_LOG_TYPE_DEFAULT, "Scheduling launches for all data codes.", (uint8_t *)&buf, 2u);
            }
            goto LABEL_32;
          }
          uint64_t v17 = [MEMORY[0x1E4F2B2C0] dataTypeWithCode:a2];
          v18 = [v17 identifier];
          _HKInitializeLogging();
          v19 = *MEMORY[0x1E4F29F00];
          BOOL v20 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F00], OS_LOG_TYPE_DEFAULT);
          if (v18)
          {
            if (v20)
            {
              LODWORD(buf) = 138412290;
              *(void *)((char *)&buf + 4) = v18;
              v21 = "Scheduling launches for %@";
LABEL_30:
              _os_log_impl(&dword_1BCB7D000, v19, OS_LOG_TYPE_DEFAULT, v21, (uint8_t *)&buf, 0xCu);
            }
          }
          else if (v20)
          {
            LODWORD(buf) = 134217984;
            *(void *)((char *)&buf + 4) = a2;
            v21 = "Scheduling launches for %lu";
            goto LABEL_30;
          }

LABEL_32:
          v57 = v16;
          v58 = v14;
          id v40 = v14;
          id v59 = v13;
          id v55 = v13;
          id v61 = v7;
          id v56 = v7;
          v41 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v40, "count"));
          v42 = dispatch_group_create();
          long long v75 = 0u;
          long long v76 = 0u;
          long long v77 = 0u;
          long long v78 = 0u;
          id obj = v40;
          uint64_t v43 = [obj countByEnumeratingWithState:&v75 objects:&buf count:16];
          if (v43)
          {
            uint64_t v44 = v43;
            uint64_t v45 = *(void *)v76;
            do
            {
              for (uint64_t i = 0; i != v44; ++i)
              {
                if (*(void *)v76 != v45) {
                  objc_enumerationMutation(obj);
                }
                v47 = *(void **)(*((void *)&v75 + 1) + 8 * i);
                v48 = objc_msgSend(v47, "bundleIdentifier", v55, v56);
                id WeakRetained = objc_loadWeakRetained((id *)(v62 + 32));
                +[HDAppSubscriptionAppLaunchEntity appSDKVersionTokenForBundleID:v48 profile:WeakRetained error:0];

                if (dyld_version_token_at_least())
                {
                  dispatch_group_enter(v42);
                  v70[0] = MEMORY[0x1E4F143A8];
                  v70[1] = 3221225472;
                  v70[2] = __107__HDAppSubscriptionManager__updateSubscriptionsBasedOnBARSwitchState_lastLaunchTimes_dataCode_anchor_type___block_invoke;
                  v70[3] = &unk_1E62FCDE8;
                  id v71 = v41;
                  v72 = v47;
                  id v50 = v48;
                  id v73 = v50;
                  v74 = v42;
                  [(id)v62 _isBackgroundAppRefreshDisabledForBundleIdentifier:v50 completion:v70];
                }
                else
                {
                  [v41 addObject:v47];
                }
              }
              uint64_t v44 = [obj countByEnumeratingWithState:&v75 objects:&buf count:16];
            }
            while (v44);
          }

          v51 = *(NSObject **)(v62 + 56);
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __107__HDAppSubscriptionManager__updateSubscriptionsBasedOnBARSwitchState_lastLaunchTimes_dataCode_anchor_type___block_invoke_316;
          block[3] = &unk_1E62FCE10;
          block[4] = v62;
          id v65 = v41;
          id v52 = v55;
          id v66 = v52;
          uint64_t v68 = v60;
          id v53 = v56;
          id v67 = v53;
          uint64_t v69 = a4;
          id v54 = v41;
          dispatch_group_notify(v42, v51, block);

          id v7 = v61;
          id v14 = v58;
          id v13 = v59;
          id v16 = v57;
          goto LABEL_43;
        }
        _HKInitializeLogging();
        v27 = *MEMORY[0x1E4F29F00];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F00], OS_LOG_TYPE_INFO))
        {
          LODWORD(buf) = 134217984;
          *(void *)((char *)&buf + 4) = a2;
          v23 = "Ignoring scheduling launches for unobserved type %ld";
          goto LABEL_20;
        }
      }
      else
      {
        _HKInitializeLogging();
        v27 = *MEMORY[0x1E4F29F00];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F00], OS_LOG_TYPE_INFO))
        {
          LODWORD(buf) = 134217984;
          *(void *)((char *)&buf + 4) = a2;
          v23 = "Ignoring scheduling launches for unsupported type %ld";
LABEL_20:
          v24 = v27;
          os_log_type_t v25 = OS_LOG_TYPE_INFO;
          uint32_t v26 = 12;
          goto LABEL_21;
        }
      }
    }
    else
    {
      _HKInitializeLogging();
      v22 = *MEMORY[0x1E4F29F00];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F00], OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        v23 = "Not scheduling launches";
        v24 = v22;
        os_log_type_t v25 = OS_LOG_TYPE_DEFAULT;
        uint32_t v26 = 2;
LABEL_21:
        _os_log_impl(&dword_1BCB7D000, v24, v25, v23, (uint8_t *)&buf, v26);
      }
    }
  }
LABEL_44:
}

void __50__HDAppSubscriptionManager_profileDidBecomeReady___block_invoke_311(uint64_t a1)
{
}

void __107__HDAppSubscriptionManager__updateSubscriptionsBasedOnBARSwitchState_lastLaunchTimes_dataCode_anchor_type___block_invoke(uint64_t a1, char a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    _HKInitializeLogging();
    id v3 = *MEMORY[0x1E4F29F00];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F00], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 48);
      int v5 = 138543362;
      uint64_t v6 = v4;
      _os_log_impl(&dword_1BCB7D000, v3, OS_LOG_TYPE_DEFAULT, "BAR is disabled for app: %{public}@", (uint8_t *)&v5, 0xCu);
    }
  }
  else
  {
    [*(id *)(a1 + 32) addObject:*(void *)(a1 + 40)];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __107__HDAppSubscriptionManager__updateSubscriptionsBasedOnBARSwitchState_lastLaunchTimes_dataCode_anchor_type___block_invoke_316(uint64_t a1)
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(a1 + 48);
  id v3 = *(void **)(a1 + 56);
  uint64_t v66 = *(void *)(a1 + 64);
  uint64_t v64 = *(void *)(a1 + 72);
  id v61 = *(id *)(a1 + 40);
  id v67 = v2;
  id v70 = v3;
  if (!v1) {
    goto LABEL_55;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(v1 + 32));
  if (!WeakRetained) {
    goto LABEL_54;
  }
  uint64_t v71 = v1;
  id v60 = WeakRetained;
  int v5 = [WeakRetained daemon];
  uint64_t v62 = [v5 contentProtectionManager];

  time_t v69 = time(0);
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  id obj = v61;
  uint64_t v68 = [obj countByEnumeratingWithState:&v78 objects:v84 count:16];
  if (!v68) {
    goto LABEL_53;
  }
  uint64_t v65 = *(void *)v79;
  do
  {
    for (uint64_t i = 0; i != v68; ++i)
    {
      if (*(void *)v79 != v65) {
        objc_enumerationMutation(obj);
      }
      uint64_t v7 = *(void **)(*((void *)&v78 + 1) + 8 * i);
      v8 = [v7 bundleIdentifier];
      uint64_t v9 = [v67 objectForKeyedSubscript:v8];
      _HKInitializeLogging();
      id v10 = (void *)*MEMORY[0x1E4F29F00];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F00], OS_LOG_TYPE_INFO))
      {
        id v11 = v10;
        id v12 = -[HDAppSubscriptionManager _activityNameForSubscription:anchor:](v7, v70);
        *(_DWORD *)long long buf = 138412290;
        *(void *)&uint8_t buf[4] = v12;
        _os_log_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_INFO, "Setting next launch time for %@", buf, 0xCu);
      }
      _HKInitializeLogging();
      id v13 = (void *)*MEMORY[0x1E4F29F00];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F00], OS_LOG_TYPE_INFO))
      {
        id v14 = v13;
        uint64_t v15 = [v7 lastAckTime];
        uint64_t v16 = [v7 updateFrequency];
        *(_DWORD *)long long buf = 134218240;
        *(void *)&uint8_t buf[4] = v15;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v16;
        _os_log_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_INFO, "Last Ack: %lld - Update Freq: %lld", buf, 0x16u);
      }
      _HKInitializeLogging();
      uint64_t v17 = (void *)*MEMORY[0x1E4F29F00];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F00], OS_LOG_TYPE_INFO))
      {
        v18 = v17;
        uint64_t v19 = [v9 longLongValue];
        uint64_t v20 = [v7 launchTimeHysteresis];
        *(_DWORD *)long long buf = 134218240;
        *(void *)&uint8_t buf[4] = v19;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v20;
        _os_log_impl(&dword_1BCB7D000, v18, OS_LOG_TYPE_INFO, "Last Launch: %lld - Hyst: %lld", buf, 0x16u);
      }
      uint64_t v21 = [v7 lastAckTime];
      uint64_t v22 = [v7 updateFrequency];
      uint64_t v23 = [v9 longLongValue];
      uint64_t v24 = [v7 launchTimeHysteresis];
      if (v22 + v21 <= (unint64_t)(v24 + v23)) {
        uint64_t v25 = v24 + v23;
      }
      else {
        uint64_t v25 = v22 + v21;
      }
      _HKInitializeLogging();
      uint32_t v26 = *MEMORY[0x1E4F29F00];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F00], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 134218496;
        *(void *)&uint8_t buf[4] = v25;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v69;
        *(_WORD *)&buf[22] = 2048;
        uint64_t v83 = v25 - v69;
        _os_log_impl(&dword_1BCB7D000, v26, OS_LOG_TYPE_DEFAULT, "Next Launch: %lld - Now: %lld - Time Diff: %lld seconds", buf, 0x20u);
      }
      if (_HDIsUnitTesting || v25 <= v69)
      {
        if (![v62 isProtectedDataAvailable])
        {
          _HKInitializeLogging();
          v51 = *MEMORY[0x1E4F29F00];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F00], OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl(&dword_1BCB7D000, v51, OS_LOG_TYPE_DEFAULT, "Adding code to pending type codes", buf, 2u);
          }
          id v52 = *(void **)(v71 + 64);
          id v27 = [NSNumber numberWithInteger:v66];
          v28 = [v52 objectForKeyedSubscript:v27];
          uint64_t v30 = -[HDAppSubscriptionManager _updateOrCreateSubscription:value:type:](v28, v70, v64);
          id v53 = *(void **)(v71 + 64);
          v34 = [NSNumber numberWithInteger:v66];
          [v53 setObject:v30 forKeyedSubscript:v34];
          goto LABEL_50;
        }
        id v27 = v7;
        v28 = v70;
        uint64_t v30 = -[HDAppSubscriptionManager _activityNameForSubscription:anchor:](v27, v28);
        _HKInitializeLogging();
        v36 = *MEMORY[0x1E4F29F00];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F00], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412290;
          *(void *)&uint8_t buf[4] = v30;
          _os_log_impl(&dword_1BCB7D000, v36, OS_LOG_TYPE_DEFAULT, "Scheduling subscription %@ for launch", buf, 0xCu);
        }
        uint64_t v37 = v71;
        if (_HDIsUnitTesting)
        {
          -[HDAppSubscriptionManager _queue_addPendingLaunchForSubscription:anchor:](v71, v27, (uint64_t)v28);
          uint64_t v37 = v71;
          uint64_t v38 = *(void *)(v71 + 104);
          if (v38)
          {
            v39 = [v27 bundleIdentifier];
            (*(void (**)(uint64_t, void *, uint64_t))(v38 + 16))(v38, v39, 1);

            uint64_t v37 = v71;
          }
        }
        id v40 = [*(id *)(v37 + 48) taskWithName:v30 forClientNamed:@"HDAppSubscriptionManager"];
        v34 = v40;
        if (v40)
        {
          int v41 = [v40 taskExpired];
          double Current = CFAbsoluteTimeGetCurrent();
          double v43 = CFAbsoluteTimeGetCurrent();
          uint64_t v44 = [v34 endDate];
          [v44 timeIntervalSinceReferenceDate];
          double v46 = v45;

          double v47 = Current + 1.0;
          if (v47 > v46) {
            int v48 = (v46 > v43) & ~v41;
          }
          else {
            int v48 = 0;
          }
          _HKInitializeLogging();
          v49 = *MEMORY[0x1E4F29F00];
          BOOL v50 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F00], OS_LOG_TYPE_DEFAULT);
          if (v48)
          {
            if (v50)
            {
              *(_DWORD *)long long buf = 134218240;
              *(double *)&uint8_t buf[4] = v46 - v43;
              *(_WORD *)&buf[12] = 2048;
              *(double *)&buf[14] = v47 - v43;
              _os_log_impl(&dword_1BCB7D000, v49, OS_LOG_TYPE_DEFAULT, "Not rescheduling: Job already scheduled to fire in %f vs our %f", buf, 0x16u);
            }
            goto LABEL_50;
          }
          if (v50)
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl(&dword_1BCB7D000, v49, OS_LOG_TYPE_DEFAULT, "Removing stale job.", buf, 2u);
          }
          [*(id *)(v71 + 48) removeTaskWithName:v30 forClientNamed:@"HDAppSubscriptionManager"];
        }
        double v54 = CFAbsoluteTimeGetCurrent();
        double v55 = v54 + 1.0;
        if (v54 >= v54 + 1.0 + -60.0) {
          double v56 = v54;
        }
        else {
          double v56 = v54 + 1.0 + -60.0;
        }
        v57 = objc_alloc_init(HDBackgroundTask);
        v58 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v56];
        [(HDBackgroundTask *)v57 setStartDate:v58];

        id v59 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v55];
        [(HDBackgroundTask *)v57 setEndDate:v59];

        [(HDBackgroundTask *)v57 setAllowsPowerOptimizedScheduling:1];
        [*(id *)(v71 + 48) addTask:v57 withName:v30 forClientNamed:@"HDAppSubscriptionManager"];
      }
      else
      {
        id v27 = [NSNumber numberWithInteger:v66];
        v28 = [*(id *)(v71 + 72) objectForKeyedSubscript:v27];
        id v29 = [*(id *)(v71 + 80) objectForKeyedSubscript:v27];
        uint64_t v30 = v29;
        if (v28)
        {
          if ([v29 longLongValue] <= v25) {
            goto LABEL_51;
          }
          dispatch_source_cancel(v28);
        }
        _HKInitializeLogging();
        v31 = *MEMORY[0x1E4F29F00];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F00], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 134349056;
          *(void *)&uint8_t buf[4] = v25 - v69;
          _os_log_impl(&dword_1BCB7D000, v31, OS_LOG_TYPE_DEFAULT, "Setting timer with interval %{public}lld", buf, 0xCu);
        }
        id v32 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, *(dispatch_queue_t *)(v71 + 56));
        dispatch_time_t v33 = dispatch_walltime(0, 0);
        dispatch_source_set_timer(v32, v33, 1000000000 * (v25 - v69), 0x1DCD6500uLL);
        *(void *)long long buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x2020000000;
        uint64_t v83 = 0;
        handler[0] = MEMORY[0x1E4F143A8];
        handler[1] = 3221225472;
        handler[2] = __112__HDAppSubscriptionManager__queue_scheduleLaunchesForAllowedSubscriptions_lastLaunchTimes_dataCode_anchor_type___block_invoke;
        handler[3] = &unk_1E62FCE60;
        long long v76 = buf;
        void handler[4] = v71;
        v34 = v32;
        id v73 = v34;
        id v27 = v27;
        id v74 = v27;
        id v75 = v70;
        uint64_t v77 = v64;
        dispatch_source_set_event_handler(v34, handler);
        dispatch_resume(v34);
        [*(id *)(v71 + 72) setObject:v34 forKeyedSubscript:v27];
        objc_super v35 = [NSNumber numberWithLongLong:v25];
        [*(id *)(v71 + 80) setObject:v35 forKeyedSubscript:v27];

        _Block_object_dispose(buf, 8);
      }
LABEL_50:

LABEL_51:
    }
    uint64_t v68 = [obj countByEnumeratingWithState:&v78 objects:v84 count:16];
  }
  while (v68);
LABEL_53:

  id WeakRetained = v60;
LABEL_54:

LABEL_55:
}

- (void)_isBackgroundAppRefreshDisabledForBundleIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, uint64_t))a4;
  if (self && (HDCheckAutomaticAppUpdatesAllowed() & 1) == 0)
  {
    v7[2](v7, 1);
  }
  else
  {
    v8 = [MEMORY[0x1E4F5FA50] sharedScheduler];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __90__HDAppSubscriptionManager__isBackgroundAppRefreshDisabledForBundleIdentifier_completion___block_invoke;
    v9[3] = &unk_1E62FCE38;
    id v10 = v7;
    [v8 backgroundAppRefreshEnabledForApp:v6 withHandler:v9];
  }
}

uint64_t __90__HDAppSubscriptionManager__isBackgroundAppRefreshDisabledForBundleIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  notify_cancel(self->_backgroundAppRefreshNotifyToken);
  self->_backgroundAppRefreshNotifyToken = 0;
  v4.receiver = self;
  v4.super_class = (Class)HDAppSubscriptionManager;
  [(HDAppSubscriptionManager *)&v4 dealloc];
}

void __57__HDAppSubscriptionManager__backgroundTaskFiredWithName___block_invoke(uint64_t a1)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  objc_super v4 = v3;
  if (v2
    && (uint64_t v5 = [v3 rangeOfString:@"com.apple.healthd.scheduled."], v5 != 0x7FFFFFFFFFFFFFFFLL))
  {
    uint64_t v9 = [v4 substringFromIndex:v5 + v6];

    uint64_t v10 = [v9 rangeOfString:@"."];
    if (v10 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v7 = 0;
      v8 = 0;
    }
    else
    {
      uint64_t v12 = v10;
      uint64_t v13 = v11;
      id v14 = [v9 substringToIndex:v10];
      uint64_t v15 = [v9 substringFromIndex:v12 + v13];
      if (v14 && (uint64_t v16 = [v14 rangeOfString:@"|"], v16 != 0x7FFFFFFFFFFFFFFFLL))
      {
        uint64_t v19 = v16;
        uint64_t v20 = v17;
        uint64_t v48 = [v14 substringToIndex:v16];
        uint64_t v21 = (void *)[objc_alloc(MEMORY[0x1E4F28FE8]) initWithString:v48];
        *(void *)&long long buf = 0;
        v18 = 0;
        if ([v21 scanInteger:&buf])
        {
          v18 = [MEMORY[0x1E4F2B2C0] dataTypeWithCode:(void)buf];
        }
        uint64_t v22 = [v14 substringFromIndex:v19 + v20];
        uint64_t v23 = (void *)[objc_alloc(MEMORY[0x1E4F28FE8]) initWithString:v22];

        uint64_t v49 = 0;
        id v7 = 0;
        if ([v23 scanInteger:&v49])
        {
          uint64_t v24 = (void *)v48;
          if ((v49 & 0x8000000000000000) == 0)
          {
            objc_msgSend(NSNumber, "numberWithInteger:");
            id v7 = (id)objc_claimAutoreleasedReturnValue();
          }
        }
        else
        {
          uint64_t v24 = (void *)v48;
        }
      }
      else
      {
        id v7 = 0;
        v18 = 0;
      }
      if ([v15 length]) {
        BOOL v25 = v18 == 0;
      }
      else {
        BOOL v25 = 1;
      }
      if (v25)
      {
        v8 = 0;
      }
      else
      {
        uint64_t v26 = [v18 code];
        id WeakRetained = objc_loadWeakRetained((id *)(v2 + 32));
        v8 = +[HDAppSubscriptionEntity subscriptionForBundleID:v15 dataCode:v26 profile:WeakRetained error:0];
      }
    }
  }
  else
  {
    id v7 = 0;
    v8 = 0;
    uint64_t v9 = v4;
  }

  id v28 = v7;
  if (v8)
  {
    uint64_t v29 = *(void *)(a1 + 32);
    id v30 = v8;
    id v31 = v28;
    if (v29)
    {
      id v32 = [v30 bundleIdentifier];
      id v33 = objc_loadWeakRetained((id *)(v29 + 32));
      v34 = [v33 daemon];
      objc_super v35 = [v34 behavior];
      int v36 = [v35 isAppleInternalInstall];

      if (v36)
      {
        uint64_t v37 = NSString;
        uint64_t v38 = objc_msgSend(MEMORY[0x1E4F2B2C0], "dataTypeWithCode:", objc_msgSend(v30, "dataCode"));
        id v39 = [v37 stringWithFormat:@"%@ for %@ (anchor: %@)", v32, v38, v31];
      }
      else
      {
        id v39 = v32;
      }
      -[HDAppSubscriptionManager _queue_addPendingLaunchForSubscription:anchor:](v29, v30, (uint64_t)v31);
      objc_msgSend(*(id *)(v29 + 40), "requestAppLaunchWithBundleID:updateFrequency:", v32, (double)(unint64_t)objc_msgSend(v30, "updateFrequency"));
      _HKInitializeLogging();
      id v40 = *MEMORY[0x1E4F29F00];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F00], OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v39;
        _os_log_impl(&dword_1BCB7D000, v40, OS_LOG_TYPE_DEFAULT, "Requesting Duet to launch for %{public}@", (uint8_t *)&buf, 0xCu);
      }
      uint64_t v41 = [v30 dataCode];
      v42 = [NSNumber numberWithLong:time(0)];
      id v43 = v32;
      id v44 = v42;
      double v45 = *(NSObject **)(v29 + 56);
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      v51 = __64__HDAppSubscriptionManager__updateBundleID_dataCode_launchTime___block_invoke;
      id v52 = &unk_1E62F2A70;
      uint64_t v53 = v29;
      id v46 = v43;
      id v54 = v46;
      uint64_t v56 = v41;
      id v47 = v44;
      id v55 = v47;
      dispatch_async(v45, &buf);
    }
  }
}

- (void)_queue_addPendingLaunchForSubscription:(uint64_t)a3 anchor:
{
  id v13 = a2;
  uint64_t v5 = [v13 bundleIdentifier];
  id v6 = [*(id *)(a1 + 16) objectForKeyedSubscript:v5];
  if (v6)
  {
    if (a3) {
      goto LABEL_3;
    }
  }
  else
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [*(id *)(a1 + 16) setObject:v6 forKeyedSubscript:v5];
    if (a3)
    {
LABEL_3:
      id v7 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v13, "dataCode"));
      id v8 = [v6 objectForKeyedSubscript:v7];

      if (!v8)
      {
        id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        uint64_t v9 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v13, "dataCode"));
        [v6 setObject:v8 forKeyedSubscript:v9];

        uint64_t v10 = [v6 objectForKeyedSubscript:&unk_1F17EB6D0];

        if (!v10) {
          -[NSMutableArray incrementReference](v8);
        }
      }
      -[NSMutableArray incrementReference](v8);
      goto LABEL_11;
    }
  }
  uint64_t v11 = [v6 objectForKeyedSubscript:&unk_1F17EB6D0];

  if (!v11)
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [v6 setObject:v12 forKeyedSubscript:&unk_1F17EB6D0];
  }
  id v8 = [v6 objectForKeyedSubscript:&unk_1F17EB6D0];
  [v8 addObject:&unk_1F17EB6D0];
LABEL_11:
}

- (id)_activityNameForSubscription:(void *)a1 anchor:(void *)a2
{
  id v3 = NSString;
  objc_super v4 = NSNumber;
  id v5 = a2;
  id v6 = a1;
  id v7 = objc_msgSend(v4, "numberWithInteger:", objc_msgSend(v6, "dataCode"));
  if (v5) {
    id v8 = v5;
  }
  else {
    id v8 = &unk_1F17EB6D0;
  }
  uint64_t v9 = [v6 bundleIdentifier];

  uint64_t v10 = [v3 stringWithFormat:@"%@|%@.%@", v7, v8, v9];

  uint64_t v11 = [NSString stringWithFormat:@"%@%@", @"com.apple.healthd.scheduled.", v10];

  return v11;
}

- (void)_removeLaunchForSubscription:(uint64_t)a1 anchor:(void *)a2
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = -[HDAppSubscriptionManager _activityNameForSubscription:anchor:](a2, 0);
  _HKInitializeLogging();
  objc_super v4 = *MEMORY[0x1E4F29F00];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F00], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = v3;
    _os_log_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_DEFAULT, "Unscheduling subscription for %{public}@", (uint8_t *)&v5, 0xCu);
  }
  [*(id *)(a1 + 48) removeTaskWithName:v3 forClientNamed:@"HDAppSubscriptionManager"];
}

- (id)_updateOrCreateSubscription:(void *)a1 value:(void *)a2 type:(uint64_t)a3
{
  id v5 = a1;
  id v6 = a2;
  if (v5)
  {
    if (a3 == 1)
    {
      [v5 updateAssociationAnchor:v6];
    }
    else if (!a3)
    {
      [v5 updateDataAnchor:v6];
    }
    goto LABEL_9;
  }
  if (a3 == 1)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F2B3D8]);
    id v8 = 0;
    id v9 = v6;
  }
  else
  {
    if (a3)
    {
LABEL_9:
      id v10 = v5;
      goto LABEL_12;
    }
    id v7 = objc_alloc(MEMORY[0x1E4F2B3D8]);
    id v8 = v6;
    id v9 = 0;
  }
  id v10 = (id)[v7 initWithDataAnchor:v8 associationAnchor:v9];
LABEL_12:
  uint64_t v11 = v10;

  return v11;
}

void __112__HDAppSubscriptionManager__queue_scheduleLaunchesForAllowedSubscriptions_lastLaunchTimes_dataCode_anchor_type___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v2 = *(void *)(v1 + 24);
  if (v2 == 1)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(a1 + 48);
    id v6 = *(void **)(a1 + 56);
    uint64_t v7 = *(void *)(a1 + 72);
    id v8 = *(id *)(a1 + 40);
    id v9 = v5;
    id v10 = v6;
    if (v4)
    {
      _HKInitializeLogging();
      uint64_t v11 = *MEMORY[0x1E4F29F00];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F00], OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v13[0]) = 0;
        _os_log_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_DEFAULT, "Timer fired, scheduling launches", (uint8_t *)v13, 2u);
      }
      id v12 = *(NSObject **)(v4 + 56);
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __63__HDAppSubscriptionManager__launchTimerFired_code_anchor_type___block_invoke;
      v13[3] = &unk_1E62F2ED0;
      v13[4] = v4;
      id v14 = v9;
      id v15 = v10;
      uint64_t v17 = v7;
      id v16 = v8;
      dispatch_async(v12, v13);
    }
    uint64_t v1 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v2 = *(void *)(v1 + 24);
  }
  *(void *)(v1 + 24) = v2 + 1;
}

uint64_t __93__HDAppSubscriptionManager__updateObservationStatusForDataTypeCode_lastAppLaunchTimes_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = objc_alloc_init(HDMutableDatabaseTransactionContext);
  [(HDMutableDatabaseTransactionContext *)v4 setCacheScope:1];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
  id v6 = [WeakRetained database];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __93__HDAppSubscriptionManager__updateObservationStatusForDataTypeCode_lastAppLaunchTimes_error___block_invoke_2;
  v11[3] = &unk_1E62F2E18;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(a1 + 40);
  uint64_t v14 = *(void *)(a1 + 56);
  v11[4] = v7;
  id v12 = v8;
  id v13 = *(id *)(a1 + 48);
  uint64_t v9 = [v6 performTransactionWithContext:v4 error:a2 block:v11 inaccessibilityHandler:0];

  return v9;
}

BOOL __93__HDAppSubscriptionManager__updateObservationStatusForDataTypeCode_lastAppLaunchTimes_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *(void *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
  uint64_t v7 = +[HDAppSubscriptionEntity allSubscriptionsForType:v5 profile:WeakRetained error:a3];

  if (v7)
  {
    if (![v7 count])
    {
      id v8 = *(void **)(*(void *)(a1 + 32) + 8);
      uint64_t v9 = [NSNumber numberWithInteger:*(void *)(a1 + 56)];
      [v8 removeObject:v9];
    }
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v30 = v7;
    id v11 = v7;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v37 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          uint64_t v17 = *(void **)(*(void *)(a1 + 32) + 8);
          v18 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v16, "dataCode"));
          [v17 addObject:v18];

          uint64_t v19 = [v16 bundleIdentifier];
          id v20 = [v10 objectForKeyedSubscript:v19];
          if (!v20)
          {
            id v20 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
            [v10 setObject:v20 forKeyedSubscript:v19];
          }
          uint64_t v21 = [v16 objectType];
          if (v21) {
            [v20 setObject:v16 forKeyedSubscript:v21];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v36 objects:v40 count:16];
      }
      while (v13);
    }

    uint64_t v22 = *(void *)(a1 + 32);
    uint64_t v23 = *(void *)(v22 + 96);
    if (v23)
    {
      (*(void (**)(void))(v23 + 16))();
      uint64_t v22 = *(void *)(a1 + 32);
    }
    id v24 = objc_loadWeakRetained((id *)(v22 + 32));
    BOOL v25 = [v24 sourceManager];

    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __93__HDAppSubscriptionManager__updateObservationStatusForDataTypeCode_lastAppLaunchTimes_error___block_invoke_3;
    v31[3] = &unk_1E62FCEB0;
    uint64_t v26 = *(void *)(a1 + 32);
    id v27 = *(void **)(a1 + 40);
    id v32 = v25;
    uint64_t v33 = v26;
    id v34 = v27;
    id v35 = *(id *)(a1 + 48);
    id v28 = v25;
    [v10 enumerateKeysAndObjectsUsingBlock:v31];

    uint64_t v7 = v30;
  }

  return v7 != 0;
}

void __93__HDAppSubscriptionManager__updateObservationStatusForDataTypeCode_lastAppLaunchTimes_error___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (void *)MEMORY[0x1C187C0E0]();
  id v8 = *(void **)(a1 + 32);
  id v30 = 0;
  uint64_t v9 = [v8 clientSourceForBundleIdentifier:v5 error:&v30];
  id v10 = v30;
  id v11 = v10;
  if (v9)
  {
    if (([v9 _options] & 4) != 0)
    {
      id v24 = v7;
      id v15 = objc_alloc(MEMORY[0x1E4F1CAD0]);
      id v16 = [v6 allKeys];
      uint64_t v17 = (void *)[v15 initWithArray:v16];
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 32));
      id v29 = 0;
      uint64_t v19 = +[HDAuthorizationEntity readAuthorizationStatusesByTypeForBundleIdentifier:v5 types:v17 profile:WeakRetained error:&v29];
      id v13 = v29;

      if (v19)
      {
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __93__HDAppSubscriptionManager__updateObservationStatusForDataTypeCode_lastAppLaunchTimes_error___block_invoke_352;
        v25[3] = &unk_1E62FCE88;
        id v26 = v6;
        id v27 = *(id *)(a1 + 48);
        id v28 = v5;
        [v19 enumerateKeysAndObjectsUsingBlock:v25];
      }
      else
      {
        _HKInitializeLogging();
        uint64_t v21 = *MEMORY[0x1E4F29F00];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F00], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138543618;
          id v32 = v5;
          __int16 v33 = 2114;
          id v34 = v13;
          _os_log_error_impl(&dword_1BCB7D000, v21, OS_LOG_TYPE_ERROR, "Failed to look up authorizations for bundle identifier \"%{public}@\": %{public}@", buf, 0x16u);
        }
      }

      uint64_t v7 = v24;
      goto LABEL_15;
    }
LABEL_3:
    uint64_t v12 = *(void **)(a1 + 48);
    id v13 = [v6 allValues];
    [v12 addObjectsFromArray:v13];
LABEL_15:

    id v22 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 32));
    uint64_t v23 = +[HDAppSubscriptionAppLaunchEntity launchTimeForBundleID:v5 profile:v22 error:0];

    if (v23) {
      [*(id *)(a1 + 56) setObject:v23 forKeyedSubscript:v5];
    }

    goto LABEL_18;
  }
  if (v10)
  {
    _HKInitializeLogging();
    uint64_t v14 = *MEMORY[0x1E4F29F00];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F00], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543618;
      id v32 = v5;
      __int16 v33 = 2114;
      id v34 = v11;
      _os_log_error_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_ERROR, "Failed to look up source with bundle identifier \"%{public}@\": %{public}@", buf, 0x16u);
    }
  }
  else
  {
    if ([v5 hasPrefix:@"com.apple."]) {
      goto LABEL_3;
    }
    _HKInitializeLogging();
    id v20 = *MEMORY[0x1E4F29F00];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F00], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138543362;
      id v32 = v5;
      _os_log_impl(&dword_1BCB7D000, v20, OS_LOG_TYPE_INFO, "Source for bundle identifier \"%{public}@\" not found", buf, 0xCu);
    }
  }
LABEL_18:
}

void __93__HDAppSubscriptionManager__updateObservationStatusForDataTypeCode_lastAppLaunchTimes_error___block_invoke_352(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
  if (v7)
  {
    if ([v6 canRead])
    {
      [*(id *)(a1 + 40) addObject:v7];
    }
    else
    {
      _HKInitializeLogging();
      id v8 = (void *)*MEMORY[0x1E4F29F00];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F00], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = *(void *)(a1 + 48);
        id v10 = v8;
        id v11 = [v5 identifier];
        int v12 = 138543618;
        uint64_t v13 = v9;
        __int16 v14 = 2112;
        id v15 = v11;
        _os_log_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_DEFAULT, "Ignoring subscription for %{public}@ to %@ because app does not have authorization to read", (uint8_t *)&v12, 0x16u);
      }
    }
  }
}

void __63__HDAppSubscriptionManager__launchTimerFired_code_anchor_type___block_invoke(void *a1)
{
  [*(id *)(a1[4] + 72) removeObjectForKey:a1[5]];
  [*(id *)(a1[4] + 80) removeObjectForKey:a1[5]];
  uint64_t v2 = (void *)a1[5];
  if (v2) {
    -[HDAppSubscriptionManager _queue_scheduleLaunches:anchor:type:](a1[4], [v2 integerValue], a1[6], a1[8]);
  }
  id v3 = a1[7];

  dispatch_source_cancel(v3);
}

void __75__HDAppSubscriptionManager__queue_ackForBundleID_dataTypes_anchor_ackTime___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  id v13 = v3;
  id v5 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "code"));
  id v6 = [v4 objectForKeyedSubscript:v5];

  if (v6)
  {
    uint64_t v7 = [v6 firstObject];
    id v8 = v7;
    if (v7 && [v7 unsignedIntegerValue])
    {
      uint64_t v9 = [v8 unsignedIntegerValue];
      id v10 = [NSNumber numberWithInteger:v9 - 1];
      [v6 replaceObjectAtIndex:0 withObject:v10];
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    if (!-[NSMutableArray currentReferenceCount](v6))
    {
      id v11 = *(void **)(a1 + 32);
      int v12 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v13, "code"));
      [v11 removeObjectForKey:v12];
    }
  }
}

void __64__HDAppSubscriptionManager__updateBundleID_dataCode_launchTime___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    uint64_t v2 = *(void *)(a1 + 56);
    id v3 = *(void **)(a1 + 40);
    uint64_t v4 = (id *)(v1 + 32);
    id v5 = *(id *)(a1 + 48);
    id v6 = v3;
    id WeakRetained = objc_loadWeakRetained(v4);
    +[HDAppSubscriptionAppLaunchEntity setLaunchTime:v5 forBundleID:v6 profile:WeakRetained error:0];

    id v8 = objc_loadWeakRetained(v4);
    id v16 = +[HDAppSubscriptionEntity subscriptionForBundleID:v6 dataCode:v2 profile:v8 error:0];

    uint64_t v9 = [v16 launchTimeHysteresis];
    if (2 * v9 >= 1209600) {
      uint64_t v10 = 1209600;
    }
    else {
      uint64_t v10 = 2 * v9;
    }
    id v11 = [NSNumber numberWithLongLong:v10];
    id v12 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    id v13 = [MEMORY[0x1E4F2B2C0] dataTypeWithCode:v2];
    __int16 v14 = objc_msgSend(v12, "initWithObjects:", v13, 0);
    id v15 = objc_loadWeakRetained(v4);
    +[HDAppSubscriptionEntity setLaunchTimeHysteresis:v11 forBundleID:v6 dataTypes:v14 profile:v15 error:0];
  }
}

void __69__HDAppSubscriptionManager_database_protectedDataDidBecomeAvailable___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v10 = a3;
  id v5 = a2;
  id v6 = [v10 dataAnchor];
  if (v6) {
    [v10 dataAnchor];
  }
  else {
  uint64_t v7 = [v10 associationAnchor];
  }

  id v8 = [v10 dataAnchor];
  BOOL v9 = v8 == 0;

  -[HDAppSubscriptionManager _queue_scheduleLaunches:anchor:type:](*(void *)(a1 + 32), [v5 integerValue], v7, v9);
  [*(id *)(*(void *)(a1 + 32) + 64) removeObjectForKey:v5];
}

- (void)removeSubscriptionForBundleID:(id)a3 dataCode:(int64_t)a4
{
  id v6 = a3;
  launchQueue = self->_launchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__HDAppSubscriptionManager_removeSubscriptionForBundleID_dataCode___block_invoke;
  block[3] = &unk_1E62F4978;
  block[4] = self;
  id v10 = v6;
  int64_t v11 = a4;
  id v8 = v6;
  dispatch_async(launchQueue, block);
}

void __67__HDAppSubscriptionManager_removeSubscriptionForBundleID_dataCode___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    uint64_t v2 = *(void *)(a1 + 48);
    id v3 = *(id *)(a1 + 40);
    id WeakRetained = objc_loadWeakRetained((id *)(v1 + 32));
    id v6 = +[HDAppSubscriptionEntity subscriptionForBundleID:v3 dataCode:v2 profile:WeakRetained error:0];

    -[HDAppSubscriptionManager _removeLaunchForSubscription:anchor:](v1, v6);
    id v5 = objc_loadWeakRetained((id *)(v1 + 32));
    +[HDAppSubscriptionEntity removeSubscriptionsWithBundleID:v3 dataCode:v2 profile:v5 error:0];
  }
}

- (void)removeBundleID:(id)a3
{
  id v4 = a3;
  launchQueue = self->_launchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__HDAppSubscriptionManager_removeBundleID___block_invoke;
  v7[3] = &unk_1E62F31C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(launchQueue, v7);
}

void __43__HDAppSubscriptionManager_removeBundleID___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(id *)(a1 + 40);
  if (v1)
  {
    id v3 = (id *)(v1 + 32);
    id WeakRetained = objc_loadWeakRetained((id *)(v1 + 32));
    id v5 = +[HDAppSubscriptionEntity allSubscriptionsForBundleID:v2 profile:WeakRetained error:0];

    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
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
          -[HDAppSubscriptionManager _removeLaunchForSubscription:anchor:](v1, *(void **)(*((void *)&v13 + 1) + 8 * v10++));
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }

    id v11 = objc_loadWeakRetained(v3);
    +[HDAppSubscriptionEntity removeSubscriptionsWithBundleID:dataCode:profile:error:](HDAppSubscriptionEntity, "removeSubscriptionsWithBundleID:dataCode:profile:error:", v2, -1, v11, 0, (void)v13);

    id v12 = objc_loadWeakRetained(v3);
    +[HDAppSubscriptionAppLaunchEntity removeBundleIdentifier:v2 profile:v12 error:0];
  }
}

- (void)subscribeForBundleID:(id)a3 dataCode:(int64_t)a4 frequencyInSeconds:(unint64_t)a5 appSDKVersionToken:(unint64_t)a6
{
  id v10 = a3;
  launchQueue = self->_launchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __96__HDAppSubscriptionManager_subscribeForBundleID_dataCode_frequencyInSeconds_appSDKVersionToken___block_invoke;
  block[3] = &unk_1E62FCF28;
  block[4] = self;
  id v14 = v10;
  int64_t v15 = a4;
  unint64_t v16 = a5;
  unint64_t v17 = a6;
  id v12 = v10;
  dispatch_async(launchQueue, block);
}

void __96__HDAppSubscriptionManager_subscribeForBundleID_dataCode_frequencyInSeconds_appSDKVersionToken___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 56);
  uint64_t v4 = *(void *)(a1 + 64);
  id v5 = *(id *)(a1 + 40);
  if (v1)
  {
    if (HDBackgroundObservationSupportedForDataTypeCode(v2))
    {
      id v6 = *(void **)(v1 + 8);
      uint64_t v7 = [NSNumber numberWithInteger:v2];
      [v6 addObject:v7];

      uint64_t v8 = *(void *)(v1 + 96);
      if (v8) {
        (*(void (**)(void))(v8 + 16))();
      }
      id WeakRetained = objc_loadWeakRetained((id *)(v1 + 32));
      id v10 = +[HDAppSubscriptionEntity subscriptionForBundleID:v5 dataCode:v2 profile:WeakRetained error:0];

      if (v10 && [v10 updateFrequency] == v3)
      {
        _HKInitializeLogging();
        id v11 = *MEMORY[0x1E4F29F00];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F00], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138412802;
          uint64_t v20 = (uint64_t)v5;
          __int16 v21 = 2048;
          uint64_t v22 = v2;
          __int16 v23 = 2048;
          uint64_t v24 = v3;
          _os_log_error_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_ERROR, "Ignoring app subscription request since %@ is already subscribed for %ld at freq %llu", buf, 0x20u);
        }
      }
      else
      {
        id v13 = objc_loadWeakRetained((id *)(v1 + 32));
        +[HDAppSubscriptionEntity addSubscriptionWithBundleID:v5 dataCode:v2 updateFrequency:v3 profile:v13 error:0];

        id v14 = objc_loadWeakRetained((id *)(v1 + 32));
        +[HDAppSubscriptionAppLaunchEntity insertOrUpdateAppSDKVersionToken:v4 forBundleID:v5 profile:v14 error:0];

        id v15 = objc_alloc(MEMORY[0x1E4F1CAD0]);
        unint64_t v16 = [MEMORY[0x1E4F2B2C0] dataTypeWithCode:v2];
        unint64_t v17 = objc_msgSend(v15, "initWithObjects:", v16, 0);
        id v18 = objc_loadWeakRetained((id *)(v1 + 32));
        +[HDAppSubscriptionEntity setLaunchTimeHysteresis:&unk_1F17EB6E8 forBundleID:v5 dataTypes:v17 profile:v18 error:0];

        -[HDAppSubscriptionManager _queue_scheduleLaunches:anchor:type:](v1, v2, 0, 0);
      }
    }
    else
    {
      _HKInitializeLogging();
      id v12 = *MEMORY[0x1E4F29F00];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F00], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 134217984;
        uint64_t v20 = v2;
        _os_log_error_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_ERROR, "Ignoring app subscription for unsupported type %ld", buf, 0xCu);
      }
    }
  }
}

- (void)setAnchor:(id)a3 forDataCode:(int64_t)a4 type:(int64_t)a5
{
  id v8 = a3;
  launchQueue = self->_launchQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __55__HDAppSubscriptionManager_setAnchor_forDataCode_type___block_invoke;
  v11[3] = &unk_1E62F6BF8;
  v11[4] = self;
  id v12 = v8;
  int64_t v13 = a4;
  int64_t v14 = a5;
  id v10 = v8;
  dispatch_async(launchQueue, v11);
}

void __55__HDAppSubscriptionManager_setAnchor_forDataCode_type___block_invoke(uint64_t a1)
{
}

- (void)ackForBundleID:(id)a3 dataTypes:(id)a4 anchor:(id)a5 ackTime:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  launchQueue = self->_launchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__HDAppSubscriptionManager_ackForBundleID_dataTypes_anchor_ackTime___block_invoke;
  block[3] = &unk_1E62FCF50;
  block[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(launchQueue, block);
}

void __68__HDAppSubscriptionManager_ackForBundleID_dataTypes_anchor_ackTime___block_invoke(uint64_t a1)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 48);
  uint64_t v3 = *(void **)(a1 + 56);
  uint64_t v4 = *(void **)(a1 + 64);
  id v5 = *(id *)(a1 + 40);
  id v6 = v2;
  id v7 = v3;
  id v8 = v4;
  if (v1)
  {
    _HKInitializeLogging();
    uint64_t v9 = *MEMORY[0x1E4F29F00];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F00], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138413058;
      *(void *)&uint8_t buf[4] = v5;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v6;
      *(_WORD *)&buf[22] = 2112;
      id v46 = v7;
      LOWORD(v47) = 2112;
      *(void *)((char *)&v47 + 2) = v8;
      _os_log_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_INFO, "Acking '%@' with '%@' to anchor %@ and ackTime %@.", buf, 0x2Au);
    }
    id WeakRetained = objc_loadWeakRetained((id *)(v1 + 32));
    +[HDAppSubscriptionEntity setLastAnchor:v7 lastAckTime:v8 forBundleID:v5 dataTypes:v6 profile:WeakRetained error:0];

    id v11 = objc_loadWeakRetained((id *)(v1 + 32));
    +[HDAppSubscriptionEntity setLaunchTimeHysteresis:&unk_1F17EB6E8 forBundleID:v5 dataTypes:v6 profile:v11 error:0];

    _HKInitializeLogging();
    id v12 = *MEMORY[0x1E4F29F00];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F00], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = *(void *)(v1 + 16);
      *(_DWORD *)long long buf = 138543362;
      *(void *)&uint8_t buf[4] = v13;
      _os_log_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_DEFAULT, "Outstanding launches: %{public}@", buf, 0xCu);
    }
    int64_t v14 = [*(id *)(v1 + 16) objectForKeyedSubscript:v5];
    id v15 = v14;
    if (v14)
    {
      uint64_t v39 = 0;
      id v40 = &v39;
      uint64_t v41 = 0x2020000000;
      char v42 = 0;
      *(void *)long long buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __75__HDAppSubscriptionManager__queue_ackForBundleID_dataTypes_anchor_ackTime___block_invoke;
      id v46 = &unk_1E62FCED8;
      id v16 = v14;
      *(void *)&long long v47 = v16;
      *((void *)&v47 + 1) = &v39;
      [v6 enumerateObjectsUsingBlock:buf];
      if (!*((unsigned char *)v40 + 24) || ![v6 count])
      {
        id v17 = [v16 objectForKeyedSubscript:&unk_1F17EB6D0];
        id v18 = v17;
        if (v17)
        {
          if ([v17 count]) {
            [v18 removeObjectAtIndex:0];
          }
          if (![v18 count]) {
            [v16 removeObjectForKey:&unk_1F17EB6D0];
          }
        }
      }
      _HKInitializeLogging();
      uint64_t v19 = *MEMORY[0x1E4F29F00];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F00], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)id v43 = 138543362;
        id v44 = v16;
        _os_log_impl(&dword_1BCB7D000, v19, OS_LOG_TYPE_DEFAULT, "Launch anchors after ack %{public}@", v43, 0xCu);
      }
      if (![v16 count])
      {
        [*(id *)(v1 + 16) removeObjectForKey:v5];
        [*(id *)(v1 + 40) requestAssertionInvalidationForBundleID:v5];
        id v20 = objc_loadWeakRetained((id *)(v1 + 32));
        id v21 = [v20 daemon];
        id v22 = [v21 behavior];
        int v23 = [v22 isAppleInternalInstall];

        if (v23)
        {
          uint64_t v24 = (void *)MEMORY[0x1E4F1CB18];
          id v25 = v5;
          long long v38 = [v24 standardUserDefaults];
          long long v37 = [v38 objectForKey:@"HDBackgroundLaunchInvalidationStringsKey"];
          id v26 = NSString;
          id v27 = (void *)MEMORY[0x1E4F1C9C8];
          id v28 = v25;
          id v29 = [v27 date];
          long long v36 = [v26 stringWithFormat:@"[%@]: %@", v29, v28];

          if (v37)
          {
            id v30 = [v37 stringByAppendingFormat:@"\n%@", v36];
            id v31 = [v30 componentsSeparatedByString:@"\n"];
            if ((unint64_t)[v31 count] <= 0xA)
            {
              id v33 = v30;
            }
            else
            {
              id v32 = (void *)[v31 mutableCopy];
              [v32 removeLastObject];
              id v33 = [v32 componentsJoinedByString:@"\n"];
            }
          }
          else
          {
            id v33 = v36;
          }
          [v38 setObject:v33 forKey:@"HDBackgroundLaunchInvalidationStringsKey"];
        }
        uint64_t v34 = *(void *)(v1 + 104);
        if (v34) {
          (*(void (**)(uint64_t, id, void))(v34 + 16))(v34, v5, 0);
        }
        _HKInitializeLogging();
        uint64_t v35 = *MEMORY[0x1E4F29F00];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F00], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)id v43 = 138543362;
          id v44 = v5;
          _os_log_impl(&dword_1BCB7D000, v35, OS_LOG_TYPE_DEFAULT, "Requesting Duet to invalidate launch for %{public}@", v43, 0xCu);
        }
      }

      _Block_object_dispose(&v39, 8);
    }
  }
}

- (BOOL)unitTesting_isObservingDataTypeCode:(int64_t)a3
{
  observedDataTypeCodes = self->_observedDataTypeCodes;
  uint64_t v4 = [NSNumber numberWithInteger:a3];
  LOBYTE(observedDataTypeCodes) = [(NSMutableSet *)observedDataTypeCodes containsObject:v4];

  return (char)observedDataTypeCodes;
}

- (BOOL)unitTesting_isAwaitingLaunchForBundleID:(id)a3 dataTypeCode:(int64_t)a4
{
  id v5 = [(NSMutableDictionary *)self->_outstandingLaunchesByBundleIdentifier objectForKeyedSubscript:a3];
  if (a4 == -1)
  {
    id v6 = [NSNumber numberWithInteger:-1];
    id v7 = [v5 objectForKeyedSubscript:v6];
    char v8 = [v7 containsObject:&unk_1F17EB6D0];
  }
  else
  {
    id v6 = [NSNumber numberWithInteger:a4];
    id v7 = [v5 objectForKeyedSubscript:v6];
    char v8 = -[NSMutableArray currentReferenceCount](v7) != 0;
  }

  return v8;
}

- (void)unitTesting_synchronizeWithQueue
{
}

- (id)unitTesting_backgroundAppRefreshStatusGenerator
{
  return self->_unitTesting_backgroundAppRefreshStatusGenerator;
}

- (void)setUnitTesting_backgroundAppRefreshStatusGenerator:(id)a3
{
}

- (id)unitTesting_didUpdateObservingDataTypeCode
{
  return self->_unitTesting_didUpdateObservingDataTypeCode;
}

- (void)setUnitTesting_didUpdateObservingDataTypeCode:(id)a3
{
}

- (id)unitTesting_launchEventHandler
{
  return self->_unitTesting_launchEventHandler;
}

- (void)setUnitTesting_launchEventHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unitTesting_launchEventHandler, 0);
  objc_storeStrong(&self->_unitTesting_didUpdateObservingDataTypeCode, 0);
  objc_storeStrong(&self->_unitTesting_backgroundAppRefreshStatusGenerator, 0);
  objc_storeStrong((id *)&self->_launchTimerLaunchTimes, 0);
  objc_storeStrong((id *)&self->_launchTimers, 0);
  objc_storeStrong((id *)&self->_pendingTypeCodesToAnchors, 0);
  objc_storeStrong((id *)&self->_launchQueue, 0);
  objc_storeStrong((id *)&self->_backgroundTaskScheduler, 0);
  objc_storeStrong((id *)&self->_backgroundAppLauncher, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_outstandingLaunchesByBundleIdentifier, 0);

  objc_storeStrong((id *)&self->_observedDataTypeCodes, 0);
}

@end