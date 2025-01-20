@interface AMSUIWebFlowTimeout
+ (id)timeoutWithTimeout:(double)a3 queue:(id)a4 block:(id)a5;
- (AMSUIWebFlowTimeout)initWithTimeout:(double)a3 queue:(id)a4 block:(id)a5;
- (NSDate)startTime;
- (OS_dispatch_queue)queue;
- (double)timeRemaining;
- (double)timeout;
- (id)block;
- (id)enqueuedBlock;
- (void)pause;
- (void)reset;
- (void)setBlock:(id)a3;
- (void)setEnqueuedBlock:(id)a3;
- (void)setQueue:(id)a3;
- (void)setStartTime:(id)a3;
- (void)setTimeRemaining:(double)a3;
- (void)setTimeout:(double)a3;
- (void)start;
@end

@implementation AMSUIWebFlowTimeout

- (AMSUIWebFlowTimeout)initWithTimeout:(double)a3 queue:(id)a4 block:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)AMSUIWebFlowTimeout;
  v11 = [(AMSUIWebFlowTimeout *)&v16 init];
  v12 = v11;
  if (v11)
  {
    v11->_timeout = a3;
    v11->_timeRemaining = a3;
    objc_storeStrong((id *)&v11->_queue, a4);
    v13 = _Block_copy(v10);
    id block = v12->_block;
    v12->_id block = v13;
  }
  return v12;
}

+ (id)timeoutWithTimeout:(double)a3 queue:(id)a4 block:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = (void *)[objc_alloc((Class)objc_opt_class()) initWithTimeout:v8 queue:v7 block:a3];

  return v9;
}

- (void)start
{
  v3 = [(AMSUIWebFlowTimeout *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __28__AMSUIWebFlowTimeout_start__block_invoke;
  v7[3] = &unk_2643E3118;
  v7[4] = self;
  v4 = v7;
  v5 = AMSLogKey();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __AMSDispatchAsync_block_invoke_7;
  block[3] = &unk_2643E33B0;
  id v9 = v5;
  id v10 = v4;
  id v6 = v5;
  dispatch_async(v3, block);
}

void __28__AMSUIWebFlowTimeout_start__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) enqueuedBlock];

  if (!v2)
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    uint64_t v16 = MEMORY[0x263EF8330];
    uint64_t v17 = 3221225472;
    v18 = __28__AMSUIWebFlowTimeout_start__block_invoke_2;
    v19 = &unk_2643E37D0;
    objc_copyWeak(&v20, &location);
    dispatch_block_t v3 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, &v16);
    objc_msgSend(*(id *)(a1 + 32), "setEnqueuedBlock:", v3, v16, v17, v18, v19);

    v4 = [MEMORY[0x263EFF910] now];
    [*(id *)(a1 + 32) setStartTime:v4];

    v5 = [*(id *)(a1 + 32) queue];
    [*(id *)(a1 + 32) timeRemaining];
    double v7 = v6;
    id v8 = [*(id *)(a1 + 32) enqueuedBlock];
    id v9 = v5;
    id v10 = v8;
    v11 = AMSLogKey();
    double v12 = v7 * 1000000000.0;
    if (v7 <= 0.01) {
      double v12 = 10000000.0;
    }
    if (v12 <= 9.22337204e18) {
      dispatch_time_t v13 = dispatch_time(0, (uint64_t)v12);
    }
    else {
      dispatch_time_t v13 = -1;
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __AMSDispatchAfter_block_invoke_0;
    block[3] = &unk_2643E33B0;
    id v23 = v11;
    id v24 = v10;
    id v14 = v11;
    id v15 = v10;
    dispatch_after(v13, v9, block);

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
}

void __28__AMSUIWebFlowTimeout_start__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setEnqueuedBlock:0];
  v1 = [WeakRetained block];
  ((void (**)(void, id))v1)[2](v1, WeakRetained);
}

- (void)pause
{
  dispatch_block_t v3 = [(AMSUIWebFlowTimeout *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __28__AMSUIWebFlowTimeout_pause__block_invoke;
  v7[3] = &unk_2643E3118;
  v7[4] = self;
  v4 = v7;
  v5 = AMSLogKey();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __AMSDispatchAsync_block_invoke_7;
  block[3] = &unk_2643E33B0;
  id v9 = v5;
  id v10 = v4;
  id v6 = v5;
  dispatch_async(v3, block);
}

void __28__AMSUIWebFlowTimeout_pause__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) enqueuedBlock];

  if (v2)
  {
    dispatch_block_t v3 = [*(id *)(a1 + 32) enqueuedBlock];
    dispatch_block_cancel(v3);

    [*(id *)(a1 + 32) setEnqueuedBlock:0];
    [*(id *)(a1 + 32) timeRemaining];
    double v5 = v4;
    id v6 = [*(id *)(a1 + 32) startTime];
    [v6 timeIntervalSinceNow];
    double v8 = v7;

    double v9 = -v8;
    if (v8 >= 0.0) {
      double v9 = v8;
    }
    double v10 = v5 - v9;
    if (v10 < 0.0)
    {
      [*(id *)(a1 + 32) timeout];
      if (v10 > v11) {
        double v10 = 0.0;
      }
    }
    double v12 = *(void **)(a1 + 32);
    [v12 setTimeRemaining:v10];
  }
}

- (void)reset
{
  [(AMSUIWebFlowTimeout *)self pause];
  dispatch_block_t v3 = [(AMSUIWebFlowTimeout *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __28__AMSUIWebFlowTimeout_reset__block_invoke;
  v7[3] = &unk_2643E3118;
  v7[4] = self;
  double v4 = v7;
  double v5 = AMSLogKey();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __AMSDispatchAsync_block_invoke_7;
  block[3] = &unk_2643E33B0;
  id v9 = v5;
  id v10 = v4;
  id v6 = v5;
  dispatch_async(v3, block);
}

uint64_t __28__AMSUIWebFlowTimeout_reset__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) timeout];
  v2 = *(void **)(a1 + 32);
  return objc_msgSend(v2, "setTimeRemaining:");
}

- (id)enqueuedBlock
{
  return self->_enqueuedBlock;
}

- (void)setEnqueuedBlock:(id)a3
{
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSDate)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(id)a3
{
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (double)timeRemaining
{
  return self->_timeRemaining;
}

- (void)setTimeRemaining:(double)a3
{
  self->_timeRemaining = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong(&self->_enqueuedBlock, 0);
}

@end