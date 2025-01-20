@interface HKAxisLabelDimensionScalar
+ (int64_t)_fractionDigitsForStep:(double)a3;
- (double)niceStepSizeLargerThan:(double)a3;
- (double)ticksPerStepSize:(double)a3;
- (id)endingLabelsFactorOverride;
- (id)formatterForLabelStepSize:(double)a3;
- (id)stringForLocation:(id)a3 formatterForStepSize:(id)a4;
@end

@implementation HKAxisLabelDimensionScalar

- (double)niceStepSizeLargerThan:(double)a3
{
  if (a3 == 0.0) {
    double v4 = 0.0;
  }
  else {
    double v4 = floor(log10(fabs(a3)));
  }
  double v5 = __exp10(v4);
  double v6 = a3 / v5;
  double v7 = 5.0;
  if (v6 >= 5.0)
  {
    double v7 = 1.0;
    double v5 = __exp10(v4 + 1.0);
  }
  else if (v6 < 2.5)
  {
    if (v6 >= 2.0) {
      double v7 = 2.5;
    }
    else {
      double v7 = 2.0;
    }
  }
  return v7 * v5;
}

- (double)ticksPerStepSize:(double)a3
{
  if (a3 == 0.0) {
    double v4 = 0.0;
  }
  else {
    double v4 = floor(log10(fabs(a3)));
  }
  double v5 = a3 / __exp10(v4);
  double result = 5.0;
  if (fabs(v5 + -5.0) >= 0.00000001 && fabs(v5 + -2.5) > 0.00000001) {
    return 4.0;
  }
  return result;
}

- (id)formatterForLabelStepSize:(double)a3
{
  int64_t v3 = +[HKAxisLabelDimensionScalar _fractionDigitsForStep:a3];
  id v4 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  [v4 setNumberStyle:1];
  [v4 setUsesGroupingSeparator:1];
  [v4 setMinimumFractionDigits:v3];
  [v4 setMaximumFractionDigits:v3];
  return v4;
}

- (id)stringForLocation:(id)a3 formatterForStepSize:(id)a4
{
  id v5 = a4;
  double v6 = [v5 stringFromNumber:a3];
  double v7 = [v5 stringFromNumber:&unk_1F3C22A70];
  if ([v6 isEqualToString:v7])
  {
    uint64_t v8 = [v5 stringFromNumber:&unk_1F3C22A80];

    double v6 = (void *)v8;
  }

  return v6;
}

- (id)endingLabelsFactorOverride
{
  return 0;
}

+ (int64_t)_fractionDigitsForStep:(double)a3
{
  if (a3 == 0.0) {
    return 0;
  }
  double v5 = fabs(a3);
  if (v5 >= 1.0)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
    [v8 setNumberStyle:1];
    int64_t v3 = 0;
    while (1)
    {
      [v8 setMinimumFractionDigits:v3];
      [v8 setMaximumFractionDigits:v3];
      v9 = [NSNumber numberWithDouble:a3];
      v10 = [v8 stringFromNumber:v9];

      v11 = [v8 numberFromString:v10];
      v12 = v11;
      if (!v11) {
        break;
      }
      [v11 doubleValue];
      if (vabdd_f64(a3, v13) < 1.0e-10) {
        break;
      }
      ++v3;

      if (v3 == 15) {
        goto LABEL_11;
      }
    }

LABEL_11:
  }
  else
  {
    double v7 = floor(log10(v5));
    return [a1 _fractionDigitsForStep:v5 / __exp10(v7)] + (uint64_t)rint(-v7);
  }
  return v3;
}

@end