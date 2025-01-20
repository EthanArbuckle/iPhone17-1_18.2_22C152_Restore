@interface AXMTFaceKitResult
+ (__n128)_projectPoint:(__n128)a3 usingRGBCameraDictionary:(__n128)a4 pose:(__n128)a5 referenceDimensions:(__n128)a6;
+ (void)_logIntrinsicsForInternalBuilds:(__n128)a3 withLogPrefix:(uint64_t)a4;
- (AXMTFaceKitResult)initWithError:(id)a3;
- (BOOL)hasFace;
- (CGSize)imageSize;
- (NSError)error;
- (double)_mirrorPoseVertically:(__n128)a3;
- (void)_calculatePoseWithRotation:(void *)a3 translation:(void *)a4;
- (void)setImageSize:(CGSize)a3;
@end

@implementation AXMTFaceKitResult

- (AXMTFaceKitResult)initWithError:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v5 = objc_alloc((Class)NSError);
    id v4 = [v5 initWithDomain:AXSSMotionTrackingErrorDomain code:0 userInfo:0];
  }
  v9.receiver = self;
  v9.super_class = (Class)AXMTFaceKitResult;
  v6 = [(AXMTFaceKitResult *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_error, v4);
  }

  return v7;
}

- (BOOL)hasFace
{
  v2 = [(AXMTFaceKitResult *)self error];
  BOOL v3 = v2 == 0;

  return v3;
}

- (double)_mirrorPoseVertically:(__n128)a3
{
  *(double *)&long long v3 = AXMTEulerAnglesFromMatrix(a1, a2, a3);
  long long v41 = v3;
  __float2 v4 = __sincosf_stret(0.5 * *(float *)&v3);
  float32x4_t v5 = vmulq_n_f32((float32x4_t)xmmword_100036DB0, v4.__sinval);
  v5.i32[3] = LODWORD(v4.__cosval);
  *(__n64 *)v6.f32 = sub_100029E60(v5);
  float32x4_t v36 = v7;
  float32x4_t v37 = v6;
  float32x4_t v35 = v8;
  __float2 v9 = __sincosf_stret(vmuls_lane_f32(-0.5, *(float32x2_t *)&v41, 1));
  float32x4_t v10 = vmulq_n_f32((float32x4_t)xmmword_100036DC0, v9.__sinval);
  v10.i32[3] = LODWORD(v9.__cosval);
  *(__n64 *)v11.f32 = sub_100029E60(v10);
  float32x4_t v39 = v12;
  float32x4_t v40 = v11;
  float32x4_t v38 = v13;
  __float2 v14 = __sincosf_stret((float)(1.5708 - *((float *)&v41 + 2)) * 0.5);
  float32x4_t v15 = vmulq_n_f32((float32x4_t)xmmword_100036BC0, v14.__sinval);
  v15.i32[3] = LODWORD(v14.__cosval);
  *(__n64 *)v16.f32 = sub_100029E60(v15);
  uint64_t v17 = 0;
  v16.i32[3] = 0;
  HIDWORD(v18) = 0;
  v19.i32[3] = 0;
  float32x4_t v42 = v16;
  long long v43 = v18;
  float32x4_t v44 = v19;
  float32x4_t v46 = 0u;
  long long v47 = 0u;
  float32x4_t v48 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v46 + v17 * 4) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v37, COERCE_FLOAT(*(_OWORD *)((char *)&v42 + v17 * 4))), v36, *(float32x2_t *)&v42.f32[v17], 1), v35, *(float32x4_t *)((char *)&v42 + v17 * 4), 2);
    v17 += 4;
  }
  while (v17 != 12);
  uint64_t v20 = 0;
  float32x4_t v42 = v46;
  long long v43 = v47;
  float32x4_t v44 = v48;
  float32x4_t v46 = 0u;
  long long v47 = 0u;
  float32x4_t v48 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v46 + v20 * 4) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v40, COERCE_FLOAT(*(_OWORD *)((char *)&v42 + v20 * 4))), v39, *(float32x2_t *)&v42.f32[v20], 1), v38, *(float32x4_t *)((char *)&v42 + v20 * 4), 2);
    v20 += 4;
  }
  while (v20 != 12);
  AXMTMatrix4x4FromRotationAndTranslation();
  unint64_t v21 = 0;
  float32x4_t v42 = v22;
  float32x4_t v23 = (float32x4_t)matrix_identity_float4x4.columns[0];
  float32x4_t v24 = (float32x4_t)matrix_identity_float4x4.columns[2];
  float32x4_t v25 = (float32x4_t)matrix_identity_float4x4.columns[3];
  long long v43 = v26;
  float32x4_t v44 = v27;
  float32x4_t v45 = v28;
  float32x4_t v46 = 0u;
  long long v47 = 0u;
  float32x4_t v48 = 0u;
  float32x4_t v49 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v46 + v21) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v23, COERCE_FLOAT(*(_OWORD *)((char *)&v42 + v21))), (float32x4_t)xmmword_100036DD0, *(float32x2_t *)&v42.f32[v21 / 4], 1), v24, *(float32x4_t *)((char *)&v42 + v21), 2), v25, *(float32x4_t *)((char *)&v42 + v21), 3);
    v21 += 16;
  }
  while (v21 != 64);
  unint64_t v29 = 0;
  float32x4_t v30 = v46;
  float32x4_t v31 = (float32x4_t)v47;
  float32x4_t v32 = v48;
  float32x4_t v33 = v49;
  float32x4_t v42 = v23;
  long long v43 = xmmword_100036DD0;
  float32x4_t v44 = v24;
  float32x4_t v45 = v25;
  float32x4_t v46 = 0u;
  long long v47 = 0u;
  float32x4_t v48 = 0u;
  float32x4_t v49 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v46 + v29) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v30, COERCE_FLOAT(*(_OWORD *)((char *)&v42 + v29))), v31, *(float32x2_t *)&v42.f32[v29 / 4], 1), v32, *(float32x4_t *)((char *)&v42 + v29), 2), v33, *(float32x4_t *)((char *)&v42 + v29), 3);
    v29 += 16;
  }
  while (v29 != 64);
  return *(double *)v46.i64;
}

