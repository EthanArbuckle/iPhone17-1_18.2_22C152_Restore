@interface CATSharingSemaphoreOperation
- (BOOL)isAsynchronous;
- (void)cancel;
- (void)signal;
@end

@implementation CATSharingSemaphoreOperation

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)cancel
{
  v6.receiver = self;
  v6.super_class = (Class)CATSharingSemaphoreOperation;
  [(CATSharingSemaphoreOperation *)&v6 cancel];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __38__CATSharingSemaphoreOperation_cancel__block_invoke;
  v5[3] = &unk_2641DBE60;
  v5[4] = self;
  v3 = v5;
  v4 = CATGetCatalystQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_9;
  block[3] = &unk_2641DBD98;
  id v8 = v3;
  dispatch_async(v4, block);
}

void __38__CATSharingSemaphoreOperation_cancel__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isExecuting])
  {
    v2 = *(void **)(a1 + 32);
    CATErrorWithCodeAndUserInfo(404, 0);
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    [v2 endOperationWithError:v3];
  }
}

- (void)signal
{
  id v3 = CATGetCatalystQueue();
  CATAssertIsQueue(v3);

  if ([(CATOperation *)self isExecuting])
  {
    if ([(CATSharingSemaphoreOperation *)self isCancelled])
    {
      CATErrorWithCodeAndUserInfo(404, 0);
      id v4 = (id)objc_claimAutoreleasedReturnValue();
      [(CATOperation *)self endOperationWithError:v4];
    }
    else
    {
      [(CATOperation *)self endOperationWithResultObject:0];
    }
  }
}

@end