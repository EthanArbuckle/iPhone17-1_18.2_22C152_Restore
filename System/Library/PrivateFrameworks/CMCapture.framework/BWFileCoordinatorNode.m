@interface BWFileCoordinatorNode
+ (void)initialize;
- (BOOL)flagsLastFrameForVideoCompressor;
- (BOOL)updateStopPTS:(id *)a3 audioOffset:(id *)a4 previousStopPTS:(id *)a5 previousAudioOffset:(id *)a6;
- (BWFileCoordinatorNode)init;
- (BWFileCoordinatorNode)initWithNumberOfVideoInputs:(unint64_t)a3 numberOfAudioInputs:(unint64_t)a4 numberOfMetadataInputs:(unint64_t)a5 numberOfActionOnlyOutputs:(unint64_t)a6 overCaptureEnabled:(BOOL)a7 allowLowLatencyWhenPossible:(BOOL)a8 useTrueVideoFileRecordingStaging:(BOOL)a9 motionDataTimeMachine:(id)a10;
- (CMSampleBufferRef)_createEmptyMetadataSBufWithPTS:(uint64_t)a3 forInputIndex:;
- (const)_addFlushingFutureCinematicMetadataToSampleBuffer:(const void *)result;
- (dispatch_semaphore_t)_setupStateForWaitingForRecordingStop;
- (id)_emitStagedBufferForIndex:(id *)result stoppingOrPausing:(uint64_t)a2;
- (id)audioSourceDelegate;
- (id)fileCoordiatorStatusDelegate;
- (id)nodeSubType;
- (id)nodeType;
- (int)cinematicLookAheadFrameCount;
- (int)startRecordingWithSettings:(id)a3 videoSettings:(id)a4 maxFrameRate:(float)a5 stopAtPTS:(id *)a6 startAfterPTS:(id *)a7;
- (opaqueCMSampleBuffer)_copyFirstValidLowLatencyAudioBuffer:(uint64_t)a3 inputIndex:(CMTime *)a4 sbufPTS:;
- (uint64_t)_cinematicFutureMetadataForFlushingSampleBuffer:(uint64_t)result;
- (uint64_t)_clearPendingIrisRequestMarkerBuffers;
- (uint64_t)_completeTransitionToNotRecording;
- (uint64_t)_emitMarkerBufferForFileWriterAction:(CMTime *)a3 withPTS:(const void *)a4 settings:(uint64_t)a5 settingsID:(uint64_t)a6 errorCode:;
- (uint64_t)_emitSampleBuffer:(void *)a3 forInput:(void *)a4 toOutput:;
- (uint64_t)_flushPendingIrisRequestMarkerBuffers;
- (uint64_t)_flushSampleBuffersWaitingForMotionData;
- (uint64_t)_prepareToResumeRecording;
- (uint64_t)_prepareToStartRecordingWithSettings:(void *)a3 videoSettings:(float)a4 maxFrameRate:;
- (uint64_t)_sendPrefersNoInterruptionsByRingtonesAndAlertsNotificationWithState:(uint64_t)result;
- (unint64_t)_earliestPTSStagedForRecording:(int)a3@<W2> factorInAudioDuration:(uint64_t)a4@<X8>;
- (unint64_t)_flushAllBuffersFromRecordingStagingQueues;
- (unint64_t)_flushBuffersFromRecordingStagingQueuesWithPTSCutoff:(int)a3 factorInAudioDuration:;
- (unint64_t)_flushEligibleBuffersFromRecordingStagingQueues;
- (unint64_t)_handleIrisMovieRequest:(uint64_t)a3 input:(uint64_t)a4 sbuf:;
- (unint64_t)_updateRecordingStateWithIrisMovieRequest:(unint64_t)result;
- (void)_addLookAheadMotionDataToMetadataForSampleBuffer:(void *)a3 lookAheadMotionData:;
- (void)_doStartingToRecordWithSBuf:(unint64_t)a3 inputIndex:(uint64_t)a4 sbufPTS:;
- (void)_doStoppingOrPausingWithSBuf:(unint64_t)a3 inputIndex:(uint64_t)a4 sbufPTS:;
- (void)_emitOrQueueSampleBuffer:(uint64_t)a1 forInput:(CMSampleBufferRef)sbuf toOutput:(void *)a3 stoppingOrPausing:(void *)a4;
- (void)_emitSampleBuffersWaitingForMotionData;
- (void)_ensureLuxMetadata:(uint64_t)a3 forNodeInputIndex:;
- (void)_finishStoppingOrPausing:(uint64_t)a3 withErrorCode:;
- (void)_irisMovieInfosFromPendingIrisRequestMarkerBuffers;
- (void)_performFlushAction;
- (void)_prepareOverCaptureVideoBufferForEmission:(const void *)a3 emissionTimeStamp:;
- (void)_releaseSettings;
- (void)_renderSampleBuffer:(void *)a3 forInput:;
- (void)_stopRecordingWithErrorCode:(uint64_t)a1;
- (void)cancelStartRecordingWithSettings:(id)a3;
- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5;
- (void)dealloc;
- (void)didReachEndOfDataForInput:(id)a3;
- (void)didSelectFormat:(id)a3 forInput:(id)a4;
- (void)handleDroppedSample:(id)a3 forInput:(id)a4;
- (void)pauseRecording;
- (void)recordingTerminated:(int64_t)a3;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
- (void)resumeRecording;
- (void)setAudioSourceDelegate:(id)a3;
- (void)setCinematicLookAheadFrameCount:(int)a3;
- (void)setFileCoordiatorStatusDelegate:(id)a3;
- (void)setFlagsLastFrameForVideoCompressor:(BOOL)a3;
- (void)stopRecordingWithErrorCode:(int)a3 setupToAllowWaitingForRecordingToStop:(BOOL)a4;
- (void)tryToEmitFramesWaitingForMotion;
- (void)waitForRecordingToStopWithTimeout:(float)a3;
@end

@implementation BWFileCoordinatorNode

- (id)nodeType
{
  return @"Effect";
}

- (void)setFlagsLastFrameForVideoCompressor:(BOOL)a3
{
  self->_flagsLastFrameForVideoCompressor = a3;
}

- (void)setFileCoordiatorStatusDelegate:(id)a3
{
  self->_fileCoordiatorStatusDelegate = (BWNodeFileCoordinatorStatusDelegate *)a3;
}

- (void)setAudioSourceDelegate:(id)a3
{
  self->_audioSourceDelegate = (BWAudioSourceRecordingReadinessDelegate *)a3;
}

- (void)setCinematicLookAheadFrameCount:(int)a3
{
  if (self->_motionDataTimeMachine)
  {
    if (a3 <= 0)
    {
      v3 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v4 = *MEMORY[0x1E4F1C3C8];
      v5 = @"Motion data time machine use must have a positive non-zero lookahead requirement";
      goto LABEL_7;
    }
  }
  else if (a3)
  {
    v3 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v4 = *MEMORY[0x1E4F1C3C8];
    v5 = @"Motion data lookahead requirement must be zero when not using a motion data time machine";
LABEL_7:
    objc_exception_throw((id)[v3 exceptionWithName:v4 reason:v5 userInfo:0]);
  }
  self->_cinematicLookAheadFrameCount = a3;
}

- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5
{
  unint64_t v7 = objc_msgSend(a5, "index", a3);
  if (a4)
  {
    v8 = (const opaqueCMFormatDescription *)[a4 formatDescription];
    if (v8)
    {
      v9 = v8;
      unint64_t numVideoInputs = self->_numVideoInputs;
      if (numVideoInputs) {
        BOOL v11 = v7 >= numVideoInputs;
      }
      else {
        BOOL v11 = 1;
      }
      if (v11)
      {
        unint64_t numAudioInputs = self->_numAudioInputs;
        if (v7 >= numAudioInputs + numVideoInputs || numAudioInputs == 0) {
          int v16 = 1835365473;
        }
        else {
          int v16 = 1936684398;
        }
      }
      else
      {
        int v16 = 1986618469;
      }
      if (CMFormatDescriptionGetMediaType(v8) != v16) {
        objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Description has invalid media type for input" userInfo:0]);
      }
      formatDescriptionsForInputs = self->_formatDescriptionsForInputs;
      v15 = formatDescriptionsForInputs[v7];
      formatDescriptionsForInputs[v7] = v9;
      CFRetain(v9);
      if (v15) {
        goto LABEL_18;
      }
    }
    else
    {
      v14 = self->_formatDescriptionsForInputs;
      v15 = v14[v7];
      v14[v7] = 0;
      if (v15) {
LABEL_18:
      }
        CFRelease(v15);
    }
  }
  v18 = [(BWNode *)self outputs];
  objc_msgSend(-[NSArray objectAtIndex:](v18, "objectAtIndex:", v7), "makeConfiguredFormatLive");
  if (self->_masterInputIndex == v7)
  {
    for (unint64_t i = self->_numAudioInputs + self->_numVideoInputs + self->_numMetadataInputs; i < self->_numOutputs; ++i)
      objc_msgSend(-[NSArray objectAtIndexedSubscript:](v18, "objectAtIndexedSubscript:", i), "makeConfiguredFormatLive");
  }
}

- (BWFileCoordinatorNode)initWithNumberOfVideoInputs:(unint64_t)a3 numberOfAudioInputs:(unint64_t)a4 numberOfMetadataInputs:(unint64_t)a5 numberOfActionOnlyOutputs:(unint64_t)a6 overCaptureEnabled:(BOOL)a7 allowLowLatencyWhenPossible:(BOOL)a8 useTrueVideoFileRecordingStaging:(BOOL)a9 motionDataTimeMachine:(id)a10
{
  unint64_t v10 = a4 + a3 + a5;
  if (!v10)
  {
    v41 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v42 = *MEMORY[0x1E4F1C3C8];
    v43 = @"Need at least 1 input";
    goto LABEL_46;
  }
  BOOL v11 = a8;
  unint64_t v14 = a4;
  unint64_t v15 = a3;
  if (a3 != 1 && a10)
  {
    v41 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v42 = *MEMORY[0x1E4F1C3C8];
    v43 = @"Motion data time machine use must have one and only one video input";
LABEL_46:
    objc_exception_throw((id)objc_msgSend(v41, "exceptionWithName:reason:userInfo:", v42, v43, 0, a6, a7, a8));
  }
  v52.receiver = self;
  v52.super_class = (Class)BWFileCoordinatorNode;
  int v16 = [(BWNode *)&v52 init];
  if (!v16) {
    return v16;
  }
  BOOL v44 = a7;
  size_t count = v10;
  v17 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:v10];
  if (a9) {
    int v18 = 3;
  }
  else {
    int v18 = 0;
  }
  BOOL v46 = v11;
  unsigned int v47 = v18;
  unint64_t v19 = 0x1E5C1E000;
  unint64_t v51 = v15;
  unint64_t v45 = a6;
  unint64_t v49 = v14;
  if (v14 && v15 && a9)
  {
    v20 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:count];
    goto LABEL_13;
  }
  v20 = 0;
  if (v15)
  {
LABEL_13:
    uint64_t v21 = 0;
    do
    {
      v22 = [[BWNodeInput alloc] initWithMediaType:1986618469 node:v16 index:v21];
      v23 = objc_alloc_init(BWVideoFormatRequirements);
      [(BWNodeInput *)v22 setFormatRequirements:v23];

      [(BWNodeInput *)v22 setPassthroughMode:1];
      [(BWNodeInput *)v22 setDelayedBufferCount:v47];
      [(BWNode *)v16 addInput:v22];
      v24 = [[BWNodeOutput alloc] initWithMediaType:1986618469 node:v16];
      v25 = objc_alloc_init(BWVideoFormatRequirements);
      [(BWNodeOutput *)v24 setFormatRequirements:v25];
      [(BWNodeOutput *)v24 setPassthroughMode:1];
      [(BWNodeOutput *)v24 setIndexOfInputWhichDrivesThisOutput:v21];

      [(BWNode *)v16 addOutput:v24];
      objc_msgSend(v17, "addObject:", objc_msgSend(MEMORY[0x1E4F1CA48], "array"));
      objc_msgSend(v20, "addObject:", objc_msgSend(MEMORY[0x1E4F1CA48], "array"));
      ++v21;

      unint64_t v15 = v51;
    }
    while (v51 != v21);
    unint64_t v14 = v49;
    unint64_t v19 = 0x1E5C1E000uLL;
  }
  unint64_t v26 = v15;
  if (v14)
  {
    unint64_t v27 = v49;
    unint64_t v26 = v51;
    do
    {
      v28 = [[BWNodeInput alloc] initWithMediaType:1936684398 node:v16 index:v26];
      [(BWNode *)v16 addInput:v28];
      v29 = (void *)[objc_alloc(*(Class *)(v19 + 3176)) initWithMediaType:1936684398 node:v16];
      [(BWNode *)v16 addOutput:v29];
      objc_msgSend(v17, "addObject:", objc_msgSend(MEMORY[0x1E4F1CA48], "array"));
      objc_msgSend(v20, "addObject:", objc_msgSend(MEMORY[0x1E4F1CA48], "array"));
      ++v26;

      --v27;
    }
    while (v27);
  }
  if (a5)
  {
    unint64_t v30 = a5;
    do
    {
      v31 = [[BWNodeInput alloc] initWithMediaType:1835365473 node:v16 index:v26];
      [(BWNode *)v16 addInput:v31];
      v32 = (void *)[objc_alloc(*(Class *)(v19 + 3176)) initWithMediaType:1835365473 node:v16];
      [(BWNode *)v16 addOutput:v32];
      objc_msgSend(v17, "addObject:", objc_msgSend(MEMORY[0x1E4F1CA48], "array"));
      objc_msgSend(v20, "addObject:", objc_msgSend(MEMORY[0x1E4F1CA48], "array"));
      ++v26;

      --v30;
    }
    while (v30);
  }
  [(BWNode *)v16 setSupportsConcurrentLiveInputCallbacks:1];
  if (v45)
  {
    unint64_t v33 = v45;
    do
    {
      v34 = (void *)[objc_alloc(*(Class *)(v19 + 3176)) initWithMediaType:1835365473 node:v16];
      [(BWNode *)v16 addOutput:v34];

      --v33;
    }
    while (v33);
  }
  v35 = (const opaqueCMFormatDescription **)malloc_type_calloc(count, 8uLL, 0x6004044C4A2DFuLL);
  v16->_formatDescriptionsForInputs = v35;
  if (v35)
  {
    v16->_masterInputIndex = 0;
    v16->_masterInput = (BWNodeInput *)[(NSArray *)[(BWNode *)v16 inputs] objectAtIndex:v16->_masterInputIndex];
    uint64_t v36 = 0x7FFFFFFFFFFFFFFFLL;
    if (v49) {
      uint64_t v36 = v51;
    }
    v16->_firstAudioInputIndex = v36;
    v16->_stagingQueues = (NSArray *)v17;
    v16->_recordingStagingQueues = (NSArray *)v20;
    v16->_recordingStagingQueueLimitForVideo = v47;
    v16->_pendingIrisRequestMarkerBuffers = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v16->_numInputs = count;
    v16->_numOutputs = count + v45;
    v16->_size_t numVideoInputs = v51;
    v16->_unint64_t numAudioInputs = v49;
    v16->_numMetadataInputs = a5;
    v16->_numActionOnlyOutputs = v45;
    v16->_stateMutex = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
    BOOL v37 = v44;
    if (!v51) {
      BOOL v37 = 0;
    }
    v16->_overCaptureEnabled = v37;
    BOOL v38 = v46 && v16->_numVideoInputs == 1 && v16->_numAudioInputs == 1 && v16->_masterInputIndex == 0;
    v16->_lowLatencyModeEnabled = v38;
    if (a10)
    {
      v16->_motionDataTimeMachine = (BWMotionDataTimeMachine *)a10;
      v16->_videoSampleBuffersWaitingForMetadata = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0];
    }
    size_t numVideoInputs = v16->_numVideoInputs;
    if (numVideoInputs)
    {
      v16->_lastSeenLuxMetadata = (id *)malloc_type_calloc(numVideoInputs, 8uLL, 0x80040B8603338uLL);
      v16->_currNumberOfConsecutiveVideoFramesMissingLux = (int *)malloc_type_calloc(v16->_numVideoInputs, 4uLL, 0x100004052888210uLL);
      v16->_maxNumberOfConsecutiveVideoFramesAllowedToBeMissingLux = 4;
    }
    if (initWithNumberOfVideoInputs_numberOfAudioInputs_numberOfMetadataInputs_numberOfActionOnlyOutputs_overCaptureEnabled_allowLowLatencyWhenPossible_useTrueVideoFileRecordingStaging_motionDataTimeMachine__onceToken != -1) {
      dispatch_once(&initWithNumberOfVideoInputs_numberOfAudioInputs_numberOfMetadataInputs_numberOfActionOnlyOutputs_overCaptureEnabled_allowLowLatencyWhenPossible_useTrueVideoFileRecordingStaging_motionDataTimeMachine__onceToken, &__block_literal_global_23);
    }
    v16->_droppedFramesCountDueToISP = 0;
  }
  else
  {

    return 0;
  }
  return v16;
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
  uint64_t v6 = [a4 index];
  unint64_t v7 = [(BWNode *)self outputs];
  objc_msgSend(-[NSArray objectAtIndexedSubscript:](v7, "objectAtIndexedSubscript:", v6), "setFormat:", a3);
  if (self->_masterInputIndex == v6)
  {
    for (unint64_t i = self->_numAudioInputs + self->_numVideoInputs + self->_numMetadataInputs; i < self->_numOutputs; ++i)
      objc_msgSend(-[NSArray objectAtIndexedSubscript:](v7, "objectAtIndexedSubscript:", i), "setFormat:", a3);
  }
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

- (BWFileCoordinatorNode)init
{
  LOBYTE(v3) = 0;
  return [(BWFileCoordinatorNode *)self initWithNumberOfVideoInputs:1 numberOfAudioInputs:0 numberOfMetadataInputs:0 numberOfActionOnlyOutputs:0 overCaptureEnabled:0 allowLowLatencyWhenPossible:1 useTrueVideoFileRecordingStaging:v3 motionDataTimeMachine:0];
}

