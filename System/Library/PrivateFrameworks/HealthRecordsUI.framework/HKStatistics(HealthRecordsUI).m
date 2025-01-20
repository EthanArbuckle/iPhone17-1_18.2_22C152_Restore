@interface HKStatistics(HealthRecordsUI)
- (void)updateMinMaxWithChartableCodedQuantity:()HealthRecordsUI;
@end

@implementation HKStatistics(HealthRecordsUI)

- (void)updateMinMaxWithChartableCodedQuantity:()HealthRecordsUI
{
  id v16 = a3;
  v4 = [a1 minimumQuantity];

  if (v4
    && ([a1 minimumQuantity],
        v5 = objc_claimAutoreleasedReturnValue(),
        [v16 quantity],
        v6 = objc_claimAutoreleasedReturnValue(),
        uint64_t v7 = [v5 compare:v6],
        v6,
        v5,
        v7 != 1))
  {
    uint64_t v8 = [a1 minimumQuantity];
  }
  else
  {
    uint64_t v8 = [v16 quantity];
  }
  v9 = (void *)v8;
  [a1 setMinimumQuantity:v8];

  v10 = [a1 maximumQuantity];

  if (!v10
    || ([a1 maximumQuantity],
        v11 = objc_claimAutoreleasedReturnValue(),
        [v16 quantity],
        v12 = objc_claimAutoreleasedReturnValue(),
        uint64_t v13 = [v11 compare:v12],
        v12,
        v11,
        v13 == -1))
  {
    uint64_t v14 = [v16 quantity];
  }
  else
  {
    uint64_t v14 = [a1 maximumQuantity];
  }
  v15 = (void *)v14;
  [a1 setMaximumQuantity:v14];
}

@end