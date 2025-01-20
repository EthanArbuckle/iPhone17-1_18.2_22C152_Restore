@interface NSUnitDispersion(HKUnit)
- (HKUnit)hk_equivalentBaseUnit;
@end

@implementation NSUnitDispersion(HKUnit)

- (HKUnit)hk_equivalentBaseUnit
{
  return +[HKUnit unitFromString:@"count^-6"];
}

@end