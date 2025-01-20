@interface BWOverCaptureSmartStyleApplyNode
+ (void)initialize;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_getSampleBufferPresentationTimeStamp:(SEL)a3;
- (BOOL)_canRenderWithStyleEngineApplyForInput:(opaqueCMSampleBuffer *)a3;
- (BWOverCaptureSmartStyleApplyNode)initWithMetalCommandQueue:(id)a3;
- (double)_computeAffineTransform:(int)a3 mirror:(int)a4;
- (id)_updateSupportedPixelFormats;
- (id)nodeSubType;
- (id)nodeType;
- (int)_applySmartStyleOnSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (int)_applySmartStyleProxyRenderingWithMethod:(int)a3 onSampleBuffer:(opaqueCMSampleBuffer *)a4;
- (int)_getMirrorConfigForPixelBuffer:(__CVBuffer *)a3;
- (int)_getRotationConfigForPixelBuffer:(__CVBuffer *)a3;
- (int)_loadAndConfigureSmartStyleBundle;
- (int)_loadAndConfigureSmartStyleProxyRenderer;
- (int)maxLossyCompressionLevel;
- (uint64_t)_calculateExtrapolationAndSpotlightZoom:(double)a3 inputCropRectWithinPrimaryCaptureRect:(double)a4 learningROIRect:(CGFloat)a5 adjustedPrimaryCaptureRect:(CGFloat)a6 adjustedSpotlightZoomRect:(CGFloat)a7;
- (void)_consumeSampleBufferAttachments:(opaqueCMSampleBuffer *)a3;
- (void)_updateCurrentStyle:(opaqueCMSampleBuffer *)a3;
- (void)dealloc;
- (void)didReachEndOfDataForInput:(id)a3;
- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5;
- (void)prepareForCurrentConfigurationToBecomeLive;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
- (void)setMaxLossyCompressionLevel:(int)a3;
@end

@implementation BWOverCaptureSmartStyleApplyNode

+ (void)initialize
{
}

- (BWOverCaptureSmartStyleApplyNode)initWithMetalCommandQueue:(id)a3
{
  v16.receiver = self;
  v16.super_class = (Class)BWOverCaptureSmartStyleApplyNode;
  v4 = [(BWNode *)&v16 init];
  v5 = v4;
  if (v4)
  {
    uint64_t v6 = [(BWOverCaptureSmartStyleApplyNode *)v4 _updateSupportedPixelFormats];
    if (!v6) {
      goto LABEL_8;
    }
    uint64_t v7 = v6;
    v5->_renderingMethod = 1;
    v5->_maxLossyCompressionLevel = 0;
    v5->_metalCommandQueue = (MTLCommandQueue *)a3;
    v5->_firstFrame = 1;
    v8 = objc_alloc_init(BWVideoFormatRequirements);
    if (!v8) {
      goto LABEL_8;
    }
    v9 = v8;
    [(BWVideoFormatRequirements *)v8 setSupportedPixelFormats:v7];
    v10 = [[BWNodeInput alloc] initWithMediaType:1986618469 node:v5];
    [(BWNodeInput *)v10 setFormatRequirements:v9];
    [(BWNodeInput *)v10 setPassthroughMode:1];
    v11 = objc_alloc_init(BWNodeInputMediaConfiguration);
    [(BWNodeInputMediaConfiguration *)v11 setFormatRequirements:objc_alloc_init(BWVideoFormatRequirements)];
    [(BWNodeInputMediaConfiguration *)v11 setPassthroughMode:0];
    [(BWNodeInputMediaConfiguration *)v11 setRetainedBufferCount:6];
    [(BWNodeInput *)v10 setMediaConfiguration:v11 forAttachedMediaKey:0x1EFA74840];
    [(BWNode *)v5 addInput:v10];
    v12 = objc_alloc_init(BWVideoFormatRequirements);
    if (!v12) {
      goto LABEL_8;
    }
    v13 = v12;
    [(BWVideoFormatRequirements *)v12 setSupportedPixelFormats:v7];
    v14 = [[BWNodeOutput alloc] initWithMediaType:1986618469 node:v5];
    [(BWNodeOutput *)v14 setFormatRequirements:v13];
    [(BWNodeOutput *)v14 setPassthroughMode:1];
    [(BWNode *)v5 addOutput:v14];
    if (![(BWOverCaptureSmartStyleApplyNode *)v5 _loadAndConfigureSmartStyleBundle])
    {
      v5->_applyDither = 1;
    }
    else
    {
LABEL_8:
      fig_log_get_emitter();
      FigDebugAssert3();
      return 0;
    }
  }
  return v5;
}

