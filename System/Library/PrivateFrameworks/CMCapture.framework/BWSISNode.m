@interface BWSISNode
+ (void)initialize;
- (BOOL)OISSupported;
- (BOOL)allowAllocationsAtPrepareTime;
- (BOOL)alwaysRequestsPreBracketedEV0;
- (BOOL)attachesInputBracketToOutputSampleBuffer;
- (BOOL)livePhotoSupported;
- (BWSISNode)initWithCameraTuningDictionary:(id)a3 sensorIDDictionary:(id)a4 fusionScheme:(int)a5;
- (id)_initWithCameraTuningDictionary:(id)a3 sensorIDDictionary:(id)a4 sbpCreationFunction:(void *)a5 fusionScheme:(int)a6 allowExperimentalOverrides:(BOOL)a7;
- (id)nodeSubType;
- (id)nodeType;
- (uint64_t)_setupSampleBufferProcessor;
- (uint64_t)_unpackSISOptions;
- (void)_clearCaptureRequestState;
- (void)_sampleBufferProcessorOutputReady:(const void *)a3 sampleBuffer:;
- (void)dealloc;
- (void)didSelectFormat:(id)a3 forInput:(id)a4;
- (void)handleNodeError:(id)a3 forInput:(id)a4;
- (void)prepareForCurrentConfigurationToBecomeLive;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
- (void)setAllowAllocationsAtPrepareTime:(BOOL)a3;
- (void)setAlwaysRequestsPreBracketedEV0:(BOOL)a3;
- (void)setLivePhotoSupported:(BOOL)a3;
- (void)setOISSupported:(BOOL)a3;
@end

@implementation BWSISNode

+ (void)initialize
{
}

- (BWSISNode)initWithCameraTuningDictionary:(id)a3 sensorIDDictionary:(id)a4 fusionScheme:(int)a5
{
  return (BWSISNode *)[(BWSISNode *)self _initWithCameraTuningDictionary:a3 sensorIDDictionary:a4 sbpCreationFunction:sisn_createSampleBufferProcessorFunction fusionScheme:*(void *)&a5 allowExperimentalOverrides:1];
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
      uint64_t v10 = v9 ? v9 : 0;
      v11 = *(void (**)(uint64_t))(v10 + 24);
      if (v11) {
        v11(v8);
      }
    }
    v12 = self->_sampleBufferProcessor;
    if (v12)
    {
      CFRelease(v12);
      self->_sampleBufferProcessor = 0;
    }
  }
  -[BWSISNode _clearCaptureRequestState]((uint64_t)self);

  v13.receiver = self;
  v13.super_class = (Class)BWSISNode;
  [(BWNode *)&v13 dealloc];
}

- (void)_clearCaptureRequestState
{
  if (a1)
  {

    *(void *)(a1 + 208) = 0;
    *(unsigned char *)(a1 + 216) = 0;
    *(_DWORD *)(a1 + 220) = 0;
  }
}

