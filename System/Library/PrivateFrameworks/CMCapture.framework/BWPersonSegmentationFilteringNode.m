@interface BWPersonSegmentationFilteringNode
+ (void)initialize;
- (BOOL)alignsMaskWithPrimaryCaptureRect;
- (BWPersonSegmentationFilteringNode)initWithGPUPriority:(int)a3 frameRateUpsamplingEnabled:(BOOL)a4 metalCommandQueue:(id)a5;
- (id)nodeSubType;
- (id)nodeType;
- (uint64_t)_loadAndConfigureSegmentationMaskFilter;
- (unsigned)inputOrientationRelativeToSensor;
- (void)dealloc;
- (void)didReachEndOfDataForInput:(id)a3;
- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5;
- (void)prepareForCurrentConfigurationToBecomeLive;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
- (void)setAlignsMaskWithPrimaryCaptureRect:(BOOL)a3;
- (void)setInputOrientationRelativeToSensor:(unsigned int)a3;
@end

@implementation BWPersonSegmentationFilteringNode

- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5
{
  v23[1] = *MEMORY[0x1E4F143B8];
  if ([a5 isEqualToString:@"PrimaryFormat"])
  {
    output = self->super._output;
    [(BWNodeOutput *)output setFormat:a3];
  }
  else if ([a5 isEqualToString:0x1EFA74460])
  {
    id v10 = [(BWNodeOutput *)self->super._output mediaConfigurationForAttachedMediaKey:a5];
    v11 = objc_alloc_init(BWVideoFormatRequirements);
    v23[0] = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a3, "pixelFormat"));
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v11, "setSupportedPixelFormats:", [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1]);
    unsigned int v12 = [a3 width];
    unsigned int v13 = [a3 height];
    if (self->_alignsMaskWithPrimaryCaptureRect)
    {
      unsigned int v14 = [(BWVideoFormat *)[(BWNodeOutputMediaProperties *)[(BWNodeOutput *)self->super._output primaryMediaProperties] resolvedVideoFormat] width];
      unsigned int v15 = [(BWVideoFormat *)[(BWNodeOutputMediaProperties *)[(BWNodeOutput *)self->super._output primaryMediaProperties] resolvedVideoFormat] height];
      unsigned int inputOrientationRelativeToSensor = self->_inputOrientationRelativeToSensor;
      if (inputOrientationRelativeToSensor == 270) {
        unsigned int v17 = v15;
      }
      else {
        unsigned int v17 = v14;
      }
      if (inputOrientationRelativeToSensor == 270) {
        unsigned int v18 = v14;
      }
      else {
        unsigned int v18 = v15;
      }
      BOOL v19 = inputOrientationRelativeToSensor == 90;
      if (inputOrientationRelativeToSensor == 90) {
        unsigned int v20 = v15;
      }
      else {
        unsigned int v20 = v17;
      }
      if (v19) {
        unsigned int v21 = v14;
      }
      else {
        unsigned int v21 = v18;
      }
      unsigned int v12 = vcvtas_u32_f32((float)((float)v13 * (float)v20) / (float)v21);
    }
    [(BWVideoFormatRequirements *)v11 setWidth:v12];
    [(BWVideoFormatRequirements *)v11 setHeight:v13];
    [v10 setFormatRequirements:v11];
  }
  else if (([a5 isEqualToString:0x1EFA6A460] & 1) == 0 {
         && ([a5 isEqualToString:0x1EFA6A440] & 1) == 0)
  }
  {
    v22.receiver = self;
    v22.super_class = (Class)BWPersonSegmentationFilteringNode;
    [(BWNode *)&v22 didSelectFormat:a3 forInput:a4 forAttachedMediaKey:a5];
  }
}

- (id)nodeType
{
  return @"Effect";
}

- (void)setInputOrientationRelativeToSensor:(unsigned int)a3
{
  self->_unsigned int inputOrientationRelativeToSensor = a3;
}

