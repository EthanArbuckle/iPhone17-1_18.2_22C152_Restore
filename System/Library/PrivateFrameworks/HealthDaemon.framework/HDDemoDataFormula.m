@interface HDDemoDataFormula
+ (double)computeBasalMetabolicRateFromWeight:(double)a3 height:(double)a4 age:(double)a5 sex:(int64_t)a6;
+ (double)computeBloodAlcoholContentForNumDrinks:(double)a3 elapsedTime:(double)a4 weight:(double)a5 sex:(int64_t)a6;
+ (double)computeBodyFatPercentageFromWeight:(double)a3 leanBodyMass:(double)a4;
+ (double)computeBodyMassIndexFromWeight:(double)a3 height:(double)a4;
+ (double)computeLeanBodyMassFromWeight:(double)a3 height:(double)a4 sex:(int64_t)a5 waistCircumference:(double)a6 forearmCircumference:(double)a7 wristCircumference:(double)a8 hipCircumference:(double)a9;
+ (double)convertDegreeCelsiusToFahrenheit:(double)a3;
+ (double)convertDegreeFahrenheitToCelsius:(double)a3;
@end

@implementation HDDemoDataFormula

+ (double)convertDegreeCelsiusToFahrenheit:(double)a3
{
  return a3 * 9.0 / 5.0 + 32.0;
}

+ (double)convertDegreeFahrenheitToCelsius:(double)a3
{
  return (a3 + -32.0) * 5.0 / 9.0;
}

+ (double)computeBloodAlcoholContentForNumDrinks:(double)a3 elapsedTime:(double)a4 weight:(double)a5 sex:(int64_t)a6
{
  double v6 = 0.0;
  if (a4 >= 0.0)
  {
    double v7 = a4 * 0.000277777778 * -0.015 + a3 * 0.06 * 100.0 * 1.055 / (a5 * 2.20461988) * dbl_1BD32DCB0[a6 == 2];
    if (v7 >= 0.0) {
      return v7;
    }
    else {
      return 0.0;
    }
  }
  return v6;
}

+ (double)computeBodyMassIndexFromWeight:(double)a3 height:(double)a4
{
  return a3 / (a4 * 0.01 * (a4 * 0.01));
}

+ (double)computeBodyFatPercentageFromWeight:(double)a3 leanBodyMass:(double)a4
{
  return (a3 - a4) / a3;
}

+ (double)computeBasalMetabolicRateFromWeight:(double)a3 height:(double)a4 age:(double)a5 sex:(int64_t)a6
{
  double v6 = a4 * 6.25 + a3 * 10.0 + a5 * -5.0;
  double v7 = -161.0;
  if (a6 == 2) {
    double v7 = 5.0;
  }
  return v6 + v7;
}

+ (double)computeLeanBodyMassFromWeight:(double)a3 height:(double)a4 sex:(int64_t)a5 waistCircumference:(double)a6 forearmCircumference:(double)a7 wristCircumference:(double)a8 hipCircumference:(double)a9
{
  double result = 0.0;
  if (a3 != 0.0)
  {
    self;
    if (a5 == 2)
    {
      double v17 = a4 * 0.34 + a3 * 0.33;
      double v18 = -29.5;
    }
    else
    {
      double v17 = a4 * 0.41 + a3 * 0.29;
      double v18 = -43.3;
    }
    double v19 = v17 + v18;
    self;
    double v20 = a3 * a3 / (a4 * a4);
    double v21 = v20 * -128.0 + a3 * 1.1;
    double v22 = v20 * -148.0 + a3 * 1.07;
    self;
    double v23 = a3 * 2.20461988;
    if (a5 == 2) {
      double v24 = v21;
    }
    else {
      double v24 = v22;
    }
    if (a5 == 2) {
      double v25 = v23 * 1.082 + 94.42 + a6 * -4.15;
    }
    else {
      double v25 = v23 * 0.732 + 8.987 + a8 / -3.14159265 + a6 * -0.157 + a9 * -0.249 + a7 * 0.434;
    }
    return (v19 + v24 * 2.0 + v25 * 0.453592933) * 0.25;
  }
  return result;
}

@end