- (id)_initWithCameraTuningDictionary:(id)a3 sensorIDDictionary:(id)a4 sbpCreationFunction:(void *)a5 fusionScheme:(int)a6 allowExperimentalOverrides:(BOOL)a7
{
  if (a6 >= 2) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"StillImageStabilization node supports only SeparateFusionAndNoiseReduction and TemporalMultiBandNoiseReduction fusion schemes!" userInfo:0]);
  }
  v20.receiver = self;
  v20.super_class = (Class)BWSISNode;
  v11 = [(BWNode *)&v20 init];
  if (v11)
  {
    v11->_cameraTuningDictionary = (NSDictionary *)a3;
    v11->_sensorIDDictionary = (NSDictionary *)a4;
    v11->_fusionScheme = a6;
    v11->_allowExperimentalOverrides = 0;
    if (-[BWSISNode _unpackSISOptions]((uint64_t)v11))
    {

      return 0;
    }
    else
    {
      v11->_createSampleBufferProcessorFunction = a5;
      v12 = [[BWNodeInput alloc] initWithMediaType:1986618469 node:v11];
      objc_super v13 = objc_alloc_init(BWVideoFormatRequirements);
      [(BWVideoFormatRequirements *)v13 setSupportedPixelFormats:&unk_1EFB03650];
      [(BWNodeInput *)v12 setFormatRequirements:v13];
      int v14 = v11->_oisBracketCount + 1;
      int sisBracketCount = v11->_sisBracketCount;
      if (v14 <= sisBracketCount + 1) {
        uint64_t v16 = (sisBracketCount + 1);
      }
      else {
        uint64_t v16 = v14;
      }
      [(BWNodeInput *)v12 setRetainedBufferCount:v16];

      [(BWNode *)v11 addInput:v12];
      v17 = [[BWNodeOutput alloc] initWithMediaType:1986618469 node:v11];
      v18 = objc_alloc_init(BWVideoFormatRequirements);
      [(BWVideoFormatRequirements *)v18 setSupportedPixelFormats:&unk_1EFB03668];
      [(BWNodeOutput *)v17 setProvidesPixelBufferPool:0];
      [(BWNodeOutput *)v17 setFormatRequirements:v18];

      [(BWNode *)v11 addOutput:v17];
      v11->_lastFusionTypeUsed = 0;
    }
  }
  return v11;
}

- (uint64_t)_unpackSISOptions
{
  if (result)
  {
    uint64_t v1 = result;
    if (*(void *)(result + 120))
    {
      *(_DWORD *)(result + 184) = 4;
      *(_DWORD *)(result + 152) = 0;
      v2 = (void *)[*(id *)(result + 120) objectForKeyedSubscript:@"StillImageStabilization"];
      if (!v2) {
        goto LABEL_21;
      }
      v3 = v2;
      uint64_t v4 = (const void *)[v2 objectForKeyedSubscript:*MEMORY[0x1E4F54780]];
      if (!v4) {
        goto LABEL_21;
      }
      uint64_t v5 = *(const void **)(v1 + 176);
      *(void *)(v1 + 176) = v4;
      CFRetain(v4);
      if (v5) {
        CFRelease(v5);
      }
      v6 = (void *)[v3 objectForKeyedSubscript:@"MaxGain"];
      if (!v6) {
        goto LABEL_21;
      }
      int v7 = [v6 intValue];
      uint64_t v8 = (void *)[v3 objectForKeyedSubscript:*MEMORY[0x1E4F55C30]];
      if (!v8) {
        goto LABEL_21;
      }
      *(_DWORD *)(v1 + 152) = [v8 intValue];
      id v9 = (id)[*(id *)(v1 + 120) objectForKeyedSubscript:*MEMORY[0x1E4F55C38]];
      *(void *)(v1 + 128) = v9;
      if (!*(_DWORD *)(v1 + 144) && !v9) {
        goto LABEL_21;
      }
      *(void *)(v1 + 136) = (id)[*(id *)(v1 + 120) objectForKeyedSubscript:*MEMORY[0x1E4F55C28]];
      *(float *)(v1 + 160) = (float)v7 * 0.0039062;
      *(_DWORD *)(v1 + 156) = 67;
      if (*(void *)(v1 + 168)) {
        goto LABEL_16;
      }
      id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      if (*(int *)(v1 + 184) >= 1)
      {
        int v11 = 0;
        do
        {
          [v10 addObject:&unk_1EFB05958];
          ++v11;
        }
        while (v11 < *(_DWORD *)(v1 + 184));
      }
      *(void *)(v1 + 168) = v10;
      if (v10)
      {
LABEL_16:
        v12 = *(void **)(v1 + 192);
        if (!v12)
        {
          v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", &unk_1EFAFFE70, &unk_1EFAFFE88, 0);
          *(void *)(v1 + 192) = v12;
        }
        int v13 = [v12 count];
        result = 0;
        *(_DWORD *)(v1 + 200) = v13;
      }
      else
      {
LABEL_21:
        fig_log_get_emitter();
        FigDebugAssert3();
        return FigSignalErrorAt();
      }
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      return 4294954516;
    }
  }
  return result;
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v6 = objc_alloc_init(BWVideoFormatRequirements);
  v9[0] = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a3, "pixelFormat"));
  -[BWVideoFormatRequirements setSupportedPixelFormats:](v6, "setSupportedPixelFormats:", [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1]);
  -[BWVideoFormatRequirements setWidth:](v6, "setWidth:", [a3 width]);
  -[BWVideoFormatRequirements setHeight:](v6, "setHeight:", [a3 height]);
  [(BWVideoFormatRequirements *)v6 setSupportedCacheModes:+[BWVideoFormatRequirements cacheModesForOptimizedHWAccess]];
  if ([a3 colorSpaceProperties])
  {
    uint64_t v8 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(a3, "colorSpaceProperties"));
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v8 count:1];
  }
  else
  {
    uint64_t v7 = 0;
  }
  [(BWVideoFormatRequirements *)v6 setSupportedColorSpaceProperties:v7];
  [(BWNodeOutput *)self->super._output setFormatRequirements:v6];
}

