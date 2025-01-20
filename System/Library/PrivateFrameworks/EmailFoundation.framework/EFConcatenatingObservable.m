@interface EFConcatenatingObservable
@end

@implementation EFConcatenatingObservable

void __69___EFConcatenatingObservable_subscribeObserver_toObservables_unless___block_invoke_2(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isCanceled] & 1) == 0)
  {
    v2 = *(void **)(a1 + 56);
    uint64_t v3 = *(void *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "ef_tail");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "subscribeObserver:toObservables:unless:", v3);
  }
}

void __69___EFConcatenatingObservable_subscribeObserver_toObservables_unless___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([*(id *)(a1 + 32) isCanceled] & 1) == 0) {
    [*(id *)(a1 + 40) observerDidReceiveResult:v3];
  }
}

void __69___EFConcatenatingObservable_subscribeObserver_toObservables_unless___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([*(id *)(a1 + 32) isCanceled] & 1) == 0) {
    [*(id *)(a1 + 40) observerDidFailWithError:v3];
  }
}

@end