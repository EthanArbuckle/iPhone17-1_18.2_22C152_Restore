@interface BWMotionAttachmentsNode
+ (void)initialize;
- (BOOL)adjustsValidBufferRectForDarkShade;
- (BWMotionAttachmentsNode)initWithSensorIDDictionaryByPortType:(id)a3 cameraInfoByPortType:(id)a4 tuningParameters:(id)a5 activePortTypes:(id)a6 horizontalSensorBinningFactor:(int)a7 verticalSensorBinningFactor:(int)a8 maxSupportedFrameRate:(float)a9 motionAttachmentsMode:(int)a10 motionAttachmentsSource:(int)a11 motionCallbackThreadPriority:(unsigned int)a12 provideSourceVideoWithMotionAttachmentsOutput:(BOOL)a13 provideOfflineVISMotionDataOutput:(BOOL)a14 errorOut:(int *)a15;
- (BWNodeOutput)offlineVISMotionDataOutput;
- (BWNodeOutput)sourceVideoWithMotionAttachmentsOutput;
- (id)nodeSubType;
- (id)nodeType;
- (uint64_t)_flushIfRequiredForMarkerBuffer:(uint64_t)result;
- (uint64_t)_setupSampleBufferProcessor;
- (void)dealloc;
- (void)didReachEndOfDataForInput:(id)a3;
- (void)didSelectFormat:(id)a3 forInput:(id)a4;
- (void)prepareForCurrentConfigurationToBecomeLive;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
- (void)setAdjustsValidBufferRectForDarkShade:(BOOL)a3;
@end

@implementation BWMotionAttachmentsNode

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
}

- (id)nodeType
{
  return @"Effect";
}

- (BWNodeOutput)sourceVideoWithMotionAttachmentsOutput
{
  return self->_sourceVideoWithMotionAttachmentsOutput;
}

