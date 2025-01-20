@interface BWNRFProcessorController
+ (void)initialize;
- (BOOL)finishProcessingCurrentInputNow;
- (BWNRFProcessorController)initWithConfiguration:(id)a3;
- (CMAttachmentBearerRef)_newOutputSampleBufferWithSampleBuffer:(__CVBuffer *)a3 pixelBuffer:(CFTypeRef *)a4 formatDescriptionInOut:(uint64_t)a5 metadataToMerge:;
- (id)_prepareDescriptorsByProcessingTypeForResolutionFlavors:(id *)result;
- (id)adaptiveBracketingDigitalFlashTotalIntegrationTimesProviderForPortType:(id)a3;
- (id)adaptiveBracketingParametersForDigitalFlashMode:(int)a3 frameStatistics:(id)a4 stationary:(BOOL)a5 sphereOffsetEnabled:(BOOL)a6 detectedObjects:(id)a7;
- (id)externalMemoryDescriptorForResolutionFlavors:(id)a3;
- (id)metalImageBufferProcessor;
- (id)processorGetInferenceResults:(id)a3;
- (int)enqueueInputForProcessing:(id)a3 delegate:(id)a4 processErrorRecoveryFrame:(BOOL)a5 processOriginalImage:(BOOL)a6 processToneMapping:(BOOL)a7 processInferenceInputImage:(BOOL)a8 clientBracketSequenceNumber:(int)a9 processSemanticRendering:(BOOL)a10 provideInferenceInputImageForProcessing:(BOOL)a11 processSmartStyleRenderingInput:(BOOL)a12 inferencesAvailable:(BOOL)a13;
- (int)progressiveLowLightFusionBatchSize;
- (uint64_t)_loadNRFProcessor;
- (uint64_t)_setupNRFProcessorWithprepareDescriptorsByProcessingType:(uint64_t)a1;
- (uint64_t)_setupProcessorForProcessingType:(uint64_t)a1;
- (uint64_t)_singleImageProcessSampleBuffer:(CMAttachmentBearerRef *)a3 sampleBufferOut:;
- (uint64_t)_updateStateIfNeeded;
- (unint64_t)_setupProcessor;
- (unint64_t)type;
- (unsigned)rawNightModeOutputPixelFormatByBufferType:(unint64_t)a3;
- (void)_generateGainMapMetadata:(uint64_t)a1;
- (void)_handleFusionErrorRecoveryWithFailureMetadata:(id *)a1;
- (void)_logCompletionStatus:(int)a3 processingType:(void *)a4 request:;
- (void)_processDeepFusion;
- (void)_processDigitalFlash;
- (void)_processOriginalImage;
- (void)_processRawNightMode;
- (void)_processSingleImage;
- (void)_processUBFusion;
- (void)_propagateDemosaicedRawPixelBuffer:(void *)a3 demosaicedRawMetadata:(void *)target outputSampleBuffer:(int)a5 error:;
- (void)_releaseNRFProcessorResources;
- (void)_serviceNextRequest;
- (void)cancelProcessing;
- (void)dealloc;
- (void)input:(id)a3 addFrame:(opaqueCMSampleBuffer *)a4 isReferenceFrame:(BOOL)a5;
- (void)inputReceivedAllFrames:(id)a3;
- (void)inputReceivedProcessedRawErrorRecoveryFrame:(id)a3;
- (void)processor:(id)a3 didCompleteProcessingForSurfaceID:(unsigned int)a4;
- (void)processor:(id)a3 didEnqueueProcessingForSurfaceID:(unsigned int)a4;
- (void)processor:(id)a3 didSelectFusionMode:(int)a4;
- (void)processor:(id)a3 didSelectProgressiveFusionReferenceFrameIndex:(int)a4;
- (void)processor:(id)a3 outputReadyWithFrameType:(int)a4 outputPixelBuffer:(__CVBuffer *)a5 outputMetadata:(id)a6 error:(int)a7;
@end

@implementation BWNRFProcessorController

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (BWNRFProcessorController)initWithConfiguration:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)BWNRFProcessorController;
  v4 = [(BWNRFProcessorController *)&v10 init];
  if (v4)
  {
    v4->_configuration = (BWNRFProcessorControllerConfiguration *)a3;
    v4->_requestQueue = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v5 = [[FigStateMachine alloc] initWithLabel:@"BWNRFProcessorController state machine" stateCount:(char)+[FigStateMachine indexForState:512] initialState:1 owner:v4];
    [(FigStateMachine *)v5 setPerformsAtomicStateTransitions:0];
    [(FigStateMachine *)v5 setLabel:@"Idle" forState:1];
    [(FigStateMachine *)v5 setLabel:@"Ready" forState:2];
    [(FigStateMachine *)v5 setLabel:@"WaitingForFrames" forState:4];
    [(FigStateMachine *)v5 setLabel:@"ProcessingSingleImage" forState:8];
    [(FigStateMachine *)v5 setLabel:@"ProcessingOriginalImage" forState:16];
    [(FigStateMachine *)v5 setLabel:@"ProcessingUBFusion" forState:32];
    [(FigStateMachine *)v5 setLabel:@"ProcessingUBLowLightFusion" forState:64];
    [(FigStateMachine *)v5 setLabel:@"ProcessingDeepFusion" forState:128];
    [(FigStateMachine *)v5 setLabel:@"ProcessingRawNightMode" forState:256];
    [(FigStateMachine *)v5 whenTransitioningToStates:1 callHandler:&__block_literal_global_47];
    [(FigStateMachine *)v5 whenTransitioningToStates:2 callHandler:&__block_literal_global_745];
    [(FigStateMachine *)v5 whenTransitioningToState:4 callHandler:&__block_literal_global_747];
    [(FigStateMachine *)v5 whenTransitioningToState:8 callHandler:&__block_literal_global_749_0];
    [(FigStateMachine *)v5 whenTransitioningToState:16 callHandler:&__block_literal_global_751];
    [(FigStateMachine *)v5 whenTransitioningToState:32 callHandler:&__block_literal_global_753];
    [(FigStateMachine *)v5 whenTransitioningToState:64 callHandler:&__block_literal_global_755];
    [(FigStateMachine *)v5 whenTransitioningToState:128 callHandler:&__block_literal_global_757];
    [(FigStateMachine *)v5 whenTransitioningToState:256 callHandler:&__block_literal_global_759];
    v4->_stateMachine = v5;
    [a3 figThreadPriority];
    v4->_completionStatusQueue = (OS_dispatch_queue *)FigDispatchQueueCreateWithPriority();
    v6 = (void *)MEMORY[0x1A6272C70]();
    if (-[BWNRFProcessorController _loadNRFProcessor]((uint64_t)v4)
      || (v7 = BWAllStillImageQSubResolutionFlavors(),
          v8 = -[BWNRFProcessorController _prepareDescriptorsByProcessingTypeForResolutionFlavors:]((id *)&v4->super.super.isa, v7), -[BWNRFProcessorController _setupNRFProcessorWithprepareDescriptorsByProcessingType:]((uint64_t)v4, (uint64_t)v8)))
    {

      return 0;
    }
    else
    {
    }
  }
  return v4;
}

