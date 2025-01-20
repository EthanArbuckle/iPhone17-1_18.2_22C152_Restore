@interface MSASGroupedQueue
- (BOOL)hasEnqueuedItems;
- (BOOL)isAssertingBusyAssertion;
- (BOOL)isShuttingDown;
- (BOOL)memberQueueIsAssertingBusyAssertion;
- (MSASGroupedQueue)init;
- (MSASServerSideModel)model;
- (MSTimerGate)idleTimerGate;
- (MSTimerGate)stalenessTimerGate;
- (OS_dispatch_queue)memberQueue;
- (OS_dispatch_queue)workQueue;
- (double)maxGroupedCallbackEventIdleInterval;
- (double)maxGroupedCallbackEventStaleness;
- (int)maxGroupedCallbackEventBatchCount;
- (void)assertBusyAssertion;
- (void)deassertBusyAssertion;
- (void)flushQueueCompletionBlock:(id)a3;
- (void)memberQueueSetIsAssertingBusyAssertion:(BOOL)a3;
- (void)setIdleTimerGate:(id)a3;
- (void)setIsShuttingDown:(BOOL)a3;
- (void)setMaxGroupedCallbackEventBatchCount:(int)a3;
- (void)setMaxGroupedCallbackEventIdleInterval:(double)a3;
- (void)setMaxGroupedCallbackEventStaleness:(double)a3;
- (void)setMemberQueue:(id)a3;
- (void)setModel:(id)a3;
- (void)setStalenessTimerGate:(id)a3;
- (void)setWorkQueue:(id)a3;
- (void)shutDownFlush:(BOOL)a3 completionBlock:(id)a4;
- (void)workQueueAssertBusyAssertion;
- (void)workQueueClearIdleTimer;
- (void)workQueueClearStalenessTimer;
- (void)workQueueDeassertBusyAssertion;
- (void)workQueueDidEnqueueFirstItem;
- (void)workQueueDidEnqueueSubsequentItem;
- (void)workQueueRestartIdleTimer;
- (void)workQueueRestartStalenessTimer;
@end

@implementation MSASGroupedQueue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stalenessTimerGate, 0);
  objc_storeStrong((id *)&self->_idleTimerGate, 0);
  objc_storeStrong((id *)&self->_memberQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_model);
}

- (void)setIsShuttingDown:(BOOL)a3
{
  self->_isShuttingDown = a3;
}

- (BOOL)isShuttingDown
{
  return self->_isShuttingDown;
}

- (void)setStalenessTimerGate:(id)a3
{
}

- (MSTimerGate)stalenessTimerGate
{
  return self->_stalenessTimerGate;
}

- (void)setIdleTimerGate:(id)a3
{
}

- (MSTimerGate)idleTimerGate
{
  return self->_idleTimerGate;
}

- (void)setMemberQueue:(id)a3
{
}

- (OS_dispatch_queue)memberQueue
{
  return self->_memberQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (MSASServerSideModel)model
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_model);
  return (MSASServerSideModel *)WeakRetained;
}

- (void)workQueueDidEnqueueSubsequentItem
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if ([(MSASGroupedQueue *)self isShuttingDown])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v3 = 138543362;
      v4 = self;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Not enqueueing subsequent item because we're shutting down.", (uint8_t *)&v3, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      int v3 = 138543362;
      v4 = self;
      _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: Enqueueing subsequent item.", (uint8_t *)&v3, 0xCu);
    }
    [(MSASGroupedQueue *)self workQueueRestartIdleTimer];
  }
}

- (void)workQueueDidEnqueueFirstItem
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if ([(MSASGroupedQueue *)self isShuttingDown])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v3 = 138543362;
      v4 = self;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Not enqueueing first item because we're shutting down.", (uint8_t *)&v3, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      int v3 = 138543362;
      v4 = self;
      _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: Enqueueing first item.", (uint8_t *)&v3, 0xCu);
    }
    [(MSASGroupedQueue *)self workQueueAssertBusyAssertion];
    [(MSASGroupedQueue *)self workQueueRestartStalenessTimer];
  }
}

- (void)workQueueClearStalenessTimer
{
  int v3 = [(MSASGroupedQueue *)self stalenessTimerGate];

  if (v3)
  {
    v4 = [(MSASGroupedQueue *)self stalenessTimerGate];
    [v4 disable];

    [(MSASGroupedQueue *)self setStalenessTimerGate:0];
  }
}

