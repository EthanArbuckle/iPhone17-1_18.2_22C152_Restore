@interface HDAWDSubmissionManager
- (BOOL)_setInt64:(int64_t)a3 keyPrefix:(id)a4 profile:(id)a5 date:(id)a6 error:(id *)a7;
- (BOOL)aggregateDatabaseSizeStats:(id)a3;
- (BOOL)runTask:(id)a3 error:(id *)a4;
- (HDAWDSubmissionManager)initWithProfile:(id)a3;
- (HDProfile)profile;
- (id)_actions;
- (id)_activitySummaryForActivityCacheIndex:(int64_t)a3 error:(id *)a4;
- (id)_updateDeltaToInt64:(int64_t)a3 forKey:(id)a4 profile:(id)a5 currentDate:(id)a6 timeInterval:(double)a7 error:(id *)a8;
- (id)diagnosticDescription;
- (id)testHandler;
- (int64_t)_int64ForKeyPrefix:(id)a3 profile:(id)a4 date:(id *)a5 error:(id *)a6;
- (int64_t)_manuallyEnteredTypesCountWithTransaction:(id)a3 error:(id *)a4;
- (int64_t)_nonAppleSourcesWithDataSince:(id)a3 transaction:(id)a4 error:(id *)a5;
- (uint64_t)_countOfObjectsWithSQLQuery:(uint64_t)a1 database:(void *)a2 error:(void *)a3 bindingHandler:(uint64_t)a4;
- (void)dealloc;
- (void)profileDidBecomeReady:(id)a3;
- (void)reportDailyAnalyticsWithCoordinator:(id)a3 completion:(id)a4;
- (void)resetTask:(id)a3;
- (void)setTestHandler:(id)a3;
@end

@implementation HDAWDSubmissionManager

- (HDAWDSubmissionManager)initWithProfile:(id)a3
{
  id v5 = a3;
  v51.receiver = self;
  v51.super_class = (Class)HDAWDSubmissionManager;
  v6 = [(HDAWDSubmissionManager *)&v51 init];
  if (v6)
  {
    if (!v5)
    {
      v46 = [MEMORY[0x1E4F28B00] currentHandler];
      [v46 handleFailureInMethod:a2, v6, @"HDAWDSubmissionManager.m", 448, @"Invalid parameter not satisfying: %@", @"profile" object file lineNumber description];
    }
    uint64_t v7 = HKCreateSerialDispatchQueue();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    objc_storeWeak((id *)&v6->_profile, v5);
    v6->_fitnessDailyCollectionEnabledNotifyToken = -1;
    v9 = [MEMORY[0x1E4F65CF8] sharedDiagnosticManager];
    [v9 addObject:v6];

    v10 = [MEMORY[0x1E4F1CA48] array];
    id WeakRetained = objc_loadWeakRetained((id *)&v6->_profile);
    v12 = [WeakRetained daemon];
    v13 = [v12 behavior];
    int v14 = [v13 supportsAWDMetricSubmission];

    if (v14)
    {
      objc_initWeak(&location, v6);
      v15 = [_HDAWDPeriodicAction alloc];
      v48[0] = MEMORY[0x1E4F143A8];
      v48[1] = 3221225472;
      v48[2] = __42__HDAWDSubmissionManager_initWithProfile___block_invoke;
      v48[3] = &unk_1E6301130;
      objc_copyWeak(&v49, &location);
      v16 = @"com.apple.healthd.awd-submission-manager.heart-daily-analytics";
      v17 = @"HDAWDSubmissionManager.HeartDailyAnalytics";
      id obj = v5;
      v18 = v48;
      if (v15)
      {
        v52.receiver = v15;
        v52.super_class = (Class)_HDAWDPeriodicAction;
        v19 = [(HDAWDSubmissionManager *)&v52 init];
        if (v19)
        {
          uint64_t v20 = HKCreateSerialDispatchQueue();
          v21 = v19[1]._queue;
          v19[1]._queue = (OS_dispatch_queue *)v20;

          uint64_t v22 = [@"com.apple.healthd.awd-submission-manager.heart-daily-analytics" copy];
          v23 = (_HDAWDPeriodicAction *)*MEMORY[0x1E4F141E8];
          uint64_t v24 = *MEMORY[0x1E4F14238];
          v25 = v19[2]._queue;
          v19[2]._queue = (OS_dispatch_queue *)v22;

          v19->_fitnessDailyAction = v23;
          *(void *)&v19->_started = v24;
          LOBYTE(v19->_testHandler) = 1;
          *(int64x2_t *)&v19[1].super.isa = vdupq_n_s64(1uLL);
          v19[1]._serverConnectionsByComponentId = (NSMutableDictionary *)0x40C5180000000000;
          uint64_t v26 = [@"HDAWDSubmissionManager.HeartDailyAnalytics" stringByAppendingString:@".WaitingToRun"];
          profile = v19->_profile;
          v19->_profile = (HDProfile *)v26;

          uint64_t v28 = [@"HDAWDSubmissionManager.HeartDailyAnalytics" stringByAppendingString:@".LastSubmissionAttempt"];
          serverConnectionsByComponentId = v19->_serverConnectionsByComponentId;
          v19->_serverConnectionsByComponentId = (NSMutableDictionary *)v28;

          uint64_t v30 = [@"HDAWDSubmissionManager.HeartDailyAnalytics" stringByAppendingString:@".IntervalCounter"];
          actions = v19->_actions;
          v19->_actions = (NSMutableArray *)v30;

          uint64_t v32 = [@"HDAWDSubmissionManager.HeartDailyAnalytics" stringByAppendingString:@".LastProcessedDate"];
          v33 = v19->_queue;
          v19->_queue = (OS_dispatch_queue *)v32;

          objc_storeWeak((id *)&v19[1]._actions, obj);
          v34 = _Block_copy(v18);
          v35 = *(void **)&v19[1]._started;
          *(void *)&v19[1]._started = v34;

          v36 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
          v19[2].super.isa = (Class)[v36 integerForKey:v19->_profile];

          v37 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
          v19[2]._serverConnectionsByComponentId = (NSMutableDictionary *)[v37 integerForKey:v19->_actions];

          v38 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
          v39 = [v38 objectForKey:v19->_serverConnectionsByComponentId];

          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            objc_storeStrong((id *)&v19[2]._profile, v39);
          }
          v40 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
          v41 = [v40 objectForKey:v19->_queue];

          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            objc_storeStrong((id *)&v19[2]._actions, v41);
          }
        }
      }
      else
      {
        v19 = 0;
      }

      [(NSMutableArray *)v10 addObject:v19];
      objc_storeStrong((id *)&v6->_actions, v10);
      id v42 = objc_loadWeakRetained((id *)&v6->_profile);
      [v42 registerProfileReadyObserver:v6 queue:v6->_queue];

      objc_destroyWeak(&v49);
      objc_destroyWeak(&location);
    }
    else
    {
      v43 = v6->_actions;
      v6->_actions = v10;
      v44 = v10;

      v10 = (NSMutableArray *)objc_loadWeakRetained((id *)&v6->_profile);
      [(NSMutableArray *)v10 registerProfileReadyObserver:v6 queue:v6->_queue];
    }
  }

  return v6;
}