- (void)setMaxLossyCompressionLevel:(int)a3
{
  if (self->_maxLossyCompressionLevel != a3)
  {
    v5 = [(BWNodeInput *)self->super._input formatRequirements];
    uint64_t v6 = [(BWNodeOutput *)self->super._output formatRequirements];
    self->_maxLossyCompressionLevel = a3;
    id v7 = [(BWOverCaptureSmartStyleApplyNode *)self _updateSupportedPixelFormats];
    if (v7)
    {
      id v8 = v7;
      [(BWFormatRequirements *)v5 setSupportedPixelFormats:v7];
      [(BWFormatRequirements *)v6 setSupportedPixelFormats:v8];
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
  }
}

- (void)dealloc
{
  objc_msgSend((id)-[CMISmartStyleProcessor utilities](self->_smartStyleProcessor, "utilities"), "resetCoefficientsFilter");
  identityCoefficientsPixelBuffer = self->_identityCoefficientsPixelBuffer;
  if (identityCoefficientsPixelBuffer) {
    CFRelease(identityCoefficientsPixelBuffer);
  }
  mostRecentCoefficients = self->_mostRecentCoefficients;
  if (mostRecentCoefficients) {
    CFRelease(mostRecentCoefficients);
  }

  previewThumbnailBuffer = self->_previewThumbnailBuffer;
  if (previewThumbnailBuffer) {
    CFRelease(previewThumbnailBuffer);
  }
  v6.receiver = self;
  v6.super_class = (Class)BWOverCaptureSmartStyleApplyNode;
  [(BWNode *)&v6 dealloc];
}

- (id)nodeType
{
  return @"Effect";
}

- (id)nodeSubType
{
  return @"SmartStylePostStitcherApply";
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5
{
  v14[1] = *MEMORY[0x1E4F143B8];
  if (!a3 || !a4) {
    goto LABEL_11;
  }
  if ([a5 isEqualToString:@"PrimaryFormat"])
  {
    v9 = [(BWNodeOutput *)self->super._output formatRequirements];
    -[BWFormatRequirements setWidth:](v9, "setWidth:", [a3 width]);
    -[BWFormatRequirements setHeight:](v9, "setHeight:", [a3 height]);
    v14[0] = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a3, "pixelFormat"));
    -[BWFormatRequirements setSupportedPixelFormats:](v9, "setSupportedPixelFormats:", [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1]);
    uint64_t v13 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(a3, "colorSpaceProperties"));
    -[BWFormatRequirements setSupportedColorSpaceProperties:](v9, "setSupportedColorSpaceProperties:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1]);
    [(BWNodeOutput *)self->super._output setFormat:a3];
    return;
  }
  if ([a5 isEqual:0x1EFA74840])
  {
    v10 = [BWPixelBufferPool alloc];
    v11 = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:](v10, "initWithVideoFormat:capacity:name:memoryPool:", a3, self->_filteredCoefficientsPixelBufferPoolSize, [NSString stringWithFormat:@"BWOverCaptureSmartStyleApplyNode filtered coefficients buffer pool"], -[BWNodeOutput memoryPool](self->super._output, "memoryPool"));
    self->_filteredCoefficientsPixelBufferPool = v11;
    if (!v11)
    {
LABEL_11:
      fig_log_get_emitter();
      FigDebugAssert3();
    }
  }
  else if ((objc_msgSend(BWAttachedMediaKeysRequiredBySmartStyleRenderingPipelines(1, 1), "containsObject:", a5) & 1) == 0)
  {
    v12.receiver = self;
    v12.super_class = (Class)BWOverCaptureSmartStyleApplyNode;
    [(BWNode *)&v12 didSelectFormat:a3 forInput:a4 forAttachedMediaKey:a5];
  }
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  v3.receiver = self;
  v3.super_class = (Class)BWOverCaptureSmartStyleApplyNode;
  [(BWNode *)&v3 prepareForCurrentConfigurationToBecomeLive];
  if (-[BWOverCaptureSmartStyleApplyNode _loadAndConfigureSmartStyleProxyRenderer](self, "_loadAndConfigureSmartStyleProxyRenderer")|| -[CMISmartStyleProcessor setup](self->_smartStyleProcessor, "setup")|| -[CMISmartStyleProcessor prepareToProcess:](self->_smartStyleProcessor, "prepareToProcess:", 4)|| objc_msgSend((id)-[CMISmartStyleProcessor utilities](self->_smartStyleProcessor, "utilities"), "resetCoefficientsFilter"))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  else
  {
    self->_currentGlobalLocalMixFactor = 1.0;
  }
}

- (void)didReachEndOfDataForInput:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)BWOverCaptureSmartStyleApplyNode;
  [(BWNode *)&v3 didReachEndOfDataForInput:a3];
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  if (!a3
    || !a4
    || ([(BWOverCaptureSmartStyleApplyNode *)self _updateCurrentStyle:a3],
        uint64_t renderingMethod = self->_renderingMethod,
        !CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0)))
  {
    fig_log_get_emitter();
    uint64_t v11 = v4;
    LODWORD(v10) = 0;
LABEL_12:
    FigDebugAssert3();
    goto LABEL_9;
  }
  if (renderingMethod == 1)
  {
    [(BWOverCaptureSmartStyleApplyNode *)self _canRenderWithStyleEngineApplyForInput:a3];
    int v8 = [(BWOverCaptureSmartStyleApplyNode *)self _applySmartStyleOnSampleBuffer:a3];
    if (v8)
    {
LABEL_11:
      int v9 = v8;
      fig_log_get_emitter();
      uint64_t v11 = v4;
      LODWORD(v10) = v9;
      goto LABEL_12;
    }
  }
  else if (renderingMethod)
  {
    int v8 = [(BWOverCaptureSmartStyleApplyNode *)self _applySmartStyleProxyRenderingWithMethod:renderingMethod onSampleBuffer:a3];
    if (v8) {
      goto LABEL_11;
    }
  }
LABEL_9:
  -[BWOverCaptureSmartStyleApplyNode _consumeSampleBufferAttachments:](self, "_consumeSampleBufferAttachments:", a3, v10, v11);
  [(BWNodeOutput *)self->super._output emitSampleBuffer:a3];
  self->_firstFrame = 0;
}

- (void)_updateCurrentStyle:(opaqueCMSampleBuffer *)a3
{
  uint64_t v4 = objc_msgSend((id)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0), "objectForKeyedSubscript:", *MEMORY[0x1E4F534C8]);
  if (v4)
  {
    id v5 = +[FigCaptureSmartStyle createFromDictionary:v4];
    if (v5)
    {
      objc_super v6 = v5;
      currentStyle = self->_currentStyle;
      if (!currentStyle) {
        currentStyle = (CMISmartStyle *)objc_alloc_init(self->_smartStyleClass);
      }
      self->_currentStyle = currentStyle;
      -[CMISmartStyle setCastType:](self->_currentStyle, "setCastType:", [v6 cast]);
      [v6 intensity];
      -[CMISmartStyle setCastIntensity:](self->_currentStyle, "setCastIntensity:");
      [v6 toneBias];
      -[CMISmartStyle setToneBias:](self->_currentStyle, "setToneBias:");
      [v6 colorBias];
      int v8 = self->_currentStyle;
      -[CMISmartStyle setColorBias:](v8, "setColorBias:");
    }
  }
}

- (BOOL)_canRenderWithStyleEngineApplyForInput:(opaqueCMSampleBuffer *)a3
{
  return BWSampleBufferGetAttachedMedia(a3, 0x1EFA74840) != 0;
}

