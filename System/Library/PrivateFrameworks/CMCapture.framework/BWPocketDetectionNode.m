@interface BWPocketDetectionNode
+ (void)initialize;
- (BWPocketDetectionNode)initWithMetalCommandQueue:(id)a3 clientApplicationID:(id)a4;
- (id)nodeSubType;
- (id)nodeType;
- (int)_allocateResources;
- (int)_detectPocket:(opaqueCMSampleBuffer *)a3;
- (void)_cleanupResources;
- (void)_waitForDetectionToComplete;
- (void)accidentalActivationMitigationSessionStateDidChange:(id)a3;
- (void)dealloc;
- (void)didReachEndOfDataForInput:(id)a3;
- (void)didSelectFormat:(id)a3 forInput:(id)a4;
- (void)prepareForCurrentConfigurationToBecomeLive;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
@end

@implementation BWPocketDetectionNode

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (BWPocketDetectionNode)initWithMetalCommandQueue:(id)a3 clientApplicationID:(id)a4
{
  v17.receiver = self;
  v17.super_class = (Class)BWPocketDetectionNode;
  v6 = [(BWNode *)&v17 init];
  v7 = v6;
  if (!a3 || !a4) {
    goto LABEL_13;
  }
  if (v6)
  {
    v8 = [[BWNodeInput alloc] initWithMediaType:1986618469 node:v6];
    [(BWNodeInput *)v8 setFormatRequirements:objc_alloc_init(BWVideoFormatRequirements)];
    [(BWNodeInput *)v8 setPassthroughMode:1];
    [(BWNodeInputMediaConfiguration *)[(BWNodeInput *)v8 primaryMediaConfiguration] setRetainedBufferCount:1];
    [(BWNode *)v7 addInput:v8];
    v9 = [[BWNodeOutput alloc] initWithMediaType:1986618469 node:v7];
    [(BWNodeOutput *)v9 setFormatRequirements:objc_alloc_init(BWVideoFormatRequirements)];
    [(BWNodeOutput *)v9 setPassthroughMode:1];
    [(BWNode *)v7 addOutput:v9];
    v7->_coreMotionSuppressionStateLock._os_unfair_lock_opaque = 0;
    id v10 = +[FigWeakReference weakReferenceToObject:v7];
    v11 = [BWCoreMotionSuppressionStateMonitor alloc];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __71__BWPocketDetectionNode_initWithMetalCommandQueue_clientApplicationID___block_invoke;
    v16[3] = &unk_1E5C24EE8;
    v16[4] = v10;
    uint64_t v12 = [(BWCoreMotionSuppressionStateMonitor *)v11 initWithSuppressionStateChangeHandler:v16];
    v7->_coreMotionSuppressionStateMonitor = (BWCoreMotionSuppressionStateMonitor *)v12;
    if (v12)
    {
      v13 = [[BWPocketDetectionFFTProcessor alloc] initWithMetalCommandQueue:a3];
      v7->_fftProcessor = v13;
      if (v13)
      {
        v7->_detectionQueue = (OS_dispatch_queue *)FigDispatchQueueCreateWithPriority();
        v7->_cumulativeEnergyHistory = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
        v7->_cumulativeEnergyHistoryLength = 10;
        HIDWORD(v7->_lastDetectionFramePTS.epoch) = 1036831949;
        HIDWORD(v7->_firstFramePts.epoch) = 1088421888;
        *(_DWORD *)&v7->_stopDetection = 1089260749;
        LOBYTE(v7->_cumulativeEnergyInPocketThreshold) = 1;
        v7->_sbMitigationSessionDurationInSeconds = 5.0;
        v7->_suppressFacedownSetdownAccidentals = 1;
        if (!LOBYTE(v7->_cumulativeEnergyInPocketThreshold)
          || (![MEMORY[0x1E4FA6980] instancesRespondToSelector:sel_initWithBundleIdentifier_callOutQueue_]? (v7->_sbAccidentalActivationMitigationUsesDetectionQueue = 0, uint64_t v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4FA6980]), "initWithBundleIdentifier:", a4)): (v7->_sbAccidentalActivationMitigationUsesDetectionQueue = 1, uint64_t v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4FA6980]), "initWithBundleIdentifier:callOutQueue:", a4, v7->_detectionQueue)), (v7->_sbAccidentalActivationMitigationClientSession = (SBSAccidentalActivationMitigationClientSession *)v14) != 0))
        {
          v7->_suppressionStateStrings = (NSArray *)&unk_1EFB02C78;
          return v7;
        }
      }
    }
