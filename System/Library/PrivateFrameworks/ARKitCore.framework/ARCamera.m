@interface ARCamera
+ (BOOL)supportsSecureCoding;
- (ARCamera)init;
- (ARCamera)initWithCoder:(id)a3;
- (ARCamera)initWithIntrinsics:(__n128)a3 imageResolution:(__n128)a4 devicePosition:(CGFloat)a5 lensType:(CGFloat)a6 radialDistortion:(__n128)a7 tangentialDistortion:(double)a8 exposureDuration:(uint64_t)a9 calibrationData:(int64_t)a10 extrinsicsMap:(unint64_t)a11 captureLens:(long long *)a12;
- (ARTrackingState)trackingState;
- (ARTrackingStateReason)trackingStateReason;
- (AVCameraCalibrationData)calibrationData;
- (BOOL)isEqual:(id)a3;
- (CGPoint)focalLength;
- (CGPoint)principalPoint;
- (CGPoint)projectPoint:(simd_float3)point orientation:(UIInterfaceOrientation)orientation viewportSize:(CGSize)viewportSize;
- (CGSize)imageResolution;
- (NSDictionary)extrinsicsMap;
- (NSTimeInterval)exposureDuration;
- (__n128)extrinsicMatrix4x4ToDeviceType:(uint64_t)a1;
- (__n128)radialDistortion;
- (__n128)setIntrinsics:(__n128)a3;
- (__n128)setTransform:(__n128)a3;
- (__n128)tangentialDistortion;
- (double)displayCenterTransform;
- (double)extrinsicMatrixToDeviceType:(void *)a1;
- (float)exposureOffset;
- (id)_description:(BOOL)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugQuickLookObject;
- (id)description;
- (id)initFromImageData:(id)a3;
- (int64_t)devicePosition;
- (simd_float3)eulerAngles;
- (simd_float3)unprojectPoint:(CGPoint)point ontoPlaneWithTransform:(simd_float4x4)planeTransform orientation:(UIInterfaceOrientation)orientation viewportSize:(CGSize)viewportSize;
- (simd_float3x3)intrinsics;
- (simd_float4x4)projectionMatrix;
- (simd_float4x4)projectionMatrixForOrientation:(UIInterfaceOrientation)orientation viewportSize:(CGSize)viewportSize zNear:(CGFloat)zNear zFar:(CGFloat)zFar;
- (simd_float4x4)transform;
- (simd_float4x4)viewMatrixForOrientation:(UIInterfaceOrientation)orientation;
- (uint64_t)initWithIntrinsics:(double)a3 imageResolution:(double)a4;
- (unint64_t)captureLens;
- (unint64_t)lensType;
- (void)encodeWithCoder:(id)a3;
- (void)setCalibrationData:(id)a3;
- (void)setCaptureLens:(unint64_t)a3;
- (void)setDevicePosition:(int64_t)a3;
- (void)setExposureDuration:(double)a3;
- (void)setExposureOffset:(float)a3;
- (void)setExtrinsicsMap:(id)a3;
- (void)setImageResolution:(CGSize)a3;
- (void)setLensType:(unint64_t)a3;
- (void)setRadialDistortion:(ARCamera *)self;
- (void)setTangentialDistortion:(ARCamera *)self;
- (void)setTrackingState:(int64_t)a3;
- (void)setTrackingStateReason:(int64_t)a3;
@end

@implementation ARCamera

