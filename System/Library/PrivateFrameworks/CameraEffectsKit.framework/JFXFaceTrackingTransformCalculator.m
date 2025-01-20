@interface JFXFaceTrackingTransformCalculator
+ (uint64_t)interpolateFrom:to:fraction:;
- (CGSize)outputSize;
- (JFXARMetadata)arMetadata;
- (JFXFaceTrackingTransformCalculator)initWithARMetaData:(id)a3 outputSize:(CGSize)a4 playableInterfaceOrientation:(int64_t)a5;
- (__n128)cameraProjection;
- (__n128)cameraTransform;
- (__n128)nonScaledOrientedCameraTransform;
- (__n128)onFaceTransform;
- (float)pixelsPerUnit;
- (id)calculateFaceTrackingTransform;
- (int64_t)interfaceOrientation;
- (uint64_t)billboardTransform;
- (void)setArMetadata:(id)a3;
- (void)setPixelsPerUnit:(float)a3;
@end

@implementation JFXFaceTrackingTransformCalculator

- (JFXFaceTrackingTransformCalculator)initWithARMetaData:(id)a3 outputSize:(CGSize)a4 playableInterfaceOrientation:(int64_t)a5
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v10 = a3;
  v17.receiver = self;
  v17.super_class = (Class)JFXFaceTrackingTransformCalculator;
  v11 = [(JFXFaceTrackingTransformCalculator *)&v17 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_arMetadata, a3);
    v12->_outputSize.CGFloat width = width;
    v12->_outputSize.CGFloat height = height;
    v13 = [v10 faceAnchor];
    uint64_t v14 = [v13 captureInterfaceOrientation];
    if (v14) {
      int64_t v15 = v14;
    }
    else {
      int64_t v15 = a5;
    }
    v12->_interfaceOrientation = v15;
  }
  return v12;
}

- (__n128)cameraTransform
{
  [a1 nonScaledOrientedCameraTransform];
  long long v6 = v2;
  objc_msgSend(a1, "pixelsPerUnit", v3, v4);
  return (__n128)v6;
}

- (__n128)cameraProjection
{
  long long v2 = [a1 arMetadata];
  [a1 outputSize];
  objc_msgSend(v2, "cameraProjectionForOutputSize:interfaceOrientation:zNear:zFar:", objc_msgSend(a1, "interfaceOrientation"), v3, v4, 0.001, 10000.0);
  long long v7 = v5;

  return (__n128)v7;
}

- (__n128)onFaceTransform
{
  +[JFXFaceTrackingUtilities pointOnFaceMesh];
  long long v13 = v2;
  double v3 = [a1 arMetadata];
  [v3 anchorTransform];
  uint64_t v8 = 0;
  long long v9 = v13;
  HIDWORD(v9) = 1.0;
  v14[0] = xmmword_234D616A0;
  v14[1] = xmmword_234D616B0;
  v14[2] = xmmword_234D61230;
  v14[3] = v9;
  memset(v15, 0, sizeof(v15));
  long long v16 = 0u;
  do
  {
    v15[v8] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v4, COERCE_FLOAT(v14[v8])), v5, *(float32x2_t *)&v14[v8], 1), v6, (float32x4_t)v14[v8], 2), v7, (float32x4_t)v14[v8], 3);
    ++v8;
  }
  while (v8 != 4);
  long long v11 = v16;
  long long v12 = v15[0];

  objc_msgSend(a1, "pixelsPerUnit", v11);
  return (__n128)v12;
}

- (uint64_t)billboardTransform
{
  [x0_0 cameraTransform];
  pv_simd_matrix_get_rotation_matrix(v5);
  long long v2 = [x0_0 arMetadata];
  [v2 anchorTransform];
  [x0_0 pixelsPerUnit];

  return pv_simd_matrix_translate();
}

- (float)pixelsPerUnit
{
  float result = self->_pixelsPerUnit;
  if (result == 0.0)
  {
    float32x4_t v4 = [(JFXFaceTrackingTransformCalculator *)self arMetadata];
    [v4 imageResolution];

    simd_float4x4 v5 = [(JFXFaceTrackingTransformCalculator *)self arMetadata];
    [v5 anchorTransform];

    [(JFXFaceTrackingTransformCalculator *)self nonScaledOrientedCameraTransform];
    [(JFXFaceTrackingTransformCalculator *)self cameraProjection];
    pv_projected_pixels_per_unit();
    return self->_pixelsPerUnit;
  }
  return result;
}

- (__n128)nonScaledOrientedCameraTransform
{
  long long v2 = [a1 arMetadata];
  objc_msgSend(v2, "cameraTransformForInterfaceOrientation:", objc_msgSend(a1, "interfaceOrientation"));
  long long v5 = v3;

  return (__n128)v5;
}

- (id)calculateFaceTrackingTransform
{
  long long v3 = [JFXFaceTrackedEffectTransform alloc];
  [(JFXFaceTrackingTransformCalculator *)self cameraProjection];
  double v36 = v5;
  double v37 = v4;
  double v34 = v7;
  double v35 = v6;
  [(JFXFaceTrackingTransformCalculator *)self cameraTransform];
  double v32 = v9;
  double v33 = v8;
  double v30 = v11;
  double v31 = v10;
  [(JFXFaceTrackingTransformCalculator *)self onFaceTransform];
  long long v28 = v13;
  long long v29 = v12;
  long long v26 = v15;
  long long v27 = v14;
  [(JFXFaceTrackingTransformCalculator *)self billboardTransform];
  v24 = -[JFXFaceTrackedEffectTransform initWithCameraProjection:cameraTransform:onFaceTransform:billboardTransform:](v3, "initWithCameraProjection:cameraTransform:onFaceTransform:billboardTransform:", v37, v36, v35, v34, v33, v32, v31, v30, v29, v28, v27, v26, v16, v17, v18, v19, v20,
          v21,
          v22,
          v23);
  return v24;
}

+ (uint64_t)interpolateFrom:to:fraction:
{
  return MEMORY[0x270F574B0](0);
}

- (JFXARMetadata)arMetadata
{
  return self->_arMetadata;
}

- (void)setArMetadata:(id)a3
{
}

- (CGSize)outputSize
{
  double width = self->_outputSize.width;
  double height = self->_outputSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (int64_t)interfaceOrientation
{
  return self->_interfaceOrientation;
}

- (void)setPixelsPerUnit:(float)a3
{
  self->_pixelsPerUnit = a3;
}

- (void).cxx_destruct
{
}

@end