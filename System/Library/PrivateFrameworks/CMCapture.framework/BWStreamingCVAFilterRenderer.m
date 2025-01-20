@interface BWStreamingCVAFilterRenderer
+ (void)initialize;
- (BOOL)adjustsMetadata;
- (BOOL)stageRenderingEnabled;
- (BOOL)studioAndContourRenderingEnabled;
- (BOOL)supportsAnimation;
- (BWStreamingCVAFilterRenderer)initWithCaptureDevice:(id)a3 studioAndContourRenderingEnabled:(BOOL)a4 stageRenderingEnabled:(BOOL)a5 depthDataSource:(int)a6 foregroundBlurEnabled:(BOOL)a7 depthFilterRenderingIsAfterPreviewStitcher:(BOOL)a8 commandQueue:(id)a9 priority:(unsigned int)a10 mirroredForMetadataAdjustment:(BOOL)a11 rotationDegreesForMetadataAdjustment:(int)a12 secondaryStreamingPersonSegmentationEnabled:(BOOL)a13;
- (NSString)displayName;
- (float)portraitLightingEffectStrength;
- (float)simulatedAperture;
- (int)prepareForRenderingWithParameters:(id)a3 inputVideoFormat:(id)a4 inputMediaPropertiesByAttachedMediaKey:(id)a5;
- (signed)type;
- (uint64_t)mattingRequest:(uint64_t)result didCompleteMattingWithResult:;
- (void)_removeFaceVisibilityForFacesMissingFromDetectedFaces:(uint64_t)a1;
- (void)adjustMetadataOfSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (void)dealloc;
- (void)disparityPostprocessingRequest:(void *)a3 didCompleteDisparityPostprocessingWithResult:;
- (void)portraitRequest:(void *)a3 didCompletePortraitWithResult:(uint64_t)a4 completionHandler:;
- (void)renderUsingParameters:(id)a3 inputPixelBuffer:(__CVBuffer *)a4 inputSampleBuffer:(opaqueCMSampleBuffer *)a5 originalPixelBuffer:(__CVBuffer *)a6 processedPixelBuffer:(__CVBuffer *)a7 completionHandler:(id)a8;
- (void)setPortraitLightingEffectStrength:(float)a3;
- (void)setSimulatedAperture:(float)a3;
@end

@implementation BWStreamingCVAFilterRenderer

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (BWStreamingCVAFilterRenderer)initWithCaptureDevice:(id)a3 studioAndContourRenderingEnabled:(BOOL)a4 stageRenderingEnabled:(BOOL)a5 depthDataSource:(int)a6 foregroundBlurEnabled:(BOOL)a7 depthFilterRenderingIsAfterPreviewStitcher:(BOOL)a8 commandQueue:(id)a9 priority:(unsigned int)a10 mirroredForMetadataAdjustment:(BOOL)a11 rotationDegreesForMetadataAdjustment:(int)a12 secondaryStreamingPersonSegmentationEnabled:(BOOL)a13
{
  BOOL v16 = a5;
  v24.receiver = self;
  v24.super_class = (Class)BWStreamingCVAFilterRenderer;
  v19 = [(BWStreamingCVAFilterRenderer *)&v24 init];
  if (v19)
  {
    v19->_sharedContextQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.bwgraph.streaming-cva-renderer.context-queue", 0);
    v19->_notificationQueue = (OS_dispatch_queue *)FigDispatchQueueCreateWithPriority();
    v19->_commandQueue = (MTLCommandQueue *)a9;
    v19->_depthFilterRenderingIsAfterPreviewStitcher = a8;
    v19->_animator = -[BWStreamingCVAFilterRendererAnimator initWithEffectStatus:overCaptureEnabled:]([BWStreamingCVAFilterRendererAnimator alloc], "initWithEffectStatus:overCaptureEnabled:", [a3 shallowDepthOfFieldEffectStatus], objc_msgSend(a3, "overCaptureEnabled"));
    v19->_previousForegroundSegmentationPixelBuffer = 0;
    sharedContextQueue = v19->_sharedContextQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __323__BWStreamingCVAFilterRenderer_initWithCaptureDevice_studioAndContourRenderingEnabled_stageRenderingEnabled_depthDataSource_foregroundBlurEnabled_depthFilterRenderingIsAfterPreviewStitcher_commandQueue_priority_mirroredForMetadataAdjustment_rotationDegreesForMetadataAdjustment_secondaryStreamingPersonSegmentationEnabled___block_invoke;
    block[3] = &unk_1E5C24430;
    block[4] = v19;
    dispatch_sync(sharedContextQueue, block);
    v19->_depthDataSource = a6;
    v19->_captureDevice = (BWFigVideoCaptureDevice *)a3;
    v19->_studioAndContourRenderingEnabled = a4;
    v19->_stageRenderingEnabled = v16;
    if (v16)
    {
      v21 = objc_alloc_init(BWSpringSimulation);
      v19->_stageProxyLiveRenderingSpringSimulation = v21;
      [(BWSpringSimulation *)v21 resetWithInput:1.0 initialOutput:0.0 initialVelocity:0.0];
      [(BWSpringSimulation *)v19->_stageProxyLiveRenderingSpringSimulation setTension:800.0];
      [(BWSpringSimulation *)v19->_stageProxyLiveRenderingSpringSimulation setFriction:20.0];
    }
    v19->_objectVisibilityByID = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v19->_objectVisibilityByIDLock._os_unfair_lock_opaque = 0;
    v19->_postprocessedFaces = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v19->_foregroundBlurEnabled = a7;
    v19->_mirroredForMetadataAdjustment = a11;
    v19->_rotationDegreesForMetadataAdjustment = a12;
    v19->_secondaryStreamingPersonSegmentationEnabled = a13;
  }
  return v19;
}

uint64_t __323__BWStreamingCVAFilterRenderer_initWithCaptureDevice_studioAndContourRenderingEnabled_stageRenderingEnabled_depthDataSource_foregroundBlurEnabled_depthFilterRenderingIsAfterPreviewStitcher_commandQueue_priority_mirroredForMetadataAdjustment_rotationDegreesForMetadataAdjustment_secondaryStreamingPersonSegmentationEnabled___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 176) isDepthAvailable];
  *(unsigned char *)(*(void *)(a1 + 32) + 24) = result;
  *(_DWORD *)(*(void *)(a1 + 32) + 56) = 0;
  *(_DWORD *)(*(void *)(a1 + 32) + 60) = 2143289344;
  return result;
}

- (void)dealloc
{
  sharedContextQueue = self->_sharedContextQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__BWStreamingCVAFilterRenderer_dealloc__block_invoke;
  block[3] = &unk_1E5C24430;
  block[4] = self;
  dispatch_sync(sharedContextQueue, block);

  mattingBuffer = self->_mattingBuffer;
  if (mattingBuffer) {
    CFRelease(mattingBuffer);
  }
  previousForegroundSegmentationPixelBuffer = self->_previousForegroundSegmentationPixelBuffer;
  if (previousForegroundSegmentationPixelBuffer) {
    CFRelease(previousForegroundSegmentationPixelBuffer);
  }

  v6.receiver = self;
  v6.super_class = (Class)BWStreamingCVAFilterRenderer;
  [(BWStreamingCVAFilterRenderer *)&v6 dealloc];
}

void __39__BWStreamingCVAFilterRenderer_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(const void **)(v2 + 32);
  if (v3)
  {
    CFRelease(v3);
    *(void *)(*(void *)(a1 + 32) + 32) = 0;
    uint64_t v2 = *(void *)(a1 + 32);
  }

  v4 = *(void **)(*(void *)(a1 + 32) + 80);
}

- (void)setSimulatedAperture:(float)a3
{
  sharedContextQueue = self->_sharedContextQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __53__BWStreamingCVAFilterRenderer_setSimulatedAperture___block_invoke;
  v4[3] = &unk_1E5C262A0;
  v4[4] = self;
  float v5 = a3;
  dispatch_sync(sharedContextQueue, v4);
}

float __53__BWStreamingCVAFilterRenderer_setSimulatedAperture___block_invoke(uint64_t a1)
{
  float result = *(float *)(a1 + 40);
  *(float *)(*(void *)(a1 + 32) + 56) = result;
  return result;
}

- (float)simulatedAperture
{
  uint64_t v6 = 0;
  v7 = (float *)&v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  sharedContextQueue = self->_sharedContextQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__BWStreamingCVAFilterRenderer_simulatedAperture__block_invoke;
  v5[3] = &unk_1E5C246B8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(sharedContextQueue, v5);
  float v3 = v7[6];
  _Block_object_dispose(&v6, 8);
  return v3;
}