- (int)_applySmartStyleOnSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  CFTypeRef v87 = 0;
  CMSampleBufferRef v88 = 0;
  CMTimeValue value = *MEMORY[0x1E4F1FA48];
  CMTimeScale timescale = *(_DWORD *)(MEMORY[0x1E4F1FA48] + 8);
  CGSize v4 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
  rect.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
  rect.size = v4;
  v85.origin = rect.origin;
  v85.size = v4;
  v84.origin = rect.origin;
  v84.size = v4;
  v83.origin = rect.origin;
  v83.size = v4;
  float v82 = 0.0;
  id v5 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (!a3)
  {
    CMTimeFlags v75 = *(_DWORD *)(MEMORY[0x1E4F1FA48] + 12);
    CMTimeEpoch epoch = *(void *)(MEMORY[0x1E4F1FA48] + 16);
    fig_log_get_emitter();
LABEL_89:
    FigDebugAssert3();
    goto LABEL_90;
  }
  if (!self)
  {
    id v17 = 0;
    CMTimeEpoch epoch = 0;
    CMTimeFlags v75 = 0;
    CFDictionaryRef v18 = 0;
    ImageBuffer = 0;
    CMTimeScale timescale = 0;
    CMTimeValue value = 0;
LABEL_14:
    int v19 = -12780;
    goto LABEL_75;
  }
  -[BWOverCaptureSmartStyleApplyNode _getSampleBufferPresentationTimeStamp:](self, "_getSampleBufferPresentationTimeStamp:");
  CMTimeEpoch epoch = time.duration.epoch;
  CMTimeValue value = time.duration.value;
  CMTimeFlags flags = time.duration.flags;
  CMTimeScale timescale = time.duration.timescale;
  CMTimeFlags v75 = time.duration.flags;
  if ((time.duration.flags & 1) == 0)
  {
LABEL_90:
    id v17 = 0;
    CFDictionaryRef v18 = 0;
    ImageBuffer = 0;
    goto LABEL_14;
  }
  if (!self->_didSetTimeToStartStyleEngineBypass)
  {
    time.duration.CMTimeValue value = value;
    time.duration.CMTimeScale timescale = timescale;
    float v10 = CMTimeGetSeconds(&time.duration) + 0.5;
    self->_timeToStartStyleEngineBypass = v10;
    self->_didSetTimeToStartStyleEngineBypass = 1;
  }
  if (*v5 == 1)
  {
    time.duration.CMTimeValue value = value;
    time.duration.CMTimeScale timescale = timescale;
    time.duration.CMTimeFlags flags = flags;
    time.duration.CMTimeEpoch epoch = epoch;
    CMTimeGetSeconds(&time.duration);
    kdebug_trace();
  }
  ImageBuffer = CMSampleBufferGetImageBuffer(a3);
  if (!ImageBuffer)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    id v17 = 0;
    CFDictionaryRef v18 = 0;
    goto LABEL_14;
  }
  [(BWOverCaptureSmartStyleApplyNode *)self _computeAffineTransform:[(BWOverCaptureSmartStyleApplyNode *)self _getRotationConfigForPixelBuffer:ImageBuffer] mirror:[(BWOverCaptureSmartStyleApplyNode *)self _getMirrorConfigForPixelBuffer:ImageBuffer]];
  long long v73 = v13;
  long long v74 = v12;
  long long v72 = v14;
  CFTypeRef v15 = CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  if (!v15)
  {
    fig_log_get_emitter();
    goto LABEL_89;
  }
  objc_super v16 = (void *)v15;
  if (BWSmartStyleRenderingShouldBeBypassed(a3))
  {
    time.duration.CMTimeValue value = value;
    time.duration.CMTimeScale timescale = timescale;
    time.duration.CMTimeFlags flags = flags;
    time.duration.CMTimeEpoch epoch = epoch;
    if (CMTimeGetSeconds(&time.duration) > self->_timeToStartStyleEngineBypass)
    {
      id v17 = 0;
      CFDictionaryRef v18 = 0;
      ImageBuffer = 0;
      int v19 = 0;
      self->_currentGlobalLocalMixFactor = 1.0;
      goto LABEL_75;
    }
  }
  else
  {
    self->_didSetTimeToStartStyleEngineBypass = 0;
  }
  v20 = (void *)[(CMISmartStyle *)self->_currentStyle castType];
  v21 = &OBJC_IVAR___FigCaptureSessionParsedConfiguration__parsedDepthDataSinkConfigurations;
  if ([v20 isEqual:FigSmartStyleCastTypeStandard]
    && ([(CMISmartStyle *)self->_currentStyle toneBias], v22 == 0.0)
    && ([(CMISmartStyle *)self->_currentStyle colorBias], v23 == 0.0)
    || !objc_msgSend((id)CMGetAttachment(a3, @"SmartStyleApplyWithIdentityCoefficients", 0), "BOOLValue"))
  {
    CMSampleBufferRef AttachedMedia = (CMSampleBufferRef)BWSampleBufferGetAttachedMedia(a3, 0x1EFA74840);
    CFDictionaryRef v18 = 0;
    goto LABEL_30;
  }
  memset(&time, 0, sizeof(time));
  OSStatus SampleTimingInfoArray = CMSampleBufferGetSampleTimingInfoArray(a3, 1, &time, 0);
  if (SampleTimingInfoArray)
  {
    int v19 = SampleTimingInfoArray;
    fig_log_get_emitter();
    FigDebugAssert3();
    CFDictionaryRef v18 = 0;
LABEL_107:
    id v17 = 0;
    ImageBuffer = 0;
    goto LABEL_75;
  }
  p_identityCoefficientsPixelBuffer = &self->_identityCoefficientsPixelBuffer;
  identityCoefficientsPixelBuffer = self->_identityCoefficientsPixelBuffer;
  if (identityCoefficientsPixelBuffer)
  {
    CFDictionaryRef v18 = 0;
    goto LABEL_28;
  }
  CMTimeEpoch v71 = epoch;
  v28 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a3, 0x1EFA74840);
  v29 = CMSampleBufferGetImageBuffer(v28);
  if (!v29)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    CFDictionaryRef v18 = 0;
    int v19 = -12780;
