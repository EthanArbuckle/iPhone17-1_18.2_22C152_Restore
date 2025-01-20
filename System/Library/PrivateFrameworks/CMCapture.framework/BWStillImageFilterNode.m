@interface BWStillImageFilterNode
+ (void)initialize;
- (BWStillImageFilterNode)initWithNodeConfiguration:(id)a3 sensorConfigurationsByPortType:(id)a4 statusDelegate:(id)a5 depthDataDeliveryEnabled:(BOOL)a6 personSegmentationEnabled:(BOOL)a7 refinedDepthEnabled:(BOOL)a8 portraitRenderQuality:(int)a9 targetAspectRatio:(float)a10 defaultPortType:(id)a11 defaultZoomFactor:(float)a12 backPressureDrivenPipelining:(BOOL)a13;
- (id)_initWithNodeConfiguration:(id)a3 sensorConfigurationsByPortType:(id)a4 statusDelegate:(id)a5 depthDataDeliveryEnabled:(BOOL)a6 personSegmentationEnabled:(BOOL)a7 refinedDepthEnabled:(BOOL)a8 portraitRenderQuality:(int)a9 targetAspectRatio:(float)a10 defaultPortType:(id)a11 defaultZoomFactor:(float)a12 backPressureDrivenPipelining:(BOOL)a13 renderResourceProvider:(id)a14;
- (id)nodeSubType;
- (id)nodeType;
- (id)provideApplySmartStyleRenderer;
- (id)provideColorLookupCache;
- (id)provideCoreImageFilterRenderer;
- (id)provideMetalFilterRenderer;
- (id)provideStillImageCoreImageBlurMapRenderer;
- (id)provideStillImageMetalBlurMapRenderer;
- (id)provideStillImageMetalSDOFRenderer;
- (id)provideStreamingSDOFFilterRenderer;
- (int)smartStyleRenderingVersion;
- (uint64_t)_downsampleAttachedMediaForSampleBuffer:(uint64_t)a1;
- (uint64_t)_downsampleImageForSampleBuffer:(CFTypeRef *)a3 outputSampleBuffer:(uint64_t)a4 dimensions:;
- (uint64_t)_downsamplePixelBuffer:(CVPixelBufferRef *)a3 outputPixelBuffer:(uint64_t)a4 dimensions:;
- (uint64_t)_ensureOutputBufferPool;
- (uint64_t)_ensureResources;
- (uint64_t)_prepareStillImageFilterRenderersForOriginalFilters:(id)a3 processedFilters:(void *)a4 metadata:(void *)a5 settings:(uint64_t)a6 inputDimensions:;
- (uint64_t)_provideCIContext;
- (void)_emitNodeErrorForErrorStatus:(int)a3 numberOfNodeErrors:(uint64_t)a4 stillImageSettings:(uint64_t)a5 metadata:;
- (void)_emitSampleBufferAsync:(uint64_t)a1;
- (void)dealloc;
- (void)didReachEndOfDataForInput:(id)a3;
- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5;
- (void)handleNodeError:(id)a3 forInput:(id)a4;
- (void)handleStillImagePrewarmWithSettings:(id)a3 forInput:(id)a4;
- (void)prepareForCurrentConfigurationToBecomeLive;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
- (void)setSmartStyleRenderingVersion:(int)a3;
@end

@implementation BWStillImageFilterNode

- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5
{
  if ([a5 isEqualToString:@"Depth"])
  {
    if (self->_portraitRenderQuality == 2)
    {
      self->_depthDataMapDimensions.width = 384;
      int v9 = 288;
    }
    else
    {
      self->_depthDataMapDimensions.width = [a3 width];
      int v9 = [a3 height];
    }
    self->_depthDataMapDimensions.height = v9;
  }
  id v10 = [(BWNodeOutput *)self->super._output mediaConfigurationForAttachedMediaKey:a5];
  if ([a5 isEqualToString:@"PrimaryFormat"])
  {
    output = self->super._output;
    [(BWNodeOutput *)output setFormat:a3];
  }
  else if (!v10 || [v10 passthroughMode])
  {
    v12.receiver = self;
    v12.super_class = (Class)BWStillImageFilterNode;
    [(BWNode *)&v12 didSelectFormat:a3 forInput:a4 forAttachedMediaKey:a5];
  }
}

- (id)nodeType
{
  return @"Effect";
}

- (void)setSmartStyleRenderingVersion:(int)a3
{
  self->_smartStyleRenderingVersion = a3;
}

- (BWStillImageFilterNode)initWithNodeConfiguration:(id)a3 sensorConfigurationsByPortType:(id)a4 statusDelegate:(id)a5 depthDataDeliveryEnabled:(BOOL)a6 personSegmentationEnabled:(BOOL)a7 refinedDepthEnabled:(BOOL)a8 portraitRenderQuality:(int)a9 targetAspectRatio:(float)a10 defaultPortType:(id)a11 defaultZoomFactor:(float)a12 backPressureDrivenPipelining:(BOOL)a13
{
  LOBYTE(v15) = a13;
  LODWORD(v14) = a9;
  return (BWStillImageFilterNode *)-[BWStillImageFilterNode _initWithNodeConfiguration:sensorConfigurationsByPortType:statusDelegate:depthDataDeliveryEnabled:personSegmentationEnabled:refinedDepthEnabled:portraitRenderQuality:targetAspectRatio:defaultPortType:defaultZoomFactor:backPressureDrivenPipelining:renderResourceProvider:](self, "_initWithNodeConfiguration:sensorConfigurationsByPortType:statusDelegate:depthDataDeliveryEnabled:personSegmentationEnabled:refinedDepthEnabled:portraitRenderQuality:targetAspectRatio:defaultPortType:defaultZoomFactor:backPressureDrivenPipelining:renderResourceProvider:", a3, a4, a5, a6, a7, a8, v14, a11, v15, self);
}

- (id)_initWithNodeConfiguration:(id)a3 sensorConfigurationsByPortType:(id)a4 statusDelegate:(id)a5 depthDataDeliveryEnabled:(BOOL)a6 personSegmentationEnabled:(BOOL)a7 refinedDepthEnabled:(BOOL)a8 portraitRenderQuality:(int)a9 targetAspectRatio:(float)a10 defaultPortType:(id)a11 defaultZoomFactor:(float)a12 backPressureDrivenPipelining:(BOOL)a13 renderResourceProvider:(id)a14
{
  BOOL v14 = a8;
  BOOL v15 = a7;
  BOOL v16 = a6;
  v39.receiver = self;
  v39.super_class = (Class)BWStillImageFilterNode;
  v22 = [(BWNode *)&v39 init];
  if (v22)
  {
    v22->_nodeConfiguration = (BWStillImageNodeConfiguration *)a3;
    v22->_sensorConfigurationsByPortType = (NSDictionary *)a4;
    v22->_statusDelegate = (BWStillImageFilterStatusDelegate *)a5;
    v22->_targetAspectRatio = a10;
    v22->_defaultPortType = (NSString *)a11;
    v22->_defaultZoomFactor = a12;
    v22->_backPressureDrivenPipelining = a13;
    v22->_depthDataDeliveryEnabled = v16;
    v22->_portraitRenderQuality = a9;
    if (a9 == 2
      && VTPixelTransferSessionCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], &v22->_portraitDownsamplingTransferSession))
    {
      fig_log_get_emitter();
      FigDebugAssert3();

      return 0;
    }
    else
    {
      if ([a3 metalCommandQueue]) {
        v23 = (MTLCommandQueue *)(id)[a3 metalCommandQueue];
      }
      else {
        v23 = (MTLCommandQueue *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F55F60], "metalDevice"), "newCommandQueue");
      }
      BOOL v24 = v15;
      v22->_mtlCommandQueue = v23;
      if (FigCapturePlatformSupportsUniversalCompression()) {
        v25 = FigCapturePixelFormatsByAddingCompressedVariants(&unk_1EFB035A8, [a3 maxLossyCompressionLevel]);
      }
      else {
        v25 = &unk_1EFB035A8;
      }
      v26 = [[BWNodeInput alloc] initWithMediaType:1986618469 node:v22];
      v27 = objc_alloc_init(BWVideoFormatRequirements);
      [(BWVideoFormatRequirements *)v27 setSupportedPixelFormats:v25];
      [(BWNodeInput *)v26 setFormatRequirements:v27];
      [(BWNodeInput *)v26 setPassthroughMode:1];
      [(BWNodeInput *)v26 setDelayedBufferCount:1];
      if (v16)
      {
        v28 = objc_alloc_init(BWNodeInputMediaConfiguration);
        [(BWNodeInputMediaConfiguration *)v28 setFormatRequirements:objc_alloc_init(BWVideoFormatRequirements)];
        [(BWNodeInputMediaConfiguration *)v28 setPassthroughMode:1];
        [(BWNodeInputMediaConfiguration *)v28 setDelayedBufferCount:1];
        [(BWNodeInput *)v26 setMediaConfiguration:v28 forAttachedMediaKey:@"Depth"];
      }
      if (v15)
      {
        v29 = objc_alloc_init(BWNodeInputMediaConfiguration);
        v30 = objc_alloc_init(BWVideoFormatRequirements);
        [(BWVideoFormatRequirements *)v30 setSupportedPixelFormats:&unk_1EFB035C0];
        v31 = v30;
        BOOL v24 = v15;
        [(BWNodeInputMediaConfiguration *)v29 setFormatRequirements:v31];
        [(BWNodeInputMediaConfiguration *)v29 setPassthroughMode:1];
        [(BWNodeInputMediaConfiguration *)v29 setDelayedBufferCount:1];
        [(BWNodeInput *)v26 setMediaConfiguration:v29 forAttachedMediaKey:0x1EFA74420];
      }
      if (v14)
      {
        v32 = objc_alloc_init(BWNodeInputMediaConfiguration);
        v33 = objc_alloc_init(BWVideoFormatRequirements);
        [(BWVideoFormatRequirements *)v33 setSupportedPixelFormats:&unk_1EFB035D8];
        [(BWNodeInputMediaConfiguration *)v32 setFormatRequirements:v33];
        [(BWNodeInputMediaConfiguration *)v32 setPassthroughMode:0];
        [(BWNodeInputMediaConfiguration *)v32 setDelayedBufferCount:1];
        [(BWNodeInput *)v26 setMediaConfiguration:v32 forAttachedMediaKey:0x1EFA74440];
      }
      [(BWNode *)v22 addInput:v26];

      v34 = [[BWNodeOutput alloc] initWithMediaType:1986618469 node:v22];
      [objc_alloc_init(BWVideoFormatRequirements) setSupportedPixelFormats:v25];
      [(BWNodeOutput *)v34 setPassthroughMode:1];
      if (v16)
      {
        v35 = objc_alloc_init(BWNodeOutputMediaConfiguration);
        [(BWNodeOutputMediaConfiguration *)v35 setFormatRequirements:objc_alloc_init(BWVideoFormatRequirements)];
        [(BWNodeOutputMediaConfiguration *)v35 setPassthroughMode:1];
        [(BWNodeOutput *)v34 setMediaConfiguration:v35 forAttachedMediaKey:@"Depth"];
      }
      if (v24)
      {
        v36 = objc_alloc_init(BWNodeOutputMediaConfiguration);
        v37 = objc_alloc_init(BWVideoFormatRequirements);
        [(BWVideoFormatRequirements *)v37 setSupportedPixelFormats:&unk_1EFB035F0];
        [(BWNodeOutputMediaConfiguration *)v36 setFormatRequirements:v37];
        [(BWNodeOutputMediaConfiguration *)v36 setPassthroughMode:1];
        [(BWNodeOutput *)v34 setMediaConfiguration:v36 forAttachedMediaKey:0x1EFA74420];
      }
      [(BWNode *)v22 addOutput:v34];

      v22->_rendererProvider = (BWRendererResourceProvider *)a14;
      v22->_colorLookupCache = objc_alloc_init(BWColorLookupCache);
      [a3 figThreadPriority];
      v22->_emitQueue = (OS_dispatch_queue *)FigDispatchQueueCreateWithPriority();
    }
  }
  return v22;
}

