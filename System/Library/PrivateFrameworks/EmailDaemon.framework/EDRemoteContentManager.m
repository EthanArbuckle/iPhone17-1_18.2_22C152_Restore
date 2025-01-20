@interface EDRemoteContentManager
- (BOOL)shouldAddRemoteContentLinksForMessage:(id)a3 logMessage:(id *)a4;
- (BOOL)shouldAddRemoteContentLinksForMessageWithDateReceived:(id)a3;
- (BOOL)shouldVerifyRemoteLinks;
- (EDRemoteContentManager)initWithRemoteContentPersistence:(id)a3 contentRuleListManager:(id)a4 urlSession:(id)a5;
- (EDRemoteContentManagerTestDelegate)testDelegate;
- (EDRemoteContentPersistence)remoteContentPersistence;
- (EFScheduler)backgroundWorkScheduler;
- (EFScheduler)unconditionalRequestScheduler;
- (EMRemoteContentURLSession)urlSession;
- (NSDate)schedulingLastUpdate;
- (NSDate)timeoutLastUpdate;
- (NSLock)requestLock;
- (double)_getTimeout;
- (double)maximumTimeout;
- (double)minimumTimeout;
- (double)requestInterval;
- (id)_issueAndWaitForBatch:(id)a3 deferBlock:(id)a4 successful:(unint64_t *)a5 failed:(unint64_t *)a6 canceled:(unint64_t *)a7 deferred:(unint64_t *)a8;
- (id)_requestSchedulerWithInterval:(double)a3;
- (id)_viewDurationsFromBiome;
- (id)requestSchedulerBlock;
- (unint64_t)_performRequests:(unint64_t)a3 unconditionally:(BOOL)a4 withDeferBlock:(id)a5 completedCount:(unint64_t *)a6;
- (unint64_t)_requestRemoteLinksInBackground:(unint64_t)a3 unconditionally:(BOOL)a4 hasMoreLinks:(BOOL *)a5 deferBlock:(id)a6;
- (unint64_t)batchSize;
- (unint64_t)pruneFrequency;
- (unint64_t)requestedSinceLastPrune;
- (void)_addRemoteContentLinks:(id)a3 andVerify:(BOOL)a4 WithParsedLinks:(id)a5 defaultCharsetName:(id)a6;
- (void)_scheduleBackgroundRequests;
- (void)_scheduleRequestForLinks:(unint64_t)a3 unconditionally:(BOOL)a4 withDelay:(double)a5 completionHandler:(id)a6;
- (void)_updateScheduling;
- (void)_updateTimeoutSettingDefaultIfNeeded:(BOOL)a3;
- (void)addRemoteContentLinks:(id)a3;
- (void)addRemoteContentLinks:(id)a3 andVerifyWithParsedLinks:(id)a4 defaultCharsetName:(id)a5;
- (void)addRemoteContentLinks:(id)a3 requiredParsing:(BOOL)a4;
- (void)noteViewOfRemoteContentLinks:(id)a3;
- (void)setBatchSize:(unint64_t)a3;
- (void)setMaximumTimeout:(double)a3;
- (void)setMinimumTimeout:(double)a3;
- (void)setPruneFrequency:(unint64_t)a3;
- (void)setRequestInterval:(double)a3;
- (void)setRequestSchedulerBlock:(id)a3;
- (void)setRequestedSinceLastPrune:(unint64_t)a3;
- (void)setSchedulingLastUpdate:(id)a3;
- (void)setTestDelegate:(id)a3;
- (void)setTimeoutLastUpdate:(id)a3;
- (void)test_tearDown;
@end

@implementation EDRemoteContentManager

void ___ef_log_EDRemoteContentManager_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.email", "EDRemoteContentManager");
  v1 = (void *)_ef_log_EDRemoteContentManager_log;
  _ef_log_EDRemoteContentManager_log = (uint64_t)v0;
}

- (EDRemoteContentManager)initWithRemoteContentPersistence:(id)a3 contentRuleListManager:(id)a4 urlSession:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v23.receiver = self;
  v23.super_class = (Class)EDRemoteContentManager;
  v10 = [(EDRemoteContentManager *)&v23 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_remoteContentPersistence, a3);
    objc_storeStrong((id *)&v11->_urlSession, a5);
    *(void *)&v11->_requestSchedulerLock._os_unfair_lock_opaque = 0;
    v11->_schedulingLock._os_unfair_lock_opaque = 0;
    uint64_t v12 = [MEMORY[0x1E4F60F28] serialDispatchQueueSchedulerWithName:@"com.apple.email.EDRemoteContentManager.backgroundWorkScheduler" qualityOfService:9];
    backgroundWorkScheduler = v11->_backgroundWorkScheduler;
    v11->_backgroundWorkScheduler = (EFScheduler *)v12;

    v14 = (EFCancelationToken *)objc_alloc_init(MEMORY[0x1E4F60D40]);
    token = v11->_token;
    v11->_token = v14;

    v16 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    requestLock = v11->_requestLock;
    v11->_requestLock = v16;

    v11->_pruneFrequency = 5000;
    id v18 = objc_alloc(MEMORY[0x1E4F60DA0]);
    id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v20 = [v18 initWithObject:v19];
    remoteLinkVerificationTimes = v11->_remoteLinkVerificationTimes;
    v11->_remoteLinkVerificationTimes = (EFLocked *)v20;
  }
  return v11;
}

- (void)_scheduleBackgroundRequests
{
  v3 = _os_activity_create(&dword_1DB39C000, "-[EDRemoteContentManager _scheduleBackgroundRequests]", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v3, &state);
  os_unfair_lock_lock(&self->_schedulingLock);
  v4 = [(EDRemoteContentManager *)self schedulingLastUpdate];
  if (v4
    && ([(EDRemoteContentManager *)self schedulingLastUpdate],
        v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = objc_msgSend(v5, "ef_isMoreThanTimeIntervalAgo:", 86400.0),
        v5,
        v4,
        (v6 & 1) == 0))
  {
    double v8 = 10.0;
    if (([MEMORY[0x1E4F602E0] preferenceEnabled:11] & 1) == 0)
    {
      [(EDRemoteContentManager *)self requestInterval];
      EFARC4NormallyDistributedRandomDoubleWithMinimum();
      double v8 = v9;
    }
    unint64_t v10 = [(EDRemoteContentManager *)self batchSize];
    if (v10 >= 6)
    {
      EFARC4NormallyDistributedRandomDoubleInRange();
      unint64_t v10 = (unint64_t)v11;
    }
    os_unfair_lock_unlock(&self->_schedulingLock);
    uint64_t v12 = [MEMORY[0x1E4F602E0] preferenceEnabled:11];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __53__EDRemoteContentManager__scheduleBackgroundRequests__block_invoke_2;
    v13[3] = &unk_1E6C04D88;
    v13[4] = self;
    [(EDRemoteContentManager *)self _scheduleRequestForLinks:v10 unconditionally:v12 withDelay:v13 completionHandler:v8];
  }
  else
  {
    os_unfair_lock_unlock(&self->_schedulingLock);
    v7 = [(EDRemoteContentManager *)self backgroundWorkScheduler];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __53__EDRemoteContentManager__scheduleBackgroundRequests__block_invoke;
    v14[3] = &unk_1E6BFF2F0;
    v14[4] = self;
    [v7 performBlock:v14];
  }
  os_activity_scope_leave(&state);
}

uint64_t __53__EDRemoteContentManager__scheduleBackgroundRequests__block_invoke(uint64_t a1)
{
  v2 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 40);
  os_unfair_lock_lock(v2);
  v3 = [*(id *)(a1 + 32) schedulingLastUpdate];
  if (!v3
    || ([*(id *)(a1 + 32) schedulingLastUpdate],
        v4 = objc_claimAutoreleasedReturnValue(),
        int v5 = objc_msgSend(v4, "ef_isMoreThanTimeIntervalAgo:", 86400.0),
        v4,
        v3,
        v5))
  {
    [*(id *)(a1 + 32) _updateScheduling];
  }
  os_unfair_lock_unlock(v2);
  char v6 = *(void **)(a1 + 32);

  return [v6 _scheduleBackgroundRequests];
}

uint64_t __53__EDRemoteContentManager__scheduleBackgroundRequests__block_invoke_2(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) _scheduleBackgroundRequests];
  }
  return result;
}

