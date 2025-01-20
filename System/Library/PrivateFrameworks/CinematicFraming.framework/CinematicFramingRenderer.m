@interface CinematicFramingRenderer
- ($2825F4736939C4A6D3AD43837233062D)outputDimensions;
- ($DB21A1D7CD9E59D36D824D8119A7BF2D)calibrationParams;
- (BOOL)_pointInFramingSpaceLandscapeLeftIsValid:(CGRect)a3 withDisplayRect:;
- (BOOL)cameraOrientationCorrectionEnabled;
- (BOOL)frontCameraHas180DegreesRotation;
- (BOOL)isFrontCamera;
- (BOOL)visualizeViewport;
- (CGPoint)_projectPointInFramingSpaceLandscapeLeft:(CGPoint)a3 toDisplayRectInFramingSpaceLandscapeLeft:(CGRect)a4;
- (CGPoint)projectPointInFramingSpace:(CGPoint)a3 toDisplayRectInFramingSpace:(CGRect)a4;
- (CGRect)_adjustDisplayRectToFitInFramingSpaceLandscapeLeft:(CGRect)a3;
- (CGRect)_framingSpaceBoundsLandscapeLeft;
- (CGRect)_moveDisplayRectToFitInFramingSpaceLandscapeLeft:(CGRect)a3;
- (CGRect)_projectRectInFramingSpaceLandscapeLeft:(CGRect)a3 toDisplayRectInFramingSpaceLandscapeLeft:(CGRect)a4;
- (CGRect)_warpRectInInputImageCoordinatesToFramingSpaceInLandscapeLeft:(CGRect)a3 calibrationParameters:(id *)a4;
- (CGRect)adjustDisplayRectToFitInFramingSpace:(CGRect)a3;
- (CGRect)computeNewCoordinatesInOrientation:(int)a3 forViewportInCurrentOrientation:(CGRect)a4;
- (CGRect)framingSpaceBounds;
- (CGRect)outputROI;
- (CGRect)projectRectInFramingSpace:(CGRect)a3 toDisplayRectInFramingSpace:(CGRect)a4;
- (CGRect)warpRectInInputImageCoordinatesToFramingSpace:(CGRect)a3;
- (CGSize)_scaleDisplayRectSizeToFit:(CGSize)a3;
- (CGSize)_searchValidSizeForStartSize:(CGSize)a3 invalidPoint:;
- (CinematicFramingRenderer)initWithOutputDimensions:(id)a3;
- (CinematicFramingSessionOptions)options;
- (__n128)gravity;
- (double)_rotationMatrixForDisplayRect:(double)a3;
- (float)_fisheyeStrengthForDisplayRect:(CGRect)a3;
- (float)_getHeightDerivativeForWidth:(float)a3 widthDerivative:(float)a4 outputAspectRatioInDeviceOrientation:(float)a5;
- (float)_getHeightForWidth:(float)a3 outputAspectRatioInDeviceOrientation:(float)a4;
- (float)_getWidthForHeight:(float)a3 outputAspectRatioInDeviceOrientation:(float)a4;
- (float)additionalCameraRotation;
- (float)fovLimit;
- (float)getHeightDerivativeForWidth:(float)a3 widthDerivative:(float)a4;
- (float)getHeightForWidth:(float)a3;
- (float)getWidthForHeight:(float)a3;
- (float)maxAllowedViewportWidth;
- (float)outputAspectRatioInDeviceOrientation;
- (float32x2_t)_outputPlaneSizeForDisplayRect:(CGFloat)a3;
- (float32x2_t)_searchEarliestValidPointOnIntervalWithStart:(float32x2_t)a3 andEnd:(CGFloat)a4 displayRect:(CGFloat)a5;
- (id)_compileComputeShader:(id)a3 pixelFormat:(unint64_t)a4;
- (int)_compileShaders;
- (int)_createComputePipelinesForShaders:(id)a3;
- (int)_outputPlaneCcwRotations;
- (int)cameraOrientation;
- (int)numCCWRotationsFromInputToFramingSpace;
- (int)processBuffer:(__CVBuffer *)a3 cropRect:(CGRect)a4 outputPixelBuffer:(__CVBuffer *)a5;
- (int)registerCalibrationData:(id)a3;
- (int)sensorID;
- (void)_filterDetectionsInInputImageCoordinates:(id)a3 trackType:(int64_t)a4;
- (void)_setShaderParametersForDisplayRect:(CGRect)a3 outputROI:(CGRect)a4 calibrationParameters:(id *)a5 commandEncoder:(id)a6;
- (void)dealloc;
- (void)finish;
- (void)initializeMetal;
- (void)registerAdditionalCameraRotation:(float)a3;
- (void)registerGravityX:(float)a3 y:(float)a4 z:(float)a5;
- (void)registerSensorID:(int)a3;
- (void)setCameraOrientation:(int)a3;
- (void)setCameraOrientationCorrectionEnabled:(BOOL)a3;
- (void)setFovLimit:(float)a3;
- (void)setFrontCameraHas180DegreesRotation:(BOOL)a3;
- (void)setIsFrontCamera:(BOOL)a3;
- (void)setOptions:(id)a3;
- (void)setOutputROI:(CGRect)a3;
- (void)setVisualizeViewport:(BOOL)a3;
- (void)warpMetadataInInputImageCoordinatesToFramingSpace:(id)a3;
@end

@implementation CinematicFramingRenderer

- (CinematicFramingRenderer)initWithOutputDimensions:(id)a3
{
  v17.receiver = self;
  v17.super_class = (Class)CinematicFramingRenderer;
  v4 = [(CinematicFramingRenderer *)&v17 init];
  v5 = v4;
  if (v4)
  {
    v4->_outputDimensions = ($470D365275581EF16070F5A11344F73E)a3;
    *(_OWORD *)v4->_gravity = xmmword_1DD5ACF70;
    v4->_additionalCameraRotation = 0.0;
    [(CinematicFramingRenderer *)v4 initializeMetal];
    [(CinematicFramingRenderer *)v5 setCameraOrientation:0];
    v5->_outputROI.origin.x = 0.0;
    v5->_outputROI.origin.y = 0.0;
    __asm { FMOV            V0.2D, #1.0 }
    v5->_outputROI.size = _Q0;
    *(void *)&v5->_stereographicFisheyeF = 0x3F59999A3FA28F5CLL;
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v12 = v5->_kalmanFilterManager[0];
    v5->_kalmanFilterManager[0] = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v14 = v5->_kalmanFilterManager[1];
    v5->_kalmanFilterManager[1] = v13;

    v5->_frontCameraHas180DegreesRotation = 1;
    v15 = v5;
  }

  return v5;
}

- (void)dealloc
{
  [(CinematicFramingRenderer *)self finish];
  cvMetalTextureCacheRef = self->_cvMetalTextureCacheRef;
  if (cvMetalTextureCacheRef) {
    CFRelease(cvMetalTextureCacheRef);
  }
  v4.receiver = self;
  v4.super_class = (Class)CinematicFramingRenderer;
  [(CinematicFramingRenderer *)&v4 dealloc];
}

- (BOOL)isFrontCamera
{
  return self->_isFrontCamera;
}

- (void)setIsFrontCamera:(BOOL)a3
{
  self->_isFrontCamera = a3;
  self->_numCCWRotationsFromInputToFramingSpace = computeNumberOfCCWRotationsFromInputToFramingSpaceForCameraOrientation(self->_cameraOrientation, a3, self->_frontCameraHas180DegreesRotation);
}

- (int)cameraOrientation
{
  return self->_cameraOrientation;
}

- (void)setCameraOrientation:(int)a3
{
  self->_cameraOrientation = a3;
  self->_numCCWRotationsFromInputToFramingSpace = computeNumberOfCCWRotationsFromInputToFramingSpaceForCameraOrientation(a3, self->_isFrontCamera, self->_frontCameraHas180DegreesRotation);
}

- (CGRect)computeNewCoordinatesInOrientation:(int)a3 forViewportInCurrentOrientation:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  if (a3)
  {
    int v8 = computeNumberOfCCWRotationsFromInputToFramingSpaceForCameraOrientation(a3, self->_isFrontCamera, self->_frontCameraHas180DegreesRotation)- self->_numCCWRotationsFromInputToFramingSpace+ 4;
    int v9 = v8 & 3;
    int v11 = -v8;
    BOOL v10 = v11 < 0;
    int v12 = v11 & 3;
    if (v10) {
      int v13 = v9;
    }
    else {
      int v13 = -v12;
    }
    CGFloat x = rotateRectCCW(v13, x, y, width, height);
    CGFloat y = v14;
    CGFloat width = v15;
    CGFloat height = v16;
  }
  double v17 = x;
  double v18 = y;
  double v19 = width;
  double v20 = height;
  result.size.CGFloat height = v20;
  result.size.CGFloat width = v19;
  result.origin.CGFloat y = v18;
  result.origin.CGFloat x = v17;
  return result;
}