- (void)setAlignsMaskWithPrimaryCaptureRect:(BOOL)a3
{
  self->_alignsMaskWithPrimaryCaptureRect = a3;
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  -[BWPersonSegmentationFilteringNode _loadAndConfigureSegmentationMaskFilter]((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)BWPersonSegmentationFilteringNode;
  [(BWNode *)&v3 prepareForCurrentConfigurationToBecomeLive];
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  BOOL IsMarkerBuffer = BWSampleBufferIsMarkerBuffer(a3);
  v7 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (IsMarkerBuffer)
  {
    [(BWNodeOutput *)self->super._output emitSampleBuffer:a3];
    goto LABEL_85;
  }
  if (*MEMORY[0x1E4F1EBA8] == 1)
  {
    CMSampleBufferGetPresentationTimeStamp(&v50, a3);
    time.origin = *(CGPoint *)&v50.value;
    *(void *)&time.size.double width = v50.epoch;
    CMTimeGetSeconds((CMTime *)&time);
    kdebug_trace();
  }
  [(FigSemanticStyleFilteringV1 *)self->_segmentationMaskFilter finishProcessing];
  AttachedMedia = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a3, 0x1EFA6A440);
  if (AttachedMedia) {
    CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(AttachedMedia);
  }
  else {
    CVImageBufferRef ImageBuffer = 0;
  }
  id v10 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a3, 0x1EFA74460);
  v11 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a3, 0x1EFA6A460);
  if (v11)
  {
    CVImageBufferRef v12 = CMSampleBufferGetImageBuffer(v11);
    if (v10)
    {
LABEL_10:
      CVImageBufferRef v13 = CMSampleBufferGetImageBuffer(v10);
      goto LABEL_13;
    }
  }
  else
  {
    CVImageBufferRef v12 = 0;
    if (v10) {
      goto LABEL_10;
    }
  }
  CVImageBufferRef v13 = 0;
LABEL_13:
  cf = a3;
  AttachedInferenceResult = (void *)BWInferenceGetAttachedInferenceResult(a3, 105);
  int v15 = objc_msgSend((id)objc_msgSend(AttachedInferenceResult, "preventionReason"), "isEqualToString:", 0x1EFA69FC0);
  int v16 = objc_msgSend((id)objc_msgSend(AttachedInferenceResult, "preventionReason"), "isEqualToString:", 0x1EFA6A040);
  if (AttachedInferenceResult) {
    BOOL v17 = [AttachedInferenceResult preventionReason] == 0;
  }
  else {
    BOOL v17 = 0;
  }
  if (self->_inferencePreviouslyAttached)
  {
    BOOL v18 = 1;
  }
  else
  {
    BOOL v18 = AttachedInferenceResult != 0;
    self->_inferencePreviouslyAttached = v18;
  }
  if (v18) {
    int v19 = v15;
  }
  else {
    int v19 = 1;
  }
  if (((v19 | v16 | v17) & 1) == 0)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    FigSignalErrorAt();
    CFTypeRef v20 = 0;
    goto LABEL_90;
  }
  CFTypeRef v20 = CFRetain(cf);
  if (!v20)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
LABEL_90:
    unsigned int v21 = 0;
    v7 = (_DWORD *)MEMORY[0x1E4F1EBA8];
