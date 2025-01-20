@interface CURetrier
- (CURetrier)init;
- (OS_dispatch_queue)dispatchQueue;
- (double)interval;
- (double)leeway;
- (double)startTime;
- (id)actionHandler;
- (id)invalidationHandler;
- (void)failed;
- (void)failedDirect;
- (void)invalidate;
- (void)invalidateDirect;
- (void)setActionHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setInterval:(double)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setLeeway:(double)a3;
- (void)setStartTime:(double)a3;
- (void)start;
- (void)startDirect;
- (void)succeeded;
- (void)succeededDirect;
@end

@implementation CURetrier

- (void)succeededDirect
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  retryTimer = self->_retryTimer;
  if (retryTimer)
  {
    v5 = retryTimer;
    dispatch_source_cancel(v5);
    v4 = self->_retryTimer;
    self->_retryTimer = 0;
  }
}

- (void)setActionHandler:(id)a3
{
}

- (void)setDispatchQueue:(id)a3
{
}

- (CURetrier)init
{
  v6.receiver = self;
  v6.super_class = (Class)CURetrier;
  v2 = [(CURetrier *)&v6 init];
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1E4F14428]);
    *(_OWORD *)&v3->_interval = xmmword_18E416F00;
    v4 = v3;
  }

  return v3;
}

- (void)startDirect
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateCalled)
  {
    retryTimer = self->_retryTimer;
    if (retryTimer)
    {
      v4 = retryTimer;
      dispatch_source_cancel(v4);
      v5 = self->_retryTimer;
      self->_retryTimer = 0;
    }
    self->_startTime = CFAbsoluteTimeGetCurrent();
    objc_super v6 = (void (**)(void))_Block_copy(self->_actionHandler);
    if (v6)
    {
      v7 = v6;
      v6[2]();
      objc_super v6 = v7;
    }
  }
}

- (void)invalidateDirect
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    invalidationHandler = (void (**)(void))self->_invalidationHandler;
    if (invalidationHandler) {
      invalidationHandler[2]();
    }
    id actionHandler = self->_actionHandler;
    self->_id actionHandler = 0;

    id v5 = self->_invalidationHandler;
    self->_invalidationHandler = 0;

    retryTimer = self->_retryTimer;
    if (retryTimer)
    {
      v8 = retryTimer;
      dispatch_source_cancel(v8);
      v7 = self->_retryTimer;
      self->_retryTimer = 0;
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_actionHandler, 0);
  objc_storeStrong((id *)&self->_retryTimer, 0);
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setLeeway:(double)a3
{
  self->_leeway = a3;
}

- (double)leeway
{
  return self->_leeway;
}

- (void)setInterval:(double)a3
{
  self->_interval = a3;
}

- (double)interval
{
  return self->_interval;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (id)actionHandler
{
  return self->_actionHandler;
}

- (void)succeeded
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __22__CURetrier_succeeded__block_invoke;
  block[3] = &unk_1E55BFC18;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __22__CURetrier_succeeded__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) succeededDirect];
}

- (void)failedDirect
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateCalled)
  {
    double leeway = self->_leeway;
    if (leeway < 0.0) {
      double leeway = self->_interval / 10.0;
    }
    double v4 = self->_startTime + self->_interval + (double)arc4random() / 4294967300.0 * leeway + 0.0;
    double v5 = v4 - CFAbsoluteTimeGetCurrent();
    if (v5 <= 0.0)
    {
      [(CURetrier *)self startDirect];
    }
    else
    {
      retryTimer = self->_retryTimer;
      if (retryTimer)
      {
        v7 = retryTimer;
        dispatch_source_cancel(v7);
        v8 = self->_retryTimer;
        self->_retryTimer = 0;
      }
      v9 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
      v10 = self->_retryTimer;
      self->_retryTimer = v9;

      v18 = self->_retryTimer;
      if (!v18) {
        FatalErrorF((uint64_t)"Create retry timer failed", v11, v12, v13, v14, v15, v16, v17, v21);
      }
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __25__CURetrier_failedDirect__block_invoke;
      handler[3] = &unk_1E55BFC18;
      handler[4] = self;
      dispatch_source_set_event_handler(v18, handler);
      v19 = self->_retryTimer;
      dispatch_time_t v20 = dispatch_time(0, (uint64_t)(v5 * 1000000000.0));
      dispatch_source_set_timer(v19, v20, 0xFFFFFFFFFFFFFFFFLL, 0xEE6B280uLL);
      dispatch_resume((dispatch_object_t)self->_retryTimer);
    }
  }
}

uint64_t __25__CURetrier_failedDirect__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) startDirect];
}

- (void)failed
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __19__CURetrier_failed__block_invoke;
  block[3] = &unk_1E55BFC18;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __19__CURetrier_failed__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) failedDirect];
}

- (void)start
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __18__CURetrier_start__block_invoke;
  block[3] = &unk_1E55BFC18;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __18__CURetrier_start__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) startDirect];
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __23__CURetrier_invalidate__block_invoke;
  block[3] = &unk_1E55BFC18;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __23__CURetrier_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidateDirect];
}

@end