@interface NSUnitAcceleration(HKUnit)
- (HKUnit)hk_equivalentBaseUnit;
@end

@implementation NSUnitAcceleration(HKUnit)

- (HKUnit)hk_equivalentBaseUnit
{
  return +[HKUnit unitFromString:@"m/s^2"];
}

@end