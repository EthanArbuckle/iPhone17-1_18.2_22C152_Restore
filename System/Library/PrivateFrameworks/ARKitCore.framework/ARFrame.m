@interface ARFrame
+ (BOOL)supportsSecureCoding;
- (ARBody2D)detectedBody;
- (ARCamera)camera;
- (ARCamera)ultraWideCamera;
- (ARDepthData)sceneDepth;
- (ARDepthData)smoothedSceneDepth;
- (ARFaceData)faceData;
- (ARFrame)initWithCamera:(id)a3 timestamp:(double)a4;
- (ARFrame)initWithCoder:(id)a3;
- (ARFrame)initWithTimestamp:(double)a3 context:(id)a4;
- (ARFrameTimingData)timingData;
- (ARGeoTrackingStatus)geoTrackingStatus;
- (ARHitTestResult)_hitTestFromOrigin:(float32x4_t)a3 withDirection:(float32x4_t)a4 planeAlignment:(float32x4_t)a5 forPlanes:(float32x4_t)a6 referenceOriginTransform:(uint64_t)a7;
- (ARLightEstimate)lightEstimate;
- (ARLineCloud)worldTrackingLineCloud;
- (ARPointCloud)capturedPointCloudData;
- (ARPointCloud)featurePoints;
- (ARPointCloud)rawFeaturePoints;
- (ARPointCloud)referenceFeaturePoints;
- (ARRawSceneUnderstandingData)rawSceneUnderstandingData;
- (ARRaycastQuery)raycastQueryFromPoint:(CGPoint)point allowingTarget:(ARRaycastTarget)target alignment:(ARRaycastTargetAlignment)alignment;
- (ARVLStateData)vlState;
- (ARVideoFormat)currentlyActiveVideoFormat;
- (ARWorldMappingStatus)worldMappingStatus;
- (ARWorldTrackingErrorData)worldTrackingErrorData;
- (ARWorldTrackingState)worldTrackingState;
- (AVDepthData)capturedDepthData;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHighResolution;
- (BOOL)referenceOriginChanged;
- (BOOL)referenceOriginDeltaAvailable;
- (BOOL)referenceOriginTransformAvailable;
- (BOOL)referenceOriginTransformUpdated;
- (BOOL)sessionOriginTransformAvailable;
- (BOOL)shouldRestrictFrameRate;
- (BOOL)useHittestRaycasting;
- (BOOL)worldAlignmentTransformAvailable;
- (CGAffineTransform)displayTransformForOrientation:(SEL)a3 viewportSize:(UIInterfaceOrientation)orientation;
- (CGImage)depthMap;
- (CLLocation)location;
- (CLLocation)rawLocation;
- (CVPixelBufferRef)capturedImage;
- (CVPixelBufferRef)estimatedDepthData;
- (CVPixelBufferRef)segmentationBuffer;
- (MTLTexture)imageNoiseTexture;
- (NSArray)anchors;
- (NSArray)cachedPointClouds;
- (NSArray)detectedBodies;
- (NSArray)detectedPersonMetadata;
- (NSArray)hitTest:(CGPoint)point types:(ARHitTestResultType)types;
- (NSArray)privateAnchors;
- (NSArray)resultDatas;
- (NSDate)captureDate;
- (NSDictionary)exifData;
- (NSDictionary)tiffData;
- (NSTimeInterval)capturedDepthDataTimestamp;
- (NSTimeInterval)timestamp;
- (VLLocalizationDebugInfo)vlDebugInfo;
- (__CVBuffer)capturedUltraWideImage;
- (__CVBuffer)depthConfidenceData;
- (__CVBuffer)depthNormalData;
- (__CVBuffer)downSampledMattingPixelBuffer;
- (__CVBuffer)mattingScaleImagePixelBuffer;
- (__CVBuffer)semanticSegmentationBuffer;
- (__n128)gravityAlignedReferenceOriginTransform;
- (__n128)referenceOriginDelta;
- (__n128)referenceOriginTransform;
- (__n128)sessionOriginTransform;
- (__n128)setReferenceOriginDelta:(__n128)a3;
- (__n128)setReferenceOriginTransform:(__n128)a3;
- (__n128)setSessionOriginTransform:(__n128)a3;
- (__n128)setWorldAlignmentTransform:(__n128)a3;
- (__n128)worldAlignmentTransform;
- (double)currentCaptureTimestamp;
- (double)estimatedLuminance;
- (double)heading;
- (double)rawHeading;
- (double)rawLocationTimestamp;
- (double)transformPointToNDCSpace:(double)a3;
- (double)ultraWideImageTimestamp;
- (double)undulation;
- (float)cameraGrainIntensity;
- (float)imageNoiseIntensity;
- (id)_hitTestEstimatedPlanesFromOrigin:(ARFrame *)self withDirection:(SEL)a2 planeAlignment:(int64_t)a3;
- (id)_hitTestFromOrigin:(ARFrame *)self withDirection:(SEL)a2 types:(unint64_t)a3;
- (id)_horizontalPlaneEstimateFromFeaturePoint:(ARFrame *)self fromOrigin:(SEL)a2 withDirection:;
- (id)cameraGrainTexture;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)deviceOrientation;
- (int64_t)renderFramesPerSecond;
- (int64_t)worldAlignment;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setAnchors:(id)a3;
- (void)setCachedPointClouds:(id)a3;
- (void)setCaptureDate:(id)a3;
- (void)setCapturedDepthData:(id)a3;
- (void)setCapturedDepthDataTimestamp:(double)a3;
- (void)setCapturedImage:(__CVBuffer *)a3;
- (void)setCapturedPointCloudData:(id)a3;
- (void)setCurrentlyActiveVideoFormat:(id)a3;
- (void)setDepthConfidenceData:(__CVBuffer *)a3;
- (void)setDepthMap:(CGImage *)a3;
- (void)setDepthNormalData:(__CVBuffer *)a3;
- (void)setDetectedBodies:(id)a3;
- (void)setDetectedPersonMetadata:(id)a3;
- (void)setDeviceOrientation:(int64_t)a3;
- (void)setDownSampledMattingPixelBuffer:(__CVBuffer *)a3;
- (void)setEstimatedDepthData:(__CVBuffer *)a3;
- (void)setEstimatedLuminance:(double)a3;
- (void)setFaceData:(id)a3;
- (void)setFeaturePoints:(id)a3;
- (void)setGeoTrackingStatus:(id)a3;
- (void)setHeading:(double)a3;
- (void)setImageNoiseIntensity:(float)a3;
- (void)setImageNoiseTexture:(id)a3;
- (void)setLightEstimate:(id)a3;
- (void)setLocation:(id)a3;
- (void)setMattingScaleImagePixelBuffer:(__CVBuffer *)a3;
- (void)setPrivateAnchors:(id)a3;
- (void)setRawHeading:(double)a3;
- (void)setRawLocation:(id)a3;
- (void)setRawLocationTimestamp:(double)a3;
- (void)setRawSceneUnderstandingData:(id)a3;
- (void)setReferenceFeaturePoints:(id)a3;
- (void)setReferenceOriginChanged:(BOOL)a3;
- (void)setReferenceOriginTransformUpdated:(BOOL)a3;
- (void)setRenderFramesPerSecond:(int64_t)a3;
- (void)setResultDatas:(id)a3;
- (void)setSceneDepth:(id)a3;
- (void)setSegmentationBuffer:(__CVBuffer *)a3;
- (void)setSemanticSegmentationBuffer:(__CVBuffer *)a3;
- (void)setShouldRestrictFrameRate:(BOOL)a3;
- (void)setSmoothedSceneDepth:(id)a3;
- (void)setTimingData:(id)a3;
- (void)setUndulation:(double)a3;
- (void)setVlDebugInfo:(id)a3;
- (void)setVlState:(id)a3;
- (void)setWorldAlignment:(int64_t)a3;
- (void)setWorldMappingStatus:(int64_t)a3;
- (void)setWorldTrackingErrorData:(id)a3;
- (void)setWorldTrackingLineCloud:(id)a3;
- (void)setWorldTrackingState:(id)a3;
@end

@implementation ARFrame