- (int)registerCalibrationData:(id)a3
{
  if (!a3) {
    return -12780;
  }
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"IntrinsicMatrixReferenceDimensions"];
  v6 = [v5 objectForKeyedSubscript:@"Width"];
  [v6 floatValue];
  *(_DWORD *)self->_anon_90 = v7;

  int v8 = [v4 objectForKeyedSubscript:@"IntrinsicMatrixReferenceDimensions"];
  int v9 = [v8 objectForKeyedSubscript:@"Height"];
  [v9 floatValue];
  *(_DWORD *)&self->_anon_90[4] = v10;

  id v11 = [v4 objectForKeyedSubscript:@"IntrinsicMatrix"];
  int v12 = (_OWORD *)[v11 bytes];
  long long v14 = v12[1];
  long long v13 = v12[2];
  *(_OWORD *)&self->_anon_90[16] = *v12;
  *(_OWORD *)&self->_anon_90[32] = v14;
  *(_OWORD *)&self->_anon_90[48] = v13;
  int32x4_t v15 = *(int32x4_t *)&self->_anon_90[16];
  int32x4_t v16 = *(int32x4_t *)&self->_anon_90[32];
  long long v17 = *(_OWORD *)&self->_anon_90[48];
  *(_DWORD *)&self->_anon_90[24] = v17;
  *(_DWORD *)&self->_anon_90[40] = DWORD1(v17);
  *(void *)&self->_anon_90[16] = vzip1q_s32(v15, v16).u64[0];
  *(void *)&self->_anon_90[32] = vtrn2q_s32(v15, v16).u64[0];
  *(_DWORD *)&self->_anon_90[56] = DWORD2(v17);
  *(void *)&self->_anon_90[48] = vzip1q_s32(vdupq_laneq_s32(v15, 2), vdupq_laneq_s32(v16, 2)).u64[0];
  double v18 = [v4 objectForKeyedSubscript:@"PixelSize"];
  [v18 floatValue];
  float v20 = v19;

  *(float *)&self->_anon_90[80] = v20 * v20;
  v21 = [v4 objectForKeyedSubscript:@"DistortionCalibrationValidMaxRadiusInPixels"];
  v22 = [v4 objectForKeyedSubscript:@"LensDistortionCenter"];
  v23 = [v22 objectForKeyedSubscript:@"X"];

  v24 = [v4 objectForKeyedSubscript:@"LensDistortionCenter"];
  v25 = [v24 objectForKeyedSubscript:@"Y"];

  v26 = [v4 objectForKeyedSubscript:@"LensDistortionCoefficients"];
  v27 = [v4 objectForKeyedSubscript:@"InverseLensDistortionCoefficients"];

  if (v21) {
    BOOL v28 = v23 == 0;
  }
  else {
    BOOL v28 = 1;
  }
  BOOL v31 = v28 || v25 == 0 || v26 == 0 || v27 == 0;
  unsigned __int8 v32 = !v31;
  self->_anon_90[64] = v32;
  if (v31)
  {
    *(_DWORD *)&self->_anon_90[84] = 0;
    *(void *)&self->_anon_90[72] = 0;
    long long v38 = 0uLL;
    *(_OWORD *)&self->_anon_90[120] = 0u;
    *(_OWORD *)&self->_anon_90[136] = 0u;
    *(_OWORD *)&self->_anon_90[88] = 0u;
  }
  else
  {
    *(_DWORD *)&self->_anon_90[84] = [v21 intValue];
    [v23 floatValue];
    *(_DWORD *)&self->_anon_90[72] = v33;
    [v25 floatValue];
    *(_DWORD *)&self->_anon_90[76] = v34;
    v35 = (_OWORD *)[v26 bytes];
    long long v36 = v35[1];
    *(_OWORD *)&self->_anon_90[120] = *v35;
    *(_OWORD *)&self->_anon_90[136] = v36;
    v37 = (_OWORD *)[v27 bytes];
    long long v38 = v37[1];
    *(_OWORD *)&self->_anon_90[88] = *v37;
  }
  *(_OWORD *)&self->_anon_90[104] = v38;

  return 0;
}

- (void)registerGravityX:(float)a3 y:(float)a4 z:(float)a5
{
  int32x4_t v7 = (int32x4_t)vmulq_f32(*(float32x4_t *)&a3, *(float32x4_t *)&a3);
  v7.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v7, 2), vadd_f32(*(float32x2_t *)v7.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v7.i8, 1))).u32[0];
  float32x2_t v8 = vrsqrte_f32((float32x2_t)v7.u32[0]);
  float32x2_t v9 = vmul_f32(v8, vrsqrts_f32((float32x2_t)v7.u32[0], vmul_f32(v8, v8)));
  *(float32x4_t *)self->_gravitCGFloat y = vmulq_n_f32(*(float32x4_t *)&a3, vmul_f32(v9, vrsqrts_f32((float32x2_t)v7.u32[0], vmul_f32(v9, v9))).f32[0]);
}

- (void)registerAdditionalCameraRotation:(float)a3
{
  self->_additionalCameraRotation = a3;
}

- (void)registerSensorID:(int)a3
{
  self->_sensorID = a3;
}

- (int)processBuffer:(__CVBuffer *)a3 cropRect:(CGRect)a4 outputPixelBuffer:(__CVBuffer *)a5
{
  id v57 = 0;
  id v58 = 0;
  id v54 = 0;
  id v55 = 0;
  double v8 = rotateRectCCW(4 - self->_numCCWRotationsFromInputToFramingSpace, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  if ((PixelFormatIs420(PixelFormatType) & 1) == 0
    || (OSType v16 = CVPixelBufferGetPixelFormatType(a5), (PixelFormatIs420(v16) & 1) == 0)
    || CVPixelBufferGetWidth(a5) != self->_outputDimensions.width
    || CVPixelBufferGetHeight(a5) != self->_outputDimensions.height)
  {
    fig_log_get_emitter();
LABEL_35:
    FigDebugAssert3();
    v25 = 0;
    double v18 = 0;
    int v17 = -12780;
    goto LABEL_27;
  }
  int v17 = cachedTexturesFromPixelBuffer(a3, (uint64_t)v56, self->_cvMetalTextureCacheRef);
  if (v17)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
LABEL_33:
    v25 = 0;
    double v18 = 0;
    goto LABEL_27;
  }
  int v17 = cachedTexturesFromPixelBuffer(a5, (uint64_t)v53, self->_cvMetalTextureCacheRef);
  if (v17)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_33;
  }
  if (v53[0] != 2)
  {
    fig_log_get_emitter();
    goto LABEL_35;
  }
  double v18 = [(MTLCommandQueue *)self->_commandQueue commandBuffer];
  if (v18)
  {
    if (v53[0])
    {
      float v19 = 0;
      unint64_t v20 = 1;
      while (1)
      {
        uint64_t v21 = [*(id *)&v53[2 * v20] pixelFormat];
        pipelineComputeStates = self->_pipelineComputeStates;
        if (v21 != 10)
        {
          if (v21 != 30) {
            goto LABEL_25;
          }
          pipelineComputeStates = &self->_pipelineComputeStates[1];
        }
        v23 = *pipelineComputeStates;
        if (!v23)
        {
LABEL_25:
          fig_log_get_emitter();
          FigDebugAssert3();
          v24 = 0;
          int v17 = -12782;
          goto LABEL_26;
        }
        v24 = v23;
        v25 = [v18 computeCommandEncoder];

        if (!v25) {
          break;
        }
        [v25 setComputePipelineState:v24];
        [v25 setTexture:*(void *)&v56[8 * v20] atIndex:0];
        [v25 setTexture:*(void *)&v53[2 * v20] atIndex:1];
        [(CinematicFramingRenderer *)self outputROI];
        int width = self->_outputDimensions.width;
        double height = (double)self->_outputDimensions.height;
        double v29 = v28 * (double)width;
        double v31 = v30 * height;
        double v34 = v33 * height;
        double v35 = fmax(v29 + -10.0, 0.0);
        double v36 = fmax(v31 + -10.0, 0.0);
        double v37 = v29 + v32 * (double)width + 10.0;
        if (v37 >= (double)width) {
          double v37 = (double)width;
        }
        double v38 = v31 + v34 + 10.0;
        if (v38 >= height) {
          double v38 = (double)self->_outputDimensions.height;
        }
        long long v39 = *(_OWORD *)&self->_anon_90[112];
        v52[6] = *(_OWORD *)&self->_anon_90[96];
        v52[7] = v39;
        long long v40 = *(_OWORD *)&self->_anon_90[144];
        v52[8] = *(_OWORD *)&self->_anon_90[128];
        v52[9] = v40;
        long long v41 = *(_OWORD *)&self->_anon_90[48];
        v52[2] = *(_OWORD *)&self->_anon_90[32];
        v52[3] = v41;
        long long v42 = *(_OWORD *)&self->_anon_90[80];
        v52[4] = *(_OWORD *)&self->_anon_90[64];
        v52[5] = v42;
        long long v43 = *(_OWORD *)&self->_anon_90[16];
        v52[0] = *(_OWORD *)self->_anon_90;
        v52[1] = v43;
        -[CinematicFramingRenderer _setShaderParametersForDisplayRect:outputROI:calibrationParameters:commandEncoder:](self, "_setShaderParametersForDisplayRect:outputROI:calibrationParameters:commandEncoder:", v52, v25, v8, v10, v12, v14, v35 / (double)width, v36 / height, (v37 - v35) / (double)width, (v38 - v36) / height);
        unint64_t v44 = [(MTLComputePipelineState *)v24 threadExecutionWidth];
        unint64_t v45 = [(MTLComputePipelineState *)v24 maxTotalThreadsPerThreadgroup];
        uint64_t v46 = [*(id *)&v53[2 * v20] width];
        uint64_t v47 = [*(id *)&v53[2 * v20] height];
        v51[0] = v46;
        v51[1] = v47;
        v51[2] = 1;
        v50[0] = v44;
        v50[1] = v45 / v44;
        v50[2] = 1;
        [v25 dispatchThreads:v51 threadsPerThreadgroup:v50];
        [v25 endEncoding];

        float v19 = v25;
        if (v20++ >= v53[0]) {
          goto LABEL_24;
        }
      }
      fig_log_get_emitter();
      FigDebugAssert3();
      float v19 = 0;
      int v17 = -12786;
LABEL_26:

      v25 = v19;
    }
    else
    {
      v25 = 0;
LABEL_24:
      [v18 commit];
      [v18 waitUntilCompleted];
      int v17 = 0;
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v25 = 0;
    double v18 = 0;
    int v17 = -12786;
  }
LABEL_27:

  return v17;
}

- (void)finish
{
  id v4 = [(MTLCommandQueue *)self->_commandQueue commandBuffer];
  [v4 commit];
  [v4 waitUntilCompleted];
  cvMetalTextureCacheRef = self->_cvMetalTextureCacheRef;
  if (cvMetalTextureCacheRef) {
    CVMetalTextureCacheFlush(cvMetalTextureCacheRef, 0);
  }
}

