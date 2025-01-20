@interface BWDeepFusionProcessorController
+ (void)initialize;
- (BWDeepFusionProcessorController)initWithConfiguration:(id)a3;
- (id)_propagateMetadataIfNeeded;
- (id)_serviceNextRequest;
- (id)externalMemoryDescriptor;
- (id)metalImageBufferProcessor;
- (id)processorGetInferenceResults:(id)a3 inferenceInputBufferType:(int)a4;
- (int)enqueueInputForProcessing:(id)a3 delegate:(id)a4;
- (uint64_t)_addSemanticStylePropertiesIfAvailable;
- (uint64_t)_loadSetupAndPrepareDeepFusionProcessor;
- (uint64_t)_processOnlyApplyingSemanticStyle;
- (uint64_t)_propagateGainMapToOutputSampleBufferIfNeeded:(uint64_t)result;
- (uint64_t)_propagateSmartStyleLinearInputBufferToOutputSampleBufferIfNeeded:(uint64_t)result;
- (uint64_t)_resetProcessor;
- (uint64_t)_setupProcessor;
- (uint64_t)_setupProcessorForOnlyApplyingSemanticStyle;
- (uint64_t)_updateStateIfNeeded;
- (unint64_t)type;
- (void)_process;
- (void)_propagateDemosaicedRawPixelBufferToOutputSampleBufferIfNeeded:(uint64_t)a1;
- (void)addInferencesForInput:(id)a3;
- (void)beginProcessingCachedBuffersForInput:(id)a3;
- (void)cancelProcessing;
- (void)dealloc;
- (void)input:(id)a3 addInputBuffer:(id)a4;
- (void)processor:(id)a3 didSelectFusionMode:(int)a4;
- (void)processor:(id)a3 outputReadyWithBufferType:(int)a4 outputPixelBuffer:(__CVBuffer *)a5 outputMetadata:(id)a6 error:(int)a7;
@end

@implementation BWDeepFusionProcessorController

- (BWDeepFusionProcessorController)initWithConfiguration:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)BWDeepFusionProcessorController;
  v4 = [(BWDeepFusionProcessorController *)&v10 init];
  if (v4)
  {
    if (!objc_msgSend((id)objc_msgSend(a3, "sensorConfigurationsByPortType"), "count")
      || !FigCaptureVideoDimensionsAreValid([a3 maxInputDimensions])
      || !FigCaptureVideoDimensionsAreValid([a3 maxOutputDimensions]))
    {
      FigDebugAssert3();
      goto LABEL_6;
    }
    v4->_configuration = (BWDeepFusionProcessorControllerConfiguration *)a3;
    v4->_requestQueue = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v5 = [[FigStateMachine alloc] initWithLabel:@"BWDeepFusionProcessorController state machine" stateCount:(char)+[FigStateMachine indexForState:32] initialState:1 owner:v4];
    [(FigStateMachine *)v5 setPerformsAtomicStateTransitions:0];
    [(FigStateMachine *)v5 setLabel:@"Idle" forState:1];
    [(FigStateMachine *)v5 setLabel:@"Ready" forState:2];
    [(FigStateMachine *)v5 setLabel:@"Caching" forState:4];
    [(FigStateMachine *)v5 setLabel:@"Waiting" forState:8];
    [(FigStateMachine *)v5 setLabel:@"Processing" forState:16];
    [(FigStateMachine *)v5 whenTransitioningToStates:0xFFFFFFFFLL callHandler:&__block_literal_global_508];
    [(FigStateMachine *)v5 whenTransitioningToStates:1 callHandler:&__block_literal_global_511];
    [(FigStateMachine *)v5 whenTransitioningToStates:2 callHandler:&__block_literal_global_513_0];
    [(FigStateMachine *)v5 whenTransitioningToState:8 callHandler:&__block_literal_global_515];
    [(FigStateMachine *)v5 whenTransitioningToState:8 callHandler:&__block_literal_global_517];
    uint64_t v6 = [(FigStateMachine *)v5 whenTransitioningToState:16 callHandler:&__block_literal_global_519_0];
    v4->_stateMachine = v5;
    v4->_processorVersion = -1;
    v7 = (void *)MEMORY[0x1A6272C70](v6);
    int SetupAndPrepareDeepFusion = -[BWDeepFusionProcessorController _loadSetupAndPrepareDeepFusionProcessor]((uint64_t)v4);
    if (SetupAndPrepareDeepFusion)
    {
LABEL_6:

      return 0;
    }
  }
  return v4;
}

- (uint64_t)_loadSetupAndPrepareDeepFusionProcessor
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  if (!a1 || *(void *)(a1 + 88)) {
    return 0;
  }
  v28 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  v2 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v32 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  v33 = (void *)v3;
  [v2 setObject:v3 forKeyedSubscript:@"DefaultSensorIDs"];
  v31 = (void *)[MEMORY[0x1E4F1CA80] set];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = (id)[*(id *)(a1 + 56) sensorConfigurationsByPortType];
  uint64_t v4 = [obj countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (!v4)
  {
    v29 = 0;
LABEL_27:
    if (![v2 count])
    {
      uint64_t v26 = v27;
      LODWORD(v25) = 0;
      FigDebugAssert3();
    }
    objc_msgSend(v28, "setObject:forKeyedSubscript:", v2, *MEMORY[0x1E4F535B0], v25, v26);
    v16 = &OBJC_IVAR___BWVideoOrientationMetadataNode__localIDOfOrientationMetadata;
    if ([v32 count]) {
      [v28 setObject:v32 forKeyedSubscript:*MEMORY[0x1E4F53560]];
    }
    *(void *)(a1 + 64) = [objc_alloc(MEMORY[0x1E4F1CAD0]) initWithSet:v31];
    v17 = BWLoadProcessorBundle((uint64_t)v29, *(unsigned int *)(a1 + 80));
    if (!v17)
    {
      FigDebugAssert3();
      return 0;
    }
    v18 = v17;
    uint64_t v19 = [v17 classNamed:@"DeepFusionOutput"];
    *(void *)(a1 + 104) = v19;
    if (!v19) {
      goto LABEL_44;
    }
    v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F55F60]), "initWithbundle:andOptionalCommandQueue:", v18, objc_msgSend(*(id *)(a1 + 56), "metalCommandQueue"));
    *(void *)(a1 + 88) = objc_msgSend(objc_alloc((Class)objc_msgSend(v18, "classNamed:", @"DeepFusionProcessor")), "initWithContext:", v20);

    if (!*(void *)(a1 + 88)) {
      goto LABEL_44;
    }
    if ([*(id *)(a1 + 56) quadraSupportEnabled]) {
      [v28 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F55A90]];
    }
    uint64_t v21 = objc_msgSend(NSNumber, "numberWithInt:", -[FigCaptureCameraParameters deviceGeneration](+[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance"), "deviceGeneration"));
    [v28 setObject:v21 forKeyedSubscript:*MEMORY[0x1E4F55A78]];
    uint64_t v22 = [*(id *)(a1 + 88) setupWithOptions:v28];
    if (v22)
    {
      uint64_t v15 = v22;
      goto LABEL_41;
    }
    id v23 = objc_alloc_init((Class)[v18 classNamed:@"DeepFusionPrepareDescriptor"]);
    *(void *)(a1 + 96) = v23;
    if (v23)
    {
      objc_msgSend(*(id *)(a1 + 96), "setWidth:", objc_msgSend(*(id *)(a1 + 56), "maxOutputDimensions"));
      objc_msgSend(*(id *)(a1 + 96), "setHeight:", (unint64_t)objc_msgSend(*(id *)(a1 + 56), "maxOutputDimensions") >> 32);
      objc_msgSend(*(id *)(a1 + 96), "setCmiResourceEnabled:", objc_msgSend(*(id *)(a1 + 56), "cmiResourceEnabled"));
      if ([*(id *)(a1 + 56) delayPrepareAndCacheBuffers]) {
        return 0;
      }
      uint64_t v15 = [*(id *)(a1 + 88) prepareToProcess:0 prepareDescriptor:*(void *)(a1 + 96)];
      if (!v15) {
        return v15;
      }
    }
    else
    {
LABEL_44:
      uint64_t v15 = 4294954510;
    }
LABEL_41:

    *(void *)(a1 + v16[212]) = 0;
    *(void *)(a1 + 96) = 0;
    return v15;
  }
  uint64_t v5 = v4;
  v29 = 0;
  uint64_t v34 = *(void *)v36;
LABEL_5:
  uint64_t v6 = 0;
  while (1)
  {
    if (*(void *)v36 != v34) {
      objc_enumerationMutation(obj);
    }
    v7 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 56), "sensorConfigurationsByPortType"), "objectForKeyedSubscript:", *(void *)(*((void *)&v35 + 1) + 8 * v6));
    uint64_t v8 = objc_msgSend((id)objc_msgSend(v7, "sensorIDDictionary"), "objectForKeyedSubscript:", @"DeepFusionParameters");
    if (!v8) {
      goto LABEL_21;
    }
    uint64_t v9 = v8;
    objc_msgSend(v33, "setObject:forKeyedSubscript:", objc_msgSend(v7, "sensorIDString"), objc_msgSend(v7, "portType"));
    objc_super v10 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
    [v10 setObject:v9 forKeyedSubscript:@"DeepFusionParameters"];
    objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend(v7, "sensorIDDictionary"), "objectForKeyedSubscript:", @"ModuleConfig"), @"ModuleConfig");
    objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend(v7, "sensorIDDictionary"), "objectForKeyedSubscript:", @"SoftISPTuning"), @"SoftISPTuning");
    unsigned int v11 = [*(id *)(a1 + 56) stillImageFusionScheme];
    if (v11 - 4 < 2)
    {
      *(_DWORD *)(a1 + 80) = [+[FigCaptureCameraParameters sharedInstance] nrfVersion];
      if (!*(_DWORD *)(a1 + 80))
      {
        FigDebugAssert3();
        uint64_t v15 = 4294954510;
        v16 = &OBJC_IVAR___BWVideoOrientationMetadataNode__localIDOfOrientationMetadata;
        goto LABEL_41;
      }
      objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v7, "sensorIDDictionary"), "objectForKeyedSubscript:", @"NRFParameters"), "objectForKeyedSubscript:", @"NRFParameters"), @"NRFParameters");
      v29 = @"NRF";
      goto LABEL_18;
    }
    if (v11 == 3)
    {
      uint64_t v12 = objc_msgSend((id)objc_msgSend(v7, "sensorIDDictionary"), "objectForKeyedSubscript:", @"UBParameters");
      if (v12) {
        [v10 setObject:v12 forKeyedSubscript:@"UBParameters"];
      }
      v29 = @"UB";
      goto LABEL_18;
    }
    if (v11 < 3) {
      break;
    }
