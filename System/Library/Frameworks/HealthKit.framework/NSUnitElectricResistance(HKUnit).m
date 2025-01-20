@interface NSUnitElectricResistance(HKUnit)
- (HKUnit)hk_equivalentBaseUnit;
@end

@implementation NSUnitElectricResistance(HKUnit)

- (HKUnit)hk_equivalentBaseUnit
{
  return +[HKUnit unitFromString:@"1/S"];
}

@end