- (id)nodeType
{
  return @"Effect";
}

- (id)nodeSubType
{
  return @"StillImageStabilizer";
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  v17.receiver = self;
  v17.super_class = (Class)BWSISNode;
  [(BWNode *)&v17 prepareForCurrentConfigurationToBecomeLive];
  if (!self->_sampleBufferProcessor && -[BWSISNode _setupSampleBufferProcessor]((uint64_t)self))
  {
    fig_log_get_emitter();
    uint64_t v16 = v2;
    LODWORD(v15) = 0;
    FigDebugAssert3();
  }
  if (self->_allowAllocationsAtPrepareTime
    && self->_sampleBufferProcessor
    && ![(BWSISNode *)self livePhotoSupported])
  {
    if ([(BWSISNode *)self OISSupported]) {
      int v4 = 2;
    }
    else {
      int v4 = 1;
    }
    self->_lastFusionTypeUsed = v4;
    uint64_t v5 = objc_msgSend(NSNumber, "numberWithInt:", v15, v16);
    uint64_t FigBaseObject = FigSampleBufferProcessorGetFigBaseObject();
    uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v7) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = 0;
    }
    id v9 = *(void (**)(uint64_t, void, uint64_t))(v8 + 56);
    if (v9) {
      v9(FigBaseObject, *MEMORY[0x1E4F55C58], v5);
    }
    id v10 = [(BWVideoFormat *)[(BWNodeInput *)self->super._input videoFormat] pixelBufferAttributes];
    uint64_t v11 = FigSampleBufferProcessorGetFigBaseObject();
    uint64_t v12 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v12) {
      uint64_t v13 = v12;
    }
    else {
      uint64_t v13 = 0;
    }
    int v14 = *(void (**)(uint64_t, void, NSDictionary *))(v13 + 56);
    if (v14) {
      v14(v11, *MEMORY[0x1E4F535C8], v10);
    }
  }
}

- (uint64_t)_setupSampleBufferProcessor
{
  if (!a1) {
    return 0;
  }
  uint64_t v17 = 0;
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v3 = v2;
  if (!*(void *)(a1 + 112))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    uint64_t v15 = FigSignalErrorAt();
    goto LABEL_24;
  }
  int v4 = *(_DWORD *)(a1 + 144);
  if (v4 == 1)
  {
    objc_msgSend(v2, "setObject:forKeyedSubscript:");
    [v3 setObject:&unk_1EFAFFEA0 forKeyedSubscript:*MEMORY[0x1E4F55C40]];
    uint64_t v7 = *MEMORY[0x1E4F55C48];
    v6 = &unk_1EFAFFEB8;
  }
  else
  {
    if (v4) {
      goto LABEL_10;
    }
    [v2 setObject:&unk_1EFAFFEA0 forKeyedSubscript:*MEMORY[0x1E4F55C40]];
    [v3 setObject:&unk_1EFAFFEB8 forKeyedSubscript:*MEMORY[0x1E4F55C48]];
    [v3 setObject:*(void *)(a1 + 128) forKeyedSubscript:*MEMORY[0x1E4F55C38]];
    uint64_t v5 = *(void *)(a1 + 136);
    if (v5) {
      [v3 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F55C28]];
    }
    v6 = (void *)[NSNumber numberWithInt:*(unsigned int *)(a1 + 152)];
    uint64_t v7 = *MEMORY[0x1E4F55C30];
  }
  [v3 setObject:v6 forKeyedSubscript:v7];
