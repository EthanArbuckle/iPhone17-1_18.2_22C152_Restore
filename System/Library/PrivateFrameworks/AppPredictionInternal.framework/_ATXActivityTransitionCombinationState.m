@interface _ATXActivityTransitionCombinationState
- (BOOL)hasSameTopActivityAndConfidenceAsOther:(id)a3;
- (_ATXActivityTransitionCombinationState)init;
- (double)appLaunchConfidence;
- (double)computedModeConfidence;
- (double)heuristicConfidence;
- (double)scaledAppLaunchConfidence;
- (double)scaledComputedModeConfidence;
- (double)scaledHeuristicConfidence;
- (double)scaledTimeBasedConfidence;
- (double)timeBasedConfidence;
- (double)timestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)endTransitionWithTimestamp:(double)a3;
- (id)newStateFromTransition:(id)a3;
- (id)startTransition;
- (id)topActivityWithConfidence;
- (unint64_t)appLaunchActivity;
- (unint64_t)computedModeActivity;
- (unint64_t)heuristicActivity;
- (unint64_t)timeBasedActivity;
- (void)setAppLaunchActivity:(unint64_t)a3;
- (void)setAppLaunchConfidence:(double)a3;
- (void)setComputedModeActivity:(unint64_t)a3;
- (void)setComputedModeConfidence:(double)a3;
- (void)setHeuristicActivity:(unint64_t)a3;
- (void)setHeuristicConfidence:(double)a3;
- (void)setTimeBasedActivity:(unint64_t)a3;
- (void)setTimeBasedConfidence:(double)a3;
- (void)setTimestamp:(double)a3;
@end

@implementation _ATXActivityTransitionCombinationState

- (_ATXActivityTransitionCombinationState)init
{
  v3.receiver = self;
  v3.super_class = (Class)_ATXActivityTransitionCombinationState;
  result = [(_ATXActivityTransitionCombinationState *)&v3 init];
  if (result)
  {
    result->_timeBasedActivity = 14;
    result->_timeBasedConfidence = 0.0;
    result->_appLaunchActivity = 14;
    result->_appLaunchConfidence = 0.0;
    result->_heuristicActivity = 14;
    result->_heuristicConfidence = 0.0;
    result->_computedModeConfidence = 0.0;
    result->_timestamp = 0.0;
    result->_computedModeActivity = 14;
  }
  return result;
}

- (id)newStateFromTransition:(id)a3
{
  id v4 = a3;
  v5 = (void *)[(_ATXActivityTransitionCombinationState *)self copy];
  if ([v4 isEntryEvent]) {
    uint64_t v6 = [v4 inferredActivityType];
  }
  else {
    uint64_t v6 = 14;
  }
  double v7 = 0.0;
  if ([v4 isEntryEvent])
  {
    [v4 confidence];
    double v7 = v8;
  }
  v9 = [v4 source];
  int v10 = [v9 isEqualToString:@"timeBasedInferredActivity"];

  if (v10)
  {
    [v5 setTimeBasedActivity:v6];
    [v5 setTimeBasedConfidence:v7];
  }
  else
  {
    v11 = [v4 source];
    int v12 = [v11 isEqualToString:@"appLaunchInferredActivity"];

    if (v12)
    {
      [v5 setAppLaunchActivity:v6];
      [v5 setAppLaunchConfidence:v7];
    }
    else
    {
      v13 = [v4 source];
      int v14 = [v13 isEqualToString:@"heuristicInferredActivity"];

      if (v14)
      {
        [v5 setHeuristicActivity:v6];
        [v5 setHeuristicConfidence:v7];
      }
      else
      {
        v15 = [v4 source];
        int v16 = [v15 isEqualToString:@"computedModeActivity"];

        if (v16)
        {
          [v5 setComputedModeActivity:v6];
          [v5 setComputedModeConfidence:v7];
        }
        else
        {
          v17 = __atxlog_handle_modes();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
            [(_ATXActivityTransitionCombinationState *)(uint64_t)self newStateFromTransition:v17];
          }
        }
      }
    }
  }
  [v4 transitionTime];
  objc_msgSend(v5, "setTimestamp:");

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[_ATXActivityTransitionCombinationState allocWithZone:a3] init];
  [(_ATXActivityTransitionCombinationState *)v4 setTimeBasedActivity:[(_ATXActivityTransitionCombinationState *)self timeBasedActivity]];
  [(_ATXActivityTransitionCombinationState *)self timeBasedConfidence];
  -[_ATXActivityTransitionCombinationState setTimeBasedConfidence:](v4, "setTimeBasedConfidence:");
  [(_ATXActivityTransitionCombinationState *)v4 setAppLaunchActivity:[(_ATXActivityTransitionCombinationState *)self appLaunchActivity]];
  [(_ATXActivityTransitionCombinationState *)self appLaunchConfidence];
  -[_ATXActivityTransitionCombinationState setAppLaunchConfidence:](v4, "setAppLaunchConfidence:");
  [(_ATXActivityTransitionCombinationState *)v4 setHeuristicActivity:[(_ATXActivityTransitionCombinationState *)self heuristicActivity]];
  [(_ATXActivityTransitionCombinationState *)self heuristicConfidence];
  -[_ATXActivityTransitionCombinationState setHeuristicConfidence:](v4, "setHeuristicConfidence:");
  [(_ATXActivityTransitionCombinationState *)v4 setComputedModeActivity:[(_ATXActivityTransitionCombinationState *)self computedModeActivity]];
  [(_ATXActivityTransitionCombinationState *)self computedModeConfidence];
  -[_ATXActivityTransitionCombinationState setComputedModeConfidence:](v4, "setComputedModeConfidence:");
  [(_ATXActivityTransitionCombinationState *)self timestamp];
  -[_ATXActivityTransitionCombinationState setTimestamp:](v4, "setTimestamp:");
  return v4;
}

