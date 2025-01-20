@interface ARHitTestRaycasting
+ (ARHitTestResult)convertHitTestResult:(float32x4_t)a3 resultType:(float32x4_t)a4 origin:(float32x4_t)a5 referenceOriginTransform:(uint64_t)a6;
+ (id)hitTestFromOrigin:(double)a3 resultType:(simd_float4)a4 origin:(simd_float4)a5 withDirection:(simd_float4)a6 referenceOriginTransform:(simd_float4)a7;
+ (uint64_t)fillPointCloud:(float32x4_t)a3 cloudFeatures:(float32x4_t)a4 vergenceAngleCosines:(uint64_t)a5 cloudWorldPoints:(uint64_t)a6 pointsWorld:(uint64_t)a7 covariancesWorld:(void *)a8 wideToJasperTransform:(uint64_t)a9;
@end

@implementation ARHitTestRaycasting

+ (ARHitTestResult)convertHitTestResult:(float32x4_t)a3 resultType:(float32x4_t)a4 origin:(float32x4_t)a5 referenceOriginTransform:(uint64_t)a6
{
  *(double *)v25.columns[0].i64 = ARMatrix4x4MakeColumnMajorTransformFromArray((float64x2_t *)(a8 + 8));
  simd_float4x4 v26 = __invert_f4(v25);
  double v10 = ARWorldTransformFromVisionTransform(v26, a2, a3, a4, a5);
  a3.i64[0] = v11;
  *(double *)a4.i64 = v10;
  a2.i64[0] = v12;
  float32x4_t v23 = v13;
  v14 = [[ARHitTestResult alloc] initWithType:a9];
  [(ARHitTestResult *)v14 setAnchor:0];
  float32x4_t v15 = vsubq_f32(v23, a1);
  float32x4_t v16 = vmulq_f32(v15, v15);
  [(ARHitTestResult *)v14 setDistance:sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v16, 2), vaddq_f32(v16, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v16.f32, 1))).f32[0])];
  -[ARHitTestResult setWorldTransform:](v14, "setWorldTransform:", *(double *)a4.i64, *(double *)a3.i64, *(double *)a2.i64, *(double *)v23.i64);
  -[ARHitTestResult setLocalTransform:](v14, "setLocalTransform:", *(double *)a4.i64, *(double *)a3.i64, *(double *)a2.i64, *(double *)v23.i64);
  return v14;
}

+ (uint64_t)fillPointCloud:(float32x4_t)a3 cloudFeatures:(float32x4_t)a4 vergenceAngleCosines:(uint64_t)a5 cloudWorldPoints:(uint64_t)a6 pointsWorld:(uint64_t)a7 covariancesWorld:(void *)a8 wideToJasperTransform:(uint64_t)a9
{
  id v17 = a8;
  id v18 = a10;
  *(double *)v19.i64 = ARMatrix3x3FromMatrix4x4(v18);
  v19.i32[3] = 0;
  v20.i32[3] = 0;
  int32x4_t v56 = v20;
  int32x4_t v58 = v19;
  v21.i32[3] = 0;
  int32x4_t v54 = v21;
  simd_float4x4 v72 = __invert_f4(*(simd_float4x4 *)a7);
  float32x4_t v62 = (float32x4_t)v72.columns[1];
  float32x4_t v64 = (float32x4_t)v72.columns[0];
  float32x4_t v66 = (float32x4_t)v72.columns[3];
  float32x4_t v68 = (float32x4_t)v72.columns[2];
  unint64_t v22 = 0;
  uint64_t v23 = 0;
  while (v22 < [v17 count])
  {
    *(double *)v24.i64 = ARVisionVectorFromARVector(*(int32x4_t *)([v17 points] + 16 * v22));
    float32x4_t v25 = v24;
    __n128 v26 = (__n128)vaddq_f32(v66, vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v64, v24.f32[0]), v62, *(float32x2_t *)v24.f32, 1), v68, v24, 2));
    if (v26.n128_f32[2] >= 0.0)
    {
      float32x4_t v60 = v25;
      v27.n128_f64[0] = ARPointCovarianceVIOFeature(v26, v58, v56, v54, *(float *)(a9 + 4 * v22));
      v27.n128_u32[3] = 0;
      v28.n128_u32[3] = 0;
      v29.n128_u32[3] = 0;
      uint64_t v30 = *a11 + 12 * v23;
      *(void *)uint64_t v30 = v60.i64[0];
      *(_DWORD *)(v30 + 8) = v60.i32[2];
      ARMatrix3x3CopyValues(*a12 + 36 * v23, v27, v28, v29);
      uint64_t v23 = (v23 + 1);
    }
    ++v22;
  }
  if (v18)
  {
    v31 = [v18 depthPointCloud];
    if (v31)
    {
      v32 = [v18 depthPointCloud];
      uint64_t v33 = [v32 confidences];

      if (v33)
      {
        uint64_t v34 = 0;
        v70[0] = v64;
        v70[1] = v62;
        v70[2] = v68;
        v70[3] = v66;
        do
        {
          v71.columns[v34] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a1, COERCE_FLOAT(v70[v34])), a2, *(float32x2_t *)&v70[v34], 1), a3, (float32x4_t)v70[v34], 2), a4, (float32x4_t)v70[v34], 3);
          ++v34;
        }
        while (v34 != 4);
        __invert_f4(v71);
        *(double *)v36.i64 = ARMatrix3x3FromMatrix4x4(v35);
        unint64_t v37 = 0;
        v36.i32[3] = 0;
        v38.i32[3] = 0;
        int32x4_t v57 = v38;
        int32x4_t v59 = v36;
        v39.i32[3] = 0;
        int32x4_t v55 = v39;
        float32x4_t v49 = (float32x4_t)vdupq_n_s32(0x3A83126Fu);
        while (v37 < objc_msgSend(v18, "count", *(_OWORD *)&v49))
        {
          v40 = [v18 depthPointCloud];
          BOOL v41 = ARCheckConfidenceJasper(*(float *)([v40 confidences] + 4 * v37));

          if (v41)
          {
            uint64_t v42 = [v18 points];
            float32x4_t v61 = *(float32x4_t *)a7;
            float32x4_t v63 = vmulq_f32(*(float32x4_t *)(v42 + 16 * v37), v49);
            float32x4_t v69 = *(float32x4_t *)(a7 + 32);
            float32x4_t v65 = *(float32x4_t *)(a7 + 16);
            float32x4_t v67 = *(float32x4_t *)(a7 + 48);
            v43.n128_f64[0] = ARPointCovarianceJasper((__n128)vaddq_f32(a4, vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a1, v63.f32[0]), a2, *(float32x2_t *)v63.f32, 1), a3, v63, 2)), v59, v57, v55);
            float32x4_t v44 = vaddq_f32(v67, vmlaq_f32(vmlaq_f32(vmulq_n_f32(v61, v63.f32[0]), (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v63.f32, 1), v65), (float32x4_t)vdupq_laneq_s32((int32x4_t)v63, 2), v69));
            v43.n128_u32[3] = 0;
            v45.n128_u32[3] = 0;
            v46.n128_u32[3] = 0;
            uint64_t v47 = *a11 + 12 * v23;
            *(void *)uint64_t v47 = v44.i64[0];
            *(_DWORD *)(v47 + 8) = v44.i32[2];
            ARMatrix3x3CopyValues(*a12 + 36 * v23, v43, v45, v46);
            uint64_t v23 = (v23 + 1);
          }
          ++v37;
        }
      }
    }
  }

  return v23;
}

