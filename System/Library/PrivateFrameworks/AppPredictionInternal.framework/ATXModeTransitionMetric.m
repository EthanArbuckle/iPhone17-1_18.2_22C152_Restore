@interface ATXModeTransitionMetric
- (ATXModeTransitionMetric)initWithPreviousModeSemanticType:(id)a3 previousModeDuration:(double)a4 previousModeHadScheduledExit:(BOOL)a5 exitReason:(id)a6 enterReason:(id)a7 transitionDeviceType:(id)a8 transitionSource:(id)a9 nextModeSemanticType:(id)a10;
- (BOOL)appBasedSchedulingEnabled;
- (BOOL)locationBasedSchedulingEnabled;
- (BOOL)previousModeHadScheduledExit;
- (BOOL)smartActivationEnabled;
- (BOOL)timeBasedSchedulingEnabled;
- (NSNumber)inferredModeConfidenceScore;
- (NSNumber)inferredModeDuration;
- (NSNumber)inferredModeUILocation;
- (NSString)currentModeOrigin;
- (NSString)enterReason;
- (NSString)exitReason;
- (NSString)inferredModeOriginAnchorType;
- (NSString)inferredModeType;
- (NSString)nextModeSemanticType;
- (NSString)previousModeOrigin;
- (NSString)previousModeSemanticType;
- (NSString)transitionDeviceType;
- (NSString)transitionSource;
- (double)previousModeDuration;
- (id)coreAnalyticsDictionary;
- (id)description;
- (id)metricName;
- (void)setAppBasedSchedulingEnabled:(BOOL)a3;
- (void)setCurrentModeOrigin:(id)a3;
- (void)setEnterReason:(id)a3;
- (void)setExitReason:(id)a3;
- (void)setInferredModeConfidenceScore:(id)a3;
- (void)setInferredModeDuration:(id)a3;
- (void)setInferredModeOriginAnchorType:(id)a3;
- (void)setInferredModeType:(id)a3;
- (void)setInferredModeUILocation:(id)a3;
- (void)setLocationBasedSchedulingEnabled:(BOOL)a3;
- (void)setNextModeSemanticType:(id)a3;
- (void)setPreviousModeDuration:(double)a3;
- (void)setPreviousModeHadScheduledExit:(BOOL)a3;
- (void)setPreviousModeOrigin:(id)a3;
- (void)setPreviousModeSemanticType:(id)a3;
- (void)setSmartActivationEnabled:(BOOL)a3;
- (void)setTimeBasedSchedulingEnabled:(BOOL)a3;
- (void)setTransitionDeviceType:(id)a3;
- (void)setTransitionSource:(id)a3;
@end

@implementation ATXModeTransitionMetric

- (ATXModeTransitionMetric)initWithPreviousModeSemanticType:(id)a3 previousModeDuration:(double)a4 previousModeHadScheduledExit:(BOOL)a5 exitReason:(id)a6 enterReason:(id)a7 transitionDeviceType:(id)a8 transitionSource:(id)a9 nextModeSemanticType:(id)a10
{
  id v26 = a3;
  id v25 = a6;
  id v24 = a7;
  id v23 = a8;
  id v18 = a9;
  id v19 = a10;
  v27.receiver = self;
  v27.super_class = (Class)ATXModeTransitionMetric;
  v20 = [(_ATXCoreAnalyticsMetric *)&v27 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_previousModeSemanticType, a3);
    v21->_previousModeDuration = a4;
    v21->_previousModeHadScheduledExit = a5;
    objc_storeStrong((id *)&v21->_exitReason, a6);
    objc_storeStrong((id *)&v21->_enterReason, a7);
    objc_storeStrong((id *)&v21->_transitionDeviceType, a8);
    objc_storeStrong((id *)&v21->_transitionSource, a9);
    objc_storeStrong((id *)&v21->_nextModeSemanticType, a10);
  }

  return v21;
}

- (id)metricName
{
  return @"com.apple.ModeActivity.ModeTransition";
}

