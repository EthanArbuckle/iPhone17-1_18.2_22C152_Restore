@interface AVCaptureMovieFileOutput
+ (BOOL)consolidateMovieFragmentsInFile:(id)a3 error:(id *)a4;
+ (BOOL)updateMovieMetadataInFile:(id)a3 withMetadata:(id)a4 error:(id *)a5;
+ (int64_t)uniqueID;
+ (void)initialize;
- (AVCaptureMovieFileOutput)init;
- (AVCapturePrimaryConstituentDeviceRestrictedSwitchingBehaviorConditions)primaryConstituentDeviceRestrictedSwitchingBehaviorConditionsForRecording;
- (AVCapturePrimaryConstituentDeviceSwitchingBehavior)primaryConstituentDeviceSwitchingBehaviorForRecording;
- (BOOL)_recordingInProgress;
- (BOOL)_totalNANDBandwidthAllowed:(id)a3 videoCodecType:(id)a4;
- (BOOL)canAddConnection:(id)a3 failureReason:(id *)a4;
- (BOOL)isDepthCaptureEnabled;
- (BOOL)isPrimaryConstituentDeviceSwitchingBehaviorForRecordingEnabled;
- (BOOL)isRecording;
- (BOOL)isRecordingPaused;
- (BOOL)isSpatialVideoCaptureEnabled;
- (BOOL)isSpatialVideoCaptureSupported;
- (BOOL)isTrueVideoCaptureEnabled;
- (BOOL)isTrueVideoCaptureSupported;
- (BOOL)isVirtualCaptureCardSupported;
- (BOOL)recordsVideoOrientationAndMirroringChangesAsMetadataTrackForConnection:(AVCaptureConnection *)connection;
- (BOOL)sendsLastVideoPreviewFrame;
- (BOOL)usesVirtualCaptureCard;
- (CGSize)outputSizeForSourceFormat:(id)a3;
- (CMTime)movieFragmentInterval;
- (NSArray)availableVideoCodecTypes;
- (NSArray)metadata;
- (NSArray)supportedOutputSettingsKeysForConnection:(AVCaptureConnection *)connection;
- (NSDictionary)outputSettingsForConnection:(AVCaptureConnection *)connection;
- (id)_avErrorUserInfoDictionaryForError:(int)a3 wrapper:(id)a4 payload:(id)a5;
- (id)addConnection:(id)a3 error:(id *)a4;
- (id)bravoCameraSelectionBehaviorForRecording;
- (id)connectionMediaTypes;
- (id)outputFileURL;
- (int)_stopRecording;
- (void)_propagateBravoSwitchingBehaviorWhenRecording;
- (void)_removeRecordingDelegateWrapper:(id)a3;
- (void)_startRecording:(id)a3;
- (void)_updateAvailableVideoCodecTypesForSourceDevice:(id)a3;
- (void)_updateBravoCameraSelectionBehaviorForSourceDevice:(id)a3;
- (void)_updateDepthDataDeliverySupportedForSourceDevice:(id)a3;
- (void)_updateSpatialVideoCaptureSupportedForSourceDevice:(id)a3;
- (void)_updateSupportedPropertiesForSourceDevice:(id)a3;
- (void)attachSafelyToFigCaptureSession:(OpaqueFigCaptureSession *)a3;
- (void)dealloc;
- (void)detachSafelyFromFigCaptureSession:(OpaqueFigCaptureSession *)a3;
- (void)handleChangedActiveFormat:(id)a3 forDevice:(id)a4;
- (void)handleDidDropFrameWhileRecordingNotificationForWrapper:(id)a3 withPayload:(id)a4;
- (void)handleDidPauseRecordingNotificationForWrapper:(id)a3 withPayload:(id)a4;
- (void)handleDidResumeRecordingNotificationForWrapper:(id)a3 withPayload:(id)a4;
- (void)handleDidStartRecordingNotificationForWrapper:(id)a3 withPayload:(id)a4;
- (void)handleDidStopRecordingNotificationForMomentCaptureWrapper:(id)a3 withPayload:(id)a4 demoof:(BOOL)a5 addMetadata:(BOOL)a6;
- (void)handleDidStopRecordingNotificationForWrapper:(id)a3 withPayload:(id)a4 demoof:(BOOL)a5 addMetadata:(BOOL)a6;
- (void)handleNotification:(id)a3 payload:(id)a4;
- (void)handleVideoStabilizationModeChangedForConnection:(id)a3;
- (void)pauseRecording;
- (void)removeConnection:(id)a3;
- (void)resumeRecording;
- (void)safelyHandleServerConnectionDeathForFigCaptureSession:(OpaqueFigCaptureSession *)a3;
- (void)setBravoCameraSelectionBehaviorForRecording:(id)a3;
- (void)setConnectionsActive:(BOOL)a3;
- (void)setDepthCaptureEnabled:(BOOL)a3;
- (void)setMetadata:(NSArray *)metadata;
- (void)setMovieFragmentInterval:(CMTime *)movieFragmentInterval;
- (void)setOutputSettings:(NSDictionary *)outputSettings forConnection:(AVCaptureConnection *)connection;
- (void)setPrimaryConstituentDeviceSwitchingBehaviorForRecording:(AVCapturePrimaryConstituentDeviceSwitchingBehavior)switchingBehavior restrictedSwitchingBehaviorConditions:(AVCapturePrimaryConstituentDeviceRestrictedSwitchingBehaviorConditions)restrictedSwitchingBehaviorConditions;
- (void)setPrimaryConstituentDeviceSwitchingBehaviorForRecordingEnabled:(BOOL)primaryConstituentDeviceSwitchingBehaviorForRecordingEnabled;
- (void)setRecordsVideoOrientationAndMirroringChanges:(BOOL)doRecordChanges asMetadataTrackForConnection:(AVCaptureConnection *)connection;
- (void)setSendsLastVideoPreviewFrame:(BOOL)a3;
- (void)setSpatialVideoCaptureEnabled:(BOOL)a3;
- (void)setTrueVideoCaptureEnabled:(BOOL)a3;
- (void)setUsesVirtualCaptureCard:(BOOL)a3;
- (void)startRecordingMovieWithSettings:(id)a3 delegate:(id)a4;
- (void)startRecordingToOutputFileURL:(id)a3 recordingDelegate:(id)a4;
- (void)stopRecording;
@end

@implementation AVCaptureMovieFileOutput

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

+ (int64_t)uniqueID
{
  return atomic_fetch_add_explicit(uniqueID_sCurrentUniqueID_0, 1uLL, memory_order_relaxed) + 1;
}

- (AVCaptureMovieFileOutput)init
{
  v5.receiver = self;
  v5.super_class = (Class)AVCaptureMovieFileOutput;
  v2 = [(AVCaptureFileOutput *)&v5 initSubclass];
  if (v2)
  {
    v3 = objc_alloc_init(AVCaptureMovieFileOutputInternal);
    v2->_internal = v3;
    if (v3)
    {
      v2->_internal->weakReference = (AVWeakReference *)[objc_alloc(MEMORY[0x1E4F47DF0]) initWithReferencedObject:v2];
      v2->_internal->greenTeaLogger = (ct_green_tea_logger_s *)ct_green_tea_logger_create();
    }
    else
    {

      return 0;
    }
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  recordingDelegatesArray = self->_internal->recordingDelegatesArray;
  uint64_t v4 = [(NSMutableArray *)recordingDelegatesArray countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    uint64_t v7 = *MEMORY[0x1E4F51568];
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(recordingDelegatesArray);
        }
        v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v9 pendingDidStopRecordingUnregistrationCaptureSession])
        {
          objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F47DB8], "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter()), "removeListenerWithWeakReference:callback:name:object:", self->_internal->weakReference, mfoNotificationHandler, v7, objc_msgSend(v9, "pendingDidStopRecordingUnregistrationCaptureSession"));
          [v9 setPendingDidStopRecordingUnregistrationCaptureSession:0];
        }
      }
      uint64_t v5 = [(NSMutableArray *)recordingDelegatesArray countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  v10.receiver = self;
  v10.super_class = (Class)AVCaptureMovieFileOutput;
  [(AVCaptureFileOutput *)&v10 dealloc];
}

- (id)connectionMediaTypes
{
  v2 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObjects:", *MEMORY[0x1E4F47C68], *MEMORY[0x1E4F47C40], 0);
  if (AVMediaTypeMetadataObjectAndAVMediaTypeMetadataAreDefined()) {
    [v2 addObject:*MEMORY[0x1E4F47C50]];
  }
  [v2 addObject:*MEMORY[0x1E4F47C48]];
  v3 = (void *)[v2 copy];

  return v3;
}

- (BOOL)canAddConnection:(id)a3 failureReason:(id *)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (void *)[a3 mediaType];
  if ((objc_msgSend(-[AVCaptureMovieFileOutput connectionMediaTypes](self, "connectionMediaTypes"), "containsObject:", v7) & 1) == 0)goto LABEL_35; {
  if (([v7 isEqualToString:*MEMORY[0x1E4F47C68]] & 1) != 0
  }
    || [v7 isEqualToString:*MEMORY[0x1E4F47C40]])
  {
    if ([(AVCaptureOutput *)self connectionWithMediaType:v7])
    {
LABEL_5:
      uint64_t v8 = 2;
      goto LABEL_36;
    }
    return 1;
  }
  uint64_t v9 = *MEMORY[0x1E4F47C50];
  if (![v7 isEqualToString:*MEMORY[0x1E4F47C50]])
  {
    if (![v7 isEqualToString:*MEMORY[0x1E4F47C48]]) {
      return 1;
    }
    if ([(AVCaptureMovieFileOutput *)self isDepthCaptureEnabled])
    {
      if ([(AVCaptureOutput *)self connectionWithMediaType:v7]) {
        goto LABEL_5;
      }
      if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "sourceDevice"), "activeFormat"), "isStreamingDepthSupported"))return 1; {
      uint64_t v8 = 5;
      }
LABEL_36:
      v24 = (void *)AVCaptureOutputConnectionFailureReasonString(v8, (uint64_t)self, a3);
LABEL_37:
      BOOL result = 0;
      *a4 = v24;
      return result;
    }
LABEL_35:
    uint64_t v8 = 1;
    goto LABEL_36;
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = (id)[a3 inputPorts];
  uint64_t v27 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (!v27) {
    return 1;
  }
  v25 = a4;
  uint64_t v10 = 0;
  uint64_t v28 = *(void *)v36;
  while (2)
  {
    uint64_t v11 = 0;
    do
    {
      if (*(void *)v36 != v28) {
        objc_enumerationMutation(obj);
      }
      long long v12 = *(void **)(*((void *)&v35 + 1) + 8 * v11);
      uint64_t v13 = objc_msgSend(v12, "input", v25);
      if (v10)
      {
        if (v13 != v10) {
          goto LABEL_38;
        }
      }
      else
      {
        uint64_t v10 = v13;
      }
      uint64_t v29 = v11;
      uint64_t v30 = v10;
      [v12 input];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v33 = 0u;
        long long v34 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v14 = [(AVCaptureOutput *)self connections];
        uint64_t v15 = [(NSArray *)v14 countByEnumeratingWithState:&v31 objects:v39 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v32;
LABEL_19:
          uint64_t v18 = 0;
          while (1)
          {
            if (*(void *)v32 != v17) {
              objc_enumerationMutation(v14);
            }
            v19 = *(void **)(*((void *)&v31 + 1) + 8 * v18);
            if (objc_msgSend((id)objc_msgSend(v19, "mediaType"), "isEqualToString:", v9))
            {
              v20 = objc_msgSend((id)objc_msgSend(v19, "inputPorts"), "firstObject");
              [v20 input];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v21 = [v20 input];
                if (v21 != [v12 input]) {
                  break;
                }
              }
            }
            if (v16 == ++v18)
            {
              uint64_t v16 = [(NSArray *)v14 countByEnumeratingWithState:&v31 objects:v39 count:16];
              if (v16) {
                goto LABEL_19;
              }
              goto LABEL_27;
            }
          }
LABEL_38:
          v24 = (void *)AVCaptureOutputConnectionFailureReasonString(4, (uint64_t)self, a3);
          a4 = v25;
          goto LABEL_37;
        }
      }
LABEL_27:
      uint64_t v10 = v30;
      uint64_t v11 = v29 + 1;
    }
    while (v29 + 1 != v27);
    uint64_t v22 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
    BOOL result = 1;
    uint64_t v27 = v22;
    if (v22) {
      continue;
    }
    return result;
  }
}

- (id)addConnection:(id)a3 error:(id *)a4
{
  v8.receiver = self;
  v8.super_class = (Class)AVCaptureMovieFileOutput;
  id v5 = [(AVCaptureOutput *)&v8 addConnection:a3 error:a4];
  uint64_t v6 = (void *)[v5 mediaType];
  if ([v6 isEqual:*MEMORY[0x1E4F47C68]]) {
    -[AVCaptureMovieFileOutput _updateSupportedPropertiesForSourceDevice:](self, "_updateSupportedPropertiesForSourceDevice:", [v5 sourceDevice]);
  }
  return v5;
}

