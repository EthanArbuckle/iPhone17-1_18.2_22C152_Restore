@interface LNWatchdogTimer
- (BOOL)_cancelIfNotAlreadyCanceled;
- (BOOL)_isCanceled;
- (BOOL)_isStopped;
- (BOOL)cancelIfNotAlreadyCanceled;
- (BOOL)isCanceled;
- (BOOL)isStopped;
- (LNWatchdogTimer)initWithTimeoutInterval:(double)a3 onQueue:(id)a4 singleUse:(BOOL)a5 timeoutHandler:(id)a6;
- (LNWatchdogTimer)initWithTimeoutInterval:(double)a3 onQueue:(id)a4 timeoutHandler:(id)a5;
- (LNWatchdogTimer)initWithTimeoutInterval:(double)a3 singleUse:(BOOL)a4 timeoutHandler:(id)a5;
- (LNWatchdogTimer)initWithTimeoutInterval:(double)a3 timeoutHandler:(id)a4;
- (OS_dispatch_queue)internalQueue;
- (OS_dispatch_source)timerSource;
- (double)interval;
- (double)remainingInterval;
- (double)startTime;
- (void)_cancel;
- (void)_reset;
- (void)_start;
- (void)_stop;
- (void)cancel;
- (void)dealloc;
- (void)reset;
- (void)setRemainingInterval:(double)a3;
- (void)setStartTime:(double)a3;
- (void)setStopped:(BOOL)a3;
- (void)start;
- (void)stop;
@end

@implementation LNWatchdogTimer

uint64_t __24__LNWatchdogTimer_start__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _start];
}

uint64_t __24__LNWatchdogTimer_reset__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reset];
}

uint64_t __25__LNWatchdogTimer_cancel__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cancel];
}

- (void)_reset
{
  [(LNWatchdogTimer *)self _stop];
  self->_remainingInterval = self->_interval;
  [(LNWatchdogTimer *)self _start];
}

- (void)setStopped:(BOOL)a3
{
  self->_stopped = a3;
}

- (void)_cancel
{
  dispatch_source_cancel((dispatch_source_t)self->_timerSource);
  if ([(LNWatchdogTimer *)self _isStopped])
  {
    dispatch_resume((dispatch_object_t)self->_timerSource);
    [(LNWatchdogTimer *)self setStopped:0];
  }
}

- (void)dealloc
{
  if ([(LNWatchdogTimer *)self _isStopped])
  {
    v3 = [(LNWatchdogTimer *)self timerSource];
    dispatch_resume(v3);
  }
  v4.receiver = self;
  v4.super_class = (Class)LNWatchdogTimer;
  [(LNWatchdogTimer *)&v4 dealloc];
}

- (void)_stop
{
  if (![(LNWatchdogTimer *)self _isStopped])
  {
    dispatch_suspend((dispatch_object_t)self->_timerSource);
    v3 = [MEMORY[0x1E4F28F80] processInfo];
    [v3 systemUptime];
    double v5 = v4 - self->_startTime;

    [(LNWatchdogTimer *)self setRemainingInterval:fmax(self->_interval - v5, 0.0)];
    [(LNWatchdogTimer *)self setStopped:1];
  }
}

- (void)_start
{
  if ([(LNWatchdogTimer *)self _isStopped])
  {
    timerSource = self->_timerSource;
    dispatch_time_t v4 = dispatch_time(0, (uint64_t)(self->_remainingInterval * 1000000000.0));
    dispatch_source_set_timer(timerSource, v4, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_resume((dispatch_object_t)self->_timerSource);
    double v5 = [MEMORY[0x1E4F28F80] processInfo];
    [v5 systemUptime];
    -[LNWatchdogTimer setStartTime:](self, "setStartTime:");

    [(LNWatchdogTimer *)self setStopped:0];
  }
}

- (BOOL)_isStopped
{
  return self->_stopped;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (void)setRemainingInterval:(double)a3
{
  self->_remainingInterval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_timerSource, 0);
}

- (void)start
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __24__LNWatchdogTimer_start__block_invoke;
  block[3] = &unk_1E5B3A0B0;
  block[4] = self;
  dispatch_sync(internalQueue, block);
}

- (LNWatchdogTimer)initWithTimeoutInterval:(double)a3 onQueue:(id)a4 timeoutHandler:(id)a5
{
  return [(LNWatchdogTimer *)self initWithTimeoutInterval:a4 onQueue:1 singleUse:a5 timeoutHandler:a3];
}

