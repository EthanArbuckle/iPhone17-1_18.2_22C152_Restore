@interface HDCloudSyncCoordinator
- (BOOL)canPerformCloudSyncWithError:(id *)a3;
- (BOOL)hasActiveSyncTask;
- (BOOL)markAllClientSyncRequestsAsInProgress:(id *)a3;
- (BOOL)scheduleSyncForAllProfilesViaGatedXPCActivity:(BOOL)a3 context:(id)a4 reason:(id)a5 error:(id *)a6;
- (BOOL)shouldSyncProfile:(id)a3;
- (HDCloudSyncAccountProvider)accountProvider;
- (HDCloudSyncCoordinator)initWithDaemon:(id)a3;
- (HDCloudSyncPeriodicActivityScheduler)periodicActivityScheduler;
- (HDCloudSyncStatusProvider)syncStatusProvider;
- (HDCloudSyncSubscriptionNotificationHandler)subscriptionNotificationHandler;
- (HDDaemon)daemon;
- (OS_dispatch_queue)queue;
- (double)nextCloudKitOperationDelay;
- (id)_mergeCloudSyncJournalsForProfile:(id)a3 taskTree:(id)a4;
- (id)_mergeCloudSyncJournalsWithTaskTree:(id)a3;
- (id)_primaryProfile;
- (id)_queue_syncProfilesWithIdentifiers:(void *)a3 context:(void *)a4 completion:;
- (id)addCloudSyncProgressCompletion:(id)a3;
- (id)diagnosticDescription;
- (id)fetchCloudDescriptionWithContext:(id)a3 completion:(id)a4;
- (id)mergeCloudSyncJournalsAndNotifyObservers:(id)a3 syncRequestCompleted:(id)a4 success:(BOOL)a5 error:(id)a6;
- (id)mergeCloudSyncJournalsWithCompletion:(id)a3;
- (id)progressOfActiveSyncTask;
- (id)resetAllProfilesWithContext:(id)a3 completion:(id)a4;
- (id)stateSyncDomainForSubscriptionIdentifier;
- (id)stateSyncEntityClasses;
- (id)syncAllProfilesWithContext:(id)a3 completion:(id)a4;
- (id)unitTest_clientGatedSyncActivity;
- (int64_t)compareTask:(id)a3 withTask:(id)a4 queue:(id)a5;
- (uint64_t)_setupSyncRequestWithContext:(void *)a3 reason:(void *)a4 error:;
- (void)_setupCloudSyncSupportIfRequired;
- (void)_syncAllProfilesViaGatedXPCActivity:(void *)a3 completion:;
- (void)_syncAllProfilesViaGatedXPCActivityWithCompletion:(uint64_t)a1;
- (void)addManagerTask:(id)a3;
- (void)addObserver:(id)a3;
- (void)clearClientSyncRequestsQueue;
- (void)cloudSyncSupportStatusDidChange;
- (void)daemonReady:(id)a3;
- (void)databaseJournalMergeDidCompleteForProfile:(id)a3 type:(int64_t)a4;
- (void)dealloc;
- (void)delayNextCloudKitOperation:(double)a3;
- (void)notifyObservers:(id)a3 syncRequestCompleted:(id)a4 success:(BOOL)a5 error:(id)a6;
- (void)notifyObservers:(id)a3 syncRequestStarted:(id)a4 withProgress:(id)a5;
- (void)prepareAllProfilesForPeriodicSyncAndRestore;
- (void)profileDidBecomeReady:(id)a3;
- (void)removeObserver:(id)a3;
- (void)scheduleSharedSummaryPushWithMaximumDelay:(double)a3;
- (void)syncAllProfilesViaGatedXPCActivity:(BOOL)a3 context:(id)a4 reason:(id)a5 completion:(id)a6;
- (void)unitTest_performClientGatedSyncActivity:(id)a3;
- (void)unitTest_setAccountProvider:(id)a3;
- (void)unitTest_setClientGatedSyncActivity:(id)a3;
- (void)unitTest_setPeriodicActivityScheduler:(id)a3;
- (void)unitTest_setPrimaryProfileOverride:(id)a3;
- (void)unitTest_setStateSyncEntityClasses:(id)a3;
@end

@implementation HDCloudSyncCoordinator

- (HDCloudSyncCoordinator)initWithDaemon:(id)a3
{
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)HDCloudSyncCoordinator;
  v5 = [(HDCloudSyncCoordinator *)&v34 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_daemon, v4);
    v6->_lock._os_unfair_lock_opaque = 0;
    uint64_t v7 = HKCreateSerialUtilityDispatchQueue();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    v9 = objc_alloc_init(HDCloudSyncManagerTaskQueue);
    syncTaskQueue = v6->_syncTaskQueue;
    v6->_syncTaskQueue = v9;

    [(HDCloudSyncManagerTaskQueue *)v6->_syncTaskQueue setDelegate:v6];
    v11 = [HDCloudSyncPeriodicActivityScheduler alloc];
    v12 = [(HDCloudSyncCoordinator *)v6 daemon];
    v13 = [v12 behavior];
    uint64_t v14 = [(HDCloudSyncPeriodicActivityScheduler *)v11 initWithCoordinator:v6 behavior:v13];
    periodicActivityScheduler = v6->_periodicActivityScheduler;
    v6->_periodicActivityScheduler = (HDCloudSyncPeriodicActivityScheduler *)v14;

    v16 = [HDCloudSyncAccountProvider alloc];
    v17 = [(HDCloudSyncCoordinator *)v6 daemon];
    v18 = [v17 behavior];
    uint64_t v19 = [(HDCloudSyncAccountProvider *)v16 initWithCoordinator:v6 behavior:v18];
    accountProvider = v6->_accountProvider;
    v6->_accountProvider = (HDCloudSyncAccountProvider *)v19;

    v21 = [HDCloudSyncStatusProvider alloc];
    v22 = [(HDCloudSyncCoordinator *)v6 daemon];
    v23 = [v22 behavior];
    uint64_t v24 = [(HDCloudSyncStatusProvider *)v21 initWithCoordinator:v6 behavior:v23];
    syncStatusProvider = v6->_syncStatusProvider;
    v6->_syncStatusProvider = (HDCloudSyncStatusProvider *)v24;

    v26 = [HDCloudSyncSubscriptionNotificationHandler alloc];
    v27 = [(HDCloudSyncCoordinator *)v6 daemon];
    v28 = [v27 behavior];
    uint64_t v29 = [(HDCloudSyncSubscriptionNotificationHandler *)v26 initWithCoordinator:v6 behavior:v28];
    subscriptionNotificationHandler = v6->_subscriptionNotificationHandler;
    v6->_subscriptionNotificationHandler = (HDCloudSyncSubscriptionNotificationHandler *)v29;

    v31 = [MEMORY[0x1E4F65CF8] sharedDiagnosticManager];
    [v31 addObject:v6];

    id WeakRetained = objc_loadWeakRetained((id *)&v6->_daemon);
    [WeakRetained registerDaemonReadyObserver:v6 queue:v6->_queue];
  }
  return v6;
}

- (void)daemonReady:(id)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);
  v5 = [WeakRetained primaryProfile];
  v6 = [v5 database];
  [v6 addDatabaseJournalMergeObserver:self journalType:2 queue:self->_queue];

  id v8 = objc_loadWeakRetained((id *)&self->_daemon);
  uint64_t v7 = [v8 primaryProfile];
  [v7 registerProfileReadyObserver:self queue:self->_queue];
}

- (void)profileDidBecomeReady:(id)a3
{
  id v24 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[HDCloudSyncCoordinator _setupCloudSyncSupportIfRequired]((uint64_t)self);
  id v4 = objc_alloc(MEMORY[0x1E4F2B2D0]);
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  uint64_t v7 = (uint64_t *)MEMORY[0x1E4F29FA8];
  id v8 = (HKObserverSet *)[v4 initWithName:v6 loggingCategory:*MEMORY[0x1E4F29FA8]];
  observers = self->_observers;
  self->_observers = v8;

  xpc_object_t empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_BOOL(empty, (const char *)*MEMORY[0x1E4F14320], 1);
  v11 = (const char *)*MEMORY[0x1E4F14338];
  xpc_dictionary_set_BOOL(empty, (const char *)*MEMORY[0x1E4F14338], 1);
  xpc_dictionary_set_BOOL(empty, (const char *)*MEMORY[0x1E4F14308], 1);
  v12 = (const char *)*MEMORY[0x1E4F142C8];
  v13 = (const char *)*MEMORY[0x1E4F142E0];
  xpc_dictionary_set_string(empty, (const char *)*MEMORY[0x1E4F142C8], (const char *)*MEMORY[0x1E4F142E0]);
  _HKInitializeLogging();
  objc_initWeak(&location, self);
  id v14 = objc_alloc(MEMORY[0x1E4F65DC0]);
  uint64_t v15 = *v7;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __48__HDCloudSyncCoordinator_profileDidBecomeReady___block_invoke;
  v27[3] = &unk_1E62F94B8;
  objc_copyWeak(&v28, &location);
  v16 = (HDXPCGatedActivity *)[v14 initWithName:@"com.apple.healthd.sync.client.request" criteria:empty loggingCategory:v15 handler:v27];
  clientGatedSyncActivity = self->_clientGatedSyncActivity;
  self->_clientGatedSyncActivity = v16;

  v18 = [[HDCoalescedTaskPoolQuota alloc] initWithAvailableQuota:3 maximumQuota:3 refillInterval:1800.0 minimumInterval:60.0 lastTrigger:0.0];
  [(HDXPCGatedActivity *)self->_clientGatedSyncActivity setQuota:v18];

  xpc_object_t v19 = xpc_dictionary_create_empty();
  xpc_dictionary_set_BOOL(v19, (const char *)*MEMORY[0x1E4F14310], 1);
  xpc_dictionary_set_BOOL(v19, v11, 1);
  xpc_dictionary_set_string(v19, v12, v13);
  id v20 = objc_alloc(MEMORY[0x1E4F65DC0]);
  uint64_t v21 = *MEMORY[0x1E4F29FA8];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __48__HDCloudSyncCoordinator_profileDidBecomeReady___block_invoke_2;
  v25[3] = &unk_1E62F94B8;
  objc_copyWeak(&v26, &location);
  v22 = (HDXPCGatedActivity *)[v20 initWithName:@"com.apple.healthd.sync.cloud.summary.push" criteria:v19 loggingCategory:v21 handler:v25];
  sharedSummaryPushActivity = self->_sharedSummaryPushActivity;
  self->_sharedSummaryPushActivity = v22;

  [(HDXPCGatedActivity *)self->_sharedSummaryPushActivity setRescheduleWhileInProgress:1];
  objc_destroyWeak(&v26);

  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);
}