- (uint64_t)_loadNRFProcessor
{
  if (a1 && !*(void *)(a1 + 80))
  {
    if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 56), "sensorConfigurationsByPortType"), "count")
      && [*(id *)(a1 + 56) inputFormat]
      && [*(id *)(a1 + 56) outputFormat])
    {
      uint64_t v2 = [+[FigCaptureCameraParameters sharedInstance] nrfVersion];
      if (v2)
      {
        uint64_t v3 = v2;
        *(void *)(a1 + 88) = (id)objc_msgSend(NSString, "stringWithFormat:", @"NRFProcessorV%d", v2);
        *(void *)(a1 + 64) = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithArray:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 56), "sensorConfigurationsByPortType"), "allKeys"));
        v4 = BWLoadProcessorBundle(@"NRF", v3);
        if (v4)
        {
          v5 = v4;
          uint64_t v6 = [v4 classNamed:@"NRFUBFusionOutput"];
          *(void *)(a1 + 120) = v6;
          if (v6)
          {
            if (![*(id *)(a1 + 56) rawNightModeEnabled]
              || (uint64_t v7 = [v5 classNamed:@"NRFRawNightModeOutputFrame"],
                  (*(void *)(a1 + 152) = v7) != 0))
            {
              uint64_t v8 = [v5 classNamed:@"NRFDeepFusionOutput"];
              *(void *)(a1 + 168) = v8;
              if (v8)
              {
                uint64_t v9 = [v5 classNamed:@"NRFCompletionStatus"];
                *(void *)(a1 + 184) = v9;
                if (v9)
                {
                  uint64_t v10 = [v5 classNamed:@"NRFProgressiveBracketingStatistics"];
                  *(void *)(a1 + 128) = v10;
                  if (v10)
                  {
                    uint64_t v11 = [v5 classNamed:@"NRFProgressiveBracketingParameters"];
                    *(void *)(a1 + 136) = v11;
                    if (v11)
                    {
                      uint64_t v12 = objc_msgSend(objc_alloc((Class)objc_msgSend(v5, "classNamed:", *(void *)(a1 + 88))), "initWithCommandQueue:", objc_msgSend(*(id *)(a1 + 56), "metalCommandQueue"));
                      *(void *)(a1 + 80) = v12;
                      if (v12)
                      {
                        id v13 = objc_alloc_init((Class)[v5 classNamed:@"NRFPrepareDescriptor"]);
                        *(void *)(a1 + 96) = v13;
                        if (v13)
                        {
                          if (([*(id *)(a1 + 56) fusionEnabled] & 1) == 0
                            && ![*(id *)(a1 + 56) lowLightFusionEnabled]
                            || (id v14 = objc_alloc_init((Class)[v5 classNamed:@"NRFPrepareDescriptor"]), (*(void *)(a1 + 112) = v14) != 0))
                          {
                            if (([*(id *)(a1 + 56) learnedNRMode] & 0x10) == 0
                              || (id v15 = objc_alloc_init((Class)[v5 classNamed:@"NRFPrepareDescriptor"]), (*(void *)(a1 + 104) = v15) != 0))
                            {
                              if (![*(id *)(a1 + 56) rawNightModeEnabled]
                                || (id v16 = objc_alloc_init((Class)[v5 classNamed:@"NRFPrepareDescriptor"]), (*(void *)(a1 + 160) = v16) != 0))
                              {
                                if (![*(id *)(a1 + 56) deepFusionEnabled]
                                  || (FigCapturePixelFormatIs420(objc_msgSend((id)objc_msgSend(*(id *)(a1 + 56), "deepFusionInputFormat"), "pixelFormat")) & 1) == 0&& !objc_msgSend(*(id *)(a1 + 56), "deferredCaptureSupportEnabled"))
                                {
                                  return 0;
                                }
                                id v17 = objc_alloc_init((Class)[v5 classNamed:@"NRFPrepareDescriptor"]);
                                *(void *)(a1 + 176) = v17;
                                if (v17) {
                                  return 0;
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
      uint64_t v18 = 4294954510;
    }
    else
    {
      uint64_t v18 = 4294954516;
    }
    -[BWNRFProcessorController _releaseNRFProcessorResources]((id *)a1);
    return v18;
  }
  return 0;
}

- (id)_prepareDescriptorsByProcessingTypeForResolutionFlavors:(id *)result
{
  if (result)
  {
    uint64_t v3 = result;
    v4 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
    if ([a2 containsObject:&unk_1EFAFF360])
    {
      unsigned int v5 = objc_msgSend((id)objc_msgSend(v3[7], "inputFormat"), "width");
      unsigned int v6 = objc_msgSend((id)objc_msgSend(v3[7], "inputFormat"), "height");
    }
    else
    {
      unsigned int v6 = 0;
      unsigned int v5 = 0;
    }
    if ([a2 containsObject:&unk_1EFAFF378])
    {
      unint64_t v7 = FigCaptureDimensionsFromDictionaryRepresentation(objc_msgSend((id)objc_msgSend(v3[7], "dimensionsByQSubResolutionFlavor"), "objectForKeyedSubscript:", &unk_1EFAFF378));
      unsigned int v8 = v7;
      unint64_t v9 = v7 & 0xFFFFFFFF00000000;
    }
    else
    {
      unsigned int v8 = 0;
      unint64_t v9 = 0;
    }
    if ([a2 containsObject:&unk_1EFAFF330])
    {
      unint64_t v10 = FigCaptureDimensionsFromDictionaryRepresentation(objc_msgSend((id)objc_msgSend(v3[7], "dimensionsByQSubResolutionFlavor"), "objectForKeyedSubscript:", &unk_1EFAFF330));
      unsigned int v11 = v10;
      unint64_t v12 = v10 & 0xFFFFFFFF00000000;
    }
    else
    {
      unsigned int v11 = 0;
      unint64_t v12 = 0;
    }
    id v13 = (void *)[MEMORY[0x1E4F1CA48] array];
    v38 = (void *)[MEMORY[0x1E4F1CA48] array];
    unint64_t v14 = v5 | ((unint64_t)v6 << 32);
    if (FigCaptureVideoDimensionsAreValid(v14))
    {
      [v13 addObject:FigCaptureDictionaryRepresentationForDimensions(v14)];
      [v38 addObject:FigCaptureDictionaryRepresentationForDimensions(v14)];
    }
    unint64_t v15 = v9 | v8;
    if (FigCaptureVideoDimensionsAreValid(v15) && !FigCaptureVideoDimensionsAreEqual(v14, v9 | v8))
    {
      [v13 addObject:FigCaptureDictionaryRepresentationForDimensions(v9 | v8)];
      [v38 addObject:FigCaptureDictionaryRepresentationForDimensions(v9 | v8)];
    }
    unint64_t v16 = v12 | v11;
    if (FigCaptureVideoDimensionsAreValid(v16)) {
      [v13 addObject:FigCaptureDictionaryRepresentationForDimensions(v12 | v11)];
    }
    unint64_t v17 = FigCaptureLargestDimensionsFromDimensionsArray(v13);
    unint64_t v18 = HIDWORD(v17);
    [v3[12] setWidth:v17];
    [v3[12] setHeight:v18];
    objc_msgSend(v3[12], "setMemoryPoolId:", -[BWMemoryPool poolIdentifier](+[BWMemoryPool sharedMemoryPool](BWMemoryPool, "sharedMemoryPool"), "poolIdentifier"));
    objc_msgSend(v3[12], "setPixelFormat:", objc_msgSend((id)objc_msgSend(v3[7], "inputFormat"), "pixelFormat"));
    objc_msgSend(v3[12], "setAllowModifyingInputBuffers:", objc_msgSend(v3[7], "alwaysAllowModifyingInputBuffers"));
    [v4 setObject:v3[12] forKeyedSubscript:&unk_1EFAFF390];
    if ([v3[7] swfrEnabled]) {
      [v4 setObject:v3[12] forKeyedSubscript:&unk_1EFAFF3A8];
    }
    if ([v3[7] learnedNRMode] && (objc_msgSend(v3[7], "learnedNRMode") & 0x10) != 0)
    {
      v19 = (void *)[v3[7] learnedNRInputFormat];
      if (!v19) {
        v19 = (void *)[v3[7] inputFormat];
      }
      unsigned int v20 = [v19 width];
      unsigned int v21 = [v19 height];
      v22 = (void *)[MEMORY[0x1E4F1CA48] array];
      unint64_t v23 = v20 | ((unint64_t)v21 << 32);
      if (FigCaptureVideoDimensionsAreValid(v23)) {
        [v22 addObject:FigCaptureDictionaryRepresentationForDimensions(v23)];
      }
      if (FigCaptureVideoDimensionsAreValid(v15)) {
        [v22 addObject:FigCaptureDictionaryRepresentationForDimensions(v15)];
      }
      if (([v3[7] learnedNRMode] & 4) != 0 && FigCaptureVideoDimensionsAreValid(v16)) {
        [v22 addObject:FigCaptureDictionaryRepresentationForDimensions(v16)];
      }
      unint64_t v24 = FigCaptureLargestDimensionsFromDimensionsArray(v22);
      unint64_t v25 = HIDWORD(v24);
      [v3[13] setWidth:v24];
      [v3[13] setHeight:v25];
      objc_msgSend(v3[13], "setPixelFormat:", objc_msgSend(v19, "pixelFormat"));
      objc_msgSend(v3[13], "setAllowModifyingInputBuffers:", objc_msgSend(v3[7], "alwaysAllowModifyingInputBuffers"));
      [v4 setObject:v3[13] forKeyedSubscript:&unk_1EFAFF3C0];
    }
    if (([v3[7] fusionEnabled] & 1) != 0 || objc_msgSend(v3[7], "lowLightFusionEnabled"))
    {
      unint64_t v26 = FigCaptureLargestDimensionsFromDimensionsArray(v38);
      unint64_t v27 = HIDWORD(v26);
      [v3[14] setWidth:v26];
      [v3[14] setHeight:v27];
      objc_msgSend(v3[14], "setPixelFormat:", objc_msgSend((id)objc_msgSend(v3[7], "inputFormat"), "pixelFormat"));
      objc_msgSend(v3[14], "setAllowModifyingInputBuffers:", objc_msgSend(v3[7], "alwaysAllowModifyingInputBuffers"));
      objc_msgSend(v3[14], "setMemoryPoolId:", -[BWMemoryPool poolIdentifier](+[BWMemoryPool sharedMemoryPool](BWMemoryPool, "sharedMemoryPool"), "poolIdentifier"));
      if ([v3[7] fusionEnabled]) {
        [v4 setObject:v3[14] forKeyedSubscript:&unk_1EFAFF3D8];
      }
      if ([v3[7] lowLightFusionEnabled]) {
        [v4 setObject:v3[14] forKeyedSubscript:&unk_1EFAFF3F0];
      }
    }
    if ([v3[7] rawNightModeEnabled])
    {
      unsigned int v28 = objc_msgSend((id)objc_msgSend(v3[7], "rawNightModeInputFormat"), "width");
      unsigned int v29 = objc_msgSend((id)objc_msgSend(v3[7], "rawNightModeInputFormat"), "height");
      v30 = (void *)[MEMORY[0x1E4F1CA48] array];
      v31 = (void *)[MEMORY[0x1E4F1CA48] array];
      unint64_t v32 = v28 | ((unint64_t)v29 << 32);
      if (FigCaptureVideoDimensionsAreValid(v32))
      {
        [v30 addObject:FigCaptureDictionaryRepresentationForDimensions(v32)];
        [v31 addObject:FigCaptureDictionaryRepresentationForDimensions(v32)];
      }
      if (FigCaptureVideoDimensionsAreValid(v15))
      {
        [v30 addObject:FigCaptureDictionaryRepresentationForDimensions(v15)];
        [v31 addObject:FigCaptureDictionaryRepresentationForDimensions(v15)];
      }
      if (FigCaptureVideoDimensionsAreValid(v16)) {
        [v30 addObject:FigCaptureDictionaryRepresentationForDimensions(v16)];
      }
      unint64_t v33 = FigCaptureLargestDimensionsFromDimensionsArray(v31);
      unint64_t v34 = HIDWORD(v33);
      [v3[20] setWidth:v33];
      [v3[20] setHeight:v34];
      objc_msgSend(v3[20], "setPixelFormat:", objc_msgSend((id)objc_msgSend(v3[7], "rawNightModeInputFormat"), "pixelFormat"));
      objc_msgSend(v3[20], "setAllowModifyingInputBuffers:", objc_msgSend(v3[7], "alwaysAllowModifyingInputBuffers"));
      [v4 setObject:v3[20] forKeyedSubscript:&unk_1EFAFF408];
    }
    if ([v3[7] deepFusionEnabled]
      && ((FigCapturePixelFormatIs420(objc_msgSend((id)objc_msgSend(v3[7], "deepFusionInputFormat"), "pixelFormat")) & 1) != 0
       || [v3[7] deferredCaptureSupportEnabled]))
    {
      unint64_t v35 = FigCaptureLargestDimensionsFromDimensionsArray(v38);
      unint64_t v36 = HIDWORD(v35);
      [v3[22] setWidth:v35];
      [v3[22] setHeight:v36];
      objc_msgSend(v3[22], "setPixelFormat:", objc_msgSend((id)objc_msgSend(v3[7], "deepFusionInputFormat"), "pixelFormat"));
      objc_msgSend(v3[22], "setAllowModifyingInputBuffers:", objc_msgSend(v3[7], "alwaysAllowModifyingInputBuffers"));
      [v4 setObject:v3[22] forKeyedSubscript:&unk_1EFAFF420];
    }
    v37 = (void *)[v4 copy];
    return (id *)v37;
  }
  return result;
}

- (uint64_t)_setupNRFProcessorWithprepareDescriptorsByProcessingType:(uint64_t)a1
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v2 = a1;
  v22 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  v4 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  unsigned int v5 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  unsigned int v6 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  objc_msgSend(v6, "setObject:forKeyedSubscript:", -[FigCaptureCameraParameters commonNRFParameters](+[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance"), "commonNRFParameters"), @"NRFParameters");
  [v3 setObject:v6 forKeyedSubscript:@"Common"];
  unint64_t v27 = v3;
  [v3 setObject:v4 forKeyedSubscript:@"DefaultSensorIDs"];
  unint64_t v26 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = (id)[*(id *)(v2 + 56) sensorConfigurationsByPortType];
  uint64_t v7 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v25 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        unint64_t v10 = v5;
        if (*(void *)v29 != v25) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v28 + 1) + 8 * i);
        uint64_t v12 = v2;
        id v13 = objc_msgSend((id)objc_msgSend(*(id *)(v2 + 56), "sensorConfigurationsByPortType"), "objectForKeyedSubscript:", v11);
        objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_msgSend(v13, "sensorIDString"), v11);
        unint64_t v14 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
        objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend(v13, "sensorIDDictionary"), "objectForKeyedSubscript:", @"NRFParameters"), @"NRFParameters");
        objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend(v13, "sensorIDDictionary"), "objectForKeyedSubscript:", @"DeepFusionParameters"), @"DeepFusionParameters");
        objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend(v13, "sensorIDDictionary"), "objectForKeyedSubscript:", @"RawNightmodeParameters"), @"RawNightmodeParameters");
        objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend(v13, "sensorIDDictionary"), "objectForKeyedSubscript:", @"ChromaticDefringing"), @"ChromaticDefringing");
        objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend(v13, "sensorIDDictionary"), "objectForKeyedSubscript:", @"SoftISPTuning"), @"SoftISPTuning");
        objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend(v13, "sensorIDDictionary"), "objectForKeyedSubscript:", @"ModuleConfig"), @"ModuleConfig");
        uint64_t v32 = [v13 sensorIDString];
        unint64_t v33 = v14;
        objc_msgSend(v27, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1), v11);
        unsigned int v5 = v10;
        objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(v13, "cameraInfo"), v11);
        unint64_t v15 = v13;
        uint64_t v2 = v12;
        objc_msgSend(v26, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v15, "sensorIDDictionary"), "objectForKeyedSubscript:", @"UBCaptureParameters"), "objectForKeyedSubscript:", @"AdaptiveBracketingParameters"), v11);
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v8);
  }
  if (![v27 count])
  {
    uint64_t v20 = v21;
    LODWORD(v19) = 0;
    FigDebugAssert3();
  }
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v27, *MEMORY[0x1E4F535B0], v19, v20);
  if ([v5 count]) {
    [v22 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F53560]];
  }
  *(void *)(v2 + 144) = [objc_alloc(MEMORY[0x1E4F1C9E8]) initWithDictionary:v26];
  [v22 setObject:a2 forKeyedSubscript:*MEMORY[0x1E4F55A88]];
  if ([*(id *)(v2 + 56) depthDataDeliveryEnabled]) {
    [v22 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F55A70]];
  }
  if ([*(id *)(v2 + 56) quadraSupportEnabled]) {
    [v22 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F55A90]];
  }
  uint64_t v16 = objc_msgSend(NSNumber, "numberWithInt:", -[FigCaptureCameraParameters deviceGeneration](+[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance"), "deviceGeneration"));
  [v22 setObject:v16 forKeyedSubscript:*MEMORY[0x1E4F55A78]];
  uint64_t v17 = [*(id *)(v2 + 80) setupWithOptions:v22];
  if (v17) {
    -[BWNRFProcessorController _releaseNRFProcessorResources]((id *)v2);
  }
  return v17;
}

- (void)dealloc
{
  [(NRFProcessor *)self->_nrfProcessor finishProcessing];
  [(NRFProcessor *)self->_nrfProcessor setOutput:0];
  [(NRFProcessor *)self->_nrfProcessor resetState];
  -[BWNRFProcessorController _releaseNRFProcessorResources]((id *)&self->super.super.isa);
  outputFormatDescription = self->_outputFormatDescription;
  if (outputFormatDescription) {
    CFRelease(outputFormatDescription);
  }
  inferenceInputFormatDescription = self->_inferenceInputFormatDescription;
  if (inferenceInputFormatDescription) {
    CFRelease(inferenceInputFormatDescription);
  }
  demosaicedRawFormatDescription = self->_demosaicedRawFormatDescription;
  if (demosaicedRawFormatDescription) {
    CFRelease(demosaicedRawFormatDescription);
  }
  linearOutputMIWBAppliedFormatDescription = self->_linearOutputMIWBAppliedFormatDescription;
  if (linearOutputMIWBAppliedFormatDescription) {
    CFRelease(linearOutputMIWBAppliedFormatDescription);
  }
  gainMapFormatDescription = self->_gainMapFormatDescription;
  if (gainMapFormatDescription) {
    CFRelease(gainMapFormatDescription);
  }

  v8.receiver = self;
  v8.super_class = (Class)BWNRFProcessorController;
  [(BWStillImageProcessorController *)&v8 dealloc];
}

- (void)_releaseNRFProcessorResources
{
  if (a1)
  {

    a1[10] = 0;
    a1[11] = 0;

    a1[8] = 0;
    a1[18] = 0;

    a1[12] = 0;
    a1[13] = 0;

    a1[14] = 0;
    a1[22] = 0;

    a1[20] = 0;
    a1[23] = 0;

    a1[15] = 0;
    a1[21] = 0;

    a1[16] = 0;
    a1[17] = 0;

    a1[19] = 0;
  }
}

- (unint64_t)type
{
  return 6;
}

- (void)input:(id)a3 addFrame:(opaqueCMSampleBuffer *)a4 isReferenceFrame:(BOOL)a5
{
  BOOL v5 = a5;
  if ([(BWNRFProcessorRequest *)self->_currentRequest input] == a3)
  {
    if (objc_opt_respondsToSelector())
    {
      currentRequest = self->_currentRequest;
      if (currentRequest) {
        delegate = currentRequest->_delegate;
      }
      else {
        delegate = 0;
      }
      [(BWNRFProcessorControllerDelegate *)delegate processorController:self willAddSampleBuffer:a4 processorInput:a3];
    }
    nrfp_addFrame((uint64_t)self, (uint64_t)self->_currentRequest, self->_nrfProcessor, a4, v5);
    if ([(BWNRFProcessorRequest *)self->_currentRequest err])
    {
      uint64_t v11 = -[BWNRFProcessorInput adaptiveBracketingParameters]([(BWNRFProcessorRequest *)self->_currentRequest input]);
      -[BWNRFAdaptiveBracketingParameters stopAdaptiveBracketing]((uint64_t)v11);
    }
  }
  -[BWNRFProcessorController _updateStateIfNeeded]((uint64_t)self);
}

- (uint64_t)_updateStateIfNeeded
{
  if (!result) {
    return result;
  }
  uint64_t v1 = result;
  uint64_t v2 = *(void *)(result + 248);
  int v3 = [*(id *)(result + 72) currentState];
  if (!v2)
  {
    uint64_t v4 = 1;
    goto LABEL_13;
  }
  if (v3 == 2) {
    goto LABEL_11;
  }
  if (v3 == 4)
  {
    if (-[BWNRFProcessorRequest receivedAllFrames](v2))
    {
      uint64_t v4 = 32;
      switch(-[BWNRFProcessorRequest processingType](v2))
      {
        case 1u:
          goto LABEL_13;
        case 2u:
          uint64_t v4 = 64;
          break;
        case 3u:
          uint64_t v4 = 128;
          break;
        case 4u:
          uint64_t v4 = 256;
          break;
        case 5u:
          goto LABEL_12;
        default:
          if (*(unsigned char *)(v2 + 41)) {
            uint64_t v4 = 16;
          }
          else {
            uint64_t v4 = 8;
          }
          break;
      }
      goto LABEL_13;
    }
LABEL_11:
    uint64_t v4 = 4;
    goto LABEL_13;
  }
LABEL_12:
  uint64_t v4 = 2;
LABEL_13:
  result = [*(id *)(v1 + 72) currentState];
  if (v4 != result)
  {
    BOOL v5 = *(void **)(v1 + 72);
    return [v5 transitionToState:v4];
  }
  return result;
}

- (void)inputReceivedProcessedRawErrorRecoveryFrame:(id)a3
{
  if ([(BWNRFProcessorRequest *)self->_currentRequest input] == a3)
  {
    currentRequest = self->_currentRequest;
    if (currentRequest)
    {
      if (currentRequest->_processErrorRecoveryFrame)
      {
        -[BWNRFProcessorController _updateStateIfNeeded]((uint64_t)self);
      }
    }
  }
}

- (void)inputReceivedAllFrames:(id)a3
{
  if ([(BWNRFProcessorRequest *)self->_currentRequest input] == a3)
  {
    -[BWNRFProcessorController _updateStateIfNeeded]((uint64_t)self);
  }
}

- (int)enqueueInputForProcessing:(id)a3 delegate:(id)a4 processErrorRecoveryFrame:(BOOL)a5 processOriginalImage:(BOOL)a6 processToneMapping:(BOOL)a7 processInferenceInputImage:(BOOL)a8 clientBracketSequenceNumber:(int)a9 processSemanticRendering:(BOOL)a10 provideInferenceInputImageForProcessing:(BOOL)a11 processSmartStyleRenderingInput:(BOOL)a12 inferencesAvailable:(BOOL)a13
{
  BOOL v15 = a6;
  BOOL v16 = a5;
  BOOL v20 = -[NSSet containsObject:](self->_supportedPortTypes, "containsObject:", [a3 portType]);
  int result = -12780;
  if ((!v16 || !v15) && v20)
  {
    id v22 = objc_alloc_init(self->_nrfUBFusionOutputClass);
    [v22 setCompletionStatus:objc_alloc_init(self->_nrfCompletionStatusClass)];
    if ((objc_msgSend((id)objc_msgSend(a3, "captureStreamSettings"), "captureFlags") & 0x800000000) != 0)
    {
      id v23 = objc_alloc_init(self->_nrfRawNightModeOutputFrameClass);
      [v23 setCompletionStatus:objc_alloc_init(self->_nrfCompletionStatusClass)];
    }
    else
    {
      id v23 = 0;
    }
    if (objc_msgSend((id)objc_msgSend(a3, "captureStreamSettings"), "captureType") == 12)
    {
      id v24 = objc_alloc_init(self->_nrfDeepFusionOutputClass);
      [v24 setCompletionStatus:objc_alloc_init(self->_nrfCompletionStatusClass)];
    }
    else
    {
      id v24 = 0;
    }
    uint64_t v25 = -[BWNRFProcessorRequest initWithInput:output:rawNightModeOutputFrame:deepFusionOutput:processErrorRecoveryFrame:processOriginalImage:processToneMapping:processInferenceInputImage:clientBracketSequenceNumber:processSemanticRendering:provideInferenceInputImageForProcessing:inferencesAvailable:processSmartStyleRenderingInput:delegate:]([BWNRFProcessorRequest alloc], a3, v22, v23, v24, v16, v15, a7, a8, a9, a10, a11, a13, a12, a4);

    [(NSMutableArray *)self->_requestQueue addObject:v25];
    if ([(FigStateMachine *)self->_stateMachine currentState] == 1) {
      [(FigStateMachine *)self->_stateMachine transitionToState:2];
    }
    return 0;
  }
  return result;
}

- (BOOL)finishProcessingCurrentInputNow
{
  uint64_t v2 = self->_currentRequest;
  if (-[BWNRFProcessorInput adaptiveBracketingParameters]([(BWNRFProcessorRequest *)v2 input]))
  {
    -[BWNRFProcessorInput stopAdaptiveBracketingNow]((os_unfair_lock_s *)[(BWNRFProcessorRequest *)v2 input]);
    if ([(BWNRFProcessorRequest *)v2 err]) {
      char v3 = [(BWNRFProcessorRequest *)v2 deliveredAdaptiveBracketingErrorRecoveryFrame];
    }
    else {
      char v3 = 1;
    }
    if (dword_1E96B6A88)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  else
  {
    char v3 = 0;
  }

  return v3;
}

- (void)cancelProcessing
{
  [(NSMutableArray *)self->_requestQueue removeAllObjects];
  [(BWNRFProcessorRequest *)self->_currentRequest setErr:4294950490];
  -[BWNRFProcessorController _serviceNextRequest](self);
  [(NRFProcessor *)self->_nrfProcessor setOutput:0];
  [(NRFProcessor *)self->_nrfProcessor resetState];
  -[BWNRFProcessorController _updateStateIfNeeded]((uint64_t)self);
}

- (void)_serviceNextRequest
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = (void *)result[31];
    if (v2) {
      uint64_t v2 = (void *)v2[7];
    }
    char v3 = v2;
    id v4 = (id)[(id)v1[31] input];
    uint64_t v5 = [(id)v1[31] err];

    v1[31] = 0;
    [v3 processorController:v1 didFinishProcessingInput:v4 err:v5];

    int result = (id)[(id)v1[30] firstObject];
    v1[31] = result;
    if (result)
    {
      [(id)v1[30] removeObjectAtIndex:0];
      unsigned int v6 = (void *)[(id)v1[31] input];
      return (void *)[v6 setDelegate:v1];
    }
  }
  return result;
}

- (id)metalImageBufferProcessor
{
  return self->_nrfProcessor;
}

- (unsigned)rawNightModeOutputPixelFormatByBufferType:(unint64_t)a3
{
  if (a3 - 31 < 2) {
    return 1751527984;
  }
  if (a3 != 35 && a3 != 33) {
    return 0;
  }
  uint64_t v5 = [(BWNRFProcessorControllerConfiguration *)self->_configuration outputFormat];
  return [(BWVideoFormat *)v5 pixelFormat];
}

- (uint64_t)_setupProcessorForProcessingType:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  if (dword_1E96B6A88)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(*(id *)(a1 + 80), "setOutput:", 0, v82, v83);
  [*(id *)(a1 + 80) resetState];
  v97 = (void *)[*(id *)(a1 + 248) input];
  v95 = (void *)[v97 captureSettings];
  int v5 = [v95 captureType];
  unint64_t v6 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "input"), "captureStreamSettings"), "captureFlags");
  unint64_t v7 = v6;
  uint64_t v8 = *(void *)(a1 + 248);
  uint64_t v92 = a2;
  if (!a2 && (v5 - 10) <= 2)
  {
    if (!v8 || !*(unsigned char *)(v8 + 40) && !*(unsigned char *)(v8 + 41))
    {
      unsigned int v91 = 0;
      LOWORD(v9) = 0;
      BOOL v10 = 0;
      BOOL v11 = 0;
      BOOL v12 = 0;
      BOOL v13 = 0;
      unint64_t v87 = (v6 >> 7) & 1;
      int v84 = 1;
      unsigned int cf = 1;
      goto LABEL_21;
    }
    goto LABEL_11;
  }
  if (v8) {
LABEL_11:
  }
    LODWORD(v8) = *(unsigned __int8 *)(v8 + 40) != 0;
  BOOL v10 = a2 == 3;
  unsigned int v14 = a2;
  BOOL v11 = a2 == 4;
  BOOL v12 = v14 == 5;
  unsigned int cf = (v14 < 8) & (0xC1u >> v14);
  unint64_t v87 = (unint64_t)(v6 & 0x80) >> 7;
  BOOL v15 = (v6 & 0x80) != 0 || v14 == 7;
  int v9 = v8 ^ 1;
  if (!v15 || v9 == 0)
  {
    unsigned int v91 = 0;
    int v84 = 0;
    BOOL v13 = 0;
  }
  else
  {
    int v84 = 0;
    BOOL v13 = [v95 learnedNRStereoPhotoFrameFlag] != 0;
    unsigned int v91 = 1;
    LOWORD(v9) = 1;
  }
