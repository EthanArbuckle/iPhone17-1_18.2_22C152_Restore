@interface HDRestorableAlarmScheduler
- (BOOL)_enumerateAllAlarmEventsWithError:(void *)a3 enumerationHandler:;
- (BOOL)_performWriteTransactionAndFireEventsWithError:(void *)a3 block:;
- (BOOL)isRegisteredForLockStateUpdates;
- (BOOL)isRegisteredForOnWristUpdates;
- (BOOL)removeAllEventsWithClientIdentifier:(id)a3 error:(id *)a4;
- (BOOL)removeEvents:(id)a3 error:(id *)a4;
- (BOOL)scheduleEvents:(id)a3 error:(id *)a4;
- (HDRestorableAlarmScheduler)initWithProfile:(id)a3;
- (HDXPCAlarm)systemScheduler;
- (NSDate)_unitTest_currentDate;
- (NSString)description;
- (id)diagnosticDescription;
- (id)replaceAllScheduledEventsWithClientIdentifier:(id)a3 newEvents:(id)a4 error:(id *)a5;
- (id)scheduledEventsForClientIdentifier:(id)a3 error:(id *)a4;
- (void)_queue_enqueueMaintenanceNotifyAndScheduleWithReason:(uint64_t)a1;
- (void)_queue_processDueEventsWithCompletion:(uint64_t)a1;
- (void)_queue_setNeedsMaintenanceNotifyAndSchedule:(uint64_t)a1;
- (void)_queue_updateProtectedDataObserverStateIfRequired;
- (void)addAlarm:(id)a3;
- (void)checkForDueEventsImmediatelyWithCompletion:(id)a3;
- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4;
- (void)dealloc;
- (void)profileDidBecomeReady:(id)a3;
- (void)removeAlarm:(id)a3;
- (void)set_unitTest_currentDate:(id)a3;
@end

@implementation HDRestorableAlarmScheduler

- (HDRestorableAlarmScheduler)initWithProfile:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)HDRestorableAlarmScheduler;
  v5 = [(HDRestorableAlarmScheduler *)&v21 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    uint64_t v7 = HKCreateSerialDispatchQueue();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    uint64_t v9 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    clients = v6->_clients;
    v6->_clients = (NSMapTable *)v9;

    id v11 = objc_alloc(MEMORY[0x1E4F65DA0]);
    id WeakRetained = objc_loadWeakRetained((id *)&v6->_profile);
    v13 = [WeakRetained profileIdentifier];
    id v14 = objc_loadWeakRetained((id *)&v6->_profile);
    v15 = [v14 daemon];
    v16 = [v15 alarmScheduler];
    uint64_t v17 = [v11 initWithProfileIdentifier:v13 scheduler:v16 eventName:@"HDRestorableAlarmScheduler" eventHandlerQueue:v6->_queue];
    systemScheduler = v6->_systemScheduler;
    v6->_systemScheduler = (HDXPCAlarm *)v17;

    v19 = [MEMORY[0x1E4F65CF8] sharedDiagnosticManager];
    [v19 addObject:v6];

    [v4 registerProfileReadyObserver:v6 queue:v6->_queue];
  }

  return v6;
}

- (void)dealloc
{
  if (self)
  {
    int significantTimeChangeNotificationToken = self->_significantTimeChangeNotificationToken;
    if (significantTimeChangeNotificationToken != -1) {
      notify_cancel(significantTimeChangeNotificationToken);
    }
  }
  v4.receiver = self;
  v4.super_class = (Class)HDRestorableAlarmScheduler;
  [(HDRestorableAlarmScheduler *)&v4 dealloc];
}

