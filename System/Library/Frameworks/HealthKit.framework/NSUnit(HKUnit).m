@interface NSUnit(HKUnit)
+ (BOOL)hk_equalCoefficient:()HKUnit forUnit:;
+ (BOOL)hk_equalConstant:()HKUnit forUnit:;
+ (double)hk_conversionCoefficient:()HKUnit;
+ (double)hk_conversionConstant:()HKUnit;
+ (id)hk_prefixForCoefficient:()HKUnit;
+ (unint64_t)hk_isSIUnit:()HKUnit;
- (id)hk_convertQuantityWithValue:()HKUnit constant:coefficient:;
- (id)hk_equivalentQuantityWithValue:()HKUnit;
- (id)hk_equivalentUnit;
- (uint64_t)hk_equivalentBaseUnit;
- (uint64_t)hk_equivalentUnitWithConstant:()HKUnit coefficient:;
@end

@implementation NSUnit(HKUnit)

+ (double)hk_conversionCoefficient:()HKUnit
{
  uint64_t v3 = hk_conversionCoefficient__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&hk_conversionCoefficient__onceToken, &__block_literal_global_8);
  }
  v5 = [(id)hk_conversionCoefficient__coefficients objectForKey:v4];

  [v5 doubleValue];
  double v7 = v6;

  return v7;
}

+ (double)hk_conversionConstant:()HKUnit
{
  uint64_t v3 = hk_conversionConstant__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&hk_conversionConstant__onceToken, &__block_literal_global_93);
  }
  v5 = [(id)hk_conversionConstant__constants objectForKey:v4];

  [v5 doubleValue];
  double v7 = v6;

  return v7;
}

+ (unint64_t)hk_isSIUnit:()HKUnit
{
  id v3 = a3;
  if ([v3 length] == 1)
  {
    int v4 = [v3 characterAtIndex:0];

    if ((v4 - 74) >= 0x2A) {
      return 0;
    }
    else {
      return (0x20820000207uLL >> (v4 - 74)) & 1;
    }
  }
  else
  {
    uint64_t v6 = [v3 isEqualToString:@"Pa"];

    return v6;
  }
}

+ (id)hk_prefixForCoefficient:()HKUnit
{
  if (hk_prefixForCoefficient__onceToken != -1) {
    dispatch_once(&hk_prefixForCoefficient__onceToken, &__block_literal_global_98);
  }
  v2 = (void *)hk_prefixForCoefficient__prefixes;
  id v3 = [NSNumber numberWithDouble:a1];
  int v4 = [v2 objectForKey:v3];

  return v4;
}

+ (BOOL)hk_equalCoefficient:()HKUnit forUnit:
{
  objc_msgSend(MEMORY[0x1E4F29148], "hk_conversionCoefficient:");
  return vabdd_f64(v2, a1) < 2.22044605e-16;
}

+ (BOOL)hk_equalConstant:()HKUnit forUnit:
{
  objc_msgSend(MEMORY[0x1E4F29148], "hk_conversionConstant:");
  return vabdd_f64(v2, a1) < 2.22044605e-16;
}

- (id)hk_equivalentUnit
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = a1;
    id v3 = [v2 converter];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v5 = [v2 converter];
      [v5 constant];
      double v7 = v6;
      [v5 coefficient];
      v9 = objc_msgSend(v2, "hk_equivalentUnitWithConstant:coefficient:", v7, v8);
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (uint64_t)hk_equivalentBaseUnit
{
  return 0;
}

- (uint64_t)hk_equivalentUnitWithConstant:()HKUnit coefficient:
{
  return 0;
}

- (id)hk_equivalentQuantityWithValue:()HKUnit
{
  int v4 = objc_msgSend(a1, "hk_equivalentUnit");
  if (v4)
  {
    v5 = +[HKQuantity quantityWithUnit:v4 doubleValue:a2];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = a1;
      double v7 = [v6 converter];
      objc_opt_class();
      double v8 = 0.0;
      double v9 = 0.0;
      if (objc_opt_isKindOfClass())
      {
        id v10 = v7;
        [v10 constant];
        double v8 = v11;
        [v10 coefficient];
        double v9 = v12;
      }
      v5 = objc_msgSend(v6, "hk_convertQuantityWithValue:constant:coefficient:", a2, v8, v9);
    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (id)hk_convertQuantityWithValue:()HKUnit constant:coefficient:
{
  double v7 = objc_msgSend(a1, "hk_equivalentBaseUnit");
  double v8 = v7;
  if (v7)
  {
    double v9 = [v7 unitString];
    int v10 = objc_msgSend(MEMORY[0x1E4F29148], "hk_isSIUnit:", v9);
    BOOL v11 = fabs(a3) >= 2.22044605e-16 || v10 == 0;
    if (v11
      || (objc_msgSend(MEMORY[0x1E4F29148], "hk_prefixForCoefficient:", a4),
          (uint64_t v12 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      v16 = +[HKQuantity quantityWithUnit:v8 doubleValue:a3 + a2 * a4];
    }
    else
    {
      v13 = (void *)v12;
      uint64_t v14 = [NSString stringWithFormat:@"%@%@", v12, v9];

      v15 = +[HKUnit unitFromString:v14];
      v16 = +[HKQuantity quantityWithUnit:v15 doubleValue:a2];

      double v9 = (void *)v14;
    }
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

@end