@interface NSNumber(CAAnimatableValue)
- (double)CA_distanceToValue:()CAAnimatableValue;
- (uint64_t)CA_addValue:()CAAnimatableValue multipliedBy:;
- (uint64_t)CA_interpolateValue:()CAAnimatableValue byFraction:;
- (uint64_t)CA_interpolateValues:()CAAnimatableValue ::interpolator:;
- (uint64_t)CA_roundToIntegerFromValue:()CAAnimatableValue;
@end

@implementation NSNumber(CAAnimatableValue)

- (uint64_t)CA_addValue:()CAAnimatableValue multipliedBy:
{
  [a1 doubleValue];
  double v7 = v6;
  [a3 doubleValue];
  v8 = NSNumber;
  double v10 = v7 + v9 * (double)a4;

  return [v8 numberWithDouble:v10];
}

- (uint64_t)CA_interpolateValue:()CAAnimatableValue byFraction:
{
  [a1 doubleValue];
  double v7 = v6;
  [a4 doubleValue];
  v8 = NSNumber;
  double v10 = (v9 - v7) * a2;
  BOOL v11 = v7 == v9;
  double v12 = 0.0;
  if (!v11) {
    double v12 = v10;
  }
  double v13 = v12 + v7;

  return [v8 numberWithDouble:v13];
}

- (double)CA_distanceToValue:()CAAnimatableValue
{
  [a1 doubleValue];
  double v5 = v4;
  [a3 doubleValue];
  return vabdd_f64(v5, v6);
}

- (uint64_t)CA_roundToIntegerFromValue:()CAAnimatableValue
{
  [a1 doubleValue];
  double v5 = v4;
  [a3 doubleValue];
  double v7 = round(v5 - v6) + v6;
  v8 = NSNumber;

  return [v8 numberWithDouble:v7];
}

- (uint64_t)CA_interpolateValues:()CAAnimatableValue ::interpolator:
{
  [a1 doubleValue];
  double v11 = v10;
  [a4 doubleValue];
  double v13 = v12;
  if (a3)
  {
    [a3 doubleValue];
    double v15 = v14;
    if (a5)
    {
LABEL_3:
      [a5 doubleValue];
      goto LABEL_6;
    }
  }
  else
  {
    double v15 = -(v12 + v11 * -2.0);
    if (a5) {
      goto LABEL_3;
    }
  }
  double v16 = -(v11 + v13 * -2.0);
LABEL_6:
  v17 = NSNumber;
  double v18 = a6[2] * v11
      + a6[3] * (a6[10] * (v11 - v15) + a6[11] * (v13 - v11))
      + a6[4] * v13
      + a6[5] * (a6[12] * (v13 - v11) + a6[13] * (v16 - v13));

  return [v17 numberWithDouble:v18];
}

@end