- (void)profileDidBecomeReady:(id)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_hasInitializedSystemScheduler)
  {
    self->_hasInitializedSystemScheduler = 1;
    objc_initWeak(&location, self);
    objc_super v4 = [(HDRestorableAlarmScheduler *)self systemScheduler];
    uint64_t handler = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    v13 = __74__HDRestorableAlarmScheduler__queue_beginReceivingSystemEventsIfNecessary__block_invoke;
    id v14 = &unk_1E63070D8;
    objc_copyWeak(&v15, &location);
    [v4 beginReceivingEventsWithHandler:&handler];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  objc_initWeak(&location, self);
  self->_int significantTimeChangeNotificationToken = -1;
  v5 = (const char *)[@"SignificantTimeChangeNotification" UTF8String];
  queue = self->_queue;
  uint64_t handler = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  v13 = __78__HDRestorableAlarmScheduler__startObservingSignificantTimeChangeNotification__block_invoke;
  id v14 = &unk_1E62F3490;
  objc_copyWeak(&v15, &location);
  notify_register_dispatch(v5, &self->_significantTimeChangeNotificationToken, queue, &handler);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v8 = [WeakRetained database];
  uint64_t v9 = self->_queue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __52__HDRestorableAlarmScheduler_profileDidBecomeReady___block_invoke;
  v10[3] = &unk_1E62F3208;
  v10[4] = self;
  [v8 performWhenDataProtectedByFirstUnlockIsAvailableOnQueue:v9 block:v10];
}

void __52__HDRestorableAlarmScheduler_profileDidBecomeReady___block_invoke(uint64_t a1)
{
  -[HDRestorableAlarmScheduler _queue_setNeedsMaintenanceNotifyAndSchedule:](*(void *)(a1 + 32), 1);
  uint64_t v2 = *(void *)(a1 + 32);

  -[HDRestorableAlarmScheduler _queue_enqueueMaintenanceNotifyAndScheduleWithReason:](v2, @"Daemon ready and data first available");
}

- (void)_queue_setNeedsMaintenanceNotifyAndSchedule:(uint64_t)a1
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    *(unsigned char *)(a1 + 42) = a2;
    -[HDRestorableAlarmScheduler _queue_updateProtectedDataObserverStateIfRequired](a1);
  }
}

- (void)_queue_enqueueMaintenanceNotifyAndScheduleWithReason:(uint64_t)a1
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    if (*(unsigned char *)(a1 + 41))
    {
      _HKInitializeLogging();
      objc_super v4 = HKLogInfrastructure();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        uint64_t v21 = a1;
        __int16 v22 = 2114;
        id v23 = v3;
        _os_log_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Skipping maintenance operation with reason \"%{public}@\" as we're already waiting on one", buf, 0x16u);
      }
    }
    else
    {
      *(unsigned char *)(a1 + 41) = 1;
      objc_initWeak(&location, (id)a1);
      v5 = (objc_class *)objc_opt_class();
      v6 = NSStringFromClass(v5);
      uint64_t v7 = *(void *)(a1 + 16);
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __83__HDRestorableAlarmScheduler__queue_enqueueMaintenanceNotifyAndScheduleWithReason___block_invoke;
      v16[3] = &unk_1E62F7308;
      objc_copyWeak(&v18, &location);
      id v8 = v3;
      id v17 = v8;
      uint64_t v9 = +[HDMaintenanceOperation maintenanceOperationWithName:v6 queue:v7 synchronousBlock:v16];

      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
      id v11 = [WeakRetained database];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __83__HDRestorableAlarmScheduler__queue_enqueueMaintenanceNotifyAndScheduleWithReason___block_invoke_2;
      v14[3] = &unk_1E62F31C0;
      v14[4] = a1;
      id v12 = v9;
      id v15 = v12;
      [v11 performWhenDataProtectedByFirstUnlockIsAvailable:v14];

      _HKInitializeLogging();
      v13 = HKLogInfrastructure();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        uint64_t v21 = a1;
        __int16 v22 = 2114;
        id v23 = v8;
        _os_log_impl(&dword_1BCB7D000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ Enqueued maintenance operation with reason \"%{public}@\"", buf, 0x16u);
      }

      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
    }
  }
}

void __78__HDRestorableAlarmScheduler__startObservingSignificantTimeChangeNotification__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    dispatch_assert_queue_V2(WeakRetained[2]);
    _HKInitializeLogging();
    uint64_t v2 = HKLogInfrastructure();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v5 = v3;
      _os_log_impl(&dword_1BCB7D000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ received significant time change notification", buf, 0xCu);
    }

    dispatch_assert_queue_V2(v3[2]);
    *((unsigned char *)v3 + 42) = 1;
    -[HDRestorableAlarmScheduler _queue_updateProtectedDataObserverStateIfRequired]((uint64_t)v3);
    -[HDRestorableAlarmScheduler _queue_enqueueMaintenanceNotifyAndScheduleWithReason:]((uint64_t)v3, @"Significant time change");
    id WeakRetained = v3;
  }
}

- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4
{
  BOOL v4 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v4)
  {
    -[HDRestorableAlarmScheduler _queue_enqueueMaintenanceNotifyAndScheduleWithReason:]((uint64_t)self, @"Protected data became available");
  }
}

- (void)_queue_updateProtectedDataObserverStateIfRequired
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
  if (*(unsigned char *)(a1 + 42) || *(unsigned char *)(a1 + 43))
  {
    if (!*(unsigned char *)(a1 + 46))
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
      id v3 = [WeakRetained database];
      [v3 addProtectedDataObserver:a1 queue:*(void *)(a1 + 16)];

      *(unsigned char *)(a1 + 46) = 1;
    }
  }
  else if (*(unsigned char *)(a1 + 46))
  {
    id v4 = objc_loadWeakRetained((id *)(a1 + 8));
    v5 = [v4 database];
    [v5 removeProtectedDataObserver:a1];

    *(unsigned char *)(a1 + 46) = 0;
  }
}

void __83__HDRestorableAlarmScheduler__queue_enqueueMaintenanceNotifyAndScheduleWithReason___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = *(id *)(a1 + 32);
  if (WeakRetained)
  {
    dispatch_assert_queue_V2(WeakRetained[2]);
    if (*((unsigned char *)WeakRetained + 42) || *((unsigned char *)WeakRetained + 43) || *((unsigned char *)WeakRetained + 45))
    {
      _HKInitializeLogging();
      id v3 = HKLogInfrastructure();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        uint64_t v7 = WeakRetained;
        __int16 v8 = 2112;
        id v9 = v2;
        _os_log_impl(&dword_1BCB7D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Processing due events with maintenance operation reason \"%@\"", buf, 0x16u);
      }

      -[HDRestorableAlarmScheduler _queue_processDueEventsWithCompletion:]((uint64_t)WeakRetained, 0);
    }
    else
    {
      _HKInitializeLogging();
      id v4 = HKLogInfrastructure();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        uint64_t v7 = WeakRetained;
        __int16 v8 = 2112;
        id v9 = v2;
        _os_log_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Skipping maintenance operation with reason \"%@\" since no longer needed", buf, 0x16u);
      }
    }
    *((unsigned char *)WeakRetained + 41) = 0;
  }
}

void __83__HDRestorableAlarmScheduler__queue_enqueueMaintenanceNotifyAndScheduleWithReason___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  id v2 = [WeakRetained daemon];
  id v3 = [v2 maintenanceWorkCoordinator];
  [v3 enqueueMaintenanceOperation:*(void *)(a1 + 40)];
}

- (void)_queue_processDueEventsWithCompletion:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    uint64_t v7 = __68__HDRestorableAlarmScheduler__queue_processDueEventsWithCompletion___block_invoke;
    __int16 v8 = &unk_1E62FFD50;
    uint64_t v9 = a1;
    id v10 = v3;
    id v4 = *(NSObject **)(a1 + 16);
    v5 = v6;
    dispatch_assert_queue_V2(v4);
    ((void (*)(void *, void))v7)(v5, *(unsigned __int8 *)(a1 + 44));
  }
}

void __74__HDRestorableAlarmScheduler__queue_beginReceivingSystemEventsIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    _HKInitializeLogging();
    id v2 = HKLogInfrastructure();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = 138543362;
      id v4 = WeakRetained;
      _os_log_impl(&dword_1BCB7D000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Received system alert to check for due alarms", (uint8_t *)&v3, 0xCu);
    }

    -[HDRestorableAlarmScheduler _queue_processDueEventsWithCompletion:]((uint64_t)WeakRetained, 0);
  }
}