BOOL __42__HDAWDSubmissionManager_initWithProfile___block_invoke(uint64_t a1, void *a2, int a3)
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  v4 = (id *)(a1 + 32);
  id v5 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained(v4);
  uint64_t v7 = (NSObject **)v5;
  if (!WeakRetained)
  {
    BOOL v39 = 0;
    goto LABEL_23;
  }
  v8 = [MEMORY[0x1E4F1C9C8] date];
  v56 = objc_msgSend(MEMORY[0x1E4F1C9A8], "hk_gregorianCalendarWithUTCTimeZone");
  v9 = HDHeartDailyAnalyticsProcessingIntervalForCurrentDateAndCalendar((uint64_t)v8, v56);
  v10 = -[_HDAWDPeriodicAction lastProcessedDate]((uint64_t)v7);
  if (!v10) {
    goto LABEL_14;
  }
  v11 = [v9 startDate];
  int v12 = objc_msgSend(v10, "hk_isBeforeDate:", v11);

  if (v12)
  {
    _HKInitializeLogging();
    v13 = HKLogAnalytics();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = objc_opt_class();
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v10;
      id v14 = *(id *)&buf[4];
      v15 = "[%{public}@] Skipping some prior days of HeartDailyAnalytics: last submission was %{public}@";
      v16 = v13;
      uint32_t v17 = 22;
LABEL_12:
      _os_log_impl(&dword_1BCB7D000, v16, OS_LOG_TYPE_DEFAULT, v15, buf, v17);

      goto LABEL_13;
    }
    goto LABEL_13;
  }
  v18 = [v9 startDate];
  int v19 = objc_msgSend(v10, "hk_isAfterDate:", v18);

  if (!v19)
  {
LABEL_14:
    v55 = v10;
    v50 = v8;
    objc_super v51 = v7;
    objc_super v52 = WeakRetained;
    v53 = [HDHeartDailyAnalyticsBuilder alloc];
    v23 = WeakRetained + 1;
    id v24 = objc_loadWeakRetained(WeakRetained + 1);
    id v25 = objc_alloc(MEMORY[0x1E4F1CB18]);
    uint64_t v26 = (void *)[v25 initWithSuiteName:*MEMORY[0x1E4F2BE88]];
    v27 = objc_msgSend(MEMORY[0x1E4F1CB18], "hk_heartRhythmDefaults");
    uint64_t v28 = objc_msgSend(MEMORY[0x1E4F1CB18], "hk_remoteFeatureAvailabilityUserDefaults");
    v29 = [MEMORY[0x1E4F79EF0] sharedInstance];
    uint64_t v30 = v9;
    id v31 = objc_loadWeakRetained(v23);
    uint64_t v32 = [v31 notificationManager];
    char v33 = [v32 areHealthNotificationsAuthorized];
    BYTE1(v49) = HKImproveHealthAndActivityAnalyticsAllowed();
    LOBYTE(v49) = v33;
    v34 = -[HDHeartDailyAnalyticsBuilder initWithProfile:calendar:dateInterval:heartRateNotificationsUserDefaults:heartRhythmUserDefaults:remoteFeatureAvailabilityUserDefaults:pairedDeviceRegistry:areHealthNotificationsAuthorized:isHealthDataSubmissionAllowed:](v53, "initWithProfile:calendar:dateInterval:heartRateNotificationsUserDefaults:heartRhythmUserDefaults:remoteFeatureAvailabilityUserDefaults:pairedDeviceRegistry:areHealthNotificationsAuthorized:isHealthDataSubmissionAllowed:", v24, v56, v30, v26, v27, v28, v29, v49);

    id v57 = 0;
    v35 = v34;
    v36 = [(HDHeartDailyAnalyticsBuilder *)v34 heartDailyAnalyticsWithError:&v57];
    id v37 = v57;
    v38 = v37;
    BOOL v39 = v36 != 0;
    if (v36)
    {
      id v54 = v37;
      id v40 = objc_loadWeakRetained(v23);
      v41 = [v40 daemon];
      id v42 = [v41 analyticsSubmissionCoordinator];
      objc_msgSend(v42, "heartDaily_reportHeartDailyAnalytics:", v36);

      v43 = [v30 endDate];
      v44 = v43;
      uint64_t v7 = v51;
      v9 = v30;
      if (v51)
      {
        v45 = v51[12];
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __45___HDAWDPeriodicAction_setLastProcessedDate___block_invoke;
        v59 = &unk_1E62F31C0;
        v60 = v51;
        v61 = v43;
        dispatch_async(v45, buf);
      }
      v8 = v50;
      BOOL v39 = v36 != 0;
      id WeakRetained = v52;
      v38 = v54;
    }
    else
    {
      _HKInitializeLogging();
      v44 = HKLogAnalytics();
      id WeakRetained = v52;
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        v47 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v47;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v38;
        id v48 = v47;
        _os_log_error_impl(&dword_1BCB7D000, v44, OS_LOG_TYPE_ERROR, "[%{public}@] Error building heart daily analytics: %{public}@", buf, 0x16u);

        BOOL v39 = 0;
      }
      v8 = v50;
      uint64_t v7 = v51;
      v9 = v30;
    }

    v10 = v55;
    goto LABEL_22;
  }
  _HKInitializeLogging();
  uint64_t v20 = HKLogAnalytics();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = objc_opt_class();
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v10;
    id v21 = *(id *)&buf[4];
    _os_log_impl(&dword_1BCB7D000, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@] Not yet time to submit HeartDailyAnalytics: last submission was %{public}@", buf, 0x16u);
  }
  if (a3)
  {
    _HKInitializeLogging();
    v13 = HKLogAnalytics();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v22;
      id v14 = v22;
      v15 = "[%{public}@] This this is a forced submission, so we're submitting anyway";
      v16 = v13;
      uint32_t v17 = 12;
      goto LABEL_12;
    }