LABEL_21:
  uint64_t v17 = [*(id *)(a1 + 248) processSemanticRendering];
  unint64_t v96 = v7;
  BOOL v89 = v12;
  if (v17 && v5 == 10)
  {
    char v18 = objc_msgSend(v95, "sceneFlags", v17);
    char v19 = [v95 sceneFlags];
    uint64_t v17 = 1;
    if ((v18 & 8) != 0 || (v19 & 4) != 0)
    {
      LODWORD(v7) = v96;
    }
    else
    {
      LODWORD(v7) = v96;
      if ((v96 & 0x100000) == 0) {
        uint64_t v17 = (v96 >> 22) & 1;
      }
    }
  }
  [*(id *)(a1 + 80) setSrlEnabled:v17];
  char v20 = objc_opt_respondsToSelector();
  uint64_t v21 = *(void *)(a1 + 248);
  if (v20)
  {
    if (v21) {
      BOOL v22 = *(unsigned char *)(v21 + 42) != 0;
    }
    else {
      BOOL v22 = 0;
    }
    [*(id *)(a1 + 80) setSkipDenoising:v22];
    uint64_t v21 = *(void *)(a1 + 248);
    if (!v21) {
      goto LABEL_40;
    }
    if (*(unsigned char *)(v21 + 42) && v92 && v92 != 6) {
      return 4294954516;
    }
  }
  else if (!v21)
  {
    goto LABEL_40;
  }
  if (*(unsigned char *)(v21 + 43))
  {
    if (v12)
    {
      id v24 = 0;
      goto LABEL_46;
    }
    goto LABEL_43;
  }
LABEL_40:
  if ((v12 | [(id)v21 provideInferenceInputImageForProcessing] ^ 1))
  {
    id v24 = 0;
    goto LABEL_46;
  }
  uint64_t v21 = *(void *)(a1 + 248);
  if (!v21)
  {
    uint64_t v25 = 0;
    goto LABEL_44;
  }
LABEL_43:
  uint64_t v25 = *(void **)(v21 + 56);
LABEL_44:
  uint64_t v26 = [v25 processorController:a1 newOutputPixelBufferForProcessorInput:v97 type:-[BWNRFProcessorRequest inferenceInputType](v21)];
  if (!v26) {
    return 4294954510;
  }
  id v24 = (const void *)v26;
  LODWORD(v7) = v96;
LABEL_46:
  unsigned int v94 = v9 & (v7 >> 20);
  [*(id *)(a1 + 248) setGainMapEnabled:0];
  [*(id *)(a1 + 56) gainMapMainImageDownscalingFactor];
  int v28 = v27 == 0.0 || v11;
  if (((v28 | v13) & 1) == 0)
  {
    int v29 = [+[FigCaptureCameraParameters sharedInstance] gainMapVersion] >> 16;
    if (v29 != 2)
    {
      if (v29 != 1) {
        goto LABEL_74;
      }
      if ([*(id *)(a1 + 56) depthDataDeliveryEnabled])
      {
        if ((v96 & 0x800) != 0) {
          uint64_t v30 = v91 | cf ^ 1;
        }
        else {
          uint64_t v30 = 0;
        }
      }
      else if (cf)
      {
        if (!v91) {
          goto LABEL_74;
        }
        int v34 = [+[FigCaptureCameraParameters sharedInstance] nrfVersion];
        if (!v34)
        {
          CFTypeRef v90 = 0;
          v65 = 0;
          v80 = 0;
          uint64_t v23 = 4294954516;
          goto LABEL_200;
        }
        uint64_t v30 = v34 > 2;
      }
      else if (v5 == 11)
      {
        uint64_t v30 = 1;
      }
      else
      {
        uint64_t v30 = v94 | v10;
      }
      long long v31 = *(unsigned char **)(a1 + 248);
      goto LABEL_73;
    }
    long long v31 = *(unsigned char **)(a1 + 248);
    if (v5 == 2 && (v96 & 8) != 0)
    {
      if (!v31)
      {
        BOOL v32 = 0;
        goto LABEL_60;
      }
      if (!v31[43])
      {
        BOOL v32 = v31[42] != 0;
LABEL_60:
        char v33 = 1;
        if (v32 || (v96 & 0x10000) == 0) {
          goto LABEL_63;
        }
      }
    }
    char v33 = v87 | (v5 == 12) | ((v5 & 0xFFFFFFFE) == 10);
LABEL_63:
    uint64_t v30 = v33 & 1;
LABEL_73:
    [v31 setGainMapEnabled:v30];
  }
