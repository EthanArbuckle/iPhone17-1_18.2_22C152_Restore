@interface ACHGizmoAwardingScheduler
- (ACHGizmoAwardingScheduler)initWithClient:(id)a3 dataStore:(id)a4 awardingEngine:(id)a5;
- (ACHGizmoAwardingScheduler)initWithProfile:(id)a3 dataStore:(id)a4 awardingEngine:(id)a5;
- (double)retryInterval;
- (double)retryLeeway;
- (id)diagnosticDescription;
- (id)scheduledEvaluationCompleteBlock;
- (void)_queue_cancelRetryAwardingEvaluationTimer;
- (void)_queue_handleProtectedDataChange:(BOOL)a3;
- (void)_queue_requestRetryingAwardingEvaluationWithCompletion:(id)a3;
- (void)_queue_scheduleRetryAwardingEvaluation;
- (void)_startUp;
- (void)activate;
- (void)dataStoreDidPopulate:(id)a3;
- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4;
- (void)dealloc;
- (void)performAfterFirstEvaluation:(id)a3;
- (void)requestAwardingEvaluationWithCompletion:(id)a3;
- (void)setRetryInterval:(double)a3;
- (void)setRetryLeeway:(double)a3;
- (void)setScheduledEvaluationCompleteBlock:(id)a3;
@end

@implementation ACHGizmoAwardingScheduler

- (ACHGizmoAwardingScheduler)initWithClient:(id)a3 dataStore:(id)a4 awardingEngine:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)ACHGizmoAwardingScheduler;
  v11 = [(ACHGizmoAwardingScheduler *)&v18 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_client, v8);
    objc_storeWeak((id *)&v12->_dataStore, v9);
    objc_storeWeak((id *)&v12->_awardingEngine, v10);
    v12->_dataStoreHasPopulated = 0;
    v13 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    blocksWaitingOnFirstEvaluation = v12->_blocksWaitingOnFirstEvaluation;
    v12->_blocksWaitingOnFirstEvaluation = v13;

    uint64_t v15 = HKCreateSerialDispatchQueue();
    internalQueue = v12->_internalQueue;
    v12->_internalQueue = (OS_dispatch_queue *)v15;

    *(_OWORD *)&v12->_retryInterval = xmmword_21F65F5D0;
  }

  return v12;
}

- (ACHGizmoAwardingScheduler)initWithProfile:(id)a3 dataStore:(id)a4 awardingEngine:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)ACHGizmoAwardingScheduler;
  v11 = [(ACHGizmoAwardingScheduler *)&v21 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_profile, v8);
    objc_storeWeak((id *)&v12->_dataStore, v9);
    objc_storeWeak((id *)&v12->_awardingEngine, v10);
    v12->_dataStoreHasPopulated = 0;
    v13 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    blocksWaitingOnFirstEvaluation = v12->_blocksWaitingOnFirstEvaluation;
    v12->_blocksWaitingOnFirstEvaluation = v13;

    uint64_t v15 = HKCreateSerialDispatchQueue();
    internalQueue = v12->_internalQueue;
    v12->_internalQueue = (OS_dispatch_queue *)v15;

    *(_OWORD *)&v12->_retryInterval = xmmword_21F65F5D0;
    v17 = [MEMORY[0x263F43498] sharedDiagnosticManager];
    [v17 addObject:v12];

    id WeakRetained = objc_loadWeakRetained((id *)&v12->_profile);
    v19 = [WeakRetained daemon];
    [v19 registerForDaemonReady:v12];
  }
  return v12;
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataStore);
  [WeakRetained removeObserver:self];

  if (notify_is_valid_token(self->_protectedDataToken)) {
    notify_cancel(self->_protectedDataToken);
  }
  v4.receiver = self;
  v4.super_class = (Class)ACHGizmoAwardingScheduler;
  [(ACHGizmoAwardingScheduler *)&v4 dealloc];
}

- (void)activate
{
  v3 = ACHLogAwardScheduling();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v4 = 0;
    _os_log_impl(&dword_21F5DA000, v3, OS_LOG_TYPE_DEFAULT, "Activating gizmo scheduler", v4, 2u);
  }

  [(ACHGizmoAwardingScheduler *)self _startUp];
}

- (void)_startUp
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataStore);
  [WeakRetained addObserver:self];

  id v4 = objc_loadWeakRetained((id *)&self->_profile);
  v5 = [v4 database];
  [v5 addProtectedDataObserver:self];

  id v6 = objc_loadWeakRetained((id *)&self->_profile);
  v7 = [v6 database];
  internalQueue = self->_internalQueue;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __37__ACHGizmoAwardingScheduler__startUp__block_invoke;
  v12[3] = &unk_264515DB8;
  v12[4] = self;
  [v7 performWhenDataProtectedByFirstUnlockIsAvailableOnQueue:internalQueue block:v12];

  id v9 = (const char *)[(id)*MEMORY[0x263F235A8] UTF8String];
  id v10 = self->_internalQueue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __37__ACHGizmoAwardingScheduler__startUp__block_invoke_287;
  v11[3] = &unk_2645170E0;
  v11[4] = self;
  notify_register_dispatch(v9, &self->_protectedDataToken, v10, v11);
}