- (id)coreAnalyticsDictionary
{
  v49[19] = *MEMORY[0x1E4F143B8];
  uint64_t previousModeSemanticType = (uint64_t)self->_previousModeSemanticType;
  uint64_t v47 = previousModeSemanticType;
  v48[0] = @"previousMode";
  if (!previousModeSemanticType)
  {
    uint64_t previousModeSemanticType = [MEMORY[0x1E4F1CA98] null];
  }
  v35 = (void *)previousModeSemanticType;
  v49[0] = previousModeSemanticType;
  v48[1] = @"previousModeDuration";
  v46 = [NSNumber numberWithDouble:self->_previousModeDuration];
  v49[1] = v46;
  v48[2] = @"previousHadScheduledExit";
  v45 = [NSNumber numberWithBool:self->_previousModeHadScheduledExit];
  v49[2] = v45;
  v48[3] = @"exitReason";
  uint64_t exitReason = (uint64_t)self->_exitReason;
  uint64_t v44 = exitReason;
  if (!exitReason)
  {
    uint64_t exitReason = [MEMORY[0x1E4F1CA98] null];
  }
  v34 = (void *)exitReason;
  v49[3] = exitReason;
  v48[4] = @"enterReason";
  uint64_t enterReason = (uint64_t)self->_enterReason;
  uint64_t v43 = enterReason;
  if (!enterReason)
  {
    uint64_t enterReason = [MEMORY[0x1E4F1CA98] null];
  }
  v33 = (void *)enterReason;
  v49[4] = enterReason;
  v48[5] = @"transitionDeviceType";
  uint64_t transitionDeviceType = (uint64_t)self->_transitionDeviceType;
  uint64_t v42 = transitionDeviceType;
  if (!transitionDeviceType)
  {
    uint64_t transitionDeviceType = [MEMORY[0x1E4F1CA98] null];
  }
  v32 = (void *)transitionDeviceType;
  v49[5] = transitionDeviceType;
  v48[6] = @"transitionSource";
  uint64_t transitionSource = (uint64_t)self->_transitionSource;
  uint64_t v41 = transitionSource;
  if (!transitionSource)
  {
    uint64_t transitionSource = [MEMORY[0x1E4F1CA98] null];
  }
  v31 = (void *)transitionSource;
  v49[6] = transitionSource;
  v48[7] = @"nextMode";
  uint64_t nextModeSemanticType = (uint64_t)self->_nextModeSemanticType;
  uint64_t v40 = nextModeSemanticType;
  if (!nextModeSemanticType)
  {
    uint64_t nextModeSemanticType = [MEMORY[0x1E4F1CA98] null];
  }
  v30 = (void *)nextModeSemanticType;
  v49[7] = nextModeSemanticType;
  v48[8] = @"inferredModeConfidenceScore";
  uint64_t inferredModeConfidenceScore = (uint64_t)self->_inferredModeConfidenceScore;
  uint64_t v39 = inferredModeConfidenceScore;
  if (!inferredModeConfidenceScore)
  {
    uint64_t inferredModeConfidenceScore = [MEMORY[0x1E4F1CA98] null];
  }
  v29 = (void *)inferredModeConfidenceScore;
  v49[8] = inferredModeConfidenceScore;
  v48[9] = @"inferredModeDuration";
  uint64_t inferredModeDuration = (uint64_t)self->_inferredModeDuration;
  uint64_t v38 = inferredModeDuration;
  if (!inferredModeDuration)
  {
    uint64_t inferredModeDuration = [MEMORY[0x1E4F1CA98] null];
  }
  v28 = (void *)inferredModeDuration;
  v49[9] = inferredModeDuration;
  v48[10] = @"inferredModeOriginAnchorType";
  uint64_t inferredModeOriginAnchorType = (uint64_t)self->_inferredModeOriginAnchorType;
  uint64_t v37 = inferredModeOriginAnchorType;
  if (!inferredModeOriginAnchorType)
  {
    uint64_t inferredModeOriginAnchorType = [MEMORY[0x1E4F1CA98] null];
  }
  objc_super v27 = (void *)inferredModeOriginAnchorType;
  v49[10] = inferredModeOriginAnchorType;
  v48[11] = @"inferredModeType";
  inferredModeType = self->_inferredModeType;
  uint64_t v13 = (uint64_t)inferredModeType;
  if (!inferredModeType)
  {
    uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
  }
  id v26 = (void *)v13;
  v49[11] = v13;
  v48[12] = @"inferredModeUILocation";
  inferredModeUILocation = self->_inferredModeUILocation;
  uint64_t v15 = (uint64_t)inferredModeUILocation;
  if (!inferredModeUILocation)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  id v25 = (void *)v15;
  v49[12] = v15;
  v48[13] = @"previousModeOrigin";
  previousModeOrigin = self->_previousModeOrigin;
  v17 = previousModeOrigin;
  if (!previousModeOrigin)
  {
    v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v49[13] = v17;
  v48[14] = @"appBasedSchedulingEnabled";
  id v18 = [NSNumber numberWithBool:self->_appBasedSchedulingEnabled];
  v49[14] = v18;
  v48[15] = @"timeBasedSchedulingEnabled";
  id v19 = [NSNumber numberWithBool:self->_timeBasedSchedulingEnabled];
  v49[15] = v19;
  v48[16] = @"locationBasedSchedulingEnabled";
  v20 = [NSNumber numberWithBool:self->_locationBasedSchedulingEnabled];
  v49[16] = v20;
  v48[17] = @"smartActivationEnabled";
  v21 = [NSNumber numberWithBool:self->_smartActivationEnabled];
  v49[17] = v21;
  v48[18] = @"currentModeOrigin";
  currentModeOrigin = self->_currentModeOrigin;
  id v23 = currentModeOrigin;
  if (!currentModeOrigin)
  {
    id v23 = [MEMORY[0x1E4F1CA98] null];
  }
  v49[18] = v23;
  id v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v49 forKeys:v48 count:19];
  if (!currentModeOrigin) {

  }
  if (previousModeOrigin)
  {
    if (inferredModeUILocation) {
      goto LABEL_31;
    }
LABEL_54:

    if (inferredModeType) {
      goto LABEL_32;
    }
    goto LABEL_55;
  }

  if (!inferredModeUILocation) {
    goto LABEL_54;
  }
LABEL_31:
  if (inferredModeType) {
    goto LABEL_32;
  }
LABEL_55:

LABEL_32:
  if (!v37) {

  }
  if (!v38) {
  if (!v39)
  }

  if (!v40) {
  if (!v41)
  }

  if (!v42) {
  if (!v43)
  }

  if (!v44) {
  if (!v47)
  }

  return v36;
}