LABEL_81:
    CMSampleBufferGetPresentationTimeStamp(&v47, cf);
    [(BWNodeOutput *)self->super._output emitDroppedSample:+[BWDroppedSample newDroppedSampleWithReason:0x1EFA67F40 pts:&v47]];
    if (!v20) {
      goto LABEL_83;
    }
    goto LABEL_82;
  }
  if (v17)
  {
    if (!v13 || !ImageBuffer || !self->_segmentationMaskFilter || !v12)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      unsigned int v21 = 0;
      goto LABEL_95;
    }
    unsigned int v21 = (__CVBuffer *)objc_msgSend((id)objc_msgSend(-[BWNodeOutput mediaPropertiesForAttachedMediaKey:](self->super._output, "mediaPropertiesForAttachedMediaKey:", 0x1EFA74460), "livePixelBufferPool"), "newPixelBuffer");
    if (v21)
    {
      time.origin.double x = 0.0;
      time.origin.double y = 0.0;
      __asm { FMOV            V0.2D, #1.0 }
      time.size = _Q0;
      if (self->_alignsMaskWithPrimaryCaptureRect)
      {
        CFDictionaryRef v27 = (const __CFDictionary *)CMGetAttachment(cf, (CFStringRef)*MEMORY[0x1E4F530D0], 0);
        if (v27) {
          CGRectMakeWithDictionaryRepresentation(v27, &time);
        }
      }
      [(FigSemanticStyleFilteringV1 *)self->_segmentationMaskFilter setOpticalFlowDisplacementPixelBuffer:v12];
      [(FigSemanticStyleFilteringV1 *)self->_segmentationMaskFilter setInputImagePixelBuffer:ImageBuffer];
      [(FigSemanticStyleFilteringV1 *)self->_segmentationMaskFilter setInputMaskPixelBuffer:v13];
      double x = 0.0;
      double width = 1.0;
      if (self->_alignsMaskWithPrimaryCaptureRect)
      {
        unsigned int inputOrientationRelativeToSensor = self->_inputOrientationRelativeToSensor;
        if (inputOrientationRelativeToSensor == 270)
        {
          double x = time.origin.x;
          double y = time.origin.y;
          double width = time.size.width;
          double height = time.size.height;
        }
        else
        {
          double height = 1.0;
          double y = 0.0;
          if (inputOrientationRelativeToSensor == 90)
          {
            double x = time.origin.x;
            double width = time.size.width;
            double height = time.size.height;
            double y = 1.0 - (time.origin.y + time.size.height);
          }
        }
      }
      else
      {
        double height = 1.0;
        double y = 0.0;
      }
      -[FigSemanticStyleFilteringV1 setDestinationRectangleInOutputMaskPixelBuffer:](self->_segmentationMaskFilter, "setDestinationRectangleInOutputMaskPixelBuffer:", y, x, height, width);
      [(FigSemanticStyleFilteringV1 *)self->_segmentationMaskFilter setOutputMaskPixelBuffer:v21];
      if (![(FigSemanticStyleFilteringV1 *)self->_segmentationMaskFilter process])
      {
        CFTypeRef v48 = 0;
        int CopyWithNewPixelBuffer = BWCMSampleBufferCreateCopyWithNewPixelBuffer(v10, v21, (CFTypeRef *)&self->_filteredMaskFormatDescription, (CMSampleBufferRef *)&v48);
        v7 = (_DWORD *)MEMORY[0x1E4F1EBA8];
        if (!v48) {
          goto LABEL_96;
        }
        CMSetAttachment(v48, @"PersonSegmentationMaskToMainImageRotationDegrees", (CFTypeRef)[NSNumber numberWithUnsignedInt:self->_inputOrientationRelativeToSensor], 1u);
        BWSampleBufferSetAttachedMedia(v20, 0x1EFA74460, (uint64_t)v48);
        if (v48) {
          CFRelease(v48);
        }
        p_cachedFilteredMaskSampleBuffer = &self->_cachedFilteredMaskSampleBuffer;
        cachedFilteredMaskSampleBuffer = self->_cachedFilteredMaskSampleBuffer;
        if (cachedFilteredMaskSampleBuffer)
        {
          CFRelease(cachedFilteredMaskSampleBuffer);
          *p_cachedFilteredMaskSampleBuffer = 0;
        }
        BWCMSampleBufferCreateCopyIncludingMetadata((CMSampleBufferRef)v48, &self->_cachedFilteredMaskSampleBuffer);
        if (!*p_cachedFilteredMaskSampleBuffer)
        {
LABEL_96:
          fig_log_get_emitter();
          FigDebugAssert3();
          goto LABEL_80;
        }
LABEL_79:
        BWSampleBufferRemoveAttachedMedia(v20, 0x1EFA6A460);
        BWSampleBufferRemoveAttachedMedia(v20, 0x1EFA6A440);
        [(BWNodeOutput *)self->super._output emitSampleBuffer:v20];
        goto LABEL_80;
      }
      goto LABEL_95;
    }
    goto LABEL_94;
  }
  if (!v15)
  {
    if (v16)
    {
      v40 = self->_cachedFilteredMaskSampleBuffer;
      v7 = (_DWORD *)MEMORY[0x1E4F1EBA8];
      if (v40)
      {
        CFRelease(v40);
        unsigned int v21 = 0;
        int CopyWithNewPixelBuffer = 0;
        self->_cachedFilteredMaskSampleBuffer = 0;
      }
      else
      {
        unsigned int v21 = 0;
        int CopyWithNewPixelBuffer = 0;
      }
    }
    else
    {
      unsigned int v21 = 0;
      int CopyWithNewPixelBuffer = 0;
      v7 = (_DWORD *)MEMORY[0x1E4F1EBA8];
    }
    goto LABEL_79;
  }
  if (self->_frameRateUpsamplingEnabled)
  {
    unsigned int v21 = (__CVBuffer *)objc_msgSend((id)objc_msgSend(-[BWNodeOutput mediaPropertiesForAttachedMediaKey:](self->super._output, "mediaPropertiesForAttachedMediaKey:", 0x1EFA74460), "livePixelBufferPool"), "newPixelBuffer");
    if (v21 && v12)
    {
      time.origin.double x = 0.0;
      time.origin.double y = 0.0;
      __asm { FMOV            V0.2D, #1.0 }
      time.size = _Q0;
      if (self->_alignsMaskWithPrimaryCaptureRect)
      {
        CFDictionaryRef v34 = (const __CFDictionary *)CMGetAttachment(cf, (CFStringRef)*MEMORY[0x1E4F530D0], 0);
        if (v34) {
          CGRectMakeWithDictionaryRepresentation(v34, &time);
        }
      }
      [(FigSemanticStyleFilteringV1 *)self->_segmentationMaskFilter setInputImagePixelBuffer:CMSampleBufferGetImageBuffer(cf)];
      if ([(FigSemanticStyleFilteringV1 *)self->_segmentationMaskFilter inputImagePixelBuffer])
      {
        [(FigSemanticStyleFilteringV1 *)self->_segmentationMaskFilter setInputMaskPixelBuffer:0];
        -[FigSemanticStyleFilteringV1 setInputImageCropRectangle:](self->_segmentationMaskFilter, "setInputImageCropRectangle:", time.origin.x, time.origin.y, time.size.width, time.size.height);
        [(FigSemanticStyleFilteringV1 *)self->_segmentationMaskFilter setRotationDegreesToApplyToInputImage:-self->_inputOrientationRelativeToSensor];
        double v35 = 1.0;
        double v36 = 0.0;
        if (self->_alignsMaskWithPrimaryCaptureRect)
        {
          unsigned int v37 = self->_inputOrientationRelativeToSensor;
          if (v37 == 270)
          {
            double v38 = time.origin.x;
            double v36 = time.origin.y;
            double v39 = time.size.width;
            double v35 = time.size.height;
          }
          else
          {
            double v38 = 0.0;
            double v39 = 1.0;
            if (v37 == 90)
            {
              double v38 = time.origin.x;
              double v39 = time.size.width;
              double v35 = time.size.height;
              double v36 = 1.0 - (time.origin.y + time.size.height);
            }
          }
        }
        else
        {
          double v38 = 0.0;
          double v39 = 1.0;
        }
        -[FigSemanticStyleFilteringV1 setDestinationRectangleInOutputMaskPixelBuffer:](self->_segmentationMaskFilter, "setDestinationRectangleInOutputMaskPixelBuffer:", v36, v38, v35, v39);
        [(FigSemanticStyleFilteringV1 *)self->_segmentationMaskFilter setOutputMaskPixelBuffer:v21];
        [(FigSemanticStyleFilteringV1 *)self->_segmentationMaskFilter setOpticalFlowDisplacementPixelBuffer:v12];
        if (![(FigSemanticStyleFilteringV1 *)self->_segmentationMaskFilter process])
        {
          CFTypeRef v48 = 0;
          v45 = &self->_cachedFilteredMaskSampleBuffer;
          int CopyWithNewPixelBuffer = BWCMSampleBufferCreateCopyWithNewPixelBuffer(self->_cachedFilteredMaskSampleBuffer, v21, (CFTypeRef *)&self->_filteredMaskFormatDescription, (CMSampleBufferRef *)&v48);
          v7 = (_DWORD *)MEMORY[0x1E4F1EBA8];
          if (!v48) {
            goto LABEL_96;
          }
          CMSetAttachment(v48, @"PersonSegmentationMaskToMainImageRotationDegrees", (CFTypeRef)[NSNumber numberWithUnsignedInt:self->_inputOrientationRelativeToSensor], 1u);
          BWSampleBufferSetAttachedMedia(v20, 0x1EFA74460, (uint64_t)v48);
          if (v48) {
            CFRelease(v48);
          }
          if (*v45)
          {
            CFRelease(*v45);
            *v45 = 0;
          }
          BWCMSampleBufferCreateCopyIncludingMetadata((CMSampleBufferRef)v48, &self->_cachedFilteredMaskSampleBuffer);
          if (!*v45) {
            goto LABEL_96;
          }
          goto LABEL_79;
        }
LABEL_95:
        int CopyWithNewPixelBuffer = 0;
        v7 = (_DWORD *)MEMORY[0x1E4F1EBA8];
        goto LABEL_80;
      }
    }
LABEL_94:
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_95;
  }
  v44 = self->_cachedFilteredMaskSampleBuffer;
  if (!v44)
  {
    unsigned int v21 = 0;
    int CopyWithNewPixelBuffer = 0;
    v7 = (_DWORD *)MEMORY[0x1E4F1EBA8];
    goto LABEL_79;
  }
  time.origin.double x = 0.0;
  BWCMSampleBufferCreateCopyIncludingMetadata(v44, (CMSampleBufferRef *)&time);
  v7 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*(void *)&time.origin.x)
  {
    BWSampleBufferSetAttachedMedia(v20, 0x1EFA74460, *(uint64_t *)&time.origin.x);
    if (*(void *)&time.origin.x) {
      CFRelease(*(CFTypeRef *)&time.origin.x);
    }
    unsigned int v21 = 0;
    int CopyWithNewPixelBuffer = 0;
    goto LABEL_79;
  }
  fig_log_get_emitter();
  FigDebugAssert3();
  unsigned int v21 = 0;
  int CopyWithNewPixelBuffer = 0;
