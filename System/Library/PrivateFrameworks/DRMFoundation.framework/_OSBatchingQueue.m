@interface _OSBatchingQueue
+ (id)queueWithName:(id)a3 maxBatchingDelay:(double)a4 maxQueueDepth:(unint64_t)a5 queue:(id)a6 workItemsHandler:(id)a7;
- (NSMutableArray)workItems;
- (OS_dispatch_queue)executionQueue;
- (OS_dispatch_queue)syncQueue;
- (OS_dispatch_source)timer;
- (_OSBatchingQueue)initWithName:(id)a3 maxBatchingDelay:(double)a4 maxQueueDepth:(unint64_t)a5 queue:(id)a6 workItemsHandler:(id)a7;
- (double)maxDelay;
- (id)workHandler;
- (unint64_t)maxQueueDepth;
- (void)addWorkItem:(id)a3;
- (void)setExecutionQueue:(id)a3;
- (void)setMaxDelay:(double)a3;
- (void)setMaxQueueDepth:(unint64_t)a3;
- (void)setSyncQueue:(id)a3;
- (void)setTimer:(id)a3;
- (void)setWorkHandler:(id)a3;
- (void)setWorkItems:(id)a3;
- (void)unprotectedExecuteWorkItems;
@end

@implementation _OSBatchingQueue

- (_OSBatchingQueue)initWithName:(id)a3 maxBatchingDelay:(double)a4 maxQueueDepth:(unint64_t)a5 queue:(id)a6 workItemsHandler:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  v39.receiver = self;
  v39.super_class = (Class)_OSBatchingQueue;
  v15 = [(_OSBatchingQueue *)&v39 init];
  v16 = v15;
  if (v15)
  {
    v15->_maxDelay = a4;
    unint64_t v17 = 4;
    if (a5) {
      unint64_t v17 = a5;
    }
    v15->_maxQueueDepth = v17;
    uint64_t v18 = MEMORY[0x230F77820](v14);
    id workHandler = v16->_workHandler;
    v16->_id workHandler = (id)v18;

    uint64_t v20 = [MEMORY[0x263EFF980] array];
    workItems = v16->_workItems;
    v16->_workItems = (NSMutableArray *)v20;

    v22 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    if (v13)
    {
      dispatch_queue_t v23 = (dispatch_queue_t)v13;
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"com.apple.dasbatchingqueue.executionqueue.%s", objc_msgSend(v12, "UTF8String"));
      id v24 = objc_claimAutoreleasedReturnValue();
      v25 = (const char *)[v24 UTF8String];

      dispatch_queue_t v23 = dispatch_queue_create(v25, v22);
    }
    executionQueue = v16->_executionQueue;
    v16->_executionQueue = (OS_dispatch_queue *)v23;

    objc_msgSend(NSString, "stringWithFormat:", @"com.apple.dasbatchingqueue.syncqueue.%s", objc_msgSend(v12, "UTF8String"));
    id v27 = objc_claimAutoreleasedReturnValue();
    v28 = (const char *)[v27 UTF8String];

    dispatch_queue_t v29 = dispatch_queue_create(v28, v22);
    syncQueue = v16->_syncQueue;
    v16->_syncQueue = (OS_dispatch_queue *)v29;

    dispatch_source_t v31 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)v16->_syncQueue);
    timer = v16->_timer;
    v16->_timer = (OS_dispatch_source *)v31;

    dispatch_set_qos_class_fallback();
    v33 = v16->_timer;
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __87___OSBatchingQueue_initWithName_maxBatchingDelay_maxQueueDepth_queue_workItemsHandler___block_invoke;
    handler[3] = &unk_2649375C8;
    v38 = v16;
    dispatch_source_set_event_handler(v33, handler);
    v34 = v16->_timer;
    dispatch_time_t v35 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
    dispatch_source_set_timer(v34, v35, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)(a4 / 10.0 * 1000000000.0));
  }
  return v16;
}

+ (id)queueWithName:(id)a3 maxBatchingDelay:(double)a4 maxQueueDepth:(unint64_t)a5 queue:(id)a6 workItemsHandler:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a3;
  id v14 = (void *)[objc_alloc((Class)objc_opt_class()) initWithName:v13 maxBatchingDelay:a5 maxQueueDepth:v12 queue:v11 workItemsHandler:a4];

  return v14;
}

- (void)unprotectedExecuteWorkItems
{
  v3 = (void *)os_transaction_create();
  v4 = [MEMORY[0x263EFF8C0] arrayWithArray:self->_workItems];
  if ([v4 count])
  {
    executionQueue = self->_executionQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __47___OSBatchingQueue_unprotectedExecuteWorkItems__block_invoke;
    block[3] = &unk_2649375F0;
    id v7 = v3;
    v8 = self;
    id v9 = v4;
    dispatch_async(executionQueue, block);
    [(NSMutableArray *)self->_workItems removeAllObjects];
    dispatch_suspend((dispatch_object_t)self->_timer);
  }
}

- (void)addWorkItem:(id)a3
{
  id v4 = a3;
  syncQueue = self->_syncQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __32___OSBatchingQueue_addWorkItem___block_invoke;
  v7[3] = &unk_264937558;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(syncQueue, v7);
}

- (double)maxDelay
{
  return self->_maxDelay;
}

- (void)setMaxDelay:(double)a3
{
  self->_maxDelay = a3;
}

- (unint64_t)maxQueueDepth
{
  return self->_maxQueueDepth;
}

- (void)setMaxQueueDepth:(unint64_t)a3
{
  self->_maxQueueDepth = a3;
}

- (OS_dispatch_queue)syncQueue
{
  return self->_syncQueue;
}

- (void)setSyncQueue:(id)a3
{
}

- (OS_dispatch_queue)executionQueue
{
  return self->_executionQueue;
}

- (void)setExecutionQueue:(id)a3
{
}

- (id)workHandler
{
  return self->_workHandler;
}

- (void)setWorkHandler:(id)a3
{
}

- (NSMutableArray)workItems
{
  return self->_workItems;
}

- (void)setWorkItems:(id)a3
{
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_workItems, 0);
  objc_storeStrong(&self->_workHandler, 0);
  objc_storeStrong((id *)&self->_executionQueue, 0);
  objc_storeStrong((id *)&self->_syncQueue, 0);
}

@end