+ (void)initialize
{
}

- (void)dealloc
{
  if (self)
  {
    if ([(BWStillImageNodeConfiguration *)self->_nodeConfiguration deferredPhotoProcessorEnabled])
    {
      Class v3 = NSClassFromString(&cfstr_Espressowrappe.isa);
      [(objc_class *)v3 performSelector:NSSelectorFromString(&cfstr_Clearcache.isa)];
    }

    self->_mtlCommandQueue = 0;
  }

  self->_rendererProvider = 0;
  faceAdjustedBlurMapFromStandardResolutionImage = self->_faceAdjustedBlurMapFromStandardResolutionImage;
  if (faceAdjustedBlurMapFromStandardResolutionImage) {
    CFRelease(faceAdjustedBlurMapFromStandardResolutionImage);
  }
  blurredGainMapSbuf = self->_blurredGainMapSbuf;
  if (blurredGainMapSbuf) {
    CFRelease(blurredGainMapSbuf);
  }

  portraitStillImageAuxDepthMetadata = self->_portraitStillImageAuxDepthMetadata;
  if (portraitStillImageAuxDepthMetadata) {
    CFRelease(portraitStillImageAuxDepthMetadata);
  }

  unstyledFullResolutionSbuf = self->_unstyledFullResolutionSbuf;
  if (unstyledFullResolutionSbuf) {
    CFRelease(unstyledFullResolutionSbuf);
  }
  styledFullResolutionSbuf = self->_styledFullResolutionSbuf;
  if (styledFullResolutionSbuf) {
    CFRelease(styledFullResolutionSbuf);
  }
  learnedCoefficientsSbuf = self->_learnedCoefficientsSbuf;
  if (learnedCoefficientsSbuf) {
    CFRelease(learnedCoefficientsSbuf);
  }

  portraitDownsamplingTransferSession = self->_portraitDownsamplingTransferSession;
  if (portraitDownsamplingTransferSession) {
    CFRelease(portraitDownsamplingTransferSession);
  }
  v11.receiver = self;
  v11.super_class = (Class)BWStillImageFilterNode;
  [(BWNode *)&v11 dealloc];
}

- (id)nodeSubType
{
  return @"StillImageFilter";
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)BWStillImageFilterNode;
  [(BWNode *)&v14 prepareForCurrentConfigurationToBecomeLive];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  Class v3 = [(BWNode *)self inputs];
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(BWNodeInput **)(*((void *)&v10 + 1) + 8 * i);
        if (v8 != self->super._input) {
          [(BWFormat *)[(BWNodeInput *)v8 format] isEqual:[(BWNodeInput *)self->super._input format]];
        }
      }
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v5);
  }
  else if (!self)
  {
LABEL_14:
    -[BWStillImageFilterNode _ensureResources]((uint64_t)self);
    return;
  }
  BOOL v9 = BWDeviceSupportsDeferredPhotoProcessorPrewarming();
  if (![(BWStillImageNodeConfiguration *)self->_nodeConfiguration deferredPhotoProcessorEnabled]|| !v9)
  {
    goto LABEL_14;
  }
}

- (uint64_t)_ensureResources
{
  if (!a1) {
    return 0;
  }
  uint64_t v2 = -[BWStillImageFilterNode _ensureOutputBufferPool](a1);
  if (v2)
  {
    uint64_t v4 = v2;
    fig_log_get_emitter();
    FigDebugAssert3();
    return v4;
  }
  if (!*(void *)(a1 + 152))
  {
    Class v3 = [[BWRenderListProcessor alloc] initWithRenderingPool:*(void *)(a1 + 392)];
    *(void *)(a1 + 152) = v3;
    if (!v3) {
      return 4294954510;
    }
  }
  if (!*(unsigned char *)(a1 + 368) || *(unsigned char *)(a1 + 424)) {
    return 0;
  }
  uint64_t v5 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 104), "objectForKeyedSubscript:", *(void *)(a1 + 128)), "sensorIDDictionary");

  LODWORD(v6) = *(_DWORD *)(a1 + 136);
  id v7 = +[FigCaptureCameraParameters sdofTuningParametersForSensorIDDictionary:v5 zoomFactor:v6];
  *(void *)(a1 + 328) = v7;
  if (!v7) {
    return 4294954513;
  }
  *(void *)(a1 + 312) = *(id *)(a1 + 128);
  *(_DWORD *)(a1 + 320) = *(_DWORD *)(a1 + 136);
  uint64_t v8 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 328), "objectForKeyedSubscript:", @"Version"), "intValue");
  *(unsigned char *)(a1 + 200) = [*(id *)(a1 + 328) objectForKeyedSubscript:objc_msgSend(NSString, "stringWithFormat:", @"HairNetV%d", v8)] != 0;
  int v9 = [*(id *)(a1 + 96) deferredPhotoProcessorEnabled];
  long long v10 = *(void **)(a1 + 160);
  if (v9)
  {
    [v10 provideStillImageCoreImageBlurMapRenderer];
    [*(id *)(a1 + 208) prepareForRenderingWithParameters:0 inputVideoFormat:*(void *)(a1 + 400) inputMediaPropertiesByAttachedMediaKey:0];
  }
  else
  {
    [v10 provideStillImageMetalSDOFRenderer];
    [*(id *)(a1 + 160) provideStillImageMetalBlurMapRenderer];
  }
  uint64_t v4 = 0;
  *(unsigned char *)(a1 + 424) = 1;
  return v4;
}

- (uint64_t)_ensureOutputBufferPool
{
  v23[1] = *MEMORY[0x1E4F143B8];
  if (!result) {
    return result;
  }
  uint64_t v1 = result;
  if (*(void *)(result + 392)) {
    return 0;
  }
  uint64_t v2 = -[BWVideoFormatRequirements initWithPixelBufferAttributes:]([BWVideoFormatRequirements alloc], "initWithPixelBufferAttributes:", objc_msgSend((id)objc_msgSend(*(id *)(result + 8), "videoFormat"), "pixelBufferAttributes"));
  Class v3 = v2;
  if (*(float *)(v1 + 120) != 0.0)
  {
    int64_t v4 = FigCaptureMetadataUtilitiesEnforceAspectRatioWithStillImageDimensions([(BWVideoFormatRequirements *)v2 width] | ((unint64_t)[(BWVideoFormatRequirements *)v2 height] << 32), *(float *)(v1 + 120));
    [(BWVideoFormatRequirements *)v3 setWidth:(int)v4];
    [(BWVideoFormatRequirements *)v3 setHeight:v4 >> 32];
  }
  v23[0] = v3;
  id v5 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1]);
  if (*(_DWORD *)(v1 + 380) != 2)
  {
    int v6 = [*(id *)(v1 + 96) optimizedEnhancedResolutionDepthPipelineEnabled];
    id v7 = *(void **)(v1 + 96);
    if (v6)
    {
      *(_DWORD *)(v1 + 344) = [v7 deepFusionEnhancedResolutionDimensions];
      uint64_t v8 = [*(id *)(v1 + 96) deepFusionEnhancedResolutionDimensions];
    }
    else
    {
      if (!FigCaptureVideoDimensionsAreValid([v7 downgradedDeepFusionEnhancedResolutionDimensions]))
      {
        *(_DWORD *)(v1 + 344) = [v5 width];
        *(_DWORD *)(v1 + 348) = [v5 height];
        goto LABEL_7;
      }
      *(_DWORD *)(v1 + 344) = [*(id *)(v1 + 96) downgradedDeepFusionEnhancedResolutionDimensions];
      uint64_t v8 = [*(id *)(v1 + 96) downgradedDeepFusionEnhancedResolutionDimensions];
    }
    *(_DWORD *)(v1 + 348) = HIDWORD(v8);
    int v9 = [v5 width];
    int v10 = [v5 height];
    *(_DWORD *)(v1 + 352) = v9;
    *(_DWORD *)(v1 + 356) = v10;
    goto LABEL_13;
  }
  *(_DWORD *)(v1 + 344) = 2016;
  *(_DWORD *)(v1 + 348) = 1512;