LABEL_18:
    uint64_t v13 = objc_msgSend((id)objc_msgSend(v7, "sensorIDDictionary"), "objectForKeyedSubscript:", @"ChromaticDefringing");
    if (v13) {
      [v10 setObject:v13 forKeyedSubscript:@"ChromaticDefringing"];
    }
    uint64_t v39 = [v7 sensorIDString];
    v40 = v10;
    objc_msgSend(v2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1), objc_msgSend(v7, "portType"));
    objc_msgSend(v32, "setObject:forKeyedSubscript:", objc_msgSend(v7, "cameraInfo"), objc_msgSend(v7, "portType"));
    objc_msgSend(v31, "addObject:", objc_msgSend(v7, "portType"));
LABEL_21:
    if (v5 == ++v6)
    {
      uint64_t v5 = [obj countByEnumeratingWithState:&v35 objects:v41 count:16];
      if (v5) {
        goto LABEL_5;
      }
      goto LABEL_27;
    }
  }
  uint64_t v14 = FigSignalErrorAt();
  uint64_t v15 = v14;
  v16 = &OBJC_IVAR___BWVideoOrientationMetadataNode__localIDOfOrientationMetadata;
  if (v14) {
    goto LABEL_41;
  }
  return v15;
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
  -[BWDeepFusionProcessorController _resetProcessor]((uint64_t)self);

  outputFormatDescription = self->_outputFormatDescription;
  if (outputFormatDescription) {
    CFRelease(outputFormatDescription);
  }
  quadraForEnhancedResolutionOutputFormatDescription = self->_quadraForEnhancedResolutionOutputFormatDescription;
  if (quadraForEnhancedResolutionOutputFormatDescription) {
    CFRelease(quadraForEnhancedResolutionOutputFormatDescription);
  }
  inferenceInputFormatDescription = self->_inferenceInputFormatDescription;
  if (inferenceInputFormatDescription) {
    CFRelease(inferenceInputFormatDescription);
  }
  demosaicedRawFormatDescription = self->_demosaicedRawFormatDescription;
  if (demosaicedRawFormatDescription) {
    CFRelease(demosaicedRawFormatDescription);
  }
  smartStyleStillLinearImageFormatDescription = self->_smartStyleStillLinearImageFormatDescription;
  if (smartStyleStillLinearImageFormatDescription) {
    CFRelease(smartStyleStillLinearImageFormatDescription);
  }
  inferenceAttachedMediaFormatDescription = self->_inferenceAttachedMediaFormatDescription;
  if (inferenceAttachedMediaFormatDescription) {
    CFRelease(inferenceAttachedMediaFormatDescription);
  }
  gainMapFormatDescription = self->_gainMapFormatDescription;
  if (gainMapFormatDescription) {
    CFRelease(gainMapFormatDescription);
  }

  v10.receiver = self;
  v10.super_class = (Class)BWDeepFusionProcessorController;
  [(BWStillImageProcessorController *)&v10 dealloc];
}

- (uint64_t)_resetProcessor
{
  if (result)
  {
    uint64_t v1 = result;
    [*(id *)(result + 88) setOutput:0];
    if (objc_opt_respondsToSelector()) {
      [*(id *)(v1 + 88) setDelegate:0];
    }
    v2 = *(void **)(v1 + 88);
    return [v2 resetState];
  }
  return result;
}

- (unint64_t)type
{
  return 2;
}

- (void)input:(id)a3 addInputBuffer:(id)a4
{
  if ([(BWDeepFusionProcessorRequest *)self->_currentRequest input] == a3
    && ![(BWDeepFusionProcessorRequest *)self->_currentRequest cacheBuffers]
    && ![(BWDeepFusionProcessorInput *)[(BWDeepFusionProcessorRequest *)self->_currentRequest input] onlyApplyingSemanticStyle])
  {
    [(BWDeepFusionProcessorRequest *)self->_currentRequest delegate];
    if (objc_opt_respondsToSelector()) {
      -[BWDeepFusionProcessorControllerDelegate processorController:willAddBuffer:metadata:bufferType:processorInput:](-[BWDeepFusionProcessorRequest delegate](self->_currentRequest, "delegate"), "processorController:willAddBuffer:metadata:bufferType:processorInput:", self, [a4 buffer], objc_msgSend(a4, "metadata"), objc_msgSend(a4, "type"), a3);
    }
    dfp_addBuffer(self->_deepFusionProcessor, self->_currentRequest, a4);
  }
  -[BWDeepFusionProcessorController _updateStateIfNeeded]((uint64_t)self);
}

- (uint64_t)_updateStateIfNeeded
{
  if (!result) {
    return result;
  }
  uint64_t v1 = result;
  v2 = *(void **)(result + 176);
  int v3 = [*(id *)(result + 72) currentState];
  if (v2)
  {
    if (v3 == 8)
    {
      if (!-[BWDeepFusionProcessorRequest receivedAllBuffers]((uint64_t)v2)) {
        goto LABEL_21;
      }
      int v5 = objc_msgSend((id)objc_msgSend(v2, "input"), "onlyApplyingSemanticStyle");
      uint64_t v6 = v2[1];
      if (v5)
      {
        uint64_t v4 = 8;
        if (v6)
        {
          if (*(unsigned char *)(v6 + 88)) {
            uint64_t v4 = 16;
          }
          else {
            uint64_t v4 = 8;
          }
        }
        goto LABEL_22;
      }
      if (v6 && *(unsigned char *)(v6 + 88)
        || objc_msgSend((id)objc_msgSend(v2, "input"), "processInferenceInputImage"))
      {
        uint64_t v4 = 16;
      }
      else
      {
LABEL_21:
        uint64_t v4 = 8;
      }
    }
    else if (v3 == 4 || v3 == 2)
    {
      if ([v2 cacheBuffers]) {
        uint64_t v4 = 4;
      }
      else {
        uint64_t v4 = 8;
      }
    }
    else
    {
      uint64_t v4 = 2;
    }
  }
  else
  {
    uint64_t v4 = 1;
  }
LABEL_22:
  result = [*(id *)(v1 + 72) currentState];
  if (v4 != result)
  {
    v7 = *(void **)(v1 + 72);
    return [v7 transitionToState:v4];
  }
  return result;
}