uint64_t __224__BWFileCoordinatorNode_initWithNumberOfVideoInputs_numberOfAudioInputs_numberOfMetadataInputs_numberOfActionOnlyOutputs_overCaptureEnabled_allowLowLatencyWhenPossible_useTrueVideoFileRecordingStaging_motionDataTimeMachine___block_invoke()
{
  uint64_t result = notify_register_check("com.apple.avcapture.prefersnointerruptionsbyringtonesandalerts", &gPrefersNoInterruptionsByRingtonesAndAlertsToken);
  gValidPrefersNoInterruptionsByRingtonesAndAlertsToken = result == 0;
  if (result)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

- (void)dealloc
{
  -[BWFileCoordinatorNode _releaseSettings]((uint64_t)self);
  emptyMetadataSampleData = self->_emptyMetadataSampleData;
  if (emptyMetadataSampleData) {
    CFRelease(emptyMetadataSampleData);
  }
  formatDescriptionsForInputs = self->_formatDescriptionsForInputs;
  if (formatDescriptionsForInputs)
  {
    unint64_t numInputs = self->_numInputs;
    if (numInputs)
    {
      for (unint64_t i = 0; i < numInputs; ++i)
      {
        unint64_t v7 = self->_formatDescriptionsForInputs[i];
        if (v7)
        {
          CFRelease(v7);
          unint64_t numInputs = self->_numInputs;
        }
      }
      formatDescriptionsForInputs = self->_formatDescriptionsForInputs;
    }
    free(formatDescriptionsForInputs);
  }

  FigSimpleMutexDestroy();
  lastSeenLuxMetadata = self->_lastSeenLuxMetadata;
  if (lastSeenLuxMetadata)
  {
    if (self->_numVideoInputs)
    {
      unint64_t v9 = 0;
      do

      while (self->_numVideoInputs > v9);
      lastSeenLuxMetadata = self->_lastSeenLuxMetadata;
    }
    free(lastSeenLuxMetadata);
  }
  free(self->_currNumberOfConsecutiveVideoFramesMissingLux);
  recordingStoppedSemaphore = self->_recordingStoppedSemaphore;
  if (recordingStoppedSemaphore)
  {
    dispatch_semaphore_signal(recordingStoppedSemaphore);
  }
  v11.receiver = self;
  v11.super_class = (Class)BWFileCoordinatorNode;
  [(BWNode *)&v11 dealloc];
}

- (void)_releaseSettings
{
  if (a1)
  {

    *(void *)(a1 + 112) = 0;
    *(void *)(a1 + 144) = 0;
  }
}

- (id)nodeSubType
{
  return @"FileCoordinator";
}

- (BOOL)flagsLastFrameForVideoCompressor
{
  return self->_flagsLastFrameForVideoCompressor;
}

- (id)audioSourceDelegate
{
  return self->_audioSourceDelegate;
}

- (id)fileCoordiatorStatusDelegate
{
  return self->_fileCoordiatorStatusDelegate;
}

- (int)cinematicLookAheadFrameCount
{
  return self->_cinematicLookAheadFrameCount;
}

- (void)didReachEndOfDataForInput:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = [a3 index];
  pthread_mutex_lock((pthread_mutex_t *)self->_stateMutex);
  v5 = [(BWNode *)self outputs];
  int recordingState = self->_recordingState;
  if (!self->_currSettingsIsIris)
  {
    if (recordingState != 3) {
      goto LABEL_17;
    }
LABEL_16:
    -[BWFileCoordinatorNode _finishStoppingOrPausing:withErrorCode:]((uint64_t)self, 1, 0);
    goto LABEL_17;
  }
  if (recordingState == 4) {
    goto LABEL_5;
  }
  if (recordingState == 3) {
    goto LABEL_16;
  }
  if (recordingState != 1)
  {
LABEL_17:
    objc_msgSend(-[NSArray objectAtIndex:](v5, "objectAtIndex:", v4), "markEndOfLiveOutput");
    if (self->_masterInputIndex == v4)
    {
      for (unint64_t i = self->_numAudioInputs + self->_numVideoInputs + self->_numMetadataInputs; i < self->_numOutputs; ++i)
        objc_msgSend(-[NSArray objectAtIndexedSubscript:](v5, "objectAtIndexedSubscript:", i), "markEndOfLiveOutput");
    }
    if (v4 < self->_numVideoInputs)
    {

      self->_lastSeenLuxMetadata[v4] = 0;
      self->_currNumberOfConsecutiveVideoFramesMissingLux[v4] = 0;
    }
    goto LABEL_26;
  }
LABEL_5:
  if (self->_masterInputIndex == v4)
  {
    -[BWFileCoordinatorNode _flushAllBuffersFromRecordingStagingQueues]((unint64_t)self);
    -[BWFileCoordinatorNode _performFlushAction]((uint64_t)self);
    idleInputIndicesWaitingForFlush = self->_idleInputIndicesWaitingForFlush;
    if (idleInputIndicesWaitingForFlush)
    {
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      uint64_t v8 = [(NSMutableArray *)idleInputIndicesWaitingForFlush countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v15;
        do
        {
          for (uint64_t j = 0; j != v9; ++j)
          {
            if (*(void *)v15 != v10) {
              objc_enumerationMutation(idleInputIndicesWaitingForFlush);
            }
            objc_msgSend(-[NSArray objectAtIndex:](v5, "objectAtIndex:", objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * j), "unsignedIntegerValue")), "markEndOfLiveOutput");
          }
          uint64_t v9 = [(NSMutableArray *)idleInputIndicesWaitingForFlush countByEnumeratingWithState:&v14 objects:v18 count:16];
        }
        while (v9);
      }

      self->_idleInputIndicesWaitingForFlush = 0;
    }
    goto LABEL_17;
  }
  v13 = self->_idleInputIndicesWaitingForFlush;
  if (!v13)
  {
    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    self->_idleInputIndicesWaitingForFlush = v13;
  }
  -[NSMutableArray addObject:](v13, "addObject:", [NSNumber numberWithUnsignedInteger:v4]);
LABEL_26:
  pthread_mutex_unlock((pthread_mutex_t *)self->_stateMutex);
}

- (unint64_t)_flushAllBuffersFromRecordingStagingQueues
{
  if (result)
  {
    unint64_t v1 = result;
    if (dword_1EB4C5030)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    uint64_t v3 = (CMTime *)MEMORY[0x1E4F1FA10];
    -[BWFileCoordinatorNode _flushBuffersFromRecordingStagingQueuesWithPTSCutoff:factorInAudioDuration:](v1, MEMORY[0x1E4F1FA10], 1);
    return -[BWFileCoordinatorNode _flushBuffersFromRecordingStagingQueuesWithPTSCutoff:factorInAudioDuration:](v1, v3, 0);
  }
  return result;
}

- (void)_performFlushAction
{
  if (a1)
  {
    uint64_t v2 = *(void *)(a1 + 120);
    -[BWFileCoordinatorNode _flushSampleBuffersWaitingForMotionData](a1);
    -[BWFileCoordinatorNode _completeTransitionToNotRecording](a1);
    -[BWFileCoordinatorNode _emitMarkerBufferForFileWriterAction:withPTS:settings:settingsID:errorCode:](a1, @"Flush", MEMORY[0x1E4F1FA08], 0, v2, 0);
    -[BWFileCoordinatorNode _releaseSettings](a1);
    *(unsigned char *)(a1 + 569) = 0;
  }
}

- (void)_finishStoppingOrPausing:(uint64_t)a3 withErrorCode:
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    int v5 = *(_DWORD *)(a1 + 156);
    uint64_t v6 = *(void *)(a1 + 120);
    if (a2)
    {
      if (v5 == 3)
      {
        if (dword_1EB4C5030)
        {
          int v24 = 0;
          os_log_type_t type = OS_LOG_TYPE_DEFAULT;
          os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && [*(id *)(a1 + 112) isIrisRecording])
        {
          uint64_t v9 = -[BWFileCoordinatorNode _irisMovieInfosFromPendingIrisRequestMarkerBuffers](a1);
          id v10 = 0;
        }
        else
        {
          id v10 = *(id *)(a1 + 112);
          uint64_t v9 = 0;
        }
        -[BWFileCoordinatorNode _clearPendingIrisRequestMarkerBuffers](a1);
        a3 = 4294950878;
        [*(id *)(a1 + 720) fileCoordinator:a1 stoppedBeforeStartedRecordingForSettings:v10 pendingIrisMovieInfos:v9 errorCode:4294950878];
      }
      -[BWFileCoordinatorNode _completeTransitionToNotRecording](a1);
    }
    else
    {
      if (*(unsigned char *)(a1 + 140)) {
        BOOL v8 = gValidPrefersNoInterruptionsByRingtonesAndAlertsToken == 0;
      }
      else {
        BOOL v8 = 1;
      }
      if (!v8) {
        -[BWFileCoordinatorNode _sendPrefersNoInterruptionsByRingtonesAndAlertsNotificationWithState:](a1, 0);
      }
      *(_DWORD *)(a1 + 156) = 2;
    }
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    objc_super v11 = *(void **)(a1 + 96);
    uint64_t v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v25, 16, v17, v18);
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(v11);
          }
          [*(id *)(*((void *)&v19 + 1) + 8 * i) removeAllObjects];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v25 count:16];
      }
      while (v13);
    }
    [*(id *)(a1 + 736) removeAllObjects];
    *(void *)(a1 + 752) = 0;
    *(void *)(a1 + 760) = 0;
    if (v5 == 4 || v5 == 2)
    {
      v26[0] = *(CMTime *)(a1 + 360);
      -[BWFileCoordinatorNode _emitMarkerBufferForFileWriterAction:withPTS:settings:settingsID:errorCode:](a1, @"Stop", v26, 0, v6, a3);
      if (*(unsigned char *)(a1 + 824))
      {
        long long v16 = *(NSObject **)(a1 + 816);
        if (v16) {
          dispatch_semaphore_signal(v16);
        }
        *(unsigned char *)(a1 + 824) = 0;
      }
    }
    else if (v5 != 3)
    {
      v26[0] = *(CMTime *)(a1 + 360);
      -[BWFileCoordinatorNode _emitMarkerBufferForFileWriterAction:withPTS:settings:settingsID:errorCode:](a1, @"Pause", v26, 0, v6, a3);
    }
    -[BWFileCoordinatorNode _releaseSettings](a1);
  }
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  unint64_t v7 = [a4 index];
  pthread_mutex_lock((pthread_mutex_t *)self->_stateMutex);
  if (BWSampleBufferIsMarkerBuffer(a3) && (BOOL v8 = (void *)CMGetAttachment(a3, @"IrisMovieRequest", 0)) != 0)
  {
    if (self->_recordingState == 3)
    {
      -[BWFileCoordinatorNode _updateRecordingStateWithIrisMovieRequest:]((unint64_t)self, v8);
      [(NSMutableArray *)self->_pendingIrisRequestMarkerBuffers addObject:a3];
    }
    else
    {
      -[BWFileCoordinatorNode _handleIrisMovieRequest:input:sbuf:]((unint64_t)self, v8, (uint64_t)a4, (uint64_t)a3);
    }
  }
  else
  {
    if (v7 < self->_numVideoInputs)
    {
      FigCaptureMetadataUtilitiesAdjustValidBufferRectForDarkShadeCropping(a3);
      if (!BWSampleBufferIsMarkerBuffer(a3)) {
        -[BWFileCoordinatorNode _ensureLuxMetadata:forNodeInputIndex:]((uint64_t)self, a3, v7);
      }
    }
    if (self->_recordingState == 1 && self->_recordingStagingQueues && self->_firstAudioHasBeenProcessed)
    {
      memset(&v12, 0, sizeof(v12));
      CMSampleBufferGetPresentationTimeStamp(&v12, a3);
      if (v12.flags)
      {
        objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_recordingStagingQueues, "objectAtIndexedSubscript:", v7), "addObject:", a3);
        -[BWFileCoordinatorNode _flushEligibleBuffersFromRecordingStagingQueues]((unint64_t)self);
        if (v7 < self->_numVideoInputs
          && objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_recordingStagingQueues, "objectAtIndexedSubscript:", v7), "count") > (unint64_t)self->_recordingStagingQueueLimitForVideo)
        {
          uint64_t v9 = (void *)CFRetain((CFTypeRef)objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_recordingStagingQueues, "objectAtIndexedSubscript:", v7), "firstObject"));
          objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_recordingStagingQueues, "objectAtIndexedSubscript:", v7), "removeObjectAtIndex:", 0);
          -[BWFileCoordinatorNode _renderSampleBuffer:forInput:]((uint64_t)self, v9, [(NSArray *)[(BWNode *)self inputs] objectAtIndexedSubscript:v7]);
          memset(&v11, 0, sizeof(v11));
          CMSampleBufferGetPresentationTimeStamp(&v11, (CMSampleBufferRef)v9);
          CFRelease(v9);
          CMTime v10 = v11;
          -[BWFileCoordinatorNode _flushBuffersFromRecordingStagingQueuesWithPTSCutoff:factorInAudioDuration:]((unint64_t)self, &v10, 1);
        }
      }
      else
      {
        -[BWFileCoordinatorNode _flushAllBuffersFromRecordingStagingQueues]((unint64_t)self);
      }
    }
    else
    {
      -[BWFileCoordinatorNode _renderSampleBuffer:forInput:]((uint64_t)self, a3, a4);
    }
  }
  pthread_mutex_unlock((pthread_mutex_t *)self->_stateMutex);
}

- (unint64_t)_updateRecordingStateWithIrisMovieRequest:(unint64_t)result
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    if (a2)
    {
      unint64_t v3 = result;
      -[BWFileCoordinatorNode _flushAllBuffersFromRecordingStagingQueues](result);
      uint64_t result = [a2 isFinalEnqueuedIrisRequest];
      if (result)
      {
        if (dword_1EB4C5030)
        {
          int v10 = 0;
          os_log_type_t type = OS_LOG_TYPE_DEFAULT;
          os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        objc_msgSend(a2, "movieEndingVideoPTS", v5, v6);
        if (v8) {
          [a2 movieEndingVideoPTS];
        }
        else {
          [a2 movieEndTime];
        }
        *(CMTime *)(v3 + 384) = time;
        CMTimeMake(&rhs, 5, 1000);
        CMTime lhs = *(CMTime *)(v3 + 384);
        CMTimeSubtract(&time, &lhs, &rhs);
        *(CMTime *)(v3 + 384) = time;
        uint64_t result = [a2 audioOffset];
        *(CMTime *)(v3 + 408) = time;
        if (*(unsigned char *)(v3 + 420))
        {
          CMTime time = *(CMTime *)(v3 + 408);
          CMTime lhs = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
          uint64_t result = CMTimeCompare(&time, &lhs);
          if ((int)result >= 1) {
            *(unsigned char *)(v3 + 569) = 1;
          }
        }
        *(unsigned char *)(v3 + 769) = 1;
      }
    }
    else
    {
      return FigDebugAssert3();
    }
  }
  return result;
}

- (unint64_t)_handleIrisMovieRequest:(uint64_t)a3 input:(uint64_t)a4 sbuf:
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    unint64_t v4 = result;
    if (*(void *)(result + 8) == a3)
    {
      -[BWFileCoordinatorNode _updateRecordingStateWithIrisMovieRequest:](result, a2);
      if (dword_1EB4C5030)
      {
        os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      return objc_msgSend(*(id *)(v4 + 16), "emitSampleBuffer:", a4, v7, v8);
    }
  }
  return result;
}

- (void)_ensureLuxMetadata:(uint64_t)a3 forNodeInputIndex:
{
  if (a1)
  {
    uint64_t v5 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53070], 0);
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F54068]];
      uint64_t v8 = *(void **)(*(void *)(a1 + 808) + 8 * a3);
      if (v7)
      {
        uint64_t v9 = (void *)v7;

        *(void *)(*(void *)(a1 + 808) + 8 * a3) = v9;
        *(_DWORD *)(*(void *)(a1 + 800) + 4 * a3) = 0;
      }
      else if (v8)
      {
        if (++*(_DWORD *)(*(void *)(a1 + 800) + 4 * a3) >= *(_DWORD *)(a1 + 792))
        {

          *(void *)(*(void *)(a1 + 808) + 8 * a3) = 0;
        }
        else
        {
          objc_msgSend(v6, "setObject:forKeyedSubscript:");
        }
      }
    }
  }
}

- (unint64_t)_flushEligibleBuffersFromRecordingStagingQueues
{
  if (result)
  {
    unint64_t v1 = result;
    uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(result + 128), "objectAtIndexedSubscript:", *(void *)(result + 656)), "count");
    if (result >= 3)
    {
      do
      {
        uint64_t v2 = (opaqueCMSampleBuffer *)objc_msgSend((id)objc_msgSend(*(id *)(v1 + 128), "objectAtIndexedSubscript:", *(void *)(v1 + 656)), "objectAtIndexedSubscript:", 2);
        memset(&v11, 0, sizeof(v11));
        CMSampleBufferGetPresentationTimeStamp(&v11, v2);
        unint64_t v3 = *(void *)(v1 + 624);
        for (unint64_t i = *(void *)(v1 + 632) + v3; ; unint64_t i = *(void *)(v1 + 632) + *(void *)(v1 + 624))
        {
          if (v3 >= i)
          {
            int v6 = 1;
            uint64_t v7 = (opaqueCMSampleBuffer *)objc_msgSend((id)objc_msgSend(*(id *)(v1 + 128), "objectAtIndexedSubscript:", *(void *)(v1 + 656)), "objectAtIndexedSubscript:", 1);
            memset(&v10, 0, sizeof(v10));
            CMSampleBufferGetPresentationTimeStamp(&v10, v7);
            CMTime time1 = v10;
            -[BWFileCoordinatorNode _flushBuffersFromRecordingStagingQueuesWithPTSCutoff:factorInAudioDuration:](v1, &time1, 1);
            goto LABEL_10;
          }
          uint64_t v5 = (opaqueCMSampleBuffer *)objc_msgSend((id)objc_msgSend(*(id *)(v1 + 128), "objectAtIndexedSubscript:", v3), "lastObject");
          if (!v5) {
            break;
          }
          memset(&v10, 0, sizeof(v10));
          CMSampleBufferGetPresentationTimeStamp(&v10, v5);
          CMTime time1 = v10;
          CMTime v8 = v11;
          if (CMTimeCompare(&time1, &v8) < 0) {
            break;
          }
          ++v3;
        }
        int v6 = 0;
LABEL_10:
        uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(v1 + 128), "objectAtIndexedSubscript:", *(void *)(v1 + 656)), "count");
      }
      while (v6 && result > 2);
    }
  }
  return result;
}

- (void)_renderSampleBuffer:(void *)a3 forInput:
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  unint64_t v6 = [a3 index];
  uint64_t v7 = objc_msgSend((id)objc_msgSend((id)a1, "outputs"), "objectAtIndex:", v6);
  if (*(unsigned char *)(a1 + 141)
    && !*(unsigned char *)(a1 + 142)
    && !*(unsigned char *)(a1 + 569)
    && v6 == *(void *)(a1 + 656)
    && (int)objc_msgSend((id)objc_msgSend((id)CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E4F53070], 0), "objectForKeyedSubscript:", 0x1EFA40A20), "intValue") >= 1)
  {
    *(unsigned char *)(a1 + 569) = 1;
  }
  memset(&v29, 0, sizeof(v29));
  CMSampleBufferGetPresentationTimeStamp(&v29, (CMSampleBufferRef)a2);
  if ((v6 == *(void *)(a1 + 656) || v6 == *(void *)(a1 + 664))
    && *(_DWORD *)(a1 + 156) == 1
    && (*(unsigned char *)(a1 + 396) & 1) != 0)
  {
    CMTime time1 = *(CMTime *)(a1 + 384);
    CMTime time2 = v29;
    if (CMTimeCompare(&time1, &time2) <= 0)
    {
      if (v6 == *(void *)(a1 + 656) && (*(unsigned char *)(a1 + 444) & 1) == 0) {
        *(CMTime *)(a1 + 432) = v29;
      }
      if (!*(unsigned char *)(a1 + 141) || *(unsigned char *)(a1 + 142)) {
        goto LABEL_18;
      }
      if ((*(unsigned char *)(a1 + 444) & 1) == 0) {
        goto LABEL_35;
      }
      if (CMSampleBufferGetImageBuffer((CMSampleBufferRef)a2))
      {
        CMTime time1 = *(CMTime *)(a1 + 432);
      }
      else
      {
        CMBlockBufferRef DataBuffer = CMSampleBufferGetDataBuffer((CMSampleBufferRef)a2);
        CMTime time1 = *(CMTime *)(a1 + 432);
        if (!DataBuffer)
        {
          if (v6 != *(void *)(a1 + 656)) {
            goto LABEL_35;
          }
          goto LABEL_18;
        }
      }
      if (*(unsigned char *)(a1 + 420))
      {
        if (*(unsigned char *)(a1 + 569))
        {
          CMTime time2 = time1;
          CMTime rhs = *(CMTime *)(a1 + 408);
          CMTimeAdd(&time1, &time2, &rhs);
          if (*(unsigned char *)(a1 + 228))
          {
            CMTime rhs = time1;
            CMTime type = *(CMTime *)(a1 + 216);
            CMTimeAdd(&time2, &rhs, &type);
          }
        }
      }
      CMTime time2 = *(CMTime *)(a1 + 312);
      if (v6 == *(void *)(a1 + 664))
      {
        CMTimeMake(&v25, 1, 10000);
        CMTime rhs = v29;
        CMTimeAdd(&v26, &rhs, &v25);
        CMTime rhs = time2;
        if (CMTimeCompare(&rhs, &v26) <= 0)
        {
          CMTime time2 = v29;
          memset(&rhs, 0, sizeof(rhs));
          CMSampleBufferGetDuration(&rhs, (CMSampleBufferRef)a2);
          if (rhs.flags)
          {
            CMTime type = time2;
            CMTime v24 = rhs;
            CMTimeAdd(&time2, &type, &v24);
          }
        }
      }
      if (!*(unsigned char *)(a1 + 569)
        || (rhs = time2, CMTime type = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA08], CMTimeCompare(&rhs, &type) <= 0)
        || (rhs = time2, CMTime type = time1, (CMTimeCompare(&rhs, &type) & 0x80000000) == 0))
      {
LABEL_18:
        if (*(unsigned char *)(a1 + 569)) {
          -[BWFileCoordinatorNode _emitOrQueueSampleBuffer:forInput:toOutput:stoppingOrPausing:](a1, (CMSampleBufferRef)a2, a3, v7);
        }
        if (dword_1EB4C5030)
        {
          LODWORD(rhs.value) = 0;
          LOBYTE(type.value) = 0;
          os_log_and_send_and_compose_flags_and_os_log_CMTime type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          unsigned int value = rhs.value;
          if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type.value)) {
            unsigned int v11 = value;
          }
          else {
            unsigned int v11 = value & 0xFFFFFFFE;
          }
          if (v11)
          {
            uint64_t v22 = *(void *)(a1 + 120);
            uint64_t v12 = *(int *)(a1 + 156);
            if (v12 > 5) {
              uint64_t v13 = @"Unknown";
            }
            else {
              uint64_t v13 = off_1E5C253A8[v12];
            }
            CMTime time1 = v29;
            Float64 Seconds = CMTimeGetSeconds(&time1);
            CMTime time1 = *(CMTime *)(a1 + 432);
            Float64 v15 = CMTimeGetSeconds(&time1);
            CMTime time1 = *(CMTime *)(a1 + 384);
            Float64 v16 = CMTimeGetSeconds(&time1);
            CMTime time1 = *(CMTime *)(a1 + 408);
            Float64 v17 = CMTimeGetSeconds(&time1);
            LODWORD(time2.value) = 136316930;
            *(CMTimeValue *)((char *)&time2.value + 4) = (CMTimeValue)"-[BWFileCoordinatorNode _renderSampleBuffer:forInput:]";
            LOWORD(time2.flags) = 2048;
            *(void *)((char *)&time2.flags + 2) = a1;
            HIWORD(time2.epoch) = 2048;
            uint64_t v31 = v22;
            __int16 v32 = 2112;
            unint64_t v33 = v13;
            __int16 v34 = 2048;
            Float64 v35 = Seconds;
            __int16 v36 = 2048;
            Float64 v37 = v15;
            __int16 v38 = 2048;
            Float64 v39 = v16;
            __int16 v40 = 2048;
            Float64 v41 = v17;
            _os_log_send_and_compose_impl();
          }
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        -[BWFileCoordinatorNode _stopRecordingWithErrorCode:](a1, 0);
      }
    }
  }
