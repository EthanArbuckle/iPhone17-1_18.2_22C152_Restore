@interface BWNoiseReducerNode
+ (void)initialize;
- (BOOL)quadraHighResStillImageCaptureEnabled;
- (BWNoiseReducerNode)initWithCameraTuningDictionary:(id)a3 sensorIDDictionary:(id)a4;
- (BWVideoFormatRequirements)_outputRequirementsForInputFormat:(uint64_t)a1;
- (CMSampleBufferRef)_newQuadraResampledSampleBufferFromSampleBuffer:(__CVBuffer *)a3 outputPixelBuffer:;
- (id)nodeSubType;
- (id)nodeType;
- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5;
- (void)dealloc;
- (void)didReachEndOfDataForInput:(id)a3;
- (void)didSelectFormat:(id)a3 forInput:(id)a4;
- (void)prepareForCurrentConfigurationToBecomeLive;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
- (void)setQuadraHighResStillImageCaptureEnabled:(BOOL)a3;
@end

@implementation BWNoiseReducerNode

+ (void)initialize
{
}

- (BWNoiseReducerNode)initWithCameraTuningDictionary:(id)a3 sensorIDDictionary:(id)a4
{
  v15.receiver = self;
  v15.super_class = (Class)BWNoiseReducerNode;
  v6 = [(BWNode *)&v15 init];
  if (v6)
  {
    uint64_t v7 = [a4 objectForKeyedSubscript:@"ChromaNoiseReduction"];
    id v8 = objc_alloc(MEMORY[0x1E4F1CA60]);
    v9 = (NSDictionary *)objc_msgSend(v8, "initWithObjectsAndKeys:", objc_msgSend(NSNumber, "numberWithInt:", 1), @"Synchronization", 0);
    v10 = v9;
    if (v7) {
      [(NSDictionary *)v9 setObject:v7 forKeyedSubscript:@"ChromaNoiseReductionTuningParameters"];
    }
    v6->_noiseReductionOptions = v10;
    v6->_cameraTuningOptions = (NSDictionary *)a3;
    v6->_contextSynchronization = 3;
    *(_WORD *)&v6->_threaded = 1;
    v6->_gpuPriority = 0;
    v6->_useInPlaceAlgorithm = !noiseReductionRequiresOutputSampleBuffer((const __CFDictionary *)a3);
    v11 = [[BWNodeInput alloc] initWithMediaType:1986618469 node:v6];
    v12 = objc_alloc_init(BWVideoFormatRequirements);
    [(BWVideoFormatRequirements *)v12 setSupportedPixelFormats:&unk_1EFB03578];
    [(BWNodeInput *)v11 setFormatRequirements:v12];
    [(BWNodeInput *)v11 setPassthroughMode:v6->_useInPlaceAlgorithm];

    [(BWNode *)v6 addInput:v11];
    v13 = [[BWNodeOutput alloc] initWithMediaType:1986618469 node:v6];
    -[BWNodeOutput setFormatRequirements:](v13, "setFormatRequirements:", -[BWNoiseReducerNode _outputRequirementsForInputFormat:]((uint64_t)v6, 0));
    [(BWNodeOutput *)v13 setPassthroughMode:v6->_useInPlaceAlgorithm];
    [(BWNode *)v6 addOutput:v13];
  }
  return v6;
}

- (BWVideoFormatRequirements)_outputRequirementsForInputFormat:(uint64_t)a1
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  v3 = objc_alloc_init(BWVideoFormatRequirements);
  v4 = v3;
  if (a2)
  {
    v8[0] = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a2, "pixelFormat"));
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v4, "setSupportedPixelFormats:", [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1]);
    -[BWVideoFormatRequirements setWidth:](v4, "setWidth:", [a2 width]);
    -[BWVideoFormatRequirements setHeight:](v4, "setHeight:", [a2 height]);
  }
  else
  {
    [(BWVideoFormatRequirements *)v3 setSupportedPixelFormats:&unk_1EFB03590];
  }
  [(BWVideoFormatRequirements *)v4 setSupportedCacheModes:+[BWVideoFormatRequirements cacheModesForOptimizedHWAccess]];
  if ([a2 colorSpaceProperties])
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(a2, "colorSpaceProperties"));
    uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v7 count:1];
  }
  else
  {
    uint64_t v5 = 0;
  }
  [(BWVideoFormatRequirements *)v4 setSupportedColorSpaceProperties:v5];
  return v4;
}