LABEL_106:
    CMTimeEpoch epoch = v71;
    goto LABEL_107;
  }
  v30 = v29;
  CFDictionaryRef v18 = CVPixelBufferCopyCreationAttributes(v29);
  CFAllocatorRef v31 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  size_t Width = CVPixelBufferGetWidth(v30);
  size_t Height = CVPixelBufferGetHeight(v30);
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(v30);
  CVReturn v35 = CVPixelBufferCreate(v31, Width, Height, PixelFormatType, v18, &self->_identityCoefficientsPixelBuffer);
  if (v35)
  {
    int v19 = v35;
    id v5 = (_DWORD *)MEMORY[0x1E4F1EBA8];
    goto LABEL_106;
  }
  v21 = &OBJC_IVAR___FigCaptureSessionParsedConfiguration__parsedDepthDataSinkConfigurations;
  int v19 = objc_msgSend((id)-[CMISmartStyleProcessor utilities](self->_smartStyleProcessor, "utilities"), "createIdentityTransformCoefficients:", *p_identityCoefficientsPixelBuffer);
  identityCoefficientsPixelBuffer = *p_identityCoefficientsPixelBuffer;
  id v5 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (!*p_identityCoefficientsPixelBuffer)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_106;
  }
  CMTimeEpoch epoch = v71;
LABEL_28:
  CMSampleTimingInfo sampleTiming = time;
  int v36 = BWSampleBufferCreateFromPixelBufferWithTimingInfo(identityCoefficientsPixelBuffer, &sampleTiming, &v87, &v88);
  if (v36)
  {
    int v19 = v36;
    goto LABEL_107;
  }
  CMSampleBufferRef AttachedMedia = v88;
LABEL_30:
  uint64_t v37 = *MEMORY[0x1E4F54148];
  int v38 = objc_msgSend((id)objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E4F54148]), "intValue");
  if (!AttachedMedia)
  {
    mostRecentCoefficients = self->_mostRecentCoefficients;
    if (!mostRecentCoefficients)
    {
      id v17 = 0;
      ImageBuffer = 0;
      int v19 = -12783;
LABEL_39:
      id v5 = (_DWORD *)MEMORY[0x1E4F1EBA8];
      goto LABEL_75;
    }
LABEL_41:
    self->_applyGlobalMostRecentCoefficients = 1;
    self->_currentGlobalLocalMixFactor = 1.0;
    CMSampleBufferRef AttachedMedia = mostRecentCoefficients;
    goto LABEL_42;
  }
  int v39 = v38;
  mostRecentCoefficients = self->_mostRecentCoefficients;
  if (v39 != self->_mostRecentQuadraBinningFactor)
  {
    if (!mostRecentCoefficients) {
      goto LABEL_42;
    }
    goto LABEL_41;
  }
  if (mostRecentCoefficients)
  {
    CFRelease(mostRecentCoefficients);
    self->_mostRecentCoefficients = 0;
  }
  self->_mostRecentCoefficients = (opaqueCMSampleBuffer *)CFRetain(AttachedMedia);
  self->_applyGlobalMostRecentCoefficients = 0;
  float v41 = self->_currentGlobalLocalMixFactor - self->_globalLocalSystemMixFactorDecayRate;
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)((char *)&self->super.super.isa + v21[414]), "configuration"), "styleEngineConfiguration"), "globalLinearSystemMixFactor");
  if (v41 >= v42) {
    float v42 = v41;
  }
  self->_currentGlobalLocalMixFactor = v42;
LABEL_42:
  self->_mostRecentQuadraBinningFactor = objc_msgSend((id)objc_msgSend(v16, "objectForKeyedSubscript:", v37), "intValue");
  CVImageBufferRef v43 = CMSampleBufferGetImageBuffer(AttachedMedia);
  if (!v43
    || (v44 = v43,
        (CFDictionaryRef v45 = (const __CFDictionary *)[v16 objectForKeyedSubscript:*MEMORY[0x1E4F534F8]]) != 0)
    && !CGRectMakeWithDictionaryRepresentation(v45, &rect)
    || (CFDictionaryRef v46 = (const __CFDictionary *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F530D0], 0)) != 0
    && !CGRectMakeWithDictionaryRepresentation(v46, &v85)
    || (CFDictionaryRef v47 = (const __CFDictionary *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53040], 0)) != 0
    && !CGRectMakeWithDictionaryRepresentation(v47, &v84)
    || (long long v78 = 0u,
        long long v79 = 0u,
        (CFDictionaryRef v48 = (const __CFDictionary *)CMGetAttachment(a3, @"OverCaptureStitchedValidBufferRect", 0)) != 0)
    && !CGRectMakeWithDictionaryRepresentation(v48, &v83))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    id v17 = 0;
    ImageBuffer = 0;
    int v19 = -12780;
    goto LABEL_39;
  }
  long long v76 = 0u;
  long long v77 = 0u;
  int v49 = -[BWOverCaptureSmartStyleApplyNode _calculateExtrapolationAndSpotlightZoom:inputCropRectWithinPrimaryCaptureRect:learningROIRect:adjustedPrimaryCaptureRect:adjustedSpotlightZoomRect:](self, "_calculateExtrapolationAndSpotlightZoom:inputCropRectWithinPrimaryCaptureRect:learningROIRect:adjustedPrimaryCaptureRect:adjustedSpotlightZoomRect:", &v78, &v76, v85.origin.x, v85.origin.y, v85.size.width, v85.size.height, v84.origin.x, v84.origin.y, v84.size.width, v84.size.height, *(void *)&rect.origin.x, *(void *)&rect.origin.y, *(void *)&rect.size.width, *(void *)&rect.size.height);
  if (v49)
  {
    int v19 = v49;
    fig_log_get_emitter();
    FigDebugAssert3();
    id v17 = 0;
LABEL_99:
    ImageBuffer = 0;
    goto LABEL_39;
  }
  id v17 = objc_alloc_init(self->_smartStyleProcessorInputOutputClass);
  if (!v17) {
    goto LABEL_100;
  }
  v50 = (void *)CMGetAttachment(a3, @"PreviewStitcherPrimaryCameraTransitionInProgress", 0);
  if (self->_useOptimizedThumbnailGeneration
    && ([v50 BOOLValue] & 1) == 0
    && !self->_applyGlobalMostRecentCoefficients)
  {
    v51 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a3, 0x1EFA748A0);
    if (v51)
    {
      v52 = CMSampleBufferGetImageBuffer(v51);
      if (v52)
      {
        v53 = v52;
        if (self->_previewThumbnailBuffer)
        {
LABEL_61:
          uint64_t v55 = [(MTLCommandQueue *)self->_metalCommandQueue commandBuffer];
          if (!v55)
          {
            fig_log_get_emitter();
            FigDebugAssert3();
            int v19 = FigSignalErrorAt();
            ImageBuffer = 0;
            id v5 = (_DWORD *)MEMORY[0x1E4F1EBA8];
            goto LABEL_75;
          }
          v56 = (void *)v55;
          if (!-[CMISmartStyleOvercaptureThumbnailGenerator generateOvercaptureIntegrationThumbnailFromPreviewThumbnailPixelBuffer:stitcherOutputPixelBuffer:outputOvercaptureIntegrationThumbnailPixelBuffer:primaryCaptureRect:inputCropRectWithinPrimaryCaptureRect:affineTransformForPreviewThumbnailPixelBuffer:optionalCommandBuffer:](self->_overcaptureThumbnailGenerator, "generateOvercaptureIntegrationThumbnailFromPreviewThumbnailPixelBuffer:stitcherOutputPixelBuffer:outputOvercaptureIntegrationThumbnailPixelBuffer:primaryCaptureRect:inputCropRectWithinPrimaryCaptureRect:affineTransformForPreviewThumbnailPixelBuffer:optionalCommandBuffer:", v53, ImageBuffer, self->_previewThumbnailBuffer, v55, v85.origin.x, v85.origin.y, v85.size.width, v85.size.height, v84.origin.x, v84.origin.y, v84.size.width, v84.size.height, v74, v73, v72)) {
            [v17 setInputUnstyledThumbnailPixelBuffer:self->_previewThumbnailBuffer];
          }
          objc_msgSend(v56, "commit", v69, v70);
          goto LABEL_65;
        }
        CVPixelBufferGetPixelFormatType(v52);
        PixelBuffer = (__CVBuffer *)CreatePixelBuffer();
        self->_previewThumbnailBuffer = PixelBuffer;
        if (PixelBuffer)
        {
          CVBufferPropagateAttachments(ImageBuffer, PixelBuffer);
          goto LABEL_61;
        }
      }
    }
    fig_log_get_emitter();
    LODWORD(v68) = 0;
    FigDebugAssert3();
    objc_msgSend(0, "commit", v68, v3);
  }
