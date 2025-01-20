@interface HKInteractiveChartActivityData
- (BOOL)activityPaused;
- (BOOL)activityValueGoalMet;
- (BOOL)hasActivityGoal;
- (HKActivitySummary)activitySummaryData;
- (NSString)description;
- (int64_t)activityValue;
- (void)setActivitySummaryData:(id)a3;
- (void)setActivityValue:(int64_t)a3;
@end

@implementation HKInteractiveChartActivityData

- (BOOL)hasActivityGoal
{
  switch([(HKInteractiveChartActivityData *)self activityValue])
  {
    case 0:
    case 4:
      v3 = [(HKInteractiveChartActivityData *)self activitySummaryData];
      char v4 = [v3 _hasEnergyBurnedGoal];
      goto LABEL_6;
    case 1:
    case 5:
      v3 = [(HKInteractiveChartActivityData *)self activitySummaryData];
      char v4 = [v3 _hasAppleMoveMinutesGoal];
      goto LABEL_6;
    case 2:
    case 6:
      v3 = [(HKInteractiveChartActivityData *)self activitySummaryData];
      char v4 = [v3 _hasExerciseGoal];
      goto LABEL_6;
    case 3:
    case 7:
      v3 = [(HKInteractiveChartActivityData *)self activitySummaryData];
      char v4 = [v3 _hasStandHoursGoal];
LABEL_6:
      BOOL v5 = v4;

      break;
    default:
      BOOL v5 = 0;
      break;
  }
  return v5;
}

- (BOOL)activityValueGoalMet
{
  char v4 = [(HKInteractiveChartActivityData *)self activitySummaryData];
  int v5 = [v4 _useHourlyGoalComparison];

  int64_t v6 = [(HKInteractiveChartActivityData *)self activityValue];
  if (!v5)
  {
    switch(v6)
    {
      case 0:
      case 4:
        v7 = [(HKInteractiveChartActivityData *)self activitySummaryData];
        [v7 _activeEnergyCompletionPercentage];
        goto LABEL_10;
      case 1:
      case 5:
        v7 = [(HKInteractiveChartActivityData *)self activitySummaryData];
        [v7 _moveMinutesCompletionPercentage];
        goto LABEL_10;
      case 2:
      case 6:
        v7 = [(HKInteractiveChartActivityData *)self activitySummaryData];
        [v7 _exerciseTimeCompletionPercentage];
        goto LABEL_10;
      case 3:
      case 7:
        v7 = [(HKInteractiveChartActivityData *)self activitySummaryData];
        [v7 _standHoursCompletionPercentage];
LABEL_10:
        BOOL v2 = v11 >= 1.0;
        goto LABEL_11;
      default:
        return v2;
    }
  }
  if ((v6 | 4) == 7)
  {
    v7 = [(HKInteractiveChartActivityData *)self activitySummaryData];
    v8 = [v7 appleStandHours];
    v9 = [MEMORY[0x1E4F2B618] countUnit];
    [v8 doubleValueForUnit:v9];
    BOOL v2 = v10 > 0.0;

LABEL_11:
  }
  else
  {
    return 1;
  }
  return v2;
}

- (BOOL)activityPaused
{
  BOOL v2 = [(HKInteractiveChartActivityData *)self activitySummaryData];
  char v3 = [v2 isPaused];

  return v3;
}

- (NSString)description
{
  BOOL v2 = [(HKInteractiveChartActivityData *)self activitySummaryData];
  char v3 = [v2 description];

  return (NSString *)v3;
}

- (HKActivitySummary)activitySummaryData
{
  return self->_activitySummaryData;
}

- (void)setActivitySummaryData:(id)a3
{
}

- (int64_t)activityValue
{
  return self->_activityValue;
}

- (void)setActivityValue:(int64_t)a3
{
  self->_activityValue = a3;
}

- (void).cxx_destruct
{
}

@end