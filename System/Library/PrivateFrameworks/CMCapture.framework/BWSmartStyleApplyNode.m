@interface BWSmartStyleApplyNode
+ (void)initialize;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_getSampleBufferPresentationTimeStamp:(SEL)a3;
- (BOOL)_canRenderWithStyleEngineApplyForInput:(opaqueCMSampleBuffer *)a3;
- (BOOL)_updateCurrentStyle:(opaqueCMSampleBuffer *)a3;
- (BWSmartStyleApplyNode)initWithMetalCommandQueue:(id)a3 renderingMethod:(int)a4;
- (id)_updateSupportedPixelFormats;
- (id)nodeSubType;
- (id)nodeType;
- (int)_applySmartStyleFromSampleBuffer:(opaqueCMSampleBuffer *)a3 to:(opaqueCMSampleBuffer *)a4;
- (int)_applySmartStyleProxyRenderingWithMethod:(int)a3 fromSampleBuffer:(opaqueCMSampleBuffer *)a4 to:(opaqueCMSampleBuffer *)a5;
- (int)_loadAndConfigureSmartStyleBundle;
- (int)_loadAndConfigureSmartStyleProxyRenderer;
- (int)maxLossyCompressionLevel;
- (void)_consumeSampleBufferAttachments:(opaqueCMSampleBuffer *)a3;
- (void)dealloc;
- (void)didReachEndOfDataForInput:(id)a3;
- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5;
- (void)prepareForCurrentConfigurationToBecomeLive;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
- (void)setMaxLossyCompressionLevel:(int)a3;
@end

@implementation BWSmartStyleApplyNode

+ (void)initialize
{
}

- (BWSmartStyleApplyNode)initWithMetalCommandQueue:(id)a3 renderingMethod:(int)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v29.receiver = self;
  v29.super_class = (Class)BWSmartStyleApplyNode;
  v6 = [(BWNode *)&v29 init];
  v7 = v6;
  if (v6)
  {
    v6->_renderingMethod = a4;
    v6->_maxLossyCompressionLevel = 0;
    v6->_metalCommandQueue = (MTLCommandQueue *)a3;
    v7->_firstFrame = 1;
    uint64_t v8 = [(BWSmartStyleApplyNode *)v7 _updateSupportedPixelFormats];
    if (v8 && (uint64_t v9 = v8, (v10 = objc_alloc_init(BWVideoFormatRequirements)) != 0))
    {
      v11 = v10;
      [(BWVideoFormatRequirements *)v10 setSupportedPixelFormats:v9];
      v24 = v7;
      v12 = [[BWNodeInput alloc] initWithMediaType:1986618469 node:v7];
      [(BWNodeInput *)v12 setFormatRequirements:v11];
      [(BWNodeInput *)v12 setPassthroughMode:2];
      if (a4 == 1)
      {
        long long v27 = 0u;
        long long v28 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        v13 = BWAttachedMediaKeysRequiredBySmartStyleRenderingPipelines(1, 0);
        uint64_t v14 = [v13 countByEnumeratingWithState:&v25 objects:v30 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v26;
          do
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v26 != v16) {
                objc_enumerationMutation(v13);
              }
              v18 = *(void **)(*((void *)&v25 + 1) + 8 * i);
              v19 = objc_alloc_init(BWNodeInputMediaConfiguration);
              [(BWNodeInputMediaConfiguration *)v19 setFormatRequirements:objc_alloc_init(BWVideoFormatRequirements)];
              [(BWNodeInputMediaConfiguration *)v19 setPassthroughMode:0];
              if ([v18 isEqualToString:0x1EFA74840]) {
                [(BWNodeInputMediaConfiguration *)v19 setRetainedBufferCount:4];
              }
              [(BWNodeInput *)v12 setMediaConfiguration:v19 forAttachedMediaKey:v18];
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v25 objects:v30 count:16];
          }
          while (v15);
        }
      }
      v7 = v24;
      [(BWNode *)v24 addInput:v12];
      v20 = objc_alloc_init(BWVideoFormatRequirements);
      if (v20)
      {
        v21 = v20;
        [(BWVideoFormatRequirements *)v20 setSupportedPixelFormats:v9];
        v22 = [[BWNodeOutput alloc] initWithMediaType:1986618469 node:v24];
        [(BWNodeOutput *)v22 setFormatRequirements:v21];
        [(BWNodeOutput *)v22 setPassthroughMode:2];
        [(BWNodeOutput *)v22 setProvidesPixelBufferPool:1];
        [(BWNodeOutput *)v22 setOwningNodeRetainedBufferCount:1];
        [(BWNode *)v24 addOutput:v22];
        if (![(BWSmartStyleApplyNode *)v24 _loadAndConfigureSmartStyleBundle])
        {
          v24->_applyDither = 1;
          return v7;
        }
      }
      fig_log_get_emitter();
    }
    else
    {
      fig_log_get_emitter();
    }
    FigDebugAssert3();
    return 0;
  }
  return v7;
}

