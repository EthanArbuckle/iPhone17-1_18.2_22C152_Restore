@interface CRKTimeoutHarnessOperation
+ (id)timeoutTimerIdentifier;
- (BOOL)isAsynchronous;
- (CATOperation)operation;
- (CRKCancelable)timeoutTimer;
- (CRKOperationQueue)operationQueue;
- (CRKTimeoutHarnessOperation)initWithOperationQueue:(id)a3 operation:(id)a4 timout:(double)a5;
- (CRKTimeoutHarnessOperation)initWithTimerPrimitives:(id)a3 operationQueue:(id)a4 operation:(id)a5 timerIdentifier:(id)a6 timeout:(double)a7;
- (CRKTimerPrimitives)timerPrimitives;
- (NSString)timerIdentifier;
- (double)timeout;
- (void)cancel;
- (void)dependentOperationDidFinish:(id)a3;
- (void)main;
- (void)run;
- (void)setTimeoutTimer:(id)a3;
- (void)timeoutDidFire;
@end

@implementation CRKTimeoutHarnessOperation

- (CRKTimeoutHarnessOperation)initWithTimerPrimitives:(id)a3 operationQueue:(id)a4 operation:(id)a5 timerIdentifier:(id)a6 timeout:(double)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v22.receiver = self;
  v22.super_class = (Class)CRKTimeoutHarnessOperation;
  v17 = [(CRKTimeoutHarnessOperation *)&v22 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_timerPrimitives, a3);
    objc_storeStrong((id *)&v18->_operationQueue, a4);
    objc_storeStrong((id *)&v18->_operation, a5);
    uint64_t v19 = [v16 copy];
    timerIdentifier = v18->_timerIdentifier;
    v18->_timerIdentifier = (NSString *)v19;

    v18->_timeout = a7;
  }

  return v18;
}

- (CRKTimeoutHarnessOperation)initWithOperationQueue:(id)a3 operation:(id)a4 timout:(double)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = objc_opt_new();
  v11 = [v10 makePrimitives];
  v12 = [(id)objc_opt_class() timeoutTimerIdentifier];
  id v13 = [(CRKTimeoutHarnessOperation *)self initWithTimerPrimitives:v11 operationQueue:v9 operation:v8 timerIdentifier:v12 timeout:a5];

  return v13;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)cancel
{
  v4.receiver = self;
  v4.super_class = (Class)CRKTimeoutHarnessOperation;
  [(CRKTimeoutHarnessOperation *)&v4 cancel];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__CRKTimeoutHarnessOperation_cancel__block_invoke;
  block[3] = &unk_2646F35C0;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __36__CRKTimeoutHarnessOperation_cancel__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isExecuting])
  {
    v2 = [*(id *)(a1 + 32) timeoutTimer];
    [v2 cancel];

    v3 = [*(id *)(a1 + 32) operation];
    [v3 cancel];

    objc_super v4 = *(void **)(a1 + 32);
    CATErrorWithCodeAndUserInfo();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    [v4 endOperationWithError:v5];
  }
}

- (void)main
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__CRKTimeoutHarnessOperation_main__block_invoke;
  block[3] = &unk_2646F35C0;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __34__CRKTimeoutHarnessOperation_main__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) run];
}

- (void)run
{
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    v12 = [MEMORY[0x263F08690] currentHandler];
    id v13 = NSStringFromSelector(a2);
    [v12 handleFailureInMethod:a2, self, @"CRKTimeoutHarnessOperation.m", 95, @"%@ must be called from the main thread", v13 object file lineNumber description];
  }
  if ([(CRKTimeoutHarnessOperation *)self isExecuting])
  {
    objc_initWeak(&location, self);
    objc_super v4 = [(CRKTimeoutHarnessOperation *)self operation];
    [v4 addTarget:self selector:sel_dependentOperationDidFinish_ forOperationEvents:6];

    id v5 = [(CRKTimeoutHarnessOperation *)self timerPrimitives];
    v6 = [(CRKTimeoutHarnessOperation *)self timerIdentifier];
    [(CRKTimeoutHarnessOperation *)self timeout];
    double v8 = v7;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __33__CRKTimeoutHarnessOperation_run__block_invoke;
    v14[3] = &unk_2646F3D40;
    objc_copyWeak(&v15, &location);
    id v9 = [v5 scheduleTimerWithIdentifier:v6 timeInterval:v14 fireHandler:v8];
    [(CRKTimeoutHarnessOperation *)self setTimeoutTimer:v9];

    v10 = [(CRKTimeoutHarnessOperation *)self operationQueue];
    v11 = [(CRKTimeoutHarnessOperation *)self operation];
    [v10 addOperation:v11];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

void __33__CRKTimeoutHarnessOperation_run__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained timeoutDidFire];
}

- (void)dependentOperationDidFinish:(id)a3
{
  id v7 = a3;
  objc_super v4 = [(CRKTimeoutHarnessOperation *)self timeoutTimer];
  [v4 cancel];

  if ([(CRKTimeoutHarnessOperation *)self isExecuting])
  {
    id v5 = [v7 error];

    if (v5)
    {
      v6 = [v7 error];
      [(CRKTimeoutHarnessOperation *)self endOperationWithError:v6];
    }
    else
    {
      v6 = [v7 resultObject];
      [(CRKTimeoutHarnessOperation *)self endOperationWithResultObject:v6];
    }
  }
}

- (void)timeoutDidFire
{
  if ([(CRKTimeoutHarnessOperation *)self isExecuting])
  {
    v3 = [(CRKTimeoutHarnessOperation *)self operation];
    [v3 cancel];

    CRKErrorWithCodeAndUserInfo(32, 0);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [(CRKTimeoutHarnessOperation *)self endOperationWithError:v4];
  }
}

+ (id)timeoutTimerIdentifier
{
  v2 = NSString;
  v3 = NSStringFromClass((Class)a1);
  id v4 = [v2 stringWithFormat:@"%@-timeoutTimer", v3];

  return v4;
}

- (CRKTimerPrimitives)timerPrimitives
{
  return self->_timerPrimitives;
}

- (CRKOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (CATOperation)operation
{
  return self->_operation;
}

- (NSString)timerIdentifier
{
  return self->_timerIdentifier;
}

- (double)timeout
{
  return self->_timeout;
}

- (CRKCancelable)timeoutTimer
{
  return self->_timeoutTimer;
}

- (void)setTimeoutTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_timerIdentifier, 0);
  objc_storeStrong((id *)&self->_operation, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);

  objc_storeStrong((id *)&self->_timerPrimitives, 0);
}

@end