- (void)addInferencesForInput:(id)a3
{
  if ([(BWDeepFusionProcessorRequest *)self->_currentRequest input] == a3
    && ![(BWDeepFusionProcessorRequest *)self->_currentRequest cacheBuffers]
    && ([a3 processInferenceInputImage] & 1) == 0)
  {
    [(IBPDeepFusionProcessor *)self->_deepFusionProcessor addInferenceResults:[(BWDeepFusionProcessorController *)self processorGetInferenceResults:0 inferenceInputBufferType:10] inferenceInputType:10];
  }
  -[BWDeepFusionProcessorController _updateStateIfNeeded]((uint64_t)self);
}

- (void)beginProcessingCachedBuffersForInput:(id)a3
{
  if ([(BWDeepFusionProcessorRequest *)self->_currentRequest input] == a3) {
    [(BWDeepFusionProcessorRequest *)self->_currentRequest setCacheBuffers:0];
  }
  if ([(FigStateMachine *)self->_stateMachine currentState] != 16)
  {
    -[BWDeepFusionProcessorController _updateStateIfNeeded]((uint64_t)self);
  }
}

- (int)enqueueInputForProcessing:(id)a3 delegate:(id)a4
{
  if (!-[NSSet containsObject:](self->_supportedPortTypes, "containsObject:", [a3 portType])) {
    return -12780;
  }
  id v7 = -[BWDeepFusionProcessorRequest initWithInput:delegate:]([BWDeepFusionProcessorRequest alloc], a3, a4);
  if ([(BWDeepFusionProcessorControllerConfiguration *)self->_configuration delayPrepareAndCacheBuffers])
  {
    uint64_t v8 = [a3 onlyApplyingSemanticStyle] ^ 1;
  }
  else
  {
    uint64_t v8 = 0;
  }
  [v7 setCacheBuffers:v8];
  [(NSMutableArray *)self->_requestQueue addObject:v7];

  if ([(FigStateMachine *)self->_stateMachine currentState] == 1) {
    [(FigStateMachine *)self->_stateMachine transitionToState:2];
  }
  return 0;
}

- (void)cancelProcessing
{
  [(NSMutableArray *)self->_requestQueue removeAllObjects];
  [(BWDeepFusionProcessorRequest *)self->_currentRequest setErr:4294950490];
  -[BWDeepFusionProcessorController _serviceNextRequest]((id *)&self->super.super.isa);
  -[BWDeepFusionProcessorController _resetProcessor]((uint64_t)self);
  -[BWDeepFusionProcessorController _updateStateIfNeeded]((uint64_t)self);
}

- (id)_serviceNextRequest
{
  if (result)
  {
    uint64_t v1 = result;
    id v2 = (id)[result[22] delegate];
    id v3 = (id)[v1[22] input];
    uint64_t v4 = [v1[22] err];

    v1[22] = 0;
    [v2 processorController:v1 didFinishProcessingInput:v3 err:v4];

    result = (id *)(id)[v1[21] firstObject];
    v1[22] = result;
    if (result)
    {
      [v1[21] removeObjectAtIndex:0];
      int v5 = (void *)[v1[22] input];
      return (id *)[v5 setDelegate:v1];
    }
  }
  return result;
}

- (id)metalImageBufferProcessor
{
  return self->_deepFusionProcessor;
}

- (id)externalMemoryDescriptor
{
  id v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F55EB8]), "initWithMaxInputDimensions:inputPixelFormat:maxOutputDimensions:cmiResourceEnabled:processorSpecificOptions:", -[BWDeepFusionProcessorControllerConfiguration maxInputDimensions](self->_configuration, "maxInputDimensions"), 0, -[BWDeepFusionProcessorControllerConfiguration maxOutputDimensions](self->_configuration, "maxOutputDimensions"), -[BWDeepFusionProcessorControllerConfiguration cmiResourceEnabled](self->_configuration, "cmiResourceEnabled"), 0);
  deepFusionProcessor = self->_deepFusionProcessor;
  return (id)[(IBPDeepFusionProcessor *)deepFusionProcessor externalMemoryDescriptorForConfiguration:v3];
}

