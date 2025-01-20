@interface FMQueueSynchronizer
- (FMQueueSynchronizer)initWithQueue:(id)a3;
- (OS_dispatch_queue)queue;
- (void)conditionalSync:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation FMQueueSynchronizer

- (void).cxx_destruct
{
}

- (FMQueueSynchronizer)initWithQueue:(id)a3
{
  v5 = a3;
  dispatch_assert_queue_not_V2(v5);
  v11.receiver = self;
  v11.super_class = (Class)FMQueueSynchronizer;
  v6 = [(FMQueueSynchronizer *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __37__FMQueueSynchronizer_initWithQueue___block_invoke;
    block[3] = &unk_1E60193F0;
    dispatch_queue_t v10 = v5;
    dispatch_sync(v10, block);
  }
  return v7;
}

void __37__FMQueueSynchronizer_initWithQueue___block_invoke(uint64_t a1)
{
}

- (void)conditionalSync:(id)a3
{
  v4 = (void (**)(void))a3;
  if (dispatch_get_specific(&QueueContextKey))
  {
    v4[2](v4);
  }
  else
  {
    v5 = [(FMQueueSynchronizer *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __39__FMQueueSynchronizer_conditionalSync___block_invoke;
    block[3] = &unk_1E6019648;
    v7 = v4;
    dispatch_sync(v5, block);
  }
}

uint64_t __39__FMQueueSynchronizer_conditionalSync___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

@end