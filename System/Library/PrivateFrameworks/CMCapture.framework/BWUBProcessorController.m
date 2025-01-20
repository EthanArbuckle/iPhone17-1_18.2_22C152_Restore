@interface BWUBProcessorController
+ (BOOL)lazilyAllocatesDeepFusionOutputBuffers;
+ (void)initialize;
- (BOOL)finishProcessingCurrentInputNow;
- (BWUBProcessorController)initWithConfiguration:(id)a3;
- (CMAttachmentBearerRef)_newOutputSampleBufferWithSampleBuffer:(__CVBuffer *)a3 pixelBuffer:(CFTypeRef *)a4 formatDescriptionInOut:(uint64_t)a5 metadataToMerge:;
- (id)adaptiveBracketingDigitalFlashTotalIntegrationTimesProviderForPortType:(id)a3;
- (id)adaptiveBracketingParametersForDigitalFlashMode:(int)a3 frameStatistics:(id)a4 stationary:(BOOL)a5 sphereOffsetEnabled:(BOOL)a6 detectedObjects:(id)a7;
- (id)processorGetInferenceResults:(id)a3;
- (int)enqueueInputForProcessing:(id)a3 delegate:(id)a4 processErrorRecoveryFrame:(BOOL)a5 processOriginalImage:(BOOL)a6 processToneMapping:(BOOL)a7 processInferenceInputImage:(BOOL)a8 clientBracketSequenceNumber:(int)a9 processSemanticRendering:(BOOL)a10 provideInferenceInputImageForProcessing:(BOOL)a11 processSmartStyleRenderingInput:(BOOL)a12 inferencesAvailable:(BOOL)a13;
- (int)progressiveLowLightFusionBatchSize;
- (uint64_t)_loadSetupAndPrepareUBProcessor;
- (uint64_t)_processUBOriginalImage;
- (uint64_t)_setupProcessorForProcessingType:(uint64_t)a1;
- (uint64_t)_singleImageProcessSampleBuffer:(CMAttachmentBearerRef *)a3 sampleBufferOut:;
- (uint64_t)_updateStateIfNeeded;
- (unint64_t)_setupProcessor;
- (unint64_t)type;
- (void)_processDeepFusion;
- (void)_processSingleImage;
- (void)_processUBFusion;
- (void)_serviceNextRequest;
- (void)cancelProcessing;
- (void)dealloc;
- (void)input:(id)a3 addFrame:(opaqueCMSampleBuffer *)a4 isReferenceFrame:(BOOL)a5;
- (void)inputReceivedAllFrames:(id)a3;
- (void)processor:(id)a3 didCompleteProcessingForSurfaceID:(unsigned int)a4;
- (void)processor:(id)a3 didEnqueueProcessingForSurfaceID:(unsigned int)a4;
- (void)processor:(id)a3 didSelectFusionMode:(int)a4;
- (void)processor:(id)a3 outputReadyWithFrameType:(int)a4 outputPixelBuffer:(__CVBuffer *)a5 outputMetadata:(id)a6 error:(int)a7;
@end

@implementation BWUBProcessorController

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (BWUBProcessorController)initWithConfiguration:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)BWUBProcessorController;
  v4 = [(BWUBProcessorController *)&v7 init];
  if (v4)
  {
    v4->_configuration = (BWUBProcessorControllerConfiguration *)a3;
    v4->_requestQueue = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v5 = [[FigStateMachine alloc] initWithLabel:@"BWUBProcessorController state machine" stateCount:8 initialState:1 owner:v4];
    [(FigStateMachine *)v5 setPerformsAtomicStateTransitions:0];
    [(FigStateMachine *)v5 setLabel:@"Idle" forState:1];
    [(FigStateMachine *)v5 setLabel:@"Ready" forState:2];
    [(FigStateMachine *)v5 setLabel:@"WaitingForFrames" forState:4];
    [(FigStateMachine *)v5 setLabel:@"ProcessingSingleImage" forState:8];
    [(FigStateMachine *)v5 setLabel:@"ProcessingUBOriginalImage" forState:16];
    [(FigStateMachine *)v5 setLabel:@"ProcessingUBFusion" forState:32];
    [(FigStateMachine *)v5 setLabel:@"ProcessingUBLowLightFusion" forState:64];
    [(FigStateMachine *)v5 setLabel:@"ProcessingUBDeepFusion" forState:128];
    [(FigStateMachine *)v5 whenTransitioningToStates:1 callHandler:&__block_literal_global_46];
    [(FigStateMachine *)v5 whenTransitioningToStates:2 callHandler:&__block_literal_global_592];
    [(FigStateMachine *)v5 whenTransitioningToState:4 callHandler:&__block_literal_global_594];
    [(FigStateMachine *)v5 whenTransitioningToState:8 callHandler:&__block_literal_global_596];
    [(FigStateMachine *)v5 whenTransitioningToState:16 callHandler:&__block_literal_global_598];
    [(FigStateMachine *)v5 whenTransitioningToState:32 callHandler:&__block_literal_global_600];
    [(FigStateMachine *)v5 whenTransitioningToState:64 callHandler:&__block_literal_global_602];
    [(FigStateMachine *)v5 whenTransitioningToState:128 callHandler:&__block_literal_global_604];
    v4->_stateMachine = v5;
    if (-[BWUBProcessorController _loadSetupAndPrepareUBProcessor]((uint64_t)v4))
    {

      return 0;
    }
  }
  return v4;
}

