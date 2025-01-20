@interface NSUnitSpeed(HKUnit)
- (HKUnit)hk_equivalentBaseUnit;
@end

@implementation NSUnitSpeed(HKUnit)

- (HKUnit)hk_equivalentBaseUnit
{
  return +[HKUnit unitFromString:@"m*s^-1"];
}

@end