- (ARFrame)initWithCamera:(id)a3 timestamp:(double)a4
{
  id v7 = a3;
  v21.receiver = self;
  v21.super_class = (Class)ARFrame;
  v8 = [(ARFrame *)&v21 init];
  v9 = v8;
  if (v8)
  {
    v8->_timestamp = a4;
    objc_storeStrong((id *)&v8->_camera, a3);
    anchors = v9->_anchors;
    v11 = (NSArray *)MEMORY[0x1E4F1CBF0];
    v9->_anchors = (NSArray *)MEMORY[0x1E4F1CBF0];

    privateAnchors = v9->_privateAnchors;
    v9->_privateAnchors = v11;

    v9->_worldMappingStatus = 0;
    uint64_t v13 = MEMORY[0x1E4F149A0];
    long long v14 = *MEMORY[0x1E4F149A0];
    long long v15 = *(_OWORD *)(MEMORY[0x1E4F149A0] + 16);
    *(_OWORD *)v9->_anon_1f0 = *MEMORY[0x1E4F149A0];
    *(_OWORD *)&v9->_anon_1f0[16] = v15;
    long long v16 = *(_OWORD *)(v13 + 32);
    long long v17 = *(_OWORD *)(v13 + 48);
    *(_OWORD *)&v9->_anon_1f0[32] = v16;
    *(_OWORD *)&v9->_anon_1f0[48] = v17;
    *(_OWORD *)v9->_anon_230 = v14;
    *(_OWORD *)&v9->_anon_230[16] = v15;
    *(_OWORD *)&v9->_anon_230[32] = v16;
    *(_OWORD *)&v9->_anon_230[48] = v17;
    *(_OWORD *)v9->_anon_270 = v14;
    *(_OWORD *)&v9->_anon_270[16] = v15;
    *(_OWORD *)&v9->_anon_270[32] = v16;
    *(_OWORD *)&v9->_anon_270[48] = v17;
    *(_OWORD *)&v9[1]._shouldRestrictFrameRate = v16;
    *(_OWORD *)&v9[1]._segmentationBuffer = v17;
    *(_OWORD *)&v9[1].super.isa = v14;
    *(_OWORD *)&v9[1]._cachedVerticalPlaneAnchors = v15;
    detectedBodies = v9->_detectedBodies;
    v9->_detectedBodies = v11;

    detectedPersonMetadata = v9->_detectedPersonMetadata;
    v9->_detectedPersonMetadata = v11;

    kdebug_trace();
  }

  return v9;
}

- (ARFrame)initWithTimestamp:(double)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = [v6 imageData];
  id v8 = [[ARCamera alloc] initFromImageData:v7];
  v9 = [(ARFrame *)self initWithCamera:v8 timestamp:a3];
  if (v9)
  {
    v9->_capturedImage = CVPixelBufferRetain((CVPixelBufferRef)[v7 pixelBuffer]);
    v10 = [v7 exifData];
    uint64_t v11 = [v10 copy];
    v12 = (void *)v11;
    if (v11) {
      uint64_t v13 = (void *)v11;
    }
    else {
      uint64_t v13 = (void *)MEMORY[0x1E4F1CC08];
    }
    objc_storeStrong((id *)&v9->_exifData, v13);

    long long v14 = [v7 tiffData];
    uint64_t v15 = [v14 copy];
    tiffData = v9->_tiffData;
    v9->_tiffData = (NSDictionary *)v15;

    v9->_highResolution = [v7 isHighResolution];
    v9->_deviceOrientation = [v7 deviceOrientation];
    [v7 currentCaptureTimestamp];
    v9->_currentCaptureTimestamp = v17;
    uint64_t v18 = [v7 captureDate];
    captureDate = v9->_captureDate;
    v9->_captureDate = (NSDate *)v18;

    uint64_t v20 = [v7 depthData];
    capturedDepthData = v9->_capturedDepthData;
    v9->_capturedDepthData = (AVDepthData *)v20;

    uint64_t v22 = [v7 pointCloud];
    capturedPointCloudData = v9->_capturedPointCloudData;
    v9->_capturedPointCloudData = (ARPointCloud *)v22;

    [v7 depthDataTimestamp];
    v9->_capturedDepthDataTimestamp = v24;
    uint64_t v25 = [v7 faceData];
    faceData = v9->_faceData;
    v9->_faceData = (ARFaceData *)v25;

    v9->_renderFramesPerSecond = [v7 captureFramesPerSecond];
    v9->_worldAlignment = [v6 worldAlignment];
    if ([v7 pixelBuffer] && (objc_msgSend(v7, "isHighResolution") & 1) == 0)
    {
      [v8 imageResolution];
      double v28 = v27;
      [v8 imageResolution];
      v30 = +[ARImageNoiseTexture sharedInstanceForCameraPosition:longEdgeImageResolution:](ARImageNoiseTexture, "sharedInstanceForCameraPosition:longEdgeImageResolution:", [v7 cameraPosition], fmax(v28, v29));
      [v7 signalToNoiseRatio];
      objc_msgSend(v30, "snrToNoiseIntensity:");
      v9->_cameraGrainIntensity = v31;
      uint64_t v32 = [v30 texture];
      cameraGrainTexture = v9->_cameraGrainTexture;
      v9->_cameraGrainTexture = (MTLTexture *)v32;

      v9->_imageNoiseIntensity = v9->_cameraGrainIntensity;
      objc_storeStrong((id *)&v9->_imageNoiseTexture, v9->_cameraGrainTexture);
    }
    v34 = [v7 latestUltraWideImage];
    v35 = v34;
    if (v34)
    {
      v9->_capturedUltraWideImage = CVPixelBufferRetain((CVPixelBufferRef)[v34 pixelBuffer]);
      [v35 timestamp];
      v9->_ultraWideImageTimestamp = v36;
      v37 = [[ARCamera alloc] initFromImageData:v35];
      ultraWideCamera = v9->_ultraWideCamera;
      v9->_ultraWideCamera = v37;
    }
    uint64_t v39 = [v8 devicePosition];
    v40 = [v7 cameraType];
    [v7 ISO];
    double v42 = v41;
    [v7 exposureDuration];
    double v44 = v43;
    [v7 exposureTargetOffset];
    v9->_estimatedLuminance = AREstimatedSceneLuminanceForCamera(v39, v40, v42, v44, v45);
  }
  return v9;
}

- (void)setCapturedImage:(__CVBuffer *)a3
{
  capturedImage = self->_capturedImage;
  if (capturedImage != a3)
  {
    CVPixelBufferRelease(capturedImage);
    self->_capturedImage = CVPixelBufferRetain(a3);
  }
}

- (void)setSegmentationBuffer:(__CVBuffer *)a3
{
  segmentationBuffer = self->_segmentationBuffer;
  if (segmentationBuffer != a3)
  {
    CVPixelBufferRelease(segmentationBuffer);
    self->_segmentationBuffer = a3;
    CVPixelBufferRetain(a3);
  }
}

- (void)setEstimatedDepthData:(__CVBuffer *)a3
{
  estimatedDepthData = self->_estimatedDepthData;
  if (estimatedDepthData != a3)
  {
    CVPixelBufferRelease(estimatedDepthData);
    self->_estimatedDepthData = a3;
    CVPixelBufferRetain(a3);
  }
}

- (void)setDepthConfidenceData:(__CVBuffer *)a3
{
  depthConfidenceData = self->_depthConfidenceData;
  if (depthConfidenceData != a3)
  {
    CVPixelBufferRelease(depthConfidenceData);
    self->_depthConfidenceData = a3;
    CVPixelBufferRetain(a3);
  }
}

- (void)setDepthNormalData:(__CVBuffer *)a3
{
  depthNormalData = self->_depthNormalData;
  if (depthNormalData != a3)
  {
    CVPixelBufferRelease(depthNormalData);
    self->_depthNormalData = a3;
    CVPixelBufferRetain(a3);
  }
}

- (void)setSemanticSegmentationBuffer:(__CVBuffer *)a3
{
  semanticSegmentationBuffer = self->_semanticSegmentationBuffer;
  if (semanticSegmentationBuffer != a3)
  {
    CVPixelBufferRelease(semanticSegmentationBuffer);
    self->_semanticSegmentationBuffer = a3;
    CVPixelBufferRetain(a3);
  }
}

- (void)setDownSampledMattingPixelBuffer:(__CVBuffer *)a3
{
  downSampledMattingPixelBuffer = self->_downSampledMattingPixelBuffer;
  if (downSampledMattingPixelBuffer != a3)
  {
    CVPixelBufferRelease(downSampledMattingPixelBuffer);
    self->_downSampledMattingPixelBuffer = a3;
    CVPixelBufferRetain(a3);
  }
}

- (void)setMattingScaleImagePixelBuffer:(__CVBuffer *)a3
{
  mattingScaleImagePixelBuffer = self->_mattingScaleImagePixelBuffer;
  if (mattingScaleImagePixelBuffer != a3)
  {
    CVPixelBufferRelease(mattingScaleImagePixelBuffer);
    self->_mattingScaleImagePixelBuffer = a3;
    CVPixelBufferRetain(a3);
  }
}

