@interface HDMCNotificationManager
- (HDMCNotificationManager)initWithProfile:(id)a3 analysisManager:(id)a4 settingsManager:(id)a5 deviceScopedStorageManager:(id)a6 notificationSyncManager:(id)a7;
- (HDRestorableAlarm)scheduler;
- (NSDate)unitTest_currentDateOverride;
- (id)_currentDate;
- (id)_notificationCategoriesWithBasicAnalytics;
- (id)_periodEventFromNotificationCategory:(id)a3 notificationFireDayIndex:(int64_t)a4;
- (id)_requestFromAlarmEvent:(id)a3;
- (id)scheduledNotificationsWithError:(id *)a3;
- (id)unitTest_didSkipNotificationForDueEventHandler;
- (void)_queue_alarm:(id)a3 didReceiveDueEvents:(id)a4;
- (void)_queue_notificationOrSensorInputSettingsDidChange;
- (void)_queue_removeAllScheduledNotificationsIfNotEnabled;
- (void)_queue_rescheduleNotificationsForAnalysis:(id)a3;
- (void)_triggerImmediateSyncWithReason:(id)a3;
- (void)_unitTest_didSkipNotificationForDueEvent:(id)a3 reason:(int64_t)a4;
- (void)didUpdateAnalysis:(id)a3;
- (void)featureSettingsManager:(id)a3 didUpdateSettingsForFeatureIdentifier:(id)a4;
- (void)invalidate;
- (void)setUnitTest_currentDateOverride:(id)a3;
- (void)setUnitTest_didSkipNotificationForDueEventHandler:(id)a3;
- (void)settingsManagerDidUpdateNotificationSettings:(id)a3;
- (void)start;
@end

@implementation HDMCNotificationManager

- (HDMCNotificationManager)initWithProfile:(id)a3 analysisManager:(id)a4 settingsManager:(id)a5 deviceScopedStorageManager:(id)a6 notificationSyncManager:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v44.receiver = self;
  v44.super_class = (Class)HDMCNotificationManager;
  v17 = [(HDMCNotificationManager *)&v44 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_analysisManager, a4);
    objc_storeWeak((id *)&v18->_profile, v12);
    uint64_t v19 = HKCreateSerialDispatchQueue();
    queue = v18->_queue;
    v18->_queue = (OS_dispatch_queue *)v19;

    objc_storeStrong((id *)&v18->_notificationSyncManager, a7);
    id v21 = objc_alloc(MEMORY[0x263F43308]);
    id v43 = v16;
    id v22 = v15;
    id v23 = v13;
    id WeakRetained = objc_loadWeakRetained((id *)&v18->_profile);
    uint64_t v25 = [v21 initWithProfile:WeakRetained clientIdentifier:@"HDMCNotificationManager" eventHandlerQueue:v18->_queue];
    scheduler = v18->_scheduler;
    v18->_scheduler = (HDRestorableAlarm *)v25;

    objc_storeStrong((id *)&v18->_settingsManager, a5);
    objc_storeStrong((id *)&v18->_deviceScopedStorageManager, a6);
    v27 = (void *)MEMORY[0x263F43218];
    id v28 = objc_loadWeakRetained((id *)&v18->_profile);
    uint64_t v29 = objc_msgSend(v27, "hdmc_syncedUnprotectedDomainWithProfile:", v28);
    fertileWindowNotificationStateKeyValueDomain = v18->_fertileWindowNotificationStateKeyValueDomain;
    v18->_fertileWindowNotificationStateKeyValueDomain = (HDKeyValueDomain *)v29;

    v31 = [HDMCOvulationConfirmationStateManager alloc];
    id v32 = objc_loadWeakRetained((id *)&v18->_profile);
    uint64_t v33 = [(HDMCOvulationConfirmationStateManager *)v31 initWithProfile:v32 settingsManager:v14 queue:v18->_queue];
    ovulationConfirmationStateManager = v18->_ovulationConfirmationStateManager;
    v18->_ovulationConfirmationStateManager = (HDMCOvulationConfirmationStateManager *)v33;

    v35 = (void *)MEMORY[0x263F43218];
    id v36 = objc_loadWeakRetained((id *)&v18->_profile);
    v37 = v35;
    id v13 = v23;
    id v15 = v22;
    id v16 = v43;
    uint64_t v38 = objc_msgSend(v37, "hdmc_menstrualCyclesUnconfirmedDeviationNotificationStateSyncedUnprotectedDomainWithProfile:", v36);
    unconfirmedDeviationStateKeyValueDomain = v18->_unconfirmedDeviationStateKeyValueDomain;
    v18->_unconfirmedDeviationStateKeyValueDomain = (HDKeyValueDomain *)v38;

    uint64_t v40 = objc_msgSend(MEMORY[0x263F43218], "hdmc_syncedMenstrualCyclesDefaultsDomainWithProfile:", v12);
    deviationDismissalKeyValueDomain = v18->_deviationDismissalKeyValueDomain;
    v18->_deviationDismissalKeyValueDomain = (HDKeyValueDomain *)v40;
  }
  return v18;
}

- (void)start
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __32__HDMCNotificationManager_start__block_invoke;
  block[3] = &unk_2647508B0;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __32__HDMCNotificationManager_start__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) registerObserver:*(void *)(a1 + 32) queue:*(void *)(*(void *)(a1 + 32) + 48) userInitiated:0];
  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = *(void **)(*(void *)(a1 + 32) + 104);
  uint64_t v5 = MEMORY[0x263EF8330];
  uint64_t v6 = 3221225472;
  v7 = __32__HDMCNotificationManager_start__block_invoke_2;
  v8 = &unk_264750A68;
  objc_copyWeak(&v9, &location);
  [v2 beginReceivingEventsWithHandler:&v5];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "addObserver:queue:", *(void *)(a1 + 32), *(void *)(*(void *)(a1 + 32) + 48), v5, v6, v7, v8);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  v4 = [WeakRetained featureSettingsManager];
  [v4 registerObserver:*(void *)(a1 + 32) featureIdentifier:*MEMORY[0x263F097A8] queue:*(void *)(*(void *)(a1 + 32) + 48)];

  objc_msgSend(*(id *)(a1 + 32), "_queue_removeAllScheduledNotificationsIfNotEnabled");
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __32__HDMCNotificationManager_start__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_queue_alarm:didReceiveDueEvents:", v6, v5);
}

- (void)invalidate
{
  [(HDMCAnalysisManager *)self->_analysisManager unregisterObserver:self];
  [(HDRestorableAlarm *)self->_scheduler invalidate];
  [(HKMCSettingsManager *)self->_settingsManager removeObserver:self];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v3 = [WeakRetained featureSettingsManager];
  [v3 unregisterObserver:self];
}

- (id)scheduledNotificationsWithError:(id *)a3
{
  v3 = [(HDRestorableAlarm *)self->_scheduler allScheduledEventsWithError:a3];
  v4 = objc_msgSend(v3, "hk_map:", &__block_literal_global_1);

  return v4;
}

id __59__HDMCNotificationManager_scheduledNotificationsWithError___block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x263F45180];
  id v3 = a2;
  id v4 = [v2 alloc];
  id v5 = objc_msgSend(v3, "hdmc_categoryIdentifier");
  id v6 = [v3 dueDateComponents];

  v7 = (void *)[v4 initWithCategory:v5 dueDateComponents:v6];
  return v7;
}

- (id)_currentDate
{
  unitTest_currentDateOverride = self->_unitTest_currentDateOverride;
  if (unitTest_currentDateOverride)
  {
    id v3 = unitTest_currentDateOverride;
  }
  else
  {
    id v3 = [MEMORY[0x263EFF910] date];
  }
  return v3;
}

- (void)_unitTest_didSkipNotificationForDueEvent:(id)a3 reason:(int64_t)a4
{
  unitTest_didSkipNotificationForDueEventHandler = (void (**)(id, id, int64_t))self->_unitTest_didSkipNotificationForDueEventHandler;
  if (unitTest_didSkipNotificationForDueEventHandler) {
    unitTest_didSkipNotificationForDueEventHandler[2](unitTest_didSkipNotificationForDueEventHandler, a3, a4);
  }
}

