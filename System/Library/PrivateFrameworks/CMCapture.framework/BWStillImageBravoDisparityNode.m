@interface BWStillImageBravoDisparityNode
+ (void)initialize;
- (BOOL)attachesInputBracketToOutputSampleBuffer;
- (BOOL)shouldComputeDisparityWhenCalibrationFails;
- (BWNodeInput)telephotoInput;
- (BWNodeInput)wideInput;
- (BWStillImageBravoDisparityNode)initWithNodeConfiguration:(id)a3 sensorConfigurationsByPortType:(id)a4 disparityMapWidth:(unint64_t)a5 disparityMapHeight:(unint64_t)a6 outputDisparityBufferCount:(int)a7;
- (id)nodeSubType;
- (id)nodeType;
- (uint64_t)_computeDisparityForTeleBuffer:(void *)a3 wideBuffer:(void *)a4 attachToOutputBuffer:;
- (uint64_t)_configureCurrentCaptureRequestStateWithStillImageSettings:(uint64_t)result;
- (uint64_t)_loadAndConfigureDisparityGenerator;
- (uint64_t)_resolveProcessingMode;
- (uint64_t)processorOptionsDictionary;
- (void)_clearCaptureRequestState;
- (void)_handleError:(CMAttachmentBearerRef)target duringProcessingOfSampleBuffer:(uint64_t)a4 fromInput:;
- (void)_processBuffersForDisparityIfNecessary;
- (void)_sensorConfigurationWithPortraitTuningParameters;
- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5;
- (void)dealloc;
- (void)didReachEndOfDataForInput:(id)a3;
- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5;
- (void)handleNodeError:(id)a3 forInput:(id)a4;
- (void)prepareForCurrentConfigurationToBecomeLive;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
- (void)setShouldComputeDisparityWhenCalibrationFails:(BOOL)a3;
@end

@implementation BWStillImageBravoDisparityNode

+ (void)initialize
{
}

