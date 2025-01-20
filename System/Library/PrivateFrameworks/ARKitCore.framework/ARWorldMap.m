@interface ARWorldMap
+ (BOOL)supportsSecureCoding;
+ (__n64)boundsForTrackingData:(uint64_t)a1;
+ (id)featurePointsForTrackingData:(float32x4_t)a3 referenceOriginTransform:(float32x4_t)a4;
+ (id)keyframesForTrackingData:(double)a3 withFeaturePoints:(double)a4 referenceOriginTransform:(double)a5;
- (ARPointCloud)rawFeaturePoints;
- (ARWorldMap)initWithCoder:(id)a3;
- (ARWorldMap)initWithTrackingData:(__n128)a3 referenceOriginTransform:(__n128)a4;
- (BOOL)isEqual:(id)a3;
- (NSArray)anchors;
- (NSData)surfaceData;
- (NSData)trackingData;
- (NSObject)extractReferenceObjectWithTransform:(__n128)a3 center:(__n128)a4 extent:(__n128)a5 error:(float32x4_t)a6;
- (__n128)referenceOriginTransform;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)version;
- (simd_float3)center;
- (simd_float3)extent;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAnchors:(NSArray *)anchors;
- (void)setSurfaceData:(id)a3;
@end

@implementation ARWorldMap