- (void)_setupCloudSyncSupportIfRequired
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 168));
    v3 = [WeakRetained behavior];
    int v4 = [v3 supportsCloudSync];

    _HKInitializeLogging();
    v5 = (void *)*MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_INFO))
    {
      v6 = v5;
      uint64_t v7 = NSStringFromSelector(sel__setupCloudSyncSupportIfRequired);
      id v8 = (void *)v7;
      v9 = @"NO";
      *(_DWORD *)v11 = 138543874;
      *(void *)&v11[4] = a1;
      *(_WORD *)&v11[12] = 2114;
      if (v4) {
        v9 = @"YES";
      }
      *(void *)&v11[14] = v7;
      *(_WORD *)&v11[22] = 2114;
      v12 = v9;
      _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_INFO, "%{public}@ %{public}@ : %{public}@", v11, 0x20u);
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    if (*(unsigned char *)(a1 + 15) && *(unsigned __int8 *)(a1 + 14) == v4)
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
    }
    else
    {
      *(unsigned char *)(a1 + 15) = 1;
      *(unsigned char *)(a1 + 14) = v4;
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
      if (v4)
      {
        v10 = *(NSObject **)(a1 + 128);
        *(void *)v11 = MEMORY[0x1E4F143A8];
        *(void *)&v11[8] = 3221225472;
        *(void *)&v11[16] = __49__HDCloudSyncCoordinator__enableCloudSyncSupport__block_invoke;
        v12 = (__CFString *)&unk_1E62F3208;
        uint64_t v13 = a1;
        dispatch_async(v10, v11);
      }
      else
      {
        [*(id *)(a1 + 152) disablePeriodicActivities];
      }
    }
  }
}

void __48__HDCloudSyncCoordinator_profileDidBecomeReady___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  int v4 = (id *)(a1 + 32);
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained(v4);
  -[HDCloudSyncCoordinator _syncAllProfilesViaGatedXPCActivityWithCompletion:]((uint64_t)WeakRetained, v5);
}

- (void)_syncAllProfilesViaGatedXPCActivityWithCompletion:(uint64_t)a1
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    id v29 = 0;
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v32 = __Block_byref_object_copy__44;
    v33 = __Block_byref_object_dispose__44;
    id v34 = 0;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 168));
    id v5 = [WeakRetained primaryProfile];
    v6 = [v5 database];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __78__HDCloudSyncCoordinator__computeCoalescedSyncContext_coalescedRequest_error___block_invoke;
    v30[3] = &unk_1E62F82A8;
    v30[4] = buf;
    BOOL v7 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v6 error:&v29 block:v30];

    if (v7)
    {
      id v8 = [HDCloudSyncContext alloc];
      id v9 = [(HDCloudSyncContext *)v8 initForPurpose:0 options:HDOptionsForRequest(*(void **)(*(void *)&buf[8] + 40)) reason:1 xpcActivity:*(void *)(a1 + 80)];
      [v9 setSyncRequest:*(void *)(*(void *)&buf[8] + 40)];
      id v10 = v9;
      id v11 = *(id *)(*(void *)&buf[8] + 40);
    }
    else
    {
      id v10 = 0;
      id v11 = 0;
    }
    _Block_object_dispose(buf, 8);

    id v12 = v10;
    id v13 = v11;
    id v14 = v29;
    uint64_t v15 = v14;
    if (v7)
    {
      v16 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:2];
      uint64_t v21 = MEMORY[0x1E4F143A8];
      uint64_t v22 = 3221225472;
      v23 = __76__HDCloudSyncCoordinator__syncAllProfilesViaGatedXPCActivityWithCompletion___block_invoke;
      id v24 = &unk_1E62F95D0;
      uint64_t v25 = a1;
      id v17 = v13;
      id v26 = v17;
      id v27 = v16;
      id v28 = v3;
      id v18 = v16;
      xpc_object_t v19 = [(id)a1 syncAllProfilesWithContext:v12 completion:&v21];
      objc_msgSend(v18, "addChild:withPendingUnitCount:", v19, 1, v21, v22, v23, v24, v25);
      [(id)a1 notifyObservers:*(void *)(a1 + 88) syncRequestStarted:v17 withProgress:v18];
    }
    else
    {
      if (v14)
      {
        _HKInitializeLogging();
        id v20 = *MEMORY[0x1E4F29FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = a1;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v15;
          _os_log_impl(&dword_1BCB7D000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@: Error fetching computing coalesced sync context %@", buf, 0x16u);
        }
      }
      (*((void (**)(id, void, void))v3 + 2))(v3, 0, 0);
    }
  }
}

void __48__HDCloudSyncCoordinator_profileDidBecomeReady___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  int v4 = (id *)(a1 + 32);
  id v5 = a4;
  id WeakRetained = (id *)objc_loadWeakRetained(v4);
  id v6 = v5;
  if (WeakRetained)
  {
    BOOL v7 = WeakRetained + 21;
    id v8 = objc_loadWeakRetained(WeakRetained + 21);
    id v9 = [v8 behavior];
    char v10 = [v9 supportsSharedSummarySync];

    if (v10)
    {
      id v11 = objc_loadWeakRetained(v7);
      id v12 = [v11 profileManager];
      id v13 = [v12 allProfileIdentifiers];
      id v14 = objc_msgSend(v13, "hk_firstObjectPassingTest:", &__block_literal_global_492);

      if (v14)
      {
        id v15 = objc_loadWeakRetained(v7);
        v16 = [v15 profileManager];
        id v17 = [v16 profileForIdentifier:v14];

        id v18 = [v17 cloudSyncManager];
        xpc_object_t v19 = [v18 sharedSummaryManager];
        *(void *)&long long buf = MEMORY[0x1E4F143A8];
        *((void *)&buf + 1) = 3221225472;
        id v24 = __61__HDCloudSyncCoordinator__pushSharedSummariesWithCompletion___block_invoke_2;
        uint64_t v25 = &unk_1E62F29A0;
        id v26 = v6;
        id v20 = (id)[v19 push:&buf];
      }
      else
      {
        id v17 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 100, @"Unable to push shared summaries. Primary profile not found.");
        (*((void (**)(id, uint64_t, void *))v6 + 2))(v6, 1, v17);
      }
    }
    else
    {
      _HKInitializeLogging();
      uint64_t v21 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = WeakRetained;
        _os_log_impl(&dword_1BCB7D000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@: Device ineligible for pushing shared summaries", (uint8_t *)&buf, 0xCu);
      }
      (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
    }
  }
}

- (void)cloudSyncSupportStatusDidChange
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);
  int v4 = [WeakRetained behavior];
  [v4 resetSupportsCloudSync];

  -[HDCloudSyncCoordinator _setupCloudSyncSupportIfRequired]((uint64_t)self);
}

uint64_t __49__HDCloudSyncCoordinator__enableCloudSyncSupport__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 152) setupPeriodicActivities];
}

- (void)dealloc
{
  observers = self->_observers;
  self->_observers = 0;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);
  id v5 = [WeakRetained primaryProfile];
  id v6 = [v5 database];
  [v6 removeDatabaseJournalMergeObserver:self journalType:2];

  BOOL v7 = [MEMORY[0x1E4F65CF8] sharedDiagnosticManager];
  [v7 removeObject:self];

  v8.receiver = self;
  v8.super_class = (Class)HDCloudSyncCoordinator;
  [(HDCloudSyncCoordinator *)&v8 dealloc];
}

- (double)nextCloudKitOperationDelay
{
  double Current = CFAbsoluteTimeGetCurrent();
  os_unfair_lock_lock(&self->_lock);
  double v4 = fmax(self->_lock_nextAvailableOperationStartTime - Current, 0.0);
  os_unfair_lock_unlock(&self->_lock);
  return v4;
}

- (void)delayNextCloudKitOperation:(double)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  double Current = CFAbsoluteTimeGetCurrent();
  double lock_nextAvailableOperationStartTime = Current + a3;
  os_unfair_lock_lock(&self->_lock);
  if (Current + a3 < self->_lock_nextAvailableOperationStartTime) {
    double lock_nextAvailableOperationStartTime = self->_lock_nextAvailableOperationStartTime;
  }
  self->_double lock_nextAvailableOperationStartTime = lock_nextAvailableOperationStartTime;
  os_unfair_lock_unlock(&self->_lock);
  _HKInitializeLogging();
  BOOL v7 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    objc_super v8 = (objc_class *)MEMORY[0x1E4F1C9C8];
    id v9 = v7;
    char v10 = (void *)[[v8 alloc] initWithTimeIntervalSinceReferenceDate:lock_nextAvailableOperationStartTime];
    int v11 = 138544130;
    id v12 = self;
    __int16 v13 = 2048;
    double v14 = a3;
    __int16 v15 = 2048;
    double v16 = lock_nextAvailableOperationStartTime - Current;
    __int16 v17 = 2114;
    id v18 = v10;
    _os_log_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: CloudKit operation delay of %0.2lfs requested; next available operation start is in %0.2lfs at %{public}@",
      (uint8_t *)&v11,
      0x2Au);
  }
}

