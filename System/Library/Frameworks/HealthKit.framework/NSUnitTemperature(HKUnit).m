@interface NSUnitTemperature(HKUnit)
- (HKUnit)hk_equivalentBaseUnit;
- (id)hk_equivalentUnitWithConstant:()HKUnit coefficient:;
@end

@implementation NSUnitTemperature(HKUnit)

- (HKUnit)hk_equivalentBaseUnit
{
  return +[HKUnit unitFromString:@"K"];
}

- (id)hk_equivalentUnitWithConstant:()HKUnit coefficient:
{
  if (objc_msgSend(MEMORY[0x1E4F29148], "hk_equalConstant:forUnit:", @"degC")
    && (v4 = @"degC",
        (objc_msgSend(MEMORY[0x1E4F29148], "hk_equalCoefficient:forUnit:", @"degC", a2) & 1) != 0)
    || objc_msgSend(MEMORY[0x1E4F29148], "hk_equalConstant:forUnit:", @"degF", a1)
    && (v4 = @"degF",
        objc_msgSend(MEMORY[0x1E4F29148], "hk_equalCoefficient:forUnit:", @"degF", a2)))
  {
    v5 = +[HKUnit unitFromString:v4];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end