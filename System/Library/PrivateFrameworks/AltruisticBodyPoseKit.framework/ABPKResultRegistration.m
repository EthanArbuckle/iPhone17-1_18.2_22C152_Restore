@interface ABPKResultRegistration
- (BOOL)success;
- (CGSize)imageSize;
- (__n128)cameraFromBodyPose;
- (__n128)distortion;
- (__n128)intrinsics;
- (__n128)setCameraFromBodyPose:(__n128)a3;
- (__n128)setIntrinsics:(__n128)a3;
- (uint64_t)joints2d;
- (uint64_t)joints3dWrtBody;
- (uint64_t)joints3dWrtCamera;
- (void)setDistortion:(ABPKResultRegistration *)self;
- (void)setImageSize:(CGSize)a3;
- (void)setJoints2d:(ABPKResultRegistration *)self;
- (void)setJoints3dWrtBody:(ABPKResultRegistration *)self;
- (void)setJoints3dWrtCamera:(ABPKResultRegistration *)self;
- (void)setSuccess:(BOOL)a3;
@end

@implementation ABPKResultRegistration

- (BOOL)success
{
  return self->_success;
}

- (void)setSuccess:(BOOL)a3
{
  self->_success = a3;
}

- (uint64_t)joints2d
{
  return *(void *)(a1 + 16);
}

- (void)setJoints2d:(ABPKResultRegistration *)self
{
  *(void *)&self->_joints2d[7] = v2;
}

- (uint64_t)joints3dWrtBody
{
  return *(void *)(a1 + 24);
}

- (void)setJoints3dWrtBody:(ABPKResultRegistration *)self
{
  *(void *)&self->_joints3dWrtBody[7] = v2;
}

- (uint64_t)joints3dWrtCamera
{
  return *(void *)(a1 + 32);
}

- (void)setJoints3dWrtCamera:(ABPKResultRegistration *)self
{
  *(void *)&self->_joints3dWrtCamera[7] = v2;
}

- (__n128)intrinsics
{
  return a1[5];
}

- (__n128)setIntrinsics:(__n128)a3
{
  result[5] = a2;
  result[6] = a3;
  result[7] = a4;
  return result;
}

- (__n128)distortion
{
  return a1[3];
}

- (void)setDistortion:(ABPKResultRegistration *)self
{
  *(_OWORD *)&self->_distortion[7] = v2;
}

- (CGSize)imageSize
{
  double width = self->_imageSize.width;
  double height = self->_imageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setImageSize:(CGSize)a3
{
  self->_imageSize = a3;
}

- (__n128)cameraFromBodyPose
{
  return a1[8];
}

- (__n128)setCameraFromBodyPose:(__n128)a3
{
  result[8] = a2;
  result[9] = a3;
  result[10] = a4;
  result[11] = a5;
  return result;
}

@end