- (BWStillImageBravoDisparityNode)initWithNodeConfiguration:(id)a3 sensorConfigurationsByPortType:(id)a4 disparityMapWidth:(unint64_t)a5 disparityMapHeight:(unint64_t)a6 outputDisparityBufferCount:(int)a7
{
  v24[2] = *MEMORY[0x1E4F143B8];
  v23.receiver = self;
  v23.super_class = (Class)BWStillImageBravoDisparityNode;
  v12 = [(BWNode *)&v23 init];
  if (v12)
  {
    v12->_sensorConfigurationsByPortType = (NSDictionary *)a4;
    v12->_nodeConfiguration = (BWStillImageNodeConfiguration *)a3;
    v12->_wideInput = [[BWNodeInput alloc] initWithMediaType:1986618469 node:v12 index:0];
    v13 = objc_alloc_init(BWVideoFormatRequirements);
    [(BWVideoFormatRequirements *)v13 setSupportedPixelFormats:&unk_1EFB04550];
    [(BWNodeInput *)v12->_wideInput setFormatRequirements:v13];

    [(BWNodeInput *)v12->_wideInput setPassthroughMode:0];
    [(BWNodeInput *)v12->_wideInput setRetainedBufferCount:1];
    [(BWNodeInput *)v12->_wideInput setName:@"Wide"];
    [(BWNode *)v12 addInput:v12->_wideInput];

    v12->_telephotoInput = [[BWNodeInput alloc] initWithMediaType:1986618469 node:v12 index:1];
    v14 = objc_alloc_init(BWVideoFormatRequirements);
    [(BWVideoFormatRequirements *)v14 setSupportedPixelFormats:&unk_1EFB04568];
    [(BWNodeInput *)v12->_telephotoInput setFormatRequirements:v14];

    [(BWNodeInput *)v12->_telephotoInput setPassthroughMode:1];
    [(BWNodeInput *)v12->_telephotoInput setRetainedBufferCount:1];
    [(BWNodeInput *)v12->_telephotoInput setName:@"Telephoto"];
    [(BWNode *)v12 addInput:v12->_telephotoInput];

    v15 = [[BWNodeOutput alloc] initWithMediaType:1986618469 node:v12];
    v16 = [(BWNodeOutput *)v15 primaryMediaConfiguration];
    v17 = objc_alloc_init(BWVideoFormatRequirements);
    [(BWVideoFormatRequirements *)v17 setSupportedPixelFormats:&unk_1EFB04580];
    [(BWNodeOutputMediaConfiguration *)v16 setFormatRequirements:v17];

    [(BWNodeOutputMediaConfiguration *)v16 setProvidesPixelBufferPool:0];
    [(BWNodeOutputMediaConfiguration *)v16 setPassthroughMode:1];
    v24[0] = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[BWNodeInput index](v12->_wideInput, "index"));
    v24[1] = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[BWNodeInput index](v12->_telephotoInput, "index"));
    -[BWNodeOutputMediaConfiguration setIndexesOfInputsWhichDrivesThisOutput:](v16, "setIndexesOfInputsWhichDrivesThisOutput:", [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2]);
    v18 = objc_alloc_init(BWNodeOutputMediaConfiguration);
    v19 = objc_alloc_init(BWVideoFormatRequirements);
    [(BWVideoFormatRequirements *)v19 setSupportedPixelFormats:&unk_1EFB04598];
    [(BWVideoFormatRequirements *)v19 setWidth:a5];
    [(BWVideoFormatRequirements *)v19 setHeight:a6];
    [(BWNodeOutputMediaConfiguration *)v18 setFormatRequirements:v19];
    [(BWNodeOutputMediaConfiguration *)v18 setPassthroughMode:0];
    [(BWNodeOutputMediaConfiguration *)v18 setProvidesPixelBufferPool:1];
    if (a7) {
      [(BWNodeOutputMediaConfiguration *)v18 setOwningNodeRetainedBufferCount:(a7 - 1)];
    }
    [(BWNodeOutput *)v15 setMediaConfiguration:v18 forAttachedMediaKey:@"Depth"];
    int v20 = [(BWStillImageNodeConfiguration *)v12->_nodeConfiguration depthDataType];
    v12->_disparityInputIsRaw = v20 == 2;
    if (v20 == 2)
    {
      v21 = objc_alloc_init(BWNodeInputMediaConfiguration);
      [(BWNodeInputMediaConfiguration *)v21 setFormatRequirements:objc_alloc_init(BWVideoFormatRequirements)];
      [(BWNodeInputMediaConfiguration *)v21 setPassthroughMode:0];
      [(BWNodeInput *)v12->super._input setMediaConfiguration:v21 forAttachedMediaKey:0x1EFA74380];
    }
    [(BWNode *)v12 addOutput:v15];

    v12->_disparityMapWidth = a5;
    v12->_disparityMapHeight = a6;
  }
  return v12;
}

- (void)dealloc
{
  if (self) {
    objc_msgSend((id)-[FigDisparityGenerator metalContext](self->_disparityGenerator, "metalContext"), "waitForIdle");
  }
  -[BWStillImageBravoDisparityNode _clearCaptureRequestState]((uint64_t)self);

  disparityFormatDescription = self->_disparityFormatDescription;
  if (disparityFormatDescription) {
    CFRelease(disparityFormatDescription);
  }

  v4.receiver = self;
  v4.super_class = (Class)BWStillImageBravoDisparityNode;
  [(BWNode *)&v4 dealloc];
}

