@interface LACBackgroundTask
- (LACBackgroundTask)initWithIdentifier:(id)a3 worker:(id)a4;
- (LACBackgroundTask)initWithWorker:(id)a3;
- (LACBackgroundTaskDelegate)delegate;
- (id)description;
- (id)runSynchronouslyWithTimeout:(double)a3;
- (void)_queuedCompleteTaskWithResult:(id)a3;
- (void)_queuedRunInReplyQueue:(id)a3;
- (void)_queuedRunWithTimeout:(double)a3 replyQueue:(id)a4 completion:(id)a5;
- (void)_queuedStartWorkerIfNeeded;
- (void)_queuedStartWorkerWatchdogWithTimeout:(double)a3;
- (void)_queuedStopWorkerWatchdog;
- (void)dealloc;
- (void)runWithTimeout:(double)a3 completion:(id)a4;
- (void)runWithTimeout:(double)a3 queue:(id)a4 completion:(id)a5;
- (void)setDelegate:(id)a3;
@end

@implementation LACBackgroundTask

uint64_t __51__LACBackgroundTask__queuedCompleteTaskWithResult___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __47__LACBackgroundTask__queuedStartWorkerIfNeeded__block_invoke_3(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 48) = 0;
  return [*(id *)(a1 + 32) _queuedCompleteTaskWithResult:*(void *)(a1 + 40)];
}

- (void)dealloc
{
  v3 = LACLogTask();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    [(LACSharedModeDataSourceFTRCAdapter *)(uint64_t)self dealloc];
  }

  v4.receiver = self;
  v4.super_class = (Class)LACBackgroundTask;
  [(LACBackgroundTask *)&v4 dealloc];
}

void __53__LACBackgroundTask_runWithTimeout_queue_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _queuedRunWithTimeout:*(void *)(a1 + 32) replyQueue:*(void *)(a1 + 40) completion:*(double *)(a1 + 56)];
    id WeakRetained = v3;
  }
}

- (void)_queuedRunWithTimeout:(double)a3 replyQueue:(id)a4 completion:(id)a5
{
  v8 = a4;
  id v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_innerQueue);
  if (self->_currentHandler || self->_isWorkerRunning)
  {
    replyQueue = v8;
    if (!v8) {
      replyQueue = self->_replyQueue;
    }
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __65__LACBackgroundTask__queuedRunWithTimeout_replyQueue_completion___block_invoke;
    v14[3] = &unk_2653B5E18;
    v14[4] = self;
    id v15 = v9;
    dispatch_async(replyQueue, v14);
  }
  else
  {
    v11 = (OS_dispatch_queue *)v8;
    if (!v8) {
      v11 = self->_replyQueue;
    }
    objc_storeStrong((id *)&self->_replyQueue, v11);
    v12 = _Block_copy(v9);
    id currentHandler = self->_currentHandler;
    self->_id currentHandler = v12;

    [(LACBackgroundTask *)self _queuedStartWorkerWatchdogWithTimeout:a3];
    [(LACBackgroundTask *)self _queuedStartWorkerIfNeeded];
  }
}

- (void)_queuedStartWorkerWatchdogWithTimeout:(double)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_innerQueue);
  [(LACBackgroundTask *)self _queuedStopWorkerWatchdog];
  objc_initWeak(&location, self);
  watchdog = self->_watchdog;
  innerQueue = self->_innerQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __59__LACBackgroundTask__queuedStartWorkerWatchdogWithTimeout___block_invoke;
  v7[3] = &unk_2653B5E40;
  objc_copyWeak(v8, &location);
  v8[1] = *(id *)&a3;
  [(LACTimer *)watchdog dispatchAfter:innerQueue inQueue:v7 block:a3];
  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
}

- (void)_queuedStartWorkerIfNeeded
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_254F14000, a2, OS_LOG_TYPE_ERROR, "%{public}@ ignoring run request because is already running", (uint8_t *)&v2, 0xCu);
}