LABEL_35:
  int v18 = *(_DWORD *)(a1 + 156);
  if ((v18 - 4) >= 2)
  {
    if (v18 != 1)
    {
      if (v18 == 3)
      {
        CMTime time1 = v29;
        -[BWFileCoordinatorNode _doStartingToRecordWithSBuf:inputIndex:sbufPTS:](a1, a2, v6, (uint64_t)&time1);
      }
      return;
    }
    if (v6 >= *(void *)(a1 + 632) + *(void *)(a1 + 624))
    {
      CMTime time1 = v29;
      CMTime time2 = *(CMTime *)(a1 + 264);
      if (CMTimeCompare(&time1, &time2) < 1) {
        return;
      }
    }
    else if (*(unsigned char *)(a1 + 680) && v6 == 1 && !*(unsigned char *)(a1 + 573))
    {
      CMTime v23 = v29;
      long long v19 = -[BWFileCoordinatorNode _copyFirstValidLowLatencyAudioBuffer:inputIndex:sbufPTS:](a1, (CMSampleBufferRef)a2, v8, &v23);
      if (v19)
      {
        long long v20 = v19;
        -[BWFileCoordinatorNode _emitOrQueueSampleBuffer:forInput:toOutput:stoppingOrPausing:](a1, v19, a3, v7);
        CFRelease(v20);
      }
      return;
    }
    -[BWFileCoordinatorNode _emitOrQueueSampleBuffer:forInput:toOutput:stoppingOrPausing:](a1, (CMSampleBufferRef)a2, a3, v7);
    return;
  }
  if (v6 < *(void *)(a1 + 632) + *(void *)(a1 + 624)
    || (CMTime time1 = v29, time2 = *(CMTime *)(a1 + 264), CMTimeCompare(&time1, &time2) >= 1))
  {
    CMTime time1 = v29;
    -[BWFileCoordinatorNode _doStoppingOrPausingWithSBuf:inputIndex:sbufPTS:](a1, (uint64_t)a2, v6, (uint64_t)&time1);
  }
}

- (unint64_t)_flushBuffersFromRecordingStagingQueuesWithPTSCutoff:(int)a3 factorInAudioDuration:
{
  if (result)
  {
    uint64_t v5 = (id *)result;
    uint64_t v11 = 0;
    memset(&v10, 0, sizeof(v10));
    for (uint64_t result = [(BWFileCoordinatorNode *)result _earliestPTSStagedForRecording:a3 factorInAudioDuration:(uint64_t)&v10];
          (v10.flags & 1) != 0;
          uint64_t result = [(BWFileCoordinatorNode *)(unint64_t)v5 _earliestPTSStagedForRecording:a3 factorInAudioDuration:(uint64_t)&v10])
    {
      CMTime time1 = v10;
      CMTime v8 = *a2;
      uint64_t result = CMTimeCompare(&time1, &v8);
      if ((result & 0x80000000) == 0) {
        break;
      }
      uint64_t v6 = v11;
      uint64_t v7 = (void *)CFRetain((CFTypeRef)objc_msgSend((id)objc_msgSend(v5[16], "objectAtIndexedSubscript:", v11), "firstObject"));
      objc_msgSend((id)objc_msgSend(v5[16], "objectAtIndexedSubscript:", v6), "removeObjectAtIndex:", 0);
      -[BWFileCoordinatorNode _renderSampleBuffer:forInput:]((uint64_t)v5, v7, objc_msgSend((id)objc_msgSend(v5, "inputs"), "objectAtIndexedSubscript:", v6));
      CFRelease(v7);
      uint64_t v11 = 0;
      memset(&v10, 0, sizeof(v10));
    }
  }
  return result;
}

- (unint64_t)_earliestPTSStagedForRecording:(int)a3@<W2> factorInAudioDuration:(uint64_t)a4@<X8>
{
  if (result)
  {
    unint64_t v6 = result;
    uint64_t v7 = MEMORY[0x1E4F1F9F8];
    *(_OWORD *)a4 = *MEMORY[0x1E4F1F9F8];
    *(void *)(a4 + 16) = *(void *)(v7 + 16);
    if (*(void *)(result + 608))
    {
      unint64_t v9 = 0;
      uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
      while (1)
      {
        if (a3 && (unint64_t v11 = *(void *)(v6 + 624), v9 >= v11) && v9 < *(void *)(v6 + 632) + v11)
        {
          uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(v6 + 128), "objectAtIndexedSubscript:", v9), "count");
          if (result >= 2)
          {
            uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(v6 + 128), "objectAtIndexedSubscript:", v9), "objectAtIndexedSubscript:", 1);
            if (result)
            {
LABEL_11:
              memset(&v14, 0, sizeof(v14));
              uint64_t result = (unint64_t)CMSampleBufferGetPresentationTimeStamp(&v14, (CMSampleBufferRef)result);
              if ((*(unsigned char *)(a4 + 12) & 1) == 0
                || (time1 = *(CMTime *)a4, v12 = v14, uint64_t result = CMTimeCompare(&time1, &v12), (int)result >= 1))
              {
                *(CMTime *)a4 = v14;
                uint64_t v10 = v9;
              }
            }
          }
        }
        else
        {
          uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(v6 + 128), "objectAtIndexedSubscript:", v9), "firstObject");
          if (result) {
            goto LABEL_11;
          }
        }
        if (++v9 >= *(void *)(v6 + 608)) {
          goto LABEL_17;
        }
      }
    }
    uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_17:
    *a2 = v10;
  }
  else
  {
    *(void *)a4 = 0;
    *(void *)(a4 + 8) = 0;
    *(void *)(a4 + 16) = 0;
  }
  return result;
}

- (void)_emitOrQueueSampleBuffer:(uint64_t)a1 forInput:(CMSampleBufferRef)sbuf toOutput:(void *)a3 stoppingOrPausing:(void *)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    CMTime v8 = &OBJC_IVAR___FigCaptureCMSession__cmsession;
    if (*(void *)(a1 + 752)) {
      -[BWFileCoordinatorNode _emitSampleBuffersWaitingForMotionData](a1);
    }
    CMSampleBufferRef sampleBufferOut = 0;
    if (*(unsigned char *)(a1 + 180))
    {
      timingArrayEntriesNeededOut.CMTimeValue value = 0;
      uint64_t SampleTimingInfoArray = CMSampleBufferGetSampleTimingInfoArray(sbuf, 0, 0, &timingArrayEntriesNeededOut.value);
      if (timingArrayEntriesNeededOut.value >= 1)
      {
        MEMORY[0x1F4188790](SampleTimingInfoArray, v11, v12, v13);
        Float64 v15 = (CMSampleTimingInfo *)((char *)&v39 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
        if (!CMSampleBufferGetSampleTimingInfoArray(sbuf, timingArrayEntriesNeededOut.value, v15, 0))
        {
          __int16 v40 = a4;
          if (timingArrayEntriesNeededOut.value >= 1)
          {
            CMTimeValue v16 = 0;
            p_CMTimeScale timescale = &v15->presentationTimeStamp.timescale;
            do
            {
              if (p_timescale[1])
              {
                int v18 = p_timescale - 2;
                int32_t v19 = *p_timescale;
                CMTime lhs = *(CMTime *)(p_timescale - 2);
                CMTime rhs = *(CMTime *)(a1 + 168);
                CMTimeSubtract(&time1, &lhs, &rhs);
                *(CMTime *)(p_timescale - 2) = time1;
                if (*p_timescale != v19)
                {
                  *(_OWORD *)&lhs.CMTimeValue value = *(_OWORD *)v18;
                  lhs.CMTimeEpoch epoch = *((void *)p_timescale + 1);
                  CMTimeConvertScale(&time1, &lhs, v19, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
                  *(_OWORD *)int v18 = *(_OWORD *)&time1.value;
                  *((void *)p_timescale + 1) = time1.epoch;
                }
              }
              if (p_timescale[7])
              {
                long long v20 = p_timescale + 4;
                int32_t v21 = p_timescale[6];
                CMTime lhs = *(CMTime *)(p_timescale + 4);
                CMTime rhs = *(CMTime *)(a1 + 168);
                CMTimeSubtract(&time1, &lhs, &rhs);
                *(CMTime *)(p_timescale + 4) = time1;
                if (p_timescale[6] != v21)
                {
                  *(_OWORD *)&lhs.CMTimeValue value = *v20;
                  lhs.CMTimeEpoch epoch = *((void *)p_timescale + 4);
                  CMTimeConvertScale(&time1, &lhs, v21, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
                  _OWORD *v20 = *(_OWORD *)&time1.value;
                  *((void *)p_timescale + 4) = time1.epoch;
                }
              }
              ++v16;
              p_timescale += 18;
            }
            while (v16 < timingArrayEntriesNeededOut.value);
          }
          CFAllocatorRef v22 = CFGetAllocator(sbuf);
          CMSampleBufferCreateCopyWithNewTiming(v22, sbuf, timingArrayEntriesNeededOut.value, v15, &sampleBufferOut);
          a4 = v40;
        }
        CMTime v8 = &OBJC_IVAR___FigCaptureCMSession__cmsession;
      }
    }
    else
    {
      if (sbuf) {
        unint64_t v9 = (opaqueCMSampleBuffer *)CFRetain(sbuf);
      }
      else {
        unint64_t v9 = 0;
      }
      CMSampleBufferRef sampleBufferOut = v9;
    }
    if (*(void **)(a1 + 160) != a3)
    {
      if ((unint64_t)[a3 index] < *(void *)(a1 + 624)) {
        goto LABEL_41;
      }
      CMSampleBufferGetPresentationTimeStamp(&time1, sbuf);
      CMTimeValue value = time1.value;
      CMTimeFlags flags = time1.flags;
      CMTimeScale timescale = time1.timescale;
      CMTimeEpoch epoch = time1.epoch;
      if ((unint64_t)[a3 index] >= *(void *)(a1 + 632) + *(void *)(a1 + 624))
      {
        CMTime time1 = *(CMTime *)(a1 + 336);
        lhs.CMTimeValue value = value;
        lhs.CMTimeScale timescale = timescale;
        lhs.CMTimeFlags flags = flags;
        lhs.CMTimeEpoch epoch = epoch;
        if ((CMTimeCompare(&time1, &lhs) & 0x80000000) == 0) {
          goto LABEL_41;
        }
        uint64_t v25 = a1 + 336;
        *(void *)(a1 + 336) = value;
        CMTimeScale v26 = timescale;
        goto LABEL_36;
      }
      CMTimeValue v46 = value;
      CMTimeScale v47 = timescale;
      memset(&time1, 0, sizeof(time1));
      CMSampleBufferGetDuration(&time1, sbuf);
      if (time1.flags)
      {
        rhs.CMTimeValue value = value;
        rhs.CMTimeScale timescale = timescale;
        rhs.CMTimeFlags flags = flags;
        rhs.CMTimeEpoch epoch = epoch;
        CMTime timingArrayEntriesNeededOut = time1;
        CMTimeAdd(&lhs, &rhs, &timingArrayEntriesNeededOut);
        CMTimeValue v46 = lhs.value;
        CMTimeFlags flags = lhs.flags;
        CMTimeScale v47 = lhs.timescale;
        CMTimeEpoch epoch = lhs.epoch;
      }
      CMTime lhs = *(CMTime *)(a1 + 312);
      rhs.CMTimeValue value = v46;
      rhs.CMTimeScale timescale = v47;
      rhs.CMTimeFlags flags = flags;
      rhs.CMTimeEpoch epoch = epoch;
      if (CMTimeCompare(&lhs, &rhs) < 0)
      {
        uint64_t v25 = a1 + 312;
        *(void *)(a1 + 312) = v46;
        CMTimeScale v26 = v47;
LABEL_36:
        *(_DWORD *)(v25 + 8) = v26;
        *(_DWORD *)(v25 + 12) = flags;
        *(void *)(v25 + 16) = epoch;
      }
LABEL_41:
      if (!sampleBufferOut) {
        return;
      }
      if (*(void **)(a1 + 160) == a3 && *(void *)(a1 + 728))
      {
        if (*(void *)(a1 + v8[818]))
        {
          objc_msgSend(*(id *)(a1 + 736), "addObject:");
          CMSampleBufferRef v33 = sampleBufferOut;
          if (!sampleBufferOut) {
            return;
          }
LABEL_45:
          CFRelease(v33);
          return;
        }
        uint64_t v34 = objc_msgSend((id)objc_msgSend((id)CMGetAttachment(sampleBufferOut, (CFStringRef)*MEMORY[0x1E4F53070], 0), "objectForKeyedSubscript:", *MEMORY[0x1E4F55720]), "unsignedLongLongValue");
        if (v34)
        {
          uint64_t v35 = v34;
          __int16 v36 = (void *)[*(id *)(a1 + 728) copyMotionDataForSerialNumber:*(void *)(a1 + 744) + v34];
          if (v36)
          {
            Float64 v37 = v36;
            -[BWFileCoordinatorNode _addLookAheadMotionDataToMetadataForSampleBuffer:lookAheadMotionData:](a1, sampleBufferOut, v36);
          }
          else
          {
            [*(id *)(a1 + 736) addObject:sampleBufferOut];
            if (sampleBufferOut)
            {
              CFRelease(sampleBufferOut);
              CMSampleBufferRef sampleBufferOut = 0;
            }
            *(void *)(a1 + v8[818]) = v35;
          }
        }
      }
      if (!sampleBufferOut) {
        return;
      }
      -[BWFileCoordinatorNode _emitSampleBuffer:forInput:toOutput:](a1, sampleBufferOut, a3, a4);
      CMSampleBufferRef v33 = sampleBufferOut;
      goto LABEL_45;
    }
    CMSampleBufferGetPresentationTimeStamp(&time1, sbuf);
    CMTimeValue value = time1.value;
    CMTimeFlags v27 = time1.flags;
    CMTimeScale timescale = time1.timescale;
    if ((time1.flags & 1) == 0) {
      goto LABEL_41;
    }
    CMTimeEpoch v28 = time1.epoch;
    memset(&time1, 0, sizeof(time1));
    CMSampleBufferGetDuration(&time1, sbuf);
    if (time1.flags)
    {
      long long v30 = *(_OWORD *)&time1.value;
      *(_OWORD *)(a1 + 216) = *(_OWORD *)&time1.value;
      CMTimeEpoch v31 = time1.epoch;
      *(void *)(a1 + 232) = time1.epoch;
      uint64_t v29 = a1 + 240;
      rhs.CMTimeValue value = value;
      rhs.CMTimeScale timescale = timescale;
      rhs.CMTimeFlags flags = v27;
      rhs.CMTimeEpoch epoch = v28;
      *(_OWORD *)&timingArrayEntriesNeededOut.CMTimeValue value = v30;
      timingArrayEntriesNeededOut.CMTimeEpoch epoch = v31;
      CMTimeAdd(&lhs, &rhs, &timingArrayEntriesNeededOut);
    }
    else
    {
      *(void *)(a1 + 240) = value;
      *(_DWORD *)(a1 + 248) = timescale;
      *(_DWORD *)(a1 + 252) = v27;
      *(void *)(a1 + 256) = v28;
      if ((*(unsigned char *)(a1 + 204) & 1) == 0)
      {
LABEL_40:
        *(void *)(a1 + 192) = value;
        *(_DWORD *)(a1 + 200) = timescale;
        *(_DWORD *)(a1 + 204) = v27;
        *(void *)(a1 + 208) = v28;
        goto LABEL_41;
      }
      lhs.CMTimeValue value = value;
      lhs.CMTimeScale timescale = timescale;
      lhs.CMTimeFlags flags = v27;
      lhs.CMTimeEpoch epoch = v28;
      CMTime rhs = *(CMTime *)(a1 + 192);
      uint64_t v29 = a1 + 216;
      if (CMTimeCompare(&lhs, &rhs) < 1)
      {
        uint64_t v38 = MEMORY[0x1E4F1F9F8];
        *(_OWORD *)uint64_t v29 = *MEMORY[0x1E4F1F9F8];
        CMTimeEpoch v32 = *(void *)(v38 + 16);
        goto LABEL_39;
      }
      rhs.CMTimeValue value = value;
      rhs.CMTimeScale timescale = timescale;
      rhs.CMTimeFlags flags = v27;
      rhs.CMTimeEpoch epoch = v28;
      CMTime timingArrayEntriesNeededOut = *(CMTime *)(a1 + 192);
      CMTimeSubtract(&lhs, &rhs, &timingArrayEntriesNeededOut);
    }
    *(_OWORD *)uint64_t v29 = *(_OWORD *)&lhs.value;
    CMTimeEpoch v32 = lhs.epoch;
LABEL_39:
    *(void *)(v29 + 16) = v32;
    goto LABEL_40;
  }
}

- (void)_stopRecordingWithErrorCode:(uint64_t)a1
{
  if (a1)
  {
    int v4 = *(_DWORD *)(a1 + 156);
    if (v4 == 3)
    {
      -[BWFileCoordinatorNode _finishStoppingOrPausing:withErrorCode:](a1, 1, a2);
      int v4 = *(_DWORD *)(a1 + 156);
    }
    switch(v4)
    {
      case 1:
        *(_DWORD *)(a1 + 576) = a2;
        uint64_t v7 = MEMORY[0x1E4F1F9F8];
        *(_OWORD *)(a1 + 360) = *MEMORY[0x1E4F1F9F8];
        *(void *)(a1 + 376) = *(void *)(v7 + 16);
        uint64_t v8 = *(void *)(a1 + 352);
        *(_OWORD *)(a1 + 288) = *(_OWORD *)(a1 + 336);
        *(void *)(a1 + 304) = v8;
        *(unsigned char *)(a1 + 572) = 0;
        *(_DWORD *)(a1 + 156) = 4;
        -[BWFileCoordinatorNode _flushAllBuffersFromRecordingStagingQueues](a1);
        if (*(unsigned char *)(a1 + 569))
        {
          -[BWFileCoordinatorNode _performFlushAction](a1);
        }
        break;
      case 5:
        *(_DWORD *)(a1 + 576) = a2;
        *(_DWORD *)(a1 + 156) = 4;
        break;
      case 2:
        if (a2) {
          uint64_t v5 = a2;
        }
        else {
          uint64_t v5 = 0xFFFFFFFFLL;
        }
        uint64_t v6 = *(void *)(a1 + 120);
        CMTime v9 = *(CMTime *)(a1 + 360);
        -[BWFileCoordinatorNode _emitMarkerBufferForFileWriterAction:withPTS:settings:settingsID:errorCode:](a1, @"Resume", &v9, 0, v6, v5);
        -[BWFileCoordinatorNode _finishStoppingOrPausing:withErrorCode:](a1, 1, a2);
        break;
    }
  }
}

- (void)_doStartingToRecordWithSBuf:(unint64_t)a3 inputIndex:(uint64_t)a4 sbufPTS:
{
  uint64_t v163 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  uint64_t v8 = objc_msgSend(*(id *)(a1 + 96), "objectAtIndex:");
  if (!v8)
  {
    pthread_mutex_unlock(*(pthread_mutex_t **)(a1 + 600));
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Could not find staging queue for given input" userInfo:0]);
  }
  CMTime v9 = (void *)v8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [*(id *)(a1 + 112) isIrisRecording])
  {
    if (*(void *)(a1 + 624)
      && *(void *)(a1 + 656) == a3
      && ![v9 count]
      && CMGetAttachment(a2, @"SampleDataToBeDropped", 0) == (CFTypeRef)*MEMORY[0x1E4F1CFD0])
    {
      return;
    }
    int v10 = 1;
  }
  else
  {
    int v10 = 0;
  }
  if (*(unsigned char *)(a1 + 516))
  {
    *(_OWORD *)&time1.duration.unsigned int value = *(_OWORD *)a4;
    time1.duration.CMTimeEpoch epoch = *(void *)(a4 + 16);
    *(_OWORD *)CMTime time2 = *(_OWORD *)(a1 + 504);
    *(void *)&time2[16] = *(void *)(a1 + 520);
    if (CMTimeCompare(&time1.duration, (CMTime *)time2) < 1) {
      return;
    }
  }
  CFStringRef key = (const __CFString *)*MEMORY[0x1E4F53070];
  uint64_t v11 = (void *)CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  sbuf = a2;
  if (*(void *)(a1 + 624))
  {
    char v12 = *(void *)(a1 + 656) == a3 ? v10 : 1;
    if ((v12 & 1) == 0)
    {
      Float64 v15 = v11;
      if ((objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E4F53FF0]), "BOOLValue") & 1) != 0
        || (int)objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E4F53EF0]), "intValue") > 1)
      {
        return;
      }
      if (*(_DWORD *)(a1 + 552) == -1)
      {
        *(_DWORD *)(a1 + 556) = objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E4F53BF8]), "intValue");
        *(_DWORD *)(a1 + 552) = objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E4F53EE0]), "intValue");
        int v16 = *(_DWORD *)(a1 + 552) - 1;
        uint64_t v17 = 0;
        if (v16 <= 9) {
          uint64_t v17 = qword_1A5EFDBF0[v16];
        }
        *(void *)(a1 + 544) = v17;
      }
      if (![v9 count] && !*(unsigned char *)(a1 + 568) && *(double *)(a1 + 544) > 0.0)
      {
        unsigned int v18 = *(_DWORD *)(a1 + 552);
        if (v18 <= 0xA)
        {
          if (((1 << v18) & 0x64C) != 0)
          {
            if (objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E4F53BF8]), "intValue") == 2)goto LABEL_44; {
          }
            }
          else if (v18 == 1 {
                 && objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E4F53EE0]), "intValue") == 1)
          }
          {
LABEL_44:
            if ((*(unsigned char *)(a1 + 468) & 1) == 0)
            {
              CMSampleBufferGetPresentationTimeStamp(&time1.duration, (CMSampleBufferRef)a2);
              *(_OWORD *)(a1 + 456) = *(_OWORD *)&time1.duration.value;
              *(void *)(a1 + 472) = time1.duration.epoch;
            }
            CMSampleBufferGetPresentationTimeStamp(&lhs, (CMSampleBufferRef)a2);
            *(_OWORD *)&time1.duration.unsigned int value = *(_OWORD *)(a1 + 456);
            time1.duration.CMTimeEpoch epoch = *(void *)(a1 + 472);
            CMTimeSubtract(&time, &lhs, &time1.duration);
            Float64 Seconds = CMTimeGetSeconds(&time);
            *(Float64 *)(a1 + 528) = Seconds;
            *(unsigned char *)(a1 + 568) = Seconds >= *(double *)(a1 + 544);
            if (!*(unsigned char *)(a1 + 568))
            {
              uint64_t v20 = 560;
              goto LABEL_247;
            }
            goto LABEL_241;
          }
        }
      }
      if ((*(unsigned char *)(a1 + 468) & 1) == 0)
      {
LABEL_242:
        if (!objc_msgSend((id)CMGetAttachment(a2, @"DropFrameWaitingForTorchToRampUp", 0), "BOOLValue"))
        {
          if (*(unsigned char *)(a1 + 492))
          {
            CMSampleBufferGetPresentationTimeStamp(&v142, (CMSampleBufferRef)a2);
            *(_OWORD *)&time1.duration.unsigned int value = *(_OWORD *)(a1 + 480);
            time1.duration.CMTimeEpoch epoch = *(void *)(a1 + 496);
            CMTimeSubtract(&v143, &v142, &time1.duration);
            *(Float64 *)(a1 + 536) = CMTimeGetSeconds(&v143);
            uint64_t v121 = MEMORY[0x1E4F1F9F8];
            *(_OWORD *)(a1 + 480) = *MEMORY[0x1E4F1F9F8];
            *(void *)(a1 + 496) = *(void *)(v121 + 16);
          }
          goto LABEL_18;
        }
        if ([v9 count]) {
          goto LABEL_18;
        }
        if ((*(unsigned char *)(a1 + 492) & 1) == 0)
        {
          CMSampleBufferGetPresentationTimeStamp(&time1.duration, (CMSampleBufferRef)a2);
          *(_OWORD *)(a1 + 480) = *(_OWORD *)&time1.duration.value;
          *(void *)(a1 + 496) = time1.duration.epoch;
        }
        uint64_t v20 = 564;
LABEL_247:
        ++*(_DWORD *)(a1 + v20);
        return;
      }
      CMSampleBufferGetPresentationTimeStamp(&v144, (CMSampleBufferRef)a2);
      *(_OWORD *)&time1.duration.unsigned int value = *(_OWORD *)(a1 + 456);
      time1.duration.CMTimeEpoch epoch = *(void *)(a1 + 472);
      CMTimeSubtract(&v145, &v144, &time1.duration);
      *(Float64 *)(a1 + 528) = CMTimeGetSeconds(&v145);