float __49__BWStreamingCVAFilterRenderer_simulatedAperture__block_invoke(uint64_t a1)
{
  float result = *(float *)(*(void *)(a1 + 32) + 56);
  *(float *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setPortraitLightingEffectStrength:(float)a3
{
  sharedContextQueue = self->_sharedContextQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __66__BWStreamingCVAFilterRenderer_setPortraitLightingEffectStrength___block_invoke;
  v4[3] = &unk_1E5C262A0;
  v4[4] = self;
  float v5 = a3;
  dispatch_sync(sharedContextQueue, v4);
}

float __66__BWStreamingCVAFilterRenderer_setPortraitLightingEffectStrength___block_invoke(uint64_t a1)
{
  float result = *(float *)(a1 + 40);
  *(float *)(*(void *)(a1 + 32) + 60) = result;
  return result;
}

- (float)portraitLightingEffectStrength
{
  uint64_t v6 = 0;
  v7 = (float *)&v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  sharedContextQueue = self->_sharedContextQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __62__BWStreamingCVAFilterRenderer_portraitLightingEffectStrength__block_invoke;
  v5[3] = &unk_1E5C246B8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(sharedContextQueue, v5);
  float v3 = v7[6];
  _Block_object_dispose(&v6, 8);
  return v3;
}

float __62__BWStreamingCVAFilterRenderer_portraitLightingEffectStrength__block_invoke(uint64_t a1)
{
  float result = *(float *)(*(void *)(a1 + 32) + 60);
  *(float *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (signed)type
{
  return 0;
}

- (NSString)displayName
{
  return (NSString *)@"AppleCVA Renderer";
}

- (int)prepareForRenderingWithParameters:(id)a3 inputVideoFormat:(id)a4 inputMediaPropertiesByAttachedMediaKey:(id)a5
{
  v57[4] = *MEMORY[0x1E4F143B8];
  id v52 = 0;
  if (!a3) {
    goto LABEL_154;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  int v10 = [a3 prepareForRenderingWithInputVideoFormat:a4];
  if (!v10)
  {
LABEL_154:
    if (!self->_portraitVideoPipeline)
    {
      self->_hasSeenDepth = 0;
      *(void *)&self->_maxFramesWithoutDepth = 1;
      self->_hasSeenSegmentation = 0;
      *(void *)&self->_maxFramesWithoutSegmentation = 6;
      uint64_t v11 = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", @"Depth"), "resolvedVideoFormat");
      if (!a4) {
        goto LABEL_67;
      }
      v12 = (void *)v11;
      if (!self->_depthDataSource && !v11) {
        goto LABEL_67;
      }
      int v13 = [(BWFigVideoCaptureDevice *)self->_captureDevice position];
      v14 = [(BWFigVideoCaptureDevice *)self->_captureDevice bravoSuperWideCaptureStream];
      [(BWZoomCommandHandler *)[(BWFigVideoCaptureDevice *)self->_captureDevice zoomCommandHandler] requestedZoomFactorWithoutFudge];
      float v16 = v15;
      BOOL depthFilterRenderingIsAfterPreviewStitcher = self->_depthFilterRenderingIsAfterPreviewStitcher;
      ModelSpecificName = (void *)FigCaptureGetModelSpecificName();
      if ([ModelSpecificName hasPrefix:@"N841"])
      {
        BOOL v19 = v13 == 2;
        uint64_t v20 = 8;
        goto LABEL_16;
      }
      if ([ModelSpecificName hasPrefix:@"D321"])
      {
        BOOL v19 = v13 == 2;
        uint64_t v20 = 4;
        goto LABEL_16;
      }
      if ([ModelSpecificName hasPrefix:@"D33"])
      {
        BOOL v19 = v13 == 2;
        uint64_t v20 = 6;
        goto LABEL_16;
      }
      if ([ModelSpecificName hasPrefix:@"N104"])
      {
        BOOL v19 = v13 == 2;
        uint64_t v20 = 18;
        goto LABEL_16;
      }
      if ([ModelSpecificName hasPrefix:@"D42"])
      {
        uint64_t v42 = 12;
        if (v14) {
          uint64_t v42 = 13;
        }
        BOOL v43 = v13 == 2;
        uint64_t v44 = 14;
        goto LABEL_51;
      }
      if ([ModelSpecificName hasPrefix:@"D43"])
      {
        uint64_t v42 = 15;
        if (v14) {
          uint64_t v42 = 16;
        }
        BOOL v43 = v13 == 2;
        uint64_t v44 = 17;
        goto LABEL_51;
      }
      if (([ModelSpecificName hasPrefix:@"J317"] & 1) != 0
        || ([ModelSpecificName hasPrefix:@"J318"] & 1) != 0)
      {
LABEL_56:
        uint64_t v21 = 10;
        goto LABEL_19;
      }
      if (([ModelSpecificName hasPrefix:@"J320"] & 1) != 0
        || ([ModelSpecificName hasPrefix:@"J321"] & 1) != 0)
      {
LABEL_59:
        uint64_t v21 = 11;
        goto LABEL_19;
      }
      if ([ModelSpecificName hasPrefix:@"D79"]) {
        goto LABEL_61;
      }
      if (([ModelSpecificName hasPrefix:@"J417"] & 1) != 0
        || ([ModelSpecificName hasPrefix:@"J418"] & 1) != 0)
      {
        goto LABEL_56;
      }
      if (([ModelSpecificName hasPrefix:@"J420"] & 1) != 0
        || ([ModelSpecificName hasPrefix:@"J421"] & 1) != 0)
      {
        goto LABEL_59;
      }
      if ([ModelSpecificName hasPrefix:@"D52g"]
        || [ModelSpecificName hasPrefix:@"D53g"])
      {
        BOOL v19 = v13 == 2;
        uint64_t v20 = 22;
        goto LABEL_16;
      }
      if ([ModelSpecificName hasPrefix:@"D53p"])
      {
        BOOL v46 = v14 == 0;
        uint64_t v42 = 24;
LABEL_82:
        if (!v46) {
          ++v42;
        }
        BOOL v43 = v13 == 2;
        uint64_t v44 = 26;
        goto LABEL_51;
      }
      if ([ModelSpecificName hasPrefix:@"D54p"])
      {
        BOOL v46 = v14 == 0;
        uint64_t v42 = 27;
        goto LABEL_82;
      }
      if (([ModelSpecificName hasPrefix:@"J517"] & 1) != 0
        || ([ModelSpecificName hasPrefix:@"J518"] & 1) != 0)
      {
        goto LABEL_56;
      }
      if (([ModelSpecificName hasPrefix:@"J522"] & 1) != 0
        || ([ModelSpecificName hasPrefix:@"J523"] & 1) != 0)
      {
        goto LABEL_59;
      }
      if ([ModelSpecificName hasPrefix:@"D16"]
        || [ModelSpecificName hasPrefix:@"D17"])
      {
        BOOL v19 = v13 == 2;
        uint64_t v20 = 29;
LABEL_16:
        if (v19) {
          uint64_t v21 = v20 + 1;
        }
        else {
          uint64_t v21 = v20;
        }
        goto LABEL_19;
      }
      if ([ModelSpecificName hasPrefix:@"D27"]
        || [ModelSpecificName hasPrefix:@"D28"])
      {
        if (v13 == 2) {
          uint64_t v21 = 37;
        }
        else {
          uint64_t v21 = 38;
        }
LABEL_19:
        uint64_t v22 = [MEMORY[0x1E4F4D7E8] videoPipelinePropertiesForDevice:v21];
        if (v22)
        {
          v23 = (void *)v22;
          size_t v24 = [a4 width];
          size_t v25 = [a4 height];
          [v23 setColorPixelBufferWidth:v24];
          [v23 setColorPixelBufferHeight:v25];
          [v23 setAlphaMattePixelBufferWidth:v24];
          [v23 setAlphaMattePixelBufferHeight:v25];
          int depthDataSource = self->_depthDataSource;
          switch(depthDataSource)
          {
            case 2:
              goto LABEL_23;
            case 1:
              [v23 setFocusStatisticsXTileCount:24];
              [v23 setFocusStatisticsYTileCount:19];
              [(BWFigVideoCaptureStream *)[(BWFigVideoCaptureDevice *)self->_captureDevice captureStream] focalLength];
              objc_msgSend(v23, "setColorPixelBufferFocalLength_mm:");
              [(BWFigVideoCaptureStream *)[(BWFigVideoCaptureDevice *)self->_captureDevice captureStream] pixelSize];
              objc_msgSend(v23, "setColorPixelBufferPixelSize_um:");
              [(BWFigVideoCaptureStream *)[(BWFigVideoCaptureDevice *)self->_captureDevice captureStream] lensFNumber];
              objc_msgSend(v23, "setColorPixelBufferFocalRatio:");
              break;
            case 0:
LABEL_23:
              objc_msgSend(v23, "setInputDisparityPixelBufferWidth:", objc_msgSend(v12, "width"));
              objc_msgSend(v23, "setInputDisparityPixelBufferHeight:", objc_msgSend(v12, "height"));
              break;
          }
          if (self->_foregroundBlurEnabled)
          {
            unsigned int v27 = 1751411059;
          }
          else if (self->_depthDataSource == 2)
          {
            unsigned int v27 = 1717855600;
          }
          else
          {
            unsigned int v27 = 825306677;
          }
          self->_requiredDisparityFormat = v27;
          objc_msgSend(v23, "setInputDisparityPixelBufferPixelFormat:");
          if (self->_foregroundBlurEnabled && v13 == 2) {
            uint64_t v28 = 0;
          }
          else {
            uint64_t v28 = [v23 inputToOutputDisparityPixelBufferRotation];
          }
          [v23 setInputToOutputDisparityPixelBufferRotation:v28];
          if (self->_depthFilterRenderingIsAfterPreviewStitcher && v13 == 2)
          {
            objc_msgSend(v23, "setOutputDisparityPixelBufferWidth:", objc_msgSend(v12, "height"));
            objc_msgSend(v23, "setOutputDisparityPixelBufferHeight:", objc_msgSend(v12, "width"));
            [v23 setInputToOutputDisparityPixelBufferRotation:1];
          }
          uint64_t v29 = [v23 outputDisparityPixelBufferWidth];
          uint64_t v30 = [v23 outputDisparityPixelBufferHeight];

          v31 = (CVAPortraitVideoPipeline *)(id)[MEMORY[0x1E4F4D7E8] portraitVideoPipelineWithProperties:v23 commandQueue:self->_commandQueue notificationQueue:self->_notificationQueue error:&v52];
          self->_portraitVideoPipeline = v31;
          if (!v31)
          {
            LODWORD(v51) = 0;
            FigDebugAssert3();
            int v40 = objc_msgSend(v52, "code", v51, v5);
            if (!v40) {
              return v40;
            }
            goto LABEL_68;
          }
          v56[0] = *MEMORY[0x1E4F24E10];
          v57[0] = [NSNumber numberWithUnsignedLong:v29];
          v56[1] = *MEMORY[0x1E4F24D08];
          uint64_t v32 = [NSNumber numberWithUnsignedLong:v30];
          uint64_t v33 = *MEMORY[0x1E4F24D70];
          v57[1] = v32;
          v57[2] = &unk_1EFB03248;
          uint64_t v34 = *MEMORY[0x1E4F24D20];
          v56[2] = v33;
          v56[3] = v34;
          uint64_t v35 = MEMORY[0x1E4F1CC08];
          v57[3] = MEMORY[0x1E4F1CC08];
          v36 = -[BWVideoFormatRequirements initWithPixelBufferAttributes:]([BWVideoFormatRequirements alloc], "initWithPixelBufferAttributes:", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:v56 count:4]);
          v55 = v36;
          id v37 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v55 count:1]);

          self->_postprocessedDisparityBufferPool = [[BWPixelBufferPool alloc] initWithVideoFormat:v37 capacity:4 name:@"Postprocessed Disparity Pool" memoryPool:+[BWMemoryPool sharedMemoryPool]];
          p_mattingBuffer = &self->_mattingBuffer;
          mattingBuffer = self->_mattingBuffer;
          if (mattingBuffer)
          {
            CFRelease(mattingBuffer);
            *p_mattingBuffer = 0;
          }
          uint64_t v53 = v34;
          uint64_t v54 = v35;
          CVPixelBufferCreate(0, v24, v25, 0x4C303038u, (CFDictionaryRef)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v54 forKeys:&v53 count:1], &self->_mattingBuffer);
          if (*p_mattingBuffer) {
            return 0;
          }
        }
LABEL_67:
        FigDebugAssert3();
        int v40 = -12780;
        goto LABEL_68;
      }
      if ([ModelSpecificName hasPrefix:@"D37"])
      {
LABEL_98:
        if (v13 != 2)
        {
          BOOL v43 = !depthFilterRenderingIsAfterPreviewStitcher;
          uint64_t v42 = 48;
          uint64_t v44 = 42;
          goto LABEL_51;
        }
        goto LABEL_102;
      }
      if ([ModelSpecificName hasPrefix:@"D38"]) {
        goto LABEL_101;
      }
      if ([ModelSpecificName hasPrefix:@"D47"]) {
        goto LABEL_98;
      }
      if ([ModelSpecificName hasPrefix:@"D48"])
      {
LABEL_101:
        if (v13 != 2)
        {
          BOOL v43 = !depthFilterRenderingIsAfterPreviewStitcher;
          uint64_t v42 = 48;
          uint64_t v44 = 43;
          goto LABEL_51;
        }
        goto LABEL_102;
      }
      if ([ModelSpecificName hasPrefix:@"D63"]
        || [ModelSpecificName hasPrefix:@"D64"])
      {
        uint64_t v42 = 31;
        if (!v14) {
          uint64_t v42 = 32;
        }
        BOOL v43 = v13 == 2;
        uint64_t v44 = 30;
        goto LABEL_51;
      }
      if ([ModelSpecificName hasPrefix:@"D73"]
        || [ModelSpecificName hasPrefix:@"D74"])
      {
        if (v13 == 2)
        {
          uint64_t v21 = 33;
          goto LABEL_19;
        }
        uint64_t v42 = 34;
        if (v16 == 4.0) {
          uint64_t v42 = 35;
        }
        BOOL v43 = v14 == 0;
        uint64_t v44 = 36;
        goto LABEL_51;
      }
      if ([ModelSpecificName hasPrefix:@"D83"]
        || [ModelSpecificName hasPrefix:@"D84"]
        || [ModelSpecificName hasPrefix:@"D93"])
      {
        if (v13 != 2)
        {
          BOOL v43 = !depthFilterRenderingIsAfterPreviewStitcher;
          uint64_t v42 = 48;
          uint64_t v44 = 40;
          goto LABEL_51;
        }
        goto LABEL_102;
      }
      if ([ModelSpecificName hasPrefix:@"D94"])
      {
        if (v13 != 2)
        {
          BOOL v43 = !depthFilterRenderingIsAfterPreviewStitcher;
          uint64_t v42 = 48;
          uint64_t v44 = 41;
LABEL_51:
          if (v43) {
            uint64_t v21 = v44;
          }
          else {
            uint64_t v21 = v42;
          }
          goto LABEL_19;
        }
LABEL_102:
        BOOL v43 = !depthFilterRenderingIsAfterPreviewStitcher;
        uint64_t v42 = 49;
        uint64_t v44 = 33;
        goto LABEL_51;
      }
      if ([ModelSpecificName hasPrefix:@"D49"])
      {
LABEL_61:
        BOOL v19 = v13 == 2;
        uint64_t v20 = 20;
        goto LABEL_16;
      }
      if ([ModelSpecificName hasPrefix:@"J617"])
      {
        if (v13 == 2) {
          goto LABEL_56;
        }
        if (([ModelSpecificName hasPrefix:@"J620"] & 1) == 0) {
          [ModelSpecificName hasPrefix:@"J621"];
        }
      }
      else
      {
        char v47 = [ModelSpecificName hasPrefix:@"J618"];
        if (v13 == 2 && (v47 & 1) != 0) {
          goto LABEL_56;
        }
        if ([ModelSpecificName hasPrefix:@"J620"])
        {
          if (v13 == 2) {
            goto LABEL_59;
          }
        }
        else
        {
          char v48 = [ModelSpecificName hasPrefix:@"J621"];
          if (v13 == 2 && (v48 & 1) != 0) {
            goto LABEL_59;
          }
        }
      }
      if ([ModelSpecificName hasPrefix:@"J717"])
      {
        if (v13 != 2)
        {
          if (([ModelSpecificName hasPrefix:@"J720"] & 1) == 0) {
            [ModelSpecificName hasPrefix:@"J721"];
          }
LABEL_151:
          objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], objc_msgSend(NSString, "stringWithFormat:", @"Failed to find CVAVideoPipelineDevice for modelSpecificName: %@, isFrontCamera: %d, zoomFactor %f", ModelSpecificName, v13 == 2, v16), 0 reason userInfo]);
        }
      }
      else
      {
        char v49 = [ModelSpecificName hasPrefix:@"J718"];
        if (v13 != 2 || (v49 & 1) == 0)
        {
          if ([ModelSpecificName hasPrefix:@"J720"])
          {
            if (v13 != 2) {
              goto LABEL_151;
            }
          }
          else
          {
            char v50 = [ModelSpecificName hasPrefix:@"J721"];
            if (v13 != 2 || (v50 & 1) == 0) {
              goto LABEL_151;
            }
          }
          uint64_t v21 = 47;
          goto LABEL_19;
        }
      }
      uint64_t v21 = 46;
      goto LABEL_19;
    }
    return 0;
  }
  int v40 = v10;