- (uint64_t)_setupProcessor
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  if (!result) {
    return result;
  }
  uint64_t v1 = result;
  id v2 = &OBJC_IVAR___BWVideoOrientationMetadataNode__localIDOfOrientationMetadata;
  id v3 = (void *)[*(id *)(result + 176) input];
  id v4 = objc_alloc_init(*(Class *)(v1 + 104));
  if (!v4) {
    goto LABEL_70;
  }
  int v5 = v4;
  uint64_t v6 = [*(id *)(v1 + 176) output];
  [*(id *)(v1 + 176) setOutput:v5];

  uint64_t v7 = objc_msgSend((id)objc_msgSend(*(id *)(v1 + 176), "delegate"), "processorController:newOutputPixelBufferForProcessorInput:type:", v1, v3, 13);
  if (!v7) {
    goto LABEL_70;
  }
  uint64_t v8 = (const void *)v7;
  objc_msgSend((id)objc_msgSend(*(id *)(v1 + 176), "output"), "setBuffer:", v7);
  CFRelease(v8);
  objc_msgSend((id)objc_msgSend(*(id *)(v1 + 176), "output"), "setMetadata:", objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary"));
  if (objc_msgSend((id)objc_msgSend(v3, "processingSettings"), "provideDemosaicedRaw"))
  {
    uint64_t v9 = (const void *)objc_msgSend((id)objc_msgSend(*(id *)(v1 + 176), "delegate"), "processorController:newOutputPixelBufferForProcessorInput:type:", v1, v3, 21);
    objc_super v10 = *(void **)(v1 + 176);
    if (v9)
    {
      [v10 output];
      char v11 = objc_opt_respondsToSelector();
      uint64_t v12 = *(void **)(v1 + 176);
      if (v11)
      {
        objc_msgSend((id)objc_msgSend(v12, "output"), "setLinearOutputPixelBuffer:", v9);
        objc_msgSend((id)objc_msgSend(*(id *)(v1 + 176), "output"), "setLinearOutputMetadata:", objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary"));
      }
      else
      {
        [v12 setDemosaicedRawErr:4294954516];
      }
      CFRelease(v9);
    }
    else
    {
      [v10 setDemosaicedRawErr:4294954510];
    }
  }
  if (objc_msgSend((id)objc_msgSend(*(id *)(v1 + 176), "input"), "processSmartStyleRenderingInput"))
  {
    uint64_t v13 = objc_msgSend((id)objc_msgSend(*(id *)(v1 + 176), "delegate"), "processorController:newOutputPixelBufferForProcessorInput:type:", v1, v3, 41);
    if (!v13) {
      goto LABEL_70;
    }
    uint64_t v14 = (const void *)v13;
    objc_msgSend((id)objc_msgSend(*(id *)(v1 + 176), "output"), "setLinearOutputMIWBAppliedPixelBuffer:", v13);
    objc_msgSend((id)objc_msgSend(*(id *)(v1 + 176), "output"), "setLinearOutputMIWBAppliedMetadata:", objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary"));
    CFRelease(v14);
  }
  uint64_t v15 = objc_msgSend((id)objc_msgSend(v3, "captureStreamSettings"), "captureFlags");
  int v16 = v15;
  if ((v15 & 0x10) != 0) {
    int v17 = 3;
  }
  else {
    int v17 = 1;
  }
  if ((v15 & 0x200000000) != 0) {
    unsigned int v18 = 2;
  }
  else {
    unsigned int v18 = v17;
  }
  BOOL v19 = (v15 & 4) != 0 && (v15 & 0x200000000) != 0;
  if ((v15 & 4) != 0) {
    uint64_t v20 = v18;
  }
  else {
    uint64_t v20 = 0;
  }
  if ([v3 processInferenceInputImage])
  {
    uint64_t v21 = objc_msgSend((id)objc_msgSend(*(id *)(v1 + 176), "delegate"), "processorController:newOutputPixelBufferForProcessorInput:type:", v1, v3, 15);
    if (!v21) {
      goto LABEL_70;
    }
    uint64_t v22 = (__CVBuffer *)v21;
    objc_msgSend((id)objc_msgSend(*(id *)(v1 + 176), "output"), "setInferenceInputPixelBuffer:", v21);
    CVPixelBufferRelease(v22);
  }
  if ((v19 & [v3 processQuadraForEnhancedResolutionInferenceInputImage]) == 1)
  {
    [*(id *)(v1 + 176) output];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v23 = objc_msgSend((id)objc_msgSend(*(id *)(v1 + 176), "delegate"), "processorController:newOutputPixelBufferForProcessorInput:type:", v1, v3, 36);
      if (!v23) {
        goto LABEL_70;
      }
      v24 = (__CVBuffer *)v23;
      objc_msgSend((id)objc_msgSend(*(id *)(v1 + 176), "output"), "setQuadraForEnhancedResInferenceInputPixelBuffer:", v23);
      CVPixelBufferRelease(v24);
    }
  }
  if (!v19) {
    goto LABEL_37;
  }
  [*(id *)(v1 + 176) output];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    goto LABEL_37;
  }
  uint64_t v25 = objc_msgSend((id)objc_msgSend(*(id *)(v1 + 176), "delegate"), "processorController:newOutputPixelBufferForProcessorInput:type:", v1, v3, 30);
  if (!v25)
  {
LABEL_70:
    uint64_t v49 = 4294954510;
    goto LABEL_71;
  }
  uint64_t v26 = (const void *)v25;
  objc_msgSend((id)objc_msgSend(*(id *)(v1 + 176), "output"), "setQuadraForEnhancedResOutputPixelBuffer:", v25);
  CFRelease(v26);
  objc_msgSend((id)objc_msgSend(*(id *)(v1 + 176), "output"), "setQuadraForEnhancedResOutputMetadata:", objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary"));
LABEL_37:
  uint64_t v27 = &OBJC_IVAR___BWVideoOrientationMetadataNode__localIDOfOrientationMetadata;
  [*(id *)(v1 + 88) setProcessingMode:v20];
  if (objc_opt_respondsToSelector())
  {
    if ((v16 & 0x100000) != 0)
    {
      if ((v16 & 0x1800) == 0x800)
      {
        uint64_t v28 = 1;
      }
      else
      {
        int v29 = [v3 fusionMode];
        if (v29 == 2) {
          uint64_t v28 = 2;
        }
        else {
          uint64_t v28 = v29 == 1;
        }
      }
    }
    else
    {
      uint64_t v28 = 0;
    }
    [*(id *)(v1 + 88) setFusionMode:v28];
  }
  [v3 settings];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_51;
  }
  uint64_t v30 = objc_msgSend((id)objc_msgSend(v3, "settings"), "semanticStyle");
  char v31 = !v19;
  if (!v30) {
    char v31 = 1;
  }
  if ((v31 & 1) != 0 || objc_msgSend((id)objc_msgSend(v3, "captureSettings"), "learnedNRStereoPhotoFrameFlag")) {
LABEL_51:
  }
    -[BWDeepFusionProcessorController _addSemanticStylePropertiesIfAvailable](v1);
  objc_msgSend(*(id *)(v1 + 88), "setOutput:", objc_msgSend(*(id *)(v1 + 176), "output"));
  if (objc_opt_respondsToSelector()) {
    [*(id *)(v1 + 88) setDelegate:v1];
  }
  objc_msgSend(*(id *)(v1 + 96), "setCmiResourceEnabled:", objc_msgSend(*(id *)(v1 + 56), "cmiResourceEnabled"));
  if (v6
    || (uint64_t v32 = [*(id *)(v1 + 88) prepareToProcess:0 prepareDescriptor:*(void *)(v1 + 96)],
        !v32))
  {
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    v50 = v3;
    id obj = (id)[v3 inputBuffers];
    uint64_t v33 = [obj countByEnumeratingWithState:&v52 objects:v56 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v53;
      do
      {
        for (uint64_t i = 0; i != v34; ++i)
        {
          if (*(void *)v53 != v35) {
            objc_enumerationMutation(obj);
          }
          long long v37 = *(void **)(*((void *)&v52 + 1) + 8 * i);
          [*(id *)(v1 + v2[222]) delegate];
          if (objc_opt_respondsToSelector())
          {
            uint64_t v38 = [*(id *)(v1 + v2[222]) delegate];
            uint64_t v39 = v35;
            uint64_t v40 = v1;
            v41 = v27;
            uint64_t v42 = (void *)v38;
            uint64_t v43 = [v37 buffer];
            v44 = v2;
            uint64_t v45 = [v37 metadata];
            uint64_t v46 = [v37 type];
            v47 = v42;
            uint64_t v27 = v41;
            uint64_t v1 = v40;
            uint64_t v35 = v39;
            uint64_t v48 = v45;
            id v2 = v44;
            [v47 processorController:v1 willAddBuffer:v43 metadata:v48 bufferType:v46 processorInput:v50];
          }
          dfp_addBuffer(*(void **)(v1 + v27[212]), *(void **)(v1 + v2[222]), v37);
        }
        uint64_t v34 = [obj countByEnumeratingWithState:&v52 objects:v56 count:16];
      }
      while (v34);
    }
    result = [v50 processInferenceInputImage];
    if ((result & 1) == 0 && v50)
    {
      if (v50[88]) {
        return objc_msgSend(*(id *)(v1 + v27[212]), "addInferenceResults:inferenceInputType:", objc_msgSend((id)v1, "processorGetInferenceResults:inferenceInputBufferType:", 0, 10), 10);
      }
    }
    return result;
  }
  uint64_t v49 = v32;
LABEL_71:
  [*(id *)(v1 + 176) setErr:v49];
  return -[BWDeepFusionProcessorController _resetProcessor](v1);
}

- (uint64_t)_addSemanticStylePropertiesIfAvailable
{
  if (result)
  {
    uint64_t v1 = result;
    objc_msgSend((id)objc_msgSend(*(id *)(result + 176), "input"), "settings");
    objc_opt_class();
    result = objc_opt_isKindOfClass();
    if (result)
    {
      uint64_t v2 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(v1 + 176), "input"), "settings"), "semanticStyle");
      if (v2) {
        id v3 = [[BWStillImageSemanticStyle alloc] initWithSemanticStyle:v2];
      }
      else {
        id v3 = 0;
      }
      id v4 = *(void **)(v1 + 88);
      return [v4 setSemanticStyleProperties:v3];
    }
  }
  return result;
}

- (uint64_t)_setupProcessorForOnlyApplyingSemanticStyle
{
  if (result)
  {
    uint64_t v1 = (id *)result;
    uint64_t v2 = [*(id *)(result + 176) input];
    if (v2 && *(unsigned char *)(v2 + 88))
    {
      uint64_t v3 = [v1 processorGetInferenceResults:0 inferenceInputBufferType:10];
      if (!v3)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        [v1[22] setErr:4294954516];
        return -[BWDeepFusionProcessorController _resetProcessor]((uint64_t)v1);
      }
      [v1[11] addInferenceResults:v3 inferenceInputType:10];
    }
    -[BWDeepFusionProcessorController _addSemanticStylePropertiesIfAvailable]((uint64_t)v1);
    result = objc_opt_respondsToSelector();
    if (result)
    {
      id v4 = v1[11];
      return [v4 setDelegate:v1];
    }
  }
  return result;
}