- (void)_calculatePoseWithRotation:(void *)a3 translation:(void *)a4
{
  id v5 = a4;
  AXMTMatrix3x3FromArray(a3);
  AXMTVector3FromArray(v5);

  AXMTMatrix4x4FromRotationAndTranslation();
}

+ (void)_logIntrinsicsForInternalBuilds:(__n128)a3 withLogPrefix:(uint64_t)a4
{
  id v6 = a6;
  if (qword_100054EF0 != -1) {
    dispatch_once(&qword_100054EF0, &stru_1000491D0);
  }
  if (byte_100054EE8)
  {
    float32x4_t v7 = AXSSLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138414594;
      id v12 = v6;
      __int16 v13 = 2048;
      double v14 = a1.n128_f32[0];
      __int16 v15 = 2048;
      double v16 = a2.n128_f32[0];
      __int16 v17 = 2048;
      double v18 = a3.n128_f32[0];
      __int16 v19 = 2048;
      double v20 = a1.n128_f32[1];
      __int16 v21 = 2048;
      double v22 = a2.n128_f32[1];
      __int16 v23 = 2048;
      double v24 = a3.n128_f32[1];
      __int16 v25 = 2048;
      double v26 = a1.n128_f32[2];
      __int16 v27 = 2048;
      double v28 = a2.n128_f32[2];
      __int16 v29 = 2048;
      double v30 = a3.n128_f32[2];
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%@ intrinsics: ((%f, %f, %f), (%f, %f, %f), (%f, %f, %f)", buf, 0x66u);
    }
  }
}