- (void)didUpdateAnalysis:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  int v5 = [(HKMCAnalysis *)self->_lastAnalysis isEqual:v4];
  deviationDismissalKeyValueDomain = self->_deviationDismissalKeyValueDomain;
  id v30 = 0;
  v7 = [(HDKeyValueDomain *)deviationDismissalKeyValueDomain hdmc_unconfirmedDeviationDismissalDayIndexWithError:&v30];
  id v8 = v30;
  id v9 = v8;
  if (v7) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = v8 == 0;
  }
  v11 = (os_log_t *)MEMORY[0x263F09930];
  if (!v10 && (_HKInitializeLogging(), os_log_type_enabled(*v11, OS_LOG_TYPE_ERROR)))
  {
    -[HDMCNotificationManager didUpdateAnalysis:]();
    if (!v5) {
      goto LABEL_12;
    }
  }
  else if (!v5)
  {
    goto LABEL_12;
  }
  NSInteger v12 = [(NSNumber *)self->_lastDismissalDayIndex integerValue];
  if (v12 == [v7 integerValue])
  {
    id v27 = v9;
    id v13 = [(HDMCNotificationManager *)self scheduledNotificationsWithError:&v27];
    id v14 = v27;

    _HKInitializeLogging();
    os_log_t v15 = *v11;
    if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = v15;
      v17 = objc_opt_class();
      v18 = NSNumber;
      id v19 = v17;
      v20 = objc_msgSend(v18, "numberWithUnsignedInteger:", objc_msgSend(v13, "count"));
      id v21 = [v13 description];
      *(_DWORD *)buf = 138543874;
      id v32 = v17;
      __int16 v33 = 2112;
      v34 = v20;
      __int16 v35 = 2112;
      id v36 = v21;
      _os_log_impl(&dword_225722000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] Skipping notification reschedule from identical analysis, current notifications: %@, %@", buf, 0x20u);
    }
    id v9 = v14;
    goto LABEL_15;
  }
LABEL_12:
  _HKInitializeLogging();
  os_log_t v22 = *v11;
  if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEFAULT))
  {
    id v23 = v22;
    v24 = objc_opt_class();
    *(_DWORD *)buf = 138543362;
    id v32 = v24;
    id v25 = v24;
    _os_log_impl(&dword_225722000, v23, OS_LOG_TYPE_DEFAULT, "[%{public}@] Rescheduling notifications based on analysis update", buf, 0xCu);
  }
  scheduler = self->_scheduler;
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __45__HDMCNotificationManager_didUpdateAnalysis___block_invoke;
  v28[3] = &unk_264750AB0;
  v28[4] = self;
  id v29 = v4;
  [(HDRestorableAlarm *)scheduler checkForDueEventsWithCompletion:v28];

LABEL_15:
}

void __45__HDMCNotificationManager_didUpdateAnalysis___block_invoke(uint64_t a1, uint64_t a2, char a3, void *a4)
{
  id v6 = a4;
  if ((a3 & 1) == 0)
  {
    _HKInitializeLogging();
    v7 = (void *)*MEMORY[0x263F09930];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
      __45__HDMCNotificationManager_didUpdateAnalysis___block_invoke_cold_1(a1, v7);
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "_queue_rescheduleNotificationsForAnalysis:", *(void *)(a1 + 40));
}

- (void)featureSettingsManager:(id)a3 didUpdateSettingsForFeatureIdentifier:(id)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(HDMCNotificationManager *)self _queue_notificationOrSensorInputSettingsDidChange];
}

- (void)settingsManagerDidUpdateNotificationSettings:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(HDMCNotificationManager *)self _queue_notificationOrSensorInputSettingsDidChange];
  if ([(HKMCSettingsManager *)self->_settingsManager someNotificationsEnabled])
  {
    id v4 = [(HDMCAnalysisManager *)self->_analysisManager currentAnalysis];
    _HKInitializeLogging();
    int v5 = (void *)*MEMORY[0x263F09930];
    id v6 = *MEMORY[0x263F09930];
    if (v4)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = v5;
        *(_DWORD *)id v13 = 138543362;
        *(void *)&v13[4] = objc_opt_class();
        id v8 = *(id *)&v13[4];
        _os_log_impl(&dword_225722000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notification settings changed: rescheduling notifications using current analysis", v13, 0xCu);
      }
      -[HDMCNotificationManager _queue_rescheduleNotificationsForAnalysis:](self, "_queue_rescheduleNotificationsForAnalysis:", v4, *(_OWORD *)v13);
    }
    else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      -[HDMCNotificationManager settingsManagerDidUpdateNotificationSettings:](v5);
    }
  }
  else
  {
    _HKInitializeLogging();
    id v9 = (void *)*MEMORY[0x263F09930];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
    {
      BOOL v10 = v9;
      *(_DWORD *)id v13 = 138543362;
      *(void *)&v13[4] = objc_opt_class();
      id v11 = *(id *)&v13[4];
      _os_log_impl(&dword_225722000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notifications not enabled", v13, 0xCu);
    }
    lastAnalysis = self->_lastAnalysis;
    self->_lastAnalysis = 0;

    [(HDMCNotificationManager *)self _queue_removeAllScheduledNotificationsIfNotEnabled];
  }
}

- (id)_requestFromAlarmEvent:(id)a3
{
  id v3 = a3;
  id v4 = (void *)MEMORY[0x263F1DF48];
  int v5 = [v3 eventIdentifier];
  id v6 = objc_msgSend(v4, "hkmc_requestForCategoryIdentifier:", v5);

  if (!v6)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
      -[HDMCNotificationManager _requestFromAlarmEvent:]();
    }
  }

  return v6;
}

