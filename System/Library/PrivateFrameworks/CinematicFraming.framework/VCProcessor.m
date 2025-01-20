@interface VCProcessor
+ (CGPoint)warpCGPoint:(CGPoint)a3 fromCamera:(id)a4 toCamera:(id)a5;
+ (CGRect)warpCGRect:(CGRect)a3 fromCamera:(id)a4 toCamera:(id)a5;
- ($2825F4736939C4A6D3AD43837233062D)outputDimensions;
- (BOOL)attachMetadataToOutputPixelBuffer;
- (BOOL)autoFramingEnabled;
- (BOOL)autoRestoreManualFramingState;
- (BOOL)centerStagePassthrough;
- (BOOL)confineOutputCamera;
- (BOOL)fisheyeEffectEnabled;
- (BOOL)oneShotFramingCompleted;
- (BOOL)orientationCorrectionEnabled;
- (BOOL)outputCameraResetCompleted;
- (BOOL)rollCorrectionEnabled;
- (CGPoint)warpCGPoint:(CGPoint)result;
- (CGRect)outputROI;
- (CGRect)warpCGRect:(CGRect)result;
- (CinematicFramingSession)framingSession;
- (CinematicFramingSessionInputMetadata)inputMetadata;
- (MTLCommandQueue)metalCommandQueue;
- (NSDictionary)cameraInfoByPortType;
- (NSDictionary)manualFramingStateMetadata;
- (NSDictionary)tuningParameters;
- (VCCamera)inputCamera;
- (VCCamera)outputCamera;
- (VCProcessor)init;
- (__CVBuffer)inputPixelBuffer;
- (__CVBuffer)outputPixelBuffer;
- (__n128)_getGravityVectorForCamera:(void *)a3 fromMetadata:(void *)a4;
- (__n128)outputCameraDefaultRotation;
- (double)getPhysicalCameraToVirtualCameraTransform;
- (float)_getBaseZoomFactor:(id)a3;
- (float)autoFramingFOVLimit;
- (float)manualFramingDefaultVideoZoomFactor;
- (float)videoZoomFactor;
- (id)_bindCVPixleBuffer:(__CVBuffer *)a3 usage:(unint64_t)a4;
- (id)_cachedTexturesFromPixelBuffer:(__CVBuffer *)a3 usage:(unint64_t)a4;
- (id)auxiliaryStreamCamera;
- (id)cameraSwitchingDelegate;
- (int)_confineOutputCameraToInputCameraFrustum:(BOOL)a3;
- (int)_createRenderTargetForOutputLumaTex:(id)a3 outputChromaTex:(id)a4 renderTargetLumaTex:(id *)a5 renderTargetChromaTex:(id *)a6;
- (int)_encodeDownsample:(id)a3 inputLumaTex:(id)a4 inputChromaTex:(id)a5 outputLumaTex:(id)a6 outputChromaTex:(id)a7;
- (int)_encodeRender:(id)a3 inputLumaTex:(id)a4 inputChromaTex:(id)a5 outputLumaTex:(id)a6 outputChromaTex:(id)a7;
- (int)_encodeRenderTargetResolve:(id)a3 renderTargetLumaTex:(id)a4 renderTargetChromaTex:(id)a5 outputLumaTex:(id)a6 outputChromaTex:(id)a7;
- (int)_fillRenderParams:(id *)a3;
- (int)_loadTuningParameters;
- (int)_processStill;
- (int)_processVideo;
- (int)_render;
- (int)_setOutputPixelBufferAttachments;
- (int)_updateAutoFraming;
- (int)_updateCamera:(id)a3 withMetadata:(id)a4;
- (int)_updateManualFraming;
- (int)_updateManualFramingStateMetadata;
- (int)_updateOutputCameraAnimation;
- (int)_updateOutputCameraForRollCorrection;
- (int)checkCameraSwitchingWithAuxilaryStreamMetadata:(id)a3;
- (int)finishProcessing;
- (int)prepareToProcess:(unsigned int)a3;
- (int)prewarm;
- (int)process;
- (int)purgeResources;
- (int)resetState;
- (int)setup;
- (unint64_t)_metalTextureFormatFromPixelBufferFormat:(unsigned int)a3 forPlane:(unsigned int)a4;
- (void)_cacheManualFramingState;
- (void)_getEquivalentOutputCameraFocalLength:(VCProcessor *)self rotation:(SEL)a2 forViewport:;
- (void)_restoreManualFramingState;
- (void)_updateOutputCameraFisheyeEffect;
- (void)_updateOutputCameraFocalLengthWithVideoZoomFactor;
- (void)_updateOutputCameraRotationWithCursor;
- (void)_updateVideoZoomFactorFromInputCamera:(id)a3 toOutputCamera:(id)a4;
- (void)adjustToFrameCurrentScene;
- (void)continueRotatingToPoint:(CGPoint)a3;
- (void)dealloc;
- (void)resetOutputCamera;
- (void)setAttachMetadataToOutputPixelBuffer:(BOOL)a3;
- (void)setAutoFramingEnabled:(BOOL)a3;
- (void)setAutoFramingFOVLimit:(float)a3;
- (void)setAutoRestoreManualFramingState:(BOOL)a3;
- (void)setAuxilaryStreamCamera:(id)a3;
- (void)setCameraInfoByPortType:(id)a3;
- (void)setCameraSwitchingDelegate:(id)a3;
- (void)setCenterStagePassthrough:(BOOL)a3;
- (void)setConfineOutputCamera:(BOOL)a3;
- (void)setFisheyeEffectEnabled:(BOOL)a3;
- (void)setInputCamera:(id)a3;
- (void)setInputMetadata:(id)a3;
- (void)setInputPixelBuffer:(__CVBuffer *)a3;
- (void)setManualFramingDefaultVideoZoomFactor:(float)a3;
- (void)setMetalCommandQueue:(id)a3;
- (void)setOrientationCorrectionEnabled:(BOOL)a3;
- (void)setOutputCamera:(id)a3;
- (void)setOutputCameraDefaultRotation:(VCProcessor *)self;
- (void)setOutputDimensions:(id)a3;
- (void)setOutputPixelBuffer:(__CVBuffer *)a3;
- (void)setOutputROI:(CGRect)a3;
- (void)setRollCorrectionEnabled:(BOOL)a3;
- (void)setTuningParameters:(id)a3;
- (void)setVideoZoomFactor:(float)a3;
- (void)startRotatingFromPoint:(CGPoint)a3;
@end

@implementation VCProcessor

- (VCProcessor)init
{
  v8.receiver = self;
  v8.super_class = (Class)VCProcessor;
  result = [(VCProcessor *)&v8 init];
  result->_outputROI.origin.x = 0.0;
  result->_outputROI.origin.y = 0.0;
  __asm { FMOV            V0.2D, #1.0 }
  result->_outputROI.size = _Q0;
  *(_DWORD *)&result->_orientationCorrectionEnabled = 16843009;
  __asm { FMOV            V0.2S, #1.0 }
  *(CGFloat *)&result->_videoZoomFactor = _Q0.width;
  *(_OWORD *)result->_outputCameraDefaultRotation = 0u;
  return result;
}

- (int)setup
{
  if (self->_outputDimensions.width < 1) {
    return 0;
  }
  id v3 = objc_alloc(MEMORY[0x1E4F55F60]);
  v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v5 = (FigMetalContext *)[v3 initWithbundle:v4 andOptionalCommandQueue:self->_metalCommandQueue];
  context = self->_context;
  self->_context = v5;

  if (!self->_context) {
    return 0;
  }
  id v7 = objc_alloc(MEMORY[0x1E4F55F40]);
  objc_super v8 = [(FigMetalContext *)self->_context device];
  v9 = (void *)[v7 initWithDevice:v8 allocatorType:2];
  [(FigMetalContext *)self->_context setAllocator:v9];

  v10 = [(FigMetalContext *)self->_context allocator];

  if (!v10) {
    return -1;
  }
  id v11 = objc_alloc_init(MEMORY[0x1E4F55F58]);
  [v11 setLabel:@"VCP_FigMetalAllocator"];
  [v11 setWireMemory:1];
  [v11 setMemSize:10485760];
  [v11 setResourceOptions:512];
  v12 = [(FigMetalContext *)self->_context allocator];
  [v12 setupWithDescriptor:v11];

  v13 = [(FigMetalContext *)self->_context commandQueue];
  metalCommandQueue = self->_metalCommandQueue;
  self->_metalCommandQueue = v13;

  int result = [(VCProcessor *)self _loadTuningParameters];
  if (result) {
    return result;
  }
  v16 = objc_alloc_init(VCCamera);
  inputCamera = self->_inputCamera;
  self->_inputCamera = v16;

  if (!self->_inputCamera) {
    return -1;
  }
  v18 = objc_alloc_init(VCCamera);
  outputCamera = self->_outputCamera;
  self->_outputCamera = v18;

  v20 = self->_outputCamera;
  if (!v20) {
    return -1;
  }
  $470D365275581EF16070F5A11344F73E outputDimensions = self->_outputDimensions;
  v22.i64[0] = outputDimensions.width;
  v22.i64[1] = outputDimensions.height;
  float64x2_t v33 = vmulq_f64((float64x2_t)self->_outputROI.size, vcvtq_f64_s64(v22));
  [(VCCamera *)v20 setSensorSize:COERCE_DOUBLE(vcvt_f32_f64(v33))];
  __asm { FMOV            V0.2D, #0.5 }
  [(VCCamera *)self->_outputCamera setPrincipalPoint:COERCE_DOUBLE(vcvt_f32_f64(vmulq_f64(v33, _Q0)))];
  [(VCCamera *)self->_inputCamera fov];
  -[VCCamera setFov:](self->_outputCamera, "setFov:");
  v28 = [[CinematicFramingSession alloc] initWithOutputDimensions:*(void *)&self->_outputDimensions];
  framingSession = self->_framingSession;
  self->_framingSession = v28;

  v30 = self->_framingSession;
  if (!v30) {
    return -1;
  }
  -[CinematicFramingSession setOutputFramingRectOfInterest:](v30, "setOutputFramingRectOfInterest:", self->_outputROI.origin.x, self->_outputROI.origin.y, self->_outputROI.size.width, self->_outputROI.size.height);
  [(CinematicFramingSession *)self->_framingSession setCameraOrientationCorrectionEnabled:self->_orientationCorrectionEnabled];
  v31 = objc_alloc_init(VCCameraAnimator);
  outputCameraAnimator = self->_outputCameraAnimator;
  self->_outputCameraAnimator = v31;

  int result = 0;
  self->_autoFramingEnabled = 0;
  *(_WORD *)&self->_outputCameraResetCompleted = 257;
  self->_videoZoomFactor = self->_manualFramingDefaultVideoZoomFactor;
  return result;
}

- (int)prewarm
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = [[VCShaders alloc] initWithContext:self->_context];
  shaders = self->_shaders;
  self->_shaders = v3;

  if (self->_shaders)
  {
    p_cvMetalTextureCacheRef = &self->_cvMetalTextureCacheRef;
    if (!self->_cvMetalTextureCacheRef)
    {
      uint64_t v9 = *MEMORY[0x1E4F24C78];
      v10[0] = &unk_1F38CCBD0;
      CFDictionaryRef v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
      id v7 = [(FigMetalContext *)self->_context device];
      CVMetalTextureCacheCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v6, v7, 0, p_cvMetalTextureCacheRef);
    }
  }
  return 0;
}

- (int)prepareToProcess:(unsigned int)a3
{
  self->_processingType = a3;
  return 0;
}

- (int)process
{
  if (self->_inputPixelBuffer && self->_inputCamera && self->_outputPixelBuffer && self->_outputCamera)
  {
    unsigned int processingType = self->_processingType;
    if (processingType == 1) {
      return [(VCProcessor *)self _processStill];
    }
    if (!processingType && self->_inputMetadata) {
      return [(VCProcessor *)self _processVideo];
    }
  }
  return -1;
}

- (int)purgeResources
{
  cvMetalTextureCacheRef = self->_cvMetalTextureCacheRef;
  if (cvMetalTextureCacheRef)
  {
    CVMetalTextureCacheFlush(cvMetalTextureCacheRef, 0);
    v4 = self->_cvMetalTextureCacheRef;
    if (v4)
    {
      CFRelease(v4);
      self->_cvMetalTextureCacheRef = 0;
    }
  }
  v5 = [(FigMetalContext *)self->_context allocator];
  [v5 reset];

  CFDictionaryRef v6 = [(FigMetalContext *)self->_context allocator];
  [v6 purgeResources];

  return 0;
}

- (void)dealloc
{
  [(VCProcessor *)self purgeResources];
  v3.receiver = self;
  v3.super_class = (Class)VCProcessor;
  [(VCProcessor *)&v3 dealloc];
}

- (int)finishProcessing
{
  return 0;
}

- (int)resetState
{
  return 0;
}

- (void)setMetalCommandQueue:(id)a3
{
  v5 = (MTLCommandQueue *)a3;
  metalCommandQueue = self->_metalCommandQueue;
  p_metalCommandQueue = &self->_metalCommandQueue;
  if (metalCommandQueue == v5)
  {
    objc_super v8 = v5;
    objc_storeStrong((id *)p_metalCommandQueue, a3);
    v5 = v8;
  }
}

- (MTLCommandQueue)metalCommandQueue
{
  return (MTLCommandQueue *)[(FigMetalContext *)self->_context commandQueue];
}

- (int)_loadTuningParameters
{
  if (self->_tuningParameters) {
    objc_super v3 = [[VCTuningParameters alloc] initWithDictionary:self->_tuningParameters];
  }
  else {
    objc_super v3 = objc_alloc_init(VCTuningParameters);
  }
  tuning = self->_tuning;
  self->_tuning = v3;

  if (self->_tuning) {
    return 0;
  }
  else {
    return -16680;
  }
}

- (void)setOutputROI:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v18.origin.double x = 0.0;
  v18.origin.double y = 0.0;
  v18.size.double width = 1.0;
  v18.size.double height = 1.0;
  v19.origin.double x = x;
  v19.origin.double y = y;
  v19.size.double width = width;
  v19.size.double height = height;
  BOOL v8 = CGRectContainsRect(v18, v19);
  if (height > 0.0001 && width > 0.0001 && v8)
  {
    v20.origin.double x = x;
    v20.origin.double y = y;
    v20.size.double width = width;
    v20.size.double height = height;
    if (!CGRectEqualToRect(self->_outputROI, v20))
    {
      self->_outputROI.origin.double x = x;
      self->_outputROI.origin.double y = y;
      self->_outputROI.size.double width = width;
      self->_outputROI.size.double height = height;
      if (!self->_processingType)
      {
        [(VCCamera *)self->_outputCamera fov];
        int v11 = v10;
        $470D365275581EF16070F5A11344F73E outputDimensions = self->_outputDimensions;
        v13.i64[0] = outputDimensions.width;
        v13.i64[1] = outputDimensions.height;
        [(VCCamera *)self->_outputCamera setSensorSize:COERCE_DOUBLE(vcvt_f32_f64(vmulq_f64((float64x2_t)self->_outputROI.size, vcvtq_f64_s64(v13))))];
        [(VCCamera *)self->_outputCamera sensorSize];
        [(VCCamera *)self->_outputCamera setPrincipalPoint:COERCE_DOUBLE(vmul_f32(v14, (float32x2_t)0x3F0000003F000000))];
        LODWORD(v15) = v11;
        [(VCCamera *)self->_outputCamera setFov:v15];
        -[CinematicFramingSession setOutputFramingRectOfInterest:](self->_framingSession, "setOutputFramingRectOfInterest:", x, y, width, height);
        outputCameraAnimator = self->_outputCameraAnimator;
        [(VCCameraAnimator *)outputCameraAnimator reset];
      }
    }
  }
}

