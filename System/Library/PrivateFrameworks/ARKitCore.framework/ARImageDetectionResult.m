@interface ARImageDetectionResult
- (ARReferenceImage)referenceImage;
- (BOOL)isEqual:(id)a3;
- (__n128)setVisionTransform:(__n128)a3;
- (__n128)setWorldTrackingCameraTransformAtDetection:(__n128)a3;
- (__n128)visionTransform;
- (__n128)worldTrackingCameraTransformAtDetection;
- (double)estimatedScaleFactor;
- (double)setTransform:(__n128)a3;
- (double)transform;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)odtObjectIdentifer;
- (void)imageContext;
- (void)setEstimatedScaleFactor:(double)a3;
- (void)setImageContext:(void *)a3;
- (void)setOdtObjectIdentifer:(unint64_t)a3;
- (void)setReferenceImage:(id)a3;
@end

@implementation ARImageDetectionResult

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(ARImageDetectionResult *)self referenceImage];
    v7 = [v5 referenceImage];
    if ([v6 isEqual:v7])
    {
      [v5 visionTransform];
      float32x4_t v21 = v9;
      float32x4_t v22 = v8;
      float32x4_t v19 = v11;
      float32x4_t v20 = v10;
      [(ARImageDetectionResult *)self visionTransform];
      char v16 = AREqualTransforms(v22, v21, v20, v19, v12, v13, v14, v15);

      if ((v16 & 1) != 0
        && AREqualTransforms(*((float32x4_t *)v5 + 7), *((float32x4_t *)v5 + 8), *((float32x4_t *)v5 + 9), *((float32x4_t *)v5 + 10), *(float32x4_t *)&self[1].super.isa, *(float32x4_t *)&self[1]._referenceImage, *(float32x4_t *)&self[1]._odtObjectIdentifer, *(float32x4_t *)self[1]._anon_30)&& vabdd_f64(*((double *)v5 + 1), self->_estimatedScaleFactor) <= 2.22044605e-16)
      {
        BOOL v17 = *((void *)v5 + 4) == self->_odtObjectIdentifer;
LABEL_10:

        goto LABEL_11;
      }
    }
    else
    {
    }
    BOOL v17 = 0;
    goto LABEL_10;
  }
  BOOL v17 = 0;
LABEL_11:

  return v17;
}

- (double)transform
{
  *(double *)v2.i64 = ARRenderingToVisionCoordinateTransform();
  uint64_t v6 = 0;
  long long v7 = a1[4];
  long long v8 = a1[5];
  long long v9 = a1[6];
  long long v20 = a1[3];
  long long v21 = v7;
  long long v22 = v8;
  long long v23 = v9;
  float32x4_t v24 = 0u;
  float32x4_t v25 = 0u;
  float32x4_t v26 = 0u;
  float32x4_t v27 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v24 + v6) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v2, COERCE_FLOAT(*(long long *)((char *)&v20 + v6))), v3, *(float32x2_t *)((char *)&v20 + v6), 1), v4, *(float32x4_t *)((char *)&v20 + v6), 2), v5, *(float32x4_t *)((char *)&v20 + v6), 3);
    v6 += 16;
  }
  while (v6 != 64);
  float32x4_t v18 = v25;
  float32x4_t v19 = v24;
  float32x4_t v16 = v27;
  float32x4_t v17 = v26;
  *(double *)&long long v10 = ARVisionToRenderingCoordinateTransform();
  uint64_t v11 = 0;
  long long v20 = v10;
  long long v21 = v12;
  long long v22 = v13;
  long long v23 = v14;
  float32x4_t v24 = 0u;
  float32x4_t v25 = 0u;
  float32x4_t v26 = 0u;
  float32x4_t v27 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v24 + v11) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v19, COERCE_FLOAT(*(long long *)((char *)&v20 + v11))), v18, *(float32x2_t *)((char *)&v20 + v11), 1), v17, *(float32x4_t *)((char *)&v20 + v11), 2), v16, *(float32x4_t *)((char *)&v20 + v11), 3);
    v11 += 16;
  }
  while (v11 != 64);
  return *(double *)v24.i64;
}

