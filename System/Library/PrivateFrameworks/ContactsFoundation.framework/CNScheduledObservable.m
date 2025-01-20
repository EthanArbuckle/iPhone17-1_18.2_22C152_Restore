@interface CNScheduledObservable
@end

@implementation CNScheduledObservable

void __36___CNScheduledObservable_subscribe___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  id v5 = [v2 subscribe:v3];
  [v4 addCancelable:v5];
}

@end