- (ARWorldMap)initWithTrackingData:(__n128)a3 referenceOriginTransform:(__n128)a4
{
  id v8 = a7;
  v25.receiver = a1;
  v25.super_class = (Class)ARWorldMap;
  v9 = [(ARWorldMap *)&v25 init];
  if (v9)
  {
    objc_msgSend((id)objc_opt_class(), "featurePointsForTrackingData:referenceOriginTransform:", v8, a2.n128_f64[0], a3.n128_f64[0], a4.n128_f64[0], a5.n128_f64[0]);
    v10 = (ARPointCloud *)objc_claimAutoreleasedReturnValue();
    [(ARPointCloud *)v10 computeBounds];
    long long v19 = v12;
    long long v20 = v11;
    v9->_version = 3;
    uint64_t v13 = [v8 copy];
    trackingData = v9->_trackingData;
    v9->_trackingData = (NSData *)v13;

    *(__n128 *)&v9[1].super.isa = a2;
    *(__n128 *)&v9[1]._rawFeaturePoints = a3;
    *(__n128 *)&v9[1]._trackingData = a4;
    *(__n128 *)v9[1]._center = a5;
    rawFeaturePoints = v9->_rawFeaturePoints;
    v9->_rawFeaturePoints = v10;
    v16 = v10;

    *(_OWORD *)v9->_center = v20;
    *(_OWORD *)v9->_extent = v19;
    anchors = v9->_anchors;
    v9->_anchors = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  return v9;
}

- (NSObject)extractReferenceObjectWithTransform:(__n128)a3 center:(__n128)a4 extent:(__n128)a5 error:(float32x4_t)a6
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  long long v11 = objc_opt_new();
  [a1 referenceOriginTransform];
  simd_float4x4 v86 = __invert_f4(v85);
  uint64_t v12 = 0;
  *(__n128 *)buf = a2;
  *(__n128 *)&buf[16] = a3;
  *(__n128 *)&buf[32] = a4;
  __n128 v82 = a5;
  float32x4_t v77 = 0u;
  float32x4_t v78 = 0u;
  float32x4_t v79 = 0u;
  float32x4_t v80 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v77 + v12) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v86.columns[0], COERCE_FLOAT(*(_OWORD *)&buf[v12])), (float32x4_t)v86.columns[1], *(float32x2_t *)&buf[v12], 1), (float32x4_t)v86.columns[2], *(float32x4_t *)&buf[v12], 2), (float32x4_t)v86.columns[3], *(float32x4_t *)&buf[v12], 3);
    v12 += 16;
  }
  while (v12 != 64);
  float32x4_t v68 = v77;
  *(__n64 *)v13.f32 = ARInnerScaleFromMatrix(v77, v78);
  float32x4_t v59 = v13;
  *(double *)v14.i64 = ARNormalizedTransform(v68);
  simd_float4 v73 = v15;
  simd_float4 v75 = v14;
  simd_float4 v69 = v17;
  simd_float4 v71 = v16;
  *(double *)v18.i64 = ARRenderingToVisionCoordinateTransform();
  uint64_t v22 = 0;
  *(simd_float4 *)buf = v75;
  *(simd_float4 *)&buf[16] = v73;
  *(simd_float4 *)&buf[32] = v71;
  __n128 v82 = (__n128)v69;
  float32x4_t v77 = 0u;
  float32x4_t v78 = 0u;
  float32x4_t v79 = 0u;
  float32x4_t v80 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v77 + v22) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v18, COERCE_FLOAT(*(_OWORD *)&buf[v22])), v19, *(float32x2_t *)&buf[v22], 1), v20, *(float32x4_t *)&buf[v22], 2), v21, *(float32x4_t *)&buf[v22], 3);
    v22 += 16;
  }
  while (v22 != 64);
  float32x4_t v55 = v78;
  float32x4_t v57 = v77;
  float32x4_t v51 = v80;
  float32x4_t v53 = v79;
  *(double *)&long long v23 = ARVisionToRenderingCoordinateTransform();
  uint64_t v24 = 0;
  *(_OWORD *)buf = v23;
  *(_OWORD *)&buf[16] = v25;
  *(_OWORD *)&buf[32] = v26;
  __n128 v82 = v27;
  float32x4_t v77 = 0u;
  float32x4_t v78 = 0u;
  float32x4_t v79 = 0u;
  float32x4_t v80 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v77 + v24) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v57, COERCE_FLOAT(*(_OWORD *)&buf[v24])), v55, *(float32x2_t *)&buf[v24], 1), v53, *(float32x4_t *)&buf[v24], 2), v51, *(float32x4_t *)&buf[v24], 3);
    v24 += 16;
  }
  while (v24 != 64);
  __n128 v56 = (__n128)v79;
  __n128 v58 = (__n128)v80;
  int8x16_t v52 = (int8x16_t)v77;
  int8x16_t v54 = (int8x16_t)v78;
  v28.i64[0] = 0x3F0000003F000000;
  v28.i64[1] = 0x3F0000003F000000;
  float32x4_t v29 = vmulq_f32(a7, v28);
  float32x4_t v61 = vmulq_f32(vsubq_f32(a6, v29), v59);
  float32x4_t v65 = vmulq_f32(vaddq_f32(a6, v29), v59);
  *(double *)v30.i64 = ARRenderingToVisionCoordinateTransform();
  float32x4_t v62 = vaddq_f32(v33, vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v30, v61.f32[0]), v31, *(float32x2_t *)v61.f32, 1), v32, v61, 2));
  *(double *)v34.i64 = ARRenderingToVisionCoordinateTransform();
  float32x4_t v38 = vaddq_f32(v37, vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v34, v65.f32[0]), v35, *(float32x2_t *)v65.f32, 1), v36, v65, 2));
  float32x4_t v39 = vdivq_f32(v62, (float32x4_t)vdupq_laneq_s32((int32x4_t)v62, 3));
  float32x4_t v40 = vdivq_f32(v38, (float32x4_t)vdupq_laneq_s32((int32x4_t)v38, 3));
  v39.i32[3] = 0;
  v40.i32[3] = 0;
  float32x4_t v63 = vminnmq_f32(v39, v40);
  float32x4_t v66 = vmaxnmq_f32(v39, v40);
  v41 = objc_msgSend(a1, "trackingData", ARMatrix4x4RowMajorRotationAndTranslation((float64x2_t *)&v77, &v76, v52, v54, v56, v58));
  *(float64x2_t *)buf = vcvtq_f64_f32(*(float32x2_t *)v63.f32);
  *(float64x2_t *)&buf[24] = vcvtq_f64_f32(*(float32x2_t *)v66.f32);
  *(double *)&buf[16] = v63.f32[2];
  *(double *)&buf[40] = v66.f32[2];
  unsigned int v42 = CV3DVIOExtractObjectMap();

  if (v42)
  {
    v43 = _ARLogGeneral_23();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      v44 = (objc_class *)objc_opt_class();
      v45 = NSStringFromClass(v44);
      v46 = NSStringFromCV3DVIOReturn(v42);
      *(_DWORD *)buf = 138543874;
      *(void *)&buf[4] = v45;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = a1;
      *(_WORD *)&buf[22] = 2114;
      *(void *)&buf[24] = v46;
      _os_log_impl(&dword_1B88A2000, v43, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error extracting reference object: %{public}@", buf, 0x20u);
    }
  }
  else
  {
    v47 = [ARReferenceObject alloc];
    v87.columns[1] = v73;
    v87.columns[0] = v75;
    v87.columns[3] = v69;
    v87.columns[2] = v71;
    simd_float4x4 v88 = __invert_f4(v87);
    v43 = -[ARReferenceObject initWithTrackingData:referenceOriginTransform:](v47, "initWithTrackingData:referenceOriginTransform:", v11, *(double *)v88.columns[0].i64, *(double *)v88.columns[1].i64, *(double *)v88.columns[2].i64, *(double *)v88.columns[3].i64);
    v48 = [v43 rawFeaturePoints];
    unint64_t v49 = [v48 count];

    if (v49 >= 0x33)
    {

      goto LABEL_15;
    }
  }

  if (a9)
  {
    ARErrorWithCodeAndUserInfo(400, 0);
    v43 = 0;
    *a9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v43 = 0;
  }
