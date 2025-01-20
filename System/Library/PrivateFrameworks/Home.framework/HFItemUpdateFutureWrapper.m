@interface HFItemUpdateFutureWrapper
@end

@implementation HFItemUpdateFutureWrapper

uint64_t __50___HFItemUpdateFutureWrapper_futuresFromWrappers___block_invoke(uint64_t a1, void *a2)
{
  return [a2 future];
}

void __64___HFItemUpdateFutureWrapper_wrapperWithFuture_item_isInternal___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained setOutcome:v3];
}

@end