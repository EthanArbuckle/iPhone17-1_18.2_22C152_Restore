@interface OUCamera
- (CGSize)imageResolution;
- (__n128)intrinsics;
- (__n128)pose;
- (__n128)setIntrinsics:(__n128)a3;
- (__n128)setPose:(__n128)a3;
- (__n128)setTransform:(__n128)a3;
- (__n128)transform;
- (void)setImageResolution:(CGSize)a3;
@end

@implementation OUCamera

- (__n128)transform
{
  return a1[1];
}

- (__n128)setTransform:(__n128)a3
{
  result[1] = a2;
  result[2] = a3;
  result[3] = a4;
  result[4] = a5;
  return result;
}

- (__n128)pose
{
  return a1[5];
}

- (__n128)setPose:(__n128)a3
{
  result[5] = a2;
  result[6] = a3;
  result[7] = a4;
  result[8] = a5;
  return result;
}

- (__n128)intrinsics
{
  return a1[9];
}

- (__n128)setIntrinsics:(__n128)a3
{
  result[9] = a2;
  result[10] = a3;
  result[11] = a4;
  return result;
}

- (CGSize)imageResolution
{
  double v2 = *(double *)self->imageResolution;
  double v3 = *(double *)&self->imageResolution[8];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setImageResolution:(CGSize)a3
{
  *(CGSize *)self->imageResolution = a3;
}

@end