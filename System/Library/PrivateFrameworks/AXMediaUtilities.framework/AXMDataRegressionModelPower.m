@interface AXMDataRegressionModelPower
- (BOOL)dataSatisfiesInitialConditions;
- (id)modelDescription;
- (id)modelFunction;
- (id)modelFunctionStringForParameters:(double *)a3 significantFigures:(int)a4;
- (id)partialDerivatives;
- (int)modelParameterCount;
- (void)getInitialParams:(double *)a3;
@end

@implementation AXMDataRegressionModelPower

- (id)modelDescription
{
  v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
  v3 = [v2 localizedStringForKey:@"chart.model.power" value:&stru_1F0E72D10 table:@"Accessibility"];

  return v3;
}

- (id)modelFunction
{
  return &__block_literal_global_20;
}

long double __44__AXMDataRegressionModelPower_modelFunction__block_invoke(long double a1, uint64_t a2, uint64_t a3)
{
  double v3 = *(double *)a3;
  return v3 * pow(a1, *(long double *)(a3 + 8));
}

- (int)modelParameterCount
{
  return 2;
}

- (void)getInitialParams:(double *)a3
{
  v5 = [(AXMDataRegressionModel *)self x];
  v6 = [(AXMDataRegressionModel *)self y];
  int v7 = [(AXMDataRegressionModel *)self n];
  v8 = (double *)malloc_type_malloc(8 * v7, 0x791BAEE8uLL);
  v9 = (double *)malloc_type_malloc(8 * v7, 0xC1E095EDuLL);
  v10 = v9;
  if (v7 >= 1)
  {
    uint64_t v11 = 0x100000000;
    v12 = v8;
    v13 = v9;
    do
    {
      long double v14 = *v5++;
      double v15 = log(v14);
      if (v14 == 0.0) {
        double v15 = 0.0;
      }
      *v12++ = v15;
      long double v16 = *v6++;
      double v17 = log(v16);
      if (v16 == 0.0) {
        double v17 = 0.0;
      }
      *v13++ = v17;
      BOOL v18 = v7 <= v11 >> 32;
      v11 += 0x100000000;
    }
    while (!v18);
  }
  double v19 = covariance(v8, v10, v7);
  double v20 = variance(v8, v7);
  double v21 = variance(v10, v7);
  double v22 = mean(v8, v7);
  double v23 = mean(v10, v7);
  double v24 = sqrt(v21) * (v19 / sqrt(v20 * v21)) / sqrt(v20);
  *a3 = exp(v23 - v24 * v22);
  a3[1] = v24;
  free(v8);

  free(v10);
}

- (id)partialDerivatives
{
  v2 = [MEMORY[0x1E4F1CA48] array];
  [v2 addObject:&__block_literal_global_40_0];
  [v2 addObject:&__block_literal_global_42_0];
  double v3 = (void *)[v2 copy];

  return v3;
}

double __49__AXMDataRegressionModelPower_partialDerivatives__block_invoke(long double a1, uint64_t a2, uint64_t a3)
{
  return pow(a1, *(long double *)(a3 + 8));
}

long double __49__AXMDataRegressionModelPower_partialDerivatives__block_invoke_2(long double a1, uint64_t a2, uint64_t a3)
{
  double v4 = *(double *)a3;
  long double v5 = v4 * pow(a1, *(long double *)(a3 + 8));
  return log(a1) * v5;
}

- (id)modelFunctionStringForParameters:(double *)a3 significantFigures:(int)a4
{
  id v6 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  [v6 setUsesSignificantDigits:1];
  [v6 setMaximumSignificantDigits:a4];
  int v7 = [NSNumber numberWithDouble:*a3];
  v8 = [v6 stringFromNumber:v7];

  v9 = [NSNumber numberWithDouble:a3[1]];
  v10 = [v6 stringFromNumber:v9];

  uint64_t v11 = [NSString stringWithFormat:@"y = %@ * x^%@", v8, v10];

  return v11;
}

- (BOOL)dataSatisfiesInitialConditions
{
  double v3 = min([(AXMDataRegressionModel *)self x], [(AXMDataRegressionModel *)self n]);
  return min([(AXMDataRegressionModel *)self y], [(AXMDataRegressionModel *)self n]) >= 0.0 && v3 >= 0.0;
}

@end