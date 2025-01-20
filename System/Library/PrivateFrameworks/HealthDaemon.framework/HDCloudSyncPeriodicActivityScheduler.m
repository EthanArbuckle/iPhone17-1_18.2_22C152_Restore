@interface HDCloudSyncPeriodicActivityScheduler
+ (void)registerDisabledPeriodicActivitiesForUnsupportedDaemon:(id)a3;
- (BOOL)cellularThresholdPassed;
- (HDCloudSyncPeriodicActivityScheduler)initWithCoordinator:(id)a3 behavior:(id)a4;
- (HDCloudSyncPlatformConfiguration)platformConfiguration;
- (HDXPCPeriodicActivity)periodicActivity;
- (__CFString)_reportingDescriptionForError:(void *)a1;
- (double)_timeSinceLastSyncSuccess;
- (id)_criteriaForActivity:(id *)a1;
- (id)syncContextForPeriodicActivity:(id)a3 periodicSyncType:(int64_t)a4;
- (id)unitTest_periodicActivity;
- (int64_t)periodicActivityErrorCount;
- (void)_queue_createActivities;
- (void)_setCriteriaForActivity:(id *)a1;
- (void)daemonReady:(id)a3;
- (void)disablePeriodicActivities;
- (void)performPeriodicActivity:(void *)a3 completion:;
- (void)setPeriodicActivity:(id)a3;
- (void)setupPeriodicActivities;
- (void)unitTest_performPeriodicSyncWithCompletion:(id)a3;
- (void)unitTest_setPeriodicActivity:(id)a3;
- (void)updatePeriodicActivitesWithResult:(int64_t)a3 minimumRetryInterval:(double)a4 activityStartDate:(id)a5 error:(id)a6;
- (void)updatePeriodicActivitiesWithSyncSuccess:(BOOL)a3;
- (void)updatePeriodicActivityCriteria;
@end

@implementation HDCloudSyncPeriodicActivityScheduler

- (HDCloudSyncPeriodicActivityScheduler)initWithCoordinator:(id)a3 behavior:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)HDCloudSyncPeriodicActivityScheduler;
  v8 = [(HDCloudSyncPeriodicActivityScheduler *)&v21 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_coordinator, v6);
    uint64_t v10 = HKCreateSerialUtilityDispatchQueue();
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v10;

    objc_storeStrong((id *)&v9->_behavior, a4);
    v12 = [HDCloudSyncPlatformConfiguration alloc];
    id WeakRetained = objc_loadWeakRetained((id *)&v9->_coordinator);
    v14 = [WeakRetained daemon];
    v15 = [v14 primaryProfile];
    uint64_t v16 = [(HDCloudSyncPlatformConfiguration *)v12 initWithPrimaryProfile:v15 behavior:v7];
    platformConfiguration = v9->_platformConfiguration;
    v9->_platformConfiguration = (HDCloudSyncPlatformConfiguration *)v16;

    id v18 = objc_loadWeakRetained((id *)&v9->_coordinator);
    v19 = [v18 daemon];
    [v19 registerDaemonReadyObserver:v9 queue:v9->_queue];
  }
  return v9;
}

+ (void)registerDisabledPeriodicActivitiesForUnsupportedDaemon:(id)a3
{
}

- (void)updatePeriodicActivityCriteria
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__HDCloudSyncPeriodicActivityScheduler_updatePeriodicActivityCriteria__block_invoke;
  block[3] = &unk_1E62F3208;
  block[4] = self;
  dispatch_async(queue, block);
}

void __70__HDCloudSyncPeriodicActivityScheduler_updatePeriodicActivityCriteria__block_invoke(uint64_t a1)
{
}

- (void)_setCriteriaForActivity:(id *)a1
{
  id v3 = a2;
  if (a1)
  {
    v5 = v3;
    v4 = -[HDCloudSyncPeriodicActivityScheduler _criteriaForActivity:](a1, v3);
    if (v4) {
      [v5 setCriteria:v4];
    }

    id v3 = v5;
  }
}

- (void)updatePeriodicActivitesWithResult:(int64_t)a3 minimumRetryInterval:(double)a4 activityStartDate:(id)a5 error:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __119__HDCloudSyncPeriodicActivityScheduler_updatePeriodicActivitesWithResult_minimumRetryInterval_activityStartDate_error___block_invoke;
  block[3] = &unk_1E6309760;
  double v19 = a4;
  block[4] = self;
  id v16 = v10;
  id v17 = v11;
  int64_t v18 = a3;
  id v13 = v11;
  id v14 = v10;
  dispatch_async(queue, block);
}

uint64_t __119__HDCloudSyncPeriodicActivityScheduler_updatePeriodicActivitesWithResult_minimumRetryInterval_activityStartDate_error___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 48) didPerformActivityWithResult:*(void *)(a1 + 56) minimumRetryInterval:*(void *)(a1 + 40) activityStartDate:*(void *)(a1 + 48) error:*(double *)(a1 + 64)];
}