- (ARBody2D)detectedBody
{
  v2 = [(ARFrame *)self detectedBodies];
  v3 = [v2 firstObject];

  return (ARBody2D *)v3;
}

- (void)dealloc
{
  kdebug_trace();
  CVPixelBufferRelease(self->_capturedImage);
  CVPixelBufferRelease(self->_capturedUltraWideImage);
  CVPixelBufferRelease(self->_segmentationBuffer);
  CVPixelBufferRelease(self->_estimatedDepthData);
  CVPixelBufferRelease(self->_downSampledMattingPixelBuffer);
  CVPixelBufferRelease(self->_mattingScaleImagePixelBuffer);
  CVPixelBufferRelease(self->_depthConfidenceData);
  CVPixelBufferRelease(self->_depthNormalData);
  CVPixelBufferRelease(self->_semanticSegmentationBuffer);
  CGImageRelease(self->_depthMap);
  v3.receiver = self;
  v3.super_class = (Class)ARFrame;
  [(ARFrame *)&v3 dealloc];
}

- (double)transformPointToNDCSpace:(double)a3
{
  float v3 = a2;
  float v13 = (float)(v3 * 2.0) + -1.0;
  float v4 = a3;
  float v12 = (float)(v4 * -2.0) + 1.0;
  v5 = [a1 camera];
  [v5 projectionMatrix];
  simd_float4x4 v15 = __invert_f4(v14);
  float32x4_t v8 = (float32x4_t)v15.columns[0];
  float32x4_t v9 = (float32x4_t)v15.columns[1];
  float32x4_t v10 = (float32x4_t)v15.columns[3];
  float32x4_t v11 = (float32x4_t)v15.columns[2];

  float32x4_t v6 = vaddq_f32(v10, vmlaq_f32(vmlaq_n_f32(vmulq_n_f32(v8, v13), v9, v12), (float32x4_t)0, v11));
  *(void *)&double result = vdivq_f32(v6, (float32x4_t)vdupq_laneq_s32((int32x4_t)v6, 3)).u64[0];
  return result;
}

- (NSArray)hitTest:(CGPoint)point types:(ARHitTestResultType)types
{
  -[ARFrame transformPointToNDCSpace:](self, "transformPointToNDCSpace:", point.x, point.y);
  float32x4_t v6 = [(ARFrame *)self camera];
  [v6 transform];

  id v7 = [(ARFrame *)self camera];
  [v7 transform];

  return (NSArray *)-[ARFrame _hitTestFromOrigin:withDirection:types:](self, "_hitTestFromOrigin:withDirection:types:", types);
}

- (ARRaycastQuery)raycastQueryFromPoint:(CGPoint)point allowingTarget:(ARRaycastTarget)target alignment:(ARRaycastTargetAlignment)alignment
{
  -[ARFrame transformPointToNDCSpace:](self, "transformPointToNDCSpace:", point.x, point.y);
  float32x4_t v25 = v8;
  float32x4_t v9 = [(ARFrame *)self camera];
  [v9 transform];
  float32x4_t v26 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v10, v25.f32[0]), v11, *(float32x2_t *)v25.f32, 1), v12, v25, 2), v13, v25, 3);

  simd_float4x4 v14 = [(ARFrame *)self camera];
  [v14 transform];
  float32x4_t v16 = vsubq_f32(v26, v15);
  int32x4_t v17 = (int32x4_t)vmulq_f32(v16, v16);
  v17.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v17, 2), vadd_f32(*(float32x2_t *)v17.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v17.i8, 1))).u32[0];
  float32x2_t v18 = vrsqrte_f32((float32x2_t)v17.u32[0]);
  float32x2_t v19 = vmul_f32(v18, vrsqrts_f32((float32x2_t)v17.u32[0], vmul_f32(v18, v18)));
  v26.i64[0] = vmulq_n_f32(v16, vmul_f32(v19, vrsqrts_f32((float32x2_t)v17.u32[0], vmul_f32(v19, v19))).f32[0]).u64[0];

  uint64_t v20 = [ARRaycastQuery alloc];
  objc_super v21 = [(ARFrame *)self camera];
  [v21 transform];
  v23 = [(ARRaycastQuery *)v20 initWithOrigin:target direction:alignment allowingTarget:v22 alignment:*(double *)v26.i64];

  return v23;
}

- (CGAffineTransform)displayTransformForOrientation:(SEL)a3 viewportSize:(UIInterfaceOrientation)orientation
{
  double height = viewportSize.height;
  double width = viewportSize.width;
  id v12 = [(ARFrame *)self camera];
  [v12 imageResolution];
  ARCameraImageToViewTransform(orientation, 0, retstr, v9, v10, width, height);

  return result;
}

- (ARPointCloud)rawFeaturePoints
{
  return self->_featurePoints;
}

- (__n128)setReferenceOriginTransform:(__n128)a3
{
  result[31] = a2;
  result[32] = a3;
  result[33] = a4;
  result[34] = a5;
  result[1].n128_u64[1] |= 1uLL;
  return result;
}

- (BOOL)referenceOriginTransformAvailable
{
  return self->_transformFlags & 1;
}

- (BOOL)referenceOriginTransformUpdated
{
  return (LOBYTE(self->_transformFlags) >> 1) & 1;
}

- (void)setReferenceOriginTransformUpdated:(BOOL)a3
{
  uint64_t v3 = 2;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_transformFlags = self->_transformFlags & 0xFFFFFFFFFFFFFFFDLL | v3;
}

- (BOOL)referenceOriginChanged
{
  return (LOBYTE(self->_transformFlags) >> 2) & 1;
}

- (void)setReferenceOriginChanged:(BOOL)a3
{
  uint64_t v3 = 4;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_transformFlags = self->_transformFlags & 0xFFFFFFFFFFFFFFFBLL | v3;
}

- (__n128)setReferenceOriginDelta:(__n128)a3
{
  result[35] = a2;
  result[36] = a3;
  result[37] = a4;
  result[38] = a5;
  result[1].n128_u64[1] |= 8uLL;
  return result;
}

- (BOOL)referenceOriginDeltaAvailable
{
  return (LOBYTE(self->_transformFlags) >> 3) & 1;
}

- (__n128)setSessionOriginTransform:(__n128)a3
{
  result[39] = a2;
  result[40] = a3;
  result[41] = a4;
  result[42] = a5;
  result[1].n128_u64[1] |= 0x10uLL;
  return result;
}

- (BOOL)sessionOriginTransformAvailable
{
  return (LOBYTE(self->_transformFlags) >> 4) & 1;
}

- (__n128)setWorldAlignmentTransform:(__n128)a3
{
  result[43] = a2;
  result[44] = a3;
  result[45] = a4;
  result[46] = a5;
  result[1].n128_u64[1] |= 0x20uLL;
  return result;
}

- (BOOL)worldAlignmentTransformAvailable
{
  return (LOBYTE(self->_transformFlags) >> 5) & 1;
}

- (__n128)gravityAlignedReferenceOriginTransform
{
  if ([(id)a1 sessionOriginTransformAvailable]
    && [(id)a1 worldAlignmentTransformAvailable])
  {
    simd_float4x4 v10 = __invert_f4(*(simd_float4x4 *)(a1 + 688));
    uint64_t v2 = 0;
    float32x4_t v3 = *(float32x4_t *)(a1 + 624);
    float32x4_t v4 = *(float32x4_t *)(a1 + 640);
    float32x4_t v5 = *(float32x4_t *)(a1 + 656);
    float32x4_t v6 = *(float32x4_t *)(a1 + 672);
    simd_float4x4 v8 = v10;
    memset(v9, 0, sizeof(v9));
    do
    {
      v9[v2] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v3, COERCE_FLOAT(*(_OWORD *)&v8.columns[v2])), v4, *(float32x2_t *)v8.columns[v2].f32, 1), v5, (float32x4_t)v8.columns[v2], 2), v6, (float32x4_t)v8.columns[v2], 3);
      ++v2;
    }
    while (v2 != 4);
    v10.columns[0].i64[0] = *(void *)&v9[0];
  }
  else if ([(id)a1 worldAlignmentTransformAvailable])
  {
    v10.columns[0].i64[0] = (unint64_t)__invert_f4(*(simd_float4x4 *)(a1 + 688));
  }
  else if ([(id)a1 sessionOriginTransformAvailable])
  {
    v10.columns[0] = *(simd_float4 *)(a1 + 624);
  }
  else
  {
    v10.columns[0] = (simd_float4)*MEMORY[0x1E4F149A0];
  }
  return (__n128)v10.columns[0];
}