LABEL_74:
  CFTypeRef v93 = v24;
  if (v10)
  {
    uint64_t v35 = *(void **)(a1 + 176);
    unint64_t v36 = (void *)[*(id *)(a1 + 248) deepFusionOutput];
    if ([v95 produceDeferredPhotoProxyImage]
      && objc_msgSend((id)objc_msgSend(v97, "processingSettings"), "provideDemosaicedRaw"))
    {
      objc_msgSend(v36, "setLinearOutputMetadata:", objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary"));
    }
    [v36 setInferenceInputPixelBuffer:v93];
    v37 = &OBJC_IVAR___BWUBProcessorController__requestQueue;
    uint64_t v38 = v92;
    if ([*(id *)(a1 + 248) inferencesAvailable]) {
      uint64_t v39 = [*(id *)(a1 + 248) provideInferenceInputImageForProcessing] ^ 1;
    }
    else {
      uint64_t v39 = 0;
    }
    [v36 setProvidesInferencesWithoutInferenceInputPixelBuffer:v39];
    if (objc_opt_respondsToSelector())
    {
      if ((v96 & 4) != 0)
      {
        if ((v96 & 0x200000000) != 0)
        {
          uint64_t v48 = 2;
        }
        else if ((v96 & 0x100000000) != 0)
        {
          uint64_t v48 = 4;
        }
        else if ((v96 & 0x10) != 0)
        {
          uint64_t v48 = 3;
        }
        else
        {
          uint64_t v48 = 1;
        }
      }
      else
      {
        uint64_t v48 = 0;
      }
      [*(id *)(a1 + 80) setDeepFusionProcessingMode:v48];
    }
    CFTypeRef cfa = 0;
    v43 = 0;
    v46 = 0;
LABEL_162:
    CFTypeRef v88 = 0;
    CFTypeRef v90 = 0;
    v65 = 0;
    goto LABEL_163;
  }
  if (v11)
  {
    unint64_t v36 = (void *)[*(id *)(a1 + 248) rawNightModeOutputFrame];
    uint64_t v40 = *(void *)(a1 + 248);
    if (v40) {
      v41 = *(void **)(v40 + 56);
    }
    else {
      v41 = 0;
    }
    uint64_t v35 = *(void **)(a1 + 160);
    uint64_t v42 = [v41 processorController:a1 newOutputPixelBufferForProcessorInput:v97 type:31];
    v37 = &OBJC_IVAR___BWUBProcessorController__requestQueue;
    if (v42)
    {
      v43 = (void *)v42;
      uint64_t v44 = *(void *)(a1 + 248);
      uint64_t v38 = v92;
      if (v44) {
        v45 = *(void **)(v44 + 56);
      }
      else {
        v45 = 0;
      }
      v46 = (const void *)[v45 processorController:a1 newOutputPixelBufferForProcessorInput:v97 type:32];
      if (!v46)
      {
        CFTypeRef v88 = 0;
        CFTypeRef v90 = 0;
        v65 = 0;
        uint64_t v23 = 4294954510;
        id v24 = v93;
LABEL_196:
        CFRelease(v43);
LABEL_197:
        if (v46) {
          CFRelease(v46);
        }
        v80 = v88;
        goto LABEL_200;
      }
      [v35 setWidth:CVPixelBufferGetWidth((CVPixelBufferRef)v43)];
      [v35 setHeight:CVPixelBufferGetHeight((CVPixelBufferRef)v43)];
      [v36 setPixelBuffer:v43];
      [v36 setNoiseMapPixelBuffer:v46];
      [v36 setInferenceInputPixelBuffer:v93];
      objc_msgSend(v36, "setMetadata:", objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary"));
      if ((int)[*(id *)(a1 + 56) greenGhostMitigationVersion] < 1) {
        uint64_t v47 = 0;
      }
      else {
        uint64_t v47 = objc_msgSend((id)objc_msgSend(v97, "processingSettings"), "provideDemosaicedRaw") ^ 1;
      }
      [*(id *)(a1 + 80) setEnableGreenGhostMitigation:v47];
      [*(id *)(a1 + 80) enableGreenGhostMitigation];
      v51 = -[BWNRFProcessorInput adaptiveBracketingParameters]((void *)[*(id *)(a1 + 248) input]);
      if (v51) {
        uint64_t v52 = v51[2];
      }
      else {
        uint64_t v52 = 0;
      }
      [*(id *)(a1 + 80) setProgressiveBracketingParameters:v52];
      CFTypeRef cfa = 0;
      goto LABEL_162;
    }
    goto LABEL_211;
  }
  uint64_t v38 = v92;
  if (objc_msgSend((id)objc_msgSend(v97, "processingSettings"), "provideDemosaicedRaw"))
  {
    uint64_t v49 = *(void *)(a1 + 248);
    if (v49)
    {
      v37 = &OBJC_IVAR___BWUBProcessorController__requestQueue;
      if (*(unsigned char *)(v49 + 43))
      {
        int v50 = 0;
        goto LABEL_110;
      }
      LODWORD(v49) = *(unsigned __int8 *)(v49 + 42) != 0;
    }
    else
    {
      v37 = &OBJC_IVAR___BWUBProcessorController__requestQueue;
    }
    int v50 = v49 ^ 1;
  }
  else
  {
    int v50 = 0;
    v37 = &OBJC_IVAR___BWUBProcessorController__requestQueue;
  }
LABEL_110:
  char v53 = [*(id *)(a1 + 56) learnedNRMode];
  v54 = &OBJC_IVAR___BWNRFProcessorController__learnedNRPrepareDescriptor;
  if ((v53 & 0x10) == 0) {
    v54 = &OBJC_IVAR___BWNRFProcessorController__prepareDescriptor;
  }
  if ((v92 - 1) < 2) {
    v54 = &OBJC_IVAR___BWNRFProcessorController__ubPrepareDescriptor;
  }
  uint64_t v35 = *(void **)(a1 + *v54);
  unint64_t v36 = (void *)[*(id *)(a1 + 248) output];
  uint64_t v55 = *(void *)(a1 + 248);
  if (v55)
  {
    if (*(unsigned char *)(v55 + 43))
    {
      uint64_t v56 = 0;
LABEL_122:
      CFTypeRef cfa = (CFTypeRef)v56;
      [v36 setPixelBuffer:v56];
      objc_msgSend(v36, "setMetadata:", objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary"));
      if (v89)
      {
        [v36 setInferenceInputPixelBuffer:0];
        uint64_t v59 = 1;
      }
      else
      {
        [v36 setInferenceInputPixelBuffer:v93];
        if ([*(id *)(a1 + 248) inferencesAvailable]) {
          uint64_t v59 = [*(id *)(a1 + 248) provideInferenceInputImageForProcessing] ^ 1;
        }
        else {
          uint64_t v59 = 0;
        }
      }
      [v36 setProvidesInferencesWithoutInferenceInputPixelBuffer:v59];
      if (v50)
      {
        uint64_t v60 = *(void *)(a1 + 248);
        if (v60) {
          v61 = *(void **)(v60 + 56);
        }
        else {
          v61 = 0;
        }
        uint64_t v62 = [v61 processorController:a1 newOutputPixelBufferForProcessorInput:v97 type:21];
        if (v62)
        {
          [v36 setLinearOutputPixelBuffer:v62];
          objc_msgSend(v36, "setLinearOutputMetadata:", objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary"));
        }
        else
        {
          [*(id *)(a1 + 248) setDemosaicedRawErr:4294954510];
        }
      }
      else
      {
        uint64_t v62 = 0;
      }
      CFTypeRef v88 = (CFTypeRef)v62;
      if ([*(id *)(a1 + 248) processSmartStyleRenderingInput])
      {
        uint64_t v63 = *(void *)(a1 + 248);
        if (v63) {
          v64 = *(void **)(v63 + 56);
        }
        else {
          v64 = 0;
        }
        v65 = (const void *)[v64 processorController:a1 newOutputPixelBufferForProcessorInput:v97 type:41];
        if (!v65)
        {
          v43 = 0;
          v46 = 0;
          CFTypeRef v90 = 0;
          uint64_t v23 = 4294954510;
          goto LABEL_193;
        }
        [v36 setLinearOutputMIWBAppliedPixelBuffer:v65];
        objc_msgSend(v36, "setLinearOutputMIWBAppliedMetadata:", objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary"));
      }
      else
      {
        v65 = 0;
      }
      CFTypeRef v90 = v65;
      if ([*(id *)(a1 + 248) gainMapEnabled])
      {
        uint64_t v66 = *(void *)(a1 + 248);
        if (v66) {
          v67 = *(void **)(v66 + 56);
        }
        else {
          v67 = 0;
        }
        v65 = (const void *)[v67 processorController:a1 newOutputPixelBufferForProcessorInput:v97 type:19];
        if (v65 && (objc_opt_respondsToSelector() & 1) != 0) {
          objc_msgSend(v36, "setGainMapOutputMetadata:", objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary"));
        }
      }
      else
      {
        v65 = 0;
      }
      [v36 setGainMapOutputPixelBuffer:v65];
      if (v92 == 5 || v92 == 2)
      {
        v68 = -[BWNRFProcessorInput adaptiveBracketingParameters]((void *)[*(id *)(a1 + 248) input]);
        if (v68) {
          uint64_t v69 = v68[2];
        }
        else {
          uint64_t v69 = 0;
        }
        [*(id *)(a1 + v37[87]) setProgressiveBracketingParameters:v69];
      }
      BOOL v70 = ([v95 sceneFlags] & 0x100) != 0 && objc_msgSend(v95, "captureType") != 2;
      [*(id *)(a1 + v37[87]) setDoRedFaceFix:v70];
      if ((int)[*(id *)(a1 + 56) greenGhostMitigationVersion] < 1) {
        uint64_t v71 = 0;
      }
      else {
        uint64_t v71 = objc_msgSend((id)objc_msgSend(v97, "processingSettings"), "provideDemosaicedRaw") ^ 1;
      }
      [*(id *)(a1 + v37[87]) setEnableGreenGhostMitigation:v71];
      [*(id *)(a1 + v37[87]) enableGreenGhostMitigation];
      v43 = 0;
      v46 = 0;
LABEL_163:
      objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "input"), "settings");
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && -[BWNRFProcessorRequest imageType](*(void *)(a1 + 248)) != 38)
      {
        uint64_t v72 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "input"), "settings"), "semanticStyle");
        if (v72 && (uint64_t v73 = v72, [*(id *)(a1 + 248) inferencesAvailable])) {
          v74 = [[BWStillImageSemanticStyle alloc] initWithSemanticStyle:v73];
        }
        else {
          v74 = 0;
        }
        [*(id *)(a1 + v37[87]) setSemanticStyleProperties:v74];
      }
      if (v94)
      {
        if ((v96 & 0x1800) == 0x800)
        {
          uint64_t v75 = 1;
        }
        else
        {
          int v76 = [v97 fusionMode];
          if (v76 == 2) {
            uint64_t v75 = 2;
          }
          else {
            uint64_t v75 = v76 == 1;
          }
        }
      }
      else
      {
        uint64_t v75 = 0;
      }
      [*(id *)(a1 + v37[87]) setFusionMode:v75];
      [*(id *)(a1 + v37[87]) setReferenceFrameHasEVMinus:v94];
      if (objc_opt_respondsToSelector())
      {
        if (v38 == 7) {
          uint64_t v77 = 0;
        }
        else {
          uint64_t v77 = v91;
        }
        [*(id *)(a1 + v37[87]) setLearnedNREnabled:v77];
      }
      if (objc_opt_respondsToSelector())
      {
        if (v91) {
          uint64_t v78 = [v95 deliverDeferredPhotoProxyImage] ^ 1;
        }
        else {
          uint64_t v78 = 1;
        }
        [*(id *)(a1 + v37[87]) setStfAllowed:v78];
      }
      [*(id *)(a1 + v37[87]) setOutput:v36];
      if (v35)
      {
        if ([*(id *)(a1 + 56) cmiResourceEnabled]) {
          BOOL v79 = objc_msgSend((id)objc_msgSend(v97, "captureStreamSettings"), "captureType") == 12;
        }
        else {
          BOOL v79 = 0;
        }
        [v35 setCmiResourceEnabled:v79];
        objc_msgSend(v35, "setIsQuadra:", ((unint64_t)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "input"), "captureStreamSettings"), "captureFlags") >> 4) & 1);
        objc_msgSend(v35, "setSensorID:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 56), "sensorConfigurationsByPortType"), "objectForKeyedSubscript:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "input"), "captureStreamSettings"), "portType")), "sensorIDString"));
        uint64_t v23 = [*(id *)(a1 + v37[87]) prepareToProcess:v38 prepareDescriptor:v35];
        if (!v23) {
          [*(id *)(a1 + v37[87]) setDelegate:a1];
        }
      }
      else
      {
        uint64_t v23 = 4294954516;
      }
LABEL_193:
      id v24 = v93;
      if (cfa) {
        CFRelease(cfa);
      }
      if (!v43) {
        goto LABEL_197;
      }
      goto LABEL_196;
    }
    v57 = *(void **)(v55 + 56);
  }
  else
  {
    v57 = 0;
  }
  if (v84) {
    uint64_t v58 = -[BWNRFProcessorRequest fusionErrorRecoveryImageType](v55);
  }
  else {
    uint64_t v58 = -[BWNRFProcessorRequest imageType](v55);
  }
  uint64_t v56 = [v57 processorController:a1 newOutputPixelBufferForProcessorInput:v97 type:v58];
  if (v56) {
    goto LABEL_122;
  }
LABEL_211:
  CFTypeRef v90 = 0;
  v65 = 0;
  v80 = 0;
  uint64_t v23 = 4294954510;
  id v24 = v93;
LABEL_200:
  if (v24) {
    CFRelease(v24);
  }
  if (v65) {
    CFRelease(v65);
  }
  if (v80) {
    CFRelease(v80);
  }
  if (v90) {
    CFRelease(v90);
  }
  return v23;
}

- (unint64_t)_setupProcessor
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = -[BWNRFProcessorRequest processingType](*(void *)(result + 248));
    uint64_t v3 = -[BWNRFProcessorController _setupProcessorForProcessingType:](v1, v2);
    if (v3)
    {
      [*(id *)(v1 + 248) setErr:v3];
      [*(id *)(v1 + 80) setOutput:0];
      int v9 = *(void **)(v1 + 80);
      return [v9 resetState];
    }
    else
    {
      for (unint64_t i = 0; ; ++i)
      {
        int v5 = (void *)[*(id *)(v1 + 248) input];
        if (v5) {
          int v5 = (void *)v5[7];
        }
        int result = [v5 count];
        if (result <= i) {
          break;
        }
        unint64_t v6 = (void *)[*(id *)(v1 + 248) input];
        if (v6) {
          unint64_t v6 = (void *)v6[7];
        }
        unint64_t v7 = (void *)[v6 objectAtIndexedSubscript:i];
        unint64_t v8 = (unint64_t)BWStillImageCaptureFrameFlagsForSampleBuffer(v7);
        nrfp_addFrame(v1, *(void *)(v1 + 248), *(void **)(v1 + 80), v7, (v8 >> 4) & 1);
      }
    }
  }
  return result;
}

- (void)_processSingleImage
{
  if (a1)
  {
    CMAttachmentBearerRef target = 0;
    uint64_t v2 = *(void *)(a1 + 248);
    if (!v2) {
      goto LABEL_7;
    }
    if (*(unsigned char *)(v2 + 40))
    {
      uint64_t v3 = (opaqueCMSampleBuffer *)objc_msgSend((id)objc_msgSend((id)v2, "input"), "errorRecoveryFrame");
      goto LABEL_10;
    }
    if (*(int *)(v2 + 44) >= 1)
    {
      uint64_t v3 = (opaqueCMSampleBuffer *)-[BWNRFProcessorRequest clientBracketFrame](v2);
    }
    else
    {
LABEL_7:
      uint64_t v4 = (void *)[(id)v2 input];
      if (v4) {
        uint64_t v4 = (void *)v4[7];
      }
      uint64_t v3 = (opaqueCMSampleBuffer *)[v4 firstObject];
    }
LABEL_10:
    uint64_t v5 = -[BWNRFProcessorController _singleImageProcessSampleBuffer:sampleBufferOut:](a1, v3, &target);
    if (v5) {
      goto LABEL_27;
    }
    unint64_t v6 = *(unsigned char **)(a1 + 248);
    if (v6)
    {
      if (v6[43]) {
        BOOL v7 = 1;
      }
      else {
        BOOL v7 = target == 0;
      }
      if (v7)
      {
LABEL_27:
        uint64_t v12 = *(void *)(a1 + 248);
        if (v12)
        {
          if (*(unsigned char *)(v12 + 43)) {
            goto LABEL_31;
          }
          BOOL v13 = *(void **)(v12 + 56);
        }
        else
        {
          BOOL v13 = 0;
        }
        objc_msgSend(v13, "processorController:didFinishProcessingSampleBuffer:type:processorInput:err:", a1, target, -[BWNRFProcessorRequest imageType](v12), objc_msgSend(*(id *)(a1 + 248), "input"), v5);
LABEL_31:
        if (target) {
          CFRelease(target);
        }
        return;
      }
      if (v6[40])
      {
        int v8 = objc_msgSend((id)CMGetAttachment(target, @"StillImageProcessingFlags", 0), "unsignedIntValue");
        CMSetAttachment(target, @"StillImageProcessingFlags", (CFTypeRef)[NSNumber numberWithUnsignedInt:v8 | 0x400u], 1u);
        if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "input"), "captureSettings"), "captureFlags") & 4) != 0)
        {
          int v9 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53070], 0);
          if ([v9 objectForKeyedSubscript:@"UBDeepFusionFusionFailure"])
          {
            uint64_t v10 = objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", @"UBDeepFusionFusionFailure"), "intValue");
            BOOL v11 = *(void **)(a1 + 248);
          }
          else
          {
            BOOL v11 = *(void **)(a1 + 248);
            uint64_t v10 = 4294950489;
          }
          [v11 setErr:v10];
        }
LABEL_25:
        if ([*(id *)(a1 + 248) processSmartStyleRenderingInput]) {
          BWSampleBufferSetAttachedMediaFromPixelBuffer((opaqueCMSampleBuffer *)target, 0x1EFA74720, (__CVBuffer *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "output"), "linearOutputMIWBAppliedPixelBuffer"), (CFTypeRef *)(a1 + 224), objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "output"), "linearOutputMIWBAppliedMetadata"), 0, 0);
        }
        goto LABEL_27;
      }
    }
    else if (!target)
    {
      goto LABEL_27;
    }
    if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(v6, "input"), "captureSettings"), "captureFlags") & 0x80) != 0) {
      CMSetAttachment(target, @"SDOFCustomRendered", &unk_1EFAFF318, 1u);
    }
    goto LABEL_25;
  }
}

