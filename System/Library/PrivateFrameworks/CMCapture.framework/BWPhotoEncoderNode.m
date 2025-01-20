@interface BWPhotoEncoderNode
+ (void)initialize;
- (BOOL)cameraSupportsFlash;
- (BOOL)preferMainImageDownscalingFactorByAttachedMediaKeyFromSampleBuffer;
- (BOOL)smartStyleReversibilityEnabled;
- (BOOL)usesHighEncodingPriority;
- (BOOL)zeroShutterLagEnabled;
- (BWPhotoEncoderNode)initWithNodeConfiguration:(id)a3 sensorConfigurationsByPortType:(id)a4 semanticDevelopmentVersion:(int)a5 inferenceScheduler:(id)a6 alwaysAwaitInference:(BOOL)a7 portraitRenderQuality:(int)a8 deferredPhotoProcessorEnabled:(BOOL)a9;
- (__CVBuffer)processorController:(id)a3 newOutputPixelBufferForProcessorInput:(id)a4 type:(unint64_t)a5;
- (__CVBuffer)processorController:(id)a3 newOutputPixelBufferForProcessorInput:(id)a4 type:(unint64_t)a5 dimensions:(id)a6;
- (id)attachedMediaConfigurationByAttachedMediaKey;
- (id)inputColorInfo;
- (id)nodeSubType;
- (id)nodeType;
- (id)photoEncoderController;
- (int)smartStyleRenderingVersion;
- (uint64_t)_addEligibleAuxImagesforExpectedAdjustedPhotoWithSbuf:(int)a3 processingFlags:(uint64_t)a4 stillImageSettings:(void *)a5 encoderControllerInput:;
- (uint64_t)_isOriginalPhotoAndExpectingAdjustedPhoto:(void *)a3 stillImageSettings:;
- (uint64_t)_mainImageDownscalingFactorForAttachedMediaKey:(void *)a3 attachedMediaMetadata:;
- (uint64_t)_removeNonPropagatedAttachedMediaFromSampleBuffer:(uint64_t)result;
- (void)_releaseResources;
- (void)dealloc;
- (void)didReachEndOfDataForInput:(id)a3;
- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5;
- (void)handleNodeError:(id)a3 forInput:(id)a4;
- (void)handleStillImagePrewarmWithSettings:(id)a3 forInput:(id)a4;
- (void)prepareForCurrentConfigurationToBecomeLive;
- (void)processorController:(id)a3 didFinishProcessingSampleBuffer:(opaqueCMSampleBuffer *)a4 type:(unint64_t)a5 processorInput:(id)a6 err:(int)a7;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
- (void)setAttachedMediaConfigurationByAttachedMediaKey:(id)a3;
- (void)setCameraSupportsFlash:(BOOL)a3;
- (void)setInputColorInfo:(id)a3;
- (void)setPreferMainImageDownscalingFactorByAttachedMediaKeyFromSampleBuffer:(BOOL)a3;
- (void)setSmartStyleRenderingVersion:(int)a3;
- (void)setSmartStyleReversibilityEnabled:(BOOL)a3;
- (void)setUsesHighEncodingPriority:(BOOL)a3;
- (void)setZeroShutterLagEnabled:(BOOL)a3;
@end

@implementation BWPhotoEncoderNode

- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5
{
  if ([a5 isEqualToString:@"PrimaryFormat"])
  {
    output = self->super._output;
    [(BWNodeOutput *)output setFormat:a3];
  }
  else
  {
    id v10 = [(NSDictionary *)self->_attachedMediaConfigurationByAttachedMediaKey objectForKeyedSubscript:a5];
    if (!v10 || [v10 propagatesDownstream])
    {
      v11.receiver = self;
      v11.super_class = (Class)BWPhotoEncoderNode;
      [(BWNode *)&v11 didSelectFormat:a3 forInput:a4 forAttachedMediaKey:a5];
    }
  }
}