- (BOOL)useHittestRaycasting
{
  if (!ARDeviceSupportsJasper()) {
    return 0;
  }
  float32x4_t v3 = [(ARFrame *)self capturedPointCloudData];
  if (v3)
  {
    float32x4_t v4 = [(ARFrame *)self capturedPointCloudData];
    BOOL v5 = [v4 count] != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)_hitTestFromOrigin:(ARFrame *)self withDirection:(SEL)a2 types:(unint64_t)a3
{
  double v67 = v3;
  double v68 = v4;
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  [(ARFrame *)self timestamp];
  kdebug_trace();
  +[ARSessionMetrics recordHitTest:a3];
  id v7 = objc_opt_new();
  if ((a3 & 0x38) != 0)
  {
    long long v71 = 0u;
    long long v72 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    simd_float4x4 v8 = [(ARFrame *)self anchors];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v69 objects:v79 count:16];
    if (!v9) {
      goto LABEL_23;
    }
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v70;
    while (1)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v70 != v11) {
          objc_enumerationMutation(v8);
        }
        float32x4_t v13 = *(void **)(*((void *)&v69 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if ((a3 & 0x20) != 0)
          {
            simd_float4x4 v14 = [v13 _hitTestFromOrigin:1 withDirection:1 usingExtent:v67 usingGeometry:v68];
            if (v14) {
              [v7 addObject:v14];
            }

            if ((a3 & 0x10) == 0)
            {
LABEL_10:
              if ((a3 & 8) == 0) {
                continue;
              }
LABEL_18:
              float32x4_t v16 = [v13 _hitTestFromOrigin:0 withDirection:0 usingExtent:v67 usingGeometry:v68];
              if (v16) {
                [v7 addObject:v16];
              }

              continue;
            }
          }
          else if ((a3 & 0x10) == 0)
          {
            goto LABEL_10;
          }
          float32x4_t v15 = [v13 _hitTestFromOrigin:1 withDirection:0 usingExtent:v67 usingGeometry:v68];
          if (v15) {
            [v7 addObject:v15];
          }

          if ((a3 & 8) != 0) {
            goto LABEL_18;
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v69 objects:v79 count:16];
      if (!v10)
      {
LABEL_23:

        break;
      }
    }
  }
  int32x4_t v17 = [(ARFrame *)self featurePoints];

  if (v17)
  {
    uint64_t v18 = [v7 count];
    if ((a3 & 2) != 0)
    {
      int64_t v19 = [(ARFrame *)self worldAlignment];
      if (v18) {
        BOOL v20 = 0;
      }
      else {
        BOOL v20 = *((float *)&v68 + 1) <= -0.00000011921;
      }
      char v21 = a3 & 0xFD;
      if (v20) {
        char v21 = a3;
      }
      if (v19 != 2) {
        LOBYTE(a3) = v21;
      }
    }
    if ((a3 & 1) == 0)
    {
      BOOL v22 = [(ARFrame *)self useHittestRaycasting];
      v23 = 0;
      if ((a3 & 2) == 0 || v22) {
        goto LABEL_47;
      }
    }
    double v24 = [(ARFrame *)self camera];
    [v24 intrinsics];
    double v62 = v26;
    float v64 = v25;
    double v60 = v27;
    double v28 = [(ARFrame *)self camera];
    [v28 imageResolution];
    LODWORD(v65) = ARCameraFieldOfViewFromIntrinsics(v64, v62, v60, v29, v30).u32[0];

    if ([(ARFrame *)self useHittestRaycasting])
    {
      float v31 = [(ARFrame *)self camera];
      [v31 transform];
      uint64_t v36 = 0;
      v73[0] = xmmword_1B8A52FC0;
      v73[1] = xmmword_1B8A52FD0;
      v73[2] = xmmword_1B8A52FE0;
      v73[3] = xmmword_1B8A2B050;
      long long v74 = 0u;
      long long v75 = 0u;
      long long v76 = 0u;
      *(_OWORD *)v77 = 0u;
      do
      {
        *(long long *)((char *)&v74 + v36 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v32, COERCE_FLOAT(v73[v36])), v33, *(float32x2_t *)&v73[v36], 1), v34, (float32x4_t)v73[v36], 2), v35, (float32x4_t)v73[v36], 3);
        ++v36;
      }
      while (v36 != 4);
      double v61 = *(double *)&v76;
      double v63 = v77[0];
      long long v58 = v74;
      long long v59 = v75;

      v37 = [(ARFrame *)self capturedPointCloudData];
      float v38 = v65 * 0.5;
      *(float *)&double v39 = v65 * 0.5;
      v23 = objc_msgSend(v37, "_hitTestPointFromOrigin:withDirection:maximumAngle:cameraToWorldTransform:", v67, v68, v39, *(double *)&v58, *(double *)&v59, v61, v63);

      if (v23)
      {
        if ((a3 & 1) == 0) {
          goto LABEL_47;
        }
        goto LABEL_45;
      }
    }
    else
    {
      float v38 = v65 * 0.5;
    }
    v40 = [(ARFrame *)self featurePoints];
    *(float *)&double v41 = v38;
    v23 = objc_msgSend(v40, "_hitTestPointFromOrigin:withDirection:maximumAngle:cameraToWorldTransform:", v67, v68, v41, *MEMORY[0x1E4F149A0], *(double *)(MEMORY[0x1E4F149A0] + 16), *(double *)(MEMORY[0x1E4F149A0] + 32), *(double *)(MEMORY[0x1E4F149A0] + 48));

    if ((a3 & 1) == 0)
    {
LABEL_47:
      if ((a3 & 2) != 0)
      {
        if ([(ARFrame *)self useHittestRaycasting])
        {
          [(ARFrame *)self referenceOriginTransform];
          +[ARHitTestRaycasting hitTestFromOrigin:resultType:origin:withDirection:referenceOriginTransform:](ARHitTestRaycasting, "hitTestFromOrigin:resultType:origin:withDirection:referenceOriginTransform:", self, 2, v67, v68, v42, v43, v44, v45);
        }
        else
        {
          [(ARFrame *)self _hitTestEstimatedPlanesFromOrigin:0 withDirection:v67 planeAlignment:v68];
        v46 = };
        if (v46)
        {
          [v7 addObject:v46];
        }
        else if (v23 && ![(ARFrame *)self useHittestRaycasting])
        {
          [v23 worldTransform];
          float32x4_t v66 = v55;
          [v23 localTransform];
          v57 = [(ARFrame *)self _horizontalPlaneEstimateFromFeaturePoint:*(double *)vsubq_f32(v66, v56).i64 fromOrigin:v67 withDirection:v68];
          if (v57) {
            [v7 addObject:v57];
          }
        }
      }
      if (!v18 && (a3 & 4) != 0)
      {
        if ([(ARFrame *)self useHittestRaycasting])
        {
          [(ARFrame *)self referenceOriginTransform];
          +[ARHitTestRaycasting hitTestFromOrigin:resultType:origin:withDirection:referenceOriginTransform:](ARHitTestRaycasting, "hitTestFromOrigin:resultType:origin:withDirection:referenceOriginTransform:", self, 4, v67, v68, v47, v48, v49, v50);
        }
        else
        {
          [(ARFrame *)self _hitTestEstimatedPlanesFromOrigin:1 withDirection:v67 planeAlignment:v68];
        v51 = };
        if (v51) {
          [v7 addObject:v51];
        }
      }
      goto LABEL_63;
    }
LABEL_45:
    if (v23) {
      [v7 addObject:v23];
    }
    goto LABEL_47;
  }
LABEL_63:
  if ((unint64_t)objc_msgSend(v7, "count", v58, v59) >= 2)
  {
    v52 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"distance" ascending:1];
    v78 = v52;
    v53 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v78 count:1];
    [v7 sortUsingDescriptors:v53];
  }
  kdebug_trace();
  return v7;
}