LABEL_7:
  *(void *)(v1 + 352) = *(void *)(v1 + 344);
LABEL_13:
  *(_DWORD *)(v1 + 360) = *(_DWORD *)(v1 + 352) / 2;
  *(_DWORD *)(v1 + 364) = *(_DWORD *)(v1 + 356) / 2;
  long long v11 = objc_alloc_init(BWVideoFormatRequirements);
  [(BWVideoFormatRequirements *)v11 setWidth:*(int *)(v1 + 352)];
  [(BWVideoFormatRequirements *)v11 setHeight:*(int *)(v1 + 356)];
  [(BWVideoFormatRequirements *)v11 setSupportedPixelFormats:&unk_1EFB03608];
  [(BWVideoFormatRequirements *)v11 setBytesPerRowAlignment:64];
  [(BWVideoFormatRequirements *)v11 setPlaneAlignment:64];
  [(BWVideoFormatRequirements *)v11 setSupportedCacheModes:+[BWVideoFormatRequirements cacheModesForOptimizedHWAccess]];
  if ([v5 colorSpaceProperties])
  {
    uint64_t v22 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v5, "colorSpaceProperties"));
    uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
  }
  else
  {
    uint64_t v12 = 0;
  }
  [(BWVideoFormatRequirements *)v11 setSupportedColorSpaceProperties:v12];

  v21 = v11;
  *(void *)(v1 + 400) = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1]);

  long long v13 = objc_alloc_init(BWVideoFormatRequirements);
  [(BWVideoFormatRequirements *)v13 setWidth:*(int *)(v1 + 344)];
  [(BWVideoFormatRequirements *)v13 setHeight:*(int *)(v1 + 348)];
  uint64_t v20 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v5, "pixelFormat"));
  -[BWVideoFormatRequirements setSupportedPixelFormats:](v13, "setSupportedPixelFormats:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1]);
  [(BWVideoFormatRequirements *)v13 setBytesPerRowAlignment:64];
  [(BWVideoFormatRequirements *)v13 setPlaneAlignment:64];
  [(BWVideoFormatRequirements *)v13 setSupportedCacheModes:+[BWVideoFormatRequirements cacheModesForOptimizedHWAccess]];
  if ([v5 colorSpaceProperties])
  {
    uint64_t v19 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v5, "colorSpaceProperties"));
    uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
  }
  else
  {
    uint64_t v14 = 0;
  }
  [(BWVideoFormatRequirements *)v13 setSupportedColorSpaceProperties:v14];

  v18 = v13;
  uint64_t v15 = 1;
  *(void *)(v1 + 336) = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1]);

  if (!*(unsigned char *)(v1 + 140)) {
    uint64_t v15 = [*(id *)(v1 + 96) deferredPhotoProcessorEnabled];
  }
  LOBYTE(v17) = v15;
  uint64_t v16 = -[BWPixelBufferPool initWithVideoFormat:capacity:name:clientProvidesPool:memoryPool:providesBackPressure:reportSlowBackPressureAllocations:]([BWPixelBufferPool alloc], "initWithVideoFormat:capacity:name:clientProvidesPool:memoryPool:providesBackPressure:reportSlowBackPressureAllocations:", *(void *)(v1 + 336), 2, @"Still Image Filter Processing Pool", 0, [*(id *)(v1 + 16) memoryPool], v15, v17);
  result = 0;
  *(void *)(v1 + 392) = v16;
  if (!v16)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
  return result;
}

- (void)handleStillImagePrewarmWithSettings:(id)a3 forInput:(id)a4
{
  if (self)
  {
    BOOL v6 = BWDeviceSupportsDeferredPhotoProcessorPrewarming();
    if ([(BWStillImageNodeConfiguration *)self->_nodeConfiguration deferredPhotoProcessorEnabled])
    {
      BOOL v7 = !v6;
    }
    else
    {
      BOOL v7 = 1;
    }
    if (!v7) {
      -[BWStillImageFilterNode _ensureResources]((uint64_t)self);
    }
    if ([(BWStillImageNodeConfiguration *)self->_nodeConfiguration deferredPhotoProcessorEnabled])
    {
      BWLoadProcessorBundle(@"CCPortrait", 0xFFFFFFFFLL);
    }
  }
  [(BWRenderListProcessor *)self->_renderListProcessor waitForAllProcessingToComplete];
  emitQueue = self->_emitQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __71__BWStillImageFilterNode_handleStillImagePrewarmWithSettings_forInput___block_invoke;
  v9[3] = &unk_1E5C24458;
  v9[4] = self;
  v9[5] = a3;
  dispatch_async(emitQueue, v9);
}