- (void)_queue_createActivities
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
    if ([*(id *)(a1 + 40) shouldRegisterForPeriodicSyncActivities])
    {
      objc_initWeak(location, (id)a1);
      id v2 = objc_alloc(MEMORY[0x1E4F65DD0]);
      double v3 = (double)(uint64_t)*MEMORY[0x1E4F14218];
      uint64_t v4 = *MEMORY[0x1E4F14158];
      v5 = (uint64_t *)MEMORY[0x1E4F29FA8];
      uint64_t v6 = *MEMORY[0x1E4F29FA8];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __63__HDCloudSyncPeriodicActivityScheduler__queue_createActivities__block_invoke;
      v16[3] = &unk_1E6309788;
      objc_copyWeak(&v17, location);
      uint64_t v7 = [v2 initWithName:@"com.apple.healthd.sync.cloud.periodic" baseInterval:v4 criteria:v6 loggingCategory:v16 handler:v3];
      v8 = *(void **)(a1 + 48);
      *(void *)(a1 + 48) = v7;

      -[HDCloudSyncPeriodicActivityScheduler _setCriteriaForActivity:]((id *)a1, *(void **)(a1 + 48));
      id v9 = objc_alloc(MEMORY[0x1E4F65DD0]);
      uint64_t v10 = *v5;
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __63__HDCloudSyncPeriodicActivityScheduler__queue_createActivities__block_invoke_2;
      v14[3] = &unk_1E6309788;
      objc_copyWeak(&v15, location);
      uint64_t v11 = [v9 initWithName:@"com.apple.healthd.sync.cloud.userRequestedBackup" baseInterval:v4 criteria:v10 loggingCategory:v14 handler:0.0];
      v12 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = v11;

      -[HDCloudSyncPeriodicActivityScheduler _setCriteriaForActivity:]((id *)a1, *(void **)(a1 + 32));
      objc_destroyWeak(&v15);
      objc_destroyWeak(&v17);
      objc_destroyWeak(location);
    }
    else
    {
      _HKInitializeLogging();
      id v13 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(location[0]) = 0;
        _os_log_impl(&dword_1BCB7D000, v13, OS_LOG_TYPE_DEFAULT, "Skipping registering periodic sync activities for unsupported device", (uint8_t *)location, 2u);
      }
    }
  }
}

void __63__HDCloudSyncPeriodicActivityScheduler__queue_createActivities__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained(v4);
  -[HDCloudSyncPeriodicActivityScheduler performPeriodicActivity:completion:](WeakRetained, v6, v5);
}

- (void)performPeriodicActivity:(void *)a3 completion:
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    _HKInitializeLogging();
    uint64_t v7 = (os_log_t *)MEMORY[0x1E4F29FA8];
    v8 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v35 = a1;
      __int16 v36 = 2114;
      id v37 = v5;
      _os_log_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Cloud Sync Triggered to Perform Periodic Activity: %{public}@", buf, 0x16u);
    }
    id v9 = a1 + 1;
    id WeakRetained = objc_loadWeakRetained(a1 + 1);
    uint64_t v11 = [WeakRetained daemon];
    uint64_t v12 = [v11 analyticsSubmissionCoordinator];
    objc_msgSend((id)v12, "cloudSync_reportPeriodicSyncStartForType:", 0);

    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    id v14 = objc_loadWeakRetained(a1 + 1);
    id v33 = 0;
    LOBYTE(v12) = [v14 markAllClientSyncRequestsAsInProgress:&v33];
    id v15 = v33;

    if ((v12 & 1) == 0)
    {
      _HKInitializeLogging();
      id v16 = *v7;
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v35 = a1;
        __int16 v36 = 2114;
        id v37 = v15;
        _os_log_error_impl(&dword_1BCB7D000, v16, OS_LOG_TYPE_ERROR, "%{public}@: Error marking all client sync requests in progress %{public}@", buf, 0x16u);
      }
    }
    id v17 = objc_loadWeakRetained(a1 + 1);
    [v17 prepareAllProfilesForPeriodicSyncAndRestore];

    int64_t v18 = [a1 syncContextForPeriodicActivity:v5 periodicSyncType:0];
    double v19 = v18;
    if (v18)
    {
      uint64_t v24 = MEMORY[0x1E4F143A8];
      uint64_t v25 = 3221225472;
      v26 = __75__HDCloudSyncPeriodicActivityScheduler_performPeriodicActivity_completion___block_invoke;
      v27 = &unk_1E63097D8;
      v28 = a1;
      id v29 = v18;
      CFAbsoluteTime v32 = Current;
      id v30 = v5;
      id v31 = v6;
      v20 = +[HDMaintenanceOperation maintenanceOperationWithName:@"Periodic Cloud Sync" asynchronousBlock:&v24];
      objc_msgSend(v20, "setFaultOnTimeout:", 0, v24, v25, v26, v27, v28);
      id v21 = objc_loadWeakRetained(v9);
      v22 = [v21 daemon];
      v23 = [v22 maintenanceWorkCoordinator];
      [v23 enqueueMaintenanceOperation:v20];
    }
    else
    {
      (*((void (**)(id, void, void, double))v6 + 2))(v6, 0, 0, 0.0);
    }
  }
}

