@interface HKJulianIndexedSevenDayQuantityChartPoint
- (HKGraphSeriesBlockCoordinateInfo)userInfo;
- (HKJulianIndexedSevenDayQuantityChartPoint)initWithStartDate:(id)a3 endDate:(id)a4 displayType:(id)a5 unit:(id)a6 quantity:(id)a7;
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

@implementation HKJulianIndexedSevenDayQuantityChartPoint

- (HKJulianIndexedSevenDayQuantityChartPoint)initWithStartDate:(id)a3 endDate:(id)a4 displayType:(id)a5 unit:(id)a6 quantity:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v26.receiver = self;
  v26.super_class = (Class)HKJulianIndexedSevenDayQuantityChartPoint;
  v18 = [(HKJulianIndexedSevenDayQuantityChartPoint *)&v26 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_xStart, a3);
    objc_storeStrong((id *)&v19->_xEnd, a4);
    v20 = NSNumber;
    [v17 doubleValueForUnit:v16];
    v21 = objc_msgSend(v20, "numberWithDouble:");
    v22 = [v15 presentation];
    uint64_t v23 = [v22 adjustedValueForDaemonValue:v21];
    yValue = v19->_yValue;
    v19->_yValue = (NSNumber *)v23;
  }
  return v19;
}

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
  v7.super_class = (Class)HKJulianIndexedSevenDayQuantityChartPoint;
  v4 = [(HKJulianIndexedSevenDayQuantityChartPoint *)&v7 description];
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