- (void)_clearCaptureRequestState
{
  if (a1)
  {

    *(void *)(a1 + 152) = 0;
    *(_DWORD *)(a1 + 168) = 0;
    *(_DWORD *)(a1 + 160) = 0;
    *(_DWORD *)(a1 + 164) = 0;
    *(unsigned char *)(a1 + 193) = 0;
    v2 = *(const void **)(a1 + 176);
    if (v2)
    {
      CFRelease(v2);
      *(void *)(a1 + 176) = 0;
    }
    v3 = *(const void **)(a1 + 184);
    if (v3)
    {
      CFRelease(v3);
      *(void *)(a1 + 184) = 0;
    }
    objc_super v4 = *(const void **)(a1 + 200);
    if (v4)
    {
      CFRelease(v4);
      *(void *)(a1 + 200) = 0;
    }
    v5 = *(const void **)(a1 + 208);
    if (v5)
    {
      CFRelease(v5);
      *(void *)(a1 + 208) = 0;
    }
  }
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5
{
  if (self->_telephotoInput == a4 && ([a5 isEqualToString:0x1EFA74380] & 1) == 0)
  {
    v8 = [(BWNodeOutput *)self->super._output mediaPropertiesForAttachedMediaKey:a5];
    if (!v8)
    {
      v8 = objc_alloc_init(BWNodeOutputMediaProperties);
      [(BWNodeOutput *)self->super._output _setMediaProperties:v8 forAttachedMediaKey:a5];
    }
    [(BWNodeOutputMediaProperties *)v8 setResolvedFormat:a3];
  }
}

- (id)nodeType
{
  return @"Effect";
}

- (id)nodeSubType
{
  return @"DisparityGenerator";
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)BWStillImageBravoDisparityNode;
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
        v8 = *(BWNodeInput **)(*((void *)&v9 + 1) + 8 * i);
        if (v8 != self->super._input) {
          [(BWFormat *)[(BWNodeInput *)v8 format] isEqual:[(BWNodeInput *)self->super._input format]];
        }
      }
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v9 objects:v14 count:16];
    }
    while (v5);
  }
  if (-[BWStillImageBravoDisparityNode _loadAndConfigureDisparityGenerator]((uint64_t)self))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
}

- (uint64_t)_loadAndConfigureDisparityGenerator
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v21 = 0;
    uint64_t v2 = -[BWStillImageBravoDisparityNode processorOptionsDictionary](result);
    if (!v2) {
      goto LABEL_11;
    }
    uint64_t v3 = v2;
    uint64_t v4 = +[FigCaptureCameraParameters sharedInstance];
    uint64_t v5 = [(FigCaptureCameraParameters *)v4 disparityVersion];
    if (!v5)
    {
      uint64_t v6 = -[BWStillImageBravoDisparityNode _sensorConfigurationWithPortraitTuningParameters](v1);
      if (!v6)
      {
        fig_log_get_emitter();
        FigDebugAssert3();
        return 0;
      }
      uint64_t v5 = -[FigCaptureCameraParameters disparityVersionForPortType:sensorIDString:](v4, "disparityVersionForPortType:sensorIDString:", [v6 portType], objc_msgSend(v6, "sensorIDString"));
    }
    uint64_t v7 = [NSString stringWithFormat:@"%@/%@V%d.bundle", @"/System/Library/VideoProcessors", @"Disparity", v5];
    v8 = (void *)[MEMORY[0x1E4F28B50] bundleWithPath:v7];
    if (v8)
    {
      long long v9 = v8;
      if (![v8 loadAndReturnError:&v21]) {
        return 4294954510;
      }
      long long v10 = objc_msgSend(objc_alloc((Class)objc_msgSend(v9, "principalClass")), "initWithCommandQueue:", objc_msgSend(*(id *)(v1 + 224), "metalCommandQueue"));
      *(void *)(v1 + 104) = v10;
      if (v10)
      {
        [v10 setOptions:v3];
        uint64_t v11 = objc_msgSend((id)objc_msgSend(*(id *)(v1 + 8), "videoFormat"), "width");
        uint64_t v12 = objc_msgSend((id)objc_msgSend(*(id *)(v1 + 8), "videoFormat"), "height");
        uint64_t v13 = *(void *)(v1 + 128);
        uint64_t v14 = *(void *)(v1 + 136);
        uint64_t v15 = *(void **)(v1 + 104);
        v17[0] = v11;
        v17[1] = v12;
        v17[2] = 0;
        v17[3] = v13;
        v17[4] = v14;
        int v18 = 1067030938;
        uint64_t v19 = 0x1800000020;
        int v20 = 0;
        [v15 setDisparityConfig:v17];
        int v16 = [*(id *)(v1 + 104) prepareToProcess:0];
        result = 0;
        if (!v16) {
          return result;
        }
        return FigSignalErrorAt();
      }
      fig_log_get_emitter();
    }
    else
    {
LABEL_11:
      fig_log_get_emitter();
    }
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
  return result;
}

- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5
{
  if (-[BWNode allInputsHaveReachedState:](self, "allInputsHaveReachedState:", 1, a4, a5))
  {
    output = self->super._output;
    [(BWNodeOutput *)output makeConfiguredFormatLive];
  }
}

- (void)didReachEndOfDataForInput:(id)a3
{
  if ([(BWNode *)self allInputsHaveReachedState:0])
  {
    output = self->super._output;
    [(BWNodeOutput *)output markEndOfLiveOutput];
  }
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  if (!a3) {
    goto LABEL_21;
  }
  uint64_t v7 = (void *)CMGetAttachment(a3, @"StillSettings", 0);
  if (!v7) {
    goto LABEL_21;
  }
  v8 = v7;
  if (!self->_currentStillImageSettings
    || (uint64_t v9 = [v7 settingsID],
        v9 != [(BWStillImageSettings *)self->_currentStillImageSettings settingsID]))
  {
    -[BWStillImageBravoDisparityNode _configureCurrentCaptureRequestStateWithStillImageSettings:]((uint64_t)self, v8);
  }
  if (!self->_processingMode) {
    goto LABEL_14;
  }
  if (self->_disparityInputIsRaw && !BWSampleBufferGetAttachedMedia(a3, 0x1EFA74380))
  {
LABEL_21:
    -[BWStillImageBravoDisparityNode _handleError:duringProcessingOfSampleBuffer:fromInput:](self, 4294954516, a3, (uint64_t)a4);
    goto LABEL_14;
  }
  if (self->_wideInput == a4)
  {
    long long v10 = (objc_class *)CFRetain(a3);
    uint64_t v11 = 184;
  }
  else
  {
    if (self->_telephotoInput != a4) {
      goto LABEL_14;
    }
    long long v10 = (objc_class *)CFRetain(a3);
    uint64_t v11 = 176;
  }
  *(Class *)((char *)&self->super.super.isa + v11) = v10;
LABEL_14:
  if (self->_processingMode)
  {
    -[BWStillImageBravoDisparityNode _processBuffersForDisparityIfNecessary]((uint64_t)self);
  }
  else
  {
    [(BWNodeOutput *)self->super._output emitSampleBuffer:a3];
    -[BWStillImageBravoDisparityNode _clearCaptureRequestState]((uint64_t)self);
  }
}

- (uint64_t)_configureCurrentCaptureRequestStateWithStillImageSettings:(uint64_t)result
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v3 = result;
    -[BWStillImageBravoDisparityNode _clearCaptureRequestState](result);
    *(void *)(v3 + 152) = a2;
    *(unsigned char *)(v3 + 192) = 1;
    *(unsigned char *)(v3 + 193) = 0;
    if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(v3 + 152), "requestedSettings"), "bravoConstituentImageDeliveryDeviceTypes"), "count"))
    {
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      uint64_t v4 = objc_msgSend((id)objc_msgSend(*(id *)(v3 + 152), "captureSettings", 0), "captureStreamSettings");
      uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = *(void *)v15;
        uint64_t v8 = *MEMORY[0x1E4F52DF0];
        while (2)
        {
          uint64_t v9 = 0;
          do
          {
            if (*(void *)v15 != v7) {
              objc_enumerationMutation(v4);
            }
            if (objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v9), "portType"), "isEqualToString:", v8))
            {
              uint64_t v10 = 2;
              uint64_t v11 = 3;
              goto LABEL_13;
            }
            ++v9;
          }
          while (v6 != v9);
          uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
          if (v6) {
            continue;
          }
          break;
        }
      }
      uint64_t v10 = 7;
      uint64_t v11 = 2;
