@interface BWStereoFusionNode
+ (void)initialize;
- (BOOL)attachesInputBracketToOutputSampleBuffer;
- (BOOL)isCaptureRequestStateReset;
- (BWNodeInput)telephotoInput;
- (BWNodeInput)wideInput;
- (BWNodeOutput)defaultOutput;
- (BWNodeOutput)stereoHDROutput;
- (BWStereoFusionNode)initWithTelephotoSensorIDDictionary:(id)a3 cameraInfoByPortType:(id)a4;
- (OpaqueFigSampleBufferProcessor)sampleBufferProcessor;
- (id)_initWithTelephotoSensorIDDictionary:(id)a3 cameraInfoByPortType:(id)a4 sbpCreationFunction:(void *)a5 treatSoftErrorsAsHardErrors:(BOOL)a6;
- (id)nodeSubType;
- (id)nodeType;
- (uint64_t)_processSampleBufferInSampleBufferProcessor:(void *)a3 metadataDictionary:;
- (uint64_t)_processSequenceInSampleBufferProcessor;
- (uint64_t)_receivedExpectedNumberOfFramesOrErrors;
- (uint64_t)_sampleBufferProcessorOutputReady:(const void *)a3 sampleBuffer:;
- (uint64_t)_setExpectedInputFramesWithResolvedCaptureSettings:(uint64_t)result;
- (uint64_t)_setPropertyOnSampleBufferProcessorWithKey:(uint64_t)a3 value:;
- (uint64_t)_setupSampleBufferProcessor;
- (uint64_t)sbpOptionsDictionary;
- (void)_clearCaptureRequestState;
- (void)_endSequence;
- (void)_handleError:(uint64_t)a3 forSampleBuffer:(uint64_t)a4 input:(uint64_t)a5 metadata:;
- (void)_setZoomRectangleOnSampleBufferProcessorIfNecessaryBasedOnMetadata:(uint64_t)a1 captureType:(void *)a2;
- (void)_setZoomRectangleOnSampleBufferProcessorWithRectangle:(double)a3;
- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5;
- (void)dealloc;
- (void)didReachEndOfDataForInput:(id)a3;
- (void)didSelectFormat:(id)a3 forInput:(id)a4;
- (void)handleNodeError:(id)a3 forInput:(id)a4;
- (void)prepareForCurrentConfigurationToBecomeLive;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
@end

@implementation BWStereoFusionNode

+ (void)initialize
{
}

- (BWStereoFusionNode)initWithTelephotoSensorIDDictionary:(id)a3 cameraInfoByPortType:(id)a4
{
  return (BWStereoFusionNode *)[(BWStereoFusionNode *)self _initWithTelephotoSensorIDDictionary:a3 cameraInfoByPortType:a4 sbpCreationFunction:sfn_createSampleBufferProcessorFunction treatSoftErrorsAsHardErrors:0];
}