- (void)workQueueRestartStalenessTimer
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    v14 = self;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: Restarting staleness timer.", buf, 0xCu);
  }
  int v3 = [(MSASGroupedQueue *)self stalenessTimerGate];

  if (v3)
  {
    v4 = [(MSASGroupedQueue *)self stalenessTimerGate];
    [v4 disable];
  }
  uint64_t v5 = objc_alloc_init(MSTimerGate);
  [(MSASGroupedQueue *)self setStalenessTimerGate:v5];
  [(MSASGroupedQueue *)self maxGroupedCallbackEventStaleness];
  dispatch_time_t v7 = dispatch_time(0, (uint64_t)(v6 * 1000000000.0));
  v8 = [(MSASGroupedQueue *)self workQueue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __50__MSASGroupedQueue_workQueueRestartStalenessTimer__block_invoke;
  v10[3] = &unk_1E6C3DB28;
  v11 = v5;
  v12 = self;
  v9 = v5;
  dispatch_after(v7, v8, v10);
}

uint64_t __50__MSASGroupedQueue_workQueueRestartStalenessTimer__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t result = [*(id *)(a1 + 32) enabled];
  if (result)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      uint64_t v3 = *(void *)(a1 + 40);
      int v4 = 138543362;
      uint64_t v5 = v3;
      _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: Staleness timer fired.", (uint8_t *)&v4, 0xCu);
    }
    [*(id *)(a1 + 40) assertBusyAssertion];
    [*(id *)(a1 + 40) workQueueFlushQueue];
    return [*(id *)(a1 + 40) deassertBusyAssertion];
  }
  return result;
}

- (void)workQueueClearIdleTimer
{
  uint64_t v3 = [(MSASGroupedQueue *)self idleTimerGate];

  if (v3)
  {
    int v4 = [(MSASGroupedQueue *)self idleTimerGate];
    [v4 disable];

    [(MSASGroupedQueue *)self setIdleTimerGate:0];
  }
}

- (void)workQueueRestartIdleTimer
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    v14 = self;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: Restarting idle timer.", buf, 0xCu);
  }
  uint64_t v3 = [(MSASGroupedQueue *)self idleTimerGate];

  if (v3)
  {
    int v4 = [(MSASGroupedQueue *)self idleTimerGate];
    [v4 disable];
  }
  uint64_t v5 = objc_alloc_init(MSTimerGate);
  [(MSASGroupedQueue *)self setIdleTimerGate:v5];
  [(MSASGroupedQueue *)self maxGroupedCallbackEventIdleInterval];
  dispatch_time_t v7 = dispatch_time(0, (uint64_t)(v6 * 1000000000.0));
  v8 = [(MSASGroupedQueue *)self workQueue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __45__MSASGroupedQueue_workQueueRestartIdleTimer__block_invoke;
  v10[3] = &unk_1E6C3DB28;
  v11 = v5;
  v12 = self;
  v9 = v5;
  dispatch_after(v7, v8, v10);
}

uint64_t __45__MSASGroupedQueue_workQueueRestartIdleTimer__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t result = [*(id *)(a1 + 32) enabled];
  if (result)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      uint64_t v3 = *(void *)(a1 + 40);
      int v4 = 138543362;
      uint64_t v5 = v3;
      _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: Idle timer fired.", (uint8_t *)&v4, 0xCu);
    }
    [*(id *)(a1 + 40) assertBusyAssertion];
    [*(id *)(a1 + 40) workQueueFlushQueue];
    return [*(id *)(a1 + 40) deassertBusyAssertion];
  }
  return result;
}

- (BOOL)hasEnqueuedItems
{
  return 0;
}

- (void)flushQueueCompletionBlock:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    v10 = self;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: Flushing queue.", buf, 0xCu);
  }
  [(MSASGroupedQueue *)self assertBusyAssertion];
  uint64_t v5 = [(MSASGroupedQueue *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__MSASGroupedQueue_flushQueueCompletionBlock___block_invoke;
  v7[3] = &unk_1E6C3DB00;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __46__MSASGroupedQueue_flushQueueCompletionBlock___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) workQueueClearIdleTimer];
  [*(id *)(a1 + 32) workQueueClearStalenessTimer];
  [*(id *)(a1 + 32) workQueueFlushQueue];
  [*(id *)(a1 + 32) deassertBusyAssertion];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)shutDownFlush:(BOOL)a3 completionBlock:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    v13 = self;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: Shutting down.", buf, 0xCu);
  }
  dispatch_time_t v7 = [(MSASGroupedQueue *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__MSASGroupedQueue_shutDownFlush_completionBlock___block_invoke;
  block[3] = &unk_1E6C3DAD8;
  BOOL v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, block);
}

