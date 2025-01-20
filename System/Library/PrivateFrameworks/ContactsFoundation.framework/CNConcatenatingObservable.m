@interface CNConcatenatingObservable
@end

@implementation CNConcatenatingObservable

void __69___CNConcatenatingObservable_subscribeObserver_toObservables_unless___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (([WeakRetained isCanceled] & 1) == 0) {
    [*(id *)(a1 + 32) observerDidReceiveResult:v4];
  }
}

void __69___CNConcatenatingObservable_subscribeObserver_toObservables_unless___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (([WeakRetained isCanceled] & 1) == 0) {
    [*(id *)(a1 + 56) subscribeObserver:*(void *)(a1 + 32) toObservables:*(void *)(a1 + 40) unless:WeakRetained];
  }
}

void __69___CNConcatenatingObservable_subscribeObserver_toObservables_unless___block_invoke_3(uint64_t a1, void *a2)
{
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (([WeakRetained isCanceled] & 1) == 0) {
    [*(id *)(a1 + 32) observerDidFailWithError:v4];
  }
}

@end