- (id)_horizontalPlaneEstimateFromFeaturePoint:(ARFrame *)self fromOrigin:(SEL)a2 withDirection:
{
  float32x4_t v36 = v4;
  float32x4_t v38 = v3;
  float32x4_t v34 = v2;
  [(ARFrame *)self referenceOriginTransform];
  float v7 = fabsf(v6 + -1.0);
  if (v7 >= 0.00000011921)
  {
    [(ARFrame *)self referenceOriginTransform];
    simd_float4x4 v50 = __invert_f4(v49);
    float32x4_t v10 = vaddq_f32((float32x4_t)v50.columns[3], vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v50.columns[0], v34.f32[0]), (float32x4_t)v50.columns[1], *(float32x2_t *)v34.f32, 1), (float32x4_t)v50.columns[2], v34, 2));
    float32x4_t v9 = vaddq_f32((float32x4_t)v50.columns[3], vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v50.columns[0], v38.f32[0]), (float32x4_t)v50.columns[1], *(float32x2_t *)v38.f32, 1), (float32x4_t)v50.columns[2], v38, 2));
    float32x4_t v8 = vmlaq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v50.columns[0], v36.f32[0]), (float32x4_t)v50.columns[1], *(float32x2_t *)v36.f32, 1), (float32x4_t)v50.columns[2], v36, 2), (float32x4_t)0, (float32x4_t)v50.columns[3]);
  }
  else
  {
    float32x4_t v8 = v36;
    float32x4_t v9 = v38;
    float32x4_t v10 = v34;
  }
  float32x2_t v11 = (float32x2_t)vdivq_f32(vsubq_f32(v10, v9), v8).u64[0];
  float v12 = v11.f32[1];
  if (v11.f32[1] >= 0.0)
  {
    float32x4_t v14 = vmlaq_lane_f32(v9, v8, v11, 1);
    long long v15 = *(_OWORD *)(MEMORY[0x1E4F149A0] + 16);
    long long v16 = *(_OWORD *)(MEMORY[0x1E4F149A0] + 32);
    float32x4_t v17 = vsubq_f32(v14, v10);
    v14.i32[3] = 1.0;
    v17.i32[3] = 1.0;
    long long v37 = *MEMORY[0x1E4F149A0];
    float32x4_t v39 = v14;
    long long v33 = v16;
    long long v35 = v15;
    float32x4_t v32 = v17;
    if (v7 >= 0.00000011921)
    {
      [(ARFrame *)self referenceOriginTransform];
      uint64_t v22 = 0;
      long long v40 = v37;
      long long v41 = v35;
      long long v42 = v33;
      float32x4_t v43 = v39;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      do
      {
        *(long long *)((char *)&v44 + v22) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v18, COERCE_FLOAT(*(long long *)((char *)&v40 + v22))), v19, *(float32x2_t *)((char *)&v40 + v22), 1), v20, *(float32x4_t *)((char *)&v40 + v22), 2), v21, *(float32x4_t *)((char *)&v40 + v22), 3);
        v22 += 16;
      }
      while (v22 != 64);
      double v30 = *(double *)&v45;
      double v31 = *(double *)&v44;
      double v29 = *(double *)&v46;
      v39.i64[0] = v47;
      [(ARFrame *)self referenceOriginTransform];
      uint64_t v27 = 0;
      long long v40 = v37;
      long long v41 = v35;
      long long v42 = v33;
      float32x4_t v43 = v32;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      do
      {
        *(long long *)((char *)&v44 + v27) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v23, COERCE_FLOAT(*(long long *)((char *)&v40 + v27))), v24, *(float32x2_t *)((char *)&v40 + v27), 1), v25, *(float32x4_t *)((char *)&v40 + v27), 2), v26, *(float32x4_t *)((char *)&v40 + v27), 3);
        v27 += 16;
      }
      while (v27 != 64);
      *(void *)&long long v35 = v45;
      *(void *)&long long v37 = v44;
      v32.i64[0] = v47;
      *(void *)&long long v33 = v46;
    }
    else
    {
      double v30 = *(double *)&v15;
      double v31 = *MEMORY[0x1E4F149A0];
      double v29 = *(double *)&v16;
    }
    float32x4_t v13 = [[ARHitTestResult alloc] initWithType:2];
    [(ARHitTestResult *)v13 setDistance:v12];
    -[ARHitTestResult setWorldTransform:](v13, "setWorldTransform:", v31, v30, v29, *(double *)v39.i64);
    -[ARHitTestResult setLocalTransform:](v13, "setLocalTransform:", *(double *)&v37, *(double *)&v35, *(double *)&v33, *(double *)v32.i64);
  }
  else
  {
    float32x4_t v13 = 0;
  }
  return v13;
}

- (ARHitTestResult)_hitTestFromOrigin:(float32x4_t)a3 withDirection:(float32x4_t)a4 planeAlignment:(float32x4_t)a5 forPlanes:(float32x4_t)a6 referenceOriginTransform:(uint64_t)a7
{
  id v11 = a10;
  float v12 = 0;
  if ([v11 count])
  {
    unint64_t v13 = 0;
    float v14 = fabsf(a4.f32[1] + -1.0);
    uint64_t v15 = 2;
    if (a9) {
      uint64_t v15 = 4;
    }
    uint64_t v39 = v15;
    BOOL v16 = v14 >= 0.00000011921 || a9 != 0;
    float v17 = -0.00000011921;
    do
    {
      float32x4_t v18 = [v11 objectAtIndexedSubscript:v13];
      if ([v18 alignment] == a9)
      {
        [v18 transform];
        uint64_t v19 = 0;
        v51[0] = v20;
        v51[1] = v21;
        v51[2] = v22;
        v51[3] = v23;
        long long v52 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        float32x4_t v55 = 0u;
        do
        {
          *(long long *)((char *)&v52 + v19 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a3, COERCE_FLOAT(v51[v19])), a4, *(float32x2_t *)&v51[v19], 1), a5, (float32x4_t)v51[v19], 2), a6, (float32x4_t)v51[v19], 3);
          ++v19;
        }
        while (v19 != 4);
        float32x4_t v24 = v55;
        if (v16)
        {
          double v25 = *(double *)&v52;
          double v26 = *(double *)&v53;
          double v27 = *(double *)&v54;
        }
        else
        {
          ARMatrix4x4FromRotationAndTranslation();
        }
        float32x4_t v28 = vsubq_f32(v24, a1);
        int32x4_t v29 = (int32x4_t)vmulq_f32(v28, v28);
        v29.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v29, 2), vadd_f32(*(float32x2_t *)v29.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v29.i8, 1))).u32[0];
        float32x2_t v30 = vrsqrte_f32((float32x2_t)v29.u32[0]);
        float32x2_t v31 = vmul_f32(v30, vrsqrts_f32((float32x2_t)v29.u32[0], vmul_f32(v30, v30)));
        float32x4_t v32 = vmulq_f32(vmulq_n_f32(v28, vmul_f32(v31, vrsqrts_f32((float32x2_t)v29.u32[0], vmul_f32(v31, v31))).f32[0]), a2);
        float v33 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v32, 2), vaddq_f32(v32, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v32.f32, 1))).f32[0];
        if (v33 > v17)
        {
          float v48 = v33;
          double v42 = v27;
          double v43 = *(double *)v24.i64;
          double v40 = v25;
          double v41 = v26;
          float32x4_t v34 = [ARPlaneAnchor alloc];
          long long v35 = [v18 identifier];
          float32x4_t v36 = -[ARPlaneAnchor initWithIdentifier:transform:alignment:](v34, "initWithIdentifier:transform:alignment:", v35, a9, v40, v41, v42, v43);

          long long v37 = [(ARPlaneAnchor *)v36 _hitTestFromOrigin:0 withDirection:0 usingExtent:*(double *)a1.i64 usingGeometry:*(double *)a2.i64];
          if (v37)
          {
            if (!v12) {
              float v12 = [[ARHitTestResult alloc] initWithType:v39];
            }
            [v37 distance];
            -[ARHitTestResult setDistance:](v12, "setDistance:");
            [v37 worldTransform];
            -[ARHitTestResult setWorldTransform:](v12, "setWorldTransform:");
            [v37 localTransform];
            -[ARHitTestResult setLocalTransform:](v12, "setLocalTransform:");
          }
          else
          {
            float v48 = v17;
          }

          float v17 = v48;
        }
      }

      ++v13;
    }
    while (v13 < [v11 count]);
  }

  return v12;
}

- (id)_hitTestEstimatedPlanesFromOrigin:(ARFrame *)self withDirection:(SEL)a2 planeAlignment:(int64_t)a3
{
  double v15 = v3;
  double v16 = v4;
  float v6 = self;
  objc_sync_enter(v6);
  if (a3)
  {
    float v7 = v6->_cachedVerticalPlaneAnchors;
    if (v7) {
      goto LABEL_7;
    }
    float v7 = +[ARPlaneEstimationTechnique detectPlanes:2 withFrame:v6];
    cachedVerticalPlaneAnchors = v6->_cachedVerticalPlaneAnchors;
    v6->_cachedVerticalPlaneAnchors = v7;
  }
  else
  {
    float v7 = v6->_cachedHorizontalPlaneAnchors;
    if (v7) {
      goto LABEL_7;
    }
    float v7 = +[ARPlaneEstimationTechnique detectPlanes:1 withFrame:v6];
    cachedVerticalPlaneAnchors = v6->_cachedHorizontalPlaneAnchors;
    v6->_cachedHorizontalPlaneAnchors = v7;
  }

LABEL_7:
  objc_sync_exit(v6);

  [(ARFrame *)v6 referenceOriginTransform];
  unint64_t v13 = -[ARFrame _hitTestFromOrigin:withDirection:planeAlignment:forPlanes:referenceOriginTransform:](v6, "_hitTestFromOrigin:withDirection:planeAlignment:forPlanes:referenceOriginTransform:", a3, v7, v15, v16, v9, v10, v11, v12);

  return v13;
}

