@interface CMFacePose
- (BOOL)sensorCovered;
- (BOOL)tooDark;
- (NSArray)blendShapeWeights;
- (NSString)failureDescription;
- (__n128)gaze;
- (__n128)leftEyePosition;
- (__n128)rightEyePosition;
- (__n128)rotation;
- (__n128)setRotation:(__n128)a3;
- (__n128)translation;
- (double)globalMachtime;
- (double)localMachtime;
- (double)roll;
- (float)confidence;
- (int)failureCode;
- (void)setBlendShapeWeights:(id)a3;
- (void)setConfidence:(float)a3;
- (void)setFailureCode:(int)a3;
- (void)setFailureDescription:(id)a3;
- (void)setGaze:(CMFacePose *)self;
- (void)setGlobalMachtime:(double)a3;
- (void)setLeftEyePosition:(CMFacePose *)self;
- (void)setLocalMachtime:(double)a3;
- (void)setRightEyePosition:(CMFacePose *)self;
- (void)setRoll:(double)a3;
- (void)setSensorCovered:(BOOL)a3;
- (void)setTooDark:(BOOL)a3;
- (void)setTranslation:(CMFacePose *)self;
@end

@implementation CMFacePose

- (double)localMachtime
{
  return self->_localMachtime;
}

- (void)setLocalMachtime:(double)a3
{
  self->_localMachtime = a3;
}

- (double)globalMachtime
{
  return self->_globalMachtime;
}

- (void)setGlobalMachtime:(double)a3
{
  self->_globalMachtime = a3;
}

- (int)failureCode
{
  return self->_failureCode;
}

- (void)setFailureCode:(int)a3
{
  self->_failureCode = a3;
}

- (NSString)failureDescription
{
  return self->_failureDescription;
}

- (void)setFailureDescription:(id)a3
{
  self->_failureDescription = (NSString *)a3;
}

- (BOOL)tooDark
{
  return self->_tooDark;
}

- (void)setTooDark:(BOOL)a3
{
  self->_tooDark = a3;
}

- (BOOL)sensorCovered
{
  return self->_sensorCovered;
}

- (void)setSensorCovered:(BOOL)a3
{
  self->_sensorCovered = a3;
}

- (float)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(float)a3
{
  self->_confidence = a3;
}

- (__n128)translation
{
  return a1[4];
}

- (void)setTranslation:(CMFacePose *)self
{
  *(_OWORD *)self->_translation = v2;
}

- (__n128)rotation
{
  return a1[8];
}

- (__n128)setRotation:(__n128)a3
{
  result[8] = a2;
  result[9] = a3;
  result[10] = a4;
  return result;
}

- (__n128)gaze
{
  return a1[5];
}

- (void)setGaze:(CMFacePose *)self
{
  *(_OWORD *)self->_gaze = v2;
}

- (__n128)leftEyePosition
{
  return a1[6];
}

- (void)setLeftEyePosition:(CMFacePose *)self
{
  *(_OWORD *)self->_leftEyePosition = v2;
}

- (__n128)rightEyePosition
{
  return a1[7];
}

- (void)setRightEyePosition:(CMFacePose *)self
{
  *(_OWORD *)self->_rightEyePosition = v2;
}

- (NSArray)blendShapeWeights
{
  return self->_blendShapeWeights;
}

- (void)setBlendShapeWeights:(id)a3
{
}

- (double)roll
{
  return self->_roll;
}

- (void)setRoll:(double)a3
{
  self->_roll = a3;
}

@end