@interface BWLearnedNRProcessorController
+ (void)initialize;
- (BOOL)intermediateResourceTrackingAllowedForAttachedMediaKey:(id)a3;
- (BWLearnedNRProcessorController)initWithConfiguration:(id)a3;
- (id)inputInferenceVideoFormatForAttachedMediaKey:(id)a3;
- (id)inputVideoFormatForAttachedMediaKey:(id)a3;
- (id)outputFormatForAttachedMediaKey:(id)a3;
- (id)outputVideoFormatForAttachedMediaKey:(id)a3;
- (int)enqueueInputForProcessing:(id)a3 delegate:(id)a4;
- (int)prepareWithPixelBufferPoolProvider:(id)a3;
- (uint64_t)_addInferenceType:(uint64_t)a3 outputVideoRequirements:;
- (uint64_t)_attachedMediaKeyForOutputFormat:(uint64_t)result;
- (uint64_t)_configureInference;
- (uint64_t)_inputFormat;
- (uint64_t)_primaryInputFormat;
- (uint64_t)_process;
- (uint64_t)_quadraInputFormat;
- (uint64_t)_quadraUltraHighResolutionInputFormat;
- (uint64_t)_quadraZoomBasedInputFormat;
- (uint64_t)_serviceNextRequest;
- (uint64_t)_updateStateIfNeeded;
- (unint64_t)type;
- (void)cancelProcessing;
- (void)dealloc;
- (void)input:(id)a3 setInputFrame:(opaqueCMSampleBuffer *)a4;
@end

@implementation BWLearnedNRProcessorController

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (BWLearnedNRProcessorController)initWithConfiguration:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)BWLearnedNRProcessorController;
  v4 = [(BWLearnedNRProcessorController *)&v9 init];
  if (v4)
  {
    if (!objc_msgSend((id)objc_msgSend(a3, "sensorConfigurationsByPortType"), "count"))
    {
      FigDebugAssert3();
      goto LABEL_4;
    }
    v4->_configuration = (BWLearnedNRProcessorControllerConfiguration *)a3;
    v5 = [[FigStateMachine alloc] initWithLabel:@"BWLearnedNRController state machine" stateCount:4 initialState:1 owner:v4];
    [(FigStateMachine *)v5 setPerformsAtomicStateTransitions:0];
    [(FigStateMachine *)v5 setLabel:@"Idle" forState:1];
    [(FigStateMachine *)v5 setLabel:@"Ready" forState:2];
    [(FigStateMachine *)v5 setLabel:@"Waiting" forState:4];
    [(FigStateMachine *)v5 setLabel:@"Processing" forState:8];
    [(FigStateMachine *)v5 whenTransitioningToStates:1 callHandler:&__block_literal_global_96];
    [(FigStateMachine *)v5 whenTransitioningToStates:2 callHandler:&__block_literal_global_217];
    [(FigStateMachine *)v5 whenTransitioningToState:4 callHandler:&__block_literal_global_219];
    [(FigStateMachine *)v5 whenTransitioningToState:8 callHandler:&__block_literal_global_221];
    v4->_stateMachine = v5;
    v4->_requestQueue = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v4->_inferenceConfigurationByInferenceType = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v6 = (void *)MEMORY[0x1A6272C70]();
    int v7 = -[BWLearnedNRProcessorController _configureInference]((uint64_t)v4);
    if (v7)
    {
LABEL_4:

      return 0;
    }
  }
  return v4;
}

