@interface DMTTimeoutOperation
- (BOOL)cancelsOnTimeout;
- (BOOL)isAsynchronous;
- (CATOperation)observedOperation;
- (DMTTimeoutOperation)initWithOperation:(id)a3 timeout:(double)a4 cancelsOnTimeout:(BOOL)a5;
- (NSTimer)timeoutTimer;
- (double)timeoutInterval;
- (void)beginWaitingForOperation;
- (void)cancel;
- (void)createTimer;
- (void)innerOperationDidFinish:(id)a3;
- (void)main;
- (void)setTimeoutTimer:(id)a3;
- (void)timerDidFire:(id)a3;
@end

@implementation DMTTimeoutOperation

- (DMTTimeoutOperation)initWithOperation:(id)a3 timeout:(double)a4 cancelsOnTimeout:(BOOL)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DMTTimeoutOperation;
  v10 = [(DMTTimeoutOperation *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_observedOperation, a3);
    v11->_timeoutInterval = a4;
    v11->_cancelsOnTimeout = a5;
  }

  return v11;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)cancel
{
  v4.receiver = self;
  v4.super_class = (Class)DMTTimeoutOperation;
  [(DMTTimeoutOperation *)&v4 cancel];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __29__DMTTimeoutOperation_cancel__block_invoke;
  block[3] = &unk_2649A9730;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __29__DMTTimeoutOperation_cancel__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isExecuting])
  {
    v2 = [*(id *)(a1 + 32) timeoutTimer];
    [v2 invalidate];

    v3 = *(void **)(a1 + 32);
    CATErrorWithCodeAndUserInfo();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [v3 endOperationWithError:v4];
  }
}

- (void)main
{
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    if ([(DMTTimeoutOperation *)self isExecuting])
    {
      if ([(DMTTimeoutOperation *)self isCancelled])
      {
        CATErrorWithCodeAndUserInfo();
        id v4 = (id)objc_claimAutoreleasedReturnValue();
        [(DMTTimeoutOperation *)self endOperationWithError:v4];
      }
      else
      {
        [(DMTTimeoutOperation *)self beginWaitingForOperation];
      }
    }
  }
  else
  {
    [(DMTTimeoutOperation *)self performSelectorOnMainThread:a2 withObject:0 waitUntilDone:0];
  }
}

- (void)beginWaitingForOperation
{
  v3 = [(DMTTimeoutOperation *)self observedOperation];

  if (v3)
  {
    id v4 = [(DMTTimeoutOperation *)self observedOperation];
    int v5 = [v4 isFinished];

    v6 = [(DMTTimeoutOperation *)self observedOperation];
    id v9 = v6;
    if (v5)
    {
      [(DMTTimeoutOperation *)self innerOperationDidFinish:v6];
LABEL_9:

      return;
    }
    [v6 addTarget:self selector:sel_innerOperationDidFinish_ forOperationEvents:6];

    v7 = [(DMTTimeoutOperation *)self observedOperation];
    v8 = [v7 startedDate];

    if (!v8)
    {
      id v9 = [(DMTTimeoutOperation *)self observedOperation];
      [v9 addTarget:self selector:sel_createTimer forOperationEvents:1];
      goto LABEL_9;
    }
  }
  [(DMTTimeoutOperation *)self createTimer];
}

- (void)createTimer
{
  v3 = (void *)MEMORY[0x263EFFA20];
  [(DMTTimeoutOperation *)self timeoutInterval];
  objc_msgSend(v3, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_timerDidFire_, 0, 0);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(DMTTimeoutOperation *)self setTimeoutTimer:v4];
}

- (void)timerDidFire:(id)a3
{
  if ([(DMTTimeoutOperation *)self isExecuting])
  {
    if ([(DMTTimeoutOperation *)self isCancelled])
    {
      uint64_t v4 = CATErrorWithCodeAndUserInfo();
    }
    else
    {
      if ([(DMTTimeoutOperation *)self cancelsOnTimeout])
      {
        int v5 = [(DMTTimeoutOperation *)self observedOperation];
        [v5 cancel];
      }
      uint64_t v4 = DMTErrorWithCodeAndUserInfo(4, 0);
    }
    id v6 = (id)v4;
    [(DMTTimeoutOperation *)self endOperationWithError:v4];
  }
}

- (void)innerOperationDidFinish:(id)a3
{
  id v6 = a3;
  if ([(DMTTimeoutOperation *)self isExecuting])
  {
    if ([(DMTTimeoutOperation *)self isCancelled])
    {
      uint64_t v4 = CATErrorWithCodeAndUserInfo();
      [(DMTTimeoutOperation *)self endOperationWithError:v4];
    }
    else
    {
      int v5 = [(DMTTimeoutOperation *)self timeoutTimer];
      [v5 invalidate];

      [(DMTTimeoutOperation *)self endOperationWithResultObject:v6];
    }
  }
}

- (CATOperation)observedOperation
{
  return self->_observedOperation;
}

- (double)timeoutInterval
{
  return self->_timeoutInterval;
}

- (BOOL)cancelsOnTimeout
{
  return self->_cancelsOnTimeout;
}

- (NSTimer)timeoutTimer
{
  return self->_timeoutTimer;
}

- (void)setTimeoutTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_observedOperation, 0);
}

@end