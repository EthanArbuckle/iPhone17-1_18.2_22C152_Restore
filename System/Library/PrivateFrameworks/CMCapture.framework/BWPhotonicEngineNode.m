@interface BWPhotonicEngineNode
+ (void)initialize;
- ($2825F4736939C4A6D3AD43837233062D)processorController:(id)a3 outputPixelBufferDimensionsForProcessorInput:(id)a4 type:(unint64_t)a5 attachedMediaKey:(id)a6;
- (BOOL)_generateDisparityForSettings:(BOOL)result;
- (BOOL)_infoForCaptureType:(unsigned char *)a3 isSupportedCaptureTypeOut:(char *)a4 isFusionCaptureTypeOut:;
- (BOOL)_isSemanticStylesCaptureNeedingInferencesWithSettings:(BOOL)result;
- (BOOL)_processingNeededForSettings:(uint64_t)a3 portType:;
- (BOOL)_requiresResizedOutputDimensionsWithInputWidth:(uint64_t)a3 inputHeight:;
- (BOOL)_shouldPassthroughWithStillImageSettings:(BOOL)result;
- (BOOL)demosaicedRawSupportedForCaptureType:(int)a3;
- (BOOL)idcSupportedForCaptureType:(int)a3 captureFlags:(unint64_t)a4 portType:(id)a5;
- (BOOL)processingOnBeginMomentSupportedForCaptureSettings:(id)a3;
- (BOOL)rawNightModeSupportedForPortType:(id)a3;
- (BWNodeInput)pointCloudInput;
- (BWNodeInput)sensorRawInput;
- (BWPhotoEncoderController)photoEncoderController;
- (BWPhotonicEngineNode)initWithNodeConfiguration:(id)a3 captureDevice:(id)a4;
- (BWVideoFormatRequirements)_demosaicedRawFormatRequirementsWithDimensions:(int)a3 colorSpaceProperties:;
- (__CVBuffer)_newOutputPixelBufferForProcessorController:(uint64_t)a3 processorInput:(uint64_t)a4 type:(void *)a5 pixelBufferProvider:;
- (__CVBuffer)processorController:(id)a3 newOutputPixelBufferForProcessorInput:(id)a4 type:(unint64_t)a5;
- (__CVBuffer)processorController:(id)a3 newOutputPixelBufferForProcessorInput:(id)a4 type:(unint64_t)a5 attachedMediaKey:(id)a6;
- (__CVBuffer)processorController:(id)a3 newOutputPixelBufferForProcessorInput:(id)a4 type:(unint64_t)a5 attachedMediaKey:(id)a6 pixelFormat:(unsigned int)a7 dimensions:(id)a8;
- (__CVBuffer)processorController:(id)a3 newOutputPixelBufferForProcessorInput:(id)a4 type:(unint64_t)a5 dimensions:(id)a6;
- (char)_pixelBufferProviderForProcessorController:(void *)a3 processorInput:(uint64_t)a4 type:(uint64_t)a5 dimensions:(__CFString *)a6 attachedMediaKey:;
- (id)_attemptPiecemealEncodingOfAuxImagesForSmartStylesCaptureWithSampleBuffer:(void *)a3 portType:;
- (id)_bufferTypesExcludingErrorRecoveryTypesForCaptureSettings:(id)result;
- (id)_bufferTypesForCaptureSettings:(uint64_t)a1;
- (id)_errorRecoveryBufferTypesForBufferTypes:(id)result;
- (id)_nextNRInputForPortType:(id *)result;
- (id)_nrfOutputSbufRouter;
- (id)_processingOrderByPortTypeForSettings:(id)result;
- (id)_processorControllersForSharedExternalMemoryResource;
- (id)_setupProcessorControllerConfigurations;
- (id)_softISPFusionCaptureOutputSbufRouter;
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
- (int)processorController:(id)a3 processRawErrorRecoveryFrameForProcessorInput:(id)a4 failureMetadata:(id)a5;
- (uint64_t)_applyingZoomBeforeDeepZoomAllowedWithSampleBuffer:(uint64_t)a3 bufferType:(uint64_t)a4 portType:;
- (uint64_t)_attemptDisparityReferenceFrameResolutionForSettings:(void *)a3 portType:;
- (uint64_t)_beginStereoPhotoProcessingIfNeededForSettings:(uint64_t)result;
- (uint64_t)_deepFusionProcessorInputNeededForSettings:(uint64_t)a3 portType:;
- (uint64_t)_deferredCaptureAddBuffer:(uint64_t)a3 bufferType:(uint64_t)a4 captureFrameFlags:(uint64_t)a5 metadata:(uint64_t)a6 rawThumbnailsBuffer:(uint64_t)a7 rawThumbnailsMetadata:(void *)a8 portType:;
- (uint64_t)_deferredCaptureAddSecondaryStereoPhotoCaptureSampleBufferIfReadyForSettings:(uint64_t)result;
- (uint64_t)_deferredCaptureHandleSensorRawSampleBuffer:(uint64_t)result;
- (uint64_t)_enqueueSoftISPInput:(uint64_t)result;
- (uint64_t)_ensureDeepZoomInputEnqueued:(uint64_t)result;
- (uint64_t)_ensureProcessorCoordinatorSetupForPostponedProcessors;
- (uint64_t)_flushSoftISPOutputBufferPools;
- (uint64_t)_flushUltraHighResolutionBufferPools;
- (uint64_t)_gdcSourceForSettings:(uint64_t)a3 portType:;
- (uint64_t)_handleDeferredCaptureProxyOrErrorRecoverySampleBuffer:(uint64_t)result bufferType:(CFTypeRef)cf;
- (uint64_t)_handleLidarDepthPointCloudSampleBuffer:(uint64_t)result;
- (uint64_t)_handlePointCloudSampleBuffer:(uint64_t)result;
- (uint64_t)_handleSampleBuffer:(uint64_t)a3 input:;
- (uint64_t)_handleSensorRawSampleBuffer:(uint64_t)a1;
- (uint64_t)_inferenceAttachedMediaRequiredForDepthProcessingWithSettings:(uint64_t)a1;
- (uint64_t)_inferenceAttachedMediaRequiredForSettings:(uint64_t)result inferences:(void *)a2 sampleBuffer:(void *)a3;
- (uint64_t)_inferenceAttachedMediaRequiredForSmartStyleWithSettings:(uint64_t)a1;
- (uint64_t)_inferenceGenerationRequiredForSettings:(uint64_t)result;
- (uint64_t)_inferenceOutputPixelBufferPoolForAttachedMediaKey:(uint64_t)result;
- (uint64_t)_inferencesRequiredByProcessorControllersForSettings:(uint64_t)result;
- (uint64_t)_isDeferredRawDeepFusionCapture:(uint64_t)a1;
- (uint64_t)_isDeferredRawLearnedNRCapture:(uint64_t)a1;
- (uint64_t)_isDemosaicedRawCaptureNeedingInferencesWithSettigs:(uint64_t)a1;
- (uint64_t)_isDepthCaptureNeedingPersonSegmentationMasksWithSettings:(uint64_t)a1;
- (uint64_t)_isSemanticRenderingCapture:(uint64_t)result;
- (uint64_t)_isSmartStylesCaptureNeedingInferencesWithSettings:(uint64_t)result;
- (uint64_t)_nrfProcessorInputNeededForSettings:(uint64_t)a3 portType:;
- (uint64_t)_processRawErrorRecoveryFrameWithNRFProcessorInput:(uint64_t)a3 failureMetadata:;
- (uint64_t)_processSensorRawSampleBuffer:(uint64_t)result;
- (uint64_t)_provideInferenceAttachedMediaWithSettings:(uint64_t)result;
- (uint64_t)_provideInferencesForAttachedMediaMode:(void *)a3 settings:;
- (uint64_t)_purgeProcessorAndSharedExternalMemoryResourceBackendMemoryIfNeededWithSettings:(uint64_t)result;
- (uint64_t)_releaseResourcesWithSettings:(uint64_t)result;
- (uint64_t)_requiredResolutionFlavorsForSharedExternalMemoryResourceWithSettings:(uint64_t)result;
- (uint64_t)_resolvedQSubResolutionFlavorForCaptureSettings:(void *)a3 portType:;
- (uint64_t)_scaleInferenceInputForRedEyeReductionFromPixelBuffer:(CVPixelBufferRef)destinationBuffer outputPixelBuffer:;
- (uint64_t)_serviceNextSoftISPInputWithSampleBuffer:(unint64_t)a3 processingMode:(unsigned int)a4 transferOwnership:;
- (uint64_t)_setStereoPhotoInverseHomograhiesOnDCProcessorInputsWithSettings:(uint64_t)result;
- (uint64_t)_setupProcessingStateForClientBracketWithSettings:(void *)a3 processingPlan:;
- (uint64_t)_setupProcessingStateForColorConstancyCaptureWithSettings:(void *)a3 processingPlan:;
- (uint64_t)_setupProcessingStateForDeepFusionWithSettings:(void *)a3 processingPlan:;
- (uint64_t)_setupProcessingStateForDeepZoomWithSettings:(uint64_t)a3 sequenceNumber:(uint64_t)a4 portType:(void *)a5 processingPlan:;
- (uint64_t)_setupProcessingStateForDeferredCaptureIfNeededWithSettings:(uint64_t)a1;
- (uint64_t)_setupProcessingStateForDisparityIfNeededWithSettings:(uint64_t)a3 sequenceNumber:(void *)a4 processingPlan:;
- (uint64_t)_setupProcessingStateForFlashCaptureWithSettings:(void *)a3 processingPlan:;
- (uint64_t)_setupProcessingStateForInferenceWithSettings:(uint64_t)a3 portType:(unint64_t)a4 inferenceInputBufferType:;
- (uint64_t)_setupProcessingStateForIntelligentDistortionCorrectionIfNeededWithSettings:(uint64_t)a3 sequenceNumber:(uint64_t)a4 portType:(void *)a5 processingPlan:;
- (uint64_t)_setupProcessingStateForJasperDisparityIfNeededWithSettings:(void *)a3 processingPlan:;
- (uint64_t)_setupProcessingStateForPointCloudDepthIfNeededWithSettings:(void *)a3 processingPlan:;
- (uint64_t)_setupProcessingStateForScalerIfNeededWithSettings:(uint64_t)a3 sequenceNumber:(void *)a4 portType:(void *)a5 processingPlan:;
- (uint64_t)_setupProcessingStateForSingleImageCaptureWithSettings:(void *)a3 processingPlan:;
- (uint64_t)_setupProcessingStateForSmartStyleWithSettings:(uint64_t)a3 sequenceNumber:(uint64_t)a4 portType:(void *)a5 processingPlan:;
- (uint64_t)_setupProcessingStateForStereoPhotoDeepZoomTransferWithSettings:(void *)a3 processingPlan:;
- (uint64_t)_setupProcessingStateIfNeededWithBeginMomentSettings:(uint64_t)a1;
- (uint64_t)_setupProcessingStateWithSettings:(unint64_t)a1;
- (uint64_t)_setupSoftISPOutputRoutingIfNeededWithOutputSampleBufferRouter:(void *)a3 processingPlan:;
- (uint64_t)_setupSoftISPProcessingStateIfNeededWithSettings:(void *)a3 portType:;
- (uint64_t)_singleImageProcessSampleBuffer:(void *)a3 settings:(void *)a4 portType:;
- (uint64_t)_stashAWBMetadataIfNeededForSampleBuffer:(int)a3 processingMode:;
- (uint64_t)_waitAndSafelyGetProcessorControllerForType:(uint64_t)result;
- (unint64_t)_deepFusionEnhancedResolutionOutputDimensions;
- (unint64_t)_disparityProcessorInputDimensions;
- (unint64_t)_isInferenceInputImageRequiredForSettings:(uint64_t)a3 portType:;
- (unint64_t)_isSWFRFlashCapture:(unint64_t)result;
- (unint64_t)_referenceOrClientBracketFrameEmissionNeededForSettings:(void *)a3 portType:;
- (unint64_t)_resolvedZoomBasedQSubDimensionsWithSourceZoomBasedQSubDimensions:(unint64_t)a3 standardSoftISPOutputDimensions:;
- (unint64_t)_softISPProcesingModeForSettings:(unsigned int)a3 captureFrameFlags:;
- (void)_attemptPiecemealEncodingForGainMapSbuf:(uint64_t)a3 primaryImageMetadata:(uint64_t)a4 processingFlags:(void *)a5 portType:;
- (void)_checkIfProcessingCompletedForNRFProcessorInput:(unint64_t)a1;
- (void)_clearPortraitSemaphoreWithError:(uint64_t)a1;
- (void)_copyNextSoftISPInputUsingProcessingOrderByPortType:(int)a3 processingMode:;
- (void)_drainStashedBeginMomentBuffersIfNeededWithSettings:(uint64_t)a1;
- (void)_emitDeferredCaptureProxyOrErrorRecoverySampleBufferWithWithProcessingError:(uint64_t)a1;
- (void)_emitError:(uint64_t)a1 stillImageSettings:(uint64_t)a2 metadata:(uint64_t)a3 description:(uint64_t)a4;
- (void)_emitOrEnqueueFusionReferenceFrameIfNeededForSampleBuffer:(unint64_t)a1;
- (void)_emitSampleBuffer:(uint64_t)a3 description:;
- (void)_ensureSmartStyleRenderingInputEnqueued:(void *)result;
- (void)_handleClientBracketFrameEmissionForSampleBuffer:(unint64_t)a1;
- (void)_handleDeepFusionError:(void *)a3 processorInput:;
- (void)_handleNextQueuedSampleBuffer;
- (void)_handleQueuedSampleBufferForDisparityWithSettingsIfNeeded:(int)a3 resolvedFusionMode:(void *)a4 portType:;
- (void)_handleSampleBufferForDisparityIfNeeded:(unint64_t)a1;
- (void)_handleSupplementalPointCloudSampleBuffer:(uint64_t)a1;
- (void)_inferenceAttachedMediaRequiredForDemosaicedRawCaptureWithSettings:(void *)a3 inferences:;
- (void)_inferenceProcessRedEyeReductionSampleBuffer:(void *)a3 settings:(void *)a4 portType:;
- (void)_prepareSharedExternalMemoryResourceForProcessorControllersIfNeededForResolutionFlavors:(uint64_t)a1;
- (void)_processorControllerDidFinishProcessingInputForPortType:(uint64_t)a3 processorType:(void *)a4 captureRequestIdentifier:;
- (void)_propagateSushiRawDNGDictionaryWithOutputSampleBuffer:(uint64_t)a3 requestedDimensions:(int)a4 requiresGDCInformation:;
- (void)_releaseNodeResourcesIfNeededBeforeEmittingSampleBuffer:(uint64_t)a1;
- (void)_releaseResources;
- (void)_removeNonPropagatedAttachedMediaFromSampleBuffer:(uint64_t)a1;
- (void)_resetProcessingState;
- (void)_resetProcessingStateIfDone;
- (void)_resolvedQSubResolutionFlavorsForSettings:(uint64_t)a1;
- (void)_setupDeferredProcessingWithSettings:(void *)a3 portType:;
- (void)_setupProcessorCoordinator;
- (void)_waitForAndMergeInferencesIfNeededForSampleBuffer:(void *)a3 processorInput:;
- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5;
- (void)dealloc;
- (void)didReachEndOfDataForInput:(id)a3;
- (void)didSelectFormat:(id)a3 forInput:(id)a4;
- (void)didSelectFormat:(id)a3 forOutput:(id)a4;
- (void)filterNodeDidReceiveStandardResolutionDeepFusionBuffer:(id)a3 error:(int)a4;
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
- (void)processorController:(id)a3 willAddSampleBuffer:(opaqueCMSampleBuffer *)a4 processorInput:(id)a5;
- (void)processorController:(id)a3 willProcessRedEyeReductionForProcessorInput:(id)a4;
- (void)processorControllerWillProcessInferences:(id)a3;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
- (void)setPhotoEncoderController:(id)a3;
- (void)stopAdaptiveBracketingForSettings:(id)a3 withGroup:(int)a4;
@end

@implementation BWPhotonicEngineNode

- (id)nodeType
{
  return @"Effect";
}

- (id)_setupProcessorControllerConfigurations
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
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
      *((void *)v1 + 15) = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithArray:", objc_msgSend((id)-[BWPhotonicEngineNodeConfiguration sensorConfigurationsByPortType](*((void *)v1 + 14)), "allKeys"));
      *((_DWORD *)v1 + 250) = -[BWPhotonicEngineNodeConfiguration demosaicedRawPixelFormat](*((void *)v1 + 14));
      *((_DWORD *)v1 + 50) = 0;
      [*((id *)v1 + 14) figThreadPriority];
      *((void *)v1 + 22) = FigDispatchQueueCreateWithPriority();
      BOOL v3 = BWDeviceSupportsDeferredPhotoProcessorPrewarming();
      if ([*((id *)v1 + 14) deferredPhotoProcessorEnabled]) {
        BOOL v4 = !v3;
      }
      else {
        BOOL v4 = 1;
      }
      if (!v4)
      {
        [*((id *)v1 + 14) figThreadPriority];
        *((void *)v1 + 23) = FigDispatchQueueCreateWithPriority();
        *((void *)v1 + 24) = dispatch_group_create();
      }
      objc_msgSend(*((id *)v1 + 14), "figThreadPriority", v21, v22);
      *((void *)v1 + 26) = FigDispatchQueueCreateWithPriority();
      *((void *)v1 + 31) = objc_alloc_init(BWPhotonicEngineNodeSampleBufferAndInputQueue);
      *((unsigned char *)v1 + 216) = 1;
      SoftISPProcessorControllerConfiguration = BWPhotonicEngineCreateSoftISPProcessorControllerConfiguration(*((void **)v1 + 14));
      *((void *)v1 + 33) = SoftISPProcessorControllerConfiguration;
      if (SoftISPProcessorControllerConfiguration)
      {
        *((void *)v1 + 35) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        *((void *)v1 + 36) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        *((void *)v1 + 40) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        *((void *)v1 + 42) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        *((void *)v1 + 43) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        *((void *)v1 + 44) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      }
      NRFProcessorControllerConfiguration = BWPhotonicEngineCreateNRFProcessorControllerConfiguration(*((void **)v1 + 14));
      *((void *)v1 + 45) = NRFProcessorControllerConfiguration;
      if (NRFProcessorControllerConfiguration) {
        *((void *)v1 + 46) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      }
      *((void *)v1 + 47) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      *((void *)v1 + 48) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      *((void *)v1 + 101) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      DeferredProcessorControllerConfiguration = BWPhotonicEngineCreateDeferredProcessorControllerConfiguration(*((void **)v1 + 14));
      *((void *)v1 + 119) = DeferredProcessorControllerConfiguration;
      if (DeferredProcessorControllerConfiguration)
      {
        [*((id *)v1 + 14) figThreadPriority];
        *((void *)v1 + 118) = FigDispatchQueueCreateWithPriority();
        *((void *)v1 + 120) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      }
      *((void *)v1 + 114) = BWPhotonicEngineCreateDeferredContainerControllerConfiguration(*((void **)v1 + 14));
      DeepFusionProcessorControllerConfiguration = BWPhotonicEngineCreateDeepFusionProcessorControllerConfiguration(*((void **)v1 + 14));
      *((void *)v1 + 53) = DeepFusionProcessorControllerConfiguration;
      if (DeepFusionProcessorControllerConfiguration)
      {
        *((void *)v1 + 54) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        BOOL v9 = !FigCaptureVideoDimensionsAreValid([*((id *)v1 + 14) deepFusionEnhancedResolutionDimensions]);
        if (*((void *)v1 + 33)) {
          BOOL v10 = v9;
        }
        else {
          BOOL v10 = 0;
        }
        [*((id *)v1 + 53) setDelayPrepareAndCacheBuffers:v10];
      }
      LearnedNRProcessorControllerConfiguration = BWPhotonicEngineCreateLearnedNRProcessorControllerConfiguration(*((void **)v1 + 14));
      *((void *)v1 + 51) = LearnedNRProcessorControllerConfiguration;
      if (LearnedNRProcessorControllerConfiguration) {
        *((void *)v1 + 52) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      }
      *((void *)v1 + 61) = BWPhotonicEngineCreateInferenceControllerConfiguration(*((void **)v1 + 14));
      [*((id *)v1 + 14) figThreadPriority];
      *((void *)v1 + 63) = FigDispatchQueueCreateWithPriority();
      *((void *)v1 + 71) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      if (*((void *)v1 + 61))
      {
        *((void *)v1 + 62) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        *((void *)v1 + 64) = dispatch_group_create();
      }
      SWFRProcessorControllerConfiguration = BWPhotonicEngineCreateSWFRProcessorControllerConfiguration(*((void **)v1 + 14));
      *((void *)v1 + 75) = SWFRProcessorControllerConfiguration;
      if (SWFRProcessorControllerConfiguration)
      {
        *((void *)v1 + 76) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        *((void *)v1 + 77) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      }
      ColorConstancyProcessorControllerConfiguration = BWPhotonicEngineCreateColorConstancyProcessorControllerConfiguration(*((void **)v1 + 14));
      *((void *)v1 + 78) = ColorConstancyProcessorControllerConfiguration;
      if (ColorConstancyProcessorControllerConfiguration) {
        *((void *)v1 + 79) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      }
      RedEyeProcessorControllerConfiguration = BWPhotonicEngineCreateRedEyeProcessorControllerConfiguration(*((void **)v1 + 14));
      *((void *)v1 + 80) = RedEyeProcessorControllerConfiguration;
      if (RedEyeProcessorControllerConfiguration) {
        *((void *)v1 + 81) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      }
      IntelligentDistortionCorrectionProcessorControllerConfiguration = BWPhotonicEngineCreateIntelligentDistortionCorrectionProcessorControllerConfiguration(*((void **)v1 + 14));
      *((void *)v1 + 82) = IntelligentDistortionCorrectionProcessorControllerConfiguration;
      if (IntelligentDistortionCorrectionProcessorControllerConfiguration)
      {
        *((void *)v1 + 83) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        *((void *)v1 + 84) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        *((void *)v1 + 87) = +[BWIntelligentDistortionCorrectionProcessorController captureTypesWithIDCSupportWithOptionalCaptureFlags];
      }
      DeepZoomProcessorControllerConfiguration = BWPhotonicEngineCreateDeepZoomProcessorControllerConfiguration(*((void **)v1 + 14));
      *((void *)v1 + 88) = DeepZoomProcessorControllerConfiguration;
      if (DeepZoomProcessorControllerConfiguration) {
        *((void *)v1 + 89) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      }
      ScalerProcessorControllerConfiguration = BWPhotonicEngineCreateScalerProcessorControllerConfiguration(*((void **)v1 + 14));
      *((void *)v1 + 94) = ScalerProcessorControllerConfiguration;
      if (ScalerProcessorControllerConfiguration)
      {
        *((void *)v1 + 95) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        *((void *)v1 + 96) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      }
      SmartStyleRenderingProcessorControllerConfiguration = BWPhotonicEngineCreateSmartStyleRenderingProcessorControllerConfiguration(*((void **)v1 + 14));
      *((void *)v1 + 103) = SmartStyleRenderingProcessorControllerConfiguration;
      if (SmartStyleRenderingProcessorControllerConfiguration)
      {
        *((void *)v1 + 104) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        if (!*((_DWORD *)v1 + 250)) {
          *((_DWORD *)v1 + 250) = [*((id *)v1 + 103) linearYUVPixelFormat];
        }
      }
      StereoDisparityProcessorControllerConfiguration = BWPhotonicEngineCreateStereoDisparityProcessorControllerConfiguration(*((void **)v1 + 14));
      *((void *)v1 + 97) = StereoDisparityProcessorControllerConfiguration;
      if (StereoDisparityProcessorControllerConfiguration)
      {
        *((void *)v1 + 102) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        [*((id *)v1 + 14) figThreadPriority];
        *((void *)v1 + 100) = FigDispatchQueueCreateWithPriority();
        *((void *)v1 + 37) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      }
      if ([*((id *)v1 + 13) supplementalPointCloudCaptureDevice])
      {
        JasperColorStillsExecutorControllerConfiguration = BWPhotonicEngineCreateJasperColorStillsExecutorControllerConfiguration(*((void **)v1 + 14));
        *((void *)v1 + 110) = JasperColorStillsExecutorControllerConfiguration;
        if (JasperColorStillsExecutorControllerConfiguration) {
          *((void *)v1 + 111) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        }
      }
      result = BWPhotonicEngineCreateJasperDisparityProcessorControllerConfiguration(*((void **)v1 + 14));
      *((void *)v1 + 112) = result;
      if (result)
      {
        result = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        *((void *)v1 + 113) = result;
      }
    }
  }
  return result;
}

- (id)adaptiveBracketingDigitalFlashTotalIntegrationTimesProviderForPortType:(id)a3 wait:(BOOL)a4
{
  BOOL v4 = a4;
  p_processorCoordinatorLock = &self->_processorCoordinatorLock;
  os_unfair_lock_lock(&self->_processorCoordinatorLock);
  BOOL processorCoordinatorIsSetup = self->_processorCoordinatorIsSetup;
  os_unfair_lock_unlock(p_processorCoordinatorLock);
  if (!processorCoordinatorIsSetup && !v4) {
    return 0;
  }
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3052000000;
  v17 = __Block_byref_object_copy__42;
  v18 = __Block_byref_object_dispose__42;
  uint64_t v19 = 0;
  processorCoordinatorWorkerQueue = self->_processorCoordinatorWorkerQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __100__BWPhotonicEngineNode_adaptiveBracketingDigitalFlashTotalIntegrationTimesProviderForPortType_wait___block_invoke;
  v13[3] = &unk_1E5C25210;
  v13[5] = a3;
  v13[6] = &v14;
  v13[4] = self;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __ubn_dispatch_sync_block_invoke_0;
  block[3] = &unk_1E5C249F0;
  block[4] = v13;
  dispatch_sync(processorCoordinatorWorkerQueue, block);
  id v11 = (id)v15[5];
  _Block_object_dispose(&v14, 8);
  return v11;
}

- (void)didSelectFormat:(id)a3 forOutput:(id)a4
{
  unsigned int v6 = [a3 width];
  unsigned int v7 = [a3 height];
  [(BWNRFProcessorControllerConfiguration *)self->_nrfProcessorControllerConfiguration setOutputFormat:a3];
  [(BWDeepFusionProcessorControllerConfiguration *)self->_deepFusionProcessorControllerConfiguration setMaxOutputDimensions:v6 | ((unint64_t)v7 << 32)];
  if ([(BWDeepZoomProcessorControllerConfiguration *)self->_deepZoomProcessorControllerConfiguration type] != 3)
  {
    deepZoomProcessorControllerConfiguration = self->_deepZoomProcessorControllerConfiguration;
    [(BWDeepZoomProcessorControllerConfiguration *)deepZoomProcessorControllerConfiguration setOutputFormat:a3];
  }
}

- (BWPhotonicEngineNode)initWithNodeConfiguration:(id)a3 captureDevice:(id)a4
{
  v27.receiver = self;
  v27.super_class = (Class)BWPhotonicEngineNode;
  unsigned int v6 = [(BWNode *)&v27 init];
  unsigned int v7 = v6;
  if (!v6) {
    return v7;
  }
  if (!a3)
  {

    return 0;
  }
  v6->_nodeConfiguration = (BWPhotonicEngineNodeConfiguration *)a3;
  v8 = [[BWNodeInput alloc] initWithMediaType:1986618469 node:v7 index:0];
  BOOL v9 = objc_alloc_init(BWVideoFormatRequirements);
  BOOL v10 = (void *)[MEMORY[0x1E4F1CA48] array];
  int v11 = [(BWStillImageNodeConfiguration *)v7->_nodeConfiguration depthDataType];
  id v26 = a4;
  if (!-[BWPhotonicEngineNodeConfiguration inputIs10Bit]((BOOL)v7->_nodeConfiguration))
  {
    [v10 addObject:&unk_1EFB02408];
    if (v11 == 7) {
      goto LABEL_12;
    }
    v12 = &unk_1EFB02420;
    goto LABEL_11;
  }
  [v10 addObject:&unk_1EFB023A8];
  if (v11 != 7) {
    [v10 addObject:&unk_1EFB023C0];
  }
  if (!-[BWPhotonicEngineNodeConfiguration semanticStyleRenderingEnabled]((BOOL)a3))
  {
    [v10 addObject:&unk_1EFB023D8];
    if (v11 != 7)
    {
      v12 = &unk_1EFB023F0;
LABEL_11:
      [v10 addObject:v12];
    }
  }
LABEL_12:
  BOOL v13 = v11 != 7;
  int v14 = [(BWStillImageNodeConfiguration *)v7->_nodeConfiguration maxLossyCompressionLevel];
  BOOL v15 = !-[BWPhotonicEngineNodeConfiguration inputIs10Bit]((BOOL)v7->_nodeConfiguration);
  BOOL v16 = -[BWPhotonicEngineNodeConfiguration inputIs10Bit]((BOOL)v7->_nodeConfiguration);
  uint64_t v17 = 1;
  objc_msgSend(v10, "addObjectsFromArray:", FigCaptureSupportedCompressedPixelFormatsForSettings(4, v14, v13, 1, 0, v15, v16, 0));
  [(BWVideoFormatRequirements *)v9 setSupportedPixelFormats:v10];
  if (-[BWPhotonicEngineNodeConfiguration inputIs10Bit]((BOOL)v7->_nodeConfiguration)) {
    uint64_t v18 = 64;
  }
  else {
    uint64_t v18 = 16;
  }
  [(BWVideoFormatRequirements *)v9 setBytesPerRowAlignment:v18];
  [(BWVideoFormatRequirements *)v9 setHeightAlignment:16];
  [(BWNodeInput *)v8 setFormatRequirements:v9];
  [(BWNodeInput *)v8 setPassthroughMode:0];
  -[BWNodeInput setRetainedBufferCount:](v8, "setRetainedBufferCount:", -[BWPhotonicEngineNodeConfiguration retainedBufferCount]((uint64_t)v7->_nodeConfiguration));
  [(BWNode *)v7 addInput:v8];
  if ([v26 sensorRawStillImageOutputsEnabled])
  {
    uint64_t v19 = [[BWNodeInput alloc] initWithMediaType:1986618469 node:v7 index:1];
    v20 = objc_alloc_init(BWVideoFormatRequirements);
    [(BWVideoFormatRequirements *)v20 setSupportedPixelFormats:&unk_1EFB049A0];
    [(BWVideoFormatRequirements *)v20 setBytesPerRowAlignment:64];
    [(BWVideoFormatRequirements *)v20 setHeightAlignment:16];
    [(BWNodeInput *)v19 setFormatRequirements:v20];
    [(BWNodeInput *)v19 setPassthroughMode:0];
    -[BWNodeInput setRetainedBufferCount:](v19, "setRetainedBufferCount:", -[BWPhotonicEngineNodeConfiguration retainedBufferCount]((uint64_t)v7->_nodeConfiguration));
    [(BWNode *)v7 addInput:v19];
    v7->_sensorRawInput = v19;
    uint64_t v17 = 2;
  }
  int v21 = [a3 depthDataType];
  uint64_t v22 = [v26 supplementalPointCloudCaptureDevice];
  if (v21 == 7)
  {
    if (v22) {
      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"We should not be generating LiDAR depth and using the ToF camera in the supplemental mode at the same time" userInfo:0]);
    }
    goto LABEL_21;
  }
  if (v22)
  {
LABEL_21:
    v7->_pointCloudInput = [[BWNodeInput alloc] initWithMediaType:1885564004 node:v7 index:v17];
    [(BWNodeInput *)v7->_pointCloudInput setFormatRequirements:objc_alloc_init(BWPointCloudFormatRequirements)];
    [(BWNodeInput *)v7->_pointCloudInput setRetainedBufferCount:1000];
    [(BWNode *)v7 addInput:v7->_pointCloudInput];
    v7->_pointCloudLock._os_unfair_lock_opaque = 0;
    v7->_discardPointClouds = 1;
  }
  uint64_t v23 = [[BWNodeOutput alloc] initWithMediaType:1986618469 node:v7];
  -[BWNodeOutput setOwningNodeRetainedBufferCount:](v23, "setOwningNodeRetainedBufferCount:", -[BWPhotonicEngineNodeConfiguration outputBufferCount]((uint64_t)v7->_nodeConfiguration) - 1);
  if (FigCaptureVideoDimensionsAreValid([(BWStillImageNodeConfiguration *)v7->_nodeConfiguration stereoPhotoOutputDimensions]))
  {
    [(BWNodeOutput *)v23 setOwningNodeRetainedBufferCount:[(BWNodeOutput *)v23 owningNodeRetainedBufferCount] + 2];
  }
  -[BWNodeOutput setPixelBufferPoolProvidesBackPressure:](v23, "setPixelBufferPoolProvidesBackPressure:", -[BWPhotonicEngineNodeConfiguration outputPoolBackPressureEnabled]((BOOL)v7->_nodeConfiguration));
  -[BWNodeOutput setPixelBufferPoolReportSlowBackPressureAllocations:](v23, "setPixelBufferPoolReportSlowBackPressureAllocations:", -[BWPhotonicEngineNodeConfiguration outputPoolBackPressureEnabled]((BOOL)v7->_nodeConfiguration));
  [(BWNodeOutput *)v23 setPassthroughMode:0];
  [(BWNode *)v7 addOutput:v23];
  v24 = (BWFigVideoCaptureDevice *)v26;
  v7->_device = v24;
  [(BWFigVideoCaptureDevice *)v24 setAdaptiveUnifiedBracketingController:v7];
  -[BWPhotonicEngineNode _setupProcessorControllerConfigurations](v7);
  return v7;
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
  v138[1] = *MEMORY[0x1E4F143B8];
  if (self->_pointCloudInput == a4) {
    return;
  }
  if (self->_sensorRawInput != a4)
  {
    BOOL v6 = -[BWPhotonicEngineNode _requiresResizedOutputDimensionsWithInputWidth:inputHeight:]((BOOL)self, [a3 width], objc_msgSend(a3, "height"));
    if (v6) {
      [(NSArray *)[(BWIntelligentDistortionCorrectionProcessorControllerConfiguration *)self->_intelligentDistortionCorrectionControllerConfiguration portTypesWithGeometricDistortionCorrectionEnabled] count];
    }
    unsigned int v100 = [(BWNodeOutput *)self->super._output owningNodeRetainedBufferCount];
    int dcOutputBufferCount = v100 + 1;
    if (self->_intelligentDistortionCorrectionControllerConfiguration) {
      int v8 = v6;
    }
    else {
      int v8 = 1;
    }
    if (v8 != 1
      || (unsigned int v9 = v100 + 1,
          (int)-[BWPhotonicEngineNodeConfiguration constantColorVersion]((uint64_t)self->_nodeConfiguration) >= 1))
    {
      unsigned int v9 = 2 * dcOutputBufferCount;
      self->_int dcOutputBufferCount = 2 * dcOutputBufferCount;
    }
    smartStyleRenderingConfiguration = self->_smartStyleRenderingConfiguration;
    if ([(BWNRFProcessorControllerConfiguration *)self->_nrfProcessorControllerConfiguration demosaicedRawEnabled])
    {
      if ([(NSArray *)[(BWIntelligentDistortionCorrectionProcessorControllerConfiguration *)self->_intelligentDistortionCorrectionControllerConfiguration portTypesWithGeometricDistortionCorrectionEnabled] count]&& self->_softISPProcessorControllerConfiguration)
      {
        int dcOutputBufferCount = self->_dcOutputBufferCount;
      }
    }
    else
    {
      int dcOutputBufferCount = 0;
    }
    self->_int demosaicedRawOutputBufferCount = dcOutputBufferCount;
    BOOL v10 = self->_deepZoomProcessorControllerConfiguration != 0;
    if ([(BWStillImageNodeConfiguration *)self->_nodeConfiguration deferredPhotoProcessorEnabled]&& !self->_intelligentDistortionCorrectionControllerConfiguration)
    {
      if ((v8 & 1) == 0)
      {
        unsigned int v106 = 0;
        unsigned int v98 = v9 >> 1;
        unsigned int v99 = 1;
        goto LABEL_23;
      }
      double v97 = -[BWPhotonicEngineNodeConfiguration gainMapMainImageDownscalingFactor]((uint64_t)self->_nodeConfiguration);
      unsigned int v106 = 0;
      BOOL v11 = *(float *)&v97 > 0.0;
    }
    else
    {
      BOOL v11 = 1;
      unsigned int v106 = 1;
    }
    unsigned int v98 = v9;
    unsigned int v99 = v11;
LABEL_23:
    unsigned int v12 = v9 + (smartStyleRenderingConfiguration != 0) + v10;
    int demosaicedRawOutputBufferCount = self->_demosaicedRawOutputBufferCount;
    v102 = objc_alloc_init(BWVideoFormatRequirements);
    if (FigCapturePixelFormatIsFullRange([a3 pixelFormat])) {
      uint64_t v14 = 875704422;
    }
    else {
      uint64_t v14 = 875704438;
    }
    v138[0] = [NSNumber numberWithUnsignedInt:v14];
    BOOL v15 = (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v138 count:1];
    int v16 = FigCapturePlatformSupportsUniversalCompression();
    if (!self->_deepZoomProcessorControllerConfiguration && v16)
    {
      int v17 = [(BWStillImageNodeConfiguration *)self->_nodeConfiguration maxLossyCompressionLevel];
      if (self->_deepFusionProcessorControllerConfiguration) {
        int v18 = 0;
      }
      else {
        int v18 = v17;
      }
      BOOL v15 = FigCapturePixelFormatsByAddingCompressedVariants(v15, v18);
    }
    uint64_t v19 = v12 - 1;
    if ([a3 colorSpaceProperties])
    {
      uint64_t v137 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(a3, "colorSpaceProperties"));
      uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v137 count:1];
    }
    else
    {
      uint64_t v20 = 0;
    }
    [(BWVideoFormatRequirements *)v102 setSupportedColorSpaceProperties:v20];
    [(BWVideoFormatRequirements *)v102 setSupportedPixelFormats:v15];
    if (v6)
    {
      -[BWVideoFormatRequirements setWidth:](v102, "setWidth:", (int)-[BWPhotonicEngineNodeConfiguration outputDimensions]((uint64_t)self->_nodeConfiguration));
      uint64_t v21 = -[BWPhotonicEngineNodeConfiguration outputDimensions]((uint64_t)self->_nodeConfiguration) >> 32;
    }
    else
    {
      -[BWVideoFormatRequirements setWidth:](v102, "setWidth:", [a3 width]);
      uint64_t v21 = [a3 height];
    }
    [(BWVideoFormatRequirements *)v102 setHeight:v21];
    [(BWVideoFormatRequirements *)v102 setBytesPerRowAlignment:64];
    [(BWVideoFormatRequirements *)v102 setHeightAlignment:16];
    [(BWVideoFormatRequirements *)v102 setPlaneAlignment:64];
    [(BWVideoFormatRequirements *)v102 setSupportedCacheModes:+[BWVideoFormatRequirements cacheModesForOptimizedHWAccess]];
    [(BWNodeOutput *)self->super._output setFormatRequirements:v102];
    [(BWNodeOutput *)self->super._output setOwningNodeRetainedBufferCount:v19];
    unsigned int v22 = [a3 width];
    unint64_t v23 = v22 | ((unint64_t)[a3 height] << 32);
    [(BWSoftISPProcessorControllerConfiguration *)self->_softISPProcessorControllerConfiguration setOutputDimensions:v23];
    [(BWNRFProcessorControllerConfiguration *)self->_nrfProcessorControllerConfiguration setInputFormat:a3];
    [(BWNRFProcessorControllerConfiguration *)self->_nrfProcessorControllerConfiguration setDeepFusionInputFormat:a3];
    [(BWDeepFusionProcessorControllerConfiguration *)self->_deepFusionProcessorControllerConfiguration setMaxInputDimensions:v23];
    [(BWDeepZoomProcessorControllerConfiguration *)self->_deepZoomProcessorControllerConfiguration setInputFormat:a3];
    BOOL v107 = [(BWNodeOutputMediaConfiguration *)[(BWNodeOutput *)self->super._output primaryMediaConfiguration] pixelBufferPoolProvidesBackPressure];
    if ([(BWNRFProcessorControllerConfiguration *)self->_nrfProcessorControllerConfiguration demosaicedRawEnabled])
    {
      v24 = -[BWPhotonicEngineNode _demosaicedRawFormatRequirementsWithDimensions:colorSpaceProperties:]((uint64_t)self, -[BWVideoFormatRequirements width](v102, "width") | ((unint64_t)-[BWVideoFormatRequirements height](v102, "height") << 32), objc_msgSend(-[NSArray firstObject](-[BWVideoFormatRequirements supportedColorSpaceProperties](v102, "supportedColorSpaceProperties"), "firstObject"), "intValue"));
      if ([(BWStillImageNodeConfiguration *)self->_nodeConfiguration deferredPhotoProcessorEnabled])
      {
        BOOL v25 = -[BWPhotonicEngineNodeConfiguration ultraHighResolutionProcessingEnabled]((BOOL)self->_nodeConfiguration);
      }
      else
      {
        BOOL v25 = 0;
      }
      id v26 = objc_alloc_init(BWNodeOutputMediaConfiguration);
      [(BWNodeOutputMediaConfiguration *)v26 setFormatRequirements:v24];
      [(BWNodeOutputMediaConfiguration *)v26 setPassthroughMode:0];
      [(BWNodeOutputMediaConfiguration *)v26 setProvidesPixelBufferPool:!v25];
      if (!v25)
      {
        [(BWNodeOutputMediaConfiguration *)v26 setOwningNodeRetainedBufferCount:(demosaicedRawOutputBufferCount - 1)];
        [(BWNodeOutputMediaConfiguration *)v26 setPixelBufferPoolProvidesBackPressure:v107];
        [(BWNodeOutputMediaConfiguration *)v26 setPixelBufferPoolReportSlowBackPressureAllocations:v107];
      }
      [(BWNodeOutput *)self->super._output setMediaConfiguration:v26 forAttachedMediaKey:0x1EFA745E0];
    }
    if (-[BWPhotonicEngineNodeConfiguration learnedNRMode]((uint64_t)self->_nodeConfiguration))
    {
      [(BWLearnedNRProcessorControllerConfiguration *)self->_learnedNRProcessorControllerConfiguration setInputFormatsByQSubResolutionFlavor:pen_inputFormatsByQSubResolutionFlavorByAddingFormatForFlavor(0, 0, (uint64_t)a3)];
      [(BWLearnedNRProcessorControllerConfiguration *)self->_learnedNRProcessorControllerConfiguration setOutputFormat:a3];
    }
    objc_super v27 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
    long long v126 = 0u;
    long long v127 = 0u;
    long long v128 = 0u;
    long long v129 = 0u;
    obuint64_t j = (id)-[BWPhotonicEngineNodeConfiguration providedInferenceAttachedMediaByMode]((uint64_t)self->_nodeConfiguration);
    uint64_t v110 = [obj countByEnumeratingWithState:&v126 objects:v136 count:16];
    if (v110)
    {
      uint64_t v108 = *(void *)v127;
      do
      {
        uint64_t v28 = 0;
        do
        {
          if (*(void *)v127 != v108) {
            objc_enumerationMutation(obj);
          }
          uint64_t v112 = v28;
          uint64_t v29 = *(void *)(*((void *)&v126 + 1) + 8 * v28);
          long long v122 = 0u;
          long long v123 = 0u;
          long long v124 = 0u;
          long long v125 = 0u;
          v30 = (void *)[(id)-[BWPhotonicEngineNodeConfiguration providedInferenceAttachedMediaByMode]((uint64_t)self->_nodeConfiguration) objectForKeyedSubscript:v29];
          uint64_t v31 = [v30 countByEnumeratingWithState:&v122 objects:v135 count:16];
          if (v31)
          {
            uint64_t v32 = v31;
            uint64_t v33 = *(void *)v123;
            do
            {
              for (uint64_t i = 0; i != v32; ++i)
              {
                if (*(void *)v123 != v33) {
                  objc_enumerationMutation(v30);
                }
                uint64_t v35 = *(void *)(*((void *)&v122 + 1) + 8 * i);
                v36 = (void *)[v27 objectForKeyedSubscript:v35];
                if (v36) {
                  [v36 addObject:v29];
                }
                else {
                  objc_msgSend(v27, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObject:", v29), v35);
                }
              }
              uint64_t v32 = [v30 countByEnumeratingWithState:&v122 objects:v135 count:16];
            }
            while (v32);
          }
          uint64_t v28 = v112 + 1;
        }
        while (v112 + 1 != v110);
        uint64_t v110 = [obj countByEnumeratingWithState:&v126 objects:v136 count:16];
      }
      while (v110);
    }

    v37 = (NSDictionary *)[v27 copy];
    self->_providedInferenceAttachedMediaModesByAttachedMediaKey = v37;
    long long v118 = 0u;
    long long v119 = 0u;
    long long v120 = 0u;
    long long v121 = 0u;
    v103 = v37;
    uint64_t v109 = [(NSDictionary *)v37 countByEnumeratingWithState:&v118 objects:v134 count:16];
    if (v109)
    {
      id obja = *(id *)v119;
      do
      {
        uint64_t v38 = 0;
        do
        {
          if (*(id *)v119 != obja) {
            objc_enumerationMutation(v103);
          }
          uint64_t v39 = *(void *)(*((void *)&v118 + 1) + 8 * v38);
          uint64_t v113 = v38;
          if (+[BWMattingV2InferenceConfiguration isMattingOutputAttachedMediaKey:v39])
          {
            double v40 = -[BWPhotonicEngineNodeConfiguration inferenceMainImageDownscalingFactor]((uint64_t)self->_nodeConfiguration);
            if (*(float *)&v40 == 0.0)
            {
              v41 = 0;
            }
            else
            {
              v41 = objc_alloc_init(BWVideoFormatRequirements);
              float v42 = (float)[(BWVideoFormatRequirements *)v102 width];
              double v43 = -[BWPhotonicEngineNodeConfiguration inferenceMainImageDownscalingFactor]((uint64_t)self->_nodeConfiguration);
              [(BWVideoFormatRequirements *)v41 setWidth:(int)FigCaptureRoundFloatToMultipleOf(2, v42 / *(float *)&v43)];
              float v44 = (float)[(BWVideoFormatRequirements *)v102 height];
              double v45 = -[BWPhotonicEngineNodeConfiguration inferenceMainImageDownscalingFactor]((uint64_t)self->_nodeConfiguration);
              [(BWVideoFormatRequirements *)v41 setHeight:(int)FigCaptureRoundFloatToMultipleOf(2, v44 / *(float *)&v45)];
              [(BWVideoFormatRequirements *)v41 setSupportedPixelFormats:&unk_1EFB049B8];
              [(BWVideoFormatRequirements *)v41 setBytesPerRowAlignment:64];
              [(BWVideoFormatRequirements *)v41 setPlaneAlignment:64];
              [(BWVideoFormatRequirements *)v41 setWidthAlignment:16];
              [(BWVideoFormatRequirements *)v41 setHeightAlignment:16];
              [(BWVideoFormatRequirements *)v41 setMemoryPoolUseAllowed:0];
            }
          }
          else
          {
            v41 = objc_alloc_init(BWVideoFormatRequirements);
            [(BWVideoFormatRequirements *)v41 setWidth:512];
            [(BWVideoFormatRequirements *)v41 setHeight:384];
            [(BWVideoFormatRequirements *)v41 setSupportedPixelFormats:&unk_1EFB049D0];
            [(BWVideoFormatRequirements *)v41 setBytesPerRowAlignment:64];
          }
          long long v116 = 0u;
          long long v117 = 0u;
          long long v114 = 0u;
          long long v115 = 0u;
          uint64_t v111 = v39;
          v46 = (void *)[v27 objectForKeyedSubscript:v39];
          uint64_t v47 = [v46 countByEnumeratingWithState:&v114 objects:v133 count:16];
          if (v47)
          {
            uint64_t v48 = v47;
            LODWORD(v49) = 0;
            uint64_t v50 = *(void *)v115;
            do
            {
              for (uint64_t j = 0; j != v48; ++j)
              {
                if (*(void *)v115 != v50) {
                  objc_enumerationMutation(v46);
                }
                int v52 = [*(id *)(*((void *)&v114 + 1) + 8 * j) intValue];
                if (v52 == 3 || v52 == 2)
                {
                  int v53 = [(BWNodeOutput *)self->super._output owningNodeRetainedBufferCount];
                }
                else if (v52 == 1)
                {
                  int v53 = self->_demosaicedRawOutputBufferCount - 1;
                }
                else
                {
                  int v53 = 0;
                }
                if ((int)v49 <= v53) {
                  uint64_t v49 = v53;
                }
                else {
                  uint64_t v49 = v49;
                }
              }
              uint64_t v48 = [v46 countByEnumeratingWithState:&v114 objects:v133 count:16];
            }
            while (v48);
          }
          else
          {
            uint64_t v49 = 0;
          }
          uint64_t v54 = v107 | [(BWStillImageNodeConfiguration *)self->_nodeConfiguration deferredCaptureSupportEnabled];
          v55 = objc_alloc_init(BWNodeOutputMediaConfiguration);
          [(BWNodeOutputMediaConfiguration *)v55 setFormatRequirements:v41];
          [(BWNodeOutputMediaConfiguration *)v55 setPassthroughMode:0];
          [(BWNodeOutputMediaConfiguration *)v55 setProvidesPixelBufferPool:v106];
          [(BWNodeOutputMediaConfiguration *)v55 setOwningNodeRetainedBufferCount:v49];
          [(BWNodeOutputMediaConfiguration *)v55 setPixelBufferPoolProvidesBackPressure:v54];
          [(BWNodeOutputMediaConfiguration *)v55 setPixelBufferPoolReportSlowBackPressureAllocations:v54];
          [(BWNodeOutput *)self->super._output setMediaConfiguration:v55 forAttachedMediaKey:v111];
          uint64_t v38 = v113 + 1;
        }
        while (v113 + 1 != v109);
        uint64_t v109 = [(NSDictionary *)v103 countByEnumeratingWithState:&v118 objects:v134 count:16];
      }
      while (v109);
    }
    double v56 = -[BWPhotonicEngineNodeConfiguration gainMapMainImageDownscalingFactor]((uint64_t)self->_nodeConfiguration);
    if (*(float *)&v56 != 0.0)
    {
      v57 = objc_alloc_init(BWNodeOutputMediaConfiguration);
      v58 = objc_alloc_init(BWVideoFormatRequirements);
      [(BWVideoFormatRequirements *)v58 setSupportedPixelFormats:&unk_1EFB049E8];
      float v59 = (float)[(BWVideoFormatRequirements *)v102 width];
      double v60 = -[BWPhotonicEngineNodeConfiguration gainMapMainImageDownscalingFactor]((uint64_t)self->_nodeConfiguration);
      [(BWVideoFormatRequirements *)v58 setWidth:(unint64_t)(float)(v59 / *(float *)&v60)];
      float v61 = (float)[(BWVideoFormatRequirements *)v102 height];
      double v62 = -[BWPhotonicEngineNodeConfiguration gainMapMainImageDownscalingFactor]((uint64_t)self->_nodeConfiguration);
      [(BWVideoFormatRequirements *)v58 setHeight:(unint64_t)(float)(v61 / *(float *)&v62)];
      [(BWVideoFormatRequirements *)v58 setWidthAlignment:16];
      [(BWVideoFormatRequirements *)v58 setHeightAlignment:16];
      [(BWNodeOutputMediaConfiguration *)v57 setFormatRequirements:v58];
      [(BWNodeOutputMediaConfiguration *)v57 setPassthroughMode:0];
      [(BWNodeOutputMediaConfiguration *)v57 setProvidesPixelBufferPool:v99];
      [(BWNodeOutputMediaConfiguration *)v57 setOwningNodeRetainedBufferCount:v98 - 1];
      [(BWNodeOutputMediaConfiguration *)v57 setPixelBufferPoolProvidesBackPressure:v107];
      [(BWNodeOutputMediaConfiguration *)v57 setPixelBufferPoolReportSlowBackPressureAllocations:v107];
      [(BWNodeOutput *)self->super._output setMediaConfiguration:v57 forAttachedMediaKey:0x1EFA4EB60];
    }
    if ((int)-[BWPhotonicEngineNodeConfiguration constantColorVersion]((uint64_t)self->_nodeConfiguration) >= 1)
    {
      v63 = objc_alloc_init(BWNodeOutputMediaConfiguration);
      v64 = objc_alloc_init(BWVideoFormatRequirements);
      [(BWVideoFormatRequirements *)v64 setSupportedPixelFormats:&unk_1EFB04A00];
      [(BWVideoFormatRequirements *)v64 setWidth:(int)[(BWStillImageNodeConfiguration *)self->_nodeConfiguration constantColorConfidenceMapDimensions]];
      [(BWVideoFormatRequirements *)v64 setHeight:[(BWStillImageNodeConfiguration *)self->_nodeConfiguration constantColorConfidenceMapDimensions] >> 32];
      [(BWNodeOutputMediaConfiguration *)v63 setFormatRequirements:v64];
      [(BWNodeOutputMediaConfiguration *)v63 setPassthroughMode:0];
      [(BWNodeOutputMediaConfiguration *)v63 setProvidesPixelBufferPool:1];
      [(BWNodeOutputMediaConfiguration *)v63 setOwningNodeRetainedBufferCount:v100];
      [(BWNodeOutputMediaConfiguration *)v63 setPixelBufferPoolProvidesBackPressure:v107];
      [(BWNodeOutputMediaConfiguration *)v63 setPixelBufferPoolReportSlowBackPressureAllocations:v107];
      [(BWNodeOutput *)self->super._output setMediaConfiguration:v63 forAttachedMediaKey:0x1EFA74920];
    }
    if ([(BWStillImageNodeConfiguration *)self->_nodeConfiguration depthDataType] == 8
      || [(BWStillImageNodeConfiguration *)self->_nodeConfiguration depthDataType] == 7)
    {
      char v65 = 0;
    }
    else if ([(BWStillImageNodeConfiguration *)self->_nodeConfiguration depthDataType] == 3)
    {
      char v65 = ![(BWStillImageNodeConfiguration *)self->_nodeConfiguration deferredPhotoProcessorEnabled];
    }
    else
    {
      char v65 = 1;
    }
    if (FigCaptureVideoDimensionsAreValid([(BWStillImageNodeConfiguration *)self->_nodeConfiguration depthDataOutputDimensions])&& (v65 & 1) == 0)
    {
      v66 = objc_alloc_init(BWNodeOutputMediaConfiguration);
      v67 = objc_alloc_init(BWVideoFormatRequirements);
      [(BWVideoFormatRequirements *)v67 setWidth:(int)[(BWStillImageNodeConfiguration *)self->_nodeConfiguration depthDataOutputDimensions]];
      [(BWVideoFormatRequirements *)v67 setHeight:[(BWStillImageNodeConfiguration *)self->_nodeConfiguration depthDataOutputDimensions] >> 32];
      [(BWVideoFormatRequirements *)v67 setSupportedPixelFormats:&unk_1EFB04A18];
      [(BWNodeOutputMediaConfiguration *)v66 setFormatRequirements:v67];
      [(BWNodeOutputMediaConfiguration *)v66 setPassthroughMode:0];
      [(BWNodeOutputMediaConfiguration *)v66 setProvidesPixelBufferPool:[(BWStillImageNodeConfiguration *)self->_nodeConfiguration deferredPhotoProcessorEnabled] ^ 1];
      [(BWNodeOutputMediaConfiguration *)v66 setOwningNodeRetainedBufferCount:[(BWNodeOutput *)self->super._output owningNodeRetainedBufferCount]];
      [(BWNodeOutput *)self->super._output setMediaConfiguration:v66 forAttachedMediaKey:@"Depth"];
    }
    if ([(BWStillImageNodeConfiguration *)self->_nodeConfiguration depthDataType] == 9)
    {
      v68 = objc_alloc_init(BWNodeOutputMediaConfiguration);
      id v69 = +[BWVideoFormatRequirements formatRequirements];
      objc_msgSend(v69, "setWidth:", -[BWVideoFormatRequirements width](v102, "width"));
      objc_msgSend(v69, "setHeight:", -[BWVideoFormatRequirements height](v102, "height"));
      [v69 setSupportedPixelFormats:&unk_1EFB04A30];
      [(BWNodeOutputMediaConfiguration *)v68 setFormatRequirements:v69];
      [(BWNodeOutputMediaConfiguration *)v68 setPassthroughMode:0];
      [(BWNodeOutputMediaConfiguration *)v68 setProvidesPixelBufferPool:0];
      [(BWNodeOutput *)self->super._output setMediaConfiguration:v68 forAttachedMediaKey:0x1EFA74380];
      uint64_t v70 = [+[FigCaptureCameraParameters sharedInstance] maxFocusPixelHorizontalPixelBufferDimensions];
      v71 = objc_alloc_init(BWNodeOutputMediaConfiguration);
      id v72 = +[BWVideoFormatRequirements formatRequirements];
      uint64_t v73 = (int)v70;
      [v72 setWidth:(int)v70];
      v70 >>= 32;
      [v72 setHeight:v70];
      [v72 setSupportedPixelFormats:&unk_1EFB04A48];
      [(BWNodeOutputMediaConfiguration *)v71 setFormatRequirements:v72];
      [(BWNodeOutputMediaConfiguration *)v71 setPassthroughMode:0];
      [(BWNodeOutputMediaConfiguration *)v71 setProvidesPixelBufferPool:0];
      [(BWNodeOutput *)self->super._output setMediaConfiguration:v71 forAttachedMediaKey:0x1EFA743E0];
      v74 = objc_alloc_init(BWNodeOutputMediaConfiguration);
      id v75 = +[BWVideoFormatRequirements formatRequirements];
      [v75 setWidth:v73];
      [v75 setHeight:v70];
      [v75 setSupportedPixelFormats:&unk_1EFB04A60];
      [(BWNodeOutputMediaConfiguration *)v74 setFormatRequirements:v75];
      [(BWNodeOutputMediaConfiguration *)v74 setPassthroughMode:0];
      [(BWNodeOutputMediaConfiguration *)v74 setProvidesPixelBufferPool:0];
      [(BWNodeOutput *)self->super._output setMediaConfiguration:v74 forAttachedMediaKey:0x1EFA74400];
    }
    if (smartStyleRenderingConfiguration)
    {
      uint64_t v76 = -[BWPhotonicEngineNodeConfiguration smartStyleLinearThumbnailDimensions]((uint64_t)self->_nodeConfiguration);
      v77 = objc_alloc_init(BWNodeOutputMediaConfiguration);
      v78 = objc_alloc_init(BWVideoFormatRequirements);
      [(BWVideoFormatRequirements *)v78 setWidth:(int)v76];
      [(BWVideoFormatRequirements *)v78 setHeight:v76 >> 32];
      [(BWVideoFormatRequirements *)v78 setSupportedPixelFormats:&unk_1EFB04A78];
      [(BWNodeOutputMediaConfiguration *)v77 setFormatRequirements:v78];
      [(BWNodeOutputMediaConfiguration *)v77 setPassthroughMode:0];
      [(BWNodeOutputMediaConfiguration *)v77 setProvidesPixelBufferPool:0];
      [(BWNodeOutput *)self->super._output setMediaConfiguration:v77 forAttachedMediaKey:0x1EFA74740];
      if (-[BWPhotonicEngineNodeConfiguration smartStyleReversibilityEnabled]((BOOL)self->_nodeConfiguration))
      {
        [MEMORY[0x1E4F55F08] intermediateStyleRendererThumbnailSizeForUseCase:0];
        double v80 = v79;
        double v82 = v81;
        v83 = objc_alloc_init(BWNodeOutputMediaConfiguration);
        v84 = objc_alloc_init(BWVideoFormatRequirements);
        [(BWVideoFormatRequirements *)v84 setWidth:(int)v80];
        [(BWVideoFormatRequirements *)v84 setHeight:(int)v82];
        [(BWVideoFormatRequirements *)v84 setSupportedPixelFormats:&unk_1EFB04A90];
        [(BWNodeOutputMediaConfiguration *)v83 setFormatRequirements:v84];
        [(BWNodeOutputMediaConfiguration *)v83 setPassthroughMode:0];
        [(BWNodeOutputMediaConfiguration *)v83 setProvidesPixelBufferPool:0];
        [(BWNodeOutput *)self->super._output setMediaConfiguration:v83 forAttachedMediaKey:0x1EFA74780];
        v85 = objc_alloc_init(BWNodeOutputMediaConfiguration);
        [(BWNodeOutputMediaConfiguration *)v85 setFormatRequirements:v102];
        [(BWNodeOutputMediaConfiguration *)v85 setPassthroughMode:0];
        [(BWNodeOutputMediaConfiguration *)v85 setProvidesPixelBufferPool:0];
        [(BWNodeOutput *)self->super._output setMediaConfiguration:v85 forAttachedMediaKey:0x1EFA74760];
        id v86 = +[BWSmartStyleRenderingProcessorController pixelBufferAttributesWithCapacityForLearntCoefficients:](BWSmartStyleRenderingProcessorController, "pixelBufferAttributesWithCapacityForLearntCoefficients:", -[BWPhotonicEngineNodeConfiguration smartStyleRenderingVersion]((uint64_t)self->_nodeConfiguration));
        v87 = objc_alloc_init(BWNodeOutputMediaConfiguration);
        v88 = objc_alloc_init(BWVideoFormatRequirements);
        uint64_t v89 = *MEMORY[0x1E4F24E10];
        -[BWVideoFormatRequirements setWidth:](v88, "setWidth:", (int)objc_msgSend((id)objc_msgSend(v86, "objectForKeyedSubscript:", *MEMORY[0x1E4F24E10]), "intValue"));
        uint64_t v90 = *MEMORY[0x1E4F24D08];
        -[BWVideoFormatRequirements setHeight:](v88, "setHeight:", (int)objc_msgSend((id)objc_msgSend(v86, "objectForKeyedSubscript:", *MEMORY[0x1E4F24D08]), "intValue"));
        uint64_t v91 = *MEMORY[0x1E4F24D70];
        uint64_t v132 = [v86 objectForKeyedSubscript:*MEMORY[0x1E4F24D70]];
        -[BWVideoFormatRequirements setSupportedPixelFormats:](v88, "setSupportedPixelFormats:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v132 count:1]);
        [(BWNodeOutputMediaConfiguration *)v87 setFormatRequirements:v88];
        [(BWNodeOutputMediaConfiguration *)v87 setPassthroughMode:0];
        [(BWNodeOutputMediaConfiguration *)v87 setProvidesPixelBufferPool:0];
        [(BWNodeOutput *)self->super._output setMediaConfiguration:v87 forAttachedMediaKey:0x1EFA747C0];
        id v92 = +[BWSmartStyleRenderingProcessorController pixelBufferAttributesForSmallLightMap:](BWSmartStyleRenderingProcessorController, "pixelBufferAttributesForSmallLightMap:", -[BWPhotonicEngineNodeConfiguration smartStyleRenderingVersion]((uint64_t)self->_nodeConfiguration));
        v93 = objc_alloc_init(BWNodeOutputMediaConfiguration);
        v94 = objc_alloc_init(BWVideoFormatRequirements);
        -[BWVideoFormatRequirements setWidth:](v94, "setWidth:", (int)objc_msgSend((id)objc_msgSend(v92, "objectForKeyedSubscript:", v89), "intValue"));
        -[BWVideoFormatRequirements setHeight:](v94, "setHeight:", (int)objc_msgSend((id)objc_msgSend(v92, "objectForKeyedSubscript:", v90), "intValue"));
        uint64_t v131 = [v92 objectForKeyedSubscript:v91];
        -[BWVideoFormatRequirements setSupportedPixelFormats:](v94, "setSupportedPixelFormats:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v131 count:1]);
        [(BWNodeOutputMediaConfiguration *)v93 setFormatRequirements:v94];
        [(BWNodeOutputMediaConfiguration *)v93 setPassthroughMode:0];
        [(BWNodeOutputMediaConfiguration *)v93 setProvidesPixelBufferPool:0];
        [(BWNodeOutput *)self->super._output setMediaConfiguration:v93 forAttachedMediaKey:0x1EFA747E0];
        v95 = objc_alloc_init(BWNodeOutputMediaConfiguration);
        v96 = objc_alloc_init(BWVideoFormatRequirements);
        -[BWVideoFormatRequirements setWidth:](v96, "setWidth:", (int)objc_msgSend((id)objc_msgSend(v92, "objectForKeyedSubscript:", v89), "intValue"));
        -[BWVideoFormatRequirements setHeight:](v96, "setHeight:", (int)objc_msgSend((id)objc_msgSend(v92, "objectForKeyedSubscript:", v90), "intValue"));
        uint64_t v130 = [v92 objectForKeyedSubscript:v91];
        -[BWVideoFormatRequirements setSupportedPixelFormats:](v96, "setSupportedPixelFormats:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v130 count:1]);
        [(BWNodeOutputMediaConfiguration *)v95 setFormatRequirements:v96];
        [(BWNodeOutputMediaConfiguration *)v95 setPassthroughMode:0];
        [(BWNodeOutputMediaConfiguration *)v95 setProvidesPixelBufferPool:0];
        [(BWNodeOutput *)self->super._output setMediaConfiguration:v95 forAttachedMediaKey:0x1EFA74800];
      }
    }
    return;
  }
  [(BWSoftISPProcessorControllerConfiguration *)self->_softISPProcessorControllerConfiguration sensorRawPixelFormat];
  [a3 pixelFormat];
}

- (BOOL)_requiresResizedOutputDimensionsWithInputWidth:(uint64_t)a3 inputHeight:
{
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = -[BWPhotonicEngineNodeConfiguration outputDimensions](*(void *)(result + 112));
    result = FigCaptureVideoDimensionsAreValid(v6);
    if (result) {
      return a2 != (int)-[BWPhotonicEngineNodeConfiguration outputDimensions](*(void *)(v5 + 112))
    }
          || a3 != -[BWPhotonicEngineNodeConfiguration outputDimensions](*(void *)(v5 + 112)) >> 32;
  }
  return result;
}

- (unint64_t)_deepFusionEnhancedResolutionOutputDimensions
{
  if (a1)
  {
    if ([*(id *)(a1 + 16) videoFormat]
      && FigCaptureVideoDimensionsAreValid([*(id *)(a1 + 112) deepFusionEnhancedResolutionDimensions]))
    {
      unsigned int v2 = FigCaptureRoundFloatToMultipleOf(2, (float)((float)((float)(unint64_t)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "videoFormat"), "width")/ (float)(unint64_t)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "videoFormat"), "height"))/ (float)((float)(int)objc_msgSend(*(id *)(a1 + 112), "deepFusionEnhancedResolutionDimensions")/ (float)(int)((unint64_t)objc_msgSend(*(id *)(a1 + 112), "deepFusionEnhancedResolutionDimensions") >> 32)))* (float)(int)objc_msgSend(*(id *)(a1 + 112), "deepFusionEnhancedResolutionDimensions"));
      unint64_t v3 = [*(id *)(a1 + 112) deepFusionEnhancedResolutionDimensions] & 0xFFFFFFFF00000000;
      uint64_t v4 = v2;
    }
    else
    {
      unint64_t v3 = 0;
      uint64_t v4 = 0;
    }
  }
  else
  {
    unint64_t v3 = 0;
    uint64_t v4 = 0;
  }
  return v4 | v3;
}

- (void)setPhotoEncoderController:(id)a3
{
}

- (BWNodeInput)sensorRawInput
{
  return self->_sensorRawInput;
}

- (BWNodeInput)pointCloudInput
{
  return self->_pointCloudInput;
}

- (void)_setupProcessorCoordinator
{
  v617[17] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  if (*(void *)(a1 + 168)) {
    return;
  }
  uint64_t v4 = (void *)v3;
  if (dword_1EB4C5670)
  {
    unsigned int v534 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (!_FigIsCurrentDispatchQueue())
  {
    uint64_t v485 = v1;
    FigDebugAssert3();
  }
  FigDebugIsInternalBuild();
  unint64_t v6 = 0x1E4F29000uLL;
  uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
  mach_absolute_time();
  uint64_t v502 = v7;
  [v4 addObject:v7];
  v518 = (void *)[MEMORY[0x1E4F1CA80] set];
  uint64_t v520 = [*(id *)(a1 + 16) memoryPool];
  v508 = (void *)[*(id *)(a1 + 8) videoFormat];
  v519 = v4;
  if (-[BWPhotonicEngineNode _requiresResizedOutputDimensionsWithInputWidth:inputHeight:](a1, [v508 width], objc_msgSend(v508, "height")))
  {
    FigDebugIsInternalBuild();
    uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 2);
    mach_absolute_time();
    [v4 addObject:v8];
    if (!objc_msgSend((id)objc_msgSend(*(id *)(a1 + 656), "portTypesWithGeometricDistortionCorrectionEnabled"), "count"))goto LABEL_565; {
    unsigned int v9 = -[BWVideoFormatRequirements initWithPixelBufferAttributes:]([BWVideoFormatRequirements alloc], "initWithPixelBufferAttributes:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "videoFormat"), "pixelBufferAttributes"));
    }
    -[BWVideoFormatRequirements setWidth:](v9, "setWidth:", [v508 width]);
    -[BWVideoFormatRequirements setHeight:](v9, "setHeight:", [v508 height]);
    -[BWVideoFormatRequirements setWidthAlignment:](v9, "setWidthAlignment:", [v508 extendedWidth]);
    -[BWVideoFormatRequirements setHeightAlignment:](v9, "setHeightAlignment:", [v508 extendedHeight]);
    v617[0] = v9;
    id v10 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:v617 count:1]);
    uint64_t v11 = [v508 extendedWidth];
    if (v11 != [v10 extendedWidth]) {
      goto LABEL_565;
    }
    uint64_t v12 = [v508 extendedHeight];
    if (v12 != [v10 extendedHeight]) {
      goto LABEL_565;
    }
    BOOL v13 = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:]([BWPixelBufferPool alloc], "initWithVideoFormat:capacity:name:memoryPool:", v10, objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "preparedPixelBufferPool"), "capacity"), @"Noise Reduction and Fusion Processor Output Intermediate Pool", v520);
    *(void *)(a1 + 256) = v13;
    if (!v13) {
      goto LABEL_565;
    }
    if (dword_1EB4C5670)
    {
      unsigned int v534 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      uint64_t v14 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    objc_msgSend(v4, "removeLastObject", v461, v485);
    unint64_t v6 = 0x1E4F29000;
  }
  uint64_t v497 = *(void *)(a1 + 824);
  v503 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  BOOL v15 = (void *)-[BWPhotonicEngineNodeConfiguration dimensionsByQSubResolutionFlavorByPortType](*(void *)(a1 + 112));
  unint64_t v16 = BWCommonDimensionsForQSubResolutionFlavor(v15, 2);
  uint64_t v505 = v16;
  unint64_t v498 = HIDWORD(v16);
  if (FigCaptureVideoDimensionsAreValid(v16))
  {
    int v512 = FigCaptureRoundFloatToMultipleOf(2, (float)((float)((float)(unint64_t)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 360), "inputFormat"), "width")/ (float)(unint64_t)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 360), "inputFormat"), "height"))/ (float)((float)(int)v16 / (float)SHIDWORD(v16)))* (float)(int)v16);
    if (dword_1EB4C5670)
    {
      unsigned int v534 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      int v17 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      unint64_t v6 = 0x1E4F29000;
    }
    v506 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", v460, v485);
    unint64_t v511 = HIDWORD(v16);
  }
  else
  {
    v506 = 0;
    unint64_t v511 = 0;
    int v512 = 0;
  }
  int v18 = (void *)-[BWPhotonicEngineNodeConfiguration dimensionsByQSubResolutionFlavorByPortType](*(void *)(a1 + 112));
  BOOL v509 = 1;
  uint64_t v19 = (void *)BWDimensionsWithQSubResolutionFlavor(v18, 1);
  unint64_t v20 = FigCaptureLargestDimensionsFromDimensionsArray(v19);
  if ((int)v20 <= (int)-[BWPhotonicEngineNodeConfiguration rawSensorDimensions](*(void *)(a1 + 112)))
  {
    unint64_t v6 = 0x1E4F29000;
    BOOL v509 = SHIDWORD(v20) > (int)((unint64_t)-[BWPhotonicEngineNodeConfiguration rawSensorDimensions](*(void *)(a1 + 112)) >> 32);
  }
  uint64_t v510 = -[BWPhotonicEngineNode _resolvedZoomBasedQSubDimensionsWithSourceZoomBasedQSubDimensions:standardSoftISPOutputDimensions:](a1, v20, [*(id *)(a1 + 264) outputDimensions]);
  unint64_t v504 = HIDWORD(v510);
  if ([v19 count] && dword_1EB4C5670)
  {
    unsigned int v534 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    uint64_t v21 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    unint64_t v6 = 0x1E4F29000uLL;
  }
  v507 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", v460, v485);
  unsigned int v22 = &OBJC_IVAR___BWVideoOrientationMetadataNode__localIDOfOrientationMetadata;
  if (!*(void *)(a1 + 264))
  {
    uint64_t v40 = 0;
    goto LABEL_243;
  }
  FigDebugIsInternalBuild();
  uint64_t v23 = objc_msgSend(*(id *)(v6 + 24), "stringWithFormat:", @"%d", 3);
  mach_absolute_time();
  [v4 addObject:v23];
  obuint64_t j = [[BWSoftISPProcessorController alloc] initWithConfiguration:*(void *)(a1 + 264)];
  if (!obj) {
    goto LABEL_580;
  }
  FigDebugIsInternalBuild();
  uint64_t v24 = objc_msgSend(*(id *)(v6 + 24), "stringWithFormat:", @"%d", 4);
  mach_absolute_time();
  [v4 addObject:v24];
  v514 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  unint64_t v25 = 0x1E4F1C000uLL;
  uint64_t v492 = v24;
  uint64_t v493 = v23;
  if (([*(id *)(a1 + 360) fusionEnabled] & 1) != 0
    || ([*(id *)(a1 + 360) lowLightFusionEnabled] & 1) != 0
    || ([*(id *)(a1 + 360) rawNightModeEnabled] & 1) != 0
    || [*(id *)(a1 + 360) demosaicedRawEnabled]
    && ([*(id *)(a1 + 112) deferredPhotoProcessorEnabled] & 1) == 0)
  {
    uint64_t v26 = [(BWSoftISPProcessorController *)obj outputPixelFormatForCaptureType:10 processingMode:0];
    objc_super v27 = objc_alloc_init(BWVideoFormatRequirements);
    -[BWVideoFormatRequirements setWidth:](v27, "setWidth:", (int)[*(id *)(a1 + 264) outputDimensions]);
    -[BWVideoFormatRequirements setHeight:](v27, "setHeight:", [*(id *)(a1 + 264) outputDimensions] >> 32);
    [(BWVideoFormatRequirements *)v27 setWidthAlignment:16];
    [(BWVideoFormatRequirements *)v27 setHeightAlignment:16];
    uint64_t v610 = [NSNumber numberWithUnsignedInt:v26];
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v27, "setSupportedPixelFormats:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v610 count:1]);
    v609 = v27;
    id v28 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v609 count:1]);
    int v29 = [*(id *)(a1 + 360) fusionEnabled];
    v30 = [BWPixelBufferPool alloc];
    if (v29) {
      uint64_t v31 = 8;
    }
    else {
      uint64_t v31 = 1;
    }
    uint64_t v32 = [(BWPixelBufferPool *)v30 initWithVideoFormat:v28 capacity:v31 name:@"YUV SoftISP output pool" memoryPool:v520];
    if (!v32) {
      goto LABEL_580;
    }
    uint64_t v33 = (void *)v32;
    unsigned int v496 = v26;
    objc_msgSend(v514, "setObject:forKeyedSubscript:", v32, objc_msgSend(NSNumber, "numberWithUnsignedInt:", v26));
  }
  else
  {
    unsigned int v496 = 0;
  }
  if (*(void *)(a1 + 600))
  {
    uint64_t v34 = [(BWSoftISPProcessorController *)obj outputPixelFormatForCaptureType:2 processingMode:0];
    uint64_t v35 = objc_msgSend(v514, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v34));
    if (*(void *)(a1 + 640)) {
      uint64_t v36 = 4;
    }
    else {
      uint64_t v36 = 3;
    }
    if (v35)
    {
      v37 = v35;
      unint64_t v38 = [v35 capacity];
      if (v38 <= v36) {
        unint64_t v39 = v36;
      }
      else {
        unint64_t v39 = v38;
      }
      if (v39 != [v37 capacity]) {
        [v37 setCapacity:v39];
      }
    }
    else
    {
      v41 = objc_alloc_init(BWVideoFormatRequirements);
      -[BWVideoFormatRequirements setWidth:](v41, "setWidth:", (int)[*(id *)(a1 + 264) outputDimensions]);
      -[BWVideoFormatRequirements setHeight:](v41, "setHeight:", [*(id *)(a1 + 264) outputDimensions] >> 32);
      [(BWVideoFormatRequirements *)v41 setWidthAlignment:16];
      [(BWVideoFormatRequirements *)v41 setHeightAlignment:16];
      uint64_t v608 = [NSNumber numberWithUnsignedInt:v34];
      -[BWVideoFormatRequirements setSupportedPixelFormats:](v41, "setSupportedPixelFormats:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v608 count:1]);
      v607 = v41;
      id v42 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v607 count:1]);
      double v43 = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:]([BWPixelBufferPool alloc], "initWithVideoFormat:capacity:name:memoryPool:", v42, v36, [NSString stringWithFormat:@"SoftISP output pool (%@)", BWStringForOSType(v34)], v520);
      if (!v43) {
        goto LABEL_565;
      }
      float v44 = v43;
      objc_msgSend(v514, "setObject:forKeyedSubscript:", v43, objc_msgSend(NSNumber, "numberWithUnsignedInt:", v34));
    }
  }
  if (*(void *)(a1 + 408) && (-[BWPhotonicEngineNodeConfiguration learnedNRMode](*(void *)(a1 + 112)) & 1) != 0
    || ([*(id *)(a1 + 360) learnedNRMode] & 0x10) != 0)
  {
    uint64_t v45 = [(BWSoftISPProcessorController *)obj outputPixelFormatForCaptureType:1 captureFlags:128 processingMode:0];
    v46 = objc_alloc_init(BWVideoFormatRequirements);
    -[BWVideoFormatRequirements setWidth:](v46, "setWidth:", (int)[*(id *)(a1 + 264) outputDimensions]);
    -[BWVideoFormatRequirements setHeight:](v46, "setHeight:", [*(id *)(a1 + 264) outputDimensions] >> 32);
    [(BWVideoFormatRequirements *)v46 setWidthAlignment:16];
    [(BWVideoFormatRequirements *)v46 setHeightAlignment:16];
    unsigned int v499 = v45;
    uint64_t v606 = [NSNumber numberWithUnsignedInt:v45];
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v46, "setSupportedPixelFormats:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v606 count:1]);
    v605 = v46;
    id v47 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v605 count:1]);
    uint64_t v48 = objc_alloc_init(BWVideoFormatRequirements);
    -[BWVideoFormatRequirements setWidth:](v48, "setWidth:", (int)[*(id *)(a1 + 264) outputDimensions]);
    -[BWVideoFormatRequirements setHeight:](v48, "setHeight:", [*(id *)(a1 + 264) outputDimensions] >> 32);
    [(BWVideoFormatRequirements *)v48 setWidthAlignment:16];
    [(BWVideoFormatRequirements *)v48 setHeightAlignment:16];
    uint64_t v604 = [NSNumber numberWithUnsignedInt:1751527984];
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v48, "setSupportedPixelFormats:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v604 count:1]);
    v603 = v48;
    id v49 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v603 count:1]);
    objc_msgSend(*(id *)(a1 + 408), "setInputFormatsByQSubResolutionFlavor:", pen_inputFormatsByQSubResolutionFlavorByAddingFormatForFlavor(0, 0, (uint64_t)v47));
    [*(id *)(a1 + 408) setOutputFormat:v49];
    long long v531 = 0u;
    long long v532 = 0u;
    long long v529 = 0u;
    long long v530 = 0u;
    uint64_t v50 = [v19 countByEnumeratingWithState:&v529 objects:v602 count:16];
    if (v50)
    {
      uint64_t v51 = v50;
      uint64_t v52 = *(void *)v530;
      do
      {
        for (uint64_t i = 0; i != v51; ++i)
        {
          if (*(void *)v530 != v52) {
            objc_enumerationMutation(v19);
          }
          unint64_t v54 = FigCaptureDimensionsFromDictionaryRepresentation(*(void **)(*((void *)&v529 + 1) + 8 * i));
          if (v54 == -[BWPhotonicEngineNodeConfiguration rawSensorDimensions](*(void *)(a1 + 112))
            && HIDWORD(v54) == (unint64_t)-[BWPhotonicEngineNodeConfiguration rawSensorDimensions](*(void *)(a1 + 112)) >> 32)
          {
            objc_msgSend(*(id *)(a1 + 408), "setInputFormatsByQSubResolutionFlavor:", pen_inputFormatsByQSubResolutionFlavorByAddingFormatForFlavor(objc_msgSend(*(id *)(a1 + 408), "inputFormatsByQSubResolutionFlavor"), 1, (uint64_t)v47));
          }
        }
        uint64_t v51 = [v19 countByEnumeratingWithState:&v529 objects:v602 count:16];
      }
      while (v51);
    }
    if (([*(id *)(a1 + 360) learnedNRMode] & 0x10) != 0) {
      [*(id *)(a1 + 360) setLearnedNRInputFormat:v47];
    }
    v55 = objc_msgSend(v514, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v499));
    if (v55)
    {
      double v56 = v55;
      unint64_t v57 = [v55 capacity];
      if (v57 <= 1) {
        uint64_t v58 = 1;
      }
      else {
        uint64_t v58 = v57;
      }
      unint64_t v25 = 0x1E4F1C000;
      if (v58 != [v56 capacity]) {
        [v56 setCapacity:v58];
      }
    }
    else
    {
      float v59 = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:]([BWPixelBufferPool alloc], "initWithVideoFormat:capacity:name:memoryPool:", v47, 1, [NSString stringWithFormat:@"SoftISP output pool (%@)", BWStringForOSType(v499)], v520);
      if (!v59) {
        goto LABEL_565;
      }
      double v60 = v59;
      objc_msgSend(v514, "setObject:forKeyedSubscript:", v59, objc_msgSend(NSNumber, "numberWithUnsignedInt:", v499));

      unint64_t v25 = 0x1E4F1C000uLL;
    }
  }
  if ([*(id *)(a1 + 360) rawNightModeEnabled])
  {
    uint64_t v61 = [(BWSoftISPProcessorController *)obj outputPixelFormatForCaptureType:11 captureFlags:0x800000000 processingMode:0];
    double v62 = objc_alloc_init(BWVideoFormatRequirements);
    -[BWVideoFormatRequirements setWidth:](v62, "setWidth:", (int)[*(id *)(a1 + 264) outputDimensions]);
    -[BWVideoFormatRequirements setHeight:](v62, "setHeight:", [*(id *)(a1 + 264) outputDimensions] >> 32);
    [(BWVideoFormatRequirements *)v62 setWidthAlignment:16];
    [(BWVideoFormatRequirements *)v62 setHeightAlignment:16];
    uint64_t v601 = [NSNumber numberWithUnsignedInt:v61];
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v62, "setSupportedPixelFormats:", [*(id *)(v25 + 2424) arrayWithObjects:&v601 count:1]);
    v600 = v62;
    id v63 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", [*(id *)(v25 + 2424) arrayWithObjects:&v600 count:1]);
    [*(id *)(a1 + 360) setRawNightModeInputFormat:v63];
    v64 = objc_msgSend(v514, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v61));
    if (v64)
    {
      char v65 = v64;
      unint64_t v66 = [v64 capacity];
      if (v66 <= 7) {
        uint64_t v67 = 7;
      }
      else {
        uint64_t v67 = v66;
      }
      if (v67 != [v65 capacity]) {
        [v65 setCapacity:v67];
      }
    }
    else
    {
      v68 = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:]([BWPixelBufferPool alloc], "initWithVideoFormat:capacity:name:memoryPool:", v63, 7, [NSString stringWithFormat:@"SoftISP output pool (%@)", BWStringForOSType(v61)], v520);
      if (!v68) {
        goto LABEL_565;
      }
      id v69 = v68;
      objc_msgSend(v514, "setObject:forKeyedSubscript:", v68, objc_msgSend(NSNumber, "numberWithUnsignedInt:", v61));
    }
  }
  int64_t v70 = -[BWPhotonicEngineNode _deepFusionEnhancedResolutionOutputDimensions](a1);
  if (([*(id *)(a1 + 360) deepFusionEnabled] & 1) != 0 || *(void *)(a1 + 424))
  {
    uint64_t v71 = [(BWSoftISPProcessorController *)obj outputPixelFormatForCaptureType:12 processingMode:0];
    id v72 = objc_alloc_init(BWVideoFormatRequirements);
    -[BWVideoFormatRequirements setWidth:](v72, "setWidth:", (int)[*(id *)(a1 + 264) outputDimensions]);
    -[BWVideoFormatRequirements setHeight:](v72, "setHeight:", [*(id *)(a1 + 264) outputDimensions] >> 32);
    [(BWVideoFormatRequirements *)v72 setWidthAlignment:16];
    [(BWVideoFormatRequirements *)v72 setHeightAlignment:16];
    uint64_t v599 = [NSNumber numberWithUnsignedInt:v71];
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v72, "setSupportedPixelFormats:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v599 count:1]);
    v598 = v72;
    id v73 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v598 count:1]);
    [*(id *)(a1 + 360) setDeepFusionInputFormat:v73];
    BOOL v74 = 0;
    if ([*(id *)(a1 + 112) deferredPhotoProcessorEnabled]) {
      BOOL v74 = -[BWPhotonicEngineNodeConfiguration ultraHighResolutionProcessingEnabled](*(void *)(a1 + 112));
    }
    if (FigCaptureVideoDimensionsAreValid([*(id *)(a1 + 112) stereoPhotoOutputDimensions])) {
      unsigned int v75 = (-[BWPhotonicEngineNodeConfiguration learnedNRMode](*(void *)(a1 + 112)) >> 2) & 1;
    }
    else {
      unsigned int v75 = 0;
    }
    int v76 = [*(id *)(a1 + 112) deferredCaptureSupportEnabled];
    if ((v74 & (v75 ^ 1)) != 0) {
      unsigned int v77 = 0;
    }
    else {
      unsigned int v77 = 5;
    }
    if (v76) {
      uint64_t v78 = 2;
    }
    else {
      uint64_t v78 = v77;
    }
    double v79 = objc_msgSend(v514, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v71));
    if (v79)
    {
      double v80 = v79;
      unint64_t v81 = [v79 capacity];
      if (v81 > v78) {
        uint64_t v78 = v81;
      }
      if (v78 != [v80 capacity]) {
        [v80 setCapacity:v78];
      }
    }
    else
    {
      double v82 = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:]([BWPixelBufferPool alloc], "initWithVideoFormat:capacity:name:memoryPool:", v73, v78, [NSString stringWithFormat:@"SoftISP output pool (%@)", BWStringForOSType(v71)], v520);
      if (!v82) {
        goto LABEL_565;
      }
      v83 = v82;
      objc_msgSend(v514, "setObject:forKeyedSubscript:", v82, objc_msgSend(NSNumber, "numberWithUnsignedInt:", v71));
    }
    double v84 = -[BWPhotonicEngineNodeConfiguration gainMapMainImageDownscalingFactor](*(void *)(a1 + 112));
    if (*(float *)&v84 != 0.0 && FigCaptureVideoDimensionsAreValid(v70))
    {
      v85 = objc_alloc_init(BWVideoFormatRequirements);
      [(BWVideoFormatRequirements *)v85 setSupportedPixelFormats:&unk_1EFB04DD8];
      double v86 = -[BWPhotonicEngineNodeConfiguration gainMapMainImageDownscalingFactor](*(void *)(a1 + 112));
      [(BWVideoFormatRequirements *)v85 setWidth:(unint64_t)(float)((float)(int)v70 / *(float *)&v86)];
      double v87 = -[BWPhotonicEngineNodeConfiguration gainMapMainImageDownscalingFactor](*(void *)(a1 + 112));
      [(BWVideoFormatRequirements *)v85 setHeight:(unint64_t)(float)((float)SHIDWORD(v70) / *(float *)&v87)];
      [(BWVideoFormatRequirements *)v85 setWidthAlignment:8];
      [(BWVideoFormatRequirements *)v85 setHeightAlignment:8];
      v597 = v85;
      id v88 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v597 count:1]);
      uint64_t v89 = [NSString stringWithFormat:@"Deep Fusion Enhanced Resolution Gain Map pool (%@)", BWStringForOSType(0x4C303038u)];
      uint64_t v90 = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:]([BWPixelBufferPool alloc], "initWithVideoFormat:capacity:name:memoryPool:", v88, (int)-[BWPhotonicEngineNodeConfiguration outputBufferCount](*(void *)(a1 + 112)), v89, v520);
      *(void *)(a1 + 464) = v90;
      if (!v90) {
        goto LABEL_565;
      }
    }
  }
  if (*(void *)(a1 + 776))
  {
    int64_t v91 = -[BWPhotonicEngineNode _disparityProcessorInputDimensions](a1);
    uint64_t v92 = [(BWSoftISPProcessorController *)obj outputPixelFormatForCaptureType:10 processingMode:3];
    v93 = objc_alloc_init(BWVideoFormatRequirements);
    [(BWVideoFormatRequirements *)v93 setWidth:(int)v91];
    [(BWVideoFormatRequirements *)v93 setHeight:v91 >> 32];
    uint64_t v596 = [NSNumber numberWithUnsignedInt:v92];
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v93, "setSupportedPixelFormats:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v596 count:1]);
    v595 = v93;
    id v94 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v595 count:1]);
    uint64_t v95 = 2 * [*(id *)(a1 + 16) owningNodeRetainedBufferCount] + 2;
    uint64_t v96 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "primaryMediaConfiguration"), "pixelBufferPoolProvidesBackPressure");
    LOBYTE(v463) = v96;
    double v97 = [[BWPixelBufferPool alloc] initWithVideoFormat:v94 capacity:v95 name:@"Disparity Processor Input SoftISP output pool" clientProvidesPool:0 memoryPool:v520 providesBackPressure:v96 reportSlowBackPressureAllocations:v463];
    if (!v97) {
      goto LABEL_565;
    }
    unsigned int v98 = v97;
    objc_msgSend(v514, "setObject:forKeyedSubscript:", v97, objc_msgSend(NSNumber, "numberWithUnsignedInt:", v92));
  }
  unsigned int v99 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  unsigned int v100 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v4 = v519;
  v500 = v100;
  if (!FigCaptureVideoDimensionsAreValid(v505)) {
    goto LABEL_188;
  }
  FigDebugIsInternalBuild();
  uint64_t v101 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 5);
  mach_absolute_time();
  uint64_t v491 = v101;
  [v519 addObject:v101];
  v494 = v99;
  [v99 setObject:FigCaptureDictionaryRepresentationForDimensions(v512 | (v511 << 32)) forKeyedSubscript:&unk_1EFB024E0];
  if (*(void *)(a1 + 424) && FigCaptureVideoDimensionsAreValid(v70))
  {
    uint64_t v102 = [(BWSoftISPProcessorController *)obj outputPixelFormatForCaptureType:12 processingMode:0];
    v103 = objc_alloc_init(BWVideoFormatRequirements);
    [(BWVideoFormatRequirements *)v103 setWidth:v512];
    [(BWVideoFormatRequirements *)v103 setHeight:(int)v511];
    [(BWVideoFormatRequirements *)v103 setWidthAlignment:16];
    [(BWVideoFormatRequirements *)v103 setHeightAlignment:16];
    uint64_t v594 = [NSNumber numberWithUnsignedInt:v102];
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v103, "setSupportedPixelFormats:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v594 count:1]);
    v593 = v103;
    v104 = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:]([BWPixelBufferPool alloc], "initWithVideoFormat:capacity:name:memoryPool:", +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v593 count:1]), 1, @"Deep Fusion Ultra High Resolution SoftISP output pool", v520);
    if (!v104) {
      goto LABEL_565;
    }
    v105 = v104;
    objc_msgSend(v506, "setObject:forKeyedSubscript:", v104, objc_msgSend(NSNumber, "numberWithUnsignedInt:", v102));

    BOOL v106 = -[BWPhotonicEngineNodeConfiguration semanticStyleRenderingEnabled](*(void *)(a1 + 112))
        && !FigCaptureVideoDimensionsAreValid([*(id *)(a1 + 704) stereoPhotoOutputDimensions]);
    BOOL v107 = objc_alloc_init(BWVideoFormatRequirements);
    -[BWVideoFormatRequirements setWidth:](v107, "setWidth:");
    uint64_t v490 = v70 >> 32;
    -[BWVideoFormatRequirements setHeight:](v107, "setHeight:");
    [(BWVideoFormatRequirements *)v107 setWidthAlignment:16];
    [(BWVideoFormatRequirements *)v107 setHeightAlignment:16];
    [(BWVideoFormatRequirements *)v107 setSupportedPixelFormats:&unk_1EFB04DF0];
    v592 = v107;
    id v108 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v592 count:1]);
    uint64_t v109 = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:]([BWPixelBufferPool alloc], "initWithVideoFormat:capacity:name:memoryPool:", v108, 1, [NSString stringWithFormat:@"Deep Zoom Transfer high resolution input pool (%@)", BWStringForOSType(0x68663230u)], v520);
    *(void *)(a1 + 720) = v109;
    if (!v109) {
      goto LABEL_565;
    }
    uint64_t v110 = 1751527984;
    if (!v106) {
      uint64_t v110 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "videoFormat"), "pixelFormat");
    }
    uint64_t v111 = objc_alloc_init(BWVideoFormatRequirements);
    [(BWVideoFormatRequirements *)v111 setWidth:(int)v70];
    [(BWVideoFormatRequirements *)v111 setHeight:v490];
    [(BWVideoFormatRequirements *)v111 setWidthAlignment:16];
    [(BWVideoFormatRequirements *)v111 setHeightAlignment:16];
    uint64_t v591 = [NSNumber numberWithUnsignedInt:v110];
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v111, "setSupportedPixelFormats:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v591 count:1]);
    if ([v508 colorSpaceProperties])
    {
      uint64_t v590 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v508, "colorSpaceProperties"));
      uint64_t v112 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v590 count:1];
    }
    else
    {
      uint64_t v112 = 0;
    }
    [(BWVideoFormatRequirements *)v111 setSupportedColorSpaceProperties:v112];
    v589 = v111;
    id v113 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v589 count:1]);
    uint64_t v114 = [NSString stringWithFormat:@"Deep Zoom Transfer output pool (%@)", BWStringForOSType(v110)];
    long long v115 = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:]([BWPixelBufferPool alloc], "initWithVideoFormat:capacity:name:memoryPool:", v113, (int)-[BWPhotonicEngineNodeConfiguration maxDeepFusionOutputCount](*(void *)(a1 + 112)), v114, v520);
    *(void *)(a1 + 728) = v115;
    if (!v115) {
      goto LABEL_565;
    }
    if (v106)
    {
      uint64_t v116 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "videoFormat"), "pixelFormat");
      long long v117 = objc_alloc_init(BWVideoFormatRequirements);
      -[BWVideoFormatRequirements setWidth:](v117, "setWidth:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "videoFormat"), "width"));
      -[BWVideoFormatRequirements setHeight:](v117, "setHeight:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "videoFormat"), "height"));
      [(BWVideoFormatRequirements *)v117 setWidthAlignment:16];
      [(BWVideoFormatRequirements *)v117 setHeightAlignment:16];
      uint64_t v588 = [NSNumber numberWithUnsignedInt:v116];
      -[BWVideoFormatRequirements setSupportedPixelFormats:](v117, "setSupportedPixelFormats:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v588 count:1]);
      if ([v508 colorSpaceProperties])
      {
        uint64_t v587 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v508, "colorSpaceProperties"));
        uint64_t v118 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v587 count:1];
      }
      else
      {
        uint64_t v118 = 0;
      }
      [(BWVideoFormatRequirements *)v117 setSupportedColorSpaceProperties:v118];
      v586 = v117;
      id v119 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v586 count:1]);
      long long v120 = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:]([BWPixelBufferPool alloc], "initWithVideoFormat:capacity:name:memoryPool:", v119, 1, [NSString stringWithFormat:@"Deep Fusion Enhanced Resolution output pool (%@)", BWStringForOSType(0x68663230u)], v520);
      *(void *)(a1 + 456) = v120;
      if (!v120) {
        goto LABEL_565;
      }
      long long v121 = objc_alloc_init(BWVideoFormatRequirements);
      [(BWVideoFormatRequirements *)v121 setWidth:(int)v70];
      [(BWVideoFormatRequirements *)v121 setHeight:v490];
      [(BWVideoFormatRequirements *)v121 setWidthAlignment:16];
      [(BWVideoFormatRequirements *)v121 setHeightAlignment:16];
      uint64_t v585 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "videoFormat"), "pixelFormat"));
      -[BWVideoFormatRequirements setSupportedPixelFormats:](v121, "setSupportedPixelFormats:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v585 count:1]);
      if ([v508 colorSpaceProperties])
      {
        uint64_t v584 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v508, "colorSpaceProperties"));
        uint64_t v122 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v584 count:1];
      }
      else
      {
        uint64_t v122 = 0;
      }
      [(BWVideoFormatRequirements *)v121 setSupportedColorSpaceProperties:v122];
      v583 = v121;
      id v123 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v583 count:1]);
      long long v124 = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:]([BWPixelBufferPool alloc], "initWithVideoFormat:capacity:name:memoryPool:", v123, 1, [NSString stringWithFormat:@"Deep Fusion Enhanced Resolution Semantic Style output pool (%@)", BWStringForOSType(0x68663230u)], v520);
      *(void *)(a1 + 472) = v124;
      if (!v124) {
        goto LABEL_565;
      }
    }
    [*(id *)(a1 + 704) setOutputFormat:v113];
    [*(id *)(a1 + 424) setMaxInputDimensions:v512 | (v511 << 32)];
    [*(id *)(a1 + 424) setMaxOutputDimensions:v70];
    if (v497)
    {
      long long v125 = objc_alloc_init(BWVideoFormatRequirements);
      [(BWVideoFormatRequirements *)v125 setWidth:(int)v70];
      [(BWVideoFormatRequirements *)v125 setHeight:v490];
      [(BWVideoFormatRequirements *)v125 setWidthAlignment:16];
      [(BWVideoFormatRequirements *)v125 setHeightAlignment:16];
      uint64_t v582 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "videoFormat"), "pixelFormat"));
      -[BWVideoFormatRequirements setSupportedPixelFormats:](v125, "setSupportedPixelFormats:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v582 count:1]);
      if ([v508 colorSpaceProperties])
      {
        uint64_t v581 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v508, "colorSpaceProperties"));
        uint64_t v126 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v581 count:1];
      }
      else
      {
        uint64_t v126 = 0;
      }
      [(BWVideoFormatRequirements *)v125 setSupportedColorSpaceProperties:v126];
      v580 = v125;
      id v127 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v580 count:1]);
      uint64_t v128 = [NSString stringWithFormat:@"Smart Style Enhanced Resolution output pool (%@)", BWStringForOSType(objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "videoFormat"), "pixelFormat"))];
      long long v129 = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:]([BWPixelBufferPool alloc], "initWithVideoFormat:capacity:name:memoryPool:", v127, (int)-[BWPhotonicEngineNodeConfiguration maxDeepFusionOutputCount](*(void *)(a1 + 112)), v128, v520);
      *(void *)(a1 + 840) = v129;
      if (!v129) {
        goto LABEL_565;
      }
    }
    *(_DWORD *)(a1 + 736) = 0;
  }
  if (-[BWPhotonicEngineNodeConfiguration ultraHighResolutionProcessingEnabled](*(void *)(a1 + 112)))
  {
    long long v527 = 0u;
    long long v528 = 0u;
    long long v525 = 0u;
    long long v526 = 0u;
    uint64_t v130 = (void *)-[BWPhotonicEngineNodeConfiguration dimensionsByQSubResolutionFlavorByPortType](*(void *)(a1 + 112));
    id v131 = BWPortTypesWithQSubResolutionFlavor(v130, 2);
    uint64_t v132 = [v131 countByEnumeratingWithState:&v525 objects:v579 count:16];
    if (v132)
    {
      uint64_t v133 = v132;
      uint64_t v134 = *(void *)v526;
      v135 = v508;
      while (2)
      {
        for (uint64_t j = 0; j != v133; ++j)
        {
          if (*(void *)v526 != v134) {
            objc_enumerationMutation(v131);
          }
          uint64_t v137 = *(void *)(*((void *)&v525 + 1) + 8 * j);
          if ([(id)-[BWPhotonicEngineNodeConfiguration portTypesWithGeometricDistortionCorrectionEnabled](*(void *)(a1 + 112)) containsObject:v137] & 1) != 0|| (objc_msgSend((id)-[BWPhotonicEngineNodeConfiguration portTypesWithIntelligentDistortionCorrectionEnabled](*(void *)(a1 + 112)), "containsObject:", v137))
          {
            char v138 = 1;
            goto LABEL_151;
          }
        }
        uint64_t v133 = [v131 countByEnumeratingWithState:&v525 objects:v579 count:16];
        char v138 = 0;
        if (v133) {
          continue;
        }
        break;
      }
    }
    else
    {
      char v138 = 0;
      v135 = v508;
    }
LABEL_151:
    uint64_t v139 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "videoFormat"), "pixelFormat");
    v140 = objc_alloc_init(BWVideoFormatRequirements);
    -[BWVideoFormatRequirements setWidth:](v140, "setWidth:");
    -[BWVideoFormatRequirements setHeight:](v140, "setHeight:");
    [(BWVideoFormatRequirements *)v140 setBytesPerRowAlignment:16];
    [(BWVideoFormatRequirements *)v140 setHeightAlignment:16];
    uint64_t v578 = [NSNumber numberWithUnsignedInt:v139];
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v140, "setSupportedPixelFormats:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v578 count:1]);
    if ([v135 colorSpaceProperties])
    {
      uint64_t v577 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v135, "colorSpaceProperties"));
      uint64_t v141 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v577 count:1];
    }
    else
    {
      uint64_t v141 = 0;
    }
    uint64_t v142 = v512 | (v511 << 32);
    [(BWVideoFormatRequirements *)v140 setSupportedColorSpaceProperties:v141];
    v576 = v140;
    char v489 = v138;
    v143 = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:]([BWPixelBufferPool alloc], "initWithVideoFormat:capacity:name:memoryPool:", +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v576 count:1]), (uint64_t)(int)-[BWPhotonicEngineNodeConfiguration outputBufferCount](*(void *)(a1 + 112)) << v138, @"Ultra High Resolution output pool", v520);
    if (v143)
    {
      v144 = v143;
      objc_msgSend(v506, "setObject:forKeyedSubscript:", v143, objc_msgSend(NSNumber, "numberWithUnsignedInt:", v139));

      v145 = v500;
      if ([*(id *)(a1 + 112) deferredPhotoProcessorEnabled]) {
        goto LABEL_158;
      }
      uint64_t v146 = [(BWSoftISPProcessorController *)obj outputPixelFormatForCaptureType:1 processingMode:0];
      v147 = objc_alloc_init(BWVideoFormatRequirements);
      [(BWVideoFormatRequirements *)v147 setWidth:v512];
      [(BWVideoFormatRequirements *)v147 setHeight:(int)v511];
      [(BWVideoFormatRequirements *)v147 setWidthAlignment:16];
      [(BWVideoFormatRequirements *)v147 setHeightAlignment:16];
      uint64_t v575 = [NSNumber numberWithUnsignedInt:v146];
      -[BWVideoFormatRequirements setSupportedPixelFormats:](v147, "setSupportedPixelFormats:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v575 count:1]);
      v574 = v147;
      v148 = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:]([BWPixelBufferPool alloc], "initWithVideoFormat:capacity:name:memoryPool:", +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v574 count:1]), 1, @"Ultra High Resolution YUV SoftISP output pool", v520);
      if (v148)
      {
        v149 = v148;
        objc_msgSend(v506, "setObject:forKeyedSubscript:", v148, objc_msgSend(NSNumber, "numberWithUnsignedInt:", v146));

        v145 = v500;
LABEL_158:
        [v145 setObject:FigCaptureDictionaryRepresentationForDimensions(v512 | (v511 << 32)) forKeyedSubscript:&unk_1EFB024E0];
        if (*(void *)(a1 + 408)
          && (-[BWPhotonicEngineNodeConfiguration learnedNRMode](*(void *)(a1 + 112)) & 4) != 0)
        {
          uint64_t v150 = [(BWSoftISPProcessorController *)obj outputPixelFormatForCaptureType:1 captureFlags:128 processingMode:0 isQuadra:1];
          v151 = objc_alloc_init(BWVideoFormatRequirements);
          [(BWVideoFormatRequirements *)v151 setWidth:v512];
          [(BWVideoFormatRequirements *)v151 setHeight:(int)v511];
          [(BWVideoFormatRequirements *)v151 setWidthAlignment:16];
          [(BWVideoFormatRequirements *)v151 setHeightAlignment:16];
          uint64_t v573 = [NSNumber numberWithUnsignedInt:v150];
          -[BWVideoFormatRequirements setSupportedPixelFormats:](v151, "setSupportedPixelFormats:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v573 count:1]);
          v572 = v151;
          id v488 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v572 count:1]);
          v152 = objc_alloc_init(BWVideoFormatRequirements);
          [(BWVideoFormatRequirements *)v152 setWidth:v512];
          [(BWVideoFormatRequirements *)v152 setHeight:(int)v511];
          [(BWVideoFormatRequirements *)v152 setWidthAlignment:16];
          [(BWVideoFormatRequirements *)v152 setHeightAlignment:16];
          uint64_t v571 = [NSNumber numberWithUnsignedInt:1751527984];
          -[BWVideoFormatRequirements setSupportedPixelFormats:](v152, "setSupportedPixelFormats:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v571 count:1]);
          v570 = v152;
          id v153 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v570 count:1]);
          v154 = objc_msgSend(v506, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:"));
          if (v154)
          {
            v155 = v154;
            uint64_t v156 = (uint64_t)v488;
            unint64_t v157 = [v154 capacity];
            if (v157 <= 1) {
              uint64_t v158 = 1;
            }
            else {
              uint64_t v158 = v157;
            }
            uint64_t v142 = v512 | (v511 << 32);
            if (v158 != [v155 capacity]) {
              [v155 setCapacity:v158];
            }
          }
          else
          {
            [NSString stringWithFormat:@"Ultra High Resolution SoftISP output pool (%@)", BWStringForOSType(v150)];
            uint64_t v156 = (uint64_t)v488;
            v159 = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:]([BWPixelBufferPool alloc], "initWithVideoFormat:capacity:name:memoryPool:");
            uint64_t v142 = v512 | (v511 << 32);
            if (!v159) {
              goto LABEL_565;
            }
            v160 = v159;
            objc_msgSend(v506, "setObject:forKeyedSubscript:", v159, objc_msgSend(NSNumber, "numberWithUnsignedInt:", v150));
          }
          objc_msgSend(*(id *)(a1 + 408), "setInputFormatsByQSubResolutionFlavor:", pen_inputFormatsByQSubResolutionFlavorByAddingFormatForFlavor(objc_msgSend(*(id *)(a1 + 408), "inputFormatsByQSubResolutionFlavor"), 2, v156));
          [*(id *)(a1 + 408) setUltraHighResolutionOutputFormat:v153];
        }
        char v161 = v489;
        if ([*(id *)(a1 + 360) demosaicedRawEnabled])
        {
          v162 = -[BWPhotonicEngineNode _demosaicedRawFormatRequirementsWithDimensions:colorSpaceProperties:](a1, v142, objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "formatRequirements"), "supportedColorSpaceProperties"), "firstObject"), "intValue"));
          [(BWVideoFormatRequirements *)v162 setWidthAlignment:16];
          [(BWVideoFormatRequirements *)v162 setHeightAlignment:16];
          v569 = v162;
          id v163 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v569 count:1]);
          uint64_t v164 = (uint64_t)(int)-[BWPhotonicEngineNodeConfiguration outputBufferCount](*(void *)(a1 + 112)) << v489;
          v165 = objc_msgSend(v506, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v163, "pixelFormat")));
          if (v165)
          {
            objc_msgSend(v165, "setCapacity:", objc_msgSend(v165, "capacity") + v164);
          }
          else
          {
            v166 = [[BWPixelBufferPool alloc] initWithVideoFormat:v163 capacity:v164 name:@"Ultra High Resolution Demosaiced RAW pool" memoryPool:v520];
            if (!v166) {
              goto LABEL_565;
            }
            v167 = v166;
            objc_msgSend(v506, "setObject:forKeyedSubscript:", v166, objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v163, "pixelFormat")));

            char v161 = v489;
          }
        }
        v168 = objc_alloc_init(BWVideoFormatRequirements);
        [(BWVideoFormatRequirements *)v168 setSupportedPixelFormats:&unk_1EFB04E08];
        double v169 = -[BWPhotonicEngineNodeConfiguration gainMapMainImageDownscalingFactor](*(void *)(a1 + 112));
        [(BWVideoFormatRequirements *)v168 setWidth:(unint64_t)(float)((float)v512 / *(float *)&v169)];
        double v170 = -[BWPhotonicEngineNodeConfiguration gainMapMainImageDownscalingFactor](*(void *)(a1 + 112));
        [(BWVideoFormatRequirements *)v168 setHeight:(unint64_t)(float)((float)(int)v511 / *(float *)&v170)];
        v568 = v168;
        v171 = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:]([BWPixelBufferPool alloc], "initWithVideoFormat:capacity:name:memoryPool:", +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v568 count:1]), (uint64_t)(int)-[BWPhotonicEngineNodeConfiguration outputBufferCount](*(void *)(a1 + 112)) << v161, @"Ultra High Resolution Gain Map pool", v520);
        if (!v171) {
          goto LABEL_565;
        }
        v172 = v171;
        objc_msgSend(v506, "setObject:forKeyedSubscript:", v171, objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BWPixelBufferPool pixelFormat](v171, "pixelFormat")));

        if (v497)
        {
          v173 = objc_alloc_init(BWVideoFormatRequirements);
          [(BWVideoFormatRequirements *)v173 setWidth:v512];
          [(BWVideoFormatRequirements *)v173 setHeight:(int)v511];
          [(BWVideoFormatRequirements *)v173 setWidthAlignment:16];
          [(BWVideoFormatRequirements *)v173 setHeightAlignment:16];
          uint64_t v567 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "videoFormat"), "pixelFormat"));
          -[BWVideoFormatRequirements setSupportedPixelFormats:](v173, "setSupportedPixelFormats:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v567 count:1]);
          if ([v508 colorSpaceProperties])
          {
            uint64_t v566 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v508, "colorSpaceProperties"));
            uint64_t v174 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v566 count:1];
          }
          else
          {
            uint64_t v174 = 0;
          }
          [(BWVideoFormatRequirements *)v173 setSupportedColorSpaceProperties:v174];
          v565 = v173;
          id v175 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v565 count:1]);
          uint64_t v176 = [NSString stringWithFormat:@"Smart Style Ultra High Resolution output pool (%@)", BWStringForOSType(objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "videoFormat"), "pixelFormat"))];
          v177 = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:]([BWPixelBufferPool alloc], "initWithVideoFormat:capacity:name:memoryPool:", v175, (int)-[BWPhotonicEngineNodeConfiguration maxDeepFusionOutputCount](*(void *)(a1 + 112)), v176, v520);
          *(void *)(a1 + 848) = v177;
          if (!v177) {
            goto LABEL_565;
          }
        }
        goto LABEL_180;
      }
    }
LABEL_580:
    FigDebugAssert3();
    goto LABEL_565;
  }
LABEL_180:
  uint64_t v4 = v519;
  if (dword_1EB4C5670)
  {
    unsigned int v534 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v178 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v179 = v534;
    if (os_log_type_enabled(v178, type)) {
      unsigned int v180 = v179;
    }
    else {
      unsigned int v180 = v179 & 0xFFFFFFFE;
    }
    if (v180)
    {
      mach_absolute_time();
      uint64_t v181 = FigHostTimeToNanoseconds();
      int v611 = 136315650;
      v612 = "-[BWPhotonicEngineNode _setupProcessorCoordinator]";
      __int16 v613 = 2114;
      uint64_t v614 = v491;
      __int16 v615 = 2048;
      double v616 = (double)(v181 / 1000) / 1000.0;
      LODWORD(v486) = 32;
      v464 = &v611;
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(v519, "removeLastObject", v464, v486);
  unsigned int v99 = v494;
  unsigned int v100 = v500;
LABEL_188:
  *(void *)(a1 + 272) = [objc_alloc(MEMORY[0x1E4F1C9E8]) initWithDictionary:v514];
  if ([v19 count])
  {
    [v99 setObject:FigCaptureDictionaryRepresentationForDimensions(v510) forKeyedSubscript:&unk_1EFB02510];
    [v100 setObject:FigCaptureDictionaryRepresentationForDimensions(v510) forKeyedSubscript:&unk_1EFB02510];
    if (v509)
    {
      v495 = v99;
      uint64_t v182 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "videoFormat"), "pixelFormat");
      v183 = objc_alloc_init(BWVideoFormatRequirements);
      -[BWVideoFormatRequirements setWidth:](v183, "setWidth:");
      uint64_t v184 = v510 >> 32;
      [(BWVideoFormatRequirements *)v183 setHeight:v510 >> 32];
      [(BWVideoFormatRequirements *)v183 setBytesPerRowAlignment:16];
      [(BWVideoFormatRequirements *)v183 setHeightAlignment:16];
      uint64_t v564 = [NSNumber numberWithUnsignedInt:v182];
      -[BWVideoFormatRequirements setSupportedPixelFormats:](v183, "setSupportedPixelFormats:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v564 count:1]);
      if ([v508 colorSpaceProperties])
      {
        uint64_t v563 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v508, "colorSpaceProperties"));
        uint64_t v185 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v563 count:1];
      }
      else
      {
        uint64_t v185 = 0;
      }
      [(BWVideoFormatRequirements *)v183 setSupportedColorSpaceProperties:v185];
      v562 = v183;
      id v186 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v562 count:1]);
      v187 = -[BWOnDemandPixelBufferAllocator initWithVideoFormat:name:memoryPool:additionalPixelBufferAttributes:]([BWOnDemandPixelBufferAllocator alloc], "initWithVideoFormat:name:memoryPool:additionalPixelBufferAttributes:", v186, [NSString stringWithFormat:@"ZoomBased QSub output on-demand allocator (%@)", BWStringForOSType(v182)], v520, 0);
      if (!v187) {
        goto LABEL_565;
      }
      v188 = v187;
      objc_msgSend(v507, "setObject:forKeyedSubscript:", v187, objc_msgSend(NSNumber, "numberWithUnsignedInt:", v182));

      if (([*(id *)(a1 + 360) fusionEnabled] & 1) != 0
        || ([*(id *)(a1 + 360) lowLightFusionEnabled] & 1) != 0
        || ([*(id *)(a1 + 360) rawNightModeEnabled] & 1) != 0
        || [*(id *)(a1 + 360) demosaicedRawEnabled]
        && ([*(id *)(a1 + 112) deferredPhotoProcessorEnabled] & 1) == 0)
      {
        uint64_t v189 = [(BWSoftISPProcessorController *)obj outputPixelFormatForCaptureType:10 processingMode:0];
        if (!objc_msgSend(v507, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v189)))
        {
          v190 = objc_alloc_init(BWVideoFormatRequirements);
          [(BWVideoFormatRequirements *)v190 setWidth:(int)v510];
          [(BWVideoFormatRequirements *)v190 setHeight:v184];
          [(BWVideoFormatRequirements *)v190 setWidthAlignment:16];
          [(BWVideoFormatRequirements *)v190 setHeightAlignment:16];
          uint64_t v561 = [NSNumber numberWithUnsignedInt:v189];
          -[BWVideoFormatRequirements setSupportedPixelFormats:](v190, "setSupportedPixelFormats:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v561 count:1]);
          v560 = v190;
          id v191 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v560 count:1]);
          v192 = -[BWOnDemandPixelBufferAllocator initWithVideoFormat:name:memoryPool:additionalPixelBufferAttributes:]([BWOnDemandPixelBufferAllocator alloc], "initWithVideoFormat:name:memoryPool:additionalPixelBufferAttributes:", v191, [NSString stringWithFormat:@"ZoomBased QSub YUV SoftISP output on-demand allocator (%@)", BWStringForOSType(v189)], v520, 0);
          if (!v192) {
            goto LABEL_565;
          }
          v193 = v192;
          objc_msgSend(v507, "setObject:forKeyedSubscript:", v192, objc_msgSend(NSNumber, "numberWithUnsignedInt:", v189));
        }
      }
      if (*(void *)(a1 + 600))
      {
        uint64_t v194 = [(BWSoftISPProcessorController *)obj outputPixelFormatForCaptureType:2 processingMode:0];
        if (!objc_msgSend(v507, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v194)))
        {
          v195 = objc_alloc_init(BWVideoFormatRequirements);
          [(BWVideoFormatRequirements *)v195 setWidth:(int)v510];
          [(BWVideoFormatRequirements *)v195 setHeight:v184];
          [(BWVideoFormatRequirements *)v195 setWidthAlignment:16];
          [(BWVideoFormatRequirements *)v195 setHeightAlignment:16];
          uint64_t v559 = [NSNumber numberWithUnsignedInt:v194];
          -[BWVideoFormatRequirements setSupportedPixelFormats:](v195, "setSupportedPixelFormats:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v559 count:1]);
          v558 = v195;
          id v196 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v558 count:1]);
          v197 = -[BWOnDemandPixelBufferAllocator initWithVideoFormat:name:memoryPool:additionalPixelBufferAttributes:]([BWOnDemandPixelBufferAllocator alloc], "initWithVideoFormat:name:memoryPool:additionalPixelBufferAttributes:", v196, [NSString stringWithFormat:@"ZoomBased QSub SWFR SoftISP output on-demand allocator (%@)", BWStringForOSType(v194)], v520, 0);
          if (!v197) {
            goto LABEL_565;
          }
          v198 = v197;
          objc_msgSend(v507, "setObject:forKeyedSubscript:", v197, objc_msgSend(NSNumber, "numberWithUnsignedInt:", v194));
        }
      }
      if (*(void *)(a1 + 408))
      {
        if (-[BWPhotonicEngineNodeConfiguration learnedNRMode](*(void *)(a1 + 112)))
        {
          uint64_t v199 = [(BWSoftISPProcessorController *)obj outputPixelFormatForCaptureType:1 captureFlags:128 processingMode:0];
          id v200 = +[BWVideoFormatRequirements formatRequirements];
          [v200 setWidth:(int)v510];
          [v200 setHeight:v184];
          [v200 setWidthAlignment:16];
          [v200 setHeightAlignment:16];
          uint64_t v557 = [NSNumber numberWithUnsignedInt:v199];
          objc_msgSend(v200, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v557, 1));
          id v556 = v200;
          id v201 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v556 count:1]);
          id v202 = +[BWVideoFormatRequirements formatRequirements];
          [v202 setWidth:(int)v510];
          [v202 setHeight:v184];
          [v202 setWidthAlignment:16];
          [v202 setHeightAlignment:16];
          [v202 setSupportedPixelFormats:&unk_1EFB04E20];
          id v555 = v202;
          id v203 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v555 count:1]);
          objc_msgSend(*(id *)(a1 + 408), "setInputFormatsByQSubResolutionFlavor:", pen_inputFormatsByQSubResolutionFlavorByAddingFormatForFlavor(objc_msgSend(*(id *)(a1 + 408), "inputFormatsByQSubResolutionFlavor"), 1, (uint64_t)v201));
          [*(id *)(a1 + 408) setZoomBasedOutputFormat:v203];
          if (!objc_msgSend(v507, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v199)))
          {
            v204 = -[BWOnDemandPixelBufferAllocator initWithVideoFormat:name:memoryPool:additionalPixelBufferAttributes:]([BWOnDemandPixelBufferAllocator alloc], "initWithVideoFormat:name:memoryPool:additionalPixelBufferAttributes:", v201, [NSString stringWithFormat:@"ZoomBased QSub LearnedNR SoftISP output pool (%@)", BWStringForOSType(v199)], v520, 0);
            if (!v204) {
              goto LABEL_565;
            }
            objc_msgSend(v507, "setObject:forKeyedSubscript:", v204, objc_msgSend(NSNumber, "numberWithUnsignedInt:", v199));
          }
        }
      }
      if ([*(id *)(a1 + 360) rawNightModeEnabled])
      {
        uint64_t v205 = [(BWSoftISPProcessorController *)obj outputPixelFormatForCaptureType:11 captureFlags:0x800000000 processingMode:0];
        if (!objc_msgSend(v507, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v205)))
        {
          v206 = objc_alloc_init(BWVideoFormatRequirements);
          [(BWVideoFormatRequirements *)v206 setWidth:(int)v510];
          [(BWVideoFormatRequirements *)v206 setHeight:v184];
          [(BWVideoFormatRequirements *)v206 setWidthAlignment:16];
          [(BWVideoFormatRequirements *)v206 setHeightAlignment:16];
          uint64_t v554 = [NSNumber numberWithUnsignedInt:v205];
          -[BWVideoFormatRequirements setSupportedPixelFormats:](v206, "setSupportedPixelFormats:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v554 count:1]);
          v553 = v206;
          id v207 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v553 count:1]);
          v208 = -[BWOnDemandPixelBufferAllocator initWithVideoFormat:name:memoryPool:additionalPixelBufferAttributes:]([BWOnDemandPixelBufferAllocator alloc], "initWithVideoFormat:name:memoryPool:additionalPixelBufferAttributes:", v207, [NSString stringWithFormat:@"ZoomBased QSub RawNightMode SoftISP output on-demand allocator (%@)", BWStringForOSType(v205)], v520, 0);
          if (!v208) {
            goto LABEL_565;
          }
          v209 = v208;
          objc_msgSend(v507, "setObject:forKeyedSubscript:", v208, objc_msgSend(NSNumber, "numberWithUnsignedInt:", v205));
        }
      }
      uint64_t v4 = v519;
      if (([*(id *)(a1 + 360) deepFusionEnabled] & 1) != 0 || *(void *)(a1 + 424))
      {
        uint64_t v210 = [(BWSoftISPProcessorController *)obj outputPixelFormatForCaptureType:12 processingMode:0];
        v211 = objc_alloc_init(BWVideoFormatRequirements);
        [(BWVideoFormatRequirements *)v211 setWidth:(int)v510];
        [(BWVideoFormatRequirements *)v211 setHeight:v184];
        [(BWVideoFormatRequirements *)v211 setWidthAlignment:16];
        [(BWVideoFormatRequirements *)v211 setHeightAlignment:16];
        uint64_t v552 = [NSNumber numberWithUnsignedInt:v210];
        -[BWVideoFormatRequirements setSupportedPixelFormats:](v211, "setSupportedPixelFormats:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v552 count:1]);
        v551 = v211;
        id v212 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v551 count:1]);
        uint64_t v213 = [NSString stringWithFormat:@"ZoomBased QSub DeepFusion SoftISP output on-demand allocator (%@)", BWStringForOSType(v210)];
        if (!objc_msgSend(v507, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v210)))
        {
          v214 = [[BWOnDemandPixelBufferAllocator alloc] initWithVideoFormat:v212 name:v213 memoryPool:v520 additionalPixelBufferAttributes:0];
          if (!v214) {
            goto LABEL_565;
          }
          v215 = v214;
          objc_msgSend(v507, "setObject:forKeyedSubscript:", v214, objc_msgSend(NSNumber, "numberWithUnsignedInt:", v210));

          uint64_t v4 = v519;
        }
        [*(id *)(a1 + 424) setMaxInputDimensions:v510];
        [*(id *)(a1 + 424) setMaxOutputDimensions:v510];
      }
      if ([*(id *)(a1 + 360) demosaicedRawEnabled])
      {
        v216 = -[BWPhotonicEngineNode _demosaicedRawFormatRequirementsWithDimensions:colorSpaceProperties:](a1, v510, objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "formatRequirements"), "supportedColorSpaceProperties"), "firstObject"), "intValue"));
        [(BWVideoFormatRequirements *)v216 setWidthAlignment:16];
        [(BWVideoFormatRequirements *)v216 setHeightAlignment:16];
        v550 = v216;
        id v217 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v550 count:1]);
        if (!objc_msgSend(v507, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", *(unsigned int *)(a1 + 1000))))
        {
          v218 = -[BWOnDemandPixelBufferAllocator initWithVideoFormat:name:memoryPool:additionalPixelBufferAttributes:]([BWOnDemandPixelBufferAllocator alloc], "initWithVideoFormat:name:memoryPool:additionalPixelBufferAttributes:", v217, [NSString stringWithFormat:@"ZoomBased QSub Linear YUV output on-demand allocator (%@)", BWStringForOSType(*(_DWORD *)(a1 + 1000))], v520, 0);
          if (!v218) {
            goto LABEL_565;
          }
          v219 = v218;
          objc_msgSend(v507, "setObject:forKeyedSubscript:", v218, objc_msgSend(NSNumber, "numberWithUnsignedInt:", *(unsigned int *)(a1 + 1000)));

          uint64_t v4 = v519;
        }
      }
      double v220 = -[BWPhotonicEngineNodeConfiguration gainMapMainImageDownscalingFactor](*(void *)(a1 + 112));
      unsigned int v99 = v495;
      unsigned int v100 = v500;
      if (*(float *)&v220 != 0.0)
      {
        v221 = objc_alloc_init(BWVideoFormatRequirements);
        [(BWVideoFormatRequirements *)v221 setSupportedPixelFormats:&unk_1EFB04E38];
        double v222 = -[BWPhotonicEngineNodeConfiguration gainMapMainImageDownscalingFactor](*(void *)(a1 + 112));
        [(BWVideoFormatRequirements *)v221 setWidth:(unint64_t)(float)((float)(int)v510 / *(float *)&v222)];
        double v223 = -[BWPhotonicEngineNodeConfiguration gainMapMainImageDownscalingFactor](*(void *)(a1 + 112));
        [(BWVideoFormatRequirements *)v221 setHeight:(unint64_t)(float)((float)SHIDWORD(v510) / *(float *)&v223)];
        v549 = v221;
        id v224 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v549 count:1]);
        v225 = -[BWOnDemandPixelBufferAllocator initWithVideoFormat:name:memoryPool:additionalPixelBufferAttributes:]([BWOnDemandPixelBufferAllocator alloc], "initWithVideoFormat:name:memoryPool:additionalPixelBufferAttributes:", v224, [NSString stringWithFormat:@"ZoomBased QSub gain map on-demand allocator (%@)", BWStringForOSType(0x4C303038u)], v520, 0);
        if (!v225) {
          goto LABEL_565;
        }
        v226 = v225;
        [v507 setObject:v225 forKeyedSubscript:&unk_1EFB02468];

        uint64_t v4 = v519;
        unsigned int v99 = v495;
        unsigned int v100 = v500;
      }
    }
  }
  [*(id *)(a1 + 264) setOutputDimensionsByQSubResolutionFlavor:v99];
  [*(id *)(a1 + 360) setDimensionsByQSubResolutionFlavor:v100];
  [v518 addObject:obj];
  if (dword_1EB4C5670)
  {
    unsigned int v534 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v227 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v228 = v534;
    if (os_log_type_enabled(v227, type)) {
      unsigned int v229 = v228;
    }
    else {
      unsigned int v229 = v228 & 0xFFFFFFFE;
    }
    if (v229)
    {
      mach_absolute_time();
      uint64_t v230 = FigHostTimeToNanoseconds();
      int v611 = 136315650;
      v612 = "-[BWPhotonicEngineNode _setupProcessorCoordinator]";
      __int16 v613 = 2114;
      uint64_t v614 = v492;
      __int16 v615 = 2048;
      double v616 = (double)(v230 / 1000) / 1000.0;
      LODWORD(v486) = 32;
      v463 = &v611;
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(v4, "removeLastObject", v463, v486);
  unint64_t v6 = 0x1E4F29000;
  unsigned int v22 = &OBJC_IVAR___BWVideoOrientationMetadataNode__localIDOfOrientationMetadata;
  if (dword_1EB4C5670)
  {
    unsigned int v534 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v231 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v232 = v534;
    if (os_log_type_enabled(v231, type)) {
      unsigned int v233 = v232;
    }
    else {
      unsigned int v233 = v232 & 0xFFFFFFFE;
    }
    if (v233)
    {
      mach_absolute_time();
      uint64_t v234 = FigHostTimeToNanoseconds();
      int v611 = 136315650;
      v612 = "-[BWPhotonicEngineNode _setupProcessorCoordinator]";
      __int16 v613 = 2114;
      uint64_t v614 = v493;
      __int16 v615 = 2048;
      double v616 = (double)(v234 / 1000) / 1000.0;
      LODWORD(v487) = 32;
      v465 = &v611;
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    unint64_t v6 = 0x1E4F29000uLL;
  }
  objc_msgSend(v4, "removeLastObject", v465, v487);
  uint64_t v40 = v496;
LABEL_243:
  if (![*(id *)(a1 + 112) deferredPhotoProcessorEnabled]
    || -[BWPhotonicEngineNodeConfiguration learnedNRMode](*(void *)(a1 + 112)))
  {
    FigDebugIsInternalBuild();
    uint64_t v235 = objc_msgSend(*(id *)(v6 + 24), "stringWithFormat:", @"%d", 1);
    mach_absolute_time();
    [v4 addObject:v235];
    v236 = [[BWNRFProcessorController alloc] initWithConfiguration:*(void *)(a1 + 360)];
    if (*(void *)(a1 + 264))
    {
      if ([*(id *)(a1 + 360) lowLightFusionEnabled])
      {
        v237 = objc_msgSend(*(id *)(a1 + 272), "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v40));
        unint64_t v238 = [v237 capacity];
        int v239 = [(BWNRFProcessorController *)v236 progressiveLowLightFusionBatchSize]+ 2;
        if (v238 <= v239) {
          unint64_t v240 = v239;
        }
        else {
          unint64_t v240 = v238;
        }
        [v237 setCapacity:v240];
      }
      if ([*(id *)(a1 + 360) rawNightModeEnabled])
      {
        uint64_t v241 = [(BWNRFProcessorController *)v236 rawNightModeOutputPixelFormatByBufferType:31];
        v242 = objc_alloc_init(BWVideoFormatRequirements);
        -[BWVideoFormatRequirements setWidth:](v242, "setWidth:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 360), "outputFormat"), "width"));
        -[BWVideoFormatRequirements setHeight:](v242, "setHeight:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 360), "outputFormat"), "height"));
        [(BWVideoFormatRequirements *)v242 setWidthAlignment:16];
        [(BWVideoFormatRequirements *)v242 setHeightAlignment:16];
        uint64_t v548 = [NSNumber numberWithUnsignedInt:v241];
        -[BWVideoFormatRequirements setSupportedPixelFormats:](v242, "setSupportedPixelFormats:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v548 count:1]);
        v547 = v242;
        id v243 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v547 count:1]);
        v244 = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:]([BWPixelBufferPool alloc], "initWithVideoFormat:capacity:name:memoryPool:", v243, 1, [NSString stringWithFormat:@"Raw Night Mode Denoised Image pool (%@)", BWStringForOSType(v241)], v520);
        if (!v244) {
          goto LABEL_565;
        }
        *(void *)(a1 + 392) = v244;
        uint64_t v245 = [(BWNRFProcessorController *)v236 rawNightModeOutputPixelFormatByBufferType:32];
        v246 = objc_alloc_init(BWVideoFormatRequirements);
        -[BWVideoFormatRequirements setWidth:](v246, "setWidth:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 360), "outputFormat"), "width"));
        -[BWVideoFormatRequirements setHeight:](v246, "setHeight:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 360), "outputFormat"), "height"));
        [(BWVideoFormatRequirements *)v246 setWidthAlignment:16];
        [(BWVideoFormatRequirements *)v246 setHeightAlignment:16];
        uint64_t v546 = [NSNumber numberWithUnsignedInt:v245];
        -[BWVideoFormatRequirements setSupportedPixelFormats:](v246, "setSupportedPixelFormats:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v546 count:1]);
        v545 = v246;
        id v247 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v545 count:1]);
        v248 = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:]([BWPixelBufferPool alloc], "initWithVideoFormat:capacity:name:memoryPool:", v247, 1, [NSString stringWithFormat:@"Raw Night Mode Noise Map pool (%@)", BWStringForOSType(v245)], v520);
        if (!v248) {
          goto LABEL_565;
        }
        *(void *)(a1 + 400) = v248;
      }
    }
    if (!v236) {
      goto LABEL_565;
    }
    [v518 addObject:v236];
    if (dword_1EB4C5670)
    {
      unsigned int v534 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      v249 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v250 = v534;
      if (os_log_type_enabled(v249, type)) {
        unsigned int v251 = v250;
      }
      else {
        unsigned int v251 = v250 & 0xFFFFFFFE;
      }
      if (v251)
      {
        mach_absolute_time();
        uint64_t v252 = FigHostTimeToNanoseconds();
        int v611 = 136315650;
        v612 = "-[BWPhotonicEngineNode _setupProcessorCoordinator]";
        __int16 v613 = 2114;
        uint64_t v614 = v235;
        __int16 v615 = 2048;
        double v616 = (double)(v252 / 1000) / 1000.0;
        LODWORD(v486) = 32;
        v466 = &v611;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    uint64_t v4 = v519;
    objc_msgSend(v519, "removeLastObject", v466, v486);
    unint64_t v6 = 0x1E4F29000uLL;
    unsigned int v22 = &OBJC_IVAR___BWVideoOrientationMetadataNode__localIDOfOrientationMetadata;
  }
  if (*(void *)(a1 + v22[730]))
  {
    FigDebugIsInternalBuild();
    uint64_t v253 = objc_msgSend(*(id *)(v6 + 24), "stringWithFormat:", @"%d", 6);
    mach_absolute_time();
    [v4 addObject:v253];
    v254 = [[BWDeepFusionProcessorController alloc] initWithConfiguration:*(void *)(a1 + v22[730])];
    if (!v254) {
      goto LABEL_565;
    }
    [v518 addObject:v254];
    if (dword_1EB4C5670)
    {
      unsigned int v534 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      v255 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v256 = v534;
      if (os_log_type_enabled(v255, type)) {
        unsigned int v257 = v256;
      }
      else {
        unsigned int v257 = v256 & 0xFFFFFFFE;
      }
      if (v257)
      {
        mach_absolute_time();
        uint64_t v258 = FigHostTimeToNanoseconds();
        int v611 = 136315650;
        v612 = "-[BWPhotonicEngineNode _setupProcessorCoordinator]";
        __int16 v613 = 2114;
        uint64_t v614 = v253;
        __int16 v615 = 2048;
        double v616 = (double)(v258 / 1000) / 1000.0;
        LODWORD(v486) = 32;
        v467 = &v611;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    uint64_t v4 = v519;
    objc_msgSend(v519, "removeLastObject", v467, v486);
    unint64_t v6 = 0x1E4F29000uLL;
  }
  if (*(void *)(a1 + 912))
  {
    FigDebugIsInternalBuild();
    uint64_t v259 = objc_msgSend(*(id *)(v6 + 24), "stringWithFormat:", @"%d", 8);
    mach_absolute_time();
    [v4 addObject:v259];
    v260 = [[BWDeferredCaptureController alloc] initWithConfiguration:*(void *)(a1 + 912)];
    if (!v260) {
      goto LABEL_565;
    }
    [v518 addObject:v260];
    if (dword_1EB4C5670)
    {
      unsigned int v534 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      v261 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v262 = v534;
      if (os_log_type_enabled(v261, type)) {
        unsigned int v263 = v262;
      }
      else {
        unsigned int v263 = v262 & 0xFFFFFFFE;
      }
      if (v263)
      {
        mach_absolute_time();
        uint64_t v264 = FigHostTimeToNanoseconds();
        int v611 = 136315650;
        v612 = "-[BWPhotonicEngineNode _setupProcessorCoordinator]";
        __int16 v613 = 2114;
        uint64_t v614 = v259;
        __int16 v615 = 2048;
        double v616 = (double)(v264 / 1000) / 1000.0;
        LODWORD(v486) = 32;
        v468 = &v611;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    uint64_t v4 = v519;
    objc_msgSend(v519, "removeLastObject", v468, v486);
    unint64_t v6 = 0x1E4F29000uLL;
  }
  if (*(void *)(a1 + 952))
  {
    FigDebugIsInternalBuild();
    uint64_t v265 = objc_msgSend(*(id *)(v6 + 24), "stringWithFormat:", @"%d", 9);
    mach_absolute_time();
    [v4 addObject:v265];
    v266 = [[BWDeferredProcessorController alloc] initWithConfiguration:*(void *)(a1 + 952)];
    if (!v266) {
      goto LABEL_565;
    }
    [v518 addObject:v266];
    if (dword_1EB4C5670)
    {
      unsigned int v534 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      v267 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v268 = v534;
      if (os_log_type_enabled(v267, type)) {
        unsigned int v269 = v268;
      }
      else {
        unsigned int v269 = v268 & 0xFFFFFFFE;
      }
      if (v269)
      {
        mach_absolute_time();
        uint64_t v270 = FigHostTimeToNanoseconds();
        int v611 = 136315650;
        v612 = "-[BWPhotonicEngineNode _setupProcessorCoordinator]";
        __int16 v613 = 2114;
        uint64_t v614 = v265;
        __int16 v615 = 2048;
        double v616 = (double)(v270 / 1000) / 1000.0;
        LODWORD(v486) = 32;
        v469 = &v611;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    uint64_t v4 = v519;
    objc_msgSend(v519, "removeLastObject", v469, v486);
    unint64_t v6 = 0x1E4F29000uLL;
  }
  if (-[BWPhotonicEngineNodeConfiguration deepFusionSyntheticsInNRSupportEnabled](*(void *)(a1 + 112)))
  {
    FigDebugIsInternalBuild();
    uint64_t v271 = objc_msgSend(*(id *)(v6 + 24), "stringWithFormat:", @"%d", 7);
    mach_absolute_time();
    [v4 addObject:v271];
    v272 = objc_alloc_init(BWVideoFormatRequirements);
    uint64_t v273 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 360), "inputFormat"), "width");
    uint64_t v274 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 360), "inputFormat"), "height");
    unint64_t v275 = v273 + 15;
    unint64_t v276 = v274 + 15;
    [(BWVideoFormatRequirements *)v272 setWidth:(v275 >> 1) & 0x7FFFFFFFFFFFFFF8];
    [(BWVideoFormatRequirements *)v272 setHeight:(v276 >> 1) & 0x7FFFFFFFFFFFFFF8];
    [(BWVideoFormatRequirements *)v272 setSupportedPixelFormats:&unk_1EFB04E50];
    v544 = v272;
    id v277 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v544 count:1]);
    int v278 = -[BWPhotonicEngineNodeConfiguration maxDeepFusionOutputCount](*(void *)(a1 + 112));
    int v279 = -[BWPhotonicEngineNodeConfiguration maxDeepFusionOutputCount](*(void *)(a1 + 112));
    LODWORD(v272) = [*(id *)(a1 + 112) deferredCaptureSupportEnabled];
    v280 = (void *)[*(id *)(a1 + 360) inputFormat];
    id v281 = v280;
    if (v272)
    {
      id v282 = (id)objc_msgSend((id)objc_msgSend(v280, "pixelBufferAttributes"), "mutableCopy");
      [v282 setObject:&unk_1EFB04E68 forKeyedSubscript:*MEMORY[0x1E4F24CB0]];
      v283 = [[BWVideoFormatRequirements alloc] initWithPixelBufferAttributes:v282];
      if (FigCapturePixelFormatGetCompressionType(objc_msgSend((id)objc_msgSend(*(id *)(a1 + 360), "inputFormat"), "pixelFormat")))
      {
        uint64_t v543 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", FigCaptureUncompressedPixelFormatForPixelFormat(objc_msgSend((id)objc_msgSend(*(id *)(a1 + 360), "inputFormat"), "pixelFormat")));
        -[BWVideoFormatRequirements setSupportedPixelFormats:](v283, "setSupportedPixelFormats:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v543 count:1]);
      }
      v542 = v283;
      id v281 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v542 count:1]);
    }
    if (!v281 || !v278 || !v279) {
      goto LABEL_565;
    }
    uint64_t v284 = 2 * v278;
    uint64_t v285 = 3 * v279;
    if ([*(id *)(a1 + 112) deferredCaptureSupportEnabled])
    {
      v286 = [[BWDeferredContainerPixelBufferPool alloc] initWithVideoFormat:v281 capacity:v284 name:@"DeepFusion deferred synthetic intermediate pool"];
      v287 = [[BWDeferredContainerPixelBufferPool alloc] initWithVideoFormat:v277 capacity:v285 name:@"DeepFusion deferred fusion map pool"];
    }
    else
    {
      v286 = [[BWPixelBufferPool alloc] initWithVideoFormat:v281 capacity:v284 name:@"Deep Fusion synthetic intermediate pool" memoryPool:v520];
      v287 = [[BWPixelBufferPool alloc] initWithVideoFormat:v277 capacity:v285 name:@"Deep Fusion synthetic fusion map pool" memoryPool:v520];
    }
    v288 = v287;
    if (!v286) {
      goto LABEL_565;
    }
    v289 = v288;
    *(void *)(a1 + 440) = v286;
    *(void *)(a1 + 448) = v289;
    if (dword_1EB4C5670)
    {
      unsigned int v534 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      v290 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v291 = v534;
      if (os_log_type_enabled(v290, type)) {
        unsigned int v292 = v291;
      }
      else {
        unsigned int v292 = v291 & 0xFFFFFFFE;
      }
      if (v292)
      {
        mach_absolute_time();
        uint64_t v293 = FigHostTimeToNanoseconds();
        int v611 = 136315650;
        v612 = "-[BWPhotonicEngineNode _setupProcessorCoordinator]";
        __int16 v613 = 2114;
        uint64_t v614 = v271;
        __int16 v615 = 2048;
        double v616 = (double)(v293 / 1000) / 1000.0;
        LODWORD(v486) = 32;
        v470 = &v611;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    uint64_t v4 = v519;
    objc_msgSend(v519, "removeLastObject", v470, v486);
    unint64_t v6 = 0x1E4F29000uLL;
  }
  uint64_t v294 = MEMORY[0x1E4F1CC08];
  if (*(void *)(a1 + 408))
  {
    FigDebugIsInternalBuild();
    uint64_t v295 = objc_msgSend(*(id *)(v6 + 24), "stringWithFormat:", @"%d", 10);
    mach_absolute_time();
    [v4 addObject:v295];
    v296 = [[BWLearnedNRProcessorController alloc] initWithConfiguration:*(void *)(a1 + 408)];
    if (!v296)
    {
LABEL_330:
      v300 = 0;
      goto LABEL_331;
    }
    v297 = v296;
    id v298 = objc_alloc(MEMORY[0x1E4F1CA60]);
    if (*(void *)(a1 + 536)) {
      uint64_t v299 = *(void *)(a1 + 536);
    }
    else {
      uint64_t v299 = v294;
    }
    v300 = (void *)[v298 initWithDictionary:v299];
    if ([*(id *)(a1 + 408) outputFormat])
    {
      v301 = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:]([BWPixelBufferPool alloc], "initWithVideoFormat:capacity:name:memoryPool:", [*(id *)(a1 + 408) outputFormat], 1, @"LearnedNR output pool", v520);
      if (!v301) {
        goto LABEL_331;
      }
      v302 = v301;
      [v300 setObject:v301 forKeyedSubscript:0x1EFA6A6E0];
    }
    if ([*(id *)(a1 + 408) zoomBasedOutputFormat])
    {
      v303 = -[BWOnDemandPixelBufferAllocator initWithVideoFormat:name:memoryPool:additionalPixelBufferAttributes:]([BWOnDemandPixelBufferAllocator alloc], "initWithVideoFormat:name:memoryPool:additionalPixelBufferAttributes:", [*(id *)(a1 + 408) zoomBasedOutputFormat], @"Zoom based LearnedNR output allocator", v520, 0);
      if (!v303) {
        goto LABEL_331;
      }
      [v300 setObject:v303 forKeyedSubscript:0x1EFA6A700];
    }
    if (![*(id *)(a1 + 408) ultraHighResolutionOutputFormat]) {
      goto LABEL_328;
    }
    v304 = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:]([BWPixelBufferPool alloc], "initWithVideoFormat:capacity:name:memoryPool:", [*(id *)(a1 + 408) ultraHighResolutionOutputFormat], 1, @"Ultra High Resolution LearnedNR output pool", v520);
    if (v304)
    {
      v305 = v304;
      [v300 setObject:v304 forKeyedSubscript:0x1EFA6A720];

LABEL_328:
      *(void *)(a1 + 536) = v300;
      if (!-[BWLearnedNRProcessorController prepareWithPixelBufferPoolProvider:](v297, "prepareWithPixelBufferPoolProvider:", a1))[v518 addObject:v297]; {
      goto LABEL_330;
      }
    }
LABEL_331:

    if (dword_1EB4C5670)
    {
      unsigned int v534 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      v306 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v307 = v534;
      if (os_log_type_enabled(v306, type)) {
        unsigned int v308 = v307;
      }
      else {
        unsigned int v308 = v307 & 0xFFFFFFFE;
      }
      if (v308)
      {
        mach_absolute_time();
        uint64_t v309 = FigHostTimeToNanoseconds();
        int v611 = 136315650;
        v612 = "-[BWPhotonicEngineNode _setupProcessorCoordinator]";
        __int16 v613 = 2114;
        uint64_t v614 = v295;
        __int16 v615 = 2048;
        double v616 = (double)(v309 / 1000) / 1000.0;
        LODWORD(v486) = 32;
        v471 = &v611;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      uint64_t v4 = v519;
    }
    objc_msgSend(v4, "removeLastObject", v471, v486);
    unint64_t v6 = 0x1E4F29000uLL;
  }
  if (!*(void *)(a1 + 488)) {
    goto LABEL_410;
  }
  uint64_t v310 = v294;
  FigDebugIsInternalBuild();
  uint64_t v311 = objc_msgSend(*(id *)(v6 + 24), "stringWithFormat:", @"%d", 11);
  mach_absolute_time();
  uint64_t v501 = v311;
  [v4 addObject:v311];
  double v312 = -[BWPhotonicEngineNodeConfiguration inferenceMainImageDownscalingFactor](*(void *)(a1 + 112));
  if (*(float *)&v312 != 0.0)
  {
    uint64_t v313 = 875704422;
    v314 = objc_alloc_init(BWVideoFormatRequirements);
    float v315 = (float)(unint64_t)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "videoFormat"), "width");
    double v316 = -[BWPhotonicEngineNodeConfiguration inferenceMainImageDownscalingFactor](*(void *)(a1 + 112));
    unsigned int v317 = FigCaptureRoundFloatToMultipleOf(2, v315 / *(float *)&v316);
    float v318 = (float)(unint64_t)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "videoFormat"), "height");
    double v319 = -[BWPhotonicEngineNodeConfiguration inferenceMainImageDownscalingFactor](*(void *)(a1 + 112));
    unsigned int v320 = FigCaptureRoundFloatToMultipleOf(2, v318 / *(float *)&v319);
    if (v317 <= 0x200) {
      int v321 = 512;
    }
    else {
      int v321 = v317;
    }
    [(BWVideoFormatRequirements *)v314 setWidth:v321];
    if (v320 <= 0x180) {
      int v322 = 384;
    }
    else {
      int v322 = v320;
    }
    [(BWVideoFormatRequirements *)v314 setHeight:v322];
    [(BWVideoFormatRequirements *)v314 setWidthAlignment:8];
    [(BWVideoFormatRequirements *)v314 setHeightAlignment:8];
    if (FigCapturePlatformSupportsUniversalCompression()) {
      uint64_t v313 = FigCaptureCompressedPixelFormatForPixelFormat(875704422, 4, 0);
    }
    uint64_t v541 = [NSNumber numberWithUnsignedInt:v313];
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v314, "setSupportedPixelFormats:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v541 count:1]);
    v540 = v314;
    objc_msgSend(*(id *)(a1 + 488), "setInputFormat:", +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v540, 1)));
    v513 = -[BWInferenceEngineController initWithConfiguration:contextName:]([BWInferenceEngineController alloc], "initWithConfiguration:contextName:", *(void *)(a1 + 488), [(id)a1 name]);
    if (v513)
    {
      uint64_t v323 = [(id)-[BWPhotonicEngineNodeConfiguration providedInferenceAttachedMediaByMode](*(void *)(a1 + 112)) objectForKeyedSubscript:&unk_1EFB024E0];
      int v324 = -[BWPhotonicEngineNodeConfiguration outputBufferCount](*(void *)(a1 + 112));
      char v325 = v323 ? 2 : 1;
      v326 = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:]([BWPixelBufferPool alloc], "initWithVideoFormat:capacity:name:memoryPool:", [*(id *)(a1 + 488) inputFormat], (v324 << v325), @"Inference input pool", v520);
      *(void *)(a1 + 520) = v326;
      if (v326)
      {
        v327 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
        if (!v509)
        {
LABEL_363:
          uint64_t v336 = [v327 count];
          if (v336) {
            uint64_t v336 = [v327 copy];
          }
          v337 = &OBJC_IVAR___BWVideoOrientationMetadataNode__localIDOfOrientationMetadata;
          v338 = v513;
          *(void *)(a1 + 528) = v336;
          id v339 = objc_alloc(MEMORY[0x1E4F1CA60]);
          if (*(void *)(a1 + 536)) {
            uint64_t v340 = *(void *)(a1 + 536);
          }
          else {
            uint64_t v340 = v310;
          }
          v515 = (void *)[v339 initWithDictionary:v340];
          long long v521 = 0u;
          long long v522 = 0u;
          long long v523 = 0u;
          long long v524 = 0u;
          id obja = [(BWInferenceEngineController *)v513 providedAttachedMediaKeys];
          uint64_t v341 = [(NSArray *)obja countByEnumeratingWithState:&v521 objects:v538 count:16];
          if (v341)
          {
            uint64_t v342 = v341;
            uint64_t v343 = *(void *)v522;
            while (2)
            {
              for (uint64_t k = 0; k != v342; ++k)
              {
                if (*(void *)v522 != v343) {
                  objc_enumerationMutation(obja);
                }
                v345 = *(void **)(*((void *)&v521 + 1) + 8 * k);
                v346 = (void *)[*(id *)(a1 + 16) mediaPropertiesForAttachedMediaKey:v345];
                if ([v346 preparedPixelBufferPool])
                {
                  v347 = (void *)[v346 resolvedVideoFormat];
                  if ((objc_msgSend(v347, "isEqual:", -[BWInferenceEngineController outputVideoFormatForAttachedMediaKey:](v338, "outputVideoFormatForAttachedMediaKey:", v345)) & 1) == 0)goto LABEL_398; {
                }
                  }
                else
                {
                  uint64_t v348 = [(BWInferenceEngineController *)v338 outputVideoFormatForAttachedMediaKey:v345];
                  if (!v348
                    || ((v347 = (void *)v348,
                         uint64_t v349 = [*(id *)(a1 + 112) deferredCaptureSupportEnabled],
                         !FigCaptureVideoDimensionsAreValid([*(id *)(a1 + 112) stereoPhotoOutputDimensions]))
                      ? (uint64_t v350 = 2)
                      : (uint64_t v350 = 3),
                        v351 = [BWPixelBufferPool alloc],
                        uint64_t v352 = [NSString stringWithFormat:@"UB %@ Output Pool", v345],
                        LOBYTE(v473) = v349,
                        (uint64_t v353 = [(BWPixelBufferPool *)v351 initWithVideoFormat:v347 capacity:v350 name:v352 clientProvidesPool:0 memoryPool:v520 providesBackPressure:v349 reportSlowBackPressureAllocations:v473]) == 0))
                  {
LABEL_398:
                    uint64_t v4 = v519;
                    v355 = v515;
                    goto LABEL_402;
                  }
                  v354 = (void *)v353;
                  [v515 setObject:v353 forKeyedSubscript:v345];

                  v337 = &OBJC_IVAR___BWVideoOrientationMetadataNode__localIDOfOrientationMetadata;
                  v338 = v513;
                }
                if (*(void *)(a1 + v337[721])
                  && (([v345 isEqualToString:0x1EFA6A200] & 1) != 0
                   || [v345 isEqualToString:0x1EFA745C0]))
                {
                  *(_DWORD *)(a1 + 680) = [v347 width];
                  *(_DWORD *)(a1 + 684) = [v347 height];
                }
              }
              uint64_t v342 = [(NSArray *)obja countByEnumeratingWithState:&v521 objects:v538 count:16];
              if (v342) {
                continue;
              }
              break;
            }
          }
          v355 = v515;
          if ([v515 count])
          {

            *(void *)(a1 + 536) = v515;
            v355 = 0;
          }
          uint64_t v4 = v519;
          BOOL v356 = BWDeviceSupportsDeferredPhotoProcessorPrewarming();
          if ([*(id *)(a1 + 112) deferredPhotoProcessorEnabled] && v356) {
            goto LABEL_401;
          }
          FigDebugIsInternalBuild();
          uint64_t v357 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 12);
          mach_absolute_time();
          [v519 addObject:v357];
          int v358 = [(BWInferenceEngineController *)v338 prepareWithPixelBufferPoolProvider:a1];
          if (dword_1EB4C5670)
          {
            unsigned int v534 = 0;
            os_log_type_t type = OS_LOG_TYPE_DEFAULT;
            v359 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            unsigned int v360 = v534;
            if (os_log_type_enabled(v359, type)) {
              unsigned int v361 = v360;
            }
            else {
              unsigned int v361 = v360 & 0xFFFFFFFE;
            }
            if (v361)
            {
              mach_absolute_time();
              uint64_t v362 = FigHostTimeToNanoseconds();
              int v611 = 136315650;
              v612 = "-[BWPhotonicEngineNode _setupProcessorCoordinator]";
              __int16 v613 = 2114;
              uint64_t v614 = v357;
              __int16 v615 = 2048;
              double v616 = (double)(v362 / 1000) / 1000.0;
              LODWORD(v486) = 32;
              v474 = &v611;
              _os_log_send_and_compose_impl();
            }
            fig_log_call_emit_and_clean_up_after_send_and_compose();
            uint64_t v4 = v519;
          }
          objc_msgSend(v4, "removeLastObject", v474, v486);
          if (!v358) {
LABEL_401:
          }
            [v518 addObject:v338];
          goto LABEL_402;
        }
        double v328 = -[BWPhotonicEngineNodeConfiguration inferenceMainImageDownscalingFactor](*(void *)(a1 + 112));
        unsigned int v329 = FigCaptureRoundFloatToMultipleOf(2, (float)(int)v510 / *(float *)&v328);
        double v330 = -[BWPhotonicEngineNodeConfiguration inferenceMainImageDownscalingFactor](*(void *)(a1 + 112));
        unsigned int v331 = FigCaptureRoundFloatToMultipleOf(2, (float)SHIDWORD(v510) / *(float *)&v330);
        if (v329 <= 0x200) {
          int v332 = 512;
        }
        else {
          int v332 = v329;
        }
        [(BWVideoFormatRequirements *)v314 setWidth:v332];
        if (v331 <= 0x180) {
          int v333 = 384;
        }
        else {
          int v333 = v331;
        }
        [(BWVideoFormatRequirements *)v314 setHeight:v333];
        v539 = v314;
        v334 = -[BWOnDemandPixelBufferAllocator initWithVideoFormat:name:memoryPool:additionalPixelBufferAttributes:]([BWOnDemandPixelBufferAllocator alloc], "initWithVideoFormat:name:memoryPool:additionalPixelBufferAttributes:", +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v539 count:1]), @"ZoomBased QSub inference input on-demand allocator", v520, 0);
        if (v334)
        {
          v335 = v334;
          [v327 setObject:v334 forKeyedSubscript:&unk_1EFB02510];

          goto LABEL_363;
        }
      }
    }
  }
  v355 = 0;
LABEL_402:

  if (dword_1EB4C5670)
  {
    unsigned int v534 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v363 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v364 = v534;
    if (os_log_type_enabled(v363, type)) {
      unsigned int v365 = v364;
    }
    else {
      unsigned int v365 = v364 & 0xFFFFFFFE;
    }
    if (v365)
    {
      mach_absolute_time();
      uint64_t v366 = FigHostTimeToNanoseconds();
      int v611 = 136315650;
      v612 = "-[BWPhotonicEngineNode _setupProcessorCoordinator]";
      __int16 v613 = 2114;
      uint64_t v614 = v501;
      __int16 v615 = 2048;
      double v616 = (double)(v366 / 1000) / 1000.0;
      LODWORD(v486) = 32;
      v472 = &v611;
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(v4, "removeLastObject", v472, v486);
  unint64_t v6 = 0x1E4F29000uLL;
LABEL_410:
  if (*(void *)(a1 + 600))
  {
    FigDebugIsInternalBuild();
    uint64_t v367 = objc_msgSend(*(id *)(v6 + 24), "stringWithFormat:", @"%d", 13);
    mach_absolute_time();
    [v4 addObject:v367];
    v368 = [[BWSWFRProcessorController alloc] initWithConfiguration:*(void *)(a1 + 600)];
    if (!v368) {
      goto LABEL_565;
    }
    [v518 addObject:v368];
    if (dword_1EB4C5670)
    {
      unsigned int v534 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      v369 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v370 = v534;
      if (os_log_type_enabled(v369, type)) {
        unsigned int v371 = v370;
      }
      else {
        unsigned int v371 = v370 & 0xFFFFFFFE;
      }
      if (v371)
      {
        mach_absolute_time();
        uint64_t v372 = FigHostTimeToNanoseconds();
        int v611 = 136315650;
        v612 = "-[BWPhotonicEngineNode _setupProcessorCoordinator]";
        __int16 v613 = 2114;
        uint64_t v614 = v367;
        __int16 v615 = 2048;
        double v616 = (double)(v372 / 1000) / 1000.0;
        LODWORD(v486) = 32;
        v475 = &v611;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    uint64_t v4 = v519;
    objc_msgSend(v519, "removeLastObject", v475, v486);
    unint64_t v6 = 0x1E4F29000uLL;
  }
  if (*(void *)(a1 + 624))
  {
    FigDebugIsInternalBuild();
    uint64_t v373 = objc_msgSend(*(id *)(v6 + 24), "stringWithFormat:", @"%d", 22);
    mach_absolute_time();
    [v4 addObject:v373];
    v374 = [[BWColorConstancyProcessorController alloc] initWithConfiguration:*(void *)(a1 + 624)];
    if (!v374) {
      goto LABEL_565;
    }
    [v518 addObject:v374];
    if (dword_1EB4C5670)
    {
      unsigned int v534 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      v375 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v376 = v534;
      if (os_log_type_enabled(v375, type)) {
        unsigned int v377 = v376;
      }
      else {
        unsigned int v377 = v376 & 0xFFFFFFFE;
      }
      if (v377)
      {
        mach_absolute_time();
        uint64_t v378 = FigHostTimeToNanoseconds();
        int v611 = 136315650;
        v612 = "-[BWPhotonicEngineNode _setupProcessorCoordinator]";
        __int16 v613 = 2114;
        uint64_t v614 = v373;
        __int16 v615 = 2048;
        double v616 = (double)(v378 / 1000) / 1000.0;
        LODWORD(v486) = 32;
        v476 = &v611;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    uint64_t v4 = v519;
    objc_msgSend(v519, "removeLastObject", v476, v486);
    unint64_t v6 = 0x1E4F29000uLL;
  }
  if (*(void *)(a1 + 640))
  {
    FigDebugIsInternalBuild();
    uint64_t v379 = objc_msgSend(*(id *)(v6 + 24), "stringWithFormat:", @"%d", 14);
    mach_absolute_time();
    [v4 addObject:v379];
    v380 = [[BWRedEyeReductionController alloc] initWithConfiguration:*(void *)(a1 + 640)];
    if (!v380) {
      goto LABEL_565;
    }
    [v518 addObject:v380];
    if (dword_1EB4C5670)
    {
      unsigned int v534 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      v381 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v382 = v534;
      if (os_log_type_enabled(v381, type)) {
        unsigned int v383 = v382;
      }
      else {
        unsigned int v383 = v382 & 0xFFFFFFFE;
      }
      if (v383)
      {
        mach_absolute_time();
        uint64_t v384 = FigHostTimeToNanoseconds();
        int v611 = 136315650;
        v612 = "-[BWPhotonicEngineNode _setupProcessorCoordinator]";
        __int16 v613 = 2114;
        uint64_t v614 = v379;
        __int16 v615 = 2048;
        double v616 = (double)(v384 / 1000) / 1000.0;
        LODWORD(v486) = 32;
        v477 = &v611;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    uint64_t v4 = v519;
    objc_msgSend(v519, "removeLastObject", v477, v486);
    unint64_t v6 = 0x1E4F29000uLL;
  }
  if (!*(void *)(a1 + 656)) {
    goto LABEL_484;
  }
  FigDebugIsInternalBuild();
  uint64_t v385 = objc_msgSend(*(id *)(v6 + 24), "stringWithFormat:", @"%d", 15);
  mach_absolute_time();
  [v4 addObject:v385];
  if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 656), "portTypesWithIntelligentDistortionCorrectionEnabled"), "count"))
  {
    if ([*(id *)(a1 + 112) deferredPhotoProcessorEnabled])
    {
      *(_DWORD *)(a1 + 680) = 512;
      *(_DWORD *)(a1 + 684) = 384;
    }
    else if (!-[BWPhotonicEngineNode _inferenceOutputPixelBufferPoolForAttachedMediaKey:](a1, @"LowResPersonSegmentationMask")&& !-[BWPhotonicEngineNode _inferenceOutputPixelBufferPoolForAttachedMediaKey:](a1, @"LowResPersonSegmentationMaskClone")|| !*(_DWORD *)(a1 + 680)|| !*(_DWORD *)(a1 + 684))
    {
      goto LABEL_565;
    }
  }
  if (FigCaptureVideoDimensionsAreValid(v505))
  {
    BOOL v386 = -[BWPhotonicEngineNodeConfiguration ultraHighResolutionProcessingEnabled](*(void *)(a1 + 112));
    BOOL v387 = v386 || v509;
    BOOL v388 = !v386;
    int v389 = v510;
    if (v386) {
      int v389 = v505;
    }
    LODWORD(v510) = v389;
    unsigned int v390 = v504;
    if (!v388) {
      unsigned int v390 = v498;
    }
    v391 = &OBJC_IVAR___BWVideoOrientationMetadataNode__localIDOfOrientationMetadata;
    if (v387) {
      goto LABEL_457;
    }
  }
  else
  {
    v391 = &OBJC_IVAR___BWVideoOrientationMetadataNode__localIDOfOrientationMetadata;
    unsigned int v390 = HIDWORD(v510);
    if (v509) {
      goto LABEL_457;
    }
  }
  LODWORD(v510) = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "videoFormat"), "width");
  unsigned int v390 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "videoFormat"), "height");
LABEL_457:
  objc_msgSend(*(id *)(a1 + v391[721]), "setProcessorConfig:", v510 | ((unint64_t)v390 << 32), *(unsigned int *)(a1 + 680) | ((unint64_t)*(unsigned int *)(a1 + 684) << 32));
  if (-[BWPhotonicEngineNodeConfiguration depthDataDeliveryEnabled](*(void *)(a1 + 112))
    && [*(id *)(a1 + 112) depthDataType] == 3
    && -[BWPhotonicEngineNodeConfiguration dcProcessingWithDepthSupported](*(void *)(a1 + 112)))
  {
    if ([*(id *)(a1 + 112) pearlModuleType] == 3) {
      uint64_t v392 = 0;
    }
    else {
      uint64_t v392 = 90;
    }
    objc_msgSend(*(id *)(a1 + v391[721]), "setDepthDataCorrectionEnabled:primaryFormat:depthFormat:baseDepthRotationDegrees:", 1, objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "mediaPropertiesForAttachedMediaKey:", @"PrimaryFormat"), "resolvedVideoFormat"), objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "mediaPropertiesForAttachedMediaKey:", @"Depth"), "resolvedVideoFormat"), v392);
  }
  v393 = [[BWIntelligentDistortionCorrectionProcessorController alloc] initWithConfiguration:*(void *)(a1 + v391[721])];
  if (!v393) {
    goto LABEL_565;
  }
  [v518 addObject:v393];
  if (FigCaptureVideoDimensionsAreValid([*(id *)(a1 + 112) stereoPhotoOutputDimensions]))
  {
    BOOL v394 = FigCaptureVideoDimensionsAreValid([*(id *)(a1 + 112) deepFusionEnhancedResolutionDimensions]);
    uint64_t v395 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 656), "portTypesWithGeometricDistortionCorrectionEnabled"), "count")+ 1;
    uint64_t v396 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "videoFormat"), "pixelFormat");
    v397 = objc_alloc_init(BWVideoFormatRequirements);
    -[BWVideoFormatRequirements setWidth:](v397, "setWidth:", (int)[*(id *)(a1 + 112) stereoPhotoOutputDimensions]);
    -[BWVideoFormatRequirements setHeight:](v397, "setHeight:", [*(id *)(a1 + 112) stereoPhotoOutputDimensions] >> 32);
    [(BWVideoFormatRequirements *)v397 setWidthAlignment:16];
    [(BWVideoFormatRequirements *)v397 setHeightAlignment:16];
    uint64_t v537 = [NSNumber numberWithUnsignedInt:v396];
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v397, "setSupportedPixelFormats:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v537 count:1]);
    if ([v508 colorSpaceProperties])
    {
      uint64_t v536 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v508, "colorSpaceProperties"));
      uint64_t v398 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v536 count:1];
    }
    else
    {
      uint64_t v398 = 0;
    }
    [(BWVideoFormatRequirements *)v397 setSupportedColorSpaceProperties:v398];
    v535 = v397;
    id v399 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v535 count:1]);
    v400 = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:]([BWPixelBufferPool alloc], "initWithVideoFormat:capacity:name:memoryPool:", v399, v395, [NSString stringWithFormat:@"Stereo photo output pool (%@)", BWStringForOSType(v396)], v520);
    *(void *)(a1 + 976) = v400;
    if (v400) {
      char v401 = v394;
    }
    else {
      char v401 = 1;
    }
    if (v401)
    {
      if (!v400) {
        goto LABEL_565;
      }
    }
    else
    {
      [*(id *)(a1 + 704) setInputFormat:v399];
      [*(id *)(a1 + 704) setOutputFormat:v399];
    }
  }
  if (dword_1EB4C5670)
  {
    unsigned int v534 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v402 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v403 = v534;
    if (os_log_type_enabled(v402, type)) {
      unsigned int v404 = v403;
    }
    else {
      unsigned int v404 = v403 & 0xFFFFFFFE;
    }
    if (v404)
    {
      mach_absolute_time();
      uint64_t v405 = FigHostTimeToNanoseconds();
      int v611 = 136315650;
      v612 = "-[BWPhotonicEngineNode _setupProcessorCoordinator]";
      __int16 v613 = 2114;
      uint64_t v614 = v385;
      __int16 v615 = 2048;
      double v616 = (double)(v405 / 1000) / 1000.0;
      LODWORD(v486) = 32;
      v478 = &v611;
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  uint64_t v4 = v519;
  objc_msgSend(v519, "removeLastObject", v478, v486);
  unint64_t v6 = 0x1E4F29000uLL;
LABEL_484:
  if (*(void *)(a1 + 704))
  {
    BOOL v406 = BWDeviceSupportsDeferredPhotoProcessorPrewarming();
    if (![*(id *)(a1 + 112) deferredPhotoProcessorEnabled] || !v406)
    {
      FigDebugIsInternalBuild();
      uint64_t v407 = objc_msgSend(*(id *)(v6 + 24), "stringWithFormat:", @"%d", 16);
      mach_absolute_time();
      [v4 addObject:v407];
      v408 = [[BWDeepZoomProcessorController alloc] initWithConfiguration:*(void *)(a1 + 704)];
      if (!v408) {
        goto LABEL_565;
      }
      v409 = v408;
      if ([(BWDeepZoomProcessorController *)v408 prepareWithPixelBufferPoolProvider:a1])
      {
        goto LABEL_565;
      }
      [v518 addObject:v409];
      if (dword_1EB4C5670)
      {
        unsigned int v534 = 0;
        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
        v410 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        unsigned int v411 = v534;
        if (os_log_type_enabled(v410, type)) {
          unsigned int v412 = v411;
        }
        else {
          unsigned int v412 = v411 & 0xFFFFFFFE;
        }
        if (v412)
        {
          mach_absolute_time();
          uint64_t v413 = FigHostTimeToNanoseconds();
          int v611 = 136315650;
          v612 = "-[BWPhotonicEngineNode _setupProcessorCoordinator]";
          __int16 v613 = 2114;
          uint64_t v614 = v407;
          __int16 v615 = 2048;
          double v616 = (double)(v413 / 1000) / 1000.0;
          LODWORD(v486) = 32;
          v479 = &v611;
          _os_log_send_and_compose_impl();
        }
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      uint64_t v4 = v519;
      objc_msgSend(v519, "removeLastObject", v479, v486);
      unint64_t v6 = 0x1E4F29000uLL;
    }
  }
  if (*(void *)(a1 + 752))
  {
    FigDebugIsInternalBuild();
    uint64_t v414 = objc_msgSend(*(id *)(v6 + 24), "stringWithFormat:", @"%d", 17);
    mach_absolute_time();
    [v4 addObject:v414];
    objc_msgSend(*(id *)(a1 + 752), "setMemoryAnalyticsPayload:", objc_msgSend((id)objc_msgSend((id)a1, "graph"), "memoryAnalyticsPayload"));
    v415 = [[BWScalerProcessorController alloc] initWithConfiguration:*(void *)(a1 + 752)];
    if (!v415) {
      goto LABEL_565;
    }
    [v518 addObject:v415];
    if (dword_1EB4C5670)
    {
      unsigned int v534 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      v416 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v417 = v534;
      if (os_log_type_enabled(v416, type)) {
        unsigned int v418 = v417;
      }
      else {
        unsigned int v418 = v417 & 0xFFFFFFFE;
      }
      if (v418)
      {
        mach_absolute_time();
        uint64_t v419 = FigHostTimeToNanoseconds();
        int v611 = 136315650;
        v612 = "-[BWPhotonicEngineNode _setupProcessorCoordinator]";
        __int16 v613 = 2114;
        uint64_t v614 = v414;
        __int16 v615 = 2048;
        double v616 = (double)(v419 / 1000) / 1000.0;
        LODWORD(v486) = 32;
        v480 = &v611;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    uint64_t v4 = v519;
    objc_msgSend(v519, "removeLastObject", v480, v486);
    unint64_t v6 = 0x1E4F29000uLL;
  }
  if (*(void *)(a1 + 824))
  {
    BWDeviceSupportsDeferredPhotoProcessorPrewarming();
    [*(id *)(a1 + 112) deferredPhotoProcessorEnabled];
    FigDebugIsInternalBuild();
    uint64_t v420 = objc_msgSend(*(id *)(v6 + 24), "stringWithFormat:", @"%d", 21);
    mach_absolute_time();
    [v4 addObject:v420];
    v421 = [[BWSmartStyleRenderingProcessorController alloc] initWithConfiguration:*(void *)(a1 + 824)];
    if (!v421) {
      goto LABEL_565;
    }
    [v518 addObject:v421];
    if (dword_1EB4C5670)
    {
      unsigned int v534 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      v422 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v423 = v534;
      if (os_log_type_enabled(v422, type)) {
        unsigned int v424 = v423;
      }
      else {
        unsigned int v424 = v423 & 0xFFFFFFFE;
      }
      if (v424)
      {
        mach_absolute_time();
        uint64_t v425 = FigHostTimeToNanoseconds();
        int v611 = 136315650;
        v612 = "-[BWPhotonicEngineNode _setupProcessorCoordinator]";
        __int16 v613 = 2114;
        uint64_t v614 = v420;
        __int16 v615 = 2048;
        double v616 = (double)(v425 / 1000) / 1000.0;
        LODWORD(v486) = 32;
        v481 = &v611;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    uint64_t v4 = v519;
    objc_msgSend(v519, "removeLastObject", v481, v486);
    unint64_t v6 = 0x1E4F29000uLL;
  }
  if (*(void *)(a1 + 776))
  {
    FigDebugIsInternalBuild();
    uint64_t v426 = objc_msgSend(*(id *)(v6 + 24), "stringWithFormat:", @"%d", 18);
    mach_absolute_time();
    [v4 addObject:v426];
    if ([*(id *)(a1 + 776) stillImageDepthDataType] == 8 && !*(void *)(a1 + 264)) {
      goto LABEL_565;
    }
    [*(id *)(a1 + 776) setInputDimensions:-[BWPhotonicEngineNode _disparityProcessorInputDimensions](a1)];
    v427 = [[BWStereoDisparityProcessorController alloc] initWithConfiguration:*(void *)(a1 + 776)];
    if (!v427) {
      goto LABEL_565;
    }
    [v518 addObject:v427];
    if (dword_1EB4C5670)
    {
      unsigned int v534 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      v428 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v429 = v534;
      if (os_log_type_enabled(v428, type)) {
        unsigned int v430 = v429;
      }
      else {
        unsigned int v430 = v429 & 0xFFFFFFFE;
      }
      if (v430)
      {
        mach_absolute_time();
        uint64_t v431 = FigHostTimeToNanoseconds();
        int v611 = 136315650;
        v612 = "-[BWPhotonicEngineNode _setupProcessorCoordinator]";
        __int16 v613 = 2114;
        uint64_t v614 = v426;
        __int16 v615 = 2048;
        double v616 = (double)(v431 / 1000) / 1000.0;
        LODWORD(v486) = 32;
        v482 = &v611;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    uint64_t v4 = v519;
    objc_msgSend(v519, "removeLastObject", v482, v486);
    unint64_t v6 = 0x1E4F29000uLL;
  }
  if (!*(void *)(a1 + 880)) {
    goto LABEL_539;
  }
  FigDebugIsInternalBuild();
  uint64_t v432 = objc_msgSend(*(id *)(v6 + 24), "stringWithFormat:", @"%d", 19);
  mach_absolute_time();
  [v4 addObject:v432];
  objc_msgSend(*(id *)(a1 + 880), "setInputColorFormat:", objc_msgSend(*(id *)(a1 + 360), "outputFormat"));
  objc_msgSend(*(id *)(a1 + 880), "setOutputDepthFormat:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "mediaPropertiesForAttachedMediaKey:", @"Depth"), "resolvedVideoFormat"));
  v433 = [[BWJasperColorStillsExecutorController alloc] initWithConfiguration:*(void *)(a1 + 880)];
  if (v433)
  {
    [v518 addObject:v433];
    if (dword_1EB4C5670)
    {
      unsigned int v534 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      v434 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v435 = v534;
      if (os_log_type_enabled(v434, type)) {
        unsigned int v436 = v435;
      }
      else {
        unsigned int v436 = v435 & 0xFFFFFFFE;
      }
      if (v436)
      {
        mach_absolute_time();
        uint64_t v437 = FigHostTimeToNanoseconds();
        int v611 = 136315650;
        v612 = "-[BWPhotonicEngineNode _setupProcessorCoordinator]";
        __int16 v613 = 2114;
        uint64_t v614 = v432;
        __int16 v615 = 2048;
        double v616 = (double)(v437 / 1000) / 1000.0;
        LODWORD(v486) = 32;
        v483 = &v611;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    uint64_t v4 = v519;
    objc_msgSend(v519, "removeLastObject", v483, v486);
    unint64_t v6 = 0x1E4F29000uLL;
LABEL_539:
    if (!*(void *)(a1 + 896))
    {
LABEL_549:
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 200));
      *(void *)(a1 + 168) = [[BWStillImageProcessorCoordinator alloc] initWithProcessorControllers:v518];
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 200));
      if (([*(id *)(a1 + 112) deferredPhotoProcessorEnabled] & 1) == 0)
      {
        v444 = (void *)-[BWPhotonicEngineNode _requiredResolutionFlavorsForSharedExternalMemoryResourceWithSettings:](a1, 0);
        -[BWPhotonicEngineNode _prepareSharedExternalMemoryResourceForProcessorControllersIfNeededForResolutionFlavors:](a1, v444);
      }
      if ([v506 count]) {
        v445 = v506;
      }
      else {
        v445 = 0;
      }
      [v503 setObject:v445 forKeyedSubscript:&unk_1EFB024E0];
      if ([v507 count]) {
        v446 = v507;
      }
      else {
        v446 = 0;
      }
      [v503 setObject:v446 forKeyedSubscript:&unk_1EFB02510];
      *(void *)(a1 + 304) = [v503 copy];
      if (dword_1EB4C5670)
      {
        unsigned int v534 = 0;
        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
        v447 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        unsigned int v448 = v534;
        if (os_log_type_enabled(v447, type)) {
          unsigned int v449 = v448;
        }
        else {
          unsigned int v449 = v448 & 0xFFFFFFFE;
        }
        if (v449)
        {
          mach_absolute_time();
          uint64_t v450 = FigHostTimeToNanoseconds();
          int v611 = 136315650;
          v612 = "-[BWPhotonicEngineNode _setupProcessorCoordinator]";
          __int16 v613 = 2114;
          uint64_t v614 = v502;
          __int16 v615 = 2048;
          double v616 = (double)(v450 / 1000) / 1000.0;
          LODWORD(v486) = 32;
          v462 = &v611;
          _os_log_send_and_compose_impl();
        }
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      objc_msgSend(v4, "removeLastObject", v462, v486);
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 200));
      *(unsigned char *)(a1 + 240) = 1;
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 200));
      goto LABEL_565;
    }
    FigDebugIsInternalBuild();
    uint64_t v438 = objc_msgSend(*(id *)(v6 + 24), "stringWithFormat:", @"%d", 20);
    mach_absolute_time();
    [v4 addObject:v438];
    objc_msgSend(*(id *)(a1 + 896), "setInputColorFormat:", objc_msgSend(*(id *)(a1 + 360), "outputFormat"));
    objc_msgSend(*(id *)(a1 + 896), "setOutputDepthFormat:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "mediaPropertiesForAttachedMediaKey:", @"Depth"), "resolvedVideoFormat"));
    objc_msgSend(*(id *)(a1 + 896), "setPointCloudTimeMachineCapacity:", objc_msgSend(*(id *)(a1 + 856), "retainedBufferCount"));
    v439 = [[BWJasperDisparityProcessorController alloc] initWithConfiguration:*(void *)(a1 + 896)];
    if (v439)
    {
      [v518 addObject:v439];
      if (dword_1EB4C5670)
      {
        unsigned int v534 = 0;
        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
        v440 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        unsigned int v441 = v534;
        if (os_log_type_enabled(v440, type)) {
          unsigned int v442 = v441;
        }
        else {
          unsigned int v442 = v441 & 0xFFFFFFFE;
        }
        if (v442)
        {
          mach_absolute_time();
          uint64_t v443 = FigHostTimeToNanoseconds();
          int v611 = 136315650;
          v612 = "-[BWPhotonicEngineNode _setupProcessorCoordinator]";
          __int16 v613 = 2114;
          uint64_t v614 = v438;
          __int16 v615 = 2048;
          double v616 = (double)(v443 / 1000) / 1000.0;
          LODWORD(v486) = 32;
          v484 = &v611;
          _os_log_send_and_compose_impl();
        }
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        uint64_t v4 = v519;
      }
      objc_msgSend(v4, "removeLastObject", v484, v486);
      goto LABEL_549;
    }
    goto LABEL_580;
  }
LABEL_565:
  if (*(void *)(a1 + 168))
  {
    if (!dword_1EB4C5670) {
      return;
    }
    unsigned int v534 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v451 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v452 = v534;
    if (os_log_type_enabled(v451, type)) {
      unsigned int v453 = v452;
    }
    else {
      unsigned int v453 = v452 & 0xFFFFFFFE;
    }
    if (v453)
    {
      uint64_t v454 = *(void *)(a1 + 168);
      int v611 = 136315394;
      v612 = "-[BWPhotonicEngineNode _setupProcessorCoordinator]";
      __int16 v613 = 2114;
      uint64_t v614 = v454;
      _os_log_send_and_compose_impl();
    }
  }
  else
  {
    unsigned int v534 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v455 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v456 = v534;
    if (os_log_type_enabled(v455, type)) {
      unsigned int v457 = v456;
    }
    else {
      unsigned int v457 = v456 & 0xFFFFFFFE;
    }
    if (v457)
    {
      uint64_t FrameworkRadarComponentName = FigCaptureGetFrameworkRadarComponentName();
      uint64_t v459 = [v519 componentsJoinedByString:@"->"];
      int v611 = 136315651;
      v612 = "-[BWPhotonicEngineNode _setupProcessorCoordinator]";
      __int16 v613 = 2081;
      uint64_t v614 = FrameworkRadarComponentName;
      __int16 v615 = 2114;
      double v616 = *(double *)&v459;
      _os_log_send_and_compose_impl();
    }
  }
  fig_log_call_emit_and_clean_up_after_send_and_compose();
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
  v6.super_class = (Class)BWPhotonicEngineNode;
  [(BWNode *)&v6 prepareForCurrentConfigurationToBecomeLive];
  processorCoordinatorWorkerQueue = self->_processorCoordinatorWorkerQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __66__BWPhotonicEngineNode_prepareForCurrentConfigurationToBecomeLive__block_invoke;
  v5[3] = &unk_1E5C24430;
  v5[4] = self;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __ubn_dispatch_sync_block_invoke_0;
  block[3] = &unk_1E5C249F0;
  block[4] = v5;
  dispatch_sync(processorCoordinatorWorkerQueue, block);
}

- (unint64_t)_resolvedZoomBasedQSubDimensionsWithSourceZoomBasedQSubDimensions:(unint64_t)a3 standardSoftISPOutputDimensions:
{
  if (a1)
  {
    int v3 = a3;
    unint64_t v6 = HIDWORD(a2);
    unint64_t v7 = HIDWORD(a3);
    if ((int)a2 > (int)-[BWPhotonicEngineNodeConfiguration rawSensorDimensions](*(void *)(a1 + 112))
      || (int)v6 > (int)((unint64_t)-[BWPhotonicEngineNodeConfiguration rawSensorDimensions](*(void *)(a1 + 112)) >> 32))
    {
      double v8 = (double)(int)a2 / (double)(int)v6;
      if (vabdd_f64((double)v3 / (double)(int)v7, v8) > 0.1) {
        double v8 = (double)v3 / (double)(int)v7;
      }
      unint64_t v9 = FigCaptureMetadataUtilitiesEnforceAspectRatioWithStillImageDimensions(a2, v8);
      unint64_t v10 = BWExtendDimensionsToConformToAlignmentRequirements(v9, 16, 16);
      if ((int)v10 >= (int)a2) {
        int v3 = a2;
      }
      else {
        int v3 = v10;
      }
      if (SHIDWORD(v10) >= (int)v6) {
        LODWORD(v7) = v6;
      }
      else {
        unint64_t v7 = HIDWORD(v10);
      }
    }
  }
  else
  {
    LODWORD(v7) = 0;
    int v3 = 0;
  }
  return v3 | ((unint64_t)v7 << 32);
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

- (void)dealloc
{
  -[BWPhotonicEngineNode _releaseResources]((uint64_t)self);

  self->_emitQueue = 0;
  v3.receiver = self;
  v3.super_class = (Class)BWPhotonicEngineNode;
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
      unsigned int v2 = *(NSObject **)(a1 + 944);
      if (v2)
      {
        blocuint64_t k = MEMORY[0x1E4F143A8];
        uint64_t v14 = 3221225472;
        BOOL v15 = __ubn_dispatch_sync_block_invoke_0;
        unint64_t v16 = &unk_1E5C249F0;
        int v17 = &__block_literal_global_624;
        dispatch_sync(v2, &block);

        *(void *)(a1 + 944) = 0;
      }
      objc_super v3 = *(NSObject **)(a1 + 176);
      if (v3)
      {
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __41__BWPhotonicEngineNode__releaseResources__block_invoke_2;
        v12[3] = &unk_1E5C24430;
        v12[4] = a1;
        blocuint64_t k = MEMORY[0x1E4F143A8];
        uint64_t v14 = 3221225472;
        BOOL v15 = __ubn_dispatch_sync_block_invoke_0;
        unint64_t v16 = &unk_1E5C249F0;
        int v17 = v12;
        dispatch_sync(v3, &block);
      }

      *(void *)(a1 + 120) = 0;
      *(void *)(a1 + 264) = 0;

      *(void *)(a1 + 272) = 0;
      *(void *)(a1 + 280) = 0;

      *(void *)(a1 + 288) = 0;
      *(void *)(a1 + 296) = 0;

      *(void *)(a1 + 304) = 0;
      *(void *)(a1 + 320) = 0;

      *(void *)(a1 + 336) = 0;
      *(void *)(a1 + 344) = 0;

      *(void *)(a1 + 352) = 0;
      *(void *)(a1 + 256) = 0;

      *(void *)(a1 + 360) = 0;
      *(void *)(a1 + 368) = 0;

      *(void *)(a1 + 920) = 0;
      *(void *)(a1 + 912) = 0;

      *(void *)(a1 + 936) = 0;
      *(void *)(a1 + 968) = 0;
      uint64_t v4 = *(const void **)(a1 + 984);
      if (v4)
      {
        CFRelease(v4);
        *(void *)(a1 + 984) = 0;
      }

      *(void *)(a1 + 376) = 0;
      *(void *)(a1 + 384) = 0;

      *(void *)(a1 + 808) = 0;
      *(void *)(a1 + 392) = 0;

      *(void *)(a1 + 400) = 0;
      *(void *)(a1 + 176) = 0;

      *(void *)(a1 + 184) = 0;
      *(void *)(a1 + 192) = 0;

      *(void *)(a1 + 232) = 0;
      *(void *)(a1 + 224) = 0;

      *(void *)(a1 + 112) = 0;
      *(void *)(a1 + 104) = 0;

      *(void *)(a1 + 424) = 0;
      *(void *)(a1 + 440) = 0;

      *(void *)(a1 + 448) = 0;
      *(void *)(a1 + 456) = 0;

      *(void *)(a1 + 464) = 0;
      *(void *)(a1 + 472) = 0;

      *(void *)(a1 + 432) = 0;
      *(void *)(a1 + 496) = 0;

      *(void *)(a1 + 408) = 0;
      *(void *)(a1 + 416) = 0;

      *(void *)(a1 + 488) = 0;
      uint64_t v5 = *(NSObject **)(a1 + 504);
      if (v5)
      {
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __41__BWPhotonicEngineNode__releaseResources__block_invoke_3;
        v11[3] = &unk_1E5C24430;
        v11[4] = a1;
        blocuint64_t k = MEMORY[0x1E4F143A8];
        uint64_t v14 = 3221225472;
        BOOL v15 = __ubn_dispatch_sync_block_invoke_0;
        unint64_t v16 = &unk_1E5C249F0;
        int v17 = v11;
        dispatch_sync(v5, &block);

        *(void *)(a1 + 504) = 0;
      }

      *(void *)(a1 + 512) = 0;
      *(void *)(a1 + 520) = 0;

      *(void *)(a1 + 528) = 0;
      *(void *)(a1 + 536) = 0;
      unint64_t v6 = *(const void **)(a1 + 576);
      if (v6)
      {
        CFRelease(v6);
        *(void *)(a1 + 576) = 0;
      }
      unint64_t v7 = *(const void **)(a1 + 584);
      if (v7)
      {
        CFRelease(v7);
        *(void *)(a1 + 584) = 0;
      }

      *(void *)(a1 + 592) = 0;
      *(void *)(a1 + 600) = 0;

      *(void *)(a1 + 608) = 0;
      *(void *)(a1 + 616) = 0;

      *(void *)(a1 + 624) = 0;
      *(void *)(a1 + 632) = 0;

      *(void *)(a1 + 656) = 0;
      *(void *)(a1 + 664) = 0;

      *(void *)(a1 + 672) = 0;
      *(void *)(a1 + 688) = 0;

      *(void *)(a1 + 696) = 0;
      *(void *)(a1 + 704) = 0;

      *(void *)(a1 + 712) = 0;
      *(void *)(a1 + 720) = 0;

      *(void *)(a1 + 728) = 0;
      -[BWPhotonicEngineNode _clearPortraitSemaphoreWithError:](a1);

      *(void *)(a1 + 752) = 0;
      *(void *)(a1 + 760) = 0;

      *(void *)(a1 + 768) = 0;
      *(void *)(a1 + 824) = 0;

      *(void *)(a1 + 832) = 0;
      *(void *)(a1 + 840) = 0;

      *(void *)(a1 + 848) = 0;
      *(void *)(a1 + 976) = 0;

      *(void *)(a1 + 776) = 0;
      *(void *)(a1 + 784) = 0;

      *(void *)(a1 + 816) = 0;
      *(void *)(a1 + 800) = 0;

      *(void *)(a1 + 880) = 0;
      *(void *)(a1 + 888) = 0;

      *(void *)(a1 + 896) = 0;
      *(void *)(a1 + 904) = 0;

      *(void *)(a1 + 640) = 0;
      *(void *)(a1 + 648) = 0;

      *(void *)(a1 + 952) = 0;
      *(void *)(a1 + 960) = 0;
      double v8 = *(const void **)(a1 + 928);
      if (v8)
      {
        CFRelease(v8);
        *(void *)(a1 + 928) = 0;
      }

      *(void *)(a1 + 856) = 0;
      *(void *)(a1 + 128) = 0;

      *(void *)(a1 + 168) = 0;
      *(void *)(a1 + 248) = 0;
      unint64_t v9 = *(const void **)(a1 + 1008);
      if (v9)
      {
        CFRelease(v9);
        *(void *)(a1 + 1008) = 0;
      }

      *(void *)(a1 + 1016) = 0;
      unint64_t v10 = *(const void **)(a1 + 1024);
      if (v10)
      {
        CFRelease(v10);
        *(void *)(a1 + 1024) = 0;
      }
      *(unsigned char *)(a1 + 96) = 1;
    }
  }
}

- (BOOL)idcSupportedForCaptureType:(int)a3 captureFlags:(unint64_t)a4 portType:(id)a5
{
  if (!self->_intelligentDistortionCorrectionControllerConfiguration)
  {
LABEL_10:
    LOBYTE(v8) = 0;
    return (char)v8;
  }
  uint64_t v6 = *(void *)&a3;
  LODWORD(v8) = [(id)-[BWPhotonicEngineNodeConfiguration portTypesWithIntelligentDistortionCorrectionEnabled]((uint64_t)self->_nodeConfiguration) containsObject:a5];
  if (v8)
  {
    id v8 = -[NSDictionary objectForKeyedSubscript:](self->_captureTypesWithIDCSupportWithOptionalCaptureFlags, "objectForKeyedSubscript:", [NSNumber numberWithInt:v6]);
    if (v8)
    {
      int v9 = [v8 intValue];
      if (v9) {
        BOOL v10 = (v9 & a4) == 0;
      }
      else {
        BOOL v10 = 0;
      }
      if (!v10)
      {
        LOBYTE(v8) = 1;
        return (char)v8;
      }
      goto LABEL_10;
    }
  }
  return (char)v8;
}

- (BOOL)demosaicedRawSupportedForCaptureType:(int)a3
{
  return a3 <= 0xC
      && ((1 << a3) & 0x1C86) != 0
      && [(BWNRFProcessorControllerConfiguration *)self->_nrfProcessorControllerConfiguration demosaicedRawEnabled];
}

- (BOOL)processingOnBeginMomentSupportedForCaptureSettings:(id)a3
{
  if (([a3 captureFlags] & 4) == 0) {
    return 0;
  }
  if (!self->_sensorRawInput) {
    return 0;
  }
  char v7 = 0;
  -[BWPhotonicEngineNode _infoForCaptureType:isSupportedCaptureTypeOut:isFusionCaptureTypeOut:]((BOOL)self, [a3 captureType], &v7, 0);
  if (!v7) {
    return 0;
  }
  int v5 = [a3 captureType];
  if (v5 == 12) {
    return [a3 deliverDeferredPhotoProxyImage];
  }
  if (v5 != 10)
  {
    if (v5 != 1
      || ([a3 captureFlags] & 0x100000000) == 0
      || ([a3 captureFlags] & 0x80) == 0)
    {
      return 0;
    }
    return [a3 deliverDeferredPhotoProxyImage];
  }
  return 1;
}

- (BOOL)_infoForCaptureType:(unsigned char *)a3 isSupportedCaptureTypeOut:(char *)a4 isFusionCaptureTypeOut:
{
  if (result)
  {
    uint64_t v6 = result;
    result = 0;
    char v7 = 0;
    switch(a2)
    {
      case 1:
      case 2:
      case 6:
      case 7:
        char v7 = 0;
        result = 1;
        goto LABEL_4;
      case 10:
        result = -[BWPhotonicEngineNodeConfiguration fusionSupportEnabled](*(void *)(v6 + 112));
        goto LABEL_12;
      case 11:
        result = -[BWPhotonicEngineNodeConfiguration digitalFlashSupportEnabled](*(void *)(v6 + 112));
        goto LABEL_12;
      case 12:
        result = -[BWPhotonicEngineNodeConfiguration deepFusionSupportEnabled](*(void *)(v6 + 112));
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

- (BOOL)rawNightModeSupportedForPortType:(id)a3
{
  uint64_t v4 = (void *)-[BWPhotonicEngineNodeConfiguration portTypesWithRawNightModeEnabled]((uint64_t)self->_nodeConfiguration);
  return [v4 containsObject:a3];
}

- (id)processorCoordinator
{
  return self->_processorCoordinator;
}

- (id)nodeSubType
{
  return @"PhotonicEngineProcessor";
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
  v12[0] = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 1000)];
  -[BWVideoFormatRequirements setSupportedPixelFormats:](v9, "setSupportedPixelFormats:", [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1]);
  [(BWVideoFormatRequirements *)v9 setWidth:(int)a2];
  [(BWVideoFormatRequirements *)v9 setHeight:a2 >> 32];
  [(BWVideoFormatRequirements *)v9 setWidthAlignment:16];
  [(BWVideoFormatRequirements *)v9 setHeightAlignment:16];
  if (!v7)
  {
    uint64_t v11 = [NSNumber numberWithInt:v8];
    -[BWVideoFormatRequirements setSupportedColorSpaceProperties:](v9, "setSupportedColorSpaceProperties:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1]);
  }
  return v9;
}

void __66__BWPhotonicEngineNode_prepareForCurrentConfigurationToBecomeLive__block_invoke(uint64_t a1)
{
}

- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  BOOL v7 = [(BWNode *)self inputs];
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
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (dword_1EB4C5670)
  {
    int v17 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (-[BWNode input:hasReachedState:](self, "input:hasReachedState:", self->super._input, 0, v11, v12))
  {
    sensorRawInput = self->_sensorRawInput;
    if ((!sensorRawInput || [(BWNode *)self input:sensorRawInput hasReachedState:0])
      && self->_pointCloudInput != a3
      && !self->_resourcesReleased)
    {
      [(BWFigVideoCaptureDevice *)self->_device setAdaptiveUnifiedBracketingController:0];

      self->_device = 0;
      deferredProcessorControllerQueue = self->_deferredProcessorControllerQueue;
      if (deferredProcessorControllerQueue)
      {
        blocuint64_t k = MEMORY[0x1E4F143A8];
        uint64_t v19 = 3221225472;
        unint64_t v20 = __ubn_dispatch_sync_block_invoke_0;
        uint64_t v21 = &unk_1E5C249F0;
        unsigned int v22 = &__block_literal_global_118;
        dispatch_sync(deferredProcessorControllerQueue, &block);
      }
      processorCoordinatorWorkerQueue = self->_processorCoordinatorWorkerQueue;
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __50__BWPhotonicEngineNode_didReachEndOfDataForInput___block_invoke_2;
      v15[3] = &unk_1E5C24430;
      v15[4] = self;
      blocuint64_t k = MEMORY[0x1E4F143A8];
      uint64_t v19 = 3221225472;
      unint64_t v20 = __ubn_dispatch_sync_block_invoke_0;
      uint64_t v21 = &unk_1E5C249F0;
      unsigned int v22 = v15;
      dispatch_sync(processorCoordinatorWorkerQueue, &block);
      uint64_t v9 = self->_processorCoordinatorWorkerQueue;
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __50__BWPhotonicEngineNode_didReachEndOfDataForInput___block_invoke_5;
      v14[3] = &unk_1E5C24430;
      v14[4] = self;
      blocuint64_t k = MEMORY[0x1E4F143A8];
      uint64_t v19 = 3221225472;
      unint64_t v20 = __ubn_dispatch_sync_block_invoke_0;
      uint64_t v21 = &unk_1E5C249F0;
      unsigned int v22 = v14;
      dispatch_sync(v9, &block);
    }
  }
  if ([(BWNode *)self allInputsHaveReachedState:0])
  {
    -[BWPhotonicEngineNode _releaseResources]((uint64_t)self);
    emitQueue = self->_emitQueue;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __50__BWPhotonicEngineNode_didReachEndOfDataForInput___block_invoke_6;
    v13[3] = &unk_1E5C24430;
    v13[4] = self;
    blocuint64_t k = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    unint64_t v20 = __ubn_dispatch_async_block_invoke_0;
    uint64_t v21 = &unk_1E5C249F0;
    unsigned int v22 = v13;
    dispatch_async(emitQueue, &block);
  }
}

void __50__BWPhotonicEngineNode_didReachEndOfDataForInput___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  objc_super v3 = *(NSObject **)(v2 + 504);
  if (v3)
  {
    blocuint64_t k = MEMORY[0x1E4F143A8];
    uint64_t v6 = 3221225472;
    BOOL v7 = __ubn_dispatch_sync_block_invoke_0;
    uint64_t v8 = &unk_1E5C249F0;
    uint64_t v9 = &__block_literal_global_93_1;
    dispatch_sync(v3, &block);
    uint64_t v2 = *(void *)(a1 + 32);
  }
  uint64_t v4 = *(NSObject **)(v2 + 800);
  if (v4)
  {
    blocuint64_t k = MEMORY[0x1E4F143A8];
    uint64_t v6 = 3221225472;
    BOOL v7 = __ubn_dispatch_sync_block_invoke_0;
    uint64_t v8 = &unk_1E5C249F0;
    uint64_t v9 = &__block_literal_global_95;
    dispatch_sync(v4, &block);
  }
}

void __50__BWPhotonicEngineNode_didReachEndOfDataForInput___block_invoke_5(uint64_t a1)
{
}

- (void)_resetProcessingState
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (!_FigIsCurrentDispatchQueue())
    {
      uint64_t v10 = v1;
      LODWORD(v9) = 0;
      FigDebugAssert3();
    }
    if (*(unsigned char *)(a1 + 216))
    {
      if (*(void *)(a1 + 152) && dword_1EB4C5670 != 0)
      {
        int v14 = 0;
        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
        os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
    }
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 168), "controllerForType:", 12, v9, v10), "cancelProcessing");
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 168), "controllerForType:", 6), "cancelProcessing");
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 168), "controllerForType:", 2), "cancelProcessing");
    BOOL v5 = *(NSObject **)(a1 + 504);
    if (v5)
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      void v12[2] = __45__BWPhotonicEngineNode__resetProcessingState__block_invoke;
      v12[3] = &unk_1E5C24430;
      v12[4] = a1;
      blocuint64_t k = MEMORY[0x1E4F143A8];
      uint64_t v16 = 3221225472;
      int v17 = __ubn_dispatch_sync_block_invoke_0;
      int v18 = &unk_1E5C249F0;
      uint64_t v19 = v12;
      dispatch_sync(v5, &block);
    }
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 168), "controllerForType:", 7), "cancelProcessing");
    objc_msgSend((id)-[BWPhotonicEngineNode _waitAndSafelyGetProcessorControllerForType:](a1, 10), "cancelProcessing");
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 168), "controllerForType:", 18), "cancelProcessing");
    objc_msgSend((id)-[BWPhotonicEngineNode _waitAndSafelyGetProcessorControllerForType:](a1, 16), "cancelProcessing");
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 168), "controllerForType:", 15), "cancelProcessing");
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 168), "controllerForType:", 4), "cancelProcessing");
    uint64_t v6 = *(NSObject **)(a1 + 800);
    if (v6)
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __45__BWPhotonicEngineNode__resetProcessingState__block_invoke_2;
      v11[3] = &unk_1E5C24430;
      v11[4] = a1;
      blocuint64_t k = MEMORY[0x1E4F143A8];
      uint64_t v16 = 3221225472;
      int v17 = __ubn_dispatch_sync_block_invoke_0;
      int v18 = &unk_1E5C249F0;
      uint64_t v19 = v11;
      dispatch_sync(v6, &block);
    }
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 168), "controllerForType:", 9), "cancelProcessing");
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 168), "controllerForType:", 13), "cancelProcessing");
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 168), "controllerForType:", 11), "cancelProcessing");
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 168), "controllerForType:", 14), "cancelProcessing");
    [*(id *)(a1 + 432) removeAllObjects];

    *(void *)(a1 + 480) = 0;
    [*(id *)(a1 + 496) removeAllObjects];
    [*(id *)(a1 + 664) removeAllObjects];
    [*(id *)(a1 + 672) removeAllObjects];
    [*(id *)(a1 + 712) removeAllObjects];
    [*(id *)(a1 + 760) removeAllObjects];
    [*(id *)(a1 + 832) removeAllObjects];
    [*(id *)(a1 + 608) removeAllObjects];
    [*(id *)(a1 + 616) removeAllObjects];
    [*(id *)(a1 + 632) removeAllObjects];
    [*(id *)(a1 + 648) removeAllObjects];

    *(void *)(a1 + 784) = 0;
    [*(id *)(a1 + 816) removeAllObjects];
    *(_DWORD *)(a1 + 792) = 0;
    [*(id *)(a1 + 888) removeAllObjects];
    [*(id *)(a1 + 904) removeAllObjects];
    [*(id *)(a1 + 280) removeAllObjects];
    [*(id *)(a1 + 288) removeAllObjects];
    [*(id *)(a1 + 296) removeAllObjects];

    *(void *)(a1 + 312) = 0;
    [*(id *)(a1 + 320) removeAllObjects];
    [*(id *)(a1 + 336) removeAllObjects];
    [*(id *)(a1 + 344) removeAllObjects];
    [*(id *)(a1 + 352) removeAllObjects];
    [*(id *)(a1 + 416) removeAllObjects];
    BOOL v7 = *(const void **)(a1 + 928);
    if (v7)
    {
      CFRelease(v7);
      *(void *)(a1 + 928) = 0;
    }

    *(void *)(a1 + 920) = 0;
    [*(id *)(a1 + 936) removeAllObjects];
    [*(id *)(a1 + 968) removeAllObjects];
    uint64_t v8 = *(const void **)(a1 + 984);
    if (v8)
    {
      CFRelease(v8);
      *(void *)(a1 + 984) = 0;
    }
    [*(id *)(a1 + 368) removeAllObjects];
    [*(id *)(a1 + 376) removeAllObjects];
    [*(id *)(a1 + 384) removeAllObjects];
    [*(id *)(a1 + 808) removeAllObjects];
    if (*(void *)(a1 + 152))
    {

      *(void *)(a1 + 136) = *(id *)(a1 + 152);
    }
    *(void *)(a1 + 144) = 0;

    *(void *)(a1 + 152) = 0;
    *(void *)(a1 + 160) = 0;
    *(unsigned char *)(a1 + 328) = 0;
  }
}

uint64_t __50__BWPhotonicEngineNode_didReachEndOfDataForInput___block_invoke_6(uint64_t a1)
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
  if (self->_resourcesReleased)
  {
    uint64_t v10 = 4294954516;
LABEL_10:
    CFTypeRef v11 = CMGetAttachment(a3, @"StillSettings", 0);
    id v12 = +[BWNodeError newError:v10 sourceNode:self stillImageSettings:v11 metadata:CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0)];
    [(BWPhotonicEngineNode *)self handleNodeError:v12 forInput:a4];
    return;
  }
  if (self->_pointCloudInput != a4)
  {
    BOOL v7 = [[BWPhotonicEngineNodeSampleBufferAndInput alloc] initWithSampleBuffer:a3 nodeInput:a4];
    if (v7)
    {
      uint64_t v8 = v7;
      [(BWPhotonicEngineNodeSampleBufferAndInputQueue *)self->_sampleBufferAndInputQueue enqueue:v7];

      processorCoordinatorWorkerQueue = self->_processorCoordinatorWorkerQueue;
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __52__BWPhotonicEngineNode_renderSampleBuffer_forInput___block_invoke;
      v13[3] = &unk_1E5C24430;
      v13[4] = self;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __ubn_dispatch_async_block_invoke_0;
      block[3] = &unk_1E5C249F0;
      block[4] = v13;
      dispatch_async(processorCoordinatorWorkerQueue, block);
      return;
    }
    uint64_t v10 = 4294954510;
    goto LABEL_10;
  }
  -[BWPhotonicEngineNode _handlePointCloudSampleBuffer:]((uint64_t)self, a3);
}

- (uint64_t)_handlePointCloudSampleBuffer:(uint64_t)result
{
  if (!result) {
    return result;
  }
  uint64_t v4 = result;
  if (!_FigIsNotCurrentDispatchQueue())
  {
    uint64_t v6 = v2;
    LODWORD(v5) = 0;
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
  if (objc_msgSend(*(id *)(v4 + 112), "depthDataType", v5, v6) == 7)
  {
    -[BWPhotonicEngineNode _handleLidarDepthPointCloudSampleBuffer:](v4, (uint64_t)a2);
  }
  else
  {
    uint64_t result = [*(id *)(v4 + 104) supplementalPointCloudCaptureDevice];
    if (!result) {
      return result;
    }
    -[BWPhotonicEngineNode _handleSupplementalPointCloudSampleBuffer:](v4, a2);
  }
  return 0;
}

void __52__BWPhotonicEngineNode_renderSampleBuffer_forInput___block_invoke(uint64_t a1)
{
}

- (void)_handleNextQueuedSampleBuffer
{
  if (a1)
  {
    if (!_FigIsCurrentDispatchQueue())
    {
      uint64_t v10 = v1;
      LODWORD(v8) = 0;
      FigDebugAssert3();
    }
    id v11 = (id)objc_msgSend(*(id *)(a1 + 248), "newDequeuedSampleBufferAndInput", v8, v10);
    if (v11)
    {
      uint64_t v3 = -[BWPhotonicEngineNode _handleSampleBuffer:input:](a1, (void *)[v11 sampleBuffer], objc_msgSend(v11, "nodeInput"));
      if (v3)
      {
        uint64_t v4 = v3;
        LODWORD(v9) = v3;
        FigDebugAssert3();
        CFTypeRef v5 = CMGetAttachment((CMAttachmentBearerRef)objc_msgSend(v11, "sampleBuffer", v9, v1), @"StillSettings", 0);
        uint64_t v6 = (const void *)[v11 sampleBuffer];
        CFTypeRef v7 = CMGetAttachment(v6, (CFStringRef)*MEMORY[0x1E4F53070], 0);
        -[BWPhotonicEngineNode _resetProcessingState](a1);
        -[BWPhotonicEngineNode _emitError:stillImageSettings:metadata:description:](a1, v4, (uint64_t)v5, (uint64_t)v7);
      }
    }
  }
}

- (uint64_t)_handleSampleBuffer:(uint64_t)a3 input:
{
  block[16] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  if (!_FigIsCurrentDispatchQueue())
  {
    FigDebugAssert3();
    if (a2) {
      goto LABEL_4;
    }
LABEL_43:
    uint64_t v20 = 4294954516;
    goto LABEL_20;
  }
  if (!a2) {
    goto LABEL_43;
  }
LABEL_4:
  uint64_t v6 = (void *)CMGetAttachment(a2, @"StillSettings", 0);
  if (!v6) {
    goto LABEL_43;
  }
  CFTypeRef v7 = v6;
  if (objc_msgSend((id)objc_msgSend(v6, "requestedSettings"), "isBeginMomentCaptureSettings")
    && !*(unsigned char *)(a1 + 328)
    && objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 160), "requestedSettings"), "captureRequestIdentifier"), "isEqualToString:", objc_msgSend((id)objc_msgSend(v7, "requestedSettings"), "captureRequestIdentifier")))
  {
    BWStillImageCoordinatorUpdateBeginMomentAttachmentsForSampleBuffer(a2, *(void **)(a1 + 160));
    CFTypeRef v7 = *(void **)(a1 + 160);
  }
  if (dword_1EB4C5670)
  {
    int v31 = 0;
    v30[1] = 0;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  uint64_t v9 = (void *)CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  if (!v9) {
    goto LABEL_43;
  }
  uint64_t v10 = v9;
  id v11 = (void *)[v9 objectForKeyedSubscript:*MEMORY[0x1E4F54128]];
  if (-[BWPhotonicEngineNode _shouldPassthroughWithStillImageSettings:](a1, v7))
  {
    if (FigCaptureSushiRawDNGDictionaryCreatedInGraph()
      && FigCapturePixelFormatIsBayerRaw(objc_msgSend((id)objc_msgSend(v7, "requestedSettings"), "rawOutputFormat")))
    {
      unsigned int v24 = objc_msgSend((id)objc_msgSend(v7, "requestedSettings"), "outputWidth");
      uint64_t v25 = objc_msgSend((id)objc_msgSend(v7, "requestedSettings"), "outputHeight");
      int v26 = objc_msgSend((id)objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E4F53328]), "intValue");
      int v27 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 656), "portTypesWithGeometricDistortionCorrectionEnabled"), "containsObject:", v11);
      if (v26) {
        int v28 = 1;
      }
      else {
        int v28 = v27;
      }
      -[BWPhotonicEngineNode _propagateSushiRawDNGDictionaryWithOutputSampleBuffer:requestedDimensions:requiresGDCInformation:](a1, a2, v24 | (unint64_t)(v25 << 32), v28);
    }
    -[BWPhotonicEngineNode _emitSampleBuffer:description:](a1, a2, @"passthrough input frame");
    goto LABEL_19;
  }
  v30[0] = 0;
  -[BWPhotonicEngineNode _infoForCaptureType:isSupportedCaptureTypeOut:isFusionCaptureTypeOut:](a1, objc_msgSend((id)objc_msgSend(v7, "captureSettings"), "captureType"), 0, v30);
  if (([*(id *)(a1 + 112) deferredPhotoProcessorEnabled] & 1) == 0
    && v30[0]
    && (objc_msgSend(*(id *)(a1 + 136), "isEqualToString:", objc_msgSend((id)objc_msgSend(v7, "requestedSettings"), "captureRequestIdentifier")) & 1) != 0)
  {
LABEL_19:
    uint64_t v20 = 0;
LABEL_20:
    -[BWPhotonicEngineNode _resetProcessingStateIfDone](a1);
    return v20;
  }
  uint64_t v12 = -[BWPhotonicEngineNode _setupProcessingStateWithSettings:](a1, v7);
  if (v12)
  {
    uint64_t v20 = v12;
    goto LABEL_20;
  }
  id v13 = (id)[*(id *)(a1 + 960) objectForKeyedSubscript:v11];
  id v14 = (id)[*(id *)(a1 + 648) objectForKeyedSubscript:v11];
  id v15 = (id)[*(id *)(a1 + 416) objectForKeyedSubscript:v11];
  id v16 = (id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 368), "objectForKeyedSubscript:", v11), "firstObject");
  if (v13)
  {
    CFTypeRef v17 = CMGetAttachment(a2, @"DeferredProcessingContainer", 0);
    uint64_t v18 = objc_msgSend((id)objc_msgSend((id)CMGetAttachment(a2, @"PhotoManifest", 0), "photoDescriptors"), "firstObject");
    uint64_t v19 = *(NSObject **)(a1 + 944);
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __50__BWPhotonicEngineNode__handleSampleBuffer_input___block_invoke;
    v29[3] = &unk_1E5C248A0;
    v29[4] = v13;
    v29[5] = v17;
    v29[6] = v18;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __ubn_dispatch_async_block_invoke_0;
    block[3] = &unk_1E5C249F0;
    block[4] = v29;
    dispatch_async(v19, block);
    goto LABEL_19;
  }
  if (*(void *)(a1 + 128) == a3)
  {
    uint64_t v20 = -[BWPhotonicEngineNode _handleSensorRawSampleBuffer:](a1, a2);
    if (v20) {
      FigDebugAssert3();
    }
    goto LABEL_20;
  }
  if (v14)
  {
    if (+[BWRedEyeReductionControllerInput requiresInferencesFromFrame:a2])
    {
      -[BWPhotonicEngineNode _inferenceProcessRedEyeReductionSampleBuffer:settings:portType:](a1, (opaqueCMSampleBuffer *)a2, v7, v11);
    }
    else
    {
      unsigned int v22 = (void (**)(id, void *, uint64_t, id, void))-[BWPhotonicEngineNode _ubRERRouter]((id)a1);
      v22[2](v22, a2, 1, v14, 0);
    }
    goto LABEL_19;
  }
  if (v15)
  {
    [v15 setInputFrame:a2];
    goto LABEL_19;
  }
  uint64_t v23 = v16;
  if (v16)
  {
    [v16 addFrame:a2];
    if ((objc_msgSend((id)objc_msgSend(v7, "captureSettings"), "captureFlags") & 4) == 0)
    {
      if (objc_msgSend((id)objc_msgSend(v7, "captureSettings"), "captureType") == 7)
      {
        -[BWPhotonicEngineNode _handleClientBracketFrameEmissionForSampleBuffer:](a1, a2);
        if (!-[BWPhotonicEngineNode _processingNeededForSettings:portType:](a1, (void *)[v23 stillImageSettings], objc_msgSend(v23, "portType"))&& objc_msgSend(v23, "receivedAllFrames"))
        {
          -[BWPhotonicEngineNode _processorControllerDidFinishProcessingInputForPortType:processorType:captureRequestIdentifier:](a1, [v23 portType], 6, objc_msgSend((id)objc_msgSend(v23, "settings"), "captureRequestIdentifier"));
        }
      }
      else
      {
        -[BWPhotonicEngineNode _emitOrEnqueueFusionReferenceFrameIfNeededForSampleBuffer:](a1, a2);
      }
    }
    goto LABEL_19;
  }
  uint64_t v20 = 0;
  if (!-[BWPhotonicEngineNode _processingNeededForSettings:portType:](a1, v7, (uint64_t)v11) || v30[0]) {
    goto LABEL_20;
  }
  uint64_t v20 = -[BWPhotonicEngineNode _singleImageProcessSampleBuffer:settings:portType:](a1, (uint64_t)a2, v7, v11);
  if (v20) {
    FigDebugAssert3();
  }
  return v20;
}

- (void)_emitError:(uint64_t)a1 stillImageSettings:(uint64_t)a2 metadata:(uint64_t)a3 description:(uint64_t)a4
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
    id v9 = +[BWNodeError newError:sourceNode:stillImageSettings:metadata:](BWNodeError, "newError:sourceNode:stillImageSettings:metadata:", a2, a1, a3, a4, v11, v12);
    uint64_t v10 = *(NSObject **)(a1 + 208);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __75__BWPhotonicEngineNode__emitError_stillImageSettings_metadata_description___block_invoke;
    v13[3] = &unk_1E5C24458;
    v13[4] = a1;
    void v13[5] = v9;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __ubn_dispatch_async_block_invoke_0;
    block[3] = &unk_1E5C249F0;
    block[4] = v13;
    dispatch_async(v10, block);
  }
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
    CFTypeRef v5 = objc_msgSend(*(id *)(v4 + 168), "controllerForType:", 13, v6, v7);
    return [v5 addPointCloudToTimeMachine:a2];
  }
  return result;
}

- (void)_handleSupplementalPointCloudSampleBuffer:(uint64_t)a1
{
  block[16] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (!_FigIsNotCurrentDispatchQueue()) {
      FigDebugAssert3();
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 864));
    int v4 = *(unsigned __int8 *)(a1 + 868);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 864));
    uint64_t v5 = *(void *)(a1 + 872) + 1;
    *(void *)(a1 + 872) = v5;
    if (__ROR8__(0xCCCCCCCCCCCCCCCDLL * v5, 1) <= 0x1999999999999999uLL)
    {
      if (dword_1EB4C5670)
      {
        int v10 = 0;
        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
        os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        uint64_t v5 = *(void *)(a1 + 872);
      }
      if (v5 == -1) {
        *(void *)(a1 + 872) = 0;
      }
    }
    if (!v4)
    {
      if (a2) {
        CFRetain(a2);
      }
      uint64_t v7 = *(NSObject **)(a1 + 176);
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __66__BWPhotonicEngineNode__handleSupplementalPointCloudSampleBuffer___block_invoke;
      v8[3] = &unk_1E5C24F10;
      v8[4] = a1;
      v8[5] = a2;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __ubn_dispatch_async_block_invoke_0;
      block[3] = &unk_1E5C249F0;
      block[4] = v8;
      dispatch_async(v7, block);
    }
  }
}

void __66__BWPhotonicEngineNode__handleSupplementalPointCloudSampleBuffer___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 864));
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int8 *)(v2 + 868);
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 864));
  if (!v3)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    int v4 = *(void **)(*(void *)(a1 + 32) + 888);
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
        int v10 = (void *)[*(id *)(*(void *)(a1 + 32) + 888) objectForKeyedSubscript:*(void *)(*((void *)&v13 + 1) + 8 * i)];
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
      [*(id *)(*(void *)(a1 + 32) + 104) stopPointCloudCaptureForStillImageCaptureWithSettingsID:*(void *)(*(void *)(a1 + 32) + 144)];
      char v11 = 1;
    }
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 864));
    *(unsigned char *)(*(void *)(a1 + 32) + 868) = v11;
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 864));
  }
  uint64_t v12 = *(const void **)(a1 + 40);
  if (v12) {
    CFRelease(v12);
  }
  -[BWPhotonicEngineNode _resetProcessingStateIfDone](*(void *)(a1 + 32));
}

- (void)_resetProcessingStateIfDone
{
  if (a1)
  {
    if (!_FigIsCurrentDispatchQueue()) {
      FigDebugAssert3();
    }
    if (*(void *)(a1 + 152)
      && !*(unsigned char *)(a1 + 328)
      && ![*(id *)(a1 + 280) count]
      && ![*(id *)(a1 + 336) count]
      && ![*(id *)(a1 + 344) count]
      && !*(void *)(a1 + 920)
      && ![*(id *)(a1 + 368) count]
      && ![*(id *)(a1 + 432) count]
      && ![*(id *)(a1 + 496) count]
      && ![*(id *)(a1 + 672) count]
      && ![*(id *)(a1 + 712) count]
      && ![*(id *)(a1 + 760) count]
      && ![*(id *)(a1 + 832) count]
      && ![*(id *)(a1 + 608) count]
      && ![*(id *)(a1 + 632) count]
      && ![*(id *)(a1 + 648) count]
      && ![*(id *)(a1 + 960) count]
      && *(int *)(a1 + 792) <= 0
      && ![*(id *)(a1 + 888) count]
      && ![*(id *)(a1 + 904) count]
      && !*(_DWORD *)(a1 + 792))
    {
      -[BWPhotonicEngineNode _resetProcessingState](a1);
    }
  }
}

- (BOOL)_shouldPassthroughWithStillImageSettings:(BOOL)result
{
  if (result)
  {
    int v3 = objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "deliverSushiRaw");
    char v4 = objc_msgSend((id)objc_msgSend(a2, "requestedSettings"), "previewEnabled");
    char v5 = objc_msgSend((id)objc_msgSend(a2, "requestedSettings"), "rawThumbnailEnabled");
    int v6 = objc_msgSend((id)objc_msgSend(a2, "requestedSettings"), "outputFormat");
    BOOL v8 = (objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureFlags") & 0x800) == 0 && v6 == 0;
    if (v5) {
      BOOL v8 = 0;
    }
    if (v4) {
      BOOL v8 = 0;
    }
    return v3 && v8;
  }
  return result;
}

- (uint64_t)_setupProcessingStateWithSettings:(unint64_t)a1
{
  block[16] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  if (!_FigIsCurrentDispatchQueue())
  {
    uint64_t v85 = v2;
    LODWORD(v83) = 0;
    FigDebugAssert3();
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  if (!*(void *)(a1 + 168))
  {
    id v80 = v5;
    int v117 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    uint64_t v19 = 4294950488;
    int v31 = v80;
    goto LABEL_120;
  }
  id v88 = v5;
  if (!a2)
  {
    int v117 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    double v82 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT);
    int v31 = v88;
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    uint64_t v19 = 4294950488;
    goto LABEL_120;
  }
  int v6 = (void *)[a2 requestedSettings];
  uint64_t v7 = (void *)[a2 captureSettings];
  int v8 = objc_msgSend(*(id *)(a1 + 152), "isEqualToString:", objc_msgSend(v6, "captureRequestIdentifier"));
  char v9 = v8;
  if (v8 && (!*(unsigned char *)(a1 + 328) || ([v6 isBeginMomentCaptureSettings] & 1) != 0))
  {
    uint64_t v19 = 0;
    goto LABEL_119;
  }
  v93 = v7;
  if (dword_1EB4C5670)
  {
    int v117 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    int v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (*(unsigned char *)(a1 + 328))
  {
    if (v9) {
      goto LABEL_15;
    }
    int v117 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    char v11 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  -[BWPhotonicEngineNode _resetProcessingState](a1);
LABEL_15:
  if ((objc_msgSend(v7, "captureFlags", v83, v85) & 0x200) != 0)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 864));
    *(unsigned char *)(a1 + 868) = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 864));
  }
  char v115 = 0;
  unsigned __int8 v114 = 0;
  -[BWPhotonicEngineNode _infoForCaptureType:isSupportedCaptureTypeOut:isFusionCaptureTypeOut:](a1, [v7 captureType], &v115, (char *)&v114);
  if (!v115) {
    goto LABEL_122;
  }
  -[BWPhotonicEngineNode _releaseResourcesWithSettings:](a1, a2);
  uint64_t v12 = (void *)-[BWPhotonicEngineNode _requiredResolutionFlavorsForSharedExternalMemoryResourceWithSettings:](a1, a2);
  -[BWPhotonicEngineNode _prepareSharedExternalMemoryResourceForProcessorControllersIfNeededForResolutionFlavors:](a1, v12);
  BOOL v13 = BWDeviceSupportsDeferredPhotoProcessorPrewarming();
  if ([*(id *)(a1 + 112) deferredPhotoProcessorEnabled] && v13)
  {
    long long v14 = *(NSObject **)(a1 + 192);
    long long v15 = *(NSObject **)(a1 + 184);
    v113[0] = MEMORY[0x1E4F143A8];
    v113[1] = 3221225472;
    v113[2] = __58__BWPhotonicEngineNode__setupProcessingStateWithSettings___block_invoke;
    v113[3] = &unk_1E5C24430;
    v113[4] = a1;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __ubn_dispatch_group_async_block_invoke_0;
    block[3] = &unk_1E5C249F0;
    block[4] = v113;
    dispatch_group_async(v14, v15, block);
  }
  if (![v6 outputWidth] || !objc_msgSend(v6, "outputHeight"))
  {
LABEL_122:
    uint64_t v19 = 4294954516;
    goto LABEL_119;
  }
  *(void *)(a1 + 144) = [v7 settingsID];

  *(void *)(a1 + 152) = (id)[v6 captureRequestIdentifier];
  *(void *)(a1 + 160) = a2;
  *(unsigned char *)(a1 + 328) = 0;
  long long v16 = [[BWStillImageProcessingPlan alloc] initWithSettings:a2];
  int v17 = v114;
  uint64_t v18 = -[BWPhotonicEngineNode _setupProcessingStateForDeferredCaptureIfNeededWithSettings:](a1, a2);
  uint64_t v19 = v18;
  if (!v17)
  {
    if (!v18)
    {
      int v31 = v88;
      if ([v7 captureType] == 7)
      {
        if (!*(void *)(a1 + 776)) {
          goto LABEL_109;
        }
        uint64_t v32 = -[BWPhotonicEngineNode _setupProcessingStateForClientBracketWithSettings:processingPlan:](a1, a2, v16);
        if (!v32) {
          goto LABEL_109;
        }
        uint64_t v19 = v32;
        uint64_t v85 = v2;
        LODWORD(v83) = v32;
      }
      else if ([v7 captureType] == 2)
      {
        if ([v6 constantColorEnabled]) {
          uint64_t v77 = -[BWPhotonicEngineNode _setupProcessingStateForColorConstancyCaptureWithSettings:processingPlan:](a1, a2, v16);
        }
        else {
          uint64_t v77 = -[BWPhotonicEngineNode _setupProcessingStateForFlashCaptureWithSettings:processingPlan:](a1, a2, v16);
        }
        uint64_t v19 = v77;
        if (!v77) {
          goto LABEL_109;
        }
        uint64_t v85 = v2;
        LODWORD(v83) = v77;
      }
      else
      {
        uint64_t v78 = -[BWPhotonicEngineNode _setupProcessingStateForSingleImageCaptureWithSettings:processingPlan:](a1, a2, v16);
        if (!v78) {
          goto LABEL_109;
        }
        uint64_t v19 = v78;
        uint64_t v85 = v2;
        LODWORD(v83) = v78;
      }
      goto LABEL_134;
    }
    uint64_t v85 = v2;
    LODWORD(v83) = v18;
    goto LABEL_118;
  }
  if (v18)
  {
    uint64_t v85 = v2;
    LODWORD(v83) = v18;
LABEL_118:
    FigDebugAssert3();
LABEL_119:
    int v31 = v88;
LABEL_120:
    objc_msgSend(v31, "drain", v83, v85);
    return v19;
  }
  uint64_t v95 = v16;
  id v20 = -[BWPhotonicEngineNode _nrfOutputSbufRouter]((id)a1);
  obuint64_t j = (id)[MEMORY[0x1E4F1CA48] array];
  long long v109 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  uint64_t v21 = objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "portTypes");
  uint64_t v22 = [v21 countByEnumeratingWithState:&v109 objects:v122 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v110;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v110 != v24) {
          objc_enumerationMutation(v21);
        }
        int v26 = *(void **)(*((void *)&v109 + 1) + 8 * i);
        if (-[BWPhotonicEngineNode _nrfProcessorInputNeededForSettings:portType:](a1, a2, (uint64_t)v26)
          && [*(id *)(a1 + 168) controllerForType:6])
        {
          int v27 = [[BWNRFProcessorInput alloc] initWithSettings:a2 portType:v26];
          id v28 = &unk_1EFB04BE0;
          if (!objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "learnedNRStereoPhotoFrameFlag")) {
            id v28 = -[BWPhotonicEngineNode _bufferTypesForCaptureSettings:](a1, (void *)[a2 captureSettings]);
          }
          [(BWStillImageProcessorControllerInput *)v27 addOutputSampleBufferRouter:v20 forBufferTypes:v28];
          [(BWStillImageProcessingPlan *)v95 addInput:v27 sequenceNumber:0 portType:v26 bufferTypes:v28];
          objc_msgSend(*(id *)(a1 + 368), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObject:", v27), v26);
          if (v27)
          {
            if ([(BWStillImageProcessorControllerInput *)v27 isMaster]) {
              [obj insertObject:v27 atIndex:0];
            }
            else {
              [obj addObject:v27];
            }
          }
        }
        -[BWPhotonicEngineNode _setupDeferredProcessingWithSettings:portType:](a1, a2, v26);
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v109 objects:v122 count:16];
    }
    while (v23);
  }
  int v29 = (void *)[*(id *)(a1 + 168) controllerForType:6];
  if ([v93 deliverOriginalImage]) {
    BOOL v30 = ([v93 captureFlags] & 0x2000) == 0;
  }
  else {
    BOOL v30 = 0;
  }
  uint64_t v33 = v95;
  int v87 = [v93 deliverOriginalImage];
  if ([v93 captureType] == 12) {
    int v92 = [v93 deliverDeferredPhotoProxyImage] ^ 1;
  }
  else {
    int v92 = 0;
  }
  char v91 = -[BWPhotonicEngineNode _isSemanticRenderingCapture:](a1, a2);
  char v90 = -[BWPhotonicEngineNode _inferencesRequiredByProcessorControllersForSettings:](a1, a2);
  if (v30)
  {
    long long v107 = 0u;
    long long v108 = 0u;
    long long v105 = 0u;
    long long v106 = 0u;
    uint64_t v34 = [obj countByEnumeratingWithState:&v105 objects:v121 count:16];
    if (v34)
    {
      uint64_t v35 = v34;
      uint64_t v36 = *(void *)v106;
      while (2)
      {
        for (uint64_t j = 0; j != v35; ++j)
        {
          if (*(void *)v106 != v36) {
            objc_enumerationMutation(obj);
          }
          unint64_t v38 = *(void **)(*((void *)&v105 + 1) + 8 * j);
          uint64_t v39 = objc_msgSend(v29, "enqueueInputForProcessing:delegate:processErrorRecoveryFrame:processOriginalImage:processToneMapping:processInferenceInputImage:clientBracketSequenceNumber:processSemanticRendering:provideInferenceInputImageForProcessing:processSmartStyleRenderingInput:inferencesAvailable:", v38, a1, 0, 1, 0, 0, 0);
          if (v39)
          {
            uint64_t v19 = v39;
            uint64_t v85 = v2;
            LODWORD(v83) = v39;
            goto LABEL_118;
          }
          objc_msgSend(v38, "setRemainingProcessingCount:", objc_msgSend(v38, "remainingProcessingCount") + 1);
        }
        uint64_t v35 = [obj countByEnumeratingWithState:&v105 objects:v121 count:16];
        if (v35) {
          continue;
        }
        break;
      }
    }
  }
  BOOL v86 = v30;
  id v94 = v29;
  long long v103 = 0u;
  long long v104 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  uint64_t v40 = [obj countByEnumeratingWithState:&v101 objects:v120 count:16];
  if (v40)
  {
    uint64_t v41 = v40;
    uint64_t v42 = *(void *)v102;
    double v43 = &OBJC_IVAR___BWVideoOrientationMetadataNode__localIDOfOrientationMetadata;
    uint64_t v89 = a2;
    while (2)
    {
      for (uint64_t k = 0; k != v41; ++k)
      {
        if (*(void *)v102 != v42) {
          objc_enumerationMutation(obj);
        }
        uint64_t v45 = *(void **)(*((void *)&v101 + 1) + 8 * k);
        v46 = (void *)[v45 portType];
        if (-[BWPhotonicEngineNode _processingNeededForSettings:portType:](a1, (void *)[v45 stillImageSettings], (uint64_t)v46))
        {
          uint64_t v47 = -[BWPhotonicEngineNode _setupSoftISPProcessingStateIfNeededWithSettings:portType:](a1, a2, v46);
          if (v47)
          {
            uint64_t v19 = v47;
            uint64_t v85 = v2;
            LODWORD(v83) = v47;
            goto LABEL_118;
          }
          int v48 = -[BWPhotonicEngineNode _isInferenceInputImageRequiredForSettings:portType:](a1, a2, (uint64_t)v46);
          char v49 = v48;
          if (v48)
          {
            uint64_t v50 = objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "learnedNRStereoPhotoFrameFlag");
            uint64_t v51 = v41;
            uint64_t v52 = v42;
            int v53 = v43;
            if (v50) {
              uint64_t v54 = 39;
            }
            else {
              uint64_t v54 = 15;
            }
            id v55 = -[BWPhotonicEngineNode _ubInferenceInputRouter]((id)a1);
            uint64_t v119 = [NSNumber numberWithUnsignedLongLong:v54];
            uint64_t v56 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v119 count:1];
            id v57 = v55;
            uint64_t v33 = v95;
            [v45 addOutputSampleBufferRouter:v57 forBufferTypes:v56];
            uint64_t v58 = v54;
            double v43 = v53;
            uint64_t v42 = v52;
            uint64_t v41 = v51;
            a2 = v89;
            [(BWStillImageProcessingPlan *)v95 addInput:v45 sequenceNumber:0 portType:v46 bufferType:v58];
          }
          if (*(void *)(a1 + v43[727])) {
            BOOL v59 = BWIsSmartStyleCapture(a2);
          }
          else {
            BOOL v59 = 0;
          }
          HIBYTE(v84) = v90;
          BYTE6(v84) = v59;
          BYTE5(v84) = v49;
          BYTE4(v84) = v91;
          LODWORD(v84) = 0;
          uint64_t v60 = objc_msgSend(v94, "enqueueInputForProcessing:delegate:processErrorRecoveryFrame:processOriginalImage:processToneMapping:processInferenceInputImage:clientBracketSequenceNumber:processSemanticRendering:provideInferenceInputImageForProcessing:processSmartStyleRenderingInput:inferencesAvailable:", v45, a1, 0, 0, 0, 0, v84);
          if (v60)
          {
            uint64_t v19 = v60;
            uint64_t v85 = v2;
            LODWORD(v83) = v60;
            goto LABEL_118;
          }
          if ((v92 & 1) == 0)
          {
            uint64_t v61 = -[BWPhotonicEngineNode _setupProcessingStateForIntelligentDistortionCorrectionIfNeededWithSettings:sequenceNumber:portType:processingPlan:](a1, a2, 0, (uint64_t)v46, v33);
            if (v61)
            {
              uint64_t v19 = v61;
              uint64_t v85 = v2;
              LODWORD(v83) = v61;
              goto LABEL_118;
            }
            uint64_t v62 = -[BWPhotonicEngineNode _setupProcessingStateForScalerIfNeededWithSettings:sequenceNumber:portType:processingPlan:](a1, a2, 0, v46, v33);
            if (v62)
            {
              uint64_t v19 = v62;
              uint64_t v85 = v2;
              LODWORD(v83) = v62;
              goto LABEL_118;
            }
            uint64_t v63 = -[BWPhotonicEngineNode _setupProcessingStateForDeepZoomWithSettings:sequenceNumber:portType:processingPlan:]((id *)a1, a2, 0, (uint64_t)v46, v33);
            if (v63)
            {
              uint64_t v19 = v63;
              uint64_t v85 = v2;
              LODWORD(v83) = v63;
              goto LABEL_118;
            }
            uint64_t v64 = -[BWPhotonicEngineNode _setupProcessingStateForSmartStyleWithSettings:sequenceNumber:portType:processingPlan:](a1, a2, 0, (uint64_t)v46, v33);
            if (v64)
            {
              uint64_t v19 = v64;
              uint64_t v85 = v2;
              LODWORD(v83) = v64;
              goto LABEL_118;
            }
          }
        }
        objc_msgSend(v45, "setRemainingProcessingCount:", objc_msgSend(v45, "remainingProcessingCount") + 1);
      }
      uint64_t v41 = [obj countByEnumeratingWithState:&v101 objects:v120 count:16];
      if (v41) {
        continue;
      }
      break;
    }
  }
  uint64_t v65 = -[BWPhotonicEngineNode _setupProcessingStateForDisparityIfNeededWithSettings:sequenceNumber:processingPlan:](a1, a2, 0, v33);
  if (v65)
  {
    uint64_t v19 = v65;
    uint64_t v85 = v2;
    LODWORD(v83) = v65;
    goto LABEL_118;
  }
  if (((v87 ^ 1 | v86) & 1) == 0)
  {
    long long v99 = 0u;
    long long v100 = 0u;
    long long v97 = 0u;
    long long v98 = 0u;
    uint64_t v66 = [obj countByEnumeratingWithState:&v97 objects:v118 count:16];
    if (v66)
    {
      uint64_t v67 = v66;
      uint64_t v68 = *(void *)v98;
      while (2)
      {
        for (uint64_t m = 0; m != v67; ++m)
        {
          if (*(void *)v98 != v68) {
            objc_enumerationMutation(obj);
          }
          int64_t v70 = *(void **)(*((void *)&v97 + 1) + 8 * m);
          uint64_t v71 = objc_msgSend(v94, "enqueueInputForProcessing:delegate:processErrorRecoveryFrame:processOriginalImage:processToneMapping:processInferenceInputImage:clientBracketSequenceNumber:processSemanticRendering:provideInferenceInputImageForProcessing:processSmartStyleRenderingInput:inferencesAvailable:", v70, a1, 0, 1, 0, 0, 0);
          if (v71)
          {
            uint64_t v19 = v71;
            uint64_t v85 = v2;
            LODWORD(v83) = v71;
            goto LABEL_118;
          }
          objc_msgSend(v70, "setRemainingProcessingCount:", objc_msgSend(v70, "remainingProcessingCount") + 1);
        }
        uint64_t v67 = [obj countByEnumeratingWithState:&v97 objects:v118 count:16];
        if (v67) {
          continue;
        }
        break;
      }
    }
  }
  int v31 = v88;
  if (v92)
  {
    if (![*(id *)(a1 + 280) count])
    {
      uint64_t v72 = -[BWPhotonicEngineNode _setupSoftISPProcessingStateIfNeededWithSettings:portType:](a1, a2, objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "masterPortType"));
      if (v72)
      {
        uint64_t v19 = v72;
        uint64_t v85 = v2;
        LODWORD(v83) = v72;
        goto LABEL_134;
      }
    }
    uint64_t v73 = -[BWPhotonicEngineNode _setupProcessingStateForDeepFusionWithSettings:processingPlan:](a1, a2, v33);
    if (v73)
    {
      uint64_t v19 = v73;
      uint64_t v85 = v2;
      LODWORD(v83) = v73;
      goto LABEL_134;
    }
  }
  uint64_t v74 = -[BWPhotonicEngineNode _setupProcessingStateForPointCloudDepthIfNeededWithSettings:processingPlan:](a1, a2, v33);
  if (v74)
  {
    uint64_t v19 = v74;
    uint64_t v85 = v2;
    LODWORD(v83) = v74;
LABEL_134:
    FigDebugAssert3();
    goto LABEL_120;
  }
  uint64_t v75 = -[BWPhotonicEngineNode _setupProcessingStateForJasperDisparityIfNeededWithSettings:processingPlan:](a1, a2, v33);
  if (v75)
  {
    uint64_t v19 = v75;
    uint64_t v85 = v2;
    LODWORD(v83) = v75;
    goto LABEL_134;
  }
  id v76 = -[BWPhotonicEngineNode _softISPFusionCaptureOutputSbufRouter]((id)a1);
  -[BWPhotonicEngineNode _setupSoftISPOutputRoutingIfNeededWithOutputSampleBufferRouter:processingPlan:](a1, (uint64_t)v76, v33);
LABEL_109:
  [v31 drain];
  -[BWPhotonicEngineNode _drainStashedBeginMomentBuffersIfNeededWithSettings:](a1, a2);
  return 0;
}

uint64_t __50__BWPhotonicEngineNode__handleSampleBuffer_input___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = [*(id *)(a1 + 48) photoIdentifier];
  return [v1 setContainer:v2 photoIdentifier:v3];
}

- (uint64_t)_handleSensorRawSampleBuffer:(uint64_t)a1
{
  uint64_t v3 = a1;
  cf[22] = *(CFTypeRef *)MEMORY[0x1E4F143B8];
  if (!a1) {
    return v3;
  }
  if (!_FigIsCurrentDispatchQueue())
  {
    uint64_t v17 = v2;
    LODWORD(v16) = 0;
    FigDebugAssert3();
  }
  id v5 = (void *)CMGetAttachment(a2, @"StillSettings", 0);
  uint64_t v6 = objc_msgSend((id)CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E4F53070], 0), "objectForKeyedSubscript:", *MEMORY[0x1E4F54128]);
  uint64_t v7 = objc_msgSend((id)objc_msgSend(v5, "captureSettings"), "captureStreamSettingsForPortType:", v6);
  unsigned __int16 v8 = (unsigned __int16)BWStillImageCaptureFrameFlagsForSampleBuffer(a2);
  if (![v7 sensorRawCapturedForFinalImageProcessing])
  {
    if (objc_msgSend((id)objc_msgSend(v5, "captureSettings"), "captureType") == 7) {
      -[BWPhotonicEngineNode _handleClientBracketFrameEmissionForSampleBuffer:](v3, a2);
    }
    else {
      -[BWPhotonicEngineNode _handleSampleBufferForDisparityIfNeeded:](v3, a2);
    }
    return 0;
  }
  if (!-[BWPhotonicEngineNode _processingNeededForSettings:portType:](v3, v5, v6))
  {
    -[BWPhotonicEngineNode _handleSampleBufferForDisparityIfNeeded:](v3, a2);
    -[BWPhotonicEngineNode _deferredCaptureHandleSensorRawSampleBuffer:](v3, a2);
    return 0;
  }
  if ((v8 & 0x100) != 0)
  {
    uint64_t v10 = [v7 expectedReferenceFrameCandidateCount];
    cf[0] = 0;
    if ((int)v10 < 2)
    {
      if (a2) {
        CFTypeRef v14 = CFRetain(a2);
      }
      else {
        CFTypeRef v14 = 0;
      }
      BOOL v13 = 0;
      cf[0] = v14;
    }
    else
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(BWSharpnessScoreReferenceFrameSelector **)(v3 + 312);
      if (!v12)
      {
        uint64_t v12 = -[BWSharpnessScoreReferenceFrameSelector initWithCommandQueue:externalMemoryResource:candidateCount:]([BWSharpnessScoreReferenceFrameSelector alloc], "initWithCommandQueue:externalMemoryResource:candidateCount:", [*(id *)(v3 + 112) metalCommandQueue], *(void *)(v3 + 232), v11);
        *(void *)(v3 + 312) = v12;
      }
      BOOL v13 = -[BWSharpnessScoreReferenceFrameSelector addReferenceFrameCandidate:referenceFrameOut:](v12, "addReferenceFrameCandidate:referenceFrameOut:", a2, cf, v16, v17);
      if (!cf[0])
      {
LABEL_28:
        if (v13)
        {
          uint64_t v3 = -[BWPhotonicEngineNode _processSensorRawSampleBuffer:](v3, v13);
          CFRelease(v13);
          if (v3) {
            return v3;
          }
        }
        return 0;
      }

      *(void *)(v3 + 312) = 0;
      CFTypeRef v14 = cf[0];
    }
    if (v14)
    {
      BWStillImageAppendCaptureFrameFlagsToSampleBuffer(v14, 48);
      if (dword_1EB4C5670)
      {
        os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      -[BWPhotonicEngineNode _processSensorRawSampleBuffer:](v3, (void *)cf[0]);
      if (cf[0]) {
        CFRelease(cf[0]);
      }
    }
    goto LABEL_28;
  }
  return -[BWPhotonicEngineNode _processSensorRawSampleBuffer:](v3, a2);
}

- (void)_inferenceProcessRedEyeReductionSampleBuffer:(void *)a3 settings:(void *)a4 portType:
{
  if (!a1) {
    return;
  }
  if (!_FigIsCurrentDispatchQueue())
  {
    uint64_t v21 = v4;
    LODWORD(v20) = 0;
    FigDebugAssert3();
  }
  CFTypeRef cf = 0;
  dispatch_group_wait(*(dispatch_group_t *)(a1 + 512), 0xFFFFFFFFFFFFFFFFLL);
  CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(a2);
  if (!ImageBuffer)
  {
    uint64_t v12 = 0;
LABEL_26:
    int v19 = -12780;
    goto LABEL_19;
  }
  uint64_t v10 = ImageBuffer;
  if (-[BWPhotonicEngineNode _resolvedQSubResolutionFlavorForCaptureSettings:portType:](a1, (void *)[a3 captureSettings], a4) == 1)uint64_t v11 = objc_msgSend(*(id *)(a1 + 528), "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", 1)); {
  else
  }
    uint64_t v11 = *(void **)(a1 + 520);
  uint64_t v12 = (__CVBuffer *)objc_msgSend(v11, "newPixelBuffer", v20, v21);
  if (!v12) {
    goto LABEL_26;
  }
  int CopyWithNewPixelBuffer = -[BWPhotonicEngineNode _scaleInferenceInputForRedEyeReductionFromPixelBuffer:outputPixelBuffer:](a1, v10, v12);
  if (!CopyWithNewPixelBuffer)
  {
    int CopyWithNewPixelBuffer = BWCMSampleBufferCreateCopyWithNewPixelBuffer(a2, v12, (CFTypeRef *)(a1 + 576), (CMSampleBufferRef *)&cf);
    if (!CopyWithNewPixelBuffer)
    {
      int CopyWithNewPixelBuffer = -[BWPhotonicEngineNode _setupProcessingStateForInferenceWithSettings:portType:inferenceInputBufferType:](a1, a3, (uint64_t)a4, 0xFuLL);
      if (!CopyWithNewPixelBuffer)
      {
        uint64_t v14 = [*(id *)(a1 + 496) objectForKeyedSubscript:a4];
        if (v14)
        {
          uint64_t v15 = v14;
          if (a2) {
            CFRetain(a2);
          }
          if (cf)
          {
            CFRetain(cf);
            CFTypeRef v16 = cf;
          }
          else
          {
            CFTypeRef v16 = 0;
          }
          uint64_t v17 = *(NSObject **)(a1 + 512);
          uint64_t v18 = *(NSObject **)(a1 + 504);
          v22[0] = MEMORY[0x1E4F143A8];
          v22[1] = 3221225472;
          v22[2] = __87__BWPhotonicEngineNode__inferenceProcessRedEyeReductionSampleBuffer_settings_portType___block_invoke;
          v22[3] = &unk_1E5C264A0;
          v22[4] = v15;
          v22[5] = v16;
          v22[6] = a2;
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __ubn_dispatch_group_async_block_invoke_0;
          block[3] = &unk_1E5C249F0;
          block[4] = v22;
          dispatch_group_async(v17, v18, block);
          int v19 = 0;
          goto LABEL_19;
        }
        goto LABEL_26;
      }
    }
  }
  int v19 = CopyWithNewPixelBuffer;
LABEL_19:
  CVPixelBufferRelease(v12);
  if (cf) {
    CFRelease(cf);
  }
  if (v19) {
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 648), "objectForKeyedSubscript:", a4), "addFrame:faceObservations:", a2, 0);
  }
}

- (id)_ubRERRouter
{
  if (result)
  {
    v1[0] = MEMORY[0x1E4F143A8];
    v1[1] = 3221225472;
    v1[2] = __36__BWPhotonicEngineNode__ubRERRouter__block_invoke;
    v1[3] = &unk_1E5C28D80;
    v1[4] = result;
    return (id)[v1 copy];
  }
  return result;
}

- (void)_handleClientBracketFrameEmissionForSampleBuffer:(unint64_t)a1
{
  if (a1)
  {
    if (target)
    {
      uint64_t v4 = (void *)CMGetAttachment(target, @"StillSettings", 0);
      id v5 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53070], 0);
      uint64_t v6 = (void *)[v5 objectForKeyedSubscript:*MEMORY[0x1E4F54128]];
      if (-[BWPhotonicEngineNode _referenceOrClientBracketFrameEmissionNeededForSettings:portType:](a1, v4, v6))
      {
        uint64_t v7 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F53D38]];
        if (!objc_msgSend((id)objc_msgSend(*(id *)(a1 + 808), "objectForKeyedSubscript:", v6), "objectForKeyedSubscript:", v7))
        {
          objc_msgSend((id)objc_msgSend(*(id *)(a1 + 808), "objectForKeyedSubscript:", v6), "setObject:forKeyedSubscript:", objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E4F542D8]), v7);
          if (-[BWPhotonicEngineNode _generateDisparityForSettings:](a1, v4))
          {
            if (*(void *)(a1 + 264))
            {
              unsigned __int16 v8 = [[BWSoftISPProcessorControllerInput alloc] initWithSettings:v4 portType:v6];
              v12[0] = MEMORY[0x1E4F143A8];
              v12[1] = 3221225472;
              void v12[2] = __73__BWPhotonicEngineNode__handleClientBracketFrameEmissionForSampleBuffer___block_invoke;
              v12[3] = &unk_1E5C28E48;
              v12[4] = a1;
              void v12[5] = v7;
              [(BWStillImageProcessorControllerInput *)v8 addOutputSampleBufferRouter:v12 forBufferTypes:&unk_1EFB04AA8];
              [(BWSoftISPProcessorControllerInput *)v8 addFrame:target processingMode:3];
              if (!-[BWPhotonicEngineNode _enqueueSoftISPInput:](a1, v8)) {
            }
              }
            else
            {
              uint64_t v9 = [*(id *)(a1 + 816) objectForKeyedSubscript:v7];
              CFRetain(target);
              uint64_t v10 = *(NSObject **)(a1 + 800);
              v11[0] = MEMORY[0x1E4F143A8];
              v11[1] = 3221225472;
              v11[2] = __73__BWPhotonicEngineNode__handleClientBracketFrameEmissionForSampleBuffer___block_invoke_192;
              v11[3] = &unk_1E5C24F10;
              v11[4] = v9;
              void v11[5] = target;
              sampleBufferOut[0] = (CMSampleBufferRef)MEMORY[0x1E4F143A8];
              sampleBufferOut[1] = (CMSampleBufferRef)3221225472;
              sampleBufferOut[2] = (CMSampleBufferRef)__ubn_dispatch_async_block_invoke_0;
              sampleBufferOut[3] = (CMSampleBufferRef)&unk_1E5C249F0;
              sampleBufferOut[4] = (CMSampleBufferRef)v11;
              dispatch_async(v10, sampleBufferOut);
            }
          }
          else
          {
            sampleBufferOut[0] = 0;
            if (CMSampleBufferCreateCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CMSampleBufferRef)target, sampleBufferOut))
            {
              [NSString stringWithFormat:@"reference frame for '%@'", v6];
              -[BWPhotonicEngineNode _emitError:stillImageSettings:metadata:description:](a1, 4294954516, (uint64_t)v4, (uint64_t)v5);
            }
            else
            {
              CMSetAttachment(sampleBufferOut[0], @"NonProcessedReferenceFrame", MEMORY[0x1E4F1CC38], 1u);
              -[BWPhotonicEngineNode _emitSampleBuffer:description:](a1, sampleBufferOut[0], @"reference frame");
              if (sampleBufferOut[0]) {
                CFRelease(sampleBufferOut[0]);
              }
            }
          }
        }
      }
    }
  }
}

- (BOOL)_processingNeededForSettings:(uint64_t)a3 portType:
{
  if (result)
  {
    char v4 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "masterPortType"), "isEqualToString:", a3);
    if (objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureFlags") & 0x4000000000) == 0 || (v4)
    {
      if (v4) {
        return 1;
      }
      uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "requestedSettings"), "bravoConstituentImageDeliveryDeviceTypes"), "count");
    }
    else
    {
      uint64_t v5 = objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "learnedNRStereoPhotoFrameFlag");
    }
    return v5 != 0;
  }
  return result;
}

- (void)_processorControllerDidFinishProcessingInputForPortType:(uint64_t)a3 processorType:(void *)a4 captureRequestIdentifier:
{
  if (a1)
  {
    if (!_FigIsCurrentDispatchQueue())
    {
      uint64_t v24 = v4;
      LODWORD(v23) = 0;
      FigDebugAssert3();
    }
    if (objc_msgSend(a4, "isEqualToString:", *(void *)(a1 + 152), v23, v24))
    {
      switch(a3)
      {
        case 2:
          uint64_t v9 = 432;
          goto LABEL_32;
        case 3:
          uint64_t v9 = 496;
          goto LABEL_32;
        case 4:
          [*(id *)(a1 + 648) setObject:0 forKeyedSubscript:a2];
          uint64_t v9 = 616;
          goto LABEL_32;
        case 5:
          uint64_t v9 = 960;
          goto LABEL_32;
        case 6:
          uint64_t v10 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 368), "objectForKeyedSubscript:", a2), "firstObject");
          if (v10)
          {
            uint64_t v11 = v10;
            int v12 = [v10 remainingProcessingCount];
            if (v12 > 1)
            {
              [v11 setRemainingProcessingCount:(v12 - 1)];
            }
            else
            {
              [v11 setRemainingProcessingCount:0];
              objc_msgSend((id)objc_msgSend(*(id *)(a1 + 368), "objectForKeyedSubscript:", a2), "removeObject:", v11);
              if (!objc_msgSend((id)objc_msgSend(*(id *)(a1 + 368), "objectForKeyedSubscript:", a2), "count")) {
                [*(id *)(a1 + 368) setObject:0 forKeyedSubscript:a2];
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
        case 7:
          if (![*(id *)(a1 + 672) objectForKeyedSubscript:a2]) {
            return;
          }
          int v14 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 672), "objectForKeyedSubscript:", a2), "intValue");
          if (v14 > 1)
          {
            uint64_t v20 = [NSNumber numberWithInt:(v14 - 1)];
            int v19 = *(void **)(a1 + 672);
          }
          else
          {
            [*(id *)(a1 + 664) setObject:0 forKeyedSubscript:a2];
            uint64_t v9 = 672;
LABEL_32:
            int v19 = *(void **)(a1 + v9);
            uint64_t v20 = 0;
          }
          [v19 setObject:v20 forKeyedSubscript:a2];
          break;
        case 8:
          --*(_DWORD *)(a1 + 792);

          uint64_t v15 = 784;
          goto LABEL_27;
        case 9:
          uint64_t v9 = 888;
          goto LABEL_32;
        case 10:
          uint64_t v9 = 712;
          goto LABEL_32;
        case 11:
          uint64_t v9 = 416;
          goto LABEL_32;
        case 12:
          int v16 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 288), "objectForKeyedSubscript:", a2), "intValue");
          int v17 = v16;
          if (v16 >= 2) {
            uint64_t v18 = [NSNumber numberWithInt:(v16 - 1)];
          }
          else {
            uint64_t v18 = 0;
          }
          [*(id *)(a1 + 288) setObject:v18 forKeyedSubscript:a2];
          uint64_t v21 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 280), "objectForKeyedSubscript:", a2), "count");
          if (v17 <= 1 && v21 == 0) {
            [*(id *)(a1 + 280) setObject:0 forKeyedSubscript:a2];
          }
          if (![*(id *)(a1 + 280) count])
          {
            -[BWPhotonicEngineNode _flushSoftISPOutputBufferPools](a1);
            -[BWPhotonicEngineNode _flushUltraHighResolutionBufferPools](a1);
          }
          return;
        case 13:
          uint64_t v9 = 904;
          goto LABEL_32;
        case 14:

          uint64_t v15 = 920;
LABEL_27:
          *(void *)(a1 + v15) = 0;
          return;
        case 15:
          uint64_t v9 = 608;
          goto LABEL_32;
        case 16:
          uint64_t v9 = 832;
          goto LABEL_32;
        case 17:
          uint64_t v9 = 632;
          goto LABEL_32;
        case 18:
          uint64_t v9 = 760;
          goto LABEL_32;
        default:
          return;
      }
    }
  }
}

- (void)_emitOrEnqueueFusionReferenceFrameIfNeededForSampleBuffer:(unint64_t)a1
{
  sampleBufferOut[16] = *(CMSampleBufferRef *)MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (target)
    {
      uint64_t v4 = (void *)CMGetAttachment(target, @"StillSettings", 0);
      uint64_t v5 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53070], 0);
      uint64_t v6 = (void *)[v5 objectForKeyedSubscript:*MEMORY[0x1E4F54128]];
      if (-[BWPhotonicEngineNode _referenceOrClientBracketFrameEmissionNeededForSettings:portType:](a1, v4, v6))
      {
        if (![*(id *)(a1 + 376) objectForKeyedSubscript:v6])
        {
          objc_msgSend(*(id *)(a1 + 376), "setObject:forKeyedSubscript:", objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E4F542D8]), v6);
          if (-[BWPhotonicEngineNode _generateDisparityForSettings:](a1, v4))
          {
            if ([*(id *)(a1 + 776) stillImageDepthDataType] == 8)
            {
              uint64_t v7 = [[BWSoftISPProcessorControllerInput alloc] initWithSettings:v4 portType:v6];
              v9[0] = MEMORY[0x1E4F143A8];
              v9[1] = 3221225472;
              v9[2] = __82__BWPhotonicEngineNode__emitOrEnqueueFusionReferenceFrameIfNeededForSampleBuffer___block_invoke;
              v9[3] = &unk_1E5C28D80;
              v9[4] = a1;
              [(BWStillImageProcessorControllerInput *)v7 addOutputSampleBufferRouter:v9 forBufferTypes:&unk_1EFB04AC0];
              [(BWSoftISPProcessorControllerInput *)v7 addFrame:target processingMode:3];
              if (dword_1EB4C5670)
              {
                os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
                fig_log_call_emit_and_clean_up_after_send_and_compose();
              }
              if (!-[BWPhotonicEngineNode _enqueueSoftISPInput:](a1, v7)) {
            }
              }
          }
          else
          {
            sampleBufferOut[0] = 0;
            if (CMSampleBufferCreateCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CMSampleBufferRef)target, sampleBufferOut))
            {
              [NSString stringWithFormat:@"reference frame for '%@'", v6];
              -[BWPhotonicEngineNode _emitError:stillImageSettings:metadata:description:](a1, 4294954516, (uint64_t)v4, (uint64_t)v5);
            }
            else
            {
              CMSetAttachment(sampleBufferOut[0], @"NonProcessedReferenceFrame", MEMORY[0x1E4F1CC38], 1u);
              -[BWPhotonicEngineNode _emitSampleBuffer:description:](a1, sampleBufferOut[0], @"reference frame");
              if (sampleBufferOut[0]) {
                CFRelease(sampleBufferOut[0]);
              }
            }
          }
        }
      }
    }
  }
}

- (uint64_t)_singleImageProcessSampleBuffer:(void *)a3 settings:(void *)a4 portType:
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
  uint64_t v10 = [[BWNRFProcessorInput alloc] initWithSettings:a3 portType:a4];
  int v11 = -[BWPhotonicEngineNode _isInferenceInputImageRequiredForSettings:portType:](a1, a3, (uint64_t)a4);
  unsigned __int8 v12 = v11;
  if (v11)
  {
    uint64_t v22 = MEMORY[0x1E4F143A8];
    uint64_t v23 = 3221225472;
    uint64_t v24 = __47__BWPhotonicEngineNode__ubInferenceInputRouter__block_invoke;
    uint64_t v25 = &unk_1E5C28D80;
    unint64_t v26 = a1;
    -[BWStillImageProcessorControllerInput addOutputSampleBufferRouter:forBufferTypes:](v10, "addOutputSampleBufferRouter:forBufferTypes:", (id)[&v22 copy], &unk_1EFB04B08);
    [(BWStillImageProcessingPlan *)v9 addInput:v10 sequenceNumber:0 portType:a4 bufferType:15];
  }
  unint64_t v13 = *(void *)(a1 + 176);
  uint64_t v22 = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  uint64_t v24 = __65__BWPhotonicEngineNode__standardNROutputRouterWithExpectedQueue___block_invoke;
  uint64_t v25 = &unk_1E5C28E48;
  unint64_t v26 = v13;
  unint64_t v27 = a1;
  -[BWStillImageProcessorControllerInput addOutputSampleBufferRouter:forBufferTypes:](v10, "addOutputSampleBufferRouter:forBufferTypes:", (id)objc_msgSend(&v22, "copy", v19, v21), &unk_1EFB04B20);
  [(BWNRFProcessorInput *)v10 addFrame:a2];
  [(BWStillImageProcessingPlan *)v9 addInput:v10 sequenceNumber:0 portType:a4 bufferType:1];
  char v14 = -[BWPhotonicEngineNode _inferencesRequiredByProcessorControllersForSettings:](a1, a3);
  uint64_t v15 = -[BWPhotonicEngineNode _setupProcessingStateForJasperDisparityIfNeededWithSettings:processingPlan:](a1, a3, v9);
  if (!v15)
  {
    uint64_t v15 = -[BWPhotonicEngineNode _setupProcessingStateForIntelligentDistortionCorrectionIfNeededWithSettings:sequenceNumber:portType:processingPlan:](a1, a3, 0, (uint64_t)a4, v9);
    if (!v15)
    {
      uint64_t v16 = -[BWPhotonicEngineNode _setupProcessingStateForScalerIfNeededWithSettings:sequenceNumber:portType:processingPlan:](a1, a3, 0, a4, v9);
      if (v16)
      {
        uint64_t v17 = v16;
        FigDebugAssert3();
        goto LABEL_11;
      }
      HIBYTE(v20) = v14;
      *(_WORD *)((char *)&v20 + 5) = v12;
      BYTE4(v20) = 0;
      LODWORD(v20) = 0;
      uint64_t v15 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 168), "controllerForType:", 6), "enqueueInputForProcessing:delegate:processErrorRecoveryFrame:processOriginalImage:processToneMapping:processInferenceInputImage:clientBracketSequenceNumber:processSemanticRendering:provideInferenceInputImageForProcessing:processSmartStyleRenderingInput:inferencesAvailable:", v10, a1, 0, 0, 0, 0, v20);
    }
  }
  uint64_t v17 = v15;
LABEL_11:

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
        unsigned __int16 v8 = ImageBuffer;
        uint64_t v9 = (void *)CMGetAttachment(v6, (CFStringRef)*MEMORY[0x1E4F53070], 0);
        uint64_t v10 = (const void *)objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend((id)CMGetAttachment(v6, @"StillImageProcessingFlags", 0), "unsignedIntValue") | 0x80);
        CMSetAttachment(v6, @"StillImageProcessingFlags", v10, 1u);
        if (!CMGetAttachment(v6, @"RawDNGDictionary", 0))
        {
          uint64_t v11 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F54128]];
          uint64_t v12 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 360), "rawColorCalibrationsByPortType"), "objectForKeyedSubscript:", v11);
          if (v12)
          {
            unint64_t v13 = (void *)v12;
            uint64_t v14 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 360), "rawLensShadingCorrectionCoefficientsByPortType"), "objectForKeyedSubscript:", v11);
            if (v14)
            {
              uint64_t v15 = (void *)v14;
              unint64_t v16 = BWPixelBufferDimensionsFromSampleBuffer(v6);
              OSType PixelFormatType = CVPixelBufferGetPixelFormatType(v8);
              uint64_t v18 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 360), "sensorConfigurationsByPortType"), "objectForKeyedSubscript:", v11);
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
    -[BWPhotonicEngineNode _removeNonPropagatedAttachedMediaFromSampleBuffer:](a1, a2);
    if (a2) {
      CFRetain(a2);
    }
    uint64_t v6 = *(NSObject **)(a1 + 208);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __54__BWPhotonicEngineNode__emitSampleBuffer_description___block_invoke;
    v7[3] = &unk_1E5C249A0;
    v7[5] = a1;
    v7[6] = a2;
    v7[4] = a3;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __ubn_dispatch_async_block_invoke_0;
    block[3] = &unk_1E5C249F0;
    block[4] = v7;
    dispatch_async(v6, block);
  }
}

- (uint64_t)_processSensorRawSampleBuffer:(uint64_t)result
{
  cf[16] = *(CFTypeRef *)MEMORY[0x1E4F143B8];
  if (result)
  {
    unint64_t v4 = result;
    if (!_FigIsCurrentDispatchQueue())
    {
      uint64_t v14 = v2;
      LODWORD(v13) = 0;
      FigDebugAssert3();
    }
    uint64_t v5 = (void *)CMGetAttachment(a2, @"StillSettings", 0);
    uint64_t v6 = (void *)CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E4F53070], 0);
    uint64_t v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F54128]];
    if (dword_1EB4C5670)
    {
      int v18 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    -[BWPhotonicEngineNode _handleSampleBufferForDisparityIfNeeded:](v4, a2);
    unsigned __int8 v9 = BWStillImageCaptureFrameFlagsForSampleBuffer(a2);
    if ((v9 & 0x20) != 0)
    {
      cf[0] = 0;
      BWCMSampleBufferCreateCopyIncludingMetadata((CMSampleBufferRef)a2, (CMSampleBufferRef *)cf);
      [*(id *)(v4 + 320) setObject:cf[0] forKeyedSubscript:v7];
      if (cf[0]) {
        CFRelease(cf[0]);
      }
    }
    if ((-[BWPhotonicEngineNode _isDeferredRawDeepFusionCapture:](v4, v5) & 1) != 0
      || -[BWPhotonicEngineNode _isDeferredRawLearnedNRCapture:](v4, v5))
    {
      if ((v9 & 0x14) == 0
        || (uint64_t result = -[BWPhotonicEngineNode _serviceNextSoftISPInputWithSampleBuffer:processingMode:transferOwnership:]((id *)v4, a2, 0, 0), !result))
      {
        -[BWPhotonicEngineNode _deferredCaptureHandleSensorRawSampleBuffer:](v4, a2);
        return 0;
      }
    }
    else
    {
      if (*(void *)(v4 + 640)
        && (objc_msgSend((id)objc_msgSend(v5, "captureSettings"), "captureFlags") & 0x10000) != 0
        && (objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E4F53CA0]), "BOOLValue") & 1) == 0)
      {
        [*(id *)(v4 + 616) setObject:a2 forKeyedSubscript:v7];
      }
      int v10 = objc_msgSend((id)objc_msgSend(v5, "captureSettings", v13, v14), "captureType");
      if ((v9 & 0x10) != 0 && v10 == 12)
      {
        uint64_t v11 = (void *)[*(id *)(v4 + 432) objectForKeyedSubscript:v7];
        CFDictionaryRef v12 = CMCopyDictionaryOfAttachments((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a2, 1u);
        [v11 setEvZeroReferenceFrameAttachments:v12];
        CMSampleBufferGetPresentationTimeStamp(&v16, (CMSampleBufferRef)a2);
        CMTime v15 = v16;
        [v11 setEvZeroReferenceFramePTS:&v15];
      }
      return -[BWPhotonicEngineNode _serviceNextSoftISPInputWithSampleBuffer:processingMode:transferOwnership:]((id *)v4, a2, 0, 0);
    }
  }
  return result;
}

- (void)_handleSampleBufferForDisparityIfNeeded:(unint64_t)a1
{
  if (!a1) {
    return;
  }
  unint64_t v4 = (void *)CMGetAttachment(target, @"StillSettings", 0);
  uint64_t v5 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  uint64_t v6 = (void *)[v5 objectForKeyedSubscript:*MEMORY[0x1E4F54128]];
  if ([*(id *)(a1 + 776) stillImageDepthDataType] != 8) {
    return;
  }
  if (![*(id *)(a1 + 296) objectForKeyedSubscript:v6]) {
    objc_msgSend(*(id *)(a1 + 296), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary"), v6);
  }
  unsigned __int8 v7 = BWStillImageCaptureFrameFlagsForSampleBuffer(target);
  if ((v7 & 0x10) != 0)
  {
    CFTypeRef cf = 0;
    BWCMSampleBufferCreateCopyIncludingMetadata((CMSampleBufferRef)target, (CMSampleBufferRef *)&cf);
    CFTypeRef v8 = cf;
    unsigned __int8 v9 = (void *)[*(id *)(a1 + 296) objectForKeyedSubscript:v6];
    int v10 = &unk_1EFB02540;
LABEL_9:
    [v9 setObject:v8 forKeyedSubscript:v10];
    if (cf) {
      CFRelease(cf);
    }
    goto LABEL_11;
  }
  if ((v7 & 4) != 0)
  {
    CFTypeRef cf = 0;
    BWCMSampleBufferCreateCopyIncludingMetadata((CMSampleBufferRef)target, (CMSampleBufferRef *)&cf);
    CFTypeRef v8 = cf;
    unsigned __int8 v9 = (void *)[*(id *)(a1 + 296) objectForKeyedSubscript:v6];
    int v10 = &unk_1EFB02558;
    goto LABEL_9;
  }
LABEL_11:
  if (!*(unsigned char *)(a1 + 328))
  {
    char v11 = 0;
    -[BWPhotonicEngineNode _infoForCaptureType:isSupportedCaptureTypeOut:isFusionCaptureTypeOut:](a1, objc_msgSend((id)objc_msgSend(v4, "captureSettings"), "captureType"), 0, &v11);
    if (v11)
    {
      -[BWPhotonicEngineNode _attemptDisparityReferenceFrameResolutionForSettings:portType:](a1, v4, v6);
    }
    else if ((objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E4F53CA0]), "BOOLValue") & 1) == 0)
    {
      -[BWPhotonicEngineNode _emitOrEnqueueFusionReferenceFrameIfNeededForSampleBuffer:](a1, target);
    }
  }
}

- (uint64_t)_deferredCaptureHandleSensorRawSampleBuffer:(uint64_t)result
{
  cf[16] = *(CFTypeRef *)MEMORY[0x1E4F143B8];
  if (!result || !target) {
    return result;
  }
  uint64_t v3 = result;
  unint64_t v4 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  uint64_t v5 = (void *)[v4 objectForKeyedSubscript:*MEMORY[0x1E4F54128]];
  if (*(unsigned char *)(v3 + 328))
  {
    uint64_t v6 = (void *)[*(id *)(v3 + 344) objectForKeyedSubscript:v5];
    return [v6 addObject:target];
  }
  uint64_t result = *(void *)(v3 + 920);
  if (!result) {
    return result;
  }
  if ((objc_msgSend((id)objc_msgSend((id)result, "portType"), "isEqualToString:", v5) & 1) == 0
    && (objc_msgSend((id)objc_msgSend(*(id *)(v3 + 920), "captureSettings"), "captureFlags") & 0x4000000000) != 0)
  {
    unsigned __int8 v10 = BWStillImageCaptureFrameFlagsForSampleBuffer(target);
    unsigned __int8 v11 = v10;
    if (*(void *)(v3 + 936))
    {
      if ((v10 & 0x10) == 0)
      {
LABEL_19:
        if ((v11 & 4) == 0) {
          return -[BWPhotonicEngineNode _deferredCaptureAddSecondaryStereoPhotoCaptureSampleBufferIfReadyForSettings:](v3, (void *)[*(id *)(v3 + 920) stillImageSettings]);
        }
        cf[0] = 0;
        BWCMSampleBufferCreateCopyIncludingMetadata((CMSampleBufferRef)target, (CMSampleBufferRef *)cf);
        CFTypeRef v12 = cf[0];
        uint64_t v13 = *(void **)(v3 + 936);
        uint64_t v14 = &unk_1EFB024E0;
LABEL_23:
        [v13 setObject:v12 forKeyedSubscript:v14];
        if (cf[0]) {
          CFRelease(cf[0]);
        }
        return -[BWPhotonicEngineNode _deferredCaptureAddSecondaryStereoPhotoCaptureSampleBufferIfReadyForSettings:](v3, (void *)[*(id *)(v3 + 920) stillImageSettings]);
      }
    }
    else
    {
      *(void *)(v3 + 936) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      if ((v11 & 0x10) == 0) {
        goto LABEL_19;
      }
    }
    cf[0] = 0;
    BWCMSampleBufferCreateCopyIncludingMetadata((CMSampleBufferRef)target, (CMSampleBufferRef *)cf);
    CFTypeRef v12 = cf[0];
    uint64_t v13 = *(void **)(v3 + 936);
    uint64_t v14 = &unk_1EFB02510;
    goto LABEL_23;
  }
  uint64_t result = objc_msgSend(v5, "isEqualToString:", objc_msgSend(*(id *)(v3 + 920), "portType"));
  if (!result) {
    return result;
  }
  int v7 = objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E4F54148]), "intValue");
  if ((objc_msgSend((id)objc_msgSend(*(id *)(v3 + 920), "captureStreamSettings"), "captureFlags") & 0x200000000) == 0
    || v7 != 1)
  {
    goto LABEL_38;
  }
  int v8 = -[BWPhotonicEngineNodeConfiguration deepZoomVersion](*(void *)(v3 + 112));
  BOOL v24 = v8 > 0;
  if (v8 < 1) {
    goto LABEL_30;
  }
  if (BWDeepFusionEnhancedResolutionCanProcessUsingQuadraFrame(target, (char *)&v24) && dword_1EB4C5670)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (v24)
  {
    objc_msgSend((id)objc_msgSend(*(id *)(v3 + 920), "pipelineParameters"), "setGenerateInferencesForSemanticProcessingIfNeeded:", 1);
    objc_msgSend((id)objc_msgSend(*(id *)(v3 + 920), "pipelineParameters"), "setDeepZoomVersion:", -[BWPhotonicEngineNodeConfiguration deepZoomVersion](*(void *)(v3 + 112)));
    objc_msgSend((id)objc_msgSend(*(id *)(v3 + 920), "pipelineParameters"), "setDeepZoomMode:", 3);
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(v3 + 920), "captureSettings"), "metadata"), "uiZoomFactor");
    if (v15 < 1.4118
      || ![+[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance") deepZoomTransferWithZoomedImageEnabledForPortType:v5 sensorIDString:+[FigCaptureCameraParameters sensorIDStringFromMetadata:v4]])
    {
      goto LABEL_36;
    }
    CMTime v16 = (void *)[*(id *)(v3 + 920) pipelineParameters];
    uint64_t v17 = 4;
  }
  else
  {
LABEL_30:
    uint64_t v18 = [(id)-[BWPhotonicEngineNodeConfiguration sensorConfigurationsByPortType](*(void *)(v3 + 112)) objectForKeyedSubscript:v5];
    uint64_t v19 = [*(id *)(v3 + 320) objectForKeyedSubscript:v5];
    if ((objc_msgSend((id)objc_msgSend(*(id *)(v3 + 920), "captureStreamSettings"), "captureFlags") & 0x4000000000) != 0)
    {
      objc_msgSend((id)objc_msgSend(*(id *)(v3 + 920), "pipelineParameters"), "setDeepZoomVersion:", -[BWPhotonicEngineNodeConfiguration deepZoomVersion](*(void *)(v3 + 112)));
      CMTime v16 = (void *)[*(id *)(v3 + 920) pipelineParameters];
      uint64_t v17 = 5;
    }
    else
    {
      if (+[BWDeepZoomProcessorControllerConfiguration doDeepZoomStandardOrLiteForSampleBuffer:v19 type:1 sensorConfiguration:v18 intermediateZoomSrcRectOut:0 intermediateZoomDstRectOut:0])
      {
        objc_msgSend((id)objc_msgSend(*(id *)(v3 + 920), "pipelineParameters"), "setDeepZoomVersion:", -[BWPhotonicEngineNodeConfiguration deepZoomVersion](*(void *)(v3 + 112)));
        objc_msgSend((id)objc_msgSend(*(id *)(v3 + 920), "pipelineParameters"), "setDeepZoomMode:", 0);
        uint64_t v20 = 1;
        objc_msgSend((id)objc_msgSend(*(id *)(v3 + 920), "pipelineParameters"), "setGenerateInferencesForSemanticProcessingIfNeeded:", 1);
        goto LABEL_37;
      }
      objc_msgSend((id)objc_msgSend(*(id *)(v3 + 920), "pipelineParameters"), "setDeepZoomVersion:", 0);
      CMTime v16 = (void *)[*(id *)(v3 + 920) pipelineParameters];
      uint64_t v17 = 0;
    }
  }
  objc_msgSend(v16, "setDeepZoomMode:", v17, v22, v23);
LABEL_36:
  uint64_t v20 = 0;
LABEL_37:
  uint64_t result = objc_msgSend(*(id *)(v3 + 920), "canProcessEnhancedResolution:skipInferences:", v24, v20, v22, v23);
  if (v24)
  {
LABEL_38:
    uint64_t result = -[BWPhotonicEngineNode _processingNeededForSettings:portType:](v3, (void *)[*(id *)(v3 + 920) stillImageSettings], objc_msgSend((id)objc_msgSend(*(id *)(v3 + 920), "captureStreamSettings"), "portType"));
    if (result) {
      return [*(id *)(v3 + 920) addSensorRawSampleBuffer:target];
    }
    return result;
  }
  if (dword_1EB4C5670)
  {
    uint64_t v21 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

- (uint64_t)_isDeferredRawDeepFusionCapture:(uint64_t)a1
{
  if (!a1
    || objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureType") != 12
    || (objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureFlags") & 4) == 0)
  {
    return 0;
  }
  unint64_t v4 = (void *)[a2 captureSettings];
  return [v4 deliverDeferredPhotoProxyImage];
}

- (uint64_t)_isDeferredRawLearnedNRCapture:(uint64_t)a1
{
  if (!a1
    || (objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureFlags") & 0x80) == 0
    || (objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureFlags") & 4) == 0)
  {
    return 0;
  }
  unint64_t v4 = (void *)[a2 captureSettings];
  return [v4 deliverDeferredPhotoProxyImage];
}

- (void)handleNodeError:(id)a3 forInput:(id)a4
{
  if (!_FigIsNotCurrentDispatchQueue()) {
    FigDebugAssert3();
  }
  if (self->_pointCloudInput != a4)
  {
    uint64_t v11 = 0;
    CFTypeRef v12 = &v11;
    uint64_t v13 = 0x2020000000;
    char v14 = 1;
    if (self->_resourcesReleased) {
      goto LABEL_6;
    }
    processorCoordinatorWorkerQueue = self->_processorCoordinatorWorkerQueue;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __49__BWPhotonicEngineNode_handleNodeError_forInput___block_invoke;
    v10[3] = &unk_1E5C25120;
    v10[4] = a3;
    v10[5] = self;
    v10[6] = &v11;
    blocuint64_t k = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    uint64_t v17 = __ubn_dispatch_sync_block_invoke_0;
    uint64_t v18 = &unk_1E5C249F0;
    uint64_t v19 = v10;
    dispatch_sync(processorCoordinatorWorkerQueue, &block);
    if (*((unsigned char *)v12 + 24))
    {
LABEL_6:
      emitQueue = self->_emitQueue;
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __49__BWPhotonicEngineNode_handleNodeError_forInput___block_invoke_2;
      v9[3] = &unk_1E5C24458;
      v9[4] = self;
      void v9[5] = a3;
      blocuint64_t k = MEMORY[0x1E4F143A8];
      uint64_t v16 = 3221225472;
      uint64_t v17 = __ubn_dispatch_async_block_invoke_0;
      uint64_t v18 = &unk_1E5C249F0;
      uint64_t v19 = v9;
      dispatch_async(emitQueue, &block);
    }
    _Block_object_dispose(&v11, 8);
  }
}

void __49__BWPhotonicEngineNode_handleNodeError_forInput___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  int v2 = [*(id *)(a1 + 32) errorCode];
  if (v2 == -16806)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "stillImageSettings"), "requestedSettings"), "isBeginMomentCaptureSettings") ^ 1;
    uint64_t v16 = *(void *)(a1 + 40);
    if (*(unsigned char *)(v16 + 328)) {
      -[BWPhotonicEngineNode _resetProcessingState](v16);
    }
  }
  else if (v2 == -16800 || v2 == -16802)
  {
    uint64_t v4 = [*(id *)(*(void *)(a1 + 40) + 888) count];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v5 = *(void **)(*(void *)(a1 + 40) + 888);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v22 != v8) {
            objc_enumerationMutation(v5);
          }
          objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 40) + 888), "objectForKeyedSubscript:", *(void *)(*((void *)&v21 + 1) + 8 * i)), "setSkipProcessing:", 1);
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v7);
    }
    uint64_t v10 = [*(id *)(*(void *)(a1 + 40) + 904) count];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v11 = *(void **)(*(void *)(a1 + 40) + 904);
    uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v18;
      do
      {
        for (uint64_t j = 0; j != v13; ++j)
        {
          if (*(void *)v18 != v14) {
            objc_enumerationMutation(v11);
          }
          objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 40) + 904), "objectForKeyedSubscript:", *(void *)(*((void *)&v17 + 1) + 8 * j)), "setSkipProcessing:", 1);
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
      }
      while (v13);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 40) + 168), "controllerForType:", 6), "finishProcessingCurrentInputNow") ^ 1;
    if (v4 && !*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 40) + 168), "controllerForType:", 9), "finishProcessingCurrentInputNow") ^ 1;
    }
    if (v10 && !*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 40) + 168), "controllerForType:", 13), "finishProcessingCurrentInputNow") ^ 1;
    }
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    -[BWPhotonicEngineNode _resetProcessingState](*(void *)(a1 + 40));
  }
}

uint64_t __49__BWPhotonicEngineNode_handleNodeError_forInput___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) emitNodeError:*(void *)(a1 + 40)];
}

- (void)handleStillImagePrewarmWithSettings:(id)a3 forInput:(id)a4
{
  if (!self->_resourcesReleased)
  {
    if (self->_stereoDisparityProcessorControllerQueue)
    {
      uint64_t v11 = 0;
      uint64_t v12 = &v11;
      uint64_t v13 = 0x2020000000;
      char v14 = 0;
      processorCoordinatorWorkerQueue = self->_processorCoordinatorWorkerQueue;
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __69__BWPhotonicEngineNode_handleStillImagePrewarmWithSettings_forInput___block_invoke;
      v10[3] = &unk_1E5C246B8;
      v10[4] = self;
      v10[5] = &v11;
      blocuint64_t k = MEMORY[0x1E4F143A8];
      uint64_t v16 = 3221225472;
      long long v17 = __ubn_dispatch_sync_block_invoke_0;
      long long v18 = &unk_1E5C249F0;
      long long v19 = v10;
      dispatch_sync(processorCoordinatorWorkerQueue, &block);
      if (*((unsigned char *)v12 + 24))
      {
        stereoDisparityProcessorControllerQueue = self->_stereoDisparityProcessorControllerQueue;
        blocuint64_t k = MEMORY[0x1E4F143A8];
        uint64_t v16 = 3221225472;
        long long v17 = __ubn_dispatch_sync_block_invoke_0;
        long long v18 = &unk_1E5C249F0;
        long long v19 = &__block_literal_global_114;
        dispatch_sync(stereoDisparityProcessorControllerQueue, &block);
      }
      _Block_object_dispose(&v11, 8);
    }
    uint64_t v8 = self->_processorCoordinatorWorkerQueue;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __69__BWPhotonicEngineNode_handleStillImagePrewarmWithSettings_forInput___block_invoke_3;
    v9[3] = &unk_1E5C24458;
    v9[4] = self;
    void v9[5] = a3;
    blocuint64_t k = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    long long v17 = __ubn_dispatch_sync_block_invoke_0;
    long long v18 = &unk_1E5C249F0;
    long long v19 = v9;
    dispatch_sync(v8, &block);
  }
}

uint64_t __69__BWPhotonicEngineNode_handleStillImagePrewarmWithSettings_forInput___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 160), "captureSettings"), "captureFlags");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (result & 0x800) != 0;
  return result;
}

__n128 __69__BWPhotonicEngineNode_handleStillImagePrewarmWithSettings_forInput___block_invoke_3(uint64_t a1)
{
  block[16] = *MEMORY[0x1E4F143B8];
  if ((objc_msgSend(*(id *)(*(void *)(a1 + 32) + 136), "isEqualToString:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "requestedSettings"), "captureRequestIdentifier")) & 1) == 0)
  {
    int v3 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "requestedSettings"), "isBeginMomentCaptureSettings");
    if (v3)
    {
      uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 152);
      if (v4)
      {
        if ((objc_msgSend(v4, "isEqualToString:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "requestedSettings"), "captureRequestIdentifier")) & 1) == 0)
        {
          int v19 = 0;
          os_log_type_t type = OS_LOG_TYPE_DEFAULT;
          os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
          -[BWPhotonicEngineNode _resetProcessingState](*(void *)(a1 + 32));
        }
      }
    }
    uint64_t v6 = *(void *)(a1 + 32);
    if (*(void *)(v6 + 152) && (!*(unsigned char *)(v6 + 328) ? (char v7 = 1) : (char v7 = v3), (v7 & 1) != 0))
    {
      int v8 = 0;
    }
    else
    {
      if ((objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "captureSettings", v13, v14), "captureFlags") & 0x200) != 0)
      {
        os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 864));
        *(unsigned char *)(*(void *)(a1 + 32) + 868) = 0;
        os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 864));
      }
      unint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = *(void **)(a1 + 40);
      if (v3) {
        int v8 = -[BWPhotonicEngineNode _setupProcessingStateIfNeededWithBeginMomentSettings:](v9, v10);
      }
      else {
        int v8 = -[BWPhotonicEngineNode _setupProcessingStateWithSettings:](v9, v10);
      }
      if (v8 == -16808)
      {
        -[BWPhotonicEngineNode _resetProcessingState](*(void *)(a1 + 32));
        int v8 = -16808;
      }
    }
    if ((v3 & 1) == 0)
    {
      long long v11 = *(_OWORD *)(a1 + 32);
      uint64_t v12 = *(NSObject **)(*(void *)(a1 + 32) + 208);
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __69__BWPhotonicEngineNode_handleStillImagePrewarmWithSettings_forInput___block_invoke_115;
      v15[3] = &unk_1E5C26F78;
      int v17 = v8;
      long long v16 = v11;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __ubn_dispatch_async_block_invoke_0;
      block[3] = &unk_1E5C249F0;
      block[4] = v15;
      dispatch_async(v12, block);
    }
  }
  return result;
}

- (uint64_t)_setupProcessingStateIfNeededWithBeginMomentSettings:(uint64_t)a1
{
  block[16] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (!_FigIsCurrentDispatchQueue()) {
      FigDebugAssert3();
    }
    if (!*(void *)(a1 + 168)
      || (objc_msgSend((id)objc_msgSend(a2, "requestedSettings"), "isBeginMomentCaptureSettings") & 1) == 0
      || (objc_msgSend((id)a1, "processingOnBeginMomentSupportedForCaptureSettings:", objc_msgSend(a2, "captureSettings")) & 1) == 0)
    {
      int v24 = 0;
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      return 4294950488;
    }
    if ((objc_msgSend(*(id *)(a1 + 152), "isEqualToString:", objc_msgSend((id)objc_msgSend(a2, "requestedSettings"), "captureRequestIdentifier")) & 1) == 0)
    {
      if (dword_1EB4C5670)
      {
        int v24 = 0;
        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
        uint64_t v4 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      -[BWPhotonicEngineNode _resetProcessingState](a1);
      *(void *)(a1 + 144) = [a2 settingsID];
      *(void *)(a1 + 152) = (id)objc_msgSend((id)objc_msgSend(a2, "requestedSettings"), "captureRequestIdentifier");
      *(unsigned char *)(a1 + 328) = 1;
      -[BWPhotonicEngineNode _releaseResourcesWithSettings:](a1, a2);
      uint64_t v5 = (void *)-[BWPhotonicEngineNode _requiredResolutionFlavorsForSharedExternalMemoryResourceWithSettings:](a1, a2);
      -[BWPhotonicEngineNode _prepareSharedExternalMemoryResourceForProcessorControllersIfNeededForResolutionFlavors:](a1, v5);
      BOOL v6 = BWDeviceSupportsDeferredPhotoProcessorPrewarming();
      if ([*(id *)(a1 + 112) deferredPhotoProcessorEnabled] && v6)
      {
        char v7 = *(NSObject **)(a1 + 192);
        int v8 = *(NSObject **)(a1 + 184);
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __77__BWPhotonicEngineNode__setupProcessingStateIfNeededWithBeginMomentSettings___block_invoke;
        v22[3] = &unk_1E5C24430;
        v22[4] = a1;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __ubn_dispatch_group_async_block_invoke_0;
        block[3] = &unk_1E5C249F0;
        block[4] = v22;
        dispatch_group_async(v7, v8, block);
      }
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v9 = -[BWPhotonicEngineNode _processingOrderByPortTypeForSettings:]((id)a1, a2);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v25 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v19;
        while (2)
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v19 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = -[BWPhotonicEngineNode _setupSoftISPProcessingStateIfNeededWithSettings:portType:](a1, a2, *(void **)(*((void *)&v18 + 1) + 8 * i));
            if (v14)
            {
              uint64_t v15 = v14;
              FigDebugAssert3();
              return v15;
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v25 count:16];
          if (v11) {
            continue;
          }
          break;
        }
      }
    }
  }
  return 0;
}

void __69__BWPhotonicEngineNode_handleStillImagePrewarmWithSettings_forInput___block_invoke_115(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 48) == -16808)
  {
    id v4 = +[BWNodeError newError:4294950488 sourceNode:*(void *)(a1 + 32) stillImageSettings:*(void *)(a1 + 40) metadata:0];
    [*(id *)(*(void *)(a1 + 32) + 16) emitNodeError:v4];
  }
  else
  {
    uint64_t v2 = *(void *)(a1 + 40);
    int v3 = *(void **)(*(void *)(a1 + 32) + 16);
    [v3 emitStillImagePrewarmMessageWithSettings:v2];
  }
}

- (__CVBuffer)processorController:(id)a3 newOutputPixelBufferForProcessorInput:(id)a4 type:(unint64_t)a5
{
  if (self) {
    return (__CVBuffer *)[(__CVBuffer *)self processorController:a3 newOutputPixelBufferForProcessorInput:a4 type:a5 attachedMediaKey:0 pixelFormat:0 dimensions:0];
  }
  return self;
}

- (__CVBuffer)processorController:(id)a3 newOutputPixelBufferForProcessorInput:(id)a4 type:(unint64_t)a5 dimensions:(id)a6
{
  if (self) {
    return (__CVBuffer *)[(__CVBuffer *)self processorController:a3 newOutputPixelBufferForProcessorInput:a4 type:a5 attachedMediaKey:0 pixelFormat:0 dimensions:a6];
  }
  return self;
}

- (__CVBuffer)processorController:(id)a3 newOutputPixelBufferForProcessorInput:(id)a4 type:(unint64_t)a5 attachedMediaKey:(id)a6
{
  if (self) {
    return (__CVBuffer *)[(__CVBuffer *)self processorController:a3 newOutputPixelBufferForProcessorInput:a4 type:a5 attachedMediaKey:a6 pixelFormat:0 dimensions:0];
  }
  return self;
}

- (__CVBuffer)processorController:(id)a3 newOutputPixelBufferForProcessorInput:(id)a4 type:(unint64_t)a5 attachedMediaKey:(id)a6 pixelFormat:(unsigned int)a7 dimensions:(id)a8
{
  uint64_t v9 = *(void *)&a7;
  -[BWPhotonicEngineNode _resolvedQSubResolutionFlavorForCaptureSettings:portType:]((uint64_t)self, (void *)[a4 captureSettings], objc_msgSend(a4, "portType"));
  if (dword_1EB4C5670)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    uint64_t v9 = v9;
  }
  if (a5 == 28) {
    long long v16 = +[BWOnDemandPixelBufferAllocator onDemandAllocatorWithDimensions:a8 pixelFormat:v9 name:BWStillImageBufferTypeToShortString(28) memoryPool:[(BWNodeOutput *)self->super._output memoryPool]];
  }
  else {
    long long v16 = -[BWPhotonicEngineNode _pixelBufferProviderForProcessorController:processorInput:type:dimensions:attachedMediaKey:]((char *)self, a3, a4, a5, *(void *)&a8, (__CFString *)a6);
  }
  return -[BWPhotonicEngineNode _newOutputPixelBufferForProcessorController:processorInput:type:pixelBufferProvider:]((uint64_t)self, (uint64_t)a3, (uint64_t)a4, a5, v16);
}

- (uint64_t)_resolvedQSubResolutionFlavorForCaptureSettings:(void *)a3 portType:
{
  if (!a1) {
    return 0;
  }
  BOOL v6 = objc_msgSend(a2, "captureStreamSettingsForPortType:");
  uint64_t v7 = [v6 qsubResolutionFlavor];
  int v8 = objc_msgSend((id)objc_msgSend((id)-[BWPhotonicEngineNodeConfiguration dimensionsByQSubResolutionFlavorByPortType](*(void *)(a1 + 112)), "objectForKeyedSubscript:", a3), "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", v7));
  unint64_t v9 = FigCaptureDimensionsFromDictionaryRepresentation(v8);
  if ((int)v9 <= (int)-[BWPhotonicEngineNodeConfiguration rawSensorDimensions](*(void *)(a1 + 112)))
  {
    unint64_t v11 = (unint64_t)-[BWPhotonicEngineNodeConfiguration rawSensorDimensions](*(void *)(a1 + 112)) >> 32;
    BOOL v10 = v7 == 1;
    if (SHIDWORD(v9) <= (int)v11)
    {
      int v12 = 0;
      goto LABEL_7;
    }
  }
  else
  {
    BOOL v10 = v7 == 1;
  }
  int v12 = 1;
LABEL_7:
  if (v10) {
    LODWORD(v7) = v12;
  }
  if (([a2 captureFlags] & 4) != 0) {
    uint64_t v7 = v7;
  }
  else {
    uint64_t v7 = 0;
  }
  if ([a2 learnedNRStereoPhotoFrameFlag]
    && (objc_msgSend(a3, "isEqualToString:", objc_msgSend(a2, "masterPortType")) & 1) == 0)
  {
    if ((int)[v6 expectedUltraHighResFrameCaptureCount] <= 0) {
      return v7;
    }
    else {
      return 2;
    }
  }
  return v7;
}

- (char)_pixelBufferProviderForProcessorController:(void *)a3 processorInput:(uint64_t)a4 type:(uint64_t)a5 dimensions:(__CFString *)a6 attachedMediaKey:
{
  if (!result) {
    return result;
  }
  unint64_t v11 = result;
  uint64_t v12 = -[BWPhotonicEngineNode _resolvedQSubResolutionFlavorForCaptureSettings:portType:]((uint64_t)result, (void *)[a3 captureSettings], objc_msgSend(a3, "portType"));
  uint64_t v13 = [a2 type];
  __n128 result = 0;
  switch(v13)
  {
    case 2:
      if ([a3 onlyApplyingSemanticStyle])
      {
        long long v21 = (void *)*((void *)v11 + 59);
        if (!v21
          || !FigCaptureVideoDimensionsAreEqual(a5, [v21 width] | ((unint64_t)objc_msgSend(*((id *)v11 + 59), "height") << 32)))
        {
          goto LABEL_85;
        }
        uint64_t v22 = 472;
LABEL_20:
        __n128 result = *(char **)&v11[v22];
        if (!result)
        {
LABEL_85:
          __n128 result = (char *)*((void *)v11 + 32);
          if (!result) {
            goto LABEL_86;
          }
        }
      }
      else
      {
        __n128 result = 0;
        if (a4 <= 29)
        {
          switch(a4)
          {
            case 13:
              if (v12) {
                goto LABEL_25;
              }
              if ((objc_msgSend((id)objc_msgSend(a3, "captureSettings"), "captureFlags") & 0x200000000) == 0) {
                goto LABEL_85;
              }
              uint64_t v22 = 456;
              goto LABEL_20;
            case 15:
              goto LABEL_72;
            case 19:
              if ((objc_msgSend((id)objc_msgSend(a3, "captureSettings"), "captureFlags") & 0x200000000) != 0)
              {
                __n128 result = (char *)*((void *)v11 + 58);
                if (result) {
                  return result;
                }
              }
              if (v12 != 1) {
                goto LABEL_123;
              }
              long long v23 = objc_msgSend(*((id *)v11 + 38), "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", 1));
              int v24 = &unk_1EFB02468;
              break;
            case 21:
              if (!v12) {
                goto LABEL_103;
              }
              goto LABEL_104;
            default:
              return result;
          }
          goto LABEL_82;
        }
        switch(a4)
        {
          case 30:
            uint64_t v16 = 720;
            return *(char **)&v11[v16];
          case 36:
LABEL_72:
            if (v12 == 1)
            {
              uint64_t v18 = *((void *)v11 + 66);
              uint64_t v52 = [NSNumber numberWithInt:1];
              goto LABEL_81;
            }
            uint64_t v16 = 520;
            return *(char **)&v11[v16];
          case 41:
            goto LABEL_64;
        }
      }
      return result;
    case 3:
      long long v23 = (void *)*((void *)v11 + 67);
      int v24 = a6;
      goto LABEL_82;
    case 6:
      __n128 result = 0;
      switch(a4)
      {
        case 1:
        case 2:
        case 3:
        case 4:
        case 5:
        case 6:
        case 14:
        case 33:
        case 35:
        case 38:
          if (!v12) {
            goto LABEL_85;
          }
LABEL_25:
          id v25 = (void *)[*((id *)v11 + 2) format];
          uint64_t v18 = objc_msgSend(*((id *)v11 + 38), "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", v12));
          long long v19 = NSNumber;
          uint64_t v20 = [v25 pixelFormat];
          goto LABEL_26;
        case 7:
        case 29:
          if (v12 != 1) {
            goto LABEL_85;
          }
          v37 = (void *)[*((id *)v11 + 2) format];
          unint64_t v38 = (void *)*((void *)v11 + 38);
          uint64_t v39 = NSNumber;
          uint64_t v40 = 1;
          goto LABEL_78;
        case 8:
        case 10:
          uint64_t v16 = 440;
          return *(char **)&v11[v16];
        case 9:
        case 11:
        case 12:
          uint64_t v16 = 448;
          return *(char **)&v11[v16];
        case 15:
          goto LABEL_72;
        case 19:
          if (v12 == 1
            || v12 == 2
            && -[BWPhotonicEngineNodeConfiguration ultraHighResolutionProcessingEnabled](*((void *)v11 + 14)))
          {
            uint64_t v54 = (void *)*((void *)v11 + 38);
            uint64_t v35 = (void *)[NSNumber numberWithInt:v12];
            uint64_t v34 = v54;
            goto LABEL_99;
          }
          if ((objc_msgSend((id)objc_msgSend(a3, "captureSettings"), "captureFlags") & 0x200000000) == 0) {
            goto LABEL_123;
          }
          __n128 result = (char *)*((void *)v11 + 58);
          if (!result) {
            goto LABEL_123;
          }
          return result;
        case 21:
          if (((v12 == 2) & ~objc_msgSend((id)objc_msgSend(a3, "captureSettings"), "deliverDeferredPhotoProxyImage")) == 0&& v12 != 1)
          {
            goto LABEL_103;
          }
LABEL_104:
          uint64_t v41 = objc_msgSend(*((id *)v11 + 38), "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", v12));
          uint64_t v42 = NSNumber;
          goto LABEL_105;
        case 31:
          if (v12 == 1
            || v12 == 2
            && -[BWPhotonicEngineNodeConfiguration ultraHighResolutionProcessingEnabled](*((void *)v11 + 14)))
          {
            uint64_t v41 = objc_msgSend(*((id *)v11 + 38), "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", v12));
            uint64_t v56 = NSNumber;
            uint64_t v57 = 392;
            goto LABEL_114;
          }
          uint64_t v16 = 392;
          return *(char **)&v11[v16];
        case 32:
          if (v12 != 1
            && (v12 != 2
             || !-[BWPhotonicEngineNodeConfiguration ultraHighResolutionProcessingEnabled](*((void *)v11 + 14))))
          {
            uint64_t v16 = 400;
            return *(char **)&v11[v16];
          }
          uint64_t v41 = objc_msgSend(*((id *)v11 + 38), "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", v12));
          uint64_t v56 = NSNumber;
          uint64_t v57 = 400;
LABEL_114:
          uint64_t v55 = [*(id *)&v11[v57] pixelFormat];
          uint64_t v42 = v56;
          break;
        case 39:
          unsigned int v58 = objc_msgSend((id)objc_msgSend(*((id *)v11 + 1), "videoFormat"), "width");
          unsigned int v59 = objc_msgSend((id)objc_msgSend(*((id *)v11 + 1), "videoFormat"), "height");
          uint64_t v48 = BWStillImageBufferTypeToShortString(39);
          uint64_t v49 = [*((id *)v11 + 2) memoryPool];
          unint64_t v50 = v58 | ((unint64_t)v59 << 32);
          uint64_t v51 = 875704422;
          goto LABEL_65;
        case 41:
          goto LABEL_64;
        default:
          return result;
      }
      goto LABEL_115;
    case 7:
    case 18:
      __n128 result = 0;
      if (a4 <= 20)
      {
        if (a4 != 1)
        {
          if (a4 == 16)
          {
            uint64_t v14 = (void *)*((void *)v11 + 2);
            uint64_t v15 = a6;
          }
          else
          {
            if (a4 != 19) {
              return result;
            }
            if (v12 == 2
              && -[BWPhotonicEngineNodeConfiguration ultraHighResolutionProcessingEnabled](*((void *)v11 + 14)))
            {
              uint64_t v34 = (void *)*((void *)v11 + 38);
              uint64_t v35 = &unk_1EFB024E0;
LABEL_99:
              __n128 result = (char *)objc_msgSend((id)objc_msgSend(v34, "objectForKeyedSubscript:", v35), "objectForKeyedSubscript:", &unk_1EFB02468);
              if (result) {
                return result;
              }
            }
LABEL_123:
            uint64_t v14 = (void *)*((void *)v11 + 2);
            uint64_t v15 = @"GainMap";
          }
          goto LABEL_124;
        }
        if (v12 != 2
          || !-[BWPhotonicEngineNodeConfiguration ultraHighResolutionProcessingEnabled](*((void *)v11 + 14)))
        {
LABEL_86:
          int v53 = (void *)[*((id *)v11 + 2) primaryMediaProperties];
LABEL_125:
          return (char *)[v53 livePixelBufferPool];
        }
        v37 = (void *)[*((id *)v11 + 2) format];
        unint64_t v38 = (void *)*((void *)v11 + 38);
        uint64_t v39 = NSNumber;
        uint64_t v40 = 2;
LABEL_78:
        uint64_t v18 = objc_msgSend(v38, "objectForKeyedSubscript:", objc_msgSend(v39, "numberWithInt:", v40));
        int v17 = NSNumber;
        uint64_t v36 = [v37 pixelFormat];
LABEL_79:
        uint64_t v26 = v36;
        uint64_t v27 = v17;
LABEL_80:
        uint64_t v52 = [v27 numberWithUnsignedInt:v26];
LABEL_81:
        int v24 = (void *)v52;
        long long v23 = (void *)v18;
LABEL_82:
        return (char *)[v23 objectForKeyedSubscript:v24];
      }
      if (a4 > 40)
      {
        if (a4 == 41)
        {
LABEL_64:
          $2825F4736939C4A6D3AD43837233062D v46 = +[BWSmartStyleRenderingProcessorController linearYUVIntermediateThumbnailDimensionsForStills];
          uint64_t v47 = [*((id *)v11 + 103) linearYUVPixelFormat];
          uint64_t v48 = BWStillImageBufferTypeToShortString(41);
          uint64_t v49 = [*((id *)v11 + 2) memoryPool];
          unint64_t v50 = (unint64_t)v46;
          uint64_t v51 = v47;
LABEL_65:
          return (char *)+[BWOnDemandPixelBufferAllocator onDemandAllocatorWithDimensions:v50 pixelFormat:v51 name:v48 memoryPool:v49];
        }
        if (a4 != 2002) {
          return result;
        }
LABEL_43:
        uint64_t v14 = (void *)*((void *)v11 + 2);
        uint64_t v15 = @"ConstantColorConfidenceMap";
        goto LABEL_124;
      }
      if (a4 == 21)
      {
        if (v12 == 2
          && -[BWPhotonicEngineNodeConfiguration ultraHighResolutionProcessingEnabled](*((void *)v11 + 14)))
        {
          uint64_t v41 = objc_msgSend(*((id *)v11 + 38), "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", 2));
          uint64_t v42 = NSNumber;
LABEL_105:
          uint64_t v55 = *((unsigned int *)v11 + 250);
LABEL_115:
          int v24 = (void *)[v42 numberWithUnsignedInt:v55];
          long long v23 = (void *)v41;
          goto LABEL_82;
        }
LABEL_103:
        uint64_t v14 = (void *)*((void *)v11 + 2);
        uint64_t v15 = @"DemosaicedRaw";
LABEL_124:
        int v53 = (void *)[v14 mediaPropertiesForAttachedMediaKey:v15];
        goto LABEL_125;
      }
      if (a4 != 38) {
        return result;
      }
      uint64_t v16 = 976;
      return *(char **)&v11[v16];
    case 8:
    case 9:
    case 13:
      if (a4 != 2001) {
        return 0;
      }
      uint64_t v14 = (void *)*((void *)v11 + 2);
      uint64_t v15 = @"Depth";
      goto LABEL_124;
    case 10:
      goto LABEL_86;
    case 12:
      if (a4 != 1) {
        return 0;
      }
      uint64_t v28 = [a2 outputPixelFormatForInput:a3];
      if (v12 == 1)
      {
        uint64_t v29 = 1;
      }
      else
      {
        double v43 = objc_msgSend((id)objc_msgSend((id)-[BWPhotonicEngineNodeConfiguration dimensionsByQSubResolutionFlavorByPortType](*((void *)v11 + 14)), "objectForKeyedSubscript:", objc_msgSend(a3, "portType")), "objectForKeyedSubscript:", &unk_1EFB024E0);
        unint64_t v44 = FigCaptureDimensionsFromDictionaryRepresentation(v43);
        unint64_t v45 = FigCaptureDimensionsFromDictionaryRepresentation(objc_msgSend((id)objc_msgSend(*((id *)v11 + 33), "outputDimensionsByQSubResolutionFlavor"), "objectForKeyedSubscript:", &unk_1EFB024E0));
        if (!FigCaptureVideoDimensionsAreValid(v44) || !FigCaptureVideoDimensionsAreEqual(a5, v45))
        {
          uint64_t v18 = *((void *)v11 + 34);
          uint64_t v27 = NSNumber;
LABEL_69:
          uint64_t v26 = v28;
          goto LABEL_80;
        }
        uint64_t v29 = 2;
      }
      uint64_t v18 = objc_msgSend(*((id *)v11 + 38), "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", v29));
      uint64_t v27 = NSNumber;
      goto LABEL_69;
    case 15:
      if (a4 != 1) {
        return 0;
      }
      int v17 = NSNumber;
      if (v12 != 1)
      {
        uint64_t v18 = *((void *)v11 + 34);
        uint64_t v36 = [a2 outputPixelFormat];
        goto LABEL_79;
      }
      uint64_t v18 = objc_msgSend(*((id *)v11 + 38), "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", 1));
      long long v19 = NSNumber;
      uint64_t v20 = [a2 outputPixelFormat];
LABEL_26:
      uint64_t v26 = v20;
      uint64_t v27 = v19;
      goto LABEL_80;
    case 16:
      if (a4 == 19) {
        goto LABEL_123;
      }
      if (a4 != 1) {
        return 0;
      }
      unsigned int v30 = [*((id *)v11 + 105) width];
      unsigned int v31 = [*((id *)v11 + 105) height];
      unsigned int v32 = [*((id *)v11 + 106) width];
      unsigned int v33 = [*((id *)v11 + 106) height];
      if (FigCaptureVideoDimensionsAreEqual(a5, v30 | ((unint64_t)v31 << 32)))
      {
        uint64_t v16 = 840;
        return *(char **)&v11[v16];
      }
      if (!FigCaptureVideoDimensionsAreEqual(a5, v32 | ((unint64_t)v33 << 32))) {
        goto LABEL_86;
      }
      uint64_t v16 = 848;
      return *(char **)&v11[v16];
    case 17:
      if (a4 == 2002) {
        goto LABEL_43;
      }
      if (a4 == 1) {
        goto LABEL_86;
      }
      return 0;
    default:
      return result;
  }
}

- (__CVBuffer)_newOutputPixelBufferForProcessorController:(uint64_t)a3 processorInput:(uint64_t)a4 type:(void *)a5 pixelBufferProvider:
{
  if (!a1) {
    return 0;
  }
  mach_absolute_time();
  if (a5)
  {
    uint64_t v7 = (__CVBuffer *)[a5 newPixelBuffer];
    int v8 = v7;
    if (a4 == 41 && v7)
    {
      CVBufferSetAttachment(v7, (CFStringRef)*MEMORY[0x1E4F24C18], (CFTypeRef)*MEMORY[0x1E4F24C40], kCVAttachmentMode_ShouldPropagate);
      CVBufferSetAttachment(v8, (CFStringRef)*MEMORY[0x1E4F24A90], (CFTypeRef)*MEMORY[0x1E4F24AC0], kCVAttachmentMode_ShouldPropagate);
      CVBufferSetAttachment(v8, (CFStringRef)*MEMORY[0x1E4F24BC8], (CFTypeRef)*MEMORY[0x1E4F24BE8], kCVAttachmentMode_ShouldPropagate);
    }
  }
  else
  {
    int v8 = 0;
  }
  mach_absolute_time();
  FigHostTimeToNanoseconds();
  if (dword_1EB4C5670)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v8;
}

- ($2825F4736939C4A6D3AD43837233062D)processorController:(id)a3 outputPixelBufferDimensionsForProcessorInput:(id)a4 type:(unint64_t)a5 attachedMediaKey:(id)a6
{
  BOOL v6 = -[BWPhotonicEngineNode _pixelBufferProviderForProcessorController:processorInput:type:dimensions:attachedMediaKey:]((char *)self, a3, a4, a5, 0, (__CFString *)a6);
  unsigned int v7 = [v6 width];
  return ($2825F4736939C4A6D3AD43837233062D)(v7 | ((unint64_t)[v6 height] << 32));
}

- (void)_attemptPiecemealEncodingForGainMapSbuf:(uint64_t)a3 primaryImageMetadata:(uint64_t)a4 processingFlags:(void *)a5 portType:
{
  if (a1
    && a2
    && a3
    && objc_msgSend(a5, "isEqualToString:", objc_msgSend((id)objc_msgSend(a1[20], "captureSettings"), "masterPortType"))&& a1[127]&& (int)objc_msgSend((id)objc_msgSend(a1[84], "objectForKeyedSubscript:", a5), "intValue") <= 0)
  {
    CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E4F53070], 0);
    double FinalCropRect = FigCaptureMetadataUtilitiesGetFinalCropRect();
    BOOL v13 = v12 > 0.0;
    if (v14 < 1.0) {
      BOOL v13 = 1;
    }
    BOOL v15 = v11 >= 1.0 && FinalCropRect <= 0.0;
    if (v15 || !v13)
    {
      uint64_t v16 = objc_msgSend(a1[127], "inputForStillImageSettings:portType:portraitAdjustedImage:optionalSampleBuffer:forEarlyEncoding:", a1[20], a5, 0, 0, 1, FinalCropRect);
      if (v16)
      {
        [v16 addAuxSbuf:a2 attachedMediakey:0x1EFA4EB60 primaryImageMetadata:a3 processingFlags:a4];
      }
    }
  }
}

- (id)_attemptPiecemealEncodingOfAuxImagesForSmartStylesCaptureWithSampleBuffer:(void *)a3 portType:
{
  v46[2] = *MEMORY[0x1E4F143B8];
  uint64_t v18 = result;
  if (result)
  {
    if (a2)
    {
      __n128 result = (id *)objc_msgSend(a3, "isEqualToString:", objc_msgSend((id)objc_msgSend(result[20], "captureSettings"), "masterPortType"));
      if (result)
      {
        if (v18[127])
        {
          CFStringRef key = (const __CFString *)*MEMORY[0x1E4F53070];
          __n128 result = (id *)CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E4F53070], 0);
          long long v21 = result;
          if (result)
          {
            id v4 = (void *)[MEMORY[0x1E4F1CA48] array];
            [v4 addObject:0x1EFA74740];
            [v4 addObjectsFromArray:BWSemanticSegmentationMatteAttachedMediaKeysSupportedByDemosaicedRaw()];
            if ((objc_msgSend((id)objc_msgSend(v18[20], "requestedSettings"), "portraitEffectsMatteDeliveryEnabled") & 1) != 0
              || objc_msgSend((id)objc_msgSend((id)objc_msgSend(v18[20], "requestedSettings"), "enabledSemanticSegmentationMatteURNs"), "count"))
            {
              v46[0] = @"PersonSemanticsSkin";
              v46[1] = 0x1EFA74420;
              objc_msgSend(v4, "removeObjectsInArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v46, 2));
            }
            __n128 result = (id *)[v4 count];
            if (result)
            {
              uint64_t v5 = (void *)CMGetAttachment(a2, @"AttachedMedia", 0);
              __n128 result = (id *)[v18[127] inputForStillImageSettings:v18[20] portType:a3 portraitAdjustedImage:0 optionalSampleBuffer:0 forEarlyEncoding:1];
              uint64_t v22 = result;
              if (result)
              {
                unsigned int v19 = BWStillImageProcessingFlagsForSampleBuffer(a2);
                uint64_t v20 = (void *)[MEMORY[0x1E4F1CA48] array];
                long long v42 = 0u;
                long long v43 = 0u;
                long long v40 = 0u;
                long long v41 = 0u;
                __n128 result = (id *)[v4 countByEnumeratingWithState:&v40 objects:v45 count:16];
                BOOL v6 = result;
                if (result)
                {
                  uint64_t v7 = *(void *)v41;
                  do
                  {
                    int v8 = 0;
                    do
                    {
                      if (*(void *)v41 != v7) {
                        objc_enumerationMutation(v4);
                      }
                      uint64_t v9 = *(void *)(*((void *)&v40 + 1) + 8 * (void)v8);
                      uint64_t v36 = 0;
                      v37 = &v36;
                      uint64_t v38 = 0x2020000000;
                      uint64_t v39 = 0;
                      uint64_t v39 = [v5 objectForKeyedSubscript:v9];
                      uint64_t v30 = 0;
                      unsigned int v31 = &v30;
                      uint64_t v32 = 0x3052000000;
                      unsigned int v33 = __Block_byref_object_copy__42;
                      uint64_t v34 = __Block_byref_object_dispose__42;
                      uint64_t v35 = 0;
                      uint64_t v26 = 0;
                      uint64_t v27 = &v26;
                      uint64_t v28 = 0x2020000000;
                      char v29 = 0;
                      BOOL v10 = (const void *)v37[3];
                      if (v10)
                      {
                        CFTypeRef v11 = CMGetAttachment(v10, key, 0);
                        v31[5] = (uint64_t)v11;
                      }
                      else
                      {
                        v25[0] = 0;
                        v25[1] = v25;
                        v25[2] = 0x3052000000;
                        v25[3] = __Block_byref_object_copy__42;
                        v25[4] = __Block_byref_object_dispose__42;
                        v25[5] = 0;
                        double v12 = v18[63];
                        v24[0] = MEMORY[0x1E4F143A8];
                        v24[1] = 3221225472;
                        v24[2] = __107__BWPhotonicEngineNode__attemptPiecemealEncodingOfAuxImagesForSmartStylesCaptureWithSampleBuffer_portType___block_invoke;
                        v24[3] = &unk_1E5C2D718;
                        v24[4] = v18;
                        v24[5] = v9;
                        v24[9] = v25;
                        v24[10] = a2;
                        v24[6] = &v36;
                        v24[7] = &v26;
                        v24[8] = &v30;
                        block[0] = MEMORY[0x1E4F143A8];
                        block[1] = 3221225472;
                        block[2] = __ubn_dispatch_sync_block_invoke_0;
                        block[3] = &unk_1E5C249F0;
                        block[4] = v24;
                        dispatch_sync(v12, block);
                        _Block_object_dispose(v25, 8);
                      }
                      if (v37[3])
                      {
                        if (FigCaptureMetadataUtilitiesGetFinalCropRect() <= 0.0 && v14 >= 1.0
                          || v13 <= 0.0 && v15 >= 1.0)
                        {
                          [v20 addObject:v9];
                          [v22 addAuxSbuf:v37[3] attachedMediakey:v9 primaryImageMetadata:v21 processingFlags:v19];
                        }
                        if (*((unsigned char *)v27 + 24))
                        {
                          uint64_t v16 = (const void *)v37[3];
                          if (v16) {
                            CFRelease(v16);
                          }
                        }
                      }
                      _Block_object_dispose(&v26, 8);
                      _Block_object_dispose(&v30, 8);
                      _Block_object_dispose(&v36, 8);
                      int v8 = (id *)((char *)v8 + 1);
                    }
                    while (v6 != v8);
                    __n128 result = (id *)[v4 countByEnumeratingWithState:&v40 objects:v45 count:16];
                    BOOL v6 = result;
                  }
                  while (result);
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

void __107__BWPhotonicEngineNode__attemptPiecemealEncodingOfAuxImagesForSmartStylesCaptureWithSampleBuffer_portType___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 544) inferenceBufferForAttachedMediaKey:*(void *)(a1 + 40)];
  if (v2)
  {
    int v3 = (__CVBuffer *)v2;
    CFTypeRef cf = 0;
    CMSampleBufferGetPresentationTimeStamp(&v9, *(CMSampleBufferRef *)(a1 + 80));
    int v4 = BWSampleBufferCreateFromPixelBuffer(v3, (uint64_t)&v9, &cf, (CMSampleBufferRef *)(*(void *)(*(void *)(a1 + 48) + 8) + 24));
    if (cf)
    {
      CFRelease(cf);
      CFTypeRef cf = 0;
    }
    if (!v4)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
      *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 544) metadataForAttachedMediaKey:*(void *)(a1 + 40)];
      uint64_t v5 = *(const void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      if (v5) {
        CMSetAttachment(*(CMAttachmentBearerRef *)(*(void *)(*(void *)(a1 + 48) + 8) + 24), (CFStringRef)*MEMORY[0x1E4F53070], v5, 1u);
      }
      uint64_t v6 = BWMetadataAttachmentKeyForAttachedMediaKey(*(void **)(a1 + 40));
      if (v6)
      {
        CFStringRef v7 = (const __CFString *)v6;
        *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 544), "inferenceAttachedMediaMetadata"), "objectForKeyedSubscript:", *(void *)(a1 + 40));
        int v8 = *(const void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
        if (v8) {
          CMSetAttachment(*(CMAttachmentBearerRef *)(*(void *)(*(void *)(a1 + 48) + 8) + 24), v7, v8, 1u);
        }
      }
    }
  }
}

- (void)processorController:(id)a3 didFinishProcessingSampleBuffer:(opaqueCMSampleBuffer *)a4 type:(unint64_t)a5 processorInput:(id)a6 err:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  unint64_t v9 = a5;
  uint64_t v131 = *MEMORY[0x1E4F143B8];
  if (!a4 && !a7)
  {
    unsigned int v117 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    uint64_t v7 = 4294954516;
    unint64_t v9 = a5;
  }
  BWPixelBufferDimensionsFromSampleBuffer(a4);
  unint64_t v91 = (unint64_t)BWStillImageCaptureFrameFlagsForSampleBuffer(a4);
  if (a4)
  {
    CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(a4);
    CVPixelBufferGetPixelFormatType(ImageBuffer);
  }
  id v94 = a6;
  obuint64_t j = (id)v7;
  long long v97 = self;
  if (dword_1EB4C5670)
  {
    unsigned int v117 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    double v15 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(a6, "settings", v79, v82), "captureRequestIdentifier"), "isEqualToString:", self->_currentCaptureRequestIdentifier);
  if (!v7
    && -[BWStillImageNodeConfiguration deferredPhotoProcessorEnabled](self->_nodeConfiguration, "deferredPhotoProcessorEnabled")&& ([a3 type] == 2 || objc_msgSend(a3, "type") == 6))
  {
    uint64_t v16 = (const void *)objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend((id)CMGetAttachment(a4, @"StillImageProcessingFlags", 0), "unsignedIntValue") | 0x2000);
    CMSetAttachment(a4, @"StillImageProcessingFlags", v16, 1u);
    AttachedMedia = (const void *)BWSampleBufferGetAttachedMedia(a4, 0x1EFA745E0);
    if (AttachedMedia)
    {
      uint64_t v18 = AttachedMedia;
      unsigned int v19 = (const void *)objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend((id)CMGetAttachment(AttachedMedia, @"StillImageProcessingFlags", 0), "unsignedIntValue") | 0x2000);
      CMSetAttachment(v18, @"StillImageProcessingFlags", v19, 1u);
    }
  }
  switch([a3 type])
  {
    case 2:
      if (!_FigIsCurrentDispatchQueue())
      {
        uint64_t v83 = v89;
        LODWORD(v80) = 0;
        FigDebugAssert3();
      }
      if (!v7
        && -[BWPhotonicEngineNodeConfiguration deepFusionSupportEnabled]((BOOL)self->_nodeConfiguration)
        && ![(BWStillImageNodeConfiguration *)self->_nodeConfiguration deferredPhotoProcessorEnabled]&& v9 != 15&& v9 != 36)
      {
        -[BWPhotonicEngineNode _processorControllerDidFinishProcessingInputForPortType:processorType:captureRequestIdentifier:]((uint64_t)self, [a6 portType], 6, objc_msgSend((id)objc_msgSend(a6, "settings"), "captureRequestIdentifier"));
      }
      goto LABEL_112;
    case 5:
      if (!_FigIsCurrentDispatchQueue())
      {
        uint64_t v83 = v89;
        LODWORD(v80) = 0;
        FigDebugAssert3();
      }
      if (!v7)
      {
        PortType = (void *)BWSampleBufferGetPortType(a4);
        int v21 = objc_msgSend(PortType, "isEqualToString:", objc_msgSend((id)objc_msgSend(a6, "captureSettings"), "masterPortType"));
        if ((objc_msgSend((id)objc_msgSend(a6, "captureStreamSettings"), "captureFlags") & 0x4000000000) != 0
          && (objc_msgSend((id)objc_msgSend(a6, "captureSettings"), "learnedNRStereoPhotoFrameFlag") & v91) != 0)
        {
          CMSampleBufferRef sampleBufferOut = 0;
          if (v21)
          {
            BWCMSampleBufferCreateCopyIncludingMetadata(a4, &sampleBufferOut);
            objc_msgSend((id)CMGetAttachment(sampleBufferOut, (CFStringRef)*MEMORY[0x1E4F53070], 0), "setObject:forKeyedSubscript:", 0, @"SyntheticReference");
          }
          else
          {
            if (a4) {
              v37 = (opaqueCMSampleBuffer *)CFRetain(a4);
            }
            else {
              v37 = 0;
            }
            CMSampleBufferRef sampleBufferOut = v37;
          }
          stereoPhotoSensorRawFrameByPortType = self->_stereoPhotoSensorRawFrameByPortType;
          if (!stereoPhotoSensorRawFrameByPortType)
          {
            stereoPhotoSensorRawFrameByPortType = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
            self->_stereoPhotoSensorRawFrameByPortType = stereoPhotoSensorRawFrameByPortType;
          }
          -[NSMutableDictionary setObject:forKeyedSubscript:](stereoPhotoSensorRawFrameByPortType, "setObject:forKeyedSubscript:", sampleBufferOut, PortType, v80, v83);
          if (sampleBufferOut) {
            CFRelease(sampleBufferOut);
          }
        }
        if (v21)
        {
          if (a4) {
            CFRetain(a4);
          }
          processorCoordinatorWorkerQueue = self->_processorCoordinatorWorkerQueue;
          v115[0] = MEMORY[0x1E4F143A8];
          v115[1] = 3221225472;
          v115[2] = __100__BWPhotonicEngineNode_processorController_didFinishProcessingSampleBuffer_type_processorInput_err___block_invoke;
          v115[3] = &unk_1E5C24F10;
          v115[4] = self;
          v115[5] = a4;
          CMSampleBufferRef sampleBufferOut = (CMSampleBufferRef)MEMORY[0x1E4F143A8];
          uint64_t v127 = 3221225472;
          uint64_t v128 = __ubn_dispatch_async_block_invoke_0;
          long long v129 = &unk_1E5C249F0;
          uint64_t v130 = v115;
          dispatch_async(processorCoordinatorWorkerQueue, &sampleBufferOut);
        }
      }
      goto LABEL_112;
    case 6:
      if (!_FigIsCurrentDispatchQueue())
      {
        uint64_t v83 = v89;
        LODWORD(v80) = 0;
        FigDebugAssert3();
      }
      if (v7 || v9 != 29 && v9 != 7) {
        goto LABEL_112;
      }
      uint64_t v87 = objc_msgSend((id)objc_msgSend(a6, "captureSettings", v80, v83), "captureFlags");
      if ((int)-[BWPhotonicEngineNodeConfiguration deepZoomVersion]((uint64_t)self->_nodeConfiguration) < 1
        || (objc_msgSend((id)objc_msgSend(a6, "captureStreamSettings"), "captureFlags") & 0x200000000) != 0)
      {
        goto LABEL_75;
      }
      uint64_t v22 = -[BWPhotonicEngineNodeConfiguration deepZoomMode]((uint64_t)self->_nodeConfiguration);
      if ((objc_msgSend((id)objc_msgSend(a6, "captureStreamSettings"), "captureFlags") & 0x4000000000) != 0)
      {
        uint64_t v22 = 5;
      }
      else if (!+[BWDeepZoomProcessorControllerConfiguration doDeepZoomStandardOrLiteForSampleBuffer:type:sensorConfiguration:intermediateZoomSrcRectOut:intermediateZoomDstRectOut:](BWDeepZoomProcessorControllerConfiguration, "doDeepZoomStandardOrLiteForSampleBuffer:type:sensorConfiguration:intermediateZoomSrcRectOut:intermediateZoomDstRectOut:", a4, 1, objc_msgSend((id)-[BWPhotonicEngineNodeConfiguration sensorConfigurationsByPortType]((uint64_t)self->_nodeConfiguration), "objectForKeyedSubscript:", objc_msgSend(a6, "portType")), 0, 0))
      {
        goto LABEL_75;
      }
      -[BWDeferredPipelineParameters setDeepZoomVersion:](-[BWDeferredCaptureControllerInput pipelineParameters](self->_deferredCaptureControllerInput, "pipelineParameters"), "setDeepZoomVersion:", -[BWPhotonicEngineNodeConfiguration deepZoomVersion]((uint64_t)self->_nodeConfiguration));
      [(BWDeferredPipelineParameters *)[(BWDeferredCaptureControllerInput *)self->_deferredCaptureControllerInput pipelineParameters] setDeepZoomMode:v22];
LABEL_75:
      unint64_t v92 = v9;
      if ((objc_msgSend((id)objc_msgSend(a6, "captureSettings"), "captureFlags") & 0x8000000000) != 0)
      {
        uint64_t v38 = (void *)CMGetAttachment(a4, (CFStringRef)*MEMORY[0x1E4F53070], 0);
        uint64_t v39 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
        BWCopyWhiteBalanceMetadata(v38, v39);
        -[BWDeferredCaptureControllerInput addDictionary:tag:](v97->_deferredCaptureControllerInput, "addDictionary:tag:", v39, [NSString stringWithFormat:@"%@-%@", BWDeferredIntermediateTagWhiteBalanceMetadataByPortTypePrefix, objc_msgSend(a6, "portType")]);
      }
      long long v109 = 0u;
      long long v110 = 0u;
      long long v111 = 0u;
      long long v112 = 0u;
      long long v40 = objc_msgSend((id)CMGetAttachment(a4, @"PhotoManifest", 0), "photoDescriptors");
      uint64_t v41 = [v40 countByEnumeratingWithState:&v109 objects:v119 count:16];
      if (v41)
      {
        uint64_t v42 = v41;
        uint64_t v43 = *(void *)v110;
        do
        {
          for (uint64_t i = 0; i != v42; ++i)
          {
            if (*(void *)v110 != v43) {
              objc_enumerationMutation(v40);
            }
            unint64_t v45 = *(void **)(*((void *)&v109 + 1) + 8 * i);
            CMSampleBufferGetPresentationTimeStamp(&v108, a4);
            CMTime v107 = v108;
            [v45 setPresentationTimeStamp:&v107];
            objc_msgSend(v45, "setTime:", objc_msgSend(MEMORY[0x1E4F1C9C8], "now"));
            objc_msgSend(v45, "setTimeZone:", objc_msgSend(MEMORY[0x1E4F1CAF0], "systemTimeZone"));
            [(BWDeferredCaptureControllerInput *)v97->_deferredCaptureControllerInput addPhotoDescriptor:v45];
          }
          uint64_t v42 = [v40 countByEnumeratingWithState:&v109 objects:v119 count:16];
        }
        while (v42);
      }
      a6 = v94;
      unint64_t v9 = v92;
      if (objc_msgSend((id)objc_msgSend(v94, "processingSettings"), "provideDemosaicedRaw"))
      {
        $2825F4736939C4A6D3AD43837233062D v46 = (const void *)BWSampleBufferGetAttachedMedia(a4, 0x1EFA745E0);
        id v47 = (id)CMGetAttachment(v46, @"RawDNGDictionary", 0);
        uint64_t v48 = (void *)[v94 settings];
        if (v47)
        {
          uint64_t v49 = (void *)BWCreateDNGDictionaryWithUpdatedDimensionsIfNeeded(v47, [v48 deferredPhotoProxyWidth] | (unint64_t)(objc_msgSend(v48, "deferredPhotoProxyHeight") << 32), objc_msgSend(v48, "deferredPhotoFinalWidth") | (unint64_t)(objc_msgSend(v48, "deferredPhotoFinalHeight") << 32));
          if (v49) {
            id v47 = v49;
          }
          a6 = v94;
          -[BWDeferredCaptureControllerInput addDictionary:tag:](v97->_deferredCaptureControllerInput, "addDictionary:tag:", v47, [NSString stringWithFormat:@"%@-%@", BWDeferredIntermediateTagDNGDictionaryPrefix, objc_msgSend(v94, "portType")]);
          unint64_t v9 = v92;
        }
        else if (![v48 outputFormat])
        {
          [(BWDeferredCaptureControllerInput *)v97->_deferredCaptureControllerInput encounteredProcessingError:0];
          unint64_t v50 = (const void *)objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend((id)CMGetAttachment(a4, @"StillImageProcessingFlags", 0), "unsignedIntValue") ^ 0x1000);
          CMSetAttachment(a4, @"StillImageProcessingFlags", v50, 1u);
        }
      }
      int v51 = [(BWStillImageNodeConfiguration *)v97->_nodeConfiguration depthDataType];
      if (v51 == 9) {
        goto LABEL_100;
      }
      if (v51 != 3) {
        goto LABEL_99;
      }
      uint64_t v52 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a4, @"Depth");
      if (v52)
      {
        int v53 = v52;
        CVImageBufferRef v54 = CMSampleBufferGetImageBuffer(v52);
        CFTypeRef v55 = CMGetAttachment(v53, (CFStringRef)*MEMORY[0x1E4F53070], 0);
        -[BWPhotonicEngineNode _deferredCaptureAddBuffer:bufferType:captureFrameFlags:metadata:rawThumbnailsBuffer:rawThumbnailsMetadata:portType:]((uint64_t)v97, (uint64_t)v54, 2001, 0, (uint64_t)v55, 0, 0, (void *)[a6 portType]);
        uint64_t v56 = (void *)CMGetAttachment(v53, (CFStringRef)*MEMORY[0x1E4F52FE8], 0);
        uint64_t v57 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v56];
        objc_msgSend(v57, "setObject:forKeyedSubscript:", CMGetAttachment(v53, @"DepthPixelBufferType", 0), @"DepthPixelBufferType");
        if ([v56 count])
        {
          a6 = v94;
          -[BWDeferredCaptureControllerInput addDictionary:tag:](v97->_deferredCaptureControllerInput, "addDictionary:tag:", v57, [NSString stringWithFormat:@"%@-%@", BWDeferredIntermediateTagDepthData, objc_msgSend(v94, "portType")]);
        }
        -[BWDeferredCaptureControllerInput addDictionary:tag:](v97->_deferredCaptureControllerInput, "addDictionary:tag:", objc_msgSend((id)objc_msgSend((id)-[BWPhotonicEngineNodeConfiguration sensorConfigurationsByPortType]((uint64_t)v97->_nodeConfiguration), "objectForKeyedSubscript:", *MEMORY[0x1E4F52E00]), "cameraInfo"), objc_msgSend(NSString, "stringWithFormat:", @"%@-%@", BWDeferredIntermediateTagCameraInfoByPortTypePrefix, *MEMORY[0x1E4F52E00]));
        unint64_t v9 = v92;
        if ((BWCIFilterArrayContainsPortraitFilters(objc_msgSend((id)objc_msgSend(a6, "settings"), "processedImageFilters")) & 1) == 0)BWSampleBufferRemoveAttachedMedia(a4, @"Depth"); {
      }
        }
      else
      {
        [(BWDeferredCaptureControllerInput *)v97->_deferredCaptureControllerInput depthDataGenerationFailed];
LABEL_99:
        if ((v87 & 0x4000000000) == 0) {
          goto LABEL_112;
        }
      }
LABEL_100:
      unsigned int v58 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
      objc_msgSend(v58, "setObject:forKeyedSubscript:", CMGetAttachment(a4, @"OriginalCameraIntrinsicMatrix", 0), @"OriginalCameraIntrinsicMatrix");
      objc_msgSend(v58, "setObject:forKeyedSubscript:", CMGetAttachment(a4, @"OriginalCameraIntrinsicMatrixReferenceDimensions", 0), @"OriginalCameraIntrinsicMatrixReferenceDimensions");
      if ([v58 count])
      {
        a6 = v94;
        -[BWDeferredCaptureControllerInput addDictionary:tag:](v97->_deferredCaptureControllerInput, "addDictionary:tag:", v58, [NSString stringWithFormat:@"%@-%@", BWDeferredIntermediateTagSampleBufferOriginalCameraIntrinsicsPrefix, objc_msgSend(v94, "portType")]);
      }
LABEL_112:
      uint64_t v61 = objc_msgSend(a6, "outputSampleBufferRouterForBufferType:", v9, v80, v83);
      if (![v61 outputSampleBufferRouter])
      {
        uint64_t v77 = NSString;
        uint64_t v78 = BWStillImageProcessorTypeToShortString([a3 type]);
        uint64_t v76 = [v77 stringWithFormat:@"No output router for output sample buffer of %@ (buffer type: %@, err: %d)", v78, BWStillImageBufferTypeToShortString(v9), obj];
LABEL_134:
        objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:v76 userInfo:0]);
      }
      uint64_t v62 = (void *)MEMORY[0x1A6272C70]();
      uint64_t v63 = [v61 outputSampleBufferRouter];
      (*(void (**)(uint64_t, opaqueCMSampleBuffer *, unint64_t, id, id))(v63 + 16))(v63, a4, v9, a6, obj);
      long long v103 = 0u;
      long long v104 = 0u;
      long long v102 = 0u;
      long long v101 = 0u;
      id obja = (id)[v61 bypassedProcessorsTypes];
      uint64_t v64 = [obja countByEnumeratingWithState:&v101 objects:v118 count:16];
      uint64_t v65 = v97;
      if (v64)
      {
        uint64_t v66 = v64;
        uint64_t v67 = *(void *)v102;
        do
        {
          for (uint64_t j = 0; j != v66; ++j)
          {
            if (*(void *)v102 != v67) {
              objc_enumerationMutation(obja);
            }
            uint64_t v69 = (int)objc_msgSend(*(id *)(*((void *)&v101 + 1) + 8 * j), "intValue", v81, v84);
            if (dword_1EB4C5670)
            {
              unsigned int v117 = 0;
              os_log_type_t type = OS_LOG_TYPE_DEFAULT;
              int64_t v70 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              unsigned int v71 = v117;
              if (os_log_type_enabled(v70, type)) {
                unsigned int v72 = v71;
              }
              else {
                unsigned int v72 = v71 & 0xFFFFFFFE;
              }
              if (v72)
              {
                uint64_t v73 = BWStillImageProcessorTypeToShortString(v69);
                int v120 = 136315651;
                long long v121 = "-[BWPhotonicEngineNode processorController:didFinishProcessingSampleBuffer:type:processorInput:err:]";
                __int16 v122 = 2114;
                uint64_t v123 = v73;
                __int16 v124 = 2113;
                id v125 = v94;
                LODWORD(v84) = 32;
                unint64_t v81 = &v120;
                _os_log_send_and_compose_impl();
              }
              fig_log_call_emit_and_clean_up_after_send_and_compose();
              uint64_t v65 = v97;
            }
            switch(v69)
            {
              case 1:
              case 2:
              case 3:
              case 4:
              case 5:
              case 6:
              case 8:
              case 9:
              case 11:
              case 12:
              case 13:
              case 14:
              case 15:
              case 17:
              case 18:
              case 19:
                uint64_t v76 = [NSString stringWithFormat:@"Processor bypassing support has not been implemented for %@", BWStillImageProcessorTypeToShortString(v69), v84, v85];
                goto LABEL_134;
              case 7:
                uint64_t v74 = v65->_processorCoordinatorWorkerQueue;
                uint64_t v75 = v100;
                v100[0] = MEMORY[0x1E4F143A8];
                v100[1] = 3221225472;
                v100[2] = __100__BWPhotonicEngineNode_processorController_didFinishProcessingSampleBuffer_type_processorInput_err___block_invoke_158;
                v100[3] = &unk_1E5C24430;
                v100[4] = v65;
                goto LABEL_129;
              case 10:
                uint64_t v74 = v65->_processorCoordinatorWorkerQueue;
                uint64_t v75 = v99;
                v99[0] = MEMORY[0x1E4F143A8];
                v99[1] = 3221225472;
                v99[2] = __100__BWPhotonicEngineNode_processorController_didFinishProcessingSampleBuffer_type_processorInput_err___block_invoke_2;
                v99[3] = &unk_1E5C24430;
                v99[4] = v65;
                goto LABEL_129;
              case 16:
                uint64_t v74 = v65->_processorCoordinatorWorkerQueue;
                uint64_t v75 = v98;
                v98[0] = MEMORY[0x1E4F143A8];
                v98[1] = 3221225472;
                v98[2] = __100__BWPhotonicEngineNode_processorController_didFinishProcessingSampleBuffer_type_processorInput_err___block_invoke_3;
                v98[3] = &unk_1E5C24430;
                v98[4] = v65;
LABEL_129:
                CMSampleBufferRef sampleBufferOut = (CMSampleBufferRef)MEMORY[0x1E4F143A8];
                uint64_t v127 = 3221225472;
                uint64_t v128 = __ubn_dispatch_async_block_invoke_0;
                long long v129 = &unk_1E5C249F0;
                uint64_t v130 = v75;
                dispatch_async(v74, &sampleBufferOut);
                break;
              default:
                continue;
            }
          }
          uint64_t v66 = [obja countByEnumeratingWithState:&v101 objects:v118 count:16];
        }
        while (v66);
      }
      return;
    case 8:
      if (!_FigIsCurrentDispatchQueue())
      {
        uint64_t v83 = v89;
        LODWORD(v80) = 0;
        FigDebugAssert3();
      }
      int v23 = objc_msgSend((id)objc_msgSend(a6, "captureSettings", v80, v83), "deliverDeferredPhotoProxyImage");
      if (v9 == 20 && v23)
      {
        int v24 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a4, @"Depth");
        id v25 = v24;
        if (v24) {
          CVImageBufferRef v26 = CMSampleBufferGetImageBuffer(v24);
        }
        else {
          CVImageBufferRef v26 = 0;
        }
        CFTypeRef v31 = CMGetAttachment(v25, (CFStringRef)*MEMORY[0x1E4F53070], 0);
        CFTypeRef v90 = CMGetAttachment(a4, (CFStringRef)*MEMORY[0x1E4F55B90], 0);
        CFTypeRef v88 = CMGetAttachment(a4, (CFStringRef)*MEMORY[0x1E4F55B40], 0);
        uint64_t v86 = [a6 portType];
        uint64_t v32 = objc_msgSend((id)objc_msgSend(a6, "settings"), "settingsID");
        objc_msgSend((id)objc_msgSend(a6, "settings"), "captureRequestIdentifier");
        if (v7) {
          BOOL v33 = 1;
        }
        else {
          BOOL v33 = v26 == 0;
        }
        char v34 = !v33;
        if (dword_1EB4C5670)
        {
          unsigned int v117 = 0;
          os_log_type_t type = OS_LOG_TYPE_DEFAULT;
          uint64_t v35 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
          unint64_t v9 = 20;
        }
        if (v26) {
          CFRetain(v26);
        }
        if ((BWCIFilterArrayContainsPortraitFilters(objc_msgSend((id)objc_msgSend(v94, "settings", v80, v83), "processedImageFilters")) & 1) == 0)BWSampleBufferRemoveAttachedMedia(a4, @"Depth"); {
        uint64_t v36 = v97->_processorCoordinatorWorkerQueue;
        }
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __100__BWPhotonicEngineNode_processorController_didFinishProcessingSampleBuffer_type_processorInput_err___block_invoke_154;
        block[3] = &unk_1E5C2D740;
        char v106 = v34;
        block[4] = v86;
        void block[5] = v97;
        block[6] = v90;
        block[7] = v88;
        block[8] = v31;
        block[9] = v26;
        block[10] = v32;
        dispatch_async(v36, block);
        a6 = v94;
      }
      goto LABEL_112;
    case 12:
      if (objc_msgSend((id)objc_msgSend(a6, "captureSettings"), "captureType") == 12
        && (v91 & 0x10) != 0
        && [(BWStillImageNodeConfiguration *)self->_nodeConfiguration depthDataType] == 9)
      {
        uint64_t v27 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_deepFusionProcessorInputByPortType, "objectForKeyedSubscript:", [a6 portType]);
        uint64_t v28 = objc_msgSend((id)objc_msgSend(v27, "evZeroReferenceFrameAttachments"), "mutableCopy");
        if (v28)
        {
          char v29 = v28;
          id v30 = (id)objc_msgSend((id)objc_msgSend(v28, "objectForKeyedSubscript:", 0x1EFA52000), "mutableCopy");
          if (!v30) {
            id v30 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          }
          objc_msgSend(v30, "setObject:forKeyedSubscript:", BWSampleBufferGetAttachedMedia(a4, 0x1EFA74380), 0x1EFA74380);
          objc_msgSend(v30, "setObject:forKeyedSubscript:", BWSampleBufferGetAttachedMedia(a4, 0x1EFA743E0), 0x1EFA743E0);
          objc_msgSend(v30, "setObject:forKeyedSubscript:", BWSampleBufferGetAttachedMedia(a4, 0x1EFA74400), 0x1EFA74400);
          [v29 setObject:v30 forKeyedSubscript:0x1EFA52000];

          [v27 setEvZeroReferenceFrameAttachments:v29];
          CMSampleBufferGetPresentationTimeStamp(&v114, a4);
          CMTime v113 = v114;
          [v27 setEvZeroReferenceFramePTS:&v113];
        }
      }
      if (!_FigIsCurrentDispatchQueue())
      {
        uint64_t v83 = v89;
        LODWORD(v80) = 0;
        FigDebugAssert3();
      }
      goto LABEL_112;
    case 16:
      if ([(BWStillImageNodeConfiguration *)self->_nodeConfiguration deferredPhotoProcessorEnabled])
      {
        -[BWPhotonicEngineNode _attemptPiecemealEncodingOfAuxImagesForSmartStylesCaptureWithSampleBuffer:portType:]((id *)&self->super.super.isa, a4, (void *)[a6 portType]);
      }
      goto LABEL_112;
    default:
      goto LABEL_112;
  }
}

id *__100__BWPhotonicEngineNode_processorController_didFinishProcessingSampleBuffer_type_processorInput_err___block_invoke(uint64_t a1)
{
  __n128 result = *(id **)(a1 + 32);
  if (result) {
    return (id *)-[BWPhotonicEngineNode _serviceNextSoftISPInputWithSampleBuffer:processingMode:transferOwnership:](result, *(const void **)(a1 + 40), 0, 1u);
  }
  return result;
}

- (uint64_t)_deferredCaptureAddBuffer:(uint64_t)a3 bufferType:(uint64_t)a4 captureFrameFlags:(uint64_t)a5 metadata:(uint64_t)a6 rawThumbnailsBuffer:(uint64_t)a7 rawThumbnailsMetadata:(void *)a8 portType:
{
  if (result)
  {
    uint64_t v8 = result;
    __n128 result = *(void *)(result + 920);
    if (result)
    {
      __n128 result = objc_msgSend(a8, "isEqualToString:", objc_msgSend((id)result, "portType"));
      if (result)
      {
        __n128 result = -[BWPhotonicEngineNode _processingNeededForSettings:portType:](v8, (void *)[*(id *)(v8 + 920) stillImageSettings], objc_msgSend(*(id *)(v8 + 920), "portType"));
        if (result)
        {
          double v15 = *(void **)(v8 + 920);
          return [v15 addBuffer:a2 bufferType:a3 captureFrameFlags:a4 metadata:a5 rawThumbnailsBuffer:a6 rawThumbnailsMetadata:a7];
        }
      }
    }
  }
  return result;
}

void __100__BWPhotonicEngineNode_processorController_didFinishProcessingSampleBuffer_type_processorInput_err___block_invoke_154(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 88))
  {
    if (!objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", objc_msgSend(*(id *)(*(void *)(a1 + 40) + 920), "portType")))goto LABEL_8; {
    uint64_t v2 = *(void *)(a1 + 48);
    }
    if (v2) {
      [*(id *)(*(void *)(a1 + 40) + 920) addDictionary:v2, objc_msgSend(NSString, "stringWithFormat:", @"%@-%@", BWDeferredIntermediateTagStereoPhotoDepthMetadata, *(void *)(a1 + 32)) tag];
    }
    [*(id *)(*(void *)(a1 + 40) + 920) addDictionary:*(void *)(a1 + 56), objc_msgSend(NSString, "stringWithFormat:", @"%@-%@", BWDeferredIntermediateTagDepthMetadata, *(void *)(a1 + 32)) tag];
    [*(id *)(*(void *)(a1 + 40) + 920) addBuffer:*(void *)(a1 + 72) bufferType:2001 captureFrameFlags:0 metadata:*(void *)(a1 + 64) rawThumbnailsBuffer:0 rawThumbnailsMetadata:0];
    if (dword_1EB4C5670)
    {
LABEL_8:
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  else
  {
    [*(id *)(*(void *)(a1 + 40) + 920) depthDataGenerationFailed];
  }
  int v4 = *(const void **)(a1 + 72);
  if (v4) {
    CFRelease(v4);
  }
}

uint64_t __100__BWPhotonicEngineNode_processorController_didFinishProcessingSampleBuffer_type_processorInput_err___block_invoke_158(uint64_t a1)
{
  uint64_t v1 = (void *)[*(id *)(*(void *)(a1 + 32) + 168) controllerForType:7];
  return [v1 cancelProcessing];
}

void *__100__BWPhotonicEngineNode_processorController_didFinishProcessingSampleBuffer_type_processorInput_err___block_invoke_2(uint64_t a1)
{
  __n128 result = (void *)-[BWPhotonicEngineNode _waitAndSafelyGetProcessorControllerForType:](*(void *)(a1 + 32), 10);
  if (result)
  {
    return (void *)[result cancelProcessing];
  }
  return result;
}

- (uint64_t)_waitAndSafelyGetProcessorControllerForType:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    if (!_FigIsCurrentDispatchQueue()) {
      FigDebugAssert3();
    }
    int v4 = *(NSObject **)(v3 + 192);
    if (v4) {
      dispatch_group_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
    }
    uint64_t v5 = *(void **)(v3 + 168);
    return [v5 controllerForType:a2];
  }
  return result;
}

uint64_t __100__BWPhotonicEngineNode_processorController_didFinishProcessingSampleBuffer_type_processorInput_err___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = (void *)-[BWPhotonicEngineNode _waitAndSafelyGetProcessorControllerForType:](*(void *)(a1 + 32), 16);
  return [v1 cancelProcessing];
}

- (void)_removeNonPropagatedAttachedMediaFromSampleBuffer:(uint64_t)a1
{
  if (a1)
  {
    BWSampleBufferRemoveAttachedMedia(a2, 0x1EFA74640);
    BWSampleBufferRemoveAttachedMedia(a2, 0x1EFA74660);
    BWSampleBufferRemoveAttachedMedia(a2, 0x1EFA74840);
    BWSampleBufferRemoveAttachedMedia(a2, 0x1EFA748E0);
    BWSampleBufferRemoveAttachedMedia(a2, @"HumanFullBodiesMask");
    BWSampleBufferRemoveAttachedMedia(a2, @"HumanSkinsMask");
    BWSampleBufferRemoveAttachedMedia(a2, 0x1EFA74700);
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
      uint64_t v5 = (void *)CMGetAttachment(a2, @"StillSettings", 0);
      if (v5)
      {
        if ((objc_msgSend((id)objc_msgSend(v5, "captureSettings"), "captureFlags") & 0x100000000) != 0)
        {
          -[BWPhotonicEngineNode _releaseResources](a1);
        }
      }
    }
  }
}

void __54__BWPhotonicEngineNode__emitSampleBuffer_description___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)CMGetAttachment(*(CMAttachmentBearerRef *)(a1 + 48), @"StillSettings", 0);
  if (v2)
  {
    uint64_t v3 = v2;
    if (objc_msgSend((id)objc_msgSend(v2, "requestedSettings"), "isBeginMomentCaptureSettings"))
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      id v7 = +[BWNodeError newError:4294954516 sourceNode:*(void *)(a1 + 40) stillImageSettings:v3 metadata:CMGetAttachment(*(CMAttachmentBearerRef *)(a1 + 48), (CFStringRef)*MEMORY[0x1E4F53070], 0)];
      [*(id *)(*(void *)(a1 + 40) + 16) emitNodeError:v7];
    }
    else
    {
      if (dword_1EB4C5670)
      {
        int v4 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      -[BWPhotonicEngineNode _releaseNodeResourcesIfNeededBeforeEmittingSampleBuffer:](*(void *)(a1 + 40), *(const void **)(a1 + 48));
      [*(id *)(*(void *)(a1 + 40) + 16) emitSampleBuffer:*(void *)(a1 + 48)];
    }
  }
  uint64_t v5 = *(const void **)(a1 + 48);
  if (v5) {
    CFRelease(v5);
  }
}

void __75__BWPhotonicEngineNode__emitError_stillImageSettings_metadata_description___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) emitNodeError:*(void *)(a1 + 40)];
  uint64_t v2 = *(void **)(a1 + 40);
}

- (void)processorController:(id)a3 didFinishProcessingInput:(id)a4 err:(int)a5
{
  uint64_t v6 = *(void *)&a5;
  block[16] = *MEMORY[0x1E4F143B8];
  if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "settings"), "captureRequestIdentifier"), "isEqualToString:", self->_currentCaptureRequestIdentifier))
  {
    uint64_t v10 = [a4 portType];
    uint64_t v11 = [a3 type];
    uint64_t v12 = [a4 stillImageSettings];
    double v13 = objc_msgSend((id)objc_msgSend(a4, "settings"), "captureRequestIdentifier");
    switch(v11)
    {
      case 2:
        if (_FigIsCurrentDispatchQueue())
        {
          if (v6) {
            goto LABEL_23;
          }
        }
        else
        {
          uint64_t v26 = v5;
          LODWORD(v25) = 0;
          FigDebugAssert3();
          if (v6)
          {
LABEL_23:
            if ([(BWStillImageNodeConfiguration *)self->_nodeConfiguration deferredPhotoProcessorEnabled])
            {
              -[BWPhotonicEngineNode _emitError:stillImageSettings:metadata:description:]((uint64_t)self, v6, [a4 stillImageSettings], 0);
            }
            else
            {
              -[BWPhotonicEngineNode _handleDeepFusionError:processorInput:]((unint64_t)self, v6, a4);
            }
          }
        }
        double v14 = self;
        uint64_t v15 = v10;
        uint64_t v16 = 2;
        goto LABEL_6;
      case 3:
        if (!_FigIsCurrentDispatchQueue()) {
          FigDebugAssert3();
        }
        processorCoordinatorWorkerQueue = self->_processorCoordinatorWorkerQueue;
        uint64_t v20 = v31;
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __73__BWPhotonicEngineNode_processorController_didFinishProcessingInput_err___block_invoke;
        v31[3] = &unk_1E5C285A0;
        v31[4] = self;
        v31[5] = v10;
        v31[6] = v13;
        v31[7] = 3;
        goto LABEL_34;
      case 4:
      case 7:
      case 10:
      case 15:
      case 16:
      case 17:
      case 18:
        if (!_FigIsCurrentDispatchQueue()) {
          FigDebugAssert3();
        }
        double v14 = self;
        uint64_t v15 = v10;
        uint64_t v16 = v11;
        goto LABEL_6;
      case 5:
        if (!_FigIsCurrentDispatchQueue()) {
          FigDebugAssert3();
        }
        processorCoordinatorWorkerQueue = self->_processorCoordinatorWorkerQueue;
        uint64_t v20 = v28;
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __73__BWPhotonicEngineNode_processorController_didFinishProcessingInput_err___block_invoke_3;
        v28[3] = &unk_1E5C2D768;
        int v29 = v6;
        v28[4] = self;
        v28[5] = a4;
        v28[6] = v10;
        v28[7] = v13;
        v28[8] = v12;
        v28[9] = 5;
        goto LABEL_34;
      case 6:
      case 11:
        if (!_FigIsCurrentDispatchQueue()) {
          FigDebugAssert3();
        }
        -[BWPhotonicEngineNode _processorControllerDidFinishProcessingInputForPortType:processorType:captureRequestIdentifier:]((uint64_t)self, v10, v11, v13);
        int v17 = objc_msgSend((id)objc_msgSend(a4, "captureSettings"), "captureType");
        if (v6 && v17 == 12)
        {
          if (objc_msgSend((id)objc_msgSend(a4, "captureSettings"), "deliverDeferredPhotoProxyImage"))
          {
            deferredCaptureControllerInput = self->_deferredCaptureControllerInput;
            [(BWDeferredCaptureControllerInput *)deferredCaptureControllerInput encounteredProcessingError:v6];
          }
          else if (self->_deepFusionProcessorControllerConfiguration)
          {
            id v22 = [(BWStillImageProcessorCoordinator *)self->_processorCoordinator controllerForType:2];
            [v22 cancelProcessing];
          }
        }
        return;
      case 8:
        if (!_FigIsCurrentDispatchQueue()) {
          FigDebugAssert3();
        }
        processorCoordinatorWorkerQueue = self->_processorCoordinatorWorkerQueue;
        uint64_t v20 = v30;
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        char v30[2] = __73__BWPhotonicEngineNode_processorController_didFinishProcessingInput_err___block_invoke_2;
        v30[3] = &unk_1E5C285A0;
        v30[4] = self;
        v30[5] = v10;
        v30[6] = v13;
        v30[7] = 8;
        goto LABEL_34;
      case 9:
      case 13:
        if (!_FigIsCurrentDispatchQueue()) {
          FigDebugAssert3();
        }
        processorCoordinatorWorkerQueue = self->_processorCoordinatorWorkerQueue;
        uint64_t v20 = v27;
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __73__BWPhotonicEngineNode_processorController_didFinishProcessingInput_err___block_invoke_4;
        v27[3] = &unk_1E5C285A0;
        v27[4] = self;
        v27[5] = v10;
        v27[6] = v13;
        v27[7] = v11;
LABEL_34:
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __ubn_dispatch_async_block_invoke_0;
        block[3] = &unk_1E5C249F0;
        block[4] = v20;
        dispatch_async(processorCoordinatorWorkerQueue, block);
        return;
      case 12:
        if (_FigIsCurrentDispatchQueue())
        {
          if (v6)
          {
LABEL_38:
            os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
            -[BWPhotonicEngineNode _resetProcessingState]((uint64_t)self);
            -[BWPhotonicEngineNode _emitError:stillImageSettings:metadata:description:]((uint64_t)self, v6, [a4 stillImageSettings], 0);
            return;
          }
        }
        else
        {
          uint64_t v26 = v5;
          LODWORD(v25) = 0;
          FigDebugAssert3();
          if (v6) {
            goto LABEL_38;
          }
        }
        -[BWPhotonicEngineNode _processorControllerDidFinishProcessingInputForPortType:processorType:captureRequestIdentifier:]((uint64_t)self, v10, 12, v13);
        if (objc_msgSend((id)objc_msgSend(a4, "captureSettings"), "captureType") == 12)
        {
          if ([(BWDeepFusionProcessorControllerConfiguration *)self->_deepFusionProcessorControllerConfiguration delayPrepareAndCacheBuffers])
          {
            if (![(NSMutableDictionary *)self->_softISPRemainingInputsByPortType count]
              || objc_msgSend((id)objc_msgSend(a4, "captureSettings"), "learnedNRStereoPhotoFrameFlag")
              && (uint64_t v23 = objc_msgSend((id)objc_msgSend(a4, "captureSettings"), "masterPortType"),
                  uint64_t v24 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "captureSettings"), "secondaryPortTypes"), "firstObject"), -[NSMutableDictionary count](self->_softISPRemainingInputsByPortType, "count") == 2)&& objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_softISPRemainingInputsByPortType, "objectForKeyedSubscript:", v23), "count") == 1&& objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_softISPRemainingInputsByPortType, "objectForKeyedSubscript:", v24), "count") == 1)
            {
              objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_deepFusionProcessorInputByPortType, "objectForKeyedSubscript:", v10, v25, v26), "beginProcessingCachedBuffersIfWaiting");
            }
          }
        }
LABEL_7:
        -[BWPhotonicEngineNode _resetProcessingStateIfDone]((uint64_t)self);
        break;
      case 14:
        if (!_FigIsCurrentDispatchQueue()) {
          FigDebugAssert3();
        }
        -[BWPhotonicEngineNode _emitDeferredCaptureProxyOrErrorRecoverySampleBufferWithWithProcessingError:]((uint64_t)self, v6);
        double v14 = self;
        uint64_t v15 = v10;
        uint64_t v16 = 14;
LABEL_6:
        -[BWPhotonicEngineNode _processorControllerDidFinishProcessingInputForPortType:processorType:captureRequestIdentifier:]((uint64_t)v14, v15, v16, v13);
        goto LABEL_7;
      default:
        return;
    }
  }
}

- (void)_handleDeepFusionError:(void *)a3 processorInput:
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (!_FigIsCurrentDispatchQueue())
    {
      uint64_t v20 = v3;
      LODWORD(v19) = 0;
      FigDebugAssert3();
    }
    uint64_t v6 = objc_msgSend(a3, "portType", v19, v20);
    id v7 = (void *)[a3 stillImageSettings];
    uint64_t v8 = (BWNRFProcessorInput *)(id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 368), "objectForKeyedSubscript:", v6), "firstObject");
    if (!v8)
    {
      uint64_t v8 = [[BWNRFProcessorInput alloc] initWithSettings:v7 portType:v6];
      if (-[BWPhotonicEngineNode _isInferenceInputImageRequiredForSettings:portType:](a1, v7, (uint64_t)[(BWStillImageProcessorControllerInput *)v8 portType]))
      {
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __47__BWPhotonicEngineNode__ubInferenceInputRouter__block_invoke;
        v28[3] = &unk_1E5C28D80;
        v28[4] = a1;
        -[BWStillImageProcessorControllerInput addOutputSampleBufferRouter:forBufferTypes:](v8, "addOutputSampleBufferRouter:forBufferTypes:", (id)[v28 copy], &unk_1EFB04AF0);
      }
      objc_msgSend(*(id *)(a1 + 368), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObject:", v8), v6);
    }
    uint64_t v21 = v6;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v23 = v7;
    id v9 = -[BWPhotonicEngineNode _bufferTypesForCaptureSettings:](a1, (void *)[v7 captureSettings]);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v30 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v25 != v12) {
            objc_enumerationMutation(v9);
          }
          double v14 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          uint64_t v15 = objc_msgSend((id)objc_msgSend(a3, "outputSampleBufferRouterForBufferType:", (int)objc_msgSend(v14, "intValue")), "outputSampleBufferRouter");
          int v29 = v14;
          -[BWStillImageProcessorControllerInput addOutputSampleBufferRouter:forBufferTypes:](v8, "addOutputSampleBufferRouter:forBufferTypes:", v15, [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1]);
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v24 objects:v30 count:16];
      }
      while (v11);
    }
    uint64_t v16 = a2;
    if (a2)
    {
      int v17 = v23;
      uint64_t v18 = (void *)v21;
      if (v8)
      {
        if ((objc_msgSend((id)objc_msgSend(v23, "captureSettings"), "captureFlags") & 4) != 0)
        {
          uint64_t v16 = -[BWPhotonicEngineNode _processRawErrorRecoveryFrameWithNRFProcessorInput:failureMetadata:](a1, v8, 0);
        }
        else
        {
          [(BWNRFProcessorInput *)v8 setRemainingProcessingCount:[(BWNRFProcessorInput *)v8 remainingProcessingCount] + 1];
          uint64_t v16 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 168), "controllerForType:", 6), "enqueueInputForProcessing:delegate:processErrorRecoveryFrame:processOriginalImage:processToneMapping:processInferenceInputImage:clientBracketSequenceNumber:processSemanticRendering:provideInferenceInputImageForProcessing:processSmartStyleRenderingInput:inferencesAvailable:", v8, a1, 1, 0, 0, 0, 0);
          if (v16) {
            -[BWPhotonicEngineNode _processorControllerDidFinishProcessingInputForPortType:processorType:captureRequestIdentifier:](a1, v21, 6, objc_msgSend((id)objc_msgSend(v23, "requestedSettings"), "captureRequestIdentifier"));
          }
        }
      }
    }
    else
    {
      int v17 = v23;
      uint64_t v18 = (void *)v21;
    }
    [*(id *)(a1 + 384) setObject:&unk_1EFB02510 forKeyedSubscript:*(void *)(a1 + 152)];
    -[BWPhotonicEngineNode _attemptDisparityReferenceFrameResolutionForSettings:portType:](a1, v17, v18);
    -[BWPhotonicEngineNode _deferredCaptureAddSecondaryStereoPhotoCaptureSampleBufferIfReadyForSettings:](a1, v17);
    if (v16)
    {
      [a3 description];
      -[BWPhotonicEngineNode _emitError:stillImageSettings:metadata:description:](a1, v16, (uint64_t)v17, 0);
    }
  }
}

void __73__BWPhotonicEngineNode_processorController_didFinishProcessingInput_err___block_invoke(uint64_t a1)
{
  -[BWPhotonicEngineNode _processorControllerDidFinishProcessingInputForPortType:processorType:captureRequestIdentifier:](*(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 56), *(void **)(a1 + 48));
  uint64_t v2 = *(void *)(a1 + 32);
  -[BWPhotonicEngineNode _resetProcessingStateIfDone](v2);
}

void __73__BWPhotonicEngineNode_processorController_didFinishProcessingInput_err___block_invoke_2(uint64_t a1)
{
  -[BWPhotonicEngineNode _processorControllerDidFinishProcessingInputForPortType:processorType:captureRequestIdentifier:](*(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 56), *(void **)(a1 + 48));
  uint64_t v2 = *(void *)(a1 + 32);
  -[BWPhotonicEngineNode _resetProcessingStateIfDone](v2);
}

void __73__BWPhotonicEngineNode_processorController_didFinishProcessingInput_err___block_invoke_3(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 80);
  uint64_t v3 = *(void *)(a1 + 32);
  if (v2)
  {
    -[BWPhotonicEngineNode _resetProcessingState](v3);
    uint64_t v4 = *(unsigned int *)(a1 + 80);
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = [*(id *)(a1 + 40) stillImageSettings];
    -[BWPhotonicEngineNode _emitError:stillImageSettings:metadata:description:](v5, v4, v6, 0);
  }
  else
  {
    -[BWPhotonicEngineNode _processorControllerDidFinishProcessingInputForPortType:processorType:captureRequestIdentifier:](v3, *(void *)(a1 + 48), *(void *)(a1 + 72), *(void **)(a1 + 56));
    if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 64), "captureSettings"), "captureType") == 12) {
      objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 432), "objectForKeyedSubscript:", objc_msgSend(*(id *)(a1 + 40), "portType")), "allInferencesDelivered");
    }
    uint64_t v7 = *(void *)(a1 + 32);
    -[BWPhotonicEngineNode _resetProcessingStateIfDone](v7);
  }
}

void __73__BWPhotonicEngineNode_processorController_didFinishProcessingInput_err___block_invoke_4(uint64_t a1)
{
  -[BWPhotonicEngineNode _processorControllerDidFinishProcessingInputForPortType:processorType:captureRequestIdentifier:](*(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 56), *(void **)(a1 + 48));
  uint64_t v2 = *(void *)(a1 + 32);
  -[BWPhotonicEngineNode _resetProcessingStateIfDone](v2);
}

- (void)_emitDeferredCaptureProxyOrErrorRecoverySampleBufferWithWithProcessingError:(uint64_t)a1
{
  if (!a1) {
    return;
  }
  uint64_t v3 = *(void **)(a1 + 920);
  if (!v3)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    uint64_t v15 = 0;
    a2 = 4294954516;
LABEL_18:
    -[BWPhotonicEngineNode _emitError:stillImageSettings:metadata:description:](a1, a2, v15, 0);
    return;
  }
  uint64_t v5 = [v3 stillImageSettings];
  uint64_t v6 = *(const void **)(a1 + 928);
  if (!v6)
  {
    uint64_t v15 = v5;
    double v14 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    if (!a2) {
      return;
    }
    goto LABEL_18;
  }
  if (a2)
  {
    PortType = (void *)BWSampleBufferGetPortType(*(const void **)(a1 + 928));
    uint64_t v8 = objc_msgSend(*(id *)(a1 + 376), "objectForKeyedSubscript:", objc_msgSend(*(id *)(a1 + 920), "portType"));
    if (v8) {
      objc_msgSend((id)CMGetAttachment(*(CMAttachmentBearerRef *)(a1 + 928), (CFStringRef)*MEMORY[0x1E4F53070], 0), "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E4F542D8]);
    }
    [*(id *)(a1 + 384) setObject:&unk_1EFB02510 forKeyedSubscript:*(void *)(a1 + 152)];
    -[BWPhotonicEngineNode _attemptDisparityReferenceFrameResolutionForSettings:portType:](a1, (void *)[*(id *)(a1 + 920) stillImageSettings], PortType);
    -[BWPhotonicEngineNode _deferredCaptureAddSecondaryStereoPhotoCaptureSampleBufferIfReadyForSettings:](a1, (void *)[*(id *)(a1 + 920) stillImageSettings]);
    uint64_t v6 = *(const void **)(a1 + 928);
  }
  -[BWPhotonicEngineNode _waitForAndMergeInferencesIfNeededForSampleBuffer:processorInput:]((BOOL *)a1, v6, *(void **)(a1 + 920));
  int v9 = objc_msgSend((id)CMGetAttachment(*(CMAttachmentBearerRef *)(a1 + 928), @"StillImageProcessingFlags", 0), "unsignedIntValue");
  if (a2)
  {
    if ((v9 & 0x1000) != 0) {
      CMSetAttachment(*(CMAttachmentBearerRef *)(a1 + 928), @"StillImageProcessingFlags", (CFTypeRef)[NSNumber numberWithUnsignedInt:v9 & 0xFFFFAFFF | 0x4000], 1u);
    }
    uint64_t v10 = @"error recovery";
  }
  else
  {
    uint64_t v10 = @"proxy";
  }
  uint64_t v11 = *(const void **)(a1 + 928);
  uint64_t v12 = [NSString stringWithFormat:@"%@ %@", BWPhotoEncoderStringFromEncodingScheme(objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 920), "stillImageSettings"), "captureSettings"), "captureType")), v10];
  -[BWPhotonicEngineNode _emitSampleBuffer:description:](a1, v11, v12);
}

- (void)processorController:(id)a3 willAddBuffer:(__CVBuffer *)a4 metadata:(id)a5 bufferType:(unint64_t)a6 processorInput:(id)a7
{
  if (a5)
  {
    if (a3)
    {
      if (a4)
      {
        if (a7)
        {
          if ([a3 type] == 2
            && (int)-[BWPhotonicEngineNodeConfiguration deepZoomVersion]((uint64_t)self->_nodeConfiguration) >= 1
            && (objc_msgSend((id)objc_msgSend(a7, "captureStreamSettings"), "captureFlags") & 0x4200000000) == 0
            && a6 <= 0x1B
            && ((1 << a6) & 0x9C00000) != 0)
          {
            CGSize v12 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
            v15.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
            v15.size = v12;
            v14.origin = v15.origin;
            v14.size = v12;
            uint64_t v13 = objc_msgSend((id)-[BWPhotonicEngineNodeConfiguration sensorConfigurationsByPortType]((uint64_t)self->_nodeConfiguration), "objectForKeyedSubscript:", objc_msgSend(a7, "portType"));
            if (+[BWDeepZoomProcessorControllerConfiguration doDeepZoomStandardOrLiteForType:sensorConfiguration:dimensions:metadata:stillImageSettings:intermediateZoomSrcRectOut:intermediateZoomDstRectOut:](BWDeepZoomProcessorControllerConfiguration, "doDeepZoomStandardOrLiteForType:sensorConfiguration:dimensions:metadata:stillImageSettings:intermediateZoomSrcRectOut:intermediateZoomDstRectOut:", 1, v13, psn_pixelBufferDimensions(a4), a5, [a7 stillImageSettings], &v15, &v14))
            {
              if (!CGRectIsNull(v15) && !CGRectIsNull(v14))
              {
                FigCFDictionarySetCGRect();
                FigCFDictionarySetCGRect();
              }
            }
          }
        }
      }
    }
  }
}

- (void)processorController:(id)a3 willAddSampleBuffer:(opaqueCMSampleBuffer *)a4 processorInput:(id)a5
{
  if (a3 && a4 && a5)
  {
    int v9 = (void *)CMGetAttachment(a4, (CFStringRef)*MEMORY[0x1E4F53070], 0);
    uint64_t v10 = [a3 type];
    if (v10 == 12)
    {
      if ((int)-[BWPhotonicEngineNodeConfiguration deepZoomVersion]((uint64_t)self->_nodeConfiguration) >= 1
        && objc_msgSend((id)objc_msgSend(a5, "captureStreamSettings"), "captureType") == 12
        && (objc_msgSend((id)objc_msgSend(a5, "captureStreamSettings"), "captureFlags") & 0x200000000) != 0)
      {
        CGSize v12 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
        v15.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
        v15.size = v12;
        if (+[BWDeepZoomProcessorControllerConfiguration doDeepZoomTransferForSampleBuffer:sensorConfiguration:intermediateZoomSrcRectOut:](BWDeepZoomProcessorControllerConfiguration, "doDeepZoomTransferForSampleBuffer:sensorConfiguration:intermediateZoomSrcRectOut:", a4, objc_msgSend((id)-[BWPhotonicEngineNodeConfiguration sensorConfigurationsByPortType]((uint64_t)self->_nodeConfiguration), "objectForKeyedSubscript:", objc_msgSend(a5, "portType")), &v15))
        {
          if (objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E4F54148]), "intValue") == 1&& !CGRectIsNull(v15))
          {
            objc_msgSend((id)objc_msgSend((id)objc_msgSend(a5, "captureSettings"), "metadata"), "uiZoomFactor");
            if (v13 >= 1.4118)
            {
              if (-[BWDeepZoomProcessorControllerConfiguration mode](self->_deepZoomProcessorControllerConfiguration, "mode") != 4&& -[FigCaptureCameraParameters deepZoomTransferWithZoomedImageEnabledForPortType:sensorIDString:](+[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance"), "deepZoomTransferWithZoomedImageEnabledForPortType:sensorIDString:", [a5 portType], +[FigCaptureCameraParameters sensorIDStringFromMetadata:](FigCaptureCameraParameters, "sensorIDStringFromMetadata:", v9)))
              {
                objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8], @"Deep Zoom Transfer wrongly configured, processing mode should be 'FuseHighResolutionWithZoomedImage'", 0 reason userInfo]);
              }
              goto LABEL_22;
            }
          }
        }
      }
    }
    else if (v10 == 6 {
           && (int)-[BWPhotonicEngineNodeConfiguration deepZoomVersion]((uint64_t)self->_nodeConfiguration) >= 1
    }
           && objc_msgSend((id)objc_msgSend(a5, "captureStreamSettings"), "captureType") == 12
           && (objc_msgSend((id)objc_msgSend(a5, "captureStreamSettings"), "captureFlags") & 0x4200000000) == 0)
    {
      CGSize v11 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
      v15.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
      v15.size = v11;
      v14.origin = v15.origin;
      v14.size = v11;
      if (+[BWDeepZoomProcessorControllerConfiguration doDeepZoomStandardOrLiteForSampleBuffer:type:sensorConfiguration:intermediateZoomSrcRectOut:intermediateZoomDstRectOut:](BWDeepZoomProcessorControllerConfiguration, "doDeepZoomStandardOrLiteForSampleBuffer:type:sensorConfiguration:intermediateZoomSrcRectOut:intermediateZoomDstRectOut:", a4, 1, objc_msgSend((id)-[BWPhotonicEngineNodeConfiguration sensorConfigurationsByPortType]((uint64_t)self->_nodeConfiguration), "objectForKeyedSubscript:", objc_msgSend(a5, "portType")), &v15, &v14))
      {
        if (!CGRectIsNull(v15) && !CGRectIsNull(v14))
        {
          FigCFDictionarySetCGRect();
LABEL_22:
          FigCFDictionarySetCGRect();
        }
      }
    }
  }
}

- (void)processorController:(id)a3 didSelectNewReferenceFrameWithPTS:(id *)a4 transform:(id)a5 processorInput:(id)a6
{
  if (objc_msgSend(a6, "isMaster", a3))
  {
    uint64_t v10 = (void *)-[BWPhotonicEngineNodeConfiguration referenceFrameSelectionDelegate]((uint64_t)self->_nodeConfiguration);
    uint64_t v11 = [a6 stillImageSettings];
    long long v12 = *(_OWORD *)&a4->var0;
    int64_t var3 = a4->var3;
    [v10 node:self didSelectNewReferenceFrameWithPTS:&v12 transform:a5 forSettings:v11];
  }
}

- (void)_handleQueuedSampleBufferForDisparityWithSettingsIfNeeded:(int)a3 resolvedFusionMode:(void *)a4 portType:
{
  if (a1)
  {
    if (-[BWPhotonicEngineNode _referenceOrClientBracketFrameEmissionNeededForSettings:portType:](a1, a2, a4))
    {
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __110__BWPhotonicEngineNode__handleQueuedSampleBufferForDisparityWithSettingsIfNeeded_resolvedFusionMode_portType___block_invoke;
      v14[3] = &unk_1E5C2D790;
      int v15 = a3;
      v14[4] = a2;
      uint64_t v7 = objc_msgSend(*(id *)(a1 + 248), "newSampleBuffersAndInputsWithPredicate:", objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithBlock:", v14));
      id v8 = (id)[v7 firstObject];

      if (v8)
      {
        uint64_t v9 = -[BWPhotonicEngineNode _handleSampleBuffer:input:](a1, (void *)[v8 sampleBuffer], objc_msgSend(v8, "nodeInput"));
        if (v9)
        {
          uint64_t v10 = v9;
          CFTypeRef v11 = CMGetAttachment((CMAttachmentBearerRef)[v8 sampleBuffer], @"StillSettings", 0);
          long long v12 = (const void *)[v8 sampleBuffer];
          CFTypeRef v13 = CMGetAttachment(v12, (CFStringRef)*MEMORY[0x1E4F53070], 0);
          -[BWPhotonicEngineNode _resetProcessingState](a1);
          -[BWPhotonicEngineNode _emitError:stillImageSettings:metadata:description:](a1, v10, (uint64_t)v11, (uint64_t)v13);
        }
      }
    }
    else
    {
      id v8 = 0;
    }
  }
}

- (unint64_t)_referenceOrClientBracketFrameEmissionNeededForSettings:(void *)a3 portType:
{
  if (result)
  {
    unint64_t v5 = result;
    uint64_t v6 = objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureStreamSettingsForPortType:", a3);
    BOOL v7 = ([v6 captureFlags] & 0x20000) != 0 || *(void *)(v5 + 776) != 0;
    uint64_t v8 = [v6 captureFlags];
    __n128 result = (v8 & 0x4000000000) == 0 && v7;
    if ((v8 & 0x4000000000) != 0 && v7)
    {
      if (objc_msgSend(a3, "isEqualToString:", objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "masterPortType")))return 1; {
      else
      }
        return ((unint64_t)[v6 captureFlags] >> 11) & 1;
    }
  }
  return result;
}

uint64_t __110__BWPhotonicEngineNode__handleQueuedSampleBufferForDisparityWithSettingsIfNeeded_resolvedFusionMode_portType___block_invoke(uint64_t a1, void *a2)
{
  if (*(_DWORD *)(a1 + 40) != 1
    && (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "captureSettings"), "captureFlags") & 0x1000) != 0)
  {
    int v5 = 0;
    BOOL v4 = *(_DWORD *)(a1 + 40) == 2;
  }
  else
  {
    BOOL v4 = 0;
    int v5 = 1;
  }
  uint64_t v6 = (const void *)[a2 sampleBuffer];
  BOOL v7 = (void *)CMGetAttachment(v6, @"StillImageSettings", 0);
  unsigned __int8 v8 = BWStillImageCaptureFrameFlagsForSampleBuffer(v6);
  PortType = (void *)BWSampleBufferGetPortType(v6);
  if ((~v8 & 0x12) != 0) {
    int v5 = 0;
  }
  int v10 = objc_msgSend(PortType, "isEqualToString:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "captureSettings"), "masterPortType"));
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "requestedSettings"), "captureRequestIdentifier"), "isEqualToString:", objc_msgSend(v7, "captureRequestIdentifier")) & ~v10 & (v5 | (v4 && (v8 & 4) != 0));
}

- (void)processorController:(id)a3 didSelectFusionMode:(int)a4 processorInput:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ([a5 isMaster])
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_stillImageFusionModeByCaptureRequestIdentifier, "setObject:forKeyedSubscript:", [NSNumber numberWithInt:v6], self->_currentCaptureRequestIdentifier);
    -[BWPhotonicEngineNode _handleQueuedSampleBufferForDisparityWithSettingsIfNeeded:resolvedFusionMode:portType:]((unint64_t)self, (void *)[a5 stillImageSettings], v6, objc_msgSend(a5, "portType"));
    -[BWPhotonicEngineNode _attemptDisparityReferenceFrameResolutionForSettings:portType:]((uint64_t)self, (void *)[a5 stillImageSettings], objc_msgSend(a5, "portType"));
    -[BWPhotonicEngineNode _deferredCaptureAddSecondaryStereoPhotoCaptureSampleBufferIfReadyForSettings:]((uint64_t)self, (void *)[a5 stillImageSettings]);
    if ([a3 type] == 6)
    {
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      uint64_t v9 = (void *)[(NSMutableDictionary *)self->_nrfProcessorInputsByPortType allValues];
      uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v16;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v16 != v12) {
              objc_enumerationMutation(v9);
            }
            CGRect v14 = *(void **)(*((void *)&v15 + 1) + 8 * i);
            objc_msgSend((id)objc_msgSend(v14, "firstObject"), "setFusionMode:", v6);
            -[BWPhotonicEngineNode _checkIfProcessingCompletedForNRFProcessorInput:]((unint64_t)self, (void *)[v14 firstObject]);
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
        }
        while (v11);
      }
    }
  }
}

- (uint64_t)_attemptDisparityReferenceFrameResolutionForSettings:(void *)a3 portType:
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    unint64_t v4 = result;
    __n128 result = -[BWPhotonicEngineNode _referenceOrClientBracketFrameEmissionNeededForSettings:portType:](result, a2, a3);
    if (result)
    {
      int v5 = objc_msgSend((id)objc_msgSend(*(id *)(v4 + 384), "objectForKeyedSubscript:", *(void *)(v4 + 152)), "intValue");
      if (v5 != 1
        && (int v6 = v5,
            __n128 result = objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureFlags"),
            (result & 0x1000) != 0))
      {
        if (v6 != 2) {
          return result;
        }
        CGRect v14 = *(void **)(v4 + 296);
        uint64_t v28 = (void *)[MEMORY[0x1E4F1CA48] array];
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        uint64_t v15 = [v14 countByEnumeratingWithState:&v33 objects:v38 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v34;
          CFStringRef v18 = (const __CFString *)*MEMORY[0x1E4F53070];
          uint64_t v19 = *MEMORY[0x1E4F542D8];
          do
          {
            for (uint64_t i = 0; i != v16; ++i)
            {
              if (*(void *)v34 != v17) {
                objc_enumerationMutation(v14);
              }
              uint64_t v21 = *(void *)(*((void *)&v33 + 1) + 8 * i);
              id v22 = (const void *)objc_msgSend((id)objc_msgSend(v14, "objectForKeyedSubscript:", v21), "objectForKeyedSubscript:", &unk_1EFB02540);
              uint64_t v23 = objc_msgSend((id)objc_msgSend(v14, "objectForKeyedSubscript:", v21), "objectForKeyedSubscript:", &unk_1EFB02558);
              if (v22) {
                BOOL v24 = v23 == 0;
              }
              else {
                BOOL v24 = 1;
              }
              if (!v24)
              {
                long long v25 = (const void *)v23;
                long long v26 = (void *)CMGetAttachment(v22, v18, 0);
                long long v27 = (void *)CMGetAttachment(v25, v18, 0);
                objc_msgSend(v27, "setObject:forKeyedSubscript:", objc_msgSend(v26, "objectForKeyedSubscript:", v19), v19);
                [v27 setObject:v26 forKeyedSubscript:@"EVZeroMetadata"];
                [v28 addObject:v21];
              }
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v33 objects:v38 count:16];
          }
          while (v16);
        }
        BOOL v7 = (void *)[MEMORY[0x1E4F1C978] arrayWithArray:v28];
        uint64_t v8 = 4;
      }
      else
      {
        BOOL v7 = (void *)[*(id *)(v4 + 296) allKeys];
        uint64_t v8 = 2;
      }
      __n128 result = [v7 count];
      if (result)
      {
        long long v31 = 0u;
        long long v32 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        __n128 result = [v7 countByEnumeratingWithState:&v29 objects:v37 count:16];
        if (result)
        {
          uint64_t v9 = result;
          uint64_t v10 = *(void *)v30;
          do
          {
            uint64_t v11 = 0;
            do
            {
              if (*(void *)v30 != v10) {
                objc_enumerationMutation(v7);
              }
              uint64_t v12 = *(void *)(*((void *)&v29 + 1) + 8 * v11);
              CFTypeRef v13 = (void *)[*(id *)(v4 + 296) objectForKeyedSubscript:v12];
              -[BWPhotonicEngineNode _emitOrEnqueueFusionReferenceFrameIfNeededForSampleBuffer:](v4, objc_msgSend(v13, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", v8)));
              [*(id *)(v4 + 296) setObject:0 forKeyedSubscript:v12];
              ++v11;
            }
            while (v9 != v11);
            __n128 result = [v7 countByEnumeratingWithState:&v29 objects:v37 count:16];
            uint64_t v9 = result;
          }
          while (result);
        }
      }
    }
  }
  return result;
}

- (uint64_t)_deferredCaptureAddSecondaryStereoPhotoCaptureSampleBufferIfReadyForSettings:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    __n128 result = objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureFlags");
    if ((result & 0x4000000000) != 0)
    {
      __n128 result = objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "deliverDeferredPhotoProxyImage");
      if (result)
      {
        if (*(void *)(v3 + 920))
        {
          __n128 result = objc_msgSend(*(id *)(v3 + 936), "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", 1));
          if (result)
          {
            unint64_t v4 = (const void *)result;
            int v5 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
            objc_msgSend(v5, "setObject:forKeyedSubscript:", CMGetAttachment(v4, @"OriginalCameraIntrinsicMatrix", 0), @"OriginalCameraIntrinsicMatrix");
            objc_msgSend(v5, "setObject:forKeyedSubscript:", CMGetAttachment(v4, @"OriginalCameraIntrinsicMatrixReferenceDimensions", 0), @"OriginalCameraIntrinsicMatrixReferenceDimensions");
            if ([v5 count]) {
              [*(id *)(v3 + 920) addDictionary:v5, objc_msgSend(NSString, "stringWithFormat:", @"%@-%@", BWDeferredIntermediateTagSampleBufferOriginalCameraIntrinsicsPrefix, BWSampleBufferGetPortType(v4)) tag];
            }
            [*(id *)(v3 + 920) addSensorRawSampleBuffer:v4];
            int v6 = *(void **)(v3 + 936);
            return [v6 removeAllObjects];
          }
        }
      }
    }
  }
  return result;
}

- (void)_checkIfProcessingCompletedForNRFProcessorInput:(unint64_t)a1
{
  if (a1)
  {
    unint64_t v4 = (void *)[a2 portType];
    int v5 = (void *)[a2 stillImageSettings];
    if (-[BWPhotonicEngineNode _referenceOrClientBracketFrameEmissionNeededForSettings:portType:](a1, v5, v4))
    {
      if (!-[BWPhotonicEngineNode _processingNeededForSettings:portType:](a1, v5, (uint64_t)v4)
        && [a2 receivedAllFrames]
        && [*(id *)(a1 + 376) objectForKeyedSubscript:v4])
      {
        int v6 = objc_msgSend((id)objc_msgSend(a2, "settings"), "captureRequestIdentifier");
        -[BWPhotonicEngineNode _processorControllerDidFinishProcessingInputForPortType:processorType:captureRequestIdentifier:](a1, (uint64_t)v4, 6, v6);
      }
    }
  }
}

- (void)processorControllerWillProcessInferences:(id)a3
{
  if ([a3 type] == 8)
  {
    inferenceControllerGroup = self->_inferenceControllerGroup;
    if (inferenceControllerGroup)
    {
      dispatch_group_wait(inferenceControllerGroup, 0xFFFFFFFFFFFFFFFFLL);
    }
  }
}

- (id)processorController:(id)a3 newInferencesForProcessorInput:(id)a4
{
  return [(BWPhotonicEngineNode *)self processorController:a3 newInferencesForProcessorInput:a4 inferenceInputBufferType:15];
}

- (id)processorController:(id)a3 newInferencesForProcessorInput:(id)a4 inferenceInputBufferType:(unint64_t)a5
{
  if (!_FigIsNotCurrentDispatchQueue()) {
    FigDebugAssert3();
  }
  BOOL v7 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3052000000;
  CGRect v14 = __Block_byref_object_copy__42;
  uint64_t v15 = __Block_byref_object_dispose__42;
  uint64_t v16 = 0;
  if (a5 <= 0x27 && ((1 << a5) & 0x9000008000) != 0)
  {
    inferenceControllerQueue = self->_inferenceControllerQueue;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __100__BWPhotonicEngineNode_processorController_newInferencesForProcessorInput_inferenceInputBufferType___block_invoke;
    v10[3] = &unk_1E5C2D7B8;
    v10[5] = &v11;
    void v10[6] = a5;
    v10[4] = self;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __ubn_dispatch_sync_block_invoke_0;
    block[3] = &unk_1E5C249F0;
    block[4] = v10;
    dispatch_sync(inferenceControllerQueue, block);
    BOOL v7 = (void *)v12[5];
  }
  _Block_object_dispose(&v11, 8);
  return v7;
}

id __100__BWPhotonicEngineNode_processorController_newInferencesForProcessorInput_inferenceInputBufferType___block_invoke(void *a1)
{
  uint64_t v2 = a1[6];
  uint64_t v3 = &OBJC_IVAR___BWPhotonicEngineNode__inferences;
  if (v2 == 39) {
    uint64_t v3 = &OBJC_IVAR___BWPhotonicEngineNode__stereoPhotoSecondaryInferences;
  }
  if (v2 == 36) {
    unint64_t v4 = &OBJC_IVAR___BWPhotonicEngineNode__quadraForEnhancedResolutionInferences;
  }
  else {
    unint64_t v4 = v3;
  }
  id result = *(id *)(a1[4] + *v4);
  *(void *)(*(void *)(a1[5] + 8) + 40) = result;
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
    uint64_t v13 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_jasperColorStillsExecutorInputByPortType, "objectForKeyedSubscript:", [a5 portType]);
    CMTime time = v17;
    [v13 setColorBufferPTS:&time exposureTime:v11];
    CGRect v14 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_jasperDisparityProcessorInputByPortType, "objectForKeyedSubscript:", [a5 portType]);
    CMTime time = v17;
    [v14 setColorBufferPTS:&time exposureTime:v11];
  }
  -[BWPhotonicEngineNode _emitOrEnqueueFusionReferenceFrameIfNeededForSampleBuffer:]((unint64_t)self, a4);
}

- (int)processorController:(id)a3 processRawErrorRecoveryFrameForProcessorInput:(id)a4 failureMetadata:(id)a5
{
  return -[BWPhotonicEngineNode _processRawErrorRecoveryFrameWithNRFProcessorInput:failureMetadata:]((uint64_t)self, a4, (uint64_t)a5);
}

- (uint64_t)_processRawErrorRecoveryFrameWithNRFProcessorInput:(uint64_t)a3 failureMetadata:
{
  uint64_t v4 = a1;
  if (!a1) {
    return v4;
  }
  if (_FigIsCurrentDispatchQueue())
  {
    if (!a2) {
      return 4294954516;
    }
  }
  else
  {
    uint64_t v13 = v3;
    LODWORD(v12) = 0;
    FigDebugAssert3();
    if (!a2) {
      return 4294954516;
    }
  }
  BOOL v7 = (const void *)objc_msgSend(*(id *)(v4 + 320), "objectForKeyedSubscript:", objc_msgSend(a2, "portType", v12, v13));
  if (!v7) {
    return 4294954516;
  }
  uint64_t v8 = v7;
  uint64_t v9 = (void *)CMGetAttachment(v7, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  [v9 addEntriesFromDictionary:a3];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __91__BWPhotonicEngineNode__processRawErrorRecoveryFrameWithNRFProcessorInput_failureMetadata___block_invoke;
  v14[3] = &unk_1E5C28E20;
  v14[4] = v4;
  void v14[5] = a2;
  v14[6] = v9;
  double v10 = -[BWSoftISPProcessorControllerInput initWithSettings:portType:gdcEnabled:]([BWSoftISPProcessorControllerInput alloc], "initWithSettings:portType:gdcEnabled:", [a2 stillImageSettings], objc_msgSend(a2, "portType"), -[BWPhotonicEngineNode _gdcSourceForSettings:portType:](v4, objc_msgSend(a2, "stillImageSettings"), objc_msgSend(a2, "portType")) == 3);
  [(BWStillImageProcessorControllerInput *)v10 addOutputSampleBufferRouter:v14 forBufferTypes:&unk_1EFB04AD8];
  [(BWSoftISPProcessorControllerInput *)v10 addFrame:v8 processingMode:1];
  uint64_t v4 = -[BWPhotonicEngineNode _enqueueSoftISPInput:](v4, v10);

  if (!v4) {
    objc_msgSend(a2, "setRemainingProcessingCount:", objc_msgSend(a2, "remainingProcessingCount") + 1);
  }
  return v4;
}

- (void)processorController:(id)a3 didDetermineReferenceFrame:(opaqueCMSampleBuffer *)a4 processorInput:(id)a5 err:(int)a6
{
  if (!_FigIsCurrentDispatchQueue()) {
    FigDebugAssert3();
  }
  uint64_t AttachedMedia = BWSampleBufferGetAttachedMedia(a4, 0x1EFA4EB60);
  if (AttachedMedia)
  {
    if (self->_smartStyleRenderingConfiguration)
    {
      double v10 = (const void *)AttachedMedia;
      if (BWIsSmartStyleCapture(self->_currentStillImageSettings))
      {
        BWPropagateZoomInformationToAttachedMediaSampleBuffer(a4, v10);
        CFTypeRef v11 = CMGetAttachment(a4, (CFStringRef)*MEMORY[0x1E4F53070], 0);
        uint64_t v12 = BWStillImageProcessingFlagsForSampleBuffer(a4);
        -[BWPhotonicEngineNode _attemptPiecemealEncodingForGainMapSbuf:primaryImageMetadata:processingFlags:portType:]((id *)&self->super.super.isa, v10, (uint64_t)v11, v12, (void *)[a5 portType]);
      }
    }
  }
  memset(&v17, 0, sizeof(v17));
  CMSampleBufferGetPresentationTimeStamp(&v17, a4);
  CFDictionaryRef v13 = CMCopyDictionaryOfAttachments((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a4, 1u);
  processorCoordinatorWorkerQueue = self->_processorCoordinatorWorkerQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __90__BWPhotonicEngineNode_processorController_didDetermineReferenceFrame_processorInput_err___block_invoke;
  v15[3] = &unk_1E5C270D8;
  void v15[4] = self;
  void v15[5] = a5;
  v15[6] = v13;
  CMTime v16 = v17;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __ubn_dispatch_async_block_invoke_0;
  block[3] = &unk_1E5C249F0;
  block[4] = v15;
  dispatch_async(processorCoordinatorWorkerQueue, block);
}

void __90__BWPhotonicEngineNode_processorController_didDetermineReferenceFrame_processorInput_err___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 432), "objectForKeyedSubscript:", objc_msgSend(*(id *)(a1 + 40), "portType"));
  [v2 setEvZeroReferenceFrameAttachments:*(void *)(a1 + 48)];
  long long v3 = *(_OWORD *)(a1 + 56);
  uint64_t v4 = *(void *)(a1 + 72);
  [v2 setEvZeroReferenceFramePTS:&v3];
}

- (void)processorController:(id)a3 didFinishProcessingInferenceBuffer:(__CVBuffer *)a4 metadata:(id)a5 inferenceAttachedMediaKey:(id)a6 processorInput:(id)a7 err:(int)a8
{
  block[16] = *MEMORY[0x1E4F143B8];
  if (!_FigIsCurrentDispatchQueue()) {
    FigDebugAssert3();
  }
  if (dword_1EB4C5670)
  {
    int v16 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (a4) {
    CFRetain(a4);
  }
  inferenceControllerQueue = self->_inferenceControllerQueue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __133__BWPhotonicEngineNode_processorController_didFinishProcessingInferenceBuffer_metadata_inferenceAttachedMediaKey_processorInput_err___block_invoke;
  v14[3] = &unk_1E5C285A0;
  v14[4] = self;
  void v14[5] = a5;
  v14[6] = a6;
  void v14[7] = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __ubn_dispatch_async_block_invoke_0;
  block[3] = &unk_1E5C249F0;
  block[4] = v14;
  dispatch_async(inferenceControllerQueue, block);
}

void __133__BWPhotonicEngineNode_processorController_didFinishProcessingInferenceBuffer_metadata_inferenceAttachedMediaKey_processorInput_err___block_invoke(void *a1)
{
  uint64_t v2 = *(void **)(a1[4] + 544);
  if (!v2)
  {
    *(void *)(a1[4] + 544) = objc_alloc_init(BWStillImageInferences);
    uint64_t v2 = *(void **)(a1[4] + 544);
  }
  [v2 addInferenceBuffer:a1[7] metadata:a1[5] inferenceAttachedMediaKey:a1[6]];
  long long v3 = (const void *)a1[7];
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
  inferenceControllerQueue = self->_inferenceControllerQueue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __115__BWPhotonicEngineNode_processorController_didFinishProcessingInference_inferenceAttachmentKey_processorInput_err___block_invoke;
  v12[3] = &unk_1E5C248A0;
  v12[4] = self;
  void v12[5] = a4;
  void v12[6] = a5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __ubn_dispatch_async_block_invoke_0;
  block[3] = &unk_1E5C249F0;
  block[4] = v12;
  dispatch_async(inferenceControllerQueue, block);
}

uint64_t __115__BWPhotonicEngineNode_processorController_didFinishProcessingInference_inferenceAttachmentKey_processorInput_err___block_invoke(void *a1)
{
  uint64_t v2 = *(void **)(a1[4] + 544);
  if (!v2)
  {
    *(void *)(a1[4] + 544) = objc_alloc_init(BWStillImageInferences);
    uint64_t v2 = *(void **)(a1[4] + 544);
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
  inferenceControllerQueue = self->_inferenceControllerQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __109__BWPhotonicEngineNode_processorController_didFinishProcessingInferenceAttachedMediaMetadata_processorInput___block_invoke;
  v9[3] = &unk_1E5C248A0;
  v9[4] = self;
  void v9[5] = a4;
  void v9[6] = a5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __ubn_dispatch_async_block_invoke_0;
  block[3] = &unk_1E5C249F0;
  block[4] = v9;
  dispatch_async(inferenceControllerQueue, block);
}

void __109__BWPhotonicEngineNode_processorController_didFinishProcessingInferenceAttachedMediaMetadata_processorInput___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 544);
  if (!v2)
  {
    *(void *)(*(void *)(a1 + 32) + 544) = objc_alloc_init(BWStillImageInferences);
    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 544);
  }
  [v2 addInferenceAttachedMediaMetadata:*(void *)(a1 + 40)];
  if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "captureSettings"), "captureType") == 12)
  {
    uint64_t v3 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 432), "objectForKeyedSubscript:", objc_msgSend(*(id *)(a1 + 48), "portType"));
    uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 176);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __109__BWPhotonicEngineNode_processorController_didFinishProcessingInferenceAttachedMediaMetadata_processorInput___block_invoke_2;
    v6[3] = &unk_1E5C24458;
    uint64_t v5 = *(void *)(a1 + 40);
    v6[4] = v3;
    v6[5] = v5;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __ubn_dispatch_async_block_invoke_0;
    block[3] = &unk_1E5C249F0;
    block[4] = v6;
    dispatch_async(v4, block);
  }
}

uint64_t __109__BWPhotonicEngineNode_processorController_didFinishProcessingInferenceAttachedMediaMetadata_processorInput___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) allKeys];
  uint64_t v3 = *(void **)(a1 + 32);
  return [v3 setProvidedInferenceAttachedMedia:v2];
}

- (void)processorController:(id)a3 didFinishProcessingBuffer:(__CVBuffer *)a4 metadata:(id)a5 type:(unint64_t)a6 captureFrameFlags:(unint64_t)a7 processorInput:(id)a8 err:(int)a9
{
  id v9 = a8;
  block[16] = *(CMAttachmentBearerRef *)MEMORY[0x1E4F143B8];
  if (dword_1EB4C5670)
  {
    int v41 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    id v9 = a8;
  }
  if (a9)
  {
    FigDebugAssert3();
  }
  else
  {
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "settings"), "captureRequestIdentifier"), "isEqualToString:", self->_currentCaptureRequestIdentifier);
    if (a6 == 19
      || objc_msgSend((id)objc_msgSend(v9, "captureSettings"), "captureType") == 12
      || (objc_msgSend((id)objc_msgSend(v9, "captureSettings"), "captureFlags") & 0x80) != 0)
    {
      uint64_t v16 = objc_msgSend(a3, "type", v30, v32);
      if (v16 == 5)
      {
        if (!_FigIsCurrentDispatchQueue())
        {
          uint64_t v33 = v34;
          LODWORD(v31) = 0;
          FigDebugAssert3();
        }
        if (objc_msgSend((id)objc_msgSend(v9, "captureSettings", v31, v33), "captureType") == 12)
        {
          if (a4) {
            CFRetain(a4);
          }
          processorCoordinatorWorkerQueue = self->_processorCoordinatorWorkerQueue;
          v37[0] = MEMORY[0x1E4F143A8];
          v37[1] = 3221225472;
          v37[2] = __121__BWPhotonicEngineNode_processorController_didFinishProcessingBuffer_metadata_type_captureFrameFlags_processorInput_err___block_invoke;
          v37[3] = &unk_1E5C270D8;
          v37[4] = self;
          v37[5] = v9;
          v37[6] = a5;
          v37[7] = a4;
          v37[8] = a6;
          v37[9] = a7;
          block[0] = (CMAttachmentBearerRef)MEMORY[0x1E4F143A8];
          block[1] = (CMAttachmentBearerRef)3221225472;
          block[2] = __ubn_dispatch_async_block_invoke_0;
          block[3] = &unk_1E5C249F0;
          block[4] = v37;
          dispatch_async(processorCoordinatorWorkerQueue, block);
        }
      }
      else if (v16 == 6)
      {
        if (!_FigIsCurrentDispatchQueue())
        {
          uint64_t v33 = v34;
          LODWORD(v31) = 0;
          FigDebugAssert3();
        }
        CMTime v17 = objc_msgSend(v9, "referenceFrame", v31, v33);
        if (a6 == 19 && ![a5 count])
        {
          if (self->_smartStyleRenderingConfiguration && BWIsSmartStyleCapture(self->_currentStillImageSettings))
          {
            block[0] = 0;
            if (BWSampleBufferCreateAttachedMediaFromPixelBuffer((opaqueCMSampleBuffer *)v17, 0x1EFA4EB60, a4, (CFTypeRef *)&self->_gainMapFormatDescription, 0, 0, 1, block))
            {
              FigDebugAssert3();
            }
            else
            {
              CFTypeRef v28 = CMGetAttachment(v17, (CFStringRef)*MEMORY[0x1E4F53070], 0);
              uint64_t v29 = BWStillImageProcessingFlagsForSampleBuffer(v17);
              -[BWPhotonicEngineNode _attemptPiecemealEncodingForGainMapSbuf:primaryImageMetadata:processingFlags:portType:]((id *)&self->super.super.isa, block[0], (uint64_t)v28, v29, (void *)[v9 portType]);
            }
            if (block[0]) {
              CFRelease(block[0]);
            }
          }
        }
        else if (objc_msgSend((id)objc_msgSend(v9, "captureSettings"), "deliverDeferredPhotoProxyImage"))
        {
          if (a6 == 8)
          {
            if ((objc_msgSend((id)objc_msgSend(v9, "captureSettings"), "captureFlags") & 4) != 0)
            {
              uint64_t v20 = &BWDeferredIntermediateTagSyntheticReferenceFrameMetadataByPortTypePrefix;
              id v18 = a5;
              uint64_t v19 = a5;
            }
            else
            {
              id v18 = a5;
              uint64_t v19 = (void *)CMGetAttachment(v17, (CFStringRef)*MEMORY[0x1E4F53070], 0);
              uint64_t v20 = &BWDeferredIntermediateTagReferenceFrameMetadataByPortTypePrefix;
            }
            -[BWDeferredCaptureControllerInput addDictionary:tag:](self->_deferredCaptureControllerInput, "addDictionary:tag:", v19, [NSString stringWithFormat:@"%@-%@", *v20, objc_msgSend(v9, "portType")]);
            a5 = v18;
          }
          if (a4
            && (a6 != 19
             || (objc_msgSend((id)objc_msgSend(v9, "captureStreamSettings"), "captureFlags") & 0x100000000) == 0))
          {
            -[BWPhotonicEngineNode _deferredCaptureAddBuffer:bufferType:captureFrameFlags:metadata:rawThumbnailsBuffer:rawThumbnailsMetadata:portType:]((uint64_t)self, (uint64_t)a4, a6, 0, (uint64_t)a5, 0, 0, (void *)[v9 portType]);
          }
        }
        else if (objc_msgSend((id)objc_msgSend(v9, "captureSettings"), "captureType") == 12)
        {
          id v22 = a5;
          uint64_t v23 = -[NSMutableDictionary objectForKeyedSubscript:](self->_deepFusionProcessorInputByPortType, "objectForKeyedSubscript:", [v9 portType]);
          unint64_t v24 = a6;
          long long v25 = (void *)v23;
          unint64_t v26 = v24;
          if (v24 == 8)
          {
            CFDictionaryRef v27 = CMCopyDictionaryOfAttachments((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v17, 1u);
            [v25 setEvZeroReferenceFrameAttachments:v27];
            CMSampleBufferGetPresentationTimeStamp(&v39, (CMSampleBufferRef)v17);
            CMTime v38 = v39;
            [v25 setEvZeroReferenceFramePTS:&v38];
          }
          [v25 addBuffer:a4 metadata:v22 bufferType:v26 captureFrameFlags:a7];
        }
      }
    }
  }
}

void __121__BWPhotonicEngineNode_processorController_didFinishProcessingBuffer_metadata_type_captureFrameFlags_processorInput_err___block_invoke(uint64_t a1)
{
  objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 432), "objectForKeyedSubscript:", objc_msgSend(*(id *)(a1 + 40), "portType")), "addBuffer:metadata:bufferType:captureFrameFlags:", *(void *)(a1 + 56), *(void *)(a1 + 48), *(void *)(a1 + 64), *(void *)(a1 + 72));
  uint64_t v2 = *(const void **)(a1 + 56);
  if (v2)
  {
    CFRelease(v2);
  }
}

- (void)processorController:(id)a3 willProcessRedEyeReductionForProcessorInput:(id)a4
{
  if (-[BWPhotonicEngineNode _isSWFRFlashCapture:]((unint64_t)self, objc_msgSend(a4, "stillImageSettings", a3)))
  {
    uint64_t v6 = -[NSMutableDictionary objectForKeyedSubscript:](self->_swfrRawRedEyeReductionAuxImageByPortType, "objectForKeyedSubscript:", [a4 portType]);
    if (!v6
      || (uint64_t v7 = v6,
          v8 = -[BWSoftISPProcessorControllerInput initWithSettings:portType:]([BWSoftISPProcessorControllerInput alloc], "initWithSettings:portType:", [a4 stillImageSettings], objc_msgSend(a4, "portType")), id v9 = -[BWPhotonicEngineNode _ubRERRouter](self), -[BWStillImageProcessorControllerInput addOutputSampleBufferRouter:forBufferTypes:](v8, "addOutputSampleBufferRouter:forBufferTypes:", v9, -[BWPhotonicEngineNode _bufferTypesForCaptureSettings:]((uint64_t)self, objc_msgSend((id)objc_msgSend(a4, "stillImageSettings"), "captureSettings"))), objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_softISPRemainingInputsByPortType, "objectForKeyedSubscript:", objc_msgSend(a4, "portType")), "addObject:", v8),
          LODWORD(v9) = -[BWPhotonicEngineNode _enqueueSoftISPInput:]((uint64_t)self, v8),
          v8,
          v9))
    {
      id v12 = [(BWStillImageProcessorCoordinator *)self->_processorCoordinator controllerForType:4];
      [v12 cancelProcessing];
    }
    else
    {
      [(BWSoftISPProcessorControllerInput *)v8 addFrame:v7 processingMode:2];
      swfrRawRedEyeReductionAuxImageByPortType = self->_swfrRawRedEyeReductionAuxImageByPortType;
      uint64_t v11 = [a4 portType];
      [(NSMutableDictionary *)swfrRawRedEyeReductionAuxImageByPortType setObject:0 forKeyedSubscript:v11];
    }
  }
}

- (unint64_t)_isSWFRFlashCapture:(unint64_t)result
{
  if (result)
  {
    if (*(void *)(result + 600)
      && objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureType") == 2)
    {
      return ((unint64_t)objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureFlags") >> 3) & 1;
    }
    else
    {
      return 0;
    }
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
      if ([a2 deliverDeferredPhotoProxyImage]
        && ([a2 captureFlags] & 0x80) != 0)
      {
        uint64_t v3 = &unk_1EFB04CB8;
      }
      else
      {
        uint64_t v3 = &unk_1EFB04CD0;
      }
      break;
    case 2u:
    case 6u:
    case 7u:
      uint64_t v3 = &unk_1EFB04CE8;
      break;
    case 0xAu:
      uint64_t v3 = &unk_1EFB04D00;
      break;
    case 0xBu:
      if (([a2 captureFlags] & 0x800000000) != 0) {
        uint64_t v3 = &unk_1EFB04D18;
      }
      else {
        uint64_t v3 = &unk_1EFB04D30;
      }
      break;
    case 0xCu:
      if ([a2 deliverDeferredPhotoProxyImage]) {
        uint64_t v3 = &unk_1EFB04D48;
      }
      else {
        uint64_t v3 = &unk_1EFB04D60;
      }
      break;
    default:
      break;
  }
  if (![a2 deliverOriginalImage]) {
    return v3;
  }
  uint64_t v4 = (void *)[MEMORY[0x1E4F1CA48] arrayWithArray:v3];
  [v4 addObject:&unk_1EFB02558];
  uint64_t v5 = (void *)[v4 copy];
  return v5;
}

- (uint64_t)_enqueueSoftISPInput:(uint64_t)result
{
  if (result)
  {
    uint64_t v4 = result;
    if (!_FigIsCurrentDispatchQueue())
    {
      uint64_t v9 = v2;
      LODWORD(v8) = 0;
      FigDebugAssert3();
    }
    uint64_t v5 = objc_msgSend(*(id *)(v4 + 288), "objectForKeyedSubscript:", objc_msgSend(a2, "portType", v8, v9));
    if (v5) {
      uint64_t v6 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v5, "intValue") + 1);
    }
    else {
      uint64_t v6 = &unk_1EFB02630;
    }
    objc_msgSend(*(id *)(v4 + 288), "setObject:forKeyedSubscript:", v6, objc_msgSend(a2, "portType"));
    uint64_t v7 = (void *)[*(id *)(v4 + 168) controllerForType:12];
    if (v7)
    {
      return [v7 enqueueInputForProcessing:a2 delegate:v4];
    }
    else
    {
      return 4294950488;
    }
  }
  return result;
}

- (id)adaptiveBracketingParametersForDigitalFlashMode:(int)a3 frameStatistics:(id)a4 stationary:(BOOL)a5 sphereOffsetEnabled:(BOOL)a6 detectedObjects:(id)a7
{
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3052000000;
  CMTime v17 = __Block_byref_object_copy__42;
  id v18 = __Block_byref_object_dispose__42;
  uint64_t v19 = 0;
  processorCoordinatorWorkerQueue = self->_processorCoordinatorWorkerQueue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __135__BWPhotonicEngineNode_adaptiveBracketingParametersForDigitalFlashMode_frameStatistics_stationary_sphereOffsetEnabled_detectedObjects___block_invoke;
  v10[3] = &unk_1E5C28D58;
  int v11 = a3;
  v10[4] = self;
  v10[5] = a4;
  BOOL v12 = a5;
  BOOL v13 = a6;
  void v10[6] = a7;
  void v10[7] = &v14;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __ubn_dispatch_sync_block_invoke_0;
  block[3] = &unk_1E5C249F0;
  block[4] = v10;
  dispatch_sync(processorCoordinatorWorkerQueue, block);
  id v8 = (id)v15[5];
  _Block_object_dispose(&v14, 8);
  return v8;
}

id __135__BWPhotonicEngineNode_adaptiveBracketingParametersForDigitalFlashMode_frameStatistics_stationary_sphereOffsetEnabled_detectedObjects___block_invoke(uint64_t a1)
{
  -[BWPhotonicEngineNode _setupProcessorCoordinator](*(void *)(a1 + 32));
  id result = (id)objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 168), "controllerForType:", 6), "adaptiveBracketingParametersForDigitalFlashMode:frameStatistics:stationary:sphereOffsetEnabled:detectedObjects:", *(unsigned int *)(a1 + 64), *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 68), *(unsigned __int8 *)(a1 + 69), *(void *)(a1 + 48));
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = result;
  return result;
}

- (void)stopAdaptiveBracketingForSettings:(id)a3 withGroup:(int)a4
{
  processorCoordinatorWorkerQueue = self->_processorCoordinatorWorkerQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __68__BWPhotonicEngineNode_stopAdaptiveBracketingForSettings_withGroup___block_invoke;
  v5[3] = &unk_1E5C262A0;
  v5[4] = self;
  int v6 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __ubn_dispatch_async_block_invoke_0;
  block[3] = &unk_1E5C249F0;
  block[4] = v5;
  dispatch_async(processorCoordinatorWorkerQueue, block);
}

uint64_t __68__BWPhotonicEngineNode_stopAdaptiveBracketingForSettings_withGroup___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 368), "allValues", 0);
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

id __100__BWPhotonicEngineNode_adaptiveBracketingDigitalFlashTotalIntegrationTimesProviderForPortType_wait___block_invoke(uint64_t *a1)
{
  -[BWPhotonicEngineNode _setupProcessorCoordinator](a1[4]);
  id result = (id)objc_msgSend((id)objc_msgSend(*(id *)(a1[4] + 168), "controllerForType:", 6), "adaptiveBracketingDigitalFlashTotalIntegrationTimesProviderForPortType:", a1[5]);
  *(void *)(*(void *)(a1[6] + 8) + 40) = result;
  return result;
}

- (uint64_t)_inferenceOutputPixelBufferPoolForAttachedMediaKey:(uint64_t)result
{
  if (!result) {
    return result;
  }
  uint64_t v2 = a2;
  uint64_t v3 = result;
  if ([(__CFString *)a2 isEqualToString:0x1EFA6A680])
  {
    if ([*(id *)(v3 + 704) type] == 3)
    {
      uint64_t v4 = &OBJC_IVAR___BWPhotonicEngineNode__deepZoomTransferEnhancedResolutionOutputPool;
      goto LABEL_7;
    }
    uint64_t v2 = @"PrimaryFormat";
  }
  else if ([(__CFString *)v2 isEqualToString:0x1EFA6A6A0])
  {
    uint64_t v4 = &OBJC_IVAR___BWPhotonicEngineNode__stereoPhotoOutputPool;
LABEL_7:
    id result = *(void *)(v3 + *v4);
    if (result) {
      return result;
    }
  }
  uint64_t v5 = (void *)[*(id *)(v3 + 16) mediaPropertiesForAttachedMediaKey:v2];
  id result = [v5 livePixelBufferPool];
  if (!result)
  {
    id result = [v5 preparedPixelBufferPool];
    if (!result)
    {
      uint64_t v6 = *(void **)(v3 + 536);
      return [v6 objectForKeyedSubscript:v2];
    }
  }
  return result;
}

- (id)preparedOutputPixelBufferPoolForAttachedMediaKey:(id)a3 format:(id)a4
{
  return (id)-[BWPhotonicEngineNode _inferenceOutputPixelBufferPoolForAttachedMediaKey:]((uint64_t)self, (__CFString *)a3);
}

- (uint64_t)_flushSoftISPOutputBufferPools
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    long long v8 = 0u;
    long long v9 = 0u;
    long long v6 = 0u;
    long long v7 = 0u;
    uint64_t v2 = *(void **)(result + 272);
    id result = [v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
    if (result)
    {
      uint64_t v3 = result;
      uint64_t v4 = *(void *)v7;
      do
      {
        uint64_t v5 = 0;
        do
        {
          if (*(void *)v7 != v4) {
            objc_enumerationMutation(v2);
          }
          objc_msgSend((id)objc_msgSend(*(id *)(v1 + 272), "objectForKeyedSubscript:", *(void *)(*((void *)&v6 + 1) + 8 * v5++)), "flushToMinimumCapacity:", 0);
        }
        while (v3 != v5);
        id result = [v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
        uint64_t v3 = result;
      }
      while (result);
    }
  }
  return result;
}

- (uint64_t)_flushUltraHighResolutionBufferPools
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = (void *)[*(id *)(result + 304) objectForKeyedSubscript:&unk_1EFB024E0];
    long long v6 = 0u;
    long long v7 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    id result = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    if (result)
    {
      uint64_t v2 = result;
      uint64_t v3 = *(void *)v7;
      do
      {
        uint64_t v4 = 0;
        do
        {
          if (*(void *)v7 != v3) {
            objc_enumerationMutation(v1);
          }
          uint64_t v5 = (void *)[v1 objectForKeyedSubscript:*(void *)(*((void *)&v6 + 1) + 8 * v4)];
          if (v5) {
            [v5 flushToMinimumCapacity:0];
          }
          ++v4;
        }
        while (v2 != v4);
        id result = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
        uint64_t v2 = result;
      }
      while (result);
    }
  }
  return result;
}

- (uint64_t)_nrfProcessorInputNeededForSettings:(uint64_t)a3 portType:
{
  if (result)
  {
    uint64_t v5 = result;
    id result = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureStreamSettingsForPortType:", a3), "hasValidFrames");
    if (result)
    {
      id result = [*(id *)(v5 + 120) containsObject:a3];
      if (result)
      {
        if (objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureType") == 12
          && (objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "deliverDeferredPhotoProxyImage") & 1) == 0)
        {
          return objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "learnedNRStereoPhotoFrameFlag") != 0;
        }
        else
        {
          return -[BWPhotonicEngineNode _processingNeededForSettings:portType:](v5, a2, a3);
        }
      }
    }
  }
  return result;
}

- (uint64_t)_deepFusionProcessorInputNeededForSettings:(uint64_t)a3 portType:
{
  if (!a1
    || !objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureStreamSettingsForPortType:", a3), "hasValidFrames")|| !objc_msgSend(*(id *)(a1 + 120), "containsObject:", a3)|| objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureType") != 12|| (objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "deliverDeferredPhotoProxyImage") & 1) != 0)
  {
    return 0;
  }
  if (objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "learnedNRStereoPhotoFrameFlag"))
  {
    long long v6 = objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "masterPortType");
    return [v6 isEqualToString:a3];
  }
  else
  {
    return -[BWPhotonicEngineNode _processingNeededForSettings:portType:](a1, a2, a3);
  }
}

- (BOOL)_generateDisparityForSettings:(BOOL)result
{
  if (result) {
    return *(void *)(result + 776)
  }
        && (objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureFlags") & 0x800) != 0
        && (objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureFlags") & 0x200) == 0;
  return result;
}

void __73__BWPhotonicEngineNode__handleClientBracketFrameEmissionForSampleBuffer___block_invoke(uint64_t a1, CFTypeRef cf)
{
  if (cf) {
    CFRetain(cf);
  }
  long long v4 = *(_OWORD *)(a1 + 32);
  uint64_t v5 = *(NSObject **)(*(void *)(a1 + 32) + 800);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __73__BWPhotonicEngineNode__handleClientBracketFrameEmissionForSampleBuffer___block_invoke_2;
  v6[3] = &unk_1E5C249A0;
  long long v7 = v4;
  CFTypeRef v8 = cf;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __ubn_dispatch_async_block_invoke_0;
  block[3] = &unk_1E5C249F0;
  block[4] = v6;
  dispatch_async(v5, block);
}

void __73__BWPhotonicEngineNode__handleClientBracketFrameEmissionForSampleBuffer___block_invoke_2(void *a1)
{
  objc_msgSend((id)objc_msgSend(*(id *)(a1[4] + 816), "objectForKeyedSubscript:", a1[5]), "addSampleBuffer:", a1[6]);
  uint64_t v2 = (const void *)a1[6];
  if (v2)
  {
    CFRelease(v2);
  }
}

void __73__BWPhotonicEngineNode__handleClientBracketFrameEmissionForSampleBuffer___block_invoke_192(uint64_t a1)
{
  [*(id *)(a1 + 32) addSampleBuffer:*(void *)(a1 + 40)];
  uint64_t v2 = *(const void **)(a1 + 40);
  if (v2)
  {
    CFRelease(v2);
  }
}

void __82__BWPhotonicEngineNode__emitOrEnqueueFusionReferenceFrameIfNeededForSampleBuffer___block_invoke(uint64_t a1, CFTypeRef cf, uint64_t a3, uint64_t a4)
{
  if (cf) {
    CFRetain(cf);
  }
  uint64_t v7 = *(void *)(a1 + 32);
  CFTypeRef v8 = *(NSObject **)(v7 + 800);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __82__BWPhotonicEngineNode__emitOrEnqueueFusionReferenceFrameIfNeededForSampleBuffer___block_invoke_2;
  v9[3] = &unk_1E5C249A0;
  void v9[5] = v7;
  void v9[6] = cf;
  v9[4] = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __ubn_dispatch_async_block_invoke_0;
  block[3] = &unk_1E5C249F0;
  block[4] = v9;
  dispatch_async(v8, block);
}

void __82__BWPhotonicEngineNode__emitOrEnqueueFusionReferenceFrameIfNeededForSampleBuffer___block_invoke_2(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (dword_1EB4C5670)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(*(id *)(*(void *)(a1 + 40) + 784), "addSampleBuffer:", *(void *)(a1 + 48), v4, v5);
  uint64_t v3 = *(const void **)(a1 + 48);
  if (v3) {
    CFRelease(v3);
  }
}

void __91__BWPhotonicEngineNode__processRawErrorRecoveryFrameWithNRFProcessorInput_failureMetadata___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (!_FigIsCurrentDispatchQueue())
  {
    uint64_t v20 = v5;
    LODWORD(v18) = 0;
    FigDebugAssert3();
  }
  long long v9 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 168), "controllerForType:", 6, v18, v20);
  if (a5) {
    goto LABEL_9;
  }
  [*(id *)(a1 + 40) setProcessedRawErrorRecoveryFrame:a2];
  unint64_t v11 = *(void *)(a1 + 32);
  long long v10 = *(void **)(a1 + 40);
  char v12 = -[BWPhotonicEngineNode _isInferenceInputImageRequiredForSettings:portType:](v11, (void *)[v10 stillImageSettings], objc_msgSend(v10, "portType"));
  uint64_t v13 = *(void *)(a1 + 32);
  uint64_t v14 = (void *)[*(id *)(a1 + 40) stillImageSettings];
  if (v13)
  {
    if (*(void *)(v13 + 824)) {
      LOBYTE(v13) = BWIsSmartStyleCapture(v14);
    }
    else {
      LOBYTE(v13) = 0;
    }
  }
  HIBYTE(v19) = -[BWPhotonicEngineNode _inferencesRequiredByProcessorControllersForSettings:](*(void *)(a1 + 32), (void *)[*(id *)(a1 + 40) stillImageSettings]);
  BYTE6(v19) = v13;
  BYTE5(v19) = v12;
  BYTE4(v19) = 0;
  LODWORD(v19) = 0;
  a5 = objc_msgSend(v9, "enqueueInputForProcessing:delegate:processErrorRecoveryFrame:processOriginalImage:processToneMapping:processInferenceInputImage:clientBracketSequenceNumber:processSemanticRendering:provideInferenceInputImageForProcessing:processSmartStyleRenderingInput:inferencesAvailable:", v10, v11, 1, 0, 0, 0, v19);
  if (a5)
  {
LABEL_9:
    [*(id *)(a1 + 32) processorController:v9 didFinishProcessingInput:*(void *)(a1 + 40) err:a5];
    uint64_t v15 = *(void *)(a1 + 32);
    uint64_t v16 = [*(id *)(a1 + 40) stillImageSettings];
    uint64_t v17 = *(void *)(a1 + 48);
    [*(id *)(a1 + 40) description];
    -[BWPhotonicEngineNode _emitError:stillImageSettings:metadata:description:](v15, a5, v16, v17);
  }
}

- (unint64_t)_isInferenceInputImageRequiredForSettings:(uint64_t)a3 portType:
{
  if (result)
  {
    unint64_t v5 = result;
    if (objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "learnedNRStereoPhotoFrameFlag"))
    {
      return objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "masterPortType"), "isEqualToString:", a3) ^ 1;
    }
    else
    {
      id result = -[BWPhotonicEngineNode _inferenceGenerationRequiredForSettings:](v5, a2);
      if (result)
      {
        if (*(void *)(v5 + 640)
          && (objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureFlags") & 0x10000) != 0)
        {
          return -[BWPhotonicEngineNode _isSWFRFlashCapture:](v5, a2);
        }
        else
        {
          return 1;
        }
      }
    }
  }
  return result;
}

- (uint64_t)_inferencesRequiredByProcessorControllersForSettings:(uint64_t)result
{
  if (result)
  {
    unint64_t v3 = result;
    int v4 = -[BWPhotonicEngineNode _isSemanticRenderingCapture:](result, a2);
    if (-[BWPhotonicEngineNode _isSWFRFlashCapture:](v3, a2)) {
      BOOL v5 = objc_msgSend((id)objc_msgSend(*(id *)(v3 + 488), "swfrInferenceMasks"), "count") != 0;
    }
    else {
      BOOL v5 = 0;
    }
    if (*(void *)(v3 + 640)) {
      unint64_t v6 = ((unint64_t)objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureFlags") >> 16) & 1;
    }
    else {
      LODWORD(v6) = 0;
    }
    BOOL v7 = -[BWPhotonicEngineNode _isSemanticStylesCaptureNeedingInferencesWithSettings:](v3, a2);
    return v4 | v5 | v6 | v7 | -[BWPhotonicEngineNode _isSmartStylesCaptureNeedingInferencesWithSettings:](v3, a2);
  }
  return result;
}

- (uint64_t)_gdcSourceForSettings:(uint64_t)a3 portType:
{
  if (result)
  {
    unint64_t v5 = result;
    id result = objc_msgSend((id)objc_msgSend(*(id *)(result + 656), "portTypesWithGeometricDistortionCorrectionEnabled"), "containsObject:", a3);
    if (result)
    {
      unint64_t v6 = objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureStreamSettingsForPortType:", a3);
      uint64_t v7 = *(void *)(v5 + 264);
      char v8 = [v6 captureFlags];
      uint64_t v9 = [v6 captureFlags];
      int v10 = [v6 captureType];
      int v11 = -[BWPhotonicEngineNode _isSWFRFlashCapture:](v5, a2);
      char v12 = [v6 captureFlags];
      int v13 = -[BWPhotonicEngineNodeConfiguration stillImageGDCSourceMode](*(void *)(v5 + 112));
      BOOL v14 = !v7 || v13 == 1;
      id result = v14 ? 2 : 0;
      if (!v14 && (v8 & 4) != 0)
      {
        if (v12 < 0) {
          unsigned int v15 = 2;
        }
        else {
          unsigned int v15 = 3;
        }
        if (v11) {
          unsigned int v15 = 2;
        }
        if (v10 == 12) {
          unsigned int v15 = 2;
        }
        if ((v9 & 0x800000000) != 0) {
          return 2;
        }
        else {
          return v15;
        }
      }
    }
  }
  return result;
}

- (uint64_t)_handleDeferredCaptureProxyOrErrorRecoverySampleBuffer:(uint64_t)result bufferType:(CFTypeRef)cf
{
  if (result)
  {
    uint64_t v2 = result;
    if (*(void *)(result + 920) && cf)
    {
      int v4 = *(const void **)(result + 928);
      if (v4)
      {
        CFRelease(v4);
        *(void *)(v2 + 928) = 0;
      }
      *(void *)(v2 + 928) = CFRetain(cf);
      if (dword_1EB4C5670)
      {
        os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      objc_msgSend(*(id *)(v2 + 920), "proxyReadyWithFPNREnabled:", objc_msgSend((id)objc_msgSend((id)CMGetAttachment(cf, (CFStringRef)*MEMORY[0x1E4F53070], 0), "objectForKeyedSubscript:", *MEMORY[0x1E4F53278]), "BOOLValue"));
      return 0;
    }
    else
    {
      unint64_t v6 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      return 4294954516;
    }
  }
  return result;
}

- (void)_waitForAndMergeInferencesIfNeededForSampleBuffer:(void *)a3 processorInput:
{
  if (a1)
  {
    if (!_FigIsNotCurrentDispatchQueue())
    {
      uint64_t v12 = v3;
      LODWORD(v11) = 0;
      FigDebugAssert3();
    }
    if ((objc_msgSend((id)CMGetAttachment(a2, @"NonProcessedReferenceFrame", 0), "BOOLValue") & 1) == 0
      && (-[BWPhotonicEngineNodeConfiguration generateInferencesForSemanticProcessingIfNeeded](a1[14])
       || [(id)a1[14] deferredPhotoProcessorEnabled]))
    {
      char v7 = -[BWPhotonicEngineNode _isSemanticRenderingCapture:]((uint64_t)a1, objc_msgSend(a3, "stillImageSettings", v11, v12));
      int v8 = -[BWPhotonicEngineNode _provideInferenceAttachedMediaWithSettings:]((uint64_t)a1, (void *)[a3 stillImageSettings]);
      if ((v7 & 1) != 0 || v8)
      {
        if (-[BWPhotonicEngineNodeConfiguration generateInferencesForSemanticProcessingIfNeeded](a1[14]))
        {
          uint64_t v9 = a1[64];
          if (!v9) {
            return;
          }
          dispatch_group_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
        }
        int v10 = a1[63];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __89__BWPhotonicEngineNode__waitForAndMergeInferencesIfNeededForSampleBuffer_processorInput___block_invoke;
        block[3] = &unk_1E5C249A0;
        void block[5] = a1;
        block[6] = a2;
        block[4] = a3;
        dispatch_sync(v10, block);
      }
    }
  }
}

- (id)_ubInferenceInputRouter
{
  if (result)
  {
    v1[0] = MEMORY[0x1E4F143A8];
    v1[1] = 3221225472;
    v1[2] = __47__BWPhotonicEngineNode__ubInferenceInputRouter__block_invoke;
    v1[3] = &unk_1E5C28D80;
    v1[4] = result;
    return (id)[v1 copy];
  }
  return result;
}

- (id)_standardNROutputRouterWithExpectedQueue:(id)result
{
  if (result)
  {
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __65__BWPhotonicEngineNode__standardNROutputRouterWithExpectedQueue___block_invoke;
    v2[3] = &unk_1E5C28E48;
    v2[4] = a2;
    v2[5] = result;
    return (id)[v2 copy];
  }
  return result;
}

- (uint64_t)_setupProcessingStateForJasperDisparityIfNeededWithSettings:(void *)a3 processingPlan:
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v6 = result;
    if (!_FigIsCurrentDispatchQueue())
    {
      uint64_t v26 = v3;
      LODWORD(v25) = 0;
      FigDebugAssert3();
    }
    if ((objc_msgSend((id)objc_msgSend(a2, "captureSettings", v25, v26), "captureFlags") & 0x200) != 0
      && *(void *)(v6 + 896))
    {
      uint64_t v7 = [*(id *)(v6 + 168) controllerForType:13];
      if (v7)
      {
        int v8 = (void *)v7;
        id v35 = -[BWPhotonicEngineNode _bufferTypesForCaptureSettings:](v6, (void *)[a2 captureSettings]);
        v48[0] = MEMORY[0x1E4F143A8];
        v48[1] = 3221225472;
        v48[2] = __99__BWPhotonicEngineNode__setupProcessingStateForJasperDisparityIfNeededWithSettings_processingPlan___block_invoke;
        v48[3] = &unk_1E5C28E48;
        CFDictionaryRef v27 = v8;
        uint64_t v28 = v6;
        v48[4] = v6;
        v48[5] = v8;
        id v33 = (id)[MEMORY[0x1E4F1CA48] array];
        long long v44 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        obuint64_t j = (id)objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "portTypes");
        uint64_t v32 = [obj countByEnumeratingWithState:&v44 objects:v52 count:16];
        if (v32)
        {
          uint64_t v30 = *(void *)v45;
          uint64_t v31 = a2;
          do
          {
            uint64_t v9 = 0;
            do
            {
              if (*(void *)v45 != v30) {
                objc_enumerationMutation(obj);
              }
              uint64_t v34 = v9;
              int v10 = *(void **)(*((void *)&v44 + 1) + 8 * v9);
              uint64_t v11 = [[BWJasperDisparityProcessorInput alloc] initWithSettings:a2 portType:v10];
              long long v40 = 0u;
              long long v41 = 0u;
              long long v42 = 0u;
              long long v43 = 0u;
              uint64_t v12 = [v35 countByEnumeratingWithState:&v40 objects:v51 count:16];
              if (v12)
              {
                uint64_t v13 = v12;
                uint64_t v14 = *(void *)v41;
                do
                {
                  for (uint64_t i = 0; i != v13; ++i)
                  {
                    if (*(void *)v41 != v14) {
                      objc_enumerationMutation(v35);
                    }
                    uint64_t v16 = *(void **)(*((void *)&v40 + 1) + 8 * i);
                    uint64_t v17 = (int)[v16 intValue];
                    unint64_t v50 = v16;
                    uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v50 count:1];
                    uint64_t v19 = (void *)[a3 lastAddedInputForSequenceNumber:0 portType:v10 bufferType:v17];
                    if (v19)
                    {
                      uint64_t v20 = v19;
                      -[BWStillImageProcessorControllerInput addOutputSampleBufferRouter:forBufferTypes:](v11, "addOutputSampleBufferRouter:forBufferTypes:", objc_msgSend((id)objc_msgSend(v19, "outputSampleBufferRouterForBufferType:", v17), "outputSampleBufferRouter"), v18);
                      [a3 addInput:v11 sequenceNumber:0 portType:v10 bufferType:v17];
                      [v20 addOutputSampleBufferRouter:v48 forBufferTypes:v18];
                    }
                  }
                  uint64_t v13 = [v35 countByEnumeratingWithState:&v40 objects:v51 count:16];
                }
                while (v13);
              }
              a2 = v31;
              if (objc_msgSend(v10, "isEqualToString:", objc_msgSend((id)objc_msgSend(v31, "captureSettings"), "masterPortType")))objc_msgSend(v33, "insertObject:atIndex:", v11, 0); {
              else
              }
                [v33 addObject:v11];
              uint64_t v9 = v34 + 1;
            }
            while (v34 + 1 != v32);
            uint64_t v32 = [obj countByEnumeratingWithState:&v44 objects:v52 count:16];
          }
          while (v32);
        }
        long long v38 = 0u;
        long long v39 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        id result = [v33 countByEnumeratingWithState:&v36 objects:v49 count:16];
        if (result)
        {
          uint64_t v21 = result;
          uint64_t v22 = *(void *)v37;
          do
          {
            uint64_t v23 = 0;
            do
            {
              if (*(void *)v37 != v22) {
                objc_enumerationMutation(v33);
              }
              unint64_t v24 = *(void **)(*((void *)&v36 + 1) + 8 * v23);
              [v27 enqueueInputForProcessing:v24 delegate:v28];
              objc_msgSend(*(id *)(v28 + 904), "setObject:forKeyedSubscript:", v24, objc_msgSend(v24, "portType"));
              ++v23;
            }
            while (v21 != v23);
            id result = [v33 countByEnumeratingWithState:&v36 objects:v49 count:16];
            uint64_t v21 = result;
          }
          while (result);
        }
      }
      else
      {
        return 4294894081;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (uint64_t)_setupProcessingStateForIntelligentDistortionCorrectionIfNeededWithSettings:(uint64_t)a3 sequenceNumber:(uint64_t)a4 portType:(void *)a5 processingPlan:
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v10 = a1;
  if (!_FigIsCurrentDispatchQueue())
  {
    uint64_t v49 = v5;
    LODWORD(v48) = 0;
    FigDebugAssert3();
  }
  if (!*(void *)(v10 + 656)) {
    goto LABEL_68;
  }
  uint64_t v11 = [*(id *)(v10 + 168) controllerForType:7];
  if (!v11)
  {
    uint64_t v53 = 0;
    unsigned int v42 = 0;
    uint64_t v45 = 4294894081;
    goto LABEL_65;
  }
  uint64_t v12 = (void *)v11;
  uint64_t v13 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureStreamSettingsForPortType:", a4), "captureFlags");
  unsigned int v14 = objc_msgSend((id)objc_msgSend(a2, "processingSettings"), "processIntelligentDistortionCorrection")
      ? objc_msgSend((id)v10, "idcSupportedForCaptureType:captureFlags:portType:", objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureType"), v13, a4): 0;
  int v15 = -[BWPhotonicEngineNode _gdcSourceForSettings:portType:](v10, a2, a4);
  HIDWORD(v53) = v15 == 2;
  if ((v14 & 1) != 0 || v15 == 2)
  {
    unsigned int v54 = v14;
    int v55 = v15;
    uint64_t v16 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", v48, v49);
    obuint64_t j = -[BWPhotonicEngineNode _errorRecoveryBufferTypesForBufferTypes:]((id)v10, v16);
    uint64_t v17 = objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "learnedNRStereoPhotoFrameFlag");
    LODWORD(v53) = v17 != 0;
    if (v17)
    {
      [v16 addObject:&unk_1EFB025E8];
    }
    else
    {
      objc_msgSend(v16, "addObjectsFromArray:", -[BWPhotonicEngineNode _bufferTypesExcludingErrorRecoveryTypesForCaptureSettings:]((id)v10, objc_msgSend(a2, "captureSettings")));
      if (v55 == 2) {
        [v16 addObjectsFromArray:obj];
      }
    }
    v69[0] = MEMORY[0x1E4F143A8];
    v69[1] = 3221225472;
    v69[2] = __139__BWPhotonicEngineNode__setupProcessingStateForIntelligentDistortionCorrectionIfNeededWithSettings_sequenceNumber_portType_processingPlan___block_invoke;
    v69[3] = &unk_1E5C28E20;
    v69[4] = v10;
    v69[5] = a4;
    v69[6] = obj;
    if (objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureType") == 7
      && [*(id *)(v10 + 664) objectForKeyedSubscript:a4])
    {
      uint64_t v18 = v10;
      uint64_t v19 = (BWIntelligentDistortionCorrectionProcessorInput *)[*(id *)(v10 + 664) objectForKeyedSubscript:a4];
      int v20 = objc_msgSend((id)objc_msgSend(*(id *)(v18 + 672), "objectForKeyedSubscript:", a4), "intValue");
      objc_msgSend(*(id *)(v18 + 672), "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", (v20 + 1)), a4);
      goto LABEL_53;
    }
    int v51 = a2;
    uint64_t v52 = v10;
    if (!objc_msgSend((id)objc_msgSend(a2, "requestedSettings"), "constantColorEnabled")
      || !objc_msgSend((id)objc_msgSend(a2, "requestedSettings"), "constantColorFallbackPhotoDeliveryEnabled")|| !objc_msgSend(*(id *)(v10 + 664), "objectForKeyedSubscript:", a4))
    {
      uint64_t v19 = [[BWIntelligentDistortionCorrectionProcessorInput alloc] initWithSettings:a2 portType:a4];
      [(BWIntelligentDistortionCorrectionProcessorInput *)v19 setProcessIntelligentDistortionCorrection:v14];
      [(BWIntelligentDistortionCorrectionProcessorInput *)v19 setProcessGeometricDistortionCorrection:v55 == 2];
      [(BWIntelligentDistortionCorrectionProcessorInput *)v19 setApplyZoom:1];
      if (v17) {
        [(BWIntelligentDistortionCorrectionProcessorInput *)v19 setUseBilinearInterpolation:1];
      }
      long long v63 = 0u;
      long long v64 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      uint64_t v29 = [v16 countByEnumeratingWithState:&v61 objects:v72 count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        uint64_t v31 = *(void *)v62;
        do
        {
          for (uint64_t i = 0; i != v30; ++i)
          {
            if (*(void *)v62 != v31) {
              objc_enumerationMutation(v16);
            }
            uint64_t v33 = (int)[*(id *)(*((void *)&v61 + 1) + 8 * i) intValue];
            uint64_t v34 = (void *)[a5 lastAddedInputForSequenceNumber:a3 portType:a4 bufferType:v33];
            if (v34)
            {
              if (!ubn_insertOutputRouterForInputAfterPreviousInputForBufferType_0((uint64_t)v69, v19, v34, v33))goto LABEL_64; {
              [a5 addInput:v19 sequenceNumber:a3 portType:a4 bufferType:v33];
              }
            }
          }
          uint64_t v30 = [v16 countByEnumeratingWithState:&v61 objects:v72 count:16];
        }
        while (v30);
      }
      unint64_t v50 = v12;
      if (v55 != 2)
      {
        long long v59 = 0u;
        long long v60 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        uint64_t v35 = [obj countByEnumeratingWithState:&v57 objects:v71 count:16];
        if (v35)
        {
          uint64_t v36 = v35;
          uint64_t v37 = *(void *)v58;
          do
          {
            for (uint64_t j = 0; j != v36; ++j)
            {
              if (*(void *)v58 != v37) {
                objc_enumerationMutation(obj);
              }
              long long v39 = *(void **)(*((void *)&v57 + 1) + 8 * j);
              long long v40 = objc_msgSend(a5, "lastAddedInputForSequenceNumber:portType:bufferType:", a3, a4, (int)objc_msgSend(v39, "intValue"));
              int64_t v70 = v39;
              objc_msgSend(v40, "addBypassedProcessorType:forBufferTypes:", 7, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v70, 1));
            }
            uint64_t v36 = [obj countByEnumeratingWithState:&v57 objects:v71 count:16];
          }
          while (v36);
        }
      }
      uint64_t v18 = v52;
      [*(id *)(v52 + 664) setObject:v19 forKeyedSubscript:a4];
      [*(id *)(v52 + 672) setObject:&unk_1EFB02630 forKeyedSubscript:a4];

      a2 = v51;
LABEL_52:
      uint64_t v12 = v50;
      goto LABEL_53;
    }
    uint64_t v21 = v10;
    uint64_t v19 = (BWIntelligentDistortionCorrectionProcessorInput *)[*(id *)(v10 + 664) objectForKeyedSubscript:a4];
    int v22 = objc_msgSend((id)objc_msgSend(*(id *)(v21 + 672), "objectForKeyedSubscript:", a4), "intValue");
    objc_msgSend(*(id *)(v21 + 672), "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", (v22 + 1)), a4);
    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    uint64_t v23 = [v16 countByEnumeratingWithState:&v65 objects:v73 count:16];
    if (!v23)
    {
      uint64_t v18 = v52;
LABEL_53:
      uint64_t v41 = [v12 enqueueInputForProcessing:v19 delegate:v18];
      uint64_t v10 = v18;
      unsigned int v42 = v54;
      long long v43 = &OBJC_IVAR___BWVideoOrientationMetadataNode__localIDOfOrientationMetadata;
      if (v41)
      {
        uint64_t v45 = v41;
      }
      else
      {
        long long v44 = *(void **)(v18 + 920);
        if (v44)
        {
          objc_msgSend((id)objc_msgSend(v44, "pipelineParameters"), "setIntelligentDistortionCorrectionEnabled:", v54);
          objc_msgSend((id)objc_msgSend(*(id *)(v18 + 920), "pipelineParameters"), "setGeometricDistortionCorrectionEnabled:", v55 == 2);
          objc_msgSend((id)objc_msgSend(*(id *)(v18 + 920), "pipelineParameters"), "setDistortionCorrectionVersion:", objc_msgSend(*(id *)(v18 + 656), "intelligentDistortionCorrectionVersion"));
          objc_msgSend((id)objc_msgSend(*(id *)(v18 + 920), "pipelineParameters"), "setDcProcessingWithDepthSupported:", -[BWPhotonicEngineNodeConfiguration dcProcessingWithDepthSupported](*(void *)(v18 + 112)));
          objc_msgSend((id)objc_msgSend(*(id *)(v18 + 920), "pipelineParameters"), "setStillImageGDCSourceMode:", -[BWPhotonicEngineNodeConfiguration stillImageGDCSourceMode](*(void *)(v18 + 112)));
        }
        uint64_t v45 = 0;
      }
      goto LABEL_57;
    }
    uint64_t v24 = v23;
    unint64_t v50 = v12;
    uint64_t v25 = *(void *)v66;
LABEL_23:
    uint64_t v26 = 0;
    while (1)
    {
      if (*(void *)v66 != v25) {
        objc_enumerationMutation(v16);
      }
      uint64_t v27 = (int)[*(id *)(*((void *)&v65 + 1) + 8 * v26) intValue];
      uint64_t v28 = (void *)[a5 lastAddedInputForSequenceNumber:a3 portType:a4 bufferType:v27];
      if (v28)
      {
        if (!ubn_insertOutputRouterForInputAfterPreviousInputForBufferType_0((uint64_t)v69, v19, v28, v27)) {
          break;
        }
      }
      if (v24 == ++v26)
      {
        uint64_t v24 = [v16 countByEnumeratingWithState:&v65 objects:v73 count:16];
        if (v24) {
          goto LABEL_23;
        }
        a2 = v51;
        uint64_t v18 = v52;
        goto LABEL_52;
      }
    }
LABEL_64:
    uint64_t v45 = 4294954516;
    a2 = v51;
    uint64_t v10 = v52;
    unsigned int v42 = v54;
  }
  else
  {
LABEL_68:
    uint64_t v53 = 0;
    unsigned int v42 = 0;
    uint64_t v45 = 0;
  }
LABEL_65:
  long long v43 = &OBJC_IVAR___BWVideoOrientationMetadataNode__localIDOfOrientationMetadata;
LABEL_57:
  if (*(void *)(v10 + v43[778])
    && (objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureFlags") & 0x4000000000) != 0)
  {
    objc_msgSend((id)objc_msgSend(*(id *)(v10 + v43[778]), "pipelineParameters"), "setDistortionCorrectionVersion:", objc_msgSend(*(id *)(v10 + 656), "intelligentDistortionCorrectionVersion"));
    objc_msgSend((id)objc_msgSend(*(id *)(v10 + v43[778]), "pipelineParameters"), "setStillImageGDCSourceMode:", -[BWPhotonicEngineNodeConfiguration stillImageGDCSourceMode](*(void *)(v10 + 112)));
  }
  if (((v42 | HIDWORD(v53)) & 1) != 0 || ((v45 == 0) & ~v53) == 0)
  {
    if (dword_1EB4C5670)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  return v45;
}

- (uint64_t)_setupProcessingStateForScalerIfNeededWithSettings:(uint64_t)a3 sequenceNumber:(void *)a4 portType:(void *)a5 processingPlan:
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v10 = result;
    if (!_FigIsCurrentDispatchQueue())
    {
      uint64_t v25 = v5;
      LODWORD(v24) = 0;
      FigDebugAssert3();
    }
    if (*(void *)(v10 + 752)
      && ((int v11 = -[BWPhotonicEngineNode _resolvedQSubResolutionFlavorForCaptureSettings:portType:](v10, (void *)[a2 captureSettings], a4), *(void *)(v10 + 752))? (v12 = v11 == 1): (v12 = 0), v12))
    {
      uint64_t v13 = [*(id *)(v10 + 168) controllerForType:18];
      if (v13)
      {
        unsigned int v14 = (void *)v13;
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __114__BWPhotonicEngineNode__setupProcessingStateForScalerIfNeededWithSettings_sequenceNumber_portType_processingPlan___block_invoke;
        v31[3] = &unk_1E5C28E20;
        v31[4] = v10;
        v31[5] = a4;
        v31[6] = a2;
        if (objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureType") == 7
          && [*(id *)(v10 + 760) objectForKeyedSubscript:a4])
        {
          int v15 = (BWScalerProcessorControllerInput *)[*(id *)(v10 + 760) objectForKeyedSubscript:a4];
          int v16 = objc_msgSend((id)objc_msgSend(*(id *)(v10 + 768), "objectForKeyedSubscript:", a4), "intValue");
          objc_msgSend(*(id *)(v10 + 768), "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", (v16 + 1)), a4);
        }
        else
        {
          uint64_t v26 = v14;
          int v15 = [[BWScalerProcessorControllerInput alloc] initWithSettings:a2 portType:a4];
          long long v27 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          id v17 = -[BWPhotonicEngineNode _bufferTypesForCaptureSettings:](v10, (void *)[a2 captureSettings]);
          uint64_t v18 = [v17 countByEnumeratingWithState:&v27 objects:v32 count:16];
          if (v18)
          {
            uint64_t v19 = v18;
            uint64_t v20 = *(void *)v28;
            while (2)
            {
              for (uint64_t i = 0; i != v19; ++i)
              {
                if (*(void *)v28 != v20) {
                  objc_enumerationMutation(v17);
                }
                uint64_t v22 = (int)objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * i), "intValue", v24, v25);
                uint64_t v23 = (void *)[a5 lastAddedInputForSequenceNumber:a3 portType:a4 bufferType:v22];
                if (v23)
                {
                  if (!ubn_insertOutputRouterForInputAfterPreviousInputForBufferType_0((uint64_t)v31, v15, v23, v22))return 4294954516; {
                  [a5 addInput:v15 sequenceNumber:a3 portType:a4 bufferType:v22];
                  }
                }
              }
              uint64_t v19 = [v17 countByEnumeratingWithState:&v27 objects:v32 count:16];
              if (v19) {
                continue;
              }
              break;
            }
          }
          objc_msgSend(*(id *)(v10 + 760), "setObject:forKeyedSubscript:", v15, a4, v24);
          [*(id *)(v10 + 768) setObject:&unk_1EFB02630 forKeyedSubscript:a4];

          unsigned int v14 = v26;
        }
        return objc_msgSend(v14, "enqueueInputForProcessing:delegate:", v15, v10, v24);
      }
      else
      {
        FigDebugAssert3();
        return 4294894081;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (uint64_t)_isSemanticRenderingCapture:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    int v4 = objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureType");
    unint64_t v5 = objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureFlags");
    if ((int)-[BWPhotonicEngineNodeConfiguration semanticRenderingVersion](*(void *)(v3 + 112)) < 1)
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

- (uint64_t)_isSmartStylesCaptureNeedingInferencesWithSettings:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = objc_msgSend((id)objc_msgSend(a2, "requestedSettings"), "smartStyle");
    unsigned int v5 = objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureType");
    unint64_t v6 = objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureFlags");
    if (v5 > 0xC || (unsigned int v7 = 1, ((1 << v5) & 0x1404) == 0))
    {
      if (v5 == 11) {
        unsigned int v7 = 1;
      }
      else {
        unsigned int v7 = (v6 >> 7) & 1;
      }
    }
    id result = -[BWPhotonicEngineNodeConfiguration smartStyleRenderingVersion](*(void *)(v3 + 112));
    if (result)
    {
      if (v4) {
        return v7;
      }
      else {
        return 0;
      }
    }
  }
  return result;
}

- (BOOL)_isSemanticStylesCaptureNeedingInferencesWithSettings:(BOOL)result
{
  if (result)
  {
    uint64_t v3 = result;
    [a2 requestedSettings];
    objc_opt_class();
    BOOL v4 = (objc_opt_isKindOfClass() & 1) != 0
      && objc_msgSend((id)objc_msgSend(a2, "requestedSettings"), "semanticStyle") != 0;
    int v5 = -[BWPhotonicEngineNode _isSemanticRenderingCapture:](v3, a2);
    int v6 = objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureType");
    id result = -[BWPhotonicEngineNodeConfiguration semanticStyleRenderingEnabled](*(void *)(v3 + 112));
    if (result)
    {
      if (v6 == 2) {
        int v7 = 1;
      }
      else {
        int v7 = v5;
      }
      return v4 & v7;
    }
  }
  return result;
}

- (uint64_t)_isDemosaicedRawCaptureNeedingInferencesWithSettigs:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  if (!objc_msgSend((id)objc_msgSend(a2, "processingSettings"), "provideDemosaicedRaw")) {
    return 0;
  }
  if (!objc_msgSend((id)objc_msgSend((id)-[BWPhotonicEngineNodeConfiguration providedInferenceAttachedMediaByMode](*(void *)(a1 + 112)), "objectForKeyedSubscript:", &unk_1EFB02510), "count"))return 0; {
  double v4 = -[BWPhotonicEngineNodeConfiguration inferenceMainImageDownscalingFactor](*(void *)(a1 + 112));
  }
  if (*(float *)&v4 == 0.0) {
    return 0;
  }
  return -[BWPhotonicEngineNode _isSemanticRenderingCapture:](a1, a2);
}

- (uint64_t)_isDepthCaptureNeedingPersonSegmentationMasksWithSettings:(uint64_t)a1
{
  if (!a1
    || !objc_msgSend((id)objc_msgSend((id)-[BWPhotonicEngineNodeConfiguration providedInferenceAttachedMediaByMode](*(void *)(a1 + 112)), "objectForKeyedSubscript:", &unk_1EFB024E0), "count")|| (objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureFlags") & 0x800) == 0)
  {
    return 0;
  }
  double v4 = (void *)[a2 requestedSettings];
  return [v4 depthDataFiltered];
}

- (uint64_t)_inferenceGenerationRequiredForSettings:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    id result = -[BWPhotonicEngineNodeConfiguration generateInferencesForSemanticProcessingIfNeeded](*(void *)(result + 112));
    if (result)
    {
      int v4 = -[BWPhotonicEngineNode _inferencesRequiredByProcessorControllersForSettings:](v3, a2);
      return v4 | -[BWPhotonicEngineNode _provideInferenceAttachedMediaWithSettings:](v3, a2);
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
    int v4 = (void *)-[BWPhotonicEngineNodeConfiguration providedInferenceAttachedMediaByMode](*(void *)(result + 112));
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
          if (-[BWPhotonicEngineNode _provideInferencesForAttachedMediaMode:settings:](v3, objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7), "intValue", (void)v8), a2))return 1; {
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

- (void)_resolvedQSubResolutionFlavorsForSettings:(uint64_t)a1
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  int v4 = (void *)[MEMORY[0x1E4F1CA80] set];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = objc_msgSend((id)objc_msgSend(a2, "captureSettings", 0), "captureStreamSettings");
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
        objc_msgSend(v4, "addObject:", objc_msgSend(NSNumber, "numberWithInt:", -[BWPhotonicEngineNode _resolvedQSubResolutionFlavorForCaptureSettings:portType:](a1, objc_msgSend(a2, "captureSettings"), objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v9++), "portType"))));
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
  return v4;
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
        uint64_t v6 = *(OpaqueVTPixelTransferSession **)(v4 + 584);
        if (!v6)
        {
          id result = VTPixelTransferSessionCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (VTPixelTransferSessionRef *)(v4 + 584));
          if (result) {
            return result;
          }
          id result = VTSessionSetProperty(*(VTSessionRef *)(v4 + 584), (CFStringRef)*MEMORY[0x1E4F45168], (CFTypeRef)*MEMORY[0x1E4F45460]);
          if (result) {
            return result;
          }
          uint64_t v6 = *(OpaqueVTPixelTransferSession **)(v4 + 584);
        }
        return VTPixelTransferSessionTransferImage(v6, sourceBuffer, destinationBuffer);
      }
    }
  }
  return result;
}

- (uint64_t)_setupProcessingStateForInferenceWithSettings:(uint64_t)a3 portType:(unint64_t)a4 inferenceInputBufferType:
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v60 = 0;
  long long v61 = &v60;
  uint64_t v62 = 0x2020000000;
  int v63 = 0;
  uint64_t v37 = [*(id *)(a1 + 168) controllerForType:3];
  if (v37)
  {
    int v7 = -[BWPhotonicEngineNode _provideInferenceAttachedMediaWithSettings:](a1, a2);
    if ((-[BWPhotonicEngineNode _inferencesRequiredByProcessorControllersForSettings:](a1, a2) | v7) == 1)
    {
      long long v39 = 0;
      if (a4 <= 0x27 && ((1 << a4) & 0x9000008000) != 0)
      {
        uint64_t v8 = (void *)[*(id *)(a1 + 496) objectForKeyedSubscript:a3];
        uint64_t v9 = *(NSObject **)(a1 + 504);
        v59[0] = MEMORY[0x1E4F143A8];
        v59[1] = 3221225472;
        v59[2] = __104__BWPhotonicEngineNode__setupProcessingStateForInferenceWithSettings_portType_inferenceInputBufferType___block_invoke;
        v59[3] = &unk_1E5C24430;
        v59[4] = v37;
        blocuint64_t k = MEMORY[0x1E4F143A8];
        uint64_t v65 = 3221225472;
        long long v66 = __ubn_dispatch_sync_block_invoke_0;
        long long v67 = &unk_1E5C249F0;
        long long v68 = v59;
        dispatch_sync(v9, &block);
        if ([v8 inferenceImage])
        {
          id v10 = BWSampleBufferCopyDictionaryOfAttachedMedia((const void *)[v8 inferenceImage]);
          long long v57 = 0u;
          long long v58 = 0u;
          long long v55 = 0u;
          long long v56 = 0u;
          uint64_t v11 = [v10 countByEnumeratingWithState:&v55 objects:v71 count:16];
          if (v11)
          {
            uint64_t v12 = *(void *)v56;
            do
            {
              for (uint64_t i = 0; i != v11; ++i)
              {
                if (*(void *)v56 != v12) {
                  objc_enumerationMutation(v10);
                }
                CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer((CMSampleBufferRef)[v10 objectForKeyedSubscript:*(void *)(*((void *)&v55 + 1) + 8 * i)]);
                if (ImageBuffer)
                {
                  IOSurface = CVPixelBufferGetIOSurface(ImageBuffer);
                  uint64_t v16 = IOSurface;
                  if (IOSurface)
                  {
                    IOSurfaceLock(IOSurface, 5u, 0);
                    IOSurfaceUnlock(v16, 5u, 0);
                  }
                }
              }
              uint64_t v11 = [v10 countByEnumeratingWithState:&v55 objects:v71 count:16];
            }
            while (v11);
          }

          BWSampleBufferRemoveAllAttachedMedia((const void *)[v8 inferenceImage]);
        }
        id v17 = *(NSObject **)(a1 + 504);
        v54[0] = MEMORY[0x1E4F143A8];
        v54[1] = 3221225472;
        v54[2] = __104__BWPhotonicEngineNode__setupProcessingStateForInferenceWithSettings_portType_inferenceInputBufferType___block_invoke_2;
        v54[3] = &unk_1E5C24F10;
        v54[4] = a1;
        v54[5] = a4;
        blocuint64_t k = MEMORY[0x1E4F143A8];
        uint64_t v65 = 3221225472;
        long long v66 = __ubn_dispatch_sync_block_invoke_0;
        long long v67 = &unk_1E5C249F0;
        long long v68 = v54;
        dispatch_sync(v17, &block);
        long long v39 = [[BWInferenceEngineControllerInput alloc] initWithSettings:a2 portType:a3 inferenceInputBufferType:a4];
        uint64_t v41 = (void *)[MEMORY[0x1E4F1CA80] set];
        int v18 = -[BWPhotonicEngineNode _isSemanticRenderingCapture:](a1, a2);
        int v19 = -[BWPhotonicEngineNode _isSWFRFlashCapture:](a1, a2);
        if (*(void *)(a1 + 640)) {
          unint64_t v36 = ((unint64_t)objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureFlags") >> 16) & 1;
        }
        else {
          LODWORD(v36) = 0;
        }
        BOOL v20 = -[BWPhotonicEngineNode _isSemanticStylesCaptureNeedingInferencesWithSettings:](a1, a2);
        if (v36)
        {
          if (([*(id *)(a1 + 488) enabledVisionInferences] & 2) != 0) {
            [(BWInferenceEngineControllerInput *)v39 setEnabledVisionInferences:[(BWInferenceEngineControllerInput *)v39 enabledVisionInferences] | 2];
          }
          if (([*(id *)(a1 + 488) enabledVisionInferences] & 4) != 0) {
            [(BWInferenceEngineControllerInput *)v39 setEnabledVisionInferences:[(BWInferenceEngineControllerInput *)v39 enabledVisionInferences] | 4];
          }
          if (([*(id *)(a1 + 488) enabledVisionInferences] & 8) != 0) {
            [(BWInferenceEngineControllerInput *)v39 setEnabledVisionInferences:[(BWInferenceEngineControllerInput *)v39 enabledVisionInferences] | 8];
          }
        }
        if (v18)
        {
          objc_msgSend(v41, "addObjectsFromArray:", objc_msgSend(*(id *)(a1 + 488), "enabledInferenceMasks"));
          if (([*(id *)(a1 + 488) enabledVisionInferences] & 2) != 0) {
            [(BWInferenceEngineControllerInput *)v39 setEnabledVisionInferences:[(BWInferenceEngineControllerInput *)v39 enabledVisionInferences] | 2];
          }
          if (([*(id *)(a1 + 488) enabledVisionInferences] & 8) != 0) {
            [(BWInferenceEngineControllerInput *)v39 setEnabledVisionInferences:[(BWInferenceEngineControllerInput *)v39 enabledVisionInferences] | 8];
          }
          if (([*(id *)(a1 + 488) enabledVisionInferences] & 0x10) != 0) {
            [(BWInferenceEngineControllerInput *)v39 setEnabledVisionInferences:[(BWInferenceEngineControllerInput *)v39 enabledVisionInferences] | 0x10];
          }
        }
        if (v19 && objc_msgSend((id)objc_msgSend(*(id *)(a1 + 488), "swfrInferenceMasks"), "count")) {
          objc_msgSend(v41, "addObjectsFromArray:", objc_msgSend(*(id *)(a1 + 488), "swfrInferenceMasks"));
        }
        if ((objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureFlags") & 0x800000000) != 0)
        {
          [v41 addObject:@"PersonSemanticsSkin"];
          [v41 addObject:@"PersonSemanticsHair"];
          [v41 addObject:0x1EFA6A200];
          [v41 addObject:0x1EFA745A0];
        }
        if (v20 || -[BWPhotonicEngineNode _isSmartStylesCaptureNeedingInferencesWithSettings:](a1, a2))
        {
          [v41 addObject:@"PersonSemanticsSkin"];
          [v41 addObject:0x1EFA745A0];
          int v21 = -[BWPhotonicEngineNodeConfiguration semanticRenderingVersion](*(void *)(a1 + 112));
          uint64_t v22 = &BWAttachedMediaKey_PersonSegmentationMask;
          if (v21 <= 3) {
            uint64_t v22 = &BWInferenceAttachedMediaKey_LowResPersonSegmentationMask;
          }
          [v41 addObject:*v22];
          if ([*(id *)(a1 + 488) smartCameraClassificationsEnabled]) {
            BOOL v23 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "metadata"), "smartCamInferences") == 0;
          }
          else {
            BOOL v23 = 0;
          }
          [(BWInferenceEngineControllerInput *)v39 setSmartCameraClassificationsEnabled:v23];
        }
        long long v52 = 0u;
        long long v53 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        obuint64_t j = *(id *)(a1 + 592);
        uint64_t v24 = [obj countByEnumeratingWithState:&v50 objects:v70 count:16];
        char v35 = v19;
        if (v24)
        {
          uint64_t v25 = *(void *)v51;
          do
          {
            for (uint64_t j = 0; j != v24; ++j)
            {
              if (*(void *)v51 != v25) {
                objc_enumerationMutation(obj);
              }
              uint64_t v27 = *(void *)(*((void *)&v50 + 1) + 8 * j);
              long long v46 = 0u;
              long long v47 = 0u;
              long long v48 = 0u;
              long long v49 = 0u;
              long long v28 = (void *)[*(id *)(a1 + 592) objectForKeyedSubscript:v27];
              uint64_t v29 = [v28 countByEnumeratingWithState:&v46 objects:v69 count:16];
              if (v29)
              {
                uint64_t v30 = *(void *)v47;
                while (2)
                {
                  for (uint64_t k = 0; k != v29; ++k)
                  {
                    if (*(void *)v47 != v30) {
                      objc_enumerationMutation(v28);
                    }
                    if (-[BWPhotonicEngineNode _provideInferencesForAttachedMediaMode:settings:](a1, [*(id *)(*((void *)&v46 + 1) + 8 * k) intValue], a2))
                    {
                      [v41 addObject:v27];
                      goto LABEL_63;
                    }
                  }
                  uint64_t v29 = [v28 countByEnumeratingWithState:&v46 objects:v69 count:16];
                  if (v29) {
                    continue;
                  }
                  break;
                }
              }
LABEL_63:
              ;
            }
            uint64_t v24 = [obj countByEnumeratingWithState:&v50 objects:v70 count:16];
          }
          while (v24);
        }
        -[BWInferenceEngineControllerInput setEnabledInferenceMasks:](v39, "setEnabledInferenceMasks:", [v41 allObjects]);
        v43[0] = MEMORY[0x1E4F143A8];
        v43[1] = 3221225472;
        v43[2] = __104__BWPhotonicEngineNode__setupProcessingStateForInferenceWithSettings_portType_inferenceInputBufferType___block_invoke_3;
        v43[3] = &unk_1E5C2D808;
        v43[4] = a1;
        v43[5] = v41;
        v43[6] = a3;
        char v44 = v36;
        char v45 = v35;
        [(BWStillImageProcessorControllerInput *)v39 addOutputSampleBufferRouter:v43 forBufferTypes:&unk_1EFB04C88];
        uint64_t v32 = *(NSObject **)(a1 + 504);
        v42[0] = MEMORY[0x1E4F143A8];
        v42[1] = 3221225472;
        v42[2] = __104__BWPhotonicEngineNode__setupProcessingStateForInferenceWithSettings_portType_inferenceInputBufferType___block_invoke_3_367;
        v42[3] = &unk_1E5C28DA8;
        v42[4] = v37;
        v42[5] = v39;
        v42[6] = a1;
        v42[7] = &v60;
        blocuint64_t k = MEMORY[0x1E4F143A8];
        uint64_t v65 = 3221225472;
        long long v66 = __ubn_dispatch_sync_block_invoke_0;
        long long v67 = &unk_1E5C249F0;
        long long v68 = v42;
        dispatch_sync(v32, &block);
        if (!*((_DWORD *)v61 + 6)) {
          [*(id *)(a1 + 496) setObject:v39 forKeyedSubscript:a3];
        }
      }
    }
    else
    {
    }
  }
  else
  {
    *((_DWORD *)v61 + 6) = -73215;
  }
  uint64_t v33 = *((unsigned int *)v61 + 6);
  _Block_object_dispose(&v60, 8);
  return v33;
}

void __87__BWPhotonicEngineNode__inferenceProcessRedEyeReductionSampleBuffer_settings_portType___block_invoke(uint64_t a1)
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
    switch(a2)
    {
      case 3:
        return -[BWPhotonicEngineNode _isSmartStylesCaptureNeedingInferencesWithSettings:](a1, a3);
      case 2:
        return -[BWPhotonicEngineNode _isDepthCaptureNeedingPersonSegmentationMasksWithSettings:](a1, a3);
      case 1:
        return -[BWPhotonicEngineNode _isDemosaicedRawCaptureNeedingInferencesWithSettigs:](a1, a3);
    }
  }
  return 0;
}

uint64_t __89__BWPhotonicEngineNode__waitForAndMergeInferencesIfNeededForSampleBuffer_processorInput___block_invoke(uint64_t a1)
{
  v52[16] = *MEMORY[0x1E4F143B8];
  if (dword_1EB4C5670)
  {
    *(_DWORD *)long long v43 = 0;
    type[0] = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  uint64_t v36 = a1;
  uint64_t v3 = *(void **)(*(void *)(a1 + 40) + 544);
  CMSampleBufferRef sbuf = *(CMSampleBufferRef *)(a1 + 48);
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithDictionary:", CMGetAttachment(sbuf, @"Inferences", 0));
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  v52[0] = 0x1EFA6A380;
  v52[1] = 0x1EFA6A3A0;
  v52[2] = 0x1EFA6A0A0;
  v52[3] = 0x1EFA6A1A0;
  v52[4] = 0x1EFA6A1C0;
  obuint64_t j = (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:5];
  uint64_t v5 = [obj countByEnumeratingWithState:&v48 objects:v52 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v49 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v3, "inferenceForAttachmentKey:", v9, v32, v34);
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = BWInferenceTypeForInferenceAttachmentKey(v9);
          long long v13 = objc_msgSend(v4, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", v12));
          if (v13)
          {
            long long v14 = v13;
            uint64_t v15 = [v13 inferences];
            uint64_t v16 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v15];
            [v16 setObject:v11 forKeyedSubscript:v9];
            id v17 = [[BWInferenceResult alloc] initWithResult:v14 replacementInferences:v16 replacementPreventionReason:0];
          }
          else
          {
            uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v11 forKey:v9];
            memset(v43, 0, 24);
            CMSampleBufferGetPresentationTimeStamp((CMTime *)v43, sbuf);
            int v19 = [BWInferenceResult alloc];
            *(_OWORD *)os_log_type_t type = *(_OWORD *)v43;
            uint64_t v47 = *(void *)&v43[16];
            id v17 = [(BWInferenceResult *)v19 initWithInferenceType:v12 inferences:v18 atTimestamp:type];
          }
          BOOL v20 = v17;
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v17, objc_msgSend(NSNumber, "numberWithInt:", v12));
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v48 objects:v52 count:16];
    }
    while (v6);
  }
  if (objc_msgSend(v4, "count", v32, v34)) {
    CMSetAttachment(sbuf, @"Inferences", v4, 1u);
  }
  int v21 = (void *)-[BWPhotonicEngineNode _inferenceAttachedMediaRequiredForSettings:inferences:sampleBuffer:](*(void *)(v36 + 40), (void *)[*(id *)(v36 + 32) stillImageSettings], *(void **)(*(void *)(v36 + 40) + 544));
  uint64_t v22 = *(void *)(v36 + 40);
  BOOL v23 = *(opaqueCMSampleBuffer **)(v36 + 48);
  id obja = *(id *)(v22 + 544);
  uint64_t v24 = *(void **)(v22 + 568);
  memset(v43, 0, sizeof(v43));
  long long v44 = 0u;
  long long v45 = 0u;
  uint64_t result = [v21 countByEnumeratingWithState:v43 objects:v52 count:16];
  if (result)
  {
    uint64_t v26 = result;
    uint64_t v27 = **(void **)&v43[16];
    uint64_t v37 = v24;
    CMSampleBufferRef sbufa = (CMSampleBufferRef)v21;
    do
    {
      uint64_t v28 = 0;
      do
      {
        if (**(void **)&v43[16] != v27) {
          objc_enumerationMutation(v21);
        }
        uint64_t v29 = *(void **)(*(void *)&v43[8] + 8 * v28);
        if (!BWSampleBufferGetAttachedMedia(v23, (uint64_t)v29))
        {
          CFTypeRef cf = 0;
          CFTypeRef v30 = (CFTypeRef)[v24 objectForKeyedSubscript:v29];
          if (v30) {
            CFTypeRef v30 = CFRetain(v30);
          }
          CFTypeRef cf = v30;
          if (BWPropagateInferenceAttachedMedia(obja, v29, &cf, v23))
          {
            uint64_t v31 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
            uint64_t v24 = v37;
            int v21 = sbufa;
          }
          objc_msgSend(v24, "setObject:forKeyedSubscript:", cf, v29, v33, v35);
          if (cf) {
            CFRelease(cf);
          }
        }
        ++v28;
      }
      while (v26 != v28);
      uint64_t result = [v21 countByEnumeratingWithState:v43 objects:v52 count:16];
      uint64_t v26 = result;
    }
    while (result);
  }
  return result;
}

- (uint64_t)_inferenceAttachedMediaRequiredForSettings:(uint64_t)result inferences:(void *)a2 sampleBuffer:(void *)a3
{
  if (result)
  {
    uint64_t v6 = result;
    if (!_FigIsCurrentDispatchQueue())
    {
      uint64_t v9 = v3;
      LODWORD(v8) = 0;
      FigDebugAssert3();
    }
    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CA80], "set", v8, v9);
    objc_msgSend(v7, "addObjectsFromArray:", -[BWPhotonicEngineNode _inferenceAttachedMediaRequiredForDemosaicedRawCaptureWithSettings:inferences:](v6, a2, a3));
    objc_msgSend(v7, "addObjectsFromArray:", -[BWPhotonicEngineNode _inferenceAttachedMediaRequiredForDepthProcessingWithSettings:](v6, a2));
    objc_msgSend(v7, "addObjectsFromArray:", -[BWPhotonicEngineNode _inferenceAttachedMediaRequiredForSmartStyleWithSettings:](v6, a2));
    return [v7 allObjects];
  }
  return result;
}

void __45__BWPhotonicEngineNode__resetProcessingState__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 544) = 0;
  *(void *)(*(void *)(a1 + 32) + 552) = 0;

  *(void *)(*(void *)(a1 + 32) + 560) = 0;
}

uint64_t __45__BWPhotonicEngineNode__resetProcessingState__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = (void *)[*(id *)(*(void *)(a1 + 32) + 168) controllerForType:8];
  return [v1 cancelProcessing];
}

- (uint64_t)_requiredResolutionFlavorsForSharedExternalMemoryResourceWithSettings:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = (void *)[MEMORY[0x1E4F1CA80] set];
    [v4 addObject:&unk_1EFB02570];
    uint64_t v5 = (void *)-[BWPhotonicEngineNodeConfiguration dimensionsByQSubResolutionFlavorByPortType](*(void *)(v3 + 112));
    if (BWQSubResolutionFlavorSupported(v5, 2)) {
      [v4 addObject:&unk_1EFB024E0];
    }
    if (a2
      && objc_msgSend(-[BWPhotonicEngineNode _resolvedQSubResolutionFlavorsForSettings:](v3, a2), "containsObject:", &unk_1EFB02510))
    {
      [v4 addObject:&unk_1EFB02510];
    }
    uint64_t v6 = (void *)-[BWPhotonicEngineNodeConfiguration dimensionsByQSubResolutionFlavorByPortType](*(void *)(v3 + 112));
    uint64_t v7 = (void *)BWDimensionsWithQSubResolutionFlavor(v6, 1);
    uint64_t v8 = FigCaptureLargestDimensionsFromDimensionsArray(v7);
    if ((int)v8 > (int)-[BWPhotonicEngineNodeConfiguration rawSensorDimensions](*(void *)(v3 + 112))
      || SHIDWORD(v8) > (int)((unint64_t)-[BWPhotonicEngineNodeConfiguration rawSensorDimensions](*(void *)(v3 + 112)) >> 32))
    {
      [v4 addObject:&unk_1EFB02510];
    }
    return [v4 allObjects];
  }
  return result;
}

- (id)_processorControllersForSharedExternalMemoryResource
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = (void *)[MEMORY[0x1E4F1CA48] array];
    long long v8 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    uint64_t v3 = [&unk_1EFB04B38 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v9;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v9 != v5) {
            objc_enumerationMutation(&unk_1EFB04B38);
          }
          uint64_t v7 = objc_msgSend(v1[21], "controllerForType:", (int)objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v6), "intValue"));
          if ([v7 supportsExternalMemoryResource]) {
            [v2 addObject:v7];
          }
          ++v6;
        }
        while (v4 != v6);
        uint64_t v4 = [&unk_1EFB04B38 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v4);
    }
    return (id *)(id)[v2 copy];
  }
  return result;
}

- (void)_prepareSharedExternalMemoryResourceForProcessorControllersIfNeededForResolutionFlavors:(uint64_t)a1
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v3 = a1;
    if (!_FigIsCurrentDispatchQueue())
    {
      uint64_t v51 = v2;
      FigDebugAssert3();
    }
    if (*(unsigned char *)(v3 + 216))
    {
      uint64_t v4 = &OBJC_IVAR___BWVideoOrientationMetadataNode__localIDOfOrientationMetadata;
      if (![*(id *)(v3 + 224) count])
      {
        if ([a2 count])
        {
          FigDebugIsInternalBuild();
          uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 23);
          mach_absolute_time();
          uint64_t v6 = -[BWPhotonicEngineNode _processorControllersForSharedExternalMemoryResource]((id *)v3);
          unint64_t v7 = [v6 count];
          BOOL v8 = v7 > 1;
          long long v9 = (_DWORD *)MEMORY[0x1E4F1EBA8];
          obuint64_t j = v6;
          uint64_t v54 = v5;
          if (v7 < 2)
          {
            if (!dword_1EB4C5670)
            {
              long long v45 = 0;
              goto LABEL_70;
            }
            unsigned int v63 = 0;
            os_log_type_t type = OS_LOG_TYPE_DEFAULT;
            os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
            long long v45 = 0;
            goto LABEL_69;
          }
          if (*MEMORY[0x1E4F1EBA8] == 1) {
            kdebug_trace();
          }
          BOOL v53 = v8;
          long long v10 = (void *)[MEMORY[0x1E4F1CA48] array];
          long long v64 = 0u;
          long long v65 = 0u;
          long long v66 = 0u;
          long long v67 = 0u;
          uint64_t v11 = [v6 countByEnumeratingWithState:&v64 objects:v75 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v52 = v3;
            uint64_t v13 = 0;
            unint64_t v55 = 0;
            unint64_t v14 = 0;
            uint64_t v15 = *(void *)v65;
            uint64_t v16 = 6;
            while (2)
            {
              for (uint64_t i = 0; i != v12; ++i)
              {
                if (*(void *)v65 != v15) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v18 = *(void **)(*((void *)&v64 + 1) + 8 * i);
                int v19 = (void *)[v18 externalMemoryDescriptorForResolutionFlavors:a2];
                if (!v19)
                {
LABEL_37:
                  long long v45 = 0;
                  BOOL v8 = 1;
                  uint64_t v3 = v52;
                  goto LABEL_38;
                }
                BOOL v20 = v19;
                if ([v19 memSize] > v14)
                {
                  unint64_t v14 = [v20 memSize];
                  uint64_t v16 = [v18 type];
                }
                uint64_t v21 = [v20 allocatorType];
                if (v13)
                {
                  if (v13 != v21) {
                    goto LABEL_37;
                  }
                }
                else
                {
                  uint64_t v13 = v21;
                }
                if ([v18 type] == 6) {
                  unint64_t v55 = [v20 memSize];
                }
                uint64_t v22 = NSString;
                uint64_t v23 = BWStillImageProcessorTypeToShortString([v18 type]);
                [v10 addObject:objc_msgSend(v22, "stringWithFormat:", @"%@:%@", v23, BWPrettyStringFromBytes(objc_msgSend(v20, "memSize")))];
              }
              uint64_t v12 = [obj countByEnumeratingWithState:&v64 objects:v75 count:16];
              if (v12) {
                continue;
              }
              break;
            }
            if (v16 == 12)
            {
              uint64_t v3 = v52;
              if (!-[BWPhotonicEngineNodeConfiguration ultraHighResolutionProcessingEnabled](*(void *)(v52 + 112)))
              {
                BOOL v24 = -[BWPhotonicEngineNodeConfiguration digitalFlashSupportEnabled](*(void *)(v52 + 112));
                float v25 = 0.1;
                if (v24) {
                  float v25 = 0.6;
                }
                v14 += (unint64_t)(float)(v25 * (float)v55);
              }
            }
            else
            {
              uint64_t v3 = v52;
            }
          }
          else
          {
            uint64_t v13 = 0;
            LODWORD(v14) = 0;
          }
          uint64_t v27 = (void *)-[BWPhotonicEngineNodeConfiguration dimensionsByQSubResolutionFlavorByPortType](*(void *)(v3 + 112));
          unint64_t v28 = BWCommonDimensionsForQSubResolutionFlavor(v27, 2);
          if (FigCaptureVideoDimensionsAreValid(v28)) {
            [*(id *)(v3 + 112) deferredPhotoProcessorEnabled];
          }
          if (dword_1EB4C5670)
          {
            unsigned int v63 = 0;
            os_log_type_t type = OS_LOG_TYPE_DEFAULT;
            uint64_t v29 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          id v30 = objc_alloc_init(MEMORY[0x1E4F55F50]);
          [v30 setMemSize:(int)v14];
          [v30 setWireMemory:1];
          [v30 setEnforceImmediateDealloc:0];
          [v30 setLabel:@"FigMetalAllocatorBackend-Shared-PhotonicEngine"];
          objc_msgSend(v30, "setMemoryPoolId:", -[BWMemoryPool poolIdentifier](+[BWMemoryPool sharedMemoryPool](BWMemoryPool, "sharedMemoryPool"), "poolIdentifier"));
          uint64_t v31 = *(void **)(v3 + 232);
          if (v31)
          {
            BOOL v8 = v53;
            uint64_t v32 = obj;
            if ([v31 allocatorBackend])
            {
              long long v45 = 0;
              if (v13 == objc_msgSend((id)objc_msgSend(*(id *)(v3 + 232), "allocatorBackend"), "allocatorType"))
              {
                long long v9 = (_DWORD *)MEMORY[0x1E4F1EBA8];
                goto LABEL_49;
              }
LABEL_86:
              BOOL v8 = 1;
LABEL_38:
              long long v9 = (_DWORD *)MEMORY[0x1E4F1EBA8];
              goto LABEL_77;
            }
          }
          else
          {
            uint64_t v33 = objc_msgSend((id)objc_msgSend(*(id *)(v3 + 112), "metalCommandQueue"), "device");
            BOOL v8 = v53;
            uint64_t v32 = obj;
            if (v33)
            {
              long long v45 = (void *)[objc_alloc(MEMORY[0x1E4F55F48]) initWithDevice:v33 allocatorType:v13];
              long long v9 = (_DWORD *)MEMORY[0x1E4F1EBA8];
              if (!v45)
              {
                BOOL v8 = 1;
                goto LABEL_77;
              }
LABEL_49:
              uint64_t v34 = objc_msgSend(*(id *)(v3 + 232), "allocatorBackend", v50, v51);
              if (v34) {
                uint64_t v35 = (void *)v34;
              }
              else {
                uint64_t v35 = v45;
              }
              if (![v35 setupWithDescriptor:v30])
              {
                if (!*(void *)(v3 + 232))
                {
                  id v36 = objc_alloc_init(MEMORY[0x1E4F55EC0]);
                  *(void *)(v3 + 232) = v36;
                  [v36 setAllocatorBackend:v35];
                  long long v60 = 0u;
                  long long v61 = 0u;
                  long long v58 = 0u;
                  long long v59 = 0u;
                  uint64_t v37 = [v32 countByEnumeratingWithState:&v58 objects:v68 count:16];
                  if (v37)
                  {
                    uint64_t v38 = v37;
                    uint64_t v39 = *(void *)v59;
                    do
                    {
                      for (uint64_t j = 0; j != v38; ++j)
                      {
                        if (*(void *)v59 != v39) {
                          objc_enumerationMutation(obj);
                        }
                        [*(id *)(*((void *)&v58 + 1) + 8 * j) setExternalMemoryResource:*(void *)(v3 + 232)];
                      }
                      uint64_t v38 = [obj countByEnumeratingWithState:&v58 objects:v68 count:16];
                    }
                    while (v38);
                  }
                }
                if (!dword_1EB4C5670)
                {
                  uint64_t v4 = &OBJC_IVAR___BWVideoOrientationMetadataNode__localIDOfOrientationMetadata;
                  goto LABEL_70;
                }
                unsigned int v63 = 0;
                os_log_type_t type = OS_LOG_TYPE_DEFAULT;
                uint64_t v41 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                unsigned int v42 = v63;
                if (os_log_type_enabled(v41, type)) {
                  unsigned int v43 = v42;
                }
                else {
                  unsigned int v43 = v42 & 0xFFFFFFFE;
                }
                if (v43)
                {
                  uint64_t v44 = *(void *)(v3 + 232);
                  int v69 = 136315395;
                  int64_t v70 = "-[BWPhotonicEngineNode _prepareSharedExternalMemoryResourceForProcessorControllersIfNeededForRes"
                        "olutionFlavors:]";
                  __int16 v71 = 2113;
                  uint64_t v72 = v44;
                  _os_log_send_and_compose_impl();
                }
                fig_log_call_emit_and_clean_up_after_send_and_compose();
LABEL_69:
                uint64_t v4 = &OBJC_IVAR___BWVideoOrientationMetadataNode__localIDOfOrientationMetadata;
LABEL_70:

                *(void *)(v3 + v4[819]) = [a2 copy];
                if (dword_1EB4C5670)
                {
                  unsigned int v63 = 0;
                  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
                  long long v46 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                  unsigned int v47 = v63;
                  if (os_log_type_enabled(v46, type)) {
                    unsigned int v48 = v47;
                  }
                  else {
                    unsigned int v48 = v47 & 0xFFFFFFFE;
                  }
                  if (v48)
                  {
                    mach_absolute_time();
                    uint64_t v49 = FigHostTimeToNanoseconds();
                    int v69 = 136315650;
                    int64_t v70 = "-[BWPhotonicEngineNode _prepareSharedExternalMemoryResourceForProcessorControllersIfNeededForR"
                          "esolutionFlavors:]";
                    __int16 v71 = 2114;
                    uint64_t v72 = v54;
                    __int16 v73 = 2048;
                    double v74 = (double)(v49 / 1000) / 1000.0;
                    _os_log_send_and_compose_impl();
                  }
                  fig_log_call_emit_and_clean_up_after_send_and_compose();
                }
                goto LABEL_77;
              }
              BOOL v8 = 1;
LABEL_77:
              if (v8 && *v9 == 1)
              {
                objc_msgSend((id)objc_msgSend(*(id *)(v3 + 232), "allocatorBackend"), "memSize");
                kdebug_trace();
              }
              goto LABEL_80;
            }
          }
          long long v45 = 0;
          goto LABEL_86;
        }
        FigDebugAssert3();
      }
    }
    long long v45 = 0;
LABEL_80:
  }
}

- (uint64_t)_releaseResourcesWithSettings:(uint64_t)result
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  if (!result) {
    return result;
  }
  uint64_t v4 = result;
  if (!_FigIsCurrentDispatchQueue())
  {
    uint64_t v37 = v2;
    LODWORD(v36) = 0;
    FigDebugAssert3();
  }
  uint64_t v43 = objc_msgSend((id)objc_msgSend(a2, "captureSettings", v36, v37), "captureFlags");
  if ((v43 & 0x200000000) != 0) {
    obuint64_t j = objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "deliverDeferredPhotoProxyImage") ^ 1;
  }
  else {
    obuint64_t j = 0;
  }
  if ((objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureFlags") & 0x100000000) != 0)
  {
    if (objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureType") == 12) {
      int v5 = objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "deliverDeferredPhotoProxyImage") ^ 1;
    }
    else {
      int v5 = 1;
    }
    int v38 = v5;
  }
  else
  {
    int v38 = 0;
  }
  if (objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureType") == 11)
  {
    [*(id *)(v4 + 440) flushToMinimumCapacity:0];
    [*(id *)(v4 + 448) flushToMinimumCapacity:0];
  }
  if ((objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureFlags") & 0x800000000) == 0)
  {
    [*(id *)(v4 + 392) flushToMinimumCapacity:0];
    [*(id *)(v4 + 400) flushToMinimumCapacity:0];
  }
  if ((objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureFlags") & 0x200) == 0
    && [*(id *)(v4 + 880) postponeProcessorSetup])
  {
    objc_msgSend((id)objc_msgSend(*(id *)(v4 + 168), "controllerForType:", 9), "purgeResources");
  }
  int v6 = -[BWPhotonicEngineNodeConfiguration minimumOutputBufferCount](*(void *)(v4 + 112));
  if (objc_msgSend((id)objc_msgSend(a2, "requestedSettings"), "burstQualityCaptureEnabled"))
  {
    int v7 = -[BWPhotonicEngineNodeConfiguration maxNumberOfBurstCapturesAllowedInFlight](*(void *)(v4 + 112));
    if (v6 <= v7) {
      int v6 = v7;
    }
  }
  if ((objc_msgSend((id)objc_msgSend(a2, "processingSettings"), "processIntelligentDistortionCorrection") & 1) == 0)
  {
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    uint64_t v12 = objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureStreamSettings");
    uint64_t v13 = [v12 countByEnumeratingWithState:&v57 objects:v64 count:16];
    if (!v13) {
      goto LABEL_25;
    }
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v58;
LABEL_32:
    uint64_t v16 = 0;
    while (1)
    {
      if (*(void *)v58 != v15) {
        objc_enumerationMutation(v12);
      }
      if (objc_msgSend((id)v4, "idcSupportedForCaptureType:captureFlags:portType:", objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureType"), objc_msgSend(*(id *)(*((void *)&v57 + 1) + 8 * v16), "captureFlags"), objc_msgSend(*(id *)(*((void *)&v57 + 1) + 8 * v16), "portType")))break; {
      if (v14 == ++v16)
      }
      {
        uint64_t v14 = [v12 countByEnumeratingWithState:&v57 objects:v64 count:16];
        if (v14) {
          goto LABEL_32;
        }
        goto LABEL_25;
      }
    }
  }
  int v6 = *(_DWORD *)(v4 + 992);
LABEL_25:
  BOOL v8 = (void *)[*(id *)(v4 + 16) livePixelBufferPool];
  if (v38)
  {
    int v9 = [v8 usesMemoryPool];
    long long v10 = (void *)[*(id *)(v4 + 16) livePixelBufferPool];
    if (v9) {
      uint64_t v11 = 0;
    }
    else {
      uint64_t v11 = v6;
    }
    [v10 flushToMinimumCapacity:v11];
    -[BWPhotonicEngineNode _flushSoftISPOutputBufferPools](v4);
  }
  else
  {
    [v8 flushToMinimumCapacity:v6];
    -[BWPhotonicEngineNode _flushSoftISPOutputBufferPools](v4);
    -[BWPhotonicEngineNode _flushUltraHighResolutionBufferPools](v4);
  }
  if ((v43 & 0x200000000) == 0) {
    [*(id *)(v4 + 464) flushToMinimumCapacity:0];
  }
  if ((obj & 1) == 0)
  {
    [*(id *)(v4 + 456) flushToMinimumCapacity:0];
    [*(id *)(v4 + 472) flushToMinimumCapacity:0];
    [*(id *)(v4 + 720) flushToMinimumCapacity:0];
    [*(id *)(v4 + 728) flushToMinimumCapacity:0];
    [*(id *)(v4 + 840) flushToMinimumCapacity:0];
    [*(id *)(v4 + 848) flushToMinimumCapacity:0];
  }
  if (!objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "learnedNRStereoPhotoFrameFlag")) {
    [*(id *)(v4 + 976) flushToMinimumCapacity:0];
  }
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v17 = *(void **)(v4 + 536);
  uint64_t v18 = [v17 countByEnumeratingWithState:&v53 objects:v63 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v54;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v54 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void **)(*((void *)&v53 + 1) + 8 * i);
        uint64_t v23 = (void *)[*(id *)(v4 + 536) objectForKeyedSubscript:v22];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && v23
          && [v23 usesMemoryPool]
          && (([v22 isEqualToString:0x1EFA6A6E0] & 1) == 0
           && ([v22 isEqualToString:0x1EFA6A700] & 1) == 0
           && ![v22 isEqualToString:0x1EFA6A720]
           || (objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureFlags") & 0x80) == 0))
        {
          [v23 flushToMinimumCapacity:0];
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v53 objects:v63 count:16];
    }
    while (v19);
  }
  if ((objc_msgSend((id)objc_msgSend(a2, "processingSettings"), "provideDemosaicedRaw") ^ 1 | obj | v38)) {
    unint64_t v24 = 0;
  }
  else {
    unint64_t v24 = *(int *)(v4 + 996);
  }
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(v4 + 16), "mediaPropertiesForAttachedMediaKey:", 0x1EFA745E0), "livePixelBufferPool"), "flushToMinimumCapacity:", v24);
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id obja = *(id *)(v4 + 592);
  uint64_t v42 = [obja countByEnumeratingWithState:&v49 objects:v62 count:16];
  if (v42)
  {
    uint64_t v41 = *(void *)v50;
    do
    {
      for (uint64_t j = 0; j != v42; ++j)
      {
        if (*(void *)v50 != v41) {
          objc_enumerationMutation(obja);
        }
        uint64_t v26 = *(void *)(*((void *)&v49 + 1) + 8 * j);
        long long v45 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        uint64_t v44 = v26;
        uint64_t v27 = objc_msgSend(*(id *)(v4 + 592), "objectForKeyedSubscript:");
        uint64_t v28 = [v27 countByEnumeratingWithState:&v45 objects:v61 count:16];
        if (!v28)
        {
          unint64_t v30 = 0;
          goto LABEL_90;
        }
        uint64_t v29 = v28;
        unint64_t v30 = 0;
        uint64_t v31 = *(void *)v46;
        do
        {
          for (uint64_t k = 0; k != v29; ++k)
          {
            if (*(void *)v46 != v31) {
              objc_enumerationMutation(v27);
            }
            int v33 = [*(id *)(*((void *)&v45 + 1) + 8 * k) intValue];
            switch(v33)
            {
              case 3:
LABEL_80:
                unsigned int v35 = objc_msgSend((id)objc_msgSend(a2, "requestedSettings"), "bracketImageCount");
                if (v35) {
                  unint64_t v34 = v35;
                }
                else {
                  unint64_t v34 = 2;
                }
                break;
              case 2:
                if (-[BWPhotonicEngineNode _isDepthCaptureNeedingPersonSegmentationMasksWithSettings:](v4, a2))goto LABEL_80; {
                unint64_t v34 = 0;
                }
                break;
              case 1:
                unint64_t v34 = v24;
                break;
              default:
                unint64_t v34 = 0;
                break;
            }
            if (v30 <= v34) {
              unint64_t v30 = v34;
            }
          }
          uint64_t v29 = [v27 countByEnumeratingWithState:&v45 objects:v61 count:16];
        }
        while (v29);
LABEL_90:
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(v4 + 16), "mediaPropertiesForAttachedMediaKey:", v44), "livePixelBufferPool"), "flushToMinimumCapacity:", v30);
      }
      uint64_t v42 = [obja countByEnumeratingWithState:&v49 objects:v62 count:16];
    }
    while (v42);
  }
  return -[BWPhotonicEngineNode _purgeProcessorAndSharedExternalMemoryResourceBackendMemoryIfNeededWithSettings:](v4);
}

- (uint64_t)_purgeProcessorAndSharedExternalMemoryResourceBackendMemoryIfNeededWithSettings:(uint64_t)result
{
  if (result)
  {
    uint64_t result = _FigIsCurrentDispatchQueue();
    if (!result) {
      return FigDebugAssert3();
    }
  }
  return result;
}

- (void)_setupDeferredProcessingWithSettings:(void *)a3 portType:
{
  if (a1
    && [*(id *)(a1 + 168) controllerForType:5]
    && -[BWPhotonicEngineNode _processingNeededForSettings:portType:](a1, a2, (uint64_t)a3)
    && (!objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "learnedNRStereoPhotoFrameFlag")
     || objc_msgSend(a3, "isEqualToString:", objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "masterPortType"))))
  {
    int v6 = [(BWStillImageProcessorControllerInput *)[BWDeferredProcessorControllerInput alloc] initWithSettings:a2 portType:a3];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __70__BWPhotonicEngineNode__setupDeferredProcessingWithSettings_portType___block_invoke;
    v7[3] = &unk_1E5C28D80;
    v7[4] = a1;
    [(BWStillImageProcessorControllerInput *)v6 addOutputSampleBufferRouter:v7 forBufferTypes:&unk_1EFB04B50];
    [*(id *)(a1 + 960) setObject:v6 forKeyedSubscript:a3];
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 168), "controllerForType:", 5), "enqueueInputForProcessing:delegate:", v6, a1);
  }
}

void __70__BWPhotonicEngineNode__setupDeferredProcessingWithSettings_portType___block_invoke(uint64_t a1, CMAttachmentBearerRef target, uint64_t a3, void *a4, uint64_t a5)
{
  if (a5)
  {
    CFTypeRef v9 = CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53070], 0);
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = [a4 stillImageSettings];
    [NSString stringWithFormat:@"type '%@' requested for '%@'", BWStillImageBufferTypeToShortString(a3), a4];
    -[BWPhotonicEngineNode _emitError:stillImageSettings:metadata:description:](v10, a5, v11, (uint64_t)v9);
  }
}

uint64_t __77__BWPhotonicEngineNode__setupProcessingStateIfNeededWithBeginMomentSettings___block_invoke(uint64_t a1)
{
  return -[BWPhotonicEngineNode _ensureProcessorCoordinatorSetupForPostponedProcessors](*(void *)(a1 + 32));
}

- (uint64_t)_ensureProcessorCoordinatorSetupForPostponedProcessors
{
  block[16] = *MEMORY[0x1E4F143B8];
  if (!result) {
    return result;
  }
  uint64_t v2 = result;
  if (!_FigIsCurrentDispatchQueue())
  {
    uint64_t v25 = v1;
    LODWORD(v21) = 0;
    FigDebugAssert3();
  }
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", v21, v25);
  FigDebugIsInternalBuild();
  uint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 25);
  mach_absolute_time();
  [v3 addObject:v4];
  int v5 = *(void **)(v2 + 168);
  if (!v5) {
    goto LABEL_28;
  }
  uint64_t v6 = [v5 controllerForType:3];
  if (v6)
  {
    uint64_t v7 = v6;
    BOOL v8 = BWDeviceSupportsDeferredPhotoProcessorPrewarming();
    if ([*(id *)(v2 + 112) deferredPhotoProcessorEnabled] && v8)
    {
      uint64_t v10 = *(NSObject **)(v2 + 512);
      uint64_t v11 = *(NSObject **)(v2 + 504);
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __78__BWPhotonicEngineNode__ensureProcessorCoordinatorSetupForPostponedProcessors__block_invoke;
      v27[3] = &unk_1E5C24458;
      v27[4] = v7;
      v27[5] = v2;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __ubn_dispatch_group_async_block_invoke_0;
      block[3] = &unk_1E5C249F0;
      block[4] = v27;
      dispatch_group_async(v10, v11, block);
    }
  }
  if (*(void *)(v2 + 704) && ![*(id *)(v2 + 168) controllerForType:10])
  {
    FigDebugIsInternalBuild();
    uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 16);
    mach_absolute_time();
    [v3 addObject:v12];
    uint64_t v13 = [[BWDeepZoomProcessorController alloc] initWithConfiguration:*(void *)(v2 + 704)];
    if (!v13) {
      goto LABEL_28;
    }
    uint64_t v14 = v13;
    if ([(BWDeepZoomProcessorController *)v13 prepareWithPixelBufferPoolProvider:v2])
    {
      goto LABEL_28;
    }
    [*(id *)(v2 + 168) addController:v14];
    if (dword_1EB4C5670)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    objc_msgSend(v3, "removeLastObject", v23, v26);
  }
  if (*(void *)(v2 + 824) && ![*(id *)(v2 + 168) controllerForType:16])
  {
    FigDebugIsInternalBuild();
    uint64_t v16 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 21);
    mach_absolute_time();
    [v3 addObject:v16];
    id v17 = [[BWSmartStyleRenderingProcessorController alloc] initWithConfiguration:*(void *)(v2 + 824)];
    if (v17)
    {
      [*(id *)(v2 + 168) addController:v17];
      if (dword_1EB4C5670)
      {
        uint64_t v18 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      objc_msgSend(v3, "removeLastObject", v24, v26);
      goto LABEL_24;
    }
LABEL_28:
    uint64_t v20 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
LABEL_24:
  if (dword_1EB4C5670)
  {
    uint64_t v19 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return objc_msgSend(v3, "removeLastObject", v22, v26);
}

- (id)_processingOrderByPortTypeForSettings:(id)result
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v3 = (uint64_t)result;
    uint64_t v4 = (void *)[MEMORY[0x1E4F1CA48] array];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    int v5 = objc_msgSend((id)objc_msgSend(a2, "captureSettings", 0), "portTypes");
    uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
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
          uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          if (-[BWPhotonicEngineNode _nrfProcessorInputNeededForSettings:portType:](v3, a2, (uint64_t)v10))
          {
            if (objc_msgSend(v10, "isEqualToString:", objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "masterPortType")))objc_msgSend(v4, "insertObject:atIndex:", v10, 0); {
            else
            }
              [v4 addObject:v10];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
    return (id)[v4 copy];
  }
  return result;
}

- (uint64_t)_setupSoftISPProcessingStateIfNeededWithSettings:(void *)a3 portType:
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v6 = (id *)result;
    if (!_FigIsCurrentDispatchQueue())
    {
      uint64_t v20 = v3;
      LODWORD(v19) = 0;
      FigDebugAssert3();
    }
    if ((objc_msgSend((id)objc_msgSend(a2, "captureSettings", v19, v20), "captureFlags") & 4) == 0
      || [v6[42] objectForKeyedSubscript:a3])
    {
      return 0;
    }
    if (![v6[21] controllerForType:12]) {
      return 4294950488;
    }
    uint64_t v7 = &OBJC_IVAR___BWVideoOrientationMetadataNode__localIDOfOrientationMetadata;
    objc_msgSend(v6[35], "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F1CA48], "array"), a3);
    objc_msgSend(v6[42], "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F1CA48], "array"), a3);
    uint64_t v8 = objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureStreamSettingsForPortType:", a3);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __82__BWPhotonicEngineNode__setupSoftISPProcessingStateIfNeededWithSettings_portType___block_invoke;
    v26[3] = &unk_1E5C28D80;
    v26[4] = v6;
    int v9 = [v8 expectedFrameCount];
    if (-[BWPhotonicEngineNode _isDeferredRawDeepFusionCapture:]((uint64_t)v6, a2))
    {
      if (([v8 captureFlags] & 0x100000) != 0) {
        int v9 = 2;
      }
      else {
        int v9 = 1;
      }
      objc_msgSend(v6[43], "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F1CA48], "array"), a3);
      if ((objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureFlags") & 0x4000000000) != 0)
      {
        long long v24 = 0u;
        long long v25 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        uint64_t v10 = objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "secondaryPortTypes");
        uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v27 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v21 = a3;
          uint64_t v13 = *(void *)v23;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v23 != v13) {
                objc_enumerationMutation(v10);
              }
              objc_msgSend(v6[43], "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F1CA48], "array"), *(void *)(*((void *)&v22 + 1) + 8 * i));
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v27 count:16];
          }
          while (v12);
          a3 = v21;
          uint64_t v7 = &OBJC_IVAR___BWVideoOrientationMetadataNode__localIDOfOrientationMetadata;
        }
      }
    }
    else if (-[BWPhotonicEngineNode _isDeferredRawLearnedNRCapture:]((uint64_t)v6, a2))
    {
      objc_msgSend(v6[43], "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F1CA48], "array"), a3);
    }
    else if ([v8 adaptiveBracketingParameters])
    {
      int v9 = 1;
      int v15 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "adaptiveBracketingParameters"), "adaptiveBracketingFrameParametersForGroup:", 1), "count");
      if (v15)
      {
        int v16 = 0;
        uint64_t v17 = 2;
        do
        {
          v16 += v15;
          int v15 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "adaptiveBracketingParameters"), "adaptiveBracketingFrameParametersForGroup:", v17), "count");
          uint64_t v17 = (v17 + 1);
        }
        while (v15);
        int v9 = v16 + 1;
      }
    }
    if (objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "learnedNRStereoPhotoFrameFlag"))
    {
      if (!objc_msgSend(a3, "isEqualToString:", objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "masterPortType")))
      {
        int v9 = 1;
        goto LABEL_33;
      }
      ++v9;
    }
    if (v9 < 1) {
      return 0;
    }
    do
    {
LABEL_33:
      uint64_t v18 = -[BWSoftISPProcessorControllerInput initWithSettings:portType:gdcEnabled:]([BWSoftISPProcessorControllerInput alloc], "initWithSettings:portType:gdcEnabled:", a2, a3, -[BWPhotonicEngineNode _gdcSourceForSettings:portType:]((uint64_t)v6, a2, (uint64_t)a3) == 3);
      [(BWStillImageProcessorControllerInput *)v18 addOutputSampleBufferRouter:v26 forBufferTypes:&unk_1EFB04B68];
      objc_msgSend((id)objc_msgSend(*(id *)((char *)v6 + v7[779]), "objectForKeyedSubscript:", -[BWStillImageProcessorControllerInput portType](v18, "portType")), "addObject:", v18);

      --v9;
    }
    while (v9);
    return 0;
  }
  return result;
}

- (void)_drainStashedBeginMomentBuffersIfNeededWithSettings:(uint64_t)a1
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (!_FigIsCurrentDispatchQueue())
    {
      uint64_t v52 = v2;
      LODWORD(v51) = 0;
      FigDebugAssert3();
    }
    if (dword_1EB4C5670)
    {
      int v87 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    if (!*(unsigned char *)(a1 + 328)
      && ([*(id *)(a1 + 320) count]
       || [*(id *)(a1 + 336) count]
       || [*(id *)(a1 + 344) count]))
    {
      long long v84 = 0u;
      long long v85 = 0u;
      long long v82 = 0u;
      long long v83 = 0u;
      uint64_t v6 = *(void **)(a1 + 320);
      uint64_t v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v82, v94, 16, v51, v52);
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v83;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v83 != v9) {
              objc_enumerationMutation(v6);
            }
            BWStillImageCoordinatorUpdateBeginMomentAttachmentsForSampleBuffer((const void *)[*(id *)(a1 + 320) objectForKeyedSubscript:*(void *)(*((void *)&v82 + 1) + 8 * i)], a2);
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v82 objects:v94 count:16];
        }
        while (v8);
      }
      long long v80 = 0u;
      long long v81 = 0u;
      long long v78 = 0u;
      long long v79 = 0u;
      uint64_t v57 = a1;
      uint64_t v11 = *(void **)(a1 + 296);
      uint64_t v12 = [v11 countByEnumeratingWithState:&v78 objects:v93 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v79;
        do
        {
          for (uint64_t j = 0; j != v13; ++j)
          {
            if (*(void *)v79 != v14) {
              objc_enumerationMutation(v11);
            }
            int v16 = (void *)[*(id *)(v57 + 296) objectForKeyedSubscript:*(void *)(*((void *)&v78 + 1) + 8 * j)];
            long long v74 = 0u;
            long long v75 = 0u;
            long long v76 = 0u;
            long long v77 = 0u;
            uint64_t v17 = [v16 countByEnumeratingWithState:&v74 objects:v92 count:16];
            if (v17)
            {
              uint64_t v18 = v17;
              uint64_t v19 = *(void *)v75;
              do
              {
                for (uint64_t k = 0; k != v18; ++k)
                {
                  if (*(void *)v75 != v19) {
                    objc_enumerationMutation(v16);
                  }
                  BWStillImageCoordinatorUpdateBeginMomentAttachmentsForSampleBuffer((const void *)[v16 objectForKeyedSubscript:*(void *)(*((void *)&v74 + 1) + 8 * k)], a2);
                }
                uint64_t v18 = [v16 countByEnumeratingWithState:&v74 objects:v92 count:16];
              }
              while (v18);
            }
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v78 objects:v93 count:16];
        }
        while (v13);
      }
      long long v72 = 0u;
      long long v73 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      uint64_t v21 = (void *)[*(id *)(v57 + 296) allKeys];
      uint64_t v22 = [v21 countByEnumeratingWithState:&v70 objects:v91 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v71;
        do
        {
          for (uint64_t m = 0; m != v23; ++m)
          {
            if (*(void *)v71 != v24) {
              objc_enumerationMutation(v21);
            }
            -[BWPhotonicEngineNode _attemptDisparityReferenceFrameResolutionForSettings:portType:](v57, a2, *(void **)(*((void *)&v70 + 1) + 8 * m));
          }
          uint64_t v23 = [v21 countByEnumeratingWithState:&v70 objects:v91 count:16];
        }
        while (v23);
      }
      uint64_t v26 = (void *)[*(id *)(v57 + 336) copy];
      long long v66 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      obuint64_t j = v26;
      uint64_t v54 = [v26 countByEnumeratingWithState:&v66 objects:v90 count:16];
      if (v54)
      {
        uint64_t v53 = *(void *)v67;
        do
        {
          uint64_t v27 = 0;
          do
          {
            if (*(void *)v67 != v53) {
              objc_enumerationMutation(obj);
            }
            uint64_t v56 = v27;
            uint64_t v28 = *(void *)(*((void *)&v66 + 1) + 8 * v27);
            long long v62 = 0u;
            long long v63 = 0u;
            long long v64 = 0u;
            long long v65 = 0u;
            uint64_t v29 = (void *)[obj objectForKeyedSubscript:v28];
            uint64_t v30 = [v29 countByEnumeratingWithState:&v62 objects:v89 count:16];
            if (v30)
            {
              uint64_t v31 = v30;
              uint64_t v32 = *(void *)v63;
              do
              {
                for (uint64_t n = 0; n != v31; ++n)
                {
                  if (*(void *)v63 != v32) {
                    objc_enumerationMutation(v29);
                  }
                  unint64_t v34 = *(void **)(*((void *)&v62 + 1) + 8 * n);
                  unsigned int v35 = objc_msgSend((id)objc_msgSend(v34, "input"), "outputSampleBufferRouterForBufferType:", 1);
                  if ([v35 outputSampleBufferRouter])
                  {
                    uint64_t v36 = (void *)MEMORY[0x1A6272C70]();
                    BWStillImageCoordinatorUpdateBeginMomentAttachmentsForSampleBuffer((const void *)[v34 outputSampleBuffer], a2);
                    uint64_t v37 = [v35 outputSampleBufferRouter];
                    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v37 + 16))(v37, [v34 outputSampleBuffer], 1, objc_msgSend(v34, "input"), objc_msgSend(v34, "error"));
                  }
                }
                uint64_t v31 = [v29 countByEnumeratingWithState:&v62 objects:v89 count:16];
              }
              while (v31);
            }
            uint64_t v27 = v56 + 1;
          }
          while (v56 + 1 != v54);
          uint64_t v54 = [obj countByEnumeratingWithState:&v66 objects:v90 count:16];
        }
        while (v54);
      }

      uint64_t v38 = v57;
      [*(id *)(v57 + 336) removeAllObjects];
      uint64_t v39 = &OBJC_IVAR___BWVideoOrientationMetadataNode__localIDOfOrientationMetadata;
      if (objc_msgSend(*(id *)(v57 + 152), "isEqualToString:", objc_msgSend((id)objc_msgSend(a2, "requestedSettings"), "captureRequestIdentifier")))
      {
        long long v60 = 0u;
        long long v61 = 0u;
        long long v58 = 0u;
        long long v59 = 0u;
        long long v40 = *(void **)(v57 + 344);
        uint64_t v41 = [v40 countByEnumeratingWithState:&v58 objects:v88 count:16];
        if (v41)
        {
          uint64_t v42 = v41;
          uint64_t v43 = *(void *)v59;
          do
          {
            for (iuint64_t i = 0; ii != v42; ++ii)
            {
              if (*(void *)v59 != v43) {
                objc_enumerationMutation(v40);
              }
              uint64_t v45 = *(void *)(*((void *)&v58 + 1) + 8 * ii);
              long long v46 = v39;
              if (objc_msgSend((id)objc_msgSend(*(id *)(v38 + v39[812]), "objectForKeyedSubscript:", v45), "count"))
              {
                unint64_t v47 = 0;
                do
                {
                  long long v48 = (void *)MEMORY[0x1A6272C70]();
                  long long v49 = (const void *)objc_msgSend((id)objc_msgSend(*(id *)(v38 + v46[812]), "objectForKeyedSubscript:", v45), "objectAtIndexedSubscript:", v47);
                  BWStillImageCoordinatorUpdateBeginMomentAttachmentsForSampleBuffer(v49, a2);
                  long long v50 = (void *)v49;
                  uint64_t v38 = v57;
                  -[BWPhotonicEngineNode _deferredCaptureHandleSensorRawSampleBuffer:](v57, v50);
                  ++v47;
                }
                while (objc_msgSend((id)objc_msgSend(*(id *)(v57 + v46[812]), "objectForKeyedSubscript:", v45), "count") > v47);
              }
              uint64_t v39 = v46;
            }
            uint64_t v42 = [v40 countByEnumeratingWithState:&v58 objects:v88 count:16];
          }
          while (v42);
        }
      }
      [*(id *)(v38 + v39[812]) removeAllObjects];
      -[BWPhotonicEngineNode _resetProcessingStateIfDone](v38);
    }
  }
}

void __82__BWPhotonicEngineNode__setupSoftISPProcessingStateIfNeededWithSettings_portType___block_invoke(uint64_t a1, const void *a2, uint64_t a3, void *a4, uint64_t a5)
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
  uint64_t v10 = [[BWSoftISPResult alloc] initWithInput:a4 outputSampleBuffer:a2 error:a5];
  -[BWPhotonicEngineNode _stashAWBMetadataIfNeededForSampleBuffer:processingMode:](*(void *)(a1 + 32), a2, [a4 processingMode]);
  objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 336), "objectForKeyedSubscript:", objc_msgSend(a4, "portType")), "addObject:", v10);
}

- (uint64_t)_stashAWBMetadataIfNeededForSampleBuffer:(int)a3 processingMode:
{
  if (result)
  {
    uint64_t v6 = result;
    uint64_t result = _FigIsCurrentDispatchQueue();
    if (result)
    {
      if (!a2) {
        return result;
      }
    }
    else
    {
      uint64_t v16 = v3;
      LODWORD(v15) = 0;
      uint64_t result = FigDebugAssert3();
      if (!a2) {
        return result;
      }
    }
    uint64_t v7 = (void *)CMGetAttachment(a2, @"StillSettings", 0);
    uint64_t v8 = objc_msgSend((id)objc_msgSend(v7, "captureSettings"), "learnedNRStereoPhotoFrameFlag");
    uint64_t v9 = (void *)[v7 captureSettings];
    if (a3 == 6 && v8)
    {
      uint64_t v10 = [v9 learnedNRStereoPhotoFrameFlag];
    }
    else
    {
      uint64_t result = objc_msgSend(v9, "captureFlags", v15, v16);
      if ((result & 0x8000000000) == 0) {
        return result;
      }
      uint64_t v10 = 16;
    }
    uint64_t result = (uint64_t)BWStillImageCaptureFrameFlagsForSampleBuffer(a2);
    if ((result & v10) != 0)
    {
      uint64_t v11 = (void *)CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E4F53070], 0);
      uint64_t v12 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F54128]];
      uint64_t result = [*(id *)(v6 + 352) objectForKeyedSubscript:v12];
      if (!result)
      {
        uint64_t v13 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
        BWCopyWhiteBalanceMetadata(v11, v13);
        uint64_t v14 = *(void **)(v6 + 352);
        return [v14 setObject:v13 forKeyedSubscript:v12];
      }
    }
  }
  return result;
}

- (uint64_t)_setupSoftISPOutputRoutingIfNeededWithOutputSampleBufferRouter:(void *)a3 processingPlan:
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v6 = result;
    if (!_FigIsCurrentDispatchQueue())
    {
      uint64_t v25 = v3;
      LODWORD(v24) = 0;
      FigDebugAssert3();
    }
    uint64_t result = objc_msgSend(*(id *)(v6 + 336), "count", v24, v25);
    if (result)
    {
      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      obuint64_t j = *(id *)(v6 + 336);
      uint64_t result = [obj countByEnumeratingWithState:&v39 objects:v45 count:16];
      uint64_t v28 = result;
      if (result)
      {
        uint64_t v27 = *(void *)v40;
        uint64_t v29 = v6;
        do
        {
          uint64_t v7 = 0;
          do
          {
            if (*(void *)v40 != v27) {
              objc_enumerationMutation(obj);
            }
            uint64_t v30 = v7;
            uint64_t v8 = *(void *)(*((void *)&v39 + 1) + 8 * v7);
            long long v35 = 0u;
            long long v36 = 0u;
            long long v37 = 0u;
            long long v38 = 0u;
            uint64_t v9 = (void *)[*(id *)(v6 + 336) objectForKeyedSubscript:v8];
            uint64_t v10 = [v9 countByEnumeratingWithState:&v35 objects:v44 count:16];
            if (v10)
            {
              uint64_t v11 = v10;
              uint64_t v12 = 0;
              uint64_t v13 = *(void *)v36;
              do
              {
                uint64_t v14 = 0;
                uint64_t v15 = v12;
                do
                {
                  if (*(void *)v36 != v13) {
                    objc_enumerationMutation(v9);
                  }
                  uint64_t v16 = *(void **)(*((void *)&v35 + 1) + 8 * v14);
                  objc_msgSend((id)objc_msgSend(v16, "input"), "addOutputSampleBufferRouter:forBufferTypes:", a2, &unk_1EFB04B80);
                  objc_msgSend(a3, "addInput:sequenceNumber:portType:bufferTypes:", objc_msgSend(v16, "input"), v15 + v14++, v8, &unk_1EFB04B98);
                }
                while (v11 != v14);
                uint64_t v11 = [v9 countByEnumeratingWithState:&v35 objects:v44 count:16];
                uint64_t v12 = (v15 + v14);
              }
              while (v11);
              uint64_t v17 = (v15 + v14);
              uint64_t v6 = v29;
            }
            else
            {
              uint64_t v17 = 0;
            }
            long long v33 = 0u;
            long long v34 = 0u;
            long long v31 = 0u;
            long long v32 = 0u;
            uint64_t v18 = (void *)[*(id *)(v6 + 280) objectForKeyedSubscript:v8];
            uint64_t v19 = [v18 countByEnumeratingWithState:&v31 objects:v43 count:16];
            if (v19)
            {
              uint64_t v20 = v19;
              uint64_t v21 = *(void *)v32;
              do
              {
                for (uint64_t i = 0; i != v20; ++i)
                {
                  if (*(void *)v32 != v21) {
                    objc_enumerationMutation(v18);
                  }
                  uint64_t v23 = *(void **)(*((void *)&v31 + 1) + 8 * i);
                  [v23 addOutputSampleBufferRouter:a2 forBufferTypes:&unk_1EFB04BB0];
                  [a3 addInput:v23 sequenceNumber:v17 + i portType:v8 bufferTypes:&unk_1EFB04BC8];
                }
                uint64_t v20 = [v18 countByEnumeratingWithState:&v31 objects:v43 count:16];
                uint64_t v17 = (v17 + i);
              }
              while (v20);
            }
            uint64_t v6 = v29;
            uint64_t v7 = v30 + 1;
          }
          while (v30 + 1 != v28);
          uint64_t result = [obj countByEnumeratingWithState:&v39 objects:v45 count:16];
          uint64_t v28 = result;
        }
        while (result);
      }
    }
  }
  return result;
}

uint64_t __58__BWPhotonicEngineNode__setupProcessingStateWithSettings___block_invoke(uint64_t a1)
{
  return -[BWPhotonicEngineNode _ensureProcessorCoordinatorSetupForPostponedProcessors](*(void *)(a1 + 32));
}

- (uint64_t)_setupProcessingStateForDeferredCaptureIfNeededWithSettings:(uint64_t)a1
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v2 = a2;
  uint64_t v3 = a1;
  if (!objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "deliverDeferredPhotoProxyImage")
    || *(void *)(v3 + 920))
  {
    return 0;
  }
  uint64_t v4 = [*(id *)(v3 + 168) controllerForType:14];
  if (!v4) {
    return 4294950488;
  }
  uint64_t v25 = (void *)v4;
  uint64_t v26 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  int v5 = objc_msgSend((id)objc_msgSend(v2, "captureSettings"), "portTypes");
  uint64_t v6 = [v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
  uint64_t v7 = &OBJC_IVAR___BWVideoOrientationMetadataNode__localIDOfOrientationMetadata;
  uint64_t v27 = v2;
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v29 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        uint64_t v12 = v3;
        uint64_t v13 = -[BWPhotonicEngineNode _resolvedQSubResolutionFlavorForCaptureSettings:portType:](v3, (void *)[v2 captureSettings], v11);
        if ((v13 - 1) <= 1)
        {
          uint64_t v14 = v13;
          uint64_t v32 = [NSNumber numberWithInt:v13];
          uint64_t v15 = v7;
          uint64_t v16 = [(id)-[BWPhotonicEngineNodeConfiguration dimensionsByQSubResolutionFlavorByPortType](*(void *)(v12 + v7[714])) objectForKeyedSubscript:v11];
          uint64_t v17 = [NSNumber numberWithInt:v14];
          uint64_t v18 = (void *)v16;
          uint64_t v7 = v15;
          uint64_t v2 = v27;
          uint64_t v33 = [v18 objectForKeyedSubscript:v17];
          objc_msgSend(v26, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1), v11);
        }
        uint64_t v3 = v12;
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v8);
  }
  if ([v26 count]) {
    id v19 = (id)[v26 copy];
  }
  else {
    id v19 = 0;
  }
  uint64_t v20 = -[BWDeferredCaptureControllerInput initWithSettings:configuration:sourceNodePixelBufferAttributes:]([BWDeferredCaptureControllerInput alloc], "initWithSettings:configuration:sourceNodePixelBufferAttributes:", v27, [v25 configuration], objc_msgSend((id)objc_msgSend(*(id *)(v3 + 8), "videoFormat"), "pixelBufferAttributes"));
  -[BWDeferredPipelineParameters setNoiseReductionAndFusionScheme:](-[BWDeferredCaptureControllerInput pipelineParameters](v20, "pipelineParameters"), "setNoiseReductionAndFusionScheme:", -[BWPhotonicEngineNodeConfiguration stillImageFusionScheme](*(void *)(v3 + v7[714])));
  -[BWDeferredPipelineParameters setRawSensorDimensions:](-[BWDeferredCaptureControllerInput pipelineParameters](v20, "pipelineParameters"), "setRawSensorDimensions:", -[BWPhotonicEngineNodeConfiguration rawSensorDimensions](*(void *)(v3 + v7[714])));
  [(BWDeferredPipelineParameters *)[(BWDeferredCaptureControllerInput *)v20 pipelineParameters] setDimensionsByQSubResolutionFlavorByPortType:v19];
  [(BWDeferredPipelineParameters *)[(BWDeferredCaptureControllerInput *)v20 pipelineParameters] setNrfVersion:[+[FigCaptureCameraParameters sharedInstance] nrfVersion]];
  -[BWDeferredPipelineParameters setSemanticRenderingVersion:](-[BWDeferredCaptureControllerInput pipelineParameters](v20, "pipelineParameters"), "setSemanticRenderingVersion:", -[BWPhotonicEngineNodeConfiguration semanticRenderingVersion](*(void *)(v3 + v7[714])));
  -[BWDeferredPipelineParameters setSmartStyleRenderingVersion:](-[BWDeferredCaptureControllerInput pipelineParameters](v20, "pipelineParameters"), "setSmartStyleRenderingVersion:", -[BWPhotonicEngineNodeConfiguration smartStyleRenderingVersion](*(void *)(v3 + v7[714])));
  -[BWDeferredPipelineParameters setSmartStyleReversibilityEnabled:](-[BWDeferredCaptureControllerInput pipelineParameters](v20, "pipelineParameters"), "setSmartStyleReversibilityEnabled:", -[BWPhotonicEngineNodeConfiguration smartStyleReversibilityEnabled](*(void *)(v3 + v7[714])));
  -[BWDeferredPipelineParameters setSmartStyleLinearThumbnailDimensions:](-[BWDeferredCaptureControllerInput pipelineParameters](v20, "pipelineParameters"), "setSmartStyleLinearThumbnailDimensions:", -[BWPhotonicEngineNodeConfiguration smartStyleLinearThumbnailDimensions](*(void *)(v3 + v7[714])));
  -[BWDeferredPipelineParameters setSmartStyleStyledThumbnailDimensions:](-[BWDeferredCaptureControllerInput pipelineParameters](v20, "pipelineParameters"), "setSmartStyleStyledThumbnailDimensions:", -[BWPhotonicEngineNodeConfiguration smartStyleStyledThumbnailDimensions](*(void *)(v3 + v7[714])));
  -[BWDeferredPipelineParameters setContinuousZoomWithDepthSupported:](-[BWDeferredCaptureControllerInput pipelineParameters](v20, "pipelineParameters"), "setContinuousZoomWithDepthSupported:", -[BWPhotonicEngineNodeConfiguration continuousZoomWithDepthSupported](*(void *)(v3 + v7[714])));
  if ((objc_msgSend((id)objc_msgSend(v27, "captureSettings"), "captureFlags") & 0x800) != 0)
  {
    -[BWDeferredPipelineParameters setDepthDataType:](-[BWDeferredCaptureControllerInput pipelineParameters](v20, "pipelineParameters"), "setDepthDataType:", [*(id *)(v3 + v7[714]) depthDataType]);
    -[BWDeferredPipelineParameters setDepthDataDimensions:](-[BWDeferredCaptureControllerInput pipelineParameters](v20, "pipelineParameters"), "setDepthDataDimensions:", [*(id *)(v3 + v7[714]) depthDataOutputDimensions]);
    -[BWDeferredPipelineParameters setPearlModuleType:](-[BWDeferredCaptureControllerInput pipelineParameters](v20, "pipelineParameters"), "setPearlModuleType:", [*(id *)(v3 + v7[714]) pearlModuleType]);
  }
  -[BWDeferredPipelineParameters setSfhrMode:](-[BWDeferredCaptureControllerInput pipelineParameters](v20, "pipelineParameters"), "setSfhrMode:", -[BWPhotonicEngineNodeConfiguration sfhrMode](*(void *)(v3 + v7[714])));
  double v21 = -[BWPhotonicEngineNodeConfiguration sensorCenterOffset](*(void *)(v3 + v7[714]));
  -[BWDeferredPipelineParameters setSensorCenterOffset:]([(BWDeferredCaptureControllerInput *)v20 pipelineParameters], "setSensorCenterOffset:", v21, v22);
  uint64_t v23 = [v25 enqueueInputForProcessing:v20 delegate:v3];

  if (!v23) {
    *(void *)(v3 + 920) = v20;
  }
  return v23;
}

- (uint64_t)_setupProcessingStateForClientBracketWithSettings:(void *)a3 processingPlan:
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v24 = (void *)[*(id *)(a1 + 168) controllerForType:6];
    if (!v24) {
      return 4294894081;
    }
    uint64_t v6 = *(void *)(a1 + 176);
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    char v30[2] = __65__BWPhotonicEngineNode__standardNROutputRouterWithExpectedQueue___block_invoke;
    v30[3] = &unk_1E5C28E48;
    v30[4] = v6;
    v30[5] = a1;
    id v21 = (id)[v30 copy];
    int v7 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureStreamSettingsForPortType:", objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "masterPortType")), "unifiedBracketedCaptureParams"), "count");
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    obuint64_t j = -[BWPhotonicEngineNode _processingOrderByPortTypeForSettings:]((id)a1, a2);
    uint64_t v22 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v22)
    {
      uint64_t v20 = *(void *)v27;
      while (2)
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v27 != v20) {
            objc_enumerationMutation(obj);
          }
          uint64_t v23 = v8;
          uint64_t v9 = *(void **)(*((void *)&v26 + 1) + 8 * v8);
          uint64_t v10 = [[BWNRFProcessorInput alloc] initWithSettings:a2 portType:v9];
          id v25 = -[BWPhotonicEngineNode _bufferTypesForCaptureSettings:](a1, (void *)[a2 captureSettings]);
          -[BWStillImageProcessorControllerInput addOutputSampleBufferRouter:forBufferTypes:](v10, "addOutputSampleBufferRouter:forBufferTypes:", v21);
          objc_msgSend(*(id *)(a1 + 368), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObject:", v10), v9);

          BOOL v11 = -[BWPhotonicEngineNode _processingNeededForSettings:portType:](a1, [(BWStillImageProcessorControllerInput *)v10 stillImageSettings], (uint64_t)[(BWStillImageProcessorControllerInput *)v10 portType]);
          if (v11) {
            int v12 = v7;
          }
          else {
            int v12 = 1;
          }
          [(BWNRFProcessorInput *)v10 setRemainingProcessingCount:[(BWNRFProcessorInput *)v10 remainingProcessingCount] + v12];
          objc_msgSend(*(id *)(a1 + 808), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary"), v9);
          if (v7 >= 1)
          {
            int v13 = 0;
            while (1)
            {
              if (v11)
              {
                [a3 addInput:v10 sequenceNumber:(v13 + 1) portType:v9 bufferTypes:v25];
                uint64_t v14 = -[BWPhotonicEngineNode _setupProcessingStateForIntelligentDistortionCorrectionIfNeededWithSettings:sequenceNumber:portType:processingPlan:](a1, a2, (v13 + 1), (uint64_t)v9, a3);
                if (v14)
                {
                  uint64_t v17 = v14;
                  goto LABEL_26;
                }
                uint64_t v15 = -[BWPhotonicEngineNode _setupProcessingStateForScalerIfNeededWithSettings:sequenceNumber:portType:processingPlan:](a1, a2, (v13 + 1), v9, a3);
                if (v15)
                {
                  uint64_t v17 = v15;
                  goto LABEL_26;
                }
                uint64_t v16 = objc_msgSend(v24, "enqueueInputForProcessing:delegate:processErrorRecoveryFrame:processOriginalImage:processToneMapping:processInferenceInputImage:clientBracketSequenceNumber:processSemanticRendering:provideInferenceInputImageForProcessing:processSmartStyleRenderingInput:inferencesAvailable:", v10, a1, 0, 0, 0, 0, (v13 + 1));
                if (v16) {
                  break;
                }
              }
              if ([(BWStillImageProcessorControllerInput *)v10 isMaster]) {
                -[BWPhotonicEngineNode _setupProcessingStateForDisparityIfNeededWithSettings:sequenceNumber:processingPlan:](a1, a2, (v13 + 1), a3);
              }
              if (v7 == ++v13) {
                goto LABEL_20;
              }
            }
            uint64_t v17 = v16;
LABEL_26:
            FigDebugAssert3();
            return v17;
          }
LABEL_20:
          uint64_t v8 = v23 + 1;
        }
        while (v23 + 1 != v22);
        uint64_t v22 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
        if (v22) {
          continue;
        }
        break;
      }
    }
  }
  return 0;
}

- (uint64_t)_setupProcessingStateForColorConstancyCaptureWithSettings:(void *)a3 processingPlan:
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v6 = 4294894081;
  long long v26 = (void *)[*(id *)(a1 + 168) controllerForType:6];
  if (v26)
  {
    if ([*(id *)(a1 + 168) controllerForType:12])
    {
      uint64_t v22 = (void *)[*(id *)(a1 + 168) controllerForType:17];
      if (v22)
      {
        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        v33[2] = __97__BWPhotonicEngineNode__setupProcessingStateForColorConstancyCaptureWithSettings_processingPlan___block_invoke;
        v33[3] = &unk_1E5C28E48;
        v33[4] = a1;
        v33[5] = a2;
        v32[0] = MEMORY[0x1E4F143A8];
        v32[1] = 3221225472;
        v32[2] = __97__BWPhotonicEngineNode__setupProcessingStateForColorConstancyCaptureWithSettings_processingPlan___block_invoke_332;
        v32[3] = &unk_1E5C28D80;
        v32[4] = a1;
        id v27 = -[BWPhotonicEngineNode _standardNROutputRouterWithExpectedQueue:]((id)a1, *(void *)(a1 + 176));
        id v7 = -[BWPhotonicEngineNode _bufferTypesForCaptureSettings:](a1, (void *)[a2 captureSettings]);
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        obuint64_t j = -[BWPhotonicEngineNode _processingOrderByPortTypeForSettings:]((id)a1, a2);
        uint64_t v8 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          p_vtable = &OBJC_METACLASS___BWInferenceSchedulerGraph.vtable;
          uint64_t v25 = *(void *)v29;
          while (2)
          {
            uint64_t v11 = 0;
            uint64_t v23 = v9;
            do
            {
              if (*(void *)v29 != v25) {
                objc_enumerationMutation(obj);
              }
              uint64_t v12 = *(void *)(*((void *)&v28 + 1) + 8 * v11);
              int v13 = (void *)[objc_alloc((Class)(p_vtable + 472)) initWithSettings:a2 portType:v12];
              [v13 addOutputSampleBufferRouter:v33 forBufferTypes:v7];
              [a3 addInput:v13 sequenceNumber:0 portType:v12 bufferTypes:v7];
              objc_msgSend(*(id *)(a1 + 280), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObject:", v13), v12);

              if (objc_msgSend((id)objc_msgSend(a2, "requestedSettings"), "constantColorFallbackPhotoDeliveryEnabled"))
              {
                uint64_t v14 = [[BWNRFProcessorInput alloc] initWithSettings:a2 portType:v12];
                [(BWStillImageProcessorControllerInput *)v14 addOutputSampleBufferRouter:v27 forBufferTypes:&unk_1EFB04C58];
                [a3 addInput:v14 sequenceNumber:0 portType:v12 bufferType:1];
                objc_msgSend(*(id *)(a1 + 368), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObject:", v14), v12);
                [(BWNRFProcessorInput *)v14 setRemainingProcessingCount:[(BWNRFProcessorInput *)v14 remainingProcessingCount] + 1];
                uint64_t v6 = objc_msgSend(v26, "enqueueInputForProcessing:delegate:processErrorRecoveryFrame:processOriginalImage:processToneMapping:processInferenceInputImage:clientBracketSequenceNumber:processSemanticRendering:provideInferenceInputImageForProcessing:processSmartStyleRenderingInput:inferencesAvailable:", v14, a1, 0, 0, 0, 0, 0);

                if (v6) {
                  goto LABEL_28;
                }
                uint64_t v15 = -[BWPhotonicEngineNode _setupProcessingStateForIntelligentDistortionCorrectionIfNeededWithSettings:sequenceNumber:portType:processingPlan:](a1, a2, 0, v12, a3);
                if (v15)
                {
                  uint64_t v6 = v15;
LABEL_28:
                  FigDebugAssert3();
                  return v6;
                }
              }
              uint64_t v16 = (void *)[objc_alloc((Class)(p_vtable + 472)) initWithSettings:a2 portType:v12];
              [v16 addOutputSampleBufferRouter:v33 forBufferTypes:v7];
              [a3 addInput:v16 sequenceNumber:0 portType:v12 bufferTypes:v7];
              objc_msgSend((id)objc_msgSend(*(id *)(a1 + 280), "objectForKeyedSubscript:", v12), "addObject:", v16);

              uint64_t v17 = [[BWNRFProcessorInput alloc] initWithSettings:a2 portType:v12];
              if ([*(id *)(a1 + 368) objectForKeyedSubscript:v12]) {
                objc_msgSend((id)objc_msgSend(*(id *)(a1 + 368), "objectForKeyedSubscript:", v12), "addObject:", v17);
              }
              else {
                objc_msgSend(*(id *)(a1 + 368), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObject:", v17), v12);
              }
              [(BWNRFProcessorInput *)v17 setRemainingProcessingCount:[(BWNRFProcessorInput *)v17 remainingProcessingCount] + 1];

              if (-[BWPhotonicEngineNode _processingNeededForSettings:portType:](a1, [(BWStillImageProcessorControllerInput *)v17 stillImageSettings], (uint64_t)[(BWStillImageProcessorControllerInput *)v17 portType]))
              {
                uint64_t v18 = [(BWStillImageProcessorControllerInput *)[BWColorConstancyProcessorControllerInput alloc] initWithSettings:a2 portType:v12];
                [(BWStillImageProcessorControllerInput *)v18 addOutputSampleBufferRouter:v32 forBufferTypes:v7];
                [a3 addInput:v18 sequenceNumber:0 portType:v12 bufferTypes:v7];
                [*(id *)(a1 + 632) setObject:v18 forKeyedSubscript:v12];
                uint64_t v6 = [v22 enqueueInputForProcessing:v18 delegate:a1];

                if (v6) {
                  goto LABEL_28;
                }
                [(BWStillImageProcessorControllerInput *)v17 addOutputSampleBufferRouter:v27 forBufferTypes:v7];
                [a3 addInput:v17 sequenceNumber:0 portType:v12 bufferTypes:v7];
                uint64_t v19 = objc_msgSend(v26, "enqueueInputForProcessing:delegate:processErrorRecoveryFrame:processOriginalImage:processToneMapping:processInferenceInputImage:clientBracketSequenceNumber:processSemanticRendering:provideInferenceInputImageForProcessing:processSmartStyleRenderingInput:inferencesAvailable:", v17, a1, 0, 0, 0, 0, 0);
                if (v19)
                {
                  uint64_t v6 = v19;
                  goto LABEL_28;
                }
                uint64_t v20 = -[BWPhotonicEngineNode _setupProcessingStateForIntelligentDistortionCorrectionIfNeededWithSettings:sequenceNumber:portType:processingPlan:](a1, a2, 0, v12, a3);
                uint64_t v9 = v23;
                p_vtable = (void **)(&OBJC_METACLASS___BWInferenceSchedulerGraph + 24);
                if (v20)
                {
                  uint64_t v6 = v20;
                  goto LABEL_28;
                }
              }
              ++v11;
            }
            while (v9 != v11);
            uint64_t v9 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
            if (v9) {
              continue;
            }
            break;
          }
        }
        return -[BWPhotonicEngineNode _setupProcessingStateForDisparityIfNeededWithSettings:sequenceNumber:processingPlan:](a1, a2, 0, a3);
      }
    }
  }
  return v6;
}

- (uint64_t)_setupProcessingStateForFlashCaptureWithSettings:(void *)a3 processingPlan:
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v6 = 4294894081;
  uint64_t v7 = [*(id *)(a1 + 168) controllerForType:6];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [*(id *)(a1 + 168) controllerForType:12];
    v82[0] = MEMORY[0x1E4F143A8];
    v82[1] = 3221225472;
    v82[2] = __88__BWPhotonicEngineNode__setupProcessingStateForFlashCaptureWithSettings_processingPlan___block_invoke;
    v82[3] = &unk_1E5C28D80;
    v82[4] = a1;
    uint64_t v55 = [*(id *)(a1 + 168) controllerForType:11];
    v81[0] = MEMORY[0x1E4F143A8];
    v81[1] = 3221225472;
    v81[2] = __88__BWPhotonicEngineNode__setupProcessingStateForFlashCaptureWithSettings_processingPlan___block_invoke_318;
    v81[3] = &unk_1E5C28D80;
    v81[4] = a1;
    uint64_t v10 = [*(id *)(a1 + 168) controllerForType:15];
    v80[0] = MEMORY[0x1E4F143A8];
    v80[1] = 3221225472;
    v80[2] = __88__BWPhotonicEngineNode__setupProcessingStateForFlashCaptureWithSettings_processingPlan___block_invoke_2;
    v80[3] = &unk_1E5C28E48;
    v80[4] = a1;
    v80[5] = a2;
    id v58 = -[BWPhotonicEngineNode _standardNROutputRouterWithExpectedQueue:]((id)a1, *(void *)(a1 + 176));
    id v66 = -[BWPhotonicEngineNode _bufferTypesForCaptureSettings:](a1, (void *)[a2 captureSettings]);
    v79[0] = MEMORY[0x1E4F143A8];
    v79[1] = 3221225472;
    v79[2] = __88__BWPhotonicEngineNode__setupProcessingStateForFlashCaptureWithSettings_processingPlan___block_invoke_319;
    v79[3] = &unk_1E5C28D80;
    v79[4] = a1;
    uint64_t v11 = [*(id *)(a1 + 168) controllerForType:4];
    unsigned int v12 = objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureFlags");
    int v65 = -[BWPhotonicEngineNode _isSWFRFlashCapture:](a1, a2);
    if (*(void *)(a1 + 640)) {
      unint64_t v61 = ((unint64_t)objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureFlags") >> 16) & 1;
    }
    else {
      LODWORD(v61) = 0;
    }
    char v57 = -[BWPhotonicEngineNode _inferencesRequiredByProcessorControllersForSettings:](a1, a2);
    char v13 = v65;
    if (v10) {
      char v13 = 0;
    }
    if (((v9 == 0) & (v12 >> 2)) == 0 && (v13 & 1) == 0)
    {
      int v56 = v65 ^ 1;
      if (((v65 ^ 1) & 1) != 0 || (v12 & 4) != 0)
      {
        long long v77 = 0u;
        long long v78 = 0u;
        long long v75 = 0u;
        long long v76 = 0u;
        obuint64_t j = -[BWPhotonicEngineNode _processingOrderByPortTypeForSettings:]((id)a1, a2);
        uint64_t v63 = [obj countByEnumeratingWithState:&v75 objects:v85 count:16];
        if (v63)
        {
          if ((v12 & 4) != 0) {
            char v14 = v61;
          }
          else {
            char v14 = 1;
          }
          char v54 = v14;
          uint64_t v64 = *(void *)v76;
          long long v49 = v8;
          long long v50 = a2;
          long long v48 = (void *)v10;
          uint64_t v51 = (void *)v11;
          char v59 = v12;
          while (2)
          {
            uint64_t v15 = 0;
            uint64_t v16 = (void *)v55;
            do
            {
              if (*(void *)v76 != v64) {
                objc_enumerationMutation(obj);
              }
              uint64_t v17 = *(void **)(*((void *)&v75 + 1) + 8 * v15);
              uint64_t v18 = [[BWNRFProcessorInput alloc] initWithSettings:a2 portType:v17];
              objc_msgSend(*(id *)(a1 + 368), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObject:", v18), v17);
              [(BWNRFProcessorInput *)v18 setRemainingProcessingCount:[(BWNRFProcessorInput *)v18 remainingProcessingCount] + 1];

              if (-[BWPhotonicEngineNode _processingNeededForSettings:portType:](a1, [(BWStillImageProcessorControllerInput *)v18 stillImageSettings], (uint64_t)[(BWStillImageProcessorControllerInput *)v18 portType]))
              {
                int v62 = -[BWPhotonicEngineNode _isInferenceInputImageRequiredForSettings:portType:](a1, a2, (uint64_t)v17);
                if ((v59 & 4) != 0)
                {
                  uint64_t v19 = [[BWSoftISPProcessorControllerInput alloc] initWithSettings:a2 portType:v17];
                  [(BWStillImageProcessorControllerInput *)v19 addOutputSampleBufferRouter:v82 forBufferTypes:v66];
                  [a3 addInput:v19 sequenceNumber:0 portType:v17 bufferTypes:v66];
                  objc_msgSend(*(id *)(a1 + 280), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObject:", v19), v17);
                }
                if (v65)
                {
                  uint64_t v20 = [[BWSoftISPProcessorControllerInput alloc] initWithSettings:a2 portType:v17];
                  [(BWStillImageProcessorControllerInput *)v20 addOutputSampleBufferRouter:v82 forBufferTypes:v66];
                  [a3 addInput:v20 sequenceNumber:0 portType:v17 bufferTypes:v66];
                  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 280), "objectForKeyedSubscript:", v17), "addObject:", v20);

                  id v21 = [(BWStillImageProcessorControllerInput *)[BWSWFRProcessorControllerInput alloc] initWithSettings:a2 portType:v17];
                  long long v71 = 0u;
                  long long v72 = 0u;
                  long long v73 = 0u;
                  long long v74 = 0u;
                  uint64_t v52 = [v66 countByEnumeratingWithState:&v71 objects:v84 count:16];
                  if (v52)
                  {
                    uint64_t v22 = *(void *)v72;
                    uint64_t v46 = *(void *)v72;
                    unint64_t v47 = a3;
                    while (2)
                    {
                      uint64_t v23 = 0;
                      do
                      {
                        if (*(void *)v72 != v22)
                        {
                          uint64_t v24 = v23;
                          objc_enumerationMutation(v66);
                          uint64_t v23 = v24;
                        }
                        uint64_t v53 = v23;
                        uint64_t v25 = (int)[*(id *)(*((void *)&v71 + 1) + 8 * v23) intValue];
                        long long v67 = 0u;
                        long long v68 = 0u;
                        long long v69 = 0u;
                        long long v70 = 0u;
                        long long v26 = (void *)[*(id *)(a1 + 280) objectForKeyedSubscript:v17];
                        uint64_t v27 = [v26 countByEnumeratingWithState:&v67 objects:v83 count:16];
                        if (v27)
                        {
                          uint64_t v28 = v27;
                          uint64_t v29 = *(void *)v68;
LABEL_31:
                          uint64_t v30 = 0;
                          while (1)
                          {
                            if (*(void *)v68 != v29) {
                              objc_enumerationMutation(v26);
                            }
                            if (!ubn_insertOutputRouterForInputAfterPreviousInputForBufferType_0((uint64_t)v80, v21, *(void **)(*((void *)&v67 + 1) + 8 * v30), v25))return 4294954516; {
                            if (v28 == ++v30)
                            }
                            {
                              uint64_t v28 = [v26 countByEnumeratingWithState:&v67 objects:v83 count:16];
                              if (v28) {
                                goto LABEL_31;
                              }
                              break;
                            }
                          }
                        }
                        a3 = v47;
                        [v47 addInput:v21 sequenceNumber:0 portType:v17 bufferType:v25];
                        uint64_t v23 = v53 + 1;
                        uint64_t v8 = v49;
                        a2 = v50;
                        uint64_t v16 = (void *)v55;
                        uint64_t v22 = v46;
                      }
                      while (v53 + 1 != v52);
                      uint64_t v52 = [v66 countByEnumeratingWithState:&v71 objects:v84 count:16];
                      if (v52) {
                        continue;
                      }
                      break;
                    }
                  }
                  [*(id *)(a1 + 608) setObject:v21 forKeyedSubscript:v17];
                  uint64_t v6 = [v48 enqueueInputForProcessing:v21 delegate:a1];

                  if (v6) {
                    return v6;
                  }
                  if (v62)
                  {
                    long long v31 = [[BWNRFProcessorInput alloc] initWithSettings:a2 portType:v17];
                    -[BWStillImageProcessorControllerInput addOutputSampleBufferRouter:forBufferTypes:](v31, "addOutputSampleBufferRouter:forBufferTypes:", -[BWPhotonicEngineNode _ubInferenceInputRouter]((id)a1), &unk_1EFB04C10);
                    [a3 addInput:v31 sequenceNumber:0 portType:v17 bufferType:15];
                    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 368), "objectForKeyedSubscript:", v17), "insertObject:atIndex:", v31, 0);
                    uint64_t v6 = objc_msgSend(v8, "enqueueInputForProcessing:delegate:processErrorRecoveryFrame:processOriginalImage:processToneMapping:processInferenceInputImage:clientBracketSequenceNumber:processSemanticRendering:provideInferenceInputImageForProcessing:processSmartStyleRenderingInput:inferencesAvailable:", v31, a1, 0, 0, 0, 1, 0);

                    a2 = v50;
                    if (v6) {
                      goto LABEL_76;
                    }
                  }
                  if (v61)
                  {
                    uint64_t v32 = [[BWNRFProcessorInput alloc] initWithSettings:a2 portType:v17];
                    [(BWStillImageProcessorControllerInput *)v21 addOutputSampleBufferRouter:v82 forBufferTypes:v66];
                    -[BWStillImageProcessorControllerInput addOutputSampleBufferRouter:forBufferTypes:](v32, "addOutputSampleBufferRouter:forBufferTypes:", -[BWPhotonicEngineNode _ubRERRouter]((id)a1), v66);
                    [a3 addInput:v32 sequenceNumber:0 portType:v17 bufferType:1];
                    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 368), "objectForKeyedSubscript:", v17), "insertObject:atIndex:", v32, 1);
                    BOOL v33 = *(void *)(a1 + 824) && BWIsSmartStyleCapture(a2);
                    HIWORD(v44) = v33;
                    WORD2(v44) = 0;
                    LODWORD(v44) = 0;
                    uint64_t v6 = objc_msgSend(v49, "enqueueInputForProcessing:delegate:processErrorRecoveryFrame:processOriginalImage:processToneMapping:processInferenceInputImage:clientBracketSequenceNumber:processSemanticRendering:provideInferenceInputImageForProcessing:processSmartStyleRenderingInput:inferencesAvailable:", v32, a1, 0, 0, 1, 0, v44);

                    uint64_t v8 = v49;
                    if (v6) {
                      goto LABEL_76;
                    }
                  }
                }
                if ((objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureFlags") & 0x80) != 0)
                {
                  if (!v16) {
                    return 4294954516;
                  }
                  long long v34 = [(BWStillImageProcessorControllerInput *)[BWLearnedNRInput alloc] initWithSettings:a2 portType:[(BWStillImageProcessorControllerInput *)v18 portType]];
                  [(BWStillImageProcessorControllerInput *)v34 addOutputSampleBufferRouter:v81 forBufferTypes:v66];
                  objc_msgSend(a3, "addInput:sequenceNumber:portType:bufferTypes:", v34, 0, -[BWStillImageProcessorControllerInput portType](v18, "portType"), v66);
                  objc_msgSend(*(id *)(a1 + 416), "setObject:forKeyedSubscript:", v34, -[BWStillImageProcessorControllerInput portType](v34, "portType"));
                  uint64_t v6 = [v16 enqueueInputForProcessing:v34 delegate:a1];

                  if (v6) {
                    return v6;
                  }
                }
                if ((v62 & v56) != 0)
                {
                  -[BWStillImageProcessorControllerInput addOutputSampleBufferRouter:forBufferTypes:](v18, "addOutputSampleBufferRouter:forBufferTypes:", -[BWPhotonicEngineNode _ubInferenceInputRouter]((id)a1), &unk_1EFB04C28);
                  [a3 addInput:v18 sequenceNumber:0 portType:v17 bufferType:15];
                }
                [(BWStillImageProcessorControllerInput *)v18 addOutputSampleBufferRouter:v58 forBufferTypes:v66];
                [a3 addInput:v18 sequenceNumber:0 portType:v17 bufferTypes:v66];
                BOOL v35 = 0;
                if ((v54 & 1) == 0)
                {
                  if (*(void *)(a1 + 824)) {
                    BOOL v35 = BWIsSmartStyleCapture(a2);
                  }
                  else {
                    BOOL v35 = 0;
                  }
                }
                HIBYTE(v45) = v57;
                BYTE6(v45) = v35;
                BYTE5(v45) = v62 & v56;
                BYTE4(v45) = 0;
                LODWORD(v45) = 0;
                uint64_t v36 = objc_msgSend(v8, "enqueueInputForProcessing:delegate:processErrorRecoveryFrame:processOriginalImage:processToneMapping:processInferenceInputImage:clientBracketSequenceNumber:processSemanticRendering:provideInferenceInputImageForProcessing:processSmartStyleRenderingInput:inferencesAvailable:", v18, a1, 0, 0, 0, 0, v45);
                if (v36)
                {
                  uint64_t v6 = v36;
LABEL_76:
                  FigDebugAssert3();
                  return v6;
                }
                uint64_t v37 = -[BWPhotonicEngineNode _setupProcessingStateForIntelligentDistortionCorrectionIfNeededWithSettings:sequenceNumber:portType:processingPlan:](a1, a2, 0, (uint64_t)v17, a3);
                if (v37)
                {
                  uint64_t v6 = v37;
                  goto LABEL_76;
                }
                uint64_t v38 = -[BWPhotonicEngineNode _setupProcessingStateForScalerIfNeededWithSettings:sequenceNumber:portType:processingPlan:](a1, a2, 0, v17, a3);
                if (v38)
                {
                  uint64_t v6 = v38;
                  goto LABEL_76;
                }
                uint64_t v39 = -[BWPhotonicEngineNode _setupProcessingStateForDeepZoomWithSettings:sequenceNumber:portType:processingPlan:]((id *)a1, a2, 0, (uint64_t)v17, a3);
                if (v39)
                {
                  uint64_t v6 = v39;
                  goto LABEL_76;
                }
                if (v61)
                {
                  if (!v51) {
                    return 4294954516;
                  }
                  long long v40 = [(BWStillImageProcessorControllerInput *)[BWRedEyeReductionControllerInput alloc] initWithSettings:a2 portType:v17];
                  [(BWStillImageProcessorControllerInput *)v40 addOutputSampleBufferRouter:v79 forBufferTypes:&unk_1EFB04C40];
                  [a3 addInput:v40 sequenceNumber:0 portType:v17 bufferTypes:&unk_1EFB04C40];
                  [*(id *)(a1 + 648) setObject:v40 forKeyedSubscript:v17];
                  uint64_t v6 = [v51 enqueueInputForProcessing:v40 delegate:a1];

                  if (v6) {
                    return v6;
                  }
                }
                uint64_t v41 = -[BWPhotonicEngineNode _setupProcessingStateForSmartStyleWithSettings:sequenceNumber:portType:processingPlan:](a1, a2, 0, (uint64_t)v17, a3);
                if (v41)
                {
                  uint64_t v6 = v41;
                  goto LABEL_76;
                }
              }
              ++v15;
            }
            while (v15 != v63);
            uint64_t v63 = [obj countByEnumeratingWithState:&v75 objects:v85 count:16];
            if (v63) {
              continue;
            }
            break;
          }
        }
        uint64_t v42 = -[BWPhotonicEngineNode _setupProcessingStateForJasperDisparityIfNeededWithSettings:processingPlan:](a1, a2, a3);
        if (!v42) {
          return -[BWPhotonicEngineNode _setupProcessingStateForDisparityIfNeededWithSettings:sequenceNumber:processingPlan:](a1, a2, 0, a3);
        }
        return v42;
      }
      else
      {
        return 4294954516;
      }
    }
  }
  return v6;
}

- (uint64_t)_setupProcessingStateForSingleImageCaptureWithSettings:(void *)a3 processingPlan:
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v44 = (void *)[*(id *)(a1 + 168) controllerForType:6];
  if (!v44) {
    return 4294894081;
  }
  uint64_t v37 = a3;
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = __94__BWPhotonicEngineNode__setupProcessingStateForSingleImageCaptureWithSettings_processingPlan___block_invoke;
  v55[3] = &unk_1E5C28D80;
  v55[4] = a1;
  uint64_t v38 = (void *)[*(id *)(a1 + 168) controllerForType:11];
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __94__BWPhotonicEngineNode__setupProcessingStateForSingleImageCaptureWithSettings_processingPlan___block_invoke_313;
  v54[3] = &unk_1E5C28D80;
  v54[4] = a1;
  id v39 = -[BWPhotonicEngineNode _standardNROutputRouterWithExpectedQueue:]((id)a1, *(void *)(a1 + 176));
  obuint64_t j = (id)[MEMORY[0x1E4F1CA48] array];
  id v40 = -[BWPhotonicEngineNode _bufferTypesForCaptureSettings:](a1, (void *)[a2 captureSettings]);
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  unint64_t v6 = a1;
  uint64_t v7 = (void *)a1;
  uint64_t v8 = a2;
  id v9 = -[BWPhotonicEngineNode _processingOrderByPortTypeForSettings:](v7, a2);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v50 objects:v57 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v51;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v51 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v50 + 1) + 8 * i);
        uint64_t v15 = [[BWNRFProcessorInput alloc] initWithSettings:v8 portType:v14];
        objc_msgSend(*(id *)(v6 + 368), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObject:", v15), v14);
        [obj addObject:v15];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v50 objects:v57 count:16];
    }
    while (v11);
  }
  uint64_t v16 = v8;
  char v43 = -[BWPhotonicEngineNode _isSemanticRenderingCapture:](v6, v8);
  char v42 = -[BWPhotonicEngineNode _inferencesRequiredByProcessorControllersForSettings:](v6, v8);
  if (*(void *)(v6 + 824))
  {
    uint64_t v17 = v37;
    if (BWIsSmartStyleCapture(v8)) {
      unint64_t v41 = ((unint64_t)objc_msgSend((id)objc_msgSend(v8, "captureSettings"), "captureFlags") >> 7) & 1;
    }
    else {
      LOBYTE(v41) = 0;
    }
  }
  else
  {
    LOBYTE(v41) = 0;
    uint64_t v17 = v37;
  }
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  uint64_t v18 = [obj countByEnumeratingWithState:&v46 objects:v56 count:16];
  id v19 = v39;
  id v20 = v40;
  if (v18)
  {
    uint64_t v21 = v18;
    uint64_t v22 = *(void *)v47;
    while (2)
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v47 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v24 = *(void **)(*((void *)&v46 + 1) + 8 * j);
        if (-[BWPhotonicEngineNode _processingNeededForSettings:portType:](v6, (void *)[v24 stillImageSettings], objc_msgSend(v24, "portType")))
        {
          if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v16, "captureSettings"), "captureStreamSettingsForPortType:", objc_msgSend(v24, "portType")), "sensorRawCapturedForFinalImageProcessing"))-[BWPhotonicEngineNode _setupSoftISPProcessingStateIfNeededWithSettings:portType:](v6, v16, objc_msgSend(v24, "portType")); {
          if ((objc_msgSend((id)objc_msgSend(v16, "captureSettings"), "captureFlags") & 0x80) != 0
          }
            && (-[BWPhotonicEngineNode _isDeferredRawLearnedNRCapture:](v6, v16) & 1) == 0)
          {
            if (!v38) {
              return 4294954516;
            }
            uint64_t v25 = -[BWStillImageProcessorControllerInput initWithSettings:portType:]([BWLearnedNRInput alloc], "initWithSettings:portType:", v16, [v24 portType]);
            [(BWStillImageProcessorControllerInput *)v25 addOutputSampleBufferRouter:v54 forBufferTypes:v40];
            objc_msgSend(v17, "addInput:sequenceNumber:portType:bufferTypes:", v25, 0, objc_msgSend(v24, "portType"), v40);
            objc_msgSend(*(id *)(v6 + 416), "setObject:forKeyedSubscript:", v25, -[BWStillImageProcessorControllerInput portType](v25, "portType"));
            uint64_t v26 = [v38 enqueueInputForProcessing:v25 delegate:v6];

            id v19 = v39;
            id v20 = v40;
            if (v26) {
              return v26;
            }
          }
          int v27 = -[BWPhotonicEngineNode _isInferenceInputImageRequiredForSettings:portType:](v6, v16, [v24 portType]);
          char v28 = v27;
          if (v27)
          {
            [v24 addOutputSampleBufferRouter:-[BWPhotonicEngineNode _ubInferenceInputRouter]((id)v6) forBufferTypes:&unk_1EFB04BF8];
            objc_msgSend(v17, "addInput:sequenceNumber:portType:bufferType:", v24, 0, objc_msgSend(v24, "portType"), 15);
          }
          [v24 addOutputSampleBufferRouter:v19 forBufferTypes:v20];
          objc_msgSend(v17, "addInput:sequenceNumber:portType:bufferTypes:", v24, 0, objc_msgSend(v24, "portType"), v20);
          HIBYTE(v36) = v42;
          BYTE6(v36) = v41;
          BYTE5(v36) = v28;
          BYTE4(v36) = v43;
          LODWORD(v36) = 0;
          uint64_t v29 = objc_msgSend(v44, "enqueueInputForProcessing:delegate:processErrorRecoveryFrame:processOriginalImage:processToneMapping:processInferenceInputImage:clientBracketSequenceNumber:processSemanticRendering:provideInferenceInputImageForProcessing:processSmartStyleRenderingInput:inferencesAvailable:", v24, v6, 0, 0, 0, 0, v36);
          if (v29)
          {
            uint64_t v26 = v29;
LABEL_45:
            FigDebugAssert3();
            return v26;
          }
          uint64_t v30 = -[BWPhotonicEngineNode _setupProcessingStateForIntelligentDistortionCorrectionIfNeededWithSettings:sequenceNumber:portType:processingPlan:](v6, v16, 0, [v24 portType], v17);
          if (v30)
          {
            uint64_t v26 = v30;
            goto LABEL_45;
          }
          uint64_t v31 = -[BWPhotonicEngineNode _setupProcessingStateForScalerIfNeededWithSettings:sequenceNumber:portType:processingPlan:](v6, v16, 0, (void *)[v24 portType], v17);
          if (v31)
          {
            uint64_t v26 = v31;
            goto LABEL_45;
          }
          uint64_t v32 = -[BWPhotonicEngineNode _setupProcessingStateForDeepZoomWithSettings:sequenceNumber:portType:processingPlan:]((id *)v6, v16, 0, [v24 portType], v17);
          if (v32)
          {
            uint64_t v26 = v32;
            goto LABEL_45;
          }
          uint64_t v33 = -[BWPhotonicEngineNode _setupProcessingStateForSmartStyleWithSettings:sequenceNumber:portType:processingPlan:](v6, v16, 0, [v24 portType], v17);
          if (v33)
          {
            uint64_t v26 = v33;
            goto LABEL_45;
          }
          -[BWPhotonicEngineNode _setupDeferredProcessingWithSettings:portType:](v6, v16, (void *)[v24 portType]);
        }
        objc_msgSend(v24, "setRemainingProcessingCount:", objc_msgSend(v24, "remainingProcessingCount") + 1);
      }
      uint64_t v21 = [obj countByEnumeratingWithState:&v46 objects:v56 count:16];
      if (v21) {
        continue;
      }
      break;
    }
  }
  uint64_t v34 = -[BWPhotonicEngineNode _setupProcessingStateForJasperDisparityIfNeededWithSettings:processingPlan:](v6, v16, v17);
  if (v34) {
    return v34;
  }
  uint64_t v26 = -[BWPhotonicEngineNode _setupProcessingStateForDisparityIfNeededWithSettings:sequenceNumber:processingPlan:](v6, v16, 0, v17);
  if (!v26) {
    -[BWPhotonicEngineNode _setupSoftISPOutputRoutingIfNeededWithOutputSampleBufferRouter:processingPlan:](v6, (uint64_t)v55, v17);
  }
  return v26;
}

- (id)_nrfOutputSbufRouter
{
  if (result)
  {
    v1[0] = MEMORY[0x1E4F143A8];
    v1[1] = 3221225472;
    v1[2] = __44__BWPhotonicEngineNode__nrfOutputSbufRouter__block_invoke;
    v1[3] = &unk_1E5C28D80;
    v1[4] = result;
    return (id)[v1 copy];
  }
  return result;
}

- (uint64_t)_setupProcessingStateForDeepZoomWithSettings:(uint64_t)a3 sequenceNumber:(uint64_t)a4 portType:(void *)a5 processingPlan:
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  if (!_FigIsCurrentDispatchQueue())
  {
    uint64_t v35 = v5;
    LODWORD(v34) = 0;
    FigDebugAssert3();
  }
  if (!a1[88] || (objc_msgSend((id)objc_msgSend(a2, "requestedSettings"), "bypassUpscaling") & 1) != 0) {
    goto LABEL_42;
  }
  int v11 = objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureType");
  uint64_t v12 = objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureFlags");
  int v13 = [a1[88] type];
  int v14 = v13;
  if (v11 == 1)
  {
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    if ((v12 & 0x80) == 0 || v13 != 2) {
      goto LABEL_44;
    }
  }
  else
  {
    if (v11 != 12) {
      goto LABEL_42;
    }
    if ((v12 & 0x200000000) == 0)
    {
      if (v13 != 1) {
        goto LABEL_42;
      }
      goto LABEL_15;
    }
    if (v13 != 3)
    {
LABEL_42:
      uint64_t v16 = 0;
      goto LABEL_43;
    }
  }
LABEL_15:
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __108__BWPhotonicEngineNode__setupProcessingStateForDeepZoomWithSettings_sequenceNumber_portType_processingPlan___block_invoke;
  v49[3] = &unk_1E5C28E20;
  v49[4] = a1;
  v49[5] = a2;
  v49[6] = a4;
  uint64_t v16 = [(BWStillImageProcessorControllerInput *)[BWDeepZoomProcessorInput alloc] initWithSettings:a2 portType:a4];
  [a2 requestedSettings];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_19;
  }
  uint64_t v17 = objc_msgSend((id)objc_msgSend(a2, "requestedSettings"), "semanticStyle");
  uint64_t v18 = 0;
  id v19 = 0;
  if (v14 != 3 || !v17) {
    goto LABEL_20;
  }
  if (!FigCaptureVideoDimensionsAreValid([a1[88] stereoPhotoOutputDimensions]))
  {
    id v19 = +[BWDeepFusionProcessorInput inputForOnlyApplyingSemanticStyleWithSettings:a2 portType:a4];
    uint64_t v18 = v48;
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __108__BWPhotonicEngineNode__setupProcessingStateForDeepZoomWithSettings_sequenceNumber_portType_processingPlan___block_invoke_347;
    v48[3] = &unk_1E5C28E48;
    v48[4] = a1;
    v48[5] = v19;
  }
  else
  {
LABEL_19:
    uint64_t v18 = 0;
    id v19 = 0;
  }
LABEL_20:
  uint64_t v37 = (uint64_t)v18;
  uint64_t v38 = v19;
  id v20 = -[BWPhotonicEngineNode _bufferTypesExcludingErrorRecoveryTypesForCaptureSettings:](a1, objc_msgSend(a2, "captureSettings", v34, v35));
  uint64_t v36 = a1;
  obuint64_t j = -[BWPhotonicEngineNode _errorRecoveryBufferTypesForBufferTypes:](a1, v20);
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v44 objects:v52 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v45 != v23) {
          objc_enumerationMutation(v20);
        }
        uint64_t v25 = (int)[*(id *)(*((void *)&v44 + 1) + 8 * i) intValue];
        uint64_t v26 = (void *)[a5 lastAddedInputForSequenceNumber:a3 portType:a4 bufferType:v25];
        if (v26)
        {
          if (!ubn_insertOutputRouterForInputAfterPreviousInputForBufferType_0((uint64_t)v49, v16, v26, v25))goto LABEL_46; {
          [a5 addInput:v16 sequenceNumber:a3 portType:a4 bufferType:v25];
          }
        }
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v44 objects:v52 count:16];
    }
    while (v22);
  }
  if (v37 && v38)
  {
    if (!ubn_insertOutputRouterForInputAfterPreviousInputForBufferType_0(v37, v38, v16, 13))
    {
LABEL_46:
      uint64_t v15 = 4294954516;
      goto LABEL_44;
    }
    [a5 addInput:v38 sequenceNumber:a3 portType:a4 bufferType:13];
  }
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v27 = [obj countByEnumeratingWithState:&v40 objects:v51 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v41;
    do
    {
      for (uint64_t j = 0; j != v28; ++j)
      {
        if (*(void *)v41 != v29) {
          objc_enumerationMutation(obj);
        }
        uint64_t v31 = *(void **)(*((void *)&v40 + 1) + 8 * j);
        uint64_t v32 = objc_msgSend(a5, "lastAddedInputForSequenceNumber:portType:bufferType:", a3, a4, (int)objc_msgSend(v31, "intValue"));
        long long v50 = v31;
        objc_msgSend(v32, "addBypassedProcessorType:forBufferTypes:", 10, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v50, 1));
      }
      uint64_t v28 = [obj countByEnumeratingWithState:&v40 objects:v51 count:16];
    }
    while (v28);
  }
  [v36[89] setObject:v16 forKeyedSubscript:a4];
LABEL_43:
  uint64_t v15 = 0;
LABEL_44:

  return v15;
}

- (uint64_t)_setupProcessingStateForSmartStyleWithSettings:(uint64_t)a3 sequenceNumber:(uint64_t)a4 portType:(void *)a5 processingPlan:
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v10 = result;
    if (!_FigIsCurrentDispatchQueue())
    {
      uint64_t v20 = v5;
      LODWORD(v19) = 0;
      FigDebugAssert3();
    }
    if (*(void *)(v10 + 824))
    {
      uint64_t result = BWIsSmartStyleCapture(a2);
      if (!result) {
        return result;
      }
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __110__BWPhotonicEngineNode__setupProcessingStateForSmartStyleWithSettings_sequenceNumber_portType_processingPlan___block_invoke;
      v25[3] = &unk_1E5C28E48;
      v25[4] = v10;
      v25[5] = a4;
      int v11 = [[BWSmartStyleRenderingProcessorInput alloc] initWithSettings:a2 portType:a4];
      id v12 = -[BWPhotonicEngineNode _bufferTypesForCaptureSettings:](v10, (void *)[a2 captureSettings]);
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v26 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v22;
        while (2)
        {
          uint64_t v16 = 0;
          do
          {
            if (*(void *)v22 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v17 = (int)objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * v16), "intValue", v19, v20);
            uint64_t v18 = (void *)[a5 lastAddedInputForSequenceNumber:a3 portType:a4 bufferType:v17];
            if (v18)
            {
              if (!ubn_insertOutputRouterForInputAfterPreviousInputForBufferType_0((uint64_t)v25, v11, v18, v17))return 4294954516; {
              [a5 addInput:v11 sequenceNumber:a3 portType:a4 bufferType:v17];
              }
            }
            ++v16;
          }
          while (v14 != v16);
          uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v26 count:16];
          if (v14) {
            continue;
          }
          break;
        }
      }
      objc_msgSend(*(id *)(v10 + 832), "setObject:forKeyedSubscript:", v11, a4, v19);
    }
    return 0;
  }
  return result;
}

- (uint64_t)_setupProcessingStateForDisparityIfNeededWithSettings:(uint64_t)a3 sequenceNumber:(void *)a4 processingPlan:
{
  uint64_t v4 = a1;
  if (a1)
  {
    uint64_t v14 = 0;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x2020000000;
    int v17 = 0;
    if (!_FigIsCurrentDispatchQueue()) {
      FigDebugAssert3();
    }
    if (-[BWPhotonicEngineNode _generateDisparityForSettings:](v4, a2))
    {
      uint64_t v8 = [*(id *)(v4 + 168) controllerForType:8];
      if (v8)
      {
        id v9 = -[BWStereoDisparityProcessorInput initWithSettings:portType:]([BWStereoDisparityProcessorInput alloc], "initWithSettings:portType:", a2, objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "masterPortType"));
        ++*(_DWORD *)(v4 + 792);
        uint64_t v10 = *(void **)(v4 + 800);
        blocuint64_t k = MEMORY[0x1E4F143A8];
        uint64_t v19 = 3221225472;
        uint64_t v20 = __65__BWPhotonicEngineNode__standardNROutputRouterWithExpectedQueue___block_invoke;
        long long v21 = &unk_1E5C28E48;
        long long v22 = v10;
        uint64_t v23 = v4;
        -[BWStillImageProcessorControllerInput addOutputSampleBufferRouter:forBufferTypes:](v9, "addOutputSampleBufferRouter:forBufferTypes:", (id)[&block copy], &unk_1EFB04CA0);
        objc_msgSend(a4, "addInput:sequenceNumber:portType:bufferType:", v9, a3, objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "masterPortType"), 20);
        if (objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureType") == 7) {
          objc_msgSend(*(id *)(v4 + 816), "setObject:forKeyedSubscript:", v9, objc_msgSend(NSNumber, "numberWithUnsignedInt:", a3));
        }
        else {
          *(void *)(v4 + 784) = v9;
        }
        int v11 = *(NSObject **)(v4 + 800);
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __108__BWPhotonicEngineNode__setupProcessingStateForDisparityIfNeededWithSettings_sequenceNumber_processingPlan___block_invoke;
        v13[3] = &unk_1E5C28DA8;
        v13[4] = v8;
        void v13[5] = v9;
        void v13[6] = v4;
        void v13[7] = &v14;
        blocuint64_t k = MEMORY[0x1E4F143A8];
        uint64_t v19 = 3221225472;
        uint64_t v20 = __ubn_dispatch_sync_block_invoke_0;
        long long v21 = &unk_1E5C249F0;
        long long v22 = v13;
        dispatch_sync(v11, &block);
      }
      else
      {
        *((_DWORD *)v15 + 6) = -73215;
      }
    }
    uint64_t v4 = *((unsigned int *)v15 + 6);
    _Block_object_dispose(&v14, 8);
  }
  return v4;
}

- (uint64_t)_setupProcessingStateForDeepFusionWithSettings:(void *)a3 processingPlan:
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v38 = (void *)[*(id *)(a1 + 168) controllerForType:2];
  if (!v38) {
    return 4294894081;
  }
  if (!_FigIsCurrentDispatchQueue())
  {
    uint64_t v33 = v3;
    LODWORD(v32) = 0;
    FigDebugAssert3();
  }
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __86__BWPhotonicEngineNode__setupProcessingStateForDeepFusionWithSettings_processingPlan___block_invoke;
  v48[3] = &unk_1E5C28D80;
  v48[4] = a1;
  int v37 = -[BWPhotonicEngineNode _inferencesRequiredByProcessorControllersForSettings:](a1, a2);
  BOOL v36 = *(void *)(a1 + 824) && BWIsSmartStyleCapture(a2);
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  obuint64_t j = (id)objc_msgSend((id)objc_msgSend(a2, "captureSettings", v32, v33), "captureStreamSettings");
  uint64_t v7 = [obj countByEnumeratingWithState:&v44 objects:v51 count:16];
  if (!v7) {
    return 0;
  }
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)v45;
  uint64_t v34 = *(void *)v45;
  while (2)
  {
    uint64_t v10 = 0;
    uint64_t v35 = v8;
    do
    {
      if (*(void *)v45 != v9) {
        objc_enumerationMutation(obj);
      }
      int v11 = *(void **)(*((void *)&v44 + 1) + 8 * v10);
      if (-[BWPhotonicEngineNode _deepFusionProcessorInputNeededForSettings:portType:](a1, a2, [v11 portType]))
      {
        if (-[BWPhotonicEngineNode _isInferenceInputImageRequiredForSettings:portType:](a1, a2, [v11 portType]))
        {
          if ([*(id *)(a1 + 112) deferredPhotoProcessorEnabled]) {
            uint64_t v12 = objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "downgradedDeepFusionEnhancedResolutionCapture");
          }
          else {
            uint64_t v12 = 1;
          }
        }
        else
        {
          uint64_t v12 = 0;
        }
        if (v37) {
          unint64_t v13 = ((unint64_t)[v11 captureFlags] >> 33) & 1;
        }
        else {
          unint64_t v13 = 0;
        }
        uint64_t v14 = -[BWDeepFusionProcessorInput initWithSettings:portType:processInferenceInputImage:processQuadraForEnhancedResolutionInferenceInputImage:processSmartStyleRenderingInput:]([BWDeepFusionProcessorInput alloc], "initWithSettings:portType:processInferenceInputImage:processQuadraForEnhancedResolutionInferenceInputImage:processSmartStyleRenderingInput:", a2, [v11 portType], v12, v13, v36);
        id v15 = -[BWPhotonicEngineNode _bufferTypesForCaptureSettings:](a1, (void *)[a2 captureSettings]);
        [(BWStillImageProcessorControllerInput *)v14 addOutputSampleBufferRouter:v48 forBufferTypes:v15];
        uint64_t v16 = (void *)[MEMORY[0x1E4F1CA48] array];
        int v17 = v16;
        if (v12) {
          [v16 addObject:&unk_1EFB02528];
        }
        if (v13) {
          [v17 addObject:&unk_1EFB02600];
        }
        if ([v17 count])
        {
          v49[0] = MEMORY[0x1E4F143A8];
          v49[1] = 3221225472;
          v49[2] = __47__BWPhotonicEngineNode__ubInferenceInputRouter__block_invoke;
          v49[3] = &unk_1E5C28D80;
          v49[4] = a1;
          -[BWStillImageProcessorControllerInput addOutputSampleBufferRouter:forBufferTypes:](v14, "addOutputSampleBufferRouter:forBufferTypes:", (id)[v49 copy], v17);
          objc_msgSend(a3, "addInput:sequenceNumber:portType:bufferTypes:", v14, 0, objc_msgSend(v11, "portType"), v17);
        }
        objc_msgSend(a3, "addInput:sequenceNumber:portType:bufferTypes:", v14, 0, objc_msgSend(v11, "portType"), v15);
        objc_msgSend(*(id *)(a1 + 432), "setObject:forKeyedSubscript:", v14, -[BWStillImageProcessorControllerInput portType](v14, "portType"));
        uint64_t v18 = [v38 enqueueInputForProcessing:v14 delegate:a1];

        if (v18) {
          return v18;
        }
        uint64_t v19 = -[BWPhotonicEngineNode _setupProcessingStateForIntelligentDistortionCorrectionIfNeededWithSettings:sequenceNumber:portType:processingPlan:](a1, a2, 0, (uint64_t)[(BWStillImageProcessorControllerInput *)v14 portType], a3);
        if (v19)
        {
          uint64_t v18 = v19;
LABEL_50:
          FigDebugAssert3();
          return v18;
        }
        uint64_t v20 = -[BWPhotonicEngineNode _setupProcessingStateForScalerIfNeededWithSettings:sequenceNumber:portType:processingPlan:](a1, a2, 0, [(BWStillImageProcessorControllerInput *)v14 portType], a3);
        if (v20)
        {
          uint64_t v18 = v20;
          goto LABEL_50;
        }
        if (objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "learnedNRStereoPhotoFrameFlag"))
        {
          long long v42 = 0u;
          long long v43 = 0u;
          long long v40 = 0u;
          long long v41 = 0u;
          long long v21 = objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "secondaryPortTypes");
          uint64_t v22 = [v21 countByEnumeratingWithState:&v40 objects:v50 count:16];
          if (v22)
          {
            uint64_t v23 = v22;
            uint64_t v24 = *(void *)v41;
            while (2)
            {
              for (uint64_t i = 0; i != v23; ++i)
              {
                if (*(void *)v41 != v24) {
                  objc_enumerationMutation(v21);
                }
                uint64_t v26 = -[BWPhotonicEngineNode _setupProcessingStateForIntelligentDistortionCorrectionIfNeededWithSettings:sequenceNumber:portType:processingPlan:](a1, a2, 0, *(void *)(*((void *)&v40 + 1) + 8 * i), a3);
                if (v26)
                {
                  uint64_t v18 = v26;
                  goto LABEL_50;
                }
                uint64_t v27 = -[BWPhotonicEngineNode _setupProcessingStateForScalerIfNeededWithSettings:sequenceNumber:portType:processingPlan:](a1, a2, 0, [(BWStillImageProcessorControllerInput *)v14 portType], a3);
                if (v27)
                {
                  uint64_t v18 = v27;
                  goto LABEL_50;
                }
              }
              uint64_t v23 = [v21 countByEnumeratingWithState:&v40 objects:v50 count:16];
              if (v23) {
                continue;
              }
              break;
            }
          }
        }
        uint64_t v28 = -[BWPhotonicEngineNode _setupProcessingStateForDeepZoomWithSettings:sequenceNumber:portType:processingPlan:]((id *)a1, a2, 0, (uint64_t)[(BWStillImageProcessorControllerInput *)v14 portType], a3);
        if (v28)
        {
          uint64_t v18 = v28;
          goto LABEL_50;
        }
        uint64_t v29 = -[BWPhotonicEngineNode _setupProcessingStateForStereoPhotoDeepZoomTransferWithSettings:processingPlan:](a1, a2, a3);
        if (v29)
        {
          uint64_t v18 = v29;
          goto LABEL_50;
        }
        uint64_t v30 = -[BWPhotonicEngineNode _setupProcessingStateForSmartStyleWithSettings:sequenceNumber:portType:processingPlan:](a1, a2, 0, (uint64_t)[(BWStillImageProcessorControllerInput *)v14 portType], a3);
        uint64_t v9 = v34;
        uint64_t v8 = v35;
        if (v30)
        {
          uint64_t v18 = v30;
          goto LABEL_50;
        }
      }
      ++v10;
    }
    while (v10 != v8);
    uint64_t v8 = [obj countByEnumeratingWithState:&v44 objects:v51 count:16];
    uint64_t v18 = 0;
    if (v8) {
      continue;
    }
    return v18;
  }
}

- (uint64_t)_setupProcessingStateForPointCloudDepthIfNeededWithSettings:(void *)a3 processingPlan:
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v6 = result;
    if (!_FigIsCurrentDispatchQueue())
    {
      uint64_t v28 = v3;
      LODWORD(v27) = 0;
      FigDebugAssert3();
    }
    if ((objc_msgSend((id)objc_msgSend(a2, "captureSettings", v27, v28), "captureFlags") & 0x200) != 0
      && *(void *)(v6 + 880))
    {
      uint64_t v7 = [*(id *)(v6 + 168) controllerForType:9];
      if (v7)
      {
        uint64_t v8 = (void *)v7;
        id v9 = -[BWPhotonicEngineNode _bufferTypesForCaptureSettings:](v6, (void *)[a2 captureSettings]);
        v47[0] = MEMORY[0x1E4F143A8];
        v47[1] = 3221225472;
        v47[2] = __99__BWPhotonicEngineNode__setupProcessingStateForPointCloudDepthIfNeededWithSettings_processingPlan___block_invoke;
        v47[3] = &unk_1E5C28E48;
        v47[4] = v6;
        v47[5] = v8;
        uint64_t v10 = (void *)[MEMORY[0x1E4F1CA48] array];
        long long v43 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        obuint64_t j = (id)objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "portTypes");
        uint64_t v11 = [obj countByEnumeratingWithState:&v43 objects:v50 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v44;
          uint64_t v29 = *(void *)v44;
          uint64_t v30 = a2;
          uint64_t v32 = v10;
          do
          {
            uint64_t v14 = 0;
            uint64_t v31 = v12;
            do
            {
              if (*(void *)v44 != v13) {
                objc_enumerationMutation(obj);
              }
              id v15 = *(void **)(*((void *)&v43 + 1) + 8 * v14);
              if (-[BWPhotonicEngineNode _processingNeededForSettings:portType:](v6, a2, (uint64_t)v15))
              {
                uint64_t v34 = v14;
                uint64_t v16 = -[BWJasperColorStillsExecutorInput initWithSettings:portType:timeOfFlightCameraType:]([BWJasperColorStillsExecutorInput alloc], "initWithSettings:portType:timeOfFlightCameraType:", a2, v15, objc_msgSend((id)objc_msgSend(*(id *)(v6 + 104), "supplementalPointCloudCaptureDevice"), "timeOfFlightCameraType"));
                long long v39 = 0u;
                long long v40 = 0u;
                long long v41 = 0u;
                long long v42 = 0u;
                uint64_t v17 = [v9 countByEnumeratingWithState:&v39 objects:v49 count:16];
                if (v17)
                {
                  uint64_t v18 = v17;
                  uint64_t v19 = *(void *)v40;
                  while (2)
                  {
                    for (uint64_t i = 0; i != v18; ++i)
                    {
                      if (*(void *)v40 != v19) {
                        objc_enumerationMutation(v9);
                      }
                      uint64_t v21 = (int)[*(id *)(*((void *)&v39 + 1) + 8 * i) intValue];
                      uint64_t v22 = (void *)[a3 lastAddedInputForSequenceNumber:0 portType:v15 bufferType:v21];
                      if (v22)
                      {
                        if (!ubn_insertOutputRouterForInputAfterPreviousInputForBufferType_0((uint64_t)v47, v16, v22, v21))return 4294954516; {
                        [a3 addInput:v16 sequenceNumber:0 portType:v15 bufferType:v21];
                        }
                      }
                    }
                    uint64_t v18 = [v9 countByEnumeratingWithState:&v39 objects:v49 count:16];
                    if (v18) {
                      continue;
                    }
                    break;
                  }
                }
                a2 = v30;
                if (objc_msgSend(v15, "isEqualToString:", objc_msgSend((id)objc_msgSend(v30, "captureSettings"), "masterPortType")))objc_msgSend(v32, "insertObject:atIndex:", v16, 0); {
                else
                }
                  [v32 addObject:v16];
                uint64_t v13 = v29;
                uint64_t v12 = v31;
                uint64_t v14 = v34;
              }
              ++v14;
            }
            while (v14 != v12);
            uint64_t v12 = [obj countByEnumeratingWithState:&v43 objects:v50 count:16];
            uint64_t v10 = v32;
          }
          while (v12);
        }
        long long v37 = 0u;
        long long v38 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        uint64_t result = [v10 countByEnumeratingWithState:&v35 objects:v48 count:16];
        if (result)
        {
          uint64_t v23 = result;
          uint64_t v24 = *(void *)v36;
          do
          {
            uint64_t v25 = 0;
            do
            {
              if (*(void *)v36 != v24) {
                objc_enumerationMutation(v10);
              }
              uint64_t v26 = *(void **)(*((void *)&v35 + 1) + 8 * v25);
              [v8 enqueueInputForProcessing:v26 delegate:v6];
              objc_msgSend(*(id *)(v6 + 888), "setObject:forKeyedSubscript:", v26, objc_msgSend(v26, "portType"));
              ++v25;
            }
            while (v23 != v25);
            uint64_t result = [v10 countByEnumeratingWithState:&v35 objects:v48 count:16];
            uint64_t v23 = result;
          }
          while (result);
        }
      }
      else
      {
        return 4294894081;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (id)_softISPFusionCaptureOutputSbufRouter
{
  if (result)
  {
    v1[0] = MEMORY[0x1E4F143A8];
    v1[1] = 3221225472;
    v1[2] = __61__BWPhotonicEngineNode__softISPFusionCaptureOutputSbufRouter__block_invoke;
    v1[3] = &unk_1E5C28D80;
    v1[4] = result;
    return (id)[v1 copy];
  }
  return result;
}

void __86__BWPhotonicEngineNode__setupProcessingStateForDeepFusionWithSettings_processingPlan___block_invoke(uint64_t a1, const void *a2, uint64_t a3, void *a4, int a5)
{
  if (!_FigIsCurrentDispatchQueue()) {
    FigDebugAssert3();
  }
  -[BWPhotonicEngineNode _waitForAndMergeInferencesIfNeededForSampleBuffer:processorInput:](*(BOOL **)(a1 + 32), a2, a4);
  if (!a5)
  {
    if ((objc_msgSend((id)objc_msgSend(a4, "captureSettings"), "captureFlags") & 0x200000000) == 0) {
      -[BWPhotonicEngineNode _beginStereoPhotoProcessingIfNeededForSettings:](*(void *)(a1 + 32), (void *)[a4 stillImageSettings]);
    }
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = [NSString stringWithFormat:@"buffer of type '%@' requested for '%@'", BWStillImageBufferTypeToShortString(a3), a4];
    -[BWPhotonicEngineNode _emitSampleBuffer:description:](v10, a2, v11);
  }
}

- (uint64_t)_beginStereoPhotoProcessingIfNeededForSettings:(uint64_t)result
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v3 = result;
    uint64_t result = objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "learnedNRStereoPhotoFrameFlag");
    if (result)
    {
      if (-[BWPhotonicEngineNode _setStereoPhotoInverseHomograhiesOnDCProcessorInputsWithSettings:](v3, a2))
      {
        return FigDebugAssert3();
      }
      else
      {
        uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithArray:", objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "secondaryPortTypes"));
        objc_msgSend(v4, "insertObject:atIndex:", objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "masterPortType"), 0);
        long long v15 = 0u;
        long long v16 = 0u;
        long long v13 = 0u;
        long long v14 = 0u;
        uint64_t result = [v4 countByEnumeratingWithState:&v13 objects:v18 count:16];
        if (result)
        {
          uint64_t v5 = result;
          uint64_t v6 = *(void *)v14;
          do
          {
            uint64_t v7 = 0;
            do
            {
              if (*(void *)v14 != v6) {
                objc_enumerationMutation(v4);
              }
              uint64_t v8 = *(void *)(*((void *)&v13 + 1) + 8 * v7);
              id v9 = (const void *)[*(id *)(v3 + 968) objectForKeyedSubscript:v8];
              if (v9) {
                CFTypeRef v10 = CFRetain(v9);
              }
              else {
                CFTypeRef v10 = 0;
              }
              [*(id *)(v3 + 968) setObject:0 forKeyedSubscript:v8];
              uint64_t v11 = *(NSObject **)(v3 + 176);
              v12[0] = MEMORY[0x1E4F143A8];
              v12[1] = 3221225472;
              void v12[2] = __71__BWPhotonicEngineNode__beginStereoPhotoProcessingIfNeededForSettings___block_invoke;
              v12[3] = &unk_1E5C24F10;
              v12[4] = v3;
              void v12[5] = v10;
              block[0] = MEMORY[0x1E4F143A8];
              block[1] = 3221225472;
              block[2] = __ubn_dispatch_async_block_invoke_0;
              block[3] = &unk_1E5C249F0;
              block[4] = v12;
              dispatch_async(v11, block);
              ++v7;
            }
            while (v5 != v7);
            uint64_t result = [v4 countByEnumeratingWithState:&v13 objects:v18 count:16];
            uint64_t v5 = result;
          }
          while (result);
        }
      }
    }
  }
  return result;
}

- (uint64_t)_setupProcessingStateForStereoPhotoDeepZoomTransferWithSettings:(void *)a3 processingPlan:
{
  uint64_t v4 = a1;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (!_FigIsCurrentDispatchQueue())
    {
      uint64_t v19 = v3;
      LODWORD(v18) = 0;
      FigDebugAssert3();
    }
    if (FigCaptureVideoDimensionsAreValid(objc_msgSend(*(id *)(v4 + 704), "stereoPhotoOutputDimensions", v18, v19))
      && objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "learnedNRStereoPhotoFrameFlag")
      && (uint64_t v7 = *(void **)(v4 + 704)) != 0
      && [v7 type] == 3
      && objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureType") == 12
      && objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureStreamSettings"), "count") == 2)
    {
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __103__BWPhotonicEngineNode__setupProcessingStateForStereoPhotoDeepZoomTransferWithSettings_processingPlan___block_invoke;
      v24[3] = &unk_1E5C28D80;
      v24[4] = v4;
      uint64_t v8 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "secondaryPortTypes"), "firstObject");
      id v9 = [(BWStillImageProcessorControllerInput *)[BWDeepZoomProcessorInput alloc] initWithSettings:a2 portType:v8];
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      CFTypeRef v10 = objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "portTypes");
      uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v25 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v21;
        while (2)
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v21 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = *(void *)(*((void *)&v20 + 1) + 8 * i);
            long long v16 = (void *)[a3 lastAddedInputForSequenceNumber:0 portType:v15 bufferType:38];
            if (!v16
              || !ubn_insertOutputRouterForInputAfterPreviousInputForBufferType_0((uint64_t)v24, v9, v16, 38))
            {
              uint64_t v4 = 4294954516;
              goto LABEL_22;
            }
            [a3 addInput:v9 sequenceNumber:0 portType:v15 bufferType:38];
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v25 count:16];
          if (v12) {
            continue;
          }
          break;
        }
      }
      [*(id *)(v4 + 712) setObject:v9 forKeyedSubscript:v8];
    }
    else
    {
      id v9 = 0;
    }
    uint64_t v4 = 0;
LABEL_22:
  }
  return v4;
}

void __94__BWPhotonicEngineNode__setupProcessingStateForSingleImageCaptureWithSettings_processingPlan___block_invoke(uint64_t a1, const void *a2, uint64_t a3, void *a4, uint64_t a5)
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
  if (!a2 || a5)
  {
    CFTypeRef v12 = CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E4F53070], 0);
    -[BWPhotonicEngineNode _resetProcessingState](*(void *)(a1 + 32));
    uint64_t v13 = *(void *)(a1 + 32);
    uint64_t v14 = [a4 stillImageSettings];
    [NSString stringWithFormat:@"type '%@' requested for '%@'", BWStillImageBufferTypeToShortString(a3), a4];
    -[BWPhotonicEngineNode _emitError:stillImageSettings:metadata:description:](v13, a5, v14, (uint64_t)v12);
  }
  else
  {
    uint64_t v11 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 416), "objectForKeyedSubscript:", objc_msgSend(a4, "portType"));
    if (v11)
    {
      [v11 setInputFrame:a2];
    }
    else
    {
      uint64_t v15 = -[BWPhotonicEngineNode _nextNRInputForPortType:](*(id **)(a1 + 32), [a4 portType]);
      [v15 addFrame:a2];
      -[BWPhotonicEngineNode _checkIfProcessingCompletedForNRFProcessorInput:](*(void *)(a1 + 32), v15);
    }
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
    uint64_t v2 = objc_msgSend(result[46], "objectForKeyedSubscript:", a2, 0);
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

void __94__BWPhotonicEngineNode__setupProcessingStateForSingleImageCaptureWithSettings_processingPlan___block_invoke_313(uint64_t a1, const void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  if (!_FigIsCurrentDispatchQueue())
  {
    uint64_t v18 = v5;
    LODWORD(v17) = 0;
    FigDebugAssert3();
  }
  id v11 = (id)objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 368), "objectForKeyedSubscript:", objc_msgSend(a4, "portType", v17, v18)), "firstObject");
  int v12 = a5;
  if (a2)
  {
    if (a5)
    {
      uint64_t v13 = (void *)[*(id *)(*(void *)(a1 + 32) + 168) controllerForType:6];
      [v13 cancelProcessing];
      int v12 = objc_msgSend(v13, "enqueueInputForProcessing:delegate:processErrorRecoveryFrame:processOriginalImage:processToneMapping:processInferenceInputImage:clientBracketSequenceNumber:processSemanticRendering:provideInferenceInputImageForProcessing:processSmartStyleRenderingInput:inferencesAvailable:", v11, *(void *)(a1 + 32), 1, 0, 0, 0, 0);
    }
    else
    {
      int v12 = 0;
    }
    [v11 addFrame:a2];
    -[BWPhotonicEngineNode _checkIfProcessingCompletedForNRFProcessorInput:](*(void *)(a1 + 32), v11);
  }
  if (v12)
  {
    CFTypeRef v14 = CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E4F53070], 0);
    -[BWPhotonicEngineNode _processorControllerDidFinishProcessingInputForPortType:processorType:captureRequestIdentifier:](*(void *)(a1 + 32), [v11 portType], 6, objc_msgSend((id)objc_msgSend(a4, "settings"), "captureRequestIdentifier"));
    uint64_t v15 = *(void *)(a1 + 32);
    uint64_t v16 = [a4 stillImageSettings];
    [NSString stringWithFormat:@"type '%@' requested for '%@'", BWStillImageBufferTypeToShortString(a3), a4];
    -[BWPhotonicEngineNode _emitError:stillImageSettings:metadata:description:](v15, a5, v16, (uint64_t)v14);
  }
}

void __88__BWPhotonicEngineNode__setupProcessingStateForFlashCaptureWithSettings_processingPlan___block_invoke(uint64_t a1, const void *a2, uint64_t a3, void *a4, uint64_t a5)
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
  if (!a2 || a5)
  {
    CFTypeRef v12 = CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E4F53070], 0);
    -[BWPhotonicEngineNode _processorControllerDidFinishProcessingInputForPortType:processorType:captureRequestIdentifier:](*(void *)(a1 + 32), [a4 portType], 6, objc_msgSend((id)objc_msgSend(a4, "settings"), "captureRequestIdentifier"));
    uint64_t v13 = *(void *)(a1 + 32);
    uint64_t v14 = [a4 stillImageSettings];
    [NSString stringWithFormat:@"type '%@' requested for '%@'", BWStillImageBufferTypeToShortString(a3), a4];
    -[BWPhotonicEngineNode _emitError:stillImageSettings:metadata:description:](v13, a5, v14, (uint64_t)v12);
    -[BWPhotonicEngineNode _resetProcessingState](*(void *)(a1 + 32));
  }
  else
  {
    id v11 = -[BWPhotonicEngineNode _nextNRInputForPortType:](*(id **)(a1 + 32), [a4 portType]);
    [v11 addFrame:a2];
    -[BWPhotonicEngineNode _checkIfProcessingCompletedForNRFProcessorInput:](*(void *)(a1 + 32), v11);
  }
}

void __88__BWPhotonicEngineNode__setupProcessingStateForFlashCaptureWithSettings_processingPlan___block_invoke_318(uint64_t a1, const void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  if (!_FigIsCurrentDispatchQueue())
  {
    uint64_t v18 = v5;
    LODWORD(v17) = 0;
    FigDebugAssert3();
  }
  id v11 = (id)objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 368), "objectForKeyedSubscript:", objc_msgSend(a4, "portType", v17, v18)), "firstObject");
  int v12 = a5;
  if (a2)
  {
    if (a5)
    {
      uint64_t v13 = (void *)[*(id *)(*(void *)(a1 + 32) + 168) controllerForType:6];
      [v13 cancelProcessing];
      int v12 = objc_msgSend(v13, "enqueueInputForProcessing:delegate:processErrorRecoveryFrame:processOriginalImage:processToneMapping:processInferenceInputImage:clientBracketSequenceNumber:processSemanticRendering:provideInferenceInputImageForProcessing:processSmartStyleRenderingInput:inferencesAvailable:", v11, *(void *)(a1 + 32), 1, 0, 0, 0, 0);
    }
    else
    {
      int v12 = 0;
    }
    [v11 addFrame:a2];
    -[BWPhotonicEngineNode _checkIfProcessingCompletedForNRFProcessorInput:](*(void *)(a1 + 32), v11);
  }
  if (v12)
  {
    CFTypeRef v14 = CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E4F53070], 0);
    -[BWPhotonicEngineNode _processorControllerDidFinishProcessingInputForPortType:processorType:captureRequestIdentifier:](*(void *)(a1 + 32), [v11 portType], 6, objc_msgSend((id)objc_msgSend(a4, "settings"), "captureRequestIdentifier"));
    uint64_t v15 = *(void *)(a1 + 32);
    uint64_t v16 = [a4 stillImageSettings];
    [NSString stringWithFormat:@"type '%@' requested for '%@'", BWStillImageBufferTypeToShortString(a3), a4];
    -[BWPhotonicEngineNode _emitError:stillImageSettings:metadata:description:](v15, a5, v16, (uint64_t)v14);
  }
}

void __88__BWPhotonicEngineNode__setupProcessingStateForFlashCaptureWithSettings_processingPlan___block_invoke_2(uint64_t a1, const void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (!_FigIsCurrentDispatchQueue())
  {
    uint64_t v19 = v5;
    LODWORD(v18) = 0;
    FigDebugAssert3();
  }
  long long v10 = (void *)CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  char v11 = objc_msgSend((id)objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E4F53CA0]), "BOOLValue");
  int v12 = -[BWPhotonicEngineNode _isInferenceInputImageRequiredForSettings:portType:](*(void *)(a1 + 32), *(void **)(a1 + 40), [a4 portType]);
  if (!a5 && (v11 & 1) == 0 && v12)
  {
    if (dword_1EB4C5670)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    objc_msgSend(-[BWPhotonicEngineNode _nextNRInputForPortType:](*(id **)(a1 + 32), objc_msgSend(a4, "portType", v18, v19)), "addFrame:", a2);
  }
  if (dword_1EB4C5670)
  {
    CFTypeRef v14 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (a5
    || (id v15 = (id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 608), "objectForKeyedSubscript:", objc_msgSend(a4, "portType"))) == 0)
  {
    uint64_t v16 = *(void *)(a1 + 32);
    uint64_t v17 = objc_msgSend(a4, "stillImageSettings", v18, v19);
    [NSString stringWithFormat:@"type '%@' requested for '%@'", BWStillImageBufferTypeToShortString(a3), a4];
    -[BWPhotonicEngineNode _emitError:stillImageSettings:metadata:description:](v16, a5, v17, (uint64_t)v10);
  }
  else
  {
    [v15 addFrame:a2];
  }
}

void __88__BWPhotonicEngineNode__setupProcessingStateForFlashCaptureWithSettings_processingPlan___block_invoke_319(uint64_t a1, const void *a2, uint64_t a3, void *a4, uint64_t a5)
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
    uint64_t v13 = [a4 stillImageSettings];
    [NSString stringWithFormat:@"type '%@' requested for '%@'", BWStillImageBufferTypeToShortString(a3), a4];
    -[BWPhotonicEngineNode _emitError:stillImageSettings:metadata:description:](v12, a5, v13, (uint64_t)v11);
  }
  else
  {
    CFTypeRef v14 = -[BWPhotonicEngineNode _nextNRInputForPortType:](*(id **)(a1 + 32), [a4 portType]);
    [v14 addFrame:a2];
    -[BWPhotonicEngineNode _checkIfProcessingCompletedForNRFProcessorInput:](*(void *)(a1 + 32), v14);
  }
}

void __97__BWPhotonicEngineNode__setupProcessingStateForColorConstancyCaptureWithSettings_processingPlan___block_invoke(uint64_t a1, const void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (!_FigIsCurrentDispatchQueue())
  {
    uint64_t v17 = v5;
    LODWORD(v16) = 0;
    FigDebugAssert3();
  }
  long long v10 = (void *)CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  if (dword_1EB4C5670)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (a5) {
    goto LABEL_13;
  }
  if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "requestedSettings"), "constantColorFallbackPhotoDeliveryEnabled")&& objc_msgSend((id)objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E4F53CA0]), "BOOLValue"))
  {
    if (dword_1EB4C5670)
    {
      uint64_t v12 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    objc_msgSend(-[BWPhotonicEngineNode _nextNRInputForPortType:](*(id **)(a1 + 32), objc_msgSend(a4, "portType", v16, v17)), "addFrame:", a2);
  }
  id v13 = (id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 632), "objectForKeyedSubscript:", objc_msgSend(a4, "portType", v16));
  if (!v13)
  {
LABEL_13:
    uint64_t v14 = *(void *)(a1 + 32);
    uint64_t v15 = objc_msgSend(a4, "stillImageSettings", v16);
    [NSString stringWithFormat:@"type '%@' requested for '%@'", BWStillImageBufferTypeToShortString(a3), a4];
    -[BWPhotonicEngineNode _emitError:stillImageSettings:metadata:description:](v14, a5, v15, (uint64_t)v10);
  }
  else
  {
    [v13 addFrame:a2];
  }
}

void __97__BWPhotonicEngineNode__setupProcessingStateForColorConstancyCaptureWithSettings_processingPlan___block_invoke_332(uint64_t a1, const void *a2, uint64_t a3, uint64_t a4, int a5)
{
  if (!_FigIsCurrentDispatchQueue())
  {
    FigDebugAssert3();
    if (!a2) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (a2) {
LABEL_3:
  }
    CFRetain(a2);
LABEL_4:
  uint64_t v10 = *(void *)(a1 + 32);
  CFTypeRef v11 = *(NSObject **)(v10 + 176);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __97__BWPhotonicEngineNode__setupProcessingStateForColorConstancyCaptureWithSettings_processingPlan___block_invoke_2;
  v12[3] = &unk_1E5C2D7E0;
  int v13 = a5;
  void v12[6] = a3;
  void v12[7] = a2;
  v12[4] = a4;
  void v12[5] = v10;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __ubn_dispatch_async_block_invoke_0;
  block[3] = &unk_1E5C249F0;
  block[4] = v12;
  dispatch_async(v11, block);
}

void __97__BWPhotonicEngineNode__setupProcessingStateForColorConstancyCaptureWithSettings_processingPlan___block_invoke_2(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (dword_1EB4C5670)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (*(void *)(a1 + 56) && !*(_DWORD *)(a1 + 64))
  {
    uint64_t v7 = -[BWPhotonicEngineNode _nextNRInputForPortType:](*(id **)(a1 + 40), [*(id *)(a1 + 32) portType]);
    [v7 addFrame:*(void *)(a1 + 56)];
    -[BWPhotonicEngineNode _checkIfProcessingCompletedForNRFProcessorInput:](*(void *)(a1 + 40), v7);
  }
  else
  {
    -[BWPhotonicEngineNode _processorControllerDidFinishProcessingInputForPortType:processorType:captureRequestIdentifier:](*(void *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "portType", v9, v10), 6, objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "settings"), "captureRequestIdentifier"));
    CFTypeRef v3 = CMGetAttachment(*(CMAttachmentBearerRef *)(a1 + 56), (CFStringRef)*MEMORY[0x1E4F53070], 0);
    uint64_t v4 = *(unsigned int *)(a1 + 64);
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = [*(id *)(a1 + 32) stillImageSettings];
    [NSString stringWithFormat:@"type '%@' requested for '%@'", BWStillImageBufferTypeToShortString(*(void *)(a1 + 48)), *(void *)(a1 + 32)];
    -[BWPhotonicEngineNode _emitError:stillImageSettings:metadata:description:](v5, v4, v6, (uint64_t)v3);
    -[BWPhotonicEngineNode _resetProcessingState](*(void *)(a1 + 40));
  }
  long long v8 = *(const void **)(a1 + 56);
  if (v8) {
    CFRelease(v8);
  }
}

- (id)_errorRecoveryBufferTypesForBufferTypes:(id)result
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    CFTypeRef v3 = (void *)[MEMORY[0x1E4F1CA48] array];
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
          uint64_t v10 = &unk_1EFB04D78;
          if (v8 != 2)
          {
            if (v8 != 5) {
              continue;
            }
            uint64_t v10 = &unk_1EFB04D90;
          }
        }
        else if (v8 == 7 || v8 == 13)
        {
          uint64_t v10 = &unk_1EFB04DA8;
        }
        else
        {
          if (v8 != 33) {
            continue;
          }
          uint64_t v10 = &unk_1EFB04DC0;
        }
        [v3 addObjectsFromArray:v10];
      }
      uint64_t v5 = [a2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (!v5) {
        return (id)[v3 copy];
      }
    }
  }
  return result;
}

- (id)_bufferTypesExcludingErrorRecoveryTypesForCaptureSettings:(id)result
{
  if (result)
  {
    uint64_t v2 = result;
    CFTypeRef v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithArray:", -[BWPhotonicEngineNode _bufferTypesForCaptureSettings:]((uint64_t)result, a2));
    objc_msgSend(v3, "removeObjectsInArray:", -[BWPhotonicEngineNode _errorRecoveryBufferTypesForBufferTypes:](v2, v3));
    uint64_t v4 = (void *)[v3 copy];
    return v4;
  }
  return result;
}

void __139__BWPhotonicEngineNode__setupProcessingStateForIntelligentDistortionCorrectionIfNeededWithSettings_sequenceNumber_portType_processingPlan___block_invoke(uint64_t a1, const void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  v19[23] = *MEMORY[0x1E4F143B8];
  if (dword_1EB4C5670)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (_FigIsCurrentDispatchQueue())
  {
    if (a5) {
      goto LABEL_5;
    }
  }
  else
  {
    uint64_t v17 = v18;
    LODWORD(v16) = 0;
    FigDebugAssert3();
    if (a5)
    {
LABEL_5:
      if (a3 != 14)
      {
        v19[0] = [NSNumber numberWithUnsignedLongLong:a3];
        objc_msgSend(a4, "addBypassedProcessorType:forBufferTypes:", 7, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v19, 1));
        CFTypeRef v11 = CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E4F53070], 0);
        uint64_t v12 = *(void *)(a1 + 32);
        uint64_t v13 = [a4 stillImageSettings];
        [NSString stringWithFormat:@"type '%@' requested for '%@'", BWStillImageBufferTypeToShortString(a3), a4];
        -[BWPhotonicEngineNode _emitError:stillImageSettings:metadata:description:](v12, a5, v13, (uint64_t)v11);
      }
      return;
    }
  }
  uint64_t v14 = -[BWPhotonicEngineNode _applyingZoomBeforeDeepZoomAllowedWithSampleBuffer:bufferType:portType:](*(void *)(a1 + 32), (uint64_t)a2, a3, *(void *)(a1 + 40));
  uint64_t v15 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 664), "objectForKeyedSubscript:", objc_msgSend(a4, "portType"));
  [v15 setApplyZoom:v14];
  if ([v15 processIntelligentDistortionCorrection]
    && objc_msgSend(*(id *)(a1 + 48), "containsObject:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", a3)))
  {
    [v15 setProcessIntelligentDistortionCorrection:0];
  }
  objc_msgSend(v15, "addImage:imageBufferType:", a2, a3, v16, v17);
}

- (uint64_t)_applyingZoomBeforeDeepZoomAllowedWithSampleBuffer:(uint64_t)a3 bufferType:(uint64_t)a4 portType:
{
  if (result)
  {
    uint64_t v4 = result;
    if (!*(void *)(result + 704)) {
      return 1;
    }
    uint64_t v8 = [*(id *)(result + 712) objectForKeyedSubscript:a4];
    uint64_t result = 1;
    if (a3 != 38 && v8)
    {
      if (([*(id *)(v4 + 704) type] == 1
         || [*(id *)(v4 + 704) type] == 2)
        && +[BWDeepZoomProcessorControllerConfiguration doDeepZoomStandardOrLiteForSampleBuffer:type:sensorConfiguration:intermediateZoomSrcRectOut:intermediateZoomDstRectOut:](BWDeepZoomProcessorControllerConfiguration, "doDeepZoomStandardOrLiteForSampleBuffer:type:sensorConfiguration:intermediateZoomSrcRectOut:intermediateZoomDstRectOut:", a2, [*(id *)(v4 + 704) type], objc_msgSend((id)-[BWPhotonicEngineNodeConfiguration sensorConfigurationsByPortType](*(void *)(v4 + 112)), "objectForKeyedSubscript:", a4), 0, 0))
      {
        return +[BWDeepZoomProcessorControllerConfiguration deepZoomProcessingModeForType:sensorConfiguration:](BWDeepZoomProcessorControllerConfiguration, "deepZoomProcessingModeForType:sensorConfiguration:", [*(id *)(v4 + 704) type], objc_msgSend((id)-[BWPhotonicEngineNodeConfiguration sensorConfigurationsByPortType](*(void *)(v4 + 112)), "objectForKeyedSubscript:", a4)) == 2;
      }
      return 1;
    }
  }
  return result;
}

void __108__BWPhotonicEngineNode__setupProcessingStateForDeepZoomWithSettings_sequenceNumber_portType_processingPlan___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  cf[16] = *(CFTypeRef *)MEMORY[0x1E4F143B8];
  if (_FigIsCurrentDispatchQueue())
  {
    if (a5)
    {
LABEL_22:
      uint64_t v21 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", a3, v19);
      objc_msgSend(a4, "addBypassedProcessorType:forBufferTypes:", 10, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v21, 1));
      CFTypeRef v16 = CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E4F53070], 0);
      uint64_t v17 = *(void *)(a1 + 32);
      uint64_t v18 = [a4 stillImageSettings];
      [NSString stringWithFormat:@"type '%@' requested for '%@'", BWStillImageBufferTypeToShortString(a3), a4];
      -[BWPhotonicEngineNode _emitError:stillImageSettings:metadata:description:](v17, a5, v18, (uint64_t)v16);
      return;
    }
  }
  else
  {
    uint64_t v20 = v5;
    LODWORD(v19) = 0;
    FigDebugAssert3();
    if (a5) {
      goto LABEL_22;
    }
  }
  if (dword_1EB4C5670)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  int v12 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 112), "optimizedEnhancedResolutionDepthPipelineEnabled", v19, v20);
  if (a3 == 13 && v12 && (objc_msgSend((id)objc_msgSend(a4, "captureSettings"), "captureFlags") & 0x800) != 0)
  {
    cf[0] = 0;
    uint64_t CopyIncludingMetadata = BWCMSampleBufferCreateCopyIncludingMetadata((CMSampleBufferRef)a2, (CMSampleBufferRef *)cf);
    if (CopyIncludingMetadata)
    {
LABEL_18:
      a5 = CopyIncludingMetadata;
      goto LABEL_22;
    }
    BWSampleBufferRemoveAttachedMedia(cf[0], 0x1EFA6A660);
    BWSampleBufferRemoveAttachedMedia(cf[0], 0x1EFA74720);
    CMSetAttachment(cf[0], @"StillImageBufferFrameType", (CFTypeRef)[NSNumber numberWithUnsignedLongLong:13], 1u);
    -[BWPhotonicEngineNode _emitSampleBuffer:description:](*(void *)(a1 + 32), cf[0], @"Deep Fusion 12MP");
    if (cf[0]) {
      CFRelease(cf[0]);
    }
    if (BWCIFilterArrayContainsPortraitFilters(objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "requestedSettings"), "processedImageFilters")))
    {
      os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 736));
      *(void *)(*(void *)(a1 + 32) + 744) = dispatch_semaphore_create(0);
      os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 736));
      dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 744), 0xFFFFFFFFFFFFFFFFLL);
    }
  }
  uint64_t v14 = (void *)[*(id *)(*(void *)(a1 + 32) + 712) objectForKeyedSubscript:*(void *)(a1 + 48)];
  if (!v14)
  {
    a5 = 4294954516;
    goto LABEL_22;
  }
  uint64_t v15 = v14;
  uint64_t CopyIncludingMetadata = -[BWPhotonicEngineNode _ensureDeepZoomInputEnqueued:](*(void *)(a1 + 32), v14);
  if (CopyIncludingMetadata) {
    goto LABEL_18;
  }
  [v15 addSampleBuffer:a2 bufferType:a3];
  if ((objc_msgSend((id)objc_msgSend(a4, "captureSettings"), "captureFlags") & 0x200000000) != 0) {
    -[BWPhotonicEngineNode _beginStereoPhotoProcessingIfNeededForSettings:](*(void *)(a1 + 32), (void *)[a4 stillImageSettings]);
  }
}

- (uint64_t)_ensureDeepZoomInputEnqueued:(uint64_t)result
{
  if (result)
  {
    uint64_t v4 = result;
    if (!_FigIsCurrentDispatchQueue())
    {
      uint64_t v7 = v2;
      LODWORD(v6) = 0;
      FigDebugAssert3();
    }
    if (objc_msgSend(a2, "isEnqueued", v6, v7)) {
      return 0;
    }
    if (!a2) {
      return 4294954516;
    }
    uint64_t v5 = (void *)-[BWPhotonicEngineNode _waitAndSafelyGetProcessorControllerForType:](v4, 10);
    if (!v5) {
      return 4294954510;
    }
    uint64_t result = [v5 enqueueInputForProcessing:a2 delegate:v4];
    if (!result)
    {
      [a2 setEnqueued:1];
      return 0;
    }
  }
  return result;
}

void __108__BWPhotonicEngineNode__setupProcessingStateForDeepZoomWithSettings_sequenceNumber_portType_processingPlan___block_invoke_347(uint64_t a1, opaqueCMSampleBuffer *a2, uint64_t a3, void *a4, uint64_t a5)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (!_FigIsCurrentDispatchQueue()) {
    FigDebugAssert3();
  }
  if (*(void *)(*(void *)(a1 + 32) + 544))
  {
    if (!a2) {
      goto LABEL_9;
    }
  }
  else
  {
    int v23 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    if (!a2) {
      goto LABEL_9;
    }
  }
  if (!a5)
  {
    [*(id *)(*(void *)(a1 + 32) + 456) flushToMinimumCapacity:0];
    [*(id *)(*(void *)(a1 + 32) + 720) flushToMinimumCapacity:0];
    objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 168), "controllerForType:", 2), "enqueueInputForProcessing:delegate:", *(void *)(a1 + 40), *(void *)(a1 + 32));
    CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(a2);
    CFTypeRef v12 = CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E4F53070], 0);
    CFDictionaryRef v13 = CMCopyDictionaryOfAttachments((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a2, 1u);
    uint64_t v14 = BWStillImageCaptureFrameFlagsForSampleBuffer(a2);
    uint64_t v15 = (void *)[(__CFDictionary *)v13 mutableCopy];
    [*(id *)(a1 + 40) setEvZeroReferenceFrameAttachments:v15];
    CMSampleBufferGetPresentationTimeStamp(&v21, a2);
    CFTypeRef v16 = *(void **)(a1 + 40);
    CMTime v20 = v21;
    [v16 setEvZeroReferenceFramePTS:&v20];

    [*(id *)(a1 + 40) allInferencesDelivered];
    [*(id *)(a1 + 40) addBuffer:ImageBuffer metadata:v12 bufferType:13 captureFrameFlags:v14];
    return;
  }
LABEL_9:
  CFTypeRef v17 = CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  uint64_t v18 = *(void *)(a1 + 32);
  uint64_t v19 = [a4 stillImageSettings];
  [NSString stringWithFormat:@"type '%@' requested for '%@'", BWStillImageBufferTypeToShortString(a3), a4];
  -[BWPhotonicEngineNode _emitError:stillImageSettings:metadata:description:](v18, a5, v19, (uint64_t)v17);
}

- (void)_ensureSmartStyleRenderingInputEnqueued:(void *)result
{
  if (result)
  {
    uint64_t v4 = (uint64_t)result;
    if (!_FigIsCurrentDispatchQueue())
    {
      uint64_t v8 = v2;
      LODWORD(v7) = 0;
      FigDebugAssert3();
    }
    char v5 = objc_msgSend(a2, "isEnqueued", v7, v8);
    uint64_t result = 0;
    if (a2)
    {
      if ((v5 & 1) == 0)
      {
        uint64_t result = (void *)-[BWPhotonicEngineNode _waitAndSafelyGetProcessorControllerForType:](v4, 16);
        if (result)
        {
          uint64_t v6 = result;
          objc_msgSend(result, "updateSmartStyleProcessorConfigurationIfNeededForApplyOnly:", objc_msgSend(a2, "applyOnly"));
          uint64_t result = (void *)[v6 enqueueInputForProcessing:a2 delegate:v4];
          if (!result)
          {
            [a2 setEnqueued:1];
            return 0;
          }
        }
      }
    }
  }
  return result;
}

void __103__BWPhotonicEngineNode__setupProcessingStateForStereoPhotoDeepZoomTransferWithSettings_processingPlan___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  v39[23] = *MEMORY[0x1E4F143B8];
  CFTypeRef cf = 0;
  if (!_FigIsCurrentDispatchQueue()) {
    FigDebugAssert3();
  }
  if (dword_1EB4C5670)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  CFTypeRef v11 = (CFStringRef *)MEMORY[0x1E4F53070];
  if (a5)
  {
    CFTypeRef v15 = 0;
  }
  else if (*(void *)(*(void *)(a1 + 32) + 984))
  {
    uint64_t v12 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "captureSettings"), "secondaryPortTypes"), "firstObject");
    if (objc_msgSend((id)objc_msgSend(a4, "portType"), "isEqualToString:", v12))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      CFTypeRef v14 = *(CFTypeRef *)(v13 + 984);
      CFTypeRef cf = v14;
      *(void *)(v13 + 984) = 0;
      if (a2) {
        CFTypeRef v15 = CFRetain(a2);
      }
      else {
        CFTypeRef v15 = 0;
      }
    }
    else
    {
      BWCMSampleBufferCreateCopyIncludingMetadata((CMSampleBufferRef)a2, (CMSampleBufferRef *)&cf);
      uint64_t v22 = *(void *)(a1 + 32);
      CFTypeRef v15 = *(CFTypeRef *)(v22 + 984);
      *(void *)(v22 + 984) = 0;
      uint64_t v23 = *(void *)(a1 + 32);
      uint64_t v24 = NSString;
      uint64_t v25 = (void *)[a4 portType];
      uint64_t v27 = BWPortTypeToDisplayString(v25, v26);
      uint64_t v28 = [v24 stringWithFormat:@"stereo photo buffer for '%@' of type '%@'", v27, BWStillImageBufferTypeToShortString(a3)];
      -[BWPhotonicEngineNode _emitSampleBuffer:description:](v23, a2, v28);
      CFTypeRef v14 = cf;
    }
    uint64_t v30 = (void *)CMGetAttachment(v14, *v11, 0);
    uint64_t v31 = *MEMORY[0x1E4F53538];
    uint64_t v32 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithDictionary:", objc_msgSend(v30, "objectForKeyedSubscript:", *MEMORY[0x1E4F53538]));
    [v32 setObject:&unk_1EFB04C70 forKeyedSubscript:*MEMORY[0x1E4F53608]];
    [v30 setObject:v32 forKeyedSubscript:v31];
    BWSampleBufferSetAttachedMedia(v15, 0x1EFA6A660, (uint64_t)cf);
    uint64_t v33 = (void *)[*(id *)(*(void *)(a1 + 32) + 712) objectForKeyedSubscript:v12];
    if (v33)
    {
      uint64_t v34 = v33;
      a5 = -[BWPhotonicEngineNode _ensureDeepZoomInputEnqueued:](*(void *)(a1 + 32), v33);
      if (!a5) {
        [v34 addSampleBuffer:v15 bufferType:a3];
      }
    }
    else
    {
      a5 = 4294954516;
    }
  }
  else if (objc_msgSend((id)objc_msgSend(a4, "portType"), "isEqualToString:", objc_msgSend((id)objc_msgSend(a4, "captureSettings"), "masterPortType")))
  {
    BWCMSampleBufferCreateCopyIncludingMetadata((CMSampleBufferRef)a2, (CMSampleBufferRef *)(*(void *)(a1 + 32) + 984));
    uint64_t v16 = *(void *)(a1 + 32);
    CFTypeRef v17 = NSString;
    uint64_t v18 = (void *)[a4 portType];
    uint64_t v20 = BWPortTypeToDisplayString(v18, v19);
    uint64_t v21 = [v17 stringWithFormat:@"stereo photo buffer for '%@' of type '%@'", v20, BWStillImageBufferTypeToShortString(a3)];
    -[BWPhotonicEngineNode _emitSampleBuffer:description:](v16, a2, v21);
    CFTypeRef v15 = 0;
    a5 = 0;
  }
  else
  {
    if (a2) {
      CFTypeRef v29 = CFRetain(a2);
    }
    else {
      CFTypeRef v29 = 0;
    }
    CFTypeRef v15 = 0;
    a5 = 0;
    *(void *)(*(void *)(a1 + 32) + 984) = v29;
  }
  if (cf)
  {
    CFRelease(cf);
    CFTypeRef cf = 0;
  }
  if (v15) {
    CFRelease(v15);
  }
  if (a5)
  {
    v39[0] = [NSNumber numberWithUnsignedLongLong:a3];
    objc_msgSend(a4, "addBypassedProcessorType:forBufferTypes:", 10, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v39, 1));
    CFTypeRef v35 = CMGetAttachment(a2, *v11, 0);
    uint64_t v36 = *(void *)(a1 + 32);
    uint64_t v37 = [a4 stillImageSettings];
    [NSString stringWithFormat:@"type '%@' requested for '%@'", BWStillImageBufferTypeToShortString(a3), a4];
    -[BWPhotonicEngineNode _emitError:stillImageSettings:metadata:description:](v36, a5, v37, (uint64_t)v35);
  }
}

- (void)_clearPortraitSemaphoreWithError:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 736));
    uint64_t v2 = *(NSObject **)(a1 + 744);
    if (v2)
    {
      if (dword_1EB4C5670)
      {
        os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        uint64_t v2 = *(NSObject **)(a1 + 744);
      }
      dispatch_semaphore_signal(v2);
      uint64_t v4 = *(const void **)(a1 + 744);
      if (v4)
      {
        CFRelease(v4);
        *(void *)(a1 + 744) = 0;
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 736));
  }
}

- (void)filterNodeDidReceiveStandardResolutionDeepFusionBuffer:(id)a3 error:(int)a4
{
}

void __114__BWPhotonicEngineNode__setupProcessingStateForScalerIfNeededWithSettings_sequenceNumber_portType_processingPlan___block_invoke(uint64_t a1, CMAttachmentBearerRef target, uint64_t a3, void *a4, uint64_t a5)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (dword_1EB4C5670)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (a5) {
    goto LABEL_4;
  }
  unsigned int v14 = -[BWPhotonicEngineNode _applyingZoomBeforeDeepZoomAllowedWithSampleBuffer:bufferType:portType:](*(void *)(a1 + 32), (uint64_t)target, a3, *(void *)(a1 + 40));
  uint64_t v15 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "requestedSettings"), "bravoConstituentImageDeliveryDeviceTypes"), "count");
  uint64_t v16 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 760), "objectForKeyedSubscript:", objc_msgSend(a4, "portType"));
  if (!v16)
  {
    a5 = 4294954516;
LABEL_4:
    if (a3 != 14)
    {
      CFTypeRef v11 = CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53070], 0);
      uint64_t v12 = *(void *)(a1 + 32);
      uint64_t v13 = [a4 stillImageSettings];
      [NSString stringWithFormat:@"type '%@' requested for '%@'", BWStillImageBufferTypeToShortString(a3), a4];
      -[BWPhotonicEngineNode _emitError:stillImageSettings:metadata:description:](v12, a5, v13, (uint64_t)v11);
    }
    return;
  }
  CFTypeRef v17 = v16;
  if (v15) {
    uint64_t v18 = 0;
  }
  else {
    uint64_t v18 = v14;
  }
  objc_msgSend(v16, "setApplyZoom:", v18, v19, v20);
  [v17 addFrame:target bufferType:a3];
}

void __110__BWPhotonicEngineNode__setupProcessingStateForSmartStyleWithSettings_sequenceNumber_portType_processingPlan___block_invoke(uint64_t a1, const void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  v19[22] = *MEMORY[0x1E4F143B8];
  if (_FigIsCurrentDispatchQueue())
  {
    if (a5) {
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v18 = v5;
    LODWORD(v17) = 0;
    FigDebugAssert3();
    if (a5) {
      goto LABEL_8;
    }
  }
  if (!a2) {
    goto LABEL_10;
  }
  if (dword_1EB4C5670)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  uint64_t v12 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 832), "objectForKeyedSubscript:", *(void *)(a1 + 40), v17, v18);
  if (v12)
  {
    uint64_t v13 = v12;
    [v12 addSampleBuffer:a2 bufferType:a3];
    a5 = (uint64_t)-[BWPhotonicEngineNode _ensureSmartStyleRenderingInputEnqueued:](*(void **)(a1 + 32), v13);
    if (!a5) {
      return;
    }
  }
  else
  {
LABEL_10:
    a5 = 4294954516;
  }
LABEL_8:
  v19[0] = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", a3, v17);
  objc_msgSend(a4, "addBypassedProcessorType:forBufferTypes:", 16, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v19, 1));
  CFTypeRef v14 = CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  uint64_t v15 = *(void *)(a1 + 32);
  uint64_t v16 = [a4 stillImageSettings];
  [NSString stringWithFormat:@"type '%@' requested for '%@'", BWStillImageBufferTypeToShortString(a3), a4];
  -[BWPhotonicEngineNode _emitError:stillImageSettings:metadata:description:](v15, a5, v16, (uint64_t)v14);
}

uint64_t __104__BWPhotonicEngineNode__setupProcessingStateForInferenceWithSettings_portType_inferenceInputBufferType___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancelProcessing];
}

void __104__BWPhotonicEngineNode__setupProcessingStateForInferenceWithSettings_portType_inferenceInputBufferType___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  switch(v2)
  {
    case 15:
      CFTypeRef v3 = &OBJC_IVAR___BWPhotonicEngineNode__inferences;
      break;
    case 39:
      CFTypeRef v3 = &OBJC_IVAR___BWPhotonicEngineNode__stereoPhotoSecondaryInferences;
      break;
    case 36:
      CFTypeRef v3 = &OBJC_IVAR___BWPhotonicEngineNode__quadraForEnhancedResolutionInferences;
      break;
    default:
      return;
  }

  *(void *)(*(void *)(a1 + 32) + *v3) = 0;
}

void __104__BWPhotonicEngineNode__setupProcessingStateForInferenceWithSettings_portType_inferenceInputBufferType___block_invoke_3(uint64_t a1, const void *a2, uint64_t a3, void *a4, int a5)
{
  v81[3] = *MEMORY[0x1E4F143B8];
  if (!_FigIsCurrentDispatchQueue())
  {
    uint64_t v56 = v5;
    LODWORD(v55) = 0;
    FigDebugAssert3();
  }
  if (a5)
  {
    LODWORD(v81[0]) = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    uint64_t v10 = 0;
    goto LABEL_59;
  }
  uint64_t v58 = a4;
  uint64_t v10 = objc_alloc_init(BWStillImageInferences);
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  uint64_t v57 = a1;
  CFTypeRef v11 = *(void **)(a1 + 40);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v65 objects:v71 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v66;
    CFStringRef v15 = (const __CFString *)*MEMORY[0x1E4F53070];
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v66 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v17 = *(void *)(*((void *)&v65 + 1) + 8 * i);
        uint64_t v18 = +[BWInferenceEngineController inferenceMaskSbufFromSbuf:attachedMediaKey:](BWInferenceEngineController, "inferenceMaskSbufFromSbuf:attachedMediaKey:", a2, v17, v55, v56);
        if (v18)
        {
          uint64_t v19 = v18;
          CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(v18);
          [(BWStillImageInferences *)v10 addInferenceBuffer:ImageBuffer metadata:CMGetAttachment(v19, v15, 0) inferenceAttachedMediaKey:v17];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v65 objects:v71 count:16];
    }
    while (v13);
  }
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  blocuint64_t k = 0x1EFA6A380;
  uint64_t v73 = 0x1EFA6A3A0;
  long long v74 = (void (*)(uint64_t))@"VisionExtendedFaceObservations";
  long long v75 = @"VisionFaceClassificationObservation";
  long long v76 = (void *)@"MattedMasksContainValidContent";
  uint64_t v21 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &block, 5, v55);
  uint64_t v22 = [v21 countByEnumeratingWithState:&v61 objects:v70 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v62;
    do
    {
      uint64_t v25 = 0;
      do
      {
        if (*(void *)v62 != v24) {
          objc_enumerationMutation(v21);
        }
        uint64_t v26 = *(void **)(*((void *)&v61 + 1) + 8 * v25);
        uint64_t v27 = BWInferenceTypeForInferenceAttachmentKey(v26);
        AttachedInference = (void *)BWInferenceGetAttachedInference(a2, v27, (uint64_t)v26);
        if (![v26 isEqualToString:0x1EFA6A0A0]
          || [AttachedInference count])
        {
          if (!v10) {
            goto LABEL_22;
          }
LABEL_21:
          [(BWStillImageInferences *)v10 addInference:AttachedInference inferenceAttachmentKey:v26];
          goto LABEL_22;
        }
        uint64_t v29 = BWInferenceTypeForInferenceAttachmentKey(v26);
        AttachedInference = (void *)BWInferenceGetAttachedInference(a2, v29, @"VisionFaceDetectionObservations");
        if (v10) {
          goto LABEL_21;
        }
LABEL_22:
        ++v25;
      }
      while (v23 != v25);
      uint64_t v30 = [v21 countByEnumeratingWithState:&v61 objects:v70 count:16];
      uint64_t v23 = v30;
    }
    while (v30);
  }
  uint64_t v31 = (void *)-[BWPhotonicEngineNode _inferenceAttachedMediaRequiredForSettings:inferences:sampleBuffer:](*(void *)(v57 + 32), (void *)[v58 stillImageSettings], v10);
  uint64_t v32 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  v81[0] = @"PersonSemanticsSkin";
  v81[1] = 0x1EFA745A0;
  v81[2] = 0x1EFA74420;
  uint64_t v33 = (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v81 count:3];
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  uint64_t v34 = [v33 countByEnumeratingWithState:&v77 objects:&block count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v78;
    do
    {
      for (uint64_t j = 0; j != v35; ++j)
      {
        if (*(void *)v78 != v36) {
          objc_enumerationMutation(v33);
        }
        long long v38 = *(void **)(*((void *)&v77 + 1) + 8 * j);
        if ([v31 containsObject:v38])
        {
          long long v39 = +[BWInferenceEngineController inferenceMaskSbufFromSbuf:a2 attachedMediaKey:v38];
          CFStringRef v40 = (const __CFString *)BWMetadataAttachmentKeyForAttachedMediaKey(v38);
          CFTypeRef v41 = CMGetAttachment(v39, v40, 0);
          if (v41) {
            [v32 setObject:v41 forKeyedSubscript:v38];
          }
        }
      }
      uint64_t v35 = [v33 countByEnumeratingWithState:&v77 objects:&block count:16];
    }
    while (v35);
  }
  if ([v32 count]) {
    long long v42 = v32;
  }
  else {
    long long v42 = 0;
  }
  [(BWStillImageInferences *)v10 addInferenceAttachedMediaMetadata:v42];
  long long v43 = objc_msgSend((id)CMGetAttachment(a2, @"StillSettings", 0), "captureSettings");
  if (-[BWPhotonicEngineNodeConfiguration semanticStyleRenderingEnabled](*(void *)(*(void *)(v57 + 32) + 112))
    || (int)-[BWPhotonicEngineNodeConfiguration smartStyleRenderingVersion](*(void *)(*(void *)(v57 + 32) + 112)) >= 1)
  {
    id v44 = (id)objc_msgSend((id)objc_msgSend(v43, "metadata"), "smartCamInferences");
    if (!v44) {
      id v44 = +[BWInferenceEngineController smartCameraClassificationsFromSbuf:a2];
    }
    objc_msgSend((id)objc_msgSend(v43, "metadata"), "setSmartCamInferences:", v44);
    if (objc_msgSend((id)objc_msgSend(v43, "metadata"), "smartCamInferences")) {
      objc_msgSend((id)objc_msgSend(v43, "metadata"), "calculateSemanticStyleSceneType");
    }
  }
  if ([v58 inferenceInputBufferType] == 15)
  {

    *(void *)(*(void *)(v57 + 32) + 544) = v10;
    uint64_t v45 = *(void *)(v57 + 32);
    if (*(void *)(v45 + 424))
    {
      long long v46 = *(NSObject **)(v45 + 176);
      v60[0] = MEMORY[0x1E4F143A8];
      v60[1] = 3221225472;
      v60[2] = __104__BWPhotonicEngineNode__setupProcessingStateForInferenceWithSettings_portType_inferenceInputBufferType___block_invoke_362;
      v60[3] = &unk_1E5C24458;
      uint64_t v47 = *(void *)(v57 + 48);
      v60[4] = v45;
      v60[5] = v47;
      blocuint64_t k = MEMORY[0x1E4F143A8];
      uint64_t v73 = 3221225472;
      long long v74 = __ubn_dispatch_async_block_invoke_0;
      long long v75 = &unk_1E5C249F0;
      long long v76 = v60;
      dispatch_async(v46, &block);
    }
    goto LABEL_54;
  }
  if ([v58 inferenceInputBufferType] == 36)
  {

    long long v48 = v10;
    uint64_t v49 = *(void *)(v57 + 32);
    uint64_t v50 = 552;
LABEL_53:
    *(void *)(v49 + v50) = v48;
    goto LABEL_54;
  }
  if ([v58 inferenceInputBufferType] == 39)
  {

    long long v48 = v10;
    uint64_t v49 = *(void *)(v57 + 32);
    uint64_t v50 = 560;
    goto LABEL_53;
  }
LABEL_54:
  if (*(unsigned char *)(v57 + 56) && !*(unsigned char *)(v57 + 57))
  {
    CFTypeRef v51 = (CFTypeRef)[v58 propagationImage];
    if (v51) {
      CFTypeRef v51 = CFRetain(v51);
    }
    uint64_t v52 = *(void *)(v57 + 32);
    uint64_t v53 = *(NSObject **)(v52 + 176);
    v59[0] = MEMORY[0x1E4F143A8];
    v59[1] = 3221225472;
    v59[2] = __104__BWPhotonicEngineNode__setupProcessingStateForInferenceWithSettings_portType_inferenceInputBufferType___block_invoke_2_363;
    v59[3] = &unk_1E5C249A0;
    void v59[5] = v58;
    v59[6] = v51;
    v59[4] = v52;
    blocuint64_t k = MEMORY[0x1E4F143A8];
    uint64_t v73 = 3221225472;
    long long v74 = __ubn_dispatch_async_block_invoke_0;
    long long v75 = &unk_1E5C249F0;
    long long v76 = v59;
    dispatch_async(v53, &block);
  }
LABEL_59:
}

uint64_t __104__BWPhotonicEngineNode__setupProcessingStateForInferenceWithSettings_portType_inferenceInputBufferType___block_invoke_362(uint64_t a1)
{
  uint64_t v1 = (void *)[*(id *)(*(void *)(a1 + 32) + 432) objectForKeyedSubscript:*(void *)(a1 + 40)];
  return [v1 allInferencesDelivered];
}

void __104__BWPhotonicEngineNode__setupProcessingStateForInferenceWithSettings_portType_inferenceInputBufferType___block_invoke_2_363(uint64_t a1)
{
  id v2 = -[BWPhotonicEngineNode _ubRERRouter](*(id *)(a1 + 32));
  (*((void (**)(id, void, uint64_t, void, void))v2 + 2))(v2, *(void *)(a1 + 48), 1, *(void *)(a1 + 40), 0);
  CFTypeRef v3 = *(const void **)(a1 + 48);
  if (v3)
  {
    CFRelease(v3);
  }
}

uint64_t __104__BWPhotonicEngineNode__setupProcessingStateForInferenceWithSettings_portType_inferenceInputBufferType___block_invoke_3_367(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) enqueueInputForProcessing:*(void *)(a1 + 40) delegate:*(void *)(a1 + 48)];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = result;
  return result;
}

uint64_t __108__BWPhotonicEngineNode__setupProcessingStateForDisparityIfNeededWithSettings_sequenceNumber_processingPlan___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) enqueueInputForProcessing:*(void *)(a1 + 40) delegate:*(void *)(a1 + 48)];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = result;
  return result;
}

uint64_t __99__BWPhotonicEngineNode__setupProcessingStateForJasperDisparityIfNeededWithSettings_processingPlan___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (_FigIsCurrentDispatchQueue())
  {
    if (a2)
    {
LABEL_3:
      uint64_t v9 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 904), "objectForKeyedSubscript:", objc_msgSend(a4, "portType", v12, v13));
      return [v9 setColorBuffer:a2 type:a3];
    }
  }
  else
  {
    uint64_t v13 = v4;
    LODWORD(v12) = 0;
    FigDebugAssert3();
    if (a2) {
      goto LABEL_3;
    }
  }
  CFTypeRef v11 = *(void **)(a1 + 40);
  return [v11 cancelProcessing];
}

uint64_t __99__BWPhotonicEngineNode__setupProcessingStateForPointCloudDepthIfNeededWithSettings_processingPlan___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (_FigIsCurrentDispatchQueue())
  {
    if (a2)
    {
LABEL_3:
      uint64_t v9 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 888), "objectForKeyedSubscript:", objc_msgSend(a4, "portType", v12, v13));
      return [v9 setColorBuffer:a2 type:a3];
    }
  }
  else
  {
    uint64_t v13 = v4;
    LODWORD(v12) = 0;
    FigDebugAssert3();
    if (a2) {
      goto LABEL_3;
    }
  }
  CFTypeRef v11 = *(void **)(a1 + 40);
  return [v11 cancelProcessing];
}

- (unint64_t)_softISPProcesingModeForSettings:(unsigned int)a3 captureFrameFlags:
{
  if (result)
  {
    uint64_t v5 = result;
    if (-[BWPhotonicEngineNode _isDeferredRawDeepFusionCapture:](result, a2))
    {
      return ((unint64_t)objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureFlags") >> 30) & 4;
    }
    else
    {
      int v6 = -[BWPhotonicEngineNode _isDeferredRawLearnedNRCapture:](v5, a2);
      uint64_t v7 = (void *)[a2 captureSettings];
      if (v6)
      {
        if (([v7 captureFlags] & 0x100000000) != 0) {
          return 5;
        }
        else {
          return 1;
        }
      }
      else
      {
        return ([v7 captureType] == 11) & (a3 >> 5);
      }
    }
  }
  return result;
}

- (uint64_t)_serviceNextSoftISPInputWithSampleBuffer:(unint64_t)a3 processingMode:(unsigned int)a4 transferOwnership:
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  if (_FigIsCurrentDispatchQueue())
  {
    if (a2) {
      goto LABEL_4;
    }
    return 4294954516;
  }
  uint64_t v27 = v4;
  LODWORD(v26) = 0;
  FigDebugAssert3();
  if (!a2) {
    return 4294954516;
  }
LABEL_4:
  uint64_t v9 = (void *)CMGetAttachment(a2, @"StillSettings", 0);
  uint64_t PortType = BWSampleBufferGetPortType(a2);
  if (!-[BWPhotonicEngineNode _processingNeededForSettings:portType:]((BOOL)a1, v9, PortType)) {
    return 0;
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  CFTypeRef v11 = (void *)[a1[35] objectForKeyedSubscript:PortType];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    unsigned int v28 = a4;
    uint64_t v14 = *(void *)v30;
LABEL_7:
    uint64_t v15 = 0;
    while (1)
    {
      if (*(void *)v30 != v14) {
        objc_enumerationMutation(v11);
      }
      uint64_t v16 = *(void **)(*((void *)&v29 + 1) + 8 * v15);
      if (!objc_msgSend(v16, "frame", v26, v27)) {
        break;
      }
      if (v13 == ++v15)
      {
        uint64_t v13 = [v11 countByEnumeratingWithState:&v29 objects:v34 count:16];
        if (v13) {
          goto LABEL_7;
        }
        uint64_t v17 = 4294954516;
        char v18 = v28;
        goto LABEL_23;
      }
    }
    if (!a3)
    {
      unsigned int v19 = BWStillImageCaptureFrameFlagsForSampleBuffer(a2);
      a3 = -[BWPhotonicEngineNode _softISPProcesingModeForSettings:captureFrameFlags:]((unint64_t)a1, v9, v19);
    }
    char v18 = v28;
    [v16 addFrame:a2 processingMode:a3 transferOwnership:v28];
    if (v16)
    {
      if ((unint64_t)[a1[35] count] < 2)
      {
        uint64_t v33 = PortType;
        id v20 = (id)[MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
      }
      else
      {
        id v20 = -[BWPhotonicEngineNode _processingOrderByPortTypeForSettings:](a1, v9);
      }
      uint64_t v21 = v20;
      while (1)
      {
        uint64_t v22 = -[BWPhotonicEngineNode _copyNextSoftISPInputUsingProcessingOrderByPortType:processingMode:]((uint64_t)a1, v21, a3);
        if (!v22) {
          return 0;
        }
        uint64_t v23 = v22;
        uint64_t v24 = (void *)MEMORY[0x1A6272C70]();
        uint64_t v17 = -[BWPhotonicEngineNode _enqueueSoftISPInput:]((uint64_t)a1, v23);

        if (v17) {
          goto LABEL_23;
        }
      }
    }
    uint64_t v17 = 4294954516;
LABEL_23:
    if ((v18 & 1) == 0) {
      return v17;
    }
  }
  else
  {
    uint64_t v17 = 4294954516;
    if (!a4) {
      return v17;
    }
  }
  CFRelease(a2);
  return v17;
}

- (void)_copyNextSoftISPInputUsingProcessingOrderByPortType:(int)a3 processingMode:
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (!_FigIsCurrentDispatchQueue())
    {
      uint64_t v25 = v3;
      LODWORD(v24) = 0;
      FigDebugAssert3();
    }
    if (objc_msgSend(a2, "count", v24, v25))
    {
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      uint64_t v7 = [a2 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v27;
LABEL_7:
        uint64_t v10 = 0;
        while (1)
        {
          if (*(void *)v27 != v9) {
            objc_enumerationMutation(a2);
          }
          CFTypeRef v11 = *(void **)(*((void *)&v26 + 1) + 8 * v10);
          if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 280), "objectForKeyedSubscript:", v11), "count")) {
            break;
          }
          if (v8 == ++v10)
          {
            uint64_t v8 = [a2 countByEnumeratingWithState:&v26 objects:v30 count:16];
            if (v8) {
              goto LABEL_7;
            }
            return 0;
          }
        }
        if (!v11) {
          return 0;
        }
        uint64_t v12 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 280), "objectForKeyedSubscript:", v11), "firstObject");
        if (![v12 frame]) {
          return 0;
        }
        if ((objc_msgSend((id)objc_msgSend(v12, "captureStreamSettings"), "captureFlags") & 0x8000000000) != 0)
        {
          if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 352), "objectForKeyedSubscript:", objc_msgSend(v12, "portType")), "count"))
          {
            uint64_t v21 = (const void *)[v12 frame];
            objc_msgSend((id)CMGetAttachment(v21, (CFStringRef)*MEMORY[0x1E4F53070], 0), "addEntriesFromDictionary:", objc_msgSend(*(id *)(a1 + 352), "objectForKeyedSubscript:", v11));
          }
          else if (objc_msgSend((id)objc_msgSend(v12, "captureStreamSettings"), "captureType") != 1 {
                 && (objc_msgSend((id)objc_msgSend(v12, "captureStreamSettings"), "referenceFrameIndex") & 0x80000000) == 0
          }
                 && (BWStillImageCaptureFrameFlagsForSampleBuffer((const void *)[v12 frame]) & 0x10) == 0)
          {
            if ((unint64_t)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 280), "objectForKeyedSubscript:", v11), "count") < 2)return 0; {
            unint64_t v14 = 1;
            }
            while (1)
            {
              uint64_t v12 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 280), "objectForKeyedSubscript:", v11), "objectAtIndexedSubscript:", v14);
              if ((BWStillImageCaptureFrameFlagsForSampleBuffer((const void *)[v12 frame]) & 0x10) != 0)break; {
              ++v14;
              }
              uint64_t v12 = 0;
              if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 280), "objectForKeyedSubscript:", v11), "count") <= v14) {
                return v12;
              }
            }
            goto LABEL_34;
          }
        }
        else
        {
          uint64_t v13 = objc_msgSend((id)objc_msgSend(v12, "captureSettings"), "learnedNRStereoPhotoFrameFlag");
          LODWORD(v14) = 0;
          if (a3 != 6 || !v13)
          {
LABEL_34:
            if (v12)
            {
              id v22 = v12;
              objc_msgSend((id)objc_msgSend(*(id *)(a1 + 280), "objectForKeyedSubscript:", v11), "removeObjectAtIndex:", v14);
            }
            return v12;
          }
          uint64_t v15 = objc_msgSend((id)objc_msgSend(v12, "captureSettings"), "masterPortType");
          if (([v11 isEqualToString:v15] & 1) == 0
            && objc_msgSend((id)objc_msgSend(*(id *)(a1 + 352), "objectForKeyedSubscript:", v15), "count"))
          {
            uint64_t v16 = (const void *)[v12 frame];
            uint64_t v17 = (void *)CMGetAttachment(v16, (CFStringRef)*MEMORY[0x1E4F53070], 0);
            uint64_t v18 = *MEMORY[0x1E4F53538];
            unsigned int v19 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithDictionary:", objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x1E4F53538]));
            uint64_t v20 = [*(id *)(a1 + 352) objectForKeyedSubscript:v15];
            [v19 setObject:v20 forKeyedSubscript:*MEMORY[0x1E4F53618]];
            [v17 setObject:v19 forKeyedSubscript:v18];
          }
        }
        LODWORD(v14) = 0;
        goto LABEL_34;
      }
    }
  }
  return 0;
}

- (uint64_t)_setStereoPhotoInverseHomograhiesOnDCProcessorInputsWithSettings:(uint64_t)result
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v3 = result;
    uint64_t result = objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "learnedNRStereoPhotoFrameFlag");
    if (result)
    {
      int v48 = 0;
      long long v4 = *(_OWORD *)(MEMORY[0x1E4F14998] + 16);
      long long v45 = *MEMORY[0x1E4F14998];
      long long v46 = v4;
      *(_OWORD *)uint64_t v47 = *(_OWORD *)(MEMORY[0x1E4F14998] + 32);
      long long v42 = v45;
      long long v43 = v4;
      long long v44 = *(_OWORD *)v47;
      uint64_t v5 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      int v6 = (void *)-[BWPhotonicEngineNodeConfiguration sensorConfigurationsByPortType](*(void *)(v3 + 112));
      uint64_t v7 = [v6 countByEnumeratingWithState:&v38 objects:v49 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v39;
        do
        {
          uint64_t v10 = 0;
          do
          {
            if (*(void *)v39 != v9) {
              objc_enumerationMutation(v6);
            }
            uint64_t v11 = *(void *)(*((void *)&v38 + 1) + 8 * v10);
            uint64_t v12 = (void *)-[BWPhotonicEngineNodeConfiguration sensorConfigurationsByPortType](*(void *)(v3 + 112));
            objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend(v12, "objectForKeyedSubscript:", v11, (void)v38), "cameraInfo"), v11);
            ++v10;
          }
          while (v8 != v10);
          uint64_t v8 = [v6 countByEnumeratingWithState:&v38 objects:v49 count:16];
        }
        while (v8);
      }
      if (objc_msgSend(v5, "count", (void)v38)
        && objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "secondaryPortTypes"), "count") == 1)
      {
        uint64_t v13 = objc_msgSend(*(id *)(v3 + 968), "objectForKeyedSubscript:", objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "masterPortType"));
        unint64_t v14 = objc_msgSend(*(id *)(v3 + 968), "objectForKeyedSubscript:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "secondaryPortTypes"), "firstObject"));
        double v15 = (double)(int)[*(id *)(v3 + 112) stereoPhotoOutputDimensions];
        double v16 = (double)(int)((unint64_t)[*(id *)(v3 + 112) stereoPhotoOutputDimensions] >> 32);
        uint64_t v17 = (void *)CMGetAttachment(v14, (CFStringRef)*MEMORY[0x1E4F55B90], 0);
        uint64_t v18 = (void *)[v17 objectForKeyedSubscript:@"Primary"];
        unsigned int v19 = (void *)[v17 objectForKeyedSubscript:@"Secondary"];
        unsigned int v20 = pen_validateDepthMetadata(v18, v13);
        if (v20) {
          unsigned int v20 = pen_validateDepthMetadata(v19, v14);
        }
        if (v18) {
          BOOL v21 = v19 == 0;
        }
        else {
          BOOL v21 = 1;
        }
        int v22 = !v21;
        char v23 = v22 & v20;
        if ((v22 & v20) != 0) {
          uint64_t v24 = v19;
        }
        else {
          uint64_t v24 = 0;
        }
        if ((v22 & v20) != 0) {
          uint64_t v25 = v18;
        }
        else {
          uint64_t v25 = 0;
        }
        uint64_t result = BWStereoUtilitiesComputeInverseRectificationHomographiesAndFOV((opaqueCMSampleBuffer *)v13, v14, v5, v25, v24, (uint64_t)&v45, (uint64_t)&v42, &v48, v15, v16);
        if (!result)
        {
          long long v26 = objc_msgSend(*(id *)(v3 + 664), "objectForKeyedSubscript:", objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "masterPortType"));
          [v26 setApplyStereoRectificationHomography:1];
          objc_msgSend(v26, "setStereoRectificationInverseHomography:", *(double *)&v45, *(double *)&v46, v47[0]);
          if (v23) {
            pen_setDistortionCorrectionParametersOnDCInputUsingDepthMetadata(v26, v18);
          }
          long long v27 = objc_msgSend(*(id *)(v3 + 664), "objectForKeyedSubscript:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "secondaryPortTypes"), "firstObject"));
          [v27 setApplyStereoRectificationHomography:1];
          objc_msgSend(v27, "setStereoRectificationInverseHomography:", *(double *)&v42, *(double *)&v43, *(double *)&v44);
          if (v23) {
            pen_setDistortionCorrectionParametersOnDCInputUsingDepthMetadata(v27, v19);
          }
          CFStringRef v28 = (const __CFString *)*MEMORY[0x1E4F53070];
          long long v29 = (void *)CMGetAttachment(v13, (CFStringRef)*MEMORY[0x1E4F53070], 0);
          uint64_t v30 = *MEMORY[0x1E4F53538];
          uint64_t v31 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithDictionary:", objc_msgSend(v29, "objectForKeyedSubscript:", *MEMORY[0x1E4F53538]));
          LODWORD(v32) = v48;
          uint64_t v33 = [NSNumber numberWithFloat:v32];
          uint64_t v34 = *MEMORY[0x1E4F53610];
          [v31 setObject:v33 forKeyedSubscript:*MEMORY[0x1E4F53610]];
          [v29 setObject:v31 forKeyedSubscript:v30];
          uint64_t v35 = (void *)CMGetAttachment(v14, v28, 0);
          uint64_t v36 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithDictionary:", objc_msgSend(v35, "objectForKeyedSubscript:", v30));
          LODWORD(v37) = v48;
          objc_msgSend(v36, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v37), v34);
          [v35 setObject:v36 forKeyedSubscript:v30];
          return 0;
        }
      }
      else
      {
        return 4294954516;
      }
    }
  }
  return result;
}

uint64_t __71__BWPhotonicEngineNode__beginStereoPhotoProcessingIfNeededForSettings___block_invoke(uint64_t a1)
{
  return -[BWPhotonicEngineNode _serviceNextSoftISPInputWithSampleBuffer:processingMode:transferOwnership:](*(id **)(a1 + 32), *(const void **)(a1 + 40), 6uLL, 1u);
}

void __61__BWPhotonicEngineNode__softISPFusionCaptureOutputSbufRouter__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  if (!_FigIsCurrentDispatchQueue())
  {
    uint64_t v33 = v5;
    LODWORD(v31) = 0;
    FigDebugAssert3();
  }
  uint64_t v11 = (uint64_t)BWStillImageCaptureFrameFlagsForSampleBuffer(a2);
  uint64_t v12 = objc_msgSend((id)objc_msgSend(a4, "captureSettings"), "captureFlags");
  if (a2)
  {
    uint64_t v36 = v12;
    if (dword_1EB4C5670)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    -[BWPhotonicEngineNode _stashAWBMetadataIfNeededForSampleBuffer:processingMode:](*(void *)(a1 + 32), a2, objc_msgSend(a4, "processingMode", v31, v33));
    id v15 = (id)objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 368), "objectForKeyedSubscript:", objc_msgSend(a4, "portType")), "firstObject");
    unint64_t v14 = (void *)CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E4F53070], 0);
    if (objc_msgSend((id)objc_msgSend(a4, "captureSettings"), "captureType") == 12)
    {
      int v16 = -[BWPhotonicEngineNode _isDeferredRawDeepFusionCapture:](*(void *)(a1 + 32), (void *)[a4 stillImageSettings]);
      CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer((CMSampleBufferRef)a2);
      if ([a4 processingMode] != 6)
      {
        if (!v16)
        {
          uint64_t v35 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 432), "objectForKeyedSubscript:", objc_msgSend(a4, "portType"));
          BOOL v22 = objc_msgSend((id)objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E4F54148]), "intValue") == 1;
          uint64_t v23 = 27;
          if ((v11 & 4) == 0) {
            uint64_t v23 = 24;
          }
          if ((v11 & 0x10) != 0) {
            uint64_t v23 = 23;
          }
          if ((v11 & 8) != 0) {
            uint64_t v23 = 22;
          }
          BOOL v24 = !v22 || (v36 & 0x200000000) == 0;
          uint64_t v25 = 25;
          if (v24) {
            uint64_t v25 = v23;
          }
          uint64_t v37 = v25;
          uint64_t AttachedMedia = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a2, 0x1EFA74640);
          if (AttachedMedia)
          {
            long long v27 = AttachedMedia;
            CVImageBufferRef v28 = CMSampleBufferGetImageBuffer(AttachedMedia);
            CFTypeRef v29 = CMGetAttachment(v27, (CFStringRef)*MEMORY[0x1E4F53058], 0);
          }
          else
          {
            uint64_t v30 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
            CVImageBufferRef v28 = 0;
            CFTypeRef v29 = 0;
          }
          objc_msgSend(v35, "addBuffer:metadata:bufferType:captureFrameFlags:lscGainMap:lscGainMapParameters:", ImageBuffer, v14, v37, v11, v28, v29, v32, v34);
LABEL_13:
          -[BWPhotonicEngineNode _checkIfProcessingCompletedForNRFProcessorInput:](*(void *)(a1 + 32), v15);
          if (!a5) {
            return;
          }
          goto LABEL_14;
        }
        if ((v11 & 0x14) == 0) {
          goto LABEL_13;
        }
      }
    }
    [v15 addFrame:a2];
    goto LABEL_13;
  }
  unint64_t v14 = 0;
  if (!a5) {
    return;
  }
LABEL_14:
  -[BWPhotonicEngineNode _resetProcessingState](*(void *)(a1 + 32));
  uint64_t v18 = *(void *)(a1 + 32);
  uint64_t v19 = [a4 stillImageSettings];
  unsigned int v20 = NSString;
  uint64_t v21 = BWStillImageBufferTypeToShortString(a3);
  [v20 stringWithFormat:@"type '%@' - '%@' requested for '%@'", v21, BWStillImageCaptureFrameFlagsToShortString(v11), a4];
  -[BWPhotonicEngineNode _emitError:stillImageSettings:metadata:description:](v18, a5, v19, (uint64_t)v14);
}

void __44__BWPhotonicEngineNode__nrfOutputSbufRouter__block_invoke(uint64_t a1, const void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (!_FigIsCurrentDispatchQueue())
  {
    uint64_t v25 = v27;
    LODWORD(v24) = 0;
    FigDebugAssert3();
  }
  if (dword_1EB4C5670)
  {
    int v33 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (a5)
  {
    uint64_t v26 = v27;
    LODWORD(v24) = a5;
    goto LABEL_32;
  }
  if (a3 != 7)
  {
    int v11 = objc_msgSend((id)objc_msgSend(a4, "captureSettings"), "deliverDeferredPhotoProxyImage");
    if (a3 != 14 || !v11)
    {
      if (objc_msgSend(a4, "isMaster", v24, v25))
      {
        if (a3 > 34)
        {
          if (a3 == 38) {
            goto LABEL_29;
          }
          if (a3 != 35)
          {
LABEL_28:
            -[BWPhotonicEngineNode _waitForAndMergeInferencesIfNeededForSampleBuffer:processorInput:](*(BOOL **)(a1 + 32), a2, a4);
            goto LABEL_29;
          }
        }
        else if (a3 != 3 && a3 != 6)
        {
          goto LABEL_28;
        }
        uint64_t v13 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 376), "objectForKeyedSubscript:", objc_msgSend(a4, "portType"));
        if (v13) {
          objc_msgSend((id)CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E4F53070], 0), "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E4F542D8]);
        }
        [*(id *)(*(void *)(a1 + 32) + 384) setObject:&unk_1EFB02510 forKeyedSubscript:*(void *)(*(void *)(a1 + 32) + 152)];
        -[BWPhotonicEngineNode _attemptDisparityReferenceFrameResolutionForSettings:portType:](*(void *)(a1 + 32), (void *)[a4 stillImageSettings], objc_msgSend(a4, "portType"));
        -[BWPhotonicEngineNode _deferredCaptureAddSecondaryStereoPhotoCaptureSampleBufferIfReadyForSettings:](*(void *)(a1 + 32), (void *)[a4 stillImageSettings]);
        long long v30 = 0u;
        long long v31 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        unint64_t v14 = (void *)[*(id *)(*(void *)(a1 + 32) + 368) allValues];
        uint64_t v15 = [v14 countByEnumeratingWithState:&v28 objects:v34 count:16];
        if (!v15) {
          goto LABEL_28;
        }
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v29;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v29 != v17) {
              objc_enumerationMutation(v14);
            }
            -[BWPhotonicEngineNode _checkIfProcessingCompletedForNRFProcessorInput:](*(void *)(a1 + 32), (void *)[*(id *)(*((void *)&v28 + 1) + 8 * i) firstObject]);
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v28 objects:v34 count:16];
        }
        while (v16);
      }
      if (a3 != 38) {
        goto LABEL_28;
      }
LABEL_29:
      uint64_t v19 = *(void *)(a1 + 32);
      uint64_t v20 = [NSString stringWithFormat:@"buffer of type '%@' requested for '%@'", BWStillImageBufferTypeToShortString(a3), a4];
      -[BWPhotonicEngineNode _emitSampleBuffer:description:](v19, a2, v20);
      return;
    }
  }
  uint64_t v12 = -[BWPhotonicEngineNode _handleDeferredCaptureProxyOrErrorRecoverySampleBuffer:bufferType:](*(void *)(a1 + 32), a2);
  if (v12)
  {
    a5 = v12;
    uint64_t v26 = v27;
    LODWORD(v24) = v12;
LABEL_32:
    FigDebugAssert3();
    CFTypeRef v21 = CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E4F53070], 0);
    uint64_t v22 = *(void *)(a1 + 32);
    uint64_t v23 = objc_msgSend(a4, "stillImageSettings", v24, v26);
    [NSString stringWithFormat:@"type '%@' requested for '%@'", BWStillImageBufferTypeToShortString(a3), a4];
    -[BWPhotonicEngineNode _emitError:stillImageSettings:metadata:description:](v22, a5, v23, (uint64_t)v21);
  }
}

void __47__BWPhotonicEngineNode__ubInferenceInputRouter__block_invoke(uint64_t a1, void *a2, unint64_t a3, void *a4)
{
  if (!_FigIsCurrentDispatchQueue())
  {
    uint64_t v38 = v4;
    LODWORD(v37) = 0;
    FigDebugAssert3();
  }
  uint64_t v9 = objc_msgSend(a4, "portType", v37, v38);
  if (-[BWPhotonicEngineNode _setupProcessingStateForInferenceWithSettings:portType:inferenceInputBufferType:](*(void *)(a1 + 32), (void *)[a4 stillImageSettings], v9, a3)|| (uint64_t v10 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 496), "objectForKeyedSubscript:", v9)) == 0)
  {
    uint64_t v36 = objc_msgSend((id)objc_msgSend(a4, "stillImageSettings"), "captureSettings");
    if ([v36 captureType] == 12)
    {
      [v36 deliverDeferredPhotoProxyImage];
    }
  }
  else
  {
    int v11 = (void *)v10;
    char v12 = -[BWPhotonicEngineNode _isSemanticRenderingCapture:](*(void *)(a1 + 32), (void *)[a4 stillImageSettings]);
    BOOL v13 = -[BWPhotonicEngineNode _isSemanticStylesCaptureNeedingInferencesWithSettings:](*(void *)(a1 + 32), (void *)[a4 stillImageSettings]);
    if (((v12 & 1) != 0 || v13)
      && !+[BWInferenceEngine isNeuralEngineSupported]
      && (objc_msgSend((id)objc_msgSend((id)CMGetAttachment(a2, @"StillSettings", 0), "captureSettings"), "captureFlags") & 0x2000) != 0&& (BWSampleBufferHasDetectedFaces(a2, 0, 0, 0, 1, 0) & 1) == 0)
    {
      objc_msgSend(v11, "setEnabledVisionInferences:", objc_msgSend(v11, "enabledVisionInferences") ^ 0x13);
    }
    unint64_t v14 = (void *)CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E4F53070], 0);
    long long v39 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
    long long v43 = *MEMORY[0x1E4F1DB20];
    *(_OWORD *)long long v44 = v39;
    int CGRectIfPresent = FigCFDictionaryGetCGRectIfPresent();
    long long v41 = v43;
    long long v42 = v39;
    int v16 = CGRectIfPresent | FigCFDictionaryGetCGRectIfPresent();
    unint64_t v17 = BWPixelBufferDimensionsFromSampleBuffer((opaqueCMSampleBuffer *)a2);
    if (v16)
    {
      uint64_t v18 = v17;
      unint64_t v19 = HIDWORD(v17);
      float v20 = (float)(int)v17;
      double v21 = -[BWPhotonicEngineNodeConfiguration inferenceMainImageDownscalingFactor](*(void *)(*(void *)(a1 + 32)
                                                                                               + 112));
      uint64_t v22 = (int)(float)(*(float *)&v21 * v20);
      double v23 = -[BWPhotonicEngineNodeConfiguration inferenceMainImageDownscalingFactor](*(void *)(*(void *)(a1 + 32)
                                                                                               + 112));
      uint64_t v24 = (int)(float)(*(float *)&v23 * (float)(int)v19);
      FigCaptureMetadataUtilitiesNormalizeCropRect(*(double *)&v41, *((double *)&v41 + 1), *(double *)&v42, *((double *)&v42 + 1));
      FigCaptureMetadataUtilitiesDenormalizeCropRect(v25, v26, v27, v28);
      FigCaptureMetadataUtilitiesUpdateMetadataForStillImageCrop(v14, v22 | (v24 << 32), v18, *(CGFloat *)&v43, *((CGFloat *)&v43 + 1), v44[0], v44[1], v29, v30, v31, v32);
    }
    v47.origin.x = FigCaptureMetadataUtilitiesGetFinalCropRect();
    CGRectIsNull(v47);
    objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", -[BWPhotonicEngineNodeConfiguration inferenceMainImageDownscalingFactor](*(void *)(*(void *)(a1 + 32) + 112))), *MEMORY[0x1E4F53388]);
    if (a2) {
      CFRetain(a2);
    }
    uint64_t v33 = *(void *)(a1 + 32);
    uint64_t v34 = *(NSObject **)(v33 + 512);
    uint64_t v35 = *(NSObject **)(v33 + 504);
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __47__BWPhotonicEngineNode__ubInferenceInputRouter__block_invoke_2;
    v40[3] = &unk_1E5C24F10;
    v40[4] = v11;
    v40[5] = a2;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __ubn_dispatch_group_async_block_invoke_0;
    block[3] = &unk_1E5C249F0;
    block[4] = v40;
    dispatch_group_async(v34, v35, block);
  }
}

void __47__BWPhotonicEngineNode__ubInferenceInputRouter__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) addInferenceImage:*(void *)(a1 + 40)];
  id v2 = *(const void **)(a1 + 40);
  if (v2)
  {
    CFRelease(v2);
  }
}

void __36__BWPhotonicEngineNode__ubRERRouter__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  block[16] = *MEMORY[0x1E4F143B8];
  if (!_FigIsCurrentDispatchQueue())
  {
    uint64_t v14 = v4;
    LODWORD(v12) = 0;
    FigDebugAssert3();
  }
  id v8 = (id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 648), "objectForKeyedSubscript:", objc_msgSend(a4, "portType", v12, v14));
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3052000000;
  float v20 = __Block_byref_object_copy__42;
  double v21 = __Block_byref_object_dispose__42;
  uint64_t v22 = 0;
  if (![v8 faceObservations])
  {
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(NSObject **)(v9 + 504);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __36__BWPhotonicEngineNode__ubRERRouter__block_invoke_2;
    v16[3] = &unk_1E5C246B8;
    v16[4] = v9;
    v16[5] = &v17;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __ubn_dispatch_sync_block_invoke_0;
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

id __36__BWPhotonicEngineNode__ubRERRouter__block_invoke_2(uint64_t a1)
{
  id result = (id)[*(id *)(*(void *)(a1 + 32) + 544) inferenceForAttachmentKey:0x1EFA6A0A0];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

void __65__BWPhotonicEngineNode__standardNROutputRouterWithExpectedQueue___block_invoke(uint64_t a1, const void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
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
    uint64_t v22 = v23;
    LODWORD(v21) = a5;
    goto LABEL_15;
  }
  int v11 = *(BOOL **)(a1 + 40);
  if (a3 == 29)
  {
    uint64_t v12 = -[BWPhotonicEngineNode _handleDeferredCaptureProxyOrErrorRecoverySampleBuffer:bufferType:]((uint64_t)v11, a2);
    if (v12)
    {
      a5 = v12;
      uint64_t v22 = v23;
      LODWORD(v21) = v12;
LABEL_15:
      FigDebugAssert3();
      CFTypeRef v18 = CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E4F53070], 0);
      uint64_t v19 = *(void *)(a1 + 40);
      uint64_t v20 = objc_msgSend(a4, "stillImageSettings", v21, v22);
      [NSString stringWithFormat:@"type '%@' requested for '%@'", BWStillImageBufferTypeToShortString(a3), a4];
      -[BWPhotonicEngineNode _emitError:stillImageSettings:metadata:description:](v19, a5, v20, (uint64_t)v18);
    }
  }
  else
  {
    -[BWPhotonicEngineNode _waitForAndMergeInferencesIfNeededForSampleBuffer:processorInput:](v11, a2, a4);
    if (FigCaptureSushiRawDNGDictionaryCreatedInGraph())
    {
      if (FigCapturePixelFormatIsBayerRaw(objc_msgSend((id)objc_msgSend(a4, "settings"), "rawOutputFormat")))
      {
        unsigned int v13 = objc_msgSend((id)objc_msgSend(a4, "settings"), "outputWidth");
        uint64_t v14 = objc_msgSend((id)objc_msgSend(a4, "settings"), "outputHeight");
        BOOL v15 = objc_msgSend((id)objc_msgSend((id)CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E4F53070], 0), "objectForKeyedSubscript:", *MEMORY[0x1E4F53328]), "intValue") != 0;
        -[BWPhotonicEngineNode _propagateSushiRawDNGDictionaryWithOutputSampleBuffer:requestedDimensions:requiresGDCInformation:](*(void *)(a1 + 40), a2, v13 | (unint64_t)(v14 << 32), v15);
      }
    }
    uint64_t v16 = *(void *)(a1 + 40);
    uint64_t v17 = [NSString stringWithFormat:@"buffer of type '%@' requested for '%@'", BWStillImageBufferTypeToShortString(a3), a4];
    -[BWPhotonicEngineNode _emitSampleBuffer:description:](v16, a2, v17);
  }
}

uint64_t __78__BWPhotonicEngineNode__ensureProcessorCoordinatorSetupForPostponedProcessors__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) inferenceEnginePrepared];
  if ((result & 1) == 0)
  {
    FigDebugIsInternalBuild();
    objc_msgSend(NSString, "stringWithFormat:", @"%d", 12);
    mach_absolute_time();
    uint64_t result = [*(id *)(a1 + 32) prepareWithPixelBufferPoolProvider:*(void *)(a1 + 40)];
    if (dword_1EB4C5670)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      return fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  return result;
}

- (unint64_t)_disparityProcessorInputDimensions
{
  if (!a1) {
    return 0;
  }
  LODWORD(v2) = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "videoFormat"), "width");
  LODWORD(v3) = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "videoFormat"), "height");
  if ([*(id *)(a1 + 776) stillImageDepthDataType] == 8)
  {
    unint64_t v2 = (unint64_t)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "videoFormat"), "width") >> 1;
    unint64_t v3 = (unint64_t)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "videoFormat"), "height") >> 1;
  }
  return v2 | ((unint64_t)v3 << 32);
}

- (void)_inferenceAttachedMediaRequiredForDemosaicedRawCaptureWithSettings:(void *)a3 inferences:
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  if (!_FigIsCurrentDispatchQueue())
  {
    uint64_t v18 = v3;
    LODWORD(v17) = 0;
    FigDebugAssert3();
  }
  if (!-[BWPhotonicEngineNode _isDemosaicedRawCaptureNeedingInferencesWithSettigs:](a1, a2)) {
    return 0;
  }
  uint64_t v7 = (void *)[(id)-[BWPhotonicEngineNodeConfiguration providedInferenceAttachedMediaByMode](*(void *)(a1 + 112)) objectForKeyedSubscript:&unk_1EFB02510];
  id v8 = (void *)[a3 inferenceForAttachmentKey:0x1EFA6A1C0];
  uint64_t v9 = (void *)[MEMORY[0x1E4F1CA48] arrayWithArray:v7];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v10 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v7);
        }
        uint64_t v14 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        BOOL v15 = objc_msgSend(v8, "objectForKeyedSubscript:", v14, v17, v18);
        if (!v15 || ([v15 BOOLValue] & 1) == 0) {
          [v9 removeObject:v14];
        }
      }
      uint64_t v11 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v11);
  }
  return v9;
}

- (uint64_t)_inferenceAttachedMediaRequiredForDepthProcessingWithSettings:(uint64_t)a1
{
  if (!a1 || !-[BWPhotonicEngineNode _isDepthCaptureNeedingPersonSegmentationMasksWithSettings:](a1, a2)) {
    return 0;
  }
  uint64_t v3 = (void *)-[BWPhotonicEngineNodeConfiguration providedInferenceAttachedMediaByMode](*(void *)(a1 + 112));
  return [v3 objectForKeyedSubscript:&unk_1EFB024E0];
}

- (uint64_t)_inferenceAttachedMediaRequiredForSmartStyleWithSettings:(uint64_t)a1
{
  if (!a1 || !-[BWPhotonicEngineNode _isSmartStylesCaptureNeedingInferencesWithSettings:](a1, a2)) {
    return 0;
  }
  uint64_t v3 = (void *)-[BWPhotonicEngineNodeConfiguration providedInferenceAttachedMediaByMode](*(void *)(a1 + 112));
  return [v3 objectForKeyedSubscript:&unk_1EFB02750];
}

void __41__BWPhotonicEngineNode__releaseResources__block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 136) = 0;
}

void __41__BWPhotonicEngineNode__releaseResources__block_invoke_3(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 544) = 0;
  *(void *)(*(void *)(a1 + 32) + 552) = 0;

  *(void *)(*(void *)(a1 + 32) + 560) = 0;
  *(void *)(*(void *)(a1 + 32) + 568) = 0;
}

- (BWPhotoEncoderController)photoEncoderController
{
  return self->_photoEncoderController;
}

@end