- (id)nodeType
{
  return @"Converter";
}

- (void)setUsesHighEncodingPriority:(BOOL)a3
{
}

- (void)setSmartStyleReversibilityEnabled:(BOOL)a3
{
}

- (void)setSmartStyleRenderingVersion:(int)a3
{
}

- (void)setPreferMainImageDownscalingFactorByAttachedMediaKeyFromSampleBuffer:(BOOL)a3
{
  self->_preferMainImageDownscalingFactorByAttachedMediaKeyFromSampleBuffer = a3;
  -[BWPhotoEncoderController setPreferMainImageDownscalingFactorByAttachedMediaKeyFromSampleBuffer:](self->_photoEncoderController, "setPreferMainImageDownscalingFactorByAttachedMediaKeyFromSampleBuffer:");
}

- (void)setCameraSupportsFlash:(BOOL)a3
{
}

- (id)photoEncoderController
{
  return self->_photoEncoderController;
}

- (BWPhotoEncoderNode)initWithNodeConfiguration:(id)a3 sensorConfigurationsByPortType:(id)a4 semanticDevelopmentVersion:(int)a5 inferenceScheduler:(id)a6 alwaysAwaitInference:(BOOL)a7 portraitRenderQuality:(int)a8 deferredPhotoProcessorEnabled:(BOOL)a9
{
  uint64_t v9 = *(void *)&a8;
  BOOL v10 = a7;
  uint64_t v12 = *(void *)&a5;
  v22.receiver = self;
  v22.super_class = (Class)BWPhotoEncoderNode;
  v15 = [(BWNode *)&v22 init];
  if (v15)
  {
    v15->_nodeConfiguration = (BWStillImageNodeConfiguration *)a3;
    v15->_sensorConfigurationsByPortType = (NSDictionary *)a4;
    v15->_photoEncoderControllerConfiguration = objc_alloc_init(BWPhotoEncoderControllerConfiguration);
    -[BWStillImageProcessorControllerConfiguration setStillImageProcessingMode:](v15->_photoEncoderControllerConfiguration, "setStillImageProcessingMode:", [a3 stillImageProcessingMode]);
    [(BWStillImageProcessorControllerConfiguration *)v15->_photoEncoderControllerConfiguration setSensorConfigurationsByPortType:a4];
    [(BWPhotoEncoderControllerConfiguration *)v15->_photoEncoderControllerConfiguration setSemanticDevelopmentVersion:v12];
    -[BWStillImageProcessorControllerConfiguration setDeferredCaptureSupportEnabled:](v15->_photoEncoderControllerConfiguration, "setDeferredCaptureSupportEnabled:", [a3 deferredCaptureSupportEnabled]);
    -[BWPhotoEncoderControllerConfiguration setDeferredPhotoProcessorEnabled:](v15->_photoEncoderControllerConfiguration, "setDeferredPhotoProcessorEnabled:", [a3 deferredPhotoProcessorEnabled]);
    [(BWPhotoEncoderControllerConfiguration *)v15->_photoEncoderControllerConfiguration setAlwaysAwaitInference:v10];
    [(BWPhotoEncoderControllerConfiguration *)v15->_photoEncoderControllerConfiguration setPortraitRenderQuality:v9];
    -[BWStillImageProcessorControllerConfiguration setMetalCommandQueue:](v15->_photoEncoderControllerConfiguration, "setMetalCommandQueue:", [a3 metalCommandQueue]);
    [(BWStillImageProcessorControllerConfiguration *)v15->_photoEncoderControllerConfiguration setInferenceScheduler:a6];
    -[BWStillImageProcessorControllerConfiguration setFigThreadPriority:](v15->_photoEncoderControllerConfiguration, "setFigThreadPriority:", [a3 figThreadPriority]);
    -[BWPhotoEncoderControllerConfiguration setStereoPhotoOutputDimensions:](v15->_photoEncoderControllerConfiguration, "setStereoPhotoOutputDimensions:", [a3 stereoPhotoOutputDimensions]);
    v16 = [[BWPhotoEncoderController alloc] initWithConfiguration:v15->_photoEncoderControllerConfiguration];
    v15->_photoEncoderController = v16;
    [(BWPhotoEncoderController *)v16 setPrimaryOwnerDelegate:v15];
    if ((int)FigCapturePlatformIdentifier() < 8) {
      v17 = &unk_1EFB03320;
    }
    else {
      v17 = FigCapturePixelFormatsByAddingCompressedVariants(&unk_1EFB03320, [a3 maxLossyCompressionLevel]);
    }
    v18 = [[BWNodeInput alloc] initWithMediaType:1986618469 node:v15];
    v19 = objc_alloc_init(BWVideoFormatRequirements);
    [(BWVideoFormatRequirements *)v19 setSupportedPixelFormats:v17];
    [(BWNodeInput *)v18 setFormatRequirements:v19];
    [(BWNodeInput *)v18 setPassthroughMode:1];
    [(BWNode *)v15 addInput:v18];

    v20 = [[BWNodeOutput alloc] initWithMediaType:1986618469 node:v15];
    [(BWNodeOutput *)v20 setFormatRequirements:objc_alloc_init(BWVideoFormatRequirements)];
    [(BWNodeOutput *)v20 setPassthroughMode:1];
    [(BWNode *)v15 addOutput:v20];
  }
  return v15;
}