- (ARCamera)init
{
  return -[ARCamera initWithIntrinsics:imageResolution:](self, "initWithIntrinsics:imageResolution:", *MEMORY[0x1E4F14998], *(double *)(MEMORY[0x1E4F14998] + 16), *(double *)(MEMORY[0x1E4F14998] + 32), *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
}

- (uint64_t)initWithIntrinsics:(double)a3 imageResolution:(double)a4
{
  v9 = objc_opt_new();
  memset(v15, 0, sizeof(v15));
  uint64_t v10 = objc_msgSend(a1, "initWithIntrinsics:imageResolution:devicePosition:lensType:radialDistortion:tangentialDistortion:exposureDuration:calibrationData:extrinsicsMap:captureLens:", 0, 0, v15, 0, v9, 0, a2, a3, a4, a5, a6, 0.0, 0.0);

  return v10;
}

- (ARCamera)initWithIntrinsics:(__n128)a3 imageResolution:(__n128)a4 devicePosition:(CGFloat)a5 lensType:(CGFloat)a6 radialDistortion:(__n128)a7 tangentialDistortion:(double)a8 exposureDuration:(uint64_t)a9 calibrationData:(int64_t)a10 extrinsicsMap:(unint64_t)a11 captureLens:(long long *)a12
{
  long long v37 = a12[1];
  long long v35 = *a12;
  id v24 = a13;
  id v25 = a14;
  v40.receiver = a1;
  v40.super_class = (Class)ARCamera;
  v26 = [(ARCamera *)&v40 init];
  v27 = v26;
  if (v26)
  {
    v26->_imageResolution.width = a5;
    v26->_imageResolution.height = a6;
    *(__n128 *)&v26->_anon_90[16] = a3;
    *(__n128 *)&v26->_anon_90[32] = a4;
    v26->_lensType = a11;
    v26->_devicePosition = a10;
    *(_OWORD *)&v26->_radialDistortion[16] = v37;
    *(__n128 *)v26->_anon_90 = a2;
    *(__n128 *)v26->_tangentialDistortion = a7;
    *(_OWORD *)v26->_radialDistortion = v35;
    v26->_exposureDuration = a8;
    objc_storeStrong((id *)&v26->_calibrationData, a13);
    uint64_t v28 = [v25 copy];
    extrinsicsMap = v27->_extrinsicsMap;
    v27->_extrinsicsMap = (NSDictionary *)v28;

    uint64_t v30 = MEMORY[0x1E4F149A0];
    long long v31 = *(_OWORD *)(MEMORY[0x1E4F149A0] + 16);
    *(_OWORD *)&v27[1].super.isa = *MEMORY[0x1E4F149A0];
    *(_OWORD *)&v27[1]._trackingState = v31;
    long long v32 = *(_OWORD *)(v30 + 48);
    *(_OWORD *)&v27[1]._exposureDuration = *(_OWORD *)(v30 + 32);
    *(_OWORD *)&v27[1]._lensType = v32;
    v27->_trackingState = 0;
    v27->_trackingStateReason = 0;
    v27->_captureLens = a15;
  }

  return v27;
}

- (ARCamera)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(ARCamera *)self init];
  if (v5)
  {
    [v4 decodeSizeForKey:@"imageResolution"];
    v5->_imageResolution.width = v6;
    v5->_imageResolution.height = v7;
    [v4 decodeDoubleForKey:@"exposureDuration"];
    v5->_exposureDuration = v8;
    [v4 decodeFloatForKey:@"exposureOffset"];
    v5->_exposureOffset = v9;
    objc_msgSend(v4, "ar_decodeMatrix3x3ForKey:", @"intrinsics");
    *(_DWORD *)&v5->_anon_90[8] = v10;
    *(void *)v5->_anon_90 = v11;
    *(_DWORD *)&v5->_anon_90[24] = v12;
    *(void *)&v5->_anon_90[16] = v13;
    *(_DWORD *)&v5->_anon_90[40] = v14;
    *(void *)&v5->_anon_90[32] = v15;
    v5->_lensType = 0;
    objc_msgSend(v4, "ar_decodeMatrix4x4ForKey:", @"transform");
    *(_OWORD *)&v5[1].super.isa = v16;
    *(_OWORD *)&v5[1]._trackingState = v17;
    *(_OWORD *)&v5[1]._exposureDuration = v18;
    *(_OWORD *)&v5[1]._lensType = v19;
    v5->_trackingState = [v4 decodeIntegerForKey:@"trackingState"];
    v5->_trackingStateReason = [v4 decodeIntegerForKey:@"trackingStateReason"];
    v20 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v21 = objc_opt_class();
    uint64_t v22 = objc_opt_class();
    v23 = objc_msgSend(v20, "setWithObjects:", v21, v22, objc_opt_class(), 0);
    uint64_t v24 = [v4 decodeObjectOfClasses:v23 forKey:@"extrinsicsMap"];
    extrinsicsMap = v5->_extrinsicsMap;
    v5->_extrinsicsMap = (NSDictionary *)v24;

    v5->_captureLens = [v4 decodeIntegerForKey:@"captureLens"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double width = self->_imageResolution.width;
  double height = self->_imageResolution.height;
  id v7 = a3;
  objc_msgSend(v7, "encodeSize:forKey:", @"imageResolution", width, height);
  [v7 encodeDouble:@"exposureDuration" forKey:self->_exposureDuration];
  *(float *)&double v6 = self->_exposureOffset;
  [v7 encodeFloat:@"exposureOffset" forKey:v6];
  objc_msgSend(v7, "ar_encodeMatrix3x3:forKey:", @"intrinsics", *(double *)self->_anon_90, *(double *)&self->_anon_90[16], *(double *)&self->_anon_90[32]);
  objc_msgSend(v7, "ar_encodeMatrix4x4:forKey:", @"transform", *(double *)&self[1].super.isa, *(double *)&self[1]._trackingState, self[1]._exposureDuration, *(double *)&self[1]._lensType);
  [v7 encodeInteger:self->_trackingState forKey:@"trackingState"];
  [v7 encodeInteger:self->_trackingStateReason forKey:@"trackingStateReason"];
  [v7 encodeObject:self->_extrinsicsMap forKey:@"extrinsicsMap"];
  [v7 encodeInteger:self->_captureLens forKey:@"captureLens"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (simd_float3)eulerAngles
{
  [(ARCamera *)self transform];
  *(double *)result.i64 = AREulerAnglesFromMatrix(v2, v3, v4);
  return result;
}

- (CGPoint)focalLength
{
  double v2 = *(float *)self->_anon_90;
  double v3 = *(float *)&self->_anon_90[20];
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)principalPoint
{
  float64x2_t v2 = vcvtq_f64_f32(*(float32x2_t *)&self->_anon_90[32]);
  double v3 = v2.f64[1];
  result.x = v2.f64[0];
  result.y = v3;
  return result;
}

- (double)displayCenterTransform
{
  uint64_t v1 = [a1 devicePosition];
  *(void *)&double result = ARDisplayCenterTransformForCaptureDevicePosition(v1).n128_u64[0];
  return result;
}

- (simd_float4x4)projectionMatrix
{
  -[ARCamera projectionMatrixForOrientation:viewportSize:zNear:zFar:](self, "projectionMatrixForOrientation:viewportSize:zNear:zFar:", 3, self->_imageResolution.width, self->_imageResolution.height, 0.00100000005, 0.0);
  result.columns[3].i64[1] = v9;
  result.columns[3].i64[0] = v8;
  result.columns[2].i64[1] = v7;
  result.columns[2].i64[0] = v6;
  result.columns[1].i64[1] = v5;
  result.columns[1].i64[0] = v4;
  result.columns[0].i64[1] = v3;
  result.columns[0].i64[0] = v2;
  return result;
}

- (id)_description:(BOOL)a3
{
  BOOL v3 = a3;
  int64_t trackingState = self->_trackingState;
  if (trackingState)
  {
    if (trackingState == 2)
    {
      uint64_t v8 = @"Normal";
    }
    else if (trackingState == 1)
    {
      unint64_t trackingStateReason = self->_trackingStateReason;
      if (trackingStateReason >= 5) {
        uint64_t v7 = @"Undefined";
      }
      else {
        uint64_t v7 = off_1E6186EA8[trackingStateReason];
      }
      uint64_t v8 = [NSString stringWithFormat:@"%@-%@", @"Limited", v7];
    }
    else
    {
      uint64_t v8 = @"Undefined";
    }
  }
  else
  {
    uint64_t v8 = @"NotAvailable";
  }
  uint64_t v9 = NSString;
  int v10 = (objc_class *)objc_opt_class();
  uint64_t v11 = NSStringFromClass(v10);
  CGSize imageResolution = self->_imageResolution;
  double exposureDuration = self->_exposureDuration;
  double exposureOffset = self->_exposureOffset;
  double v14 = *(float *)self->_anon_90;
  double v15 = *(float *)&self->_anon_90[20];
  double v16 = COERCE_FLOAT(*(_OWORD *)&self->_anon_90[32]);
  double v17 = COERCE_FLOAT(HIDWORD(*(void *)&self->_anon_90[32]));
  long long v18 = ARMatrix4x4Description(v3, *(__n128 *)&self[1].super.isa, *(__n128 *)&self[1]._trackingState, *(__n128 *)&self[1]._exposureDuration, *(__n128 *)&self[1]._lensType);
  long long v19 = [v9 stringWithFormat:@"<%@: %p imageResolution=(%.f, %.f) exposureDuration=%.f exposureOffset=%.f focalLength=(%.03f, %.03f) principalPoint=(%.03f, %.03f) trackingState=%@ transform=%@>", v11, self, imageResolution, *(void *)&exposureDuration, *(void *)&exposureOffset, *(void *)&v14, *(void *)&v15, *(void *)&v16, *(void *)&v17, v8, v18];

  return v19;
}

- (id)description
{
  return [(ARCamera *)self _description:0];
}

- (id)debugQuickLookObject
{
  return [(ARCamera *)self _description:1];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = (float32x4_t *)v4;
    uint64_t v6 = (uint64_t *)v5;
    BOOL v7 = self->_imageResolution.width == *(double *)v5[5].i64
      && self->_imageResolution.height == *(double *)&v5[5].i64[1];
    BOOL v10 = v7
       && self->_exposureDuration == *(double *)v5[2].i64
       && self->_exposureOffset == v5->f32[2]
       && (v8.i64[0] = 0x3400000034000000,
           v8.i64[1] = 0x3400000034000000,
           uint32x4_t v9 = (uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vcgeq_f32(v8, vabdq_f32(*(float32x4_t *)&self->_anon_90[16], v5[10])), (int8x16_t)vcgeq_f32(v8, vabdq_f32(*(float32x4_t *)self->_anon_90, v5[9]))), (int8x16_t)vcgeq_f32(v8, vabdq_f32(*(float32x4_t *)&self->_anon_90[32], v5[11]))), v9.i32[3] = v9.i32[2], (vminvq_u32(v9) & 0x80000000) != 0)&& AREqualTransforms(*(float32x4_t *)&self[1].super.isa, *(float32x4_t *)&self[1]._trackingState, *(float32x4_t *)&self[1]._exposureDuration, *(float32x4_t *)&self[1]._lensType, v5[12], v5[13], v5[14], v5[15])&& self->_trackingState == v6[2]&& self->_trackingStateReason == v6[3]&& [(NSDictionary *)self->_extrinsicsMap isEqualToDictionary:v6[5]]&& self->_captureLens == v6[9];
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (CGPoint)projectPoint:(simd_float3)point orientation:(UIInterfaceOrientation)orientation viewportSize:(CGSize)viewportSize
{
  double width = viewportSize.width;
  double height = viewportSize.height;
  -[ARCamera viewMatrixForOrientation:](self, "viewMatrixForOrientation:");
  float32x4_t v25 = vaddq_f32(v10, vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v7, point.f32[0]), v8, *(float32x2_t *)point.f32, 1), v9, (float32x4_t)point, 2));
  -[ARCamera projectionMatrixForOrientation:viewportSize:zNear:zFar:](self, "projectionMatrixForOrientation:viewportSize:zNear:zFar:", orientation, width, height, 0.000000100000001, 0.0);
  int32x4_t v15 = (int32x4_t)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v11, v25.f32[0]), _Q1, *(float32x2_t *)v25.f32, 1), v13, v25, 2), v14, v25, 3);
  *(float32x2_t *)v15.i8 = vdiv_f32(*(float32x2_t *)v15.i8, (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v15, 2));
  __asm { FMOV            V1.2S, #1.0 }
  v13.i32[0] = vadd_f32(*(float32x2_t *)v15.i8, *(float32x2_t *)_Q1.f32).u32[0];
  v13.i32[1] = vsub_f32(*(float32x2_t *)&_Q1, *(float32x2_t *)&v15).i32[1];
  float64x2_t v20 = vcvtq_f64_f32(*(float32x2_t *)v13.f32);
  *(double *)v13.i64 = width;
  *(double *)&v13.i64[1] = height;
  __asm { FMOV            V1.2D, #0.5 }
  float64x2_t v22 = vmulq_f64(vmulq_f64((float64x2_t)v13, v20), _Q1);
  double v23 = v22.f64[1];
  result.x = v22.f64[0];
  result.y = v23;
  return result;
}

- (simd_float3)unprojectPoint:(CGPoint)point ontoPlaneWithTransform:(simd_float4x4)planeTransform orientation:(UIInterfaceOrientation)orientation viewportSize:(CGSize)viewportSize
{
  float32x4_t v39 = (float32x4_t)planeTransform.columns[3];
  float32x4_t v49 = (float32x4_t)planeTransform.columns[1];
  float v8 = point.x / viewportSize.width;
  float v46 = (float)(v8 * 2.0) + -1.0;
  float v9 = point.y / viewportSize.height;
  float v44 = (float)(v9 * -2.0) + 1.0;
  -[ARCamera projectionMatrixForOrientation:viewportSize:zNear:zFar:](self, "projectionMatrixForOrientation:viewportSize:zNear:zFar:", viewportSize.width, viewportSize.height, 0.1, 0.0, *(double *)planeTransform.columns[2].i64);
  simd_float4x4 v56 = __invert_f4(v55);
  float32x4_t v47 = vaddq_f32((float32x4_t)v56.columns[3], vmlaq_f32(vmlaq_n_f32(vmulq_n_f32((float32x4_t)v56.columns[0], v46), (float32x4_t)v56.columns[1], v44), (float32x4_t)0, (float32x4_t)v56.columns[2]));
  float32x4_t v45 = (float32x4_t)vdupq_laneq_s32((int32x4_t)v47, 3);
  float v10 = (double)ARCameraToDisplayRotation(orientation) * 3.14159265 / 180.0;
  __float2 v11 = __sincosf_stret(v10 * 0.5);
  float32x4_t v12 = vmulq_n_f32((float32x4_t)xmmword_1B8A2B270, v11.__sinval);
  v12.i32[3] = LODWORD(v11.__cosval);
  *(double *)&long long v13 = simd_matrix4x4(v12);
  long long v42 = v14;
  long long v43 = v13;
  long long v40 = v16;
  long long v41 = v15;
  [(ARCamera *)self transform];
  uint64_t v21 = 0;
  v50[0] = v43;
  v50[1] = v42;
  v50[2] = v41;
  v50[3] = v40;
  float32x4_t v51 = 0u;
  float32x4_t v52 = 0u;
  float32x4_t v53 = 0u;
  float32x4_t v54 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v51 + v21 * 16) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v17, COERCE_FLOAT(v50[v21])), v18, *(float32x2_t *)&v50[v21], 1), v19, (float32x4_t)v50[v21], 2), v20, (float32x4_t)v50[v21], 3);
    ++v21;
  }
  while (v21 != 4);
  float32x4_t v22 = vdivq_f32(v47, v45);
  float32x4_t v48 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v51, v22.f32[0]), v52, *(float32x2_t *)v22.f32, 1), v53, v22, 2), v54, v22, 3);
  [(ARCamera *)self transform];
  float32x4_t v24 = vsubq_f32(v48, v23);
  int32x4_t v25 = (int32x4_t)vmulq_f32(v24, v24);
  v25.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v25, 2), vadd_f32(*(float32x2_t *)v25.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v25.i8, 1))).u32[0];
  float32x2_t v26 = vrsqrte_f32((float32x2_t)v25.u32[0]);
  float32x2_t v27 = vmul_f32(v26, vrsqrts_f32((float32x2_t)v25.u32[0], vmul_f32(v26, v26)));
  float32x4_t v28 = vmulq_n_f32(v24, vmul_f32(v27, vrsqrts_f32((float32x2_t)v25.u32[0], vmul_f32(v27, v27))).f32[0]);
  float32x4_t v29 = vmulq_f32(v49, v28);
  float32x4_t v30 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v29, 2), vaddq_f32(v29, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v29.f32, 1)));
  if (v30.f32[0] > -0.00000011921 && v30.f32[0] < 0.00000011921) {
    return (simd_float3)xmmword_1B8A52F00;
  }
  float32x4_t v32 = vmulq_f32(v49, vsubq_f32(v39, v23));
  float32x4_t v34 = vaddq_f32(v32, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v32.f32, 1));
  float32x4_t v33 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v32, 2), v34);
  v34.i32[0] = 1.0;
  v35.i64[0] = 0x8000000080000000;
  v35.i64[1] = 0x8000000080000000;
  LODWORD(v36) = vbslq_s8(v35, (int8x16_t)v34, (int8x16_t)v33).u32[0];
  if (v33.f32[0] == 0.0) {
    float v36 = 0.0;
  }
  LODWORD(v37) = vbslq_s8(v35, (int8x16_t)v34, (int8x16_t)v30).u32[0];
  if (v30.f32[0] == 0.0) {
    float v37 = 0.0;
  }
  if ((float)(v36 - v37) == 0.0) {
    return (simd_float3)vmlaq_n_f32(v23, v28, vdivq_f32(v33, v30).f32[0]);
  }
  return (simd_float3)xmmword_1B8A52F00;
}