- (BOOL)scheduleSyncForAllProfilesViaGatedXPCActivity:(BOOL)a3 context:(id)a4 reason:(id)a5 error:(id *)a6
{
  BOOL v7 = a3;
  id v14 = 0;
  char v9 = -[HDCloudSyncCoordinator _setupSyncRequestWithContext:reason:error:]((id *)&self->super.isa, a4, a5, &v14);
  id v10 = v14;
  int v11 = v10;
  if (v9)
  {
    -[HDCloudSyncCoordinator _syncAllProfilesViaGatedXPCActivity:completion:]((uint64_t)self, v7, &__block_literal_global_49);
  }
  else
  {
    id v12 = v10;
    if (v12)
    {
      if (a6) {
        *a6 = v12;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
  return v9;
}

- (uint64_t)_setupSyncRequestWithContext:(void *)a3 reason:(void *)a4 error:
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  if (!a1)
  {
    uint64_t v33 = 0;
    goto LABEL_38;
  }
  id v9 = v7;
  if ([v9 reason] == 1)
  {
    id v10 = [a1[19] platformConfiguration];
    char v11 = [v10 isConfiguredForLiteSync];

    if ((v11 & 1) == 0)
    {
      _HKInitializeLogging();
      uint64_t v22 = (void *)*MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        v42 = v22;
        [v9 reason];
        v43 = HKCloudSyncReasonToString();
        *(_DWORD *)long long buf = 138543618;
        v48 = a1;
        __int16 v49 = 2114;
        id v50 = v43;
        _os_log_error_impl(&dword_1BCB7D000, v42, OS_LOG_TYPE_ERROR, "%{public}@: Incoming sync request with reason: %{public}@ is disabled because no iPad is present in context", buf, 0x16u);
      }
      id v20 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v21 = @"Sync requests disabled because no iPad is present in context";
      goto LABEL_13;
    }
  }
  id WeakRetained = objc_loadWeakRetained(a1 + 21);
  __int16 v13 = [WeakRetained behavior];
  char v14 = [v13 supportsBackgroundSyncRequests];

  if ((v14 & 1) == 0)
  {
    _HKInitializeLogging();
    uint64_t v19 = (void *)*MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      v40 = v19;
      [v9 reason];
      v41 = HKCloudSyncReasonToString();
      *(_DWORD *)long long buf = 138543618;
      v48 = a1;
      __int16 v49 = 2114;
      id v50 = v41;
      _os_log_error_impl(&dword_1BCB7D000, v40, OS_LOG_TYPE_ERROR, "%{public}@: Incoming sync request with reason: %{public}@. Sync requests disabled by behavior", buf, 0x16u);
    }
    id v20 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v21 = @"Sync requests disabled by behavior";
LABEL_13:
    objc_msgSend(v20, "hk_error:description:", 111, v21);
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    id v17 = v23;
    if (v23) {
      id v24 = v23;
    }

    goto LABEL_16;
  }
  id v46 = 0;
  char v15 = [a1 canPerformCloudSyncWithError:&v46];
  id v16 = v46;
  if (v15)
  {
    id v17 = 0;
    char v18 = 1;
    goto LABEL_18;
  }
  _HKInitializeLogging();
  v37 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543874;
    v48 = a1;
    __int16 v49 = 2114;
    id v50 = v9;
    __int16 v51 = 2114;
    id v52 = v16;
    _os_log_impl(&dword_1BCB7D000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ \n Sync requested on client gated activity, but is not permitted. %{public}@", buf, 0x20u);
  }
  id v38 = v16;
  if (v38)
  {
    id v17 = v38;
    id v16 = v17;
    goto LABEL_17;
  }
  id v17 = 0;
LABEL_16:
  id v16 = 0;
LABEL_17:

  char v18 = 0;
LABEL_18:

  id v25 = v17;
  id v26 = v25;
  if ((v18 & 1) == 0)
  {
    id v34 = v25;
    id v32 = v34;
    if (v34)
    {
      if (a4)
      {
        id v32 = v34;
        *a4 = v32;
      }
      else
      {
        _HKLogDroppedError();
      }
    }
    goto LABEL_36;
  }
  v44 = a4;
  uint64_t v27 = [v9 syncRequest];
  id v28 = [MEMORY[0x1E4F1C9C8] date];
  id v29 = objc_loadWeakRetained(a1 + 21);
  v30 = [v29 primaryProfile];
  id v45 = v26;
  BOOL v31 = +[HDCachedSyncRequestEntity insertSyncRequest:v27 reason:v8 date:v28 profile:v30 error:&v45];
  id v32 = v45;

  if (!v31)
  {
    _HKInitializeLogging();
    uint64_t v35 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543618;
      v48 = a1;
      __int16 v49 = 2114;
      id v50 = v32;
      _os_log_error_impl(&dword_1BCB7D000, v35, OS_LOG_TYPE_ERROR, "%{public}@: Error persisting sync request %{public}@", buf, 0x16u);
    }
    id v36 = v32;
    id v32 = v36;
    if (v36)
    {
      if (v44)
      {
        id v32 = v36;
        void *v44 = v32;
      }
      else
      {
        _HKLogDroppedError();
      }
    }
LABEL_36:

    uint64_t v33 = 0;
    goto LABEL_37;
  }
  uint64_t v33 = 1;
LABEL_37:

LABEL_38:
  return v33;
}

- (void)_syncAllProfilesViaGatedXPCActivity:(void *)a3 completion:
{
  id v5 = a3;
  id v6 = v5;
  if (a1)
  {
    id v7 = *(void **)(a1 + 80);
    if (a2)
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __73__HDCloudSyncCoordinator__syncAllProfilesViaGatedXPCActivity_completion___block_invoke;
      v11[3] = &unk_1E62F94E0;
      id v8 = &v12;
      id v12 = v5;
      [v7 requestRunWithMaximumDelay:v11 completion:1800.0];
    }
    else
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __73__HDCloudSyncCoordinator__syncAllProfilesViaGatedXPCActivity_completion___block_invoke_2;
      v9[3] = &unk_1E62F94E0;
      id v8 = &v10;
      id v10 = v5;
      [v7 runUngatedWithCompletion:v9];
    }
  }
}

- (void)syncAllProfilesViaGatedXPCActivity:(BOOL)a3 context:(id)a4 reason:(id)a5 completion:(id)a6
{
  BOOL v8 = a3;
  id v12 = 0;
  id v10 = a6;
  LOBYTE(a4) = -[HDCloudSyncCoordinator _setupSyncRequestWithContext:reason:error:]((id *)&self->super.isa, a4, a5, &v12);
  id v11 = v12;
  if (a4) {
    -[HDCloudSyncCoordinator _syncAllProfilesViaGatedXPCActivity:completion:]((uint64_t)self, v8, v10);
  }
  else {
    (*((void (**)(id, void, id))v10 + 2))(v10, 0, v11);
  }
}

uint64_t __73__HDCloudSyncCoordinator__syncAllProfilesViaGatedXPCActivity_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __73__HDCloudSyncCoordinator__syncAllProfilesViaGatedXPCActivity_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)syncAllProfilesWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  char v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy__44;
  uint64_t v21 = __Block_byref_object_dispose__44;
  id v22 = 0;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __64__HDCloudSyncCoordinator_syncAllProfilesWithContext_completion___block_invoke;
  v13[3] = &unk_1E62F9508;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v16 = &v17;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(queue, v13);
  id v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);

  return v11;
}

