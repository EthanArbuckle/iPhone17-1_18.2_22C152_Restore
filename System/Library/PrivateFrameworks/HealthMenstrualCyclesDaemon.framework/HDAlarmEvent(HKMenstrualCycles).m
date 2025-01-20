@interface HDAlarmEvent(HKMenstrualCycles)
- (id)hdmc_categoryIdentifier;
- (uint64_t)hdmc_fertileWindowDayShift;
- (uint64_t)hdmc_fertileWindowEndDayIndex;
@end

@implementation HDAlarmEvent(HKMenstrualCycles)

- (id)hdmc_categoryIdentifier
{
  v2 = [a1 eventIdentifier];
  v3 = (void *)*MEMORY[0x263F45078];
  int v4 = [v2 containsString:*MEMORY[0x263F45078]];

  if (v4)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [a1 eventIdentifier];
  }
  return v5;
}

- (uint64_t)hdmc_fertileWindowEndDayIndex
{
  v2 = objc_msgSend(a1, "hdmc_categoryIdentifier");
  v3 = (void *)*MEMORY[0x263F45078];

  if (v2 != v3) {
    return 0;
  }
  id v5 = [a1 eventIdentifier];
  v6 = [v5 componentsSeparatedByString:@"_"];

  v7 = [v6 objectAtIndexedSubscript:0];
  uint64_t v8 = HKMCNotificationDateComponentScalarFromCategory();

  return v8;
}

- (uint64_t)hdmc_fertileWindowDayShift
{
  v2 = objc_msgSend(a1, "hdmc_categoryIdentifier");
  v3 = (void *)*MEMORY[0x263F45078];

  if (v2 != v3) {
    return 0;
  }
  id v5 = [a1 eventIdentifier];
  v6 = [v5 componentsSeparatedByString:@"_"];

  if ((unint64_t)[v6 count] < 2)
  {
    uint64_t v4 = 0;
  }
  else
  {
    v7 = [v6 objectAtIndexedSubscript:1];
    uint64_t v4 = [v7 integerValue];
  }
  return v4;
}

@end