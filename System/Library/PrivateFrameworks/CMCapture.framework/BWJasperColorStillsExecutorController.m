@interface BWJasperColorStillsExecutorController
+ (void)initialize;
- (BOOL)finishProcessingCurrentInputNow;
- (BWJasperColorStillsExecutorController)initWithConfiguration:(id)a3;
- (int)enqueueInputForProcessing:(id)a3 delegate:(id)a4;
- (uint64_t)_execute;
- (uint64_t)_serviceNextRequest;
- (uint64_t)_setupJasperColorStillsExecutor;
- (uint64_t)_sourceDimensionsAreTargetDimensions;
- (uint64_t)_updateStateIfNeeded;
- (unint64_t)type;
- (void)cancelProcessing;
- (void)dealloc;
- (void)purgeResources;
@end

@implementation BWJasperColorStillsExecutorController

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (BWJasperColorStillsExecutorController)initWithConfiguration:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)BWJasperColorStillsExecutorController;
  v4 = [(BWJasperColorStillsExecutorController *)&v10 init];
  if (v4)
  {
    v4->_configuration = (BWJasperColorStillsExecutorControllerConfiguration *)a3;
    v4->_requestQueue = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v5 = [[FigStateMachine alloc] initWithLabel:@"BWJasperColorStillsExecutorController state machine" stateCount:4 initialState:1 owner:v4];
    [(FigStateMachine *)v5 setPerformsAtomicStateTransitions:0];
    [(FigStateMachine *)v5 setLabel:@"Idle" forState:1];
    [(FigStateMachine *)v5 setLabel:@"Ready" forState:2];
    [(FigStateMachine *)v5 setLabel:@"Waiting" forState:4];
    [(FigStateMachine *)v5 setLabel:@"Processing" forState:8];
    [(FigStateMachine *)v5 whenTransitioningToStates:1 callHandler:&__block_literal_global_35];
    [(FigStateMachine *)v5 whenTransitioningToStates:2 callHandler:&__block_literal_global_224];
    [(FigStateMachine *)v5 whenTransitioningToState:4 callHandler:&__block_literal_global_226];
    [(FigStateMachine *)v5 whenTransitioningToState:8 callHandler:&__block_literal_global_228];
    v4->_stateMachine = v5;
    *(_DWORD *)v4->_anon_70 = 1065353216;
    *(_DWORD *)&v4->_anon_70[20] = 1065353216;
    *(_DWORD *)&v4->_anon_70[40] = 1065353216;
    CGSize v6 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    v4->_inputROI.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
    v4->_inputROI.size = v6;
    if (([a3 postponeProcessorSetup] & 1) == 0)
    {
      v7 = (void *)MEMORY[0x1A6272C70]();
      int v8 = -[BWJasperColorStillsExecutorController _setupJasperColorStillsExecutor]((uint64_t)v4);
      if (v8)
      {

        return 0;
      }
    }
  }
  return v4;
}

- (uint64_t)_setupJasperColorStillsExecutor
{
  if (!a1 || *(void *)(a1 + 72)) {
    return 0;
  }
  if (!FigCapturePixelFormatIsDepthData(objc_msgSend((id)objc_msgSend(*(id *)(a1 + 64), "outputDepthFormat"), "pixelFormat")))
  {
    uint64_t v8 = 4294954516;
LABEL_9:

    *(void *)(a1 + 72) = 0;
    return v8;
  }
  uint64_t v2 = [objc_alloc((Class)getADJasperColorStillsExecutorClass()) init];
  *(void *)(a1 + 72) = v2;
  if (!v2)
  {
    FigDebugAssert3();
    uint64_t v8 = 4294954510;
    goto LABEL_9;
  }
  *(void *)(a1 + 80) = 3;
  if (-[BWJasperColorStillsExecutorController _sourceDimensionsAreTargetDimensions](a1))
  {
    double v3 = (double)(unint64_t)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 64), "inputColorFormat"), "width");
    double v4 = (double)(unint64_t)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 64), "inputColorFormat"), "height");
    *(void *)(a1 + 176) = 0;
    *(void *)(a1 + 184) = 0;
    *(double *)(a1 + 192) = v3;
  }
  else
  {
    int v5 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 64), "inputColorFormat"), "width");
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 64), "inputColorFormat"), "height");
    *(double *)(a1 + 176) = FigCaptureMetadataUtilitiesDenormalizedRectWithinBoundingDimensionsCenteredOnPoint(v5, [*(id *)(a1 + 64) standardFormatDimensions], 0.5);
    *(void *)(a1 + 184) = v6;
    *(void *)(a1 + 192) = v7;
  }
  *(double *)(a1 + 200) = v4;
  uint64_t v8 = objc_msgSend(*(id *)(a1 + 72), "prepareForEngineType:inputROI:", *(void *)(a1 + 80), *(double *)(a1 + 176), *(double *)(a1 + 184), *(double *)(a1 + 192), *(double *)(a1 + 200));
  if (v8) {
    goto LABEL_9;
  }
  return v8;
}