- (id)_initWithTelephotoSensorIDDictionary:(id)a3 cameraInfoByPortType:(id)a4 sbpCreationFunction:(void *)a5 treatSoftErrorsAsHardErrors:(BOOL)a6
{
  v16.receiver = self;
  v16.super_class = (Class)BWStereoFusionNode;
  v9 = [(BWNode *)&v16 init];
  v10 = v9;
  if (v9)
  {
    v9->_createSampleBufferProcessorFunction = a5;
    v9->_telephotoSensorIDDictionary = (NSDictionary *)a3;
    v10->_cameraInfoByPortType = (NSDictionary *)[a4 copy];
    v10->_wideInput = [[BWNodeInput alloc] initWithMediaType:1986618469 node:v10 index:0];
    v11 = objc_alloc_init(BWVideoFormatRequirements);
    [(BWVideoFormatRequirements *)v11 setSupportedPixelFormats:&unk_1EFB034E8];
    [(BWNodeInput *)v10->_wideInput setFormatRequirements:v11];

    [(BWNodeInput *)v10->_wideInput setPassthroughMode:0];
    [(BWNodeInput *)v10->_wideInput setRetainedBufferCount:1];
    [(BWNodeInput *)v10->_wideInput setName:@"Wide"];
    [(BWNode *)v10 addInput:v10->_wideInput];

    v10->_telephotoInput = [[BWNodeInput alloc] initWithMediaType:1986618469 node:v10 index:1];
    v12 = objc_alloc_init(BWVideoFormatRequirements);
    [(BWVideoFormatRequirements *)v12 setSupportedPixelFormats:&unk_1EFB03500];
    [(BWNodeInput *)v10->_telephotoInput setFormatRequirements:v12];

    [(BWNodeInput *)v10->_telephotoInput setPassthroughMode:0];
    [(BWNodeInput *)v10->_telephotoInput setRetainedBufferCount:1];
    [(BWNodeInput *)v10->_telephotoInput setName:@"Telephoto"];
    [(BWNode *)v10 addInput:v10->_telephotoInput];

    v10->_defaultOutput = [[BWNodeOutput alloc] initWithMediaType:1986618469 node:v10];
    v13 = objc_alloc_init(BWVideoFormatRequirements);
    [(BWVideoFormatRequirements *)v13 setSupportedPixelFormats:&unk_1EFB03518];
    [(BWNodeOutput *)v10->_defaultOutput setFormatRequirements:v13];

    [(BWNodeOutput *)v10->_defaultOutput setProvidesPixelBufferPool:0];
    [(BWNodeOutput *)v10->_defaultOutput setPassthroughMode:0];
    [(BWNodeOutput *)v10->_defaultOutput setName:@"Default"];
    [(BWNode *)v10 addOutput:v10->_defaultOutput];

    v10->_stereoHDROutput = [[BWNodeOutput alloc] initWithMediaType:1986618469 node:v10];
    v14 = objc_alloc_init(BWVideoFormatRequirements);
    [(BWVideoFormatRequirements *)v14 setSupportedPixelFormats:&unk_1EFB03530];
    [(BWNodeOutput *)v10->_stereoHDROutput setFormatRequirements:v14];

    [(BWNodeOutput *)v10->_stereoHDROutput setProvidesPixelBufferPool:0];
    [(BWNodeOutput *)v10->_stereoHDROutput setPassthroughMode:0];
    [(BWNodeOutput *)v10->_stereoHDROutput setName:@"HDR"];
    [(BWNode *)v10 addOutput:v10->_stereoHDROutput];
  }
  return v10;
}

- (void)dealloc
{
  -[BWStereoFusionNode _clearCaptureRequestState]((uint64_t)self);
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

  v13.receiver = self;
  v13.super_class = (Class)BWStereoFusionNode;
  [(BWNode *)&v13 dealloc];
}

- (void)_clearCaptureRequestState
{
  if (a1)
  {

    *(void *)(a1 + 128) = 0;
    *(unsigned char *)(a1 + 168) = 0;
    *(unsigned char *)(a1 + 169) = 0;
    *(unsigned char *)(a1 + 170) = 0;
    *(unsigned char *)(a1 + 171) = 0;
    *(unsigned char *)(a1 + 172) = 0;

    *(void *)(a1 + 176) = 0;
    *(void *)(a1 + 184) = 0;

    *(void *)(a1 + 192) = 0;
    *(void *)(a1 + 200) = 0;
  }
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  v6 = objc_alloc_init(BWVideoFormatRequirements);
  v19[0] = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a3, "pixelFormat"));
  -[BWVideoFormatRequirements setSupportedPixelFormats:](v6, "setSupportedPixelFormats:", [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1]);
  -[BWVideoFormatRequirements setWidth:](v6, "setWidth:", [a3 width]);
  -[BWVideoFormatRequirements setHeight:](v6, "setHeight:", [a3 height]);
  [(BWVideoFormatRequirements *)v6 setSupportedCacheModes:+[BWVideoFormatRequirements cacheModesForOptimizedHWAccess]];
  if ([a3 colorSpaceProperties])
  {
    uint64_t v18 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(a3, "colorSpaceProperties"));
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
  }
  else
  {
    uint64_t v7 = 0;
  }
  [(BWVideoFormatRequirements *)v6 setSupportedColorSpaceProperties:v7];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v8 = [(BWNode *)self outputs];
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * v12++) setFormatRequirements:v6];
      }
      while (v10 != v12);
      uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (id)nodeType
{
  return @"Effect";
}