uint64_t __71__BWStillImageFilterNode_handleStillImagePrewarmWithSettings_forInput___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) emitStillImagePrewarmMessageWithSettings:*(void *)(a1 + 40)];
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  int64_t v4 = self;
  uint64_t v127 = *MEMORY[0x1E4F143B8];
  CMAttachmentBearerRef v124 = 0;
  if (!a3)
  {
    v97 = 0;
    v45 = 0;
    int v87 = 2;
    int v44 = -12780;
    goto LABEL_133;
  }
  if (self)
  {
    BOOL v6 = BWDeviceSupportsDeferredPhotoProcessorPrewarming();
    if ([(BWStillImageNodeConfiguration *)v4->_nodeConfiguration deferredPhotoProcessorEnabled]&& v6)
    {
      -[BWStillImageFilterNode _ensureResources]((uint64_t)v4);
    }
  }
  [(BWRenderListProcessor *)v4->_renderListProcessor waitForAllProcessingToComplete];
  CFStringRef v8 = (const __CFString *)*MEMORY[0x1E4F53070];
  v97 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  if (!v97 || (int v9 = (void *)CMGetAttachment(a3, @"StillSettings", 0)) == 0)
  {
    v45 = 0;
    int v43 = 0;
    int v44 = -12780;
    goto LABEL_125;
  }
  int v10 = v9;
  CFStringRef key = v8;
  target = a3;
  v96 = (void *)[v9 captureSettings];
  long long v11 = (void *)[v10 requestedSettings];
  v98 = v10;
  uint64_t v12 = objc_msgSend((id)objc_msgSend(v10, "processingSettings"), "photoManifest");
  v95 = (void *)[v11 originalImageFilters];
  v105 = v11;
  v99 = (void *)[v11 processedImageFilters];
  long long v120 = 0u;
  long long v121 = 0u;
  long long v122 = 0u;
  long long v123 = 0u;
  long long v13 = (void *)[v12 photoDescriptors];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v120 objects:v126 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    LODWORD(v8) = 0;
    int v16 = 0;
    uint64_t v17 = *(void *)v121;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v121 != v17) {
          objc_enumerationMutation(v13);
        }
        char v19 = [*(id *)(*((void *)&v120 + 1) + 8 * i) processingFlags];
        LODWORD(v8) = v8 | ((v19 & 4) >> 2);
        v16 |= (v19 & 8) >> 3;
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v120 objects:v126 count:16];
    }
    while (v15);
  }
  else
  {
    LODWORD(v8) = 0;
    int v16 = 0;
  }
  int v20 = objc_msgSend((id)CMGetAttachment(target, @"StillImageBufferFrameType", 0), "unsignedIntValue");
  int v21 = BWStillImageProcessingFlagsForSampleBuffer(target) & 0x200040;
  BOOL v22 = [(BWStillImageNodeConfiguration *)v4->_nodeConfiguration optimizedEnhancedResolutionDepthPipelineEnabled];
  BOOL v23 = v20 == 13;
  if (v22 && v23) {
    BOOL v24 = target;
  }
  else {
    BOOL v24 = 0;
  }
  if (v22 && v23) {
    styledFullResolutionSbuf = 0;
  }
  else {
    styledFullResolutionSbuf = target;
  }
  if (v20 == 40)
  {
    [(BWStillImageNodeConfiguration *)v4->_nodeConfiguration deferredPhotoProcessorEnabled];
    unstyledFullResolutionSbuf = v4->_unstyledFullResolutionSbuf;
    v4->_unstyledFullResolutionSbuf = target;
    CFRetain(target);
    if (unstyledFullResolutionSbuf) {
      CFRelease(unstyledFullResolutionSbuf);
    }
    v27 = v4->_unstyledFullResolutionSbuf;
    styledFullResolutionSbuf = v4->_styledFullResolutionSbuf;
  }
  else
  {
    v27 = styledFullResolutionSbuf;
  }
  if (v21 == 0x200000)
  {
    [(BWStillImageNodeConfiguration *)v4->_nodeConfiguration deferredPhotoProcessorEnabled];
    learnedCoefficientsSbuf = v4->_learnedCoefficientsSbuf;
    AttachedMedia = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(target, 0x1EFA747A0);
    v4->_learnedCoefficientsSbuf = AttachedMedia;
    if (AttachedMedia) {
      CFRetain(AttachedMedia);
    }
    if (learnedCoefficientsSbuf) {
      CFRelease(learnedCoefficientsSbuf);
    }
    v30 = v4->_styledFullResolutionSbuf;
    v4->_styledFullResolutionSbuf = target;
    CFRetain(target);
    if (v30) {
      CFRelease(v30);
    }
    styledFullResolutionSbuf = v4->_styledFullResolutionSbuf;
    v27 = v4->_unstyledFullResolutionSbuf;
  }
  cf = styledFullResolutionSbuf;
  v103 = v24;
  if (v24) {
    v31 = v24;
  }
  else {
    v31 = v27;
  }
  CFStringRef v32 = (const __CFString *)*MEMORY[0x1E4F55B40];
  v100 = (void *)CMGetAttachment(v31, (CFStringRef)*MEMORY[0x1E4F55B40], 0);
  if (v100)
  {
    objc_opt_class();
    v33 = v100;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v33 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v100];
      CMSetAttachment(v31, v32, v33, 1u);
    }
    [v105 simulatedAperture];
    if (v34 > 0.0)
    {
      v35 = NSNumber;
      [v105 simulatedAperture];
      uint64_t v36 = objc_msgSend(v35, "numberWithFloat:");
      [v33 setObject:v36 forKeyedSubscript:*MEMORY[0x1E4F55798]];
    }
    [v105 portraitLightingEffectStrength];
    v37 = NSNumber;
    [v105 portraitLightingEffectStrength];
    uint64_t v38 = objc_msgSend(v37, "numberWithFloat:");
    [v33 setObject:v38 forKeyedSubscript:*MEMORY[0x1E4F55AB8]];
  }
  BOOL v39 = [(BWStillImageNodeConfiguration *)v4->_nodeConfiguration optimizedEnhancedResolutionDepthPipelineEnabled];
  v40 = cf;
  v106 = v27;
  if (!v39)
  {
LABEL_73:
    int v43 = 0;
    if (!v40 || ((v27 == 0) & v16) != 0)
    {
      int v44 = 0;
      goto LABEL_51;
    }
    if ([v96 captureType] == 3)
    {
      LOBYTE(v55) = 1;
    }
    else
    {
      if ([v96 captureType] != 10)
      {
        char v104 = 0;
LABEL_81:
        int v56 = BWCIFilterArrayContainsPortraitFilters(v99);
        BOOL v57 = BWCIFilterArrayOnlyContainsPortraitFilters(v99);
        int v58 = objc_msgSend((id)objc_msgSend(v100, "objectForKeyedSubscript:", *MEMORY[0x1E4F558A8]), "intValue");
        uint64_t v59 = BWSampleBufferGetAttachedMedia(v31, @"Depth");
        if (v56)
        {
          if (v59) {
            BOOL v60 = v58 == 1;
          }
          else {
            BOOL v60 = 0;
          }
          int v61 = v60;
        }
        else
        {
          int v61 = 0;
        }
        if (v16 & v57) != 1 || (v61)
        {
          blurMapRenderErrorFromStandardResolutionImage = v4->_blurMapRenderErrorFromStandardResolutionImage;
          if (blurMapRenderErrorFromStandardResolutionImage)
          {
            int v43 = [(NSError *)blurMapRenderErrorFromStandardResolutionImage code];
            int v114 = 0;
            os_log_type_t type = OS_LOG_TYPE_DEFAULT;
            os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
            v27 = v106;
            fig_log_call_emit_and_clean_up_after_send_and_compose();

            int v16 = 0;
            v4->_blurMapRenderErrorFromStandardResolutionImage = 0;
          }
          else
          {
            int v43 = 0;
          }
          v65 = target;
        }
        else
        {
          int v114 = 0;
          os_log_type_t type = OS_LOG_TYPE_DEFAULT;
          v62 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT);
          v65 = target;
          v27 = v106;
          fig_log_call_emit_and_clean_up_after_send_and_compose();
          int v16 = 0;
          int v43 = -16809;
        }
        if (((v8 | v16) & 1) == 0)
        {
          v70 = v4->_unstyledFullResolutionSbuf;
          if (v70)
          {
            CFRelease(v70);
            v4->_unstyledFullResolutionSbuf = 0;
          }
          v71 = v4->_learnedCoefficientsSbuf;
          v45 = v98;
          if (v71)
          {
            CFRelease(v71);
            v4->_learnedCoefficientsSbuf = 0;
          }
          v72 = v4->_styledFullResolutionSbuf;
          if (v72)
          {
            CFRelease(v72);
            v4->_styledFullResolutionSbuf = 0;
          }
          -[BWStillImageFilterNode _emitSampleBufferAsync:]((uint64_t)v4, v65);
          LOBYTE(v8) = 0;
          goto LABEL_124;
        }
        unint64_t v66 = BWPixelBufferDimensionsFromSampleBuffer(v65);
        -[BWStillImageFilterNode _prepareStillImageFilterRenderersForOriginalFilters:processedFilters:metadata:settings:inputDimensions:]((uint64_t)v4, v95, v99, v97, v98, v66);
        if (v8)
        {
          v67 = cf;
          v68 = (void *)CFRetain(cf);
          CMAttachmentBearerRef v124 = v68;
          char v69 = v104;
LABEL_119:
          if (!v68) {
            goto LABEL_50;
          }
          CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer((CMSampleBufferRef)v68);
          if (ImageBuffer)
          {
            CVImageBufferRef v84 = ImageBuffer;
            BWSampleBufferSetAttachedMedia(v124, 0x1EFA747A0, (uint64_t)v4->_learnedCoefficientsSbuf);
            CFRetain(v67);
            if (v106) {
              CFRetain(v106);
            }
            renderListProcessor = v4->_renderListProcessor;
            renderList = v4->_renderList;
            v107[0] = MEMORY[0x1E4F143A8];
            v107[1] = 3221225472;
            v107[2] = __54__BWStillImageFilterNode_renderSampleBuffer_forInput___block_invoke_70;
            v107[3] = &unk_1E5C28578;
            char v109 = v8 & 1;
            char v110 = v16 & 1;
            char v111 = v61;
            char v112 = v69;
            v45 = v98;
            v107[4] = v98;
            v107[5] = v4;
            v107[6] = v99;
            v107[7] = v67;
            int v108 = v43;
            v107[8] = v106;
            -[BWRenderListProcessor processRenderList:inputPixelBuffer:inputSampleBuffer:resultHandler:](renderListProcessor, "processRenderList:inputPixelBuffer:inputSampleBuffer:resultHandler:", renderList, v84, v124, v107, v91, v92);
LABEL_124:
            int v44 = 0;
            goto LABEL_125;
          }
          fig_log_get_emitter();
          FigDebugAssert3();
LABEL_146:
          int v44 = -12780;
          goto LABEL_51;
        }
        v67 = cf;
        char v69 = v104;
        if (v27)
        {
          if (v4->_portraitRenderQuality == 2)
          {
            v73 = CMSampleBufferGetImageBuffer(v27);
            if (!v73)
            {
              fig_log_get_emitter();
              FigDebugAssert3();
              LOBYTE(v8) = 0;
              goto LABEL_146;
            }
            v74 = v27;
            int height = v4->_outputDimensions.height;
            size_t v76 = CVPixelBufferGetHeight(v73);
            -[BWStillImageFilterNode _downsampleImageForSampleBuffer:outputSampleBuffer:dimensions:]((uint64_t)v4, v74, &v124, *(void *)&v4->_outputDimensions);
            if (!v124)
            {
              fig_log_get_emitter();
              FigDebugAssert3();
              LOBYTE(v8) = 0;
              goto LABEL_50;
            }
            float v77 = (float)height / (float)v76;
            v78 = (void *)[v97 mutableCopy];
            int v79 = 1;
            CMSetAttachment(v124, key, v78, 1u);
            *(float *)&double v80 = v77;
            uint64_t v81 = [NSNumber numberWithFloat:v80];
            [v78 setObject:v81 forKeyedSubscript:*MEMORY[0x1E4F533C8]];

            char v69 = v104;
            goto LABEL_113;
          }
          BWCMSampleBufferCreateCopyIncludingMetadata(v27, (CMSampleBufferRef *)&v124);
        }
        int v79 = 0;
LABEL_113:
        if (v61 && (v69 & 1) == 0) {
          CMSetAttachment(cf, @"SDOFCustomRendered", (CFTypeRef)[NSNumber numberWithShort:9], 1u);
        }
        -[BWStillImageFilterNode _emitSampleBufferAsync:]((uint64_t)v4, cf);
        if (v79)
        {
          int v82 = -[BWStillImageFilterNode _downsampleAttachedMediaForSampleBuffer:]((uint64_t)v4, v124);
          if (v82)
          {
            int v44 = v82;
            fig_log_get_emitter();
            FigDebugAssert3();
            LOBYTE(v8) = 0;
            goto LABEL_51;
          }
        }
        v68 = (void *)v124;
        goto LABEL_119;
      }
      unint64_t v55 = ((unint64_t)[v96 captureFlags] >> 20) & 1;
    }
    char v104 = v55;
    goto LABEL_81;
  }
  if (!v103)
  {
    if (v27 && cf)
    {
      v93 = v31;
      long long v118 = 0u;
      long long v116 = 0u;
      long long v117 = 0u;
      long long v115 = 0u;
      v46 = v4;
      attachedMediaFromStandardResolutionImage = v4->_attachedMediaFromStandardResolutionImage;
      uint64_t v48 = [(NSDictionary *)attachedMediaFromStandardResolutionImage countByEnumeratingWithState:&v115 objects:v125 count:16];
      if (v48)
      {
        uint64_t v49 = v48;
        uint64_t v50 = *(void *)v116;
        do
        {
          for (uint64_t j = 0; j != v49; ++j)
          {
            if (*(void *)v116 != v50) {
              objc_enumerationMutation(attachedMediaFromStandardResolutionImage);
            }
            v52 = *(void **)(*((void *)&v115 + 1) + 8 * j);
            if (([v52 isEqualToString:0x1EFA74600] & 1) == 0)
            {
              BWSampleBufferSetAttachedMedia(cf, (uint64_t)v52, (uint64_t)[(NSDictionary *)v46->_attachedMediaFromStandardResolutionImage objectForKeyedSubscript:v52]);
              v27 = v106;
              if (cf != v106) {
                BWSampleBufferSetAttachedMedia(v106, (uint64_t)v52, (uint64_t)[(NSDictionary *)v46->_attachedMediaFromStandardResolutionImage objectForKeyedSubscript:v52]);
              }
            }
          }
          uint64_t v49 = [(NSDictionary *)attachedMediaFromStandardResolutionImage countByEnumeratingWithState:&v115 objects:v125 count:16];
        }
        while (v49);
      }
      int64_t v4 = v46;
      sifn_mergeInferenceResults(cf, v46->_inferenceResultsFromStandardResolutionImage);
      if (cf != v27) {
        sifn_mergeInferenceResults(v27, v46->_inferenceResultsFromStandardResolutionImage);
      }
      CMSetAttachment(cf, @"PortraitStillImageAuxDepthMetadata", v46->_portraitStillImageAuxDepthMetadata, 1u);
      CMSetAttachment(cf, @"PortraitStillImageFaceAdjustedBlurMap", v46->_faceAdjustedBlurMapFromStandardResolutionImage, 1u);
      v27 = v106;
      v31 = v93;
      if (cf != v106)
      {
        CMSetAttachment(v106, @"PortraitStillImageAuxDepthMetadata", v4->_portraitStillImageAuxDepthMetadata, 1u);
        CMSetAttachment(v106, @"PortraitStillImageFaceAdjustedBlurMap", v4->_faceAdjustedBlurMapFromStandardResolutionImage, 1u);
      }
      faceAdjustedBlurMapFromStandardResolutionImage = v4->_faceAdjustedBlurMapFromStandardResolutionImage;
      if (faceAdjustedBlurMapFromStandardResolutionImage)
      {
        CFRelease(faceAdjustedBlurMapFromStandardResolutionImage);
        v4->_faceAdjustedBlurMapFromStandardResolutionImage = 0;
      }
      portraitStillImageAuxDepthMetadata = v4->_portraitStillImageAuxDepthMetadata;
      if (portraitStillImageAuxDepthMetadata)
      {
        CFRelease(portraitStillImageAuxDepthMetadata);
        v4->_portraitStillImageAuxDepthMetadata = 0;
      }

      v4->_attachedMediaFromStandardResolutionImage = 0;
      v4->_inferenceResultsFromStandardResolutionImage = 0;
      v40 = cf;
    }
    goto LABEL_73;
  }
  [(BWStillImageFilterStatusDelegate *)v4->_statusDelegate filterNodeDidReceiveStandardResolutionDeepFusionBuffer:v4 error:0];
  coreImageBlurMapRenderer = v4->_coreImageBlurMapRenderer;
  CVImageBufferRef v42 = CMSampleBufferGetImageBuffer(target);
  v119[0] = MEMORY[0x1E4F143A8];
  v119[1] = 3221225472;
  v119[2] = __54__BWStillImageFilterNode_renderSampleBuffer_forInput___block_invoke;
  v119[3] = &unk_1E5C28550;
  v119[4] = v4;
  v119[5] = target;
  [(BWStillImageCoreImageBlurMapRenderer *)coreImageBlurMapRenderer renderUsingParameters:0 inputPixelBuffer:v42 inputSampleBuffer:target originalPixelBuffer:0 processedPixelBuffer:0 completionHandler:v119];
  int v43 = 0;
