@interface NSDateInterval(CRKAdditions)
- (id)crk_dateIntervalByAddingTimeInterval:()CRKAdditions;
- (uint64_t)crk_containsCurrentDate;
@end

@implementation NSDateInterval(CRKAdditions)

- (uint64_t)crk_containsCurrentDate
{
  v2 = [MEMORY[0x263EFF910] date];
  uint64_t v3 = [a1 containsDate:v2];

  return v3;
}

- (id)crk_dateIntervalByAddingTimeInterval:()CRKAdditions
{
  v4 = [a1 startDate];
  v5 = [v4 dateByAddingTimeInterval:a2];

  v6 = [a1 endDate];
  v7 = [v6 dateByAddingTimeInterval:a2];

  v8 = (void *)[objc_alloc((Class)objc_opt_class()) initWithStartDate:v5 endDate:v7];

  return v8;
}

@end