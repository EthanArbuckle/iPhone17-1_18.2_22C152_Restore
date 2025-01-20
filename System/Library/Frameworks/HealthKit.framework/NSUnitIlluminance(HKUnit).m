@interface NSUnitIlluminance(HKUnit)
- (HKUnit)hk_equivalentBaseUnit;
@end

@implementation NSUnitIlluminance(HKUnit)

- (HKUnit)hk_equivalentBaseUnit
{
  return +[HKUnit unitFromString:@"lx"];
}

@end