- (unint64_t)hash
{
  return (uint64_t)self->_timestamp;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(ARFrame *)self timestamp];
    double v6 = v5;
    [v4 timestamp];
    BOOL v8 = v6 == v7;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)description
{
  double v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = (objc_class *)objc_opt_class();
  double v5 = NSStringFromClass(v4);
  double v6 = [v3 stringWithFormat:@"<%@: %p", v5, self];

  [(ARFrame *)self timestamp];
  objc_msgSend(v6, "appendFormat:", @" timestamp=%f", v7);
  objc_msgSend(v6, "appendFormat:", @" capturedImage=%p", -[ARFrame capturedImage](self, "capturedImage"));
  BOOL v8 = [(ARFrame *)self camera];
  objc_msgSend(v6, "appendFormat:", @" camera=%p", v8);

  double v9 = [(ARFrame *)self lightEstimate];
  objc_msgSend(v6, "appendFormat:", @" lightEstimate=%p", v9);

  double v10 = [(ARFrame *)self anchors];
  if ([v10 count] == 1)
  {
    double v11 = @"1 anchor";
  }
  else
  {
    double v12 = NSString;
    unint64_t v13 = [(ARFrame *)self anchors];
    objc_msgSend(v12, "stringWithFormat:", @"%d anchors", objc_msgSend(v13, "count"));
    double v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  [v6 appendFormat:@" | %@", v11];
  float v14 = [(ARFrame *)self featurePoints];
  [v6 appendFormat:@", %d features", objc_msgSend(v14, "count")];

  [v6 appendString:@">"];
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ARFrame)initWithCoder:(id)a3
{
  id v4 = a3;
  v49.receiver = self;
  v49.super_class = (Class)ARFrame;
  double v5 = [(ARFrame *)&v49 init];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"timestamp"];
    v5->_timestamp = v6;
    [v4 decodeDoubleForKey:@"currentCaptureTimestamp"];
    v5->_currentCaptureTimestamp = v7;
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"camera"];
    camera = v5->_camera;
    v5->_camera = (ARCamera *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"location"];
    location = v5->_location;
    v5->_location = (CLLocation *)v10;

    [v4 decodeDoubleForKey:@"heading"];
    v5->_heading = v12;
    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rawLocation"];
    rawLocation = v5->_rawLocation;
    v5->_rawLocation = (CLLocation *)v13;

    [v4 decodeDoubleForKey:@"rawHeading"];
    v5->_rawHeading = v15;
    [v4 decodeDoubleForKey:@"rawLocationTimestamp"];
    v5->_rawLocationTimestamp = v16;
    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"vlState"];
    vlState = v5->_vlState;
    v5->_vlState = (ARVLStateData *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"geoTrackingStatus"];
    geoTrackingStatus = v5->_geoTrackingStatus;
    v5->_geoTrackingStatus = (ARGeoTrackingStatus *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"vlDebugInfo"];
    vlDebugInfo = v5->_vlDebugInfo;
    v5->_vlDebugInfo = (VLLocalizationDebugInfo *)v21;

    [v4 decodeDoubleForKey:@"undulation"];
    v5->_undulation = v23;
    [v4 decodeDoubleForKey:@"capturedDepthDataTimestamp"];
    v5->_capturedDepthDataTimestamp = v24;
    double v25 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v26 = objc_opt_class();
    double v27 = objc_msgSend(v25, "setWithObjects:", v26, objc_opt_class(), 0);
    uint64_t v28 = [v4 decodeObjectOfClasses:v27 forKey:@"anchors"];
    anchors = v5->_anchors;
    v5->_anchors = (NSArray *)v28;

    float32x2_t v30 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v31 = objc_opt_class();
    float32x4_t v32 = objc_msgSend(v30, "setWithObjects:", v31, objc_opt_class(), 0);
    uint64_t v33 = [v4 decodeObjectOfClasses:v32 forKey:@"privateAnchors"];
    float32x4_t v34 = (void *)v33;
    if (v33) {
      long long v35 = (void *)v33;
    }
    else {
      long long v35 = (void *)MEMORY[0x1E4F1CBF0];
    }
    objc_storeStrong((id *)&v5->_privateAnchors, v35);

    uint64_t v36 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lightEstimate"];
    lightEstimate = v5->_lightEstimate;
    v5->_lightEstimate = (ARLightEstimate *)v36;

    uint64_t v38 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"featurePoints"];
    featurePoints = v5->_featurePoints;
    v5->_featurePoints = (ARPointCloud *)v38;

    v5->_renderFramesPerSecond = [v4 decodeIntegerForKey:@"renderFramesPerSecond"];
    v5->_shouldRestrictFrameRate = [v4 decodeBoolForKey:@"shouldRestrictFrameRate"];
    v5->_worldMappingStatus = [v4 decodeIntegerForKey:@"worldMappingStatus"];
    uint64_t v40 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"faceData"];
    faceData = v5->_faceData;
    v5->_faceData = (ARFaceData *)v40;

    v5->_highResolution = [v4 decodeBoolForKey:@"highResolution"];
    double v42 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v43 = objc_opt_class();
    uint64_t v44 = objc_opt_class();
    uint64_t v45 = objc_opt_class();
    long long v46 = objc_msgSend(v42, "setWithObjects:", v43, v44, v45, objc_opt_class(), 0);
    long long v47 = [v4 decodeObjectOfClasses:v46 forKey:@"exifData"];

    if (v47) {
      objc_storeStrong((id *)&v5->_exifData, v47);
    }
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double timestamp = self->_timestamp;
  id v5 = a3;
  [v5 encodeDouble:@"timestamp" forKey:timestamp];
  [v5 encodeDouble:@"currentCaptureTimestamp" forKey:self->_currentCaptureTimestamp];
  [v5 encodeObject:self->_camera forKey:@"camera"];
  [v5 encodeObject:self->_location forKey:@"location"];
  [v5 encodeDouble:@"heading" forKey:self->_heading];
  [v5 encodeObject:self->_rawLocation forKey:@"rawLocation"];
  [v5 encodeDouble:@"rawHeading" forKey:self->_rawHeading];
  [v5 encodeDouble:@"rawLocationTimestamp" forKey:self->_rawLocationTimestamp];
  [v5 encodeObject:self->_vlState forKey:@"vlState"];
  [v5 encodeObject:self->_geoTrackingStatus forKey:@"geoTrackingStatus"];
  [v5 encodeObject:self->_vlDebugInfo forKey:@"vlDebugInfo"];
  [v5 encodeDouble:@"undulation" forKey:self->_undulation];
  [v5 encodeDouble:@"capturedDepthDataTimestamp" forKey:self->_capturedDepthDataTimestamp];
  [v5 encodeObject:self->_anchors forKey:@"anchors"];
  [v5 encodeObject:self->_privateAnchors forKey:@"privateAnchors"];
  [v5 encodeObject:self->_lightEstimate forKey:@"lightEstimate"];
  [v5 encodeObject:self->_featurePoints forKey:@"featurePoints"];
  [v5 encodeInteger:self->_renderFramesPerSecond forKey:@"renderFramesPerSecond"];
  [v5 encodeBool:self->_shouldRestrictFrameRate forKey:@"shouldRestrictFrameRate"];
  [v5 encodeInteger:self->_worldMappingStatus forKey:@"worldMappingStatus"];
  [v5 encodeObject:self->_faceData forKey:@"faceData"];
  [v5 encodeBool:self->_highResolution forKey:@"highResolution"];
  [v5 encodeObject:self->_exifData forKey:@"exifData"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  id v6 = [(ARCamera *)self->_camera copyWithZone:a3];
  uint64_t v7 = [v5 initWithCamera:v6 timestamp:self->_timestamp];

  if (v7)
  {
    *(void *)(v7 + 56) = CVPixelBufferRetain(self->_capturedImage);
    *(unsigned char *)(v7 + 33) = self->_highResolution;
    uint64_t v8 = [(CLLocation *)self->_location copyWithZone:a3];
    double v9 = *(void **)(v7 + 384);
    *(void *)(v7 + 384) = v8;

    *(double *)(v7 + 392) = self->_heading;
    uint64_t v10 = [(CLLocation *)self->_rawLocation copyWithZone:a3];
    double v11 = *(void **)(v7 + 400);
    *(void *)(v7 + 400) = v10;

    *(double *)(v7 + 408) = self->_rawHeading;
    *(double *)(v7 + 416) = self->_rawLocationTimestamp;
    id v12 = [(ARVLStateData *)self->_vlState copyWithZone:a3];
    uint64_t v13 = *(void **)(v7 + 424);
    *(void *)(v7 + 424) = v12;

    id v14 = [(ARGeoTrackingStatus *)self->_geoTrackingStatus copyWithZone:a3];
    double v15 = *(void **)(v7 + 144);
    *(void *)(v7 + 144) = v14;

    objc_storeStrong((id *)(v7 + 432), self->_vlDebugInfo);
    *(double *)(v7 + 440) = self->_undulation;
    uint64_t v16 = [(NSArray *)self->_anchors copyWithZone:a3];
    uint64_t v17 = *(void **)(v7 + 112);
    *(void *)(v7 + 112) = v16;

    uint64_t v18 = [(NSArray *)self->_privateAnchors copyWithZone:a3];
    uint64_t v19 = *(void **)(v7 + 176);
    *(void *)(v7 + 176) = v18;

    objc_storeStrong((id *)(v7 + 120), self->_lightEstimate);
    objc_storeStrong((id *)(v7 + 184), self->_featurePoints);
    *(void *)(v7 + 128) = self->_worldMappingStatus;
    objc_storeStrong((id *)(v7 + 192), self->_referenceFeaturePoints);
    long long v20 = *(_OWORD *)self->_anon_1f0;
    long long v21 = *(_OWORD *)&self->_anon_1f0[16];
    long long v22 = *(_OWORD *)&self->_anon_1f0[48];
    *(_OWORD *)(v7 + 528) = *(_OWORD *)&self->_anon_1f0[32];
    *(_OWORD *)(v7 + 544) = v22;
    *(_OWORD *)(v7 + 496) = v20;
    *(_OWORD *)(v7 + 512) = v21;
    long long v23 = *(_OWORD *)self->_anon_230;
    long long v24 = *(_OWORD *)&self->_anon_230[16];
    long long v25 = *(_OWORD *)&self->_anon_230[48];
    *(_OWORD *)(v7 + 592) = *(_OWORD *)&self->_anon_230[32];
    *(_OWORD *)(v7 + 608) = v25;
    *(_OWORD *)(v7 + 560) = v23;
    *(_OWORD *)(v7 + 576) = v24;
    long long v26 = *(_OWORD *)self->_anon_270;
    long long v27 = *(_OWORD *)&self->_anon_270[16];
    long long v28 = *(_OWORD *)&self->_anon_270[48];
    *(_OWORD *)(v7 + 656) = *(_OWORD *)&self->_anon_270[32];
    *(_OWORD *)(v7 + 672) = v28;
    *(_OWORD *)(v7 + 624) = v26;
    *(_OWORD *)(v7 + 640) = v27;
    long long v29 = *(_OWORD *)&self[1].super.isa;
    long long v30 = *(_OWORD *)&self[1]._cachedVerticalPlaneAnchors;
    long long v31 = *(_OWORD *)&self[1]._segmentationBuffer;
    *(_OWORD *)(v7 + 720) = *(_OWORD *)&self[1]._shouldRestrictFrameRate;
    *(_OWORD *)(v7 + 736) = v31;
    *(_OWORD *)(v7 + 688) = v29;
    *(_OWORD *)(v7 + 704) = v30;
    *(void *)(v7 + 24) = self->_transformFlags;
    *(void *)(v7 + 208) = self->_worldAlignment;
    objc_storeStrong((id *)(v7 + 216), self->_timingData);
    objc_storeStrong((id *)(v7 + 224), self->_worldTrackingErrorData);
    objc_storeStrong((id *)(v7 + 232), self->_worldTrackingLineCloud);
    *(void *)(v7 + 256) = self->_renderFramesPerSecond;
    *(unsigned char *)(v7 + 32) = self->_shouldRestrictFrameRate;
    *(double *)(v7 + 168) = self->_currentCaptureTimestamp;
    objc_storeStrong((id *)(v7 + 264), self->_captureDate);
    *(double *)(v7 + 272) = self->_estimatedLuminance;
    faceData = self->_faceData;
    if (faceData) {
      objc_storeStrong((id *)(v7 + 328), faceData);
    }
    *(double *)(v7 + 96) = self->_capturedDepthDataTimestamp;
    objc_storeStrong((id *)(v7 + 88), self->_capturedDepthData);
    *(void *)(v7 + 48) = CVPixelBufferRetain(self->_segmentationBuffer);
    *(void *)(v7 + 136) = CVPixelBufferRetain(self->_estimatedDepthData);
    *(void *)(v7 + 296) = CVPixelBufferRetain(self->_downSampledMattingPixelBuffer);
    *(void *)(v7 + 304) = CVPixelBufferRetain(self->_mattingScaleImagePixelBuffer);
    uint64_t v33 = [(ARFrame *)self detectedBodies];
    uint64_t v34 = [v33 copyWithZone:a3];
    long long v35 = *(void **)(v7 + 312);
    *(void *)(v7 + 312) = v34;

    uint64_t v36 = [(ARFrame *)self detectedPersonMetadata];
    uint64_t v37 = [v36 copyWithZone:a3];
    uint64_t v38 = *(void **)(v7 + 320);
    *(void *)(v7 + 320) = v37;

    *(void *)(v7 + 352) = CVPixelBufferRetain(self->_depthConfidenceData);
    *(void *)(v7 + 360) = CVPixelBufferRetain(self->_depthNormalData);
    *(void *)(v7 + 368) = CVPixelBufferRetain(self->_semanticSegmentationBuffer);
    uint64_t v39 = [(ARFrame *)self resultDatas];
    uint64_t v40 = [v39 copyWithZone:a3];
    double v41 = *(void **)(v7 + 280);
    *(void *)(v7 + 280) = v40;

    *(void *)(v7 + 288) = self->_deviceOrientation;
    objc_storeStrong((id *)(v7 + 152), self->_sceneDepth);
    objc_storeStrong((id *)(v7 + 160), self->_smoothedSceneDepth);
    double v42 = [(ARFrame *)self exifData];
    uint64_t v43 = [v42 copyWithZone:a3];
    uint64_t v44 = *(void **)(v7 + 80);
    *(void *)(v7 + 80) = v43;
  }
  return (id)v7;
}