void __64__HDCloudSyncCoordinator_syncAllProfilesWithContext_completion___block_invoke(uint64_t a1)
{
  v62[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(a1 + 48);
  id v4 = *(id *)(a1 + 40);
  id v5 = v3;
  if (v2)
  {
    [*(id *)(v2 + 160) checkLastSyncDate];
    id v52 = 0;
    char v6 = [(id)v2 canPerformCloudSyncWithError:&v52];
    id v7 = v52;
    BOOL v8 = v7;
    if (v6)
    {
      id v45 = v7;
      dispatch_assert_queue_V2(*(dispatch_queue_t *)(v2 + 128));
      id v9 = -[HDCloudSyncCoordinator _primaryProfile](v2);
      uint64_t v10 = HDCloudSyncRestorePhaseSyncCompleteStartDate(v9);
      uint64_t v11 = [*(id *)(v2 + 160) lastSuccessfulPullDate];
      uint64_t v12 = v11 | v10;

      if (!v12)
      {
        __int16 v13 = [MEMORY[0x1E4F1C9C8] now];
        HDSetCloudSyncRestorePhaseSyncCompleteStartDate(v13, v9);
      }
      id v14 = kHDEventNameCloudSync;
      v61[0] = @"reason";
      id v15 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "reason"));
      v61[1] = @"options";
      v62[0] = v15;
      id v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "options"));
      v62[1] = v16;
      uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v62 forKeys:v61 count:2];
      HDPowerLog(v14, v17, 1);

      char v18 = NSString;
      uint64_t v19 = [MEMORY[0x1E4F1C9C8] date];
      id v20 = HKDiagnosticStringFromDate();
      uint64_t v21 = [v18 stringWithFormat:@"%@, date=%@", v4, v20];
      id v22 = *(void **)(v2 + 48);
      *(void *)(v2 + 48) = v21;

      _HKInitializeLogging();
      id v23 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v24 = *(void *)(v2 + 48);
        *(_DWORD *)long long buf = 138543618;
        *(void *)&uint8_t buf[4] = v2;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v24;
        _os_log_impl(&dword_1BCB7D000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@: start syncAllProfiles: %{public}@", buf, 0x16u);
      }
      id v25 = _HKLogPersistedSignposts();
      os_signpost_id_t v26 = _HKLogSignpostIDGenerate();

      _HKInitializeLogging();
      uint64_t v27 = _HKLogPersistedSignposts();
      BOOL v28 = os_signpost_enabled(v27);

      if (v28)
      {
        id v29 = _HKLogPersistedSignposts();
        v30 = v29;
        if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
        {
          *(_DWORD *)long long buf = 138543362;
          *(void *)&uint8_t buf[4] = v4;
          _os_signpost_emit_with_name_impl(&dword_1BCB7D000, v30, OS_SIGNPOST_INTERVAL_BEGIN, v26, "cloud-sync", " enableTelemetry=YES %{public}@", buf, 0xCu);
        }
      }
      BOOL v31 = +[HKDaemonTransaction transactionWithOwner:v2 activityName:@"Sync"];
      uint64_t v33 = (id *)(v2 + 32);
      uint64_t v32 = *(void *)(v2 + 32);
      *(void *)long long buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __71__HDCloudSyncCoordinator__queue_syncAllProfilesWithContext_completion___block_invoke;
      v54 = &unk_1E62F9558;
      uint64_t v55 = v2;
      BOOL v60 = v32 == 0;
      id v47 = v4;
      id v34 = v4;
      id v56 = v34;
      os_signpost_id_t v59 = v26;
      id v35 = v31;
      id v57 = v35;
      id v46 = v5;
      id v58 = v5;
      id v36 = _Block_copy(buf);
      id WeakRetained = objc_loadWeakRetained((id *)(v2 + 168));
      id v38 = [WeakRetained profileManager];
      v39 = [v38 allProfileIdentifiers];

      v48[0] = MEMORY[0x1E4F143A8];
      v48[1] = 3221225472;
      v48[2] = __71__HDCloudSyncCoordinator__queue_syncAllProfilesWithContext_completion___block_invoke_377;
      v48[3] = &unk_1E62F9580;
      id v40 = v36;
      id v51 = v40;
      v48[4] = v2;
      id v41 = v39;
      id v49 = v41;
      id v50 = v34;
      uint64_t v2 = -[HDCloudSyncCoordinator _queue_syncProfilesWithIdentifiers:context:completion:](v2, v41, v50, v48);
      if (!v32) {
        objc_storeStrong(v33, (id)v2);
      }

      id v5 = v46;
      id v4 = v47;
      BOOL v8 = v45;
    }
    else
    {
      _HKInitializeLogging();
      v42 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138543618;
        *(void *)&uint8_t buf[4] = v2;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v8;
        _os_log_impl(&dword_1BCB7D000, v42, OS_LOG_TYPE_DEFAULT, "%{public}@: Cloud Sync triggered, but is not permitted. %{public}@", buf, 0x16u);
      }
      (*((void (**)(id, void, void *))v5 + 2))(v5, 0, v8);
      uint64_t v2 = objc_msgSend(MEMORY[0x1E4F28F90], "hk_finishedDiscreteProgressWithTotalUnitCount:", 1);
    }
  }
  uint64_t v43 = *(void *)(*(void *)(a1 + 56) + 8);
  v44 = *(void **)(v43 + 40);
  *(void *)(v43 + 40) = v2;
}

void __71__HDCloudSyncCoordinator__queue_syncAllProfilesWithContext_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(NSObject **)(v6 + 128);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__HDCloudSyncCoordinator__queue_syncAllProfilesWithContext_completion___block_invoke_2;
  block[3] = &unk_1E62F9530;
  char v16 = *(unsigned char *)(a1 + 72);
  block[4] = v6;
  id v8 = *(id *)(a1 + 40);
  char v17 = a2;
  id v11 = v8;
  id v12 = v5;
  uint64_t v15 = *(void *)(a1 + 64);
  id v13 = *(id *)(a1 + 48);
  id v14 = *(id *)(a1 + 56);
  id v9 = v5;
  dispatch_async(v7, block);
}

void __71__HDCloudSyncCoordinator__queue_syncAllProfilesWithContext_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 80))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    id v3 = *(void **)(v2 + 32);
    *(void *)(v2 + 32) = 0;

    id v4 = *(id *)(*(void *)(a1 + 32) + 40);
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = 0;
  }
  else
  {
    id v4 = 0;
  }
  id v7 = NSString;
  uint64_t v8 = *(void *)(a1 + 40);
  id v9 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v10 = HKDiagnosticStringFromDate();
  id v11 = (void *)v10;
  id v12 = @"YES";
  if (!*(unsigned char *)(a1 + 81)) {
    id v12 = @"NO";
  }
  uint64_t v13 = [v7 stringWithFormat:@"%@, date=%@, success=%@, error=%@", v8, v10, v12, *(void *)(a1 + 48)];
  uint64_t v14 = *(void *)(a1 + 32);
  uint64_t v15 = *(void **)(v14 + 56);
  *(void *)(v14 + 56) = v13;

  _HKInitializeLogging();
  char v16 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = *(void *)(a1 + 32);
    uint64_t v18 = *(void *)(v17 + 56);
    *(_DWORD *)long long buf = 138543618;
    uint64_t v43 = v17;
    __int16 v44 = 2114;
    uint64_t v45 = v18;
    _os_log_impl(&dword_1BCB7D000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: finish syncAllProfiles: %{public}@", buf, 0x16u);
  }
  uint64_t v19 = kHDEventNameCloudSync;
  v40[0] = @"reason";
  id v20 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "reason"));
  v41[0] = v20;
  v40[1] = @"options";
  uint64_t v21 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "options"));
  v41[1] = v21;
  v40[2] = @"result";
  id v22 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 81)];
  v41[2] = v22;
  id v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:3];
  HDPowerLog(v19, v23, 3);

  _HKInitializeLogging();
  uint64_t v24 = _HKLogPersistedSignposts();
  LODWORD(v19) = os_signpost_enabled(v24);

  if (v19)
  {
    id v25 = _HKLogPersistedSignposts();
    os_signpost_id_t v26 = v25;
    os_signpost_id_t v27 = *(void *)(a1 + 72);
    if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
    {
      uint64_t v28 = *(void *)(a1 + 40);
      int v29 = *(unsigned __int8 *)(a1 + 81);
      *(_DWORD *)long long buf = 138543618;
      uint64_t v43 = v28;
      __int16 v44 = 1024;
      LODWORD(v45) = v29;
      _os_signpost_emit_with_name_impl(&dword_1BCB7D000, v26, OS_SIGNPOST_INTERVAL_END, v27, "cloud-sync", " enableTelemetry=YES %{public}@, success=%{BOOL}d", buf, 0x12u);
    }
  }
  [*(id *)(a1 + 56) invalidate];
  [*(id *)(*(void *)(a1 + 32) + 152) updatePeriodicActivitiesWithSyncSuccess:*(unsigned __int8 *)(a1 + 81)];
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v30 = v4;
  uint64_t v31 = [v30 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v36;
    do
    {
      uint64_t v34 = 0;
      do
      {
        if (*(void *)v36 != v33) {
          objc_enumerationMutation(v30);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v35 + 1) + 8 * v34++) + 16))();
      }
      while (v32 != v34);
      uint64_t v32 = [v30 countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v32);
  }
}

void __71__HDCloudSyncCoordinator__queue_syncAllProfilesWithContext_completion___block_invoke_377(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 168));
    id v7 = [WeakRetained profileManager];
    uint64_t v8 = [v7 allProfileIdentifiers];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __71__HDCloudSyncCoordinator__queue_syncAllProfilesWithContext_completion___block_invoke_2_378;
    v16[3] = &unk_1E62F5910;
    id v17 = *(id *)(a1 + 40);
    id v9 = objc_msgSend(v8, "hk_filter:", v16);

    if ([v9 count])
    {
      uint64_t v10 = *(void *)(a1 + 32);
      id v11 = *(NSObject **)(v10 + 128);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __71__HDCloudSyncCoordinator__queue_syncAllProfilesWithContext_completion___block_invoke_3;
      block[3] = &unk_1E62F2F48;
      block[4] = v10;
      id v13 = v9;
      id v14 = *(id *)(a1 + 48);
      id v15 = *(id *)(a1 + 56);
      dispatch_async(v11, block);
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

uint64_t __71__HDCloudSyncCoordinator__queue_syncAllProfilesWithContext_completion___block_invoke_2_378(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2] ^ 1;
}

id __71__HDCloudSyncCoordinator__queue_syncAllProfilesWithContext_completion___block_invoke_3(uint64_t a1)
{
  return -[HDCloudSyncCoordinator _queue_syncProfilesWithIdentifiers:context:completion:](*(void *)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48), *(void **)(a1 + 56));
}