LABEL_65:
  [v17 setInputUnstyledPixelBuffer:ImageBuffer];
  [v17 setInputMetadataDict:v16];
  [v17 setOutputStyledPixelBuffer:ImageBuffer];
  objc_msgSend(v17, "setPrimaryCaptureRect:", v78, v79);
  objc_msgSend(v17, "setInputCropRectWithinPrimaryCaptureRect:", v76, v77);
  objc_msgSend(v17, "setSpotlightAffineTransform:", *(double *)&v74, *(double *)&v73, *(double *)&v72);
  objc_msgSend(v17, "setOutputRenderRect:", v83.origin.x, v83.origin.y, v83.size.width, v83.size.height);
  [v17 setApplyDither:self->_applyDither];
  if (!self->_filterType)
  {
    ImageBuffer = 0;
    goto LABEL_70;
  }
  uint64_t v57 = v21[414];
  v58 = (void *)[*(id *)((char *)&self->super.super.isa + v57) utilities];
  time.duration.CMTimeValue value = value;
  time.duration.CMTimeScale timescale = timescale;
  time.duration.CMTimeFlags flags = v75;
  time.duration.CMTimeEpoch epoch = epoch;
  int v59 = [v58 enqueueCoefficientsForFiltering:v44 withMetadata:v16 pts:&time];
  if (v59)
  {
    int v19 = v59;
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_99;
  }
  v60 = [(BWPixelBufferPool *)self->_filteredCoefficientsPixelBufferPool newPixelBuffer];
  if (!v60)
  {
LABEL_100:
    fig_log_get_emitter();
    FigDebugAssert3();
    ImageBuffer = 0;
    int v19 = -12786;
    goto LABEL_39;
  }
  v44 = v60;
  v61 = (void *)[*(id *)((char *)&self->super.super.isa + v57) utilities];
  unint64_t filterType = self->_filterType;
  time.duration.CMTimeValue value = value;
  time.duration.CMTimeScale timescale = timescale;
  time.duration.CMTimeFlags flags = v75;
  time.duration.CMTimeEpoch epoch = epoch;
  [v61 filterCoefficientsForFrameWithMetadata:v16 pts:&time filterType:filterType toPixelBuffer:v44 toGlobalRemixFactor:&v82];
  ImageBuffer = v44;
LABEL_70:
  [v17 setInputStyleCoefficientsPixelBuffer:v44];
  *(float *)&double v63 = self->_currentGlobalLocalMixFactor;
  float v64 = *(float *)&v63 + (float)(v82 * (float)(1.0 - *(float *)&v63));
  if (v64 > *(float *)&v63)
  {
    self->_currentGlobalLocalMixFactor = v64;
    *(float *)&double v63 = v64;
  }
  [v17 setGlobalLinearSystemMixFactor:v63];
  uint64_t v65 = v21[414];
  [*(id *)((char *)&self->super.super.isa + v65) setInputOutput:v17];
  int v66 = [*(id *)((char *)&self->super.super.isa + v65) process];
  id v5 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (v66)
  {
    int v19 = v66;
    fig_log_get_emitter();
  }
  else
  {
    int v19 = [*(id *)((char *)&self->super.super.isa + v65) finishProcessing];
    if (!v19)
    {
      [v16 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F534C0]];
      goto LABEL_75;
    }
    fig_log_get_emitter();
  }
  FigDebugAssert3();
LABEL_75:
  if (*v5 == 1)
  {
    time.duration.CMTimeValue value = value;
    time.duration.CMTimeScale timescale = timescale;
    time.duration.CMTimeFlags flags = v75;
    time.duration.CMTimeEpoch epoch = epoch;
    CMTimeGetSeconds(&time.duration);
    kdebug_trace();
  }

  if (v18) {
    CFRelease(v18);
  }
  if (v88) {
    CFRelease(v88);
  }
  if (v87) {
    CFRelease(v87);
  }
  if (ImageBuffer) {
    CFRelease(ImageBuffer);
  }
  return v19;
}