void __68__HDRestorableAlarmScheduler__queue_processDueEventsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 16));
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v2 + 16));
    _HKInitializeLogging();
    int v3 = HKLogInfrastructure();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v2;
      _os_log_impl(&dword_1BCB7D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Enumerating due events", (uint8_t *)&buf, 0xCu);
    }

    id v4 = objc_msgSend((id)v2, "_unitTest_currentDate");
    uint64_t v5 = v4;
    if (v4) {
      id v6 = v4;
    }
    else {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1C9C8]);
    }
    uint64_t v7 = v6;

    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v30 = 0;
    v31 = &v30;
    uint64_t v32 = 0x3032000000;
    v33 = __Block_byref_object_copy__149;
    v34 = __Block_byref_object_dispose__149;
    id v35 = 0;
    uint64_t v26 = 0;
    v27 = &v26;
    uint64_t v28 = 0x2020000000;
    char v29 = 0;
    uint64_t v22 = 0;
    id v23 = &v22;
    uint64_t v24 = 0x2020000000;
    char v25 = 0;
    id v21 = 0;
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    v40 = __94__HDRestorableAlarmScheduler__queue_notifyClientsOfDueEventsAndScheduleNextFireDateWithError___block_invoke;
    v41 = &unk_1E6307100;
    id v9 = v7;
    id v42 = v9;
    uint64_t v43 = v2;
    v45 = &v22;
    v46 = &v26;
    id v10 = v8;
    id v44 = v10;
    v47 = &v30;
    BOOL v11 = -[HDRestorableAlarmScheduler _enumerateAllAlarmEventsWithError:enumerationHandler:](v2, (uint64_t)&v21, &buf);
    id v12 = v21;
    if (v11)
    {
      char v13 = *((unsigned char *)v23 + 24);
      dispatch_assert_queue_V2(*(dispatch_queue_t *)(v2 + 16));
      *(unsigned char *)(v2 + 43) = v13;
      -[HDRestorableAlarmScheduler _queue_updateProtectedDataObserverStateIfRequired](v2);
      if (*((unsigned char *)v27 + 24))
      {
        if (!*(unsigned char *)(v2 + 45))
        {
          *(unsigned char *)(v2 + 45) = 1;
          _HKInitializeLogging();
          id v14 = HKLogInfrastructure();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v36 = 138543362;
            *(void *)&v36[4] = v2;
            _os_log_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ Registered for on-wrist updates", v36, 0xCu);
          }
        }
      }
      else
      {
        *(unsigned char *)(v2 + 45) = 0;
      }
      *(void *)v36 = MEMORY[0x1E4F143A8];
      *(void *)&v36[8] = 3221225472;
      *(void *)&v36[16] = __94__HDRestorableAlarmScheduler__queue_notifyClientsOfDueEventsAndScheduleNextFireDateWithError___block_invoke_305;
      v37 = &unk_1E6307128;
      uint64_t v38 = v2;
      [v10 enumerateKeysAndObjectsUsingBlock:v36];
      if (v31[5])
      {
        id v18 = [(id)v2 systemScheduler];
        [v18 setNextFireDate:v31[5] isUserVisible:0];
      }
      else
      {
        id v18 = [(id)v2 systemScheduler];
        [v18 unschedule];
      }

      uint64_t v2 = 0;
    }
    else
    {
      if ((HKIsUnitTesting() & 1) == 0)
      {
        _HKInitializeLogging();
        id v15 = HKLogInfrastructure();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v36 = 138543618;
          *(void *)&v36[4] = v2;
          *(_WORD *)&v36[12] = 2114;
          *(void *)&v36[14] = v12;
          _os_log_error_impl(&dword_1BCB7D000, v15, OS_LOG_TYPE_ERROR, "%{public}@ Failed to enumerate due events: %{public}@", v36, 0x16u);
        }
      }
      id v16 = v12;
      uint64_t v2 = (uint64_t)v16;
      if (v16) {
        id v17 = v16;
      }
    }
    _Block_object_dispose(&v22, 8);
    _Block_object_dispose(&v26, 8);

    _Block_object_dispose(&v30, 8);
  }
  else
  {
    BOOL v11 = 0;
  }
  id v19 = (id)v2;
  -[HDRestorableAlarmScheduler _queue_setNeedsMaintenanceNotifyAndSchedule:](*(void *)(a1 + 32), !v11);
  uint64_t v20 = *(void *)(a1 + 40);
  if (v20) {
    (*(void (**)(uint64_t, BOOL, id))(v20 + 16))(v20, v11, v19);
  }
}

