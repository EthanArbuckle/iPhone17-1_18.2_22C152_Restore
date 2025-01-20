@interface HKQuantitySample(Workouts)
- (id)hdw_dateInterval;
@end

@implementation HKQuantitySample(Workouts)

- (id)hdw_dateInterval
{
  id v2 = objc_alloc(MEMORY[0x1E4F28C18]);
  v3 = [a1 startDate];
  v4 = [a1 endDate];
  v5 = (void *)[v2 initWithStartDate:v3 endDate:v4];

  return v5;
}

@end