LABEL_15:
  return v43;
}

- (unint64_t)hash
{
  v2 = [(ARWorldMap *)self trackingData];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = (float32x4_t *)v4;
    if (AREqualTransforms(*(float32x4_t *)&self[1].super.isa, *(float32x4_t *)&self[1]._rawFeaturePoints, *(float32x4_t *)&self[1]._trackingData, *(float32x4_t *)self[1]._center, v5[5], v5[6], v5[7], v5[8])&& -[NSArray isEqual:](self->_anchors, "isEqual:", v5->i64[1])&& ((surfaceData = self->_surfaceData, surfaceData == (NSData *)v5[2].i64[1])|| -[NSData isEqual:](surfaceData, "isEqual:")))
    {
      trackingData = self->_trackingData;
      id v8 = [(float32x4_t *)v5 trackingData];
      char v9 = [(NSData *)trackingData isEqual:v8];
    }
    else
    {
      char v9 = 0;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (v5)
  {
    *(void *)(v5 + 24) = self->_version;
    uint64_t v7 = [(NSData *)self->_trackingData copyWithZone:a3];
    id v8 = *(void **)(v6 + 32);
    *(void *)(v6 + 32) = v7;

    long long v9 = *(_OWORD *)&self[1].super.isa;
    long long v10 = *(_OWORD *)&self[1]._rawFeaturePoints;
    long long v11 = *(_OWORD *)self[1]._center;
    *(_OWORD *)(v6 + 112) = *(_OWORD *)&self[1]._trackingData;
    *(_OWORD *)(v6 + 128) = v11;
    *(_OWORD *)(v6 + 80) = v9;
    *(_OWORD *)(v6 + 96) = v10;
    objc_storeStrong((id *)(v6 + 16), self->_rawFeaturePoints);
    *(_OWORD *)(v6 + 48) = *(_OWORD *)self->_center;
    *(_OWORD *)(v6 + 64) = *(_OWORD *)self->_extent;
    uint64_t v12 = [(NSData *)self->_surfaceData copyWithZone:a3];
    float32x4_t v13 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v12;

    uint64_t v14 = [(NSArray *)self->_anchors copyWithZone:a3];
    simd_float4 v15 = *(void **)(v6 + 8);
    *(void *)(v6 + 8) = v14;
  }
  return (id)v6;
}

- (id)description
{
  unint64_t v3 = [(ARWorldMap *)self anchors];
  if ([v3 count] == 1)
  {
    id v4 = @"1 anchor";
  }
  else
  {
    uint64_t v5 = NSString;
    uint64_t v6 = [(ARWorldMap *)self anchors];
    objc_msgSend(v5, "stringWithFormat:", @"%d anchors", objc_msgSend(v6, "count"));
    id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v7 = NSString;
  id v8 = (objc_class *)objc_opt_class();
  long long v9 = NSStringFromClass(v8);
  [(ARWorldMap *)self center];
  long long v11 = ARVector3Description(v10);
  [(ARWorldMap *)self extent];
  float32x4_t v13 = ARVector3Description(v12);
  uint64_t v14 = [(ARWorldMap *)self rawFeaturePoints];
  simd_float4 v15 = [v7 stringWithFormat:@"<%@: %p center=%@ extent=%@ | %@, %d features>", v9, self, v11, v13, v4, objc_msgSend(v14, "count")];

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[ARWorldMap version](self, "version"), @"version");
  uint64_t v5 = [(ARWorldMap *)self trackingData];
  [v4 encodeObject:v5 forKey:@"trackingData"];

  uint64_t v6 = [(ARWorldMap *)self surfaceData];
  [v4 encodeObject:v6 forKey:@"surfaceData"];

  [(ARWorldMap *)self referenceOriginTransform];
  objc_msgSend(v4, "ar_encodeMatrix4x4:forKey:", @"referenceOriginTransform");
  uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = [(ARWorldMap *)self anchors];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v14 + 1) + 8 * v12);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          [v7 addObject:v13];
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }

  [v4 encodeObject:v7 forKey:@"anchors"];
}

