@interface BWStillImageScalerNode
+ (void)initialize;
- ($2825F4736939C4A6D3AD43837233062D)resizedOutputDimensions;
- (BOOL)backPressureDrivenPipelining;
- (BOOL)blackFillingRequired;
- (BOOL)enforcesZoomingForPortraitCaptures;
- (BOOL)preferMainImageDownscalingFactorByAttachedMediaKeyFromSampleBuffer;
- (BWStillImageScalerNode)initWithBasePoolCapacity:(int)a3 nodeConfiguration:(id)a4;
- (id)mainImageDownscalingFactorByAttachedMediaKey;
- (id)nodeSubType;
- (id)nodeType;
- (id)outputSizeByAttachedMediaKey;
- (uint64_t)_blackenBorderForAttachedMedia:(const void *)a3 sampleBuffer:(void *)a4 normalizedInputCropRect:(CGFloat)a5 requestedSettings:(CGFloat)a6;
- (uint64_t)_buildPrimaryFormatScalingSession;
- (uint64_t)_rebuildPrimaryFormatBufferPoolForOutputDimensions:(void *)a3 settings:;
- (uint64_t)_removeUnmodifiedAttachedMedias:(uint64_t)a1;
- (uint64_t)_resolveScalerModeWithSettings:(uint64_t)a3 inputDimensions:(uint64_t)a4 outputDimensions:(void *)a5 normalizedInputCropRect:(int *)a6 attachedMediaThatRequiresDifferentScalingThanPrimaryMedia:(double *)a7 stillImageScalerModeOut:(uint64_t *)a8 scaledDenormalizedInputCropRectOut:(CGFloat)a9 mediaToProcessOut:(CGFloat)a10;
- (uint64_t)_resolvedPoolCapacityForSettings:(uint64_t)a3 outputDimensions:;
- (uint64_t)_shouldPurgeAllResourcesAfterProcessingSettings:(uint64_t)result;
- (uint64_t)_zoomAttachedMedia:(CMAttachmentBearerRef)target sampleBuffer:;
- (uint64_t)mainImageDownscalingFactorForAttachedMediaKey:(void *)a3 attachedMediaMetadata:;
- (unint64_t)_outputDimensionsForAttachedMediaKey:(unint64_t)a3 attachedMediaMainImageDownscalingFactor:(unint64_t)a4 primaryMediaWidth:(unint64_t)a5 primaryMediaHeight:(unint64_t)a6 requestedWidth:(char)a7 requestedHeight:(int)a8 zoomWithoutUpscalingEnabled:(float)a9 normalizedZoomRect:(double)a10 optimizedEnhancedResolutionDepthCapture:(double)a11;
- (unint64_t)_resolveOutputDimensionsForSampleBuffer:(void *)a3 settings:(uint64_t)a4 inputDimensions:;
- (void)_attachedMediaKeysThatRequireDifferentScalingThanPrimaryMediaSampleBuffer:(unint64_t)a3 primaryMediaNormalizedInputCropRect:(unint64_t)a4 primaryMediaRequestedOutputWidth:(CGFloat)a5 primaryMediaRequestedOutputHeight:(CGFloat)a6;
- (void)_purgeResourcesLeavingThemForMediaToProcess:(uint64_t)a1;
- (void)_rebuildBufferPoolForAttachedMediaKey:(uint64_t)a3 attachedMediaMainImageDownscalingFactor:(void *)a4 outputDimensions:(float)a5 settings:;
- (void)dealloc;
- (void)didReachEndOfDataForInput:(id)a3;
- (void)didSelectFormat:(id)a3 forInput:(id)a4;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
- (void)setBackPressureDrivenPipelining:(BOOL)a3;
- (void)setBlackFillingRequired:(BOOL)a3;
- (void)setEnforcesZoomingForPortraitCaptures:(BOOL)a3;
- (void)setMainImageDownscalingFactorByAttachedMediaKey:(id)a3;
- (void)setOutputSizeByAttachedMediaKey:(id)a3;
- (void)setPreferMainImageDownscalingFactorByAttachedMediaKeyFromSampleBuffer:(BOOL)a3;
- (void)setResizedOutputDimensions:(id)a3;
@end

@implementation BWStillImageScalerNode

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
  v28[1] = *MEMORY[0x1E4F143B8];
  v6 = objc_alloc_init(BWVideoFormatRequirements);
  v28[0] = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a3, "pixelFormat"));
  -[BWVideoFormatRequirements setSupportedPixelFormats:](v6, "setSupportedPixelFormats:", [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1]);
  if (FigCaptureVideoDimensionsAreValid(*(void *)&self->_resizedOutputDimensions))
  {
    [(BWVideoFormatRequirements *)v6 setWidth:self->_resizedOutputDimensions.width];
    uint64_t height = self->_resizedOutputDimensions.height;
  }
  else
  {
    -[BWVideoFormatRequirements setWidth:](v6, "setWidth:", [a3 width]);
    uint64_t height = [a3 height];
  }
  [(BWVideoFormatRequirements *)v6 setHeight:height];
  [(BWVideoFormatRequirements *)v6 setSupportedCacheModes:+[BWVideoFormatRequirements cacheModesForOptimizedHWAccess]];
  if ([a3 colorSpaceProperties])
  {
    uint64_t v27 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(a3, "colorSpaceProperties"));
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
  }
  else
  {
    uint64_t v8 = 0;
  }
  [(BWVideoFormatRequirements *)v6 setSupportedColorSpaceProperties:v8];
  [(BWNodeOutput *)self->super._output setFormatRequirements:v6];
  [(BWNodeInput *)self->super._input setPassthroughMode:0];
  [(BWNodeOutput *)self->super._output setPassthroughMode:0];
  v9 = (void *)[MEMORY[0x1E4F1CA48] array];
  if ([(NSDictionary *)self->_mainImageDownscalingFactorByAttachedMediaKey count]) {
    objc_msgSend(v9, "addObjectsFromArray:", -[NSDictionary allKeys](self->_mainImageDownscalingFactorByAttachedMediaKey, "allKeys"));
  }
  if ([(NSDictionary *)self->_outputSizeByAttachedMediaKey count]) {
    objc_msgSend(v9, "addObjectsFromArray:", -[NSDictionary allKeys](self->_outputSizeByAttachedMediaKey, "allKeys"));
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v23;
    id obj = v9;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v22 + 1) + 8 * v13);
        objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_mainImageDownscalingFactorByAttachedMediaKey, "objectForKeyedSubscript:", v14), "floatValue");
        if (v15 == 0.0
          && ![(NSDictionary *)self->_outputSizeByAttachedMediaKey objectForKeyedSubscript:v14])
        {
          [(BWNodeInput *)self->super._input setMediaConfiguration:0 forAttachedMediaKey:v14];
          v17 = 0;
        }
        else
        {
          v16 = objc_alloc_init(BWNodeInputMediaConfiguration);
          [(BWNodeInputMediaConfiguration *)v16 setFormatRequirements:objc_alloc_init(BWVideoFormatRequirements)];
          [(BWNodeInputMediaConfiguration *)v16 setPassthroughMode:0];
          [(BWNodeInput *)self->super._input setMediaConfiguration:v16 forAttachedMediaKey:v14];
          v17 = objc_alloc_init(BWNodeOutputMediaConfiguration);
          char v18 = [v14 isEqualToString:0x1EFA74760];
          v19 = v6;
          if ((v18 & 1) == 0) {
            v19 = objc_alloc_init(BWVideoFormatRequirements);
          }
          [(BWNodeOutputMediaConfiguration *)v17 setFormatRequirements:v19];
          [(BWNodeOutputMediaConfiguration *)v17 setPassthroughMode:1];
        }
        [(BWNodeOutput *)self->super._output setMediaConfiguration:v17 forAttachedMediaKey:v14];
        ++v13;
      }
      while (v11 != v13);
      uint64_t v20 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
      uint64_t v11 = v20;
    }
    while (v20);
  }
}

- (id)nodeType
{
  return @"Converter";
}

- (void)setPreferMainImageDownscalingFactorByAttachedMediaKeyFromSampleBuffer:(BOOL)a3
{
  self->_preferMainImageDownscalingFactorByAttachedMediaKeyFromSampleBuffer = a3;
}

- (void)setOutputSizeByAttachedMediaKey:(id)a3
{
  outputSizeByAttachedMediaKey = self->_outputSizeByAttachedMediaKey;
  if (outputSizeByAttachedMediaKey != a3)
  {

    self->_outputSizeByAttachedMediaKey = (NSDictionary *)[a3 copy];
  }
}

- (void)setMainImageDownscalingFactorByAttachedMediaKey:(id)a3
{
  mainImageDownscalingFactorByAttachedMediaKey = self->_mainImageDownscalingFactorByAttachedMediaKey;
  if (mainImageDownscalingFactorByAttachedMediaKey != a3)
  {

    self->_mainImageDownscalingFactorByAttachedMediaKey = (NSDictionary *)[a3 copy];
  }
}

