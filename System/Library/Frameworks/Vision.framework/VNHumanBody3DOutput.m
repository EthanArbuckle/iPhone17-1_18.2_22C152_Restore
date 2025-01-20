@interface VNHumanBody3DOutput
- (ABPKSkeleton)liftedSkeleton;
- (CGSize)inputSize;
- (__n128)cameraIntrinsics;
- (__n128)initWithSkeleton:(__n128)a3 intrinsics:(__n128)a4 inputSize:(double)a5;
@end

@implementation VNHumanBody3DOutput

- (void).cxx_destruct
{
}

- (CGSize)inputSize
{
  double width = self->_inputSize.width;
  double height = self->_inputSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (__n128)cameraIntrinsics
{
  return a1[2];
}

- (ABPKSkeleton)liftedSkeleton
{
  return self->_liftedSkeleton;
}

- (__n128)initWithSkeleton:(__n128)a3 intrinsics:(__n128)a4 inputSize:(double)a5
{
  id v12 = a8;
  v20.receiver = a1;
  v20.super_class = (Class)VNHumanBody3DOutput;
  v13 = [(VNHumanBody3DOutput *)&v20 init];
  v14 = (__n128 *)v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_liftedSkeleton, a8);
    v14[2] = a2;
    v14[3] = a3;
    v14[4] = a4;
    v14[1].n128_f64[0] = a5;
    v14[1].n128_f64[1] = a6;
    v15 = v14;
  }

  return v14;
}

@end