@interface DMFBatchRequestOperation
- (BOOL)isAsynchronous;
- (CATOperationQueue)queue;
- (CATRemoteTaskOperation)activityTransactionOperation;
- (DMFBatchRequestOperation)initWithActivityTransactionOperation:(id)a3 subOperations:(id)a4;
- (NSArray)subOperations;
- (void)activityTransactionOperationDidFinish:(id)a3;
- (void)activityTransactionOperationDidStart:(id)a3;
- (void)main;
- (void)setActivityTransactionOperation:(id)a3;
- (void)setName:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSubOperations:(id)a3;
@end

@implementation DMFBatchRequestOperation

- (DMFBatchRequestOperation)initWithActivityTransactionOperation:(id)a3 subOperations:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"DMFBatchRequestOperation.m", 26, @"Invalid parameter not satisfying: %@", @"activityTransactionOperation" object file lineNumber description];
  }
  v16.receiver = self;
  v16.super_class = (Class)DMFBatchRequestOperation;
  v10 = [(DMFBatchRequestOperation *)&v16 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_activityTransactionOperation, a3);
    uint64_t v12 = [v9 copy];
    subOperations = v11->_subOperations;
    v11->_subOperations = (NSArray *)v12;
  }
  return v11;
}

- (void)setName:(id)a3
{
  id v4 = a3;
  v5 = [(DMFBatchRequestOperation *)self activityTransactionOperation];
  v6 = [v5 request];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v6 setName:v4];
  }
  v7.receiver = self;
  v7.super_class = (Class)DMFBatchRequestOperation;
  [(DMFBatchRequestOperation *)&v7 setName:v4];
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)main
{
  v3 = [(DMFBatchRequestOperation *)self subOperations];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    v5 = [(DMFBatchRequestOperation *)self activityTransactionOperation];
    id v13 = [v5 request];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = [v13 name];

      if (!v6)
      {
        objc_super v7 = [(DMFBatchRequestOperation *)self name];
        [v13 setName:v7];
      }
    }
    id v8 = objc_opt_new();
    [(DMFBatchRequestOperation *)self setQueue:v8];

    id v9 = [(DMFBatchRequestOperation *)self activityTransactionOperation];
    [v9 addTarget:self selector:sel_activityTransactionOperationDidStart_ forOperationEvents:1];

    v10 = [(DMFBatchRequestOperation *)self activityTransactionOperation];
    [v10 addTarget:self selector:sel_activityTransactionOperationDidFinish_ forOperationEvents:6];

    v11 = [(DMFBatchRequestOperation *)self queue];
    uint64_t v12 = [(DMFBatchRequestOperation *)self activityTransactionOperation];
    [v11 addOperation:v12];
  }
  else
  {
    [(DMFBatchRequestOperation *)self endOperationWithResultObject:0];
  }
}

- (void)activityTransactionOperationDidStart:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __65__DMFBatchRequestOperation_activityTransactionOperationDidStart___block_invoke;
  v17[3] = &unk_1E63722B0;
  v17[4] = self;
  uint64_t v4 = [MEMORY[0x1E4F28B48] blockOperationWithBlock:v17];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = [(DMFBatchRequestOperation *)self subOperations];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        [v4 addDependency:*(void *)(*((void *)&v13 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v7);
  }

  v10 = [(DMFBatchRequestOperation *)self queue];
  [v10 addOperation:v4];

  v11 = [(DMFBatchRequestOperation *)self queue];
  uint64_t v12 = [(DMFBatchRequestOperation *)self subOperations];
  [v11 addOperations:v12 waitUntilFinished:0];
}

void __65__DMFBatchRequestOperation_activityTransactionOperationDidStart___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) activityTransactionOperation];
  [v1 cancel];
}

- (void)activityTransactionOperationDidFinish:(id)a3
{
}

- (CATOperationQueue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (CATRemoteTaskOperation)activityTransactionOperation
{
  return self->_activityTransactionOperation;
}

- (void)setActivityTransactionOperation:(id)a3
{
}

- (NSArray)subOperations
{
  return self->_subOperations;
}

- (void)setSubOperations:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subOperations, 0);
  objc_storeStrong((id *)&self->_activityTransactionOperation, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end