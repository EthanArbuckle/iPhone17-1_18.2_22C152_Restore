@interface HKQuantity(FIUIUtilities)
- (BOOL)fiui_isNonzero;
- (double)fiui_doubleValueByDividingByQuantity:()FIUIUtilities;
@end

@implementation HKQuantity(FIUIUtilities)

- (BOOL)fiui_isNonzero
{
  v2 = [a1 _unit];
  [a1 doubleValueForUnit:v2];
  double v4 = v3;

  return fabs(v4) > 2.22044605e-16;
}

- (double)fiui_doubleValueByDividingByQuantity:()FIUIUtilities
{
  id v4 = a3;
  v5 = [a1 _unit];
  [a1 doubleValueForUnit:v5];
  double v7 = v6;
  [v4 doubleValueForUnit:v5];
  double v9 = v8;

  if (v9 == 0.0) {
    double v10 = 0.0;
  }
  else {
    double v10 = v7 / v9;
  }

  return v10;
}

@end