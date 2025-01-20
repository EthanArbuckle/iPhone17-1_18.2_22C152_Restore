@interface HMFBlockOperation
+ (id)blockOperationWithBlock:(id)a3;
- (HMFBlockOperation)initWithTimeout:(double)a3;
- (NSArray)executionBlocks;
- (void)addExecutionBlock:(id)a3;
- (void)main;
@end

@implementation HMFBlockOperation

+ (id)blockOperationWithBlock:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  v6 = (void *)MEMORY[0x19F3A8A20](v4);

  v10[0] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  v8 = (void *)v5[39];
  v5[39] = v7;

  return v5;
}

- (HMFBlockOperation)initWithTimeout:(double)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HMFBlockOperation;
  v3 = [(HMFOperation *)&v7 initWithTimeout:a3];
  id v4 = v3;
  if (v3)
  {
    executionBlocks = v3->_executionBlocks;
    v3->_executionBlocks = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  return v4;
}

- (NSArray)executionBlocks
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_executionBlocks;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)addExecutionBlock:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v10 = v4;
    os_unfair_lock_lock_with_options();
    if (self->super._executing || self->super._finished)
    {
      id v9 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Operation is already executing or has finished." userInfo:0];
      objc_exception_throw(v9);
    }
    executionBlocks = self->_executionBlocks;
    v6 = (void *)MEMORY[0x19F3A8A20](v10);
    objc_super v7 = [(NSArray *)executionBlocks arrayByAddingObject:v6];
    v8 = self->_executionBlocks;
    self->_executionBlocks = v7;

    os_unfair_lock_unlock(&self->super._lock);
    id v4 = v10;
  }
}

- (void)main
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v3 = [(HMFBlockOperation *)self executionBlocks];
  uint64_t v4 = [v3 count];

  if ([(HMFOperation *)self isExecuting]
    && ([(HMFBlockOperation *)self isCancelled] & 1) == 0
    && v4)
  {
    v5 = (void *)MEMORY[0x19F3A87A0]();
    v6 = self;
    objc_super v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = HMFGetLogIdentifier(v6);
      *(_DWORD *)buf = 138543618;
      v23 = v8;
      __int16 v24 = 2048;
      uint64_t v25 = v4;
      _os_log_impl(&dword_19D57B000, v7, OS_LOG_TYPE_INFO, "%{public}@Executing %tu blocks", buf, 0x16u);
    }
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v9 = [(HMFBlockOperation *)v6 executionBlocks];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v18;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8 * v13);
          queue = v6->super._queue;
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __25__HMFBlockOperation_main__block_invoke;
          block[3] = &unk_1E5957E40;
          block[4] = v14;
          dispatch_async(queue, block);
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v11);
    }
  }
}

uint64_t __25__HMFBlockOperation_main__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
}

@end