- (id)description
{
  id v23 = NSString;
  v22 = [(ATXModeTransitionMetric *)self previousModeSemanticType];
  [(ATXModeTransitionMetric *)self previousModeDuration];
  uint64_t v4 = v3;
  BOOL v21 = [(ATXModeTransitionMetric *)self previousModeHadScheduledExit];
  v20 = [(ATXModeTransitionMetric *)self exitReason];
  id v19 = [(ATXModeTransitionMetric *)self enterReason];
  id v18 = [(ATXModeTransitionMetric *)self transitionDeviceType];
  id v25 = [(ATXModeTransitionMetric *)self transitionSource];
  uint64_t v15 = [(ATXModeTransitionMetric *)self nextModeSemanticType];
  v17 = [(ATXModeTransitionMetric *)self inferredModeConfidenceScore];
  v14 = [(ATXModeTransitionMetric *)self inferredModeDuration];
  v16 = [(ATXModeTransitionMetric *)self inferredModeOriginAnchorType];
  v5 = [(ATXModeTransitionMetric *)self inferredModeType];
  v6 = [(ATXModeTransitionMetric *)self inferredModeUILocation];
  v7 = [(ATXModeTransitionMetric *)self previousModeOrigin];
  BOOL v8 = [(ATXModeTransitionMetric *)self appBasedSchedulingEnabled];
  BOOL v9 = [(ATXModeTransitionMetric *)self timeBasedSchedulingEnabled];
  BOOL v10 = [(ATXModeTransitionMetric *)self locationBasedSchedulingEnabled];
  BOOL v11 = [(ATXModeTransitionMetric *)self smartActivationEnabled];
  v12 = [(ATXModeTransitionMetric *)self currentModeOrigin];
  objc_msgSend(v23, "stringWithFormat:", @"ATXModeTransitionMetric previousMode:%@\npreviousModeDuration:%f\npreviousHadScheduledExit:%d\nexitReason:%@\nenterReason:%@\ntransitionDeviceType:%@\ntransitionSource:%@\nnextMode:%@\ninferredModeConfidenceScore:%@\ninferredModeDuration:%@\ninferredModeOriginAnchorType:%@\ninferredModeType:%@\ninferredModeUILocation:%@\npreviousModeOrigin:%@\nappBasedSchedulingEnabled:%d\ntimeBasedSchedulingEnabled:%d\nlocationBasedSchedulingEnabled:%d\nsmartActivationEnabled:%d\ncurrentModeOrigin:%@\n", v22, v4, v21, v20, v19, v18, v25, v15, v17, v14, v16, v5, v6, v7, v8, v9,
    v10,
    v11,
  id v24 = v12);

  return v24;
}