- (void)setEnforcesZoomingForPortraitCaptures:(BOOL)a3
{
  self->_enforcesZoomingForPortraitCaptures = a3;
}

- (void)setBlackFillingRequired:(BOOL)a3
{
  BOOL v3 = a3;
  if (FigCapturePlatformSupportsUniversalCompression())
  {
    v5 = [(BWNodeInput *)self->super._input formatRequirements];
    if (v3) {
      v6 = &unk_1EFB02D68;
    }
    else {
      v6 = 0;
    }
    [(BWFormatRequirements *)v5 setSupportedPixelFormats:v6];
  }
  self->_blackFillingRequired = v3;
}

- (void)setBackPressureDrivenPipelining:(BOOL)a3
{
  self->_backPressureDrivenPipelining = a3;
}

- (BWStillImageScalerNode)initWithBasePoolCapacity:(int)a3 nodeConfiguration:(id)a4
{
  if (a3 <= 0) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"baseCapacity must be >= 1" userInfo:0]);
  }
  v12.receiver = self;
  v12.super_class = (Class)BWStillImageScalerNode;
  v6 = [(BWNode *)&v12 init];
  if (v6)
  {
    v6->_nodeConfiguration = (BWStillImageNodeConfiguration *)a4;
    v7 = [[BWNodeInput alloc] initWithMediaType:1986618469 node:v6];
    uint64_t v8 = objc_alloc_init(BWVideoFormatRequirements);
    [(BWNodeInput *)v7 setFormatRequirements:v8];
    [(BWNodeInput *)v7 setPassthroughMode:2];

    [(BWNode *)v6 addInput:v7];
    v9 = [[BWNodeOutput alloc] initWithMediaType:1986618469 node:v6];
    uint64_t v10 = objc_alloc_init(BWVideoFormatRequirements);
    [(BWNodeOutput *)v9 setFormatRequirements:v10];
    [(BWNodeOutput *)v9 setPassthroughMode:2];

    [(BWNode *)v6 addOutput:v9];
    [(BWNodeOutput *)v9 setProvidesPixelBufferPool:0];

    v6->_poolBaseCapacity = a3;
  }
  return v6;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (void)dealloc
{
  outputFormatDescription = self->_outputFormatDescription;
  if (outputFormatDescription) {
    CFRelease(outputFormatDescription);
  }

  scalingSession = self->_scalingSession;
  if (scalingSession) {
    CFRelease(scalingSession);
  }

  attachedMediaScalingSession = self->_attachedMediaScalingSession;
  if (attachedMediaScalingSession) {
    CFRelease(attachedMediaScalingSession);
  }
  v6.receiver = self;
  v6.super_class = (Class)BWStillImageScalerNode;
  [(BWNode *)&v6 dealloc];
}

- (void)setResizedOutputDimensions:(id)a3
{
  self->_resizedOutputDimensions = ($470D365275581EF16070F5A11344F73E)a3;
}

- ($2825F4736939C4A6D3AD43837233062D)resizedOutputDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_resizedOutputDimensions;
}

- (id)nodeSubType
{
  return @"VideoConverter";
}

- (BOOL)blackFillingRequired
{
  return self->_blackFillingRequired;
}

- (BOOL)enforcesZoomingForPortraitCaptures
{
  return self->_enforcesZoomingForPortraitCaptures;
}

- (id)mainImageDownscalingFactorByAttachedMediaKey
{
  return self->_mainImageDownscalingFactorByAttachedMediaKey;
}

- (BOOL)preferMainImageDownscalingFactorByAttachedMediaKeyFromSampleBuffer
{
  return self->_preferMainImageDownscalingFactorByAttachedMediaKeyFromSampleBuffer;
}

- (uint64_t)mainImageDownscalingFactorForAttachedMediaKey:(void *)a3 attachedMediaMetadata:
{
  if (result)
  {
    uint64_t v4 = result;
    result = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F533D0]), "floatValue");
    if (!*(unsigned char *)(v4 + 188) || v5 == 0.0)
    {
      objc_super v6 = (void *)[*(id *)(v4 + 144) objectForKeyedSubscript:a2];
      return [v6 floatValue];
    }
  }
  return result;
}

- (id)outputSizeByAttachedMediaKey
{
  return self->_outputSizeByAttachedMediaKey;
}

- (BOOL)backPressureDrivenPipelining
{
  return self->_backPressureDrivenPipelining;
}

- (void)didReachEndOfDataForInput:(id)a3
{
  -[BWStillImageScalerNode _purgeResourcesLeavingThemForMediaToProcess:]((uint64_t)self, 0);
  v5.receiver = self;
  v5.super_class = (Class)BWStillImageScalerNode;
  [(BWNode *)&v5 didReachEndOfDataForInput:a3];
}

