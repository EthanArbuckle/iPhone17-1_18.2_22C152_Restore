@interface HMIFeedbackTask
- (HMIFeedbackTask)initWithTaskID:(int)a3 cameraProfileUUID:(id)a4 clipUUID:(id)a5;
- (void)mainInsideAutoreleasePool;
@end

@implementation HMIFeedbackTask

- (HMIFeedbackTask)initWithTaskID:(int)a3 cameraProfileUUID:(id)a4 clipUUID:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  id v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMIFeedbackTask;
  v10 = [(HMITask *)&v15 initWithTaskID:v6];
  if (v10)
  {
    v11 = objc_alloc_init(HMIFeedbackSession);
    v12 = [[HMIFeedbackSubmitClipOperation alloc] initWithFeedbackSession:v11 cameraProfileUUID:v8 clipUUID:v9];
    operation = v10->_operation;
    v10->_operation = &v12->super;
  }
  return v10;
}

- (void)mainInsideAutoreleasePool
{
  v3 = self->_operation;
  objc_initWeak(&location, v3);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __44__HMIFeedbackTask_mainInsideAutoreleasePool__block_invoke;
  v4[3] = &unk_26477BB20;
  objc_copyWeak(&v5, &location);
  v4[4] = self;
  [(HMFOperation *)v3 setCompletionBlock:v4];
  [(HMFOperation *)v3 setQualityOfService:9];
  [(HMFOperation *)v3 start];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __44__HMIFeedbackTask_mainInsideAutoreleasePool__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained error];

  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    v4 = [WeakRetained error];
    [v3 cancelWithError:v4];
  }
  else
  {
    [v3 finish];
  }
}

- (void).cxx_destruct
{
}

@end