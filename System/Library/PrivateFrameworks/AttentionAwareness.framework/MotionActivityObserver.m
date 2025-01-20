@interface MotionActivityObserver
- (MotionActivityObserver)initWithCallbackQueue:(id)a3 observer:(id)a4;
@end

@implementation MotionActivityObserver

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observer, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_motionActivityManager, 0);

  objc_storeStrong((id *)&self->_callbackQueue, 0);
}

- (MotionActivityObserver)initWithCallbackQueue:(id)a3 observer:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v24.receiver = self;
  v24.super_class = (Class)MotionActivityObserver;
  v9 = [(MotionActivityObserver *)&v24 init];
  v10 = v9;
  if (v9)
  {
    if (!v7) {
      __assert_rtn("-[MotionActivityObserver initWithCallbackQueue:observer:]", "MotionActivityObserver.m", 30, "callbackQueue != nil");
    }
    if (!v8) {
      __assert_rtn("-[MotionActivityObserver initWithCallbackQueue:observer:]", "MotionActivityObserver.m", 31, "observer != nil");
    }
    objc_storeStrong((id *)&v9->_callbackQueue, a3);
    objc_storeStrong((id *)&v10->_observer, a4);
    v10->_isDeviceStationary = 0;
    v11 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    operationQueue = v10->_operationQueue;
    v10->_operationQueue = v11;

    callbackQueue = v10->_callbackQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__MotionActivityObserver_initWithCallbackQueue_observer___block_invoke;
    block[3] = &unk_1E606AC70;
    v14 = v10;
    v23 = v14;
    dispatch_async(callbackQueue, block);
    v15 = (CMMotionActivityManager *)objc_alloc_init(MEMORY[0x1E4F22220]);
    motionActivityManager = v14->_motionActivityManager;
    v14->_motionActivityManager = v15;

    v17 = v14->_motionActivityManager;
    v18 = v10->_operationQueue;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __57__MotionActivityObserver_initWithCallbackQueue_observer___block_invoke_2;
    v20[3] = &unk_1E606A7A8;
    v21 = v14;
    [(CMMotionActivityManager *)v17 startActivityUpdatesToQueue:v18 withHandler:v20];
  }
  return v10;
}

uint64_t __57__MotionActivityObserver_initWithCallbackQueue_observer___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) MotionStateChanging:*(unsigned __int8 *)(*(void *)(a1 + 32) + 40)];
}

void __57__MotionActivityObserver_initWithCallbackQueue_observer___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = v4[1];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__MotionActivityObserver_initWithCallbackQueue_observer___block_invoke_3;
  v7[3] = &unk_1E606AC98;
  id v8 = v4;
  id v9 = v3;
  id v6 = v3;
  dispatch_async(v5, v7);
}

uint64_t __57__MotionActivityObserver_initWithCallbackQueue_observer___block_invoke_3(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 40);
  uint64_t result = [*(id *)(a1 + 40) stationary];
  if (v2 != result)
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 40) = [*(id *)(a1 + 40) stationary];
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = *(void **)(v4 + 32);
    uint64_t v6 = *(unsigned __int8 *)(v4 + 40);
    return [v5 MotionStateChanging:v6];
  }
  return result;
}

@end