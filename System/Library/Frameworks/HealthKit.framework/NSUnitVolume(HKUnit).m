@interface NSUnitVolume(HKUnit)
- (HKUnit)hk_equivalentBaseUnit;
- (id)hk_equivalentUnitWithConstant:()HKUnit coefficient:;
@end

@implementation NSUnitVolume(HKUnit)

- (HKUnit)hk_equivalentBaseUnit
{
  return +[HKUnit unitFromString:@"L"];
}

- (id)hk_equivalentUnitWithConstant:()HKUnit coefficient:
{
  if (fabs(a1) < 2.22044605e-16
    && ((v3 = @"fl_oz_us",
         (objc_msgSend(MEMORY[0x1E4F29148], "hk_equalCoefficient:forUnit:", @"fl_oz_us", a2) & 1) != 0)
     || (v3 = @"fl_oz_imp",
         (objc_msgSend(MEMORY[0x1E4F29148], "hk_equalCoefficient:forUnit:", @"fl_oz_imp", a2) & 1) != 0)
     || (v3 = @"pt_us",
         (objc_msgSend(MEMORY[0x1E4F29148], "hk_equalCoefficient:forUnit:", @"pt_us", a2) & 1) != 0)
     || (v3 = @"pt_imp",
         (objc_msgSend(MEMORY[0x1E4F29148], "hk_equalCoefficient:forUnit:", @"pt_imp", a2) & 1) != 0)
     || (v3 = @"cup_us",
         (objc_msgSend(MEMORY[0x1E4F29148], "hk_equalCoefficient:forUnit:", @"cup_us", a2) & 1) != 0)
     || (v3 = @"cup_imp",
         objc_msgSend(MEMORY[0x1E4F29148], "hk_equalCoefficient:forUnit:", @"cup_imp", a2))))
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