- (id)_queue_syncProfilesWithIdentifiers:(void *)a3 context:(void *)a4 completion:
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v33 = a3;
  id v8 = a4;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 128));
    if ([v7 count])
    {
      id v9 = objc_alloc_init(MEMORY[0x1E4F65D90]);
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __80__HDCloudSyncCoordinator__queue_syncProfilesWithIdentifiers_context_completion___block_invoke;
      v42[3] = &unk_1E62F95A8;
      int v29 = (void *)a1;
      v42[4] = a1;
      id v26 = v8;
      id v43 = v8;
      [v9 setDidFinish:v42];
      _HKInitializeLogging();
      uint64_t v10 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138543618;
        id v46 = v7;
        __int16 v47 = 2114;
        id v48 = v33;
        _os_log_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_DEFAULT, "Scheduling cloud sync for profiles %{public}@: %{public}@", buf, 0x16u);
      }
      objc_msgSend(MEMORY[0x1E4F28F90], "discreteProgressWithTotalUnitCount:", objc_msgSend(v7, "count"));
      id v32 = (id)objc_claimAutoreleasedReturnValue();
      [v9 beginTask];
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      id v27 = v7;
      id obj = v7;
      uint64_t v11 = [obj countByEnumeratingWithState:&v38 objects:v44 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v30 = *(void *)v39;
        id location = (id *)(a1 + 168);
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v39 != v30) {
              objc_enumerationMutation(obj);
            }
            id v14 = *(void **)(*((void *)&v38 + 1) + 8 * i);
            [v9 beginTask];
            v34[0] = MEMORY[0x1E4F143A8];
            v34[1] = 3221225472;
            long long v35 = __80__HDCloudSyncCoordinator__queue_syncProfilesWithIdentifiers_context_completion___block_invoke_382;
            long long v36 = &unk_1E62F2978;
            id v37 = v9;
            id v15 = v14;
            id v16 = v33;
            id v17 = v34;
            if (!v15)
            {
              uint64_t v24 = [MEMORY[0x1E4F28B00] currentHandler];
              [v24 handleFailureInMethod:sel__syncProfile_context_completion_, v29, @"HDCloudSyncCoordinator.m", 463, @"Invalid parameter not satisfying: %@", @"profileIdentifier != nil" object file lineNumber description];
            }
            id WeakRetained = objc_loadWeakRetained(location);
            uint64_t v19 = [WeakRetained profileManager];
            id v20 = [v19 profileForIdentifier:v15];

            if (v20 && ([v29 shouldSyncProfile:v20] & 1) != 0)
            {
              uint64_t v21 = [v20 cloudSyncManager];
              id v22 = v21;
              if (v21)
              {
                [v21 syncWithContext:v16 completion:v17];
              }
              else
              {
                ((void (*)(void *, uint64_t, void))v35)(v17, 1, 0);
                objc_msgSend(MEMORY[0x1E4F28F90], "hk_finishedDiscreteProgressWithTotalUnitCount:", 1);
              id v23 = };
            }
            else
            {
              ((void (*)(void *, uint64_t, void))v35)(v17, 1, 0);
              id v23 = objc_msgSend(MEMORY[0x1E4F28F90], "hk_finishedDiscreteProgressWithTotalUnitCount:", 1);
            }

            [v32 addChild:v23 withPendingUnitCount:1];
          }
          uint64_t v12 = [obj countByEnumeratingWithState:&v38 objects:v44 count:16];
        }
        while (v12);
      }

      [v9 finishTask];
      id v8 = v26;
      id v7 = v27;
    }
    else
    {
      (*((void (**)(id, uint64_t, void))v8 + 2))(v8, 1, 0);
      objc_msgSend(MEMORY[0x1E4F28F90], "hk_finishedDiscreteProgressWithTotalUnitCount:", 1);
      id v32 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v32 = 0;
  }

  return v32;
}

void __80__HDCloudSyncCoordinator__queue_syncProfilesWithIdentifiers_context_completion___block_invoke(uint64_t a1, uint64_t a2, char a3, void *a4)
{
  id v6 = a4;
  id v7 = *(void **)(*(void *)(a1 + 32) + 160);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __80__HDCloudSyncCoordinator__queue_syncProfilesWithIdentifiers_context_completion___block_invoke_2;
  v10[3] = &unk_1E62F61A8;
  char v13 = a3;
  id v8 = *(id *)(a1 + 40);
  id v11 = v6;
  id v12 = v8;
  id v9 = v6;
  [v7 updateCachedLastSyncDatesWithCompletion:v10];
}

void __80__HDCloudSyncCoordinator__queue_syncProfilesWithIdentifiers_context_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v2 = *(void (**)(uint64_t, uint64_t, void))(v1 + 16);
    uint64_t v3 = *(void *)(a1 + 40);
    v2(v3, 1, 0);
  }
  else
  {
    id v4 = [*(id *)(a1 + 32) firstObject];
    (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v4);
  }
}

uint64_t __80__HDCloudSyncCoordinator__queue_syncProfilesWithIdentifiers_context_completion___block_invoke_382(uint64_t a1, int a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (a2) {
    return [v2 finishTask];
  }
  else {
    return objc_msgSend(v2, "failTaskWithError:");
  }
}

BOOL __78__HDCloudSyncCoordinator__computeCoalescedSyncContext_coalescedRequest_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  id obj = *(id *)(v6 + 40);
  BOOL v7 = +[HDCachedSyncRequestEntity fetchCoalescedSyncRequest:&obj transaction:v5 error:a3];
  objc_storeStrong((id *)(v6 + 40), obj);
  BOOL v8 = v7
    && +[HDCachedSyncRequestEntity markPendingRequestsAsInProgress:v5 error:a3];

  return v8;
}

void __76__HDCloudSyncCoordinator__syncAllProfilesViaGatedXPCActivityWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = v5[11];
  id v8 = a3;
  id v9 = [v5 mergeCloudSyncJournalsAndNotifyObservers:v7 syncRequestCompleted:v6 success:a2 error:v8];
  [*(id *)(a1 + 48) addChild:v9 withPendingUnitCount:1];
  [*(id *)(a1 + 32) clearClientSyncRequestsQueue];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)clearClientSyncRequestsQueue
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);
  id v4 = [WeakRetained primaryProfile];
  id v10 = 0;
  BOOL v5 = +[HDCachedSyncRequestEntity clearInProgressSyncRequests:v4 error:&v10];
  id v6 = v10;

  uint64_t v7 = (os_log_t *)MEMORY[0x1E4F29FA8];
  if (!v5)
  {
    _HKInitializeLogging();
    id v8 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543618;
      id v12 = self;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_error_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Error clearing all in progress sync requests %@", buf, 0x16u);
    }
  }
  _HKInitializeLogging();
  id v9 = *v7;
  if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    id v12 = self;
    _os_log_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Clearing client sync request queue", buf, 0xCu);
  }
}

- (BOOL)markAllClientSyncRequestsAsInProgress:(id *)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);
  BOOL v5 = [WeakRetained primaryProfile];
  id v6 = [v5 database];
  LOBYTE(a3) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v6 error:a3 block:&__block_literal_global_399];

  return (char)a3;
}

BOOL __64__HDCloudSyncCoordinator_markAllClientSyncRequestsAsInProgress___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[HDCachedSyncRequestEntity markPendingRequestsAsInProgress:a2 error:a3];
}

- (void)prepareAllProfilesForPeriodicSyncAndRestore
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);
  uint64_t v3 = [WeakRetained profileManager];

  id v4 = [v3 allProfileIdentifiers];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [v3 profileForIdentifier:*(void *)(*((void *)&v11 + 1) + 8 * v8)];
        id v10 = [v9 cloudSyncManager];
        [v10 prepareForPeriodicSync];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (id)resetAllProfilesWithContext:(id)a3 completion:(id)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v33 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F65D90]);
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __65__HDCloudSyncCoordinator_resetAllProfilesWithContext_completion___block_invoke;
  v43[3] = &unk_1E62F4EB8;
  id v28 = v6;
  id v44 = v28;
  [v7 setDidFinish:v43];
  _HKInitializeLogging();
  uint64_t v8 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543618;
    __int16 v47 = self;
    __int16 v48 = 2114;
    id v49 = v33;
    _os_log_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Beginning cloud reset for all profiles: %{public}@", buf, 0x16u);
  }
  id location = (id *)&self->_daemon;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);
  id v10 = [WeakRetained profileManager];

  id v27 = v10;
  long long v11 = [v10 allProfileIdentifiers];
  [v7 beginTask];
  objc_msgSend(MEMORY[0x1E4F28F90], "discreteProgressWithTotalUnitCount:", objc_msgSend(v11, "count"));
  id v32 = (id)objc_claimAutoreleasedReturnValue();
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = v11;
  uint64_t v34 = [obj countByEnumeratingWithState:&v39 objects:v45 count:16];
  if (v34)
  {
    uint64_t v30 = *(void *)v40;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v40 != v30) {
          objc_enumerationMutation(obj);
        }
        long long v13 = *(void **)(*((void *)&v39 + 1) + 8 * v12);
        [v7 beginTask];
        v35[0] = MEMORY[0x1E4F143A8];
        v35[1] = 3221225472;
        long long v36 = __65__HDCloudSyncCoordinator_resetAllProfilesWithContext_completion___block_invoke_400;
        id v37 = &unk_1E62F2978;
        id v38 = v7;
        id v14 = v13;
        id v15 = v33;
        uint64_t v16 = v35;
        if (self)
        {
          if (!v14)
          {
            uint64_t v24 = [MEMORY[0x1E4F28B00] currentHandler];
            [v24 handleFailureInMethod:sel__resetProfile_context_completion_, self, @"HDCloudSyncCoordinator.m", 637, @"Invalid parameter not satisfying: %@", @"profileIdentifier != nil" object file lineNumber description];
          }
          id v17 = self;
          id v18 = objc_loadWeakRetained(location);
          uint64_t v19 = [v18 profileManager];
          id v20 = [v19 profileForIdentifier:v14];

          if (v20)
          {
            self = v17;
            if ([(HDCloudSyncCoordinator *)v17 shouldSyncProfile:v20])
            {
              uint64_t v21 = [v20 cloudSyncManager];
              id v22 = v21;
              if (v21)
              {
                [v21 resetWithContext:v15 completion:v16];
              }
              else
              {
                ((void (*)(void *, uint64_t, void))v36)(v16, 1, 0);
                objc_msgSend(MEMORY[0x1E4F28F90], "hk_finishedDiscreteProgressWithTotalUnitCount:", 1);
              id v23 = };

LABEL_19:
              self = v17;
            }
            else
            {
              ((void (*)(void *, uint64_t, void))v36)(v16, 1, 0);
              id v23 = objc_msgSend(MEMORY[0x1E4F28F90], "hk_finishedDiscreteProgressWithTotalUnitCount:", 1);
            }

            goto LABEL_21;
          }
          ((void (*)(void *, uint64_t, void))v36)(v16, 1, 0);
          id v23 = objc_msgSend(MEMORY[0x1E4F28F90], "hk_finishedDiscreteProgressWithTotalUnitCount:", 1);
          goto LABEL_19;
        }
        id v23 = 0;
