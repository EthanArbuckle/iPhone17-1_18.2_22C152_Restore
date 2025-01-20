@interface BWVideoDefringingNode
+ (void)initialize;
- (BWVideoDefringingNode)initWithSensorIDString:(id)a3 portType:(id)a4 propagateSynchronizedSlaveFrame:(BOOL)a5 isSlomo:(BOOL)a6;
- (id)nodeSubType;
- (id)nodeType;
- (uint64_t)_loadAndConfigureVideoDefringingBundle;
- (uint64_t)_processorOptions;
- (void)dealloc;
- (void)didReachEndOfDataForInput:(id)a3;
- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5;
- (void)prepareForCurrentConfigurationToBecomeLive;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
@end

@implementation BWVideoDefringingNode

+ (void)initialize
{
}

- (BWVideoDefringingNode)initWithSensorIDString:(id)a3 portType:(id)a4 propagateSynchronizedSlaveFrame:(BOOL)a5 isSlomo:(BOOL)a6
{
  BOOL v7 = a5;
  v18.receiver = self;
  v18.super_class = (Class)BWVideoDefringingNode;
  v10 = [(BWNode *)&v18 init];
  v11 = v10;
  if (v10)
  {
    v10->_isSlomo = a6;
    v10->_propagateSynchronizedSlaveFrame = v7;
    v12 = [[BWNodeInput alloc] initWithMediaType:1986618469 node:v10];
    v13 = objc_alloc_init(BWVideoFormatRequirements);
    [(BWVideoFormatRequirements *)v13 setSupportedPixelFormats:&unk_1EFB03230];
    [(BWNodeInputMediaConfiguration *)[(BWNodeInput *)v12 primaryMediaConfiguration] setFormatRequirements:v13];
    [(BWNodeInputMediaConfiguration *)[(BWNodeInput *)v12 primaryMediaConfiguration] setPassthroughMode:2];
    if (v7)
    {
      v14 = objc_alloc_init(BWNodeInputMediaConfiguration);
      [(BWNodeInputMediaConfiguration *)v14 setFormatRequirements:v13];
      [(BWNodeInputMediaConfiguration *)v14 setPassthroughMode:2];
      [(BWNodeInput *)v12 setMediaConfiguration:v14 forAttachedMediaKey:@"SynchronizedSlaveFrame"];
    }
    [(BWNode *)v11 addInput:v12];

    v15 = [[BWNodeOutput alloc] initWithMediaType:1986618469 node:v11];
    [(BWNodeOutput *)v15 setFormatRequirements:v13];
    [(BWNodeOutput *)v15 setPassthroughMode:2];
    [(BWNodeOutputMediaConfiguration *)[(BWNodeOutput *)v15 primaryMediaConfiguration] setFormatRequirements:v13];
    [(BWNodeOutputMediaConfiguration *)[(BWNodeOutput *)v15 primaryMediaConfiguration] setPassthroughMode:2];
    [(BWNodeOutputMediaConfiguration *)[(BWNodeOutput *)v15 primaryMediaConfiguration] setProvidesPixelBufferPool:1];
    if (v7)
    {
      v16 = objc_alloc_init(BWNodeOutputMediaConfiguration);
      [(BWNodeOutputMediaConfiguration *)v16 setFormatRequirements:v13];
      [(BWNodeOutputMediaConfiguration *)v16 setPassthroughMode:2];
      [(BWNodeOutputMediaConfiguration *)v16 setProvidesPixelBufferPool:1];
      [(BWNodeOutput *)v15 setMediaConfiguration:v16 forAttachedMediaKey:@"SynchronizedSlaveFrame"];
    }
    [(BWNode *)v11 addOutput:v15];

    v11->_cameraToDefringe = (NSString *)a4;
    v11->_sensorIDString = (NSString *)a3;
    v11->_portType = (NSString *)a4;
    v11->_limitedGMErrorLogger = [[BWLimitedGMErrorLogger alloc] initWithName:@"BWVideoDefringingNode" maxLoggingCount:10];
  }
  return v11;
}

- (void)dealloc
{
  outputFormatDescription = self->_outputFormatDescription;
  if (outputFormatDescription) {
    CFRelease(outputFormatDescription);
  }
  v4.receiver = self;
  v4.super_class = (Class)BWVideoDefringingNode;
  [(BWNode *)&v4 dealloc];
}

- (id)nodeType
{
  return @"Effect";
}

