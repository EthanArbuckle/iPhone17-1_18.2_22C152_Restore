@interface ATXMagicalMomentsStatistics
+ (double)betaDistributionCdfAtX:(double)a3 paramA:(double)a4 paramB:(double)a5;
+ (double)calculateModelConfidenceWithCorrectPredictions:(double)a3 incorrectPredictions:(double)a4;
@end

@implementation ATXMagicalMomentsStatistics

+ (double)calculateModelConfidenceWithCorrectPredictions:(double)a3 incorrectPredictions:(double)a4
{
  double v6 = 0.0;
  int v7 = 20;
  double v8 = 1.0;
  do
  {
    [(id)objc_opt_class() betaDistributionCdfAtX:(v8 + v6) * 0.5 paramA:a3 paramB:a4];
    if (1.0 - v9 >= 0.95) {
      double v6 = (v8 + v6) * 0.5;
    }
    else {
      double v8 = (v8 + v6) * 0.5;
    }
    --v7;
  }
  while (v7);
  return (v8 + v6) * 0.5;
}

+ (double)betaDistributionCdfAtX:(double)a3 paramA:(double)a4 paramB:(double)a5
{
  double i = -1.0;
  if (a3 >= 0.0 && a3 <= 1.0)
  {
    double i = 0.0;
    if (a3 != 0.0)
    {
      double i = 1.0;
      if (a3 != 1.0)
      {
        double v10 = 0.0005;
        for (double i = 0.0; v10 <= a3; v10 = v10 + 0.001)
        {
          double v11 = log(v10);
          long double v12 = log(1.0 - v10);
          double i = i + exp((a5 + -1.0) * v12 + (a4 + -1.0) * v11) * 0.001;
        }
      }
    }
  }
  double v13 = lgamma(a4);
  long double v14 = v13 + lgamma(a5);
  long double v15 = lgamma(a4 + a5);
  double result = i / exp(v14 - v15);
  if (result > 1.0) {
    double result = 1.0;
  }
  if (result < 0.0) {
    return 0.0;
  }
  return result;
}

@end