uint64_t __94__HDRestorableAlarmScheduler__queue_notifyClientsOfDueEventsAndScheduleNextFireDateWithError___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 currentDueDate];
  if (objc_msgSend(v4, "hk_isBeforeOrEqualToDate:", a1[4]))
  {
    if ([v3 requiresDeviceUnlocked])
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1[5] + 8));
      id v6 = [WeakRetained database];
      char v7 = [v6 isProtectedDataAvailable];

      int v8 = 1;
      if ((v7 & 1) == 0)
      {
        *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
        int v8 = 0;
      }
    }
    else
    {
      int v8 = 1;
    }
    if ([v3 requiresDeviceOnWrist] && !*(unsigned char *)(a1[5] + 44))
    {
      *(unsigned char *)(*(void *)(a1[8] + 8) + 24) = 1;
    }
    else if (v8)
    {
      id v16 = (void *)a1[6];
      id v17 = [v3 clientIdentifier];
      id v18 = [v16 objectForKeyedSubscript:v17];

      if (!v18)
      {
        id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        id v19 = (void *)a1[6];
        uint64_t v20 = [v3 clientIdentifier];
        [v19 setObject:v18 forKeyedSubscript:v20];
      }
      [v18 addObject:v3];
    }
  }
  else
  {
    uint64_t v9 = *(void *)(a1[9] + 8);
    id v12 = *(void **)(v9 + 40);
    id v10 = (id *)(v9 + 40);
    BOOL v11 = v12;
    if (v12)
    {
      uint64_t v13 = [v11 earlierDate:v4];
      uint64_t v14 = *(void *)(a1[9] + 8);
      id v15 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = v13;
    }
    else
    {
      objc_storeStrong(v10, v4);
    }
  }

  return 1;
}

- (BOOL)_enumerateAllAlarmEventsWithError:(void *)a3 enumerationHandler:
{
  id v5 = a3;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    char v7 = [WeakRetained database];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __83__HDRestorableAlarmScheduler__enumerateAllAlarmEventsWithError_enumerationHandler___block_invoke;
    v10[3] = &unk_1E62FA3D0;
    id v11 = v5;
    BOOL v8 = +[HDHealthEntity performReadTransactionWithHealthDatabase:v7 error:a2 block:v10];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

void __94__HDRestorableAlarmScheduler__queue_notifyClientsOfDueEventsAndScheduleNextFireDateWithError___block_invoke_305(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  char v7 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKey:v5];
  BOOL v8 = v7;
  if (v7)
  {
    [v7 eventsDidFire:v6];
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v9 = HKLogInfrastructure();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      int v11 = 138543874;
      uint64_t v12 = v10;
      __int16 v13 = 2114;
      id v14 = v5;
      __int16 v15 = 2114;
      id v16 = v6;
      _os_log_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ No client found with identifier %{public}@. Skipping notifying for due events: %{public}@", (uint8_t *)&v11, 0x20u);
    }
  }
}

- (void)addAlarm:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__HDRestorableAlarmScheduler_addAlarm___block_invoke;
  v7[3] = &unk_1E62F31C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