- (double)scaledTimeBasedConfidence
{
  [(_ATXActivityTransitionCombinationState *)self timeBasedConfidence];
  return v2 * 1.0 / 85.0;
}

- (double)scaledAppLaunchConfidence
{
  [(_ATXActivityTransitionCombinationState *)self appLaunchConfidence];
  return v2 * 4.0 / 85.0;
}

- (double)scaledHeuristicConfidence
{
  [(_ATXActivityTransitionCombinationState *)self heuristicConfidence];
  return v2 * 16.0 / 85.0;
}

- (double)scaledComputedModeConfidence
{
  [(_ATXActivityTransitionCombinationState *)self computedModeConfidence];
  return v2 * 64.0 / 85.0;
}

- (id)topActivityWithConfidence
{
  v64[4] = *MEMORY[0x1E4F143B8];
  objc_super v3 = (void *)MEMORY[0x1E4F93BB8];
  v53 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[_ATXActivityTransitionCombinationState timeBasedActivity](self, "timeBasedActivity"));
  id v4 = NSNumber;
  [(_ATXActivityTransitionCombinationState *)self scaledTimeBasedConfidence];
  v52 = objc_msgSend(v4, "numberWithDouble:");
  v51 = [v3 tupleWithFirst:v53 second:v52];
  v64[0] = v51;
  v5 = (void *)MEMORY[0x1E4F93BB8];
  v50 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[_ATXActivityTransitionCombinationState appLaunchActivity](self, "appLaunchActivity"));
  uint64_t v6 = NSNumber;
  [(_ATXActivityTransitionCombinationState *)self scaledAppLaunchConfidence];
  double v7 = objc_msgSend(v6, "numberWithDouble:");
  double v8 = [v5 tupleWithFirst:v50 second:v7];
  v64[1] = v8;
  v9 = (void *)MEMORY[0x1E4F93BB8];
  int v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[_ATXActivityTransitionCombinationState heuristicActivity](self, "heuristicActivity"));
  v11 = NSNumber;
  [(_ATXActivityTransitionCombinationState *)self scaledHeuristicConfidence];
  int v12 = objc_msgSend(v11, "numberWithDouble:");
  v13 = [v9 tupleWithFirst:v10 second:v12];
  v64[2] = v13;
  int v14 = (void *)MEMORY[0x1E4F93BB8];
  v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[_ATXActivityTransitionCombinationState computedModeActivity](self, "computedModeActivity"));
  int v16 = NSNumber;
  [(_ATXActivityTransitionCombinationState *)self scaledComputedModeConfidence];
  v17 = objc_msgSend(v16, "numberWithDouble:");
  v18 = [v14 tupleWithFirst:v15 second:v17];
  v64[3] = v18;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v64 count:4];

  v20 = objc_opt_new();
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v21 = v19;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v58 objects:v63 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v59;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v59 != v24) {
          objc_enumerationMutation(v21);
        }
        v26 = *(void **)(*((void *)&v58 + 1) + 8 * i);
        v27 = [v26 first];
        v28 = [v20 objectForKeyedSubscript:v27];
        v29 = v28;
        if (!v28) {
          v28 = &unk_1F27F0540;
        }
        [v28 doubleValue];
        double v31 = v30;

        v32 = NSNumber;
        v33 = [v26 second];
        [v33 doubleValue];
        v35 = [v32 numberWithDouble:v31 + v34];
        v36 = [v26 first];
        [v20 setObject:v35 forKeyedSubscript:v36];
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v58 objects:v63 count:16];
    }
    while (v23);
  }

  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v37 = v20;
  uint64_t v38 = [v37 countByEnumeratingWithState:&v54 objects:v62 count:16];
  if (v38)
  {
    uint64_t v39 = v38;
    uint64_t v40 = *(void *)v55;
    v41 = &unk_1F27F0558;
    v42 = &unk_1F27F0540;
    do
    {
      for (uint64_t j = 0; j != v39; ++j)
      {
        if (*(void *)v55 != v40) {
          objc_enumerationMutation(v37);
        }
        v44 = *(void **)(*((void *)&v54 + 1) + 8 * j);
        v45 = [v37 objectForKeyedSubscript:v44];
        if ([v45 compare:v42] == 1)
        {
          id v46 = v44;

          id v47 = v45;
          v42 = v47;
          v41 = v46;
        }
      }
      uint64_t v39 = [v37 countByEnumeratingWithState:&v54 objects:v62 count:16];
    }
    while (v39);
  }
  else
  {
    v41 = &unk_1F27F0558;
    v42 = &unk_1F27F0540;
  }

  v48 = [MEMORY[0x1E4F93BB8] tupleWithFirst:v41 second:v42];

  return v48;
}