- (void)_filterDetectionsInInputImageCoordinates:(id)a3 trackType:(int64_t)a4
{
  double v30 = self;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  obuint64_t j = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v37;
    kalmanFilterManager = v30->_kalmanFilterManager;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v37 != v9) {
          objc_enumerationMutation(obj);
        }
        double v12 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        double v13 = objc_msgSend(NSNumber, "numberWithLong:", objc_msgSend(v12, "oid", v30));
        [v6 addObject:v13];

        double v14 = kalmanFilterManager[a4];
        int32x4_t v15 = objc_msgSend(NSNumber, "numberWithLong:", objc_msgSend(v12, "oid"));
        OSType v16 = [(NSMutableDictionary *)v14 objectForKey:v15];

        if (!v16)
        {
          OSType v16 = objc_alloc_init(KalmanFilter);
          int v17 = kalmanFilterManager[a4];
          id v18 = v6;
          uint64_t v19 = v8;
          int64_t v20 = a4;
          uint64_t v21 = v9;
          v22 = objc_msgSend(NSNumber, "numberWithLong:", objc_msgSend(v12, "oid"));
          [(NSMutableDictionary *)v17 setObject:v16 forKeyedSubscript:v22];

          uint64_t v9 = v21;
          a4 = v20;
          uint64_t v8 = v19;
          id v6 = v18;
        }
        [(KalmanFilter *)v16 addObservation:v12];
        [(KalmanFilter *)v16 estimatedBounds];
        objc_msgSend(v12, "setBounds:");
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v8);
  }

  long long v34 = 0u;
  long long v35 = 0u;
  v23 = v30->_kalmanFilterManager;
  long long v32 = 0u;
  long long v33 = 0u;
  v24 = [(NSMutableDictionary *)v30->_kalmanFilterManager[a4] allKeys];
  uint64_t v25 = [v24 countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v33;
    do
    {
      for (uint64_t j = 0; j != v26; ++j)
      {
        if (*(void *)v33 != v27) {
          objc_enumerationMutation(v24);
        }
        uint64_t v29 = *(void *)(*((void *)&v32 + 1) + 8 * j);
        if ((objc_msgSend(v6, "containsObject:", v29, v30) & 1) == 0) {
          [(NSMutableDictionary *)v23[a4] removeObjectForKey:v29];
        }
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v32 objects:v40 count:16];
    }
    while (v26);
  }
}

- (CGPoint)projectPointInFramingSpace:(CGPoint)a3 toDisplayRectInFramingSpace:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  double v9 = rotatePointCCW(4 - self->_numCCWRotationsFromInputToFramingSpace, a3.x, a3.y);
  double v11 = v10;
  double v15 = rotateRectCCW(4 - self->_numCCWRotationsFromInputToFramingSpace, x, y, width, height);

  -[CinematicFramingRenderer _projectPointInFramingSpaceLandscapeLeft:toDisplayRectInFramingSpaceLandscapeLeft:](self, "_projectPointInFramingSpaceLandscapeLeft:toDisplayRectInFramingSpaceLandscapeLeft:", v9, v11, v15, v12, v13, v14);
  result.CGFloat y = v17;
  result.CGFloat x = v16;
  return result;
}

- (CGRect)projectRectInFramingSpace:(CGRect)a3 toDisplayRectInFramingSpace:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  double v9 = rotateRectCCW(4 - self->_numCCWRotationsFromInputToFramingSpace, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v19 = rotateRectCCW(4 - self->_numCCWRotationsFromInputToFramingSpace, x, y, width, height);

  -[CinematicFramingRenderer _projectRectInFramingSpaceLandscapeLeft:toDisplayRectInFramingSpaceLandscapeLeft:](self, "_projectRectInFramingSpaceLandscapeLeft:toDisplayRectInFramingSpaceLandscapeLeft:", v9, v11, v13, v15, v19, v16, v17, v18);
  result.size.CGFloat height = v23;
  result.size.CGFloat width = v22;
  result.origin.CGFloat y = v21;
  result.origin.CGFloat x = v20;
  return result;
}

- (void)warpMetadataInInputImageCoordinatesToFramingSpace:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 bodyDetections];
  [(CinematicFramingRenderer *)self _filterDetectionsInInputImageCoordinates:v5 trackType:0];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v6 = [v4 bodyDetections];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v6);
        }
        double v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        [v11 bounds];
        -[CinematicFramingRenderer warpRectInInputImageCoordinatesToFramingSpace:](self, "warpRectInInputImageCoordinatesToFramingSpace:");
        objc_msgSend(v11, "setBounds:");
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v8);
  }

  double v12 = [v4 faceDetections];
  [(CinematicFramingRenderer *)self _filterDetectionsInInputImageCoordinates:v12 trackType:1];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  double v13 = objc_msgSend(v4, "faceDetections", 0);
  uint64_t v14 = [v13 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v20;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v20 != v16) {
          objc_enumerationMutation(v13);
        }
        double v18 = *(void **)(*((void *)&v19 + 1) + 8 * j);
        [v18 bounds];
        -[CinematicFramingRenderer warpRectInInputImageCoordinatesToFramingSpace:](self, "warpRectInInputImageCoordinatesToFramingSpace:");
        objc_msgSend(v18, "setBounds:");
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v15);
  }
}

- (CGRect)warpRectInInputImageCoordinatesToFramingSpace:(CGRect)a3
{
  long long v4 = *(_OWORD *)&self->_anon_90[112];
  v17[6] = *(_OWORD *)&self->_anon_90[96];
  v17[7] = v4;
  long long v5 = *(_OWORD *)&self->_anon_90[144];
  v17[8] = *(_OWORD *)&self->_anon_90[128];
  v17[9] = v5;
  long long v6 = *(_OWORD *)&self->_anon_90[48];
  v17[2] = *(_OWORD *)&self->_anon_90[32];
  v17[3] = v6;
  long long v7 = *(_OWORD *)&self->_anon_90[80];
  v17[4] = *(_OWORD *)&self->_anon_90[64];
  v17[5] = v7;
  long long v8 = *(_OWORD *)&self->_anon_90[16];
  v17[0] = *(_OWORD *)self->_anon_90;
  v17[1] = v8;
  -[CinematicFramingRenderer _warpRectInInputImageCoordinatesToFramingSpaceInLandscapeLeft:calibrationParameters:](self, "_warpRectInInputImageCoordinatesToFramingSpaceInLandscapeLeft:calibrationParameters:", v17, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v13 = rotateRectCCW(self->_numCCWRotationsFromInputToFramingSpace, v9, v10, v11, v12);
  result.size.CGFloat height = v16;
  result.size.CGFloat width = v15;
  result.origin.CGFloat y = v14;
  result.origin.CGFloat x = v13;
  return result;
}

- (float)_fisheyeStrengthForDisplayRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  BOOL v8 = [(CinematicFramingRenderer *)self visualizeViewport];
  float result = 0.0;
  if (!v8)
  {
    v13.origin.CGFloat x = x;
    v13.origin.CGFloat y = y;
    v13.size.CGFloat width = width;
    v13.size.CGFloat height = height;
    float v10 = CGRectGetHeight(v13);
    v14.origin.CGFloat x = x;
    v14.origin.CGFloat y = y;
    v14.size.CGFloat width = width;
    v14.size.CGFloat height = height;
    float v11 = CGRectGetWidth(v14);
    float v12 = fminf(fmaxf((float)(fmaxf(v10, v11) + -0.95993) / 0.87266, 0.0), 1.0);
    return self->_stereographicFisheyeMaxStrength * (float)((float)(v12 * v12) * (float)((float)(v12 * -2.0) + 3.0));
  }
  return result;
}

- (float32x2_t)_outputPlaneSizeForDisplayRect:(CGFloat)a3
{
  float v8 = CGRectGetWidth(*(CGRect *)&a1) * 0.5;
  float v12 = tanf(v8);
  v13.origin.CGFloat x = a1;
  v13.origin.CGFloat y = a2;
  v13.size.CGFloat width = a3;
  v13.size.CGFloat height = a4;
  float v9 = CGRectGetHeight(v13) * 0.5;
  float v10 = tanf(v9);
  return vadd_f32((float32x2_t)__PAIR64__(LODWORD(v10), LODWORD(v12)), (float32x2_t)__PAIR64__(LODWORD(v10), LODWORD(v12)));
}

