@interface DeskCamRenderingSession
- ($7350132BDA356DD21C3911335718E94B)_deskEdgeDetectorResult;
- ($FD553BEB262350C8998B8F2CDFE63E56)_undistortControls;
- (BOOL)autoZoomSupported;
- (BOOL)transformIsValid;
- (CGRect)_defaultFramingSpaceViewport:(float)a3;
- (CGRect)_estimateSubjectRectangleInFramingSpaceFromSubjectRectangleInSensorSpace:(CGRect)a3;
- (CGRect)_framingSpaceRectangleLandscapeLeft;
- (CGRect)_scaleViewportToFitInFramingSpace:(CGRect)a3;
- (CGRect)_shiftFramingSpaceRectangleToExploitSensorSpace:(CGRect)a3;
- (DeskCamRenderingSession)initWithOutputDimensions:(id)a3 portType:(id)a4 deviceType:(int)a5 isFrontFacingCamera:(BOOL)a6;
- (DeskCamSessionOptions)options;
- (__n64)_pitchMatrix;
- (__n64)_rollMatrix;
- (double)_projectPoint:(__n128)a3 intrinsicMatrix:(double)a4 rotationMatrix:(float32x4_t)a5;
- (double)_transformMatrixWithOutputCropRectangle:(double)a3;
- (double)_translationVector;
- (float)_filterAutoZoomScalingFactor:(float)a3;
- (float)_viewportScaleMultiplier;
- (float)autoZoomValue;
- (float32x2_t)_mapNormalizedPointInFramingSpaceToOutputCropRect:(simd_float3)a3 withTransformMatrix:(simd_float3)a4;
- (float32x2_t)_mapPointFromNormalizedSensorSpaceToNormalizedFramingSpace:(uint64_t)a1;
- (float32x2_t)focusPoint;
- (float32x2_t)trapezoid;
- (id)_compileComputeShader:(id)a3;
- (id)_newBufferWithLength:(unint64_t)a3 options:(unint64_t)a4 label:(id)a5;
- (int)_allocateTextures;
- (int)_compileShaders;
- (int)processBuffer:(__CVBuffer *)a3 outputPixelBuffer:(__CVBuffer *)a4;
- (uint64_t)transformMatrix;
- (unsigned)exifOrientation;
- (void)_filterDeskEdgeDetectorEndPoints:(DeskCamRenderingSession *)self :(SEL)a2;
- (void)_initializeControls;
- (void)_initializeMetal;
- (void)_updateDeskEdgeDetectionDataInOutputSpace;
- (void)_updatePitch;
- (void)_updatePitchAndRoll;
- (void)_updateRoll;
- (void)_updateSubjectRectangleInSensorSpace:(CGRect *)a3 withDetections:(id)a4;
- (void)dealloc;
- (void)registerBodyDetections:(id)a3;
- (void)registerCameraCalibrationDictionary:(id)a3;
- (void)registerCameraOrientation:(int)a3;
- (void)registerGravity:(DeskCamRenderingSession *)self;
- (void)registerOutputType:(int)a3;
- (void)setOptions:(id)a3;
@end

@implementation DeskCamRenderingSession

- (DeskCamRenderingSession)initWithOutputDimensions:(id)a3 portType:(id)a4 deviceType:(int)a5 isFrontFacingCamera:(BOOL)a6
{
  BOOL v6 = a6;
  id v11 = a4;
  v20.receiver = self;
  v20.super_class = (Class)DeskCamRenderingSession;
  v12 = [(DeskCamRenderingSession *)&v20 init];
  v13 = v12;
  if (!v12) {
    goto LABEL_8;
  }
  v12->_outputDimensions = ($470D365275581EF16070F5A11344F73E)a3;
  objc_storeStrong((id *)&v12->_portType, a4);
  v13->_deviceType = a5;
  v13->_isFrontFacingCamera = v6;
  if (v6) {
    int v14 = 4;
  }
  else {
    int v14 = 3;
  }
  v13->_cameraOrientation = v14;
  *(int32x4_t *)v13->_gravity = vdupq_n_s32(0x7FC00000u);
  *(void *)&v13->_pitch = 0;
  CGPoint v15 = (CGPoint)*MEMORY[0x1E4F1DB20];
  CGSize v16 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
  v13->_subjectRectangleInSensorSpace.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
  v13->_subjectRectangleInSensorSpace.size = v16;
  v13->_subjectRectangleInFramingSpace.origin = v15;
  v13->_subjectRectangleInFramingSpace.size = v16;
  v13->_autoZoomSupported = a5 == 3;
  LODWORD(v13->_autoZoomScalingFactor) = dword_1DD5AD1F8[a5 == 3];
  *(void *)&v13->_anon_aa0[8] = 0x1E3F666666;
  *(int32x2_t *)v13->_anon_aa0 = vdup_n_s32(0x7F7FFFFFu);
  v13->_anon_aa0[48] = 1;
  *(_DWORD *)&v13->_anon_aa0[52] = 1157234688;
  *(void *)&v13->_anon_aa0[56] = 0;
  *(void *)&v13->_autoZoomFilteringController.temporalAlpha = 0x3CA3D70A3F600000;
  v13->_autoZoomFilteringController.largeChangeThresh = 0.15;
  *(void *)&v13->_autoZoomFilteringController.errorMarginToCatch = 0x38D1B7173CF5C28FLL;
  v13->_autoZoomFilteringController.runningBuffer.size = 30;
  v13->_autoZoomFilteringController.autoZoomState = 0;
  *(_OWORD *)&v13->_autoZoomFilteringController.smallChangeObservationDurationMaxValue = xmmword_1DD5AD240;
  *(void *)&v13->_autoZoomFilteringController.largeChangeObservationDuration = 0x1E00000006;
  [(DeskCamRenderingSession *)v13 _initializeMetal];
  v13->_autoZoomFilteringController.runningBuffer.count = 0;
  v13->_autoZoomFilteringController.runningBuffer.currIdx = 0;
  v17 = (float *)malloc_type_calloc(v13->_autoZoomFilteringController.runningBuffer.size, 4uLL, 0x100004052888210uLL);
  v13->_autoZoomFilteringController.runningBuffer.data = v17;
  if (!v17)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
LABEL_8:
    v18 = 0;
    goto LABEL_9;
  }
  v18 = v13;
LABEL_9:

  return v18;
}

- (void)dealloc
{
  v3 = [(MTLCommandQueue *)self->_commandQueue commandBuffer];
  [v3 commit];
  [v3 waitUntilCompleted];
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  metalTextureCacheRef = self->_metalTextureCacheRef;
  if (metalTextureCacheRef)
  {
    CVMetalTextureCacheFlush(metalTextureCacheRef, 0);
    v5 = self->_metalTextureCacheRef;
    if (v5) {
      CFRelease(v5);
    }
  }
  free(*(void **)&self->_anon_aa0[24]);
  free(*(void **)&self->_anon_aa0[32]);
  free(*(void **)&self->_anon_aa0[40]);
  free(self->_autoZoomFilteringController.runningBuffer.data);

  v6.receiver = self;
  v6.super_class = (Class)DeskCamRenderingSession;
  [(DeskCamRenderingSession *)&v6 dealloc];
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_options, a3);

  [(DeskCamRenderingSession *)self _initializeControls];
}

- (void)_initializeControls
{
  [(DeskCamSessionOptions *)self->_options imageBlendingPercentage];
  self->_imageBlendingControls.blendingPercentage = v3;
  [(DeskCamSessionOptions *)self->_options imageBlendingRadiusUpscaler];
  self->_imageBlendingControls.radiusUpscaler = v4;
  self->_imageBlurringControls.enabled = [(DeskCamSessionOptions *)self->_options imageBlurringEnabled];
  self->_imageBlurringControls.size = [(DeskCamSessionOptions *)self->_options imageBlurringKernelSize];
  [(DeskCamSessionOptions *)self->_options imageBlurringSigma];
  self->_imageBlurringControls.sigma = v5;
  _estimateGaussianWeights(self->_imageBlurringControls.size, self->_imageBlurringControls.weights, v5);
  self->_imageSharpeningControls.enabled = [(DeskCamSessionOptions *)self->_options imageSharpeningEnabled];
  self->_imageSharpeningControls.size = [(DeskCamSessionOptions *)self->_options imageSharpeningKernelSize];
  [(DeskCamSessionOptions *)self->_options imageSharpeningSigma];
  self->_imageSharpeningControls.sigma = v6;
  [(DeskCamSessionOptions *)self->_options imageSharpeningAmount];
  self->_imageSharpeningControls.amount = v7;
  _estimateGaussianWeights(self->_imageSharpeningControls.size, self->_imageSharpeningControls.weights, self->_imageSharpeningControls.sigma);
  self->_imageToneMappingControls.enabled = [(DeskCamSessionOptions *)self->_options imageToneMappingEnabled];
  [(DeskCamSessionOptions *)self->_options imageToneMappingExponent];
  self->_imageToneMappingControls.exponent = v8;
  [(DeskCamSessionOptions *)self->_options imageToneMappingScaler];
  self->_imageToneMappingControls.scaler = v9;
  self->_anon_aa0[64] = 1;
  *(void *)&self->_anon_aa0[68] = 0x3FC0000000000003;

  _estimateGaussianWeights(3, (float *)&self->_anon_aa0[76], 1.5);
}

- (void)registerCameraCalibrationDictionary:(id)a3
{
  id v4 = a3;
  float v5 = [v4 objectForKeyedSubscript:@"IntrinsicMatrixReferenceDimensions"];
  float v6 = [v5 objectForKeyedSubscript:@"Width"];
  [v6 floatValue];
  *(_DWORD *)&self->_anon_d0[7] = v7;

  float v8 = [v4 objectForKeyedSubscript:@"IntrinsicMatrixReferenceDimensions"];
  float v9 = [v8 objectForKeyedSubscript:@"Height"];
  [v9 floatValue];
  *(_DWORD *)&self->_anon_d0[11] = v10;

  id v11 = [v4 objectForKeyedSubscript:@"LensDistortionCenter"];
  v12 = [v11 objectForKeyedSubscript:@"X"];
  [v12 floatValue];
  *(_DWORD *)&self->_anon_d0[79] = v13;

  int v14 = [v4 objectForKeyedSubscript:@"LensDistortionCenter"];
  CGPoint v15 = [v14 objectForKeyedSubscript:@"Y"];
  [v15 floatValue];
  *(_DWORD *)&self->_anon_d0[83] = v16;

  v17 = [v4 objectForKeyedSubscript:@"PixelSize"];
  [v17 floatValue];
  float v19 = v18;

  *(float *)&self->_anon_d0[87] = v19 * v19;
  id v33 = [v4 objectForKeyedSubscript:@"LensDistortionCoefficients"];
  objc_super v20 = (_OWORD *)[v33 bytes];
  long long v21 = v20[1];
  *(_OWORD *)&self->_anon_d0[127] = *v20;
  *(_OWORD *)&self->_anon_d0[143] = v21;
  id v22 = [v4 objectForKeyedSubscript:@"InverseLensDistortionCoefficients"];
  v23 = (_OWORD *)[v22 bytes];
  long long v24 = v23[1];
  *(_OWORD *)&self->_anon_d0[95] = *v23;
  *(_OWORD *)&self->_anon_d0[111] = v24;
  id v25 = [v4 objectForKeyedSubscript:@"IntrinsicMatrix"];
  v26 = (_OWORD *)[v25 bytes];
  long long v28 = v26[1];
  long long v27 = v26[2];
  *(_OWORD *)&self->_anon_d0[23] = *v26;
  *(_OWORD *)&self->_anon_d0[39] = v28;
  *(_OWORD *)&self->_anon_d0[55] = v27;
  int32x4_t v29 = *(int32x4_t *)&self->_anon_d0[23];
  int32x4_t v30 = *(int32x4_t *)&self->_anon_d0[39];
  long long v31 = *(_OWORD *)&self->_anon_d0[55];
  *(_DWORD *)&self->_anon_d0[31] = v31;
  *(_DWORD *)&self->_anon_d0[47] = DWORD1(v31);
  *(void *)&self->_anon_d0[23] = vzip1q_s32(v29, v30).u64[0];
  *(void *)&self->_anon_d0[39] = vtrn2q_s32(v29, v30).u64[0];
  *(_DWORD *)&self->_anon_d0[63] = DWORD2(v31);
  *(void *)&self->_anon_d0[55] = vzip1q_s32(vdupq_laneq_s32(v29, 2), vdupq_laneq_s32(v30, 2)).u64[0];
  v32 = [v4 objectForKeyedSubscript:@"DistortionCalibrationValidMaxRadiusInPixels"];

  *(_DWORD *)&self->_anon_d0[91] = [v32 intValue];
}

- (void)registerGravity:(DeskCamRenderingSession *)self
{
  float32x4_t v3 = v2;
  uint32x4_t v4 = (uint32x4_t)vmvnq_s8(vorrq_s8((int8x16_t)vcltzq_f32(v2), (int8x16_t)vcgezq_f32(v2)));
  v4.i32[3] = v4.i32[2];
  if ((vmaxvq_u32(v4) & 0x80000000) == 0)
  {
    uint32x4_t v6 = (uint32x4_t)vmvnq_s8(vorrq_s8((int8x16_t)vcltzq_f32(*(float32x4_t *)self->_gravity), (int8x16_t)vcgezq_f32(*(float32x4_t *)self->_gravity)));
    v6.i32[3] = v6.i32[2];
    if ((vmaxvq_u32(v6) & 0x80000000) != 0)
    {
      int32x4_t v13 = (int32x4_t)vmulq_f32(v3, v3);
      v13.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v13, 2), vadd_f32(*(float32x2_t *)v13.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v13.i8, 1))).u32[0];
      float32x2_t v14 = vrsqrte_f32((float32x2_t)v13.u32[0]);
      float32x2_t v15 = vmul_f32(v14, vrsqrts_f32((float32x2_t)v13.u32[0], vmul_f32(v14, v14)));
      float32x4_t v12 = vmulq_n_f32(v3, vmul_f32(v15, vrsqrts_f32((float32x2_t)v13.u32[0], vmul_f32(v15, v15))).f32[0]);
    }
    else
    {
      float32x4_t v16 = v3;
      float32x4_t v19 = *(float32x4_t *)self->_gravity;
      [(DeskCamSessionOptions *)self->_options gravityVectorSmoothingAlpha];
      float v18 = v7;
      int32x4_t v8 = (int32x4_t)vmulq_f32(v16, v16);
      v8.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v8, 2), vadd_f32(*(float32x2_t *)v8.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v8.i8, 1))).u32[0];
      float32x2_t v9 = vrsqrte_f32((float32x2_t)v8.u32[0]);
      float32x2_t v10 = vmul_f32(v9, vrsqrts_f32((float32x2_t)v8.u32[0], vmul_f32(v9, v9)));
      float32x4_t v17 = vmulq_n_f32(v16, vmul_f32(v10, vrsqrts_f32((float32x2_t)v8.u32[0], vmul_f32(v10, v10))).f32[0]);
      [(DeskCamSessionOptions *)self->_options gravityVectorSmoothingAlpha];
      float32x4_t v12 = vmlaq_n_f32(vmulq_n_f32(v17, 1.0 - v11), v19, v18);
    }
    *(float32x4_t *)self->_gravity = v12;
  }
}

