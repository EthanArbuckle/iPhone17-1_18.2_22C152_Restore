@interface ARMeshAnchor
+ (BOOL)supportsSecureCoding;
- (ARMeshAnchor)initWithAnchor:(id)a3;
- (ARMeshAnchor)initWithCoder:(id)a3;
- (ARMeshAnchor)initWithGeometry:(double)a3 atTimestamp:(double)a4 identifier:(double)a5 transform:(double)a6;
- (ARMeshAnchor)initWithGeometry:(double)a3 atTimestamp:(double)a4 identifier:(double)a5 transform:(double)a6 voxelSize:(double)a7;
- (ARMeshAnchor)initWithGeometry:(id)a3 atTimestamp:(double)a4 identifier:(id)a5;
- (ARMeshGeometry)geometry;
- (__n128)corner;
- (__n128)extent;
- (__n128)initWithGeometry:(simd_float4)a3 atTimestamp:(simd_float4)a4 identifier:(simd_float4)a5 visionTransform:(simd_float4)a6 referenceOriginTransform:(uint64_t)a7;
- (__n128)visionTransform;
- (double)maxExtentError;
- (double)timestamp;
- (id)description;
- (id)tracingEntry;
- (uint64_t)initWithGeometry:(__n128)a3 atTimestamp:(__n128)a4 identifier:(__n128)a5 referenceOriginTransform:(__n128)a6;
- (void)encodeWithCoder:(id)a3;
- (void)setMaxExtentError:(double)a3;
@end

@implementation ARMeshAnchor

- (uint64_t)initWithGeometry:(__n128)a3 atTimestamp:(__n128)a4 identifier:(__n128)a5 referenceOriginTransform:(__n128)a6
{
  id v12 = a9;
  id v13 = a8;
  v14 = [v13 vertices];
  ARMinimumCornerForVertexSource(v14);

  ARMatrix4x4FromRotationAndTranslation();
  uint64_t v19 = objc_msgSend(a1, "initWithGeometry:atTimestamp:identifier:visionTransform:referenceOriginTransform:", v13, v12, a2, v15, v16, v17, v18, *(_OWORD *)&a3, *(_OWORD *)&a4, *(_OWORD *)&a5, *(_OWORD *)&a6);

  return v19;
}

- (__n128)initWithGeometry:(simd_float4)a3 atTimestamp:(simd_float4)a4 identifier:(simd_float4)a5 visionTransform:(simd_float4)a6 referenceOriginTransform:(uint64_t)a7
{
  id v20 = a8;
  id v21 = a9;
  *(double *)v22.i64 = ARVisionToRenderingCoordinateTransform();
  unint64_t v26 = 0;
  simd_float4 v50 = a3;
  simd_float4 v51 = a4;
  simd_float4 v52 = a5;
  simd_float4 v53 = a6;
  float32x4_t v54 = 0u;
  float32x4_t v55 = 0u;
  float32x4_t v56 = 0u;
  float32x4_t v57 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v54 + v26) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v22, COERCE_FLOAT(*(_OWORD *)((char *)&v50 + v26))), v23, *(float32x2_t *)&v50.f32[v26 / 4], 1), v24, *(float32x4_t *)((char *)&v50 + v26), 2), v25, *(float32x4_t *)((char *)&v50 + v26), 3);
    v26 += 16;
  }
  while (v26 != 64);
  float32x4_t v40 = v55;
  float32x4_t v41 = v54;
  float32x4_t v38 = v57;
  float32x4_t v39 = v56;
  *(double *)v27.i64 = ARRenderingToVisionCoordinateTransform();
  unint64_t v28 = 0;
  simd_float4 v50 = v27;
  simd_float4 v51 = v29;
  simd_float4 v52 = v30;
  simd_float4 v53 = v31;
  float32x4_t v54 = 0u;
  float32x4_t v55 = 0u;
  float32x4_t v56 = 0u;
  float32x4_t v57 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v54 + v28) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v41, COERCE_FLOAT(*(_OWORD *)((char *)&v50 + v28))), v40, *(float32x2_t *)&v50.f32[v28 / 4], 1), v39, *(float32x4_t *)((char *)&v50 + v28), 2), v38, *(float32x4_t *)((char *)&v50 + v28), 3);
    v28 += 16;
  }
  while (v28 != 64);
  unint64_t v32 = 0;
  simd_float4 v50 = (simd_float4)v54;
  simd_float4 v51 = (simd_float4)v55;
  simd_float4 v52 = (simd_float4)v56;
  simd_float4 v53 = (simd_float4)v57;
  float32x4_t v54 = 0u;
  float32x4_t v55 = 0u;
  float32x4_t v56 = 0u;
  float32x4_t v57 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v54 + v32) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a14, COERCE_FLOAT(*(_OWORD *)((char *)&v50 + v32))), a15, *(float32x2_t *)&v50.f32[v32 / 4], 1), a16, *(float32x4_t *)((char *)&v50 + v32), 2), a17, *(float32x4_t *)((char *)&v50 + v32), 3);
    v32 += 16;
  }
  while (v32 != 64);
  double v44 = *(double *)v56.i64;
  double v45 = *(double *)v57.i64;
  double v42 = *(double *)v54.i64;
  double v43 = *(double *)v55.i64;
  v33 = [v20 vertices];
  ARConvertVisionSourceToWorldSource(v33, 0, a3, a4, a5, a6);

  v34 = [v20 normals];
  ARConvertVisionSourceToWorldSource(v34, 1, a3, a4, a5, a6);

  v35 = (__n128 *)objc_msgSend(a1, "initWithGeometry:atTimestamp:identifier:transform:", v20, v21, a2, v42, v43, v44, v45);
  v36 = v35;
  if (v35)
  {
    v35[15] = (__n128)a3;
    v35[16] = (__n128)a4;
    v35[17] = (__n128)a5;
    v35[18] = (__n128)a6;
  }

  return v36;
}