LABEL_241:
      uint64_t v120 = MEMORY[0x1E4F1F9F8];
      *(_OWORD *)(a1 + 456) = *MEMORY[0x1E4F1F9F8];
      *(void *)(a1 + 472) = *(void *)(v120 + 16);
      goto LABEL_242;
    }
  }
LABEL_18:
  unint64_t v13 = *(void *)(a1 + 624);
  if (v13 <= a3 && *(void *)(a1 + 632) + v13 > a3)
  {
    if (*(void *)(a1 + 712))
    {
      if ((*(unsigned char *)(a1 + 700) & 1) == 0) {
        return;
      }
      *(_OWORD *)&time1.duration.unsigned int value = *(_OWORD *)a4;
      time1.duration.CMTimeEpoch epoch = *(void *)(a4 + 16);
      *(_OWORD *)CMTime time2 = *(_OWORD *)(a1 + 688);
      *(void *)&time2[16] = *(void *)(a1 + 704);
      if (CMTimeCompare(&time1.duration, (CMTime *)time2) < 0) {
        return;
      }
    }
  }
  int v125 = v10;
  [v9 addObject:a2];
  if (a3 == 1 && *(unsigned char *)(a1 + 680)) {
    *(unsigned char *)(a1 + 570) = 1;
  }
  if ([v9 count] == 1)
  {
    if (*(void *)(a1 + 656) == a3)
    {
      if (*(unsigned char *)(a1 + 680) && !*(unsigned char *)(a1 + 570))
      {
        [v9 removeObjectAtIndex:0];
        goto LABEL_60;
      }
      uint64_t v14 = *(void *)(a4 + 16);
      *(_OWORD *)(a1 + 264) = *(_OWORD *)a4;
      *(void *)(a1 + 280) = v14;
      if (*(void *)(a1 + 728))
      {
        *(void *)(a1 + 752) = objc_msgSend((id)objc_msgSend((id)CMGetAttachment(a2, key, 0), "objectForKeyedSubscript:", *MEMORY[0x1E4F55720]), "unsignedLongLongValue");
        *(unsigned char *)(a1 + 768) = 0;
      }
    }
    else
    {
      if (*(void *)(a1 + 632) + *(void *)(a1 + 624) <= a3) {
        goto LABEL_60;
      }
      *(_OWORD *)&time1.duration.unsigned int value = *(_OWORD *)(a1 + 288);
      time1.duration.CMTimeEpoch epoch = *(void *)(a1 + 304);
      *(_OWORD *)CMTime time2 = *(_OWORD *)a4;
      *(void *)&time2[16] = *(void *)(a4 + 16);
      if ((CMTimeCompare(&time1.duration, (CMTime *)time2) & 0x80000000) == 0) {
        goto LABEL_60;
      }
      uint64_t v21 = *(void *)(a4 + 16);
      *(_OWORD *)(a1 + 288) = *(_OWORD *)a4;
      *(void *)(a1 + 304) = v21;
    }
    uint64_t v22 = [*(id *)(a1 + 96) objectAtIndex:*(void *)(a1 + 656)];
    uint64_t v23 = a1 + 264;
    if (*(unsigned char *)(a1 + 276))
    {
      CMTime v24 = (void *)v22;
      uint64_t v25 = MEMORY[0x1E4F1F9F8];
      do
      {
        *(_OWORD *)&time1.duration.unsigned int value = *(_OWORD *)(a1 + 288);
        time1.duration.CMTimeEpoch epoch = *(void *)(a1 + 304);
        *(_OWORD *)CMTime time2 = *(_OWORD *)v23;
        *(void *)&time2[16] = *(void *)(v23 + 16);
        if (CMTimeCompare(&time1.duration, (CMTime *)time2) < 1) {
          break;
        }
        [v24 removeObjectAtIndex:0];
        CMTimeScale v26 = (_OWORD *)(a1 + 264);
        if ([v24 count])
        {
          CMSampleBufferGetPresentationTimeStamp(&time1.duration, (CMSampleBufferRef)[v24 firstObject]);
          *CMTimeScale v26 = *(_OWORD *)&time1.duration.value;
          *(void *)(a1 + 280) = time1.duration.epoch;
        }
        else
        {
          *CMTimeScale v26 = *(_OWORD *)v25;
          *(void *)(a1 + 280) = *(void *)(v25 + 16);
          *(unsigned char *)(a1 + 571) = 0;
        }
        uint64_t v23 = a1 + 264;
      }
      while ((*(unsigned char *)(a1 + 276) & 1) != 0);
    }
  }
LABEL_60:
  if ((*(unsigned char *)(a1 + 276) & 1) == 0) {
    return;
  }
  if (*(void *)(a1 + 632) + *(void *)(a1 + 624))
  {
    unint64_t v28 = 0;
    do
    {
      if (v28 != *(void *)(a1 + 656))
      {
        uint64_t v29 = (void *)[*(id *)(a1 + 96) objectAtIndex:v28];
        long long v30 = v29;
        if (*(unsigned char *)(a1 + 680))
        {
          if (v28 == 1 && !*(unsigned char *)(a1 + 571))
          {
            if ([v29 count])
            {
              memset(&time1, 0, 24);
              CMSampleBufferGetPresentationTimeStamp(&time1.duration, (CMSampleBufferRef)[v30 objectAtIndexedSubscript:0]);
              *(_OWORD *)CMTime time2 = *(_OWORD *)&time1.duration.value;
              *(void *)&time2[16] = time1.duration.epoch;
              *(_OWORD *)&rhs.duration.unsigned int value = *(_OWORD *)(a1 + 264);
              rhs.duration.CMTimeEpoch epoch = *(void *)(a1 + 280);
              if (CMTimeCompare((CMTime *)time2, &rhs.duration) <= 0) {
                *(unsigned char *)(a1 + 571) = 1;
              }
            }
          }
        }
        fcn_getEndingPTSOfFirstBufferInStagingQueue(v30, (uint64_t)&time1);
        rhs.duration.unsigned int value = time1.duration.value;
        CMTimeFlags flags = time1.duration.flags;
        rhs.duration.CMTimeScale timescale = time1.duration.timescale;
        if (time1.duration.flags)
        {
          CMTimeEpoch epoch = time1.duration.epoch;
          do
          {
            time1.duration.unsigned int value = rhs.duration.value;
            time1.duration.CMTimeScale timescale = rhs.duration.timescale;
            time1.duration.CMTimeFlags flags = flags;
            time1.duration.CMTimeEpoch epoch = epoch;
            *(_OWORD *)CMTime time2 = *(_OWORD *)(a1 + 264);
            *(void *)&time2[16] = *(void *)(a1 + 280);
            if (CMTimeCompare(&time1.duration, (CMTime *)time2) > 0) {
              break;
            }
            [v30 removeObjectAtIndex:0];
            fcn_getEndingPTSOfFirstBufferInStagingQueue(v30, (uint64_t)&time1);
            rhs.duration.unsigned int value = time1.duration.value;
            CMTimeFlags flags = time1.duration.flags;
            rhs.duration.CMTimeScale timescale = time1.duration.timescale;
            CMTimeEpoch epoch = time1.duration.epoch;
          }
          while ((time1.duration.flags & 1) != 0);
        }
      }
      ++v28;
      unint64_t v27 = *(void *)(a1 + 632) + *(void *)(a1 + 624);
    }
    while (v28 < v27);
  }
  else
  {
    unint64_t v27 = 0;
  }
  for (; v27 < *(void *)(a1 + 608); ++v27)
  {
    if (v27 != *(void *)(a1 + 656))
    {
      CMSampleBufferRef v33 = (void *)[*(id *)(a1 + 96) objectAtIndex:v27];
      for (unint64_t i = v33; [v33 count]; v33 = i)
      {
        CMSampleBufferGetPresentationTimeStamp(&v141, (CMSampleBufferRef)[i objectAtIndexedSubscript:0]);
        *(_OWORD *)&time1.duration.unsigned int value = *(_OWORD *)(a1 + 264);
        time1.duration.CMTimeEpoch epoch = *(void *)(a1 + 280);
        if ((CMTimeCompare(&v141, &time1.duration) & 0x80000000) == 0) {
          break;
        }
        [i removeObjectAtIndex:0];
      }
    }
  }
  if (*(unsigned char *)(a1 + 571)) {
    goto LABEL_85;
  }
  if (!(*(void *)(a1 + 632) + *(void *)(a1 + 624)))
  {
    unint64_t v48 = 0;
    goto LABEL_150;
  }
  unint64_t v48 = 0;
  do
  {
    if (v48 != *(void *)(a1 + 656))
    {
      fcn_getEndingPTSOfFirstBufferInStagingQueue((void *)[*(id *)(a1 + 96) objectAtIndex:v48], (uint64_t)v140);
      if ((v140[12] & 1) == 0) {
        break;
      }
    }
    ++v48;
  }
  while (v48 < *(void *)(a1 + 632) + *(void *)(a1 + 624));
  if (!*(unsigned char *)(a1 + 571))
  {
LABEL_150:
    if (*(void *)(a1 + 632) + *(void *)(a1 + 624) != v48) {
      return;
    }
  }
