@interface NSUnitConcentrationMass(HKUnit)
- (HKUnit)hk_equivalentBaseUnit;
@end

@implementation NSUnitConcentrationMass(HKUnit)

- (HKUnit)hk_equivalentBaseUnit
{
  return +[HKUnit unitFromString:@"g/L"];
}

@end