- (void)_purgeResourcesLeavingThemForMediaToProcess:(uint64_t)a1
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a1 && (*(void *)(a1 + 120) || [*(id *)(a1 + 160) count]))
  {
    [a2 count];
    if (([a2 containsObject:@"PrimaryFormat"] & 1) == 0)
    {
      uint64_t v4 = *(void **)(a1 + 120);
      if (v4)
      {

        *(void *)(a1 + 120) = 0;
        objc_super v5 = *(const void **)(a1 + 128);
        if (v5)
        {
          CFRelease(v5);
          *(void *)(a1 + 128) = 0;
        }
      }
    }
    objc_super v6 = (void *)[MEMORY[0x1E4F1CA48] array];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v7 = *(void **)(a1 + 160);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          if (([a2 containsObject:v12] & 1) == 0) {
            [v6 addObject:v12];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }
    [*(id *)(a1 + 160) removeObjectsForKeys:v6];
    if (![*(id *)(a1 + 160) count])
    {
      uint64_t v13 = *(const void **)(a1 + 168);
      if (v13)
      {
        CFRelease(v13);
        *(void *)(a1 + 168) = 0;
      }
    }
  }
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  v7 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  CMAttachmentBearerRef target = 0;
  long long v8 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
  long long v70 = *MEMORY[0x1E4F1DB28];
  long long v71 = v8;
  CGFloat v9 = (double)[(BWVideoFormat *)[(BWNodeInput *)self->super._input videoFormat] width];
  CGFloat v10 = (double)[(BWVideoFormat *)[(BWNodeInput *)self->super._input videoFormat] height];
  v69.origin.x = 0.0;
  v69.origin.y = 0.0;
  v69.size.width = v9;
  v69.size.uint64_t height = v10;
  int v68 = 0;
  id v67 = 0;
  if (a3 && (CFTypeRef v11 = CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0)) != 0)
  {
    CFTypeRef v12 = v11;
    uint64_t v13 = (void *)CMGetAttachment(a3, @"StillSettings", 0);
    long long v14 = v13;
    CFTypeRef v63 = v12;
    if (v13)
    {
      long long v15 = (void *)[v13 requestedSettings];
      ImageBuffer = CMSampleBufferGetImageBuffer(a3);
      unint64_t v17 = psn_pixelBufferDimensions(ImageBuffer);
      int64_t v64 = -[BWStillImageScalerNode _resolveOutputDimensionsForSampleBuffer:settings:inputDimensions:]((unint64_t)self, a3, v15, v17);
      FigCFDictionaryGetCGRectIfPresent();
      v66 = v14;
      if (dword_1EB4C5430)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      uint64_t v19 = -[BWStillImageScalerNode _attachedMediaKeysThatRequireDifferentScalingThanPrimaryMediaSampleBuffer:primaryMediaNormalizedInputCropRect:primaryMediaRequestedOutputWidth:primaryMediaRequestedOutputHeight:](self, a3, (int)v64, v64 >> 32, *(CGFloat *)&v70, *((CGFloat *)&v70 + 1), *(CGFloat *)&v71, *((CGFloat *)&v71 + 1));
      uint64_t v20 = -[BWStillImageScalerNode _resolveScalerModeWithSettings:inputDimensions:outputDimensions:normalizedInputCropRect:attachedMediaThatRequiresDifferentScalingThanPrimaryMedia:stillImageScalerModeOut:scaledDenormalizedInputCropRectOut:mediaToProcessOut:]((uint64_t)self, v15, v17, v64, v19, &v68, &v69.origin.x, (uint64_t *)&v67, *(CGFloat *)&v70, *((CGFloat *)&v70 + 1), *(CGFloat *)&v71, *((CGFloat *)&v71 + 1));
      if (v20)
      {
        uint64_t v34 = v20;
        v32 = 0;
        CFDictionaryRef DictionaryRepresentation = 0;
        LOBYTE(v30) = 1;
        goto LABEL_62;
      }
      unint64_t v59 = v17;
      v61 = v15;
      v21 = v67;
      long long v22 = (void *)[MEMORY[0x1E4F1CA48] arrayWithArray:v67];
      long long v74 = 0u;
      long long v75 = 0u;
      long long v76 = 0u;
      long long v77 = 0u;
      uint64_t v23 = [v21 countByEnumeratingWithState:&v74 objects:v73 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v75;
        do
        {
          for (uint64_t i = 0; i != v24; ++i)
          {
            if (*(void *)v75 != v25) {
              objc_enumerationMutation(v21);
            }
            uint64_t v27 = *(void **)(*((void *)&v74 + 1) + 8 * i);
            if ((objc_msgSend(v27, "isEqualToString:", @"PrimaryFormat", v57, v58) & 1) == 0
              && !BWSampleBufferGetAttachedMedia(a3, (uint64_t)v27))
            {
              [v22 removeObject:v27];
            }
          }
          uint64_t v24 = [v21 countByEnumeratingWithState:&v74 objects:v73 count:16];
        }
        while (v24);
      }
      id v67 = (id)objc_msgSend(v22, "copy", v57);
      int v28 = objc_msgSend((id)CMGetAttachment(a3, @"NonProcessedReferenceFrame", 0), "BOOLValue");
      if (v28)
      {
        v29 = (void *)[MEMORY[0x1E4F1CA48] arrayWithArray:v67];
        [v29 removeObject:@"PrimaryFormat"];
        id v67 = v29;
      }
      if (objc_msgSend((id)CMGetAttachment(a3, @"StillImageBufferFrameType", 0), "unsignedLongLongValue") == 40) {
        int v30 = 1;
      }
      else {
        int v30 = v28 ^ 1;
      }
      long long v14 = v66;
      if (v30 == 1) {
        -[BWStillImageScalerNode _purgeResourcesLeavingThemForMediaToProcess:]((uint64_t)self, v67);
      }
      CFDictionaryRef DictionaryRepresentation = 0;
      v32 = 0;
      switch(v68)
      {
        case 0:
          goto LABEL_52;
        case 1:
          goto LABEL_58;
        case 2:
          goto LABEL_34;
        case 3:
        case 4:
          v32 = CMSampleBufferGetImageBuffer(a3);
          if (!v32) {
            goto LABEL_53;
          }
          if (dword_1EB4C5430)
          {
            v33 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          uint64_t v35 = VTFillPixelBufferBorderWithBlack();
          if (v35) {
            goto LABEL_79;
          }
          CMSetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53270], MEMORY[0x1E4F1CC38], 1u);
          v36 = (void *)[MEMORY[0x1E4F1CA48] arrayWithArray:v67];
          [v36 removeObject:@"PrimaryFormat"];
          -[BWStillImageScalerNode _blackenBorderForAttachedMedia:sampleBuffer:normalizedInputCropRect:requestedSettings:]((uint64_t)self, v36, a3, v61, *(CGFloat *)&v70, *((CGFloat *)&v70 + 1), *(CGFloat *)&v71, *((CGFloat *)&v71 + 1));
          if (v68 != 4)
          {
            CFDictionaryRef DictionaryRepresentation = 0;
            v32 = 0;
            goto LABEL_58;
          }
          v69.origin.x = 0.0;
          v69.origin.y = 0.0;
          v69.size.width = (double)(int)v59;
          v69.size.uint64_t height = (double)SHIDWORD(v59);
LABEL_34:
          v37 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithArray:", v67, v57, v58);
          [v37 removeObject:@"PrimaryFormat"];
          int v38 = [v67 containsObject:@"PrimaryFormat"];
          uint64_t v39 = [v37 count];
          if (!v38)
          {
            CFDictionaryRef DictionaryRepresentation = 0;
            v32 = 0;
            if (!v39) {
              goto LABEL_58;
            }
            goto LABEL_57;
          }
          uint64_t v60 = v39;
          v62 = v37;
          if ((int)v64 == [(BWPixelBufferPool *)self->_pool width]
            && v64 >> 32 == [(BWPixelBufferPool *)self->_pool height])
          {
            uint64_t v40 = -[BWStillImageScalerNode _resolvedPoolCapacityForSettings:outputDimensions:]((uint64_t)self, v66, v64);
            if ([(BWPixelBufferPool *)self->_pool capacity] != v40) {
              [(BWPixelBufferPool *)self->_pool setCapacity:v40];
            }
          }
          else
          {
            uint64_t v35 = -[BWStillImageScalerNode _rebuildPrimaryFormatBufferPoolForOutputDimensions:settings:]((uint64_t)self, v64, v66);
            if (v35) {
              goto LABEL_79;
            }
          }
          if (self->_scalingSession
            || (uint64_t v35 = -[BWStillImageScalerNode _buildPrimaryFormatScalingSession]((uint64_t)self), !v35))
          {
            CVImageBufferRef v41 = CMSampleBufferGetImageBuffer(a3);
            if (!v41)
            {
LABEL_52:
              v32 = 0;
LABEL_53:
              CFDictionaryRef DictionaryRepresentation = 0;
              goto LABEL_54;
            }
            v42 = v41;
            [NSString stringWithFormat:@"NewPixelBuffer-%@", @"PrimaryFormat"];
            v32 = [(BWPixelBufferPool *)self->_pool newPixelBuffer];
            if (!v32)
            {
              uint64_t v58 = v4;
              LODWORD(v57) = 0;
              FigDebugAssert3();
              CFDictionaryRef DictionaryRepresentation = 0;
              uint64_t v34 = 4294954510;
              goto LABEL_62;
            }
            uint64_t CopyWithNewPixelBuffer = BWCMSampleBufferCreateCopyWithNewPixelBuffer(a3, v32, (CFTypeRef *)&self->_outputFormatDescription, (CMSampleBufferRef *)&target);
            if (!CopyWithNewPixelBuffer)
            {
              id v65 = BWCMSampleBufferCopyReattachAndReturnMutableMetadata(target);
              CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v69);
              if (DictionaryRepresentation)
              {
                uint64_t v44 = VTSessionSetProperty(self->_scalingSession, (CFStringRef)*MEMORY[0x1E4F45170], DictionaryRepresentation);
                if (!v44)
                {
                  if (dword_1EB4C5430)
                  {
                    v45 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                    os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT);
                    fig_log_call_emit_and_clean_up_after_send_and_compose();
                    long long v14 = v66;
                  }
                  uint64_t v44 = VTPixelTransferSessionTransferImage(self->_scalingSession, v42, v32);
                  if (!v44)
                  {
                    CVBufferRemoveAttachment(v32, (CFStringRef)*MEMORY[0x1E4F24A78]);
                    unsigned int v46 = [(BWVideoFormat *)[(BWNodeInput *)self->super._input videoFormat] width];
                    unsigned int v47 = [(BWVideoFormat *)[(BWNodeInput *)self->super._input videoFormat] height];
                    unsigned int v48 = [(BWPixelBufferPool *)self->_pool width];
                    unint64_t v49 = v46 | ((unint64_t)v47 << 32);
                    unint64_t v50 = v48 | ((unint64_t)[(BWPixelBufferPool *)self->_pool height] << 32);
                    FigCaptureMetadataUtilitiesUpdateMetadataForStillImageCrop(v65, v49, v50, v69.origin.x, v69.origin.y, v69.size.width, v69.size.height, *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
                    FigCaptureMetadataUtilitiesUpdateMetadataForNewFinalDimensions((uint64_t)v65, v49, v50);
                    BWUpdateLandmarksForStillImageCrop(target, 801, *(double *)&v70, *((double *)&v70 + 1), *(double *)&v71, *((double *)&v71 + 1));
                    FigCaptureMetadataUtilitiesPreventFurtherCropping(v65, v51);
                    [(BWMemoryAnalyticsPayload *)[(BWGraph *)[(BWNode *)self graph] memoryAnalyticsPayload] setScaledStillCaptureTaken:1];
                    CGFloat v52 = (double)[(BWPixelBufferPool *)self->_pool width];
                    v79.uint64_t height = (double)[(BWPixelBufferPool *)self->_pool height];
                    v79.width = v52;
                    CFDictionaryRef v53 = CGSizeCreateDictionaryRepresentation(v79);
                    CMSetAttachment(target, @"OriginalCameraIntrinsicMatrixReferenceDimensions", v53, 1u);

                    double v54 = (double)[(BWPixelBufferPool *)self->_pool width];
                    unint64_t v55 = [(BWPixelBufferPool *)self->_pool height];
                    BWUpdateCameraIntrinsicsMatrixOnSampleBuffer(target, @"OriginalCameraIntrinsicMatrix", 0, 0, v69.origin.x, v69.origin.y, v69.size.width, v69.size.height, 0.0, 0.0, v54, (double)v55);
                    a3 = (opaqueCMSampleBuffer *)target;
                    v37 = v62;
                    if (v60) {
LABEL_57:
                    }
                      -[BWStillImageScalerNode _zoomAttachedMedia:sampleBuffer:]((uint64_t)self, v37, a3);
LABEL_58:
                    if (a3)
                    {
                      [(BWNodeOutput *)self->super._output emitSampleBuffer:a3];
                      v7 = (_DWORD *)MEMORY[0x1E4F1EBA8];
                      if (!v30) {
                        goto LABEL_66;
                      }
                      goto LABEL_64;
                    }
                    uint64_t v34 = 0;
                    goto LABEL_62;
                  }
                }
                uint64_t v34 = v44;
LABEL_62:
                v7 = (_DWORD *)MEMORY[0x1E4F1EBA8];
                goto LABEL_63;
              }
LABEL_54:
              uint64_t v34 = 4294954516;
              goto LABEL_62;
            }
            uint64_t v34 = CopyWithNewPixelBuffer;
LABEL_83:
            CFDictionaryRef DictionaryRepresentation = 0;
            goto LABEL_62;
          }
LABEL_79:
          uint64_t v34 = v35;
          v32 = 0;
          goto LABEL_83;
        default:
          uint64_t v34 = 0;
          v32 = 0;
          goto LABEL_62;
      }
    }
    v32 = 0;
  }
  else
  {
    v32 = 0;
    long long v14 = 0;
    CFTypeRef v63 = 0;
  }
  CFDictionaryRef DictionaryRepresentation = 0;
  LOBYTE(v30) = 1;
  uint64_t v34 = 4294954516;