LABEL_13:
      uint64_t v12 = objc_msgSend((id)objc_msgSend(*(id *)(v3 + 152), "requestedSettings"), "bravoConstituentImageDeliveryDeviceTypes");
      *(unsigned char *)(v3 + 192) = objc_msgSend(v12, "containsObject:", objc_msgSend(NSNumber, "numberWithInt:", v11));
      uint64_t v13 = objc_msgSend((id)objc_msgSend(*(id *)(v3 + 152), "requestedSettings"), "bravoConstituentImageDeliveryDeviceTypes");
      *(unsigned char *)(v3 + 193) = objc_msgSend(v13, "containsObject:", objc_msgSend(NSNumber, "numberWithInt:", v10));
    }
    return -[BWStillImageBravoDisparityNode _resolveProcessingMode](v3);
  }
  return result;
}

- (void)_handleError:(CMAttachmentBearerRef)target duringProcessingOfSampleBuffer:(uint64_t)a4 fromInput:
{
  if (result)
  {
    uint64_t v5 = result;
    result = +[BWNodeError newError:a2 sourceNode:v5 stillImageSettings:v5[19] metadata:CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53070], 0)];
    if (v5[14] == a4) {
      uint64_t v6 = &OBJC_IVAR___BWStillImageBravoDisparityNode__errorForWide;
    }
    else {
      uint64_t v6 = &OBJC_IVAR___BWStillImageBravoDisparityNode__errorForTele;
    }
    *(void *)((char *)v5 + *v6) = result;
  }
  return result;
}

- (void)_processBuffersForDisparityIfNecessary
{
  if (!a1) {
    return;
  }
  if (*(_DWORD *)(a1 + 168))
  {
    if (*(void *)(a1 + 104))
    {
      uint64_t v3 = *(void **)(a1 + 208);
      if (!v3)
      {
        uint64_t v6 = 0;
        goto LABEL_11;
      }
      if (!*(void *)(a1 + 184))
      {
        uint64_t v4 = *(void **)(a1 + 200);
        id v5 = v3;
        goto LABEL_8;
      }
      id v18 = v3;
    }
    else
    {
      id v18 = +[BWNodeError newError:4294954516 sourceNode:a1 stillImageSettings:*(void *)(a1 + 152) metadata:0];
    }
    uint64_t v6 = v18;
LABEL_52:
    [*(id *)(a1 + 16) emitNodeError:v6];
    char v10 = 0;
    LODWORD(v11) = 1;
LABEL_27:
    if (*(unsigned char *)(a1 + 193))
    {
      uint64_t v12 = *(const void **)(a1 + 184);
      if (v12)
      {
        BWSampleBufferRemoveAttachedMedia(v12, 0x1EFA74380);
        [*(id *)(a1 + 16) emitSampleBuffer:*(void *)(a1 + 184)];
      }
      else
      {
        id v13 = *(id *)(a1 + 200);
        if (!v13) {
          id v13 = +[BWNodeError newError:4294954516 sourceNode:a1 stillImageSettings:*(void *)(a1 + 152) metadata:0];
        }
        objc_msgSend(*(id *)(a1 + 16), "emitNodeError:", v13, v19, v20);
      }
    }
    goto LABEL_34;
  }
  uint64_t v4 = *(void **)(a1 + 208);
  id v5 = v4;
LABEL_8:
  uint64_t v6 = v5;
  if (v4) {
    goto LABEL_52;
  }
LABEL_11:
  int v7 = *(_DWORD *)(a1 + 168);
  if ((v7 - 2) >= 2 && v7 != 1 && v7 != 4)
  {
    char v10 = 0;
    LODWORD(v11) = 0;
    goto LABEL_34;
  }
  uint64_t v11 = *(const void **)(a1 + 176);
  if (v11)
  {
    uint64_t v9 = *(void **)(a1 + 184);
    if (v9)
    {
      -[BWStillImageBravoDisparityNode _computeDisparityForTeleBuffer:wideBuffer:attachToOutputBuffer:](a1, *(const void **)(a1 + 176), v9, *(void **)(a1 + 176));
      char v10 = 1;
LABEL_22:
      if (*(unsigned char *)(a1 + 192))
      {
        if (!*(void *)(a1 + 176))
        {
          fig_log_get_emitter();
          uint64_t v20 = v1;
          LODWORD(v19) = 0;
          FigDebugAssert3();
        }
        BWSampleBufferRemoveAttachedMedia(v11, 0x1EFA74380);
        [*(id *)(a1 + 16) emitSampleBuffer:v11];
      }
      LODWORD(v11) = 0;
      goto LABEL_27;
    }
    char v10 = 0;
    if (*(void *)(a1 + 200)) {
      goto LABEL_22;
    }
    LODWORD(v11) = 0;
  }
  else
  {
    char v10 = 0;
  }
LABEL_34:
  if ((v10 & 1) != 0 || v11)
  {
    long long v14 = *(const void **)(a1 + 176);
    if (v14)
    {
      CFRelease(v14);
      *(void *)(a1 + 176) = 0;
    }
    long long v15 = *(const void **)(a1 + 184);
    if (v15)
    {
      CFRelease(v15);
      *(void *)(a1 + 184) = 0;
    }
    long long v16 = *(const void **)(a1 + 208);
    if (v16)
    {
      CFRelease(v16);
      *(void *)(a1 + 208) = 0;
    }
    long long v17 = *(const void **)(a1 + 200);
    if (v17)
    {
      CFRelease(v17);
      *(void *)(a1 + 200) = 0;
    }

    ++*(_DWORD *)(a1 + 164);
  }
  if (*(_DWORD *)(a1 + 160) == *(_DWORD *)(a1 + 164))
  {
    -[BWStillImageBravoDisparityNode _clearCaptureRequestState](a1);
  }
}