- (BWMotionAttachmentsNode)initWithSensorIDDictionaryByPortType:(id)a3 cameraInfoByPortType:(id)a4 tuningParameters:(id)a5 activePortTypes:(id)a6 horizontalSensorBinningFactor:(int)a7 verticalSensorBinningFactor:(int)a8 maxSupportedFrameRate:(float)a9 motionAttachmentsMode:(int)a10 motionAttachmentsSource:(int)a11 motionCallbackThreadPriority:(unsigned int)a12 provideSourceVideoWithMotionAttachmentsOutput:(BOOL)a13 provideOfflineVISMotionDataOutput:(BOOL)a14 errorOut:(int *)a15
{
  v22 = self;
  v60[5] = *MEMORY[0x1E4F143B8];
  if (!a13 && !a14)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return v22;
  }
  v50.receiver = self;
  v50.super_class = (Class)BWMotionAttachmentsNode;
  v23 = [(BWNode *)&v50 init];
  v22 = v23;
  if (v23)
  {
    if (a10)
    {
      if (a10 != 2)
      {
        if (a10 == 1)
        {
          unsigned int v47 = a7;
          unsigned int v48 = a8;
          BOOL v49 = a14;
          if (a11 == 1)
          {
            v60[0] = 0x1EFA60700;
            v60[1] = 0x1EFA60680;
            v60[2] = 0x1EFA60660;
            v60[3] = 0x1EFA606C0;
            v60[4] = 0x1EFA606A0;
            v24 = (void *)MEMORY[0x1E4F1C978];
            v25 = v60;
            uint64_t v26 = 5;
          }
          else
          {
            v59[0] = 0x1EFA60680;
            v59[1] = 0x1EFA60660;
            v59[2] = 0x1EFA606C0;
            v59[3] = 0x1EFA606A0;
            v24 = (void *)MEMORY[0x1E4F1C978];
            v25 = v59;
            uint64_t v26 = 4;
          }
          v34 = (void *)[v24 arrayWithObjects:v25 count:v26];
          uint64_t v35 = 240;
          goto LABEL_28;
        }
        goto LABEL_16;
      }
      if (a11 == 2)
      {
        unsigned int v47 = a7;
        unsigned int v48 = a8;
        BOOL v49 = a14;
        v57[0] = 0x1EFA60700;
        v57[1] = 0x1EFA60720;
        v31 = (void *)MEMORY[0x1E4F1C978];
        v32 = v57;
        uint64_t v33 = 2;
      }
      else
      {
        if (a11 != 1) {
          goto LABEL_16;
        }
        unsigned int v47 = a7;
        unsigned int v48 = a8;
        BOOL v49 = a14;
        uint64_t v58 = 0x1EFA60700;
        v31 = (void *)MEMORY[0x1E4F1C978];
        v32 = &v58;
        uint64_t v33 = 1;
      }
      v34 = (void *)[v31 arrayWithObjects:v32 count:v33];
      uint64_t v28 = 0;
    }
    else
    {
      switch(a11)
      {
        case 3:
          unsigned int v47 = a7;
          unsigned int v48 = a8;
          BOOL v49 = a14;
          int v36 = vcvtps_s32_f32(0.042 / (float)(1.0 / a9));
          if (v36 <= 3) {
            uint64_t v28 = 3;
          }
          else {
            uint64_t v28 = v36;
          }
          v54[0] = 0x1EFA60640;
          v54[1] = 0x1EFA606E0;
          v27 = (void *)MEMORY[0x1E4F1C978];
          v29 = v54;
          uint64_t v30 = 2;
          break;
        case 2:
          unsigned int v47 = a7;
          unsigned int v48 = a8;
          BOOL v49 = a14;
          v55[0] = 0x1EFA60700;
          v55[1] = 0x1EFA60720;
          v34 = (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:2];
          uint64_t v35 = 0;
LABEL_28:
          uint64_t v28 = 1;
          goto LABEL_29;
        case 1:
          unsigned int v47 = a7;
          unsigned int v48 = a8;
          BOOL v49 = a14;
          uint64_t v56 = 0x1EFA60700;
          v27 = (void *)MEMORY[0x1E4F1C978];
          uint64_t v28 = 1;
          v29 = &v56;
          uint64_t v30 = 1;
          break;
        default:
LABEL_16:

          v22 = 0;
          *a15 = -12787;
          return v22;
      }
      v34 = (void *)[v27 arrayWithObjects:v29 count:v30];
    }
    uint64_t v35 = 0;
LABEL_29:
    uint64_t v37 = *MEMORY[0x1E4F53560];
    v52[0] = *MEMORY[0x1E4F535A0];
    v52[1] = v37;
    v53[0] = a3;
    v53[1] = a4;
    uint64_t v38 = *MEMORY[0x1E4F535B0];
    v52[2] = *MEMORY[0x1E4F53558];
    v52[3] = v38;
    v53[2] = a6;
    v53[3] = a5;
    v52[4] = *MEMORY[0x1E4F53588];
    v53[4] = [NSNumber numberWithInt:v47];
    v52[5] = *MEMORY[0x1E4F53590];
    v53[5] = [NSNumber numberWithInt:v48];
    v52[6] = 0x1EFA60600;
    v53[6] = [NSNumber numberWithInt:v35];
    v52[7] = 0x1EFA605E0;
    v53[7] = [NSNumber numberWithInt:v28];
    v53[8] = v34;
    v52[8] = 0x1EFA605C0;
    v52[9] = 0x1EFA60620;
    v53[9] = [NSNumber numberWithUnsignedInt:a12];
    v22->_optionsDict = (NSDictionary *)(id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:v52 count:10];
    v39 = [[BWNodeInput alloc] initWithMediaType:1986618469 node:v22];
    v40 = objc_alloc_init(BWVideoFormatRequirements);
    if (v34)
    {
      uint64_t v41 = v28;
      v42 = (void *)[v34 firstObject];
      if ((unint64_t)[v34 count] <= 1
        && [v42 isEqualToString:0x1EFA60640])
      {
        [(BWNodeInput *)v39 setRetainedBufferCount:0];
      }
      else
      {
        [(BWNodeInput *)v39 setDelayedBufferCount:v41];
      }
    }
    [(BWNodeInput *)v39 setFormatRequirements:v40];

    [(BWNode *)v22 addInput:v39];
    if (a13)
    {
      [(BWNodeInput *)v39 setPassthroughMode:1];
      v43 = [[BWNodeOutput alloc] initWithMediaType:1986618469 node:v22];
      v44 = objc_alloc_init(BWVideoFormatRequirements);
      [(BWNodeOutput *)v43 setName:@"Source Video With Motion Attachments"];
      [(BWNodeOutput *)v43 setPassthroughMode:1];
      [(BWNodeOutput *)v43 setFormatRequirements:v44];

      [(BWNode *)v22 addOutput:v43];
      v22->_sourceVideoWithMotionAttachmentsOutput = v43;
    }
    if (v49)
    {
      v45 = [[BWNodeOutput alloc] initWithMediaType:1836016234 node:v22];
      uint64_t v51 = *MEMORY[0x1E4F21898];
      -[BWNodeOutput setFormat:](v45, "setFormat:", +[BWMetadataObjectFormat formatWithMetadataIdentifiers:](BWMetadataObjectFormat, "formatWithMetadataIdentifiers:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v51 count:1]));
      [(BWNodeOutput *)v45 setName:@"Motion Attachments For Offline VIS"];
      [(BWNode *)v22 addOutput:v45];
      v22->_offlineVISMotionDataOutput = v45;
    }
    v22->_limitedGMErrorLogger = [[BWLimitedGMErrorLogger alloc] initWithName:@"MotionAttachments" maxLoggingCount:10];
  }
  return v22;
}

+ (void)initialize
{
}

- (void)dealloc
{
  sampleBufferProcessor = self->_sampleBufferProcessor;
  if (sampleBufferProcessor)
  {
    uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v4) {
      uint64_t v5 = v4;
    }
    else {
      uint64_t v5 = 0;
    }
    v6 = *(void (**)(OpaqueFigSampleBufferProcessor *, void, void))(v5 + 8);
    if (v6) {
      v6(sampleBufferProcessor, 0, 0);
    }
    uint64_t FigBaseObject = FigSampleBufferProcessorGetFigBaseObject();
    if (FigBaseObject)
    {
      uint64_t v8 = FigBaseObject;
      uint64_t v9 = *(void *)(CMBaseObjectGetVTable() + 8);
      if (v9) {
        uint64_t v10 = v9;
      }
      else {
        uint64_t v10 = 0;
      }
      v11 = *(void (**)(uint64_t))(v10 + 24);
      if (v11) {
        v11(v8);
      }
    }
    CFRelease(self->_sampleBufferProcessor);
  }

  v12.receiver = self;
  v12.super_class = (Class)BWMotionAttachmentsNode;
  [(BWNode *)&v12 dealloc];
}

