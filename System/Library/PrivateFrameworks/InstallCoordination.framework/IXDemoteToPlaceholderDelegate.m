@interface IXDemoteToPlaceholderDelegate
@end

@implementation IXDemoteToPlaceholderDelegate

void __90___IXDemoteToPlaceholderDelegate_coordinatorDidCompleteSuccessfully_forApplicationRecord___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) completion];

  if (v2)
  {
    v3 = [*(id *)(a1 + 32) completion];
    v3[2](v3, 0);

    [*(id *)(a1 + 32) setCompletion:0];
  }
  [*(id *)(a1 + 32) setCoordinator:0];
  v4 = *(void **)(a1 + 32);

  _RemoveDelegateFromMap_0(v4);
}

void __72___IXDemoteToPlaceholderDelegate_coordinator_canceledWithReason_client___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) completion];

  if (v2)
  {
    v3 = [*(id *)(a1 + 32) completion];
    v3[2](v3, *(void *)(a1 + 40));

    [*(id *)(a1 + 32) setCompletion:0];
  }
  [*(id *)(a1 + 32) setCoordinator:0];
  v4 = *(void **)(a1 + 32);

  _RemoveDelegateFromMap_0(v4);
}

@end