- (void)setOrientationCorrectionEnabled:(BOOL)a3
{
  self->_orientationCorrectionEnabled = a3;
  -[CinematicFramingSession setCameraOrientationCorrectionEnabled:](self->_framingSession, "setCameraOrientationCorrectionEnabled:");
}

- (void)setVideoZoomFactor:(float)a3
{
  if (a3 > 0.0 && !self->_autoFramingEnabled)
  {
    *(_WORD *)&self->_outputCameraResetCompleted = 257;
    [(VCCameraAnimator *)self->_outputCameraAnimator configureWithPreset:1];
    self->_videoZoomFactor = a3;
    if (a3 == 1.0)
    {
      long long v5 = *(_OWORD *)self->_outputCameraDefaultRotation;
      outputCamera = self->_outputCamera;
      [(VCCamera *)outputCamera setRotation:*(double *)&v5];
    }
  }
}

- (double)getPhysicalCameraToVirtualCameraTransform
{
  [*(id *)(a1 + 192) extrinsicMatrix];
  float32x4_t v10 = v2;
  float32x4_t v11 = v3;
  float32x4_t v8 = v5;
  float32x4_t v9 = v4;
  [*(id *)(a1 + 176) extrinsicMatrix];
  simd_float4x4 v15 = __invert_f4(v14);
  uint64_t v6 = 0;
  simd_float4x4 v12 = v15;
  do
  {
    *(long long *)((char *)&v13 + v6 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v10, COERCE_FLOAT(*(_OWORD *)&v12.columns[v6])), v11, *(float32x2_t *)v12.columns[v6].f32, 1), v9, (float32x4_t)v12.columns[v6], 2), v8, (float32x4_t)v12.columns[v6], 3);
    ++v6;
  }
  while (v6 != 4);
  return *(double *)&v13;
}

- (int)_processStill
{
  float width = (float)self->_outputDimensions.width;
  [(VCCamera *)self->_outputCamera sensorSize];
  float height = (float)self->_outputDimensions.height;
  float v6 = width / v5;
  [(VCCamera *)self->_outputCamera sensorSize];
  *(float *)&uint64_t v8 = height / *((float *)&v8 + 1);
  if (v6 < (float)(height / *((float *)&v8 + 1))) {
    *(float *)&uint64_t v8 = v6;
  }
  [(VCCamera *)self->_outputCamera sensorSize];
  [(VCCamera *)self->_outputCamera setSensorSize:COERCE_DOUBLE(vmul_n_f32(v9, v13))];
  [(VCCamera *)self->_outputCamera focalLength];
  [(VCCamera *)self->_outputCamera setFocalLength:COERCE_DOUBLE(vmul_n_f32(v10, v13))];
  [(VCCamera *)self->_outputCamera principalPoint];
  [(VCCamera *)self->_outputCamera setPrincipalPoint:COERCE_DOUBLE(vmul_n_f32(v11, v13))];

  return [(VCProcessor *)self _render];
}

- (int)_processVideo
{
  int result = [(VCProcessor *)self _updateCamera:self->_inputCamera withMetadata:self->_inputMetadata];
  if (!result)
  {
    if (self->_autoFramingEnabled)
    {
      int result = [(VCProcessor *)self _updateAutoFraming];
      if (result) {
        return result;
      }
    }
    else
    {
      int result = [(VCProcessor *)self _updateManualFraming];
      if (result) {
        return result;
      }
    }
    [(VCProcessor *)self _updateOutputCameraFisheyeEffect];
    if ((!self->_rollCorrectionEnabled
       || (int result = [(VCProcessor *)self _updateOutputCameraForRollCorrection]) == 0)
      && (!self->_confineOutputCamera
       || (int result = [(VCProcessor *)self _confineOutputCameraToInputCameraFrustum:1]) == 0))
    {
      int result = [(VCProcessor *)self _updateOutputCameraAnimation];
      if (!result)
      {
        int result = [(VCProcessor *)self _render];
        if (!result
          && (self->_autoFramingEnabled
           || (int result = [(VCProcessor *)self _updateManualFramingStateMetadata]) == 0))
        {
          if (self->_attachMetadataToOutputPixelBuffer)
          {
            return [(VCProcessor *)self _setOutputPixelBufferAttachments];
          }
          else
          {
            return 0;
          }
        }
      }
    }
  }
  return result;
}

- (void)startRotatingFromPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  float32x2_t v4 = vcvt_f32_f64((float64x2_t)a3);
  *(float32x2_t *)&self->_rotationCursorPrev[3] = v4;
  *(float32x2_t *)&self->_rotationCursorCurr[3] = v4;
  *(_WORD *)&self->_outputCameraResetCompleted = 257;
  [(VCCameraAnimator *)self->_outputCameraAnimator configureWithPreset:1];
}

- (void)continueRotatingToPoint:(CGPoint)a3
{
  if (!self->_confineOutputCamera || self->_videoZoomFactor != 1.0)
  {
    CGFloat y = a3.y;
    *(float32x2_t *)&self->_rotationCursorCurr[3] = vcvt_f32_f64((float64x2_t)a3);
    *(_WORD *)&self->_outputCameraResetCompleted = 257;
    [(VCCameraAnimator *)self->_outputCameraAnimator configureWithPreset:1];
  }
}

- (void)resetOutputCamera
{
  *(_WORD *)&self->_outputCameraResetCompleted = 256;
  [(VCCameraAnimator *)self->_outputCameraAnimator configureWithPreset:2];
  outputCameraAnimator = self->_outputCameraAnimator;

  [(VCCameraAnimator *)outputCameraAnimator interrupt];
}

- (void)adjustToFrameCurrentScene
{
  *(_WORD *)&self->_outputCameraResetCompleted = 1;
  [(VCCameraAnimator *)self->_outputCameraAnimator configureWithPreset:2];
  outputCameraAnimator = self->_outputCameraAnimator;

  [(VCCameraAnimator *)outputCameraAnimator interrupt];
}

- (void)setManualFramingDefaultVideoZoomFactor:(float)a3
{
  if (a3 > 0.0) {
    self->_manualFramingDefaultVideoZoomFactor = a3;
  }
}

- (void)setOutputCameraDefaultRotation:(VCProcessor *)self
{
  double v3 = *(double *)&v2;
  *(_OWORD *)self->_outputCameraDefaultRotation = v2;
  id v4 = [(CinematicFramingSession *)self->_framingSession options];
  [v4 setDefaultViewportRotation:v3];
}

- (int)_updateManualFraming
{
  [(VCProcessor *)self _cacheManualFramingState];
  if (!self->_oneShotFramingCompleted)
  {
    [(VCTuningParameters *)self->_tuning oneShotFramingDuration];
    float v4 = v3;
    [(VCCameraAnimator *)self->_outputCameraAnimator duration];
    if (v5 > v4) {
      return 0;
    }
    [(CinematicFramingSession *)self->_framingSession processWithMetadata:self->_inputMetadata];
    [(CinematicFramingSession *)self->_framingSession idealViewport];
    double v23 = 0.0;
    int v22 = 0;
    uint64_t v21 = 0;
    -[VCProcessor _getEquivalentOutputCameraFocalLength:rotation:forViewport:](self, "_getEquivalentOutputCameraFocalLength:rotation:forViewport:", &v23, &v21);
    [(VCCamera *)self->_outputCamera setFocalLength:v23];
    *(void *)&long long v6 = v21;
LABEL_7:
    [(VCCamera *)self->_outputCamera setRotation:*(double *)&v6];
    return 0;
  }
  if (!self->_outputCameraResetCompleted)
  {
    [(VCProcessor *)self _getBaseZoomFactor:self->_inputCamera];
    float v8 = v7;
    [(VCCamera *)self->_inputCamera focalLength];
    float32x2_t v10 = v9;
    [(VCCamera *)self->_inputCamera sensorSize];
    float32x2_t v12 = vdiv_f32(v10, v11);
    float v13 = fminf(v12.f32[0], v12.f32[1]);
    [(VCCamera *)self->_outputCamera focalLength];
    float32x2_t v15 = v14;
    [(VCCamera *)self->_outputCamera sensorSize];
    float32x2_t v17 = vdiv_f32(v15, v16);
    v15.f32[0] = fminf(v17.f32[0], v17.f32[1]);
    float v18 = (float)(v13 / v8) * self->_manualFramingDefaultVideoZoomFactor;
    [(VCCamera *)self->_outputCamera focalLength];
    [(VCCamera *)self->_outputCamera setFocalLength:COERCE_DOUBLE(vmul_n_f32(v19, v18 / v15.f32[0]))];
    long long v6 = *(_OWORD *)self->_outputCameraDefaultRotation;
    goto LABEL_7;
  }
  [(VCProcessor *)self _updateOutputCameraFocalLengthWithVideoZoomFactor];
  [(VCProcessor *)self _updateOutputCameraRotationWithCursor];
  return 0;
}