- (void)_queue_alarm:(id)a3 didReceiveDueEvents:(id)a4
{
  uint64_t v150 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  _HKInitializeLogging();
  id v8 = (void *)*MEMORY[0x263F09930];
  v122 = self;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v8;
    BOOL v10 = objc_opt_class();
    id v11 = NSNumber;
    id v12 = v10;
    id v13 = objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));
    *(_DWORD *)buf = 138543874;
    v145 = v10;
    __int16 v146 = 2114;
    v147 = v13;
    __int16 v148 = 2112;
    id v149 = v7;
    _os_log_impl(&dword_225722000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received %{public}@ due events: %@", buf, 0x20u);

    self = v122;
  }
  uint64_t v14 = [(HDMCNotificationManager *)self _currentDate];
  os_log_t v15 = [v14 dateByAddingTimeInterval:-86400.0];

  notificationSyncManager = self->_notificationSyncManager;
  id v141 = 0;
  uint64_t v17 = [(HDMCNotificationSyncManager *)notificationSyncManager holdInstructionCategoryIdentifiersWithError:&v141];
  id v18 = v141;
  id v118 = (id)v17;
  if (!v17)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
      -[HDMCNotificationManager _queue_alarm:didReceiveDueEvents:].cold.5();
    }
    id v118 = objc_alloc_init(MEMORY[0x263EFFA08]);
  }
  v110 = v6;
  int v19 = [(HKMCSettingsManager *)self->_settingsManager someNotificationsEnabledAndSupported];
  char v20 = v19;
  if (v19)
  {
    id v21 = [(HDMCDeviceScopedStorageManager *)self->_deviceScopedStorageManager accountDevicesInfoWithError:0];
    char v120 = [v21 shouldFireNotifications];
  }
  else
  {
    char v120 = 0;
  }
  v109 = v18;
  long long v139 = 0u;
  long long v140 = 0u;
  long long v137 = 0u;
  long long v138 = 0u;
  id obj = v7;
  uint64_t v22 = [obj countByEnumeratingWithState:&v137 objects:v143 count:16];
  v117 = v15;
  if (!v22)
  {
    id v119 = 0;
    id v115 = 0;
    id v116 = 0;
    goto LABEL_64;
  }
  uint64_t v23 = v22;
  id v119 = 0;
  id v115 = 0;
  id v116 = 0;
  uint64_t v24 = *(void *)v138;
  uint64_t v114 = *MEMORY[0x263F45070];
  do
  {
    uint64_t v25 = 0;
    do
    {
      if (*(void *)v138 != v24) {
        objc_enumerationMutation(obj);
      }
      v26 = *(void **)(*((void *)&v137 + 1) + 8 * v25);
      if ((v20 & 1) == 0)
      {
        _HKInitializeLogging();
        id v36 = (void *)*MEMORY[0x263F09930];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v37 = v36;
          uint64_t v38 = objc_opt_class();
          *(_DWORD *)buf = 138543618;
          v145 = v38;
          __int16 v146 = 2112;
          v147 = v26;
          id v39 = v38;
          _os_log_impl(&dword_225722000, v37, OS_LOG_TYPE_DEFAULT, "[%{public}@] Skipping sending notification for event; notifications are not enabled and supported: %@",
            buf,
            0x16u);
        }
        __int16 v33 = self;
        v34 = v26;
        uint64_t v35 = 0;
        goto LABEL_27;
      }
      if ((v120 & 1) == 0)
      {
        _HKInitializeLogging();
        uint64_t v40 = (void *)*MEMORY[0x263F09930];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
        {
          v41 = v40;
          v42 = objc_opt_class();
          *(_DWORD *)buf = 138543618;
          v145 = v42;
          __int16 v146 = 2112;
          v147 = v26;
          id v43 = v42;
          _os_log_impl(&dword_225722000, v41, OS_LOG_TYPE_DEFAULT, "[%{public}@] Skipping sending notification for event; other health devices have a higher algorithm version: %@",
            buf,
            0x16u);
        }
        __int16 v33 = self;
        v34 = v26;
        uint64_t v35 = 1;
        goto LABEL_27;
      }
      id v27 = objc_msgSend(*(id *)(*((void *)&v137 + 1) + 8 * v25), "currentDueDate", v109);
      int v28 = objc_msgSend(v27, "hk_isBeforeDate:", v15);

      if (v28)
      {
        _HKInitializeLogging();
        id v29 = (void *)*MEMORY[0x263F09930];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
        {
          id v30 = v29;
          v31 = objc_opt_class();
          *(_DWORD *)buf = 138543618;
          v145 = v31;
          __int16 v146 = 2112;
          v147 = v26;
          id v32 = v31;
          _os_log_impl(&dword_225722000, v30, OS_LOG_TYPE_DEFAULT, "[%{public}@] Skipping sending notification for event due more than one day ago: %@", buf, 0x16u);
        }
        __int16 v33 = self;
        v34 = v26;
        uint64_t v35 = 2;
LABEL_27:
        -[HDMCNotificationManager _unitTest_didSkipNotificationForDueEvent:reason:](v33, "_unitTest_didSkipNotificationForDueEvent:reason:", v34, v35, v109);
        goto LABEL_28;
      }
      objc_super v44 = (void *)MEMORY[0x22A634E00]();
      v45 = objc_msgSend(v26, "hdmc_categoryIdentifier");
      if ([v118 containsObject:v45])
      {
        _HKInitializeLogging();
        v46 = (void *)*MEMORY[0x263F09930];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
        {
          v47 = v46;
          v48 = objc_opt_class();
          *(_DWORD *)buf = 138543618;
          v145 = v48;
          __int16 v146 = 2114;
          v147 = v45;
          id v49 = v48;
          _os_log_impl(&dword_225722000, v47, OS_LOG_TYPE_DEFAULT, "[%{public}@] Skipping sending notification due to hold: %{public}@", buf, 0x16u);

          os_log_t v15 = v117;
        }
        [(HDMCNotificationManager *)self _unitTest_didSkipNotificationForDueEvent:v26 reason:3];
        goto LABEL_60;
      }
      if ([v45 isEqualToString:v114])
      {
        if (v116)
        {
          v50 = [v116 currentDueDate];
          v51 = [v26 currentDueDate];
          int v52 = objc_msgSend(v50, "hk_isBeforeDate:", v51);

          if (v52)
          {
            _HKInitializeLogging();
            v53 = (void *)*MEMORY[0x263F09930];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
            {
              v54 = v53;
              v55 = objc_opt_class();
              id v111 = v55;
              v56 = [v26 eventIdentifier];
              *(_DWORD *)buf = 138543618;
              v145 = v55;
              __int16 v146 = 2112;
              v147 = v56;
              _os_log_impl(&dword_225722000, v54, OS_LOG_TYPE_DEFAULT, "[%{public}@] Skipping sending notification for earlier event: %@", buf, 0x16u);
            }
            id v57 = v26;

            id v116 = v57;
          }
          os_log_t v15 = v117;
        }
        else
        {
          id v116 = v26;
        }
      }
      v58 = HKMCPeriodNotificationCategories();
      int v59 = [v58 containsObject:v45];

      if (!v59)
      {
        v68 = HKMCFertileWindowNotificationCategories();
        int v69 = [v68 containsObject:v45];

        if (v69)
        {
          if (v119)
          {
            v70 = [v119 currentDueDate];
            v71 = [v26 currentDueDate];
            int v72 = objc_msgSend(v70, "hk_isBeforeDate:", v71);

            if (v72)
            {
              _HKInitializeLogging();
              v73 = (void *)*MEMORY[0x263F09930];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
              {
                v74 = v73;
                v75 = objc_opt_class();
                id v113 = v75;
                v76 = [v26 eventIdentifier];
                *(_DWORD *)buf = 138543618;
                v145 = v75;
                __int16 v146 = 2112;
                v147 = v76;
                _os_log_impl(&dword_225722000, v74, OS_LOG_TYPE_DEFAULT, "[%{public}@] Skipping sending notification for earlier event: %@", buf, 0x16u);
              }
              id v77 = v26;

              id v119 = v77;
            }
            goto LABEL_54;
          }
          id v119 = v26;
        }
        else
        {
          _HKInitializeLogging();
          v78 = (void *)*MEMORY[0x263F09930];
          self = v122;
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
            goto LABEL_60;
          }
          v79 = v78;
          v80 = objc_opt_class();
          id v81 = v80;
          v82 = [v26 eventIdentifier];
          *(_DWORD *)buf = 138543618;
          v145 = v80;
          __int16 v146 = 2112;
          v147 = v82;
          _os_log_error_impl(&dword_225722000, v79, OS_LOG_TYPE_ERROR, "[%{public}@] Skipping sending notification for unknown event identifier type: %@", buf, 0x16u);

          os_log_t v15 = v117;
        }
LABEL_59:
        self = v122;
        goto LABEL_60;
      }
      if (!v115)
      {
        id v115 = v26;
        goto LABEL_59;
      }
      v60 = [v115 currentDueDate];
      v61 = [v26 currentDueDate];
      int v62 = objc_msgSend(v60, "hk_isBeforeDate:", v61);

      if (v62)
      {
        _HKInitializeLogging();
        v63 = (void *)*MEMORY[0x263F09930];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
        {
          v64 = v63;
          v65 = objc_opt_class();
          id v112 = v65;
          v66 = [v26 eventIdentifier];
          *(_DWORD *)buf = 138543618;
          v145 = v65;
          __int16 v146 = 2112;
          v147 = v66;
          _os_log_impl(&dword_225722000, v64, OS_LOG_TYPE_DEFAULT, "[%{public}@] Skipping sending notification for earlier event: %@", buf, 0x16u);
        }
        id v67 = v26;

        id v115 = v67;
      }
LABEL_54:
      self = v122;
      os_log_t v15 = v117;
LABEL_60:

LABEL_28:
      ++v25;
    }
    while (v23 != v25);
    uint64_t v83 = [obj countByEnumeratingWithState:&v137 objects:v143 count:16];
    uint64_t v23 = v83;
  }
  while (v83);