- (void)removeConnection:(id)a3
{
  if (-[NSMutableArray containsObject:](self->_internal->connectionsThatRecordVideoOrientationAndMirroringChangesAsMetadataTrack, "containsObject:"))[(NSMutableArray *)self->_internal->connectionsThatRecordVideoOrientationAndMirroringChangesAsMetadataTrack removeObject:a3]; {
  v6.receiver = self;
  }
  v6.super_class = (Class)AVCaptureMovieFileOutput;
  [(AVCaptureOutput *)&v6 removeConnection:a3];
  id v5 = (void *)[a3 mediaType];
  if ([v5 isEqual:*MEMORY[0x1E4F47C68]]) {
    [(AVCaptureMovieFileOutput *)self _updateSupportedPropertiesForSourceDevice:0];
  }
}

- (BOOL)_recordingInProgress
{
  v2 = self;
  internal = self->_internal;
  objc_sync_enter(internal);
  LOBYTE(v2) = [(NSMutableArray *)v2->_internal->recordingDelegatesArray count] != 0;
  objc_sync_exit(internal);
  return (char)v2;
}

- (BOOL)isRecording
{
  v2 = self;
  internal = self->_internal;
  objc_sync_enter(internal);
  LOBYTE(v2) = v2->_internal->recording;
  objc_sync_exit(internal);
  return (char)v2;
}

- (BOOL)isRecordingPaused
{
  v2 = self;
  internal = self->_internal;
  objc_sync_enter(internal);
  LOBYTE(v2) = v2->_internal->paused;
  objc_sync_exit(internal);
  return (char)v2;
}

- (void)pauseRecording
{
  if (objc_msgSend(-[AVCaptureOutput session](self, "session"), "isRunning"))
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __42__AVCaptureMovieFileOutput_pauseRecording__block_invoke;
    v3[3] = &unk_1E5A73458;
    v3[4] = self;
    [(AVCaptureOutput *)self performFigCaptureSessionOperationSafelyUsingBlock:v3];
  }
  else
  {
    NSLog(&cfstr_CanTPauseRecor.isa);
  }
}

uint64_t __42__AVCaptureMovieFileOutput_pauseRecording__block_invoke(uint64_t result, uint64_t a2)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    uint64_t v3 = [*(id *)(result + 32) sinkID];
    uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v4) {
      uint64_t v5 = v4;
    }
    else {
      uint64_t v5 = 0;
    }
    objc_super v6 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 64);
    if (v6)
    {
      return v6(a2, v3);
    }
    else
    {
      uint64_t v7 = *MEMORY[0x1E4F516D8];
      v8[0] = &unk_1EF4FA6D0;
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
      CMNotificationCenterGetDefaultLocalCenter();
      return CMNotificationCenterPostNotification();
    }
  }
  return result;
}

- (void)resumeRecording
{
  if ((objc_msgSend(-[AVCaptureOutput session](self, "session"), "isRunning") & 1) == 0) {
    NSLog(&cfstr_CanTResumeReco.isa);
  }
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __43__AVCaptureMovieFileOutput_resumeRecording__block_invoke;
  v3[3] = &unk_1E5A73458;
  v3[4] = self;
  [(AVCaptureOutput *)self performFigCaptureSessionOperationSafelyUsingBlock:v3];
}

uint64_t __43__AVCaptureMovieFileOutput_resumeRecording__block_invoke(uint64_t result, uint64_t a2)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    uint64_t v3 = [*(id *)(result + 32) sinkID];
    uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v4) {
      uint64_t v5 = v4;
    }
    else {
      uint64_t v5 = 0;
    }
    objc_super v6 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 72);
    if (v6)
    {
      return v6(a2, v3);
    }
    else
    {
      uint64_t v7 = *MEMORY[0x1E4F516D8];
      v8[0] = &unk_1EF4FA6D0;
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
      CMNotificationCenterGetDefaultLocalCenter();
      return CMNotificationCenterPostNotification();
    }
  }
  return result;
}

- (id)outputFileURL
{
  internal = self->_internal;
  objc_sync_enter(internal);
  id v4 = (id)objc_msgSend((id)-[NSMutableArray lastObject](self->_internal->recordingDelegatesArray, "lastObject"), "outputFileURL");
  objc_sync_exit(internal);

  return v4;
}

- (void)startRecordingToOutputFileURL:(id)a3 recordingDelegate:(id)a4
{
  v25[1] = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    uint64_t v13 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v14 = *MEMORY[0x1E4F1C3C8];
LABEL_17:
    uint64_t v17 = AVMethodExceptionReasonWithObjectAndSelector();
    uint64_t v18 = v13;
    uint64_t v19 = v14;
    goto LABEL_18;
  }
  if (([a3 isFileURL] & 1) == 0)
  {
    uint64_t v15 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v16 = *MEMORY[0x1E4F1C3C8];
    id v22 = a3;
    uint64_t v17 = AVMethodExceptionReasonWithObjectAndSelector();
    uint64_t v18 = v15;
    uint64_t v19 = v16;
LABEL_18:
    v20 = objc_msgSend(v18, "exceptionWithName:reason:userInfo:", v19, v17, 0, v22);
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v20);
    }
    NSLog(&cfstr_SuppressingExc.isa, v20);
    return;
  }
  if (!a4)
  {
    uint64_t v13 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v14 = *MEMORY[0x1E4F1C3C8];
    goto LABEL_17;
  }
  id v7 = [(AVCaptureOutput *)self liveConnections];
  if (![v7 count])
  {
    uint64_t v13 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v14 = *MEMORY[0x1E4F1C3C8];
    goto LABEL_17;
  }
  v23 = 0;
  objc_super v8 = [(AVCaptureOutput *)self connectionWithMediaType:*MEMORY[0x1E4F47C68]];
  if (v8)
  {
    uint64_t v9 = v8;
    -[AVCaptureMovieFileOutput outputSizeForSourceFormat:](self, "outputSizeForSourceFormat:", objc_msgSend(-[AVCaptureConnection sourceDevice](v8, "sourceDevice"), "activeFormat"));
    if ((AVCaptureMovieFileURLIsValidForConnection(v9, v10, v11, (uint64_t)a3, &v23) & 1) == 0)
    {
      uint64_t v13 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v14 = *MEMORY[0x1E4F1C3C8];
      goto LABEL_17;
    }
  }
  if ((objc_msgSend(a3, "isEqual:", -[AVCaptureMovieFileOutput outputFileURL](self, "outputFileURL")) & 1) == 0)
  {
    long long v12 = +[AVCaptureFileOutputDelegateWrapper wrapperWithURL:delegate:settingsID:connections:](AVCaptureFileOutputDelegateWrapper, "wrapperWithURL:delegate:settingsID:connections:", a3, a4, +[AVCaptureMovieFileOutput uniqueID], v7);
    if ([(AVCaptureMovieFileOutput *)self _totalNANDBandwidthAllowed:a3 videoCodecType:self->_internal->videoCodec])
    {
      if (!AVGestaltGetBoolAnswer(@"AVGQCaptureCheckIfFileAlreadyExistForMFO")
        || (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "fileExistsAtPath:", objc_msgSend(a3, "path")) & 1) == 0)
      {
        [(AVCaptureFileOutputDelegateWrapper *)v12 setMetadata:[(AVCaptureMovieFileOutput *)self metadata]];
        [(AVCaptureFileOutputDelegateWrapper *)v12 setTrueVideoCaptureEnabled:[(AVCaptureMovieFileOutput *)self isTrueVideoCaptureEnabled]];
        [(AVCaptureMovieFileOutput *)self _startRecording:v12];
        return;
      }
      uint64_t v21 = 4294950886;
    }
    else
    {
      uint64_t v21 = 4294951858;
    }
    uint64_t v24 = *MEMORY[0x1E4F516D8];
    v25[0] = [NSNumber numberWithInt:v21];
    -[AVCaptureMovieFileOutput handleDidStopRecordingNotificationForWrapper:withPayload:demoof:addMetadata:](self, "handleDidStopRecordingNotificationForWrapper:withPayload:demoof:addMetadata:", v12, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1], 0, 0);
  }
}

- (void)stopRecording
{
  [(AVCaptureMovieFileOutput *)self _stopRecording];
  id v3 = [(AVCaptureOutput *)self session];

  [v3 movieFileOutputStoppedRecording:self];
}

- (CMTime)movieFragmentInterval
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)(*(void *)&self[1].timescale
                                                                                      + 32);
  return self;
}

- (void)setMovieFragmentInterval:(CMTime *)movieFragmentInterval
{
  CMTimeFlags flags = movieFragmentInterval->flags;
  if ((flags & 0x1D) == 1)
  {
    CMTime time1 = *movieFragmentInterval;
    CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
    if (CMTimeCompare(&time1, &time2) > 0)
    {
LABEL_5:
      internal = self->_internal;
      CMTimeEpoch epoch = movieFragmentInterval->epoch;
      *(_OWORD *)&internal->movieFragmentInterval.value = *(_OWORD *)&movieFragmentInterval->value;
      internal->movieFragmentInterval.CMTimeEpoch epoch = epoch;
      return;
    }
    CMTimeFlags flags = movieFragmentInterval->flags;
  }
  if ((flags & 1) == 0) {
    goto LABEL_5;
  }
  objc_super v8 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v8);
  }
  NSLog(&cfstr_SuppressingExc.isa, v8);
}

- (void)setSendsLastVideoPreviewFrame:(BOOL)a3
{
  self->_internal->sendLastVideoPreviewFrame = a3;
}

- (BOOL)sendsLastVideoPreviewFrame
{
  return self->_internal->sendLastVideoPreviewFrame;
}

- (NSArray)availableVideoCodecTypes
{
  v2 = self->_internal->availableVideoCodecs;

  return v2;
}

- (NSArray)supportedOutputSettingsKeysForConnection:(AVCaptureConnection *)connection
{
  if (![(AVCaptureConnection *)connection isEqual:[(AVCaptureOutput *)self connectionWithMediaType:*MEMORY[0x1E4F47C68]]])return (NSArray *)MEMORY[0x1E4F1CBF0]; {
  id v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObjects:", *MEMORY[0x1E4F47D00], 0);
  }
  if (AVGestaltGetBoolAnswer(@"AVGQCaptureMFOVideoSettingsSupportCompressionProperties")) {
    [v3 addObject:*MEMORY[0x1E4F47D40]];
  }
  id v4 = (void *)MEMORY[0x1E4F1C978];

  return (NSArray *)[v4 arrayWithArray:v3];
}

- (id)bravoCameraSelectionBehaviorForRecording
{
  int64_t primaryConstituentDeviceSwitchingBehavior = self->_internal->primaryConstituentDeviceSwitchingBehavior;
  id v3 = AVCaptureBravoCameraSelectionBehaviorEvaluatesOnZoomChange;
  if (primaryConstituentDeviceSwitchingBehavior != 2) {
    id v3 = AVCaptureBravoCameraSelectionBehaviorEvaluatesNever;
  }
  if (primaryConstituentDeviceSwitchingBehavior == 1) {
    id v4 = (id *)AVCaptureBravoCameraSelectionBehaviorEvaluatesContinuously;
  }
  else {
    id v4 = (id *)v3;
  }
  return *v4;
}

- (void)setBravoCameraSelectionBehaviorForRecording:(id)a3
{
  if ([a3 isEqualToString:@"AVCaptureBravoCameraSelectionBehaviorEvaluatesContinuously"])
  {
    uint64_t v5 = self;
    uint64_t v6 = 1;
LABEL_7:
    uint64_t v7 = 0;
    goto LABEL_8;
  }
  if (![a3 isEqualToString:@"AVCaptureBravoCameraSelectionBehaviorEvaluatesOnZoomChange"])
  {
    if (![a3 isEqualToString:@"AVCaptureBravoCameraSelectionBehaviorEvaluatesNever"])return; {
    uint64_t v5 = self;
    }
    uint64_t v6 = 3;
    goto LABEL_7;
  }
  uint64_t v5 = self;
  uint64_t v6 = 2;
  uint64_t v7 = 7;
LABEL_8:

  [(AVCaptureMovieFileOutput *)v5 setPrimaryConstituentDeviceSwitchingBehaviorForRecording:v6 restrictedSwitchingBehaviorConditions:v7];
}

- (BOOL)isPrimaryConstituentDeviceSwitchingBehaviorForRecordingEnabled
{
  return self->_internal->primaryConstituentDeviceSwitchingBehaviorForRecordingEnabled;
}

