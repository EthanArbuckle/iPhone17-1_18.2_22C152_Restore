@interface HKSleepDurationChartPoint
+ (id)chartPointsForSummaries:(id)a3 context:(id)a4;
- (BOOL)highlighted;
- (HKSleepChartPointUserInfo)userInfo;
- (NSDate)xValue;
- (NSNumber)goalValue;
- (double)asleepValue;
- (double)inBedValue;
- (id)allYValues;
- (id)maxXValueAsGenericType;
- (id)maxYValue;
- (id)minXValueAsGenericType;
- (id)minYValue;
- (id)xValueAsGenericType;
- (id)yValue;
- (id)yValueForKey:(id)a3;
- (void)setAsleepValue:(double)a3;
- (void)setGoalValue:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setInBedValue:(double)a3;
- (void)setUserInfo:(id)a3;
- (void)setXValue:(id)a3;
@end

@implementation HKSleepDurationChartPoint

- (id)xValueAsGenericType
{
  return self->_xValue;
}

- (id)minXValueAsGenericType
{
  return self->_xValue;
}

- (id)maxXValueAsGenericType
{
  return self->_xValue;
}

- (id)minYValue
{
  return &unk_1F3C21CE8;
}

- (id)maxYValue
{
  if (self->_asleepValue >= self->_inBedValue) {
    double asleepValue = self->_asleepValue;
  }
  else {
    double asleepValue = self->_inBedValue;
  }
  goalValue = self->_goalValue;
  v4 = NSNumber;
  if (goalValue)
  {
    [(NSNumber *)goalValue doubleValue];
    if (asleepValue < v5) {
      double asleepValue = v5;
    }
  }
  v6 = [v4 numberWithDouble:asleepValue];
  return v6;
}

- (id)yValue
{
  return 0;
}

- (id)yValueForKey:(id)a3
{
  return 0;
}

- (id)allYValues
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v3 = [NSNumber numberWithDouble:self->_asleepValue];
  v7[0] = v3;
  v4 = [NSNumber numberWithDouble:self->_inBedValue];
  v7[1] = v4;
  double v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];

  return v5;
}

+ (id)chartPointsForSummaries:(id)a3 context:(id)a4
{
  id v5 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61__HKSleepDurationChartPoint_chartPointsForSummaries_context___block_invoke;
  v9[3] = &unk_1E6D540D0;
  id v10 = v5;
  id v6 = v5;
  v7 = objc_msgSend(a3, "hk_map:", v9);

  return v7;
}

HKSleepDurationChartPoint *__61__HKSleepDurationChartPoint_chartPointsForSummaries_context___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = objc_alloc_init(HKSleepDurationChartPoint);
  id v5 = +[HKSleepUtilities sleepDaySummaryStandardXValue:v3];
  [(HKSleepDurationChartPoint *)v4 setXValue:v5];

  [v3 sleepDuration];
  -[HKSleepDurationChartPoint setAsleepValue:](v4, "setAsleepValue:");
  [v3 inBedDuration];
  -[HKSleepDurationChartPoint setInBedValue:](v4, "setInBedValue:");
  id v6 = objc_msgSend(v3, "hk_sleepDurationGoalValue");
  [(HKSleepDurationChartPoint *)v4 setGoalValue:v6];

  v7 = -[HKSleepChartPointUserInfo initWithSeriesType:sleepDaySummary:]([HKSleepChartPointUserInfo alloc], "initWithSeriesType:sleepDaySummary:", [*(id *)(a1 + 32) chartType], v3);
  [(HKSleepDurationChartPoint *)v4 setUserInfo:v7];

  return v4;
}

- (double)inBedValue
{
  return self->_inBedValue;
}

- (void)setInBedValue:(double)a3
{
  self->_inBedValue = a3;
}

- (double)asleepValue
{
  return self->_asleepValue;
}

- (void)setAsleepValue:(double)a3
{
  self->_double asleepValue = a3;
}

- (NSDate)xValue
{
  return self->_xValue;
}

- (void)setXValue:(id)a3
{
}

- (NSNumber)goalValue
{
  return self->_goalValue;
}

- (void)setGoalValue:(id)a3
{
}

- (BOOL)highlighted
{
  return self->_highlighted;
}

- (void)setHighlighted:(BOOL)a3
{
  self->_highlighted = a3;
}

- (HKSleepChartPointUserInfo)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_goalValue, 0);
  objc_storeStrong((id *)&self->_xValue, 0);
}

@end