- (void)dealloc
{
  outputFormatDescription = self->_outputFormatDescription;
  if (outputFormatDescription) {
    CFRelease(outputFormatDescription);
  }
  noiseReductionReleaseBuffers((uint64_t)self->_context);
  noiseReductionContextDestroy(self->_context);
  quadraResampledIntermediateBuffer = self->_quadraResampledIntermediateBuffer;
  if (quadraResampledIntermediateBuffer) {
    CFRelease(quadraResampledIntermediateBuffer);
  }
  quadraResampledIntermediaBufferFormatDescription = self->_quadraResampledIntermediaBufferFormatDescription;
  if (quadraResampledIntermediaBufferFormatDescription) {
    CFRelease(quadraResampledIntermediaBufferFormatDescription);
  }
  quadraResampledTransferSession = self->_quadraResampledTransferSession;
  if (quadraResampledTransferSession) {
    CFRelease(quadraResampledTransferSession);
  }
  v7.receiver = self;
  v7.super_class = (Class)BWNoiseReducerNode;
  [(BWNode *)&v7 dealloc];
}

- (id)nodeType
{
  return @"Effect";
}

- (id)nodeSubType
{
  return @"NoiseReducer";
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
  -[BWNodeOutput setFormatRequirements:](self->super._output, "setFormatRequirements:", -[BWNoiseReducerNode _outputRequirementsForInputFormat:]((uint64_t)self, a3));
  if (self->_useInPlaceAlgorithm)
  {
    output = self->super._output;
    [(BWNodeOutput *)output setFormat:a3];
  }
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  __assert_rtn("-[BWNoiseReducerNode prepareForCurrentConfigurationToBecomeLive]", "BWNoiseReducerNode.m", 155, "_quadraResampledTransferSession != NULL");
}

- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5
{
  if (a4)
  {
    outputFormatDescription = self->_outputFormatDescription;
    if (outputFormatDescription)
    {
      CFRelease(outputFormatDescription);
      self->_outputFormatDescription = 0;
    }
  }
  v10.receiver = self;
  v10.super_class = (Class)BWNoiseReducerNode;
  [(BWNode *)&v10 configurationWithID:a3 updatedFormat:a4 didBecomeLiveForInput:a5];
}

