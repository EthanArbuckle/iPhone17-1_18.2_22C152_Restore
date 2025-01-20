@interface ARPlaneData
+ (double)_surfaceToWorldTransformForPlane:(uint64_t)a3 pivot:(float64x2_t *)a4;
+ (float)_pivotForPlane:(CV3DPlaneDetectionPlane *)a3;
+ (float)_surfacePivotForPlane:(CV3DSurfaceDetectionPlane *)a3;
+ (id)anchorForDetectionResult:(CV3DSurfaceDetectionResult *)a3;
+ (void)setSemanticsFromCV3D:(int)a3 labelProbabilities:(id)a4 sceneUnderstandingEnabled:(BOOL)a5 onPlane:(id)a6;
- (ARCV3DPlaneDetectionPlaneList)detectionResult;
- (ARPlaneData)initWithDetectionResult:(CV3DPlaneDetectionPlaneList *)a3 detectionTypeMask:(unint64_t)a4 sceneUnderstandingEnabled:(BOOL)a5;
- (BOOL)applyPivotRotation;
- (NSDictionary)tracingEntry;
- (__n128)initWithDetectionResult:(__n128)a3 detectionTypeMask:(__n128)a4 sceneUnderstandingEnabled:(__n128)a5 renderingFromVision:(double)a6 atTimestamp:;
- (double)timestamp;
- (id)anchorsForCameraWithTransform:(double)a3 referenceOriginTransform:(double)a4 existingAnchors:(double)a5 anchorsToRemove:(__n128)a6;
- (unint64_t)detectionTypeMask;
- (void)setTimestamp:(double)a3;
@end

@implementation ARPlaneData

- (ARPlaneData)initWithDetectionResult:(CV3DPlaneDetectionPlaneList *)a3 detectionTypeMask:(unint64_t)a4 sceneUnderstandingEnabled:(BOOL)a5
{
  v22.receiver = self;
  v22.super_class = (Class)ARPlaneData;
  v8 = [(ARPlaneData *)&v22 init];
  if (v8)
  {
    v9 = [[ARCV3DPlaneDetectionPlaneList alloc] initWithDetectionResult:a3];
    detectionResult = v8->_detectionResult;
    v8->_detectionResult = v9;

    v8->_detectionTypeMask = a4;
    v8->_sceneUnderstandingEnabled = a5;
    *(double *)&long long v11 = ARVisionToRenderingCoordinateTransform();
    *(_OWORD *)v8->_anon_20 = v11;
    *(_OWORD *)&v8->_anon_20[16] = v12;
    *(_OWORD *)&v8->_anon_20[32] = v13;
    *(_OWORD *)&v8->_anon_20[48] = v14;
    v8->_applyPivotRotation = +[ARKitUserDefaults BOOLForKey:@"com.apple.arkit.planeEstimation.anchorRotation"];
    objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", -[ARCV3DPlaneDetectionPlaneList numberOfPlanes](v8->_detectionResult, "numberOfPlanes"));
    v15 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    for (unint64_t i = 0; i < [(ARCV3DPlaneDetectionPlaneList *)v8->_detectionResult numberOfPlanes]; ++i)
    {
      [(ARCV3DPlaneDetectionPlaneList *)v8->_detectionResult planeAtIndex:i];
      v17 = (const void *)CV3DPlaneDetectionPlaneCopyUUID();
      if (v17)
      {
        v18 = objc_msgSend(MEMORY[0x1E4F29128], "ar_UUIDWithCFUUIDRef:", v17);
        v19 = [NSNumber numberWithUnsignedLong:i];
        [(NSDictionary *)v15 setObject:v19 forKey:v18];

        CFRelease(v17);
      }
    }
    planeIdentifiers = v8->_planeIdentifiers;
    v8->_planeIdentifiers = v15;
  }
  return v8;
}

- (__n128)initWithDetectionResult:(__n128)a3 detectionTypeMask:(__n128)a4 sceneUnderstandingEnabled:(__n128)a5 renderingFromVision:(double)a6 atTimestamp:
{
  result = (__n128 *)objc_msgSend(a1, "initWithDetectionResult:detectionTypeMask:sceneUnderstandingEnabled:");
  if (result)
  {
    result[2] = a2;
    result[3] = a3;
    result[4] = a4;
    result[5] = a5;
    result[6].n128_f64[0] = a6;
  }
  return result;
}