- (double)_rotationMatrixForDisplayRect:(double)a3
{
  float MidY = CGRectGetMidY(*(CGRect *)&a2);
  __float2 v11 = __sincosf_stret(MidY * -0.5);
  float32x4_t v12 = vmulq_n_f32((float32x4_t)xmmword_1DD5ACF70, v11.__sinval);
  v12.i32[3] = LODWORD(v11.__cosval);
  *(__n64 *)v13.f32 = simd_matrix3x3(v12);
  float32x4_t v77 = v14;
  float32x4_t v79 = v13;
  float32x4_t v75 = v15;
  *(double *)v13.i64 = a2;
  *(double *)v14.i64 = a3;
  *(double *)v15.i64 = a4;
  double v16 = a5;
  float MidX = CGRectGetMidX(*(CGRect *)v13.f32);
  __float2 v18 = __sincosf_stret(MidX * 0.5);
  float32x4_t v19 = vmulq_n_f32((float32x4_t)xmmword_1DD5ACF80, v18.__sinval);
  v19.i32[3] = LODWORD(v18.__cosval);
  *(__n64 *)v20.f32 = simd_matrix3x3(v19);
  float32x4_t v70 = v21;
  float32x4_t v72 = v20;
  float32x4_t v68 = v22;
  if ([a1 cameraOrientation] == 1
    || [a1 cameraOrientation] == 2)
  {
    uint64_t v23 = 0;
    float32x4_t v25 = v70;
    float32x4_t v24 = v72;
    v24.i32[3] = 0;
    v25.i32[3] = 0;
    float32x4_t v26 = v68;
    v26.i32[3] = 0;
    float32x4_t v81 = v24;
    float32x4_t v82 = v25;
    float32x4_t v83 = v26;
    float32x4_t v84 = 0u;
    float32x4_t v85 = 0u;
    float32x4_t v86 = 0u;
    do
    {
      *(float32x4_t *)((char *)&v84 + v23 * 4) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v79, COERCE_FLOAT(*(_OWORD *)((char *)&v81 + v23 * 4))), v77, *(float32x2_t *)&v81.f32[v23], 1), v75, *(float32x4_t *)((char *)&v81 + v23 * 4), 2);
      v23 += 4;
    }
    while (v23 != 12);
  }
  else
  {
    uint64_t v27 = 0;
    float32x4_t v29 = v77;
    float32x4_t v28 = v79;
    v28.i32[3] = 0;
    v29.i32[3] = 0;
    float32x4_t v30 = v75;
    v30.i32[3] = 0;
    float32x4_t v81 = v28;
    float32x4_t v82 = v29;
    float32x4_t v83 = v30;
    float32x4_t v84 = 0u;
    float32x4_t v85 = 0u;
    float32x4_t v86 = 0u;
    do
    {
      *(float32x4_t *)((char *)&v84 + v27 * 4) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v72, COERCE_FLOAT(*(_OWORD *)((char *)&v81 + v27 * 4))), v70, *(float32x2_t *)&v81.f32[v27], 1), v68, *(float32x4_t *)((char *)&v81 + v27 * 4), 2);
      v27 += 4;
    }
    while (v27 != 12);
  }
  float32x4_t v31 = v84;
  float32x4_t v71 = v85;
  float32x4_t v73 = v84;
  v31.i32[3] = 0;
  float32x4_t v80 = v31;
  float32x4_t v32 = v85;
  v32.i32[3] = 0;
  float32x4_t v78 = v32;
  float32x4_t v69 = v86;
  float32x4_t v33 = v86;
  v33.i32[3] = 0;
  float32x4_t v76 = v33;
  [a1 gravity];
  uint32x4_t v35 = (uint32x4_t)vmvnq_s8(vorrq_s8((int8x16_t)vcltzq_f32(v34), (int8x16_t)vcgezq_f32(v34)));
  v35.i32[3] = v35.i32[2];
  double v36 = 0.0;
  if ((vmaxvq_u32(v35) & 0x80000000) == 0
    && [a1 cameraOrientation]
    && ([a1 visualizeViewport] & 1) == 0)
  {
    v37.i32[0] = 0;
    v38.i8[0] = a1[52];
    int8x16_t v39 = vdupq_lane_s8((int8x8_t)*(_OWORD *)&vceqq_s8(v38, v37), 0);
    float32x4_t v66 = (float32x4_t)vbslq_s8(v39, (int8x16_t)xmmword_1DD5ACF90, (int8x16_t)xmmword_1DD5AD570);
    float32x4_t v67 = (float32x4_t)vbslq_s8(v39, (int8x16_t)xmmword_1DD5AD580, (int8x16_t)xmmword_1DD5ACF80);
    [a1 gravity];
    float32x4_t v41 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v67, v40.f32[0]), (float32x4_t)xmmword_1DD5AD590, *(float32x2_t *)v40.f32, 1), v66, v40, 2);
    float32x4_t v74 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v73, v41.f32[0]), v71, *(float32x2_t *)v41.f32, 1), v69, v41, 2);
    float v42 = (double)(int)[a1 numCCWRotationsFromInputToFramingSpace] * 1.57079633;
    __float2 v43 = __sincosf_stret(v42 * 0.5);
    float32x4_t v44 = vmulq_n_f32((float32x4_t)xmmword_1DD5ACF90, v43.__sinval);
    float32x4_t v45 = v44;
    v45.i32[3] = LODWORD(v43.__cosval);
    float32x4_t v46 = vmulq_f32(v45, (float32x4_t)xmmword_1DD5AD000);
    int32x4_t v47 = (int32x4_t)vnegq_f32(v46);
    int8x16_t v48 = (int8x16_t)vtrn2q_s32((int32x4_t)v46, vtrn1q_s32((int32x4_t)v46, v47));
    float32x4_t v49 = vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v46, (int8x16_t)v47, 8uLL), *(float32x2_t *)v74.f32, 1), (float32x4_t)vextq_s8(v48, v48, 8uLL), v74.f32[0]);
    float32x4_t v50 = (float32x4_t)vrev64q_s32((int32x4_t)v46);
    v50.i32[0] = v47.i32[1];
    v50.i32[3] = v47.i32[2];
    float32x4_t v51 = vmlaq_laneq_f32(v49, v50, v74, 2);
    int32x4_t v52 = (int32x4_t)vnegq_f32(v51);
    int8x16_t v53 = (int8x16_t)vtrn2q_s32((int32x4_t)v51, vtrn1q_s32((int32x4_t)v51, v52));
    float32x4_t v54 = (float32x4_t)vrev64q_s32((int32x4_t)v51);
    v54.i32[0] = v52.i32[1];
    v54.i32[3] = v52.i32[2];
    *(float32x2_t *)v44.f32 = vadd_f32((float32x2_t)*(_OWORD *)&vmlaq_laneq_f32(vmulq_laneq_f32(v51, v45, 3), v54, v44, 2), (float32x2_t)*(_OWORD *)&vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v51, (int8x16_t)v52, 8uLL), *(float32x2_t *)v44.f32, 1), (float32x4_t)vextq_s8(v53, v53, 8uLL), v44.f32[0]));
    *(float32x2_t *)v52.i8 = vmul_f32(*(float32x2_t *)v44.f32, *(float32x2_t *)v44.f32);
    v52.i32[0] = vadd_f32(*(float32x2_t *)v52.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v52.i8, 1)).u32[0];
    *(float32x2_t *)v45.f32 = vrsqrte_f32((float32x2_t)v52.u32[0]);
    *(float32x2_t *)v45.f32 = vmul_f32(*(float32x2_t *)v45.f32, vrsqrts_f32((float32x2_t)v52.u32[0], vmul_f32(*(float32x2_t *)v45.f32, *(float32x2_t *)v45.f32)));
    *(float32x2_t *)v44.f32 = vmul_n_f32(*(float32x2_t *)v44.f32, vmul_f32(*(float32x2_t *)v45.f32, vrsqrts_f32((float32x2_t)v52.u32[0], vmul_f32(*(float32x2_t *)v45.f32, *(float32x2_t *)v45.f32))).f32[0]);
    *(float32x2_t *)v45.f32 = vrsqrte_f32((float32x2_t)1065353216);
    *(float32x2_t *)v45.f32 = vmul_f32(*(float32x2_t *)v45.f32, vrsqrts_f32((float32x2_t)1065353216, vmul_f32(*(float32x2_t *)v45.f32, *(float32x2_t *)v45.f32)));
    *(float32x2_t *)v52.i8 = vmul_n_f32((float32x2_t)0x3F80000000000000, vmul_f32(*(float32x2_t *)v45.f32, vrsqrts_f32((float32x2_t)1065353216, vmul_f32(*(float32x2_t *)v45.f32, *(float32x2_t *)v45.f32))).f32[0]);
    double v55 = asinf(vmlas_n_f32(vmuls_lane_f32(-v44.f32[0], *(float32x2_t *)v52.i8, 1), v44.f32[1], *(float *)v52.i32));
    if (v55 <= -0.523598776) {
      double v55 = -0.52359879;
    }
    float v56 = fmin(v55, 0.523598776);
    double v36 = v56;
  }
  [a1 additionalCameraRotation];
  float v58 = v36 + v57 * 3.14159265 / 180.0;
  __float2 v59 = __sincosf_stret(v58 * 0.5);
  float32x4_t v60 = vmulq_n_f32((float32x4_t)xmmword_1DD5ACF90, v59.__sinval);
  v60.i32[3] = LODWORD(v59.__cosval);
  *(__n64 *)v61.f32 = simd_matrix3x3(v60);
  uint64_t v64 = 0;
  float32x4_t v81 = v80;
  float32x4_t v82 = v78;
  float32x4_t v83 = v76;
  float32x4_t v84 = 0u;
  float32x4_t v85 = 0u;
  float32x4_t v86 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v84 + v64 * 4) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v61, COERCE_FLOAT(*(_OWORD *)((char *)&v81 + v64 * 4))), v62, *(float32x2_t *)&v81.f32[v64], 1), v63, *(float32x4_t *)((char *)&v81 + v64 * 4), 2);
    v64 += 4;
  }
  while (v64 != 12);
  return *(double *)v84.i64;
}