- (void)_queuedCompleteTaskWithResult:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_innerQueue);
  v5 = LACLogTask();
  v6 = [v4 error];
  os_log_type_t v7 = 16 * (v6 != 0);

  if (os_log_type_enabled(v5, v7))
  {
    *(_DWORD *)buf = 138543618;
    v21 = self;
    __int16 v22 = 2114;
    id v23 = v4;
    _os_log_impl(&dword_254F14000, v5, v7, "%{public}@ finished run with result %{public}@", buf, 0x16u);
  }

  [(LACBackgroundTask *)self _queuedStopWorkerWatchdog];
  id currentHandler = self->_currentHandler;
  if (currentHandler)
  {
    id v9 = (void *)[currentHandler copy];
    id v10 = self->_currentHandler;
    self->_id currentHandler = 0;

    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __51__LACBackgroundTask__queuedCompleteTaskWithResult___block_invoke;
    v17[3] = &unk_2653B5EB8;
    id v19 = v9;
    id v18 = v4;
    id v11 = v9;
    [(LACBackgroundTask *)self _queuedRunInReplyQueue:v17];
  }
  else
  {
    v12 = [(LACBackgroundTask *)self delegate];
    BOOL v13 = v12 == 0;

    if (!v13)
    {
      objc_initWeak((id *)buf, self);
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __51__LACBackgroundTask__queuedCompleteTaskWithResult___block_invoke_2;
      v14[3] = &unk_2653B5A88;
      objc_copyWeak(&v16, (id *)buf);
      id v15 = v4;
      [(LACBackgroundTask *)self _queuedRunInReplyQueue:v14];

      objc_destroyWeak(&v16);
      objc_destroyWeak((id *)buf);
    }
  }
}

- (void)_queuedStopWorkerWatchdog
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_innerQueue);
  watchdog = self->_watchdog;
  if (watchdog) {
    [(LACTimer *)watchdog cancel];
  }
  self->_watchdog = objc_alloc_init(LACTimer);
  MEMORY[0x270F9A758]();
}

- (void)_queuedRunInReplyQueue:(id)a3
{
  innerQueue = self->_innerQueue;
  block = (void (**)(void))a3;
  dispatch_assert_queue_V2(innerQueue);
  replyQueue = self->_replyQueue;
  if (replyQueue) {
    BOOL v6 = replyQueue == self->_innerQueue;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6) {
    block[2]();
  }
  else {
    dispatch_async((dispatch_queue_t)replyQueue, block);
  }
}

- (id)description
{
  v10[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [NSString stringWithFormat:@"identifier: %@", self->_identifier];
  v10[0] = v5;
  BOOL v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
  os_log_type_t v7 = [v6 componentsJoinedByString:@"; "];
  v8 = [v3 stringWithFormat:@"<%@ %p; %@>", v4, self, v7];

  return v8;
}

void __47__LACBackgroundTask__queuedStartWorkerIfNeeded__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    BOOL v6 = WeakRetained[1];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __47__LACBackgroundTask__queuedStartWorkerIfNeeded__block_invoke_3;
    v7[3] = &unk_2653B5E68;
    void v7[4] = WeakRetained;
    id v8 = v3;
    dispatch_async(v6, v7);
  }
}

void __47__LACBackgroundTask__queuedStartWorkerIfNeeded__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = *((void *)WeakRetained + 3);
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __47__LACBackgroundTask__queuedStartWorkerIfNeeded__block_invoke_2;
    v5[3] = &unk_2653B5E90;
    objc_copyWeak(&v6, v1);
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
    objc_destroyWeak(&v6);
  }
}

- (void)runWithTimeout:(double)a3 queue:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  objc_initWeak(&location, self);
  innerQueue = self->_innerQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__LACBackgroundTask_runWithTimeout_queue_completion___block_invoke;
  block[3] = &unk_2653B5DF0;
  objc_copyWeak(v16, &location);
  v16[1] = *(id *)&a3;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(innerQueue, block);

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