LABEL_85:
  *(_DWORD *)(a1 + 156) = 1;
  *(void *)(a1 + 752) = 0;
  if (*(void *)(a1 + 624))
  {
    unint64_t v35 = 0;
    p_decodeTimeStamp = &time1.decodeTimeStamp;
    CFAllocatorRef allocator = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    while (1)
    {
      if (v35 == *(void *)(a1 + 656)) {
        goto LABEL_98;
      }
      Float64 v37 = p_decodeTimeStamp;
      uint64_t v38 = (void *)[*(id *)(a1 + 96) objectAtIndex:v35];
      uint64_t v39 = (opaqueCMSampleBuffer *)[v38 firstObject];
      CMSampleBufferGetPresentationTimeStamp(&v139, v39);
      *(_OWORD *)&time1.duration.unsigned int value = *(_OWORD *)(a1 + 264);
      time1.duration.CMTimeEpoch epoch = *(void *)(a1 + 280);
      int32_t v40 = CMTimeCompare(&v139, &time1.duration);
      p_decodeTimeStamp = v37;
      if ((v40 & 0x80000000) == 0) {
        goto LABEL_98;
      }
      if ((unint64_t)[v38 count] >= 2)
      {
        Float64 v41 = (opaqueCMSampleBuffer *)[v38 objectAtIndexedSubscript:1];
        memset(&time1, 0, 24);
        CMSampleBufferGetPresentationTimeStamp(&time1.duration, v41);
        if (time1.duration.flags)
        {
          *(_OWORD *)CMTime time2 = *(_OWORD *)&time1.duration.value;
          *(void *)&time2[16] = time1.duration.epoch;
          *(_OWORD *)&rhs.duration.unsigned int value = *(_OWORD *)(a1 + 264);
          rhs.duration.CMTimeEpoch epoch = *(void *)(a1 + 280);
          CMTimeSubtract(&v138, (CMTime *)time2, &rhs.duration);
          if (CMTimeGetSeconds(&v138) < 0.002)
          {
            [v38 removeObjectAtIndex:0];
            uint64_t v39 = v41;
          }
        }
      }
      CMTime target = *(CMTime *)(a1 + 264);
      CMSampleBufferRef sampleBufferOut = 0;
      CMItemCount timingArrayEntriesNeededOut = 0;
      CMItemCount NumSamples = CMSampleBufferGetNumSamples(v39);
      CMSampleBufferGetSampleTimingInfoArray(v39, 0, 0, &timingArrayEntriesNeededOut);
      if (timingArrayEntriesNeededOut != 1
        || NumSamples != 1
        || (memset(&time1, 0, sizeof(time1)), CMSampleBufferGetSampleTimingInfo(v39, 0, &time1)))
      {
        a2 = sbuf;
        goto LABEL_97;
      }
      long long v44 = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 48);
      *(_OWORD *)&time2[32] = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 32);
      *(_OWORD *)&time2[48] = v44;
      *(void *)v154 = *(void *)(MEMORY[0x1E4F1FA70] + 64);
      long long v45 = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 16);
      *(_OWORD *)CMTime time2 = *MEMORY[0x1E4F1FA70];
      *(_OWORD *)&time2[16] = v45;
      a2 = sbuf;
      if (time1.presentationTimeStamp.flags)
      {
        *(CMTime *)&time2[24] = target;
        if (target.timescale != time1.presentationTimeStamp.timescale)
        {
          rhs.CMTime duration = target;
          CMTimeConvertScale((CMTime *)&time2[24], &rhs.duration, time1.presentationTimeStamp.timescale, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
        }
      }
      if (time1.decodeTimeStamp.flags)
      {
        *(_OWORD *)&rhs.duration.unsigned int value = *(_OWORD *)&v37->value;
        rhs.duration.CMTimeEpoch epoch = v37->epoch;
        CMTime presentationTimeStamp = target;
        if (CMTimeCompare(&rhs.duration, &presentationTimeStamp) <= 0)
        {
          *(_OWORD *)&time2[48] = *(_OWORD *)&v37->value;
          *(void *)v154 = v37->epoch;
          a2 = sbuf;
        }
        else
        {
          *(_OWORD *)&time2[48] = *(_OWORD *)&target.value;
          *(void *)v154 = target.epoch;
          a2 = sbuf;
          if (target.timescale != time1.decodeTimeStamp.timescale)
          {
            CMTime presentationTimeStamp = target;
            CMTimeConvertScale(&rhs.duration, &presentationTimeStamp, time1.decodeTimeStamp.timescale, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
            *(_OWORD *)&time2[48] = *(_OWORD *)&rhs.duration.value;
            *(void *)v154 = rhs.duration.epoch;
          }
        }
      }
      if (time1.duration.flags)
      {
        rhs.CMTime duration = target;
        CMTime presentationTimeStamp = time1.presentationTimeStamp;
        CMTimeSubtract(&duration, &rhs.duration, &presentationTimeStamp);
        CMTime presentationTimeStamp = time1.duration;
        CMTimeSubtract(&rhs.duration, &presentationTimeStamp, &duration);
        *(_OWORD *)CMTime time2 = *(_OWORD *)&rhs.duration.value;
        *(void *)&time2[16] = rhs.duration.epoch;
        CMTime presentationTimeStamp = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
        if (CMTimeCompare(&rhs.duration, &presentationTimeStamp) <= 0)
        {
          *(_OWORD *)CMTime time2 = *MEMORY[0x1E4F1F9F8];
          CMTimeEpoch v46 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
          goto LABEL_113;
        }
        if (*(_DWORD *)&time2[8] != time1.duration.timescale)
        {
          CMTime presentationTimeStamp = *(CMTime *)time2;
          CMTimeConvertScale(&rhs.duration, &presentationTimeStamp, time1.duration.timescale, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
          *(_OWORD *)CMTime time2 = *(_OWORD *)&rhs.duration.value;
          CMTimeEpoch v46 = rhs.duration.epoch;
LABEL_113:
          *(void *)&time2[16] = v46;
        }
      }
      CMSampleBufferCreateCopyWithNewTiming(allocator, v39, 1, (const CMSampleTimingInfo *)time2, &sampleBufferOut);
      CMSampleBufferRef v47 = sampleBufferOut;
      p_decodeTimeStamp = v37;
      if (!sampleBufferOut) {
        goto LABEL_98;
      }
      [v38 replaceObjectAtIndex:0 withObject:sampleBufferOut];
      CFRelease(v47);
LABEL_97:
      p_decodeTimeStamp = v37;
LABEL_98:
      ++v35;
      unint64_t v43 = *(void *)(a1 + 624);
      if (v35 >= v43) {
        goto LABEL_119;
      }
    }
  }
  unint64_t v43 = 0;
LABEL_119:
  uint64_t v49 = *(void *)(a1 + 632);
  unint64_t v50 = v49 + v43;
  if (v43 < v49 + v43)
  {
    do
    {
      if (v43 != *(void *)(a1 + 656))
      {
        unint64_t v51 = (void *)[*(id *)(a1 + 96) objectAtIndex:v43];
        objc_super v52 = (opaqueCMSampleBuffer *)[v51 firstObject];
        if (v52)
        {
          v53 = v52;
          *(unsigned char *)(a1 + 573) = 1;
          CMSampleBufferGetPresentationTimeStamp(&v136, v52);
          *(_OWORD *)&time1.duration.unsigned int value = *(_OWORD *)(a1 + 264);
          time1.duration.CMTimeEpoch epoch = *(void *)(a1 + 280);
          if (CMTimeCompare(&v136, &time1.duration) < 0)
          {
            *(_OWORD *)&time1.duration.unsigned int value = *(_OWORD *)(a1 + 264);
            time1.duration.CMTimeEpoch epoch = *(void *)(a1 + 280);
            CMSampleBufferRef AudioBufferTrimmedToStartTime = fcn_createAudioBufferTrimmedToStartTime(v53, &time1.duration);
            if (AudioBufferTrimmedToStartTime)
            {
              CMSampleBufferRef v55 = AudioBufferTrimmedToStartTime;
              [v51 replaceObjectAtIndex:0 withObject:AudioBufferTrimmedToStartTime];
              CFRelease(v55);
            }
            else
            {
              [v51 removeObjectAtIndex:0];
            }
          }
        }
      }
      ++v43;
      unint64_t v50 = *(void *)(a1 + 632) + *(void *)(a1 + 624);
    }
    while (v43 < v50);
    a2 = sbuf;
  }
  for (; v50 < *(void *)(a1 + 608); ++v50)
  {
    if (v50 != *(void *)(a1 + 656))
    {
      v56 = (void *)[*(id *)(a1 + 96) objectAtIndexedSubscript:v50];
      if (![v56 count]
        || (CMSampleBufferGetPresentationTimeStamp(&v135, (CMSampleBufferRef)[v56 objectAtIndexedSubscript:0]), *(_OWORD *)&time1.duration.unsigned int value = *(_OWORD *)(a1 + 264), time1.duration.epoch = *(void *)(a1 + 280), CMTimeCompare(&v135, &time1.duration) >= 1))
      {
        *(_OWORD *)&time1.duration.unsigned int value = *(_OWORD *)(a1 + 264);
        time1.duration.CMTimeEpoch epoch = *(void *)(a1 + 280);
        CMSampleBufferRef v57 = -[BWFileCoordinatorNode _createEmptyMetadataSBufWithPTS:forInputIndex:]((CMSampleBufferRef)a1, (uint64_t)&time1, v50);
        if (v57)
        {
          CMSampleBufferRef v58 = v57;
          [v56 insertObject:v57 atIndex:0];
          CFRelease(v58);
        }
      }
    }
  }
  if (*(unsigned char *)(a1 + 204) & 1) != 0 && (*(unsigned char *)(a1 + 228))
  {
    memset(&time1, 0, 24);
    *(_OWORD *)CMTime time2 = *(_OWORD *)(a1 + 192);
    *(void *)&time2[16] = *(void *)(a1 + 208);
    *(_OWORD *)&rhs.duration.unsigned int value = *(_OWORD *)(a1 + 216);
    rhs.duration.CMTimeEpoch epoch = *(void *)(a1 + 232);
    CMTimeAdd(&time1.duration, (CMTime *)time2, &rhs.duration);
    if (*(unsigned char *)(a1 + 180))
    {
      *(_OWORD *)&rhs.duration.unsigned int value = *(_OWORD *)&time1.duration.value;
      rhs.duration.CMTimeEpoch epoch = time1.duration.epoch;
      CMTime presentationTimeStamp = *(CMTime *)(a1 + 168);
      CMTimeSubtract((CMTime *)time2, &rhs.duration, &presentationTimeStamp);
      *(_OWORD *)&time1.duration.unsigned int value = *(_OWORD *)time2;
      time1.duration.CMTimeEpoch epoch = *(void *)&time2[16];
    }
    *(_OWORD *)&rhs.duration.unsigned int value = *(_OWORD *)(a1 + 264);
    rhs.duration.CMTimeEpoch epoch = *(void *)(a1 + 280);
    CMTime presentationTimeStamp = time1.duration;
    CMTimeSubtract((CMTime *)time2, &rhs.duration, &presentationTimeStamp);
    *(_OWORD *)(a1 + 168) = *(_OWORD *)time2;
    *(void *)(a1 + 184) = *(void *)&time2[16];
  }
  long long v59 = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 48);
  *(_OWORD *)&rhs.presentationTimeStamp.CMTimeScale timescale = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 32);
  *(_OWORD *)&rhs.decodeTimeStamp.unsigned int value = v59;
  rhs.decodeTimeStamp.CMTimeEpoch epoch = *(void *)(MEMORY[0x1E4F1FA70] + 64);
  long long v60 = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 16);
  *(_OWORD *)&rhs.duration.unsigned int value = *MEMORY[0x1E4F1FA70];
  *(_OWORD *)&rhs.duration.CMTimeEpoch epoch = v60;
  if (*(void *)(a1 + 112)
    || (v61 = (void *)[*(id *)(a1 + 96) objectAtIndex:*(void *)(a1 + 656)],
        ![v61 count]))
  {
    rhs.CMTime presentationTimeStamp = *(CMTime *)(a1 + 264);
  }
  else
  {
    if (*(unsigned char *)(a1 + 180))
    {
      CMSampleBufferGetPresentationTimeStamp(&v134, (CMSampleBufferRef)[v61 objectAtIndexedSubscript:0]);
      *(_OWORD *)CMTime time2 = *(_OWORD *)(a1 + 168);
      *(void *)&time2[16] = *(void *)(a1 + 184);
      CMTimeSubtract(&time1.duration, &v134, (CMTime *)time2);
      *(_OWORD *)&rhs.presentationTimeStamp.unsigned int value = *(_OWORD *)&time1.duration.value;
      CMTimeEpoch v62 = time1.duration.epoch;
    }
    else
    {
      *(_OWORD *)&rhs.presentationTimeStamp.unsigned int value = *(_OWORD *)(a1 + 264);
      CMTimeEpoch v62 = *(void *)(a1 + 280);
    }
    rhs.presentationTimeStamp.CMTimeEpoch epoch = v62;
  }
  target.unsigned int value = 0;
  CFAllocatorRef v63 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  if (!CMSampleBufferCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 1u, 0, 0, 0, 0, 1, &rhs, 0, 0, (CMSampleBufferRef *)&target))
  {
    uint64_t v64 = objc_msgSend((id)CMGetAttachment(a2, @"VariableFrameRateInfo", 0), "count");
    if (v64 && dword_1EB4C5030)
    {
      LODWORD(presentationTimeStamp.value) = 0;
      LOBYTE(duration.value) = 0;
      os_log_and_send_and_compose_flags_and_os_log_CMTime type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int value = presentationTimeStamp.value;
      if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, duration.value)) {
        unsigned int v67 = value;
      }
      else {
        unsigned int v67 = value & 0xFFFFFFFE;
      }
      if (v67)
      {
        *(_DWORD *)CMTime time2 = 136315394;
        *(void *)&time2[4] = "-[BWFileCoordinatorNode _doStartingToRecordWithSBuf:inputIndex:sbufPTS:]";
        *(_WORD *)&time2[12] = 2048;
        *(void *)&time2[14] = a1;
        LODWORD(v123) = 22;
        sampleTimingArray = (CMSampleTimingInfo *)time2;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      a2 = sbuf;
    }
    v68 = *(const void **)(a1 + 112);
    v69 = &unk_1E5C2C000;
    if (v68)
    {
      if (dword_1EB4C5030)
      {
        LODWORD(presentationTimeStamp.value) = 0;
        LOBYTE(duration.value) = 0;
        v70 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        unsigned int v71 = presentationTimeStamp.value;
        if (os_log_type_enabled(v70, duration.value)) {
          unsigned int v72 = v71;
        }
        else {
          unsigned int v72 = v71 & 0xFFFFFFFE;
        }
        if (v72)
        {
          uint64_t v73 = [*(id *)(a1 + 112) settingsID];
          *(_OWORD *)&time1.duration.unsigned int value = *(_OWORD *)(a1 + 264);
          time1.duration.CMTimeEpoch epoch = *(void *)(a1 + 280);
          Float64 v74 = CMTimeGetSeconds(&time1.duration);
          int v75 = *(_DWORD *)(a1 + 552);
          int v76 = *(_DWORD *)(a1 + 556);
          uint64_t v77 = *(void *)(a1 + 528);
          int v78 = *(_DWORD *)(a1 + 560);
          uint64_t v79 = *(void *)(a1 + 536);
          int v80 = *(_DWORD *)(a1 + 564);
          *(_DWORD *)CMTime time2 = 136317698;
          *(void *)&time2[4] = "-[BWFileCoordinatorNode _doStartingToRecordWithSBuf:inputIndex:sbufPTS:]";
          *(_WORD *)&time2[12] = 2048;
          *(void *)&time2[14] = a1;
          *(_WORD *)&time2[22] = 2112;
          *(void *)&time2[24] = 0x1EFA73540;
          *(_WORD *)&time2[32] = 2048;
          *(void *)&time2[34] = v73;
          *(_WORD *)&time2[42] = 2048;
          *(Float64 *)&time2[44] = v74;
          *(_WORD *)&time2[52] = 1024;
          *(_DWORD *)&time2[54] = v75;
          *(_WORD *)&time2[58] = 1024;
          *(_DWORD *)&time2[60] = v76;
          *(_WORD *)v154 = 2048;
          *(void *)&v154[2] = v77;
          __int16 v155 = 1024;
          int v156 = v78;
          __int16 v157 = 2048;
          uint64_t v158 = v79;
          __int16 v159 = 1024;
          int v160 = v80;
          LODWORD(v123) = 96;
          sampleTimingArray = (CMSampleTimingInfo *)time2;
          _os_log_send_and_compose_impl();
        }
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        v68 = *(const void **)(a1 + 112);
        a2 = sbuf;
      }
      CMSetAttachment((CMAttachmentBearerRef)target.value, @"RecordingSettings", v68, 1u);
      v87 = *(const void **)(a1 + 144);
      if (v87) {
        CMSetAttachment((CMAttachmentBearerRef)target.value, @"RecordingVideoSettings", v87, 1u);
      }
      if (*(float *)(a1 + 152) > 0.0) {
        CMSetAttachment((CMAttachmentBearerRef)target.value, @"RecordingMaxVideoFrameRate", (CFTypeRef)objc_msgSend(NSNumber, "numberWithFloat:"), 1u);
      }
      CFStringRef v88 = @"FileWriterAction";
      CMSetAttachment((CMAttachmentBearerRef)target.value, @"FileWriterAction", @"Start", 1u);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (FigDebugIsInternalBuild())
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v89 = *(void **)(a1 + 112);
            v90 = (void *)[v89 movieLevelMetadata];
            if (v64) {
              uint64_t v91 = 60;
            }
            else {
              uint64_t v91 = (int)*(float *)(a1 + 152);
            }
            MovieLevelMetadataWithVariableFrameRate = (void *)FigCaptureMetadataUtilitiesCreateMovieLevelMetadataWithVariableFrameRate(v90, v64 != 0, v91);
            [v89 setMovieLevelMetadata:MovieLevelMetadataWithVariableFrameRate];
          }
        }
        if (*(void *)(a1 + 656) < *(void *)(a1 + 624))
        {
          v93 = (void *)CMGetAttachment((CMAttachmentBearerRef)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 96), "objectAtIndex:"), "firstObject"), key, 0);
          v94 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
          uint64_t v95 = *MEMORY[0x1E4F53DE0];
          uint64_t v96 = [v93 objectForKeyedSubscript:*MEMORY[0x1E4F53DE0]];
          if (v96) {
            [v94 setObject:v96 forKeyedSubscript:v95];
          }
          uint64_t v97 = *MEMORY[0x1E4F54128];
          uint64_t v98 = objc_msgSend(v93, "objectForKeyedSubscript:", *MEMORY[0x1E4F54128], sampleTimingArray, v123);
          if (v98) {
            [v94 setObject:v98 forKeyedSubscript:v97];
          }
          a2 = sbuf;
          if ([v94 count]) {
            CMSetAttachment((CMAttachmentBearerRef)target.value, key, v94, 1u);
          }
        }
      }
      *(void *)(a1 + 120) = objc_msgSend(*(id *)(a1 + 112), "settingsID", sampleTimingArray, v123);
      *(unsigned char *)(a1 + 141) = v125;
      if (v125 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
        char v99 = [*(id *)(a1 + 112) isIrisMovieRecording];
      }
      else {
        char v99 = 0;
      }
      *(unsigned char *)(a1 + 142) = v99;
      if (*(unsigned char *)(a1 + 682))
      {
        objc_opt_class();
        BOOL v100 = (objc_opt_isKindOfClass() & 1) != 0 && [*(id *)(a1 + 112) spatialOverCaptureMovieURL] != 0;
        *(unsigned char *)(a1 + 683) = v100;
      }
      -[BWFileCoordinatorNode _releaseSettings](a1);
    }
    else
    {
      v81 = (CFTypeRef *)&unk_1E5C2C000;
      if (dword_1EB4C5030)
      {
        LODWORD(presentationTimeStamp.value) = 0;
        LOBYTE(duration.value) = 0;
        v82 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        unsigned int v83 = presentationTimeStamp.value;
        if (os_log_type_enabled(v82, duration.value)) {
          unsigned int v84 = v83;
        }
        else {
          unsigned int v84 = v83 & 0xFFFFFFFE;
        }
        if (v84)
        {
          uint64_t v85 = *(void *)(a1 + 120);
          time1.CMTime duration = rhs.presentationTimeStamp;
          Float64 v86 = CMTimeGetSeconds(&time1.duration);
          *(_DWORD *)CMTime time2 = 136316162;
          *(void *)&time2[4] = "-[BWFileCoordinatorNode _doStartingToRecordWithSBuf:inputIndex:sbufPTS:]";
          *(_WORD *)&time2[12] = 2048;
          *(void *)&time2[14] = a1;
          *(_WORD *)&time2[22] = 2112;
          *(void *)&time2[24] = 0x1EFA735A0;
          *(_WORD *)&time2[32] = 2048;
          *(void *)&time2[34] = v85;
          *(_WORD *)&time2[42] = 2048;
          *(Float64 *)&time2[44] = v86;
          v69 = &unk_1E5C2C000;
          LODWORD(v123) = 52;
          sampleTimingArray = (CMSampleTimingInfo *)time2;
          _os_log_send_and_compose_impl();
        }
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        a2 = sbuf;
        v81 = (CFTypeRef *)&unk_1E5C2C000;
      }
      CFStringRef v88 = (const __CFString *)*((void *)v69 + 153);
      CMSetAttachment((CMAttachmentBearerRef)target.value, v88, v81[157], 1u);
    }
    CFStringRef keya = (CFStringRef)CMGetAttachment((CMAttachmentBearerRef)target.value, v88, 0);
    memset(time2, 0, 24);
    CFDictionaryRef v101 = (const __CFDictionary *)CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E4F530C0], 0);
    CMTimeMakeFromDictionary((CMTime *)time2, v101);
    memset(&presentationTimeStamp, 0, sizeof(presentationTimeStamp));
    int64_t UpTimeNanoseconds = FigGetUpTimeNanoseconds();
    CMTimeMake(&presentationTimeStamp, UpTimeNanoseconds, 1000000000);
    if (*MEMORY[0x1E4F1EBA8] == 1)
    {
      *(_OWORD *)&time1.duration.unsigned int value = *(_OWORD *)time2;
      time1.duration.CMTimeEpoch epoch = *(void *)&time2[16];
      CMTimeGetSeconds(&time1.duration);
      time1.CMTime duration = presentationTimeStamp;
      CMTimeGetSeconds(&time1.duration);
      FormatDescription = CMSampleBufferGetFormatDescription((CMSampleBufferRef)a2);
      CMFormatDescriptionGetMediaType(FormatDescription);
      kdebug_trace();
    }
    long long v132 = 0u;
    long long v133 = 0u;
    long long v130 = 0u;
    long long v131 = 0u;
    v104 = objc_msgSend((id)a1, "outputs", sampleTimingArray, v123);
    uint64_t v105 = [v104 countByEnumeratingWithState:&v130 objects:v152 count:16];
    if (v105)
    {
      uint64_t v106 = v105;
      uint64_t v107 = *(void *)v131;
      do
      {
        for (uint64_t j = 0; j != v106; ++j)
        {
          if (*(void *)v131 != v107) {
            objc_enumerationMutation(v104);
          }
          v109 = *(void **)(*((void *)&v130 + 1) + 8 * j);
          time1.duration.unsigned int value = 0;
          uint64_t Copy = CMSampleBufferCreateCopy(v63, (CMSampleBufferRef)target.value, (CMSampleBufferRef *)&time1);
          if (!Copy) {
            [v109 emitSampleBuffer:time1.duration.value];
          }
          if (time1.duration.value) {
            CFRelease((CFTypeRef)time1.duration.value);
          }
        }
        uint64_t v106 = [v104 countByEnumeratingWithState:&v130 objects:v152 count:16];
      }
      while (v106);
    }
    else
    {
      uint64_t Copy = 0;
    }
    CFRelease((CFTypeRef)target.value);
    v111 = *(void **)(a1 + 720);
    if (v111)
    {
      uint64_t v112 = *(void *)(a1 + 120);
      *(_OWORD *)&time1.duration.unsigned int value = *(_OWORD *)(a1 + 264);
      time1.duration.CMTimeEpoch epoch = *(void *)(a1 + 280);
      [v111 fileCoordinator:a1 sentMarkerBufferForFileWriterAction:keya withPTS:&time1 settingsID:v112 errorCode:Copy];
    }
  }
  unint64_t v113 = *(void *)(a1 + 608);
  *(_OWORD *)sbufa = *MEMORY[0x1E4F1FA10];
  CMTimeEpoch v114 = *(void *)(MEMORY[0x1E4F1FA10] + 16);
  do
  {
    *(_OWORD *)&time1.duration.unsigned int value = *(_OWORD *)sbufa;
    time1.duration.CMTimeEpoch epoch = v114;
    if (v113)
    {
      unint64_t v115 = 0;
      do
      {
        v116 = (void *)[*(id *)(a1 + 96) objectAtIndex:v115];
        if ([v116 count])
        {
          v117 = (opaqueCMSampleBuffer *)[v116 firstObject];
          memset(time2, 0, 24);
          CMSampleBufferGetPresentationTimeStamp((CMTime *)time2, v117);
          CMTime presentationTimeStamp = *(CMTime *)time2;
          CMTime duration = time1.duration;
          if (CMTimeCompare(&presentationTimeStamp, &duration) < 0)
          {
            *(_OWORD *)&time1.duration.unsigned int value = *(_OWORD *)time2;
            time1.duration.CMTimeEpoch epoch = *(void *)&time2[16];
            unint64_t v113 = v115;
          }
        }
        ++v115;
        unint64_t v118 = *(void *)(a1 + 608);
      }
      while (v115 < v118);
      if (v113 < v118) {
        -[BWFileCoordinatorNode _emitStagedBufferForIndex:stoppingOrPausing:]((id *)a1, v113);
      }
    }
    BOOL v119 = v113 >= *(void *)(a1 + 608);
    unint64_t v113 = *(void *)(a1 + 608);
  }
  while (!v119);
  -[BWFileCoordinatorNode _flushPendingIrisRequestMarkerBuffers](a1);
}