- (void)_updateOutputCameraFocalLengthWithVideoZoomFactor
{
  [(VCCamera *)self->_outputCamera focalLength];
  float32x2_t v4 = v3;
  [(VCCamera *)self->_outputCamera sensorSize];
  float32x2_t v6 = vdiv_f32(v4, v5);
  float v7 = fminf(v6.f32[0], v6.f32[1]);
  [(VCCamera *)self->_inputCamera focalLength];
  float32x2_t v9 = v8;
  [(VCCamera *)self->_inputCamera sensorSize];
  float32x2_t v11 = vdiv_f32(v9, v10);
  v9.f32[0] = fminf(v11.f32[0], v11.f32[1]);
  [(VCProcessor *)self _getBaseZoomFactor:self->_inputCamera];
  float videoZoomFactor = self->_videoZoomFactor;
  outputCamera = self->_outputCamera;
  float v17 = (float)(v9.f32[0] * (float)(videoZoomFactor / v13)) / v7;
  [(VCCamera *)outputCamera focalLength];
  double v16 = COERCE_DOUBLE(vmul_n_f32(v15, v17));

  [(VCCamera *)outputCamera setFocalLength:v16];
}

- (void)_updateOutputCameraRotationWithCursor
{
  uint32x2_t v2 = (uint32x2_t)vceq_f32(*(float32x2_t *)&self->_rotationCursorCurr[3], *(float32x2_t *)&self->_rotationCursorPrev[3]);
  if ((vpmin_u32(v2, v2).u32[0] & 0x80000000) == 0)
  {
    if (!self->_confineOutputCamera
      || ([(VCCamera *)self->_outputCamera zoomFOV],
          float v5 = v4,
          [(VCCamera *)self->_inputCamera zoomFOV],
          (float)(v5 / v6) < 0.98))
    {
      [(VCCamera *)self->_outputCamera focalLength];
      float v27 = v7;
      [(VCCamera *)self->_outputCamera zoomFactor];
      float v9 = v8 * v27;
      [(VCCamera *)self->_outputCamera focalLength];
      float32x2_t v28 = v10;
      [(VCCamera *)self->_outputCamera zoomFactor];
      float v12 = vmuls_lane_f32(v11, v28, 1);
      [(VCCamera *)self->_outputCamera sensorSize];
      float v14 = (float)(COERCE_FLOAT(*(void *)&self->_rotationCursorPrev[3]) + -0.5) * v13;
      [(VCCamera *)self->_outputCamera sensorSize];
      float v16 = vmuls_lane_f32(0.5 - *(float *)&self->_rotationCursorPrev[7], v15, 1);
      float v17 = atan2f(v14, v9);
      float v18 = atan2f(v16, v12);
      [(VCCamera *)self->_outputCamera sensorSize];
      float v20 = (float)(COERCE_FLOAT(*(void *)&self->_rotationCursorCurr[3]) + -0.5) * v19;
      [(VCCamera *)self->_outputCamera sensorSize];
      float v22 = vmuls_lane_f32(0.5 - *(float *)&self->_rotationCursorCurr[7], v21, 1);
      float v23 = atan2f(v20, v9);
      *(float *)&unint64_t v24 = v18 - atan2f(v22, v12);
      *((float *)&v24 + 1) = v17 - v23;
      float32x4_t v29 = (float32x4_t)v24;
      outputCamera = self->_outputCamera;
      [(VCCamera *)outputCamera rotation];
      [(VCCamera *)outputCamera setRotation:*(double *)vaddq_f32(v26, v29).i64];
      *(void *)&self->_rotationCursorPrev[3] = *(void *)&self->_rotationCursorCurr[3];
    }
  }
}

- (void)_cacheManualFramingState
{
  [(VCCamera *)self->_outputCamera rotation];
  *(void *)&self->_anon_28[3] = v3;
  *(float *)&self->_anon_28[11] = self->_videoZoomFactor;
}

- (void)_restoreManualFramingState
{
  [(VCCamera *)self->_outputCamera setRotation:*(double *)&self->_anon_28[3]];
  self->_float videoZoomFactor = *(float *)&self->_anon_28[11];

  [(VCProcessor *)self _updateOutputCameraFocalLengthWithVideoZoomFactor];
}

- (int)_updateManualFramingStateMetadata
{
  if (self->_oneShotFramingCompleted || [(VCCameraAnimator *)self->_outputCameraAnimator animating])
  {
    int v3 = 0;
  }
  else
  {
    int v3 = 1;
    self->_oneShotFramingCompleted = 1;
  }
  if (self->_outputCameraResetCompleted || [(VCCameraAnimator *)self->_outputCameraAnimator animating])
  {
    int v4 = 0;
  }
  else
  {
    int v4 = 1;
    self->_outputCameraResetCompleted = 1;
  }
  float v5 = [MEMORY[0x1E4F1CA60] dictionary];
  float v6 = v5;
  if (v3) {
    [(NSDictionary *)v5 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F55B68]];
  }
  if (v4) {
    [(NSDictionary *)v6 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F55B78]];
  }
  if (!self->_oneShotFramingCompleted || !self->_outputCameraResetCompleted)
  {
    float v7 = self->_inputCamera;
    float v8 = [(VCCameraAnimator *)self->_outputCameraAnimator animatedCamera];
    outputCamera = v8;
    if (!v8) {
      outputCamera = self->_outputCamera;
    }
    float32x2_t v10 = outputCamera;

    [(VCProcessor *)self _updateVideoZoomFactorFromInputCamera:v7 toOutputCamera:v10];
  }
  float v11 = (void *)MEMORY[0x1E4F55B70];
  float v12 = (void *)MEMORY[0x1E4F55B60];
  if (((v3 | v4) & 1) == 0)
  {
    float32x2_t v13 = *(float32x2_t *)&self->_anon_28[3];
    [(VCCamera *)self->_outputCamera rotation];
    uint32x2_t v15 = (uint32x2_t)vmvn_s8((int8x8_t)vceq_f32(v13, v14));
    if ((vpmax_u32(v15, v15).u32[0] & 0x80000000) == 0) {
      goto LABEL_26;
    }
  }
  [(VCCamera *)self->_outputCamera rotation];
  float v30 = v16;
  [(VCCamera *)self->_outputCamera rotation];
  v32.CGFloat y = v17;
  v32.double x = v30;
  CFDictionaryRef DictionaryRepresentation = CGPointCreateDictionaryRepresentation(v32);
  [(NSDictionary *)v6 setObject:DictionaryRepresentation forKeyedSubscript:*v11];

  *(float *)&double v19 = self->_videoZoomFactor;
  float v20 = [NSNumber numberWithFloat:v19];
  [(NSDictionary *)v6 setObject:v20 forKeyedSubscript:*v12];

  if (v3)
  {
    [(NSDictionary *)v6 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F55B68]];
    if (!v4) {
      goto LABEL_27;
    }
    goto LABEL_22;
  }
  if ((v4 & 1) == 0)
  {
    if ((v3 | v4)) {
      goto LABEL_27;
    }
LABEL_26:
    if (*(float *)&self->_anon_28[11] == self->_videoZoomFactor) {
      goto LABEL_31;
    }
    goto LABEL_27;
  }
LABEL_22:
  [(NSDictionary *)v6 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F55B78]];
LABEL_27:
  float32x2_t v21 = *(float32x2_t *)&self->_anon_28[3];
  [(VCCamera *)self->_outputCamera rotation];
  uint32x2_t v23 = (uint32x2_t)vmvn_s8((int8x8_t)vceq_f32(v21, v22));
  if ((vpmax_u32(v23, v23).u32[0] & 0x80000000) != 0)
  {
    [(VCCamera *)self->_outputCamera rotation];
    float v31 = v24;
    [(VCCamera *)self->_outputCamera rotation];
    v33.CGFloat y = v25;
    v33.double x = v31;
    CFDictionaryRef v26 = CGPointCreateDictionaryRepresentation(v33);
    [(NSDictionary *)v6 setObject:v26 forKeyedSubscript:*v11];
  }
  if (*(float *)&self->_anon_28[11] != self->_videoZoomFactor)
  {
    float v27 = objc_msgSend(NSNumber, "numberWithFloat:");
    [(NSDictionary *)v6 setObject:v27 forKeyedSubscript:*v12];
  }
LABEL_31:
  manualFramingStateMetadata = self->_manualFramingStateMetadata;
  self->_manualFramingStateMetadata = v6;

  return 0;
}

- (void)setAutoFramingEnabled:(BOOL)a3
{
  BOOL autoFramingEnabled = self->_autoFramingEnabled;
  if (autoFramingEnabled != a3)
  {
    self->_framingModeJustChanged = 1;
    if (self->_autoRestoreManualFramingState)
    {
      if (autoFramingEnabled) {
        [(VCProcessor *)self _restoreManualFramingState];
      }
      else {
        [(VCProcessor *)self _cacheManualFramingState];
      }
    }
    *(_WORD *)&self->_outputCameraResetCompleted = 257;
    self->_BOOL autoFramingEnabled = a3;
  }
}

- (float)autoFramingFOVLimit
{
  [(CinematicFramingSession *)self->_framingSession fovLimit];
  return result;
}

- (void)setAutoFramingFOVLimit:(float)a3
{
}

- (int)_updateAutoFraming
{
  int v3 = [(VCProcessor *)self _updateCamera:self->_inputCamera withMetadata:self->_inputMetadata];
  if (!v3)
  {
    double v8 = 0.0;
    int v7 = 0;
    double v6 = 0.0;
    [(CinematicFramingSession *)self->_framingSession processWithMetadata:self->_inputMetadata];
    -[VCProcessor _getEquivalentOutputCameraFocalLength:rotation:forViewport:](self, "_getEquivalentOutputCameraFocalLength:rotation:forViewport:", &v8, &v6);
    [(VCCamera *)self->_outputCamera setFocalLength:v8];
    [(VCCamera *)self->_outputCamera setRotation:v6];
    [(VCProcessor *)self _getBaseZoomFactor:self->_outputCamera];
    self->_float videoZoomFactor = v4;
  }
  return v3;
}