- (id)nodeSubType
{
  return @"VideoDefringing";
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5
{
  if (([a5 isEqualToString:@"PrimaryFormat"] & 1) != 0
    || [a5 isEqualToString:@"SynchronizedSlaveFrame"])
  {
    v9 = [(BWNodeOutput *)self->super._output mediaPropertiesForAttachedMediaKey:a5];
    int v10 = [a5 isEqualToString:@"PrimaryFormat"];
    if (v9)
    {
      if ((v10 & 1) == 0)
      {
        uint64_t v11 = [NSString stringWithFormat:@"%@ output %@ unexpectedly has mediaPropertiesForAttachedMediaKey %@ (provided media key was %@)", self, self->super._output, a5, a5];
        goto LABEL_13;
      }
    }
    else
    {
      if (v10)
      {
        uint64_t v11 = [NSString stringWithFormat:@"%@ output %@ has no media properties for the primary format (provided media key is %@)", self, self->super._output, a5, v12];
LABEL_13:
        objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v11 userInfo:0]);
      }
      v9 = objc_alloc_init(BWNodeOutputMediaProperties);
      [(BWNodeOutput *)self->super._output _setMediaProperties:v9 forAttachedMediaKey:a5];
    }
    [(BWNodeOutputMediaProperties *)v9 setResolvedFormat:a3];
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)BWVideoDefringingNode;
    [(BWNode *)&v13 didSelectFormat:a3 forInput:a4 forAttachedMediaKey:a5];
  }
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  v3.receiver = self;
  v3.super_class = (Class)BWVideoDefringingNode;
  [(BWNode *)&v3 prepareForCurrentConfigurationToBecomeLive];
  if (-[BWVideoDefringingNode _loadAndConfigureVideoDefringingBundle]((uint64_t)self))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
}

- (uint64_t)_loadAndConfigureVideoDefringingBundle
{
  uint64_t v1 = a1;
  if (!a1) {
    return v1;
  }
  uint64_t v14 = 0;
  uint64_t v2 = -[BWVideoDefringingNode _processorOptions](a1);
  objc_super v3 = (void *)[MEMORY[0x1E4F28B50] bundleWithPath:@"/System/Library/VideoProcessors/VideoDefringing.bundle"];
  if (!v3)
  {
    fig_log_get_emitter();
LABEL_13:
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
  objc_super v4 = v3;
  if (![v3 loadAndReturnError:&v14]) {
    return 4294954510;
  }
  v5 = (objc_class *)[v4 classNamed:@"FigVideoDefringingProcessor"];
  if (!v5)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
  uint64_t v6 = [[v5 alloc] initWithCommandQueue:0];
  *(void *)(v1 + 136) = v6;
  if (!v6)
  {
    fig_log_get_emitter();
    goto LABEL_13;
  }
  uint64_t v7 = objc_msgSend((id)objc_msgSend(*(id *)(v1 + 8), "videoFormat"), "width");
  uint64_t v8 = objc_msgSend((id)objc_msgSend(*(id *)(v1 + 8), "videoFormat"), "height");
  uint64_t v9 = objc_msgSend((id)objc_msgSend(*(id *)(v1 + 8), "videoFormat"), "width");
  uint64_t v10 = objc_msgSend((id)objc_msgSend(*(id *)(v1 + 8), "videoFormat"), "height");
  uint64_t v11 = *(void **)(v1 + 136);
  v13[0] = v7;
  v13[1] = v8;
  v13[2] = v9;
  v13[3] = v10;
  [v11 setDefringeConfig:v13];
  [*(id *)(v1 + 136) setOptions:v2];
  uint64_t v1 = [*(id *)(v1 + 136) prepareToProcess:*(unsigned char *)(v1 + 96) == 0];
  if (v1)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  return v1;
}

- (void)didReachEndOfDataForInput:(id)a3
{
  [(BWLimitedGMErrorLogger *)self->_limitedGMErrorLogger resetCurrentLoggingCounter];
  output = self->super._output;
  [(BWNodeOutput *)output markEndOfLiveOutput];
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  CMAttachmentBearerRef cf = 0;
  CMAttachmentBearerRef target = 0;
  CFTypeRef v21 = 0;
  CFTypeRef v22 = 0;
  if (BWSampleBufferIsMarkerBuffer(a3))
  {
    [(BWNodeOutput *)self->super._output emitSampleBuffer:a3];
    limitedGMErrorLogger = self->_limitedGMErrorLogger;
    [(BWLimitedGMErrorLogger *)limitedGMErrorLogger resetCurrentLoggingCounter];
    return;
  }
  uint64_t v7 = BWOverCaptureSampleBufferUnpackAndRetain(a3, 0, &target, &cf, 0, 0);
  if (v7)
  {
    uint64_t CopyWithNewPixelBuffer = v7;
    fig_log_get_emitter();
    FigDebugAssert3();
    uint64_t v12 = 0;
    v17 = 0;
    goto LABEL_25;
  }
  CFStringRef v8 = (const __CFString *)*MEMORY[0x1E4F53070];
  uint64_t v9 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  uint64_t v10 = (void *)CMGetAttachment(cf, v8, 0);
  uint64_t v11 = *MEMORY[0x1E4F54128];
  if (objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E4F54128]), "isEqualToString:", self->_cameraToDefringe))
  {
    uint64_t v12 = (__CVBuffer *)objc_msgSend((id)objc_msgSend(-[BWNodeOutput mediaPropertiesForAttachedMediaKey:](self->super._output, "mediaPropertiesForAttachedMediaKey:", @"SynchronizedSlaveFrame"), "livePixelBufferPool"), "newPixelBuffer");
    [(FigVideoDefringingProcessor *)self->_videoDefringingProcessor setInputSampleBuffer:target];
    [(FigVideoDefringingProcessor *)self->_videoDefringingProcessor setOutputPixelBuffer:v12];
    uint64_t v13 = [(FigVideoDefringingProcessor *)self->_videoDefringingProcessor process];
    if (!v13 && self->_videoDefringingProcessor)
    {
      uint64_t CopyWithNewPixelBuffer = BWCMSampleBufferCreateCopyWithNewPixelBuffer((opaqueCMSampleBuffer *)target, v12, (CFTypeRef *)&self->_outputFormatDescription, (CMSampleBufferRef *)&v22);
      ImageBuffer = CMSampleBufferGetImageBuffer((CMSampleBufferRef)target);
      CVBufferPropagateAttachments(ImageBuffer, v12);
      goto LABEL_15;
    }
    [(BWLimitedGMErrorLogger *)self->_limitedGMErrorLogger logErrorNumber:v13 errorString:@"defringed Wide Failed"];
    CFTypeRef v14 = CFRetain(target);
LABEL_11:
    uint64_t CopyWithNewPixelBuffer = 0;
    CFTypeRef v22 = v14;
    goto LABEL_15;
  }
  if (target)
  {
    CFTypeRef v14 = CFRetain(target);
    uint64_t v12 = 0;
    goto LABEL_11;
  }
  uint64_t v12 = 0;
  uint64_t CopyWithNewPixelBuffer = 0;