- (void)setAttachedMediaConfigurationByAttachedMediaKey:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  -[BWPhotoEncoderControllerConfiguration setAttachedMediaConfigurationByAttachedMediaKey:](self->_photoEncoderControllerConfiguration, "setAttachedMediaConfigurationByAttachedMediaKey:");
  if (([(NSDictionary *)self->_attachedMediaConfigurationByAttachedMediaKey isEqual:a3] & 1) == 0)
  {

    v5 = (NSDictionary *)[a3 copy];
    self->_attachedMediaConfigurationByAttachedMediaKey = v5;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    obj = v5;
    uint64_t v6 = [(NSDictionary *)v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v19 != v8) {
            objc_enumerationMutation(obj);
          }
          BOOL v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          id v11 = [(NSDictionary *)self->_attachedMediaConfigurationByAttachedMediaKey objectForKeyedSubscript:v10];
          [v11 mainImageDownscalingFactor];
          if (v12 == 0.0 && !FigCaptureVideoDimensionsAreValid([v11 dimensions]))
          {
            v15 = 0;
            v16 = &OBJC_IVAR___BWNode__input;
            goto LABEL_14;
          }
          v13 = objc_alloc_init(BWNodeInputMediaConfiguration);
          v14 = objc_alloc_init(BWVideoFormatRequirements);
          if ([v10 isEqualToString:0x1EFA74420])
          {
            [(BWVideoFormatRequirements *)v14 setSupportedPixelFormats:&unk_1EFB03338];
            [(BWVideoFormatRequirements *)v14 setBytesPerRowAlignment:64];
            [(BWVideoFormatRequirements *)v14 setWidthAlignment:16];
            [(BWVideoFormatRequirements *)v14 setHeightAlignment:16];
            [(BWVideoFormatRequirements *)v14 setPlaneAlignment:64];
            [(BWVideoFormatRequirements *)v14 setMemoryPoolUseAllowed:0];
          }
          [(BWNodeInputMediaConfiguration *)v13 setFormatRequirements:v14];
          -[BWNodeInputMediaConfiguration setPassthroughMode:](v13, "setPassthroughMode:", [v11 propagatesDownstream]);
          [(BWNodeInput *)self->super._input setMediaConfiguration:v13 forAttachedMediaKey:v10];
          if ([v11 propagatesDownstream])
          {
            v15 = objc_alloc_init(BWNodeOutputMediaConfiguration);
            [(BWNodeOutputMediaConfiguration *)v15 setFormatRequirements:objc_alloc_init(BWVideoFormatRequirements)];
            [(BWNodeOutputMediaConfiguration *)v15 setPassthroughMode:1];
            v16 = &OBJC_IVAR___BWNode__output;
LABEL_14:
            [*(id *)((char *)&self->super.super.isa + *v16) setMediaConfiguration:v15 forAttachedMediaKey:v10];
          }
          [(BWNodeOutput *)self->super._output setMediaConfiguration:0 forAttachedMediaKey:v10];
        }
        uint64_t v7 = [(NSDictionary *)obj countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v7);
    }
  }
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