- (void)_updateScheduling
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-86400.0];
  v4 = [(EDRemoteContentManager *)self remoteContentPersistence];
  unint64_t v5 = [v4 countOfLinksLastSeenSince:v3];

  char v6 = [(EDRemoteContentManager *)self remoteContentPersistence];
  unint64_t v7 = [v6 countOfUnrequestedLinks];

  if (v5 <= v7) {
    unint64_t v8 = v7;
  }
  else {
    unint64_t v8 = v5;
  }
  if (v8 <= 0xC8) {
    unint64_t v8 = 200;
  }
  double v9 = (double)v8;
  double v10 = (log((double)v8) * -12.34 + 130.0) * 60.0;
  if (v10 >= 720.0) {
    double v11 = v10;
  }
  else {
    double v11 = 720.0;
  }
  [(EDRemoteContentManager *)self setRequestInterval:v11];
  [(EDRemoteContentManager *)self setBatchSize:(unint64_t)(v11 * v9 / 10800.0)];
  id v12 = objc_alloc_init(MEMORY[0x1E4F1C9C8]);
  [(EDRemoteContentManager *)self setSchedulingLastUpdate:v12];

  _ef_log_EDRemoteContentManager();
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 134218752;
    unint64_t v15 = v5;
    __int16 v16 = 2048;
    unint64_t v17 = v7;
    __int16 v18 = 2048;
    double v19 = v11;
    __int16 v20 = 2048;
    unint64_t v21 = [(EDRemoteContentManager *)self batchSize];
    _os_log_impl(&dword_1DB39C000, v13, OS_LOG_TYPE_DEFAULT, "Updated scheduling: last day count = %lu, unrequested count = %lu, request interval = %f, batch size = %lu", (uint8_t *)&v14, 0x2Au);
  }
}

- (void)_scheduleRequestForLinks:(unint64_t)a3 unconditionally:(BOOL)a4 withDelay:(double)a5 completionHandler:(id)a6
{
  BOOL v7 = a4;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v10 = a6;
  os_unfair_lock_lock(&self->_requestSchedulerLock);
  if (v7)
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    double v11 = [(EDRemoteContentManager *)self unconditionalRequestScheduler];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __95__EDRemoteContentManager__scheduleRequestForLinks_unconditionally_withDelay_completionHandler___block_invoke;
    v22[3] = &unk_1E6C04DD0;
    objc_copyWeak(v24, &location);
    id v23 = v10;
    v24[1] = (id)a3;
    id v12 = (id)[v11 afterDelay:v22 performBlock:a5];

    v13 = _ef_log_EDRemoteContentManager();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v27 = a3;
      __int16 v28 = 2048;
      double v29 = a5;
      _os_log_impl(&dword_1DB39C000, v13, OS_LOG_TYPE_DEFAULT, "Scheduled unconditional request batch for %lu links with interval: %f", buf, 0x16u);
    }

    objc_destroyWeak(v24);
    objc_destroyWeak(&location);
LABEL_13:
    os_unfair_lock_unlock(&self->_requestSchedulerLock);
    goto LABEL_14;
  }
  if (!self->_requestScheduler)
  {
    unint64_t v15 = [(EDRemoteContentManager *)self _requestSchedulerWithInterval:a5];
    objc_storeStrong((id *)&self->_requestScheduler, v15);
    self->_remainingCountToSchedule = a3;
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __95__EDRemoteContentManager__scheduleRequestForLinks_unconditionally_withDelay_completionHandler___block_invoke_13;
    v18[3] = &unk_1E6C04DF8;
    objc_copyWeak(&v21, &location);
    id v19 = v15;
    id v20 = v10;
    id v16 = v15;
    [v16 scheduleWithBlock:v18];
    unint64_t v17 = _ef_log_EDRemoteContentManager();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v27 = a3;
      __int16 v28 = 2048;
      double v29 = a5;
      _os_log_impl(&dword_1DB39C000, v17, OS_LOG_TYPE_DEFAULT, "Scheduled request batch for %lu links with interval: %f", buf, 0x16u);
    }

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
    goto LABEL_13;
  }
  int v14 = _ef_log_EDRemoteContentManager();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB39C000, v14, OS_LOG_TYPE_DEFAULT, "Request batch already scheduled", buf, 2u);
  }

  os_unfair_lock_unlock(&self->_requestSchedulerLock);
  if (v10) {
    (*((void (**)(id, void))v10 + 2))(v10, 0);
  }
LABEL_14:
}

void __95__EDRemoteContentManager__scheduleRequestForLinks_unconditionally_withDelay_completionHandler___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    char v11 = 0;
    if ([WeakRetained[11] tryLock])
    {
      uint64_t v4 = [v3 _requestRemoteLinksInBackground:*(void *)(a1 + 48) unconditionally:1 hasMoreLinks:&v11 deferBlock:&__block_literal_global_12_0];
      [v3[11] unlock];
    }
    else
    {
      char v6 = _ef_log_EDRemoteContentManager();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v10 = 0;
        _os_log_impl(&dword_1DB39C000, v6, OS_LOG_TYPE_DEFAULT, "Skipped unconditional request batch because request batch is already running", v10, 2u);
      }

      uint64_t v4 = 0;
    }
    uint64_t v7 = *(void *)(a1 + 32);
    if (v7)
    {
      if (v4) {
        BOOL v8 = 1;
      }
      else {
        BOOL v8 = v11 == 0;
      }
      uint64_t v9 = !v8;
      (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v7, v9);
    }
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 32);
    if (v5) {
      (*(void (**)(uint64_t, void))(v5 + 16))(v5, 0);
    }
  }
}

uint64_t __95__EDRemoteContentManager__scheduleRequestForLinks_unconditionally_withDelay_completionHandler___block_invoke_2()
{
  return 0;
}

void __95__EDRemoteContentManager__scheduleRequestForLinks_unconditionally_withDelay_completionHandler___block_invoke_13(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    while (1)
    {
      uint64_t v5 = (void *)*((void *)WeakRetained + 11);
      char v6 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:5.0];
      LOBYTE(v5) = [v5 lockBeforeDate:v6];

      if (v5) {
        break;
      }
      if ([*(id *)(a1 + 32) shouldDefer])
      {
        uint64_t v7 = *(void *)(a1 + 40);
        if (v7) {
          (*(void (**)(uint64_t, void))(v7 + 16))(v7, 0);
        }
        uint64_t v8 = 2;
        goto LABEL_10;
      }
    }
    char v23 = 0;
    os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 8);
    uint64_t v10 = *((void *)WeakRetained + 3);
    os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 8);
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    id v20 = __95__EDRemoteContentManager__scheduleRequestForLinks_unconditionally_withDelay_completionHandler___block_invoke_2_14;
    id v21 = &unk_1E6C030B0;
    id v22 = *(id *)(a1 + 32);
    uint64_t v11 = [WeakRetained _requestRemoteLinksInBackground:v10 unconditionally:0 hasMoreLinks:&v23 deferBlock:&v18];
    if (v11)
    {
      id v12 = _ef_log_EDRemoteContentManager();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v25 = v11;
        _os_log_impl(&dword_1DB39C000, v12, OS_LOG_TYPE_DEFAULT, "Deferring %lu links", buf, 0xCu);
      }

      os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 8);
      *((void *)WeakRetained + 3) = v11;
    }
    else
    {
      os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 8);
      *((void *)WeakRetained + 3) = 0;
      objc_msgSend(*((id *)WeakRetained + 1), "invalidate", v18, v19, v20, v21);
      v13 = (void *)*((void *)WeakRetained + 1);
      *((void *)WeakRetained + 1) = 0;
    }
    os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 8);

    [*((id *)WeakRetained + 11) unlock];
    uint64_t v14 = *(void *)(a1 + 40);
    if (v14)
    {
      if (v11) {
        BOOL v15 = 1;
      }
      else {
        BOOL v15 = v23 == 0;
      }
      uint64_t v16 = !v15;
      (*(void (**)(uint64_t, uint64_t))(v14 + 16))(v14, v16);
    }
    if (v11) {
      uint64_t v17 = 2;
    }
    else {
      uint64_t v17 = 1;
    }
    v3[2](v3, v17);
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 40);
    if (v9) {
      (*(void (**)(uint64_t, void))(v9 + 16))(v9, 0);
    }
    uint64_t v8 = 1;
LABEL_10:
    v3[2](v3, v8);
  }
}