LABEL_68:

  self->_portraitVideoPipeline = 0;
  v45 = self->_mattingBuffer;
  if (v45)
  {
    CFRelease(v45);
    self->_mattingBuffer = 0;
  }
  return v40;
}

- (void)renderUsingParameters:(id)a3 inputPixelBuffer:(__CVBuffer *)a4 inputSampleBuffer:(opaqueCMSampleBuffer *)a5 originalPixelBuffer:(__CVBuffer *)a6 processedPixelBuffer:(__CVBuffer *)a7 completionHandler:(id)a8
{
  uint64_t v9 = MEMORY[0x1F4188790](self, a2, a3, a4);
  uint64_t v172 = v11;
  uint64_t v173 = v10;
  int v13 = v12;
  float v15 = v14;
  v17 = v16;
  uint64_t v18 = v9;
  v245[1] = *MEMORY[0x1E4F143B8];
  CGFloat v236 = 0.0;
  v235[0] = 0;
  v235[1] = v235;
  v235[2] = 0x3052000000;
  v235[3] = __Block_byref_object_copy__20;
  v235[4] = __Block_byref_object_dispose__20;
  v235[5] = v9;
  BOOL v19 = (void *)CMGetAttachment(v12, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  AttachedMedia = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(v13, @"Depth");
  uint64_t v21 = AttachedMedia;
  if (AttachedMedia)
  {
    ImageBuffer = CMSampleBufferGetImageBuffer(AttachedMedia);
    if (CVPixelBufferGetPixelFormatType(ImageBuffer) != *(_DWORD *)(v18 + 120))
    {
      BWSampleBufferRemoveAttachedMedia(v13, @"Depth");
      ImageBuffer = 0;
      uint64_t v21 = 0;
    }
  }
  else
  {
    ImageBuffer = 0;
  }
  if (*(unsigned char *)(v18 + 240))
  {
    v23 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(v13, 0x1EFA74480);
    uint64_t v24 = BWSampleBufferGetAttachedMedia(v13, 0x1EFA744C0);
  }
  else
  {
    v23 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(v13, 0x1EFA74460);
    uint64_t v24 = BWSampleBufferGetAttachedMedia(v13, 0x1EFA744A0);
  }
  size_t v25 = (opaqueCMSampleBuffer *)v24;
  if (v23) {
    CFTypeRef cf = CMSampleBufferGetImageBuffer(v23);
  }
  else {
    CFTypeRef cf = CMGetAttachment(v13, (CFStringRef)*MEMORY[0x1E4F53160], 0);
  }
  if (v25) {
    CVImageBufferRef v164 = CMSampleBufferGetImageBuffer(v25);
  }
  else {
    CVImageBufferRef v164 = 0;
  }
  v170 = ImageBuffer;
  v162 = (void *)[v19 objectForKeyedSubscript:*MEMORY[0x1E4F53EA8]];
  CGSize v26 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
  rect.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
  rect.size = v26;
  if (v13)
  {
    CFDictionaryRef v27 = (const __CFDictionary *)CMGetAttachment(v13, (CFStringRef)*MEMORY[0x1E4F530D0], 0);
    if (v27)
    {
      CGRectMakeWithDictionaryRepresentation(v27, &rect);
      CVPixelBufferGetWidth(v15);
      CVPixelBufferGetHeight(v15);
      FigCaptureMetadataUtilitiesDenormalizeCropRect(rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
      rect.origin.CGFloat x = v28;
      rect.origin.y = v29;
      rect.size.double width = v30;
      rect.size.CGFloat height = v31;
    }
  }
  uint64_t v230 = 0;
  v231 = &v230;
  uint64_t v232 = 0x2020000000;
  int v233 = 0;
  uint64_t v224 = 0;
  v225 = &v224;
  uint64_t v226 = 0x3052000000;
  v227 = __Block_byref_object_copy__20;
  v228 = __Block_byref_object_dispose__20;
  uint64_t v229 = 0;
  uint64_t v220 = 0;
  v221 = &v220;
  uint64_t v222 = 0x2020000000;
  int v223 = 0;
  uint64_t v214 = 0;
  v215 = &v214;
  uint64_t v216 = 0x3052000000;
  v217 = __Block_byref_object_copy__20;
  v218 = __Block_byref_object_dispose__20;
  uint64_t v219 = 0;
  uint64_t v210 = 0;
  v211 = &v210;
  uint64_t v212 = 0x2020000000;
  char v213 = 0;
  uint64_t v206 = 0;
  v207 = &v206;
  uint64_t v208 = 0x2020000000;
  int v209 = 0;
  uint64_t v202 = 0;
  v203 = &v202;
  uint64_t v204 = 0x2020000000;
  int v205 = 2143289344;
  uint64_t v198 = 0;
  v199 = &v198;
  uint64_t v200 = 0x2020000000;
  int v201 = 0;
  uint64_t v32 = *(NSObject **)(v18 + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __148__BWStreamingCVAFilterRenderer_renderUsingParameters_inputPixelBuffer_inputSampleBuffer_originalPixelBuffer_processedPixelBuffer_completionHandler___block_invoke;
  block[3] = &unk_1E5C27218;
  void block[5] = &v230;
  block[4] = v18;
  block[6] = &v224;
  block[7] = &v220;
  block[8] = &v214;
  block[9] = &v198;
  block[10] = &v210;
  block[11] = &v206;
  block[12] = &v202;
  dispatch_sync(v32, block);
  char v169 = objc_msgSend((id)CMGetAttachment(v13, @"StructuredLightRecentlyOccluded", 0), "BOOLValue");
  CGSize v176 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
  CGPoint v177 = (CGPoint)*MEMORY[0x1E4F1DB28];
  long long v195 = *MEMORY[0x1E4F1DB28];
  CGSize v196 = v176;
  int CGRectIfPresent = FigCFDictionaryGetCGRectIfPresent();
  HIDWORD(v175) = ImageBuffer == 0;
  if (ImageBuffer)
  {
    *(_DWORD *)(v18 + 216) = 0;
    *(unsigned char *)(v18 + 209) = 1;
    if (v23)
    {
LABEL_19:
      int v34 = 0;
      *(_DWORD *)(v18 + 228) = 0;
      *(unsigned char *)(v18 + 220) = 1;
      goto LABEL_22;
    }
  }
  else
  {
    ++*(_DWORD *)(v18 + 216);
    if (v23) {
      goto LABEL_19;
    }
  }
  int v34 = *(_DWORD *)(v18 + 228) + 1;
  *(_DWORD *)(v18 + 228) = v34;
LABEL_22:
  if (v34 <= *(_DWORD *)(v18 + 224))
  {
    if (cf)
    {
      v36 = *(const void **)(v18 + 128);
      if (v36) {
        CFRelease(v36);
      }
      *(void *)(v18 + 128) = CFRetain(cf);
    }
  }
  else
  {
    uint64_t v35 = *(const void **)(v18 + 128);
    if (v35) {
      CFRelease(v35);
    }
    *(void *)(v18 + 128) = 0;
  }
  if (v17)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_200;
    }
  }
  uint64_t v37 = [v17 colorFilter];
  int v38 = *(_DWORD *)(v18 + 136);
  if (v38 == 2) {
    goto LABEL_35;
  }
  if (v38 == 1)
  {
    if (v162)
    {
      if (!CGRectIfPresent)
      {
LABEL_207:
        v88 = 0;
        v178 = 0;
        v89 = 0;
        uint64_t v87 = 0;
        uint64_t v175 = 0;
        goto LABEL_204;
      }
      goto LABEL_44;
    }
LABEL_200:
    v88 = 0;
    v178 = 0;
    v89 = 0;
    uint64_t v87 = 0;
    uint64_t v175 = 0;
    int v90 = 0;
    goto LABEL_201;
  }
  if (v38)
  {
LABEL_44:
    HIDWORD(v175) = 0;
    goto LABEL_45;
  }
LABEL_35:
  if ((v169 & 1) == 0 && *(unsigned char *)(v18 + 209))
  {
    BOOL v39 = ImageBuffer == 0;
    int v41 = *(_DWORD *)(v18 + 212);
    int v40 = *(_DWORD *)(v18 + 216);
    if (v40 <= v41) {
      BOOL v39 = 0;
    }
    HIDWORD(v175) = v39;
    if (v40 <= v41 && !ImageBuffer) {
      goto LABEL_207;
    }
  }
LABEL_45:
  v166 = v15;
  if (v37)
  {
    v245[0] = v37;
    if (BWCIFilterArrayContainsFiltersRequiringSegmentation((void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v245 count:1]))
    {
      if (*(unsigned char *)(v18 + 220) && *(_DWORD *)(v18 + 228) <= *(_DWORD *)(v18 + 224))
      {
        if (!cf)
        {
          CFTypeRef cf = *(CFTypeRef *)(v18 + 128);
          if (!cf)
          {
LABEL_203:
            v88 = 0;
            v178 = 0;
            v89 = 0;
            uint64_t v87 = 0;
            LOBYTE(v175) = 0;
LABEL_204:
            int v90 = 0;
            char v137 = 0;
            int v50 = -12780;
            goto LABEL_174;
          }
          if (dword_1E96B6948)
          {
            LODWORD(v188) = 0;
            type[0] = OS_LOG_TYPE_DEFAULT;
            os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
        }
      }
      else
      {
        HIDWORD(v175) = 1;
      }
    }
  }
  if (!v19 || !v15 || !v173) {
    goto LABEL_202;
  }
  if (!*(void *)(v18 + 96) || !*(void *)(v18 + 104))
  {
    FigDebugAssert3();
    v88 = 0;
    v178 = 0;
    v89 = 0;
    uint64_t v87 = 0;
    LOBYTE(v175) = 0;
    int v90 = 0;
    goto LABEL_194;
  }
  CFTypeRef v165 = CMGetAttachment(v13, (CFStringRef)*MEMORY[0x1E4F531A0], 0);
  uint64_t v161 = [v19 objectForKeyedSubscript:*MEMORY[0x1E4F53EC8]];
  v160 = (void *)[v19 objectForKeyedSubscript:*MEMORY[0x1E4F53ED0]];
  v159 = (void *)[v19 objectForKeyedSubscript:*MEMORY[0x1E4F53D98]];
  int v158 = objc_msgSend((id)CMGetAttachment(v13, @"SDOFFocusLocked", 0), "intValue");
  v152 = (void *)[v19 objectForKeyedSubscript:*MEMORY[0x1E4F55BE0]];
  if (objc_msgSend((id)objc_msgSend(v19, "objectForKeyedSubscript:", *MEMORY[0x1E4F53BF8]), "intValue") == 4) {
    int v42 = *((_DWORD *)v221 + 6) + 1;
  }
  else {
    int v42 = 0;
  }
  *((_DWORD *)v221 + 6) = v42;
  uint64_t v43 = objc_msgSend(*(id *)(v18 + 144), "shallowDepthOfFieldEffectStatus", v142, v146);
  uint64_t v44 = v43;
  if (v43 > 0xE || ((1 << v43) & 0x6202) == 0) {
    CFTypeRef v165 = 0;
  }
  v45 = (void *)CMGetAttachment(v13, @"BWShallowDepthOfFieldEffectPreviewStatusOverride", 0);
  if (v45) {
    uint64_t v44 = [v45 intValue];
  }
  LODWORD(v46) = *((_DWORD *)v231 + 6);
  LODWORD(v47) = *((_DWORD *)v207 + 6);
  int v155 = *(_DWORD *)[*(id *)(v18 + 176) simulateNextFrameWithEffectStatus:v44 portraitStability:v46 clientSuppliedSimulatedAperture:v47];
  char v48 = (void *)[v19 objectForKeyedSubscript:*MEMORY[0x1E4F54068]];
  if (!v48)
  {
LABEL_202:
    FigDebugAssert3();
    goto LABEL_203;
  }
  [v48 floatValue];
  int v154 = v49;
  int v194 = 0;
  int v50 = FigCaptureComputeImageGainFromMetadata();
  if (v50)
  {
    FigDebugAssert3();
    v88 = 0;
    v178 = 0;
    v89 = 0;
    uint64_t v87 = 0;
    LOBYTE(v175) = 0;
    int v90 = 0;
    char v137 = 0;
    goto LABEL_174;
  }
  int v51 = objc_msgSend((id)objc_msgSend(v19, "objectForKeyedSubscript:", *MEMORY[0x1E4F53FA0]), "unsignedIntValue");
  int v52 = FigMotionHardwareAvailable();
  double v53 = 0.0;
  double v54 = 1.0;
  double v55 = 0.0;
  double v56 = 0.0;
  double v57 = 0.0;
  CGFloat height = 0.0;
  double v59 = 1.0;
  if (!v52) {
    goto LABEL_72;
  }
  double width = 1.0;
  if ((v51 & 0xFFFFFFFB) != 0) {
    goto LABEL_73;
  }
  float v244 = 0.0;
  double v243 = 0.0;
  bzero(&v240, 0x14A0uLL);
  LODWORD(v188) = 0;
  if (FigMotionGetMotionDataFromISP((CFDictionaryRef)v19, (float64x2_t *)&v240, 0, 110, (int *)&v188, (float32x2_t *)&v243, 0, 0, 0))
  {
    double v55 = 0.0;
    CGFloat height = 0.0;
    double v59 = 1.0;
LABEL_72:
    double width = v59;
    goto LABEL_73;
  }
  double v55 = 0.0;
  CGFloat height = 0.0;
  double width = 1.0;
  if (SLODWORD(v188) >= 1)
  {
    double v55 = *(float *)&v243;
    double v53 = *((float *)&v243 + 1);
    double v54 = v244;
    double width = v240.size.width;
    CGFloat height = v240.size.height;
    double v57 = v241;
    double v56 = v242;
  }
LABEL_73:
  double v156 = v55;
  double v157 = height;
  v60 = (void *)[v19 objectForKeyedSubscript:*MEMORY[0x1E4F53F00]];
  uint64_t v61 = [v19 objectForKeyedSubscript:*MEMORY[0x1E4F53F08]];
  double v62 = 0.0;
  if (v60)
  {
    v63 = (void *)v61;
    double v64 = 0.0;
    if (v61)
    {
      [v60 floatValue];
      float v66 = v65;
      [v63 floatValue];
      double v62 = v66;
      double v64 = v67;
    }
  }
  else
  {
    double v64 = 0.0;
  }
  v68 = (void *)CMGetAttachment(v21, (CFStringRef)*MEMORY[0x1E4F52FE8], 0);
  objc_msgSend((id)objc_msgSend(v68, "objectForKeyedSubscript:", *MEMORY[0x1E4F537D0]), "floatValue");
  unsigned int v151 = v69;
  objc_msgSend((id)objc_msgSend(v68, "objectForKeyedSubscript:", *MEMORY[0x1E4F537D8]), "floatValue");
  unsigned int v71 = v70;
  if (!v17)
  {
    LODWORD(v175) = 0;
    uint64_t v72 = 0;
    uint64_t v74 = 0;
    uint64_t v73 = 0;
    float v76 = 1.0;
    goto LABEL_89;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_202;
  }
  uint64_t v72 = [v17 renderingStrategy];
  uint64_t v73 = [v17 foregroundColorLookupTable];
  uint64_t v74 = [v17 backgroundColorLookupTable];
  if (!v74) {
    uint64_t v74 = [v17 foregroundColorLookupTable];
  }
  [v17 interpolationFractionComplete];
  if (v75 >= 1.0 || ([v17 interpolationFractionComplete], float v76 = 0.0, v77 > 0.0))
  {
    [v17 interpolationFractionComplete];
    float v76 = 1.0;
    if (v78 < 1.0)
    {
      [v17 interpolationFractionComplete];
      float v76 = v79;
    }
  }
  BOOL v80 = v76 > 0.0;
  if (v76 >= 1.0) {
    BOOL v80 = 0;
  }
  LODWORD(v175) = v80;
LABEL_89:
  [*(id *)(v18 + 144) updatePortraitSceneMonitoringRequiresStageThresholds:(unint64_t)(v72 - 5) < 6];
  [*(id *)(v18 + 200) removeAllObjects];
  long long v192 = 0u;
  long long v193 = 0u;
  long long v190 = 0u;
  long long v191 = 0u;
  v81 = (void *)v225[5];
  uint64_t v82 = [v81 countByEnumeratingWithState:&v190 objects:v239 count:16];
  uint64_t v153 = v74;
  unint64_t v174 = v72;
  uint64_t v167 = v73;
  if (v82)
  {
    uint64_t v83 = *(void *)v191;
    uint64_t v84 = *MEMORY[0x1E4F54180];
    do
    {
      for (uint64_t i = 0; i != v82; ++i)
      {
        if (*(void *)v191 != v83) {
          objc_enumerationMutation(v81);
        }
        CFDictionaryRef v86 = (const __CFDictionary *)[*(id *)(*((void *)&v190 + 1) + 8 * i) objectForKeyedSubscript:v84];
        if (v86)
        {
          v240.origin = v177;
          v240.size = v176;
          if (CGRectMakeWithDictionaryRepresentation(v86, &v240)) {
            objc_msgSend(*(id *)(v18 + 200), "addObject:", objc_msgSend(MEMORY[0x1E4F29238], "valueWithBytes:objCType:", &v240, "{CGRect={CGPoint=dd}{CGSize=dd}}"));
          }
        }
      }
      uint64_t v82 = [v81 countByEnumeratingWithState:&v190 objects:v239 count:16];
    }
    while (v82);
  }
  double v189 = 0.0;
  if (!HIDWORD(v175))
  {
    v240.origin.CGFloat x = 0.0;
    v88 = (const void *)[*(id *)(v18 + 104) newPixelBuffer];
    if (!v88)
    {
      FigDebugAssert3();
      v88 = 0;
      v178 = 0;
      v89 = 0;
      uint64_t v87 = 0;
      BYTE4(v175) = 0;
      int v90 = 0;
      char v137 = 0;
      LOBYTE(v175) = v175 != 0;
      goto LABEL_195;
    }
    int v91 = *(_DWORD *)(v18 + 136);
    if (v91)
    {
      if (v91 == 1)
      {
        uint64_t v96 = [v162 bytes];
        uint64_t v163 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v96 + 40 length:4096 freeWhenDone:0];
        id v97 = objc_alloc(MEMORY[0x1E4F4D7D8]);
        __int16 v98 = *(_WORD *)(v96 + 14);
        __int16 v99 = *(_WORD *)(v96 + 16);
        unsigned int v150 = *(unsigned __int16 *)(v96 + 22);
        __int16 v100 = *(_WORD *)(v96 + 24);
        __int16 v101 = *(_WORD *)(v96 + 18);
        __int16 v102 = *(_WORD *)(v96 + 20);
        long long v103 = v195;
        CGSize v104 = v196;
        unsigned int v149 = *(_DWORD *)(v96 + 32);
        LODWORD(v96) = [v160 intValue];
        [v159 floatValue];
        unsigned int v106 = v105;
        [v152 floatValue];
        LODWORD(v108) = v107;
        BYTE4(v148) = v158 > 0;
        LODWORD(v148) = v96;
        WORD2(v147) = (int)v104.height;
        WORD1(v147) = (int)v104.width;
        LOWORD(v147) = (int)*((double *)&v103 + 1);
        HIWORD(v144) = (int)*(double *)&v103;
        WORD2(v144) = v102;
        WORD1(v144) = v101;
        LOWORD(v144) = v100;
        v178 = objc_msgSend(v97, "initWithSourceColorPixelBuffer:segmentationPixelBuffer:focusTileData:focusTileXOffset:focusTileYOffset:focusTileWidth:focusTileHeight:focusMapWidth:focusMapHeight:totalSensorCropXOffset:totalSensorCropYOffset:totalSensorCropWidth:totalSensorCropHeight:phaseToBlurFactor:destinationDisparityPixelBuffer:focusRegion:focusRegionType:currentFocusPosition:lockFocalPlane:focusDistanceToMaxAllowedFocusDistanceRatio:sourceColorPixelBufferOrientation:sourceColorPixelBufferGravity:sourceColorPixelBufferGlobalMotion:facesArray:", v166, cf, v163, v98, v99, v150, COERCE_DOUBLE(__PAIR64__(HIDWORD(v156), v149)), COERCE_DOUBLE(__PAIR64__(HIDWORD(v54), v106)), v108, width, v157, v57,
                         v56,
                         v144,
                         v147,
                         v88,
                         v161,
                         v148,
                         *(void *)&v156,
                         *(void *)&v53,
                         *(void *)&v54,
                         *(void *)&v62,
                         *(void *)&v64,
                         0,
                         *(void *)(v18 + 200));
      }
      else if (v91 == 2)
      {
        id v92 = objc_alloc(MEMORY[0x1E4F4D7D8]);
        uint64_t v93 = [v160 intValue];
        [v159 floatValue];
        LOBYTE(v143) = v158 > 0;
        v178 = objc_msgSend(v92, "initWithSourceColorPixelBuffer:segmentationPixelBuffer:networkDisparityPixelBuffer:destinationDisparityPixelBuffer:focusRegion:focusRegionType:currentFocusPosition:lockFocalPlane:sourceColorPixelBufferOrientation:sourceColorPixelBufferGravity:sourceColorPixelBufferGlobalMotion:facesArray:disparityNormalizationMultiplier:disparityNormalizationOffset:", v166, cf, v170, v88, v161, v93, v143, *(void *)&v62, *(void *)&v64, 0, *(void *)(v18 + 200), 1065353216);
      }
      else
      {
        v178 = 0;
      }
    }
    else
    {
      id v94 = objc_alloc(MEMORY[0x1E4F4D7D8]);
      uint64_t v95 = [v160 intValue];
      [v159 floatValue];
      v178 = objc_msgSend(v94, "initWithSourceColorPixelBuffer:fixedPointDisparityPixelBuffer:destinationDisparityPixelBuffer:focusRegion:focusRegionType:currentFocusPosition:lockFocalPlane:sourceColorPixelBufferOrientation:sourceColorPixelBufferGravity:sourceColorPixelBufferGlobalMotion:facesArray:disparityNormalizationMultiplier:disparityNormalizationOffset:", v166, v170, v88, v161, v95, v158 > 0, *(void *)&v62, *(void *)&v64, 0, *(void *)(v18 + 200), __PAIR64__(v71, v151));
    }
    id v109 = objc_alloc(MEMORY[0x1E4F4D7E0]);
    v89 = objc_msgSend(v109, "initWithDisparityPostprocessingRequest:segmentationPixelBuffer:skinSegmentationPixelBuffer:primaryCaptureRect:destinationAlphaMattePixelBuffer:error:", v178, cf, v164, *(void *)(v18 + 112), &v240, rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
    int v90 = 0;
    double v243 = 0.0;
    double v188 = 0.0;
    *(double *)type = 0.0;
    if (v174 > 9)
    {
      uint64_t v113 = v167;
      goto LABEL_133;
    }
    uint64_t v113 = v167;
    if (((1 << v174) & 0x2A0) == 0) {
      goto LABEL_133;
    }
    int v114 = [*(id *)(v18 + 144) shallowDepthOfFieldStagePreviewStatus];
    int v90 = v114;
    if (v114 != 2)
    {
      uint64_t v115 = v174;
      switch(v174)
      {
        case 5uLL:
          uint64_t v116 = 6;
          goto LABEL_118;
        case 7uLL:
          uint64_t v116 = 8;
LABEL_118:
          unint64_t v174 = v116;
          goto LABEL_122;
        case 9uLL:
          uint64_t v115 = 10;
          break;
      }
      unint64_t v174 = v115;
    }
LABEL_122:
    if (v175 || *((_DWORD *)v199 + 6) == v114)
    {
      [*(id *)(v18 + 168) output];
      if (v110 <= 0.0) {
        goto LABEL_133;
      }
      [*(id *)(v18 + 168) output];
      HIDWORD(v111) = 1072651305;
      if (v110 >= 0.980000019) {
        goto LABEL_133;
      }
    }
    else
    {
      [*(id *)(v18 + 168) resetWithInput:1.0 initialOutput:0.0 initialVelocity:0.0];
    }
    [*(id *)(v18 + 168) update];
    [*(id *)(v18 + 168) output];
    float v118 = v117;
    if (v118 > 0.98) {
      float v118 = 0.0;
    }
    HIDWORD(v111) = 0;
    double v110 = fmax(fmin(v118, 1.0), 0.0);
    float v76 = v110;
    BOOL v119 = v76 > 0.0;
    if (v76 >= 1.0) {
      BOOL v119 = 0;
    }
    LODWORD(v175) = v119;
LABEL_133:
    if (v174 > 0xA)
    {
      uint64_t v121 = 0;
    }
    else
    {
      if (((1 << v174) & 0x55F) != 0)
      {
        LODWORD(v111) = v194;
        LODWORD(v112) = v154;
        LODWORD(v110) = v155;
        uint64_t v120 = objc_msgSend(MEMORY[0x1E4F4D7E8], "syntheticDepthOfFieldBackgroundRequestWithMattingRequest:simulatedFocalRatio:sourceColorGain:sourceColorLux:metadata:primaryCaptureRect:error:", v89, v19, &v243, v110, v111, v112, rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
      }
      else
      {
        uint64_t v120 = [MEMORY[0x1E4F4D7E8] opaqueBackgroundRequestWithMattingRequest:v89 error:&v243];
      }
      uint64_t v121 = v120;
    }
    uint64_t v122 = 0;
    if (v174 <= 9)
    {
      if (((1 << v174) & 0xA8) != 0)
      {
        if (objc_opt_respondsToSelector())
        {
          LODWORD(v123) = *((_DWORD *)v203 + 6);
          uint64_t v124 = [MEMORY[0x1E4F4D7E8] contourLightRequestWithFace:v165 relightStyleStrength:&v188 error:v123];
        }
        else
        {
          uint64_t v124 = [MEMORY[0x1E4F4D7E8] contourLightRequestWithFace:v165 error:&v188];
        }
      }
      else
      {
        if (((1 << v174) & 0x202) == 0) {
          goto LABEL_148;
        }
        if (objc_opt_respondsToSelector())
        {
          LODWORD(v125) = *((_DWORD *)v203 + 6);
          uint64_t v124 = [MEMORY[0x1E4F4D7E8] studioLightRequestWithFace:v165 relightStyleStrength:&v188 error:v125];
        }
        else
        {
          uint64_t v124 = [MEMORY[0x1E4F4D7E8] studioLightRequestWithFace:v165 error:&v188];
        }
      }
      uint64_t v122 = v124;
    }
LABEL_148:
    uint64_t v126 = 0;
    if (v174 > 0xA) {
      goto LABEL_154;
    }
    if (((1 << v174) & 0x555) != 0)
    {
      uint64_t v126 = v153;
      if (!(v153 | v113))
      {
        uint64_t v126 = 0;
        goto LABEL_154;
      }
    }
    else if (((1 << v174) & 0x280) == 0)
    {
      goto LABEL_154;
    }
    uint64_t v126 = [MEMORY[0x1E4F4D7E8] colorCubeRequestWithBackgroundCube:v126 foregroundCube:v113 error:type];
LABEL_154:
    CGFloat x = v240.origin.x;
    if (!*(void *)&v240.origin.x)
    {
      CGFloat x = v243;
      if (v243 == 0.0)
      {
        CGFloat x = v188;
        if (v188 == 0.0)
        {
          CGFloat x = *(double *)type;
          if (*(double *)type == 0.0)
          {
            v128 = (void *)[MEMORY[0x1E4F4D7E8] portraitRequestWithBackground:v121 light:v122 post:v126 error:&v189];
            uint64_t v87 = (uint64_t)v128;
            if (v128 && !v215[5])
            {
              id v129 = v128;
              v215[5] = (uint64_t)v129;
            }
            if (v175) {
              [MEMORY[0x1E4F4D7F0] updateRequestWithLiveData:v215[5] mattingRequest:v89 faceKitProcessOutput:v165 error:0];
            }
            goto LABEL_163;
          }
        }
      }
    }
    CGFloat v236 = x;
    uint64_t v87 = 0;
    BYTE4(v175) = 0;
LABEL_201:
    char v137 = 0;
    int v50 = 0;
    goto LABEL_174;
  }
  if (!v167)
  {
    v88 = 0;
    v178 = 0;
    v89 = 0;
    uint64_t v87 = 0;
    int v90 = 0;
    char v137 = 0;
    int v50 = 0;
    BYTE4(v175) = 1;
    LOBYTE(v175) = v175 != 0;
    goto LABEL_174;
  }
  uint64_t v87 = [MEMORY[0x1E4F4D7E8] colorCubePortraitGenericRequestForPortraitVideoPipeline:*(void *)(v18 + 96) sourceColorPixelBuffer:v15 cubeData:v167 error:&v189];
  v88 = 0;
  v178 = 0;
  v89 = 0;
  int v90 = 0;
LABEL_163:
  if (v189 != 0.0)
  {
    char v137 = 0;
    int v50 = 0;
    CGFloat v236 = v189;
    goto LABEL_174;
  }
  char v130 = BYTE4(v175);
  if (!v175) {
    char v130 = 1;
  }
  float v131 = 0.0;
  if ((v130 & 1) != 0 || *((unsigned char *)v211 + 24))
  {
    uint64_t v132 = 0;
    uint64_t v133 = v87;
    if (v87) {
      goto LABEL_169;
    }
    goto LABEL_184;
  }
  uint64_t v133 = v215[5];
  uint64_t v132 = v87;
  float v131 = v76;
  if (!v133)
  {
LABEL_184:
    FigDebugAssert3();
LABEL_194:
    char v137 = 0;
LABEL_195:
    int v50 = -12786;
    goto LABEL_174;
  }
LABEL_169:
  v134 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1)
  {
    kdebug_trace();
    if (*v134 == 1) {
      kdebug_trace();
    }
  }
  v135 = *(void **)(v18 + 96);
  uint64_t v136 = [*(id *)(v18 + 144) portraitSceneMonitorUsesDisparityStatistics];
  v186[0] = MEMORY[0x1E4F143A8];
  v186[1] = 3221225472;
  v186[2] = __148__BWStreamingCVAFilterRenderer_renderUsingParameters_inputPixelBuffer_inputSampleBuffer_originalPixelBuffer_processedPixelBuffer_completionHandler___block_invoke_63;
  v186[3] = &unk_1E5C27240;
  v186[4] = v235;
  v184[5] = v235;
  v185[0] = MEMORY[0x1E4F143A8];
  v185[1] = 3221225472;
  v185[2] = __148__BWStreamingCVAFilterRenderer_renderUsingParameters_inputPixelBuffer_inputSampleBuffer_originalPixelBuffer_processedPixelBuffer_completionHandler___block_invoke_2;
  v185[3] = &unk_1E5C27268;
  v185[4] = v235;
  v184[0] = MEMORY[0x1E4F143A8];
  v184[1] = 3221225472;
  v184[2] = __148__BWStreamingCVAFilterRenderer_renderUsingParameters_inputPixelBuffer_inputSampleBuffer_originalPixelBuffer_processedPixelBuffer_completionHandler___block_invoke_3;
  v184[3] = &unk_1E5C27290;
  v184[4] = v172;
  if ([v135 renderWithRequest:v133 requestTo:v132 mixValue:v173 destinationColorPixelBuffer:&v236 error:v136 sceneMonitorUsesDisparityStatistics:v186 disparityPostprocessingCompletionHandler:COERCE_DOUBLE((unint64_t)LODWORD(v131)) mattingCompletionHandler:v185 portraitCompletionHandler:v184])
  {
    LODWORD(v145) = 0;
    FigDebugAssert3();
    char v137 = 0;
    int v50 = objc_msgSend(*(id *)&v236, "code", v145, v8);
  }
  else
  {
    int v50 = 0;
    char v137 = 1;
  }
LABEL_174:
  v138 = *(NSObject **)(v18 + 8);
  v179[0] = MEMORY[0x1E4F143A8];
  v179[1] = 3221225472;
  v179[2] = __148__BWStreamingCVAFilterRenderer_renderUsingParameters_inputPixelBuffer_inputSampleBuffer_originalPixelBuffer_processedPixelBuffer_completionHandler___block_invoke_4;
  v179[3] = &unk_1E5C272B8;
  char v181 = v169;
  v179[5] = v87;
  v179[6] = &v220;
  int v180 = v90;
  char v182 = v175;
  v179[4] = v18;
  char v183 = BYTE4(v175);
  dispatch_sync(v138, v179);
  if ((v137 & 1) == 0)
  {
    if (v236 == 0.0 && v50)
    {
      v139 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v237 = *MEMORY[0x1E4F28568];
      v238 = @"Streaming CVA rendering failure";
      uint64_t v140 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v238 forKeys:&v237 count:1];
      CGFloat v236 = COERCE_DOUBLE([v139 errorWithDomain:*MEMORY[0x1E4F28760] code:v50 userInfo:v140]);
    }
    if (v172) {
      (*(void (**)(uint64_t, void))(v172 + 16))(v172, 0);
    }
  }
  if (v88) {
    CFRelease(v88);
  }

  _Block_object_dispose(&v198, 8);
  _Block_object_dispose(&v202, 8);
  _Block_object_dispose(&v206, 8);
  _Block_object_dispose(&v210, 8);
  _Block_object_dispose(&v214, 8);
  _Block_object_dispose(&v220, 8);
  _Block_object_dispose(&v224, 8);
  _Block_object_dispose(&v230, 8);
  _Block_object_dispose(v235, 8);
}

float __148__BWStreamingCVAFilterRenderer_renderUsingParameters_inputPixelBuffer_inputSampleBuffer_originalPixelBuffer_processedPixelBuffer_completionHandler___block_invoke(void *a1)
{
  *(_DWORD *)(*(void *)(a1[5] + 8) + 24) = *(_DWORD *)(a1[4] + 48);
  *(void *)(*(void *)(a1[6] + 8) + 40) = *(id *)(a1[4] + 72);
  *(_DWORD *)(*(void *)(a1[7] + 8) + 24) = *(_DWORD *)(a1[4] + 52);
  *(void *)(*(void *)(a1[8] + 8) + 40) = *(id *)(a1[4] + 80);
  *(_DWORD *)(*(void *)(a1[9] + 8) + 24) = *(_DWORD *)(a1[4] + 88);
  *(unsigned char *)(*(void *)(a1[10] + 8) + 24) = *(unsigned char *)(a1[4] + 65);
  *(_DWORD *)(*(void *)(a1[11] + 8) + 24) = *(_DWORD *)(a1[4] + 56);
  float result = *(float *)(a1[4] + 60);
  *(float *)(*(void *)(a1[12] + 8) + 24) = result;
  return result;
}

void __148__BWStreamingCVAFilterRenderer_renderUsingParameters_inputPixelBuffer_inputSampleBuffer_originalPixelBuffer_processedPixelBuffer_completionHandler___block_invoke_63(uint64_t a1, uint64_t a2, void *a3)
{
}

- (void)disparityPostprocessingRequest:(void *)a3 didCompleteDisparityPostprocessingWithResult:
{
  if (a1)
  {
    uint64_t v5 = (_DWORD *)MEMORY[0x1E4F1EBA8];
    if (*MEMORY[0x1E4F1EBA8] == 1)
    {
      [a3 postprocessedDisparityPixelBuffer];
      kdebug_trace();
      if (*v5 == 1)
      {
        [a3 postprocessedDisparityPixelBuffer];
        kdebug_trace();
      }
    }
    uint64_t v35 = 0;
    v36 = &v35;
    uint64_t v37 = 0x2020000000;
    char v38 = 0;
    uint64_t v29 = 0;
    CGFloat v30 = &v29;
    uint64_t v31 = 0x3052000000;
    uint64_t v32 = __Block_byref_object_copy__20;
    uint64_t v33 = __Block_byref_object_dispose__20;
    uint64_t v34 = MEMORY[0x1E4F1CBF0];
    uint64_t v6 = *(NSObject **)(a1 + 8);
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __108__BWStreamingCVAFilterRenderer_disparityPostprocessingRequest_didCompleteDisparityPostprocessingWithResult___block_invoke;
    v28[3] = &unk_1E5C27330;
    v28[4] = a1;
    v28[5] = a3;
    v28[6] = &v35;
    v28[7] = &v29;
    dispatch_sync(v6, v28);
    v7 = *(void **)(a1 + 144);
    [a3 backgroundDisparitySum];
    int v9 = v8;
    [a3 invalidDisparityRatio];
    int v11 = v10;
    [a3 closeCanonicalDisparityAverage];
    int v13 = v12;
    uint64_t v14 = [a3 faceCanonicalDisparityAverage];
    [a3 erodedForegroundRatio];
    int v16 = v15;
    [a3 foregroundRatio];
    int v18 = v17;
    int v19 = *((unsigned __int8 *)v36 + 24);
    uint64_t v20 = v30[5];
    [a3 personSegmentationRatio];
    LODWORD(v22) = v21;
    LODWORD(v23) = v9;
    LODWORD(v24) = v11;
    LODWORD(v25) = v13;
    LODWORD(v26) = v16;
    LODWORD(v27) = v18;
    [v7 updateSDOFBackgroundShiftSum:v14 invalidShiftRatio:v19 != 0 closeCanonicalDisparityAverage:v20 faceCanonicalDisparityAverages:v23 erodedForegroundRatio:v24 foregroundRatio:v25 occluded:v26 faces:v27 personSegmentationRatio:v22];

    _Block_object_dispose(&v29, 8);
    _Block_object_dispose(&v35, 8);
  }
}

uint64_t __148__BWStreamingCVAFilterRenderer_renderUsingParameters_inputPixelBuffer_inputSampleBuffer_originalPixelBuffer_processedPixelBuffer_completionHandler___block_invoke_2(uint64_t a1)
{
  return -[BWStreamingCVAFilterRenderer mattingRequest:didCompleteMattingWithResult:](*(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                                                + 40));
}

- (uint64_t)mattingRequest:(uint64_t)result didCompleteMattingWithResult:
{
  if (result)
  {
    v1 = (_DWORD *)MEMORY[0x1E4F1EBA8];
    if (*MEMORY[0x1E4F1EBA8] == 1)
    {
      float result = kdebug_trace();
      if (*v1 == 1)
      {
        return kdebug_trace();
      }
    }
  }
  return result;
}

void __148__BWStreamingCVAFilterRenderer_renderUsingParameters_inputPixelBuffer_inputSampleBuffer_originalPixelBuffer_processedPixelBuffer_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
}

