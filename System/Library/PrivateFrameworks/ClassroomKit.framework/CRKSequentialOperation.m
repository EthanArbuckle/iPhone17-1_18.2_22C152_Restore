@interface CRKSequentialOperation
+ (id)sequentialOperationWithOperations:(id)a3;
- (BOOL)isAsynchronous;
- (CATOperation)failedOperation;
- (CATOperationQueue)queue;
- (CRKSequentialOperation)init;
- (CRKSequentialOperation)initWithSequentialOperations:(id)a3 queue:(id)a4;
- (NSArray)operations;
- (unint64_t)frontOfQueue;
- (void)cancel;
- (void)enqueueFront;
- (void)frontOperationDidFinish:(id)a3;
- (void)main;
- (void)setFailedOperation:(id)a3;
- (void)setFrontOfQueue:(unint64_t)a3;
@end

@implementation CRKSequentialOperation

- (CRKSequentialOperation)initWithSequentialOperations:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CRKSequentialOperation;
  v8 = [(CRKSequentialOperation *)&v13 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    operations = v8->_operations;
    v8->_operations = (NSArray *)v9;

    v11 = v7;
    if (!v7)
    {
      v11 = objc_msgSend(MEMORY[0x263F39C90], "crk_backgroundQueue");
    }
    objc_storeStrong((id *)&v8->_queue, v11);
    if (!v7) {
  }
    }
  return v8;
}

- (CRKSequentialOperation)init
{
  return [(CRKSequentialOperation *)self initWithSequentialOperations:MEMORY[0x263EFFA68] queue:0];
}

+ (id)sequentialOperationWithOperations:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithSequentialOperations:v4 queue:0];

  return v5;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)main
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __30__CRKSequentialOperation_main__block_invoke;
  block[3] = &unk_2646F35C0;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __30__CRKSequentialOperation_main__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) enqueueFront];
}

- (void)cancel
{
  v4.receiver = self;
  v4.super_class = (Class)CRKSequentialOperation;
  [(CRKSequentialOperation *)&v4 cancel];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __32__CRKSequentialOperation_cancel__block_invoke;
  block[3] = &unk_2646F35C0;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __32__CRKSequentialOperation_cancel__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  v1 = objc_msgSend(*(id *)(a1 + 32), "operations", 0);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        [*(id *)(*((void *)&v6 + 1) + 8 * v5++) cancel];
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (void)enqueueFront
{
  if (![(CRKSequentialOperation *)self isExecuting]) {
    return;
  }
  if ([(CRKSequentialOperation *)self isCancelled])
  {
    CATErrorWithCodeAndUserInfo();
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    [(CRKSequentialOperation *)self endOperationWithError:v9];
LABEL_8:

    return;
  }
  uint64_t v3 = [(CRKSequentialOperation *)self operations];
  if ([v3 count])
  {
    unint64_t v4 = [(CRKSequentialOperation *)self frontOfQueue];
    uint64_t v5 = [(CRKSequentialOperation *)self operations];
    unint64_t v6 = [v5 count] - 1;

    if (v4 <= v6)
    {
      long long v7 = [(CRKSequentialOperation *)self operations];
      objc_msgSend(v7, "objectAtIndexedSubscript:", -[CRKSequentialOperation frontOfQueue](self, "frontOfQueue"));
      id v9 = (id)objc_claimAutoreleasedReturnValue();

      [(CRKSequentialOperation *)self setFrontOfQueue:[(CRKSequentialOperation *)self frontOfQueue] + 1];
      [v9 addTarget:self selector:sel_frontOperationDidFinish_ forOperationEvents:6];
      long long v8 = [(CRKSequentialOperation *)self queue];
      [v8 addOperation:v9];

      goto LABEL_8;
    }
  }
  else
  {
  }

  [(CRKSequentialOperation *)self endOperationWithResultObject:0];
}

- (void)frontOperationDidFinish:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [v8 error];
  if (v4
    && (v5 = (void *)v4, char v6 = [(CRKSequentialOperation *)self isCancelled],
                         v5,
                         (v6 & 1) == 0))
  {
    [(CRKSequentialOperation *)self setFailedOperation:v8];
    long long v7 = [v8 error];
    [(CRKSequentialOperation *)self endOperationWithError:v7];
  }
  else
  {
    [(CRKSequentialOperation *)self enqueueFront];
  }
}

- (CATOperation)failedOperation
{
  return self->_failedOperation;
}

- (void)setFailedOperation:(id)a3
{
}

- (unint64_t)frontOfQueue
{
  return self->_frontOfQueue;
}

- (void)setFrontOfQueue:(unint64_t)a3
{
  self->_frontOfQueue = a3;
}

- (NSArray)operations
{
  return self->_operations;
}

- (CATOperationQueue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_operations, 0);

  objc_storeStrong((id *)&self->_failedOperation, 0);
}

@end