void __63__HDCloudSyncPeriodicActivityScheduler__queue_createActivities__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained(v4);
  -[HDCloudSyncPeriodicActivityScheduler performPeriodicActivity:completion:](WeakRetained, v6, v5);
}

- (void)setupPeriodicActivities
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__HDCloudSyncPeriodicActivityScheduler_setupPeriodicActivities__block_invoke;
  block[3] = &unk_1E62F3208;
  block[4] = self;
  dispatch_async(queue, block);
}

void __63__HDCloudSyncPeriodicActivityScheduler_setupPeriodicActivities__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  id v9 = 0;
  int v3 = [WeakRetained canPerformCloudSyncWithError:&v9];
  id v4 = v9;

  if (v3)
  {
    id v5 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
    id v6 = [v5 syncStatusProvider];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __63__HDCloudSyncPeriodicActivityScheduler_setupPeriodicActivities__block_invoke_2;
    v8[3] = &unk_1E62F3208;
    v8[4] = *(void *)(a1 + 32);
    [v6 updateCachedLastSyncDatesWithCompletion:v8];
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v7 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v11 = v4;
      _os_log_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_DEFAULT, "Sync unavailable; setting up periodic activity with default values: %{public}@",
        buf,
        0xCu);
    }
    -[HDCloudSyncPeriodicActivityScheduler _queue_createActivities](*(void *)(a1 + 32));
  }
}

void __63__HDCloudSyncPeriodicActivityScheduler_setupPeriodicActivities__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(NSObject **)(v1 + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__HDCloudSyncPeriodicActivityScheduler_setupPeriodicActivities__block_invoke_3;
  block[3] = &unk_1E62F3208;
  block[4] = v1;
  dispatch_async(v2, block);
}

void __63__HDCloudSyncPeriodicActivityScheduler_setupPeriodicActivities__block_invoke_3(uint64_t a1)
{
}

- (void)disablePeriodicActivities
{
  id v2 = (uint64_t *)MEMORY[0x1E4F29FA8];
  [MEMORY[0x1E4F65DD0] registerDisabledPeriodicActivityWithName:@"com.apple.healthd.sync.cloud.periodic" loggingCategory:*MEMORY[0x1E4F29FA8]];
  int v3 = (void *)MEMORY[0x1E4F65DD0];
  uint64_t v4 = *v2;

  [v3 registerDisabledPeriodicActivityWithName:@"com.apple.healthd.sync.cloud.userRequestedBackup" loggingCategory:v4];
}

- (int64_t)periodicActivityErrorCount
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __66__HDCloudSyncPeriodicActivityScheduler_periodicActivityErrorCount__block_invoke;
  v5[3] = &unk_1E62F3230;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __66__HDCloudSyncPeriodicActivityScheduler_periodicActivityErrorCount__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 48) errorCount];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)updatePeriodicActivitiesWithSyncSuccess:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __80__HDCloudSyncPeriodicActivityScheduler_updatePeriodicActivitiesWithSyncSuccess___block_invoke;
  v4[3] = &unk_1E62F8638;
  BOOL v5 = a3;
  v4[4] = self;
  dispatch_async(queue, v4);
}

void __80__HDCloudSyncPeriodicActivityScheduler_updatePeriodicActivitiesWithSyncSuccess___block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 40);
  int64_t v3 = *(id **)(a1 + 32);
  if (v2)
  {
    -[HDCloudSyncPeriodicActivityScheduler _criteriaForActivity:](v3, v3[6]);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [*(id *)(*(void *)(a1 + 32) + 48) resetIntervalWithCriteria:v4];
  }
  else
  {
    [v3 updatePeriodicActivityCriteria];
  }
}