LABEL_21:

        [v32 addChild:v23 withPendingUnitCount:1];
        ++v12;
      }
      while (v34 != v12);
      uint64_t v25 = [obj countByEnumeratingWithState:&v39 objects:v45 count:16];
      uint64_t v34 = v25;
    }
    while (v25);
  }

  [v7 finishTask];

  return v32;
}

void __65__HDCloudSyncCoordinator_resetAllProfilesWithContext_completion___block_invoke(uint64_t a1, uint64_t a2, int a3, void *a4)
{
  uint64_t v4 = *(void *)(a1 + 32);
  if (a3)
  {
    uint64_t v5 = *(void (**)(uint64_t, uint64_t, void))(v4 + 16);
    uint64_t v6 = *(void *)(a1 + 32);
    v5(v6, 1, 0);
  }
  else
  {
    id v7 = [a4 firstObject];
    (*(void (**)(uint64_t, void, id))(v4 + 16))(v4, 0, v7);
  }
}

uint64_t __65__HDCloudSyncCoordinator_resetAllProfilesWithContext_completion___block_invoke_400(uint64_t a1, int a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (a2) {
    return [v2 finishTask];
  }
  else {
    return objc_msgSend(v2, "failTaskWithError:");
  }
}

- (BOOL)shouldSyncProfile:(id)a3
{
  return 1;
}

- (id)fetchCloudDescriptionWithContext:(id)a3 completion:(id)a4
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v40 = a3;
  id v5 = a4;
  _HKInitializeLogging();
  uint64_t v6 = (os_log_t *)MEMORY[0x1E4F29FA8];
  id v7 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    *(void *)&uint8_t buf[4] = v40;
    _os_log_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_DEFAULT, "Scheduling fetch of cloud description for all profiles with context %{public}@", buf, 0xCu);
  }
  v56[0] = 0;
  v56[1] = v56;
  v56[2] = 0x2810000000;
  v56[3] = &unk_1BD44B655;
  int v57 = 0;
  _HKInitializeLogging();
  uint64_t v8 = *v6;
  if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543618;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v40;
    _os_log_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Beginning fetch of cloud description for all profiles with context %{public}@", buf, 0x16u);
  }
  long long v35 = [(HDCloudSyncAccountProvider *)self->_accountProvider getPersistedAccountInfo];
  id v9 = objc_alloc(MEMORY[0x1E4F28E78]);
  [v35 accountPartition];
  id v10 = CKStringFromPartition();
  if ([v35 hasValidCredentials]) {
    long long v11 = @"YES";
  }
  else {
    long long v11 = @"no";
  }
  [v35 accountStatus];
  uint64_t v12 = CKStringFromAccountStatus();
  [v35 deviceToDeviceEncryptionAvailability];
  long long v13 = CKStringFromDeviceToDeviceEncryptionStatus();
  id v14 = (void *)[v9 initWithFormat:@"%@ Account (Credentials: %@, Status: %@, Encryption: %@)\n", v10, v11, v12, v13];

  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  BOOL v60 = __Block_byref_object_copy__44;
  v61 = __Block_byref_object_dispose__44;
  id v62 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v15 = objc_alloc_init(MEMORY[0x1E4F65D90]);
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __70__HDCloudSyncCoordinator_fetchCloudDescriptionWithContext_completion___block_invoke;
  v51[3] = &unk_1E62F95F8;
  v54 = v56;
  uint64_t v55 = buf;
  id v32 = v5;
  id v53 = v32;
  id v33 = v14;
  id v52 = v33;
  [v15 setDidFinish:v51];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);
  uint64_t v34 = [WeakRetained profileManager];

  id v17 = [v34 allProfileIdentifiers];
  objc_msgSend(MEMORY[0x1E4F28F90], "discreteProgressWithTotalUnitCount:", objc_msgSend(v17, "count"));
  id v39 = (id)objc_claimAutoreleasedReturnValue();
  [v15 beginTask];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id obj = v17;
  uint64_t v18 = [obj countByEnumeratingWithState:&v47 objects:v58 count:16];
  if (v18)
  {
    uint64_t v38 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v48 != v38) {
          objc_enumerationMutation(obj);
        }
        id v20 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        [v15 beginTask];
        v41[0] = MEMORY[0x1E4F143A8];
        v41[1] = 3221225472;
        long long v42 = __70__HDCloudSyncCoordinator_fetchCloudDescriptionWithContext_completion___block_invoke_2;
        id v43 = &unk_1E62F8348;
        uint64_t v45 = v56;
        id v46 = buf;
        id v44 = v15;
        id v21 = v20;
        id v22 = v40;
        id v23 = v41;
        if (!v21)
        {
          uint64_t v30 = [MEMORY[0x1E4F28B00] currentHandler];
          [v30 handleFailureInMethod:sel__fetchDescriptionForProfile_context_completion_, self, @"HDCloudSyncCoordinator.m", 723, @"Invalid parameter not satisfying: %@", @"profileIdentifier != nil" object file lineNumber description];
        }
        id v24 = objc_loadWeakRetained((id *)&self->_daemon);
        uint64_t v25 = [v24 profileManager];
        id v26 = [v25 profileForIdentifier:v21];

        if (v26 && [(HDCloudSyncCoordinator *)self shouldSyncProfile:v26])
        {
          id v27 = [v26 cloudSyncManager];
          id v28 = v27;
          if (v27)
          {
            [v27 fetchDescriptionWithContext:v22 completion:v23];
          }
          else
          {
            ((void (*)(void *, void, void))v42)(v23, 0, 0);
            objc_msgSend(MEMORY[0x1E4F28F90], "hk_finishedDiscreteProgressWithTotalUnitCount:", 1);
          int v29 = };
        }
        else
        {
          ((void (*)(void *, void, void))v42)(v23, 0, 0);
          int v29 = objc_msgSend(MEMORY[0x1E4F28F90], "hk_finishedDiscreteProgressWithTotalUnitCount:", 1);
        }

        [v39 addChild:v29 withPendingUnitCount:1];
      }
      uint64_t v18 = [obj countByEnumeratingWithState:&v47 objects:v58 count:16];
    }
    while (v18);
  }

  [v15 finishTask];
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(v56, 8);

  return v39;
}

void __70__HDCloudSyncCoordinator_fetchCloudDescriptionWithContext_completion___block_invoke(void *a1, uint64_t a2, int a3, void *a4)
{
  if (a3)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1[6] + 8) + 32));
    id v10 = (id)[*(id *)(*(void *)(a1[7] + 8) + 40) copy];
    uint64_t v5 = *(void *)(a1[7] + 8);
    uint64_t v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = 0;

    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1[6] + 8) + 32));
    id v7 = *(void (**)(void))(a1[5] + 16);
  }
  else
  {
    uint64_t v8 = a1[5];
    uint64_t v9 = [a4 firstObject];
    id v7 = *(void (**)(void))(v8 + 16);
    id v10 = (id)v9;
  }
  v7();
}

uint64_t __70__HDCloudSyncCoordinator_fetchCloudDescriptionWithContext_completion___block_invoke_2(void *a1, void *a2)
{
  if (a2)
  {
    uint64_t v3 = (os_unfair_lock_s *)(*(void *)(a1[5] + 8) + 32);
    id v4 = a2;
    os_unfair_lock_lock(v3);
    [*(id *)(*(void *)(a1[6] + 8) + 40) addObjectsFromArray:v4];

    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1[5] + 8) + 32));
  }
  uint64_t v5 = (void *)a1[4];

  return [v5 finishTask];
}

- (BOOL)hasActiveSyncTask
{
  return [(HDCloudSyncManagerTaskQueue *)self->_syncTaskQueue hasActiveTask];
}

- (id)progressOfActiveSyncTask
{
  uint64_t v2 = [(HDCloudSyncManagerTaskQueue *)self->_syncTaskQueue activeTask];
  uint64_t v3 = [v2 progress];

  return v3;
}

- (id)addCloudSyncProgressCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = __Block_byref_object_copy__44;
  id v26 = __Block_byref_object_dispose__44;
  id v27 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  queue = self->_queue;
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __57__HDCloudSyncCoordinator_addCloudSyncProgressCompletion___block_invoke;
  long long v13 = &unk_1E62F9620;
  id v14 = self;
  uint64_t v16 = &v22;
  id v6 = v4;
  id v15 = v6;
  id v17 = &v18;
  dispatch_sync(queue, &v10);
  if (!*((unsigned char *)v19 + 24))
  {
    id v7 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 726, @"No sync in progress.", v10, v11, v12, v13, v14);
    (*((void (**)(id, void, void *))v6 + 2))(v6, 0, v7);
  }
  id v8 = (id)v23[5];

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);

  return v8;
}