- (void)registerCameraOrientation:(int)a3
{
  if ((a3 + 1) <= 1)
  {
    if (self->_isFrontFacingCamera) {
      a3 = 4;
    }
    else {
      a3 = 3;
    }
  }
  self->_cameraOrientation = a3;
}

- (void)registerOutputType:(int)a3
{
  self->_outputType = a3;
}

- (void)_updateSubjectRectangleInSensorSpace:(CGRect *)a3 withDetections:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = MEMORY[0x1E4F1DB20];
  double v7 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v32 = *MEMORY[0x1E4F1DB20];
  double v33 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v8 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v9 = [v5 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v36;
    float v12 = 3.4028e38;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v36 != v11) {
          objc_enumerationMutation(v5);
        }
        float32x2_t v14 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        objc_msgSend(v14, "bounds", *(void *)&v32, *(void *)&v33);
        double v16 = v15;
        [v14 bounds];
        double v34 = v16 + v17 * 0.5;
        [v14 bounds];
        double v19 = v18;
        [v14 bounds];
        v20.f64[0] = v34;
        v20.f64[1] = v19 + v21;
        float32x2_t v22 = vcvt_f32_f64(v20);
        if (v22.f32[0] >= 0.2 && v22.f32[0] <= 0.8)
        {
          float32x2_t v23 = vadd_f32(v22, (float32x2_t)0xBF800000BF000000);
          float v24 = sqrtf(vaddv_f32(vmul_f32(v23, v23)));
          if (v24 < v12)
          {
            [v14 bounds];
            double v32 = v25;
            double v33 = v26;
            double v7 = v27;
            double v8 = v28;
            float v12 = v24;
          }
        }
      }
      uint64_t v10 = [v5 countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v10);
  }
  v41.origin.x = v32;
  v41.origin.y = v33;
  v41.size.width = v7;
  v41.size.height = v8;
  if (CGRectIsNull(v41))
  {
    CGSize v29 = *(CGSize *)(v6 + 16);
    a3->origin = *(CGPoint *)v6;
    a3->size = v29;
  }
  else if (CGRectIsNull(*a3))
  {
    a3->origin.x = v32;
    a3->origin.y = v33;
    a3->size.width = v7;
    a3->size.height = v8;
  }
  else
  {
    CGFloat v30 = v33 * 0.0899999738 + a3->origin.y * 0.910000026;
    a3->origin.x = v32 * 0.0899999738 + a3->origin.x * 0.910000026;
    a3->origin.y = v30;
    CGFloat v31 = v8 * 0.0799999833 + a3->size.height * 0.920000017;
    a3->size.width = v7 * 0.0799999833 + a3->size.width * 0.920000017;
    a3->size.height = v31;
  }
}

- (void)registerBodyDetections:(id)a3
{
  if (self->_autoZoomSupported)
  {
    [(DeskCamRenderingSession *)self _updateSubjectRectangleInSensorSpace:&self->_subjectRectangleInSensorSpace withDetections:a3];
    -[DeskCamRenderingSession _estimateSubjectRectangleInFramingSpaceFromSubjectRectangleInSensorSpace:](self, "_estimateSubjectRectangleInFramingSpaceFromSubjectRectangleInSensorSpace:", self->_subjectRectangleInSensorSpace.origin.x, self->_subjectRectangleInSensorSpace.origin.y, self->_subjectRectangleInSensorSpace.size.width, self->_subjectRectangleInSensorSpace.size.height);
    self->_subjectRectangleInFramingSpace.origin.x = v4;
    self->_subjectRectangleInFramingSpace.origin.y = v5;
    self->_subjectRectangleInFramingSpace.size.width = v6;
    self->_subjectRectangleInFramingSpace.size.height = v7;
  }
}

- (CGRect)_shiftFramingSpaceRectangleToExploitSensorSpace:(CGRect)a3
{
  if (self->_isFrontFacingCamera)
  {
    double width = a3.size.width;
    double x = a3.origin.x;
    float v6 = (float)*(int *)&self->_anon_d0[91];
    float32x2_t v7 = *(float32x2_t *)&self->_anon_d0[79];
    v8.i32[0] = v7.i32[0];
    v8.f32[1] = v7.f32[1] + v6;
    float32x2_t v9 = vsub_f32(v8, v7);
    float v10 = *(float *)&self->_anon_d0[87] * vaddv_f32(vmul_f32(v9, v9));
    CGFloat v36 = self->_framingSpaceRectangle.origin.x;
    double height = self->_framingSpaceRectangle.size.height;
    CGFloat v38 = self->_framingSpaceRectangle.size.width;
    double v12 = COERCE_FLOAT(vmla_n_f32(v7, v9, 1.0/ (float)((float)((float)((float)self[296]+ (float)((float)((float)self[300]+ (float)((float)((float)self[304]+ (float)((float)((float)self[308]+ (float)((float)((float)self[312] + (float)((float)((float)self[316] + (float)((float)((float)self[320] + (float)((float)self[324] * v10)) * v10)) * v10)) * v10))* v10))* v10))* v10))* 0.01)+ 1.0)).i32[1])- height;
    [(DeskCamSessionOptions *)self->_options framingSpaceExtendPercentage];
    float v13 = x + width * 0.5;
    double v15 = width * v14;
    double v16 = v13 - v15 * 0.5;
    float v17 = v16;
    *(float *)&double v15 = v15 + v16;
    unsigned int v40 = LODWORD(v15);
    float v41 = v17;
    CGFloat v37 = height;
    double v39 = v12;
    double v18 = height + v12;
    float v19 = 0.0;
    int v20 = 30;
    float v21 = -1000.0;
    while (vabds_f32(v19, v21) > 0.005)
    {
      float v22 = (float)(v21 + v19) * 0.5;
      *(float *)&unsigned int v23 = v18 + v22;
      unsigned int v42 = v23;
      float32x2_t v24 = distortPoint((float32x2_t *)&self->_anon_d0[7], (float32x2_t)__PAIR64__(v23, LODWORD(v41)));
      float32x2_t v25 = distortPoint((float32x2_t *)&self->_anon_d0[7], (float32x2_t)__PAIR64__(v42, v40));
      float32x2_t v26 = *(float32x2_t *)&self->_anon_d0[79];
      float32x2_t v27 = vsub_f32(v24, v26);
      float32x2_t v28 = vsub_f32(v25, v26);
      float v29 = sqrtf(vaddv_f32(vmul_f32(v28, v28)));
      if (sqrtf(vaddv_f32(vmul_f32(v27, v27))) < v6 && v29 < v6)
      {
        float v21 = (float)(v21 + v19) * 0.5;
        float v22 = v19;
      }
      else
      {
        float v19 = (float)(v21 + v19) * 0.5;
      }
      if (!--v20) {
        goto LABEL_14;
      }
    }
    float v22 = v19;
LABEL_14:
    double v32 = v39 + v22;
    double y = self->_framingSpaceRectangle.origin.y;
    if (v32 > y)
    {
      self->_framingSpaceRectangle.origin.double x = v36;
      self->_framingSpaceRectangle.origin.double y = v32;
      double y = v39 + v22;
      self->_framingSpaceRectangle.size.double width = v38;
      self->_framingSpaceRectangle.size.double height = v37;
    }
  }
  else
  {
    double y = self->_framingSpaceRectangle.origin.y;
  }
  double v33 = self->_framingSpaceRectangle.origin.x;
  double v34 = self->_framingSpaceRectangle.size.width;
  double v35 = self->_framingSpaceRectangle.size.height;
  result.size.double height = v35;
  result.size.double width = v34;
  result.origin.double y = y;
  result.origin.double x = v33;
  return result;
}

