@interface FKDelayedOperation
- (FKDelayedOperation)initWithQueue:(id)a3 delay:(double)a4 block:(id)a5;
- (void)_queue_executeBlock;
- (void)_queue_updateLastExecution;
- (void)execute;
- (void)invalidate;
@end

@implementation FKDelayedOperation

- (FKDelayedOperation)initWithQueue:(id)a3 delay:(double)a4 block:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)FKDelayedOperation;
  id v11 = [(FKDelayedOperation *)&v20 init];
  if (v11)
  {
    uint64_t v12 = MEMORY[0x21D4B73C0](v10);
    v13 = (void *)*((void *)v11 + 1);
    *((void *)v11 + 1) = v12;

    objc_storeStrong((id *)v11 + 2, a3);
    *((void *)v11 + 4) = 0;
    dispatch_source_t v14 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, *((dispatch_queue_t *)v11 + 2));
    v15 = (void *)*((void *)v11 + 5);
    *((void *)v11 + 5) = v14;

    *((double *)v11 + 6) = a4;
    v16 = *((void *)v11 + 5);
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __48__FKDelayedOperation_initWithQueue_delay_block___block_invoke;
    handler[3] = &unk_264437B60;
    id v19 = v11;
    dispatch_source_set_event_handler(v16, handler);
    dispatch_resume(*((dispatch_object_t *)v11 + 5));
  }
  return (FKDelayedOperation *)v11;
}

uint64_t __48__FKDelayedOperation_initWithQueue_delay_block___block_invoke(uint64_t result)
{
  int v1 = 1;
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(*(void *)(result + 32) + 24), (unsigned int *)&v1, 0, memory_order_relaxed, memory_order_relaxed);
  if (v1 == 1) {
    return objc_msgSend(*(id *)(result + 32), "_queue_executeBlock");
  }
  return result;
}

- (void)execute
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  CFAbsoluteTime v3 = self->_lastExecution + self->_delay;
  if (v3 >= CFAbsoluteTimeGetCurrent())
  {
    int v5 = 0;
    atomic_compare_exchange_strong_explicit(&self->_blockEnqueued, (unsigned int *)&v5, 1u, memory_order_relaxed, memory_order_relaxed);
    if (!v5)
    {
      timerSource = self->_timerSource;
      dispatch_time_t v7 = dispatch_walltime(0, (uint64_t)(self->_delay * 1000000000.0));
      dispatch_source_set_timer(timerSource, v7, 0xFFFFFFFFFFFFFFFFLL, 0);
    }
  }
  else
  {
    [(FKDelayedOperation *)self _queue_updateLastExecution];
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __29__FKDelayedOperation_execute__block_invoke;
    block[3] = &unk_264437B60;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

uint64_t __29__FKDelayedOperation_execute__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_executeBlock");
}

- (void)invalidate
{
  dispatch_source_cancel((dispatch_source_t)self->_timerSource);
  timerSource = self->_timerSource;
  self->_timerSource = 0;

  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __32__FKDelayedOperation_invalidate__block_invoke;
  block[3] = &unk_264437B60;
  block[4] = self;
  dispatch_async(queue, block);
}

void __32__FKDelayedOperation_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 8);
  *(void *)(v1 + 8) = 0;
}

- (void)_queue_executeBlock
{
  [(FKDelayedOperation *)self _queue_updateLastExecution];
  id block = self->_block;
  if (block)
  {
    v4 = (void (*)(void))*((void *)block + 2);
    v4();
  }
}

- (void)_queue_updateLastExecution
{
  self->_lastExecution = CFAbsoluteTimeGetCurrent();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timerSource, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong(&self->_block, 0);
}

@end