LABEL_63:
  id v56 = +[BWNodeError newError:sourceNode:stillImageSettings:metadata:](BWNodeError, "newError:sourceNode:stillImageSettings:metadata:", v34, self, v14, v63, v57, v58);
  [(BWNodeOutput *)self->super._output emitNodeError:v56];

  if ((v30 & 1) == 0) {
    goto LABEL_66;
  }
LABEL_64:
  if (-[BWStillImageScalerNode _shouldPurgeAllResourcesAfterProcessingSettings:]((uint64_t)self, v14)) {
    -[BWStillImageScalerNode _purgeResourcesLeavingThemForMediaToProcess:]((uint64_t)self, 0);
  }
LABEL_66:
  if (DictionaryRepresentation) {
    CFRelease(DictionaryRepresentation);
  }
  if (v32) {
    CFRelease(v32);
  }
  if (target) {
    CFRelease(target);
  }
  if (*v7 == 1) {
    kdebug_trace();
  }
}

- (unint64_t)_resolveOutputDimensionsForSampleBuffer:(void *)a3 settings:(uint64_t)a4 inputDimensions:
{
  unint64_t v4 = a1;
  if (a1)
  {
    long long v8 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53070], 0);
    int v9 = objc_msgSend((id)CMGetAttachment(target, @"StillImageBufferFrameType", 0), "unsignedIntValue");
    CGFloat v10 = (void *)[v8 objectForKeyedSubscript:*MEMORY[0x1E4F533C8]];
    int v11 = BWStillImageProcessingFlagsForSampleBuffer(target);
    if ([*(id *)(v4 + 96) optimizedEnhancedResolutionDepthPipelineEnabled]) {
      BOOL v12 = v9 == 13;
    }
    else {
      BOOL v12 = 0;
    }
    if (v12)
    {
      unint64_t v16 = FigCaptureMetadataUtilitiesEnforceAspectRatioWithStillImageDimensions(a4, (double)[a3 outputWidth]/ (double)objc_msgSend(a3, "outputHeight"));
      LODWORD(v4) = v16;
      a1 = HIDWORD(v16);
    }
    else if (!FigCaptureVideoDimensionsAreValid([*(id *)(v4 + 96) stereoPhotoOutputDimensions]) {
           || (v11 & 0x100000) == 0)
    }
    {
      if (v10)
      {
        [v10 floatValue];
        float v15 = v14;
        unint64_t v4 = (unint64_t)(float)(v14 * (float)[a3 outputWidth]);
        a1 = (unint64_t)(float)(v15 * (float)[a3 outputHeight]);
      }
      else if (FigCaptureVideoDimensionsAreValid(*(void *)(v4 + 180)))
      {
        unint64_t v19 = v4 + 180;
        LODWORD(v4) = *(_DWORD *)(v4 + 180);
        a1 = *(unsigned int *)(v19 + 4);
      }
      else
      {
        LODWORD(v4) = [a3 outputWidth];
        a1 = [a3 outputHeight];
      }
    }
    else
    {
      int v17 = [*(id *)(v4 + 96) stereoPhotoOutputDimensions];
      a1 = (unint64_t)[*(id *)(v4 + 96) stereoPhotoOutputDimensions] >> 32;
      LODWORD(v4) = v17;
    }
  }
  return v4 | (a1 << 32);
}

- (void)_attachedMediaKeysThatRequireDifferentScalingThanPrimaryMediaSampleBuffer:(unint64_t)a3 primaryMediaNormalizedInputCropRect:(unint64_t)a4 primaryMediaRequestedOutputWidth:(CGFloat)a5 primaryMediaRequestedOutputHeight:(CGFloat)a6
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v11 = (uint64_t)result;
    v43 = (void *)[MEMORY[0x1E4F1CA48] array];
    uint64_t v44 = (void *)CMGetAttachment(a2, @"StillSettings", 0);
    BOOL v12 = (void *)[v44 requestedSettings];
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id obj = BWSampleBufferCopyDictionaryOfAttachedMedia(a2);
    uint64_t v13 = [obj countByEnumeratingWithState:&v52 objects:v56 count:16];
    if (!v13) {
      goto LABEL_35;
    }
    uint64_t v14 = v13;
    uint64_t v47 = *(void *)v53;
    CFStringRef key = (const __CFString *)*MEMORY[0x1E4F53070];
    float v15 = a2;
    while (1)
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v53 != v47) {
          objc_enumerationMutation(obj);
        }
        int v17 = *(void **)(*((void *)&v52 + 1) + 8 * v16);
        AttachedMedia = (void *)BWSampleBufferGetAttachedMedia(a2, (uint64_t)v17);
        unint64_t v19 = (void *)CMGetAttachment(AttachedMedia, key, 0);
        -[BWStillImageScalerNode mainImageDownscalingFactorForAttachedMediaKey:attachedMediaMetadata:](v11, (uint64_t)v17, v19);
        float v21 = v20;
        if ([*(id *)(v11 + 96) optimizedEnhancedResolutionDepthPipelineEnabled]) {
          unint64_t v22 = ((unint64_t)objc_msgSend((id)objc_msgSend(v44, "captureSettings"), "captureFlags") >> 11) & 1;
        }
        else {
          LODWORD(v22) = 0;
        }
        double FinalCropRect = FigCaptureMetadataUtilitiesGetFinalCropRect();
        double v25 = v24;
        double v27 = v26;
        double v29 = v28;
        int64_t v30 = BWPixelBufferDimensionsFromSampleBuffer((opaqueCMSampleBuffer *)AttachedMedia);
        int64_t v31 = -[BWStillImageScalerNode _outputDimensionsForAttachedMediaKey:attachedMediaMainImageDownscalingFactor:primaryMediaWidth:primaryMediaHeight:requestedWidth:requestedHeight:zoomWithoutUpscalingEnabled:normalizedZoomRect:optimizedEnhancedResolutionDepthCapture:](v11, v17, a3, a4, [v12 outputWidth], objc_msgSend(v12, "outputHeight"), objc_msgSend(v12, "isZoomWithoutUpscalingEnabled"), v22, v21, FinalCropRect, v25, v27, v29);
        BOOL v32 = ([v17 isEqualToString:0x1EFA74740] & 1) == 0
           && ([v17 isEqualToString:0x1EFA747C0] & 1) == 0
           && ([v17 isEqualToString:0x1EFA74780] & 1) == 0
           && ([v17 isEqualToString:0x1EFA747E0] & 1) == 0
           && ![v17 isEqualToString:0x1EFA74800];
        v58.origin.x = FinalCropRect;
        v58.origin.y = v25;
        v58.size.width = v27;
        v58.size.uint64_t height = v29;
        v60.origin.x = a5;
        v60.origin.y = a6;
        v60.size.width = a7;
        v60.size.uint64_t height = a8;
        a2 = v15;
        if (CGRectEqualToRect(v58, v60) && FigCaptureVideoDimensionsAreEqual(v30, v31))
        {
          v61.origin.x = 0.0;
          v61.origin.y = 0.0;
          v61.size.width = 1.0;
          v61.size.uint64_t height = 1.0;
          v59.origin.x = FinalCropRect;
          v59.origin.y = v25;
          v59.size.width = v27;
          v59.size.uint64_t height = v29;
          if (CGRectEqualToRect(v59, v61) || v32) {
            goto LABEL_31;
          }
LABEL_22:
          double v33 = v27 / v29;
          goto LABEL_23;
        }
        if (!v32) {
          goto LABEL_22;
        }
        double v33 = (double)(int)v31 / (double)SHIDWORD(v31);
