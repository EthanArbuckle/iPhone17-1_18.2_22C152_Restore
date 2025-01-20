@interface BWDeepZoomProcessorController
+ (void)initialize;
- (BOOL)intermediateResourceTrackingAllowedForAttachedMediaKey:(id)a3;
- (BWDeepZoomProcessorController)initWithConfiguration:(id)a3;
- (id)inputInferenceVideoFormatForAttachedMediaKey:(id)a3;
- (id)inputVideoFormatForAttachedMediaKey:(id)a3;
- (id)outputVideoFormatForAttachedMediaKey:(id)a3;
- (int)enqueueInputForProcessing:(id)a3 delegate:(id)a4;
- (int)prepareWithPixelBufferPoolProvider:(id)a3;
- (uint64_t)_loadSetupAndPrepareDeepZoomProcessor;
- (uint64_t)_process;
- (uint64_t)_serviceNextRequest;
- (uint64_t)_updateStateIfNeeded;
- (unint64_t)type;
- (void)cancelProcessing;
- (void)dealloc;
- (void)inputSampleBufferReceived:(id)a3;
@end

@implementation BWDeepZoomProcessorController

+ (void)initialize
{
  if ((id)objc_opt_class() == a1 && dzpc_initializeTrace_sInitializeTraceOnceToken != -1)
  {
    dispatch_once(&dzpc_initializeTrace_sInitializeTraceOnceToken, &__block_literal_global_120);
  }
}

- (BWDeepZoomProcessorController)initWithConfiguration:(id)a3
{
  if (!a3
    || ![a3 metalCommandQueue]
    || ![a3 inputFormat]
    || ![a3 outputFormat]
    || (int)[a3 version] < 1
    || [a3 type] != 2
    && [a3 type] != 1
    && [a3 type] != 3)
  {
    goto LABEL_14;
  }
  v10.receiver = self;
  v10.super_class = (Class)BWDeepZoomProcessorController;
  self = [(BWDeepZoomProcessorController *)&v10 init];
  if (self)
  {
    self->_configuration = (BWDeepZoomProcessorControllerConfiguration *)a3;
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    self->_requestQueue = v5;
    if (!v5) {
      goto LABEL_14;
    }
    v6 = [[FigStateMachine alloc] initWithLabel:@"BWDeepZoomProcessorController state machine" stateCount:4 initialState:1 owner:self];
    [(FigStateMachine *)v6 setPerformsAtomicStateTransitions:0];
    [(FigStateMachine *)v6 setLabel:@"Idle" forState:1];
    [(FigStateMachine *)v6 setLabel:@"Ready" forState:2];
    [(FigStateMachine *)v6 setLabel:@"Waiting" forState:4];
    [(FigStateMachine *)v6 setLabel:@"Processing" forState:8];
    [(FigStateMachine *)v6 whenTransitioningToStates:1 callHandler:&__block_literal_global_296];
    [(FigStateMachine *)v6 whenTransitioningToStates:2 callHandler:&__block_literal_global_298];
    [(FigStateMachine *)v6 whenTransitioningToState:4 callHandler:&__block_literal_global_300];
    [(FigStateMachine *)v6 whenTransitioningToState:8 callHandler:&__block_literal_global_302_0];
    self->_stateMachine = v6;
    if (!v6
      || (self->_inferenceConfigurationByInferenceType = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]),
          v7 = (void *)MEMORY[0x1A6272C70](),
          int SetupAndPrepareDeepZoom = -[BWDeepZoomProcessorController _loadSetupAndPrepareDeepZoomProcessor]((uint64_t)self),
          SetupAndPrepareDeepZoom))
    {
LABEL_14:

      return 0;
    }
  }
  return self;
}