+ (__n128)_projectPoint:(__n128)a3 usingRGBCameraDictionary:(__n128)a4 pose:(__n128)a5 referenceDimensions:(__n128)a6
{
  id v13 = a10;
  if (v13)
  {
    double v14 = [v13 objectForKeyedSubscript:sub_1000291F0()];
    __n128 v15 = AXMTMatrix3x3FromArray(v14);
    v15.n128_u32[3] = 0;
    v16.i32[3] = 0;
    float32x4_t v48 = v16;
    float32x4_t v49 = (float32x4_t)v15;
    v17.i32[3] = 0;
    float32x4_t v47 = v17;

    if (a7 != CGSizeZero.width || a8 != CGSizeZero.height)
    {
      v19.f32[0] = AXMTAdjustIntrinsicsForViewportSize(v49.f32[0], *(double *)v48.i64, *(double *)v47.i64, a7, a8, 1920.0, 1440.0);
      float32x4_t v40 = v20;
      float32x4_t v41 = v19;
      float32x4_t v39 = v21;
      objc_msgSend(a1, "_logIntrinsicsForInternalBuilds:withLogPrefix:", @"Original FaceKit", *(double *)v49.i64, *(double *)v48.i64, *(double *)v47.i64);
      objc_msgSend(a1, "_logIntrinsicsForInternalBuilds:withLogPrefix:", @"Adjusted", *(double *)v41.i64, *(double *)v40.i64, *(double *)v39.i64);
      float32x4_t v48 = v40;
      float32x4_t v49 = v41;
      float32x4_t v47 = v39;
    }
    double v22 = [v13 objectForKeyedSubscript:sub_1000290F8()];
    __int16 v23 = [v22 objectForKeyedSubscript:sub_100028F08()];
    AXMTMatrix3x3FromArray(v23);

    double v24 = [v13 objectForKeyedSubscript:sub_1000290F8()];
    __int16 v25 = [v24 objectForKeyedSubscript:sub_100029000()];
    AXMTVector3FromArray(v25);

    AXMTMatrix4x4FromRotationAndTranslation();
    unint64_t v26 = 0;
    __n128 v51 = v27;
    __n128 v52 = v28;
    __n128 v53 = v29;
    __n128 v54 = v30;
    float32x4_t v55 = 0u;
    float32x4_t v56 = 0u;
    float32x4_t v57 = 0u;
    float32x4_t v58 = 0u;
    do
    {
      *(float32x4_t *)((char *)&v55 + v26) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v49, COERCE_FLOAT(*(_OWORD *)((char *)&v51 + v26))), v48, (float32x2_t)v51.n128_u64[v26 / 8], 1), v47, *(float32x4_t *)((char *)&v51 + v26), 2), (float32x4_t)0, *(float32x4_t *)((char *)&v51 + v26), 3);
      v26 += 16;
    }
    while (v26 != 64);
    unint64_t v31 = 0;
    float32x4_t v32 = v55;
    float32x4_t v33 = v56;
    float32x4_t v34 = v57;
    float32x4_t v35 = v58;
    __n128 v51 = a3;
    __n128 v52 = a4;
    __n128 v53 = a5;
    __n128 v54 = a6;
    float32x4_t v55 = 0u;
    float32x4_t v56 = 0u;
    float32x4_t v57 = 0u;
    float32x4_t v58 = 0u;
    do
    {
      *(float32x4_t *)((char *)&v55 + v31) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v32, COERCE_FLOAT(*(_OWORD *)((char *)&v51 + v31))), v33, (float32x2_t)v51.n128_u64[v31 / 8], 1), v34, *(float32x4_t *)((char *)&v51 + v31), 2), v35, *(float32x4_t *)((char *)&v51 + v31), 3);
      v31 += 16;
    }
    while (v31 != 64);
    int32x4_t v36 = (int32x4_t)vaddq_f32(v58, vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v55, a2.f32[0]), v56, *(float32x2_t *)a2.f32, 1), v57, a2, 2));
    NSPoint v37 = (NSPoint)vcvtq_f64_f32(vdiv_f32(*(float32x2_t *)v36.i8, (float32x2_t)vdup_laneq_s32(v36, 2)));
  }
  else
  {
    NSPoint v37 = NSZeroPoint;
  }
  NSPoint v50 = v37;

  return (__n128)v50;
}

- (NSError)error
{
  return self->_error;
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

- (void).cxx_destruct
{
}

@end