- (CGPoint)_projectPointInFramingSpaceLandscapeLeft:(CGPoint)a3 toDisplayRectInFramingSpaceLandscapeLeft:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v8 = a3.y;
  double v9 = a3.x;
  -[CinematicFramingRenderer _rotationMatrixForDisplayRect:](self, "_rotationMatrixForDisplayRect:", a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  simd_float3x3 v27 = __invert_f3(v26);
  float32x4_t v22 = (float32x4_t)v27.columns[0];
  float32x4_t v23 = (float32x4_t)v27.columns[2];
  float32x4_t v24 = (float32x4_t)v27.columns[1];
  v27.columns[0].f32[0] = v9;
  float v21 = tanf(v27.columns[0].f32[0]);
  float v11 = v8;
  int32x4_t v25 = (int32x4_t)vaddq_f32(v23, vmlaq_n_f32(vmulq_n_f32(v22, v21), v24, tanf(v11)));
  -[CinematicFramingRenderer _outputPlaneSizeForDisplayRect:](self, "_outputPlaneSizeForDisplayRect:", x, y, width, height);
  float64x2_t v13 = vcvtq_f64_f32(v12);
  __asm { FMOV            V2.2D, #0.5 }
  float64x2_t v19 = vdivq_f64(vaddq_f64(vmulq_f64(v13, _Q2), vcvtq_f64_f32(vdiv_f32(*(float32x2_t *)v25.i8, (float32x2_t)vdup_laneq_s32(v25, 2)))), v13);
  double v20 = v19.f64[1];
  result.double x = v19.f64[0];
  result.double y = v20;
  return result;
}

- (CGRect)_projectRectInFramingSpaceLandscapeLeft:(CGRect)a3 toDisplayRectInFramingSpaceLandscapeLeft:(CGRect)a4
{
  double y = a4.origin.y;
  double height = a4.size.height;
  double width = a4.size.width;
  double v5 = a4.origin.y;
  double x = a4.origin.x;
  CGFloat v7 = a3.size.height;
  CGFloat v8 = a3.size.width;
  CGFloat v9 = a3.origin.y;
  CGFloat v10 = a3.origin.x;
  double MidX = CGRectGetMidX(a3);
  v29.origin.double x = v10;
  v29.origin.double y = v9;
  v29.size.double width = v8;
  v29.size.double height = v7;
  -[CinematicFramingRenderer _projectPointInFramingSpaceLandscapeLeft:toDisplayRectInFramingSpaceLandscapeLeft:](self, "_projectPointInFramingSpaceLandscapeLeft:toDisplayRectInFramingSpaceLandscapeLeft:", MidX, CGRectGetMinY(v29), x, v5, width, height);
  double v26 = v13;
  v30.origin.double x = v10;
  v30.origin.double y = v9;
  v30.size.double width = v8;
  v30.size.double height = v7;
  double v14 = CGRectGetMidX(v30);
  v31.origin.double x = v10;
  v31.origin.double y = v9;
  v31.size.double width = v8;
  v31.size.double height = v7;
  -[CinematicFramingRenderer _projectPointInFramingSpaceLandscapeLeft:toDisplayRectInFramingSpaceLandscapeLeft:](self, "_projectPointInFramingSpaceLandscapeLeft:toDisplayRectInFramingSpaceLandscapeLeft:", v14, CGRectGetMaxY(v31), x, y, width, height);
  double v25 = v15;
  v32.origin.double x = v10;
  v32.origin.double y = v9;
  v32.size.double width = v8;
  v32.size.double height = v7;
  double MinX = CGRectGetMinX(v32);
  v33.origin.double x = v10;
  v33.origin.double y = v9;
  v33.size.double width = v8;
  v33.size.double height = v7;
  -[CinematicFramingRenderer _projectPointInFramingSpaceLandscapeLeft:toDisplayRectInFramingSpaceLandscapeLeft:](self, "_projectPointInFramingSpaceLandscapeLeft:toDisplayRectInFramingSpaceLandscapeLeft:", MinX, CGRectGetMidY(v33), x, y, width, height);
  double v18 = v17;
  v34.origin.double x = v10;
  v34.origin.double y = v9;
  v34.size.double width = v8;
  v34.size.double height = v7;
  double MaxX = CGRectGetMaxX(v34);
  v35.origin.double x = v10;
  v35.origin.double y = v9;
  v35.size.double width = v8;
  v35.size.double height = v7;
  -[CinematicFramingRenderer _projectPointInFramingSpaceLandscapeLeft:toDisplayRectInFramingSpaceLandscapeLeft:](self, "_projectPointInFramingSpaceLandscapeLeft:toDisplayRectInFramingSpaceLandscapeLeft:", MaxX, CGRectGetMidY(v35), x, y, width, height);
  double v21 = v20 - v18;
  double v22 = v26;
  double v23 = v25 - v26;
  double v24 = v18;
  result.size.double height = v23;
  result.size.double width = v21;
  result.origin.double y = v22;
  result.origin.double x = v24;
  return result;
}

- (CGRect)_warpRectInInputImageCoordinatesToFramingSpaceInLandscapeLeft:(CGRect)a3 calibrationParameters:(id *)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  CGFloat MidX = CGRectGetMidX(a3);
  v59.origin.CGFloat x = x;
  v59.origin.CGFloat y = y;
  v59.size.CGFloat width = width;
  v59.size.CGFloat height = height;
  CGFloat MinY = CGRectGetMinY(v59);
  v10.f64[0] = MidX;
  v10.f64[1] = MinY;
  long long v11 = *(_OWORD *)&a4[1].var4.var6;
  long long v55 = *(_OWORD *)&a4[1].var4.var2;
  long long v56 = v11;
  long long v12 = *(_OWORD *)&a4[1].var5.var6;
  long long v57 = *(_OWORD *)&a4[1].var5.var2;
  long long v58 = v12;
  long long v13 = *(_OWORD *)&a4->var5.var1;
  long long v51 = *(_OWORD *)&a4->var4.var5;
  long long v52 = v13;
  long long v14 = *(_OWORD *)&a4[1].var2;
  long long v53 = *(_OWORD *)&a4->var5.var5;
  long long v54 = v14;
  long long v15 = *(_OWORD *)&a4->var4.var1;
  long long v49 = *(_OWORD *)&a4->var1;
  long long v50 = v15;
  double v48 = warpPointInputImageToFramingSpaceInLandscapeLeft((uint64_t)&v49, vcvt_f32_f64(v10));
  v60.origin.CGFloat x = x;
  v60.origin.CGFloat y = y;
  v60.size.CGFloat width = width;
  v60.size.CGFloat height = height;
  CGFloat v44 = CGRectGetMidX(v60);
  v61.origin.CGFloat x = x;
  v61.origin.CGFloat y = y;
  v61.size.CGFloat width = width;
  v61.size.CGFloat height = height;
  CGFloat MaxY = CGRectGetMaxY(v61);
  v17.f64[0] = v44;
  v17.f64[1] = MaxY;
  long long v18 = *(_OWORD *)&a4[1].var4.var6;
  long long v55 = *(_OWORD *)&a4[1].var4.var2;
  long long v56 = v18;
  long long v19 = *(_OWORD *)&a4[1].var5.var6;
  long long v57 = *(_OWORD *)&a4[1].var5.var2;
  long long v58 = v19;
  long long v20 = *(_OWORD *)&a4->var5.var1;
  long long v51 = *(_OWORD *)&a4->var4.var5;
  long long v52 = v20;
  long long v21 = *(_OWORD *)&a4[1].var2;
  long long v53 = *(_OWORD *)&a4->var5.var5;
  long long v54 = v21;
  long long v22 = *(_OWORD *)&a4->var4.var1;
  long long v49 = *(_OWORD *)&a4->var1;
  long long v50 = v22;
  double v23 = warpPointInputImageToFramingSpaceInLandscapeLeft((uint64_t)&v49, vcvt_f32_f64(v17));
  v62.origin.CGFloat x = x;
  v62.origin.CGFloat y = y;
  v62.size.CGFloat width = width;
  v62.size.CGFloat height = height;
  CGFloat MinX = CGRectGetMinX(v62);
  v63.origin.CGFloat x = x;
  v63.origin.CGFloat y = y;
  v63.size.CGFloat width = width;
  v63.size.CGFloat height = height;
  CGFloat MidY = CGRectGetMidY(v63);
  v25.f64[0] = MinX;
  v25.f64[1] = MidY;
  long long v26 = *(_OWORD *)&a4[1].var4.var6;
  long long v55 = *(_OWORD *)&a4[1].var4.var2;
  long long v56 = v26;
  long long v27 = *(_OWORD *)&a4[1].var5.var6;
  long long v57 = *(_OWORD *)&a4[1].var5.var2;
  long long v58 = v27;
  long long v28 = *(_OWORD *)&a4->var5.var1;
  long long v51 = *(_OWORD *)&a4->var4.var5;
  long long v52 = v28;
  long long v29 = *(_OWORD *)&a4[1].var2;
  long long v53 = *(_OWORD *)&a4->var5.var5;
  long long v54 = v29;
  long long v30 = *(_OWORD *)&a4->var4.var1;
  long long v49 = *(_OWORD *)&a4->var1;
  long long v50 = v30;
  double v46 = warpPointInputImageToFramingSpaceInLandscapeLeft((uint64_t)&v49, vcvt_f32_f64(v25));
  v64.origin.CGFloat x = x;
  v64.origin.CGFloat y = y;
  v64.size.CGFloat width = width;
  v64.size.CGFloat height = height;
  CGFloat MaxX = CGRectGetMaxX(v64);
  v65.origin.CGFloat x = x;
  v65.origin.CGFloat y = y;
  v65.size.CGFloat width = width;
  v65.size.CGFloat height = height;
  CGFloat v31 = CGRectGetMidY(v65);
  v32.f64[0] = MaxX;
  v32.f64[1] = v31;
  long long v33 = *(_OWORD *)&a4[1].var4.var6;
  long long v55 = *(_OWORD *)&a4[1].var4.var2;
  long long v56 = v33;
  long long v34 = *(_OWORD *)&a4[1].var5.var6;
  long long v57 = *(_OWORD *)&a4[1].var5.var2;
  long long v58 = v34;
  long long v35 = *(_OWORD *)&a4->var5.var1;
  long long v51 = *(_OWORD *)&a4->var4.var5;
  long long v52 = v35;
  long long v36 = *(_OWORD *)&a4[1].var2;
  long long v53 = *(_OWORD *)&a4->var5.var5;
  long long v54 = v36;
  long long v37 = *(_OWORD *)&a4->var4.var1;
  long long v49 = *(_OWORD *)&a4->var1;
  long long v50 = v37;
  double v38 = warpPointInputImageToFramingSpaceInLandscapeLeft((uint64_t)&v49, vcvt_f32_f64(v32));
  double v39 = *((float *)&v48 + 1);
  double v40 = vsub_f32(*(float32x2_t *)&v38, *(float32x2_t *)&v46).f32[0];
  double v41 = COERCE_FLOAT(vsub_f32(*(float32x2_t *)&v23, *(float32x2_t *)&v48).i32[1]);
  double v42 = *(float *)&v46;
  result.size.CGFloat height = v41;
  result.size.CGFloat width = v40;
  result.origin.CGFloat y = v39;
  result.origin.CGFloat x = v42;
  return result;
}

- (int)_outputPlaneCcwRotations
{
  if (self->_cameraOrientationCorrectionEnabled) {
    return [(CinematicFramingRenderer *)self numCCWRotationsFromInputToFramingSpace];
  }
  else {
    return 0;
  }
}

- (CGRect)framingSpaceBounds
{
  [(CinematicFramingRenderer *)self _framingSpaceBoundsLandscapeLeft];
  int numCCWRotationsFromInputToFramingSpace = self->_numCCWRotationsFromInputToFramingSpace;

  double v8 = rotateRectCCW(numCCWRotationsFromInputToFramingSpace, v3, v4, v5, v6);
  result.size.CGFloat height = v11;
  result.size.CGFloat width = v10;
  result.origin.CGFloat y = v9;
  result.origin.CGFloat x = v8;
  return result;
}

- (float)maxAllowedViewportWidth
{
  [(CinematicFramingRenderer *)self framingSpaceBounds];
  CGFloat Width = CGRectGetWidth(v14);
  *(float *)&CGFloat Width = Width;
  [(CinematicFramingRenderer *)self getHeightForWidth:Width];
  CGFloat v5 = v4;
  [(CinematicFramingRenderer *)self framingSpaceBounds];
  CGFloat v6 = CGRectGetHeight(v15) + 0.000001;
  [(CinematicFramingRenderer *)self framingSpaceBounds];
  if (v6 > v5) {
    return CGRectGetWidth(*(CGRect *)&v7);
  }
  CGFloat Height = CGRectGetHeight(*(CGRect *)&v7);
  *(float *)&CGFloat Height = Height;

  [(CinematicFramingRenderer *)self getWidthForHeight:Height];
  return result;
}

- (float)getHeightDerivativeForWidth:(float)a3 widthDerivative:(float)a4
{
  [(CinematicFramingRenderer *)self outputAspectRatioInDeviceOrientation];
  LODWORD(v7) = LODWORD(v8);
  *(float *)&double v8 = a3;
  *(float *)&double v9 = a4;

  [(CinematicFramingRenderer *)self _getHeightDerivativeForWidth:v8 widthDerivative:v9 outputAspectRatioInDeviceOrientation:v7];
  return result;
}