- (uint64_t)_loadSetupAndPrepareDeepZoomProcessor
{
  v46[3] = *MEMORY[0x1E4F143B8];
  if (result)
  {
    v1 = (id *)result;
    if ([*(id *)(result + 56) inferenceScheduler])
    {
      BOOL v28 = [v1[7] type] == 3
         && FigCaptureVideoDimensionsAreValid([v1[7] stereoPhotoOutputDimensions]);
      uint64_t v2 = [v1[7] mode] == 5 ? 159 : 160;
      v3 = -[BWInferenceEngine initWithScheduler:priority:shareIntermediateBuffer:]([BWInferenceEngine alloc], "initWithScheduler:priority:shareIntermediateBuffer:", [v1[7] inferenceScheduler], objc_msgSend(v1[7], "figThreadPriority"), 1);
      v1[11] = v3;
      if (v3)
      {
        FigCaptureVideoDimensionsAreValid([v1[7] stereoPhotoOutputDimensions]);
        v4 = [(BWInferenceConfiguration *)[BWDeepZoomInferenceConfiguration alloc] initWithInferenceType:v2];
        if (v4)
        {
          v5 = v4;
          -[BWTiledEspressoInferenceConfiguration setMetalCommandQueue:](v4, "setMetalCommandQueue:", [v1[7] metalCommandQueue]);
          -[BWDeepZoomInferenceConfiguration setVersion:](v5, "setVersion:", [v1[7] version]);
          [(BWTiledEspressoInferenceConfiguration *)v5 setForceSynchronousInference:0];
          v45[0] = &unk_1EFB02840;
          v45[1] = &unk_1EFB02858;
          v46[0] = &unk_1EFB02858;
          v46[1] = &unk_1EFB02840;
          v45[2] = &unk_1EFB02870;
          v46[2] = &unk_1EFB02870;
          v27 = (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:v45 count:3];
          -[BWDeepZoomInferenceConfiguration setType:](v5, "setType:", objc_msgSend((id)objc_msgSend(v27, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v1[7], "type"))), "unsignedIntValue"));
          if ([(BWDeepZoomInferenceConfiguration *)v5 type])
          {
            v43[0] = &unk_1EFB02888;
            v43[1] = &unk_1EFB02858;
            v44[0] = &unk_1EFB02888;
            v44[1] = &unk_1EFB02858;
            v43[2] = &unk_1EFB02840;
            v43[3] = &unk_1EFB02870;
            v44[2] = &unk_1EFB02840;
            v44[3] = &unk_1EFB02870;
            v43[4] = &unk_1EFB028A0;
            v43[5] = &unk_1EFB028B8;
            v44[4] = &unk_1EFB028A0;
            v44[5] = &unk_1EFB028B8;
            v6 = (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:v43 count:6];
            -[BWDeepZoomInferenceConfiguration setMode:](v5, "setMode:", objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v1[7], "mode"))), "unsignedIntValue"));
            v7 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
            long long v33 = 0u;
            long long v34 = 0u;
            long long v35 = 0u;
            long long v36 = 0u;
            v8 = (void *)[v1[7] sensorConfigurationsByPortType];
            uint64_t v9 = [v8 countByEnumeratingWithState:&v33 objects:v42 count:16];
            if (v9)
            {
              uint64_t v10 = v9;
              uint64_t v11 = *(void *)v34;
              do
              {
                for (uint64_t i = 0; i != v10; ++i)
                {
                  if (*(void *)v34 != v11) {
                    objc_enumerationMutation(v8);
                  }
                  objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v1[7], "sensorConfigurationsByPortType"), "objectForKeyedSubscript:", *(void *)(*((void *)&v33 + 1) + 8 * i)), "sensorIDDictionary"), "objectForKeyedSubscript:", @"DeepZoomParameters"), *(void *)(*((void *)&v33 + 1) + 8 * i));
                }
                uint64_t v10 = [v8 countByEnumeratingWithState:&v33 objects:v42 count:16];
              }
              while (v10);
            }
            [(BWInferenceConfiguration *)v5 setTuningParameters:v7];
            if ([v1[7] mode] == 5) {
              -[BWDeepZoomInferenceConfiguration setStereoPhotoOutputDimensions:](v5, "setStereoPhotoOutputDimensions:", [v1[7] stereoPhotoOutputDimensions]);
            }
            if (![v1[11] addInferenceOfType:v2 version:BWInferenceVersionMakeMajor(1) & 0xFFFFFFFFFFFFLL configuration:v5])
            {
              objc_msgSend(v1[12], "setObject:forKeyedSubscript:", v5, objc_msgSend(NSNumber, "numberWithInt:", -[BWInferenceConfiguration inferenceType](v5, "inferenceType")));
              if (!v28 || [v1[7] mode] == 5) {
                goto LABEL_26;
              }
              v13 = [(BWInferenceConfiguration *)[BWDeepZoomInferenceConfiguration alloc] initWithInferenceType:159];
              -[BWTiledEspressoInferenceConfiguration setMetalCommandQueue:](v13, "setMetalCommandQueue:", [v1[7] metalCommandQueue]);
              -[BWDeepZoomInferenceConfiguration setVersion:](v13, "setVersion:", [v1[7] version]);
              [(BWTiledEspressoInferenceConfiguration *)v13 setForceSynchronousInference:0];
              -[BWDeepZoomInferenceConfiguration setType:](v13, "setType:", objc_msgSend((id)objc_msgSend(v27, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v1[7], "type"))), "unsignedIntValue"));
              [(BWDeepZoomInferenceConfiguration *)v13 setMode:5];
              [(BWInferenceConfiguration *)v13 setTuningParameters:v7];
              -[BWDeepZoomInferenceConfiguration setStereoPhotoOutputDimensions:](v13, "setStereoPhotoOutputDimensions:", [v1[7] stereoPhotoOutputDimensions]);
              if (![v1[11] addInferenceOfType:159 version:BWInferenceVersionMakeMajor(1) & 0xFFFFFFFFFFFFLL configuration:v13])
              {
                objc_msgSend(v1[12], "setObject:forKeyedSubscript:", v13, objc_msgSend(NSNumber, "numberWithInt:", -[BWInferenceConfiguration inferenceType](v13, "inferenceType")));
LABEL_26:
                v14 = (void *)[MEMORY[0x1E4F1CA48] arrayWithArray:&unk_1EFB04EB0];
                objc_msgSend(v14, "addObjectsFromArray:", FigCaptureSupportedCompressedPixelFormatsForSettings(4, 3, 0, 1, 0, 1, 1, 0));
                id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
                v1[13] = v15;
                if (v15)
                {
                  v16 = objc_alloc_init(BWVideoFormatRequirements);
                  -[BWVideoFormatRequirements setWidth:](v16, "setWidth:", objc_msgSend((id)objc_msgSend(v1[7], "inputFormat"), "width"));
                  -[BWVideoFormatRequirements setHeight:](v16, "setHeight:", objc_msgSend((id)objc_msgSend(v1[7], "inputFormat"), "height"));
                  [(BWVideoFormatRequirements *)v16 setSupportedPixelFormats:v14];
                  [(BWVideoFormatRequirements *)v16 setBytesPerRowAlignment:64];
                  v41 = v16;
                  id v17 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v41 count:1]);

                  if (v17)
                  {
                    [v1[13] setObject:v17 forKeyedSubscript:@"PrimaryFormat"];
                    v18 = objc_alloc_init(BWVideoFormatRequirements);
                    -[BWVideoFormatRequirements setWidth:](v18, "setWidth:", objc_msgSend((id)objc_msgSend(v1[7], "outputFormat"), "width"));
                    -[BWVideoFormatRequirements setHeight:](v18, "setHeight:", objc_msgSend((id)objc_msgSend(v1[7], "outputFormat"), "height"));
                    [(BWVideoFormatRequirements *)v18 setSupportedPixelFormats:v14];
                    [(BWVideoFormatRequirements *)v18 setBytesPerRowAlignment:64];
                    v40 = v18;
                    id v19 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v40 count:1]);

                    if (v19)
                    {
                      if ([v1[7] mode] != 5) {
                        [v1[13] setObject:v19 forKeyedSubscript:0x1EFA6A680];
                      }
                      if ([v1[7] type] != 3) {
                        goto LABEL_37;
                      }
                      id v20 = +[BWVideoFormatRequirements formatRequirements];
                      objc_msgSend(v20, "setWidth:", objc_msgSend((id)objc_msgSend(v1[7], "outputFormat"), "width"));
                      objc_msgSend(v20, "setHeight:", objc_msgSend((id)objc_msgSend(v1[7], "outputFormat"), "height"));
                      [v20 setSupportedPixelFormats:v14];
                      [v20 setBytesPerRowAlignment:64];
                      id v39 = v20;
                      id v21 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v39 count:1]);
                      if (v21)
                      {
                        [v1[13] setObject:v21 forKeyedSubscript:0x1EFA6A660];
                        if (!v28)
                        {
LABEL_37:
                          long long v31 = 0u;
                          long long v32 = 0u;
                          long long v29 = 0u;
                          long long v30 = 0u;
                          id v23 = v1[13];
                          result = [v23 countByEnumeratingWithState:&v29 objects:v37 count:16];
                          if (!result) {
                            return result;
                          }
                          uint64_t v24 = result;
                          uint64_t v25 = *(void *)v30;
LABEL_39:
                          uint64_t v26 = 0;
                          while (1)
                          {
                            if (*(void *)v30 != v25) {
                              objc_enumerationMutation(v23);
                            }
                            if (objc_msgSend(v1[11], "prepareForInputVideoFormat:attachedMediaKey:", objc_msgSend(v1[13], "objectForKeyedSubscript:", *(void *)(*((void *)&v29 + 1) + 8 * v26)), *(void *)(*((void *)&v29 + 1) + 8 * v26)))return 4294954516; {
                            if (v24 == ++v26)
                            }
                            {
                              result = [v23 countByEnumeratingWithState:&v29 objects:v37 count:16];
                              uint64_t v24 = result;
                              if (result) {
                                goto LABEL_39;
                              }
                              return result;
                            }
                          }
                        }
                        if ([v1[7] mode] == 5
                          || (v22 = +[BWVideoFormatRequirements formatRequirements](BWVideoFormatRequirements, "formatRequirements"), objc_msgSend(v22, "setWidth:", (int)objc_msgSend(v1[7], "stereoPhotoOutputDimensions")), objc_msgSend(v22, "setHeight:", objc_msgSend(v1[7], "stereoPhotoOutputDimensions") >> 32), objc_msgSend(v22, "setSupportedPixelFormats:", v14), objc_msgSend(v22, "setBytesPerRowAlignment:", 64), v38 = v22, (id v19 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v38, 1))) != 0))
                        {
                          [v1[13] setObject:v19 forKeyedSubscript:0x1EFA6A6A0];
                          goto LABEL_37;
                        }
                      }
                    }
                  }
                }
                return 4294954510;
              }
            }
          }
        }
      }
    }
    return 4294954516;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWDeepZoomProcessorController;
  [(BWStillImageProcessorController *)&v3 dealloc];
}