- (opaqueCMSampleBuffer)_copyFirstValidLowLatencyAudioBuffer:(uint64_t)a3 inputIndex:(CMTime *)a4 sbufPTS:
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v7 = MEMORY[0x1E4F1F9F8];
  CMTimeValue value = *MEMORY[0x1E4F1F9F8];
  CMTimeScale timescale = *(_DWORD *)(MEMORY[0x1E4F1F9F8] + 8);
  memset(&v16, 0, sizeof(v16));
  CMSampleBufferGetDuration(&v16, sbuf);
  if (v16.flags)
  {
    CMSampleBufferGetPresentationTimeStamp(&lhs, sbuf);
    CMTime v13 = v16;
    CMTimeAdd(&time1, &lhs, &v13);
    CMTimeValue value = time1.value;
    CMTimeFlags flags = time1.flags;
    CMTimeScale timescale = time1.timescale;
    CMTimeEpoch epoch = time1.epoch;
    if ((time1.flags & 1) == 0) {
      return 0;
    }
  }
  else
  {
    CMTimeFlags flags = *(_DWORD *)(v7 + 12);
    CMTimeEpoch epoch = *(void *)(v7 + 16);
    if ((flags & 1) == 0) {
      return 0;
    }
  }
  time1.CMTimeValue value = value;
  time1.CMTimeScale timescale = timescale;
  time1.CMTimeFlags flags = flags;
  time1.CMTimeEpoch epoch = epoch;
  CMTime v13 = *(CMTime *)(a1 + 264);
  if (CMTimeCompare(&time1, &v13) < 1) {
    return 0;
  }
  *(unsigned char *)(a1 + 573) = 1;
  CMTime time1 = *a4;
  CMTime v13 = *(CMTime *)(a1 + 264);
  if ((CMTimeCompare(&time1, &v13) & 0x80000000) == 0) {
    return (opaqueCMSampleBuffer *)CFRetain(sbuf);
  }
  CMTime time1 = *(CMTime *)(a1 + 264);
  started = fcn_createAudioBufferTrimmedToStartTime(sbuf, &time1);
  int v10 = started;
  if (started)
  {
    memset(&time1, 0, sizeof(time1));
    CMSampleBufferGetPresentationTimeStamp(&time1, started);
  }
  return v10;
}

- (void)_doStoppingOrPausingWithSBuf:(unint64_t)a3 inputIndex:(uint64_t)a4 sbufPTS:
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  uint64_t v8 = objc_msgSend(*(id *)(a1 + 96), "objectAtIndex:");
  if (!v8)
  {
    pthread_mutex_unlock(*(pthread_mutex_t **)(a1 + 600));
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Could not find staging queue for given input" userInfo:0]);
  }
  CMTime v9 = v8;
  [v8 addObject:a2];
  if (*(void *)(a1 + 656) != a3)
  {
    if (*(void *)(a1 + 632) + *(void *)(a1 + 624) <= a3) {
      goto LABEL_18;
    }
    if ([v9 count] != 1) {
      goto LABEL_18;
    }
    *(_OWORD *)&time1.duration.CMTimeValue value = *(_OWORD *)(a1 + 288);
    time1.duration.CMTimeEpoch epoch = *(void *)(a1 + 304);
    *(_OWORD *)&time2.duration.CMTimeValue value = *(_OWORD *)a4;
    time2.duration.CMTimeEpoch epoch = *(void *)(a4 + 16);
    if ((CMTimeCompare(&time1.duration, &time2.duration) & 0x80000000) == 0) {
      goto LABEL_18;
    }
    uint64_t v10 = *(void *)(a4 + 16);
    *(_OWORD *)(a1 + 288) = *(_OWORD *)a4;
    *(void *)(a1 + 304) = v10;
LABEL_11:
    uint64_t v11 = [*(id *)(a1 + 96) objectAtIndex:*(void *)(a1 + 656)];
    uint64_t v12 = a1 + 360;
    if (*(unsigned char *)(a1 + 372))
    {
      CMTime v13 = (void *)v11;
      uint64_t v14 = MEMORY[0x1E4F1F9F8];
      do
      {
        *(_OWORD *)&time1.duration.CMTimeValue value = *(_OWORD *)(a1 + 288);
        time1.duration.CMTimeEpoch epoch = *(void *)(a1 + 304);
        *(_OWORD *)&time2.duration.CMTimeValue value = *(_OWORD *)v12;
        time2.duration.CMTimeEpoch epoch = *(void *)(v12 + 16);
        if (CMTimeCompare(&time1.duration, &time2.duration) < 1) {
          break;
        }
        -[BWFileCoordinatorNode _emitStagedBufferForIndex:stoppingOrPausing:]((id *)a1, *(void *)(a1 + 656));
        Float64 v15 = (_OWORD *)(a1 + 360);
        if ([v13 count])
        {
          fcn_getEndingPTSOfFirstBufferInStagingQueue(v13, (uint64_t)&time1);
          _OWORD *v15 = *(_OWORD *)&time1.duration.value;
          *(void *)(a1 + 376) = time1.duration.epoch;
        }
        else
        {
          _OWORD *v15 = *(_OWORD *)v14;
          *(void *)(a1 + 376) = *(void *)(v14 + 16);
        }
        uint64_t v12 = a1 + 360;
      }
      while ((*(unsigned char *)(a1 + 372) & 1) != 0);
    }
    goto LABEL_18;
  }
  if ((*(unsigned char *)(a1 + 372) & 1) == 0)
  {
    fcn_getEndingPTSOfFirstBufferInStagingQueue(v9, (uint64_t)&time1);
    *(_OWORD *)(a1 + 360) = *(_OWORD *)&time1.duration.value;
    *(void *)(a1 + 376) = time1.duration.epoch;
    if (*(unsigned char *)(a1 + 372)) {
      goto LABEL_11;
    }
  }
LABEL_18:
  if (*(unsigned char *)(a1 + 372))
  {
    if (*(unsigned char *)(a1 + 680)
      && objc_msgSend((id)objc_msgSend(*(id *)(a1 + 96), "objectAtIndexedSubscript:", 1), "count"))
    {
      *(unsigned char *)(a1 + 572) = 1;
    }
    if (*(unsigned char *)(a1 + 572))
    {
      CMTime v16 = (void *)[*(id *)(a1 + 96) objectAtIndex:*(void *)(a1 + 656)];
      if ((unint64_t)[v16 count] >= 2)
      {
        do
          [v16 removeObjectAtIndex:1];
        while ((unint64_t)[v16 count] > 1);
      }
    }
    uint64_t v17 = &OBJC_IVAR___FigCaptureCMSession__cmsession;
    if (*(void *)(a1 + 608))
    {
      unint64_t v18 = 0;
      do
      {
        if (v18 != *(void *)(a1 + 656))
        {
          uint64_t v19 = (void *)[*(id *)(a1 + 96) objectAtIndex:v18];
          fcn_getEndingPTSOfFirstBufferInStagingQueue(v19, (uint64_t)&time1);
          duration.CMTimeValue value = time1.duration.value;
          CMTimeFlags flags = time1.duration.flags;
          duration.CMTimeScale timescale = time1.duration.timescale;
          if (time1.duration.flags)
          {
            CMTimeEpoch epoch = time1.duration.epoch;
            do
            {
              time1.duration.CMTimeValue value = duration.value;
              time1.duration.CMTimeScale timescale = duration.timescale;
              time1.duration.CMTimeFlags flags = flags;
              time1.duration.CMTimeEpoch epoch = epoch;
              *(_OWORD *)&time2.duration.CMTimeValue value = *(_OWORD *)(a1 + 360);
              time2.duration.CMTimeEpoch epoch = *(void *)(a1 + 376);
              if ((CMTimeCompare(&time1.duration, &time2.duration) & 0x80000000) == 0) {
                break;
              }
              -[BWFileCoordinatorNode _emitStagedBufferForIndex:stoppingOrPausing:]((id *)a1, v18);
              fcn_getEndingPTSOfFirstBufferInStagingQueue(v19, (uint64_t)&time1);
              duration.CMTimeValue value = time1.duration.value;
              CMTimeFlags flags = time1.duration.flags;
              duration.CMTimeScale timescale = time1.duration.timescale;
              CMTimeEpoch epoch = time1.duration.epoch;
            }
            while ((time1.duration.flags & 1) != 0);
          }
        }
        ++v18;
      }
      while (v18 < *(void *)(a1 + 608));
    }
    uint64_t v22 = *(void *)(a1 + 624);
    uint64_t v23 = *(void *)(a1 + 632);
    if (v23 + v22)
    {
      unint64_t v24 = 0;
      while (1)
      {
        if (v24 != *(void *)(a1 + 656))
        {
          fcn_getEndingPTSOfFirstBufferInStagingQueue((void *)[*(id *)(a1 + 96) objectAtIndex:v24], (uint64_t)v60);
          if ((v60[12] & 1) == 0) {
            break;
          }
        }
        ++v24;
        uint64_t v22 = *(void *)(a1 + 624);
        uint64_t v23 = *(void *)(a1 + 632);
        if (v24 >= v23 + v22) {
          goto LABEL_41;
        }
      }
      uint64_t v22 = *(void *)(a1 + 624);
      uint64_t v23 = *(void *)(a1 + 632);
    }
    else
    {
      unint64_t v24 = 0;
    }
LABEL_41:
    if (v23 + v22 == v24)
    {
      uint64_t v25 = (const __CFAllocator **)MEMORY[0x1E4F1CF80];
      if (v22)
      {
        unint64_t v26 = 0;
        CFAllocatorRef allocator = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
        do
        {
          unint64_t v27 = objc_msgSend(*(id *)(a1 + 96), "objectAtIndex:", v26, allocator);
          unint64_t v28 = (opaqueCMSampleBuffer *)[v27 objectAtIndexedSubscript:0];
          uint64_t v29 = v28;
          if (v26 == *(void *)(a1 + 656))
          {
            memset(&time1, 0, 24);
            CMSampleBufferGetPresentationTimeStamp(&time1.duration, v28);
            *(_OWORD *)&time2.duration.CMTimeValue value = *(_OWORD *)(a1 + 432);
            time2.duration.CMTimeEpoch epoch = *(void *)(a1 + 448);
            CMTime duration = time1.duration;
            if (CMTimeCompare(&time2.duration, &duration))
            {
              *(_OWORD *)(a1 + 432) = *(_OWORD *)&time1.duration.value;
              *(void *)(a1 + 448) = time1.duration.epoch;
            }
          }
          else
          {
            CMSampleBufferGetDuration(&v59, v28);
            if ((v59.flags & 1) != 0
              || (CMSampleBufferGetPresentationTimeStamp(&rhs, v29),
                  *(_OWORD *)&time1.duration.CMTimeValue value = *(_OWORD *)(a1 + 360),
                  time1.duration.CMTimeEpoch epoch = *(void *)(a1 + 376),
                  CMTimeSubtract(&time, &time1.duration, &rhs),
                  CMTimeGetSeconds(&time) >= 0.002))
            {
              CMTime v56 = *(CMTime *)(a1 + 360);
              CMSampleBufferRef sampleBufferOut = 0;
              memset(&duration, 0, sizeof(duration));
              CMSampleBufferGetDuration(&duration, v29);
              if (duration.flags)
              {
                CMItemCount timingArrayEntriesNeededOut = 0;
                CMItemCount NumSamples = CMSampleBufferGetNumSamples(v29);
                CMSampleBufferGetSampleTimingInfoArray(v29, 0, 0, &timingArrayEntriesNeededOut);
                long long v30 = 0;
                if (timingArrayEntriesNeededOut == 1)
                {
                  BOOL v32 = NumSamples == 1;
                  uint64_t v17 = &OBJC_IVAR___FigCaptureCMSession__cmsession;
                  if (v32)
                  {
                    memset(&time1, 0, sizeof(time1));
                    long long v30 = 0;
                    if (!CMSampleBufferGetSampleTimingInfo(v29, 0, &time1))
                    {
                      CMSampleTimingInfo time2 = time1;
                      CMTime lhs = v56;
                      CMTime sampleRange = time1.presentationTimeStamp;
                      CMTimeSubtract(&time2.duration, &lhs, &sampleRange);
                      CMSampleBufferCreateCopyWithNewTiming(allocator, v29, 1, &time2, &sampleBufferOut);
                      long long v30 = sampleBufferOut;
                    }
                  }
                }
                else
                {
                  uint64_t v17 = &OBJC_IVAR___FigCaptureCMSession__cmsession;
                }
              }
              else
              {
                long long v30 = CFRetain(v29);
              }
              [v27 removeAllObjects];
              if (v30)
              {
                [v27 addObject:v30];
                CFRelease(v30);
              }
            }
            else
            {
              [v27 removeAllObjects];
            }
          }
          ++v26;
          unint64_t v33 = *(void *)(a1 + 624);
        }
        while (v26 < v33);
        uint64_t v23 = *(void *)(a1 + 632);
        uint64_t v25 = (const __CFAllocator **)MEMORY[0x1E4F1CF80];
      }
      else
      {
        unint64_t v33 = 0;
      }
      unint64_t v34 = v23 + v33;
      if (v33 < v23 + v33)
      {
        CFAllocatorRef v35 = *v25;
        do
        {
          if (v33 != *(void *)(a1 + 656))
          {
            __int16 v36 = (void *)[*(id *)(a1 + 96) objectAtIndex:v33];
            Float64 v37 = (opaqueCMSampleBuffer *)[v36 firstObject];
            CMTime v56 = *(CMTime *)(a1 + 360);
            CMItemCount timingArrayEntriesNeededOut = 0;
            CMSampleBufferRef sampleBufferOut = 0;
            CMItemCount v38 = CMSampleBufferGetNumSamples(v37);
            CMSampleBufferGetSampleTimingInfoArray(v37, 0, 0, &timingArrayEntriesNeededOut);
            if (timingArrayEntriesNeededOut == 1 && v38 > 1)
            {
              memset(&time1, 0, sizeof(time1));
              if (!CMSampleBufferGetSampleTimingInfo(v37, 0, &time1))
              {
                memset(&time2, 0, 24);
                CMSampleBufferGetPresentationTimeStamp(&time2.duration, v37);
                FormatDescription = CMSampleBufferGetFormatDescription(v37);
                StreamBasicDescription = CMAudioFormatDescriptionGetStreamBasicDescription(FormatDescription);
                int32_t mSampleRate = (int)StreamBasicDescription->mSampleRate;
                CMTime lhs = time2.duration;
                CMTimeConvertScale(&duration, &lhs, mSampleRate, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
                time2.CMTime duration = duration;
                int32_t v42 = (int)StreamBasicDescription->mSampleRate;
                CMTime duration = v56;
                CMTimeConvertScale(&v56, &duration, v42, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
                CMTime duration = v56;
                CMTime lhs = time2.duration;
                CMTimeSubtract(&sampleRange, &duration, &lhs);
                v43.length = sampleRange.value;
                if (sampleRange.value >= v38)
                {
                  long long v44 = CFRetain(v37);
                  uint64_t v17 = &OBJC_IVAR___FigCaptureCMSession__cmsession;
LABEL_76:
                  [v36 removeAllObjects];
                  if (v44)
                  {
                    [v36 addObject:v44];
                    CFRelease(v44);
                  }
                  goto LABEL_70;
                }
                uint64_t v17 = &OBJC_IVAR___FigCaptureCMSession__cmsession;
                if (sampleRange.value > 0)
                {
                  v43.location = 0;
                  CMSampleBufferCopySampleBufferForRange(v35, v37, v43, &sampleBufferOut);
                  long long v44 = sampleBufferOut;
                  goto LABEL_76;
                }
              }
            }
            [v36 removeAllObjects];
          }
LABEL_70:
          ++v33;
          unint64_t v34 = *(void *)(a1 + 632) + *(void *)(a1 + 624);
        }
        while (v33 < v34);
      }
      for (unint64_t i = *(void *)(a1 + v17[780]); v34 < i; unint64_t i = *(void *)(a1 + v17[780]))
      {
        if (v34 != *(void *)(a1 + 656))
        {
          CMTimeEpoch v46 = (void *)[*(id *)(a1 + 96) objectAtIndex:v34];
          if ([v46 count])
          {
            CMSampleBufferRef v47 = (opaqueCMSampleBuffer *)[v46 firstObject];
            CMSampleBufferGetPresentationTimeStamp(&v54, v47);
            *(_OWORD *)&time1.duration.CMTimeValue value = *(_OWORD *)(a1 + 360);
            time1.duration.CMTimeEpoch epoch = *(void *)(a1 + 376);
            CMTimeSubtract(&v55, &time1.duration, &v54);
            if (CMTimeGetSeconds(&v55) < 0.002
              || (memset(&time1, 0, 24), CMSampleBufferGetDuration(&time1.duration, v47),
                                         (time1.duration.flags & 1) != 0))
            {
              [v46 removeAllObjects];
            }
            else
            {
              CFTypeRef v48 = CFRetain(v47);
              [v46 removeAllObjects];
              if (v48)
              {
                [v46 addObject:v48];
                CFRelease(v48);
              }
            }
          }
        }
        ++v34;
      }
      if (i)
      {
        unint64_t v49 = 0;
        unint64_t v50 = (const void *)*MEMORY[0x1E4F1CFD0];
        do
        {
          unint64_t v51 = (void *)[*(id *)(a1 + 96) objectAtIndex:v49];
          if ([v51 count])
          {
            if (v49 == *(void *)(a1 + 656) && *(unsigned char *)(a1 + 681) && *(void *)(a1 + 624))
            {
              objc_super v52 = (const void *)[v51 firstObject];
              if (v52) {
                CMSetAttachment(v52, @"FinalFrameInSequence", v50, 1u);
              }
            }
            -[BWFileCoordinatorNode _emitStagedBufferForIndex:stoppingOrPausing:]((id *)a1, v49);
            [v51 count];
          }
          ++v49;
        }
        while (v49 < *(void *)(a1 + v17[780]));
      }
      -[BWFileCoordinatorNode _flushSampleBuffersWaitingForMotionData](a1);
      -[BWFileCoordinatorNode _finishStoppingOrPausing:withErrorCode:](a1, *(_DWORD *)(a1 + 156) != 5, *(unsigned int *)(a1 + 576));
      *(_DWORD *)(a1 + 576) = 0;
    }
  }
}

- (void)handleDroppedSample:(id)a3 forInput:(id)a4
{
  if ((self->_recordingState & 0xFFFFFFFD) != 0)
  {
    if (*MEMORY[0x1E4F1EBA8] == 1)
    {
      if (a3) {
        [a3 pts];
      }
      else {
        memset(&v8, 0, sizeof(v8));
      }
      CMTime time = v8;
      CMTimeGetSeconds(&time);
      [a4 index];
      kdebug_trace();
    }
    uint64_t v7 = [a4 index];
    if (v7 == [(BWNodeInput *)self->_masterInput index]
      && ([a3 reason] == 0x1EFA67EA0
       || (__CFString *)[a3 reason] == @"VideoDeviceDiscontinuity"
       || (__CFString *)[a3 reason] == @"HighFrameRateAutoFocusDiscontinuity"))
    {
      ++self->_droppedFramesCountDueToISP;
    }
  }
}

- (int)startRecordingWithSettings:(id)a3 videoSettings:(id)a4 maxFrameRate:(float)a5 stopAtPTS:(id *)a6 startAfterPTS:(id *)a7
{
  pthread_mutex_lock((pthread_mutex_t *)self->_stateMutex);
  if (self->_recordingState)
  {
    int v13 = -16805;
  }
  else
  {
    self->_int recordingState = 3;
    -[BWFileCoordinatorNode _prepareToStartRecordingWithSettings:videoSettings:maxFrameRate:]((uint64_t)self, a3, a4, a5);
    int v13 = 0;
    long long v14 = *(_OWORD *)&a6->var0;
    self->_stopRecordingPTS.CMTimeEpoch epoch = a6->var3;
    *(_OWORD *)&self->_stopRecordingPTS.CMTimeValue value = v14;
    uint64_t v15 = MEMORY[0x1E4F1FA48];
    *(_OWORD *)&self->_stopRecordingAudioOffset.CMTimeValue value = *MEMORY[0x1E4F1FA48];
    self->_stopRecordingAudioOffset.CMTimeEpoch epoch = *(void *)(v15 + 16);
    long long v16 = *MEMORY[0x1E4F1F9F8];
    self->_stopRecordingObservedLastVideoPTS.CMTimeEpoch epoch = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
    *(_OWORD *)&self->_stopRecordingObservedLastVideoPTS.CMTimeValue value = v16;
    long long v17 = *(_OWORD *)&a7->var0;
    self->_startAfterPTS.CMTimeEpoch epoch = a7->var3;
    *(_OWORD *)&self->_startAfterPTS.CMTimeValue value = v17;
  }
  pthread_mutex_unlock((pthread_mutex_t *)self->_stateMutex);
  return v13;
}

- (uint64_t)_prepareToStartRecordingWithSettings:(void *)a3 videoSettings:(float)a4 maxFrameRate:
{
  if (!result) {
    return result;
  }
  uint64_t v7 = result;
  uint64_t v8 = MEMORY[0x1E4F1F9F8];
  long long v9 = *MEMORY[0x1E4F1F9F8];
  *(_OWORD *)(result + 240) = *MEMORY[0x1E4F1F9F8];
  uint64_t v10 = *(void *)(v8 + 16);
  *(void *)(result + 256) = v10;
  *(_OWORD *)(result + 384) = v9;
  *(void *)(result + 400) = v10;
  *(_OWORD *)(result + 216) = v9;
  *(void *)(result + 232) = v10;
  *(_OWORD *)(result + 192) = v9;
  *(void *)(result + 208) = v10;
  *(_OWORD *)(result + 168) = v9;
  *(void *)(result + 184) = v10;
  uint64_t v11 = MEMORY[0x1E4F1FA08];
  long long v12 = *MEMORY[0x1E4F1FA08];
  *(_OWORD *)(result + 312) = *MEMORY[0x1E4F1FA08];
  uint64_t v13 = *(void *)(v11 + 16);
  *(void *)(result + 328) = v13;
  *(_OWORD *)(result + 336) = v12;
  *(void *)(result + 352) = v13;
  *(unsigned char *)(result + 569) = 0;
  *(void *)(result + 472) = v10;
  *(_OWORD *)(result + 456) = v9;
  *(void *)(result + 496) = v10;
  *(_OWORD *)(result + 480) = v9;
  *(void *)(result + 520) = v10;
  long long v20 = v9;
  *(_OWORD *)(result + 504) = v9;
  *(void *)(result + 528) = 0;
  *(unsigned char *)(result + 568) = 0;
  *(void *)(result + 536) = 0;
  *(_DWORD *)(result + 552) = -1;
  *(_DWORD *)(result + 556) = -1;
  *(_DWORD *)(result + 560) = 0;
  *(_DWORD *)(result + 564) = 0;
  *(unsigned char *)(result + 769) = 0;
  *(unsigned char *)(result + 683) = 0;
  *(unsigned char *)(result + 684) = 0;
  *(unsigned char *)(result + 685) = 0;

  *(void *)(v7 + 112) = a2;
  *(void *)(v7 + 144) = a3;

  *(void *)(v7 + 784) = 0;
  *(float *)(v7 + 152) = a4;
  *(void *)(v7 + 776) = 0;
  -[BWFileCoordinatorNode _prepareToResumeRecording](v7);
  *(unsigned char *)(v7 + 140) = 0;
  objc_opt_class();
  uint64_t result = objc_opt_isKindOfClass();
  if (result)
  {
    if (*(void *)(v7 + 624))
    {
      long long v14 = *(void **)(v7 + 112);
      uint64_t result = [v14 isIrisRecording];
      if (result)
      {
        uint64_t result = [v14 isIrisRecording];
        if (!result) {
          goto LABEL_10;
        }
        uint64_t result = [v14 isIrisMovieRecording];
        if (!result) {
          goto LABEL_10;
        }
      }
    }
    else if (!*(void *)(v7 + 632))
    {
      goto LABEL_10;
    }
    *(unsigned char *)(v7 + 140) = 1;
  }
LABEL_10:
  if (*(unsigned char *)(v7 + 140) && gValidPrefersNoInterruptionsByRingtonesAndAlertsToken) {
    uint64_t result = -[BWFileCoordinatorNode _sendPrefersNoInterruptionsByRingtonesAndAlertsNotificationWithState:](v7, 1uLL);
  }
  *(_OWORD *)(v7 + 688) = v20;
  *(void *)(v7 + 704) = v10;
  if (*(void *)(v7 + 712))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v15 = [a2 videoOrientation];
    }
    else {
      uint64_t v15 = 0;
    }
    long long v17 = *(void **)(v7 + 712);
    uint64_t v18 = objc_msgSend(*(id *)(v7 + 112), "settingsID", v20);
    uint64_t v19 = *(unsigned __int8 *)(v7 + 140);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __89__BWFileCoordinatorNode__prepareToStartRecordingWithSettings_videoSettings_maxFrameRate___block_invoke;
    v21[3] = &unk_1E5C25388;
    v21[4] = v7;
    return [v17 prepareToStartRecordingWithOrientation:v15 recordingSettingsID:v18 prefersNoInterruptionsByRingtonesAndAlerts:v19 completionHandler:v21];
  }
  else
  {
    uint64_t v16 = MEMORY[0x1E4F1FA48];
    *(_OWORD *)(v7 + 688) = *MEMORY[0x1E4F1FA48];
    *(void *)(v7 + 704) = *(void *)(v16 + 16);
  }
  return result;
}

