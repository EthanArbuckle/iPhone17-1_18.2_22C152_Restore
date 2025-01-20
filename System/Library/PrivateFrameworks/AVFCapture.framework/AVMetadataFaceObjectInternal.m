@interface AVMetadataFaceObjectInternal
- (BOOL)hasConfidence;
- (BOOL)hasDistance;
- (BOOL)hasLeftEyeBounds;
- (BOOL)hasLeftEyeClosedConfidence;
- (BOOL)hasOrientation;
- (BOOL)hasPayingAttention;
- (BOOL)hasPayingAttentionConfidence;
- (BOOL)hasPitchAngle;
- (BOOL)hasRightEyeBounds;
- (BOOL)hasRightEyeClosedConfidence;
- (BOOL)hasRollAngle;
- (BOOL)hasSmileConfidence;
- (BOOL)hasYawAngle;
- (BOOL)payingAttention;
- (CGRect)leftEyeBounds;
- (CGRect)rightEyeBounds;
- (double)confidence;
- (double)distance;
- (double)payingAttentionConfidence;
- (double)pitchAngle;
- (double)rollAngle;
- (double)yawAngle;
- (int)leftEyeClosedConfidence;
- (int)rightEyeClosedConfidence;
- (int)smileConfidence;
- (int64_t)faceID;
- (unint64_t)orientation;
- (void)setConfidence:(double)a3;
- (void)setDistance:(double)a3;
- (void)setFaceID:(int64_t)a3;
- (void)setHasConfidence:(BOOL)a3;
- (void)setHasDistance:(BOOL)a3;
- (void)setHasLeftEyeBounds:(BOOL)a3;
- (void)setHasLeftEyeClosedConfidence:(BOOL)a3;
- (void)setHasOrientation:(BOOL)a3;
- (void)setHasPayingAttention:(BOOL)a3;
- (void)setHasPayingAttentionConfidence:(BOOL)a3;
- (void)setHasPitchAngle:(BOOL)a3;
- (void)setHasRightEyeBounds:(BOOL)a3;
- (void)setHasRightEyeClosedConfidence:(BOOL)a3;
- (void)setHasRollAngle:(BOOL)a3;
- (void)setHasSmileConfidence:(BOOL)a3;
- (void)setHasYawAngle:(BOOL)a3;
- (void)setLeftEyeBounds:(CGRect)a3;
- (void)setLeftEyeClosedConfidence:(int)a3;
- (void)setOrientation:(unint64_t)a3;
- (void)setPayingAttention:(BOOL)a3;
- (void)setPayingAttentionConfidence:(double)a3;
- (void)setPitchAngle:(double)a3;
- (void)setRightEyeBounds:(CGRect)a3;
- (void)setRightEyeClosedConfidence:(int)a3;
- (void)setRollAngle:(double)a3;
- (void)setSmileConfidence:(int)a3;
- (void)setYawAngle:(double)a3;
@end

@implementation AVMetadataFaceObjectInternal

- (int64_t)faceID
{
  return self->_faceID;
}

- (void)setFaceID:(int64_t)a3
{
  self->_faceID = a3;
}

- (BOOL)hasRollAngle
{
  return self->_hasRollAngle;
}

- (void)setHasRollAngle:(BOOL)a3
{
  self->_hasRollAngle = a3;
}

- (double)rollAngle
{
  return self->_rollAngle;
}

- (void)setRollAngle:(double)a3
{
  self->_rollAngle = a3;
}

- (BOOL)hasYawAngle
{
  return self->_hasYawAngle;
}

- (void)setHasYawAngle:(BOOL)a3
{
  self->_hasYawAngle = a3;
}

- (double)yawAngle
{
  return self->_yawAngle;
}

- (void)setYawAngle:(double)a3
{
  self->_yawAngle = a3;
}

- (BOOL)hasPitchAngle
{
  return self->_hasPitchAngle;
}

- (void)setHasPitchAngle:(BOOL)a3
{
  self->_hasPitchAngle = a3;
}

- (double)pitchAngle
{
  return self->_pitchAngle;
}

- (void)setPitchAngle:(double)a3
{
  self->_pitchAngle = a3;
}