- (uint64_t)_configureInference
{
  v14[1] = *MEMORY[0x1E4F143B8];
  if (result)
  {
    v1 = (id *)result;
    *(unsigned char *)(result + 88) = 0;
    result = -[BWInferenceEngine initWithScheduler:priority:shareIntermediateBuffer:]([BWInferenceEngine alloc], "initWithScheduler:priority:shareIntermediateBuffer:", [v1[7] inferenceScheduler], objc_msgSend(v1[7], "figThreadPriority"), 1);
    v1[12] = (id)result;
    if (result)
    {
      uint64_t v2 = -[BWLearnedNRProcessorController _inputFormat]((uint64_t)v1);
      uint64_t v3 = -[BWLearnedNRProcessorController _quadraInputFormat]((uint64_t)v1);
      uint64_t v4 = -[BWLearnedNRProcessorController _quadraZoomBasedInputFormat]((uint64_t)v1);
      uint64_t v5 = -[BWLearnedNRProcessorController _quadraUltraHighResolutionInputFormat]((uint64_t)v1);
      uint64_t v6 = -[BWLearnedNRProcessorController _attachedMediaKeyForOutputFormat:]((uint64_t)v1, (void *)[v1[7] outputFormat]);
      int v7 = lnrpc_inferenceVideoRequirementForVideoFormat(v6, (void *)[v1[7] outputFormat]);
      uint64_t v8 = -[BWLearnedNRProcessorController _attachedMediaKeyForOutputFormat:]((uint64_t)v1, (void *)[v1[7] zoomBasedOutputFormat]);
      objc_super v9 = lnrpc_inferenceVideoRequirementForVideoFormat(v8, (void *)[v1[7] zoomBasedOutputFormat]);
      uint64_t v10 = -[BWLearnedNRProcessorController _attachedMediaKeyForOutputFormat:]((uint64_t)v1, (void *)[v1[7] ultraHighResolutionOutputFormat]);
      v11 = lnrpc_inferenceVideoRequirementForVideoFormat(v10, (void *)[v1[7] ultraHighResolutionOutputFormat]);
      if (v2)
      {
        if (!v7) {
          goto LABEL_21;
        }
        v14[0] = v7;
        result = -[BWLearnedNRProcessorController _addInferenceType:outputVideoRequirements:](v1, 170, [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1]);
        if (result) {
          return result;
        }
      }
      if (!v3 && !v4 && !v5) {
        return [v1[12] prepareForInputVideoFormat:-[BWLearnedNRProcessorController _primaryInputFormat]((uint64_t)v1) attachedMediaKey:@"PrimaryFormat"];
      }
      v12 = (void *)[MEMORY[0x1E4F1CA48] array];
      v13 = v12;
      if (v3)
      {
        if (!v7) {
          goto LABEL_21;
        }
        [v12 addObject:v7];
      }
      if (v4)
      {
        if (!v9) {
          goto LABEL_21;
        }
        [v13 addObject:v9];
      }
      if (!v5) {
        goto LABEL_18;
      }
      if (v11)
      {
        [v13 addObject:v11];
LABEL_18:
        result = -[BWLearnedNRProcessorController _addInferenceType:outputVideoRequirements:](v1, 171, (uint64_t)v13);
        if (result) {
          return result;
        }
        return [v1[12] prepareForInputVideoFormat:-[BWLearnedNRProcessorController _primaryInputFormat]((uint64_t)v1) attachedMediaKey:@"PrimaryFormat"];
      }
LABEL_21:
      FigDebugAssert3();
      return 4294935585;
    }
  }
  return result;
}

- (uint64_t)_attachedMediaKeyForOutputFormat:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    if (objc_msgSend(a2, "isEqual:", objc_msgSend(*(id *)(result + 56), "ultraHighResolutionOutputFormat")))
    {
      return 0x1EFA6A720;
    }
    else if (objc_msgSend(a2, "isEqual:", objc_msgSend(*(id *)(v3 + 56), "zoomBasedOutputFormat")))
    {
      return 0x1EFA6A700;
    }
    else
    {
      return 0x1EFA6A6E0;
    }
  }
  return result;
}

- (uint64_t)_addInferenceType:(uint64_t)a3 outputVideoRequirements:
{
  if (!a1) {
    return 0;
  }
  uint64_t v5 = -[BWLearnedNRInferenceConfiguration initWithMetalCommandQueue:sensorConfigurationsByPortType:inferenceType:outputVideoRequirements:]([BWLearnedNRInferenceConfiguration alloc], "initWithMetalCommandQueue:sensorConfigurationsByPortType:inferenceType:outputVideoRequirements:", [a1[7] metalCommandQueue], objc_msgSend(a1[7], "sensorConfigurationsByPortType"), a2, a3);
  uint64_t v6 = [a1[12] addInferenceOfType:a2 version:BWInferenceVersionMakeMajor(1) & 0xFFFFFFFFFFFFLL configuration:v5];
  if (v6) {
    FigDebugAssert3();
  }
  else {
    objc_msgSend(a1[13], "setObject:forKeyedSubscript:", v5, objc_msgSend(NSNumber, "numberWithInt:", a2));
  }
  return v6;
}

- (uint64_t)_inputFormat
{
  if (result)
  {
    v1 = (void *)[*(id *)(result + 56) inputFormatsByQSubResolutionFlavor];
    return lnrpc_formatFromInputFormatsByQSubResolutionFlavor(v1, 1, 0, 0, 0);
  }
  return result;
}