- (void)_releaseResources
{
  if (a1)
  {
    [a1[16] waitForAllAsynchronousProcessingToComplete];

    a1[16] = 0;
    a1[15] = 0;

    a1[12] = 0;
  }
}

- (void)dealloc
{
  -[BWPhotoEncoderNode _releaseResources]((id *)&self->super.super.isa);

  v3.receiver = self;
  v3.super_class = (Class)BWPhotoEncoderNode;
  [(BWNode *)&v3 dealloc];
}

- (void)didReachEndOfDataForInput:(id)a3
{
  [(BWPhotoEncoderController *)self->_photoEncoderController cancelProcessing];
  -[BWPhotoEncoderNode _releaseResources]((id *)&self->super.super.isa);
  v5.receiver = self;
  v5.super_class = (Class)BWPhotoEncoderNode;
  [(BWNode *)&v5 didReachEndOfDataForInput:a3];
}

- (id)nodeSubType
{
  return @"PhotoEncoder";
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)BWPhotoEncoderNode;
  [(BWNode *)&v13 prepareForCurrentConfigurationToBecomeLive];
  objc_super v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", -[BWNodeInput videoFormat](self->super._input, "videoFormat"), @"PrimaryFormat");
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = [(BWNodeInput *)self->super._input mediaPropertiesByAttachedMediaKey];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
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
        objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend(-[BWNodeInput mediaPropertiesByAttachedMediaKey](self->super._input, "mediaPropertiesByAttachedMediaKey"), "objectForKeyedSubscript:", *(void *)(*((void *)&v9 + 1) + 8 * v8)), "resolvedVideoFormat"), *(void *)(*((void *)&v9 + 1) + 8 * v8));
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
    }
    while (v6);
  }
  [(BWPhotoEncoderController *)self->_photoEncoderController setResolvedVideoFormatsByAttachedMediaKey:v3];
  [(BWPhotoEncoderController *)self->_photoEncoderController setClientExpectsCameraMountedInLandscapeOrientation:[(BWGraph *)[(BWNode *)self graph] clientExpectsCameraMountedInLandscapeOrientation]];
  [(BWPhotoEncoderController *)self->_photoEncoderController prepareForCurrentConfigurationToBecomeLive];
}

- (void)setInputColorInfo:(id)a3
{
}

- (id)inputColorInfo
{
  return [(BWPhotoEncoderControllerConfiguration *)self->_photoEncoderControllerConfiguration inputColorInfo];
}

- (BOOL)cameraSupportsFlash
{
  return [(BWPhotoEncoderControllerConfiguration *)self->_photoEncoderControllerConfiguration cameraSupportsFlash];
}

- (BOOL)usesHighEncodingPriority
{
  return [(BWPhotoEncoderControllerConfiguration *)self->_photoEncoderControllerConfiguration usesHighEncodingPriority];
}

- (void)setZeroShutterLagEnabled:(BOOL)a3
{
}

- (BOOL)zeroShutterLagEnabled
{
  return [(BWPhotoEncoderControllerConfiguration *)self->_photoEncoderControllerConfiguration zeroShutterLagEnabled];
}