- (float)getHeightForWidth:(float)a3
{
  [(CinematicFramingRenderer *)self outputAspectRatioInDeviceOrientation];
  LODWORD(v5) = LODWORD(v6);
  *(float *)&double v6 = a3;

  [(CinematicFramingRenderer *)self _getHeightForWidth:v6 outputAspectRatioInDeviceOrientation:v5];
  return result;
}

- (float)getWidthForHeight:(float)a3
{
  [(CinematicFramingRenderer *)self outputAspectRatioInDeviceOrientation];
  LODWORD(v5) = LODWORD(v6);
  *(float *)&double v6 = a3;

  [(CinematicFramingRenderer *)self _getWidthForHeight:v6 outputAspectRatioInDeviceOrientation:v5];
  return result;
}

- (CGRect)adjustDisplayRectToFitInFramingSpace:(CGRect)a3
{
  [(CinematicFramingRenderer *)self _adjustDisplayRectToFitInFramingSpaceLandscapeLeft:rotateRectCCW(4 - self->_numCCWRotationsFromInputToFramingSpace, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height)];
  int numCCWRotationsFromInputToFramingSpace = self->_numCCWRotationsFromInputToFramingSpace;

  double v9 = rotateRectCCW(numCCWRotationsFromInputToFramingSpace, v4, v5, v6, v7);
  result.size.CGFloat height = v12;
  result.size.CGFloat width = v11;
  result.origin.CGFloat y = v10;
  result.origin.CGFloat x = v9;
  return result;
}

- (float)outputAspectRatioInDeviceOrientation
{
  $470D365275581EF16070F5A11344F73E outputDimensions = self->_outputDimensions;
  v3.i64[0] = outputDimensions.width;
  v3.i64[1] = outputDimensions.height;
  float32x2_t v4 = vcvt_f32_f64(vmulq_f64((float64x2_t)self->_outputROI.size, vcvtq_f64_s64(v3)));
  LODWORD(result) = vdiv_f32(v4, (float32x2_t)vdup_lane_s32((int32x2_t)v4, 1)).u32[0];
  if (!self->_cameraOrientationCorrectionEnabled && (self->_numCCWRotationsFromInputToFramingSpace & 1) != 0) {
    return 1.0 / result;
  }
  return result;
}

- (CGRect)_framingSpaceBoundsLandscapeLeft
{
  [(CinematicFramingRenderer *)self calibrationParams];
  float v3 = atan2f(0.0, 0.0 + 0.0);
  float v4 = v3 + v3;
  float v5 = atan2f(0.0, 0.0 + 0.0);
  float v6 = v5 + v5;
  float fovLimit = self->_fovLimit;
  if (v4 >= fovLimit) {
    float v8 = self->_fovLimit;
  }
  else {
    float v8 = v4;
  }
  if (v6 >= fovLimit) {
    float v9 = self->_fovLimit;
  }
  else {
    float v9 = v6;
  }
  if (fovLimit <= 0.0)
  {
    float v8 = v4;
    float v9 = v6;
  }
  double v10 = (float)(v8 * -0.5);
  double v11 = (float)(v9 * -0.5);
  double v12 = v8;
  double v13 = v9;
  result.size.CGFloat height = v13;
  result.size.CGFloat width = v12;
  result.origin.CGFloat y = v11;
  result.origin.CGFloat x = v10;
  return result;
}

- (float)_getHeightDerivativeForWidth:(float)a3 widthDerivative:(float)a4 outputAspectRatioInDeviceOrientation:(float)a5
{
  float v5 = a4 * a5;
  float v6 = a5 * a5;
  __float2 v7 = __sincosf_stret(a3 * 0.5);
  return v5 / (float)((float)(v7.__sinval * v7.__sinval) + (float)((float)(v7.__cosval * v6) * v7.__cosval));
}

- (float)_getHeightForWidth:(float)a3 outputAspectRatioInDeviceOrientation:(float)a4
{
  float v5 = tanf(a3 * 0.5);
  float v6 = atanf(v5 / a4);
  return v6 + v6;
}

- (float)_getWidthForHeight:(float)a3 outputAspectRatioInDeviceOrientation:(float)a4
{
  float v5 = tanf(a3 * 0.5);
  float v6 = atanf(v5 * a4);
  return v6 + v6;
}

- (CGRect)_adjustDisplayRectToFitInFramingSpaceLandscapeLeft:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  -[CinematicFramingRenderer _scaleDisplayRectSizeToFit:](self, "_scaleDisplayRectSizeToFit:", a3.size.width, a3.size.height);
  double v9 = v8;
  double v11 = v10;
  v19.origin.CGFloat x = x;
  v19.origin.CGFloat y = y;
  v19.size.CGFloat width = width;
  v19.size.CGFloat height = height;
  CGFloat v12 = (CGRectGetWidth(v19) - v9) * 0.5;
  v20.origin.CGFloat x = x;
  v20.origin.CGFloat y = y;
  v20.size.CGFloat width = width;
  v20.size.CGFloat height = height;
  CGFloat v13 = (CGRectGetHeight(v20) - v11) * 0.5;
  v21.origin.CGFloat x = x;
  v21.origin.CGFloat y = y;
  v21.size.CGFloat width = width;
  v21.size.CGFloat height = height;
  CGRect v22 = CGRectInset(v21, v12, v13);

  -[CinematicFramingRenderer _moveDisplayRectToFitInFramingSpaceLandscapeLeft:](self, "_moveDisplayRectToFitInFramingSpaceLandscapeLeft:", v22.origin.x, v22.origin.y, v22.size.width, v22.size.height);
  result.size.CGFloat height = v17;
  result.size.CGFloat width = v16;
  result.origin.CGFloat y = v15;
  result.origin.CGFloat x = v14;
  return result;
}

- (CGSize)_scaleDisplayRectSizeToFit:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  int v6 = -1;
  double v7 = -1.0;
  do
  {
    int v8 = v6;
    int v9 = -3;
    double v10 = -1.0;
    do
    {
      [(CinematicFramingRenderer *)self calibrationParams];
      if (v18)
      {
        *(float *)&double v11 = width * v7 * 0.5;
        float v12 = height * v10 * 0.5;
        *((float *)&v11 + 1) = v12;
        double v17 = v11;
        if (!-[CinematicFramingRenderer _pointInFramingSpaceLandscapeLeftIsValid:withDisplayRect:](self, "_pointInFramingSpaceLandscapeLeftIsValid:withDisplayRect:"))
        {
          -[CinematicFramingRenderer _searchValidSizeForStartSize:invalidPoint:](self, "_searchValidSizeForStartSize:invalidPoint:", width, height, v17);
          double width = v13;
          double height = v14;
        }
      }
      double v10 = v10 + 2.0;
      v9 += 2;
    }
    while (v9 < 0);
    double v7 = v7 + 2.0;
    int v6 = v8 + 2;
  }
  while (v8 < 0);
  double v15 = width;
  double v16 = height;
  result.double height = v16;
  result.double width = v15;
  return result;
}

- (CGSize)_searchValidSizeForStartSize:(CGSize)a3 invalidPoint:
{
  float32x2_t v4 = v3;
  CGSize v15 = a3;
  long long v16 = *(long long *)&a3.height;
  CGFloat height = a3.height;
  float32x2_t v7 = vcvt_f32_f64((float64x2_t)a3);
  float v8 = 1.0;
  int v9 = 10;
  float v10 = 0.5;
  do
  {
    float v11 = (float)((float)(v8 + v10) * 0.5) + 0.05;
    float32x2_t v12 = vmul_n_f32(v7, v11);
    if (-[CinematicFramingRenderer _pointInFramingSpaceLandscapeLeftIsValid:withDisplayRect:](self, "_pointInFramingSpaceLandscapeLeftIsValid:withDisplayRect:", COERCE_DOUBLE(vmul_n_f32(v4, v11)), (float)-v12.f32[0] * 0.5, (float)-v12.f32[1] * 0.5, v12.f32[0], v12.f32[1], v15, v16))
    {
      float v10 = (float)(v8 + v10) * 0.5;
    }
    else
    {
      float v8 = (float)(v8 + v10) * 0.5;
    }
    --v9;
  }
  while (v9);
  double v13 = v15.width * v10;
  double v14 = *(double *)&v16 * v10;
  result.CGFloat height = v14;
  result.double width = v13;
  return result;
}

