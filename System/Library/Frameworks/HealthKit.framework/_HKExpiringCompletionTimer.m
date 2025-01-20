@interface _HKExpiringCompletionTimer
- (BOOL)isExpired;
- (NSDate)startDate;
- (OS_dispatch_queue)queue;
- (_HKExpiringCompletionTimer)initWithCompletion:(id)a3;
- (_HKExpiringCompletionTimer)initWithQueue:(id)a3 completion:(id)a4;
- (void)_cancelTimer;
- (void)_invalidateAndInvokeCompletion:(BOOL)a3 error:(id)a4;
- (void)_start;
- (void)dealloc;
- (void)invalidate;
- (void)invalidateAndInvokeCompletionWithError:(id)a3;
- (void)restart;
- (void)startWithTimeoutInterval:(double)a3 handler:(id)a4;
@end

@implementation _HKExpiringCompletionTimer

- (_HKExpiringCompletionTimer)initWithCompletion:(id)a3
{
  v5 = dispatch_get_global_queue(0, 0);
  v6 = [(_HKExpiringCompletionTimer *)self initWithQueue:v5 completion:a3];

  return v6;
}

- (_HKExpiringCompletionTimer)initWithQueue:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_HKExpiringCompletionTimer;
  v9 = [(_HKExpiringCompletionTimer *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a3);
    uint64_t v11 = [v8 copy];
    id completion = v10->_completion;
    v10->_id completion = (id)v11;
  }
  return v10;
}

- (void)dealloc
{
  if (!self->_invalidated)
  {
    v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2, self, @"_HKExpiringCompletionTimer.m", 40, @"%@ must be invalidated before deallocation", objc_opt_class() object file lineNumber description];
  }
  [(_HKExpiringCompletionTimer *)self _cancelTimer];
  v5.receiver = self;
  v5.super_class = (Class)_HKExpiringCompletionTimer;
  [(_HKExpiringCompletionTimer *)&v5 dealloc];
}

- (void)_cancelTimer
{
  timerSource = self->_timerSource;
  if (timerSource)
  {
    dispatch_source_cancel(timerSource);
    v4 = self->_timerSource;
    self->_timerSource = 0;
  }
}

- (BOOL)isExpired
{
  if (!self->_startDate) {
    return 0;
  }
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  return v3 > self->_expirationTime;
}

- (void)startWithTimeoutInterval:(double)a3 handler:(id)a4
{
  id v7 = a4;
  if (self->_invalidated)
  {
    id v13 = v7;
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"_HKExpiringCompletionTimer.m" lineNumber:56 description:@"Cannot start an invalidated timer"];

    id v7 = v13;
  }
  if (self->_startDate)
  {
    id v14 = v7;
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"_HKExpiringCompletionTimer.m" lineNumber:57 description:@"Cannot start timer twice"];

    id v7 = v14;
  }
  if (!self->_invalidated && !self->_startDate)
  {
    self->_timeout = a3;
    id v12 = v7;
    id v8 = (void *)[v7 copy];
    id timeoutHandler = self->_timeoutHandler;
    self->_id timeoutHandler = v8;

    [(_HKExpiringCompletionTimer *)self _start];
    id v7 = v12;
  }
}

- (void)restart
{
  if (self->_invalidated)
  {
    v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"_HKExpiringCompletionTimer.m" lineNumber:69 description:@"Cannot restart an invalidated timer"];
  }
  if (!self->_timeoutHandler)
  {
    objc_super v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"_HKExpiringCompletionTimer.m" lineNumber:70 description:@"Cannot restart a timer with no timeout handler"];
  }
  if (!self->_invalidated && self->_timeoutHandler)
  {
    [(_HKExpiringCompletionTimer *)self _cancelTimer];
    [(_HKExpiringCompletionTimer *)self _start];
  }
}

- (void)_start
{
  v4 = [MEMORY[0x1E4F1C9C8] date];
  startDate = self->_startDate;
  self->_startDate = v4;

  [(NSDate *)self->_startDate timeIntervalSinceReferenceDate];
  self->_expirationTime = v6 + self->_timeout;
  id v7 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_queue);
  timerSource = self->_timerSource;
  self->_timerSource = v7;

  v9 = self->_timerSource;
  dispatch_time_t v10 = dispatch_walltime(0, (uint64_t)(self->_timeout * 1000000000.0));
  dispatch_source_set_timer(v9, v10, 0xFFFFFFFFFFFFFFFFLL, 0);
  uint64_t v11 = self->_timerSource;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __36___HKExpiringCompletionTimer__start__block_invoke;
  v12[3] = &unk_1E58BD9D0;
  v12[4] = self;
  v12[5] = a2;
  dispatch_source_set_event_handler(v11, v12);
  dispatch_resume((dispatch_object_t)self->_timerSource);
}

- (void)invalidate
{
}

- (void)invalidateAndInvokeCompletionWithError:(id)a3
{
}

- (void)_invalidateAndInvokeCompletion:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (!self->_invalidated)
  {
    id v9 = v6;
    self->_invalidated = 1;
    [(_HKExpiringCompletionTimer *)self _cancelTimer];
    id v7 = (void (**)(void *, BOOL))_Block_copy(self->_completion);
    id completion = self->_completion;
    self->_id completion = 0;

    if (v4) {
      v7[2](v7, v9 == 0);
    }

    id v6 = v9;
  }
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong(&self->_timeoutHandler, 0);

  objc_storeStrong((id *)&self->_timerSource, 0);
}

@end