- (void)cancelStartRecordingWithSettings:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  pthread_mutex_lock((pthread_mutex_t *)self->_stateMutex);
  if (self->_recordingState == 3)
  {
    int64_t v5 = [(FigCaptureRecordingSettings *)self->_settings settingsID];
    if (v5 == [a3 settingsID])
    {
      long long v13 = 0u;
      long long v14 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      stagingQueues = self->_stagingQueues;
      uint64_t v7 = [(NSArray *)stagingQueues countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v12;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v12 != v9) {
              objc_enumerationMutation(stagingQueues);
            }
            [*(id *)(*((void *)&v11 + 1) + 8 * i) removeAllObjects];
          }
          uint64_t v8 = [(NSArray *)stagingQueues countByEnumeratingWithState:&v11 objects:v15 count:16];
        }
        while (v8);
      }
      [(NSMutableArray *)self->_videoSampleBuffersWaitingForMetadata removeAllObjects];
      self->_pendingMotionDataSerialNumber = 0;
      self->_largestEmittedLookAheadMotionDataSerialNumber = 0;
      -[BWFileCoordinatorNode _releaseSettings]((uint64_t)self);
      -[BWFileCoordinatorNode _completeTransitionToNotRecording]((uint64_t)self);
    }
  }
  pthread_mutex_unlock((pthread_mutex_t *)self->_stateMutex);
}

- (uint64_t)_completeTransitionToNotRecording
{
  if (result)
  {
    uint64_t v1 = result;
    *(_DWORD *)(result + 156) = 0;
    *(void *)(result + 120) = 0;
    *(unsigned char *)(result + 141) = 0;
    [*(id *)(result + 712) unprepareForRecording];
    if (*(unsigned char *)(v1 + 140)) {
      BOOL v2 = gValidPrefersNoInterruptionsByRingtonesAndAlertsToken == 0;
    }
    else {
      BOOL v2 = 1;
    }
    if (!v2) {
      -[BWFileCoordinatorNode _sendPrefersNoInterruptionsByRingtonesAndAlertsNotificationWithState:](v1, 0);
    }
    *(unsigned char *)(v1 + 140) = 0;
    return -[BWFileCoordinatorNode _flushPendingIrisRequestMarkerBuffers](v1);
  }
  return result;
}

- (void)stopRecordingWithErrorCode:(int)a3 setupToAllowWaitingForRecordingToStop:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  pthread_mutex_lock((pthread_mutex_t *)self->_stateMutex);
  if (v4) {
    -[BWFileCoordinatorNode _setupStateForWaitingForRecordingStop](&self->super.super);
  }
  -[BWFileCoordinatorNode _stopRecordingWithErrorCode:]((uint64_t)self, v5);
  stateMutex = self->_stateMutex;
  pthread_mutex_unlock((pthread_mutex_t *)stateMutex);
}

- (dispatch_semaphore_t)_setupStateForWaitingForRecordingStop
{
  if (result)
  {
    dispatch_semaphore_t v1 = result;
    if (HIDWORD(result[19].isa) == 1)
    {
      if (!LOBYTE(result[103].isa) && !result[102].isa)
      {
        LOBYTE(result[103].isa) = 1;
        uint64_t result = dispatch_semaphore_create(0);
        v1[102].isa = (Class)result;
      }
    }
    else if (dword_1EB4C5030)
    {
      os_log_and_send_and_compose_flags_and_os_log_CMTime type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      return (dispatch_semaphore_t)fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  return result;
}

- (BOOL)updateStopPTS:(id *)a3 audioOffset:(id *)a4 previousStopPTS:(id *)a5 previousAudioOffset:(id *)a6
{
  pthread_mutex_lock((pthread_mutex_t *)self->_stateMutex);
  if (self->_receivedFinalEnqueuedIrisReferenceRequest || (self->_recordingState | 2) != 3)
  {
    BOOL v11 = 0;
  }
  else
  {
    if (a5)
    {
      int64_t epoch = self->_stopRecordingPTS.epoch;
      *(_OWORD *)&a5->var0 = *(_OWORD *)&self->_stopRecordingPTS.value;
      a5->int64_t var3 = epoch;
    }
    if (a6)
    {
      long long v13 = *(_OWORD *)&self->_stopRecordingAudioOffset.value;
      a6->int64_t var3 = self->_stopRecordingAudioOffset.epoch;
      *(_OWORD *)&a6->var0 = v13;
    }
    int64_t var3 = a3->var3;
    *(_OWORD *)&self->_stopRecordingPTS.CMTimeValue value = *(_OWORD *)&a3->var0;
    self->_stopRecordingPTS.int64_t epoch = var3;
    int64_t v15 = a4->var3;
    *(_OWORD *)&self->_stopRecordingAudioOffset.CMTimeValue value = *(_OWORD *)&a4->var0;
    self->_stopRecordingAudioOffset.int64_t epoch = v15;
    BOOL v11 = 1;
  }
  pthread_mutex_unlock((pthread_mutex_t *)self->_stateMutex);
  return v11;
}

- (void)pauseRecording
{
  pthread_mutex_lock((pthread_mutex_t *)self->_stateMutex);
  int recordingState = self->_recordingState;
  if (recordingState == 1)
  {
    uint64_t v4 = MEMORY[0x1E4F1F9F8];
    *(_OWORD *)&self->_masterStoppingPTS.CMTimeValue value = *MEMORY[0x1E4F1F9F8];
    self->_masterStoppingPTS.int64_t epoch = *(void *)(v4 + 16);
    int64_t epoch = self->_largestMetadataPTS.epoch;
    *(_OWORD *)&self->_largestStagedSupportingAudioVideoStagedPTS.CMTimeValue value = *(_OWORD *)&self->_largestMetadataPTS.value;
    self->_largestStagedSupportingAudioVideoStagedPTS.int64_t epoch = epoch;
    self->_lowLatencyCanTossExtraVideoWhenStopping = 0;
    self->_int recordingState = 5;
    -[BWFileCoordinatorNode _flushAllBuffersFromRecordingStagingQueues]((unint64_t)self);
  }
  else if (recordingState == 3)
  {
    -[BWFileCoordinatorNode _finishStoppingOrPausing:withErrorCode:]((uint64_t)self, 0, 0);
  }
  stateMutex = self->_stateMutex;
  pthread_mutex_unlock((pthread_mutex_t *)stateMutex);
}

- (void)resumeRecording
{
  pthread_mutex_lock((pthread_mutex_t *)self->_stateMutex);
  if (self->_recordingState == 2)
  {
    self->_int recordingState = 3;
    -[BWFileCoordinatorNode _prepareToResumeRecording]((uint64_t)self);
  }
  stateMutex = self->_stateMutex;
  pthread_mutex_unlock((pthread_mutex_t *)stateMutex);
}

- (uint64_t)_prepareToResumeRecording
{
  if (result)
  {
    uint64_t v1 = MEMORY[0x1E4F1F9F8];
    *(_OWORD *)(result + 264) = *MEMORY[0x1E4F1F9F8];
    *(void *)(result + 280) = *(void *)(v1 + 16);
    uint64_t v2 = *(void *)(result + 352);
    *(_OWORD *)(result + 288) = *(_OWORD *)(result + 336);
    *(void *)(result + 304) = v2;
    *(unsigned char *)(result + 570) = 0;
    *(unsigned char *)(result + 571) = 0;
    *(unsigned char *)(result + 573) = 0;
    if (*(unsigned char *)(result + 140))
    {
      if (gValidPrefersNoInterruptionsByRingtonesAndAlertsToken) {
        return -[BWFileCoordinatorNode _sendPrefersNoInterruptionsByRingtonesAndAlertsNotificationWithState:](result, 1uLL);
      }
    }
  }
  return result;
}

- (void)recordingTerminated:(int64_t)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  pthread_mutex_lock((pthread_mutex_t *)self->_stateMutex);
  -[BWFileCoordinatorNode _flushAllBuffersFromRecordingStagingQueues]((unint64_t)self);
  if (self->_currSettingsID == a3)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    stagingQueues = self->_stagingQueues;
    uint64_t v6 = [(NSArray *)stagingQueues countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(stagingQueues);
          }
          [*(id *)(*((void *)&v11 + 1) + 8 * i) removeAllObjects];
        }
        uint64_t v7 = [(NSArray *)stagingQueues countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
    [(NSMutableArray *)self->_videoSampleBuffersWaitingForMetadata removeAllObjects];
    self->_pendingMotionDataSerialNumber = 0;
    self->_largestEmittedLookAheadMotionDataSerialNumber = 0;
    -[BWFileCoordinatorNode _completeTransitionToNotRecording]((uint64_t)self);
    $95D729B680665BEAEFA1D6FCA8238556 masterStoppingPTS = self->_masterStoppingPTS;
    -[BWFileCoordinatorNode _emitMarkerBufferForFileWriterAction:withPTS:settings:settingsID:errorCode:]((uint64_t)self, @"Terminate", (CMTime *)&masterStoppingPTS, 0, a3, 0);
    -[BWFileCoordinatorNode _releaseSettings]((uint64_t)self);
  }
  pthread_mutex_unlock((pthread_mutex_t *)self->_stateMutex);
}

- (uint64_t)_emitMarkerBufferForFileWriterAction:(CMTime *)a3 withPTS:(const void *)a4 settings:(uint64_t)a5 settingsID:(uint64_t)a6 errorCode:
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    long long v11 = (void *)result;
    CMAttachmentBearerRef target = 0;
    long long v12 = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 48);
    *(_OWORD *)&v36.presentationTimeStamp.CMTimeScale timescale = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 32);
    *(_OWORD *)&v36.decodeTimeStamp.CMTimeValue value = v12;
    CMTimeEpoch v13 = *(void *)(MEMORY[0x1E4F1FA70] + 64);
    long long v14 = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 16);
    *(_OWORD *)&v36.duration.CMTimeValue value = *MEMORY[0x1E4F1FA70];
    *(_OWORD *)&v36.duration.CMTimeEpoch epoch = v14;
    *(_OWORD *)&v36.presentationTimeStamp.CMTimeValue value = *(_OWORD *)&a3->value;
    CMTimeEpoch epoch = a3->epoch;
    v36.decodeTimeStamp.CMTimeEpoch epoch = v13;
    v36.presentationTimeStamp.CMTimeEpoch epoch = epoch;
    if (*(unsigned char *)(result + 180))
    {
      CMTime lhs = *a3;
      CMTime rhs = *(CMTime *)(result + 168);
      CMTimeSubtract(&v36.presentationTimeStamp, &lhs, &rhs);
    }
    CFAllocatorRef v16 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    unsigned int Copy = CMSampleBufferCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 1u, 0, 0, 0, 0, 1, &v36, 0, 0, (CMSampleBufferRef *)&target);
    if (!Copy)
    {
      int v29 = a6;
      uint64_t v28 = a5;
      if (dword_1EB4C5030)
      {
        int v35 = 0;
        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
        os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        a6 = a6;
      }
      CMSetAttachment(target, @"FileWriterAction", a2, 1u);
      if (a6) {
        CMSetAttachment(target, @"FileWriterStopErrorCode", (CFTypeRef)[NSNumber numberWithInt:a6], 1u);
      }
      if (a4) {
        CMSetAttachment(target, @"RecordingSettings", a4, 1u);
      }
      if (v11[97] && (FigCFEqual() || FigCFEqual() || FigCFEqual())) {
        CMSetAttachment(target, @"RecordingFrameDropsCountDueToISP", (CFTypeRef)objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", v11[97], sampleTimingArray, v27), 1u);
      }
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      uint64_t v19 = objc_msgSend(v11, "outputs", sampleTimingArray, v27);
      uint64_t v20 = [v19 countByEnumeratingWithState:&v30 objects:v38 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v31;
        do
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v31 != v22) {
              objc_enumerationMutation(v19);
            }
            unint64_t v24 = *(void **)(*((void *)&v30 + 1) + 8 * i);
            lhs.CMTimeValue value = 0;
            unsigned int Copy = CMSampleBufferCreateCopy(v16, (CMSampleBufferRef)target, (CMSampleBufferRef *)&lhs);
            if (!Copy) {
              [v24 emitSampleBuffer:lhs.value];
            }
            if (lhs.value) {
              CFRelease((CFTypeRef)lhs.value);
            }
          }
          uint64_t v21 = [v19 countByEnumeratingWithState:&v30 objects:v38 count:16];
        }
        while (v21);
        a5 = v28;
      }
      else
      {
        unsigned int Copy = 0;
      }
      LODWORD(a6) = v29;
      if (target) {
        CFRelease(target);
      }
    }
    uint64_t result = v11[90];
    if (result)
    {
      if (Copy) {
        uint64_t v25 = Copy;
      }
      else {
        uint64_t v25 = a6;
      }
      CMTime lhs = *a3;
      return [(id)result fileCoordinator:v11 sentMarkerBufferForFileWriterAction:a2 withPTS:&lhs settingsID:a5 errorCode:v25];
    }
  }
  return result;
}

- (void)tryToEmitFramesWaitingForMotion
{
  pthread_mutex_lock((pthread_mutex_t *)self->_stateMutex);
  if (self->_pendingMotionDataSerialNumber) {
    -[BWFileCoordinatorNode _emitSampleBuffersWaitingForMotionData]((uint64_t)self);
  }
  stateMutex = self->_stateMutex;
  pthread_mutex_unlock((pthread_mutex_t *)stateMutex);
}

