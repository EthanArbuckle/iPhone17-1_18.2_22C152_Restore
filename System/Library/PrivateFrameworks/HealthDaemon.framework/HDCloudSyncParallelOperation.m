@interface HDCloudSyncParallelOperation
+ (BOOL)shouldLogAtOperationStart;
+ (BOOL)shouldProduceOperationAnalytics;
- (HDCloudSyncParallelOperation)initWithConfiguration:(id)a3 cloudState:(id)a4;
- (NSArray)operations;
- (void)addOperation:(id)a3;
- (void)addOperationOfClass:(Class)a3;
- (void)main;
- (void)skip;
- (void)synchronousTaskGroup:(id)a3 didFinishWithSuccess:(BOOL)a4 errors:(id)a5;
@end

@implementation HDCloudSyncParallelOperation

+ (BOOL)shouldLogAtOperationStart
{
  return 0;
}

+ (BOOL)shouldProduceOperationAnalytics
{
  return 0;
}

- (HDCloudSyncParallelOperation)initWithConfiguration:(id)a3 cloudState:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)HDCloudSyncParallelOperation;
  v4 = [(HDCloudSyncOperation *)&v10 initWithConfiguration:a3 cloudState:a4];
  if (v4)
  {
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    operations = v4->_operations;
    v4->_operations = v5;

    v7 = (HDSynchronousTaskGroup *)objc_alloc_init(MEMORY[0x1E4F65D90]);
    taskGroup = v4->_taskGroup;
    v4->_taskGroup = v7;

    [(HDSynchronousTaskGroup *)v4->_taskGroup setDelegate:v4];
    v4->_lock._os_unfair_lock_opaque = 0;
  }
  return v4;
}

- (void)main
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ([(NSMutableArray *)self->_operations count])
  {
    uint64_t v3 = 10 * [(NSMutableArray *)self->_operations count];
    v4 = [(HDCloudSyncOperation *)self progress];
    [v4 setTotalUnitCount:v3];

    [(HDSynchronousTaskGroup *)self->_taskGroup beginTask];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v5 = self->_operations;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          objc_super v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          [(HDSynchronousTaskGroup *)self->_taskGroup beginTask];
          v11 = [(HDCloudSyncOperation *)self cloudState];
          [v10 setCloudState:v11];

          v12 = [(HDCloudSyncOperation *)self progress];
          v13 = [v10 progress];
          [v12 addChild:v13 withPendingUnitCount:10];

          [v10 start];
        }
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }

    [(HDSynchronousTaskGroup *)self->_taskGroup finishTask];
  }
  else
  {
    [(HDCloudSyncOperation *)self finishWithSuccess:1 error:0];
  }
}

- (void)skip
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)HDCloudSyncParallelOperation;
  [(HDCloudSyncOperation *)&v12 skip];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t v3 = self->_operations;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "skip", (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v13 count:16];
    }
    while (v5);
  }
}

- (NSArray)operations
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = (void *)[(NSMutableArray *)self->_operations copy];
  os_unfair_lock_unlock(p_lock);

  return (NSArray *)v4;
}

- (void)addOperationOfClass:(Class)a3
{
  id v4 = [a3 alloc];
  uint64_t v5 = [(HDCloudSyncOperation *)self configuration];
  uint64_t v6 = [(HDCloudSyncOperation *)self cloudState];
  id v7 = (id)[v4 initWithConfiguration:v5 cloudState:v6];

  [(HDCloudSyncParallelOperation *)self addOperation:v7];
}

- (void)addOperation:(id)a3
{
  id v5 = a3;
  if ([(HDCloudSyncOperation *)self status])
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"HDCloudSyncParallelOperation.m", 83, @"Invalid parameter not satisfying: %@", @"self.status == HDCloudSyncOperationStatusPending" object file lineNumber description];
  }
  uint64_t v6 = [(HDCloudSyncOperation *)self cloudState];
  [v5 setCloudState:v6];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __45__HDCloudSyncParallelOperation_addOperation___block_invoke;
  v9[3] = &unk_1E62F2928;
  v9[4] = self;
  [v5 setOnSuccess:v9];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __45__HDCloudSyncParallelOperation_addOperation___block_invoke_2;
  v8[3] = &unk_1E62F2950;
  v8[4] = self;
  [v5 setOnError:v8];
  os_unfair_lock_lock(&self->_lock);
  [(NSMutableArray *)self->_operations addObject:v5];

  os_unfair_lock_unlock(&self->_lock);
}

uint64_t __45__HDCloudSyncParallelOperation_addOperation___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 112) finishTask];
}

uint64_t __45__HDCloudSyncParallelOperation_addOperation___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 112), "failTaskWithError:");
}

- (void)synchronousTaskGroup:(id)a3 didFinishWithSuccess:(BOOL)a4 errors:(id)a5
{
  BOOL v5 = a4;
  objc_msgSend(a5, "firstObject", a3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [(HDCloudSyncOperation *)self finishWithSuccess:v5 error:v7];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskGroup, 0);

  objc_storeStrong((id *)&self->_operations, 0);
}

@end