- (uint64_t)_loadSetupAndPrepareUBProcessor
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v2 = a1;
  if (*(void *)(a1 + 80)) {
    return 0;
  }
  v3 = &OBJC_IVAR___FigCaptureSessionParsedConfiguration__parsedDepthDataSinkConfigurations;
  if (!objc_msgSend((id)objc_msgSend(*(id *)(a1 + 56), "sensorConfigurationsByPortType"), "count")
    || ![*(id *)(v2 + 56) inputFormat]
    || ![*(id *)(v2 + 56) outputFormat])
  {
    goto LABEL_42;
  }
  v31 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  v4 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  v5 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  v34 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  [v4 setObject:v5 forKeyedSubscript:@"DefaultSensorIDs"];
  v33 = (void *)[MEMORY[0x1E4F1CA80] set];
  v35 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = (id)[*(id *)(v2 + 56) sensorConfigurationsByPortType];
  uint64_t v6 = [obj countByEnumeratingWithState:&v37 objects:v43 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v38 != v8) {
          objc_enumerationMutation(obj);
        }
        v10 = v3;
        uint64_t v11 = v3[1023];
        uint64_t v12 = v2;
        v13 = objc_msgSend((id)objc_msgSend(*(id *)(v2 + v11), "sensorConfigurationsByPortType"), "objectForKeyedSubscript:", *(void *)(*((void *)&v37 + 1) + 8 * i));
        objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(v13, "sensorIDString"), objc_msgSend(v13, "portType"));
        v14 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
        uint64_t v15 = objc_msgSend((id)objc_msgSend(v13, "sensorIDDictionary"), "objectForKeyedSubscript:", @"UBParameters");
        if (v15) {
          [v14 setObject:v15 forKeyedSubscript:@"UBParameters"];
        }
        uint64_t v16 = objc_msgSend((id)objc_msgSend(v13, "sensorIDDictionary"), "objectForKeyedSubscript:", @"ChromaticDefringing");
        if (v16) {
          [v14 setObject:v16 forKeyedSubscript:@"ChromaticDefringing"];
        }
        uint64_t v41 = [v13 sensorIDString];
        v42 = v14;
        objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1), objc_msgSend(v13, "portType"));
        objc_msgSend(v34, "setObject:forKeyedSubscript:", objc_msgSend(v13, "cameraInfo"), objc_msgSend(v13, "portType"));
        objc_msgSend(v33, "addObject:", objc_msgSend(v13, "portType"));
        objc_msgSend(v35, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v13, "sensorIDDictionary"), "objectForKeyedSubscript:", @"UBCaptureParameters"), "objectForKeyedSubscript:", @"AdaptiveBracketingParameters"), objc_msgSend(v13, "portType"));
        uint64_t v2 = v12;
        v3 = v10;
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v37 objects:v43 count:16];
    }
    while (v7);
  }
  if (![v4 count])
  {
    uint64_t v30 = v1;
    LODWORD(v29) = 0;
    FigDebugAssert3();
  }
  objc_msgSend(v31, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E4F535B0], v29, v30);
  if ([v34 count]) {
    [v31 setObject:v34 forKeyedSubscript:*MEMORY[0x1E4F53560]];
  }
  *(void *)(v2 + 64) = [objc_alloc(MEMORY[0x1E4F1CAD0]) initWithSet:v33];
  *(void *)(v2 + 120) = [objc_alloc(MEMORY[0x1E4F1C9E8]) initWithDictionary:v35];
  v17 = (void *)[MEMORY[0x1E4F28B50] bundleWithPath:@"/System/Library/VideoProcessors/UB.bundle"];
  if (!v17)
  {
LABEL_42:
    FigDebugAssert3();
    return 0;
  }
  v18 = v17;
  uint64_t v36 = 0;
  if (![v17 loadAndReturnError:&v36]) {
    goto LABEL_41;
  }
  uint64_t v19 = [v18 classNamed:@"UBFusionOutput"];
  *(void *)(v2 + 96) = v19;
  if (!v19) {
    goto LABEL_41;
  }
  uint64_t v20 = [v18 classNamed:@"UBDeepFusionOutput"];
  *(void *)(v2 + 128) = v20;
  if (!v20) {
    goto LABEL_41;
  }
  uint64_t v21 = [v18 classNamed:@"UBProgressiveBracketingStatistics"];
  *(void *)(v2 + 104) = v21;
  if (!v21) {
    goto LABEL_41;
  }
  uint64_t v22 = [v18 classNamed:@"UBProgressiveBracketingParameters"];
  *(void *)(v2 + 112) = v22;
  if (!v22) {
    goto LABEL_41;
  }
  uint64_t v23 = objc_msgSend(objc_alloc((Class)objc_msgSend(v18, "classNamed:", @"UBProcessor")), "initWithCommandQueue:", objc_msgSend(*(id *)(v2 + v3[1023]), "metalCommandQueue"));
  *(void *)(v2 + 80) = v23;
  if (!v23) {
    goto LABEL_41;
  }
  id v24 = objc_alloc_init((Class)[v18 classNamed:@"UBPrepareDescriptor"]);
  *(void *)(v2 + 88) = v24;
  if (!v24) {
    goto LABEL_41;
  }
  objc_msgSend(*(id *)(v2 + 88), "setWidth:", objc_msgSend((id)objc_msgSend(*(id *)(v2 + v3[1023]), "inputFormat"), "width"));
  objc_msgSend(*(id *)(v2 + 88), "setHeight:", objc_msgSend((id)objc_msgSend(*(id *)(v2 + v3[1023]), "inputFormat"), "height"));
  objc_msgSend(*(id *)(v2 + 88), "setPixelFormat:", objc_msgSend((id)objc_msgSend(*(id *)(v2 + v3[1023]), "inputFormat"), "pixelFormat"));
  objc_msgSend(*(id *)(v2 + 88), "setAllowModifyingInputBuffers:", objc_msgSend(*(id *)(v2 + v3[1023]), "alwaysAllowModifyingInputBuffers"));
  v25 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  [v25 setObject:*(void *)(v2 + 88) forKeyedSubscript:&unk_1EFAFF2B8];
  if ([*(id *)(v2 + v3[1023]) fusionEnabled]) {
    [v25 setObject:*(void *)(v2 + 88) forKeyedSubscript:&unk_1EFAFF2D0];
  }
  if ([*(id *)(v2 + v3[1023]) lowLightFusionEnabled]) {
    [v25 setObject:*(void *)(v2 + 88) forKeyedSubscript:&unk_1EFAFF2E8];
  }
  if ([*(id *)(v2 + v3[1023]) deepFusionEnabled])
  {
    id v26 = objc_alloc_init((Class)[v18 classNamed:@"UBPrepareDescriptor"]);
    *(void *)(v2 + 136) = v26;
    if (v26)
    {
      objc_msgSend(*(id *)(v2 + 136), "setWidth:", objc_msgSend((id)objc_msgSend(*(id *)(v2 + v3[1023]), "inputFormat"), "width"));
      objc_msgSend(*(id *)(v2 + 136), "setHeight:", objc_msgSend((id)objc_msgSend(*(id *)(v2 + v3[1023]), "inputFormat"), "height"));
      objc_msgSend(*(id *)(v2 + 136), "setPixelFormat:", objc_msgSend((id)objc_msgSend(*(id *)(v2 + v3[1023]), "inputFormat"), "pixelFormat"));
      objc_msgSend(*(id *)(v2 + 136), "setAllowModifyingInputBuffers:", objc_msgSend(*(id *)(v2 + v3[1023]), "alwaysAllowModifyingInputBuffers"));
      [v25 setObject:*(void *)(v2 + 136) forKeyedSubscript:&unk_1EFAFF300];
      goto LABEL_36;
    }
LABEL_41:
    uint64_t v27 = 4294954510;
LABEL_39:

    *(void *)(v2 + 80) = 0;
    *(void *)(v2 + 88) = 0;

    *(void *)(v2 + 136) = 0;
    return v27;
  }
LABEL_36:
  [v31 setObject:v25 forKeyedSubscript:*MEMORY[0x1E4F55C90]];
  if ([*(id *)(v2 + v3[1023]) depthDataDeliveryEnabled]) {
    [v31 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F55C88]];
  }
  uint64_t v27 = [*(id *)(v2 + 80) setupWithOptions:v31];
  if (v27) {
    goto LABEL_39;
  }
  return v27;
}

- (void)dealloc
{
  [(UBProcessor *)self->_ubProcessor finishProcessing];
  [(UBProcessor *)self->_ubProcessor setOutput:0];
  [(UBProcessor *)self->_ubProcessor resetState];

  outputFormatDescription = self->_outputFormatDescription;
  if (outputFormatDescription) {
    CFRelease(outputFormatDescription);
  }
  inferenceInputFormatDescription = self->_inferenceInputFormatDescription;
  if (inferenceInputFormatDescription) {
    CFRelease(inferenceInputFormatDescription);
  }
  gainMapFormatDescription = self->_gainMapFormatDescription;
  if (gainMapFormatDescription) {
    CFRelease(gainMapFormatDescription);
  }

  v6.receiver = self;
  v6.super_class = (Class)BWUBProcessorController;
  [(BWStillImageProcessorController *)&v6 dealloc];
}

- (unint64_t)type
{
  return 1;
}

+ (BOOL)lazilyAllocatesDeepFusionOutputBuffers
{
  return 1;
}

- (void)input:(id)a3 addFrame:(opaqueCMSampleBuffer *)a4 isReferenceFrame:(BOOL)a5
{
  BOOL v5 = a5;
  if ([(BWUBProcessorRequest *)self->_currentRequest input] == a3)
  {
    ubp_addFrame((uint64_t)self, (uint64_t)self->_currentRequest, self->_ubProcessor, a4, v5);
    -[BWUBProcessorInput updateAdaptiveBracketingFrameParametersIfNeededUsingFrame:err:]([(BWUBProcessorRequest *)self->_currentRequest input], a4, [(BWUBProcessorRequest *)self->_currentRequest err]);
  }
  -[BWUBProcessorController _updateStateIfNeeded]((uint64_t)self);
}