LABEL_64:

  v84 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:3];
  v85 = v110;
  if (!v116) {
    goto LABEL_67;
  }
  uint64_t v86 = -[HDMCNotificationManager _requestFromAlarmEvent:](self, "_requestFromAlarmEvent:");
  if (v86)
  {
    v87 = (void *)v86;
    [v84 addObject:v86];

LABEL_67:
    if (v115)
    {
      uint64_t v88 = -[HDMCNotificationManager _requestFromAlarmEvent:](self, "_requestFromAlarmEvent:");
      if (v88)
      {
        v89 = (void *)v88;
        [v84 addObject:v88];

        goto LABEL_70;
      }
    }
    else
    {
LABEL_70:
      if (!v119) {
        goto LABEL_87;
      }
      uint64_t v90 = objc_msgSend(v119, "hdmc_fertileWindowEndDayIndex");
      ovulationConfirmationStateManager = self->_ovulationConfirmationStateManager;
      id v136 = 0;
      v92 = [(HDMCOvulationConfirmationStateManager *)ovulationConfirmationStateManager scheduledNotificationFertileWindowEndDayIndexWithEvent:v119 error:&v136];
      id v93 = v136;
      if (v92 && [v92 integerValue])
      {
        uint64_t v90 = [v92 integerValue];
      }
      else
      {
        _HKInitializeLogging();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
          -[HDMCNotificationManager _queue_alarm:didReceiveDueEvents:]();
        }
      }
      v94 = self->_ovulationConfirmationStateManager;
      id v135 = v93;
      v95 = -[HDMCOvulationConfirmationStateManager scheduledNotificationDaysShiftedFromCalendarMethodWithEvent:error:](v94, "scheduledNotificationDaysShiftedFromCalendarMethodWithEvent:error:", v119, &v135, v109);
      id v96 = v135;

      if (!v95)
      {
        _HKInitializeLogging();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
          -[HDMCNotificationManager _queue_alarm:didReceiveDueEvents:]();
        }
      }
      v97 = (void *)MEMORY[0x263F1DF48];
      v98 = objc_msgSend(v119, "hdmc_categoryIdentifier");
      v99 = objc_msgSend(v97, "hkmc_requestForCategoryIdentifier:fertileWindowEndDayIndex:daysShiftedFromCalendarMethod:", v98, v90, v95);

      if (v99)
      {
        os_log_t v15 = v117;
        if (v90)
        {
          _HKInitializeLogging();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
            -[HDMCNotificationManager _queue_alarm:didReceiveDueEvents:]();
          }
          [v84 addObject:v99];
        }
      }
      else
      {
        _HKInitializeLogging();
        os_log_t v15 = v117;
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
          -[HDMCNotificationManager _queue_alarm:didReceiveDueEvents:]();
        }
      }

      if (v99)
      {
LABEL_87:
        v100 = dispatch_group_create();
        long long v131 = 0u;
        long long v132 = 0u;
        long long v133 = 0u;
        long long v134 = 0u;
        id v121 = v84;
        uint64_t v101 = [v121 countByEnumeratingWithState:&v131 objects:v142 count:16];
        if (v101)
        {
          uint64_t v102 = v101;
          uint64_t v103 = *(void *)v132;
          do
          {
            for (uint64_t i = 0; i != v102; ++i)
            {
              if (*(void *)v132 != v103) {
                objc_enumerationMutation(v121);
              }
              uint64_t v105 = *(void *)(*((void *)&v131 + 1) + 8 * i);
              dispatch_group_enter(v100);
              id WeakRetained = objc_loadWeakRetained((id *)&v122->_profile);
              v107 = [WeakRetained notificationManager];
              v128[0] = MEMORY[0x263EF8330];
              v128[1] = 3221225472;
              v128[2] = __60__HDMCNotificationManager__queue_alarm_didReceiveDueEvents___block_invoke;
              v128[3] = &unk_264750AD8;
              v128[4] = v122;
              v128[5] = v105;
              id v129 = v119;
              v130 = v100;
              [v107 postNotificationWithRequest:v105 completion:v128];
            }
            uint64_t v102 = [v121 countByEnumeratingWithState:&v131 objects:v142 count:16];
          }
          while (v102);
        }

        queue = v122->_queue;
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __60__HDMCNotificationManager__queue_alarm_didReceiveDueEvents___block_invoke_307;
        block[3] = &unk_264750B00;
        v85 = v110;
        id v125 = v110;
        id v126 = obj;
        v127 = v122;
        dispatch_group_async(v100, queue, block);

        os_log_t v15 = v117;
      }
    }
  }
}

void __60__HDMCNotificationManager__queue_alarm_didReceiveDueEvents___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v84 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (a2)
  {
    id v6 = [*(id *)(a1 + 40) content];
    id v7 = [v6 categoryIdentifier];
    uint64_t v8 = *MEMORY[0x263F45078];
    int v9 = [v7 isEqualToString:*MEMORY[0x263F45078]];

    if (v9)
    {
      BOOL v10 = [*(id *)(a1 + 32) _currentDate];
      id v11 = *(void **)(*(void *)(a1 + 32) + 56);
      id v79 = 0;
      char v12 = objc_msgSend(v11, "hdmc_setUpdatedFertileWindowNotificationFireDate:error:", v10, &v79);
      id v13 = v79;
      _HKInitializeLogging();
      uint64_t v14 = (void *)*MEMORY[0x263F09930];
      os_log_t v15 = *MEMORY[0x263F09930];
      if (v12)
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          id v16 = v14;
          uint64_t v17 = objc_opt_class();
          id v18 = v17;
          HKSensitiveLogItem();
          v20 = id v19 = v5;
          *(_DWORD *)buf = 138543618;
          id v81 = v17;
          __int16 v82 = 2112;
          uint64_t v83 = v20;
          _os_log_impl(&dword_225722000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] Successfully saved date fired for update fertile window notification in key value domain with date: %@", buf, 0x16u);

          id v5 = v19;
        }
        [*(id *)(a1 + 32) _triggerImmediateSyncWithReason:@"hdmc_setUpdatedFertileWindowNotificationFireDate"];
      }
      else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        __60__HDMCNotificationManager__queue_alarm_didReceiveDueEvents___block_invoke_cold_5(a1 + 32, v14);
      }
    }
    uint64_t v23 = *(void *)(a1 + 32);
    uint64_t v22 = *(void *)(a1 + 40);
    uint64_t v24 = (id *)(a1 + 32);
    uint64_t v25 = *(void **)(v23 + 64);
    uint64_t v26 = *(void *)(v23 + 40);
    id v78 = 0;
    char v27 = [v25 transitionToFiredNotificationStateWithRequest:v22 settingsManager:v26 error:&v78];
    id v28 = v78;
    if ((v27 & 1) == 0)
    {
      _HKInitializeLogging();
      id v29 = (void *)*MEMORY[0x263F09930];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
        __60__HDMCNotificationManager__queue_alarm_didReceiveDueEvents___block_invoke_cold_4(a1 + 32, v29);
      }
    }
    id v30 = [*(id *)(a1 + 40) content];
    v31 = [v30 categoryIdentifier];
    int v32 = [v31 isEqualToString:*MEMORY[0x263F45070]];

    if (v32)
    {
      __int16 v33 = (void *)*((void *)*v24 + 9);
      id v77 = 0;
      v34 = objc_msgSend(v33, "hdmc_menstrualCyclesUnconfirmedDeviationNotificationGetStateWithError:", &v77);
      id v35 = v77;
      if (v34)
      {
        id v36 = v28;
        uint64_t v37 = [*v24 _currentDate];
        uint64_t v38 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendar");
        id v39 = objc_msgSend(v34, "computeFiredStateWithCurrentDayIndex:", objc_msgSend(v37, "hk_dayIndexWithCalendar:", v38));

        if (v39)
        {
          uint64_t v40 = (void *)*((void *)*v24 + 9);
          id v76 = 0;
          char v41 = objc_msgSend(v40, "hdmc_menstrualCyclesUnconfirmedDeviationNotificationSetValuesWithState:error:", v39, &v76);
          id v42 = v76;
          if (v41)
          {
            [*v24 _triggerImmediateSyncWithReason:@"UnconfirmedDeviationNotificationSetValuesWithState"];
          }
          else
          {
            _HKInitializeLogging();
            v45 = (void *)*MEMORY[0x263F09930];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
              __60__HDMCNotificationManager__queue_alarm_didReceiveDueEvents___block_invoke_cold_3(a1 + 32, v45);
            }
          }
        }
        else
        {
          _HKInitializeLogging();
          objc_super v44 = (void *)*MEMORY[0x263F09930];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
            __60__HDMCNotificationManager__queue_alarm_didReceiveDueEvents___block_invoke_cold_2(a1 + 32, v44);
          }
        }

        id v28 = v36;
      }
      else
      {
        _HKInitializeLogging();
        id v43 = (void *)*MEMORY[0x263F09930];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
          __60__HDMCNotificationManager__queue_alarm_didReceiveDueEvents___block_invoke_cold_1(a1 + 32, v43);
        }
      }
    }
    v46 = objc_msgSend(*(id *)(a1 + 48), "hdmc_categoryIdentifier");
    if ([v46 isEqualToString:v8])
    {
      v47 = objc_msgSend(*(id *)(a1 + 48), "hdmc_categoryIdentifier");
      v48 = [*(id *)(a1 + 40) content];
      id v49 = [v48 categoryIdentifier];
      int v50 = [v47 isEqualToString:v49];

      if (v50)
      {
        v74 = (void *)MEMORY[0x263F45190];
        v51 = [*(id *)(a1 + 40) content];
        uint64_t v52 = [v51 categoryIdentifier];
        v53 = (void *)v52;
        v54 = @"nil";
        if (v52) {
          v54 = (__CFString *)v52;
        }
        v73 = v54;
        id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
        v56 = [WeakRetained notificationManager];
        unsigned int v72 = [v56 areHealthNotificationsAuthorized];
        id v75 = v5;
        v71 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 48), "hdmc_fertileWindowDayShift"));
        id v57 = NSNumber;
        id v58 = v28;
        uint64_t v59 = objc_msgSend(*(id *)(a1 + 48), "hdmc_fertileWindowEndDayIndex");
        v60 = [*(id *)(a1 + 32) _currentDate];
        v61 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendar");
        uint64_t v62 = v59 - objc_msgSend(v60, "hk_dayIndexWithCalendar:", v61);
        id v28 = v58;
        v63 = [v57 numberWithInteger:v62];
        objc_msgSend(v74, "submitMetricForCategory:areHealthNotificationsAuthorized:numberOfDaysShiftedForFertileWindow:numberOfDaysOffsetFromFertileWindowEnd:numberOfDaysWithWristTemp45DaysBeforeOvulationConfirmedNotification:internalLiveOnCycleFactorOverrideEnabled:", v73, v72, v71, v63, 0, objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "internalCycleFactorsOverrideEnabled"));

        id v5 = v75;
        goto LABEL_40;
      }
    }
    else
    {
    }
    v64 = [*(id *)(a1 + 32) _notificationCategoriesWithBasicAnalytics];
    v65 = [*(id *)(a1 + 40) content];
    v66 = [v65 categoryIdentifier];
    int v67 = [v64 containsObject:v66];

    if (!v67)
    {
LABEL_41:

      goto LABEL_42;
    }
    v68 = (void *)MEMORY[0x263F45190];
    v51 = [*(id *)(a1 + 40) content];
    uint64_t v69 = [v51 categoryIdentifier];
    v53 = (void *)v69;
    if (v69) {
      v70 = (__CFString *)v69;
    }
    else {
      v70 = @"nil";
    }
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
    v56 = [WeakRetained notificationManager];
    objc_msgSend(v68, "submitMetricForCategory:areHealthNotificationsAuthorized:internalLiveOnCycleFactorOverrideEnabled:", v70, objc_msgSend(v56, "areHealthNotificationsAuthorized"), objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "internalCycleFactorsOverrideEnabled"));