LABEL_10:
  uint64_t v8 = *(uint64_t (**)(void, __CFString *, void *, uint64_t *))(a1 + 96);
  if (!v8)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    uint64_t v15 = 0;
    goto LABEL_24;
  }
  if (*(_DWORD *)(a1 + 144)) {
    id v9 = @"TMBNR";
  }
  else {
    id v9 = @"SIS";
  }
  uint64_t v10 = v8(*MEMORY[0x1E4F1CF80], v9, v3, &v17);
  if (v10)
  {
    uint64_t v15 = v10;
    fig_log_get_emitter();
    goto LABEL_23;
  }
  uint64_t v11 = v17;
  *(void *)(a1 + 104) = v17;
  uint64_t v12 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v12) {
    uint64_t v13 = v12;
  }
  else {
    uint64_t v13 = 0;
  }
  int v14 = *(uint64_t (**)(uint64_t, uint64_t (*)(), uint64_t))(v13 + 8);
  if (!v14)
  {
    uint64_t v15 = 4294954514;
LABEL_22:
    fig_log_get_emitter();
LABEL_23:
    FigDebugAssert3();
    goto LABEL_24;
  }
  uint64_t v15 = v14(v11, sisn_processorOutputReadyCallback, a1);
  if (v15) {
    goto LABEL_22;
  }