- (ARMeshAnchor)initWithGeometry:(id)a3 atTimestamp:(double)a4 identifier:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = [v9 vertices];
  ARMinimumCornerForVertexSource(v10);

  ARMatrix4x4FromRotationAndTranslation();
  double v15 = -[ARMeshAnchor initWithGeometry:atTimestamp:identifier:transform:](self, "initWithGeometry:atTimestamp:identifier:transform:", v9, v8, a4, v11, v12, v13, v14);

  return v15;
}

- (ARMeshAnchor)initWithGeometry:(double)a3 atTimestamp:(double)a4 identifier:(double)a5 transform:(double)a6
{
  id v13 = a8;
  v34.receiver = a1;
  v34.super_class = (Class)ARMeshAnchor;
  double v14 = -[ARAnchor initWithIdentifier:transform:](&v34, sel_initWithIdentifier_transform_, a9, a3, a4, a5, a6);
  double v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_geometry, a8);
    v15->_timestamp = a2;
    double v16 = [v13 vertices];
    uint64_t v17 = [v16 count];
    long long v18 = 0uLL;
    if (v17 >= 2)
    {
      uint64_t v19 = v17;
      id v20 = [v16 buffer];
      uint64_t v21 = [v20 contents];

      *(void *)&long long v18 = *(void *)v21;
      float v23 = *(float *)(v21 + 8);
      float32x4_t v22 = (float *)(v21 + 8);
      float v24 = v23;
      float v25 = v23;
      float32x2_t v26 = (float32x2_t)v18;
      do
      {
        if (v24 >= *v22) {
          float v24 = *v22;
        }
        float32x2_t v27 = *(float32x2_t *)(v22 - 2);
        float32x2_t v26 = (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v27, v26), (int8x8_t)v26, (int8x8_t)v27);
        *(int8x8_t *)&long long v18 = vbsl_s8((int8x8_t)vcgt_f32(v27, *(float32x2_t *)&v18), (int8x8_t)v27, *(int8x8_t *)&v18);
        if (v25 < *v22) {
          float v25 = *v22;
        }
        v22 += 3;
        --v19;
      }
      while (v19);
      *(float32x2_t *)&long long v18 = vsub_f32(*(float32x2_t *)&v18, v26);
      *((float *)&v18 + 2) = v25 - v24;
    }
    *(_OWORD *)v15->_extent = v18;

    unint64_t v28 = [v13 vertices];
    *(__n128 *)v15->_corner = ARMinimumCornerForVertexSource(v28);

    v15->_maxExtentError = 0.0;
    [(ARAnchor *)v15 setLastUpdateTimestamp:a2];
  }

  return v15;
}

- (ARMeshAnchor)initWithGeometry:(double)a3 atTimestamp:(double)a4 identifier:(double)a5 transform:(double)a6 voxelSize:(double)a7
{
  id v15 = a9;
  v25.receiver = a1;
  v25.super_class = (Class)ARMeshAnchor;
  double v16 = -[ARAnchor initWithIdentifier:transform:](&v25, sel_initWithIdentifier_transform_, a10, a3, a4, a5, a6);
  uint64_t v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_geometry, a9);
    v17->_timestamp = a2;
    double v18 = a7 * 64.0;
    *(float *)&double v18 = a7 * 64.0;
    *(int32x4_t *)v17->_extent = vdupq_lane_s32(*(int32x2_t *)&v18, 0);
    v17->_maxExtentError = a7 * 8.0;
    float32x4_t v19 = vnegq_f32(*(float32x4_t *)v17->_extent);
    v19.i32[1] = 0;
    *(float32x4_t *)v17->_corner = v19;
    [(ARAnchor *)v17 setLastUpdateTimestamp:a2];
  }

  return v17;
}