uint64_t __50__MSASGroupedQueue_shutDownFlush_completionBlock___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setIsShuttingDown:1];
  [*(id *)(a1 + 32) workQueueClearIdleTimer];
  [*(id *)(a1 + 32) workQueueClearStalenessTimer];
  if (*(unsigned char *)(a1 + 48)) {
    [*(id *)(a1 + 32) workQueueFlushQueue];
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)memberQueueSetIsAssertingBusyAssertion:(BOOL)a3
{
  self->_isAssertingBusyAssertion = a3;
}

- (BOOL)memberQueueIsAssertingBusyAssertion
{
  return self->_isAssertingBusyAssertion;
}

- (BOOL)isAssertingBusyAssertion
{
  v2 = self;
  uint64_t v6 = 0;
  dispatch_time_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  uint64_t v3 = [(MSASGroupedQueue *)self memberQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__MSASGroupedQueue_isAssertingBusyAssertion__block_invoke;
  v5[3] = &unk_1E6C3DA60;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __44__MSASGroupedQueue_isAssertingBusyAssertion__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) memberQueueIsAssertingBusyAssertion];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)workQueueDeassertBusyAssertion
{
  uint64_t v3 = [(MSASGroupedQueue *)self memberQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__MSASGroupedQueue_workQueueDeassertBusyAssertion__block_invoke;
  block[3] = &unk_1E6C3DA38;
  block[4] = self;
  dispatch_barrier_async(v3, block);
}

void __50__MSASGroupedQueue_workQueueDeassertBusyAssertion__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) memberQueueIsAssertingBusyAssertion])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      int v4 = 138543362;
      uint64_t v5 = v3;
      _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: Deasserting busy assertion.", (uint8_t *)&v4, 0xCu);
    }
    [*(id *)(a1 + 32) memberQueueSetIsAssertingBusyAssertion:0];
    v2 = [*(id *)(a1 + 32) model];
    [v2 releaseBusy];
  }
}

- (void)workQueueAssertBusyAssertion
{
  uint64_t v3 = [(MSASGroupedQueue *)self memberQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__MSASGroupedQueue_workQueueAssertBusyAssertion__block_invoke;
  block[3] = &unk_1E6C3DA38;
  block[4] = self;
  dispatch_barrier_async(v3, block);
}

void __48__MSASGroupedQueue_workQueueAssertBusyAssertion__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (([*(id *)(a1 + 32) memberQueueIsAssertingBusyAssertion] & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      int v4 = 138543362;
      uint64_t v5 = v3;
      _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: Asserting busy assertion.", (uint8_t *)&v4, 0xCu);
    }
    [*(id *)(a1 + 32) memberQueueSetIsAssertingBusyAssertion:1];
    v2 = [*(id *)(a1 + 32) model];
    [v2 retainBusy];
  }
}

- (void)deassertBusyAssertion
{
  uint64_t v3 = [(MSASGroupedQueue *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__MSASGroupedQueue_deassertBusyAssertion__block_invoke;
  block[3] = &unk_1E6C3DA38;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __41__MSASGroupedQueue_deassertBusyAssertion__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) workQueueDeassertBusyAssertion];
}

- (void)assertBusyAssertion
{
  uint64_t v3 = [(MSASGroupedQueue *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__MSASGroupedQueue_assertBusyAssertion__block_invoke;
  block[3] = &unk_1E6C3DA38;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __39__MSASGroupedQueue_assertBusyAssertion__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) workQueueAssertBusyAssertion];
}

