@interface AFWatchdogTimer
- (AFWatchdogTimer)initWithTimeoutInterval:(double)a3 onQueue:(id)a4 timeoutHandler:(id)a5;
- (AFWatchdogTimer)initWithTimeoutInterval:(double)a3 timeoutHandler:(id)a4;
- (BOOL)cancelIfNotAlreadyCanceled;
- (BOOL)isStopped;
- (double)timeRemaining;
- (id)copyWithZone:(_NSZone *)a3;
- (void)cancel;
- (void)dealloc;
- (void)reset;
- (void)start;
- (void)stop;
@end

@implementation AFWatchdogTimer

- (void).cxx_destruct
{
  objc_storeStrong(&self->_timeoutHandler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_timerSource, 0);
}

- (void)reset
{
  [(AFWatchdogTimer *)self stop];
  self->_remainingInterval = self->_interval;
  [(AFWatchdogTimer *)self start];
}

- (BOOL)cancelIfNotAlreadyCanceled
{
  intptr_t v3 = dispatch_source_testcancel((dispatch_source_t)self->_timerSource);
  if (!v3) {
    [(AFWatchdogTimer *)self cancel];
  }
  return v3 == 0;
}

- (void)cancel
{
  p_timerLock = &self->_timerLock;
  os_unfair_lock_lock(&self->_timerLock);
  dispatch_source_cancel((dispatch_source_t)self->_timerSource);
  if (self->_isStopped)
  {
    dispatch_resume((dispatch_object_t)self->_timerSource);
    self->_isStopped = 0;
  }
  os_unfair_lock_unlock(p_timerLock);
}

- (double)timeRemaining
{
  if (self->_isStopped) {
    return self->_remainingInterval;
  }
  v4 = [MEMORY[0x1E4F28F80] processInfo];
  [v4 systemUptime];
  double v6 = v5 - self->_startTime;

  double result = self->_interval - v6;
  if (result < 0.0) {
    return 0.0;
  }
  return result;
}

- (BOOL)isStopped
{
  return self->_isStopped;
}

- (void)stop
{
  p_timerLock = &self->_timerLock;
  os_unfair_lock_lock(&self->_timerLock);
  if (!self->_isStopped)
  {
    dispatch_suspend((dispatch_object_t)self->_timerSource);
    [(AFWatchdogTimer *)self timeRemaining];
    self->_remainingInterval = v4;
    self->_isStopped = 1;
  }
  os_unfair_lock_unlock(p_timerLock);
}

- (void)start
{
  p_timerLock = &self->_timerLock;
  os_unfair_lock_lock(&self->_timerLock);
  if (self->_isStopped)
  {
    timerSource = self->_timerSource;
    dispatch_time_t v5 = dispatch_time(0, (uint64_t)(self->_remainingInterval * 1000000000.0));
    dispatch_source_set_timer(timerSource, v5, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_resume((dispatch_object_t)self->_timerSource);
    double v6 = [MEMORY[0x1E4F28F80] processInfo];
    [v6 systemUptime];
    self->_startTime = v7;

    self->_isStopped = 0;
  }
  os_unfair_lock_unlock(p_timerLock);
}

- (id)copyWithZone:(_NSZone *)a3
{
  double v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  double interval = self->_interval;
  queue = self->_queue;
  id timeoutHandler = self->_timeoutHandler;
  return (id)[v4 initWithTimeoutInterval:queue onQueue:timeoutHandler timeoutHandler:interval];
}

- (AFWatchdogTimer)initWithTimeoutInterval:(double)a3 onQueue:(id)a4 timeoutHandler:(id)a5
{
  id v10 = a4;
  id v11 = a5;
  if (a3 >= 0.0)
  {
    if (v10) {
      goto LABEL_3;
    }
LABEL_8:
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"AFWatchdogTimer.m", 38, @"Invalid parameter not satisfying: %@", @"queue" object file lineNumber description];

    if (v11) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v20 = [MEMORY[0x1E4F28B00] currentHandler];
  [v20 handleFailureInMethod:a2, self, @"AFWatchdogTimer.m", 37, @"Invalid parameter not satisfying: %@", @"timeoutInterval >= 0" object file lineNumber description];

  if (!v10) {
    goto LABEL_8;
  }
LABEL_3:
  if (v11) {
    goto LABEL_4;
  }
LABEL_9:
  v22 = [MEMORY[0x1E4F28B00] currentHandler];
  [v22 handleFailureInMethod:a2, self, @"AFWatchdogTimer.m", 39, @"Invalid parameter not satisfying: %@", @"timeoutHandler" object file lineNumber description];

LABEL_4:
  v27.receiver = self;
  v27.super_class = (Class)AFWatchdogTimer;
  v12 = [(AFWatchdogTimer *)&v27 init];
  v13 = v12;
  if (v12)
  {
    v12->_double interval = a3;
    v12->_remainingInterval = a3;
    objc_storeStrong((id *)&v12->_queue, a4);
    uint64_t v14 = MEMORY[0x19F3A50D0](v11);
    id timeoutHandler = v13->_timeoutHandler;
    v13->_id timeoutHandler = (id)v14;

    dispatch_source_t v16 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)v13->_queue);
    timerSource = v13->_timerSource;
    v13->_timerSource = (OS_dispatch_source *)v16;

    v13->_timerLock._os_unfair_lock_opaque = 0;
    objc_initWeak(&location, v13);
    v18 = v13->_timerSource;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __66__AFWatchdogTimer_initWithTimeoutInterval_onQueue_timeoutHandler___block_invoke;
    handler[3] = &unk_1E5926FA0;
    objc_copyWeak(&v25, &location);
    id v24 = v11;
    dispatch_source_set_event_handler(v18, handler);
    v13->_isStopped = 1;

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }

  return v13;
}

uint64_t __66__AFWatchdogTimer_initWithTimeoutInterval_onQueue_timeoutHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained cancelIfNotAlreadyCanceled];

  intptr_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v3();
}

- (AFWatchdogTimer)initWithTimeoutInterval:(double)a3 timeoutHandler:(id)a4
{
  double v7 = dispatch_get_global_queue(17, 0);
  v8 = [(AFWatchdogTimer *)self initWithTimeoutInterval:v7 onQueue:a4 timeoutHandler:a3];

  return v8;
}

- (void)dealloc
{
  timerSource = self->_timerSource;
  if (timerSource && self->_isStopped) {
    dispatch_resume(timerSource);
  }
  v4.receiver = self;
  v4.super_class = (Class)AFWatchdogTimer;
  [(AFWatchdogTimer *)&v4 dealloc];
}

@end