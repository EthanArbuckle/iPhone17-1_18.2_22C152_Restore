@interface HKThrottleCallback
- (BOOL)delayInProgress;
- (HKThrottleCallback)initWithThrottleDelay:(double)a3;
- (OS_dispatch_queue)throttlingQueue;
- (id)lastExecutionBlock;
- (int64_t)throttleDelayInNanoseconds;
- (void)executeWithThrottle:(id)a3;
- (void)setDelayInProgress:(BOOL)a3;
- (void)setLastExecutionBlock:(id)a3;
- (void)setThrottleDelayInNanoseconds:(int64_t)a3;
- (void)setThrottlingQueue:(id)a3;
@end

@implementation HKThrottleCallback

- (HKThrottleCallback)initWithThrottleDelay:(double)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HKThrottleCallback;
  v4 = [(HKThrottleCallback *)&v8 init];
  v5 = v4;
  if (v4)
  {
    [(HKThrottleCallback *)v4 setThrottleDelayInNanoseconds:(uint64_t)(a3 / 0.000000001)];
    dispatch_queue_t v6 = dispatch_queue_create("HKThrottleCallback", 0);
    [(HKThrottleCallback *)v5 setThrottlingQueue:v6];

    [(HKThrottleCallback *)v5 setDelayInProgress:0];
    [(HKThrottleCallback *)v5 setLastExecutionBlock:0];
  }
  return v5;
}

- (void)executeWithThrottle:(id)a3
{
  id v4 = a3;
  v5 = [(HKThrottleCallback *)self throttlingQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__HKThrottleCallback_executeWithThrottle___block_invoke;
  v7[3] = &unk_1E6D51728;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __42__HKThrottleCallback_executeWithThrottle___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) throttleDelayInNanoseconds] < 1)
  {
    v5 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v5();
  }
  else
  {
    int v2 = [*(id *)(a1 + 32) delayInProgress];
    uint64_t v3 = *(void *)(a1 + 40);
    if (v2)
    {
      id v4 = *(void **)(a1 + 32);
      [v4 setLastExecutionBlock:v3];
    }
    else
    {
      (*(void (**)(void))(v3 + 16))(*(void *)(a1 + 40));
      [*(id *)(a1 + 32) setDelayInProgress:1];
      dispatch_time_t v6 = dispatch_time(0xFFFFFFFFFFFFFFFELL, [*(id *)(a1 + 32) throttleDelayInNanoseconds]);
      v7 = [*(id *)(a1 + 32) throttlingQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __42__HKThrottleCallback_executeWithThrottle___block_invoke_2;
      block[3] = &unk_1E6D50ED8;
      block[4] = *(void *)(a1 + 32);
      dispatch_after(v6, v7, block);
    }
  }
}

uint64_t __42__HKThrottleCallback_executeWithThrottle___block_invoke_2(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) lastExecutionBlock];

  if (v2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) lastExecutionBlock];
    v3[2]();

    [*(id *)(a1 + 32) setLastExecutionBlock:0];
  }
  id v4 = *(void **)(a1 + 32);
  return [v4 setDelayInProgress:0];
}

- (int64_t)throttleDelayInNanoseconds
{
  return self->_throttleDelayInNanoseconds;
}

- (void)setThrottleDelayInNanoseconds:(int64_t)a3
{
  self->_throttleDelayInNanoseconds = a3;
}

- (OS_dispatch_queue)throttlingQueue
{
  return self->_throttlingQueue;
}

- (void)setThrottlingQueue:(id)a3
{
}

- (BOOL)delayInProgress
{
  return self->_delayInProgress;
}

- (void)setDelayInProgress:(BOOL)a3
{
  self->_delayInProgress = a3;
}

- (id)lastExecutionBlock
{
  return self->_lastExecutionBlock;
}

- (void)setLastExecutionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_lastExecutionBlock, 0);
  objc_storeStrong((id *)&self->_throttlingQueue, 0);
}

@end