- (void)setMaxLossyCompressionLevel:(int)a3
{
  if (self->_maxLossyCompressionLevel != a3)
  {
    v4 = [(BWNodeInput *)self->super._input formatRequirements];
    v5 = [(BWNodeOutput *)self->super._output formatRequirements];
    id v6 = [(BWSmartStyleApplyNode *)self _updateSupportedPixelFormats];
    if (v6)
    {
      id v7 = v6;
      [(BWFormatRequirements *)v4 setSupportedPixelFormats:v6];
      [(BWFormatRequirements *)v5 setSupportedPixelFormats:v7];
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
  mostRecentCoefficients = self->_mostRecentCoefficients;
  if (mostRecentCoefficients) {
    CFRelease(mostRecentCoefficients);
  }
  v4.receiver = self;
  v4.super_class = (Class)BWSmartStyleApplyNode;
  [(BWNode *)&v4 dealloc];
}

- (id)nodeType
{
  return @"Effect";
}

- (id)nodeSubType
{
  return @"SmartStyleApply";
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5
{
  v14[1] = *MEMORY[0x1E4F143B8];
  if (!a3 || !a4) {
    goto LABEL_11;
  }
  if ([a5 isEqualToString:@"PrimaryFormat"])
  {
    uint64_t v9 = [(BWNodeOutput *)self->super._output formatRequirements];
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
    v11 = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:](v10, "initWithVideoFormat:capacity:name:memoryPool:", a3, self->_filteredCoefficientsPixelBufferPoolSize, [NSString stringWithFormat:@"ApplyNode filtered coefficients buffer pool"], -[BWNodeOutput memoryPool](self->super._output, "memoryPool"));
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
    v12.super_class = (Class)BWSmartStyleApplyNode;
    [(BWNode *)&v12 didSelectFormat:a3 forInput:a4 forAttachedMediaKey:a5];
  }
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  v3.receiver = self;
  v3.super_class = (Class)BWSmartStyleApplyNode;
  [(BWNode *)&v3 prepareForCurrentConfigurationToBecomeLive];
  if (-[BWSmartStyleApplyNode _loadAndConfigureSmartStyleProxyRenderer](self, "_loadAndConfigureSmartStyleProxyRenderer")|| -[CMISmartStyleProcessor setup](self->_smartStyleProcessor, "setup")|| -[CMISmartStyleProcessor prepareToProcess:](self->_smartStyleProcessor, "prepareToProcess:", 4)|| objc_msgSend((id)-[CMISmartStyleProcessor utilities](self->_smartStyleProcessor, "utilities"), "resetCoefficientsFilter"))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
}

- (void)didReachEndOfDataForInput:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)BWSmartStyleApplyNode;
  [(BWNode *)&v3 didReachEndOfDataForInput:a3];
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  CMAttachmentBearerRef target = 0;
  if (!a3)
  {
    fig_log_get_emitter();
    LODWORD(v22) = 0;
    FigDebugAssert3();
    -[BWSmartStyleApplyNode _consumeSampleBufferAttachments:](self, "_consumeSampleBufferAttachments:", 0, v22, v4);
    CMSampleBufferGetPresentationTimeStamp(&v24, 0);
    id v20 = +[BWDroppedSample newDroppedSampleWithReason:0x1EFA68140 pts:&v24];
    [(BWNodeOutput *)self->super._output emitDroppedSample:v20];

LABEL_32:
    self->_firstFrame = 0;
    return;
  }
  if (!a4) {
    goto LABEL_37;
  }
  if (!BWSampleBufferIsMarkerBuffer(a3))
  {
    if (![(BWSmartStyleApplyNode *)self _updateCurrentStyle:a3]) {
      goto LABEL_38;
    }
    uint64_t renderingMethod = self->_renderingMethod;
    if (!renderingMethod) {
      goto LABEL_38;
    }
    CFStringRef v9 = (const __CFString *)*MEMORY[0x1E4F53070];
    v10 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0);
    if (v10)
    {
      uint64_t v11 = *MEMORY[0x1E4F542E0];
      if ((objc_msgSend((id)objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E4F542E0]), "BOOLValue") & 1) != 0
        || (AttachedMedia = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a3, @"SynchronizedSlaveFrame")) == 0)
      {
        int v15 = 0;
        uint64_t v16 = a3;
        goto LABEL_17;
      }
      uint64_t v13 = AttachedMedia;
      uint64_t v14 = (void *)CMGetAttachment(AttachedMedia, v9, 0);
      if (v14)
      {
        int v15 = objc_msgSend((id)objc_msgSend(v14, "objectForKeyedSubscript:", v11), "BOOLValue");
        if (v15) {
          uint64_t v16 = v13;
        }
        else {
          uint64_t v16 = a3;
        }
LABEL_17:
        if (BWSmartStyleRenderingShouldBeBypassed(v16)) {
          goto LABEL_25;
        }
        if (renderingMethod == 1)
        {
          if ([(BWSmartStyleApplyNode *)self _canRenderWithStyleEngineApplyForInput:v16])
          {
            int v17 = [(BWSmartStyleApplyNode *)self _applySmartStyleFromSampleBuffer:v16 to:&target];
            if (v17) {
              goto LABEL_36;
            }
            goto LABEL_24;
          }
          uint64_t renderingMethod = 3;
        }
        int v17 = [(BWSmartStyleApplyNode *)self _applySmartStyleProxyRenderingWithMethod:renderingMethod fromSampleBuffer:v16 to:&target];
        if (v17)
        {
LABEL_36:
          int v21 = v17;
          fig_log_get_emitter();
          uint64_t v23 = v4;
          LODWORD(v22) = v21;
          FigDebugAssert3();
          goto LABEL_25;
        }
LABEL_24:
        CMSetAttachment(target, @"FiltersApplied", MEMORY[0x1E4F1CC38], 1u);
        goto LABEL_25;
      }
    }
