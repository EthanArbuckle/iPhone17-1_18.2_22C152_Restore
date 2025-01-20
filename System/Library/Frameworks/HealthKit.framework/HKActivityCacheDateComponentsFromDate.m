@interface HKActivityCacheDateComponentsFromDate
@end

@implementation HKActivityCacheDateComponentsFromDate

uint64_t ___HKActivityCacheDateComponentsFromDate_block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) components:30 fromDate:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setCalendar:*(void *)(a1 + 32)];
  return 1;
}

@end