LABEL_40:

    goto LABEL_41;
  }
  _HKInitializeLogging();
  id v21 = (void *)*MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
    __60__HDMCNotificationManager__queue_alarm_didReceiveDueEvents___block_invoke_cold_6(a1, v21);
  }
LABEL_42:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __60__HDMCNotificationManager__queue_alarm_didReceiveDueEvents___block_invoke_307(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v13 = 0;
  char v4 = [v2 removeEvents:v3 error:&v13];
  id v5 = v13;
  if ((v4 & 1) == 0)
  {
    _HKInitializeLogging();
    id v6 = (void *)*MEMORY[0x263F09930];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR))
    {
      id v7 = v6;
      uint64_t v8 = objc_opt_class();
      int v9 = *(void **)(a1 + 40);
      id v10 = v8;
      uint64_t v11 = [v9 count];
      uint64_t v12 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138544130;
      os_log_t v15 = v8;
      __int16 v16 = 2048;
      uint64_t v17 = v11;
      __int16 v18 = 2112;
      uint64_t v19 = v12;
      __int16 v20 = 2114;
      id v21 = v5;
      _os_log_error_impl(&dword_225722000, v7, OS_LOG_TYPE_ERROR, "[%{public}@] Error removing %ld due events (%@) after firing notification: %{public}@", buf, 0x2Au);
    }
  }
}

- (id)_notificationCategoriesWithBasicAnalytics
{
  v2 = HKMCAllNotificationCategories();
  uint64_t v3 = HKMCSensorBasedFertileWindowNotificationCategories();
  char v4 = [v2 arrayByExcludingObjectsInArray:v3];

  return v4;
}

- (id)_periodEventFromNotificationCategory:(id)a3 notificationFireDayIndex:(int64_t)a4
{
  settingsManager = self->_settingsManager;
  id v7 = a3;
  uint64_t v8 = [(HKMCSettingsManager *)settingsManager hdmc_dateComponentsForMenstruationNotificationOnDayIndex:a4];
  int v9 = [(HDRestorableAlarm *)self->_scheduler eventWithIdentifier:v7 dueDateComponents:v8 eventOptions:0];

  return v9;
}