LABEL_13:
    FigDebugAssert3();

    return 0;
  }
  return v7;
}

void __71__BWPocketDetectionNode_initWithMetalCommandQueue_clientApplicationID___block_invoke(uint64_t a1, int a2, int a3, double a4)
{
  uint64_t v7 = [*(id *)(a1 + 32) referencedObject];
  os_unfair_lock_lock((os_unfair_lock_t)(v7 + 128));
  *(_DWORD *)(v7 + 104) = a2;
  *(double *)(v7 + 112) = a4;
  *(_DWORD *)(v7 + 120) = a3;
  os_unfair_lock_unlock((os_unfair_lock_t)(v7 + 128));
}

- (void)dealloc
{
  if (self->_resourcesAllocated) {
    [(BWPocketDetectionNode *)self _cleanupResources];
  }

  if (LOBYTE(self->_cumulativeEnergyInPocketThreshold)) {
  v3.receiver = self;
  }
  v3.super_class = (Class)BWPocketDetectionNode;
  [(BWNode *)&v3 dealloc];
}

- (id)nodeType
{
  return @"Effect";
}

- (id)nodeSubType
{
  return @"PocketDetection";
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ([(BWVideoFormat *)[(BWNodeInput *)self->super._input videoFormat] width] < 0x2D0
    || [(BWVideoFormat *)[(BWNodeInput *)self->super._input videoFormat] height] <= 0x2CF)
  {
    if (dword_1E96B6C48)
    {
      int v9 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    LOBYTE(self->_detectionEnabledDurationInSeconds) = 1;
  }
  if (dword_1E96B6C48)
  {
    int v9 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v4 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  [(BWCoreMotionSuppressionStateMonitor *)self->_coreMotionSuppressionStateMonitor start];
  v7.receiver = self;
  v7.super_class = (Class)BWPocketDetectionNode;
  [(BWNode *)&v7 prepareForCurrentConfigurationToBecomeLive];
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (void *)CMGetAttachment(a3, @"CaptureInitiatedOnce", 0);
  if (!LOBYTE(self->_detectionEnabledDurationInSeconds))
  {
    if ([v6 BOOLValue])
    {
      LOBYTE(self->_detectionEnabledDurationInSeconds) = 1;
      self->_inPocketConsolidatedDecision = 0;
      self->_ppsData.inPocket = 0;
      if (dword_1E96B6C48)
      {
        LODWORD(sampleBufferOut) = 0;
        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
        os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
    }
    memset(&v29, 0, sizeof(v29));
    CMSampleBufferGetPresentationTimeStamp(&v29, a3);
    p_previousDetectionComplete = &self->_previousDetectionComplete;
    if ((self->_firstFramePts.timescale & 1) == 0)
    {
      *(_OWORD *)p_previousDetectionComplete = *(_OWORD *)&v29.value;
      *(void *)&self->_firstFramePts.flags = v29.epoch;
      self->_ppsData.detectionSessionStartTime = CFAbsoluteTimeGetCurrent();
    }
    memset(&v28, 0, sizeof(v28));
    CMTimeMakeWithSeconds(&v28, 4.0, v29.timescale);
    CMTime lhs = v29;
    *(_OWORD *)&rhs.value = *(_OWORD *)p_previousDetectionComplete;
    rhs.epoch = *(void *)&self->_firstFramePts.flags;
    CMTimeSubtract(&time1, &lhs, &rhs);
    CMTime lhs = v28;
    if (CMTimeCompare(&time1, &lhs) >= 1)
    {
      if (!self->_resourcesAllocated)
      {
        *(CMTime *)(&self->_inPocketConsolidatedDecision + 4) = v29;
        LOBYTE(self->_detectionIntervalInSeconds) = 0;
        detectionQueue = self->_detectionQueue;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __53__BWPocketDetectionNode_renderSampleBuffer_forInput___block_invoke;
        block[3] = &unk_1E5C24430;
        block[4] = self;
        dispatch_async(detectionQueue, block);
        self->_resourcesAllocated = 1;
      }
      memset(&v25, 0, sizeof(v25));
      CMTimeMakeWithSeconds(&v25, *((float *)&self->_firstFramePts.epoch + 1), v29.timescale);
      CMTime lhs = v29;
      *(_OWORD *)&rhs.value = *(_OWORD *)p_previousDetectionComplete;
      rhs.epoch = *(void *)&self->_firstFramePts.flags;
      CMTimeSubtract(&v24, &lhs, &rhs);
      CMTime lhs = v25;
      if (CMTimeCompare(&v24, &lhs) >= 1)
      {
        LOBYTE(self->_detectionEnabledDurationInSeconds) = 1;
        self->_ppsData.inPocket = self->_inPocketConsolidatedDecision;
        if (dword_1E96B6C48)
        {
          LODWORD(sampleBufferOut) = 0;
          os_log_type_t type = OS_LOG_TYPE_DEFAULT;
          uint64_t v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v10, type);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        if (LOBYTE(self->_cumulativeEnergyInPocketThreshold) && self->_inPocketConsolidatedDecision)
        {
          v11 = self->_detectionQueue;
          if (self->_sbAccidentalActivationMitigationUsesDetectionQueue)
          {
            uint64_t v12 = v23;
            v23[0] = MEMORY[0x1E4F143A8];
            v23[1] = 3221225472;
            v13 = __53__BWPocketDetectionNode_renderSampleBuffer_forInput___block_invoke_41;
          }
          else
          {
            uint64_t v12 = v22;
            v22[0] = MEMORY[0x1E4F143A8];
            v22[1] = 3221225472;
            v13 = __53__BWPocketDetectionNode_renderSampleBuffer_forInput___block_invoke_42;
          }
          v12[2] = v13;
          v12[3] = &unk_1E5C24430;
          v12[4] = self;
          dispatch_async(v11, v12);
        }
      }
      memset(&v21, 0, sizeof(v21));
      CMTime lhs = v29;
      CMTime rhs = *(CMTime *)(&self->_inPocketConsolidatedDecision + 4);
      CMTimeSubtract(&v21, &lhs, &rhs);
      memset(&v20, 0, sizeof(v20));
      CMTimeMakeWithSeconds(&v20, *((float *)&self->_lastDetectionFramePTS.epoch + 1), v29.timescale);
      CMTime lhs = v21;
      CMTime rhs = v20;
      if (CMTimeCompare(&lhs, &rhs) >= 1
        && !LOBYTE(self->_detectionEnabledDurationInSeconds)
        && LOBYTE(self->_detectionIntervalInSeconds))
      {
        LOBYTE(self->_detectionIntervalInSeconds) = 0;
        *(CMTime *)(&self->_inPocketConsolidatedDecision + 4) = v29;
        lhs.value = 0;
        rhs.value = 0;
        BWOverCaptureSampleBufferUnpackAndRetain(a3, 0, &rhs, (CFTypeRef *)&lhs, 0, 0);
        value = (opaqueCMSampleBuffer *)lhs.value;
        if (rhs.value
          && objc_msgSend((id)objc_msgSend((id)CMGetAttachment((CMAttachmentBearerRef)rhs.value, (CFStringRef)*MEMORY[0x1E4F53070], 0), "objectForKeyedSubscript:", *MEMORY[0x1E4F542E0]), "BOOLValue"))
        {
          value = (opaqueCMSampleBuffer *)rhs.value;
        }
        CMSampleBufferRef sampleBufferOut = 0;
        BWCMSampleBufferCreateCopyIncludingMetadata(value, &sampleBufferOut);
        v15 = self->_detectionQueue;
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __53__BWPocketDetectionNode_renderSampleBuffer_forInput___block_invoke_43;
        v18[3] = &unk_1E5C24F10;
        v18[4] = self;
        v18[5] = sampleBufferOut;
        dispatch_async(v15, v18);
        if (lhs.value) {
          CFRelease((CFTypeRef)lhs.value);
        }
        if (rhs.value) {
          CFRelease((CFTypeRef)rhs.value);
        }
      }
    }
  }
  -[BWNodeOutput emitSampleBuffer:](self->super._output, "emitSampleBuffer:", a3, v16, v17);
}

uint64_t __53__BWPocketDetectionNode_renderSampleBuffer_forInput___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _allocateResources];
  *(unsigned char *)(*(void *)(a1 + 32) + 200) = 1;
  return result;
}

uint64_t __53__BWPocketDetectionNode_renderSampleBuffer_forInput___block_invoke_41(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  double v3 = *(double *)(v2 + 264);
  if (dword_1E96B6C48)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    uint64_t v2 = *(void *)(a1 + 32);
  }
  objc_msgSend(*(id *)(v2 + 248), "addObserver:", v6, v7);
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 248) activateSessionWithDuration:0 accidentalActivationMitigationSessionCancellationPolicyClassName:v3];
  *(unsigned char *)(*(void *)(a1 + 32) + 257) = 1;
  return result;
}