- (unint64_t)type
{
  return 10;
}

- (int)prepareWithPixelBufferPoolProvider:(id)a3
{
  if (!a3) {
    return -12780;
  }
  int result = [(BWInferenceEngine *)self->_inferenceEngine prepareForInferenceWithFormatProvider:self pixelBufferPoolProvider:a3];
  if (result) {
    return -12782;
  }
  return result;
}

- (int)enqueueInputForProcessing:(id)a3 delegate:(id)a4
{
  v5 = -[BWDeepZoomProcessorRequest initWithInput:delegate:]([BWDeepZoomProcessorRequest alloc], a3, a4);
  [(NSMutableArray *)self->_requestQueue addObject:v5];

  if ([(FigStateMachine *)self->_stateMachine currentState] == 1) {
    [(FigStateMachine *)self->_stateMachine transitionToState:2];
  }
  return 0;
}

- (void)cancelProcessing
{
  [(NSMutableArray *)self->_requestQueue removeAllObjects];
  [(BWDeepZoomProcessorRequest *)self->_currentRequest setErr:4294950490];
  -[BWDeepZoomProcessorController _serviceNextRequest]((uint64_t)self);
}

- (uint64_t)_serviceNextRequest
{
  if (result)
  {
    uint64_t v1 = result;
    id v2 = (id)[*(id *)(result + 80) delegate];
    id v3 = (id)[*(id *)(v1 + 80) input];
    uint64_t v4 = [*(id *)(v1 + 80) err];

    *(void *)(v1 + 80) = 0;
    [v2 processorController:v1 didFinishProcessingInput:v3 err:v4];

    id v5 = (id)[*(id *)(v1 + 72) firstObject];
    *(void *)(v1 + 80) = v5;
    if (v5)
    {
      [*(id *)(v1 + 72) removeObjectAtIndex:0];
      objc_msgSend((id)objc_msgSend(*(id *)(v1 + 80), "input"), "setDelegate:", v1);
    }
    return -[BWDeepZoomProcessorController _updateStateIfNeeded](v1);
  }
  return result;
}