- (id)nodeSubType
{
  return @"StereoFusionProcessor";
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)BWStereoFusionNode;
  [(BWNode *)&v13 prepareForCurrentConfigurationToBecomeLive];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v3 = [(BWNode *)self inputs];
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v9 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(BWNodeInput **)(*((void *)&v9 + 1) + 8 * i);
        if (v8 != self->super._input) {
          [(BWFormat *)[(BWNodeInput *)v8 format] isEqual:[(BWNodeInput *)self->super._input format]];
        }
      }
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v9 objects:v14 count:16];
    }
    while (v5);
  }
  if (!self->_sampleBufferProcessor)
  {
    if (-[BWStereoFusionNode _setupSampleBufferProcessor]((uint64_t)self))
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
  uint64_t v11 = 0;
  uint64_t v2 = -[BWStereoFusionNode sbpOptionsDictionary](a1);
  if (!v2 || (v3 = *(uint64_t (**)(void, __CFString *, uint64_t, uint64_t *))(a1 + 96)) == 0)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
  uint64_t v4 = v3(*MEMORY[0x1E4F1CF80], @"StereoFusion", v2, &v11);
  if (v4)
  {
    uint64_t v9 = v4;
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  else
  {
    uint64_t v5 = v11;
    *(void *)(a1 + 104) = v11;
    uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v6) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t (*)(), uint64_t))(v7 + 8);
    if (v8) {
      return v8(v5, sfn_processorOutputReadyCallback, a1);
    }
    else {
      return 4294954514;
    }
  }
  return v9;
}

- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (-[BWNode allInputsHaveReachedState:](self, "allInputsHaveReachedState:", 1, a4, a5))
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v6 = [(BWNode *)self outputs];
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v11 + 1) + 8 * v10++) makeConfiguredFormatLive];
        }
        while (v8 != v10);
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

- (void)didReachEndOfDataForInput:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ([(BWNode *)self allInputsHaveReachedState:0])
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    uint64_t v4 = [(BWNode *)self outputs];
    uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v9 + 1) + 8 * v8++) markEndOfLiveOutput];
        }
        while (v6 != v8);
        uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  if (!a3)
  {
    uint64_t v8 = 0;
LABEL_29:
    -[BWStereoFusionNode _handleError:forSampleBuffer:input:metadata:]((uint64_t)self, 4294954516, (uint64_t)a3, (uint64_t)a4, (uint64_t)v8);
    goto LABEL_23;
  }
  uint64_t v7 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  uint64_t v8 = v7;
  if (!v7) {
    goto LABEL_29;
  }
  int v9 = objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E4F542E0]), "BOOLValue");
  if (!self->_sampleBufferProcessor) {
    goto LABEL_29;
  }
  int v10 = v9;
  long long v11 = (void *)CMGetAttachment(a3, @"StillSettings", 0);
  if (!v11) {
    goto LABEL_29;
  }
  long long v12 = v11;
  if (!self->_currentStillImageSettings) {
    goto LABEL_9;
  }
  uint64_t v13 = [v11 settingsID];
  if (v13 != [(BWStillImageSettings *)self->_currentStillImageSettings settingsID])
  {
    -[BWStereoFusionNode _setPropertyOnSampleBufferProcessorWithKey:value:]((uint64_t)self, *MEMORY[0x1E4F55C68], *MEMORY[0x1E4F1CFD0]);
    -[BWStereoFusionNode _clearCaptureRequestState]((uint64_t)self);
  }
  if (!self->_currentStillImageSettings)
  {
LABEL_9:
    uint64_t v14 = v12;
    self->_currentStillImageSettings = v14;
    -[BWStereoFusionNode _setExpectedInputFramesWithResolvedCaptureSettings:]((uint64_t)self, [(BWStillImageSettings *)v14 captureSettings]);
  }
  if (self->_masterInput) {
    int v15 = 0;
  }
  else {
    int v15 = v10;
  }
  if (v15 == 1) {
    self->_masterInput = (BWNodeInput *)a4;
  }
  if (self->_wideInput == a4) {
    uint64_t v16 = 169;
  }
  else {
    uint64_t v16 = 171;
  }
  v17 = (char *)self + v16;
  if (!*v17)
  {
    unsigned char *v17 = 1;
    if (self->_performSBPProcessing)
    {
      -[BWStereoFusionNode _processSampleBufferInSampleBufferProcessor:metadataDictionary:]((uint64_t)self, (uint64_t)a3, v8);
    }
    else if (objc_msgSend((id)objc_msgSend(v12, "requestedSettings"), "outputFormat"))
    {
      [(BWNodeOutput *)self->super._output emitSampleBuffer:a3];
    }
  }
