@interface NSUnitAngle(HKUnit)
- (HKUnit)hk_equivalentBaseUnit;
- (id)hk_equivalentUnitWithConstant:()HKUnit coefficient:;
@end

@implementation NSUnitAngle(HKUnit)

- (HKUnit)hk_equivalentBaseUnit
{
  return +[HKUnit unitFromString:@"rad"];
}

- (id)hk_equivalentUnitWithConstant:()HKUnit coefficient:
{
  if (objc_msgSend(MEMORY[0x1E4F29148], "hk_equalConstant:forUnit:", @"deg")
    && (v4 = @"deg", (objc_msgSend(MEMORY[0x1E4F29148], "hk_equalCoefficient:forUnit:", @"deg", a2) & 1) != 0)
    || objc_msgSend(MEMORY[0x1E4F29148], "hk_equalConstant:forUnit:", @"rad", a1)
    && (v4 = @"rad",
        objc_msgSend(MEMORY[0x1E4F29148], "hk_equalCoefficient:forUnit:", @"rad", a2)))
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