- (id)_criteriaForActivity:(id *)a1
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  xpc_object_t empty = 0;
  if (a1 && v3)
  {
    xpc_object_t empty = xpc_dictionary_create_empty();
    [v4 modifiedIntervalForCurrentState];
    if (v6 > 0.0) {
      xpc_dictionary_set_int64(empty, (const char *)*MEMORY[0x1E4F141C8], (uint64_t)v6);
    }
    xpc_dictionary_set_BOOL(empty, (const char *)*MEMORY[0x1E4F14138], 1);
    uint64_t v7 = (const char *)*MEMORY[0x1E4F142C8];
    uint64_t v8 = (const char *)*MEMORY[0x1E4F142E0];
    xpc_dictionary_set_string(empty, (const char *)*MEMORY[0x1E4F142C8], (const char *)*MEMORY[0x1E4F142E0]);
    xpc_dictionary_set_BOOL(empty, (const char *)*MEMORY[0x1E4F14338], 1);
    id WeakRetained = objc_loadWeakRetained(a1 + 1);
    id v20 = 0;
    char v10 = [WeakRetained canPerformCloudSyncWithError:&v20];
    id v11 = v20;

    if (v10)
    {
      xpc_dictionary_set_BOOL(empty, (const char *)*MEMORY[0x1E4F14330], [a1[5] requireInexpensiveNetworking]);
      if (a1[6] == v4)
      {
        id v15 = (const char *)*MEMORY[0x1E4F14318];
        id v16 = empty;
        xpc_dictionary_set_BOOL(v16, v15, 1);
        int64_t v17 = [a1[5] baseIntervalForPeriodicSyncActivity];
        int64_t v18 = (const char *)[a1[5] priorityForPeriodicSyncActivity];
        xpc_dictionary_set_int64(v16, (const char *)*MEMORY[0x1E4F141C8], v17);
        xpc_dictionary_set_string(v16, v7, v18);

        _HKInitializeLogging();
        double v19 = *MEMORY[0x1E4F29FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134349056;
          int64_t v22 = v17;
          _os_log_impl(&dword_1BCB7D000, v19, OS_LOG_TYPE_DEFAULT, "Setting up primary periodic activity with base interval %{public}lld seconds", buf, 0xCu);
        }
      }
      else if (a1[4] == v4)
      {
        id v12 = empty;
        xpc_dictionary_set_string(v12, v7, v8);
        xpc_dictionary_set_BOOL(v12, (const char *)*MEMORY[0x1E4F14360], 1);
      }
    }
    else
    {
      _HKInitializeLogging();
      id v13 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        int64_t v22 = (int64_t)a1;
        __int16 v23 = 2114;
        id v24 = v11;
        _os_log_impl(&dword_1BCB7D000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: Cloud sync unavailable, setting disabled periodic activity criteria: %{public}@", buf, 0x16u);
      }
      xpc_dictionary_set_int64(empty, (const char *)*MEMORY[0x1E4F141C8], *MEMORY[0x1E4F14228]);
    }
  }

  return empty;
}

void __75__HDCloudSyncPeriodicActivityScheduler_performPeriodicActivity_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __75__HDCloudSyncPeriodicActivityScheduler_performPeriodicActivity_completion___block_invoke_2;
  v8[3] = &unk_1E63097B0;
  uint64_t v12 = *(void *)(a1 + 64);
  uint64_t v5 = *(void *)(a1 + 40);
  v8[4] = *(void *)(a1 + 32);
  id v9 = *(id *)(a1 + 48);
  id v10 = v3;
  id v11 = *(id *)(a1 + 56);
  id v6 = v3;
  id v7 = (id)[WeakRetained syncAllProfilesWithContext:v5 completion:v8];
}