- (id)attachedMediaConfigurationByAttachedMediaKey
{
  return self->_attachedMediaConfigurationByAttachedMediaKey;
}

- (BOOL)preferMainImageDownscalingFactorByAttachedMediaKeyFromSampleBuffer
{
  return self->_preferMainImageDownscalingFactorByAttachedMediaKeyFromSampleBuffer;
}

- (int)smartStyleRenderingVersion
{
  return [(BWPhotoEncoderControllerConfiguration *)self->_photoEncoderControllerConfiguration smartStyleRenderingVersion];
}

- (BOOL)smartStyleReversibilityEnabled
{
  return [(BWPhotoEncoderControllerConfiguration *)self->_photoEncoderControllerConfiguration smartStyleReversibilityEnabled];
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    uint64_t v6 = 0;
LABEL_13:
    id v11 = +[BWNodeError newError:4294954516 sourceNode:self stillImageSettings:v6 metadata:CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0)];
    [(BWNodeOutput *)self->super._output emitNodeError:v11];

    return;
  }
  uint64_t v6 = (void *)CMGetAttachment(a3, @"StillSettings", 0);
  if (!v6) {
    goto LABEL_13;
  }
  if (dword_1EB4C53D0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }

  self->_lastProcessedCaptureIdentifier = (NSString *)(id)objc_msgSend((id)objc_msgSend(v6, "requestedSettings"), "captureRequestIdentifier");
  uint64_t v8 = [(BWPhotoEncoderController *)self->_photoEncoderController currentInputsCaptureRequestIdentifier];
  if (v8
    && !-[NSString isEqualToString:](v8, "isEqualToString:", objc_msgSend((id)objc_msgSend(v6, "requestedSettings"), "captureRequestIdentifier")))
  {
    if (dword_1EB4C53D0)
    {
      long long v9 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    [(BWPhotoEncoderController *)self->_photoEncoderController cancelProcessing];
  }
  uint64_t v10 = (BWStillImageProcessingFlagsForSampleBuffer(a3) >> 3) & 1;
  if (![(BWPhotoEncoderController *)self->_photoEncoderController inputForStillImageSettings:v6 portType:BWSampleBufferGetPortType(a3) portraitAdjustedImage:v10 optionalSampleBuffer:a3 forEarlyEncoding:0])goto LABEL_13; {
}
  }

- (void)handleNodeError:(id)a3 forInput:(id)a4
{
  if (-[NSString isEqualToString:](-[BWPhotoEncoderController currentInputsCaptureRequestIdentifier](self->_photoEncoderController, "currentInputsCaptureRequestIdentifier", a3, a4), "isEqualToString:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "stillImageSettings"), "requestedSettings"), "captureRequestIdentifier")))
  {
    [(BWPhotoEncoderController *)self->_photoEncoderController cancelProcessing];
  }
  output = self->super._output;
  [(BWNodeOutput *)output emitNodeError:a3];
}

- (uint64_t)_mainImageDownscalingFactorForAttachedMediaKey:(void *)a3 attachedMediaMetadata:
{
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = (void *)[*(id *)(result + 112) objectForKeyedSubscript:a2];
    result = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F533D0]), "floatValue");
    if (!*(unsigned char *)(v4 + 144) || v6 == 0.0)
    {
      return [v5 mainImageDownscalingFactor];
    }
  }
  return result;
}