- (NSString)previousModeSemanticType
{
  return self->_previousModeSemanticType;
}

- (void)setPreviousModeSemanticType:(id)a3
{
}

- (double)previousModeDuration
{
  return self->_previousModeDuration;
}

- (void)setPreviousModeDuration:(double)a3
{
  self->_previousModeDuration = a3;
}

- (BOOL)previousModeHadScheduledExit
{
  return self->_previousModeHadScheduledExit;
}

- (void)setPreviousModeHadScheduledExit:(BOOL)a3
{
  self->_previousModeHadScheduledExit = a3;
}

- (NSString)exitReason
{
  return self->_exitReason;
}

- (void)setExitReason:(id)a3
{
}

- (NSString)enterReason
{
  return self->_enterReason;
}

- (void)setEnterReason:(id)a3
{
}

- (NSNumber)inferredModeConfidenceScore
{
  return self->_inferredModeConfidenceScore;
}

- (void)setInferredModeConfidenceScore:(id)a3
{
}

- (NSNumber)inferredModeDuration
{
  return self->_inferredModeDuration;
}

- (void)setInferredModeDuration:(id)a3
{
}

- (NSString)inferredModeOriginAnchorType
{
  return self->_inferredModeOriginAnchorType;
}

- (void)setInferredModeOriginAnchorType:(id)a3
{
}

- (NSString)inferredModeType
{
  return self->_inferredModeType;
}

- (void)setInferredModeType:(id)a3
{
}

- (NSNumber)inferredModeUILocation
{
  return self->_inferredModeUILocation;
}

- (void)setInferredModeUILocation:(id)a3
{
}

- (NSString)previousModeOrigin
{
  return self->_previousModeOrigin;
}

- (void)setPreviousModeOrigin:(id)a3
{
}

- (NSString)currentModeOrigin
{
  return self->_currentModeOrigin;
}

- (void)setCurrentModeOrigin:(id)a3
{
}

- (NSString)transitionDeviceType
{
  return self->_transitionDeviceType;
}

- (void)setTransitionDeviceType:(id)a3
{
}

- (NSString)transitionSource
{
  return self->_transitionSource;
}

- (void)setTransitionSource:(id)a3
{
}

- (NSString)nextModeSemanticType
{
  return self->_nextModeSemanticType;
}

- (void)setNextModeSemanticType:(id)a3
{
}

- (BOOL)appBasedSchedulingEnabled
{
  return self->_appBasedSchedulingEnabled;
}

- (void)setAppBasedSchedulingEnabled:(BOOL)a3
{
  self->_appBasedSchedulingEnabled = a3;
}

- (BOOL)timeBasedSchedulingEnabled
{
  return self->_timeBasedSchedulingEnabled;
}

- (void)setTimeBasedSchedulingEnabled:(BOOL)a3
{
  self->_timeBasedSchedulingEnabled = a3;
}

- (BOOL)locationBasedSchedulingEnabled
{
  return self->_locationBasedSchedulingEnabled;
}

- (void)setLocationBasedSchedulingEnabled:(BOOL)a3
{
  self->_locationBasedSchedulingEnabled = a3;
}

- (BOOL)smartActivationEnabled
{
  return self->_smartActivationEnabled;
}

- (void)setSmartActivationEnabled:(BOOL)a3
{
  self->_smartActivationEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextModeSemanticType, 0);
  objc_storeStrong((id *)&self->_transitionSource, 0);
  objc_storeStrong((id *)&self->_transitionDeviceType, 0);
  objc_storeStrong((id *)&self->_currentModeOrigin, 0);
  objc_storeStrong((id *)&self->_previousModeOrigin, 0);
  objc_storeStrong((id *)&self->_inferredModeUILocation, 0);
  objc_storeStrong((id *)&self->_inferredModeType, 0);
  objc_storeStrong((id *)&self->_inferredModeOriginAnchorType, 0);
  objc_storeStrong((id *)&self->_inferredModeDuration, 0);
  objc_storeStrong((id *)&self->_inferredModeConfidenceScore, 0);
  objc_storeStrong((id *)&self->_enterReason, 0);
  objc_storeStrong((id *)&self->_exitReason, 0);
  objc_storeStrong((id *)&self->_previousModeSemanticType, 0);
}

@end