- (void)inputSampleBufferReceived:(id)a3
{
  [(BWDeepZoomProcessorRequest *)self->_currentRequest input];
  -[BWDeepZoomProcessorController _updateStateIfNeeded]((uint64_t)self);
}

- (uint64_t)_updateStateIfNeeded
{
  if (result)
  {
    uint64_t v1 = result;
    id v2 = *(void **)(result + 80);
    int v3 = [*(id *)(result + 64) currentState];
    if (v2)
    {
      if (v3 == 2)
      {
        uint64_t v4 = 4;
      }
      else if (v3 == 4)
      {
        uint64_t v4 = objc_msgSend((id)objc_msgSend(v2, "input"), "sampleBufferSet") ? 8 : 4;
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
    int result = [*(id *)(v1 + 64) currentState];
    if (v4 != result)
    {
      id v5 = *(void **)(v1 + 64);
      return [v5 transitionToState:v4];
    }
  }
  return result;
}

- (uint64_t)_process
{
  if (!result) {
    return result;
  }
  uint64_t v1 = (id *)result;
  id v2 = (void *)[*(id *)(result + 80) input];
  int v3 = (void *)[v2 settings];
  if ([v1[10] err]) {
    goto LABEL_53;
  }
  if (!v2)
  {
    id v22 = v1[10];
    uint64_t v23 = 4294954514;
    goto LABEL_52;
  }
  if (!v3)
  {
    id v4 = v1[10];
    goto LABEL_55;
  }
  if (![v3 outputWidth] || !objc_msgSend(v3, "outputHeight"))
  {
    id v22 = v1[10];
    uint64_t v23 = 4294935586;
LABEL_52:
    [v22 setErr:v23];
LABEL_53:
    v16 = 0;
    int v3 = 0;
LABEL_56:
    char v19 = 1;
    goto LABEL_38;
  }
  int v3 = (void *)[v2 sampleBuffer];
  id v4 = v1[10];
  if (!v3)
  {
LABEL_55:
    [v4 setErr:4294954516];
    v16 = 0;
    goto LABEL_56;
  }
  uint64_t v5 = objc_msgSend((id)objc_msgSend(v4, "input"), "portType");
  int v6 = [v1[7] type];
  id v7 = v1[7];
  if (v6 == 3)
  {
    if (!+[BWDeepZoomProcessorControllerConfiguration doDeepZoomTransferForSampleBuffer:sensorConfiguration:intermediateZoomSrcRectOut:](BWDeepZoomProcessorControllerConfiguration, "doDeepZoomTransferForSampleBuffer:sensorConfiguration:intermediateZoomSrcRectOut:", v3, objc_msgSend((id)objc_msgSend(v7, "sensorConfigurationsByPortType"), "objectForKeyedSubscript:", v5), 0))
    {
LABEL_10:
      if (dword_1E96B6B48)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        char v19 = 1;
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      else
      {
        char v19 = 1;
      }
      v16 = v3;
      goto LABEL_38;
    }
  }
  else if (!+[BWDeepZoomProcessorControllerConfiguration doDeepZoomStandardOrLiteForSampleBuffer:type:sensorConfiguration:intermediateZoomSrcRectOut:intermediateZoomDstRectOut:](BWDeepZoomProcessorControllerConfiguration, "doDeepZoomStandardOrLiteForSampleBuffer:type:sensorConfiguration:intermediateZoomSrcRectOut:intermediateZoomDstRectOut:", v3, [v7 type], objc_msgSend((id)objc_msgSend(v1[7], "sensorConfigurationsByPortType"), "objectForKeyedSubscript:", v5), 0, 0))
  {
    goto LABEL_10;
  }
  int v9 = [v1[7] mode];
  if (![v1[13] objectForKeyedSubscript:0x1EFA6A6A0])
  {
    if (!v9) {
      +[BWDeepZoomProcessorControllerConfiguration deepZoomProcessingModeForType:sensorConfiguration:](BWDeepZoomProcessorControllerConfiguration, "deepZoomProcessingModeForType:sensorConfiguration:", [v1[7] type], objc_msgSend((id)objc_msgSend(v1[7], "sensorConfigurationsByPortType"), "objectForKeyedSubscript:", v5));
    }
    uint64_t v10 = 0;
    goto LABEL_20;
  }
  if ((BWStillImageProcessingFlagsForSampleBuffer(v3) & 0x100000) == 0)
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA80] setWithObject:&unk_1EFB02948];
LABEL_20:
    uint64_t v11 = 160;
    goto LABEL_22;
  }
  uint64_t v10 = [MEMORY[0x1E4F1CA80] setWithObject:&unk_1EFB02930];
  uint64_t v11 = 159;