LABEL_15:
  if (objc_msgSend((id)objc_msgSend(v10, "objectForKeyedSubscript:", v11), "isEqualToString:", self->_cameraToDefringe))
  {
    v17 = [(BWPixelBufferPool *)[(BWNodeOutput *)self->super._output livePixelBufferPool] newPixelBuffer];
    [(FigVideoDefringingProcessor *)self->_videoDefringingProcessor setInputSampleBuffer:cf];
    [(FigVideoDefringingProcessor *)self->_videoDefringingProcessor setOutputPixelBuffer:v17];
    uint64_t v18 = [(FigVideoDefringingProcessor *)self->_videoDefringingProcessor process];
    if (v18 || !self->_videoDefringingProcessor)
    {
      [(BWLimitedGMErrorLogger *)self->_limitedGMErrorLogger logErrorNumber:v18 errorString:@"defringed Narrow Failed"];
      CFTypeRef v21 = CFRetain(cf);
    }
    else
    {
      uint64_t CopyWithNewPixelBuffer = BWCMSampleBufferCreateCopyWithNewPixelBuffer((opaqueCMSampleBuffer *)cf, v17, (CFTypeRef *)&self->_outputFormatDescription, (CMSampleBufferRef *)&v21);
      v19 = CMSampleBufferGetImageBuffer((CMSampleBufferRef)cf);
      CVBufferPropagateAttachments(v19, v17);
    }
  }
  else
  {
    v17 = 0;
    if (cf) {
      CFTypeRef v21 = CFRetain(cf);
    }
  }
  if (v22) {
    BWSampleBufferSetAttachedMedia(v21, @"SynchronizedSlaveFrame", (uint64_t)v22);
  }
  if (!CopyWithNewPixelBuffer)
  {
    [(BWNodeOutput *)self->super._output emitSampleBuffer:v21];
    goto LABEL_27;
  }
LABEL_25:
  CMSampleBufferGetPresentationTimeStamp(&v20, a3);
  [(BWNodeOutput *)self->super._output emitDroppedSample:+[BWDroppedSample newDroppedSampleWithReason:0x1EFA67FC0 pts:&v20]];
  [(BWLimitedGMErrorLogger *)self->_limitedGMErrorLogger logErrorNumber:CopyWithNewPixelBuffer errorString:@"Error : Emitting dropped buffer"];
LABEL_27:
  if (target) {
    CFRelease(target);
  }
  if (cf) {
    CFRelease(cf);
  }
  if (v22) {
    CFRelease(v22);
  }
  if (v21) {
    CFRelease(v21);
  }
  if (v12) {
    CFRelease(v12);
  }
  if (v17) {
    CFRelease(v17);
  }
}

- (uint64_t)_processorOptions
{
  v3[1] = *MEMORY[0x1E4F143B8];
  if (result)
  {
    id v1 = [+[FigCaptureCameraParameters sharedInstance] chromaticDefringingParametersForPortType:*(void *)(result + 112) sensorIDString:*(void *)(result + 104)];
    if (v1)
    {
      uint64_t v2 = *MEMORY[0x1E4F535B0];
      v3[0] = v1;
      return [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:&v2 count:1];
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      return 0;
    }
  }
  return result;
}

@end