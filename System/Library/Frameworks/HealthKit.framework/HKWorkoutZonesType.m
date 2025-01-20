@interface HKWorkoutZonesType
+ (id)cyclingPowerType;
+ (id)heartRateType;
- (Class)dataObjectClass;
@end

@implementation HKWorkoutZonesType

+ (id)heartRateType
{
  return (id)[a1 workoutZonesTypeForIdentifier:@"HKWorkoutZonesTypeIdentifierHeartRate"];
}

+ (id)cyclingPowerType
{
  return (id)[a1 workoutZonesTypeForIdentifier:@"HKWorkoutZonesTypeIdentifierCyclingPower"];
}

- (Class)dataObjectClass
{
  return (Class)objc_opt_class();
}

@end