LABEL_37:
    fig_log_get_emitter();
    uint64_t v23 = v4;
    LODWORD(v22) = 0;
    FigDebugAssert3();
LABEL_38:
    int v15 = 0;
LABEL_25:
    -[BWSmartStyleApplyNode _consumeSampleBufferAttachments:](self, "_consumeSampleBufferAttachments:", a3, v22, v23);
    if (target)
    {
      -[BWSmartStyleApplyNode _consumeSampleBufferAttachments:](self, "_consumeSampleBufferAttachments:");
      if (v15)
      {
        BWSampleBufferSetAttachedMedia(a3, @"SynchronizedSlaveFrame", (uint64_t)target);
        output = self->super._output;
        v19 = a3;
      }
      else
      {
        v19 = (void *)target;
        output = self->super._output;
      }
      [(BWNodeOutput *)output emitSampleBuffer:v19];
      if (target) {
        CFRelease(target);
      }
    }
    else
    {
      [(BWNodeOutput *)self->super._output emitSampleBuffer:a3];
    }
    goto LABEL_32;
  }
  id v7 = self->super._output;
  [(BWNodeOutput *)v7 emitSampleBuffer:a3];
}

- (BOOL)_updateCurrentStyle:(opaqueCMSampleBuffer *)a3
{
  if (!a3) {
    return 0;
  }
  uint64_t v4 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  if (!v4) {
    goto LABEL_10;
  }
  uint64_t v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F534C8]];
  if (!v5)
  {

    BOOL result = 0;
    self->_currentStyle = 0;
    return result;
  }
  id v6 = +[FigCaptureSmartStyle createFromDictionary:v5];
  if (v6)
  {
    id v7 = v6;
    currentStyle = self->_currentStyle;
    if (!currentStyle) {
      currentStyle = (CMISmartStyle *)objc_alloc_init(self->_smartStyleClass);
    }
    self->_currentStyle = currentStyle;
    -[CMISmartStyle setCastType:](self->_currentStyle, "setCastType:", [v7 cast]);
    [v7 intensity];
    -[CMISmartStyle setCastIntensity:](self->_currentStyle, "setCastIntensity:");
    [v7 toneBias];
    -[CMISmartStyle setToneBias:](self->_currentStyle, "setToneBias:");
    [v7 colorBias];
    -[CMISmartStyle setColorBias:](self->_currentStyle, "setColorBias:");
    return self->_currentStyle != 0;
  }
  else
  {
LABEL_10:
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
}