- (id)anchorsForCameraWithTransform:(double)a3 referenceOriginTransform:(double)a4 existingAnchors:(double)a5 anchorsToRemove:(__n128)a6
{
  *(__n128 *)&v44[32] = a8;
  *(__n128 *)&v44[48] = a9;
  *(__n128 *)v44 = a6;
  *(__n128 *)&v44[16] = a7;
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v42 = a11;
  id v46 = a12;
  if ((*(unsigned char *)(a1 + 104) & 3) != 0)
  {
    v48 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v14 = v42;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v53 objects:v64 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v54;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v54 != v16) {
            objc_enumerationMutation(v14);
          }
          v18 = *(void **)(*((void *)&v53 + 1) + 8 * v17);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v19 = v18;
            v20 = *(void **)(a1 + 8);
            v21 = [v19 identifier];
            objc_super v22 = [v20 objectForKey:v21];
            LOBYTE(v20) = v22 == 0;

            if (v20)
            {
              if (_ARLogGeneral(void)::onceToken != -1) {
                dispatch_once(&_ARLogGeneral(void)::onceToken, &__block_literal_global_55);
              }
              v24 = (id)_ARLogGeneral(void)::logObj;
              if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
              {
                v25 = (objc_class *)objc_opt_class();
                NSStringFromClass(v25);
                id v26 = (id)objc_claimAutoreleasedReturnValue();
                v27 = [v19 identifier];
                *(_DWORD *)buf = 138543874;
                id v59 = v26;
                __int16 v60 = 2048;
                uint64_t v61 = a1;
                __int16 v62 = 2114;
                v63 = v27;
                _os_log_impl(&dword_1B88A2000, v24, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Plane anchor removed by plane detection: %{public}@", buf, 0x20u);
              }
              [v46 addObject:v19];
            }
            else
            {
              v23 = [v19 identifier];
              [v48 setObject:v19 forKey:v23];
            }
          }
          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [v14 countByEnumeratingWithState:&v53 objects:v64 count:16];
      }
      while (v15);
    }

    id v45 = [MEMORY[0x1E4F1CA48] array];
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    v28 = [*(id *)(a1 + 8) allKeys];
    uint64_t v29 = [v28 countByEnumeratingWithState:&v49 objects:v57 count:16];
    if (v29)
    {
      uint64_t v30 = *(void *)v50;
      int v31 = *MEMORY[0x1E4F94888];
      int v43 = *MEMORY[0x1E4F94890];
      do
      {
        for (uint64_t i = 0; i != v29; ++i)
        {
          if (*(void *)v50 != v30) {
            objc_enumerationMutation(v28);
          }
          v33 = *(NSUUID **)(*((void *)&v49 + 1) + 8 * i);
          v34 = objc_msgSend(*(id *)(a1 + 8), "objectForKey:", v33, v42);
          uint64_t v35 = [v34 unsignedLongValue];

          v36 = (const CV3DPlaneDetectionPlane *)[*(id *)(a1 + 112) planeAtIndex:v35];
          if (!CV3DPlaneDetectionPlaneAge())
          {
            uint64_t v37 = *(void *)(a1 + 104);
            if ((v37 & 1) == 0)
            {
              if ((v31 & CV3DPlaneDetectionPlaneGetOrientation()) != 0) {
                continue;
              }
              uint64_t v37 = *(void *)(a1 + 104);
            }
            if ((v37 & 2) != 0 || (v43 & CV3DPlaneDetectionPlaneGetOrientation()) == 0)
            {
              v38 = [v48 objectForKey:v33];
              v47.columns[0] = *(simd_float4 *)(a1 + 32);
              v47.columns[1] = *(simd_float4 *)(a1 + 48);
              v47.columns[2] = *(simd_float4 *)(a1 + 64);
              v47.columns[3] = *(simd_float4 *)(a1 + 80);
              int v39 = *(unsigned __int8 *)(a1 + 16);
              if (v38) {
                ARUpdatePlaneAnchorFromCV3DPlane(v38, v36, *(simd_float4x4 *)v44, v47, v39 != 0, [(id)a1 applyPivotRotation], *(void *)(a1 + 104));
              }
              else {
              v40 = ARCreatePlaneAnchorFromCV3DPlane(v36, v33, *(simd_float4x4 *)v44, v47, v39 != 0, [(id)a1 applyPivotRotation], *(void *)(a1 + 104));
              }
              [v45 addObject:v40];
            }
          }
        }
        uint64_t v29 = [v28 countByEnumeratingWithState:&v49 objects:v57 count:16];
      }
      while (v29);
    }
  }
  else
  {
    id v45 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v45;
}

- (BOOL)applyPivotRotation
{
  return !ARLinkedOnOrAfterSydney() || self->_applyPivotRotation;
}