- (int)_updateOutputCameraAnimation
{
  if (self->_framingModeJustChanged)
  {
    [(VCCameraAnimator *)self->_outputCameraAnimator configureWithPreset:2];
    self->_framingModeJustChanged = 0;
  }
  int v3 = [(VCCameraAnimator *)self->_outputCameraAnimator animatedCamera];

  outputCameraAnimator = self->_outputCameraAnimator;
  inputMetadata = self->_inputMetadata;
  if (v3)
  {
    if (inputMetadata)
    {
      [(CinematicFramingSessionInputMetadata *)inputMetadata timestamp];
    }
    else
    {
      uint64_t v13 = 0;
      uint64_t v14 = 0;
      uint64_t v15 = 0;
    }
    [(VCCameraAnimator *)outputCameraAnimator updateToTime:&v13];
  }
  else
  {
    if (inputMetadata)
    {
      [(CinematicFramingSessionInputMetadata *)inputMetadata timestamp];
    }
    else
    {
      uint64_t v16 = 0;
      uint64_t v17 = 0;
      uint64_t v18 = 0;
    }
    [(VCCameraAnimator *)outputCameraAnimator startAtTime:&v16 withCamera:self->_outputCamera];
  }
  if (self->_autoFramingEnabled && ![(VCCameraAnimator *)self->_outputCameraAnimator animating]) {
    [(VCCameraAnimator *)self->_outputCameraAnimator configureWithPreset:1];
  }
  double v6 = [(VCCameraAnimator *)self->_outputCameraAnimator animatedCamera];
  outputCamera = self->_outputCamera;
  self->_outputCamera = v6;

  [(VCProcessor *)self _updateOutputCameraFisheyeEffect];
  if (!self->_rollCorrectionEnabled
    || (int v8 = [(VCProcessor *)self _updateOutputCameraForRollCorrection]) == 0)
  {
    if (!self->_confineOutputCamera)
    {
      int v9 = 0;
      goto LABEL_21;
    }
    int v8 = [(VCProcessor *)self _confineOutputCameraToInputCameraFrustum:0];
  }
  int v9 = v8;
LABEL_21:
  float32x2_t v10 = [(VCCameraAnimator *)self->_outputCameraAnimator targetCamera];
  float v11 = self->_outputCamera;
  self->_outputCamera = v10;

  return v9;
}

- (void)_updateOutputCameraFisheyeEffect
{
  BOOL fisheyeEffectEnabled = self->_fisheyeEffectEnabled;
  outputCamera = self->_outputCamera;
  if (fisheyeEffectEnabled)
  {
    [(VCCamera *)outputCamera zoomFOV];
    *(float *)&double v5 = fminf(fmaxf((float)(*(float *)&v5 + -1.309) / 0.5236, 0.0), 1.0);
    *(float *)&double v5 = (float)((float)(*(float *)&v5 * *(float *)&v5) * (float)((float)(*(float *)&v5 * -2.0) + 3.0))
                  * 0.85;
    outputCamera = self->_outputCamera;
  }
  else
  {
    double v5 = 0.0;
  }

  [(VCCamera *)outputCamera setStereographicFisheyeStrength:v5];
}

+ (CGPoint)warpCGPoint:(CGPoint)a3 fromCamera:(id)a4 toCamera:(id)a5
{
  double y = a3.y;
  double x = a3.x;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [v8 model];
  uint64_t v11 = [v9 model];
  v12.f32[0] = x;
  float32_t v13 = y;
  v12.f32[1] = v13;
  float64x2_t v16 = vcvtq_f64_f32(warpPoint(v10, v11, v12));

  double v15 = v16.f64[1];
  double v14 = v16.f64[0];
  result.double y = v15;
  result.double x = v14;
  return result;
}

+ (CGRect)warpCGRect:(CGRect)a3 fromCamera:(id)a4 toCamera:(id)a5
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v30[4] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  v31.origin.CGFloat x = x;
  v31.origin.CGFloat y = y;
  v31.size.CGFloat width = width;
  v31.size.CGFloat height = height;
  double MinX = CGRectGetMinX(v31);
  v32.origin.CGFloat x = x;
  v32.origin.CGFloat y = y;
  v32.size.CGFloat width = width;
  v32.size.CGFloat height = height;
  double MaxX = CGRectGetMaxX(v32);
  v33.origin.CGFloat x = x;
  v33.origin.CGFloat y = y;
  v33.size.CGFloat width = width;
  v33.size.CGFloat height = height;
  double MinY = CGRectGetMinY(v33);
  v34.origin.CGFloat x = x;
  v34.origin.CGFloat y = y;
  v34.size.CGFloat width = width;
  v34.size.CGFloat height = height;
  CGFloat MaxY = CGRectGetMaxY(v34);
  uint64_t v16 = 0;
  *(float *)&uint64_t v17 = MinX;
  *(float *)&uint64_t v18 = MaxX;
  *(float *)&unsigned int v19 = MinY;
  *(float *)&CGFloat MaxY = MaxY;
  HIDWORD(v18) = LODWORD(MaxY);
  v30[0] = __PAIR64__(v19, v17);
  v30[1] = __PAIR64__(v19, v18);
  HIDWORD(v17) = LODWORD(MaxY);
  v30[2] = v18;
  v30[3] = v17;
  do
  {
    v30[v16] = warpPoint([v10 model], objc_msgSend(v11, "model"), (float32x2_t)v30[v16]);
    ++v16;
  }
  while (v16 != 4);
  uint64_t v20 = 0;
  float v21 = -2.0;
  float v22 = 2.0;
  float v23 = -2.0;
  float v24 = 2.0;
  do
  {
    uint64_t v25 = v30[v20];
    float v22 = fminf(v22, *(float *)&v25);
    float v21 = fmaxf(v21, *(float *)&v25);
    float v24 = fminf(v24, *((float *)&v25 + 1));
    float v23 = fmaxf(v23, *((float *)&v25 + 1));
    ++v20;
  }
  while (v20 != 4);

  double v26 = v22;
  double v27 = v24;
  double v28 = (float)(v21 - v22);
  double v29 = (float)(v23 - v24);
  result.size.CGFloat height = v29;
  result.size.CGFloat width = v28;
  result.origin.CGFloat y = v27;
  result.origin.CGFloat x = v26;
  return result;
}

- (CGPoint)warpCGPoint:(CGPoint)result
{
  if (self->_centerStagePassthrough && self->_autoFramingEnabled)
  {
    -[CinematicFramingSession warpBoundingBoxInFrameCoordinatesToDisplayCoordinates:](self->_framingSession, "warpBoundingBoxInFrameCoordinatesToDisplayCoordinates:", result.x, result.y, 0.0, 0.0);
  }
  else if (self->_inputCamera)
  {
    if (self->_outputCamera)
    {
      +[VCProcessor warpCGPoint:fromCamera:toCamera:](VCProcessor, "warpCGPoint:fromCamera:toCamera:", result.x, result.y);
      result.CGFloat x = self->_outputROI.origin.x + self->_outputROI.size.width * v4;
      result.CGFloat y = self->_outputROI.origin.y + self->_outputROI.size.height * v5;
    }
  }
  return result;
}

- (CGRect)warpCGRect:(CGRect)result
{
  if (self->_centerStagePassthrough && self->_autoFramingEnabled)
  {
    -[CinematicFramingSession warpBoundingBoxInFrameCoordinatesToDisplayCoordinates:](self->_framingSession, "warpBoundingBoxInFrameCoordinatesToDisplayCoordinates:", result.origin.x, result.origin.y, result.size.width, result.size.height);
  }
  else if (self->_inputCamera)
  {
    if (self->_outputCamera)
    {
      +[VCProcessor warpCGRect:fromCamera:toCamera:](VCProcessor, "warpCGRect:fromCamera:toCamera:", result.origin.x, result.origin.y, result.size.width, result.size.height);
      double width = self->_outputROI.size.width;
      double height = self->_outputROI.size.height;
      result.origin.CGFloat x = self->_outputROI.origin.x + width * v6;
      result.origin.CGFloat y = self->_outputROI.origin.y + height * v7;
      result.size.double width = width * v8;
      result.size.double height = v9 * height;
    }
  }
  return result;
}

- (float)_getBaseZoomFactor:(id)a3
{
  id v4 = a3;
  double v5 = [v4 portType];
  float v6 = 1.0;
  if (v5)
  {
    cameraInfoByPortType = self->_cameraInfoByPortType;

    if (cameraInfoByPortType)
    {
      double v8 = self->_cameraInfoByPortType;
      double v9 = [v4 portType];
      id v10 = [(NSDictionary *)v8 objectForKeyedSubscript:v9];

      if (v10)
      {
        id v11 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F52C78]];
        float32x2_t v12 = v11;
        if (v11)
        {
          [v11 floatValue];
          float v6 = v13;
        }
      }
    }
  }

  return v6;
}

- (void)_updateVideoZoomFactorFromInputCamera:(id)a3 toOutputCamera:(id)a4
{
  id v19 = a3;
  id v6 = a4;
  [v6 focalLength];
  float32x2_t v8 = v7;
  [v6 sensorSize];
  float32x2_t v10 = v9;
  [v19 focalLength];
  float32x2_t v12 = v11;
  [v19 sensorSize];
  float32x2_t v14 = v13;
  [(VCProcessor *)self _getBaseZoomFactor:v19];
  float32x2_t v15 = vdiv_f32(v8, v10);
  float32x2_t v16 = vdiv_f32(v12, v14);
  float v18 = (float)(fminf(v15.f32[0], v15.f32[1]) * v17) / fminf(v16.f32[0], v16.f32[1]);
  if (v18 < 1.0) {
    float v18 = 1.0;
  }
  self->_float videoZoomFactor = v18;
}

- (void)_getEquivalentOutputCameraFocalLength:(VCProcessor *)self rotation:(SEL)a2 forViewport:
{
  CGFloat v8 = v7;
  CGFloat v9 = v6;
  CGFloat v10 = v5;
  CGFloat v11 = v4;
  float32x2_t v12 = v3;
  float32x2_t v13 = v2;
  if (!self->_orientationCorrectionEnabled)
  {
    float32x2_t v15 = [(VCCamera *)self->_inputCamera portType];
    int v16 = isCinematicFramingFrontCamera(v15);

    int v17 = computeNumberOfCCWRotationsFromInputToFramingSpaceForCameraOrientation([(CinematicFramingSessionInputMetadata *)self->_inputMetadata cameraOrientation], v16, [(CinematicFramingSessionInputMetadata *)self->_inputMetadata frontCameraHas180DegreesRotation]);
    CGFloat v11 = rotateRectCCW(4 - v17, v11, v10, v9, v8);
    CGFloat v10 = v18;
    CGFloat v9 = v19;
    CGFloat v8 = v20;
  }
  v32.origin.CGFloat x = v11;
  v32.origin.CGFloat y = v10;
  v32.size.double width = v9;
  v32.size.double height = v8;
  float MidY = CGRectGetMidY(v32);
  *(float *)&unsigned int v31 = -MidY;
  v33.origin.CGFloat x = v11;
  v33.origin.CGFloat y = v10;
  v33.size.double width = v9;
  v33.size.double height = v8;
  float MidX = CGRectGetMidX(v33);
  float v30 = MidX;
  v34.origin.CGFloat x = v11;
  v34.origin.CGFloat y = v10;
  v34.size.double width = v9;
  v34.size.double height = v8;
  float Width = CGRectGetWidth(v34);
  v35.origin.CGFloat x = v11;
  v35.origin.CGFloat y = v10;
  v35.size.double width = v9;
  v35.size.double height = v8;
  float Height = CGRectGetHeight(v35);
  [(VCCamera *)self->_outputCamera sensorSize];
  unsigned int v29 = v25;
  [(VCCamera *)self->_outputCamera sensorSize];
  unsigned int v28 = v26;
  float v27 = tanf(Width * 0.5);
  float32x2_t *v13 = vdiv_f32(vmul_f32((float32x2_t)__PAIR64__(v28, v29), (float32x2_t)0x3F0000003F000000), (float32x2_t)__PAIR64__(COERCE_UNSIGNED_INT(tanf(Height * 0.5)), LODWORD(v27)));
  _OWORD *v12 = __PAIR64__(LODWORD(v30), v31);
}

