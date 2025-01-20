@interface VSTimeoutOperation
- (NSOperation)operation;
- (NSOperationQueue)privateQueue;
- (VSTimeoutOperation)init;
- (VSTimeoutOperation)initWithOperation:(id)a3 timeout:(double)a4;
- (double)timeout;
- (void)cancel;
- (void)executionDidBegin;
- (void)setPrivateQueue:(id)a3;
@end

@implementation VSTimeoutOperation

- (VSTimeoutOperation)init
{
  return 0;
}

- (VSTimeoutOperation)initWithOperation:(id)a3 timeout:(double)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)VSTimeoutOperation;
  v8 = [(VSTimeoutOperation *)&v12 init];
  if (v8)
  {
    v9 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    privateQueue = v8->_privateQueue;
    v8->_privateQueue = v9;

    [(NSOperationQueue *)v8->_privateQueue setName:@"VSTimeoutOperation"];
    objc_storeStrong((id *)&v8->_operation, a3);
    v8->_timeout = a4;
  }

  return v8;
}

- (void)executionDidBegin
{
  v3 = [(VSTimeoutOperation *)self privateQueue];
  v4 = [(VSTimeoutOperation *)self operation];
  [v3 addOperation:v4];
  [(VSTimeoutOperation *)self timeout];
  v5 = +[VSDelayOperation delayOperationWithDelay:](VSDelayOperation, "delayOperationWithDelay:");
  [v3 addOperation:v5];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __39__VSTimeoutOperation_executionDidBegin__block_invoke;
  v13[3] = &unk_1E6BD29A8;
  v13[4] = self;
  v6 = [MEMORY[0x1E4F28B48] blockOperationWithBlock:v13];
  [v6 addDependency:v5];
  [v3 addOperation:v6];
  id v7 = (void *)MEMORY[0x1E4F28B48];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __39__VSTimeoutOperation_executionDidBegin__block_invoke_2;
  v10[3] = &unk_1E6BD2C38;
  id v11 = v5;
  objc_super v12 = self;
  id v8 = v5;
  v9 = [v7 blockOperationWithBlock:v10];
  [v9 addDependency:v4];
  [v3 addOperation:v9];
}

uint64_t __39__VSTimeoutOperation_executionDidBegin__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishExecutionIfPossible];
}

uint64_t __39__VSTimeoutOperation_executionDidBegin__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) cancel];
  v2 = *(void **)(a1 + 40);

  return [v2 finishExecutionIfPossible];
}

- (void)cancel
{
  v4.receiver = self;
  v4.super_class = (Class)VSTimeoutOperation;
  [(VSAsyncOperation *)&v4 cancel];
  v3 = [(VSTimeoutOperation *)self privateQueue];
  [v3 cancelAllOperations];

  [(VSAsyncOperation *)self finishExecutionIfPossible];
}

- (NSOperation)operation
{
  return self->_operation;
}

- (double)timeout
{
  return self->_timeout;
}

- (NSOperationQueue)privateQueue
{
  return self->_privateQueue;
}

- (void)setPrivateQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateQueue, 0);

  objc_storeStrong((id *)&self->_operation, 0);
}

@end