- (uint64_t)_singleImageProcessSampleBuffer:(CMAttachmentBearerRef *)a3 sampleBufferOut:
{
  target[16] = *(CMAttachmentBearerRef *)MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  if (!sbuf) {
    return 4294954516;
  }
  if (dword_1E96B6A88)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  ImageBuffer = CMSampleBufferGetImageBuffer(sbuf);
  CFStringRef v8 = (const __CFString *)*MEMORY[0x1E4F52DD0];
  int v9 = (void *)CVBufferCopyAttachment(ImageBuffer, (CFStringRef)*MEMORY[0x1E4F52DD0], 0);
  uint64_t v10 = *(void **)(a1 + 80);
  if (v9) {
    uint64_t v11 = [v10 addInputResource:v9];
  }
  else {
    uint64_t v11 = [v10 addFrame:sbuf];
  }
  uint64_t CopyWithNewPixelBuffer = v11;

  CVBufferRemoveAttachment(ImageBuffer, v8);
  if (!CopyWithNewPixelBuffer)
  {
    uint64_t v13 = [*(id *)(a1 + 80) process];
    if (v13) {
      return v13;
    }
    -[BWNRFProcessorController _logCompletionStatus:processingType:request:](a1, objc_msgSend((id)objc_msgSend(*(id *)(a1 + 80), "output"), "completionStatus"), 0, *(void **)(a1 + 248));
    unsigned int v14 = *(unsigned char **)(a1 + 248);
    if (v14 && v14[43]) {
      return 0;
    }
    target[0] = 0;
    uint64_t CopyWithNewPixelBuffer = BWCMSampleBufferCreateCopyWithNewPixelBuffer(sbuf, (__CVBuffer *)objc_msgSend((id)objc_msgSend(v14, "output", v26, v28), "pixelBuffer"), (CFTypeRef *)(a1 + 200), (CMSampleBufferRef *)target);
    if (!CopyWithNewPixelBuffer)
    {
      if (!objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "output"), "metadata"), "objectForKeyedSubscript:", @"UB"))objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "output"), "metadata"), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionary"), @"UB"); {
      CFStringRef v15 = (const __CFString *)*MEMORY[0x1E4F53070];
      }
      BOOL v16 = objc_msgSend((id)CMGetAttachment(target[0], (CFStringRef)*MEMORY[0x1E4F53070], 0), "mutableCopy");
      objc_msgSend(v16, "addEntriesFromDictionary:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "output"), "metadata"));
      CMSetAttachment(target[0], v15, v16, 1u);

      if (-[BWNRFProcessorRequest imageType](*(void *)(a1 + 248)) == 29)
      {
        int v17 = objc_msgSend((id)CMGetAttachment(target[0], @"StillImageProcessingFlags", 0), "unsignedIntValue");
        CMSetAttachment(target[0], @"StillImageProcessingFlags", (CFTypeRef)[NSNumber numberWithUnsignedInt:v17 | 0x1000u], 1u);
        [*(id *)(a1 + 248) setDeliveredDeferredProxyImage:1];
      }
      else if (-[BWNRFProcessorRequest imageType](*(void *)(a1 + 248)) == 38)
      {
        CMAttachmentBearerRef v18 = target[0];
        int v19 = BWStillImageProcessingFlagsForSampleBuffer(target[0]);
        BWStillImageSetProcessingFlagsForSampleBuffer(v18, v19 | 0x100000);
      }
      if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "output"), "gainMapOutputPixelBuffer"))
      {
        char v20 = *(void **)(a1 + 248);
        if (v20) {
          uint64_t v21 = (void *)v20[7];
        }
        else {
          uint64_t v21 = 0;
        }
        LODWORD(v27) = 0;
        objc_msgSend(v21, "processorController:didFinishProcessingBuffer:metadata:type:captureFrameFlags:processorInput:err:", a1, objc_msgSend((id)objc_msgSend(v20, "output"), "gainMapOutputPixelBuffer"), objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "output"), "metadata"), 19, 0, objc_msgSend(*(id *)(a1 + 248), "input"), v27);
        BOOL v22 = -[BWNRFProcessorController _generateGainMapMetadata:](a1, 0);
        BWSampleBufferSetAttachedMediaFromPixelBuffer((opaqueCMSampleBuffer *)target[0], 0x1EFA4EB60, (__CVBuffer *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "output"), "gainMapOutputPixelBuffer"), (CFTypeRef *)(a1 + 232), (uint64_t)v22, 0, 1);
      }
      if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "input"), "processingSettings"), "provideDemosaicedRaw"))
      {
        uint64_t v23 = (__CVBuffer *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "output"), "linearOutputPixelBuffer");
        id v24 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "output"), "linearOutputMetadata");
        -[BWNRFProcessorController _propagateDemosaicedRawPixelBuffer:demosaicedRawMetadata:outputSampleBuffer:error:](a1, v23, v24, (void *)target[0], [*(id *)(a1 + 248) demosaicedRawErr]);
      }
      if ([*(id *)(a1 + 248) processSmartStyleRenderingInput]) {
        BWSampleBufferSetAttachedMediaFromPixelBuffer((opaqueCMSampleBuffer *)target[0], 0x1EFA74720, (__CVBuffer *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "output"), "linearOutputMIWBAppliedPixelBuffer"), (CFTypeRef *)(a1 + 224), objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "output"), "linearOutputMIWBAppliedMetadata"), 0, 0);
      }
      if (a3) {
        *a3 = target[0];
      }
    }
  }
  return CopyWithNewPixelBuffer;
}

- (void)_processUBFusion
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  CMAttachmentBearerRef target = 0;
  uint64_t v2 = (void *)[*(id *)(a1 + 248) output];
  if (dword_1E96B6A88)
  {
    unsigned int v71 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (objc_msgSend(*(id *)(a1 + 248), "err", v56, v58))
  {
    id v4 = (id)[v2 metadata];
    if (!v4) {
      id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(*(id *)(a1 + 248), "err")), @"UBAddFrameFailure");
    goto LABEL_60;
  }
  objc_msgSend(*(id *)(a1 + 248), "setErr:", objc_msgSend(*(id *)(a1 + 80), "process"));
  id v4 = (id)[v2 metadata];
  if (![*(id *)(a1 + 248) err])
  {
    uint64_t v5 = (void *)[v2 completionStatus];
    int v6 = -[BWNRFProcessorRequest processingType](*(void *)(a1 + 248));
    -[BWNRFProcessorController _logCompletionStatus:processingType:request:](a1, v5, v6, *(void **)(a1 + 248));
    objc_msgSend(*(id *)(a1 + 248), "setErr:", BWCMSampleBufferCreateCopyWithNewPixelBuffer((opaqueCMSampleBuffer *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "input"), "referenceFrame"), (__CVBuffer *)objc_msgSend(v2, "pixelBuffer"), (CFTypeRef *)(a1 + 200), (CMSampleBufferRef *)&target));
    if (![*(id *)(a1 + 248) err])
    {
      if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "input"), "captureSettings"), "captureFlags") & 0x800) == 0)
      {
LABEL_25:
        if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "output"), "gainMapOutputPixelBuffer"))
        {
          int v19 = -[BWNRFProcessorController _generateGainMapMetadata:](a1, 0);
          BWSampleBufferSetAttachedMediaFromPixelBuffer((opaqueCMSampleBuffer *)target, 0x1EFA4EB60, (__CVBuffer *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "output"), "gainMapOutputPixelBuffer"), (CFTypeRef *)(a1 + 232), (uint64_t)v19, 0, 1);
        }
        if [v2 fusionMode] == 2 && (objc_opt_respondsToSelector())
        {
          char v20 = (opaqueCMSampleBuffer *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "input"), "evMinusReferenceFrame");
          memset(&v80, 0, sizeof(v80));
          CMSampleBufferGetPresentationTimeStamp(&v80, v20);
          uint64_t v21 = (void *)[MEMORY[0x1E4F1CA48] array];
          for (uint64_t i = 0; i != 3; ++i)
          {
            for (int j = 0; j != 3; ++j)
            {
              id v24 = NSNumber;
              [v2 refFrameTransform];
              int v61 = v25;
              int v63 = v26;
              double v60 = v27;
              uint64_t v62 = v28;
              int v65 = v29;
              uint64_t v64 = v30;
              LODWORD(v27) = *(_DWORD *)((unint64_t)(&v60 + 2 * i) & 0xFFFFFFFFFFFFFFF3 | (4 * (j & 3)));
              objc_msgSend(v21, "addObject:", objc_msgSend(v24, "numberWithFloat:", v27));
            }
          }
          long long v31 = *(void **)(a1 + 248);
          if (v31) {
            BOOL v32 = (void *)v31[7];
          }
          else {
            BOOL v32 = 0;
          }
          uint64_t v33 = [v31 input];
          CMTime v78 = v80;
          [v32 processorController:a1 didSelectNewReferenceFrameWithPTS:&v78 transform:v21 processorInput:v33];
        }
        CMSetAttachment(target, @"HasUnreliableBracketingMetadata", MEMORY[0x1E4F1CC38], 1u);
        int v34 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53070], 0);
        if ([*(id *)(a1 + 248) processSmartStyleRenderingInput]) {
          BWSampleBufferSetAttachedMediaFromPixelBuffer((opaqueCMSampleBuffer *)target, 0x1EFA74720, (__CVBuffer *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "output"), "linearOutputMIWBAppliedPixelBuffer"), (CFTypeRef *)(a1 + 224), objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "output"), "linearOutputMIWBAppliedMetadata"), 0, 0);
        }
        [v34 addEntriesFromDictionary:v4];
        uint64_t v35 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v2, "fusionMode"));
        [v34 setObject:v35 forKeyedSubscript:*MEMORY[0x1E4F53300]];
        if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "input"), "captureSettings"), "captureFlags") & 0x100000) != 0)
        {
          int v36 = objc_msgSend((id)CMGetAttachment(target, @"StillImageProcessingFlags", 0), "unsignedIntValue");
          CMSetAttachment(target, @"StillImageProcessingFlags", (CFTypeRef)[NSNumber numberWithUnsignedInt:v36 | 2u], 1u);
          if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "input"), "captureSettings"), "deliverOriginalImage") & 1) != 0|| objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "input"), "settings"), "HDRMode") == 1)
          {
            if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "input"), "captureSettings"), "deliverOriginalImage"))uint64_t v37 = 3; {
            else
            }
              uint64_t v37 = 2;
            uint64_t v38 = [NSNumber numberWithShort:v37];
            [v34 setObject:v38 forKeyedSubscript:*MEMORY[0x1E4F53F30]];
          }
        }
        if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "input"), "captureSettings"), "captureType") == 11)
        {
          uint64_t v39 = [*(id *)(a1 + 248) numberOfFramesAddedForMultiFrameProcessing];
          [*(id *)(a1 + 248) totalExposureTimesOfFramesAddedForMultiFrameProcessing];
          float v41 = v40;
          [*(id *)(a1 + 248) minExposureTimesOfFramesAddedForMultiFrameProcessing];
          float v43 = v42;
          [*(id *)(a1 + 248) maxExposureTimesOfFramesAddedForMultiFrameProcessing];
          ExifCompositeImageMetadata = (void *)FigCaptureMetadataUtilitiesCreateExifCompositeImageMetadata(v39, v41, v43, v44);
          [v34 addEntriesFromDictionary:ExifCompositeImageMetadata];

          CMSetAttachment(target, @"OisRecenteringLoggingData", (CFTypeRef)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "input"), "oisRecenteringLoggingData"), 1u);
          CMSetAttachment(target, @"ISPMotionHighPassFilterConvergenceFlags", (CFTypeRef)objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "input"), "ispMotionHighPassFilterConvergenceFlags")), 1u);
        }
        else
        {
          [v34 setObject:&unk_1EFAFF330 forKeyedSubscript:@"CompositeImage"];
        }
        if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "input"), "processingSettings"), "provideDemosaicedRaw"))
        {
          v46 = (__CVBuffer *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "output"), "linearOutputPixelBuffer");
          uint64_t v47 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "output"), "linearOutputMetadata");
          -[BWNRFProcessorController _propagateDemosaicedRawPixelBuffer:demosaicedRawMetadata:outputSampleBuffer:error:](a1, v46, v47, (void *)target, [*(id *)(a1 + 248) demosaicedRawErr]);
        }
        if (dword_1E96B6A88)
        {
          unsigned int v71 = 0;
          os_log_type_t type = OS_LOG_TYPE_DEFAULT;
          uint64_t v48 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          unsigned int v49 = v71;
          if (os_log_type_enabled(v48, type)) {
            unsigned int v50 = v49;
          }
          else {
            unsigned int v50 = v49 & 0xFFFFFFFE;
          }
          if (v50)
          {
            v51 = *(void **)(a1 + 248);
            uint64_t v52 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v51, "input"), "settings"), "settingsID");
            LODWORD(v78.value) = 136315651;
            *(CMTimeValue *)((char *)&v78.value + 4) = (CMTimeValue)"-[BWNRFProcessorController _processUBFusion]";
            LOWORD(v78.flags) = 2113;
            *(void *)((char *)&v78.flags + 2) = v51;
            HIWORD(v78.epoch) = 2048;
            uint64_t v79 = v52;
            LODWORD(v59) = 32;
            v57 = &v78;
            _os_log_send_and_compose_impl();
          }
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        uint64_t v53 = *(void *)(a1 + 248);
        if (v53) {
          v54 = *(void **)(v53 + 56);
        }
        else {
          v54 = 0;
        }
        objc_msgSend(v54, "processorController:didFinishProcessingSampleBuffer:type:processorInput:err:", a1, target, -[BWNRFProcessorRequest imageType](v53), objc_msgSend(*(id *)(a1 + 248), "input"), objc_msgSend(*(id *)(a1 + 248), "err"));
        goto LABEL_60;
      }
      int v7 = [v2 fusionMode];
      if (v7 == 1)
      {
        if (!BWSampleBufferGetAttachedMedia(target, 0x1EFA74360))
        {
          uint64_t v76 = 0x1EFA74360;
          CFStringRef v8 = (void *)MEMORY[0x1E4F1C978];
          int v9 = &v76;
          uint64_t v10 = 1;
          goto LABEL_17;
        }
      }
      else if (v7 == 2)
      {
        v77[0] = @"Depth";
        v77[1] = 0x1EFA74440;
        v77[2] = 0x1EFA74380;
        v77[3] = 0x1EFA743C0;
        CFStringRef v8 = (void *)MEMORY[0x1E4F1C978];
        int v9 = v77;
        uint64_t v10 = 4;
LABEL_17:
        uint64_t v11 = (void *)[v8 arrayWithObjects:v9 count:v10];
LABEL_18:
        uint64_t v12 = (const void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "input"), "evMinusReferenceFrame");
        long long v66 = 0u;
        long long v67 = 0u;
        long long v68 = 0u;
        long long v69 = 0u;
        uint64_t v13 = [v11 countByEnumeratingWithState:&v66 objects:v75 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v67;
          do
          {
            for (uint64_t k = 0; k != v14; ++k)
            {
              if (*(void *)v67 != v15) {
                objc_enumerationMutation(v11);
              }
              uint64_t v17 = *(void *)(*((void *)&v66 + 1) + 8 * k);
              uint64_t AttachedMedia = BWSampleBufferGetAttachedMedia(v12, v17);
              BWSampleBufferSetAttachedMedia(target, v17, AttachedMedia);
            }
            uint64_t v14 = [v11 countByEnumeratingWithState:&v66 objects:v75 count:16];
          }
          while (v14);
        }
        goto LABEL_25;
      }
      uint64_t v11 = 0;
      goto LABEL_18;
    }
  }
LABEL_60:
  if (objc_msgSend(*(id *)(a1 + 248), "err", v57, v59))
  {
    if (v4) {
      id v55 = v4;
    }
    else {
      id v55 = (id)MEMORY[0x1E4F1CC08];
    }
    uint64_t v73 = @"UBFusionFailure";
    id v74 = v55;
    -[BWNRFProcessorController _handleFusionErrorRecoveryWithFailureMetadata:]((id *)a1, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v74 forKeys:&v73 count:1]);
  }
  if (target) {
    CFRelease(target);
  }
}