LABEL_23:
  if (-[BWStereoFusionNode _receivedExpectedNumberOfFramesOrErrors]((uint64_t)self))
  {
    -[BWStereoFusionNode _endSequence]((uint64_t)self);
  }
}

- (uint64_t)_setPropertyOnSampleBufferProcessorWithKey:(uint64_t)a3 value:
{
  if (result)
  {
    uint64_t FigBaseObject = FigSampleBufferProcessorGetFigBaseObject();
    uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v6) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 56);
    if (v8)
    {
      return v8(FigBaseObject, a2, a3);
    }
    else
    {
      return 4294954514;
    }
  }
  return result;
}

- (uint64_t)_setExpectedInputFramesWithResolvedCaptureSettings:(uint64_t)result
{
  if (result)
  {
    v3 = (unsigned char *)result;
    uint64_t v4 = [a2 captureStreamSettingsForPortType:*MEMORY[0x1E4F52DD8]];
    uint64_t v5 = [a2 captureStreamSettingsForPortType:*MEMORY[0x1E4F52DF0]];
    v3[168] = v4 != 0;
    v3[170] = v5 != 0;
    result = [a2 captureFlags];
    v3[172] = (result & 0x400) != 0;
  }
  return result;
}

- (uint64_t)_processSampleBufferInSampleBufferProcessor:(void *)a3 metadataDictionary:
{
  if (result)
  {
    uint64_t v5 = result;
    objc_msgSend((id)objc_msgSend(*(id *)(result + 128), "captureSettings"), "captureType");
    -[BWStereoFusionNode _setZoomRectangleOnSampleBufferProcessorIfNecessaryBasedOnMetadata:captureType:](v5, a3);
    uint64_t v6 = *(void *)(v5 + 104);
    uint64_t VTable = CMBaseObjectGetVTable();
    uint64_t v9 = *(void *)(VTable + 16);
    result = VTable + 16;
    uint64_t v8 = v9;
    uint64_t v10 = v9 ? v8 : 0;
    long long v11 = *(uint64_t (**)(uint64_t, uint64_t))(v10 + 16);
    if (v11)
    {
      return v11(v6, a2);
    }
  }
  return result;
}

- (void)_handleError:(uint64_t)a3 forSampleBuffer:(uint64_t)a4 input:(uint64_t)a5 metadata:
{
  if (a1)
  {
    id v7 = +[BWNodeError newError:a2 sourceNode:a1 stillImageSettings:*(void *)(a1 + 128) metadata:a5];
    id v10 = v7;
    if (*(void *)(a1 + 136) == a4) {
      uint64_t v8 = &OBJC_IVAR___BWStereoFusionNode__nodeErrorsForWide;
    }
    else {
      uint64_t v8 = &OBJC_IVAR___BWStereoFusionNode__nodeErrorsForTelephoto;
    }
    id v9 = *(id *)(a1 + *v8);
    if (!v9)
    {
      id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      *(void *)(a1 + *v8) = v9;
      id v7 = v10;
    }
    [v9 addObject:v7];
  }
}

- (uint64_t)_receivedExpectedNumberOfFramesOrErrors
{
  if (result)
  {
    uint64_t v1 = result;
    if (*(void *)(result + 128))
    {
      BOOL v2 = !*(unsigned char *)(result + 168) || *(unsigned char *)(result + 169) || [*(id *)(result + 192) count] == 1;
      if (*(unsigned char *)(v1 + 170) && !*(unsigned char *)(v1 + 171))
      {
        BOOL v3 = [*(id *)(v1 + 200) count] == 1;
        return v2 & v3;
      }
    }
    else
    {
      BOOL v2 = 1;
    }
    BOOL v3 = 1;
    return v2 & v3;
  }
  return result;
}