- (void)_queue_rescheduleNotificationsForAnalysis:(id)a3
{
  uint64_t v179 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = [(HDMCNotificationManager *)self _currentDate];
  id v6 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:4];
  int v7 = [(HKMCSettingsManager *)self->_settingsManager menstruationNotificationsEnabled];
  uint64_t v8 = (os_log_t *)MEMORY[0x263F09930];
  if (v7)
  {
    int v9 = objc_msgSend(v4, "hdmc_beforePeriodStartNotification");
    v160 = v9;
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = [v9 category];
      uint64_t v12 = -[HDMCNotificationManager _periodEventFromNotificationCategory:notificationFireDayIndex:](self, "_periodEventFromNotificationCategory:notificationFireDayIndex:", v11, [v10 fireOnDayIndex]);

      id v13 = [v12 currentDueDate];
      int v14 = objc_msgSend(v13, "hk_isAfterDate:", v5);

      if (v14)
      {
        [v6 addObject:v12];
      }
      else
      {
        _HKInitializeLogging();
        os_log_t v15 = *v8;
        if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v16 = v15;
          uint64_t v17 = objc_opt_class();
          id v18 = v17;
          HKSensitiveLogItem();
          uint64_t v19 = v6;
          id v21 = v20 = v8;
          *(_DWORD *)buf = 138543618;
          v172 = v17;
          __int16 v173 = 2112;
          os_log_t v174 = v21;
          _os_log_impl(&dword_225722000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] Skipping scheduling past due event %@", buf, 0x16u);

          uint64_t v8 = v20;
          id v6 = v19;
        }
      }
    }
    uint64_t v22 = objc_msgSend(v4, "hdmc_afterPeriodStartNotification");
    uint64_t v23 = v22;
    if (v22)
    {
      uint64_t v24 = [v22 category];
      uint64_t v25 = -[HDMCNotificationManager _periodEventFromNotificationCategory:notificationFireDayIndex:](self, "_periodEventFromNotificationCategory:notificationFireDayIndex:", v24, [v23 fireOnDayIndex]);

      uint64_t v26 = [v25 currentDueDate];
      int v27 = objc_msgSend(v26, "hk_isAfterDate:", v5);

      if (v27)
      {
        [v6 addObject:v25];
      }
      else
      {
        _HKInitializeLogging();
        os_log_t v28 = *v8;
        if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
        {
          id v29 = v28;
          id v30 = objc_opt_class();
          id v31 = v30;
          HKSensitiveLogItem();
          v33 = int v32 = v5;
          *(_DWORD *)buf = 138543618;
          v172 = v30;
          __int16 v173 = 2112;
          os_log_t v174 = v33;
          _os_log_impl(&dword_225722000, v29, OS_LOG_TYPE_DEFAULT, "[%{public}@] Skipping scheduling past due event %@", buf, 0x16u);

          id v5 = v32;
        }
      }
    }
    v34 = objc_msgSend(v4, "hdmc_afterPeriodEndNotification");
    id v35 = v34;
    if (v34)
    {
      id v36 = [v34 category];
      uint64_t v37 = -[HDMCNotificationManager _periodEventFromNotificationCategory:notificationFireDayIndex:](self, "_periodEventFromNotificationCategory:notificationFireDayIndex:", v36, [v35 fireOnDayIndex]);

      uint64_t v38 = [v37 currentDueDate];
      int v39 = objc_msgSend(v38, "hk_isAfterDate:", v5);

      if (v39)
      {
        [v6 addObject:v37];
      }
      else
      {
        _HKInitializeLogging();
        uint64_t v40 = (void *)*MEMORY[0x263F09930];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
        {
          char v41 = v40;
          id v42 = objc_opt_class();
          v156 = v5;
          id v43 = v42;
          objc_super v44 = HKSensitiveLogItem();
          *(_DWORD *)buf = 138543618;
          v172 = v42;
          __int16 v173 = 2112;
          os_log_t v174 = v44;
          _os_log_impl(&dword_225722000, v41, OS_LOG_TYPE_DEFAULT, "[%{public}@] Skipping scheduling past due event %@", buf, 0x16u);

          id v5 = v156;
        }
      }
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    v46 = [WeakRetained daemon];
    v47 = [v46 behavior];
    char v48 = [v47 isAppleWatch];

    if ((v48 & 1) == 0)
    {
      v157 = v5;
      unconfirmedDeviationStateKeyValueDomain = self->_unconfirmedDeviationStateKeyValueDomain;
      id v169 = 0;
      int v50 = [(HDKeyValueDomain *)unconfirmedDeviationStateKeyValueDomain hdmc_menstrualCyclesUnconfirmedDeviationNotificationGetStateWithError:&v169];
      id v51 = v169;
      if (!v50)
      {
        _HKInitializeLogging();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
          -[HDMCNotificationManager _queue_rescheduleNotificationsForAnalysis:].cold.5();
        }
      }

      deviationDismissalKeyValueDomain = self->_deviationDismissalKeyValueDomain;
      id v168 = 0;
      v53 = [(HDKeyValueDomain *)deviationDismissalKeyValueDomain hdmc_unconfirmedDeviationDismissalDayIndexWithError:&v168];
      v54 = v168;
      os_log_t v55 = v54;
      if (v53 || !v54)
      {
        if (v50)
        {
          objc_storeStrong((id *)&self->_lastDismissalDayIndex, v53);
          v56 = [(HDMCNotificationManager *)self _currentDate];
          id v57 = [(HKMCSettingsManager *)self->_settingsManager menstruationNotificationTimeOfDay];
          v154 = v53;
          id v58 = [v50 computeNewStateFromAnalysis:v4 dismissalDayIndex:v53 currentDate:v56 unconfirmedDeviationNotificationTimeOfDay:v57];

          uint64_t v59 = v58;
          v60 = [v58 scheduledNotificationFireDayIndex];

          if (v60)
          {
            v61 = *MEMORY[0x263F45070];
            os_log_t log = v59;
            uint64_t v62 = [v59 scheduledNotificationFireDayIndex];
            os_log_t v146 = v61;
            v63 = -[HDMCNotificationManager _periodEventFromNotificationCategory:notificationFireDayIndex:](self, "_periodEventFromNotificationCategory:notificationFireDayIndex:", v61, [v62 integerValue]);

            v64 = [v63 currentDueDate];
            int v65 = objc_msgSend(v64, "hk_isAfterDate:", v157);

            if (v65)
            {
              [v6 addObject:v63];
            }
            else
            {
              _HKInitializeLogging();
              v66 = (void *)*MEMORY[0x263F09930];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
              {
                int v67 = v66;
                v68 = objc_opt_class();
                *(_DWORD *)buf = 138543618;
                v172 = v68;
                __int16 v173 = 2112;
                os_log_t v174 = v146;
                id v69 = v68;
                _os_log_impl(&dword_225722000, v67, OS_LOG_TYPE_DEFAULT, "[%{public}@] Skipping scheduling past due event %@", buf, 0x16u);
              }
            }

            uint64_t v59 = log;
          }
          if ([v50 isEqual:v59])
          {
            _HKInitializeLogging();
            v70 = (void *)*MEMORY[0x263F09930];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
            {
              logb = v70;
              v71 = v59;
              unsigned int v72 = objc_opt_class();
              os_log_t v147 = v72;
              v73 = HKSensitiveLogItem();
              *(_DWORD *)buf = 138543618;
              v172 = v72;
              uint64_t v59 = v71;
              __int16 v173 = 2114;
              os_log_t v174 = v73;
              _os_log_impl(&dword_225722000, logb, OS_LOG_TYPE_DEFAULT, "[%{public}@] Deviation notification state unchanged: %{public}@", buf, 0x16u);
            }
            v53 = v154;
          }
          else
          {
            v74 = self->_unconfirmedDeviationStateKeyValueDomain;
            os_log_t v167 = v55;
            BOOL v75 = [(HDKeyValueDomain *)v74 hdmc_menstrualCyclesUnconfirmedDeviationNotificationSetValuesWithState:v59 error:&v167];
            os_log_t v148 = v167;

            v53 = v154;
            if (v75)
            {
              _HKInitializeLogging();
              id v76 = (void *)*MEMORY[0x263F09930];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
              {
                v143 = v76;
                id v77 = objc_opt_class();
                id v144 = v77;
                v142 = HKSensitiveLogItem();
                id v78 = HKSensitiveLogItem();
                [(HDKeyValueDomain *)self->_unconfirmedDeviationStateKeyValueDomain domainName];
                id v79 = logc = v59;
                *(_DWORD *)buf = 138544130;
                v172 = v77;
                __int16 v173 = 2114;
                os_log_t v174 = v142;
                __int16 v175 = 2114;
                v176 = v78;
                __int16 v177 = 2114;
                v178 = v79;
                _os_log_impl(&dword_225722000, v143, OS_LOG_TYPE_DEFAULT, "[%{public}@] Successfully transitioned old state: %{public}@ -> new state: %{public}@ in key value domain: %{public}@", buf, 0x2Au);

                uint64_t v59 = logc;
                v53 = v154;
              }
              [(HDMCNotificationManager *)self _triggerImmediateSyncWithReason:@"UnconfirmedDeviationNotificationSetValuesWithState", v142];
            }
            os_log_t v55 = v148;
          }
        }
      }
      else
      {
        _HKInitializeLogging();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
          -[HDMCNotificationManager _queue_rescheduleNotificationsForAnalysis:].cold.4();
        }
      }

      id v5 = v157;
    }

    uint64_t v8 = (os_log_t *)MEMORY[0x263F09930];
  }
  if ([(HKMCSettingsManager *)self->_settingsManager fertileWindowNotificationsEnabled])
  {
    v80 = objc_msgSend(v4, "hdmc_beforeFertileWindowStartNotification");
    id v81 = v80;
    if (v80)
    {
      __int16 v82 = -[HKMCSettingsManager hdmc_dateComponentsForFertileWindowNotificationOnDayIndex:](self->_settingsManager, "hdmc_dateComponentsForFertileWindowNotificationOnDayIndex:", [v80 fireOnDayIndex]);
      scheduler = self->_scheduler;
      uint64_t v84 = [v81 category];
      v85 = [(HDRestorableAlarm *)scheduler eventWithIdentifier:v84 dueDateComponents:v82 eventOptions:0];

      uint64_t v86 = [v85 currentDueDate];
      LODWORD(v84) = objc_msgSend(v86, "hk_isAfterDate:", v5);

      if (v84)
      {
        [v6 addObject:v85];
      }
      else
      {
        _HKInitializeLogging();
        os_log_t v87 = *v8;
        if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v88 = v87;
          v89 = objc_opt_class();
          id v158 = v89;
          [v81 category];
          v161 = v6;
          uint64_t v90 = v8;
          v92 = v91 = v5;
          *(_DWORD *)buf = 138543618;
          v172 = v89;
          __int16 v173 = 2112;
          os_log_t v174 = v92;
          _os_log_impl(&dword_225722000, v88, OS_LOG_TYPE_DEFAULT, "[%{public}@] Skipping scheduling past due event %@", buf, 0x16u);

          id v5 = v91;
          uint64_t v8 = v90;
          id v6 = v161;
        }
      }
    }
    id v93 = objc_loadWeakRetained((id *)&self->_profile);
    v94 = [v93 daemon];
    v95 = [v94 behavior];
    char v96 = [v95 isAppleWatch];

    if ((v96 & 1) == 0)
    {
      fertileWindowNotificationStateKeyValueDomain = self->_fertileWindowNotificationStateKeyValueDomain;
      id v166 = 0;
      uint64_t v98 = [(HDKeyValueDomain *)fertileWindowNotificationStateKeyValueDomain hdmc_updatedFertileWindowNotificationFireDateWithError:&v166];
      id v99 = v166;
      v100 = v99;
      v162 = (void *)v98;
      if (v98 || !v99)
      {
        uint64_t v101 = [(HKMCSettingsManager *)self->_settingsManager fertileWindowNotificationTimeOfDay];
        uint64_t v102 = objc_msgSend(v4, "hdmc_fertileWindowDidUpdateDueToSensorDataNotificationForNotificationFireDate:lastFiredDate:fertileWindowNotificationTimeOfDay:", v5, v98, v101);

        if (v102)
        {
          uint64_t v103 = -[HKMCSettingsManager hdmc_dateComponentsForFertileWindowNotificationOnDayIndex:](self->_settingsManager, "hdmc_dateComponentsForFertileWindowNotificationOnDayIndex:", [v102 fireOnDayIndex]);
          os_log_t loga = [v102 eventIdentifierFromUpdateFertileWindowNotification];
          v155 = (void *)v103;
          v104 = -[HDRestorableAlarm eventWithIdentifier:dueDateComponents:eventOptions:](self->_scheduler, "eventWithIdentifier:dueDateComponents:eventOptions:");
          uint64_t v105 = [v104 currentDueDate];
          v159 = v5;
          int v106 = objc_msgSend(v105, "hk_isAfterDate:", v5);

          if (v106)
          {
            [v6 addObject:v104];
          }
          else
          {
            _HKInitializeLogging();
            v107 = (void *)*MEMORY[0x263F09930];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
            {
              id v149 = v107;
              v108 = objc_opt_class();
              id v145 = v108;
              v109 = [v102 category];
              *(_DWORD *)buf = 138543618;
              v172 = v108;
              __int16 v173 = 2112;
              os_log_t v174 = v109;
              _os_log_impl(&dword_225722000, v149, OS_LOG_TYPE_DEFAULT, "[%{public}@] Skipping scheduling past due event %@", buf, 0x16u);
            }
          }

          id v5 = v159;
          uint64_t v8 = (os_log_t *)MEMORY[0x263F09930];
        }
      }
      else
      {
        _HKInitializeLogging();
        if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR)) {
          -[HDMCNotificationManager _queue_rescheduleNotificationsForAnalysis:]();
        }
      }
      _HKInitializeLogging();
      v110 = v8;
      os_log_t v111 = *v8;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
      {
        id v112 = v111;
        id v113 = objc_opt_class();
        *(_DWORD *)buf = 138543362;
        v172 = v113;
        id v114 = v113;
        _os_log_impl(&dword_225722000, v112, OS_LOG_TYPE_DEFAULT, "[%{public}@] Computing scheduled events for ovulation confirmation", buf, 0xCu);
      }
      ovulationConfirmationStateManager = self->_ovulationConfirmationStateManager;
      settingsManager = self->_settingsManager;
      v117 = self->_scheduler;
      id v165 = v100;
      id v118 = [(HDMCOvulationConfirmationStateManager *)ovulationConfirmationStateManager eventsToScheduleForAnalysis:v4 settingsManager:settingsManager scheduler:v117 error:&v165];
      id v119 = v165;

      if (v118)
      {
        [v6 addObjectsFromArray:v118];
      }
      else
      {
        _HKInitializeLogging();
        if (os_log_type_enabled(*v110, OS_LOG_TYPE_ERROR)) {
          -[HDMCNotificationManager _queue_rescheduleNotificationsForAnalysis:]();
        }
      }

      uint64_t v8 = v110;
    }
  }
  _HKInitializeLogging();
  os_log_t v120 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
  {
    id v121 = v120;
    v122 = objc_opt_class();
    v123 = NSNumber;
    id v124 = v122;
    id v125 = objc_msgSend(v123, "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));
    *(_DWORD *)buf = 138543874;
    v172 = v122;
    __int16 v173 = 2114;
    os_log_t v174 = v125;
    __int16 v175 = 2112;
    v176 = v6;
    _os_log_impl(&dword_225722000, v121, OS_LOG_TYPE_DEFAULT, "[%{public}@] Scheduling %{public}@ events: %@", buf, 0x20u);
  }
  id v126 = self->_scheduler;
  v127 = (void *)[v6 copy];
  id v164 = 0;
  v128 = [(HDRestorableAlarm *)v126 replaceAllScheduledEventsWithEvents:v127 error:&v164];
  id v129 = v164;

  if (v128)
  {
    notificationSyncManager = self->_notificationSyncManager;
    long long v131 = [v4 latestSampleInfo];
    [(HDMCNotificationSyncManager *)notificationSyncManager sendNotificationInstructionsForSchedulingChanges:v128 sampleInfo:v131];

    objc_storeStrong((id *)&self->_lastAnalysis, a3);
    long long v132 = [(HDMCNotificationManager *)self _currentDate];
    long long v133 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendar");
    int v134 = [v4 isEarliestNotificationScheduledAfterDate:v132 gregorianCalendar:v133];

    if (v134)
    {
      _HKInitializeLogging();
      os_log_t v135 = *v8;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
      {
        id v136 = v135;
        long long v137 = objc_opt_class();
        *(_DWORD *)buf = 138543362;
        v172 = v137;
        id v138 = v137;
        _os_log_impl(&dword_225722000, v136, OS_LOG_TYPE_DEFAULT, "[%{public}@] Clearing all previous period notifications from notification center", buf, 0xCu);
      }
      id v139 = objc_loadWeakRetained((id *)&self->_profile);
      long long v140 = [v139 notificationManager];
      uint64_t v170 = *MEMORY[0x263F45088];
      id v141 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v170 count:1];
      [v140 removeDeliveredNotificationsWithIdentifiers:v141];
    }
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR)) {
      -[HDMCNotificationManager _queue_rescheduleNotificationsForAnalysis:]();
    }
  }
}