- (id)nodeSubType
{
  return @"MotionAttachments";
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  v3.receiver = self;
  v3.super_class = (Class)BWMotionAttachmentsNode;
  [(BWNode *)&v3 prepareForCurrentConfigurationToBecomeLive];
  if (!self->_sampleBufferProcessor)
  {
    if (-[BWMotionAttachmentsNode _setupSampleBufferProcessor]((uint64_t)self))
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
  }
}

- (uint64_t)_setupSampleBufferProcessor
{
  if (!a1) {
    return 0;
  }
  uint64_t v3 = *MEMORY[0x1E4F1CF80];
  CFDictionaryRef v4 = *(const __CFDictionary **)(a1 + 104);
  uint64_t v15 = 0;
  uint64_t v5 = FigSampleBufferProcessorCreateForMotionAttachments(v3, v4, &v15);
  if (v5)
  {
    uint64_t v10 = v5;
    fig_log_get_emitter();
    FigDebugAssert3();
    fig_log_get_emitter();
    uint64_t v14 = v1;
    LODWORD(v13) = 0;
  }
  else
  {
    uint64_t v6 = v15;
    *(void *)(a1 + 96) = v15;
    uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v7) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = 0;
    }
    uint64_t v9 = *(uint64_t (**)(uint64_t, void, uint64_t))(v8 + 8);
    if (v9)
    {
      uint64_t v10 = v9(v6, man_maProcessorOutputReadyCallback, a1);
      if (!v10) {
        return v10;
      }
    }
    else
    {
      uint64_t v10 = 4294954514;
    }
    fig_log_get_emitter();
    uint64_t v14 = v1;
    LODWORD(v13) = 0;
  }
  FigDebugAssert3();
  v11 = *(const void **)(a1 + 96);
  if (v11)
  {
    CFRelease(v11);
    *(void *)(a1 + 96) = 0;
  }
  objc_msgSend(*(id *)(a1 + 128), "logErrorNumber:errorString:", v10, @"setup SBP", v13, v14);
  return v10;
}

