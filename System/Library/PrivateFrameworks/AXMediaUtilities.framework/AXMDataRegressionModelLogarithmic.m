@interface AXMDataRegressionModelLogarithmic
- (id)modelDescription;
- (id)modelFunction;
- (id)modelFunctionStringForParameters:(double *)a3 significantFigures:(int)a4;
- (id)partialDerivatives;
- (int)modelParameterCount;
- (void)getInitialParams:(double *)a3;
@end

@implementation AXMDataRegressionModelLogarithmic

- (id)modelDescription
{
  v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
  v3 = [v2 localizedStringForKey:@"chart.model.logarithmic" value:&stru_1F0E72D10 table:@"Accessibility"];

  return v3;
}

- (id)modelFunction
{
  return &__block_literal_global_35;
}

long double __50__AXMDataRegressionModelLogarithmic_modelFunction__block_invoke(long double a1, uint64_t a2, double *a3)
{
  double v3 = *a3;
  double v4 = a3[1];
  return v4 + v3 * log(a1);
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
  [v2 addObject:&__block_literal_global_40_3];
  [v2 addObject:&__block_literal_global_42_3];
  double v3 = (void *)[v2 copy];

  return v3;
}

double __55__AXMDataRegressionModelLogarithmic_partialDerivatives__block_invoke_2()
{
  return 1.0;
}

- (id)modelFunctionStringForParameters:(double *)a3 significantFigures:(int)a4
{
  id v6 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  [v6 setUsesSignificantDigits:1];
  [v6 setMaximumSignificantDigits:a4];
  v7 = [NSNumber numberWithDouble:*a3];
  v8 = [v6 stringFromNumber:v7];

  v9 = [NSNumber numberWithDouble:a3[1]];
  v10 = [v6 stringFromNumber:v9];

  v11 = [NSString stringWithFormat:@"y = %@ * ln(x) + %@", v8, v10];

  return v11;
}

@end