+ (float)_pivotForPlane:(CV3DPlaneDetectionPlane *)a3
{
  int v3 = CV3DPlaneDetectionPlaneExtentOrientedBoundingBox();
  int Orientation = CV3DPlaneDetectionPlaneGetOrientation();
  float result = 0.0;
  if (Orientation == *MEMORY[0x1E4F94888] && v3 != 0)
  {
    long long v17 = v14;
    uint64_t v18 = v15;
    uint64_t v19 = v16;
    {
      pivotForOrientedBox(simd_float4x2)::k_cos45 = 1060439283;
    }
    uint64_t v8 = 0;
    float v9 = *(float *)&pivotForOrientedBox(simd_float4x2)::k_cos45;
    float result = 0.0;
    do
    {
      uint64_t v10 = v8 + 1;
      float32x2_t v11 = vsub_f32(*(float32x2_t *)((char *)&v17 + 8 * v8), *(float32x2_t *)((char *)&v17 + 8 * ((v8 + 1) & 3)));
      int32x2_t v12 = (int32x2_t)vmul_f32(v11, v11);
      *(float *)v12.i32 = sqrtf(vmlas_n_f32(*(float *)&v12.i32[1], v11.f32[0], v11.f32[0]));
      *(float32x2_t *)&long long v5 = vdiv_f32(v11, (float32x2_t)vdup_lane_s32(v12, 0));
      if (*(float *)&v5 >= v9)
      {
        long long v13 = v5;
        float result = acosf(fminf(fmaxf(*(float *)&v5, -1.0), 1.0));
        *((void *)&v5 + 1) = *((void *)&v13 + 1);
        if (*((float *)&v13 + 1) < 0.0) {
          float result = -result;
        }
      }
      uint64_t v8 = v10;
    }
    while (v10 != 4);
  }
  return result;
}

+ (void)setSemanticsFromCV3D:(int)a3 labelProbabilities:(id)a4 sceneUnderstandingEnabled:(BOOL)a5 onPlane:(id)a6
{
}

- (NSDictionary)tracingEntry
{
  uint64_t v3 = ARQATraceableDefaultEntryForResultData(self);
  v4 = (void *)[(id)v3 mutableCopy];

  LOBYTE(v3) = [(ARPlaneData *)self detectionTypeMask];
  char v5 = [(ARPlaneData *)self detectionTypeMask];
  v6 = objc_opt_new();
  v7 = v6;
  if (v3) {
    [v6 addObject:@"Horizontal"];
  }
  if ((v5 & 2) != 0) {
    [v7 addObject:@"Vertical"];
  }
  uint64_t v8 = [v7 componentsJoinedByString:@"|"];
  [v4 setObject:v8 forKeyedSubscript:@"detectionType"];

  return (NSDictionary *)v4;
}

+ (float)_surfacePivotForPlane:(CV3DSurfaceDetectionPlane *)a3
{
  float result = 0.0;
  if (a3->var3 == 1)
  {
    var5 = a3->var5;
    if (var5)
    {
      for (uint64_t i = 0; i != 4; ++i)
        *((float32x2_t *)&v13 + i) = vcvt_f32_f64(*((float64x2_t *)var5 + i));
      long long v16 = v13;
      uint64_t v17 = v14;
      uint64_t v18 = v15;
      {
        pivotForOrientedBox(simd_float4x2)::k_cos45 = 1060439283;
      }
      uint64_t v7 = 0;
      float v8 = *(float *)&pivotForOrientedBox(simd_float4x2)::k_cos45;
      float result = 0.0;
      do
      {
        uint64_t v9 = v7 + 1;
        float32x2_t v10 = vsub_f32(*(float32x2_t *)((char *)&v16 + 8 * v7), *(float32x2_t *)((char *)&v16 + 8 * ((v7 + 1) & 3)));
        int32x2_t v11 = (int32x2_t)vmul_f32(v10, v10);
        *(float *)v11.i32 = sqrtf(vmlas_n_f32(*(float *)&v11.i32[1], v10.f32[0], v10.f32[0]));
        *(float32x2_t *)&long long v3 = vdiv_f32(v10, (float32x2_t)vdup_lane_s32(v11, 0));
        if (*(float *)&v3 >= v8)
        {
          long long v12 = v3;
          float result = acosf(fminf(fmaxf(*(float *)&v3, -1.0), 1.0));
          *((void *)&v3 + 1) = *((void *)&v12 + 1);
          if (*((float *)&v12 + 1) < 0.0) {
            float result = -result;
          }
        }
        uint64_t v7 = v9;
      }
      while (v9 != 4);
    }
  }
  return result;
}

