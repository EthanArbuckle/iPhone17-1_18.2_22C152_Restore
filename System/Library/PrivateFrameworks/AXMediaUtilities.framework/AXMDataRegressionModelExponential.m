@interface AXMDataRegressionModelExponential
- (BOOL)dataSatisfiesInitialConditions;
- (id)modelDescription;
- (id)modelFunction;
- (id)modelFunctionStringForParameters:(double *)a3 significantFigures:(int)a4;
- (id)partialDerivatives;
- (int)modelParameterCount;
- (void)getInitialParams:(double *)a3;
@end

@implementation AXMDataRegressionModelExponential

- (id)modelDescription
{
  v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
  v3 = [v2 localizedStringForKey:@"chart.model.exponential" value:&stru_1F0E72D10 table:@"Accessibility"];

  return v3;
}

- (id)modelFunction
{
  return &__block_literal_global_2;
}

long double __50__AXMDataRegressionModelExponential_modelFunction__block_invoke(double a1, uint64_t a2, double *a3)
{
  double v3 = *a3;
  return v3 * exp(a3[1] * a1);
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
  v8 = (double *)malloc_type_malloc(8 * v7, 0xF467C1A6uLL);
  v9 = v8;
  if (v7 >= 1)
  {
    uint64_t v10 = 0x100000000;
    v11 = v8;
    do
    {
      long double v12 = *v6++;
      double v13 = log(v12);
      if (v12 == 0.0) {
        double v13 = 0.0;
      }
      *v11++ = v13;
      BOOL v14 = v7 <= v10 >> 32;
      v10 += 0x100000000;
    }
    while (!v14);
  }
  double v15 = covariance(v5, v9, v7);
  double v16 = variance(v5, v7);
  double v17 = variance(v9, v7);
  double v18 = mean(v5, v7);
  double v19 = mean(v9, v7);
  double v20 = sqrt(v17) * (v15 / sqrt(v16 * v17)) / sqrt(v16);
  *a3 = exp(v19 - v20 * v18);
  a3[1] = v20;

  free(v9);
}

- (id)partialDerivatives
{
  v2 = [MEMORY[0x1E4F1CA48] array];
  [v2 addObject:&__block_literal_global_40];
  [v2 addObject:&__block_literal_global_42];
  double v3 = (void *)[v2 copy];

  return v3;
}

double __55__AXMDataRegressionModelExponential_partialDerivatives__block_invoke(double a1, uint64_t a2, uint64_t a3)
{
  return exp(*(double *)(a3 + 8) * a1);
}

long double __55__AXMDataRegressionModelExponential_partialDerivatives__block_invoke_2(double a1, uint64_t a2, double *a3)
{
  double v3 = *a3 * a1;
  return v3 * exp(a3[1] * a1);
}

- (id)modelFunctionStringForParameters:(double *)a3 significantFigures:(int)a4
{
  id v6 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  [v6 setUsesSignificantDigits:1];
  [v6 setMaximumSignificantDigits:a4];
  int v7 = [NSNumber numberWithDouble:*a3];
  v8 = [v6 stringFromNumber:v7];

  v9 = [NSNumber numberWithDouble:a3[1]];
  uint64_t v10 = [v6 stringFromNumber:v9];

  v11 = [NSString stringWithFormat:@"y = %@ * e^(%@x)", v8, v10];

  return v11;
}

- (BOOL)dataSatisfiesInitialConditions
{
  return min([(AXMDataRegressionModel *)self y], [(AXMDataRegressionModel *)self n]) > 0.0;
}

@end