- (CGRect)_defaultFramingSpaceViewport:(float)a3
{
  [(DeskCamRenderingSession *)self _framingSpaceRectangleLandscapeLeft];
  self->_framingSpaceRectangle = v31;
  double Width = CGRectGetWidth(v31);
  int v6 = self->_outputDimensions.width;
  int height = self->_outputDimensions.height;
  double MidX = CGRectGetMidX(self->_framingSpaceRectangle);
  double MidY = CGRectGetMidY(self->_framingSpaceRectangle);
  if (self->_isFrontFacingCamera && (self->_deviceType & 0xFFFFFFFE) == 2)
  {
    [(DeskCamSessionOptions *)self->_options framingSpaceScalingFactor];
    CGSize size = self->_framingSpaceRectangle.size;
    __asm { FMOV            V3.2D, #0.5 }
    CGSize v17 = (CGSize)vmulq_n_f64((float64x2_t)size, v10);
    self->_framingSpaceRectangle.origin = (CGPoint)vmlsq_f64(vcvtq_f64_f32(vcvt_f32_f64(vmlaq_f64((float64x2_t)self->_framingSpaceRectangle.origin, _Q3, (float64x2_t)size))), _Q3, (float64x2_t)v17);
    self->_framingSpaceRectangle.CGSize size = v17;
  }
  float v18 = Width * a3;
  double v19 = v18;
  double v20 = MidX - v18 * 0.5;
  double v21 = (float)(v18 / (float)((float)v6 / (float)height));
  double v22 = MidY - v21 * 0.5;
  -[DeskCamRenderingSession _shiftFramingSpaceRectangleToExploitSensorSpace:](self, "_shiftFramingSpaceRectangleToExploitSensorSpace:", v20, v22, v18, v21);
  self->_framingSpaceRectangle.origin.double x = v23;
  self->_framingSpaceRectangle.origin.double y = v24;
  self->_framingSpaceRectangle.size.double width = v25;
  self->_framingSpaceRectangle.size.int height = v26;
  double v27 = v20;
  double v28 = v22;
  double v29 = v19;
  double v30 = v21;
  result.size.int height = v30;
  result.size.double width = v29;
  result.origin.double y = v28;
  result.origin.double x = v27;
  return result;
}

- (CGRect)_framingSpaceRectangleLandscapeLeft
{
  double v2 = COERCE_FLOAT(*(void *)&self->_anon_d0[7]);
  double v3 = COERCE_FLOAT(HIDWORD(*(void *)&self->_anon_d0[7]));
  float v4 = (float)self->_outputDimensions.width / (float)self->_outputDimensions.height;
  v14.origin.double x = 0.0;
  v14.origin.double y = 0.0;
  v14.size.double width = v2;
  v14.size.int height = v3;
  float Width = CGRectGetWidth(v14);
  double v6 = (float)(Width / v4);
  v15.origin.double x = 0.0;
  v15.origin.double y = 0.0;
  v15.size.double width = v2;
  v15.size.int height = v3;
  if (CGRectGetHeight(v15) < v6)
  {
    v16.origin.double x = 0.0;
    v16.origin.double y = 0.0;
    v16.size.double width = v2;
    v16.size.int height = v3;
    float Height = CGRectGetHeight(v16);
    float Width = v4 * Height;
    double v6 = Height;
  }
  v17.origin.double x = 0.0;
  v17.origin.double y = 0.0;
  v17.size.double width = v2;
  v17.size.int height = v3;
  double v8 = Width;
  CGFloat v9 = CGRectGetMidX(v17) - Width * 0.5;
  v18.origin.double x = 0.0;
  v18.origin.double y = 0.0;
  v18.size.double width = v2;
  v18.size.int height = v3;
  double v10 = CGRectGetMidY(v18) - v6 * 0.5;
  double v11 = v9;
  double v12 = v8;
  double v13 = v6;
  result.size.int height = v13;
  result.size.double width = v12;
  result.origin.double y = v10;
  result.origin.double x = v11;
  return result;
}

- (int)processBuffer:(__CVBuffer *)a3 outputPixelBuffer:(__CVBuffer *)a4
{
  v111[31] = *MEMORY[0x1E4F143B8];
  v49 = [(MTLCommandQueue *)self->_commandQueue commandBuffer];
  double v6 = [v49 computeCommandEncoder];
  id v110 = 0;
  id v109 = 0;
  id v107 = 0;
  id v106 = 0;
  int v7 = cachedTexturesFromPixelBuffer(a3, (uint64_t)v108, self->_metalTextureCacheRef);
  if (v7)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
LABEL_32:
    id v14 = 0;
    goto LABEL_29;
  }
  int v7 = cachedTexturesFromPixelBuffer(a4, (uint64_t)v105, self->_metalTextureCacheRef);
  if (v7)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_32;
  }
  long long v103 = 0u;
  long long v104 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  long long v83 = 0u;
  CGPoint v84 = (CGPoint)0;
  long long v81 = 0u;
  CGSize v82 = (CGSize)0;
  long long v79 = 0u;
  CGSize size = (CGSize)0;
  long long v77 = 0u;
  CGPoint origin = (CGPoint)0;
  long long v76 = 0u;
  [(DeskCamRenderingSession *)self _undistortControls];
  int deviceType = self->_deviceType;
  if ((deviceType - 2) >= 2)
  {
    if (deviceType == 1)
    {
      id v14 = (id)qword_1EAB54D30;
      [v6 setComputePipelineState:v14];
      [v6 setTexture:v109 atIndex:0];
      [v6 setTexture:v110 atIndex:1];
      [v6 setTexture:v106 atIndex:2];
      [v6 setTexture:v107 atIndex:3];
      [v6 setBytes:&v76 length:464 atIndex:0];
      [v6 setImageblockWidth:32 height:32];
      v75[0] = [v106 width];
      v75[1] = [v106 height];
      v75[2] = 1;
      int64x2_t v73 = vdupq_n_s64(0x20uLL);
      uint64_t v74 = 1;
      [v6 dispatchThreads:v75 threadsPerThreadgroup:&v73];
      goto LABEL_28;
    }
LABEL_8:
    id v15 = (id)qword_1EAB54D40;
    [v6 setComputePipelineState:v15];
    [v6 setTexture:v109 atIndex:0];
    [v6 setTexture:v110 atIndex:1];
    [v6 setTexture:self->_warpedRGBLowResTexture atIndex:2];
    [v6 setBytes:&v76 length:464 atIndex:0];
    unint64_t v16 = [v15 threadExecutionWidth];
    unint64_t v17 = [v15 maxTotalThreadsPerThreadgroup];
    uint64_t v18 = [(MTLTexture *)self->_warpedRGBLowResTexture width];
    uint64_t v19 = [(MTLTexture *)self->_warpedRGBLowResTexture height];
    v67[0] = v18;
    v67[1] = v19;
    v67[2] = 1;
    v66[0] = v16;
    v66[1] = v17 / v16;
    v66[2] = 1;
    [v6 dispatchThreads:v67 threadsPerThreadgroup:v66];
    int v20 = 0;
    p_blurredRGBLowResTexture = &self->_blurredRGBLowResTexture;
    do
    {
      double v22 = v15;
      id v15 = (id)qword_1EAB54D50;

      [v6 setComputePipelineState:v15];
      if (v20) {
        p_warpedRGBLowResTexture = &self->_blurredRGBLowResTexture;
      }
      else {
        p_warpedRGBLowResTexture = &self->_warpedRGBLowResTexture;
      }
      [v6 setTexture:*p_warpedRGBLowResTexture atIndex:0];
      if (v20) {
        CGFloat v24 = &self->_warpedRGBLowResTexture;
      }
      else {
        CGFloat v24 = &self->_blurredRGBLowResTexture;
      }
      [v6 setTexture:*v24 atIndex:1];
      [v6 setBytes:&self->_imageBlurringControls length:1036 atIndex:0];
      unint64_t v25 = [v15 threadExecutionWidth];
      unint64_t v26 = [v15 maxTotalThreadsPerThreadgroup];
      uint64_t v27 = [(MTLTexture *)*p_blurredRGBLowResTexture width];
      uint64_t v28 = [(MTLTexture *)*p_blurredRGBLowResTexture height];
      v65[0] = v27;
      v65[1] = v28;
      v65[2] = 1;
      v64[0] = v25;
      v64[1] = v26 / v25;
      v64[2] = 1;
      [v6 dispatchThreads:v65 threadsPerThreadgroup:v64];
      ++v20;
    }
    while (v20 != 5);
    id v14 = (id)qword_1EAB54D60;

    [v6 setComputePipelineState:v14];
    [v6 setTexture:v109 atIndex:0];
    [v6 setTexture:v110 atIndex:1];
    [v6 setTexture:*p_blurredRGBLowResTexture atIndex:2];
    [v6 setTexture:v106 atIndex:3];
    [v6 setTexture:v107 atIndex:4];
    [v6 setBytes:&v76 length:464 atIndex:0];
    [v6 setBytes:&self->_imageBlendingControls length:8 atIndex:1];
    [v6 setImageblockWidth:32 height:32];
    v63[0] = [v106 width];
    v63[1] = [v106 height];
    v63[2] = 1;
    int64x2_t v61 = vdupq_n_s64(0x20uLL);
    uint64_t v62 = 1;
    [v6 dispatchThreads:v63 threadsPerThreadgroup:&v61];
    if (self->_autoZoomSupported)
    {
      CGRect outputCropRectangle = self->_outputCropRectangle;
      CGRect v113 = CGRectInset(outputCropRectangle, outputCropRectangle.size.width * -0.899999976, 0.0);
      CGFloat y = v113.origin.y;
      CGFloat height = v113.size.height;
      *(float32x2_t *)&long long v76 = vcvt_f32_f64((float64x2_t)v113.origin);
      *((float32x2_t *)&v76 + 1) = vcvt_f32_f64((float64x2_t)v113.size);
      v113.CGPoint origin = *(CGPoint *)&self->_plane2CameraShift[7];
      long long v77 = *(_OWORD *)&self->_camera2PlaneShift[7];
      CGPoint origin = v113.origin;
      v113.CGSize size = *(CGSize *)&self->_outputPlaneShift[7];
      long long v79 = *(_OWORD *)&self->_inputPlaneShift[7];
      CGSize size = v113.size;
      v113.CGPoint origin = *(CGPoint *)&self->_anon_170[7];
      *(_OWORD *)&v113.size.CGFloat height = *(_OWORD *)&self->_anon_170[39];
      long long v31 = *(_OWORD *)&self->_anon_1a0[7];
      long long v85 = *(_OWORD *)&self->_anon_170[23];
      long long v86 = *(_OWORD *)&v113.size.height;
      v113.CGSize size = *(CGSize *)&self->_anon_1a0[23];
      *(_OWORD *)&v113.origin.CGFloat y = *(_OWORD *)&self->_translationVector[7];
      long long v83 = *(_OWORD *)&self->_anon_1a0[39];
      CGPoint v84 = v113.origin;
      long long v81 = v31;
      CGSize v82 = v113.size;
      long long v87 = *(_OWORD *)&v113.origin.y;
      LODWORD(v88) = 2 * !self->_isFrontFacingCamera;
      id v32 = (id)qword_1EAB54D90;

      int v59 = 1065353216;
      int v60 = 1;
      [v6 setComputePipelineState:v32];
      [v6 setTexture:v109 atIndex:0];
      [v6 setTexture:v110 atIndex:1];
      [v6 setTexture:self->_lineDetectionController.inputTexture atIndex:2];
      [v6 setBytes:&v76 length:464 atIndex:0];
      [v6 setBytes:&v60 length:4 atIndex:1];
      [v6 setBytes:&v59 length:4 atIndex:2];
      unint64_t v33 = [v32 threadExecutionWidth];
      unint64_t v34 = [v32 maxTotalThreadsPerThreadgroup];
      p_lineDetectionController = &self->_lineDetectionController;
      uint64_t v36 = [(MTLTexture *)self->_lineDetectionController.inputTexture width];
      uint64_t v37 = [(MTLTexture *)self->_lineDetectionController.inputTexture height];
      v58[0] = v36;
      v58[1] = v37;
      v58[2] = 1;
      v57[0] = v33;
      v57[1] = v34 / v33;
      v57[2] = 1;
      [v6 dispatchThreads:v58 threadsPerThreadgroup:v57];
      id v14 = (id)qword_1EAB54D50;

      char v38 = 1;
      do
      {
        char v39 = v38;
        [v6 setComputePipelineState:v14];
        if (v39) {
          p_auxiliaryTexture = &self->_lineDetectionController;
        }
        else {
          p_auxiliaryTexture = ($8E83FF5E48BF42BF71708A926B8D1DB7 *)&self->_lineDetectionController.auxiliaryTexture;
        }
        [v6 setTexture:p_auxiliaryTexture->inputTexture atIndex:0];
        if (v39) {
          float v41 = ($8E83FF5E48BF42BF71708A926B8D1DB7 *)&self->_lineDetectionController.auxiliaryTexture;
        }
        else {
          float v41 = &self->_lineDetectionController;
        }
        [v6 setTexture:v41->inputTexture atIndex:1];
        [v6 setBytes:&self->_anon_aa0[64] length:1036 atIndex:0];
        unint64_t v42 = [v14 threadExecutionWidth];
        unint64_t v43 = [v14 maxTotalThreadsPerThreadgroup];
        uint64_t v44 = [(MTLTexture *)p_lineDetectionController->inputTexture width];
        uint64_t v45 = [(MTLTexture *)p_lineDetectionController->inputTexture height];
        v56[0] = v44;
        v56[1] = v45;
        v56[2] = 1;
        v55[0] = v42;
        v55[1] = v43 / v42;
        v55[2] = 1;
        [v6 dispatchThreads:v56 threadsPerThreadgroup:v55];
        char v38 = 0;
      }
      while ((v39 & 1) != 0);
      for (uint64_t i = 0; i != 31; ++i)
      {
        __float2 v47 = __sincosf_stret(DeskCamEdgeDetectorAngles[i]);
        v111[i] = __PAIR64__(LODWORD(v47.__sinval), LODWORD(v47.__cosval));
      }
      [v6 setComputePipelineState:qword_1EAB54DA0];
      [v6 setTexture:p_lineDetectionController->inputTexture atIndex:0];
      [v6 setBytes:v111 length:248 atIndex:0];
      [v6 setTexture:*(void *)&self->_anon_aa0[16] atIndex:1];
      uint64_t v53 = [*(id *)&self->_anon_aa0[16] width];
      long long v54 = xmmword_1DD5AD250;
      long long v51 = xmmword_1DD5AD260;
      uint64_t v52 = 1;
      [v6 dispatchThreads:&v53 threadsPerThreadgroup:&v51];
    }
    goto LABEL_28;
  }
  if (self->_outputType != 2) {
    goto LABEL_8;
  }
  id v9 = (id)qword_1EAB54D70;
  [v6 setComputePipelineState:v9];
  [v6 setTexture:v109 atIndex:0];
  [v6 setTexture:v110 atIndex:1];
  [v6 setTexture:self->_warpedRGBHiResTexture atIndex:2];
  [v6 setBytes:&v76 length:464 atIndex:0];
  [v6 setBytes:&self->_imageToneMappingControls length:12 atIndex:1];
  unint64_t v10 = [v9 threadExecutionWidth];
  unint64_t v11 = [v9 maxTotalThreadsPerThreadgroup];
  uint64_t v12 = [(MTLTexture *)self->_warpedRGBHiResTexture width];
  uint64_t v13 = [(MTLTexture *)self->_warpedRGBHiResTexture height];
  v72[0] = v12;
  v72[1] = v13;
  v72[2] = 1;
  v71[0] = v10;
  v71[1] = v11 / v10;
  v71[2] = 1;
  [v6 dispatchThreads:v72 threadsPerThreadgroup:v71];
  id v14 = (id)qword_1EAB54D80;

  [v6 setComputePipelineState:v14];
  [v6 setTexture:self->_warpedRGBHiResTexture atIndex:0];
  [v6 setTexture:v106 atIndex:1];
  [v6 setTexture:v107 atIndex:2];
  [v6 setBytes:&self->_imageSharpeningControls length:1040 atIndex:0];
  [v6 setImageblockWidth:32 height:32];
  v70[0] = [v106 width];
  v70[1] = [v106 height];
  v70[2] = 1;
  int64x2_t v68 = vdupq_n_s64(0x20uLL);
  uint64_t v69 = 1;
  [v6 dispatchThreads:v70 threadsPerThreadgroup:&v68];
LABEL_28:
  [v6 endEncoding];
  [v49 commit];
  [v49 waitUntilCompleted];
  int v7 = 0;
LABEL_29:

  return v7;
}

- (float)autoZoomValue
{
  if (!self->_autoZoomSupported) {
    return -1.0;
  }
  if (CGRectIsNull(self->_subjectRectangleInFramingSpace))
  {
    float v3 = 3.4028e38;
  }
  else
  {
    [(DeskCamRenderingSession *)self transformMatrix];
    int v5 = 0;
    float v3 = 3.4028e38;
    HIDWORD(v6) = 0;
    HIDWORD(v7) = 0;
    long long v20 = v7;
    long long v21 = v6;
    HIDWORD(v8) = 0;
    long long v19 = v8;
    float v9 = self->_subjectRectangleInFramingSpace.size.width / 20.0;
    do
    {
      v10.f64[0] = (float)(v9 * (float)v5);
      v10.f64[1] = self->_subjectRectangleInFramingSpace.size.height;
      -[DeskCamRenderingSession _mapNormalizedPointInFramingSpaceToOutputCropRect:withTransformMatrix:](self, "_mapNormalizedPointInFramingSpaceToOutputCropRect:withTransformMatrix:", COERCE_DOUBLE(vcvt_f32_f64(vaddq_f64((float64x2_t)self->_subjectRectangleInFramingSpace.origin, v10))), *(double *)&v21, *(double *)&v20, *(double *)&v19, v19, v20, v21);
      BOOL v13 = v11 < 0.0 || v11 > 1.0;
      float v14 = fminf(fmaxf(v12, 0.0), 1.0);
      if (!v13 && v14 < v3) {
        float v3 = v14;
      }
      ++v5;
    }
    while (v5 != 20);
  }
  [(DeskCamRenderingSession *)self _updateDeskEdgeDetectionDataInOutputSpace];
  double v16 = *(double *)self->_anon_aa0;
  BOOL v17 = *(float *)&v16 == 3.4028e38 || *((float *)&v16 + 1) == 3.4028e38;
  if (!v17 && v3 >= *((float *)&v16 + 1)) {
    LODWORD(v3) = HIDWORD(*(void *)self->_anon_aa0);
  }
  if (v3 == 3.4028e38)
  {
    float autoZoomScalingFactor = self->_autoZoomScalingFactor;
  }
  else
  {
    *(float *)&double v16 = v3;
    [(DeskCamRenderingSession *)self _filterAutoZoomScalingFactor:v16];
    self->_float autoZoomScalingFactor = autoZoomScalingFactor;
  }
  return fminf(fmaxf(1.0 / autoZoomScalingFactor, 1.0), 2.0);
}

- (CGRect)_estimateSubjectRectangleInFramingSpaceFromSubjectRectangleInSensorSpace:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double x = a3.origin.x;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  double y = a3.origin.y;
  if (CGRectIsNull(a3))
  {
    double v7 = *MEMORY[0x1E4F1DB20];
    double v8 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v9 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v10 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }
  else
  {
    uint64_t v11 = 0;
    float v13 = y + height;
    float v27 = v13;
    do
    {
      float v12 = width / 20.0;
      *(float *)&double v14 = x + (float)(v12 * (float)(int)v11);
      *((float *)&v14 + 1) = v27;
      [(DeskCamRenderingSession *)self _mapPointFromNormalizedSensorSpaceToNormalizedFramingSpace:v14];
      v29[v11++] = v15;
    }
    while (v11 != 20);
    float v16 = x;
    float v17 = x + width;
    float v24 = v17;
    v18.f64[0] = x + width * 0.5;
    v18.f64[1] = y;
    *(float32x2_t *)&v18.f64[0] = vcvt_f32_f64(v18);
    double v28 = v18.f64[0];
    *(float *)v18.f64 = v16;
    [(DeskCamRenderingSession *)self _mapPointFromNormalizedSensorSpaceToNormalizedFramingSpace:v18.f64[0]];
    float32x2_t v26 = v19;
    [(DeskCamRenderingSession *)self _mapPointFromNormalizedSensorSpaceToNormalizedFramingSpace:COERCE_DOUBLE(__PAIR64__(HIDWORD(v28), LODWORD(v24)))];
    float32x2_t v21 = v20;
    [(DeskCamRenderingSession *)self _mapPointFromNormalizedSensorSpaceToNormalizedFramingSpace:v28];
    float v23 = v30 - v22;
    double v7 = v26.f32[0];
    double v8 = v26.f32[1];
    double v9 = vsub_f32(v21, v26).f32[0];
    double v10 = v23;
  }
  result.size.double height = v10;
  result.size.double width = v9;
  result.origin.double y = v8;
  result.origin.double x = v7;
  return result;
}

- (float32x2_t)_mapPointFromNormalizedSensorSpaceToNormalizedFramingSpace:(uint64_t)a1
{
  float32x2_t v2 = *(float32x2_t *)(a1 + 208);
  float32x2_t v3 = *(float32x2_t *)(a1 + 280);
  float32x2_t v4 = vsub_f32(vmul_f32(v2, a2), v3);
  float v5 = *(float *)(a1 + 288) * vaddv_f32(vmul_f32(v4, v4));
  float32x2_t v6 = vmla_n_f32(v3, v4, 1.0/ (float)((float)((float)(*(float *)(a1 + 296)+ (float)((float)(*(float *)(a1 + 300)+ (float)((float)(*(float *)(a1 + 304)+ (float)((float)(*(float *)(a1 + 308)+ (float)((float)(*(float *)(a1 + 312)+ (float)((float)(*(float *)(a1 + 316) + (float)((float)(*(float *)(a1 + 320) + (float)(*(float *)(a1 + 324) * v5)) * v5)) * v5))* v5))* v5))* v5))* v5))* 0.01)+ 1.0));
  float32x2_t v7 = vcvt_f32_f64(vdivq_f64(vcvtq_f64_f32(v2), *(float64x2_t *)(a1 + 96)));
  return vdiv_f32(vmla_f32(vcvt_f32_f64(vmlsq_f64((float64x2_t)0, vcvtq_f64_f32(v7), *(float64x2_t *)(a1 + 80))), v7, v6), v2);
}

