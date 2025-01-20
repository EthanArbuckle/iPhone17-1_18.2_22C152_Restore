@interface IXSimpleInstallerDelegate
@end

@implementation IXSimpleInstallerDelegate

void __86___IXSimpleInstallerDelegate_coordinatorDidCompleteSuccessfully_forApplicationRecord___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) completion];

  if (v2)
  {
    v3 = [*(id *)(a1 + 32) completion];
    v4 = [*(id *)(a1 + 40) identity];
    ((void (**)(void, void *, void))v3)[2](v3, v4, 0);

    [*(id *)(a1 + 32) setCompletion:0];
  }
  [*(id *)(a1 + 32) setCoordinator:0];
  v5 = *(void **)(a1 + 32);

  _RemoveDelegateFromMap(v5);
}

void __68___IXSimpleInstallerDelegate_coordinator_canceledWithReason_client___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) completion];

  if (v2)
  {
    v3 = [*(id *)(a1 + 32) completion];
    v3[2](v3, 0, *(void *)(a1 + 40));

    [*(id *)(a1 + 32) setCompletion:0];
  }
  [*(id *)(a1 + 32) setCoordinator:0];
  v4 = *(void **)(a1 + 32);

  _RemoveDelegateFromMap(v4);
}

@end