uint64_t __95__EDRemoteContentManager__scheduleRequestForLinks_unconditionally_withDelay_completionHandler___block_invoke_2_14(uint64_t a1)
{
  return [*(id *)(a1 + 32) shouldDefer];
}

- (unint64_t)_requestRemoteLinksInBackground:(unint64_t)a3 unconditionally:(BOOL)a4 hasMoreLinks:(BOOL *)a5 deferBlock:(id)a6
{
  BOOL v7 = a4;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = (uint64_t (**)(void))a6;
  uint64_t v11 = [(EDRemoteContentManager *)self testDelegate];
  [v11 remoteContentManagerWillStartRequests:self];

  uint64_t v23 = 0;
  unint64_t v12 = [(EDRemoteContentManager *)self _performRequests:a3 unconditionally:v7 withDeferBlock:v10 completedCount:&v23];
  [(EDRemoteContentManager *)self setRequestedSinceLastPrune:[(EDRemoteContentManager *)self requestedSinceLastPrune] + v12];
  if (v23 == v12)
  {
    BOOL v13 = v12 >= a3;
    if (v12 >= a3
      && (unint64_t v14 = [(EDRemoteContentManager *)self requestedSinceLastPrune],
          v14 <= [(EDRemoteContentManager *)self pruneFrequency])
      || (v10[2](v10) & 1) != 0
      || ([(EDRemoteContentManager *)self remoteContentPersistence],
          BOOL v15 = objc_claimAutoreleasedReturnValue(),
          int v16 = [v15 pruneAllRemoteContentLinksWithMinimumCount:1],
          v15,
          !v16))
    {
      uint64_t v17 = &stru_1F3583658;
    }
    else
    {
      [(EDRemoteContentManager *)self setRequestedSinceLastPrune:0];
      uint64_t v17 = @" and pruning";
    }
    id v20 = _ef_log_EDRemoteContentManager();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      unint64_t v25 = v12;
      __int16 v26 = 2114;
      unint64_t v27 = v17;
      _os_log_impl(&dword_1DB39C000, v20, OS_LOG_TYPE_DEFAULT, "Finishing after requesting %lu URLs%{public}@", buf, 0x16u);
    }

    id v21 = [(EDRemoteContentManager *)self testDelegate];
    [v21 remoteContentManager:self didFinishAfterRequesting:v12];

    unint64_t v19 = 0;
    if (a5) {
      *a5 = v13;
    }
  }
  else
  {
    uint64_t v18 = [(EDRemoteContentManager *)self testDelegate];
    [v18 remoteContentManager:self didDeferAfterRequesting:v12];

    if (a5) {
      *a5 = 1;
    }
    unint64_t v19 = v12 - v23;
  }

  return v19;
}

- (unint64_t)_performRequests:(unint64_t)a3 unconditionally:(BOOL)a4 withDeferBlock:(id)a5 completedCount:(unint64_t *)a6
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  uint64_t v11 = [(EDRemoteContentManager *)self remoteContentPersistence];
  unint64_t v12 = [v11 remoteContentLinksBelowCount:1 limit:a3];
  uint64_t v13 = [v12 count];
  unint64_t v14 = _ef_log_EDRemoteContentManager();
  BOOL v15 = v14;
  if (v13)
  {
    int v16 = v14;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = objc_msgSend(v12, "ef_map:", &__block_literal_global_293);
      uint64_t v18 = [v17 componentsJoinedByString:@", "];

      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v18;
      _os_log_impl(&dword_1DB39C000, v16, OS_LOG_TYPE_DEFAULT, "Starting request batch for URLs: %{public}@", buf, 0xCu);
    }
    id v19 = objc_alloc_init(MEMORY[0x1E4F1C9C8]);
    uint64_t v43 = 0;
    *(void *)buf = 0;
    uint64_t v41 = 0;
    uint64_t v42 = 0;
    id v20 = [(EDRemoteContentManager *)self _issueAndWaitForBatch:v12 deferBlock:v10 successful:buf failed:&v43 canceled:&v42 deferred:&v41];
    id v21 = [MEMORY[0x1E4F1C9C8] date];
    [v21 timeIntervalSinceDate:v19];
    uint64_t v23 = v22;

    [v11 updateRequestCountForRemoteContentLinks:v20 updateLastSeen:0];
    uint64_t v24 = [v12 count];
    uint64_t v29 = MEMORY[0x1E4F143A8];
    uint64_t v30 = 3221225472;
    v31 = __89__EDRemoteContentManager__performRequests_unconditionally_withDeferBlock_completedCount___block_invoke;
    v32 = &unk_1E6C04E20;
    uint64_t v35 = v24;
    LOBYTE(v40) = a4;
    id v25 = v20;
    v33 = v25;
    id v26 = v12;
    v34 = v26;
    uint64_t v36 = *(void *)buf;
    uint64_t v37 = v43;
    uint64_t v38 = v42;
    uint64_t v39 = v41;
    AnalyticsSendEventLazy();
    if (a6) {
      *a6 = objc_msgSend(v25, "count", v29, 3221225472, __89__EDRemoteContentManager__performRequests_unconditionally_withDeferBlock_completedCount___block_invoke, &unk_1E6C04E20, v25, v26, v35, v23, v36, v37, v38, v39, v40);
    }
    unint64_t v27 = objc_msgSend(v26, "count", v29, v30, v31, v32);
  }
  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB39C000, v15, OS_LOG_TYPE_DEFAULT, "Skipping empty request batch", buf, 2u);
    }

    unint64_t v27 = 0;
    if (a6) {
      *a6 = 0;
    }
  }

  return v27;
}

id __89__EDRemoteContentManager__performRequests_unconditionally_withDeferBlock_completedCount___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v20[0] = @"batchSize";
  uint64_t v21 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 48)];
  v20[1] = @"batchDuration";
  uint64_t v18 = (void *)v21;
  uint64_t v22 = [NSNumber numberWithDouble:*(double *)(a1 + 56)];
  v20[2] = @"isUnconditional";
  int v16 = (void *)v22;
  uint64_t v17 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 96)];
  uint64_t v23 = v17;
  v20[3] = @"didComplete";
  BOOL v15 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(*(id *)(a1 + 32), "count") == objc_msgSend(*(id *)(a1 + 40), "count"));
  uint64_t v24 = v15;
  v20[4] = @"successfulCount";
  unint64_t v14 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 64)];
  id v25 = v14;
  v20[5] = @"percentSuccessful";
  unint64_t v2 = *(void *)(a1 + 48);
  if (v2) {
    [NSNumber numberWithUnsignedInteger:100 * *(void *)(a1 + 64) / v2];
  }
  else {
  id v19 = [MEMORY[0x1E4F1CA98] null];
  }
  id v26 = v19;
  v20[6] = @"failedCount";
  uint64_t v13 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 72)];
  unint64_t v27 = v13;
  v20[7] = @"percentFailed";
  unint64_t v3 = *(void *)(a1 + 48);
  if (v3) {
    [NSNumber numberWithUnsignedInteger:100 * *(void *)(a1 + 72) / v3];
  }
  else {
  uint64_t v4 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v28 = v4;
  v20[8] = @"canceledCount";
  uint64_t v5 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 80)];
  uint64_t v29 = v5;
  v20[9] = @"percentCanceled";
  unint64_t v6 = *(void *)(a1 + 48);
  if (v6) {
    [NSNumber numberWithUnsignedInteger:100 * *(void *)(a1 + 80) / v6];
  }
  else {
  BOOL v7 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v30 = v7;
  v20[10] = @"deferredCount";
  uint64_t v8 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 88)];
  v31 = v8;
  v20[11] = @"percentDeferred";
  unint64_t v9 = *(void *)(a1 + 48);
  if (v9) {
    [NSNumber numberWithUnsignedInteger:100 * *(void *)(a1 + 88) / v9];
  }
  else {
  id v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v32 = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:v20 count:12];

  return v11;
}