- (float32x2_t)_mapNormalizedPointInFramingSpaceToOutputCropRect:(simd_float3)a3 withTransformMatrix:(simd_float3)a4
{
  v6.columns[0] = a2;
  v6.columns[1] = a3;
  v6.columns[2] = a4;
  simd_float3x3 v7 = __invert_f3(v6);
  v7.columns[0] = (simd_float3)vaddq_f32((float32x4_t)v7.columns[2], vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v7.columns[0], *(float *)&a1), (float32x4_t)v7.columns[1], *(float32x2_t *)&a1, 1));
  return vdiv_f32(*(float32x2_t *)v7.columns[0].f32, (float32x2_t)vdup_laneq_s32((int32x4_t)v7.columns[0], 2));
}

- (void)_updateDeskEdgeDetectionDataInOutputSpace
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  [(DeskCamRenderingSession *)self _deskEdgeDetectorResult];
  *(int32x2_t *)v3.f32 = vzip2_s32(v37, v36);
  v3.i64[1] = v3.i64[0];
  v4.i32[0] = vmovn_s32(vcgeq_f32((float32x4_t)xmmword_1DD5AD270, v3)).u32[0];
  v4.i32[1] = vmovn_s32(vcgeq_f32(v3, (float32x4_t)xmmword_1DD5AD270)).i32[1];
  float32x2_t v5 = (float32x2_t)vdup_n_s32(0x7F7FFFFFu);
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(v4, 0xFuLL))) & 1) == 0)
  {
    double v6 = *(double *)&v5;
    goto LABEL_25;
  }
  double v6 = *(double *)&v5;
  if (v35.i32[0] < 0)
  {
LABEL_25:
    [(DeskCamRenderingSession *)self _filterDeskEdgeDetectorEndPoints:v6 :*(double *)&v5];
    return;
  }
  CGRect outputCropRectangle = self->_outputCropRectangle;
  CGRect v42 = CGRectInset(outputCropRectangle, outputCropRectangle.size.width * -0.899999976, 0.0);
  -[DeskCamRenderingSession _transformMatrixWithOutputCropRectangle:](self, "_transformMatrixWithOutputCropRectangle:", v42.origin.x, v42.origin.y, v42.size.width, v42.size.height);
  int32x4_t v10 = (int32x4_t)vaddq_f32(v9, vmlaq_lane_f32(vmulq_n_f32(v7, *(float *)v37.i32), v8, (float32x2_t)v37, 1));
  if (*(float *)&v10.i32[2] != 0.0)
  {
    float32x4_t v11 = vaddq_f32(v9, vmlaq_lane_f32(vmulq_n_f32(v7, *(float *)v36.i32), v8, (float32x2_t)v36, 1));
    if (v11.f32[2] != 0.0)
    {
      int32x4_t v32 = (int32x4_t)v11;
      float32x2_t v33 = vdiv_f32(*(float32x2_t *)v10.i8, (float32x2_t)vdup_laneq_s32(v10, 2));
      [(DeskCamRenderingSession *)self transformMatrix];
      simd_float3x3 v40 = __invert_f3(v39);
      int32x4_t v12 = (int32x4_t)vaddq_f32((float32x4_t)v40.columns[2], vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v40.columns[0], v33.f32[0]), (float32x4_t)v40.columns[1], v33, 1));
      if (*(float *)&v12.i32[2] != 0.0)
      {
        float32x2_t v13 = vdiv_f32(*(float32x2_t *)v32.i8, (float32x2_t)vdup_laneq_s32(v32, 2));
        int32x4_t v14 = (int32x4_t)vaddq_f32((float32x4_t)v40.columns[2], vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v40.columns[0], v13.f32[0]), (float32x4_t)v40.columns[1], v13, 1));
        if (*(float *)&v14.i32[2] != 0.0)
        {
          float32x2_t v5 = vdiv_f32(*(float32x2_t *)v14.i8, (float32x2_t)vdup_laneq_s32(v14, 2));
          float32x2_t v34 = vdiv_f32(*(float32x2_t *)v12.i8, (float32x2_t)vdup_laneq_s32(v12, 2));
          _getLineToRectIntersectionPoints(&v35, v34, v5, 0.0, 0.0, 1.0, 1.0);
          uint64_t v15 = 0;
          float32x2_t v16 = (float32x2_t)vdup_n_s32(0x7F7FFFFFu);
          while (1)
          {
            uint32x2_t v17 = (uint32x2_t)vmvn_s8((int8x8_t)vceq_f32((float32x2_t)*(&v35 + v15), v16));
            if ((vpmin_u32(v17, v17).u32[0] & 0x80000000) != 0) {
              break;
            }
            if (++v15 == 4) {
              goto LABEL_12;
            }
          }
          float32x2_t v16 = (float32x2_t)*(&v35 + v15);
LABEL_12:
          uint64_t v18 = v15;
          if (v15 <= 3) {
            uint64_t v15 = 3;
          }
          else {
            uint64_t v15 = v15;
          }
          float32x2_t v19 = (float32x2_t)vdup_n_s32(0x7F7FFFFFu);
          double v6 = *(double *)&v34;
          while (v15 != v18)
          {
            float32x2_t v20 = &v35 + v18++;
            float32x2_t v21 = (float32x2_t)v20[1];
            uint32x2_t v22 = (uint32x2_t)vmvn_s8((int8x8_t)vceq_f32(v21, v19));
            if ((vpmin_u32(v22, v22).u32[0] & 0x80000000) != 0) {
              goto LABEL_20;
            }
          }
          float32x2_t v21 = v19;
LABEL_20:
          float32x2_t v23 = (float32x2_t)vdup_n_s32(0x7F7FFFFFu);
          uint32x2_t v24 = (uint32x2_t)vmvn_s8((int8x8_t)vceq_f32(v16, v23));
          if ((vpmin_u32(v24, v24).u32[0] & 0x80000000) != 0)
          {
            uint32x2_t v25 = (uint32x2_t)vmvn_s8((int8x8_t)vceq_f32(v21, v23));
            if ((vpmin_u32(v25, v25).u32[0] & 0x80000000) != 0)
            {
              float32x2_t v5 = v21;
              double v6 = *(double *)&v16;
            }
            else
            {
              *(float32x2_t *)v26.f32 = v34;
              *(float32x2_t *)&v26.u32[2] = v34;
              int8x16_t v27 = (int8x16_t)xmmword_1DD5AD270;
              v28.i32[0] = vmovn_s32(vcgeq_f32((float32x4_t)xmmword_1DD5AD270, v26)).u32[0];
              v28.i32[1] = vmovn_s32(vcgeq_f32(v26, (float32x4_t)xmmword_1DD5AD270)).i32[1];
              int32x4_t v29 = (int32x4_t)vandq_s8((int8x16_t)vmovl_u16(v28), (int8x16_t)xmmword_1DD5AD280);
              v29.i32[0] = vaddvq_s32(v29);
              v30.i64[0] = 0xF0F0F0F0F0F0F0FLL;
              v30.i64[1] = 0xF0F0F0F0F0F0F0FLL;
              v27.i32[0] = 15;
              v29.i64[0] = vceqq_s8(vandq_s8((int8x16_t)v29, v30), vandq_s8(v27, v30)).u64[0];
              int8x16_t v31 = vdupq_lane_s8(*(int8x8_t *)v29.i8, 0);
              v29.i64[0] = v29.i8[0] & 0xF | (unint64_t)(16 * (v31.i8[1] & 0xF)) | ((v31.i8[2] & 0xF) << 8) & 0xFFF | ((v31.i8[3] & 0xFu) << 12) | ((unint64_t)(v31.i8[4] & 0xF) << 16) & 0xFFFFFFFFFF0FFFFFLL | ((unint64_t)(v31.i8[5] & 0xF) << 20) | ((unint64_t)(v31.i8[6] & 0xF) << 24) | ((unint64_t)(v31.i8[7] & 0xF) << 28) | ((unint64_t)(v31.i8[8] & 0xF) << 32) | ((unint64_t)(v31.i8[9] & 0xF) << 36) | ((unint64_t)(v31.i8[10] & 0xF) << 40) | ((unint64_t)(v31.i8[11] & 0xF) << 44) | ((unint64_t)(v31.i8[12] & 0xF) << 48) | ((unint64_t)(v31.i8[13] & 0xF) << 52) | ((unint64_t)(v31.i8[14] & 0xF) << 56) | ((unint64_t)v31.u8[15] << 60);
              float32x2_t v5 = (float32x2_t)vbsl_s8(*(int8x8_t *)v29.i8, (int8x8_t)v16, (int8x8_t)v5);
              double v6 = COERCE_DOUBLE(vbsl_s8(*(int8x8_t *)v29.i8, (int8x8_t)v34, (int8x8_t)v16));
            }
          }
          goto LABEL_25;
        }
      }
    }
  }
  fig_log_get_emitter();
  FigDebugAssert3();
}

- (void)_filterDeskEdgeDetectorEndPoints:(DeskCamRenderingSession *)self :(SEL)a2
{
  float32x2_t v4 = (float32x2_t)vbsl_s8((int8x8_t)vdup_lane_s32(vcgt_f32(v2, v3), 1), (int8x8_t)v2, (int8x8_t)v3);
  if (v4.f32[0] == 3.4028e38 || v4.f32[1] == 3.4028e38)
  {
    int v6 = *(_DWORD *)&self->_anon_aa0[12];
    if (v6 <= 0) {
      int v7 = 0;
    }
    else {
      int v7 = v6 - 1;
    }
    *(_DWORD *)&self->_anon_aa0[12] = v7;
    if (!v7) {
      *(int32x2_t *)self->_anon_aa0 = vdup_n_s32(0x7F7FFFFFu);
    }
  }
  else
  {
    float32x2_t v8 = *(float32x2_t *)self->_anon_aa0;
    if (v8.f32[0] != 3.4028e38 && COERCE_FLOAT(HIDWORD(*(void *)self->_anon_aa0)) != 3.4028e38) {
      float32x2_t v4 = vmla_n_f32(vmul_n_f32(v4, 1.0 - *(float *)&self->_anon_aa0[8]), v8, *(float *)&self->_anon_aa0[8]);
    }
    *(float32x2_t *)self->_anon_aa0 = v4;
    *(_DWORD *)&self->_anon_aa0[12] = 30;
  }
}

- (float)_filterAutoZoomScalingFactor:(float)a3
{
  float temporalAlpha = self->_autoZoomFilteringController.temporalAlpha;
  float errorMarginToCatch = self->_autoZoomFilteringController.errorMarginToCatch;
  float errorVarThresh = self->_autoZoomFilteringController.errorVarThresh;
  float autoZoomScalingFactor = self->_autoZoomScalingFactor;
  currIddouble x = self->_autoZoomFilteringController.runningBuffer.currIdx;
  data = self->_autoZoomFilteringController.runningBuffer.data;
  data[currIdx] = a3 - autoZoomScalingFactor;
  int size = self->_autoZoomFilteringController.runningBuffer.size;
  self->_autoZoomFilteringController.runningBuffer.currIddouble x = ((int)currIdx + 1) % size;
  int count = self->_autoZoomFilteringController.runningBuffer.count;
  if (count < size) {
    self->_autoZoomFilteringController.runningBuffer.int count = ++count;
  }
  float v11 = 0.0;
  float v12 = 0.0;
  if (count >= 1)
  {
    uint64_t v13 = count;
    do
    {
      float v14 = *data++;
      float v11 = v11 + v14;
      float v12 = v12 + (float)(v14 * v14);
      --v13;
    }
    while (v13);
  }
  float v15 = fabsf(a3 - autoZoomScalingFactor);
  if (v15 <= self->_autoZoomFilteringController.largeChangeThresh)
  {
    if (v15 < self->_autoZoomFilteringController.smallChangeThresh)
    {
      self->_autoZoomFilteringController.int smallSteadyErrorObservationDuration = self->_autoZoomFilteringController.smallSteadyErrorObservationDurationMaxValue;
      int smallChangeObservationDuration = self->_autoZoomFilteringController.smallChangeObservationDuration;
      BOOL v18 = __OFSUB__(smallChangeObservationDuration, 1);
      int v19 = smallChangeObservationDuration - 1;
      if (v19 < 0 == v18)
      {
        float result = (float)((float)(1.0 - temporalAlpha) * a3) + (float)(self->_autoZoomScalingFactor * temporalAlpha);
        self->_autoZoomFilteringController.int smallChangeObservationDuration = v19;
        return result;
      }
      self->_autoZoomFilteringController.int largeChangeObservationDuration = self->_autoZoomFilteringController.largeChangeObservationDurationMaxValue;
      self->_autoZoomFilteringController.autoZoomState = 0;
      return autoZoomScalingFactor;
    }
    if (self->_autoZoomFilteringController.autoZoomState) {
      return (float)((float)(1.0 - temporalAlpha) * a3) + (float)(self->_autoZoomScalingFactor * temporalAlpha);
    }
    float v21 = v11 / (float)count;
    float v22 = fmaxf((float)(v12 / (float)count) - (float)(v21 * v21), 0.0);
    self->_autoZoomFilteringController.int largeChangeObservationDuration = self->_autoZoomFilteringController.largeChangeObservationDurationMaxValue;
    if (fabsf(v21) > errorMarginToCatch && v22 < errorVarThresh)
    {
      int smallSteadyErrorObservationDuration = self->_autoZoomFilteringController.smallSteadyErrorObservationDuration;
      if (!smallSteadyErrorObservationDuration)
      {
        float result = (float)((float)(1.0 - temporalAlpha) * a3) + (float)(self->_autoZoomScalingFactor * temporalAlpha);
        self->_autoZoomFilteringController.int smallChangeObservationDuration = self->_autoZoomFilteringController.smallChangeObservationDurationMaxValue;
        self->_autoZoomFilteringController.int smallSteadyErrorObservationDuration = self->_autoZoomFilteringController.smallSteadyErrorObservationDurationMaxValue;
        goto LABEL_15;
      }
      int smallSteadyErrorObservationDurationMaxValue = smallSteadyErrorObservationDuration - 1;
    }
    else
    {
      int smallSteadyErrorObservationDurationMaxValue = self->_autoZoomFilteringController.smallSteadyErrorObservationDurationMaxValue;
    }
    self->_autoZoomFilteringController.int smallSteadyErrorObservationDuration = smallSteadyErrorObservationDurationMaxValue;
    return autoZoomScalingFactor;
  }
  self->_autoZoomFilteringController.int smallSteadyErrorObservationDuration = self->_autoZoomFilteringController.smallSteadyErrorObservationDurationMaxValue;
  int largeChangeObservationDuration = self->_autoZoomFilteringController.largeChangeObservationDuration;
  if (!largeChangeObservationDuration)
  {
    float result = (float)((float)(1.0 - temporalAlpha) * a3) + (float)(self->_autoZoomScalingFactor * temporalAlpha);
    self->_autoZoomFilteringController.int smallChangeObservationDuration = self->_autoZoomFilteringController.smallChangeObservationDurationMaxValue;
LABEL_15:
    self->_autoZoomFilteringController.autoZoomState = 1;
    return result;
  }
  self->_autoZoomFilteringController.int largeChangeObservationDuration = largeChangeObservationDuration - 1;
  return autoZoomScalingFactor;
}

