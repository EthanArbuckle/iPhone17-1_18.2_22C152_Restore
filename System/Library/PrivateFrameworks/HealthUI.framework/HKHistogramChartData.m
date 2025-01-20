@interface HKHistogramChartData
- (HKHistogramChartData)initWithXValue:(double)a3 yValue:(double)a4;
- (double)xValue;
- (double)yValue;
@end

@implementation HKHistogramChartData

- (HKHistogramChartData)initWithXValue:(double)a3 yValue:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)HKHistogramChartData;
  result = [(HKHistogramChartData *)&v7 init];
  if (result)
  {
    result->_xValue = a3;
    result->_yValue = a4;
  }
  return result;
}

- (double)xValue
{
  return self->_xValue;
}

- (double)yValue
{
  return self->_yValue;
}

@end