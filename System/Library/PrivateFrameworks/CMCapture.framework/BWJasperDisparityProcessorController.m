@interface BWJasperDisparityProcessorController
+ (void)initialize;
- (BOOL)finishProcessingCurrentInputNow;
- (BWJasperDisparityProcessorController)initWithConfiguration:(id)a3;
- (id)jasperPointCloudForColorBuffer:(id)a3;
- (int)_setupJasperDisparityProcessor;
- (int)enqueueInputForProcessing:(id)a3 delegate:(id)a4;
- (unint64_t)type;
- (void)_execute;
- (void)_serviceNextRequest;
- (void)_updateStateIfNeeded;
- (void)addPointCloudToTimeMachine:(opaqueCMSampleBuffer *)a3;
- (void)cancelProcessing;
- (void)dealloc;
@end

@implementation BWJasperDisparityProcessorController

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (BWJasperDisparityProcessorController)initWithConfiguration:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)BWJasperDisparityProcessorController;
  v4 = [(BWJasperDisparityProcessorController *)&v9 init];
  if (v4)
  {
    v4->_configuration = (BWJasperDisparityProcessorControllerConfiguration *)a3;
    v4->_requestQueue = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v5 = [[FigStateMachine alloc] initWithLabel:@"BWJasperDisparityProcessorController state machine" stateCount:4 initialState:1 owner:v4];
    [(FigStateMachine *)v5 setPerformsAtomicStateTransitions:0];
    [(FigStateMachine *)v5 setLabel:@"Idle" forState:1];
    [(FigStateMachine *)v5 setLabel:@"Ready" forState:2];
    [(FigStateMachine *)v5 setLabel:@"Waiting" forState:4];
    [(FigStateMachine *)v5 setLabel:@"Processing" forState:8];
    [(FigStateMachine *)v5 whenTransitioningToStates:1 callHandler:&__block_literal_global_79];
    [(FigStateMachine *)v5 whenTransitioningToStates:2 callHandler:&__block_literal_global_211_0];
    [(FigStateMachine *)v5 whenTransitioningToState:4 callHandler:&__block_literal_global_213];
    [(FigStateMachine *)v5 whenTransitioningToState:8 callHandler:&__block_literal_global_215];
    v4->_stateMachine = v5;
    *(_DWORD *)v4->_anon_70 = 1065353216;
    *(_DWORD *)&v4->_anon_70[20] = 1065353216;
    *(_DWORD *)&v4->_anon_70[40] = 1065353216;
    v4->_pointClouds = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v4->_pointCloudsLock._os_unfair_lock_opaque = 0;
    v6 = (void *)MEMORY[0x1A6272C70]();
    int v7 = [(BWJasperDisparityProcessorController *)v4 _setupJasperDisparityProcessor];
    if (v7)
    {

      return 0;
    }
  }
  return v4;
}

- (void)dealloc
{
  depthFormatDescription = self->_depthFormatDescription;
  if (depthFormatDescription) {
    CFRelease(depthFormatDescription);
  }
  v4.receiver = self;
  v4.super_class = (Class)BWJasperDisparityProcessorController;
  [(BWStillImageProcessorController *)&v4 dealloc];
}

- (unint64_t)type
{
  return 13;
}

- (int)enqueueInputForProcessing:(id)a3 delegate:(id)a4
{
  v5 = [[BWJasperDisparityProcessorRequest alloc] initWithInput:a3 delegate:a4];
  [(NSMutableArray *)self->_requestQueue addObject:v5];

  if ([(FigStateMachine *)self->_stateMachine currentState] == 1) {
    [(FigStateMachine *)self->_stateMachine transitionToState:2];
  }
  return 0;
}

- (BOOL)finishProcessingCurrentInputNow
{
  v2 = self->_currentRequest;
  [(BWJasperDisparityProcessorInput *)[(BWJasperDisparityProcessorRequest *)v2 input] executeNow];
  BOOL v3 = [(BWJasperDisparityProcessorRequest *)v2 err] == 0;

  return v3;
}

- (void)addPointCloudToTimeMachine:(opaqueCMSampleBuffer *)a3
{
  if (a3)
  {
    p_pointCloudsLock = &self->_pointCloudsLock;
    os_unfair_lock_lock(&self->_pointCloudsLock);
    [(NSMutableArray *)self->_pointClouds addObject:a3];
    unint64_t v6 = [(NSMutableArray *)self->_pointClouds count];
    if (v6 > [(BWJasperDisparityProcessorControllerConfiguration *)self->_configuration pointCloudTimeMachineCapacity])[(NSMutableArray *)self->_pointClouds removeObjectAtIndex:0]; {
    os_unfair_lock_unlock(p_pointCloudsLock);
    }
  }
  else
  {
    FigDebugAssert3();
  }
}

