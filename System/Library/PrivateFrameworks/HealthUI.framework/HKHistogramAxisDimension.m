@interface HKHistogramAxisDimension
- (HKHistogramAxisDimensionDataSource)dataSource;
- (double)niceStepSizeLargerThan:(double)a3;
- (double)ticksPerStepSize:(double)a3;
- (id)endingLabelsFactorOverride;
- (id)formatterForLabelStepSize:(double)a3;
- (id)stringForLocation:(id)a3 formatterForStepSize:(id)a4;
- (void)setDataSource:(id)a3;
@end

@implementation HKHistogramAxisDimension

- (double)niceStepSizeLargerThan:(double)a3
{
  return 1.0;
}

- (double)ticksPerStepSize:(double)a3
{
  return 0.0;
}

- (id)formatterForLabelStepSize:(double)a3
{
  return 0;
}

- (id)endingLabelsFactorOverride
{
  return 0;
}

- (id)stringForLocation:(id)a3 formatterForStepSize:(id)a4
{
  id v5 = a3;
  v6 = [(HKHistogramAxisDimension *)self dataSource];
  v7 = [v6 stringForLocation:v5];

  return v7;
}

- (HKHistogramAxisDimensionDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (HKHistogramAxisDimensionDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (void).cxx_destruct
{
}

@end