+ (id)hitTestFromOrigin:(double)a3 resultType:(simd_float4)a4 origin:(simd_float4)a5 withDirection:(simd_float4)a6 referenceOriginTransform:(simd_float4)a7
{
  id v12 = a9;
  float32x4_t v13 = v12;
  if (a10 == 4 || a10 == 2)
  {
    v14 = [v12 camera];
    [v14 transform];
    *(double *)&long long v19 = ARVisionCameraTransformFromWorldTransform(v15, v16, v17, v18, a4, a5, a6, a7);
    v52[0] = v19;
    v52[1] = v20;
    v52[2] = v21;
    v52[3] = v22;

    uint64_t v23 = [v13 referenceFeaturePoints];
    unsigned int v24 = [v23 count];
    unsigned int v49 = v24;
    float32x4_t v25 = [v13 capturedPointCloudData];
    __n128 v26 = v25;
    if (v25)
    {
      v24 += [v25 count];
      unsigned int v49 = v24;
    }
    __n128 v27 = [v13 camera];
    [v27 extrinsicMatrix4x4ToDeviceType:*MEMORY[0x1E4F15810]];
    double v38 = v29;
    double v39 = v28;
    float32x4_t v36 = v31;
    double v37 = v30;

    std::vector<CV3DHitTestPoint3D>::vector(v48, v24);
    std::vector<CV3DHitTestCovariance3D>::vector(v47, v24);
    v32 = [v13 featurePoints];
    unsigned int v33 = objc_msgSend(a1, "fillPointCloud:cloudFeatures:vergenceAngleCosines:cloudWorldPoints:pointsWorld:covariancesWorld:wideToJasperTransform:", v52, v23, objc_msgSend(v32, "vergenceAngleCosines"), v26, v48, v47, v39, v38, v37, *(double *)vmulq_f32(v36, (float32x4_t)vdupq_n_s32(0x3A83126Fu)).i64);

    if (v24 != v33)
    {
      unsigned int v49 = v33;
      std::vector<CV3DHitTestPoint3D>::resize((uint64_t)v48, v33);
      std::vector<CV3DHitTestCovariance3D>::resize((uint64_t)v47, v33);
    }
    v50 = v48[0];
    v51 = v47[0];
    uint64_t v34 = [[ARRaycastQuery alloc] initWithOrigin:2 direction:a10 == 4 allowingTarget:a2 alignment:a3];
    ARInitializeHitTestIntent((uint64_t)v46, v34, 0, a4, a5, a6, a7);
    CV3DHitTestingDefaultParameters();
    CV3DPerformHitTestPointCloud();
    ARReleaseHitTestIntent((uint64_t)v46);

    if (v47[0])
    {
      v47[1] = v47[0];
      operator delete(v47[0]);
    }
    if (v48[0])
    {
      v48[1] = v48[0];
      operator delete(v48[0]);
    }
  }
  return 0;
}

@end