- (id)_issueAndWaitForBatch:(id)a3 deferBlock:(id)a4 successful:(unint64_t *)a5 failed:(unint64_t *)a6 canceled:(unint64_t *)a7 deferred:(unint64_t *)a8
{
  uint64_t v108 = *MEMORY[0x1E4F143B8];
  id v52 = a3;
  v53 = (uint64_t (**)(void))a4;
  id v57 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v59 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v60 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v61 = (void *)[objc_alloc(MEMORY[0x1E4F28BB8]) initWithCondition:0];
  v62 = [(EDRemoteContentManager *)self urlSession];
  id v10 = objc_alloc_init(MEMORY[0x1E4F60E18]);
  uint64_t v98 = MEMORY[0x1E4F143A8];
  uint64_t v99 = 3221225472;
  v100 = __95__EDRemoteContentManager__issueAndWaitForBatch_deferBlock_successful_failed_canceled_deferred___block_invoke;
  v101 = &unk_1E6C04D88;
  id v102 = v10;
  id v51 = v102;
  EMPrivacyProxyIsDisabledForNetwork();
  uint64_t v11 = [v102 future];
  unint64_t v12 = [v11 resultWithTimeout:0 error:5.0];
  v47 = a5;
  unsigned int v55 = [v12 BOOLValue];

  uint64_t v94 = 0;
  v95 = &v94;
  uint64_t v96 = 0x2020000000;
  uint64_t v97 = 0;
  uint64_t v90 = 0;
  v91 = &v90;
  uint64_t v92 = 0x2020000000;
  uint64_t v93 = 0;
  uint64_t v86 = 0;
  v87 = &v86;
  uint64_t v88 = 0x2020000000;
  uint64_t v89 = 0;
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  obuint64_t j = v52;
  uint64_t v13 = [obj countByEnumeratingWithState:&v82 objects:v107 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v83;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v83 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void *)(*((void *)&v82 + 1) + 8 * i);
        uint64_t v17 = [MEMORY[0x1E4F28E88] requestWithURL:v16];
        [(EDRemoteContentManager *)self _getTimeout];
        double v19 = v18;
        v73[0] = MEMORY[0x1E4F143A8];
        v73[1] = 3221225472;
        v73[2] = __95__EDRemoteContentManager__issueAndWaitForBatch_deferBlock_successful_failed_canceled_deferred___block_invoke_2;
        v73[3] = &unk_1E6C04E70;
        double v81 = v18;
        v73[4] = v16;
        v78 = &v94;
        v79 = &v90;
        v80 = &v86;
        id v20 = v61;
        id v74 = v20;
        id v21 = v57;
        id v75 = v21;
        id v22 = v59;
        id v76 = v22;
        id v77 = v60;
        uint64_t v23 = [v62 dataTaskWithRequest:v17 isSynthetic:1 allowProxying:1 failOpen:v55 completionHandler:v73];
        [v20 lock];
        [v21 setObject:v23 forKeyedSubscript:v16];
        uint64_t v24 = [NSNumber numberWithDouble:v19];
        [v22 setObject:v24 forKeyedSubscript:v23];

        [v20 unlock];
        [v23 resume];
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v82 objects:v107 count:16];
    }
    while (v13);
  }

  id v56 = objc_alloc_init(MEMORY[0x1E4F1C9C8]);
  double v25 = (double)arc4random() / 4294967300.0 * 10.0 + 5.0;
  while (1)
  {
    [v61 lock];
    v71[0] = MEMORY[0x1E4F143A8];
    v71[1] = 3221225472;
    v71[2] = __95__EDRemoteContentManager__issueAndWaitForBatch_deferBlock_successful_failed_canceled_deferred___block_invoke_77;
    v71[3] = &unk_1E6C04E98;
    id v26 = v56;
    id v72 = v26;
    unint64_t v27 = [v59 keysOfEntriesPassingTest:v71];

    objc_msgSend(v61, "unlockWithCondition:", objc_msgSend(v60, "count"));
    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    id v28 = v27;
    uint64_t v29 = [v28 countByEnumeratingWithState:&v67 objects:v106 count:16];
    if (v29)
    {
      uint64_t v30 = *(void *)v68;
      do
      {
        for (uint64_t j = 0; j != v29; ++j)
        {
          if (*(void *)v68 != v30) {
            objc_enumerationMutation(v28);
          }
          [*(id *)(*((void *)&v67 + 1) + 8 * j) cancel];
        }
        uint64_t v29 = [v28 countByEnumeratingWithState:&v67 objects:v106 count:16];
      }
      while (v29);
    }

    uint64_t v32 = [obj count];
    uint64_t v33 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:v25];
    LOBYTE(v32) = [v61 lockWhenCondition:v32 beforeDate:v33];

    if (v32) {
      break;
    }
    if (v53[2]() & 1) != 0 || ([(EFCancelationToken *)self->_token isCanceled])
    {
      [v61 lock];
      v34 = (void *)[v60 copy];
      uint64_t v35 = [v59 allKeys];
      objc_msgSend(v61, "unlockWithCondition:", objc_msgSend(v60, "count"));
      long long v65 = 0u;
      long long v66 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      uint64_t v36 = v35;
      uint64_t v37 = [v36 countByEnumeratingWithState:&v63 objects:v103 count:16];
      if (v37)
      {
        uint64_t v38 = *(void *)v64;
        do
        {
          for (uint64_t k = 0; k != v37; ++k)
          {
            if (*(void *)v64 != v38) {
              objc_enumerationMutation(v36);
            }
            [v62 abortTask:*(void *)(*((void *)&v63 + 1) + 8 * k)];
          }
          uint64_t v37 = [v36 countByEnumeratingWithState:&v63 objects:v103 count:16];
        }
        while (v37);
      }

      unint64_t v40 = [v36 count];
      _ef_log_EDRemoteContentManager();
      uint64_t v41 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v42 = objc_msgSend(v34, "ef_map:", &__block_literal_global_293);
        uint64_t v43 = [v42 componentsJoinedByString:@", "];

        *(_DWORD *)buf = 138543362;
        v105 = v43;
        _os_log_impl(&dword_1DB39C000, v41, OS_LOG_TYPE_DEFAULT, "Did not finish requesting batch due to deferral, completed: %{public}@", buf, 0xCu);
      }
      goto LABEL_32;
    }
  }
  v34 = (void *)[v60 copy];
  [v61 unlock];
  _ef_log_EDRemoteContentManager();
  uint64_t v41 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    v44 = objc_msgSend(v34, "ef_map:", &__block_literal_global_293);
    uint64_t v45 = [v44 componentsJoinedByString:@", "];

    *(_DWORD *)buf = 138543362;
    v105 = v45;
    _os_log_impl(&dword_1DB39C000, v41, OS_LOG_TYPE_DEFAULT, "Finished request batch for URLs: %{public}@", buf, 0xCu);
  }
  unint64_t v40 = 0;
  uint64_t v36 = v41;
LABEL_32:

  if (v47) {
    unint64_t *v47 = v95[3];
  }
  if (a6) {
    *a6 = v87[3];
  }
  if (a7) {
    *a7 = v91[3];
  }
  if (a8) {
    *a8 = v40;
  }

  _Block_object_dispose(&v86, 8);
  _Block_object_dispose(&v90, 8);
  _Block_object_dispose(&v94, 8);

  return v34;
}

void __95__EDRemoteContentManager__issueAndWaitForBatch_deferBlock_successful_failed_canceled_deferred___block_invoke(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = *(void **)(a1 + 32);
  id v3 = [NSNumber numberWithBool:a2];
  objc_msgSend(v2, "finishWithResult:");
}