- (BOOL)_canRenderWithStyleEngineApplyForInput:(opaqueCMSampleBuffer *)a3
{
  uint64_t AttachedMedia = BWSampleBufferGetAttachedMedia(a3, 0x1EFA748A0);
  uint64_t v5 = BWSampleBufferGetAttachedMedia(a3, 0x1EFA74840);
  if (AttachedMedia) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  return !v6;
}

- (int)_applySmartStyleFromSampleBuffer:(opaqueCMSampleBuffer *)a3 to:(opaqueCMSampleBuffer *)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  CFTypeRef v43 = 0;
  CFTypeRef cf = 0;
  CMTimeValue value = *MEMORY[0x1E4F1FA48];
  CMTimeFlags flags = *(_DWORD *)(MEMORY[0x1E4F1FA48] + 12);
  CMTimeScale timescale = *(_DWORD *)(MEMORY[0x1E4F1FA48] + 8);
  CMTimeEpoch epoch = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  CGSize v6 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
  rect.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
  rect.size = v6;
  id v7 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (!a3 || !a4)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_51;
  }
  *a4 = 0;
  if (!self)
  {
    id v16 = 0;
    CMTimeEpoch epoch = 0;
    CMTimeFlags flags = 0;
    uint64_t AttachedMedia = 0;
    ImageBuffer = 0;
    CMTimeScale timescale = 0;
    CMTimeValue value = 0;
LABEL_18:
    int v22 = -12780;
    goto LABEL_39;
  }
  -[BWSmartStyleApplyNode _getSampleBufferPresentationTimeStamp:](self, "_getSampleBufferPresentationTimeStamp:");
  CMTimeEpoch epoch = time.epoch;
  CMTimeValue value = time.value;
  CMTimeFlags flags = time.flags;
  CMTimeScale timescale = time.timescale;
  if ((time.flags & 1) == 0)
  {
LABEL_51:
    id v16 = 0;
    uint64_t AttachedMedia = 0;
    ImageBuffer = 0;
    goto LABEL_18;
  }
  if (*v7 == 1)
  {
    time.CMTimeValue value = value;
    time.CMTimeScale timescale = timescale;
    CMTimeGetSeconds(&time);
    kdebug_trace();
  }
  ImageBuffer = CMSampleBufferGetImageBuffer(a3);
  if (!ImageBuffer)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    id v16 = 0;
    uint64_t AttachedMedia = 0;
    goto LABEL_18;
  }
  CMTimeFlags v40 = flags;
  CFStringRef v12 = (const __CFString *)*MEMORY[0x1E4F53070];
  CFTypeRef v13 = CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  if (!v13)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    id v16 = 0;
    uint64_t AttachedMedia = 0;
    ImageBuffer = 0;
    int v22 = -12780;
LABEL_70:
    id v7 = (_DWORD *)MEMORY[0x1E4F1EBA8];
    CMTimeFlags flags = v40;
    goto LABEL_39;
  }
  uint64_t v14 = (void *)v13;
  uint64_t AttachedMedia = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a3, 0x1EFA748A0);
  if (!AttachedMedia)
  {
    id v16 = 0;
LABEL_56:
    ImageBuffer = 0;
    int v22 = -12783;
    goto LABEL_70;
  }
  id v16 = (id)BWSampleBufferGetAttachedMedia(a3, 0x1EFA74840);
  if (!v16)
  {
    uint64_t AttachedMedia = 0;
    goto LABEL_56;
  }
  CFStringRef key = v12;
  CMTimeEpoch v39 = epoch;
  uint64_t v17 = *MEMORY[0x1E4F54148];
  int v18 = objc_msgSend((id)objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E4F54148]), "intValue");
  mostRecentCoefficients = self->_mostRecentCoefficients;
  if (v18 == self->_mostRecentQuadraBinningFactor)
  {
    if (mostRecentCoefficients)
    {
      CFRelease(mostRecentCoefficients);
      self->_mostRecentCoefficients = 0;
    }
    self->_mostRecentCoefficients = (opaqueCMSampleBuffer *)CFRetain(v16);
    self->_applyGlobalMostRecentCoefficients = 0;
    float v20 = self->_currentGlobalLocalMixFactor - self->_globalLocalSystemMixFactorDecayRate;
    objc_msgSend((id)objc_msgSend((id)-[CMISmartStyleProcessor configuration](self->_smartStyleProcessor, "configuration"), "styleEngineConfiguration"), "globalLinearSystemMixFactor");
    if (v20 >= v21) {
      float v21 = v20;
    }
    self->_currentGlobalLocalMixFactor = v21;
  }
  else if (mostRecentCoefficients)
  {
    self->_applyGlobalMostRecentCoefficients = 1;
    self->_currentGlobalLocalMixFactor = 1.0;
    id v16 = mostRecentCoefficients;
  }
  self->_mostRecentQuadraBinningFactor = objc_msgSend((id)objc_msgSend(v14, "objectForKeyedSubscript:", v17), "intValue");
  CFDictionaryRef v23 = (const __CFDictionary *)[v14 objectForKeyedSubscript:*MEMORY[0x1E4F534F8]];
  if (v23 && !CGRectMakeWithDictionaryRepresentation(v23, &rect)
    || (CVImageBufferRef v24 = CMSampleBufferGetImageBuffer(AttachedMedia)) == 0
    || (CVImageBufferRef v25 = v24, (v26 = CMSampleBufferGetImageBuffer((CMSampleBufferRef)v16)) == 0))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    id v16 = 0;
    uint64_t AttachedMedia = 0;
    ImageBuffer = 0;
    int v22 = -12780;
