@interface LACTimer
- (BOOL)isRunning;
- (LACTimer)init;
- (void)_dispatchAfter:(double)a3 inQueue:(id)a4 repeat:(BOOL)a5 block:(id)a6;
- (void)cancel;
- (void)dispatchAfter:(double)a3 inQueue:(id)a4 block:(id)a5;
@end

@implementation LACTimer

- (void).cxx_destruct
{
}

- (void)dispatchAfter:(double)a3 inQueue:(id)a4 block:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __40__LACTimer_dispatchAfter_inQueue_block___block_invoke;
  v11[3] = &unk_2653B66E8;
  objc_copyWeak(&v13, &location);
  id v10 = v9;
  id v12 = v10;
  [(LACTimer *)self dispatchAfter:v8 inQueue:0 repeat:v11 block:a3];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)_dispatchAfter:(double)a3 inQueue:(id)a4 repeat:(BOOL)a5 block:(id)a6
{
  BOOL v7 = a5;
  id v10 = a4;
  id v11 = a6;
  if (a3 == 0.0)
  {
    if (v7)
    {
      id v12 = LACLogDefault();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
        -[LACTimer _dispatchAfter:inQueue:repeat:block:](v12);
      }
    }
    dispatch_async(v10, v11);
  }
  else
  {
    p_timerLock = &self->_timerLock;
    os_unfair_lock_lock(&self->_timerLock);
    if (self->_timer)
    {
      v14 = LACLogDefault();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        -[LACTimer _dispatchAfter:inQueue:repeat:block:](v14);
      }
    }
    else
    {
      v15 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 1uLL, v10);
      timer = self->_timer;
      self->_timer = v15;

      double v17 = a3 * 1000000000.0;
      dispatch_time_t v18 = dispatch_time(0, (uint64_t)v17);
      dispatch_source_set_timer((dispatch_source_t)self->_timer, v18, (unint64_t)v17, 0);
      dispatch_source_set_event_handler((dispatch_source_t)self->_timer, v11);
      dispatch_activate((dispatch_object_t)self->_timer);
    }
    os_unfair_lock_unlock(p_timerLock);
  }
}

- (LACTimer)init
{
  v3.receiver = self;
  v3.super_class = (Class)LACTimer;
  result = [(LACTimer *)&v3 init];
  if (result) {
    result->_timerLock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (void)cancel
{
  p_timerLock = &self->_timerLock;
  os_unfair_lock_lock(&self->_timerLock);
  timer = self->_timer;
  if (timer)
  {
    dispatch_source_cancel(timer);
    v5 = self->_timer;
    self->_timer = 0;
  }
  os_unfair_lock_unlock(p_timerLock);
}

- (BOOL)isRunning
{
  p_timerLock = &self->_timerLock;
  os_unfair_lock_lock(&self->_timerLock);
  timer = self->_timer;
  if (timer) {
    BOOL v5 = dispatch_source_testcancel(timer) == 0;
  }
  else {
    BOOL v5 = 0;
  }
  os_unfair_lock_unlock(p_timerLock);
  return v5;
}

uint64_t __40__LACTimer_dispatchAfter_inQueue_block___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained cancel];

  objc_super v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v3();
}

- (void)_dispatchAfter:(os_log_t)log inQueue:repeat:block:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_254F14000, log, OS_LOG_TYPE_FAULT, "Repeating timers with zero length are not supported", v1, 2u);
}

- (void)_dispatchAfter:(os_log_t)log inQueue:repeat:block:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_254F14000, log, OS_LOG_TYPE_FAULT, "Reusing running timers is not supported", v1, 2u);
}

@end