- (simd_float4x4)projectionMatrixForOrientation:(UIInterfaceOrientation)orientation viewportSize:(CGSize)viewportSize zNear:(CGFloat)zNear zFar:(CGFloat)zFar
{
  double height = viewportSize.height;
  double width = viewportSize.width;
  uint64_t v9 = ARCameraToDisplayRotation(orientation);
  ARAdjustIntrincisForOrientation();
  double v13 = self->_imageResolution.height;
  if (v9 == 90 || v9 == -90)
  {
    double v14 = self->_imageResolution.width;
  }
  else
  {
    double v14 = self->_imageResolution.height;
    double v13 = self->_imageResolution.width;
  }
  float v15 = ARAdjustIntrinsicsForViewportSize(v10, v11, v12, v13, v14, width, height);
  *(float *)&uint64_t v18 = ARMatrixMakeFrustum(v15, v16, v17, width, height);
  result.columns[3].i64[1] = v25;
  result.columns[3].i64[0] = v24;
  result.columns[2].i64[1] = v23;
  result.columns[2].i64[0] = v22;
  result.columns[1].i64[1] = v21;
  result.columns[1].i64[0] = v20;
  result.columns[0].i64[1] = v19;
  result.columns[0].i64[0] = v18;
  return result;
}

- (simd_float4x4)viewMatrixForOrientation:(UIInterfaceOrientation)orientation
{
  float v4 = (double)ARCameraToDisplayRotation(orientation) * 3.14159265 / 180.0;
  __float2 v5 = __sincosf_stret(v4 * 0.5);
  float32x4_t v6 = vmulq_n_f32((float32x4_t)xmmword_1B8A2B270, v5.__sinval);
  v6.i32[3] = LODWORD(v5.__cosval);
  *(double *)&long long v7 = simd_matrix4x4(v6);
  long long v19 = v8;
  long long v20 = v7;
  long long v17 = v10;
  long long v18 = v9;
  [(ARCamera *)self transform];
  uint64_t v15 = 0;
  v21[0] = v20;
  v21[1] = v19;
  v21[2] = v18;
  v21[3] = v17;
  memset(&v22, 0, sizeof(v22));
  do
  {
    v22.columns[v15] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v11, COERCE_FLOAT(v21[v15])), v12, *(float32x2_t *)&v21[v15], 1), v13, (float32x4_t)v21[v15], 2), v14, (float32x4_t)v21[v15], 3);
    ++v15;
  }
  while (v15 != 4);
  simd_float4x4 v16 = v22;
  return __invert_f4(v16);
}

