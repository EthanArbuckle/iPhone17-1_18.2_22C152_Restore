@interface CNDistinctObservable
@end

@implementation CNDistinctObservable

void __35___CNDistinctObservable_subscribe___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "_resultIsDistinct:")) {
    [*(id *)(a1 + 40) observerDidReceiveResult:v3];
  }
}

uint64_t __35___CNDistinctObservable_subscribe___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) observerDidComplete];
}

uint64_t __35___CNDistinctObservable_subscribe___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) observerDidFailWithError:a2];
}

@end