- (void)dealloc
{
  depthFormatDescription = self->_depthFormatDescription;
  if (depthFormatDescription) {
    CFRelease(depthFormatDescription);
  }
  v4.receiver = self;
  v4.super_class = (Class)BWJasperColorStillsExecutorController;
  [(BWStillImageProcessorController *)&v4 dealloc];
}

- (unint64_t)type
{
  return 9;
}

- (uint64_t)_updateStateIfNeeded
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = *(void **)(result + 96);
    int v3 = [*(id *)(result + 56) currentState];
    if (v2)
    {
      if (v3 == 2)
      {
        uint64_t v4 = 4;
      }
      else if (v3 == 4)
      {
        uint64_t v4 = objc_msgSend((id)objc_msgSend(v2, "input"), "isReadyToExecute") ? 8 : 4;
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
    result = [*(id *)(v1 + 56) currentState];
    if (v4 != result)
    {
      int v5 = *(void **)(v1 + 56);
      return [v5 transitionToState:v4];
    }
  }
  return result;
}

- (int)enqueueInputForProcessing:(id)a3 delegate:(id)a4
{
  int v5 = -[BWJasperColorStillsExecutorRequest initWithInput:delegate:]([BWJasperColorStillsExecutorRequest alloc], a3, a4);
  [(NSMutableArray *)self->_requestQueue addObject:v5];

  if ([(FigStateMachine *)self->_stateMachine currentState] == 1) {
    [(FigStateMachine *)self->_stateMachine transitionToState:2];
  }
  return 0;
}

- (BOOL)finishProcessingCurrentInputNow
{
  uint64_t v2 = self->_currentRequest;
  uint64_t v3 = [(BWJasperColorStillsExecutorRequest *)v2 input];
  if (v3) {
    [*(id *)(v3 + 40) inputReadyToExecute:v3];
  }
  BOOL v4 = [(BWJasperColorStillsExecutorRequest *)v2 err] == 0;

  return v4;
}

- (void)cancelProcessing
{
  [(NSMutableArray *)self->_requestQueue removeAllObjects];
  [(BWJasperColorStillsExecutorRequest *)self->_currentRequest setErr:4294950490];
  -[BWJasperColorStillsExecutorController _serviceNextRequest]((uint64_t)self);
}

- (uint64_t)_serviceNextRequest
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = (void *)[*(id *)(result + 96) delegate];
    id v3 = (id)[*(id *)(v1 + 96) input];
    uint64_t v4 = [*(id *)(v1 + 96) err];

    *(void *)(v1 + 96) = 0;
    [v2 processorController:v1 didFinishProcessingInput:v3 err:v4];

    id v5 = (id)[*(id *)(v1 + 88) firstObject];
    *(void *)(v1 + 96) = v5;
    if (v5)
    {
      [*(id *)(v1 + 88) removeObjectAtIndex:0];
      objc_msgSend((id)objc_msgSend(*(id *)(v1 + 96), "input"), "setDelegate:", v1);
    }
    return -[BWJasperColorStillsExecutorController _updateStateIfNeeded](v1);
  }
  return result;
}

- (void)purgeResources
{
  self->_adStillImageExecutor = 0;
}