- (void)portraitRequest:(void *)a3 didCompletePortraitWithResult:(uint64_t)a4 completionHandler:
{
  v14[1] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v7 = (_DWORD *)MEMORY[0x1E4F1EBA8];
    if (*MEMORY[0x1E4F1EBA8] == 1)
    {
      kdebug_trace();
      if (*v7 == 1) {
        kdebug_trace();
      }
    }
    if ([a3 portraitPixelBuffer])
    {
      uint64_t v8 = 0;
      uint64_t v9 = 2;
    }
    else
    {
      uint64_t v10 = *MEMORY[0x1E4F28760];
      uint64_t v13 = *MEMORY[0x1E4F28568];
      v14[0] = @"Portrait rendering request provided no result";
      uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", v10, -12780, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1));
      uint64_t v9 = 0;
    }
    int v11 = *(NSObject **)(a1 + 8);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __96__BWStreamingCVAFilterRenderer_portraitRequest_didCompletePortraitWithResult_completionHandler___block_invoke;
    block[3] = &unk_1E5C24458;
    block[4] = a1;
    void block[5] = a3;
    dispatch_sync(v11, block);
    if (a4) {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(a4 + 16))(a4, v9, v8);
    }
  }
}

id __148__BWStreamingCVAFilterRenderer_renderUsingParameters_inputPixelBuffer_inputSampleBuffer_originalPixelBuffer_processedPixelBuffer_completionHandler___block_invoke_4(uint64_t a1)
{
  id result = (id)[*(id *)(*(void *)(a1 + 32) + 176) isDepthAvailable];
  *(unsigned char *)(*(void *)(a1 + 32) + 24) = (_BYTE)result;
  *(unsigned char *)(*(void *)(a1 + 32) + 64) = *(unsigned char *)(a1 + 60);
  *(_DWORD *)(*(void *)(a1 + 32) + 52) = *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  *(_DWORD *)(*(void *)(a1 + 32) + 88) = *(_DWORD *)(a1 + 56);
  if (!*(unsigned char *)(a1 + 61))
  {

    id result = *(id *)(a1 + 40);
    *(void *)(*(void *)(a1 + 32) + 80) = result;
    *(unsigned char *)(*(void *)(a1 + 32) + 65) = *(unsigned char *)(a1 + 62);
  }
  return result;
}

