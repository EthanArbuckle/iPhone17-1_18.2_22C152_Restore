@interface ABPKCameraParams
- (ABPKCameraParams)initWithDictionary:(id)a3;
- (ABPKCameraParams)initWithIntrinsics:(__n128)a3 andExtrinsics:(__n128)a4 andDistortion:(__n128)a5;
- (ABPKCameraParams)initWithIntrinsics:(__n128)a3 andExtrinsics:(__n128)a4 andDistortion:(__n128)a5 andInputResolution:(__n128)a6;
- (BOOL)isImageRectified;
- (BOOL)isMatrixIdentity:(int32x4_t)a3;
- (CGSize)inputRes;
- (double)distortion;
- (double)extrinsics;
- (double)intrinsics;
- (id)toDict;
- (int64_t)deviceOrientation;
- (int64_t)deviceType;
- (void)checkAndSetApproximateIntrinsics;
- (void)setDeviceOrientation:(int64_t)a3;
- (void)setDeviceType:(int64_t)a3;
- (void)setDistortion:(ABPKCameraParams *)self;
- (void)setExtrinsics:(__n128)a3;
- (void)setInputRes:(CGSize)a3;
- (void)setIntrinsics:(__n128)a3;
- (void)setIsImageRectified:(BOOL)a3;
@end

@implementation ABPKCameraParams

- (BOOL)isMatrixIdentity:(int32x4_t)a3
{
  return a1.n128_f32[0] == 1.0
      && a1.n128_f32[1] == 0.0
      && a1.n128_f32[2] == 0.0
      && *(float *)a2.i32 == 0.0
      && *(float *)&a2.i32[1] == 1.0
      && (vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vceqq_f32((float32x4_t)vzip1q_s32(a3, vzip2q_s32(a2, a3)), (float32x4_t)xmmword_21B813530)))) & 1) == 0;
}

- (void)checkAndSetApproximateIntrinsics
{
  if (-[ABPKCameraParams isMatrixIdentity:](self, "isMatrixIdentity:", *(double *)self->_anon_40, *(double *)&self->_anon_40[16], *(double *)&self->_anon_40[32]))
  {
    CGSize inputRes = self->_inputRes;
    *(float *)&unsigned int v4 = vmuld_lane_f64(1462.18103, (float64x2_t)inputRes, 1) / 1920.0;
    LODWORD(v5) = 0;
    uint64_t v6 = v4;
    HIDWORD(v5) = v4;
    __asm { FMOV            V1.2D, #0.5 }
    *(_DWORD *)&self->_anon_40[8] = 0;
    *(void *)self->_anon_40 = v6;
    *(_DWORD *)&self->_anon_40[24] = 0;
    *(void *)&self->_anon_40[16] = v5;
    *(_DWORD *)&self->_anon_40[40] = 1065353216;
    *(float32x2_t *)&self->_anon_40[32] = vcvt_f32_f64(vmulq_f64((float64x2_t)inputRes, _Q1));
    v12 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_21B7C6000, v12, OS_LOG_TYPE_DEBUG, " Input intrinsics is identity. Approximate intrinsics: ", v13, 2u);
    }

    printSimd3x3(*(__n128 *)self->_anon_40, *(__n128 *)&self->_anon_40[16], *(__n128 *)&self->_anon_40[32]);
  }
}

- (ABPKCameraParams)initWithIntrinsics:(__n128)a3 andExtrinsics:(__n128)a4 andDistortion:(__n128)a5
{
  v20.receiver = a1;
  v20.super_class = (Class)ABPKCameraParams;
  v9 = [(ABPKCameraParams *)&v20 init];
  v10 = v9;
  if (v9)
  {
    *(__n128 *)v9->_anon_40 = a2;
    *(__n128 *)&v9->_anon_40[16] = a3;
    *(__n128 *)&v9->_anon_40[32] = a4;
    *(__n128 *)&v9[1].super.isa = a5;
    *(__n128 *)&v9[1]._deviceType = a6;
    *(__n128 *)v9[1]._distortion = a7;
    v9[1]._CGSize inputRes = (CGSize)a8;
    *(__n128 *)v9->_distortion = a9;
    v9->_isImageRectified = 0;
    v9->_deviceOrientation = 3;
    [(ABPKCameraParams *)v9 checkAndSetApproximateIntrinsics];
  }
  return v10;
}

