@interface AXDispatchTimer
- (AXDispatchTimer)init;
- (AXDispatchTimer)initWithTargetSerialQueue:(id)a3;
- (BOOL)automaticallyCancelPendingBlockUponSchedulingNewBlock;
- (BOOL)isActive;
- (BOOL)isCancelled;
- (BOOL)isPending;
- (BOOL)useWallTime;
- (NSString)label;
- (OS_dispatch_queue)dispatchQueue;
- (OS_dispatch_source)dispatchTimer;
- (id)cancelBlock;
- (id)description;
- (id)processBlock;
- (void)_afterDelay:(double)a3 processBlock:(id)a4 cancelBlock:(id)a5;
- (void)_reallyCancel;
- (void)afterDelay:(double)a3 processBlock:(id)a4;
- (void)afterDelay:(double)a3 processBlock:(id)a4 cancelBlock:(id)a5;
- (void)cancel;
- (void)dealloc;
- (void)setActive:(BOOL)a3;
- (void)setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:(BOOL)a3;
- (void)setCancelBlock:(id)a3;
- (void)setCancelled:(BOOL)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setDispatchTimer:(id)a3;
- (void)setLabel:(id)a3;
- (void)setPending:(BOOL)a3;
- (void)setProcessBlock:(id)a3;
- (void)setUseWallTime:(BOOL)a3;
@end

@implementation AXDispatchTimer

uint64_t __56__AXDispatchTimer__afterDelay_processBlock_cancelBlock___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setPending:0];
  [*(id *)(a1 + 32) setActive:1];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  [*(id *)(a1 + 32) setActive:0];
  dispatch_source_set_cancel_handler(*(dispatch_source_t *)(a1 + 40), &__block_literal_global_3);
  v2 = *(void **)(a1 + 32);
  return [v2 _reallyCancel];
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (void)cancel
{
  [(AXDispatchTimer *)self setCancelled:1];
  [(AXDispatchTimer *)self setPending:0];
  uint64_t v3 = [dispatch_get_specific(&DispatchQueueIDKey) unsignedLongLongValue];
  v4 = [(AXDispatchTimer *)self dispatchQueue];
  v5 = v4;
  if ((void *)v3 != v4)
  {

    goto LABEL_7;
  }
  BOOL v6 = [(AXDispatchTimer *)self isActive];

  if (v6)
  {
LABEL_7:
    v7 = [(AXDispatchTimer *)self dispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __25__AXDispatchTimer_cancel__block_invoke;
    block[3] = &unk_1E5672590;
    block[4] = self;
    dispatch_async(v7, block);

    return;
  }
  [(AXDispatchTimer *)self _reallyCancel];
}

- (void)afterDelay:(double)a3 processBlock:(id)a4 cancelBlock:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  [(AXDispatchTimer *)self setCancelled:0];
  [(AXDispatchTimer *)self setPending:1];
  [(AXDispatchTimer *)self setCancelBlock:v9];
  [(AXDispatchTimer *)self setProcessBlock:v8];
  uint64_t v10 = [dispatch_get_specific(&DispatchQueueIDKey) unsignedLongLongValue];
  v11 = [(AXDispatchTimer *)self dispatchQueue];
  v12 = v11;
  if ((void *)v10 != v11)
  {

    goto LABEL_5;
  }
  BOOL v13 = [(AXDispatchTimer *)self isActive];

  if (v13)
  {
LABEL_5:
    v14 = [(AXDispatchTimer *)self dispatchQueue];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __55__AXDispatchTimer_afterDelay_processBlock_cancelBlock___block_invoke;
    v15[3] = &unk_1E5672EF8;
    v15[4] = self;
    double v18 = a3;
    id v16 = v8;
    id v17 = v9;
    dispatch_async(v14, v15);

    goto LABEL_6;
  }
  [(AXDispatchTimer *)self _afterDelay:v8 processBlock:v9 cancelBlock:a3];
LABEL_6:
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setPending:(BOOL)a3
{
  self->_pending = a3;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (void)_reallyCancel
{
  uint64_t v3 = [(AXDispatchTimer *)self dispatchTimer];
  BOOL v6 = v3;
  if (v3)
  {
    dispatch_source_cancel(v3);
    [(AXDispatchTimer *)self setDispatchTimer:0];
  }
  else
  {
    v4 = [(AXDispatchTimer *)self cancelBlock];

    if (v4)
    {
      v5 = [(AXDispatchTimer *)self cancelBlock];
      v5[2]();
    }
  }
  [(AXDispatchTimer *)self setCancelBlock:0];
  [(AXDispatchTimer *)self setProcessBlock:0];
}

- (void)setProcessBlock:(id)a3
{
}

- (void)setCancelBlock:(id)a3
{
}

- (OS_dispatch_source)dispatchTimer
{
  return self->_dispatchTimer;
}

- (void)_afterDelay:(double)a3 processBlock:(id)a4 cancelBlock:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (![(AXDispatchTimer *)self isCancelled])
  {
    uint64_t v10 = [(AXDispatchTimer *)self dispatchTimer];

    if (v10)
    {
      if (![(AXDispatchTimer *)self automaticallyCancelPendingBlockUponSchedulingNewBlock])goto LABEL_11; {
      [(AXDispatchTimer *)self _reallyCancel];
      }
    }
    v11 = [(AXDispatchTimer *)self dispatchQueue];
    v12 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v11);

    if ([(AXDispatchTimer *)self useWallTime]) {
      dispatch_time_t v13 = dispatch_walltime(0, (uint64_t)(a3 * 1000000000.0));
    }
    else {
      dispatch_time_t v13 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    }
    dispatch_source_set_timer(v12, v13, 0xFFFFFFFFFFFFFFFFLL, 0);
    if (v9)
    {
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __56__AXDispatchTimer__afterDelay_processBlock_cancelBlock___block_invoke;
      handler[3] = &unk_1E5672EA8;
      handler[4] = self;
      id v19 = v9;
      dispatch_source_set_cancel_handler(v12, handler);
    }
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __56__AXDispatchTimer__afterDelay_processBlock_cancelBlock___block_invoke_2;
    v15[3] = &unk_1E5672ED0;
    v15[4] = self;
    id v16 = v12;
    id v17 = v8;
    v14 = v12;
    dispatch_source_set_event_handler(v14, v15);
    dispatch_resume(v14);
    [(AXDispatchTimer *)self setDispatchTimer:v14];
  }
LABEL_11:
}