- (ARMeshAnchor)initWithAnchor:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ARMeshAnchor;
  v5 = [(ARAnchor *)&v17 initWithAnchor:v4];
  if (v5)
  {
    uint64_t v6 = [v4 geometry];
    geometry = v5->_geometry;
    v5->_geometry = (ARMeshGeometry *)v6;

    [v4 timestamp];
    v5->_timestamp = v8;
    [v4 extent];
    *(_OWORD *)v5->_extent = v9;
    [v4 maxExtentError];
    v5->_maxExtentError = v10;
    [v4 visionTransform];
    *(_OWORD *)&v5[1].super.super.isa = v11;
    *(_OWORD *)&v5[1].super._identifier = v12;
    *(_OWORD *)&v5[1].super._sessionIdentifier = v13;
    *(_OWORD *)v5[1].super._anon_30 = v14;
    [v4 corner];
    *(_OWORD *)v5->_corner = v15;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ARMeshAnchor;
  id v4 = a3;
  [(ARAnchor *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_geometry, @"geometry", v5.receiver, v5.super_class);
  [v4 encodeDouble:@"timestamp" forKey:self->_timestamp];
  objc_msgSend(v4, "ar_encodeVector3:forKey:", @"extent", *(double *)self->_extent);
  [v4 encodeDouble:@"maxExtentError" forKey:self->_maxExtentError];
  objc_msgSend(v4, "ar_encodeMatrix4x4:forKey:", @"visionTransform", *(double *)&self[1].super.super.isa, *(double *)&self[1].super._identifier, *(double *)&self[1].super._sessionIdentifier, *(double *)self[1].super._anon_30);
  objc_msgSend(v4, "ar_encodeVector3:forKey:", @"corner", *(double *)self->_corner);
}

- (ARMeshAnchor)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ARMeshAnchor;
  objc_super v5 = [(ARAnchor *)&v17 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"geometry"];
    geometry = v5->_geometry;
    v5->_geometry = (ARMeshGeometry *)v6;

    [v4 decodeDoubleForKey:@"timestamp"];
    v5->_timestamp = v8;
    objc_msgSend(v4, "ar_decodeVector3ForKey:", @"extent");
    *(_OWORD *)v5->_extent = v9;
    [v4 decodeDoubleForKey:@"maxExtentError"];
    v5->_maxExtentError = v10;
    objc_msgSend(v4, "ar_decodeMatrix4x4ForKey:", @"visionTransform");
    *(_OWORD *)&v5[1].super.super.isa = v11;
    *(_OWORD *)&v5[1].super._identifier = v12;
    *(_OWORD *)&v5[1].super._sessionIdentifier = v13;
    *(_OWORD *)v5[1].super._anon_30 = v14;
    objc_msgSend(v4, "ar_decodeVector3ForKey:", @"corner");
    *(_OWORD *)v5->_corner = v15;
  }

  return v5;
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p", v5, self];

  v7 = [(ARAnchor *)self identifier];
  [v6 appendFormat:@" identifier=\"%@\"", v7];

  double v8 = [(ARAnchor *)self name];

  if (v8)
  {
    long long v9 = [(ARAnchor *)self name];
    [v6 appendFormat:@" name=\"%@\"", v9];
  }
  double v10 = [(ARMeshAnchor *)self geometry];
  [v6 appendFormat:@" geometry=\"%@\"", v10];

  [(ARAnchor *)self transform];
  long long v15 = ARMatrix4x4Description(0, v11, v12, v13, v14);
  [v6 appendFormat:@" transform=%@", v15];

  if (ARInternalOSBuild())
  {
    [(ARMeshAnchor *)self timestamp];
    objc_msgSend(v6, "appendFormat:", @" timestamp=%f", v16);
  }
  [v6 appendString:@">"];
  return v6;
}

- (id)tracingEntry
{
  return +[ARQAHelper dictionaryFromMeshAnchor:self];
}

- (ARMeshGeometry)geometry
{
  return self->_geometry;
}

- (__n128)corner
{
  return a1[13];
}

- (__n128)extent
{
  return a1[14];
}

- (double)timestamp
{
  return self->_timestamp;
}

- (double)maxExtentError
{
  return self->_maxExtentError;
}

- (void)setMaxExtentError:(double)a3
{
  self->_maxExtentError = a3;
}

- (__n128)visionTransform
{
  return a1[15];
}

- (void).cxx_destruct
{
}

@end