- (uint64_t)_quadraInputFormat
{
  if (result)
  {
    v1 = (void *)[*(id *)(result + 56) inputFormatsByQSubResolutionFlavor];
    return lnrpc_formatFromInputFormatsByQSubResolutionFlavor(v1, 1, 0, 0, 1);
  }
  return result;
}

- (uint64_t)_quadraZoomBasedInputFormat
{
  if (result)
  {
    v1 = (void *)[*(id *)(result + 56) inputFormatsByQSubResolutionFlavor];
    return lnrpc_formatFromInputFormatsByQSubResolutionFlavor(v1, 0, 1, 0, 1);
  }
  return result;
}

- (uint64_t)_quadraUltraHighResolutionInputFormat
{
  if (result)
  {
    v1 = (void *)[*(id *)(result + 56) inputFormatsByQSubResolutionFlavor];
    return lnrpc_formatFromInputFormatsByQSubResolutionFlavor(v1, 0, 0, 1, 1);
  }
  return result;
}

- (uint64_t)_primaryInputFormat
{
  if (result)
  {
    uint64_t v1 = result;
    result = lnrpc_formatFromInputFormatsByQSubResolutionFlavor((void *)[*(id *)(result + 56) inputFormatsByQSubResolutionFlavor], 1, 0, 0, 0);
    if (!result)
    {
      uint64_t v2 = (void *)[*(id *)(v1 + 56) inputFormatsByQSubResolutionFlavor];
      return lnrpc_formatFromInputFormatsByQSubResolutionFlavor(v2, 0, 0, 1, 1);
    }
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWLearnedNRProcessorController;
  [(BWStillImageProcessorController *)&v3 dealloc];
}

- (unint64_t)type
{
  return 11;
}

- (int)prepareWithPixelBufferPoolProvider:(id)a3
{
  int result = [(BWInferenceEngine *)self->_inferenceEngine prepareForInferenceWithFormatProvider:self pixelBufferPoolProvider:a3];
  if (!result) {
    self->_inferenceEnginePrepared = 1;
  }
  return result;
}

- (int)enqueueInputForProcessing:(id)a3 delegate:(id)a4
{
  if (![(BWInferenceEngine *)self->_inferenceEngine isConfiguredForInference]
    || !self->_inferenceEnginePrepared)
  {
    return -12780;
  }
  int v7 = -[BWLearnedNRRequest initWithInput:delegate:]([BWLearnedNRRequest alloc], a3, a4);
  [(NSMutableArray *)self->_requestQueue addObject:v7];

  if ([(FigStateMachine *)self->_stateMachine currentState] == 1) {
    [(FigStateMachine *)self->_stateMachine transitionToState:2];
  }
  return 0;
}

- (void)cancelProcessing
{
  [(NSMutableArray *)self->_requestQueue removeAllObjects];
  [(BWLearnedNRRequest *)self->_currentRequest setErr:4294950490];
  -[BWLearnedNRProcessorController _serviceNextRequest]((uint64_t)self);
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
    return -[BWLearnedNRProcessorController _updateStateIfNeeded](v1);
  }
  return result;
}

