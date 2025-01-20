@interface CUCoalescer
- (CUCoalescer)init;
- (OS_dispatch_queue)dispatchQueue;
- (double)leeway;
- (double)maxDelay;
- (double)minDelay;
- (id)actionHandler;
- (id)invalidationHandler;
- (void)_cancel;
- (void)_invalidate;
- (void)_timerFired;
- (void)_trigger;
- (void)cancel;
- (void)dealloc;
- (void)invalidate;
- (void)setActionHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setLeeway:(double)a3;
- (void)setMaxDelay:(double)a3;
- (void)setMinDelay:(double)a3;
- (void)trigger;
@end

@implementation CUCoalescer

uint64_t __23__CUCoalescer__trigger__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _timerFired];
}

uint64_t __22__CUCoalescer_trigger__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _trigger];
}

- (void)trigger
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __22__CUCoalescer_trigger__block_invoke;
  block[3] = &unk_1E55BFC18;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_trigger
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateCalled)
  {
    atomic_fetch_or(&self->_triggered, 1u);
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    double v4 = Current + self->_minDelay;
    double startTime = self->_startTime;
    if (startTime == 0.0)
    {
      self->_double startTime = Current;
      double startTime = Current;
    }
    double maxDelay = self->_maxDelay;
    BOOL v7 = v4 - startTime <= maxDelay || maxDelay < 0.0;
    double v8 = maxDelay + startTime;
    if (!v7) {
      double v4 = v8;
    }
    double v9 = v4 - Current;
    if (v9 <= 0.0)
    {
      [(CUCoalescer *)self _timerFired];
    }
    else
    {
      int64_t v10 = (uint64_t)(v9 * 1000000000.0);
      double leeway = self->_leeway;
      if (leeway >= 0.0) {
        uint64_t v12 = (unint64_t)(leeway * 1000000000.0);
      }
      else {
        uint64_t v12 = v10 / 4;
      }
      dispatch_time_t v13 = dispatch_time(0, v10);
      timer = self->_timer;
      if (timer)
      {
        dispatch_source_set_timer(timer, v13, 0xFFFFFFFFFFFFFFFFLL, v12);
      }
      else
      {
        v15 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
        v16 = self->_timer;
        self->_timer = v15;

        v24 = self->_timer;
        if (!v24) {
          FatalErrorF((uint64_t)"Create coalesce timer failed", v17, v18, v19, v20, v21, v22, v23, v25);
        }
        handler[0] = MEMORY[0x1E4F143A8];
        handler[1] = 3221225472;
        handler[2] = __23__CUCoalescer__trigger__block_invoke;
        handler[3] = &unk_1E55BFC18;
        handler[4] = self;
        dispatch_source_set_event_handler(v24, handler);
        dispatch_source_set_timer((dispatch_source_t)self->_timer, v13, 0xFFFFFFFFFFFFFFFFLL, v12);
        dispatch_resume((dispatch_object_t)self->_timer);
      }
    }
  }
}

- (void)_timerFired
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  timer = self->_timer;
  if (timer)
  {
    double v4 = timer;
    dispatch_source_cancel(v4);
    v5 = self->_timer;
    self->_timer = 0;
  }
  self->_double startTime = 0.0;
  if (atomic_fetch_and(&self->_triggered, 0xFFFFFFFE))
  {
    v6 = (void (**)(void))_Block_copy(self->_actionHandler);
    if (v6)
    {
      BOOL v7 = v6;
      v6[2]();
      v6 = v7;
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_actionHandler, 0);
  objc_storeStrong((id *)&self->_timer, 0);
}

- (void)setMinDelay:(double)a3
{
  self->_minDelay = a3;
}

- (double)minDelay
{
  return self->_minDelay;
}

- (void)setMaxDelay:(double)a3
{
  self->_double maxDelay = a3;
}

- (double)maxDelay
{
  return self->_maxDelay;
}

- (void)setLeeway:(double)a3
{
  self->_double leeway = a3;
}

- (double)leeway
{
  return self->_leeway;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setDispatchQueue:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setActionHandler:(id)a3
{
}

- (id)actionHandler
{
  return self->_actionHandler;
}

- (void)_cancel
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  self->_double startTime = 0.0;
  timer = self->_timer;
  if (timer)
  {
    double v4 = timer;
    dispatch_source_cancel(v4);
    v5 = self->_timer;
    self->_timer = 0;
  }
  atomic_fetch_and(&self->_triggered, 0xFFFFFFFE);
}

- (void)cancel
{
  atomic_fetch_and(&self->_triggered, 0xFFFFFFFE);
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __21__CUCoalescer_cancel__block_invoke;
  block[3] = &unk_1E55BFC18;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __21__CUCoalescer_cancel__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cancel];
}

- (void)_invalidate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    self->_double startTime = 0.0;
    timer = self->_timer;
    if (timer)
    {
      double v4 = timer;
      dispatch_source_cancel(v4);
      v5 = self->_timer;
      self->_timer = 0;
    }
    v6 = _Block_copy(self->_invalidationHandler);
    BOOL v7 = v6;
    if (v6) {
      (*((void (**)(void *))v6 + 2))(v6);
    }

    id actionHandler = self->_actionHandler;
    self->_id actionHandler = 0;

    id invalidationHandler = self->_invalidationHandler;
    self->_id invalidationHandler = 0;
  }
}

- (void)invalidate
{
  atomic_fetch_and(&self->_triggered, 0xFFFFFFFE);
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __25__CUCoalescer_invalidate__block_invoke;
  block[3] = &unk_1E55BFC18;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __25__CUCoalescer_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)dealloc
{
  if (self->_timer) {
    FatalErrorF((uint64_t)"Timer still active during dealloc", (uint64_t)a2, v2, v3, v4, v5, v6, v7, (uint64_t)v11.receiver);
  }
  id actionHandler = self->_actionHandler;
  self->_id actionHandler = 0;

  id invalidationHandler = self->_invalidationHandler;
  self->_id invalidationHandler = 0;

  v11.receiver = self;
  v11.super_class = (Class)CUCoalescer;
  [(CUCoalescer *)&v11 dealloc];
}

- (CUCoalescer)init
{
  v5.receiver = self;
  v5.super_class = (Class)CUCoalescer;
  uint64_t v2 = [(CUCoalescer *)&v5 init];
  uint64_t v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1E4F14428]);
    *(_OWORD *)&v3->_double maxDelay = xmmword_18E416ED0;
  }
  return v3;
}

@end