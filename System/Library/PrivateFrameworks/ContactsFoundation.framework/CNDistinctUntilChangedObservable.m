@interface CNDistinctUntilChangedObservable
@end

@implementation CNDistinctUntilChangedObservable

void __47___CNDistinctUntilChangedObservable_subscribe___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if ([WeakRetained _resultIsDistinctFromLastResult:v4]) {
    [*(id *)(a1 + 32) observerDidReceiveResult:v4];
  }
}

uint64_t __47___CNDistinctUntilChangedObservable_subscribe___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) observerDidComplete];
}

uint64_t __47___CNDistinctUntilChangedObservable_subscribe___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) observerDidFailWithError:a2];
}

@end