LABEL_80:
  if (CopyWithNewPixelBuffer) {
    goto LABEL_81;
  }
LABEL_82:
  CFRelease(v20);
LABEL_83:
  if (v21) {
    CFRelease(v21);
  }
LABEL_85:
  if (*v7 == 1) {
    kdebug_trace();
  }
}

- (BWPersonSegmentationFilteringNode)initWithGPUPriority:(int)a3 frameRateUpsamplingEnabled:(BOOL)a4 metalCommandQueue:(id)a5
{
  v19.receiver = self;
  v19.super_class = (Class)BWPersonSegmentationFilteringNode;
  v8 = [(BWNode *)&v19 init];
  v9 = v8;
  if (v8)
  {
    v8->_gpuPrioritdouble y = a3;
    v8->_frameRateUpsamplingEnabled = a4;
    v8->_commandQueue = (MTLCommandQueue *)a5;
    id v10 = objc_alloc_init(BWVideoFormatRequirements);
    v11 = [[BWNodeInput alloc] initWithMediaType:1986618469 node:v9];
    [(BWNodeInputMediaConfiguration *)[(BWNodeInput *)v11 primaryMediaConfiguration] setFormatRequirements:v10];
    [(BWNodeInputMediaConfiguration *)[(BWNodeInput *)v11 primaryMediaConfiguration] setDelayedBufferCount:1];
    [(BWNodeInputMediaConfiguration *)[(BWNodeInput *)v11 primaryMediaConfiguration] setPassthroughMode:1];
    CVImageBufferRef v12 = objc_alloc_init(BWNodeInputMediaConfiguration);
    [(BWNodeInputMediaConfiguration *)v12 setFormatRequirements:v10];
    [(BWNodeInputMediaConfiguration *)v12 setDelayedBufferCount:1];
    [(BWNodeInputMediaConfiguration *)v12 setPassthroughMode:0];
    [(BWNodeInput *)v11 setMediaConfiguration:v12 forAttachedMediaKey:0x1EFA74460];
    CVImageBufferRef v13 = objc_alloc_init(BWNodeInputMediaConfiguration);
    [(BWNodeInputMediaConfiguration *)v13 setFormatRequirements:v10];
    [(BWNodeInputMediaConfiguration *)v13 setDelayedBufferCount:1];
    [(BWNodeInputMediaConfiguration *)v13 setPassthroughMode:1];
    [(BWNodeInput *)v11 setMediaConfiguration:v13 forAttachedMediaKey:0x1EFA744A0];
    unsigned int v14 = objc_alloc_init(BWNodeInputMediaConfiguration);
    [(BWNodeInputMediaConfiguration *)v14 setFormatRequirements:v10];
    [(BWNodeInputMediaConfiguration *)v14 setDelayedBufferCount:1];
    [(BWNodeInputMediaConfiguration *)v14 setPassthroughMode:0];
    [(BWNodeInput *)v11 setMediaConfiguration:v14 forAttachedMediaKey:0x1EFA6A460];
    int v15 = objc_alloc_init(BWNodeInputMediaConfiguration);
    [(BWNodeInputMediaConfiguration *)v15 setFormatRequirements:v10];
    [(BWNodeInputMediaConfiguration *)v15 setDelayedBufferCount:1];
    [(BWNodeInputMediaConfiguration *)v15 setPassthroughMode:0];
    [(BWNodeInput *)v11 setMediaConfiguration:v15 forAttachedMediaKey:0x1EFA6A440];
    [(BWNode *)v9 addInput:v11];

    int v16 = [[BWNodeOutput alloc] initWithMediaType:1986618469 node:v9];
    [(BWNodeOutputMediaConfiguration *)[(BWNodeOutput *)v16 primaryMediaConfiguration] setFormatRequirements:v10];
    [(BWNodeOutputMediaConfiguration *)[(BWNodeOutput *)v16 primaryMediaConfiguration] setPassthroughMode:1];
    BOOL v17 = objc_alloc_init(BWNodeOutputMediaConfiguration);
    [(BWNodeOutputMediaConfiguration *)v17 setFormatRequirements:v10];
    [(BWNodeOutputMediaConfiguration *)v17 setPassthroughMode:0];
    [(BWNodeOutputMediaConfiguration *)v17 setProvidesPixelBufferPool:1];
    [(BWNodeOutput *)v16 setMediaConfiguration:v17 forAttachedMediaKey:0x1EFA74460];
    [(BWNode *)v9 addOutput:v16];
  }
  return v9;
}