LABEL_13:

    goto LABEL_14;
  }
  BOOL v39 = 0;
LABEL_22:

LABEL_23:
  return v39;
}

- (void)dealloc
{
  int fitnessDailyCollectionEnabledNotifyToken = self->_fitnessDailyCollectionEnabledNotifyToken;
  if (fitnessDailyCollectionEnabledNotifyToken != -1) {
    notify_cancel(fitnessDailyCollectionEnabledNotifyToken);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v5 = [WeakRetained daemon];
  v6 = [v5 analyticsSubmissionCoordinator];
  [v6 removeObserver:self];

  v7.receiver = self;
  v7.super_class = (Class)HDAWDSubmissionManager;
  [(HDAWDSubmissionManager *)&v7 dealloc];
}

- (id)_actions
{
  if (a1)
  {
    uint64_t v5 = 0;
    v6 = &v5;
    uint64_t v7 = 0x3032000000;
    v8 = __Block_byref_object_copy__100;
    v9 = __Block_byref_object_dispose__100;
    id v10 = 0;
    v1 = *(NSObject **)(a1 + 32);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __34__HDAWDSubmissionManager__actions__block_invoke;
    v4[3] = &unk_1E62F3230;
    v4[4] = a1;
    v4[5] = &v5;
    dispatch_sync(v1, v4);
    id v2 = (id)v6[5];
    _Block_object_dispose(&v5, 8);
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

void __34__HDAWDSubmissionManager__actions__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 24) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)profileDidBecomeReady:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v4 = self->_actions;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = v4;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    v8 = (os_log_t *)MEMORY[0x1E4F29F28];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        if (v10)
        {
          _HKInitializeLogging();
          v11 = *v8;
          if (os_log_type_enabled(*v8, OS_LOG_TYPE_INFO))
          {
            uint64_t v12 = *(void *)(v10 + 160);
            *(_DWORD *)buf = 138543618;
            uint64_t v25 = v10;
            __int16 v26 = 2114;
            uint64_t v27 = v12;
            _os_log_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_INFO, "%{public}@: %{public}@ starting", buf, 0x16u);
          }
          v13 = *(NSObject **)(v10 + 96);
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __29___HDAWDPeriodicAction_start__block_invoke;
          block[3] = &unk_1E62F3208;
          block[4] = v10;
          dispatch_sync(v13, block);
        }
      }
      uint64_t v6 = [(NSMutableArray *)obj countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v6);
  }
  self->_started = 1;

  id obja = objc_loadWeakRetained((id *)&self->_profile);
  id v14 = [obja daemon];
  v15 = [v14 analyticsSubmissionCoordinator];
  [v15 addObserver:self queue:self->_queue];
}