- (uint64_t)_updateStateIfNeeded
{
  if (!result) {
    return result;
  }
  uint64_t v1 = result;
  uint64_t v2 = *(void *)(result + 176);
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
    if (-[BWUBProcessorRequest receivedAllFrames](v2))
    {
      uint64_t v4 = 32;
      switch(-[BWUBProcessorRequest processingType](v2))
      {
        case 1u:
          goto LABEL_13;
        case 2u:
          uint64_t v4 = 64;
          break;
        case 3u:
          uint64_t v4 = 128;
          break;
        default:
          if (*(unsigned char *)(v2 + 33)) {
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

- (void)inputReceivedAllFrames:(id)a3
{
  if ([(BWUBProcessorRequest *)self->_currentRequest input] == a3)
  {
    -[BWUBProcessorController _updateStateIfNeeded]((uint64_t)self);
  }
}

- (int)enqueueInputForProcessing:(id)a3 delegate:(id)a4 processErrorRecoveryFrame:(BOOL)a5 processOriginalImage:(BOOL)a6 processToneMapping:(BOOL)a7 processInferenceInputImage:(BOOL)a8 clientBracketSequenceNumber:(int)a9 processSemanticRendering:(BOOL)a10 provideInferenceInputImageForProcessing:(BOOL)a11 processSmartStyleRenderingInput:(BOOL)a12 inferencesAvailable:(BOOL)a13
{
  BOOL v13 = a6;
  BOOL v14 = a5;
  BOOL v18 = -[NSSet containsObject:](self->_supportedPortTypes, "containsObject:", [a3 portType]);
  if (a9) {
    BOOL v19 = 1;
  }
  else {
    BOOL v19 = !v18;
  }
  if (v19 || v14 && v13) {
    return -12780;
  }
  id v21 = objc_alloc_init(self->_ubFusionOutputClass);
  if (objc_msgSend((id)objc_msgSend(a3, "captureStreamSettings"), "captureType") == 12) {
    id v22 = objc_alloc_init(self->_ubDeepFusionOutputClass);
  }
  else {
    id v22 = 0;
  }
  uint64_t v23 = -[BWUBProcessorRequest initWithInput:output:deepFusionOutput:processErrorRecoveryFrame:processOriginalImage:processSemanticRendering:provideInferenceInputImageForProcessing:inferencesAvailable:delegate:]([BWUBProcessorRequest alloc], a3, v21, v22, v14, v13, a10, a11, a13, a4);

  [(NSMutableArray *)self->_requestQueue addObject:v23];
  if ([(FigStateMachine *)self->_stateMachine currentState] == 1) {
    [(FigStateMachine *)self->_stateMachine transitionToState:2];
  }
  return 0;
}

- (BOOL)finishProcessingCurrentInputNow
{
  uint64_t v2 = self->_currentRequest;
  if (-[BWUBProcessorInput adaptiveBracketingParameters]([(BWUBProcessorRequest *)v2 input]))
  {
    -[BWUBProcessorInput stopAdaptiveBracketingNow]([(BWUBProcessorRequest *)v2 input]);
    BOOL v3 = [(BWUBProcessorRequest *)v2 err] == 0;
    if (dword_1E96B6888)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

- (void)cancelProcessing
{
  [(NSMutableArray *)self->_requestQueue removeAllObjects];
  [(BWUBProcessorRequest *)self->_currentRequest setErr:4294950490];
  -[BWUBProcessorController _serviceNextRequest](self);
  [(UBProcessor *)self->_ubProcessor setOutput:0];
  [(UBProcessor *)self->_ubProcessor resetState];
  -[BWUBProcessorController _updateStateIfNeeded]((uint64_t)self);
}

- (void)_serviceNextRequest
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = (void *)result[22];
    BOOL v3 = v2 ? (void *)v2[5] : 0;
    id v4 = (id)[v2 input];
    uint64_t v5 = [(id)v1[22] err];

    v1[22] = 0;
    [v3 processorController:v1 didFinishProcessingInput:v4 err:v5];

    result = (id)[(id)v1[21] firstObject];
    v1[22] = result;
    if (result)
    {
      [(id)v1[21] removeObjectAtIndex:0];
      objc_super v6 = (void *)[(id)v1[22] input];
      return (void *)[v6 setDelegate:v1];
    }
  }
  return result;
}

- (uint64_t)_setupProcessorForProcessingType:(uint64_t)a1
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  if (dword_1E96B6888)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  int v5 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 176), "input", v67, v68), "captureSettings"), "captureType");
  [*(id *)(a1 + 80) setOutput:0];
  [*(id *)(a1 + 80) resetState];
  objc_super v6 = (void *)[*(id *)(a1 + 176) input];
  uint64_t v7 = *(unsigned char **)(a1 + 176);
  if (v7)
  {
    CFTypeRef v74 = 0;
    if (a2 && v7[34])
    {
      uint64_t v8 = objc_msgSend((id)objc_msgSend(v7, "input"), "captureSettings");
      if (v5 == 10)
      {
        v9 = v8;
        char v10 = [v8 sceneFlags];
        char v11 = [v9 sceneFlags];
        uint64_t v12 = [v9 captureFlags] & 0x100000;
        unint64_t v13 = ((unint64_t)[v9 captureFlags] >> 22) & 1;
        if (v12) {
          LODWORD(v13) = 1;
        }
        if ((v11 & 4) != 0) {
          unsigned int v14 = 1;
        }
        else {
          unsigned int v14 = v13;
        }
        if ((v10 & 8) != 0) {
          uint64_t v15 = 1;
        }
        else {
          uint64_t v15 = v14;
        }
      }
      else
      {
        uint64_t v15 = 1;
      }
      [*(id *)(a1 + 80) setSrlEnabled:v15];
      if ([*(id *)(a1 + 176) provideInferenceInputImageForProcessing])
      {
        uint64_t v16 = *(void *)(a1 + 176);
        if (v16) {
          v17 = *(void **)(v16 + 40);
        }
        else {
          v17 = 0;
        }
        CFTypeRef v74 = (CFTypeRef)[v17 processorController:a1 newOutputPixelBufferForProcessorInput:v6 type:15];
        if (!v74)
        {
          FigDebugAssert3();
          return 4294954510;
        }
      }
      else
      {
        CFTypeRef v74 = 0;
      }
    }
  }
  else
  {
    CFTypeRef v74 = 0;
  }
  uint64_t v18 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 176), "input"), "captureStreamSettings"), "captureFlags");
  unint64_t v19 = v18;
  if (a2 != 3)
  {
    unint64_t v23 = v18;
    int v24 = 0;
    v25 = *(unsigned char **)(a1 + 176);
    if (!a2 && (v5 - 10) <= 2)
    {
      if (v25)
      {
        if (v25[32])
        {
          int v24 = 0;
          goto LABEL_61;
        }
        BOOL v52 = v25[33] != 0;
      }
      else
      {
        BOOL v52 = 0;
      }
      int v24 = !v52;
    }
LABEL_61:
    uint64_t v71 = *(void *)(a1 + 88);
    v53 = (void *)[v25 output];
    uint64_t v54 = *(void *)(a1 + 176);
    if (v54)
    {
      v55 = *(void **)(v54 + 40);
      if (v24)
      {
        int v56 = -[BWUBProcessorRequest processingType](v54);
        uint64_t v57 = 14;
        uint64_t v58 = 6;
        if (v56 != 2) {
          uint64_t v58 = 0;
        }
        if (v56 != 3) {
          uint64_t v57 = v58;
        }
        if (v56 == 1) {
          uint64_t v59 = 3;
        }
        else {
          uint64_t v59 = v57;
        }
LABEL_82:
        uint64_t v61 = [v55 processorController:a1 newOutputPixelBufferForProcessorInput:v6 type:v59];
        if (v61)
        {
          v50 = (const void *)v61;
          [v53 setPixelBuffer:v61];
          objc_msgSend(v53, "setMetadata:", objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary"));
          [v53 setInferenceInputPixelBuffer:v74];
          uint64_t v62 = [v6 fusionMode];
          if ((a2 - 1) <= 1)
          {
            if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 176), "input"), "captureSettings"), "captureFlags") & 0x800) != 0)
            {
              if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 176), "input"), "captureSettings"), "captureFlags") & 0x1000) != 0)uint64_t v62 = v62; {
              else
              }
                uint64_t v62 = 1;
            }
            if (a2 == 2)
            {
              v63 = -[BWUBProcessorInput adaptiveBracketingParameters]((void *)[*(id *)(a1 + 176) input]);
              if (v63) {
                uint64_t v64 = v63[1];
              }
              else {
                uint64_t v64 = 0;
              }
              [*(id *)(a1 + 80) setProgressiveBracketingParameters:v64];
            }
          }
          [*(id *)(a1 + 80) setFusionMode:v62];
          BOOL v65 = (objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 176), "input"), "captureSettings"), "sceneFlags") & 0x100) != 0&& objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 176), "input"), "captureSettings"), "captureType") != 2;
          [*(id *)(a1 + 80) setDoRedFaceFix:v65];
          [*(id *)(a1 + 80) setReferenceFrameHasEVMinus:(v23 >> 20) & 1];
          uint64_t v49 = [*(id *)(a1 + 176) output];
          v48 = 0;
          v47 = 0;
          uint64_t v41 = 0;
          v73 = 0;
          uint64_t v29 = 0;
          v51 = 0;
          goto LABEL_96;
        }
        goto LABEL_116;
      }
    }
    else
    {
      v55 = 0;
      uint64_t v59 = 0;
      if (v24) {
        goto LABEL_82;
      }
    }
    uint64_t v59 = -[BWUBProcessorRequest imageType](v54);
    goto LABEL_82;
  }
  uint64_t v20 = *(void *)(a1 + 136);
  id v21 = (void *)[*(id *)(a1 + 176) deepFusionOutput];
  if (!objc_msgSend((id)objc_msgSend(v6, "captureSettings"), "produceDeferredPhotoProxyImage"))
  {
    CFTypeRef cf = 0;
    goto LABEL_37;
  }
  if ([(id)objc_opt_class() lazilyAllocatesDeepFusionOutputBuffers])
  {
    uint64_t v22 = 0;
LABEL_36:
    CFTypeRef cf = (CFTypeRef)v22;
    objc_msgSend(v21, "setProxyPixelBuffer:");
    objc_msgSend(v21, "setProxyMetadata:", objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary"));
LABEL_37:
    uint64_t v71 = v20;
    if ([(id)objc_opt_class() lazilyAllocatesDeepFusionOutputBuffers])
    {
      CFTypeRef v28 = v74;
      uint64_t v29 = 0;
      uint64_t v30 = 0;
      v31 = 0;
      v32 = 0;
      v33 = 0;
LABEL_58:
      [v21 setReferencePixelBuffer:v29];
      v73 = v30;
      [v21 setReferenceNoisePixelBuffer:v30];
      objc_msgSend(v21, "setReferenceMetadata:", objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary"));
      uint64_t v41 = v31;
      [v21 setLongPixelBuffer:v31];
      v47 = v32;
      [v21 setLongNoisePixelBuffer:v32];
      objc_msgSend(v21, "setLongMetadata:", objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary"));
      v48 = v33;
      [v21 setRealLongNoisePixelBuffer:v33];
      CFTypeRef v74 = v28;
      [v21 setInferenceInputPixelBuffer:v28];
      [*(id *)(a1 + 80) setReferenceFrameHasEVMinus:(v19 >> 20) & 1];
      uint64_t v49 = [*(id *)(a1 + 176) deepFusionOutput];
      v50 = 0;
      a2 = 3;
      v51 = cf;
LABEL_96:
      [*(id *)(a1 + 80) setOutput:v49];
      uint64_t v60 = [*(id *)(a1 + 80) prepareToProcess:a2 prepareDescriptor:v71];
      if (!v60) {
        [*(id *)(a1 + 80) setDelegate:a1];
      }
      if (v50) {
        CFRelease(v50);
      }
      long long v38 = v73;
      v32 = v47;
      goto LABEL_101;
    }
    uint64_t v34 = *(void *)(a1 + 176);
    if (v34) {
      v35 = *(void **)(v34 + 40);
    }
    else {
      v35 = 0;
    }
    uint64_t v69 = [v35 processorController:a1 newOutputPixelBufferForProcessorInput:v6 type:8];
    if (v69)
    {
      uint64_t v36 = *(void *)(a1 + 176);
      if (v36) {
        long long v37 = *(void **)(v36 + 40);
      }
      else {
        long long v37 = 0;
      }
      long long v38 = (const void *)[v37 processorController:a1 newOutputPixelBufferForProcessorInput:v6 type:9];
      if (v38)
      {
        uint64_t v39 = *(void *)(a1 + 176);
        if (v39) {
          long long v40 = *(void **)(v39 + 40);
        }
        else {
          long long v40 = 0;
        }
        uint64_t v41 = (const void *)[v40 processorController:a1 newOutputPixelBufferForProcessorInput:v6 type:10];
        if (v41)
        {
          v72 = v38;
          uint64_t v42 = *(void *)(a1 + 176);
          if (v42) {
            v43 = *(void **)(v42 + 40);
          }
          else {
            v43 = 0;
          }
          v32 = (const void *)[v43 processorController:a1 newOutputPixelBufferForProcessorInput:v6 type:11];
          if (v32)
          {
            if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 176), "input"), "captureSettings"), "captureFlags") & 0x400000) == 0)
            {
              CFTypeRef v28 = v74;
              v33 = 0;
LABEL_57:
              uint64_t v29 = (const void *)v69;
              uint64_t v30 = v72;
              v31 = v41;
              goto LABEL_58;
            }
            uint64_t v44 = *(void *)(a1 + 176);
            if (v44) {
              v45 = *(void **)(v44 + 40);
            }
            else {
              v45 = 0;
            }
            uint64_t v46 = [v45 processorController:a1 newOutputPixelBufferForProcessorInput:v6 type:12];
            if (v46)
            {
              v33 = (const void *)v46;
              CFTypeRef v28 = v74;
              goto LABEL_57;
            }
          }
          FigDebugAssert3();
          v48 = 0;
          uint64_t v60 = 4294954510;
          v51 = cf;
          uint64_t v29 = (const void *)v69;
LABEL_101:
          if (v51) {
            CFRelease(v51);
          }
          if (v29) {
            CFRelease(v29);
          }
          if (v38) {
            CFRelease(v38);
          }
          if (v41) {
            CFRelease(v41);
          }
          if (v32) {
            CFRelease(v32);
          }
          if (v48) {
            CFRelease(v48);
          }
          goto LABEL_113;
        }
        FigDebugAssert3();
        v48 = 0;
        v32 = 0;
      }
      else
      {
        FigDebugAssert3();
        v48 = 0;
        v32 = 0;
        uint64_t v41 = 0;
      }
      uint64_t v60 = 4294954510;
      v51 = cf;
      uint64_t v29 = (const void *)v69;
      goto LABEL_101;
    }
    FigDebugAssert3();
    v48 = 0;
    v32 = 0;
    uint64_t v41 = 0;
    long long v38 = 0;
    uint64_t v29 = 0;
    uint64_t v60 = 4294954510;
    v51 = cf;
    goto LABEL_101;
  }
  uint64_t v26 = *(void *)(a1 + 176);
  if (v26) {
    uint64_t v27 = *(void **)(v26 + 40);
  }
  else {
    uint64_t v27 = 0;
  }
  uint64_t v22 = [v27 processorController:a1 newOutputPixelBufferForProcessorInput:v6 type:7];
  if (v22) {
    goto LABEL_36;
  }