LABEL_69:
    CMTimeEpoch epoch = v39;
    goto LABEL_70;
  }
  CVImageBufferRef v27 = v26;
  uint64_t AttachedMedia = [(BWPixelBufferPool *)[(BWNodeOutput *)self->super._output livePixelBufferPool] newPixelBuffer];
  if (!AttachedMedia)
  {
    id v16 = 0;
LABEL_61:
    ImageBuffer = 0;
LABEL_68:
    int v22 = -12786;
    goto LABEL_69;
  }
  CVBufferPropagateAttachments(ImageBuffer, AttachedMedia);
  id v16 = objc_alloc_init(self->_smartStyleProcessorInputOutputClass);
  if (!v16)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_61;
  }
  objc_msgSend(v16, "setMetalSharedEvent:", CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53158], 0));
  [v16 setInputUnstyledPixelBuffer:ImageBuffer];
  [v16 setInputMetadataDict:v14];
  [v16 setInputUnstyledThumbnailPixelBuffer:v25];
  [v16 setOutputStyledPixelBuffer:AttachedMedia];
  objc_msgSend(v16, "setPrimaryCaptureRect:", rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
  *(float *)&double v28 = self->_currentGlobalLocalMixFactor;
  [v16 setGlobalLinearSystemMixFactor:v28];
  [v16 setApplyDither:self->_applyDither];
  if (!self->_filterType)
  {
    [v16 setInputStyleCoefficientsPixelBuffer:v27];
    ImageBuffer = 0;
    goto LABEL_32;
  }
  objc_super v29 = (void *)[(CMISmartStyleProcessor *)self->_smartStyleProcessor utilities];
  time.CMTimeValue value = value;
  time.CMTimeScale timescale = timescale;
  time.CMTimeFlags flags = v40;
  time.CMTimeEpoch epoch = v39;
  int v30 = [v29 enqueueCoefficientsForFiltering:v27 withMetadata:v14 pts:&time];
  if (v30)
  {
    int v22 = v30;
    fig_log_get_emitter();
    FigDebugAssert3();
    ImageBuffer = 0;
    goto LABEL_69;
  }
  ImageBuffer = [(BWPixelBufferPool *)self->_filteredCoefficientsPixelBufferPool newPixelBuffer];
  if (!ImageBuffer)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_68;
  }
  uint64_t v31 = (void *)[(CMISmartStyleProcessor *)self->_smartStyleProcessor utilities];
  unint64_t filterType = self->_filterType;
  time.CMTimeValue value = value;
  time.CMTimeScale timescale = timescale;
  time.CMTimeFlags flags = v40;
  time.CMTimeEpoch epoch = v39;
  [v31 filterCoefficientsForFrameWithMetadata:v14 pts:&time filterType:filterType toPixelBuffer:ImageBuffer];
  [v16 setInputStyleCoefficientsPixelBuffer:ImageBuffer];
