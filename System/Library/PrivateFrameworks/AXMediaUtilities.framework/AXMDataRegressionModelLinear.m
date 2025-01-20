@interface AXMDataRegressionModelLinear
- (double)fitDataWithModelParams:(double *)a3 finalParams:(double *)a4;
- (double)rSquared;
- (id)modelDescription;
- (id)modelFunction;
- (id)modelFunctionStringForParameters:(double *)a3 significantFigures:(int)a4;
- (id)partialDerivatives;
- (int)modelParameterCount;
- (void)getInitialParams:(double *)a3;
@end

@implementation AXMDataRegressionModelLinear

- (id)modelDescription
{
  v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
  v3 = [v2 localizedStringForKey:@"chart.model.linear" value:&stru_1F0E72D10 table:@"Accessibility"];

  return v3;
}

- (double)fitDataWithModelParams:(double *)a3 finalParams:(double *)a4
{
  v6 = [(AXMDataRegressionModel *)self x];
  v7 = [(AXMDataRegressionModel *)self y];
  int v8 = [(AXMDataRegressionModel *)self n];
  double v9 = covariance(v6, v7, v8);
  double v10 = variance(v6, v8);
  double v11 = variance(v7, v8);
  double v12 = mean(v6, v8);
  double v13 = mean(v7, v8);
  double v14 = sqrt(v11) * (v9 / sqrt(v10 * v11)) / sqrt(v10);
  *a4 = v14;
  a4[1] = v13 - v14 * v12;
  v15 = (double *)malloc_type_malloc(8 * v8, 0x8D65132DuLL);
  [(AXMDataRegressionModel *)self getResidualsVector:a4 result:v15];
  if (v8 < 1)
  {
    double v21 = 0.0;
  }
  else
  {
    double v16 = 0.0;
    uint64_t v17 = 0x100000000;
    v18 = v15;
    do
    {
      double v19 = *v18++;
      double v16 = v16 + v19 * v19;
      BOOL v20 = v8 <= v17 >> 32;
      v17 += 0x100000000;
    }
    while (!v20);
    double v21 = v16 * 0.5;
  }
  self->super._error = v21;
  [(AXMDataRegressionModel *)self computeScore];
  self->_rSquared = rsquared(v6, v7, v8);
  memcpy(self->super._bestFitParameters, a4, 8 * [(AXMDataRegressionModelLinear *)self modelParameterCount]);
  free(v15);
  return v21;
}

- (id)modelFunction
{
  return &__block_literal_global_30;
}

double __45__AXMDataRegressionModelLinear_modelFunction__block_invoke(double a1, uint64_t a2, double *a3)
{
  return a3[1] + *a3 * a1;
}

- (int)modelParameterCount
{
  return 2;
}

- (void)getInitialParams:(double *)a3
{
  *(_OWORD *)a3 = xmmword_1B58ACFA0;
}

- (id)partialDerivatives
{
  v2 = [MEMORY[0x1E4F1CA48] array];
  [v2 addObject:&__block_literal_global_40_2];
  [v2 addObject:&__block_literal_global_42_2];
  v3 = (void *)[v2 copy];

  return v3;
}

double __50__AXMDataRegressionModelLinear_partialDerivatives__block_invoke_2()
{
  return 1.0;
}

- (id)modelFunctionStringForParameters:(double *)a3 significantFigures:(int)a4
{
  id v6 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  [v6 setUsesSignificantDigits:1];
  [v6 setMaximumSignificantDigits:a4];
  v7 = [NSNumber numberWithDouble:*a3];
  int v8 = [v6 stringFromNumber:v7];

  double v9 = [NSNumber numberWithDouble:a3[1]];
  double v10 = [v6 stringFromNumber:v9];

  double v11 = [NSString stringWithFormat:@"y = %@x + %@", v8, v10];

  return v11;
}

- (double)rSquared
{
  return self->_rSquared;
}

@end