- (id)diagnosticDescription
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v19 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  -[HDAWDSubmissionManager _actions]((uint64_t)self);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [obj countByEnumeratingWithState:&v20 objects:v36 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v18 = *(void *)v21;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(id *)(*((void *)&v20 + 1) + 8 * v5);
        uint64_t v7 = (void (*)(uint64_t))v6;
        if (v6)
        {
          id v8 = *((id *)v6 + 20);
          uint64_t v24 = 0;
          uint64_t v25 = (uint64_t)&v24;
          uint64_t v26 = 0x2020000000;
          uint64_t v27 = 0;
          v9 = *((void *)v7 + 12);
          uint64_t block = MEMORY[0x1E4F143A8];
          p_uint64_t block = 3221225472;
          uint64_t v32 = (uint64_t)__39___HDAWDPeriodicAction_intervalCounter__block_invoke;
          char v33 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E62F3230;
          v34 = v7;
          v35 = &v24;
          dispatch_sync(v9, &block);
          uint64_t v10 = *(void *)(v25 + 24);
          _Block_object_dispose(&v24, 8);
          uint64_t v11 = *((void *)v7 + 16);
          uint64_t block = 0;
          p_uint64_t block = (uint64_t)&block;
          uint64_t v32 = 0x3032000000;
          char v33 = __Block_byref_object_copy__100;
          v34 = __Block_byref_object_dispose__100;
          v35 = 0;
          uint64_t v12 = *((void *)v7 + 12);
          uint64_t v24 = MEMORY[0x1E4F143A8];
          uint64_t v25 = 3221225472;
          uint64_t v26 = (uint64_t)__49___HDAWDPeriodicAction_lastSubmissionAttemptDate__block_invoke;
          uint64_t v27 = &unk_1E62F3230;
          uint64_t v28 = v7;
          v29 = &block;
          dispatch_sync(v12, &v24);
          id v13 = *(id *)(p_block + 40);
          _Block_object_dispose(&block, 8);
        }
        else
        {
          uint64_t v11 = 0;
          id v8 = 0;
          uint64_t v10 = 0;
          id v13 = 0;
        }
        id v14 = -[_HDAWDPeriodicAction lastProcessedDate]((uint64_t)v7);
        [v19 appendFormat:@"%@: counter:%ld waiting:%ld last:%@ processed:%@\n", v8, v10, v11, v13, v14];

        ++v5;
      }
      while (v4 != v5);
      uint64_t v15 = [obj countByEnumeratingWithState:&v20 objects:v36 count:16];
      uint64_t v4 = v15;
    }
    while (v15);
  }

  return v19;
}

- (BOOL)runTask:(id)a3 error:(id *)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  -[HDAWDSubmissionManager _actions]((uint64_t)self);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v26;
    while (2)
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v25 + 1) + 8 * v12);
        if (v13) {
          id v14 = (void *)v13[20];
        }
        else {
          id v14 = 0;
        }
        if ([v14 isEqualToString:v7])
        {
          v16 = v13;

          if (!v13) {
            goto LABEL_17;
          }
          if ((*(uint64_t (**)(void))(*((void *)v16 + 14) + 16))())
          {
            [*((id *)v16 + 15) didPerformActivityWithResult:0 minimumRetryInterval:0 activityStartDate:0 error:v16[10]];
            uint32_t v17 = 0;
            BOOL v18 = 1;
            goto LABEL_27;
          }
          long long v21 = [NSString stringWithFormat:@"%@ activity %@ failed during forced execution", objc_opt_class(), *((void *)v16 + 20), (void)v25];
          long long v22 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 100, v21);

          [*((id *)v16 + 15) didPerformActivityWithResult:2 minimumRetryInterval:0 activityStartDate:v22 error:v16[10]];
          objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 100, @"Failed to complete task %@", v7);
          id v23 = (id)objc_claimAutoreleasedReturnValue();
          uint32_t v17 = v23;
          if (v23)
          {
            if (a4)
            {
              id v20 = v23;
              uint32_t v17 = v20;
              goto LABEL_23;
            }
            _HKLogDroppedError();
          }
          goto LABEL_26;
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v15 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
      uint64_t v10 = v15;
      if (v15) {
        continue;
      }
      break;
    }
  }

LABEL_17:
  objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), a2, @"AWD task '%@' not found"", v7);
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  uint32_t v17 = v19;
  if (!v19) {
    goto LABEL_25;
  }
  if (!a4)
  {
    _HKLogDroppedError();
LABEL_25:
    v16 = 0;
    goto LABEL_26;
  }
  id v20 = v19;
  uint32_t v17 = v20;
  v16 = 0;
LABEL_23:
  *a4 = v20;
LABEL_26:

  BOOL v18 = 0;
LABEL_27:

  return v18;
}

- (void)resetTask:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  -[HDAWDSubmissionManager _actions]((uint64_t)self);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * v9);
        if (v10)
        {
          if ([*(id *)(v10 + 160) isEqualToString:v4])
          {
            uint64_t v12 = *(NSObject **)(v10 + 96);
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __29___HDAWDPeriodicAction_reset__block_invoke;
            block[3] = &unk_1E62F3208;
            block[4] = v10;
            dispatch_sync(v12, block);
            goto LABEL_15;
          }
        }
        else if (objc_msgSend(0, "isEqualToString:", v4, (void)v13))
        {
          goto LABEL_15;
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v11 = [v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
      uint64_t v7 = v11;
    }
    while (v11);
  }
LABEL_15:
}