LABEL_50:
  int v44 = 0;
LABEL_51:
  v45 = v98;
LABEL_125:
  if (v124) {
    CFRelease(v124);
  }
  if (!v44)
  {
    if (v8 & 1 | (v43 == 0)) {
      return;
    }
    int v87 = 1;
    int v44 = v43;
    goto LABEL_140;
  }
  if (v45) {
    int v87 = objc_msgSend((id)objc_msgSend(v45, "processingSettings"), "expectedClientImageCount");
  }
  else {
    int v87 = 2;
  }
LABEL_133:
  v88 = v4->_unstyledFullResolutionSbuf;
  if (v88)
  {
    CFRelease(v88);
    v4->_unstyledFullResolutionSbuf = 0;
  }
  v89 = v4->_learnedCoefficientsSbuf;
  if (v89)
  {
    CFRelease(v89);
    v4->_learnedCoefficientsSbuf = 0;
  }
  v90 = v4->_styledFullResolutionSbuf;
  if (v90)
  {
    CFRelease(v90);
    v4->_styledFullResolutionSbuf = 0;
  }
  if (v87 >= 1) {
LABEL_140:
  }
    -[BWStillImageFilterNode _emitNodeErrorForErrorStatus:numberOfNodeErrors:stillImageSettings:metadata:]((uint64_t)v4, v44, v87, (uint64_t)v45, (uint64_t)v97);
}

void __54__BWStillImageFilterNode_renderSampleBuffer_forInput___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  if (a3)
  {

    *(void *)(*(void *)(a1 + 32) + 216) = a3;
  }
  else
  {
    BOOL v6 = *(const void **)(v4 + 224);
    CFTypeRef v7 = CMGetAttachment(*(CMAttachmentBearerRef *)(a1 + 40), @"PortraitStillImageFaceAdjustedBlurMap", 0);
    *(void *)(*(void *)(a1 + 32) + 224) = v7;
    if (v7) {
      CFRetain(v7);
    }
    if (v6) {
      CFRelease(v6);
    }

    *(void *)(*(void *)(a1 + 32) + 240) = BWSampleBufferCopyDictionaryOfAttachedMedia(*(const void **)(a1 + 40));
    *(void *)(*(void *)(a1 + 32) + 248) = (id)CMGetAttachment(*(CMAttachmentBearerRef *)(a1 + 40), @"Inferences", 0);
    CFStringRef v8 = *(const void **)(*(void *)(a1 + 32) + 256);
    CFTypeRef v9 = CMGetAttachment(*(CMAttachmentBearerRef *)(a1 + 40), @"PortraitStillImageAuxDepthMetadata", 0);
    *(void *)(*(void *)(a1 + 32) + 256) = v9;
    if (v9) {
      CFRetain(v9);
    }
    if (v8) {
      CFRelease(v8);
    }
    uint64_t v10 = *(void *)(a1 + 32);
    long long v11 = *(const void **)(v10 + 232);
    uint64_t v12 = (const void *)[*(id *)(v10 + 240) objectForKeyedSubscript:0x1EFA74600];
    *(void *)(*(void *)(a1 + 32) + 232) = v12;
    if (v12) {
      CFRetain(v12);
    }
    if (v11)
    {
      CFRelease(v11);
    }
  }
}

