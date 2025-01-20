@interface NSUnitPressure(HKUnit)
- (HKUnit)hk_equivalentBaseUnit;
- (id)hk_equivalentUnitWithConstant:()HKUnit coefficient:;
@end

@implementation NSUnitPressure(HKUnit)

- (HKUnit)hk_equivalentBaseUnit
{
  return +[HKUnit unitFromString:@"Pa"];
}

- (id)hk_equivalentUnitWithConstant:()HKUnit coefficient:
{
  if (fabs(a1) < 2.22044605e-16
    && ((v3 = @"mmHg",
         (objc_msgSend(MEMORY[0x1E4F29148], "hk_equalCoefficient:forUnit:", @"mmHg", a2) & 1) != 0)
     || (v3 = @"cmAq",
         (objc_msgSend(MEMORY[0x1E4F29148], "hk_equalCoefficient:forUnit:", @"cmAq", a2) & 1) != 0)
     || (v3 = @"atm",
         objc_msgSend(MEMORY[0x1E4F29148], "hk_equalCoefficient:forUnit:", @"atm", a2))))
  {
    v4 = +[HKUnit unitFromString:v3];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end