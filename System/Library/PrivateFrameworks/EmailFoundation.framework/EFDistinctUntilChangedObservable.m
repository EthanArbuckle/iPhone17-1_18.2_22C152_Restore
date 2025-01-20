@interface EFDistinctUntilChangedObservable
@end

@implementation EFDistinctUntilChangedObservable

void __47___EFDistinctUntilChangedObservable_subscribe___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "_isLastResultDistinctFromResult:")) {
    [*(id *)(a1 + 40) observerDidReceiveResult:v3];
  }
}

uint64_t __47___EFDistinctUntilChangedObservable_subscribe___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) observerDidComplete];
}

uint64_t __47___EFDistinctUntilChangedObservable_subscribe___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) observerDidFailWithError:a2];
}

@end