- (BOOL)hasLeftEyeClosedConfidence
{
  return self->_hasLeftEyeClosedConfidence;
}

- (void)setHasLeftEyeClosedConfidence:(BOOL)a3
{
  self->_hasLeftEyeClosedConfidence = a3;
}

- (int)leftEyeClosedConfidence
{
  return self->_leftEyeClosedConfidence;
}

- (void)setLeftEyeClosedConfidence:(int)a3
{
  self->_leftEyeClosedConfidence = a3;
}

- (BOOL)hasRightEyeClosedConfidence
{
  return self->_hasRightEyeClosedConfidence;
}

- (void)setHasRightEyeClosedConfidence:(BOOL)a3
{
  self->_hasRightEyeClosedConfidence = a3;
}

- (int)rightEyeClosedConfidence
{
  return self->_rightEyeClosedConfidence;
}

- (void)setRightEyeClosedConfidence:(int)a3
{
  self->_rightEyeClosedConfidence = a3;
}

- (BOOL)hasSmileConfidence
{
  return self->_hasSmileConfidence;
}

- (void)setHasSmileConfidence:(BOOL)a3
{
  self->_hasSmileConfidence = a3;
}

- (int)smileConfidence
{
  return self->_smileConfidence;
}

- (void)setSmileConfidence:(int)a3
{
  self->_smileConfidence = a3;
}

- (BOOL)hasLeftEyeBounds
{
  return self->_hasLeftEyeBounds;
}

- (void)setHasLeftEyeBounds:(BOOL)a3
{
  self->_hasLeftEyeBounds = a3;
}

- (CGRect)leftEyeBounds
{
  double x = self->_leftEyeBounds.origin.x;
  double y = self->_leftEyeBounds.origin.y;
  double width = self->_leftEyeBounds.size.width;
  double height = self->_leftEyeBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setLeftEyeBounds:(CGRect)a3
{
  self->_leftEyeBounds = a3;
}

- (BOOL)hasRightEyeBounds
{
  return self->_hasRightEyeBounds;
}

- (void)setHasRightEyeBounds:(BOOL)a3
{
  self->_hasRightEyeBounds = a3;
}

- (CGRect)rightEyeBounds
{
  double x = self->_rightEyeBounds.origin.x;
  double y = self->_rightEyeBounds.origin.y;
  double width = self->_rightEyeBounds.size.width;
  double height = self->_rightEyeBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setRightEyeBounds:(CGRect)a3
{
  self->_rightEyeBounds = a3;
}

- (BOOL)hasConfidence
{
  return self->_hasConfidence;
}

- (void)setHasConfidence:(BOOL)a3
{
  self->_hasConfidence = a3;
}

- (double)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(double)a3
{
  self->_confidence = a3;
}

- (BOOL)hasPayingAttention
{
  return self->_hasPayingAttention;
}

- (void)setHasPayingAttention:(BOOL)a3
{
  self->_hasPayingAttention = a3;
}

- (BOOL)payingAttention
{
  return self->_payingAttention;
}

- (void)setPayingAttention:(BOOL)a3
{
  self->_payingAttention = a3;
}

- (BOOL)hasPayingAttentionConfidence
{
  return self->_hasPayingAttentionConfidence;
}

- (void)setHasPayingAttentionConfidence:(BOOL)a3
{
  self->_hasPayingAttentionConfidence = a3;
}

- (double)payingAttentionConfidence
{
  return self->_payingAttentionConfidence;
}

- (void)setPayingAttentionConfidence:(double)a3
{
  self->_payingAttentionConfidence = a3;
}

- (BOOL)hasDistance
{
  return self->_hasDistance;
}

- (void)setHasDistance:(BOOL)a3
{
  self->_hasDistance = a3;
}

- (double)distance
{
  return self->_distance;
}

- (void)setDistance:(double)a3
{
  self->_distance = a3;
}

- (BOOL)hasOrientation
{
  return self->_hasOrientation;
}

- (void)setHasOrientation:(BOOL)a3
{
  self->_hasOrientation = a3;
}

- (unint64_t)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(unint64_t)a3
{
  self->_orientation = a3;
}

@end