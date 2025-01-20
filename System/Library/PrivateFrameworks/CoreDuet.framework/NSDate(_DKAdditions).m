@interface NSDate(_DKAdditions)
- (double)timeSinceMidnight:()_DKAdditions;
- (uint64_t)floorDateWithTotalSlotsInDay:()_DKAdditions;
- (uint64_t)slotFromMidnightWithTotalSlotsInDay:()_DKAdditions;
@end

@implementation NSDate(_DKAdditions)

- (double)timeSinceMidnight:()_DKAdditions
{
  if (timeSinceMidnight__initialized != -1) {
    dispatch_once(&timeSinceMidnight__initialized, &__block_literal_global_34);
  }
  v5 = (void *)MEMORY[0x192FB2F20]();
  v6 = [(id)timeSinceMidnight__calendar components:28 fromDate:a1];
  v7 = [(id)timeSinceMidnight__calendar dateFromComponents:v6];
  [a1 timeIntervalSinceDate:v7];
  double v9 = v8;
  if (a3)
  {

    id v10 = v7;
    *a3 = v10;
  }
  else
  {
  }
  return v9;
}

- (uint64_t)floorDateWithTotalSlotsInDay:()_DKAdditions
{
  [a1 timeSinceMidnight:0];
  double v6 = (double)((uint64_t)(v5 / 86400.0 * (double)a3) * (86400 / a3)) - v5;
  return [a1 dateByAddingTimeInterval:v6];
}

- (uint64_t)slotFromMidnightWithTotalSlotsInDay:()_DKAdditions
{
  [a1 timeSinceMidnight:0];
  return (int)(v4 / 86400.0 * (double)a3);
}

@end