- (int)_applySmartStyleProxyRenderingWithMethod:(int)a3 onSampleBuffer:(opaqueCMSampleBuffer *)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  CMTimeValue value = *MEMORY[0x1E4F1FA48];
  CMTimeFlags flags = *(_DWORD *)(MEMORY[0x1E4F1FA48] + 12);
  CMTimeScale timescale = *(_DWORD *)(MEMORY[0x1E4F1FA48] + 8);
  CMTimeEpoch epoch = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  int v8 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (a3 == 2)
  {
    uint64_t v9 = 1;
  }
  else
  {
    if (a3 != 3)
    {
LABEL_16:
      fig_log_get_emitter();
LABEL_17:
      FigDebugAssert3();
      goto LABEL_19;
    }
    uint64_t v9 = 2;
  }
  if (!a4) {
    goto LABEL_16;
  }
  if (!self)
  {
    CMTimeFlags flags = 0;
    CMTimeEpoch epoch = 0;
    CMTimeScale timescale = 0;
    CMTimeValue value = 0;
    goto LABEL_19;
  }
  [(BWOverCaptureSmartStyleApplyNode *)self _getSampleBufferPresentationTimeStamp:a4];
  CMTimeEpoch epoch = time.epoch;
  CMTimeValue value = time.value;
  CMTimeFlags flags = time.flags;
  CMTimeScale timescale = time.timescale;
  if ((time.flags & 1) == 0)
  {
LABEL_19:
    int v16 = -12780;
    goto LABEL_20;
  }
  if (*v8 == 1)
  {
    time.CMTimeValue value = value;
    time.CMTimeScale timescale = timescale;
    CMTimeGetSeconds(&time);
    kdebug_trace();
  }
  CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(a4);
  if (!ImageBuffer || (v11 = ImageBuffer, (CFTypeRef v12 = CMGetAttachment(a4, (CFStringRef)*MEMORY[0x1E4F53070], 0)) == 0))
  {
    fig_log_get_emitter();
    goto LABEL_17;
  }
  long long v13 = (void *)v12;
  if (BWSmartStyleRenderingShouldBeBypassed(a4))
  {
    int v16 = 0;
  }
  else
  {
    uint64_t v14 = [v13 objectForKeyedSubscript:*MEMORY[0x1E4F534D8]];
    currentStyle = self->_currentStyle;
    -[CMISmartStyleProxyRenderer setInputStyles:](self->_smartStyleProxyRenderer, "setInputStyles:", [MEMORY[0x1E4F1C978] arrayWithObjects:&currentStyle count:1]);
    [(CMISmartStyleProxyRenderer *)self->_smartStyleProxyRenderer setInputPixelBuffer:v11];
    [(CMISmartStyleProxyRenderer *)self->_smartStyleProxyRenderer setInputImageStatistics:v14];
    int v15 = [(CMISmartStyleProxyRenderer *)self->_smartStyleProxyRenderer prepareToProcess:v9];
    if (v15)
    {
      int v16 = v15;
      fig_log_get_emitter();
    }
    else
    {
      int v16 = [(CMISmartStyleProxyRenderer *)self->_smartStyleProxyRenderer process];
      if (!v16) {
        goto LABEL_20;
      }
      fig_log_get_emitter();
    }
    FigDebugAssert3();
  }
LABEL_20:
  if (*v8 == 1)
  {
    time.CMTimeValue value = value;
    time.CMTimeScale timescale = timescale;
    time.CMTimeFlags flags = flags;
    time.CMTimeEpoch epoch = epoch;
    CMTimeGetSeconds(&time);
    kdebug_trace();
  }
  return v16;
}

- (int)_loadAndConfigureSmartStyleBundle
{
  uint64_t v3 = BWLoadProcessorBundle(@"SmartStyle", 1);
  if (!v3) {
    goto LABEL_6;
  }
  CGSize v4 = (objc_class *)[v3 classNamed:objc_msgSend(NSString, "stringWithFormat:", @"CMISmartStyleProcessorV%d", 1)];
  id v5 = (CMISmartStyleProcessor *)[[v4 alloc] initWithOptionalMetalCommandQueue:self->_metalCommandQueue];
  self->_smartStyleProcessor = v5;
  if (!v5) {
    goto LABEL_6;
  }
  [(CMISmartStyleProcessor *)v5 setInstanceLabel:@"OverCaptureApplyNode"];
  [(CMISmartStyleProcessor *)self->_smartStyleProcessor setUseLiveMetalAllocations:1];
  unint64_t v6 = [(objc_class *)v4 getSmartStyleCoefficientsFilterType:@"iir"];
  self->_unint64_t filterType = v6;
  id v7 = (void *)[(objc_class *)v4 getDefaultProcessorConfigurationForStreamingWithFilterType:v6];
  [v7 setTemporalFilterInputBufferSize:5];
  [(CMISmartStyleProcessor *)self->_smartStyleProcessor setConfiguration:v7];
  if (![(CMISmartStyleProcessor *)self->_smartStyleProcessor configuration]) {
    goto LABEL_6;
  }
  objc_msgSend((id)objc_msgSend((id)-[CMISmartStyleProcessor configuration](self->_smartStyleProcessor, "configuration"), "styleEngineConfiguration"), "setThumbnailSize:", 128.0, 282.0);
  objc_msgSend((id)objc_msgSend((id)-[CMISmartStyleProcessor configuration](self->_smartStyleProcessor, "configuration"), "styleEngineConfiguration"), "globalLinearSystemMixFactor");
  self->_globalLocalSystemMixFactorDecayRate = (float)(1.0 - v8) / 10.0;
  self->_filteredCoefficientsPixelBufferPoolSize = 6;
  uint64_t v9 = (objc_class *)[v3 classNamed:objc_msgSend(NSString, "stringWithFormat:", @"CMISmartStyleProcessorInputOutputV%d", 1)];
  self->_smartStyleProcessorInputOutputClass = v9;
  if (v9)
  {
    int result = 0;
    self->_useOptimizedThumbnailGeneration = 0;
  }
  else
  {
LABEL_6:

    self->_smartStyleProcessor = 0;
    return -12786;
  }
  return result;
}