- (CGRect)_moveDisplayRectToFitInFramingSpaceLandscapeLeft:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(CinematicFramingRenderer *)self framingSpaceBounds];
  double v8 = CGRectGetWidth(v61);
  v62.origin.CGFloat x = x;
  v62.origin.CGFloat y = y;
  v62.size.CGFloat width = width;
  v62.size.CGFloat height = height;
  double v9 = 0.5;
  double v10 = (v8 - CGRectGetWidth(v62)) * 0.5;
  v63.origin.CGFloat x = x;
  v63.origin.CGFloat y = y;
  v63.size.CGFloat width = width;
  v63.size.CGFloat height = height;
  float v11 = fmin(v10, CGRectGetWidth(v63) * 0.05);
  [(CinematicFramingRenderer *)self framingSpaceBounds];
  double v12 = CGRectGetHeight(v64);
  v65.origin.CGFloat x = x;
  v65.origin.CGFloat y = y;
  v65.size.CGFloat width = width;
  v65.size.CGFloat height = height;
  double v13 = (v12 - CGRectGetHeight(v65)) * 0.5;
  v66.origin.CGFloat x = x;
  v66.origin.CGFloat y = y;
  v66.size.CGFloat width = width;
  v66.size.CGFloat height = height;
  float v14 = fmin(v13, CGRectGetHeight(v66) * 0.05);
  float v48 = v14;
  float v49 = v11;
  CGFloat v15 = (float)-v14;
  v67.origin.CGFloat x = x;
  v67.origin.CGFloat y = y;
  v67.size.CGFloat width = width;
  v67.size.CGFloat height = height;
  CGRect v68 = CGRectInset(v67, (float)-v11, v15);
  double v16 = v68.origin.x;
  double v17 = v68.origin.y;
  double v18 = v68.size.width;
  double v19 = v68.size.height;
  float v20 = 1.0;
  __asm { FMOV            V0.2D, #0.5 }
  CGPoint origin = v68.origin;
  float v24 = -1.0;
  do
  {
    double v56 = (float)(v24 + v20) * v9;
    double v51 = v24;
    float v50 = v24;
    _ZF = v24 == v20 || v24 == -1.0;
    float v26 = 0.2;
    if (_ZF) {
      float v26 = 2.0;
    }
    float v55 = v26;
    float v27 = -1.0;
    do
    {
      v69.origin.CGFloat x = v16;
      v69.origin.CGFloat y = v17;
      v69.size.CGFloat width = v18;
      v69.size.CGFloat height = v19;
      double MinX = CGRectGetMinX(v69);
      v70.origin.CGFloat x = v16;
      v70.origin.CGFloat y = v17;
      v70.size.CGFloat width = v18;
      v70.size.CGFloat height = v19;
      float v29 = MinX + v56 * CGRectGetWidth(v70);
      float v57 = v29;
      v71.origin.CGFloat x = v16;
      v71.origin.CGFloat y = v17;
      v71.size.CGFloat width = v18;
      v71.size.CGFloat height = v19;
      double MinY = CGRectGetMinY(v71);
      v72.origin.CGFloat x = v16;
      v72.origin.CGFloat y = v17;
      v72.size.CGFloat width = v18;
      v72.size.CGFloat height = v19;
      *(float *)&unsigned int v31 = MinY + (float)(v27 + v20) * 0.5 * CGRectGetHeight(v72);
      double v58 = COERCE_DOUBLE(__PAIR64__(v31, LODWORD(v57)));
      if (!-[CinematicFramingRenderer _pointInFramingSpaceLandscapeLeftIsValid:withDisplayRect:](self, "_pointInFramingSpaceLandscapeLeftIsValid:withDisplayRect:"))
      {
        v73.origin.CGFloat x = v16;
        v73.origin.CGFloat y = v17;
        v73.size.CGFloat width = v18;
        v73.size.CGFloat height = v19;
        CGFloat v52 = CGRectGetWidth(v73);
        v74.origin.CGFloat x = v16;
        v74.origin.CGFloat y = v17;
        v74.size.CGFloat width = v18;
        v74.size.CGFloat height = v19;
        CGFloat v32 = CGRectGetHeight(v74);
        v33.f64[0] = v52;
        v33.f64[1] = v32;
        v34.f64[0] = v51;
        v34.f64[1] = v27;
        float64x2_t v53 = v34;
        -[CinematicFramingRenderer _searchEarliestValidPointOnIntervalWithStart:andEnd:displayRect:](self, "_searchEarliestValidPointOnIntervalWithStart:andEnd:displayRect:", v58, COERCE_DOUBLE(vcvt_f32_f64(vmulq_f64(vmulq_f64(v33, v34), (float64x2_t)origin))), v16, v17, v18, v19);
        float32x2_t v36 = v35;
        v75.origin.CGFloat x = v16;
        v75.origin.CGFloat y = v17;
        v75.size.CGFloat width = v18;
        v75.size.CGFloat height = v19;
        CGFloat v59 = CGRectGetWidth(v75);
        v76.origin.CGFloat x = v16;
        v76.origin.CGFloat y = v17;
        v76.size.CGFloat width = v18;
        v76.size.CGFloat height = v19;
        CGFloat v37 = CGRectGetHeight(v76);
        v38.f64[0] = v59;
        v38.f64[1] = v37;
        float32x2_t v39 = vsub_f32(v36, vcvt_f32_f64(vmulq_f64(vmulq_f64(v38, v53), (float64x2_t)origin)));
        HIDWORD(v59) = v39.i32[1];
        double v40 = v39.f32[0];
        double v41 = v16;
        v38.f64[0] = v17;
        double v42 = v18;
        double v43 = v19;
        double v16 = v40 - CGRectGetWidth(*(CGRect *)((char *)&v38 - 8)) * 0.5;
        v77.origin.CGFloat x = v16;
        v77.origin.CGFloat y = v17;
        v77.size.CGFloat width = v18;
        v77.size.CGFloat height = v19;
        double v17 = *((float *)&v59 + 1) - CGRectGetHeight(v77) * 0.5;
      }
      double v9 = 0.5;
      float v20 = 1.0;
      float v27 = v55 + v27;
    }
    while (v27 <= 1.0);
    float v24 = v50 + 0.1;
  }
  while ((float)(v50 + 0.1) <= 1.0);
  double v44 = v16;
  double v45 = v17;
  double v46 = v18;
  double v47 = v19;

  return CGRectInset(*(CGRect *)&v44, v49, v48);
}

- (float32x2_t)_searchEarliestValidPointOnIntervalWithStart:(float32x2_t)a3 andEnd:(CGFloat)a4 displayRect:(CGFloat)a5
{
  double v21 = a2.n128_f32[1];
  double v22 = a2.n128_f32[0];
  int v13 = 10;
  do
  {
    __n128 v23 = a2;
    int8x8_t v24 = (int8x8_t)vmul_f32(vadd_f32((float32x2_t)a2.n128_u64[0], a3), (float32x2_t)0x3F0000003F000000);
    v25.origin.CGFloat x = a4;
    v25.origin.CGFloat y = a5;
    v25.size.CGFloat width = a6;
    v25.size.CGFloat height = a7;
    CGFloat v14 = CGRectGetMinX(v25) + *(float *)v24.i32 - v22;
    v26.origin.CGFloat x = a4;
    v26.origin.CGFloat y = a5;
    v26.size.CGFloat width = a6;
    v26.size.CGFloat height = a7;
    CGFloat v15 = CGRectGetMinY(v26) + *(float *)&v24.i32[1] - v21;
    v27.origin.CGFloat x = a4;
    v27.origin.CGFloat y = a5;
    v27.size.CGFloat width = a6;
    v27.size.CGFloat height = a7;
    double Width = CGRectGetWidth(v27);
    v28.origin.CGFloat x = a4;
    v28.origin.CGFloat y = a5;
    v28.size.CGFloat width = a6;
    v28.size.CGFloat height = a7;
    int v17 = objc_msgSend(a1, "_pointInFramingSpaceLandscapeLeftIsValid:withDisplayRect:", *(double *)&v24, v14, v15, Width, CGRectGetHeight(v28));
    a2.n128_u64[1] = v23.n128_u64[1];
    if (v17) {
      unsigned int v18 = -1;
    }
    else {
      unsigned int v18 = 0;
    }
    int8x8_t v19 = (int8x8_t)vdup_n_s32(v18);
    a2.n128_u64[0] = (unint64_t)vbsl_s8(v19, (int8x8_t)v23.n128_u64[0], v24);
    a3 = (float32x2_t)vbsl_s8(v19, v24, (int8x8_t)a3);
    --v13;
  }
  while (v13);
  return a3;
}

- (BOOL)_pointInFramingSpaceLandscapeLeftIsValid:(CGRect)a3 withDisplayRect:
{
  double v4 = v3;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  float v41 = *((float *)&a3.origin.x + 1);
  double v9 = *(float *)&a3.origin.x;
  v55.origin.CGFloat x = a3.origin.y;
  v55.origin.double y = a3.size.width;
  v55.size.double width = a3.size.height;
  v55.size.double height = v3;
  float v10 = v9 - CGRectGetMidX(v55);
  float v42 = tanf(v10);
  v56.origin.CGFloat x = y;
  v56.origin.double y = width;
  v56.size.double width = height;
  v56.size.double height = v4;
  float v11 = v41 - CGRectGetMidY(v56);
  float v12 = tanf(v11);
  __asm { FMOV            V1.4S, #1.0 }
  float v38 = v12;
  uint64_t v39 = _Q1.i64[1];
  _Q1.i64[0] = __PAIR64__(LODWORD(v12), LODWORD(v42));
  float32x4_t v40 = _Q1;
  -[CinematicFramingRenderer _fisheyeStrengthForDisplayRect:](self, "_fisheyeStrengthForDisplayRect:", y, width, height, v4);
  float v18 = self->_stereographicFisheyeF
      * 4.0
      / -((float)((float)(v38 * v38) + (float)(v42 * v42))
        - self->_stereographicFisheyeF * 4.0 * self->_stereographicFisheyeF);
  v19.i64[1] = v39;
  v19.f32[0] = v42 * v18;
  v19.f32[1] = v38 * v18;
  float32x4_t v43 = vmlaq_n_f32(vmulq_n_f32(v40, 1.0 - v20), v19, v20);
  -[CinematicFramingRenderer _rotationMatrixForDisplayRect:](self, "_rotationMatrixForDisplayRect:", y, width, height, v4);
  int32x4_t v23 = vzip1q_s32(v21, v22);
  int32x4_t v25 = vzip1q_s32(v24, (int32x4_t)0);
  int32x4_t v26 = vzip1q_s32(v23, v25);
  int32x4_t v27 = vzip2q_s32(v23, v25);
  int32x4_t v28 = vzip1q_s32(vzip2q_s32(v21, v22), vdupq_laneq_s32(v24, 2));
  float32x4_t v29 = (float32x4_t)vzip1q_s32(vzip1q_s32(v26, v28), v27);
  float32x4_t v30 = (float32x4_t)vtrn2q_s32(v26, v27);
  v30.i32[2] = v28.i32[1];
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  int32x4_t v47 = 0u;
  int32x4_t v48 = 0u;
  float32x4_t v44 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v29, v43.f32[0]), v30, *(float32x2_t *)v43.f32, 1), (float32x4_t)vzip1q_s32(vzip2q_s32(v26, v28), vdupq_lane_s32(*(int32x2_t *)v22.i8, 1)), v43, 2);
  long long v45 = 0u;
  int32x4_t v46 = 0u;
  [(CinematicFramingRenderer *)self calibrationParams];
  float32x4_t v31 = (float32x4_t)vtrn2q_s32(v46, v47);
  v31.i32[2] = v48.i32[1];
  int32x4_t v32 = (int32x4_t)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)vzip1q_s32(vzip1q_s32(v46, v48), v47), v44.f32[0]), v31, *(float32x2_t *)v44.f32, 1), (float32x4_t)vzip1q_s32(vzip2q_s32(v46, v48), vdupq_laneq_s32(v47, 2)), v44, 2);
  float32x2_t v33 = distortPoint((float32x2_t *)&v45, vdiv_f32(*(float32x2_t *)v32.i8, (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v32, 2)));
  if (SDWORD1(v50) >= 1)
  {
    float32x2_t v34 = vsub_f32(v33, *(float32x2_t *)((char *)&v49 + 8));
    if (sqrtf(vaddv_f32(vmul_f32(v34, v34))) > (float)SDWORD1(v50)) {
      return 0;
    }
  }
  float32x2_t v35 = vdiv_f32(v33, *(float32x2_t *)&v45);
  BOOL v36 = v35.f32[0] >= 0.0;
  if (v35.f32[1] < 0.0) {
    BOOL v36 = 0;
  }
  if (v35.f32[0] >= 1.0) {
    BOOL v36 = 0;
  }
  return v35.f32[1] < 1.0 && v36;
}

