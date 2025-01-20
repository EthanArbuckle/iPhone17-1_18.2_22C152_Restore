@interface BWPreviewGyroStabilizationTripodDetection
- (BOOL)_isCameraStationary;
- (BOOL)empty;
- (BOOL)isLikelyPhysicalTripod;
- (BOOL)isPhysicalTripod;
- (BOOL)isStationary;
- (BWPreviewGyroStabilizationTripodDetection)initWithTripodDetectionThresholds:(float)a3 tripodMaxAngleThresholdAccumulate:(float)a4 physicalTripodLikelyMaxAngleThreshold:(float)a5 physicalTripodGuaranteedMaxAngleThreshold:(float)a6;
- (void)_detectPhysicalTripodUsingMaxAngleInstant:(float)a3 frameRateNormalization:(float)a4;
- (void)_updateWithMaxAngleInstant:(float)a3 maxAngleAccumulate:(float)a4;
- (void)detectTripodStateUsingMaxAngleInstant:(float)a3 maxAngleAccumulate:(float)a4 frameRateNormalizationFactor:(float)a5;
- (void)reset;
@end

@implementation BWPreviewGyroStabilizationTripodDetection

- (BOOL)isStationary
{
  return self->_isStationary;
}

- (BOOL)isPhysicalTripod
{
  return self->_isPhysicalTripod;
}

- (BOOL)isLikelyPhysicalTripod
{
  return self->_isLikelyPhysicalTripod;
}

- (BOOL)empty
{
  return self->_ringCount == 0;
}

- (void)detectTripodStateUsingMaxAngleInstant:(float)a3 maxAngleAccumulate:(float)a4 frameRateNormalizationFactor:(float)a5
{
  -[BWPreviewGyroStabilizationTripodDetection _updateWithMaxAngleInstant:maxAngleAccumulate:](self, "_updateWithMaxAngleInstant:maxAngleAccumulate:");
  [(BWPreviewGyroStabilizationTripodDetection *)self _isCameraStationary];
  *(float *)&double v8 = a3;
  *(float *)&double v9 = a5;
  [(BWPreviewGyroStabilizationTripodDetection *)self _detectPhysicalTripodUsingMaxAngleInstant:v8 frameRateNormalization:v9];
}

- (void)_updateWithMaxAngleInstant:(float)a3 maxAngleAccumulate:(float)a4
{
  BOOL v4 = self->_tripodMaxAngleThresholdAccumulate >= a4 && self->_tripodMaxAngleThresholdInstant >= a3;
  int ringCount = self->_ringCount;
  uint64_t inputIndex = self->_inputIndex;
  self->_stationary[inputIndex] = v4;
  if (ringCount <= 59) {
    self->_int ringCount = ringCount + 1;
  }
  unsigned int v7 = 60
     * ((~inputIndex
       + (((int)inputIndex + 1) >> 31)
       + ((inputIndex + 1) & ~(((int)inputIndex + 1) >> 31)))
      / 0x3C
      + ((inputIndex + 1) >> 31));
  int v8 = v7 + inputIndex + 1;
  int v9 = inputIndex + v7;
  if (v8 >= 59) {
    int v8 = 59;
  }
  self->_uint64_t inputIndex = (v9 - v8 + 60) % 0x3Cu - (60 - v8) + 1;
}

- (BOOL)_isCameraStationary
{
  BOOL v2 = 1;
  self->_isStationary = 1;
  uint64_t ringCount = self->_ringCount;
  if ((int)ringCount >= 1)
  {
    stationary = self->_stationary;
    while (*stationary++)
    {
      if (!--ringCount) {
        return 1;
      }
    }
    BOOL v2 = 0;
    self->_isStationary = 0;
  }
  return v2;
}

- (void)_detectPhysicalTripodUsingMaxAngleInstant:(float)a3 frameRateNormalization:(float)a4
{
  float physicalTripodLikelyMaxAngleThreshold = self->_physicalTripodLikelyMaxAngleThreshold;
  self->_isLikelyPhysicalTripod = physicalTripodLikelyMaxAngleThreshold > a3;
  if (physicalTripodLikelyMaxAngleThreshold <= a3)
  {
    int v8 = 0;
  }
  else
  {
    int previousLikelyPhysicalTripodCount = self->_previousLikelyPhysicalTripodCount;
    int v6 = llroundf(a4);
    if (v6 <= 1) {
      int v6 = 1;
    }
    BOOL v7 = previousLikelyPhysicalTripodCount >= v6 && self->_physicalTripodGuaranteedMaxAngleThreshold > a3;
    self->_isPhysicalTripod = v7;
    int v8 = previousLikelyPhysicalTripodCount + 1;
  }
  self->_int previousLikelyPhysicalTripodCount = v8;
}

- (BWPreviewGyroStabilizationTripodDetection)initWithTripodDetectionThresholds:(float)a3 tripodMaxAngleThresholdAccumulate:(float)a4 physicalTripodLikelyMaxAngleThreshold:(float)a5 physicalTripodGuaranteedMaxAngleThreshold:(float)a6
{
  v13.receiver = self;
  v13.super_class = (Class)BWPreviewGyroStabilizationTripodDetection;
  v10 = [(BWPreviewGyroStabilizationTripodDetection *)&v13 init];
  v11 = v10;
  if (v10)
  {
    [(BWPreviewGyroStabilizationTripodDetection *)v10 reset];
    v11->_tripodMaxAngleThresholdInstant = a3;
    v11->_tripodMaxAngleThresholdAccumulate = a4;
    v11->_float physicalTripodLikelyMaxAngleThreshold = a5;
    v11->_physicalTripodGuaranteedMaxAngleThreshold = a6;
  }
  return v11;
}

- (void)reset
{
  *(void *)&self->_uint64_t ringCount = 0;
  self->_uint64_t inputIndex = 0;
  *(_WORD *)&self->_isStationary = 0;
  self->_isPhysicalTripod = 0;
}

@end