@interface _HKTimePeriodChartPoint
- (HKGraphSeriesBlockCoordinateInfo)userInfo;
- (NSDate)xValue;
- (NSNumber)yValue;
- (NSString)description;
- (id)allYValues;
- (id)maxYValue;
- (id)minYValue;
- (id)xValueAsGenericType;
- (id)yValueForKey:(id)a3;
- (void)setUserInfo:(id)a3;
- (void)setXValue:(id)a3;
- (void)setYValue:(id)a3;
@end

@implementation _HKTimePeriodChartPoint

- (id)xValueAsGenericType
{
  return self->_xValue;
}

- (id)yValueForKey:(id)a3
{
  return self->_yValue;
}

- (id)minYValue
{
  return self->_yValue;
}

- (id)maxYValue
{
  return self->_yValue;
}

- (id)allYValues
{
  v4[1] = *MEMORY[0x1E4F143B8];
  if (self->_yValue)
  {
    v4[0] = self->_yValue;
    v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  }
  else
  {
    v2 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return v2;
}

- (NSString)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)_HKTimePeriodChartPoint;
  v4 = [(_HKTimePeriodChartPoint *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@ { %@, %@ }", v4, self->_xValue, self->_yValue];

  return (NSString *)v5;
}

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

- (HKGraphSeriesBlockCoordinateInfo)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_yValue, 0);
  objc_storeStrong((id *)&self->_xValue, 0);
}

@end