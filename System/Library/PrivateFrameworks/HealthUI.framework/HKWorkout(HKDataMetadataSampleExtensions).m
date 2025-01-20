@interface HKWorkout(HKDataMetadataSampleExtensions)
- (id)hk_defaultDistanceQuantityType;
@end

@implementation HKWorkout(HKDataMetadataSampleExtensions)

- (id)hk_defaultDistanceQuantityType
{
  [a1 workoutActivityType];
  v2 = _HKWorkoutDistanceTypeForActivityType();
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&off_1F3CF32D8;
    objc_msgSendSuper2(&v7, sel_hk_defaultDistanceQuantityType);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

@end