LABEL_24:

  return v15;
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  if (!a3 || !self->_sampleBufferProcessor) {
    return;
  }
  v6 = (void *)CMGetAttachment(a3, @"StillImageSettings", 0);
  if (!v6) {
    goto LABEL_52;
  }
  if (!self->_currentCaptureSettings) {
    self->_currentCaptureSettings = (FigCaptureStillImageSettings *)v6;
  }
  uint64_t v7 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  if (!v7) {
    goto LABEL_52;
  }
  uint64_t v8 = v7;
  int v9 = objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E4F53D38]), "intValue");
  int v10 = objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E4F54138]), "BOOLValue");
  uint64_t v11 = objc_msgSend((id)objc_msgSend((id)CMGetAttachment(a3, @"BWStillImageCaptureSettings", 0), "captureStreamSettingsForPortType:", objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E4F54128])), "bracketSettings");
  if (!v11) {
    goto LABEL_52;
  }
  uint64_t v12 = v11;
  int v13 = [v11 providePreBracketedEV0];
  int v14 = [v12 bracketFrameCount];
  int v15 = objc_msgSend((id)CMGetAttachment(a3, @"StillImageCaptureType", 0), "intValue");
  if (v15 == 4) {
    uint64_t v16 = 1;
  }
  else {
    uint64_t v16 = 2;
  }
  if (v15 == 5 && self->_alwaysRequestsPreBracketedEV0) {
    int v13 = 0;
  }
  int lastFusionTypeUsed = self->_lastFusionTypeUsed;
  if (lastFusionTypeUsed && v16 != lastFusionTypeUsed)
  {
    sampleBufferProcessor = self->_sampleBufferProcessor;
    if (sampleBufferProcessor)
    {
      uint64_t v19 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v19) {
        uint64_t v20 = v19;
      }
      else {
        uint64_t v20 = 0;
      }
      v21 = *(void (**)(OpaqueFigSampleBufferProcessor *, void, void))(v20 + 8);
      if (v21) {
        v21(sampleBufferProcessor, 0, 0);
      }
      uint64_t FigBaseObject = FigSampleBufferProcessorGetFigBaseObject();
      if (FigBaseObject)
      {
        uint64_t v23 = FigBaseObject;
        uint64_t v24 = *(void *)(CMBaseObjectGetVTable() + 8);
        uint64_t v25 = v24 ? v24 : 0;
        v26 = *(void (**)(uint64_t))(v25 + 24);
        if (v26) {
          v26(v23);
        }
      }
      v27 = self->_sampleBufferProcessor;
      if (v27)
      {
        CFRelease(v27);
        self->_sampleBufferProcessor = 0;
      }
    }
    -[BWSISNode _setupSampleBufferProcessor]((uint64_t)self);
  }
  self->_int lastFusionTypeUsed = v16;
  if (!self->_numberFramesReceived)
  {
    uint64_t v34 = [NSNumber numberWithInt:v16];
    uint64_t v35 = FigSampleBufferProcessorGetFigBaseObject();
    uint64_t v36 = *(void *)(CMBaseObjectGetVTable() + 8);
    uint64_t v37 = v36 ? v36 : 0;
    v38 = *(void (**)(uint64_t, void, uint64_t))(v37 + 56);
    if (v38) {
      v38(v35, *MEMORY[0x1E4F55C58], v34);
    }
  }
  if (!v10)
  {
    if (v9 < 1 || v9 > v14) {
      return;
    }
    int v32 = self->_numberFramesReceived + 1;
    self->_numberFramesReceived = v32;
    if (v9 == v14)
    {
      if (v13) {
        BOOL preBracketedFrameReceived = self->_preBracketedFrameReceived;
      }
      else {
        BOOL preBracketedFrameReceived = 1;
      }
      if (v32 != v9 || !preBracketedFrameReceived)
      {
        fig_log_get_emitter();
        FigDebugAssert3();
        goto LABEL_64;
      }
      CMSetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53048], (CFTypeRef)*MEMORY[0x1E4F1CFD0], 0);
    }
    v40 = self->_sampleBufferProcessor;
    uint64_t v41 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v41) {
      uint64_t v42 = v41;
    }
    else {
      uint64_t v42 = 0;
    }
    v43 = *(unsigned int (**)(OpaqueFigSampleBufferProcessor *, opaqueCMSampleBuffer *))(v42 + 16);
    if (!v43 || v43(v40, a3))
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    if (v9 != v14) {
      return;
    }
LABEL_64:
    -[BWSISNode _clearCaptureRequestState]((uint64_t)self);
    return;
  }
  if (self->_alwaysRequestsPreBracketedEV0) {
    int v28 = v13;
  }
  else {
    int v28 = 1;
  }
  if (v28 == 1)
  {
    self->_BOOL preBracketedFrameReceived = 1;
    v29 = self->_sampleBufferProcessor;
    uint64_t v30 = *(void *)(CMBaseObjectGetVTable() + 16);
    uint64_t v31 = v30 ? v30 : 0;
    v39 = *(unsigned int (**)(OpaqueFigSampleBufferProcessor *, opaqueCMSampleBuffer *))(v31 + 16);
    if (!v39 || v39(v29, a3))
    {
LABEL_52:
      fig_log_get_emitter();
      FigDebugAssert3();
    }
  }
}

