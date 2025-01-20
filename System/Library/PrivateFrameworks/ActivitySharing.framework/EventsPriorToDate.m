@interface EventsPriorToDate
@end

@implementation EventsPriorToDate

BOOL ___EventsPriorToDate_block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 timestamp];
  [v3 timeIntervalSinceReferenceDate];
  double v5 = v4;
  [*(id *)(a1 + 32) timeIntervalSinceReferenceDate];
  BOOL v7 = v5 <= v6;

  return v7;
}

@end