- (void)setMaxGroupedCallbackEventIdleInterval:(double)a3
{
  uint64_t v5 = [(MSASGroupedQueue *)self memberQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__MSASGroupedQueue_setMaxGroupedCallbackEventIdleInterval___block_invoke;
  v6[3] = &unk_1E6C3DAB0;
  v6[4] = self;
  *(double *)&v6[5] = a3;
  dispatch_barrier_async(v5, v6);
}

double __59__MSASGroupedQueue_setMaxGroupedCallbackEventIdleInterval___block_invoke(uint64_t a1)
{
  double result = *(double *)(a1 + 40);
  *(double *)(*(void *)(a1 + 32) + 40) = result;
  return result;
}

- (double)maxGroupedCallbackEventIdleInterval
{
  uint64_t v7 = 0;
  uint64_t v8 = (double *)&v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  uint64_t v3 = [(MSASGroupedQueue *)self memberQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__MSASGroupedQueue_maxGroupedCallbackEventIdleInterval__block_invoke;
  v6[3] = &unk_1E6C3DA60;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  double v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

double __55__MSASGroupedQueue_maxGroupedCallbackEventIdleInterval__block_invoke(uint64_t a1)
{
  double result = *(double *)(*(void *)(a1 + 32) + 40);
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setMaxGroupedCallbackEventStaleness:(double)a3
{
  uint64_t v5 = [(MSASGroupedQueue *)self memberQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__MSASGroupedQueue_setMaxGroupedCallbackEventStaleness___block_invoke;
  v6[3] = &unk_1E6C3DAB0;
  v6[4] = self;
  *(double *)&v6[5] = a3;
  dispatch_barrier_async(v5, v6);
}

double __56__MSASGroupedQueue_setMaxGroupedCallbackEventStaleness___block_invoke(uint64_t a1)
{
  double result = *(double *)(a1 + 40);
  *(double *)(*(void *)(a1 + 32) + 48) = result;
  return result;
}

- (double)maxGroupedCallbackEventStaleness
{
  uint64_t v7 = 0;
  uint64_t v8 = (double *)&v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  uint64_t v3 = [(MSASGroupedQueue *)self memberQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__MSASGroupedQueue_maxGroupedCallbackEventStaleness__block_invoke;
  v6[3] = &unk_1E6C3DA60;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  double v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

double __52__MSASGroupedQueue_maxGroupedCallbackEventStaleness__block_invoke(uint64_t a1)
{
  double result = *(double *)(*(void *)(a1 + 32) + 48);
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setMaxGroupedCallbackEventBatchCount:(int)a3
{
  uint64_t v5 = [(MSASGroupedQueue *)self memberQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__MSASGroupedQueue_setMaxGroupedCallbackEventBatchCount___block_invoke;
  v6[3] = &unk_1E6C3DA88;
  v6[4] = self;
  int v7 = a3;
  dispatch_barrier_async(v5, v6);
}

uint64_t __57__MSASGroupedQueue_setMaxGroupedCallbackEventBatchCount___block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(result + 32) + 12) = *(_DWORD *)(result + 40);
  return result;
}

- (int)maxGroupedCallbackEventBatchCount
{
  v2 = self;
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  uint64_t v3 = [(MSASGroupedQueue *)self memberQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__MSASGroupedQueue_maxGroupedCallbackEventBatchCount__block_invoke;
  v5[3] = &unk_1E6C3DA60;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LODWORD(v2) = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return (int)v2;
}

uint64_t __53__MSASGroupedQueue_maxGroupedCallbackEventBatchCount__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(_DWORD *)(*(void *)(result + 32) + 12);
  return result;
}

- (void)setModel:(id)a3
{
  objc_storeWeak((id *)&self->_model, a3);
  if ([(MSASGroupedQueue *)self hasEnqueuedItems])
  {
    [(MSASGroupedQueue *)self assertBusyAssertion];
    double v4 = [(MSASGroupedQueue *)self workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __29__MSASGroupedQueue_setModel___block_invoke;
    block[3] = &unk_1E6C3DA38;
    block[4] = self;
    dispatch_async(v4, block);
  }
}

uint64_t __29__MSASGroupedQueue_setModel___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) workQueueFlushQueue];
  v2 = *(void **)(a1 + 32);
  return [v2 deassertBusyAssertion];
}

- (MSASGroupedQueue)init
{
  v8.receiver = self;
  v8.super_class = (Class)MSASGroupedQueue;
  v2 = [(MSASGroupedQueue *)&v8 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("MSASGroupedQueue work queue", 0);
    double v4 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v3;

    dispatch_queue_t v5 = dispatch_queue_create("MSASGroupedQueue member queue", MEMORY[0x1E4F14430]);
    uint64_t v6 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 4) = v5;

    *((_DWORD *)v2 + 3) = 20;
    *(_OWORD *)(v2 + 40) = xmmword_1DC4FD760;
  }
  return (MSASGroupedQueue *)v2;
}

@end