- (void)_process
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  uint64_t v2 = (void *)[*(id *)(a1 + 176) input];
  CMAttachmentBearerRef target = 0;
  if ([*(id *)(a1 + 176) err])
  {
    id v14 = 0;
    goto LABEL_61;
  }
  [*(id *)(a1 + 176) output];
  unsigned __int8 v3 = objc_opt_respondsToSelector();
  uint64_t v4 = objc_msgSend((id)objc_msgSend(v2, "captureStreamSettings"), "captureFlags");
  unint64_t v5 = 0;
  unsigned __int8 v59 = v3;
  id v6 = 0;
  if (v4 & 0x200000000) != 0 && (v3)
  {
    uint64_t v7 = objc_msgSend((id)objc_msgSend(v2, "inputBuffers"), "indexOfObjectPassingTest:", &__block_literal_global_111);
    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    {
      LODWORD(cf) = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      unint64_t v5 = 0;
      id v6 = 0;
    }
    else
    {
      uint64_t v9 = objc_msgSend((id)objc_msgSend(v2, "inputBuffers"), "objectAtIndexedSubscript:", v7);
      id v6 = (id)objc_msgSend((id)objc_msgSend(v9, "metadata"), "mutableCopy");
      unint64_t v5 = psn_pixelBufferDimensions((__CVBuffer *)[v9 buffer]);
    }
  }
  uint64_t v57 = v5;
  if ((objc_msgSend((id)objc_msgSend(v2, "captureStreamSettings", v49, v52), "captureFlags") & 4) != 0)
  {
    uint64_t AttachedMedia = BWSampleBufferAttachmentsGetAttachedMedia((void *)[v2 evZeroReferenceFrameAttachments], 0x1EFA4EB60);
    if (objc_msgSend((id)objc_msgSend(v2, "captureSettings"), "downgradedDeepFusionEnhancedResolutionCapture"))
    {
      if (([v2 processInferenceInputImage] & 1) == 0) {
        goto LABEL_16;
      }
LABEL_13:
      uint64_t v11 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 176), "delegate"), "processorController:newOutputPixelBufferForProcessorInput:type:", a1, v2, 19);
      if (v11)
      {
        uint64_t v12 = (__CVBuffer *)v11;
        objc_msgSend((id)objc_msgSend(*(id *)(a1 + 176), "output"), "setGainMapOutputPixelBuffer:", v11);
        CVPixelBufferRelease(v12);
        [*(id *)(a1 + 176) output];
        if (objc_opt_respondsToSelector()) {
          objc_msgSend((id)objc_msgSend(*(id *)(a1 + 176), "output"), "setGainMapOutputMetadata:", objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary"));
        }
      }
      goto LABEL_16;
    }
    if (!AttachedMedia) {
      goto LABEL_13;
    }
  }
LABEL_16:
  v58 = v6;
  -[BWDeepFusionProcessorController _propagateMetadataIfNeeded]((id *)a1);
  if (*(int *)(a1 + 80) >= 3) {
    [v2 releaseInputPixelBuffers];
  }
  objc_msgSend(*(id *)(a1 + 176), "setErr:", objc_msgSend(*(id *)(a1 + 88), "process"));
  if (dword_1E96B6828)
  {
    LODWORD(cf) = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    uint64_t v13 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  id v14 = (id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 176), "output", v50, v53), "metadata");
  if ([*(id *)(a1 + 176) err]) {
    goto LABEL_61;
  }
  objc_msgSend(*(id *)(a1 + 176), "setErr:", objc_msgSend(*(id *)(a1 + 88), "finishProcessing"));
  if ([*(id *)(a1 + 176) err]) {
    goto LABEL_61;
  }
  uint64_t v15 = (__CVBuffer *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 176), "output"), "buffer");
  if (v2) {
    [v2 evZeroReferenceFramePTS];
  }
  else {
    memset(v66, 0, sizeof(v66));
  }
  objc_msgSend(*(id *)(a1 + 176), "setErr:", BWSampleBufferCreateFromPixelBuffer(v15, (uint64_t)v66, (CFTypeRef *)(a1 + 112), (CMSampleBufferRef *)&target));
  if ([*(id *)(a1 + 176) err]) {
    goto LABEL_61;
  }
  CMSetAttachments(target, (CFDictionaryRef)[v2 evZeroReferenceFrameAttachments], 1u);
  CMSetAttachment(target, @"HasUnreliableBracketingMetadata", MEMORY[0x1E4F1CC38], 1u);
  CFStringRef v16 = (const __CFString *)*MEMORY[0x1E4F53070];
  int v17 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  [v17 addEntriesFromDictionary:v14];
  int v18 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 176), "output"), "fusionMode");
  if (v18 == 2) {
    uint64_t v19 = 2;
  }
  else {
    uint64_t v19 = v18 == 1;
  }
  uint64_t v20 = [NSNumber numberWithInt:v19];
  [v17 setObject:v20 forKeyedSubscript:*MEMORY[0x1E4F53300]];
  FigCaptureMetadataUtilitiesCopyZoomRelatedMetadata(v14, v17);
  uint64_t v21 = (const void *)BWSampleBufferGetAttachedMedia(target, 0x1EFA4EB60);
  if (v21)
  {
    uint64_t v22 = (void *)CMGetAttachment(v21, v16, 0);
    if (v22) {
      FigCaptureMetadataUtilitiesCopyZoomRelatedMetadata(v14, v22);
    }
  }
  [v17 setObject:&unk_1EFB01850 forKeyedSubscript:@"CompositeImage"];
  -[BWDeepFusionProcessorController _propagateGainMapToOutputSampleBufferIfNeeded:](a1, (void *)target);
  -[BWDeepFusionProcessorController _propagateDemosaicedRawPixelBufferToOutputSampleBufferIfNeeded:](a1, (void *)target);
  -[BWDeepFusionProcessorController _propagateSmartStyleLinearInputBufferToOutputSampleBufferIfNeeded:](a1, (opaqueCMSampleBuffer *)target);
  if ((int)[*(id *)(a1 + 56) stillImageFusionScheme] <= 4)
  {
    CFStringRef v55 = v16;
    id v56 = v14;
    uint64_t v23 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 176), "delegate"), "processorController:newInferencesForProcessorInput:", a1, objc_msgSend(*(id *)(a1 + 176), "input"));
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    v24 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 176), "input"), "providedInferenceAttachedMedia");
    uint64_t v25 = [v24 countByEnumeratingWithState:&v62 objects:v72 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v63;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v63 != v27) {
            objc_enumerationMutation(v24);
          }
          BWPropagateInferenceAttachedMedia(v23, *(void **)(*((void *)&v62 + 1) + 8 * i), (CFTypeRef *)(a1 + 152), (opaqueCMSampleBuffer *)target);
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v62 objects:v72 count:16];
      }
      while (v26);
    }
    uint64_t v29 = [v23 inferenceForAttachmentKey:0x1EFA6A380];
    uint64_t v30 = [v23 inferenceForAttachmentKey:0x1EFA6A3A0];
    if (v29)
    {
      uint64_t v31 = v30;
      if (v30)
      {
        id v32 = (id)objc_msgSend((id)CMGetAttachment(target, @"Inferences", 0), "mutableCopy");
        if (!v32) {
          id v32 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        }
        if (![v32 objectForKeyedSubscript:&unk_1EFB01868])
        {
          v70[0] = 0x1EFA6A380;
          v70[1] = 0x1EFA6A3A0;
          v71[0] = v29;
          v71[1] = v31;
          uint64_t v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v71 forKeys:v70 count:2];
          uint64_t v34 = [BWInferenceResult alloc];
          CMSampleBufferGetPresentationTimeStamp(&v61, (CMSampleBufferRef)target);
          objc_msgSend(v32, "setObject:forKeyedSubscript:", -[BWInferenceResult initWithInferenceType:inferences:atTimestamp:](v34, "initWithInferenceType:inferences:atTimestamp:", 104, v33, &v61), &unk_1EFB01868);
          CMSetAttachment(target, @"Inferences", v32, 1u);
        }
      }
    }

    CFStringRef v16 = v55;
    id v14 = v56;
  }
  if ((((objc_msgSend((id)objc_msgSend(v2, "captureStreamSettings"), "captureFlags") & 0x200000000) != 0) & v59) != 1) {
    goto LABEL_58;
  }
  if (!objc_msgSend((id)objc_msgSend(*(id *)(a1 + 176), "output"), "quadraForEnhancedResOutputPixelBuffer"))
  {
    LODWORD(cf) = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v44 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v44, type);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