- (LNWatchdogTimer)initWithTimeoutInterval:(double)a3 onQueue:(id)a4 singleUse:(BOOL)a5 timeoutHandler:(id)a6
{
  v11 = a4;
  id v12 = a6;
  if (a3 >= 0.0)
  {
    if (v11) {
      goto LABEL_3;
    }
LABEL_8:
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"LNWatchdogTimer.m", 62, @"Invalid parameter not satisfying: %@", @"queue" object file lineNumber description];

    if (v12) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v23 = [MEMORY[0x1E4F28B00] currentHandler];
  [v23 handleFailureInMethod:a2, self, @"LNWatchdogTimer.m", 61, @"Invalid parameter not satisfying: %@", @"timeoutInterval >= 0" object file lineNumber description];

  if (!v11) {
    goto LABEL_8;
  }
LABEL_3:
  if (v12) {
    goto LABEL_4;
  }
LABEL_9:
  v25 = [MEMORY[0x1E4F28B00] currentHandler];
  [v25 handleFailureInMethod:a2, self, @"LNWatchdogTimer.m", 63, @"Invalid parameter not satisfying: %@", @"timeoutHandler" object file lineNumber description];

LABEL_4:
  v31.receiver = self;
  v31.super_class = (Class)LNWatchdogTimer;
  v13 = [(LNWatchdogTimer *)&v31 init];
  v14 = v13;
  if (v13)
  {
    v13->_interval = a3;
    v13->_remainingInterval = a3;
    dispatch_source_t v15 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v11);
    timerSource = v14->_timerSource;
    v14->_timerSource = (OS_dispatch_source *)v15;

    v17 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    dispatch_queue_t v18 = dispatch_queue_create("com.apple.link.LNWatchdogTimer.internal-queue", v17);
    internalQueue = v14->_internalQueue;
    v14->_internalQueue = (OS_dispatch_queue *)v18;

    objc_initWeak(&location, v14);
    v20 = v14->_timerSource;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __76__LNWatchdogTimer_initWithTimeoutInterval_onQueue_singleUse_timeoutHandler___block_invoke;
    handler[3] = &unk_1E5B393D8;
    objc_copyWeak(&v28, &location);
    BOOL v29 = a5;
    id v27 = v12;
    dispatch_source_set_event_handler(v20, handler);
    v14->_stopped = 1;
    v21 = v14;

    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }

  return v14;
}

- (void)cancel
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __25__LNWatchdogTimer_cancel__block_invoke;
  block[3] = &unk_1E5B3A0B0;
  block[4] = self;
  dispatch_sync(internalQueue, block);
}

- (void)reset
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __24__LNWatchdogTimer_reset__block_invoke;
  block[3] = &unk_1E5B3A0B0;
  block[4] = self;
  dispatch_sync(internalQueue, block);
}

- (double)startTime
{
  return self->_startTime;
}

- (double)remainingInterval
{
  return self->_remainingInterval;
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (OS_dispatch_source)timerSource
{
  return self->_timerSource;
}

- (double)interval
{
  return self->_interval;
}

- (BOOL)_isCanceled
{
  return dispatch_source_testcancel((dispatch_source_t)self->_timerSource) != 0;
}

- (BOOL)_cancelIfNotAlreadyCanceled
{
  BOOL v3 = [(LNWatchdogTimer *)self _isCanceled];
  if (!v3) {
    [(LNWatchdogTimer *)self _cancel];
  }
  return !v3;
}

- (BOOL)isStopped
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __28__LNWatchdogTimer_isStopped__block_invoke;
  v5[3] = &unk_1E5B39400;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __28__LNWatchdogTimer_isStopped__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _isStopped];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
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
  v5[2] = __29__LNWatchdogTimer_isCanceled__block_invoke;
  v5[3] = &unk_1E5B39400;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __29__LNWatchdogTimer_isCanceled__block_invoke(uint64_t a1)
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
  v5[2] = __45__LNWatchdogTimer_cancelIfNotAlreadyCanceled__block_invoke;
  v5[3] = &unk_1E5B39400;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __45__LNWatchdogTimer_cancelIfNotAlreadyCanceled__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _cancelIfNotAlreadyCanceled];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)stop
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __23__LNWatchdogTimer_stop__block_invoke;
  block[3] = &unk_1E5B3A0B0;
  block[4] = self;
  dispatch_sync(internalQueue, block);
}

uint64_t __23__LNWatchdogTimer_stop__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stop];
}

void __76__LNWatchdogTimer_initWithTimeoutInterval_onQueue_singleUse_timeoutHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (*(unsigned char *)(a1 + 48)) {
    [WeakRetained cancel];
  }
  else {
    [WeakRetained stop];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (LNWatchdogTimer)initWithTimeoutInterval:(double)a3 singleUse:(BOOL)a4 timeoutHandler:(id)a5
{
  BOOL v6 = a4;
  char v9 = dispatch_get_global_queue(17, 0);
  v10 = [(LNWatchdogTimer *)self initWithTimeoutInterval:v9 onQueue:v6 singleUse:a5 timeoutHandler:a3];

  return v10;
}

- (LNWatchdogTimer)initWithTimeoutInterval:(double)a3 timeoutHandler:(id)a4
{
  v7 = dispatch_get_global_queue(17, 0);
  uint64_t v8 = [(LNWatchdogTimer *)self initWithTimeoutInterval:v7 onQueue:1 singleUse:a4 timeoutHandler:a3];

  return v8;
}

@end