LABEL_23:
        if (v21 == 0.0)
        {
          if (![*(id *)(v11 + 152) objectForKeyedSubscript:v17]) {
            goto LABEL_31;
          }
          FigCaptureMetadataUtilitiesComputeDenormalizedStillImageCropRect((int)v30, v30 >> 32, FinalCropRect, v25, v27, v29, v33);
        }
        else
        {
          double v34 = FigCaptureMetadataUtilitiesComputeDenormalizedStillImageCropRectForAttachedMedia((int)v30, v30 >> 32, FinalCropRect, v25, v27, v29, v33, v21);
        }
        double v38 = v34;
        double v39 = v35;
        double v40 = v36;
        double v41 = v37;
        if (CGRectIsNull(*(CGRect *)&v34)) {
          FigDebugAssert3();
        }
        if (!sis_encoderCanCropDenormalizedZoomRect((int)v31, v31 >> 32, v38, v39, v40, v41))
        {
          FigCaptureVideoDimensionsAreEqual(v30, v31);
          [v43 addObject:v17];
        }
LABEL_31:
        ++v16;
      }
      while (v14 != v16);
      uint64_t v42 = [obj countByEnumeratingWithState:&v52 objects:v56 count:16];
      uint64_t v14 = v42;
      if (!v42)
      {
LABEL_35:

        if ([v43 count]) {
          return v43;
        }
        else {
          return 0;
        }
      }
    }
  }
  return result;
}

- (uint64_t)_resolveScalerModeWithSettings:(uint64_t)a3 inputDimensions:(uint64_t)a4 outputDimensions:(void *)a5 normalizedInputCropRect:(int *)a6 attachedMediaThatRequiresDifferentScalingThanPrimaryMedia:(double *)a7 stillImageScalerModeOut:(uint64_t *)a8 scaledDenormalizedInputCropRectOut:(CGFloat)a9 mediaToProcessOut:(CGFloat)a10
{
  if (result)
  {
    uint64_t v12 = result;
    result = 0;
    if (a6)
    {
      if (a7 && a8)
      {
        uint64_t v48 = objc_msgSend((id)objc_msgSend(a2, "bravoConstituentImageDeliveryDeviceTypes"), "count");
        int v22 = objc_msgSend((id)objc_msgSend(*(id *)(v12 + 8), "videoFormat"), "pixelFormat");
        BOOL v23 = (a4 & 0x1F000000000) == 0 || (a4 & 0x1F0) == 0;
        if (FigCapturePixelFormatGetCompressionType(v22)) {
          BOOL v24 = v23;
        }
        else {
          BOOL v24 = 0;
        }
        v45 = a5;
        BOOL v25 = [a2 outputFormat] == 1785750887
           || [a2 outputFormat] == 1752589105;
        unint64_t v26 = (int)a4;
        BOOL v27 = FigCapturePixelFormatIsDemosaicedRaw([a2 rawOutputFormat])
           && [a2 outputFormat] == 0;
        unint64_t v28 = a4 >> 32;
        BOOL v29 = v26 == objc_msgSend((id)objc_msgSend(*(id *)(v12 + 8), "videoFormat"), "width")
           && v28 == objc_msgSend((id)objc_msgSend(*(id *)(v12 + 8), "videoFormat"), "height");
        if (*(unsigned char *)(v12 + 137)) {
          int v30 = BWCIFilterArrayContainsPortraitFilters((void *)[a2 processedImageFilters]);
        }
        else {
          int v30 = 0;
        }
        FigCaptureMetadataUtilitiesComputeDenormalizedStillImageCropRect((int)a3, a3 >> 32, a9, a10, a11, a12, (double)v26 / (double)v28);
        double x = v49.origin.x;
        double y = v49.origin.y;
        double width = v49.size.width;
        double height = v49.size.height;
        if (CGRectIsNull(v49))
        {
          FigDebugAssert3();
          return 4294954516;
        }
        else
        {
          int v35 = v25 || v27;
          v50.origin.double x = a9;
          v50.origin.double y = a10;
          v50.size.double width = a11;
          v50.size.double height = a12;
          if (CGRectIsEmpty(v50))
          {
            BOOL v36 = 0;
          }
          else
          {
            BOOL v36 = 1;
            if (round(x) <= 0.0 && round(y) <= 0.0 && round(x + width) >= (double)(int)a3) {
              BOOL v36 = round(y + height) < (double)SHIDWORD(a3);
            }
          }
          if (!v35) {
            goto LABEL_30;
          }
          int v37 = !sis_encoderCanCropDenormalizedZoomRect(v26, v28, x, y, width, height) || v29;
          if (v48) {
            int v37 = 1;
          }
          if ((v37 | v24 | v30) != 1)
          {
            uint64_t v44 = [v45 count];
            if (v44) {
              int v42 = 2;
            }
            else {
              int v42 = 1;
            }
            if (v44) {
              uint64_t v41 = (uint64_t)v45;
            }
            else {
              uint64_t v41 = 0;
            }
          }
          else
          {
LABEL_30:
            int v38 = v36 || !v29 || v24;
            if (v38 != 1 || v48 == 0)
            {
              if (v38)
              {
                double v40 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithArray:", objc_msgSend(*(id *)(v12 + 144), "allKeys"));
                objc_msgSend(v40, "addObjectsFromArray:", objc_msgSend(*(id *)(v12 + 152), "allKeys"));
                [v40 addObject:@"PrimaryFormat"];
                uint64_t v41 = [v40 allObjects];
                int v42 = 2;
              }
              else
              {
                uint64_t v41 = 0;
                int v42 = !v24;
              }
            }
            else
            {
              if (v29) {
                int v42 = 3;
              }
              else {
                int v42 = 4;
              }
              v43 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithArray:", objc_msgSend(*(id *)(v12 + 144), "allKeys"));
              objc_msgSend(v43, "addObjectsFromArray:", objc_msgSend(*(id *)(v12 + 152), "allKeys"));
              [v43 addObject:@"PrimaryFormat"];
              uint64_t v41 = [v43 allObjects];
            }
          }
          result = 0;
          *a6 = v42;
          *a7 = x;
          a7[1] = y;
          a7[2] = width;
          a7[3] = height;
          *a8 = v41;
        }
      }
    }
  }
  return result;
}

- (uint64_t)_blackenBorderForAttachedMedia:(const void *)a3 sampleBuffer:(void *)a4 normalizedInputCropRect:(CGFloat)a5 requestedSettings:(CGFloat)a6
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v14 = a2;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  uint64_t v53 = [a2 countByEnumeratingWithState:&v54 objects:v60 count:16];
  if (!v53)
  {
    uint64_t v16 = 0;
    goto LABEL_34;
  }
  uint64_t v16 = 0;
  CFStringRef key = (const __CFString *)*MEMORY[0x1E4F53070];
  uint64_t v52 = *(void *)v55;
  double v47 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v48 = *MEMORY[0x1E4F1DB20];
  double v45 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  double v46 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  CFStringRef v50 = (const __CFString *)*MEMORY[0x1E4F53270];
  v43 = v14;
  uint64_t v44 = a4;
  do
  {
    uint64_t v17 = 0;
    do
    {
      if (*(void *)v55 != v52) {
        objc_enumerationMutation(v14);
      }
      uint64_t v18 = *(void *)(*((void *)&v54 + 1) + 8 * v17);
      AttachedMedia = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a3, v18);
      if (AttachedMedia)
      {
        float v20 = AttachedMedia;
        CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(AttachedMedia);
        if (!ImageBuffer) {
          goto LABEL_28;
        }
        int v22 = ImageBuffer;
        BOOL v23 = (void *)CMGetAttachment(v20, key, 0);
        -[BWStillImageScalerNode mainImageDownscalingFactorForAttachedMediaKey:attachedMediaMetadata:](a1, v18, v23);
        float v25 = v24;
        if (v24 == 0.0 && ![*(id *)(a1 + 152) objectForKeyedSubscript:v18]) {
          goto LABEL_28;
        }
        double v26 = (double)objc_msgSend(a4, "outputWidth", v41, v42);
        double v27 = v26 / (double)[a4 outputHeight];
        if (v25 == 0.0)
        {
          long long v35 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
          long long v58 = *MEMORY[0x1E4F1DB20];
          *(_OWORD *)CGRect v59 = v35;
          CGFloat y = v47;
          CGFloat x = v48;
          CGFloat v34 = v45;
          CGFloat v33 = v46;
          if (FigCFDictionaryGetCGRectIfPresent())
          {
            size_t Width = CVPixelBufferGetWidth(v22);
            size_t Height = CVPixelBufferGetHeight(v22);
            FigCaptureMetadataUtilitiesComputeDenormalizedStillImageCropRect(Width, Height, *(CGFloat *)&v58, *((CGFloat *)&v58 + 1), v59[0], v59[1], v27);
            CGFloat x = v63.origin.x;
            CGFloat y = v63.origin.y;
            CGFloat v33 = v63.size.width;
            CGFloat v34 = v63.size.height;
            if (CGRectIsNull(v63))
            {
              uint64_t v42 = v8;
              LODWORD(v41) = 0;
LABEL_30:
              FigDebugAssert3();
            }
          }
        }
        else
        {
          if (v25 != 1.0 && v25 != 2.0)
          {
            uint64_t v16 = 4294954516;
LABEL_28:
            BWSampleBufferRemoveAttachedMedia(a3, v18);
            goto LABEL_26;
          }
          size_t v29 = CVPixelBufferGetWidth(v22);
          size_t v30 = CVPixelBufferGetHeight(v22);
          v62.origin.CGFloat x = FigCaptureMetadataUtilitiesComputeDenormalizedStillImageCropRectForAttachedMedia(v29, v30, a5, a6, a7, a8, v27, v25);
          CGFloat x = v62.origin.x;
          CGFloat y = v62.origin.y;
          CGFloat v33 = v62.size.width;
          CGFloat v34 = v62.size.height;
          if (CGRectIsNull(v62))
          {
            uint64_t v42 = v8;
            LODWORD(v41) = 0;
            goto LABEL_30;
          }
        }
        v64.origin.CGFloat x = x;
        v64.origin.CGFloat y = y;
        v64.size.double width = v33;
        v64.size.double height = v34;
        if (CGRectIsNull(v64)) {
          goto LABEL_25;
        }
        if (dword_1EB4C5430)
        {
          os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
          uint64_t v14 = v43;
          a4 = v44;
        }
        uint64_t v16 = VTFillPixelBufferBorderWithBlack();
        if (!v16)
        {
LABEL_25:
          CMSetAttachment(v20, v50, MEMORY[0x1E4F1CC38], 1u);
          goto LABEL_26;
        }
        goto LABEL_28;
      }
LABEL_26:
      ++v17;
    }
    while (v53 != v17);
    uint64_t v39 = [v14 countByEnumeratingWithState:&v54 objects:v60 count:16];
    uint64_t v53 = v39;
  }
  while (v39);
