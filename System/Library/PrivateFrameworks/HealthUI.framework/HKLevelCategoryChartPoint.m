@interface HKLevelCategoryChartPoint
- (HKGraphSeriesBlockCoordinateInfo)userInfo;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSNumber)yValue;
- (NSString)description;
- (id)allYValues;
- (id)maxYValue;
- (id)minYValue;
- (id)yValueForKey:(id)a3;
- (int64_t)pointStyle;
- (void)setEndDate:(id)a3;
- (void)setPointStyle:(int64_t)a3;
- (void)setStartDate:(id)a3;
- (void)setUserInfo:(id)a3;
- (void)setYValue:(id)a3;
@end

@implementation HKLevelCategoryChartPoint

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
  v7.super_class = (Class)HKLevelCategoryChartPoint;
  v4 = [(HKLevelCategoryChartPoint *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@ { %@->%@ %@ %ld}", v4, self->_startDate, self->_endDate, self->_yValue, self->_pointStyle];

  return (NSString *)v5;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
}

- (NSNumber)yValue
{
  return self->_yValue;
}

- (void)setYValue:(id)a3
{
}

- (int64_t)pointStyle
{
  return self->_pointStyle;
}

- (void)setPointStyle:(int64_t)a3
{
  self->_pointStyle = a3;
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
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end