- (__n128)_getGravityVectorForCamera:(void *)a3 fromMetadata:(void *)a4
{
  id v5 = a3;
  id v6 = a4;
  char v7 = [v6 hasGravity];
  float32x4_t v8 = 0uLL;
  if (v7)
  {
    objc_msgSend(v6, "gravityX", 0.0);
    v28.i64[0] = v9;
    [v6 gravityY];
    __int32 v27 = v10;
    [v6 gravityZ];
    __int32 v26 = v11;
    if ([v6 hasDeviceToCameraSpaceTransform])
    {
      [v6 deviceToCameraSpaceTransform];
    }
    else
    {
      float32x2_t v15 = [v5 portType];
      int v16 = isCinematicFramingFrontCamera(v15);

      int v17 = (float32x4_t *)&_PromotedConst;
      double v18 = (float32x4_t *)&unk_1DD5AD060;
      double v19 = (float32x4_t *)&unk_1DD5AD070;
      if (!v16) {
        double v19 = (float32x4_t *)&unk_1DD5AD0A0;
      }
      float32x4_t v14 = *v19;
      if (!v16) {
        double v18 = (float32x4_t *)&unk_1DD5AD090;
      }
      float32x4_t v13 = *v18;
      if (!v16) {
        int v17 = (float32x4_t *)&_PromotedConst_336;
      }
      float32x4_t v12 = *v17;
    }
    float32x4_t v20 = v28;
    v20.i32[1] = v27;
    v20.i32[2] = v26;
    int32x4_t v21 = (int32x4_t)vmulq_f32(v20, v20);
    v21.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v21, 2), vadd_f32(*(float32x2_t *)v21.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v21.i8, 1))).u32[0];
    float32x2_t v22 = vrsqrte_f32((float32x2_t)v21.u32[0]);
    float32x2_t v23 = vmul_f32(v22, vrsqrts_f32((float32x2_t)v21.u32[0], vmul_f32(v22, v22)));
    float32x4_t v24 = vmulq_n_f32(v20, vmul_f32(v23, vrsqrts_f32((float32x2_t)v21.u32[0], vmul_f32(v23, v23))).f32[0]);
    float32x4_t v8 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v12, v24.f32[0]), v13, *(float32x2_t *)v24.f32, 1), v14, v24, 2);
  }
  float32x4_t v29 = v8;

  return (__n128)v29;
}

- (int)_updateCamera:(id)a3 withMetadata:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  float32x4_t v8 = [v7 portType];
  [v6 setPortType:v8];

  objc_msgSend(v6, "setSensorID:", objc_msgSend(v7, "sensorID"));
  uint64_t v9 = [v7 calibrationDataDictionary];
  if (!v9 || (int v10 = [v6 updateWithCalibration:v9]) == 0)
  {
    if (self->_orientationCorrectionEnabled)
    {
      if ([v7 hasGravity])
      {
        [(VCProcessor *)self _getGravityVectorForCamera:v6 fromMetadata:v7];
        float32x4_t v12 = v11;
        float32x4_t v20 = v11;
        v11.i32[2] = 0;
        float32x4_t v13 = vmulq_f32(v11, v11);
        v13.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32((int32x4_t)v13, 2), vadd_f32(*(float32x2_t *)v13.f32, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v13.f32, 1))).u32[0];
        float32x2_t v14 = vrsqrte_f32((float32x2_t)v13.u32[0]);
        float32x2_t v15 = vmul_f32(v14, vrsqrts_f32((float32x2_t)v13.u32[0], vmul_f32(v14, v14)));
        *(int32x2_t *)v13.f32 = vdup_lane_s32((int32x2_t)vmul_f32(v15, vrsqrts_f32((float32x2_t)v13.u32[0], vmul_f32(v15, v15))), 0);
        v13.i64[0] = vmulq_f32(v12, v13).u64[0];
        atan2f(v13.f32[0], v13.f32[1]);
        atan2f(fabsf(v20.f32[2]), sqrtf(vaddv_f32((float32x2_t)*(_OWORD *)&vmulq_f32(v20, v20))));
      }
      else
      {
        int v16 = [v6 portType];
        int v17 = isCinematicFramingFrontCamera(v16);

        zRotationForOrientation([v7 cameraOrientation], v17);
      }
    }
    [(CinematicFramingSessionInputMetadata *)self->_inputMetadata additionalInputCameraRotation];
    [v6 rotation];
    [v6 setRotation:v18];
    int v10 = 0;
  }

  return v10;
}

- (int)_updateOutputCameraForRollCorrection
{
  [(VCCamera *)self->_outputCamera rotation];
  unsigned int v42 = v3;
  [(VCCamera *)self->_outputCamera rotation];
  double v43 = COERCE_DOUBLE(__PAIR64__(v4, v42));
  [(VCCamera *)self->_outputCamera setRotation:v43];
  if ([(CinematicFramingSessionInputMetadata *)self->_inputMetadata hasGravity])
  {
    [(VCProcessor *)self _getGravityVectorForCamera:self->_inputCamera fromMetadata:self->_inputMetadata];
  }
  else
  {
    id v6 = [(VCCamera *)self->_inputCamera portType];
    int v7 = isCinematicFramingFrontCamera(v6);

    double v8 = zRotationForOrientation([(CinematicFramingSessionInputMetadata *)self->_inputMetadata cameraOrientation], v7);
    double v9 = *(float *)&v8;
    [(CinematicFramingSessionInputMetadata *)self->_inputMetadata additionalInputCameraRotation];
    float v11 = v10 * 3.14159265 / 180.0 + v9;
    __float2 v12 = __sincosf_stret(v11 * -0.5);
    float32x4_t v13 = vmulq_n_f32((float32x4_t)xmmword_1DD5ACF90, v12.__sinval);
    float32x4_t v14 = v13;
    v14.i32[3] = LODWORD(v12.__cosval);
    float32x4_t v15 = vmulq_f32(v14, (float32x4_t)xmmword_1DD5AD000);
    int32x4_t v16 = (int32x4_t)vnegq_f32(v15);
    int8x16_t v17 = (int8x16_t)vtrn2q_s32((int32x4_t)v15, vtrn1q_s32((int32x4_t)v15, v16));
    float32x4_t v18 = vmlaq_f32((float32x4_t)vextq_s8((int8x16_t)v15, (int8x16_t)v16, 8uLL), (float32x4_t)0, (float32x4_t)vextq_s8(v17, v17, 8uLL));
    float32x4_t v19 = (float32x4_t)vrev64q_s32((int32x4_t)v15);
    v19.i32[0] = v16.i32[1];
    v19.i32[3] = v16.i32[2];
    float32x4_t v20 = vmlaq_f32(v18, (float32x4_t)0, v19);
    int32x4_t v21 = (int32x4_t)vnegq_f32(v20);
    int8x16_t v22 = (int8x16_t)vtrn2q_s32((int32x4_t)v20, vtrn1q_s32((int32x4_t)v20, v21));
    float32x4_t v23 = (float32x4_t)vrev64q_s32((int32x4_t)v20);
    v23.i32[0] = v21.i32[1];
    v23.i32[3] = v21.i32[2];
    float32x4_t v5 = vaddq_f32(vmlaq_laneq_f32(vmulq_laneq_f32(v20, v14, 3), v23, v13, 2), vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v20, (int8x16_t)v21, 8uLL), *(float32x2_t *)v13.f32, 1), (float32x4_t)vextq_s8(v22, v22, 8uLL), v13.f32[0]));
  }
  float32x4_t v41 = v5;
  [(VCCamera *)self->_outputCamera rotationMatrix];
  float32x4_t v38 = v25;
  float32x4_t v39 = v24;
  float32x4_t v37 = v26;
  [(VCCamera *)self->_inputCamera rotationMatrix];
  simd_float3x3 v47 = __invert_f3(v46);
  uint64_t v27 = 0;
  simd_float3x3 v44 = v47;
  do
  {
    v45[v27] = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v39, COERCE_FLOAT(*(_OWORD *)&v44.columns[v27])), v38, *(float32x2_t *)v44.columns[v27].f32, 1), v37, (float32x4_t)v44.columns[v27], 2);
    ++v27;
  }
  while (v27 != 3);
  float32x4_t v28 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v45[0], v41.f32[0]), v45[1], *(float32x2_t *)v41.f32, 1), v45[2], v41, 2);
  float32x2_t v29 = (float32x2_t)COERCE_UNSIGNED_INT(vaddv_f32((float32x2_t)*(_OWORD *)&vmulq_f32(v28, v28)));
  float32x2_t v30 = vrsqrte_f32(v29);
  float32x2_t v31 = vmul_f32(v30, vrsqrts_f32((float32x2_t)v29.u32[0], vmul_f32(v30, v30)));
  float32x2_t v32 = vmul_n_f32(*(float32x2_t *)v28.f32, vmul_f32(v31, vrsqrts_f32((float32x2_t)v29.u32[0], vmul_f32(v31, v31))).f32[0]);
  *(float32x2_t *)v28.f32 = vmul_f32(*(float32x2_t *)v41.f32, *(float32x2_t *)v41.f32);
  v28.i32[0] = vadd_f32(*(float32x2_t *)v28.f32, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v28.f32, 1)).u32[0];
  float32x2_t v33 = vrsqrte_f32((float32x2_t)v28.u32[0]);
  float32x2_t v34 = vmul_f32(v33, vrsqrts_f32((float32x2_t)v28.u32[0], vmul_f32(v33, v33)));
  double v35 = COERCE_DOUBLE(vmul_n_f32(*(float32x2_t *)v41.f32, vmul_f32(v34, vrsqrts_f32((float32x2_t)v28.u32[0], vmul_f32(v34, v34))).f32[0]));
  if (self->_orientationCorrectionEnabled) {
    double v35 = 0.0078125;
  }
  double v40 = v35;
  atan2f(v32.f32[1], v32.f32[0]);
  atan2f(*((float *)&v40 + 1), *(float *)&v40);
  atan2f(fabsf(v41.f32[2]), sqrtf(vaddv_f32((float32x2_t)*(_OWORD *)&vmulq_f32(v41, v41))));
  [(CinematicFramingSessionInputMetadata *)self->_inputMetadata additionalOutputCameraRotation];
  [(VCCamera *)self->_outputCamera setRotation:v43];
  return 0;
}

- (int)_confineOutputCameraToInputCameraFrustum:(BOOL)a3
{
  if (a3)
  {
    LODWORD(v3) = 1.0;
    [(VCCamera *)self->_outputCamera setZoomFactor:v3];
  }
  [(VCCamera *)self->_outputCamera zoomFactor];
  int v6 = v5;
  [(VCCamera *)self->_outputCamera rotation];
  long long v29 = v7;
  if ((isViewFrustumContained(self->_outputCamera, self->_inputCamera, 0.0) & 1) == 0)
  {
    LODWORD(v8) = 10.0;
    [(VCCamera *)self->_outputCamera setZoomFactor:v8];
    [(VCCamera *)self->_inputCamera rotation];
    [(VCCamera *)self->_outputCamera setRotation:v9];
    if (self->_rollCorrectionEnabled) {
      [(VCProcessor *)self _updateOutputCameraForRollCorrection];
    }
    char v10 = isViewFrustumContained(self->_outputCamera, self->_inputCamera, 0.0);
    LODWORD(v11) = v6;
    [(VCCamera *)self->_outputCamera setZoomFactor:v11];
    outputCamera = self->_outputCamera;
    if ((v10 & 1) == 0)
    {
      [(VCCamera *)outputCamera setRotation:*(double *)&v29];
      return -1;
    }
    if ((isViewFrustumContained(outputCamera, self->_inputCamera, 0.0) & 1) == 0)
    {
      [(VCCamera *)self->_outputCamera zoomFactor];
      float v14 = *(float *)&v13;
      float v15 = 10.0;
      if (fabsf(*(float *)&v13 + -10.0) > 0.001)
      {
        int v16 = 22;
        do
        {
          if (!--v16) {
            break;
          }
          *(float *)&double v13 = (float)(v14 + v15) * 0.5;
          [(VCCamera *)self->_outputCamera setZoomFactor:v13];
          if (self->_fisheyeEffectEnabled) {
            [(VCProcessor *)self _updateOutputCameraFisheyeEffect];
          }
          if (isViewFrustumContained(self->_outputCamera, self->_inputCamera, 0.0)) {
            float v15 = (float)(v14 + v15) * 0.5;
          }
          else {
            float v14 = (float)(v14 + v15) * 0.5;
          }
        }
        while (vabds_f32(v14, v15) > 0.001);
      }
      *(float *)&double v13 = v15;
      [(VCCamera *)self->_outputCamera setZoomFactor:v13];
    }
    [(VCCamera *)self->_outputCamera setRotation:*(double *)&v29];
    if ((isViewFrustumContained(self->_outputCamera, self->_inputCamera, 0.0) & 1) == 0)
    {
      [(VCCamera *)self->_outputCamera rotation];
      float32x4_t v31 = v17;
      [(VCCamera *)self->_inputCamera rotation];
      float32x4_t v18 = v31;
      v19.i32[2] = DWORD2(v29);
      for (int i = 21; ; --i)
      {
        float32x4_t v21 = vsubq_f32(v18, v19);
        float32x4_t v22 = vmulq_f32(v21, v21);
        if (sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v22, 2), vaddq_f32(v22, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v22.f32, 1))).f32[0]) <= 0.001|| i == 0)
        {
          break;
        }
        int8x16_t v30 = (int8x16_t)v19;
        int8x16_t v32 = (int8x16_t)v18;
        v24.i64[0] = 0x3F0000003F000000;
        v24.i64[1] = 0x3F0000003F000000;
        int8x16_t v28 = (int8x16_t)vmulq_f32(vaddq_f32(v18, v19), v24);
        -[VCCamera setRotation:](self->_outputCamera, "setRotation:");
        if (self->_rollCorrectionEnabled) {
          [(VCProcessor *)self _updateOutputCameraForRollCorrection];
        }
        if (isViewFrustumContained(self->_outputCamera, self->_inputCamera, 0.0)) {
          unsigned int v25 = -1;
        }
        else {
          unsigned int v25 = 0;
        }
        int8x16_t v26 = (int8x16_t)vdupq_n_s32(v25);
        float32x4_t v18 = (float32x4_t)vbslq_s8(v26, v32, v28);
        float32x4_t v19 = (float32x4_t)vbslq_s8(v26, v28, v30);
      }
      -[VCCamera setRotation:](self->_outputCamera, "setRotation:");
      if (self->_rollCorrectionEnabled) {
        [(VCProcessor *)self _updateOutputCameraForRollCorrection];
      }
    }
  }
  return 0;
}