void __53__BWPocketDetectionNode_renderSampleBuffer_forInput___block_invoke_42(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__BWPocketDetectionNode_renderSampleBuffer_forInput___block_invoke_2;
  block[3] = &unk_1E5C24430;
  block[4] = *(void *)(a1 + 32);
  dispatch_sync(MEMORY[0x1E4F14428], block);
}

uint64_t __53__BWPocketDetectionNode_renderSampleBuffer_forInput___block_invoke_2(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  double v3 = *(double *)(v2 + 264);
  if (dword_1E96B6C48)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    uint64_t v2 = *(void *)(a1 + 32);
  }
  objc_msgSend(*(id *)(v2 + 248), "addObserver:", v6, v7);
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 248) activateSessionWithDuration:0 accidentalActivationMitigationSessionCancellationPolicyClassName:v3];
  *(unsigned char *)(*(void *)(a1 + 32) + 257) = 1;
  return result;
}

void __53__BWPocketDetectionNode_renderSampleBuffer_forInput___block_invoke_43(uint64_t a1)
{
  uint64_t v2 = *(unsigned char **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  if (v2[232])
  {
    if (v3) {
      CFRelease(*(CFTypeRef *)(a1 + 40));
    }
  }
  else
  {
    [v2 _detectPocket:v3];
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 200) = 1;
}

- (void)didReachEndOfDataForInput:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [(BWCoreMotionSuppressionStateMonitor *)self->_coreMotionSuppressionStateMonitor stop];
  [(BWPocketDetectionNode *)self _waitForDetectionToComplete];
  if (LOBYTE(self->_cumulativeEnergyInPocketThreshold))
  {
    if (self->_sbAccidentalActivationMitigationUsesDetectionQueue) {
      detectionQueue = self->_detectionQueue;
    }
    else {
      detectionQueue = MEMORY[0x1E4F14428];
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__BWPocketDetectionNode_didReachEndOfDataForInput___block_invoke;
    block[3] = &unk_1E5C24430;
    block[4] = self;
    dispatch_sync(detectionQueue, block);
  }
  if ([(SBSAccidentalActivationMitigationClientSession *)self->_sbAccidentalActivationMitigationClientSession state] == 3&& dword_1E96B6C48 != 0)
  {
    int v10 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  self->_ppsData.detectionSessionStopTime = CFAbsoluteTimeGetCurrent();
  long long v13 = *(_OWORD *)&self->_ppsData.detectionSessionStartTime;
  uint64_t v14 = *(void *)&self->_ppsData.inPocket;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __pdn_sendPPSData_block_invoke;
  v12[3] = &__block_descriptor_56_e5_v8__0l;
  dispatch_async(MEMORY[0x1E4F14428], v12);
  v8.receiver = self;
  v8.super_class = (Class)BWPocketDetectionNode;
  [(BWNode *)&v8 didReachEndOfDataForInput:a3];
}

uint64_t __51__BWPocketDetectionNode_didReachEndOfDataForInput___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (*(unsigned char *)(v1 + 257)) {
    return objc_msgSend(*(id *)(v1 + 248), "removeObserver:");
  }
  return result;
}

- (int)_detectPocket:(opaqueCMSampleBuffer *)a3
{
  ImageBuffer = CMSampleBufferGetImageBuffer(a3);
  uint64_t v6 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  CGFloat v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  rect.origin.x = *(CGFloat *)MEMORY[0x1E4F1DB28];
  rect.origin.y = v7;
  rect.size.width = (double)CVPixelBufferGetWidth(ImageBuffer);
  rect.size.height = (double)CVPixelBufferGetHeight(ImageBuffer);
  CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)[v6 objectForKeyedSubscript:*MEMORY[0x1E4F54370]], &rect);
  float v12 = 0.0;
  -[BWPocketDetectionFFTProcessor processFFTOnInputPixelBuffer:usingSourceRect:cumulativeScoreOut:](self->_fftProcessor, "processFFTOnInputPixelBuffer:usingSourceRect:cumulativeScoreOut:", ImageBuffer, &v12, rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
  self->_cumulativeEnergy = log10f(v12);
  if ([(NSMutableArray *)self->_cumulativeEnergyHistory count] == self->_cumulativeEnergyHistoryLength) {
    [(NSMutableArray *)self->_cumulativeEnergyHistory removeObjectAtIndex:0];
  }
  *(float *)&double v8 = self->_cumulativeEnergy;
  -[NSMutableArray addObject:](self->_cumulativeEnergyHistory, "addObject:", [NSNumber numberWithFloat:v8]);
  objc_msgSend((id)-[NSMutableArray valueForKeyPath:](self->_cumulativeEnergyHistory, "valueForKeyPath:", @"@max.floatValue"), "floatValue");
  self->_cumulativeEnergyFiltered = v9;
  if (self->_coreMotionSuppressionState != 1) {
    goto LABEL_9;
  }
  if ((unint64_t)[(NSMutableArray *)self->_cumulativeEnergyHistory count] >= 5
    && self->_cumulativeEnergyFiltered < *(float *)&self->_stopDetection)
  {
    goto LABEL_8;
  }
  BOOL suppressFacedownSetdownAccidentals = self->_suppressFacedownSetdownAccidentals;
  if (!suppressFacedownSetdownAccidentals) {
    goto LABEL_10;
  }
  if (self->_coreMotionFacedownState == 1) {
LABEL_8:
  }
    BOOL suppressFacedownSetdownAccidentals = 1;
  else {
LABEL_9:
  }
    BOOL suppressFacedownSetdownAccidentals = 0;
LABEL_10:
  self->_inPocketConsolidatedDecision = suppressFacedownSetdownAccidentals;
  if (a3) {
    CFRelease(a3);
  }
  return 0;
}

- (void)accidentalActivationMitigationSessionStateDidChange:(id)a3
{
  uint64_t v3 = [(SBSAccidentalActivationMitigationClientSession *)self->_sbAccidentalActivationMitigationClientSession state];
  if (v3 == 3)
  {
    if (!dword_1E96B6C48) {
      return;
    }
    goto LABEL_9;
  }
  if (v3 == 2)
  {
    if (!dword_1E96B6C48) {
      return;
    }
    goto LABEL_9;
  }
  if (v3 == 1 && dword_1E96B6C48)
  {
LABEL_9:
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

- (void)_waitForDetectionToComplete
{
}

- (int)_allocateResources
{
  int v4 = [(BWPocketDetectionFFTProcessor *)self->_fftProcessor allocateResources];
  int v5 = v4;
  if (!self->_fftProcessor)
  {
    uint64_t v8 = v2;
    LODWORD(v7) = 0;
    FigDebugAssert3();
    if (!v5) {
      return v5;
    }
    goto LABEL_3;
  }
  if (v4) {
LABEL_3:
  }
    [(BWPocketDetectionNode *)self _cleanupResources];
  return v5;
}

- (void)_cleanupResources
{
  self->_resourcesAllocated = 0;
}

@end