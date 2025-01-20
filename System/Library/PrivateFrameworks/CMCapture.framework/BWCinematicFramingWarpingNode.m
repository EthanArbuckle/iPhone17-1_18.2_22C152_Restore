@interface BWCinematicFramingWarpingNode
+ (void)initialize;
- (uint64_t)_initVirtualCameraProcessorWithOutputDimensions:(uint64_t)result;
- (void)dealloc;
- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5;
- (void)initWithFramingStatesProvider:(void *)a1 outputDimensions:(void *)a2 maxLossyCompressionLevel:(uint64_t)a3;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
@end

@implementation BWCinematicFramingWarpingNode

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (void)initWithFramingStatesProvider:(void *)a1 outputDimensions:(void *)a2 maxLossyCompressionLevel:(uint64_t)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  v13.receiver = a1;
  v13.super_class = (Class)BWCinematicFramingWarpingNode;
  v5 = objc_msgSendSuper2(&v13, sel_init);
  if (v5)
  {
    if (dword_1E96B6D88)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v5[12] = a2;
    v5[14] = a3;
    v7 = [[BWNodeInput alloc] initWithMediaType:1986618469 node:v5];
    if ((int)FigCapturePlatformIdentifier() < 8) {
      v8 = &unk_1EFB03C08;
    }
    else {
      v8 = FigCapturePixelFormatsByAddingCompressedVariants(&unk_1EFB03C08, 1);
    }
    v9 = objc_alloc_init(BWVideoFormatRequirements);
    [(BWVideoFormatRequirements *)v9 setSupportedPixelFormats:v8];
    [(BWNodeInput *)v7 setFormatRequirements:v9];
    [(BWNodeInput *)v7 setPassthroughMode:0];
    [v5 addInput:v7];
    v10 = [[BWNodeOutput alloc] initWithMediaType:1986618469 node:v5];
    v11 = objc_alloc_init(BWVideoFormatRequirements);
    [(BWVideoFormatRequirements *)v11 setSupportedPixelFormats:v8];
    [(BWNodeOutput *)v10 setFormatRequirements:v11];
    [(BWNodeOutput *)v10 setPassthroughMode:0];
    [(BWNodeOutput *)v10 setProvidesPixelBufferPool:1];
    [v5 addOutput:v10];

    -[BWCinematicFramingWarpingNode _initVirtualCameraProcessorWithOutputDimensions:]((uint64_t)v5, v5[14]);
  }
  return v5;
}

- (uint64_t)_initVirtualCameraProcessorWithOutputDimensions:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    id v4 = objc_alloc_init(MEMORY[0x1E4F58FB8]);
    *(void *)(v3 + 104) = v4;
    [v4 setOutputDimensions:a2];
    if ([*(id *)(v3 + 104) setup]) {
      return FigDebugAssert3();
    }
    if ([*(id *)(v3 + 104) prewarm]) {
      return FigDebugAssert3();
    }
    result = [*(id *)(v3 + 104) prepareToProcess:1];
    if (result) {
      return FigDebugAssert3();
    }
  }
  return result;
}

- (void)dealloc
{
  [(VCProcessor *)self->_vcProcessor purgeResources];
  v3.receiver = self;
  v3.super_class = (Class)BWCinematicFramingWarpingNode;
  [(BWNode *)&v3 dealloc];
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if ([a5 isEqualToString:@"PrimaryFormat"])
  {
    v9 = objc_alloc_init(BWVideoFormatRequirements);
    v11[0] = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a3, "pixelFormat"));
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v9, "setSupportedPixelFormats:", [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1]);
    [(BWVideoFormatRequirements *)v9 setWidth:self->_outputDimensions.width];
    [(BWVideoFormatRequirements *)v9 setHeight:self->_outputDimensions.height];
    [(BWNodeOutput *)self->super._output setFormatRequirements:v9];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)BWCinematicFramingWarpingNode;
    [(BWNode *)&v10 didSelectFormat:a3 forInput:a4 forAttachedMediaKey:a5];
  }
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  CFTypeRef v34 = 0;
  CFTypeRef cf = 0;
  CFDictionaryRef v7 = (const __CFDictionary *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(v7, (const void *)*MEMORY[0x1E4F530C0]);
  memset(&v33, 0, sizeof(v33));
  CMTimeMakeFromDictionary(&v33, Value);
  if (dword_1E96B6D88)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  framingStatesProvider = self->_framingStatesProvider;
  CMTime v36 = v33;
  v11 = (double *)-[BWCinematicFramingStatesProvider copyCameraStatesForPTS:](framingStatesProvider, "copyCameraStatesForPTS:", &v36, v29, v31);
  v12 = v11;
  if (!v11) {
    goto LABEL_22;
  }
  uint64_t v14 = *((void *)v11 + 1);
  uint64_t v13 = *((void *)v11 + 2);
  if (v14) {
    BOOL v15 = v13 == 0;
  }
  else {
    BOOL v15 = 1;
  }
  if (v15)
  {
    uint64_t v32 = v4;
    LODWORD(v30) = 0;
    FigDebugAssert3();
    goto LABEL_22;
  }
  double v16 = v11[3];
  double v17 = v11[4];
  double v18 = v11[5];
  double v19 = v11[6];
  CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(a3);
  if (!ImageBuffer)
  {
LABEL_22:
    v24 = 0;
    goto LABEL_16;
  }
  v21 = ImageBuffer;
  CFStringRef v22 = (const __CFString *)*MEMORY[0x1E4F54370];
  v23 = (const void *)[(__CFDictionary *)v7 objectForKeyedSubscript:*MEMORY[0x1E4F54370]];
  if (v23) {
    CVBufferSetAttachment(v21, v22, v23, kCVAttachmentMode_ShouldPropagate);
  }
  v24 = [(BWPixelBufferPool *)[(BWNodeOutputMediaProperties *)[(BWNodeOutput *)[(BWNode *)self output] primaryMediaProperties] livePixelBufferPool] newPixelBuffer];
  if (v24)
  {
    [(VCProcessor *)self->_vcProcessor setInputPixelBuffer:v21];
    [(VCProcessor *)self->_vcProcessor setInputCamera:v14];
    [(VCProcessor *)self->_vcProcessor setOutputPixelBuffer:v24];
    [(VCProcessor *)self->_vcProcessor setOutputCamera:v13];
    -[VCProcessor setOutputROI:](self->_vcProcessor, "setOutputROI:", v16, v17, v18, v19);
    int v25 = [(VCProcessor *)self->_vcProcessor process];
    if (v25)
    {
      uint64_t v32 = v4;
      LODWORD(v30) = v25;
    }
    else
    {
      int v26 = [(VCProcessor *)self->_vcProcessor finishProcessing];
      if (!v26)
      {
        BWCMSampleBufferCreateCopyWithNewPixelBuffer(a3, v24, &v34, (CMSampleBufferRef *)&cf);
        if (cf)
        {
          v27 = CMSampleBufferGetImageBuffer(a3);
          CVBufferPropagateAttachments(v27, v24);
          FigCaptureCinematicFramingUpdateSampleBufferMetadata(self->_vcProcessor, cf, 0);
        }
        goto LABEL_16;
      }
      uint64_t v32 = v4;
      LODWORD(v30) = v26;
    }
    FigDebugAssert3();
  }
LABEL_16:
  v28 = [(BWNode *)self output];
  [(BWNodeOutput *)v28 emitSampleBuffer:cf];

  if (v24) {
    CFRelease(v24);
  }
  if (cf) {
    CFRelease(cf);
  }
}

@end