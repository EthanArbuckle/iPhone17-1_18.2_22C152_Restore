@interface AXMDataRegressionModelSine
- (double)estimatedRadianFrequency;
- (id)modelDescription;
- (id)modelFunction;
- (id)modelFunctionStringForParameters:(double *)a3 significantFigures:(int)a4;
- (id)partialDerivatives;
- (int)modelParameterCount;
- (void)disqualifyModelIfNecessary;
- (void)getInitialParams:(double *)a3;
@end

@implementation AXMDataRegressionModelSine

- (id)modelDescription
{
  v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
  v3 = [v2 localizedStringForKey:@"chart.model.sinusoidal" value:&stru_1F0E72D10 table:@"Accessibility"];

  return v3;
}

- (id)modelFunction
{
  return &__block_literal_global_25;
}

long double __43__AXMDataRegressionModelSine_modelFunction__block_invoke(double a1, uint64_t a2, double *a3)
{
  double v3 = *a3;
  double v4 = a3[3];
  return v4 + v3 * sin(a3[2] + a3[1] * a1);
}

- (int)modelParameterCount
{
  return 4;
}

- (void)disqualifyModelIfNecessary
{
  double v2 = self->super._bestFitParameters[1];
  if (v2 > 0.0)
  {
    double v4 = 6.28318531 / v2;
    double v5 = max(self->super._x, self->super._n);
    BOOL v6 = v5 - min(self->super._x, self->super._n) < v4 * 0.666666667;
    [(AXMDataRegressionModel *)self setIsDisqualified:v6];
  }
}

- (void)getInitialParams:(double *)a3
{
  double v5 = min(self->super._y, self->super._n);
  double v6 = max(self->super._y, self->super._n) - v5;
  *a3 = v6 / 1.5;
  [(AXMDataRegressionModelSine *)self estimatedRadianFrequency];
  *((void *)a3 + 1) = v7;
  a3[2] = 0.0;
  a3[3] = v5 + v6 * 0.5;
}

- (id)partialDerivatives
{
  double v2 = [MEMORY[0x1E4F1CA48] array];
  [v2 addObject:&__block_literal_global_40_1];
  [v2 addObject:&__block_literal_global_42_1];
  [v2 addObject:&__block_literal_global_44_0];
  [v2 addObject:&__block_literal_global_46];
  double v3 = (void *)[v2 copy];

  return v3;
}

double __48__AXMDataRegressionModelSine_partialDerivatives__block_invoke(double a1, uint64_t a2, uint64_t a3)
{
  return sin(*(double *)(a3 + 16) + *(double *)(a3 + 8) * a1);
}

long double __48__AXMDataRegressionModelSine_partialDerivatives__block_invoke_2(double a1, uint64_t a2, double *a3)
{
  double v3 = *a3 * a1;
  return v3 * cos(a3[2] + a3[1] * a1);
}

long double __48__AXMDataRegressionModelSine_partialDerivatives__block_invoke_3(double a1, uint64_t a2, double *a3)
{
  double v3 = *a3;
  return v3 * cos(a3[2] + a3[1] * a1);
}

double __48__AXMDataRegressionModelSine_partialDerivatives__block_invoke_4()
{
  return 1.0;
}

- (id)modelFunctionStringForParameters:(double *)a3 significantFigures:(int)a4
{
  id v6 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  [v6 setUsesSignificantDigits:1];
  [v6 setMaximumSignificantDigits:a4];
  uint64_t v7 = [NSNumber numberWithDouble:*a3];
  v8 = [v6 stringFromNumber:v7];

  v9 = [NSNumber numberWithDouble:a3[1]];
  v10 = [v6 stringFromNumber:v9];

  v11 = [NSNumber numberWithDouble:a3[2]];
  v12 = [v6 stringFromNumber:v11];

  v13 = [NSNumber numberWithDouble:a3[3]];
  v14 = [v6 stringFromNumber:v13];

  v15 = [NSString stringWithFormat:@"y = %@ * sin(%@x + %@) + %@", v8, v10, v12, v14];

  return v15;
}

- (double)estimatedRadianFrequency
{
  v32[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(AXMDataRegressionModel *)self sortDataPoints];
  MEMORY[0x1F4188790](v3);
  id v6 = (char *)v32 - v5;
  if (v4 >= 25) {
    uint64_t v7 = 5;
  }
  else {
    uint64_t v7 = (v4 / 5);
  }
  [(AXMDataRegressionModel *)self getSMA:(char *)v32 - v5 lookback:v7];
  uint64_t n = self->super._n;
  if ((int)n < 1)
  {
    LODWORD(v10) = 0;
    LODWORD(v11) = 0;
    double v15 = -INFINITY;
  }
  else
  {
    uint64_t v9 = 0;
    LODWORD(v10) = 0;
    LODWORD(v11) = 0;
    double v12 = -1.79769313e308;
    double v13 = 1.79769313e308;
    do
    {
      double v14 = *(double *)&v6[8 * v9];
      if (v14 < v13)
      {
        LODWORD(v11) = v9;
        double v13 = *(double *)&v6[8 * v9];
      }
      if (v14 > v12)
      {
        LODWORD(v10) = v9;
        double v12 = *(double *)&v6[8 * v9];
      }
      ++v9;
    }
    while (n != v9);
    double v15 = v13 + (v12 - v13) * 0.5;
    if ((int)v11 < (int)v10)
    {
      int v16 = 0;
      int v17 = 0;
      uint64_t v18 = (int)v11;
      v19 = (double *)&v6[8 * (int)v11];
      int v20 = v10 - v11 + 1;
      do
      {
        double v21 = *v19++;
        BOOL v22 = v21 > v15;
        int v23 = v17 + (v22 & (v16 ^ 1));
        unsigned __int8 v24 = v22 | v16;
        int v17 = v23 + ((v21 < v15) & v24);
        int v16 = (v21 >= v15) & v24;
        --v20;
      }
      while (v20);
      uint64_t v10 = (int)v10;
      return 6.28318531 / (vabdd_f64(self->super._x[v10], self->super._x[v18]) / ((double)v17 * 0.5));
    }
  }
  int v25 = 0;
  int v17 = 0;
  uint64_t v18 = (int)v11;
  uint64_t v10 = (int)v10;
  uint64_t v11 = (int)v11;
  do
  {
    double v26 = *(double *)&v6[8 * v11];
    BOOL v27 = v26 > v15;
    int v28 = v17 + (v27 & (v25 ^ 1));
    unsigned __int8 v29 = v27 | v25;
    int v17 = v28 + ((v26 < v15) & v29);
    int v25 = (v26 >= v15) & v29;
  }
  while (v11-- > (int)v10);
  return 6.28318531 / (vabdd_f64(self->super._x[v10], self->super._x[v18]) / ((double)v17 * 0.5));
}

@end