- (uint64_t)_countOfObjectsWithSQLQuery:(uint64_t)a1 database:(void *)a2 error:(void *)a3 bindingHandler:(uint64_t)a4
{
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = v8;
  if (a1)
  {
    uint64_t v13 = 0;
    long long v14 = &v13;
    uint64_t v15 = 0x2020000000;
    uint64_t v16 = 0;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __84__HDAWDSubmissionManager__countOfObjectsWithSQLQuery_database_error_bindingHandler___block_invoke;
    v12[3] = &unk_1E62F3640;
    v12[4] = &v13;
    if ([v8 executeSQL:v7 error:a4 bindingHandler:0 enumerationHandler:v12])
    {
      uint64_t v10 = v14[3];
    }
    else
    {
      uint64_t v10 = -1;
      v14[3] = -1;
    }
    _Block_object_dispose(&v13, 8);
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

uint64_t __84__HDAWDSubmissionManager__countOfObjectsWithSQLQuery_database_error_bindingHandler___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = HDSQLiteColumnAsInt64();
  return 0;
}

- (int64_t)_manuallyEnteredTypesCountWithTransaction:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = HDSourceEntityPredicateForSourceWithBundleIdentifier(@"com.apple.Health");
  id v8 = [v6 unprotectedDatabase];
  uint64_t v9 = +[HDSourceEntity sourcesWithPredicate:v7 includeDeleted:0 database:v8 error:a4];

  if (v9)
  {
    uint64_t v10 = objc_msgSend(v9, "hk_map:", &__block_literal_global_108);
    uint64_t v11 = [v10 componentsJoinedByString:@", "];

    long long v22 = NSString;
    long long v21 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
    +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
    uint64_t v12 = v23 = v6;
    uint64_t v24 = v7;
    uint64_t v13 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
    long long v14 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
    uint64_t v15 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
    uint64_t v16 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
    objc_msgSend(v22, "stringWithFormat:", @"SELECT COUNT(DISTINCT %@) FROM %@ s INNER JOIN %@ o USING (%@) INNER JOIN %@ ON (o.%@ = %@.rowid) INNER JOIN %@ mv ON (mv.%@ = o.%@) INNER JOIN %@ mk ON (mk.rowid = mv.%@) WHERE (%@ in (%@)) AND mk.%@='%@' AND mv.%@ > 0", @"data_type", v21, v12, @"data_id", v13, @"provenance", v14, v15, @"object_id", @"data_id", v16, @"key_id", @"data_provenances.source_id", v11, @"key", *MEMORY[0x1E4F2A228],
    uint32_t v17 = @"numerical_value");

    id v6 = v23;
    BOOL v18 = [v23 protectedDatabase];
    int64_t v19 = -[HDAWDSubmissionManager _countOfObjectsWithSQLQuery:database:error:bindingHandler:]((uint64_t)self, v17, v18, (uint64_t)a4);

    id v7 = v24;
  }
  else
  {
    int64_t v19 = -1;
  }

  return v19;
}

uint64_t __74__HDAWDSubmissionManager__manuallyEnteredTypesCountWithTransaction_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = NSNumber;
  uint64_t v3 = [a2 persistentID];

  return [v2 numberWithLongLong:v3];
}

- (int64_t)_nonAppleSourcesWithDataSince:(id)a3 transaction:(id)a4 error:(id *)a5
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void *)MEMORY[0x1E4F65D78];
  uint64_t v11 = [NSString stringWithFormat:@"(%@ & %llu) == 0", @"source_options", 2];
  v28[0] = @"source_options";
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
  uint64_t v13 = [v10 predicateWithSQL:v11 overProperties:v12 values:MEMORY[0x1E4F1CBF0]];

  long long v14 = [v9 unprotectedDatabase];
  uint64_t v15 = +[HDSourceEntity sourcesWithPredicate:v13 includeDeleted:0 database:v14 error:a5];

  if (v15)
  {
    objc_msgSend(v15, "hk_map:", &__block_literal_global_485);
    v16 = long long v27 = self;
    long long v25 = [v16 componentsJoinedByString:@", "];

    long long v26 = NSString;
    uint32_t v17 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
    BOOL v18 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
    int64_t v19 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
    [v8 timeIntervalSinceReferenceDate];
    long long v21 = [v26 stringWithFormat:@"SELECT COUNT(*) FROM(SELECT %@, COUNT(*) AS rows FROM %@ o  INNER JOIN %@ ON (o.%@ = %@.rowid)  WHERE (%@ in (%@))  AND o.%@ > %.0lf GROUP BY %@) WHERE rows > 0", @"data_provenances.source_id", v17, v18, @"provenance", v19, @"data_provenances.source_id", v25, @"creation_date", v20, @"data_provenances.source_id"];

    long long v22 = [v9 protectedDatabase];
    int64_t v23 = -[HDAWDSubmissionManager _countOfObjectsWithSQLQuery:database:error:bindingHandler:]((uint64_t)v27, v21, v22, (uint64_t)a5);
  }
  else
  {
    int64_t v23 = -1;
  }

  return v23;
}

uint64_t __74__HDAWDSubmissionManager__nonAppleSourcesWithDataSince_transaction_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = NSNumber;
  uint64_t v3 = [a2 persistentID];

  return [v2 numberWithLongLong:v3];
}

- (int64_t)_int64ForKeyPrefix:(id)a3 profile:(id)a4 date:(id *)a5 error:(id *)a6
{
  void v28[2] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  if (a5)
  {
    if (a6) {
      goto LABEL_3;
    }
  }
  else
  {
    long long v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"HDAWDSubmissionManager.m", 749, @"Invalid parameter not satisfying: %@", @"date != NULL" object file lineNumber description];

    if (a6) {
      goto LABEL_3;
    }
  }
  long long v27 = [MEMORY[0x1E4F28B00] currentHandler];
  [v27 handleFailureInMethod:a2, self, @"HDAWDSubmissionManager.m", 750, @"Invalid parameter not satisfying: %@", @"error != NULL" object file lineNumber description];

