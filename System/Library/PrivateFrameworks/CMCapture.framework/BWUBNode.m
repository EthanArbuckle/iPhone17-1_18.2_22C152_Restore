@interface BWUBNode
+ (void)initialize;
- (BOOL)_generateDisparityForSettings:(BOOL)result;
- (BOOL)_requiresResizedOutputDimensionsWithInputWidth:(uint64_t)a3 inputHeight:;
- (BOOL)demosaicedRawSupportedForCaptureType:(int)a3;
- (BOOL)idcSupportedForCaptureType:(int)a3 captureFlags:(unint64_t)a4 portType:(id)a5;
- (BOOL)processingOnBeginMomentSupportedForCaptureSettings:(id)a3;
- (BOOL)rawNightModeSupportedForPortType:(id)a3;
- (BWNodeInput)pointCloudInput;
- (BWUBNode)initWithNodeConfiguration:(id)a3 captureDevice:(id)a4;
- (BWVideoFormatRequirements)_demosaicedRawFormatRequirementsWithDimensions:(int)a3 colorSpaceProperties:;
- (__CVBuffer)processorController:(id)a3 newOutputPixelBufferForProcessorInput:(id)a4 type:(unint64_t)a5;
- (__CVBuffer)processorController:(id)a3 newOutputPixelBufferForProcessorInput:(id)a4 type:(unint64_t)a5 attachedMediaKey:(id)a6;
- (__CVBuffer)processorController:(id)a3 newOutputPixelBufferForProcessorInput:(id)a4 type:(unint64_t)a5 dimensions:(id)a6;
- (id)_bufferTypesExcludingErrorRecoveryTypesForCaptureSettings:(id)result;
- (id)_bufferTypesForCaptureSettings:(uint64_t)a1;
- (id)_errorRecoveryBufferTypesForBufferTypes:(id)result;
- (id)_nextNRInputForPortType:(id *)result;
- (id)_nrOutputSbufRouter;
- (id)_processingOrderByPortTypeForSettings:(id *)result;
- (id)_setupProcessorControllerConfigurations;
- (id)_standardNROutputRouterWithExpectedQueue:(id)result;
- (id)_ubInferenceInputRouter;
- (id)_ubRERRouter;
- (id)adaptiveBracketingDigitalFlashTotalIntegrationTimesProviderForPortType:(id)a3 wait:(BOOL)a4;
- (id)adaptiveBracketingParametersForDigitalFlashMode:(int)a3 frameStatistics:(id)a4 stationary:(BOOL)a5 sphereOffsetEnabled:(BOOL)a6 detectedObjects:(id)a7;
- (id)nodeSubType;
- (id)nodeType;
- (id)preparedOutputPixelBufferPoolForAttachedMediaKey:(id)a3 format:(id)a4;
- (id)processorController:(id)a3 newInferencesForProcessorInput:(id)a4;
- (id)processorController:(id)a3 newInferencesForProcessorInput:(id)a4 inferenceInputBufferType:(unint64_t)a5;
- (id)processorCoordinator;
- (uint64_t)_flushBufferPoolsWhenPossibleWithSettings:(uint64_t)result;
- (uint64_t)_handleLidarDepthPointCloudSampleBuffer:(uint64_t)result;
- (uint64_t)_handlePointCloudSampleBuffer:(uint64_t)result;
- (uint64_t)_handleSampleBuffer:(uint64_t)a1 input:(void *)a2;
- (uint64_t)_inferenceAttachedMediaRequiredForDemosaicedRawCaptureWithInferenceOutputSampleBuffer:(void *)a3 stillImageSettings:;
- (uint64_t)_inferenceAttachedMediaRequiredForDepthProcessing:(void *)a3 stillImageSettings:;
- (uint64_t)_inferenceOutputPixelBufferPoolForAttachedMediaKey:(uint64_t)result;
- (uint64_t)_inferencesRequiredByProcessorControllersForSettings:(uint64_t)result;
- (uint64_t)_inferencesRequiredForSettings:(uint64_t)result;
- (uint64_t)_infoForCaptureType:(unsigned char *)a3 isSupportedCaptureTypeOut:(char *)a4 isFusionCaptureTypeOut:;
- (uint64_t)_isDemosaicedRawCaptureNeedingInferencesWithSettigs:(uint64_t)a1;
- (uint64_t)_isDepthCaptureNeedingPersonSegmentationMasksWithSettings:(uint64_t)a1;
- (uint64_t)_isInferenceInputImageRequiredForSettings:(uint64_t)result;
- (uint64_t)_isSemanticRenderingCapture:(uint64_t)result;
- (uint64_t)_isSemanticStylesCaptureNeedingInferencesWithSettings:(uint64_t)result;
- (uint64_t)_nrProcessorInputNeededForSettings:(uint64_t)a3 portType:;
- (uint64_t)_processingNeededForSettings:(void *)a3 portType:;
- (uint64_t)_provideInferenceAttachedMediaWithSettings:(uint64_t)result;
- (uint64_t)_provideInferencesForAttachedMediaMode:(void *)a3 settings:;
- (uint64_t)_scaleInferenceInputForRedEyeReductionFromPixelBuffer:(CVPixelBufferRef)destinationBuffer outputPixelBuffer:;
- (uint64_t)_setupProcessingStateForClientBracketWithSettings:(void *)a3 processingPlan:;
- (uint64_t)_setupProcessingStateForDeepFusionWithSettings:(void *)a3 processingPlan:;
- (uint64_t)_setupProcessingStateForDeepZoomWithSettings:(uint64_t)a3 sequenceNumber:(uint64_t)a4 portType:(uint64_t)a5 queueProvidingInput:(void *)a6 processingPlan:;
- (uint64_t)_setupProcessingStateForDeferredCaptureIfNeededWithSettings:(uint64_t)a1;
- (uint64_t)_setupProcessingStateForDisparityIfNeededWithSettings:(uint64_t)a3 sequenceNumber:(void *)a4 processingPlan:;
- (uint64_t)_setupProcessingStateForFlashCaptureWithSettings:(void *)a3 processingPlan:;
- (uint64_t)_setupProcessingStateForInferenceWithSettings:(uint64_t)a3 portType:;
- (uint64_t)_setupProcessingStateForIntelligentDistortionCorrectionIfNeededWithSettings:(uint64_t)a3 sequenceNumber:(uint64_t)a4 portType:(uint64_t)a5 queueProvidingInput:(void *)a6 processingPlan:;
- (uint64_t)_setupProcessingStateForJasperDisparityIfNeededWithSettings:(void *)a3 processingPlan:;
- (uint64_t)_setupProcessingStateForPointCloudDepthIfNeededWithSettings:(void *)a3 processingPlan:;
- (uint64_t)_setupProcessingStateForSingleImageCaptureWithSettings:(void *)a3 processingPlan:;
- (uint64_t)_setupProcessingStateIfNeededWithBeginMomentSettings:(uint64_t)result;
- (uint64_t)_setupProcessingStateWithSettings:(uint64_t)a1;
- (uint64_t)_shouldPassthroughWithStillImageSettings:(uint64_t)result;
- (uint64_t)_singleImageProcessSampleBuffer:(void *)a3 settings:(uint64_t)a4 portType:;
- (uint64_t)_waitForInferenceIfNeededForProcessorInput:(uint64_t)result;
- (uint64_t)processorController:(uint64_t)a3 newOutputPixelBufferForProcessorInput:(uint64_t)a4 type:dimensions:attachedMediaKey:;
- (void)_deepFusionDispatch:(int)a3 direction:(uint64_t)a4 block:;
- (void)_dispatch:(int)a3 direction:(dispatch_queue_t)queue processingQueue:(uint64_t)a5 block:;
- (void)_emitError:(uint64_t)a1 processorInput:(uint64_t)a2 metadata:(void *)a3 description:(uint64_t)a4;
- (void)_emitSampleBuffer:(uint64_t)a3 description:;
- (void)_handleClientBracketFrameEmissionForProcessorInput:(void *)a3 clientBracketFrame:;
- (void)_handleClientBracketFrameEmissionForSampleBuffer:(void *)a3 stillImageSettings:(uint64_t)a4 portType:;
- (void)_handleDeepFusionError:(void *)a3 processorInput:;
- (void)_handleReferenceFrameEmissionForProcessorInput:(uint64_t)a1;
- (void)_handleReferenceFrameEmissionForSampleBuffer:(void *)a3 stillImageSettings:(uint64_t)a4 portType:;
- (void)_handleReferenceFrameEmissionForSettings:(uint64_t)a3 portType:(void *)a4 referenceFrame:(const void *)a5 evMinusReferenceFrame:(void *)a6 errorRecoveryFrame:;
- (void)_handleSupplementalPointCloudSampleBuffer:(uint64_t)a1;
- (void)_inferenceProcessRedEyeReductionSampleBuffer:(void *)a3 settings:(uint64_t)a4 portType:;
- (void)_prepareSharedExternalMemoryResourceForProcessorControllersIfNeeded;
- (void)_processorControllerDidFinishProcessingInputForPortType:(uint64_t)a3 processorType:;
- (void)_propagateSushiRawDNGDictionaryWithOutputSampleBuffer:(uint64_t)a3 requestedDimensions:(int)a4 requiresGDCInformation:;
- (void)_releaseNodeResourcesIfNeededBeforeEmittingSampleBuffer:(uint64_t)a1;
- (void)_releaseResources;
- (void)_removeNonPropagatedAttachedMediaFromSampleBuffer:(uint64_t)a1;
- (void)_resetProcessingState;
- (void)_resetProcessingStateIfDone;
- (void)_setupDeferredProcessingWithSettings:(uint64_t)a3 portType:;
- (void)_setupProcessorCoordinator;
- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5;
- (void)dealloc;
- (void)didReachEndOfDataForInput:(id)a3;
- (void)didSelectFormat:(id)a3 forInput:(id)a4;
- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5;
- (void)didSelectFormat:(id)a3 forOutput:(id)a4;
- (void)handleNodeError:(id)a3 forInput:(id)a4;
- (void)handleStillImagePrewarmWithSettings:(id)a3 forInput:(id)a4;
- (void)prepareForCurrentConfigurationToBecomeLive;
- (void)processorController:(id)a3 didDetermineReferenceFrame:(opaqueCMSampleBuffer *)a4 processorInput:(id)a5 err:(int)a6;
- (void)processorController:(id)a3 didFinishProcessingBuffer:(__CVBuffer *)a4 metadata:(id)a5 type:(unint64_t)a6 captureFrameFlags:(unint64_t)a7 processorInput:(id)a8 err:(int)a9;
- (void)processorController:(id)a3 didFinishProcessingInference:(id)a4 inferenceAttachmentKey:(id)a5 processorInput:(id)a6 err:(int)a7;
- (void)processorController:(id)a3 didFinishProcessingInferenceAttachedMediaMetadata:(id)a4 processorInput:(id)a5;
- (void)processorController:(id)a3 didFinishProcessingInferenceBuffer:(__CVBuffer *)a4 metadata:(id)a5 inferenceAttachedMediaKey:(id)a6 processorInput:(id)a7 err:(int)a8;
- (void)processorController:(id)a3 didFinishProcessingInput:(id)a4 err:(int)a5;
- (void)processorController:(id)a3 didFinishProcessingSampleBuffer:(opaqueCMSampleBuffer *)a4 type:(unint64_t)a5 processorInput:(id)a6 err:(int)a7;
- (void)processorController:(id)a3 didSelectFusionMode:(int)a4 processorInput:(id)a5;
- (void)processorController:(id)a3 didSelectLowLightReferenceFrame:(opaqueCMSampleBuffer *)a4 processorInput:(id)a5;
- (void)processorController:(id)a3 didSelectNewReferenceFrameWithPTS:(id *)a4 transform:(id)a5 processorInput:(id)a6;
- (void)processorController:(id)a3 willAddBuffer:(__CVBuffer *)a4 metadata:(id)a5 bufferType:(unint64_t)a6 processorInput:(id)a7;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
- (void)stopAdaptiveBracketingForSettings:(id)a3 withGroup:(int)a4;
@end

@implementation BWUBNode

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (BWUBNode)initWithNodeConfiguration:(id)a3 captureDevice:(id)a4
{
  v20.receiver = self;
  v20.super_class = (Class)BWUBNode;
  v6 = [(BWNode *)&v20 init];
  v7 = v6;
  if (!v6) {
    return v7;
  }
  if (!a3)
  {

    return 0;
  }
  v6->_nodeConfiguration = (BWUBNodeConfiguration *)a3;
  v8 = [[BWNodeInput alloc] initWithMediaType:1986618469 node:v7 index:0];
  v9 = objc_alloc_init(BWVideoFormatRequirements);
  v10 = (void *)[MEMORY[0x1E4F1CA48] array];
  BOOL v11 = -[BWUBNodeConfiguration generateLiDARDepth]((BOOL)v7->_nodeConfiguration);
  if (-[BWUBNodeConfiguration inputIs10Bit]((BOOL)v7->_nodeConfiguration))
  {
    [v10 addObject:&unk_1EFAFFF60];
    if (!v11) {
      [v10 addObject:&unk_1EFAFFF78];
    }
    if (-[BWUBNodeConfiguration semanticStyleRenderingEnabled]((BOOL)a3)) {
      goto LABEL_12;
    }
    [v10 addObject:&unk_1EFAFFF90];
    if (v11) {
      goto LABEL_12;
    }
    v12 = &unk_1EFAFFFA8;
    goto LABEL_11;
  }
  [v10 addObject:&unk_1EFAFFFC0];
  if (!v11)
  {
    v12 = &unk_1EFAFFFD8;
LABEL_11:
    [v10 addObject:v12];
  }
LABEL_12:
  if (-[BWUBNodeConfiguration stillImageFusionScheme]((uint64_t)v7->_nodeConfiguration) == 4)
  {
    int v13 = [(BWStillImageNodeConfiguration *)v7->_nodeConfiguration maxLossyCompressionLevel];
    BOOL v14 = !-[BWUBNodeConfiguration inputIs10Bit]((BOOL)v7->_nodeConfiguration);
    BOOL v15 = -[BWUBNodeConfiguration inputIs10Bit]((BOOL)v7->_nodeConfiguration);
    objc_msgSend(v10, "addObjectsFromArray:", FigCaptureSupportedCompressedPixelFormatsForSettings(4, v13, !v11, 1, 0, v14, v15, 0));
  }
  [(BWVideoFormatRequirements *)v9 setSupportedPixelFormats:v10];
  if (-[BWUBNodeConfiguration inputIs10Bit]((BOOL)v7->_nodeConfiguration)) {
    uint64_t v16 = 64;
  }
  else {
    uint64_t v16 = 16;
  }
  [(BWVideoFormatRequirements *)v9 setBytesPerRowAlignment:v16];
  [(BWVideoFormatRequirements *)v9 setHeightAlignment:16];
  [(BWNodeInput *)v8 setFormatRequirements:v9];
  [(BWNodeInput *)v8 setPassthroughMode:0];
  -[BWNodeInput setRetainedBufferCount:](v8, "setRetainedBufferCount:", -[BWUBNodeConfiguration retainedBufferCount]((uint64_t)v7->_nodeConfiguration));
  [(BWNode *)v7 addInput:v8];
  if (-[BWUBNodeConfiguration generateLiDARDepth]((BOOL)a3)
    || [a4 supplementalPointCloudCaptureDevice])
  {
    if (-[BWUBNodeConfiguration generateLiDARDepth]((BOOL)a3)
      && [a4 supplementalPointCloudCaptureDevice])
    {
      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"We should not be generating LiDAR depth and using the ToF camera in the supplemental mode at the same time" userInfo:0]);
    }
    v7->_pointCloudInput = [[BWNodeInput alloc] initWithMediaType:1885564004 node:v7 index:1];
    [(BWNodeInput *)v7->_pointCloudInput setFormatRequirements:objc_alloc_init(BWPointCloudFormatRequirements)];
    [(BWNodeInput *)v7->_pointCloudInput setRetainedBufferCount:1000];
    [(BWNode *)v7 addInput:v7->_pointCloudInput];
    v7->_pointCloudLock._os_unfair_lock_opaque = 0;
    v7->_discardPointClouds = 1;
  }
  v17 = [[BWNodeOutput alloc] initWithMediaType:1986618469 node:v7];
  -[BWNodeOutput setOwningNodeRetainedBufferCount:](v17, "setOwningNodeRetainedBufferCount:", -[BWUBNodeConfiguration outputBufferCount]((uint64_t)v7->_nodeConfiguration) - 1);
  -[BWNodeOutput setPixelBufferPoolProvidesBackPressure:](v17, "setPixelBufferPoolProvidesBackPressure:", -[BWUBNodeConfiguration outputPoolBackPressureEnabled]((BOOL)v7->_nodeConfiguration));
  -[BWNodeOutput setPixelBufferPoolReportSlowBackPressureAllocations:](v17, "setPixelBufferPoolReportSlowBackPressureAllocations:", -[BWUBNodeConfiguration outputPoolBackPressureEnabled]((BOOL)v7->_nodeConfiguration));
  [(BWNodeOutput *)v17 setPassthroughMode:0];
  [(BWNode *)v7 addOutput:v17];
  v18 = (BWFigVideoCaptureDevice *)a4;
  v7->_device = v18;
  [(BWFigVideoCaptureDevice *)v18 setAdaptiveUnifiedBracketingController:v7];
  -[BWUBNode _setupProcessorControllerConfigurations](v7);
  return v7;
}

- (id)_setupProcessorControllerConfigurations
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    id v1 = result;
    if (dword_1EB4C5670)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      result = (id)fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    if (!*((void *)v1 + 15))
    {
      *((void *)v1 + 15) = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithArray:", objc_msgSend((id)-[BWUBNodeConfiguration sensorConfigurationsByPortType](*((void *)v1 + 14)), "allKeys"));
      *((_DWORD *)v1 + 42) = 0;
      [*((id *)v1 + 14) figThreadPriority];
      *((void *)v1 + 20) = FigDispatchQueueCreateWithPriority();
      [*((id *)v1 + 14) figThreadPriority];
      *((void *)v1 + 22) = FigDispatchQueueCreateWithPriority();
      *((unsigned char *)v1 + 184) = [+[FigCaptureCameraParameters sharedInstance] nrfVersion] > 2;
      id v3 = BWUBCreateNRProcessorControllerConfiguration(*((void **)v1 + 14), (uint64_t *)v1 + 26);
      *((void *)v1 + 27) = v3;
      if (v3) {
        *((void *)v1 + 28) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      }
      *((void *)v1 + 29) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      *((void *)v1 + 30) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      *((void *)v1 + 64) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v4 = BWUBCreateDeferredProcessorControllerConfiguration(*((void **)v1 + 14));
      *((void *)v1 + 76) = v4;
      if (v4)
      {
        [*((id *)v1 + 14) figThreadPriority];
        *((void *)v1 + 75) = FigDispatchQueueCreateWithPriority();
        *((void *)v1 + 77) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      }
      *((void *)v1 + 72) = BWUBCreateDeferredContainerControllerConfiguration(*((void **)v1 + 14));
      v5 = BWUBCreateDeepFusionProcessorControllerConfiguration(*((void **)v1 + 14));
      *((void *)v1 + 33) = v5;
      if (v5)
      {
        *((void *)v1 + 34) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        [*((id *)v1 + 14) figThreadPriority];
        *((void *)v1 + 35) = FigDispatchQueueCreateWithPriority();
        [*((id *)v1 + 33) setDelayPrepareAndCacheBuffers:0];
      }
      v6 = BWUBCreateLearnedNRProcessorControllerConfiguration(*((void **)v1 + 14));
      *((void *)v1 + 31) = v6;
      if (v6) {
        *((void *)v1 + 32) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      }
      *((void *)v1 + 38) = BWUBCreateInferenceControllerConfiguration(*((void **)v1 + 14));
      [*((id *)v1 + 14) figThreadPriority];
      *((void *)v1 + 40) = FigDispatchQueueCreateWithPriority();
      if (*((void *)v1 + 38))
      {
        *((void *)v1 + 39) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        *((void *)v1 + 41) = dispatch_group_create();
      }
      v7 = BWUBCreateRedEyeProcessorControllerConfiguration(*((void **)v1 + 14));
      *((void *)v1 + 50) = v7;
      if (v7) {
        *((void *)v1 + 51) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      }
      v8 = BWUBCreateIntelligentDistortionCorrectionProcessorControllerConfiguration(*((void **)v1 + 14));
      *((void *)v1 + 52) = v8;
      if (v8)
      {
        *((void *)v1 + 53) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        *((void *)v1 + 54) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        *((void *)v1 + 57) = (id)objc_msgSend(+[BWIntelligentDistortionCorrectionProcessorController captureTypesWithIDCSupportWithOptionalCaptureFlags](BWIntelligentDistortionCorrectionProcessorController, "captureTypesWithIDCSupportWithOptionalCaptureFlags"), "allKeys");
      }
      v9 = BWUBCreateDeepZoomProcessorControllerConfiguration(*((void **)v1 + 14));
      *((void *)v1 + 58) = v9;
      if (v9) {
        *((void *)v1 + 59) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      }
      v10 = BWUBCreateStereoDisparityProcessorControllerConfiguration(*((void **)v1 + 14));
      *((void *)v1 + 60) = v10;
      if (v10)
      {
        *((void *)v1 + 65) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        [*((id *)v1 + 14) figThreadPriority];
        *((void *)v1 + 63) = FigDispatchQueueCreateWithPriority();
      }
      if (objc_msgSend(*((id *)v1 + 13), "supplementalPointCloudCaptureDevice", v12, v13))
      {
        BOOL v11 = BWUBCreateJasperColorStillsExecutorControllerConfiguration(*((void **)v1 + 14));
        *((void *)v1 + 68) = v11;
        if (v11) {
          *((void *)v1 + 69) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        }
      }
      result = BWUBCreateJasperDisparityProcessorControllerConfiguration(*((void **)v1 + 14));
      *((void *)v1 + 70) = result;
      if (result)
      {
        result = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        *((void *)v1 + 71) = result;
      }
    }
  }
  return result;
}

- (void)dealloc
{
  -[BWUBNode _releaseResources]((uint64_t)self);

  self->_emitQueue = 0;
  v3.receiver = self;
  v3.super_class = (Class)BWUBNode;
  [(BWNode *)&v3 dealloc];
}

- (void)_releaseResources
{
  if (a1)
  {
    if (!_FigIsNotCurrentDispatchQueue()) {
      FigDebugAssert3();
    }
    if (!*(unsigned char *)(a1 + 96))
    {
      v2 = *(NSObject **)(a1 + 600);
      if (v2)
      {
        uint64_t block = MEMORY[0x1E4F143A8];
        uint64_t v12 = 3221225472;
        uint64_t v13 = __ubn_dispatch_sync_block_invoke;
        uint64_t v14 = &unk_1E5C249F0;
        BOOL v15 = &__block_literal_global_330;
        dispatch_sync(v2, &block);

        *(void *)(a1 + 600) = 0;
      }
      objc_super v3 = *(NSObject **)(a1 + 160);
      if (v3)
      {
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        v10[2] = __29__BWUBNode__releaseResources__block_invoke_2;
        v10[3] = &unk_1E5C24430;
        v10[4] = a1;
        uint64_t block = MEMORY[0x1E4F143A8];
        uint64_t v12 = 3221225472;
        uint64_t v13 = __ubn_dispatch_sync_block_invoke;
        uint64_t v14 = &unk_1E5C249F0;
        BOOL v15 = v10;
        dispatch_sync(v3, &block);
      }

      *(void *)(a1 + 120) = 0;
      *(void *)(a1 + 200) = 0;

      *(void *)(a1 + 216) = 0;
      *(void *)(a1 + 224) = 0;

      *(void *)(a1 + 584) = 0;
      *(void *)(a1 + 576) = 0;

      *(void *)(a1 + 232) = 0;
      *(void *)(a1 + 240) = 0;

      *(void *)(a1 + 512) = 0;
      *(void *)(a1 + 160) = 0;

      *(void *)(a1 + 192) = 0;
      *(void *)(a1 + 112) = 0;

      *(void *)(a1 + 104) = 0;
      *(void *)(a1 + 264) = 0;

      *(void *)(a1 + 280) = 0;
      *(void *)(a1 + 288) = 0;

      *(void *)(a1 + 296) = 0;
      *(void *)(a1 + 272) = 0;

      *(void *)(a1 + 312) = 0;
      *(void *)(a1 + 248) = 0;

      *(void *)(a1 + 256) = 0;
      *(void *)(a1 + 304) = 0;

      *(void *)(a1 + 320) = 0;
      *(void *)(a1 + 328) = 0;

      *(void *)(a1 + 336) = 0;
      *(void *)(a1 + 344) = 0;
      v4 = *(const void **)(a1 + 360);
      if (v4)
      {
        CFRelease(v4);
        *(void *)(a1 + 360) = 0;
      }

      *(void *)(a1 + 352) = 0;
      v5 = *(const void **)(a1 + 368);
      if (v5)
      {
        CFRelease(v5);
        *(void *)(a1 + 368) = 0;
      }
      v6 = *(const void **)(a1 + 376);
      if (v6)
      {
        CFRelease(v6);
        *(void *)(a1 + 376) = 0;
      }
      v7 = *(const void **)(a1 + 384);
      if (v7)
      {
        CFRelease(v7);
        *(void *)(a1 + 384) = 0;
      }

      *(void *)(a1 + 392) = 0;
      *(void *)(a1 + 416) = 0;

      *(void *)(a1 + 424) = 0;
      *(void *)(a1 + 432) = 0;

      *(void *)(a1 + 448) = 0;
      *(void *)(a1 + 456) = 0;

      *(void *)(a1 + 464) = 0;
      *(void *)(a1 + 472) = 0;

      *(void *)(a1 + 480) = 0;
      *(void *)(a1 + 488) = 0;

      *(void *)(a1 + 520) = 0;
      *(void *)(a1 + 504) = 0;

      *(void *)(a1 + 544) = 0;
      *(void *)(a1 + 552) = 0;

      *(void *)(a1 + 560) = 0;
      *(void *)(a1 + 568) = 0;

      *(void *)(a1 + 400) = 0;
      *(void *)(a1 + 408) = 0;

      *(void *)(a1 + 600) = 0;
      *(void *)(a1 + 608) = 0;

      *(void *)(a1 + 616) = 0;
      v8 = *(const void **)(a1 + 592);
      if (v8)
      {
        CFRelease(v8);
        *(void *)(a1 + 592) = 0;
      }

      *(void *)(a1 + 528) = 0;
      *(void *)(a1 + 152) = 0;
      v9 = *(const void **)(a1 + 632);
      if (v9)
      {
        CFRelease(v9);
        *(void *)(a1 + 632) = 0;
      }
      *(unsigned char *)(a1 + 96) = 1;
    }
  }
}

- (BWNodeInput)pointCloudInput
{
  return self->_pointCloudInput;
}

- (BOOL)idcSupportedForCaptureType:(int)a3 captureFlags:(unint64_t)a4 portType:(id)a5
{
  if (!self->_intelligentDistortionCorrectionControllerConfiguration) {
    return 0;
  }
  uint64_t v5 = *(void *)&a3;
  if (![(id)-[BWUBNodeConfiguration portTypesWithIntelligentDistortionCorrectionEnabled]((uint64_t)self->_nodeConfiguration) containsObject:a5])return 0; {
  captureTypesWithIntelligentDistortionCorrectionSupport = self->_captureTypesWithIntelligentDistortionCorrectionSupport;
  }
  uint64_t v8 = [NSNumber numberWithInt:v5];
  return [(NSArray *)captureTypesWithIntelligentDistortionCorrectionSupport containsObject:v8];
}

- (BOOL)demosaicedRawSupportedForCaptureType:(int)a3
{
  if (a3 <= 0xC && ((1 << a3) & 0x1C86) != 0) {
    return [(BWNoiseReductionAndFusionProcessorControllerConfiguration *)self->_nrProcessorControllerConfiguration demosaicedRawEnabled];
  }
  else {
    return 0;
  }
}

- (BOOL)processingOnBeginMomentSupportedForCaptureSettings:(id)a3
{
  return 0;
}

- (BOOL)rawNightModeSupportedForPortType:(id)a3
{
  return 0;
}

- (id)processorCoordinator
{
  return self->_processorCoordinator;
}

- (id)nodeType
{
  return @"Effect";
}

- (id)nodeSubType
{
  return @"UnifiedBracketingProcessor";
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
  v103[1] = *MEMORY[0x1E4F143B8];
  if (self->_pointCloudInput != a4)
  {
    BOOL v6 = -[BWUBNode _requiresResizedOutputDimensionsWithInputWidth:inputHeight:]((BOOL)self, [a3 width], objc_msgSend(a3, "height"));
    if (v6) {
      [(NSArray *)[(BWIntelligentDistortionCorrectionProcessorControllerConfiguration *)self->_intelligentDistortionCorrectionControllerConfiguration portTypesWithGeometricDistortionCorrectionEnabled] count];
    }
    uint64_t v7 = [(BWNodeOutput *)self->super._output owningNodeRetainedBufferCount];
    int v8 = v7 + 1;
    if (self->_intelligentDistortionCorrectionControllerConfiguration) {
      int v9 = v6;
    }
    else {
      int v9 = 1;
    }
    unsigned int v66 = v7 + 1;
    int v64 = v9;
    if ((v9 & 1) == 0)
    {
      unsigned int v66 = 2 * v8;
      self->_dcOutputBufferCount = 2 * v8;
    }
    if ([(BWNoiseReductionAndFusionProcessorControllerConfiguration *)self->_nrProcessorControllerConfiguration demosaicedRawEnabled])self->_demosaicedRawOutputBufferCount = v8; {
    else
    }
      uint64_t v7 = 0xFFFFFFFFLL;
    deepZoomProcessorControllerConfiguration = self->_deepZoomProcessorControllerConfiguration;
    BOOL v65 = [(BWStillImageNodeConfiguration *)self->_nodeConfiguration deferredPhotoProcessorEnabled];
    if (deepZoomProcessorControllerConfiguration) {
      unsigned int v11 = v66 + 1;
    }
    else {
      unsigned int v11 = v66;
    }
    v67 = objc_alloc_init(BWVideoFormatRequirements);
    if (FigCapturePixelFormatIsFullRange([a3 pixelFormat])) {
      uint64_t v12 = 875704422;
    }
    else {
      uint64_t v12 = 875704438;
    }
    v103[0] = [NSNumber numberWithUnsignedInt:v12];
    uint64_t v13 = (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v103 count:1];
    if (FigCapturePlatformSupportsUniversalCompression())
    {
      uint64_t v14 = self;
      if (!self->_deepZoomProcessorControllerConfiguration && self->_nrProcessorControllerType == 6)
      {
        int v15 = [(BWStillImageNodeConfiguration *)self->_nodeConfiguration maxLossyCompressionLevel];
        if (self->_deepFusionProcessorControllerConfiguration) {
          int v16 = 0;
        }
        else {
          int v16 = v15;
        }
        uint64_t v13 = FigCapturePixelFormatsByAddingCompressedVariants(v13, v16);
      }
    }
    else
    {
      uint64_t v14 = self;
    }
    uint64_t v17 = v11 - 1;
    if ([a3 colorSpaceProperties])
    {
      uint64_t v102 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(a3, "colorSpaceProperties"));
      uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v102 count:1];
    }
    else
    {
      uint64_t v18 = 0;
    }
    [(BWVideoFormatRequirements *)v67 setSupportedColorSpaceProperties:v18];
    [(BWVideoFormatRequirements *)v67 setSupportedPixelFormats:v13];
    if (v6)
    {
      -[BWVideoFormatRequirements setWidth:](v67, "setWidth:", (int)-[BWUBNodeConfiguration outputDimensions]((uint64_t)v14->_nodeConfiguration));
      uint64_t v19 = -[BWUBNodeConfiguration outputDimensions]((uint64_t)v14->_nodeConfiguration) >> 32;
    }
    else
    {
      -[BWVideoFormatRequirements setWidth:](v67, "setWidth:", [a3 width]);
      uint64_t v19 = [a3 height];
    }
    [(BWVideoFormatRequirements *)v67 setHeight:v19];
    [(BWVideoFormatRequirements *)v67 setBytesPerRowAlignment:64];
    [(BWVideoFormatRequirements *)v67 setHeightAlignment:16];
    [(BWVideoFormatRequirements *)v67 setPlaneAlignment:64];
    [(BWVideoFormatRequirements *)v67 setSupportedCacheModes:+[BWVideoFormatRequirements cacheModesForOptimizedHWAccess]];
    [(BWNodeOutput *)v14->super._output setFormatRequirements:v67];
    [(BWNodeOutput *)v14->super._output setOwningNodeRetainedBufferCount:v17];
    unsigned int v20 = [a3 width];
    unsigned int v21 = [a3 height];
    [(BWNoiseReductionAndFusionProcessorControllerConfiguration *)v14->_nrProcessorControllerConfiguration setInputFormat:a3];
    [(BWNoiseReductionAndFusionProcessorControllerConfiguration *)v14->_nrProcessorControllerConfiguration setDeepFusionInputFormat:a3];
    [(BWDeepFusionProcessorControllerConfiguration *)v14->_deepFusionProcessorControllerConfiguration setMaxInputDimensions:v20 | ((unint64_t)v21 << 32)];
    [(BWDeepZoomProcessorControllerConfiguration *)v14->_deepZoomProcessorControllerConfiguration setInputFormat:a3];
    BOOL v72 = [(BWNodeOutputMediaConfiguration *)[(BWNodeOutput *)v14->super._output primaryMediaConfiguration] pixelBufferPoolProvidesBackPressure];
    if ([(BWNoiseReductionAndFusionProcessorControllerConfiguration *)v14->_nrProcessorControllerConfiguration demosaicedRawEnabled])
    {
      v22 = -[BWUBNode _demosaicedRawFormatRequirementsWithDimensions:colorSpaceProperties:]((uint64_t)v14, -[BWVideoFormatRequirements width](v67, "width") | ((unint64_t)-[BWVideoFormatRequirements height](v67, "height") << 32), objc_msgSend(-[NSArray firstObject](-[BWVideoFormatRequirements supportedColorSpaceProperties](v67, "supportedColorSpaceProperties"), "firstObject"), "intValue"));
      v23 = objc_alloc_init(BWNodeOutputMediaConfiguration);
      [(BWNodeOutputMediaConfiguration *)v23 setFormatRequirements:v22];
      [(BWNodeOutputMediaConfiguration *)v23 setPassthroughMode:0];
      [(BWNodeOutputMediaConfiguration *)v23 setProvidesPixelBufferPool:1];
      [(BWNodeOutputMediaConfiguration *)v23 setOwningNodeRetainedBufferCount:v7];
      [(BWNodeOutputMediaConfiguration *)v23 setPixelBufferPoolProvidesBackPressure:v72];
      [(BWNodeOutputMediaConfiguration *)v23 setPixelBufferPoolReportSlowBackPressureAllocations:v72];
      [(BWNodeOutput *)v14->super._output setMediaConfiguration:v23 forAttachedMediaKey:0x1EFA745E0];
    }
    id v99 = a3;
    v100 = &unk_1EFAFFFF0;
    uint64_t v101 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v99 count:1];
    -[BWLearnedNRProcessorControllerConfiguration setInputFormatsByQSubResolutionFlavor:](v14->_learnedNRProcessorControllerConfiguration, "setInputFormatsByQSubResolutionFlavor:", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v101 forKeys:&v100 count:1]);
    [(BWLearnedNRProcessorControllerConfiguration *)v14->_learnedNRProcessorControllerConfiguration setOutputFormat:a3];
    v24 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
    long long v91 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    long long v94 = 0u;
    v71 = v14;
    obuint64_t j = (id)-[BWUBNodeConfiguration providedInferenceAttachedMediaByMode]((uint64_t)v14->_nodeConfiguration);
    uint64_t v75 = [obj countByEnumeratingWithState:&v91 objects:v98 count:16];
    if (v75)
    {
      uint64_t v73 = *(void *)v92;
      do
      {
        uint64_t v25 = 0;
        do
        {
          if (*(void *)v92 != v73) {
            objc_enumerationMutation(obj);
          }
          uint64_t v77 = v25;
          uint64_t v26 = *(void *)(*((void *)&v91 + 1) + 8 * v25);
          long long v87 = 0u;
          long long v88 = 0u;
          long long v89 = 0u;
          long long v90 = 0u;
          v27 = (void *)[(id)-[BWUBNodeConfiguration providedInferenceAttachedMediaByMode]((uint64_t)v71->_nodeConfiguration) objectForKeyedSubscript:v26];
          uint64_t v28 = [v27 countByEnumeratingWithState:&v87 objects:v97 count:16];
          if (v28)
          {
            uint64_t v29 = v28;
            uint64_t v30 = *(void *)v88;
            do
            {
              for (uint64_t i = 0; i != v29; ++i)
              {
                if (*(void *)v88 != v30) {
                  objc_enumerationMutation(v27);
                }
                uint64_t v32 = *(void *)(*((void *)&v87 + 1) + 8 * i);
                v33 = (void *)[v24 objectForKeyedSubscript:v32];
                if (v33) {
                  [v33 addObject:v26];
                }
                else {
                  objc_msgSend(v24, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObject:", v26), v32);
                }
              }
              uint64_t v29 = [v27 countByEnumeratingWithState:&v87 objects:v97 count:16];
            }
            while (v29);
          }
          uint64_t v25 = v77 + 1;
        }
        while (v77 + 1 != v75);
        uint64_t v75 = [obj countByEnumeratingWithState:&v91 objects:v98 count:16];
      }
      while (v75);
    }

    v34 = (NSDictionary *)[v24 copy];
    v71->_providedInferenceAttachedMediaModesByAttachedMediaKey = v34;
    long long v83 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    v68 = v34;
    uint64_t v74 = [(NSDictionary *)v34 countByEnumeratingWithState:&v83 objects:v96 count:16];
    if (v74)
    {
      uint64_t v69 = *(void *)v84;
      do
      {
        uint64_t v35 = 0;
        do
        {
          if (*(void *)v84 != v69) {
            objc_enumerationMutation(v68);
          }
          uint64_t v36 = *(void *)(*((void *)&v83 + 1) + 8 * v35);
          uint64_t v78 = v35;
          if (+[BWMattingV2InferenceConfiguration isMattingOutputAttachedMediaKey:v36])
          {
            double v37 = -[BWUBNodeConfiguration inferenceMainImageDownscalingFactor]((uint64_t)v71->_nodeConfiguration);
            if (*(float *)&v37 == 0.0)
            {
              v38 = 0;
            }
            else
            {
              v38 = objc_alloc_init(BWVideoFormatRequirements);
              float v39 = (float)[(BWVideoFormatRequirements *)v67 width];
              double v40 = -[BWUBNodeConfiguration inferenceMainImageDownscalingFactor]((uint64_t)v71->_nodeConfiguration);
              [(BWVideoFormatRequirements *)v38 setWidth:(unint64_t)(float)(v39 / *(float *)&v40)];
              float v41 = (float)[(BWVideoFormatRequirements *)v67 height];
              double v42 = -[BWUBNodeConfiguration inferenceMainImageDownscalingFactor]((uint64_t)v71->_nodeConfiguration);
              [(BWVideoFormatRequirements *)v38 setHeight:(unint64_t)(float)(v41 / *(float *)&v42)];
              [(BWVideoFormatRequirements *)v38 setSupportedPixelFormats:&unk_1EFB036B0];
              [(BWVideoFormatRequirements *)v38 setBytesPerRowAlignment:64];
              [(BWVideoFormatRequirements *)v38 setPlaneAlignment:64];
              [(BWVideoFormatRequirements *)v38 setWidthAlignment:16];
              [(BWVideoFormatRequirements *)v38 setHeightAlignment:16];
              [(BWVideoFormatRequirements *)v38 setMemoryPoolUseAllowed:0];
            }
          }
          else
          {
            v38 = objc_alloc_init(BWVideoFormatRequirements);
            [(BWVideoFormatRequirements *)v38 setWidth:512];
            [(BWVideoFormatRequirements *)v38 setHeight:384];
            [(BWVideoFormatRequirements *)v38 setSupportedPixelFormats:&unk_1EFB036C8];
            [(BWVideoFormatRequirements *)v38 setBytesPerRowAlignment:64];
          }
          long long v81 = 0u;
          long long v82 = 0u;
          long long v79 = 0u;
          long long v80 = 0u;
          uint64_t v76 = v36;
          v43 = (void *)[v24 objectForKeyedSubscript:v36];
          uint64_t v44 = [v43 countByEnumeratingWithState:&v79 objects:v95 count:16];
          if (v44)
          {
            uint64_t v45 = v44;
            LODWORD(v46) = 0;
            uint64_t v47 = *(void *)v80;
            do
            {
              for (uint64_t j = 0; j != v45; ++j)
              {
                if (*(void *)v80 != v47) {
                  objc_enumerationMutation(v43);
                }
                int v49 = [*(id *)(*((void *)&v79 + 1) + 8 * j) intValue];
                if (v49 == 2)
                {
                  int v50 = [(BWNodeOutput *)v71->super._output owningNodeRetainedBufferCount];
                }
                else if (v49 == 1)
                {
                  int v50 = v7;
                }
                else
                {
                  int v50 = 0;
                }
                if ((int)v46 <= v50) {
                  uint64_t v46 = v50;
                }
                else {
                  uint64_t v46 = v46;
                }
              }
              uint64_t v45 = [v43 countByEnumeratingWithState:&v79 objects:v95 count:16];
            }
            while (v45);
          }
          else
          {
            uint64_t v46 = 0;
          }
          uint64_t v51 = v72 | [(BWStillImageNodeConfiguration *)v71->_nodeConfiguration deferredCaptureSupportEnabled];
          v52 = objc_alloc_init(BWNodeOutputMediaConfiguration);
          [(BWNodeOutputMediaConfiguration *)v52 setFormatRequirements:v38];
          [(BWNodeOutputMediaConfiguration *)v52 setPassthroughMode:0];
          [(BWNodeOutputMediaConfiguration *)v52 setProvidesPixelBufferPool:!v65];
          [(BWNodeOutputMediaConfiguration *)v52 setOwningNodeRetainedBufferCount:v46];
          [(BWNodeOutputMediaConfiguration *)v52 setPixelBufferPoolProvidesBackPressure:v51];
          [(BWNodeOutputMediaConfiguration *)v52 setPixelBufferPoolReportSlowBackPressureAllocations:v51];
          [(BWNodeOutput *)v71->super._output setMediaConfiguration:v52 forAttachedMediaKey:v76];
          uint64_t v35 = v78 + 1;
        }
        while (v78 + 1 != v74);
        uint64_t v74 = [(NSDictionary *)v68 countByEnumeratingWithState:&v83 objects:v96 count:16];
      }
      while (v74);
    }
    [(BWNoiseReductionAndFusionProcessorControllerConfiguration *)v71->_nrProcessorControllerConfiguration gainMapMainImageDownscalingFactor];
    if (v53 != 0.0)
    {
      v54 = objc_alloc_init(BWNodeOutputMediaConfiguration);
      v55 = objc_alloc_init(BWVideoFormatRequirements);
      [(BWVideoFormatRequirements *)v55 setSupportedPixelFormats:&unk_1EFB036E0];
      float v56 = (float)[(BWVideoFormatRequirements *)v67 width];
      [(BWNoiseReductionAndFusionProcessorControllerConfiguration *)v71->_nrProcessorControllerConfiguration gainMapMainImageDownscalingFactor];
      [(BWVideoFormatRequirements *)v55 setWidth:(unint64_t)(float)(v56 / v57)];
      float v58 = (float)[(BWVideoFormatRequirements *)v67 height];
      [(BWNoiseReductionAndFusionProcessorControllerConfiguration *)v71->_nrProcessorControllerConfiguration gainMapMainImageDownscalingFactor];
      [(BWVideoFormatRequirements *)v55 setHeight:(unint64_t)(float)(v58 / v59)];
      [(BWNodeOutputMediaConfiguration *)v54 setFormatRequirements:v55];
      [(BWNodeOutputMediaConfiguration *)v54 setPassthroughMode:0];
      [(BWNodeOutputMediaConfiguration *)v54 setProvidesPixelBufferPool:v65 & v64 ^ 1u];
      [(BWNodeOutputMediaConfiguration *)v54 setOwningNodeRetainedBufferCount:(v66 >> (v65 & (v64 ^ 1))) - 1];
      [(BWNodeOutputMediaConfiguration *)v54 setPixelBufferPoolProvidesBackPressure:v72];
      [(BWNodeOutputMediaConfiguration *)v54 setPixelBufferPoolReportSlowBackPressureAllocations:v72];
      [(BWNodeOutput *)v71->super._output setMediaConfiguration:v54 forAttachedMediaKey:0x1EFA4EB60];
    }
    if (v71->_stereoDisparityProcessorControllerConfiguration
      || -[BWUBNodeConfiguration generateLiDARDepth]((BOOL)v71->_nodeConfiguration))
    {
      v60 = objc_alloc_init(BWNodeOutputMediaConfiguration);
      v61 = objc_alloc_init(BWVideoFormatRequirements);
      stereoDisparityProcessorControllerConfiguration = v71->_stereoDisparityProcessorControllerConfiguration;
      if (stereoDisparityProcessorControllerConfiguration)
      {
        [(BWVideoFormatRequirements *)v61 setWidth:(int)[(BWStereoDisparityProcessorControllerConfiguration *)stereoDisparityProcessorControllerConfiguration disparityOutputDimensions]];
        [(BWVideoFormatRequirements *)v61 setHeight:[(BWStereoDisparityProcessorControllerConfiguration *)v71->_stereoDisparityProcessorControllerConfiguration disparityOutputDimensions] >> 32];
        if ([(BWStereoDisparityProcessorControllerConfiguration *)v71->_stereoDisparityProcessorControllerConfiguration stillImageDepthDataType] == 2)
        {
          v63 = objc_alloc_init(BWNodeInputMediaConfiguration);
          [(BWNodeInputMediaConfiguration *)v63 setFormatRequirements:objc_alloc_init(BWVideoFormatRequirements)];
          [(BWNodeInputMediaConfiguration *)v63 setPassthroughMode:0];
          [(BWNodeInput *)v71->super._input setMediaConfiguration:v63 forAttachedMediaKey:0x1EFA74380];
        }
      }
      else if (-[BWUBNodeConfiguration generateLiDARDepth]((BOOL)v71->_nodeConfiguration))
      {
        -[BWVideoFormatRequirements setWidth:](v61, "setWidth:", (int)-[BWUBNodeConfiguration disparityOutputDimensions]((uint64_t)v71->_nodeConfiguration));
        -[BWVideoFormatRequirements setHeight:](v61, "setHeight:", -[BWUBNodeConfiguration disparityOutputDimensions]((uint64_t)v71->_nodeConfiguration) >> 32);
      }
      [(BWVideoFormatRequirements *)v61 setSupportedPixelFormats:&unk_1EFB036F8];
      [(BWNodeOutputMediaConfiguration *)v60 setFormatRequirements:v61];
      [(BWNodeOutputMediaConfiguration *)v60 setPassthroughMode:0];
      [(BWNodeOutputMediaConfiguration *)v60 setProvidesPixelBufferPool:1];
      [(BWNodeOutputMediaConfiguration *)v60 setOwningNodeRetainedBufferCount:[(BWNodeOutput *)v71->super._output owningNodeRetainedBufferCount]];
      [(BWNodeOutput *)v71->super._output setMediaConfiguration:v60 forAttachedMediaKey:@"Depth"];
    }
  }
}

- (BOOL)_requiresResizedOutputDimensionsWithInputWidth:(uint64_t)a3 inputHeight:
{
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = -[BWUBNodeConfiguration outputDimensions](*(void *)(result + 112));
    result = FigCaptureVideoDimensionsAreValid(v6);
    if (result) {
      return a2 != (int)-[BWUBNodeConfiguration outputDimensions](*(void *)(v5 + 112))
    }
          || a3 != -[BWUBNodeConfiguration outputDimensions](*(void *)(v5 + 112)) >> 32;
  }
  return result;
}

- (BWVideoFormatRequirements)_demosaicedRawFormatRequirementsWithDimensions:(int)a3 colorSpaceProperties:
{
  v12[1] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  BOOL v5 = (a3 & 0xFFFFFFFD) != 1;
  if ((a3 & 0xFFFFFFFD) == 1) {
    unsigned int v6 = 9;
  }
  else {
    unsigned int v6 = 0;
  }
  if (a3 == 4)
  {
    BOOL v5 = 0;
    unsigned int v6 = 8;
  }
  BOOL v7 = a3 != 2 && v5;
  if (a3 == 2) {
    uint64_t v8 = 8;
  }
  else {
    uint64_t v8 = v6;
  }
  int v9 = objc_alloc_init(BWVideoFormatRequirements);
  v12[0] = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(*(id *)(a1 + 216), "demosaicedRawPixelFormat"));
  -[BWVideoFormatRequirements setSupportedPixelFormats:](v9, "setSupportedPixelFormats:", [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1]);
  [(BWVideoFormatRequirements *)v9 setWidth:(int)a2];
  [(BWVideoFormatRequirements *)v9 setHeight:a2 >> 32];
  if (!v7)
  {
    uint64_t v11 = [NSNumber numberWithInt:v8];
    -[BWVideoFormatRequirements setSupportedColorSpaceProperties:](v9, "setSupportedColorSpaceProperties:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1]);
  }
  return v9;
}

- (void)didSelectFormat:(id)a3 forOutput:(id)a4
{
  unsigned int v6 = [a3 width];
  unsigned int v7 = [a3 height];
  [(BWNoiseReductionAndFusionProcessorControllerConfiguration *)self->_nrProcessorControllerConfiguration setOutputFormat:a3];
  [(BWDeepFusionProcessorControllerConfiguration *)self->_deepFusionProcessorControllerConfiguration setMaxOutputDimensions:v6 | ((unint64_t)v7 << 32)];
  deepZoomProcessorControllerConfiguration = self->_deepZoomProcessorControllerConfiguration;
  [(BWDeepZoomProcessorControllerConfiguration *)deepZoomProcessorControllerConfiguration setOutputFormat:a3];
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5
{
  if (![a5 isEqualToString:0x1EFA74380]
    || !self->_stereoDisparityProcessorControllerConfiguration)
  {
    v9.receiver = self;
    v9.super_class = (Class)BWUBNode;
    [(BWNode *)&v9 didSelectFormat:a3 forInput:a4 forAttachedMediaKey:a5];
  }
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  block[16] = *MEMORY[0x1E4F143B8];
  if (dword_1EB4C5670)
  {
    int v8 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v6.receiver = self;
  v6.super_class = (Class)BWUBNode;
  [(BWNode *)&v6 prepareForCurrentConfigurationToBecomeLive];
  processorCoordinatorWorkerQueue = self->_processorCoordinatorWorkerQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__BWUBNode_prepareForCurrentConfigurationToBecomeLive__block_invoke;
  v5[3] = &unk_1E5C24430;
  v5[4] = self;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __ubn_dispatch_sync_block_invoke;
  block[3] = &unk_1E5C249F0;
  block[4] = v5;
  dispatch_sync(processorCoordinatorWorkerQueue, block);
}

void __54__BWUBNode_prepareForCurrentConfigurationToBecomeLive__block_invoke(uint64_t a1)
{
}

- (void)_setupProcessorCoordinator
{
  v166[17] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v2 = a1;
    if (!*(void *)(a1 + 152))
    {
      if (dword_1EB4C5670)
      {
        unsigned int v153 = 0;
        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
        os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      if (!_FigIsCurrentDispatchQueue())
      {
        uint64_t v141 = v1;
        FigDebugAssert3();
      }
      FigDebugIsInternalBuild();
      uint64_t v143 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
      mach_absolute_time();
      v145 = (void *)[MEMORY[0x1E4F1CA80] set];
      uint64_t v146 = [*(id *)(v2 + 16) memoryPool];
      v4 = (void *)[*(id *)(v2 + 8) videoFormat];
      if (-[BWUBNode _requiresResizedOutputDimensionsWithInputWidth:inputHeight:](v2, [v4 width], objc_msgSend(v4, "height")))
      {
        FigDebugIsInternalBuild();
        objc_msgSend(NSString, "stringWithFormat:", @"%d", 2);
        mach_absolute_time();
        if (!objc_msgSend((id)objc_msgSend(*(id *)(v2 + 416), "portTypesWithGeometricDistortionCorrectionEnabled"), "count"))goto LABEL_181; {
        BOOL v5 = -[BWVideoFormatRequirements initWithPixelBufferAttributes:]([BWVideoFormatRequirements alloc], "initWithPixelBufferAttributes:", objc_msgSend((id)objc_msgSend(*(id *)(v2 + 16), "videoFormat"), "pixelBufferAttributes"));
        }
        -[BWVideoFormatRequirements setWidth:](v5, "setWidth:", [v4 width]);
        -[BWVideoFormatRequirements setHeight:](v5, "setHeight:", [v4 height]);
        -[BWVideoFormatRequirements setWidthAlignment:](v5, "setWidthAlignment:", [v4 extendedWidth]);
        -[BWVideoFormatRequirements setHeightAlignment:](v5, "setHeightAlignment:", [v4 extendedHeight]);
        v166[0] = v5;
        id v6 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:v166 count:1]);
        uint64_t v7 = [v4 extendedWidth];
        if (v7 != [v6 extendedWidth]) {
          goto LABEL_181;
        }
        uint64_t v8 = [v4 extendedHeight];
        if (v8 != [v6 extendedHeight]) {
          goto LABEL_181;
        }
        objc_super v9 = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:]([BWPixelBufferPool alloc], "initWithVideoFormat:capacity:name:memoryPool:", v6, objc_msgSend((id)objc_msgSend(*(id *)(v2 + 16), "preparedPixelBufferPool"), "capacity"), @"Noise Reduction and Fusion Processor Output Intermediate Pool", v146);
        *(void *)(v2 + 200) = v9;
        if (!v9) {
          goto LABEL_181;
        }
        if (dword_1EB4C5670)
        {
          unsigned int v153 = 0;
          os_log_type_t type = OS_LOG_TYPE_DEFAULT;
          v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
      }
      if (!objc_msgSend(*(id *)(v2 + 112), "deferredPhotoProcessorEnabled", v139, v141)
        || *(void *)(v2 + 248))
      {
        FigDebugIsInternalBuild();
        objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
        mach_absolute_time();
        uint64_t v11 = *(void *)(v2 + 208);
        if (v11 == 1)
        {
          uint64_t v12 = off_1E5C1EFD0;
        }
        else
        {
          if (v11 != 6) {
            goto LABEL_181;
          }
          uint64_t v12 = off_1E5C1EBF8;
        }
        id v13 = (id)[objc_alloc(*v12) initWithConfiguration:*(void *)(v2 + 216)];
        if (!v13) {
          goto LABEL_181;
        }
        [v145 addObject:v13];
        if (dword_1EB4C5670)
        {
          unsigned int v153 = 0;
          os_log_type_t type = OS_LOG_TYPE_DEFAULT;
          uint64_t v14 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
      }
      if (*(void *)(v2 + 264))
      {
        FigDebugIsInternalBuild();
        objc_msgSend(NSString, "stringWithFormat:", @"%d", 6);
        mach_absolute_time();
        int v15 = [[BWDeepFusionProcessorController alloc] initWithConfiguration:*(void *)(v2 + 264)];
        if (!v15) {
          goto LABEL_181;
        }
        [v145 addObject:v15];
        if (dword_1EB4C5670)
        {
          unsigned int v153 = 0;
          os_log_type_t type = OS_LOG_TYPE_DEFAULT;
          int v16 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
      }
      if (*(void *)(v2 + 576))
      {
        FigDebugIsInternalBuild();
        objc_msgSend(NSString, "stringWithFormat:", @"%d", 8);
        mach_absolute_time();
        uint64_t v17 = [[BWDeferredCaptureController alloc] initWithConfiguration:*(void *)(v2 + 576)];
        if (!v17) {
          goto LABEL_181;
        }
        [v145 addObject:v17];
        if (dword_1EB4C5670)
        {
          unsigned int v153 = 0;
          os_log_type_t type = OS_LOG_TYPE_DEFAULT;
          uint64_t v18 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
      }
      if (*(void *)(v2 + 608))
      {
        FigDebugIsInternalBuild();
        objc_msgSend(NSString, "stringWithFormat:", @"%d", 9);
        mach_absolute_time();
        uint64_t v19 = [[BWDeferredProcessorController alloc] initWithConfiguration:*(void *)(v2 + 608)];
        if (!v19) {
          goto LABEL_181;
        }
        [v145 addObject:v19];
        if (dword_1EB4C5670)
        {
          unsigned int v153 = 0;
          os_log_type_t type = OS_LOG_TYPE_DEFAULT;
          unsigned int v20 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
      }
      if (-[BWUBNodeConfiguration deepFusionSyntheticsInNRSupportEnabled](*(void *)(v2 + 112)))
      {
        FigDebugIsInternalBuild();
        objc_msgSend(NSString, "stringWithFormat:", @"%d", 7);
        mach_absolute_time();
        unsigned int v21 = objc_alloc_init(BWVideoFormatRequirements);
        uint64_t v22 = objc_msgSend((id)objc_msgSend(*(id *)(v2 + 216), "inputFormat"), "width");
        uint64_t v23 = objc_msgSend((id)objc_msgSend(*(id *)(v2 + 216), "inputFormat"), "height");
        unint64_t v24 = v22 + 15;
        unint64_t v25 = v23 + 15;
        [(BWVideoFormatRequirements *)v21 setWidth:(v24 >> 1) & 0x7FFFFFFFFFFFFFF8];
        [(BWVideoFormatRequirements *)v21 setHeight:(v25 >> 1) & 0x7FFFFFFFFFFFFFF8];
        [(BWVideoFormatRequirements *)v21 setSupportedPixelFormats:&unk_1EFB038D8];
        v159 = v21;
        id v26 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v159 count:1]);
        int v27 = -[BWUBNodeConfiguration maxDeepFusionOutputCount](*(void *)(v2 + 112));
        int v28 = -[BWUBNodeConfiguration maxDeepFusionOutputCount](*(void *)(v2 + 112));
        int v29 = [*(id *)(v2 + 112) deferredCaptureSupportEnabled];
        uint64_t v30 = (void *)[*(id *)(v2 + 216) inputFormat];
        id v31 = v30;
        if (v29)
        {
          id v32 = (id)objc_msgSend((id)objc_msgSend(v30, "pixelBufferAttributes"), "mutableCopy");
          [v32 setObject:&unk_1EFB038F0 forKeyedSubscript:*MEMORY[0x1E4F24CB0]];
          v33 = [[BWVideoFormatRequirements alloc] initWithPixelBufferAttributes:v32];
          if (FigCapturePixelFormatGetCompressionType(objc_msgSend((id)objc_msgSend(*(id *)(v2 + 216), "inputFormat"), "pixelFormat")))
          {
            uint64_t v158 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", FigCaptureUncompressedPixelFormatForPixelFormat(objc_msgSend((id)objc_msgSend(*(id *)(v2 + 216), "inputFormat"), "pixelFormat")));
            -[BWVideoFormatRequirements setSupportedPixelFormats:](v33, "setSupportedPixelFormats:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v158 count:1]);
          }
          v157 = v33;
          id v31 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v157 count:1]);
        }
        if (!v31 || !v27 || !v28) {
          goto LABEL_181;
        }
        int v34 = 3 * v28;
        uint64_t v35 = 2 * v27;
        uint64_t v36 = v34;
        if ([*(id *)(v2 + 112) deferredCaptureSupportEnabled])
        {
          double v37 = [[BWDeferredContainerPixelBufferPool alloc] initWithVideoFormat:v31 capacity:v35 name:@"DeepFusion deferred synthetic intermediate pool"];
          v38 = [[BWDeferredContainerPixelBufferPool alloc] initWithVideoFormat:v26 capacity:v36 name:@"DeepFusion deferred fusion map pool"];
        }
        else
        {
          double v37 = [[BWPixelBufferPool alloc] initWithVideoFormat:v31 capacity:v35 name:@"Deep Fusion synthetic intermediate pool" memoryPool:v146];
          v38 = [[BWPixelBufferPool alloc] initWithVideoFormat:v26 capacity:v36 name:@"Deep Fusion synthetic fusion map pool" memoryPool:v146];
        }
        float v39 = v38;
        if (!v37) {
          goto LABEL_181;
        }
        double v40 = v39;
        *(void *)(v2 + 288) = v37;
        *(void *)(v2 + 296) = v40;
        if (dword_1EB4C5670)
        {
          unsigned int v153 = 0;
          os_log_type_t type = OS_LOG_TYPE_DEFAULT;
          float v41 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
      }
      uint64_t v147 = v2;
      uint64_t v42 = MEMORY[0x1E4F1CC08];
      if (*(void *)(v2 + 248))
      {
        FigDebugIsInternalBuild();
        objc_msgSend(NSString, "stringWithFormat:", @"%d", 10);
        mach_absolute_time();
        v43 = [[BWLearnedNRProcessorController alloc] initWithConfiguration:*(void *)(v2 + 248)];
        if (v43)
        {
          uint64_t v44 = v43;
          uint64_t v45 = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:]([BWPixelBufferPool alloc], "initWithVideoFormat:capacity:name:memoryPool:", [*(id *)(v2 + 248) outputFormat], 1, @"LearnedNR output pool", v146);
          if (v45)
          {
            uint64_t v46 = v45;
            id v47 = objc_alloc(MEMORY[0x1E4F1CA60]);
            uint64_t v48 = *(void *)(v2 + 344) ? *(void *)(v2 + 344) : v42;
            int v49 = (void *)[v47 initWithDictionary:v48];
            [v49 setObject:v46 forKeyedSubscript:0x1EFA6A6E0];

            *(void *)(v2 + 344) = v49;
            if (!-[BWLearnedNRProcessorController prepareWithPixelBufferPoolProvider:](v44, "prepareWithPixelBufferPoolProvider:", v2))[v145 addObject:v44]; {
          }
            }
        }
        if (dword_1EB4C5670)
        {
          unsigned int v153 = 0;
          os_log_type_t type = OS_LOG_TYPE_DEFAULT;
          int v50 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
      }
      if (*(void *)(v2 + 304))
      {
        FigDebugIsInternalBuild();
        uint64_t v142 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 11);
        mach_absolute_time();
        double v51 = -[BWUBNodeConfiguration inferenceMainImageDownscalingFactor](*(void *)(v2 + 112));
        if (*(float *)&v51 == 0.0) {
          goto LABEL_195;
        }
        uint64_t v52 = 875704422;
        float v53 = objc_alloc_init(BWVideoFormatRequirements);
        float v54 = (float)(unint64_t)objc_msgSend((id)objc_msgSend(*(id *)(v2 + 216), "inputFormat"), "width");
        double v55 = -[BWUBNodeConfiguration inferenceMainImageDownscalingFactor](*(void *)(v2 + 112));
        float v56 = v54 / *(float *)&v55;
        if (v56 < 512.0) {
          float v56 = 512.0;
        }
        [(BWVideoFormatRequirements *)v53 setWidth:(unint64_t)v56];
        float v57 = (float)(unint64_t)objc_msgSend((id)objc_msgSend(*(id *)(v2 + 216), "inputFormat"), "height");
        double v58 = -[BWUBNodeConfiguration inferenceMainImageDownscalingFactor](*(void *)(v2 + 112));
        float v59 = v57 / *(float *)&v58;
        if (v59 < 384.0) {
          float v59 = 384.0;
        }
        [(BWVideoFormatRequirements *)v53 setHeight:(unint64_t)v59];
        if (FigCapturePlatformSupportsUniversalCompression() && *(void *)(v2 + 208) == 6) {
          uint64_t v52 = FigCaptureCompressedPixelFormatForPixelFormat(875704422, 4, 0);
        }
        uint64_t v156 = [NSNumber numberWithUnsignedInt:v52];
        -[BWVideoFormatRequirements setSupportedPixelFormats:](v53, "setSupportedPixelFormats:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v156 count:1]);
        v155 = v53;
        objc_msgSend(*(id *)(v2 + 304), "setInputFormat:", +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v155, 1)));
        v60 = -[BWInferenceEngineController initWithConfiguration:contextName:]([BWInferenceEngineController alloc], "initWithConfiguration:contextName:", *(void *)(v2 + 304), [(id)v2 name]);
        if (!v60) {
          goto LABEL_195;
        }
        v61 = v60;
        uint64_t v62 = [(id)-[BWUBNodeConfiguration providedInferenceAttachedMediaByMode](*(void *)(v2 + 112)) objectForKeyedSubscript:&unk_1EFB00098]? 4: 2;
        v63 = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:]([BWPixelBufferPool alloc], "initWithVideoFormat:capacity:name:memoryPool:", [*(id *)(v2 + 304) inputFormat], v62, @"UB Inference Input Pool", v146);
        *(void *)(v2 + 336) = v63;
        if (v63)
        {
          id v64 = objc_alloc(MEMORY[0x1E4F1CA60]);
          if (*(void *)(v2 + 344)) {
            uint64_t v65 = *(void *)(v2 + 344);
          }
          else {
            uint64_t v65 = v42;
          }
          v144 = (void *)[v64 initWithDictionary:v65];
          long long v148 = 0u;
          long long v149 = 0u;
          long long v150 = 0u;
          long long v151 = 0u;
          unsigned int v66 = [(BWInferenceEngineController *)v61 providedAttachedMediaKeys];
          uint64_t v67 = [(NSArray *)v66 countByEnumeratingWithState:&v148 objects:v154 count:16];
          uint64_t v68 = v2;
          if (v67)
          {
            uint64_t v69 = v67;
            uint64_t v70 = *(void *)v149;
            while (2)
            {
              for (uint64_t i = 0; i != v69; ++i)
              {
                if (*(void *)v149 != v70) {
                  objc_enumerationMutation(v66);
                }
                BOOL v72 = *(void **)(*((void *)&v148 + 1) + 8 * i);
                uint64_t v73 = (void *)[*(id *)(v68 + 16) mediaPropertiesForAttachedMediaKey:v72];
                if ([v73 preparedPixelBufferPool])
                {
                  uint64_t v74 = (void *)[v73 resolvedVideoFormat];
                  if ((objc_msgSend(v74, "isEqual:", -[BWInferenceEngineController outputVideoFormatForAttachedMediaKey:](v61, "outputVideoFormatForAttachedMediaKey:", v72)) & 1) == 0)goto LABEL_101; {
                }
                  }
                else
                {
                  uint64_t v75 = [(BWInferenceEngineController *)v61 outputVideoFormatForAttachedMediaKey:v72];
                  if (!v75
                    || (uint64_t v74 = (void *)v75,
                        uint64_t v76 = [*(id *)(v68 + 112) deferredCaptureSupportEnabled],
                        uint64_t v77 = [BWPixelBufferPool alloc],
                        uint64_t v78 = [NSString stringWithFormat:@"UB %@ Output Pool", v72],
                        LOBYTE(v140) = v76,
                        (uint64_t v79 = [(BWPixelBufferPool *)v77 initWithVideoFormat:v74 capacity:2 name:v78 clientProvidesPool:0 memoryPool:v146 providesBackPressure:v76 reportSlowBackPressureAllocations:v140]) == 0))
                  {
LABEL_101:
                    long long v81 = v144;
                    goto LABEL_105;
                  }
                  long long v80 = (void *)v79;
                  [v144 setObject:v79 forKeyedSubscript:v72];

                  uint64_t v68 = v147;
                }
                if (*(void *)(v68 + 416)
                  && (([v72 isEqualToString:0x1EFA6A200] & 1) != 0
                   || [v72 isEqualToString:0x1EFA745C0]))
                {
                  *(_DWORD *)(v68 + 440) = [v74 width];
                  *(_DWORD *)(v68 + 444) = [v74 height];
                }
              }
              uint64_t v69 = [(NSArray *)v66 countByEnumeratingWithState:&v148 objects:v154 count:16];
              if (v69) {
                continue;
              }
              break;
            }
          }
          long long v81 = v144;
          if ([v144 count])
          {

            *(void *)(v68 + 344) = v144;
            long long v81 = 0;
          }
          FigDebugIsInternalBuild();
          uint64_t v82 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 12);
          mach_absolute_time();
          int v83 = [(BWInferenceEngineController *)v61 prepareWithPixelBufferPoolProvider:v68];
          if (dword_1EB4C5670)
          {
            unsigned int v153 = 0;
            os_log_type_t type = OS_LOG_TYPE_DEFAULT;
            long long v84 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            unsigned int v85 = v153;
            if (os_log_type_enabled(v84, type)) {
              unsigned int v86 = v85;
            }
            else {
              unsigned int v86 = v85 & 0xFFFFFFFE;
            }
            if (v86)
            {
              mach_absolute_time();
              uint64_t v87 = FigHostTimeToNanoseconds();
              int v160 = 136315650;
              v161 = "-[BWUBNode _setupProcessorCoordinator]";
              __int16 v162 = 2114;
              uint64_t v163 = v82;
              __int16 v164 = 2048;
              double v165 = (double)(v87 / 1000) / 1000.0;
              _os_log_send_and_compose_impl();
            }
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          if (!v83) {
            [v145 addObject:v61];
          }
        }
        else
        {
LABEL_195:
          long long v81 = 0;
        }
LABEL_105:

        if (dword_1EB4C5670)
        {
          unsigned int v153 = 0;
          os_log_type_t type = OS_LOG_TYPE_DEFAULT;
          long long v88 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          unsigned int v89 = v153;
          if (os_log_type_enabled(v88, type)) {
            unsigned int v90 = v89;
          }
          else {
            unsigned int v90 = v89 & 0xFFFFFFFE;
          }
          if (v90)
          {
            mach_absolute_time();
            uint64_t v91 = FigHostTimeToNanoseconds();
            int v160 = 136315650;
            v161 = "-[BWUBNode _setupProcessorCoordinator]";
            __int16 v162 = 2114;
            uint64_t v163 = v142;
            __int16 v164 = 2048;
            double v165 = (double)(v91 / 1000) / 1000.0;
            _os_log_send_and_compose_impl();
          }
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
      }
      uint64_t v2 = v147;
      if (*(void *)(v147 + 400))
      {
        FigDebugIsInternalBuild();
        uint64_t v92 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 14);
        mach_absolute_time();
        long long v93 = [[BWRedEyeReductionController alloc] initWithConfiguration:*(void *)(v147 + 400)];
        if (!v93) {
          goto LABEL_181;
        }
        [v145 addObject:v93];
        if (dword_1EB4C5670)
        {
          unsigned int v153 = 0;
          os_log_type_t type = OS_LOG_TYPE_DEFAULT;
          long long v94 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          unsigned int v95 = v153;
          if (os_log_type_enabled(v94, type)) {
            unsigned int v96 = v95;
          }
          else {
            unsigned int v96 = v95 & 0xFFFFFFFE;
          }
          if (v96)
          {
            mach_absolute_time();
            uint64_t v97 = FigHostTimeToNanoseconds();
            int v160 = 136315650;
            v161 = "-[BWUBNode _setupProcessorCoordinator]";
            __int16 v162 = 2114;
            uint64_t v163 = v92;
            __int16 v164 = 2048;
            double v165 = (double)(v97 / 1000) / 1000.0;
            _os_log_send_and_compose_impl();
          }
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
      }
      if (*(void *)(v147 + 416))
      {
        FigDebugIsInternalBuild();
        uint64_t v98 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 15);
        mach_absolute_time();
        if (objc_msgSend((id)objc_msgSend(*(id *)(v147 + 416), "portTypesWithIntelligentDistortionCorrectionEnabled"), "count"))
        {
          if ([*(id *)(v147 + 112) deferredPhotoProcessorEnabled])
          {
            *(_DWORD *)(v147 + 440) = 512;
            *(_DWORD *)(v147 + 444) = 384;
          }
          else if (!-[BWUBNode _inferenceOutputPixelBufferPoolForAttachedMediaKey:](v147, @"LowResPersonSegmentationMask")&& !-[BWUBNode _inferenceOutputPixelBufferPoolForAttachedMediaKey:](v147, @"LowResPersonSegmentationMaskClone")|| !*(_DWORD *)(v147 + 440)|| !*(_DWORD *)(v147 + 444))
          {
            goto LABEL_181;
          }
        }
        objc_msgSend(*(id *)(v147 + 416), "setProcessorConfig:", objc_msgSend((id)objc_msgSend(*(id *)(v147 + 16), "videoFormat"), "width") | ((unint64_t)objc_msgSend((id)objc_msgSend(*(id *)(v147 + 16), "videoFormat"), "height") << 32), *(unsigned int *)(v147 + 440) | ((unint64_t)*(unsigned int *)(v147 + 444) << 32));
        id v99 = [[BWIntelligentDistortionCorrectionProcessorController alloc] initWithConfiguration:*(void *)(v147 + 416)];
        if (!v99) {
          goto LABEL_181;
        }
        [v145 addObject:v99];
        if (dword_1EB4C5670)
        {
          unsigned int v153 = 0;
          os_log_type_t type = OS_LOG_TYPE_DEFAULT;
          v100 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          unsigned int v101 = v153;
          if (os_log_type_enabled(v100, type)) {
            unsigned int v102 = v101;
          }
          else {
            unsigned int v102 = v101 & 0xFFFFFFFE;
          }
          if (v102)
          {
            mach_absolute_time();
            uint64_t v103 = FigHostTimeToNanoseconds();
            int v160 = 136315650;
            v161 = "-[BWUBNode _setupProcessorCoordinator]";
            __int16 v162 = 2114;
            uint64_t v163 = v98;
            __int16 v164 = 2048;
            double v165 = (double)(v103 / 1000) / 1000.0;
            _os_log_send_and_compose_impl();
          }
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
      }
      if (*(void *)(v147 + 464))
      {
        FigDebugIsInternalBuild();
        uint64_t v104 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 16);
        mach_absolute_time();
        v105 = [[BWDeepZoomProcessorController alloc] initWithConfiguration:*(void *)(v147 + 464)];
        if (!v105) {
          goto LABEL_181;
        }
        v106 = v105;
        if ([(BWDeepZoomProcessorController *)v105 prepareWithPixelBufferPoolProvider:v147])
        {
          goto LABEL_181;
        }
        [v145 addObject:v106];
        if (dword_1EB4C5670)
        {
          unsigned int v153 = 0;
          os_log_type_t type = OS_LOG_TYPE_DEFAULT;
          v107 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          unsigned int v108 = v153;
          if (os_log_type_enabled(v107, type)) {
            unsigned int v109 = v108;
          }
          else {
            unsigned int v109 = v108 & 0xFFFFFFFE;
          }
          if (v109)
          {
            mach_absolute_time();
            uint64_t v110 = FigHostTimeToNanoseconds();
            int v160 = 136315650;
            v161 = "-[BWUBNode _setupProcessorCoordinator]";
            __int16 v162 = 2114;
            uint64_t v163 = v104;
            __int16 v164 = 2048;
            double v165 = (double)(v110 / 1000) / 1000.0;
            _os_log_send_and_compose_impl();
          }
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
      }
      if (*(void *)(v147 + 480))
      {
        FigDebugIsInternalBuild();
        uint64_t v111 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 17);
        mach_absolute_time();
        objc_msgSend(*(id *)(v147 + 480), "setInputDimensions:", objc_msgSend((id)objc_msgSend(*(id *)(v147 + 8), "videoFormat"), "width") | ((unint64_t)objc_msgSend((id)objc_msgSend(*(id *)(v147 + 8), "videoFormat"), "height") << 32));
        v112 = [[BWStereoDisparityProcessorController alloc] initWithConfiguration:*(void *)(v147 + 480)];
        if (!v112) {
          goto LABEL_181;
        }
        [v145 addObject:v112];
        if (dword_1EB4C5670)
        {
          unsigned int v153 = 0;
          os_log_type_t type = OS_LOG_TYPE_DEFAULT;
          v113 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          unsigned int v114 = v153;
          if (os_log_type_enabled(v113, type)) {
            unsigned int v115 = v114;
          }
          else {
            unsigned int v115 = v114 & 0xFFFFFFFE;
          }
          if (v115)
          {
            mach_absolute_time();
            uint64_t v116 = FigHostTimeToNanoseconds();
            int v160 = 136315650;
            v161 = "-[BWUBNode _setupProcessorCoordinator]";
            __int16 v162 = 2114;
            uint64_t v163 = v111;
            __int16 v164 = 2048;
            double v165 = (double)(v116 / 1000) / 1000.0;
            _os_log_send_and_compose_impl();
          }
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
      }
      if (*(void *)(v147 + 544))
      {
        FigDebugIsInternalBuild();
        uint64_t v117 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 18);
        mach_absolute_time();
        objc_msgSend(*(id *)(v147 + 544), "setInputColorFormat:", objc_msgSend(*(id *)(v147 + 216), "outputFormat"));
        objc_msgSend(*(id *)(v147 + 544), "setOutputDepthFormat:", objc_msgSend((id)objc_msgSend(*(id *)(v147 + 16), "mediaPropertiesForAttachedMediaKey:", @"Depth"), "resolvedVideoFormat"));
        v118 = [[BWJasperColorStillsExecutorController alloc] initWithConfiguration:*(void *)(v147 + 544)];
        if (!v118) {
          goto LABEL_181;
        }
        [v145 addObject:v118];
        if (dword_1EB4C5670)
        {
          unsigned int v153 = 0;
          os_log_type_t type = OS_LOG_TYPE_DEFAULT;
          v119 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          unsigned int v120 = v153;
          if (os_log_type_enabled(v119, type)) {
            unsigned int v121 = v120;
          }
          else {
            unsigned int v121 = v120 & 0xFFFFFFFE;
          }
          if (v121)
          {
            mach_absolute_time();
            uint64_t v122 = FigHostTimeToNanoseconds();
            int v160 = 136315650;
            v161 = "-[BWUBNode _setupProcessorCoordinator]";
            __int16 v162 = 2114;
            uint64_t v163 = v117;
            __int16 v164 = 2048;
            double v165 = (double)(v122 / 1000) / 1000.0;
            _os_log_send_and_compose_impl();
          }
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
      }
      if (*(void *)(v147 + 560))
      {
        FigDebugIsInternalBuild();
        uint64_t v123 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 19);
        mach_absolute_time();
        objc_msgSend(*(id *)(v147 + 560), "setInputColorFormat:", objc_msgSend(*(id *)(v147 + 216), "outputFormat"));
        objc_msgSend(*(id *)(v147 + 560), "setOutputDepthFormat:", objc_msgSend((id)objc_msgSend(*(id *)(v147 + 16), "mediaPropertiesForAttachedMediaKey:", @"Depth"), "resolvedVideoFormat"));
        objc_msgSend(*(id *)(v147 + 560), "setPointCloudTimeMachineCapacity:", objc_msgSend(*(id *)(v147 + 528), "retainedBufferCount"));
        v124 = [[BWJasperDisparityProcessorController alloc] initWithConfiguration:*(void *)(v147 + 560)];
        if (!v124)
        {
          FigDebugAssert3();
          goto LABEL_181;
        }
        [v145 addObject:v124];
        if (dword_1EB4C5670)
        {
          unsigned int v153 = 0;
          os_log_type_t type = OS_LOG_TYPE_DEFAULT;
          v125 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          unsigned int v126 = v153;
          if (os_log_type_enabled(v125, type)) {
            unsigned int v127 = v126;
          }
          else {
            unsigned int v127 = v126 & 0xFFFFFFFE;
          }
          if (v127)
          {
            mach_absolute_time();
            uint64_t v128 = FigHostTimeToNanoseconds();
            int v160 = 136315650;
            v161 = "-[BWUBNode _setupProcessorCoordinator]";
            __int16 v162 = 2114;
            uint64_t v163 = v123;
            __int16 v164 = 2048;
            double v165 = (double)(v128 / 1000) / 1000.0;
            _os_log_send_and_compose_impl();
          }
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
      }
      os_unfair_lock_lock((os_unfair_lock_t)(v147 + 168));
      *(void *)(v147 + 152) = [[BWStillImageProcessorCoordinator alloc] initWithProcessorControllers:v145];
      os_unfair_lock_unlock((os_unfair_lock_t)(v147 + 168));
      if (dword_1EB4C5670)
      {
        unsigned int v153 = 0;
        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
        v129 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        unsigned int v130 = v153;
        if (os_log_type_enabled(v129, type)) {
          unsigned int v131 = v130;
        }
        else {
          unsigned int v131 = v130 & 0xFFFFFFFE;
        }
        if (v131)
        {
          mach_absolute_time();
          uint64_t v132 = FigHostTimeToNanoseconds();
          int v160 = 136315650;
          v161 = "-[BWUBNode _setupProcessorCoordinator]";
          __int16 v162 = 2114;
          uint64_t v163 = v143;
          __int16 v164 = 2048;
          double v165 = (double)(v132 / 1000) / 1000.0;
          _os_log_send_and_compose_impl();
        }
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
LABEL_181:
      if (*(void *)(v2 + 152))
      {
        if (!dword_1EB4C5670) {
          return;
        }
        unsigned int v153 = 0;
        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
        v133 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        unsigned int v134 = v153;
        if (os_log_type_enabled(v133, type)) {
          unsigned int v135 = v134;
        }
        else {
          unsigned int v135 = v134 & 0xFFFFFFFE;
        }
        if (!v135) {
          goto LABEL_193;
        }
      }
      else
      {
        unsigned int v153 = 0;
        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
        v136 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        unsigned int v137 = v153;
        if (os_log_type_enabled(v136, type)) {
          unsigned int v138 = v137;
        }
        else {
          unsigned int v138 = v137 & 0xFFFFFFFE;
        }
        if (!v138) {
          goto LABEL_193;
        }
      }
      int v160 = 136315138;
      v161 = "-[BWUBNode _setupProcessorCoordinator]";
      _os_log_send_and_compose_impl();
LABEL_193:
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
}

- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = [(BWNode *)self inputs];
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v13 != v10) {
        objc_enumerationMutation(v7);
      }
      if (self->_pointCloudInput == a5 && ![*(id *)(*((void *)&v12 + 1) + 8 * v11) liveFormat]) {
        break;
      }
      if (v9 == ++v11)
      {
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v9) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    if (![(BWNodeOutput *)self->super._output liveFormat]) {
      [(BWNodeOutput *)self->super._output makeConfiguredFormatLive];
    }
  }
}

- (void)didReachEndOfDataForInput:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (dword_1EB4C5670)
  {
    int v16 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (-[BWNode input:hasReachedState:](self, "input:hasReachedState:", self->super._input, 0, v10, v11)
    && self->_pointCloudInput != a3
    && !self->_resourcesReleased)
  {
    [(BWFigVideoCaptureDevice *)self->_device setAdaptiveUnifiedBracketingController:0];

    self->_device = 0;
    deferredProcessorControllerQueue = self->_deferredProcessorControllerQueue;
    if (deferredProcessorControllerQueue)
    {
      uint64_t block = MEMORY[0x1E4F143A8];
      uint64_t v18 = 3221225472;
      uint64_t v19 = __ubn_dispatch_sync_block_invoke;
      unsigned int v20 = &unk_1E5C249F0;
      unsigned int v21 = &__block_literal_global_67;
      dispatch_sync(deferredProcessorControllerQueue, &block);
    }
    processorCoordinatorWorkerQueue = self->_processorCoordinatorWorkerQueue;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __38__BWUBNode_didReachEndOfDataForInput___block_invoke_2;
    v14[3] = &unk_1E5C24430;
    v14[4] = self;
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    uint64_t v19 = __ubn_dispatch_sync_block_invoke;
    unsigned int v20 = &unk_1E5C249F0;
    unsigned int v21 = v14;
    dispatch_sync(processorCoordinatorWorkerQueue, &block);
    uint64_t v8 = self->_processorCoordinatorWorkerQueue;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __38__BWUBNode_didReachEndOfDataForInput___block_invoke_6;
    v13[3] = &unk_1E5C24430;
    v13[4] = self;
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    uint64_t v19 = __ubn_dispatch_sync_block_invoke;
    unsigned int v20 = &unk_1E5C249F0;
    unsigned int v21 = v13;
    dispatch_sync(v8, &block);
  }
  if ([(BWNode *)self allInputsHaveReachedState:0])
  {
    -[BWUBNode _releaseResources]((uint64_t)self);
    emitQueue = self->_emitQueue;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    void v12[2] = __38__BWUBNode_didReachEndOfDataForInput___block_invoke_7;
    v12[3] = &unk_1E5C24430;
    v12[4] = self;
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    uint64_t v19 = __ubn_dispatch_async_block_invoke;
    unsigned int v20 = &unk_1E5C249F0;
    unsigned int v21 = v12;
    dispatch_async(emitQueue, &block);
  }
}

void __38__BWUBNode_didReachEndOfDataForInput___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2[35])
  {
    -[BWUBNode _deepFusionDispatch:direction:block:]((uint64_t)v2, 1, 1, (uint64_t)&__block_literal_global_65);
    uint64_t v2 = *(void **)(a1 + 32);
  }
  objc_super v3 = v2[40];
  if (v3)
  {
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v6 = 3221225472;
    uint64_t v7 = __ubn_dispatch_sync_block_invoke;
    uint64_t v8 = &unk_1E5C249F0;
    uint64_t v9 = &__block_literal_global_67;
    dispatch_sync(v3, &block);
    uint64_t v2 = *(void **)(a1 + 32);
  }
  v4 = v2[63];
  if (v4)
  {
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v6 = 3221225472;
    uint64_t v7 = __ubn_dispatch_sync_block_invoke;
    uint64_t v8 = &unk_1E5C249F0;
    uint64_t v9 = &__block_literal_global_69;
    dispatch_sync(v4, &block);
  }
}

- (void)_deepFusionDispatch:(int)a3 direction:(uint64_t)a4 block:
{
  if (a1)
  {
    BOOL v5 = *(NSObject **)(a1 + 280);
    if (!v5) {
      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"Attempting to dispatch onto a nil _deepFusionProcessorControllerQueue" userInfo:0]);
    }
    -[BWUBNode _dispatch:direction:processingQueue:block:](a1, a2, a3, v5, a4);
  }
}

void __38__BWUBNode_didReachEndOfDataForInput___block_invoke_6(uint64_t a1)
{
}

- (void)_resetProcessingState
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (!_FigIsCurrentDispatchQueue())
    {
      uint64_t v9 = v1;
      LODWORD(v8) = 0;
      FigDebugAssert3();
    }
    if (*(unsigned char *)(a1 + 184))
    {
      if (*(void *)(a1 + 144) && dword_1EB4C5670 != 0)
      {
        int v14 = 0;
        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
        os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
    }
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 152), "controllerForType:", *(void *)(a1 + 208), v8, v9), "cancelProcessing");
    if (*(void *)(a1 + 280))
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      void v12[2] = __33__BWUBNode__resetProcessingState__block_invoke;
      v12[3] = &unk_1E5C24430;
      v12[4] = a1;
      -[BWUBNode _deepFusionDispatch:direction:block:](a1, 1, 1, (uint64_t)v12);
      [*(id *)(a1 + 272) removeAllObjects];
    }
    BOOL v5 = *(NSObject **)(a1 + 320);
    if (v5)
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __33__BWUBNode__resetProcessingState__block_invoke_2;
      v11[3] = &unk_1E5C24430;
      v11[4] = a1;
      uint64_t block = MEMORY[0x1E4F143A8];
      uint64_t v16 = 3221225472;
      uint64_t v17 = __ubn_dispatch_sync_block_invoke;
      uint64_t v18 = &unk_1E5C249F0;
      uint64_t v19 = v11;
      dispatch_sync(v5, &block);
      [*(id *)(a1 + 312) removeAllObjects];
    }
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 152), "controllerForType:", 7), "cancelProcessing");
    [*(id *)(a1 + 424) removeAllObjects];
    [*(id *)(a1 + 432) removeAllObjects];
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 152), "controllerForType:", 10), "cancelProcessing");
    [*(id *)(a1 + 472) removeAllObjects];
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 152), "controllerForType:", 4), "cancelProcessing");
    [*(id *)(a1 + 408) removeAllObjects];
    uint64_t v6 = *(NSObject **)(a1 + 504);
    if (v6)
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __33__BWUBNode__resetProcessingState__block_invoke_3;
      v10[3] = &unk_1E5C24430;
      v10[4] = a1;
      uint64_t block = MEMORY[0x1E4F143A8];
      uint64_t v16 = 3221225472;
      uint64_t v17 = __ubn_dispatch_sync_block_invoke;
      uint64_t v18 = &unk_1E5C249F0;
      uint64_t v19 = v10;
      dispatch_sync(v6, &block);

      *(void *)(a1 + 488) = 0;
      [*(id *)(a1 + 520) removeAllObjects];
      *(_DWORD *)(a1 + 496) = 0;
    }
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 152), "controllerForType:", 9), "cancelProcessing");
    [*(id *)(a1 + 552) removeAllObjects];
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 152), "controllerForType:", 13), "cancelProcessing");
    [*(id *)(a1 + 568) removeAllObjects];
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 152), "controllerForType:", 11), "cancelProcessing");
    [*(id *)(a1 + 256) removeAllObjects];
    uint64_t v7 = *(const void **)(a1 + 592);
    if (v7)
    {
      CFRelease(v7);
      *(void *)(a1 + 592) = 0;
    }
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 152), "controllerForType:", 14), "cancelProcessing");

    *(void *)(a1 + 584) = 0;
    [*(id *)(a1 + 224) removeAllObjects];
    [*(id *)(a1 + 232) removeAllObjects];
    [*(id *)(a1 + 240) removeAllObjects];
    [*(id *)(a1 + 512) removeAllObjects];
    if (*(void *)(a1 + 144))
    {

      *(void *)(a1 + 128) = *(id *)(a1 + 144);
    }
    *(void *)(a1 + 136) = 0;

    *(void *)(a1 + 144) = 0;
  }
}

uint64_t __38__BWUBNode_didReachEndOfDataForInput___block_invoke_7(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 16) liveFormat];
  if (result)
  {
    objc_super v3 = *(void **)(*(void *)(a1 + 32) + 16);
    return [v3 markEndOfLiveOutput];
  }
  return result;
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x2020000000;
  int v14 = 0;
  if (self->_resourcesReleased)
  {
    int v14 = -12780;
  }
  else if (self->_pointCloudInput == a4)
  {
    -[BWUBNode _handlePointCloudSampleBuffer:]((uint64_t)self, a3);
  }
  else
  {
    processorCoordinatorWorkerQueue = self->_processorCoordinatorWorkerQueue;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __40__BWUBNode_renderSampleBuffer_forInput___block_invoke;
    v10[3] = &unk_1E5C26FE8;
    v10[6] = &v11;
    v10[7] = a3;
    v10[4] = self;
    void v10[5] = a4;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __ubn_dispatch_sync_block_invoke;
    block[3] = &unk_1E5C249F0;
    block[4] = v10;
    dispatch_sync(processorCoordinatorWorkerQueue, block);
  }
  if (*((_DWORD *)v12 + 6))
  {
    CFTypeRef v8 = CMGetAttachment(a3, @"StillSettings", 0);
    CFTypeRef v9 = CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0);
    [(BWUBNode *)self handleNodeError:+[BWNodeError newError:*((unsigned int *)v12 + 6) sourceNode:self stillImageSettings:v8 metadata:v9] forInput:a4];
  }
  _Block_object_dispose(&v11, 8);
}

- (uint64_t)_handlePointCloudSampleBuffer:(uint64_t)result
{
  if (!result) {
    return result;
  }
  uint64_t v3 = result;
  if (!_FigIsNotCurrentDispatchQueue())
  {
    FigDebugAssert3();
    if (a2) {
      goto LABEL_4;
    }
    return 4294954516;
  }
  if (!a2) {
    return 4294954516;
  }
LABEL_4:
  if (-[BWUBNodeConfiguration generateLiDARDepth](*(void *)(v3 + 112)))
  {
    -[BWUBNode _handleLidarDepthPointCloudSampleBuffer:](v3, (uint64_t)a2);
  }
  else
  {
    uint64_t result = [*(id *)(v3 + 104) supplementalPointCloudCaptureDevice];
    if (!result) {
      return result;
    }
    -[BWUBNode _handleSupplementalPointCloudSampleBuffer:](v3, a2);
  }
  return 0;
}

uint64_t __40__BWUBNode_renderSampleBuffer_forInput___block_invoke(uint64_t a1)
{
  uint64_t result = -[BWUBNode _handleSampleBuffer:input:](*(void *)(a1 + 32), *(void **)(a1 + 56));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (uint64_t)_handleSampleBuffer:(uint64_t)a1 input:(void *)a2
{
  if (!a1) {
    return 0;
  }
  if (!_FigIsCurrentDispatchQueue())
  {
    FigDebugAssert3();
    if (a2) {
      goto LABEL_4;
    }
LABEL_31:
    uint64_t v17 = 4294954516;
    goto LABEL_14;
  }
  if (!a2) {
    goto LABEL_31;
  }
LABEL_4:
  CFTypeRef v4 = CMGetAttachment(a2, @"StillSettings", 0);
  if (!v4) {
    goto LABEL_31;
  }
  BOOL v5 = (void *)v4;
  uint64_t v6 = (void *)CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  if (!v6) {
    goto LABEL_31;
  }
  uint64_t v7 = v6;
  CFTypeRef v8 = (void *)[v6 objectForKeyedSubscript:*MEMORY[0x1E4F54128]];
  if (-[BWUBNode _shouldPassthroughWithStillImageSettings:](a1, v5))
  {
    if (FigCaptureSushiRawDNGDictionaryCreatedInGraph()
      && FigCapturePixelFormatIsBayerRaw(objc_msgSend((id)objc_msgSend(v5, "requestedSettings"), "rawOutputFormat")))
    {
      unsigned int v21 = objc_msgSend((id)objc_msgSend(v5, "requestedSettings"), "outputWidth");
      uint64_t v22 = objc_msgSend((id)objc_msgSend(v5, "requestedSettings"), "outputHeight");
      int v23 = objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E4F53328]), "intValue");
      int v24 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 416), "portTypesWithGeometricDistortionCorrectionEnabled"), "containsObject:", v8);
      if (v23) {
        int v25 = 1;
      }
      else {
        int v25 = v24;
      }
      -[BWUBNode _propagateSushiRawDNGDictionaryWithOutputSampleBuffer:requestedDimensions:requiresGDCInformation:](a1, a2, v21 | (unint64_t)(v22 << 32), v25);
    }
    -[BWUBNode _emitSampleBuffer:description:](a1, a2, @"passthrough input frame");
    goto LABEL_13;
  }
  char v27 = 0;
  -[BWUBNode _infoForCaptureType:isSupportedCaptureTypeOut:isFusionCaptureTypeOut:](a1, objc_msgSend((id)objc_msgSend(v5, "captureSettings"), "captureType"), 0, &v27);
  if (([*(id *)(a1 + 112) deferredPhotoProcessorEnabled] & 1) == 0
    && v27
    && (objc_msgSend(*(id *)(a1 + 128), "isEqualToString:", objc_msgSend((id)objc_msgSend(v5, "requestedSettings"), "captureRequestIdentifier")) & 1) != 0)
  {
LABEL_13:
    uint64_t v17 = 0;
LABEL_14:
    -[BWUBNode _resetProcessingStateIfDone](a1);
    return v17;
  }
  uint64_t v9 = -[BWUBNode _setupProcessingStateWithSettings:](a1, v5);
  if (v9)
  {
    uint64_t v17 = v9;
    goto LABEL_14;
  }
  id v10 = (id)[*(id *)(a1 + 616) objectForKeyedSubscript:v8];
  id v11 = (id)[*(id *)(a1 + 408) objectForKeyedSubscript:v8];
  id v12 = (id)[*(id *)(a1 + 256) objectForKeyedSubscript:v8];
  id v13 = (id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 224), "objectForKeyedSubscript:", v8), "firstObject");
  if (v10)
  {
    CFTypeRef v14 = CMGetAttachment(a2, @"DeferredProcessingContainer", 0);
    uint64_t v15 = objc_msgSend((id)objc_msgSend((id)CMGetAttachment(a2, @"PhotoManifest", 0), "photoDescriptors"), "firstObject");
    uint64_t v16 = *(NSObject **)(a1 + 600);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __38__BWUBNode__handleSampleBuffer_input___block_invoke;
    v26[3] = &unk_1E5C248A0;
    v26[4] = v10;
    v26[5] = v14;
    v26[6] = v15;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __ubn_dispatch_async_block_invoke;
    block[3] = &unk_1E5C249F0;
    block[4] = v26;
    dispatch_async(v16, block);
    goto LABEL_13;
  }
  if (v11)
  {
    if (+[BWRedEyeReductionControllerInput requiresInferencesFromFrame:a2])
    {
      -[BWUBNode _inferenceProcessRedEyeReductionSampleBuffer:settings:portType:](a1, (opaqueCMSampleBuffer *)a2, v5, (uint64_t)v8);
    }
    else
    {
      uint64_t v19 = (void (**)(id, void *, uint64_t, id, void))-[BWUBNode _ubRERRouter]((id)a1);
      v19[2](v19, a2, 1, v11, 0);
    }
    goto LABEL_13;
  }
  if (v12)
  {
    [v12 setInputFrame:a2];
    goto LABEL_13;
  }
  uint64_t v20 = v13;
  if (v13)
  {
    [v13 addFrame:a2];
    if (objc_msgSend((id)objc_msgSend(v5, "captureSettings"), "captureType") == 7) {
      -[BWUBNode _handleClientBracketFrameEmissionForProcessorInput:clientBracketFrame:](a1, v20, a2);
    }
    else {
      -[BWUBNode _handleReferenceFrameEmissionForProcessorInput:](a1, v20);
    }
    goto LABEL_13;
  }
  uint64_t v17 = 0;
  if (!-[BWUBNode _processingNeededForSettings:portType:](a1, v5, v8) || v27) {
    goto LABEL_14;
  }
  uint64_t v17 = -[BWUBNode _singleImageProcessSampleBuffer:settings:portType:](a1, (uint64_t)a2, v5, (uint64_t)v8);
  if (v17) {
    FigDebugAssert3();
  }
  return v17;
}

- (uint64_t)_handleLidarDepthPointCloudSampleBuffer:(uint64_t)result
{
  if (result)
  {
    uint64_t v4 = result;
    if (!_FigIsNotCurrentDispatchQueue())
    {
      uint64_t v7 = v2;
      LODWORD(v6) = 0;
      FigDebugAssert3();
    }
    BOOL v5 = objc_msgSend(*(id *)(v4 + 152), "controllerForType:", 13, v6, v7);
    return [v5 addPointCloudToTimeMachine:a2];
  }
  return result;
}

- (void)_handleSupplementalPointCloudSampleBuffer:(uint64_t)a1
{
  if (a1)
  {
    if (!_FigIsNotCurrentDispatchQueue()) {
      FigDebugAssert3();
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 536));
    int v4 = *(unsigned __int8 *)(a1 + 540);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 536));
    if (!v4)
    {
      if (a2) {
        CFRetain(a2);
      }
      BOOL v5 = *(NSObject **)(a1 + 160);
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __54__BWUBNode__handleSupplementalPointCloudSampleBuffer___block_invoke;
      v6[3] = &unk_1E5C24F10;
      v6[4] = a1;
      v6[5] = a2;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __ubn_dispatch_async_block_invoke;
      block[3] = &unk_1E5C249F0;
      block[4] = v6;
      dispatch_async(v5, block);
    }
  }
}

void __54__BWUBNode__handleSupplementalPointCloudSampleBuffer___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 536));
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int8 *)(v2 + 540);
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 536));
  if (!v3)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    int v4 = *(void **)(*(void *)(a1 + 32) + 552);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (!v5) {
      goto LABEL_10;
    }
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    int v8 = 1;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        id v10 = (void *)[*(id *)(*(void *)(a1 + 32) + 552) objectForKeyedSubscript:*(void *)(*((void *)&v13 + 1) + 8 * i)];
        [v10 addPointCloud:*(void *)(a1 + 40)];
        v8 &= [v10 needMorePointClouds] ^ 1;
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
    if (!v8)
    {
      char v11 = 0;
    }
    else
    {
LABEL_10:
      [*(id *)(*(void *)(a1 + 32) + 104) stopPointCloudCaptureForStillImageCaptureWithSettingsID:*(void *)(*(void *)(a1 + 32) + 136)];
      char v11 = 1;
    }
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 536));
    *(unsigned char *)(*(void *)(a1 + 32) + 540) = v11;
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 536));
  }
  id v12 = *(const void **)(a1 + 40);
  if (v12) {
    CFRelease(v12);
  }
  -[BWUBNode _resetProcessingStateIfDone](*(void *)(a1 + 32));
}

- (void)_resetProcessingStateIfDone
{
  if (a1)
  {
    if (!_FigIsCurrentDispatchQueue()) {
      FigDebugAssert3();
    }
    if (*(void *)(a1 + 144)
      && !*(void *)(a1 + 584)
      && ![*(id *)(a1 + 224) count]
      && ![*(id *)(a1 + 272) count]
      && ![*(id *)(a1 + 432) count]
      && ![*(id *)(a1 + 472) count]
      && ![*(id *)(a1 + 408) count]
      && ![*(id *)(a1 + 616) count]
      && *(int *)(a1 + 496) <= 0
      && ![*(id *)(a1 + 552) count]
      && ![*(id *)(a1 + 568) count])
    {
      -[BWUBNode _resetProcessingState](a1);
    }
  }
}

- (uint64_t)_shouldPassthroughWithStillImageSettings:(uint64_t)result
{
  if (result)
  {
    int v3 = objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "deliverSushiRaw");
    char v4 = objc_msgSend((id)objc_msgSend(a2, "requestedSettings"), "previewEnabled");
    char v5 = objc_msgSend((id)objc_msgSend(a2, "requestedSettings"), "rawThumbnailEnabled");
    int v6 = objc_msgSend((id)objc_msgSend(a2, "requestedSettings"), "outputFormat");
    unsigned int v7 = objc_msgSend((id)objc_msgSend(a2, "requestedSettings"), "depthDataDeliveryEnabled") ^ 1;
    if (v6) {
      unsigned int v7 = 0;
    }
    if (v5) {
      unsigned int v7 = 0;
    }
    if (v4) {
      unsigned int v7 = 0;
    }
    if (v3) {
      return v7;
    }
    else {
      return 0;
    }
  }
  return result;
}

- (uint64_t)_infoForCaptureType:(unsigned char *)a3 isSupportedCaptureTypeOut:(char *)a4 isFusionCaptureTypeOut:
{
  if (result)
  {
    uint64_t v6 = result;
    uint64_t result = 0;
    char v7 = 0;
    switch(a2)
    {
      case 1:
      case 2:
      case 6:
      case 7:
        char v7 = 0;
        uint64_t result = 1;
        goto LABEL_4;
      case 10:
        uint64_t result = [*(id *)(v6 + 216) fusionEnabled];
        goto LABEL_12;
      case 11:
        uint64_t result = [*(id *)(v6 + 216) lowLightFusionEnabled];
        goto LABEL_12;
      case 12:
        uint64_t result = -[BWUBNodeConfiguration deepFusionSupportEnabled](*(void *)(v6 + 112));
LABEL_12:
        char v7 = 1;
        if (!a3) {
          goto LABEL_6;
        }
        goto LABEL_5;
      default:
LABEL_4:
        if (a3) {
LABEL_5:
        }
          *a3 = result;
LABEL_6:
        if (a4) {
          *a4 = v7;
        }
        break;
    }
  }
  return result;
}

- (uint64_t)_setupProcessingStateWithSettings:(uint64_t)a1
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  if (!_FigIsCurrentDispatchQueue())
  {
    uint64_t v59 = v2;
    LODWORD(v57) = 0;
    FigDebugAssert3();
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  uint64_t v6 = v5;
  if (!*(void *)(a1 + 152) || !a2)
  {
    int v90 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    uint64_t v23 = 4294950488;
    goto LABEL_88;
  }
  id v62 = v5;
  char v7 = (void *)[a2 requestedSettings];
  int v8 = (void *)[a2 captureSettings];
  if (objc_msgSend(*(id *)(a1 + 144), "isEqualToString:", objc_msgSend(v7, "captureRequestIdentifier")))
  {
    uint64_t v23 = 0;
    goto LABEL_87;
  }
  if (dword_1EB4C5670)
  {
    int v90 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    uint64_t v9 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  char v88 = 0;
  char v87 = 0;
  -[BWUBNode _infoForCaptureType:isSupportedCaptureTypeOut:isFusionCaptureTypeOut:](a1, objc_msgSend(v8, "captureType", v57, v59), &v88, &v87);
  if (!v88)
  {
    uint64_t v23 = 4294954516;
    goto LABEL_87;
  }
  -[BWUBNode _flushBufferPoolsWhenPossibleWithSettings:](a1, a2);
  -[BWUBNode _prepareSharedExternalMemoryResourceForProcessorControllersIfNeeded](a1);
  *(void *)(a1 + 136) = [v8 settingsID];

  *(void *)(a1 + 144) = (id)[v7 captureRequestIdentifier];
  id v10 = [[BWStillImageProcessingPlan alloc] initWithSettings:a2];
  if (!v87)
  {
    if ([v8 captureType] == 7)
    {
      uint64_t v6 = v62;
      if (*(void *)(a1 + 480))
      {
        uint64_t v22 = -[BWUBNode _setupProcessingStateForClientBracketWithSettings:processingPlan:](a1, a2, v10);
        if (v22)
        {
          uint64_t v23 = v22;
          uint64_t v59 = v2;
          LODWORD(v57) = v22;
          goto LABEL_83;
        }
      }
    }
    else
    {
      uint64_t v6 = v62;
      if ([v8 captureType] == 2)
      {
        uint64_t v52 = -[BWUBNode _setupProcessingStateForFlashCaptureWithSettings:processingPlan:](a1, a2, v10);
        if (v52)
        {
          uint64_t v23 = v52;
          uint64_t v59 = v2;
          LODWORD(v57) = v52;
          goto LABEL_83;
        }
      }
      else
      {
        uint64_t v53 = -[BWUBNode _setupProcessingStateForSingleImageCaptureWithSettings:processingPlan:](a1, a2, v10);
        if (v53)
        {
          uint64_t v23 = v53;
          uint64_t v59 = v2;
          LODWORD(v57) = v53;
          goto LABEL_83;
        }
      }
    }
    uint64_t v54 = -[BWUBNode _setupProcessingStateForDeferredCaptureIfNeededWithSettings:](a1, a2);
    uint64_t v23 = v54;
    if (!v54) {
      goto LABEL_88;
    }
    uint64_t v59 = v2;
    LODWORD(v57) = v54;
LABEL_83:
    FigDebugAssert3();
    goto LABEL_88;
  }
  uint64_t v11 = -[BWUBNode _setupProcessingStateForDeferredCaptureIfNeededWithSettings:](a1, a2);
  if (v11)
  {
    uint64_t v23 = v11;
    uint64_t v59 = v2;
    LODWORD(v57) = v11;
LABEL_86:
    FigDebugAssert3();
LABEL_87:
    uint64_t v6 = v62;
    goto LABEL_88;
  }
  uint64_t v65 = v8;
  uint64_t v70 = v10;
  id v67 = -[BWUBNode _nrOutputSbufRouter]((id)a1);
  uint64_t v69 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  id v12 = objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "portTypes");
  uint64_t v13 = [v12 countByEnumeratingWithState:&v83 objects:v94 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v84;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v84 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v83 + 1) + 8 * i);
        if (-[BWUBNode _nrProcessorInputNeededForSettings:portType:](a1, a2, v17))
        {
          if ([*(id *)(a1 + 152) controllerForType:*(void *)(a1 + 208)])
          {
            uint64_t v18 = (void *)[objc_alloc((Class)objc_opt_class()) initWithSettings:a2 portType:v17];
            id v19 = -[BWUBNode _bufferTypesForCaptureSettings:](a1, (void *)[a2 captureSettings]);
            [v18 addOutputSampleBufferRouter:v67 forBufferTypes:v19];
            [(BWStillImageProcessingPlan *)v70 addInput:v18 sequenceNumber:0 portType:v17 bufferTypes:v19];
            objc_msgSend(*(id *)(a1 + 224), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObject:", v18), v17);
            if (v18)
            {
              if ([v18 isMaster]) {
                [v69 insertObject:v18 atIndex:0];
              }
              else {
                [v69 addObject:v18];
              }
            }
          }
        }
        -[BWUBNode _setupDeferredProcessingWithSettings:portType:](a1, (uint64_t)a2, v17);
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v83 objects:v94 count:16];
    }
    while (v14);
  }
  uint64_t v20 = (void *)[*(id *)(a1 + 152) controllerForType:*(void *)(a1 + 208)];
  if ([v65 deliverOriginalImage]) {
    BOOL v21 = ([v65 captureFlags] & 0x2000) == 0;
  }
  else {
    BOOL v21 = 0;
  }
  int v24 = v69;
  int v60 = [v65 deliverOriginalImage];
  if ([v65 captureType] == 12) {
    int v66 = [v65 deliverDeferredPhotoProxyImage] ^ 1;
  }
  else {
    int v66 = 0;
  }
  char v64 = -[BWUBNode _isSemanticRenderingCapture:](a1, a2);
  int v25 = -[BWUBNode _isInferenceInputImageRequiredForSettings:](a1, a2);
  char v63 = -[BWUBNode _inferencesRequiredByProcessorControllersForSettings:](a1, a2);
  BOOL v61 = v21;
  if (v21)
  {
    long long v81 = 0u;
    long long v82 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    uint64_t v26 = [v69 countByEnumeratingWithState:&v79 objects:v93 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v80;
      while (2)
      {
        for (uint64_t j = 0; j != v27; ++j)
        {
          if (*(void *)v80 != v28) {
            objc_enumerationMutation(v69);
          }
          uint64_t v30 = *(void **)(*((void *)&v79 + 1) + 8 * j);
          uint64_t v31 = objc_msgSend(v20, "enqueueInputForProcessing:delegate:processErrorRecoveryFrame:processOriginalImage:processToneMapping:processInferenceInputImage:clientBracketSequenceNumber:processSemanticRendering:provideInferenceInputImageForProcessing:processSmartStyleRenderingInput:inferencesAvailable:", v30, a1, 0, 1, 0, 0, 0);
          if (v31)
          {
            uint64_t v23 = v31;
            uint64_t v59 = v2;
            LODWORD(v57) = v31;
            goto LABEL_86;
          }
          objc_msgSend(v30, "setRemainingProcessingCount:", objc_msgSend(v30, "remainingProcessingCount") + 1);
        }
        uint64_t v27 = [v69 countByEnumeratingWithState:&v79 objects:v93 count:16];
        if (v27) {
          continue;
        }
        break;
      }
    }
  }
  uint64_t v68 = v20;
  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  uint64_t v32 = [v69 countByEnumeratingWithState:&v75 objects:v92 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v76;
    while (2)
    {
      for (uint64_t k = 0; k != v33; ++k)
      {
        if (*(void *)v76 != v34) {
          objc_enumerationMutation(v24);
        }
        uint64_t v36 = *(void **)(*((void *)&v75 + 1) + 8 * k);
        double v37 = (void *)[v36 portType];
        if (-[BWUBNode _processingNeededForSettings:portType:](a1, (void *)[v36 stillImageSettings], v37))
        {
          if (v25)
          {
            [v36 addOutputSampleBufferRouter:-[BWUBNode _ubInferenceInputRouter]((id)a1) forBufferTypes:&unk_1EFB03770];
            [(BWStillImageProcessingPlan *)v70 addInput:v36 sequenceNumber:0 portType:v37 bufferType:15];
          }
          HIBYTE(v58) = v63;
          *(_WORD *)((char *)&v58 + 5) = v25;
          BYTE4(v58) = v64;
          LODWORD(v58) = 0;
          uint64_t v38 = objc_msgSend(v68, "enqueueInputForProcessing:delegate:processErrorRecoveryFrame:processOriginalImage:processToneMapping:processInferenceInputImage:clientBracketSequenceNumber:processSemanticRendering:provideInferenceInputImageForProcessing:processSmartStyleRenderingInput:inferencesAvailable:", v36, a1, 0, 0, 0, 0, v58);
          if (v38)
          {
            uint64_t v23 = v38;
            uint64_t v59 = v2;
            LODWORD(v57) = v38;
            goto LABEL_86;
          }
          if ((v66 & 1) == 0)
          {
            uint64_t v40 = -[BWUBNode _setupProcessingStateForIntelligentDistortionCorrectionIfNeededWithSettings:sequenceNumber:portType:queueProvidingInput:processingPlan:]((id *)a1, a2, 0, (uint64_t)v37, v39, v70);
            if (v40)
            {
              uint64_t v23 = v40;
              uint64_t v59 = v2;
              LODWORD(v57) = v40;
              goto LABEL_86;
            }
            uint64_t v42 = -[BWUBNode _setupProcessingStateForDeepZoomWithSettings:sequenceNumber:portType:queueProvidingInput:processingPlan:](a1, a2, 0, (uint64_t)v37, v41, v70);
            int v24 = v69;
            if (v42)
            {
              uint64_t v23 = v42;
              uint64_t v59 = v2;
              LODWORD(v57) = v42;
              goto LABEL_86;
            }
          }
        }
        objc_msgSend(v36, "setRemainingProcessingCount:", objc_msgSend(v36, "remainingProcessingCount") + 1);
      }
      uint64_t v33 = [v24 countByEnumeratingWithState:&v75 objects:v92 count:16];
      if (v33) {
        continue;
      }
      break;
    }
  }
  uint64_t v43 = -[BWUBNode _setupProcessingStateForDisparityIfNeededWithSettings:sequenceNumber:processingPlan:](a1, a2, 0, v70);
  if (v43)
  {
    uint64_t v23 = v43;
    uint64_t v59 = v2;
    LODWORD(v57) = v43;
    goto LABEL_86;
  }
  uint64_t v6 = v62;
  if (((v60 ^ 1 | v61) & 1) == 0)
  {
    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    uint64_t v44 = [v24 countByEnumeratingWithState:&v71 objects:v91 count:16];
    if (v44)
    {
      uint64_t v45 = v44;
      uint64_t v46 = *(void *)v72;
      while (2)
      {
        for (uint64_t m = 0; m != v45; ++m)
        {
          if (*(void *)v72 != v46) {
            objc_enumerationMutation(v24);
          }
          uint64_t v48 = *(void **)(*((void *)&v71 + 1) + 8 * m);
          uint64_t v49 = objc_msgSend(v68, "enqueueInputForProcessing:delegate:processErrorRecoveryFrame:processOriginalImage:processToneMapping:processInferenceInputImage:clientBracketSequenceNumber:processSemanticRendering:provideInferenceInputImageForProcessing:processSmartStyleRenderingInput:inferencesAvailable:", v48, a1, 0, 1, 0, 0, 0);
          if (v49)
          {
            uint64_t v23 = v49;
            uint64_t v59 = v2;
            LODWORD(v57) = v49;
            goto LABEL_83;
          }
          objc_msgSend(v48, "setRemainingProcessingCount:", objc_msgSend(v48, "remainingProcessingCount") + 1);
        }
        uint64_t v45 = [v24 countByEnumeratingWithState:&v71 objects:v91 count:16];
        if (v45) {
          continue;
        }
        break;
      }
    }
  }
  if (v66)
  {
    uint64_t v50 = -[BWUBNode _setupProcessingStateForDeepFusionWithSettings:processingPlan:]((id *)a1, a2, v70);
    if (v50)
    {
      uint64_t v23 = v50;
      uint64_t v59 = v2;
      LODWORD(v57) = v50;
      goto LABEL_83;
    }
  }
  uint64_t v51 = -[BWUBNode _setupProcessingStateForPointCloudDepthIfNeededWithSettings:processingPlan:](a1, a2, v70);
  uint64_t v23 = v51;
  if (v51)
  {
    uint64_t v59 = v2;
    LODWORD(v57) = v51;
    goto LABEL_83;
  }
  -[BWUBNode _setupProcessingStateForJasperDisparityIfNeededWithSettings:processingPlan:](a1, a2, v70);
LABEL_88:
  objc_msgSend(v6, "drain", v57, v59);
  return v23;
}

uint64_t __38__BWUBNode__handleSampleBuffer_input___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = [*(id *)(a1 + 48) photoIdentifier];
  return [v1 setContainer:v2 photoIdentifier:v3];
}

- (void)_inferenceProcessRedEyeReductionSampleBuffer:(void *)a3 settings:(uint64_t)a4 portType:
{
  if (!a1) {
    return;
  }
  if (!_FigIsCurrentDispatchQueue()) {
    FigDebugAssert3();
  }
  CFTypeRef cf = 0;
  dispatch_group_wait(*(dispatch_group_t *)(a1 + 328), 0xFFFFFFFFFFFFFFFFLL);
  CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(a2);
  if (!ImageBuffer)
  {
    id v10 = 0;
    goto LABEL_23;
  }
  uint64_t v9 = ImageBuffer;
  id v10 = (__CVBuffer *)[*(id *)(a1 + 336) newPixelBuffer];
  if (!v10)
  {
LABEL_23:
    int v17 = -12780;
    goto LABEL_16;
  }
  int CopyWithNewPixelBuffer = -[BWUBNode _scaleInferenceInputForRedEyeReductionFromPixelBuffer:outputPixelBuffer:](a1, v9, v10);
  if (!CopyWithNewPixelBuffer)
  {
    int CopyWithNewPixelBuffer = BWCMSampleBufferCreateCopyWithNewPixelBuffer(a2, v10, (CFTypeRef *)(a1 + 368), (CMSampleBufferRef *)&cf);
    if (!CopyWithNewPixelBuffer)
    {
      int CopyWithNewPixelBuffer = -[BWUBNode _setupProcessingStateForInferenceWithSettings:portType:](a1, a3, a4);
      if (!CopyWithNewPixelBuffer)
      {
        uint64_t v12 = [*(id *)(a1 + 312) objectForKeyedSubscript:a4];
        if (v12)
        {
          uint64_t v13 = v12;
          if (a2) {
            CFRetain(a2);
          }
          if (cf)
          {
            CFRetain(cf);
            CFTypeRef v14 = cf;
          }
          else
          {
            CFTypeRef v14 = 0;
          }
          uint64_t v15 = *(NSObject **)(a1 + 328);
          long long v16 = *(NSObject **)(a1 + 320);
          v18[0] = MEMORY[0x1E4F143A8];
          v18[1] = 3221225472;
          v18[2] = __75__BWUBNode__inferenceProcessRedEyeReductionSampleBuffer_settings_portType___block_invoke;
          v18[3] = &unk_1E5C264A0;
          v18[4] = v13;
          v18[5] = v14;
          v18[6] = a2;
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __ubn_dispatch_group_async_block_invoke;
          block[3] = &unk_1E5C249F0;
          block[4] = v18;
          dispatch_group_async(v15, v16, block);
          int v17 = 0;
          goto LABEL_16;
        }
        goto LABEL_23;
      }
    }
  }
  int v17 = CopyWithNewPixelBuffer;
LABEL_16:
  CVPixelBufferRelease(v10);
  if (cf) {
    CFRelease(cf);
  }
  if (v17) {
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 408), "objectForKeyedSubscript:", a4), "addFrame:faceObservations:", a2, 0);
  }
}

- (id)_ubRERRouter
{
  if (result)
  {
    v1[0] = MEMORY[0x1E4F143A8];
    v1[1] = 3221225472;
    v1[2] = __24__BWUBNode__ubRERRouter__block_invoke;
    v1[3] = &unk_1E5C28D80;
    v1[4] = result;
    return (id)[v1 copy];
  }
  return result;
}

- (void)_handleClientBracketFrameEmissionForProcessorInput:(void *)a3 clientBracketFrame:
{
  if (a1)
  {
    -[BWUBNode _handleClientBracketFrameEmissionForSampleBuffer:stillImageSettings:portType:](a1, a3, (void *)[a2 stillImageSettings], objc_msgSend(a2, "portType"));
    if ((-[BWUBNode _processingNeededForSettings:portType:](a1, (void *)[a2 stillImageSettings], objc_msgSend(a2, "portType")) & 1) == 0)
    {
      if ([a2 receivedAllFrames])
      {
        uint64_t v5 = [a2 portType];
        uint64_t v6 = *(void *)(a1 + 208);
        -[BWUBNode _processorControllerDidFinishProcessingInputForPortType:processorType:](a1, v5, v6);
      }
    }
  }
}

- (void)_handleReferenceFrameEmissionForProcessorInput:(uint64_t)a1
{
  if (a1
    && ((objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "stillImageSettings"), "captureSettings"), "captureStreamSettingsForPortType:", objc_msgSend(a2, "portType")), "captureFlags") & 0x20000) != 0|| *(void *)(a1 + 480)))
  {
    if (objc_msgSend(*(id *)(a1 + 232), "objectForKeyedSubscript:", objc_msgSend(a2, "portType")))
    {
      char v4 = 0;
      uint64_t v5 = 0;
      uint64_t v6 = 0;
    }
    else
    {
      uint64_t v6 = (void *)[a2 referenceFrame];
      char v4 = (const void *)[a2 evMinusReferenceFrame];
      uint64_t v5 = [a2 emitErrorRecoveryFrame]
         ? (void *)[a2 errorRecoveryFrame]
         : 0;
    }
    -[BWUBNode _handleReferenceFrameEmissionForSettings:portType:referenceFrame:evMinusReferenceFrame:errorRecoveryFrame:](a1, (void *)[a2 stillImageSettings], objc_msgSend(a2, "portType"), v6, v4, v5);
    if ((-[BWUBNode _processingNeededForSettings:portType:](a1, (void *)[a2 stillImageSettings], objc_msgSend(a2, "portType")) & 1) == 0&& objc_msgSend(a2, "receivedAllFrames")&& objc_msgSend(*(id *)(a1 + 232), "objectForKeyedSubscript:", objc_msgSend(a2, "portType")))
    {
      uint64_t v7 = [a2 portType];
      uint64_t v8 = *(void *)(a1 + 208);
      -[BWUBNode _processorControllerDidFinishProcessingInputForPortType:processorType:](a1, v7, v8);
    }
  }
}

- (uint64_t)_processingNeededForSettings:(void *)a3 portType:
{
  if (result)
  {
    if (*(void *)(result + 480)) {
      BOOL v5 = 0;
    }
    else {
      BOOL v5 = (objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureFlags") & 0x20800) == 2048;
    }
    if (objc_msgSend(a3, "isEqualToString:", objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "masterPortType"))) {
      return 1;
    }
    else {
      return objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "requestedSettings"), "bravoConstituentImageDeliveryDeviceTypes"), "count")|| v5;
    }
  }
  return result;
}

- (uint64_t)_singleImageProcessSampleBuffer:(void *)a3 settings:(uint64_t)a4 portType:
{
  if (!a1) {
    return 0;
  }
  if (!_FigIsCurrentDispatchQueue())
  {
    uint64_t v21 = v4;
    LODWORD(v19) = 0;
    FigDebugAssert3();
  }
  uint64_t v9 = [[BWStillImageProcessingPlan alloc] initWithSettings:a3];
  id v10 = (void *)[objc_alloc((Class)objc_opt_class()) initWithSettings:a3 portType:a4];
  int v11 = -[BWUBNode _isInferenceInputImageRequiredForSettings:](a1, a3);
  unsigned __int8 v12 = v11;
  if (v11)
  {
    uint64_t v22 = MEMORY[0x1E4F143A8];
    uint64_t v23 = 3221225472;
    int v24 = __35__BWUBNode__ubInferenceInputRouter__block_invoke;
    int v25 = &unk_1E5C28D80;
    uint64_t v26 = a1;
    objc_msgSend(v10, "addOutputSampleBufferRouter:forBufferTypes:", (id)objc_msgSend(&v22, "copy"), &unk_1EFB03728);
    [(BWStillImageProcessingPlan *)v9 addInput:v10 sequenceNumber:0 portType:a4 bufferType:15];
  }
  uint64_t v13 = *(void *)(a1 + 160);
  uint64_t v22 = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  int v24 = __53__BWUBNode__standardNROutputRouterWithExpectedQueue___block_invoke;
  int v25 = &unk_1E5C28E48;
  uint64_t v26 = v13;
  uint64_t v27 = a1;
  objc_msgSend(v10, "addOutputSampleBufferRouter:forBufferTypes:", (id)objc_msgSend(&v22, "copy", v19, v21), &unk_1EFB03740);
  [v10 addFrame:a2];
  [(BWStillImageProcessingPlan *)v9 addInput:v10 sequenceNumber:0 portType:a4 bufferType:1];
  char v14 = -[BWUBNode _inferencesRequiredByProcessorControllersForSettings:](a1, a3);
  -[BWUBNode _setupProcessingStateForJasperDisparityIfNeededWithSettings:processingPlan:](a1, a3, v9);
  uint64_t v16 = -[BWUBNode _setupProcessingStateForIntelligentDistortionCorrectionIfNeededWithSettings:sequenceNumber:portType:queueProvidingInput:processingPlan:]((id *)a1, a3, 0, a4, v15, v9);
  if (!v16)
  {
    HIBYTE(v20) = v14;
    *(_WORD *)((char *)&v20 + 5) = v12;
    BYTE4(v20) = 0;
    LODWORD(v20) = 0;
    uint64_t v16 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 152), "controllerForType:", *(void *)(a1 + 208)), "enqueueInputForProcessing:delegate:processErrorRecoveryFrame:processOriginalImage:processToneMapping:processInferenceInputImage:clientBracketSequenceNumber:processSemanticRendering:provideInferenceInputImageForProcessing:processSmartStyleRenderingInput:inferencesAvailable:", v10, a1, 0, 0, 0, 0, v20);
  }
  uint64_t v17 = v16;

  return v17;
}

- (void)_propagateSushiRawDNGDictionaryWithOutputSampleBuffer:(uint64_t)a3 requestedDimensions:(int)a4 requiresGDCInformation:
{
  if (a1)
  {
    AttachedMedia = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a2, 0x1EFA743A0);
    if (AttachedMedia)
    {
      uint64_t v6 = AttachedMedia;
      CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(AttachedMedia);
      if (ImageBuffer)
      {
        uint64_t v8 = ImageBuffer;
        uint64_t v9 = (void *)CMGetAttachment(v6, (CFStringRef)*MEMORY[0x1E4F53070], 0);
        id v10 = (const void *)objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend((id)CMGetAttachment(v6, @"StillImageProcessingFlags", 0), "unsignedIntValue") | 0x80);
        CMSetAttachment(v6, @"StillImageProcessingFlags", v10, 1u);
        if (!CMGetAttachment(v6, @"RawDNGDictionary", 0))
        {
          uint64_t v11 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F54128]];
          uint64_t v12 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 216), "rawColorCalibrationsByPortType"), "objectForKeyedSubscript:", v11);
          if (v12)
          {
            uint64_t v13 = (void *)v12;
            uint64_t v14 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 216), "rawLensShadingCorrectionCoefficientsByPortType"), "objectForKeyedSubscript:", v11);
            if (v14)
            {
              uint64_t v15 = (void *)v14;
              unint64_t v16 = BWPixelBufferDimensionsFromSampleBuffer(v6);
              OSType PixelFormatType = CVPixelBufferGetPixelFormatType(v8);
              uint64_t v18 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 216), "sensorConfigurationsByPortType"), "objectForKeyedSubscript:", v11);
              if (v18)
              {
                uint64_t v19 = v18;
                uint64_t v20 = (void *)[v18 sensorIDDictionary];
                uint64_t v21 = (void *)[v19 cameraInfo];
                uint64_t v22 = (void *)BWCreateSushiRawDNGDictionary(v16, PixelFormatType, a3, v9, v13, v15, 1, a4, v20, v21, objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E4F54148]), "intValue"));
                if (v22)
                {
                  id v25 = v22;
                  CMSetAttachment(v6, @"RawDNGDictionary", v22, 1u);
                }
              }
            }
          }
        }
      }
    }
  }
}

- (void)_emitSampleBuffer:(uint64_t)a3 description:
{
  if (a1)
  {
    -[BWUBNode _removeNonPropagatedAttachedMediaFromSampleBuffer:](a1, a2);
    if (a2) {
      CFRetain(a2);
    }
    uint64_t v6 = *(NSObject **)(a1 + 176);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __42__BWUBNode__emitSampleBuffer_description___block_invoke;
    v7[3] = &unk_1E5C249A0;
    v7[5] = a1;
    v7[6] = a2;
    v7[4] = a3;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __ubn_dispatch_async_block_invoke;
    block[3] = &unk_1E5C249F0;
    block[4] = v7;
    dispatch_async(v6, block);
  }
}

- (void)handleNodeError:(id)a3 forInput:(id)a4
{
  if (self->_pointCloudInput != a4)
  {
    uint64_t v10 = 0;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x2020000000;
    char v13 = 1;
    if (self->_resourcesReleased) {
      goto LABEL_4;
    }
    processorCoordinatorWorkerQueue = self->_processorCoordinatorWorkerQueue;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __37__BWUBNode_handleNodeError_forInput___block_invoke;
    v9[3] = &unk_1E5C25120;
    v9[4] = a3;
    v9[5] = self;
    v9[6] = &v10;
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    unint64_t v16 = __ubn_dispatch_sync_block_invoke;
    uint64_t v17 = &unk_1E5C249F0;
    uint64_t v18 = v9;
    dispatch_sync(processorCoordinatorWorkerQueue, &block);
    if (*((unsigned char *)v11 + 24))
    {
LABEL_4:
      emitQueue = self->_emitQueue;
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __37__BWUBNode_handleNodeError_forInput___block_invoke_2;
      v8[3] = &unk_1E5C24458;
      v8[4] = self;
      v8[5] = a3;
      uint64_t block = MEMORY[0x1E4F143A8];
      uint64_t v15 = 3221225472;
      unint64_t v16 = __ubn_dispatch_async_block_invoke;
      uint64_t v17 = &unk_1E5C249F0;
      uint64_t v18 = v8;
      dispatch_async(emitQueue, &block);
    }
    _Block_object_dispose(&v10, 8);
  }
}

void __37__BWUBNode_handleNodeError_forInput___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) errorCode] == -16800
    || [*(id *)(a1 + 32) errorCode] == -16802)
  {
    uint64_t v2 = [*(id *)(*(void *)(a1 + 40) + 552) count];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v3 = *(void **)(*(void *)(a1 + 40) + 552);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v19 != v6) {
            objc_enumerationMutation(v3);
          }
          objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 40) + 552), "objectForKeyedSubscript:", *(void *)(*((void *)&v18 + 1) + 8 * i)), "setSkipProcessing:", 1);
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v5);
    }
    uint64_t v8 = [*(id *)(*(void *)(a1 + 40) + 568) count];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v9 = *(void **)(*(void *)(a1 + 40) + 568);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v15;
      do
      {
        for (uint64_t j = 0; j != v11; ++j)
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(v9);
          }
          objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 40) + 568), "objectForKeyedSubscript:", *(void *)(*((void *)&v14 + 1) + 8 * j)), "setSkipProcessing:", 1);
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
      }
      while (v11);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 40) + 152), "controllerForType:", *(void *)(*(void *)(a1 + 40) + 208)), "finishProcessingCurrentInputNow") ^ 1;
    if (v2 && !*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 40) + 152), "controllerForType:", 9), "finishProcessingCurrentInputNow") ^ 1;
    }
    if (v8 && !*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 40) + 152), "controllerForType:", 13), "finishProcessingCurrentInputNow") ^ 1;
    }
  }
  if ([*(id *)(a1 + 32) errorCode] == -16806) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "stillImageSettings"), "requestedSettings"), "isBeginMomentCaptureSettings") ^ 1;
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    -[BWUBNode _resetProcessingState](*(void *)(a1 + 40));
  }
}

uint64_t __37__BWUBNode_handleNodeError_forInput___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) emitNodeError:*(void *)(a1 + 40)];
}

- (void)handleStillImagePrewarmWithSettings:(id)a3 forInput:(id)a4
{
  if (!self->_resourcesReleased)
  {
    processorCoordinatorWorkerQueue = self->_processorCoordinatorWorkerQueue;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __57__BWUBNode_handleStillImagePrewarmWithSettings_forInput___block_invoke;
    v5[3] = &unk_1E5C24458;
    v5[4] = self;
    void v5[5] = a3;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __ubn_dispatch_sync_block_invoke;
    block[3] = &unk_1E5C249F0;
    block[4] = v5;
    dispatch_sync(processorCoordinatorWorkerQueue, block);
  }
}

void __57__BWUBNode_handleStillImagePrewarmWithSettings_forInput___block_invoke(uint64_t a1)
{
  block[16] = *MEMORY[0x1E4F143B8];
  if ((objc_msgSend(*(id *)(*(void *)(a1 + 32) + 128), "isEqualToString:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "requestedSettings"), "captureRequestIdentifier")) & 1) == 0)
  {
    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 144);
    if (v2
      && (objc_msgSend(v2, "isEqualToString:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "requestedSettings"), "captureRequestIdentifier")) & 1) == 0)
    {
      int v17 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      -[BWUBNode _resetProcessingState](*(void *)(a1 + 32));
    }
    uint64_t v4 = *(void *)(a1 + 32);
    if (*(void *)(v4 + 144))
    {
      int v5 = 0;
    }
    else
    {
      if ((objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "captureSettings"), "captureFlags") & 0x200) != 0)
      {
        os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 536));
        *(unsigned char *)(*(void *)(a1 + 32) + 540) = 0;
        os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 536));
      }
      int v6 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "requestedSettings", v12, v13), "isBeginMomentCaptureSettings");
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = *(void **)(a1 + 40);
      if (v6) {
        int v9 = -[BWUBNode _setupProcessingStateIfNeededWithBeginMomentSettings:](v7, v8);
      }
      else {
        int v9 = -[BWUBNode _setupProcessingStateWithSettings:](v7, v8);
      }
      int v5 = v9;
      uint64_t v4 = *(void *)(a1 + 32);
      if (v5 == -16808)
      {
        -[BWUBNode _resetProcessingState](v4);
        uint64_t v4 = *(void *)(a1 + 32);
        int v5 = -16808;
      }
    }
    uint64_t v10 = *(NSObject **)(v4 + 176);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __57__BWUBNode_handleStillImagePrewarmWithSettings_forInput___block_invoke_82;
    v14[3] = &unk_1E5C26F78;
    int v15 = v5;
    uint64_t v11 = *(void *)(a1 + 40);
    v14[4] = v4;
    void v14[5] = v11;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __ubn_dispatch_async_block_invoke;
    block[3] = &unk_1E5C249F0;
    block[4] = v14;
    dispatch_async(v10, block);
  }
}

- (uint64_t)_setupProcessingStateIfNeededWithBeginMomentSettings:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    if (!_FigIsCurrentDispatchQueue()) {
      FigDebugAssert3();
    }
    if (*(void *)(v3 + 152)
      && (objc_msgSend((id)objc_msgSend(a2, "requestedSettings"), "isBeginMomentCaptureSettings") & 1) != 0
      && (objc_msgSend((id)v3, "processingOnBeginMomentSupportedForCaptureSettings:", objc_msgSend(a2, "captureSettings")) & 1) != 0)
    {
      if ((objc_msgSend(*(id *)(v3 + 144), "isEqualToString:", objc_msgSend((id)objc_msgSend(a2, "requestedSettings"), "captureRequestIdentifier")) & 1) == 0)
      {
        if (dword_1EB4C5670)
        {
          os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        -[BWUBNode _resetProcessingState](v3);
        *(void *)(v3 + 136) = [a2 settingsID];
        *(void *)(v3 + 144) = (id)objc_msgSend((id)objc_msgSend(a2, "requestedSettings"), "captureRequestIdentifier");
        -[BWUBNode _flushBufferPoolsWhenPossibleWithSettings:](v3, a2);
        -[BWUBNode _prepareSharedExternalMemoryResourceForProcessorControllersIfNeeded](v3);
      }
      return 0;
    }
    else
    {
      int v5 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      return 4294950488;
    }
  }
  return result;
}

void __57__BWUBNode_handleStillImagePrewarmWithSettings_forInput___block_invoke_82(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 48) == -16808)
  {
    id v4 = +[BWNodeError newError:4294950488 sourceNode:*(void *)(a1 + 32) stillImageSettings:*(void *)(a1 + 40) metadata:0];
    [*(id *)(*(void *)(a1 + 32) + 16) emitNodeError:v4];
  }
  else
  {
    uint64_t v2 = *(void *)(a1 + 40);
    uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 16);
    [v3 emitStillImagePrewarmMessageWithSettings:v2];
  }
}

- (__CVBuffer)processorController:(id)a3 newOutputPixelBufferForProcessorInput:(id)a4 type:(unint64_t)a5
{
  return [(BWUBNode *)self processorController:a3 newOutputPixelBufferForProcessorInput:a4 type:a5 dimensions:0];
}

- (__CVBuffer)processorController:(id)a3 newOutputPixelBufferForProcessorInput:(id)a4 type:(unint64_t)a5 dimensions:(id)a6
{
  return (__CVBuffer *)-[BWUBNode processorController:newOutputPixelBufferForProcessorInput:type:dimensions:attachedMediaKey:]((uint64_t)self, a3, (uint64_t)a4, a5);
}

- (uint64_t)processorController:(uint64_t)a3 newOutputPixelBufferForProcessorInput:(uint64_t)a4 type:dimensions:attachedMediaKey:
{
  if (!a1) {
    return 0;
  }
  mach_absolute_time();
  uint64_t v7 = 0;
  switch([a2 type])
  {
    case 1:
    case 6:
      uint64_t v7 = 0;
      switch(a4)
      {
        case 1:
        case 2:
        case 3:
        case 4:
        case 5:
        case 6:
        case 7:
        case 14:
          goto LABEL_6;
        case 8:
        case 10:
          uint64_t v11 = 288;
          goto LABEL_22;
        case 9:
        case 11:
        case 12:
          uint64_t v11 = 296;
          goto LABEL_22;
        case 15:
          goto LABEL_9;
        case 19:
          goto LABEL_16;
        case 21:
          goto LABEL_15;
        default:
          goto LABEL_24;
      }
      break;
    case 2:
      uint64_t v7 = 0;
      switch(a4)
      {
        case 13:
LABEL_6:
          uint64_t v10 = *(void **)(a1 + 200);
          if (!v10) {
            goto LABEL_13;
          }
          goto LABEL_19;
        case 15:
LABEL_9:
          uint64_t v11 = 336;
LABEL_22:
          uint64_t v10 = *(void **)(a1 + v11);
          if (!v10) {
            goto LABEL_23;
          }
          goto LABEL_19;
        case 19:
          goto LABEL_16;
        case 21:
          goto LABEL_15;
        default:
          goto LABEL_24;
      }
      break;
    case 7:
      if (a4 == 21)
      {
LABEL_15:
        uint64_t v8 = *(void **)(a1 + 16);
        int v9 = @"DemosaicedRaw";
        goto LABEL_17;
      }
      if (a4 == 19)
      {
LABEL_16:
        uint64_t v8 = *(void **)(a1 + 16);
        int v9 = @"GainMap";
        goto LABEL_17;
      }
      if (a4 != 1) {
        goto LABEL_23;
      }
LABEL_13:
      uint64_t v12 = (void *)[*(id *)(a1 + 16) primaryMediaProperties];
      goto LABEL_18;
    case 8:
    case 9:
    case 13:
      if (a4 == 2001)
      {
        uint64_t v8 = *(void **)(a1 + 16);
        int v9 = @"Depth";
LABEL_17:
        uint64_t v12 = (void *)[v8 mediaPropertiesForAttachedMediaKey:v9];
LABEL_18:
        uint64_t v10 = (void *)[v12 livePixelBufferPool];
        if (v10) {
          goto LABEL_19;
        }
      }
LABEL_23:
      uint64_t v7 = 0;
      break;
    case 10:
      uint64_t v10 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "primaryMediaProperties"), "livePixelBufferPool");
LABEL_19:
      uint64_t v7 = [v10 newPixelBuffer];
      break;
    default:
      break;
  }
LABEL_24:
  mach_absolute_time();
  FigHostTimeToNanoseconds();
  if (v7 && dword_1EB4C5670)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v7;
}

- (__CVBuffer)processorController:(id)a3 newOutputPixelBufferForProcessorInput:(id)a4 type:(unint64_t)a5 attachedMediaKey:(id)a6
{
  return (__CVBuffer *)-[BWUBNode processorController:newOutputPixelBufferForProcessorInput:type:dimensions:attachedMediaKey:]((uint64_t)self, a3, (uint64_t)a4, a5);
}

- (void)processorController:(id)a3 didFinishProcessingSampleBuffer:(opaqueCMSampleBuffer *)a4 type:(unint64_t)a5 processorInput:(id)a6 err:(int)a7
{
  uint64_t v8 = *(void *)&a7;
  uint64_t v13 = self;
  block[16] = *MEMORY[0x1E4F143B8];
  if (dword_1EB4C5670)
  {
    unsigned int v65 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    uint64_t v13 = self;
  }
  id v52 = a6;
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(a6, "settings", v45, v48), "captureRequestIdentifier"), "isEqualToString:", v13->_currentCaptureRequestIdentifier);
  if (!v8
    && -[BWStillImageNodeConfiguration deferredPhotoProcessorEnabled](v13->_nodeConfiguration, "deferredPhotoProcessorEnabled")&& ([a3 type] == 2 || objc_msgSend(a3, "type") == 6))
  {
    int v15 = (const void *)objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend((id)CMGetAttachment(a4, @"StillImageProcessingFlags", 0), "unsignedIntValue") | 0x2000);
    CMSetAttachment(a4, @"StillImageProcessingFlags", v15, 1u);
    AttachedMedia = (const void *)BWSampleBufferGetAttachedMedia(a4, 0x1EFA745E0);
    if (AttachedMedia)
    {
      int v17 = AttachedMedia;
      long long v18 = (const void *)objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend((id)CMGetAttachment(AttachedMedia, @"StillImageProcessingFlags", 0), "unsignedIntValue") | 0x2000);
      CMSetAttachment(v17, @"StillImageProcessingFlags", v18, 1u);
    }
  }
  switch([a3 type])
  {
    case 1:
    case 6:
      if (!_FigIsCurrentDispatchQueue())
      {
        uint64_t v49 = v7;
        LODWORD(v46) = 0;
        FigDebugAssert3();
      }
      if (a5 == 7 && !v8)
      {
        if ((int)-[BWUBNodeConfiguration deepZoomVersion]((uint64_t)v13->_nodeConfiguration) >= 1
          && +[BWDeepZoomProcessorControllerConfiguration doDeepZoomStandardOrLiteForSampleBuffer:type:sensorConfiguration:intermediateZoomSrcRectOut:intermediateZoomDstRectOut:](BWDeepZoomProcessorControllerConfiguration, "doDeepZoomStandardOrLiteForSampleBuffer:type:sensorConfiguration:intermediateZoomSrcRectOut:intermediateZoomDstRectOut:", a4, 1, objc_msgSend((id)-[BWUBNodeConfiguration sensorConfigurationsByPortType]((uint64_t)v13->_nodeConfiguration), "objectForKeyedSubscript:", objc_msgSend(a6, "portType")), 0, 0))
        {
          -[BWDeferredPipelineParameters setDeepZoomVersion:](-[BWDeferredCaptureControllerInput pipelineParameters](v13->_deferredCaptureControllerInput, "pipelineParameters"), "setDeepZoomVersion:", -[BWUBNodeConfiguration deepZoomVersion]((uint64_t)v13->_nodeConfiguration));
        }
        long long v19 = objc_msgSend((id)CMGetAttachment(a4, @"PhotoManifest", 0), "descriptorForSampleBuffer:", a4);
        CMSampleBufferGetPresentationTimeStamp(&v63, a4);
        CMTime v62 = v63;
        [v19 setPresentationTimeStamp:&v62];
        objc_msgSend(v19, "setTime:", objc_msgSend(MEMORY[0x1E4F1C9C8], "now"));
        objc_msgSend(v19, "setTimeZone:", objc_msgSend(MEMORY[0x1E4F1CAF0], "systemTimeZone"));
        [(BWDeferredCaptureControllerInput *)v13->_deferredCaptureControllerInput addPhotoDescriptor:v19];
        if (objc_msgSend((id)objc_msgSend(v52, "processingSettings"), "provideDemosaicedRaw"))
        {
          long long v20 = (const void *)BWSampleBufferGetAttachedMedia(a4, 0x1EFA745E0);
          id v21 = (id)CMGetAttachment(v20, @"RawDNGDictionary", 0);
          uint64_t v22 = (void *)[v52 settings];
          if (v21)
          {
            uint64_t v23 = (void *)BWCreateDNGDictionaryWithUpdatedDimensionsIfNeeded(v21, [v22 deferredPhotoProxyWidth] | (unint64_t)(objc_msgSend(v22, "deferredPhotoProxyHeight") << 32), objc_msgSend(v22, "deferredPhotoFinalWidth") | (unint64_t)(objc_msgSend(v22, "deferredPhotoFinalHeight") << 32));
            if (v23) {
              id v21 = v23;
            }
            -[BWDeferredCaptureControllerInput addDictionary:tag:](v13->_deferredCaptureControllerInput, "addDictionary:tag:", v21, [NSString stringWithFormat:@"%@-%@", BWDeferredIntermediateTagDNGDictionaryPrefix, objc_msgSend(v52, "portType", v46, v49)]);
          }
          else if (![v22 outputFormat])
          {
            [(BWDeferredCaptureControllerInput *)v13->_deferredCaptureControllerInput encounteredProcessingError:0];
            uint64_t v41 = (const void *)objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend((id)CMGetAttachment(a4, @"StillImageProcessingFlags", 0), "unsignedIntValue") ^ 0x1000);
            CMSetAttachment(a4, @"StillImageProcessingFlags", v41, 1u);
          }
        }
      }
      break;
    case 2:
      if (_FigIsCurrentDispatchQueue())
      {
        if (v8) {
          break;
        }
      }
      else
      {
        uint64_t v49 = v7;
        LODWORD(v46) = 0;
        FigDebugAssert3();
        if (v8) {
          break;
        }
      }
      BOOL v24 = -[BWUBNodeConfiguration deepFusionSupportEnabled]((BOOL)v13->_nodeConfiguration);
      if (a5 != 15 && v24)
      {
        uint64_t v25 = [a6 portType];
        v61[0] = MEMORY[0x1E4F143A8];
        v61[1] = 3221225472;
        v61[2] = __88__BWUBNode_processorController_didFinishProcessingSampleBuffer_type_processorInput_err___block_invoke;
        v61[3] = &unk_1E5C24458;
        v61[4] = v13;
        v61[5] = v25;
        -[BWUBNode _deepFusionDispatch:direction:block:]((uint64_t)v13, 2, 3, (uint64_t)v61);
      }
      break;
    case 5:
      if (!_FigIsCurrentDispatchQueue())
      {
        uint64_t v49 = v7;
        LODWORD(v46) = 0;
        FigDebugAssert3();
      }
      break;
    default:
      break;
  }
  uint64_t v26 = objc_msgSend(v52, "outputSampleBufferRouterForBufferType:", a5, v46, v49);
  if (![v26 outputSampleBufferRouter])
  {
    uint64_t v43 = NSString;
    uint64_t v44 = BWStillImageProcessorTypeToShortString([a3 type]);
    uint64_t v42 = [v43 stringWithFormat:@"No output router for output sample buffer of %@ (buffer type: %@, err: %d)", v44, BWStillImageBufferTypeToShortString(a5), v8];
LABEL_56:
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:v42 userInfo:0]);
  }
  uint64_t v27 = (void *)MEMORY[0x1A6272C70]();
  uint64_t v28 = [v26 outputSampleBufferRouter];
  (*(void (**)(uint64_t, opaqueCMSampleBuffer *, unint64_t, id, uint64_t))(v28 + 16))(v28, a4, a5, v52, v8);
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  obuint64_t j = (id)[v26 bypassedProcessorsTypes];
  uint64_t v29 = [obj countByEnumeratingWithState:&v57 objects:v66 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v58;
    do
    {
      uint64_t v32 = 0;
      do
      {
        if (*(void *)v58 != v31) {
          objc_enumerationMutation(obj);
        }
        unint64_t v33 = (int)objc_msgSend(*(id *)(*((void *)&v57 + 1) + 8 * v32), "intValue", v47, v50);
        if (dword_1EB4C5670)
        {
          unsigned int v65 = 0;
          os_log_type_t type = OS_LOG_TYPE_DEFAULT;
          uint64_t v34 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          unsigned int v35 = v65;
          if (os_log_type_enabled(v34, type)) {
            unsigned int v36 = v35;
          }
          else {
            unsigned int v36 = v35 & 0xFFFFFFFE;
          }
          if (v36)
          {
            uint64_t v37 = BWStillImageProcessorTypeToShortString(v33);
            int v67 = 136315650;
            uint64_t v68 = "-[BWUBNode processorController:didFinishProcessingSampleBuffer:type:processorInput:err:]";
            __int16 v69 = 2112;
            uint64_t v70 = v37;
            __int16 v71 = 2112;
            id v72 = v52;
            LODWORD(v50) = 32;
            id v47 = &v67;
            _os_log_send_and_compose_impl();
          }
          fig_log_call_emit_and_clean_up_after_send_and_compose();
          uint64_t v13 = self;
        }
        if (v33 <= 0x13)
        {
          if (v33 == 7)
          {
            processorCoordinatorWorkerQueue = v13->_processorCoordinatorWorkerQueue;
            uint64_t v39 = v56;
            v56[0] = MEMORY[0x1E4F143A8];
            v56[1] = 3221225472;
            v56[2] = __88__BWUBNode_processorController_didFinishProcessingSampleBuffer_type_processorInput_err___block_invoke_95;
            v56[3] = &unk_1E5C24430;
            v56[4] = v13;
            goto LABEL_47;
          }
          if (v33 == 10)
          {
            processorCoordinatorWorkerQueue = v13->_processorCoordinatorWorkerQueue;
            uint64_t v39 = v55;
            v55[0] = MEMORY[0x1E4F143A8];
            v55[1] = 3221225472;
            v55[2] = __88__BWUBNode_processorController_didFinishProcessingSampleBuffer_type_processorInput_err___block_invoke_2;
            v55[3] = &unk_1E5C24430;
            v55[4] = v13;
LABEL_47:
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __ubn_dispatch_async_block_invoke;
            block[3] = &unk_1E5C249F0;
            block[4] = v39;
            dispatch_async(processorCoordinatorWorkerQueue, block);
            goto LABEL_48;
          }
          if (((1 << v33) & 0xFFB7E) != 0)
          {
            uint64_t v42 = [NSString stringWithFormat:@"Processor bypassing support has not been implemented for %@", BWStillImageProcessorTypeToShortString(v33), v50, v51];
            goto LABEL_56;
          }
        }
LABEL_48:
        ++v32;
      }
      while (v30 != v32);
      uint64_t v40 = [obj countByEnumeratingWithState:&v57 objects:v66 count:16];
      uint64_t v30 = v40;
    }
    while (v40);
  }
}

void __88__BWUBNode_processorController_didFinishProcessingSampleBuffer_type_processorInput_err___block_invoke(uint64_t a1)
{
}

- (void)_processorControllerDidFinishProcessingInputForPortType:(uint64_t)a3 processorType:
{
  if (a1)
  {
    if (!_FigIsCurrentDispatchQueue()) {
      FigDebugAssert3();
    }
    switch(a3)
    {
      case 1:
      case 6:
        int v6 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 224), "objectForKeyedSubscript:", a2), "firstObject");
        if (v6)
        {
          uint64_t v7 = v6;
          int v8 = [v6 remainingProcessingCount];
          if (v8 > 1)
          {
            [v7 setRemainingProcessingCount:(v8 - 1)];
          }
          else
          {
            [v7 setRemainingProcessingCount:0];
            objc_msgSend((id)objc_msgSend(*(id *)(a1 + 224), "objectForKeyedSubscript:", a2), "removeObject:", v7);
            if (!objc_msgSend((id)objc_msgSend(*(id *)(a1 + 224), "objectForKeyedSubscript:", a2), "count")) {
              [*(id *)(a1 + 224) setObject:0 forKeyedSubscript:a2];
            }
            if (dword_1EB4C5670)
            {
              os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
              fig_log_call_emit_and_clean_up_after_send_and_compose();
            }
          }
        }
        return;
      case 2:
        uint64_t v10 = 272;
        goto LABEL_23;
      case 3:
        uint64_t v10 = 312;
        goto LABEL_23;
      case 4:
        uint64_t v10 = 408;
        goto LABEL_23;
      case 5:
        uint64_t v10 = 616;
        goto LABEL_23;
      case 7:
        if (![*(id *)(a1 + 432) objectForKeyedSubscript:a2]) {
          return;
        }
        int v11 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 432), "objectForKeyedSubscript:", a2), "intValue");
        if (v11 > 1)
        {
          uint64_t v14 = [NSNumber numberWithInt:(v11 - 1)];
          uint64_t v13 = *(void **)(a1 + 432);
        }
        else
        {
          [*(id *)(a1 + 424) setObject:0 forKeyedSubscript:a2];
          uint64_t v10 = 432;
LABEL_23:
          uint64_t v13 = *(void **)(a1 + v10);
          uint64_t v14 = 0;
        }
        [v13 setObject:v14 forKeyedSubscript:a2];
        break;
      case 8:
        --*(_DWORD *)(a1 + 496);

        uint64_t v12 = 488;
        goto LABEL_28;
      case 9:
        uint64_t v10 = 552;
        goto LABEL_23;
      case 10:
        uint64_t v10 = 472;
        goto LABEL_23;
      case 11:
        uint64_t v10 = 256;
        goto LABEL_23;
      case 13:
        uint64_t v10 = 568;
        goto LABEL_23;
      case 14:

        uint64_t v12 = 584;
LABEL_28:
        *(void *)(a1 + v12) = 0;
        break;
      default:
        return;
    }
  }
}

uint64_t __88__BWUBNode_processorController_didFinishProcessingSampleBuffer_type_processorInput_err___block_invoke_95(uint64_t a1)
{
  uint64_t v1 = (void *)[*(id *)(*(void *)(a1 + 32) + 152) controllerForType:7];
  return [v1 cancelProcessing];
}

uint64_t __88__BWUBNode_processorController_didFinishProcessingSampleBuffer_type_processorInput_err___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = (void *)[*(id *)(*(void *)(a1 + 32) + 152) controllerForType:10];
  return [v1 cancelProcessing];
}

- (void)_removeNonPropagatedAttachedMediaFromSampleBuffer:(uint64_t)a1
{
  if (a1)
  {
    if (*(void *)(a1 + 480)) {
      BWSampleBufferRemoveAttachedMedia(a2, 0x1EFA74380);
    }
    BWSampleBufferRemoveAttachedMedia(a2, 0x1EFA74640);
    BWSampleBufferRemoveAttachedMedia(a2, 0x1EFA74660);
  }
}

- (void)_releaseNodeResourcesIfNeededBeforeEmittingSampleBuffer:(uint64_t)a1
{
  if (a1)
  {
    if (!_FigIsNotCurrentDispatchQueue())
    {
      uint64_t v7 = v2;
      LODWORD(v6) = 0;
      FigDebugAssert3();
    }
    if (objc_msgSend(*(id *)(a1 + 112), "deferredPhotoProcessorEnabled", v6, v7))
    {
      int v5 = (void *)CMGetAttachment(a2, @"StillSettings", 0);
      if (v5)
      {
        if ((objc_msgSend((id)objc_msgSend(v5, "captureSettings"), "captureFlags") & 0x100000000) != 0)
        {
          -[BWUBNode _releaseResources](a1);
        }
      }
    }
  }
}

void __42__BWUBNode__emitSampleBuffer_description___block_invoke(uint64_t a1)
{
  if (dword_1EB4C5670)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  -[BWUBNode _releaseNodeResourcesIfNeededBeforeEmittingSampleBuffer:](*(void *)(a1 + 40), *(const void **)(a1 + 48));
  [*(id *)(*(void *)(a1 + 40) + 16) emitSampleBuffer:*(void *)(a1 + 48)];
  uint64_t v3 = *(const void **)(a1 + 48);
  if (v3) {
    CFRelease(v3);
  }
}

- (void)_emitError:(uint64_t)a1 processorInput:(uint64_t)a2 metadata:(void *)a3 description:(uint64_t)a4
{
  block[16] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (dword_1EB4C5670)
    {
      int v15 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    id v9 = +[BWNodeError newError:sourceNode:stillImageSettings:metadata:](BWNodeError, "newError:sourceNode:stillImageSettings:metadata:", a2, a1, objc_msgSend(a3, "stillImageSettings", v11, v12), a4);
    uint64_t v10 = *(NSObject **)(a1 + 176);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __59__BWUBNode__emitError_processorInput_metadata_description___block_invoke;
    v13[3] = &unk_1E5C24458;
    v13[4] = a1;
    void v13[5] = v9;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __ubn_dispatch_async_block_invoke;
    block[3] = &unk_1E5C249F0;
    block[4] = v13;
    dispatch_async(v10, block);
  }
}

void __59__BWUBNode__emitError_processorInput_metadata_description___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) emitNodeError:*(void *)(a1 + 40)];
  uint64_t v2 = *(void **)(a1 + 40);
}

- (void)processorController:(id)a3 didFinishProcessingInput:(id)a4 err:(int)a5
{
  uint64_t v6 = *(void *)&a5;
  uint64_t v10 = [a4 portType];
  uint64_t v11 = [a3 type];
  uint64_t v12 = (void *)[a4 stillImageSettings];
  switch(v11)
  {
    case 1:
    case 6:
    case 11:
      if (!_FigIsCurrentDispatchQueue()) {
        FigDebugAssert3();
      }
      -[BWUBNode _processorControllerDidFinishProcessingInputForPortType:processorType:]((uint64_t)self, v10, v11);
      int v13 = objc_msgSend((id)objc_msgSend(a4, "captureSettings"), "captureType");
      if (v6 && v13 == 12)
      {
        if (objc_msgSend((id)objc_msgSend(a4, "captureSettings"), "deliverDeferredPhotoProxyImage"))
        {
          deferredCaptureControllerInput = self->_deferredCaptureControllerInput;
          [(BWDeferredCaptureControllerInput *)deferredCaptureControllerInput encounteredProcessingError:v6];
        }
        else if (self->_deepFusionProcessorControllerConfiguration)
        {
          v36[0] = MEMORY[0x1E4F143A8];
          v36[1] = 3221225472;
          v36[2] = __61__BWUBNode_processorController_didFinishProcessingInput_err___block_invoke;
          v36[3] = &unk_1E5C24430;
          v36[4] = self;
          int v17 = v36;
          long long v18 = self;
          int v19 = 1;
          int v20 = 1;
          goto LABEL_40;
        }
      }
      return;
    case 2:
      if (!_FigIsCurrentDispatchQueue()) {
        FigDebugAssert3();
      }
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __61__BWUBNode_processorController_didFinishProcessingInput_err___block_invoke_2;
      v34[3] = &unk_1E5C28140;
      int v35 = v6;
      v34[4] = self;
      v34[5] = a4;
      v34[6] = v10;
      v34[7] = 2;
      int v17 = v34;
      long long v18 = self;
      int v19 = 2;
      int v20 = 3;
LABEL_40:
      -[BWUBNode _deepFusionDispatch:direction:block:]((uint64_t)v18, v19, v20, (uint64_t)v17);
      return;
    case 3:
      if (!_FigIsCurrentDispatchQueue()) {
        FigDebugAssert3();
      }
      processorCoordinatorWorkerQueue = self->_processorCoordinatorWorkerQueue;
      long long v16 = v33;
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __61__BWUBNode_processorController_didFinishProcessingInput_err___block_invoke_3;
      v33[3] = &unk_1E5C249A0;
      v33[4] = self;
      v33[5] = v10;
      v33[6] = 3;
      goto LABEL_30;
    case 4:
    case 7:
    case 10:
    case 12:
    case 15:
    case 16:
    case 17:
      if (!_FigIsCurrentDispatchQueue()) {
        FigDebugAssert3();
      }
      -[BWUBNode _processorControllerDidFinishProcessingInputForPortType:processorType:]((uint64_t)self, v10, v11);
      -[BWUBNode _resetProcessingStateIfDone]((uint64_t)self);
      return;
    case 5:
      if (!_FigIsCurrentDispatchQueue()) {
        FigDebugAssert3();
      }
      processorCoordinatorWorkerQueue = self->_processorCoordinatorWorkerQueue;
      long long v16 = v30;
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __61__BWUBNode_processorController_didFinishProcessingInput_err___block_invoke_5;
      v30[3] = &unk_1E5C28D30;
      int v31 = v6;
      v30[4] = self;
      v30[5] = a4;
      v30[7] = v12;
      v30[8] = 5;
      v30[6] = v10;
      goto LABEL_30;
    case 8:
      if (!_FigIsCurrentDispatchQueue()) {
        FigDebugAssert3();
      }
      processorCoordinatorWorkerQueue = self->_processorCoordinatorWorkerQueue;
      long long v16 = v32;
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __61__BWUBNode_processorController_didFinishProcessingInput_err___block_invoke_4;
      v32[3] = &unk_1E5C249A0;
      v32[4] = self;
      v32[5] = v10;
      v32[6] = 8;
      goto LABEL_30;
    case 9:
    case 13:
      if (!_FigIsCurrentDispatchQueue()) {
        FigDebugAssert3();
      }
      processorCoordinatorWorkerQueue = self->_processorCoordinatorWorkerQueue;
      long long v16 = v29;
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __61__BWUBNode_processorController_didFinishProcessingInput_err___block_invoke_7;
      v29[3] = &unk_1E5C249A0;
      v29[4] = self;
      v29[5] = v10;
      v29[6] = v11;
LABEL_30:
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __ubn_dispatch_async_block_invoke;
      block[3] = &unk_1E5C249F0;
      block[4] = v16;
      dispatch_async(processorCoordinatorWorkerQueue, block);
      return;
    case 14:
      if (!_FigIsCurrentDispatchQueue())
      {
        uint64_t v27 = v5;
        LODWORD(v26) = 0;
        FigDebugAssert3();
      }
      if (v6)
      {
        if (!self->_deferredCaptureProxyOrErrorRecoverySbuf)
        {
          [a4 description];
          -[BWUBNode _emitError:processorInput:metadata:description:]((uint64_t)self, v6, a4, 0);
          return;
        }
      }
      else if (-[BWUBNode _waitForInferenceIfNeededForProcessorInput:]((uint64_t)self, a4) {
             && self->_inferenceOutputSampleBuffer)
      }
      {
        inferenceControllerQueue = self->_inferenceControllerQueue;
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __61__BWUBNode_processorController_didFinishProcessingInput_err___block_invoke_8;
        v28[3] = &unk_1E5C248A0;
        v28[4] = self;
        v28[5] = v12;
        v28[6] = a4;
        dispatch_sync(inferenceControllerQueue, v28);
      }
      int v22 = objc_msgSend((id)CMGetAttachment(self->_deferredCaptureProxyOrErrorRecoverySbuf, @"StillImageProcessingFlags", 0), "unsignedIntValue");
      if (v6)
      {
        if ((v22 & 0x1000) != 0) {
          CMSetAttachment(self->_deferredCaptureProxyOrErrorRecoverySbuf, @"StillImageProcessingFlags", (CFTypeRef)[NSNumber numberWithUnsignedInt:v22 & 0xFFFFAFFF | 0x4000], 1u);
        }
        uint64_t v23 = @"error recovery";
      }
      else
      {
        uint64_t v23 = @"proxy";
      }
      deferredCaptureProxyOrErrorRecoverySbuf = self->_deferredCaptureProxyOrErrorRecoverySbuf;
      uint64_t v25 = [NSString stringWithFormat:@"%@ %@", BWPhotoEncoderStringFromEncodingScheme(objc_msgSend((id)objc_msgSend(v12, "captureSettings", v26, v27), "captureType")), v23];
      -[BWUBNode _emitSampleBuffer:description:]((uint64_t)self, deferredCaptureProxyOrErrorRecoverySbuf, v25);
      -[BWUBNode _processorControllerDidFinishProcessingInputForPortType:processorType:]((uint64_t)self, v10, 14);
      -[BWUBNode _resetProcessingStateIfDone]((uint64_t)self);
      return;
    default:
      return;
  }
}

uint64_t __61__BWUBNode_processorController_didFinishProcessingInput_err___block_invoke(uint64_t a1)
{
  uint64_t v1 = (void *)[*(id *)(*(void *)(a1 + 32) + 152) controllerForType:2];
  return [v1 cancelProcessing];
}

void __61__BWUBNode_processorController_didFinishProcessingInput_err___block_invoke_2(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 64))
  {
    int v2 = [*(id *)(*(void *)(a1 + 32) + 112) deferredPhotoProcessorEnabled];
    uint64_t v3 = *(unsigned int *)(a1 + 64);
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(a1 + 40);
    if (v2) {
      -[BWUBNode _emitError:processorInput:metadata:description:](v4, v3, v5, 0);
    }
    else {
      -[BWUBNode _handleDeepFusionError:processorInput:](v4, v3, v5);
    }
  }
  -[BWUBNode _processorControllerDidFinishProcessingInputForPortType:processorType:](*(void *)(a1 + 32), *(void *)(a1 + 48), *(void *)(a1 + 56));
  uint64_t v6 = *(void *)(a1 + 32);
  -[BWUBNode _resetProcessingStateIfDone](v6);
}

- (void)_handleDeepFusionError:(void *)a3 processorInput:
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (!_FigIsCurrentDispatchQueue())
    {
      uint64_t v18 = v3;
      LODWORD(v17) = 0;
      FigDebugAssert3();
    }
    unsigned int v19 = a2;
    id v7 = (id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 224), "objectForKeyedSubscript:", objc_msgSend(a3, "portType", v17, v18)), "firstObject");
    if (!v7)
    {
      id v7 = (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithSettings:portType:", objc_msgSend(a3, "stillImageSettings"), objc_msgSend(a3, "portType"));
      if (-[BWUBNode _isInferenceInputImageRequiredForSettings:](a1, (void *)[a3 stillImageSettings]))
      {
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __35__BWUBNode__ubInferenceInputRouter__block_invoke;
        v24[3] = &unk_1E5C28D80;
        v24[4] = a1;
        objc_msgSend(v7, "addOutputSampleBufferRouter:forBufferTypes:", (id)objc_msgSend(v24, "copy"), &unk_1EFB03710);
      }
      objc_msgSend(*(id *)(a1 + 224), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObject:", v7), objc_msgSend(a3, "portType"));
    }
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v8 = -[BWUBNode _bufferTypesForCaptureSettings:](a1, (void *)[a3 captureSettings]);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v26 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v21 != v11) {
            objc_enumerationMutation(v8);
          }
          int v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          uint64_t v14 = objc_msgSend((id)objc_msgSend(a3, "outputSampleBufferRouterForBufferType:", (int)objc_msgSend(v13, "intValue")), "outputSampleBufferRouter");
          uint64_t v25 = v13;
          objc_msgSend(v7, "addOutputSampleBufferRouter:forBufferTypes:", v14, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v25, 1));
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v26 count:16];
      }
      while (v10);
    }
    uint64_t v15 = v19;
    if (v19 && v7)
    {
      objc_msgSend(v7, "setRemainingProcessingCount:", objc_msgSend(v7, "remainingProcessingCount") + 1);
      uint64_t v16 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 152), "controllerForType:", *(void *)(a1 + 208)), "enqueueInputForProcessing:delegate:processErrorRecoveryFrame:processOriginalImage:processToneMapping:processInferenceInputImage:clientBracketSequenceNumber:processSemanticRendering:provideInferenceInputImageForProcessing:processSmartStyleRenderingInput:inferencesAvailable:", v7, a1, 1, 0, 0, 0, 0);
      if (!v16) {
        return;
      }
      uint64_t v15 = v16;
      -[BWUBNode _processorControllerDidFinishProcessingInputForPortType:processorType:](a1, [v7 portType], *(void *)(a1 + 208));
    }
    else if (!v19)
    {
      return;
    }
    [a3 description];
    -[BWUBNode _emitError:processorInput:metadata:description:](a1, v15, a3, 0);
  }
}

void __61__BWUBNode_processorController_didFinishProcessingInput_err___block_invoke_3(uint64_t *a1)
{
}

void __61__BWUBNode_processorController_didFinishProcessingInput_err___block_invoke_4(uint64_t *a1)
{
  -[BWUBNode _processorControllerDidFinishProcessingInputForPortType:processorType:](a1[4], a1[5], a1[6]);
  uint64_t v2 = a1[4];
  -[BWUBNode _resetProcessingStateIfDone](v2);
}

void __61__BWUBNode_processorController_didFinishProcessingInput_err___block_invoke_5(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 72);
  uint64_t v3 = *(void *)(a1 + 32);
  if (v2)
  {
    -[BWUBNode _resetProcessingState](v3);
    uint64_t v4 = *(unsigned int *)(a1 + 72);
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void **)(a1 + 40);
    -[BWUBNode _emitError:processorInput:metadata:description:](v5, v4, v6, 0);
  }
  else
  {
    -[BWUBNode _processorControllerDidFinishProcessingInputForPortType:processorType:](v3, *(void *)(a1 + 48), *(void *)(a1 + 64));
    if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 56), "captureSettings"), "captureType") == 12)
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __61__BWUBNode_processorController_didFinishProcessingInput_err___block_invoke_6;
      v7[3] = &unk_1E5C24458;
      long long v8 = *(_OWORD *)(a1 + 32);
      -[BWUBNode _deepFusionDispatch:direction:block:](v8, 2, 2, (uint64_t)v7);
    }
    -[BWUBNode _resetProcessingStateIfDone](*(void *)(a1 + 32));
  }
}

uint64_t __61__BWUBNode_processorController_didFinishProcessingInput_err___block_invoke_6(uint64_t a1)
{
  uint64_t v1 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 272), "objectForKeyedSubscript:", objc_msgSend(*(id *)(a1 + 40), "portType"));
  return [v1 allInferencesDelivered];
}

void __61__BWUBNode_processorController_didFinishProcessingInput_err___block_invoke_7(uint64_t *a1)
{
  -[BWUBNode _processorControllerDidFinishProcessingInputForPortType:processorType:](a1[4], a1[5], a1[6]);
  uint64_t v2 = a1[4];
  -[BWUBNode _resetProcessingStateIfDone](v2);
}

- (uint64_t)_waitForInferenceIfNeededForProcessorInput:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    int v4 = -[BWUBNode _isSemanticRenderingCapture:](result, (void *)[a2 stillImageSettings]);
    int v5 = -[BWUBNode _provideInferenceAttachedMediaWithSettings:](v3, (void *)[a2 stillImageSettings]);
    uint64_t v6 = *(NSObject **)(v3 + 328);
    int v7 = v4 | v5;
    if (v6) {
      BOOL v8 = v7 == 0;
    }
    else {
      BOOL v8 = 1;
    }
    if (v8)
    {
      return 0;
    }
    else
    {
      dispatch_group_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
      return 1;
    }
  }
  return result;
}

uint64_t __61__BWUBNode_processorController_didFinishProcessingInput_err___block_invoke_8(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  ubn_mergeInferenceMetadata(*(const void **)(*(void *)(a1 + 32) + 360), *(const void **)(*(void *)(a1 + 32) + 592), *(const void **)(*(void *)(a1 + 32) + 592));
  uint64_t v2 = -[BWUBNode _inferenceAttachedMediaRequiredForDemosaicedRawCaptureWithInferenceOutputSampleBuffer:stillImageSettings:](*(uint64_t **)(a1 + 32), *(const void **)(*(void *)(a1 + 32) + 360), *(void **)(a1 + 40));
  uint64_t result = [v2 count];
  if (result)
  {
    ubn_mergeInferenceAttachedMedia(*(void *)(*(void *)(a1 + 32) + 360), v2, *(const void **)(*(void *)(a1 + 32) + 592));
    long long v13 = *MEMORY[0x1E4F1DB20];
    long long v14 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
    AttachedMedia = (const void *)BWSampleBufferGetAttachedMedia(*(const void **)(*(void *)(a1 + 32) + 592), 0x1EFA745E0);
    int v5 = (const __CFString **)MEMORY[0x1E4F53070];
    if (AttachedMedia) {
      CMGetAttachment(AttachedMedia, (CFStringRef)*MEMORY[0x1E4F53070], 0);
    }
    uint64_t result = FigCFDictionaryGetCGRectIfPresent();
    if (result)
    {
      uint64_t v6 = *(const void **)(*(void *)(a1 + 32) + 592);
      objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "captureSettings", v13, v14), "settingsID");
      long long v15 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      uint64_t result = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (result)
      {
        uint64_t v7 = result;
        uint64_t v8 = *(void *)v16;
        CFStringRef v9 = *v5;
        do
        {
          uint64_t v10 = 0;
          do
          {
            if (*(void *)v16 != v8) {
              objc_enumerationMutation(v2);
            }
            uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * v10);
            uint64_t v12 = (const void *)BWSampleBufferGetAttachedMedia(v6, v11);
            if (v12)
            {
              CMGetAttachment(v12, v9, 0);
              if (FigCFDictionarySetCGRect()) {
                BWSampleBufferRemoveAttachedMedia(v6, v11);
              }
            }
            ++v10;
          }
          while (v7 != v10);
          uint64_t result = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
          uint64_t v7 = result;
        }
        while (result);
      }
    }
  }
  return result;
}

- (uint64_t)_inferenceAttachedMediaRequiredForDemosaicedRawCaptureWithInferenceOutputSampleBuffer:(void *)a3 stillImageSettings:
{
  uint64_t v3 = a1;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (objc_msgSend((id)objc_msgSend(a3, "processingSettings"), "provideDemosaicedRaw")
      && -[BWUBNode _isSemanticRenderingCapture:]((uint64_t)v3, a3)
      && (double v6 = -[BWUBNodeConfiguration inferenceMainImageDownscalingFactor](v3[14]), *(float *)&v6 != 0.0)
      && (uint64_t v7 = (void *)[(id)-[BWUBNodeConfiguration providedInferenceAttachedMediaByMode](v3[14]) objectForKeyedSubscript:&unk_1EFB00080], objc_msgSend(v7, "count")))
    {
      uint64_t v3 = (uint64_t *)[MEMORY[0x1E4F1CA48] arrayWithArray:v7];
      long long v15 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v16;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v16 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * v11);
            long long v13 = objc_msgSend((id)BWInferenceGetAttachedInference(a2, 201, 0x1EFA6A1C0), "objectForKeyedSubscript:", v12);
            if (v13 && ([v13 BOOLValue] & 1) == 0) {
              [v3 removeObject:v12];
            }
            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
        }
        while (v9);
      }
    }
    else
    {
      return 0;
    }
  }
  return v3;
}

- (void)processorController:(id)a3 willAddBuffer:(__CVBuffer *)a4 metadata:(id)a5 bufferType:(unint64_t)a6 processorInput:(id)a7
{
  if (a5
    && a3
    && a4
    && a7
    && [a3 type] == 2
    && (int)-[BWUBNodeConfiguration deepZoomVersion]((uint64_t)self->_nodeConfiguration) >= 1
    && a6 <= 0x1B
    && ((1 << a6) & 0x9C00000) != 0)
  {
    CGSize v14 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    v17.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
    v17.size = v14;
    v16.origin = v17.origin;
    v16.size = v14;
    uint64_t v15 = objc_msgSend((id)-[BWUBNodeConfiguration sensorConfigurationsByPortType]((uint64_t)self->_nodeConfiguration), "objectForKeyedSubscript:", objc_msgSend(a7, "portType"));
    if (+[BWDeepZoomProcessorControllerConfiguration doDeepZoomStandardOrLiteForType:sensorConfiguration:dimensions:metadata:stillImageSettings:intermediateZoomSrcRectOut:intermediateZoomDstRectOut:](BWDeepZoomProcessorControllerConfiguration, "doDeepZoomStandardOrLiteForType:sensorConfiguration:dimensions:metadata:stillImageSettings:intermediateZoomSrcRectOut:intermediateZoomDstRectOut:", 1, v15, psn_pixelBufferDimensions(a4), a5, [a7 stillImageSettings], &v17, &v16))
    {
      if (!CGRectIsNull(v17) && !CGRectIsNull(v16))
      {
        FigCFDictionarySetCGRect();
        FigCFDictionarySetCGRect();
      }
    }
  }
}

- (void)processorController:(id)a3 didSelectNewReferenceFrameWithPTS:(id *)a4 transform:(id)a5 processorInput:(id)a6
{
  if (objc_msgSend(a6, "isMaster", a3))
  {
    uint64_t v10 = (void *)-[BWUBNodeConfiguration referenceFrameSelectionDelegate]((uint64_t)self->_nodeConfiguration);
    uint64_t v11 = [a6 stillImageSettings];
    long long v12 = *(_OWORD *)&a4->var0;
    int64_t var3 = a4->var3;
    [v10 node:self didSelectNewReferenceFrameWithPTS:&v12 transform:a5 forSettings:v11];
  }
}

- (void)processorController:(id)a3 didSelectFusionMode:(int)a4 processorInput:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend(a5, "isMaster", a3))
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_nrfusionModeByCaptureRequestIdentifier, "setObject:forKeyedSubscript:", [NSNumber numberWithInt:v5], self->_currentCaptureRequestIdentifier);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v7 = (void *)[(NSMutableDictionary *)self->_nrProcessorInputsByPortType allValues];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          long long v12 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          objc_msgSend((id)objc_msgSend(v12, "firstObject"), "setFusionMode:", v5);
          -[BWUBNode _handleReferenceFrameEmissionForProcessorInput:]((uint64_t)self, (void *)[v12 firstObject]);
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v9);
    }
  }
}

- (id)processorController:(id)a3 newInferencesForProcessorInput:(id)a4
{
  return [(BWUBNode *)self processorController:a3 newInferencesForProcessorInput:a4 inferenceInputBufferType:15];
}

- (id)processorController:(id)a3 newInferencesForProcessorInput:(id)a4 inferenceInputBufferType:(unint64_t)a5
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3052000000;
  long long v12 = __Block_byref_object_copy__25;
  long long v13 = __Block_byref_object_dispose__25;
  uint64_t v14 = 0;
  if (a5 == 15)
  {
    inferenceControllerQueue = self->_inferenceControllerQueue;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __88__BWUBNode_processorController_newInferencesForProcessorInput_inferenceInputBufferType___block_invoke;
    v8[3] = &unk_1E5C246B8;
    v8[4] = self;
    v8[5] = &v9;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __ubn_dispatch_sync_block_invoke;
    block[3] = &unk_1E5C249F0;
    block[4] = v8;
    dispatch_sync(inferenceControllerQueue, block);
    double v6 = (void *)v10[5];
  }
  else
  {
    double v6 = 0;
  }
  _Block_object_dispose(&v9, 8);
  return v6;
}

id __88__BWUBNode_processorController_newInferencesForProcessorInput_inferenceInputBufferType___block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(a1 + 32) + 352);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)processorController:(id)a3 didSelectLowLightReferenceFrame:(opaqueCMSampleBuffer *)a4 processorInput:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (!_FigIsCurrentDispatchQueue())
  {
    uint64_t v16 = v5;
    LODWORD(v15) = 0;
    FigDebugAssert3();
  }
  uint64_t v9 = (void *)CMGetAttachment(a4, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  memset(&v17, 0, sizeof(v17));
  CMTimeMakeFromDictionary(&v17, (CFDictionaryRef)[v9 objectForKeyedSubscript:*MEMORY[0x1E4F530C0]]);
  objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E4F53E48]), "doubleValue");
  double v11 = v10;
  if (dword_1EB4C5670)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if ((objc_msgSend((id)objc_msgSend(a5, "captureSettings", v15, v16), "captureFlags") & 0x200) != 0)
  {
    long long v13 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_jasperColorStillsExecutorInputByPortType, "objectForKeyedSubscript:", [a5 portType]);
    CMTime time = v17;
    [v13 setColorBufferPTS:&time exposureTime:v11];
    uint64_t v14 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_jasperDisparityProcessorInputByPortType, "objectForKeyedSubscript:", [a5 portType]);
    CMTime time = v17;
    [v14 setColorBufferPTS:&time exposureTime:v11];
  }
  if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a5, "stillImageSettings"), "captureSettings"), "captureStreamSettingsForPortType:", objc_msgSend(a5, "portType")), "captureFlags") & 0x20000) != 0|| self->_stereoDisparityProcessorControllerConfiguration)
  {
    -[BWUBNode _handleReferenceFrameEmissionForProcessorInput:]((uint64_t)self, a5);
  }
}

- (void)processorController:(id)a3 didDetermineReferenceFrame:(opaqueCMSampleBuffer *)a4 processorInput:(id)a5 err:(int)a6
{
  memset(&v12, 0, sizeof(v12));
  CMSampleBufferGetPresentationTimeStamp(&v12, a4);
  CFDictionaryRef v9 = CMCopyDictionaryOfAttachments((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a4, 1u);
  double v10 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_deepFusionProcessorInputByPortType, "objectForKeyedSubscript:", [a5 portType]);
  [v10 setEvZeroReferenceFrameAttachments:v9];
  CMTime v11 = v12;
  [v10 setEvZeroReferenceFramePTS:&v11];
}

- (void)processorController:(id)a3 didFinishProcessingInferenceBuffer:(__CVBuffer *)a4 metadata:(id)a5 inferenceAttachedMediaKey:(id)a6 processorInput:(id)a7 err:(int)a8
{
  block[16] = *MEMORY[0x1E4F143B8];
  if (!_FigIsCurrentDispatchQueue()) {
    FigDebugAssert3();
  }
  if (dword_1EB4C5670)
  {
    int v15 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (a4) {
    CFRetain(a4);
  }
  processorCoordinatorWorkerQueue = self->_processorCoordinatorWorkerQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __121__BWUBNode_processorController_didFinishProcessingInferenceBuffer_metadata_inferenceAttachedMediaKey_processorInput_err___block_invoke;
  v13[3] = &unk_1E5C249A0;
  void v13[5] = a6;
  void v13[6] = a4;
  v13[4] = self;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __ubn_dispatch_async_block_invoke;
  block[3] = &unk_1E5C249F0;
  block[4] = v13;
  dispatch_async(processorCoordinatorWorkerQueue, block);
}

void __121__BWUBNode_processorController_didFinishProcessingInferenceBuffer_metadata_inferenceAttachedMediaKey_processorInput_err___block_invoke(void *a1)
{
  uint64_t v2 = *(void **)(a1[4] + 352);
  if (!v2)
  {
    *(void *)(a1[4] + 352) = objc_alloc_init(BWStillImageInferences);
    uint64_t v2 = *(void **)(a1[4] + 352);
  }
  [v2 addInferenceBuffer:a1[6] metadata:0 inferenceAttachedMediaKey:a1[5]];
  uint64_t v3 = (const void *)a1[6];
  if (v3)
  {
    CFRelease(v3);
  }
}

- (void)processorController:(id)a3 didFinishProcessingInference:(id)a4 inferenceAttachmentKey:(id)a5 processorInput:(id)a6 err:(int)a7
{
  block[16] = *MEMORY[0x1E4F143B8];
  if (!_FigIsCurrentDispatchQueue()) {
    FigDebugAssert3();
  }
  if (dword_1EB4C5670)
  {
    int v14 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  processorCoordinatorWorkerQueue = self->_processorCoordinatorWorkerQueue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __103__BWUBNode_processorController_didFinishProcessingInference_inferenceAttachmentKey_processorInput_err___block_invoke;
  v12[3] = &unk_1E5C248A0;
  v12[4] = self;
  void v12[5] = a4;
  v12[6] = a5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __ubn_dispatch_async_block_invoke;
  block[3] = &unk_1E5C249F0;
  block[4] = v12;
  dispatch_async(processorCoordinatorWorkerQueue, block);
}

uint64_t __103__BWUBNode_processorController_didFinishProcessingInference_inferenceAttachmentKey_processorInput_err___block_invoke(void *a1)
{
  uint64_t v2 = *(void **)(a1[4] + 352);
  if (!v2)
  {
    *(void *)(a1[4] + 352) = objc_alloc_init(BWStillImageInferences);
    uint64_t v2 = *(void **)(a1[4] + 352);
  }
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  return [v2 addInference:v3 inferenceAttachmentKey:v4];
}

- (void)processorController:(id)a3 didFinishProcessingInferenceAttachedMediaMetadata:(id)a4 processorInput:(id)a5
{
  if (!_FigIsCurrentDispatchQueue()) {
    FigDebugAssert3();
  }
  processorCoordinatorWorkerQueue = self->_processorCoordinatorWorkerQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __97__BWUBNode_processorController_didFinishProcessingInferenceAttachedMediaMetadata_processorInput___block_invoke;
  v9[3] = &unk_1E5C248A0;
  v9[4] = self;
  v9[5] = a4;
  v9[6] = a5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __ubn_dispatch_async_block_invoke;
  block[3] = &unk_1E5C249F0;
  block[4] = v9;
  dispatch_async(processorCoordinatorWorkerQueue, block);
}

void __97__BWUBNode_processorController_didFinishProcessingInferenceAttachedMediaMetadata_processorInput___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 352);
  if (!v2)
  {
    *(void *)(*(void *)(a1 + 32) + 352) = objc_alloc_init(BWStillImageInferences);
    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 352);
  }
  [v2 addInferenceAttachedMediaMetadata:*(void *)(a1 + 40)];
  if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "captureSettings"), "captureType") == 12)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __97__BWUBNode_processorController_didFinishProcessingInferenceAttachedMediaMetadata_processorInput___block_invoke_2;
    v4[3] = &unk_1E5C248A0;
    v4[4] = v3;
    int8x16_t v5 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
    -[BWUBNode _deepFusionDispatch:direction:block:](v3, 2, 1, (uint64_t)v4);
  }
}

uint64_t __97__BWUBNode_processorController_didFinishProcessingInferenceAttachedMediaMetadata_processorInput___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 272), "objectForKeyedSubscript:", objc_msgSend(*(id *)(a1 + 40), "portType"));
  uint64_t v3 = [*(id *)(a1 + 48) allKeys];
  return [v2 setProvidedInferenceAttachedMedia:v3];
}

- (void)processorController:(id)a3 didFinishProcessingBuffer:(__CVBuffer *)a4 metadata:(id)a5 type:(unint64_t)a6 captureFrameFlags:(unint64_t)a7 processorInput:(id)a8 err:(int)a9
{
  unint64_t v12 = a6;
  int v14 = a4;
  id v15 = a3;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (dword_1EB4C5670)
  {
    int v36 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    id v15 = a3;
    unint64_t v12 = a6;
    int v14 = a4;
  }
  if (a9)
  {
    FigDebugAssert3();
    return;
  }
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(a8, "settings"), "captureRequestIdentifier"), "isEqualToString:", self->_currentCaptureRequestIdentifier);
  if (objc_msgSend((id)objc_msgSend(a8, "captureSettings"), "captureType") == 12
    || (objc_msgSend((id)objc_msgSend(a8, "captureSettings"), "captureFlags") & 0x80) != 0)
  {
    uint64_t v18 = objc_msgSend(v15, "type", v26, v28);
    if (v18 == 6)
    {
LABEL_9:
      if (!_FigIsCurrentDispatchQueue())
      {
        uint64_t v29 = v9;
        LODWORD(v27) = 0;
        FigDebugAssert3();
      }
      if (objc_msgSend((id)objc_msgSend(a8, "captureSettings", v27, v29), "deliverDeferredPhotoProxyImage"))
      {
        if (v12 == 8)
        {
          uint64_t v19 = (const void *)[a8 referenceFrame];
          -[BWDeferredCaptureControllerInput addDictionary:tag:](self->_deferredCaptureControllerInput, "addDictionary:tag:", CMGetAttachment(v19, (CFStringRef)*MEMORY[0x1E4F53070], 0), [NSString stringWithFormat:@"%@-%@", BWDeferredIntermediateTagReferenceFrameMetadataByPortTypePrefix, objc_msgSend(a8, "portType")]);
        }
        if (v14)
        {
          deferredCaptureControllerInput = self->_deferredCaptureControllerInput;
          if (deferredCaptureControllerInput) {
            [(BWDeferredCaptureControllerInput *)deferredCaptureControllerInput addBuffer:v14 bufferType:v12 captureFrameFlags:0 metadata:a5 rawThumbnailsBuffer:0 rawThumbnailsMetadata:0];
          }
        }
        return;
      }
      if (objc_msgSend((id)objc_msgSend(a8, "captureSettings"), "captureType") != 12) {
        return;
      }
      uint64_t v25 = -[NSMutableDictionary objectForKeyedSubscript:](self->_deepFusionProcessorInputByPortType, "objectForKeyedSubscript:", [a8 portType]);
      if (v14) {
        CFRetain(v14);
      }
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __109__BWUBNode_processorController_didFinishProcessingBuffer_metadata_type_captureFrameFlags_processorInput_err___block_invoke;
      v34[3] = &unk_1E5C270D8;
      v34[4] = a8;
      v34[5] = v25;
      v34[6] = a5;
      v34[7] = v12;
      void v34[8] = v14;
      v34[9] = a7;
      long long v22 = v34;
      long long v23 = self;
      int v24 = 1;
LABEL_27:
      -[BWUBNode _deepFusionDispatch:direction:block:]((uint64_t)v23, 2, v24, (uint64_t)v22);
      return;
    }
    if (v18 != 5)
    {
      if (v18 != 1) {
        return;
      }
      goto LABEL_9;
    }
    if (!_FigIsCurrentDispatchQueue())
    {
      uint64_t v29 = v9;
      LODWORD(v27) = 0;
      FigDebugAssert3();
    }
    if (objc_msgSend((id)objc_msgSend(a8, "captureSettings", v27, v29), "captureType") == 12)
    {
      uint64_t v21 = -[NSMutableDictionary objectForKeyedSubscript:](self->_deepFusionProcessorInputByPortType, "objectForKeyedSubscript:", [a8 portType]);
      if (v14) {
        CFRetain(v14);
      }
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __109__BWUBNode_processorController_didFinishProcessingBuffer_metadata_type_captureFrameFlags_processorInput_err___block_invoke_2;
      v33[3] = &unk_1E5C26E48;
      v33[4] = v21;
      v33[5] = a5;
      v33[6] = v14;
      void v33[7] = v12;
      v33[8] = a7;
      long long v22 = v33;
      long long v23 = self;
      int v24 = 2;
      goto LABEL_27;
    }
  }
}

void __109__BWUBNode_processorController_didFinishProcessingBuffer_metadata_type_captureFrameFlags_processorInput_err___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  if (v2 == 8)
  {
    uint64_t v3 = (void *)[*(id *)(a1 + 32) referenceFrame];
    CFDictionaryRef v4 = CMCopyDictionaryOfAttachments((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v3, 1u);
    [*(id *)(a1 + 40) setEvZeroReferenceFrameAttachments:v4];
    CMSampleBufferGetPresentationTimeStamp(&v8, (CMSampleBufferRef)v3);
    int8x16_t v5 = *(void **)(a1 + 40);
    CMTime v7 = v8;
    [v5 setEvZeroReferenceFramePTS:&v7];

    uint64_t v2 = *(void *)(a1 + 56);
  }
  [*(id *)(a1 + 40) addBuffer:*(void *)(a1 + 64) metadata:*(void *)(a1 + 48) bufferType:v2 captureFrameFlags:*(void *)(a1 + 72)];
  double v6 = *(const void **)(a1 + 64);
  if (v6) {
    CFRelease(v6);
  }
}

void __109__BWUBNode_processorController_didFinishProcessingBuffer_metadata_type_captureFrameFlags_processorInput_err___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) addBuffer:*(void *)(a1 + 48) metadata:*(void *)(a1 + 40) bufferType:*(void *)(a1 + 56) captureFrameFlags:*(void *)(a1 + 64)];
  uint64_t v2 = *(const void **)(a1 + 48);
  if (v2)
  {
    CFRelease(v2);
  }
}

- (id)adaptiveBracketingParametersForDigitalFlashMode:(int)a3 frameStatistics:(id)a4 stationary:(BOOL)a5 sphereOffsetEnabled:(BOOL)a6 detectedObjects:(id)a7
{
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3052000000;
  CMTime v17 = __Block_byref_object_copy__25;
  uint64_t v18 = __Block_byref_object_dispose__25;
  uint64_t v19 = 0;
  processorCoordinatorWorkerQueue = self->_processorCoordinatorWorkerQueue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __123__BWUBNode_adaptiveBracketingParametersForDigitalFlashMode_frameStatistics_stationary_sphereOffsetEnabled_detectedObjects___block_invoke;
  v10[3] = &unk_1E5C28D58;
  int v11 = a3;
  v10[4] = self;
  void v10[5] = a4;
  BOOL v12 = a5;
  BOOL v13 = a6;
  v10[6] = a7;
  v10[7] = &v14;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __ubn_dispatch_sync_block_invoke;
  block[3] = &unk_1E5C249F0;
  block[4] = v10;
  dispatch_sync(processorCoordinatorWorkerQueue, block);
  id v8 = (id)v15[5];
  _Block_object_dispose(&v14, 8);
  return v8;
}

id __123__BWUBNode_adaptiveBracketingParametersForDigitalFlashMode_frameStatistics_stationary_sphereOffsetEnabled_detectedObjects___block_invoke(uint64_t a1)
{
  -[BWUBNode _setupProcessorCoordinator](*(void *)(a1 + 32));
  id result = (id)objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 152), "controllerForType:", *(void *)(*(void *)(a1 + 32) + 208)), "adaptiveBracketingParametersForDigitalFlashMode:frameStatistics:stationary:sphereOffsetEnabled:detectedObjects:", *(unsigned int *)(a1 + 64), *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 68), *(unsigned __int8 *)(a1 + 69), *(void *)(a1 + 48));
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = result;
  return result;
}

- (void)stopAdaptiveBracketingForSettings:(id)a3 withGroup:(int)a4
{
  processorCoordinatorWorkerQueue = self->_processorCoordinatorWorkerQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__BWUBNode_stopAdaptiveBracketingForSettings_withGroup___block_invoke;
  v5[3] = &unk_1E5C262A0;
  v5[4] = self;
  int v6 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __ubn_dispatch_async_block_invoke;
  block[3] = &unk_1E5C249F0;
  block[4] = v5;
  dispatch_async(processorCoordinatorWorkerQueue, block);
}

uint64_t __56__BWUBNode_stopAdaptiveBracketingForSettings_withGroup___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 224), "allValues", 0);
  uint64_t result = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "firstObject"), "stopAdaptiveBracketingWithGroup:", *(unsigned int *)(a1 + 40));
      }
      while (v4 != v6);
      uint64_t result = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      uint64_t v4 = result;
    }
    while (result);
  }
  return result;
}

- (id)adaptiveBracketingDigitalFlashTotalIntegrationTimesProviderForPortType:(id)a3 wait:(BOOL)a4
{
  BOOL v4 = a4;
  p_processorCoordinatorLocuint64_t k = &self->_processorCoordinatorLock;
  os_unfair_lock_lock(&self->_processorCoordinatorLock);
  processorCoordinator = self->_processorCoordinator;
  os_unfair_lock_unlock(p_processorCoordinatorLock);
  if (processorCoordinator) {
    BOOL v9 = 0;
  }
  else {
    BOOL v9 = !v4;
  }
  if (v9) {
    return 0;
  }
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3052000000;
  CMTime v17 = __Block_byref_object_copy__25;
  uint64_t v18 = __Block_byref_object_dispose__25;
  uint64_t v19 = 0;
  processorCoordinatorWorkerQueue = self->_processorCoordinatorWorkerQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __88__BWUBNode_adaptiveBracketingDigitalFlashTotalIntegrationTimesProviderForPortType_wait___block_invoke;
  v13[3] = &unk_1E5C25210;
  void v13[5] = a3;
  void v13[6] = &v14;
  v13[4] = self;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __ubn_dispatch_sync_block_invoke;
  block[3] = &unk_1E5C249F0;
  block[4] = v13;
  dispatch_sync(processorCoordinatorWorkerQueue, block);
  id v11 = (id)v15[5];
  _Block_object_dispose(&v14, 8);
  return v11;
}

id __88__BWUBNode_adaptiveBracketingDigitalFlashTotalIntegrationTimesProviderForPortType_wait___block_invoke(uint64_t *a1)
{
  -[BWUBNode _setupProcessorCoordinator](a1[4]);
  id result = (id)objc_msgSend((id)objc_msgSend(*(id *)(a1[4] + 152), "controllerForType:", *(void *)(a1[4] + 208)), "adaptiveBracketingDigitalFlashTotalIntegrationTimesProviderForPortType:", a1[5]);
  *(void *)(*(void *)(a1[6] + 8) + 40) = result;
  return result;
}

- (uint64_t)_inferenceOutputPixelBufferPoolForAttachedMediaKey:(uint64_t)result
{
  if (result)
  {
    uint64_t v2 = result;
    uint64_t v3 = a2 == @"DeepZoomOutput" ? @"PrimaryFormat" : a2;
    BOOL v4 = (void *)[*(id *)(result + 16) mediaPropertiesForAttachedMediaKey:v3];
    id result = [v4 livePixelBufferPool];
    if (!result)
    {
      id result = [v4 preparedPixelBufferPool];
      if (!result)
      {
        uint64_t v5 = *(void **)(v2 + 344);
        return [v5 objectForKeyedSubscript:v3];
      }
    }
  }
  return result;
}

- (id)preparedOutputPixelBufferPoolForAttachedMediaKey:(id)a3 format:(id)a4
{
  return (id)-[BWUBNode _inferenceOutputPixelBufferPoolForAttachedMediaKey:]((uint64_t)self, (__CFString *)a3);
}

- (void)_dispatch:(int)a3 direction:(dispatch_queue_t)queue processingQueue:(uint64_t)a5 block:
{
  if (!a1) {
    return;
  }
  BOOL v9 = *(NSObject **)(a1 + 160);
  if ((a3 - 1) >= 2)
  {
    if (a3 != 3) {
      return;
    }
    if (!_FigIsCurrentDispatchQueue()) {
      FigDebugAssert3();
    }
    if (v9 == queue) {
      goto LABEL_18;
    }
    if (a2 != 2)
    {
      if (a2 != 1) {
        return;
      }
      long long v10 = *(NSObject **)(a1 + 160);
      uint64_t block = MEMORY[0x1E4F143A8];
      uint64_t v14 = 3221225472;
      id v15 = __ubn_dispatch_sync_block_invoke;
      uint64_t v16 = &unk_1E5C249F0;
      uint64_t v17 = a5;
LABEL_17:
      dispatch_sync(v10, &block);
      return;
    }
    uint64_t v12 = *(NSObject **)(a1 + 160);
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    id v15 = __ubn_dispatch_async_block_invoke;
    uint64_t v16 = &unk_1E5C249F0;
    uint64_t v17 = a5;
LABEL_23:
    dispatch_async(v12, &block);
    return;
  }
  if (v9 != queue || a3 != 1)
  {
    if (a2 != 2)
    {
      if (a2 != 1) {
        return;
      }
      uint64_t block = MEMORY[0x1E4F143A8];
      uint64_t v14 = 3221225472;
      id v15 = __ubn_dispatch_sync_block_invoke;
      uint64_t v16 = &unk_1E5C249F0;
      uint64_t v17 = a5;
      long long v10 = queue;
      goto LABEL_17;
    }
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    id v15 = __ubn_dispatch_async_block_invoke;
    uint64_t v16 = &unk_1E5C249F0;
    uint64_t v17 = a5;
    uint64_t v12 = queue;
    goto LABEL_23;
  }
  if (!_FigIsCurrentDispatchQueue()) {
    FigDebugAssert3();
  }
LABEL_18:
  id v11 = *(void (**)(uint64_t))(a5 + 16);
  v11(a5);
}

- (uint64_t)_nrProcessorInputNeededForSettings:(uint64_t)a3 portType:
{
  if (!a1
    || !objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureStreamSettingsForPortType:", a3), "hasValidFrames"))
  {
    return 0;
  }
  uint64_t v5 = *(void **)(a1 + 120);
  return [v5 containsObject:a3];
}

- (void)_handleClientBracketFrameEmissionForSampleBuffer:(void *)a3 stillImageSettings:(uint64_t)a4 portType:
{
  if (a1
    && ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "captureSettings"), "captureStreamSettingsForPortType:", a4), "captureFlags") & 0x20000) != 0|| *(void *)(a1 + 480)))
  {
    long long v8 = (void *)CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E4F53070], 0);
    uint64_t v9 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F53D38]];
    if (!objc_msgSend((id)objc_msgSend(*(id *)(a1 + 512), "objectForKeyedSubscript:", a4), "objectForKeyedSubscript:", v9))
    {
      objc_msgSend((id)objc_msgSend(*(id *)(a1 + 512), "objectForKeyedSubscript:", a4), "setObject:forKeyedSubscript:", objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E4F542D8]), v9);
      if (-[BWUBNode _generateDisparityForSettings:](a1, a3))
      {
        uint64_t v10 = [*(id *)(a1 + 520) objectForKeyedSubscript:v9];
        CMSampleBufferRef sampleBufferOut = 0;
        if (!BWCMSampleBufferCreateCopyIncludingMetadata((CMSampleBufferRef)a2, &sampleBufferOut))
        {
          id v11 = *(NSObject **)(a1 + 504);
          v13[0] = MEMORY[0x1E4F143A8];
          v13[1] = 3221225472;
          v13[2] = __89__BWUBNode__handleClientBracketFrameEmissionForSampleBuffer_stillImageSettings_portType___block_invoke;
          v13[3] = &unk_1E5C24F10;
          v13[4] = v10;
          void v13[5] = sampleBufferOut;
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __ubn_dispatch_async_block_invoke;
          block[3] = &unk_1E5C249F0;
          block[4] = v13;
          dispatch_async(v11, block);
        }
      }
      else
      {
        uint64_t v12 = [NSString stringWithFormat:@"reference"];
        -[BWUBNode _emitSampleBuffer:description:](a1, a2, v12);
      }
    }
  }
}

- (BOOL)_generateDisparityForSettings:(BOOL)result
{
  if (result) {
    return *(void *)(result + 480)
  }
        && (objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureFlags") & 0x800) != 0
        && (objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureFlags") & 0x200) == 0;
  return result;
}

void __89__BWUBNode__handleClientBracketFrameEmissionForSampleBuffer_stillImageSettings_portType___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) addSampleBuffer:*(void *)(a1 + 40)];
  uint64_t v2 = *(const void **)(a1 + 40);
  if (v2)
  {
    CFRelease(v2);
  }
}

- (void)_handleReferenceFrameEmissionForSampleBuffer:(void *)a3 stillImageSettings:(uint64_t)a4 portType:
{
  if (a1)
  {
    CFTypeRef cf = 0;
    uint64_t v8 = [*(id *)(a1 + 232) objectForKeyedSubscript:a4];
    if (a2)
    {
      if (!v8)
      {
        objc_msgSend(*(id *)(a1 + 232), "setObject:forKeyedSubscript:", objc_msgSend((id)CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E4F53070], 0), "objectForKeyedSubscript:", *MEMORY[0x1E4F542D8]), a4);
        if (!BWCMSampleBufferCreateCopyIncludingMetadata((CMSampleBufferRef)a2, (CMSampleBufferRef *)&cf))
        {
          if (-[BWUBNode _generateDisparityForSettings:](a1, a3))
          {
            if (cf)
            {
              CFRetain(cf);
              CFTypeRef v9 = cf;
            }
            else
            {
              CFTypeRef v9 = 0;
            }
            uint64_t v10 = *(NSObject **)(a1 + 504);
            v11[0] = MEMORY[0x1E4F143A8];
            v11[1] = 3221225472;
            v11[2] = __85__BWUBNode__handleReferenceFrameEmissionForSampleBuffer_stillImageSettings_portType___block_invoke;
            v11[3] = &unk_1E5C24F10;
            v11[4] = a1;
            void v11[5] = v9;
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __ubn_dispatch_async_block_invoke;
            block[3] = &unk_1E5C249F0;
            block[4] = v11;
            dispatch_async(v10, block);
          }
          else
          {
            -[BWUBNode _emitSampleBuffer:description:](a1, cf, [NSString stringWithFormat:@"reference frame for '%@'", a4]);
          }
        }
      }
    }
    if (cf) {
      CFRelease(cf);
    }
  }
}

void __85__BWUBNode__handleReferenceFrameEmissionForSampleBuffer_stillImageSettings_portType___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 488) addSampleBuffer:*(void *)(a1 + 40)];
  uint64_t v2 = *(const void **)(a1 + 40);
  if (v2)
  {
    CFRelease(v2);
  }
}

- (void)_handleReferenceFrameEmissionForSettings:(uint64_t)a3 portType:(void *)a4 referenceFrame:(const void *)a5 evMinusReferenceFrame:(void *)a6 errorRecoveryFrame:
{
  if (!a1
    || (objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureStreamSettingsForPortType:", a3), "captureFlags") & 0x20000) == 0&& !*(void *)(a1 + 480))
  {
    return;
  }
  uint64_t v12 = (void *)[a2 captureSettings];
  if (a6)
  {
    if ([v12 deliverOriginalImage]) {
      a4 = 0;
    }
    else {
      a4 = a6;
    }
  }
  else if (([v12 captureFlags] & 0x101000) != 0)
  {
    int v13 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 240), "objectForKeyedSubscript:", *(void *)(a1 + 144)), "intValue");
    if (v13 == 2)
    {
      if (!a4) {
        goto LABEL_8;
      }
      CFStringRef v14 = (const __CFString *)*MEMORY[0x1E4F53070];
      id v15 = (void *)CMGetAttachment(a4, (CFStringRef)*MEMORY[0x1E4F53070], 0);
      if (a5)
      {
        uint64_t v16 = v15;
        objc_msgSend((id)CMGetAttachment(a5, v14, 0), "setObject:forKeyedSubscript:", objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E4F542D8]), *MEMORY[0x1E4F542D8]);
        AttachedMedia = (const void *)BWSampleBufferGetAttachedMedia(a5, 0x1EFA74380);
        if (AttachedMedia) {
          objc_msgSend((id)CMGetAttachment(AttachedMedia, v14, 0), "setObject:forKeyedSubscript:", v16, @"EVZeroMetadata");
        }
        a4 = (void *)a5;
        goto LABEL_8;
      }
    }
    else if (v13 == 1)
    {
      goto LABEL_8;
    }
    a4 = 0;
  }
LABEL_8:
  -[BWUBNode _handleReferenceFrameEmissionForSampleBuffer:stillImageSettings:portType:](a1, a4, a2, a3);
}

- (uint64_t)_isInferenceInputImageRequiredForSettings:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    char v4 = -[BWUBNode _inferencesRequiredByProcessorControllersForSettings:](result, a2);
    id result = -[BWUBNode _provideInferenceAttachedMediaWithSettings:](v3, a2);
    if ((v4 & 1) != 0 || result) {
      return !*(void *)(v3 + 400)
    }
          || (objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureFlags") & 0x10000) == 0;
  }
  return result;
}

- (id)_ubInferenceInputRouter
{
  if (result)
  {
    v1[0] = MEMORY[0x1E4F143A8];
    v1[1] = 3221225472;
    v1[2] = __35__BWUBNode__ubInferenceInputRouter__block_invoke;
    v1[3] = &unk_1E5C28D80;
    v1[4] = result;
    return (id)[v1 copy];
  }
  return result;
}

- (id)_bufferTypesForCaptureSettings:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  uint64_t v3 = 0;
  switch([a2 captureType])
  {
    case 0u:
    case 3u:
    case 4u:
    case 5u:
    case 8u:
      uint64_t v3 = (void *)MEMORY[0x1E4F1CBF0];
      break;
    case 1u:
      uint64_t v3 = &unk_1EFB03800;
      break;
    case 2u:
    case 6u:
    case 7u:
      uint64_t v3 = &unk_1EFB03818;
      break;
    case 0xAu:
      uint64_t v3 = &unk_1EFB03830;
      break;
    case 0xBu:
      uint64_t v3 = &unk_1EFB03848;
      break;
    case 0xCu:
      if ([a2 deliverDeferredPhotoProxyImage]) {
        uint64_t v3 = &unk_1EFB03860;
      }
      else {
        uint64_t v3 = &unk_1EFB03878;
      }
      break;
    default:
      break;
  }
  if (![a2 deliverOriginalImage]) {
    return v3;
  }
  char v4 = (void *)[MEMORY[0x1E4F1CA48] arrayWithArray:v3];
  [v4 addObject:&unk_1EFB001D0];
  uint64_t v5 = (void *)[v4 copy];
  return v5;
}

- (id)_standardNROutputRouterWithExpectedQueue:(id)result
{
  if (result)
  {
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __53__BWUBNode__standardNROutputRouterWithExpectedQueue___block_invoke;
    v2[3] = &unk_1E5C28E48;
    v2[4] = a2;
    v2[5] = result;
    return (id)[v2 copy];
  }
  return result;
}

- (uint64_t)_inferencesRequiredByProcessorControllersForSettings:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    int v4 = -[BWUBNode _isSemanticRenderingCapture:](result, a2);
    if (*(void *)(v3 + 400)) {
      unint64_t v5 = ((unint64_t)objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureFlags") >> 16) & 1;
    }
    else {
      LODWORD(v5) = 0;
    }
    return v4 | v5 | -[BWUBNode _isSemanticStylesCaptureNeedingInferencesWithSettings:](v3, a2);
  }
  return result;
}

- (uint64_t)_setupProcessingStateForJasperDisparityIfNeededWithSettings:(void *)a3 processingPlan:
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (!_FigIsCurrentDispatchQueue())
    {
      uint64_t v28 = v3;
      LODWORD(v27) = 0;
      FigDebugAssert3();
    }
    if ((objc_msgSend((id)objc_msgSend(a2, "captureSettings", v27, v28), "captureFlags") & 0x200) != 0)
    {
      uint64_t v7 = [*(id *)(a1 + 152) controllerForType:13];
      if (v7)
      {
        uint64_t v8 = (void *)v7;
        id v37 = -[BWUBNode _bufferTypesForCaptureSettings:](a1, (void *)[a2 captureSettings]);
        v50[0] = MEMORY[0x1E4F143A8];
        v50[1] = 3221225472;
        v50[2] = __87__BWUBNode__setupProcessingStateForJasperDisparityIfNeededWithSettings_processingPlan___block_invoke;
        v50[3] = &unk_1E5C28E48;
        uint64_t v29 = v8;
        uint64_t v30 = a1;
        v50[4] = a1;
        v50[5] = v8;
        id v35 = (id)[MEMORY[0x1E4F1CA48] array];
        long long v46 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        obuint64_t j = (id)objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "portTypes");
        uint64_t v34 = [obj countByEnumeratingWithState:&v46 objects:v54 count:16];
        if (v34)
        {
          uint64_t v32 = *(void *)v47;
          unint64_t v33 = a2;
          do
          {
            uint64_t v9 = 0;
            do
            {
              if (*(void *)v47 != v32) {
                objc_enumerationMutation(obj);
              }
              uint64_t v36 = v9;
              uint64_t v10 = *(void **)(*((void *)&v46 + 1) + 8 * v9);
              id v11 = [[BWJasperDisparityProcessorInput alloc] initWithSettings:a2 portType:v10];
              long long v42 = 0u;
              long long v43 = 0u;
              long long v44 = 0u;
              long long v45 = 0u;
              uint64_t v12 = [v37 countByEnumeratingWithState:&v42 objects:v53 count:16];
              if (v12)
              {
                uint64_t v13 = v12;
                uint64_t v14 = *(void *)v43;
                do
                {
                  for (uint64_t i = 0; i != v13; ++i)
                  {
                    if (*(void *)v43 != v14) {
                      objc_enumerationMutation(v37);
                    }
                    uint64_t v16 = *(void **)(*((void *)&v42 + 1) + 8 * i);
                    uint64_t v17 = (int)[v16 intValue];
                    id v52 = v16;
                    uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v52 count:1];
                    uint64_t v19 = (void *)[a3 lastAddedInputForSequenceNumber:0 portType:v10 bufferType:v17];
                    if (v19)
                    {
                      uint64_t v20 = v19;
                      -[BWStillImageProcessorControllerInput addOutputSampleBufferRouter:forBufferTypes:](v11, "addOutputSampleBufferRouter:forBufferTypes:", objc_msgSend((id)objc_msgSend(v19, "outputSampleBufferRouterForBufferType:", v17), "outputSampleBufferRouter"), v18);
                      [a3 addInput:v11 sequenceNumber:0 portType:v10 bufferType:v17];
                      [v20 addOutputSampleBufferRouter:v50 forBufferTypes:v18];
                    }
                  }
                  uint64_t v13 = [v37 countByEnumeratingWithState:&v42 objects:v53 count:16];
                }
                while (v13);
              }
              a2 = v33;
              if (objc_msgSend(v10, "isEqualToString:", objc_msgSend((id)objc_msgSend(v33, "captureSettings"), "masterPortType")))objc_msgSend(v35, "insertObject:atIndex:", v11, 0); {
              else
              }
                [v35 addObject:v11];
              uint64_t v9 = v36 + 1;
            }
            while (v36 + 1 != v34);
            uint64_t v34 = [obj countByEnumeratingWithState:&v46 objects:v54 count:16];
          }
          while (v34);
        }
        long long v40 = 0u;
        long long v41 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        uint64_t v21 = [v35 countByEnumeratingWithState:&v38 objects:v51 count:16];
        if (v21)
        {
          uint64_t v22 = v21;
          uint64_t v23 = *(void *)v39;
          do
          {
            for (uint64_t j = 0; j != v22; ++j)
            {
              if (*(void *)v39 != v23) {
                objc_enumerationMutation(v35);
              }
              uint64_t v25 = *(void **)(*((void *)&v38 + 1) + 8 * j);
              [v29 enqueueInputForProcessing:v25 delegate:v30];
              objc_msgSend(*(id *)(v30 + 568), "setObject:forKeyedSubscript:", v25, objc_msgSend(v25, "portType"));
            }
            uint64_t v22 = [v35 countByEnumeratingWithState:&v38 objects:v51 count:16];
          }
          while (v22);
        }
      }
    }
  }
  return 0;
}

- (uint64_t)_setupProcessingStateForIntelligentDistortionCorrectionIfNeededWithSettings:(uint64_t)a3 sequenceNumber:(uint64_t)a4 portType:(uint64_t)a5 queueProvidingInput:(void *)a6 processingPlan:
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  id v11 = a1;
  if (!_FigIsCurrentDispatchQueue())
  {
    uint64_t v38 = v6;
    LODWORD(v37) = 0;
    FigDebugAssert3();
  }
  if (!v11[52])
  {
    uint64_t v34 = 0;
    LODWORD(v15) = 0;
    goto LABEL_44;
  }
  uint64_t v12 = [v11[19] controllerForType:7];
  if (objc_msgSend((id)objc_msgSend(a2, "processingSettings"), "processIntelligentDistortionCorrection")) {
    uint64_t v13 = objc_msgSend(v11, "idcSupportedForCaptureType:captureFlags:portType:", objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureType"), 0, a4);
  }
  else {
    uint64_t v13 = 0;
  }
  uint64_t v14 = objc_msgSend((id)objc_msgSend(v11[52], "portTypesWithGeometricDistortionCorrectionEnabled", v37, v38), "containsObject:", a4);
  uint64_t v15 = v14;
  unsigned int v42 = v14;
  if ((v13 & 1) == 0 && !v14)
  {
    uint64_t v34 = 0;
    goto LABEL_40;
  }
  long long v41 = (void *)v12;
  uint64_t v16 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithArray:", -[BWUBNode _bufferTypesExcludingErrorRecoveryTypesForCaptureSettings:](v11, objc_msgSend(a2, "captureSettings")));
  id v17 = -[BWUBNode _errorRecoveryBufferTypesForBufferTypes:](v11, v16);
  if (v15) {
    [v16 addObjectsFromArray:v17];
  }
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __147__BWUBNode__setupProcessingStateForIntelligentDistortionCorrectionIfNeededWithSettings_sequenceNumber_portType_queueProvidingInput_processingPlan___block_invoke;
  v52[3] = &unk_1E5C28E20;
  v52[4] = v11;
  v52[5] = a4;
  v52[6] = v17;
  if (objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureType") == 7
    && [v11[53] objectForKeyedSubscript:a4])
  {
    uint64_t v18 = (BWIntelligentDistortionCorrectionProcessorInput *)[v11[53] objectForKeyedSubscript:a4];
    int v19 = objc_msgSend((id)objc_msgSend(v11[54], "objectForKeyedSubscript:", a4), "intValue");
    objc_msgSend(v11[54], "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", (v19 + 1)), a4);
  }
  else
  {
    obuint64_t j = v17;
    long long v39 = v11;
    uint64_t v18 = [[BWIntelligentDistortionCorrectionProcessorInput alloc] initWithSettings:a2 portType:a4];
    unsigned int v40 = v13;
    [(BWIntelligentDistortionCorrectionProcessorInput *)v18 setProcessIntelligentDistortionCorrection:v13];
    [(BWIntelligentDistortionCorrectionProcessorInput *)v18 setProcessGeometricDistortionCorrection:v15];
    [(BWIntelligentDistortionCorrectionProcessorInput *)v18 setApplyZoom:1];
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    uint64_t v20 = [v16 countByEnumeratingWithState:&v48 objects:v55 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v49;
      while (2)
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v49 != v22) {
            objc_enumerationMutation(v16);
          }
          uint64_t v24 = (int)[*(id *)(*((void *)&v48 + 1) + 8 * i) intValue];
          uint64_t v25 = (void *)[a6 lastAddedInputForSequenceNumber:a3 portType:a4 bufferType:v24];
          if (v25)
          {
            if (!ubn_insertOutputRouterForInputAfterPreviousInputForBufferType((uint64_t)v52, v18, v25, v24))
            {
              uint64_t v34 = 4294954516;
              LODWORD(v15) = v42;
              LOBYTE(v13) = v40;
              goto LABEL_40;
            }
            [a6 addInput:v18 sequenceNumber:a3 portType:a4 bufferType:v24];
          }
        }
        uint64_t v21 = [v16 countByEnumeratingWithState:&v48 objects:v55 count:16];
        if (v21) {
          continue;
        }
        break;
      }
    }
    if ((v42 & 1) == 0)
    {
      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      uint64_t v26 = [obj countByEnumeratingWithState:&v44 objects:v54 count:16];
      if (v26)
      {
        uint64_t v27 = v26;
        uint64_t v28 = *(void *)v45;
        do
        {
          for (uint64_t j = 0; j != v27; ++j)
          {
            if (*(void *)v45 != v28) {
              objc_enumerationMutation(obj);
            }
            uint64_t v30 = *(void **)(*((void *)&v44 + 1) + 8 * j);
            int v31 = objc_msgSend(a6, "lastAddedInputForSequenceNumber:portType:bufferType:", a3, a4, (int)objc_msgSend(v30, "intValue"));
            uint64_t v53 = v30;
            objc_msgSend(v31, "addBypassedProcessorType:forBufferTypes:", 7, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v53, 1));
          }
          uint64_t v27 = [obj countByEnumeratingWithState:&v44 objects:v54 count:16];
        }
        while (v27);
      }
    }
    id v11 = v39;
    [v39[53] setObject:v18 forKeyedSubscript:a4];
    [v39[54] setObject:&unk_1EFB000E0 forKeyedSubscript:a4];

    uint64_t v15 = v42;
    uint64_t v13 = v40;
  }
  uint64_t v32 = [v41 enqueueInputForProcessing:v18 delegate:v11];
  if (v32)
  {
    uint64_t v34 = v32;
LABEL_40:
    if (v13) {
      goto LABEL_41;
    }
LABEL_44:
    if (((v34 == 0) & ~v15) == 0 && dword_1EB4C5670) {
      goto LABEL_46;
    }
    return v34;
  }
  id v33 = v11[73];
  if (!v33)
  {
    uint64_t v34 = 0;
    goto LABEL_40;
  }
  objc_msgSend((id)objc_msgSend(v33, "pipelineParameters"), "setIntelligentDistortionCorrectionEnabled:", v13);
  objc_msgSend((id)objc_msgSend(v11[73], "pipelineParameters"), "setGeometricDistortionCorrectionEnabled:", v15);
  objc_msgSend((id)objc_msgSend(v11[73], "pipelineParameters"), "setDistortionCorrectionVersion:", objc_msgSend(v11[52], "intelligentDistortionCorrectionVersion"));
  uint64_t v34 = 0;
  if ((v13 & 1) == 0) {
    goto LABEL_44;
  }
LABEL_41:
  if (dword_1EB4C5670)
  {
LABEL_46:
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v34;
}

- (uint64_t)_isSemanticRenderingCapture:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    int v4 = objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureType");
    unint64_t v5 = objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureFlags");
    if ((int)-[BWUBNodeConfiguration semanticRenderingVersion](*(void *)(v3 + 112)) < 1)
    {
      return 0;
    }
    else
    {
      uint64_t v6 = (v5 >> 7) & 1;
      if (v4 == 11) {
        LODWORD(v6) = 1;
      }
      if (v4 == 12) {
        LODWORD(v6) = 1;
      }
      if (v4 == 10) {
        return 1;
      }
      else {
        return v6;
      }
    }
  }
  return result;
}

- (uint64_t)_isSemanticStylesCaptureNeedingInferencesWithSettings:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    [a2 requestedSettings];
    objc_opt_class();
    BOOL v4 = (objc_opt_isKindOfClass() & 1) == 0
      || objc_msgSend((id)objc_msgSend(a2, "requestedSettings"), "semanticStyle") == 0;
    char v5 = -[BWUBNode _isSemanticRenderingCapture:](v3, a2);
    int v6 = objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureType");
    unsigned int v7 = -[BWUBNode _provideInferenceAttachedMediaWithSettings:](v3, a2);
    int v8 = !-[BWUBNodeConfiguration semanticStyleRenderingEnabled](*(void *)(v3 + 112)) || v4;
    id result = v8 ^ 1u;
    if ((v8 & 1) == 0 && (v5 & 1) == 0)
    {
      if (v6 == 2) {
        return 1;
      }
      else {
        return v7;
      }
    }
  }
  return result;
}

- (uint64_t)_provideInferenceAttachedMediaWithSettings:(uint64_t)result
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v3 = result;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    BOOL v4 = (void *)-[BWUBNodeConfiguration providedInferenceAttachedMediaByMode](*(void *)(result + 112));
    id result = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (result)
    {
      uint64_t v5 = result;
      uint64_t v6 = *(void *)v9;
      while (2)
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v4);
          }
          if (-[BWUBNode _provideInferencesForAttachedMediaMode:settings:](v3, objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7), "intValue", (void)v8), a2))return 1; {
          ++v7;
          }
        }
        while (v5 != v7);
        id result = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
        uint64_t v5 = result;
        if (result) {
          continue;
        }
        break;
      }
    }
  }
  return result;
}

- (uint64_t)_isDemosaicedRawCaptureNeedingInferencesWithSettigs:(uint64_t)a1
{
  if (!a1
    || !objc_msgSend((id)objc_msgSend(a2, "processingSettings"), "provideDemosaicedRaw")
    || ![(id)-[BWUBNodeConfiguration providedInferenceAttachedMediaByMode](*(void *)(a1 + 112)) objectForKeyedSubscript:&unk_1EFB00080])
  {
    return 0;
  }
  return -[BWUBNode _isSemanticRenderingCapture:](a1, a2);
}

- (uint64_t)_isDepthCaptureNeedingPersonSegmentationMasksWithSettings:(uint64_t)a1
{
  if (!a1
    || ![(id)-[BWUBNodeConfiguration providedInferenceAttachedMediaByMode](*(void *)(a1 + 112)) objectForKeyedSubscript:&unk_1EFB00098]|| (objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureFlags") & 0x800) == 0)
  {
    return 0;
  }
  BOOL v4 = (void *)[a2 requestedSettings];
  return [v4 depthDataFiltered];
}

- (uint64_t)_inferencesRequiredForSettings:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    int v4 = -[BWUBNode _inferencesRequiredByProcessorControllersForSettings:](result, a2);
    return v4 | -[BWUBNode _provideInferenceAttachedMediaWithSettings:](v3, a2);
  }
  return result;
}

- (uint64_t)_scaleInferenceInputForRedEyeReductionFromPixelBuffer:(CVPixelBufferRef)destinationBuffer outputPixelBuffer:
{
  if (result)
  {
    uint64_t v4 = result;
    id result = 4294954516;
    if (sourceBuffer)
    {
      if (destinationBuffer)
      {
        uint64_t v6 = *(OpaqueVTPixelTransferSession **)(v4 + 376);
        if (!v6)
        {
          id result = VTPixelTransferSessionCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (VTPixelTransferSessionRef *)(v4 + 376));
          if (result) {
            return result;
          }
          id result = VTSessionSetProperty(*(VTSessionRef *)(v4 + 376), (CFStringRef)*MEMORY[0x1E4F45168], (CFTypeRef)*MEMORY[0x1E4F45460]);
          if (result) {
            return result;
          }
          uint64_t v6 = *(OpaqueVTPixelTransferSession **)(v4 + 376);
        }
        return VTPixelTransferSessionTransferImage(v6, sourceBuffer, destinationBuffer);
      }
    }
  }
  return result;
}

- (uint64_t)_setupProcessingStateForInferenceWithSettings:(uint64_t)a3 portType:
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v59 = 0;
  long long v60 = &v59;
  uint64_t v61 = 0x2020000000;
  int v62 = 0;
  uint64_t v37 = [*(id *)(a1 + 152) controllerForType:3];
  if (v37)
  {
    int v5 = -[BWUBNode _isSemanticRenderingCapture:](a1, a2);
    if (*(void *)(a1 + 400)) {
      unint64_t v34 = ((unint64_t)objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureFlags") >> 16) & 1;
    }
    else {
      LODWORD(v34) = 0;
    }
    int v6 = -[BWUBNode _isSemanticStylesCaptureNeedingInferencesWithSettings:](a1, a2);
    int v7 = -[BWUBNode _provideInferenceAttachedMediaWithSettings:](a1, a2);
    int v35 = -[BWUBNode _inferencesRequiredByProcessorControllersForSettings:](a1, a2);
    long long v8 = *(NSObject **)(a1 + 320);
    v58[0] = MEMORY[0x1E4F143A8];
    v58[1] = 3221225472;
    v58[2] = __67__BWUBNode__setupProcessingStateForInferenceWithSettings_portType___block_invoke;
    v58[3] = &unk_1E5C24430;
    v58[4] = v37;
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v64 = 3221225472;
    unsigned int v65 = __ubn_dispatch_sync_block_invoke;
    int v66 = &unk_1E5C249F0;
    int v67 = v58;
    dispatch_sync(v8, &block);
    long long v9 = (void *)[*(id *)(a1 + 312) objectForKeyedSubscript:a3];
    if ([v9 inferenceImage])
    {
      id v10 = BWSampleBufferCopyDictionaryOfAttachedMedia((const void *)[v9 inferenceImage]);
      int v39 = v7;
      int v11 = v6;
      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      uint64_t v12 = [v10 countByEnumeratingWithState:&v54 objects:v70 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v55;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v55 != v13) {
              objc_enumerationMutation(v10);
            }
            CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer((CMSampleBufferRef)[v10 objectForKeyedSubscript:*(void *)(*((void *)&v54 + 1) + 8 * i)]);
            if (ImageBuffer)
            {
              IOSurface = CVPixelBufferGetIOSurface(ImageBuffer);
              id v17 = IOSurface;
              if (IOSurface)
              {
                IOSurfaceLock(IOSurface, 5u, 0);
                IOSurfaceUnlock(v17, 5u, 0);
              }
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v54 objects:v70 count:16];
        }
        while (v12);
      }

      int v7 = v39;
      int v6 = v11;
      BWSampleBufferRemoveAllAttachedMedia((const void *)[v9 inferenceImage]);
    }
    if ((v35 | v7) == 1)
    {
      uint64_t v18 = *(NSObject **)(a1 + 320);
      v53[0] = MEMORY[0x1E4F143A8];
      v53[1] = 3221225472;
      v53[2] = __67__BWUBNode__setupProcessingStateForInferenceWithSettings_portType___block_invoke_2;
      v53[3] = &unk_1E5C24430;
      v53[4] = a1;
      uint64_t block = MEMORY[0x1E4F143A8];
      uint64_t v64 = 3221225472;
      unsigned int v65 = __ubn_dispatch_sync_block_invoke;
      int v66 = &unk_1E5C249F0;
      int v67 = v53;
      dispatch_sync(v18, &block);
    }
    int v19 = [[BWInferenceEngineControllerInput alloc] initWithSettings:a2 portType:a3];
    unsigned int v40 = (void *)[MEMORY[0x1E4F1CA80] set];
    if (v34)
    {
      if (([*(id *)(a1 + 304) enabledVisionInferences] & 2) != 0) {
        [(BWInferenceEngineControllerInput *)v19 setEnabledVisionInferences:[(BWInferenceEngineControllerInput *)v19 enabledVisionInferences] | 2];
      }
      if (([*(id *)(a1 + 304) enabledVisionInferences] & 4) != 0) {
        [(BWInferenceEngineControllerInput *)v19 setEnabledVisionInferences:[(BWInferenceEngineControllerInput *)v19 enabledVisionInferences] | 4];
      }
      if (([*(id *)(a1 + 304) enabledVisionInferences] & 8) != 0) {
        [(BWInferenceEngineControllerInput *)v19 setEnabledVisionInferences:[(BWInferenceEngineControllerInput *)v19 enabledVisionInferences] | 8];
      }
    }
    if (v5)
    {
      objc_msgSend(v40, "addObjectsFromArray:", objc_msgSend(*(id *)(a1 + 304), "enabledInferenceMasks"));
      if (([*(id *)(a1 + 304) enabledVisionInferences] & 2) != 0) {
        [(BWInferenceEngineControllerInput *)v19 setEnabledVisionInferences:[(BWInferenceEngineControllerInput *)v19 enabledVisionInferences] | 2];
      }
      if (([*(id *)(a1 + 304) enabledVisionInferences] & 8) != 0) {
        [(BWInferenceEngineControllerInput *)v19 setEnabledVisionInferences:[(BWInferenceEngineControllerInput *)v19 enabledVisionInferences] | 8];
      }
      if (([*(id *)(a1 + 304) enabledVisionInferences] & 0x10) != 0) {
        [(BWInferenceEngineControllerInput *)v19 setEnabledVisionInferences:[(BWInferenceEngineControllerInput *)v19 enabledVisionInferences] | 0x10];
      }
    }
    if (v6)
    {
      [v40 addObject:@"PersonSemanticsSkin"];
      [v40 addObject:0x1EFA745A0];
      [v40 addObject:0x1EFA6A200];
      if ([*(id *)(a1 + 304) smartCameraClassificationsEnabled]) {
        BOOL v20 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "metadata"), "smartCamInferences") == 0;
      }
      else {
        BOOL v20 = 0;
      }
      [(BWInferenceEngineControllerInput *)v19 setSmartCameraClassificationsEnabled:v20];
    }
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    obuint64_t j = *(id *)(a1 + 392);
    uint64_t v21 = [obj countByEnumeratingWithState:&v49 objects:v69 count:16];
    id v33 = v19;
    if (v21)
    {
      uint64_t v22 = *(void *)v50;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v50 != v22) {
            objc_enumerationMutation(obj);
          }
          uint64_t v24 = *(void *)(*((void *)&v49 + 1) + 8 * j);
          long long v45 = 0u;
          long long v46 = 0u;
          long long v47 = 0u;
          long long v48 = 0u;
          uint64_t v25 = (void *)[*(id *)(a1 + 392) objectForKeyedSubscript:v24];
          uint64_t v26 = [v25 countByEnumeratingWithState:&v45 objects:v68 count:16];
          if (v26)
          {
            uint64_t v27 = *(void *)v46;
            while (2)
            {
              for (uint64_t k = 0; k != v26; ++k)
              {
                if (*(void *)v46 != v27) {
                  objc_enumerationMutation(v25);
                }
                if (-[BWUBNode _provideInferencesForAttachedMediaMode:settings:](a1, [*(id *)(*((void *)&v45 + 1) + 8 * k) intValue], a2))
                {
                  [v40 addObject:v24];
                  goto LABEL_54;
                }
              }
              uint64_t v26 = [v25 countByEnumeratingWithState:&v45 objects:v68 count:16];
              if (v26) {
                continue;
              }
              break;
            }
          }
LABEL_54:
          ;
        }
        uint64_t v21 = [obj countByEnumeratingWithState:&v49 objects:v69 count:16];
      }
      while (v21);
    }
    uint64_t v29 = v33;
    -[BWInferenceEngineControllerInput setEnabledInferenceMasks:](v33, "setEnabledInferenceMasks:", [v40 allObjects]);
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __67__BWUBNode__setupProcessingStateForInferenceWithSettings_portType___block_invoke_3;
    v42[3] = &unk_1E5C28E70;
    v42[4] = a1;
    char v43 = v35;
    char v44 = v34;
    [(BWStillImageProcessorControllerInput *)v33 addOutputSampleBufferRouter:v42 forBufferTypes:&unk_1EFB037D0];
    uint64_t v30 = *(NSObject **)(a1 + 320);
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __67__BWUBNode__setupProcessingStateForInferenceWithSettings_portType___block_invoke_210;
    v41[3] = &unk_1E5C28DA8;
    v41[4] = v37;
    v41[5] = v33;
    v41[6] = a1;
    v41[7] = &v59;
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v64 = 3221225472;
    unsigned int v65 = __ubn_dispatch_sync_block_invoke;
    int v66 = &unk_1E5C249F0;
    int v67 = v41;
    dispatch_sync(v30, &block);
    if (!*((_DWORD *)v60 + 6)) {
      [*(id *)(a1 + 312) setObject:v33 forKeyedSubscript:a3];
    }
  }
  else
  {
    uint64_t v29 = 0;
  }

  uint64_t v31 = *((unsigned int *)v60 + 6);
  _Block_object_dispose(&v59, 8);
  return v31;
}

void __75__BWUBNode__inferenceProcessRedEyeReductionSampleBuffer_settings_portType___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) addInferenceImage:*(void *)(a1 + 40) propagationImage:*(void *)(a1 + 48)];
  uint64_t v2 = *(const void **)(a1 + 48);
  if (v2) {
    CFRelease(v2);
  }
  uint64_t v3 = *(const void **)(a1 + 40);
  if (v3)
  {
    CFRelease(v3);
  }
}

- (uint64_t)_provideInferencesForAttachedMediaMode:(void *)a3 settings:
{
  if (a1)
  {
    if (a2 == 2) {
      return -[BWUBNode _isDepthCaptureNeedingPersonSegmentationMasksWithSettings:](a1, a3);
    }
    if (a2 == 1) {
      return -[BWUBNode _isDemosaicedRawCaptureNeedingInferencesWithSettigs:](a1, a3);
    }
  }
  return 0;
}

uint64_t __33__BWUBNode__resetProcessingState__block_invoke(uint64_t a1)
{
  uint64_t v1 = (void *)[*(id *)(*(void *)(a1 + 32) + 152) controllerForType:2];
  return [v1 cancelProcessing];
}

void __33__BWUBNode__resetProcessingState__block_invoke_2(uint64_t a1)
{
  objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 152), "controllerForType:", 3), "cancelProcessing");
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(const void **)(v2 + 360);
  if (v3)
  {
    CFRelease(v3);
    *(void *)(*(void *)(a1 + 32) + 360) = 0;
    uint64_t v2 = *(void *)(a1 + 32);
  }

  *(void *)(*(void *)(a1 + 32) + 352) = 0;
}

uint64_t __33__BWUBNode__resetProcessingState__block_invoke_3(uint64_t a1)
{
  uint64_t v1 = (void *)[*(id *)(*(void *)(a1 + 32) + 152) controllerForType:8];
  return [v1 cancelProcessing];
}

- (void)_prepareSharedExternalMemoryResourceForProcessorControllersIfNeeded
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (*(unsigned char *)(a1 + 184) && !*(unsigned char *)(a1 + 185))
    {
      uint64_t v2 = (void *)[MEMORY[0x1E4F1CA48] array];
      if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 152), "controllerForType:", 6), "supportsExternalMemoryResource"))objc_msgSend(v2, "addObject:", objc_msgSend(*(id *)(a1 + 152), "controllerForType:", 6)); {
      if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 152), "controllerForType:", 2), "supportsExternalMemoryResource"))objc_msgSend(v2, "addObject:", objc_msgSend(*(id *)(a1 + 152), "controllerForType:", 2));
      }
      if ((unint64_t)[v2 count] < 2)
      {
        uint64_t v13 = 0;
      }
      else
      {
        long long v32 = 0u;
        long long v33 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        uint64_t v3 = [v2 countByEnumeratingWithState:&v30 objects:v35 count:16];
        if (v3)
        {
          uint64_t v4 = v3;
          uint64_t v5 = 0;
          unint64_t v6 = 0;
          uint64_t v7 = *(void *)v31;
LABEL_11:
          uint64_t v8 = 0;
          while (1)
          {
            if (*(void *)v31 != v7) {
              objc_enumerationMutation(v2);
            }
            long long v9 = *(void **)(*((void *)&v30 + 1) + 8 * v8);
            id v10 = (void *)[v9 externalMemoryDescriptor];
            if (!v10) {
              goto LABEL_44;
            }
            int v11 = v10;
            if ([v10 memSize] > v6)
            {
              unint64_t v6 = [v11 memSize];
              [v9 type];
            }
            uint64_t v12 = [v11 allocatorType];
            if (v5)
            {
              if (v5 != v12) {
                goto LABEL_44;
              }
            }
            else
            {
              uint64_t v5 = v12;
            }
            if ([v9 type] == 6 || objc_msgSend(v9, "type") == 2) {
              [v11 memSize];
            }
            if (v4 == ++v8)
            {
              uint64_t v4 = [v2 countByEnumeratingWithState:&v30 objects:v35 count:16];
              if (v4) {
                goto LABEL_11;
              }
              goto LABEL_29;
            }
          }
        }
        uint64_t v5 = 0;
        LODWORD(v6) = 0;
LABEL_29:
        if (dword_1EB4C5670)
        {
          int v29 = 0;
          os_log_type_t type = OS_LOG_TYPE_DEFAULT;
          os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        uint64_t v15 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 112), "metalCommandQueue", v22, v23), "device");
        if (!v15) {
          goto LABEL_44;
        }
        uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F55F48]) initWithDevice:v15 allocatorType:v5];
        if (!v13) {
          goto LABEL_42;
        }
        id v16 = objc_alloc_init(MEMORY[0x1E4F55F50]);
        [v16 setMemSize:(int)v6];
        [v16 setWireMemory:1];
        [v16 setLabel:@"FigMetalAllocatorBackend-Shared-StillImage"];
        objc_msgSend(v16, "setMemoryPoolId:", -[BWMemoryPool poolIdentifier](+[BWMemoryPool sharedMemoryPool](BWMemoryPool, "sharedMemoryPool"), "poolIdentifier"));
        if ([v13 setupWithDescriptor:v16]) {
          goto LABEL_42;
        }
        id v17 = objc_alloc_init(MEMORY[0x1E4F55EC0]);
        *(void *)(a1 + 192) = v17;
        [v17 setAllocatorBackend:v13];
        long long v26 = 0u;
        long long v27 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        uint64_t v18 = [v2 countByEnumeratingWithState:&v24 objects:v34 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v25;
          do
          {
            for (uint64_t i = 0; i != v19; ++i)
            {
              if (*(void *)v25 != v20) {
                objc_enumerationMutation(v2);
              }
              [*(id *)(*((void *)&v24 + 1) + 8 * i) setExternalMemoryResource:*(void *)(a1 + 192)];
            }
            uint64_t v19 = [v2 countByEnumeratingWithState:&v24 objects:v34 count:16];
          }
          while (v19);
        }
      }
      *(unsigned char *)(a1 + 185) = 1;
LABEL_42:

      return;
    }
LABEL_44:
    uint64_t v13 = 0;
    goto LABEL_42;
  }
}

- (uint64_t)_flushBufferPoolsWhenPossibleWithSettings:(uint64_t)result
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  if (!result) {
    return result;
  }
  uint64_t v3 = result;
  if ((objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureFlags") & 0x200000000) != 0) {
    int v4 = objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "deliverDeferredPhotoProxyImage") ^ 1;
  }
  else {
    int v4 = 0;
  }
  if ((objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureFlags") & 0x100000000) != 0)
  {
    if (objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureType") == 12) {
      int v5 = objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "deliverDeferredPhotoProxyImage") ^ 1;
    }
    else {
      int v5 = 1;
    }
  }
  else
  {
    int v5 = 0;
  }
  if (objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureType") == 11)
  {
    [*(id *)(v3 + 288) flushToMinimumCapacity:0];
    [*(id *)(v3 + 296) flushToMinimumCapacity:0];
  }
  int v6 = -[BWUBNodeConfiguration minimumOutputBufferCount](*(void *)(v3 + 112));
  if (objc_msgSend((id)objc_msgSend(a2, "requestedSettings"), "burstQualityCaptureEnabled"))
  {
    int v7 = -[BWUBNodeConfiguration maxNumberOfBurstCapturesAllowedInFlight](*(void *)(v3 + 112));
    if (v6 <= v7) {
      int v6 = v7;
    }
  }
  if ((objc_msgSend((id)objc_msgSend(a2, "processingSettings"), "processIntelligentDistortionCorrection") & 1) == 0)
  {
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    uint64_t v15 = objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "portTypes");
    uint64_t v16 = [v15 countByEnumeratingWithState:&v47 objects:v54 count:16];
    if (!v16) {
      goto LABEL_17;
    }
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v48;
LABEL_33:
    uint64_t v19 = 0;
    while (1)
    {
      if (*(void *)v48 != v18) {
        objc_enumerationMutation(v15);
      }
      if (objc_msgSend((id)v3, "idcSupportedForCaptureType:captureFlags:portType:", objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureType"), 0, *(void *)(*((void *)&v47 + 1) + 8 * v19)))break; {
      if (v17 == ++v19)
      }
      {
        uint64_t v17 = [v15 countByEnumeratingWithState:&v47 objects:v54 count:16];
        if (v17) {
          goto LABEL_33;
        }
        goto LABEL_17;
      }
    }
  }
  int v6 = *(_DWORD *)(v3 + 624);
LABEL_17:
  if (v5 && objc_msgSend((id)objc_msgSend(*(id *)(v3 + 16), "livePixelBufferPool"), "usesMemoryPool")) {
    int v6 = 0;
  }
  objc_msgSend((id)objc_msgSend(*(id *)(v3 + 16), "livePixelBufferPool"), "flushToMinimumCapacity:", v6);
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  uint64_t v8 = *(void **)(v3 + 344);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v43 objects:v53 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v44 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = (void *)[*(id *)(v3 + 344) objectForKeyedSubscript:*(void *)(*((void *)&v43 + 1) + 8 * i)];
        if ([v13 usesMemoryPool]) {
          [v13 flushToMinimumCapacity:0];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v43 objects:v53 count:16];
    }
    while (v10);
  }
  if ((objc_msgSend((id)objc_msgSend(a2, "processingSettings"), "provideDemosaicedRaw") ^ 1 | v4 | v5)) {
    unint64_t v14 = 0;
  }
  else {
    unint64_t v14 = *(int *)(v3 + 628);
  }
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(v3 + 16), "mediaPropertiesForAttachedMediaKey:", 0x1EFA745E0), "livePixelBufferPool"), "flushToMinimumCapacity:", v14);
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  obuint64_t j = *(id *)(v3 + 392);
  id result = [obj countByEnumeratingWithState:&v39 objects:v52 count:16];
  uint64_t v33 = result;
  if (result)
  {
    uint64_t v32 = *(void *)v40;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v40 != v32) {
          objc_enumerationMutation(obj);
        }
        uint64_t v21 = *(void *)(*((void *)&v39 + 1) + 8 * v20);
        long long v35 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        uint64_t v34 = v21;
        uint64_t v22 = objc_msgSend(*(id *)(v3 + 392), "objectForKeyedSubscript:");
        uint64_t v23 = [v22 countByEnumeratingWithState:&v35 objects:v51 count:16];
        if (!v23)
        {
          unint64_t v25 = 0;
          goto LABEL_65;
        }
        uint64_t v24 = v23;
        unint64_t v25 = 0;
        uint64_t v26 = *(void *)v36;
        do
        {
          for (uint64_t j = 0; j != v24; ++j)
          {
            if (*(void *)v36 != v26) {
              objc_enumerationMutation(v22);
            }
            int v28 = [*(id *)(*((void *)&v35 + 1) + 8 * j) intValue];
            if (v28 == 2)
            {
              if (-[BWUBNode _isDepthCaptureNeedingPersonSegmentationMasksWithSettings:](v3, a2))
              {
                unsigned int v30 = objc_msgSend((id)objc_msgSend(a2, "requestedSettings"), "bracketImageCount");
                if (v30) {
                  unint64_t v29 = v30;
                }
                else {
                  unint64_t v29 = 2;
                }
                goto LABEL_59;
              }
            }
            else if (v28 == 1)
            {
              unint64_t v29 = v14;
              goto LABEL_59;
            }
            unint64_t v29 = 0;
LABEL_59:
            if (v25 <= v29) {
              unint64_t v25 = v29;
            }
          }
          uint64_t v24 = [v22 countByEnumeratingWithState:&v35 objects:v51 count:16];
        }
        while (v24);
LABEL_65:
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(v3 + 16), "mediaPropertiesForAttachedMediaKey:", v34), "livePixelBufferPool"), "flushToMinimumCapacity:", v25);
        ++v20;
      }
      while (v20 != v33);
      id result = [obj countByEnumeratingWithState:&v39 objects:v52 count:16];
      uint64_t v33 = result;
    }
    while (result);
  }
  return result;
}

- (void)_setupDeferredProcessingWithSettings:(uint64_t)a3 portType:
{
  if (a1)
  {
    if ([*(id *)(a1 + 152) controllerForType:5])
    {
      int v6 = [(BWStillImageProcessorControllerInput *)[BWDeferredProcessorControllerInput alloc] initWithSettings:a2 portType:a3];
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __58__BWUBNode__setupDeferredProcessingWithSettings_portType___block_invoke;
      v7[3] = &unk_1E5C28D80;
      void v7[4] = a1;
      [(BWStillImageProcessorControllerInput *)v6 addOutputSampleBufferRouter:v7 forBufferTypes:&unk_1EFB03758];
      [*(id *)(a1 + 616) setObject:v6 forKeyedSubscript:a3];
      objc_msgSend((id)objc_msgSend(*(id *)(a1 + 152), "controllerForType:", 5), "enqueueInputForProcessing:delegate:", v6, a1);
    }
  }
}

void __58__BWUBNode__setupDeferredProcessingWithSettings_portType___block_invoke(uint64_t a1, CMAttachmentBearerRef target, uint64_t a3, void *a4, uint64_t a5)
{
  if (a5)
  {
    CFTypeRef v9 = CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53070], 0);
    uint64_t v10 = *(void *)(a1 + 32);
    [NSString stringWithFormat:@"type '%@' requested for '%@'", BWStillImageBufferTypeToShortString(a3), a4];
    -[BWUBNode _emitError:processorInput:metadata:description:](v10, a5, a4, (uint64_t)v9);
  }
}

- (uint64_t)_setupProcessingStateForClientBracketWithSettings:(void *)a3 processingPlan:
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    unint64_t v25 = (void *)[*(id *)(a1 + 152) controllerForType:*(void *)(a1 + 208)];
    if (v25)
    {
      uint64_t v22 = (objc_class *)objc_opt_class();
      uint64_t v5 = *(void *)(a1 + 160);
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __53__BWUBNode__standardNROutputRouterWithExpectedQueue___block_invoke;
      v31[3] = &unk_1E5C28E48;
      v31[4] = v5;
      v31[5] = a1;
      id v21 = (id)[v31 copy];
      int v6 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureStreamSettingsForPortType:", objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "masterPortType")), "unifiedBracketedCaptureParams"), "count");
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      obuint64_t j = -[BWUBNode _processingOrderByPortTypeForSettings:]((id *)a1, a2);
      uint64_t v23 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
      if (v23)
      {
        uint64_t v20 = *(void *)v28;
        while (2)
        {
          uint64_t v7 = 0;
          do
          {
            if (*(void *)v28 != v20) {
              objc_enumerationMutation(obj);
            }
            uint64_t v24 = v7;
            uint64_t v8 = *(void *)(*((void *)&v27 + 1) + 8 * v7);
            CFTypeRef v9 = (void *)[[v22 alloc] initWithSettings:a2 portType:v8];
            id v10 = -[BWUBNode _bufferTypesForCaptureSettings:](a1, (void *)[a2 captureSettings]);
            [v9 addOutputSampleBufferRouter:v21 forBufferTypes:v10];
            objc_msgSend(*(id *)(a1 + 224), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObject:", v9), v8);

            int v11 = -[BWUBNode _processingNeededForSettings:portType:](a1, (void *)[v9 stillImageSettings], objc_msgSend(v9, "portType"));
            if (v11) {
              int v12 = v6;
            }
            else {
              int v12 = 1;
            }
            objc_msgSend(v9, "setRemainingProcessingCount:", objc_msgSend(v9, "remainingProcessingCount") + v12);
            objc_msgSend(*(id *)(a1 + 512), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary"), v8);
            if (v6 >= 1)
            {
              int v13 = 0;
              while (1)
              {
                if (v11)
                {
                  [a3 addInput:v9 sequenceNumber:(v13 + 1) portType:v8 bufferTypes:v10];
                  uint64_t v15 = -[BWUBNode _setupProcessingStateForIntelligentDistortionCorrectionIfNeededWithSettings:sequenceNumber:portType:queueProvidingInput:processingPlan:]((id *)a1, a2, (v13 + 1), v8, v14, a3);
                  if (v15)
                  {
                    uint64_t v17 = v15;
                    goto LABEL_24;
                  }
                  uint64_t v16 = objc_msgSend(v25, "enqueueInputForProcessing:delegate:processErrorRecoveryFrame:processOriginalImage:processToneMapping:processInferenceInputImage:clientBracketSequenceNumber:processSemanticRendering:provideInferenceInputImageForProcessing:processSmartStyleRenderingInput:inferencesAvailable:", v9, a1, 0, 0, 0, 0, (v13 + 1));
                  if (v16) {
                    break;
                  }
                }
                if ([v9 isMaster]) {
                  -[BWUBNode _setupProcessingStateForDisparityIfNeededWithSettings:sequenceNumber:processingPlan:](a1, a2, (v13 + 1), a3);
                }
                if (v6 == ++v13) {
                  goto LABEL_19;
                }
              }
              uint64_t v17 = v16;
LABEL_24:
              FigDebugAssert3();
              return v17;
            }
LABEL_19:
            uint64_t v7 = v24 + 1;
          }
          while (v24 + 1 != v23);
          uint64_t v23 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
          if (v23) {
            continue;
          }
          break;
        }
      }
    }
  }
  return 0;
}

- (uint64_t)_setupProcessingStateForFlashCaptureWithSettings:(void *)a3 processingPlan:
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  long long v30 = (void *)[*(id *)(a1 + 152) controllerForType:*(void *)(a1 + 208)];
  if (!v30) {
    return 0;
  }
  uint64_t v34 = (objc_class *)objc_opt_class();
  uint64_t v6 = [*(id *)(a1 + 152) controllerForType:11];
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __76__BWUBNode__setupProcessingStateForFlashCaptureWithSettings_processingPlan___block_invoke;
  v41[3] = &unk_1E5C28D80;
  v41[4] = a1;
  id v29 = -[BWUBNode _standardNROutputRouterWithExpectedQueue:]((id)a1, *(void *)(a1 + 160));
  id v32 = -[BWUBNode _bufferTypesForCaptureSettings:](a1, (void *)[a2 captureSettings]);
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __76__BWUBNode__setupProcessingStateForFlashCaptureWithSettings_processingPlan___block_invoke_2;
  v40[3] = &unk_1E5C28D80;
  v40[4] = a1;
  uint64_t v7 = (void *)[*(id *)(a1 + 152) controllerForType:4];
  char v8 = -[BWUBNode _isSemanticRenderingCapture:](a1, a2);
  int v9 = -[BWUBNode _isInferenceInputImageRequiredForSettings:](a1, a2);
  -[BWUBNode _inferencesRequiredForSettings:](a1, a2);
  char v27 = -[BWUBNode _inferencesRequiredByProcessorControllersForSettings:](a1, a2);
  int v28 = v9;
  unint64_t v25 = (void *)v6;
  if (*(void *)(a1 + 400)) {
    unint64_t v26 = ((unint64_t)objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureFlags") >> 16) & 1;
  }
  else {
    LODWORD(v26) = 0;
  }
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  obuint64_t j = -[BWUBNode _processingOrderByPortTypeForSettings:]((id *)a1, a2);
  uint64_t v35 = [obj countByEnumeratingWithState:&v36 objects:v42 count:16];
  if (v35)
  {
    uint64_t v33 = *(void *)v37;
    char v24 = v8;
    uint64_t v23 = a2;
    while (2)
    {
      for (uint64_t i = 0; i != v35; ++i)
      {
        if (*(void *)v37 != v33) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v36 + 1) + 8 * i);
        int v12 = (void *)[[v34 alloc] initWithSettings:a2 portType:v11];
        objc_msgSend(*(id *)(a1 + 224), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObject:", v12), v11);
        objc_msgSend(v12, "setRemainingProcessingCount:", objc_msgSend(v12, "remainingProcessingCount") + 1);

        if (-[BWUBNode _processingNeededForSettings:portType:](a1, (void *)[v12 stillImageSettings], objc_msgSend(v12, "portType")))
        {
          if ((objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureFlags") & 0x80) != 0)
          {
            if (!v25) {
              return 4294954516;
            }
            int v13 = -[BWStillImageProcessorControllerInput initWithSettings:portType:]([BWLearnedNRInput alloc], "initWithSettings:portType:", a2, [v12 portType]);
            [(BWStillImageProcessorControllerInput *)v13 addOutputSampleBufferRouter:v41 forBufferTypes:v32];
            objc_msgSend(a3, "addInput:sequenceNumber:portType:bufferTypes:", v13, 0, objc_msgSend(v12, "portType"), v32);
            objc_msgSend(*(id *)(a1 + 256), "setObject:forKeyedSubscript:", v13, -[BWStillImageProcessorControllerInput portType](v13, "portType"));
            uint64_t v14 = [v25 enqueueInputForProcessing:v13 delegate:a1];

            a2 = v23;
            char v8 = v24;
            if (v14) {
              return v14;
            }
          }
          if (v28)
          {
            [v12 addOutputSampleBufferRouter:-[BWUBNode _ubInferenceInputRouter]((id)a1) forBufferTypes:&unk_1EFB037A0];
            [a3 addInput:v12 sequenceNumber:0 portType:v11 bufferType:15];
          }
          [v12 addOutputSampleBufferRouter:v29 forBufferTypes:v32];
          [a3 addInput:v12 sequenceNumber:0 portType:v11 bufferTypes:v32];
          HIBYTE(v22) = v27;
          *(_WORD *)((char *)&v22 + 5) = v28;
          BYTE4(v22) = v8;
          LODWORD(v22) = 0;
          uint64_t v15 = objc_msgSend(v30, "enqueueInputForProcessing:delegate:processErrorRecoveryFrame:processOriginalImage:processToneMapping:processInferenceInputImage:clientBracketSequenceNumber:processSemanticRendering:provideInferenceInputImageForProcessing:processSmartStyleRenderingInput:inferencesAvailable:", v12, a1, 0, 0, 0, 0, v22);
          if (v15)
          {
            uint64_t v14 = v15;
LABEL_31:
            FigDebugAssert3();
            return v14;
          }
          uint64_t v17 = -[BWUBNode _setupProcessingStateForIntelligentDistortionCorrectionIfNeededWithSettings:sequenceNumber:portType:queueProvidingInput:processingPlan:]((id *)a1, a2, 0, v11, v16, a3);
          if (v17)
          {
            uint64_t v14 = v17;
            goto LABEL_31;
          }
          uint64_t v19 = -[BWUBNode _setupProcessingStateForDeepZoomWithSettings:sequenceNumber:portType:queueProvidingInput:processingPlan:](a1, a2, 0, v11, v18, a3);
          if (v19)
          {
            uint64_t v14 = v19;
            goto LABEL_31;
          }
          if (v26)
          {
            if (!v7) {
              return 4294954516;
            }
            uint64_t v20 = [(BWStillImageProcessorControllerInput *)[BWRedEyeReductionControllerInput alloc] initWithSettings:a2 portType:v11];
            [(BWStillImageProcessorControllerInput *)v20 addOutputSampleBufferRouter:v40 forBufferTypes:&unk_1EFB037B8];
            [a3 addInput:v20 sequenceNumber:0 portType:v11 bufferTypes:&unk_1EFB037B8];
            [*(id *)(a1 + 408) setObject:v20 forKeyedSubscript:v11];
            uint64_t v14 = [v7 enqueueInputForProcessing:v20 delegate:a1];

            if (v14) {
              return v14;
            }
          }
        }
      }
      uint64_t v35 = [obj countByEnumeratingWithState:&v36 objects:v42 count:16];
      if (v35) {
        continue;
      }
      break;
    }
  }
  -[BWUBNode _setupProcessingStateForJasperDisparityIfNeededWithSettings:processingPlan:](a1, a2, a3);
  return -[BWUBNode _setupProcessingStateForDisparityIfNeededWithSettings:sequenceNumber:processingPlan:](a1, a2, 0, a3);
}

- (uint64_t)_setupProcessingStateForSingleImageCaptureWithSettings:(void *)a3 processingPlan:
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v45 = [*(id *)(a1 + 152) controllerForType:*(void *)(a1 + 208)];
  if (!v45) {
    return 0;
  }
  long long v39 = a3;
  uint64_t v6 = (objc_class *)objc_opt_class();
  long long v42 = (void *)[*(id *)(a1 + 152) controllerForType:11];
  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = __82__BWUBNode__setupProcessingStateForSingleImageCaptureWithSettings_processingPlan___block_invoke;
  v56[3] = &unk_1E5C28D80;
  v56[4] = a1;
  id v41 = -[BWUBNode _standardNROutputRouterWithExpectedQueue:]((id)a1, *(void *)(a1 + 160));
  obuint64_t j = (id)[MEMORY[0x1E4F1CA48] array];
  id v43 = -[BWUBNode _bufferTypesForCaptureSettings:](a1, (void *)[a2 captureSettings]);
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  uint64_t v7 = (id *)a1;
  char v8 = (id *)a1;
  int v9 = a2;
  id v10 = -[BWUBNode _processingOrderByPortTypeForSettings:](v8, a2);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v52 objects:v58 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v53;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v53 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v52 + 1) + 8 * i);
        uint64_t v16 = (void *)[[v6 alloc] initWithSettings:v9 portType:v15];
        objc_msgSend(v7[28], "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObject:", v16), v15);
        [obj addObject:v16];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v52 objects:v58 count:16];
    }
    while (v12);
  }
  uint64_t v17 = v9;
  if (-[BWUBNode _isSemanticRenderingCapture:]((uint64_t)v7, v9)) {
    uint64_t v18 = 1;
  }
  else {
    uint64_t v18 = [v7[14] deferredPhotoProcessorEnabled];
  }
  uint64_t v19 = (void *)v45;
  uint64_t v20 = -[BWUBNode _isInferenceInputImageRequiredForSettings:]((uint64_t)v7, v9);
  if (-[BWUBNode _inferencesRequiredByProcessorControllersForSettings:]((uint64_t)v7, v9)) {
    char v40 = 1;
  }
  else {
    char v40 = [v7[14] deferredPhotoProcessorEnabled];
  }
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  uint64_t v46 = [obj countByEnumeratingWithState:&v48 objects:v57 count:16];
  if (v46)
  {
    uint64_t v44 = *(void *)v49;
    while (2)
    {
      for (uint64_t j = 0; j != v46; ++j)
      {
        if (*(void *)v49 != v44) {
          objc_enumerationMutation(obj);
        }
        uint64_t v22 = *(void **)(*((void *)&v48 + 1) + 8 * j);
        if (-[BWUBNode _processingNeededForSettings:portType:]((uint64_t)v7, (void *)[v22 stillImageSettings], objc_msgSend(v22, "portType")))
        {
          if ((objc_msgSend((id)objc_msgSend(v17, "captureSettings"), "captureFlags") & 0x80) != 0)
          {
            if (!v42) {
              return 4294954516;
            }
            uint64_t v23 = -[BWStillImageProcessorControllerInput initWithSettings:portType:]([BWLearnedNRInput alloc], "initWithSettings:portType:", v17, [v22 portType]);
            char v24 = v17;
            uint64_t v25 = v20;
            unint64_t v26 = v19;
            uint64_t v27 = v18;
            int v28 = v23;
            [(BWStillImageProcessorControllerInput *)v23 addOutputSampleBufferRouter:v56 forBufferTypes:v43];
            objc_msgSend(v39, "addInput:sequenceNumber:portType:bufferTypes:", v28, 0, objc_msgSend(v22, "portType"), v43);
            objc_msgSend(v7[32], "setObject:forKeyedSubscript:", v28, -[BWStillImageProcessorControllerInput portType](v28, "portType"));
            uint64_t v29 = [v42 enqueueInputForProcessing:v28 delegate:v7];

            uint64_t v18 = v27;
            uint64_t v19 = v26;
            uint64_t v20 = v25;
            uint64_t v17 = v24;
            if (v29) {
              return v29;
            }
          }
          if (v20)
          {
            [v22 addOutputSampleBufferRouter:-[BWUBNode _ubInferenceInputRouter](v7) forBufferTypes:&unk_1EFB03788];
            objc_msgSend(v39, "addInput:sequenceNumber:portType:bufferType:", v22, 0, objc_msgSend(v22, "portType"), 15);
          }
          [v22 addOutputSampleBufferRouter:v41 forBufferTypes:v43];
          objc_msgSend(v39, "addInput:sequenceNumber:portType:bufferTypes:", v22, 0, objc_msgSend(v22, "portType"), v43);
          HIBYTE(v38) = v40;
          *(_WORD *)((char *)&v38 + 5) = v20;
          BYTE4(v38) = v18;
          LODWORD(v38) = 0;
          uint64_t v30 = objc_msgSend(v19, "enqueueInputForProcessing:delegate:processErrorRecoveryFrame:processOriginalImage:processToneMapping:processInferenceInputImage:clientBracketSequenceNumber:processSemanticRendering:provideInferenceInputImageForProcessing:processSmartStyleRenderingInput:inferencesAvailable:", v22, v7, 0, 0, 0, 0, v38);
          if (v30)
          {
            uint64_t v29 = v30;
LABEL_38:
            FigDebugAssert3();
            return v29;
          }
          uint64_t v31 = [v22 portType];
          uint64_t v33 = -[BWUBNode _setupProcessingStateForIntelligentDistortionCorrectionIfNeededWithSettings:sequenceNumber:portType:queueProvidingInput:processingPlan:](v7, v17, 0, v31, v32, v39);
          if (v33)
          {
            uint64_t v29 = v33;
            goto LABEL_38;
          }
          uint64_t v34 = [v22 portType];
          uint64_t v36 = -[BWUBNode _setupProcessingStateForDeepZoomWithSettings:sequenceNumber:portType:queueProvidingInput:processingPlan:]((uint64_t)v7, v17, 0, v34, v35, v39);
          if (v36)
          {
            uint64_t v29 = v36;
            goto LABEL_38;
          }
          -[BWUBNode _setupDeferredProcessingWithSettings:portType:]((uint64_t)v7, (uint64_t)v17, [v22 portType]);
        }
        objc_msgSend(v22, "setRemainingProcessingCount:", objc_msgSend(v22, "remainingProcessingCount") + 1);
      }
      uint64_t v46 = [obj countByEnumeratingWithState:&v48 objects:v57 count:16];
      if (v46) {
        continue;
      }
      break;
    }
  }
  -[BWUBNode _setupProcessingStateForJasperDisparityIfNeededWithSettings:processingPlan:]((uint64_t)v7, v17, v39);
  return -[BWUBNode _setupProcessingStateForDisparityIfNeededWithSettings:sequenceNumber:processingPlan:]((BOOL)v7, v17, 0, v39);
}

- (uint64_t)_setupProcessingStateForDeferredCaptureIfNeededWithSettings:(uint64_t)a1
{
  if (!a1
    || !objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "deliverDeferredPhotoProxyImage")
    || *(void *)(a1 + 584))
  {
    return 0;
  }
  int v4 = (void *)[*(id *)(a1 + 152) controllerForType:14];
  if (!v4) {
    return 4294950488;
  }
  uint64_t v5 = v4;
  uint64_t v6 = -[BWDeferredCaptureControllerInput initWithSettings:configuration:sourceNodePixelBufferAttributes:]([BWDeferredCaptureControllerInput alloc], "initWithSettings:configuration:sourceNodePixelBufferAttributes:", a2, [v4 configuration], objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "videoFormat"), "pixelBufferAttributes"));
  -[BWDeferredPipelineParameters setNoiseReductionAndFusionScheme:](-[BWDeferredCaptureControllerInput pipelineParameters](v6, "pipelineParameters"), "setNoiseReductionAndFusionScheme:", -[BWUBNodeConfiguration stillImageFusionScheme](*(void *)(a1 + 112)));
  [(BWDeferredPipelineParameters *)[(BWDeferredCaptureControllerInput *)v6 pipelineParameters] setNrfVersion:[+[FigCaptureCameraParameters sharedInstance] nrfVersion]];
  uint64_t v7 = [v5 enqueueInputForProcessing:v6 delegate:a1];

  if (!v7) {
    *(void *)(a1 + 584) = v6;
  }
  return v7;
}

- (id)_nrOutputSbufRouter
{
  if (result)
  {
    v1[0] = MEMORY[0x1E4F143A8];
    v1[1] = 3221225472;
    v1[2] = __31__BWUBNode__nrOutputSbufRouter__block_invoke;
    v1[3] = &unk_1E5C28D80;
    v1[4] = result;
    return (id)[v1 copy];
  }
  return result;
}

- (uint64_t)_setupProcessingStateForDeepZoomWithSettings:(uint64_t)a3 sequenceNumber:(uint64_t)a4 portType:(uint64_t)a5 queueProvidingInput:(void *)a6 processingPlan:
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v11 = (id *)result;
    if (!_FigIsCurrentDispatchQueue())
    {
      uint64_t v31 = v6;
      LODWORD(v30) = 0;
      FigDebugAssert3();
    }
    if (!v11[58] || (objc_msgSend((id)objc_msgSend(a2, "requestedSettings"), "bypassUpscaling") & 1) != 0) {
      return 0;
    }
    int v12 = objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureType");
    char v13 = objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureFlags");
    int v14 = [v11[58] type];
    int v15 = v14;
    if (v12 == 1)
    {
      id result = 0;
      if ((v13 & 0x80) == 0 || v15 != 2) {
        return result;
      }
    }
    else if (v12 != 12 || v14 != 1)
    {
      return 0;
    }
    uint64_t v32 = objc_msgSend(v11[19], "controllerForType:", 10, v30, v31);
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __116__BWUBNode__setupProcessingStateForDeepZoomWithSettings_sequenceNumber_portType_queueProvidingInput_processingPlan___block_invoke;
    v43[3] = &unk_1E5C28E48;
    v43[4] = v11;
    v43[5] = a4;
    uint64_t v16 = [(BWStillImageProcessorControllerInput *)[BWDeepZoomProcessorInput alloc] initWithSettings:a2 portType:a4];
    id v17 = -[BWUBNode _bufferTypesExcludingErrorRecoveryTypesForCaptureSettings:](v11, (void *)[a2 captureSettings]);
    uint64_t v33 = v11;
    obuint64_t j = -[BWUBNode _errorRecoveryBufferTypesForBufferTypes:](v11, v17);
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v39 objects:v46 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v40;
      while (2)
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v40 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = (int)[*(id *)(*((void *)&v39 + 1) + 8 * i) intValue];
          uint64_t v23 = (void *)[a6 lastAddedInputForSequenceNumber:a3 portType:a4 bufferType:v22];
          if (v23)
          {
            if (!ubn_insertOutputRouterForInputAfterPreviousInputForBufferType((uint64_t)v43, v16, v23, v22))return 4294954516; {
            [a6 addInput:v16 sequenceNumber:a3 portType:a4 bufferType:v22];
            }
          }
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v39 objects:v46 count:16];
        if (v19) {
          continue;
        }
        break;
      }
    }
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    uint64_t v24 = [obj countByEnumeratingWithState:&v35 objects:v45 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v36;
      do
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v36 != v26) {
            objc_enumerationMutation(obj);
          }
          int v28 = *(void **)(*((void *)&v35 + 1) + 8 * j);
          uint64_t v29 = objc_msgSend(a6, "lastAddedInputForSequenceNumber:portType:bufferType:", a3, a4, (int)objc_msgSend(v28, "intValue"));
          uint64_t v44 = v28;
          objc_msgSend(v29, "addBypassedProcessorType:forBufferTypes:", 10, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v44, 1));
        }
        uint64_t v25 = [obj countByEnumeratingWithState:&v35 objects:v45 count:16];
      }
      while (v25);
    }
    [v33[59] setObject:v16 forKeyedSubscript:a4];

    return [v32 enqueueInputForProcessing:v16 delegate:v33];
  }
  return result;
}

- (uint64_t)_setupProcessingStateForDisparityIfNeededWithSettings:(uint64_t)a3 sequenceNumber:(void *)a4 processingPlan:
{
  uint64_t v4 = a1;
  if (a1)
  {
    uint64_t v14 = 0;
    int v15 = &v14;
    uint64_t v16 = 0x2020000000;
    int v17 = 0;
    if (-[BWUBNode _generateDisparityForSettings:](a1, a2))
    {
      uint64_t v8 = [*(id *)(v4 + 152) controllerForType:8];
      if (v8)
      {
        int v9 = -[BWStereoDisparityProcessorInput initWithSettings:portType:]([BWStereoDisparityProcessorInput alloc], "initWithSettings:portType:", a2, objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "masterPortType"));
        ++*(_DWORD *)(v4 + 496);
        id v10 = *(void **)(v4 + 504);
        uint64_t block = MEMORY[0x1E4F143A8];
        uint64_t v19 = 3221225472;
        uint64_t v20 = __53__BWUBNode__standardNROutputRouterWithExpectedQueue___block_invoke;
        id v21 = &unk_1E5C28E48;
        uint64_t v22 = v10;
        uint64_t v23 = v4;
        -[BWStillImageProcessorControllerInput addOutputSampleBufferRouter:forBufferTypes:](v9, "addOutputSampleBufferRouter:forBufferTypes:", (id)[&block copy], &unk_1EFB037E8);
        objc_msgSend(a4, "addInput:sequenceNumber:portType:bufferType:", v9, a3, objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "masterPortType"), 20);
        if (objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureType") == 7) {
          objc_msgSend(*(id *)(v4 + 520), "setObject:forKeyedSubscript:", v9, objc_msgSend(NSNumber, "numberWithUnsignedInt:", a3));
        }
        else {
          *(void *)(v4 + 488) = v9;
        }
        uint64_t v11 = *(NSObject **)(v4 + 504);
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __96__BWUBNode__setupProcessingStateForDisparityIfNeededWithSettings_sequenceNumber_processingPlan___block_invoke;
        v13[3] = &unk_1E5C28DA8;
        v13[4] = v8;
        void v13[5] = v9;
        void v13[6] = v4;
        void v13[7] = &v14;
        uint64_t block = MEMORY[0x1E4F143A8];
        uint64_t v19 = 3221225472;
        uint64_t v20 = __ubn_dispatch_sync_block_invoke;
        id v21 = &unk_1E5C249F0;
        uint64_t v22 = v13;
        dispatch_sync(v11, &block);
      }
    }
    uint64_t v4 = *((unsigned int *)v15 + 6);
    _Block_object_dispose(&v14, 8);
  }
  return v4;
}

- (uint64_t)_setupProcessingStateForDeepFusionWithSettings:(void *)a3 processingPlan:
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v33 = 0;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x2020000000;
  int v36 = 0;
  uint64_t v26 = [a1[19] controllerForType:2];
  if (!_FigIsCurrentDispatchQueue())
  {
    uint64_t v23 = v24;
    LODWORD(v22) = 0;
    FigDebugAssert3();
  }
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __74__BWUBNode__setupProcessingStateForDeepFusionWithSettings_processingPlan___block_invoke;
  v32[3] = &unk_1E5C28D80;
  v32[4] = a1;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v6 = objc_msgSend((id)objc_msgSend(a2, "captureSettings", v22, v23), "captureStreamSettings");
  uint64_t v7 = [v6 countByEnumeratingWithState:&v28 objects:v37 count:16];
  obuint64_t j = v6;
  if (v7)
  {
    uint64_t v8 = *(void *)v29;
LABEL_6:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v29 != v8) {
        objc_enumerationMutation(obj);
      }
      id v10 = *(void **)(*((void *)&v28 + 1) + 8 * v9);
      uint64_t v11 = -[BWDeepFusionProcessorInput initWithSettings:portType:processInferenceInputImage:processQuadraForEnhancedResolutionInferenceInputImage:processSmartStyleRenderingInput:]([BWDeepFusionProcessorInput alloc], "initWithSettings:portType:processInferenceInputImage:processQuadraForEnhancedResolutionInferenceInputImage:processSmartStyleRenderingInput:", a2, [v10 portType], 0, 0, 0);
      id v12 = -[BWUBNode _bufferTypesForCaptureSettings:]((uint64_t)a1, (void *)[a2 captureSettings]);
      [(BWStillImageProcessorControllerInput *)v11 addOutputSampleBufferRouter:v32 forBufferTypes:v12];
      objc_msgSend(a3, "addInput:sequenceNumber:portType:bufferTypes:", v11, 0, objc_msgSend(v10, "portType"), v12);
      objc_msgSend(a1[34], "setObject:forKeyedSubscript:", v11, -[BWStillImageProcessorControllerInput portType](v11, "portType"));
      char v13 = objc_msgSend((id)objc_msgSend(a1[28], "objectForKeyedSubscript:", -[BWStillImageProcessorControllerInput portType](v11, "portType")), "firstObject");
      objc_msgSend(v13, "setRemainingProcessingCount:", objc_msgSend(v13, "remainingProcessingCount") + 1);
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __74__BWUBNode__setupProcessingStateForDeepFusionWithSettings_processingPlan___block_invoke_2;
      v27[3] = &unk_1E5C28DA8;
      v27[4] = v26;
      v27[5] = v11;
      v27[6] = a1;
      v27[7] = &v33;
      -[BWUBNode _deepFusionDispatch:direction:block:]((uint64_t)a1, 1, 1, (uint64_t)v27);
      if (*((_DWORD *)v34 + 6)) {
        break;
      }
      uint64_t v14 = [(BWStillImageProcessorControllerInput *)v11 portType];
      int v16 = -[BWUBNode _setupProcessingStateForIntelligentDistortionCorrectionIfNeededWithSettings:sequenceNumber:portType:queueProvidingInput:processingPlan:](a1, a2, 0, v14, v15, a3);
      *((_DWORD *)v34 + 6) = v16;
      if (v16
        || (uint64_t v17 = [(BWStillImageProcessorControllerInput *)v11 portType],
            int v19 = -[BWUBNode _setupProcessingStateForDeepZoomWithSettings:sequenceNumber:portType:queueProvidingInput:processingPlan:]((uint64_t)a1, a2, 0, v17, v18, a3), (*((_DWORD *)v34 + 6) = v19) != 0))
      {
        FigDebugAssert3();
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [obj countByEnumeratingWithState:&v28 objects:v37 count:16];
        if (v7) {
          goto LABEL_6;
        }
        break;
      }
    }
  }
  uint64_t v20 = *((unsigned int *)v34 + 6);
  _Block_object_dispose(&v33, 8);
  return v20;
}

- (uint64_t)_setupProcessingStateForPointCloudDepthIfNeededWithSettings:(void *)a3 processingPlan:
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v6 = (id *)result;
    if (!_FigIsCurrentDispatchQueue())
    {
      uint64_t v27 = v3;
      LODWORD(v26) = 0;
      FigDebugAssert3();
    }
    if ((objc_msgSend((id)objc_msgSend(a2, "captureSettings", v26, v27), "captureFlags") & 0x200) != 0)
    {
      id result = [v6[19] controllerForType:9];
      if (result)
      {
        uint64_t v7 = (void *)result;
        id v8 = -[BWUBNode _bufferTypesForCaptureSettings:]((uint64_t)v6, (void *)[a2 captureSettings]);
        v46[0] = MEMORY[0x1E4F143A8];
        v46[1] = 3221225472;
        v46[2] = __87__BWUBNode__setupProcessingStateForPointCloudDepthIfNeededWithSettings_processingPlan___block_invoke;
        v46[3] = &unk_1E5C28E48;
        v46[4] = v6;
        v46[5] = v7;
        uint64_t v9 = (void *)[MEMORY[0x1E4F1CA48] array];
        long long v42 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        obuint64_t j = (id)objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "portTypes");
        uint64_t v10 = [obj countByEnumeratingWithState:&v42 objects:v49 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v43;
          uint64_t v28 = *(void *)v43;
          long long v29 = a2;
          long long v31 = v9;
          do
          {
            uint64_t v13 = 0;
            uint64_t v30 = v11;
            do
            {
              if (*(void *)v43 != v12) {
                objc_enumerationMutation(obj);
              }
              uint64_t v14 = *(void **)(*((void *)&v42 + 1) + 8 * v13);
              if (-[BWUBNode _processingNeededForSettings:portType:]((uint64_t)v6, a2, v14))
              {
                uint64_t v33 = v13;
                uint64_t v15 = -[BWJasperColorStillsExecutorInput initWithSettings:portType:timeOfFlightCameraType:]([BWJasperColorStillsExecutorInput alloc], "initWithSettings:portType:timeOfFlightCameraType:", a2, v14, objc_msgSend((id)objc_msgSend(v6[13], "supplementalPointCloudCaptureDevice"), "timeOfFlightCameraType"));
                long long v38 = 0u;
                long long v39 = 0u;
                long long v40 = 0u;
                long long v41 = 0u;
                uint64_t v16 = [v8 countByEnumeratingWithState:&v38 objects:v48 count:16];
                if (v16)
                {
                  uint64_t v17 = v16;
                  uint64_t v18 = *(void *)v39;
                  while (2)
                  {
                    for (uint64_t i = 0; i != v17; ++i)
                    {
                      if (*(void *)v39 != v18) {
                        objc_enumerationMutation(v8);
                      }
                      uint64_t v20 = (int)[*(id *)(*((void *)&v38 + 1) + 8 * i) intValue];
                      id v21 = (void *)[a3 lastAddedInputForSequenceNumber:0 portType:v14 bufferType:v20];
                      if (v21)
                      {
                        if (!ubn_insertOutputRouterForInputAfterPreviousInputForBufferType((uint64_t)v46, v15, v21, v20))return 4294954516; {
                        [a3 addInput:v15 sequenceNumber:0 portType:v14 bufferType:v20];
                        }
                      }
                    }
                    uint64_t v17 = [v8 countByEnumeratingWithState:&v38 objects:v48 count:16];
                    if (v17) {
                      continue;
                    }
                    break;
                  }
                }
                a2 = v29;
                if (objc_msgSend(v14, "isEqualToString:", objc_msgSend((id)objc_msgSend(v29, "captureSettings"), "masterPortType")))objc_msgSend(v31, "insertObject:atIndex:", v15, 0); {
                else
                }
                  [v31 addObject:v15];
                uint64_t v12 = v28;
                uint64_t v11 = v30;
                uint64_t v13 = v33;
              }
              ++v13;
            }
            while (v13 != v11);
            uint64_t v11 = [obj countByEnumeratingWithState:&v42 objects:v49 count:16];
            uint64_t v9 = v31;
          }
          while (v11);
        }
        long long v36 = 0u;
        long long v37 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        id result = [v9 countByEnumeratingWithState:&v34 objects:v47 count:16];
        if (result)
        {
          uint64_t v22 = result;
          uint64_t v23 = *(void *)v35;
          do
          {
            uint64_t v24 = 0;
            do
            {
              if (*(void *)v35 != v23) {
                objc_enumerationMutation(v9);
              }
              uint64_t v25 = *(void **)(*((void *)&v34 + 1) + 8 * v24);
              [v7 enqueueInputForProcessing:v25 delegate:v6];
              objc_msgSend(v6[69], "setObject:forKeyedSubscript:", v25, objc_msgSend(v25, "portType"));
              ++v24;
            }
            while (v22 != v24);
            id result = [v9 countByEnumeratingWithState:&v34 objects:v47 count:16];
            uint64_t v22 = result;
          }
          while (result);
        }
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

void __74__BWUBNode__setupProcessingStateForDeepFusionWithSettings_processingPlan___block_invoke(uint64_t a1, const void *a2, uint64_t a3, uint64_t a4, int a5)
{
  if (!a5)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = [NSString stringWithFormat:@"buffer of type '%@' requested for '%@'", BWStillImageBufferTypeToShortString(a3), a4];
    -[BWUBNode _emitSampleBuffer:description:](v7, a2, v8);
  }
}

void __74__BWUBNode__setupProcessingStateForDeepFusionWithSettings_processingPlan___block_invoke_2(uint64_t a1)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 32) enqueueInputForProcessing:*(void *)(a1 + 40) delegate:*(void *)(a1 + 48)];
  uint64_t v2 = *(void **)(a1 + 40);
}

- (id)_processingOrderByPortTypeForSettings:(id *)result
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = (void *)[MEMORY[0x1E4F1CA48] array];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v5 = objc_msgSend((id)objc_msgSend(a2, "captureSettings", 0), "portTypes");
    uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
          if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureStreamSettingsForPortType:", v10), "hasValidFrames")&& objc_msgSend(v3[15], "containsObject:", v10))
          {
            if (objc_msgSend(v10, "isEqualToString:", objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "masterPortType")))objc_msgSend(v4, "insertObject:atIndex:", v10, 0); {
            else
            }
              [v4 addObject:v10];
          }
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
    return (id *)(id)[v4 copy];
  }
  return result;
}

void __82__BWUBNode__setupProcessingStateForSingleImageCaptureWithSettings_processingPlan___block_invoke(uint64_t a1, const void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  if (!_FigIsCurrentDispatchQueue())
  {
    uint64_t v17 = v5;
    LODWORD(v16) = 0;
    FigDebugAssert3();
  }
  id v11 = (id)objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 224), "objectForKeyedSubscript:", objc_msgSend(a4, "portType", v16, v17)), "firstObject");
  int v12 = a5;
  if (a2)
  {
    if (a5)
    {
      long long v13 = (void *)[*(id *)(*(void *)(a1 + 32) + 152) controllerForType:*(void *)(*(void *)(a1 + 32) + 208)];
      [v13 cancelProcessing];
      int v12 = objc_msgSend(v13, "enqueueInputForProcessing:delegate:processErrorRecoveryFrame:processOriginalImage:processToneMapping:processInferenceInputImage:clientBracketSequenceNumber:processSemanticRendering:provideInferenceInputImageForProcessing:processSmartStyleRenderingInput:inferencesAvailable:", v11, *(void *)(a1 + 32), 1, 0, 0, 0, 0);
    }
    else
    {
      int v12 = 0;
    }
    [v11 addFrame:a2];
    -[BWUBNode _handleReferenceFrameEmissionForProcessorInput:](*(void *)(a1 + 32), v11);
  }
  if (v12)
  {
    CFTypeRef v14 = CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E4F53070], 0);
    -[BWUBNode _processorControllerDidFinishProcessingInputForPortType:processorType:](*(void *)(a1 + 32), [v11 portType], *(void *)(*(void *)(a1 + 32) + 208));
    uint64_t v15 = *(void *)(a1 + 32);
    [NSString stringWithFormat:@"type '%@' requested for '%@'", BWStillImageBufferTypeToShortString(a3), a4];
    -[BWUBNode _emitError:processorInput:metadata:description:](v15, a5, a4, (uint64_t)v14);
  }
}

void __76__BWUBNode__setupProcessingStateForFlashCaptureWithSettings_processingPlan___block_invoke(uint64_t a1, const void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  if (!_FigIsCurrentDispatchQueue())
  {
    uint64_t v17 = v5;
    LODWORD(v16) = 0;
    FigDebugAssert3();
  }
  id v11 = (id)objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 224), "objectForKeyedSubscript:", objc_msgSend(a4, "portType", v16, v17)), "firstObject");
  int v12 = a5;
  if (a2)
  {
    if (a5)
    {
      long long v13 = (void *)[*(id *)(*(void *)(a1 + 32) + 152) controllerForType:*(void *)(*(void *)(a1 + 32) + 208)];
      [v13 cancelProcessing];
      int v12 = objc_msgSend(v13, "enqueueInputForProcessing:delegate:processErrorRecoveryFrame:processOriginalImage:processToneMapping:processInferenceInputImage:clientBracketSequenceNumber:processSemanticRendering:provideInferenceInputImageForProcessing:processSmartStyleRenderingInput:inferencesAvailable:", v11, *(void *)(a1 + 32), 1, 0, 0, 0, 0);
    }
    else
    {
      int v12 = 0;
    }
    [v11 addFrame:a2];
    -[BWUBNode _handleReferenceFrameEmissionForProcessorInput:](*(void *)(a1 + 32), v11);
  }
  if (v12)
  {
    CFTypeRef v14 = CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E4F53070], 0);
    -[BWUBNode _processorControllerDidFinishProcessingInputForPortType:processorType:](*(void *)(a1 + 32), [v11 portType], *(void *)(*(void *)(a1 + 32) + 208));
    uint64_t v15 = *(void *)(a1 + 32);
    [NSString stringWithFormat:@"type '%@' requested for '%@'", BWStillImageBufferTypeToShortString(a3), a4];
    -[BWUBNode _emitError:processorInput:metadata:description:](v15, a5, a4, (uint64_t)v14);
  }
}

void __76__BWUBNode__setupProcessingStateForFlashCaptureWithSettings_processingPlan___block_invoke_2(uint64_t a1, const void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  if (!_FigIsCurrentDispatchQueue()) {
    FigDebugAssert3();
  }
  if (dword_1EB4C5670)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (a5)
  {
    CFTypeRef v11 = CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E4F53070], 0);
    uint64_t v12 = *(void *)(a1 + 32);
    [NSString stringWithFormat:@"type '%@' requested for '%@'", BWStillImageBufferTypeToShortString(a3), a4];
    -[BWUBNode _emitError:processorInput:metadata:description:](v12, a5, a4, (uint64_t)v11);
  }
  else
  {
    long long v13 = -[BWUBNode _nextNRInputForPortType:](*(id **)(a1 + 32), [a4 portType]);
    [v13 addFrame:a2];
    -[BWUBNode _handleReferenceFrameEmissionForProcessorInput:](*(void *)(a1 + 32), v13);
  }
}

- (id)_nextNRInputForPortType:(id *)result
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    uint64_t v2 = objc_msgSend(result[28], "objectForKeyedSubscript:", a2, 0);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v9;
LABEL_4:
      uint64_t v6 = 0;
      while (1)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (![v7 receivedAllFrames]
          || [v7 remainingProcessingCount] > 1)
        {
          break;
        }
        if (v4 == ++v6)
        {
          uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
          uint64_t v7 = 0;
          if (v4) {
            goto LABEL_4;
          }
          return (id *)v7;
        }
      }
    }
    else
    {
      uint64_t v7 = 0;
    }
    return (id *)v7;
  }
  return result;
}

- (id)_bufferTypesExcludingErrorRecoveryTypesForCaptureSettings:(id)result
{
  if (result)
  {
    uint64_t v2 = result;
    uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithArray:", -[BWUBNode _bufferTypesForCaptureSettings:]((uint64_t)result, a2));
    objc_msgSend(v3, "removeObjectsInArray:", -[BWUBNode _errorRecoveryBufferTypesForBufferTypes:](v2, v3));
    uint64_t v4 = (void *)[v3 copy];
    return v4;
  }
  return result;
}

- (id)_errorRecoveryBufferTypesForBufferTypes:(id)result
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v3 = (void *)[MEMORY[0x1E4F1CA48] array];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v4 = [a2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (!v4) {
      return (id)[v3 copy];
    }
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    while (1)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(a2);
        }
        int v8 = [*(id *)(*((void *)&v11 + 1) + 8 * i) intValue];
        if (v8 <= 6)
        {
          if (v8 == 2)
          {
            long long v9 = &unk_1EFB03890;
          }
          else
          {
            if (v8 != 5) {
              continue;
            }
            long long v9 = &unk_1EFB038A8;
          }
          goto LABEL_18;
        }
        if (v8 == 7 || v8 == 13)
        {
          long long v9 = &unk_1EFB038C0;
LABEL_18:
          [v3 addObjectsFromArray:v9];
          continue;
        }
      }
      uint64_t v5 = [a2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (!v5) {
        return (id)[v3 copy];
      }
    }
  }
  return result;
}

void __147__BWUBNode__setupProcessingStateForIntelligentDistortionCorrectionIfNeededWithSettings_sequenceNumber_portType_queueProvidingInput_processingPlan___block_invoke(uint64_t a1, CFTypeRef cf, uint64_t a3, void *a4, uint64_t a5)
{
  block[16] = *MEMORY[0x1E4F143B8];
  if (dword_1EB4C5670)
  {
    int v27 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (a5)
  {
    if (a3 != 14)
    {
      uint64_t v28 = [NSNumber numberWithUnsignedLongLong:a3];
      objc_msgSend(a4, "addBypassedProcessorType:forBufferTypes:", 7, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v28, 1));
      CFTypeRef v11 = CMGetAttachment(cf, (CFStringRef)*MEMORY[0x1E4F53070], 0);
      uint64_t v12 = *(void *)(a1 + 32);
      [NSString stringWithFormat:@"type '%@' requested for '%@'", BWStillImageBufferTypeToShortString(a3), a4];
      -[BWUBNode _emitError:processorInput:metadata:description:](v12, a5, a4, (uint64_t)v11);
    }
  }
  else
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    uint64_t v22 = __147__BWUBNode__setupProcessingStateForIntelligentDistortionCorrectionIfNeededWithSettings_sequenceNumber_portType_queueProvidingInput_processingPlan___block_invoke_189;
    uint64_t v23 = &unk_1E5C28DD0;
    long long v13 = *(_OWORD *)(a1 + 32);
    long long v24 = v13;
    CFTypeRef v25 = cf;
    if (a3 == 13)
    {
      if (cf) {
        CFRetain(cf);
      }
      uint64_t v14 = objc_msgSend(a4, "portType", v18, v19);
      uint64_t v15 = *(void *)(a1 + 32);
      uint64_t v16 = *(NSObject **)(v15 + 160);
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __147__BWUBNode__setupProcessingStateForIntelligentDistortionCorrectionIfNeededWithSettings_sequenceNumber_portType_queueProvidingInput_processingPlan___block_invoke_2;
      v20[3] = &unk_1E5C28DF8;
      v20[4] = v15;
      v20[5] = v14;
      v20[6] = *(void *)(a1 + 48);
      v20[7] = v21;
      v20[8] = 13;
      v20[9] = cf;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __ubn_dispatch_async_block_invoke;
      block[3] = &unk_1E5C249F0;
      block[4] = v20;
      dispatch_async(v16, block);
    }
    else
    {
      uint64_t v17 = objc_msgSend(*(id *)(v13 + 424), "objectForKeyedSubscript:", objc_msgSend(a4, "portType"));
      [v17 setApplyZoom:v22(v21)];
      if ([v17 processIntelligentDistortionCorrection]
        && objc_msgSend(*(id *)(a1 + 48), "containsObject:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", a3)))
      {
        [v17 setProcessIntelligentDistortionCorrection:0];
      }
      objc_msgSend(v17, "addImage:imageBufferType:", cf, a3, v18, v19);
    }
  }
}

uint64_t __147__BWUBNode__setupProcessingStateForIntelligentDistortionCorrectionIfNeededWithSettings_sequenceNumber_portType_queueProvidingInput_processingPlan___block_invoke_189(void *a1)
{
  if (!_FigIsCurrentDispatchQueue())
  {
    uint64_t v6 = v1;
    LODWORD(v5) = 0;
    FigDebugAssert3();
  }
  if (!objc_msgSend(*(id *)(a1[4] + 472), "objectForKeyedSubscript:", a1[5], v5, v6)) {
    return 1;
  }
  BOOL v3 = +[BWDeepZoomProcessorControllerConfiguration doDeepZoomStandardOrLiteForSampleBuffer:type:sensorConfiguration:intermediateZoomSrcRectOut:intermediateZoomDstRectOut:](BWDeepZoomProcessorControllerConfiguration, "doDeepZoomStandardOrLiteForSampleBuffer:type:sensorConfiguration:intermediateZoomSrcRectOut:intermediateZoomDstRectOut:", a1[6], [*(id *)(a1[4] + 464) type], objc_msgSend((id)-[BWUBNodeConfiguration sensorConfigurationsByPortType](*(void *)(a1[4] + 112)), "objectForKeyedSubscript:", a1[5]), 0, 0);
  return +[BWDeepZoomProcessorControllerConfiguration deepZoomProcessingModeForType:sensorConfiguration:](BWDeepZoomProcessorControllerConfiguration, "deepZoomProcessingModeForType:sensorConfiguration:", [*(id *)(a1[4] + 464) type], objc_msgSend((id)-[BWUBNodeConfiguration sensorConfigurationsByPortType](*(void *)(a1[4] + 112)), "objectForKeyedSubscript:", a1[5])) == 2|| !v3;
}

void __147__BWUBNode__setupProcessingStateForIntelligentDistortionCorrectionIfNeededWithSettings_sequenceNumber_portType_queueProvidingInput_processingPlan___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 424) objectForKeyedSubscript:*(void *)(a1 + 40)];
  [v2 setApplyZoom:(*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))()];
  if ([v2 processIntelligentDistortionCorrection]
    && objc_msgSend(*(id *)(a1 + 48), "containsObject:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", *(void *)(a1 + 64))))
  {
    [v2 setProcessIntelligentDistortionCorrection:0];
  }
  [v2 addImage:*(void *)(a1 + 72) imageBufferType:*(void *)(a1 + 64)];
  BOOL v3 = *(const void **)(a1 + 72);
  if (v3)
  {
    CFRelease(v3);
  }
}

void __116__BWUBNode__setupProcessingStateForDeepZoomWithSettings_sequenceNumber_portType_queueProvidingInput_processingPlan___block_invoke(uint64_t a1, CFTypeRef cf, uint64_t a3, void *a4, uint64_t a5)
{
  block[16] = *MEMORY[0x1E4F143B8];
  if (dword_1EB4C5670)
  {
    int v20 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (a5)
  {
    uint64_t v21 = [NSNumber numberWithUnsignedLongLong:a3];
    objc_msgSend(a4, "addBypassedProcessorType:forBufferTypes:", 10, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v21, 1));
    CFTypeRef v11 = CMGetAttachment(cf, (CFStringRef)*MEMORY[0x1E4F53070], 0);
    uint64_t v12 = *(void *)(a1 + 32);
    [NSString stringWithFormat:@"type '%@' requested for '%@'", BWStillImageBufferTypeToShortString(a3), a4];
    -[BWUBNode _emitError:processorInput:metadata:description:](v12, a5, a4, (uint64_t)v11);
  }
  else
  {
    if (cf) {
      CFRetain(cf);
    }
    long long v13 = *(_OWORD *)(a1 + 32);
    uint64_t v14 = *(NSObject **)(*(void *)(a1 + 32) + 160);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __116__BWUBNode__setupProcessingStateForDeepZoomWithSettings_sequenceNumber_portType_queueProvidingInput_processingPlan___block_invoke_200;
    v15[3] = &unk_1E5C27F38;
    long long v16 = v13;
    CFTypeRef v17 = cf;
    uint64_t v18 = a3;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __ubn_dispatch_async_block_invoke;
    block[3] = &unk_1E5C249F0;
    block[4] = v15;
    dispatch_async(v14, block);
  }
}

void __116__BWUBNode__setupProcessingStateForDeepZoomWithSettings_sequenceNumber_portType_queueProvidingInput_processingPlan___block_invoke_200(void *a1)
{
  objc_msgSend((id)objc_msgSend(*(id *)(a1[4] + 472), "objectForKeyedSubscript:", a1[5]), "addSampleBuffer:bufferType:", a1[6], a1[7]);
  uint64_t v2 = (const void *)a1[6];
  if (v2)
  {
    CFRelease(v2);
  }
}

uint64_t __67__BWUBNode__setupProcessingStateForInferenceWithSettings_portType___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancelProcessing];
}

void __67__BWUBNode__setupProcessingStateForInferenceWithSettings_portType___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  BOOL v3 = *(const void **)(v2 + 360);
  if (v3)
  {
    CFRelease(v3);
    *(void *)(*(void *)(a1 + 32) + 360) = 0;
    uint64_t v2 = *(void *)(a1 + 32);
  }

  *(void *)(*(void *)(a1 + 32) + 352) = 0;
}

void __67__BWUBNode__setupProcessingStateForInferenceWithSettings_portType___block_invoke_3(uint64_t a1, const void *a2, uint64_t a3, void *a4)
{
  v54[5] = *MEMORY[0x1E4F143B8];
  if (!_FigIsCurrentDispatchQueue())
  {
    uint64_t v38 = v4;
    LODWORD(v37) = 0;
    FigDebugAssert3();
  }
  uint64_t v8 = *(void *)(a1 + 32);
  long long v9 = *(const void **)(v8 + 360);
  *(void *)(v8 + 360) = a2;
  if (a2) {
    CFRetain(a2);
  }
  if (v9) {
    CFRelease(v9);
  }
  v54[0] = @"PersonSemanticsSkin";
  v54[1] = @"PersonSemanticsHair";
  v54[2] = 0x1EFA745A0;
  v54[3] = 0x1EFA74420;
  v54[4] = 0x1EFA6A200;
  long long v10 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v54, 5, v37, v38), "arrayByAddingObjectsFromArray:", BWInferenceLowResPersonInstanceMaskKeys());
  CFTypeRef v11 = objc_msgSend((id)CMGetAttachment(a2, @"StillSettings", 0), "captureSettings");
  if (-[BWUBNodeConfiguration semanticStyleRenderingEnabled](*(void *)(*(void *)(a1 + 32) + 112)))
  {
    id v12 = (id)objc_msgSend((id)objc_msgSend(v11, "metadata"), "smartCamInferences");
    if (!v12) {
      id v12 = +[BWInferenceEngineController smartCameraClassificationsFromSbuf:a2];
    }
    objc_msgSend((id)objc_msgSend(v11, "metadata"), "setSmartCamInferences:", v12);
    if (objc_msgSend((id)objc_msgSend(v11, "metadata"), "smartCamInferences")) {
      objc_msgSend((id)objc_msgSend(v11, "metadata"), "calculateSemanticStyleSceneType");
    }
  }
  id v39 = +[BWInferenceEngineController faceObservationsFromSbuf:a2];
  long long v13 = (void *)[MEMORY[0x1E4F1CA48] array];
  uint64_t v14 = a4;
  uint64_t v15 = -[BWUBNode _inferenceAttachedMediaRequiredForDemosaicedRawCaptureWithInferenceOutputSampleBuffer:stillImageSettings:](*(uint64_t **)(a1 + 32), a2, (void *)[a4 stillImageSettings]);
  if ([v15 count]) {
    [v13 addObjectsFromArray:v15];
  }
  uint64_t v16 = *(void *)(a1 + 32);
  CFTypeRef v17 = (void *)[a4 stillImageSettings];
  uint64_t v19 = (void *)-[BWUBNode _inferenceAttachedMediaRequiredForDepthProcessing:stillImageSettings:](v16, v18, v17);
  if ([v19 count]) {
    [v13 addObjectsFromArray:v19];
  }
  int v20 = &OBJC_INSTANCE_METHODS_FigWeakReference;
  if (*(unsigned char *)(a1 + 40))
  {
    if ([v13 count])
    {
      uint64_t v21 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
      int v22 = [v13 containsObject:@"PersonSemanticsSkin"];
      uint64_t v23 = (CFStringRef *)MEMORY[0x1E4F55B88];
      if (v22)
      {
        CFTypeRef v24 = CMGetAttachment(+[BWInferenceEngineController inferenceMaskSbufFromSbuf:a2 attachedMediaKey:@"PersonSemanticsSkin"], (CFStringRef)*MEMORY[0x1E4F55B88], 0);
        if (v24) {
          [v21 setObject:v24 forKeyedSubscript:@"PersonSemanticsSkin"];
        }
      }
      if ([v13 containsObject:0x1EFA745A0])
      {
        CFTypeRef v25 = CMGetAttachment(+[BWInferenceEngineController inferenceMaskSbufFromSbuf:a2 attachedMediaKey:0x1EFA745A0], *v23, 0);
        if (v25) {
          [v21 setObject:v25 forKeyedSubscript:0x1EFA745A0];
        }
      }
      if ([v13 containsObject:0x1EFA74420])
      {
        uint64_t v26 = +[BWInferenceEngineController inferenceMaskSbufFromSbuf:a2 attachedMediaKey:0x1EFA74420];
        CFTypeRef v27 = CMGetAttachment(v26, (CFStringRef)*MEMORY[0x1E4F55B80], 0);
        if (v27) {
          [v21 setObject:v27 forKeyedSubscript:0x1EFA74420];
        }
      }
      if ([v21 count]) {
        uint64_t v28 = v21;
      }
      else {
        uint64_t v28 = 0;
      }
    }
    else
    {
      uint64_t v28 = 0;
    }

    *(void *)(*(void *)(a1 + 32) + 352) = objc_alloc_init(BWStillImageInferences);
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    uint64_t v29 = [v10 countByEnumeratingWithState:&v48 objects:v53 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v49;
      do
      {
        for (uint64_t i = 0; i != v30; ++i)
        {
          if (*(void *)v49 != v31) {
            objc_enumerationMutation(v10);
          }
          objc_msgSend(*(id *)(*(void *)(a1 + 32) + 352), "addInferenceBuffer:metadata:inferenceAttachedMediaKey:", +[BWInferenceEngineController inferenceMaskFromSbuf:attachedMediaKey:](BWInferenceEngineController, "inferenceMaskFromSbuf:attachedMediaKey:", a2, *(void *)(*((void *)&v48 + 1) + 8 * i)), 0, *(void *)(*((void *)&v48 + 1) + 8 * i));
        }
        uint64_t v30 = [v10 countByEnumeratingWithState:&v48 objects:v53 count:16];
      }
      while (v30);
    }
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 352), "addInference:inferenceAttachmentKey:", +[BWInferenceEngineController lowResPersonInstanceConfidencesFromSbuf:](BWInferenceEngineController, "lowResPersonInstanceConfidencesFromSbuf:", a2), 0x1EFA6A380);
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 352), "addInference:inferenceAttachmentKey:", +[BWInferenceEngineController lowResPersonInstanceBoundingBoxesFromSbuf:](BWInferenceEngineController, "lowResPersonInstanceBoundingBoxesFromSbuf:", a2), 0x1EFA6A3A0);
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 352), "addInference:inferenceAttachmentKey:", +[BWInferenceEngineController skinToneClassificationsFromSbuf:](BWInferenceEngineController, "skinToneClassificationsFromSbuf:", a2), 0x1EFA6A1A0);
    [*(id *)(*(void *)(a1 + 32) + 352) addInference:v39 inferenceAttachmentKey:0x1EFA6A0A0];
    if (v28) {
      [*(id *)(*(void *)(a1 + 32) + 352) addInferenceAttachedMediaMetadata:v28];
    }
    uint64_t v14 = a4;
    int v20 = &OBJC_INSTANCE_METHODS_FigWeakReference;
    if (objc_msgSend(*(id *)(*(void *)(a1 + 32) + 272), "objectForKeyedSubscript:", objc_msgSend(a4, "portType")))
    {
      uint64_t v33 = *(void *)(a1 + 32);
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __67__BWUBNode__setupProcessingStateForInferenceWithSettings_portType___block_invoke_4;
      v47[3] = &unk_1E5C24458;
      v47[4] = v33;
      v47[5] = a4;
      -[BWUBNode _deepFusionDispatch:direction:block:](v33, 2, 2, (uint64_t)v47);
    }
  }
  if (*(unsigned char *)(a1 + 41))
  {
    CFTypeRef v34 = (CFTypeRef)[v14 propagationImage];
    if (v34) {
      CFTypeRef v34 = CFRetain(v34);
    }
    uint64_t v35 = *(void *)(a1 + 32);
    long long v36 = *(NSObject **)(v35 + 160);
    uint64_t v40 = MEMORY[0x1E4F143A8];
    __objc2_meth_list v41 = v20[80];
    long long v42 = __67__BWUBNode__setupProcessingStateForInferenceWithSettings_portType___block_invoke_5;
    long long v43 = &unk_1E5C249A0;
    long long v45 = v14;
    CFTypeRef v46 = v34;
    uint64_t v44 = v35;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = v41;
    block[2] = __ubn_dispatch_async_block_invoke;
    block[3] = &unk_1E5C249F0;
    block[4] = &v40;
    dispatch_async(v36, block);
  }
}

- (uint64_t)_inferenceAttachedMediaRequiredForDepthProcessing:(void *)a3 stillImageSettings:
{
  if (!a1 || (objc_msgSend((id)objc_msgSend(a3, "captureSettings"), "captureFlags") & 0x800) == 0) {
    return 0;
  }
  uint64_t v4 = (void *)-[BWUBNodeConfiguration providedInferenceAttachedMediaByMode](*(void *)(a1 + 112));
  return [v4 objectForKeyedSubscript:&unk_1EFB00098];
}

uint64_t __67__BWUBNode__setupProcessingStateForInferenceWithSettings_portType___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 272), "objectForKeyedSubscript:", objc_msgSend(*(id *)(a1 + 40), "portType"));
  return [v1 allInferencesDelivered];
}

void __67__BWUBNode__setupProcessingStateForInferenceWithSettings_portType___block_invoke_5(uint64_t a1)
{
  id v2 = -[BWUBNode _ubRERRouter](*(id *)(a1 + 32));
  (*((void (**)(id, void, uint64_t, void, void))v2 + 2))(v2, *(void *)(a1 + 48), 1, *(void *)(a1 + 40), 0);
  BOOL v3 = *(const void **)(a1 + 48);
  if (v3)
  {
    CFRelease(v3);
  }
}

uint64_t __67__BWUBNode__setupProcessingStateForInferenceWithSettings_portType___block_invoke_210(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) enqueueInputForProcessing:*(void *)(a1 + 40) delegate:*(void *)(a1 + 48)];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = result;
  return result;
}

uint64_t __96__BWUBNode__setupProcessingStateForDisparityIfNeededWithSettings_sequenceNumber_processingPlan___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) enqueueInputForProcessing:*(void *)(a1 + 40) delegate:*(void *)(a1 + 48)];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = result;
  return result;
}

void __87__BWUBNode__setupProcessingStateForJasperDisparityIfNeededWithSettings_processingPlan___block_invoke(uint64_t a1, const void *a2, uint64_t a3, void *a4)
{
  uint64_t v7 = [a4 portType];
  if (!_FigIsCurrentDispatchQueue()) {
    FigDebugAssert3();
  }
  if (a3 == 13)
  {
    if (a2) {
      CFRetain(a2);
    }
    uint64_t v8 = *(void *)(a1 + 32);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __87__BWUBNode__setupProcessingStateForJasperDisparityIfNeededWithSettings_processingPlan___block_invoke_2;
    v11[3] = &unk_1E5C28E98;
    v11[4] = v8;
    void v11[5] = v7;
    v11[7] = a2;
    v11[8] = 13;
    void v11[6] = *(void *)(a1 + 40);
    -[BWUBNode _deepFusionDispatch:direction:block:](v8, 2, 3, (uint64_t)v11);
  }
  else if (a2)
  {
    long long v9 = (void *)[*(id *)(*(void *)(a1 + 32) + 568) objectForKeyedSubscript:v7];
    [v9 setColorBuffer:a2 type:a3];
  }
  else
  {
    long long v10 = *(void **)(a1 + 40);
    [v10 cancelProcessing];
  }
}

void __87__BWUBNode__setupProcessingStateForJasperDisparityIfNeededWithSettings_processingPlan___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 56)) {
    objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 568), "objectForKeyedSubscript:", *(void *)(a1 + 40)), "setColorBuffer:type:", *(void *)(a1 + 56), *(void *)(a1 + 64));
  }
  else {
    [*(id *)(a1 + 48) cancelProcessing];
  }
  id v2 = *(const void **)(a1 + 56);
  if (v2)
  {
    CFRelease(v2);
  }
}

void __87__BWUBNode__setupProcessingStateForPointCloudDepthIfNeededWithSettings_processingPlan___block_invoke(uint64_t a1, const void *a2, uint64_t a3, void *a4)
{
  uint64_t v7 = [a4 portType];
  if (!_FigIsCurrentDispatchQueue()) {
    FigDebugAssert3();
  }
  if (a3 == 13)
  {
    if (a2) {
      CFRetain(a2);
    }
    uint64_t v8 = *(void *)(a1 + 32);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __87__BWUBNode__setupProcessingStateForPointCloudDepthIfNeededWithSettings_processingPlan___block_invoke_2;
    v11[3] = &unk_1E5C28E98;
    v11[4] = v8;
    void v11[5] = v7;
    v11[7] = a2;
    v11[8] = 13;
    void v11[6] = *(void *)(a1 + 40);
    -[BWUBNode _deepFusionDispatch:direction:block:](v8, 2, 3, (uint64_t)v11);
  }
  else if (a2)
  {
    long long v9 = (void *)[*(id *)(*(void *)(a1 + 32) + 552) objectForKeyedSubscript:v7];
    [v9 setColorBuffer:a2 type:a3];
  }
  else
  {
    long long v10 = *(void **)(a1 + 40);
    [v10 cancelProcessing];
  }
}

void __87__BWUBNode__setupProcessingStateForPointCloudDepthIfNeededWithSettings_processingPlan___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 56)) {
    objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 552), "objectForKeyedSubscript:", *(void *)(a1 + 40)), "setColorBuffer:type:", *(void *)(a1 + 56), *(void *)(a1 + 64));
  }
  else {
    [*(id *)(a1 + 48) cancelProcessing];
  }
  id v2 = *(const void **)(a1 + 56);
  if (v2)
  {
    CFRelease(v2);
  }
}

void __31__BWUBNode__nrOutputSbufRouter__block_invoke(uint64_t a1, const void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  if (!_FigIsCurrentDispatchQueue())
  {
    uint64_t v35 = v5;
    LODWORD(v34) = 0;
    FigDebugAssert3();
  }
  if (dword_1EB4C5670)
  {
    unsigned int v42 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (a5)
  {
    CFTypeRef v12 = CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E4F53070], 0);
    uint64_t v13 = *(void *)(a1 + 32);
    [NSString stringWithFormat:@"type '%@' requested for '%@'", BWStillImageBufferTypeToShortString(a3), a4];
    -[BWUBNode _emitError:processorInput:metadata:description:](v13, a5, a4, (uint64_t)v12);
  }
  else if ((a3 == 7 {
          || (int v14 = objc_msgSend((id)objc_msgSend(a4, "captureSettings"), "deliverDeferredPhotoProxyImage"), a3 == 14)
  }
          && v14)
         && (uint64_t v15 = *(void *)(a1 + 32), *(void *)(v15 + 584)))
  {
    uint64_t v16 = *(const void **)(v15 + 592);
    if (v16)
    {
      CFRelease(v16);
      *(void *)(*(void *)(a1 + 32) + 592) = 0;
    }
    if (a2) {
      CFTypeRef v17 = CFRetain(a2);
    }
    else {
      CFTypeRef v17 = 0;
    }
    *(void *)(*(void *)(a1 + 32) + 592) = v17;
    if (dword_1EB4C5670)
    {
      unsigned int v42 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      uint64_t v31 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 584), "proxyReadyWithFPNREnabled:", 0, v34, v35);
  }
  else
  {
    if (objc_msgSend(a4, "isMaster", v34, v35) && (a3 == 6 || a3 == 3))
    {
      uint64_t v18 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 232), "objectForKeyedSubscript:", objc_msgSend(a4, "portType"));
      if (v18) {
        objc_msgSend((id)CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E4F53070], 0), "setObject:forKeyedSubscript:", v18, *MEMORY[0x1E4F542D8]);
      }
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      uint64_t v19 = (void *)[*(id *)(*(void *)(a1 + 32) + 224) allValues];
      uint64_t v20 = [v19 countByEnumeratingWithState:&v37 objects:v43 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v38;
        do
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v38 != v22) {
              objc_enumerationMutation(v19);
            }
            CFTypeRef v24 = (void *)[*(id *)(*((void *)&v37 + 1) + 8 * i) firstObject];
            [v24 setEmitErrorRecoveryFrame:1];
            -[BWUBNode _handleReferenceFrameEmissionForProcessorInput:](*(void *)(a1 + 32), v24);
          }
          uint64_t v21 = [v19 countByEnumeratingWithState:&v37 objects:v43 count:16];
        }
        while (v21);
      }
    }
    int v25 = -[BWUBNode _waitForInferenceIfNeededForProcessorInput:](*(void *)(a1 + 32), a4);
    uint64_t v26 = *(void *)(a1 + 32);
    if (v25 && *(void *)(v26 + 360))
    {
      if (dword_1EB4C5670)
      {
        unsigned int v42 = 0;
        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
        CFTypeRef v27 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        unsigned int v28 = v42;
        if (os_log_type_enabled(v27, type)) {
          unsigned int v29 = v28;
        }
        else {
          unsigned int v29 = v28 & 0xFFFFFFFE;
        }
        if (v29)
        {
          uint64_t v30 = BWStillImageBufferTypeToShortString(a3);
          int v44 = 136315650;
          long long v45 = "-[BWUBNode _nrOutputSbufRouter]_block_invoke";
          __int16 v46 = 2112;
          uint64_t v47 = v30;
          __int16 v48 = 2112;
          long long v49 = a4;
          _os_log_send_and_compose_impl();
        }
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        uint64_t v26 = *(void *)(a1 + 32);
      }
      uint64_t v32 = *(NSObject **)(v26 + 320);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __31__BWUBNode__nrOutputSbufRouter__block_invoke_268;
      block[3] = &unk_1E5C249A0;
      void block[5] = a4;
      block[6] = a2;
      block[4] = v26;
      dispatch_sync(v32, block);
      uint64_t v26 = *(void *)(a1 + 32);
    }
    uint64_t v33 = [NSString stringWithFormat:@"buffer of type '%@' requested for '%@'", BWStillImageBufferTypeToShortString(a3), a4];
    -[BWUBNode _emitSampleBuffer:description:](v26, a2, v33);
  }
}

uint64_t __31__BWUBNode__nrOutputSbufRouter__block_invoke_268(uint64_t a1)
{
  ubn_mergeInferenceMetadata(*(const void **)(*(void *)(a1 + 32) + 360), *(const void **)(a1 + 48), *(const void **)(a1 + 48));
  id v2 = (void *)[MEMORY[0x1E4F1CA48] array];
  BOOL v3 = -[BWUBNode _inferenceAttachedMediaRequiredForDemosaicedRawCaptureWithInferenceOutputSampleBuffer:stillImageSettings:](*(uint64_t **)(a1 + 32), *(const void **)(*(void *)(a1 + 32) + 360), (void *)[*(id *)(a1 + 40) stillImageSettings]);
  if ([v3 count]) {
    [v2 addObjectsFromArray:v3];
  }
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = (void *)[*(id *)(a1 + 40) stillImageSettings];
  uint64_t v7 = (void *)-[BWUBNode _inferenceAttachedMediaRequiredForDepthProcessing:stillImageSettings:](v4, v6, v5);
  if ([v7 count]) {
    [v2 addObjectsFromArray:v7];
  }
  uint64_t result = [v2 count];
  if (result)
  {
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 360);
    long long v10 = *(const void **)(a1 + 48);
    return ubn_mergeInferenceAttachedMedia(v9, v2, v10);
  }
  return result;
}

void __35__BWUBNode__ubInferenceInputRouter__block_invoke(uint64_t a1, const void *a2, uint64_t a3, void *a4)
{
  if (!_FigIsCurrentDispatchQueue())
  {
    uint64_t v18 = v4;
    LODWORD(v17) = 0;
    FigDebugAssert3();
  }
  uint64_t v8 = objc_msgSend(a4, "portType", v17, v18);
  if (-[BWUBNode _setupProcessingStateForInferenceWithSettings:portType:](*(void *)(a1 + 32), (void *)[a4 stillImageSettings], v8)|| (uint64_t v9 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 312), "objectForKeyedSubscript:", v8)) == 0)
  {
    uint64_t v16 = objc_msgSend((id)objc_msgSend(a4, "stillImageSettings"), "captureSettings");
    if ([v16 captureType] == 12)
    {
      [v16 deliverDeferredPhotoProxyImage];
    }
  }
  else
  {
    long long v10 = (void *)v9;
    char v11 = -[BWUBNode _isSemanticRenderingCapture:](*(void *)(a1 + 32), (void *)[a4 stillImageSettings]);
    int v12 = -[BWUBNode _isSemanticStylesCaptureNeedingInferencesWithSettings:](*(void *)(a1 + 32), (void *)[a4 stillImageSettings]);
    if (((v11 & 1) != 0 || v12)
      && !+[BWInferenceEngine isNeuralEngineSupported]
      && (objc_msgSend((id)objc_msgSend((id)CMGetAttachment(a2, @"StillSettings", 0), "captureSettings"), "captureFlags") & 0x2000) != 0&& (BWSampleBufferHasDetectedFaces(a2, 0, 0, 0, 1, 0) & 1) == 0)
    {
      objc_msgSend(v10, "setEnabledVisionInferences:", objc_msgSend(v10, "enabledVisionInferences") ^ 0x13);
    }
    if (a2) {
      CFRetain(a2);
    }
    uint64_t v13 = *(void *)(a1 + 32);
    int v14 = *(NSObject **)(v13 + 328);
    uint64_t v15 = *(NSObject **)(v13 + 320);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __35__BWUBNode__ubInferenceInputRouter__block_invoke_2;
    v19[3] = &unk_1E5C24F10;
    v19[4] = v10;
    v19[5] = a2;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __ubn_dispatch_group_async_block_invoke;
    block[3] = &unk_1E5C249F0;
    block[4] = v19;
    dispatch_group_async(v14, v15, block);
  }
}

void __35__BWUBNode__ubInferenceInputRouter__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) addInferenceImage:*(void *)(a1 + 40)];
  id v2 = *(const void **)(a1 + 40);
  if (v2)
  {
    CFRelease(v2);
  }
}

void __24__BWUBNode__ubRERRouter__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  block[16] = *MEMORY[0x1E4F143B8];
  if (!_FigIsCurrentDispatchQueue())
  {
    uint64_t v14 = v4;
    LODWORD(v12) = 0;
    FigDebugAssert3();
  }
  id v8 = (id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 408), "objectForKeyedSubscript:", objc_msgSend(a4, "portType", v12, v14));
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3052000000;
  uint64_t v20 = __Block_byref_object_copy__25;
  uint64_t v21 = __Block_byref_object_dispose__25;
  uint64_t v22 = 0;
  if (![v8 faceObservations])
  {
    uint64_t v9 = *(void *)(a1 + 32);
    long long v10 = *(NSObject **)(v9 + 320);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __24__BWUBNode__ubRERRouter__block_invoke_2;
    v16[3] = &unk_1E5C246B8;
    v16[4] = v9;
    v16[5] = &v17;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __ubn_dispatch_sync_block_invoke;
    block[3] = &unk_1E5C249F0;
    block[4] = v16;
    dispatch_sync(v10, block);
  }
  if (dword_1EB4C5670)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(v8, "addFrame:faceObservations:", a2, v18[5], v13, v15);
  _Block_object_dispose(&v17, 8);
}

id __24__BWUBNode__ubRERRouter__block_invoke_2(uint64_t a1)
{
  id result = (id)[*(id *)(*(void *)(a1 + 32) + 352) inferenceForAttachmentKey:0x1EFA6A0A0];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

void __53__BWUBNode__standardNROutputRouterWithExpectedQueue___block_invoke(uint64_t a1, opaqueCMSampleBuffer *a2, uint64_t a3, void *a4, uint64_t a5)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (!_FigIsCurrentDispatchQueue()) {
    FigDebugAssert3();
  }
  int v9 = -[BWUBNode _waitForInferenceIfNeededForProcessorInput:](*(void *)(a1 + 40), a4);
  uint64_t v10 = *(void *)(a1 + 40);
  if (v9 && *(void *)(v10 + 360))
  {
    if (dword_1EB4C5670)
    {
      int v33 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      uint64_t v10 = *(void *)(a1 + 40);
    }
    uint64_t v13 = *(NSObject **)(v10 + 320);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__BWUBNode__standardNROutputRouterWithExpectedQueue___block_invoke_270;
    block[3] = &unk_1E5C249A0;
    void block[5] = a4;
    block[6] = a2;
    block[4] = v10;
    dispatch_sync(v13, block);
  }
  else if (*(void *)(v10 + 352) && [*(id *)(v10 + 112) deferredPhotoProcessorEnabled])
  {
    if (dword_1EB4C5670)
    {
      int v33 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      uint64_t v12 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    uint64_t v14 = (void *)[(id)-[BWUBNodeConfiguration providedInferenceAttachedMediaByMode](*(void *)(*(void *)(a1 + 40)+ 112)) objectForKeyedSubscript:&unk_1EFB00080];
    if ([v14 count])
    {
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v27 objects:v34 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v28;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v28 != v17) {
              objc_enumerationMutation(v14);
            }
            BWPropagateInferenceAttachedMedia(*(void **)(*(void *)(a1 + 40) + 352), *(void **)(*((void *)&v27 + 1) + 8 * i), (CFTypeRef *)(*(void *)(a1 + 40) + 384), a2);
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v27 objects:v34 count:16];
        }
        while (v16);
      }
    }
  }
  if (FigCaptureSushiRawDNGDictionaryCreatedInGraph()
    && FigCapturePixelFormatIsBayerRaw(objc_msgSend((id)objc_msgSend(a4, "settings"), "rawOutputFormat")))
  {
    unsigned int v19 = objc_msgSend((id)objc_msgSend(a4, "settings"), "outputWidth");
    uint64_t v20 = objc_msgSend((id)objc_msgSend(a4, "settings"), "outputHeight");
    BOOL v21 = objc_msgSend((id)objc_msgSend((id)CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E4F53070], 0), "objectForKeyedSubscript:", *MEMORY[0x1E4F53328]), "intValue") != 0;
    -[BWUBNode _propagateSushiRawDNGDictionaryWithOutputSampleBuffer:requestedDimensions:requiresGDCInformation:](*(void *)(a1 + 40), a2, v19 | (unint64_t)(v20 << 32), v21);
  }
  if (a5)
  {
    CFTypeRef v22 = CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E4F53070], 0);
    uint64_t v23 = *(void *)(a1 + 40);
    [NSString stringWithFormat:@"type '%@' requested for '%@'", BWStillImageBufferTypeToShortString(a3), a4];
    -[BWUBNode _emitError:processorInput:metadata:description:](v23, a5, a4, (uint64_t)v22);
  }
  else
  {
    uint64_t v24 = *(void *)(a1 + 40);
    uint64_t v25 = [NSString stringWithFormat:@"buffer of type '%@' requested for '%@'", BWStillImageBufferTypeToShortString(a3), a4];
    -[BWUBNode _emitSampleBuffer:description:](v24, a2, v25);
  }
}

uint64_t __53__BWUBNode__standardNROutputRouterWithExpectedQueue___block_invoke_270(uint64_t a1)
{
  ubn_mergeInferenceMetadata(*(const void **)(*(void *)(a1 + 32) + 360), *(const void **)(a1 + 48), *(const void **)(a1 + 48));
  id v2 = (void *)[MEMORY[0x1E4F1CA48] array];
  BOOL v3 = -[BWUBNode _inferenceAttachedMediaRequiredForDemosaicedRawCaptureWithInferenceOutputSampleBuffer:stillImageSettings:](*(uint64_t **)(a1 + 32), *(const void **)(*(void *)(a1 + 32) + 360), (void *)[*(id *)(a1 + 40) stillImageSettings]);
  if ([v3 count]) {
    [v2 addObjectsFromArray:v3];
  }
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = (void *)[*(id *)(a1 + 40) stillImageSettings];
  uint64_t v7 = (void *)-[BWUBNode _inferenceAttachedMediaRequiredForDepthProcessing:stillImageSettings:](v4, v6, v5);
  if ([v7 count]) {
    [v2 addObjectsFromArray:v7];
  }
  uint64_t result = [v2 count];
  if (result)
  {
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 360);
    uint64_t v10 = *(const void **)(a1 + 48);
    return ubn_mergeInferenceAttachedMedia(v9, v2, v10);
  }
  return result;
}

void __29__BWUBNode__releaseResources__block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 128) = 0;
}

@end