- (LACBackgroundTask)initWithIdentifier:(id)a3 worker:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)LACBackgroundTask;
  id v9 = [(LACBackgroundTask *)&v17 init];
  if (v9)
  {
    id v10 = _Block_copy(v8);
    id worker = v9->_worker;
    v9->_id worker = v10;

    id v12 = (objc_class *)objc_opt_class();
    BOOL v13 = NSStringFromClass(v12);
    uint64_t v14 = +[LACConcurrencyUtilities createUserInitiatedSerialQueueWithIdentifier:v13];
    innerQueue = v9->_innerQueue;
    v9->_innerQueue = (OS_dispatch_queue *)v14;

    objc_storeStrong((id *)&v9->_replyQueue, v9->_innerQueue);
    v9->_isWorkerRunning = 0;
    objc_storeStrong((id *)&v9->_identifier, a3);
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_watchdog, 0);
  objc_storeStrong(&self->_currentHandler, 0);
  objc_storeStrong(&self->_worker, 0);
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_innerQueue, 0);
}

- (LACBackgroundTask)initWithWorker:(id)a3
{
  return [(LACBackgroundTask *)self initWithIdentifier:@"AnonymousTask" worker:a3];
}

- (id)runSynchronouslyWithTimeout:(double)a3
{
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, &__block_literal_global_4);
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__0;
  v21 = __Block_byref_object_dispose__0;
  id v22 = 0;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __49__LACBackgroundTask_runSynchronouslyWithTimeout___block_invoke_5;
  v14[3] = &unk_2653B5DC8;
  id v16 = &v17;
  id v6 = v5;
  id v15 = v6;
  [(LACBackgroundTask *)self runWithTimeout:v14 completion:a3];
  dispatch_time_t v7 = dispatch_time(0, (uint64_t)((a3 + 0.05) * 1000000000.0));
  if (dispatch_block_wait(v6, v7))
  {
    id v8 = objc_msgSend(NSString, "stringWithFormat:", @"Sync request timed out after %.3f secs", *(void *)&a3);
    id v9 = +[LACBackgroundTaskErrorBuilder errorWithCode:2 debugDescription:v8];
    id v10 = [[LACBackgroundTaskResult alloc] initWithError:v9];
    id v11 = (void *)v18[5];
    v18[5] = (uint64_t)v10;
  }
  id v12 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v12;
}

void __49__LACBackgroundTask_runSynchronouslyWithTimeout___block_invoke_5(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)runWithTimeout:(double)a3 completion:(id)a4
{
}

void __65__LACBackgroundTask__queuedRunWithTimeout_replyQueue_completion___block_invoke(uint64_t a1)
{
  int v2 = [LACBackgroundTaskResult alloc];
  id v3 = +[LACBackgroundTaskErrorBuilder errorWithCode:1];
  id v4 = [(LACBackgroundTaskResult *)v2 initWithError:v3];

  dispatch_block_t v5 = LACLogTask();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __65__LACBackgroundTask__queuedRunWithTimeout_replyQueue_completion___block_invoke_cold_1(a1, (uint64_t)v4, v5);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __59__LACBackgroundTask__queuedStartWorkerWatchdogWithTimeout___block_invoke(uint64_t a1)
{
  id WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    dispatch_assert_queue_V2(WeakRetained[1]);
    id v3 = [NSString stringWithFormat:@"Request '%@' timed out after %.3f secs", v6[7], *(void *)(a1 + 40)];
    id v4 = +[LACBackgroundTaskErrorBuilder errorWithCode:2 debugDescription:v3];
    dispatch_block_t v5 = [[LACBackgroundTaskResult alloc] initWithError:v4];
    [(dispatch_queue_t *)v6 _queuedCompleteTaskWithResult:v5];

    id WeakRetained = v6;
  }
}

void __51__LACBackgroundTask__queuedCompleteTaskWithResult___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v3 = [WeakRetained delegate];
    [v3 backgroundTask:v4 didCompleteTaskWithResult:*(void *)(a1 + 32)];

    id WeakRetained = v4;
  }
}

- (LACBackgroundTaskDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (LACBackgroundTaskDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

void __65__LACBackgroundTask__queuedRunWithTimeout_replyQueue_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_254F14000, log, OS_LOG_TYPE_ERROR, "%{public}@ failed with result %{public}@", (uint8_t *)&v4, 0x16u);
}

@end