LABEL_32:
  [(CMISmartStyleProcessor *)self->_smartStyleProcessor setInputOutput:v16];
  int v33 = [(CMISmartStyleProcessor *)self->_smartStyleProcessor process];
  id v7 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  CMTimeFlags flags = v40;
  if (v33 || (int v33 = [(CMISmartStyleProcessor *)self->_smartStyleProcessor finishProcessing]) != 0)
  {
    int v22 = v33;
    fig_log_get_emitter();
    FigDebugAssert3();
    CMTimeEpoch epoch = v39;
    goto LABEL_39;
  }
  int v34 = BWCMSampleBufferCreateCopyWithNewPixelBuffer(a3, AttachedMedia, &v43, (CMSampleBufferRef *)&cf);
  CMTimeEpoch epoch = v39;
  if (v34)
  {
    int v22 = v34;
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_39;
  }
  v35 = (void *)CMGetAttachment(a3, key, 0);
  if (!v35)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_18;
  }
  [v35 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F534C0]];
  v36 = (opaqueCMSampleBuffer *)cf;
  if (cf) {
    v36 = (opaqueCMSampleBuffer *)CFRetain(cf);
  }
  int v22 = 0;
  *a4 = v36;
LABEL_39:
  if (*v7 == 1)
  {
    time.CMTimeValue value = value;
    time.CMTimeScale timescale = timescale;
    time.CMTimeFlags flags = flags;
    time.CMTimeEpoch epoch = epoch;
    CMTimeGetSeconds(&time);
    kdebug_trace();
  }

  if (cf) {
    CFRelease(cf);
  }
  if (AttachedMedia) {
    CFRelease(AttachedMedia);
  }
  if (v43) {
    CFRelease(v43);
  }
  if (ImageBuffer) {
    CFRelease(ImageBuffer);
  }
  return v22;
}

- (int)_applySmartStyleProxyRenderingWithMethod:(int)a3 fromSampleBuffer:(opaqueCMSampleBuffer *)a4 to:(opaqueCMSampleBuffer *)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  CFTypeRef v26 = 0;
  CFTypeRef cf = 0;
  CMTimeValue value = *MEMORY[0x1E4F1FA48];
  CMTimeFlags flags = *(_DWORD *)(MEMORY[0x1E4F1FA48] + 12);
  CMTimeScale timescale = *(_DWORD *)(MEMORY[0x1E4F1FA48] + 8);
  CMTimeEpoch epoch = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  v10 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (a3 == 2)
  {
    uint64_t v11 = 1;
  }
  else
  {
    if (a3 != 3)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      int v20 = 0;
      id v16 = 0;
      goto LABEL_26;
    }
    uint64_t v11 = 2;
  }
  if (!a4 || !a5)
  {
    fig_log_get_emitter();
LABEL_38:
    FigDebugAssert3();
    goto LABEL_39;
  }
  *a5 = 0;
  if (!self)
  {
    id v16 = 0;
    CMTimeFlags flags = 0;
    CMTimeEpoch epoch = 0;
    CMTimeScale timescale = 0;
    CMTimeValue value = 0;
LABEL_18:
    int v20 = -12780;
    goto LABEL_26;
  }
  [(BWSmartStyleApplyNode *)self _getSampleBufferPresentationTimeStamp:a4];
  CMTimeEpoch epoch = time.epoch;
  CMTimeValue value = time.value;
  CMTimeFlags flags = time.flags;
  CMTimeScale timescale = time.timescale;
  if ((time.flags & 1) == 0)
  {
LABEL_39:
    id v16 = 0;
    goto LABEL_18;
  }
  if (*v10 == 1)
  {
    time.CMTimeValue value = value;
    time.CMTimeScale timescale = timescale;
    CMTimeGetSeconds(&time);
    kdebug_trace();
  }
  CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(a4);
  if (!ImageBuffer || (v13 = ImageBuffer, (CFTypeRef v14 = CMGetAttachment(a4, (CFStringRef)*MEMORY[0x1E4F53070], 0)) == 0))
  {
    fig_log_get_emitter();
    goto LABEL_38;
  }
  int v15 = (void *)v14;
  id v16 = [(BWPixelBufferPool *)[(BWNodeOutput *)self->super._output livePixelBufferPool] newPixelBuffer];
  if (v16)
  {
    CMTimeEpoch v24 = epoch;
    CVBufferPropagateAttachments(v13, v16);
    uint64_t v17 = [v15 objectForKeyedSubscript:*MEMORY[0x1E4F534D8]];
    uint64_t AttachedMedia = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a4, @"HumanFullBodiesMask");
    if (AttachedMedia) {
      CVImageBufferRef v19 = CMSampleBufferGetImageBuffer(AttachedMedia);
    }
    else {
      CVImageBufferRef v19 = 0;
    }
    currentStyle = self->_currentStyle;
    -[CMISmartStyleProxyRenderer setInputStyles:](self->_smartStyleProxyRenderer, "setInputStyles:", [MEMORY[0x1E4F1C978] arrayWithObjects:&currentStyle count:1]);
    [(CMISmartStyleProxyRenderer *)self->_smartStyleProxyRenderer setInputPixelBuffer:v13];
    [(CMISmartStyleProxyRenderer *)self->_smartStyleProxyRenderer setInputMaskPixelBuffer:v19];
    [(CMISmartStyleProxyRenderer *)self->_smartStyleProxyRenderer setInputImageStatistics:v17];
    [(CMISmartStyleProxyRenderer *)self->_smartStyleProxyRenderer setOutputPixelBuffer:v16];
    int v21 = [(CMISmartStyleProxyRenderer *)self->_smartStyleProxyRenderer prepareToProcess:v11];
    if (v21
      || (int v21 = [(CMISmartStyleProxyRenderer *)self->_smartStyleProxyRenderer process]) != 0
      || (int v21 = BWCMSampleBufferCreateCopyWithNewPixelBuffer(a4, v16, &v26, (CMSampleBufferRef *)&cf)) != 0)
    {
      int v20 = v21;
      fig_log_get_emitter();
      FigDebugAssert3();
      CMTimeEpoch epoch = v24;
    }
    else
    {
      int v22 = (opaqueCMSampleBuffer *)cf;
      if (cf) {
        int v22 = (opaqueCMSampleBuffer *)CFRetain(cf);
      }
      CMTimeEpoch epoch = v24;
      int v20 = 0;
      *a5 = v22;
    }
  }
  else
  {
    int v20 = -12786;
  }