- (uint64_t)_loadAndConfigureSegmentationMaskFilter
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v12 = 0;
    if (*(void *)(result + 112)) {
      return 0;
    }
    uint64_t v2 = [NSString stringWithFormat:@"%@/%@V%d.bundle", @"/System/Library/VideoProcessors", @"SemanticStyle", 1, v12];
    objc_super v3 = (void *)[MEMORY[0x1E4F28B50] bundleWithPath:v2];
    if (v3)
    {
      v4 = v3;
      if (![v3 loadAndReturnError:&v12]) {
        return 4294954510;
      }
      uint64_t v5 = [v4 classNamed:@"FigSemanticStyleFilteringV1"];
      if (v5)
      {
        v6 = (objc_class *)v5;
        v7 = (void *)[MEMORY[0x1E4F55F60] metalDevice];
        if (v7)
        {
          id v8 = *(id *)(v1 + 136);
          if (v8 || (id v8 = (id)[v7 newCommandQueue]) != 0)
          {
            int v9 = *(_DWORD *)(v1 + 96);
            if (v9)
            {
              if (v9 != 1)
              {
LABEL_14:
                v11 = (void *)[[v6 alloc] initWithCommandQueue:v8];
                *(void *)(v1 + 112) = v11;
                [v11 setMaskInterpolationEnabled:*(unsigned __int8 *)(v1 + 100)];
                [*(id *)(v1 + 112) prepareToProcess:0];
                return 0;
              }
              uint64_t v10 = 1;
            }
            else
            {
              uint64_t v10 = 4;
            }
            [v8 setGPUPriority:v10];
            goto LABEL_14;
          }
        }
      }
      fig_log_get_emitter();
    }
    else
    {
      fig_log_get_emitter();
    }
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
  return result;
}

