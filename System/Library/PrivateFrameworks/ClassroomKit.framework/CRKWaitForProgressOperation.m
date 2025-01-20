@interface CRKWaitForProgressOperation
- (BOOL)isAsynchronous;
- (CATOperation)operation;
- (CATOperationQueue)operationQueue;
- (CRKWaitForProgressOperation)initWithOperationQueue:(id)a3 operation:(id)a4 expectedCompletedUnitCount:(int64_t)a5 expectedTotalUnitCount:(int64_t)a6;
- (int64_t)expctedCompletedUnitCount;
- (int64_t)expectedTotalUnitCount;
- (void)cancel;
- (void)main;
- (void)observedOperationDidFail:(id)a3;
- (void)observedOperationDidProgress:(id)a3;
@end

@implementation CRKWaitForProgressOperation

- (CRKWaitForProgressOperation)initWithOperationQueue:(id)a3 operation:(id)a4 expectedCompletedUnitCount:(int64_t)a5 expectedTotalUnitCount:(int64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CRKWaitForProgressOperation;
  v13 = [(CRKWaitForProgressOperation *)&v16 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_operationQueue, a3);
    objc_storeStrong((id *)&v14->_operation, a4);
    v14->_expectedTotalUnitCount = a6;
    v14->_expctedCompletedUnitCount = a5;
  }

  return v14;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)cancel
{
  v4.receiver = self;
  v4.super_class = (Class)CRKWaitForProgressOperation;
  [(CRKWaitForProgressOperation *)&v4 cancel];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__CRKWaitForProgressOperation_cancel__block_invoke;
  block[3] = &unk_2646F35C0;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __37__CRKWaitForProgressOperation_cancel__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isExecuting])
  {
    v2 = [*(id *)(a1 + 32) operation];
    [v2 cancel];

    v3 = *(void **)(a1 + 32);
    CATErrorWithCodeAndUserInfo();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [v3 endOperationWithError:v4];
  }
}

- (void)main
{
  v3 = [(CRKWaitForProgressOperation *)self operation];
  [v3 addTarget:self selector:sel_observedOperationDidProgress_ forOperationEvents:8];

  id v4 = [(CRKWaitForProgressOperation *)self operation];
  [v4 addTarget:self selector:sel_observedOperationDidFail_ forOperationEvents:4];

  id v6 = [(CRKWaitForProgressOperation *)self operationQueue];
  v5 = [(CRKWaitForProgressOperation *)self operation];
  [v6 addOperation:v5];
}

- (void)observedOperationDidProgress:(id)a3
{
  id v6 = a3;
  if ([(CRKWaitForProgressOperation *)self isExecuting])
  {
    uint64_t v4 = [v6 totalUnitCount];
    if (v4 == [(CRKWaitForProgressOperation *)self expectedTotalUnitCount])
    {
      uint64_t v5 = [v6 completedUnitCount];
      if (v5 == [(CRKWaitForProgressOperation *)self expctedCompletedUnitCount]) {
        [(CRKWaitForProgressOperation *)self endOperationWithResultObject:0];
      }
    }
  }
}

- (void)observedOperationDidFail:(id)a3
{
  id v5 = a3;
  if ([(CRKWaitForProgressOperation *)self isExecuting])
  {
    uint64_t v4 = [v5 error];
    [(CRKWaitForProgressOperation *)self endOperationWithError:v4];
  }
}

- (CATOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (CATOperation)operation
{
  return self->_operation;
}

- (int64_t)expectedTotalUnitCount
{
  return self->_expectedTotalUnitCount;
}

- (int64_t)expctedCompletedUnitCount
{
  return self->_expctedCompletedUnitCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operation, 0);

  objc_storeStrong((id *)&self->_operationQueue, 0);
}

@end