LABEL_22:
  CFStringRef v12 = (const __CFString *)*MEMORY[0x1E4F53070];
  v13 = (void *)CMGetAttachment(v3, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  [v13 removeObjectForKey:*MEMORY[0x1E4F53398]];
  [v13 removeObjectForKey:*MEMORY[0x1E4F53390]];
  v14 = objc_msgSend(v1[12], "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", v11));
  if (!objc_msgSend((id)objc_msgSend(v14, "tuningParameters"), "objectForKeyedSubscript:", v5))
  {
    char v19 = 1;
    v16 = v3;
    goto LABEL_38;
  }
  objc_msgSend(v1[10], "setErr:", objc_msgSend(v1[11], "performInferencesOnSampleBuffer:attachingResultsToSampleBuffer:skippingInferencesWithTypes:", v3, v3, v10));
  if ([v1[10] err])
  {
    v16 = 0;
    char v19 = 1;
    goto LABEL_38;
  }
  AttachedMedia = (const void *)BWSampleBufferGetAttachedMedia(v3, [v14 outputAttachedMediaKey]);
  v16 = AttachedMedia;
  if (!AttachedMedia)
  {
    [v1[10] setErr:4294954513];
    goto LABEL_56;
  }
  CFRetain(AttachedMedia);
  if ([v1[7] type] == 3)
  {
    id v17 = (const void *)BWSampleBufferGetAttachedMedia(v3, 0x1EFA6A660);
    if (CMGetAttachment(v17, v12, 0) && CMGetAttachment(v16, v12, 0))
    {
      if (FigCFDictionaryGetCGRectIfPresent()) {
        FigCFDictionarySetCGRect();
      }
      if (!dword_1E96B6B48) {
        goto LABEL_37;
      }
      goto LABEL_34;
    }
  }
  else if (dword_1E96B6B48)
  {
LABEL_34:
    v18 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
LABEL_37:
    char v19 = 0;
    goto LABEL_38;
  }
  char v19 = 0;