- (uint64_t)_updateStateIfNeeded
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = *(void *)(result + 80);
    int v3 = [*(id *)(result + 64) currentState];
    if (v2)
    {
      if (v3 == 2)
      {
        uint64_t v4 = 4;
      }
      else if (v3 == 4)
      {
        uint64_t v4 = [*(id *)(v2 + 8) inputFrame] ? 8 : 4;
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
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  if (!result) {
    return result;
  }
  uint64_t v2 = (id *)result;
  int v3 = &OBJC_IVAR___BWStreamStartStopSynchronizer__timeoutInSeconds;
  uint64_t v4 = &off_1E96B6000;
  if ([*(id *)(result + 80) err])
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    v55 = 0;
    goto LABEL_33;
  }
  id v5 = (opaqueCMSampleBuffer *)objc_msgSend((id)objc_msgSend(v2[10], "input"), "inputFrame");
  if (dword_1E96B69A8)
  {
    uint64_t v6 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(v5);
  if (!ImageBuffer)
  {
    uint64_t v72 = v1;
    LODWORD(v71) = 0;
    FigDebugAssert3();
    goto LABEL_31;
  }
  uint64_t v8 = ImageBuffer;
  objc_super v9 = (void *)CMGetAttachment(v5, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  int64_t v10 = psn_pixelBufferDimensions(v8);
  double FinalCropRect = FigCaptureMetadataUtilitiesGetFinalCropRect();
  FigCaptureMetadataUtilitiesDenormalizeCropRect(FinalCropRect, v12, v13, v14);
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  double ValidBufferRect = FigCaptureMetadataUtilitiesGetValidBufferRect();
  CGFloat v25 = v24;
  CGFloat v27 = v26;
  CGFloat v29 = v28;
  v30 = objc_msgSend((id)objc_msgSend(v2[7], "finalCropRectOverscanMultiplierByPortType"), "objectForKeyedSubscript:", objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E4F54128]));
  if (v30) {
    [v30 floatValue];
  }
  else {
    float v31 = 1.0;
  }
  float v32 = FigCaptureMetadataUtilitiesScaleRect(v16, v18, v20, v22, v31);
  v74.origin.CGFloat x = (float)(floorf(v32) + -2.0);
  *(float *)&double v33 = v33;
  v74.origin.CGFloat y = (float)(floorf(*(float *)&v33) + -2.0);
  *(float *)&double v34 = v34;
  v74.size.CGFloat width = (float)(ceilf(*(float *)&v34) + 4.0);
  *(float *)&double v35 = v35;
  v74.size.CGFloat height = (float)(ceilf(*(float *)&v35) + 4.0);
  v77.origin.CGFloat x = ValidBufferRect;
  v77.origin.CGFloat y = v25;
  v77.size.CGFloat width = v27;
  v77.size.CGFloat height = v29;
  CGRect v75 = CGRectIntersection(v74, v77);
  CGFloat x = v75.origin.x;
  CGFloat y = v75.origin.y;
  CGFloat width = v75.size.width;
  CGFloat height = v75.size.height;
  if (!CGRectIsNull(v75))
  {
    v76.origin.CGFloat x = x;
    v76.origin.CGFloat y = y;
    v76.size.CGFloat width = width;
    v76.size.CGFloat height = height;
    CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v76);
    CMSetAttachment(v5, @"LearnedNRRegionOfInterest", DictionaryRepresentation, 0);
    if (DictionaryRepresentation) {
      CFRelease(DictionaryRepresentation);
    }
  }
  if (objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E4F54148], v71, v72), "intValue") == 1)
  {
    uint64_t v41 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v2[10], "input"), "captureSettings"), "captureFlags");
    if (objc_msgSend((id)lnrpc_formatFromInputFormatsByQSubResolutionFlavor(objc_msgSend(v2[7], "inputFormatsByQSubResolutionFlavor"), 1, 0, 0, 1), "width") >= (unint64_t)(int)v10)
    {
      unint64_t v45 = objc_msgSend((id)lnrpc_formatFromInputFormatsByQSubResolutionFlavor(objc_msgSend(v2[7], "inputFormatsByQSubResolutionFlavor"), 1, 0, 0, 1), "height");
      if ((v41 & 0x100000000) != 0)
      {
LABEL_20:
        v46 = (void *)[v2[7] inputFormatsByQSubResolutionFlavor];
        int v47 = 0;
        int v48 = 0;
        int v49 = 1;
LABEL_23:
        v42 = (void *)lnrpc_formatFromInputFormatsByQSubResolutionFlavor(v46, v47, v48, v49, 1);
        uint64_t v43 = 170;
        uint64_t v44 = 171;
        goto LABEL_24;
      }
      if (v45 >= v10 >> 32)
      {
        v46 = (void *)[v2[7] inputFormatsByQSubResolutionFlavor];
        int v47 = 1;
        int v48 = 0;
        goto LABEL_22;
      }
    }
    else if ((v41 & 0x100000000) != 0)
    {
      goto LABEL_20;
    }
    v46 = (void *)[v2[7] inputFormatsByQSubResolutionFlavor];
    int v47 = 0;
    int v48 = 1;
LABEL_22:
    int v49 = 0;
    goto LABEL_23;
  }
  v42 = (void *)lnrpc_formatFromInputFormatsByQSubResolutionFlavor((void *)[v2[7] inputFormatsByQSubResolutionFlavor], 1, 0, 0, 0);
  uint64_t v43 = 171;
  uint64_t v44 = 170;
