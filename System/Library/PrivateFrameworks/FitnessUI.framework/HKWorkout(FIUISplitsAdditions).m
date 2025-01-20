@interface HKWorkout(FIUISplitsAdditions)
- (id)fiui_workoutCustomSplits;
- (id)fiui_workoutSplitsForUserPreferredDistanceUnit:()FIUISplitsAdditions;
@end

@implementation HKWorkout(FIUISplitsAdditions)

- (id)fiui_workoutSplitsForUserPreferredDistanceUnit:()FIUISplitsAdditions
{
  [a3 _isMetricDistance];
  v4 = [a1 workoutEvents];
  v5 = FISplitsForMeasuringSystemIdentifier();

  v6 = objc_msgSend(v5, "fi_flatMapUsingBlock:", &__block_literal_global_12);

  return v6;
}

- (id)fiui_workoutCustomSplits
{
  v1 = [a1 workoutEvents];
  v2 = FICustomSplits();

  v3 = objc_msgSend(v2, "fi_flatMapUsingBlock:", &__block_literal_global_557);

  return v3;
}

@end