- (void)didReachEndOfDataForInput:(id)a3
{
  sampleBufferProcessor = self->_sampleBufferProcessor;
  if (sampleBufferProcessor)
  {
    uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v6) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
    uint64_t v8 = *(void (**)(OpaqueFigSampleBufferProcessor *))(v7 + 24);
    if (v8) {
      v8(sampleBufferProcessor);
    }
  }
  [(BWLimitedGMErrorLogger *)self->_limitedGMErrorLogger resetCurrentLoggingCounter];
  v9.receiver = self;
  v9.super_class = (Class)BWMotionAttachmentsNode;
  [(BWNode *)&v9 didReachEndOfDataForInput:a3];
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  memset(&v11, 0, sizeof(v11));
  CMSampleBufferGetPresentationTimeStamp(&v11, a3);
  if (BWSampleBufferIsMarkerBuffer(a3))
  {
    -[BWMotionAttachmentsNode _flushIfRequiredForMarkerBuffer:]((uint64_t)self, a3);
    [(BWNodeOutput *)self->super._output emitSampleBuffer:a3];
  }
  else
  {
    sampleBufferProcessor = self->_sampleBufferProcessor;
    if (sampleBufferProcessor)
    {
      if (self->_adjustsValidBufferRectForDarkShade)
      {
        FigCaptureMetadataUtilitiesAdjustValidBufferRectForDarkShadeCropping(a3);
        sampleBufferProcessor = self->_sampleBufferProcessor;
      }
      uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v7) {
        uint64_t v8 = v7;
      }
      else {
        uint64_t v8 = 0;
      }
      objc_super v9 = *(void (**)(OpaqueFigSampleBufferProcessor *, opaqueCMSampleBuffer *))(v8 + 16);
      if (v9) {
        v9(sampleBufferProcessor, a3);
      }
    }
    else
    {
      CMTime v10 = v11;
      [(BWNodeOutput *)self->super._output emitDroppedSample:+[BWDroppedSample newDroppedSampleWithReason:0x1EFA67F80 pts:&v10]];
    }
  }
}

- (uint64_t)_flushIfRequiredForMarkerBuffer:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    CFDictionaryRef v4 = (void *)CMGetAttachment(target, @"FileWriterAction", 0);
    CFTypeRef v5 = CMGetAttachment(target, @"AttachedMediaSwapPlaceholderSampleBuffer", 0);
    if (([v4 isEqualToString:0x1EFA73560] & 1) != 0
      || ([v4 isEqualToString:0x1EFA73580] & 1) != 0
      || ([v4 isEqualToString:0x1EFA735E0] & 1) != 0
      || ([v4 isEqualToString:0x1EFA735C0] & 1) != 0
      || (result = [v4 isEqualToString:0x1EFA73620], (result & 1) != 0)
      || v5 == (CFTypeRef)*MEMORY[0x1E4F1CFD0])
    {
      uint64_t v6 = *(void *)(v3 + 96);
      if (v6)
      {
        uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 16);
        uint64_t v8 = v7 ? v7 : 0;
        objc_super v9 = *(void (**)(uint64_t))(v8 + 24);
        if (v9) {
          v9(v6);
        }
      }
      CMTime v10 = *(void **)(v3 + 128);
      return [v10 resetCurrentLoggingCounter];
    }
  }
  return result;
}

- (BWNodeOutput)offlineVISMotionDataOutput
{
  return self->_offlineVISMotionDataOutput;
}

- (BOOL)adjustsValidBufferRectForDarkShade
{
  return self->_adjustsValidBufferRectForDarkShade;
}

- (void)setAdjustsValidBufferRectForDarkShade:(BOOL)a3
{
  self->_adjustsValidBufferRectForDarkShade = a3;
}

@end