- (BOOL)supportsAnimation
{
  return 1;
}

- (BOOL)adjustsMetadata
{
  return 1;
}

- (void)adjustMetadataOfSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  v4 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  uint64_t v16 = *MEMORY[0x1E4F53DC8];
  uint64_t v5 = objc_msgSend(v4, "objectForKeyedSubscript:");
  uint64_t v6 = (void *)[v5 objectForKeyedSubscript:*MEMORY[0x1E4F538C8]];
  uint64_t v7 = *MEMORY[0x1E4F538F8];
  uint64_t v8 = (void *)[v6 objectForKeyedSubscript:*MEMORY[0x1E4F538F8]];
  if (!v8) {
    uint64_t v8 = (void *)[v4 objectForKeyedSubscript:*MEMORY[0x1E4F53DC0]];
  }
  uint64_t v37 = 0;
  char v38 = &v37;
  uint64_t v39 = 0x2020000000;
  char v40 = 0;
  uint64_t v33 = 0;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x2020000000;
  uint64_t v36 = 0;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  int v32 = 0;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  int v30 = 0;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2020000000;
  char v28 = 0;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  BOOL mirroredForMetadataAdjustment = self->_mirroredForMetadataAdjustment;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  int rotationDegreesForMetadataAdjustment = self->_rotationDegreesForMetadataAdjustment;
  -[BWStreamingCVAFilterRenderer _removeFaceVisibilityForFacesMissingFromDetectedFaces:]((uint64_t)self, v8);
  sharedContextQueue = self->_sharedContextQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__BWStreamingCVAFilterRenderer_adjustMetadataOfSampleBuffer___block_invoke;
  block[3] = &unk_1E5C272E0;
  void block[6] = &v37;
  block[7] = &v33;
  block[8] = v31;
  block[9] = v29;
  block[10] = v27;
  block[4] = self;
  void block[5] = v8;
  dispatch_sync(sharedContextQueue, block);
  if ([v8 count])
  {
    if (*((unsigned char *)v38 + 24))
    {
      if (v34[3])
      {
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __61__BWStreamingCVAFilterRenderer_adjustMetadataOfSampleBuffer___block_invoke_2;
        v21[3] = &unk_1E5C27308;
        v21[4] = self;
        v21[5] = v27;
        v21[6] = v31;
        v21[7] = v29;
        v21[8] = &v33;
        v21[9] = v25;
        v21[10] = v23;
        uint64_t v10 = [MEMORY[0x1E4F28F60] predicateWithBlock:v21];
        if (!CVPixelBufferLockBaseAddress((CVPixelBufferRef)v34[3], 1uLL))
        {
          if (v5)
          {
            long long v19 = 0u;
            long long v20 = 0u;
            long long v17 = 0u;
            long long v18 = 0u;
            uint64_t v11 = [v5 countByEnumeratingWithState:&v17 objects:v41 count:16];
            if (v11)
            {
              uint64_t v12 = *(void *)v18;
              do
              {
                uint64_t v13 = 0;
                do
                {
                  if (*(void *)v18 != v12) {
                    objc_enumerationMutation(v5);
                  }
                  objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", *(void *)(*((void *)&v17 + 1) + 8 * v13)), "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", *(void *)(*((void *)&v17 + 1) + 8 * v13)), "objectForKeyedSubscript:", v7), "filteredArrayUsingPredicate:", v10), v7);
                  ++v13;
                }
                while (v11 != v13);
                uint64_t v11 = [v5 countByEnumeratingWithState:&v17 objects:v41 count:16];
              }
              while (v11);
            }
            [v4 setObject:v5 forKeyedSubscript:v16];
          }
          else
          {
            uint64_t v14 = [v8 filteredArrayUsingPredicate:v10];
            [v4 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F53DC0]];
          }
          CVPixelBufferUnlockBaseAddress((CVPixelBufferRef)v34[3], 1uLL);
        }
      }
    }
  }
  int v15 = (const void *)v34[3];
  if (v15) {
    CFRelease(v15);
  }
  _Block_object_dispose(v23, 8);
  _Block_object_dispose(v25, 8);
  _Block_object_dispose(v27, 8);
  _Block_object_dispose(v29, 8);
  _Block_object_dispose(v31, 8);
  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);
}