void __75__HDCloudSyncPeriodicActivityScheduler_performPeriodicActivity_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  double v6 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 64);
  if (a2)
  {
LABEL_2:
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
    uint64_t v8 = [WeakRetained daemon];
    id v9 = [v8 analyticsSubmissionCoordinator];
    objc_msgSend(v9, "cloudSync_reportPeriodicSyncSuccessAfterDuration:type:", 0, v6);

    uint64_t v10 = *(void *)(a1 + 32);
    double v11 = 0.0;
    if (v10) {
      dispatch_async(*(dispatch_queue_t *)(v10 + 24), &__block_literal_global_204);
    }
    goto LABEL_27;
  }
  uint64_t v12 = *(void *)(a1 + 32);
  id v13 = v5;
  id v14 = v13;
  id v15 = (void *)MEMORY[0x1E4F19C40];
  if (v12
    && ([v13 domain],
        id v16 = objc_claimAutoreleasedReturnValue(),
        char v17 = [v16 isEqualToString:*v15],
        v16,
        (v17 & 1) != 0))
  {
    uint64_t v18 = [v14 code];

    if (v18 == 25)
    {
      _HKInitializeLogging();
      double v19 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        uint64_t v31 = *(void *)(a1 + 32);
        *(_DWORD *)CFAbsoluteTime v32 = 138543618;
        *(void *)&v32[4] = v31;
        *(_WORD *)&v32[12] = 2114;
        *(void *)&v32[14] = v14;
        _os_log_error_impl(&dword_1BCB7D000, v19, OS_LOG_TYPE_ERROR, "%{public}@: Treating cloud sync error as success for periodic activity: %{public}@", v32, 0x16u);
      }

      id v5 = 0;
      goto LABEL_2;
    }
  }
  else
  {
  }
  if (!v14)
  {
    id v14 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 124, @"Periodic sync failed, but did not provide an error");
  }
  [*(id *)(a1 + 40) shouldDefer];
  id v20 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  id v21 = [v20 daemon];
  int64_t v22 = [v21 analyticsSubmissionCoordinator];
  objc_msgSend(v22, "cloudSync_reportPeriodicSyncFailureWithError:duration:type:", v14, 0, v6);

  __int16 v23 = [v14 domain];
  LODWORD(v21) = [v23 isEqualToString:*v15];

  if (v21)
  {
    id v24 = [v14 userInfo];
    uint64_t v25 = [v24 objectForKeyedSubscript:*MEMORY[0x1E4F19C60]];

    objc_opt_class();
    double v11 = 0.0;
    if (objc_opt_isKindOfClass())
    {
      [v25 doubleValue];
      double v11 = v26;
    }
    if ([v14 code] != 3) {
      [v14 code];
    }
  }
  else
  {
    double v11 = 0.0;
    if (objc_msgSend(v14, "hk_isHealthKitError")
      && [v14 code] != 701
      && objc_msgSend(v14, "hk_isDatabaseAccessibilityError"))
    {
      [*(id *)(*(void *)(a1 + 32) + 40) isConfiguredForLiteSync];
    }
  }
  uint64_t v27 = *(void *)(a1 + 32);
  id v28 = v14;
  id v5 = v28;
  if (v27)
  {
    id v29 = *(NSObject **)(v27 + 24);
    *(void *)CFAbsoluteTime v32 = MEMORY[0x1E4F143A8];
    *(void *)&v32[8] = 3221225472;
    *(void *)&v32[16] = __66__HDCloudSyncPeriodicActivityScheduler__persistPeriodicSyncError___block_invoke;
    id v33 = &unk_1E62F31C0;
    uint64_t v34 = v27;
    id v35 = v28;
    dispatch_async(v29, v32);
  }
LABEL_27:
  id v30 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [v30 clearClientSyncRequestsQueue];

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  (*(void (**)(double))(*(void *)(a1 + 56) + 16))(v11);
}