- ($7350132BDA356DD21C3911335718E94B)_deskEdgeDetectorResult
{
  float32x2_t v4 = v2;
  v2[2] = 0;
  *(_OWORD *)v2->f32 = xmmword_1DD5AD388;
  unsigned int v5 = [(MTLTexture *)self->_lineDetectionController.inputTexture width];
  uint64_t v6 = [*(id *)&self->_anon_aa0[16] width];
  int v7 = [*(id *)&self->_anon_aa0[16] height];
  v78 = *(char **)&self->_anon_aa0[24];
  float32x2_t v8 = *(void **)&self->_anon_aa0[32];
  float32x4_t v9 = *(float **)&self->_anon_aa0[40];
  id v10 = *(id *)&self->_anon_aa0[16];
  if (v6)
  {
    if (!v5
      || v7 != 31
      || (float v11 = v78) == 0
      || (bzero(v78, (496 * v6) & 0xFFFFFFFF0), !v8)
      || (uint64_t v12 = v6, bzero(v8, 4 * v6), !v9))
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      goto LABEL_45;
    }
    float v13 = 1.0 / (float)v5;
    memset(v84, 0, 24);
    v84[3] = v6;
    long long v85 = xmmword_1DD5AD250;
    id v74 = v10;
    [v10 getBytes:v78 bytesPerRow:16 * v6 fromRegion:v84 mipmapLevel:0];
    int v14 = 0;
    uint64_t v15 = 0;
    float v77 = (float)((float)v6 * 0.5) + -0.5;
    int v75 = -1;
    int v76 = 0;
    float v16 = -1000000.0;
    while (1)
    {
      uint32x2_t v17 = &v11[16 * v14];
      BOOL v18 = &v11[16 * (v15 * v6)];
      uint64_t v19 = v12;
      float32x2_t v20 = (float *)v8;
      float v21 = 0.0;
      do
      {
        long long v22 = *(_OWORD *)v17;
        v17 += 16;
        float v21 = vmlas_n_f32(v21, v13, *(float *)&v22);
        *v20++ = v21;
        --v19;
      }
      while (v19);
      bzero(v9, 32 * v6);
      int v24 = 0;
      int v25 = 0;
      unsigned int v26 = 0;
      int v27 = -3;
      do
      {
        uint64_t v28 = 0;
        v23.i32[0] = *((_DWORD *)v8 + v26);
        float v29 = 0.0;
        do
        {
          int v30 = v27 + v28;
          if (v27 + (int)v28 >= (v6 - 1)) {
            int v30 = v6 - 1;
          }
          float v29 = v29 + (float)((float)(v13 * flt_1DD5AD36C[v28++]) * *(float *)&v18[16 * v30]);
        }
        while (v28 != 7);
        if (v29 <= 0.0078431)
        {
          if (v29 >= -0.0078431)
          {
            int v31 = 0;
            goto LABEL_23;
          }
          int v31 = -1;
        }
        else
        {
          int v31 = 1;
        }
        if (v31 != v25)
        {
          int v32 = v24 + 1;
          float32x2_t v33 = &v9[8 * v24];
          *(_DWORD *)float32x2_t v33 = v31;
          *(int32x2_t *)(v33 + 1) = vdup_n_s32(v26);
          *(int32x2_t *)(v33 + 3) = vdup_lane_s32(v23, 0);
          *((void *)v33 + 3) = 0;
          v33[5] = 0.0;
          int v24 = v32;
        }
        float32x2_t v34 = &v9[8 * v24];
        *((_DWORD *)v34 - 6) = v26;
        float v35 = fminf(*(v34 - 5), *(float *)v23.i32);
        float v36 = fmaxf(*(v34 - 4), *(float *)v23.i32);
        *(v34 - 5) = v35;
        *(v34 - 4) = v36;
        int32x2_t v37 = (float *)&v18[16 * v26];
        float v38 = *(v34 - 2);
        *(v34 - 3) = *(v34 - 3) + v37[2];
        *(v34 - 2) = v38 + v37[1];
        *(v34 - 1) = *(v34 - 1) + *v37;
LABEL_23:
        ++v26;
        ++v27;
        int v25 = v31;
      }
      while (v26 != v6);
      if (v24)
      {
        simd_float3x3 v39 = v9;
        if (v24 >= 1)
        {
          unint64_t v40 = 0;
          float v41 = 0;
          uint64_t v42 = v24;
          uint64_t v43 = 32 * v24;
          do
          {
            if ((float)(v9[v40 / 4 + 4] - v9[v40 / 4 + 3]) > 0.062745)
            {
              uint64_t v44 = &v9[v40 / 4];
              if ((float)((float)(v44[5] / v44[7]) - (float)((float)(v44[6] / v44[7]) * (float)(v44[6] / v44[7]))) >= (float)((float)((float)v6 * 0.05) * (float)((float)v6 * 0.05))) {
                float v41 = &v9[v40 / 4];
              }
            }
            v40 += 32;
          }
          while (v43 != v40);
          if (v41) {
            simd_float3x3 v39 = v41;
          }
          else {
            simd_float3x3 v39 = v9;
          }
          if (!v41)
          {
            float v45 = v9[4] - v9[3];
            v46 = v9;
            simd_float3x3 v39 = v9;
            do
            {
              float v47 = v46[3];
              if ((float)(v46[4] - v47) > v45)
              {
                simd_float3x3 v39 = v46;
                float v45 = v46[4] - v47;
              }
              v46 += 8;
              --v42;
            }
            while (v42);
          }
        }
        unsigned int v48 = *((_DWORD *)v39 + 2) - *((_DWORD *)v39 + 1) + 1;
        float v49 = v39[4] - v39[3];
        float v50 = DeskCamEdgeDetectorAngles[v15];
        unint64_t v81 = [(MTLTexture *)self->_lineDetectionController.inputTexture width];
        uint64_t v51 = [(MTLTexture *)self->_lineDetectionController.inputTexture height];
        float v52 = v49 / sqrtf((float)v48);
        if (self->_anon_aa0[48])
        {
          float v80 = v16;
          float v53 = *(float *)&self->_anon_aa0[60];
          unint64_t v54 = v51;
          __float2 v55 = __sincosf_stret(v50);
          v56.f32[0] = -v55.__sinval;
          v56.i32[1] = LODWORD(v55.__cosval);
          float32x2_t v79 = v56;
          float v57 = v55.__cosval * v53;
          float v58 = v52 * *(float *)&self->_anon_aa0[52];
          float v59 = *(float *)&self->_anon_aa0[56];
          float v60 = powf(fmaxf((float)(v39[5] / v39[7]) - (float)((float)(v39[6] / v39[7]) * (float)(v39[6] / v39[7])), 0.0), 0.25);
          v61.f32[0] = (float)v81;
          v61.f32[1] = (float)v54;
          float v62 = v58
              + (float)(COERCE_FLOAT(vmla_n_f32(vadd_f32(vmul_f32(v61, (float32x2_t)0x3F0000003F000000), (float32x2_t)0xBF000000BF000000), v79, (float)((float)((int)v39[8] + (int)v39[4]) * 0.5) - v77).i32[1])+ 0.5);
          float v16 = v80;
          float v52 = v57 + (float)((float)(v59 * v60) + v62);
        }
        float v11 = v78;
        if (v52 > v16)
        {
          int v75 = v15;
          int v76 = *((_DWORD *)v39 + 1);
          float v16 = v52;
        }
      }
      ++v15;
      v14 += v6;
      uint64_t v12 = v6;
      if (v15 == 31)
      {
        __float2 v63 = __sincosf_stret(DeskCamEdgeDetectorAngles[v75]);
        v64.f32[0] = -v63.__sinval;
        v64.i32[1] = LODWORD(v63.__cosval);
        float32x2_t v83 = v64;
        float v82 = (float)(unint64_t)[(MTLTexture *)self->_lineDetectionController.inputTexture width];
        unint64_t v65 = [(MTLTexture *)self->_lineDetectionController.inputTexture height];
        v66.f32[0] = v82;
        v66.f32[1] = (float)v65;
        float32x2_t v67 = v66;
        float32x2_t v68 = vadd_f32(vmul_f32(v66, (float32x2_t)0x3F0000003F000000), (float32x2_t)0xBF000000BF000000);
        v69.f32[0] = 0.7 * v68.f32[0];
        float32x2_t v70 = vmul_n_f32(v83, (float)v76 - v77);
        float32x2_t v71 = vadd_f32(vadd_f32(v68, vmls_lane_f32(v70, (float32x2_t)__PAIR64__(LODWORD(v63.__sinval), LODWORD(v63.__cosval)), v69, 0)), (float32x2_t)0x3F0000003F000000);
        float32x2_t v72 = vadd_f32(vadd_f32(v68, vmla_n_f32(v70, (float32x2_t)__PAIR64__(LODWORD(v63.__sinval), LODWORD(v63.__cosval)), 0.7 * v68.f32[0])), (float32x2_t)0x3F0000003F000000);
        id v10 = v74;
        v4->i32[0] = llroundf(fminf(v71.f32[1], v72.f32[1]));
        v4[1] = vdiv_f32(v71, v67);
        v4[2] = vdiv_f32(v72, v67);
        break;
      }
    }
  }
LABEL_45:

  return v73;
}