- (void)setDispatchTimer:(id)a3
{
}

- (BOOL)useWallTime
{
  return self->_useWallTime;
}

- (BOOL)isCancelled
{
  return self->_cancelled;
}

- (id)cancelBlock
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)afterDelay:(double)a3 processBlock:(id)a4
{
}

- (BOOL)isPending
{
  return self->_pending;
}

uint64_t __25__AXDispatchTimer_cancel__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reallyCancel];
}

uint64_t __55__AXDispatchTimer_afterDelay_processBlock_cancelBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _afterDelay:*(void *)(a1 + 40) processBlock:*(void *)(a1 + 48) cancelBlock:*(double *)(a1 + 56)];
}

- (AXDispatchTimer)init
{
  return [(AXDispatchTimer *)self initWithTargetSerialQueue:0];
}

- (AXDispatchTimer)initWithTargetSerialQueue:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)AXDispatchTimer;
  v5 = [(AXDispatchTimer *)&v20 init];
  BOOL v6 = v5;
  if (v5)
  {
    if (v4)
    {
      [(AXDispatchTimer *)v5 setDispatchQueue:v4];
    }
    else
    {
      id v7 = [NSString alloc];
      id v8 = [MEMORY[0x1E4F28B50] mainBundle];
      id v9 = [v8 bundleIdentifier];
      uint64_t v10 = (objc_class *)objc_opt_class();
      v11 = NSStringFromClass(v10);
      v12 = (void *)[v7 initWithFormat:@"%@.%@.TimerQueue", v9, v11];

      id v13 = v12;
      dispatch_queue_t v14 = dispatch_queue_create((const char *)[v13 UTF8String], 0);
      [(AXDispatchTimer *)v6 setDispatchQueue:v14];
    }
    v15 = [(AXDispatchTimer *)v6 dispatchQueue];
    id v16 = NSNumber;
    id v17 = [(AXDispatchTimer *)v6 dispatchQueue];
    id v18 = [v16 numberWithUnsignedLongLong:v17];
    dispatch_queue_set_specific(v15, &DispatchQueueIDKey, v18, (dispatch_function_t)destructor);
  }
  return v6;
}

- (void)dealloc
{
  [(AXDispatchTimer *)self _reallyCancel];
  v3.receiver = self;
  v3.super_class = (Class)AXDispatchTimer;
  [(AXDispatchTimer *)&v3 dealloc];
}

uint64_t __56__AXDispatchTimer__afterDelay_processBlock_cancelBlock___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setPending:0];
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

- (id)description
{
  objc_super v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)AXDispatchTimer;
  id v4 = [(AXDispatchTimer *)&v8 description];
  v5 = [(AXDispatchTimer *)self label];
  BOOL v6 = [v3 stringWithFormat:@"%@ - %@", v4, v5];

  return v6;
}

- (BOOL)isActive
{
  return self->_active;
}

- (BOOL)automaticallyCancelPendingBlockUponSchedulingNewBlock
{
  return self->_automaticallyCancelPendingBlockUponSchedulingNewBlock;
}

- (void)setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:(BOOL)a3
{
  self->_automaticallyCancelPendingBlockUponSchedulingNewBlock = a3;
}

- (void)setUseWallTime:(BOOL)a3
{
  self->_useWallTime = a3;
}

- (void)setDispatchQueue:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (id)processBlock
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cancelBlock, 0);
  objc_storeStrong(&self->_processBlock, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_dispatchTimer, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end