- (id)startTransition
{
  objc_super v3 = [(_ATXActivityTransitionCombinationState *)self topActivityWithConfidence];
  id v4 = [v3 first];
  uint64_t v5 = [v4 integerValue];

  uint64_t v6 = [ATXUnifiedInferredActivityTransition alloc];
  [(_ATXActivityTransitionCombinationState *)self timestamp];
  double v8 = v7;
  v9 = [v3 second];
  [v9 doubleValue];
  id v11 = [(ATXUnifiedInferredActivityTransition *)v6 initFromTransitionTime:1 isEntryEvent:@"unifiedInferredActivity" source:v5 activityType:v8 confidence:v10];

  return v11;
}

- (id)endTransitionWithTimestamp:(double)a3
{
  id v4 = [(_ATXActivityTransitionCombinationState *)self topActivityWithConfidence];
  uint64_t v5 = [v4 first];
  uint64_t v6 = [v5 integerValue];

  double v7 = [ATXUnifiedInferredActivityTransition alloc];
  double v8 = [v4 second];
  [v8 doubleValue];
  id v10 = [(ATXUnifiedInferredActivityTransition *)v7 initFromTransitionTime:0 isEntryEvent:@"unifiedInferredActivity" source:v6 activityType:a3 confidence:v9];

  return v10;
}

- (BOOL)hasSameTopActivityAndConfidenceAsOther:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_ATXActivityTransitionCombinationState *)self topActivityWithConfidence];
  uint64_t v6 = [v4 topActivityWithConfidence];

  double v7 = [v5 first];
  double v8 = [v6 first];
  if ([v7 isEqualToNumber:v8])
  {
    double v9 = [v5 second];
    [v9 doubleValue];
    double v11 = v10;
    int v12 = [v6 second];
    [v12 doubleValue];
    double v14 = v11 - v13;

    double v15 = -v14;
    if (v14 >= 0.0) {
      double v15 = v14;
    }
    BOOL v16 = v15 < 0.001;
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (unint64_t)timeBasedActivity
{
  return self->_timeBasedActivity;
}

- (void)setTimeBasedActivity:(unint64_t)a3
{
  self->_timeBasedActivity = a3;
}

- (double)timeBasedConfidence
{
  return self->_timeBasedConfidence;
}

- (void)setTimeBasedConfidence:(double)a3
{
  self->_timeBasedConfidence = a3;
}

- (unint64_t)appLaunchActivity
{
  return self->_appLaunchActivity;
}

- (void)setAppLaunchActivity:(unint64_t)a3
{
  self->_appLaunchActivity = a3;
}

- (double)appLaunchConfidence
{
  return self->_appLaunchConfidence;
}

- (void)setAppLaunchConfidence:(double)a3
{
  self->_appLaunchConfidence = a3;
}

- (unint64_t)heuristicActivity
{
  return self->_heuristicActivity;
}

- (void)setHeuristicActivity:(unint64_t)a3
{
  self->_heuristicActivity = a3;
}

- (double)heuristicConfidence
{
  return self->_heuristicConfidence;
}

- (void)setHeuristicConfidence:(double)a3
{
  self->_heuristicConfidence = a3;
}

- (unint64_t)computedModeActivity
{
  return self->_computedModeActivity;
}

- (void)setComputedModeActivity:(unint64_t)a3
{
  self->_computedModeActivity = a3;
}

- (double)computedModeConfidence
{
  return self->_computedModeConfidence;
}

- (void)setComputedModeConfidence:(double)a3
{
  self->_computedModeConfidence = a3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (void)newStateFromTransition:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  double v7 = [a2 source];
  int v8 = 138412546;
  double v9 = v6;
  __int16 v10 = 2112;
  double v11 = v7;
  _os_log_fault_impl(&dword_1D0FA3000, a3, OS_LOG_TYPE_FAULT, "[%@] Received unexpected activity transition source %@", (uint8_t *)&v8, 0x16u);
}

@end