- (ABPKCameraParams)initWithIntrinsics:(__n128)a3 andExtrinsics:(__n128)a4 andDistortion:(__n128)a5 andInputResolution:(__n128)a6
{
  v29.receiver = a1;
  v29.super_class = (Class)ABPKCameraParams;
  v18 = [(ABPKCameraParams *)&v29 init];
  v19 = v18;
  if (v18)
  {
    *(__n128 *)v18->_anon_40 = a2;
    *(__n128 *)&v18->_anon_40[16] = a3;
    *(__n128 *)&v18->_anon_40[32] = a4;
    *(__n128 *)&v18[1].super.isa = a5;
    *(__n128 *)&v18[1]._deviceType = a6;
    *(__n128 *)v18[1]._distortion = a7;
    v18[1]._CGSize inputRes = (CGSize)a8;
    *(__n128 *)v18->_distortion = a9;
    v18->_inputRes.width = a10;
    v18->_inputRes.height = a11;
    v18->_isImageRectified = 0;
    v18->_deviceOrientation = 3;
    [(ABPKCameraParams *)v18 checkAndSetApproximateIntrinsics];
  }
  return v19;
}

- (ABPKCameraParams)initWithDictionary:(id)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)ABPKCameraParams;
  uint64_t v5 = [(ABPKCameraParams *)&v41 init];
  if (!v5) {
    goto LABEL_19;
  }
  uint64_t v6 = [v4 objectForKeyedSubscript:@"intrinsics"];
  __n128 v7 = convertNSArrayToSimd3x3(v6);
  *(_DWORD *)&v5->_anon_40[8] = v7.n128_u32[2];
  *(_DWORD *)&v5->_anon_40[24] = v8;
  *(void *)v5->_anon_40 = v7.n128_u64[0];
  *(void *)&v5->_anon_40[16] = v9;
  *(_DWORD *)&v5->_anon_40[40] = v10;
  *(void *)&v5->_anon_40[32] = v11;

  v12 = [v4 objectForKeyedSubscript:@"distortion"];
  *(__n128 *)v5->_distortion = convertNSArrayToSimd4(v12);

  v13 = [v4 objectForKeyedSubscript:@"resolution"];
  v14 = [v13 objectAtIndexedSubscript:0];
  uint64_t v15 = [v14 integerValue];
  v16 = [v4 objectForKeyedSubscript:@"resolution"];
  v17 = [v16 objectAtIndexedSubscript:1];
  uint64_t v18 = [v17 integerValue];
  v5->_inputRes.width = (double)v15;
  v5->_inputRes.height = (double)v18;

  v19 = [v4 objectForKeyedSubscript:@"extrinsics"];
  *(__n128 *)&v5[1].super.isa = convertNSMatToSimd4x4(v19);
  *(_OWORD *)&v5[1]._deviceType = v20;
  *(_OWORD *)v5[1]._distortion = v21;
  v5[1]._CGSize inputRes = v22;

  v23 = [v4 objectForKeyedSubscript:@"is_image_rectified"];
  LOBYTE(v15) = v23 == 0;

  if (v15)
  {
    v5->_BOOL isImageRectified = 0;
    v25 = __ABPKLogSharedInstance();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_8;
    }
    *(_WORD *)buf = 0;
    v27 = " Image rectification type not specified. Setting Default to fisheye distortion ";
    v28 = v25;
    uint32_t v29 = 2;
  }
  else
  {
    v24 = [v4 objectForKeyedSubscript:@"is_image_rectified"];
    v5->_BOOL isImageRectified = [v24 BOOLValue];

    v25 = __ABPKLogSharedInstance();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_8;
    }
    BOOL isImageRectified = v5->_isImageRectified;
    *(_DWORD *)buf = 67109120;
    BOOL v43 = isImageRectified;
    v27 = " Recorded data is rectified: %d ";
    v28 = v25;
    uint32_t v29 = 8;
  }
  _os_log_impl(&dword_21B7C6000, v28, OS_LOG_TYPE_DEBUG, v27, buf, v29);
LABEL_8:

  v30 = [v4 objectForKeyedSubscript:@"device_orientation"];
  BOOL v31 = v30 == 0;

  if (v31)
  {
    v5->_deviceOrientation = 3;
    v34 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      v35 = " Device orientation not specified. Setting Default to landscape ";
      goto LABEL_17;
    }
LABEL_18:

    [(ABPKCameraParams *)v5 checkAndSetApproximateIntrinsics];