- (ARWorldMap)initWithCoder:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"version"];
  if (v5 >= 4)
  {
    uint64_t v6 = ARErrorWithCodeAndUserInfo(302, 0);
    [v4 failWithError:v6];

    uint64_t v7 = _ARLogGeneral_23();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = (objc_class *)objc_opt_class();
      uint64_t v9 = NSStringFromClass(v8);
      *(_DWORD *)buf = 138543874;
      __n128 v27 = v9;
      __int16 v28 = 2048;
      float32x4_t v29 = self;
      __int16 v30 = 2048;
      uint64_t v31 = v5;
      _os_log_impl(&dword_1B88A2000, v7, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error loading map: Unsupported map version (%ld)", buf, 0x20u);
    }
LABEL_14:
    float32x4_t v20 = 0;
    goto LABEL_15;
  }
  uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"trackingData"];
  if (!v7)
  {
    float32x4_t v21 = ARErrorWithCodeAndUserInfo(302, 0);
    [v4 failWithError:v21];

    uint64_t v22 = _ARLogGeneral_23();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      long long v23 = (objc_class *)objc_opt_class();
      uint64_t v24 = NSStringFromClass(v23);
      *(_DWORD *)buf = 138543618;
      __n128 v27 = v24;
      __int16 v28 = 2048;
      float32x4_t v29 = self;
      _os_log_impl(&dword_1B88A2000, v22, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error loading map: Malformed map data", buf, 0x16u);
    }
    goto LABEL_14;
  }
  objc_msgSend(v4, "ar_decodeMatrix4x4ForKey:", @"referenceOriginTransform");
  uint64_t v10 = -[ARWorldMap initWithTrackingData:referenceOriginTransform:](self, "initWithTrackingData:referenceOriginTransform:", v7);
  uint64_t v11 = v10;
  if (v10)
  {
    v10->_version = v5;
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"surfaceData"];
    surfaceData = v11->_surfaceData;
    v11->_surfaceData = (NSData *)v12;

    long long v14 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v15 = objc_opt_class();
    long long v16 = objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
    uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"anchors"];
    float32x4_t v18 = (void *)v17;
    if (v17) {
      uint64_t v19 = (void *)v17;
    }
    else {
      uint64_t v19 = (void *)MEMORY[0x1E4F1CBF0];
    }
    objc_storeStrong((id *)&v11->_anchors, v19);
  }
  self = v11;
  float32x4_t v20 = self;