- (void)initializeMetal
{
  v15[1] = *MEMORY[0x1E4F143B8];
  CGFloat v3 = [MEMORY[0x1E4F55F60] metalDevice];
  metalDevice = self->_metalDevice;
  self->_metalDevice = v3;

  float v5 = (MTLCommandQueue *)[(MTLDevice *)self->_metalDevice newCommandQueue];
  commandQueue = self->_commandQueue;
  self->_commandQueue = v5;

  float32x2_t v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  double v8 = self->_metalDevice;
  id v13 = 0;
  double v9 = (MTLLibrary *)[(MTLDevice *)v8 newDefaultLibraryWithBundle:v7 error:&v13];
  id v10 = v13;
  librardouble y = self->_library;
  self->_librardouble y = v9;

  if ([(CinematicFramingRenderer *)self _compileShaders])
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  else
  {
    uint64_t v14 = *MEMORY[0x1E4F24C78];
    v15[0] = &unk_1F38CCC90;
    CFDictionaryRef v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    CVMetalTextureCacheCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v12, self->_metalDevice, 0, &self->_cvMetalTextureCacheRef);
  }
}

- (int)_compileShaders
{
  int v2 = [(CinematicFramingRenderer *)self _createComputePipelinesForShaders:&unk_1F38CCDF0];
  if (v2)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  return v2;
}

- (int)_createComputePipelinesForShaders:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  obuint64_t j = a3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v22;
    pipelineComputeStates = self->_pipelineComputeStates;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(obj);
        }
        double v9 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v10 = [v9 objectForKeyedSubscript:@"index"];
        int v11 = [v10 unsignedIntValue];

        CFDictionaryRef v12 = [v9 objectForKeyedSubscript:@"pixelFormat"];
        uint64_t v13 = [v12 unsignedIntValue];

        MTLPixelFormatGetInfoForDevice();
        if ((v20 & 0x10) != 0)
        {
          uint64_t v14 = [v9 objectForKeyedSubscript:@"kernelName"];
          uint64_t v15 = [(CinematicFramingRenderer *)self _compileComputeShader:v14 pixelFormat:v13];
          double v16 = pipelineComputeStates[v11];
          pipelineComputeStates[v11] = (MTLComputePipelineState *)v15;

          if (!pipelineComputeStates[v11])
          {
            fig_log_get_emitter();
            FigDebugAssert3();
            int v17 = -12786;
            goto LABEL_11;
          }
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  int v17 = 0;
LABEL_11:

  return v17;
}

- (id)_compileComputeShader:(id)a3 pixelFormat:(unint64_t)a4
{
  id v5 = a3;
  if (!v5)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    float32x2_t v7 = 0;
LABEL_11:
    id v10 = 0;
    goto LABEL_6;
  }
  uint64_t v6 = objc_opt_new();
  float32x2_t v7 = v6;
  if (!v6
    || ([v6 setLabel:v5],
        double v8 = (void *)[(MTLLibrary *)self->_library newFunctionWithName:v5],
        [v7 setComputeFunction:v8],
        v8,
        [v7 computeFunction],
        double v9 = objc_claimAutoreleasedReturnValue(),
        v9,
        !v9))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_11;
  }
  id v10 = (void *)[(MTLDevice *)self->_metalDevice newComputePipelineStateWithDescriptor:v7 options:0 reflection:0 error:0];
  if (!v10)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
LABEL_6:

  return v10;
}

- (void)_setShaderParametersForDisplayRect:(CGRect)a3 outputROI:(CGRect)a4 calibrationParameters:(id *)a5 commandEncoder:(id)a6
{
  CGFloat width = a4.size.width;
  CGFloat height = a4.size.height;
  CGFloat x = a4.origin.x;
  CGFloat y = a4.origin.y;
  double v7 = a3.size.height;
  double v8 = a3.size.width;
  double v9 = a3.origin.y;
  double v10 = a3.origin.x;
  id v12 = a6;
  -[CinematicFramingRenderer _fisheyeStrengthForDisplayRect:](self, "_fisheyeStrengthForDisplayRect:", v10, v9, v8, v7);
  unsigned int v14 = v13;
  -[CinematicFramingRenderer _rotationMatrixForDisplayRect:](self, "_rotationMatrixForDisplayRect:", v10, v9, v8, v7);
  int32x4_t v31 = v16;
  int32x4_t v32 = v15;
  long long v33 = v17;
  -[CinematicFramingRenderer _outputPlaneSizeForDisplayRect:](self, "_outputPlaneSizeForDisplayRect:", v10, v9, v8, v7);
  float32x2_t v19 = v18;
  float32x2_t v20 = vmul_f32(v18, (float32x2_t)0xBF000000BF000000);
  int v21 = [(CinematicFramingRenderer *)self _outputPlaneCcwRotations];
  v22.f64[0] = x;
  v22.f64[1] = y;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v47 = 0u;
  v23.f64[0] = width;
  v23.f64[1] = height;
  memset(v36, 0, sizeof(v36));
  float32x2_t v37 = vcvt_f32_f64(v22);
  float32x2_t v38 = vcvt_f32_f64(v23);
  float32x2_t v39 = v20;
  float32x2_t v40 = v19;
  uint64_t v42 = v33;
  uint64_t v44 = DWORD1(v33);
  unint64_t v41 = vzip1q_s32(v32, v31).u64[0];
  uint64_t v46 = DWORD2(v33);
  unint64_t v43 = vtrn2q_s32(v32, v31).u64[0];
  unint64_t v45 = vzip1q_s32(vdupq_laneq_s32(v32, 2), vdupq_laneq_s32(v31, 2)).u64[0];
  long long v24 = *(_OWORD *)&a5[1].var4.var6;
  long long v53 = *(_OWORD *)&a5[1].var4.var2;
  long long v54 = v24;
  long long v25 = *(_OWORD *)&a5[1].var5.var6;
  long long v55 = *(_OWORD *)&a5[1].var5.var2;
  long long v56 = v25;
  long long v26 = *(_OWORD *)&a5->var5.var1;
  long long v49 = *(_OWORD *)&a5->var4.var5;
  long long v50 = v26;
  long long v27 = *(_OWORD *)&a5[1].var2;
  long long v51 = *(_OWORD *)&a5->var5.var5;
  long long v52 = v27;
  long long v28 = *(_OWORD *)&a5->var4.var1;
  long long v47 = *(_OWORD *)&a5->var1;
  long long v48 = v28;
  *(float *)&long long v57 = self->_stereographicFisheyeF;
  *(void *)((char *)&v57 + 4) = __PAIR64__(v21, v14);
  [v12 setBytes:v36 length:464 atIndex:0];
}

- ($2825F4736939C4A6D3AD43837233062D)outputDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_outputDimensions;
}

- (int)numCCWRotationsFromInputToFramingSpace
{
  return self->_numCCWRotationsFromInputToFramingSpace;
}

- (__n128)gravity
{
  return a1[4];
}

- ($DB21A1D7CD9E59D36D824D8119A7BF2D)calibrationParams
{
  long long v3 = *(_OWORD *)&self[3].var4.var4;
  *(_OWORD *)&retstr[1].var4.var2 = *(_OWORD *)&self[3].var4.var0;
  *(_OWORD *)&retstr[1].var4.var6 = v3;
  long long v4 = *(_OWORD *)&self[3].var5.var4;
  *(_OWORD *)&retstr[1].var5.var2 = *(_OWORD *)&self[3].var5.var0;
  *(_OWORD *)&retstr[1].var5.var6 = v4;
  long long v5 = *(_OWORD *)&self[2].var4.var7;
  *(_OWORD *)&retstr->var4.var5 = *(_OWORD *)&self[2].var4.var3;
  *(_OWORD *)&retstr->var5.var1 = v5;
  long long v6 = *(_OWORD *)&self[2].var5.var7;
  *(_OWORD *)&retstr->var5.var5 = *(_OWORD *)&self[2].var5.var3;
  *(_OWORD *)&retstr[1].var2 = v6;
  long long v7 = *(_OWORD *)&self[2].var3;
  *(_OWORD *)&retstr->var1 = *(_OWORD *)&self[1].var5.var6;
  *(_OWORD *)&retstr->var4.var1 = v7;
  return self;
}

- (float)additionalCameraRotation
{
  return self->_additionalCameraRotation;
}

- (int)sensorID
{
  return self->_sensorID;
}

- (CinematicFramingSessionOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
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

- (void)setOutputROI:(CGRect)a3
{
  self->_outputROI = a3;
}

- (BOOL)cameraOrientationCorrectionEnabled
{
  return self->_cameraOrientationCorrectionEnabled;
}

- (void)setCameraOrientationCorrectionEnabled:(BOOL)a3
{
  self->_cameraOrientationCorrectionEnabled = a3;
}

- (float)fovLimit
{
  return self->_fovLimit;
}

- (void)setFovLimit:(float)a3
{
  self->_float fovLimit = a3;
}

- (BOOL)visualizeViewport
{
  return self->_visualizeViewport;
}

- (void)setVisualizeViewport:(BOOL)a3
{
  self->_visualizeViewport = a3;
}

- (BOOL)frontCameraHas180DegreesRotation
{
  return self->_frontCameraHas180DegreesRotation;
}

- (void)setFrontCameraHas180DegreesRotation:(BOOL)a3
{
  self->_frontCameraHas180DegreesRotation = a3;
}

- (void).cxx_destruct
{
  uint64_t v3 = 0;
  long long v4 = &self->_kalmanFilterManager[1];
  do
    objc_storeStrong((id *)&v4[v3--], 0);
  while (v3 != -2);
  objc_storeStrong((id *)&self->_options, 0);
  for (uint64_t i = 0; i != -2; --i)
    objc_storeStrong((id *)&self->_pipelineComputeStates[i + 1], 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);

  objc_storeStrong((id *)&self->_metalDevice, 0);
}

@end