- (void)setPrimaryConstituentDeviceSwitchingBehaviorForRecordingEnabled:(BOOL)primaryConstituentDeviceSwitchingBehaviorForRecordingEnabled
{
  internal = self->_internal;
  if (internal->deviceSupportsConstituentDeviceSwitching
    || !primaryConstituentDeviceSwitchingBehaviorForRecordingEnabled)
  {
    if (internal->primaryConstituentDeviceSwitchingBehaviorForRecordingEnabled != primaryConstituentDeviceSwitchingBehaviorForRecordingEnabled)
    {
      internal->primaryConstituentDeviceSwitchingBehaviorForRecordingEnabled = primaryConstituentDeviceSwitchingBehaviorForRecordingEnabled;
      [(AVCaptureMovieFileOutput *)self _propagateBravoSwitchingBehaviorWhenRecording];
    }
  }
  else
  {
    uint64_t v5 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v5);
    }
    NSLog(&cfstr_SuppressingExc.isa, v5);
  }
}

- (void)setPrimaryConstituentDeviceSwitchingBehaviorForRecording:(AVCapturePrimaryConstituentDeviceSwitchingBehavior)switchingBehavior restrictedSwitchingBehaviorConditions:(AVCapturePrimaryConstituentDeviceRestrictedSwitchingBehaviorConditions)restrictedSwitchingBehaviorConditions
{
  internal = self->_internal;
  if (switchingBehavior == AVCapturePrimaryConstituentDeviceSwitchingBehaviorUnsupported)
  {
    if (!internal->deviceSupportsConstituentDeviceSwitching) {
      goto LABEL_13;
    }
LABEL_7:
    objc_super v8 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v9 = *MEMORY[0x1E4F1C3C8];
    goto LABEL_10;
  }
  if (!internal->deviceSupportsConstituentDeviceSwitching) {
    goto LABEL_7;
  }
  if (switchingBehavior == AVCapturePrimaryConstituentDeviceSwitchingBehaviorRestricted)
  {
    if (restrictedSwitchingBehaviorConditions >= 8)
    {
      objc_super v8 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v9 = *MEMORY[0x1E4F1C3C8];
LABEL_10:
      double v10 = (void *)[v8 exceptionWithName:v9 reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
      if (AVCaptureShouldThrowForAPIViolations()) {
        objc_exception_throw(v10);
      }
      NSLog(&cfstr_SuppressingExc.isa, v10);
      return;
    }
  }
  else if (restrictedSwitchingBehaviorConditions)
  {
    objc_super v8 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v9 = *MEMORY[0x1E4F1C3C8];
    goto LABEL_10;
  }
LABEL_13:
  int64_t primaryConstituentDeviceSwitchingBehavior = internal->primaryConstituentDeviceSwitchingBehavior;
  unint64_t primaryConstituentDeviceRestrictedSwitchingBehaviorConditions = internal->primaryConstituentDeviceRestrictedSwitchingBehaviorConditions;
  if (primaryConstituentDeviceSwitchingBehavior != switchingBehavior
    || primaryConstituentDeviceRestrictedSwitchingBehaviorConditions != restrictedSwitchingBehaviorConditions)
  {
    if (primaryConstituentDeviceSwitchingBehavior != switchingBehavior) {
      [(AVCaptureMovieFileOutput *)self willChangeValueForKey:@"primaryConstituentDeviceSwitchingBehavior"];
    }
    if (primaryConstituentDeviceRestrictedSwitchingBehaviorConditions == restrictedSwitchingBehaviorConditions)
    {
      self->_internal->int64_t primaryConstituentDeviceSwitchingBehavior = switchingBehavior;
      self->_internal->unint64_t primaryConstituentDeviceRestrictedSwitchingBehaviorConditions = restrictedSwitchingBehaviorConditions;
      [(AVCaptureMovieFileOutput *)self _propagateBravoSwitchingBehaviorWhenRecording];
    }
    else
    {
      [(AVCaptureMovieFileOutput *)self willChangeValueForKey:@"primaryConstituentDeviceRestrictedSwitchingBehaviorConditions"];
      self->_internal->int64_t primaryConstituentDeviceSwitchingBehavior = switchingBehavior;
      self->_internal->unint64_t primaryConstituentDeviceRestrictedSwitchingBehaviorConditions = restrictedSwitchingBehaviorConditions;
      [(AVCaptureMovieFileOutput *)self _propagateBravoSwitchingBehaviorWhenRecording];
      [(AVCaptureMovieFileOutput *)self didChangeValueForKey:@"primaryConstituentDeviceRestrictedSwitchingBehaviorConditions"];
    }
    if (primaryConstituentDeviceSwitchingBehavior != switchingBehavior)
    {
      [(AVCaptureMovieFileOutput *)self didChangeValueForKey:@"primaryConstituentDeviceSwitchingBehavior"];
    }
  }
}

- (void)_propagateBravoSwitchingBehaviorWhenRecording
{
  internal = self->_internal;
  objc_sync_enter(internal);
  id v4 = self->_internal;
  if (v4->recording)
  {
    int v7 = 0;
    LOBYTE(v7) = v4->primaryConstituentDeviceSwitchingBehaviorForRecordingEnabled;
    long long v8 = *(_OWORD *)&v4->primaryConstituentDeviceSwitchingBehavior;
    uint64_t v5 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v7 length:20];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __73__AVCaptureMovieFileOutput__propagateBravoSwitchingBehaviorWhenRecording__block_invoke;
    v6[3] = &unk_1E5A731B8;
    v6[4] = self;
    v6[5] = v5;
    [(AVCaptureOutput *)self performFigCaptureSessionOperationSafelyUsingBlock:v6];
  }
  objc_sync_exit(internal);
}

uint64_t __73__AVCaptureMovieFileOutput__propagateBravoSwitchingBehaviorWhenRecording__block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = result;
    uint64_t v4 = [*(id *)(result + 32) sinkID];
    uint64_t v5 = *(void *)(v3 + 40);
    uint64_t VTable = CMBaseObjectGetVTable();
    uint64_t v8 = *(void *)(VTable + 16);
    BOOL result = VTable + 16;
    uint64_t v7 = v8;
    uint64_t v9 = v8 ? v7 : 0;
    double v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 8);
    if (v10)
    {
      uint64_t v11 = *MEMORY[0x1E4F51668];
      return v10(a2, v4, v11, v5);
    }
  }
  return result;
}

- (AVCapturePrimaryConstituentDeviceSwitchingBehavior)primaryConstituentDeviceSwitchingBehaviorForRecording
{
  return self->_internal->primaryConstituentDeviceSwitchingBehavior;
}

- (AVCapturePrimaryConstituentDeviceRestrictedSwitchingBehaviorConditions)primaryConstituentDeviceRestrictedSwitchingBehaviorConditionsForRecording
{
  return self->_internal->primaryConstituentDeviceRestrictedSwitchingBehaviorConditions;
}

- (void)setOutputSettings:(NSDictionary *)outputSettings forConnection:(AVCaptureConnection *)connection
{
  uint64_t v7 = *MEMORY[0x1E4F47C68];
  if (![(AVCaptureConnection *)connection isEqual:[(AVCaptureOutput *)self connectionWithMediaType:*MEMORY[0x1E4F47C68]]])return; {
  if (outputSettings && ![(NSDictionary *)outputSettings count])
  }
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v12 = *MEMORY[0x1E4F1C3C8];
  }
  else
  {
    uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", -[AVCaptureMovieFileOutput supportedOutputSettingsKeysForConnection:](self, "supportedOutputSettingsKeysForConnection:", connection));
    if (outputSettings) {
      uint64_t v9 = [(NSDictionary *)outputSettings allKeys];
    }
    else {
      uint64_t v9 = (NSArray *)MEMORY[0x1E4F1CBF0];
    }
    double v10 = (void *)[MEMORY[0x1E4F1CA80] setWithArray:v9];
    [v10 minusSet:v8];
    if ([v10 count])
    {
      uint64_t v11 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v12 = *MEMORY[0x1E4F1C3C8];
    }
    else
    {
      id v13 = [(NSDictionary *)outputSettings objectForKeyedSubscript:*MEMORY[0x1E4F47D00]];
      if (!v13
        || [(NSArray *)[(AVCaptureMovieFileOutput *)self availableVideoCodecTypes] containsObject:v13])
      {
        if (outputSettings)
        {
          uint64_t v17 = 0;
          uint64_t v14 = (NSDictionary *)[MEMORY[0x1E4F47DE8] _videoOutputSettingsWithVideoSettingsDictionary:outputSettings exceptionReason:&v17];
          if (!v14)
          {
            uint64_t v11 = (void *)MEMORY[0x1E4F1CA00];
            uint64_t v12 = *MEMORY[0x1E4F1C3C8];
            goto LABEL_19;
          }
          outputSettings = v14;
          if ((objc_msgSend((id)-[NSDictionary compatibleMediaTypes](v14, "compatibleMediaTypes"), "containsObject:", v7) & 1) == 0)
          {
            uint64_t v11 = (void *)MEMORY[0x1E4F1CA00];
            uint64_t v12 = *MEMORY[0x1E4F1C3C8];
            goto LABEL_19;
          }
        }

        self->_internal->videoCodec = (NSString *)v13;
        uint64_t v15 = (void *)[(NSDictionary *)outputSettings outputSettingsDictionary];
        self->_internal->videoCompressionProperties = (NSDictionary *)objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E4F47D40]), "copy");
        return;
      }
      uint64_t v11 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v12 = *MEMORY[0x1E4F1C3C8];
    }
  }
LABEL_19:
  uint64_t v16 = (void *)[v11 exceptionWithName:v12 reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v16);
  }
  NSLog(&cfstr_SuppressingExc.isa, v16);
}

- (NSDictionary)outputSettingsForConnection:(AVCaptureConnection *)connection
{
  v24[4] = *MEMORY[0x1E4F143B8];
  if (![(NSArray *)[(AVCaptureOutput *)self connections] containsObject:connection])
  {
    uint64_t v14 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v14);
    }
    NSLog(&cfstr_SuppressingExc.isa, v14);
    return (NSDictionary *)MEMORY[0x1E4F1CC08];
  }
  id v5 = [(AVCaptureConnection *)connection mediaType];
  if ([v5 isEqualToString:*MEMORY[0x1E4F47C68]])
  {
    videoCodec = self->_internal->videoCodec;
    if (!videoCodec) {
      videoCodec = [(NSArray *)[(AVCaptureMovieFileOutput *)self availableVideoCodecTypes] firstObject];
    }
    if (objc_msgSend((id)objc_msgSend(-[AVCaptureOutput session](self, "session"), "sessionPreset"), "isEqualToString:", @"AVCaptureSessionPresetPhoto")&& (uint64_t v7 = objc_msgSend(-[AVCaptureConnection sourceDevice](connection, "sourceDevice"), "activeFormat")) != 0)
    {
      uint64_t v8 = v7;
      uint64_t MediaSubType = CMFormatDescriptionGetMediaSubType((CMFormatDescriptionRef)[v7 formatDescription]);
      unint64_t v10 = [v8 previewDimensions];
      uint64_t v11 = *MEMORY[0x1E4F47D98];
      v23[0] = *MEMORY[0x1E4F24D70];
      v24[0] = [NSNumber numberWithInt:MediaSubType];
      v23[1] = *MEMORY[0x1E4F24E10];
      v24[1] = [NSNumber numberWithInt:v10];
      v23[2] = *MEMORY[0x1E4F24D08];
      uint64_t v12 = [NSNumber numberWithInt:HIDWORD(v10)];
      v23[3] = *MEMORY[0x1E4F47D90];
      v24[2] = v12;
      v24[3] = v11;
      uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:4];
    }
    else
    {
      uint64_t v13 = 0;
    }
    uint64_t v15 = [(AVCaptureOutput *)self recommendedOutputSettingsForConnection:connection sourceSettings:v13 videoCodecType:videoCodec fileType:*MEMORY[0x1E4F47C08] isIris:0 outputFileURL:0];
    if (videoCodec)
    {
      videoCompressionProperties = self->_internal->videoCompressionProperties;
      if (videoCompressionProperties)
      {
        uint64_t v21 = *MEMORY[0x1E4F47D40];
        id v22 = videoCompressionProperties;
        uint64_t v19 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithDictionary:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1));
        DeepCopy = (void *)CFPropertyListCreateDeepCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v15, 1uLL);
        objc_msgSend(DeepCopy, "mfo_addEntriesFromDictionaryWithRecursion:", v19);
        return (NSDictionary *)DeepCopy;
      }
    }
    return v15;
  }
  uint64_t v17 = *MEMORY[0x1E4F47C08];

  return (NSDictionary *)[(AVCaptureOutput *)self recommendedOutputSettingsForConnection:connection sourceSettings:0 videoCodecType:0 fileType:v17 isIris:0 outputFileURL:0];
}

- (NSArray)metadata
{
  internal = self->_internal;
  objc_sync_enter(internal);
  uint64_t v4 = self->_internal->metadata;
  objc_sync_exit(internal);
  return v4;
}