- ($FD553BEB262350C8998B8F2CDFE63E56)_undistortControls
{
  *(_OWORD *)&retstr[4].var2.var5.var0 = 0u;
  *(_OWORD *)&retstr[4].var2.var5.var4 = 0u;
  *(_OWORD *)&retstr[4].var2.var4.var0 = 0u;
  *(_OWORD *)&retstr[4].var2.var4.var4 = 0u;
  *(_OWORD *)&retstr[3].var3 = 0u;
  *(_OWORD *)&retstr[4].var0.var2 = 0u;
  *(_OWORD *)&retstr[3].var2.var5.var0 = 0u;
  *(_OWORD *)&retstr[3].var2.var5.var4 = 0u;
  *(_OWORD *)&retstr[3].var2.var4.var0 = 0u;
  *(_OWORD *)&retstr[3].var2.var4.var4 = 0u;
  *(_OWORD *)&retstr[2].var3 = 0u;
  *(_OWORD *)&retstr[3].var0.var2 = 0u;
  *(_OWORD *)&retstr[2].var2.var5.var0 = 0u;
  *(_OWORD *)&retstr[2].var2.var5.var4 = 0u;
  *(_OWORD *)&retstr[2].var2.var4.var0 = 0u;
  *(_OWORD *)&retstr[2].var2.var4.var4 = 0u;
  *(_OWORD *)&retstr[1].var3 = 0u;
  *(_OWORD *)&retstr[2].var0.var2 = 0u;
  *(_OWORD *)&retstr[1].var2.var5.var0 = 0u;
  *(_OWORD *)&retstr[1].var2.var5.var4 = 0u;
  *(_OWORD *)&retstr[1].var2.var4.var0 = 0u;
  *(_OWORD *)&retstr[1].var2.var4.var4 = 0u;
  *(_OWORD *)&retstr->var3 = 0u;
  *(_OWORD *)&retstr[1].var0.var2 = 0u;
  *(_OWORD *)&retstr->var2.var5.var0 = 0u;
  *(_OWORD *)&retstr->var2.var5.var4 = 0u;
  *(_OWORD *)&retstr->var2.var4.var0 = 0u;
  *(_OWORD *)&retstr->var2.var4.var4 = 0u;
  *(_OWORD *)&retstr->var0.var2 = 0u;
  [(DeskCamRenderingSession *)self _updatePitchAndRoll];
  [(DeskCamRenderingSession *)self _viewportScaleMultiplier];
  -[DeskCamRenderingSession _defaultFramingSpaceViewport:](self, "_defaultFramingSpaceViewport:");
  -[DeskCamRenderingSession _scaleViewportToFitInFramingSpace:](self, "_scaleViewportToFitInFramingSpace:");
  self->_outputCropRectangle.size.double width = v5;
  self->_outputCropRectangle.size.double height = v6;
  long long v7 = *(_OWORD *)&self->_anon_d0[23];
  long long v8 = *(_OWORD *)&self->_anon_d0[39];
  float v9 = COERCE_FLOAT(*(void *)&self->_anon_d0[31]);
  CGFloat v10 = v9 - v5 * 0.5;
  float v11 = COERCE_FLOAT(*(void *)&self->_anon_d0[47]);
  double v12 = v11 - v6 * 0.5;
  self->_outputCropRectangle.origin.double x = v10;
  self->_outputCropRectangle.origin.double y = v12;
  *(float *)&CGFloat v5 = v10 + (v5 + -1.0) * 0.5;
  *(float *)&CGFloat v10 = v12 + (v6 + -1.0) * 0.5;
  float v13 = (float)(*(float *)&v5 - v9) / *(float *)&v7;
  float v14 = (float)(*(float *)&v10 - v11) / *((float *)&v8 + 1);
  double v15 = v6 + v12 + -1.0;
  if (!self->_isFrontFacingCamera) {
    double v15 = v12;
  }
  float v16 = v15;
  float v17 = (float)(v16 - v11) / *((float *)&v8 + 1);
  LODWORD(v18) = 0;
  *((float *)&v18 + 1) = v17;
  LODWORD(v19) = 0;
  *((float *)&v19 + 1) = 0.0 - v17;
  __asm { FMOV            V1.4S, #1.0 }
  _Q1.i64[0] = __PAIR64__(LODWORD(v14), LODWORD(v13));
  *(_OWORD *)&self->_inputPlaneShift[7] = v18;
  *(_OWORD *)&self->_outputPlaneShift[7] = v19;
  *(float32x4_t *)&self->_camera2PlaneShift[7] = vsubq_f32((float32x4_t)0, _Q1);
  *(float32x4_t *)&self->_plane2CameraShift[7] = _Q1;
  [(DeskCamRenderingSession *)self _pitchMatrix];
  *(_DWORD *)&self->_anon_170[15] = v25;
  *(_DWORD *)&self->_anon_170[31] = v26;
  *(void *)&self->_anon_170[7] = v27;
  *(void *)&self->_anon_170[23] = v28;
  *(_DWORD *)&self->_anon_170[47] = v29;
  *(void *)&self->_anon_170[39] = v30;
  [(DeskCamRenderingSession *)self _rollMatrix];
  *(_DWORD *)&self->_anon_1a0[15] = v31;
  *(_DWORD *)&self->_anon_1a0[31] = v32;
  *(void *)&self->_anon_1a0[7] = v33;
  *(void *)&self->_anon_1a0[23] = v34;
  *(_DWORD *)&self->_anon_1a0[47] = v35;
  *(void *)&self->_anon_1a0[39] = v36;
  float result = ($FD553BEB262350C8998B8F2CDFE63E56 *)[(DeskCamRenderingSession *)self _translationVector];
  *(_OWORD *)&self->_translationVector[7] = v38;
  if (self->_outputType == 2)
  {
    CGPoint origin = self->_outputCropRectangle.origin;
    CGSize size = self->_outputCropRectangle.size;
    long long v42 = *(_OWORD *)&self->_camera2PlaneShift[7];
    long long v41 = *(_OWORD *)&self->_plane2CameraShift[7];
    long long v43 = *(_OWORD *)&self->_inputPlaneShift[7];
    long long v44 = *(_OWORD *)&self->_outputPlaneShift[7];
    long long v52 = *(_OWORD *)&self->_anon_170[7];
    long long v53 = *(_OWORD *)&self->_anon_170[23];
    long long v54 = *(_OWORD *)&self->_anon_170[39];
    long long v55 = *(_OWORD *)&self->_anon_1a0[7];
    long long v56 = *(_OWORD *)&self->_anon_1a0[23];
    int v45 = 2 * !self->_isFrontFacingCamera;
    BOOL isFrontFacingCamera = self->_isFrontFacingCamera;
    long long v57 = *(_OWORD *)&self->_anon_1a0[39];
  }
  else
  {
    int v45 = 0;
    BOOL isFrontFacingCamera = 0;
    CGPoint origin = self->_framingSpaceRectangle.origin;
    CGSize size = self->_framingSpaceRectangle.size;
    long long v52 = *MEMORY[0x1E4F14998];
    long long v53 = *(_OWORD *)(MEMORY[0x1E4F14998] + 16);
    long long v54 = *(_OWORD *)(MEMORY[0x1E4F14998] + 32);
    long long v55 = *MEMORY[0x1E4F14998];
    long long v56 = v53;
    long long v57 = v54;
    long long v41 = 0uLL;
    long long v43 = 0uLL;
    long long v44 = 0uLL;
    long long v38 = 0uLL;
    long long v42 = 0uLL;
  }
  long long v47 = *(_OWORD *)&self->_anon_d0[119];
  *(_OWORD *)&retstr[4].var0.var2 = *(_OWORD *)&self->_anon_d0[103];
  *(_OWORD *)&retstr[4].var2.var4.var0 = v47;
  long long v48 = *(_OWORD *)&self->_anon_d0[151];
  *(_OWORD *)&retstr[4].var2.var4.var4 = *(_OWORD *)&self->_anon_d0[135];
  *(_OWORD *)&retstr[4].var2.var5.var0 = v48;
  long long v49 = *(_OWORD *)&self->_anon_d0[55];
  *(_OWORD *)&retstr[3].var2.var4.var4 = *(_OWORD *)&self->_anon_d0[39];
  *(_OWORD *)&retstr[3].var2.var5.var0 = v49;
  long long v50 = *(_OWORD *)&self->_anon_d0[87];
  *(_OWORD *)&retstr[3].var2.var5.var4 = *(_OWORD *)&self->_anon_d0[71];
  *(_OWORD *)&retstr[3].var3 = v50;
  long long v51 = *(_OWORD *)&self->_anon_d0[23];
  *(_OWORD *)&retstr[3].var0.var2 = *(_OWORD *)&self->_anon_d0[7];
  *(_OWORD *)&retstr[3].var2.var4.var0 = v51;
  *(float32x2_t *)&retstr->var0.var2 = vcvt_f32_f64((float64x2_t)origin);
  *(float32x2_t *)&retstr->var2.var2 = vcvt_f32_f64((float64x2_t)size);
  *(_OWORD *)&retstr->var2.var4.var0 = v42;
  *(_OWORD *)&retstr->var2.var4.var4 = v41;
  *(_OWORD *)&retstr->var2.var5.var0 = v43;
  *(_OWORD *)&retstr->var2.var5.var4 = v44;
  *(_OWORD *)&retstr->var3 = v55;
  *(_OWORD *)&retstr[1].var0.var2 = v56;
  *(_OWORD *)&retstr[1].var2.var4.var0 = v57;
  *(_OWORD *)&retstr[1].var2.var4.var4 = v52;
  *(_OWORD *)&retstr[1].var2.var5.var0 = v53;
  *(_OWORD *)&retstr[1].var2.var5.var4 = v54;
  *(_OWORD *)&retstr[1].var3 = v38;
  retstr[2].var0.var2 = v45;
  retstr[2].var2.var3 = 0;
  *(void *)&retstr[2].var2.var1 = 0;
  LOBYTE(retstr[4].var2.var5.var7) = isFrontFacingCamera;
  return result;
}

- (float)_viewportScaleMultiplier
{
  float roll = self->_roll;
  float v4 = vabds_f32(90.0, roll);
  float v5 = vabds_f32(270.0, roll);
  if (v4 >= v5) {
    float v6 = v5;
  }
  else {
    float v6 = v4;
  }
  float v7 = vabds_f32(180.0, roll);
  float v8 = vabds_f32(360.0, roll);
  if (v7 >= v8) {
    float v7 = v8;
  }
  if (roll >= v7) {
    float v9 = v7;
  }
  else {
    float v9 = self->_roll;
  }
  [(DeskCamSessionOptions *)self->_options viewportScaleMultiplierMin];
  float v11 = v10;
  options = self->_options;
  if (v6 >= v9)
  {
    [(DeskCamSessionOptions *)options viewportScaleMultiplierLandscape];
    float v6 = v9;
  }
  else
  {
    [(DeskCamSessionOptions *)options viewportScaleMultiplierPortrait];
  }
  return v11 + (float)((float)((float)(v6 / -45.0) + 1.0) * (float)(v13 - v11));
}

- (CGRect)_scaleViewportToFitInFramingSpace:(CGRect)a3
{
  v48[4] = *(int8x8_t *)MEMORY[0x1E4F143B8];
  if (!self->_isFrontFacingCamera)
  {
    [(DeskCamRenderingSession *)self _rollMatrix];
    unsigned int v4 = 0;
    double v46 = v6;
    double v47 = v5;
    double v45 = v7;
    double v8 = -1.0;
    float v9 = 1.0;
    float v10 = 0.5;
    do
    {
      *(CGRect *)&double v11 = CGRectInset(a3, a3.size.width * (float)(1.0 - (float)((float)(v10 + v9) * 0.5)) * 0.5, a3.size.height * (float)(1.0 - (float)((float)(v10 + v9) * 0.5)) * 0.5);
      double v12 = v11;
      *(float *)&double v11 = v11;
      *(float *)&double v12 = v12 + v49.size.width + v8;
      if (self->_isFrontFacingCamera)
      {
        float y = v49.origin.y;
        *((float *)&v12 + 1) = y;
        *((float *)&v11 + 1) = y;
        float v14 = -100000.0;
      }
      else
      {
        float y = v49.origin.y + v49.size.height + v8;
        *((float *)&v12 + 1) = y;
        *((float *)&v11 + 1) = y;
        float v14 = 100000.0;
      }
      *(float *)&unsigned int v15 = y + v14;
      double v43 = v12;
      HIDWORD(v12) = v15;
      double v41 = COERCE_DOUBLE(__PAIR64__(v15, LODWORD(v11)));
      double v42 = v12;
      -[DeskCamRenderingSession _projectPoint:intrinsicMatrix:rotationMatrix:](self, "_projectPoint:intrinsicMatrix:rotationMatrix:", v11, *(double *)&self->_anon_d0[23], *(double *)&self->_anon_d0[39], *(double *)&self->_anon_d0[55], v47, v46, v45);
      float32x2_t v40 = v16;
      -[DeskCamRenderingSession _projectPoint:intrinsicMatrix:rotationMatrix:](self, "_projectPoint:intrinsicMatrix:rotationMatrix:", v43, *(double *)&self->_anon_d0[23], *(double *)&self->_anon_d0[39], *(double *)&self->_anon_d0[55], v47, v46, v45);
      float32x2_t v44 = v17;
      -[DeskCamRenderingSession _projectPoint:intrinsicMatrix:rotationMatrix:](self, "_projectPoint:intrinsicMatrix:rotationMatrix:", v41, *(double *)&self->_anon_d0[23], *(double *)&self->_anon_d0[39], *(double *)&self->_anon_d0[55], v47, v46, v45);
      float32x2_t v19 = v18;
      -[DeskCamRenderingSession _projectPoint:intrinsicMatrix:rotationMatrix:](self, "_projectPoint:intrinsicMatrix:rotationMatrix:", v42, *(double *)&self->_anon_d0[23], *(double *)&self->_anon_d0[39], *(double *)&self->_anon_d0[55], v47, v46, v45);
      float32x2_t v21 = v20;
      double x = self->_framingSpaceRectangle.origin.x;
      double v23 = self->_framingSpaceRectangle.origin.y;
      double width = self->_framingSpaceRectangle.size.width;
      double height = self->_framingSpaceRectangle.size.height;
      _getLineToRectIntersectionPoints(v48, v19, v40, x, v23, width, height);
      for (uint64_t i = 0; i != 4; ++i)
      {
        float32x2_t v27 = (float32x2_t)v48[i];
        float32x2_t v28 = (float32x2_t)vdup_n_s32(0x7F7FFFFFu);
        uint32x2_t v29 = (uint32x2_t)vmvn_s8((int8x8_t)vceq_f32(v27, v28));
        if ((vpmin_u32(v29, v29).u32[0] & 0x80000000) != 0) {
          break;
        }
        float32x2_t v27 = v28;
      }
      _getLineToRectIntersectionPoints(v48, v21, v44, x, v23, width, height);
      for (uint64_t j = 0; j != 4; ++j)
      {
        float32x2_t v31 = (float32x2_t)v48[j];
        float32x2_t v32 = (float32x2_t)vdup_n_s32(0x7F7FFFFFu);
        uint32x2_t v33 = (uint32x2_t)vmvn_s8((int8x8_t)vceq_f32(v31, v32));
        if ((vpmin_u32(v33, v33).u32[0] & 0x80000000) != 0) {
          break;
        }
        float32x2_t v31 = v32;
      }
      *(int32x2_t *)v34.f32 = vrev64_s32((int32x2_t)v27);
      *(float32x2_t *)&v34.u32[2] = v31;
      if ((vaddvq_s32((int32x4_t)vandq_s8((int8x16_t)vceqq_f32(v34, (float32x4_t)vdupq_n_s32(0x7F7FFFFFu)), (int8x16_t)xmmword_1DD5AD280)) & 0xF) != 0)float v9 = (float)(v10 + v9) * 0.5; {
      else
      }
        float v10 = (float)(v10 + v9) * 0.5;
      double v8 = -1.0;
      if (v4 > 0xD) {
        break;
      }
      ++v4;
    }
    while ((float)(v9 - v10) > 0.001);
    a3 = CGRectInset(a3, a3.size.width * (float)(1.0 - v10) * 0.5, a3.size.height * (float)(1.0 - v10) * 0.5);
  }
  double v35 = a3.origin.x;
  double v36 = a3.origin.y;
  double v37 = a3.size.width;
  double v38 = a3.size.height;
  result.size.double height = v38;
  result.size.double width = v37;
  result.origin.float y = v36;
  result.origin.double x = v35;
  return result;
}

- (double)_translationVector
{
  v43[4] = *(int8x8_t *)MEMORY[0x1E4F143B8];
  double v4 = *(double *)(a1 + 48);
  double v3 = *(double *)(a1 + 56);
  a2.n128_f32[0] = v4;
  *(float *)&double v5 = v4 + *(double *)(a1 + 64) + -1.0;
  if (*(unsigned char *)(a1 + 16))
  {
    float v6 = v3;
    *((float *)&v5 + 1) = v6;
    a2.n128_f32[1] = v6;
    float v7 = -100000.0;
  }
  else
  {
    float v6 = v3 + *(double *)(a1 + 72) + -1.0;
    *((float *)&v5 + 1) = v6;
    a2.n128_f32[1] = v6;
    float v7 = 100000.0;
  }
  *(float *)&unsigned int v8 = v6 + v7;
  double v42 = v5;
  HIDWORD(v5) = v8;
  double v41 = v5;
  objc_msgSend((id)a1, "_projectPoint:intrinsicMatrix:rotationMatrix:", a2.n128_f64[0], *(double *)(a1 + 224), *(double *)(a1 + 240), *(double *)(a1 + 256), *(double *)(a1 + 416), *(double *)(a1 + 432), *(double *)(a1 + 448), __PAIR64__(v8, a2.n128_u32[0]), a2.n128_u64[1]);
  float32x2_t v10 = v9;
  objc_msgSend((id)a1, "_projectPoint:intrinsicMatrix:rotationMatrix:", v42, *(double *)(a1 + 224), *(double *)(a1 + 240), *(double *)(a1 + 256), *(double *)(a1 + 416), *(double *)(a1 + 432), *(double *)(a1 + 448));
  float32x2_t v12 = v11;
  objc_msgSend((id)a1, "_projectPoint:intrinsicMatrix:rotationMatrix:", v40, *(double *)(a1 + 224), *(double *)(a1 + 240), *(double *)(a1 + 256), *(double *)(a1 + 416), *(double *)(a1 + 432), *(double *)(a1 + 448));
  float32x2_t v14 = v13;
  objc_msgSend((id)a1, "_projectPoint:intrinsicMatrix:rotationMatrix:", v41, *(double *)(a1 + 224), *(double *)(a1 + 240), *(double *)(a1 + 256), *(double *)(a1 + 416), *(double *)(a1 + 432), *(double *)(a1 + 448));
  float32x2_t v16 = v15;
  double v17 = *(double *)(a1 + 80);
  double v18 = *(double *)(a1 + 88);
  double v19 = *(double *)(a1 + 96);
  double v20 = *(double *)(a1 + 104);
  _getLineToRectIntersectionPoints(v43, v14, v10, v17, v18, v19, v20);
  uint64_t v21 = 0;
  float32x2_t v22 = (float32x2_t)vdup_n_s32(0x7F7FFFFFu);
  while (1)
  {
    float32x2_t v23 = (float32x2_t)v43[v21];
    uint32x2_t v24 = (uint32x2_t)vmvn_s8((int8x8_t)vceq_f32(v23, v22));
    if ((vpmin_u32(v24, v24).u32[0] & 0x80000000) != 0) {
      break;
    }
    if (++v21 == 4)
    {
      float32x2_t v23 = v22;
      break;
    }
  }
  _getLineToRectIntersectionPoints(v43, v16, v12, v17, v18, v19, v20);
  uint64_t v26 = 0;
  float32x2_t v27 = (float32x2_t)vdup_n_s32(0x7F7FFFFFu);
  while (1)
  {
    *(int8x8_t *)v25.f32 = v43[v26];
    uint32x2_t v28 = (uint32x2_t)vmvn_s8((int8x8_t)vceq_f32(*(float32x2_t *)v25.f32, v27));
    if ((vpmin_u32(v28, v28).u32[0] & 0x80000000) != 0) {
      break;
    }
    if (++v26 == 4)
    {
      *(float32x2_t *)v25.f32 = v27;
      break;
    }
  }
  float32x4_t v29 = *(float32x4_t *)(a1 + 224);
  float32x2_t v30 = vsub_f32(v23, v10);
  int32x2_t v31 = (int32x2_t)vmul_f32(v30, v30);
  float32x2_t v32 = vsub_f32(*(float32x2_t *)v25.f32, v12);
  int32x2_t v33 = (int32x2_t)vmul_f32(v32, v32);
  float32x2_t v34 = vsqrt_f32(vadd_f32((float32x2_t)vzip1_s32(v31, v33), (float32x2_t)vzip2_s32(v31, v33)));
  BOOL v35 = (vcgt_f32((float32x2_t)vdup_lane_s32((int32x2_t)v34, 1), v34).u8[0] & 1) == 0;
  v36.i32[0] = vextq_s8((int8x16_t)v29, (int8x16_t)v29, 8uLL).u32[0];
  v36.i32[1] = *(_DWORD *)(a1 + 248);
  if (v35) {
    unsigned int v37 = 0;
  }
  else {
    unsigned int v37 = -1;
  }
  v29.i32[1] = *(_DWORD *)(a1 + 244);
  int8x8_t v38 = (int8x8_t)vdup_n_s32(v37);
  *(float32x2_t *)v25.f32 = vdiv_f32(vsub_f32((float32x2_t)vbsl_s8(v38, (int8x8_t)v23, *(int8x8_t *)v25.f32), v36), *(float32x2_t *)v29.f32);
  v25.i32[2] = 1.0;
  *(float32x2_t *)v29.f32 = vdiv_f32(vsub_f32((float32x2_t)vbsl_s8(v38, (int8x8_t)v10, (int8x8_t)v12), v36), *(float32x2_t *)v29.f32);
  v29.i32[2] = 1.0;
  v25.i64[0] = vsubq_f32(v25, v29).u64[0];
  return *(double *)v25.i64;
}

- (double)_projectPoint:(__n128)a3 intrinsicMatrix:(double)a4 rotationMatrix:(float32x4_t)a5
{
  _S7 = a3.n128_u32[1];
  _Q0 = vaddq_f32(a7, vmlaq_n_f32(vmulq_n_f32(a5, (float)(*(float *)&a1 - a2.n128_f32[2]) / a2.n128_f32[0]), a6, (float)(*((float *)&a1 + 1) - a3.n128_f32[2]) / a3.n128_f32[1]));
  _Q0.i64[0] = vdivq_f32(_Q0, (float32x4_t)vdupq_laneq_s32((int32x4_t)_Q0, 2)).u64[0];
  *(float *)&double v9 = vmlas_n_f32(a2.n128_f32[2], a2.n128_f32[0], _Q0.f32[0]);
  __asm { FMLA            S2, S7, V0.S[1] }
  HIDWORD(v9) = _S2;
  return v9;
}

- (void)_updatePitchAndRoll
{
  [(DeskCamRenderingSession *)self _updatePitch];

  [(DeskCamRenderingSession *)self _updateRoll];
}

- (void)_updatePitch
{
  uint32x4_t v3 = (uint32x4_t)vmvnq_s8(vorrq_s8((int8x16_t)vcltzq_f32(*(float32x4_t *)self->_gravity), (int8x16_t)vcgezq_f32(*(float32x4_t *)self->_gravity)));
  v3.i32[3] = v3.i32[2];
  if ((vmaxvq_u32(v3) & 0x80000000) != 0)
  {
    [(DeskCamSessionOptions *)self->_options pitchDefaultAngleValue];
    self->_pitch = v20;
  }
  else
  {
    float32x4_t v21 = *(float32x4_t *)self->_gravity;
    *(__n64 *)v4.f32 = simd_matrix3x3((float32x4_t)_PromotedConst_0);
    _Q2.f32[0] = COERCE_FLOAT(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v4, *(float *)&v21), _Q1, *(float32x2_t *)&v21, 1), _Q2, v21, 2).i32[2]);
    __asm { FMLA            S1, S2, V0.S[2] }
    BOOL v11 = !self->_isFrontFacingCamera;
    float v12 = (dbl_1DD5AD290[v11] + asinf(_Q2.f32[0] / fabsf(sqrtf(_Q1.f32[0])))) * 180.0 / dbl_1DD5AD2A0[v11];
    [(DeskCamSessionOptions *)self->_options pitchRefinementValue];
    float v14 = v13 + v12;
    [(DeskCamSessionOptions *)self->_options pitchValueLowerThreshold];
    if (v14 >= v15
      && ([(DeskCamSessionOptions *)self->_options pitchValueUpperThreshold], v14 <= v16))
    {
      self->_pitch = v14;
    }
    else
    {
      [(DeskCamSessionOptions *)self->_options pitchValueUpperThreshold];
      float v18 = fminf(v14, v17);
      [(DeskCamSessionOptions *)self->_options pitchValueLowerThreshold];
      self->_pitch = fmaxf(v18, v19);
      if (self->_deviceType == 1)
      {
        self->_gimbalLock = 1;
        return;
      }
    }
  }
  self->_gimbalLock = 0;
}