void __95__EDRemoteContentManager__issueAndWaitForBatch_deferBlock_successful_failed_canceled_deferred___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (![v7 length])
  {
    uint64_t v14 = [v9 domain];
    if ([v14 isEqualToString:*MEMORY[0x1E4F289A0]])
    {
      uint64_t v15 = [v9 code];

      if (v15 == -999)
      {
        _ef_log_EDRemoteContentManager();
        uint64_t v16 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          uint64_t v17 = *(void *)(a1 + 96);
          id v18 = *(id *)(a1 + 32);
          if ([MEMORY[0x1E4F602E0] preferenceEnabled:13])
          {
            double v19 = [v18 absoluteString];
          }
          else
          {
            v31 = (void *)MEMORY[0x1E4F60E00];
            uint64_t v32 = [v18 absoluteString];
            double v19 = [v31 fullyRedactedStringForString:v32];
          }
          *(_DWORD *)buf = 134218242;
          uint64_t v36 = v17;
          __int16 v37 = 2114;
          id v38 = v19;
          _os_log_impl(&dword_1DB39C000, v16, OS_LOG_TYPE_INFO, "Canceled URL with %.2fs timeout: %{public}@", buf, 0x16u);
        }
        uint64_t v30 = *(void *)(a1 + 80);
LABEL_23:
        ++*(void *)(*(void *)(v30 + 8) + 24);
        goto LABEL_24;
      }
    }
    else
    {
    }
    _ef_log_EDRemoteContentManager();
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      uint64_t v21 = *(void *)(a1 + 96);
      id v22 = *(id *)(a1 + 32);
      if ([MEMORY[0x1E4F602E0] preferenceEnabled:13])
      {
        uint64_t v23 = [v22 absoluteString];
      }
      else
      {
        id v26 = (void *)MEMORY[0x1E4F60E00];
        unint64_t v27 = [v22 absoluteString];
        uint64_t v23 = [v26 fullyRedactedStringForString:v27];
      }
      id v28 = v23;
      uint64_t v29 = objc_msgSend(v9, "ef_publicDescription");
      *(_DWORD *)buf = 134218498;
      uint64_t v36 = v21;
      __int16 v37 = 2114;
      id v38 = v28;
      __int16 v39 = 2114;
      unint64_t v40 = v29;
      _os_log_impl(&dword_1DB39C000, v20, OS_LOG_TYPE_INFO, "Failed to request URL with %.2fs timeout: %{public}@ -- due to error: %{public}@", buf, 0x20u);
    }
    uint64_t v30 = *(void *)(a1 + 88);
    goto LABEL_23;
  }
  _ef_log_EDRemoteContentManager();
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = *(void *)(a1 + 96);
    id v12 = *(id *)(a1 + 32);
    if ([MEMORY[0x1E4F602E0] preferenceEnabled:13])
    {
      uint64_t v13 = [v12 absoluteString];
    }
    else
    {
      uint64_t v24 = (void *)MEMORY[0x1E4F60E00];
      double v25 = [v12 absoluteString];
      uint64_t v13 = [v24 fullyRedactedStringForString:v25];
    }
    *(_DWORD *)buf = 134218242;
    uint64_t v36 = v11;
    __int16 v37 = 2114;
    id v38 = v13;
    _os_log_impl(&dword_1DB39C000, v10, OS_LOG_TYPE_INFO, "Requested URL with %.2fs timeout: %{public}@", buf, 0x16u);
  }
  id v34 = v7;
  AnalyticsSendEventLazy();
  ++*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);

LABEL_24:
  [*(id *)(a1 + 40) lock];
  uint64_t v33 = [*(id *)(a1 + 48) objectForKeyedSubscript:*(void *)(a1 + 32)];
  [*(id *)(a1 + 56) removeObjectForKey:v33];
  [*(id *)(a1 + 64) addObject:*(void *)(a1 + 32)];

  objc_msgSend(*(id *)(a1 + 40), "unlockWithCondition:", objc_msgSend(*(id *)(a1 + 64), "count"));
}

id __95__EDRemoteContentManager__issueAndWaitForBatch_deferBlock_successful_failed_canceled_deferred___block_invoke_72(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = @"dataSize";
  v1 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "length"));
  v5[0] = v1;
  unint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

BOOL __95__EDRemoteContentManager__issueAndWaitForBatch_deferBlock_successful_failed_canceled_deferred___block_invoke_77(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  [*(id *)(a1 + 32) timeIntervalSinceNow];
  double v6 = v5;
  [v4 doubleValue];
  BOOL v8 = v7 < -v6;

  return v8;
}

- (EFScheduler)unconditionalRequestScheduler
{
  unconditionalRequestScheduler = self->_unconditionalRequestScheduler;
  if (!unconditionalRequestScheduler)
  {
    id v4 = [MEMORY[0x1E4F60F28] serialDispatchQueueSchedulerWithName:@"com.apple.email.EDRemoteContentManager.unconditionalRequestScheduler"];
    double v5 = self->_unconditionalRequestScheduler;
    self->_unconditionalRequestScheduler = v4;

    unconditionalRequestScheduler = self->_unconditionalRequestScheduler;
  }

  return unconditionalRequestScheduler;
}

- (id)_requestSchedulerWithInterval:(double)a3
{
  uint64_t v4 = [(EDRemoteContentManager *)self requestSchedulerBlock];
  double v5 = (void *)v4;
  if (!v4
    || ((*(void (**)(uint64_t))(v4 + 16))(v4), (double v6 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    double v6 = (void *)[objc_alloc(MEMORY[0x1E4F28B38]) initWithIdentifier:@"com.apple.email.EDRemoteContentManager.requestScheduler"];
    [v6 setQualityOfService:9];
    [v6 setRepeats:0];
    [v6 setInterval:a3];
    xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_BOOL(v7, (const char *)*MEMORY[0x1E4F14138], 0);
    xpc_dictionary_set_BOOL(v7, (const char *)*MEMORY[0x1E4F14330], 1);
    [v6 _setAdditionalXPCActivityProperties:v7];
  }

  return v6;
}

- (BOOL)shouldAddRemoteContentLinksForMessage:(id)a3 logMessage:(id *)a4
{
  id v6 = a3;
  xpc_object_t v7 = [v6 mailbox];
  unint64_t v8 = [v7 type];

  if ((v8 > 8 || ((1 << v8) & 0x17A) == 0) && v8 != -500 && v8 != -100)
  {
    id v10 = [v6 dateReceived];
    BOOL v9 = [(EDRemoteContentManager *)self shouldAddRemoteContentLinksForMessageWithDateReceived:v10];
    if (v9)
    {
      if (a4)
      {
        id v11 = 0;
LABEL_13:
        *a4 = v11;
      }
    }
    else if (a4)
    {
      id v11 = (id)[[NSString alloc] initWithFormat:@"message is too old: %@", v10];
      goto LABEL_13;
    }

    goto LABEL_15;
  }
  BOOL v9 = 0;
  if (a4) {
    *a4 = (id)objc_msgSend([NSString alloc], "initWithFormat:", @"wrong mailbox type: %ld", v8);
  }
LABEL_15:

  return v9;
}

- (BOOL)shouldAddRemoteContentLinksForMessageWithDateReceived:(id)a3
{
  [a3 timeIntervalSinceNow];
  return v3 >= -2419200.0;
}

- (BOOL)shouldVerifyRemoteLinks
{
  BOOL v3 = 1;
  if (([MEMORY[0x1E4F602E0] preferenceEnabled:12] & 1) == 0)
  {
    uint64_t v7 = 0;
    unint64_t v8 = &v7;
    uint64_t v9 = 0x2020000000;
    char v10 = 1;
    remoteLinkVerificationTimes = self->_remoteLinkVerificationTimes;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __49__EDRemoteContentManager_shouldVerifyRemoteLinks__block_invoke;
    v6[3] = &unk_1E6C04EC0;
    v6[4] = &v7;
    [(EFLocked *)remoteLinkVerificationTimes performWhileLocked:v6];
    BOOL v3 = *((unsigned char *)v8 + 24) != 0;
    _Block_object_dispose(&v7, 8);
  }
  return v3;
}

void __49__EDRemoteContentManager_shouldVerifyRemoteLinks__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ((unint64_t)[v4 count] >= 0xA)
  {
    BOOL v3 = [v4 firstObject];
    if ((objc_msgSend(v3, "ef_isMoreThanTimeIntervalAgo:", 86400.0) & 1) == 0) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    }
  }
}

- (void)addRemoteContentLinks:(id)a3
{
}

- (void)addRemoteContentLinks:(id)a3 andVerifyWithParsedLinks:(id)a4 defaultCharsetName:(id)a5
{
}

- (void)_addRemoteContentLinks:(id)a3 andVerify:(BOOL)a4 WithParsedLinks:(id)a5 defaultCharsetName:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = [(EDRemoteContentManager *)self backgroundWorkScheduler];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __94__EDRemoteContentManager__addRemoteContentLinks_andVerify_WithParsedLinks_defaultCharsetName___block_invoke;
  v14[3] = &unk_1E6C04D60;
  v14[4] = self;
  id v12 = v9;
  id v15 = v12;
  BOOL v17 = a4;
  id v13 = v10;
  id v16 = v13;
  [v11 performBlock:v14];
}