- (void)_endSequence
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  if (!*(unsigned char *)(a1 + 169) && !*(unsigned char *)(a1 + 171))
  {
    uint64_t v2 = *(void *)(a1 + 184);
    if (!v2)
    {
      unint64_t v3 = [*(id *)(a1 + 192) count];
      unint64_t v4 = [*(id *)(a1 + 200) count];
      uint64_t v5 = &OBJC_IVAR___BWStereoFusionNode__wideInput;
      if (v3 < v4) {
        uint64_t v5 = &OBJC_IVAR___BWStereoFusionNode__telephotoInput;
      }
      uint64_t v2 = *(void *)(a1 + *v5);
      *(void *)(a1 + 184) = v2;
    }
    if (v2 == *(void *)(a1 + 136) && [*(id *)(a1 + 192) count] == 1)
    {
      uint64_t v6 = 192;
    }
    else
    {
      if (*(void *)(a1 + 184) != *(void *)(a1 + 144) || [*(id *)(a1 + 200) count] != 1)
      {
        id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        id v8 = +[BWNodeError newError:4294954516 sourceNode:a1 stillImageSettings:*(void *)(a1 + 128) metadata:0];
        if (v8) {
          [v7 addObject:v8];
        }

        goto LABEL_18;
      }
      uint64_t v6 = 200;
    }
    id v7 = *(id *)(a1 + v6);
    *(void *)(a1 + v6) = 0;
LABEL_18:
    id v9 = &OBJC_IVAR___BWStereoFusionNode__defaultOutput;
    if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 128), "captureSettings"), "captureType") == 3
      && (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 128), "captureSettings"), "captureFlags") & 0x400) != 0)
    {
      id v9 = &OBJC_IVAR___BWStereoFusionNode__stereoHDROutput;
    }
    id v10 = *(void **)(a1 + *v9);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v11 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v16 != v13) {
            objc_enumerationMutation(v7);
          }
          [v10 emitNodeError:*(void *)(*((void *)&v15 + 1) + 8 * i)];
        }
        uint64_t v12 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v12);
    }
  }
  if (*(unsigned char *)(a1 + 172) && (*(unsigned char *)(a1 + 169) || *(unsigned char *)(a1 + 171))) {
    -[BWStereoFusionNode _processSequenceInSampleBufferProcessor](a1);
  }
  -[BWStereoFusionNode _clearCaptureRequestState](a1);
}