void __57__HDCloudSyncCoordinator_addCloudSyncProgressCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 32);
  if (v1)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v1);
    uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 40);
    if (!v3)
    {
      id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v5 = *(void *)(a1 + 32);
      id v6 = *(void **)(v5 + 40);
      *(void *)(v5 + 40) = v4;

      uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 40);
    }
    id v7 = (void *)[*(id *)(a1 + 40) copy];
    id v8 = _Block_copy(v7);
    [v3 addObject:v8];

    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
}

- (BOOL)canPerformCloudSyncWithError:(id *)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  -[HDCloudSyncCoordinator _setupCloudSyncSupportIfRequired]((uint64_t)self);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);
  id v6 = [WeakRetained behavior];
  char v7 = [v6 supportsCloudSync];

  if ((v7 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a3, 111, @"Cloud sync not supported on this device.");
    LOBYTE(a3) = 0;
    return (char)a3;
  }
  os_unfair_lock_lock(&self->_lock);
  BOOL v8 = [(HDCloudSyncAccountProvider *)self->_accountProvider computeCanPerformCloudSyncForPrimaryAccount:a3];
  LODWORD(a3) = v8;
  if (self->_lock_cloudSyncEnabled == v8)
  {
    BOOL lock_hasComputedCloudSyncEnabled = self->_lock_hasComputedCloudSyncEnabled;
    self->_lock_cloudSyncEnabled = v8;
    self->_BOOL lock_hasComputedCloudSyncEnabled = 1;
    os_unfair_lock_unlock(&self->_lock);
    if (lock_hasComputedCloudSyncEnabled) {
      return (char)a3;
    }
  }
  else
  {
    self->_lock_cloudSyncEnabled = v8;
    self->_BOOL lock_hasComputedCloudSyncEnabled = 1;
    os_unfair_lock_unlock(&self->_lock);
  }
  _HKInitializeLogging();
  uint64_t v10 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = "disabled";
    if (a3) {
      uint64_t v11 = "ENABLED";
    }
    int v13 = 138543618;
    id v14 = self;
    __int16 v15 = 2080;
    uint64_t v16 = v11;
    _os_log_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: Cloud sync %s", (uint8_t *)&v13, 0x16u);
  }
  [(HDCloudSyncPeriodicActivityScheduler *)self->_periodicActivityScheduler updatePeriodicActivityCriteria];
  return (char)a3;
}

- (id)stateSyncEntityClasses
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_stateSyncEntityClasses = self->_lock_stateSyncEntityClasses;
  if (!lock_stateSyncEntityClasses)
  {
    os_unfair_lock_assert_owner(p_lock);
    lock_stateSyncEntityClasses = self->_lock_stateSyncEntityClasses;
    if (!lock_stateSyncEntityClasses)
    {
      uint64_t v5 = HDBuiltinStateSyncEntities();
      id v6 = (void *)[v5 mutableCopy];

      id WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);
      BOOL v8 = [WeakRetained pluginManager];
      uint64_t v9 = [v8 pluginsConformingToProtocol:&unk_1F18A8588];
      uint64_t v10 = [v9 allValues];

      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v11 = v10;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v24;
        do
        {
          uint64_t v15 = 0;
          do
          {
            if (*(void *)v24 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * v15), "stateSyncEntityClasses", (void)v23);
            [v6 addObjectsFromArray:v16];

            ++v15;
          }
          while (v13 != v15);
          uint64_t v13 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
        }
        while (v13);
      }

      uint64_t v17 = (NSArray *)[v6 copy];
      uint64_t v18 = self->_lock_stateSyncEntityClasses;
      self->_lock_stateSyncEntityClasses = v17;

      lock_stateSyncEntityClasses = self->_lock_stateSyncEntityClasses;
    }
  }
  uint64_t v19 = lock_stateSyncEntityClasses;
  os_unfair_lock_unlock(p_lock);
  if (v19) {
    uint64_t v20 = v19;
  }
  else {
    uint64_t v20 = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  char v21 = v20;

  return v21;
}

- (id)stateSyncDomainForSubscriptionIdentifier
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id v4 = HDCloudSyncMedicationsStateChangedSubscriptionIdentifier;
  v5[0] = @"CloudSyncStateEntityDomainMedications";
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (void)addManagerTask:(id)a3
{
}

- (int64_t)compareTask:(id)a3 withTask:(id)a4 queue:(id)a5
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 priority];
  if (v8 <= [v7 priority])
  {
    uint64_t v10 = [v6 priority];
    int64_t v9 = v10 < [v7 priority];
  }
  else
  {
    int64_t v9 = -1;
  }

  return v9;
}

- (id)_primaryProfile
{
  uint64_t v1 = *(void **)(a1 + 120);
  if (v1)
  {
    id v2 = v1;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 168));
    id v2 = [WeakRetained primaryProfile];
  }

  return v2;
}

- (void)scheduleSharedSummaryPushWithMaximumDelay:(double)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  uint64_t v5 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543618;
    int64_t v9 = self;
    __int16 v10 = 2048;
    double v11 = a3;
    _os_log_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Scheduling shared summaries push with delay %lf.", buf, 0x16u);
  }
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__HDCloudSyncCoordinator_scheduleSharedSummaryPushWithMaximumDelay___block_invoke;
  v7[3] = &unk_1E62F3198;
  v7[4] = self;
  *(double *)&v7[5] = a3;
  dispatch_sync(queue, v7);
}

uint64_t __68__HDCloudSyncCoordinator_scheduleSharedSummaryPushWithMaximumDelay___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 96) requestRunWithMaximumDelay:&__block_literal_global_484 completion:*(double *)(a1 + 40)];
}

BOOL __61__HDCloudSyncCoordinator__pushSharedSummariesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 type] == 1;
}

uint64_t __61__HDCloudSyncCoordinator__pushSharedSummariesWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)databaseJournalMergeDidCompleteForProfile:(id)a3 type:(int64_t)a4
{
  uint64_t v5 = [a3 profileType];
  if (self && v5 == 1)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    -[HDCloudSyncCoordinator _primaryProfile]((uint64_t)self);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    id v6 = HDCloudSyncRestorePhaseSyncCompleteEndDate(v14);
    id v7 = HDCloudSyncRestorePhaseMergeCompleteEndDate(v14);
    if (!v7 && v6)
    {
      id v7 = [MEMORY[0x1E4F1C9C8] now];
      uint64_t v8 = HDCloudSyncRestorePhaseSyncCompleteStartDate(v14);
      [v7 timeIntervalSinceDate:v8];
      double v10 = v9;
      double v11 = [v14 daemon];
      uint64_t v12 = [v11 analyticsSubmissionCoordinator];
      objc_msgSend(v12, "cloudSync_reportRestoreForProfile:startDate:endDate:duration:finishedJournalMerge:", v14, v8, v7, 1, v10);

      HDSetCloudSyncRestorPhaseMergeCompleteEndDate(v7, v14);
    }
    if (v7)
    {
      uint64_t v13 = [v14 database];
      [v13 removeDatabaseJournalMergeObserver:self journalType:2];
    }
  }
}

- (void)addObserver:(id)a3
{
  observers = self->_observers;
  id v5 = a3;
  id v6 = [(HDCloudSyncCoordinator *)self queue];
  [(HKObserverSet *)observers registerObserver:v5 queue:v6];
}

- (void)removeObserver:(id)a3
{
}

- (void)notifyObservers:(id)a3 syncRequestStarted:(id)a4 withProgress:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __74__HDCloudSyncCoordinator_notifyObservers_syncRequestStarted_withProgress___block_invoke;
  v12[3] = &unk_1E62F9688;
  v12[4] = self;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [a3 notifyObservers:v12];
}

void __74__HDCloudSyncCoordinator_notifyObservers_syncRequestStarted_withProgress___block_invoke(void *a1, void *a2)
{
  id v6 = a2;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v3 = a1[4];
    uint64_t v4 = a1[5];
    id v5 = objc_msgSend(MEMORY[0x1E4F28F90], "hd_progressMirroringProgress:", a1[6]);
    [v6 cloudSyncCoordinator:v3 syncStartedForRequest:v4 progress:v5];
  }
}

- (void)notifyObservers:(id)a3 syncRequestCompleted:(id)a4 success:(BOOL)a5 error:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __77__HDCloudSyncCoordinator_notifyObservers_syncRequestCompleted_success_error___block_invoke;
  v14[3] = &unk_1E62F96B0;
  v14[4] = self;
  id v15 = v10;
  BOOL v17 = a5;
  id v16 = v11;
  id v12 = v11;
  id v13 = v10;
  [a3 notifyObservers:v14];
}

void __77__HDCloudSyncCoordinator_notifyObservers_syncRequestCompleted_success_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 cloudSyncCoordinator:*(void *)(a1 + 32) syncRequestDidCompleteForRequest:*(void *)(a1 + 40) success:*(unsigned __int8 *)(a1 + 56) error:*(void *)(a1 + 48)];
  }
}

- (void)unitTest_setAccountProvider:(id)a3
{
}

- (void)unitTest_setPeriodicActivityScheduler:(id)a3
{
}

- (void)unitTest_setPrimaryProfileOverride:(id)a3
{
}

- (void)unitTest_setClientGatedSyncActivity:(id)a3
{
}