- (unint64_t)_metalTextureFormatFromPixelBufferFormat:(unsigned int)a3 forPlane:(unsigned int)a4
{
  if ((int)a3 > 875704421)
  {
    if ((int)a3 <= 1885745711)
    {
      if ((int)a3 <= 1278226535)
      {
        if (a3 != 875704422 && a3 != 875704438)
        {
          if (a3 == 1278226534) {
            return 55;
          }
          return 0;
        }
        goto LABEL_36;
      }
      if (a3 == 1278226536) {
        return 25;
      }
      if (a3 == 1751527984)
      {
        BOOL v7 = a4 == 0;
        unint64_t v8 = 65;
        unint64_t v9 = 25;
LABEL_37:
        if (v7) {
          return v9;
        }
        else {
          return v8;
        }
      }
      int v5 = 1882468912;
      goto LABEL_42;
    }
    if ((int)a3 <= 2084070959)
    {
      if (a3 != 1885745712)
      {
        if (a3 != 2016686640 && a3 != 2019963440) {
          return 0;
        }
        BOOL v7 = a4 == 0;
        unint64_t v8 = 60;
        unint64_t v9 = 20;
        goto LABEL_37;
      }
    }
    else
    {
      if ((int)a3 <= 2088265263)
      {
        if (a3 != 2084070960)
        {
          int v4 = 2084075056;
          goto LABEL_28;
        }
LABEL_36:
        BOOL v7 = a4 == 0;
        unint64_t v8 = 30;
        unint64_t v9 = 10;
        goto LABEL_37;
      }
      if (a3 != 2088265264)
      {
        int v5 = 2088269360;
LABEL_42:
        if (a3 != v5) {
          return 0;
        }
        goto LABEL_43;
      }
    }
    goto LABEL_43;
  }
  if ((int)a3 <= 762865199)
  {
    if ((int)a3 <= 645428783)
    {
      if (a3 == 641230384 || a3 == 641234480) {
        goto LABEL_36;
      }
      int v5 = 645424688;
      goto LABEL_42;
    }
    if (a3 == 645428784) {
      goto LABEL_43;
    }
    if (a3 == 758670896) {
      goto LABEL_36;
    }
    int v4 = 758674992;
LABEL_28:
    if (a3 != v4) {
      return 0;
    }
    goto LABEL_36;
  }
  if ((int)a3 <= 792229423)
  {
    if (a3 == 762865200 || a3 == 762869296) {
      goto LABEL_43;
    }
    int v4 = 792225328;
    goto LABEL_28;
  }
  if (a3 == 792229424) {
    goto LABEL_36;
  }
  if (a3 != 796419632)
  {
    int v5 = 796423728;
    goto LABEL_42;
  }
LABEL_43:
  if (a4) {
    return 589;
  }
  else {
    return 588;
  }
}

- (id)_cachedTexturesFromPixelBuffer:(__CVBuffer *)a3 usage:(unint64_t)a4
{
  id v4 = 0;
  v31[1] = *MEMORY[0x1E4F143B8];
  CVMetalTextureRef image = 0;
  if (a3)
  {
    int v5 = self;
    uint64_t v27 = 0;
    CFDictionaryRef v6 = 0;
    if (self->_cvMetalTextureCacheRef)
    {
      uint64_t v7 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:2];
      if (v7)
      {
        uint64_t PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
        uint64_t v27 = (void *)v7;
        size_t v9 = 0;
        CFDictionaryRef v6 = 0;
        int v23 = (PixelFormatType - 1278226534) & 0xFFFFFFFD;
        CFAllocatorRef allocator = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
        uint64_t v25 = *MEMORY[0x1E4F24C88];
        char v10 = 1;
        while (1)
        {
          double v11 = v5;
          uint64_t v12 = PixelFormatType;
          MTLPixelFormat v13 = [(VCProcessor *)v5 _metalTextureFormatFromPixelBufferFormat:PixelFormatType forPlane:v9];
          if (v13 == MTLPixelFormatInvalid) {
            break;
          }
          unsigned int WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, v9);
          unsigned int HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, v9);
          uint64_t v30 = v25;
          int v16 = [NSNumber numberWithUnsignedInteger:a4];
          v31[0] = v16;
          CFDictionaryRef v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:&v30 count:1];

          CFDictionaryRef v6 = v17;
          if (CVMetalTextureCacheCreateTextureFromImage(allocator, v11->_cvMetalTextureCacheRef, a3, v17, v13, WidthOfPlane, HeightOfPlane, v9, &image))
          {
            break;
          }
          float32x4_t v18 = CVMetalTextureGetTexture(image);
          [v27 setObject:v18 atIndexedSubscript:v9];

          float32x4_t v19 = [v27 objectAtIndexedSubscript:v9];
          BOOL v20 = v19 == 0;

          if (v20) {
            break;
          }
          if (image) {
            CFRelease(image);
          }
          char v21 = (v23 != 0) & v10;
          size_t v9 = 1;
          char v10 = 0;
          uint64_t PixelFormatType = v12;
          int v5 = v11;
          if ((v21 & 1) == 0)
          {
            id v4 = v27;
            uint64_t v27 = v4;
            goto LABEL_12;
          }
        }
        if (image) {
          CFRelease(image);
        }
        id v4 = 0;
      }
      else
      {
        id v4 = 0;
        uint64_t v27 = 0;
        CFDictionaryRef v6 = 0;
      }
    }
  }
  else
  {
    uint64_t v27 = 0;
    CFDictionaryRef v6 = 0;
  }
LABEL_12:

  return v4;
}

- (id)_bindCVPixleBuffer:(__CVBuffer *)a3 usage:(unint64_t)a4
{
  uint64_t v7 = -[VCProcessor _cachedTexturesFromPixelBuffer:usage:](self, "_cachedTexturesFromPixelBuffer:usage:");
  unint64_t v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    uint64_t PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
    size_t PlaneCount = CVPixelBufferGetPlaneCount(a3);
    id v9 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:PlaneCount];
    if (PlaneCount)
    {
      uint64_t v12 = 0;
      while (1)
      {
        MTLPixelFormat v13 = [(FigMetalContext *)self->_context bindPixelBufferToMTL2DTexture:a3 pixelFormat:[(VCProcessor *)self _metalTextureFormatFromPixelBufferFormat:PixelFormatType forPlane:v12] usage:a4 plane:v12];
        if (!v13) {
          break;
        }
        [v9 addObject:v13];

        if (PlaneCount == ++v12) {
          goto LABEL_7;
        }
      }
    }
    else
    {
LABEL_7:
      if ([v9 count] != PlaneCount)
      {

        id v9 = 0;
      }
    }
  }

  return v9;
}

- (int)_fillRenderParams:(id *)a3
{
  int v5 = [(VCCameraAnimator *)self->_outputCameraAnimator animatedCamera];
  outputCamera = v5;
  if (!v5) {
    outputCamera = self->_outputCamera;
  }
  uint64_t v7 = outputCamera;

  memcpy(a3, [(VCCamera *)self->_inputCamera model], 0x160uLL);
  memcpy(&a3[2].var0.var7.var1, [(VCCamera *)v7 model], 0x160uLL);
  CGSize v8 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
  v30.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
  v30.size = v8;
  CFDictionaryRef v9 = (const __CFDictionary *)CVBufferCopyAttachment(self->_inputPixelBuffer, (CFStringRef)*MEMORY[0x1E4F54370], 0);
  CFDictionaryRef v10 = v9;
  if (v9)
  {
    CGRectMakeWithDictionaryRepresentation(v9, &v30);
    CFRelease(v10);
  }
  *(void *)&a3[4].var0.var7.var5 = 0;
  __asm { FMOV            V0.2S, #1.0 }
  *(void *)&a3[4].var0.var7.var7 = _D0;
  if (!CGRectIsNull(v30))
  {
    size_t Width = CVPixelBufferGetWidth(self->_inputPixelBuffer);
    size_t Height = CVPixelBufferGetHeight(self->_inputPixelBuffer);
    v18.i64[0] = Width;
    v18.i64[1] = Height;
    float64x2_t v19 = vcvtq_f64_f32(vcvt_f32_f64(vcvtq_f64_u64(v18)));
    float32x2_t v20 = vcvt_f32_f64(vdivq_f64((float64x2_t)v30.origin, v19));
    *(float32x2_t *)&v19.f64[0] = vcvt_f32_f64(vdivq_f64((float64x2_t)v30.size, v19));
    *(float32x2_t *)&a3[4].var0.var7.var5 = v20;
    *(float64_t *)&a3[4].var0.var7.var7 = v19.f64[0];
  }
  $470D365275581EF16070F5A11344F73E outputDimensions = self->_outputDimensions;
  v22.i64[0] = outputDimensions.width;
  v22.i64[1] = outputDimensions.height;
  float64x2_t v23 = vcvtq_f64_s64(v22);
  float64x2_t v24 = vmulq_f64((float64x2_t)self->_outputROI.origin, v23);
  __asm { FMOV            V3.2D, #10.0 }
  float64x2_t v26 = vaddq_f64(vaddq_f64(v24, vmulq_f64((float64x2_t)self->_outputROI.size, v23)), _Q3);
  __asm { FMOV            V3.2D, #-10.0 }
  float64x2_t v28 = vmaxnmq_f64(vaddq_f64(v24, _Q3), (float64x2_t)0);
  *(float32x2_t *)&a3[4].var0.var9.var0 = vcvt_f32_f64(vdivq_f64(v28, v23));
  *(float32x2_t *)&a3[4].var0.var9.var2 = vcvt_f32_f64(vdivq_f64(vsubq_f64((float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v23, v26), (int8x16_t)v26, (int8x16_t)v23), v28), v23));

  return 0;
}

- (int)_encodeRender:(id)a3 inputLumaTex:(id)a4 inputChromaTex:(id)a5 outputLumaTex:(id)a6 outputChromaTex:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  int v17 = [(VCProcessor *)self _fillRenderParams:v23];
  if (!v17)
  {
    uint64x2_t v18 = [(VCShaders *)self->_shaders objectAtIndexedSubscript:0];
    [v12 setComputePipelineState:v18];

    [v12 setTexture:v13 atIndex:0];
    [v12 setTexture:v14 atIndex:1];
    [v12 setTexture:v15 atIndex:2];
    [v12 setTexture:v16 atIndex:3];
    [v12 setBytes:v23 length:736 atIndex:0];
    [v12 setImageblockWidth:32 height:32];
    v22[0] = [v15 width];
    v22[1] = [v15 height];
    v22[2] = 1;
    int64x2_t v20 = vdupq_n_s64(0x20uLL);
    uint64_t v21 = 1;
    [v12 dispatchThreads:v22 threadsPerThreadgroup:&v20];
  }

  return v17;
}

- (int)_encodeDownsample:(id)a3 inputLumaTex:(id)a4 inputChromaTex:(id)a5 outputLumaTex:(id)a6 outputChromaTex:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  int v17 = [(VCShaders *)self->_shaders objectAtIndexedSubscript:1];
  [v12 setComputePipelineState:v17];

  [v12 setTexture:v13 atIndex:0];
  [v12 setTexture:v14 atIndex:1];
  [v12 setTexture:v15 atIndex:2];
  [v12 setTexture:v16 atIndex:3];
  [v12 setImageblockWidth:32 height:32];
  v21[0] = [v15 width];
  v21[1] = [v15 height];
  v21[2] = 1;
  int64x2_t v19 = vdupq_n_s64(0x20uLL);
  uint64_t v20 = 1;
  [v12 dispatchThreads:v21 threadsPerThreadgroup:&v19];

  return 0;
}