- (void)handleNodeError:(id)a3 forInput:(id)a4
{
  if (!self->_currentStillImageSettings
    || (uint64_t v7 = objc_msgSend((id)objc_msgSend(a3, "stillImageSettings"), "settingsID"),
        v7 != [(BWStillImageSettings *)self->_currentStillImageSettings settingsID]))
  {
    -[BWStillImageBravoDisparityNode _configureCurrentCaptureRequestStateWithStillImageSettings:]((uint64_t)self, (void *)[a3 stillImageSettings]);
  }
  if (self->_currentStillImageSettings)
  {
    if (self->_wideInput == a4) {
      self->_errorForWide = (BWNodeError *)a3;
    }
    if (self->_telephotoInput == a4)
    {

      self->_errorForTele = (BWNodeError *)a3;
    }
    -[BWStillImageBravoDisparityNode _processBuffersForDisparityIfNecessary]((uint64_t)self);
  }
  else
  {
    output = self->super._output;
    [(BWNodeOutput *)output emitNodeError:a3];
  }
}

- (void)setShouldComputeDisparityWhenCalibrationFails:(BOOL)a3
{
  self->_shouldComputeDisparityWhenCalibrationFails = a3;
}

- (BOOL)shouldComputeDisparityWhenCalibrationFails
{
  return self->_shouldComputeDisparityWhenCalibrationFails;
}

- (BOOL)attachesInputBracketToOutputSampleBuffer
{
  return 0;
}