- (id)unitTest_clientGatedSyncActivity
{
  return self->_clientGatedSyncActivity;
}

- (void)unitTest_performClientGatedSyncActivity:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__HDCloudSyncCoordinator_unitTest_performClientGatedSyncActivity___block_invoke;
  v6[3] = &unk_1E62F94E0;
  id v7 = v4;
  id v5 = v4;
  -[HDCloudSyncCoordinator _syncAllProfilesViaGatedXPCActivityWithCompletion:]((uint64_t)self, v6);
}

uint64_t __66__HDCloudSyncCoordinator_unitTest_performClientGatedSyncActivity___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)unitTest_setStateSyncEntityClasses:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  id v6 = (NSArray *)[v5 copy];

  lock_stateSyncEntityClasses = self->_lock_stateSyncEntityClasses;
  self->_lock_stateSyncEntityClasses = v6;

  os_unfair_lock_unlock(p_lock);
}

- (id)diagnosticDescription
{
  id v3 = (void *)MEMORY[0x1E4F28E78];
  id v9 = 0;
  BOOL v4 = [(HDCloudSyncCoordinator *)self canPerformCloudSyncWithError:&v9];
  id v5 = v9;
  id v6 = @"NO";
  if (v4) {
    id v6 = @"YES";
  }
  id v7 = [v3 stringWithFormat:@"\nCloudSync Enabled: %@ \nStarted: %@\nEnded: %@\n", v6, self->_latestSyncStartLog, self->_latestSyncEndLog];

  return v7;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (HDCloudSyncAccountProvider)accountProvider
{
  return self->_accountProvider;
}

- (HDCloudSyncSubscriptionNotificationHandler)subscriptionNotificationHandler
{
  return self->_subscriptionNotificationHandler;
}

- (HDCloudSyncPeriodicActivityScheduler)periodicActivityScheduler
{
  return self->_periodicActivityScheduler;
}

- (HDCloudSyncStatusProvider)syncStatusProvider
{
  return self->_syncStatusProvider;
}

- (HDDaemon)daemon
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);

  return (HDDaemon *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_daemon);
  objc_storeStrong((id *)&self->_syncStatusProvider, 0);
  objc_storeStrong((id *)&self->_periodicActivityScheduler, 0);
  objc_storeStrong((id *)&self->_subscriptionNotificationHandler, 0);
  objc_storeStrong((id *)&self->_accountProvider, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_unitTest_primaryProfileOverride, 0);
  objc_storeStrong((id *)&self->_lock_stateSyncEntityClasses, 0);
  objc_storeStrong((id *)&self->_sharedSummaryPushActivity, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_clientGatedSyncActivity, 0);
  objc_storeStrong((id *)&self->_progressCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_latestSyncEndLog, 0);
  objc_storeStrong((id *)&self->_latestSyncStartLog, 0);
  objc_storeStrong((id *)&self->_activeSyncCompletions, 0);
  objc_storeStrong((id *)&self->_activeSyncProgress, 0);

  objc_storeStrong((id *)&self->_syncTaskQueue, 0);
}

- (id)mergeCloudSyncJournalsAndNotifyObservers:(id)a3 syncRequestCompleted:(id)a4 success:(BOOL)a5 error:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:1];
  if ([v10 count])
  {
    if (v7)
    {
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __125__HDCloudSyncCoordinator_CloudSyncJournalMerge__mergeCloudSyncJournalsAndNotifyObservers_syncRequestCompleted_success_error___block_invoke;
      v16[3] = &unk_1E62F2EF8;
      void v16[4] = self;
      id v17 = v10;
      id v18 = v11;
      id v14 = [(HDCloudSyncCoordinator *)self mergeCloudSyncJournalsWithCompletion:v16];
      [v13 addChild:v14 withPendingUnitCount:1];
    }
    else
    {
      [v13 setCompletedUnitCount:1];
      [(HDCloudSyncCoordinator *)self notifyObservers:v10 syncRequestCompleted:v11 success:0 error:v12];
    }
  }
  else
  {
    [v13 setCompletedUnitCount:1];
  }

  return v13;
}

uint64_t __125__HDCloudSyncCoordinator_CloudSyncJournalMerge__mergeCloudSyncJournalsAndNotifyObservers_syncRequestCompleted_success_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) notifyObservers:*(void *)(a1 + 40) syncRequestCompleted:*(void *)(a1 + 48) success:a2 error:a3];
}

- (id)mergeCloudSyncJournalsWithCompletion:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  _HKInitializeLogging();
  id v5 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    id v14 = self;
    _os_log_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Cloud Sync journal merge attempt starting.", buf, 0xCu);
  }
  id v6 = objc_alloc(MEMORY[0x1E4F65CD8]);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __86__HDCloudSyncCoordinator_CloudSyncJournalMerge__mergeCloudSyncJournalsWithCompletion___block_invoke;
  v11[3] = &unk_1E62FA040;
  id v12 = v4;
  id v7 = v4;
  id v8 = (void *)[v6 initWithDescription:@"Merge pending cloud sync journals" completion:v11];
  id v9 = [(HDCloudSyncCoordinator *)self _mergeCloudSyncJournalsWithTaskTree:v8];
  [v8 begin];

  return v9;
}

uint64_t __86__HDCloudSyncCoordinator_CloudSyncJournalMerge__mergeCloudSyncJournalsWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void, BOOL, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a3 == 0, a4);
}

- (id)_mergeCloudSyncJournalsWithTaskTree:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HDCloudSyncCoordinator *)self daemon];
  id v6 = [v5 profileManager];
  id v7 = [v6 allProfileIdentifiers];

  id v8 = objc_msgSend(MEMORY[0x1E4F28F90], "discreteProgressWithTotalUnitCount:", objc_msgSend(v7, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = -[HDCloudSyncCoordinator _mergeCloudSyncJournalsForProfile:taskTree:](self, "_mergeCloudSyncJournalsForProfile:taskTree:", *(void *)(*((void *)&v16 + 1) + 8 * i), v4, (void)v16);
        [v8 addChild:v14 withPendingUnitCount:1];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  return v8;
}

- (id)_mergeCloudSyncJournalsForProfile:(id)a3 taskTree:(id)a4
{
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1E4F28F90];
  id v8 = a4;
  id v9 = [v7 discreteProgressWithTotalUnitCount:1];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __92__HDCloudSyncCoordinator_CloudSyncJournalMerge___mergeCloudSyncJournalsForProfile_taskTree___block_invoke;
  v15[3] = &unk_1E62FA090;
  v15[4] = self;
  id v16 = v6;
  id v10 = v9;
  id v17 = v10;
  id v11 = v6;
  [v8 addTask:v15];

  uint64_t v12 = v17;
  id v13 = v10;

  return v13;
}

void __92__HDCloudSyncCoordinator_CloudSyncJournalMerge___mergeCloudSyncJournalsForProfile_taskTree___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) daemon];
  id v8 = [v7 profileManager];
  id v9 = [v8 profileForIdentifier:*(void *)(a1 + 40)];

  if (v9)
  {
    _HKInitializeLogging();
    id v10 = (os_log_t *)MEMORY[0x1E4F29FA8];
    id v11 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138543618;
      *(void *)&uint8_t buf[4] = v12;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v9;
      _os_log_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Merging cloud sync journal for profile %{public}@", buf, 0x16u);
    }
    *(void *)long long buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    char v32 = 0;
    id v13 = [v9 database];
    id v24 = 0;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __92__HDCloudSyncCoordinator_CloudSyncJournalMerge___mergeCloudSyncJournalsForProfile_taskTree___block_invoke_286;
    v21[3] = &unk_1E62FA068;
    id v14 = v9;
    id v22 = v14;
    long long v23 = buf;
    char v15 = [v13 performWithJournalType:2 error:&v24 block:v21];
    id v16 = v24;

    [*(id *)(a1 + 48) setCompletedUnitCount:1];
    if (v15)
    {
      uint64_t v17 = 0;
      id v18 = 0;
    }
    else
    {
      _HKInitializeLogging();
      long long v19 = *v10;
      if (os_log_type_enabled(*v10, OS_LOG_TYPE_ERROR))
      {
        uint64_t v20 = *(void *)(a1 + 32);
        *(_DWORD *)long long v25 = 138543874;
        uint64_t v26 = v20;
        __int16 v27 = 2114;
        id v28 = v14;
        __int16 v29 = 2114;
        id v30 = v16;
        _os_log_error_impl(&dword_1BCB7D000, v19, OS_LOG_TYPE_ERROR, "%{public}@: Failed to merge cloud sync journals for profile %{public}@: %{public}@", v25, 0x20u);
      }
      uint64_t v17 = 1;
      id v18 = v16;
    }
    ((void (**)(id, uint64_t, id))v6)[2](v6, v17, v18);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    [*(id *)(a1 + 48) setCompletedUnitCount:1];
    v6[2](v6, 0, 0);
  }
}

BOOL __92__HDCloudSyncCoordinator_CloudSyncJournalMerge___mergeCloudSyncJournalsForProfile_taskTree___block_invoke_286(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) database];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __92__HDCloudSyncCoordinator_CloudSyncJournalMerge___mergeCloudSyncJournalsForProfile_taskTree___block_invoke_2;
  v7[3] = &unk_1E62F82A8;
  v7[4] = *(void *)(a1 + 40);
  BOOL v5 = +[HDHealthEntity performReadTransactionWithHealthDatabase:v4 error:a2 block:v7];

  return v5;
}

uint64_t __92__HDCloudSyncCoordinator_CloudSyncJournalMerge___mergeCloudSyncJournalsForProfile_taskTree___block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  return 1;
}

@end