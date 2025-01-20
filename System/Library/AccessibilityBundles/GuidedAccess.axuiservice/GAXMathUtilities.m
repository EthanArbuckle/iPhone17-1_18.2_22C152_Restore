@interface GAXMathUtilities
+ (double)minimizeFunctionWithBlock:(id)a3 intervalStart:(double)a4 intervalEnd:(double)a5 precision:(double)a6;
@end

@implementation GAXMathUtilities

+ (double)minimizeFunctionWithBlock:(id)a3 intervalStart:(double)a4 intervalEnd:(double)a5 precision:(double)a6
{
  v10 = (double (**)(double))a3;
  double v11 = v10[2](a4);
  ((void (*)(double (**)(double), double))v10[2])(v10, a5);
  if (vabdd_f64(a5, a4) >= fabs(a6))
  {
    if (vabdd_f64(v12, v11) >= 2.22044605e-16)
    {
      double v19 = (a4 + a5) * 0.5;
      BOOL v20 = v11 < v12;
      if (v11 >= v12) {
        double v21 = (a4 + a5) * 0.5;
      }
      else {
        double v21 = a4;
      }
      if (!v20) {
        double v19 = a5;
      }
      [a1 minimizeFunctionWithBlock:v10 intervalStart:v21 intervalEnd:v19 precision:a6];
      double v13 = v22;
    }
    else
    {
      double v14 = (a4 + a5) * 0.5;
      [a1 minimizeFunctionWithBlock:v10 intervalStart:a4 intervalEnd:v14 precision:a6];
      double v16 = v15;
      [a1 minimizeFunctionWithBlock:v10 intervalStart:v14 intervalEnd:a5 precision:a6];
      double v13 = v17;
      double v18 = ((double (*)(double (**)(double), double))v10[2])(v10, v16);
      if (v18 < ((double (*)(double (**)(double), double))v10[2])(v10, v13)) {
        double v13 = v16;
      }
    }
  }
  else if (v11 >= v12)
  {
    double v13 = a5;
  }
  else
  {
    double v13 = a4;
  }

  return v13;
}

@end