LABEL_34:
  -[BWStillImageScalerNode _removeUnmodifiedAttachedMedias:](a1, a3);
  return v16;
}

- (uint64_t)_rebuildPrimaryFormatBufferPoolForOutputDimensions:(void *)a3 settings:
{
  v20[1] = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v5 = result;
    objc_super v6 = objc_alloc_init(BWVideoFormatRequirements);
    uint64_t v7 = [(id)v5 name];
    if (v7) {
      uint64_t v8 = (__CFString *)v7;
    }
    else {
      uint64_t v8 = @"StillImageScaler";
    }
    uint64_t v9 = -[BWStillImageScalerNode _resolvedPoolCapacityForSettings:outputDimensions:](v5, a3, a2);
    uint64_t v10 = objc_msgSend((id)objc_msgSend(*(id *)(v5 + 8), "videoFormat"), "pixelFormat");
    int CompressionType = FigCapturePixelFormatGetCompressionType(objc_msgSend((id)objc_msgSend(*(id *)(v5 + 8), "videoFormat"), "pixelFormat"));
    BOOL v12 = (a2 & 0x1F000000000) == 0 || (a2 & 0x1F0) == 0;
    if (v12 && CompressionType) {
      uint64_t v10 = FigCaptureUncompressedPixelFormatForPixelFormat(v10);
    }
    v20[0] = [NSNumber numberWithUnsignedInt:v10];
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v6, "setSupportedPixelFormats:", [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1]);
    [(BWVideoFormatRequirements *)v6 setWidth:(int)a2];
    [(BWVideoFormatRequirements *)v6 setHeight:a2 >> 32];
    [(BWVideoFormatRequirements *)v6 setBytesPerRowAlignment:64];
    [(BWVideoFormatRequirements *)v6 setPlaneAlignment:64];
    [(BWVideoFormatRequirements *)v6 setSupportedCacheModes:+[BWVideoFormatRequirements cacheModesForCacheProfile:2]];
    unint64_t v19 = v6;
    id v13 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1]);
    if (v13)
    {
      id v14 = v13;

      float v15 = [BWPixelBufferPool alloc];
      uint64_t v16 = [*(id *)(v5 + 16) memoryPool];
      LOBYTE(v18) = *(unsigned char *)(v5 + 176);
      uint64_t v17 = -[BWPixelBufferPool initWithVideoFormat:capacity:name:clientProvidesPool:memoryPool:providesBackPressure:reportSlowBackPressureAllocations:](v15, "initWithVideoFormat:capacity:name:clientProvidesPool:memoryPool:providesBackPressure:reportSlowBackPressureAllocations:", v14, v9, v8, 0, v16, v18);
      result = 0;
      *(void *)(v5 + 120) = v17;
      if (!v17) {
        return 4294954510;
      }
    }
    else
    {
      return 4294954516;
    }
  }
  return result;
}

- (uint64_t)_resolvedPoolCapacityForSettings:(uint64_t)a3 outputDimensions:
{
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = *(int *)(result + 112);
    objc_msgSend((id)objc_msgSend(a2, "requestedSettings"), "smartStyle");
    unint64_t v7 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "requestedSettings"), "bravoConstituentImageDeliveryDeviceTypes"), "count");
    BOOL v8 = objc_msgSend((id)objc_msgSend(*(id *)(v5 + 8), "videoFormat"), "width") != (int)a3
      || objc_msgSend((id)objc_msgSend(*(id *)(v5 + 8), "videoFormat"), "height") != a3 >> 32;
    if (v7 > 1 && v8) {
      uint64_t v9 = v7;
    }
    else {
      uint64_t v9 = 1;
    }
    return v9 * v6;
  }
  return result;
}

- (uint64_t)_buildPrimaryFormatScalingSession
{
  if (result)
  {
    uint64_t v1 = result;
    v2 = *(const void **)(result + 128);
    if (v2)
    {
      CFRelease(v2);
      *(void *)(v1 + 128) = 0;
    }
    return VTPixelTransferSessionCreate(0, (VTPixelTransferSessionRef *)(v1 + 128));
  }
  return result;
}