void __94__EDRemoteContentManager__addRemoteContentLinks_andVerify_WithParsedLinks_defaultCharsetName___block_invoke(uint64_t a1)
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  if (([*(id *)(*(void *)(a1 + 32) + 48) isCanceled] & 1) == 0)
  {
    id v50 = *(id *)(a1 + 40);
    v49 = [*(id *)(a1 + 40) indexesOfObjectsPassingTest:&__block_literal_global_97_1];
    if ([v49 count])
    {
      unint64_t v2 = (void *)[*(id *)(a1 + 40) mutableCopy];
      v60[0] = MEMORY[0x1E4F143A8];
      v60[1] = 3221225472;
      v60[2] = __94__EDRemoteContentManager__addRemoteContentLinks_andVerify_WithParsedLinks_defaultCharsetName___block_invoke_3;
      v60[3] = &unk_1E6C04F08;
      id v61 = *(id *)(a1 + 40);
      id v3 = v2;
      id v62 = v3;
      [v49 enumerateIndexesUsingBlock:v60];
      id v4 = v3;

      id v5 = v4;
    }
    else
    {
      id v5 = v50;
    }
    id v51 = v5;
    objc_msgSend(*(id *)(a1 + 32), "addRemoteContentLinks:requiredParsing:");
    _ef_log_EDRemoteContentManager();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = v51;
      unint64_t v8 = objc_msgSend(v7, "ef_map:", &__block_literal_global_293);
      id v9 = [v8 componentsJoinedByString:@", "];

      *(_DWORD *)buf = 138543362;
      id v64 = v9;
      _os_log_impl(&dword_1DB39C000, v6, OS_LOG_TYPE_DEFAULT, "Added URLs: %{public}@", buf, 0xCu);
    }
    if (!*(unsigned char *)(a1 + 56)) {
      goto LABEL_36;
    }
    v48 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v51];
    uint64_t v45 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:*(void *)(a1 + 48)];
    if (objc_msgSend(v48, "isEqualToSet:")) {
      goto LABEL_31;
    }
    id v10 = objc_msgSend(v48, "ef_setByRemovingObjectsFromSet:", v45);
    v46 = objc_msgSend(v45, "ef_setByRemovingObjectsFromSet:", v48);
    if ([v10 count] == 1 && objc_msgSend(v46, "count") == 1)
    {
      id v11 = [v10 anyObject];
      id v12 = [v46 anyObject];
      id v13 = [v12 scheme];
      if (objc_msgSend(v11, "ef_hasScheme:", v13))
      {
        uint64_t v14 = [v12 host];
        char v15 = objc_msgSend(v11, "ef_hasHost:", v14);

        if (v15)
        {

LABEL_31:
          __int16 v37 = _ef_log_EDRemoteContentManager();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1DB39C000, v37, OS_LOG_TYPE_DEFAULT, "Verification: URLs match parsed URLs", buf, 2u);
          }
          uint64_t v36 = 0;
          uint64_t v35 = 0;
          goto LABEL_34;
        }
      }
      else
      {
      }
      uint64_t v36 = (uint64_t)v46;
      uint64_t v35 = (uint64_t)v10;
    }
    else
    {
      id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      id v17 = v10;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v56 objects:v67 count:16];
      if (v18)
      {
        uint64_t v19 = *(void *)v57;
        do
        {
          uint64_t v20 = 0;
          do
          {
            if (*(void *)v57 != v19) {
              objc_enumerationMutation(v17);
            }
            uint64_t v21 = *(void **)(*((void *)&v56 + 1) + 8 * v20);
            id v22 = objc_msgSend(v21, "ef_caseNormalizedURL");

            if (v22)
            {
              uint64_t v23 = objc_msgSend(v21, "ef_caseNormalizedURL");
              [v16 setObject:v21 forKeyedSubscript:v23];
            }
            else
            {
              _ef_log_EDRemoteContentManager();
              uint64_t v23 = (id)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
              {
                id v24 = v21;
                if ([MEMORY[0x1E4F602E0] preferenceEnabled:13])
                {
                  double v25 = [v24 absoluteString];
                }
                else
                {
                  id v26 = (void *)MEMORY[0x1E4F60E00];
                  unint64_t v27 = [v24 absoluteString];
                  double v25 = [v26 fullyRedactedStringForString:v27];
                }
                id v28 = v25;
                uint64_t v29 = [v24 scheme];
                *(_DWORD *)buf = 138543618;
                id v64 = v28;
                __int16 v65 = 2114;
                long long v66 = v29;
                _os_log_error_impl(&dword_1DB39C000, v23, OS_LOG_TYPE_ERROR, "Invalid extra URL: %{public}@ with scheme: %{public}@", buf, 0x16u);
              }
            }

            ++v20;
          }
          while (v18 != v20);
          uint64_t v30 = [v17 countByEnumeratingWithState:&v56 objects:v67 count:16];
          uint64_t v18 = v30;
        }
        while (v30);
      }

      v31 = (void *)[v17 mutableCopy];
      v53[0] = MEMORY[0x1E4F143A8];
      v53[1] = 3221225472;
      v53[2] = __94__EDRemoteContentManager__addRemoteContentLinks_andVerify_WithParsedLinks_defaultCharsetName___block_invoke_107;
      v53[3] = &unk_1E6C04F30;
      id v32 = v16;
      id v54 = v32;
      id v33 = v31;
      id v55 = v33;
      id v34 = objc_msgSend(v46, "ef_filter:", v53);

      uint64_t v35 = objc_msgSend(v33, "ef_notEmpty");

      uint64_t v36 = objc_msgSend(v34, "ef_notEmpty");

      if (!(v35 | v36)) {
        goto LABEL_31;
      }
    }
    if ([(id)v35 count])
    {
      _ef_log_EDRemoteContentManager();
      id v38 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        __int16 v39 = [(id)v35 allObjects];
        unint64_t v40 = objc_msgSend(v39, "ef_map:", &__block_literal_global_293);
        uint64_t v41 = [v40 componentsJoinedByString:@", "];

        *(_DWORD *)buf = 138543362;
        id v64 = v41;
        _os_log_error_impl(&dword_1DB39C000, v38, OS_LOG_TYPE_ERROR, "Verification: Extra URLs: %{public}@", buf, 0xCu);
      }
    }
    if (![(id)v36 count]) {
      goto LABEL_35;
    }
    _ef_log_EDRemoteContentManager();
    __int16 v37 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      uint64_t v42 = [(id)v36 allObjects];
      uint64_t v43 = objc_msgSend(v42, "ef_map:", &__block_literal_global_293);
      v44 = [v43 componentsJoinedByString:@", "];

      *(_DWORD *)buf = 138543362;
      id v64 = v44;
      _os_log_error_impl(&dword_1DB39C000, v37, OS_LOG_TYPE_ERROR, "Verification: Missed URLs: %{public}@", buf, 0xCu);
    }
LABEL_34:

LABEL_35:
    id v52 = (id)v35;
    id v47 = (id)v36;
    AnalyticsSendEventLazy();
    [*(id *)(*(void *)(a1 + 32) + 56) performWhileLocked:&__block_literal_global_124];

LABEL_36:
  }
}

uint64_t __94__EDRemoteContentManager__addRemoteContentLinks_andVerify_WithParsedLinks_defaultCharsetName___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_msgSend(v2, "ef_hasScheme:", @"http")) {
    uint64_t v3 = [MEMORY[0x1E4F466F0] _willUpgradeToHTTPS:v2];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

void __94__EDRemoteContentManager__addRemoteContentLinks_andVerify_WithParsedLinks_defaultCharsetName___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v5 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
  id v4 = objc_msgSend(v5, "ef_urlByReplacingSchemeWithScheme:", @"https");
  [*(id *)(a1 + 40) setObject:v4 atIndexedSubscript:a2];
}

uint64_t __94__EDRemoteContentManager__addRemoteContentLinks_andVerify_WithParsedLinks_defaultCharsetName___block_invoke_107(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_msgSend(v3, "ef_caseNormalizedURL");
  if (v4
    && ([*(id *)(a1 + 32) objectForKeyedSubscript:v4],
        id v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    [*(id *)(a1 + 40) removeObject:v4];
    uint64_t v6 = 0;
  }
  else
  {
    _ef_log_EDRemoteContentManager();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = v3;
      if ([MEMORY[0x1E4F602E0] preferenceEnabled:13])
      {
        id v9 = [v8 absoluteString];
      }
      else
      {
        id v10 = (void *)MEMORY[0x1E4F60E00];
        id v11 = [v8 absoluteString];
        id v9 = [v10 fullyRedactedStringForString:v11];
      }
      id v12 = v9;
      id v13 = [v8 scheme];
      __94__EDRemoteContentManager__addRemoteContentLinks_andVerify_WithParsedLinks_defaultCharsetName___block_invoke_107_cold_1(v12, v13, v15, v7);
    }

    uint64_t v6 = 1;
  }

  return v6;
}

