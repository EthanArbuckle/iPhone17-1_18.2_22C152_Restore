@interface CNOperationQueueScheduler
@end

@implementation CNOperationQueueScheduler

uint64_t __70___CNOperationQueueScheduler_performCancelableBlock_qualityOfService___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __70___CNOperationQueueScheduler_performCancelableBlock_qualityOfService___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained cancel];
}

uint64_t __71___CNOperationQueueScheduler_afterDelay_performBlock_qualityOfService___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isCanceled];
  if ((result & 1) == 0)
  {
    v3 = *(void **)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 56);
    return [v3 _enqueueBlock:v4 qualityOfService:v5];
  }
  return result;
}

@end