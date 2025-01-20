@interface HKHealthQueryFetchOperation
- (HKHealthQueryFetchOperation)initWithHealthStore:(id)a3 operationDescription:(id)a4 completion:(id)a5;
- (NSArray)queries;
- (void)completedWithResults:(id)a3 error:(id)a4;
- (void)setQueries:(id)a3;
- (void)startOperationWithCompletion:(id)a3;
- (void)stopOperation;
@end

@implementation HKHealthQueryFetchOperation

- (HKHealthQueryFetchOperation)initWithHealthStore:(id)a3 operationDescription:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HKHealthQueryFetchOperation;
  v11 = [(HKFetchOperation *)&v17 initWithOperationDescription:a4];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_healthStore, a3);
    v13 = _Block_copy(v10);
    id lockedClientCompletion = v12->_lockedClientCompletion;
    v12->_id lockedClientCompletion = v13;

    id lockedFetchOperationManager = v12->_lockedFetchOperationManager;
    v12->_id lockedFetchOperationManager = 0;

    v12->_callbackLock._os_unfair_lock_opaque = 0;
  }

  return v12;
}

- (void)startOperationWithCompletion:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock(&self->_callbackLock);
  v5 = _Block_copy(v4);
  id lockedFetchOperationManager = self->_lockedFetchOperationManager;
  self->_id lockedFetchOperationManager = v5;

  os_unfair_lock_unlock(&self->_callbackLock);
  if ([(NSArray *)self->_queries count])
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v7 = self->_queries;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          -[HKHealthStore executeQuery:](self->_healthStore, "executeQuery:", *(void *)(*((void *)&v12 + 1) + 8 * v11++), (void)v12);
        }
        while (v9 != v11);
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
  else
  {
    [(HKHealthQueryFetchOperation *)self completedWithResults:MEMORY[0x1E4F1CBF0] error:0];
  }
}

- (void)stopOperation
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v3 = self->_queries;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        -[HKHealthStore stopQuery:](self->_healthStore, "stopQuery:", *(void *)(*((void *)&v10 + 1) + 8 * v7++), (void)v10);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  os_unfair_lock_lock(&self->_callbackLock);
  id lockedClientCompletion = self->_lockedClientCompletion;
  self->_id lockedClientCompletion = 0;

  id lockedFetchOperationManager = self->_lockedFetchOperationManager;
  self->_id lockedFetchOperationManager = 0;

  os_unfair_lock_unlock(&self->_callbackLock);
}

- (void)completedWithResults:(id)a3 error:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  os_unfair_lock_lock(&self->_callbackLock);
  id lockedClientCompletion = (void (**)(id, HKHealthQueryFetchOperation *, id, id))self->_lockedClientCompletion;
  if (lockedClientCompletion)
  {
    lockedClientCompletion[2](lockedClientCompletion, self, v11, v6);
    id v8 = self->_lockedClientCompletion;
    self->_id lockedClientCompletion = 0;
  }
  id lockedFetchOperationManager = (void (**)(id, BOOL, id))self->_lockedFetchOperationManager;
  if (lockedFetchOperationManager)
  {
    lockedFetchOperationManager[2](lockedFetchOperationManager, v6 == 0, v6);
    id v10 = self->_lockedFetchOperationManager;
    self->_id lockedFetchOperationManager = 0;
  }
  os_unfair_lock_unlock(&self->_callbackLock);
}

- (NSArray)queries
{
  return self->_queries;
}

- (void)setQueries:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queries, 0);
  objc_storeStrong(&self->_lockedFetchOperationManager, 0);
  objc_storeStrong(&self->_lockedClientCompletion, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

@end