- (uint64_t)_removeNonPropagatedAttachedMediaFromSampleBuffer:(uint64_t)result
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v3 = result;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v4 = *(void **)(result + 112);
    result = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (result)
    {
      uint64_t v5 = result;
      uint64_t v6 = *(void *)v16;
      CFStringRef v7 = (const __CFString *)*MEMORY[0x1E4F53070];
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v16 != v6) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8 * v8);
          uint64_t v10 = (void *)[*(id *)(v3 + 112) objectForKeyedSubscript:v9];
          AttachedMedia = (const void *)BWSampleBufferGetAttachedMedia(a2, v9);
          uint64_t v12 = (void *)CMGetAttachment(AttachedMedia, v7, 0);
          -[BWPhotoEncoderNode _mainImageDownscalingFactorForAttachedMediaKey:attachedMediaMetadata:](v3, v9, v12);
          float v14 = v13;
          if (([v10 propagatesDownstream] & 1) == 0
            && (v14 != 0.0 || FigCaptureVideoDimensionsAreValid([v10 dimensions])))
          {
            BWSampleBufferRemoveAttachedMedia(a2, v9);
          }
          ++v8;
        }
        while (v5 != v8);
        result = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
        uint64_t v5 = result;
      }
      while (result);
    }
  }
  return result;
}

- (void)handleStillImagePrewarmWithSettings:(id)a3 forInput:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (-[NSString isEqualToString:](self->_lastProcessedCaptureIdentifier, "isEqualToString:", objc_msgSend((id)objc_msgSend(a3, "requestedSettings"), "captureRequestIdentifier")))
  {
    goto LABEL_6;
  }
  if (!-[NSString isEqualToString:](-[BWPhotoEncoderController currentInputsCaptureRequestIdentifier](self->_photoEncoderController, "currentInputsCaptureRequestIdentifier"), "isEqualToString:", objc_msgSend((id)objc_msgSend(a3, "requestedSettings"), "captureRequestIdentifier")))
  {
    if (![(BWPhotoEncoderController *)self->_photoEncoderController currentInputsCaptureRequestIdentifier])
    {
      -[BWPhotoEncoderController inputForStillImageSettings:portType:portraitAdjustedImage:optionalSampleBuffer:forEarlyEncoding:](self->_photoEncoderController, "inputForStillImageSettings:portType:portraitAdjustedImage:optionalSampleBuffer:forEarlyEncoding:", a3, objc_msgSend((id)objc_msgSend(a3, "captureSettings"), "masterPortType"), 0, 0, 0);
      goto LABEL_5;
    }
LABEL_6:
    int v10 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
LABEL_5:
  v8.receiver = self;
  v8.super_class = (Class)BWPhotoEncoderNode;
  [(BWNode *)&v8 handleStillImagePrewarmWithSettings:a3 forInput:a4];
}

- (uint64_t)_isOriginalPhotoAndExpectingAdjustedPhoto:(void *)a3 stillImageSettings:
{
  uint64_t result = 0;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if ((a2 & 8) == 0)
    {
      long long v11 = 0u;
      long long v12 = 0u;
      long long v9 = 0u;
      long long v10 = 0u;
      uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "processingSettings", 0), "photoManifest"), "photoDescriptors");
      uint64_t result = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (result)
      {
        uint64_t v6 = result;
        uint64_t v7 = *(void *)v10;
        while (2)
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (*(void *)v10 != v7) {
              objc_enumerationMutation(v5);
            }
            if (([*(id *)(*((void *)&v9 + 1) + 8 * i) processingFlags] & 8) != 0) {
              return 1;
            }
          }
          uint64_t v6 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
          uint64_t result = 0;
          if (v6) {
            continue;
          }
          break;
        }
      }
    }
  }
  return result;
}