- (void)_logCompletionStatus:(int)a3 processingType:(void *)a4 request:
{
  if (a1)
  {
    if (a2)
    {
      int v7 = -[BWNRFProcessorCompletionStatus initWithCompletionStatus:]([BWNRFProcessorCompletionStatus alloc], a2);
      uint64_t v8 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "input"), "settings"), "settingsID");
      uint64_t v9 = [a4 description];
      uint64_t v10 = *(NSObject **)(a1 + 192);
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __72__BWNRFProcessorController__logCompletionStatus_processingType_request___block_invoke;
      v11[3] = &unk_1E5C24C40;
      int v12 = a3;
      v11[4] = v7;
      v11[5] = v9;
      v11[6] = v8;
      dispatch_async(v10, v11);
    }
  }
}

- (void)_generateGainMapMetadata:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  uint64_t v3 = *(void **)(a1 + 248);
  if (!a2)
  {
    [v3 output];
    if ((objc_opt_respondsToSelector() & 1) != 0
      && objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "output"), "gainMapOutputMetadata"))
    {
      id v4 = (void *)[*(id *)(a1 + 248) output];
      goto LABEL_9;
    }
LABEL_10:
    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    goto LABEL_11;
  }
  [v3 deepFusionOutput];
  if ((objc_opt_respondsToSelector() & 1) == 0
    || !objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "deepFusionOutput"), "gainMapOutputMetadata"))
  {
    goto LABEL_10;
  }
  id v4 = (void *)[*(id *)(a1 + 248) deepFusionOutput];
LABEL_9:
  uint64_t v5 = [v4 gainMapOutputMetadata];
LABEL_11:
  int v6 = (void *)v5;
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithInt:", -[FigCaptureCameraParameters gainMapVersion](+[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance"), "gainMapVersion"));
  [v6 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F53318]];
  uint64_t v8 = NSNumber;
  [*(id *)(a1 + 56) gainMapMainImageDownscalingFactor];
  uint64_t v9 = objc_msgSend(v8, "numberWithFloat:");
  [v6 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F533D0]];
  return v6;
}

- (void)_propagateDemosaicedRawPixelBuffer:(void *)a3 demosaicedRawMetadata:(void *)target outputSampleBuffer:(int)a5 error:
{
  if (a1)
  {
    int v6 = 0;
    CMAttachmentBearerRef targeta = 0;
    if (!a2 || a5) {
      goto LABEL_15;
    }
    CFStringRef v10 = (const __CFString *)*MEMORY[0x1E4F53070];
    uint64_t v11 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53070], 0);
    int v6 = (void *)[v11 mutableCopy];
    if ([a3 count]) {
      [v6 addEntriesFromDictionary:a3];
    }
    if (BWCMSampleBufferCreateCopyWithNewPixelBuffer((opaqueCMSampleBuffer *)target, a2, (CFTypeRef *)(a1 + 216), (CMSampleBufferRef *)&targeta))goto LABEL_15; {
    int v12 = objc_msgSend((id)CMGetAttachment(targeta, @"StillImageProcessingFlags", 0), "unsignedIntValue");
    }
    CMSetAttachment(targeta, @"StillImageProcessingFlags", (CFTypeRef)[NSNumber numberWithUnsignedInt:v12 | 0x10000u], 1u);
    CFTypeRef v13 = CMGetAttachment(targeta, @"RawDNGDictionary", 0);
    if (v13)
    {
      uint64_t v14 = (void *)v13;
      unint64_t v15 = psn_pixelBufferDimensions(a2);
      BOOL v16 = (void *)BWCreateDNGDictionaryWithUpdatedToneCurvesIfNeeded(v14, v15, v6);
      if (!v16) {
        goto LABEL_14;
      }
    }
    else
    {
      uint64_t v17 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F54128]];
      uint64_t v18 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 56), "rawColorCalibrationsByPortType"), "objectForKeyedSubscript:", v17);
      if (!v18) {
        goto LABEL_15;
      }
      int v19 = (void *)v18;
      uint64_t v20 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 56), "sensorConfigurationsByPortType"), "objectForKeyedSubscript:", v17), "cameraInfo");
      if (!v20) {
        goto LABEL_15;
      }
      uint64_t v21 = (void *)v20;
      uint64_t PixelFormatType = CVPixelBufferGetPixelFormatType(a2);
      float v23 = (float)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "input"), "settings"), "outputWidth");
      float v24 = v23
          / (float)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "input"), "settings"), "outputHeight");
      unint64_t v25 = psn_pixelBufferDimensions(a2);
      BOOL v16 = (void *)BWCreateDemosaicedRawDNGDictionary(v25, PixelFormatType, v6, v19, v21, v24);
      if (!v16) {
        goto LABEL_15;
      }
    }
    int v26 = v16;
    CMSetAttachment(targeta, @"RawDNGDictionary", v16, 1u);

LABEL_14:
    [v6 setObject:&unk_1EFB05908 forKeyedSubscript:*MEMORY[0x1E4F533D0]];
    CMSetAttachment(targeta, v10, v6, 1u);
    BWSampleBufferSetAttachedMedia(target, 0x1EFA745E0, (uint64_t)targeta);
LABEL_15:

    if (targeta) {
      CFRelease(targeta);
    }
  }
}

- (void)_handleFusionErrorRecoveryWithFailureMetadata:(id *)a1
{
  target[22] = *(CMAttachmentBearerRef *)MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  if (![a1[31] err]) {
    return;
  }
  [a1[10] setOutput:0];
  [a1[10] resetState];
  if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1[31], "input"), "captureSettings"), "deliverOriginalImage")) {
    return;
  }
  id v4 = (opaqueCMSampleBuffer *)objc_msgSend((id)objc_msgSend(a1[31], "input"), "errorRecoveryFrame");
  if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1[31], "input"), "captureSettings"), "captureFlags") & 4) == 0
    || objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1[31], "input"), "captureSettings"), "captureType") == 11)
  {
    if (v4)
    {
      target[0] = 0;
      if (-[BWNRFProcessorController _setupProcessorForProcessingType:]((uint64_t)a1, 0)
        || (-[BWNRFProcessorController _singleImageProcessSampleBuffer:sampleBufferOut:]((uint64_t)a1, v4, target),
            (CMAttachmentBearerRef v14 = target[0]) == 0))
      {
        ImageBuffer = CMSampleBufferGetImageBuffer(v4);
        OSType PixelFormatType = CVPixelBufferGetPixelFormatType(ImageBuffer);
        if (PixelFormatType != objc_msgSend((id)objc_msgSend(a1[7], "outputFormat"), "pixelFormat")
          || BWCMSampleBufferCreateCopyIncludingMetadata(v4, (CMSampleBufferRef *)target)
          || !dword_1E96B6A88)
        {
LABEL_25:
          CMAttachmentBearerRef v14 = target[0];
          if (!target[0]) {
            goto LABEL_30;
          }
          goto LABEL_26;
        }
      }
      else if (!dword_1E96B6A88)
      {
LABEL_26:
        int v16 = objc_msgSend((id)CMGetAttachment(v14, @"StillImageProcessingFlags", 0), "unsignedIntValue");
        CMSetAttachment(target[0], @"StillImageProcessingFlags", (CFTypeRef)[NSNumber numberWithUnsignedInt:v16 | 0x400u], 1u);
        objc_msgSend((id)CMGetAttachment(target[0], (CFStringRef)*MEMORY[0x1E4F53070], 0), "addEntriesFromDictionary:", a2);
        if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1[31], "input"), "captureSettings"), "captureType") == 11)
        {
          [a1[31] setDeliveredAdaptiveBracketingErrorRecoveryFrame:1];
          CMSetAttachment(target[0], @"OisRecenteringLoggingData", (CFTypeRef)objc_msgSend((id)objc_msgSend(a1[31], "input"), "oisRecenteringLoggingData"), 1u);
          CMSetAttachment(target[0], @"ISPMotionHighPassFilterConvergenceFlags", (CFTypeRef)objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend((id)objc_msgSend(a1[31], "input"), "ispMotionHighPassFilterConvergenceFlags")), 1u);
        }
        if (target[0])
        {
          uint64_t v17 = 0;
LABEL_31:
          uint64_t v18 = (uint64_t)a1[31];
          if (v18) {
            int v19 = *(void **)(v18 + 56);
          }
          else {
            int v19 = 0;
          }
          objc_msgSend(v19, "processorController:didFinishProcessingSampleBuffer:type:processorInput:err:", a1, target[0], -[BWNRFProcessorRequest fusionErrorRecoveryImageType](v18), objc_msgSend(a1[31], "input"), v17);
          if (target[0]) {
            CFRelease(target[0]);
          }
          return;
        }
LABEL_30:
        uint64_t v17 = objc_msgSend(a1[31], "err", v20, v21);
        goto LABEL_31;
      }
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      goto LABEL_25;
    }
    goto LABEL_17;
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v7 = a1[31];
    if (v7) {
      uint64_t v8 = (void *)v7[7];
    }
    else {
      uint64_t v8 = 0;
    }
    objc_msgSend(a1[31], "setErr:", objc_msgSend(v8, "processorController:processRawErrorRecoveryFrameForProcessorInput:failureMetadata:", a1, objc_msgSend(v7, "input"), a2));
  }
  if ([a1[31] err])
  {
LABEL_17:
    uint64_t v9 = (uint64_t)a1[31];
    if (v9) {
      CFStringRef v10 = *(void **)(v9 + 56);
    }
    else {
      CFStringRef v10 = 0;
    }
    uint64_t v11 = -[BWNRFProcessorRequest fusionErrorRecoveryImageType](v9);
    uint64_t v12 = [a1[31] input];
    uint64_t v13 = [a1[31] err];
    [v10 processorController:a1 didFinishProcessingSampleBuffer:0 type:v11 processorInput:v12 err:v13];
  }
}

- (void)_processOriginalImage
{
  if (a1)
  {
    CMAttachmentBearerRef target = 0;
    uint64_t v2 = -[BWNRFProcessorController _singleImageProcessSampleBuffer:sampleBufferOut:](a1, (CMSampleBufferRef)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "input"), "originalImage"), &target);
    if (target)
    {
      uint64_t v3 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53070], 0);
      int v4 = objc_msgSend((id)CMGetAttachment(target, @"StillImageProcessingFlags", 0), "unsignedIntValue");
      CMSetAttachment(target, @"StillImageProcessingFlags", (CFTypeRef)[NSNumber numberWithUnsignedInt:v4 | 1u], 1u);
      [v3 setObject:&unk_1EFAFF348 forKeyedSubscript:*MEMORY[0x1E4F53F30]];
      if (!v2) {
        objc_msgSend(v3, "addEntriesFromDictionary:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "output"), "metadata"));
      }
    }
    uint64_t v5 = *(void *)(a1 + 248);
    if (v5) {
      int v6 = *(void **)(v5 + 56);
    }
    else {
      int v6 = 0;
    }
    objc_msgSend(v6, "processorController:didFinishProcessingSampleBuffer:type:processorInput:err:", a1, target, -[BWNRFProcessorRequest imageType](v5), objc_msgSend(*(id *)(a1 + 248), "input"), v2);
    if (target) {
      CFRelease(target);
    }
  }
}

- (void)_processDigitalFlash
{
  if (a1)
  {
    if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "input"), "captureStreamSettings"), "captureFlags") & 0x800000000) != 0)
    {
      -[BWNRFProcessorController _processRawNightMode](a1);
    }
    else
    {
      -[BWNRFProcessorController _processUBFusion](a1);
    }
  }
}