- (void)setMetadata:(NSArray *)metadata
{
  v24[4] = *MEMORY[0x1E4F143B8];
  internal = self->_internal;
  objc_sync_enter(internal);

  self->_internal->metadata = (NSArray *)[(NSArray *)metadata copy];
  uint64_t v6 = self->_internal;
  if (v6->recording)
  {
    uint64_t v7 = [MEMORY[0x1E4F47DC8] _figMetadataPropertyFromMetadataItems:v6->metadata];
    if (!v7)
    {
      uint64_t v9 = *MEMORY[0x1E4F47C78];
      uint64_t v10 = *MEMORY[0x1E4F33070];
      v22[0] = *MEMORY[0x1E4F33068];
      uint64_t v8 = v22[0];
      v22[1] = v10;
      uint64_t v11 = MEMORY[0x1E4F1CBF0];
      v23[0] = v9;
      v23[1] = MEMORY[0x1E4F1CBF0];
      v24[0] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
      uint64_t v12 = *MEMORY[0x1E4F47C80];
      v20[0] = v8;
      v20[1] = v10;
      v21[0] = v12;
      v21[1] = v11;
      v24[1] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];
      uint64_t v13 = *MEMORY[0x1E4F47C70];
      v18[0] = v8;
      v18[1] = v10;
      v19[0] = v13;
      v19[1] = v11;
      v24[2] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
      uint64_t v14 = *MEMORY[0x1E4F47C88];
      v16[0] = v8;
      v16[1] = v10;
      v17[0] = v14;
      v17[1] = v11;
      v24[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
      uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:4];
    }
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __40__AVCaptureMovieFileOutput_setMetadata___block_invoke;
    v15[3] = &unk_1E5A731B8;
    v15[4] = self;
    v15[5] = v7;
    [(AVCaptureOutput *)self performFigCaptureSessionOperationSafelyUsingBlock:v15];
  }
  objc_sync_exit(internal);
}

uint64_t __40__AVCaptureMovieFileOutput_setMetadata___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = result;
    uint64_t v4 = [*(id *)(result + 32) sinkID];
    uint64_t v5 = *(void *)(v3 + 40);
    uint64_t VTable = CMBaseObjectGetVTable();
    uint64_t v8 = *(void *)(VTable + 16);
    BOOL result = VTable + 16;
    uint64_t v7 = v8;
    uint64_t v9 = v8 ? v7 : 0;
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 8);
    if (v10)
    {
      uint64_t v11 = *MEMORY[0x1E4F51670];
      return v10(a2, v4, v11, v5);
    }
  }
  return result;
}

+ (BOOL)updateMovieMetadataInFile:(id)a3 withMetadata:(id)a4 error:(id *)a5
{
  if (a5) {
    *a5 = 0;
  }
  [MEMORY[0x1E4F47DC8] _figMetadataPropertyFromMetadataItems:a4];
  uint64_t v6 = (const void *)FigMetadataRewriterDictionaryCreateFromFigMetadataPropertyArray();
  int v7 = FigRewriteMetadata();
  if (v6) {
    CFRelease(v6);
  }
  if (a5 && v7) {
    *a5 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v7 userInfo:0];
  }
  return v7 == 0;
}

+ (BOOL)consolidateMovieFragmentsInFile:(id)a3 error:(id *)a4
{
  if (!a4) {
    return FigConsolidateMovieFragments() == 0;
  }
  *a4 = 0;
  int v5 = FigConsolidateMovieFragments();
  if (!v5) {
    return 1;
  }
  uint64_t v6 = (void *)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v5 userInfo:0];
  BOOL result = 0;
  *a4 = v6;
  return result;
}

- (BOOL)recordsVideoOrientationAndMirroringChangesAsMetadataTrackForConnection:(AVCaptureConnection *)connection
{
  if (connection) {
    return -[NSMutableArray containsObject:](self->_internal->connectionsThatRecordVideoOrientationAndMirroringChangesAsMetadataTrack, "containsObject:");
  }
  else {
    return 0;
  }
}

- (void)setRecordsVideoOrientationAndMirroringChanges:(BOOL)doRecordChanges asMetadataTrackForConnection:(AVCaptureConnection *)connection
{
  if (connection)
  {
    BOOL v6 = doRecordChanges;
    if ([(NSArray *)[(AVCaptureOutput *)self connections] containsObject:connection])
    {
      id v7 = [(AVCaptureConnection *)connection mediaType];
      if ([v7 isEqualToString:*MEMORY[0x1E4F47C68]])
      {
        if ([(AVCaptureConnection *)connection isVideoOrientationSupported])
        {
          if ([(AVCaptureConnection *)connection isVideoMirroringSupported])
          {
            if ([(NSMutableArray *)self->_internal->connectionsThatRecordVideoOrientationAndMirroringChangesAsMetadataTrack containsObject:connection])
            {
              if (!v6)
              {
                connectionsThatRecordVideoOrientationAndMirroringChangesAsMetadataTrack = self->_internal->connectionsThatRecordVideoOrientationAndMirroringChangesAsMetadataTrack;
                [(NSMutableArray *)connectionsThatRecordVideoOrientationAndMirroringChangesAsMetadataTrack removeObject:connection];
              }
            }
            else if (v6)
            {
              uint64_t v17 = self->_internal->connectionsThatRecordVideoOrientationAndMirroringChangesAsMetadataTrack;
              [(NSMutableArray *)v17 addObject:connection];
            }
            return;
          }
          uint64_t v14 = (void *)MEMORY[0x1E4F1CA00];
          uint64_t v15 = *MEMORY[0x1E4F1C3C8];
          uint64_t v18 = connection;
        }
        else
        {
          uint64_t v14 = (void *)MEMORY[0x1E4F1CA00];
          uint64_t v15 = *MEMORY[0x1E4F1C3C8];
          uint64_t v18 = connection;
        }
      }
      else
      {
        uint64_t v14 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v15 = *MEMORY[0x1E4F1C3C8];
        uint64_t v18 = connection;
      }
    }
    else
    {
      uint64_t v14 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v15 = *MEMORY[0x1E4F1C3C8];
      uint64_t v18 = connection;
    }
    uint64_t v11 = AVMethodExceptionReasonWithObjectAndSelector();
    uint64_t v12 = v14;
    uint64_t v13 = v15;
  }
  else
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v10 = *MEMORY[0x1E4F1C3C8];
    uint64_t v11 = AVMethodExceptionReasonWithObjectAndSelector();
    uint64_t v12 = v9;
    uint64_t v13 = v10;
  }
  uint64_t v16 = objc_msgSend(v12, "exceptionWithName:reason:userInfo:", v13, v11, 0, v18);
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v16);
  }
  NSLog(&cfstr_SuppressingExc.isa, v16);
}

- (void)startRecordingMovieWithSettings:(id)a3 delegate:(id)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  uint64_t v13 = 0;
  if (!a3
    || !self
    || !-[NSArray containsObject:](-[AVCaptureMovieFileOutput availableVideoCodecTypes](self, "availableVideoCodecTypes"), "containsObject:", [a3 videoCodecType])|| !objc_msgSend(a3, "movieFileURL")|| !objc_msgSend((id)objc_msgSend(a3, "movieFileURL"), "isFileURL")|| !a4|| (objc_opt_respondsToSelector() & 1) == 0)
  {
LABEL_18:
    uint64_t v10 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v10);
    }
    NSLog(&cfstr_SuppressingExc.isa, v10);
    return;
  }
  id v7 = [(AVCaptureOutput *)self connectionWithMediaType:*MEMORY[0x1E4F47C68]];
  if ([a3 isAutoSpatialOverCaptureEnabled])
  {
    if (!v7
      || !objc_msgSend(-[AVCaptureConnection sourceDevice](v7, "sourceDevice"), "isSpatialOverCaptureEnabled")|| !objc_msgSend(a3, "spatialOverCaptureMovieFileURL")|| (objc_msgSend((id)objc_msgSend(a3, "spatialOverCaptureMovieFileURL"), "isFileURL") & 1) == 0)
    {
      goto LABEL_18;
    }
LABEL_15:
    -[AVCaptureMovieFileOutput outputSizeForSourceFormat:](self, "outputSizeForSourceFormat:", objc_msgSend(-[AVCaptureConnection sourceDevice](v7, "sourceDevice"), "activeFormat"));
    if (!AVCaptureMovieFileURLIsValidForConnection(v7, v8, v9, [a3 movieFileURL], &v13)) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  if (v7) {
    goto LABEL_15;
  }
LABEL_16:
  if (!objc_msgSend(-[AVCaptureOutput liveConnections](self, "liveConnections"), "count")) {
    goto LABEL_18;
  }
LABEL_17:
  if (v13) {
    goto LABEL_18;
  }
  uint64_t v11 = +[AVMomentCaptureMovieFileOutputDelegateWrapper wrapperWithSettings:a3 delegate:a4 connections:[(AVCaptureOutput *)self liveConnections]];
  if (-[AVCaptureMovieFileOutput _totalNANDBandwidthAllowed:videoCodecType:](self, "_totalNANDBandwidthAllowed:videoCodecType:", [a3 movieFileURL], objc_msgSend(a3, "videoCodecType")))
  {
    if (!AVGestaltGetBoolAnswer(@"AVGQCaptureCheckIfFileAlreadyExistForMFO")
      || (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "fileExistsAtPath:", objc_msgSend((id)objc_msgSend(a3, "movieFileURL"), "path")) & 1) == 0)
    {
      [(AVCaptureMovieFileOutput *)self _startRecording:v11];
      return;
    }
    uint64_t v12 = 4294950886;
  }
  else
  {
    uint64_t v12 = 4294951858;
  }
  uint64_t v14 = *MEMORY[0x1E4F516D8];
  v15[0] = [NSNumber numberWithInt:v12];
  -[AVCaptureMovieFileOutput handleDidStopRecordingNotificationForWrapper:withPayload:demoof:addMetadata:](self, "handleDidStopRecordingNotificationForWrapper:withPayload:demoof:addMetadata:", v11, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1], 0, 0);
}

- (id)_avErrorUserInfoDictionaryForError:(int)a3 wrapper:(id)a4 payload:(id)a5
{
  double v9 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v10 = [a5 objectForKeyedSubscript:*MEMORY[0x1E4F51760]];
  if (v10) {
    [v9 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F47B90]];
  }
  uint64_t v11 = 1;
  switch(a3)
  {
    case -16413:
      uint64_t v12 = (void *)MEMORY[0x1E4F29238];
      if (self) {
        [(AVCaptureFileOutput *)self maxRecordedDuration];
      }
      else {
        memset(v21, 0, sizeof(v21));
      }
      uint64_t v13 = [v12 valueWithCMTime:v21];
      uint64_t v14 = (void *)MEMORY[0x1E4F47B98];
      goto LABEL_20;
    case -16412:
      uint64_t v13 = objc_msgSend(NSNumber, "numberWithLongLong:", -[AVCaptureFileOutput maxRecordedFileSize](self, "maxRecordedFileSize", 1));
      uint64_t v14 = (void *)MEMORY[0x1E4F47B78];
      goto LABEL_20;
    case -16411:
      int v15 = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E4F51538]), "BOOLValue");
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v16 = a4;
      }
      else {
        id v16 = 0;
      }
      if (v15) {
        BOOL v17 = v16 == 0;
      }
      else {
        BOOL v17 = 1;
      }
      if (v17) {
        uint64_t v18 = [a4 outputFileURL];
      }
      else {
        uint64_t v18 = [v16 spatialOverCaptureMovieFileURL];
      }
      uint64_t v13 = v18;
      uint64_t v14 = (void *)MEMORY[0x1E4F289D0];
LABEL_20:
      [v9 setObject:v13 forKeyedSubscript:*v14];
      uint64_t v11 = 1;
      break;
    case -16405:
      uint64_t v11 = 2;
      break;
    default:
      break;
  }
  uint64_t v19 = [NSNumber numberWithUnsignedInteger:v11];
  [v9 setObject:v19 forKeyedSubscript:*MEMORY[0x1E4F47B88]];
  return v9;
}