- (__n64)_pitchMatrix
{
  float v2 = -1.0;
  if (!*(unsigned char *)(a1 + 16)) {
    float v2 = 1.0;
  }
  float32x4_t v6 = (float32x4_t)LODWORD(v2);
  float v1 = *(float *)(a1 + 192) * 3.14159265 / 180.0;
  __float2 v3 = __sincosf_stret(v1 * 0.5);
  float32x4_t v4 = vmulq_n_f32(v6, v3.__sinval);
  v4.i32[3] = LODWORD(v3.__cosval);

  return simd_matrix3x3(v4);
}

- (void)_updateRoll
{
  if (self->_isFrontFacingCamera
    || (uint32x4_t v5 = (uint32x4_t)vmvnq_s8(vorrq_s8((int8x16_t)vcltzq_f32(*(float32x4_t *)self->_gravity), (int8x16_t)vcgezq_f32(*(float32x4_t *)self->_gravity))), v5.i32[3] = v5.i32[2], (vmaxvq_u32(v5) & 0x80000000) != 0))
  {
    float v3 = 270.0;
    switch(self->_cameraOrientation)
    {
      case 0:
        if (self->_isFrontFacingCamera) {
          goto LABEL_4;
        }
        goto LABEL_7;
      case 1:
        goto LABEL_10;
      case 2:
        int v4 = 1119092736;
        goto LABEL_9;
      case 3:
LABEL_7:
        float v3 = 0.0;
        goto LABEL_10;
      case 4:
LABEL_4:
        int v4 = 1127481344;
LABEL_9:
        float v3 = *(float *)&v4;
        goto LABEL_10;
      default:
        return;
    }
  }
  float32x4_t v9 = *(float32x4_t *)self->_gravity;
  *(__n64 *)v6.f32 = simd_matrix3x3((float32x4_t)_PromotedConst_0);
  v6.i64[0] = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v6, v9.f32[0]), v7, *(float32x2_t *)v9.f32, 1), v8, v9, 2).u64[0];
  float v3 = (atan2f(v6.f32[0], v6.f32[1]) + 3.14159265) * 180.0 / 3.14159265;
LABEL_10:
  self->_float roll = v3;
}

- (__n64)_rollMatrix
{
  float v2 = -1.0;
  if (!*(unsigned char *)(a1 + 16)) {
    float v2 = 1.0;
  }
  v3.i64[0] = 0;
  v3.i64[1] = LODWORD(v2);
  float32x4_t v7 = v3;
  float v1 = *(float *)(a1 + 196) * 3.14159265 / 180.0;
  __float2 v4 = __sincosf_stret(v1 * 0.5);
  float32x4_t v5 = vmulq_n_f32(v7, v4.__sinval);
  v5.i32[3] = LODWORD(v4.__cosval);

  return simd_matrix3x3(v5);
}

- (BOOL)transformIsValid
{
  return !self->_gimbalLock;
}

- (double)_transformMatrixWithOutputCropRectangle:(double)a3
{
  float v6 = a4;
  float v7 = v6;
  float v8 = a5;
  LODWORD(v9) = 0;
  *((float *)&v9 + 1) = v8;
  long long v55 = v9;
  long long v56 = LODWORD(v7);
  *(float *)&unsigned int v10 = a2;
  *(float *)&unsigned int v11 = a3;
  __asm { FMOV            V2.4S, #1.0 }
  uint64_t v60 = _Q2.i64[1];
  _Q2.i64[0] = __PAIR64__(v11, v10);
  float32x4_t v54 = _Q2;
  int32x4_t v17 = *(int32x4_t *)(a1 + 224);
  int32x4_t v18 = *(int32x4_t *)(a1 + 240);
  int32x4_t v19 = *(int32x4_t *)(a1 + 256);
  int32x4_t v20 = vzip1q_s32(v17, v19);
  int32x4_t v21 = vzip2q_s32(v17, v19);
  int32x4_t v22 = vzip1q_s32(v17, v18);
  v22.i32[2] = v19.i32[0];
  float32x4_t v59 = (float32x4_t)v22;
  v67.columns[0] = (simd_float3)vzip1q_s32(v20, v18);
  int32x4_t v23 = vzip2q_s32(v17, v18);
  v23.i32[2] = *(void *)(a1 + 264);
  float32x4_t v57 = (float32x4_t)v23;
  float32x4_t v58 = (float32x4_t)vzip2q_s32(v20, vdupq_lane_s32(*(int32x2_t *)v18.i8, 1));
  v67.columns[0].i32[3] = 0;
  v67.columns[2] = (simd_float3)vzip1q_s32(v21, vdupq_laneq_s32(v18, 2));
  v67.columns[1] = (simd_float3)v58;
  v67.columns[1].i32[3] = 0;
  v67.columns[2].i32[3] = 0;
  simd_float3x3 v25 = __invert_f3(v67);
  uint64_t v24 = 0;
  v25.columns[2] = (simd_float3)vaddq_f32((float32x4_t)v25.columns[2], vaddq_f32(*(float32x4_t *)(a1 + 512), *(float32x4_t *)(a1 + 480)));
  long long v61 = v56;
  long long v62 = v55;
  float32x4_t v63 = v54;
  long long v64 = 0u;
  long long v65 = 0u;
  float32x4_t v66 = 0u;
  do
  {
    *(long long *)((char *)&v64 + v24) = (__int128)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v25.columns[0], COERCE_FLOAT(*(long long *)((char *)&v61 + v24))), (float32x4_t)v25.columns[1], *(float32x2_t *)((char *)&v61 + v24), 1), (float32x4_t)v25.columns[2], *(float32x4_t *)((char *)&v61 + v24), 2);
    v24 += 16;
  }
  while (v24 != 48);
  uint64_t v26 = 0;
  float32x4_t v27 = *(float32x4_t *)(a1 + 368);
  float32x4_t v28 = *(float32x4_t *)(a1 + 384);
  float32x4_t v29 = *(float32x4_t *)(a1 + 400);
  long long v61 = v64;
  long long v62 = v65;
  float32x4_t v63 = v66;
  long long v64 = 0u;
  long long v65 = 0u;
  float32x4_t v66 = 0u;
  do
  {
    *(long long *)((char *)&v64 + v26) = (__int128)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v27, COERCE_FLOAT(*(long long *)((char *)&v61 + v26))), v28, *(float32x2_t *)((char *)&v61 + v26), 1), v29, *(float32x4_t *)((char *)&v61 + v26), 2);
    v26 += 16;
  }
  while (v26 != 48);
  uint64_t v30 = 0;
  long long v31 = v64;
  long long v32 = v65;
  HIDWORD(v31) = 0;
  HIDWORD(v32) = 0;
  float32x4_t v33 = vaddq_f32(v66, *(float32x4_t *)(a1 + 496));
  float32x4_t v34 = *(float32x4_t *)(a1 + 416);
  float32x4_t v35 = *(float32x4_t *)(a1 + 432);
  float32x4_t v36 = *(float32x4_t *)(a1 + 448);
  long long v61 = v31;
  long long v62 = v32;
  float32x4_t v63 = v33;
  long long v64 = 0u;
  long long v65 = 0u;
  float32x4_t v66 = 0u;
  do
  {
    *(long long *)((char *)&v64 + v30) = (__int128)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v34, COERCE_FLOAT(*(long long *)((char *)&v61 + v30))), v35, *(float32x2_t *)((char *)&v61 + v30), 1), v36, *(float32x4_t *)((char *)&v61 + v30), 2);
    v30 += 16;
  }
  while (v30 != 48);
  uint64_t v37 = 0;
  long long v38 = v64;
  long long v39 = v65;
  HIDWORD(v38) = 0;
  HIDWORD(v39) = 0;
  float32x4_t v40 = vaddq_f32(v66, vaddq_f32(*(float32x4_t *)(a1 + 528), *(float32x4_t *)(a1 + 464)));
  long long v61 = v38;
  long long v62 = v39;
  float32x4_t v63 = v40;
  long long v64 = 0u;
  long long v65 = 0u;
  float32x4_t v66 = 0u;
  do
  {
    *(long long *)((char *)&v64 + v37) = (__int128)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v59, COERCE_FLOAT(*(long long *)((char *)&v61 + v37))), v58, *(float32x2_t *)((char *)&v61 + v37), 1), v57, *(float32x4_t *)((char *)&v61 + v37), 2);
    v37 += 16;
  }
  while (v37 != 48);
  uint64_t v41 = 0;
  long long v42 = v64;
  long long v43 = v65;
  float32x4_t v44 = v66;
  HIDWORD(v42) = 0;
  HIDWORD(v43) = 0;
  v44.i32[3] = 0;
  v45.i64[0] = *(void *)(a1 + 208);
  float32x2_t v46 = vcvt_f32_f64(vdivq_f64(vcvtq_f64_f32(*(float32x2_t *)v45.f32), *(float64x2_t *)(a1 + 96)));
  float32x4_t v47 = (float32x4_t)v46.u32[0];
  v48.i32[0] = 0;
  v48.i64[1] = 0;
  v48.i32[1] = v46.i32[1];
  v49.i64[1] = v60;
  *(float32x2_t *)v49.f32 = vcvt_f32_f64(vmlsq_f64((float64x2_t)0, vcvtq_f64_f32(v46), *(float64x2_t *)(a1 + 80)));
  long long v61 = v42;
  long long v62 = v43;
  float32x4_t v63 = v44;
  long long v64 = 0u;
  long long v65 = 0u;
  float32x4_t v66 = 0u;
  do
  {
    *(long long *)((char *)&v64 + v41) = (__int128)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v47, COERCE_FLOAT(*(long long *)((char *)&v61 + v41))), v48, *(float32x2_t *)((char *)&v61 + v41), 1), v49, *(float32x4_t *)((char *)&v61 + v41), 2);
    v41 += 16;
  }
  while (v41 != 48);
  uint64_t v50 = 0;
  v51.i32[1] = 0;
  v51.i64[1] = 0;
  v51.f32[0] = 1.0 / v45.f32[0];
  v45.i32[0] = 0;
  v45.i64[1] = 0;
  v45.f32[1] = 1.0 / v45.f32[1];
  long long v61 = v64;
  long long v62 = v65;
  float32x4_t v63 = v66;
  long long v64 = 0u;
  long long v65 = 0u;
  float32x4_t v66 = 0u;
  do
  {
    *(long long *)((char *)&v64 + v50) = (__int128)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v51, COERCE_FLOAT(*(long long *)((char *)&v61 + v50))), v45, *(float32x2_t *)((char *)&v61 + v50), 1), (float32x4_t)xmmword_1DD5ACF90, *(float32x4_t *)((char *)&v61 + v50), 2);
    v50 += 16;
  }
  while (v50 != 48);
  return *(double *)&v64;
}