id __94__EDRemoteContentManager__addRemoteContentLinks_andVerify_WithParsedLinks_defaultCharsetName___block_invoke_112(uint64_t a1)
{
  v8[3] = *MEMORY[0x1E4F143B8];
  v7[0] = @"hadMismatches";
  id v2 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 48)];
  v8[0] = v2;
  v7[1] = @"extraCount";
  id v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v8[1] = v3;
  v7[2] = @"missedCount";
  id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "count"));
  v8[2] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:3];

  return v5;
}

void __94__EDRemoteContentManager__addRemoteContentLinks_andVerify_WithParsedLinks_defaultCharsetName___block_invoke_2_122(uint64_t a1, void *a2)
{
  for (id i = a2; (unint64_t)[i count] >= 0xA; objc_msgSend(i, "removeObjectAtIndex:", 0));
  id v2 = [MEMORY[0x1E4F1C9C8] date];
  [i addObject:v2];
}

- (void)addRemoteContentLinks:(id)a3 requiredParsing:(BOOL)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (([(EFCancelationToken *)self->_token isCanceled] & 1) == 0)
  {
    uint64_t v6 = [(EDRemoteContentManager *)self remoteContentPersistence];
    id v15 = 0;
    [v6 addRemoteContentLinks:v5 newLinks:&v15];
    id v7 = v15;

    uint64_t v13 = MEMORY[0x1E4F143A8];
    id v8 = v5;
    uint64_t v14 = v8;
    id v9 = v7;
    AnalyticsSendEventLazy();
    [(EDRemoteContentManager *)self _scheduleBackgroundRequests];
    _ef_log_EDRemoteContentManager();
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = objc_msgSend(v8, "ef_map:", &__block_literal_global_293);
      id v12 = [v11 componentsJoinedByString:@", "];

      *(_DWORD *)buf = 138543362;
      id v17 = v12;
      _os_log_impl(&dword_1DB39C000, v10, OS_LOG_TYPE_DEFAULT, "Parsed and added URLs: %{public}@", buf, 0xCu);
    }
  }
}

id __64__EDRemoteContentManager_addRemoteContentLinks_requiredParsing___block_invoke(uint64_t a1)
{
  v8[3] = *MEMORY[0x1E4F143B8];
  v7[0] = @"remoteContentLinks";
  id v2 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v8[0] = v2;
  v7[1] = @"newRemoteContentLinks";
  id v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "count"));
  v8[1] = v3;
  v7[2] = @"requiredParsing";
  id v4 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 48)];
  v8[2] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:3];

  return v5;
}

- (double)_getTimeout
{
  p_timeoutLocuint64_t k = &self->_timeoutLock;
  os_unfair_lock_lock(&self->_timeoutLock);
  id v4 = [(EDRemoteContentManager *)self timeoutLastUpdate];

  if (!v4
    || ([(EDRemoteContentManager *)self timeoutLastUpdate],
        id v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = objc_msgSend(v5, "ef_isMoreThanTimeIntervalAgo:", 86400.0),
        v5,
        v6))
  {
    [(EDRemoteContentManager *)self _updateTimeoutSettingDefaultIfNeeded:v4 == 0];
  }
  [(EDRemoteContentManager *)self minimumTimeout];
  double v8 = v7;
  [(EDRemoteContentManager *)self maximumTimeout];
  double v10 = v9;
  os_unfair_lock_unlock(p_timeoutLock);
  if (v10 < v8)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v13 = objc_msgSend(NSString, "stringWithUTF8String:", "double EFARC4RandomDoubleInRange(double, double)");
    [v12 handleFailureInFunction:v13 file:@"EFMathUtilities.h" lineNumber:54 description:@"max must not be less than min"];
  }
  return v8 + (v10 - v8) * ((double)arc4random() / 4294967300.0);
}

- (void)_updateTimeoutSettingDefaultIfNeeded:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1C9C8]);
  [(EDRemoteContentManager *)self setTimeoutLastUpdate:v5];

  int v6 = [(EDRemoteContentManager *)self _viewDurationsFromBiome];
  if (!v6)
  {
    double v7 = _ef_log_EDRemoteContentManager();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[EDRemoteContentManager _updateTimeoutSettingDefaultIfNeeded:](v7);
    }
  }
  if ((unint64_t)[v6 count] > 9)
  {
    uint32_t v10 = arc4random_uniform(3u);
    unsigned int v11 = v10;
    if (v10 - 1 >= 2)
    {
      double v19 = 0.0;
      double v20 = 0.0;
      if (v10)
      {
LABEL_23:
        -[EDRemoteContentManager setMinimumTimeout:](self, "setMinimumTimeout:", fmax(v19, 2.0), *(_OWORD *)v30, *(_OWORD *)&v30[16], *(void *)&v30[32], v31);
        [(EDRemoteContentManager *)self setMaximumTimeout:fmax(v20, 2.0)];
        goto LABEL_24;
      }
      id v26 = objc_msgSend(v6, "ef_min");
      [v26 doubleValue];
      double v19 = v27;

      id v28 = objc_msgSend(v6, "ef_max");
      [v28 doubleValue];
      double v20 = v29;

      uint64_t v21 = _ef_log_EDRemoteContentManager();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t v30 = 134218240;
        *(double *)&v30[4] = v19;
        *(_WORD *)&v30[12] = 2048;
        *(double *)&v30[14] = v20;
        uint64_t v23 = "Updating timeout values based on min and max: (%f, %f)";
        id v24 = v21;
        uint32_t v25 = 22;
LABEL_21:
        _os_log_impl(&dword_1DB39C000, v24, OS_LOG_TYPE_DEFAULT, v23, v30, v25);
      }
    }
    else
    {
      id v12 = objc_msgSend(v6, "ef_mean");
      [v12 doubleValue];
      double v14 = v13;

      id v15 = objc_msgSend(v6, "ef_standardDeviation");
      [v15 doubleValue];
      double v17 = v16;

      double v18 = v17 * (double)v11;
      double v19 = v14 - v18;
      double v20 = v14 + v18;
      uint64_t v21 = _ef_log_EDRemoteContentManager();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        id v22 = @"s";
        *(_DWORD *)uint64_t v30 = 67109890;
        *(_DWORD *)&v30[4] = v11;
        *(_WORD *)&v30[8] = 2114;
        if (v11 == 1) {
          id v22 = &stru_1F3583658;
        }
        *(void *)&v30[10] = v22;
        *(_WORD *)&v30[18] = 2048;
        *(double *)&v30[20] = v19;
        *(_WORD *)&v30[28] = 2048;
        *(double *)&v30[30] = v20;
        uint64_t v23 = "Updating timeout values based on mean and %u standard deviation%{public}@: (%f, %f)";
        id v24 = v21;
        uint32_t v25 = 38;
        goto LABEL_21;
      }
    }

    goto LABEL_23;
  }
  double v8 = _ef_log_EDRemoteContentManager();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v9)
    {
      *(_WORD *)uint64_t v30 = 0;
      _os_log_impl(&dword_1DB39C000, v8, OS_LOG_TYPE_DEFAULT, "Using default timeout values", v30, 2u);
    }

    [(EDRemoteContentManager *)self setMinimumTimeout:2.0];
    [(EDRemoteContentManager *)self setMaximumTimeout:600.0];
  }
  else
  {
    if (v9)
    {
      *(_WORD *)uint64_t v30 = 0;
      _os_log_impl(&dword_1DB39C000, v8, OS_LOG_TYPE_DEFAULT, "Leaving timeout values unchanged", v30, 2u);
    }
  }
LABEL_24:
}