- (int)_loadAndConfigureSmartStyleProxyRenderer
{
  uint64_t v3 = NSClassFromString((NSString *)objc_msgSend(NSString, "stringWithFormat:", @"CMISmartStyleV%d", 1));
  self->_smartStyleClass = v3;
  if (!v3
    || (CGSize v4 = NSClassFromString((NSString *)objc_msgSend(NSString, "stringWithFormat:", @"CMISmartStyleProxyRendererV%d", 1))) == 0|| (v5 = (CMISmartStyleProxyRenderer *)objc_msgSend([v4 alloc], "initWithOptionalMetalCommandQueue:", self->_metalCommandQueue), (self->_smartStyleProxyRenderer = v5) == 0))
  {
    int v13 = -12786;
LABEL_24:

    self->_smartStyleProxyRenderer = 0;
    return v13;
  }
  [(CMISmartStyleProxyRenderer *)v5 setMaxInputStylesCount:1];
  [(CMISmartStyleProxyRenderer *)self->_smartStyleProxyRenderer setForegroundRatio:0.0];
  smartStyleProxyRenderer = self->_smartStyleProxyRenderer;
  id v7 = (id)[(CMISmartStyleProxyRenderer *)smartStyleProxyRenderer externalMemoryDescriptorForConfiguration:0];
  if (!v7)
  {
    float v8 = 0;
    goto LABEL_16;
  }
  float v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F55F48]), "initWithDevice:allocatorType:", objc_msgSend((id)-[CMISmartStyleProxyRenderer metalCommandQueue](smartStyleProxyRenderer, "metalCommandQueue"), "device"), objc_msgSend(v7, "allocatorType"));
  if (!v8)
  {
LABEL_16:
    uint64_t v9 = 0;
    goto LABEL_17;
  }
  uint64_t v9 = objc_opt_new();
  if (!v9)
  {
LABEL_17:
    CFTypeRef v12 = 0;
LABEL_18:
    int v13 = -12786;
    goto LABEL_10;
  }
  objc_msgSend(v9, "setMemSize:", objc_msgSend(v7, "memSize"));
  [v9 setWireMemory:1];
  [v9 setLabel:@"BWOverCaptureSmartStyleApplyNode-SmartStyleProxyRenderer-FigMetalAllocatorBackend"];
  objc_msgSend(v9, "setMemoryPoolId:", -[BWMemoryPool poolIdentifier](+[BWMemoryPool sharedMemoryPool](BWMemoryPool, "sharedMemoryPool"), "poolIdentifier"));
  int v10 = [v8 setupWithDescriptor:v9];
  if (v10)
  {
    int v13 = v10;
    CFTypeRef v12 = 0;
    goto LABEL_10;
  }
  CVImageBufferRef v11 = objc_opt_new();
  CFTypeRef v12 = v11;
  if (!v11) {
    goto LABEL_18;
  }
  [v11 setAllocatorBackend:v8];
  [(CMISmartStyleProxyRenderer *)smartStyleProxyRenderer setExternalMemoryResource:v12];
  int v13 = 0;
LABEL_10:

  if (v13) {
    goto LABEL_22;
  }
  int v14 = [(CMISmartStyleProxyRenderer *)self->_smartStyleProxyRenderer setup];
  if (v14)
  {
    int v13 = v14;
    fig_log_get_emitter();
LABEL_23:
    FigDebugAssert3();
    goto LABEL_24;
  }
  int v13 = [(CMISmartStyleProxyRenderer *)self->_smartStyleProxyRenderer prewarm];
  if (v13)
  {
LABEL_22:
    fig_log_get_emitter();
    goto LABEL_23;
  }
  return v13;
}

- (id)_updateSupportedPixelFormats
{
  uint64_t v3 = (void *)[MEMORY[0x1E4F1CA48] arrayWithArray:&unk_1EFB03158];
  objc_msgSend(v3, "addObjectsFromArray:", FigCaptureSupportedPixelFormatsForCompressionType(4, 1, 0, 0));
  int maxLossyCompressionLevel = self->_maxLossyCompressionLevel;
  if (maxLossyCompressionLevel) {
    objc_msgSend(v3, "addObjectsFromArray:", FigCaptureSupportedPixelFormatsForCompressionType(4, 1, 0, maxLossyCompressionLevel));
  }
  return v3;
}

- (void)_consumeSampleBufferAttachments:(opaqueCMSampleBuffer *)a3
{
  BWSampleBufferRemoveAttachedMedia(a3, 0x1EFA748A0);
  BWSampleBufferRemoveAttachedMedia(a3, 0x1EFA748E0);
  BWSampleBufferRemoveAttachedMedia(a3, 0x1EFA74840);
  BWSampleBufferRemoveAttachedMedia(a3, @"HumanFullBodiesMask");
  BWSampleBufferRemoveAttachedMedia(a3, @"HumanSkinsMask");
  BWSampleBufferRemoveAttachedMedia(a3, 0x1EFA74700);
  BWSampleBufferRemoveAttachedMedia(a3, 0x1EFA68BE0);
  CMRemoveAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53158]);
  CGSize v4 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  [v4 setObject:0 forKeyedSubscript:*MEMORY[0x1E4F53500]];
  [v4 setObject:0 forKeyedSubscript:*MEMORY[0x1E4F53518]];
  [v4 setObject:0 forKeyedSubscript:*MEMORY[0x1E4F53520]];
  uint64_t v5 = *MEMORY[0x1E4F534F0];
  [v4 setObject:0 forKeyedSubscript:v5];
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_getSampleBufferPresentationTimeStamp:(SEL)a3
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(void *)&MEMORY[0x1E4F1F9F8];
  if (a4)
  {
    unint64_t v6 = (void *)CMGetAttachment(a4, (CFStringRef)*MEMORY[0x1E4F53070], 0);
    if (v6 && (id v7 = v6, v8 = *MEMORY[0x1E4F530C0], [v6 objectForKeyedSubscript:*MEMORY[0x1E4F530C0]])) {
      int result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMakeFromDictionary(&v10, (CFDictionaryRef)[v7 objectForKeyedSubscript:v8]);
    }
    else {
      int result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMSampleBufferGetPresentationTimeStamp(&v10, a4);
    }
    *(CMTime *)retstr = v10;
  }
  else
  {
    fig_log_get_emitter();
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)FigDebugAssert3();
  }
  return result;
}

- (int)_getRotationConfigForPixelBuffer:(__CVBuffer *)a3
{
  uint64_t v3 = (void *)CMGetAttachment(a3, @"RotationDegrees", 0);
  if (v3)
  {
    LODWORD(v3) = [v3 intValue];
    if ((int)v3 > 179)
    {
      if (v3 == 180)
      {
        LODWORD(v3) = 2;
        return (int)v3;
      }
      if (v3 == 270)
      {
        LODWORD(v3) = 3;
        return (int)v3;
      }
      goto LABEL_9;
    }
    if (v3)
    {
      if (v3 == 90)
      {
        LODWORD(v3) = 1;
        return (int)v3;
      }
LABEL_9:
      LODWORD(v3) = -1;
    }
  }
  return (int)v3;
}