- (int)_createRenderTargetForOutputLumaTex:(id)a3 outputChromaTex:(id)a4 renderTargetLumaTex:(id *)a5 renderTargetChromaTex:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  size_t Width = CVPixelBufferGetWidth(self->_inputPixelBuffer);
  size_t Height = CVPixelBufferGetHeight(self->_inputPixelBuffer);
  inputPixelBuffer = self->_inputPixelBuffer;
  if (Width >= Height) {
    size_t v15 = CVPixelBufferGetHeight(inputPixelBuffer);
  }
  else {
    size_t v15 = CVPixelBufferGetWidth(inputPixelBuffer);
  }
  unint64_t v16 = v15;
  size_t v17 = CVPixelBufferGetWidth(self->_outputPixelBuffer);
  size_t v18 = CVPixelBufferGetHeight(self->_outputPixelBuffer);
  outputPixelBuffer = self->_outputPixelBuffer;
  if (v17 >= v18) {
    size_t v20 = CVPixelBufferGetHeight(outputPixelBuffer);
  }
  else {
    size_t v20 = CVPixelBufferGetWidth(outputPixelBuffer);
  }
  int v21 = llroundf(log2f((float)v16 / (float)v20));
  if (v21 <= 1) {
    int v21 = 1;
  }
  if (v21 <= 5) {
    int v22 = v21 - 1;
  }
  else {
    int v22 = 4;
  }
  if (v22)
  {
    float64x2_t v23 = [(FigMetalContext *)self->_context allocator];
    float64x2_t v24 = (void *)[v23 newTextureDescriptor];

    [v24 setLabel:0];
    uint64_t v25 = [v10 pixelFormat];
    float64x2_t v26 = [v24 desc];
    [v26 setPixelFormat:v25];

    uint64_t v27 = [v10 width];
    float64x2_t v28 = [v24 desc];
    [v28 setWidth:v27 << v22];

    uint64_t v29 = [v10 height];
    CGRect v30 = [v24 desc];
    [v30 setHeight:v29 << v22];

    float32x4_t v31 = [v24 desc];
    [v31 setUsage:7];

    int8x16_t v32 = [(FigMetalContext *)self->_context allocator];
    float32x2_t v33 = (void *)[v32 newTextureWithDescriptor:v24];

    [v24 setLabel:0];
    uint64_t v34 = [v11 pixelFormat];
    double v35 = [v24 desc];
    [v35 setPixelFormat:v34];

    uint64_t v36 = [v11 width];
    float32x4_t v37 = [v24 desc];
    [v37 setWidth:v36 << v22];

    uint64_t v38 = [v11 height];
    float32x4_t v39 = [v24 desc];
    [v39 setHeight:v38 << v22];

    double v40 = [v24 desc];
    [v40 setUsage:7];

    float32x4_t v41 = [(FigMetalContext *)self->_context allocator];
    unsigned int v42 = (void *)[v41 newTextureWithDescriptor:v24];

    int v43 = -1;
    if (v33 && v42)
    {
      *a5 = v33;
      int v43 = 0;
      *a6 = v42;
    }
  }
  else
  {
    FigMetalIncRef();
    FigMetalIncRef();
    *a5 = v10;
    int v43 = 0;
    *a6 = v11;
  }

  return v43;
}

- (int)_encodeRenderTargetResolve:(id)a3 renderTargetLumaTex:(id)a4 renderTargetChromaTex:(id)a5 outputLumaTex:(id)a6 outputChromaTex:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v45 = a5;
  id v14 = a6;
  id v15 = a7;
  id v46 = 0;
  id location = 0;
  simd_float3x3 v44 = v13;
  if (v13 == v14)
  {
    int v40 = 0;
  }
  else
  {
    FigMetalIncRef();
    FigMetalIncRef();
    objc_storeStrong(&location, a4);
    objc_storeStrong(&v46, a5);
    id v16 = 0;
    size_t v17 = 0;
    for (id i = v13; ; id i = location)
    {
      unint64_t v19 = objc_msgSend(i, "width", v44);
      if ([v14 width] >= v19 >> 1)
      {
        id v41 = v14;

        id v42 = v15;
        id v16 = v41;
        size_t v17 = v42;
      }
      else
      {
        size_t v20 = [(FigMetalContext *)self->_context allocator];
        int v21 = (void *)[v20 newTextureDescriptor];

        [v21 setLabel:0];
        uint64_t v22 = [location pixelFormat];
        float64x2_t v23 = [v21 desc];
        [v23 setPixelFormat:v22];

        unint64_t v24 = [location width];
        uint64_t v25 = [v21 desc];
        [v25 setWidth:v24 >> 1];

        unint64_t v26 = [location height];
        uint64_t v27 = [v21 desc];
        [v27 setHeight:v26 >> 1];

        float64x2_t v28 = [v21 desc];
        [v28 setUsage:7];

        uint64_t v29 = [(FigMetalContext *)self->_context allocator];
        CGRect v30 = (void *)[v29 newTextureWithDescriptor:v21];

        [v21 setLabel:0];
        uint64_t v31 = [v46 pixelFormat];
        int8x16_t v32 = [v21 desc];
        [v32 setPixelFormat:v31];

        unint64_t v33 = [v46 width];
        uint64_t v34 = [v21 desc];
        [v34 setWidth:v33 >> 1];

        unint64_t v35 = [v46 height];
        uint64_t v36 = [v21 desc];
        [v36 setHeight:v35 >> 1];

        float32x4_t v37 = [v21 desc];
        [v37 setUsage:7];

        uint64_t v38 = [(FigMetalContext *)self->_context allocator];
        float32x4_t v39 = (void *)[v38 newTextureWithDescriptor:v21];

        int v40 = -1;
        if (!v30) {
          goto LABEL_13;
        }
        id v16 = v30;
        size_t v17 = v39;
        if (!v39) {
          goto LABEL_13;
        }
      }
      int v40 = [(VCProcessor *)self _encodeDownsample:v12 inputLumaTex:location inputChromaTex:v46 outputLumaTex:v16 outputChromaTex:v17];
      if (v40) {
        break;
      }
      FigMetalDecRef();
      FigMetalDecRef();
      if (v16 == v14)
      {
        int v40 = 0;
        CGRect v30 = v14;
        goto LABEL_12;
      }
      objc_storeStrong(&location, v16);
      objc_storeStrong(&v46, v17);
    }
    CGRect v30 = v16;
LABEL_12:
    float32x4_t v39 = v17;
LABEL_13:
  }
  return v40;
}

- (int)_render
{
  id v23 = 0;
  id v24 = 0;
  if (!self->_centerStagePassthrough || !self->_autoFramingEnabled)
  {
    CFDictionaryRef v9 = [(VCProcessor *)self _bindCVPixleBuffer:self->_inputPixelBuffer usage:1];
    id v10 = v9;
    if (v9 && [v9 count] == 2)
    {
      id v11 = [(VCProcessor *)self _bindCVPixleBuffer:self->_outputPixelBuffer usage:7];
      id v12 = v11;
      if (v11 && [v11 count] == 2)
      {
        double v3 = [v10 objectAtIndexedSubscript:0];
        int v5 = [v10 objectAtIndexedSubscript:1];
        CFDictionaryRef v6 = [v12 objectAtIndexedSubscript:0];
        uint64_t v13 = [v12 objectAtIndexedSubscript:1];

        id v21 = 0;
        id v22 = 0;
        size_t v20 = (void *)v13;
        int v4 = [(VCProcessor *)self _createRenderTargetForOutputLumaTex:v6 outputChromaTex:v13 renderTargetLumaTex:&v22 renderTargetChromaTex:&v21];
        id v14 = v22;
        id v24 = v14;
        id v15 = v21;
        id v23 = v15;
        if (v4)
        {
          uint64_t v7 = 0;
          CGSize v8 = 0;
          goto LABEL_15;
        }
        id v16 = v15;
        size_t v17 = [(FigMetalContext *)self->_context commandQueue];
        uint64_t v7 = [v17 commandBuffer];

        if (!v7)
        {
          int v4 = FigSignalErrorAt();
          CGSize v8 = 0;
          goto LABEL_15;
        }
        size_t v18 = [v7 computeCommandEncoder];
        if (v18)
        {
          int v4 = [(VCProcessor *)self _encodeRender:v18 inputLumaTex:v3 inputChromaTex:v5 outputLumaTex:v14 outputChromaTex:v16];
          if (!v4)
          {
            int v4 = [(VCProcessor *)self _encodeRenderTargetResolve:v18 renderTargetLumaTex:v14 renderTargetChromaTex:v16 outputLumaTex:v6 outputChromaTex:v20];
            if (!v4)
            {
              [v18 endEncoding];
              [v7 commit];
              int v4 = 0;
            }
          }
          CGSize v8 = v18;
          goto LABEL_15;
        }
LABEL_19:
        CGSize v8 = 0;
        int v4 = -1;
LABEL_15:
        FigMetalDecRef();
        FigMetalDecRef();
        goto LABEL_16;
      }
    }
    size_t v20 = 0;
    CFDictionaryRef v6 = 0;
    int v5 = 0;
    double v3 = 0;
    uint64_t v7 = 0;
    goto LABEL_19;
  }
  double v3 = 0;
  int v4 = [(CinematicFramingSession *)self->_framingSession processPixelBuffer:self->_inputPixelBuffer outputPixelBuffer:self->_outputPixelBuffer];
  int v5 = 0;
  CFDictionaryRef v6 = 0;
  size_t v20 = 0;
  uint64_t v7 = 0;
  CGSize v8 = 0;
LABEL_16:

  return v4;
}

