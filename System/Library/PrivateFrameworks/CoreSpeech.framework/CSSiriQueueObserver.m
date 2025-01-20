@interface CSSiriQueueObserver
@end

@implementation CSSiriQueueObserver

void __48___CSSiriQueueObserver_heartBeatFiredWithQueue___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 == -2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained timeoutDetected];
  }
}

uint64_t __48___CSSiriQueueObserver_heartBeatFiredWithQueue___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) invokeWithSignal:-2];
}

void __48___CSSiriQueueObserver_heartBeatFiredWithQueue___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) invokeWithSignal:0];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48___CSSiriQueueObserver_heartBeatFiredWithQueue___block_invoke_4;
  block[3] = &unk_1E658CBA8;
  uint64_t v2 = *(NSObject **)(a1 + 40);
  block[4] = *(void *)(a1 + 48);
  dispatch_async(v2, block);
}

uint64_t __48___CSSiriQueueObserver_heartBeatFiredWithQueue___block_invoke_4(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) cancelIfNotAlreadyCanceled];
}

void __39___CSSiriQueueObserver_startWithQueue___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained heartBeatFiredWithQueue:*(void *)(a1 + 32)];
}

@end