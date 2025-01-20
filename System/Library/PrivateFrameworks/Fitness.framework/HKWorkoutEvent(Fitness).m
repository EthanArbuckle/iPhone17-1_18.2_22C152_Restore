@interface HKWorkoutEvent(Fitness)
- (BOOL)fi_isCustomSplitEvent;
- (BOOL)fi_isDistanceGoalCompleteEvent;
- (BOOL)fi_isSplitEvent;
- (double)fi_distanceGoalCompletionTime;
- (double)fi_splitActiveDuration;
- (double)fi_splitPaceInMetersPerSecond;
- (id)fi_splitDistance;
@end

@implementation HKWorkoutEvent(Fitness)

- (BOOL)fi_isCustomSplitEvent
{
  if ([a1 type] != 7) {
    return 0;
  }
  v2 = [a1 metadata];
  v3 = [v2 objectForKeyedSubscript:@"_HKPrivateWorkoutSegmentEventSubtype"];
  BOOL v4 = [v3 integerValue] == 3;

  return v4;
}

- (BOOL)fi_isDistanceGoalCompleteEvent
{
  if ([a1 type] != 7) {
    return 0;
  }
  v2 = [a1 metadata];
  v3 = [v2 objectForKeyedSubscript:@"_HKPrivateWorkoutSegmentEventSubtype"];
  BOOL v4 = [v3 integerValue] == 2;

  return v4;
}

- (BOOL)fi_isSplitEvent
{
  if ([a1 type] != 7) {
    return 0;
  }
  v2 = [a1 metadata];
  v3 = [v2 objectForKeyedSubscript:@"_HKPrivateWorkoutSegmentEventSubtype"];
  BOOL v4 = [v3 integerValue] == 1;

  return v4;
}

- (double)fi_distanceGoalCompletionTime
{
  v1 = [a1 metadata];
  v2 = [v1 objectForKey:@"_HKPrivateMetadataSplitActiveDurationQuantity"];
  v3 = [MEMORY[0x263F0A830] secondUnit];
  [v2 doubleValueForUnit:v3];
  double v5 = v4;

  return v5;
}

- (double)fi_splitActiveDuration
{
  v1 = [a1 metadata];
  v2 = [v1 objectForKeyedSubscript:@"_HKPrivateMetadataSplitActiveDurationQuantity"];
  v3 = [MEMORY[0x263F0A830] secondUnit];
  [v2 doubleValueForUnit:v3];
  double v5 = v4;

  return v5;
}

- (id)fi_splitDistance
{
  v1 = [a1 metadata];
  v2 = [v1 objectForKeyedSubscript:@"_HKPrivateMetadataSplitDistanceQuantity"];

  return v2;
}

- (double)fi_splitPaceInMetersPerSecond
{
  objc_msgSend(a1, "fi_splitActiveDuration");
  double v3 = v2;
  double v4 = 0.0;
  if (v2 > 2.22044605e-16)
  {
    double v5 = objc_msgSend(a1, "fi_splitDistance");
    v6 = [MEMORY[0x263F0A830] meterUnit];
    [v5 doubleValueForUnit:v6];
    double v4 = v7 / v3;
  }
  return v4;
}

@end