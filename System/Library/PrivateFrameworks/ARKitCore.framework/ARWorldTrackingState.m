@interface ARWorldTrackingState
+ (BOOL)supportsSecureCoding;
- (ARInertialState)inertialState;
- (ARWorldTrackingState)initWithCoder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)majorRelocalization;
- (BOOL)minorRelocalization;
- (BOOL)poseGraphUpdated;
- (NSArray)collaborationStats;
- (NSArray)mergedSessionIdentifiers;
- (__n128)majorRelocalizationCameraTransform;
- (__n128)setMajorRelocalizationCameraTransform:(__n128)a3;
- (double)lastMajorRelocalizationTimestamp;
- (double)originTimestamp;
- (double)poseTimestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)reason;
- (int64_t)state;
- (int64_t)vioTrackingState;
- (unint64_t)currentVIOMapSize;
- (unint64_t)numberOfCameraSwitches;
- (unint64_t)reinitializationAttempts;
- (void)encodeWithCoder:(id)a3;
- (void)setCollaborationStats:(id)a3;
- (void)setCurrentVIOMapSize:(unint64_t)a3;
- (void)setInertialState:(id)a3;
- (void)setLastMajorRelocalizationTimestamp:(double)a3;
- (void)setMajorRelocalization:(BOOL)a3;
- (void)setMergedSessionIdentifiers:(id)a3;
- (void)setMinorRelocalization:(BOOL)a3;
- (void)setNumberOfCameraSwitches:(unint64_t)a3;
- (void)setOriginTimestamp:(double)a3;
- (void)setPoseGraphUpdated:(BOOL)a3;
- (void)setPoseTimestamp:(double)a3;
- (void)setReason:(int64_t)a3;
- (void)setReinitializationAttempts:(unint64_t)a3;
- (void)setState:(int64_t)a3;
- (void)setVioTrackingState:(int64_t)a3;
@end

@implementation ARWorldTrackingState

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[ARWorldTrackingState allocWithZone:](ARWorldTrackingState, "allocWithZone:") init];
  v5->_state = self->_state;
  v5->_reason = self->_reason;
  v5->_majorRelocalization = self->_majorRelocalization;
  v5->_minorRelocalization = self->_minorRelocalization;
  v5->_poseGraphUpdated = self->_poseGraphUpdated;
  long long v6 = *(_OWORD *)&self[1].super.isa;
  long long v7 = *(_OWORD *)&self[1]._state;
  long long v8 = *(_OWORD *)&self[1]._originTimestamp;
  *(_OWORD *)&v5[1]._vioTrackingState = *(_OWORD *)&self[1]._vioTrackingState;
  *(_OWORD *)&v5[1]._originTimestamp = v8;
  *(_OWORD *)&v5[1].super.isa = v6;
  *(_OWORD *)&v5[1]._state = v7;
  v5->_vioTrackingState = self->_vioTrackingState;
  v5->_lastMajorRelocalizationTimestamp = self->_lastMajorRelocalizationTimestamp;
  v5->_originTimestamp = self->_originTimestamp;
  v5->_poseTimestamp = self->_poseTimestamp;
  uint64_t v9 = [(NSArray *)self->_mergedSessionIdentifiers copyWithZone:a3];
  mergedSessionIdentifiers = v5->_mergedSessionIdentifiers;
  v5->_mergedSessionIdentifiers = (NSArray *)v9;

  objc_storeStrong((id *)&v5->_collaborationStats, self->_collaborationStats);
  v5->_numberOfCameraSwitches = self->_numberOfCameraSwitches;
  v5->_currentVIOMapSize = self->_currentVIOMapSize;
  v5->_reinitializationAttempts = self->_reinitializationAttempts;
  objc_storeStrong((id *)&v5->_inertialState, self->_inertialState);
  return v5;
}