- (uint64_t)transformMatrix
{
  return objc_msgSend(a1, "_transformMatrixWithOutputCropRectangle:", *((double *)a1 + 6), *((double *)a1 + 7), *((double *)a1 + 8), *((double *)a1 + 9));
}

- (unsigned)exifOrientation
{
  if (self->_outputType == 2) {
    return 1;
  }
  int v4 = self->_cameraOrientation - 1;
  unsigned int result = 6;
  switch(v4)
  {
    case 0:
      return result;
    case 1:
      unsigned int result = 8;
      break;
    case 3:
      if (self->_isFrontFacingCamera) {
        unsigned int result = 1;
      }
      else {
        unsigned int result = 3;
      }
      break;
    default:
      if (self->_isFrontFacingCamera) {
        unsigned int result = 3;
      }
      else {
        unsigned int result = 1;
      }
      break;
  }
  return result;
}

- (float32x2_t)trapezoid
{
  [(float32x2_t *)a1 transformMatrix];
  if (a1[2].i8[0])
  {
    float32x4_t v5 = (float32x4_t)xmmword_1DD5AD2B0;
    float32x4_t v6 = (float32x4_t)xmmword_1DD5ACF90;
    __asm { FMOV            V5.4S, #1.0 }
    _Q3 = (float32x4_t)xmmword_1DD5AD2C0;
  }
  else
  {
    float32x4_t v5 = (float32x4_t)xmmword_1DD5ACF90;
    _Q5 = (float32x4_t)xmmword_1DD5AD2C0;
    __asm { FMOV            V3.4S, #1.0 }
    float32x4_t v6 = (float32x4_t)xmmword_1DD5AD2B0;
  }
  int32x4_t v13 = (int32x4_t)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v2, v5.f32[0]), v3, *(float32x2_t *)v5.f32, 1), v4, v5, 2);
  int32x4_t v14 = (int32x4_t)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v2, _Q5.f32[0]), v3, *(float32x2_t *)_Q5.f32, 1), v4, _Q5, 2);
  int32x4_t v15 = (int32x4_t)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v2, v6.f32[0]), v3, *(float32x2_t *)v6.f32, 1), v4, v6, 2);
  int32x4_t v16 = (int32x4_t)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v2, _Q3.f32[0]), v3, *(float32x2_t *)_Q3.f32, 1), v4, _Q3, 2);
  float32x2_t v18 = a1[26];
  int32x4_t v17 = a1 + 26;
  float32x2_t v19 = vcvt_f32_f64(vdivq_f64(vcvtq_f64_f32(v18), *(float64x2_t *)v17[-14].f32));
  float32x2_t v20 = vcvt_f32_f64(vmlsq_f64((float64x2_t)0, vcvtq_f64_f32(v19), *(float64x2_t *)v17[-16].f32));
  float32x2_t v21 = vdiv_f32(vsub_f32(vmul_f32(v18, vdiv_f32(*(float32x2_t *)v14.i8, (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v14, 2))), v20), v19);
  float32x2_t v22 = vdiv_f32(vsub_f32(vmul_f32(v18, vdiv_f32(*(float32x2_t *)v15.i8, (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v15, 2))), v20), v19);
  float32x2_t v23 = vdiv_f32(vsub_f32(vmul_f32(v18, vdiv_f32(*(float32x2_t *)v16.i8, (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v16, 2))), v20), v19);
  float32x2_t v24 = distortPoint(v17, vdiv_f32(vsub_f32(vmul_f32(v18, vdiv_f32(*(float32x2_t *)v13.i8, (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v13, 2))), v20), v19));
  distortPoint(v17, v21);
  distortPoint(v17, v22);
  distortPoint(v17, v23);
  return vdiv_f32(v24, *v17);
}

- (float32x2_t)focusPoint
{
  float v1 = a1;
  [(float32x2_t *)a1 transformMatrix];
  v2.i64[0] = 0x3F0000003F000000;
  v2.i64[1] = 0x3F0000003F000000;
  int32x4_t v6 = (int32x4_t)vaddq_f32(v5, vmlaq_f32(vmulq_f32(v3, v2), v2, v4));
  float32x2_t v7 = v1[26];
  v1 += 26;
  *(float32x2_t *)v4.f32 = vcvt_f32_f64(vdivq_f64(vcvtq_f64_f32(v7), *(float64x2_t *)v1[-14].f32));
  return vdiv_f32(distortPoint(v1, vdiv_f32(vsub_f32(vmul_f32(v7, vdiv_f32(*(float32x2_t *)v6.i8, (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v6, 2))), vcvt_f32_f64(vmlsq_f64((float64x2_t)0, vcvtq_f64_f32(*(float32x2_t *)v4.f32), *(float64x2_t *)v1[-16].f32))), *(float32x2_t *)v4.f32)), *v1);
}

- (void)_initializeMetal
{
  v17[1] = *MEMORY[0x1E4F143B8];
  float32x4_t v3 = [MEMORY[0x1E4F55F60] metalDevice];
  metalDevice = self->_metalDevice;
  self->_metalDevice = v3;

  float32x4_t v5 = self->_metalDevice;
  if (v5
    && (int32x4_t v6 = (MTLCommandQueue *)[(MTLDevice *)v5 newCommandQueue],
        commandQueue = self->_commandQueue,
        self->_commandQueue = v6,
        commandQueue,
        self->_commandQueue)
    && ([MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()],
        (uint64_t v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    unint64_t v9 = (void *)v8;
    unsigned int v10 = self->_metalDevice;
    id v15 = 0;
    unsigned int v11 = (MTLLibrary *)[(MTLDevice *)v10 newDefaultLibraryWithBundle:v9 error:&v15];
    id v12 = v15;
    librarfloat y = self->_library;
    self->_librarfloat y = v11;

    if (!self->_library
      || [(DeskCamRenderingSession *)self _allocateTextures]
      || [(DeskCamRenderingSession *)self _compileShaders])
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    else
    {
      uint64_t v16 = *MEMORY[0x1E4F24C78];
      v17[0] = &unk_1F38CCBE8;
      CFDictionaryRef v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
      CVMetalTextureCacheCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v14, self->_metalDevice, 0, &self->_metalTextureCacheRef);
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
}

- (int)_allocateTextures
{
  if ((self->_deviceType & 0xFFFFFFFE) == 2)
  {
    int height = self->_outputDimensions.height;
    int v4 = height + 31;
    if (height >= 0) {
      int v4 = self->_outputDimensions.height;
    }
    float32x4_t v5 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:70 width:(uint64_t)(self->_outputDimensions.width + (self->_outputDimensions.width < 0 ? 0x1F : 0)) >> 5 height:(uint64_t)v4 >> 5 mipmapped:0];
    [v5 setUsage:3];
    [v5 setResourceOptions:32];
    int32x4_t v6 = [(MTLCommandQueue *)self->_commandQueue device];
    float32x2_t v7 = (MTLTexture *)[v6 newTextureWithDescriptor:v5];
    warpedRGBLowResTexture = self->_warpedRGBLowResTexture;
    self->_warpedRGBLowResTexture = v7;

    if (!self->_warpedRGBLowResTexture) {
      goto LABEL_17;
    }
    unint64_t v9 = [(MTLCommandQueue *)self->_commandQueue device];
    unsigned int v10 = (MTLTexture *)[v9 newTextureWithDescriptor:v5];
    blurredRGBLowResTexture = self->_blurredRGBLowResTexture;
    self->_blurredRGBLowResTexture = v10;

    if (!self->_blurredRGBLowResTexture) {
      goto LABEL_17;
    }
    [v5 setWidth:self->_outputDimensions.width];
    [v5 setHeight:self->_outputDimensions.height];
    id v12 = [(MTLCommandQueue *)self->_commandQueue device];
    int32x4_t v13 = (MTLTexture *)[v12 newTextureWithDescriptor:v5];
    warpedRGBHiResTexture = self->_warpedRGBHiResTexture;
    self->_warpedRGBHiResTexture = v13;

    if (!self->_warpedRGBHiResTexture) {
      goto LABEL_17;
    }
    if (!self->_autoZoomSupported) {
      goto LABEL_14;
    }
    [v5 setPixelFormat:10];
    [v5 setWidth:(uint64_t)(self->_outputDimensions.width + (self->_outputDimensions.width < 0 ? 0xF : 0)) >> 4];
    [v5 setHeight:(uint64_t)(self->_outputDimensions.height + (self->_outputDimensions.height < 0 ? 0xF : 0)) >> 4];
    id v15 = [(MTLCommandQueue *)self->_commandQueue device];
    uint64_t v16 = (MTLTexture *)[v15 newTextureWithDescriptor:v5];
    inputTexture = self->_lineDetectionController.inputTexture;
    self->_lineDetectionController.inputTexture = v16;

    if (!self->_lineDetectionController.inputTexture) {
      goto LABEL_17;
    }
    float32x2_t v18 = [(MTLCommandQueue *)self->_commandQueue device];
    float32x2_t v19 = (MTLTexture *)[v18 newTextureWithDescriptor:v5];
    auxiliaryTexture = self->_lineDetectionController.auxiliaryTexture;
    self->_lineDetectionController.auxiliaryTexture = v19;

    if (!self->_lineDetectionController.auxiliaryTexture) {
      goto LABEL_17;
    }
    [v5 setPixelFormat:125];
    [v5 setHeight:31];
    float v21 = (float)(unint64_t)[(MTLTexture *)self->_lineDetectionController.inputTexture height] * 1.4;
    [v5 setWidth:vcvtas_u32_f32(v21)];
    [v5 setResourceOptions:0];
    float32x2_t v22 = [(MTLCommandQueue *)self->_commandQueue device];
    uint64_t v23 = [v22 newTextureWithDescriptor:v5];
    float32x2_t v24 = *(void **)&self->_anon_aa0[16];
    *(void *)&self->_anon_aa0[16] = v23;

    simd_float3x3 v25 = *(void **)&self->_anon_aa0[16];
    if (!v25) {
      goto LABEL_17;
    }
    int v26 = [v25 height];
    unsigned int v27 = [*(id *)&self->_anon_aa0[16] width];
    float32x4_t v28 = malloc_type_calloc(v27 * v26, 0x10uLL, 0x1000040451B5BE8uLL);
    *(void *)&self->_anon_aa0[24] = v28;
    if (!v28) {
      goto LABEL_17;
    }
    float32x4_t v29 = malloc_type_calloc(v27, 4uLL, 0x100004052888210uLL);
    *(void *)&self->_anon_aa0[32] = v29;
    if (v29
      && (uint64_t v30 = malloc_type_calloc(v27, 0x20uLL, 0x1000040E0EAB150uLL), (*(void *)&self->_anon_aa0[40] = v30) != 0))
    {
LABEL_14:
      int v31 = 0;
    }
    else
    {
LABEL_17:
      fig_log_get_emitter();
      FigDebugAssert3();
      int v31 = -1;
    }
  }
  else
  {
    int v31 = 0;
    float32x4_t v5 = 0;
  }

  return v31;
}

- (int)_compileShaders
{
  uint64_t v3 = 0;
  while (1)
  {
    int v4 = [(DeskCamRenderingSession *)self _compileComputeShader:*(__CFString **)((char *)&_deskCamShaderList + v3)];
    float32x4_t v5 = *(__CFString **)((char *)&_deskCamShaderList + v3 + 8);
    *(__CFString **)((char *)&_deskCamShaderList + v3 + 8) = v4;

    if (!*(__CFString **)((char *)&_deskCamShaderList + v3 + 8)) {
      break;
    }
    v3 += 16;
    if (v3 == 160) {
      return 0;
    }
  }
  fig_log_get_emitter();
  FigDebugAssert3();
  return -12786;
}

- (id)_newBufferWithLength:(unint64_t)a3 options:(unint64_t)a4 label:(id)a5
{
  id v8 = a5;
  metalDevice = self->_metalDevice;
  if (metalDevice)
  {
    unsigned int v10 = (void *)[(MTLDevice *)metalDevice newBufferWithLength:a3 options:a4];
    [v10 setLabel:v8];
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    unsigned int v10 = 0;
  }

  return v10;
}

- (id)_compileComputeShader:(id)a3
{
  id v4 = a3;
  if (!v4 || !self->_library || !self->_metalDevice)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int32x4_t v6 = 0;
LABEL_13:
    unint64_t v9 = 0;
    goto LABEL_8;
  }
  float32x4_t v5 = objc_opt_new();
  int32x4_t v6 = v5;
  if (!v5
    || ([v5 setLabel:v4],
        float32x2_t v7 = (void *)[(MTLLibrary *)self->_library newFunctionWithName:v4],
        [v6 setComputeFunction:v7],
        v7,
        [v6 computeFunction],
        id v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        !v8))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_13;
  }
  unint64_t v9 = (void *)[(MTLDevice *)self->_metalDevice newComputePipelineStateWithDescriptor:v6 options:0 reflection:0 error:0];
  if (!v9)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
LABEL_8:

  return v9;
}

- (DeskCamSessionOptions)options
{
  return self->_options;
}

- (BOOL)autoZoomSupported
{
  return self->_autoZoomSupported;
}

- (void).cxx_destruct
{
  __destructor_8_s0_s8_s32((uint64_t)&self->_lineDetectionController);
  objc_storeStrong((id *)&self->_warpedRGBHiResTexture, 0);
  objc_storeStrong((id *)&self->_blurredRGBLowResTexture, 0);
  objc_storeStrong((id *)&self->_warpedRGBLowResTexture, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_metalDevice, 0);
  objc_storeStrong((id *)&self->_portType, 0);

  objc_storeStrong((id *)&self->_options, 0);
}

@end