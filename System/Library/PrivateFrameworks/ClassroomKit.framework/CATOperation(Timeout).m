@interface CATOperation(Timeout)
- (CRKTimeoutHarnessOperation)crk_operationWithTimeout:()Timeout;
- (CRKTimeoutHarnessOperation)crk_timingOutOperationWithTimerPrimitives:()Timeout operationQueue:timerIdentifier:timeout:;
@end

@implementation CATOperation(Timeout)

- (CRKTimeoutHarnessOperation)crk_operationWithTimeout:()Timeout
{
  v4 = [CRKTimeoutHarnessOperation alloc];
  v5 = objc_msgSend(MEMORY[0x263F39C90], "crk_backgroundQueue");
  v6 = [(CRKTimeoutHarnessOperation *)v4 initWithOperationQueue:v5 operation:a1 timout:a2];

  return v6;
}

- (CRKTimeoutHarnessOperation)crk_timingOutOperationWithTimerPrimitives:()Timeout operationQueue:timerIdentifier:timeout:
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  v13 = [[CRKTimeoutHarnessOperation alloc] initWithTimerPrimitives:v12 operationQueue:v11 operation:a1 timerIdentifier:v10 timeout:a2];

  return v13;
}

@end