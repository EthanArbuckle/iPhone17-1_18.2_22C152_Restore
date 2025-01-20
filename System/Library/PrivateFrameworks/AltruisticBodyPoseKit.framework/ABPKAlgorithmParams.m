@interface ABPKAlgorithmParams
- (ABPK2DDetectionConfiguration)config2DDetection;
- (CGSize)regImageResolution;
- (__n128)initWithRegIntrinsics:(__n128)a3 regImageResolution:(__n128)a4;
- (double)regIntrinsics;
- (id)toDict;
- (void)setConfig2DDetection:(id)a3;
- (void)setRegImageResolution:(CGSize)a3;
- (void)setRegIntrinsics:(__n128)a3;
@end

@implementation ABPKAlgorithmParams

- (__n128)initWithRegIntrinsics:(__n128)a3 regImageResolution:(__n128)a4
{
  v13.receiver = a1;
  v13.super_class = (Class)ABPKAlgorithmParams;
  v8 = [(ABPKAlgorithmParams *)&v13 init];
  *(__n128 *)&v8[1].super.isa = a2;
  v8[1]._regImageResolution = (CGSize)a3;
  __n128 result = a4;
  *(__n128 *)&v8[2].super.isa = a4;
  v8->_regImageResolution.width = a5;
  v8->_regImageResolution.height = a6;
  return result;
}

- (id)toDict
{
  v15[2] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [(ABPKAlgorithmParams *)self regIntrinsics];
  v7 = simdMatrix3x3ToNSMat(v4, v5, v6);
  [v3 setObject:v7 forKey:@"reg_intrinsics"];

  v8 = NSNumber;
  [(ABPKAlgorithmParams *)self regImageResolution];
  v10 = [v8 numberWithDouble:v9];
  v15[0] = v10;
  v11 = NSNumber;
  [(ABPKAlgorithmParams *)self regImageResolution];
  v12 = objc_msgSend(v11, "numberWithDouble:");
  v15[1] = v12;
  objc_super v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:2];
  [v3 setObject:v13 forKey:@"reg_image_resolution"];

  return v3;
}

- (double)regIntrinsics
{
  objc_copyStruct(&v2, (const void *)(a1 + 32), 48, 1, 0);
  return *(double *)&v2;
}

- (void)setRegIntrinsics:(__n128)a3
{
  v4[0] = a2;
  v4[1] = a3;
  v4[2] = a4;
  objc_copyStruct((void *)(a1 + 32), v4, 48, 1, 0);
}

- (CGSize)regImageResolution
{
  objc_copyStruct(v4, &self->_regImageResolution, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setRegImageResolution:(CGSize)a3
{
  CGSize v3 = a3;
  objc_copyStruct(&self->_regImageResolution, &v3, 16, 1, 0);
}

- (ABPK2DDetectionConfiguration)config2DDetection
{
  return (ABPK2DDetectionConfiguration *)objc_getProperty(self, a2, 8, 1);
}

- (void)setConfig2DDetection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end