+ (double)_surfaceToWorldTransformForPlane:(uint64_t)a3 pivot:(float64x2_t *)a4
{
  if (a1 == 0.0) {
    return ARMatrix4x4MakeColumnMajorTransformFromArray(a4 + 3);
  }
  __float2 v5 = __sincosf_stret(a1 * 0.5);
  float32x4_t v6 = vmulq_n_f32((float32x4_t)xmmword_1B8A2B270, v5.__sinval);
  v6.i32[3] = LODWORD(v5.__cosval);
  *(double *)&long long v7 = simd_matrix4x4(v6);
  long long v17 = v8;
  long long v18 = v7;
  long long v19 = v10;
  long long v20 = v9;
  *(double *)v11.i64 = ARMatrix4x4MakeColumnMajorTransformFromArray(a4 + 3);
  uint64_t v15 = 0;
  v21[0] = v18;
  v21[1] = v17;
  v21[2] = v20;
  v21[3] = v19;
  do
  {
    *(long long *)((char *)&v22 + v15 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v11, COERCE_FLOAT(v21[v15])), v12, *(float32x2_t *)&v21[v15], 1), v13, (float32x4_t)v21[v15], 2), v14, (float32x4_t)v21[v15], 3);
    ++v15;
  }
  while (v15 != 4);
  return *(double *)&v22;
}

+ (id)anchorForDetectionResult:(CV3DSurfaceDetectionResult *)a3
{
  __float2 v5 = [MEMORY[0x1E4F1CA48] array];
  if (a3->var1)
  {
    unint64_t v6 = 0;
    do
    {
      long long v7 = &a3->var0[v6];
      BOOL v8 = v7->var3 != 1;
      [a1 _surfacePivotForPlane:v7];
      objc_msgSend(a1, "_surfaceToWorldTransformForPlane:pivot:", v7);
      long long v39 = v10;
      long long v41 = v9;
      long long v35 = v12;
      long long v37 = v11;
      *(double *)v13.i64 = ARVisionToRenderingCoordinateTransform();
      float32x4_t v33 = v14;
      float32x4_t v34 = v13;
      float32x4_t v31 = v16;
      float32x4_t v32 = v15;
      *(double *)&long long v17 = ARRenderingToVisionCoordinateTransform();
      uint64_t v21 = 0;
      long long v43 = v41;
      long long v44 = v39;
      long long v45 = v37;
      long long v46 = v35;
      do
      {
        *(float32x4_t *)((char *)&v47 + v21) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v34, COERCE_FLOAT(*(long long *)((char *)&v43 + v21))), v33, *(float32x2_t *)((char *)&v43 + v21), 1), v32, *(float32x4_t *)((char *)&v43 + v21), 2), v31, *(float32x4_t *)((char *)&v43 + v21), 3);
        v21 += 16;
      }
      while (v21 != 64);
      uint64_t v22 = 0;
      float32x4_t v23 = v47;
      float32x4_t v24 = v48;
      float32x4_t v25 = v49;
      float32x4_t v26 = v50;
      long long v43 = v17;
      long long v44 = v18;
      long long v45 = v19;
      long long v46 = v20;
      do
      {
        *(float32x4_t *)((char *)&v47 + v22) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v23, COERCE_FLOAT(*(long long *)((char *)&v43 + v22))), v24, *(float32x2_t *)((char *)&v43 + v22), 1), v25, *(float32x4_t *)((char *)&v43 + v22), 2), v26, *(float32x4_t *)((char *)&v43 + v22), 3);
        v22 += 16;
      }
      while (v22 != 64);
      double v40 = *(double *)v48.i64;
      double v42 = *(double *)v47.i64;
      double v36 = *(double *)v50.i64;
      double v38 = *(double *)v49.i64;
      v27 = [ARPlaneAnchor alloc];
      v28 = objc_msgSend(MEMORY[0x1E4F29128], "ar_zeroUUID");
      uint64_t v29 = -[ARPlaneAnchor initWithIdentifier:transform:alignment:](v27, "initWithIdentifier:transform:alignment:", v28, v8, v42, v40, v38, v36);

      [v5 addObject:v29];
      ++v6;
    }
    while (v6 < a3->var1);
  }
  return v5;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (unint64_t)detectionTypeMask
{
  return self->_detectionTypeMask;
}

- (ARCV3DPlaneDetectionPlaneList)detectionResult
{
  return self->_detectionResult;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detectionResult, 0);
  objc_storeStrong((id *)&self->_planeIdentifiers, 0);
}

@end