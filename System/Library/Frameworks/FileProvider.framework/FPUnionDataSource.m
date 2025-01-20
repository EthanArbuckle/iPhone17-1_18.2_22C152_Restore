@interface FPUnionDataSource
@end

@implementation FPUnionDataSource

uint64_t __27___FPUnionDataSource_start__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) startObserving];
}

uint64_t __32___FPUnionDataSource_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) stopObserving];
}

@end