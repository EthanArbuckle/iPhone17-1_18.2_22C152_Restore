@interface EFMergingObservable
@end

@implementation EFMergingObservable

uint64_t __63___EFMergingObservable_subscribeObserver_toObservables_unless___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) observerDidReceiveResult:a2];
}

void __63___EFMergingObservable_subscribeObserver_toObservables_unless___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [MEMORY[0x1E4F1CA98] null];
  objc_msgSend(v1, "finishWithResult:");
}

uint64_t __63___EFMergingObservable_subscribeObserver_toObservables_unless___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithError:a2];
}

uint64_t __63___EFMergingObservable_subscribeObserver_toObservables_unless___block_invoke_4(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isCanceled];
  if ((result & 1) == 0)
  {
    [*(id *)(a1 + 40) observerDidComplete];
    v3 = *(void **)(a1 + 32);
    return [v3 cancel];
  }
  return result;
}

void __63___EFMergingObservable_subscribeObserver_toObservables_unless___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([*(id *)(a1 + 32) isCanceled] & 1) == 0)
  {
    [*(id *)(a1 + 40) observerDidFailWithError:v3];
    [*(id *)(a1 + 32) cancel];
  }
}

@end