LABEL_15:

  return v20;
}

+ (id)featurePointsForTrackingData:(float32x4_t)a3 referenceOriginTransform:(float32x4_t)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a7;
  uint64_t v9 = objc_opt_new();
  unsigned int v10 = CV3DVIOCreatePointsFromMap();
  if (v10)
  {
    unsigned int v11 = v10;
    _ARLogGeneral_23();
    uint64_t v12 = (ARPointCloud *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v12->super, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = (objc_class *)objc_opt_class();
      long long v14 = NSStringFromClass(v13);
      uint64_t v15 = NSStringFromCV3DVIOReturn(v11);
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v14;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = a1;
      *(_WORD *)&buf[22] = 2114;
      *(void *)&buf[24] = v15;
      _os_log_impl(&dword_1B88A2000, &v12->super, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Failed to parse feature points: %{public}@", buf, 0x20u);
    }
LABEL_11:

    float32x4_t v21 = +[ARPointCloud emptyPointCloud];
    goto LABEL_12;
  }
  uint64_t v12 = [[ARPointCloud alloc] initWithPointData:v9];
  if (![(ARPointCloud *)v12 count])
  {
    uint64_t v22 = _ARLogGeneral_23();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      long long v23 = (objc_class *)objc_opt_class();
      uint64_t v24 = NSStringFromClass(v23);
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v24;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = a1;
      _os_log_impl(&dword_1B88A2000, v22, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Warning: Zero feature points in map.", buf, 0x16u);
    }
    goto LABEL_11;
  }
  *(double *)&long long v16 = ARVisionToRenderingCoordinateTransform();
  uint64_t v17 = 0;
  v30[0] = v16;
  v30[1] = v18;
  v30[2] = v19;
  v30[3] = v20;
  memset(buf, 0, sizeof(buf));
  long long v32 = 0u;
  *(_OWORD *)float32x4_t v33 = 0u;
  do
  {
    *(float32x4_t *)&buf[v17 * 16] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a2, COERCE_FLOAT(v30[v17])), a3, *(float32x2_t *)&v30[v17], 1), a4, (float32x4_t)v30[v17], 2), a5, (float32x4_t)v30[v17], 3);
    ++v17;
  }
  while (v17 != 4);
  float32x4_t v21 = -[ARPointCloud pointCloudByApplyingTransform:](v12, "pointCloudByApplyingTransform:", *(double *)buf, *(double *)&buf[16], *(double *)&v32, v33[0]);

LABEL_12:
  return v21;
}

+ (__n64)boundsForTrackingData:(uint64_t)a1
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  unsigned int v2 = CV3DVIOGetMapBounds();
  if (v2)
  {
    unsigned int v5 = v2;
    uint64_t v6 = _ARLogGeneral_23();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = (objc_class *)objc_opt_class();
      id v8 = NSStringFromClass(v7);
      uint64_t v9 = NSStringFromCV3DVIOReturn(v5);
      *(_DWORD *)buf = 138543874;
      long long v19 = v8;
      __int16 v20 = 2048;
      uint64_t v21 = a1;
      __int16 v22 = 2114;
      long long v23 = v9;
      _os_log_impl(&dword_1B88A2000, v6, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Failed to parse bounds: %{public}@", buf, 0x20u);
    }
    return 0;
  }
  else
  {
    v3.f64[0] = 0.0;
    v4.f64[0] = 0.0;
    __asm { FMOV            V6.2D, #0.5 }
    float64_t v16 = vmulq_f64(vaddq_f64(v3, v4), _Q6).f64[0];
    float v17 = COERCE_DOUBLE(*(void *)&vmulq_f64(vaddq_f64((float64x2_t)0, (float64x2_t)0), _Q6).f64[1]);
    result.n64_f32[0] = -v17;
    *(float *)&float64_t v16 = v16;
    result.n64_u32[1] = LODWORD(v16);
  }
  return result;
}