- (double)extrinsicMatrixToDeviceType:(void *)a1
{
  uint64_t v1 = objc_msgSend(a1, "extrinsicMatrix4x4ToDeviceType:");
  *(void *)&double result = ARMatrix4x3FromMatrix4x4(v1).n128_u64[0];
  return result;
}

- (__n128)extrinsicMatrix4x4ToDeviceType:(uint64_t)a1
{
  uint64_t v1 = objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:");
  uint64_t v2 = v1;
  if (v1)
  {
    [v1 matrix];
    long long v5 = v3;
  }
  else
  {
    long long v5 = *MEMORY[0x1E4F149A0];
  }

  return (__n128)v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithIntrinsics:imageResolution:", *(double *)self->_anon_90, *(double *)&self->_anon_90[16], *(double *)&self->_anon_90[32], self->_imageResolution.width, self->_imageResolution.height);
  uint64_t v5 = v4;
  if (v4)
  {
    *(void *)(v4 + 48) = self->_lensType;
    *(_OWORD *)(v4 + 96) = *(_OWORD *)self->_tangentialDistortion;
    long long v6 = *(_OWORD *)&self->_radialDistortion[16];
    *(_OWORD *)(v4 + 112) = *(_OWORD *)self->_radialDistortion;
    *(_OWORD *)(v4 + 128) = v6;
    long long v7 = *(_OWORD *)&self[1].super.isa;
    long long v8 = *(_OWORD *)&self[1]._trackingState;
    long long v9 = *(_OWORD *)&self[1]._lensType;
    *(_OWORD *)(v4 + 224) = *(_OWORD *)&self[1]._exposureDuration;
    *(_OWORD *)(v4 + 240) = v9;
    *(_OWORD *)(v4 + 192) = v7;
    *(_OWORD *)(v4 + 208) = v8;
    *(void *)(v4 + 16) = self->_trackingState;
    *(void *)(v4 + 24) = self->_trackingStateReason;
    *(void *)(v4 + 56) = self->_devicePosition;
    *(double *)(v4 + 32) = self->_exposureDuration;
    *(float *)(v4 + 8) = self->_exposureOffset;
    objc_storeStrong((id *)(v4 + 64), self->_calibrationData);
    objc_storeStrong((id *)(v5 + 40), self->_extrinsicsMap);
    *(void *)(v5 + 72) = self->_captureLens;
  }
  return (id)v5;
}

