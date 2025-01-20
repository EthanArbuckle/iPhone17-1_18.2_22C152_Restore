@interface HKHandwashingEventChartPoint
- (BOOL)meetsGoal;
- (HKGraphSeriesBlockCoordinateInfo)userInfo;
- (HKHandwashingEventChartPoint)initWithStartDate:(id)a3 endDate:(id)a4;
- (NSDate)endDate;
- (NSDate)midDate;
- (NSDate)startDate;
- (NSNumber)averageDuration;
- (id)allYValues;
- (id)yValueForKey:(id)a3;
- (void)setAverageDuration:(id)a3;
- (void)setEndDate:(id)a3;
- (void)setMeetsGoal:(BOOL)a3;
- (void)setMidDate:(id)a3;
- (void)setStartDate:(id)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation HKHandwashingEventChartPoint

- (HKHandwashingEventChartPoint)initWithStartDate:(id)a3 endDate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HKHandwashingEventChartPoint;
  v9 = [(HKHandwashingEventChartPoint *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_startDate, a3);
    objc_storeStrong((id *)&v10->_endDate, a4);
    uint64_t v11 = HKUIMidDate(v7, v8);
    midDate = v10->_midDate;
    v10->_midDate = (NSDate *)v11;
  }
  return v10;
}

- (id)yValueForKey:(id)a3
{
  return 0;
}

- (id)allYValues
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [(HKHandwashingEventChartPoint *)self yValue];
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
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

- (NSNumber)averageDuration
{
  return self->_averageDuration;
}

- (void)setAverageDuration:(id)a3
{
}

- (BOOL)meetsGoal
{
  return self->_meetsGoal;
}

- (void)setMeetsGoal:(BOOL)a3
{
  self->_meetsGoal = a3;
}

- (NSDate)midDate
{
  return self->_midDate;
}

- (void)setMidDate:(id)a3
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
  objc_storeStrong((id *)&self->_midDate, 0);
  objc_storeStrong((id *)&self->_averageDuration, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end