- (id)syncContextForPeriodicActivity:(id)a3 periodicSyncType:(int64_t)a4
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  double v6 = v5;
  if (*(double *)&self == 0.0) {
    goto LABEL_52;
  }
  id v7 = [v5 currentCriteria];
  uint64_t v8 = v7;
  if (v7) {
    BOOL v9 = xpc_dictionary_get_BOOL(v7, (const char *)*MEMORY[0x1E4F14330]);
  }
  else {
    BOOL v9 = 1;
  }
  if ([(HDCloudSyncPlatformConfiguration *)self->_platformConfiguration requireInexpensiveNetworking]|| ((v9 | ![(HDCloudSyncPeriodicActivityScheduler *)self cellularThresholdPassed]) & 1) != 0)
  {

    uint64_t v10 = 0;
  }
  else
  {
    _HKInitializeLogging();
    double v11 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      int v72 = 138543362;
      double v73 = *(double *)&self;
      _os_log_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Cellular access requested for activity because cellular threshold has passed", (uint8_t *)&v72, 0xCu);
    }

    uint64_t v10 = 1024;
  }
  if (![(_HKBehavior *)self->_behavior supportsPeriodicFullCloudSync]) {
    goto LABEL_15;
  }
  double Sync = -[HDCloudSyncPeriodicActivityScheduler _timeSinceLastSyncSuccess]((uint64_t)self);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_coordinator);
  id v14 = [WeakRetained syncStatusProvider];
  id v15 = [v14 syncStatus];
  id v16 = [v15 lastSuccessfulPullDate];

  id v17 = objc_loadWeakRetained((id *)&self->_coordinator);
  uint64_t v18 = [v17 syncStatusProvider];
  double v19 = [v18 syncStatus];
  id v20 = [v19 lastSuccessfulPushDate];

  if (v16)
  {
    if (v20 && Sync <= 28800.0)
    {
LABEL_15:
      id v21 = objc_loadWeakRetained((id *)&self->_coordinator);
      int64_t v22 = [v21 syncStatusProvider];
      __int16 v23 = [v22 syncStatus];

      if (![(_HKBehavior *)self->_behavior supportsPeriodicLiteCloudSync])
      {
LABEL_51:

        goto LABEL_52;
      }
      id v24 = [v23 lastSuccessfulLitePushDate];

      if (!v24)
      {

LABEL_41:
        BOOL v64 = [(HDCloudSyncPlatformConfiguration *)self->_platformConfiguration isConfiguredForLiteSync];
        v45 = (void *)[objc_alloc(MEMORY[0x1E4F2AE40]) initWithPush:1 pull:1];
        if (v64)
        {
          id v46 = objc_alloc_init(MEMORY[0x1E4F2B5A0]);
          v47 = objc_msgSend(objc_alloc(MEMORY[0x1E4F2ACC0]), "initWithPush:pull:lite:", 1, -[HDCloudSyncPlatformConfiguration canLiteSyncPull](self->_platformConfiguration, "canLiteSyncPull"), 1);
        }
        else
        {
          v47 = 0;
          id v46 = 0;
        }
        uint64_t v48 = 32;
        goto LABEL_45;
      }
      if ([(HDCloudSyncPlatformConfiguration *)self->_platformConfiguration shouldRestrictSyncInSleepFocus])
      {
        _HKInitializeLogging();
        uint64_t v25 = *MEMORY[0x1E4F29FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
        {
          int v72 = 138543362;
          double v73 = *(double *)&self;
          _os_log_impl(&dword_1BCB7D000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@: Device is in sleep focus mode, not triggering lite sync", (uint8_t *)&v72, 0xCu);
        }
        goto LABEL_51;
      }
      double Current = CFAbsoluteTimeGetCurrent();
      [(HDCloudSyncPlatformConfiguration *)self->_platformConfiguration liteSyncThreshold];
      double v51 = v50;
      if ([(HDCloudSyncPlatformConfiguration *)self->_platformConfiguration participateInCoordinatedSync])
      {
        id v52 = objc_loadWeakRetained((id *)&self->_coordinator);
        v53 = [v52 daemon];
        v54 = [v53 primaryProfile];
        v55 = HDCloudSyncLastSuccessfulPushDateForCoordinatedSync(v54);

        if (v55)
        {
          [v55 timeIntervalSinceReferenceDate];
          double v57 = Current - v56;
          if (Current - v56 < 3600.0)
          {
            _HKInitializeLogging();
            v70 = *MEMORY[0x1E4F29FA8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEBUG))
            {
              int v72 = 134217984;
              double v73 = v57 / 60.0;
              _os_log_debug_impl(&dword_1BCB7D000, v70, OS_LOG_TYPE_DEBUG, "Skipping Lite Sync on Watch because paired phone last synced %f minutes ago", (uint8_t *)&v72, 0xCu);
            }

            goto LABEL_51;
          }
        }
      }
      v58 = [v23 lastSuccessfulPushDate];
      [v58 timeIntervalSinceReferenceDate];
      double v60 = Current - v59;

      v61 = [v23 lastSuccessfulLitePushDate];
      [v61 timeIntervalSinceReferenceDate];
      double v63 = Current - v62;

      if (v60 < v63) {
        double v63 = v60;
      }

      if (v63 > v51) {
        goto LABEL_41;
      }
LABEL_52:
      _HKInitializeLogging();
      v43 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
      {
        int v72 = 138543618;
        double v73 = *(double *)&self;
        __int16 v74 = 2114;
        v75 = v6;
        v44 = "%{public}@: Performing No-op for activity %{public}@";
        goto LABEL_54;
      }
      goto LABEL_55;
    }
  }
  id v26 = objc_loadWeakRetained((id *)&self->_coordinator);
  uint64_t v27 = [v26 syncStatusProvider];
  id v28 = [v27 syncStatus];
  id v29 = [v28 lastSuccessfulPushDate];

  BOOL v33 = 1;
  if (v29)
  {
    id v30 = [MEMORY[0x1E4F1C9C8] date];
    [v30 timeIntervalSinceDate:v29];
    double v32 = v31;

    if (v32 < 7200.0) {
      BOOL v33 = 0;
    }
  }

  id v34 = objc_loadWeakRetained((id *)&self->_coordinator);
  id v35 = [v34 syncStatusProvider];
  uint64_t v36 = [v35 syncStatus];
  id v37 = [v36 lastSuccessfulPullDate];

  if (v37)
  {
    uint64_t v38 = [MEMORY[0x1E4F1C9C8] date];
    [v38 timeIntervalSinceDate:v37];
    double v40 = v39;

    BOOL v41 = v40 > 900.0;
    char v42 = v40 > 900.0 || v33;
    if ((v42 & 1) == 0)
    {
      _HKInitializeLogging();
      v43 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
      {
        int v72 = 138543618;
        double v73 = *(double *)&self;
        __int16 v74 = 2114;
        v75 = v6;
        v44 = "%{public}@: No Push and Pull required. Performing No-op for activity %{public}@";
LABEL_54:
        _os_log_impl(&dword_1BCB7D000, v43, OS_LOG_TYPE_DEFAULT, v44, (uint8_t *)&v72, 0x16u);
      }
LABEL_55:
      id v66 = 0;
      goto LABEL_56;
    }
  }
  else
  {
    BOOL v41 = 1;
  }
  v45 = (void *)[objc_alloc(MEMORY[0x1E4F2AE40]) initWithPush:1 pull:1];
  id v46 = objc_alloc_init(MEMORY[0x1E4F2B5A0]);
  v47 = (void *)[objc_alloc(MEMORY[0x1E4F2ACC0]) initWithPush:v33 pull:v41 lite:0];
  uint64_t v48 = 0;
LABEL_45:
  v65 = (void *)[objc_alloc(MEMORY[0x1E4F2AD68]) initWithChangesSyncRequest:v47 contextSyncRequest:v45 stateSyncRequest:v46 medicalIDSyncRequest:0 summarySharingSyncRequest:0];
  id v66 = [[HDCloudSyncContext alloc] initForPurpose:0 options:HDOptionsForRequest(v65) | v10 reason:v48 xpcActivity:v6];
  [v66 setSyncRequest:v65];
  _HKInitializeLogging();
  v67 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    v68 = v67;
    v69 = HKCloudSyncReasonToString();
    int v72 = 138544130;
    double v73 = *(double *)&self;
    __int16 v74 = 2114;
    v75 = v69;
    __int16 v76 = 2114;
    id v77 = v66;
    __int16 v78 = 2114;
    v79 = v6;
    _os_log_impl(&dword_1BCB7D000, v68, OS_LOG_TYPE_DEFAULT, "%{public}@: Performing %{public}@ with context %{public}@ for activity %{public}@", (uint8_t *)&v72, 0x2Au);
  }