LABEL_116:
  FigDebugAssert3();
  uint64_t v60 = 4294954510;
LABEL_113:
  if (v74) {
    CFRelease(v74);
  }
  return v60;
}

- (unint64_t)_setupProcessor
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = -[BWUBProcessorRequest processingType](*(void *)(result + 176));
    uint64_t v3 = -[BWUBProcessorController _setupProcessorForProcessingType:](v1, v2);
    if (v3)
    {
      [*(id *)(v1 + 176) setErr:v3];
      [*(id *)(v1 + 80) setOutput:0];
      uint64_t v7 = *(void **)(v1 + 80);
      return [v7 resetState];
    }
    else
    {
      for (unint64_t i = 0; ; ++i)
      {
        int v5 = (void *)[*(id *)(v1 + 176) input];
        if (v5) {
          int v5 = (void *)v5[7];
        }
        result = [v5 count];
        if (result <= i) {
          break;
        }
        objc_super v6 = (void *)[*(id *)(v1 + 176) input];
        if (v6) {
          objc_super v6 = (void *)v6[7];
        }
        ubp_addFrame(v1, *(void *)(v1 + 176), *(void **)(v1 + 80), (void *)[v6 objectAtIndexedSubscript:i], i == objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(v1 + 176), "input"), "captureStreamSettings"), "referenceFrameIndex"));
      }
    }
  }
  return result;
}

- (void)_processSingleImage
{
  if (a1)
  {
    uint64_t v2 = *(unsigned char **)(a1 + 176);
    if (v2 && v2[32])
    {
      uint64_t v3 = (opaqueCMSampleBuffer *)objc_msgSend((id)objc_msgSend(v2, "input"), "errorRecoveryFrame");
    }
    else
    {
      id v4 = (void *)[v2 input];
      if (v4) {
        id v4 = (void *)v4[7];
      }
      uint64_t v3 = (opaqueCMSampleBuffer *)[v4 firstObject];
    }
    CMAttachmentBearerRef target = 0;
    uint64_t v5 = -[BWUBProcessorController _singleImageProcessSampleBuffer:sampleBufferOut:](a1, v3, &target);
    if (target)
    {
      uint64_t v6 = *(void *)(a1 + 176);
      if (v6)
      {
        if (*(unsigned char *)(v6 + 32))
        {
          int v7 = objc_msgSend((id)CMGetAttachment(target, @"StillImageProcessingFlags", 0), "unsignedIntValue");
          CMSetAttachment(target, @"StillImageProcessingFlags", (CFTypeRef)[NSNumber numberWithUnsignedInt:v7 | 0x400u], 1u);
        }
      }
    }
    uint64_t v8 = *(void *)(a1 + 176);
    if (v8) {
      v9 = *(void **)(v8 + 40);
    }
    else {
      v9 = 0;
    }
    objc_msgSend(v9, "processorController:didFinishProcessingSampleBuffer:type:processorInput:err:", a1, target, -[BWUBProcessorRequest imageType](v8), objc_msgSend(*(id *)(a1 + 176), "input"), v5);
    if (target) {
      CFRelease(target);
    }
  }
}

