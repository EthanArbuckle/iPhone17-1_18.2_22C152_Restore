@interface NSUnitFrequency(HKUnit)
- (HKUnit)hk_equivalentBaseUnit;
@end

@implementation NSUnitFrequency(HKUnit)

- (HKUnit)hk_equivalentBaseUnit
{
  return +[HKUnit unitFromString:@"s^-1"];
}

@end