LABEL_56:

  return v66;
}

- (__CFString)_reportingDescriptionForError:(void *)a1
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  int v2 = [v1 domain];
  int v3 = [v2 isEqualToString:*MEMORY[0x1E4F29B70]];

  if (v3)
  {
    if ([v1 code] == 100)
    {
      id v4 = [v1 userInfo];
      id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

      if (v5)
      {
        -[HDCloudSyncPeriodicActivityScheduler _reportingDescriptionForError:](v5);
        double v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        uint64_t v25 = NSString;
        id v26 = [v1 userInfo];
        uint64_t v27 = [v26 objectForKeyedSubscript:*MEMORY[0x1E4F28568]];
        id v28 = (void *)v27;
        if (v27)
        {
          double v6 = [v25 stringWithFormat:@"HealthKit Internal Failure: %@", v27];
        }
        else
        {
          id v29 = [v1 description];
          double v6 = [v25 stringWithFormat:@"HealthKit Internal Failure: %@", v29];
        }
      }

      goto LABEL_27;
    }
LABEL_19:
    double v6 = [v1 description];
    goto LABEL_27;
  }
  id v7 = [v1 domain];
  uint64_t v8 = *MEMORY[0x1E4F19C40];
  int v9 = [v7 isEqualToString:*MEMORY[0x1E4F19C40]];

  if (!v9 || [v1 code] != 2) {
    goto LABEL_19;
  }
  id v32 = v1;
  id v10 = v1;
  double v11 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"CloudKit Partial Error:"];
  double v31 = v10;
  uint64_t v12 = [v10 userInfo];
  id v13 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F19CD8]];

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v14 = v13;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v34;
LABEL_9:
    uint64_t v18 = 0;
    while (1)
    {
      if (*(void *)v34 != v17) {
        objc_enumerationMutation(v14);
      }
      uint64_t v19 = *(void *)(*((void *)&v33 + 1) + 8 * v18);
      id v20 = [v14 objectForKeyedSubscript:v19];
      id v21 = [v20 domain];
      int v22 = [v21 isEqualToString:v8];

      if (!v22) {
        goto LABEL_15;
      }
      uint64_t v23 = [v20 code];
      if (v23 != 11) {
        break;
      }
LABEL_16:

      if (v16 == ++v18)
      {
        uint64_t v16 = [v14 countByEnumeratingWithState:&v33 objects:v37 count:16];
        if (v16) {
          goto LABEL_9;
        }
        goto LABEL_18;
      }
    }
    if (v23 == 110)
    {

      double v6 = @"Manatee Unavailable (Within CloudKit Partial Error)";
      goto LABEL_23;
    }
LABEL_15:
    id v24 = [v20 description];
    [v11 appendFormat:@"\n\t%@ => %@", v19, v24];

    goto LABEL_16;
  }
LABEL_18:

  double v6 = v11;
LABEL_23:

  id v1 = v32;
LABEL_27:

  return v6;
}

- (BOOL)cellularThresholdPassed
{
  double Sync = -[HDCloudSyncPeriodicActivityScheduler _timeSinceLastSyncSuccess]((uint64_t)self);
  [(HDCloudSyncPlatformConfiguration *)self->_platformConfiguration cellularSyncThreshold];
  return Sync > v4;
}