- (uint64_t)_singleImageProcessSampleBuffer:(CMAttachmentBearerRef *)a3 sampleBufferOut:
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    if (a2)
    {
      uint64_t v5 = result;
      if (dword_1E96B6888)
      {
        int v13 = 0;
        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
        os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      result = objc_msgSend(*(id *)(v5 + 80), "addFrame:", a2, v9, v10);
      if (!result)
      {
        result = [*(id *)(v5 + 80) process];
        if (!result)
        {
          CMAttachmentBearerRef target = 0;
          result = BWCMSampleBufferCreateCopyWithNewPixelBuffer(a2, (__CVBuffer *)objc_msgSend((id)objc_msgSend(*(id *)(v5 + 176), "output"), "pixelBuffer"), (CFTypeRef *)(v5 + 144), (CMSampleBufferRef *)&target);
          if (!result)
          {
            CFStringRef v7 = (const __CFString *)*MEMORY[0x1E4F53070];
            uint64_t v8 = objc_msgSend((id)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53070], 0), "mutableCopy");
            objc_msgSend(v8, "addEntriesFromDictionary:", objc_msgSend((id)objc_msgSend(*(id *)(v5 + 176), "output"), "metadata"));
            CMSetAttachment(target, v7, v8, 1u);

            result = 0;
            if (a3) {
              *a3 = target;
            }
          }
        }
      }
    }
    else
    {
      return 4294954516;
    }
  }
  return result;
}

- (void)_processUBFusion
{
  uint64_t v107 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v2 = [*(id *)(a1 + 176) err];
    CMAttachmentBearerRef target = 0;
    uint64_t v3 = (void *)[*(id *)(a1 + 176) output];
    int v85 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 176), "input"), "captureSettings"), "captureType");
    if (dword_1E96B6888)
    {
      unsigned int v97 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    if (v2)
    {
      id v5 = (id)[v3 metadata];
      if (!v5) {
        id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      }
      objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", v2, v80, v82), @"UBAddFrameFailure");
      goto LABEL_54;
    }
    uint64_t v2 = [*(id *)(a1 + 80) process];
    id v5 = (id)[v3 metadata];
    if (v2) {
      goto LABEL_54;
    }
    uint64_t CopyWithNewPixelBuffer = BWCMSampleBufferCreateCopyWithNewPixelBuffer((opaqueCMSampleBuffer *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 176), "input"), "referenceFrame"), (__CVBuffer *)objc_msgSend(v3, "pixelBuffer"), (CFTypeRef *)(a1 + 144), (CMSampleBufferRef *)&target);
    if (CopyWithNewPixelBuffer)
    {
      uint64_t v2 = CopyWithNewPixelBuffer;
      goto LABEL_54;
    }
    if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 176), "input"), "captureSettings"), "captureFlags") & 0x800) == 0)
    {
LABEL_25:
      if objc_msgSend(v3, "fusionMode", v80) == 2 && (objc_opt_respondsToSelector())
      {
        unint64_t v19 = (opaqueCMSampleBuffer *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 176), "input"), "evMinusReferenceFrame");
        memset(&v106, 0, sizeof(v106));
        CMSampleBufferGetPresentationTimeStamp(&v106, v19);
        uint64_t v20 = (void *)[MEMORY[0x1E4F1CA48] array];
        for (uint64_t i = 0; i != 3; ++i)
        {
          for (int j = 0; j != 3; ++j)
          {
            unint64_t v23 = NSNumber;
            [v3 refFrameTransform];
            int v87 = v24;
            int v89 = v25;
            double v86 = v26;
            uint64_t v88 = v27;
            int v91 = v28;
            uint64_t v90 = v29;
            LODWORD(v26) = *(_DWORD *)((unint64_t)(&v86 + 2 * i) & 0xFFFFFFFFFFFFFFF3 | (4 * (j & 3)));
            objc_msgSend(v20, "addObject:", objc_msgSend(v23, "numberWithFloat:", v26));
          }
        }
        uint64_t v30 = *(void **)(a1 + 176);
        if (v30) {
          v31 = (void *)v30[5];
        }
        else {
          v31 = 0;
        }
        uint64_t v32 = [v30 input];
        CMTime v104 = v106;
        [v31 processorController:a1 didSelectNewReferenceFrameWithPTS:&v104 transform:v20 processorInput:v32];
      }
      CMSetAttachment(target, @"HasUnreliableBracketingMetadata", MEMORY[0x1E4F1CC38], 1u);
      v33 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53070], 0);
      [v33 addEntriesFromDictionary:v5];
      uint64_t v34 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v3, "fusionMode"));
      [v33 setObject:v34 forKeyedSubscript:*MEMORY[0x1E4F53300]];
      if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 176), "input"), "captureSettings"), "captureFlags") & 0x100000) != 0)
      {
        int v35 = objc_msgSend((id)CMGetAttachment(target, @"StillImageProcessingFlags", 0), "unsignedIntValue");
        CMSetAttachment(target, @"StillImageProcessingFlags", (CFTypeRef)[NSNumber numberWithUnsignedInt:v35 | 2u], 1u);
        if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 176), "input"), "captureSettings"), "deliverOriginalImage") & 1) != 0|| objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 176), "input"), "settings"), "HDRMode") == 1)
        {
          if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 176), "input"), "captureSettings"), "deliverOriginalImage"))uint64_t v36 = 3; {
          else
          }
            uint64_t v36 = 2;
          uint64_t v37 = [NSNumber numberWithShort:v36];
          [v33 setObject:v37 forKeyedSubscript:*MEMORY[0x1E4F53F30]];
        }
      }
      if (v85 == 11)
      {
        [v33 setObject:&unk_1EFAFF258 forKeyedSubscript:@"CompositeImage"];
        uint64_t v38 = [*(id *)(a1 + 176) numberOfFramesAddedForMultiFrameProcessing];
        v100[0] = [NSNumber numberWithInt:v38];
        v100[1] = &unk_1EFAFF270;
        objc_msgSend(v33, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v100, 2), @"SourceImageNumberOfCompositeImage");
        [*(id *)(a1 + 176) totalExposureTimesOfFramesAddedForMultiFrameProcessing];
        int v40 = v39;
        [*(id *)(a1 + 176) maxExposureTimesOfFramesAddedForMultiFrameProcessing];
        int v42 = v41;
        [*(id *)(a1 + 176) minExposureTimesOfFramesAddedForMultiFrameProcessing];
        int v44 = v43;
        v99[0] = &unk_1EFB058F8;
        LODWORD(v45) = v40;
        v99[1] = [NSNumber numberWithFloat:v45];
        v99[2] = &unk_1EFB058F8;
        LODWORD(v46) = v42;
        v99[3] = [NSNumber numberWithFloat:v46];
        v99[4] = &unk_1EFB058F8;
        LODWORD(v47) = v44;
        v99[5] = [NSNumber numberWithFloat:v47];
        v99[6] = &unk_1EFB058F8;
        v99[7] = &unk_1EFAFF270;
        objc_msgSend(v33, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v99, 8), @"SourceExposureTimesOfCompositeImage");
        CMSetAttachment(target, @"OisRecenteringLoggingData", (CFTypeRef)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 176), "input"), "oisRecenteringLoggingData"), 1u);
      }
      else
      {
        [v33 setObject:&unk_1EFAFF288 forKeyedSubscript:@"CompositeImage"];
      }
      if (dword_1E96B6888)
      {
        unsigned int v97 = 0;
        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
        v48 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        unsigned int v49 = v97;
        if (os_log_type_enabled(v48, type)) {
          unsigned int v50 = v49;
        }
        else {
          unsigned int v50 = v49 & 0xFFFFFFFE;
        }
        if (v50)
        {
          v51 = *(void **)(a1 + 176);
          uint64_t v52 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v51, "input"), "settings"), "settingsID");
          LODWORD(v104.value) = 136315651;
          *(CMTimeValue *)((char *)&v104.value + 4) = (CMTimeValue)"-[BWUBProcessorController _processUBFusion]";
          LOWORD(v104.flags) = 2113;
          *(void *)((char *)&v104.flags + 2) = v51;
          HIWORD(v104.epoch) = 2048;
          uint64_t v105 = v52;
          LODWORD(v82) = 32;
          v80 = &v104;
          _os_log_send_and_compose_impl();
        }
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      uint64_t v53 = *(void *)(a1 + 176);
      if (v53) {
        uint64_t v54 = *(void **)(v53 + 40);
      }
      else {
        uint64_t v54 = 0;
      }
      objc_msgSend(v54, "processorController:didFinishProcessingSampleBuffer:type:processorInput:err:", a1, target, -[BWUBProcessorRequest imageType](v53), objc_msgSend(*(id *)(a1 + 176), "input"), 0);
      uint64_t v2 = 0;