- (CGSize)outputSizeForSourceFormat:(id)a3
{
  if (objc_msgSend((id)objc_msgSend(-[AVCaptureOutput session](self, "session"), "sessionPreset"), "isEqualToString:", @"AVCaptureSessionPresetPhoto"))
  {
    uint64_t v5 = [a3 previewDimensions];
    double v6 = (double)(int)v5;
    double v7 = (double)SHIDWORD(v5);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)AVCaptureMovieFileOutput;
    [(AVCaptureOutput *)&v8 outputSizeForSourceFormat:a3];
  }
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)attachSafelyToFigCaptureSession:(OpaqueFigCaptureSession *)a3
{
  uint64_t v5 = (void *)[MEMORY[0x1E4F47DB8] notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
  weakReference = self->_internal->weakReference;
  [v5 addListenerWithWeakReference:weakReference callback:mfoNotificationHandler name:*MEMORY[0x1E4F51560] object:a3 flags:0];
  [v5 addListenerWithWeakReference:weakReference callback:mfoNotificationHandler name:*MEMORY[0x1E4F51568] object:a3 flags:0];
  [v5 addListenerWithWeakReference:weakReference callback:mfoNotificationHandler name:*MEMORY[0x1E4F51550] object:a3 flags:0];
  [v5 addListenerWithWeakReference:weakReference callback:mfoNotificationHandler name:*MEMORY[0x1E4F51558] object:a3 flags:0];
  [v5 addListenerWithWeakReference:weakReference callback:mfoNotificationHandler name:*MEMORY[0x1E4F51548] object:a3 flags:0];
  v7.receiver = self;
  v7.super_class = (Class)AVCaptureMovieFileOutput;
  [(AVCaptureOutput *)&v7 attachSafelyToFigCaptureSession:a3];
}

- (void)detachSafelyFromFigCaptureSession:(OpaqueFigCaptureSession *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  internal = self->_internal;
  objc_sync_enter(internal);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  double v6 = (void *)[(NSMutableArray *)self->_internal->recordingDelegatesArray reverseObjectEnumerator];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v10 isTrueVideoCaptureEnabled])
        {
          [v10 setPendingDidStopRecordingUnregistrationCaptureSession:a3];
          char v11 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  char v11 = 0;
LABEL_11:
  objc_sync_exit(internal);
  uint64_t v12 = (void *)[MEMORY[0x1E4F47DB8] notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
  [v12 removeListenerWithWeakReference:self->_internal->weakReference callback:mfoNotificationHandler name:*MEMORY[0x1E4F51560] object:a3];
  if ((v11 & 1) == 0) {
    [v12 removeListenerWithWeakReference:self->_internal->weakReference callback:mfoNotificationHandler name:*MEMORY[0x1E4F51568] object:a3];
  }
  [v12 removeListenerWithWeakReference:self->_internal->weakReference callback:mfoNotificationHandler name:*MEMORY[0x1E4F51550] object:a3];
  [v12 removeListenerWithWeakReference:self->_internal->weakReference callback:mfoNotificationHandler name:*MEMORY[0x1E4F51558] object:a3];
  [v12 removeListenerWithWeakReference:self->_internal->weakReference callback:mfoNotificationHandler name:*MEMORY[0x1E4F51548] object:a3];
  v13.receiver = self;
  v13.super_class = (Class)AVCaptureMovieFileOutput;
  [(AVCaptureOutput *)&v13 detachSafelyFromFigCaptureSession:a3];
}

- (void)safelyHandleServerConnectionDeathForFigCaptureSession:(OpaqueFigCaptureSession *)a3
{
  internal = self->_internal;
  objc_sync_enter(internal);
  id v5 = (id)[(NSMutableArray *)self->_internal->recordingDelegatesArray copy];
  objc_sync_exit(internal);
  double v6 = dispatch_queue_create("com.apple.avfoundation.capture.moviefileoutput.cleanupQueue", 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __82__AVCaptureMovieFileOutput_safelyHandleServerConnectionDeathForFigCaptureSession___block_invoke;
  v7[3] = &unk_1E5A72D70;
  v7[4] = v5;
  v7[5] = self;
  dispatch_async(v6, v7);
}

uint64_t __82__AVCaptureMovieFileOutput_safelyHandleServerConnectionDeathForFigCaptureSession___block_invoke(uint64_t a1)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  uint64_t v13 = *MEMORY[0x1E4F516D8];
  v14[0] = &unk_1EF4FA6B8;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t result = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(a1 + 40) handleDidStopRecordingNotificationForWrapper:*(void *)(*((void *)&v8 + 1) + 8 * v7++) withPayload:v2 demoof:1 addMetadata:1];
      }
      while (v5 != v7);
      uint64_t result = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      uint64_t v5 = result;
    }
    while (result);
  }
  return result;
}

- (void)_removeRecordingDelegateWrapper:(id)a3
{
  -[NSMutableArray removeObject:](self->_internal->recordingDelegatesArray, "removeObject:");
  if ([a3 pendingDidStopRecordingUnregistrationCaptureSession])
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F47DB8], "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter()), "removeListenerWithWeakReference:callback:name:object:", self->_internal->weakReference, mfoNotificationHandler, *MEMORY[0x1E4F51568], objc_msgSend(a3, "pendingDidStopRecordingUnregistrationCaptureSession"));
    [a3 setPendingDidStopRecordingUnregistrationCaptureSession:0];
  }
  uint64_t v5 = (void *)[(NSMutableArray *)self->_internal->recordingDelegatesArray firstObject];
  int v6 = [v5 isRecording];
  int v7 = [v5 isPaused];
  internal = self->_internal;
  if (internal->recording != v6)
  {
    [(AVCaptureMovieFileOutput *)self willChangeValueForKey:@"recording"];
    internal = self->_internal;
  }
  if (internal->paused != v7)
  {
    [(AVCaptureMovieFileOutput *)self willChangeValueForKey:@"paused"];
    self->_internal->paused = v7;
    [(AVCaptureMovieFileOutput *)self didChangeValueForKey:@"paused"];
    internal = self->_internal;
  }
  if (internal->recording != v6)
  {
    internal->recording = v6;
    [(AVCaptureMovieFileOutput *)self didChangeValueForKey:@"recording"];
  }
}

- (void)handleDidStartRecordingNotificationForWrapper:(id)a3 withPayload:(id)a4
{
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (!a3 || (isKindOfClass & 1) == 0)
  {
    [a3 isRecording];
    if ([a3 isRecording]) {
      return;
    }
    long long v8 = (void *)[a3 delegateStorage];
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    uint64_t v12 = __86__AVCaptureMovieFileOutput_handleDidStartRecordingNotificationForWrapper_withPayload___block_invoke_2;
    uint64_t v13 = &unk_1E5A73BB8;
    id v14 = a3;
    long long v15 = self;
    id v16 = a4;
    long long v9 = &v10;
    goto LABEL_9;
  }
  if ([a3 isRecording]) {
    [a3 spatialOverCaptureMovieFileURL];
  }
  if (([a3 isRecording] & 1) == 0)
  {
    long long v8 = (void *)[a3 delegateStorage];
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    uint64_t v19 = __86__AVCaptureMovieFileOutput_handleDidStartRecordingNotificationForWrapper_withPayload___block_invoke;
    v20 = &unk_1E5A73BB8;
    id v21 = a3;
    id v22 = a4;
    v23 = self;
    long long v9 = &v17;
LABEL_9:
    objc_msgSend(v8, "invokeDelegateCallbackWithBlock:", v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23);
  }
}

uint64_t __86__AVCaptureMovieFileOutput_handleDidStartRecordingNotificationForWrapper_withPayload___block_invoke(id *a1, void *a2)
{
  [a1[4] setRecording:1];
  unsigned int v4 = objc_msgSend((id)objc_msgSend(a1[5], "objectForKeyedSubscript:", *MEMORY[0x1E4F51520]), "intValue");
  uint64_t v5 = objc_msgSend((id)objc_msgSend(a1[5], "objectForKeyedSubscript:", *MEMORY[0x1E4F51518]), "intValue");
  uint64_t v6 = objc_msgSend((id)objc_msgSend(a1[5], "objectForKeyedSubscript:", *MEMORY[0x1E4F51530]), "BOOLValue");
  if (objc_msgSend((id)objc_msgSend(a1[5], "objectForKeyedSubscript:", *MEMORY[0x1E4F51A20]), "BOOLValue"))uint64_t v7 = objc_msgSend(a1[4], "spatialOverCaptureMovieFileURL"); {
  else
  }
    uint64_t v7 = 0;
  long long v8 = +[AVMomentCaptureMovieRecordingResolvedSettings movieRecordingResolvedSettingsWithUniqueID:torchEnabled:movieURL:spatialOverCaptureURL:movieDimensions:](AVMomentCaptureMovieRecordingResolvedSettings, "movieRecordingResolvedSettingsWithUniqueID:torchEnabled:movieURL:spatialOverCaptureURL:movieDimensions:", [a1[4] settingsID], v6, objc_msgSend(a1[4], "outputFileURL"), v7, v4 | (unint64_t)(v5 << 32));
  [a1[4] setResolvedSettings:v8];
  long long v9 = (void *)*((void *)a1[6] + 4);
  objc_sync_enter(v9);
  int v10 = [a1[4] isRecording];
  uint64_t v11 = a1[6];
  if (*(unsigned __int8 *)(v11[4] + 89) != v10)
  {
    [v11 willChangeValueForKey:@"recording"];
    *(unsigned char *)(*((void *)a1[6] + 4) + 89) = [a1[4] isRecording];
    [a1[6] didChangeValueForKey:@"recording"];
  }
  if (objc_opt_respondsToSelector()) {
    [a2 captureOutput:a1[6] didBeginMovieCaptureForResolvedSettings:v8];
  }

  return objc_sync_exit(v9);
}

uint64_t __86__AVCaptureMovieFileOutput_handleDidStartRecordingNotificationForWrapper_withPayload___block_invoke_2(id *a1, void *a2)
{
  [a1[4] setRecording:1];
  unsigned int v4 = (void *)*((void *)a1[5] + 4);
  objc_sync_enter(v4);
  int v5 = [a1[4] isRecording];
  uint64_t v6 = a1[5];
  if (*(unsigned __int8 *)(v6[4] + 89) != v5)
  {
    [v6 willChangeValueForKey:@"recording"];
    *(unsigned char *)(*((void *)a1[5] + 4) + 89) = [a1[4] isRecording];
    [a1[5] didChangeValueForKey:@"recording"];
  }
  objc_sync_exit(v4);
  if (objc_opt_respondsToSelector())
  {
    memset(&v15, 0, sizeof(v15));
    CMTimeMakeFromDictionary(&v15, (CFDictionaryRef)[a1[6] objectForKeyedSubscript:*MEMORY[0x1E4F51528]]);
    id v7 = a1[5];
    uint64_t v8 = [a1[4] outputFileURL];
    uint64_t v9 = [a1[4] connections];
    CMTime v14 = v15;
    return [a2 captureOutput:v7 didStartRecordingToOutputFileAtURL:v8 startPTS:&v14 fromConnections:v9];
  }
  else
  {
    uint64_t result = objc_opt_respondsToSelector();
    if (result)
    {
      id v11 = a1[5];
      uint64_t v12 = [a1[4] outputFileURL];
      uint64_t v13 = [a1[4] connections];
      return [a2 captureOutput:v11 didStartRecordingToOutputFileAtURL:v12 fromConnections:v13];
    }
  }
  return result;
}

- (void)handleDidStopRecordingNotificationForWrapper:(id)a3 withPayload:(id)a4 demoof:(BOOL)a5 addMetadata:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (a3 && (isKindOfClass & 1) != 0)
  {
    [(AVCaptureMovieFileOutput *)self handleDidStopRecordingNotificationForMomentCaptureWrapper:a3 withPayload:a4 demoof:v7 addMetadata:v6];
  }
  else
  {
    uint64_t v12 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E4F516D8]), "intValue");
    uint64_t v13 = [a4 objectForKeyedSubscript:*MEMORY[0x1E4F51750]];
    uint64_t v14 = [a4 objectForKeyedSubscript:*MEMORY[0x1E4F51748]];
    if (v14) {
      BOOL v15 = v13 == 0;
    }
    else {
      BOOL v15 = 1;
    }
    if (!v15)
    {
      id v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v14, @"AVCaptureOutputNotificationInfoVideoPreviewFrameSurface", v13, @"AVCaptureOutputNotificationInfoVideoPreviewFrameSurfaceSize", 0);
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      void v23[2] = __104__AVCaptureMovieFileOutput_handleDidStopRecordingNotificationForWrapper_withPayload_demoof_addMetadata___block_invoke;
      v23[3] = &unk_1E5A72D70;
      void v23[4] = self;
      v23[5] = v16;
      [(AVCaptureOutput *)self performBlockOnSessionNotifyingThread:v23];
    }
    uint64_t v22 = 0;
    if (v7)
    {
      +[AVCaptureMovieFileOutput consolidateMovieFragmentsInFile:error:](AVCaptureMovieFileOutput, "consolidateMovieFragmentsInFile:error:", [a3 outputFileURL], &v22);
      a4 = (id)[a4 mutableCopy];
      uint64_t v17 = [NSNumber numberWithBool:v22 == 0];
      [a4 setObject:v17 forKeyedSubscript:*MEMORY[0x1E4F51760]];
    }
    uint64_t v18 = [(AVCaptureMovieFileOutput *)self metadata];
    if (v6 && !v22)
    {
      uint64_t v19 = v18;
      if ((objc_msgSend((id)objc_msgSend(a3, "metadata"), "isEqual:", v18) & 1) == 0) {
        +[AVCaptureMovieFileOutput updateMovieMetadataInFile:withMetadata:error:](AVCaptureMovieFileOutput, "updateMovieMetadataInFile:withMetadata:error:", [a3 outputFileURL], v19, &v22);
      }
    }
    if (v12)
    {
      [(AVCaptureMovieFileOutput *)self _avErrorUserInfoDictionaryForError:v12 wrapper:a3 payload:a4];
      uint64_t v22 = AVLocalizedErrorWithUnderlyingOSStatus();
    }
    v20 = (void *)[a3 delegateStorage];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    void v21[2] = __104__AVCaptureMovieFileOutput_handleDidStopRecordingNotificationForWrapper_withPayload_demoof_addMetadata___block_invoke_2;
    void v21[3] = &unk_1E5A73BE0;
    v21[4] = self;
    v21[5] = a3;
    v21[6] = a4;
    v21[7] = v22;
    [v20 invokeDelegateCallbackWithBlock:v21];
  }
}

