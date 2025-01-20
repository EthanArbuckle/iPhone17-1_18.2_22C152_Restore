@interface HKAxisLabelDimensionInteger
- (double)niceStepSizeLargerThan:(double)a3;
- (id)formatterForLabelStepSize:(double)a3;
@end

@implementation HKAxisLabelDimensionInteger

- (double)niceStepSizeLargerThan:(double)a3
{
  if (a3 == 0.0)
  {
    double v5 = 0.0;
  }
  else
  {
    double v4 = floor(log10(fabs(a3)));
    if (v4 >= 0.0) {
      double v5 = v4;
    }
    else {
      double v5 = 0.0;
    }
  }
  double v6 = __exp10(v5);
  double v7 = a3 / v6;
  double v8 = 5.0;
  if (v7 >= 5.0)
  {
    double v8 = 1.0;
    double v6 = __exp10(v5 + 1.0);
  }
  else if (v7 < 2.0)
  {
    if (v7 >= 1.0) {
      double v8 = 2.0;
    }
    else {
      double v8 = 1.0;
    }
  }
  return v8 * v6;
}

- (id)formatterForLabelStepSize:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKAxisLabelDimensionInteger;
  v3 = [(HKAxisLabelDimensionScalar *)&v5 formatterForLabelStepSize:a3];
  [v3 setMinimumFractionDigits:0];
  [v3 setMaximumFractionDigits:0];
  return v3;
}

@end