LABEL_54:
      if (!objc_msgSend(*(id *)(a1 + 176), "err", v80, v82)) {
        [*(id *)(a1 + 176) setErr:v2];
      }
      CMAttachmentBearerRef v55 = target;
      if (target)
      {
LABEL_91:
        CFRelease(v55);
LABEL_92:

        return;
      }
      [v3 setPixelBuffer:0];
      int v56 = (opaqueCMSampleBuffer *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 176), "input"), "errorRecoveryFrame");
      if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 176), "input"), "captureSettings"), "deliverOriginalImage") & 1) != 0|| !v56)
      {
LABEL_82:
        uint64_t v73 = *(void *)(a1 + 176);
        if (v73)
        {
          CFTypeRef v74 = *(void **)(v73 + 40);
          CMAttachmentBearerRef v75 = target;
          int v76 = -[BWUBProcessorRequest processingType](v73);
          uint64_t v77 = 14;
          uint64_t v78 = 6;
          if (v76 != 2) {
            uint64_t v78 = 0;
          }
          if (v76 != 3) {
            uint64_t v77 = v78;
          }
          if (v76 == 1) {
            uint64_t v79 = 3;
          }
          else {
            uint64_t v79 = v77;
          }
        }
        else
        {
          CFTypeRef v74 = 0;
          uint64_t v79 = 0;
          CMAttachmentBearerRef v75 = target;
        }
        objc_msgSend(v74, "processorController:didFinishProcessingSampleBuffer:type:processorInput:err:", a1, v75, v79, objc_msgSend(*(id *)(a1 + 176), "input", v81, v83), v2);
        CMAttachmentBearerRef v55 = target;
        if (!target) {
          goto LABEL_92;
        }
        goto LABEL_91;
      }
      int v57 = -[BWUBProcessorController _setupProcessorForProcessingType:](a1, 0);
      if (v57)
      {
        uint64_t v83 = v84;
        LODWORD(v81) = v57;
      }
      else
      {
        int v58 = -[BWUBProcessorController _singleImageProcessSampleBuffer:sampleBufferOut:](a1, v56, &target);
        if (!v58)
        {
          if (dword_1E96B6888)
          {
            unsigned int v97 = 0;
            os_log_type_t type = OS_LOG_TYPE_DEFAULT;
            uint64_t v59 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            unsigned int v60 = v97;
            if (os_log_type_enabled(v59, type)) {
              unsigned int v61 = v60;
            }
            else {
              unsigned int v61 = v60 & 0xFFFFFFFE;
            }
            if (v61)
            {
              uint64_t v62 = *(void **)(a1 + 176);
              uint64_t v63 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v62, "input"), "settings"), "settingsID");
              LODWORD(v104.value) = 136315651;
              *(CMTimeValue *)((char *)&v104.value + 4) = (CMTimeValue)"-[BWUBProcessorController _processUBFusion]";
              LOWORD(v104.flags) = 2113;
              *(void *)((char *)&v104.flags + 2) = v62;
              HIWORD(v104.epoch) = 2048;
              uint64_t v105 = v63;
              LODWORD(v83) = 32;
              v81 = &v104;
              _os_log_send_and_compose_impl();
            }
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          goto LABEL_68;
        }
        uint64_t v83 = v84;
        LODWORD(v81) = v58;
      }
      FigDebugAssert3();
LABEL_68:
      CMAttachmentBearerRef v64 = target;
      if (target) {
        goto LABEL_79;
      }
      ImageBuffer = CMSampleBufferGetImageBuffer(v56);
      OSType PixelFormatType = CVPixelBufferGetPixelFormatType(ImageBuffer);
      if (PixelFormatType == objc_msgSend((id)objc_msgSend(*(id *)(a1 + 56), "outputFormat"), "pixelFormat")&& !BWCMSampleBufferCreateCopyIncludingMetadata(v56, (CMSampleBufferRef *)&target)&& dword_1E96B6888)
      {
        unsigned int v97 = 0;
        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
        uint64_t v67 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        unsigned int v68 = v97;
        if (os_log_type_enabled(v67, type)) {
          unsigned int v69 = v68;
        }
        else {
          unsigned int v69 = v68 & 0xFFFFFFFE;
        }
        if (v69)
        {
          v70 = *(void **)(a1 + 176);
          uint64_t v71 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v70, "input"), "settings"), "settingsID");
          LODWORD(v104.value) = 136315651;
          *(CMTimeValue *)((char *)&v104.value + 4) = (CMTimeValue)"-[BWUBProcessorController _processUBFusion]";
          LOWORD(v104.flags) = 2113;
          *(void *)((char *)&v104.flags + 2) = v70;
          HIWORD(v104.epoch) = 2048;
          uint64_t v105 = v71;
          LODWORD(v83) = 32;
          v81 = &v104;
          _os_log_send_and_compose_impl();
        }
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      CMAttachmentBearerRef v64 = target;
      if (target)
      {
LABEL_79:
        int v72 = objc_msgSend((id)CMGetAttachment(v64, @"StillImageProcessingFlags", 0), "unsignedIntValue");
        CMSetAttachment(target, @"StillImageProcessingFlags", (CFTypeRef)[NSNumber numberWithUnsignedInt:v72 | 0x400u], 1u);
        objc_msgSend((id)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53070], 0), "setObject:forKeyedSubscript:", v5, @"UBFusionFailure");
        if (v85 == 11) {
          CMSetAttachment(target, @"OisRecenteringLoggingData", (CFTypeRef)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 176), "input"), "oisRecenteringLoggingData"), 1u);
        }
        uint64_t v2 = 0;
      }
      goto LABEL_82;
    }
    int v7 = [v3 fusionMode];
    if (v7 == 1)
    {
      if (!BWSampleBufferGetAttachedMedia(target, 0x1EFA74360))
      {
        uint64_t v102 = 0x1EFA74360;
        uint64_t v8 = (void *)MEMORY[0x1E4F1C978];
        uint64_t v9 = &v102;
        uint64_t v10 = 1;
        goto LABEL_17;
      }
    }
    else if (v7 == 2)
    {
      v103[0] = @"Depth";
      v103[1] = 0x1EFA74440;
      v103[2] = 0x1EFA74380;
      v103[3] = 0x1EFA743C0;
      uint64_t v8 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v9 = v103;
      uint64_t v10 = 4;
LABEL_17:
      char v11 = objc_msgSend(v8, "arrayWithObjects:count:", v9, v10, v80, v82);
LABEL_18:
      uint64_t v12 = (const void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 176), "input", v80), "evMinusReferenceFrame");
      long long v92 = 0u;
      long long v93 = 0u;
      long long v94 = 0u;
      long long v95 = 0u;
      uint64_t v13 = [v11 countByEnumeratingWithState:&v92 objects:v101 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v93;
        do
        {
          for (uint64_t k = 0; k != v14; ++k)
          {
            if (*(void *)v93 != v15) {
              objc_enumerationMutation(v11);
            }
            uint64_t v17 = *(void *)(*((void *)&v92 + 1) + 8 * k);
            uint64_t AttachedMedia = BWSampleBufferGetAttachedMedia(v12, v17);
            BWSampleBufferSetAttachedMedia(target, v17, AttachedMedia);
          }
          uint64_t v14 = [v11 countByEnumeratingWithState:&v92 objects:v101 count:16];
        }
        while (v14);
      }
      goto LABEL_25;
    }
    char v11 = 0;
    goto LABEL_18;
  }
}

- (uint64_t)_processUBOriginalImage
{
  if (result)
  {
    uint64_t v1 = result;
    CMAttachmentBearerRef target = 0;
    uint64_t v2 = -[BWUBProcessorController _singleImageProcessSampleBuffer:sampleBufferOut:](result, (opaqueCMSampleBuffer *)objc_msgSend((id)objc_msgSend(*(id *)(result + 176), "input"), "originalImage"), &target);
    if (target)
    {
      uint64_t v3 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53070], 0);
      int v4 = objc_msgSend((id)CMGetAttachment(target, @"StillImageProcessingFlags", 0), "unsignedIntValue");
      CMSetAttachment(target, @"StillImageProcessingFlags", (CFTypeRef)[NSNumber numberWithUnsignedInt:v4 | 1u], 1u);
      [v3 setObject:&unk_1EFAFF2A0 forKeyedSubscript:*MEMORY[0x1E4F53F30]];
      if (!v2) {
        objc_msgSend(v3, "addEntriesFromDictionary:", objc_msgSend((id)objc_msgSend(*(id *)(v1 + 176), "output"), "metadata"));
      }
    }
    uint64_t v5 = *(void *)(v1 + 176);
    if (v5) {
      uint64_t v6 = *(void **)(v5 + 40);
    }
    else {
      uint64_t v6 = 0;
    }
    objc_msgSend(v6, "processorController:didFinishProcessingSampleBuffer:type:processorInput:err:", v1, target, -[BWUBProcessorRequest imageType](v5), objc_msgSend(*(id *)(v1 + 176), "input"), v2);
    if (target) {
      CFRelease(target);
    }
    return -[BWUBProcessorController _updateStateIfNeeded](v1);
  }
  return result;
}

