@interface NLActivityRichComplicationChartPoint
- (NSDate)xValue;
- (NSNumber)yValue;
- (void)setXValue:(id)a3;
- (void)setYValue:(id)a3;
@end

@implementation NLActivityRichComplicationChartPoint

- (NSDate)xValue
{
  return self->_xValue;
}

- (void)setXValue:(id)a3
{
}

- (NSNumber)yValue
{
  return self->_yValue;
}

- (void)setYValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_yValue, 0);

  objc_storeStrong((id *)&self->_xValue, 0);
}

@end