uint64_t __37__ACHGizmoAwardingScheduler__startUp__block_invoke(uint64_t result)
{
  if (*(unsigned char *)(*(void *)(result + 32) + 66))
  {
    uint64_t v1 = result;
    v2 = ACHLogAwardScheduling();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_21F5DA000, v2, OS_LOG_TYPE_DEFAULT, "Daemon ready and first unlock complete, scheduling immediate evaluation", v3, 2u);
    }

    return objc_msgSend(*(id *)(v1 + 32), "_queue_requestRetryingAwardingEvaluationWithCompletion:", 0);
  }
  return result;
}

void __37__ACHGizmoAwardingScheduler__startUp__block_invoke_287(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 66))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v1 + 8));
    objc_msgSend((id)v1, "_queue_handleProtectedDataChange:", objc_msgSend(WeakRetained, "isProtectedDataAvailable"));
  }
}

- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4
{
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __70__ACHGizmoAwardingScheduler_database_protectedDataDidBecomeAvailable___block_invoke;
  v5[3] = &unk_264516530;
  v5[4] = self;
  BOOL v6 = a4;
  dispatch_async(internalQueue, v5);
}

unsigned char *__70__ACHGizmoAwardingScheduler_database_protectedDataDidBecomeAvailable___block_invoke(uint64_t a1)
{
  result = *(unsigned char **)(a1 + 32);
  if (result[66]) {
    return (unsigned char *)objc_msgSend(result, "_queue_handleProtectedDataChange:", *(unsigned __int8 *)(a1 + 40));
  }
  return result;
}

- (void)_queue_handleProtectedDataChange:(BOOL)a3
{
  BOOL v3 = a3;
  [(ACHGizmoAwardingScheduler *)self _queue_cancelRetryAwardingEvaluationTimer];
  if (v3 && self->_needsRetry)
  {
    v5 = ACHLogAwardScheduling();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v6 = 0;
      _os_log_impl(&dword_21F5DA000, v5, OS_LOG_TYPE_DEFAULT, "Protected data available and retry needed, scheduling immediate evaluation", v6, 2u);
    }

    [(ACHGizmoAwardingScheduler *)self _queue_requestRetryingAwardingEvaluationWithCompletion:0];
  }
}

- (id)diagnosticDescription
{
  return @"Gizmo Awarding Scheduler";
}

- (void)requestAwardingEvaluationWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = ACHLogAwardScheduling();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_21F5DA000, v5, OS_LOG_TYPE_DEFAULT, "Awarding evaluation requested", v7, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_awardingEngine);
  [WeakRetained requestHistoricalEvaluationForAllSourcesWithCompletion:v4];
}

- (void)dataStoreDidPopulate:(id)a3
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__ACHGizmoAwardingScheduler_dataStoreDidPopulate___block_invoke;
  block[3] = &unk_264515DB8;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

uint64_t __50__ACHGizmoAwardingScheduler_dataStoreDidPopulate___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 66) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_queue_requestRetryingAwardingEvaluationWithCompletion:", 0);
}

- (void)_queue_requestRetryingAwardingEvaluationWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  v5 = ACHLogAwardScheduling();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21F5DA000, v5, OS_LOG_TYPE_DEFAULT, "Retrying awarding evaluation requested", buf, 2u);
  }

  self->_needsRetry = 0;
  [(ACHGizmoAwardingScheduler *)self _queue_cancelRetryAwardingEvaluationTimer];
  *(void *)buf = 0;
  v12 = buf;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__13;
  uint64_t v15 = __Block_byref_object_dispose__13;
  [@"com.apple.activityawardsd.watch.full_history_evaluation" UTF8String];
  id v16 = (id)os_transaction_create();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_awardingEngine);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __84__ACHGizmoAwardingScheduler__queue_requestRetryingAwardingEvaluationWithCompletion___block_invoke;
  v8[3] = &unk_264517130;
  v8[4] = self;
  id v7 = v4;
  id v9 = v7;
  id v10 = buf;
  [WeakRetained requestHistoricalEvaluationForAllSourcesWithCompletion:v8];

  _Block_object_dispose(buf, 8);
}