- (void)handleNodeError:(id)a3 forInput:(id)a4
{
  if (self->_wideInput == a4) {
    uint64_t v6 = 192;
  }
  else {
    uint64_t v6 = 200;
  }
  id v7 = *(Class *)((char *)&self->super.super.isa + v6);
  if (!v7)
  {
    id v7 = (objc_class *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    *(Class *)((char *)&self->super.super.isa + v6) = v7;
  }
  [(objc_class *)v7 addObject:a3];
  if (self->_currentStillImageSettings
    || (id v8 = (BWStillImageSettings *)(id)[a3 stillImageSettings],
        self->_currentStillImageSettings = v8,
        -[BWStereoFusionNode _setExpectedInputFramesWithResolvedCaptureSettings:]((uint64_t)self, [(BWStillImageSettings *)v8 captureSettings]), self->_currentStillImageSettings))
  {
    if (-[BWStereoFusionNode _receivedExpectedNumberOfFramesOrErrors]((uint64_t)self))
    {
      -[BWStereoFusionNode _endSequence]((uint64_t)self);
    }
  }
  else
  {
    [(BWNodeOutput *)self->_defaultOutput emitNodeError:a3];
    stereoHDROutput = self->_stereoHDROutput;
    [(BWNodeOutput *)stereoHDROutput emitNodeError:a3];
  }
}

- (BOOL)attachesInputBracketToOutputSampleBuffer
{
  return 0;
}

- (uint64_t)sbpOptionsDictionary
{
  v5[3] = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = [*(id *)(result + 112) objectForKeyedSubscript:@"StereoFusionParameters"];
    if (v2)
    {
      uint64_t v3 = *MEMORY[0x1E4F55C18];
      v4[0] = *MEMORY[0x1E4F535B0];
      v4[1] = v3;
      v5[0] = v2;
      v5[1] = &unk_1EFAFFB88;
      v4[2] = *MEMORY[0x1E4F53560];
      v5[2] = *(void *)(v1 + 120);
      return [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:3];
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

- (BOOL)isCaptureRequestStateReset
{
  return !self->_currentStillImageSettings
      && !self->_expectsWideFrame
      && !self->_receivedWideFrame
      && !self->_expectsTelephotoFrame
      && !self->_receivedTelephotoFrame
      && !self->_performSBPProcessing
      && !self->_masterInput
      && !self->_nodeErrorsForWide
      && self->_nodeErrorsForTelephoto == 0;
}

- (OpaqueFigSampleBufferProcessor)sampleBufferProcessor
{
  return self->_sampleBufferProcessor;
}

- (uint64_t)_processSequenceInSampleBufferProcessor
{
  if (result)
  {
    uint64_t v1 = result;
    if (!*(void *)(result + 176)) {
      -[BWStereoFusionNode _setZoomRectangleOnSampleBufferProcessorWithRectangle:](result, 0.0, 0.0, 1.0, 1.0);
    }
    uint64_t v2 = *MEMORY[0x1E4F55908];
    return -[BWStereoFusionNode _setPropertyOnSampleBufferProcessorWithKey:value:](v1, v2, 0);
  }
  return result;
}

- (void)_setZoomRectangleOnSampleBufferProcessorIfNecessaryBasedOnMetadata:(uint64_t)a1 captureType:(void *)a2
{
  if (a1
    && objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E4F542E0]), "BOOLValue"))
  {
    unint64_t v4 = (void *)[a2 objectForKeyedSubscript:*MEMORY[0x1E4F54128]];
    if ([v4 isEqualToString:*MEMORY[0x1E4F52DD8]])
    {
      v10.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
      v10.size = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
      double width = 1.0;
      double y = 0.0;
      if (FigCFDictionaryGetCGRectIfPresent())
      {
        BOOL IsNull = CGRectIsNull(v10);
        double height = 1.0;
        double x = 0.0;
        if (!IsNull)
        {
          double y = v10.origin.y;
          double x = v10.origin.x;
          double height = v10.size.height;
          double width = v10.size.width;
        }
        goto LABEL_9;
      }
    }
    else
    {
      double width = 1.0;
      double y = 0.0;
    }
    double height = 1.0;
    double x = 0.0;
LABEL_9:
    -[BWStereoFusionNode _setZoomRectangleOnSampleBufferProcessorWithRectangle:](a1, x, y, width, height);
  }
}

- (void)_setZoomRectangleOnSampleBufferProcessorWithRectangle:(double)a3
{
  if (a1)
  {
    if (*(void *)(a1 + 176))
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      return;
    }
    CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(*(CGRect *)&a2);
    if (-[BWStereoFusionNode _setPropertyOnSampleBufferProcessorWithKey:value:](a1, *MEMORY[0x1E4F55C20], (uint64_t)DictionaryRepresentation))
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      if (!DictionaryRepresentation) {
        return;
      }
    }
    else
    {
      *(void *)(a1 + 176) = [(__CFDictionary *)DictionaryRepresentation copy];
      if (!DictionaryRepresentation) {
        return;
      }
    }
    CFRelease(DictionaryRepresentation);
  }
}