- (void)_processRawNightMode
{
  v32[21] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    CMAttachmentBearerRef cf = 0;
    CMAttachmentBearerRef target = 0;
    uint64_t v2 = (void *)[*(id *)(a1 + 248) rawNightModeOutputFrame];
    uint64_t v3 = (void *)[*(id *)(a1 + 248) output];
    if (dword_1E96B6A88)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    if (objc_msgSend(*(id *)(a1 + 248), "err", v25, v27))
    {
      id v5 = (id)objc_msgSend((id)objc_msgSend(v2, "metadata"), "mutableCopy");
      if (!v5) {
        id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      }
      objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(*(id *)(a1 + 248), "err")), @"RawNightModeAddFrameFailure");
    }
    else
    {
      int v6 = (void *)MEMORY[0x1A6272C70]();
      objc_msgSend(*(id *)(a1 + 248), "setErr:", objc_msgSend(*(id *)(a1 + 80), "process"));
      id v5 = (id)objc_msgSend((id)objc_msgSend(v2, "metadata"), "mutableCopy");
      if (![*(id *)(a1 + 248) err])
      {
        objc_msgSend(*(id *)(a1 + 248), "setErr:", -[BWNRFProcessorController _setupProcessorForProcessingType:](a1, 5));
        if (![*(id *)(a1 + 248) err])
        {
          uint64_t v7 = (void *)[v2 completionStatus];
          int v8 = -[BWNRFProcessorRequest processingType](*(void *)(a1 + 248));
          -[BWNRFProcessorController _logCompletionStatus:processingType:request:](a1, v7, v8, *(void **)(a1 + 248));
          objc_msgSend(*(id *)(a1 + 248), "setErr:", BWCMSampleBufferCreateDeepCopyWithNewPixelBuffer((opaqueCMSampleBuffer *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "input"), "referenceFrame"), (__CVBuffer *)objc_msgSend(v2, "pixelBuffer"), 0, (CFTypeRef *)(a1 + 200), (CMSampleBufferRef *)&target));
          if (![*(id *)(a1 + 248) err])
          {
            CMSetAttachment(target, (CFStringRef)*MEMORY[0x1E4F530E8], (CFTypeRef)[v2 noiseMapPixelBuffer], 1u);
            uint64_t v9 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53070], 0);
            [v9 addEntriesFromDictionary:v5];
            CFStringRef v10 = (void *)MEMORY[0x1A6272C70]([*(id *)(a1 + 80) addFrame:target]);
            objc_msgSend(*(id *)(a1 + 248), "setErr:", objc_msgSend(*(id *)(a1 + 80), "process"));
            if (![*(id *)(a1 + 248) err])
            {
              -[BWNRFProcessorController _logCompletionStatus:processingType:request:](a1, (void *)[v3 completionStatus], 5, *(void **)(a1 + 248));
              objc_msgSend(*(id *)(a1 + 248), "setErr:", BWCMSampleBufferCreateCopyWithNewPixelBuffer((opaqueCMSampleBuffer *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "input"), "referenceFrame"), (__CVBuffer *)objc_msgSend(v3, "pixelBuffer"), (CFTypeRef *)(a1 + 200), (CMSampleBufferRef *)&cf));
              if (![*(id *)(a1 + 248) err])
              {
                if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "output"), "gainMapOutputPixelBuffer"))
                {
                  uint64_t v11 = -[BWNRFProcessorController _generateGainMapMetadata:](a1, 0);
                  BWSampleBufferSetAttachedMediaFromPixelBuffer((opaqueCMSampleBuffer *)cf, 0x1EFA4EB60, (__CVBuffer *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "output"), "gainMapOutputPixelBuffer"), (CFTypeRef *)(a1 + 232), (uint64_t)v11, 0, 1);
                }
                CMSetAttachment(cf, @"HasUnreliableBracketingMetadata", MEMORY[0x1E4F1CC38], 1u);
                objc_msgSend(v9, "addEntriesFromDictionary:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "output"), "metadata"));
                uint64_t v12 = [*(id *)(a1 + 248) numberOfFramesAddedForMultiFrameProcessing];
                [*(id *)(a1 + 248) totalExposureTimesOfFramesAddedForMultiFrameProcessing];
                float v14 = v13;
                [*(id *)(a1 + 248) minExposureTimesOfFramesAddedForMultiFrameProcessing];
                float v16 = v15;
                [*(id *)(a1 + 248) maxExposureTimesOfFramesAddedForMultiFrameProcessing];
                ExifCompositeImageMetadata = (void *)FigCaptureMetadataUtilitiesCreateExifCompositeImageMetadata(v12, v14, v16, v17);
                [v9 addEntriesFromDictionary:ExifCompositeImageMetadata];

                CMSetAttachment(cf, @"OisRecenteringLoggingData", (CFTypeRef)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "input"), "oisRecenteringLoggingData"), 1u);
                CMSetAttachment(cf, @"ISPMotionHighPassFilterConvergenceFlags", (CFTypeRef)objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "input"), "ispMotionHighPassFilterConvergenceFlags")), 1u);
                if ([*(id *)(a1 + 248) processSmartStyleRenderingInput]) {
                  BWSampleBufferSetAttachedMediaFromPixelBuffer((opaqueCMSampleBuffer *)cf, 0x1EFA74720, (__CVBuffer *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "output"), "linearOutputMIWBAppliedPixelBuffer"), (CFTypeRef *)(a1 + 224), objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "output"), "linearOutputMIWBAppliedMetadata"), 0, 0);
                }
                if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "input"), "processingSettings"), "provideDemosaicedRaw"))
                {
                  int v19 = (__CVBuffer *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "output"), "linearOutputPixelBuffer");
                  uint64_t v20 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "output"), "linearOutputMetadata");
                  -[BWNRFProcessorController _propagateDemosaicedRawPixelBuffer:demosaicedRawMetadata:outputSampleBuffer:error:](a1, v19, v20, (void *)cf, [*(id *)(a1 + 248) demosaicedRawErr]);
                }
                if (dword_1E96B6A88)
                {
                  uint64_t v21 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                  os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
                  fig_log_call_emit_and_clean_up_after_send_and_compose();
                }
                uint64_t v22 = *(void *)(a1 + 248);
                if (v22) {
                  float v23 = *(void **)(v22 + 56);
                }
                else {
                  float v23 = 0;
                }
                objc_msgSend(v23, "processorController:didFinishProcessingSampleBuffer:type:processorInput:err:", a1, cf, -[BWNRFProcessorRequest imageType](v22), objc_msgSend(*(id *)(a1 + 248), "input"), objc_msgSend(*(id *)(a1 + 248), "err"));
              }
            }
          }
        }
      }
    }
    if (objc_msgSend(*(id *)(a1 + 248), "err", v26, v28))
    {
      if (v5) {
        id v24 = v5;
      }
      else {
        id v24 = (id)MEMORY[0x1E4F1CC08];
      }
      long long v31 = @"NRFFusionFailure";
      v32[0] = v24;
      -[BWNRFProcessorController _handleFusionErrorRecoveryWithFailureMetadata:]((id *)a1, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:&v31 count:1]);
    }
    if (cf) {
      CFRelease(cf);
    }
    if (target) {
      CFRelease(target);
    }
  }
}

- (void)_processDeepFusion
{
  v22[22] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  uint64_t v2 = (void *)[a1[31] input];
  uint64_t v3 = (void *)[a1[31] deepFusionOutput];
  if (dword_1E96B6A88)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (!objc_msgSend(a1[31], "err", v19, v20))
  {
    if ((objc_msgSend((id)objc_msgSend(v2, "captureSettings"), "captureFlags") & 4) != 0) {
      goto LABEL_22;
    }
    if (![v3 syntheticLongPixelBuffer])
    {
      id v5 = a1[31];
      if (v5) {
        int v6 = (void *)v5[7];
      }
      else {
        int v6 = 0;
      }
      uint64_t v7 = [v6 processorController:a1 newOutputPixelBufferForProcessorInput:v2 type:10];
      if (!v7) {
        goto LABEL_30;
      }
      int v8 = (__CVBuffer *)v7;
      [v3 setSyntheticLongPixelBuffer:v7];
      CVPixelBufferRelease(v8);
      objc_msgSend(v3, "setSyntheticLongMetadata:", objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary"));
    }
    if ([v3 syntheticLongFusionMapPixelBuffer])
    {
LABEL_16:
      if (![v3 longFusionMapPixelBuffer]
        && (objc_msgSend((id)objc_msgSend(v2, "captureSettings"), "captureFlags") & 0x400000) != 0)
      {
        float v13 = a1[31];
        if (v13) {
          float v14 = (void *)v13[7];
        }
        else {
          float v14 = 0;
        }
        uint64_t v15 = [v14 processorController:a1 newOutputPixelBufferForProcessorInput:v2 type:12];
        if (v15)
        {
          float v16 = (__CVBuffer *)v15;
          [v3 setLongFusionMapPixelBuffer:v15];
          CVPixelBufferRelease(v16);
          goto LABEL_22;
        }
        goto LABEL_30;
      }
LABEL_22:
      objc_msgSend(a1[31], "setErr:", objc_msgSend(a1[10], "process"));
      if (![a1[31] err])
      {
        float v17 = objc_msgSend((id)objc_msgSend(a1[10], "output"), "completionStatus");
        int v18 = -[BWNRFProcessorRequest processingType]((uint64_t)a1[31]);
        -[BWNRFProcessorController _logCompletionStatus:processingType:request:]((uint64_t)a1, v17, v18, a1[31]);
        if ([a1[7] deepFusionWaitForProcessingToFinish]) {
          [a1[10] finishProcessing];
        }
      }
      goto LABEL_25;
    }
    uint64_t v9 = a1[31];
    if (v9) {
      CFStringRef v10 = (void *)v9[7];
    }
    else {
      CFStringRef v10 = 0;
    }
    uint64_t v11 = [v10 processorController:a1 newOutputPixelBufferForProcessorInput:v2 type:11];
    if (v11)
    {
      uint64_t v12 = (__CVBuffer *)v11;
      [v3 setSyntheticLongFusionMapPixelBuffer:v11];
      CVPixelBufferRelease(v12);
      goto LABEL_16;
    }
LABEL_30:
    [a1[31] setErr:4294954510];
  }
LABEL_25:
  if ([a1[31] err]
    && objc_msgSend((id)objc_msgSend(v2, "captureSettings"), "deliverDeferredPhotoProxyImage")
    && ([a1[31] deliveredDeferredProxyImage] & 1) == 0)
  {
    uint64_t v21 = @"UBDeepFusionFusionFailure";
    v22[0] = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(a1[31], "err"));
    -[BWNRFProcessorController _handleFusionErrorRecoveryWithFailureMetadata:](a1, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1]);
  }
}

- (id)externalMemoryDescriptorForResolutionFlavors:(id)a3
{
  v10[2] = *MEMORY[0x1E4F143B8];
  int v4 = -[BWNRFProcessorController _prepareDescriptorsByProcessingTypeForResolutionFlavors:]((id *)&self->super.super.isa, a3);
  BOOL v5 = ([(BWNRFProcessorControllerConfiguration *)self->_configuration learnedNRMode] & 0xF) != 0;
  uint64_t v6 = *MEMORY[0x1E4F55A80];
  v9[0] = *MEMORY[0x1E4F55A88];
  v9[1] = v6;
  v10[0] = v4;
  v10[1] = [NSNumber numberWithBool:v5];
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  return (id)-[NRFProcessor externalMemoryDescriptorForConfiguration:](self->_nrfProcessor, "externalMemoryDescriptorForConfiguration:", (id)[objc_alloc(MEMORY[0x1E4F55EB8]) initWithMaxInputDimensions:0 inputPixelFormat:0 maxOutputDimensions:0 cmiResourceEnabled:0 processorSpecificOptions:v7]);
}

- (void)processor:(id)a3 outputReadyWithFrameType:(int)a4 outputPixelBuffer:(__CVBuffer *)a5 outputMetadata:(id)a6 error:(int)a7
{
  if (!a7)
  {
    if (a4 == 3)
    {
      char v10 = [(BWStillImageCaptureSettings *)[(BWStillImageProcessorControllerInput *)[(BWNRFProcessorRequest *)self->_currentRequest input] captureSettings] captureFlags];
      if (a5 || (v10 & 4) != 0)
      {
        uint64_t v11 = [(BWNRFProcessorRequest *)self->_currentRequest deepFusionOutput];
        if (([(NRFDeepFusionOutput *)v11 refFrameTransformIsValid] & 1) != 0
          && (objc_opt_respondsToSelector() & 1) != 0)
        {
          id v63 = a6;
          uint64_t v12 = [(BWNRFProcessorInput *)[(BWNRFProcessorRequest *)self->_currentRequest input] evMinusReferenceFrame];
          memset(&v71, 0, sizeof(v71));
          CMSampleBufferGetPresentationTimeStamp(&v71, v12);
          float v13 = (void *)[MEMORY[0x1E4F1CA48] array];
          for (uint64_t i = 0; i != 3; ++i)
          {
            for (int j = 0; j != 3; ++j)
            {
              float v16 = NSNumber;
              [(NRFDeepFusionOutput *)v11 refFrameTransform];
              int v66 = v17;
              int v68 = v18;
              double v65 = v19;
              uint64_t v67 = v20;
              int v70 = v21;
              uint64_t v69 = v22;
              LODWORD(v19) = *(_DWORD *)((unint64_t)(&v65 + 2 * i) & 0xFFFFFFFFFFFFFFF3 | (4 * (j & 3)));
              objc_msgSend(v13, "addObject:", objc_msgSend(v16, "numberWithFloat:", v19));
            }
          }
          currentRequest = self->_currentRequest;
          if (currentRequest) {
            delegate = currentRequest->_delegate;
          }
          else {
            delegate = 0;
          }
          a6 = v63;
          uint64_t v25 = [(BWNRFProcessorRequest *)currentRequest input];
          CMTime v64 = v71;
          [(BWNRFProcessorControllerDelegate *)delegate processorController:self didSelectNewReferenceFrameWithPTS:&v64 transform:v13 processorInput:v25];
        }
        uint64_t v26 = [(NRFDeepFusionOutput *)[(BWNRFProcessorRequest *)self->_currentRequest deepFusionOutput] gainMapOutputPixelBuffer];
        if (v26)
        {
          uint64_t v27 = v26;
          [(BWNRFProcessorRequest *)self->_currentRequest deepFusionOutput];
          if ((objc_opt_respondsToSelector() & 1) != 0
            && [(NRFDeepFusionOutput *)[(BWNRFProcessorRequest *)self->_currentRequest deepFusionOutput] gainMapOutputMetadata])
          {
            uint64_t v28 = [(NRFDeepFusionOutput *)[(BWNRFProcessorRequest *)self->_currentRequest deepFusionOutput] gainMapOutputMetadata];
          }
          else
          {
            uint64_t v28 = [MEMORY[0x1E4F1CA60] dictionary];
          }
          float v43 = (void *)v28;
          uint64_t v44 = objc_msgSend(NSNumber, "numberWithInt:", -[FigCaptureCameraParameters gainMapVersion](+[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance"), "gainMapVersion"));
          [v43 setObject:v44 forKeyedSubscript:*MEMORY[0x1E4F53318]];
          v45 = self->_currentRequest;
          if (v45) {
            v46 = v45->_delegate;
          }
          else {
            v46 = 0;
          }
          LODWORD(v62) = 0;
          [(BWNRFProcessorControllerDelegate *)v46 processorController:self didFinishProcessingBuffer:v27 metadata:v43 type:19 captureFrameFlags:0 processorInput:[(BWNRFProcessorRequest *)v45 input] err:v62];
        }
        int v29 = self->_currentRequest;
        uint64_t v30 = 8;
LABEL_35:
        if (v29) {
          uint64_t v47 = v29->_delegate;
        }
        else {
          uint64_t v47 = 0;
        }
        uint64_t v48 = [(BWNRFProcessorRequest *)v29 input];
        LODWORD(v62) = 0;
        unsigned int v49 = v47;
        unsigned int v50 = self;
        v51 = a5;
        id v52 = a6;
        uint64_t v53 = v30;
LABEL_38:
        [(BWNRFProcessorControllerDelegate *)v49 processorController:v50 didFinishProcessingBuffer:v51 metadata:v52 type:v53 captureFrameFlags:0 processorInput:v48 err:v62];
      }
    }
    else if (a5)
    {
      int v29 = self->_currentRequest;
      uint64_t v30 = 9;
      switch(a4)
      {
        case 2:
          uint64_t v31 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[NRFDeepFusionOutput fusionMode](-[BWNRFProcessorRequest deepFusionOutput](v29, "deepFusionOutput", a3), "fusionMode"));
          [a6 setObject:v31 forKeyedSubscript:*MEMORY[0x1E4F53300]];
          BOOL v32 = (void *)-[BWNRFProcessorController _newOutputSampleBufferWithSampleBuffer:pixelBuffer:formatDescriptionInOut:metadataToMerge:](self, [(BWNRFProcessorInput *)[(BWNRFProcessorRequest *)self->_currentRequest input] referenceFrame], a5, (CFTypeRef *)&self->_outputFormatDescription, (uint64_t)a6);
          if (![(BWStillImageCaptureSettings *)[(BWStillImageProcessorControllerInput *)[(BWNRFProcessorRequest *)self->_currentRequest input] captureSettings] deliverDeferredPhotoProxyImage])goto LABEL_61; {
          uint64_t v33 = (const void *)objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend((id)CMGetAttachment(v32, @"StillImageProcessingFlags", 0), "unsignedIntValue") | 0x1000);
          }
          CMSetAttachment(v32, @"StillImageProcessingFlags", v33, 1u);
          [(BWNRFProcessorRequest *)self->_currentRequest setDeliveredDeferredProxyImage:1];
          if ([(BWStillImageProcessingSettings *)[(BWStillImageProcessorControllerInput *)[(BWNRFProcessorRequest *)self->_currentRequest input] processingSettings] provideDemosaicedRaw])
          {
            -[BWNRFProcessorController _propagateDemosaicedRawPixelBuffer:demosaicedRawMetadata:outputSampleBuffer:error:]((uint64_t)self, (__CVBuffer *)[(NRFDeepFusionOutput *)[(BWNRFProcessorRequest *)self->_currentRequest deepFusionOutput] linearOutputPixelBuffer], (void *)[(NRFDeepFusionOutput *)[(BWNRFProcessorRequest *)self->_currentRequest deepFusionOutput] linearOutputMetadata], v32, [(BWNRFProcessorRequest *)self->_currentRequest demosaicedRawErr]);
          }
          if ([(NRFDeepFusionOutput *)[(BWNRFProcessorRequest *)self->_currentRequest deepFusionOutput] gainMapOutputPixelBuffer])
          {
            int v34 = -[BWNRFProcessorController _generateGainMapMetadata:]((uint64_t)self, 1);
            BWSampleBufferSetAttachedMediaFromPixelBuffer((opaqueCMSampleBuffer *)v32, 0x1EFA4EB60, (__CVBuffer *)[(NRFDeepFusionOutput *)[(BWNRFProcessorRequest *)self->_currentRequest deepFusionOutput] gainMapOutputPixelBuffer], (CFTypeRef *)&self->_gainMapFormatDescription, (uint64_t)v34, 0, 1);
          }
          if ([(BWNRFProcessorRequest *)self->_currentRequest processSmartStyleRenderingInput])
          {
            BWSampleBufferSetAttachedMediaFromPixelBuffer((opaqueCMSampleBuffer *)v32, 0x1EFA74720, (__CVBuffer *)[(NRFDeepFusionOutput *)[(BWNRFProcessorRequest *)self->_currentRequest deepFusionOutput] linearOutputMIWBAppliedPixelBuffer], (CFTypeRef *)&self->_demosaicedRawFormatDescription, [(NRFDeepFusionOutput *)[(BWNRFProcessorRequest *)self->_currentRequest deepFusionOutput] linearOutputMIWBAppliedMetadata], 0, 0);
          }
          uint64_t v35 = self->_currentRequest;
          if (v35) {
            int v36 = v35->_delegate;
          }
          else {
            int v36 = 0;
          }
          uint64_t v37 = [(BWNRFProcessorRequest *)v35 input];
          uint64_t v38 = v36;
          uint64_t v39 = self;
          float v40 = v32;
          uint64_t v41 = 7;
          uint64_t v42 = 0;
          break;
        case 4:
          goto LABEL_35;
        case 5:
          uint64_t v30 = 10;
          goto LABEL_35;
        case 6:
          uint64_t v30 = 11;
          goto LABEL_35;
        case 7:
          uint64_t v30 = 12;
          goto LABEL_35;
        case 9:
          uint64_t v54 = -[BWNRFProcessorRequest inferenceInputType]((uint64_t)v29);
          id v55 = self->_currentRequest;
          if (v55 && v55->_processErrorRecoveryFrame) {
            goto LABEL_42;
          }
          uint64_t v56 = [(BWNRFProcessorInput *)[(BWNRFProcessorRequest *)v55 input] referenceFrame];
          if (!v56)
          {
            id v55 = self->_currentRequest;
LABEL_42:
            uint64_t v56 = [(BWNRFProcessorInput *)[(BWNRFProcessorRequest *)v55 input] errorRecoveryFrame];
          }
          BOOL v32 = (void *)-[BWNRFProcessorController _newOutputSampleBufferWithSampleBuffer:pixelBuffer:formatDescriptionInOut:metadataToMerge:](self, v56, a5, (CFTypeRef *)&self->_inferenceInputFormatDescription, (uint64_t)a6);
          if (v32) {
            uint64_t v59 = 0;
          }
          else {
            uint64_t v59 = 4294954516;
          }
          double v60 = self->_currentRequest;
          if (v60) {
            int v61 = v60->_delegate;
          }
          else {
            int v61 = 0;
          }
          uint64_t v37 = [(BWNRFProcessorRequest *)v60 input];
          uint64_t v38 = v61;
          uint64_t v39 = self;
          float v40 = v32;
          uint64_t v41 = v54;
          uint64_t v42 = v59;
          break;
        case 10:
          if (![(BWNRFProcessorRequest *)v29 demosaicedRawErr])
          {
            v57 = self->_currentRequest;
            [(BWNRFProcessorRequest *)v57 setDemosaicedRawErr:0];
          }
          return;
        case 11:
          if (v29) {
            uint64_t v58 = v29->_delegate;
          }
          else {
            uint64_t v58 = 0;
          }
          uint64_t v48 = [(BWNRFProcessorRequest *)v29 input];
          LODWORD(v62) = 0;
          unsigned int v49 = v58;
          unsigned int v50 = self;
          v51 = a5;
          id v52 = a6;
          uint64_t v53 = 19;
          goto LABEL_38;
        default:
          return;
      }
      [(BWNRFProcessorControllerDelegate *)v38 processorController:v39 didFinishProcessingSampleBuffer:v40 type:v41 processorInput:v37 err:v42];
LABEL_61:
      if (v32)
      {
        CFRelease(v32);
      }
    }
  }
}

- (CMAttachmentBearerRef)_newOutputSampleBufferWithSampleBuffer:(__CVBuffer *)a3 pixelBuffer:(CFTypeRef *)a4 formatDescriptionInOut:(uint64_t)a5 metadataToMerge:
{
  if (result)
  {
    CMAttachmentBearerRef target = 0;
    if (a2 && a3)
    {
      if (BWCMSampleBufferCreateCopyWithNewPixelBuffer(a2, a3, a4, (CMSampleBufferRef *)&target))
      {
        FigDebugAssert3();
      }
      else
      {
        CFStringRef v6 = (const __CFString *)*MEMORY[0x1E4F53070];
        uint64_t v7 = objc_msgSend((id)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53070], 0), "mutableCopy");
        [v7 addEntriesFromDictionary:a5];
        CMSetAttachment(target, v6, v7, 1u);
      }
    }
    return target;
  }
  return result;
}