+ (void)initialize
{
}

- (void)dealloc
{
  cachedFilteredMaskSampleBuffer = self->_cachedFilteredMaskSampleBuffer;
  if (cachedFilteredMaskSampleBuffer)
  {
    CFRelease(cachedFilteredMaskSampleBuffer);
    self->_cachedFilteredMaskSampleBuffer = 0;
  }
  filteredMaskFormatDescription = self->_filteredMaskFormatDescription;
  if (filteredMaskFormatDescription) {
    CFRelease(filteredMaskFormatDescription);
  }

  v5.receiver = self;
  v5.super_class = (Class)BWPersonSegmentationFilteringNode;
  [(BWNode *)&v5 dealloc];
}

- (id)nodeSubType
{
  return @"PersonSegmentationFiltering";
}

- (void)didReachEndOfDataForInput:(id)a3
{
  [(FigSemanticStyleFilteringV1 *)self->_segmentationMaskFilter purgeResources];

  self->_segmentationMaskFilter = 0;
  cachedFilteredMaskSampleBuffer = self->_cachedFilteredMaskSampleBuffer;
  if (cachedFilteredMaskSampleBuffer)
  {
    CFRelease(cachedFilteredMaskSampleBuffer);
    self->_cachedFilteredMaskSampleBuffer = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)BWPersonSegmentationFilteringNode;
  [(BWNode *)&v6 didReachEndOfDataForInput:a3];
}

- (unsigned)inputOrientationRelativeToSensor
{
  return self->_inputOrientationRelativeToSensor;
}

- (BOOL)alignsMaskWithPrimaryCaptureRect
{
  return self->_alignsMaskWithPrimaryCaptureRect;
}

@end