void __84__ACHGizmoAwardingScheduler__queue_requestRetryingAwardingEvaluationWithCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(NSObject **)(v6 + 48);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __84__ACHGizmoAwardingScheduler__queue_requestRetryingAwardingEvaluationWithCompletion___block_invoke_2;
  block[3] = &unk_264517108;
  char v16 = a2;
  id v12 = v5;
  uint64_t v13 = v6;
  id v8 = *(id *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 48);
  id v14 = v8;
  uint64_t v15 = v9;
  id v10 = v5;
  dispatch_async(v7, block);
}

void __84__ACHGizmoAwardingScheduler__queue_requestRetryingAwardingEvaluationWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (!*(unsigned char *)(a1 + 64) || *(void *)(a1 + 32))
  {
    *(unsigned char *)(*(void *)(a1 + 40) + 64) = 1;
    objc_msgSend(*(id *)(a1 + 40), "_queue_scheduleRetryAwardingEvaluation");
  }
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(v2 + 88);
  if (v3)
  {
    (*(void (**)(uint64_t, void, void))(v3 + 16))(v3, *(unsigned __int8 *)(a1 + 64), *(void *)(a1 + 32));
    uint64_t v2 = *(void *)(a1 + 40);
  }
  if (!*(unsigned char *)(v2 + 65))
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v4 = *(id *)(v2 + 40);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v13;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v12 + 1) + 8 * v8) + 16))(*(void *)(*((void *)&v12 + 1) + 8 * v8));
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v6);
    }

    objc_msgSend(*(id *)(*(void *)(a1 + 40) + 40), "removeAllObjects", (void)v12);
    *(unsigned char *)(*(void *)(a1 + 40) + 65) = 1;
  }
  uint64_t v9 = *(void *)(a1 + 48);
  if (v9) {
    (*(void (**)(uint64_t, void, void))(v9 + 16))(v9, *(unsigned __int8 *)(a1 + 64), *(void *)(a1 + 32));
  }
  uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
  v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = 0;
}

- (void)_queue_scheduleRetryAwardingEvaluation
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  if (self->_dataStoreHasPopulated)
  {
    int64_t v3 = (unint64_t)(self->_retryInterval * 1000000000.0);
    uint64_t v4 = (unint64_t)(self->_retryLeeway * 1000000000.0);
    uint64_t v5 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)self->_internalQueue);
    retryTimer = self->_retryTimer;
    self->_retryTimer = v5;

    uint64_t v7 = self->_retryTimer;
    dispatch_time_t v8 = dispatch_time(0, v3);
    dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, v4);
    uint64_t v9 = self->_retryTimer;
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __67__ACHGizmoAwardingScheduler__queue_scheduleRetryAwardingEvaluation__block_invoke;
    handler[3] = &unk_264515DB8;
    handler[4] = self;
    dispatch_source_set_event_handler(v9, handler);
    dispatch_resume((dispatch_object_t)self->_retryTimer);
  }
}

uint64_t __67__ACHGizmoAwardingScheduler__queue_scheduleRetryAwardingEvaluation__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_requestRetryingAwardingEvaluationWithCompletion:", 0);
}

- (void)_queue_cancelRetryAwardingEvaluationTimer
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  retryTimer = self->_retryTimer;
  if (retryTimer)
  {
    dispatch_source_cancel(retryTimer);
    uint64_t v4 = self->_retryTimer;
    self->_retryTimer = 0;
  }
}

- (void)performAfterFirstEvaluation:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__ACHGizmoAwardingScheduler_performAfterFirstEvaluation___block_invoke;
  v7[3] = &unk_264517070;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

void __57__ACHGizmoAwardingScheduler_performAfterFirstEvaluation___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 65))
  {
    uint64_t v2 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v2();
  }
  else
  {
    int64_t v3 = *(void **)(v1 + 40);
    id v5 = (id)[*(id *)(a1 + 40) copy];
    id v4 = (void *)MEMORY[0x223C507A0]();
    [v3 addObject:v4];
  }
}

- (double)retryInterval
{
  return self->_retryInterval;
}

- (void)setRetryInterval:(double)a3
{
  self->_retryInterval = a3;
}

- (double)retryLeeway
{
  return self->_retryLeeway;
}

- (void)setRetryLeeway:(double)a3
{
  self->_retryLeeway = a3;
}

- (id)scheduledEvaluationCompleteBlock
{
  return self->_scheduledEvaluationCompleteBlock;
}

- (void)setScheduledEvaluationCompleteBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_scheduledEvaluationCompleteBlock, 0);
  objc_storeStrong((id *)&self->_retryTimer, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_blocksWaitingOnFirstEvaluation, 0);
  objc_destroyWeak((id *)&self->_awardingEngine);
  objc_destroyWeak((id *)&self->_dataStore);
  objc_destroyWeak((id *)&self->_profile);
  objc_destroyWeak((id *)&self->_client);
}

@end