- (int)_setOutputPixelBufferAttachments
{
  uint32x2_t v2 = self;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  keCGFloat y = (const __CFString *)*MEMORY[0x1E4F531A8];
  double v3 = (void *)CVBufferCopyAttachment(self->_outputPixelBuffer, (CFStringRef)*MEMORY[0x1E4F531A8], 0);
  if (!v3)
  {
    double v3 = [MEMORY[0x1E4F1CA60] dictionary];
    if (!v3) {
      goto LABEL_27;
    }
  }
  int v4 = [(CinematicFramingSessionInputMetadata *)v2->_inputMetadata detectedObjectsInfo];

  if (v4)
  {
    id v22 = v3;
    id v21 = [(CinematicFramingSessionInputMetadata *)v2->_inputMetadata detectedObjectsInfo];
    DeepCopCGFloat y = (void *)CFPropertyListCreateDeepCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v21, 1uLL);
    if (DeepCopy)
    {
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __47__VCProcessor__setOutputPixelBufferAttachments__block_invoke;
      v39[3] = &unk_1E6CCF810;
      size_t v20 = v2;
      v39[4] = v2;
      CFDictionaryRef v6 = (void (**)(void, void, void))MEMORY[0x1E01B9C80](v39);
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id obj = DeepCopy;
      uint64_t v7 = [obj countByEnumeratingWithState:&v35 objects:v41 count:16];
      if (v7)
      {
        uint64_t v25 = *(void *)v36;
        uint64_t v24 = *MEMORY[0x1E4F538F8];
        uint64_t v8 = *MEMORY[0x1E4F54180];
        uint64_t v9 = *MEMORY[0x1E4F538C8];
        uint64_t v30 = *MEMORY[0x1E4F54030];
        uint64_t v29 = *MEMORY[0x1E4F54190];
        do
        {
          uint64_t v10 = 0;
          uint64_t v26 = v7;
          do
          {
            if (*(void *)v36 != v25) {
              objc_enumerationMutation(obj);
            }
            id v11 = *(void **)(*((void *)&v35 + 1) + 8 * v10);
            long long v31 = 0u;
            long long v32 = 0u;
            long long v33 = 0u;
            long long v34 = 0u;
            id v12 = [obj objectForKeyedSubscript:v11];
            uint64_t v13 = [v12 objectForKeyedSubscript:v24];

            uint64_t v28 = v10;
            uint64_t v14 = [v13 countByEnumeratingWithState:&v31 objects:v40 count:16];
            if (v14)
            {
              uint64_t v15 = *(void *)v32;
              do
              {
                for (uint64_t i = 0; i != v14; ++i)
                {
                  if (*(void *)v32 != v15) {
                    objc_enumerationMutation(v13);
                  }
                  uint64_t v17 = *(void *)(*((void *)&v31 + 1) + 8 * i);
                  v6[2](v6, v17, v8);
                  if ([v11 isEqual:v9])
                  {
                    v6[2](v6, v17, v30);
                    v6[2](v6, v17, v29);
                  }
                }
                uint64_t v14 = [v13 countByEnumeratingWithState:&v31 objects:v40 count:16];
              }
              while (v14);
            }

            uint64_t v10 = v28 + 1;
          }
          while (v28 + 1 != v26);
          uint64_t v7 = [obj countByEnumeratingWithState:&v35 objects:v41 count:16];
        }
        while (v7);
      }

      [v22 setObject:obj forKeyedSubscript:*MEMORY[0x1E4F53DC8]];
      double v3 = v22;
      uint32x2_t v2 = v20;
      goto LABEL_22;
    }

LABEL_27:
    int v18 = -1;
    goto LABEL_25;
  }
LABEL_22:
  if (!v2->_autoFramingEnabled) {
    [v3 setValuesForKeysWithDictionary:v2->_manualFramingStateMetadata];
  }
  CVBufferSetAttachment(v2->_outputPixelBuffer, key, v3, kCVAttachmentMode_ShouldPropagate);
  int v18 = 0;
LABEL_25:

  return v18;
}

void __47__VCProcessor__setOutputPixelBufferAttachments__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  CFDictionaryRef v7 = [v5 objectForKeyedSubscript:v6];
  BOOL v8 = CGRectMakeWithDictionaryRepresentation(v7, &v10);

  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "warpCGRect:", v10.origin.x, v10.origin.y, v10.size.width, v10.size.height);
    CGRect v10 = v11;
    CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v11);
    [v5 setObject:DictionaryRepresentation forKeyedSubscript:v6];
  }
}

- (id)cameraSwitchingDelegate
{
  return self->_cameraSwitchingDelegate;
}

- (void)setCameraSwitchingDelegate:(id)a3
{
}

- (id)auxiliaryStreamCamera
{
  return self->_auxiliaryStreamCamera;
}

- (void)setAuxilaryStreamCamera:(id)a3
{
}

- (int)checkCameraSwitchingWithAuxilaryStreamMetadata:(id)a3
{
  id v4 = a3;
  auxiliaryStreamCamera = self->_auxiliaryStreamCamera;
  if (auxiliaryStreamCamera) {
    id v6 = auxiliaryStreamCamera;
  }
  else {
    id v6 = objc_alloc_init(VCCamera);
  }
  CFDictionaryRef v7 = self->_auxiliaryStreamCamera;
  self->_auxiliaryStreamCamera = v6;

  int v8 = [(VCProcessor *)self _updateCamera:self->_auxiliaryStreamCamera withMetadata:v4];
  if (v8) {
    goto LABEL_22;
  }
  [(VCTuningParameters *)self->_tuning wideToSuperWideSwitchMargin];
  float v10 = v9;
  [(VCTuningParameters *)self->_tuning superWideToWideSwitchMargin];
  if (v10 >= v11) {
    float v12 = 0.0;
  }
  else {
    float v12 = v10;
  }
  if (v10 >= v11) {
    float v13 = 0.0;
  }
  else {
    float v13 = v11;
  }
  [(VCCamera *)self->_outputCamera zoomFactor];
  int v15 = v14;
  LODWORD(v16) = 1.0;
  [(VCCamera *)self->_outputCamera setZoomFactor:v16];
  uint64_t v17 = [(VCCamera *)self->_inputCamera portType];
  uint64_t v18 = *MEMORY[0x1E4F52DE8];
  char v19 = [v17 isEqual:*MEMORY[0x1E4F52DE8]];
  size_t v20 = (void *)MEMORY[0x1E4F52DD8];
  if ((v19 & 1) == 0)
  {

    goto LABEL_15;
  }
  id v21 = [(VCCamera *)self->_auxiliaryStreamCamera portType];
  int v22 = [v21 isEqual:*v20];

  if (!v22)
  {
LABEL_15:
    int v23 = 0;
    goto LABEL_16;
  }
  int v23 = isViewFrustumContained(self->_outputCamera, self->_auxiliaryStreamCamera, v13);
LABEL_16:
  uint64_t v24 = [(VCCamera *)self->_inputCamera portType];
  if ([v24 isEqual:*v20])
  {
    uint64_t v25 = [(VCCamera *)self->_auxiliaryStreamCamera portType];
    int v26 = [v25 isEqual:v18];

    if (v26) {
      int v23 = isViewFrustumContained(self->_outputCamera, self->_inputCamera, v12) ^ 1;
    }
  }
  else
  {
  }
  LODWORD(v27) = v15;
  [(VCCamera *)self->_outputCamera setZoomFactor:v27];
  if (v23)
  {
    cameraSwitchingDelegate = self->_cameraSwitchingDelegate;
    uint64_t v29 = [(VCCamera *)self->_auxiliaryStreamCamera portType];
    [(VCProcessorCameraSwitchingDelegate *)cameraSwitchingDelegate processor:self wantsActiveStreamPortType:v29];
  }
LABEL_22:

  return v8;
}

- (NSDictionary)tuningParameters
{
  return self->_tuningParameters;
}

- (void)setTuningParameters:(id)a3
{
}

- (NSDictionary)cameraInfoByPortType
{
  return self->_cameraInfoByPortType;
}

- (void)setCameraInfoByPortType:(id)a3
{
}

- ($2825F4736939C4A6D3AD43837233062D)outputDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_outputDimensions;
}

- (void)setOutputDimensions:(id)a3
{
  self->_$470D365275581EF16070F5A11344F73E outputDimensions = ($470D365275581EF16070F5A11344F73E)a3;
}

- (__CVBuffer)inputPixelBuffer
{
  return self->_inputPixelBuffer;
}

- (void)setInputPixelBuffer:(__CVBuffer *)a3
{
  self->_inputPixelBuffer = a3;
}

- (CinematicFramingSessionInputMetadata)inputMetadata
{
  return self->_inputMetadata;
}

- (void)setInputMetadata:(id)a3
{
}

- (VCCamera)inputCamera
{
  return self->_inputCamera;
}

- (void)setInputCamera:(id)a3
{
}

- (__CVBuffer)outputPixelBuffer
{
  return self->_outputPixelBuffer;
}

- (void)setOutputPixelBuffer:(__CVBuffer *)a3
{
  self->_outputPixelBuffer = a3;
}

- (VCCamera)outputCamera
{
  return self->_outputCamera;
}

- (void)setOutputCamera:(id)a3
{
}

- (CGRect)outputROI
{
  double x = self->_outputROI.origin.x;
  double y = self->_outputROI.origin.y;
  double width = self->_outputROI.size.width;
  double height = self->_outputROI.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)orientationCorrectionEnabled
{
  return self->_orientationCorrectionEnabled;
}

- (BOOL)rollCorrectionEnabled
{
  return self->_rollCorrectionEnabled;
}

- (void)setRollCorrectionEnabled:(BOOL)a3
{
  self->_rollCorrectionEnabled = a3;
}

- (BOOL)confineOutputCamera
{
  return self->_confineOutputCamera;
}

- (void)setConfineOutputCamera:(BOOL)a3
{
  self->_confineOutputCamera = a3;
}

- (BOOL)fisheyeEffectEnabled
{
  return self->_fisheyeEffectEnabled;
}

- (void)setFisheyeEffectEnabled:(BOOL)a3
{
  self->_BOOL fisheyeEffectEnabled = a3;
}

- (float)videoZoomFactor
{
  return self->_videoZoomFactor;
}

- (BOOL)attachMetadataToOutputPixelBuffer
{
  return self->_attachMetadataToOutputPixelBuffer;
}

- (void)setAttachMetadataToOutputPixelBuffer:(BOOL)a3
{
  self->_attachMetadataToOutputPixelBuffer = a3;
}

- (BOOL)outputCameraResetCompleted
{
  return self->_outputCameraResetCompleted;
}

- (BOOL)oneShotFramingCompleted
{
  return self->_oneShotFramingCompleted;
}

- (float)manualFramingDefaultVideoZoomFactor
{
  return self->_manualFramingDefaultVideoZoomFactor;
}

- (__n128)outputCameraDefaultRotation
{
  return a1[14];
}

- (NSDictionary)manualFramingStateMetadata
{
  return self->_manualFramingStateMetadata;
}

- (BOOL)autoFramingEnabled
{
  return self->_autoFramingEnabled;
}

- (BOOL)autoRestoreManualFramingState
{
  return self->_autoRestoreManualFramingState;
}

- (void)setAutoRestoreManualFramingState:(BOOL)a3
{
  self->_autoRestoreManualFramingState = a3;
}

- (CinematicFramingSession)framingSession
{
  return self->_framingSession;
}

- (BOOL)centerStagePassthrough
{
  return self->_centerStagePassthrough;
}

- (void)setCenterStagePassthrough:(BOOL)a3
{
  self->_centerStagePassthrough = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_framingSession, 0);
  objc_storeStrong((id *)&self->_manualFramingStateMetadata, 0);
  objc_storeStrong((id *)&self->_outputCamera, 0);
  objc_storeStrong((id *)&self->_inputCamera, 0);
  objc_storeStrong((id *)&self->_inputMetadata, 0);
  objc_storeStrong((id *)&self->_metalCommandQueue, 0);
  objc_storeStrong((id *)&self->_cameraInfoByPortType, 0);
  objc_storeStrong((id *)&self->_tuningParameters, 0);
  objc_storeStrong((id *)&self->_cameraSwitchingDelegate, 0);
  objc_storeStrong((id *)&self->_auxiliaryStreamCamera, 0);
  objc_storeStrong((id *)&self->_outputCameraAnimator, 0);
  objc_storeStrong((id *)&self->_tuning, 0);
  objc_storeStrong((id *)&self->_shaders, 0);

  objc_storeStrong((id *)&self->_context, 0);
}

@end