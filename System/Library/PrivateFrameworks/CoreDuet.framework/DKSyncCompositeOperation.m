@interface DKSyncCompositeOperation
@end

@implementation DKSyncCompositeOperation

uint64_t __44___DKSyncCompositeOperation_initWithParent___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isExecuting];
  if (result)
  {
    unsigned __int8 v3 = atomic_load((unsigned __int8 *)(*(void *)(a1 + 40) + 264));
    if ((v3 & 1) == 0)
    {
      uint64_t result = [*(id *)(a1 + 40) isCancelled];
      if ((result & 1) == 0)
      {
        v4 = *(void **)(a1 + 40);
        return [v4 setReadyToStart:1];
      }
    }
  }
  return result;
}

@end