- (uint64_t)_zoomAttachedMedia:(CMAttachmentBearerRef)target sampleBuffer:
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  CMAttachmentBearerRef v4 = target;
  uint64_t v6 = a1;
  v73 = (void *)CMGetAttachment(target, @"StillSettings", 0);
  long long v74 = (void *)[v73 requestedSettings];
  long long v91 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  uint64_t v7 = [a2 countByEnumeratingWithState:&v91 objects:v95 count:16];
  if (!v7)
  {
    unsigned int v71 = 0;
    goto LABEL_87;
  }
  uint64_t v8 = v7;
  unsigned int v71 = 0;
  uint64_t v9 = *(void *)v92;
  CFStringRef key = (const __CFString *)*MEMORY[0x1E4F53070];
  CFAllocatorRef allocator = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  __asm { FMOV            V0.2D, #1.0 }
  long long v67 = _Q0;
  CFStringRef v69 = (const __CFString *)*MEMORY[0x1E4F24A90];
  CFStringRef v68 = (const __CFString *)*MEMORY[0x1E4F24BC8];
  propertyKeCGFloat y = (const __CFString *)*MEMORY[0x1E4F45170];
  CFStringRef v65 = (const __CFString *)*MEMORY[0x1E4F55B40];
  double v63 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v64 = *MEMORY[0x1E4F1DB20];
  double v15 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  double v62 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  uint64_t v82 = v6;
  long long v75 = v4;
  long long v76 = a2;
  do
  {
    uint64_t v16 = 0;
    uint64_t v83 = v8;
    do
    {
      if (*(void *)v92 != v9) {
        objc_enumerationMutation(a2);
      }
      uint64_t v17 = *(void **)(*((void *)&v91 + 1) + 8 * v16);
      CFTypeRef v89 = 0;
      CFTypeRef cf = 0;
      if ((objc_msgSend(v17, "isEqualToString:", 0x1EFA747C0, v60) & 1) == 0
        && ([v17 isEqualToString:0x1EFA74780] & 1) == 0
        && ([v17 isEqualToString:0x1EFA747E0] & 1) == 0
        && ([v17 isEqualToString:0x1EFA74800] & 1) == 0)
      {
        AttachedMedia = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(v4, (uint64_t)v17);
        if (AttachedMedia)
        {
          unint64_t v19 = a2;
          CMAttachmentBearerRef v20 = v4;
          float v21 = AttachedMedia;
          CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(AttachedMedia);
          if (!ImageBuffer)
          {
            CMAttachmentBearerRef v4 = v20;
            goto LABEL_22;
          }
          BOOL v23 = ImageBuffer;
          CGSize v79 = v21;
          float v24 = (void *)CMGetAttachment(v21, key, 0);
          -[BWStillImageScalerNode mainImageDownscalingFactorForAttachedMediaKey:attachedMediaMetadata:](v6, (uint64_t)v17, v24);
          float v26 = v25;
          if (v25 == 0.0 && ![*(id *)(v6 + 152) objectForKeyedSubscript:v17])
          {
            CMAttachmentBearerRef v4 = v20;
            goto LABEL_22;
          }
          CMAttachmentBearerRef v4 = v20;
          if (!*(void *)(v6 + 168)
            && VTPixelTransferSessionCreate(allocator, (VTPixelTransferSessionRef *)(v6 + 168)))
          {
LABEL_22:
            a2 = v19;
            goto LABEL_30;
          }
          objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)v6, "graph"), "memoryAnalyticsPayload"), "setScaledStillCaptureTaken:", 1);
          if (v26 == 0.0 || v26 == 1.0 || (a2 = v19, CVPixelBufferGetPixelFormatType(v23) == 1278226488))
          {
            uint64_t v8 = v83;
            if ([*(id *)(v6 + 96) optimizedEnhancedResolutionDepthPipelineEnabled]) {
              CVBufferRef buffer = (CVBufferRef)(((unint64_t)objc_msgSend((id)objc_msgSend(v73, "captureSettings"), "captureFlags") >> 11) & 1);
            }
            else {
              LODWORD(buffer) = 0;
            }
            long long v87 = *MEMORY[0x1E4F1DB20];
            long long v88 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
            if (!FigCFDictionaryGetCGRectIfPresent())
            {
              long long v87 = 0uLL;
              long long v88 = v67;
            }
            int Width = CVPixelBufferGetWidth(v23);
            pixelBuffer = v23;
            int Height = CVPixelBufferGetHeight(v23);
            unint64_t v27 = -[BWStillImageScalerNode _outputDimensionsForAttachedMediaKey:attachedMediaMainImageDownscalingFactor:primaryMediaWidth:primaryMediaHeight:requestedWidth:requestedHeight:zoomWithoutUpscalingEnabled:normalizedZoomRect:optimizedEnhancedResolutionDepthCapture:](v82, v17, [v74 outputWidth], objc_msgSend(v74, "outputHeight"), objc_msgSend(v74, "outputWidth"), objc_msgSend(v74, "outputHeight"), objc_msgSend(v74, "isZoomWithoutUpscalingEnabled"), (int)buffer, v26, *(double *)&v87, *((double *)&v87 + 1), *(double *)&v88, *((double *)&v88 + 1));
            if (([v17 isEqualToString:@"Depth"] & 1) != 0
              || [v17 isEqualToString:0x1EFA74740])
            {
              FigCaptureMetadataUtilitiesDenormalizeCropRect(*(double *)&v87, *((double *)&v87 + 1), *(double *)&v88, *((double *)&v88 + 1));
              FigCaptureMetadataUtilitiesRoundRectToEvenCoordinates();
              double v29 = v28;
              double v31 = v30;
              double v33 = v32;
              double v35 = v34;
              CMAttachmentBearerRef v4 = v75;
              a2 = v76;
              uint64_t v6 = v82;
            }
            else
            {
              double v37 = (double)(int)v27 / (double)SHIDWORD(v27);
              CMAttachmentBearerRef v4 = v75;
              a2 = v76;
              if (v26 == 0.0) {
                FigCaptureMetadataUtilitiesComputeDenormalizedStillImageCropRect(Width, Height, *(CGFloat *)&v87, *((CGFloat *)&v87 + 1), *(CGFloat *)&v88, *((CGFloat *)&v88 + 1), v37);
              }
              else {
                double v38 = FigCaptureMetadataUtilitiesComputeDenormalizedStillImageCropRectForAttachedMedia(Width, Height, *(CGFloat *)&v87, *((CGFloat *)&v87 + 1), *(CGFloat *)&v88, *((CGFloat *)&v88 + 1), v37, v26);
              }
              double v29 = v38;
              double v31 = v39;
              double v33 = v40;
              double v35 = v41;
              uint64_t v6 = v82;
            }
            v97.origin.CGFloat x = v29;
            v97.origin.CGFloat y = v31;
            v97.size.double width = v33;
            v97.size.double height = v35;
            if (CGRectIsNull(v97))
            {
              uint64_t v61 = v3;
              LODWORD(v60) = 0;
              FigDebugAssert3();
              unsigned int v71 = -12780;
            }
            else
            {
              unint64_t v77 = v27;
              BOOL v42 = FigCaptureVideoDimensionsAreEqual((int)v33 | ((unint64_t)(int)v35 << 32), v27);
              int v43 = [v17 isEqualToString:0x1EFA74760];
              if (!v43) {
                goto LABEL_41;
              }
              if (*(unsigned char *)(v6 + 137))
              {
                LOBYTE(v43) = BWCIFilterArrayContainsPortraitFilters((void *)[v74 processedImageFilters]);
LABEL_41:
                if (v42)
                {
LABEL_42:
                  if ((v43 & 1) == 0
                    && (CVPixelBufferGetPlaneCount(v23) == 1
                     || sis_encoderCanCropDenormalizedZoomRect([v74 outputWidth], objc_msgSend(v74, "outputHeight"), v29, v31, v33, v35)))
                  {
                    goto LABEL_75;
                  }
                }
              }
              else
              {
                LOBYTE(v43) = 0;
                if (v42) {
                  goto LABEL_42;
                }
              }
              if ([v17 isEqualToString:@"Depth"])
              {
                v100.size.double width = (double)Width;
                v100.size.double height = (double)Height;
                v100.origin.CGFloat x = 0.0;
                v100.origin.CGFloat y = 0.0;
                v98.origin.CGFloat x = v29;
                v98.origin.CGFloat y = v31;
                v98.size.double width = v33;
                v98.size.double height = v35;
                if (CGRectEqualToRect(v98, v100)) {
                  goto LABEL_75;
                }
              }
              -[BWStillImageScalerNode _rebuildBufferPoolForAttachedMediaKey:attachedMediaMainImageDownscalingFactor:outputDimensions:settings:](v6, (uint64_t)v17, v77, v73, v26);
              [NSString stringWithFormat:@"NewPixelBuffer-%@", v17];
              buffera = (__CVBuffer *)objc_msgSend((id)objc_msgSend(*(id *)(v6 + 160), "objectForKeyedSubscript:", v17), "newPixelBuffer");
              if (buffera)
              {
                CFTypeRef v44 = CVBufferCopyAttachment(v23, v69, 0);
                if (v44)
                {
                  CFTypeRef v45 = CFAutorelease(v44);
                  if (v45) {
                    CVBufferSetAttachment(buffera, v69, v45, kCVAttachmentMode_ShouldPropagate);
                  }
                }
                CFTypeRef v46 = CVBufferCopyAttachment(v23, v68, 0);
                if (v46)
                {
                  CFTypeRef v47 = CFAutorelease(v46);
                  if (v47) {
                    CVBufferSetAttachment(buffera, v68, v47, kCVAttachmentMode_ShouldPropagate);
                  }
                }
                if (dword_1EB4C5430)
                {
                  os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                  os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
                  fig_log_call_emit_and_clean_up_after_send_and_compose();
                  uint64_t v6 = v82;
                }
                unsigned int v48 = BWCMSampleBufferCreateCopyWithNewPixelBuffer(v79, buffera, &v89, (CMSampleBufferRef *)&cf);
                if (v48)
                {
                  unsigned int v71 = v48;
                  CFDictionaryRef DictionaryRepresentation = 0;
                  goto LABEL_83;
                }
                id v49 = BWCMSampleBufferCopyReattachAndReturnMutableMetadata(cf);
                if ([v17 isEqualToString:@"Depth"])
                {
                  unsigned int v50 = FigDepthScaleBufferWithCrop(v23, buffera, v29, v31, v33, v35);
                  if (!v50)
                  {
                    v51 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithDictionary:", CMGetAttachment(v4, v65, 0));
                    FigCaptureMetadataUtilitiesNormalizeCropRect(v29, v31, v33, v35);
                    FigCaptureMetadataUtilitiesUpdateDepthDataMetadataForStillImageCropAndScale(v51, v52, v53, v54, v55, 1.0 / v55);
                    CMSetAttachment(v4, v65, v51, 1u);
                    CFDictionaryRef DictionaryRepresentation = 0;
                    goto LABEL_65;
                  }
                  unsigned int v71 = v50;
                  CFDictionaryRef DictionaryRepresentation = 0;
                  a2 = v76;
LABEL_83:
                  BWSampleBufferRemoveAttachedMedia(v4, (uint64_t)v17);
                }
                else
                {
                  v99.origin.CGFloat x = v29;
                  v99.origin.CGFloat y = v31;
                  v99.size.double width = v33;
                  v99.size.double height = v35;
                  CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v99);
                  OSStatus v56 = VTSessionSetProperty(*(VTSessionRef *)(v6 + 168), propertyKey, DictionaryRepresentation);
                  if (v56
                    || (OSStatus v56 = VTPixelTransferSessionTransferImage(*(VTPixelTransferSessionRef *)(v6 + 168), pixelBuffer, buffera)) != 0)
                  {
                    unsigned int v71 = v56;
                    CMAttachmentBearerRef v4 = v75;
                    a2 = v76;
                    goto LABEL_83;
                  }
LABEL_65:
                  if (objc_msgSend(v17, "isEqualToString:", 0x1EFA745E0, v60, v61))
                  {
                    FigCaptureMetadataUtilitiesUpdateMetadataForStillImageCrop(v49, Width | ((unint64_t)Height << 32), v77, v29, v31, v33, v35, v64, v63, v62, v15);
                    uint64_t v6 = v82;
                    FigCaptureMetadataUtilitiesUpdateMetadataForNewFinalDimensions((uint64_t)v49, Width | ((unint64_t)Height << 32), v77);
                  }
                  CMAttachmentBearerRef v4 = v75;
                  BWSampleBufferSetAttachedMedia(v75, (uint64_t)v17, (uint64_t)cf);
                  FigCaptureMetadataUtilitiesPreventFurtherCropping(v49, v57);
                  unsigned int v71 = 0;
                  a2 = v76;
                }
                CFRelease(buffera);
LABEL_69:
                if (cf) {
                  CFRelease(cf);
                }
                if (DictionaryRepresentation) {
                  CFRelease(DictionaryRepresentation);
                }
                if (v89) {
                  CFRelease(v89);
                }
                goto LABEL_75;
              }
            }
          }
          else
          {
            unsigned int v71 = -12780;
LABEL_30:
            uint64_t v8 = v83;
          }
          BWSampleBufferRemoveAttachedMedia(v4, (uint64_t)v17);
        }
        CFDictionaryRef DictionaryRepresentation = 0;
        goto LABEL_69;
      }