- (uint64_t)_prepareStillImageFilterRenderersForOriginalFilters:(id)a3 processedFilters:(void *)a4 metadata:(void *)a5 settings:(uint64_t)a6 inputDimensions:
{
  if (!result) {
    return result;
  }
  uint64_t v10 = result;
  if ([*(id *)(result + 96) deferredPhotoProcessorEnabled])
  {
    long long v11 = (void *)[a3 mutableCopy];
    if ([a3 count])
    {
      uint64_t v12 = 0;
      while (!objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", v12), "name"), "isEqualToString:", @"CIDepthEffect"))
      {
        if ([a3 count] <= (unint64_t)++v12) {
          goto LABEL_10;
        }
      }
      [v11 removeObjectAtIndex:v12];
      objc_msgSend(v11, "insertObject:atIndex:", objc_msgSend(MEMORY[0x1E4F1E040], "filterWithName:", @"CIDepthEffectMakeBlurMap"), 0);
      objc_msgSend(v11, "addObject:", objc_msgSend(MEMORY[0x1E4F1E040], "filterWithName:", @"CIDepthEffectApplyBlurMap"));
    }
LABEL_10:
    long long v13 = a5;
    a3 = v11;
  }
  else
  {
    long long v13 = a5;
  }
  uint64_t v44 = *(void *)(v10 + 144);
  uint64_t v14 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", objc_msgSend(a2, "valueForKeyPath:", @"name"));
  uint64_t v15 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", objc_msgSend(a3, "valueForKeyPath:", @"name"));
  result = objc_msgSend(v14, "isEqualToSet:", objc_msgSend(*(id *)(v10 + 144), "originalFilterNames"));
  if (result)
  {
    result = objc_msgSend(v15, "isEqualToSet:", objc_msgSend(*(id *)(v10 + 144), "processedFilterNames"));
    int v16 = result ^ 1;
  }
  else
  {
    int v16 = 1;
  }
  uint64_t v17 = v13;
  if (*(unsigned char *)(v10 + 368))
  {
    if ((unint64_t)[*(id *)(v10 + 104) count] < 2) {
      v18 = *(void **)(v10 + 128);
    }
    else {
      v18 = (void *)[a4 objectForKeyedSubscript:*MEMORY[0x1E4F54128]];
    }
    double FinalCropRect = FigCaptureMetadataUtilitiesGetFinalCropRect();
    FigCaptureMetadataUtilitiesComputeDenormalizedStillImageCropRect((int)a6, a6 >> 32, FinalCropRect, v26, v27, v28, (double)objc_msgSend((id)objc_msgSend(v13, "requestedSettings"), "outputWidth")/ (double)objc_msgSend((id)objc_msgSend(v13, "requestedSettings"), "outputHeight"));
    double height = v47.size.height;
    if (CGRectIsNull(v47)) {
      goto LABEL_48;
    }
    float v30 = (float)objc_msgSend((id)objc_msgSend(v13, "requestedSettings"), "outputHeight") / height;
    int v31 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E4F54148]), "intValue");
    if (v31) {
      float v30 = v30 / (float)((float)v31 * 0.5);
    }
    objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E4F53DE8]), "floatValue");
    if (v32 == 0.0) {
      float v32 = 1.0;
    }
    float v33 = fmaxf(v30 * v32, 1.0);
    result = [v18 isEqualToString:*(void *)(v10 + 312)];
    if (result)
    {
      float v34 = *(float *)(v10 + 320);
      BOOL v35 = v33 != v34;
      if (v44) {
        char v36 = v16;
      }
      else {
        char v36 = 1;
      }
      if ((v36 & 1) == 0 && v33 == v34) {
        return result;
      }
    }
    else
    {
      BOOL v35 = 1;
    }
    id v37 = *(id *)(v10 + 312);

    *(void *)(v10 + 144) = 0;
    *(void *)(v10 + 312) = 0;

    *(void *)(v10 + 328) = 0;
    *(_DWORD *)(v10 + 320) = 0;
    *(unsigned char *)(v10 + 424) = 0;
    if (v35)
    {

      *(void *)(v10 + 176) = 0;
      *(void *)(v10 + 184) = 0;
    }
    uint64_t v38 = objc_msgSend((id)objc_msgSend(*(id *)(v10 + 104), "objectForKeyedSubscript:", v18), "sensorIDDictionary");
    *(float *)&double v39 = v33;
    id v40 = +[FigCaptureCameraParameters sdofTuningParametersForSensorIDDictionary:v38 zoomFactor:v39];
    *(void *)(v10 + 328) = v40;
    if (!v40)
    {
LABEL_48:
      fig_log_get_emitter();
      return FigDebugAssert3();
    }
    *(void *)(v10 + 312) = v18;
    *(float *)(v10 + 320) = v33;
    if ([*(id *)(v10 + 96) deferredPhotoProcessorEnabled])
    {
      if ([*(id *)(v10 + 96) optimizedEnhancedResolutionDepthPipelineEnabled]) {
        __int16 v41 = 3;
      }
      else {
        __int16 v41 = 2;
      }
    }
    else
    {
      __int16 v41 = 1;
    }
    int v20 = [BWRenderList alloc];
    uint64_t v21 = *(void *)(v10 + 160);
    uint64_t v24 = v41;
    BOOL v22 = a2;
    id v23 = a3;
LABEL_45:
    CVImageBufferRef v42 = [(BWRenderList *)v20 initWithResourceProvider:v21 originalFilters:v22 processedFilters:v23 optimizationStrategy:v24 stillImageSettings:v17];
    *(void *)(v10 + 144) = v42;
    uint64_t v43 = *(void *)(v10 + 336);
    return [(BWRenderList *)v42 prepareWithParameters:0 forInputVideoFormat:v43 inputMediaPropertiesByAttachedMediaKey:0];
  }
  if (v44) {
    int v19 = v16;
  }
  else {
    int v19 = 1;
  }
  if (v19 == 1)
  {

    int v20 = [BWRenderList alloc];
    uint64_t v21 = *(void *)(v10 + 160);
    BOOL v22 = a2;
    id v23 = a3;
    uint64_t v24 = 1;
    goto LABEL_45;
  }
  return result;
}

- (uint64_t)_downsampleImageForSampleBuffer:(CFTypeRef *)a3 outputSampleBuffer:(uint64_t)a4 dimensions:
{
  if (!a1) {
    return 0;
  }
  int v6 = 0;
  CFTypeRef cf = 0;
  CFTypeRef v13 = 0;
  CFTypeRef v11 = 0;
  if (sbuf && a3)
  {
    CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(sbuf);
    if (ImageBuffer)
    {
      if (!-[BWStillImageFilterNode _downsamplePixelBuffer:outputPixelBuffer:dimensions:](a1, ImageBuffer, (CVPixelBufferRef *)&v11, a4)&& !BWCMSampleBufferCreateCopyWithNewPixelBuffer(sbuf, (__CVBuffer *)v11, &cf, (CMSampleBufferRef *)&v13))
      {
        int v6 = 1;
        goto LABEL_8;
      }
      fig_log_get_emitter();
    }
    else
    {
      fig_log_get_emitter();
    }
    FigDebugAssert3();
    int v6 = 0;
  }
LABEL_8:
  if (cf) {
    CFRelease(cf);
  }
  if (v11) {
    CFRelease(v11);
  }
  if (v6)
  {
    *a3 = v13;
  }
  else if (v13)
  {
    CFRelease(v13);
  }
  return 0;
}

- (void)_emitSampleBufferAsync:(uint64_t)a1
{
  if (a1)
  {
    if (cf)
    {
      CFRetain(cf);
      uint64_t v4 = *(NSObject **)(a1 + 408);
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __49__BWStillImageFilterNode__emitSampleBufferAsync___block_invoke;
      v5[3] = &unk_1E5C24F10;
      v5[4] = a1;
      v5[5] = cf;
      dispatch_async(v4, v5);
    }
  }
}

