@interface NSUnitEnergy(HKUnit)
- (HKUnit)hk_equivalentBaseUnit;
- (id)hk_equivalentUnitWithConstant:()HKUnit coefficient:;
@end

@implementation NSUnitEnergy(HKUnit)

- (HKUnit)hk_equivalentBaseUnit
{
  return +[HKUnit unitFromString:@"J"];
}

- (id)hk_equivalentUnitWithConstant:()HKUnit coefficient:
{
  if (fabs(a1) < 2.22044605e-16
    && ((v3 = @"kcal",
         (objc_msgSend(MEMORY[0x1E4F29148], "hk_equalCoefficient:forUnit:", @"kcal", a2) & 1) != 0)
     || (v3 = @"cal",
         objc_msgSend(MEMORY[0x1E4F29148], "hk_equalCoefficient:forUnit:", @"cal", a2))))
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