- (void)_queue_removeAllScheduledNotificationsIfNotEnabled
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v4 = [WeakRetained database];
  queue = self->_queue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __77__HDMCNotificationManager__queue_removeAllScheduledNotificationsIfNotEnabled__block_invoke;
  v6[3] = &unk_2647508B0;
  v6[4] = self;
  [v4 performWhenDataProtectedByFirstUnlockIsAvailableOnQueue:queue block:v6];
}

void __77__HDMCNotificationManager__queue_removeAllScheduledNotificationsIfNotEnabled__block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v1 = a1 + 32;
  if (([*(id *)(*(void *)(a1 + 32) + 40) someNotificationsEnabled] & 1) == 0)
  {
    _HKInitializeLogging();
    v2 = (os_log_t *)MEMORY[0x263F09930];
    uint64_t v3 = (void *)*MEMORY[0x263F09930];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
    {
      id v4 = v3;
      *(_DWORD *)buf = 138543362;
      id v21 = (id)objc_opt_class();
      id v5 = v21;
      _os_log_impl(&dword_225722000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Removing all scheduled and delivered notifications: notifications not enabled and supported", buf, 0xCu);
    }
    id v6 = *(void **)(*(void *)v1 + 104);
    id v17 = 0;
    char v7 = [v6 removeAllEventsWithError:&v17];
    id v8 = v17;
    if ((v7 & 1) == 0)
    {
      _HKInitializeLogging();
      os_log_t v9 = *v2;
      if (os_log_type_enabled(*v2, OS_LOG_TYPE_ERROR)) {
        __77__HDMCNotificationManager__queue_removeAllScheduledNotificationsIfNotEnabled__block_invoke_cold_1(v1, v9);
      }
    }
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)v1 + 8));
    uint64_t v11 = [WeakRetained notificationManager];
    uint64_t v12 = *MEMORY[0x263F45080];
    v19[0] = *MEMORY[0x263F45088];
    v19[1] = v12;
    id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:2];
    [v11 removeDeliveredNotificationsWithIdentifiers:v13];

    id v14 = objc_loadWeakRetained((id *)(*(void *)v1 + 8));
    os_log_t v15 = [v14 notificationManager];
    uint64_t v18 = *MEMORY[0x263F45090];
    __int16 v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v18 count:1];
    [v15 removeDeliveredNotificationsWithIdentifiers:v16];
  }
}

- (void)_queue_notificationOrSensorInputSettingsDidChange
{
  OUTLINED_FUNCTION_2();
  id v2 = v1;
  uint64_t v3 = (void *)OUTLINED_FUNCTION_3();
  id v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_225722000, v5, v6, "[%{public}@] Error clearing key value domain of update fertile window fire date: %{public}@", v7, v8, v9, v10, v11);
}

- (void)_triggerImmediateSyncWithReason:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  uint64_t v6 = [WeakRetained cloudSyncManager];
  id v7 = objc_alloc(MEMORY[0x263F0A1C8]);
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x263F0A160]) initWithPush:1 pull:0 lite:1];
  uint64_t v9 = (void *)[v7 initWithChangesSyncRequest:v8];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __59__HDMCNotificationManager__triggerImmediateSyncWithReason___block_invoke;
  v11[3] = &unk_264750B28;
  v11[4] = self;
  id v12 = v4;
  id v10 = v4;
  [v6 syncWithRequest:v9 reason:v10 completion:v11];
}

void __59__HDMCNotificationManager__triggerImmediateSyncWithReason___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a3;
  _HKInitializeLogging();
  uint64_t v6 = (void *)*MEMORY[0x263F09930];
  id v7 = *MEMORY[0x263F09930];
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = v6;
      uint64_t v9 = objc_opt_class();
      uint64_t v10 = *(void *)(a1 + 40);
      int v12 = 138543618;
      id v13 = v9;
      __int16 v14 = 2114;
      uint64_t v15 = v10;
      id v11 = v9;
      _os_log_impl(&dword_225722000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Cloud sync request completed for %{public}@", (uint8_t *)&v12, 0x16u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __59__HDMCNotificationManager__triggerImmediateSyncWithReason___block_invoke_cold_1(a1, v6);
  }
}

- (HDRestorableAlarm)scheduler
{
  return self->_scheduler;
}

- (NSDate)unitTest_currentDateOverride
{
  return self->_unitTest_currentDateOverride;
}

- (void)setUnitTest_currentDateOverride:(id)a3
{
}

- (id)unitTest_didSkipNotificationForDueEventHandler
{
  return self->_unitTest_didSkipNotificationForDueEventHandler;
}

- (void)setUnitTest_didSkipNotificationForDueEventHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unitTest_didSkipNotificationForDueEventHandler, 0);
  objc_storeStrong((id *)&self->_unitTest_currentDateOverride, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_lastAnalysis, 0);
  objc_storeStrong((id *)&self->_lastDismissalDayIndex, 0);
  objc_storeStrong((id *)&self->_deviationDismissalKeyValueDomain, 0);
  objc_storeStrong((id *)&self->_unconfirmedDeviationStateKeyValueDomain, 0);
  objc_storeStrong((id *)&self->_ovulationConfirmationStateManager, 0);
  objc_storeStrong((id *)&self->_fertileWindowNotificationStateKeyValueDomain, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_settingsManager, 0);
  objc_storeStrong((id *)&self->_notificationSyncManager, 0);
  objc_storeStrong((id *)&self->_deviceScopedStorageManager, 0);
  objc_storeStrong((id *)&self->_analysisManager, 0);
  objc_destroyWeak((id *)&self->_profile);
}