- (uint64_t)_downsampleAttachedMediaForSampleBuffer:(uint64_t)a1
{
  v22[6] = *(CFTypeRef *)MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  if (a2)
  {
    id v4 = BWSampleBufferCopyDictionaryOfAttachedMedia(a2);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v22[0] = @"PersonSegmentationMask";
    v22[1] = @"PersonSemanticsHair";
    v22[2] = @"PersonSemanticsGlasses";
    v22[3] = @"RefinedDepth";
    v22[4] = @"Depth";
    v22[5] = @"GainMap";
    id v5 = (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:6];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          uint64_t v11 = [v4 objectForKeyedSubscript:v10];
          if (v11)
          {
            uint64_t v12 = (opaqueCMSampleBuffer *)v11;
            v22[0] = 0;
            int v13 = [v10 isEqualToString:@"Depth"];
            uint64_t v14 = &OBJC_IVAR___BWStillImageFilterNode__maskDimensions;
            if (v13) {
              uint64_t v14 = &OBJC_IVAR___BWStillImageFilterNode__depthDataMapDimensions;
            }
            -[BWStillImageFilterNode _downsampleImageForSampleBuffer:outputSampleBuffer:dimensions:](a1, v12, v22, *(void *)(a1 + *v14));
            if (!v22[0])
            {
              fig_log_get_emitter();
              FigDebugAssert3();
              goto LABEL_18;
            }
            BWSampleBufferSetAttachedMedia(a2, (uint64_t)v10, (uint64_t)v22[0]);
            if (v22[0]) {
              CFRelease(v22[0]);
            }
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_18:
    uint64_t v15 = 0;
  }
  else
  {
    id v4 = 0;
    uint64_t v15 = 4294954516;
  }

  return v15;
}

void __54__BWStillImageFilterNode_renderSampleBuffer_forInput___block_invoke_70(uint64_t a1, unint64_t a2, void *target, void *a4)
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  int v8 = objc_msgSend((id)CMGetAttachment(target, @"StillImageProcessingFlags", 0), "unsignedIntValue");
  int v9 = BWIsSmartStyleAllowedForAdjustedImage(*(void **)(a1 + 32));
  if (v9) {
    BOOL v10 = [a4 code] == -2;
  }
  else {
    BOOL v10 = 0;
  }
  uint64_t v11 = BWStillImageProcessingFlagsForSampleBuffer(*(const void **)(a1 + 56));
  int v12 = v8 | 0x800000;
  if (!v10) {
    int v12 = v8;
  }
  if (a4 && !v10)
  {
    int v38 = [a4 code];
    int v55 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    int v37 = 1;
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    int v25 = 0;
    LODWORD(v26) = 0;
    if (v38) {
      goto LABEL_61;
    }
    goto LABEL_57;
  }
  if (!target)
  {
    int v25 = 0;
    LODWORD(v26) = 0;
    int v38 = -12786;
    goto LABEL_60;
  }
  if (a2 == 1)
  {
    if (*(unsigned char *)(a1 + 76))
    {
      uint64_t v13 = v12 | 4u;
      CMSampleBufferRef sampleBufferOut = 0;
      if (*(unsigned char *)(a1 + 77)) {
        BWCMSampleBufferCreateCopyIncludingMetadata((CMSampleBufferRef)target, &sampleBufferOut);
      }
      else {
        CMSampleBufferRef sampleBufferOut = (CMSampleBufferRef)CFRetain(target);
      }
      if (*(unsigned char *)(a1 + 78) && !*(unsigned char *)(a1 + 79)) {
        CMSetAttachment(sampleBufferOut, @"SDOFCustomRendered", (CFTypeRef)[NSNumber numberWithShort:9], 1u);
      }
      CMSetAttachment(sampleBufferOut, @"StillImageProcessingFlags", (CFTypeRef)[NSNumber numberWithUnsignedInt:v13], 1u);
      -[BWStillImageFilterNode _emitSampleBufferAsync:](*(void *)(a1 + 40), sampleBufferOut);
      if (sampleBufferOut) {
        CFRelease(sampleBufferOut);
      }
      LODWORD(v26) = 0;
      int v25 = 1;
      goto LABEL_57;
    }
    goto LABEL_28;
  }
  if ((a2 & 2) == 0)
  {
LABEL_56:
    int v25 = 0;
    uint64_t v26 = (a2 >> 1) & 1;
    if (a2) {
      goto LABEL_57;
    }
    int v38 = -12780;
LABEL_60:
    int v37 = 1;
    goto LABEL_61;
  }
  if (*(unsigned char *)(a1 + 77))
  {
    unsigned int v14 = v11 & 0x800000;
    int v15 = v12 | (4 * (a2 & 1));
    int v16 = &unk_1E5C2C000;
    if (*(unsigned char *)(a1 + 78))
    {
      unsigned int v49 = v11 & 0x800000;
      int v17 = v15 | 0x48;
      if (*(_DWORD *)(*(void *)(a1 + 40) + 380))
      {
        long long v52 = 0u;
        long long v53 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        CMSampleBufferRef sampleBufferOut = (CMSampleBufferRef)@"PersonSegmentationMask";
        int v58 = @"PersonSemanticsHair";
        uint64_t v59 = @"PersonSemanticsGlasses";
        uint64_t v60 = 0x1EFA74440;
        int v61 = @"Depth";
        uint64_t v62 = 0x1EFA4EB60;
        long long v18 = (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:&sampleBufferOut count:6];
        CMSampleBufferRef sampleBufferOut = (CMSampleBufferRef)@"PersonSemanticsSkin";
        int v58 = @"PersonSemanticsTeeth";
        long long v19 = objc_msgSend(v18, "arrayByAddingObjectsFromArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &sampleBufferOut, 2));
        uint64_t v20 = [v19 countByEnumeratingWithState:&v50 objects:v56 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v51;
          do
          {
            for (uint64_t i = 0; i != v21; ++i)
            {
              if (*(void *)v51 != v22) {
                objc_enumerationMutation(v19);
              }
              BWSampleBufferRemoveAttachedMedia(target, *(void *)(*((void *)&v50 + 1) + 8 * i));
            }
            uint64_t v21 = [v19 countByEnumeratingWithState:&v50 objects:v56 count:16];
          }
          while (v21);
        }
      }
      if (*(unsigned char *)(a1 + 79)) {
        uint64_t v24 = 7;
      }
      else {
        uint64_t v24 = 8;
      }
      CMSetAttachment(target, @"SDOFCustomRendered", (CFTypeRef)[NSNumber numberWithShort:v24], 1u);
      int v16 = (void *)&unk_1E5C2C000;
      unsigned int v14 = v49;
    }
    else
    {
      int v17 = v15 | 8;
    }
    int v27 = v10 | (v14 >> 23);
    int v28 = BWCIFilterArrayContainsPortraitEffectStageFilters(*(void **)(a1 + 48), 1);
    uint64_t v29 = v16[297];
    AttachedMedia = (const void *)BWSampleBufferGetAttachedMedia(target, v29);
    if ((objc_msgSend((id)objc_msgSend((id)CMGetAttachment(AttachedMedia, (CFStringRef)*MEMORY[0x1E4F53070], 0), "objectForKeyedSubscript:", *MEMORY[0x1E4F53318]), "intValue") & 0xFFFE0000) != 0)int v31 = v28; {
    else
    }
      int v31 = 0;
    if (v31 == 1) {
      BWSampleBufferRemoveAttachedMedia(target, v29);
    }
    int v32 = v17 | 0x200000;
    if (v27) {
      int v32 = v17;
    }
    if (v9) {
      int v33 = v32;
    }
    else {
      int v33 = v17;
    }
    uint64_t v34 = *(void *)(*(void *)(a1 + 40) + 232);
    if (v34) {
      goto LABEL_51;
    }
    BOOL v35 = (const void *)BWSampleBufferGetAttachedMedia(target, 0x1EFA74600);
    if (v35) {
      BOOL v35 = CFRetain(v35);
    }
    *(void *)(*(void *)(a1 + 40) + 232) = v35;
    uint64_t v34 = *(void *)(*(void *)(a1 + 40) + 232);
    if (v34)
    {
LABEL_51:
      if ((v31 & 1) == 0) {
        BWSampleBufferSetAttachedMedia(target, v29, v34);
      }
      BWSampleBufferRemoveAttachedMedia(target, 0x1EFA74600);
      char v36 = *(const void **)(*(void *)(a1 + 40) + 232);
      if (v36)
      {
        CFRelease(v36);
        *(void *)(*(void *)(a1 + 40) + 232) = 0;
      }
    }
    BWStillImageSetProcessingFlagsForSampleBuffer(target, v33);
    -[BWStillImageFilterNode _emitSampleBufferAsync:](*(void *)(a1 + 40), target);
    goto LABEL_56;
  }
LABEL_28:
  int v25 = 0;
  LODWORD(v26) = 0;
LABEL_57:
  if (!*(_DWORD *)(a1 + 72)) {
    goto LABEL_71;
  }
  int v37 = 0;
  int v38 = 0;
LABEL_61:
  CFTypeRef v39 = CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  if (v37 && *(unsigned char *)(a1 + 76) && !v25) {
    -[BWStillImageFilterNode _emitNodeErrorForErrorStatus:numberOfNodeErrors:stillImageSettings:metadata:](*(void *)(a1 + 40), v38, 1, *(void *)(a1 + 32), (uint64_t)v39);
  }
  int v40 = v26 ^ 1;
  if (!*(unsigned char *)(a1 + 77)) {
    int v40 = 0;
  }
  if ((v37 & v40) == 1) {
    -[BWStillImageFilterNode _emitNodeErrorForErrorStatus:numberOfNodeErrors:stillImageSettings:metadata:](*(void *)(a1 + 40), v38, 1, *(void *)(a1 + 32), (uint64_t)v39);
  }
  int v41 = *(_DWORD *)(a1 + 72);
  if (v41) {
    -[BWStillImageFilterNode _emitNodeErrorForErrorStatus:numberOfNodeErrors:stillImageSettings:metadata:](*(void *)(a1 + 40), v41, 1, *(void *)(a1 + 32), (uint64_t)v39);
  }
LABEL_71:
  CVImageBufferRef v42 = *(void **)(a1 + 40);
  uint64_t v43 = (const void *)v42[35];
  if (v43)
  {
    CFRelease(v43);
    *(void *)(*(void *)(a1 + 40) + 280) = 0;
    CVImageBufferRef v42 = *(void **)(a1 + 40);
  }
  uint64_t v44 = (const void *)v42[37];
  if (v44)
  {
    CFRelease(v44);
    *(void *)(*(void *)(a1 + 40) + 296) = 0;
    CVImageBufferRef v42 = *(void **)(a1 + 40);
  }
  v45 = (const void *)v42[36];
  if (v45)
  {
    CFRelease(v45);
    *(void *)(*(void *)(a1 + 40) + 288) = 0;
  }
  v46 = *(const void **)(a1 + 56);
  if (v46) {
    CFRelease(v46);
  }
  CGRect v47 = *(const void **)(a1 + 64);
  if (v47) {
    CFRelease(v47);
  }
}

- (void)_emitNodeErrorForErrorStatus:(int)a3 numberOfNodeErrors:(uint64_t)a4 stillImageSettings:(uint64_t)a5 metadata:
{
  if (a1)
  {
    id v5 = *(NSObject **)(a1 + 408);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __102__BWStillImageFilterNode__emitNodeErrorForErrorStatus_numberOfNodeErrors_stillImageSettings_metadata___block_invoke;
    v6[3] = &unk_1E5C285A0;
    int v7 = a3;
    int v8 = a2;
    v6[4] = a1;
    v6[5] = a4;
    v6[6] = a5;
    dispatch_async(v5, v6);
  }
}

- (void)handleNodeError:(id)a3 forInput:(id)a4
{
  if ([(BWStillImageNodeConfiguration *)self->_nodeConfiguration optimizedEnhancedResolutionDepthPipelineEnabled])
  {
    -[BWStillImageFilterStatusDelegate filterNodeDidReceiveStandardResolutionDeepFusionBuffer:error:](self->_statusDelegate, "filterNodeDidReceiveStandardResolutionDeepFusionBuffer:error:", 0, [a3 errorCode]);
  }
  [(BWRenderListProcessor *)self->_renderListProcessor waitForAllProcessingToComplete];
  emitQueue = self->_emitQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__BWStillImageFilterNode_handleNodeError_forInput___block_invoke;
  v7[3] = &unk_1E5C24458;
  v7[4] = a3;
  v7[5] = self;
  dispatch_async(emitQueue, v7);
}

uint64_t __51__BWStillImageFilterNode_handleNodeError_forInput___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "stillImageSettings"), "processingSettings"), "expectedClientImageCount");
  if ((int)result >= 1)
  {
    int v3 = 0;
    do
    {
      [*(id *)(*(void *)(a1 + 40) + 16) emitNodeError:*(void *)(a1 + 32)];
      ++v3;
      uint64_t result = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "stillImageSettings"), "processingSettings"), "expectedClientImageCount");
    }
    while (v3 < (int)result);
  }
  return result;
}

