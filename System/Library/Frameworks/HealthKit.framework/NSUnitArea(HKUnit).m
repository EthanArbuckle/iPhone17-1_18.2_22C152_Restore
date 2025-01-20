@interface NSUnitArea(HKUnit)
- (HKUnit)hk_equivalentBaseUnit;
@end

@implementation NSUnitArea(HKUnit)

- (HKUnit)hk_equivalentBaseUnit
{
  return +[HKUnit unitFromString:@"m^2"];
}

@end