- (ARWorldTrackingState)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)ARWorldTrackingState;
  v5 = [(ARWorldTrackingState *)&v19 init];
  if (v5)
  {
    v5->_state = [v4 decodeIntegerForKey:@"state"];
    v5->_reason = [v4 decodeIntegerForKey:@"reason"];
    v5->_majorRelocalization = [v4 decodeBoolForKey:@"majorRelocalization"];
    v5->_minorRelocalization = [v4 decodeBoolForKey:@"minorRelocalization"];
    v5->_poseGraphUpdated = [v4 decodeBoolForKey:@"poseGraphUpdated"];
    objc_msgSend(v4, "ar_decodeMatrix4x4ForKey:", @"majorRelocalizationCameraTransform");
    *(_OWORD *)&v5[1].super.isa = v6;
    *(_OWORD *)&v5[1]._state = v7;
    *(_OWORD *)&v5[1]._vioTrackingState = v8;
    *(_OWORD *)&v5[1]._originTimestamp = v9;
    v5->_vioTrackingState = [v4 decodeIntegerForKey:@"vioTrackingState"];
    [v4 decodeDoubleForKey:@"lastMajorRelocalizationTimestamp"];
    v5->_lastMajorRelocalizationTimestamp = v10;
    [v4 decodeDoubleForKey:@"originTimestamp"];
    v5->_originTimestamp = v11;
    [v4 decodeDoubleForKey:@"poseTimestamp"];
    v5->_poseTimestamp = v12;
    [v4 decodeDoubleForKey:@"numberOfCameraSwitches"];
    v5->_numberOfCameraSwitches = (unint64_t)v13;
    [v4 decodeDoubleForKey:@"currentVIOMapSize"];
    v5->_currentVIOMapSize = (unint64_t)v14;
    [v4 decodeDoubleForKey:@"reinitializationAttempts"];
    v5->_reinitializationAttempts = (unint64_t)v15;
    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"inertialState"];
    inertialState = v5->_inertialState;
    v5->_inertialState = (ARInertialState *)v16;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t state = self->_state;
  id v5 = a3;
  [v5 encodeInteger:state forKey:@"state"];
  [v5 encodeInteger:self->_reason forKey:@"reason"];
  [v5 encodeBool:self->_majorRelocalization forKey:@"majorRelocalization"];
  [v5 encodeBool:self->_minorRelocalization forKey:@"minorRelocalization"];
  [v5 encodeBool:self->_poseGraphUpdated forKey:@"poseGraphUpdated"];
  objc_msgSend(v5, "ar_encodeMatrix4x4:forKey:", @"majorRelocalizationCameraTransform", *(double *)&self[1].super.isa, *(double *)&self[1]._state, *(double *)&self[1]._vioTrackingState, self[1]._originTimestamp);
  [v5 encodeInteger:self->_vioTrackingState forKey:@"vioTrackingState"];
  [v5 encodeDouble:@"lastMajorRelocalizationTimestamp" forKey:self->_lastMajorRelocalizationTimestamp];
  [v5 encodeDouble:@"originTimestamp" forKey:self->_originTimestamp];
  [v5 encodeDouble:@"poseTimestamp" forKey:self->_poseTimestamp];
  [v5 encodeDouble:@"numberOfCameraSwitches" forKey:(double)self->_numberOfCameraSwitches];
  [v5 encodeDouble:@"currentVIOMapSize" forKey:(double)self->_currentVIOMapSize];
  [v5 encodeDouble:@"reinitializationAttempts" forKey:(double)self->_reinitializationAttempts];
  [v5 encodeObject:self->_inertialState forKey:@"inertialState"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = (float32x4_t *)v4;
    long long v6 = v5;
    BOOL v8 = self->_state == v5[1].i64[0]
      && self->_reason == v5[1].i64[1]
      && self->_majorRelocalization == v5->u8[8]
      && self->_minorRelocalization == v5->u8[9]
      && self->_poseGraphUpdated == v5->u8[10]
      && AREqualTransforms(*(float32x4_t *)&self[1].super.isa, *(float32x4_t *)&self[1]._state, *(float32x4_t *)&self[1]._vioTrackingState, *(float32x4_t *)&self[1]._originTimestamp, v5[7], v5[8], v5[9], v5[10])&& self->_vioTrackingState == v6[2].i64[0]&& self->_numberOfCameraSwitches == v6[4].i64[1]&& self->_currentVIOMapSize == v6[4].i64[0]&& self->_reinitializationAttempts == v6[5].i64[0]&& ((inertialState = self->_inertialState, inertialState == (ARInertialState *)v6[6].i64[1])|| -[ARInertialState isEqual:](inertialState, "isEqual:"))&& vabdd_f64(self->_lastMajorRelocalizationTimestamp, *(double *)&v6[2].i64[1]) < 2.22044605e-16&& vabdd_f64(self->_originTimestamp, *(double *)v6[3].i64) < 2.22044605e-16&& vabdd_f64(self->_poseTimestamp, *(double *)&v6[3].i64[1]) < 2.22044605e-16;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_int64_t state = a3;
}