- (void)_removeFaceVisibilityForFacesMissingFromDetectedFaces:(uint64_t)a1
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (a1 && a2)
  {
    v4 = (os_unfair_lock_s *)(a1 + 192);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 192));
    uint64_t v17 = a1;
    DeepCopy = (void *)CFPropertyListCreateDeepCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFPropertyListRef)[*(id *)(a1 + 184) allKeys], 0);
    lock = v4;
    os_unfair_lock_unlock(v4);
    long long v18 = (void *)[MEMORY[0x1E4F1CA48] array];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v6 = [DeepCopy countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v24;
      uint64_t v9 = *MEMORY[0x1E4F53E70];
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v24 != v8) {
            objc_enumerationMutation(DeepCopy);
          }
          uint64_t v11 = *(void *)(*((void *)&v23 + 1) + 8 * v10);
          long long v19 = 0u;
          long long v20 = 0u;
          long long v21 = 0u;
          long long v22 = 0u;
          uint64_t v12 = [a2 countByEnumeratingWithState:&v19 objects:v27 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v20;
LABEL_10:
            uint64_t v15 = 0;
            while (1)
            {
              if (*(void *)v20 != v14) {
                objc_enumerationMutation(a2);
              }
              if (objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v15), "objectForKeyedSubscript:", v9), "isEqualToNumber:", v11))break; {
              if (v13 == ++v15)
              }
              {
                uint64_t v13 = [a2 countByEnumeratingWithState:&v19 objects:v27 count:16];
                if (v13) {
                  goto LABEL_10;
                }
                goto LABEL_16;
              }
            }
          }
          else
          {
LABEL_16:
            [v18 addObject:v11];
          }
          ++v10;
        }
        while (v10 != v7);
        uint64_t v7 = [DeepCopy countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v7);
    }

    os_unfair_lock_lock(lock);
    [*(id *)(v17 + 184) removeObjectsForKeys:v18];
    os_unfair_lock_unlock(lock);
  }
}