LABEL_3:
  id v13 = v11;
  long long v14 = [v13 stringByAppendingString:@"_DATE"];
  v28[0] = v13;
  v28[1] = v14;
  uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
  uint64_t v16 = +[HDKeyValueEntity valuesForKeys:v15 domain:@"DATABASE_SIZE" category:0 profile:v12 error:a6];

  if (v16)
  {
    uint32_t v17 = [v16 objectForKeyedSubscript:v13];
    BOOL v18 = v17;
    if (v17) {
      int64_t v19 = [v17 longLongValue];
    }
    else {
      int64_t v19 = -1;
    }
    long long v21 = [v16 objectForKeyedSubscript:v14];
    long long v22 = v21;
    if (v21)
    {
      int64_t v23 = (void *)MEMORY[0x1E4F1C9C8];
      [v21 doubleValue];
      uint64_t v20 = objc_msgSend(v23, "dateWithTimeIntervalSinceReferenceDate:");
    }
    else
    {
      uint64_t v20 = 0;
    }
  }
  else
  {
    uint64_t v20 = 0;
    int64_t v19 = -1;
  }
  id v24 = v20;
  *a5 = v24;

  return v19;
}

- (BOOL)_setInt64:(int64_t)a3 keyPrefix:(id)a4 profile:(id)a5 date:(id)a6 error:(id *)a7
{
  v24[2] = *MEMORY[0x1E4F143B8];
  v23[0] = a4;
  id v11 = NSNumber;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  uint64_t v15 = [v11 numberWithLongLong:a3];
  v24[0] = v15;
  uint64_t v16 = [v14 stringByAppendingString:@"_DATE"];
  v23[1] = v16;
  uint32_t v17 = NSNumber;
  [v12 timeIntervalSinceReferenceDate];
  double v19 = v18;

  uint64_t v20 = [v17 numberWithDouble:v19];
  v24[1] = v20;
  long long v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];
  LOBYTE(a7) = +[HDKeyValueEntity setValuesWithDictionary:v21 domain:@"DATABASE_SIZE" category:0 profile:v13 error:a7];

  return (char)a7;
}

- (id)_updateDeltaToInt64:(int64_t)a3 forKey:(id)a4 profile:(id)a5 currentDate:(id)a6 timeInterval:(double)a7 error:(id *)a8
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v27 = 0;
  int64_t v17 = [(HDAWDSubmissionManager *)self _int64ForKeyPrefix:v14 profile:v15 date:&v27 error:a8];
  id v18 = v27;
  double v19 = v18;
  uint64_t v20 = 0;
  if ((v17 & 0x8000000000000000) == 0 && v18)
  {
    [v16 timeIntervalSinceDate:v18];
    if (v21 <= a7 + -43200.0)
    {
      uint64_t v20 = 0;
      if (v21 < a7 && v21 >= 0.0)
      {
        uint64_t v20 = &unk_1F17ED278;
        goto LABEL_11;
      }
    }
    else
    {
      uint64_t v20 = [NSNumber numberWithDouble:(double)(a3 - v17) * a7 / v21];
    }
  }
  id v26 = 0;
  BOOL v22 = [(HDAWDSubmissionManager *)self _setInt64:a3 keyPrefix:v14 profile:v15 date:v16 error:&v26];
  id v23 = v26;
  if (!v22)
  {
    id v24 = [NSString stringWithFormat:@"Saving new 'last' value for %@", v14];
    _HKLogDroppedErrorWithReason();
  }
LABEL_11:

  return v20;
}

- (BOOL)aggregateDatabaseSizeStats:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  uint64_t v6 = HDDatabaseSizeInMB(WeakRetained);

  id v7 = [NSNumber numberWithInteger:HDBucketedDatabaseSizeInMB(v6)];
  [v4 setObject:v7 forKeyedSubscript:@"totalDatabaseSize"];

  id v8 = NSNumber;
  id v9 = objc_loadWeakRetained((id *)&self->_profile);
  uint64_t v10 = objc_msgSend(v8, "numberWithLongLong:", HDDatabaseBucketedSizeInMBForDatabaseType(v9, 1, 0));
  [v4 setObject:v10 forKeyedSubscript:@"unprotectedDatabaseSize"];

  id v11 = NSNumber;
  id v12 = objc_loadWeakRetained((id *)&self->_profile);
  id v13 = objc_msgSend(v11, "numberWithLongLong:", HDDatabaseBucketedSizeInMBForDatabaseType(v12, 1, 1));
  [v4 setObject:v13 forKeyedSubscript:@"unprotectedDatabaseWALSize"];

  id v14 = NSNumber;
  id v15 = objc_loadWeakRetained((id *)&self->_profile);
  id v16 = objc_msgSend(v14, "numberWithLongLong:", HDDatabaseBucketedSizeInMBForDatabaseType(v15, 0, 0));
  [v4 setObject:v16 forKeyedSubscript:@"protectedDatabaseSize"];

  int64_t v17 = NSNumber;
  id v18 = objc_loadWeakRetained((id *)&self->_profile);
  double v19 = objc_msgSend(v17, "numberWithLongLong:", HDDatabaseBucketedSizeInMBForDatabaseType(v18, 0, 1));
  [v4 setObject:v19 forKeyedSubscript:@"protectedDatabaseWALSize"];

  id v20 = objc_loadWeakRetained((id *)&self->_profile);
  double v21 = [MEMORY[0x1E4F1C9C8] date];
  id v30 = 0;
  BOOL v22 = [(HDAWDSubmissionManager *)self _updateDeltaToInt64:v6 forKey:@"LAST_MONTH_DATABASE_SIZE" profile:v20 currentDate:v21 timeInterval:&v30 error:2592000.0];
  id v23 = v30;

  if (v22)
  {
    [v4 setObject:v22 forKeyedSubscript:@"lastMonthDatabaseSizeIncreaseMB"];
  }
  else if (v23)
  {
    _HKLogDroppedErrorWithReason();
  }
  id v24 = objc_loadWeakRetained((id *)&self->_profile);
  long long v25 = [MEMORY[0x1E4F1C9C8] date];
  id v29 = v23;
  id v26 = [(HDAWDSubmissionManager *)self _updateDeltaToInt64:v6 forKey:@"LAST_WEEK_DATABASE_SIZE" profile:v24 currentDate:v25 timeInterval:&v29 error:604800.0];
  id v27 = v29;

  if (v26)
  {
    [v4 setObject:v26 forKeyedSubscript:@"lastWeekDatabaseSizeIncreaseMB"];
  }
  else if (v27)
  {
    _HKLogDroppedErrorWithReason();
  }

  return 1;
}

