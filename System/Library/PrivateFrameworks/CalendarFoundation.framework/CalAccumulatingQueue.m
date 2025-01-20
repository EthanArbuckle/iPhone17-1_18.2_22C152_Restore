@interface CalAccumulatingQueue
- (CalAccumulatingQueue)initWithQueue:(id)a3 andBlock:(id)a4;
- (CalAccumulatingQueue)initWithQueue:(id)a3 andBlock:(id)a4 delay:(double)a5;
- (CalAccumulatingQueue)initWithQueue:(id)a3 andBlock:(id)a4 throttle:(id)a5;
- (id)_initWithQueue:(id)a3 andBlock:(id)a4 delay:(double)a5 throttle:(id)a6;
- (void)_callTargetBlockAndReset;
- (void)_cancelPendingTimer;
- (void)_executeBlockWithThrottleBlock;
- (void)_executeBlockWithoutThrottleBlock;
- (void)_scheduleTimerWithDelay:(double)a3;
- (void)executeBlock;
- (void)updateTags:(id)a3;
- (void)updateTags:(id)a3 withContext:(id)a4;
- (void)updateTagsAndExecuteBlock:(id)a3;
- (void)updateTagsAndExecuteBlock:(id)a3 withContext:(id)a4;
@end

@implementation CalAccumulatingQueue

- (CalAccumulatingQueue)initWithQueue:(id)a3 andBlock:(id)a4 delay:(double)a5
{
  return (CalAccumulatingQueue *)[(CalAccumulatingQueue *)self _initWithQueue:a3 andBlock:a4 delay:0 throttle:a5];
}

- (CalAccumulatingQueue)initWithQueue:(id)a3 andBlock:(id)a4
{
  return (CalAccumulatingQueue *)[(CalAccumulatingQueue *)self _initWithQueue:a3 andBlock:a4 delay:0 throttle:0.0];
}

- (void)updateTagsAndExecuteBlock:(id)a3 withContext:(id)a4
{
  [(CalAccumulatingQueue *)self updateTags:a3 withContext:a4];

  [(CalAccumulatingQueue *)self executeBlock];
}

- (void)updateTagsAndExecuteBlock:(id)a3
{
}

- (CalAccumulatingQueue)initWithQueue:(id)a3 andBlock:(id)a4 throttle:(id)a5
{
  return (CalAccumulatingQueue *)[(CalAccumulatingQueue *)self _initWithQueue:a3 andBlock:a4 delay:a5 throttle:0.0];
}

- (id)_initWithQueue:(id)a3 andBlock:(id)a4 delay:(double)a5 throttle:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v25.receiver = self;
  v25.super_class = (Class)CalAccumulatingQueue;
  v13 = [(CalAccumulatingQueue *)&v25 init];
  if (v13)
  {
    if (v10) {
      dispatch_queue_t v14 = (dispatch_queue_t)v10;
    }
    else {
      dispatch_queue_t v14 = dispatch_queue_create("CalAccumulatingQueue", 0);
    }
    queue = v13->_queue;
    v13->_queue = (OS_dispatch_queue *)v14;

    uint64_t v16 = [v11 copy];
    id block = v13->_block;
    v13->_id block = (id)v16;

    uint64_t v18 = [v12 copy];
    id throttleBlock = v13->_throttleBlock;
    v13->_id throttleBlock = (id)v18;

    uint64_t v20 = [MEMORY[0x1E4F1CA80] set];
    tags = v13->_tags;
    v13->_tags = (NSMutableSet *)v20;

    uint64_t v22 = [MEMORY[0x1E4F1CA60] dictionary];
    context = v13->_context;
    v13->_context = (NSMutableDictionary *)v22;

    v13->_delay = a5;
    v13->_executionPending = 0;
  }

  return v13;
}

- (void)_cancelPendingTimer
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  pendingExecutionTimer = self->_pendingExecutionTimer;
  if (pendingExecutionTimer)
  {
    dispatch_source_cancel(pendingExecutionTimer);
    v4 = self->_pendingExecutionTimer;
    self->_pendingExecutionTimer = 0;

    self->_pendingPopTime = 0;
  }
}

- (void)_scheduleTimerWithDelay:(double)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (a3 <= 0.0)
  {
    [(CalAccumulatingQueue *)self _cancelPendingTimer];
    [(CalAccumulatingQueue *)self _callTargetBlockAndReset];
  }
  else
  {
    dispatch_time_t v5 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    if (self->_pendingPopTime - 1 >= v5)
    {
      unint64_t v6 = v5;
      [(CalAccumulatingQueue *)self _cancelPendingTimer];
      v7 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_queue);
      pendingExecutionTimer = self->_pendingExecutionTimer;
      self->_pendingExecutionTimer = v7;

      self->_pendingPopTime = v6;
      dispatch_source_set_timer((dispatch_source_t)self->_pendingExecutionTimer, v6, 0xFFFFFFFFFFFFFFFFLL, 0);
      v9 = self->_pendingExecutionTimer;
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __48__CalAccumulatingQueue__scheduleTimerWithDelay___block_invoke;
      handler[3] = &unk_1E56CD9A0;
      handler[4] = self;
      dispatch_source_set_event_handler(v9, handler);
      dispatch_resume((dispatch_object_t)self->_pendingExecutionTimer);
    }
  }
}

