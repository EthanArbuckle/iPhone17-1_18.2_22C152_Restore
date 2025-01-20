@interface CUTDeferredTaskQueue
- (CUTDeferredTaskQueue)initWithCapacity:(int64_t)a3 queue:(id)a4 block:(id)a5;
- (CUTDeferredTaskQueue)initWithNumberCapacity:(id)a3 queue:(id)a4 block:(id)a5;
- (CUTDeferredTaskQueue)initWithQueue:(id)a3 block:(id)a4;
- (NSMutableArray)pendingDispatchBlocks;
- (NSNumber)capacity;
- (OS_dispatch_queue)queue;
- (id)originalBlock;
- (os_unfair_lock_s)lock;
- (void)cancelPendingExecutions;
- (void)enqueueExecutionWithTarget:(id)a3 afterDelay:(double)a4;
@end

@implementation CUTDeferredTaskQueue

- (CUTDeferredTaskQueue)initWithCapacity:(int64_t)a3 queue:(id)a4 block:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (a3 < 0) {
    sub_1A3564950();
  }
  v10 = v9;
  v11 = [NSNumber numberWithInteger:a3];
  v12 = [(CUTDeferredTaskQueue *)self initWithNumberCapacity:v11 queue:v8 block:v10];

  return v12;
}

- (CUTDeferredTaskQueue)initWithNumberCapacity:(id)a3 queue:(id)a4 block:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CUTDeferredTaskQueue;
  v12 = [(CUTDeferredTaskQueue *)&v17 init];
  v13 = v12;
  if (v12)
  {
    v12->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v12->_capacity, a3);
    objc_storeStrong((id *)&v13->_queue, a4);
    uint64_t v14 = MEMORY[0x1A6249D30](v11);
    id originalBlock = v13->_originalBlock;
    v13->_id originalBlock = (id)v14;
  }
  return v13;
}

- (CUTDeferredTaskQueue)initWithQueue:(id)a3 block:(id)a4
{
  return [(CUTDeferredTaskQueue *)self initWithNumberCapacity:0 queue:a3 block:a4];
}

- (void)enqueueExecutionWithTarget:(id)a3 afterDelay:(double)a4
{
  id v6 = a3;
  uint64_t v32 = 0;
  v33 = (id *)&v32;
  uint64_t v34 = 0x3042000000;
  v35 = sub_1A35569C8;
  v36 = sub_1A35569D4;
  id v37 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1A35569DC;
  block[3] = &unk_1E5AFEAB0;
  block[4] = self;
  v31 = &v32;
  id v7 = v6;
  id v30 = v7;
  dispatch_block_t v8 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  objc_storeWeak(v33 + 5, v8);
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  while (1)
  {
    id v10 = [(CUTDeferredTaskQueue *)self capacity];
    if (!v10) {
      break;
    }
    id v11 = [(CUTDeferredTaskQueue *)self pendingDispatchBlocks];
    unint64_t v12 = [v11 count];
    v13 = [(CUTDeferredTaskQueue *)self capacity];
    unint64_t v14 = [v13 integerValue];

    if (v12 < v14) {
      break;
    }
    v15 = (void *)MEMORY[0x1A6249B10]();
    v16 = [(CUTDeferredTaskQueue *)self pendingDispatchBlocks];
    objc_super v17 = [v16 objectAtIndex:0];

    v18 = [(CUTDeferredTaskQueue *)self pendingDispatchBlocks];
    [v18 removeObjectAtIndex:0];

    dispatch_block_cancel(v17);
    v19 = [(CUTDeferredTaskQueue *)self pendingDispatchBlocks];
    uint64_t v20 = [v19 count];

    if (!v20)
    {
      pendingDispatchBlocks = self->_pendingDispatchBlocks;
      self->_pendingDispatchBlocks = 0;
    }
  }
  v22 = [(CUTDeferredTaskQueue *)self pendingDispatchBlocks];

  if (!v22)
  {
    v23 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v24 = self->_pendingDispatchBlocks;
    self->_pendingDispatchBlocks = v23;
  }
  v25 = [(CUTDeferredTaskQueue *)self pendingDispatchBlocks];
  v26 = (void *)MEMORY[0x1A6249D30](v8);
  [v25 addObject:v26];

  dispatch_time_t v27 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
  v28 = [(CUTDeferredTaskQueue *)self queue];
  dispatch_after(v27, v28, v8);

  os_unfair_lock_unlock(p_lock);
  _Block_object_dispose(&v32, 8);
  objc_destroyWeak(&v37);
}

- (void)cancelPendingExecutions
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v4 = [(CUTDeferredTaskQueue *)self pendingDispatchBlocks];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        dispatch_block_cancel(*(dispatch_block_t *)(*((void *)&v11 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  id v9 = [(CUTDeferredTaskQueue *)self pendingDispatchBlocks];
  [v9 removeAllObjects];

  pendingDispatchBlocks = self->_pendingDispatchBlocks;
  self->_pendingDispatchBlocks = 0;

  os_unfair_lock_unlock(p_lock);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (id)originalBlock
{
  return self->_originalBlock;
}

- (NSMutableArray)pendingDispatchBlocks
{
  return self->_pendingDispatchBlocks;
}

- (NSNumber)capacity
{
  return self->_capacity;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_capacity, 0);
  objc_storeStrong((id *)&self->_pendingDispatchBlocks, 0);
  objc_storeStrong(&self->_originalBlock, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end