- (void)processor:(id)a3 didSelectFusionMode:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  currentRequest = self->_currentRequest;
  if (currentRequest) {
    delegate = currentRequest->_delegate;
  }
  else {
    delegate = 0;
  }
  uint64_t v8 = [(BWNRFProcessorRequest *)currentRequest input];
  [(BWNRFProcessorControllerDelegate *)delegate processorController:self didSelectFusionMode:v4 processorInput:v8];
}

- (void)processor:(id)a3 didSelectProgressiveFusionReferenceFrameIndex:(int)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (dword_1E96B6A88)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  int v7 = [(BWStillImageCaptureStreamSettings *)[(BWStillImageProcessorControllerInput *)[(BWNRFProcessorRequest *)self->_currentRequest input] captureStreamSettings] referenceFrameIndex];
  if ((a4 & 0x80000000) == 0
    && v7 < 0
    && ![(BWNRFProcessorInput *)[(BWNRFProcessorRequest *)self->_currentRequest input] referenceFrame])
  {
    unint64_t v8 = 0;
    int v9 = 0;
    while (1)
    {
      char v10 = [(BWNRFProcessorRequest *)self->_currentRequest input];
      if (v10) {
        char v10 = (BWNRFProcessorInput *)v10->_frames;
      }
      if ([(BWNRFProcessorInput *)v10 count] <= v8) {
        break;
      }
      uint64_t v11 = [(BWNRFProcessorRequest *)self->_currentRequest input];
      if (v11) {
        uint64_t v11 = (BWNRFProcessorInput *)v11->_frames;
      }
      uint64_t v12 = (void *)[(BWNRFProcessorInput *)v11 objectAtIndexedSubscript:v8];
      if (-[BWNRFProcessorRequest useFrameForMultiFrameProcessing:]((uint64_t)self->_currentRequest, v12))
      {
        if (v9 == a4)
        {
          if (v12)
          {
            -[BWNRFProcessorInput _setReferenceFrame:]((void *)[(BWNRFProcessorRequest *)self->_currentRequest input], v12);
            -[BWNRFProcessorInput _setErrorRecoveryFrame:]((void *)[(BWNRFProcessorRequest *)self->_currentRequest input], (void *)[(BWNRFProcessorInput *)[(BWNRFProcessorRequest *)self->_currentRequest input] errorRecoveryFrame]);
            currentRequest = self->_currentRequest;
            if (currentRequest
              && objc_msgSend(-[BWStillImageCaptureStreamSettings adaptiveUnifiedBracketedCaptureParams](-[BWStillImageProcessorControllerInput captureStreamSettings](currentRequest->_input, "captureStreamSettings"), "adaptiveUnifiedBracketedCaptureParams"), "count"))
            {
              [(BWNRFProcessorInput *)[(BWNRFProcessorRequest *)self->_currentRequest input] setKeepFrames:0];
            }
            if (objc_opt_respondsToSelector())
            {
              float v14 = self->_currentRequest;
              if (v14) {
                delegate = v14->_delegate;
              }
              else {
                delegate = 0;
              }
              [(BWNRFProcessorControllerDelegate *)delegate processorController:self didSelectLowLightReferenceFrame:v12 processorInput:[(BWNRFProcessorRequest *)v14 input]];
            }
          }
          return;
        }
        ++v9;
      }
      ++v8;
    }
  }
}

- (id)processorGetInferenceResults:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc_init(NSClassFromString(&cfstr_Nrfprocessorin.isa));
  if ([(BWNRFProcessorRequest *)self->_currentRequest inferencesAvailable])
  {
    currentRequest = self->_currentRequest;
    if (currentRequest) {
      delegate = currentRequest->_delegate;
    }
    else {
      delegate = 0;
    }
    int v7 = (void *)-[BWNRFProcessorControllerDelegate processorController:newInferencesForProcessorInput:inferenceInputBufferType:](delegate, "processorController:newInferencesForProcessorInput:inferenceInputBufferType:", self, -[BWNRFProcessorRequest input](currentRequest, "input"), -[BWNRFProcessorRequest inferenceInputType]((uint64_t)self->_currentRequest));
    uint64_t v8 = [v7 inferenceBufferForAttachedMediaKey:@"PersonSemanticsSkin"];
    if (v8) {
      [v4 setSkinMask:v8];
    }
    uint64_t v9 = [v7 inferenceBufferForAttachedMediaKey:@"PersonSemanticsHair"];
    if (v9) {
      [v4 setHairMask:v9];
    }
    uint64_t v10 = [v7 inferenceBufferForAttachedMediaKey:0x1EFA745A0];
    if (v10) {
      [v4 setSkyMask:v10];
    }
    if ([(BWNRFProcessorControllerConfiguration *)self->_configuration semanticRenderingVersion] < 4)
    {
      uint64_t v12 = [v7 inferenceBufferForAttachedMediaKey:0x1EFA6A200];
      if (v12) {
        [v4 setPersonMask:v12];
      }
    }
    else
    {
      uint64_t v11 = [v7 inferenceBufferForAttachedMediaKey:0x1EFA74420];
      if (v11) {
        [v4 setHighResPersonMask:v11];
      }
    }
    float v13 = (void *)[MEMORY[0x1E4F1CA48] array];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v14 = BWInferenceLowResPersonInstanceMaskKeys();
    uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v24;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v24 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = objc_msgSend(v7, "inferenceBufferForAttachedMediaKey:", *(void *)(*((void *)&v23 + 1) + 8 * v18), (void)v23);
          if (v19) {
            [v13 addObject:v19];
          }
          ++v18;
        }
        while (v16 != v18);
        uint64_t v16 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v16);
    }
    if (objc_msgSend(v13, "count", (void)v23))
    {
      [v4 setLowResPersonInstanceMasks:v13];
      objc_msgSend(v4, "setLowResPersonInstanceConfidences:", objc_msgSend(v7, "inferenceForAttachmentKey:", 0x1EFA6A380));
      objc_msgSend(v4, "setLowResPersonInstanceBoundingBoxes:", objc_msgSend(v7, "inferenceForAttachmentKey:", 0x1EFA6A3A0));
    }
    objc_msgSend(v4, "setSmartCameraSceneType:", objc_msgSend(-[BWStillImageCaptureSettings metadata](-[BWStillImageProcessorControllerInput captureSettings](-[BWNRFProcessorRequest input](self->_currentRequest, "input"), "captureSettings"), "metadata"), "semanticStyleSceneTypeAsSmartCameraSceneType"));
    uint64_t v20 = [v7 inferenceForAttachmentKey:0x1EFA6A1A0];
    if (v20) {
      [v4 setSkinToneClassificationsForFaces:v20];
    }
    uint64_t v21 = [v7 inferenceForAttachmentKey:0x1EFA6A0A0];
    if (v21) {
      [v4 setFaceLandmarks:v21];
    }
  }
  else
  {
    int v7 = 0;
  }

  return v4;
}

- (void)processor:(id)a3 didEnqueueProcessingForSurfaceID:(unsigned int)a4
{
}

- (void)processor:(id)a3 didCompleteProcessingForSurfaceID:(unsigned int)a4
{
}

- (int)progressiveLowLightFusionBatchSize
{
  int result = [(BWNRFProcessorControllerConfiguration *)self->_configuration lowLightFusionEnabled];
  if (result)
  {
    nrfProcessor = self->_nrfProcessor;
    return [(NRFProcessor *)nrfProcessor progressiveBatchSize];
  }
  return result;
}

- (id)adaptiveBracketingParametersForDigitalFlashMode:(int)a3 frameStatistics:(id)a4 stationary:(BOOL)a5 sphereOffsetEnabled:(BOOL)a6 detectedObjects:(id)a7
{
  if (a3
    && (BOOL v8 = a6,
        BOOL v9 = a5,
        (id v13 = -[NSDictionary objectForKeyedSubscript:](self->_adaptiveBracketingCaptureParametersByPortType, "objectForKeyedSubscript:", [a4 portType])) != 0))
  {
    id v14 = v13;
    id NRFStatisticsFromFrameStatistics = nfrp_createNRFStatisticsFromFrameStatistics(self->_nrfProgressiveBracketingStatisticsClass, a4, v9, a7);
    uint64_t v16 = -[BWNRFAdaptiveBracketingParameters initWithProgressiveBracketingParameters:progressiveBracketingStatisticsClass:]([BWNRFAdaptiveBracketingParameters alloc], (id)objc_msgSend(objc_alloc(self->_nrfProgressiveBracketingParametersClass), "initWithOptions:portType:statistics:mode:sphereOffsetEnabled:", v14, objc_msgSend(a4, "portType"), NRFStatisticsFromFrameStatistics, a3 == 2, v8), (uint64_t)self->_nrfProgressiveBracketingStatisticsClass);
  }
  else
  {
    uint64_t v16 = 0;
  }
  return v16;
}

- (id)adaptiveBracketingDigitalFlashTotalIntegrationTimesProviderForPortType:(id)a3
{
  BOOL v5 = -[NSDictionary objectForKeyedSubscript:](self->_adaptiveBracketingCaptureParametersByPortType, "objectForKeyedSubscript:");
  if (v5) {
    BOOL v5 = -[BWNRFAdaptiveBracketingParameters initWithProgressiveBracketingParameters:progressiveBracketingStatisticsClass:]([BWNRFAdaptiveBracketingParameters alloc], (id)[objc_alloc(self->_nrfProgressiveBracketingParametersClass) initWithOptions:v5 portType:a3 statistics:0 mode:0 sphereOffsetEnabled:0], (uint64_t)self->_nrfProgressiveBracketingStatisticsClass);
  }
  return v5;
}

void __72__BWNRFProcessorController__logCompletionStatus_processingType_request___block_invoke(uint64_t a1)
{
  v4[26] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1A6272C70]();
  v4[0] = 0;
  -[BWNRFProcessorCompletionStatus waitForCompletionWithDescriptionOut:](*(void *)(a1 + 32), v4);
  if (dword_1E96B6A88)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

@end