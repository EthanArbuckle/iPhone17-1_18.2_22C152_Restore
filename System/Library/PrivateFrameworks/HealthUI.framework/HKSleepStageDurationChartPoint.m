@interface HKSleepStageDurationChartPoint
+ (id)chartPointsForSummaries:(id)a3 context:(id)a4;
- (double)asleepCoreValue;
- (double)asleepDeepValue;
- (double)asleepRemValue;
- (double)awakeValue;
- (double)maxDurationValue;
- (double)totalDurationValue;
- (id)allYValues;
- (id)maxYValue;
- (void)setAsleepCoreValue:(double)a3;
- (void)setAsleepDeepValue:(double)a3;
- (void)setAsleepRemValue:(double)a3;
- (void)setAwakeValue:(double)a3;
- (void)setMaxDurationValue:(double)a3;
- (void)setTotalDurationValue:(double)a3;
@end

@implementation HKSleepStageDurationChartPoint

- (id)maxYValue
{
  return (id)[NSNumber numberWithDouble:self->_maxDurationValue];
}

- (id)allYValues
{
  v9[4] = *MEMORY[0x1E4F143B8];
  v3 = [NSNumber numberWithDouble:self->_awakeValue];
  v9[0] = v3;
  v4 = [NSNumber numberWithDouble:self->_asleepRemValue];
  v9[1] = v4;
  v5 = [NSNumber numberWithDouble:self->_asleepDeepValue];
  v9[2] = v5;
  v6 = [NSNumber numberWithDouble:self->_asleepCoreValue];
  v9[3] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:4];

  return v7;
}

+ (id)chartPointsForSummaries:(id)a3 context:(id)a4
{
  id v5 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __66__HKSleepStageDurationChartPoint_chartPointsForSummaries_context___block_invoke;
  v9[3] = &unk_1E6D540D0;
  id v10 = v5;
  id v6 = v5;
  v7 = objc_msgSend(a3, "hk_map:", v9);

  return v7;
}

HKSleepStageDurationChartPoint *__66__HKSleepStageDurationChartPoint_chartPointsForSummaries_context___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = objc_alloc_init(HKSleepStageDurationChartPoint);
  id v5 = +[HKSleepUtilities sleepDaySummaryStandardXValue:v3];
  [(HKSleepDurationChartPoint *)v4 setXValue:v5];

  [v3 awakeDuration];
  -[HKSleepStageDurationChartPoint setAwakeValue:](v4, "setAwakeValue:");
  [v3 remSleepDuration];
  -[HKSleepStageDurationChartPoint setAsleepRemValue:](v4, "setAsleepRemValue:");
  [v3 deepSleepDuration];
  -[HKSleepStageDurationChartPoint setAsleepDeepValue:](v4, "setAsleepDeepValue:");
  [v3 coreSleepDuration];
  -[HKSleepStageDurationChartPoint setAsleepCoreValue:](v4, "setAsleepCoreValue:");
  [(HKSleepStageDurationChartPoint *)v4 awakeValue];
  double v7 = v6;
  [(HKSleepStageDurationChartPoint *)v4 asleepRemValue];
  double v9 = v7 + v8;
  [(HKSleepStageDurationChartPoint *)v4 asleepDeepValue];
  double v11 = v9 + v10;
  [(HKSleepStageDurationChartPoint *)v4 asleepCoreValue];
  [(HKSleepStageDurationChartPoint *)v4 setTotalDurationValue:v11 + v12];
  if ([*(id *)(a1 + 32) timeScope] == 6)
  {
    v13 = [(HKSleepStageDurationChartPoint *)v4 allYValues];
    v14 = [v13 valueForKeyPath:@"@max.doubleValue"];
    [v14 doubleValue];
    -[HKSleepStageDurationChartPoint setMaxDurationValue:](v4, "setMaxDurationValue:");
  }
  else
  {
    [(HKSleepStageDurationChartPoint *)v4 totalDurationValue];
    -[HKSleepStageDurationChartPoint setMaxDurationValue:](v4, "setMaxDurationValue:");
  }
  v15 = -[HKSleepChartPointUserInfo initWithSeriesType:sleepDaySummary:]([HKSleepChartPointUserInfo alloc], "initWithSeriesType:sleepDaySummary:", [*(id *)(a1 + 32) chartType], v3);
  [(HKSleepChartPointUserInfo *)v15 setCurrentValueViewOptions:[(HKSleepChartPointUserInfo *)v15 currentValueViewOptions] | 0x40];
  [(HKSleepDurationChartPoint *)v4 setUserInfo:v15];

  return v4;
}

- (double)awakeValue
{
  return self->_awakeValue;
}

- (void)setAwakeValue:(double)a3
{
  self->_awakeValue = a3;
}

- (double)asleepRemValue
{
  return self->_asleepRemValue;
}

- (void)setAsleepRemValue:(double)a3
{
  self->_asleepRemValue = a3;
}

- (double)asleepCoreValue
{
  return self->_asleepCoreValue;
}

- (void)setAsleepCoreValue:(double)a3
{
  self->_asleepCoreValue = a3;
}

- (double)asleepDeepValue
{
  return self->_asleepDeepValue;
}

- (void)setAsleepDeepValue:(double)a3
{
  self->_asleepDeepValue = a3;
}

- (double)totalDurationValue
{
  return self->_totalDurationValue;
}

- (void)setTotalDurationValue:(double)a3
{
  self->_totalDurationValue = a3;
}

- (double)maxDurationValue
{
  return self->_maxDurationValue;
}

- (void)setMaxDurationValue:(double)a3
{
  self->_maxDurationValue = a3;
}

@end