- (double)_timeSinceLastSyncSuccess
{
  if (!a1) {
    return 0.0;
  }
  double Current = CFAbsoluteTimeGetCurrent();
  int v3 = (id *)(a1 + 8);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  id v5 = [WeakRetained syncStatusProvider];
  double v6 = [v5 syncStatus];
  id v7 = [v6 lastSuccessfulPullDate];

  id v8 = objc_loadWeakRetained(v3);
  int v9 = [v8 syncStatusProvider];
  id v10 = [v9 syncStatus];
  double v11 = [v10 lastSuccessfulPushDate];

  id v12 = objc_loadWeakRetained(v3);
  id v13 = [v12 syncStatusProvider];
  id v14 = [v13 syncStatus];
  uint64_t v15 = [v14 lastSuccessfulLitePushDate];

  [v11 timeIntervalSinceReferenceDate];
  double v17 = Current - v16;
  [v15 timeIntervalSinceReferenceDate];
  double v19 = Current - v18;
  if (v17 >= v19) {
    double v17 = v19;
  }
  [v7 timeIntervalSinceReferenceDate];
  double v21 = Current - v20;
  if (v17 >= v21) {
    double v22 = v17;
  }
  else {
    double v22 = v21;
  }

  return v22;
}

void __66__HDCloudSyncPeriodicActivityScheduler__persistPeriodicSyncError___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (!*(void *)(a1 + 32)) {
    goto LABEL_7;
  }
  uint64_t v2 = -[HDCloudSyncPeriodicActivityScheduler _reportingDescriptionForError:](*(void **)(a1 + 40));
  if (!v2) {
    goto LABEL_7;
  }
  int v3 = (void *)v2;
  double v4 = NSString;
  id v5 = [MEMORY[0x1E4F1C9C8] date];
  double v6 = [v4 stringWithFormat:@"[%@] %@", v5, v3];

  if (v6)
  {
    id v7 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    id v8 = [v7 stringArrayForKey:@"HDLongTimeWithoutSuccessfulCloudSyncPeriodicSyncErrorStrings"];
    if (v8)
    {
      int v9 = [MEMORY[0x1E4F1CA48] arrayWithArray:v8];
      [v9 insertObject:v6 atIndex:0];
      if ((unint64_t)[v9 count] >= 0x1D) {
        [v9 removeLastObject];
      }
    }
    else
    {
      id v13 = v6;
      int v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
    }
    [v7 setObject:v9 forKey:@"HDLongTimeWithoutSuccessfulCloudSyncPeriodicSyncErrorStrings"];
  }
  else
  {
LABEL_7:
    _HKInitializeLogging();
    id v10 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      uint64_t v12 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v15 = v11;
      __int16 v16 = 2114;
      uint64_t v17 = v12;
      _os_log_error_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_ERROR, "%{public}@: Skipping persistence of error: %{public}@", buf, 0x16u);
    }
    double v6 = 0;
  }
}

void __73__HDCloudSyncPeriodicActivityScheduler__resetPersistedPeriodicSyncErrors__block_invoke()
{
  id v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v0 removeObjectForKey:@"HDLongTimeWithoutSuccessfulCloudSyncPeriodicSyncErrorStrings"];
}

- (void)daemonReady:(id)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (![(HDCloudSyncPlatformConfiguration *)self->_platformConfiguration shouldRegisterForPeriodicSyncActivities])
  {
    double v4 = (void *)MEMORY[0x1E4F65DD0];
    uint64_t v5 = *MEMORY[0x1E4F29FA8];
    [v4 registerDisabledPeriodicActivityWithName:@"com.apple.healthd.sync.cloud.periodic" loggingCategory:v5];
  }
}

- (void)unitTest_performPeriodicSyncWithCompletion:(id)a3
{
  id v4 = a3;
  periodicActivity = self->_periodicActivity;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __83__HDCloudSyncPeriodicActivityScheduler_unitTest_performPeriodicSyncWithCompletion___block_invoke;
  v7[3] = &unk_1E6309800;
  id v8 = v4;
  id v6 = v4;
  -[HDCloudSyncPeriodicActivityScheduler performPeriodicActivity:completion:]((id *)&self->super.isa, periodicActivity, v7);
}

uint64_t __83__HDCloudSyncPeriodicActivityScheduler_unitTest_performPeriodicSyncWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)unitTest_setPeriodicActivity:(id)a3
{
}

- (id)unitTest_periodicActivity
{
  return self->_periodicActivity;
}

- (HDCloudSyncPlatformConfiguration)platformConfiguration
{
  return self->_platformConfiguration;
}

- (HDXPCPeriodicActivity)periodicActivity
{
  return self->_periodicActivity;
}

- (void)setPeriodicActivity:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_periodicActivity, 0);
  objc_storeStrong((id *)&self->_platformConfiguration, 0);
  objc_storeStrong((id *)&self->_userRequestedBackupActivity, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_behavior, 0);

  objc_destroyWeak((id *)&self->_coordinator);
}

@end