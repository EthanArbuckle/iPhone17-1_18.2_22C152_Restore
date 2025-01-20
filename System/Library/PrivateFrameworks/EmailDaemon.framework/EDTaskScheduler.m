@interface EDTaskScheduler
- (BOOL)isReachable;
- (BOOL)observeForNetworkReachability;
- (BOOL)pendingWaitingForNetwork;
- (EDTaskScheduler)initWithExecutionQueue:(id)a3;
- (OS_dispatch_queue)executionQueue;
- (OS_dispatch_source)timerSource;
- (double)backOffInterval;
- (double)backoffMultiplier;
- (double)initialDelay;
- (double)maxBackOffInterval;
- (id)canceledCallback;
- (id)task;
- (id)work;
- (void)_cancelTimer;
- (void)_doScheduleTask:(id)a3 canceledCallback:(id)a4;
- (void)_incrementBackoffInterval;
- (void)_reportReachabilityChange:(id)a3;
- (void)_startObservingNetworkReachability;
- (void)_stopObservingNetworkReachability;
- (void)dealloc;
- (void)rescheduleTask;
- (void)scheduleTask:(id)a3 canceledCallback:(id)a4;
- (void)setBackOffInterval:(double)a3;
- (void)setBackoffMultiplier:(double)a3;
- (void)setCanceledCallback:(id)a3;
- (void)setExecutionQueue:(id)a3;
- (void)setInitialDelay:(double)a3;
- (void)setIsReachable:(BOOL)a3;
- (void)setMaxBackOffInterval:(double)a3;
- (void)setObserveForNetworkReachability:(BOOL)a3;
- (void)setPendingWaitingForNetwork:(BOOL)a3;
- (void)setTask:(id)a3;
- (void)setTimerSource:(id)a3;
- (void)setWork:(id)a3;
@end

@implementation EDTaskScheduler

- (EDTaskScheduler)initWithExecutionQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EDTaskScheduler;
  v6 = [(EDTaskScheduler *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_executionQueue, a3);
    *(_OWORD *)&v7->_maxBackOffInterval = xmmword_1DB6406E0;
  }

  return v7;
}

- (void)dealloc
{
  [(EDTaskScheduler *)self _stopObservingNetworkReachability];
  v3.receiver = self;
  v3.super_class = (Class)EDTaskScheduler;
  [(EDTaskScheduler *)&v3 dealloc];
}

- (void)scheduleTask:(id)a3 canceledCallback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(EDTaskScheduler *)self executionQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__EDTaskScheduler_scheduleTask_canceledCallback___block_invoke;
  block[3] = &unk_1E6C06848;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __49__EDTaskScheduler_scheduleTask_canceledCallback___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setBackOffInterval:0.0];
  [*(id *)(a1 + 32) _cancelTimer];
  [*(id *)(a1 + 32) setPendingWaitingForNetwork:0];
  [*(id *)(a1 + 32) setWork:0];
  v2 = [*(id *)(a1 + 32) canceledCallback];

  if (v2)
  {
    objc_super v3 = [*(id *)(a1 + 32) canceledCallback];
    v3[2]();

    [*(id *)(a1 + 32) setCanceledCallback:0];
  }
  v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);

  return [v4 _doScheduleTask:v5 canceledCallback:v6];
}

- (void)rescheduleTask
{
  objc_super v3 = [(EDTaskScheduler *)self executionQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__EDTaskScheduler_rescheduleTask__block_invoke;
  block[3] = &unk_1E6BFF2F0;
  block[4] = self;
  dispatch_async(v3, block);
}

void __33__EDTaskScheduler_rescheduleTask__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _cancelTimer];
  [*(id *)(a1 + 32) setPendingWaitingForNetwork:0];
  v2 = *(void **)(a1 + 32);
  id v4 = [v2 task];
  objc_super v3 = [*(id *)(a1 + 32) canceledCallback];
  [v2 _doScheduleTask:v4 canceledCallback:v3];
}

- (void)_doScheduleTask:(id)a3 canceledCallback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(EDTaskScheduler *)self initialDelay];
  double v9 = v8;
  id v10 = [(EDTaskScheduler *)self timerSource];

  if (v10)
  {
    [(EDTaskScheduler *)self _cancelTimer];
    [(EDTaskScheduler *)self _incrementBackoffInterval];
    [(EDTaskScheduler *)self backOffInterval];
    double v9 = v11;
  }
  id v12 = [(EDTaskScheduler *)self executionQueue];
  dispatch_source_t v13 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v12);
  [(EDTaskScheduler *)self setTimerSource:v13];

  [(EDTaskScheduler *)self setTask:v6];
  [(EDTaskScheduler *)self setCanceledCallback:v7];
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  v21 = __52__EDTaskScheduler__doScheduleTask_canceledCallback___block_invoke;
  v22 = &unk_1E6C00E78;
  objc_copyWeak(&v23, &location);
  [(EDTaskScheduler *)self setWork:&v19];
  v14 = [(EDTaskScheduler *)self timerSource];
  v15 = [(EDTaskScheduler *)self work];
  dispatch_source_set_event_handler(v14, v15);

  v16 = [(EDTaskScheduler *)self timerSource];
  dispatch_resume(v16);

  v17 = [(EDTaskScheduler *)self timerSource];
  dispatch_time_t v18 = dispatch_time(0, (uint64_t)(v9 * 1000000000.0));
  dispatch_source_set_timer(v17, v18, 0xFFFFFFFFFFFFFFFFLL, 0);

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