- (void)didReachEndOfDataForInput:(id)a3
{
  [(BWRenderListProcessor *)self->_renderListProcessor waitForAllProcessingToComplete];
  emitQueue = self->_emitQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__BWStillImageFilterNode_didReachEndOfDataForInput___block_invoke;
  block[3] = &unk_1E5C24430;
  block[4] = self;
  dispatch_async(emitQueue, block);

  self->_mtlCommandQueue = 0;
}

uint64_t __52__BWStillImageFilterNode_didReachEndOfDataForInput___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) markEndOfLiveOutput];
}

- (int)smartStyleRenderingVersion
{
  return self->_smartStyleRenderingVersion;
}

- (uint64_t)_downsamplePixelBuffer:(CVPixelBufferRef *)a3 outputPixelBuffer:(uint64_t)a4 dimensions:
{
  if (!a1) {
    return 0;
  }
  id v5 = 0;
  CVPixelBufferRef pixelBufferOut = 0;
  uint64_t v6 = 4294954516;
  if (a2 && a3)
  {
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:CVPixelBufferGetAttributes()];
    if (v5)
    {
      uint64_t v10 = [NSNumber numberWithInt:a4];
      [v5 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F24E10]];
      uint64_t v11 = [NSNumber numberWithInt:HIDWORD(a4)];
      [v5 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F24D08]];
      CFAllocatorRef v12 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a2);
      uint64_t v14 = CVPixelBufferCreate(v12, (int)a4, a4 >> 32, PixelFormatType, (CFDictionaryRef)v5, &pixelBufferOut);
      if (!v14)
      {
        OSType v15 = CVPixelBufferGetPixelFormatType(a2);
        if (FigDepthFormatIsDepth(v15) || FigDepthFormatIsDisparity(v15))
        {
          uint64_t v14 = FigDepthScaleBuffer(a2, pixelBufferOut);
          if (!v14)
          {
LABEL_9:

            uint64_t v6 = 0;
            *a3 = pixelBufferOut;
            return v6;
          }
        }
        else
        {
          uint64_t v14 = VTSessionSetProperty(*(VTSessionRef *)(a1 + 384), (CFStringRef)*MEMORY[0x1E4F45168], (CFTypeRef)*MEMORY[0x1E4F45460]);
          if (!v14)
          {
            uint64_t v14 = VTPixelTransferSessionTransferImage(*(VTPixelTransferSessionRef *)(a1 + 384), a2, pixelBufferOut);
            if (!v14) {
              goto LABEL_9;
            }
          }
        }
      }
      uint64_t v6 = v14;
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      uint64_t v6 = 4294954510;
    }
  }

  if (pixelBufferOut) {
    CFRelease(pixelBufferOut);
  }
  return v6;
}

void __49__BWStillImageFilterNode__emitSampleBufferAsync___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) emitSampleBuffer:*(void *)(a1 + 40)];
  uint64_t v2 = *(const void **)(a1 + 40);
  CFRelease(v2);
}

void __102__BWStillImageFilterNode__emitNodeErrorForErrorStatus_numberOfNodeErrors_stillImageSettings_metadata___block_invoke(uint64_t a1)
{
  if (*(int *)(a1 + 56) >= 1)
  {
    int v2 = 0;
    do
    {
      id v3 = +[BWNodeError newError:*(unsigned int *)(a1 + 60) sourceNode:*(void *)(a1 + 32) stillImageSettings:*(void *)(a1 + 40) metadata:*(void *)(a1 + 48)];
      [*(id *)(*(void *)(a1 + 32) + 16) emitNodeError:v3];

      ++v2;
    }
    while (v2 < *(_DWORD *)(a1 + 56));
  }
}

- (id)provideStreamingSDOFFilterRenderer
{
  return 0;
}

- (uint64_t)_provideCIContext
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t result = *(void *)(result + 168);
    if (!result)
    {
      int v2 = 0;
      *(void *)(v1 + 168) = +[BWCoreImageFilterRenderer context:deferredPhotoProcessorEnabled:err:](BWCoreImageFilterRenderer, "context:deferredPhotoProcessorEnabled:err:", *(unsigned __int8 *)(v1 + 368), [*(id *)(v1 + 96) deferredPhotoProcessorEnabled], &v2);
      if ([*(id *)(v1 + 96) deferredPhotoProcessorEnabled])
      {
        [*(id *)(v1 + 168) loadArchiveWithName:@"ccportrait_archive", objc_msgSend(BWLoadProcessorBundle(@"CCPortrait", 0xFFFFFFFFLL), "bundleURL") fromURL];
        [*(id *)(v1 + 168) loadArchive:*MEMORY[0x1E4F1E530]];
      }
      if (v2)
      {
        fig_log_get_emitter();
        FigDebugAssert3();
      }
      return *(void *)(v1 + 168);
    }
  }
  return result;
}

- (id)provideCoreImageFilterRenderer
{
  id v2 = -[BWCoreImageFilterRenderer initForRenderingWithDepth:context:portraitRenderQuality:hairnetEnabled:metalCommandQueue:figThreadPriority:]([BWCoreImageFilterRenderer alloc], "initForRenderingWithDepth:context:portraitRenderQuality:hairnetEnabled:metalCommandQueue:figThreadPriority:", self->_depthDataDeliveryEnabled, -[BWStillImageFilterNode _provideCIContext]((uint64_t)self), self->_portraitRenderQuality, self->_hairnetEnabled, self->_mtlCommandQueue, [(BWStillImageNodeConfiguration *)self->_nodeConfiguration figThreadPriority]);
  return v2;
}

- (id)provideStillImageMetalSDOFRenderer
{
  metalSDOFRenderer = self->_metalSDOFRenderer;
  if (!metalSDOFRenderer)
  {
    metalSDOFRenderer = [[BWStillImageMetalSDOFRenderer alloc] initWithSDOFRenderingTuningParameters:self->_currentSDOFRenderingParameters imageDimensions:*(void *)&self->_outputDimensions depthDataMapDimensions:*(void *)&self->_depthDataMapDimensions portraitRenderQuality:self->_portraitRenderQuality metalCommandQueue:self->_mtlCommandQueue];
    self->_metalSDOFRenderer = metalSDOFRenderer;
  }
  id v4 = metalSDOFRenderer;
  return v4;
}

- (id)provideStillImageMetalBlurMapRenderer
{
  metalBlurMapRenderer = self->_metalBlurMapRenderer;
  if (!metalBlurMapRenderer)
  {
    metalBlurMapRenderer = [[BWStillImageMetalBlurMapRenderer alloc] initWithSDOFRenderingTuningParameters:self->_currentSDOFRenderingParameters imageDimensions:*(void *)&self->_outputDimensions depthDataMapDimensions:*(void *)&self->_depthDataMapDimensions portraitRenderQuality:self->_portraitRenderQuality metalCommandQueue:self->_mtlCommandQueue backPressureDrivenPipelining:self->_backPressureDrivenPipelining];
    self->_metalBlurMapRenderer = metalBlurMapRenderer;
  }
  id v4 = metalBlurMapRenderer;
  return v4;
}

- (id)provideApplySmartStyleRenderer
{
  applySmartStyleRenderer = self->_applySmartStyleRenderer;
  if (!applySmartStyleRenderer)
  {
    if (self->_smartStyleRenderingVersion < 1)
    {
      applySmartStyleRenderer = 0;
    }
    else
    {
      applySmartStyleRenderer = [[BWApplySmartStyleRenderer alloc] initWithMetalCommandQueue:self->_mtlCommandQueue smartStyleRenderingVersion:self->_smartStyleRenderingVersion];
      self->_applySmartStyleRenderer = applySmartStyleRenderer;
    }
  }
  id v4 = applySmartStyleRenderer;
  return v4;
}

- (id)provideMetalFilterRenderer
{
  metalFilterRenderer = self->_metalFilterRenderer;
  if (!metalFilterRenderer)
  {
    metalFilterRenderer = [[BWMetalColorCubeRenderer alloc] initWithMetalCommandQueue:self->_mtlCommandQueue mixInGammaDomain:0];
    self->_metalFilterRenderer = metalFilterRenderer;
  }
  id v4 = metalFilterRenderer;
  return v4;
}

- (id)provideStillImageCoreImageBlurMapRenderer
{
  coreImageBlurMapRenderer = self->_coreImageBlurMapRenderer;
  if (!coreImageBlurMapRenderer)
  {
    coreImageBlurMapRenderer = -[BWStillImageCoreImageBlurMapRenderer initForRenderingWithContext:hairnetEnabled:]([BWStillImageCoreImageBlurMapRenderer alloc], "initForRenderingWithContext:hairnetEnabled:", -[BWStillImageFilterNode _provideCIContext]((uint64_t)self), self->_hairnetEnabled);
    self->_coreImageBlurMapRenderer = coreImageBlurMapRenderer;
  }
  id v4 = coreImageBlurMapRenderer;
  return v4;
}

- (id)provideColorLookupCache
{
  return self->_colorLookupCache;
}

@end