id __61__BWStreamingCVAFilterRenderer_adjustMetadataOfSampleBuffer___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(a1 + 32) + 24);
  CFTypeRef v2 = *(CFTypeRef *)(*(void *)(a1 + 32) + 32);
  if (v2) {
    CFTypeRef v2 = CFRetain(v2);
  }
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v2;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = *(_DWORD *)(*(void *)(a1 + 32) + 40);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = *(_DWORD *)(*(void *)(a1 + 32) + 44);
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(_DWORD *)(v3 + 136) == 1)
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1048576000;
    uint64_t v3 = *(void *)(a1 + 32);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = *(_DWORD *)(v3 + 52) > 2;

  id result = *(id *)(a1 + 40);
  *(void *)(*(void *)(a1 + 32) + 72) = result;
  return result;
}

uint64_t __61__BWStreamingCVAFilterRenderer_adjustMetadataOfSampleBuffer___block_invoke_2(void *a1, void *a2)
{
  uint64_t v4 = [a2 objectForKeyedSubscript:*MEMORY[0x1E4F53888]];
  uint64_t v5 = v4;
  if (!v4)
  {
    uint64_t v5 = [a2 objectForKeyedSubscript:*MEMORY[0x1E4F53E70]];
    if (!v5) {
      return 1;
    }
  }
  uint64_t v6 = (void *)[*(id *)(a1[4] + 184) objectForKeyedSubscript:v5];
  uint64_t v7 = v6;
  if (*(unsigned char *)(*(void *)(a1[5] + 8) + 24))
  {
    _S0 = *(float *)(*(void *)(a1[6] + 8) + 24) - *(float *)(*(void *)(a1[7] + 8) + 24);
    __asm { FCVT            H8, S0 }
    if (v6)
    {
      int v14 = [v6 BOOLValue];
      float v15 = 0.049988;
      if (v14) {
        float v15 = -0.049988;
      }
      __asm { FCVT            S1, H8 }
      _S0 = v15 + _S1;
      __asm { FCVT            H8, S0 }
    }
    LOWORD(v30) = 0;
    long long v20 = *MEMORY[0x1E4F1DB28];
    long long v21 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
    long long v28 = *MEMORY[0x1E4F1DB28];
    *(_OWORD *)uint64_t v29 = v21;
    if (!FigCFDictionaryGetCGRectIfPresent())
    {
      if (v4)
      {
LABEL_29:
        uint64_t v18 = 1;
        goto LABEL_32;
      }
      LOWORD(v27) = 0;
      long long v25 = v20;
      *(_OWORD *)long long v26 = v21;
LABEL_19:
      if (!FigCFDictionaryGetCGRectIfPresent())
      {
        LOWORD(v24) = 0;
        long long v22 = v20;
        *(_OWORD *)long long v23 = v21;
        goto LABEL_26;
      }
      if (scfr_averageForegroundDisparityForRect(*(__CVBuffer **)(*(void *)(a1[8] + 8) + 24), &v27, *(unsigned __int8 *)(*(void *)(a1[9] + 8) + 24), *(_DWORD *)(*(void *)(a1[10] + 8) + 24), *(CGFloat *)&v25, *((CGFloat *)&v25 + 1), v26[0], v26[1]))
      {
        LOWORD(v24) = 0;
        long long v22 = v20;
        *(_OWORD *)long long v23 = v21;
        if (v27 <= _H8) {
          goto LABEL_30;
        }
        goto LABEL_26;
      }
      LOWORD(v24) = 0;
      long long v22 = v20;
      *(_OWORD *)long long v23 = v21;
      if ([v7 BOOLValue])
      {
LABEL_26:
        if (FigCFDictionaryGetCGRectIfPresent())
        {
          if (scfr_averageForegroundDisparityForRect(*(__CVBuffer **)(*(void *)(a1[8] + 8) + 24), &v24, *(unsigned __int8 *)(*(void *)(a1[9] + 8) + 24), *(_DWORD *)(*(void *)(a1[10] + 8) + 24), *(CGFloat *)&v22, *((CGFloat *)&v22 + 1), v23[0], v23[1]))uint64_t v18 = v24 > _H8; {
          else
          }
            uint64_t v18 = [v7 BOOLValue];
          goto LABEL_32;
        }
        goto LABEL_29;
      }
LABEL_30:
      uint64_t v18 = 0;
      goto LABEL_32;
    }
    if (scfr_averageForegroundDisparityForRect(*(__CVBuffer **)(*(void *)(a1[8] + 8) + 24), &v30, *(unsigned __int8 *)(*(void *)(a1[9] + 8) + 24), *(_DWORD *)(*(void *)(a1[10] + 8) + 24), *(CGFloat *)&v28, *((CGFloat *)&v28 + 1), v29[0], v29[1]))
    {
      uint64_t v18 = v30 > _H8;
      if (!v4)
      {
LABEL_18:
        LOWORD(v27) = 0;
        long long v25 = v20;
        *(_OWORD *)long long v26 = v21;
        if ((v18 & 1) == 0) {
          goto LABEL_30;
        }
        goto LABEL_19;
      }
    }
    else
    {
      uint64_t v18 = [v7 BOOLValue];
      if (!v4) {
        goto LABEL_18;
      }
    }
LABEL_32:
    os_unfair_lock_lock((os_unfair_lock_t)(a1[4] + 192));
    objc_msgSend(*(id *)(a1[4] + 184), "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v18), v5);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 192));
    return v18;
  }
  return [v6 BOOLValue];
}

id __108__BWStreamingCVAFilterRenderer_disparityPostprocessingRequest_didCompleteDisparityPostprocessingWithResult___block_invoke(uint64_t a1)
{
  CFTypeRef v2 = *(const void **)(*(void *)(a1 + 32) + 32);
  if (v2)
  {
    CFRelease(v2);
    *(void *)(*(void *)(a1 + 32) + 32) = 0;
  }
  CFTypeRef v3 = (CFTypeRef)[*(id *)(a1 + 40) postprocessedDisparityPixelBuffer];
  if (v3) {
    CFTypeRef v3 = CFRetain(v3);
  }
  *(void *)(*(void *)(a1 + 32) + 32) = v3;
  [*(id *)(a1 + 40) focusDisparity];
  *(_DWORD *)(*(void *)(a1 + 32) + 40) = v4;
  [*(id *)(a1 + 40) deltaCanonicalDisparity];
  *(_DWORD *)(*(void *)(a1 + 32) + 44) = v5;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(a1 + 32) + 64);
  id result = *(id *)(*(void *)(a1 + 32) + 72);
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = result;
  return result;
}

uint64_t __96__BWStreamingCVAFilterRenderer_portraitRequest_didCompletePortraitWithResult_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 40) portraitStability];
  *(_DWORD *)(*(void *)(a1 + 32) + 48) = v3;
  return result;
}

- (BOOL)studioAndContourRenderingEnabled
{
  return self->_studioAndContourRenderingEnabled;
}

- (BOOL)stageRenderingEnabled
{
  return self->_stageRenderingEnabled;
}

@end