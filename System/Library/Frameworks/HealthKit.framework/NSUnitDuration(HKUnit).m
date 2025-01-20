@interface NSUnitDuration(HKUnit)
- (HKUnit)hk_equivalentBaseUnit;
- (id)hk_equivalentUnitWithConstant:()HKUnit coefficient:;
@end

@implementation NSUnitDuration(HKUnit)

- (HKUnit)hk_equivalentBaseUnit
{
  return +[HKUnit unitFromString:@"s"];
}

- (id)hk_equivalentUnitWithConstant:()HKUnit coefficient:
{
  if (fabs(a1) < 2.22044605e-16
    && ((v3 = @"min",
         (objc_msgSend(MEMORY[0x1E4F29148], "hk_equalCoefficient:forUnit:", @"min", a2) & 1) != 0)
     || (v3 = @"hr", (objc_msgSend(MEMORY[0x1E4F29148], "hk_equalCoefficient:forUnit:", @"hr", a2) & 1) != 0)
     || (v3 = @"d", objc_msgSend(MEMORY[0x1E4F29148], "hk_equalCoefficient:forUnit:", @"d", a2))))
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