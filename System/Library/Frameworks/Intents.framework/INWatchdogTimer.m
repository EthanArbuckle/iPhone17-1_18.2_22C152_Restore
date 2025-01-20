@interface INWatchdogTimer
- (BOOL)_cancelIfNotAlreadyCanceled;
- (BOOL)_isCanceled;
- (BOOL)cancelIfNotAlreadyCanceled;
- (BOOL)isCanceled;
- (INWatchdogTimer)initWithTimeoutInterval:(double)a3 onQueue:(id)a4 timeoutHandler:(id)a5;
- (INWatchdogTimer)initWithTimeoutInterval:(double)a3 timeoutHandler:(id)a4;
- (void)_cancel;
- (void)_reset;
- (void)_start;
- (void)_stop;
- (void)cancel;
- (void)dealloc;
- (void)start;
- (void)stop;
@end

@implementation INWatchdogTimer

uint64_t __24__INWatchdogTimer_start__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _start];
}

- (void)start
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __24__INWatchdogTimer_start__block_invoke;
  block[3] = &unk_1E55208F8;
  block[4] = self;
  dispatch_sync(internalQueue, block);
}

- (INWatchdogTimer)initWithTimeoutInterval:(double)a3 onQueue:(id)a4 timeoutHandler:(id)a5
{
  v8 = a4;
  id v9 = a5;
  v22.receiver = self;
  v22.super_class = (Class)INWatchdogTimer;
  v10 = [(INWatchdogTimer *)&v22 init];
  v11 = v10;
  if (v10)
  {
    v10->_interval = a3;
    v10->_remainingInterval = a3;
    dispatch_source_t v12 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v8);
    timerSource = v11->_timerSource;
    v11->_timerSource = (OS_dispatch_source *)v12;

    dispatch_queue_t v14 = dispatch_queue_create("com.apple.intents.INWatchdogTimer", 0);
    internalQueue = v11->_internalQueue;
    v11->_internalQueue = (OS_dispatch_queue *)v14;

    objc_initWeak(&location, v11);
    v16 = v11->_timerSource;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __66__INWatchdogTimer_initWithTimeoutInterval_onQueue_timeoutHandler___block_invoke;
    handler[3] = &unk_1E5518780;
    objc_copyWeak(&v20, &location);
    id v19 = v9;
    dispatch_source_set_event_handler(v16, handler);
    v11->_isStopped = 1;

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

  return v11;
}

- (void)_start
{
  if (self->_isStopped)
  {
    timerSource = self->_timerSource;
    dispatch_time_t v4 = dispatch_time(0, (uint64_t)(self->_remainingInterval * 1000000000.0));
    dispatch_source_set_timer(timerSource, v4, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_resume((dispatch_object_t)self->_timerSource);
    v5 = [MEMORY[0x1E4F28F80] processInfo];
    [v5 systemUptime];
    self->_startTime = v6;

    self->_isStopped = 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalQueue, 0);

  objc_storeStrong((id *)&self->_timerSource, 0);
}

- (void)_reset
{
  [(INWatchdogTimer *)self _stop];
  self->_remainingInterval = self->_interval;

  [(INWatchdogTimer *)self _start];
}

- (BOOL)_isCanceled
{
  return dispatch_source_testcancel((dispatch_source_t)self->_timerSource) != 0;
}

- (BOOL)_cancelIfNotAlreadyCanceled
{
  BOOL v3 = [(INWatchdogTimer *)self _isCanceled];
  if (!v3) {
    [(INWatchdogTimer *)self _cancel];
  }
  return !v3;
}

- (void)_cancel
{
  if (self->_isStopped)
  {
    dispatch_resume((dispatch_object_t)self->_timerSource);
    self->_isStopped = 0;
  }
}

- (void)_stop
{
  if (!self->_isStopped)
  {
    dispatch_suspend((dispatch_object_t)self->_timerSource);
    BOOL v3 = [MEMORY[0x1E4F28F80] processInfo];
    [v3 systemUptime];
    double v5 = v4 - self->_startTime;

    double v6 = self->_interval - v5;
    if (v6 < 0.0) {
      double v6 = 0.0;
    }
    self->_remainingInterval = v6;
    self->_isStopped = 1;
  }
}

- (BOOL)isCanceled
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __29__INWatchdogTimer_isCanceled__block_invoke;
  v5[3] = &unk_1E551B170;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __29__INWatchdogTimer_isCanceled__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _isCanceled];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)cancelIfNotAlreadyCanceled
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__INWatchdogTimer_cancelIfNotAlreadyCanceled__block_invoke;
  v5[3] = &unk_1E551B170;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __45__INWatchdogTimer_cancelIfNotAlreadyCanceled__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _cancelIfNotAlreadyCanceled];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)cancel
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __25__INWatchdogTimer_cancel__block_invoke;
  block[3] = &unk_1E55208F8;
  block[4] = self;
  dispatch_sync(internalQueue, block);
}

uint64_t __25__INWatchdogTimer_cancel__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cancel];
}

- (void)stop
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __23__INWatchdogTimer_stop__block_invoke;
  block[3] = &unk_1E55208F8;
  block[4] = self;
  dispatch_sync(internalQueue, block);
}

uint64_t __23__INWatchdogTimer_stop__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stop];
}

- (void)dealloc
{
  if (self->_isStopped) {
    dispatch_resume((dispatch_object_t)self->_timerSource);
  }
  v3.receiver = self;
  v3.super_class = (Class)INWatchdogTimer;
  [(INWatchdogTimer *)&v3 dealloc];
}

uint64_t __66__INWatchdogTimer_initWithTimeoutInterval_onQueue_timeoutHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained cancel];

  objc_super v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v3();
}

- (INWatchdogTimer)initWithTimeoutInterval:(double)a3 timeoutHandler:(id)a4
{
  v7 = dispatch_get_global_queue(17, 0);
  uint64_t v8 = [(INWatchdogTimer *)self initWithTimeoutInterval:v7 onQueue:a4 timeoutHandler:a3];

  return v8;
}

@end