LABEL_26:
  if (*v10 == 1)
  {
    time.CMTimeValue value = value;
    time.CMTimeScale timescale = timescale;
    time.CMTimeFlags flags = flags;
    time.CMTimeEpoch epoch = epoch;
    CMTimeGetSeconds(&time);
    kdebug_trace();
  }
  if (cf) {
    CFRelease(cf);
  }
  if (v16) {
    CFRelease(v16);
  }
  if (v26) {
    CFRelease(v26);
  }
  return v20;
}

- (int)_loadAndConfigureSmartStyleBundle
{
  objc_super v3 = BWLoadProcessorBundle(@"SmartStyle", 1);
  if (v3)
  {
    uint64_t v4 = (objc_class *)[v3 classNamed:objc_msgSend(NSString, "stringWithFormat:", @"CMISmartStyleProcessorV%d", 1)];
    uint64_t v5 = (CMISmartStyleProcessor *)[[v4 alloc] initWithOptionalMetalCommandQueue:self->_metalCommandQueue];
    self->_smartStyleProcessor = v5;
    if (v5)
    {
      [(CMISmartStyleProcessor *)v5 setInstanceLabel:@"ApplyNode"];
      [(CMISmartStyleProcessor *)self->_smartStyleProcessor setUseLiveMetalAllocations:1];
      unint64_t v6 = [(objc_class *)v4 getSmartStyleCoefficientsFilterType:@"iir"];
      self->_unint64_t filterType = v6;
      [(CMISmartStyleProcessor *)self->_smartStyleProcessor setConfiguration:[(objc_class *)v4 getDefaultProcessorConfigurationForStreamingWithFilterType:v6]];
      if ([(CMISmartStyleProcessor *)self->_smartStyleProcessor configuration])
      {
        objc_msgSend((id)objc_msgSend((id)-[CMISmartStyleProcessor configuration](self->_smartStyleProcessor, "configuration"), "styleEngineConfiguration"), "globalLinearSystemMixFactor");
        self->_globalLocalSystemMixFactorDecayRate = v7 / 10.0;
        self->_filteredCoefficientsPixelBufferPoolSize = [(objc_class *)v4 getRequiredFilteredCoefficientsPixelBufferPoolSizeForFilterType:self->_filterType]+ 1;
        uint64_t v8 = (objc_class *)[v3 classNamed:objc_msgSend(NSString, "stringWithFormat:", @"CMISmartStyleProcessorInputOutputV%d", 1)];
        self->_smartStyleProcessorInputOutputClass = v8;
        if (v8) {
          return 0;
        }
      }
    }
  }

  self->_smartStyleProcessor = 0;
  return -12786;
}

