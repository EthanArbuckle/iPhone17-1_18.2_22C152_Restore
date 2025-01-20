@interface ARObjectDetectionResultData
- (BOOL)isEqual:(id)a3;
- (NSArray)detectedObjects;
- (NSDictionary)tracingEntry;
- (double)timestamp;
- (id)anchorsForCameraWithTransform:(double)a3 referenceOriginTransform:(double)a4 existingAnchors:(double)a5 anchorsToRemove:(float32x4_t)a6;
- (void)setDetectedObjects:(id)a3;
- (void)setTimestamp:(double)a3;
@end

@implementation ARObjectDetectionResultData

- (id)anchorsForCameraWithTransform:(double)a3 referenceOriginTransform:(double)a4 existingAnchors:(double)a5 anchorsToRemove:(float32x4_t)a6
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  id v12 = a11;
  v13 = objc_opt_new();
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  id v14 = v12;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v81 objects:v94 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v82;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v82 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = *(void **)(*((void *)&v81 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v20 = [v19 identifier];
          [v13 setObject:v19 forKey:v20];
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v81 objects:v94 count:16];
    }
    while (v16);
  }
  v54 = v14;

  id v60 = (id)objc_opt_new();
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  obuint64_t j = [a1 detectedObjects];
  uint64_t v21 = [obj countByEnumeratingWithState:&v77 objects:v93 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v78;
    long long v57 = *(_OWORD *)(MEMORY[0x1E4F149A0] + 16);
    long long v58 = *MEMORY[0x1E4F149A0];
    long long v55 = *(_OWORD *)(MEMORY[0x1E4F149A0] + 48);
    long long v56 = *(_OWORD *)(MEMORY[0x1E4F149A0] + 32);
    do
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v78 != v23) {
          objc_enumerationMutation(obj);
        }
        v25 = *(void **)(*((void *)&v77 + 1) + 8 * j);
        v26 = [v25 referenceObject];
        v27 = [v26 identifier];
        v28 = [v13 objectForKeyedSubscript:v27];

        if (v28)
        {
          v29 = (ARObjectAnchor *)[v28 copy];
        }
        else
        {
          v30 = [ARObjectAnchor alloc];
          v31 = [v25 referenceObject];
          v29 = -[ARObjectAnchor initWithReferenceObject:transform:](v30, "initWithReferenceObject:transform:", v31, *(double *)&v58, *(double *)&v57, *(double *)&v56, *(double *)&v55);
        }
        v32 = [v25 referenceObject];
        [v32 referenceOriginTransform];
        simd_float4x4 v98 = __invert_f4(v97);
        simd_float4 v75 = v98.columns[1];
        simd_float4 v76 = v98.columns[0];
        simd_float4 v73 = v98.columns[3];
        simd_float4 v74 = v98.columns[2];

        *(double *)v33.i64 = ARVisionToRenderingCoordinateTransform();
        float32x4_t v69 = v34;
        float32x4_t v71 = v33;
        float32x4_t v65 = v36;
        float32x4_t v67 = v35;
        [v25 visionTransform];
        unint64_t v37 = 0;
        simd_float4 v85 = v38;
        simd_float4 v86 = v39;
        simd_float4 v87 = v40;
        simd_float4 v88 = v41;
        float32x4_t v89 = 0u;
        float32x4_t v90 = 0u;
        float32x4_t v91 = 0u;
        float32x4_t v92 = 0u;
        do
        {
          *(float32x4_t *)((char *)&v89 + v37) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v71, COERCE_FLOAT(*(_OWORD *)((char *)&v85 + v37))), v69, *(float32x2_t *)&v85.f32[v37 / 4], 1), v67, *(float32x4_t *)((char *)&v85 + v37), 2), v65, *(float32x4_t *)((char *)&v85 + v37), 3);
          v37 += 16;
        }
        while (v37 != 64);
        float32x4_t v70 = v90;
        float32x4_t v72 = v89;
        float32x4_t v66 = v92;
        float32x4_t v68 = v91;
        *(double *)v42.i64 = ARRenderingToVisionCoordinateTransform();
        unint64_t v43 = 0;
        simd_float4 v85 = v42;
        simd_float4 v86 = v44;
        simd_float4 v87 = v45;
        simd_float4 v88 = v46;
        float32x4_t v89 = 0u;
        float32x4_t v90 = 0u;
        float32x4_t v91 = 0u;
        float32x4_t v92 = 0u;
        do
        {
          *(float32x4_t *)((char *)&v89 + v43) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v72, COERCE_FLOAT(*(_OWORD *)((char *)&v85 + v43))), v70, *(float32x2_t *)&v85.f32[v43 / 4], 1), v68, *(float32x4_t *)((char *)&v85 + v43), 2), v66, *(float32x4_t *)((char *)&v85 + v43), 3);
          v43 += 16;
        }
        while (v43 != 64);
        unint64_t v47 = 0;
        float32x4_t v48 = v89;
        float32x4_t v49 = v90;
        float32x4_t v50 = v91;
        float32x4_t v51 = v92;
        simd_float4 v85 = v76;
        simd_float4 v86 = v75;
        simd_float4 v87 = v74;
        simd_float4 v88 = v73;
        float32x4_t v89 = 0u;
        float32x4_t v90 = 0u;
        float32x4_t v91 = 0u;
        float32x4_t v92 = 0u;
        do
        {
          *(float32x4_t *)((char *)&v89 + v47) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v48, COERCE_FLOAT(*(_OWORD *)((char *)&v85 + v47))), v49, *(float32x2_t *)&v85.f32[v47 / 4], 1), v50, *(float32x4_t *)((char *)&v85 + v47), 2), v51, *(float32x4_t *)((char *)&v85 + v47), 3);
          v47 += 16;
        }
        while (v47 != 64);
        unint64_t v52 = 0;
        simd_float4 v85 = (simd_float4)v89;
        simd_float4 v86 = (simd_float4)v90;
        simd_float4 v87 = (simd_float4)v91;
        simd_float4 v88 = (simd_float4)v92;
        float32x4_t v89 = 0u;
        float32x4_t v90 = 0u;
        float32x4_t v91 = 0u;
        float32x4_t v92 = 0u;
        do
        {
          *(float32x4_t *)((char *)&v89 + v52) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a6, COERCE_FLOAT(*(_OWORD *)((char *)&v85 + v52))), a7, *(float32x2_t *)&v85.f32[v52 / 4], 1), a8, *(float32x4_t *)((char *)&v85 + v52), 2), a9, *(float32x4_t *)((char *)&v85 + v52), 3);
          v52 += 16;
        }
        while (v52 != 64);
        -[ARAnchor setTransform:](v29, "setTransform:", *(double *)v89.i64, *(double *)v90.i64, *(double *)v91.i64, *(double *)v92.i64);
        if (v29) {
          [v60 addObject:v29];
        }
      }
      uint64_t v22 = [obj countByEnumeratingWithState:&v77 objects:v93 count:16];
    }
    while (v22);
  }

  return v60;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [v5 detectedObjects];
    v7 = [(ARObjectDetectionResultData *)self detectedObjects];
    if ([v6 isEqual:v7])
    {
      [v5 timestamp];
      BOOL v9 = v8 == self->_timestamp;
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (NSDictionary)tracingEntry
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v3 = ARQATraceableDefaultEntryForResultData(self);
  uint64_t v21 = (void *)[v3 mutableCopy];

  id v4 = objc_alloc(MEMORY[0x1E4F1CA48]);
  id v5 = [(ARObjectDetectionResultData *)self detectedObjects];
  v6 = objc_msgSend(v4, "initWithCapacity:", objc_msgSend(v5, "count"));

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  obuint64_t j = [(ARObjectDetectionResultData *)self detectedObjects];
  uint64_t v7 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        id v12 = objc_opt_new();
        v13 = [v11 referenceObject];
        id v14 = [v13 identifier];
        [v12 setObject:v14 forKeyedSubscript:@"identifier"];

        uint64_t v15 = [v11 referenceObject];
        [v15 extent];
        uint64_t v16 = +[ARQAHelper arrayWithVector3:](ARQAHelper, "arrayWithVector3:");
        [v12 setObject:v16 forKeyedSubscript:@"extent"];

        uint64_t v17 = [v11 referenceObject];
        [v17 center];
        v18 = +[ARQAHelper arrayWithVector3:](ARQAHelper, "arrayWithVector3:");
        [v12 setObject:v18 forKeyedSubscript:@"center"];

        [v11 visionTransform];
        v19 = +[ARQAHelper arrayWithMatrix4x4:](ARQAHelper, "arrayWithMatrix4x4:");
        [v12 setObject:v19 forKeyedSubscript:@"transform"];

        [v6 addObject:v12];
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v8);
  }

  [v21 setObject:v6 forKeyedSubscript:@"objects"];
  return (NSDictionary *)v21;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (NSArray)detectedObjects
{
  return self->_detectedObjects;
}

- (void)setDetectedObjects:(id)a3
{
}

- (void).cxx_destruct
{
}

@end