LABEL_58:
    if (objc_msgSend((id)objc_msgSend(v2, "captureSettings", v51, v54), "downgradedDeepFusionEnhancedResolutionCapture"))
    {
      int v45 = objc_msgSend((id)CMGetAttachment(target, @"StillImageProcessingFlags", 0), "unsignedIntValue");
      CMSetAttachment(target, @"StillImageProcessingFlags", (CFTypeRef)[NSNumber numberWithUnsignedInt:v45 | 0x40000u], 1u);
    }
    uint64_t v46 = (void *)[*(id *)(a1 + 176) delegate];
    objc_msgSend(v46, "processorController:didFinishProcessingSampleBuffer:type:processorInput:err:", a1, target, 13, objc_msgSend(*(id *)(a1 + 176), "input"), objc_msgSend(*(id *)(a1 + 176), "err"));
    goto LABEL_61;
  }
  CMAttachmentBearerRef cf = 0;
  memset(&v69, 0, sizeof(v69));
  CMTimeMakeFromDictionary(&v69, (CFDictionaryRef)[v17 objectForKeyedSubscript:*MEMORY[0x1E4F530C0]]);
  uint64_t v35 = (__CVBuffer *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 176), "output"), "quadraForEnhancedResOutputPixelBuffer");
  long long v73 = *(_OWORD *)&v69.value;
  v74[0] = *(CGFloat *)&v69.epoch;
  objc_msgSend(*(id *)(a1 + 176), "setErr:", BWSampleBufferCreateFromPixelBuffer(v35, (uint64_t)&v73, (CFTypeRef *)(a1 + 120), (CMSampleBufferRef *)&cf));
  if (![*(id *)(a1 + 176) err])
  {
    uint64_t v36 = *MEMORY[0x1E4F53538];
    long long v37 = (void *)[v58 objectForKeyedSubscript:*MEMORY[0x1E4F53538]];
    if (!v37)
    {
      long long v37 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
      [v58 setObject:v37 forKeyedSubscript:v36];
    }
    objc_msgSend(v37, "addEntriesFromDictionary:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 176), "output"), "quadraForEnhancedResOutputMetadata"));
    CMSetAttachment(cf, v16, v58, 1u);
    unint64_t v38 = psn_pixelBufferDimensions((__CVBuffer *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 176), "output"), "quadraForEnhancedResOutputPixelBuffer"));
    uint64_t v39 = (double *)MEMORY[0x1E4F1DB20];
    long long v40 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
    long long v73 = *MEMORY[0x1E4F1DB20];
    *(_OWORD *)v74 = v40;
    if (FigCFDictionaryGetCGRectIfPresent())
    {
      *(void *)&long long v73 = FigCaptureUpdateRectSizeAndMaintainCenter(*(CGFloat *)&v73, *((CGFloat *)&v73 + 1), v74[0], v74[1], (double)(int)v38);
      *((void *)&v73 + 1) = v41;
      v74[0] = v42;
      v74[1] = v43;
      FigCFDictionarySetCGRect();
    }
    FigCaptureMetadataUtilitiesUpdateMetadataForStillImageCrop(v58, v57, v38, *(CGFloat *)&v73, *((CGFloat *)&v73 + 1), v74[0], v74[1], *v39, v39[1], v39[2], v39[3]);
    BWSampleBufferSetAttachedMedia(target, 0x1EFA6A660, (uint64_t)cf);
    if (cf) {
      CFRelease(cf);
    }
    goto LABEL_58;
  }
LABEL_61:
  if ([*(id *)(a1 + 176) err])
  {
    if ([*(id *)(a1 + 176) err] == -2) {
      [*(id *)(a1 + 176) setErr:4294950469];
    }
    if ([*(id *)(a1 + 176) err]) {
      uint64_t v47 = 14;
    }
    else {
      uint64_t v47 = 13;
    }
    uint64_t v48 = (void *)[*(id *)(a1 + 176) delegate];
    objc_msgSend(v48, "processorController:didFinishProcessingSampleBuffer:type:processorInput:err:", a1, target, v47, objc_msgSend(*(id *)(a1 + 176), "input"), objc_msgSend(*(id *)(a1 + 176), "err"));
  }
  if (target) {
    CFRelease(target);
  }
}

BOOL __43__BWDeepFusionProcessorController__process__block_invoke(uint64_t a1, void *a2)
{
  return [a2 type] == 25;
}

- (id)_propagateMetadataIfNeeded
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = (void *)[result[22] input];
    uint64_t v3 = objc_msgSend((id)objc_msgSend(v2, "inputBuffers"), "indexOfObjectPassingTest:", &__block_literal_global_308);
    uint64_t v4 = (void *)[v2 inputBuffers];
    if (v3 == 0x7FFFFFFFFFFFFFFFLL)
    {
      result = (id *)[v4 indexOfObjectPassingTest:&__block_literal_global_310];
      if (result == (id *)0x7FFFFFFFFFFFFFFFLL) {
        return result;
      }
      result = (id *)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v2, "inputBuffers"), "objectAtIndexedSubscript:", result), "metadata"), "objectForKeyedSubscript:", @"ReferenceMetadata");
    }
    else
    {
      result = (id *)objc_msgSend((id)objc_msgSend(v4, "objectAtIndexedSubscript:", v3), "metadata");
    }
    unint64_t v5 = result;
    if (result)
    {
      FigCaptureMetadataUtilitiesCopyZoomRelatedMetadata(result, objc_msgSend((id)objc_msgSend(v1[22], "output"), "metadata"));
      if (objc_msgSend((id)objc_msgSend(v1[22], "input"), "processSmartStyleRenderingInput")) {
        BWCopyLTMMetadata(v5, objc_msgSend((id)objc_msgSend(v1[22], "output"), "metadata"));
      }
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(v1[22], "output"), "metadata"), "setObject:forKeyedSubscript:", objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E4F53398]), *MEMORY[0x1E4F53398]);
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(v1[22], "output"), "metadata"), "setObject:forKeyedSubscript:", objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E4F53390]), *MEMORY[0x1E4F53390]);
      uint64_t v6 = *MEMORY[0x1E4F532A0];
      if ([v5 objectForKey:*MEMORY[0x1E4F532A0]])
      {
        uint64_t v7 = v5;
      }
      else
      {
        result = (id *)objc_msgSend((id)objc_msgSend(v2, "inputBuffers"), "indexOfObjectPassingTest:", &__block_literal_global_315_0);
        if (result == (id *)0x7FFFFFFFFFFFFFFFLL) {
          return result;
        }
        uint64_t v7 = (id *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v2, "inputBuffers"), "objectAtIndexedSubscript:", result), "metadata");
      }
      uint64_t v8 = [v7 objectForKeyedSubscript:v6];
      uint64_t v9 = objc_msgSend((id)objc_msgSend(v1[22], "output"), "metadata");
      return (id *)[v9 setObject:v8 forKeyedSubscript:v6];
    }
  }
  return result;
}

- (uint64_t)_propagateGainMapToOutputSampleBufferIfNeeded:(uint64_t)result
{
  if (!result) {
    return result;
  }
  uint64_t v3 = result;
  uint64_t v4 = (void *)[*(id *)(result + 176) input];
  unint64_t v5 = (void *)[*(id *)(v3 + 176) output];
  if ([v5 gainMapOutputPixelBuffer])
  {
    uint64_t v6 = (__CVBuffer *)[v5 gainMapOutputPixelBuffer];
    result = objc_opt_respondsToSelector();
    if (result)
    {
      result = [v5 gainMapOutputMetadata];
      uint64_t v7 = (void *)result;
      if (!v6) {
        return result;
      }
      goto LABEL_10;
    }
  }
  else
  {
    result = BWSampleBufferGetAttachedMedia(a2, 0x1EFA4EB60);
    if (result) {
      return result;
    }
    result = objc_msgSend((id)objc_msgSend(v4, "inputBuffers"), "indexOfObjectPassingTest:", &__block_literal_global_318);
    if (result == 0x7FFFFFFFFFFFFFFFLL) {
      return result;
    }
    result = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "inputBuffers"), "objectAtIndexedSubscript:", result), "buffer");
    uint64_t v6 = (__CVBuffer *)result;
  }
  uint64_t v7 = 0;
  if (!v6) {
    return result;
  }
LABEL_10:
  if (!v7) {
    uint64_t v7 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  }
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithInt:", -[FigCaptureCameraParameters gainMapVersion](+[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance"), "gainMapVersion"));
  [v7 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F53318]];
  uint64_t v9 = NSNumber;
  [*(id *)(v3 + 56) gainMapMainImageDownscalingFactor];
  uint64_t v10 = objc_msgSend(v9, "numberWithFloat:");
  [v7 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F533D0]];
  return BWSampleBufferSetAttachedMediaFromPixelBuffer((opaqueCMSampleBuffer *)a2, 0x1EFA4EB60, v6, (CFTypeRef *)(v3 + 160), (uint64_t)v7, 0, 1);
}

