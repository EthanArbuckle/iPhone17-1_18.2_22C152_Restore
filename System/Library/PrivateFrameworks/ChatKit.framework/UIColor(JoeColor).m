@interface UIColor(JoeColor)
- (BOOL)ck_isCloseToColor:()JoeColor;
- (BOOL)ck_isVeryDark;
- (BOOL)ck_isVeryLight;
@end

@implementation UIColor(JoeColor)

- (BOOL)ck_isVeryDark
{
  double v2 = 0.0;
  [a1 getHue:0 saturation:0 brightness:&v2 alpha:0];
  return v2 <= 0.1;
}

- (BOOL)ck_isVeryLight
{
  double v4 = 0.0;
  double v2 = 0.0;
  double v3 = 0.0;
  [a1 getRed:&v4 green:&v3 blue:&v2 alpha:0];
  BOOL result = 0;
  if (v4 >= 0.95 && v3 >= 0.95) {
    return v2 >= 0.95;
  }
  return result;
}

- (BOOL)ck_isCloseToColor:()JoeColor
{
  double v13 = 0.0;
  double v11 = 0.0;
  double v12 = 0.0;
  double v9 = 0.0;
  double v10 = 0.0;
  double v8 = 0.0;
  id v4 = a3;
  [a1 getHue:&v13 saturation:&v12 brightness:&v11 alpha:0];
  [v4 getHue:&v10 saturation:&v9 brightness:&v8 alpha:0];

  if (vabdd_f64(v12, v9) > 0.0399999991 || vabdd_f64(v11, v8) > 0.0399999991) {
    return 0;
  }
  double v5 = v13;
  double v6 = v10;
  if (vabdd_f64(v13, v10) <= 0.0399999991) {
    return 1;
  }
  if (v13 < 0.0399999991) {
    double v5 = v13 + 1.0;
  }
  if (v10 < 0.0399999991) {
    double v6 = v10 + 1.0;
  }
  return vabdd_f64(v5, v6) <= 0.0399999991;
}

@end