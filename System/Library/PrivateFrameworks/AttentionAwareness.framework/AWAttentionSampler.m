@interface AWAttentionSampler
- (AWAttentionSampler)init;
- (AWAttentionSampler)initWithOptions:(id)a3;
- (AWSampleLogger)sampleLogger;
- (BOOL)lastFaceMetadataValid;
- (BOOL)unitTestSampling;
- (CGRect)lastFaceBounds;
- (NSMutableArray)lastMotionData;
- (double)lastDistance;
- (double)lastPitch;
- (double)lastRoll;
- (double)lastYaw;
- (float)lastAttentionScore;
- (float)lastFaceDetectionScore;
- (id)description;
- (id)operationEndableCallback;
- (id)stateChangedCallback;
- (int)currentState;
- (unint64_t)lastFaceState;
- (unint64_t)lastMetadataType;
- (unint64_t)lastMotionResult;
- (unint64_t)lastOrientation;
- (unint64_t)lastPersonID;
- (unint64_t)lastPollTimeoutTime;
- (unint64_t)lastPositiveDetectTime;
- (unint64_t)lastTriggerTime;
- (unint64_t)minimumAttentionSamplerErrorRetryTime;
- (unint64_t)nextSampleTimeForSamplingInterval:(unint64_t)a3 ignoreDisplayState:(BOOL)a4;
- (unint64_t)samplingSuppressedMask;
- (void)finishDeadlineComputationWithOptions:(id)a3;
- (void)setCarPlayConnected:(BOOL)a3;
- (void)setCurrentState:(int)a3;
- (void)setDisplayState:(BOOL)a3;
- (void)setLastAttentionScore:(float)a3;
- (void)setLastDistance:(double)a3;
- (void)setLastFaceBounds:(CGRect)a3;
- (void)setLastFaceDetectionScore:(float)a3;
- (void)setLastFaceMetadataValid:(BOOL)a3;
- (void)setLastFaceState:(unint64_t)a3;
- (void)setLastMetadataType:(unint64_t)a3;
- (void)setLastMotionData:(id)a3;
- (void)setLastMotionResult:(unint64_t)a3;
- (void)setLastOrientation:(unint64_t)a3;
- (void)setLastPersonID:(unint64_t)a3;
- (void)setLastPitch:(double)a3;
- (void)setLastPollTimeoutTime:(unint64_t)a3;
- (void)setLastPositiveDetectTime:(unint64_t)a3;
- (void)setLastRoll:(double)a3;
- (void)setLastTriggerTime:(unint64_t)a3;
- (void)setLastYaw:(double)a3;
- (void)setOperationEndableCallback:(id)a3;
- (void)setSampleLogger:(id)a3;
- (void)setSamplingSuppressedMask:(unint64_t)a3;
- (void)setSmartCoverClosed:(BOOL)a3;
- (void)setStateChangedCallback:(id)a3;
- (void)setUnitTestMode;
- (void)shouldSample:(BOOL)a3 withDeadline:(unint64_t)a4 withOptions:(id)a5;
- (void)startDeadlineComputation;
- (void)updateSamplingDeadline:(unint64_t)a3 forClient:(id)a4;
@end

@implementation AWAttentionSampler

- (int)currentState
{
  return self->_currentState;
}

- (void)startDeadlineComputation
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  self->_nextDeadline = -1;
  sampleLogger = self->_sampleLogger;

  [(AWSampleLogger *)sampleLogger startUpdate];
}