- (void)didReachEndOfDataForInput:(id)a3
{
  outputFormatDescription = self->_outputFormatDescription;
  if (outputFormatDescription)
  {
    CFRelease(outputFormatDescription);
    self->_outputFormatDescription = 0;
  }
  noiseReductionReleaseBuffers((uint64_t)self->_context);
  noiseReductionContextDestroy(self->_context);
  self->_context = 0;
  v6.receiver = self;
  v6.super_class = (Class)BWNoiseReducerNode;
  [(BWNode *)&v6 didReachEndOfDataForInput:a3];
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  noiseReductionOptions = self->_noiseReductionOptions;
  CFTypeRef cf = 0;
  CMAttachmentBearerRef target = 0;
  id v8 = (void *)CMGetAttachment(a3, @"StillSettings", 0);
  v9 = v8;
  if (!v8)
  {
    fig_log_get_emitter();
    uint64_t v38 = v4;
    LODWORD(v37) = 0;
    FigDebugAssert3();
    BOOL v44 = 0;
    v21 = 0;
    v23 = 0;
    objc_super v15 = 0;
    v24 = 0;
    uint64_t v25 = 4294954516;
LABEL_14:
    v26 = (_DWORD *)MEMORY[0x1E4F1EBA8];
    goto LABEL_28;
  }
  int v10 = objc_msgSend((id)objc_msgSend(v8, "captureSettings"), "captureType");
  if (!objc_msgSend((id)objc_msgSend(v9, "requestedSettings"), "noiseReductionEnabled"))
  {
    if (v10 == 8)
    {
      v23 = [(BWPixelBufferPool *)[(BWNodeOutput *)self->super._output livePixelBufferPool] newPixelBuffer];
      CMAttachmentBearerRef target = -[BWNoiseReducerNode _newQuadraResampledSampleBufferFromSampleBuffer:outputPixelBuffer:]((CMSampleBufferRef)self, a3, v23);
      if (!target)
      {
        fig_log_get_emitter();
        uint64_t v38 = v4;
        LODWORD(v37) = 0;
        FigDebugAssert3();
      }
      BOOL v44 = 0;
      v21 = 0;
      objc_super v15 = 0;
      v24 = 0;
      uint64_t v25 = 0;
    }
    else
    {
      BOOL v44 = 0;
      v21 = 0;
      v23 = 0;
      objc_super v15 = 0;
      v24 = 0;
      uint64_t v25 = 0;
      CMAttachmentBearerRef target = CFRetain(a3);
    }
    goto LABEL_14;
  }
  v11 = noiseReductionOptions;
  CFStringRef v12 = (const __CFString *)*MEMORY[0x1E4F53070];
  v43 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  id v13 = v43;
  v14 = (void *)CMGetAttachment(a3, @"NoiseReductionAlternateMetadata", 0);
  objc_super v15 = v14;
  if (v14)
  {
    id v16 = v14;
    CMSetAttachment(a3, v12, v15, 1u);
  }
  CFStringRef key = v12;
  uint64_t v17 = *MEMORY[0x1E4F55C50];
  CFTypeRef v18 = CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F55C50], 0);
  BOOL v44 = v18 != 0;
  if (v18)
  {
    CFTypeRef v19 = v18;
    v20 = (NSDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:self->_noiseReductionOptions];
    v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithDictionary:", -[NSDictionary objectForKeyedSubscript:](self->_noiseReductionOptions, "objectForKeyedSubscript:", @"ChromaNoiseReductionTuningParameters"));
    v22 = (void *)v19;
    noiseReductionOptions = v20;
    [v22 floatValue];
    objc_msgSend(v21, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:"), v17);
    [(NSDictionary *)v20 setObject:v21 forKeyedSubscript:@"ChromaNoiseReductionTuningParameters"];
  }
  else
  {
    v21 = 0;
    noiseReductionOptions = v11;
  }
  v24 = v43;
  if (self->_useInPlaceAlgorithm)
  {
    uint64_t v25 = noiseReductionWithTuningOptions((uint64_t)self->_context, a3, self->_processLuma, self->_threaded, (const __CFDictionary *)noiseReductionOptions);
    v23 = 0;
    CMAttachmentBearerRef target = CFRetain(a3);
    goto LABEL_26;
  }
  uint64_t v27 = (uint64_t)noiseReductionOptions;
  CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(a3);
  v29 = [(BWPixelBufferPool *)[(BWNodeOutput *)self->super._output livePixelBufferPool] newPixelBuffer];
  v23 = v29;
  if (!v29)
  {
    fig_log_get_emitter();
    uint64_t v38 = v4;
    LODWORD(v37) = 0;
    FigDebugAssert3();
    uint64_t v25 = 4294954510;
    v26 = (_DWORD *)MEMORY[0x1E4F1EBA8];
    goto LABEL_34;
  }
  CMSetAttachment(v29, @"InputPixelBufferForAsyncNR", ImageBuffer, 0);
  if (v10 != 8)
  {
    BWCMSampleBufferCreateCopyWithNewPixelBuffer(a3, v23, (CFTypeRef *)&self->_outputFormatDescription, (CMSampleBufferRef *)&target);
    noiseReductionOptions = (NSDictionary *)v27;
    uint64_t v25 = noiseReductionInOutWithTuningOptions((uint64_t)self->_context, a3, (opaqueCMSampleBuffer *)target, self->_processLuma, self->_threaded, v27);
    if (!v25)
    {
LABEL_26:
      v26 = (_DWORD *)MEMORY[0x1E4F1EBA8];
      if (!v15) {
        goto LABEL_28;
      }
      goto LABEL_27;
    }
    fig_log_get_emitter();
    uint64_t v38 = v4;
    LODWORD(v37) = v25;
    goto LABEL_55;
  }
  quadraResampledIntermediateBuffer = self->_quadraResampledIntermediateBuffer;
  if (!quadraResampledIntermediateBuffer)
  {
    FormatDescription = CMSampleBufferGetFormatDescription(a3);
    uint64_t Dimensions = (uint64_t)CMVideoFormatDescriptionGetDimensions(FormatDescription);
    size_t v40 = (int)Dimensions;
    CFAllocatorRef v41 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    uint64_t height = Dimensions >> 32;
    LODWORD(FormatDescription) = CMFormatDescriptionGetMediaSubType(FormatDescription);
    CFDictionaryRef Attributes = (const __CFDictionary *)CVPixelBufferGetAttributes();
    uint64_t v36 = CVPixelBufferCreate(v41, v40, height, (OSType)FormatDescription, Attributes, &self->_quadraResampledIntermediateBuffer);
    if (v36)
    {
      uint64_t v25 = v36;
      v26 = (_DWORD *)MEMORY[0x1E4F1EBA8];
      noiseReductionOptions = (NSDictionary *)v27;
      v24 = v43;
      goto LABEL_28;
    }
    quadraResampledIntermediateBuffer = self->_quadraResampledIntermediateBuffer;
    v24 = v43;
  }
  BWCMSampleBufferCreateCopyWithNewPixelBuffer(a3, quadraResampledIntermediateBuffer, (CFTypeRef *)&self->_quadraResampledIntermediaBufferFormatDescription, (CMSampleBufferRef *)&cf);
  noiseReductionOptions = (NSDictionary *)v27;
  uint64_t v31 = noiseReductionInOutWithTuningOptions((uint64_t)self->_context, a3, (opaqueCMSampleBuffer *)cf, self->_processLuma, self->_threaded, v27);
  if (v31)
  {
    uint64_t v25 = v31;
    fig_log_get_emitter();
    uint64_t v38 = v4;
    LODWORD(v37) = v25;
LABEL_55:
    FigDebugAssert3();
    goto LABEL_14;
  }
  CMAttachmentBearerRef target = -[BWNoiseReducerNode _newQuadraResampledSampleBufferFromSampleBuffer:outputPixelBuffer:]((CMSampleBufferRef)self, (CMSampleBufferRef)cf, v23);
  v26 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (target)
  {
    uint64_t v25 = 0;
    if (v15) {
LABEL_27:
    }
      CMSetAttachment(target, key, v24, 1u);
  }
  else
  {
    fig_log_get_emitter();
    uint64_t v38 = v4;
    LODWORD(v37) = 0;
    FigDebugAssert3();
    uint64_t v25 = 0;
  }
LABEL_28:
  if (target && v25 != -12786 && v25 != -12783)
  {
    -[BWNodeOutput emitSampleBuffer:](self->super._output, "emitSampleBuffer:");
    if (!v44) {
      goto LABEL_37;
    }
    goto LABEL_35;
  }
  uint64_t v27 = (uint64_t)noiseReductionOptions;
LABEL_34:
  id v32 = +[BWNodeError newError:sourceNode:stillImageSettings:metadata:](BWNodeError, "newError:sourceNode:stillImageSettings:metadata:", v25, self, v9, v24, v37, v38);
  [(BWNodeOutput *)self->super._output emitNodeError:v32];

  noiseReductionOptions = (NSDictionary *)v27;
  if (!v44) {
    goto LABEL_37;
  }
LABEL_35:
  if (noiseReductionOptions) {
    CFRelease(noiseReductionOptions);
  }
LABEL_37:
  if (v21) {
    CFRelease(v21);
  }

  if (v23) {
    CFRelease(v23);
  }
  if (target) {
    CFRelease(target);
  }
  if (cf) {
    CFRelease(cf);
  }
  if (*v26 == 1) {
    kdebug_trace();
  }
}

- (CMSampleBufferRef)_newQuadraResampledSampleBufferFromSampleBuffer:(__CVBuffer *)a3 outputPixelBuffer:
{
  if (result)
  {
    uint64_t v3 = (uint64_t)result;
    CMSampleBufferRef v7 = 0;
    if (*((void *)result + 20))
    {
      if (a3)
      {
        CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(sbuf);
        if (!VTPixelTransferSessionTransferImage(*(VTPixelTransferSessionRef *)(v3 + 160), ImageBuffer, a3))
        {
          BWCMSampleBufferCreateCopyWithNewPixelBuffer(sbuf, a3, (CFTypeRef *)(v3 + 112), &v7);
          return v7;
        }
      }
      else
      {
        FigSignalErrorAt();
      }
    }
    return 0;
  }
  return result;
}

- (void)setQuadraHighResStillImageCaptureEnabled:(BOOL)a3
{
  self->_quadraHighResStillImageCaptureEnabled = a3;
}

- (BOOL)quadraHighResStillImageCaptureEnabled
{
  return self->_quadraHighResStillImageCaptureEnabled;
}

@end