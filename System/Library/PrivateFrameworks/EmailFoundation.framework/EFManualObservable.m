@interface EFManualObservable
@end

@implementation EFManualObservable

uint64_t __33___EFManualObservable_subscribe___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeObserver:*(void *)(a1 + 40)];
}

@end