- (uint64_t)processorOptionsDictionary
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = [+[FigCaptureCameraParameters sharedInstance] stereoDisparityParameters];
    if (v2
      || (uint64_t v3 = -[BWStillImageBravoDisparityNode _sensorConfigurationWithPortraitTuningParameters](v1)) != 0
      && (uint64_t v2 = (NSDictionary *)objc_msgSend((id)objc_msgSend(v3, "sensorIDDictionary"), "objectForKeyedSubscript:", @"DisparityParameters")) != 0)
    {
      uint64_t v4 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
      long long v11 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      id v5 = (void *)[*(id *)(v1 + 96) allValues];
      uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v17 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v12;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v12 != v8) {
              objc_enumerationMutation(v5);
            }
            objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "cameraInfo"), objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "portType"));
          }
          uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v17 count:16];
        }
        while (v7);
      }
      if ([v4 count])
      {
        uint64_t v10 = *MEMORY[0x1E4F53560];
        v15[0] = *MEMORY[0x1E4F535B0];
        v15[1] = v10;
        v16[0] = v2;
        v16[1] = v4;
        return [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
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
  return result;
}

- (void)_sensorConfigurationWithPortraitTuningParameters
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v2 = +[FigCaptureCameraParameters sharedInstance];
  if ([(FigCaptureCameraParameters *)v2 stereoDisparityParameters]) {
    return 0;
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 96), "allValues", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (!v4) {
    return 0;
  }
  uint64_t v5 = v4;
  uint64_t v6 = *(void *)v11;
LABEL_5:
  uint64_t v7 = 0;
  while (1)
  {
    if (*(void *)v11 != v6) {
      objc_enumerationMutation(v3);
    }
    uint64_t v8 = *(void **)(*((void *)&v10 + 1) + 8 * v7);
    if (-[FigCaptureCameraParameters disparityVersionForPortType:sensorIDString:](v2, "disparityVersionForPortType:sensorIDString:", [v8 portType], objc_msgSend(v8, "sensorIDString")))
    {
      return v8;
    }
    if (v5 == ++v7)
    {
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        goto LABEL_5;
      }
      return 0;
    }
  }
}

- (uint64_t)_computeDisparityForTeleBuffer:(void *)a3 wideBuffer:(void *)a4 attachToOutputBuffer:
{
  if (result)
  {
    uint64_t v8 = result;
    uint64_t v9 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(result + 16), "mediaPropertiesForAttachedMediaKey:", @"Depth"), "livePixelBufferPool"), "newPixelBuffer");
    if (v9)
    {
      long long v10 = (__CVBuffer *)v9;
      [*(id *)(v8 + 104) setShouldComputeDisparityWhenCalibrationFails:*(unsigned __int8 *)(v8 + 216)];
      BOOL v11 = (objc_msgSend((id)objc_msgSend(*(id *)(v8 + 152), "captureSettings"), "captureFlags") & 0x20000) != 0
         && objc_msgSend((id)objc_msgSend(*(id *)(v8 + 152), "captureSettings"), "captureType") == 10;
      [*(id *)(v8 + 104) setEqualizeTeleGainToMatchReference:v11];
      if (*(unsigned char *)(v8 + 217))
      {
        AttachedMedia = (const void *)BWSampleBufferGetAttachedMedia(AttachedMedia, 0x1EFA74380);
        uint64_t v12 = BWSampleBufferGetAttachedMedia(a3, 0x1EFA74380);
      }
      else
      {
        uint64_t v12 = (uint64_t)a3;
      }
      [*(id *)(v8 + 104) setReferenceSampleBuffer:AttachedMedia];
      [*(id *)(v8 + 104) setAuxiliarySampleBuffer:v12];
      [*(id *)(v8 + 104) setOutputShiftmap:v10];
      unsigned int v13 = [*(id *)(v8 + 104) process];
      unsigned int v14 = v13 & 0xFFFFFFFE;
      if (!v13 || v14 == 2 && *(unsigned char *)(v8 + 216))
      {
        target = (opaqueCMSampleBuffer *)a3;
        objc_msgSend((id)objc_msgSend(*(id *)(v8 + 104), "metalContext"), "waitForSchedule");
        uint64_t v15 = (void *)CMGetAttachment(a4, (CFStringRef)*MEMORY[0x1E4F53070], 0);
        long long v16 = (void *)[*(id *)(v8 + 104) shiftMapMetadata];
        if (v16)
        {
          objc_msgSend((id)objc_msgSend(*(id *)(v8 + 96), "objectForKeyedSubscript:", objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E4F54128])), "sensorIDDictionary");
          id v17 = sidn_depthMetadataAttachmentDictionaryFromBravoDisparityMetadata(v16, (opaqueCMSampleBuffer *)a4, 1, v14 == 2);
        }
        else
        {
          id v17 = 0;
        }
        CFTypeRef cf = 0;
        if (!BWCMSampleBufferCreateCopyWithNewPixelBuffer((opaqueCMSampleBuffer *)a4, v10, (CFTypeRef *)(v8 + 144), (CMSampleBufferRef *)&cf))
        {
          BWSampleBufferSetAttachedMedia(a4, @"Depth", (uint64_t)cf);
          if (cf) {
            CFRelease(cf);
          }
        }
        if ([*(id *)(v8 + 104) disparityDiagnosticMetadata]) {
          objc_msgSend(v15, "setObject:forKeyedSubscript:", objc_msgSend(*(id *)(v8 + 104), "disparityDiagnosticMetadata"), @"Disparity");
        }
        uint64_t v18 = (CFStringRef *)MEMORY[0x1E4F55B40];
        if (v17) {
          CMSetAttachment(a4, (CFStringRef)*MEMORY[0x1E4F55B40], v17, 1u);
        }
        if (*(unsigned char *)(v8 + 193))
        {
          id v19 = sidn_depthMetadataAttachmentDictionaryFromBravoDisparityMetadata(v16, target, 0, v14 == 2);
          if (v19) {
            CMSetAttachment(target, *v18, v19, 1u);
          }
        }
      }
      uint64_t v20 = +[BWAggdDataReporter sharedInstance];
      if (v13 > 3) {
        uint64_t v21 = 4294949886;
      }
      else {
        uint64_t v21 = dword_1A5F0C720[v13];
      }
      [(BWAggdDataReporter *)v20 reportSDOFSampleBufferProcessorProcessingStatus:v21];
      CFRelease(v10);
    }
    else
    {
      fig_log_get_emitter();
      uint64_t v23 = v4;
      LODWORD(v22) = 0;
      FigDebugAssert3();
    }
    objc_msgSend(*(id *)(v8 + 104), "setShouldComputeDisparityWhenCalibrationFails:", 0, v22, v23);
    [*(id *)(v8 + 104) setEqualizeTeleGainToMatchReference:0];
    [*(id *)(v8 + 104) setReferenceSampleBuffer:0];
    [*(id *)(v8 + 104) setAuxiliarySampleBuffer:0];
    return [*(id *)(v8 + 104) setOutputShiftmap:0];
  }
  return result;
}