void __39__HDRestorableAlarmScheduler_addAlarm___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = [*(id *)(a1 + 40) clientIdentifier];
  id v4 = [v2 objectForKey:v3];

  if (v4)
  {
    _HKInitializeLogging();
    id v5 = HKLogInfrastructure();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = *(void *)(a1 + 32);
      uint64_t v17 = [*(id *)(a1 + 40) clientIdentifier];
      *(_DWORD *)long long buf = 138543874;
      uint64_t v19 = v16;
      __int16 v20 = 2114;
      id v21 = v17;
      __int16 v22 = 2114;
      id v23 = v4;
      _os_log_error_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_ERROR, "%{public}@ Client identifier conflict detected for \"%{public}@\". Replacing client %{public}@", buf, 0x20u);
    }
  }
  _HKInitializeLogging();
  id v6 = HKLogInfrastructure();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = *(void **)(a1 + 40);
    *(_DWORD *)long long buf = 138543618;
    uint64_t v19 = v7;
    __int16 v20 = 2114;
    id v21 = v8;
    _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Registering alarm: %{public}@", buf, 0x16u);
  }

  uint64_t v9 = *(void **)(a1 + 40);
  uint64_t v10 = *(void **)(*(void *)(a1 + 32) + 32);
  int v11 = [v9 clientIdentifier];
  [v10 setObject:v9 forKey:v11];

  uint64_t v12 = NSString;
  uint64_t v13 = *(void *)(a1 + 32);
  id v14 = [*(id *)(a1 + 40) clientIdentifier];
  __int16 v15 = [v12 stringWithFormat:@"Alarm %@ added", v14];
  -[HDRestorableAlarmScheduler _queue_enqueueMaintenanceNotifyAndScheduleWithReason:](v13, v15);
}

- (void)removeAlarm:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__HDRestorableAlarmScheduler_removeAlarm___block_invoke;
  v7[3] = &unk_1E62F31C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

void __42__HDRestorableAlarmScheduler_removeAlarm___block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 32);
  id v2 = [*(id *)(a1 + 40) clientIdentifier];
  [v1 removeObjectForKey:v2];
}

- (BOOL)scheduleEvents:(id)a3 error:(id *)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  _HKInitializeLogging();
  uint64_t v7 = HKLogInfrastructure();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543618;
    id v14 = self;
    __int16 v15 = 2114;
    id v16 = v6;
    _os_log_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Scheduling events %{public}@", buf, 0x16u);
  }

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __51__HDRestorableAlarmScheduler_scheduleEvents_error___block_invoke;
  v11[3] = &unk_1E62F6130;
  id v12 = v6;
  id v8 = v6;
  BOOL v9 = -[HDRestorableAlarmScheduler _performWriteTransactionAndFireEventsWithError:block:]((uint64_t)self, (uint64_t)a4, v11);

  return v9;
}

BOOL __51__HDRestorableAlarmScheduler_scheduleEvents_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[HDAlarmEventEntity insertOrReplaceAlarmEvents:*(void *)(a1 + 32) transaction:a2 error:a3];
}

- (BOOL)_performWriteTransactionAndFireEventsWithError:(void *)a3 block:
{
  id v5 = a3;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    uint64_t v7 = [WeakRetained database];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __83__HDRestorableAlarmScheduler__performWriteTransactionAndFireEventsWithError_block___block_invoke;
    v10[3] = &unk_1E62F8050;
    void v10[4] = a1;
    id v11 = v5;
    BOOL v8 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v7 error:a2 block:v10];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)removeEvents:(id)a3 error:(id *)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  _HKInitializeLogging();
  uint64_t v7 = HKLogInfrastructure();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543618;
    id v14 = self;
    __int16 v15 = 2114;
    id v16 = v6;
    _os_log_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Removing events %{public}@", buf, 0x16u);
  }

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __49__HDRestorableAlarmScheduler_removeEvents_error___block_invoke;
  v11[3] = &unk_1E62F6130;
  id v12 = v6;
  id v8 = v6;
  BOOL v9 = -[HDRestorableAlarmScheduler _performWriteTransactionAndFireEventsWithError:block:]((uint64_t)self, (uint64_t)a4, v11);

  return v9;
}

BOOL __49__HDRestorableAlarmScheduler_removeEvents_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[HDAlarmEventEntity deleteAlarmEvents:*(void *)(a1 + 32) transaction:a2 error:a3];
}

- (BOOL)removeAllEventsWithClientIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  _HKInitializeLogging();
  uint64_t v7 = HKLogInfrastructure();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543618;
    id v14 = self;
    __int16 v15 = 2114;
    id v16 = v6;
    _os_log_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Removing all events with client identifier: %{public}@", buf, 0x16u);
  }

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __72__HDRestorableAlarmScheduler_removeAllEventsWithClientIdentifier_error___block_invoke;
  v11[3] = &unk_1E62F6130;
  id v12 = v6;
  id v8 = v6;
  BOOL v9 = -[HDRestorableAlarmScheduler _performWriteTransactionAndFireEventsWithError:block:]((uint64_t)self, (uint64_t)a4, v11);

  return v9;
}