- (int)_getMirrorConfigForPixelBuffer:(__CVBuffer *)a3
{
  unint64_t v4 = (unint64_t)CMGetAttachment(a3, @"MirroredVertical", 0);
  unint64_t v5 = (unint64_t)CMGetAttachment(a3, @"MirroredHorizontal", 0);
  if (!(v4 | v5)) {
    return 0;
  }
  unint64_t v6 = (void *)v5;
  int v7 = [(id)v4 BOOLValue];
  int v8 = [v6 BOOLValue];
  char v9 = v8;
  int v10 = (v7 & v8) != 0 ? 3 : 2;
  int result = v7 ? v10 : 1;
  if ((v7 & 1) == 0 && (v9 & 1) == 0) {
    return 0;
  }
  return result;
}

- (double)_computeAffineTransform:(int)a3 mirror:(int)a4
{
  float32x4_t v4 = (float32x4_t)xmmword_1A5EFDE60;
  float32x4_t v5 = (float32x4_t)xmmword_1A5EFDE70;
  if (a3 == 3)
  {
    *(void *)&long long v6 = 1065353216;
    long long v8 = xmmword_1A5EFDE70;
    long long v7 = xmmword_1A5F0C010;
  }
  else if (a3 == 2)
  {
    *(void *)&long long v6 = 0x3F8000003F800000;
    long long v8 = xmmword_1A5F0C010;
    long long v7 = xmmword_1A5F0C020;
  }
  else
  {
    *(void *)&long long v6 = 0;
    long long v7 = xmmword_1A5EFDE70;
    long long v8 = xmmword_1A5EFDE60;
    if (a3 == 1)
    {
      *(void *)&long long v6 = 0x3F80000000000000;
      long long v8 = xmmword_1A5F0C020;
      long long v7 = xmmword_1A5EFDE60;
    }
  }
  HIDWORD(v8) = 0;
  HIDWORD(v7) = 0;
  *((void *)&v6 + 1) = COERCE_UNSIGNED_INT(1.0);
  if (a4 == 3)
  {
    uint64_t v9 = 0x3F8000003F800000;
    float32x4_t v4 = (float32x4_t)xmmword_1A5F0C020;
    float32x4_t v5 = (float32x4_t)xmmword_1A5F0C010;
  }
  else if (a4 == 2)
  {
    uint64_t v9 = 1065353216;
    float32x4_t v4 = (float32x4_t)xmmword_1A5F0C010;
  }
  else
  {
    uint64_t v9 = 0;
    if (a4 == 1)
    {
      uint64_t v9 = 0x3F80000000000000;
      float32x4_t v5 = (float32x4_t)xmmword_1A5F0C020;
    }
  }
  uint64_t v10 = 0;
  __asm { FMOV            V6.4S, #1.0 }
  _Q6.i64[0] = v9;
  v17[0] = v8;
  v17[1] = v7;
  v17[2] = v6;
  memset(v18, 0, sizeof(v18));
  do
  {
    v18[v10] = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v4, COERCE_FLOAT(v17[v10])), v5, *(float32x2_t *)&v17[v10], 1), _Q6, (float32x4_t)v17[v10], 2);
    ++v10;
  }
  while (v10 != 3);
  return *(double *)v18;
}

- (uint64_t)_calculateExtrapolationAndSpotlightZoom:(double)a3 inputCropRectWithinPrimaryCaptureRect:(double)a4 learningROIRect:(CGFloat)a5 adjustedPrimaryCaptureRect:(CGFloat)a6 adjustedSpotlightZoomRect:(CGFloat)a7
{
  *(double *)&v56[16] = a3;
  *(double *)&v56[24] = a4;
  *(double *)v56 = a1;
  *(double *)&v56[8] = a2;
  if (a11 && a12)
  {
    v57.origin.x = a13;
    v57.origin.y = a14;
    v57.size.width = a15;
    v57.size.height = a16;
    if (!CGRectIsEmpty(v57) && !CGRectIsEmpty(*(CGRect *)v56))
    {
      v58.origin.x = a5;
      v58.origin.y = a6;
      v58.size.width = a7;
      v58.size.height = a8;
      if (!CGRectIsEmpty(v58))
      {
        double v26 = FigCaptureMetadataUtilitiesRectNormalizedToRect(a13, a14, a15, a16, a5, a6, a7);
        double v30 = FigCaptureMetadataUtilitiesRectDenormalizedToRect(v26, v27, v28, v29, *(double *)v56, *(double *)&v56[8], *(double *)&v56[16]);
        float64_t v54 = v31;
        float64_t v55 = v30;
        double v52 = v33;
        double v53 = v32;
        double v34 = FigCaptureMetadataUtilitiesRectNormalizedToRect(a5, a6, a7, a8, a13, a14, a15);
        float64_t v36 = v35;
        double v38 = v37;
        double v40 = v39;
        v41.f64[0] = v55;
        v42.f64[0] = *(float64_t *)v56;
        *(void *)v56 = FigCaptureMetadataUtilitiesClampRectToBoundingRect(v41, v54, v53, v52, v42, *(float64_t *)&v56[8], *(double *)&v56[16], *(double *)&v56[24]);
        *(void *)&v56[8] = v43;
        *(void *)&v56[16] = v44;
        *(void *)&v56[24] = v45;
        v46.f64[0] = 0.0;
        v47.f64[0] = v34;
        a5 = FigCaptureMetadataUtilitiesClampRectToBoundingRect(v47, v36, v38, v40, v46, 0.0, 1.0, 1.0);
        a6 = v48;
        a7 = v49;
        a8 = v50;
      }
    }
    uint64_t result = 0;
    *a11 = *(void *)v56;
    a11[1] = *(void *)&v56[8];
    a11[2] = *(void *)&v56[16];
    a11[3] = *(void *)&v56[24];
    *a12 = a5;
    a12[1] = a6;
    a12[2] = a7;
    a12[3] = a8;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 4294954516;
  }
  return result;
}

- (int)maxLossyCompressionLevel
{
  return self->_maxLossyCompressionLevel;
}

@end