@interface CalRateLimitingQueue
- (CalRateLimitingQueue)initWithQueue:(id)a3 minimumInterval:(double)a4 andBlock:(id)a5;
- (OS_dispatch_queue)queue;
- (void)executeBlock;
@end

@implementation CalRateLimitingQueue

- (CalRateLimitingQueue)initWithQueue:(id)a3 minimumInterval:(double)a4 andBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v18.receiver = self;
  v18.super_class = (Class)CalRateLimitingQueue;
  v10 = [(CalRateLimitingQueue *)&v18 init];
  if (v10)
  {
    if (v8)
    {
      v11 = (OS_dispatch_queue *)v8;
      queue = v10->_queue;
      v10->_queue = v11;
    }
    else
    {
      queue = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v13 = dispatch_queue_create("CalRateLimitingQueue", queue);
      v14 = v10->_queue;
      v10->_queue = (OS_dispatch_queue *)v13;
    }
    v10->_minimumInterval = (unint64_t)(a4 * 1000000000.0);
    uint64_t v15 = MEMORY[0x192FD8850](v9);
    id block = v10->_block;
    v10->_id block = (id)v15;

    v10->_lock._os_unfair_lock_opaque = 0;
    v10->_executionPending = 0;
    v10->_lastExecutionTimestamp = 0;
  }

  return v10;
}

- (void)executeBlock
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_executionPending)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    self->_executionPending = 1;
    __uint64_t v4 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW) - self->_lastExecutionTimestamp;
    unint64_t minimumInterval = self->_minimumInterval;
    BOOL v6 = minimumInterval >= v4;
    int64_t v7 = minimumInterval - v4;
    if (v6) {
      int64_t v8 = v7;
    }
    else {
      int64_t v8 = 0;
    }
    dispatch_time_t v9 = dispatch_time(0, v8);
    os_unfair_lock_unlock(p_lock);
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __36__CalRateLimitingQueue_executeBlock__block_invoke;
    block[3] = &unk_1E56CD9A0;
    block[4] = self;
    dispatch_after(v9, queue, block);
  }
}

void __36__CalRateLimitingQueue_executeBlock__block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 24));
  *(unsigned char *)(*(void *)(a1 + 32) + 28) = 0;
  *(void *)(*(void *)(a1 + 32) + 32) = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  v2 = (void (**)(void))MEMORY[0x192FD8850](*(void *)(*(void *)(a1 + 32) + 8));
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 24));
  v2[2]();
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong(&self->_block, 0);
}

@end