BOOL __72__HDRestorableAlarmScheduler_removeAllEventsWithClientIdentifier_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[HDAlarmEventEntity deleteAllAlarmEventsWithClientIdentifier:*(void *)(a1 + 32) transaction:a2 error:a3];
}

- (id)replaceAllScheduledEventsWithClientIdentifier:(id)a3 newEvents:(id)a4 error:(id *)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  _HKInitializeLogging();
  uint64_t v10 = HKLogInfrastructure();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543874;
    __int16 v22 = self;
    __int16 v23 = 2114;
    id v24 = v8;
    __int16 v25 = 2114;
    id v26 = v9;
    _os_log_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Replace all scheduled events with client identifier %{public}@ with events %{public}@", buf, 0x20u);
  }

  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __92__HDRestorableAlarmScheduler_replaceAllScheduledEventsWithClientIdentifier_newEvents_error___block_invoke;
  v17[3] = &unk_1E62F5A88;
  id v12 = v8;
  id v18 = v12;
  id v13 = v11;
  id v19 = v13;
  id v14 = v9;
  id v20 = v14;
  if (-[HDRestorableAlarmScheduler _performWriteTransactionAndFireEventsWithError:block:]((uint64_t)self, (uint64_t)a5, v17))
  {
    __int16 v15 = [[HDAlarmEventChanges alloc] initWithOldEvents:v13 scheduledEvents:v14];
  }
  else
  {
    __int16 v15 = 0;
  }

  return v15;
}

BOOL __92__HDRestorableAlarmScheduler_replaceAllScheduledEventsWithClientIdentifier_newEvents_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __92__HDRestorableAlarmScheduler_replaceAllScheduledEventsWithClientIdentifier_newEvents_error___block_invoke_2;
  v9[3] = &unk_1E6307150;
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  if (+[HDAlarmEventEntity deleteAllAlarmEventsWithClientIdentifier:v6 transaction:v5 enumerationHandler:v9 error:a3])
  {
    BOOL v7 = +[HDAlarmEventEntity insertOrReplaceAlarmEvents:*(void *)(a1 + 48) transaction:v5 error:a3];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

uint64_t __92__HDRestorableAlarmScheduler_replaceAllScheduledEventsWithClientIdentifier_newEvents_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return 1;
}

- (id)scheduledEventsForClientIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__149;
  id v20 = __Block_byref_object_dispose__149;
  id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v8 = [WeakRetained database];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __71__HDRestorableAlarmScheduler_scheduledEventsForClientIdentifier_error___block_invoke;
  v13[3] = &unk_1E62F3DB0;
  id v9 = v6;
  id v14 = v9;
  __int16 v15 = &v16;
  LODWORD(a4) = +[HDHealthEntity performReadTransactionWithHealthDatabase:v8 error:a4 block:v13];

  if (a4) {
    id v10 = (void *)v17[5];
  }
  else {
    id v10 = 0;
  }
  id v11 = v10;

  _Block_object_dispose(&v16, 8);

  return v11;
}

BOOL __71__HDRestorableAlarmScheduler_scheduledEventsForClientIdentifier_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __71__HDRestorableAlarmScheduler_scheduledEventsForClientIdentifier_error___block_invoke_2;
  v6[3] = &unk_1E6307178;
  uint64_t v4 = *(void *)(a1 + 32);
  v6[4] = *(void *)(a1 + 40);
  return +[HDAlarmEventEntity enumerateAllAlarmEventsWithClientIdentifier:v4 transaction:a2 error:a3 enumerationHandler:v6];
}

uint64_t __71__HDRestorableAlarmScheduler_scheduledEventsForClientIdentifier_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return 1;
}

uint64_t __83__HDRestorableAlarmScheduler__performWriteTransactionAndFireEventsWithError_block___block_invoke(uint64_t a1, void *a2)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __83__HDRestorableAlarmScheduler__performWriteTransactionAndFireEventsWithError_block___block_invoke_2;
  v6[3] = &unk_1E62F3208;
  v6[4] = *(void *)(a1 + 32);
  id v3 = a2;
  [v3 onCommit:v6 orRollback:0];
  uint64_t v4 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();

  return v4;
}