- (void)_emitSampleBuffersWaitingForMotionData
{
  if (a1)
  {
    if ([*(id *)(a1 + 736) count])
    {
      uint64_t v2 = [*(id *)(a1 + 728) copyMotionDataForSerialNumber:*(void *)(a1 + 744) + *(void *)(a1 + 752)];
      if (v2)
      {
        CFStringRef v3 = (const __CFString *)*MEMORY[0x1E4F53070];
        uint64_t v4 = *MEMORY[0x1E4F55720];
        while (1)
        {
          id v6 = (id)v2;
          uint64_t v5 = (void *)[*(id *)(a1 + 736) firstObject];
          -[BWFileCoordinatorNode _addLookAheadMotionDataToMetadataForSampleBuffer:lookAheadMotionData:](a1, v5, v6);
          -[BWFileCoordinatorNode _emitSampleBuffer:forInput:toOutput:](a1, v5, *(void **)(a1 + 8), *(void **)(a1 + 16));
          [*(id *)(a1 + 736) removeObjectAtIndex:0];
          if (![*(id *)(a1 + 736) count]) {
            break;
          }
          *(void *)(a1 + 752) = objc_msgSend((id)objc_msgSend((id)CMGetAttachment((CMAttachmentBearerRef)objc_msgSend(*(id *)(a1 + 736), "firstObject"), v3, 0), "objectForKeyedSubscript:", v4), "unsignedLongLongValue");

          uint64_t v2 = [*(id *)(a1 + 728) copyMotionDataForSerialNumber:*(void *)(a1 + 744) + *(void *)(a1 + 752)];
          if (!v2) {
            return;
          }
        }
        *(void *)(a1 + 752) = 0;
      }
    }
  }
}

- (void)waitForRecordingToStopWithTimeout:(float)a3
{
  pthread_mutex_lock((pthread_mutex_t *)self->_stateMutex);
  uint64_t v5 = self->_recordingStoppedSemaphore;
  pthread_mutex_unlock((pthread_mutex_t *)self->_stateMutex);
  if (v5)
  {
    dispatch_time_t v6 = dispatch_time(0, (uint64_t)(float)(a3 * 1000000000.0));
    intptr_t v7 = dispatch_semaphore_wait((dispatch_semaphore_t)v5, v6);
    pthread_mutex_lock((pthread_mutex_t *)self->_stateMutex);

    self->_recordingStoppedSemaphore = 0;
    self->_haveSetupWaitingForRecordingStopState = 0;
    pthread_mutex_unlock((pthread_mutex_t *)self->_stateMutex);
    if (v7) {
      BOOL v8 = dword_1EB4C5030 == 0;
    }
    else {
      BOOL v8 = 1;
    }
    if (!v8)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
}

- (uint64_t)_sendPrefersNoInterruptionsByRingtonesAndAlertsNotificationWithState:(uint64_t)result
{
  if (result)
  {
    if (notify_set_state(gPrefersNoInterruptionsByRingtonesAndAlertsToken, state64)) {
      return FigDebugAssert3();
    }
    uint64_t result = notify_post("com.apple.avcapture.prefersnointerruptionsbyringtonesandalerts");
    if (result) {
      return FigDebugAssert3();
    }
  }
  return result;
}

uint64_t __89__BWFileCoordinatorNode__prepareToStartRecordingWithSettings_videoSettings_maxFrameRate___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  pthread_mutex_lock(*(pthread_mutex_t **)(*(void *)(a1 + 32) + 600));
  if ([*(id *)(*(void *)(a1 + 32) + 112) settingsID] == a3)
  {
    uint64_t v6 = *(void *)(a1 + 32) + 688;
    uint64_t v7 = *(void *)(a2 + 16);
    *(_OWORD *)uint64_t v6 = *(_OWORD *)a2;
    *(void *)(v6 + 16) = v7;
  }
  BOOL v8 = *(pthread_mutex_t **)(*(void *)(a1 + 32) + 600);
  return pthread_mutex_unlock(v8);
}

- (void)_irisMovieInfosFromPendingIrisRequestMarkerBuffers
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v1 = *(void **)(a1 + 104);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (!v2) {
    return 0;
  }
  uint64_t v3 = v2;
  uint64_t v4 = 0;
  uint64_t v5 = *(void *)v11;
  do
  {
    for (uint64_t i = 0; i != v3; ++i)
    {
      if (*(void *)v11 != v5) {
        objc_enumerationMutation(v1);
      }
      uint64_t v7 = *(const void **)(*((void *)&v10 + 1) + 8 * i);
      if (!v4) {
        uint64_t v4 = (void *)[MEMORY[0x1E4F1CA48] array];
      }
      CFTypeRef v8 = CMGetAttachment(v7, @"IrisMovieRequest", 0);
      if (v8) {
        [v4 addObject:v8];
      }
    }
    uint64_t v3 = [v1 countByEnumeratingWithState:&v10 objects:v14 count:16];
  }
  while (v3);
  return v4;
}

- (uint64_t)_clearPendingIrisRequestMarkerBuffers
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    if (dword_1EB4C5030)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    return objc_msgSend(*(id *)(v1 + 104), "removeAllObjects", v3, v4);
  }
  return result;
}

- (void)_addLookAheadMotionDataToMetadataForSampleBuffer:(void *)a3 lookAheadMotionData:
{
  if (!a1) {
    return;
  }
  uint64_t v6 = (void *)MEMORY[0x1E4F55720];
  if (*(unsigned char *)(a1 + 768))
  {
    BOOL v7 = 0;
    id v15 = 0;
  }
  else
  {
    uint64_t v8 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", BWMotionDataTimeMachineKeyPrimaryMotionData), "objectForKeyedSubscript:", *MEMORY[0x1E4F55720]), "unsignedLongLongValue");
    uint64_t v9 = [*(id *)(a1 + 728) copyMotionDataForStartingSerialNumber:v8 - *(void *)(a1 + 744) endingSerialNumber:v8 - 1];
    BOOL v7 = v9 != 0;
    if (*(unsigned char *)(a1 + 768)) {
      BOOL v10 = 0;
    }
    else {
      BOOL v10 = v9 == 0;
    }
    if (v10) {
      return;
    }
    id v15 = (id)v9;
  }
  long long v11 = (void *)[a3 objectForKeyedSubscript:BWMotionDataTimeMachineKeyPrimaryMotionData];
  fcn_addAllLookAheadMotionDataToMetadata(a2, v11, (void *)[v15 objectForKeyedSubscript:BWMotionDataTimeMachineKeyPrimaryMotionData]);
  *(void *)(a1 + 760) = objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", *v6), "unsignedLongLongValue");
  uint64_t v12 = [a3 objectForKeyedSubscript:BWMotionDataTimeMachineKeySynchronizedSlaveFrameMotionData];
  if (v12)
  {
    long long v13 = (void *)v12;
    long long v14 = (const void *)fcn_synchronizedSlaveFrameForSampleBuffer(a2);
    if (v14) {
      fcn_addAllLookAheadMotionDataToMetadata(v14, v13, (void *)[v15 objectForKeyedSubscript:BWMotionDataTimeMachineKeySynchronizedSlaveFrameMotionData]);
    }
  }
  if (v7)
  {
    *(unsigned char *)(a1 + 768) = 1;
  }
}

- (uint64_t)_emitSampleBuffer:(void *)a3 forInput:(void *)a4 toOutput:
{
  if (result)
  {
    uint64_t v7 = result;
    uint64_t v8 = NSNumber;
    HostTimeClock = CMClockGetHostTimeClock();
    CMClockGetTime(&time, HostTimeClock);
    CMTimeConvertScale(&v14, &time, 1000000000, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
    BOOL v10 = (const void *)[v8 numberWithLongLong:v14.value];
    CMSetAttachment(a2, @"FileCoordinatorEmissionTimeStamp", v10, 1u);
    uint64_t v11 = objc_msgSend((id)CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E4F53070], 0), "objectForKeyedSubscript:", *MEMORY[0x1E4F54128]);
    if (v11)
    {
      uint64_t v12 = (void *)v11;
      long long v13 = *(void *)(v7 + 784) ? *(const void **)(v7 + 784) : (const void *)v11;
      CMSetAttachment(a2, @"LastPortType", v13, 1u);
      if (([*(id *)(v7 + 784) isEqualToString:v12] & 1) == 0)
      {

        *(void *)(v7 + 784) = v12;
      }
    }
    if (*(unsigned char *)(v7 + 682) && ![a3 index])
    {
      if (*(void *)(v7 + 624)) {
        -[BWFileCoordinatorNode _prepareOverCaptureVideoBufferForEmission:emissionTimeStamp:]((unsigned char *)v7, a2, v10);
      }
    }
    return [a4 emitSampleBuffer:a2];
  }
  return result;
}

- (uint64_t)_flushPendingIrisRequestMarkerBuffers
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    for (uint64_t result = [*(id *)(result + 104) count]; result; uint64_t result = objc_msgSend(*(id *)(v1 + 104), "count"))
    {
      uint64_t v2 = [*(id *)(v1 + 104) firstObject];
      if (dword_1EB4C5030)
      {
        os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      objc_msgSend(*(id *)(v1 + 16), "emitSampleBuffer:", v2, v4, v5);
      [*(id *)(v1 + 104) removeObjectAtIndex:0];
    }
  }
  return result;
}

- (uint64_t)_flushSampleBuffersWaitingForMotionData
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (!result) {
    return result;
  }
  uint64_t v1 = result;
  if (!*(void *)(result + 752)) {
    return result;
  }
  uint64_t v2 = [*(id *)(result + 736) count];
  unint64_t v3 = v2;
  if (*(unsigned char *)(v1 + 768)) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = v2 == 0;
  }
  uint64_t v5 = (CFStringRef *)MEMORY[0x1E4F53070];
  uint64_t v6 = (uint64_t *)MEMORY[0x1E4F55720];
  if (!v4)
  {
    uint64_t v8 = (const void *)[*(id *)(v1 + 736) firstObject];
    unint64_t v9 = objc_msgSend((id)objc_msgSend((id)CMGetAttachment(v8, *v5, 0), "objectForKeyedSubscript:", *v6), "unsignedLongLongValue");
    unint64_t v10 = [*(id *)(v1 + 728) earliestAvailableMotionDataSerialNumber];
    unint64_t v11 = [*(id *)(v1 + 728) latestAvailableMotionDataSerialNumber];
    if (v10 <= v9) {
      unint64_t v12 = v9;
    }
    else {
      unint64_t v12 = v10;
    }
    if (v11 >= v9 + *(void *)(v1 + 744) - 1) {
      uint64_t v13 = v9 + *(void *)(v1 + 744) - 1;
    }
    else {
      uint64_t v13 = v11;
    }
    CMTime v14 = (void *)[*(id *)(v1 + 728) copyMotionDataForStartingSerialNumber:v12 endingSerialNumber:v13];
    if (v14)
    {
      id v15 = v14;
      fcn_addAllLookAheadMotionDataToMetadata(v8, 0, (void *)[v14 objectForKeyedSubscript:BWMotionDataTimeMachineKeyPrimaryMotionData]);
      *(void *)(v1 + 760) = v13;
      if ([*(id *)(v1 + 728) synchronizedSlaveMotionDataCachingEnabled])
      {
        CFAllocatorRef v16 = (const void *)fcn_synchronizedSlaveFrameForSampleBuffer(v8);
        if (v16) {
          fcn_addAllLookAheadMotionDataToMetadata(v16, 0, (void *)[v15 objectForKeyedSubscript:BWMotionDataTimeMachineKeySynchronizedSlaveFrameMotionData]);
        }
      }
    }
    *(unsigned char *)(v1 + 768) = 1;
    uint64_t v6 = (uint64_t *)MEMORY[0x1E4F55720];
LABEL_22:
    unint64_t v7 = 0;
    CFStringRef v17 = *v5;
    uint64_t v18 = *v6;
    while (1)
    {
      uint64_t v19 = (void *)[*(id *)(v1 + 736) objectAtIndexedSubscript:v7];
      if ((unint64_t)objc_msgSend((id)objc_msgSend((id)CMGetAttachment(v19, v17, 0), "objectForKeyedSubscript:", v18), "unsignedLongLongValue") > *(void *)(v1 + 760))goto LABEL_26; {
      -[BWFileCoordinatorNode _addFlushingFutureCinematicMetadataToSampleBuffer:]((const void *)v1, v19);
      }
      -[BWFileCoordinatorNode _emitSampleBuffer:forInput:toOutput:](v1, v19, *(void **)(v1 + 8), *(void **)(v1 + 16));
      if (v3 == ++v7)
      {
        unint64_t v7 = v3;
        goto LABEL_26;
      }
    }
  }
  if (v2) {
    goto LABEL_22;
  }
  unint64_t v7 = 0;
LABEL_26:
  if ([*(id *)(v1 + 736) count] > v7 && dword_1EB4C5030 != 0)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  uint64_t result = objc_msgSend(*(id *)(v1 + 736), "removeAllObjects", v22, v23);
  *(void *)(v1 + 752) = 0;
  *(void *)(v1 + 760) = 0;
  return result;
}

- (const)_addFlushingFutureCinematicMetadataToSampleBuffer:(const void *)result
{
  if (result)
  {
    uint64_t v3 = (uint64_t)result;
    CFStringRef v4 = (const __CFString *)*MEMORY[0x1E4F53070];
    uint64_t v5 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53070], 0);
    uint64_t v6 = -[BWFileCoordinatorNode _cinematicFutureMetadataForFlushingSampleBuffer:](v3, target);
    uint64_t v7 = *MEMORY[0x1E4F55708];
    [v5 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F55708]];
    uint64_t result = (const void *)[*(id *)(v3 + 728) synchronizedSlaveMotionDataCachingEnabled];
    if (result)
    {
      uint64_t result = (const void *)fcn_synchronizedSlaveFrameForSampleBuffer(target);
      if (result)
      {
        uint64_t v8 = result;
        unint64_t v9 = (void *)CMGetAttachment(result, v4, 0);
        uint64_t v10 = -[BWFileCoordinatorNode _cinematicFutureMetadataForFlushingSampleBuffer:](v3, v8);
        return (const void *)[v9 setObject:v10 forKeyedSubscript:v7];
      }
    }
  }
  return result;
}

- (uint64_t)_cinematicFutureMetadataForFlushingSampleBuffer:(uint64_t)result
{
  if (result)
  {
    uint64_t v2 = result;
    uint64_t v3 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53070], 0);
    uint64_t v4 = *MEMORY[0x1E4F55720];
    uint64_t v5 = *(void *)(v2 + 744)
       + objc_msgSend((id)objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E4F55720]), "unsignedLongLongValue");
    uint64_t v6 = (void *)MEMORY[0x1E4F1CA60];
    uint64_t v7 = [NSNumber numberWithUnsignedLongLong:v5];
    return objc_msgSend(v6, "dictionaryWithObjectsAndKeys:", v7, v4, MEMORY[0x1E4F1CC38], *MEMORY[0x1E4F55718], 0);
  }
  return result;
}

- (void)_prepareOverCaptureVideoBufferForEmission:(const void *)a3 emissionTimeStamp:
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (!a1[683])
    {
LABEL_16:
      CMRemoveAttachment(target, @"OverCaptureSlaveStreamStatus");
      return;
    }
    if (!a1[684])
    {
      if ((objc_msgSend((id)CMGetAttachment(target, @"OverCaptureSlaveStreamStatus", 0), "intValue") & 0xFFFFFFFB) == 0)
      {
        AttachedMedia = (const void *)BWSampleBufferGetAttachedMedia(target, 0x1EFA742E0);
        if (AttachedMedia
          || (AttachedMedia = (const void *)BWSampleBufferGetAttachedMedia(target, @"SynchronizedSlaveFrame")) != 0)
        {
          CMSetAttachment(AttachedMedia, @"FileCoordinatorEmissionTimeStamp", a3, 1u);
        }
        goto LABEL_7;
      }
      a1[684] = 1;
      a1[685] = 1;
    }
    BWSampleBufferRemoveAttachedMedia(target, 0x1EFA742E0);
    BWSampleBufferRemoveAttachedMedia(target, @"SynchronizedSlaveFrame");
LABEL_7:
    if (a1[685])
    {
      CMAttachmentBearerRef targeta = 0;
      long long v6 = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 48);
      *(_OWORD *)&sampleTimingArray.presentationTimeStamp.CMTimeScale timescale = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 32);
      *(_OWORD *)&sampleTimingArray.decodeTimeStamp.CMTimeValue value = v6;
      sampleTimingArray.decodeTimeStamp.CMTimeEpoch epoch = *(void *)(MEMORY[0x1E4F1FA70] + 64);
      long long v7 = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 16);
      *(_OWORD *)&sampleTimingArray.duration.CMTimeValue value = *MEMORY[0x1E4F1FA70];
      *(_OWORD *)&sampleTimingArray.duration.CMTimeEpoch epoch = v7;
      CMSampleBufferGetPresentationTimeStamp(&sampleTimingArray.presentationTimeStamp, (CMSampleBufferRef)target);
      if (!CMSampleBufferCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 1u, 0, 0, 0, 0, 1, &sampleTimingArray, 0, 0, (CMSampleBufferRef *)&targeta))
      {
        if (dword_1EB4C5030)
        {
          os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        CMSetAttachment(targeta, @"FileWriterAction", @"StreamForcedOff", 1u);
        BWSampleBufferSetAttachedMedia(target, @"SynchronizedSlaveFrame", (uint64_t)targeta);
        CFRelease(targeta);
        if ((objc_msgSend((id)CMGetAttachment(target, @"SampleDataToBeDropped", 0), "BOOLValue") & 1) == 0) {
          a1[685] = 0;
        }
      }
    }
    goto LABEL_16;
  }
}

- (id)_emitStagedBufferForIndex:(id *)result stoppingOrPausing:(uint64_t)a2
{
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = objc_msgSend((id)objc_msgSend(result, "inputs"), "objectAtIndex:", a2);
    uint64_t v5 = objc_msgSend((id)objc_msgSend(v3, "outputs"), "objectAtIndex:", a2);
    uint64_t result = (id *)[v3[12] objectAtIndex:a2];
    if (v4)
    {
      if (v5)
      {
        long long v6 = result;
        if (result)
        {
          uint64_t result = (id *)[result count];
          if (result)
          {
            -[BWFileCoordinatorNode _emitOrQueueSampleBuffer:forInput:toOutput:stoppingOrPausing:]((uint64_t)v3, (CMSampleBufferRef)[v6 firstObject], v4, v5);
            return (id *)[v6 removeObjectAtIndex:0];
          }
        }
      }
    }
  }
  return result;
}

- (CMSampleBufferRef)_createEmptyMetadataSBufWithPTS:(uint64_t)a3 forInputIndex:
{
  if (result)
  {
    CMSampleBufferRef v4 = result;
    CMSampleBufferRef v17 = 0;
    if (*(void *)(*((void *)result + 74) + 8 * a3))
    {
      long long v6 = (OpaqueCMBlockBuffer *)*((void *)result + 73);
      CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      if (!v6)
      {
        if (CMBlockBufferCreateWithMemoryBlock(v7, 0, 8uLL, v7, 0, 0, 8uLL, 1u, (CMBlockBufferRef *)v4 + 73)) {
          goto LABEL_10;
        }
        dataPointerOut = 0;
        if (CMBlockBufferGetDataPointer(*((CMBlockBufferRef *)v4 + 73), 0, 0, 0, &dataPointerOut)) {
          goto LABEL_10;
        }
        *(void *)dataPointerOut = 0x8000000;
        long long v6 = (OpaqueCMBlockBuffer *)*((void *)v4 + 73);
      }
      long long v8 = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 48);
      *(_OWORD *)&sampleTimingArray.presentationTimeStamp.CMTimeScale timescale = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 32);
      *(_OWORD *)&sampleTimingArray.decodeTimeStamp.CMTimeValue value = v8;
      CMTimeEpoch v9 = *(void *)(MEMORY[0x1E4F1FA70] + 64);
      long long v10 = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 16);
      *(_OWORD *)&sampleTimingArray.duration.CMTimeValue value = *MEMORY[0x1E4F1FA70];
      *(_OWORD *)&sampleTimingArray.duration.CMTimeEpoch epoch = v10;
      *(_OWORD *)&sampleTimingArray.presentationTimeStamp.CMTimeValue value = *(_OWORD *)a2;
      CMTimeEpoch v11 = *(void *)(a2 + 16);
      sampleTimingArray.decodeTimeStamp.CMTimeEpoch epoch = v9;
      sampleTimingArray.presentationTimeStamp.CMTimeEpoch epoch = v11;
      size_t DataLength = CMBlockBufferGetDataLength(v6);
      uint64_t v13 = (OpaqueCMBlockBuffer *)*((void *)v4 + 73);
      size_t sampleSizeArray = DataLength;
      if (!CMSampleBufferCreate(v7, v13, 1u, 0, 0, *(CMFormatDescriptionRef *)(*((void *)v4 + 74) + 8 * a3), 1, 1, &sampleTimingArray, 1, &sampleSizeArray, &v17))return v17; {
    }
      }
LABEL_10:
    FigDebugAssert3();
    return v17;
  }
  return result;
}

@end