- (simd_float4x4)transform
{
  simd_float4 v2 = *(simd_float4 *)&self[1].super.isa;
  simd_float4 v3 = *(simd_float4 *)&self[1]._trackingState;
  simd_float4 v4 = *(simd_float4 *)&self[1]._exposureDuration;
  simd_float4 v5 = *(simd_float4 *)&self[1]._lensType;
  result.columns[3] = v5;
  result.columns[2] = v4;
  result.columns[1] = v3;
  result.columns[0] = v2;
  return result;
}

- (__n128)setTransform:(__n128)a3
{
  result[12] = a2;
  result[13] = a3;
  result[14] = a4;
  result[15] = a5;
  return result;
}

- (ARTrackingState)trackingState
{
  return self->_trackingState;
}

- (void)setTrackingState:(int64_t)a3
{
  self->_int64_t trackingState = a3;
}

- (ARTrackingStateReason)trackingStateReason
{
  return self->_trackingStateReason;
}

- (void)setTrackingStateReason:(int64_t)a3
{
  self->_unint64_t trackingStateReason = a3;
}

- (simd_float3x3)intrinsics
{
  simd_float3 v2 = *(simd_float3 *)self->_anon_90;
  simd_float3 v3 = *(simd_float3 *)&self->_anon_90[16];
  simd_float3 v4 = *(simd_float3 *)&self->_anon_90[32];
  result.columns[2] = v4;
  result.columns[1] = v3;
  result.columns[0] = v2;
  return result;
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
  double width = self->_imageResolution.width;
  double height = self->_imageResolution.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setImageResolution:(CGSize)a3
{
  self->_CGSize imageResolution = a3;
}

- (NSTimeInterval)exposureDuration
{
  return self->_exposureDuration;
}

- (void)setExposureDuration:(double)a3
{
  self->_double exposureDuration = a3;
}

- (float)exposureOffset
{
  return self->_exposureOffset;
}

- (void)setExposureOffset:(float)a3
{
  self->_double exposureOffset = a3;
}

- (NSDictionary)extrinsicsMap
{
  return self->_extrinsicsMap;
}

- (void)setExtrinsicsMap:(id)a3
{
}

- (unint64_t)lensType
{
  return self->_lensType;
}

- (void)setLensType:(unint64_t)a3
{
  self->_lensType = a3;
}

- (__n128)radialDistortion
{
  __n128 result = *(__n128 *)(a1 + 112);
  long long v3 = *(_OWORD *)(a1 + 128);
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v3;
  return result;
}

- (void)setRadialDistortion:(ARCamera *)self
{
  long long v3 = v2[1];
  *(_OWORD *)self->_radialDistortion = *v2;
  *(_OWORD *)&self->_radialDistortion[16] = v3;
}

- (__n128)tangentialDistortion
{
  return a1[6];
}

- (void)setTangentialDistortion:(ARCamera *)self
{
  *(_OWORD *)self->_tangentialDistortion = v2;
}

- (int64_t)devicePosition
{
  return self->_devicePosition;
}

- (void)setDevicePosition:(int64_t)a3
{
  self->_devicePosition = a3;
}

- (AVCameraCalibrationData)calibrationData
{
  return self->_calibrationData;
}

- (void)setCalibrationData:(id)a3
{
}

- (unint64_t)captureLens
{
  return self->_captureLens;
}

- (void)setCaptureLens:(unint64_t)a3
{
  self->_captureLens = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calibrationData, 0);
  objc_storeStrong((id *)&self->_extrinsicsMap, 0);
}