- (uint64_t)_sampleBufferProcessorOutputReady:(const void *)a3 sampleBuffer:
{
  if (result)
  {
    uint64_t v6 = result;
    id v7 = &OBJC_IVAR___BWStereoFusionNode__defaultOutput;
    if (objc_msgSend((id)objc_msgSend(*(id *)(result + 128), "captureSettings"), "captureType") == 3)
    {
      __int16 v8 = objc_msgSend((id)objc_msgSend(*(id *)(v6 + 128), "captureSettings"), "captureFlags");
      unint64_t v9 = (unint64_t)(v8 & 0x400) >> 10;
      if ((v8 & 0x400) != 0) {
        id v7 = &OBJC_IVAR___BWStereoFusionNode__stereoHDROutput;
      }
    }
    else
    {
      LOBYTE(v9) = 0;
    }
    CGRect v10 = *(void **)(v6 + *v7);
    if (a3) {
      BOOL v11 = a2 == 0;
    }
    else {
      BOOL v11 = 1;
    }
    if (v11) {
      uint64_t v12 = a2;
    }
    else {
      uint64_t v12 = 0;
    }
    uint64_t v13 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0);
    uint64_t v14 = v13;
    if (v13
      && (objc_msgSend((id)objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E4F542E0]), "BOOLValue") & 1) == 0)
    {
      if ((v9 & 1) != 0
        && !objc_msgSend((id)objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E4F54138]), "BOOLValue"))
      {
        CMSetAttachment(a3, @"StereoFusionFailed", (CFTypeRef)*MEMORY[0x1E4F1CFD0], 0);
      }
      else
      {
        long long v15 = (void *)[v14 objectForKeyedSubscript:*MEMORY[0x1E4F54128]];
        [v15 isEqualToString:*MEMORY[0x1E4F52DD8]];
      }
    }
    long long v16 = *(void **)(v6 + 176);
    *(void *)(v6 + 176) = 0;
    if (v12)
    {
      fig_log_get_emitter();
      LODWORD(v30) = v12;
      FigDebugAssert3();

      id v29 = +[BWNodeError newError:sourceNode:stillImageSettings:metadata:](BWNodeError, "newError:sourceNode:stillImageSettings:metadata:", v12, v6, *(void *)(v6 + 128), v14, v30, v3);
      [v10 emitNodeError:v29];
    }
    else
    {
      long long v17 = (double *)MEMORY[0x1E4F1DB20];
      CGSize v18 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
      rect.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
      rect.size = v18;
      if (CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)v16, &rect))
      {
        v33.origin.double x = 0.0;
        v33.origin.double y = 0.0;
        v33.size.double width = 1.0;
        v33.size.double height = 1.0;
        if (!CGRectEqualToRect(rect, v33))
        {
          unsigned int v19 = objc_msgSend((id)objc_msgSend(*(id *)(v6 + 128), "requestedSettings"), "outputWidth");
          uint64_t v31 = v19;
          uint64_t v20 = objc_msgSend((id)objc_msgSend(*(id *)(v6 + 128), "requestedSettings"), "outputHeight");
          double v21 = (double)v19 / (double)v20;
          uint64_t v22 = objc_msgSend((id)objc_msgSend(*(id *)(v6 + 8), "videoFormat"), "width");
          uint64_t v23 = objc_msgSend((id)objc_msgSend(*(id *)(v6 + 8), "videoFormat"), "height");
          FigCaptureMetadataUtilitiesComputeDenormalizedStillImageCropRect(v22, v23, rect.origin.x, rect.origin.y, rect.size.width, rect.size.height, v21);
          FigCaptureMetadataUtilitiesUpdateMetadataForStillImageCrop(v14, objc_msgSend((id)objc_msgSend(*(id *)(v6 + 8), "videoFormat"), "width") | ((unint64_t)objc_msgSend((id)objc_msgSend(*(id *)(v6 + 8), "videoFormat"), "height") << 32), v31 | (v20 << 32), v24, v25, v26, v27, *v17, v17[1], v17[2], v17[3]);
          FigCaptureMetadataUtilitiesPreventFurtherCropping(v14, v28);
        }
      }
      CMRemoveAttachment(a3, (CFStringRef)*MEMORY[0x1E4F530E0]);
      CMSetAttachment(a3, @"HasUnreliableBracketingMetadata", MEMORY[0x1E4F1CC38], 1u);

      [v10 emitSampleBuffer:a3];
    }
    return [+[BWAggdDataReporter sharedInstance] reportStereoFusionSampleBufferProcessorProcessingStatus:a2];
  }
  return result;
}

- (BWNodeInput)wideInput
{
  return self->_wideInput;
}

- (BWNodeInput)telephotoInput
{
  return self->_telephotoInput;
}

- (BWNodeOutput)defaultOutput
{
  return self->_defaultOutput;
}

- (BWNodeOutput)stereoHDROutput
{
  return self->_stereoHDROutput;
}

@end