- (void)didUpdateAnalysis:.cold.1()
{
  OUTLINED_FUNCTION_2();
  id v2 = v1;
  uint64_t v3 = (void *)OUTLINED_FUNCTION_3();
  id v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_225722000, v5, v6, "[%{public}@] Error retrieving unconfirmed deviation dismiss day to determine rescheduling: %{public}@", v7, v8, v9, v10, v11);
}

void __45__HDMCNotificationManager_didUpdateAnalysis___block_invoke_cold_1(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)OUTLINED_FUNCTION_3();
  id v5 = OUTLINED_FUNCTION_0(v4);
  OUTLINED_FUNCTION_1(&dword_225722000, v6, v7, "[%{public}@] Error checking for due events before rescheduling: %{public}@", v8, v9, v10, v11, v12);
}

- (void)settingsManagerDidUpdateNotificationSettings:(void *)a1 .cold.1(void *a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  id v1 = a1;
  int v3 = 138543362;
  id v4 = (id)objc_opt_class();
  id v2 = v4;
  _os_log_error_impl(&dword_225722000, v1, OS_LOG_TYPE_ERROR, "[%{public}@] Notification settings changed: unable to reschedule notifications due to no current analysis", (uint8_t *)&v3, 0xCu);
}

- (void)_requestFromAlarmEvent:.cold.1()
{
  OUTLINED_FUNCTION_2();
  id v3 = v2;
  id v4 = (id)OUTLINED_FUNCTION_3();
  uint64_t v5 = [v0 eventIdentifier];
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_1(&dword_225722000, v6, v7, "[%{public}@] Could not create notification request from event identifier: %@", v8, v9, v10, v11, v12);
}

- (void)_queue_alarm:didReceiveDueEvents:.cold.1()
{
  OUTLINED_FUNCTION_2();
  id v3 = v2;
  id v4 = (id)OUTLINED_FUNCTION_3();
  uint64_t v5 = objc_msgSend(v0, "hdmc_categoryIdentifier");
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_1(&dword_225722000, v6, v7, "[%{public}@] Could not create notification request from event identifier: %@", v8, v9, v10, v11, v12);
}

- (void)_queue_alarm:didReceiveDueEvents:.cold.2()
{
  OUTLINED_FUNCTION_2();
  id v2 = v1;
  id v3 = (void *)OUTLINED_FUNCTION_3();
  id v4 = OUTLINED_FUNCTION_3_1(v3);
  OUTLINED_FUNCTION_1(&dword_225722000, v5, v6, "[%{public}@] Could not retrieve scheduled notification fertile window end day index:%@", v7, v8, v9, v10, 2u);
}

- (void)_queue_alarm:didReceiveDueEvents:.cold.3()
{
  OUTLINED_FUNCTION_2();
  id v2 = v1;
  id v3 = (void *)OUTLINED_FUNCTION_3();
  id v4 = OUTLINED_FUNCTION_3_1(v3);
  OUTLINED_FUNCTION_1(&dword_225722000, v5, v6, "[%{public}@] Could not retrieve scheduled notification days shifted from calendar window value:%@", v7, v8, v9, v10, 2u);
}

- (void)_queue_alarm:didReceiveDueEvents:.cold.5()
{
  OUTLINED_FUNCTION_2();
  id v2 = v1;
  id v3 = (void *)OUTLINED_FUNCTION_3();
  id v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_225722000, v5, v6, "[%{public}@] Error fetching hold instructions: %{public}@", v7, v8, v9, v10, v11);
}

void __60__HDMCNotificationManager__queue_alarm_didReceiveDueEvents___block_invoke_cold_1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_5_0(a1, a2);
  id v3 = (void *)OUTLINED_FUNCTION_3();
  id v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_225722000, v5, v6, "[%{public}@] Error retrieving current deviation notification state: %{public}@", v7, v8, v9, v10, v11);
}

void __60__HDMCNotificationManager__queue_alarm_didReceiveDueEvents___block_invoke_cold_2(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_5_0(a1, a2);
  id v3 = (id)OUTLINED_FUNCTION_3();
  uint64_t v10 = HKSensitiveLogItem();
  OUTLINED_FUNCTION_1(&dword_225722000, v4, v5, "[%{public}@] Unknown error migrating to waiting state from scheduled state: %{public}@", v6, v7, v8, v9, 2u);
}

void __60__HDMCNotificationManager__queue_alarm_didReceiveDueEvents___block_invoke_cold_3(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_5_0(a1, a2);
  id v3 = (void *)OUTLINED_FUNCTION_3();
  id v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_225722000, v5, v6, "[%{public}@] Error updating deviation notification state: %{public}@", v7, v8, v9, v10, v11);
}

void __60__HDMCNotificationManager__queue_alarm_didReceiveDueEvents___block_invoke_cold_4(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_5_0(a1, a2);
  id v3 = (void *)OUTLINED_FUNCTION_3();
  id v4 = OUTLINED_FUNCTION_3_1(v3);
  OUTLINED_FUNCTION_1(&dword_225722000, v5, v6, "[%{public}@] Error transitioning from scheduled state to fired state:%@", v7, v8, v9, v10, 2u);
}

void __60__HDMCNotificationManager__queue_alarm_didReceiveDueEvents___block_invoke_cold_5(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_5_0(a1, a2);
  id v3 = (void *)OUTLINED_FUNCTION_3();
  id v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_225722000, v5, v6, "[%{public}@] Error saving date fired for update fertile window notification in key value domain: %{public}@", v7, v8, v9, v10, v11);
}

void __60__HDMCNotificationManager__queue_alarm_didReceiveDueEvents___block_invoke_cold_6(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = (id)objc_opt_class();
  OUTLINED_FUNCTION_7(&dword_225722000, v4, v5, "[%{public}@] Error posting user notification for request %@: %{public}@", v6, v7, v8, v9, 2u);
}

- (void)_queue_rescheduleNotificationsForAnalysis:.cold.1()
{
  OUTLINED_FUNCTION_2();
  id v2 = v1;
  id v3 = (void *)OUTLINED_FUNCTION_3();
  id v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_225722000, v5, v6, "[%{public}@] Error scheduling new events on analysis change: %{public}@", v7, v8, v9, v10, v11);
}

- (void)_queue_rescheduleNotificationsForAnalysis:.cold.2()
{
  OUTLINED_FUNCTION_2();
  id v2 = v1;
  id v3 = (void *)OUTLINED_FUNCTION_3();
  id v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_225722000, v5, v6, "[%{public}@] Error retrieving ovulation confirmation events with error: %{public}@", v7, v8, v9, v10, v11);
}

- (void)_queue_rescheduleNotificationsForAnalysis:.cold.3()
{
  OUTLINED_FUNCTION_2();
  id v2 = v1;
  id v3 = (void *)OUTLINED_FUNCTION_3();
  id v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_225722000, v5, v6, "[%{public}@] Error retrieving last fired date for update fertile window notification from key value domain: %{public}@", v7, v8, v9, v10, v11);
}

- (void)_queue_rescheduleNotificationsForAnalysis:.cold.4()
{
  OUTLINED_FUNCTION_2();
  id v2 = v1;
  id v3 = (void *)OUTLINED_FUNCTION_3();
  id v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_225722000, v5, v6, "[%{public}@] Error retrieving unconfirmed deviation dismiss day: %{public}@", v7, v8, v9, v10, v11);
}

- (void)_queue_rescheduleNotificationsForAnalysis:.cold.5()
{
  OUTLINED_FUNCTION_2();
  id v2 = v1;
  id v3 = (void *)OUTLINED_FUNCTION_3();
  id v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_225722000, v5, v6, "[%{public}@] Error retrieving unconfirmed deviation notification state: %{public}@", v7, v8, v9, v10, v11);
}

void __77__HDMCNotificationManager__queue_removeAllScheduledNotificationsIfNotEnabled__block_invoke_cold_1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_5_0(a1, a2);
  id v3 = (void *)OUTLINED_FUNCTION_3();
  id v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_225722000, v5, v6, "[%{public}@] Error removing all scheduled notifications: %{public}@", v7, v8, v9, v10, v11);
}

void __59__HDMCNotificationManager__triggerImmediateSyncWithReason___block_invoke_cold_1(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = (id)objc_opt_class();
  OUTLINED_FUNCTION_7(&dword_225722000, v4, v5, "[%{public}@] Cloud sync request for %{public}@ failed: %{public}@", v6, v7, v8, v9, 2u);
}

@end