LABEL_75:
      ++v16;
    }
    while (v8 != v16);
    uint64_t v58 = [a2 countByEnumeratingWithState:&v91 objects:v95 count:16];
    uint64_t v8 = v58;
  }
  while (v58);
LABEL_87:
  -[BWStillImageScalerNode _removeUnmodifiedAttachedMedias:](v6, v4);
  return v71;
}

- (uint64_t)_shouldPurgeAllResourcesAfterProcessingSettings:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    result = [*(id *)(result + 16) memoryPool];
    if (result) {
      return !FigCaptureVideoDimensionsAreValid(*(void *)(v3 + 180))
    }
          && objc_msgSend((id)objc_msgSend(a2, "requestedSettings"), "smartStyle") == 0;
  }
  return result;
}

- (unint64_t)_outputDimensionsForAttachedMediaKey:(unint64_t)a3 attachedMediaMainImageDownscalingFactor:(unint64_t)a4 primaryMediaWidth:(unint64_t)a5 primaryMediaHeight:(unint64_t)a6 requestedWidth:(char)a7 requestedHeight:(int)a8 zoomWithoutUpscalingEnabled:(float)a9 normalizedZoomRect:(double)a10 optimizedEnhancedResolutionDepthCapture:(double)a11
{
  if (!a1) {
    goto LABEL_12;
  }
  uint64_t v20 = a1;
  if (a8 && [a2 isEqual:0x1EFA4EB60])
  {
    a4 = a6;
    a3 = a5;
  }
  if (a9 != 0.0)
  {
    unsigned int v23 = FigCaptureRoundFloatToMultipleOf(2, (float)(int)(float)((float)a3 / a9));
    a1 = FigCaptureRoundFloatToMultipleOf(2, (float)(int)(float)((float)a4 / a9));
    return v23 | (unint64_t)(a1 << 32);
  }
  a1 = [*(id *)(v20 + 152) objectForKeyedSubscript:a2];
  if (!a1)
  {
LABEL_12:
    unsigned int v23 = 0;
    return v23 | (unint64_t)(a1 << 32);
  }
  CGSize v28 = (CGSize)*MEMORY[0x1E4F1DB30];
  if (!CGSizeMakeWithDictionaryRepresentation((CFDictionaryRef)[*(id *)(v20 + 152) objectForKeyedSubscript:a2], &v28))
  {
    a1 = 0;
    goto LABEL_12;
  }
  if (a7)
  {
    v28.float width = a12 * v28.width;
    float width = v28.width;
    v28.float width = (double)(int)FigCaptureRoundFloatToMultipleOf(2, width);
    v28.float height = a13 * v28.height;
    float height = v28.height;
    double v26 = (double)(int)FigCaptureRoundFloatToMultipleOf(2, height);
  }
  else
  {
    double v26 = v28.height;
  }
  unsigned int v23 = (int)v28.width;
  a1 = (int)v26;
  return v23 | (unint64_t)(a1 << 32);
}

- (void)_rebuildBufferPoolForAttachedMediaKey:(uint64_t)a3 attachedMediaMainImageDownscalingFactor:(void *)a4 outputDimensions:(float)a5 settings:
{
  v28[1] = *MEMORY[0x1E4F143B8];
  if (a1 && (a5 != 0.0 || [*(id *)(a1 + 152) objectForKeyedSubscript:a2]))
  {
    id v9 = *(id *)(a1 + 160);
    if (!v9)
    {
      id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      *(void *)(a1 + 160) = v9;
    }
    uint64_t v10 = (void *)[v9 objectForKeyedSubscript:a2];
    if ((int)a3 == [v10 width] && objc_msgSend(v10, "height") == a3 >> 32)
    {
      uint64_t v11 = -[BWStillImageScalerNode _resolvedPoolCapacityForSettings:outputDimensions:](a1, a4, a3);
      if ([v10 capacity] != v11)
      {
        [v10 setCapacity:v11];
      }
    }
    else
    {
      BOOL v12 = NSString;
      uint64_t v13 = [(id)a1 name];
      id v14 = @"StillImageScaler";
      if (v13) {
        id v14 = (__CFString *)v13;
      }
      uint64_t v15 = [v12 stringWithFormat:@"%@-%@", v14, a2];
      uint64_t v16 = -[BWStillImageScalerNode _resolvedPoolCapacityForSettings:outputDimensions:](a1, a4, a3);
      uint64_t v17 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "mediaPropertiesForAttachedMediaKey:", a2), "resolvedVideoFormat");
      uint64_t v18 = [v17 pixelFormat];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = objc_alloc_init(BWVideoFormatRequirements);
        v28[0] = [NSNumber numberWithUnsignedInt:v19];
        -[BWVideoFormatRequirements setSupportedPixelFormats:](v20, "setSupportedPixelFormats:", [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1]);
        [(BWVideoFormatRequirements *)v20 setWidth:(int)a3];
        [(BWVideoFormatRequirements *)v20 setHeight:a3 >> 32];
        -[BWVideoFormatRequirements setSupportedCacheModes:](v20, "setSupportedCacheModes:", +[BWVideoFormatRequirements cacheModesForCacheProfile:](BWVideoFormatRequirements, "cacheModesForCacheProfile:", [v17 cacheMode]));
        [(BWVideoFormatRequirements *)v20 setWidthAlignment:16];
        [(BWVideoFormatRequirements *)v20 setHeightAlignment:16];
        -[BWVideoFormatRequirements setBytesPerRowAlignment:](v20, "setBytesPerRowAlignment:", [v17 bytesPerRowAlignment]);
        -[BWVideoFormatRequirements setPlaneAlignment:](v20, "setPlaneAlignment:", [v17 planeAlignment]);
        -[BWVideoFormatRequirements setMemoryPoolUseAllowed:](v20, "setMemoryPoolUseAllowed:", [v17 memoryPoolUseAllowed]);
        unint64_t v27 = v20;
        id v21 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1]);
        int v22 = [BWPixelBufferPool alloc];
        uint64_t v23 = [*(id *)(a1 + 16) memoryPool];
        LOBYTE(v26) = *(unsigned char *)(a1 + 176);
        uint64_t v24 = -[BWPixelBufferPool initWithVideoFormat:capacity:name:clientProvidesPool:memoryPool:providesBackPressure:reportSlowBackPressureAllocations:](v22, "initWithVideoFormat:capacity:name:clientProvidesPool:memoryPool:providesBackPressure:reportSlowBackPressureAllocations:", v21, v16, v15, 0, v23, v26);
        if (v24)
        {
          float v25 = (void *)v24;
          [*(id *)(a1 + 160) setObject:v24 forKeyedSubscript:a2];
        }
      }
    }
  }
}

- (uint64_t)_removeUnmodifiedAttachedMedias:(uint64_t)a1
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v3 = BWSampleBufferCopyDictionaryOfAttachedMedia(a2);
    id v4 = v3 ? v3 : (id)MEMORY[0x1E4F1CC08];
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithArray:", objc_msgSend(*(id *)(a1 + 144), "allKeys"));
    objc_msgSend(v5, "addObjectsFromArray:", objc_msgSend(*(id *)(a1 + 152), "allKeys"));
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithArray:", objc_msgSend(v4, "allKeys"));
    [v6 minusSet:v5];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if (([v11 isEqualToString:@"Depth"] & 1) == 0
            && ([v11 isEqualToString:0x1EFA743A0] & 1) == 0
            && ([v11 isEqualToString:0x1EFA747A0] & 1) == 0
            && ([v11 isEqualToString:0x1EFA74840] & 1) == 0
            && ([v11 isEqualToString:0x1EFA74780] & 1) == 0
            && ([v11 isEqualToString:0x1EFA747E0] & 1) == 0
            && ([v11 isEqualToString:0x1EFA74800] & 1) == 0)
          {
            BWSampleBufferRemoveAttachedMedia(a2, (uint64_t)v11);
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }
  }
  return 0;
}

@end