void __83__HDRestorableAlarmScheduler__performWriteTransactionAndFireEventsWithError_block___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(NSObject **)(v1 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83__HDRestorableAlarmScheduler__performWriteTransactionAndFireEventsWithError_block___block_invoke_3;
  block[3] = &unk_1E62F3208;
  block[4] = v1;
  dispatch_sync(v2, block);
}

void __83__HDRestorableAlarmScheduler__performWriteTransactionAndFireEventsWithError_block___block_invoke_3(uint64_t a1)
{
}

- (void)checkForDueEventsImmediatelyWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__HDRestorableAlarmScheduler_checkForDueEventsImmediatelyWithCompletion___block_invoke;
  v7[3] = &unk_1E62F4928;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

void __73__HDRestorableAlarmScheduler_checkForDueEventsImmediatelyWithCompletion___block_invoke(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __73__HDRestorableAlarmScheduler_checkForDueEventsImmediatelyWithCompletion___block_invoke_2;
  v4[3] = &unk_1E62F69A0;
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  -[HDRestorableAlarmScheduler _queue_processDueEventsWithCompletion:](v2, v4);
}

uint64_t __73__HDRestorableAlarmScheduler_checkForDueEventsImmediatelyWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, void, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), a2, a3);
}

BOOL __83__HDRestorableAlarmScheduler__enumerateAllAlarmEventsWithError_enumerationHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[HDAlarmEventEntity enumerateAllAlarmEventsWithTransaction:a2 error:a3 enumerationHandler:*(void *)(a1 + 32)];
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<%@:%p>", objc_opt_class(), self];
}

- (id)diagnosticDescription
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = [(HDRestorableAlarmScheduler *)self description];
  [v3 addObject:v4];

  [v3 addObject:@"\tAlarm Events"];
  id v18 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __51__HDRestorableAlarmScheduler_diagnosticDescription__block_invoke;
  v16[3] = &unk_1E6307150;
  id v5 = v3;
  id v17 = v5;
  BOOL v6 = -[HDRestorableAlarmScheduler _enumerateAllAlarmEventsWithError:enumerationHandler:]((uint64_t)self, (uint64_t)&v18, v16);
  id v7 = v18;
  if (!v6)
  {
    id v8 = [NSString stringWithFormat:@"\t\t%@", v7];
    [v5 addObject:v8];
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__HDRestorableAlarmScheduler_diagnosticDescription__block_invoke_2;
  block[3] = &unk_1E62F31C0;
  id v14 = v5;
  __int16 v15 = self;
  id v10 = v5;
  dispatch_sync(queue, block);
  id v11 = [v10 componentsJoinedByString:@"\n"];

  return v11;
}

uint64_t __51__HDRestorableAlarmScheduler_diagnosticDescription__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [NSString stringWithFormat:@"\t\t%@", a2];
  [v2 addObject:v3];

  return 1;
}

void __51__HDRestorableAlarmScheduler_diagnosticDescription__block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) addObject:@"\tClients"];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v2 = [*(id *)(*(void *)(a1 + 40) + 32) objectEnumerator];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(a1 + 32);
        id v8 = NSString;
        id v9 = [*(id *)(*((void *)&v11 + 1) + 8 * v6) diagnosticDescription];
        id v10 = [v8 stringWithFormat:@"\t\t%@", v9];
        [v7 addObject:v10];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
}

- (HDXPCAlarm)systemScheduler
{
  return self->_systemScheduler;
}

- (NSDate)_unitTest_currentDate
{
  return self->__unitTest_currentDate;
}

- (void)set_unitTest_currentDate:(id)a3
{
}

- (BOOL)isRegisteredForOnWristUpdates
{
  return self->_isRegisteredForOnWristUpdates;
}

- (BOOL)isRegisteredForLockStateUpdates
{
  return self->_isRegisteredForLockStateUpdates;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__unitTest_currentDate, 0);
  objc_storeStrong((id *)&self->_systemScheduler, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_destroyWeak((id *)&self->_profile);
}

@end