- (void)_processDeepFusion
{
  v44[21] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  uint64_t v3 = [a1[22] err];
  CMAttachmentBearerRef target = 0;
  if (dword_1E96B6888)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (!v3)
  {
    if (![(id)objc_opt_class() lazilyAllocatesDeepFusionOutputBuffers]) {
      goto LABEL_22;
    }
    uint64_t v5 = (void *)[a1[22] input];
    uint64_t v6 = (void *)[a1[22] deepFusionOutput];
    if (![v6 longPixelBuffer])
    {
      int v7 = a1[22];
      if (v7) {
        uint64_t v8 = (void *)v7[5];
      }
      else {
        uint64_t v8 = 0;
      }
      uint64_t v9 = objc_msgSend(v8, "processorController:newOutputPixelBufferForProcessorInput:type:", a1, v5, 10, v38, v40);
      if (!v9)
      {
        uint64_t v40 = v1;
        LODWORD(v38) = 0;
        goto LABEL_61;
      }
      uint64_t v10 = (const void *)v9;
      [v6 setLongPixelBuffer:v9];
      CFRelease(v10);
    }
    if (!objc_msgSend(v6, "longNoisePixelBuffer", v38))
    {
      char v11 = a1[22];
      if (v11) {
        uint64_t v12 = (void *)v11[5];
      }
      else {
        uint64_t v12 = 0;
      }
      uint64_t v13 = [v12 processorController:a1 newOutputPixelBufferForProcessorInput:v5 type:11];
      if (!v13)
      {
        uint64_t v40 = v1;
        LODWORD(v38) = 0;
        goto LABEL_61;
      }
      uint64_t v14 = (const void *)v13;
      [v6 setLongNoisePixelBuffer:v13];
      CFRelease(v14);
    }
    if ([v6 realLongNoisePixelBuffer]
      || (objc_msgSend((id)objc_msgSend(v5, "captureSettings"), "captureFlags") & 0x400000) == 0)
    {
LABEL_22:
      uint64_t v19 = objc_msgSend(a1[10], "process", v38);
      if (v19)
      {
        uint64_t v3 = v19;
      }
      else
      {
        if ([a1[7] deepFusionWaitForProcessingToFinish]) {
          [a1[10] finishProcessing];
        }
        uint64_t v3 = 0;
      }
      goto LABEL_26;
    }
    uint64_t v15 = a1[22];
    if (v15) {
      uint64_t v16 = (void *)v15[5];
    }
    else {
      uint64_t v16 = 0;
    }
    uint64_t v17 = [v16 processorController:a1 newOutputPixelBufferForProcessorInput:v5 type:12];
    if (v17)
    {
      uint64_t v18 = (const void *)v17;
      [v6 setRealLongNoisePixelBuffer:v17];
      CFRelease(v18);
      goto LABEL_22;
    }
    uint64_t v40 = v1;
    LODWORD(v38) = 0;
LABEL_61:
    FigDebugAssert3();
    uint64_t v3 = 4294954510;
  }
LABEL_26:
  if (!objc_msgSend(a1[22], "err", v38, v40)) {
    [a1[22] setErr:v3];
  }
  if (v3
    && objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1[22], "input"), "captureSettings"), "deliverDeferredPhotoProxyImage")&& (objc_msgSend(a1[22], "deliveredDeferredProxyImage") & 1) == 0)
  {
    objc_msgSend((id)objc_msgSend(a1[22], "deepFusionOutput"), "setProxyPixelBuffer:", 0);
    uint64_t v20 = objc_msgSend((id)objc_msgSend(a1[22], "input"), "errorRecoveryFrame");
    if (!v20)
    {
LABEL_43:
      uint64_t v31 = (uint64_t)a1[22];
      if (v31)
      {
        uint64_t v32 = *(void **)(v31 + 40);
        CMAttachmentBearerRef v33 = target;
        int v34 = -[BWUBProcessorRequest processingType](v31);
        uint64_t v35 = 14;
        uint64_t v36 = 6;
        if (v34 != 2) {
          uint64_t v36 = 0;
        }
        if (v34 != 3) {
          uint64_t v35 = v36;
        }
        if (v34 == 1) {
          uint64_t v37 = 3;
        }
        else {
          uint64_t v37 = v35;
        }
      }
      else
      {
        uint64_t v32 = 0;
        uint64_t v37 = 0;
        CMAttachmentBearerRef v33 = target;
      }
      objc_msgSend(v32, "processorController:didFinishProcessingSampleBuffer:type:processorInput:err:", a1, v33, v37, objc_msgSend(a1[22], "input", v39, v41), v3);
      if (target) {
        CFRelease(target);
      }
      return;
    }
    id v21 = (opaqueCMSampleBuffer *)v20;
    int v22 = -[BWUBProcessorController _setupProcessorForProcessingType:]((uint64_t)a1, 0);
    if (v22)
    {
      uint64_t v41 = v1;
      LODWORD(v39) = v22;
    }
    else
    {
      int v23 = -[BWUBProcessorController _singleImageProcessSampleBuffer:sampleBufferOut:]((uint64_t)a1, v21, &target);
      if (!v23)
      {
        if (dword_1E96B6888)
        {
          int v24 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        goto LABEL_36;
      }
      uint64_t v41 = v1;
      LODWORD(v39) = v23;
    }
    FigDebugAssert3();
LABEL_36:
    CMAttachmentBearerRef v25 = target;
    if (target) {
      goto LABEL_42;
    }
    ImageBuffer = CMSampleBufferGetImageBuffer(v21);
    OSType PixelFormatType = CVPixelBufferGetPixelFormatType(ImageBuffer);
    if (PixelFormatType == objc_msgSend((id)objc_msgSend(a1[7], "outputFormat"), "pixelFormat")
      && !BWCMSampleBufferCreateCopyIncludingMetadata(v21, (CMSampleBufferRef *)&target)
      && dword_1E96B6888)
    {
      int v28 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    CMAttachmentBearerRef v25 = target;
    if (target)
    {
LABEL_42:
      int v29 = objc_msgSend((id)CMGetAttachment(v25, @"StillImageProcessingFlags", 0), "unsignedIntValue");
      CMSetAttachment(target, @"StillImageProcessingFlags", (CFTypeRef)[NSNumber numberWithUnsignedInt:v29 | 0x400u], 1u);
      uint64_t v30 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53070], 0);
      int v43 = @"UBDeepFusionFusionFailure";
      v44[0] = [NSNumber numberWithInt:v3];
      objc_msgSend(v30, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v44, &v43, 1), @"UB");
      uint64_t v3 = 0;
    }
    goto LABEL_43;
  }
}

