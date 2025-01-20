@interface NSUnitPower(HKUnit)
- (HKUnit)hk_equivalentBaseUnit;
@end

@implementation NSUnitPower(HKUnit)

- (HKUnit)hk_equivalentBaseUnit
{
  return +[HKUnit unitFromString:@"W"];
}

@end