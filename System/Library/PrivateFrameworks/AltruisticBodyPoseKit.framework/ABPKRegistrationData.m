@interface ABPKRegistrationData
- (ABPKRegistrationData)initWithImagePoints:(ABPKRegistrationData *)self imagePointsCount:(SEL)a2 jointsLifted3D:jointsLifted3DCount:cameraIntrinsics:imageDimensions:cameraFromBodyPose:registrationValid:;
- (BOOL)registrationValid;
- (CGSize)imageDimensions;
- (__n128)cameraFromBodyPose;
- (__n128)cameraIntrinsics;
- (id).cxx_construct;
- (uint64_t)imagePoints;
- (uint64_t)jointsLifted3D;
- (unint64_t)imagePointsCount;
- (unint64_t)jointsLifted3DCount;
@end

@implementation ABPKRegistrationData

- (ABPKRegistrationData)initWithImagePoints:(ABPKRegistrationData *)self imagePointsCount:(SEL)a2 jointsLifted3D:jointsLifted3DCount:cameraIntrinsics:imageDimensions:cameraFromBodyPose:registrationValid:
{
  BOOL v12 = v6;
  unint64_t v13 = v5;
  v14 = v4;
  unint64_t v15 = v3;
  CGFloat v16 = v11;
  CGFloat v17 = v10;
  long long v29 = v8;
  long long v30 = v9;
  long long v28 = v7;
  v18 = v2;
  v33.receiver = self;
  v33.super_class = (Class)ABPKRegistrationData;
  v19 = [(ABPKRegistrationData *)&v33 init];
  v20 = v19;
  if (v19)
  {
    v19->_imagePointsCount = v15;
    long long v31 = 0uLL;
    uint64_t v32 = 0;
    _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPKS1_S7_EEvT_T0_m(&v31, v18, (uint64_t)v18 + 8 * v15, v15);
    var0 = v20->_imagePointsVector.var0;
    if (var0)
    {
      *(void *)v20->_anon_10 = var0;
      operator delete(var0);
      v20->_imagePointsVector.var0 = 0;
      *(void *)v20->_anon_10 = 0;
      *(void *)&v20->_anon_10[8] = 0;
    }
    *(_OWORD *)&v20->_imagePointsVector.var0 = v31;
    *(void *)&v20->_anon_10[8] = v32;
    v20->_jointsLifted3DCount = v13;
    long long v31 = 0uLL;
    uint64_t v32 = 0;
    _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPKS1_S7_EEvT_T0_m(&v31, v14, (uint64_t)v14 + 16 * v13, v13);
    long long v22 = v34;
    long long v23 = v35;
    long long v24 = v36;
    long long v25 = v37;
    v26 = v20->_jointsLifted3DVector.var0;
    if (v26)
    {
      *(void *)v20->_anon_28 = v26;
      operator delete(v26);
      long long v25 = v37;
      long long v24 = v36;
      long long v23 = v35;
      long long v22 = v34;
      v20->_jointsLifted3DVector.var0 = 0;
      *(void *)v20->_anon_28 = 0;
      *(void *)&v20->_anon_28[8] = 0;
    }
    *(_OWORD *)&v20->_jointsLifted3DVector.var0 = v31;
    *(void *)&v20->_anon_28[8] = v32;
    *(_OWORD *)v20->_anon_60 = v28;
    *(_OWORD *)&v20->_anon_60[16] = v29;
    v20->_imageDimensions.width = v17;
    v20->_imageDimensions.height = v16;
    *(_OWORD *)&v20->_anon_60[32] = v30;
    *(_OWORD *)&v20[1].super.isa = v22;
    *(_OWORD *)v20[1]._anon_10 = v23;
    *(_OWORD *)&v20[1]._jointsLifted3DVector.var0 = v24;
    *(_OWORD *)&v20[1]._anon_28[8] = v25;
    v20->_registrationValid = v12;
  }
  return v20;
}

- (uint64_t)imagePoints
{
  return *(void *)(a1 + 8);
}

- (uint64_t)jointsLifted3D
{
  return *(void *)(a1 + 32);
}

- (unint64_t)imagePointsCount
{
  return self->_imagePointsCount;
}

- (unint64_t)jointsLifted3DCount
{
  return self->_jointsLifted3DCount;
}

- (__n128)cameraIntrinsics
{
  return a1[6];
}

- (CGSize)imageDimensions
{
  double width = self->_imageDimensions.width;
  double height = self->_imageDimensions.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (__n128)cameraFromBodyPose
{
  return a1[9];
}

- (BOOL)registrationValid
{
  return self->_registrationValid;
}

- (void).cxx_destruct
{
  var0 = self->_jointsLifted3DVector.var0;
  if (var0)
  {
    *(void *)self->_anon_28 = var0;
    operator delete(var0);
  }
  v4 = self->_imagePointsVector.var0;
  if (v4)
  {
    *(void *)self->_anon_10 = v4;
    operator delete(v4);
  }
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end