LABEL_38:
  BWSampleBufferRemoveAttachedMedia(v3, 0x1EFA6A680);
  if ([v1[7] type] == 3)
  {
    BWSampleBufferRemoveAttachedMedia(v3, 0x1EFA6A6A0);
    BWSampleBufferRemoveAttachedMedia(v3, 0x1EFA6A660);
  }
  int v20 = objc_msgSend(v1[10], "err", v24, v25);
  if (v3 && v20)
  {
    [v1[10] setErr:0];
    v16 = v3;
  }
  objc_msgSend((id)objc_msgSend(v1[10], "delegate"), "processorController:didFinishProcessingSampleBuffer:type:processorInput:err:", v1, v16, objc_msgSend(v2, "bufferType"), v2, objc_msgSend(v1[10], "err"));
  if (v16) {
    char v21 = v19;
  }
  else {
    char v21 = 1;
  }
  if ((v21 & 1) == 0) {
    CFRelease(v16);
  }
  return -[BWDeepZoomProcessorController _updateStateIfNeeded]((uint64_t)v1);
}

- (id)inputVideoFormatForAttachedMediaKey:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_videoFormatByAttachedMediaKey objectForKeyedSubscript:a3];
}

- (id)inputInferenceVideoFormatForAttachedMediaKey:(id)a3
{
  return 0;
}

- (id)outputVideoFormatForAttachedMediaKey:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_videoFormatByAttachedMediaKey objectForKeyedSubscript:a3];
}

- (BOOL)intermediateResourceTrackingAllowedForAttachedMediaKey:(id)a3
{
  return 0;
}

@end