- (void)reportDailyAnalyticsWithCoordinator:(id)a3 completion:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v8 = [WeakRetained database];

  BOOL v9 = [(HDAWDSubmissionManager *)self aggregateDatabaseSizeStats:v6];
  id v10 = v6;
  if (self)
  {
    id v11 = objc_loadWeakRetained((id *)&self->_profile);
    id v12 = [v11 deviceContextManager];
    id v38 = 0;
    id v13 = [v12 numberOfDeviceContextsPerDeviceType:&v38];
    id v14 = v38;

    if (v14)
    {
      _HKInitializeLogging();
      id v15 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        id v40 = self;
        __int16 v41 = 2114;
        id v42 = v14;
        _os_log_error_impl(&dword_1BCB7D000, v15, OS_LOG_TYPE_ERROR, "%{public}@: Failed to get device contexts dictionary for healthd daily analytics: %{public}@", buf, 0x16u);
      }
    }
    id v16 = [v13 objectForKeyedSubscript:&unk_1F17ED290];
    if (v16)
    {
      int64_t v17 = [v13 objectForKeyedSubscript:&unk_1F17ED290];
      [v10 setObject:v17 forKeyedSubscript:@"countPairediPhone"];
    }
    else
    {
      [v10 setObject:&unk_1F17ED2A8 forKeyedSubscript:@"countPairediPhone"];
    }

    id v18 = [v13 objectForKeyedSubscript:&unk_1F17ED2C0];
    if (v18)
    {
      double v19 = [v13 objectForKeyedSubscript:&unk_1F17ED2C0];
      [v10 setObject:v19 forKeyedSubscript:@"countPairediPad"];
    }
    else
    {
      [v10 setObject:&unk_1F17ED2A8 forKeyedSubscript:@"countPairediPad"];
    }

    id v20 = [v13 objectForKeyedSubscript:&unk_1F17ED2D8];
    if (v20)
    {
      double v21 = [v13 objectForKeyedSubscript:&unk_1F17ED2D8];
      [v10 setObject:v21 forKeyedSubscript:@"countPairedWatch"];
    }
    else
    {
      [v10 setObject:&unk_1F17ED2A8 forKeyedSubscript:@"countPairedWatch"];
    }

    BOOL v22 = [v13 objectForKeyedSubscript:&unk_1F17ED2F0];
    if (v22)
    {
      id v23 = [v13 objectForKeyedSubscript:&unk_1F17ED2F0];
      [v10 setObject:v23 forKeyedSubscript:@"countPairedVisionPro"];
    }
    else
    {
      [v10 setObject:&unk_1F17ED2A8 forKeyedSubscript:@"countPairedVisionPro"];
    }
  }
  id v24 = +[HDDatabaseTransactionContext contextForReadingProtectedData];
  id v37 = 0;
  uint64_t v31 = MEMORY[0x1E4F143A8];
  uint64_t v32 = 3221225472;
  char v33 = __73__HDAWDSubmissionManager_reportDailyAnalyticsWithCoordinator_completion___block_invoke;
  v34 = &unk_1E62F2AE0;
  v35 = self;
  id v25 = v10;
  id v36 = v25;
  int v26 = [v8 performTransactionWithContext:v24 error:&v37 block:&v31 inaccessibilityHandler:0];
  id v27 = v37;

  if (self && (v26 & v9 & 1) != 0)
  {
    (*((void (**)(id, id, void, void))v5 + 2))(v5, v25, 0, 0);
  }
  else
  {
    int v28 = objc_msgSend(v27, "hk_isDatabaseAccessibilityError", v31, v32, v33, v34, v35);
    _HKInitializeLogging();
    id v29 = *MEMORY[0x1E4F29F28];
    id v30 = *MEMORY[0x1E4F29F28];
    if (v28)
    {
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v40 = self;
        __int16 v41 = 2114;
        id v42 = v27;
        _os_log_impl(&dword_1BCB7D000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@: Database inaccessible while computing usage metric, will retry: %{public}@", buf, 0x16u);
      }
    }
    else if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v40 = self;
      __int16 v41 = 2114;
      id v42 = v27;
      _os_log_error_impl(&dword_1BCB7D000, v29, OS_LOG_TYPE_ERROR, "%{public}@: Failed queries for daily healthd metrics, will retry: %{public}@", buf, 0x16u);
    }
    (*((void (**)(id, void, uint64_t, id))v5 + 2))(v5, 0, 2, v27);
  }
}