- (void)finishDeadlineComputationWithOptions:(id)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  BOOL v4 = self->_nextDeadline != -1;
  -[AWAttentionSampler shouldSample:withDeadline:withOptions:](self, "shouldSample:withDeadline:withOptions:", v4);
  sampleLogger = self->_sampleLogger;

  [(AWSampleLogger *)sampleLogger shouldSample:v4];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastMotionData, 0);
  objc_storeStrong(&self->_operationEndableCallback, 0);
  objc_storeStrong(&self->_stateChangedCallback, 0);
  objc_storeStrong((id *)&self->_sampleLogger, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setLastMotionData:(id)a3
{
}

- (NSMutableArray)lastMotionData
{
  return self->_lastMotionData;
}

- (BOOL)unitTestSampling
{
  return self->_unitTestSampling;
}

- (void)setLastPersonID:(unint64_t)a3
{
  self->_lastPersonID = a3;
}

- (unint64_t)lastPersonID
{
  return self->_lastPersonID;
}

- (void)setLastFaceBounds:(CGRect)a3
{
  self->_lastFaceBounds = a3;
}

- (CGRect)lastFaceBounds
{
  double x = self->_lastFaceBounds.origin.x;
  double y = self->_lastFaceBounds.origin.y;
  double width = self->_lastFaceBounds.size.width;
  double height = self->_lastFaceBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setLastFaceDetectionScore:(float)a3
{
  self->_lastFaceDetectionScore = a3;
}

- (float)lastFaceDetectionScore
{
  return self->_lastFaceDetectionScore;
}

- (void)setLastAttentionScore:(float)a3
{
  self->_lastAttentionScore = a3;
}

- (float)lastAttentionScore
{
  return self->_lastAttentionScore;
}

- (void)setLastMotionResult:(unint64_t)a3
{
  self->_lastMotionResult = a3;
}

- (unint64_t)lastMotionResult
{
  return self->_lastMotionResult;
}

- (void)setLastMetadataType:(unint64_t)a3
{
  self->_lastMetadataType = a3;
}

- (unint64_t)lastMetadataType
{
  return self->_lastMetadataType;
}

- (void)setLastFaceState:(unint64_t)a3
{
  self->_lastFaceState = a3;
}

- (unint64_t)lastFaceState
{
  return self->_lastFaceState;
}

- (void)setLastDistance:(double)a3
{
  self->_lastDistance = a3;
}

- (double)lastDistance
{
  return self->_lastDistance;
}

- (void)setLastOrientation:(unint64_t)a3
{
  self->_lastOrientation = a3;
}

- (unint64_t)lastOrientation
{
  return self->_lastOrientation;
}

- (void)setLastRoll:(double)a3
{
  self->_lastRoll = a3;
}

- (double)lastRoll
{
  return self->_lastRoll;
}

- (void)setLastYaw:(double)a3
{
  self->_lastYaw = a3;
}

- (double)lastYaw
{
  return self->_lastYaw;
}

- (void)setLastPitch:(double)a3
{
  self->_lastPitch = a3;
}

- (double)lastPitch
{
  return self->_lastPitch;
}

- (void)setLastFaceMetadataValid:(BOOL)a3
{
  self->_lastFaceMetadataValid = a3;
}

- (BOOL)lastFaceMetadataValid
{
  return self->_lastFaceMetadataValid;
}

- (void)setLastPollTimeoutTime:(unint64_t)a3
{
  self->_lastPollTimeoutTime = a3;
}

- (unint64_t)lastPollTimeoutTime
{
  return self->_lastPollTimeoutTime;
}

- (void)setLastPositiveDetectTime:(unint64_t)a3
{
  self->_lastPositiveDetectTime = a3;
}

- (unint64_t)lastPositiveDetectTime
{
  return self->_lastPositiveDetectTime;
}

- (void)setLastTriggerTime:(unint64_t)a3
{
  self->_lastTriggerTime = a3;
}

- (unint64_t)lastTriggerTime
{
  return self->_lastTriggerTime;
}

- (void)setSamplingSuppressedMask:(unint64_t)a3
{
  self->_samplingSuppressedMask = a3;
}

- (unint64_t)samplingSuppressedMask
{
  return self->_samplingSuppressedMask;
}

- (void)setCurrentState:(int)a3
{
  self->_currentState = a3;
}

- (void)setOperationEndableCallback:(id)a3
{
}

- (id)operationEndableCallback
{
  return objc_getProperty(self, a2, 56, 1);
}

- (void)setStateChangedCallback:(id)a3
{
}

- (id)stateChangedCallback
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)setSampleLogger:(id)a3
{
}

- (AWSampleLogger)sampleLogger
{
  return self->_sampleLogger;
}

- (AWAttentionSampler)initWithOptions:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_5;
  }
  v6 = [v4 valueForKey:@"eventMask"];

  if (v6)
  {
    v7 = [v5 valueForKey:@"eventMask"];
    uint64_t v8 = [v7 unsignedLongValue];

    if (v8 == 128)
    {
      v6 = [[AWPearlAttentionSampler alloc] initWithOptions:v5];
      goto LABEL_6;
    }
LABEL_5:
    v6 = 0;
  }
LABEL_6:

  return &v6->super;
}

- (void)setCarPlayConnected:(BOOL)a3
{
}

- (void)setDisplayState:(BOOL)a3
{
}

- (void)setSmartCoverClosed:(BOOL)a3
{
}

- (void)shouldSample:(BOOL)a3 withDeadline:(unint64_t)a4 withOptions:(id)a5
{
}

- (unint64_t)minimumAttentionSamplerErrorRetryTime
{
}

- (unint64_t)nextSampleTimeForSamplingInterval:(unint64_t)a3 ignoreDisplayState:(BOOL)a4
{
}

- (void)updateSamplingDeadline:(unint64_t)a3 forClient:(id)a4
{
  queue = self->_queue;
  id v9 = a4;
  dispatch_assert_queue_V2(queue);
  unint64_t nextDeadline = self->_nextDeadline;
  if (nextDeadline == -1 || nextDeadline < a3) {
    self->_unint64_t nextDeadline = a3;
  }
  [(AWSampleLogger *)self->_sampleLogger updateDataForClient:v9 deadline:a3];
}

- (void)setUnitTestMode
{
  sampleLogger = self->_sampleLogger;
  self->_sampleLogger = 0;

  self->_unitTestSampling = 1;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  v6 = (void *)v5;
  v7 = "true";
  if (self->_samplingSuppressedMask) {
    uint64_t v8 = "true";
  }
  else {
    uint64_t v8 = "false";
  }
  if (!self->_unitTestSampling) {
    v7 = "false";
  }
  id v9 = [v3 stringWithFormat:@"<%@: %p> (samplingSuppressed: %s unitTestSampling: %s)", v5, self, v8, v7];

  return v9;
}

- (AWAttentionSampler)init
{
  v9.receiver = self;
  v9.super_class = (Class)AWAttentionSampler;
  v2 = [(AWAttentionSampler *)&v9 init];
  if (v2)
  {
    uint64_t v3 = awQueue(1);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    id stateChangedCallback = v2->_stateChangedCallback;
    v2->_id stateChangedCallback = &__block_literal_global_1577;

    uint64_t v6 = +[AWSampleLogger sharedLogger];
    sampleLogger = v2->_sampleLogger;
    v2->_sampleLogger = (AWSampleLogger *)v6;

    v2->_samplingSuppressedMask = 0;
  }
  return v2;
}

@end