- (uint64_t)_addEligibleAuxImagesforExpectedAdjustedPhotoWithSbuf:(int)a3 processingFlags:(uint64_t)a4 stillImageSettings:(void *)a5 encoderControllerInput:
{
  v21[6] = *MEMORY[0x1E4F143B8];
  if (result)
  {
    v21[0] = 0x1EFA74420;
    v21[1] = @"PersonSemanticsHair";
    v21[2] = @"PersonSemanticsSkin";
    v21[3] = @"PersonSemanticsTeeth";
    v21[4] = @"PersonSemanticsGlasses";
    v21[5] = 0x1EFA745A0;
    objc_super v8 = (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:6];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t result = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (result)
    {
      uint64_t v9 = result;
      uint64_t v10 = a3 | 8u;
      uint64_t v11 = *(void *)v17;
      CFStringRef v12 = (const __CFString *)*MEMORY[0x1E4F53070];
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v14 = *(void *)(*((void *)&v16 + 1) + 8 * v13);
          uint64_t AttachedMedia = BWSampleBufferGetAttachedMedia(a2, v14);
          objc_msgSend(a5, "addAuxSbuf:attachedMediakey:primaryImageMetadata:processingFlags:", AttachedMedia, v14, CMGetAttachment(a2, v12, 0), v10);
          ++v13;
        }
        while (v9 != v13);
        uint64_t result = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
        uint64_t v9 = result;
      }
      while (result);
    }
  }
  return result;
}

- (__CVBuffer)processorController:(id)a3 newOutputPixelBufferForProcessorInput:(id)a4 type:(unint64_t)a5 dimensions:(id)a6
{
  v35[7] = *MEMORY[0x1E4F143B8];
  CVPixelBufferRef pixelBufferOut = 0;
  mach_absolute_time();
  if (a5 == 49)
  {
    objc_super v22 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithDictionary:", objc_msgSend(a4, "decompressStyledBufferAttributes"));
    v30[0] = *MEMORY[0x1E4F2EFC0];
    uint64_t v23 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[BWMemoryPool poolIdentifier](-[BWNodeOutput memoryPool](self->super._output, "memoryPool"), "poolIdentifier"));
    uint64_t v24 = *MEMORY[0x1E4F2EFE8];
    v31[0] = v23;
    v31[1] = &unk_1EFAFF8B8;
    uint64_t v25 = *MEMORY[0x1E4F2F130];
    v30[1] = v24;
    v30[2] = v25;
    v31[2] = MEMORY[0x1E4F1CC38];
    uint64_t v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:3];
    [v22 setObject:v26 forKeyedSubscript:*MEMORY[0x1E4F24D20]];
    if (CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a6.var0, *(uint64_t *)&a6 >> 32, 0x34323066u, (CFDictionaryRef)v22, &pixelBufferOut))
    {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (a5 != 48)
  {
LABEL_6:
    mach_absolute_time();
    FigHostTimeToNanoseconds();
    goto LABEL_7;
  }
  int v10 = BWPhotoEncoderResolveEncodingSchemeForRequestedSettings(objc_msgSend((id)objc_msgSend(a4, "stillImageSettings"), "requestedSettings"));
  OSType v11 = BWPhotoEncoderDeltaMapPixelFormat(objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "stillImageSettings"), "requestedSettings"), "smartStyle"), v10);
  v34[0] = *MEMORY[0x1E4F24E10];
  v35[0] = [NSNumber numberWithInt:a6];
  v34[1] = *MEMORY[0x1E4F24D08];
  uint64_t v12 = [NSNumber numberWithInt:HIDWORD(*(unint64_t *)&a6)];
  uint64_t v13 = *MEMORY[0x1E4F24C98];
  v35[1] = v12;
  v35[2] = &unk_1EFAFF8A0;
  uint64_t v14 = *MEMORY[0x1E4F24D78];
  v34[2] = v13;
  v34[3] = v14;
  uint64_t v15 = *MEMORY[0x1E4F24D40];
  uint64_t v16 = MEMORY[0x1E4F1CC38];
  v35[3] = &unk_1EFAFF8A0;
  v35[4] = MEMORY[0x1E4F1CC38];
  uint64_t v17 = *MEMORY[0x1E4F24D18];
  v34[4] = v15;
  v34[5] = v17;
  v35[5] = MEMORY[0x1E4F1CC38];
  v34[6] = *MEMORY[0x1E4F24D20];
  v32[0] = *MEMORY[0x1E4F2EFC0];
  uint64_t v18 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[BWMemoryPool poolIdentifier](-[BWNodeOutput memoryPool](self->super._output, "memoryPool"), "poolIdentifier"));
  uint64_t v19 = *MEMORY[0x1E4F2EFE8];
  v33[0] = v18;
  v33[1] = &unk_1EFAFF8B8;
  uint64_t v20 = *MEMORY[0x1E4F2F130];
  v32[1] = v19;
  v32[2] = v20;
  v33[2] = v16;
  v35[6] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:3];
  CFDictionaryRef v21 = (const __CFDictionary *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:7];
  if (!CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a6.var0, *(uint64_t *)&a6 >> 32, v11, v21, &pixelBufferOut))
  {
    CVBufferSetAttachment(pixelBufferOut, (CFStringRef)*MEMORY[0x1E4F24C18], (CFTypeRef)*MEMORY[0x1E4F24C40], kCVAttachmentMode_ShouldPropagate);
    CVBufferSetAttachment(pixelBufferOut, (CFStringRef)*MEMORY[0x1E4F24A90], (CFTypeRef)*MEMORY[0x1E4F24AC0], kCVAttachmentMode_ShouldPropagate);
    CVBufferSetAttachment(pixelBufferOut, (CFStringRef)*MEMORY[0x1E4F24BC8], (CFTypeRef)*MEMORY[0x1E4F24BE8], kCVAttachmentMode_ShouldPropagate);
    goto LABEL_6;
  }
