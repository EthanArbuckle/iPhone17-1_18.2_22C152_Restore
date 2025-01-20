@interface SAHLSetWorkoutState
- (id)_ad_transformedWorkoutRequest;
- (id)_ad_transformedWorkoutSuccessResponse;
@end

@implementation SAHLSetWorkoutState

- (id)_ad_transformedWorkoutSuccessResponse
{
  id v2 = objc_alloc_init((Class)SACommandSucceeded);
  return v2;
}

- (id)_ad_transformedWorkoutRequest
{
  id v2 = [(SAHLSetWorkoutState *)self targetWorkoutState];
  v3 = [v2 workoutStateValue];

  if ([v3 isEqualToString:SAHLWorkoutStateWorkoutStateValueActiveValue])
  {
    uint64_t v4 = 0;
  }
  else if ([v3 isEqualToString:SAHLWorkoutStateWorkoutStateValuePausedValue])
  {
    uint64_t v4 = 1;
  }
  else
  {
    [v3 isEqualToString:SAHLWorkoutStateWorkoutStateValueStoppedValue];
    uint64_t v4 = 2;
  }
  id v5 = [objc_alloc((Class)STWorkoutSetStateRequest) _initWithState:v4];

  return v5;
}

@end