@interface HKWorkout
@end

@implementation HKWorkout

BOOL __85__HKWorkout_ActivityAchievementsDaemon___bestDurationForKilometerCount_activityType___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 dateInterval];
  v6 = [v5 startDate];
  v7 = [v4 dateInterval];

  v8 = [v7 startDate];
  BOOL v9 = [v6 compare:v8] == 1;

  return v9;
}

@end