LABEL_7:
  if (dword_1EB4C53D0)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return pixelBufferOut;
}

- (__CVBuffer)processorController:(id)a3 newOutputPixelBufferForProcessorInput:(id)a4 type:(unint64_t)a5
{
  return 0;
}

- (void)processorController:(id)a3 didFinishProcessingSampleBuffer:(opaqueCMSampleBuffer *)a4 type:(unint64_t)a5 processorInput:(id)a6 err:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  int v11 = BWStillImageProcessingFlagsForSampleBuffer(a4);
  int v12 = [a6 receivedAllFramesInSingleContainer];
  BOOL IsPrimaryFrame = BWPhotoEncoderIsPrimaryFrame(v11);
  if (v12 && IsPrimaryFrame)
  {
    if (v7)
    {
      id v17 = +[BWNodeError newError:sourceNode:stillImageSettings:metadata:](BWNodeError, "newError:sourceNode:stillImageSettings:metadata:", v7, self, [a6 stillImageSettings], CMGetAttachment(a4, (CFStringRef)*MEMORY[0x1E4F53070], 0));
      [(BWNodeOutput *)self->super._output emitNodeError:v17];
    }
    else
    {
      if (-[BWStillImageNodeConfiguration deferredPhotoProcessorEnabled](self->_nodeConfiguration, "deferredPhotoProcessorEnabled")&& -[BWPhotoEncoderNode _isOriginalPhotoAndExpectingAdjustedPhoto:stillImageSettings:]((uint64_t)self, v11, (void *)[a6 stillImageSettings]))
      {
        id v14 = -[BWPhotoEncoderController inputForStillImageSettings:portType:portraitAdjustedImage:optionalSampleBuffer:forEarlyEncoding:](self->_photoEncoderController, "inputForStillImageSettings:portType:portraitAdjustedImage:optionalSampleBuffer:forEarlyEncoding:", [a6 stillImageSettings], objc_msgSend(a6, "portType"), 1, 0, 0);
        [a6 stillImageSettings];
        -[BWPhotoEncoderNode _addEligibleAuxImagesforExpectedAdjustedPhotoWithSbuf:processingFlags:stillImageSettings:encoderControllerInput:]((uint64_t)self, a4, v11, v15, v14);
      }
      -[BWPhotoEncoderNode _removeNonPropagatedAttachedMediaFromSampleBuffer:]((uint64_t)self, a4);
      output = self->super._output;
      [(BWNodeOutput *)output emitSampleBuffer:a4];
    }
  }
}

@end