uint64_t __48__CalAccumulatingQueue__scheduleTimerWithDelay___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _cancelPendingTimer];
  v2 = *(void **)(a1 + 32);

  return [v2 _callTargetBlockAndReset];
}

- (void)_callTargetBlockAndReset
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = self;
  objc_sync_enter(v3);
  id v5 = [(NSMutableSet *)v3->_tags allObjects];
  v4 = (void *)[(NSMutableDictionary *)v3->_context copy];
  [(NSMutableSet *)v3->_tags removeAllObjects];
  [(NSMutableDictionary *)v3->_context removeAllObjects];
  v3->_executionPending = 0;
  objc_sync_exit(v3);

  if ([v5 count] || objc_msgSend(v4, "count")) {
    (*((void (**)(void))v3->_block + 2))();
  }
}

- (void)_executeBlockWithoutThrottleBlock
{
  obj = self;
  objc_sync_enter(obj);
  v2 = obj;
  if (!obj->_executionPending
    && ((uint64_t v3 = [(NSMutableSet *)obj->_tags count], v2 = obj, v3)
     || (uint64_t v4 = [(NSMutableDictionary *)obj->_context count], v2 = obj, v4)))
  {
    v2->_executionPending = 1;
    objc_sync_exit(v2);

    dispatch_time_t v5 = dispatch_time(0, (uint64_t)(obj->_delay * 1000000000.0));
    queue = obj->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[3] = &unk_1E56CD9A0;
    block[4] = obj;
    block[2] = __57__CalAccumulatingQueue__executeBlockWithoutThrottleBlock__block_invoke;
    dispatch_after(v5, queue, block);
  }
  else
  {
    objc_sync_exit(v2);
  }
}

uint64_t __57__CalAccumulatingQueue__executeBlockWithoutThrottleBlock__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _callTargetBlockAndReset];
}

- (void)_executeBlockWithThrottleBlock
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__CalAccumulatingQueue__executeBlockWithThrottleBlock__block_invoke;
  block[3] = &unk_1E56CD9A0;
  block[4] = self;
  dispatch_async(queue, block);
}

void __54__CalAccumulatingQueue__executeBlockWithThrottleBlock__block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  id v4 = [*(id *)(*(void *)(a1 + 32) + 40) allObjects];
  uint64_t v3 = (void *)[*(id *)(*(void *)(a1 + 32) + 48) copy];
  objc_sync_exit(v2);

  if ([v4 count] || objc_msgSend(v3, "count"))
  {
    (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 24) + 16))();
    objc_msgSend(*(id *)(a1 + 32), "_scheduleTimerWithDelay:");
  }
}

- (void)executeBlock
{
  if (self->_throttleBlock) {
    [(CalAccumulatingQueue *)self _executeBlockWithThrottleBlock];
  }
  else {
    [(CalAccumulatingQueue *)self _executeBlockWithoutThrottleBlock];
  }
}

- (void)updateTags:(id)a3
{
}

- (void)updateTags:(id)a3 withContext:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v17 = a4;
  v7 = self;
  objc_sync_enter(v7);
  if (v6) {
    [(NSMutableSet *)v7->_tags addObjectsFromArray:v6];
  }
  uint64_t v16 = v6;
  if (v17)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v8 = v17;
    uint64_t v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16, v6);
    if (!v9) {
      goto LABEL_20;
    }
    uint64_t v10 = *(void *)v19;
    while (1)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        v13 = [(NSMutableDictionary *)v7->_context objectForKeyedSubscript:v12];
        dispatch_queue_t v14 = [v8 objectForKeyedSubscript:v12];
        if (v13)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v15 = [v13 arrayByAddingObjectsFromArray:v14];
              [(NSMutableDictionary *)v7->_context setObject:v15 forKeyedSubscript:v12];
LABEL_16:

              goto LABEL_18;
            }
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v15 = [v13 setByAddingObjectsFromSet:v14];
              [(NSMutableDictionary *)v7->_context setObject:v15 forKeyedSubscript:v12];
              goto LABEL_16;
            }
          }
        }
        [(NSMutableDictionary *)v7->_context setObject:v14 forKeyedSubscript:v12];
LABEL_18:
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (!v9)
      {
LABEL_20:

        break;
      }
    }
  }
  objc_sync_exit(v7);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingExecutionTimer, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_tags, 0);
  objc_storeStrong(&self->_throttleBlock, 0);
  objc_storeStrong(&self->_block, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end