uint64_t __73__HDAWDSubmissionManager_reportDailyAnalyticsWithCoordinator_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = [*(id *)(a1 + 32) _manuallyEnteredTypesCountWithTransaction:v5 error:a3];
  if (v6 < 0) {
    goto LABEL_18;
  }
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)(a1 + 32);
  if (!v8)
  {
    uint64_t v14 = 0;
    goto LABEL_4;
  }
  BOOL v9 = NSString;
  id v10 = v5;
  id v11 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  id v12 = [v9 stringWithFormat:@"SELECT COUNT(*) FROM %@ WHERE (%@ & %llu) == 0", v11, @"source_options", 2];

  id v13 = [v10 unprotectedDatabase];

  uint64_t v14 = -[HDAWDSubmissionManager _countOfObjectsWithSQLQuery:database:error:bindingHandler:](v8, v12, v13, a3);
  if (v14 < 0)
  {
LABEL_18:
    uint64_t v30 = 0;
    goto LABEL_24;
  }
LABEL_4:
  id v15 = [MEMORY[0x1E4F1C9C8] date];
  id v16 = [v15 dateByAddingTimeInterval:-604800.0];

  uint64_t v17 = [*(id *)(a1 + 32) _nonAppleSourcesWithDataSince:v16 transaction:v5 error:a3];
  if (v17 < 0)
  {
    uint64_t v30 = 0;
  }
  else
  {
    uint64_t v32 = v17;
    char v33 = v16;
    if (!*(void *)(a1 + 32)) {
      goto LABEL_20;
    }
    uint64_t v18 = *MEMORY[0x1E4F65C78];
    id v19 = v5;
    id v20 = HDSourceEntityPredicateForAppleWatchSources();
    double v21 = [v19 unprotectedDatabase];

    BOOL v22 = +[HDSQLiteEntity countValueForProperty:v18 predicate:v20 database:v21 error:a3];

    if (v22)
    {
      id v23 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v22, "integerValue") > 0);

      if (v23)
      {
        if (v7 >= 10) {
          uint64_t v24 = 10;
        }
        else {
          uint64_t v24 = v7;
        }
        id v25 = [NSNumber numberWithLongLong:v24];
        [*(id *)(a1 + 40) setObject:v25 forKeyedSubscript:@"manuallyEnteredTypesCount"];

        if (v14 >= 5) {
          uint64_t v26 = 5;
        }
        else {
          uint64_t v26 = v14;
        }
        id v27 = [NSNumber numberWithLongLong:v26];
        [*(id *)(a1 + 40) setObject:v27 forKeyedSubscript:@"thirdPartyAppCounts"];

        if (v32 >= 5) {
          uint64_t v28 = 5;
        }
        else {
          uint64_t v28 = v32;
        }
        id v29 = [NSNumber numberWithLongLong:v28];
        [*(id *)(a1 + 40) setObject:v29 forKeyedSubscript:@"thirdPartyAppsWroteDataCount"];

        [*(id *)(a1 + 40) setObject:v23 forKeyedSubscript:@"hasWatchSource"];
        uint64_t v30 = 1;
      }
      else
      {
        uint64_t v30 = 0;
      }
    }
    else
    {
LABEL_20:
      uint64_t v30 = 0;
      id v23 = 0;
    }
    id v16 = v33;
  }
LABEL_24:

  return v30;
}

- (id)_activitySummaryForActivityCacheIndex:(int64_t)a3 error:(id *)a4
{
  uint64_t v7 = [HDActivitySummaryBuilder alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  BOOL v9 = [(HDActivitySummaryBuilder *)v7 initWithProfile:WeakRetained];

  [(HDActivitySummaryBuilder *)v9 setShouldIncludePrivateProperties:1];
  [(HDActivitySummaryBuilder *)v9 setShouldIncludeStatistics:0];
  [(HDActivitySummaryBuilder *)v9 setOrderByDateAscending:1];
  [(HDActivitySummaryBuilder *)v9 setLimit:1];
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__100;
  id v19 = __Block_byref_object_dispose__100;
  id v20 = 0;
  id v10 = HDActivityCacheEntityPredicateForCacheIndex(a3, 1);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __70__HDAWDSubmissionManager__activitySummaryForActivityCacheIndex_error___block_invoke;
  v14[3] = &unk_1E6301178;
  v14[4] = &v15;
  if ([(HDActivitySummaryBuilder *)v9 enumerateActivitySummariesWithPredicate:v10 error:a4 handler:v14])
  {
    id v11 = (void *)v16[5];
  }
  else
  {
    id v11 = 0;
  }
  id v12 = v11;

  _Block_object_dispose(&v15, 8);

  return v12;
}

void __70__HDAWDSubmissionManager__activitySummaryForActivityCacheIndex_error___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  *a3 = 1;
}

- (HDProfile)profile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);

  return (HDProfile *)WeakRetained;
}

- (id)testHandler
{
  return self->_testHandler;
}

- (void)setTestHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_testHandler, 0);
  objc_storeStrong((id *)&self->_fitnessDailyAction, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_serverConnectionsByComponentId, 0);

  objc_destroyWeak((id *)&self->_profile);
}

@end