- (int)_loadAndConfigureSmartStyleProxyRenderer
{
  objc_super v3 = NSClassFromString((NSString *)objc_msgSend(NSString, "stringWithFormat:", @"CMISmartStyleV%d", 1));
  self->_smartStyleClass = v3;
  if (!v3
    || (uint64_t v4 = NSClassFromString((NSString *)objc_msgSend(NSString, "stringWithFormat:", @"CMISmartStyleProxyRendererV%d", 1)), !self->_smartStyleClass)|| (v5 = (CMISmartStyleProxyRenderer *)objc_msgSend([v4 alloc], "initWithOptionalMetalCommandQueue:", self->_metalCommandQueue), (self->_smartStyleProxyRenderer = v5) == 0))
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
    uint64_t v8 = 0;
    goto LABEL_16;
  }
  uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F55F48]), "initWithDevice:allocatorType:", objc_msgSend((id)-[CMISmartStyleProxyRenderer metalCommandQueue](smartStyleProxyRenderer, "metalCommandQueue"), "device"), objc_msgSend(v7, "allocatorType"));
  if (!v8)
  {
LABEL_16:
    CFStringRef v9 = 0;
    goto LABEL_17;
  }
  CFStringRef v9 = objc_opt_new();
  if (!v9)
  {
LABEL_17:
    CFStringRef v12 = 0;
LABEL_18:
    int v13 = -12786;
    goto LABEL_10;
  }
  objc_msgSend(v9, "setMemSize:", objc_msgSend(v7, "memSize"));
  [v9 setWireMemory:1];
  [v9 setLabel:@"BWSmartStyleApplyNode-SmartStyleProxyRenderer-FigMetalAllocatorBackend"];
  objc_msgSend(v9, "setMemoryPoolId:", -[BWMemoryPool poolIdentifier](+[BWMemoryPool sharedMemoryPool](BWMemoryPool, "sharedMemoryPool"), "poolIdentifier"));
  int v10 = [v8 setupWithDescriptor:v9];
  if (v10)
  {
    int v13 = v10;
    CFStringRef v12 = 0;
    goto LABEL_10;
  }
  uint64_t v11 = objc_opt_new();
  CFStringRef v12 = v11;
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
  objc_super v3 = (void *)[MEMORY[0x1E4F1CA48] arrayWithArray:&unk_1EFB04490];
  objc_msgSend(v3, "addObjectsFromArray:", FigCaptureSupportedPixelFormatsForCompressionType(4, 1, 0, 0));
  int maxLossyCompressionLevel = self->_maxLossyCompressionLevel;
  if (maxLossyCompressionLevel) {
    objc_msgSend(v3, "addObjectsFromArray:", FigCaptureSupportedPixelFormatsForCompressionType(4, 1, 0, maxLossyCompressionLevel));
  }
  return v3;
}

- (void)_consumeSampleBufferAttachments:(opaqueCMSampleBuffer *)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = BWAttachedMediaKeysRequiredBySmartStyleRenderingPipelines(1, 1);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        BWSampleBufferRemoveAttachedMedia(a3, *(void *)(*((void *)&v10 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
  CMRemoveAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53158]);
  CFStringRef v9 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  objc_msgSend(v9, "setObject:forKeyedSubscript:", 0, *MEMORY[0x1E4F53500], (void)v10);
  [v9 setObject:0 forKeyedSubscript:*MEMORY[0x1E4F53518]];
  [v9 setObject:0 forKeyedSubscript:*MEMORY[0x1E4F53520]];
  [v9 setObject:0 forKeyedSubscript:*MEMORY[0x1E4F534F0]];
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_getSampleBufferPresentationTimeStamp:(SEL)a3
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(void *)&MEMORY[0x1E4F1F9F8];
  if (a4)
  {
    uint64_t v6 = (void *)CMGetAttachment(a4, (CFStringRef)*MEMORY[0x1E4F53070], 0);
    if (v6 && (v7 = v6, uint64_t v8 = *MEMORY[0x1E4F530C0], [v6 objectForKeyedSubscript:*MEMORY[0x1E4F530C0]])) {
      BOOL result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMakeFromDictionary(&v10, (CFDictionaryRef)[v7 objectForKeyedSubscript:v8]);
    }
    else {
      BOOL result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMSampleBufferGetPresentationTimeStamp(&v10, a4);
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

- (int)maxLossyCompressionLevel
{
  return self->_maxLossyCompressionLevel;
}

@end