- (int64_t)reason
{
  return self->_reason;
}

- (void)setReason:(int64_t)a3
{
  self->_reason = a3;
}

- (BOOL)majorRelocalization
{
  return self->_majorRelocalization;
}

- (void)setMajorRelocalization:(BOOL)a3
{
  self->_majorRelocalization = a3;
}

- (BOOL)minorRelocalization
{
  return self->_minorRelocalization;
}

- (void)setMinorRelocalization:(BOOL)a3
{
  self->_minorRelocalization = a3;
}

- (BOOL)poseGraphUpdated
{
  return self->_poseGraphUpdated;
}

- (void)setPoseGraphUpdated:(BOOL)a3
{
  self->_poseGraphUpdated = a3;
}

- (__n128)majorRelocalizationCameraTransform
{
  return a1[7];
}

- (__n128)setMajorRelocalizationCameraTransform:(__n128)a3
{
  result[7] = a2;
  result[8] = a3;
  result[9] = a4;
  result[10] = a5;
  return result;
}

- (int64_t)vioTrackingState
{
  return self->_vioTrackingState;
}

- (void)setVioTrackingState:(int64_t)a3
{
  self->_vioTrackingState = a3;
}

- (double)lastMajorRelocalizationTimestamp
{
  return self->_lastMajorRelocalizationTimestamp;
}

- (void)setLastMajorRelocalizationTimestamp:(double)a3
{
  self->_lastMajorRelocalizationTimestamp = a3;
}

- (double)originTimestamp
{
  return self->_originTimestamp;
}

- (void)setOriginTimestamp:(double)a3
{
  self->_originTimestamp = a3;
}

- (double)poseTimestamp
{
  return self->_poseTimestamp;
}

- (void)setPoseTimestamp:(double)a3
{
  self->_poseTimestamp = a3;
}

- (unint64_t)currentVIOMapSize
{
  return self->_currentVIOMapSize;
}

- (void)setCurrentVIOMapSize:(unint64_t)a3
{
  self->_currentVIOMapSize = a3;
}

- (unint64_t)numberOfCameraSwitches
{
  return self->_numberOfCameraSwitches;
}

- (void)setNumberOfCameraSwitches:(unint64_t)a3
{
  self->_numberOfCameraSwitches = a3;
}

- (unint64_t)reinitializationAttempts
{
  return self->_reinitializationAttempts;
}

- (void)setReinitializationAttempts:(unint64_t)a3
{
  self->_reinitializationAttempts = a3;
}

- (NSArray)mergedSessionIdentifiers
{
  return self->_mergedSessionIdentifiers;
}

- (void)setMergedSessionIdentifiers:(id)a3
{
}

- (NSArray)collaborationStats
{
  return self->_collaborationStats;
}

- (void)setCollaborationStats:(id)a3
{
}

- (ARInertialState)inertialState
{
  return self->_inertialState;
}

- (void)setInertialState:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inertialState, 0);
  objc_storeStrong((id *)&self->_collaborationStats, 0);
  objc_storeStrong((id *)&self->_mergedSessionIdentifiers, 0);
}

@end