- (id)initFromImageData:(id)a3
{
  id v4 = a3;
  [v4 cameraIntrinsics];
  double v25 = v6;
  double v26 = v5;
  double v24 = v7;
  [v4 imageResolution];
  double v9 = v8;
  double v11 = v10;
  uint64_t v12 = [v4 cameraPosition];
  uint64_t v13 = [v4 lensType];
  if (v4)
  {
    [v4 radialDistortion];
    objc_msgSend(v4, "tangentialDistortion", v27[3], v27[2]);
  }
  else
  {
    objc_msgSend(0, "tangentialDistortion", 0, 0, 0, 0);
  }
  double v23 = v14;
  [v4 exposureDuration];
  double v16 = v15;
  long long v17 = [v4 calibrationData];
  long long v18 = [v4 extrinsicsMap];
  v27[0] = v22;
  v27[1] = v21;
  long long v19 = -[ARCamera initWithIntrinsics:imageResolution:devicePosition:lensType:radialDistortion:tangentialDistortion:exposureDuration:calibrationData:extrinsicsMap:captureLens:](self, "initWithIntrinsics:imageResolution:devicePosition:lensType:radialDistortion:tangentialDistortion:exposureDuration:calibrationData:extrinsicsMap:captureLens:", v12, v13, v27, v17, v18, [v4 captureLens], v26, v25, v24, v9, v11, v23, v16);

  return v19;
}

@end