- (uint64_t)_resolveProcessingMode
{
  if (result)
  {
    uint64_t v1 = result;
    *(_DWORD *)(result + 168) = 0;
    result = objc_msgSend((id)objc_msgSend(*(id *)(result + 152), "captureSettings"), "captureFlags");
    if ((result & 0x800) != 0)
    {
      *(_DWORD *)(v1 + 168) = 1;
      *(_DWORD *)(v1 + 160) = 1;
      if (!*(unsigned char *)(v1 + 217)
        && (objc_msgSend((id)objc_msgSend(*(id *)(v1 + 152), "captureSettings"), "captureType") == 3
         || (objc_msgSend((id)objc_msgSend(*(id *)(v1 + 152), "captureSettings"), "captureFlags") & 0x100000) != 0))
      {
        *(_DWORD *)(v1 + 168) = 3;
        result = objc_msgSend((id)objc_msgSend(*(id *)(v1 + 152), "captureSettings"), "deliverOriginalImage");
        if (result)
        {
          *(_DWORD *)(v1 + 168) = 2;
          ++*(_DWORD *)(v1 + 160);
        }
      }
      else
      {
        result = objc_msgSend((id)objc_msgSend(*(id *)(v1 + 152), "captureSettings"), "captureType");
        if (result == 7)
        {
          *(_DWORD *)(v1 + 168) = 4;
          result = objc_msgSend((id)objc_msgSend(*(id *)(v1 + 152), "requestedSettings"), "bracketImageCount");
          *(_DWORD *)(v1 + 160) = result;
        }
      }
    }
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

@end