uint64_t __104__AVCaptureMovieFileOutput_handleDidStopRecordingNotificationForWrapper_withPayload_demoof_addMetadata___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);

  return [v2 postNotificationName:@"AVCaptureMovieFileOutputRecordingCompletedNotification" object:v3 userInfo:v4];
}

uint64_t __104__AVCaptureMovieFileOutput_handleDidStopRecordingNotificationForWrapper_withPayload_demoof_addMetadata___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 32);
  objc_sync_enter(v4);
  [*(id *)(a1 + 32) _removeRecordingDelegateWrapper:*(void *)(a1 + 40)];
  objc_sync_exit(v4);
  if (objc_opt_respondsToSelector())
  {
    uint64_t v5 = [*(id *)(a1 + 48) objectForKeyedSubscript:*MEMORY[0x1E4F51698]];
    if (v5) {
      uint64_t v6 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v5];
    }
    else {
      uint64_t v6 = 0;
    }
    uint64_t v12 = *(void *)(a1 + 32);
    uint64_t v13 = [*(id *)(a1 + 40) outputFileURL];
    uint64_t v14 = [*(id *)(a1 + 40) connections];
    uint64_t v15 = *(void *)(a1 + 56);
    return [a2 captureOutput:v12 didFinishRecordingToOutputFileAtURL:v13 debugMetadataSidecarFileURL:v6 fromConnections:v14 error:v15];
  }
  else
  {
    uint64_t result = objc_opt_respondsToSelector();
    if (result)
    {
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = [*(id *)(a1 + 40) outputFileURL];
      uint64_t v10 = [*(id *)(a1 + 40) connections];
      uint64_t v11 = *(void *)(a1 + 56);
      return [a2 captureOutput:v8 didFinishRecordingToOutputFileAtURL:v9 fromConnections:v10 error:v11];
    }
  }
  return result;
}

- (void)handleDidStopRecordingNotificationForMomentCaptureWrapper:(id)a3 withPayload:(id)a4 demoof:(BOOL)a5 addMetadata:(BOOL)a6
{
  BOOL v6 = a5;
  id v7 = a4;
  uint64_t v10 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E4F516D8]), "intValue");
  int v11 = objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E4F51538]), "BOOLValue");
  char v12 = v11;
  if (v11) {
    uint64_t v13 = [a3 spatialOverCaptureMovieFileURL];
  }
  else {
    uint64_t v13 = [a3 outputFileURL];
  }
  uint64_t v14 = v13;
  uint64_t v19 = 0;
  if (v6)
  {
    +[AVCaptureMovieFileOutput consolidateMovieFragmentsInFile:v13 error:&v19];
    id v7 = (id)[v7 mutableCopy];
    uint64_t v15 = [NSNumber numberWithBool:v19 == 0];
    [v7 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4F51760]];
  }
  if (v10)
  {
    [(AVCaptureMovieFileOutput *)self _avErrorUserInfoDictionaryForError:v10 wrapper:a3 payload:v7];
    uint64_t v19 = AVLocalizedErrorWithUnderlyingOSStatus();
  }
  id v16 = (void *)[a3 delegateStorage];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  void v17[2] = __117__AVCaptureMovieFileOutput_handleDidStopRecordingNotificationForMomentCaptureWrapper_withPayload_demoof_addMetadata___block_invoke;
  v17[3] = &unk_1E5A73C08;
  char v18 = v12;
  v17[4] = self;
  v17[5] = a3;
  v17[6] = v7;
  v17[7] = v14;
  v17[8] = v19;
  [v16 invokeDelegateCallbackWithBlock:v17];
}

uint64_t __117__AVCaptureMovieFileOutput_handleDidStopRecordingNotificationForMomentCaptureWrapper_withPayload_demoof_addMetadata___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 32);
  objc_sync_enter(v4);
  uint64_t v5 = *(void **)(a1 + 40);
  if (*(unsigned char *)(a1 + 72)) {
    [v5 setDidFinishWritingSpatialOverCaptureMovieCallbackFired:1];
  }
  else {
    [v5 setDidFinishWritingMovieCallbackFired:1];
  }
  if ([*(id *)(a1 + 40) didFinishWritingMovieCallbackFired]
    && [*(id *)(a1 + 40) didFinishWritingSpatialOverCaptureMovieCallbackFired])
  {
    [*(id *)(a1 + 32) _removeRecordingDelegateWrapper:*(void *)(a1 + 40)];
    int v6 = 1;
  }
  else
  {
    int v6 = 0;
  }
  objc_sync_exit(v4);
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v8 = (__IOSurface *)[*(id *)(a1 + 48) objectForKeyedSubscript:*MEMORY[0x1E4F51748]];
    uint64_t v9 = [*(id *)(a1 + 48) objectForKeyedSubscript:*MEMORY[0x1E4F51698]];
    if (v9) {
      uint64_t v10 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v9];
    }
    else {
      uint64_t v10 = 0;
    }
    int v11 = *(void **)(a1 + 40);
    if (*(unsigned char *)(a1 + 72)) {
      uint64_t v12 = [v11 spatialOverCaptureMovieMetadata];
    }
    else {
      uint64_t v12 = [v11 metadata];
    }
    uint64_t v13 = +[AVMomentCaptureMovie movieWithResolvedSettings:outputFileURL:movieMetadata:](AVMomentCaptureMovie, "movieWithResolvedSettings:outputFileURL:movieMetadata:", [*(id *)(a1 + 40) resolvedSettings], *(void *)(a1 + 56), v12);
    uint64_t v14 = v13;
    if (v10) {
      [(AVMomentCaptureMovie *)v13 _setDebugMetadataSidecarFileURL:v10];
    }
    if (v8)
    {
      pixelBufferOut.value = 0;
      if (!CVPixelBufferCreateWithIOSurface((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v8, 0, (CVPixelBufferRef *)&pixelBufferOut))
      {
        [(AVMomentCaptureMovie *)v14 _setPreviewPixelBuffer:pixelBufferOut.value];
        if (pixelBufferOut.value) {
          CFRelease((CFTypeRef)pixelBufferOut.value);
        }
      }
    }
    CFDictionaryRef v15 = (const __CFDictionary *)[*(id *)(a1 + 48) objectForKeyedSubscript:*MEMORY[0x1E4F51540]];
    if (v15)
    {
      memset(&pixelBufferOut, 0, sizeof(pixelBufferOut));
      CMTimeMakeFromDictionary(&pixelBufferOut, v15);
      CMTime v16 = pixelBufferOut;
      [(AVMomentCaptureMovie *)v14 _setDuration:&v16];
    }
    uint64_t result = [a2 captureOutput:*(void *)(a1 + 32) didFinishWritingMovie:v14 error:*(void *)(a1 + 64)];
  }
  if (v6)
  {
    uint64_t result = objc_opt_respondsToSelector();
    if (result) {
      return objc_msgSend(a2, "captureOutput:didFinishMovieCaptureForResolvedSettings:error:", *(void *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "resolvedSettings"), *(void *)(a1 + 64));
    }
  }
  return result;
}

- (void)handleDidPauseRecordingNotificationForWrapper:(id)a3 withPayload:(id)a4
{
  [a3 isRecording];
  int v6 = (void *)[a3 delegateStorage];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __86__AVCaptureMovieFileOutput_handleDidPauseRecordingNotificationForWrapper_withPayload___block_invoke;
  v7[3] = &unk_1E5A73C30;
  v7[4] = self;
  v7[5] = a3;
  [v6 invokeDelegateCallbackWithBlock:v7];
}

uint64_t __86__AVCaptureMovieFileOutput_handleDidPauseRecordingNotificationForWrapper_withPayload___block_invoke(uint64_t a1, void *a2)
{
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(a2, "captureOutput:didPauseRecordingToOutputFileAtURL:fromConnections:", *(void *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "outputFileURL"), objc_msgSend(*(id *)(a1 + 40), "connections"));
  }
  [*(id *)(a1 + 40) setPaused:1];
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 32);
  objc_sync_enter(v4);
  int v5 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 32) + 32) + 90);
  if (v5 != [*(id *)(a1 + 40) isPaused])
  {
    [*(id *)(a1 + 32) willChangeValueForKey:@"paused"];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 32) + 90) = [*(id *)(a1 + 40) isPaused];
    [*(id *)(a1 + 32) didChangeValueForKey:@"paused"];
  }

  return objc_sync_exit(v4);
}

- (void)handleDidResumeRecordingNotificationForWrapper:(id)a3 withPayload:(id)a4
{
  [a3 isRecording];
  [a3 isPaused];
  int v6 = (void *)[a3 delegateStorage];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __87__AVCaptureMovieFileOutput_handleDidResumeRecordingNotificationForWrapper_withPayload___block_invoke;
  v7[3] = &unk_1E5A73C30;
  v7[4] = self;
  v7[5] = a3;
  [v6 invokeDelegateCallbackWithBlock:v7];
}

uint64_t __87__AVCaptureMovieFileOutput_handleDidResumeRecordingNotificationForWrapper_withPayload___block_invoke(uint64_t a1, void *a2)
{
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(a2, "captureOutput:didResumeRecordingToOutputFileAtURL:fromConnections:", *(void *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "outputFileURL"), objc_msgSend(*(id *)(a1 + 40), "connections"));
  }
  [*(id *)(a1 + 40) setPaused:0];
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 32);
  objc_sync_enter(v4);
  int v5 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 32) + 32) + 90);
  if (v5 != [*(id *)(a1 + 40) isPaused])
  {
    [*(id *)(a1 + 32) willChangeValueForKey:@"paused"];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 32) + 90) = [*(id *)(a1 + 40) isPaused];
    [*(id *)(a1 + 32) didChangeValueForKey:@"paused"];
  }

  return objc_sync_exit(v4);
}

- (void)handleDidDropFrameWhileRecordingNotificationForWrapper:(id)a3 withPayload:(id)a4
{
  uint64_t v7 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E4F516D8]), "intValue");
  if (v7)
  {
    [(AVCaptureMovieFileOutput *)self _avErrorUserInfoDictionaryForError:v7 wrapper:a3 payload:a4];
    uint64_t v8 = AVLocalizedErrorWithUnderlyingOSStatus();
  }
  else
  {
    uint64_t v8 = 0;
  }
  uint64_t v9 = (void *)[a3 delegateStorage];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __95__AVCaptureMovieFileOutput_handleDidDropFrameWhileRecordingNotificationForWrapper_withPayload___block_invoke;
  v10[3] = &unk_1E5A73BB8;
  v10[4] = self;
  v10[5] = v8;
  v10[6] = a3;
  [v9 invokeDelegateCallbackWithBlock:v10];
}

uint64_t __95__AVCaptureMovieFileOutput_handleDidDropFrameWhileRecordingNotificationForWrapper_withPayload___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    if (dword_1EB4C9200)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    return objc_msgSend(a2, "captureOutput:didDropFrameWhileRecordingToOutputFileAtURL:fromConnections:error:", *(void *)(a1 + 32), objc_msgSend(*(id *)(a1 + 48), "outputFileURL", v6, v7), objc_msgSend(*(id *)(a1 + 48), "connections"), *(void *)(a1 + 40));
  }
  return result;
}

- (void)handleNotification:(id)a3 payload:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  internal = self->_internal;
  objc_sync_enter(internal);
  id v8 = (id)[(NSMutableArray *)self->_internal->recordingDelegatesArray copy];
  objc_sync_exit(internal);
  if (objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E4F51770]), "isEqual:", -[AVCaptureOutput sinkID](self, "sinkID")))
  {
    uint64_t v9 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E4F51778]), "longLongValue");
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          if ([v13 settingsID] == v9)
          {
            if (v13)
            {
              if (dword_1EB4C9200)
              {
                os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
                fig_log_call_emit_and_clean_up_after_send_and_compose();
              }
              if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E4F51560], v15, v16))
              {
                [(AVCaptureMovieFileOutput *)self handleDidStartRecordingNotificationForWrapper:v13 withPayload:a4];
              }
              else if ([a3 isEqualToString:*MEMORY[0x1E4F51568]])
              {
                [(AVCaptureMovieFileOutput *)self handleDidStopRecordingNotificationForWrapper:v13 withPayload:a4 demoof:0 addMetadata:0];
              }
              else if ([a3 isEqualToString:*MEMORY[0x1E4F51550]])
              {
                [(AVCaptureMovieFileOutput *)self handleDidPauseRecordingNotificationForWrapper:v13 withPayload:a4];
              }
              else if ([a3 isEqualToString:*MEMORY[0x1E4F51558]])
              {
                [(AVCaptureMovieFileOutput *)self handleDidResumeRecordingNotificationForWrapper:v13 withPayload:a4];
              }
              else if ([a3 isEqualToString:*MEMORY[0x1E4F51548]])
              {
                [(AVCaptureMovieFileOutput *)self handleDidDropFrameWhileRecordingNotificationForWrapper:v13 withPayload:a4];
              }
            }
            return;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
  }
}