- (void)handleNodeError:(id)a3 forInput:(id)a4
{
  currentCaptureSettings = self->_currentCaptureSettings;
  if (currentCaptureSettings)
  {
    if (currentCaptureSettings == (FigCaptureStillImageSettings *)objc_msgSend((id)objc_msgSend(a3, "stillImageSettings", a3, a4), "requestedSettings"))
    {
      -[BWSISNode _clearCaptureRequestState]((uint64_t)self);
      if (self->_sampleBufferProcessor)
      {
        uint64_t FigBaseObject = FigSampleBufferProcessorGetFigBaseObject();
        uint64_t v9 = *(void *)(CMBaseObjectGetVTable() + 8);
        uint64_t v10 = v9 ? v9 : 0;
        uint64_t v11 = *(void (**)(uint64_t, void, void))(v10 + 56);
        if (v11) {
          v11(FigBaseObject, *MEMORY[0x1E4F55C68], *MEMORY[0x1E4F1CFD0]);
        }
      }
    }
  }
  output = self->super._output;
  -[BWNodeOutput emitNodeError:](output, "emitNodeError:", a3, a4);
}

- (BOOL)attachesInputBracketToOutputSampleBuffer
{
  return 0;
}

- (void)setAlwaysRequestsPreBracketedEV0:(BOOL)a3
{
  self->_alwaysRequestsPreBracketedEV0 = a3;
}

- (BOOL)alwaysRequestsPreBracketedEV0
{
  return self->_alwaysRequestsPreBracketedEV0;
}

- (void)setLivePhotoSupported:(BOOL)a3
{
  self->_livePhotoSupported = a3;
}

- (BOOL)livePhotoSupported
{
  return self->_livePhotoSupported;
}

- (void)setOISSupported:(BOOL)a3
{
  self->_OISSupported = a3;
}

- (BOOL)OISSupported
{
  return self->_OISSupported;
}

- (void)setAllowAllocationsAtPrepareTime:(BOOL)a3
{
  self->_allowAllocationsAtPrepareTime = a3;
}

- (BOOL)allowAllocationsAtPrepareTime
{
  return self->_allowAllocationsAtPrepareTime;
}

- (void)_sampleBufferProcessorOutputReady:(const void *)a3 sampleBuffer:
{
  if (!a1) {
    return;
  }
  uint64_t v4 = a2;
  CFTypeRef value = 0;
  CFTypeRef cf = 0;
  if (a2)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_25;
  }
  if (!*(_DWORD *)(a1 + 144) && [*(id *)(a1 + 208) noiseReductionEnabled])
  {
    uint64_t v6 = *MEMORY[0x1E4F1CF80];
    uint64_t FigBaseObject = FigSampleBufferProcessorGetFigBaseObject();
    uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v8) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = 0;
    }
    uint64_t v10 = *(void (**)(uint64_t, void, uint64_t, CFTypeRef *))(v9 + 48);
    if (v10)
    {
      CFStringRef v11 = (const __CFString *)*MEMORY[0x1E4F55C50];
      v10(FigBaseObject, *MEMORY[0x1E4F55C50], v6, &value);
      if (value) {
        CMSetAttachment(a3, v11, value, 0);
      }
    }
    uint64_t v12 = FigSampleBufferProcessorGetFigBaseObject();
    uint64_t v13 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v13) {
      uint64_t v14 = v13;
    }
    else {
      uint64_t v14 = 0;
    }
    int v15 = *(uint64_t (**)(uint64_t, void, uint64_t, CFTypeRef *))(v14 + 48);
    if (v15)
    {
      uint64_t v4 = v15(v12, *MEMORY[0x1E4F55C60], v6, &cf);
      if (cf) {
        CMSetAttachment(a3, @"NoiseReductionAlternateMetadata", cf, 0);
      }
      if (!v4) {
        goto LABEL_18;
      }
    }
    else
    {
      uint64_t v4 = 4294954514;
    }
LABEL_25:
    CFTypeRef v16 = CMGetAttachment(a3, @"StillSettings", 0);
    id v17 = +[BWNodeError newError:v4 sourceNode:a1 stillImageSettings:v16 metadata:CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0)];
    [*(id *)(a1 + 16) emitNodeError:v17];

    goto LABEL_19;
  }
LABEL_18:
  [*(id *)(a1 + 16) emitSampleBuffer:a3];
LABEL_19:
  if (value) {
    CFRelease(value);
  }
  if (cf) {
    CFRelease(cf);
  }
}

@end