void __52__EDTaskScheduler__doScheduleTask_canceledCallback___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained observeForNetworkReachability]
    && ![WeakRetained isReachable])
  {
    [WeakRetained setPendingWaitingForNetwork:1];
  }
  else
  {
    v1 = [WeakRetained canceledCallback];

    if (v1) {
      [WeakRetained setCanceledCallback:0];
    }
    v2 = [WeakRetained task];
    v2[2]();
  }
}

- (void)setObserveForNetworkReachability:(BOOL)a3
{
  if (self->_observeForNetworkReachability != a3)
  {
    self->_observeForNetworkReachability = a3;
    if (a3) {
      [(EDTaskScheduler *)self _startObservingNetworkReachability];
    }
    else {
      [(EDTaskScheduler *)self _stopObservingNetworkReachability];
    }
  }
}

- (void)_startObservingNetworkReachability
{
  id v3 = [MEMORY[0x1E4F4BE68] sharedNetworkObserver];
  [v3 addNetworkReachableObserver:self selector:sel__reportReachabilityChange_];

  id v4 = [MEMORY[0x1E4F4BE68] sharedNetworkObserver];
  -[EDTaskScheduler setIsReachable:](self, "setIsReachable:", [v4 isNetworkReachable]);
}

- (void)_stopObservingNetworkReachability
{
  id v3 = [MEMORY[0x1E4F4BE68] sharedNetworkObserver];
  [v3 removeObserver:self];
}

- (void)_reportReachabilityChange:(id)a3
{
  id v4 = [(EDTaskScheduler *)self executionQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__EDTaskScheduler__reportReachabilityChange___block_invoke;
  block[3] = &unk_1E6BFF2F0;
  block[4] = self;
  dispatch_async(v4, block);
}

void __45__EDTaskScheduler__reportReachabilityChange___block_invoke(uint64_t a1)
{
  id v3 = [MEMORY[0x1E4F4BE68] sharedNetworkObserver];
  objc_msgSend(*(id *)(a1 + 32), "setIsReachable:", objc_msgSend(v3, "isNetworkReachable"));

  v2 = [*(id *)(a1 + 32) timerSource];

  if (v2
    && [*(id *)(a1 + 32) isReachable]
    && [*(id *)(a1 + 32) pendingWaitingForNetwork])
  {
    id v4 = [*(id *)(a1 + 32) work];
    [*(id *)(a1 + 32) setPendingWaitingForNetwork:0];
    v4[2]();
  }
}

- (void)_incrementBackoffInterval
{
  double backOffInterval = self->_backOffInterval;
  double v3 = 1.0;
  if (backOffInterval != 0.0) {
    double v3 = backOffInterval * self->_backoffMultiplier;
  }
  self->_double backOffInterval = v3;
  [(EDTaskScheduler *)self maxBackOffInterval];
}

- (void)_cancelTimer
{
  double v3 = [(EDTaskScheduler *)self timerSource];

  if (v3)
  {
    id v4 = [(EDTaskScheduler *)self timerSource];
    dispatch_source_cancel(v4);

    [(EDTaskScheduler *)self setTimerSource:0];
  }
}

- (double)initialDelay
{
  return self->_initialDelay;
}

- (void)setInitialDelay:(double)a3
{
  self->_initialDelay = a3;
}

- (double)maxBackOffInterval
{
  return self->_maxBackOffInterval;
}

- (void)setMaxBackOffInterval:(double)a3
{
  self->_maxBackOffInterval = a3;
}

- (double)backoffMultiplier
{
  return self->_backoffMultiplier;
}

- (void)setBackoffMultiplier:(double)a3
{
  self->_backoffMultiplier = a3;
}

- (BOOL)observeForNetworkReachability
{
  return self->_observeForNetworkReachability;
}

- (OS_dispatch_source)timerSource
{
  return self->_timerSource;
}

- (void)setTimerSource:(id)a3
{
}

- (OS_dispatch_queue)executionQueue
{
  return self->_executionQueue;
}

- (void)setExecutionQueue:(id)a3
{
}

- (double)backOffInterval
{
  return self->_backOffInterval;
}

- (void)setBackOffInterval:(double)a3
{
  self->_double backOffInterval = a3;
}

- (BOOL)isReachable
{
  return self->_isReachable;
}

- (void)setIsReachable:(BOOL)a3
{
  self->_isReachable = a3;
}

- (BOOL)pendingWaitingForNetwork
{
  return self->_pendingWaitingForNetwork;
}

- (void)setPendingWaitingForNetwork:(BOOL)a3
{
  self->_pendingWaitingForNetwork = a3;
}

- (id)task
{
  return self->_task;
}

- (void)setTask:(id)a3
{
}

- (id)canceledCallback
{
  return self->_canceledCallback;
}

- (void)setCanceledCallback:(id)a3
{
}

- (id)work
{
  return self->_work;
}

- (void)setWork:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_work, 0);
  objc_storeStrong(&self->_canceledCallback, 0);
  objc_storeStrong(&self->_task, 0);
  objc_storeStrong((id *)&self->_executionQueue, 0);

  objc_storeStrong((id *)&self->_timerSource, 0);
}

@end