- (BOOL)_totalNANDBandwidthAllowed:(id)a3 videoCodecType:(id)a4
{
  id v7 = [(AVCaptureOutput *)self session];

  return [v7 requestNANDBandwidthToStartMovieFileRecording:self outputFileURL:a3 videoCodecType:a4];
}

- (void)_startRecording:(id)a3
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = a3;
  }
  else {
    id v5 = 0;
  }
  id v33 = a3;
  internal = self->_internal;
  objc_sync_enter(internal);
  [(AVCaptureMovieFileOutput *)self willChangeValueForKey:@"outputFileURL"];
  [(NSMutableArray *)self->_internal->recordingDelegatesArray addObject:a3];
  [(AVCaptureMovieFileOutput *)self didChangeValueForKey:@"outputFileURL"];
  if (objc_msgSend((id)objc_msgSend(-[AVCaptureOutput session](self, "session"), "sessionPreset"), "isEqualToString:", @"AVCaptureSessionPresetVoicemailGreeting"))
  {
    uint64_t v6 = objc_msgSend((id)objc_msgSend(a3, "connections"), "firstObject");
    id v7 = (void *)[v6 mediaType];
    if ([v7 isEqual:*MEMORY[0x1E4F47C40]])
    {
      id v8 = objc_alloc_init(MEMORY[0x1E4F50EF0]);
      objc_msgSend(v8, "setSettingsID:", objc_msgSend(v33, "settingsID"));
      objc_msgSend(v8, "setOutputURL:", objc_msgSend(v33, "outputFileURL"));
      uint64_t v9 = *MEMORY[0x1E4F47BB8];
      [v8 setOutputFileType:*MEMORY[0x1E4F47BB8]];
      [(AVCaptureFileOutput *)self maxRecordedDuration];
      long long v57 = v59;
      uint64_t v58 = v60;
      [v8 setMaxDuration:&v57];
      objc_msgSend(v8, "setMaxFileSize:", -[AVCaptureFileOutput maxRecordedFileSize](self, "maxRecordedFileSize"));
      objc_msgSend(v8, "setMinFreeDiskSpaceLimit:", -[AVCaptureFileOutput minFreeDiskSpaceLimit](self, "minFreeDiskSpaceLimit"));
      objc_msgSend(v8, "setAudioSettings:", -[AVCaptureOutput recommendedOutputSettingsForConnection:sourceSettings:videoCodecType:fileType:isIris:outputFileURL:](self, "recommendedOutputSettingsForConnection:sourceSettings:videoCodecType:fileType:isIris:outputFileURL:", v6, 0, 0, v9, 0, 0));
    }
    else
    {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F50F48]);
    objc_msgSend(v8, "setSettingsID:", objc_msgSend(a3, "settingsID"));
    objc_msgSend(v8, "setOutputURL:", objc_msgSend(a3, "outputFileURL"));
    uint64_t v10 = *MEMORY[0x1E4F47C08];
    [v8 setOutputFileType:*MEMORY[0x1E4F47C08]];
    [(AVCaptureFileOutput *)self maxRecordedDuration];
    long long v53 = v55;
    uint64_t v54 = v56;
    [v8 setMaxDuration:&v53];
    objc_msgSend(v8, "setMaxFileSize:", -[AVCaptureFileOutput maxRecordedFileSize](self, "maxRecordedFileSize"));
    objc_msgSend(v8, "setMinFreeDiskSpaceLimit:", -[AVCaptureFileOutput minFreeDiskSpaceLimit](self, "minFreeDiskSpaceLimit"));
    [(AVCaptureMovieFileOutput *)self movieFragmentInterval];
    long long v49 = v51;
    uint64_t v50 = v52;
    [v8 setMovieFragmentInterval:&v49];
    objc_msgSend(v8, "setMovieLevelMetadata:", objc_msgSend(MEMORY[0x1E4F47DC8], "_figMetadataPropertyFromMetadataItems:", objc_msgSend(a3, "metadata")));
    [v8 setSendPreviewIOSurface:self->_internal->sendLastVideoPreviewFrame];
    [v8 setUsesVirtualCaptureCard:self->_internal->usesVirtualCaptureCard];
    uint64_t v11 = self->_internal;
    BOOL primaryConstituentDeviceSwitchingBehaviorForRecordingEnabled = v11->primaryConstituentDeviceSwitchingBehaviorForRecordingEnabled;
    if (primaryConstituentDeviceSwitchingBehaviorForRecordingEnabled)
    {
      char v47 = 0;
      __int16 v46 = 0;
      BOOL v45 = primaryConstituentDeviceSwitchingBehaviorForRecordingEnabled;
      long long v48 = *(_OWORD *)&v11->primaryConstituentDeviceSwitchingBehavior;
      [v8 setBravoCameraSelectionConfigurationForRecording:&v45];
    }
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    uint64_t v13 = (void *)[a3 connections];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v41 objects:v62 count:16];
    uint64_t v31 = v10;
    if (v14)
    {
      id obj = v13;
      char v15 = 0;
      uint64_t v16 = *(void *)v42;
      uint64_t v17 = *MEMORY[0x1E4F47C68];
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v42 != v16) {
            objc_enumerationMutation(obj);
          }
          long long v19 = *(void **)(*((void *)&v41 + 1) + 8 * i);
          if (objc_msgSend((id)objc_msgSend(v19, "mediaType"), "isEqualToString:", v17))
          {
            objc_msgSend(v8, "setVideoMirrored:", objc_msgSend(v19, "isVideoMirrored"));
            objc_msgSend(v8, "setVideoOrientation:", objc_msgSend(v19, "_videoOrientation"));
            objc_msgSend(v8, "setRecordVideoOrientationAndMirroringChanges:", -[AVCaptureMovieFileOutput recordsVideoOrientationAndMirroringChangesAsMetadataTrackForConnection:](self, "recordsVideoOrientationAndMirroringChangesAsMetadataTrackForConnection:", v19));
            if (v5)
            {
              objc_msgSend(v8, "setSpatialOverCaptureMovieURL:", objc_msgSend(v5, "spatialOverCaptureMovieFileURL"));
              objc_msgSend(v8, "setSpatialOverCaptureMovieLevelMetadata:", objc_msgSend(MEMORY[0x1E4F47DC8], "_figMetadataPropertyFromMetadataItems:", objc_msgSend(v5, "spatialOverCaptureMovieMetadata")));
              if ([v5 videoCodecType])
              {
                if ((objc_msgSend((id)objc_msgSend(v5, "videoCodecType"), "isEqual:", self->_internal->videoCodec) & 1) == 0)
                {

                  self->_internal->videoCodec = (NSString *)objc_msgSend((id)objc_msgSend(v5, "videoCodecType"), "copy");
                  self->_internal->videoCompressionProperties = 0;
                }
              }
            }
            int v20 = [v19 isDebugMetadataSidecarFileEnabled];
            if (v20)
            {
              objc_msgSend((id)objc_msgSend(v33, "delegateStorage"), "delegate");
              if (objc_opt_respondsToSelector())
              {
                LOBYTE(v20) = 1;
              }
              else
              {
                objc_msgSend((id)objc_msgSend(v33, "delegateStorage"), "delegate");
                LOBYTE(v20) = objc_opt_respondsToSelector();
              }
            }
            [v8 setDebugMetadataSidecarFileEnabled:v20 & 1];
            objc_msgSend(v8, "setVideoSettings:", -[AVCaptureMovieFileOutput outputSettingsForConnection:](self, "outputSettingsForConnection:", v19));
            id v21 = objc_msgSend((id)objc_msgSend(v19, "sourceDevice"), "activeFormat");
            if (v21)
            {
              CMFormatDescriptionGetMediaSubType((CMFormatDescriptionRef)[v21 formatDescription]);
              char v15 = FigCapturePixelFormatIs422();
            }
          }
        }
        uint64_t v14 = [obj countByEnumeratingWithState:&v41 objects:v62 count:16];
      }
      while (v14);
    }
    else
    {
      char v15 = 0;
    }
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    uint64_t v22 = (void *)[v33 connections];
    uint64_t v23 = [v22 countByEnumeratingWithState:&v37 objects:v61 count:16];
    if (v23)
    {
      uint64_t v24 = *(void *)v38;
      uint64_t v25 = *MEMORY[0x1E4F47C40];
      uint64_t v26 = v15 & 1;
      do
      {
        for (uint64_t j = 0; j != v23; ++j)
        {
          if (*(void *)v38 != v24) {
            objc_enumerationMutation(v22);
          }
          uint64_t v28 = *(void **)(*((void *)&v37 + 1) + 8 * j);
          if (objc_msgSend((id)objc_msgSend(v28, "mediaType"), "isEqualToString:", v25))
          {
            objc_msgSend(v8, "setAudioSettings:", -[AVCaptureMovieFileOutput outputSettingsForConnection:](self, "outputSettingsForConnection:", v28));
            if (objc_msgSend((id)objc_msgSend(v28, "sourceDeviceInput"), "audioCaptureMode") == 2) {
              objc_msgSend(v8, "setCinematicAudioSettings:", -[AVCaptureOutput recommendedCinematicAudioOutputSettingsForConnection:fileType:isProResCapture:](self, "recommendedCinematicAudioOutputSettingsForConnection:fileType:isProResCapture:", v28, v31, v26));
            }
          }
        }
        uint64_t v23 = [v22 countByEnumeratingWithState:&v37 objects:v61 count:16];
      }
      while (v23);
    }
    CTGreenTeaOsLogHandle = getCTGreenTeaOsLogHandle();
    uint64_t v30 = CTGreenTeaOsLogHandle;
    if (CTGreenTeaOsLogHandle && os_log_type_enabled(CTGreenTeaOsLogHandle, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A152C000, v30, OS_LOG_TYPE_INFO, "Record a video", buf, 2u);
    }
  }
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __44__AVCaptureMovieFileOutput__startRecording___block_invoke;
  v35[3] = &unk_1E5A731B8;
  v35[4] = self;
  v35[5] = v8;
  [(AVCaptureOutput *)self performFigCaptureSessionOperationSafelyUsingBlock:v35];

  objc_sync_exit(internal);
}

uint64_t __44__AVCaptureMovieFileOutput__startRecording___block_invoke(uint64_t result, uint64_t a2)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    uint64_t v3 = result;
    uint64_t v4 = [*(id *)(result + 32) sinkID];
    uint64_t v5 = *(void *)(v3 + 40);
    uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v6) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
    id v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    if (v8)
    {
      return v8(a2, v4, v5);
    }
    else
    {
      uint64_t v9 = *MEMORY[0x1E4F516D8];
      v10[0] = &unk_1EF4FA6D0;
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
      CMNotificationCenterGetDefaultLocalCenter();
      return CMNotificationCenterPostNotification();
    }
  }
  return result;
}

- (int)_stopRecording
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __42__AVCaptureMovieFileOutput__stopRecording__block_invoke;
  v3[3] = &unk_1E5A73458;
  v3[4] = self;
  [(AVCaptureOutput *)self performFigCaptureSessionOperationSafelyUsingBlock:v3];
  return 0;
}

uint64_t __42__AVCaptureMovieFileOutput__stopRecording__block_invoke(uint64_t result, uint64_t a2)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    uint64_t v3 = [*(id *)(result + 32) sinkID];
    uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v4) {
      uint64_t v5 = v4;
    }
    else {
      uint64_t v5 = 0;
    }
    uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 56);
    if (v6)
    {
      return v6(a2, v3);
    }
    else
    {
      uint64_t v7 = *MEMORY[0x1E4F516D8];
      v8[0] = &unk_1EF4FA6D0;
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
      CMNotificationCenterGetDefaultLocalCenter();
      return CMNotificationCenterPostNotification();
    }
  }
  return result;
}

- (void)handleChangedActiveFormat:(id)a3 forDevice:(id)a4
{
  [(AVCaptureMovieFileOutput *)self _updateSupportedPropertiesForSourceDevice:a4];
  v7.receiver = self;
  v7.super_class = (Class)AVCaptureMovieFileOutput;
  [(AVCaptureOutput *)&v7 handleChangedActiveFormat:a3 forDevice:a4];
}