+ (id)keyframesForTrackingData:(double)a3 withFeaturePoints:(double)a4 referenceOriginTransform:(double)a5
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v10 = a7;
  id v11 = a8;
  uint64_t v43 = 0;
  unint64_t v44 = 0;
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x2020000000;
  unsigned int v12 = CV3DVIOCreateKeyframesFromMap();
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  float32x4_t v36 = __82__ARWorldMap_keyframesForTrackingData_withFeaturePoints_referenceOriginTransform___block_invoke;
  float32x4_t v37 = &unk_1E6185458;
  float32x4_t v38 = &v40;
  unint64_t v39 = v44;
  if (v12)
  {
    uint64_t v13 = _ARLogGeneral_23();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      long long v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      float64_t v16 = NSStringFromCV3DVIOReturn(v12);
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v15;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = a1;
      *(_WORD *)&buf[22] = 2114;
      *(void *)&buf[24] = v16;
      _os_log_impl(&dword_1B88A2000, v13, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Failed to parse keyframes: %{public}@", buf, 0x20u);
    }
  }
  else
  {
    a1 = objc_opt_new();
    if (v44)
    {
      uint64_t v17 = 0;
      for (unint64_t i = 0; i < v44; ++i)
      {
        uint64_t v55 = 0;
        long long v53 = 0u;
        long long v54 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        *(_OWORD *)&buf[16] = 0u;
        long long v46 = 0u;
        *(_OWORD *)buf = 0u;
        long long v19 = (long long *)(v41[3] + v17);
        long long v20 = *v19;
        long long v21 = v19[1];
        long long v22 = v19[2];
        long long v47 = v19[3];
        *(_OWORD *)&buf[16] = v21;
        long long v46 = v22;
        long long v23 = v19[7];
        long long v25 = v19[4];
        long long v24 = v19[5];
        long long v50 = v19[6];
        long long v51 = v23;
        long long v48 = v25;
        long long v49 = v24;
        long long v27 = v19[9];
        long long v26 = v19[10];
        long long v28 = v19[8];
        uint64_t v55 = *((void *)v19 + 22);
        long long v53 = v27;
        long long v54 = v26;
        long long v52 = v28;
        *(_OWORD *)buf = v20;
        float32x4_t v29 = -[ARKeyFrame initWithKeyframeData:featurePoints:referenceOriginTransform:]([ARKeyFrame alloc], "initWithKeyframeData:featurePoints:referenceOriginTransform:", buf, v11, a2, a3, a4, a5);
        [a1 addObject:v29];

        v17 += 184;
      }
    }
  }
  v36((uint64_t)v35);
  _Block_object_dispose(&v40, 8);
  if (v12) {
    a1 = objc_opt_new();
  }

  return a1;
}

uint64_t __82__ARWorldMap_keyframesForTrackingData_withFeaturePoints_referenceOriginTransform___block_invoke(uint64_t a1)
{
  return MEMORY[0x1F4109AA8](*(void *)(a1 + 40), *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
}

- (simd_float3)center
{
  return *(simd_float3 *)self->_center;
}

- (simd_float3)extent
{
  return *(simd_float3 *)self->_extent;
}

- (NSArray)anchors
{
  return self->_anchors;
}

- (void)setAnchors:(NSArray *)anchors
{
}

- (ARPointCloud)rawFeaturePoints
{
  return self->_rawFeaturePoints;
}

- (int64_t)version
{
  return self->_version;
}

- (NSData)trackingData
{
  return self->_trackingData;
}

- (NSData)surfaceData
{
  return self->_surfaceData;
}

- (void)setSurfaceData:(id)a3
{
}

- (__n128)referenceOriginTransform
{
  return a1[5];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_surfaceData, 0);
  objc_storeStrong((id *)&self->_trackingData, 0);
  objc_storeStrong((id *)&self->_rawFeaturePoints, 0);
  objc_storeStrong((id *)&self->_anchors, 0);
}

@end