LABEL_19:
    v38 = v5;
    goto LABEL_20;
  }
  v32 = [v4 objectForKeyedSubscript:@"device_orientation"];
  int v33 = [v32 isEqualToString:@"landscape"];

  if (v33)
  {
    v5->_deviceOrientation = 3;
    v34 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      v35 = " Recorded sequence with landscape orientation ";
LABEL_17:
      _os_log_impl(&dword_21B7C6000, v34, OS_LOG_TYPE_DEBUG, v35, buf, 2u);
      goto LABEL_18;
    }
    goto LABEL_18;
  }
  v36 = [v4 objectForKeyedSubscript:@"device_orientation"];
  int v37 = [v36 isEqualToString:@"portrait"];

  if (v37)
  {
    v5->_deviceOrientation = 1;
    v34 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      v35 = " Recorded sequence with portrait orientation ";
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  v40 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21B7C6000, v40, OS_LOG_TYPE_ERROR, " Invalid device orientation type specified. Exit ", buf, 2u);
  }

  v38 = 0;
LABEL_20:

  return v38;
}

- (id)toDict
{
  v24[2] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [(ABPKCameraParams *)self intrinsics];
  __n128 v7 = simdMatrix3x3ToNSMat(v4, v5, v6);
  [v3 setObject:v7 forKey:@"intrinsics"];

  [(ABPKCameraParams *)self extrinsics];
  v12 = simdMatrix4x4ToNSMat(v8, v9, v10, v11);
  [v3 setObject:v12 forKey:@"extrinsics"];

  [(ABPKCameraParams *)self distortion];
  v14 = simdFloat4ToNSArray(v13);
  [v3 setObject:v14 forKey:@"distortion"];

  uint64_t v15 = NSNumber;
  [(ABPKCameraParams *)self inputRes];
  v17 = [v15 numberWithDouble:v16];
  v24[0] = v17;
  uint64_t v18 = NSNumber;
  [(ABPKCameraParams *)self inputRes];
  v19 = objc_msgSend(v18, "numberWithDouble:");
  v24[1] = v19;
  long long v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:2];
  [v3 setObject:v20 forKey:@"resolution"];

  long long v21 = objc_msgSend(NSNumber, "numberWithBool:", -[ABPKCameraParams isImageRectified](self, "isImageRectified"));
  [v3 setObject:v21 forKey:@"is_image_rectified"];

  if ([(ABPKCameraParams *)self deviceOrientation] == 3)
  {
    CGSize v22 = @"landscape";
  }
  else if ([(ABPKCameraParams *)self deviceOrientation] == 1)
  {
    CGSize v22 = @"portrait";
  }
  else
  {
    CGSize v22 = @"invalid";
  }
  [v3 setObject:v22 forKey:@"device_orientation"];
  return v3;
}

- (double)intrinsics
{
  objc_copyStruct(&v2, (const void *)(a1 + 64), 48, 1, 0);
  return *(double *)&v2;
}

- (void)setIntrinsics:(__n128)a3
{
  v4[0] = a2;
  v4[1] = a3;
  v4[2] = a4;
  objc_copyStruct((void *)(a1 + 64), v4, 48, 1, 0);
}

- (double)extrinsics
{
  objc_copyStruct(&v2, (const void *)(a1 + 112), 64, 1, 0);
  return *(double *)&v2;
}

- (void)setExtrinsics:(__n128)a3
{
  v5[0] = a2;
  v5[1] = a3;
  v5[2] = a4;
  v5[3] = a5;
  objc_copyStruct((void *)(a1 + 112), v5, 64, 1, 0);
}

- (double)distortion
{
  objc_copyStruct(&v2, (const void *)(a1 + 32), 16, 1, 0);
  return *(double *)&v2;
}

- (void)setDistortion:(ABPKCameraParams *)self
{
  long long v3 = v2;
  objc_copyStruct(self->_distortion, &v3, 16, 1, 0);
}

- (CGSize)inputRes
{
  objc_copyStruct(v4, &self->_inputRes, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setInputRes:(CGSize)a3
{
  CGSize v3 = a3;
  objc_copyStruct(&self->_inputRes, &v3, 16, 1, 0);
}

- (int64_t)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(int64_t)a3
{
  self->_deviceType = a3;
}

- (BOOL)isImageRectified
{
  return self->_isImageRectified;
}

- (void)setIsImageRectified:(BOOL)a3
{
  self->_BOOL isImageRectified = a3;
}

- (int64_t)deviceOrientation
{
  return self->_deviceOrientation;
}

- (void)setDeviceOrientation:(int64_t)a3
{
  self->_deviceOrientation = a3;
}

@end