- (double)setTransform:(__n128)a3
{
  *(double *)v6.i64 = ARVisionToRenderingCoordinateTransform();
  unint64_t v10 = 0;
  __n128 v28 = a2;
  __n128 v29 = a3;
  __n128 v30 = a4;
  __n128 v31 = a5;
  float32x4_t v32 = 0u;
  float32x4_t v33 = 0u;
  float32x4_t v34 = 0u;
  float32x4_t v35 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v32 + v10) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v6, COERCE_FLOAT(*(_OWORD *)((char *)&v28 + v10))), v7, (float32x2_t)v28.n128_u64[v10 / 8], 1), v8, *(float32x4_t *)((char *)&v28 + v10), 2), v9, *(float32x4_t *)((char *)&v28 + v10), 3);
    v10 += 16;
  }
  while (v10 != 64);
  float32x4_t v25 = v33;
  float32x4_t v27 = v32;
  float32x4_t v21 = v35;
  float32x4_t v23 = v34;
  v11.n128_f64[0] = ARRenderingToVisionCoordinateTransform();
  unint64_t v12 = 0;
  __n128 v28 = v11;
  __n128 v29 = v13;
  __n128 v30 = v14;
  __n128 v31 = v15;
  float32x4_t v32 = 0u;
  float32x4_t v33 = 0u;
  float32x4_t v34 = 0u;
  float32x4_t v35 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v32 + v12) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v27, COERCE_FLOAT(*(_OWORD *)((char *)&v28 + v12))), v25, (float32x2_t)v28.n128_u64[v12 / 8], 1), v23, *(float32x4_t *)((char *)&v28 + v12), 2), v21, *(float32x4_t *)((char *)&v28 + v12), 3);
    v12 += 16;
  }
  while (v12 != 64);
  double result = *(double *)v32.i64;
  float32x4_t v17 = v33;
  float32x4_t v18 = v34;
  float32x4_t v19 = v35;
  a1[3] = v32;
  a1[4] = v17;
  a1[5] = v18;
  a1[6] = v19;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [(id)objc_opt_class() allocWithZone:a3];
  [(ARImageDetectionResult *)self visionTransform];
  *(_OWORD *)(v4 + 48) = v5;
  *(_OWORD *)(v4 + 64) = v6;
  *(_OWORD *)(v4 + 80) = v7;
  *(_OWORD *)(v4 + 96) = v8;
  uint64_t v9 = [(ARImageDetectionResult *)self referenceImage];
  unint64_t v10 = *(void **)(v4 + 16);
  *(void *)(v4 + 16) = v9;

  [(ARImageDetectionResult *)self worldTrackingCameraTransformAtDetection];
  *(_OWORD *)(v4 + 112) = v11;
  *(_OWORD *)(v4 + 128) = v12;
  *(_OWORD *)(v4 + 144) = v13;
  *(_OWORD *)(v4 + 160) = v14;
  [(ARImageDetectionResult *)self estimatedScaleFactor];
  *(void *)(v4 + 8) = v15;
  *(void *)(v4 + 32) = [(ARImageDetectionResult *)self odtObjectIdentifer];
  return (id)v4;
}

- (__n128)visionTransform
{
  return a1[3];
}

- (__n128)setVisionTransform:(__n128)a3
{
  result[3] = a2;
  result[4] = a3;
  result[5] = a4;
  result[6] = a5;
  return result;
}

- (double)estimatedScaleFactor
{
  return self->_estimatedScaleFactor;
}

- (void)setEstimatedScaleFactor:(double)a3
{
  self->_estimatedScaleFactor = a3;
}

- (ARReferenceImage)referenceImage
{
  return self->_referenceImage;
}

- (void)setReferenceImage:(id)a3
{
}

- (__n128)worldTrackingCameraTransformAtDetection
{
  return a1[7];
}

- (__n128)setWorldTrackingCameraTransformAtDetection:(__n128)a3
{
  result[7] = a2;
  result[8] = a3;
  result[9] = a4;
  result[10] = a5;
  return result;
}

- (void)imageContext
{
  return self->_imageContext;
}

- (void)setImageContext:(void *)a3
{
  self->_imageContext = a3;
}

- (unint64_t)odtObjectIdentifer
{
  return self->_odtObjectIdentifer;
}

- (void)setOdtObjectIdentifer:(unint64_t)a3
{
  self->_odtObjectIdentifer = a3;
}

- (void).cxx_destruct
{
}

@end