LABEL_24:
  unsigned int v50 = [v42 width];
  if (__PAIR64__([v42 height], v50) != v10
    || (int v51 = [v42 pixelFormat], v51 != CVPixelBufferGetPixelFormatType(v8)))
  {
    int v3 = &OBJC_IVAR___BWStreamStartStopSynchronizer__timeoutInSeconds;
    id v56 = v2[10];
    uint64_t v57 = 4294954516;
    goto LABEL_32;
  }
  uint64_t v52 = objc_msgSend(v2[12], "performInferencesOnSampleBuffer:attachingResultsToSampleBuffer:skippingInferencesWithTypes:", v5, v5, objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObject:", objc_msgSend(NSNumber, "numberWithInt:", v43)));
  if (v52)
  {
    uint64_t v57 = v52;
    int v3 = &OBJC_IVAR___BWStreamStartStopSynchronizer__timeoutInSeconds;
    id v56 = v2[10];
    goto LABEL_32;
  }
  AttachedMedia = (const void *)BWSampleBufferGetAttachedMedia(v5, objc_msgSend((id)objc_msgSend(v2[13], "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", v44)), "outputAttachedMediaKeyForInputDimensions:", v10));
  if (!AttachedMedia || (CFTypeRef v54 = CFRetain(AttachedMedia)) == 0)
  {
    int v3 = &OBJC_IVAR___BWStreamStartStopSynchronizer__timeoutInSeconds;
LABEL_31:
    id v56 = v2[10];
    uint64_t v57 = 4294954510;
LABEL_32:
    objc_msgSend(v56, "setErr:", v57, v71, v72);
    v55 = 0;
    uint64_t v4 = &off_1E96B6000;
    goto LABEL_33;
  }
  v55 = v54;
  BWSampleBufferRemoveAttachedMedia(v5, 0x1EFA6A6C0);
  BWSampleBufferRemoveAttachedMedia(v5, 0x1EFA6A6E0);
  BWSampleBufferRemoveAttachedMedia(v5, 0x1EFA6A700);
  BWSampleBufferRemoveAttachedMedia(v5, 0x1EFA6A720);
  BWSampleBufferRemoveAttachedMedia(v55, 0x1EFA6A6C0);
  uint64_t v4 = &off_1E96B6000;
  int v3 = &OBJC_IVAR___BWStreamStartStopSynchronizer__timeoutInSeconds;
LABEL_33:
  if (*((_DWORD *)v4 + 618))
  {
    v58 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  int v59 = objc_msgSend(*(id *)((char *)v2 + v3[951]), "err", v71, v72);
  uint64_t v60 = [*(id *)((char *)v2 + v3[951]) delegate];
  v61 = (void *)[*(id *)((char *)v2 + v3[951]) input];
  uint64_t v62 = (uint64_t)v61;
  if (v59)
  {
    uint64_t v63 = [v61 inputFrame];
    uint64_t v64 = [*(id *)((char *)v2 + v3[951]) input];
    uint64_t v65 = [*(id *)((char *)v2 + v3[951]) err];
    v66 = (void *)v60;
    v67 = v2;
    v68 = (const void *)v63;
    uint64_t v69 = v64;
  }
  else
  {
    uint64_t v65 = [*(id *)((char *)v2 + v3[951]) err];
    v66 = (void *)v60;
    v67 = v2;
    v68 = v55;
    uint64_t v69 = v62;
  }
  [v66 processorController:v67 didFinishProcessingSampleBuffer:v68 type:1 processorInput:v69 err:v65];
  if (v55) {
    CFRelease(v55);
  }
  return -[BWLearnedNRProcessorController _updateStateIfNeeded]((uint64_t)v2);
}

- (id)inputVideoFormatForAttachedMediaKey:(id)a3
{
  return 0;
}

- (id)inputInferenceVideoFormatForAttachedMediaKey:(id)a3
{
  if (![a3 isEqualToString:@"PrimaryFormat"]) {
    return 0;
  }
  LODWORD(v6) = 0;
  uint64_t v4 = -[BWInferenceVideoFormat initWithUnderlyingFormat:isDeviceOriented:videoContentMode:includesInvalidContent:cropDescriptor:histogramRequest:rotationDegrees:]([BWInferenceVideoFormat alloc], "initWithUnderlyingFormat:isDeviceOriented:videoContentMode:includesInvalidContent:cropDescriptor:histogramRequest:rotationDegrees:", -[BWLearnedNRProcessorController _primaryInputFormat]((uint64_t)self), 0, 0, 0, 0, 0, v6);
  return v4;
}

- (id)outputFormatForAttachedMediaKey:(id)a3
{
}

- (id)outputVideoFormatForAttachedMediaKey:(id)a3
{
}

- (BOOL)intermediateResourceTrackingAllowedForAttachedMediaKey:(id)a3
{
  return 0;
}

- (void)input:(id)a3 setInputFrame:(opaqueCMSampleBuffer *)a4
{
  [(BWLearnedNRRequest *)self->_currentRequest input];
  -[BWLearnedNRProcessorController _updateStateIfNeeded]((uint64_t)self);
}

@end