- (void)cancelProcessing
{
  [(NSMutableArray *)self->_requestQueue removeAllObjects];
  [(BWJasperDisparityProcessorRequest *)self->_currentRequest setErr:4294950490];
  [(BWJasperDisparityProcessorController *)self _serviceNextRequest];
}

- (id)jasperPointCloudForColorBuffer:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  p_pointCloudsLock = &self->_pointCloudsLock;
  os_unfair_lock_lock(&self->_pointCloudsLock);
  if ([a3 colorBuffer] && -[NSMutableArray count](self->_pointClouds, "count"))
  {
    unint64_t v6 = (CFStringRef *)MEMORY[0x1E4F53070];
    int v7 = (uint64_t *)MEMORY[0x1E4F530C0];
    if (dword_1E96B6D68)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    objc_super v9 = (const void *)objc_msgSend(a3, "colorBuffer", v32, v34);
    CFStringRef v10 = *v6;
    objc_msgSend((id)objc_msgSend((id)CMGetAttachment(v9, *v6, 0), "objectForKeyedSubscript:", *MEMORY[0x1E4F53E48]), "doubleValue");
    double v12 = v11;
    v13 = (const void *)[a3 colorBuffer];
    if (v13)
    {
      v14 = (void *)CMGetAttachment(v13, v10, 0);
      uint64_t v15 = *v7;
      CMTimeMakeFromDictionary(&time, (CFDictionaryRef)[v14 objectForKeyedSubscript:*v7]);
      double Seconds = CMTimeGetSeconds(&time);
    }
    else
    {
      uint64_t v15 = *v7;
      double Seconds = 0.0;
    }
    unint64_t v17 = 0;
    double v18 = v12 * 0.5 + Seconds;
    double v19 = 0.0;
    do
    {
      unint64_t v20 = v17;
      if ([(NSMutableArray *)self->_pointClouds count] - 1 <= v17) {
        break;
      }
      if (v19 == 0.0)
      {
        v21 = (const void *)[(NSMutableArray *)self->_pointClouds objectAtIndexedSubscript:v17];
        if (v21)
        {
          CFDictionaryRef v22 = (const __CFDictionary *)objc_msgSend((id)CMGetAttachment(v21, v10, 0), "objectForKeyedSubscript:", v15);
          CMTimeMakeFromDictionary(&time, v22);
          double v19 = CMTimeGetSeconds(&time);
        }
        else
        {
          double v19 = 0.0;
        }
      }
      ++v17;
      v23 = (const void *)[(NSMutableArray *)self->_pointClouds objectAtIndexedSubscript:v20 + 1];
      if (v23)
      {
        CFDictionaryRef v24 = (const __CFDictionary *)objc_msgSend((id)CMGetAttachment(v23, v10, 0), "objectForKeyedSubscript:", v15);
        CMTimeMakeFromDictionary(&time, v24);
        double v25 = CMTimeGetSeconds(&time);
      }
      else
      {
        double v25 = 0.0;
      }
      double v26 = vabdd_f64(v18, v19);
      double v19 = v25;
    }
    while (v26 > vabdd_f64(v18, v25));
    if (dword_1E96B6D68)
    {
      v27 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v28 = (opaqueCMSampleBuffer *)-[NSMutableArray objectAtIndexedSubscript:](self->_pointClouds, "objectAtIndexedSubscript:", v20, v33, v35);
    os_unfair_lock_unlock(p_pointCloudsLock);
    CFTypeRef CVDataBuffer = BWSampleBufferGetCVDataBuffer(v28);
    return (id)[objc_alloc((Class)getADJasperPointCloudClass()) initWithDataBuffer:CVDataBuffer];
  }
  else
  {
    v31 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    os_unfair_lock_unlock(p_pointCloudsLock);
    return 0;
  }
}

- (void)_updateStateIfNeeded
{
  currentRequest = self->_currentRequest;
  unsigned int v4 = [(FigStateMachine *)self->_stateMachine currentState];
  if (currentRequest)
  {
    if (v4 == 2)
    {
      uint64_t v5 = 4;
    }
    else if (v4 == 4)
    {
      if ([(BWJasperDisparityProcessorInput *)[(BWJasperDisparityProcessorRequest *)currentRequest input] isReadyToExecute])
      {
        uint64_t v5 = 8;
      }
      else
      {
        uint64_t v5 = 4;
      }
    }
    else
    {
      uint64_t v5 = 2;
    }
  }
  else
  {
    uint64_t v5 = 1;
  }
  if (v5 != [(FigStateMachine *)self->_stateMachine currentState])
  {
    stateMachine = self->_stateMachine;
    [(FigStateMachine *)stateMachine transitionToState:v5];
  }
}