- (void)handleVideoStabilizationModeChangedForConnection:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ([(NSArray *)[(AVCaptureOutput *)self connections] containsObject:a3])
  {
    uint64_t v5 = (void *)[a3 mediaType];
    if ([v5 isEqualToString:*MEMORY[0x1E4F47C68]])
    {
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      uint64_t v6 = (void *)[a3 inputPorts];
      uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v15;
        while (2)
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v15 != v9) {
              objc_enumerationMutation(v6);
            }
            uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
            [v11 input];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v12 = objc_msgSend((id)objc_msgSend(v11, "input"), "device");
              if (v12) {
                [(AVCaptureMovieFileOutput *)self _updateSpatialVideoCaptureSupportedForSourceDevice:v12];
              }
              goto LABEL_14;
            }
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
          if (v8) {
            continue;
          }
          break;
        }
      }
    }
  }
LABEL_14:
  v13.receiver = self;
  v13.super_class = (Class)AVCaptureMovieFileOutput;
  [(AVCaptureOutput *)&v13 handleVideoStabilizationModeChangedForConnection:a3];
}

- (void)_updateSupportedPropertiesForSourceDevice:(id)a3
{
  -[AVCaptureMovieFileOutput _updateAvailableVideoCodecTypesForSourceDevice:](self, "_updateAvailableVideoCodecTypesForSourceDevice:");
  [(AVCaptureMovieFileOutput *)self _updateBravoCameraSelectionBehaviorForSourceDevice:a3];
  [(AVCaptureMovieFileOutput *)self _updateDepthDataDeliverySupportedForSourceDevice:a3];

  [(AVCaptureMovieFileOutput *)self _updateSpatialVideoCaptureSupportedForSourceDevice:a3];
}

- (void)_updateAvailableVideoCodecTypesForSourceDevice:(id)a3
{
  uint64_t v4 = (void *)[(id)objc_opt_class() availableVideoCodecTypesForSourceDevice:a3 sourceFormat:0 outputDimensions:0 fileType:*MEMORY[0x1E4F47C08] videoCodecTypesAllowList:0];
  uint64_t v5 = v4;
  internal = self->_internal;
  if (internal->videoCodec)
  {
    char v7 = objc_msgSend(v4, "containsObject:");
    internal = self->_internal;
    if ((v7 & 1) == 0)
    {

      self->_internal->videoCodec = 0;
      internal = self->_internal;
    }
  }
  if (([v5 isEqual:internal->availableVideoCodecs] & 1) == 0)
  {
    [(AVCaptureMovieFileOutput *)self willChangeValueForKey:@"availableVideoCodecTypes"];

    self->_internal->availableVideoCodecs = (NSArray *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v5];
    [(AVCaptureMovieFileOutput *)self didChangeValueForKey:@"availableVideoCodecTypes"];
  }
}

- (void)_updateBravoCameraSelectionBehaviorForSourceDevice:(id)a3
{
  if ([a3 isVirtualDevice]) {
    BOOL v5 = (unint64_t)objc_msgSend((id)objc_msgSend(a3, "constituentDevices"), "count") > 1;
  }
  else {
    BOOL v5 = 0;
  }
  internal = self->_internal;
  if (internal->deviceSupportsConstituentDeviceSwitching != v5)
  {
    internal->deviceSupportsConstituentDeviceSwitching = v5;
    if (v5) {
      int64_t v7 = 2;
    }
    else {
      int64_t v7 = 0;
    }
    if (v5) {
      unint64_t v8 = 7;
    }
    else {
      unint64_t v8 = 0;
    }
    [(AVCaptureMovieFileOutput *)self willChangeValueForKey:@"bravoCameraSelectionBehaviorForRecording"];
    [(AVCaptureMovieFileOutput *)self willChangeValueForKey:@"primaryConstituentDeviceSwitchingBehaviorForRecordingEnabled"];
    [(AVCaptureMovieFileOutput *)self willChangeValueForKey:@"primaryConstituentDeviceSwitchingBehaviorForRecording"];
    [(AVCaptureMovieFileOutput *)self willChangeValueForKey:@"primaryConstituentDeviceRestrictedSwitchingBehaviorConditions"];
    self->_internal->BOOL primaryConstituentDeviceSwitchingBehaviorForRecordingEnabled = v5;
    self->_internal->int64_t primaryConstituentDeviceSwitchingBehavior = v7;
    self->_internal->unint64_t primaryConstituentDeviceRestrictedSwitchingBehaviorConditions = v8;
    [(AVCaptureMovieFileOutput *)self didChangeValueForKey:@"primaryConstituentDeviceRestrictedSwitchingBehaviorConditions"];
    [(AVCaptureMovieFileOutput *)self didChangeValueForKey:@"primaryConstituentDeviceSwitchingBehaviorForRecording"];
    [(AVCaptureMovieFileOutput *)self didChangeValueForKey:@"primaryConstituentDeviceSwitchingBehaviorForRecordingEnabled"];
    [(AVCaptureMovieFileOutput *)self didChangeValueForKey:@"bravoCameraSelectionBehaviorForRecording"];
  }
}

- (void)setConnectionsActive:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  BOOL v5 = [(AVCaptureOutput *)self connections];
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    uint64_t v9 = *MEMORY[0x1E4F47C48];
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v12 = [v11 mediaType];
        BOOL v13 = v3;
        if (v12 == v9) {
          BOOL v13 = self->_internal->streamingDepthSupported && v3;
        }
        [v11 _setActive:v13];
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
}

- (void)_updateDepthDataDeliverySupportedForSourceDevice:(id)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend(a3, "activeFormat"), "isStreamingDepthSupported");
  internal = self->_internal;
  if (internal->streamingDepthSupported != v4)
  {
    uint64_t v6 = v4;
    internal->streamingDepthSupported = v4;
    uint64_t v7 = *MEMORY[0x1E4F47C48];
    if ([(AVCaptureOutput *)self connectionWithMediaType:*MEMORY[0x1E4F47C48]])
    {
      uint64_t v8 = [(AVCaptureOutput *)self connectionWithMediaType:v7];
      [(AVCaptureConnection *)v8 _setActive:v6];
    }
  }
}

- (BOOL)isDepthCaptureEnabled
{
  uint64_t v2 = self;
  internal = self->_internal;
  objc_sync_enter(internal);
  LOBYTE(v2) = v2->_internal->depthCaptureEnabled;
  objc_sync_exit(internal);
  return (char)v2;
}

- (void)setDepthCaptureEnabled:(BOOL)a3
{
  internal = self->_internal;
  objc_sync_enter(internal);
  self->_internal->depthCaptureEnabled = a3;

  objc_sync_exit(internal);
}

- (void)_updateSpatialVideoCaptureSupportedForSourceDevice:(id)a3
{
  int v4 = objc_msgSend((id)objc_msgSend(a3, "activeFormat"), "isSpatialVideoCaptureSupported");
  BOOL v5 = [(AVCaptureOutput *)self connectionWithMediaType:*MEMORY[0x1E4F47C68]];
  if (v5)
  {
    unint64_t v6 = [(AVCaptureConnection *)v5 activeVideoStabilizationMode];
    if (v6 > 5 || ((1 << v6) & 0x2C) == 0) {
      int v4 = 0;
    }
  }
  internal = self->_internal;
  if (internal->spatialVideoCaptureSupported != v4)
  {
    objc_sync_enter(self->_internal);
    if (v4)
    {
      objc_sync_exit(internal);
      [(AVCaptureMovieFileOutput *)self willChangeValueForKey:@"spatialVideoCaptureSupported"];
      [(AVCaptureMovieFileOutput *)self willChangeValueForKey:@"stereoVideoCaptureSupported"];
    }
    else
    {
      BOOL spatialVideoCaptureEnabled = self->_internal->spatialVideoCaptureEnabled;
      objc_sync_exit(internal);
      [(AVCaptureMovieFileOutput *)self willChangeValueForKey:@"spatialVideoCaptureSupported"];
      [(AVCaptureMovieFileOutput *)self willChangeValueForKey:@"stereoVideoCaptureSupported"];
      if (spatialVideoCaptureEnabled)
      {
        uint64_t v10 = @"spatialVideoCaptureEnabled";
        [(AVCaptureMovieFileOutput *)self willChangeValueForKey:@"spatialVideoCaptureEnabled"];
        uint64_t v11 = @"stereoVideoCaptureEnabled";
        [(AVCaptureMovieFileOutput *)self willChangeValueForKey:@"stereoVideoCaptureEnabled"];
        [(AVCaptureMovieFileOutput *)self setSpatialVideoCaptureEnabled:0];
        uint64_t v12 = self->_internal;
        objc_sync_enter(v12);
        self->_internal->spatialVideoCaptureSupported = v4;
        objc_sync_exit(v12);
        [(AVCaptureMovieFileOutput *)self didChangeValueForKey:@"spatialVideoCaptureSupported"];
        [(AVCaptureMovieFileOutput *)self didChangeValueForKey:@"stereoVideoCaptureSupported"];
LABEL_14:
        [(AVCaptureMovieFileOutput *)self didChangeValueForKey:v10];
        [(AVCaptureMovieFileOutput *)self didChangeValueForKey:v11];
        return;
      }
    }
    BOOL v13 = self->_internal;
    objc_sync_enter(v13);
    self->_internal->spatialVideoCaptureSupported = v4;
    objc_sync_exit(v13);
    uint64_t v11 = @"stereoVideoCaptureSupported";
    uint64_t v10 = @"spatialVideoCaptureSupported";
    goto LABEL_14;
  }
}

- (BOOL)isSpatialVideoCaptureSupported
{
  uint64_t v2 = self;
  internal = self->_internal;
  objc_sync_enter(internal);
  LOBYTE(v2) = v2->_internal->spatialVideoCaptureSupported;
  objc_sync_exit(internal);
  return (char)v2;
}

- (BOOL)isSpatialVideoCaptureEnabled
{
  uint64_t v2 = self;
  internal = self->_internal;
  objc_sync_enter(internal);
  LOBYTE(v2) = v2->_internal->spatialVideoCaptureEnabled;
  objc_sync_exit(internal);
  return (char)v2;
}

- (void)setSpatialVideoCaptureEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(AVCaptureMovieFileOutput *)self isSpatialVideoCaptureSupported] || !v3)
  {
    unint64_t v6 = [(AVCaptureOutput *)self connectionWithMediaType:*MEMORY[0x1E4F47C68]];
    if (v6) {
      objc_msgSend(-[AVCaptureConnection sourceDevice](v6, "sourceDevice"), "updateVideoZoomFactorForSpatialVideoEnabled:", v3);
    }
    internal = self->_internal;
    objc_sync_enter(internal);
    uint64_t v8 = self->_internal;
    if (v8->spatialVideoCaptureEnabled != v3)
    {
      v8->BOOL spatialVideoCaptureEnabled = v3;
      [(AVCaptureOutput *)self bumpChangeSeed];
    }
    objc_sync_exit(internal);
  }
  else
  {
    BOOL v5 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v5);
    }
    NSLog(&cfstr_SuppressingExc.isa, v5);
  }
}

- (BOOL)isVirtualCaptureCardSupported
{
  internal = self->_internal;
  objc_sync_enter(internal);
  BOOL v3 = +[AVVirtualCaptureCard isVirtualCaptureCardSupported];
  objc_sync_exit(internal);
  return v3;
}

- (BOOL)usesVirtualCaptureCard
{
  uint64_t v2 = self;
  internal = self->_internal;
  objc_sync_enter(internal);
  LOBYTE(v2) = v2->_internal->usesVirtualCaptureCard;
  objc_sync_exit(internal);
  return (char)v2;
}

- (void)setUsesVirtualCaptureCard:(BOOL)a3
{
  internal = self->_internal;
  objc_sync_enter(internal);
  if ([(AVCaptureMovieFileOutput *)self isVirtualCaptureCardSupported])
  {
    self->_internal->usesVirtualCaptureCard = a3;
  }
  else
  {
    unint64_t v6 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v6);
    }
    NSLog(&cfstr_SuppressingExc.isa, v6);
  }

  objc_sync_exit(internal);
}

- (BOOL)isTrueVideoCaptureSupported
{
  return 1;
}

- (BOOL)isTrueVideoCaptureEnabled
{
  uint64_t v2 = self;
  internal = self->_internal;
  objc_sync_enter(internal);
  LOBYTE(v2) = v2->_internal->trueVideoCaptureEnabled;
  objc_sync_exit(internal);
  return (char)v2;
}

- (void)setTrueVideoCaptureEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(AVCaptureMovieFileOutput *)self isTrueVideoCaptureSupported] || !v3)
  {
    internal = self->_internal;
    objc_sync_enter(internal);
    uint64_t v7 = self->_internal;
    if (v7->trueVideoCaptureEnabled != v3)
    {
      v7->trueVideoCaptureEnabled = v3;
      [(AVCaptureOutput *)self bumpChangeSeed];
    }
    objc_sync_exit(internal);
  }
  else
  {
    BOOL v5 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v5);
    }
    NSLog(&cfstr_SuppressingExc.isa, v5);
  }
}

@end