- (CVPixelBufferRef)segmentationBuffer
{
  return self->_segmentationBuffer;
}

- (CVPixelBufferRef)capturedImage
{
  return self->_capturedImage;
}

- (id)cameraGrainTexture
{
  return self->_cameraGrainTexture;
}

- (NSTimeInterval)timestamp
{
  return self->_timestamp;
}

- (NSDictionary)exifData
{
  return self->_exifData;
}

- (float)cameraGrainIntensity
{
  return self->_cameraGrainIntensity;
}

- (AVDepthData)capturedDepthData
{
  return self->_capturedDepthData;
}

- (void)setCapturedDepthData:(id)a3
{
}

- (NSTimeInterval)capturedDepthDataTimestamp
{
  return self->_capturedDepthDataTimestamp;
}

- (void)setCapturedDepthDataTimestamp:(double)a3
{
  self->_capturedDepthDataTimestamp = a3;
}

- (ARCamera)camera
{
  return self->_camera;
}

- (NSArray)anchors
{
  return self->_anchors;
}

- (void)setAnchors:(id)a3
{
}

- (ARLightEstimate)lightEstimate
{
  return self->_lightEstimate;
}

- (void)setLightEstimate:(id)a3
{
}

- (ARWorldMappingStatus)worldMappingStatus
{
  return self->_worldMappingStatus;
}

- (void)setWorldMappingStatus:(int64_t)a3
{
  self->_worldMappingStatus = a3;
}

- (CVPixelBufferRef)estimatedDepthData
{
  return self->_estimatedDepthData;
}

- (ARGeoTrackingStatus)geoTrackingStatus
{
  return self->_geoTrackingStatus;
}

- (void)setGeoTrackingStatus:(id)a3
{
}

- (ARDepthData)sceneDepth
{
  return self->_sceneDepth;
}

- (void)setSceneDepth:(id)a3
{
}

- (ARDepthData)smoothedSceneDepth
{
  return self->_smoothedSceneDepth;
}

- (void)setSmoothedSceneDepth:(id)a3
{
}

- (double)currentCaptureTimestamp
{
  return self->_currentCaptureTimestamp;
}