- (void)_serviceNextRequest
{
  BOOL v3 = [(BWJasperDisparityProcessorRequest *)self->_currentRequest delegate];
  unsigned int v4 = [(BWJasperDisparityProcessorRequest *)self->_currentRequest input];
  uint64_t v5 = [(BWJasperDisparityProcessorRequest *)self->_currentRequest err];

  self->_currentRequest = 0;
  [(BWJasperDisparityProcessorControllerDelegate *)v3 processorController:self didFinishProcessingInput:v4 err:v5];

  unint64_t v6 = (BWJasperDisparityProcessorRequest *)(id)[(NSMutableArray *)self->_requestQueue firstObject];
  self->_currentRequest = v6;
  if (v6)
  {
    [(NSMutableArray *)self->_requestQueue removeObjectAtIndex:0];
    [(BWJasperDisparityProcessorInput *)[(BWJasperDisparityProcessorRequest *)self->_currentRequest input] setDelegate:self];
  }
  [(BWJasperDisparityProcessorController *)self _updateStateIfNeeded];
}

- (void)_execute
{
  target[20] = *(CMAttachmentBearerRef *)MEMORY[0x1E4F143B8];
  double v25 = 0;
  target[0] = 0;
  CFTypeRef value = 0;
  BOOL v3 = [(BWJasperDisparityProcessorInput *)[(BWJasperDisparityProcessorRequest *)self->_currentRequest input] colorBuffer];
  currentRequest = self->_currentRequest;
  if (!v3) {
    goto LABEL_20;
  }
  if ([(BWJasperDisparityProcessorRequest *)currentRequest err]) {
    goto LABEL_17;
  }
  if (![(BWJasperDisparityProcessorInput *)[(BWJasperDisparityProcessorRequest *)self->_currentRequest input] skipProcessing])
  {
    uint64_t v5 = objc_msgSend((id)CMGetAttachment(v3, (CFStringRef)*MEMORY[0x1E4F53070], 0), "objectForKeyedSubscript:", *MEMORY[0x1E4F54128]);
    uint64_t v6 = *MEMORY[0x1E4F52DE0];
    id v7 = [(NSDictionary *)[(BWStillImageProcessorControllerConfiguration *)self->_configuration sensorConfigurationsByPortType] objectForKeyedSubscript:v5];
    id v8 = [(NSDictionary *)[(BWStillImageProcessorControllerConfiguration *)self->_configuration sensorConfigurationsByPortType] objectForKeyedSubscript:v6];
    if (v7) {
      BOOL v9 = v8 == 0;
    }
    else {
      BOOL v9 = 1;
    }
    if (v9) {
      goto LABEL_17;
    }
    CFStringRef v10 = v8;
    CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(v3);
    currentRequest = self->_currentRequest;
    if (ImageBuffer)
    {
      id v12 = [(BWJasperDisparityProcessorController *)self jasperPointCloudForColorBuffer:[(BWJasperDisparityProcessorRequest *)currentRequest input]];
      currentRequest = self->_currentRequest;
      if (v12)
      {
        target[0] = (CMAttachmentBearerRef)[(BWJasperDisparityProcessorControllerDelegate *)[(BWJasperDisparityProcessorRequest *)currentRequest delegate] processorController:self newOutputPixelBufferForProcessorInput:[(BWJasperDisparityProcessorRequest *)self->_currentRequest input] type:2001];
        if (target[0])
        {
          long long v20 = 0u;
          *(_OWORD *)v21 = 0u;
          long long v18 = 0u;
          long long v19 = 0u;
          [(BWJasperDisparityProcessorRequest *)self->_currentRequest setErr:FigCaptureCreateJasperToColorCameraTransformForJasperSensorConfiguration(v10, (uint64_t)&v18)];
          if (![(BWJasperDisparityProcessorRequest *)self->_currentRequest err])
          {
            [(BWJasperDisparityProcessorRequest *)self->_currentRequest setErr:FigCaptureCreateColorCameraCalibrationForColorSampleBuffer(v3, v7, [(BWJasperDisparityProcessorControllerConfiguration *)self->_configuration horizontalSensorBinningFactor], [(BWJasperDisparityProcessorControllerConfiguration *)self->_configuration verticalSensorBinningFactor], &v25)];
            if (![(BWJasperDisparityProcessorRequest *)self->_currentRequest err])
            {
              if (v25)
              {
                [(BWJasperDisparityProcessorRequest *)self->_currentRequest setErr:FigCaptureCreateDepthMetadataForColorCameraCalibration(v25, [(FigCaptureStillImageSettings *)[(BWStillImageProcessorControllerInput *)[(BWJasperDisparityProcessorRequest *)self->_currentRequest input] settings] depthDataFiltered], &value)];
                if (![(BWJasperDisparityProcessorRequest *)self->_currentRequest err])
                {
                  objc_msgSend((id)objc_msgSend((id)-[ADJasperColorV2Executor executorParameters](self->_adStillImageExecutor, "executorParameters"), "pipelineParameters"), "setOutputHighConfidencePixelsOnly:", -[FigCaptureStillImageSettings depthDataFiltered](-[BWStillImageProcessorControllerInput settings](-[BWJasperDisparityProcessorRequest input](self->_currentRequest, "input"), "settings"), "depthDataFiltered") ^ 1);
                  -[BWJasperDisparityProcessorRequest setErr:](self->_currentRequest, "setErr:", -[ADJasperColorV2Executor executeWithColor:pointCloud:jasperToColorTransform:colorCamera:outputDepthMap:outputConfidenceMap:](self->_adStillImageExecutor, "executeWithColor:pointCloud:jasperToColorTransform:colorCamera:outputDepthMap:outputConfidenceMap:", ImageBuffer, v12, v25, target, 0, *(double *)&v18, *(double *)&v19, *(double *)&v20, v21[0]));
                  if (![(BWJasperDisparityProcessorRequest *)self->_currentRequest err])
                  {
                    CFStringRef v13 = (const __CFString *)*MEMORY[0x1E4F55B40];
                    CMSetAttachment(target[0], (CFStringRef)*MEMORY[0x1E4F55B40], value, 1u);
                    CMSetAttachment(v3, v13, value, 1u);
                    BWSampleBufferSetAttachedMediaFromPixelBuffer(v3, @"Depth", (__CVBuffer *)target[0], (CFTypeRef *)&self->_depthFormatDescription, 0, 0, 1);
                  }
                }
              }
            }
          }
          goto LABEL_17;
        }
        currentRequest = self->_currentRequest;
        uint64_t v14 = 4294954510;
LABEL_24:
        [(BWJasperDisparityProcessorRequest *)currentRequest setErr:v14];
        goto LABEL_17;
      }
    }
LABEL_20:
    uint64_t v14 = 4294954516;
    goto LABEL_24;
  }
  if (dword_1E96B6D68)
  {
    int v23 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
LABEL_17:
  [(BWJasperDisparityProcessorControllerDelegate *)[(BWJasperDisparityProcessorRequest *)self->_currentRequest delegate] processorController:self didFinishProcessingSampleBuffer:v3 type:[(BWJasperDisparityProcessorInput *)[(BWJasperDisparityProcessorRequest *)self->_currentRequest input] colorBufferType] processorInput:[(BWJasperDisparityProcessorRequest *)self->_currentRequest input] err:[(BWJasperDisparityProcessorRequest *)self->_currentRequest err]];
  if (target[0]) {
    CFRelease(target[0]);
  }

  [(BWJasperDisparityProcessorController *)self _updateStateIfNeeded];
}

- (int)_setupJasperDisparityProcessor
{
  if (self->_adStillImageExecutor) {
    return 0;
  }
  if (!FigCapturePixelFormatIsDepthData([(BWVideoFormat *)[(BWJasperDisparityProcessorControllerConfiguration *)self->_configuration outputDepthFormat] pixelFormat]))
  {
    int v4 = -12780;
    goto LABEL_5;
  }
  BOOL v3 = (ADJasperColorV2Executor *)[objc_alloc((Class)getADJasperColorV2ExecutorClass()) initWithInputPrioritization:3 engineType:4];
  self->_adStillImageExecutor = v3;
  if (!v3)
  {
    FigDebugAssert3();
    int v4 = -12786;
    goto LABEL_5;
  }
  int v4 = -[ADJasperColorV2Executor prepareForColorROI:](self->_adStillImageExecutor, "prepareForColorROI:", 0.0, 0.0, (double)[(BWVideoFormat *)[(BWJasperDisparityProcessorControllerConfiguration *)self->_configuration inputColorFormat] width], (double)[(BWVideoFormat *)[(BWJasperDisparityProcessorControllerConfiguration *)self->_configuration inputColorFormat] height]);
  if (v4)
  {
LABEL_5:

    self->_adStillImageExecutor = 0;
  }
  return v4;
}

@end