- (uint64_t)_execute
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  if (!result) {
    return result;
  }
  uint64_t v1 = result;
  v44 = 0;
  CMAttachmentBearerRef target = 0;
  CFTypeRef value = 0;
  uint64_t v2 = objc_msgSend((id)objc_msgSend(*(id *)(result + 96), "input"), "colorBuffer");
  id v3 = *(void **)(v1 + 96);
  if (!v2) {
    goto LABEL_25;
  }
  if (![v3 err])
  {
    if (objc_msgSend((id)objc_msgSend(*(id *)(v1 + 96), "input"), "skipProcessing"))
    {
      if (dword_1E96B6848)
      {
        int v42 = 0;
        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
        os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      goto LABEL_21;
    }
    CFStringRef v4 = (const __CFString *)*MEMORY[0x1E4F53070];
    uint64_t v5 = objc_msgSend((id)CMGetAttachment(v2, (CFStringRef)*MEMORY[0x1E4F53070], 0), "objectForKeyedSubscript:", *MEMORY[0x1E4F54128]);
    uint64_t v6 = *MEMORY[0x1E4F52DE0];
    uint64_t v7 = objc_msgSend((id)objc_msgSend(*(id *)(v1 + 64), "sensorConfigurationsByPortType"), "objectForKeyedSubscript:", v5);
    uint64_t v8 = objc_msgSend((id)objc_msgSend(*(id *)(v1 + 64), "sensorConfigurationsByPortType"), "objectForKeyedSubscript:", v6);
    ImageBuffer = CMSampleBufferGetImageBuffer((CMSampleBufferRef)v2);
    id v3 = *(void **)(v1 + 96);
    if (ImageBuffer)
    {
      objc_super v10 = -[BWJasperColorStillsExecutorInput jasperPointCloudsForColorBuffer]([v3 input]);
      uint64_t v11 = [v10 count];
      id v3 = *(void **)(v1 + 96);
      if (v11)
      {
        CMAttachmentBearerRef target = (CMAttachmentBearerRef)objc_msgSend((id)objc_msgSend(v3, "delegate"), "processorController:newOutputPixelBufferForProcessorInput:type:", v1, objc_msgSend(*(id *)(v1 + 96), "input"), 2001);
        if (target)
        {
          long long v39 = 0u;
          *(_OWORD *)v40 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          objc_msgSend(*(id *)(v1 + 96), "setErr:", FigCaptureCreateJasperToColorCameraTransformForJasperSensorConfiguration(v8, (uint64_t)&v37));
          if (![*(id *)(v1 + 96) err])
          {
            objc_msgSend(*(id *)(v1 + 96), "setErr:", FigCaptureCreateColorCameraCalibrationForColorSampleBuffer(v2, v7, objc_msgSend(*(id *)(v1 + 64), "horizontalSensorBinningFactor"), objc_msgSend(*(id *)(v1 + 64), "verticalSensorBinningFactor"), &v44));
            if (![*(id *)(v1 + 96) err])
            {
              if (v44)
              {
                objc_msgSend(*(id *)(v1 + 96), "setErr:", FigCaptureCreateDepthMetadataForColorCameraCalibration(v44, 1, &value));
                if (![*(id *)(v1 + 96) err])
                {
                  if (-[BWJasperColorStillsExecutorController _sourceDimensionsAreTargetDimensions](v1)) {
                    goto LABEL_18;
                  }
                  int v12 = objc_msgSend((id)objc_msgSend(*(id *)(v1 + 64), "inputColorFormat"), "width");
                  objc_msgSend((id)objc_msgSend(*(id *)(v1 + 64), "inputColorFormat"), "height");
                  CGSize v13 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
                  v46.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
                  v46.size = v13;
                  if (FigCFDictionaryGetCGRectIfPresent())
                  {
                    CGFloat y = v46.origin.y;
                    CGFloat x = v46.origin.x;
                    CGFloat height = v46.size.height;
                    CGFloat width = v46.size.width;
                  }
                  else
                  {
                    v46.origin = 0uLL;
                    __asm { FMOV            V0.2D, #1.0 }
                    v46.size = _Q0;
                    CGFloat y = 0.0;
                    CGFloat height = 1.0;
                    CGFloat width = 1.0;
                    CGFloat x = 0.0;
                  }
                  double MidX = CGRectGetMidX(*(CGRect *)&x);
                  CGRectGetMidY(v46);
                  v48.origin.CGFloat x = FigCaptureMetadataUtilitiesDenormalizedRectWithinBoundingDimensionsCenteredOnPoint(v12, [*(id *)(v1 + 64) standardFormatDimensions], MidX);
                  double v24 = v48.origin.x;
                  double v25 = v48.origin.y;
                  double v26 = v48.size.width;
                  double v27 = v48.size.height;
                  if (CGRectEqualToRect(v48, *(CGRect *)(v1 + 176))
                    || (*(double *)(v1 + 176) = v24,
                        *(double *)(v1 + 184) = v25,
                        *(double *)(v1 + 192) = v26,
                        *(double *)(v1 + 200) = v27,
                        objc_msgSend(*(id *)(v1 + 96), "setErr:", objc_msgSend(*(id *)(v1 + 72), "prepareForEngineType:inputROI:", *(void *)(v1 + 80), v24, v25, v26, v27)), !objc_msgSend(*(id *)(v1 + 96), "err")))
                  {
LABEL_18:
                    objc_msgSend(*(id *)(v1 + 96), "setErr:", objc_msgSend(*(id *)(v1 + 72), "executeWithColor:pointCloudArray:pointCloud2ColorTransform:colorCameraCalibration:outDepthMap:", ImageBuffer, v10, v44, &target, *(double *)&v37, *(double *)&v38, *(double *)&v39, v40[0]));
                    if (![*(id *)(v1 + 96) err])
                    {
                      CFStringRef v28 = (const __CFString *)*MEMORY[0x1E4F55B40];
                      CMSetAttachment(target, (CFStringRef)*MEMORY[0x1E4F55B40], value, 1u);
                      CMSetAttachment(v2, v28, value, 1u);
                      BWSampleBufferSetAttachedMediaFromPixelBuffer((opaqueCMSampleBuffer *)v2, @"Depth", (__CVBuffer *)target, (CFTypeRef *)(v1 + 104), 0, 0, 1);
                      if ((-[BWJasperColorStillsExecutorController _sourceDimensionsAreTargetDimensions](v1) & 1) == 0)
                      {
                        AttachedMedia = (const void *)BWSampleBufferGetAttachedMedia(v2, @"Depth");
                        v30 = (void *)CMGetAttachment(AttachedMedia, v4, 0);
                        unint64_t v31 = psn_pixelBufferDimensions(ImageBuffer);
                        unint64_t v32 = psn_pixelBufferDimensions((__CVBuffer *)target);
                        FigCaptureMetadataUtilitiesUpdateMetadataForStillImageCrop(v30, v31, v32, *(CGFloat *)(v1 + 176), *(CGFloat *)(v1 + 184), *(CGFloat *)(v1 + 192), *(CGFloat *)(v1 + 200), *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
                      }
                    }
                  }
                }
              }
            }
          }
          goto LABEL_21;
        }
        id v3 = *(void **)(v1 + 96);
        uint64_t v33 = 4294954510;
        goto LABEL_29;
      }
    }
LABEL_25:
    uint64_t v33 = 4294954516;
LABEL_29:
    [v3 setErr:v33];
  }
LABEL_21:
  objc_msgSend((id)objc_msgSend(*(id *)(v1 + 96), "delegate", v35, v36), "processorController:didFinishProcessingSampleBuffer:type:processorInput:err:", v1, v2, objc_msgSend((id)objc_msgSend(*(id *)(v1 + 96), "input"), "colorBufferType"), objc_msgSend(*(id *)(v1 + 96), "input"), objc_msgSend(*(id *)(v1 + 96), "err"));
  if (target) {
    CFRelease(target);
  }

  return -[BWJasperColorStillsExecutorController _updateStateIfNeeded](v1);
}

- (uint64_t)_sourceDimensionsAreTargetDimensions
{
  if (result)
  {
    uint64_t v1 = result;
    BOOL v2 = FigCaptureVideoDimensionsAreValid([*(id *)(result + 64) standardFormatDimensions]);
    uint64_t v3 = objc_msgSend((id)objc_msgSend(*(id *)(v1 + 64), "inputColorFormat"), "width");
    if (v3 == (int)[*(id *)(v1 + 64) standardFormatDimensions])
    {
      uint64_t v4 = objc_msgSend((id)objc_msgSend(*(id *)(v1 + 64), "inputColorFormat"), "width");
      BOOL v5 = v4 == [*(id *)(v1 + 64) standardFormatDimensions];
    }
    else
    {
      BOOL v5 = 0;
    }
    return !v2 | v5;
  }
  return result;
}

@end