- (NSArray)privateAnchors
{
  return self->_privateAnchors;
}

- (void)setPrivateAnchors:(id)a3
{
}

- (ARPointCloud)featurePoints
{
  return self->_featurePoints;
}

- (void)setFeaturePoints:(id)a3
{
}

- (ARPointCloud)referenceFeaturePoints
{
  return self->_referenceFeaturePoints;
}

- (void)setReferenceFeaturePoints:(id)a3
{
}

- (NSArray)cachedPointClouds
{
  return self->_cachedPointClouds;
}

- (void)setCachedPointClouds:(id)a3
{
}

- (__n128)referenceOriginTransform
{
  return a1[31];
}

- (__n128)referenceOriginDelta
{
  return a1[35];
}

- (__n128)sessionOriginTransform
{
  return a1[39];
}

- (__n128)worldAlignmentTransform
{
  return a1[43];
}

- (int64_t)worldAlignment
{
  return self->_worldAlignment;
}

- (void)setWorldAlignment:(int64_t)a3
{
  self->_worldAlignment = a3;
}

- (ARFrameTimingData)timingData
{
  return self->_timingData;
}

- (void)setTimingData:(id)a3
{
}

- (ARWorldTrackingErrorData)worldTrackingErrorData
{
  return self->_worldTrackingErrorData;
}

- (void)setWorldTrackingErrorData:(id)a3
{
}

- (ARLineCloud)worldTrackingLineCloud
{
  return self->_worldTrackingLineCloud;
}

- (void)setWorldTrackingLineCloud:(id)a3
{
}

- (ARRawSceneUnderstandingData)rawSceneUnderstandingData
{
  return self->_rawSceneUnderstandingData;
}

- (void)setRawSceneUnderstandingData:(id)a3
{
}

- (ARWorldTrackingState)worldTrackingState
{
  return self->_worldTrackingState;
}

- (void)setWorldTrackingState:(id)a3
{
}

- (int64_t)renderFramesPerSecond
{
  return self->_renderFramesPerSecond;
}

- (void)setRenderFramesPerSecond:(int64_t)a3
{
  self->_renderFramesPerSecond = a3;
}

- (BOOL)shouldRestrictFrameRate
{
  return self->_shouldRestrictFrameRate;
}

- (void)setShouldRestrictFrameRate:(BOOL)a3
{
  self->_shouldRestrictFrameRate = a3;
}

- (NSDate)captureDate
{
  return self->_captureDate;
}

- (void)setCaptureDate:(id)a3
{
}

- (double)estimatedLuminance
{
  return self->_estimatedLuminance;
}

- (void)setEstimatedLuminance:(double)a3
{
  self->_estimatedLuminance = a3;
}

- (NSArray)resultDatas
{
  return self->_resultDatas;
}

- (void)setResultDatas:(id)a3
{
}

- (int64_t)deviceOrientation
{
  return self->_deviceOrientation;
}

- (void)setDeviceOrientation:(int64_t)a3
{
  self->_deviceOrientation = a3;
}

- (__CVBuffer)downSampledMattingPixelBuffer
{
  return self->_downSampledMattingPixelBuffer;
}

- (__CVBuffer)mattingScaleImagePixelBuffer
{
  return self->_mattingScaleImagePixelBuffer;
}

- (NSArray)detectedBodies
{
  return self->_detectedBodies;
}

- (void)setDetectedBodies:(id)a3
{
}

- (NSArray)detectedPersonMetadata
{
  return self->_detectedPersonMetadata;
}

- (void)setDetectedPersonMetadata:(id)a3
{
}

- (ARFaceData)faceData
{
  return self->_faceData;
}

- (void)setFaceData:(id)a3
{
}

- (ARVideoFormat)currentlyActiveVideoFormat
{
  return self->_currentlyActiveVideoFormat;
}

- (void)setCurrentlyActiveVideoFormat:(id)a3
{
}

- (BOOL)isHighResolution
{
  return self->_highResolution;
}

- (ARPointCloud)capturedPointCloudData
{
  return self->_capturedPointCloudData;
}

- (void)setCapturedPointCloudData:(id)a3
{
}

- (__CVBuffer)depthConfidenceData
{
  return self->_depthConfidenceData;
}

- (__CVBuffer)depthNormalData
{
  return self->_depthNormalData;
}

- (__CVBuffer)semanticSegmentationBuffer
{
  return self->_semanticSegmentationBuffer;
}

- (CGImage)depthMap
{
  return self->_depthMap;
}

- (void)setDepthMap:(CGImage *)a3
{
  self->_depthMap = a3;
}

- (CLLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (double)heading
{
  return self->_heading;
}

- (void)setHeading:(double)a3
{
  self->_heading = a3;
}

- (CLLocation)rawLocation
{
  return self->_rawLocation;
}

- (void)setRawLocation:(id)a3
{
}

- (double)rawHeading
{
  return self->_rawHeading;
}

- (void)setRawHeading:(double)a3
{
  self->_rawHeading = a3;
}

- (double)rawLocationTimestamp
{
  return self->_rawLocationTimestamp;
}

- (void)setRawLocationTimestamp:(double)a3
{
  self->_rawLocationTimestamp = a3;
}

- (ARVLStateData)vlState
{
  return self->_vlState;
}

- (void)setVlState:(id)a3
{
}

- (VLLocalizationDebugInfo)vlDebugInfo
{
  return self->_vlDebugInfo;
}

- (void)setVlDebugInfo:(id)a3
{
}

- (double)undulation
{
  return self->_undulation;
}

- (void)setUndulation:(double)a3
{
  self->_undulation = a3;
}

- (NSDictionary)tiffData
{
  return self->_tiffData;
}

- (double)ultraWideImageTimestamp
{
  return self->_ultraWideImageTimestamp;
}

- (__CVBuffer)capturedUltraWideImage
{
  return self->_capturedUltraWideImage;
}

- (ARCamera)ultraWideCamera
{
  return self->_ultraWideCamera;
}

- (MTLTexture)imageNoiseTexture
{
  return self->_imageNoiseTexture;
}

- (void)setImageNoiseTexture:(id)a3
{
}

- (float)imageNoiseIntensity
{
  return self->_imageNoiseIntensity;
}

- (void)setImageNoiseIntensity:(float)a3
{
  self->_imageNoiseIntensity = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageNoiseTexture, 0);
  objc_storeStrong((id *)&self->_ultraWideCamera, 0);
  objc_storeStrong((id *)&self->_tiffData, 0);
  objc_storeStrong((id *)&self->_vlDebugInfo, 0);
  objc_storeStrong((id *)&self->_vlState, 0);
  objc_storeStrong((id *)&self->_rawLocation, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_capturedPointCloudData, 0);
  objc_storeStrong((id *)&self->_currentlyActiveVideoFormat, 0);
  objc_storeStrong((id *)&self->_faceData, 0);
  objc_storeStrong((id *)&self->_detectedPersonMetadata, 0);
  objc_storeStrong((id *)&self->_detectedBodies, 0);
  objc_storeStrong((id *)&self->_resultDatas, 0);
  objc_storeStrong((id *)&self->_captureDate, 0);
  objc_storeStrong((id *)&self->_worldTrackingState, 0);
  objc_storeStrong((id *)&self->_rawSceneUnderstandingData, 0);
  objc_storeStrong((id *)&self->_worldTrackingLineCloud, 0);
  objc_storeStrong((id *)&self->_worldTrackingErrorData, 0);
  objc_storeStrong((id *)&self->_timingData, 0);
  objc_storeStrong((id *)&self->_cachedPointClouds, 0);
  objc_storeStrong((id *)&self->_referenceFeaturePoints, 0);
  objc_storeStrong((id *)&self->_featurePoints, 0);
  objc_storeStrong((id *)&self->_privateAnchors, 0);
  objc_storeStrong((id *)&self->_smoothedSceneDepth, 0);
  objc_storeStrong((id *)&self->_sceneDepth, 0);
  objc_storeStrong((id *)&self->_geoTrackingStatus, 0);
  objc_storeStrong((id *)&self->_lightEstimate, 0);
  objc_storeStrong((id *)&self->_anchors, 0);
  objc_storeStrong((id *)&self->_camera, 0);
  objc_storeStrong((id *)&self->_capturedDepthData, 0);
  objc_storeStrong((id *)&self->_exifData, 0);
  objc_storeStrong((id *)&self->_cameraGrainTexture, 0);
  objc_storeStrong((id *)&self->_cachedVerticalPlaneAnchors, 0);
  objc_storeStrong((id *)&self->_cachedHorizontalPlaneAnchors, 0);
}

@end