- (void)_propagateDemosaicedRawPixelBufferToOutputSampleBufferIfNeeded:(uint64_t)a1
{
  if (a1)
  {
    CMAttachmentBearerRef target = 0;
    uint64_t v4 = (__CVBuffer *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 176), "output"), "linearOutputPixelBuffer");
    unint64_t v5 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 176), "output"), "linearOutputMetadata");
    if (!objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 176), "input"), "processingSettings"), "provideDemosaicedRaw")|| (!objc_msgSend(*(id *)(a1 + 176), "demosaicedRawErr") ? (BOOL v6 = v4 == 0) : (BOOL v6 = 1), v6))
    {
      uint64_t v9 = 0;
LABEL_18:

      if (target) {
        CFRelease(target);
      }
      return;
    }
    CFStringRef v7 = (const __CFString *)*MEMORY[0x1E4F53070];
    uint64_t v8 = (void *)CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E4F53070], 0);
    uint64_t v9 = (void *)[v8 mutableCopy];
    if ([v5 count]) {
      [v9 addEntriesFromDictionary:v5];
    }
    if (BWCMSampleBufferCreateCopyWithNewPixelBuffer((opaqueCMSampleBuffer *)a2, v4, (CFTypeRef *)(a1 + 136), (CMSampleBufferRef *)&target))goto LABEL_18; {
    int v10 = objc_msgSend((id)CMGetAttachment(target, @"StillImageProcessingFlags", 0), "unsignedIntValue");
    }
    CMSetAttachment(target, @"StillImageProcessingFlags", (CFTypeRef)[NSNumber numberWithUnsignedInt:v10 | 0x10000u], 1u);
    CFTypeRef v11 = CMGetAttachment(target, @"RawDNGDictionary", 0);
    if (v11)
    {
      uint64_t v12 = (void *)v11;
      unint64_t v13 = psn_pixelBufferDimensions(v4);
      id v14 = (void *)BWCreateDNGDictionaryWithUpdatedToneCurvesIfNeeded(v12, v13, v9);
      if (!v14) {
        goto LABEL_17;
      }
    }
    else
    {
      uint64_t v15 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F54128]];
      uint64_t v16 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 56), "rawColorCalibrationsByPortType"), "objectForKeyedSubscript:", v15);
      if (!v16) {
        goto LABEL_18;
      }
      int v17 = (void *)v16;
      uint64_t v18 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 56), "sensorConfigurationsByPortType"), "objectForKeyedSubscript:", v15), "cameraInfo");
      if (!v18) {
        goto LABEL_18;
      }
      uint64_t v19 = (void *)v18;
      uint64_t PixelFormatType = CVPixelBufferGetPixelFormatType(v4);
      float v21 = (float)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 176), "input"), "settings"), "outputWidth");
      float v22 = v21
          / (float)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 176), "input"), "settings"), "outputHeight");
      unint64_t v23 = psn_pixelBufferDimensions(v4);
      id v14 = (void *)BWCreateDemosaicedRawDNGDictionary(v23, PixelFormatType, v9, v17, v19, v22);
      if (!v14) {
        goto LABEL_18;
      }
    }
    v24 = v14;
    CMSetAttachment(target, @"RawDNGDictionary", v14, 1u);

LABEL_17:
    [v9 setObject:&unk_1EFB05A38 forKeyedSubscript:*MEMORY[0x1E4F533D0]];
    CMSetAttachment(target, v7, v9, 1u);
    BWSampleBufferSetAttachedMedia(a2, 0x1EFA745E0, (uint64_t)target);
    goto LABEL_18;
  }
}

- (uint64_t)_propagateSmartStyleLinearInputBufferToOutputSampleBufferIfNeeded:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = (void *)[*(id *)(result + 176) output];
    result = objc_msgSend((id)objc_msgSend(*(id *)(v3 + 176), "input"), "processSmartStyleRenderingInput");
    if (result)
    {
      unint64_t v5 = (__CVBuffer *)[v4 linearOutputMIWBAppliedPixelBuffer];
      uint64_t v6 = [v4 linearOutputMIWBAppliedMetadata];
      return BWSampleBufferSetAttachedMediaFromPixelBuffer(a2, 0x1EFA74720, v5, (CFTypeRef *)(v3 + 144), v6, 0, 0);
    }
  }
  return result;
}

BOOL __61__BWDeepFusionProcessorController__propagateMetadataIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  return [a2 type] == 23;
}

BOOL __61__BWDeepFusionProcessorController__propagateMetadataIfNeeded__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 type] == 8;
}

BOOL __61__BWDeepFusionProcessorController__propagateMetadataIfNeeded__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)[a2 metadata];
  return [v2 objectForKey:*MEMORY[0x1E4F532A0]] != 0;
}

- (uint64_t)_processOnlyApplyingSemanticStyle
{
  cf[20] = *(CFTypeRef *)MEMORY[0x1E4F143B8];
  if (!result) {
    return result;
  }
  uint64_t v1 = result;
  cf[0] = 0;
  if (![*(id *)(result + 88) semanticStyleProperties])
  {
    uint64_t v2 = 0;
    goto LABEL_19;
  }
  uint64_t v2 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(v1 + 176), "input"), "inputBuffers"), "firstObject");
  uint64_t v3 = objc_msgSend((id)objc_msgSend(*(id *)(v1 + 176), "delegate"), "processorController:newOutputPixelBufferForProcessorInput:type:dimensions:", v1, objc_msgSend(*(id *)(v1 + 176), "input"), objc_msgSend(v2, "type"), psn_pixelBufferDimensions((__CVBuffer *)objc_msgSend(v2, "buffer")));
  if (!v3)
  {
    [*(id *)(v1 + 176) setErr:4294954510];
    goto LABEL_19;
  }
  uint64_t v4 = (__CVBuffer *)v3;
  objc_msgSend(*(id *)(v1 + 176), "setErr:", objc_msgSend(*(id *)(v1 + 88), "applySemanticStylesWithOutputBuffer:inputBuffer:inputMetadata:", v3, objc_msgSend(v2, "buffer"), objc_msgSend(v2, "metadata")));
  if (![*(id *)(v1 + 176) err]) {
    goto LABEL_11;
  }
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(v4);
  if (PixelFormatType == CVPixelBufferGetPixelFormatType((CVPixelBufferRef)[v2 buffer]))
  {
    int v16 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    CFRelease(v4);
    uint64_t v8 = (const void *)[v2 buffer];
    if (v8) {
      uint64_t v4 = (__CVBuffer *)CFRetain(v8);
    }
    else {
      uint64_t v4 = 0;
    }
LABEL_11:
    uint64_t v9 = objc_msgSend(*(id *)(v1 + 176), "input", v12, v13);
    if (v9) {
      [v9 evZeroReferenceFramePTS];
    }
    else {
      memset(v14, 0, sizeof(v14));
    }
    objc_msgSend(*(id *)(v1 + 176), "setErr:", BWSampleBufferCreateFromPixelBuffer(v4, (uint64_t)v14, (CFTypeRef *)(v1 + 112), (CMSampleBufferRef *)cf));
    int v10 = *(void **)(v1 + 176);
    if (cf[0])
    {
      if (objc_msgSend((id)objc_msgSend(v10, "input"), "evZeroReferenceFrameAttachments")) {
        CMSetAttachments(cf[0], (CFDictionaryRef)objc_msgSend((id)objc_msgSend(*(id *)(v1 + 176), "input"), "evZeroReferenceFrameAttachments"), 1u);
      }
      CFTypeRef v11 = (void *)[*(id *)(v1 + 176) delegate];
      objc_msgSend(v11, "processorController:didFinishProcessingSampleBuffer:type:processorInput:err:", v1, cf[0], 13, objc_msgSend(*(id *)(v1 + 176), "input"), objc_msgSend(*(id *)(v1 + 176), "err"));
      if (!v4) {
        goto LABEL_19;
      }
    }
    else
    {
      [v10 setErr:4294954510];
      if (!v4) {
        goto LABEL_19;
      }
    }
    goto LABEL_18;
  }
  int v16 = 0;
  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  CFStringRef v7 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  fig_log_call_emit_and_clean_up_after_send_and_compose();
LABEL_18:
  CFRelease(v4);
LABEL_19:
  if (cf[0]) {
    CFRelease(cf[0]);
  }
  result = objc_msgSend(*(id *)(v1 + 176), "err", v12, v13);
  if (result) {
    return objc_msgSend((id)objc_msgSend(*(id *)(v1 + 176), "delegate"), "processorController:didFinishProcessingSampleBuffer:type:processorInput:err:", v1, 0, objc_msgSend(v2, "type"), objc_msgSend(*(id *)(v1 + 176), "input"), objc_msgSend(*(id *)(v1 + 176), "err"));
  }
  return result;
}

BOOL __81__BWDeepFusionProcessorController__propagateGainMapToOutputSampleBufferIfNeeded___block_invoke(uint64_t a1, void *a2)
{
  return [a2 type] == 19;
}

