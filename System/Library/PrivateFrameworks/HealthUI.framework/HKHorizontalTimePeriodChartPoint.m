@interface HKHorizontalTimePeriodChartPoint
- (HKGraphSeriesBlockCoordinateInfo)userInfo;
- (NSDate)xEnd;
- (NSDate)xStart;
- (NSNumber)yValue;
- (NSString)description;
- (id)allYValues;
- (id)maxXValueAsGenericType;
- (id)maxYValue;
- (id)minXValueAsGenericType;
- (id)minYValue;
- (id)xValueAsGenericType;
- (id)yValueForKey:(id)a3;
- (void)setUserInfo:(id)a3;
- (void)setXEnd:(id)a3;
- (void)setXStart:(id)a3;
- (void)setYValue:(id)a3;
@end

@implementation HKHorizontalTimePeriodChartPoint

- (id)xValueAsGenericType
{
  return self->_xStart;
}

- (id)minXValueAsGenericType
{
  return self->_xStart;
}

- (id)maxXValueAsGenericType
{
  return self->_xEnd;
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
  v7.super_class = (Class)HKHorizontalTimePeriodChartPoint;
  v4 = [(HKHorizontalTimePeriodChartPoint *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@ { (%@ - %@), %@ }", v4, self->_xStart, self->_xEnd, self->_yValue];

  return (NSString *)v5;
}

- (NSDate)xStart
{
  return self->_xStart;
}

- (void)setXStart:(id)a3
{
}

- (NSDate)xEnd
{
  return self->_xEnd;
}

- (void)setXEnd:(id)a3
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
  objc_storeStrong((id *)&self->_xEnd, 0);
  objc_storeStrong((id *)&self->_xStart, 0);
}

@end