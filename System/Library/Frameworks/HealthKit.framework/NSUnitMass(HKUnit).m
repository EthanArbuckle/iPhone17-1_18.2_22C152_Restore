@interface NSUnitMass(HKUnit)
- (HKUnit)hk_equivalentBaseUnit;
- (id)hk_equivalentUnitWithConstant:()HKUnit coefficient:;
@end

@implementation NSUnitMass(HKUnit)

- (HKUnit)hk_equivalentBaseUnit
{
  return +[HKUnit unitFromString:@"kg"];
}

- (id)hk_equivalentUnitWithConstant:()HKUnit coefficient:
{
  if (fabs(a1) < 2.22044605e-16
    && ((v3 = @"oz", (objc_msgSend(MEMORY[0x1E4F29148], "hk_equalCoefficient:forUnit:", @"oz", a2) & 1) != 0)
     || (v3 = @"lb", (objc_msgSend(MEMORY[0x1E4F29148], "hk_equalCoefficient:forUnit:", @"lb", a2) & 1) != 0)
     || (v3 = @"st",
         objc_msgSend(MEMORY[0x1E4F29148], "hk_equalCoefficient:forUnit:", @"st", a2))))
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