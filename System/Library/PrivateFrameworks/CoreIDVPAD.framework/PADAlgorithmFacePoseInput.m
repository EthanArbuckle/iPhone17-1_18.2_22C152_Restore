@interface PADAlgorithmFacePoseInput
- (NSArray)faceprint;
- (NSArray)landmarks;
- (double)pitch;
- (double)roll;
- (double)smile;
- (double)yaw;
- (void)setFaceprint:(id)a3;
- (void)setLandmarks:(id)a3;
- (void)setPitch:(double)a3;
- (void)setRoll:(double)a3;
- (void)setSmile:(double)a3;
- (void)setYaw:(double)a3;
@end

@implementation PADAlgorithmFacePoseInput

- (double)pitch
{
  return self->_pitch;
}

- (void)setPitch:(double)a3
{
  self->_pitch = a3;
}

- (double)yaw
{
  return self->_yaw;
}

- (void)setYaw:(double)a3
{
  self->_yaw = a3;
}

- (double)roll
{
  return self->_roll;
}

- (void)setRoll:(double)a3
{
  self->_roll = a3;
}

- (double)smile
{
  return self->_smile;
}

- (void)setSmile:(double)a3
{
  self->_smile = a3;
}

- (NSArray)landmarks
{
  return self->_landmarks;
}

- (void)setLandmarks:(id)a3
{
}

- (NSArray)faceprint
{
  return self->_faceprint;
}

- (void)setFaceprint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceprint, 0);
  objc_storeStrong((id *)&self->_landmarks, 0);
}

@end