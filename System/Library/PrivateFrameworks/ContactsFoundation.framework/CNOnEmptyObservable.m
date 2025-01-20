@interface CNOnEmptyObservable
@end

@implementation CNOnEmptyObservable

void __34___CNOnEmptyObservable_subscribe___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isObservableEmpty])
  {
    id v4 = [*(id *)(a1 + 32) subscribeNextObservable:*(void *)(a1 + 40)];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained addCancelable:v4];
  }
  else
  {
    v3 = *(void **)(a1 + 40);
    [v3 observerDidComplete];
  }
}

void __34___CNOnEmptyObservable_subscribe___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 observableDidSendResult];
  [*(id *)(a1 + 40) observerDidReceiveResult:v4];
}

uint64_t __34___CNOnEmptyObservable_subscribe___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) observerDidFailWithError:a2];
}

@end