- (void)processor:(id)a3 outputReadyWithFrameType:(int)a4 outputPixelBuffer:(__CVBuffer *)a5 outputMetadata:(id)a6 error:(int)a7
{
  if (a5 && !a7)
  {
    uint64_t v10 = 9;
    switch(a4)
    {
      case 2:
        CMAttachmentBearerRef v11 = -[BWUBProcessorController _newOutputSampleBufferWithSampleBuffer:pixelBuffer:formatDescriptionInOut:metadataToMerge:](self, [(BWUBProcessorInput *)[(BWUBProcessorRequest *)self->_currentRequest input] referenceFrame], a5, (CFTypeRef *)&self->_outputFormatDescription, (uint64_t)a6);
        if (![(BWStillImageCaptureSettings *)[(BWStillImageProcessorControllerInput *)[(BWUBProcessorRequest *)self->_currentRequest input] captureSettings] deliverDeferredPhotoProxyImage])goto LABEL_29; {
        uint64_t v12 = (const void *)objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend((id)CMGetAttachment(v11, @"StillImageProcessingFlags", 0), "unsignedIntValue") | 0x1000);
        }
        CMSetAttachment(v11, @"StillImageProcessingFlags", v12, 1u);
        [(BWUBProcessorRequest *)self->_currentRequest setDeliveredDeferredProxyImage:1];
        currentRequest = self->_currentRequest;
        if (currentRequest) {
          delegate = currentRequest->_delegate;
        }
        else {
          delegate = 0;
        }
        uint64_t v15 = [(BWUBProcessorRequest *)currentRequest input];
        uint64_t v16 = delegate;
        uint64_t v17 = self;
        CMAttachmentBearerRef v18 = v11;
        uint64_t v19 = 7;
        goto LABEL_28;
      case 3:
        uint64_t v20 = [(BWUBProcessorRequest *)self->_currentRequest deepFusionOutput];
        if ([(UBDeepFusionOutput *)v20 refFrameTransformIsValid]
          && (objc_opt_respondsToSelector() & 1) != 0)
        {
          id v21 = [(BWUBProcessorInput *)[(BWUBProcessorRequest *)self->_currentRequest input] evMinusReferenceFrame];
          memset(&v47, 0, sizeof(v47));
          CMSampleBufferGetPresentationTimeStamp(&v47, v21);
          int v22 = (void *)[MEMORY[0x1E4F1CA48] array];
          for (uint64_t i = 0; i != 3; ++i)
          {
            for (int j = 0; j != 3; ++j)
            {
              CMAttachmentBearerRef v25 = NSNumber;
              [(UBDeepFusionOutput *)v20 refFrameTransform];
              int v42 = v26;
              int v44 = v27;
              double v41 = v28;
              uint64_t v43 = v29;
              int v46 = v30;
              uint64_t v45 = v31;
              LODWORD(v28) = *(_DWORD *)((unint64_t)(&v41 + 2 * i) & 0xFFFFFFFFFFFFFFF3 | (4 * (j & 3)));
              objc_msgSend(v22, "addObject:", objc_msgSend(v25, "numberWithFloat:", v28));
            }
          }
          uint64_t v32 = self->_currentRequest;
          if (v32) {
            CMAttachmentBearerRef v33 = v32->_delegate;
          }
          else {
            CMAttachmentBearerRef v33 = 0;
          }
          uint64_t v34 = [(BWUBProcessorRequest *)v32 input];
          CMTime v40 = v47;
          [(BWUBProcessorControllerDelegate *)v33 processorController:self didSelectNewReferenceFrameWithPTS:&v40 transform:v22 processorInput:v34];
        }
        uint64_t v10 = 8;
        goto LABEL_21;
      case 4:
        goto LABEL_21;
      case 5:
        uint64_t v10 = 10;
        goto LABEL_21;
      case 6:
        uint64_t v10 = 11;
        goto LABEL_21;
      case 7:
        uint64_t v10 = 12;
LABEL_21:
        uint64_t v35 = self->_currentRequest;
        if (v35) {
          uint64_t v36 = v35->_delegate;
        }
        else {
          uint64_t v36 = 0;
        }
        LODWORD(v39) = 0;
        [(BWUBProcessorControllerDelegate *)v36 processorController:self didFinishProcessingBuffer:a5 metadata:a6 type:v10 captureFrameFlags:0 processorInput:[(BWUBProcessorRequest *)v35 input] err:v39];
        break;
      case 8:
        CMAttachmentBearerRef v11 = -[BWUBProcessorController _newOutputSampleBufferWithSampleBuffer:pixelBuffer:formatDescriptionInOut:metadataToMerge:](self, [(BWUBProcessorInput *)[(BWUBProcessorRequest *)self->_currentRequest input] referenceFrame], a5, (CFTypeRef *)&self->_inferenceInputFormatDescription, (uint64_t)a6);
        uint64_t v37 = self->_currentRequest;
        if (v37) {
          uint64_t v38 = v37->_delegate;
        }
        else {
          uint64_t v38 = 0;
        }
        uint64_t v15 = [(BWUBProcessorRequest *)v37 input];
        uint64_t v16 = v38;
        uint64_t v17 = self;
        CMAttachmentBearerRef v18 = v11;
        uint64_t v19 = 15;
LABEL_28:
        [(BWUBProcessorControllerDelegate *)v16 processorController:v17 didFinishProcessingSampleBuffer:v18 type:v19 processorInput:v15 err:0];
LABEL_29:
        if (v11)
        {
          CFRelease(v11);
        }
        break;
      default:
        return;
    }
  }
}

- (CMAttachmentBearerRef)_newOutputSampleBufferWithSampleBuffer:(__CVBuffer *)a3 pixelBuffer:(CFTypeRef *)a4 formatDescriptionInOut:(uint64_t)a5 metadataToMerge:
{
  if (result)
  {
    CMAttachmentBearerRef target = 0;
    if (BWCMSampleBufferCreateCopyWithNewPixelBuffer(a2, a3, a4, (CMSampleBufferRef *)&target))
    {
      FigDebugAssert3();
    }
    else
    {
      CFStringRef v6 = (const __CFString *)*MEMORY[0x1E4F53070];
      int v7 = objc_msgSend((id)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53070], 0), "mutableCopy");
      [v7 addEntriesFromDictionary:a5];
      CMSetAttachment(target, v6, v7, 1u);
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
  uint64_t v8 = [(BWUBProcessorRequest *)currentRequest input];
  [(BWUBProcessorControllerDelegate *)delegate processorController:self didSelectFusionMode:v4 processorInput:v8];
}

- (id)processorGetInferenceResults:(id)a3
{
  id v4 = objc_alloc_init(NSClassFromString(&cfstr_Ubprocessorinf.isa));
  if ([(BWUBProcessorRequest *)self->_currentRequest inferencesAvailable])
  {
    currentRequest = self->_currentRequest;
    if (currentRequest) {
      delegate = currentRequest->_delegate;
    }
    else {
      delegate = 0;
    }
    int v7 = (void *)[(BWUBProcessorControllerDelegate *)delegate processorController:self newInferencesForProcessorInput:[(BWUBProcessorRequest *)currentRequest input]];
    uint64_t v8 = [v7 inferenceBufferForAttachedMediaKey:@"PersonSemanticsSkin"];
    if (v8) {
      [v4 setSkinMask:v8];
    }
    uint64_t v9 = [v7 inferenceBufferForAttachedMediaKey:0x1EFA6A200];
    if (v9) {
      [v4 setPersonMask:v9];
    }
    uint64_t v10 = [v7 inferenceForAttachmentKey:0x1EFA6A0A0];
    if (v10) {
      [v4 setFaceLandmarks:v10];
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
  int result = [(BWUBProcessorControllerConfiguration *)self->_configuration lowLightFusionEnabled];
  if (result)
  {
    ubProcessor = self->_ubProcessor;
    return [(UBProcessor *)ubProcessor progressiveBatchSize];
  }
  return result;
}

- (id)adaptiveBracketingParametersForDigitalFlashMode:(int)a3 frameStatistics:(id)a4 stationary:(BOOL)a5 sphereOffsetEnabled:(BOOL)a6 detectedObjects:(id)a7
{
  if (a3
    && (BOOL v7 = a5,
        (id v11 = -[NSDictionary objectForKeyedSubscript:](self->_adaptiveBracketingCaptureParametersByPortType, "objectForKeyedSubscript:", [a4 portType])) != 0))
  {
    id v12 = v11;
    id UBStatisticsFromFrameStatistics = udp_createUBStatisticsFromFrameStatistics(self->_ubProgressiveBracketingStatisticsClass, a4, v7);
    uint64_t v14 = -[BWUBAdaptiveBracketingParameters initWithProgressiveBracketingParameters:progressiveBracketingStatisticsClass:]([BWUBAdaptiveBracketingParameters alloc], (id)objc_msgSend(objc_alloc(self->_ubProgressiveBracketingParametersClass), "initWithOptions:portType:statistics:mode:", v12, objc_msgSend(a4, "portType"), UBStatisticsFromFrameStatistics, a3 == 2), (uint64_t)self->_ubProgressiveBracketingStatisticsClass);
  }
  else
  {
    uint64_t v14 = 0;
  }
  return v14;
}

- (id)adaptiveBracketingDigitalFlashTotalIntegrationTimesProviderForPortType:(id)a3
{
  uint64_t v5 = -[NSDictionary objectForKeyedSubscript:](self->_adaptiveBracketingCaptureParametersByPortType, "objectForKeyedSubscript:");
  if (v5) {
    uint64_t v5 = -[BWUBAdaptiveBracketingParameters initWithProgressiveBracketingParameters:progressiveBracketingStatisticsClass:]([BWUBAdaptiveBracketingParameters alloc], (id)[objc_alloc(self->_ubProgressiveBracketingParametersClass) initWithOptions:v5 portType:a3 statistics:0 mode:0], (uint64_t)self->_ubProgressiveBracketingStatisticsClass);
  }
  return v5;
}

@end