- (void)processor:(id)a3 outputReadyWithBufferType:(int)a4 outputPixelBuffer:(__CVBuffer *)a5 outputMetadata:(id)a6 error:(int)a7
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if ((a4 & 0xFFFFFFFE) != 0xA) {
    return;
  }
  uint64_t v7 = *(void *)&a7;
  CMAttachmentBearerRef target = 0;
  if (a4 == 10)
  {
    int v16 = [(BWDeepFusionProcessorInput *)[(BWDeepFusionProcessorRequest *)self->_currentRequest input] evZeroReferenceFrameAttachments];
    memset(&v23, 0, sizeof(v23));
    int v17 = [(BWDeepFusionProcessorRequest *)self->_currentRequest input];
    if (v17)
    {
      [(BWDeepFusionProcessorInput *)v17 evZeroReferenceFramePTS];
      if (v7) {
        return;
      }
    }
    else
    {
      memset(&v23, 0, sizeof(v23));
      if (v7) {
        return;
      }
    }
    if (!v16) {
      return;
    }
    if ((v23.flags & 1) == 0) {
      return;
    }
    CMTime v24 = v23;
    if (BWSampleBufferCreateFromPixelBuffer(a5, (uint64_t)&v24, (CFTypeRef *)&self->_inferenceInputFormatDescription, (CMSampleBufferRef *)&target))return; {
    CMSetAttachments(target, (CFDictionaryRef)v16, 1u);
    }
    CFStringRef v18 = (const __CFString *)*MEMORY[0x1E4F53070];
    uint64_t v19 = objc_msgSend((id)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53070], 0), "mutableCopy");
    [v19 addEntriesFromDictionary:a6];
    CMSetAttachment(target, v18, v19, 1u);

    uint64_t v7 = 0;
    uint64_t v15 = 15;
LABEL_18:
    uint64_t v20 = [(BWDeepFusionProcessorRequest *)self->_currentRequest delegate];
    [(BWDeepFusionProcessorControllerDelegate *)v20 processorController:self didFinishProcessingSampleBuffer:target type:v15 processorInput:[(BWDeepFusionProcessorRequest *)self->_currentRequest input] err:v7];
    if (target) {
      CFRelease(target);
    }
    return;
  }
  if (a4 != 11)
  {
    uint64_t v15 = 0;
    goto LABEL_18;
  }
  NSUInteger v11 = [(NSArray *)[(BWDeepFusionProcessorInput *)[(BWDeepFusionProcessorRequest *)self->_currentRequest input] inputBuffers] indexOfObjectPassingTest:&__block_literal_global_321];
  if (v11 == 0x7FFFFFFFFFFFFFFFLL
    || (id v12 = -[NSArray objectAtIndexedSubscript:](-[BWDeepFusionProcessorInput inputBuffers](-[BWDeepFusionProcessorRequest input](self->_currentRequest, "input"), "inputBuffers"), "objectAtIndexedSubscript:", v11), ![v12 metadata]))
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    return;
  }
  memset(&v23, 0, sizeof(v23));
  uint64_t v13 = (void *)[v12 metadata];
  CMTimeMakeFromDictionary(&v23, (CFDictionaryRef)[v13 objectForKeyedSubscript:*MEMORY[0x1E4F530C0]]);
  if (v23.flags)
  {
    CMTime v24 = v23;
    if (!BWSampleBufferCreateFromPixelBuffer(a5, (uint64_t)&v24, (CFTypeRef *)&self->_inferenceInputFormatDescription, (CMSampleBufferRef *)&target))
    {
      id v14 = objc_msgSend((id)objc_msgSend(v12, "metadata"), "mutableCopy");
      [v14 addEntriesFromDictionary:a6];
      CMSetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53070], v14, 1u);

      CMSetAttachment(target, @"StillSettings", [(BWStillImageProcessorControllerInput *)[(BWDeepFusionProcessorRequest *)self->_currentRequest input] stillImageSettings], 1u);
      CMSetAttachment(target, @"StillImageCaptureFrameFlags", (CFTypeRef)objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v12, "captureFrameFlags")), 1u);
      uint64_t v7 = 0;
      uint64_t v15 = 36;
      goto LABEL_18;
    }
  }
}

BOOL __110__BWDeepFusionProcessorController_processor_outputReadyWithBufferType_outputPixelBuffer_outputMetadata_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 type] == 25;
}

- (id)processorGetInferenceResults:(id)a3 inferenceInputBufferType:(int)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = NSClassFromString(&cfstr_Deepfusioninfe.isa);
  if (a4 == 11) {
    uint64_t v7 = 36;
  }
  else {
    uint64_t v7 = 15;
  }
  uint64_t v8 = (void *)[(BWDeepFusionProcessorControllerDelegate *)[(BWDeepFusionProcessorRequest *)self->_currentRequest delegate] processorController:self newInferencesForProcessorInput:[(BWDeepFusionProcessorRequest *)self->_currentRequest input] inferenceInputBufferType:v7];
  id v9 = objc_alloc_init(v6);
  uint64_t v10 = [v8 inferenceBufferForAttachedMediaKey:@"PersonSemanticsSkin"];
  if (v10) {
    [v9 setSkinMask:v10];
  }
  uint64_t v11 = [v8 inferenceBufferForAttachedMediaKey:@"PersonSemanticsHair"];
  if (v11) {
    [v9 setHairMask:v11];
  }
  uint64_t v12 = [v8 inferenceBufferForAttachedMediaKey:0x1EFA745A0];
  if (v12) {
    [v9 setSkyMask:v12];
  }
  if ([(BWDeepFusionProcessorControllerConfiguration *)self->_configuration semanticRenderingVersion] < 4)
  {
    uint64_t v15 = [v8 inferenceBufferForAttachedMediaKey:0x1EFA6A200];
    if (v15) {
      [v9 setPersonMask:v15];
    }
  }
  else
  {
    uint64_t v13 = [v8 inferenceBufferForAttachedMediaKey:0x1EFA74420];
    if (v13)
    {
      uint64_t v14 = v13;
      if (-[BWDeepFusionProcessorControllerConfiguration semanticRenderingVersion](self->_configuration, "semanticRenderingVersion") >= 4)[v9 setHighResPersonMask:v14]; {
    }
      }
  }
  int v16 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v17 = BWInferenceLowResPersonInstanceMaskKeys();
  uint64_t v18 = [v17 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v27;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v27 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = objc_msgSend(v8, "inferenceBufferForAttachedMediaKey:", *(void *)(*((void *)&v26 + 1) + 8 * v21), (void)v26);
        if (v22) {
          [v16 addObject:v22];
        }
        ++v21;
      }
      while (v19 != v21);
      uint64_t v19 = [v17 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v19);
  }
  if (objc_msgSend(v16, "count", (void)v26))
  {
    [v9 setLowResPersonInstanceMasks:v16];
    objc_msgSend(v9, "setLowResPersonInstanceConfidences:", objc_msgSend(v8, "inferenceForAttachmentKey:", 0x1EFA6A380));
    objc_msgSend(v9, "setLowResPersonInstanceBoundingBoxes:", objc_msgSend(v8, "inferenceForAttachmentKey:", 0x1EFA6A3A0));
  }
  objc_msgSend(v9, "setSmartCameraSceneType:", objc_msgSend(-[BWStillImageCaptureSettings metadata](-[BWStillImageProcessorControllerInput captureSettings](-[BWDeepFusionProcessorRequest input](self->_currentRequest, "input"), "captureSettings"), "metadata"), "semanticStyleSceneTypeAsSmartCameraSceneType"));
  uint64_t v23 = [v8 inferenceForAttachmentKey:0x1EFA6A1A0];
  if (v23) {
    [v9 setSkinToneClassificationsForFaces:v23];
  }
  uint64_t v24 = [v8 inferenceForAttachmentKey:0x1EFA6A0A0];
  if (v24) {
    [v9 setFaceLandmarks:v24];
  }

  return v9;
}

- (void)processor:(id)a3 didSelectFusionMode:(int)a4
{
  if (a4 == 2) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = a4 == 1;
  }
  uint64_t v6 = [(BWDeepFusionProcessorRequest *)self->_currentRequest delegate];
  uint64_t v7 = [(BWDeepFusionProcessorRequest *)self->_currentRequest input];
  [(BWDeepFusionProcessorControllerDelegate *)v6 processorController:self didSelectFusionMode:v5 processorInput:v7];
}

@end