- (id)_viewDurationsFromBiome
{
  id v2 = [MEMORY[0x1E4F60208] url];
  BOOL v3 = v2;
  if (v2)
  {
    id v4 = (void *)MEMORY[0x1E4F50278];
    id v5 = [v2 path];
    int v6 = (void *)[v4 newPrivateStreamDefaultConfigurationWithStoreBasePath:v5];

    id v7 = objc_alloc(MEMORY[0x1E4F50490]);
    double v8 = (void *)[v7 initWithPrivateStreamIdentifier:*MEMORY[0x1E4F60538] storeConfig:v6];
    BOOL v9 = [v8 publisherFromStartTime:CFAbsoluteTimeGetCurrent() + -604800.0];
    uint64_t v15 = 0;
    double v16 = &v15;
    uint64_t v17 = 0x3032000000;
    double v18 = __Block_byref_object_copy__31;
    double v19 = __Block_byref_object_dispose__31;
    id v20 = (id)0xAAAAAAAAAAAAAAAALL;
    id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __49__EDRemoteContentManager__viewDurationsFromBiome__block_invoke;
    v14[3] = &unk_1E6C04FA0;
    v14[4] = &v15;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __49__EDRemoteContentManager__viewDurationsFromBiome__block_invoke_2;
    v13[3] = &unk_1E6C04FC8;
    v13[4] = &v15;
    id v10 = (id)[v9 sinkWithCompletion:v14 receiveInput:v13];
    id v11 = (id)v16[5];
    _Block_object_dispose(&v15, 8);
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

void __49__EDRemoteContentManager__viewDurationsFromBiome__block_invoke(uint64_t a1, void *a2)
{
  if ([a2 state])
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = 0;
  }
}

void __49__EDRemoteContentManager__viewDurationsFromBiome__block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = [a2 eventBody];
  uint64_t v3 = [v7 eventName];
  char v4 = [v3 isEqualToString:*MEMORY[0x1E4F60558]];

  if (v4)
  {
    id v5 = [v7 payload];
    int v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F60570]];
    if (v6) {
      [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v6];
    }
  }
}

- (void)noteViewOfRemoteContentLinks:(id)a3
{
  id v4 = a3;
  id v5 = _os_activity_create(&dword_1DB39C000, "-[EDRemoteContentManager noteViewOfRemoteContentLinks:]", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v5, &state);
  if ([v4 count])
  {
    int v6 = [(EDRemoteContentManager *)self backgroundWorkScheduler];
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    uint64_t v15 = __55__EDRemoteContentManager_noteViewOfRemoteContentLinks___block_invoke;
    double v16 = &unk_1E6BFFAF0;
    id v7 = v4;
    id v17 = v7;
    double v18 = self;
    [v6 performBlock:&v13];

    double v8 = objc_msgSend(MEMORY[0x1E4F28F80], "processInfo", v13, v14, v15, v16);
    if (([v8 isLowPowerModeEnabled] & 1) == 0)
    {
      BOOL v9 = [MEMORY[0x1E4F60DD0] external];
      if (![v9 isConstrained])
      {
        uint32_t v10 = arc4random_uniform(4u);

        if (!v10)
        {
          unint64_t v11 = [v7 count];
          if (v11 >= 6)
          {
            EFARC4NormallyDistributedRandomDoubleInRange();
            unint64_t v11 = (unint64_t)v12;
          }
          EFARC4NormallyDistributedRandomDoubleWithMinimum();
          -[EDRemoteContentManager _scheduleRequestForLinks:unconditionally:withDelay:completionHandler:](self, "_scheduleRequestForLinks:unconditionally:withDelay:completionHandler:", v11, 1, 0);
        }
        goto LABEL_6;
      }
    }
LABEL_6:
  }
  os_activity_scope_leave(&state);
}

void __55__EDRemoteContentManager_noteViewOfRemoteContentLinks___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  _ef_log_EDRemoteContentManager();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = *(id *)(a1 + 32);
    id v4 = objc_msgSend(v3, "ef_map:", &__block_literal_global_293);
    id v5 = [v4 componentsJoinedByString:@", "];

    int v7 = 138543362;
    double v8 = v5;
    _os_log_impl(&dword_1DB39C000, v2, OS_LOG_TYPE_DEFAULT, "Viewed URLs: %{public}@", (uint8_t *)&v7, 0xCu);
  }
  int v6 = [*(id *)(a1 + 40) remoteContentPersistence];
  [v6 updateRequestCountForRemoteContentLinks:*(void *)(a1 + 32) updateLastSeen:1];
}

- (void)test_tearDown
{
  if ((EFIsRunningUnitTests() & 1) == 0)
  {
    int v6 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"EDRemoteContentManager.m", 904, @"%s can only be called from unit tests", "-[EDRemoteContentManager test_tearDown]");
  }
  [(EFCancelationToken *)self->_token cancel];
  id v4 = [(EDRemoteContentManager *)self backgroundWorkScheduler];
  [v4 performSyncBlock:&__block_literal_global_155];

  os_unfair_lock_lock(&self->_requestSchedulerLock);
  [(NSBackgroundActivityScheduler *)self->_requestScheduler invalidate];
  os_unfair_lock_unlock(&self->_requestSchedulerLock);
  [(NSLock *)self->_requestLock lock];
  requestLocuint64_t k = self->_requestLock;

  [(NSLock *)requestLock unlock];
}

- (EDRemoteContentPersistence)remoteContentPersistence
{
  return self->_remoteContentPersistence;
}

- (EMRemoteContentURLSession)urlSession
{
  return self->_urlSession;
}

- (EFScheduler)backgroundWorkScheduler
{
  return self->_backgroundWorkScheduler;
}

- (NSLock)requestLock
{
  return self->_requestLock;
}

- (unint64_t)requestedSinceLastPrune
{
  return self->_requestedSinceLastPrune;
}

- (void)setRequestedSinceLastPrune:(unint64_t)a3
{
  self->_requestedSinceLastPrune = a3;
}

- (double)minimumTimeout
{
  return self->_minimumTimeout;
}

- (void)setMinimumTimeout:(double)a3
{
  self->_minimumTimeout = a3;
}

- (double)maximumTimeout
{
  return self->_maximumTimeout;
}

- (void)setMaximumTimeout:(double)a3
{
  self->_maximumTimeout = a3;
}

- (NSDate)timeoutLastUpdate
{
  return self->_timeoutLastUpdate;
}

- (void)setTimeoutLastUpdate:(id)a3
{
}

- (double)requestInterval
{
  return self->_requestInterval;
}

- (void)setRequestInterval:(double)a3
{
  self->_requestInterval = a3;
}

- (unint64_t)batchSize
{
  return self->_batchSize;
}

- (void)setBatchSize:(unint64_t)a3
{
  self->_batchSize = a3;
}

- (NSDate)schedulingLastUpdate
{
  return self->_schedulingLastUpdate;
}

- (void)setSchedulingLastUpdate:(id)a3
{
}

- (EDRemoteContentManagerTestDelegate)testDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_testDelegate);

  return (EDRemoteContentManagerTestDelegate *)WeakRetained;
}

- (void)setTestDelegate:(id)a3
{
}

- (id)requestSchedulerBlock
{
  return self->_requestSchedulerBlock;
}

- (void)setRequestSchedulerBlock:(id)a3
{
}

- (unint64_t)pruneFrequency
{
  return self->_pruneFrequency;
}

- (void)setPruneFrequency:(unint64_t)a3
{
  self->_pruneFrequency = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_requestSchedulerBlock, 0);
  objc_destroyWeak((id *)&self->_testDelegate);
  objc_storeStrong((id *)&self->_schedulingLastUpdate, 0);
  objc_storeStrong((id *)&self->_timeoutLastUpdate, 0);
  objc_storeStrong((id *)&self->_requestLock, 0);
  objc_storeStrong((id *)&self->_backgroundWorkScheduler, 0);
  objc_storeStrong((id *)&self->_urlSession, 0);
  objc_storeStrong((id *)&self->_remoteContentPersistence, 0);
  objc_storeStrong((id *)&self->_remoteLinkVerificationTimes, 0);
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_unconditionalRequestScheduler, 0);

  objc_storeStrong((id *)&self->_requestScheduler, 0);
}

void __94__EDRemoteContentManager__addRemoteContentLinks_andVerify_WithParsedLinks_defaultCharsetName___block_invoke_107_cold_1(void *a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1DB39C000, log, OS_LOG_TYPE_ERROR, "Invalid missedLink URL: %{public}@ with scheme: %{public}@", buf, 0x16u);
}

- (void)_updateTimeoutSettingDefaultIfNeeded:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DB39C000, log, OS_LOG_TYPE_ERROR, "Unable to get view durations from Biome", v1, 2u);
}

@end