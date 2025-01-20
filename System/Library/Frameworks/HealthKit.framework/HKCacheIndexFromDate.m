@interface HKCacheIndexFromDate
@end

@implementation HKCacheIndexFromDate

uint64_t ___HKCacheIndexFromDate_block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) components:30 fromDate:*(void *)(a1 + 40)];
  [v2 setCalendar:*(void *)(a1 + 32)];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = _HKCacheIndexFromDateComponents(v2);

  return 1;
}

@end