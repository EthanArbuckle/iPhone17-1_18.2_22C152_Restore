@interface NSUnitLength(HKUnit)
- (HKUnit)hk_equivalentBaseUnit;
- (id)hk_equivalentUnitWithConstant:()HKUnit coefficient:;
@end

@implementation NSUnitLength(HKUnit)

- (HKUnit)hk_equivalentBaseUnit
{
  return +[HKUnit unitFromString:@"m"];
}

- (id)hk_equivalentUnitWithConstant:()HKUnit coefficient:
{
  if (fabs(a1) < 2.22044605e-16
    && ((v3 = @"in", (objc_msgSend(MEMORY[0x1E4F29148], "hk_equalCoefficient:forUnit:", @"in", a2) & 1) != 0)
     || (v3 = @"ft", (objc_msgSend(MEMORY[0x1E4F29148], "hk_equalCoefficient:forUnit:", @"ft", a2) & 1) != 0)
     || (v3 = @"yd", (objc_msgSend(MEMORY[0x1E4F29148], "hk_equalCoefficient:forUnit:", @"yd", a2) & 1) != 0)
     || (v3 = @"mi",
         objc_msgSend(MEMORY[0x1E4F29148], "hk_equalCoefficient:forUnit:", @"mi", a2))))
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