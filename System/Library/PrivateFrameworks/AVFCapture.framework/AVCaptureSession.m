@interface AVCaptureSession
+ (BOOL)_isConfiguringProperty:(id)a3 forDevice:(id)a4;
+ (BOOL)automaticallyNotifiesObserversOfMasterClock;
+ (BOOL)automaticallyNotifiesObserversOfRunning;
+ (BOOL)automaticallyNotifiesObserversOfSynchronizationClock;
+ (id)allSessionPresets;
+ (id)dotString;
+ (void)_finishConfiguringProperty:(id)a3 forDevice:(id)a4;
+ (void)_startConfiguringProperty:(id)a3 forDevice:(id)a4;
+ (void)initialize;
- (AVCaptureSession)init;
- (AVCaptureSession)initWithAssumedIdentity:(id)a3;
- (AVCaptureSession)initWithMediaEnvironment:(id)a3;
- (AVCaptureSessionControlsDelegate)controlsDelegate;
- (AVCaptureSessionPreset)sessionPreset;
- (BOOL)_addConnection:(id)a3 exceptionReason:(id *)a4;
- (BOOL)_addInputWithNoConnections:(id)a3 exceptionReason:(id *)a4;
- (BOOL)_addOutputWithNoConnections:(id)a3 exceptionReason:(id *)a4;
- (BOOL)_addVideoPreviewLayer:(id)a3 exceptionReason:(id *)a4;
- (BOOL)_addVideoPreviewLayerWithNoConnection:(id)a3 exceptionReason:(id *)a4;
- (BOOL)_buildAndRunGraph:(BOOL)a3;
- (BOOL)_canAddConnection:(id)a3 failureReason:(id *)a4;
- (BOOL)_canAddControl:(id)a3 failureReason:(id *)a4;
- (BOOL)_canAddInput:(id)a3 failureReason:(id *)a4;
- (BOOL)_canAddOutput:(id)a3 failureReason:(id *)a4;
- (BOOL)_canAddVideoPreviewLayer:(id)a3 failureReason:(id *)a4;
- (BOOL)_getSmartStyleRenderingSupported;
- (BOOL)_sessionHasRecordingFileOutput;
- (BOOL)_shouldAutomaticallyAddConnection:(id)a3;
- (BOOL)_startFigCaptureSession;
- (BOOL)automaticallyConfiguresApplicationAudioSession;
- (BOOL)automaticallyConfiguresCaptureDeviceForWideColor;
- (BOOL)canAddConnection:(AVCaptureConnection *)connection;
- (BOOL)canAddControl:(id)a3;
- (BOOL)canAddInput:(AVCaptureInput *)input;
- (BOOL)canAddOutput:(AVCaptureOutput *)output;
- (BOOL)canSetSessionPreset:(AVCaptureSessionPreset)preset;
- (BOOL)configuresApplicationAudioSessionToMixWithOthers;
- (BOOL)continuityCameraIsWired;
- (BOOL)isBeingConfigured;
- (BOOL)isBeingConfiguredOnCurrentThread;
- (BOOL)isInterrupted;
- (BOOL)isMultitaskingCameraAccessEnabled;
- (BOOL)isMultitaskingCameraAccessSupported;
- (BOOL)isOverCost:(id *)a3;
- (BOOL)isRunning;
- (BOOL)isSystemStyleEnabled;
- (BOOL)isValidSystemStyle:(id)a3;
- (BOOL)likelyToRecordProResMovies;
- (BOOL)notifiesOnMainThread;
- (BOOL)requestNANDBandwidthToStartMovieFileRecording:(id)a3 outputFileURL:(id)a4 videoCodecType:(id)a5;
- (BOOL)smartStyleRenderingEnabled;
- (BOOL)supportsControls;
- (BOOL)suppressVideoEffects;
- (BOOL)usesApplicationAudioSession;
- (BOOL)videoHDREnabledForDevice:(id)a3 format:(id)a4 sessionPreset:(id)a5;
- (CMClockRef)synchronizationClock;
- (NSArray)connections;
- (NSArray)controls;
- (NSArray)inputs;
- (NSArray)outputs;
- (OS_dispatch_queue)controlsDelegateCallbackQueue;
- (float)_encoderCost;
- (float)_memoryCost;
- (float)_nandCost;
- (float)_nandCostWithDataRate:(int)a3;
- (float)_totalHardwareCost;
- (float)_videoAndMovieOutputCost;
- (float)hardwareCost;
- (id)_connectionsForNewInputPort:(id)a3;
- (id)_connectionsForNewOutput:(id)a3;
- (id)_connectionsForNewVideoPreviewLayer:(id)a3;
- (id)_devicesProvidingDepthData;
- (id)_figCaptureSessionConfiguration;
- (id)_initWithMediaEnvironment:(id)a3;
- (id)_livePortSetsByDeviceInput;
- (id)_outputWithClass:(Class)a3 forSourceDevice:(id)a4;
- (id)_outputsWithClass:(Class)a3 forSourceDevice:(id)a4;
- (id)_stopError;
- (id)activeSmartStyle;
- (id)description;
- (id)liveSessionConnectedVideoCaptureDevices;
- (id)mediaEnvironment;
- (id)sessionVideoCaptureDevices;
- (id)smartStyle;
- (id)systemSmartStyle;
- (id)valueForUndefinedKey:(id)a3;
- (int)_createFigCaptureSession;
- (int)_getMovieFileOutputNANDDataRate:(id)a3;
- (int)_stopFigCaptureSession;
- (int)continuityCameraClientDeviceClass;
- (int64_t)maxControlsCount;
- (int64_t)smartStyleControlMode;
- (unsigned)_computeMemoryUsageForOutputs;
- (void)_activateControlsOverlayIfNecessary;
- (void)_addFakeOutputsIfNeededForCenterStageToSessionConfiguration:(id)a3;
- (void)_beginConfiguration;
- (void)_commitConfiguration;
- (void)_determineSynchronizationClock;
- (void)_handleBackgroundBlurActiveChangedForDevice:(id)a3;
- (void)_handleBackgroundReplacementActiveChangedForDevice:(id)a3;
- (void)_handleCaptureServerConnectionDiedNotification;
- (void)_handleCenterStageActiveChangedForDevice:(id)a3;
- (void)_handleConfigurationCommittedNotificationWithPayload:(id)a3;
- (void)_handleConfigurationDidBecomeLiveNotificationWithPayload:(id)a3;
- (void)_handleDidStartRunningNotificationWithPayload:(id)a3;
- (void)_handleDidStopRunningNotificationWithPayload:(id)a3;
- (void)_handleNotification:(id)a3 payload:(id)a4;
- (void)_handleReactionEffectsActiveChangedForDevice:(id)a3;
- (void)_handleStudioLightingActiveChangedForDevice:(id)a3;
- (void)_handleVideoEffectFrameRateThrottling:(id)a3;
- (void)_invalidateControlsOverlay;
- (void)_makeConfigurationLive:(id)a3;
- (void)_notifyMediaServicesError;
- (void)_notifySessionStarted;
- (void)_notifySessionStopped;
- (void)_postRuntimeError:(id)a3;
- (void)_rebuildGraph;
- (void)_reconnectAfterServerConnectionDied;
- (void)_removeAllPreviewLayers;
- (void)_removeConnection:(id)a3;
- (void)_removeConnectionsForInputPort:(id)a3;
- (void)_removeInput:(id)a3;
- (void)_removeVideoPreviewLayer:(id)a3;
- (void)_setInterrupted:(BOOL)a3 withReason:(int)a4;
- (void)_setMultitaskingCameraAccessEnabled:(BOOL)a3;
- (void)_setRunning:(BOOL)a3;
- (void)_setSynchronizationClock:(OpaqueCMClock *)a3;
- (void)_stopAndTearDownGraph;
- (void)_teardownFigCaptureSession;
- (void)_updateCameraCalibrationDataDeliveryEnabledForAllConnectedSourceDevices;
- (void)_updateCameraCalibrationDataDeliveryEnabledForSourceDevice:(id)a3;
- (void)_updateConstantColorEnabledForAllConnectedSourceDevices;
- (void)_updateConstantColorEnabledForSourceDevice:(id)a3;
- (void)_updateControlsOverlay;
- (void)_updateDepthDataDeliveryEnabledForAllConnectedSourceDevices;
- (void)_updateDepthDataDeliveryEnabledForSourceDevice:(id)a3;
- (void)_updateDeviceActiveFormatsAndActiveConnections;
- (void)_updateHardwareCost;
- (void)_updateSmartStyleRenderingStatusWithSkipRebuildGraph:(BOOL)a3;
- (void)_updateVideoHDREnabledForDevice:(id)a3 forceResetVideoHDRSuspended:(BOOL)a4;
- (void)addConnection:(AVCaptureConnection *)connection;
- (void)addControl:(id)a3;
- (void)addInput:(AVCaptureInput *)input;
- (void)addInputWithNoConnections:(AVCaptureInput *)input;
- (void)addOutput:(AVCaptureOutput *)output;
- (void)addOutputWithNoConnections:(AVCaptureOutput *)output;
- (void)beginConfiguration;
- (void)cancelForegroundAutoResumeAfterDate:(id)a3;
- (void)commitConfiguration;
- (void)dealloc;
- (void)displaySmartStylesOptOutAlert;
- (void)handleControlsOverlay:(id)a3 didChangeActiveControl:(id)a4;
- (void)handleControlsOverlay:(id)a3 didChangeFocusLocked:(BOOL)a4;
- (void)handleControlsOverlay:(id)a3 didChangeInterfaceReduced:(BOOL)a4;
- (void)handleControlsOverlay:(id)a3 didChangeVisibility:(BOOL)a4 activeControl:(id)a5;
- (void)handleVideoInputDevice:(id)a3 activeDepthDataFormatChanged:(id)a4;
- (void)handleVideoInputDevice:(id)a3 activeFormatChanged:(id)a4;
- (void)isApplicationOptedOutByDefaultToSmartStyles;
- (void)movieFileOutputStoppedRecording:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)removeConnection:(AVCaptureConnection *)connection;
- (void)removeControl:(id)a3;
- (void)removeInput:(AVCaptureInput *)input;
- (void)removeOutput:(AVCaptureOutput *)output;
- (void)saveSystemStyleOverrideToDefaults:(id)a3;
- (void)setAutomaticallyConfiguresApplicationAudioSession:(BOOL)automaticallyConfiguresApplicationAudioSession;
- (void)setAutomaticallyConfiguresCaptureDeviceForWideColor:(BOOL)automaticallyConfiguresCaptureDeviceForWideColor;
- (void)setConfiguresApplicationAudioSessionToMixWithOthers:(BOOL)a3;
- (void)setContinuityCameraClientDeviceClass:(int)a3;
- (void)setContinuityCameraIsWired:(BOOL)a3;
- (void)setControlsDelegate:(id)a3 queue:(id)a4;
- (void)setMultitaskingCameraAccessEnabled:(BOOL)multitaskingCameraAccessEnabled;
- (void)setSessionPreset:(AVCaptureSessionPreset)sessionPreset;
- (void)setSmartStyle:(id)a3;
- (void)setSmartStyleControlMode:(int64_t)a3;
- (void)setSuppressVideoEffects:(BOOL)a3;
- (void)setSystemStyleEnabled:(BOOL)a3;
- (void)setUsesApplicationAudioSession:(BOOL)usesApplicationAudioSession;
- (void)startRunning;
- (void)stopRunning;
@end

@implementation AVCaptureSession

- (float)hardwareCost
{
  return self->_internal->hardwareCost;
}

- (void)_updateVideoHDREnabledForDevice:(id)a3 forceResetVideoHDRSuspended:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v6 = -[AVCaptureSession videoHDREnabledForDevice:format:sessionPreset:](self, "videoHDREnabledForDevice:format:sessionPreset:", a3, [a3 activeFormat], self->_internal->sessionPreset);
  [(id)objc_opt_class() _startConfiguringProperty:@"videoHDREnabled" forDevice:a3];
  [a3 _setVideoHDREnabled:v6 forceResetVideoHDRSuspended:v4];
  v7 = objc_opt_class();

  [v7 _finishConfiguringProperty:@"videoHDREnabled" forDevice:a3];
}

+ (void)_startConfiguringProperty:(id)a3 forDevice:(id)a4
{
  BOOL v6 = (void *)sCaptureDevicePropertiesBeingConfiguredByASession_ByDevice;
  objc_sync_enter((id)sCaptureDevicePropertiesBeingConfiguredByASession_ByDevice);
  v7 = (void *)[(id)sCaptureDevicePropertiesBeingConfiguredByASession_ByDevice objectForKey:a4];
  if (!v7)
  {
    v7 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
    [(id)sCaptureDevicePropertiesBeingConfiguredByASession_ByDevice setObject:v7 forKey:a4];
  }
  int v8 = objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", a3), "unsignedIntValue");
  objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", (v8 + 1)), a3);

  objc_sync_exit(v6);
}

+ (void)_finishConfiguringProperty:(id)a3 forDevice:(id)a4
{
  BOOL v6 = (void *)sCaptureDevicePropertiesBeingConfiguredByASession_ByDevice;
  objc_sync_enter((id)sCaptureDevicePropertiesBeingConfiguredByASession_ByDevice);
  v7 = (void *)[(id)sCaptureDevicePropertiesBeingConfiguredByASession_ByDevice objectForKey:a4];
  int v8 = objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", a3), "unsignedIntValue");
  if (v8)
  {
    if (v8 == 1) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = [NSNumber numberWithUnsignedInt:(v8 - 1)];
    }
    [v7 setObject:v9 forKeyedSubscript:a3];
  }
  if (![v7 count]) {
    [(id)sCaptureDevicePropertiesBeingConfiguredByASession_ByDevice removeObjectForKey:a4];
  }

  objc_sync_exit(v6);
}

- (BOOL)_buildAndRunGraph:(BOOL)a3
{
  v58[16] = *MEMORY[0x1E4F143B8];
  v5 = self;
  id v55 = 0;
  if (dword_1EB4C9260)
  {
    int v54 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  internal = self->_internal;
  objc_sync_enter(internal);
  [(AVCaptureSession *)self _updateDeviceActiveFormatsAndActiveConnections];
  [(AVCaptureSession *)self _updateDepthDataDeliveryEnabledForAllConnectedSourceDevices];
  [(AVCaptureSession *)self _updateCameraCalibrationDataDeliveryEnabledForAllConnectedSourceDevices];
  [(AVCaptureSession *)self _updateConstantColorEnabledForAllConnectedSourceDevices];
  [(AVCaptureSession *)self _updateSmartStyleRenderingStatusWithSkipRebuildGraph:1];
  if (!a3
    && ![(AVCaptureSession *)self isBeingConfigured]
    && ![(AVCaptureSession *)self isOverCost:&v55])
  {
    id v10 = [(AVCaptureSession *)self _figCaptureSessionConfiguration];
    uint64_t v17 = [v10 configurationID];
    objc_msgSend(v10, "setConfigurationID:", -[FigCaptureSessionConfiguration configurationID](self->_internal->sessionConfig, "configurationID"));
    if (dword_1EB4C9260)
    {
      int v54 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      v18 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    if (v10 && ([v10 isEqual:self->_internal->sessionConfig] & 1) == 0)
    {
      [v10 setConfigurationID:v17];
      v43 = -[AVCaptureSessionConfiguration initWithConfigurationID:inputs:outputs:videoPreviewLayers:connections:]([AVCaptureSessionConfiguration alloc], "initWithConfigurationID:inputs:outputs:videoPreviewLayers:connections:", [v10 configurationID], self->_internal->inputs, self->_internal->outputs, self->_internal->videoPreviewLayers, self->_internal->connections);
      [(NSMutableArray *)self->_internal->committedAVCaptureSessionConfigurations addObject:v43];

      int v9 = 1;
      if (self->_internal->running)
      {
LABEL_82:
        int v8 = 1;
LABEL_85:
        objc_sync_exit(internal);
        [(AVCaptureSession *)self _updateControlsOverlay];
        goto LABEL_7;
      }
    }
    else
    {
      v42 = self->_internal;
      if (v42->running)
      {
        int v9 = 0;
        int v8 = 0;
        if (!v42->sessionConfig) {
          goto LABEL_85;
        }
        goto LABEL_82;
      }
      int v9 = 0;
    }
    int v8 = 0;
    goto LABEL_85;
  }
  objc_sync_exit(internal);
  int v8 = 0;
  int v9 = 0;
  id v10 = 0;
LABEL_7:
  if ((v8 & 1) == 0 && !v9)
  {
    if (v55)
    {
      int v11 = 0;
      goto LABEL_53;
    }
    goto LABEL_56;
  }
  [(AVRunLoopCondition *)self->_internal->runLoopCondition lock];
  v12 = self->_internal;
  if (v8)
  {
    BOOL v13 = !v12->figCaptureSessionRunning;
    if (!v9) {
      goto LABEL_13;
    }
  }
  else
  {
    BOOL v13 = 0;
    if (!v9)
    {
LABEL_13:
      if (!v13) {
        goto LABEL_32;
      }
      goto LABEL_31;
    }
  }
  char v14 = v12->figCaptureSessionRunning || v13;
  v12->waitingForFigCaptureSessionConfigurationToBecomeLive = v14;
  v15 = (void *)[v10 copy];
  if (dword_1EB4C9260)
  {
    int v54 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v16 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v19 = self->_internal;
  objc_sync_enter(v19);
  figCaptureSession = self->_internal->figCaptureSession;
  if (figCaptureSession)
  {
    uint64_t v21 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v21) {
      uint64_t v22 = v21;
    }
    else {
      uint64_t v22 = 0;
    }
    v23 = *(void (**)(OpaqueFigCaptureSession *, void *))(v22 + 24);
    if (v23)
    {
      v23(figCaptureSession, v15);
    }
    else
    {
      uint64_t v57 = *MEMORY[0x1E4F516D8];
      v58[0] = &unk_1EF4FA760;
      objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v58, &v57, 1, v46, v48);
      CMNotificationCenterGetDefaultLocalCenter();
      CMNotificationCenterPostNotification();
    }
  }

  self->_internal->sessionConfig = (FigCaptureSessionConfiguration *)v10;
  objc_sync_exit(v19);

  v12 = self->_internal;
  if (v13)
  {
LABEL_31:
    v12->waitingForFigCaptureSessionToStart = 1;
    [(AVCaptureSession *)self _startFigCaptureSession];
    v12 = self->_internal;
  }
LABEL_32:
  if (v12->waitingForFigCaptureSessionConfigurationToBecomeLive || v12->waitingForFigCaptureSessionToStart)
  {
    unint64_t add_explicit = atomic_fetch_add_explicit(&v12->graphRebuildSignalCount, 1uLL, memory_order_relaxed);
    [(AVRunLoopCondition *)self->_internal->runLoopCondition signal];
    runLoopCondition = self->_internal->runLoopCondition;
    uint64_t v26 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:9.0];
    int v27 = [(AVRunLoopCondition *)runLoopCondition waitUntilDate:v26 inMode:*MEMORY[0x1E4F20260]];
    v12 = self->_internal;
    BOOL v28 = v12->waitingForFigCaptureSessionConfigurationToBecomeLive || v12->waitingForFigCaptureSessionToStart;
    char v29 = v27 & v28;
    if (v12->graphRebuildSignalCount == add_explicit + 1) {
      char v29 = 0;
    }
    if (!v27)
    {
      int v11 = -11819;
LABEL_47:
      char v31 = 1;
      if (v29) {
        goto LABEL_52;
      }
      goto LABEL_51;
    }
    if (v12->figCaptureSessionRunning || (v12->interrupted ? (char v30 = 1) : (char v30 = v29), (v30 & 1) != 0))
    {
      int v11 = 0;
      goto LABEL_47;
    }
    char v31 = 0;
    int v11 = 0;
    v12->figCaptureSessionStarted = 0;
    v12 = self->_internal;
  }
  else
  {
    int v11 = 0;
    char v31 = 1;
  }
LABEL_51:
  v12->waitingForFigCaptureSessionConfigurationToBecomeLive = 0;
  self->_internal->waitingForFigCaptureSessionToStart = 0;
LABEL_52:
  [(AVRunLoopCondition *)self->_internal->runLoopCondition unlock];
  if (v55)
  {
LABEL_53:

    self->_internal->uint64_t stopError = (NSError *)v55;
    if (dword_1EB4C9260)
    {
      int v54 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      v32 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    goto LABEL_70;
  }
  if ((v31 & 1) == 0)
  {
LABEL_70:
    [(AVCaptureSession *)self _stopAndTearDownGraph];
    uint64_t stopError = (uint64_t)self->_internal->stopError;
    if (v11 || stopError)
    {
      if (!stopError) {
        uint64_t stopError = AVLocalizedErrorWithUnderlyingOSStatus();
      }
      [(AVCaptureSession *)self _postRuntimeError:stopError];
    }
    BOOL v41 = 0;
    goto LABEL_89;
  }
LABEL_56:
  if ([(AVCaptureSession *)self isRunning])
  {
    if (!+[AVCaptureDevice haveShownGesturesDefaultDisabledNotification])
    {
      v33 = AVCaptureClientPreferencesDomain();
      uint64_t v34 = AVControlCenterVideoEffectsGesturesEnabledPreferenceKey(v33);
      if (!+[AVCaptureDevice reactionEffectGesturesEnabledDefault](AVCaptureDevice, "reactionEffectGesturesEnabledDefault")&& !+[AVCaptureProprietaryDefaultsSingleton objectForKey:v34])
      {
        long long v51 = 0u;
        long long v52 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        inputs = self->_internal->inputs;
        uint64_t v36 = [(NSMutableArray *)inputs countByEnumeratingWithState:&v49 objects:v56 count:16];
        if (v36)
        {
          uint64_t v37 = *(void *)v50;
          while (2)
          {
            for (uint64_t i = 0; i != v36; ++i)
            {
              if (*(void *)v50 != v37) {
                objc_enumerationMutation(inputs);
              }
              v39 = *(void **)(*((void *)&v49 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0
                && (objc_msgSend((id)objc_msgSend(v39, "device"), "canPerformReactionEffects") & 1) != 0)
              {
                +[AVCaptureDevice requestGesturesDefaultDisabledNotification];
                goto LABEL_87;
              }
            }
            uint64_t v36 = [(NSMutableArray *)inputs countByEnumeratingWithState:&v49 objects:v56 count:16];
            if (v36) {
              continue;
            }
            break;
          }
        }
      }
    }
LABEL_87:
    [(AVCaptureSession *)self _activateControlsOverlayIfNecessary];
  }
  BOOL v41 = 1;
LABEL_89:

  return v41;
}

- (BOOL)isBeingConfigured
{
  return self->_internal->beginConfigRefCount > 0;
}

- (BOOL)isRunning
{
  return self->_internal->running;
}

- (void)_updateSmartStyleRenderingStatusWithSkipRebuildGraph:(BOOL)a3
{
  internal = self->_internal;
  objc_sync_enter(internal);
  self->_internal->smartStyleRenderingSupported = [(AVCaptureSession *)self _getSmartStyleRenderingSupported];
  BOOL v6 = self->_internal;
  if (v6->running && v6->smartStyleRenderingOptedOutDefault)
  {
    [(AVCaptureSession *)self displaySmartStylesOptOutAlert];
    BOOL v6 = self->_internal;
  }
  int v7 = v6->smartStyleRenderingSupported && !v6->smartStyleRenderingOptedOut;
  int smartStyleRenderingEnabled = v6->smartStyleRenderingEnabled;
  v6->int smartStyleRenderingEnabled = v7;
  objc_sync_exit(internal);
  if (smartStyleRenderingEnabled != v7 && !a3)
  {
    [(AVCaptureSession *)self _rebuildGraph];
  }
}

- (void)_updateDepthDataDeliveryEnabledForAllConnectedSourceDevices
{
}

- (void)_updateConstantColorEnabledForSourceDevice:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  obuint64_t j = self->_internal;
  objc_sync_enter(obj);
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:517 valueOptions:0 capacity:2];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  inputs = self->_internal->inputs;
  uint64_t v7 = [(NSMutableArray *)inputs countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v35;
    uint64_t v9 = MEMORY[0x1E4F1CC28];
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v35 != v8) {
          objc_enumerationMutation(inputs);
        }
        int v11 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          objc_msgSend(v5, "setObject:forKey:", v9, objc_msgSend(v11, "device"));
        }
      }
      uint64_t v7 = [(NSMutableArray *)inputs countByEnumeratingWithState:&v34 objects:v40 count:16];
    }
    while (v7);
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  connections = self->_internal->connections;
  uint64_t v13 = [(NSMutableArray *)connections countByEnumeratingWithState:&v30 objects:v39 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v31;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v31 != v14) {
          objc_enumerationMutation(connections);
        }
        v16 = *(void **)(*((void *)&v30 + 1) + 8 * j);
        id v17 = (id)[v16 sourceDevice];
        v18 = v17;
        if ((!a3 || v17 == a3) && (objc_msgSend((id)objc_msgSend(v5, "objectForKey:", v17), "BOOLValue") & 1) == 0)
        {
          if ([v16 output]) {
            uint64_t v19 = [v16 output];
          }
          else {
            uint64_t v19 = [v16 videoPreviewLayer];
          }
          v20 = (void *)v19;
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            uint64_t v21 = [v20 isConstantColorEnabled];
          }
          else {
            uint64_t v21 = 0;
          }
          objc_msgSend(v5, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", v21), v18);
        }
      }
      uint64_t v13 = [(NSMutableArray *)connections countByEnumeratingWithState:&v30 objects:v39 count:16];
    }
    while (v13);
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v22 = [v5 countByEnumeratingWithState:&v26 objects:v38 count:16];
  if (v22)
  {
    uint64_t v23 = *(void *)v27;
    do
    {
      for (uint64_t k = 0; k != v22; ++k)
      {
        if (*(void *)v27 != v23) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * k), "_setConstantColorEnabled:", objc_msgSend((id)objc_msgSend(v5, "objectForKey:", *(void *)(*((void *)&v26 + 1) + 8 * k)), "BOOLValue"));
      }
      uint64_t v22 = [v5 countByEnumeratingWithState:&v26 objects:v38 count:16];
    }
    while (v22);
  }

  objc_sync_exit(obj);
}

- (void)_updateConstantColorEnabledForAllConnectedSourceDevices
{
}

- (void)_updateCameraCalibrationDataDeliveryEnabledForSourceDevice:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  obuint64_t j = self->_internal;
  objc_sync_enter(obj);
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:517 valueOptions:0 capacity:2];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  inputs = self->_internal->inputs;
  uint64_t v7 = [(NSMutableArray *)inputs countByEnumeratingWithState:&v31 objects:v37 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v32;
    uint64_t v9 = MEMORY[0x1E4F1CC28];
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v32 != v8) {
          objc_enumerationMutation(inputs);
        }
        int v11 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          objc_msgSend(v5, "setObject:forKey:", v9, objc_msgSend(v11, "device"));
        }
      }
      uint64_t v7 = [(NSMutableArray *)inputs countByEnumeratingWithState:&v31 objects:v37 count:16];
    }
    while (v7);
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  connections = self->_internal->connections;
  uint64_t v13 = [(NSMutableArray *)connections countByEnumeratingWithState:&v27 objects:v36 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v28;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v28 != v14) {
          objc_enumerationMutation(connections);
        }
        v16 = *(void **)(*((void *)&v27 + 1) + 8 * j);
        id v17 = (id)[v16 sourceDevice];
        v18 = v17;
        if ((!a3 || v17 == a3) && (objc_msgSend((id)objc_msgSend(v5, "objectForKey:", v17), "BOOLValue") & 1) == 0)
        {
          [v16 output];
          objc_opt_class();
          objc_msgSend(v5, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", objc_opt_isKindOfClass() & 1), v18);
        }
      }
      uint64_t v13 = [(NSMutableArray *)connections countByEnumeratingWithState:&v27 objects:v36 count:16];
    }
    while (v13);
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v19 = [v5 countByEnumeratingWithState:&v23 objects:v35 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v24;
    do
    {
      for (uint64_t k = 0; k != v19; ++k)
      {
        if (*(void *)v24 != v20) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * k), "_setCameraCalibrationDataDeliveryEnabled:", objc_msgSend((id)objc_msgSend(v5, "objectForKey:", *(void *)(*((void *)&v23 + 1) + 8 * k)), "BOOLValue"));
      }
      uint64_t v19 = [v5 countByEnumeratingWithState:&v23 objects:v35 count:16];
    }
    while (v19);
  }

  objc_sync_exit(obj);
}

- (void)_updateCameraCalibrationDataDeliveryEnabledForAllConnectedSourceDevices
{
}

- (BOOL)videoHDREnabledForDevice:(id)a3 format:(id)a4 sessionPreset:(id)a5
{
  if ([a3 automaticallyAdjustsVideoHDREnabled])
  {
    if (!AVCaptureColorSpaceIsHDR([a3 activeColorSpace]))
    {
      return [a4 prefersVideoHDREnabledForSessionPreset:a5];
    }
    return 0;
  }
  if (![a4 isVideoHDRSupported]) {
    return 0;
  }

  return [a3 isVideoHDREnabled];
}

- (void)_determineSynchronizationClock
{
  v2 = self;
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  internal = self->_internal;
  objc_sync_enter(internal);
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  obuint64_t j = v2->_internal->connections;
  uint64_t v3 = [(NSMutableArray *)obj countByEnumeratingWithState:&v38 objects:v45 count:16];
  if (!v3) {
    goto LABEL_20;
  }
  long long v23 = v2;
  uint64_t v4 = 0;
  uint64_t v5 = *(void *)v39;
  uint64_t v6 = *MEMORY[0x1E4F47C40];
  do
  {
    for (uint64_t i = 0; i != v3; ++i)
    {
      if (*(void *)v39 != v5) {
        objc_enumerationMutation(obj);
      }
      uint64_t v8 = *(void **)(*((void *)&v38 + 1) + 8 * i);
      if (([v8 isTrulyDisabled] & 1) == 0)
      {
        long long v36 = 0u;
        long long v37 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        uint64_t v9 = (void *)[v8 inputPorts];
        uint64_t v10 = [v9 countByEnumeratingWithState:&v34 objects:v44 count:16];
        if (v10)
        {
          uint64_t v11 = *(void *)v35;
          while (2)
          {
            for (uint64_t j = 0; j != v10; ++j)
            {
              if (*(void *)v35 != v11) {
                objc_enumerationMutation(v9);
              }
              uint64_t v13 = *(void **)(*((void *)&v34 + 1) + 8 * j);
              if (objc_msgSend((id)objc_msgSend(v13, "mediaType"), "isEqualToString:", v6))
              {
                uint64_t v4 = objc_msgSend((id)objc_msgSend(v13, "input"), "clock");
                goto LABEL_17;
              }
            }
            uint64_t v10 = [v9 countByEnumeratingWithState:&v34 objects:v44 count:16];
            if (v10) {
              continue;
            }
            break;
          }
        }
      }
LABEL_17:
      ;
    }
    uint64_t v3 = [(NSMutableArray *)obj countByEnumeratingWithState:&v38 objects:v45 count:16];
  }
  while (v3);
  v2 = v23;
  if (!v4)
  {
LABEL_20:
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    connections = v2->_internal->connections;
    uint64_t v4 = 0;
    uint64_t v15 = [(NSMutableArray *)connections countByEnumeratingWithState:&v30 objects:v43 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v31;
      do
      {
        for (uint64_t k = 0; k != v15; ++k)
        {
          if (*(void *)v31 != v16) {
            objc_enumerationMutation(connections);
          }
          v18 = *(void **)(*((void *)&v30 + 1) + 8 * k);
          if ([v18 isActive])
          {
            if (([v18 isTrulyDisabled] & 1) == 0)
            {
              long long v28 = 0u;
              long long v29 = 0u;
              long long v26 = 0u;
              long long v27 = 0u;
              uint64_t v19 = (void *)[v18 inputPorts];
              uint64_t v20 = [v19 countByEnumeratingWithState:&v26 objects:v42 count:16];
              if (v20)
              {
                uint64_t v21 = *(void *)v27;
LABEL_29:
                uint64_t v22 = 0;
                while (1)
                {
                  if (*(void *)v27 != v21) {
                    objc_enumerationMutation(v19);
                  }
                  uint64_t v4 = objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * v22), "input"), "clock");
                  if (v4) {
                    break;
                  }
                  if (v20 == ++v22)
                  {
                    uint64_t v20 = [v19 countByEnumeratingWithState:&v26 objects:v42 count:16];
                    uint64_t v4 = 0;
                    if (v20) {
                      goto LABEL_29;
                    }
                    break;
                  }
                }
              }
            }
          }
        }
        uint64_t v15 = [(NSMutableArray *)connections countByEnumeratingWithState:&v30 objects:v43 count:16];
      }
      while (v15);
    }
  }
  objc_sync_exit(internal);
  [(AVCaptureSession *)v2 _setSynchronizationClock:v4];
}

- (void)_updateHardwareCost
{
  v2 = self;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1A62348E0](self, a2);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v4 = [(AVCaptureSession *)v2 connections];
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  float v6 = 0.0;
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v14 = v2;
    int v8 = 0;
    uint64_t v9 = *(void *)v16;
    uint64_t v10 = *MEMORY[0x1E4F47C68];
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v4);
        }
        v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v12, "isActive", v14))
        {
          if (objc_msgSend((id)objc_msgSend(v12, "mediaType"), "isEqualToString:", v10))
          {
            [v12 output];
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0
              || ([v12 output], objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              if (v8 >= 1)
              {
                v2 = v14;
                [(AVCaptureSession *)v14 _totalHardwareCost];
                float v6 = v13;
                goto LABEL_16;
              }
              int v8 = 1;
            }
          }
        }
      }
      uint64_t v7 = [(NSArray *)v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
    v2 = v14;
  }
LABEL_16:
  if (v6 != v2->_internal->hardwareCost)
  {
    [(AVCaptureSession *)v2 willChangeValueForKey:@"hardwareCost"];
    v2->_internal->hardwareCost = v6;
    [(AVCaptureSession *)v2 didChangeValueForKey:@"hardwareCost"];
  }
}

- (NSArray)connections
{
  internal = self->_internal;
  objc_sync_enter(internal);
  uint64_t v4 = (NSArray *)[MEMORY[0x1E4F1C978] arrayWithArray:self->_internal->connections];
  objc_sync_exit(internal);
  return v4;
}

- (void)_setSynchronizationClock:(OpaqueCMClock *)a3
{
  internal = self->_internal;
  objc_sync_enter(internal);
  if (self->_internal->synchronizationClock != a3)
  {
    [(AVCaptureSession *)self willChangeValueForKey:@"synchronizationClock"];
    [(AVCaptureSession *)self willChangeValueForKey:@"masterClock"];
    float v6 = self->_internal;
    synchronizationClocuint64_t k = v6->synchronizationClock;
    v6->synchronizationClocuint64_t k = a3;
    if (a3) {
      CFRetain(a3);
    }
    if (synchronizationClock) {
      CFRelease(synchronizationClock);
    }
    [(AVCaptureSession *)self didChangeValueForKey:@"masterClock"];
    [(AVCaptureSession *)self didChangeValueForKey:@"synchronizationClock"];
  }

  objc_sync_exit(internal);
}

- (void)_updateControlsOverlay
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  internal = self->_internal;
  objc_sync_enter(internal);
  uint64_t v4 = [(AVWeakReference *)self->_internal->weakReferenceControlsDelegate referencedObject];
  obuint64_t j = (id)[(NSMutableArray *)self->_internal->controls copy];
  uint64_t v5 = self->_internal->controlsOverlay;
  objc_sync_exit(internal);
  if (v4)
  {
    long long v15 = v5;
    float v6 = (void *)[MEMORY[0x1E4F1CA48] array];
    id v7 = [(AVCaptureSession *)self liveSessionConnectedVideoCaptureDevices];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v8 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (!v8) {
      goto LABEL_17;
    }
    uint64_t v9 = *(void *)v21;
    while (1)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v12 = v19;
          v19[0] = MEMORY[0x1E4F143A8];
          v19[1] = 3221225472;
          float v13 = __42__AVCaptureSession__updateControlsOverlay__block_invoke;
          goto LABEL_13;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v12 = v18;
          v18[0] = MEMORY[0x1E4F143A8];
          v18[1] = 3221225472;
          float v13 = __42__AVCaptureSession__updateControlsOverlay__block_invoke_2;
          goto LABEL_13;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v12 = v17;
          v17[0] = MEMORY[0x1E4F143A8];
          v17[1] = 3221225472;
          float v13 = __42__AVCaptureSession__updateControlsOverlay__block_invoke_3;
LABEL_13:
          v12[2] = v13;
          v12[3] = &unk_1E5A79D20;
          v12[4] = v11;
          if (objc_msgSend(v7, "indexOfObjectPassingTest:") == 0x7FFFFFFFFFFFFFFFLL) {
            continue;
          }
        }
        [v6 addObject:v11];
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (!v8)
      {
LABEL_17:
        [(AVCaptureControlsOverlay *)v15 updateControls:v6];
        return;
      }
    }
  }
  if ([obj count])
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

- (void)_activateControlsOverlayIfNecessary
{
  id v3 = [(AVCaptureSession *)self sessionVideoCaptureDevices];
  internal = self->_internal;
  objc_sync_enter(internal);
  uint64_t v5 = self->_internal;
  if (v5->running && -[NSMutableArray count](v5->controls, "count") && [v3 count]) {
    [(AVCaptureControlsOverlay *)self->_internal->controlsOverlay activate];
  }

  objc_sync_exit(internal);
}

- (void)_updateDeviceActiveFormatsAndActiveConnections
{
  uint64_t v170 = *MEMORY[0x1E4F143B8];
  obuint64_t j = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
  long long v155 = 0u;
  long long v156 = 0u;
  long long v157 = 0u;
  long long v158 = 0u;
  inputs = self->_internal->inputs;
  uint64_t v4 = [(NSMutableArray *)inputs countByEnumeratingWithState:&v155 objects:v169 count:16];
  uint64_t v5 = (uint64_t *)MEMORY[0x1E4F47C68];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v156;
    uint64_t v8 = *MEMORY[0x1E4F47C68];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v156 != v7) {
          objc_enumerationMutation(inputs);
        }
        uint64_t v10 = *(void **)(*((void *)&v155 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v11 = (void *)[v10 device];
          if ([v11 hasMediaType:v8])
          {
            if (([obj containsObject:v11] & 1) == 0) {
              [obj addObject:v11];
            }
          }
        }
      }
      uint64_t v6 = [(NSMutableArray *)inputs countByEnumeratingWithState:&v155 objects:v169 count:16];
    }
    while (v6);
  }
  self->_internal->videoInputDeviceUsed = [obj count] != 0;
  long long v151 = 0u;
  long long v152 = 0u;
  long long v153 = 0u;
  long long v154 = 0u;
  uint64_t v98 = [obj countByEnumeratingWithState:&v151 objects:v168 count:16];
  if (v98)
  {
    uint64_t v97 = *(void *)v152;
    v93 = @"AVCaptureSessionPresetInputPriority";
    CMTimeFlags v103 = *(_DWORD *)(MEMORY[0x1E4F1FA10] + 12);
    CMTimeEpoch v102 = *(void *)(MEMORY[0x1E4F1FA10] + 16);
    uint64_t v12 = *v5;
    uint64_t v95 = *MEMORY[0x1E4F47C40];
    uint64_t v94 = *MEMORY[0x1E4F47C48];
    CMTimeFlags v101 = *(_DWORD *)(MEMORY[0x1E4F1FA08] + 12);
    CMTimeEpoch v100 = *(void *)(MEMORY[0x1E4F1FA08] + 16);
    v118 = self;
    do
    {
      for (uint64_t j = 0; j != v98; uint64_t j = v60 + 1)
      {
        if (*(void *)v152 != v97) {
          objc_enumerationMutation(obj);
        }
        uint64_t v115 = j;
        uint64_t v14 = *(void **)(*((void *)&v151 + 1) + 8 * j);
        long long v147 = 0u;
        long long v148 = 0u;
        long long v149 = 0u;
        long long v150 = 0u;
        connections = self->_internal->connections;
        uint64_t v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](connections, "countByEnumeratingWithState:objects:count:", &v147, v167, 16, v93);
        if (!v16) {
          goto LABEL_46;
        }
        uint64_t v17 = v16;
        int v18 = 0;
        uint64_t MediaSubType = 0;
        uint64_t v20 = *(void *)v148;
        do
        {
          for (uint64_t k = 0; k != v17; ++k)
          {
            if (*(void *)v148 != v20) {
              objc_enumerationMutation(connections);
            }
            long long v22 = *(void **)(*((void *)&v147 + 1) + 8 * k);
            if ((void *)[v22 sourceDevice] == v14
              && objc_msgSend((id)objc_msgSend(v22, "output"), "hasRequiredOutputFormatForConnection:", v22))
            {
              unsigned int v23 = objc_msgSend((id)objc_msgSend(v22, "output"), "requiredOutputFormatForConnection:", v22);
              int v24 = FigCaptureUncompressedPixelFormatForPixelFormat();
              if (v24 <= 1111970368)
              {
                if (v24 == 875704422)
                {
                  int v25 = 2;
                }
                else
                {
                  if (v24 != 875704438) {
                    goto LABEL_35;
                  }
                  int v25 = 1;
                }
              }
              else
              {
                switch(v24)
                {
                  case 1111970369:
                    int v25 = 5;
                    break;
                  case 2016686640:
                    int v25 = 3;
                    break;
                  case 2016686642:
                    int v25 = 4;
                    break;
                  default:
LABEL_35:
                    int v25 = 0;
                    break;
                }
              }
              if (v25 <= v18)
              {
                uint64_t MediaSubType = MediaSubType;
              }
              else
              {
                int v18 = v25;
                uint64_t MediaSubType = v23;
              }
              continue;
            }
          }
          uint64_t v17 = [(NSMutableArray *)connections countByEnumeratingWithState:&v147 objects:v167 count:16];
        }
        while (v17);
        self = v118;
        if (MediaSubType) {
          goto LABEL_42;
        }
LABEL_46:
        BOOL v27 = [(NSString *)self->_internal->sessionPreset isEqualToString:@"AVCaptureSessionPresetPhoto"];
        uint64_t v26 = 875704422;
        if (!v27)
        {
          BOOL v28 = [(NSString *)self->_internal->sessionPreset isEqualToString:@"AVCaptureSessionPresetPhoto2592x1936", 875704422];
          uint64_t v26 = 875704422;
          if (!v28)
          {
            if (!-[NSString isEqualToString:](self->_internal->sessionPreset, "isEqualToString:", v93, 875704422)) {
              goto LABEL_53;
            }
            uint64_t MediaSubType = CMFormatDescriptionGetMediaSubType((CMFormatDescriptionRef)objc_msgSend((id)objc_msgSend(v14, "activeFormat"), "formatDescription"));
LABEL_42:
            if ((int)MediaSubType > 2016686639)
            {
              if (MediaSubType == 2016686640)
              {
                uint64_t v26 = MediaSubType;
              }
              else
              {
                if (MediaSubType != 2016686642) {
                  goto LABEL_53;
                }
                uint64_t v26 = 2016686642;
              }
            }
            else
            {
              uint64_t v26 = 875704422;
              if (MediaSubType != 875704422 && MediaSubType != 1111970369) {
LABEL_53:
              }
                uint64_t v26 = 875704438;
            }
          }
        }
        long long v29 = (void *)[v14 deviceFormatForSessionPreset:self->_internal->sessionPreset sourceVideoFormat:v26];
        id v30 = [(AVCaptureSession *)self _outputWithClass:objc_opt_class() forSourceDevice:v14];
        if (v30)
        {
          if (AVGestaltGetBoolAnswer(@"AVGQCaptureMFOSupportsPhotoFormats")) {
            int v31 = 1;
          }
          else {
            int v31 = [v29 isPhotoFormat] ^ 1;
          }
          unsigned int v109 = v31;
        }
        else
        {
          unsigned int v109 = 0;
        }
        id v32 = [(AVCaptureSession *)self _outputsWithClass:objc_opt_class() forSourceDevice:v14];
        uint64_t v33 = [v32 count];
        unsigned int BoolAnswer = AVGestaltGetBoolAnswer(@"AVGQCaptureMultipleVideoDataOutputsSupported");
        if (v30) {
          unsigned int v35 = BoolAnswer;
        }
        else {
          unsigned int v35 = 1;
        }
        if (v33) {
          uint64_t v36 = v35;
        }
        else {
          uint64_t v36 = 0;
        }
        id v114 = [(AVCaptureSession *)self _outputWithClass:objc_opt_class() forSourceDevice:v14];
        uint64_t v107 = [v14 activeColorSpace];
        id v113 = [(AVCaptureSession *)self _outputWithClass:objc_opt_class() forSourceDevice:v14];
        uint64_t v106 = [v14 activeColorSpace];
        id v37 = [(AVCaptureSession *)self _outputWithClass:objc_opt_class() forSourceDevice:0];
        long long v38 = v37;
        unsigned int v39 = v37 != 0;
        if (v30 && v37) {
          unsigned int v39 = AVGestaltGetBoolAnswer(@"AVGQCaptureSimultaneousADOMFOVDOOutputsSupported");
        }
        if ((AVGestaltGetBoolAnswer(@"AVGQCaptureADOSupportsAudioCaptureWithPhotoFormats") & 1) == 0) {
          v39 &= [v29 isPhotoFormat] ^ 1;
        }
        v112 = v38;
        unsigned int v116 = v39;
        if (v38)
        {
          long long v145 = 0u;
          long long v146 = 0u;
          long long v143 = 0u;
          long long v144 = 0u;
          long long v40 = (void *)[v38 connections];
          uint64_t v41 = [v40 countByEnumeratingWithState:&v143 objects:v166 count:16];
          if (v41)
          {
            uint64_t v42 = v41;
            uint64_t v43 = *(void *)v144;
            while (2)
            {
              for (uint64_t m = 0; m != v42; ++m)
              {
                if (*(void *)v144 != v43) {
                  objc_enumerationMutation(v40);
                }
                if (objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v143 + 1) + 8 * m), "sourceDeviceInput"), "multichannelAudioMode") == 2)
                {
                  unsigned int v116 = 0;
                  goto LABEL_83;
                }
              }
              uint64_t v42 = [v40 countByEnumeratingWithState:&v143 objects:v166 count:16];
              if (v42) {
                continue;
              }
              break;
            }
          }
        }
LABEL_83:
        self = v118;
        id v111 = [(AVCaptureSession *)v118 _outputWithClass:objc_opt_class() forSourceDevice:v14];
        id v117 = v30;
        if (v111
          && (([v29 isStreamingDisparitySupported] & 1) != 0
           || [v29 isStreamingDepthSupported]))
        {
          if (CMVideoFormatDescriptionGetDimensions((CMVideoFormatDescriptionRef)[v29 formatDescription]).width >= 2561
            && [v14 _isBravoVariant])
          {
            long long v141 = 0u;
            long long v142 = 0u;
            long long v139 = 0u;
            long long v140 = 0u;
            uint64_t v45 = [v32 countByEnumeratingWithState:&v139 objects:v165 count:16];
            if (v45)
            {
              uint64_t v46 = v45;
              uint64_t v47 = *(void *)v140;
              int v48 = 1;
              do
              {
                for (uint64_t n = 0; n != v46; ++n)
                {
                  if (*(void *)v140 != v47) {
                    objc_enumerationMutation(v32);
                  }
                  v48 &= [*(id *)(*((void *)&v139 + 1) + 8 * n) deliversPreviewSizedOutputBuffers];
                }
                uint64_t v46 = [v32 countByEnumeratingWithState:&v139 objects:v165 count:16];
              }
              while (v46);
            }
            else
            {
              int v48 = 1;
            }
            if (v109)
            {
              int v83 = [(NSString *)v118->_internal->sessionPreset isEqual:@"AVCaptureSessionPresetPhoto"];
              if (v48) {
                int v48 = v83;
              }
              else {
                int v48 = 0;
              }
            }
          }
          else
          {
            int v48 = 1;
          }
          BOOL v108 = v48 != 0;
        }
        else
        {
          BOOL v108 = 0;
        }
        id v110 = [(AVCaptureSession *)v118 _outputWithClass:objc_opt_class() forSourceDevice:v14];
        if (v110) {
          unsigned int v105 = [v14 isGeometricDistortionCorrectionEnabled] ^ 1;
        }
        else {
          unsigned int v105 = 0;
        }
        uint64_t v50 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v29, "supportedColorSpaces"), "firstObject"), "integerValue");
        if (v118->_internal->automaticallyConfiguresCaptureDeviceForWideColor)
        {
          if ([v14 isWideColorSupported])
          {
            if (([(id)objc_opt_class() _isConfiguringProperty:@"activeColorSpace" forDevice:v14] & 1) == 0)
            {
              objc_msgSend((id)objc_msgSend(v29, "figCaptureSourceVideoFormat"), "format");
              int IsTenBit = FigCapturePixelFormatIsTenBit();
              if ((IsTenBit & 1) != 0
                || [(AVCaptureSession *)v118 _outputWithClass:objc_opt_class() forSourceDevice:v14]&& ((v109 | v36) != 1|| [(NSString *)v118->_internal->sessionPreset isEqualToString:@"AVCaptureSessionPresetPhoto"]))
              {
                if (([v29 isWideColorSupported] & 1) == 0
                  && ([(NSString *)v118->_internal->sessionPreset isEqual:v93] & 1) == 0)
                {
                  long long v52 = (void *)[v14 deviceFormatForSessionPreset:v118->_internal->sessionPreset sourceVideoFormat:875704422];
                  if ([v52 isWideColorSupported]) {
                    long long v29 = v52;
                  }
                  self = v118;
                }
                int v53 = [v29 isWideColorSupported];
                uint64_t v54 = 1;
                if (IsTenBit) {
                  uint64_t v54 = 2;
                }
                if (v53) {
                  uint64_t v50 = v54;
                }
              }
            }
          }
        }
        int v55 = objc_msgSend(v29, "isEqual:", objc_msgSend(v14, "activeFormat"));
        if (v55)
        {
          if (-[NSMutableArray containsObject:](self->_internal->devicesToResetVideoZoomFactorAndMinMaxFrameDurations, "containsObject:", v14)&& [v14 lockForConfiguration:0])
          {
            long long v137 = *MEMORY[0x1E4F1F9F8];
            long long v121 = v137;
            int v56 = v55;
            uint64_t v138 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
            uint64_t v57 = v138;
            [v14 setActiveVideoMaxFrameDuration:&v137];
            long long v135 = v121;
            uint64_t v136 = v57;
            int v55 = v56;
            [v14 setActiveVideoMinFrameDuration:&v135];
            [(AVCaptureSession *)self _updateDepthDataDeliveryEnabledForSourceDevice:v14];
            [v14 _resetDefaultVideoZoomFactor];
            [(NSMutableArray *)self->_internal->devicesToResetVideoZoomFactorAndMinMaxFrameDurations removeObject:v14];
            [v14 unlockForConfiguration];
          }
        }
        else
        {
          [(id)objc_opt_class() _startConfiguringProperty:@"activeFormat" forDevice:v14];
          [(id)objc_opt_class() _startConfiguringProperty:@"activeColorSpace" forDevice:v14];
          if ([v14 lockForConfiguration:0])
          {
            objc_msgSend(v14, "_setActiveFormat:resetVideoZoomFactorAndMinMaxFrameDurations:sessionPreset:", v29, -[NSMutableArray containsObject:](self->_internal->devicesToResetVideoZoomFactorAndMinMaxFrameDurations, "containsObject:", v14), self->_internal->sessionPreset);
            [(NSMutableArray *)self->_internal->devicesToResetVideoZoomFactorAndMinMaxFrameDurations removeObject:v14];
            [v14 unlockForConfiguration];
          }
          [(id)objc_opt_class() _finishConfiguringProperty:@"activeColorSpace" forDevice:v14];
          [(id)objc_opt_class() _finishConfiguringProperty:@"activeFormat" forDevice:v14];
        }
        uint64_t v99 = v50;
        if ([v14 isActiveVideoMinFrameDurationSet]
          && ([v14 isActiveVideoMaxFrameDurationSet] & 1) != 0)
        {
          BOOL v58 = 0;
          BOOL v59 = 0;
          uint64_t v60 = v115;
          v61 = v117;
        }
        else
        {
          int v104 = v55;
          CMTimeValue value = *MEMORY[0x1E4F1FA10];
          CMTimeScale timescale = *(_DWORD *)(MEMORY[0x1E4F1FA10] + 8);
          CMTimeValue v161 = *MEMORY[0x1E4F1FA08];
          CMTimeScale v162 = *(_DWORD *)(MEMORY[0x1E4F1FA08] + 8);
          long long v131 = 0u;
          long long v132 = 0u;
          long long v133 = 0u;
          long long v134 = 0u;
          v62 = self->_internal->connections;
          uint64_t v63 = [(NSMutableArray *)v62 countByEnumeratingWithState:&v131 objects:v160 count:16];
          CMTimeFlags flags = v103;
          CMTimeFlags v122 = v101;
          CMTimeEpoch epoch = v102;
          CMTimeEpoch v120 = v100;
          if (v63)
          {
            uint64_t v65 = v63;
            uint64_t v66 = *(void *)v132;
            CMTimeFlags flags = v103;
            CMTimeFlags v122 = v101;
            CMTimeEpoch epoch = v102;
            CMTimeEpoch v120 = v100;
            do
            {
              for (iuint64_t i = 0; ii != v65; ++ii)
              {
                if (*(void *)v132 != v66) {
                  objc_enumerationMutation(v62);
                }
                v68 = *(void **)(*((void *)&v131 + 1) + 8 * ii);
                if ((void *)[v68 sourceDevice] == v14
                  && objc_msgSend((id)objc_msgSend(v68, "mediaType"), "isEqual:", v12))
                {
                  if (([v14 isActiveVideoMinFrameDurationSet] & 1) == 0)
                  {
                    if ([v68 isVideoMinFrameDurationSet])
                    {
                      memset(&v130, 0, sizeof(v130));
                      if (v68)
                      {
                        [v68 _videoMinFrameDuration];
                        if (v130.flags)
                        {
                          CMTime time1 = v130;
                          time2.CMTimeValue value = value;
                          time2.CMTimeScale timescale = timescale;
                          time2.CMTimeFlags flags = flags;
                          time2.CMTimeEpoch epoch = epoch;
                          if (CMTimeCompare(&time1, &time2) < 0)
                          {
                            CMTimeValue value = v130.value;
                            CMTimeFlags flags = v130.flags;
                            CMTimeScale timescale = v130.timescale;
                            CMTimeEpoch epoch = v130.epoch;
                          }
                        }
                      }
                    }
                  }
                  if (([v14 isActiveVideoMaxFrameDurationSet] & 1) == 0)
                  {
                    if ([v68 isVideoMaxFrameDurationSet])
                    {
                      memset(&v130, 0, sizeof(v130));
                      if (v68)
                      {
                        [v68 _videoMaxFrameDuration];
                        if (v130.flags)
                        {
                          CMTime time1 = v130;
                          time2.CMTimeValue value = v161;
                          time2.CMTimeScale timescale = v162;
                          time2.CMTimeFlags flags = v122;
                          time2.CMTimeEpoch epoch = v120;
                          if (CMTimeCompare(&time1, &time2) >= 1)
                          {
                            CMTimeValue v161 = v130.value;
                            CMTimeFlags v122 = v130.flags;
                            CMTimeScale v162 = v130.timescale;
                            CMTimeEpoch v120 = v130.epoch;
                          }
                        }
                      }
                    }
                  }
                }
              }
              uint64_t v65 = [(NSMutableArray *)v62 countByEnumeratingWithState:&v131 objects:v160 count:16];
            }
            while (v65);
          }
          int v69 = v122 & 9;
          BOOL v59 = v69 != 9;
          BOOL v58 = (flags & 5) != 5;
          if ((flags & 5) == 5 && v69 == 9)
          {
            BOOL v58 = 0;
            BOOL v59 = 0;
            v61 = v117;
            self = v118;
            uint64_t v60 = v115;
            int v55 = v104;
          }
          else
          {
            memset(&v130, 0, sizeof(v130));
            v70 = (void *)[v14 activeFormat];
            self = v118;
            if (v70) {
              [v70 lowestSupportedVideoFrameDuration];
            }
            else {
              memset(&v130, 0, sizeof(v130));
            }
            memset(&time1, 0, sizeof(time1));
            v71 = (void *)[v14 activeFormat];
            if (v71) {
              [v71 highestSupportedVideoFrameDuration];
            }
            else {
              memset(&time1, 0, sizeof(time1));
            }
            CMTimeEpoch v72 = v120;
            uint64_t v60 = v115;
            if ((flags & 5) != 5)
            {
              time2.CMTimeValue value = value;
              time2.CMTimeScale timescale = timescale;
              time2.CMTimeFlags flags = flags;
              time2.CMTimeEpoch epoch = epoch;
              CMTime v127 = v130;
              int32_t v73 = CMTimeCompare(&time2, &v127);
              CMTimeEpoch v74 = epoch;
              if (v73 < 0)
              {
                CMTimeValue value = v130.value;
                CMTimeFlags flags = v130.flags;
                CMTimeScale timescale = v130.timescale;
                CMTimeEpoch v74 = v130.epoch;
              }
              time2.CMTimeValue value = value;
              time2.CMTimeScale timescale = timescale;
              time2.CMTimeFlags flags = flags;
              time2.CMTimeEpoch epoch = v74;
              CMTime v127 = time1;
              CMTimeEpoch v75 = v74;
              int32_t v76 = CMTimeCompare(&time2, &v127);
              CMTimeEpoch v77 = v75;
              if (v76 >= 1)
              {
                CMTimeValue value = time1.value;
                CMTimeFlags flags = time1.flags;
                CMTimeScale timescale = time1.timescale;
                CMTimeEpoch v77 = time1.epoch;
              }
              time2.CMTimeValue value = value;
              time2.CMTimeScale timescale = timescale;
              time2.CMTimeFlags flags = flags;
              time2.CMTimeEpoch epoch = v77;
              [v14 _setActiveVideoMinFrameDuration:&time2];
              CMTimeEpoch v72 = v120;
              BOOL v59 = (v122 & 9) != 9;
            }
            BOOL v78 = v69 == 9;
            v61 = v117;
            int v55 = v104;
            if (!v78)
            {
              time2.CMTimeValue value = v161;
              time2.CMTimeScale timescale = v162;
              CMTimeFlags v79 = v122;
              time2.CMTimeFlags flags = v122;
              time2.CMTimeEpoch epoch = v72;
              CMTime v127 = time1;
              CMTimeEpoch v80 = v120;
              if (CMTimeCompare(&time2, &v127) >= 1)
              {
                CMTimeValue v161 = time1.value;
                CMTimeFlags v79 = time1.flags;
                CMTimeScale v162 = time1.timescale;
                CMTimeEpoch v80 = time1.epoch;
              }
              time2.CMTimeValue value = v161;
              time2.CMTimeScale timescale = v162;
              time2.CMTimeFlags flags = v79;
              time2.CMTimeEpoch epoch = v80;
              CMTime v127 = v130;
              if (CMTimeCompare(&time2, &v127) < 0)
              {
                CMTimeValue v161 = v130.value;
                CMTimeFlags v79 = v130.flags;
                CMTimeScale v162 = v130.timescale;
                CMTimeEpoch v80 = v130.epoch;
              }
              time2.CMTimeValue value = v161;
              time2.CMTimeScale timescale = v162;
              time2.CMTimeFlags flags = v79;
              time2.CMTimeEpoch epoch = v80;
              [v14 _setActiveVideoMaxFrameDuration:&time2];
              v61 = v117;
              BOOL v59 = (v122 & 9) != 9;
            }
          }
        }
        char v81 = [v14 isActiveVideoMinFrameDurationSet];
        if (!v58
          && (v81 & 1) == 0
          && ((v59 | [v14 isActiveVideoMaxFrameDurationSet]) & 1) == 0
          && ([v14 isPortraitEffectActive] & 1) == 0
          && ([v14 isStudioLightActive] & 1) == 0
          && ([v14 isBackgroundReplacementActive] & 1) == 0
          && ([v14 isCenterStageActive] & 1) == 0)
        {
          memset(&v130, 0, sizeof(v130));
          v82 = (void *)[v14 activeFormat];
          if (v82) {
            [v82 defaultActiveMinFrameDurationForSessionPreset:self->_internal->sessionPreset];
          }
          else {
            memset(&v130, 0, sizeof(v130));
          }
          memset(&time1, 0, sizeof(time1));
          v84 = (void *)[v14 activeFormat];
          if (v84) {
            [v84 defaultActiveMaxFrameDurationForSessionPreset:self->_internal->sessionPreset];
          }
          else {
            memset(&time1, 0, sizeof(time1));
          }
          if (v108)
          {
            objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v14, "activeDepthDataFormat"), "videoSupportedFrameRateRanges"), "lastObject"), "maxFrameRate");
            int v86 = (int)v85;
            CMTimeValue v87 = v130.timescale / v130.value;
            int v88 = (int)v87 <= (int)v85 ? 1 : (int)v87 / v86;
            CMTimeMake(&time2, 1, v88 * v86);
            CMTime v130 = time2;
            CMTime time2 = time1;
            CMTime v127 = v130;
            if (CMTimeCompare(&time2, &v127) < 0) {
              CMTime time1 = v130;
            }
          }
          CMTime time2 = v130;
          [v14 _setActiveVideoMinFrameDuration:&time2];
          CMTime time2 = time1;
          [v14 _setActiveVideoMaxFrameDuration:&time2];
        }
        if (self->_internal->automaticallyConfiguresCaptureDeviceForWideColor
          && [v14 isWideColorSupported]
          && [v14 lockForConfiguration:0])
        {
          if ([v14 activeColorSpace] != v99)
          {
            [(id)objc_opt_class() _startConfiguringProperty:@"activeColorSpace" forDevice:v14];
            [v14 setActiveColorSpace:v99];
            [(id)objc_opt_class() _finishConfiguringProperty:@"activeColorSpace" forDevice:v14];
          }
          [v14 unlockForConfiguration];
        }
        [(AVCaptureSession *)self _updateVideoHDREnabledForDevice:v14 forceResetVideoHDRSuspended:v55 ^ 1u];
        if (v61) {
          [v61 setConnectionsActive:v109];
        }
        long long v125 = 0u;
        long long v126 = 0u;
        long long v123 = 0u;
        long long v124 = 0u;
        uint64_t v89 = [v32 countByEnumeratingWithState:&v123 objects:v159 count:16];
        if (v89)
        {
          uint64_t v90 = v89;
          uint64_t v91 = *(void *)v124;
          do
          {
            for (juint64_t j = 0; jj != v90; ++jj)
            {
              if (*(void *)v124 != v91) {
                objc_enumerationMutation(v32);
              }
              objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v123 + 1) + 8 * jj), "connectionWithMediaType:", v12), "_setActive:", v36);
            }
            uint64_t v90 = [v32 countByEnumeratingWithState:&v123 objects:v159 count:16];
          }
          while (v90);
        }
        if (v112) {
          objc_msgSend((id)objc_msgSend(v112, "connectionWithMediaType:", v95), "_setActive:", v116);
        }
        if (v111) {
          objc_msgSend((id)objc_msgSend(v111, "connectionWithMediaType:", v94), "_setActive:", v108);
        }
        if (v110) {
          objc_msgSend((id)objc_msgSend(v110, "connectionWithMediaType:", @"cacd"), "_setActive:", v105);
        }
        if (v114) {
          objc_msgSend((id)objc_msgSend(v114, "connectionWithMediaType:", v12), "_setActive:", v107 != 3);
        }
        if (v113) {
          objc_msgSend((id)objc_msgSend(v113, "connectionWithMediaType:", v12), "_setActive:", v106 != 3);
        }
      }
      uint64_t v98 = [obj countByEnumeratingWithState:&v151 objects:v168 count:16];
    }
    while (v98);
  }
}

- (id)_outputWithClass:(Class)a3 forSourceDevice:(id)a4
{
  id v4 = [(AVCaptureSession *)self _outputsWithClass:a3 forSourceDevice:a4];

  return (id)[v4 firstObject];
}

- (id)_outputsWithClass:(Class)a3 forSourceDevice:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  obuint64_t j = self->_internal->outputs;
  uint64_t v5 = [(NSMutableArray *)obj countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  uint64_t v7 = 0;
  uint64_t v18 = *(void *)v24;
  do
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (*(void *)v24 != v18) {
        objc_enumerationMutation(obj);
      }
      uint64_t v9 = *(void **)(*((void *)&v23 + 1) + 8 * i);
      if (objc_opt_isKindOfClass())
      {
        long long v21 = 0u;
        long long v22 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        uint64_t v10 = (void *)[v9 connections];
        uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v20;
          do
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v20 != v13) {
                objc_enumerationMutation(v10);
              }
              id v15 = (id)[*(id *)(*((void *)&v19 + 1) + 8 * j) sourceDevice];
              if (!a4 || v15 == a4)
              {
                if (!v7) {
                  uint64_t v7 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
                }
                [v7 addObject:v9];
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
          }
          while (v12);
        }
      }
    }
    uint64_t v6 = [(NSMutableArray *)obj countByEnumeratingWithState:&v23 objects:v28 count:16];
  }
  while (v6);
  return v7;
}

- (BOOL)_getSmartStyleRenderingSupported
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int IsContinuityCapture = AVCaptureClientIsContinuityCapture();
    if (!IsContinuityCapture) {
      return IsContinuityCapture;
    }
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  inputs = self->_internal->inputs;
  uint64_t v5 = [(NSMutableArray *)inputs countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v26;
    uint64_t v8 = *MEMORY[0x1E4F47C68];
LABEL_5:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v26 != v7) {
        objc_enumerationMutation(inputs);
      }
      uint64_t v10 = *(void **)(*((void *)&v25 + 1) + 8 * v9);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v11 = (void *)[v10 device];
        if ([v11 hasMediaType:v8]) {
          break;
        }
      }
      if (v6 == ++v9)
      {
        uint64_t v6 = [(NSMutableArray *)inputs countByEnumeratingWithState:&v25 objects:v30 count:16];
        if (v6) {
          goto LABEL_5;
        }
        goto LABEL_12;
      }
    }
  }
  else
  {
LABEL_12:
    uint64_t v11 = 0;
  }
  int IsContinuityCapture = objc_msgSend((id)objc_msgSend(v11, "activeFormat"), "isSmartStyleRenderingSupported");
  if (!IsContinuityCapture) {
    return IsContinuityCapture;
  }
  if (!self->_internal->smartStyleInVideoModeEnabled)
  {
    int IsContinuityCapture = objc_msgSend((id)objc_msgSend(v11, "activeFormat"), "isPhotoFormat");
    if (!IsContinuityCapture) {
      return IsContinuityCapture;
    }
  }
  if ((unint64_t)([v11 imageControlMode] - 4) < 3) {
    goto LABEL_17;
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  outputs = self->_internal->outputs;
  uint64_t v13 = [(NSMutableArray *)outputs countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (!v13)
  {
    id v15 = 0;
    uint64_t v16 = 0;
    goto LABEL_39;
  }
  uint64_t v14 = v13;
  id v15 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = *(void *)v22;
  do
  {
    for (uint64_t i = 0; i != v14; ++i)
    {
      if (*(void *)v22 != v17) {
        objc_enumerationMutation(outputs);
      }
      long long v19 = *(void **)(*((void *)&v21 + 1) + 8 * i);
      if (v15)
      {
        if (!v16) {
          goto LABEL_30;
        }
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v15 = v19;
        }
        else {
          id v15 = 0;
        }
        if (!v16)
        {
LABEL_30:
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            uint64_t v16 = v19;
          }
          else {
            uint64_t v16 = 0;
          }
          if (!v16) {
            continue;
          }
        }
      }
      if (v15) {
        goto LABEL_39;
      }
    }
    uint64_t v14 = [(NSMutableArray *)outputs countByEnumeratingWithState:&v21 objects:v29 count:16];
  }
  while (v14);
LABEL_39:
  if (([v15 isSpatialVideoCaptureEnabled] & 1) == 0)
  {
    LOBYTE(IsContinuityCapture) = [v16 isSpatialPhotoCaptureEnabled] ^ 1;
    return IsContinuityCapture;
  }
LABEL_17:
  LOBYTE(IsContinuityCapture) = 0;
  return IsContinuityCapture;
}

- (void)_updateDepthDataDeliveryEnabledForSourceDevice:(id)a3
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  internal = self->_internal;
  objc_sync_enter(internal);
  obuint64_t j = (id)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:517 valueOptions:0 capacity:2];
  long long v38 = (void *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:517 valueOptions:0 capacity:2];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  connections = self->_internal->connections;
  uint64_t v5 = [(NSMutableArray *)connections countByEnumeratingWithState:&v49 objects:v55 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v50;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v50 != v6) {
          objc_enumerationMutation(connections);
        }
        uint64_t v8 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        id v9 = (id)objc_msgSend(v8, "sourceDevice", internal);
        uint64_t v10 = v9;
        if ((!a3 || v9 == a3)
          && objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "activeFormat"), "supportedDepthDataFormats"), "count")
          && ([v8 isTrulyDisabled] & 1) == 0
          && (objc_msgSend((id)objc_msgSend(obj, "objectForKey:", v10), "BOOLValue") & 1) == 0)
        {
          if ([v8 output]) {
            uint64_t v11 = [v8 output];
          }
          else {
            uint64_t v11 = [v8 videoPreviewLayer];
          }
          uint64_t v12 = (void *)v11;
          if (objc_opt_respondsToSelector())
          {
            uint64_t v13 = [v12 isDepthDataDeliveryEnabled];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v14 = [v12 isVirtualDeviceConstituentPhotoDeliveryEnabled];
LABEL_24:
              objc_msgSend(obj, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", v13), v10);
              objc_msgSend(v38, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", v14), v10);
              continue;
            }
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v14 = 0;
              uint64_t v13 = 1;
              goto LABEL_24;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0
              && (id v15 = (void *)[v12 metadataObjectTypes], objc_msgSend(v10, "activeDepthDataFormat")))
            {
              uint64_t v13 = [v15 containsObject:@"trackedFaces"];
            }
            else
            {
              uint64_t v13 = 0;
            }
          }
          uint64_t v14 = 0;
          goto LABEL_24;
        }
      }
      uint64_t v5 = [(NSMutableArray *)connections countByEnumeratingWithState:&v49 objects:v55 count:16];
    }
    while (v5);
  }
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  uint64_t v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v54, 16, internal);
  if (v16)
  {
    uint64_t v17 = *(void *)v46;
    uint64_t v18 = &AVCaptureFigVideoDeviceCenterStageEnabledChangedContext;
    uint64_t v36 = *(void *)v46;
    do
    {
      uint64_t v19 = 0;
      uint64_t v37 = v16;
      do
      {
        if (*(void *)v46 != v17) {
          objc_enumerationMutation(obj);
        }
        long long v20 = *(void **)(*((void *)&v45 + 1) + 8 * v19);
        uint64_t v21 = objc_msgSend((id)objc_msgSend(obj, "objectForKey:", v20), "BOOLValue");
        uint64_t v22 = objc_msgSend((id)objc_msgSend(v38, "objectForKey:", v20), "BOOLValue");
        if (v21
          && (id v23 = -[AVCaptureSession _outputWithClass:forSourceDevice:](self, "_outputWithClass:forSourceDevice:", objc_opt_class(), v20)) != 0&& [v23 isDepthCaptureEnabled])
        {
          long long v24 = self->_internal;
          objc_sync_enter(v24);
          long long v41 = 0u;
          long long v42 = 0u;
          long long v43 = 0u;
          long long v44 = 0u;
          videoPreviewLayers = self->_internal->videoPreviewLayers;
          uint64_t v26 = [(NSHashTable *)videoPreviewLayers countByEnumeratingWithState:&v41 objects:v53 count:16];
          if (v26)
          {
            uint64_t v27 = *(void *)v42;
            while (2)
            {
              for (uint64_t j = 0; j != v26; ++j)
              {
                if (*(void *)v42 != v27) {
                  objc_enumerationMutation(videoPreviewLayers);
                }
                uint64_t v29 = *(void **)(*((void *)&v41 + 1) + 8 * j);
                if (objc_msgSend((id)objc_msgSend(v29, "connection"), "sourceDevice") == v20
                  && [v29 isDepthDataDeliveryEnabled]
                  && ([v29 isFilterRenderingEnabled] & 1) != 0)
                {
                  uint64_t v30 = 1;
                  goto LABEL_55;
                }
              }
              uint64_t v26 = [(NSHashTable *)videoPreviewLayers countByEnumeratingWithState:&v41 objects:v53 count:16];
              if (v26) {
                continue;
              }
              break;
            }
          }
          uint64_t v30 = 0;
LABEL_55:
          objc_sync_exit(v24);
          uint64_t v17 = v36;
          uint64_t v16 = v37;
          uint64_t v18 = &AVCaptureFigVideoDeviceCenterStageEnabledChangedContext;
        }
        else
        {
          uint64_t v30 = 0;
        }
        [v20 _setCinematicVideoEnabled:v30];
        [v20 _setDepthDataDeliveryEnabled:v21];
        [v20 _setContinuousZoomWithDepthDisallowed:v22];
        int v31 = v30 | v21 & (objc_msgSend((id)objc_msgSend(v20, "activeFormat"), "isContinuousZoomWithDepthSupported") ^ 1 | v22) ^ 1;
        devicesObservingVideoZoomFactor = self->_internal->_devicesObservingVideoZoomFactor;
        if (v31)
        {
          if ([(NSMutableArray *)devicesObservingVideoZoomFactor containsObject:v20])
          {
            [v20 removeObserver:self forKeyPath:@"videoZoomFactor" context:v18[150]];
            [(NSMutableArray *)self->_internal->_devicesObservingVideoZoomFactor removeObject:v20];
          }
        }
        else if (([(NSMutableArray *)devicesObservingVideoZoomFactor containsObject:v20] & 1) == 0)
        {
          [v20 addObserver:self forKeyPath:@"videoZoomFactor" options:3 context:v18[150]];
          [(NSMutableArray *)self->_internal->_devicesObservingVideoZoomFactor addObject:v20];
        }
        ++v19;
      }
      while (v19 != v16);
      uint64_t v33 = [obj countByEnumeratingWithState:&v45 objects:v54 count:16];
      uint64_t v16 = v33;
    }
    while (v33);
  }

  objc_sync_exit(v35);
}

- (NSArray)controls
{
  internal = self->_internal;
  objc_sync_enter(internal);
  id v4 = (NSArray *)[MEMORY[0x1E4F1C978] arrayWithArray:self->_internal->controls];
  objc_sync_exit(internal);
  return v4;
}

- (BOOL)canAddOutput:(AVCaptureOutput *)output
{
  return [(AVCaptureSession *)self _canAddOutput:output failureReason:0];
}

- (BOOL)canAddInput:(AVCaptureInput *)input
{
  return [(AVCaptureSession *)self _canAddInput:input failureReason:0];
}

- (BOOL)notifiesOnMainThread
{
  return self->_internal->notifiesOnMainThread;
}

- (void)_handleNotification:(id)a3 payload:(id)a4
{
  if ([a3 isEqualToString:*MEMORY[0x1E4F517C8]])
  {
    [(AVCaptureSession *)self _handleDidStartRunningNotificationWithPayload:a4];
  }
  else if ([a3 isEqualToString:*MEMORY[0x1E4F517D0]])
  {
    [(AVCaptureSession *)self _handleDidStopRunningNotificationWithPayload:a4];
  }
  else if ([a3 isEqualToString:*MEMORY[0x1E4F517B8]])
  {
    [(AVCaptureSession *)self _handleConfigurationCommittedNotificationWithPayload:a4];
  }
  else if ([a3 isEqualToString:*MEMORY[0x1E4F517C0]])
  {
    [(AVCaptureSession *)self _handleConfigurationDidBecomeLiveNotificationWithPayload:a4];
  }
  else if ([a3 isEqualToString:*MEMORY[0x1E4F517D8]])
  {
    captureServerConnectionDiedSemaphore = self->_internal->captureServerConnectionDiedSemaphore;
    dispatch_semaphore_signal(captureServerConnectionDiedSemaphore);
  }
}

- (BOOL)_canAddInput:(id)a3 failureReason:(id *)a4
{
  v15[26] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    if ((AVCaptureSession *)[a3 session] == self)
    {
      uint64_t v11 = @"An AVCaptureInput instance may not be added more than once to a session";
    }
    else if ([a3 session])
    {
      uint64_t v11 = @"An AVCaptureInput instance may not be added to more than one session";
    }
    else
    {
      if (([a3 isMemberOfClass:objc_opt_class()] & 1) == 0
        && ([a3 isMemberOfClass:objc_opt_class()] & 1) == 0)
      {
        uint64_t v13 = NSString;
        uint64_t v14 = (objc_class *)objc_opt_class();
        uint64_t v11 = (__CFString *)[v13 stringWithFormat:@"<%@> is an unsupported AVCaptureInput type", NSStringFromClass(v14)];
        goto LABEL_22;
      }
      internal = self->_internal;
      objc_sync_enter(internal);
      if ([(NSMutableArray *)self->_internal->inputs containsObject:a3])
      {
        uint64_t v11 = @"An AVCaptureInput instance may not be added more than once to a session";
LABEL_21:
        objc_sync_exit(internal);
LABEL_22:
        if (!v11) {
          return 0;
        }
        goto LABEL_13;
      }
      if (![a3 isMemberOfClass:objc_opt_class()]
        || (inputs = self->_internal->inputs,
            v15[0] = MEMORY[0x1E4F143A8],
            v15[1] = 3221225472,
            v15[2] = __47__AVCaptureSession__canAddInput_failureReason___block_invoke,
            v15[3] = &unk_1E5A79CD0,
            v15[4] = a3,
            [(NSMutableArray *)inputs indexOfObjectPassingTest:v15] == 0x7FFFFFFFFFFFFFFFLL))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0
          || (id v9 = [(AVCaptureSession *)self sessionPreset],
              (objc_msgSend((id)objc_msgSend(a3, "device"), "supportsAVCaptureSessionPreset:", v9) & 1) != 0))
        {
          objc_sync_exit(internal);
          return 1;
        }
        uint64_t v11 = (__CFString *)[NSString stringWithFormat:@"Can't add %@ because the device does not support %@ - Use -[AVCaptureDevice supportsAVCaptureSessionPreset:]", a3, v9];
        goto LABEL_21;
      }
      objc_sync_exit(internal);
      uint64_t v11 = @"Multiple audio/video AVCaptureInputs are not currently supported";
    }
  }
  else
  {
    uint64_t v11 = @"Can't add a nil AVCaptureInput";
  }
LABEL_13:
  os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
  fig_log_call_emit_and_clean_up_after_send_and_compose();
  if (a4)
  {
    BOOL result = 0;
    *a4 = v11;
    return result;
  }
  return 0;
}

- (id)liveSessionConnectedVideoCaptureDevices
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)[MEMORY[0x1E4F1CA48] array];
  obuint64_t j = self->_internal;
  objc_sync_enter(obj);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  connections = self->_internal->connections;
  uint64_t v5 = [(NSMutableArray *)connections countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(connections);
        }
        uint64_t v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v8, "isLive", obj))
        {
          if ([v8 sourceDevice])
          {
            v11[0] = MEMORY[0x1E4F143A8];
            v11[1] = 3221225472;
            v11[2] = __59__AVCaptureSession_liveSessionConnectedVideoCaptureDevices__block_invoke;
            v11[3] = &unk_1E5A79D20;
            v11[4] = v8;
            if ([v3 indexOfObjectPassingTest:v11] == 0x7FFFFFFFFFFFFFFFLL) {
              objc_msgSend(v3, "addObject:", objc_msgSend(v8, "sourceDevice"));
            }
          }
        }
      }
      uint64_t v5 = [(NSMutableArray *)connections countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
  objc_sync_exit(obj);
  return v3;
}

- (BOOL)_canAddOutput:(id)a3 failureReason:(id *)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    if ([a3 session])
    {
      long long v13 = @"An AVCaptureOutput instance may not be added to more than one session";
    }
    else
    {
      internal = self->_internal;
      objc_sync_enter(internal);
      if ([(NSMutableArray *)self->_internal->outputs containsObject:a3])
      {
        long long v13 = @"An AVCaptureOutput instance may not be added more than once to a session";
      }
      else
      {
        id v8 = +[AVCaptureOutput allOutputSubclasses];
        outputs = self->_internal->outputs;
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __48__AVCaptureSession__canAddOutput_failureReason___block_invoke;
        v21[3] = &unk_1E5A79CF8;
        v21[4] = v8;
        v21[5] = a3;
        if ([(NSMutableArray *)outputs indexOfObjectPassingTest:v21] != 0x7FFFFFFFFFFFFFFFLL)
        {
          long long v13 = (__CFString *)[NSString stringWithFormat:@"Cannot add output %@ to capture session %@ because more than one output of the same type is unsupported", objc_msgSend(a3, "description"), -[AVCaptureSession description](self, "description")];
          FigDebugAssert3();
          objc_sync_exit(internal);
          if (!v13) {
            return 0;
          }
          goto LABEL_18;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
          || !objc_opt_class()
          || (long long v19 = 0u,
              long long v20 = 0u,
              long long v17 = 0u,
              long long v18 = 0u,
              uint64_t v10 = self->_internal->outputs,
              (uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v22 count:16]) == 0))
        {
LABEL_16:
          objc_sync_exit(internal);
          return 1;
        }
        uint64_t v12 = *(void *)v18;
        long long v13 = @"AVCapturePhotoOutput and AVCaptureStillImageOutput may not both be used in a session";
LABEL_10:
        uint64_t v14 = 0;
        while (1)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v10);
          }
          if (objc_opt_isKindOfClass()) {
            break;
          }
          if (v11 == ++v14)
          {
            uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v22 count:16];
            if (v11) {
              goto LABEL_10;
            }
            goto LABEL_16;
          }
        }
      }
      objc_sync_exit(internal);
    }
  }
  else
  {
    long long v13 = @"Can't add a nil AVCaptureOutput";
  }
LABEL_18:
  os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
  fig_log_call_emit_and_clean_up_after_send_and_compose();
  if (a4)
  {
    BOOL result = 0;
    *a4 = v13;
    return result;
  }
  return 0;
}

- (BOOL)isInterrupted
{
  return self->_internal->interrupted;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if ((void *)AVCaptureSessionInputPortChangedContext == a6
    || AVCaptureSessionConnectionChangedContext == (void)a6
    || AVCaptureSessionOutputChangedContext == (void)a6)
  {
LABEL_9:
    [(AVCaptureSession *)self _rebuildGraph];
    return;
  }
  if ((void *)AVCaptureSessionVideoInputDeviceConnectedChangedContext == a6) {
    goto LABEL_55;
  }
  if ((void *)AVCaptureSessionVideoInputDeviceActiveFormatChangedContext == a6)
  {
    [(AVCaptureSession *)self handleVideoInputDevice:a4 activeFormatChanged:a5];
    return;
  }
  if ((void *)AVCaptureSessionVideoInputDeviceActiveDepthDataFormatChangedContext == a6)
  {
    [(AVCaptureSession *)self handleVideoInputDevice:a4 activeDepthDataFormatChanged:a5];
    return;
  }
  if ((void *)AVCaptureSessionVideoInputDeviceHDREnabledChangedContext == a6)
  {
    if ([(id)objc_opt_class() _isConfiguringProperty:@"videoHDREnabled" forDevice:a4]) {
      return;
    }
LABEL_55:
    int v17 = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E4F284E0]), "BOOLValue");
    long long v18 = (void *)MEMORY[0x1E4F284C8];
    goto LABEL_56;
  }
  if ((void *)AVCaptureSessionVideoInputDeviceAutomaticallyAdjustsHDREnabledChangedContext == a6)
  {
    if (([(id)objc_opt_class() _isConfiguringProperty:@"videoHDREnabled" forDevice:a4] & 1) == 0)
    {
      int v19 = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E4F284C8]), "BOOLValue");
      if ((objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E4F284E0]), "BOOLValue") & 1) == 0)
      {
        if (v19)
        {
          [(AVCaptureSession *)self _updateVideoHDREnabledForDevice:a4 forceResetVideoHDRSuspended:1];
        }
      }
    }
    return;
  }
  if ((void *)AVCaptureSessionVideoInputDeviceActiveColorSpaceChangedContext == a6)
  {
    if ([(id)objc_opt_class() _isConfiguringProperty:@"activeColorSpace" forDevice:a4]) {
      return;
    }
    [(AVCaptureSession *)self _updateVideoHDREnabledForDevice:a4 forceResetVideoHDRSuspended:0];
    if (!objc_msgSend((id)objc_msgSend(a4, "activeFormat"), "isWideColorSupported")) {
      return;
    }
    uint64_t v20 = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E4F284E0]), "integerValue");
    if (v20 == objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E4F284C8]), "integerValue")) {
      return;
    }
    goto LABEL_9;
  }
  if ((void *)AVCaptureSessionVideoInputDeviceLowLightVideoEnabledChangedContext == a6) {
    goto LABEL_68;
  }
  if ((void *)AVCaptureSessionVideoInputDeviceGeometricDistortionCorrectionEnabledChangedContext == a6)
  {
LABEL_69:
    int v17 = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E4F284C8]), "BOOLValue");
    long long v18 = (void *)MEMORY[0x1E4F284E0];
LABEL_56:
    if (v17 == objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *v18), "BOOLValue")) {
      return;
    }
    goto LABEL_9;
  }
  if ((void *)AVCaptureSessionVideoInputDeviceVariableFrameRateVideoEnabledChangedContext == a6) {
    goto LABEL_68;
  }
  if ((void *)AVCaptureSessionVideoInputDeviceVideoStabilizationStrengthChangedContext == a6)
  {
    if ([(id)objc_opt_class() _isConfiguringProperty:@"activeFormat" forDevice:a4]) {
      return;
    }
    uint64_t v21 = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E4F284C8]), "integerValue");
    if (objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E4F284E0]), "integerValue") == v21) {
      return;
    }
    goto LABEL_9;
  }
  if ((void *)AVCaptureSessionVideoInputDeviceCenterStageActiveChangedContext == a6)
  {
    if ([(id)objc_opt_class() _isConfiguringProperty:@"activeFormat" forDevice:a4]) {
      return;
    }
    int v22 = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E4F284C8]), "BOOLValue");
    if (v22 == objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E4F284E0]), "BOOLValue"))return; {
    [(AVCaptureSession *)self _handleCenterStageActiveChangedForDevice:a4];
    }
    goto LABEL_9;
  }
  if ((void *)AVCaptureSessionVideoInputDeviceBackgroundBlurActiveChangedContext == a6)
  {
    if ([(id)objc_opt_class() _isConfiguringProperty:@"activeFormat" forDevice:a4]) {
      return;
    }
    int v23 = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E4F284C8]), "BOOLValue");
    if (v23 == objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E4F284E0]), "BOOLValue"))return; {
    [(AVCaptureSession *)self _handleBackgroundBlurActiveChangedForDevice:a4];
    }
    goto LABEL_9;
  }
  if ((void *)AVCaptureSessionConnectionActiveChangedContext == a6
    || (void *)AVCaptureSessionConnectedInputPortEnabledChangedContext == a6)
  {
    [(AVCaptureSession *)self _updateHardwareCost];
    return;
  }
  if ((void *)AVCaptureSessionVideoInputDeviceStudioLightingActiveChangedContext == a6)
  {
    if ([(id)objc_opt_class() _isConfiguringProperty:@"activeFormat" forDevice:a4]) {
      return;
    }
    int v24 = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E4F284C8]), "BOOLValue");
    if (v24 == objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E4F284E0]), "BOOLValue"))return; {
    [(AVCaptureSession *)self _handleStudioLightingActiveChangedForDevice:a4];
    }
    goto LABEL_9;
  }
  if ((void *)AVCaptureSessionVideoInputDeviceReactionEffectsActiveChangedContext == a6)
  {
    if ([(id)objc_opt_class() _isConfiguringProperty:@"activeFormat" forDevice:a4]) {
      return;
    }
    int v25 = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E4F284C8]), "BOOLValue");
    if (v25 == objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E4F284E0]), "BOOLValue"))return; {
    [(AVCaptureSession *)self _handleReactionEffectsActiveChangedForDevice:a4];
    }
    goto LABEL_9;
  }
  if ((void *)AVCaptureSessionVideoInputDeviceBackgroundReplacementActiveChangedContext == a6)
  {
    if ([(id)objc_opt_class() _isConfiguringProperty:@"activeFormat" forDevice:a4]) {
      return;
    }
    int v26 = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E4F284C8]), "BOOLValue");
    if (v26 == objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E4F284E0]), "BOOLValue"))return; {
    [(AVCaptureSession *)self _handleBackgroundReplacementActiveChangedForDevice:a4];
    }
    goto LABEL_9;
  }
  if ((void *)AVCaptureSessionVideoInputDeviceVideoZoomFactorChangedContext == a6)
  {
    if (!objc_msgSend(a4, "_isDepthDataDeliveryEnabled", a3)) {
      return;
    }
    objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E4F284C8]), "floatValue");
    float v28 = v27;
    objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E4F284E0]), "floatValue");
    if (v29 == v28) {
      return;
    }
    goto LABEL_9;
  }
  if (AVCaptureSessionVideoInputDeviceManualFramingEnabledChangedContext == a6
    || a6 == &AVCaptureSessionVideoInputDeviceManualFramingEnabledChangedContext
    || (void *)AVCaptureSessionVideoInputDeviceManualFramingPanningAngleYChangedContext == a6)
  {
    goto LABEL_69;
  }
  if ((void *)AVCaptureSessionVideoInputDeviceGazeSelectionEnabledChangedContext == a6)
  {
LABEL_68:
    if ([(id)objc_opt_class() _isConfiguringProperty:@"activeFormat" forDevice:a4]) {
      return;
    }
    goto LABEL_69;
  }
  if ((void *)AVCaptureSessionAudioInputDeviceIsBuiltInMicChangedContext == a6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && ![(AVCaptureSession *)self _sessionHasRecordingFileOutput])
    {
      internal = self->_internal;
      objc_sync_enter(internal);
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      inputs = self->_internal->inputs;
      uint64_t v13 = [(NSMutableArray *)inputs countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v13)
      {
        uint64_t v14 = *(void *)v31;
        while (2)
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v31 != v14) {
              objc_enumerationMutation(inputs);
            }
            uint64_t v16 = *(void **)(*((void *)&v30 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0
              && objc_msgSend((id)objc_msgSend(v16, "device"), "isEqual:", a4)
              && objc_msgSend(a4, "shouldAudioCaptureModeTriggerGraphRebuildOnAudioRouteChange:", objc_msgSend(v16, "audioCaptureMode")))
            {
              objc_sync_exit(internal);
              [(AVCaptureSession *)self _rebuildGraph];
              return;
            }
          }
          uint64_t v13 = [(NSMutableArray *)inputs countByEnumeratingWithState:&v30 objects:v34 count:16];
          if (v13) {
            continue;
          }
          break;
        }
      }
      objc_sync_exit(internal);
    }
  }
}

+ (BOOL)_isConfiguringProperty:(id)a3 forDevice:(id)a4
{
  uint64_t v6 = (void *)sCaptureDevicePropertiesBeingConfiguredByASession_ByDevice;
  objc_sync_enter((id)sCaptureDevicePropertiesBeingConfiguredByASession_ByDevice);
  LOBYTE(a3) = objc_msgSend((id)objc_msgSend((id)sCaptureDevicePropertiesBeingConfiguredByASession_ByDevice, "objectForKey:", a4), "objectForKeyedSubscript:", a3) != 0;
  objc_sync_exit(v6);
  return (char)a3;
}

- (BOOL)supportsControls
{
  if (!_os_feature_enabled_impl() || !_os_feature_enabled_impl()) {
    return 0;
  }

  return MGGetBoolAnswer();
}

- (BOOL)isOverCost:(id *)a3
{
  [(AVCaptureSession *)self hardwareCost];
  float v5 = v4;
  if (a3 && v4 > 1.0) {
    *a3 = (id)AVLocalizedError();
  }
  return v5 > 1.0;
}

- (void)_setMultitaskingCameraAccessEnabled:(BOOL)a3
{
  if (self->_internal->authorizedToUseCameraInMultipleForegroundAppLayout != a3)
  {
    [(AVCaptureSession *)self _beginConfiguration];
    self->_internal->authorizedToUseCameraInMultipleForegroundAppLayout = a3;
    [(AVCaptureSession *)self _commitConfiguration];
  }
}

- (void)setControlsDelegate:(id)a3 queue:(id)a4
{
  if (!a3 || a4)
  {
    internal = self->_internal;
    objc_sync_enter(internal);
    [(AVCaptureSession *)self _beginConfiguration];
    weakReferenceControlsDelegate = self->_internal->weakReferenceControlsDelegate;
    if (weakReferenceControlsDelegate)
    {

      self->_internal->weakReferenceControlsDelegate = 0;
    }
    if (a3) {
      self->_internal->weakReferenceControlsDelegate = (AVWeakReference *)[objc_alloc(MEMORY[0x1E4F47DF0]) initWithReferencedObject:a3];
    }
    uint64_t v10 = self->_internal;
    clientControlsQueue = v10->clientControlsQueue;
    if (clientControlsQueue != a4)
    {
      v10->clientControlsQueue = (OS_dispatch_queue *)a4;
      if (a4) {
        dispatch_retain((dispatch_object_t)a4);
      }
      if (clientControlsQueue) {
        dispatch_release(clientControlsQueue);
      }
    }
    [(AVCaptureSession *)self _commitConfiguration];
    objc_sync_exit(internal);
  }
  else
  {
    uint64_t v7 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v7);
    }
    NSLog(&cfstr_SuppressingExc.isa, v7);
  }
}

- (void)setSessionPreset:(AVCaptureSessionPreset)sessionPreset
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (dword_1EB4C9260)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (-[AVCaptureSession canSetSessionPreset:](self, "canSetSessionPreset:", sessionPreset, v9, v10))
  {
    internal = self->_internal;
    objc_sync_enter(internal);
    if ([(NSString *)sessionPreset isEqualToString:self->_internal->sessionPreset])
    {
      objc_sync_exit(internal);
    }
    else
    {
      [(AVCaptureSession *)self _beginConfiguration];
      id v8 = (NSString *)[(NSString *)sessionPreset copy];

      self->_internal->sessionPreset = v8;
      objc_sync_exit(internal);
      if (![(NSString *)sessionPreset isEqualToString:@"AVCaptureSessionPresetInputPriority"])[(NSMutableArray *)self->_internal->devicesToResetVideoZoomFactorAndMinMaxFrameDurations addObjectsFromArray:[(AVCaptureSession *)self sessionVideoCaptureDevices]]; {
      [(AVCaptureSession *)self _commitConfiguration];
      }
    }
  }
  else
  {
    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector(), 0, sessionPreset);
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v7);
    }
    NSLog(&cfstr_SuppressingExc.isa, v7);
  }
}

- (BOOL)canSetSessionPreset:(AVCaptureSessionPreset)preset
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  obuint64_t j = self->_internal;
  objc_sync_enter(obj);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  inputs = self->_internal->inputs;
  uint64_t v5 = [(NSMutableArray *)inputs countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(inputs);
        }
        id v8 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v19 = 0u;
          long long v20 = 0u;
          long long v17 = 0u;
          long long v18 = 0u;
          uint64_t v9 = (void *)[v8 ports];
          uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v25 count:16];
          if (v10)
          {
            uint64_t v11 = *(void *)v18;
LABEL_9:
            uint64_t v12 = 0;
            while (1)
            {
              if (*(void *)v18 != v11) {
                objc_enumerationMutation(v9);
              }
              if (objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v12), "isEnabled", obj)) {
                break;
              }
              if (v10 == ++v12)
              {
                uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v25 count:16];
                if (v10) {
                  goto LABEL_9;
                }
                goto LABEL_18;
              }
            }
            uint64_t v13 = (void *)[v8 device];
            if (v13 && ([v13 supportsAVCaptureSessionPreset:preset] & 1) == 0)
            {
              objc_sync_exit(obj);
              return 0;
            }
          }
        }
LABEL_18:
        ;
      }
      uint64_t v5 = [(NSMutableArray *)inputs countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v5);
  }
  objc_sync_exit(obj);
  return objc_msgSend(+[AVCaptureSession allSessionPresets](AVCaptureSession, "allSessionPresets"), "containsObject:", preset);
}

+ (id)allSessionPresets
{
  id result = (id)allSessionPresets_doablePresets;
  if (!allSessionPresets_doablePresets)
  {
    id result = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", @"AVCaptureSessionPresetPhoto", @"AVCaptureSessionPresetPhoto2592x1936", @"AVCaptureSessionPreset3840x2160", @"AVCaptureSessionPresetHigh", @"AVCaptureSessionPresetHigh60", @"AVCaptureSessionPresetMedium", @"AVCaptureSessionPresetLow", @"AVCaptureSessionPreset352x288", @"AVCaptureSessionPreset640x480", @"AVCaptureSessionPreset1280x720", @"AVCaptureSessionPreset1920x1080", @"AVCaptureSessionPresetiFrame960x540", @"AVCaptureSessionPresetiFrame1280x720", @"AVCaptureSessionPresetInputPriority", @"AVCaptureSessionPresetVoicemailGreeting", 0);
    allSessionPresets_doablePresets = (uint64_t)result;
  }
  return result;
}

- (void)handleVideoInputDevice:(id)a3 activeFormatChanged:(id)a4
{
  uint64_t v7 = (void *)[a4 objectForKeyedSubscript:*MEMORY[0x1E4F284E0]];
  uint64_t v8 = [a4 objectForKeyedSubscript:*MEMORY[0x1E4F284C8]];
  BOOL v9 = [(AVCaptureSession *)self videoHDREnabledForDevice:a3 format:v8 sessionPreset:@"AVCaptureSessionPresetInputPriority"];
  if ([v7 isEqual:v8]) {
    int v10 = v9 ^ [a3 isVideoHDREnabled];
  }
  else {
    int v10 = 1;
  }
  if (([(id)objc_opt_class() _isConfiguringProperty:@"activeFormat" forDevice:a3] & 1) == 0)
  {
    if (![(NSString *)self->_internal->sessionPreset isEqualToString:@"AVCaptureSessionPresetInputPriority"])
    {
      [(AVCaptureSession *)self willChangeValueForKey:@"sessionPreset"];
      internal = self->_internal;
      objc_sync_enter(internal);

      self->_internal->sessionPreset = (NSString *)[@"AVCaptureSessionPresetInputPriority" copy];
      objc_sync_exit(internal);
      [(AVCaptureSession *)self didChangeValueForKey:@"sessionPreset"];
    }
    if (v10)
    {
      [(AVCaptureSession *)self _rebuildGraph];
    }
  }
}

- (void)handleVideoInputDevice:(id)a3 activeDepthDataFormatChanged:(id)a4
{
  uint64_t v7 = (void *)[a4 objectForKeyedSubscript:*MEMORY[0x1E4F284E0]];
  char v8 = objc_msgSend(v7, "isEqual:", objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E4F284C8]));
  if (([(id)objc_opt_class() _isConfiguringProperty:@"activeFormat" forDevice:a3] & 1) == 0
    && (v8 & 1) == 0)
  {
    [(AVCaptureSession *)self _rebuildGraph];
  }
}

- (void)addInput:(AVCaptureInput *)input
{
  v33[16] = *MEMORY[0x1E4F143B8];
  if (dword_1EB4C9260)
  {
    int v30 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  [(AVCaptureSession *)self _beginConfiguration];
  internal = self->_internal;
  objc_sync_enter(internal);
  v33[0] = 0;
  if ([(AVCaptureSession *)self _addInputWithNoConnections:input exceptionReason:v33])
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v7 = [(AVCaptureInput *)input ports];
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v25 objects:v32 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v26;
      long long v20 = internal;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v26 != v9) {
            objc_enumerationMutation(v7);
          }
          id v11 = [(AVCaptureSession *)self _connectionsForNewInputPort:*(void *)(*((void *)&v25 + 1) + 8 * i)];
          long long v23 = 0u;
          long long v24 = 0u;
          long long v21 = 0u;
          long long v22 = 0u;
          uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v31 count:16];
          if (v12)
          {
            uint64_t v13 = *(void *)v22;
            while (2)
            {
              for (uint64_t j = 0; j != v12; ++j)
              {
                if (*(void *)v22 != v13) {
                  objc_enumerationMutation(v11);
                }
                if (![(AVCaptureSession *)self _addConnection:*(void *)(*((void *)&v21 + 1) + 8 * j) exceptionReason:v33])
                {
                  internal = v20;
                  long long v17 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
                  [(AVCaptureSession *)self _commitConfiguration];
                  if (AVCaptureShouldThrowForAPIViolations()) {
                    objc_exception_throw(v17);
                  }
                  NSLog(&cfstr_SuppressingExc.isa, v17);
                  goto LABEL_28;
                }
              }
              uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v31 count:16];
              if (v12) {
                continue;
              }
              break;
            }
          }
        }
        uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v25 objects:v32 count:16];
        internal = v20;
      }
      while (v8);
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v15 = (void *)[(AVCaptureInput *)input device];
      if ([v15 hasMediaType:*MEMORY[0x1E4F47C68]])
      {
        [(NSMutableArray *)self->_internal->devicesToResetVideoZoomFactorAndMinMaxFrameDurations addObject:v15];
        if ([v15 lockForConfiguration:0])
        {
          [v15 setCachesFigCaptureSourceConfigurationChanges:1];
          [v15 unlockForConfiguration];
        }
      }
    }
    objc_sync_exit(internal);
    [(AVCaptureSession *)self _commitConfiguration];
  }
  else
  {
    uint64_t v16 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    [(AVCaptureSession *)self _commitConfiguration];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v16);
    }
    NSLog(&cfstr_SuppressingExc.isa, v16);
LABEL_28:
    objc_sync_exit(internal);
  }
}

- (id)_connectionsForNewInputPort:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v6 = (void *)v5;
  if (a3)
  {
    long long v22 = (void *)v5;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    outputs = self->_internal->outputs;
    uint64_t v8 = [(NSMutableArray *)outputs countByEnumeratingWithState:&v28 objects:v34 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v29 != v10) {
            objc_enumerationMutation(outputs);
          }
          uint64_t v12 = *(void *)(*((void *)&v28 + 1) + 8 * i);
          id v33 = a3;
          uint64_t v13 = +[AVCaptureConnection connectionWithInputPorts:output:](AVCaptureConnection, "connectionWithInputPorts:output:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1], v12);
          if ([(AVCaptureSession *)self _shouldAutomaticallyAddConnection:v13]) {
            [v22 addObject:v13];
          }
        }
        uint64_t v9 = [(NSMutableArray *)outputs countByEnumeratingWithState:&v28 objects:v34 count:16];
      }
      while (v9);
    }
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    videoPreviewLayers = self->_internal->videoPreviewLayers;
    uint64_t v15 = [(NSHashTable *)videoPreviewLayers countByEnumeratingWithState:&v24 objects:v32 count:16];
    uint64_t v6 = v22;
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v25;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v25 != v17) {
            objc_enumerationMutation(videoPreviewLayers);
          }
          uint64_t v19 = *(void **)(*((void *)&v24 + 1) + 8 * j);
          uint64_t v23 = 0;
          long long v20 = +[AVCaptureConnection connectionWithInputPort:a3 videoPreviewLayer:v19];
          if ([v19 canAddConnection:v20 failureReason:&v23]) {
            [v22 addObject:v20];
          }
        }
        uint64_t v16 = [(NSHashTable *)videoPreviewLayers countByEnumeratingWithState:&v24 objects:v32 count:16];
      }
      while (v16);
    }
  }
  return v6;
}

- (id)_connectionsForNewOutput:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  obuint64_t j = [(AVCaptureSession *)self inputs];
  uint64_t v17 = [(NSArray *)obj countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v17)
  {
    uint64_t v16 = *(void *)v24;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v24 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = v6;
        uint64_t v7 = *(void **)(*((void *)&v23 + 1) + 8 * v6);
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        uint64_t v8 = (void *)[v7 ports];
        uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v28 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v20;
          do
          {
            uint64_t v12 = 0;
            do
            {
              if (*(void *)v20 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v27 = *(void *)(*((void *)&v19 + 1) + 8 * v12);
              uint64_t v13 = +[AVCaptureConnection connectionWithInputPorts:output:](AVCaptureConnection, "connectionWithInputPorts:output:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1], a3);
              if ([(AVCaptureSession *)self _shouldAutomaticallyAddConnection:v13])
              {
                [v5 addObject:v13];
              }
              ++v12;
            }
            while (v10 != v12);
            uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v28 count:16];
          }
          while (v10);
        }
        uint64_t v6 = v18 + 1;
      }
      while (v18 + 1 != v17);
      uint64_t v17 = [(NSArray *)obj countByEnumeratingWithState:&v23 objects:v29 count:16];
    }
    while (v17);
  }
  return v5;
}

- (NSArray)inputs
{
  internal = self->_internal;
  objc_sync_enter(internal);
  float v4 = (NSArray *)[MEMORY[0x1E4F1C978] arrayWithArray:self->_internal->inputs];
  objc_sync_exit(internal);
  return v4;
}

- (BOOL)_shouldAutomaticallyAddConnection:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  uint64_t v44 = 0;
  int v5 = objc_msgSend((id)objc_msgSend(a3, "output"), "canAddConnection:failureReason:", a3, &v44);
  if (v5)
  {
    uint64_t v6 = [a3 mediaType];
    if (v6 == *MEMORY[0x1E4F47C50] && AVMediaTypeMetadataObjectAndAVMediaTypeMetadataAreDefined()
      || (uint64_t v7 = [a3 mediaType], v7 == *MEMORY[0x1E4F47C48])
      && ([a3 output], objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
LABEL_6:
      LOBYTE(v5) = 0;
    }
    else
    {
      uint64_t v8 = [a3 mediaType];
      if (v8 != *MEMORY[0x1E4F47C68]) {
        goto LABEL_37;
      }
      uint64_t v9 = v8;
      [a3 output];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_37;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && (long long v42 = 0u,
            long long v43 = 0u,
            long long v40 = 0u,
            long long v41 = 0u,
            uint64_t v10 = (void *)[a3 inputPorts],
            (uint64_t v11 = [v10 countByEnumeratingWithState:&v40 objects:v47 count:16]) != 0))
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v41;
        uint64_t v26 = *(void *)v41;
        uint64_t v27 = v10;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v41 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = *(void **)(*((void *)&v40 + 1) + 8 * i);
            if (objc_msgSend((id)objc_msgSend(v15, "mediaType", v26, v27), "isEqual:", v9))
            {
              long long v38 = 0u;
              long long v39 = 0u;
              long long v36 = 0u;
              long long v37 = 0u;
              uint64_t v16 = [(AVCaptureSession *)self connections];
              uint64_t v30 = [(NSArray *)v16 countByEnumeratingWithState:&v36 objects:v46 count:16];
              if (v30)
              {
                uint64_t v31 = *(void *)v37;
                uint64_t v28 = v12;
                long long v29 = v16;
                while (2)
                {
                  for (uint64_t j = 0; j != v30; ++j)
                  {
                    if (*(void *)v37 != v31) {
                      objc_enumerationMutation(v16);
                    }
                    uint64_t v18 = *(void **)(*((void *)&v36 + 1) + 8 * j);
                    if ([v18 mediaType] == v9)
                    {
                      [v18 output];
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        long long v34 = 0u;
                        long long v35 = 0u;
                        long long v32 = 0u;
                        long long v33 = 0u;
                        long long v19 = (void *)[v18 inputPorts];
                        uint64_t v20 = [v19 countByEnumeratingWithState:&v32 objects:v45 count:16];
                        if (v20)
                        {
                          uint64_t v21 = v20;
                          uint64_t v22 = *(void *)v33;
LABEL_25:
                          uint64_t v23 = 0;
                          while (1)
                          {
                            if (*(void *)v33 != v22) {
                              objc_enumerationMutation(v19);
                            }
                            long long v24 = *(void **)(*((void *)&v32 + 1) + 8 * v23);
                            if (objc_msgSend((id)objc_msgSend(v24, "mediaType"), "isEqual:", v9))
                            {
                              if ([v24 isEqual:v15]) {
                                goto LABEL_6;
                              }
                            }
                            if (v21 == ++v23)
                            {
                              uint64_t v21 = [v19 countByEnumeratingWithState:&v32 objects:v45 count:16];
                              uint64_t v16 = v29;
                              if (v21) {
                                goto LABEL_25;
                              }
                              break;
                            }
                          }
                        }
                      }
                    }
                  }
                  uint64_t v13 = v26;
                  uint64_t v10 = v27;
                  uint64_t v12 = v28;
                  uint64_t v30 = [(NSArray *)v16 countByEnumeratingWithState:&v36 objects:v46 count:16];
                  if (v30) {
                    continue;
                  }
                  break;
                }
              }
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v40 objects:v47 count:16];
          LOBYTE(v5) = 1;
        }
        while (v12);
      }
      else
      {
LABEL_37:
        LOBYTE(v5) = 1;
      }
    }
  }
  return v5;
}

- (void)commitConfiguration
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (dword_1EB4C9260)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  [(AVCaptureSession *)self _commitConfiguration];
}

- (void)_commitConfiguration
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1A62348E0](self, a2);
  MEMORY[0x1A6234290](self->_internal->figCaptureSourceConfigChangeCacheMutex);
  internal = self->_internal;
  int beginConfigRefCount = internal->beginConfigRefCount;
  if (beginConfigRefCount < 1)
  {
    signed int v6 = internal->beginConfigRefCount;
  }
  else
  {
    signed int v6 = atomic_fetch_add_explicit(&internal->beginConfigRefCount, 0xFFFFFFFF, memory_order_relaxed) - 1;
    atomic_fetch_add_explicit(&self->_internal->graphRebuildFromCommitConfigRefCount, 1u, memory_order_relaxed);
    internal = self->_internal;
  }
  MEMORY[0x1A62342A0](internal->figCaptureSourceConfigChangeCacheMutex);
  if (dword_1EB4C9260)
  {
    int v22 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (beginConfigRefCount >= 1)
  {
    -[AVCaptureSession _buildAndRunGraph:](self, "_buildAndRunGraph:", v6 > 0, v15, v16);
    [(AVCaptureSession *)self _determineSynchronizationClock];
    MEMORY[0x1A6234290](self->_internal->figCaptureSourceConfigChangeCacheMutex);
    atomic_fetch_add_explicit(&self->_internal->graphRebuildFromCommitConfigRefCount, 0xFFFFFFFF, memory_order_relaxed);
    uint64_t v8 = self->_internal;
    if (!v8->beginConfigRefCount && !v8->graphRebuildFromCommitConfigRefCount)
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      id v9 = [(AVCaptureSession *)self sessionVideoCaptureDevices];
      uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v23 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v18;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v18 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
            if ([v14 lockForConfiguration:0])
            {
              [v14 setCachesFigCaptureSourceConfigurationChanges:0];
              [v14 unlockForConfiguration];
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v23 count:16];
        }
        while (v11);
      }
    }
    MEMORY[0x1A62342A0](self->_internal->figCaptureSourceConfigChangeCacheMutex);
  }
}

- (void)beginConfiguration
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (dword_1EB4C9260)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  [(AVCaptureSession *)self _beginConfiguration];
}

- (void)_rebuildGraph
{
  [(AVCaptureSession *)self _updateHardwareCost];
  [(AVCaptureSession *)self _beginConfiguration];

  [(AVCaptureSession *)self _commitConfiguration];
}

- (void)_beginConfiguration
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  MEMORY[0x1A6234290](self->_internal->figCaptureSourceConfigChangeCacheMutex, a2);
  if (!atomic_fetch_add_explicit(&self->_internal->beginConfigRefCount, 1u, memory_order_relaxed))
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v3 = [(AVCaptureSession *)self sessionVideoCaptureDevices];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
          if ([v8 lockForConfiguration:0])
          {
            [v8 setCachesFigCaptureSourceConfigurationChanges:1];
            [v8 unlockForConfiguration];
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v5);
    }

    self->_internal->threadWhichBeganConfiguratiouint64_t n = (NSThread *)(id)[MEMORY[0x1E4F29060] currentThread];
  }
  MEMORY[0x1A62342A0](self->_internal->figCaptureSourceConfigChangeCacheMutex);
  if (dword_1EB4C9260)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

- (id)sessionVideoCaptureDevices
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)[MEMORY[0x1E4F1CA48] array];
  internal = self->_internal;
  objc_sync_enter(internal);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  inputs = self->_internal->inputs;
  uint64_t v6 = [(NSMutableArray *)inputs countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    uint64_t v8 = *MEMORY[0x1E4F47C68];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(inputs);
        }
        long long v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v11 = (void *)[v10 device];
          if ([v11 hasMediaType:v8]) {
            [v3 addObject:v11];
          }
        }
      }
      uint64_t v6 = [(NSMutableArray *)inputs countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
  objc_sync_exit(internal);
  return v3;
}

- (void)addOutput:(AVCaptureOutput *)output
{
  v23[16] = *MEMORY[0x1E4F143B8];
  if (dword_1EB4C9260)
  {
    int v21 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  [(AVCaptureSession *)self _beginConfiguration];
  internal = self->_internal;
  objc_sync_enter(internal);
  v23[0] = 0;
  if ([(AVCaptureSession *)self _addOutputWithNoConnections:output exceptionReason:v23])
  {
    id v7 = [(AVCaptureSession *)self _connectionsForNewOutput:output];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v17;
      uint64_t v10 = *MEMORY[0x1E4F47C40];
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v7);
          }
          long long v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if ([(AVCaptureSession *)self canAddConnection:v12])
          {
            [(AVCaptureSession *)self _addConnection:v12 exceptionReason:v23];
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0
              && [v12 mediaType] == v10
              && objc_msgSend((id)objc_msgSend(v12, "sourceDeviceInput"), "multichannelAudioMode") == 2)
            {
              [v12 _setActive:0];
            }
          }
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v22 count:16];
      }
      while (v8);
    }
    objc_sync_exit(internal);
    [(AVCaptureSession *)self _commitConfiguration];
  }
  else
  {
    long long v13 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    [(AVCaptureSession *)self _commitConfiguration];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v13);
    }
    NSLog(&cfstr_SuppressingExc.isa, v13);
    objc_sync_exit(internal);
  }
}

- (BOOL)canAddConnection:(AVCaptureConnection *)connection
{
  return [(AVCaptureSession *)self _canAddConnection:connection failureReason:0];
}

- (BOOL)_addConnection:(id)a3 exceptionReason:(id *)a4
{
  id v5 = a3;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v25 = 0;
  LODWORD(v7) = [(AVCaptureSession *)self _canAddConnection:a3 failureReason:&v25];
  if (v7)
  {
    uint64_t v8 = (void *)[v5 output];
    uint64_t v9 = (void *)[v5 videoPreviewLayer];
    uint64_t v10 = v9;
    if (v8)
    {
      [v8 willChangeValueForKey:@"connections"];
    }
    else if (v9)
    {
      [v9 willChangeValueForKey:@"connection"];
    }
    obuint64_t j = self->_internal;
    objc_sync_enter(obj);
    [v5 setupObservers];
    long long v11 = v8;
    if (v8 || (long long v11 = v10) != 0) {
      id v5 = (id)[v11 addConnection:v5 error:0];
    }
    [(NSMutableArray *)self->_internal->connections addObject:v5];
    [v5 addObserver:self forKeyPath:@"changeSeed" options:3 context:AVCaptureSessionConnectionChangedContext];
    [v5 addObserver:self forKeyPath:@"active" options:3 context:AVCaptureSessionConnectionActiveChangedContext];
    BOOL v19 = v7;
    BOOL v7 = (BOOL)v10;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v12 = (void *)[v5 inputPorts];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v22 != v14) {
            objc_enumerationMutation(v12);
          }
          [*(id *)(*((void *)&v21 + 1) + 8 * i) addObserver:self forKeyPath:@"enabled" options:3 context:AVCaptureSessionConnectedInputPortEnabledChangedContext];
        }
        uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v13);
    }
    [(AVCaptureSession *)self _updateHardwareCost];
    long long v16 = (void *)v7;
    LOBYTE(v7) = v19;
    objc_sync_exit(obj);
    if (v8)
    {
      [v8 didChangeValueForKey:@"connections"];
    }
    else if (v16)
    {
      [v16 didChangeValueForKey:@"connection"];
    }
  }
  if (a4) {
    char v17 = v7;
  }
  else {
    char v17 = 1;
  }
  if ((v17 & 1) == 0) {
    *a4 = v25;
  }
  return v7;
}

- (BOOL)_canAddConnection:(id)a3 failureReason:(id *)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  long long v35 = 0;
  internal = self->_internal;
  objc_sync_enter(internal);
  obuint64_t j = internal;
  if ([(NSMutableArray *)self->_internal->connections containsObject:a3])
  {
    uint64_t v8 = NSString;
    uint64_t v9 = (objc_class *)objc_opt_class();
    uint64_t v10 = [v8 stringWithFormat:@"<%@: %p> already exists in this session", NSStringFromClass(v9), a3];
    goto LABEL_27;
  }
  if ([a3 output])
  {
    if ((-[NSMutableArray containsObject:](self->_internal->outputs, "containsObject:", [a3 output]) & 1) == 0)
    {
      BOOL v19 = NSString;
      long long v20 = (objc_class *)objc_opt_class();
      uint64_t v10 = [v19 stringWithFormat:@"<%@: %p> references an output unknown to this session", NSStringFromClass(v20), a3];
      goto LABEL_27;
    }
    if ((objc_msgSend((id)objc_msgSend(a3, "output"), "canAddConnection:failureReason:", a3, &v35) & 1) == 0) {
      goto LABEL_34;
    }
  }
  else if ([a3 videoPreviewLayer])
  {
    if (!-[NSHashTable containsObject:](self->_internal->videoPreviewLayers, "containsObject:", [a3 videoPreviewLayer]))
    {
      long long v25 = NSString;
      uint64_t v26 = (objc_class *)objc_opt_class();
      uint64_t v10 = [v25 stringWithFormat:@"<%@: %p> references a video preview layer unknown to this session", NSStringFromClass(v26), a3];
LABEL_27:
      long long v11 = a4;
LABEL_28:
      BOOL v18 = 0;
      long long v35 = (void *)v10;
      goto LABEL_29;
    }
    if (!objc_msgSend((id)objc_msgSend(a3, "videoPreviewLayer"), "canAddConnection:failureReason:", a3, &v35))
    {
LABEL_34:
      long long v11 = a4;
      BOOL v18 = 0;
      goto LABEL_29;
    }
  }
  if (![a3 inputPorts])
  {
    long long v21 = NSString;
    long long v22 = (objc_class *)objc_opt_class();
    uint64_t v10 = [v21 stringWithFormat:@"<%@: %p> references an invalid port", NSStringFromClass(v22), a3];
    goto LABEL_27;
  }
  long long v11 = a4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v13 = (void *)[a3 inputPorts];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v32;
    while (2)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v32 != v15) {
          objc_enumerationMutation(v13);
        }
        char v17 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        if ((-[NSMutableArray containsObject:](self->_internal->inputs, "containsObject:", [v17 input]) & 1) == 0)
        {
          long long v23 = NSString;
          long long v24 = (objc_class *)objc_opt_class();
          uint64_t v10 = [v23 stringWithFormat:@"<%@: %p> references an input unknown to this session", NSStringFromClass(v24), a3];
          goto LABEL_28;
        }
        if ((isKindOfClass & 1) == 0 && [v17 sourcesFromConstituentDevice])
        {
          uint64_t v28 = NSString;
          long long v29 = (objc_class *)objc_opt_class();
          uint64_t v10 = [v28 stringWithFormat:@"<%@: %p> references an input port from a constituent device -- Use AVCaptureMultiCamSession instead", NSStringFromClass(v29), a3];
          goto LABEL_28;
        }
      }
      uint64_t v14 = [v13 countByEnumeratingWithState:&v31 objects:v36 count:16];
      BOOL v18 = 1;
      if (v14) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v18 = 1;
  }
LABEL_29:
  objc_sync_exit(obj);
  if (v11 && v35) {
    *long long v11 = v35;
  }
  return v18;
}

- (id)_figCaptureSessionConfiguration
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F50F70]);
  ++_figCaptureSessionConfiguration_uniqueConfigurationID;
  objc_msgSend(v3, "setConfigurationID:");
  [v3 setClientExpectsCameraMountedInLandscapeOrientation:AVCaptureClientExpectsCameraMountedInLandscapeOrientation()];
  objc_msgSend(v3, "setSessionPreset:", -[AVCaptureSession sessionPreset](self, "sessionPreset"));
  [v3 setUsesAppAudioSession:self->_internal->usesApplicationAudioSession];
  [v3 setConfiguresAppAudioSession:self->_internal->automaticallyConfiguresApplicationAudioSession];
  if ([v3 usesAppAudioSession]) {
    [v3 setConfiguresAppAudioSessionToMixWithOthers:self->_internal->configuresApplicationAudioSessionToMixWithOthers];
  }
  [v3 setAllowedToRunInMultitaskingMode:self->_internal->authorizedToUseCameraInMultipleForegroundAppLayout];
  [v3 setTccIdentity:self->_internal->tccIdentity];
  objc_opt_class();
  [v3 setMultiCamSession:objc_opt_isKindOfClass() & 1];
  [v3 setXctestAuthorizedToStealDevice:self->_internal->xctestAuthorizedToStealDevice];
  [v3 setContinuityCameraIsWired:self->_internal->continuityCameraIsWired];
  [v3 setContinuityCameraClientDeviceClass:self->_internal->continuityCameraClientDeviceClass];
  uint64_t v4 = (void *)[MEMORY[0x1E4F223F8] bundleRecordForCurrentProcess];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v3, "setClientIsVOIP:", objc_msgSend((id)objc_msgSend(v4, "UIBackgroundModes"), "containsObject:", @"voip"));
  }
  [v3 setSuppressVideoEffects:self->_internal->suppressVideoEffects];
  [v3 setCheckIfFileAlreadyExistForMFO:self->_internal->checkIfFileAlreadyExistForMFO];
  [v3 setSmartStyleRenderingEnabled:self->_internal->smartStyleRenderingEnabled];
  if ([v3 smartStyleRenderingEnabled])
  {
    objc_msgSend(v3, "setSmartStyleControlMode:", -[AVCaptureSession smartStyleControlMode](self, "smartStyleControlMode"));
    [v3 setSmartStyle:0];
    smartStyleSetByClient = self->_internal->smartStyleSetByClient;
    if (smartStyleSetByClient)
    {
      uint64_t v6 = (void *)MEMORY[0x1E4F50F78];
      uint64_t v7 = [(AVCaptureSmartStyle *)smartStyleSetByClient cast];
      [(AVCaptureSmartStyle *)smartStyleSetByClient intensity];
      int v9 = v8;
      [(AVCaptureSmartStyle *)smartStyleSetByClient toneBias];
      int v11 = v10;
      [(AVCaptureSmartStyle *)smartStyleSetByClient colorBias];
      LODWORD(v13) = v12;
      LODWORD(v14) = v9;
      LODWORD(v15) = v11;
      objc_msgSend(v3, "setSmartStyle:", objc_msgSend(v6, "styleWithCast:intensity:toneBias:colorBias:", v7, v14, v15, v13));
    }
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  connections = self->_internal->connections;
  uint64_t v17 = [(NSMutableArray *)connections countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v25 != v19) {
          objc_enumerationMutation(connections);
        }
        uint64_t v21 = [*(id *)(*((void *)&v24 + 1) + 8 * i) figCaptureConnectionConfigurationForSessionPreset:self->_internal->sessionPreset allConnections:self->_internal->connections];
        if (v21)
        {
          long long v22 = (void *)v21;
          [v3 addConnectionConfiguration:v21];
          objc_msgSend((id)objc_msgSend(v22, "sourceConfiguration"), "setClientExpectsCameraMountedInLandscapeOrientation:", objc_msgSend(v3, "clientExpectsCameraMountedInLandscapeOrientation"));
        }
      }
      uint64_t v18 = [(NSMutableArray *)connections countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v18);
  }
  [(AVCaptureSession *)self _addFakeOutputsIfNeededForCenterStageToSessionConfiguration:v3];
  return v3;
}

- (AVCaptureSessionPreset)sessionPreset
{
  internal = self->_internal;
  objc_sync_enter(internal);
  uint64_t v4 = self->_internal->sessionPreset;
  objc_sync_exit(internal);
  return v4;
}

- (void)_addFakeOutputsIfNeededForCenterStageToSessionConfiguration:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:517 valueOptions:0 capacity:2];
  id v29 = a3;
  uint64_t v30 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v5 = (void *)[a3 connectionConfigurations];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v45 objects:v52 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v46 != v8) {
          objc_enumerationMutation(v5);
        }
        int v10 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        int v11 = (void *)[v10 sourceConfiguration];
        if (([v11 cinematicFramingEnabled] & 1) != 0
          || [v11 manualCinematicFramingEnabled])
        {
          int v12 = objc_msgSend(v4, "objectForKey:", objc_msgSend(v11, "source"));
          if (!v12)
          {
            int v12 = (void *)[MEMORY[0x1E4F1CA48] array];
            objc_msgSend(v4, "setObject:forKey:", v12, objc_msgSend(v11, "source"));
          }
          [v12 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v45 objects:v52 count:16];
    }
    while (v7);
  }
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  uint64_t v32 = [v4 countByEnumeratingWithState:&v41 objects:v51 count:16];
  if (v32)
  {
    uint64_t v31 = *(void *)v42;
    do
    {
      for (uint64_t j = 0; j != v32; ++j)
      {
        if (*(void *)v42 != v31) {
          objc_enumerationMutation(v4);
        }
        double v14 = (void *)[v4 objectForKey:*(void *)(*((void *)&v41 + 1) + 8 * j)];
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        uint64_t v15 = [v14 countByEnumeratingWithState:&v37 objects:v50 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = 0;
          uint64_t v18 = *(void *)v38;
LABEL_20:
          uint64_t v19 = 0;
          while (1)
          {
            if (*(void *)v38 != v18) {
              objc_enumerationMutation(v14);
            }
            long long v20 = *(void **)(*((void *)&v37 + 1) + 8 * v19);
            if (!v17)
            {
              if ([*(id *)(*((void *)&v37 + 1) + 8 * v19) mediaType] == 1986618469) {
                uint64_t v17 = v20;
              }
              else {
                uint64_t v17 = 0;
              }
            }
            unsigned int v21 = objc_msgSend((id)objc_msgSend(v20, "sinkConfiguration"), "sinkType");
            if (v21 <= 6 && ((1 << v21) & 0x52) != 0) {
              break;
            }
            if (v16 == ++v19)
            {
              uint64_t v16 = [v14 countByEnumeratingWithState:&v37 objects:v50 count:16];
              if (v16) {
                goto LABEL_20;
              }
              if (v17)
              {
                id v23 = (id)[v17 copy];
                [v23 setConnectionID:@"Fake AVCaptureMovieFileOutput video connection for cinematic framing"];
                [v23 setEnabled:1];
                id v24 = objc_alloc_init(MEMORY[0x1E4F50F50]);
                [v24 setSinkID:@"Fake AVCaptureMovieFileOutput sink for cinematic framing"];
                [v23 setSinkConfiguration:v24];
                [v30 addObject:v23];
              }
              break;
            }
          }
        }
      }
      uint64_t v32 = [v4 countByEnumeratingWithState:&v41 objects:v51 count:16];
    }
    while (v32);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v25 = [v30 countByEnumeratingWithState:&v33 objects:v49 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v34;
    do
    {
      for (uint64_t k = 0; k != v26; ++k)
      {
        if (*(void *)v34 != v27) {
          objc_enumerationMutation(v30);
        }
        [v29 addConnectionConfiguration:*(void *)(*((void *)&v33 + 1) + 8 * k)];
      }
      uint64_t v26 = [v30 countByEnumeratingWithState:&v33 objects:v49 count:16];
    }
    while (v26);
  }
}

- (BOOL)_addOutputWithNoConnections:(id)a3 exceptionReason:(id *)a4
{
  int v10 = 0;
  BOOL v7 = [(AVCaptureSession *)self _canAddOutput:a3 failureReason:&v10];
  if (v7)
  {
    [(AVCaptureSession *)self willChangeValueForKey:@"outputs"];
    internal = self->_internal;
    objc_sync_enter(internal);
    [a3 setSession:self];
    [a3 addObserver:self forKeyPath:@"changeSeed" options:3 context:AVCaptureSessionOutputChangedContext];
    [(NSMutableArray *)self->_internal->outputs addObject:a3];
    objc_sync_exit(internal);
    [(AVCaptureSession *)self didChangeValueForKey:@"outputs"];
  }
  else if (a4)
  {
    *a4 = v10;
  }
  return v7;
}

- (BOOL)_addInputWithNoConnections:(id)a3 exceptionReason:(id *)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  unsigned int v21 = 0;
  BOOL v7 = [(AVCaptureSession *)self _canAddInput:a3 failureReason:&v21];
  if (v7)
  {
    [(AVCaptureSession *)self willChangeValueForKey:@"inputs"];
    internal = self->_internal;
    objc_sync_enter(internal);
    [a3 setSession:self];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    int v9 = (void *)[a3 ports];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v9);
          }
          [*(id *)(*((void *)&v17 + 1) + 8 * i) addObserver:self forKeyPath:@"changeSeed" options:3 context:AVCaptureSessionInputPortChangedContext];
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v10);
    }
    [(NSMutableArray *)self->_internal->inputs addObject:a3];
    if ([a3 isMemberOfClass:objc_opt_class()])
    {
      long long v15 = *MEMORY[0x1E4F1F9F8];
      uint64_t v16 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
      [a3 setVideoMinFrameDurationOverride:&v15];
      double v13 = (void *)[a3 device];
      [v13 addObserver:self forKeyPath:@"connected" options:3 context:AVCaptureSessionVideoInputDeviceConnectedChangedContext];
      [v13 addObserver:self forKeyPath:@"activeFormat" options:3 context:AVCaptureSessionVideoInputDeviceActiveFormatChangedContext];
      [v13 addObserver:self forKeyPath:@"activeDepthDataFormat" options:3 context:AVCaptureSessionVideoInputDeviceActiveDepthDataFormatChangedContext];
      [v13 addObserver:self forKeyPath:@"automaticallyAdjustsVideoHDREnabled" options:3 context:AVCaptureSessionVideoInputDeviceAutomaticallyAdjustsHDREnabledChangedContext];
      [v13 addObserver:self forKeyPath:@"videoHDREnabled" options:3 context:AVCaptureSessionVideoInputDeviceHDREnabledChangedContext];
      [v13 addObserver:self forKeyPath:@"activeColorSpace" options:3 context:AVCaptureSessionVideoInputDeviceActiveColorSpaceChangedContext];
      [v13 addObserver:self forKeyPath:@"lowLightVideoCaptureEnabled" options:3 context:AVCaptureSessionVideoInputDeviceLowLightVideoEnabledChangedContext];
      [v13 addObserver:self forKeyPath:@"geometricDistortionCorrectionEnabled" options:3 context:AVCaptureSessionVideoInputDeviceGeometricDistortionCorrectionEnabledChangedContext];
      [v13 addObserver:self forKeyPath:@"variableFrameRateVideoCaptureEnabled" options:3 context:AVCaptureSessionVideoInputDeviceVariableFrameRateVideoEnabledChangedContext];
      [v13 addObserver:self forKeyPath:@"videoStabilizationStrength" options:3 context:AVCaptureSessionVideoInputDeviceVideoStabilizationStrengthChangedContext];
      [v13 addObserver:self forKeyPath:@"centerStageActive" options:3 context:AVCaptureSessionVideoInputDeviceCenterStageActiveChangedContext];
      [v13 addObserver:self forKeyPath:@"backgroundBlurActive" options:3 context:AVCaptureSessionVideoInputDeviceBackgroundBlurActiveChangedContext];
      [v13 addObserver:self forKeyPath:@"studioLightActive" options:3 context:AVCaptureSessionVideoInputDeviceStudioLightingActiveChangedContext];
      [v13 addObserver:self forKeyPath:@"canPerformReactionEffects" options:3 context:AVCaptureSessionVideoInputDeviceReactionEffectsActiveChangedContext];
      [v13 addObserver:self forKeyPath:@"backgroundReplacementActive" options:3 context:AVCaptureSessionVideoInputDeviceBackgroundReplacementActiveChangedContext];
      [v13 addObserver:self forKeyPath:@"manualFramingEnabled" options:3 context:AVCaptureSessionVideoInputDeviceManualFramingEnabledChangedContext];
      [v13 addObserver:self forKeyPath:@"manualFramingPanningAngleX" options:3 context:&AVCaptureSessionVideoInputDeviceManualFramingEnabledChangedContext];
      [v13 addObserver:self forKeyPath:@"manualFramingPanningAngleY" options:3 context:AVCaptureSessionVideoInputDeviceManualFramingPanningAngleYChangedContext];
      [v13 addObserver:self forKeyPath:@"gazeSelectionEnabled" options:3 context:AVCaptureSessionVideoInputDeviceGazeSelectionEnabledChangedContext];
      [v13 addObserver:self forKeyPath:@"audioInputRouteIsBuiltInMic" options:3 context:AVCaptureSessionAudioInputDeviceIsBuiltInMicChangedContext];
    }
    objc_sync_exit(internal);
    [(AVCaptureSession *)self didChangeValueForKey:@"inputs"];
  }
  else if (a4)
  {
    *a4 = v21;
  }
  return v7;
}

+ (BOOL)automaticallyNotifiesObserversOfRunning
{
  return 0;
}

uint64_t __48__AVCaptureSession__canAddOutput_failureReason___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = *(void **)(a1 + 32);
  uint64_t result = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (result)
  {
    uint64_t v7 = result;
    uint64_t v8 = *(void *)v11;
    while (2)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_isKindOfClass())
        {
          if (!AVGestaltGetBoolAnswer(@"AVGQCaptureMultipleVideoDataOutputsSupported")
            || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            uint64_t result = 1;
            *a4 = 1;
            return result;
          }
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t result = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      uint64_t v7 = result;
      if (result) {
        continue;
      }
      break;
    }
  }
  return result;
}

- (BOOL)isBeingConfiguredOnCurrentThread
{
  MEMORY[0x1A6234290](self->_internal->figCaptureSourceConfigChangeCacheMutex, a2);
  internal = self->_internal;
  if (internal->beginConfigRefCount < 1)
  {
    char v4 = 0;
  }
  else
  {
    char v4 = -[NSThread isEqual:](internal->threadWhichBeganConfiguration, "isEqual:", [MEMORY[0x1E4F29060] currentThread]);
    internal = self->_internal;
  }
  MEMORY[0x1A62342A0](internal->figCaptureSourceConfigChangeCacheMutex);
  return v4;
}

- (NSArray)outputs
{
  internal = self->_internal;
  objc_sync_enter(internal);
  char v4 = (NSArray *)[MEMORY[0x1E4F1C978] arrayWithArray:self->_internal->outputs];
  objc_sync_exit(internal);
  return v4;
}

uint64_t __59__AVCaptureSession_liveSessionConnectedVideoCaptureDevices__block_invoke(uint64_t a1, void *a2)
{
  id v3 = (void *)[a2 uniqueID];
  uint64_t v4 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "sourceDevice"), "uniqueID");

  return [v3 isEqualToString:v4];
}

- (BOOL)_addVideoPreviewLayer:(id)a3 exceptionReason:(id *)a4
{
  v24[16] = *MEMORY[0x1E4F143B8];
  if (dword_1EB4C9260)
  {
    int v22 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v24[0] = 0;
  if (-[AVCaptureSession _canAddVideoPreviewLayer:failureReason:](self, "_canAddVideoPreviewLayer:failureReason:", a3, v24, v15, v16))
  {
    internal = self->_internal;
    objc_sync_enter(internal);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      [(AVCaptureSession *)self _removeAllPreviewLayers];
    }
    if ([(NSHashTable *)self->_internal->videoPreviewLayers containsObject:a3])
    {
      objc_sync_exit(internal);
      return 1;
    }
    if ([(NSHashTable *)self->_internal->videoPreviewLayers count] >= 2)
    {
      v24[0] = [NSString stringWithFormat:@"Cannot add %@ to capture session %@ because it's already associated with one or more video preview layers. Use the AVCaptureVideoPreviewLayer \"WithNoConnections:\" method variants instead.", objc_msgSend(a3, "description"), -[AVCaptureSession description](self, "description")];
    }
    else
    {
      [(AVCaptureSession *)self beginConfiguration];
      [(NSHashTable *)self->_internal->videoPreviewLayers addObject:a3];
      id v9 = [(AVCaptureSession *)self _connectionsForNewVideoPreviewLayer:a3];
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v23 count:16];
      if (!v10)
      {
LABEL_18:
        [a3 addObserver:self forKeyPath:@"changeSeed" options:3 context:AVCaptureSessionOutputChangedContext];
        [(AVCaptureSession *)self _updateHardwareCost];
        objc_sync_exit(internal);
        [(AVCaptureSession *)self commitConfiguration];
        return 1;
      }
      uint64_t v11 = *(void *)v18;
LABEL_11:
      uint64_t v12 = 0;
      while (1)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * v12);
        if ([(AVCaptureSession *)self canAddConnection:v13])
        {
          if (![(AVCaptureSession *)self _addConnection:v13 exceptionReason:v24]) {
            break;
          }
        }
        if (v10 == ++v12)
        {
          uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v23 count:16];
          if (v10) {
            goto LABEL_11;
          }
          goto LABEL_18;
        }
      }
    }
    objc_sync_exit(internal);
  }
  BOOL result = 0;
  if (a4) {
    *a4 = (id)v24[0];
  }
  return result;
}

- (void)_removeAllPreviewLayers
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ([(NSHashTable *)self->_internal->videoPreviewLayers count])
  {
    id v3 = (void *)[(NSHashTable *)self->_internal->videoPreviewLayers copy];
    long long v8 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v9;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v3);
          }
          [*(id *)(*((void *)&v8 + 1) + 8 * v7++) setSession:0];
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }
  }
}

- (id)_connectionsForNewVideoPreviewLayer:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  obuint64_t j = [(AVCaptureSession *)self inputs];
  uint64_t v6 = [(NSArray *)obj countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v19 = *(void *)v26;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v26 != v19) {
          objc_enumerationMutation(obj);
        }
        long long v9 = *(void **)(*((void *)&v25 + 1) + 8 * v8);
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v10 = (void *)[v9 ports];
        uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v22;
          do
          {
            uint64_t v14 = 0;
            do
            {
              if (*(void *)v22 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = *(void *)(*((void *)&v21 + 1) + 8 * v14);
              uint64_t v20 = 0;
              uint64_t v16 = +[AVCaptureConnection connectionWithInputPort:v15 videoPreviewLayer:a3];
              if ([a3 canAddConnection:v16 failureReason:&v20]) {
                [v5 addObject:v16];
              }
              ++v14;
            }
            while (v12 != v14);
            uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v29 count:16];
          }
          while (v12);
        }
        ++v8;
      }
      while (v8 != v7);
      uint64_t v7 = [(NSArray *)obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v7);
  }
  return v5;
}

- (BOOL)_canAddVideoPreviewLayer:(id)a3 failureReason:(id *)a4
{
  if (!a3 && a4) {
    *a4 = @"Cannot add a nil video preview layer to a session";
  }
  return a3 != 0;
}

uint64_t __47__AVCaptureSession__canAddInput_failureReason___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 isMemberOfClass:objc_opt_class()];
  if (result)
  {
    uint64_t v8 = (void *)[a2 device];
    [*(id *)(a1 + 32) device];
    uint64_t result = [v8 isMemberOfClass:objc_opt_class()];
    if (result)
    {
      uint64_t result = 1;
      *a4 = 1;
    }
  }
  return result;
}

- (BOOL)likelyToRecordProResMovies
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", +[AVCaptureOutput supportedProResCodecTypes](AVCaptureOutput, "supportedProResCodecTypes"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v4 = [(AVCaptureSession *)self connections];
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (!v5) {
    return v5;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v15;
  uint64_t v8 = *MEMORY[0x1E4F47C08];
  while (2)
  {
    uint64_t v9 = 0;
    do
    {
      if (*(void *)v15 != v7) {
        objc_enumerationMutation(v4);
      }
      long long v10 = (void *)[*(id *)(*((void *)&v14 + 1) + 8 * v9) output];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v11 = [v10 availableVideoCodecTypesForAssetWriterWithOutputFileType:v8];
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_12;
        }
        uint64_t v11 = [v10 availableVideoCodecTypes];
      }
      if (v11)
      {
        uint64_t v12 = (void *)[MEMORY[0x1E4F1CAD0] setWithArray:v11];
        goto LABEL_13;
      }
LABEL_12:
      uint64_t v12 = 0;
LABEL_13:
      if ([v12 intersectsSet:v3])
      {
        LOBYTE(v5) = 1;
        return v5;
      }
      ++v9;
    }
    while (v6 != v9);
    uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    uint64_t v6 = v5;
    if (v5) {
      continue;
    }
    return v5;
  }
}

- (void)startRunning
{
  if (dword_1EB4C9260)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  internal = self->_internal;
  objc_sync_enter(internal);
  if ([(AVCaptureSession *)self isBeingConfigured])
  {
    uint64_t v5 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v5);
    }
    NSLog(&cfstr_SuppressingExc.isa, v5);
    objc_sync_exit(internal);
  }
  else
  {
    BOOL v6 = [(AVCaptureSession *)self isRunning];
    objc_sync_exit(internal);
    if (!v6) {
      [(AVCaptureSession *)self _setRunning:1];
    }
  }
}

- (void)_setRunning:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)MEMORY[0x1A62348E0](self, a2);
  BOOL v6 = self;
  if (self->_internal->videoInputDeviceUsed && AVCaptureClientIsCameraOrDerivative() && v3)
  {
    if (avcs_platformSupportsDeferredProcessing_onceToken != -1) {
      dispatch_once(&avcs_platformSupportsDeferredProcessing_onceToken, &__block_literal_global_832);
    }
    if (avcs_platformSupportsDeferredProcessing_answer) {
      notify_post((const char *)*MEMORY[0x1E4F512A8]);
    }
  }
  internal = self->_internal;
  if (internal->running != v3 || internal->figCaptureSessionStarted && !v3)
  {
    [(AVCaptureSession *)self willChangeValueForKey:@"running"];
    uint64_t v8 = self->_internal;
    if (v3)
    {
      v8->running = v3;
      BOOL v9 = [(AVCaptureSession *)self _buildAndRunGraph:[(AVCaptureSession *)self isBeingConfigured]];
      long long v10 = self->_internal;
      if (!v9)
      {
        v10->running = 0;
LABEL_39:
        [(AVCaptureSession *)self didChangeValueForKey:@"running"];
        goto LABEL_40;
      }
      if (v10->interrupted)
      {
        v10->running = 0;
      }
      else
      {
        if (dword_1EB4C9260)
        {
          os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", v19, v20), "postNotificationName:object:", @"AVCaptureSessionDidStartRunningNotification", self);
      }
      if (!self->_internal->videoInputDeviceUsed) {
        goto LABEL_39;
      }
      CTGreenTeaOsLogHandle = getCTGreenTeaOsLogHandle();
      if (!CTGreenTeaOsLogHandle) {
        goto LABEL_39;
      }
      long long v16 = CTGreenTeaOsLogHandle;
      if (!os_log_type_enabled(CTGreenTeaOsLogHandle, OS_LOG_TYPE_INFO)) {
        goto LABEL_39;
      }
      *(_WORD *)buf = 0;
      long long v17 = "Started camera session";
LABEL_38:
      _os_log_impl(&dword_1A152C000, v16, OS_LOG_TYPE_INFO, v17, buf, 2u);
      goto LABEL_39;
    }
    if (v8->figCaptureSessionStarted)
    {
      int v11 = [(AVCaptureSession *)self _stopFigCaptureSession];
      if (v11 && v11 != -11819) {
        goto LABEL_26;
      }
      self->_internal->running = 0;
      if (!dword_1EB4C9260)
      {
LABEL_25:
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", v19, v20), "postNotificationName:object:", @"AVCaptureSessionDidStopRunningNotification", self);
LABEL_26:
        long long v14 = self->_internal;
        if (!v14->running && v14->interrupted)
        {
          [(AVCaptureSession *)self _setInterrupted:0 withReason:0];
          long long v14 = self->_internal;
        }
        if (!v14->videoInputDeviceUsed) {
          goto LABEL_39;
        }
        long long v15 = getCTGreenTeaOsLogHandle();
        if (!v15) {
          goto LABEL_39;
        }
        long long v16 = v15;
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_INFO)) {
          goto LABEL_39;
        }
        *(_WORD *)buf = 0;
        long long v17 = "Stopped camera session";
        goto LABEL_38;
      }
    }
    else
    {
      v8->running = 0;
      if (!dword_1EB4C9260) {
        goto LABEL_25;
      }
    }
    uint64_t v12 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    goto LABEL_25;
  }
LABEL_40:
}

- (AVCaptureSession)init
{
  if (dword_1EB4C9260)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (!AVCaptureClientHasEntitlement((void *)AVCaptureEntitlementWebBrowserEngineRendering)) {
    return (AVCaptureSession *)[(AVCaptureSession *)self _initWithMediaEnvironment:0];
  }
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector(), 0, AVCaptureEntitlementWebBrowserEngineRendering);

  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v4);
  }
  NSLog(&cfstr_SuppressingExc.isa, v4);
  return 0;
}

- (id)_initWithMediaEnvironment:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)AVCaptureSession;
  uint64_t v4 = [(AVCaptureSession *)&v16 init];
  if (v4)
  {
    uint64_t v5 = objc_alloc_init(AVCaptureSessionInternal);
    v4->_internal = v5;
    if (!v5)
    {

      return 0;
    }
    p_internal = &v4->_internal;
    v4->_internal->weakReference = (AVWeakReference *)[objc_alloc(MEMORY[0x1E4F47DF0]) initWithReferencedObject:v4];
    (*p_internal)->runLoopConditiouint64_t n = (AVRunLoopCondition *)objc_alloc_init(MEMORY[0x1E4F47DE0]);
    (*p_internal)->sessionPreset = (NSString *)[[NSString alloc] initWithString:@"AVCaptureSessionPresetHigh"];
    (*p_internal)->mediaEnvironment = (NSString *)[a3 copy];
    (*p_internal)->inputs = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    (*p_internal)->outputs = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    (*p_internal)->controls = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    (*p_internal)->controlsOverlay = [[AVCaptureControlsOverlay alloc] initWithSession:v4];
    (*p_internal)->videoPreviewLayers = (NSHashTable *)(id)[MEMORY[0x1E4F28D30] weakObjectsHashTable];
    (*p_internal)->connections = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    (*p_internal)->committedAVCaptureSessionConfigurations = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    (*p_internal)->automaticallyConfiguresApplicationAudioSessiouint64_t n = 1;
    (*p_internal)->configuresApplicationAudioSessionToMixWithOthers = 0;
    (*p_internal)->automaticallyConfiguresCaptureDeviceForWideColor = 1;
    (*p_internal)->usesApplicationAudioSessiouint64_t n = AVGestaltGetBoolAnswer(@"AVGQCaptureSessionUsesAppAudioSessionByDefault");
    (*p_internal)->notifiesOnMainThread = 1;
    (*p_internal)->devicesToResetVideoZoomFactorAndMinMaxFrameDurations = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    int v7 = [(AVCaptureSession *)v4 isMultitaskingCameraAccessSupported];
    if (v7) {
      LOBYTE(v7) = AVCaptureClientHasEntitlement((void *)AVCaptureEntitlementMultitaskingCameraAccess);
    }
    uint64_t v8 = &v4->_internal;
    v4->_internal->authorizedToUseCameraInMultipleForegroundAppLayout = v7;
    (*v8)->greenTeaLogger = (ct_green_tea_logger_s *)ct_green_tea_logger_create();
    (*v8)->checkIfFileAlreadyExistForMFO = AVGestaltGetBoolAnswer(@"AVGQCaptureCheckIfFileAlreadyExistForMFO");
    if ((AVCaptureIsRunningInMediaserverd() & 1) == 0)
    {
      BOOL v9 = &v4->_internal;
      weakReference = v4->_internal->weakReference;
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __46__AVCaptureSession__initWithMediaEnvironment___block_invoke;
      v15[3] = &unk_1E5A79CA8;
      v15[4] = weakReference;
      (*v9)->captureServerConnectionDiedSemaphore = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
      (*v9)->serverConnectionDiedNotificationTokeuint64_t n = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "addObserverForName:object:queue:usingBlock:", 0x1EF4D7A10, 0, 0, v15);
      +[AVCaptureDevice _registerOnceForServerConnectionDiedNotification];
    }
    v4->_internal->figCaptureSourceConfigChangeCacheMutex = (OpaqueFigReentrantMutex *)FigReentrantMutexCreate();
    [(AVCaptureSession *)v4 _createFigCaptureSession];
    int v11 = (void *)sActiveSessions;
    objc_sync_enter((id)sActiveSessions);
    objc_msgSend((id)sActiveSessions, "addObject:", objc_msgSend(MEMORY[0x1E4F29238], "valueWithNonretainedObject:", v4));
    objc_sync_exit(v11);
    uint64_t v12 = &v4->_internal;
    v4->_internal->_devicesObservingVideoZoomFactor = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v4->_internal->continuityCameraIsWired = 0;
    v4->_internal->continuityCameraClientDeviceClass = 0;
    v4->_internal->clientIsVOIP = 0;
    v4->_internal->suppressVideoEffects = 0;
    (*v12)->recordingMovieFileOutputs = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    (*v12)->recordingMovieFileOutputsLock._os_unfair_lock_opaque = 0;
    (*v12)->smartStyleControlMode = 0;
    (*v12)->smartStyleInVideoModeEnabled = _os_feature_enabled_impl();
    (*v12)->smartStyleInThirdPartyAppsEnabled = 0;
    [(AVCaptureSession *)v4 isApplicationOptedOutByDefaultToSmartStyles];
    (*v12)->smartStyleRenderingOptedOut = ![(AVCaptureSession *)v4 isSystemStyleEnabled];
  }
  if (dword_1EB4C9260)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v4;
}

- (BOOL)isSystemStyleEnabled
{
  if (self->_internal->smartStyleInThirdPartyAppsEnabled)
  {
    v2 = AVCaptureClientPreferencesDomain();
    BOOL v3 = (void *)[AVSmartStyleSettingsGetSystemStyleEnabledStateForCameraApps() mutableCopy];
    if ([v3 objectForKeyedSubscript:v2])
    {
      LOBYTE(SystemStyleEnabledForBundleID) = objc_msgSend((id)objc_msgSend(v3, "objectForKeyedSubscript:", v2), "BOOLValue");
    }
    else
    {
      uint64_t SystemStyleEnabledForBundleID = AVSmartStyleSettingsGetSystemStyleEnabledForBundleID((uint64_t)v2);
      AVSmartStyleSettingsSetSystemStyleEnabledForBundleID(SystemStyleEnabledForBundleID, (uint64_t)v2);
    }

    return SystemStyleEnabledForBundleID;
  }
  else
  {
    return AVCaptureClientIsCameraOrDerivative();
  }
}

- (BOOL)isMultitaskingCameraAccessSupported
{
  if (AVCaptureClientHasEntitlement((void *)AVCaptureEntitlementMultitaskingCameraAccess)) {
    return 1;
  }
  if (AVGestaltGetBoolAnswer(@"AVGQCaptureMultitaskingCameraAccessVoipAppsSupported"))
  {
    BOOL v3 = (void *)[MEMORY[0x1E4F223F8] bundleRecordForCurrentProcess];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (objc_msgSend((id)objc_msgSend(v3, "UIBackgroundModes"), "containsObject:", @"voip") & 1) != 0)
    {
      return 1;
    }
  }

  return MGGetBoolAnswer();
}

- (void)isApplicationOptedOutByDefaultToSmartStyles
{
  if (self->_internal->smartStyleInThirdPartyAppsEnabled)
  {
    BOOL v3 = AVCaptureClientPreferencesDomain();
    uint64_t v4 = [MEMORY[0x1E4F223F8] bundleRecordForCurrentProcess];
    if (v4)
    {
      uint64_t v5 = (void *)v4;
      internal = self->_internal;
      objc_sync_enter(internal);
      uint64_t v7 = AVSmartStyleSettingsSystemStyleEnabledDefaultPreferenceKey(v3);
      uint64_t HasShownOptOutMessagePreferenceKey = AVSmartStyleSettingsSystemStyleHasShownOptOutMessagePreferenceKey(v3);
      BOOL v9 = (void *)[v5 infoDictionary];
      if ([v9 objectForKey:AVCaptureBundleCameraPhotographicStylesOptOut ofClass:objc_opt_class()])
      {
        id v10 = +[AVCaptureProprietaryDefaultsSingleton objectForKey:v7];
        int v11 = (void *)[v5 infoDictionary];
        int v12 = objc_msgSend((id)objc_msgSend(v11, "objectForKey:ofClass:", AVCaptureBundleCameraPhotographicStylesOptOut, objc_opt_class()), "BOOLValue");
        self->_internal->smartStyleAlertBundleName = (NSString *)(id)objc_msgSend((id)objc_msgSend(v5, "infoDictionary"), "objectForKey:ofClass:", @"CFBundleName", objc_opt_class());
        uint64_t v13 = (void *)[v5 infoDictionary];
        self->_internal->smartStyleAlertOptOutDescriptiouint64_t n = (NSString *)(id)[v13 objectForKey:AVCaptureBundleCameraPhotographicStylesOptOutDescription ofClass:objc_opt_class()];
        if (!v10 || v12 == [v10 BOOLValue])
        {
          +[AVCaptureProprietaryDefaultsSingleton setObject:forKey:](AVCaptureProprietaryDefaultsSingleton, "setObject:forKey:", [NSNumber numberWithInt:v12 ^ 1u], v7);
          if (+[AVCaptureProprietaryDefaultsSingleton objectForKey:HasShownOptOutMessagePreferenceKey])
          {
            +[AVCaptureProprietaryDefaultsSingleton setObject:0 forKey:HasShownOptOutMessagePreferenceKey];
          }
          [(AVCaptureSession *)self setSystemStyleEnabled:v12 ^ 1u];
        }
      }
      else
      {
        +[AVCaptureProprietaryDefaultsSingleton setObject:0 forKey:v7];
        +[AVCaptureProprietaryDefaultsSingleton setObject:0 forKey:HasShownOptOutMessagePreferenceKey];
        LOBYTE(v12) = 0;
      }
      self->_internal->smartStyleRenderingOptedOutDefault = v12;
      objc_sync_exit(internal);
    }
  }
}

- (int)_createFigCaptureSession
{
  CFTypeRef cf = 0;
  if (self->_internal->figCaptureSession)
  {
    FigDebugAssert3();
    return 0;
  }
  else
  {
    if (AVCaptureIsRunningInMediaserverd())
    {
      AVCaptureGetCurrentProcessAuditToken(&v9);
      int v3 = FigCaptureSessionCreate();
    }
    else
    {
      FigCaptureSessionRemoteCreate();
      char v7 = 1;
      do
      {
        int v3 = FigCaptureSessionRemoteCreate();
        usleep(0x3D090u);
        char v8 = v7 & 1;
        char v7 = 0;
      }
      while ((v8 & 1) != 0);
    }
    if (v3)
    {
      FigDebugAssert3();
      if (cf) {
        CFRelease(cf);
      }
    }
    else
    {
      uint64_t v4 = (void *)[MEMORY[0x1E4F47DB8] notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
      weakReference = self->_internal->weakReference;
      [v4 addListenerWithWeakReference:weakReference callback:avcaptureFigCaptureSessionNotification name:*MEMORY[0x1E4F517B8] object:cf flags:0];
      [v4 addListenerWithWeakReference:weakReference callback:avcaptureFigCaptureSessionNotification name:*MEMORY[0x1E4F517C0] object:cf flags:0];
      [v4 addListenerWithWeakReference:weakReference callback:avcaptureFigCaptureSessionNotification name:*MEMORY[0x1E4F517D8] object:cf flags:0];
      [v4 addListenerWithWeakReference:weakReference callback:avcaptureFigCaptureSessionNotification name:*MEMORY[0x1E4F517C8] object:cf flags:0];
      [v4 addListenerWithWeakReference:weakReference callback:avcaptureFigCaptureSessionNotification name:*MEMORY[0x1E4F517D0] object:cf flags:0];
      int v3 = 0;
      self->_internal->figCaptureSessiouint64_t n = (OpaqueFigCaptureSession *)cf;
    }
  }
  return v3;
}

id __30__AVCaptureSession_initialize__block_invoke()
{
  sActiveSessions = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
  id result = (id)[MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
  sCaptureDevicePropertiesBeingConfiguredByASession_ByDevice = (uint64_t)result;
  return result;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1 || (id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
    if (initialize_sActiveSessionsToken != -1) {
      dispatch_once(&initialize_sActiveSessionsToken, &__block_literal_global_21);
    }
  }

  objc_opt_class();
}

- (void)setConfiguresApplicationAudioSessionToMixWithOthers:(BOOL)a3
{
  internal = self->_internal;
  if (internal->configuresApplicationAudioSessionToMixWithOthers != a3)
  {
    internal->configuresApplicationAudioSessionToMixWithOthers = a3;
    if (self->_internal->usesApplicationAudioSession) {
      [(AVCaptureSession *)self _rebuildGraph];
    }
  }
}

- (BOOL)_startFigCaptureSession
{
  v22[1] = *MEMORY[0x1E4F143B8];
  [(AVCaptureSession *)self isRunning];
  self->_internal->figCaptureSessionStarted = 1;
  internal = self->_internal;
  objc_sync_enter(internal);
  figCaptureSessiouint64_t n = self->_internal->figCaptureSession;
  if (figCaptureSession)
  {
    uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v5) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
    char v7 = *(void (**)(OpaqueFigCaptureSession *))(v6 + 32);
    if (v7)
    {
      v7(figCaptureSession);
    }
    else
    {
      uint64_t v21 = *MEMORY[0x1E4F516D8];
      v22[0] = &unk_1EF4FA760;
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
      CMNotificationCenterGetDefaultLocalCenter();
      CMNotificationCenterPostNotification();
    }
  }
  objc_sync_exit(internal);
  long long v9 = self->_internal;
  p_internal = &self->_internal;

  (*p_internal)->uint64_t stopError = 0;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  inputs = (*p_internal)->inputs;
  uint64_t v11 = [(NSMutableArray *)inputs countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(inputs);
        }
        long long v14 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          objc_msgSend((id)objc_msgSend(v14, "device"), "updateStreamingDeviceHistory");
        }
      }
      uint64_t v11 = [(NSMutableArray *)inputs countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }
  return 1;
}

- (void)_handleDidStartRunningNotificationWithPayload:(id)a3
{
  v14[22] = *MEMORY[0x1E4F143B8];
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F516D8]), "intValue");
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F516D0]), "intValue");
  uint64_t v5 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F51758]];
  if (v5)
  {
    uint64_t v6 = v5;
    if (dword_1EB4C9260)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    uint64_t v13 = @"AVCapturePrewarmReasonKey";
    v14[0] = v6;
    uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1, v11, v12);
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:userInfo:", @"AVCaptureSessionWasPrewarmedNotification", self, v8);
  }
  internal = self->_internal;
  if (internal->interrupted)
  {
    [(AVCaptureSession *)self _setInterrupted:0 withReason:0];
    internal = self->_internal;
  }
  [(AVRunLoopCondition *)internal->runLoopCondition lock];
  id v10 = self->_internal;
  if (v10->waitingForFigCaptureSessionToStart)
  {
    v10->waitingForFigCaptureSessionToStart = 0;
    [(AVRunLoopCondition *)self->_internal->runLoopCondition signal];
    id v10 = self->_internal;
  }
  v10->figCaptureSessionRunning = 1;
  [(AVRunLoopCondition *)self->_internal->runLoopCondition unlock];
  [(AVCaptureSession *)self _notifySessionStarted];
}

- (void)_notifySessionStarted
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (!self->_internal->running)
  {
    [(AVCaptureSession *)self willChangeValueForKey:@"running"];
    self->_internal->running = 1;
    [(AVCaptureSession *)self _activateControlsOverlayIfNecessary];
    [(AVCaptureSession *)self didChangeValueForKey:@"running"];
    if (dword_1EB4C9260)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", v4, v5), "postNotificationName:object:", @"AVCaptureSessionDidStartRunningNotification", self);
  }
}

- (void)_handleConfigurationDidBecomeLiveNotificationWithPayload:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F51680]), "longLongValue");
  internal = self->_internal;
  objc_sync_enter(internal);
  if ([self->_internal->liveAVCaptureSessionConfiguration configurationID] == v4)
  {
    uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", -[NSArray count](-[AVCaptureSessionConfiguration inputs](self->_internal->liveAVCaptureSessionConfiguration, "inputs"), "count"));
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    char v7 = [self->_internal->liveAVCaptureSessionConfiguration inputs];
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v22 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v12 = [v11 device];
            if (v12)
            {
              if (([v6 containsObject:v12] & 1) == 0) {
                [v6 addObject:v12];
              }
            }
          }
        }
        uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v8);
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  objc_sync_exit(internal);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v13 = [v6 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v18;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:", @"AVCaptureDeviceDidStartRunningNotification", *(void *)(*((void *)&v17 + 1) + 8 * j));
      }
      uint64_t v13 = [v6 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v13);
  }

  [(AVRunLoopCondition *)self->_internal->runLoopCondition lock];
  long long v16 = self->_internal;
  if (v16->waitingForFigCaptureSessionConfigurationToBecomeLive)
  {
    v16->waitingForFigCaptureSessionConfigurationToBecomeLive = 0;
    long long v16 = self->_internal;
    if (!v16->waitingForFigCaptureSessionToStart)
    {
      [(AVRunLoopCondition *)v16->runLoopCondition signal];
      long long v16 = self->_internal;
    }
  }
  [(AVRunLoopCondition *)v16->runLoopCondition unlock];
  [(id)objc_opt_class() _writeDotStringToFile];
}

- (void)_handleConfigurationCommittedNotificationWithPayload:(id)a3
{
  v17[2] = *MEMORY[0x1E4F143B8];
  int v5 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F516D8]), "intValue");
  uint64_t v6 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F51680]), "longLongValue");
  internal = self->_internal;
  objc_sync_enter(internal);
  while (1)
  {
    if (![(NSMutableArray *)self->_internal->committedAVCaptureSessionConfigurations count]
      || (uint64_t v8 = (void *)-[NSMutableArray objectAtIndexedSubscript:](self->_internal->committedAVCaptureSessionConfigurations, "objectAtIndexedSubscript:", 0), [v8 configurationID] > v6))
    {
      objc_sync_exit(internal);
      if (!v5) {
        return;
      }
      goto LABEL_10;
    }
    if ([v8 configurationID] >= v6) {
      break;
    }
    [(NSMutableArray *)self->_internal->committedAVCaptureSessionConfigurations removeObject:v8];
  }
  if (v5)
  {
    objc_sync_exit(internal);
LABEL_10:
    [(AVRunLoopCondition *)self->_internal->runLoopCondition lock];
    uint64_t v9 = self->_internal;
    if (v9->waitingForFigCaptureSessionConfigurationToBecomeLive)
    {
      v9->waitingForFigCaptureSessionConfigurationToBecomeLive = 0;
      [(AVRunLoopCondition *)self->_internal->runLoopCondition signal];
      uint64_t v9 = self->_internal;
    }
    [(AVRunLoopCondition *)v9->runLoopCondition unlock];
    if ([(AVCaptureSession *)self notifiesOnMainThread])
    {
      Maiuint64_t n = CFRunLoopGetMain();
      uint64_t v11 = *MEMORY[0x1E4F1D410];
      v17[0] = *MEMORY[0x1E4F20260];
      v17[1] = v11;
      uint64_t v12 = (const void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __73__AVCaptureSession__handleConfigurationCommittedNotificationWithPayload___block_invoke;
      block[3] = &unk_1E5A74370;
      block[4] = self;
      int v16 = v5;
      CFRunLoopPerformBlock(Main, v12, block);
      uint64_t v13 = CFRunLoopGetMain();
      CFRunLoopWakeUp(v13);
    }
    else
    {
      uint64_t v14 = AVLocalizedErrorWithUnderlyingOSStatus();
      [(AVCaptureSession *)self _postRuntimeError:v14];
    }
    return;
  }
  [(AVCaptureSession *)self _makeConfigurationLive:v8];
  [(NSMutableArray *)self->_internal->committedAVCaptureSessionConfigurations removeObject:v8];

  objc_sync_exit(internal);
}

- (void)_makeConfigurationLive:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  internal = self->_internal;
  liveAVCaptureSessionConfiguratiouint64_t n = internal->liveAVCaptureSessionConfiguration;
  if (liveAVCaptureSessionConfiguration)
  {
    objc_msgSend(-[AVCaptureSessionConfiguration uniqueInputs:](internal->liveAVCaptureSessionConfiguration, "uniqueInputs:", a3), "makeObjectsPerformSelector:withObject:", sel_detachFromFigCaptureSession_, self->_internal->figCaptureSession);
    objc_msgSend(-[AVCaptureSessionConfiguration uniqueOutputs:](liveAVCaptureSessionConfiguration, "uniqueOutputs:", a3), "makeObjectsPerformSelector:withObject:", sel_detachFromFigCaptureSession_, self->_internal->figCaptureSession);
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v7 = [liveAVCaptureSessionConfiguration uniqueVideoPreviewLayers:a3];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v23 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v22 + 1) + 8 * i) detachFromFigCaptureSession:self->_internal->figCaptureSession];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v9);
    }
  }
  objc_msgSend((id)objc_msgSend(a3, "uniqueInputs:", liveAVCaptureSessionConfiguration), "makeObjectsPerformSelector:withObject:", sel_attachToFigCaptureSession_, self->_internal->figCaptureSession);
  objc_msgSend((id)objc_msgSend(a3, "uniqueOutputs:", liveAVCaptureSessionConfiguration), "makeObjectsPerformSelector:withObject:", sel_attachToFigCaptureSession_, self->_internal->figCaptureSession);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v12 = objc_msgSend(a3, "uniqueVideoPreviewLayers:", liveAVCaptureSessionConfiguration, 0);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v19;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v12);
        }
        [*(id *)(*((void *)&v18 + 1) + 8 * j) attachToFigCaptureSession:self->_internal->figCaptureSession];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v14);
  }
  id v17 = a3;

  self->_internal->liveAVCaptureSessionConfiguratiouint64_t n = (AVCaptureSessionConfiguration *)a3;
}

- (void)setAutomaticallyConfiguresCaptureDeviceForWideColor:(BOOL)automaticallyConfiguresCaptureDeviceForWideColor
{
  internal = self->_internal;
  if (internal->automaticallyConfiguresCaptureDeviceForWideColor != automaticallyConfiguresCaptureDeviceForWideColor)
  {
    internal->automaticallyConfiguresCaptureDeviceForWideColor = automaticallyConfiguresCaptureDeviceForWideColor;
    if (automaticallyConfiguresCaptureDeviceForWideColor)
    {
      [(AVCaptureSession *)self _beginConfiguration];
      [(AVCaptureSession *)self _commitConfiguration];
    }
  }
}

- (id)description
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  int v3 = (void *)MEMORY[0x1E4F28E78];
  uint64_t v4 = (objc_class *)objc_opt_class();
  int v5 = (void *)[v3 stringWithFormat:@"<%@: %p [%@]>", NSStringFromClass(v4), self, -[AVCaptureSession sessionPreset](self, "sessionPreset")];
  internal = self->_internal;
  objc_sync_enter(internal);
  id v7 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithArray:", -[AVCaptureSessionConfiguration connections](self->_internal->liveAVCaptureSessionConfiguration, "connections"));
  objc_sync_exit(internal);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  obuint64_t j = v7;
  uint64_t v19 = [v7 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v19)
  {
    uint64_t v18 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v25 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v10 = (void *)[v9 inputPorts];
        if ([v9 output]) {
          uint64_t v11 = [v9 output];
        }
        else {
          uint64_t v11 = [v9 videoPreviewLayer];
        }
        uint64_t v12 = v11;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        uint64_t v13 = [v10 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v13)
        {
          uint64_t v14 = *(void *)v21;
          do
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v21 != v14) {
                objc_enumerationMutation(v10);
              }
              [v5 appendFormat:@"\n\t%@[%@] -> %@", objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * j), "input"), objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * j), "mediaType"), v12];
            }
            uint64_t v13 = [v10 countByEnumeratingWithState:&v20 objects:v28 count:16];
          }
          while (v13);
        }
      }
      uint64_t v19 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v19);
  }
  return v5;
}

uint64_t __46__AVCaptureSession__initWithMediaEnvironment___block_invoke(uint64_t a1)
{
  v1 = (void *)[*(id *)(a1 + 32) referencedObject];

  return [v1 _handleCaptureServerConnectionDiedNotification];
}

- (AVCaptureSession)initWithAssumedIdentity:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (dword_1EB4C9260)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  uint64_t v6 = -[AVCaptureSession _initWithMediaEnvironment:](self, "_initWithMediaEnvironment:", 0, v8, v9);
  if (v6) {
    v6->_internal->tccIdentity = (OS_tcc_identity *)a3;
  }
  return v6;
}

- (AVCaptureSession)initWithMediaEnvironment:(id)a3
{
  if (dword_1EB4C9260)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (AVCaptureClientHasEntitlement((void *)AVCaptureEntitlementWebBrowserEngineRendering)) {
    return (AVCaptureSession *)[(AVCaptureSession *)self _initWithMediaEnvironment:a3];
  }
  id v7 = objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector(), 0, AVCaptureEntitlementWebBrowserEngineRendering);

  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v7);
  }
  NSLog(&cfstr_SuppressingExc.isa, v7);
  return 0;
}

- (void)dealloc
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (dword_1EB4C9260)
  {
    int v20 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (self->_internal)
  {
    uint64_t v4 = (void *)sActiveSessions;
    objc_sync_enter((id)sActiveSessions);
    objc_msgSend((id)sActiveSessions, "removeObject:", objc_msgSend(MEMORY[0x1E4F29238], "valueWithNonretainedObject:", self));
    objc_sync_exit(v4);
    [(AVRunLoopCondition *)self->_internal->runLoopCondition signal];
    [(AVCaptureSession *)self _beginConfiguration];
    int v5 = [(AVCaptureSession *)self inputs];
    for (uint64_t i = [(NSArray *)v5 count]; i; uint64_t i = [(NSArray *)v5 count])
    {
      [(AVCaptureSession *)self removeInput:[(NSArray *)v5 firstObject]];
      int v5 = [(AVCaptureSession *)self inputs];
    }
    for (uint64_t j = [(AVCaptureSession *)self outputs];
          [(NSArray *)j count];
          uint64_t j = [(AVCaptureSession *)self outputs])
    {
      [(AVCaptureSession *)self removeOutput:[(NSArray *)j firstObject]];
    }

    [(AVCaptureSession *)self _makeConfigurationLive:0];
    [(AVCaptureSession *)self _teardownFigCaptureSession];
    if ((AVCaptureIsRunningInMediaserverd() & 1) == 0)
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:", self->_internal->serverConnectionDiedNotificationToken);
    }
    FigSimpleMutexDestroy();

    ct_green_tea_logger_destroy();
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    devicesObservingVideoZoomFactor = self->_internal->_devicesObservingVideoZoomFactor;
    uint64_t v9 = [(NSMutableArray *)devicesObservingVideoZoomFactor countByEnumeratingWithState:&v15 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v16;
      do
      {
        for (uint64_t k = 0; k != v9; ++k)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(devicesObservingVideoZoomFactor);
          }
          objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * k), "removeObserver:forKeyPath:context:", self, @"videoZoomFactor", AVCaptureSessionVideoInputDeviceVideoZoomFactorChangedContext, v12, v13);
        }
        uint64_t v9 = [(NSMutableArray *)devicesObservingVideoZoomFactor countByEnumeratingWithState:&v15 objects:v21 count:16];
      }
      while (v9);
    }
  }
  v14.receiver = self;
  v14.super_class = (Class)AVCaptureSession;
  [(AVCaptureSession *)&v14 dealloc];
}

+ (id)dotString
{
  return 0;
}

- (void)addInputWithNoConnections:(AVCaptureInput *)input
{
  v9[16] = *MEMORY[0x1E4F143B8];
  if (dword_1EB4C9260)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  [(AVCaptureSession *)self _beginConfiguration];
  v9[0] = 0;
  if ([(AVCaptureSession *)self _addInputWithNoConnections:input exceptionReason:v9])
  {
    [(AVCaptureSession *)self _commitConfiguration];
  }
  else
  {
    uint64_t v6 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    [(AVCaptureSession *)self _commitConfiguration];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v6);
    }
    NSLog(&cfstr_SuppressingExc.isa, v6);
  }
}

- (void)removeInput:(AVCaptureInput *)input
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (dword_1EB4C9260)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  [(AVCaptureSession *)self willChangeValueForKey:@"inputs", v7, v8];
  internal = self->_internal;
  objc_sync_enter(internal);
  if ([(NSMutableArray *)self->_internal->inputs containsObject:input])
  {
    [(AVCaptureSession *)self _beginConfiguration];
    [(AVCaptureSession *)self _removeInput:input];
    objc_sync_exit(internal);
    [(AVCaptureSession *)self didChangeValueForKey:@"inputs"];
    [(AVCaptureSession *)self _commitConfiguration];
  }
  else
  {
    objc_sync_exit(internal);
    [(AVCaptureSession *)self didChangeValueForKey:@"inputs"];
  }
}

- (void)_removeInput:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  int v5 = objc_msgSend(a3, "ports", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        [v10 removeObserver:self forKeyPath:@"changeSeed" context:AVCaptureSessionInputPortChangedContext];
        [(AVCaptureSession *)self _removeConnectionsForInputPort:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
  [a3 setSession:0];
  if ([a3 isMemberOfClass:objc_opt_class()])
  {
    uint64_t v11 = (void *)[a3 device];
    if ([v11 hasMediaType:*MEMORY[0x1E4F47C68]]
      && [v11 lockForConfiguration:0])
    {
      [v11 setCachesFigCaptureSourceConfigurationChanges:0];
      [v11 unlockForConfiguration];
    }
    [v11 removeObserver:self forKeyPath:@"geometricDistortionCorrectionEnabled" context:AVCaptureSessionVideoInputDeviceGeometricDistortionCorrectionEnabledChangedContext];
    [v11 removeObserver:self forKeyPath:@"lowLightVideoCaptureEnabled" context:AVCaptureSessionVideoInputDeviceLowLightVideoEnabledChangedContext];
    [v11 removeObserver:self forKeyPath:@"variableFrameRateVideoCaptureEnabled" context:AVCaptureSessionVideoInputDeviceVariableFrameRateVideoEnabledChangedContext];
    [v11 removeObserver:self forKeyPath:@"videoStabilizationStrength" context:AVCaptureSessionVideoInputDeviceVideoStabilizationStrengthChangedContext];
    [v11 removeObserver:self forKeyPath:@"centerStageActive" context:AVCaptureSessionVideoInputDeviceCenterStageActiveChangedContext];
    [v11 removeObserver:self forKeyPath:@"backgroundBlurActive" context:AVCaptureSessionVideoInputDeviceBackgroundBlurActiveChangedContext];
    [v11 removeObserver:self forKeyPath:@"studioLightActive" context:AVCaptureSessionVideoInputDeviceStudioLightingActiveChangedContext];
    [v11 removeObserver:self forKeyPath:@"canPerformReactionEffects" context:AVCaptureSessionVideoInputDeviceReactionEffectsActiveChangedContext];
    [v11 removeObserver:self forKeyPath:@"backgroundReplacementActive" context:AVCaptureSessionVideoInputDeviceBackgroundReplacementActiveChangedContext];
    [v11 removeObserver:self forKeyPath:@"activeColorSpace" context:AVCaptureSessionVideoInputDeviceActiveColorSpaceChangedContext];
    [v11 removeObserver:self forKeyPath:@"videoHDREnabled" context:AVCaptureSessionVideoInputDeviceHDREnabledChangedContext];
    [v11 removeObserver:self forKeyPath:@"automaticallyAdjustsVideoHDREnabled" context:AVCaptureSessionVideoInputDeviceAutomaticallyAdjustsHDREnabledChangedContext];
    [v11 removeObserver:self forKeyPath:@"activeDepthDataFormat" context:AVCaptureSessionVideoInputDeviceActiveDepthDataFormatChangedContext];
    [v11 removeObserver:self forKeyPath:@"activeFormat" context:AVCaptureSessionVideoInputDeviceActiveFormatChangedContext];
    [v11 removeObserver:self forKeyPath:@"connected" context:AVCaptureSessionVideoInputDeviceConnectedChangedContext];
    [v11 removeObserver:self forKeyPath:@"manualFramingEnabled" context:AVCaptureSessionVideoInputDeviceManualFramingEnabledChangedContext];
    [v11 removeObserver:self forKeyPath:@"manualFramingPanningAngleX" context:&AVCaptureSessionVideoInputDeviceManualFramingEnabledChangedContext];
    [v11 removeObserver:self forKeyPath:@"manualFramingPanningAngleY" context:AVCaptureSessionVideoInputDeviceManualFramingPanningAngleYChangedContext];
    [v11 removeObserver:self forKeyPath:@"gazeSelectionEnabled" context:AVCaptureSessionVideoInputDeviceGazeSelectionEnabledChangedContext];
    [v11 removeObserver:self forKeyPath:@"audioInputRouteIsBuiltInMic" context:AVCaptureSessionAudioInputDeviceIsBuiltInMicChangedContext];
  }
  [(NSMutableArray *)self->_internal->inputs removeObject:a3];
}

- (void)addOutputWithNoConnections:(AVCaptureOutput *)output
{
  v9[16] = *MEMORY[0x1E4F143B8];
  if (dword_1EB4C9260)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  [(AVCaptureSession *)self _beginConfiguration];
  v9[0] = 0;
  if ([(AVCaptureSession *)self _addOutputWithNoConnections:output exceptionReason:v9])
  {
    [(AVCaptureSession *)self _commitConfiguration];
  }
  else
  {
    uint64_t v6 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    [(AVCaptureSession *)self _commitConfiguration];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v6);
    }
    NSLog(&cfstr_SuppressingExc.isa, v6);
  }
}

- (void)removeOutput:(AVCaptureOutput *)output
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (dword_1EB4C9260)
  {
    int v18 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  [(AVCaptureSession *)self willChangeValueForKey:@"outputs", v11, v12];
  internal = self->_internal;
  objc_sync_enter(internal);
  if ([(NSMutableArray *)self->_internal->outputs containsObject:output])
  {
    [(AVCaptureSession *)self _beginConfiguration];
    [(AVCaptureOutput *)output removeObserver:self forKeyPath:@"changeSeed" context:AVCaptureSessionOutputChangedContext];
    uint64_t v7 = (void *)[(NSArray *)[(AVCaptureOutput *)output connections] copy];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v7);
          }
          [(AVCaptureSession *)self _removeConnection:*(void *)(*((void *)&v13 + 1) + 8 * i)];
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v19 count:16];
      }
      while (v8);
    }

    [(AVCaptureOutput *)output setSession:0];
    [(NSMutableArray *)self->_internal->outputs removeObject:output];
    objc_sync_exit(internal);
    [(AVCaptureSession *)self didChangeValueForKey:@"outputs"];
    [(AVCaptureSession *)self _commitConfiguration];
  }
  else
  {
    objc_sync_exit(internal);
    [(AVCaptureSession *)self didChangeValueForKey:@"outputs"];
  }
}

- (BOOL)_addVideoPreviewLayerWithNoConnection:(id)a3 exceptionReason:(id *)a4
{
  v13[16] = *MEMORY[0x1E4F143B8];
  if (dword_1EB4C9260)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v13[0] = 0;
  BOOL v8 = -[AVCaptureSession _canAddVideoPreviewLayer:failureReason:](self, "_canAddVideoPreviewLayer:failureReason:", a3, v13, v11, v12);
  if (v8)
  {
    internal = self->_internal;
    objc_sync_enter(internal);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      [(AVCaptureSession *)self _removeAllPreviewLayers];
    }
    if (![(NSHashTable *)self->_internal->videoPreviewLayers containsObject:a3])
    {
      [(NSHashTable *)self->_internal->videoPreviewLayers addObject:a3];
      [a3 addObserver:self forKeyPath:@"changeSeed" options:3 context:AVCaptureSessionOutputChangedContext];
    }
    objc_sync_exit(internal);
  }
  else if (a4)
  {
    *a4 = (id)v13[0];
  }
  return v8;
}

- (void)_removeVideoPreviewLayer:(id)a3
{
  if (a3)
  {
    internal = self->_internal;
    objc_sync_enter(internal);
    [(AVCaptureSession *)self beginConfiguration];
    uint64_t v6 = [a3 connection];
    if (v6) {
      [(AVCaptureSession *)self _removeConnection:v6];
    }
    [(NSHashTable *)self->_internal->videoPreviewLayers removeObject:a3];
    [a3 removeObserver:self forKeyPath:@"changeSeed" context:AVCaptureSessionOutputChangedContext];
    objc_sync_exit(internal);
    [(AVCaptureSession *)self commitConfiguration];
  }
}

- (void)addConnection:(AVCaptureConnection *)connection
{
  v9[16] = *MEMORY[0x1E4F143B8];
  if (dword_1EB4C9260)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  [(AVCaptureSession *)self _beginConfiguration];
  v9[0] = 0;
  if ([(AVCaptureSession *)self _addConnection:connection exceptionReason:v9])
  {
    [(AVCaptureSession *)self _commitConfiguration];
  }
  else
  {
    uint64_t v6 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    [(AVCaptureSession *)self _commitConfiguration];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v6);
    }
    NSLog(&cfstr_SuppressingExc.isa, v6);
  }
}

- (void)removeConnection:(AVCaptureConnection *)connection
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (dword_1EB4C9260)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  [(AVCaptureSession *)self _beginConfiguration];
  [(AVCaptureSession *)self _removeConnection:connection];
  [(AVCaptureSession *)self _commitConfiguration];
}

- (void)_removeConnection:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  int v5 = (void *)[a3 output];
  uint64_t v6 = (void *)[a3 videoPreviewLayer];
  internal = self->_internal;
  objc_sync_enter(internal);
  if ([(NSMutableArray *)self->_internal->connections containsObject:a3])
  {
    if (v5) {
      [v5 removeConnection:a3];
    }
    else {
      [v6 removeConnection:a3];
    }
    [a3 teardownObservers];
    [a3 removeObserver:self forKeyPath:@"changeSeed" context:AVCaptureSessionConnectionChangedContext];
    [a3 removeObserver:self forKeyPath:@"active" context:AVCaptureSessionConnectionActiveChangedContext];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v8 = objc_msgSend(a3, "inputPorts", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v8);
          }
          [*(id *)(*((void *)&v12 + 1) + 8 * i) removeObserver:self forKeyPath:@"enabled" context:AVCaptureSessionConnectedInputPortEnabledChangedContext];
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
    [(NSMutableArray *)self->_internal->connections removeObject:a3];
    [(AVCaptureSession *)self _updateHardwareCost];
  }
  objc_sync_exit(internal);
}

- (AVCaptureSessionControlsDelegate)controlsDelegate
{
  internal = self->_internal;
  objc_sync_enter(internal);
  uint64_t v4 = (AVCaptureSessionControlsDelegate *)[(AVWeakReference *)self->_internal->weakReferenceControlsDelegate referencedObject];
  objc_sync_exit(internal);
  return v4;
}

- (OS_dispatch_queue)controlsDelegateCallbackQueue
{
  internal = self->_internal;
  objc_sync_enter(internal);
  uint64_t v4 = self->_internal->clientControlsQueue;
  objc_sync_exit(internal);

  return v4;
}

- (BOOL)_canAddControl:(id)a3 failureReason:(id *)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (![(AVCaptureSession *)self supportsControls])
  {
    long long v14 = @"The session doesn't support controls";
LABEL_40:
    uint64_t v17 = v14;
    goto LABEL_32;
  }
  if (!a3)
  {
    long long v14 = @"Can't add a nil AVCaptureControl";
    goto LABEL_40;
  }
  if ((AVCaptureSession *)[a3 session] == self)
  {
LABEL_39:
    long long v14 = @"An AVCaptureControl instance may not be added more than once to a session";
    goto LABEL_40;
  }
  if ([a3 session])
  {
    long long v14 = @"An AVCaptureControl instance may not be added to more than one session";
    goto LABEL_40;
  }
  if (![a3 actionQueue])
  {
    long long v14 = @"An AVCaptureControl instance cannot have a nil action queue";
    goto LABEL_40;
  }
  obuint64_t j = self->_internal;
  objc_sync_enter(obj);
  if ([(NSMutableArray *)self->_internal->controls containsObject:a3])
  {
    objc_sync_exit(obj);
    goto LABEL_39;
  }
  unint64_t v5 = [(NSMutableArray *)self->_internal->controls count];
  if (v5 >= [(AVCaptureSession *)self maxControlsCount])
  {
    uint64_t v15 = objc_msgSend(NSString, "stringWithFormat:", @"The session cannot have more than %lu controls", -[AVCaptureSession maxControlsCount](self, "maxControlsCount"));
    objc_sync_exit(obj);
    uint64_t v17 = (__CFString *)v15;
    if (!v15) {
      return 0;
    }
LABEL_32:
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    if (a4)
    {
      BOOL result = 0;
      *a4 = v17;
      return result;
    }
    return 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    controls = self->_internal->controls;
    uint64_t v7 = [(NSMutableArray *)controls countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v7)
    {
      uint64_t v17 = @"The session doesn't support having multiple AVCaptureSystemZoomSlider instances with the same device";
      uint64_t v8 = *(void *)v21;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v21 != v8) {
            objc_enumerationMutation(controls);
          }
          uint64_t v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0
              && (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "device"), "uniqueID"), "isEqualToString:", objc_msgSend((id)objc_msgSend(a3, "device"), "uniqueID")) & 1) != 0)
            {
              goto LABEL_31;
            }
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0
              && (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "device"), "uniqueID"), "isEqualToString:", objc_msgSend((id)objc_msgSend(a3, "device"), "uniqueID")) & 1) != 0)
            {
              long long v12 = @"The session doesn't support having multiple AVCaptureSystemExposureBiasSlider instances with the same device";
LABEL_30:
              uint64_t v17 = v12;
LABEL_31:
              objc_sync_exit(obj);
              goto LABEL_32;
            }
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0
              && (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "device"), "uniqueID"), "isEqualToString:", objc_msgSend((id)objc_msgSend(a3, "device"), "uniqueID")) & 1) != 0)
            {
              long long v12 = @"The session doesn't support having multiple AVCaptureSystemLensSelector instances with the same device";
              goto LABEL_30;
            }
          }
        }
        uint64_t v7 = [(NSMutableArray *)controls countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
  }
  objc_sync_exit(obj);
  return 1;
}

- (BOOL)canAddControl:(id)a3
{
  return [(AVCaptureSession *)self _canAddControl:a3 failureReason:0];
}

- (void)addControl:(id)a3
{
  v10[16] = *MEMORY[0x1E4F143B8];
  if (dword_1EB4C9260)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  [(AVCaptureSession *)self _beginConfiguration];
  internal = self->_internal;
  objc_sync_enter(internal);
  v10[0] = 0;
  if ([(AVCaptureSession *)self _canAddControl:a3 failureReason:v10])
  {
    [a3 setSession:self];
    [(NSMutableArray *)self->_internal->controls addObject:a3];
    objc_sync_exit(internal);
    [(AVCaptureSession *)self _commitConfiguration];
  }
  else
  {
    uint64_t v7 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    [(AVCaptureSession *)self _commitConfiguration];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v7);
    }
    NSLog(&cfstr_SuppressingExc.isa, v7);
    objc_sync_exit(internal);
  }
}

- (void)removeControl:(id)a3
{
  if (dword_1EB4C9260)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  internal = self->_internal;
  objc_sync_enter(internal);
  if ([(NSMutableArray *)self->_internal->controls containsObject:a3])
  {
    [a3 setSession:0];
    [(AVCaptureSession *)self _beginConfiguration];
    [(NSMutableArray *)self->_internal->controls removeObject:a3];
    objc_sync_exit(internal);
    [(AVCaptureSession *)self _commitConfiguration];
  }
  else
  {
    objc_sync_exit(internal);
  }
}

- (int64_t)maxControlsCount
{
  return 7;
}

- (void)_setInterrupted:(BOOL)a3 withReason:(int)a4
{
  LODWORD(v4) = a4;
  BOOL v5 = a3;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  [(AVCaptureSession *)self willChangeValueForKey:@"interrupted"];
  self->_internal->interrupted = v5;
  if (v5) {
    uint64_t v7 = @"AVCaptureSessionWasInterruptedNotification";
  }
  else {
    uint64_t v7 = @"AVCaptureSessionInterruptionEndedNotification";
  }
  if (v5)
  {
    uint64_t v8 = 0;
    uint64_t v4 = v4;
    switch((int)v4)
    {
      case 1:
        goto LABEL_21;
      case 2:
      case 3:
        uint64_t v8 = 0;
        uint64_t v4 = 2;
        goto LABEL_21;
      case 4:
        uint64_t v8 = 0;
        uint64_t v4 = 3;
        goto LABEL_21;
      case 5:
        uint64_t v8 = 0;
        uint64_t v4 = 4;
        goto LABEL_21;
      case 6:
        long long v22 = 0u;
        long long v23 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        id v10 = [(AVCaptureSession *)self sessionVideoCaptureDevices];
        uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v25 count:16];
        if (!v11)
        {
          uint64_t v8 = 0;
          uint64_t v4 = 5;
          goto LABEL_21;
        }
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v21;
        uint64_t v4 = 5;
        break;
      default:
        uint64_t v9 = 0;
        goto LABEL_22;
    }
LABEL_13:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v21 != v13) {
        objc_enumerationMutation(v10);
      }
      uint64_t v8 = (void *)[*(id *)(*((void *)&v20 + 1) + 8 * v14) systemPressureState];
      if (objc_msgSend((id)objc_msgSend(v8, "level"), "isEqual:", @"AVCaptureSystemPressureLevelShutdown")) {
        break;
      }
      if (v12 == ++v14)
      {
        uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v25 count:16];
        uint64_t v8 = 0;
        if (!v12) {
          break;
        }
        goto LABEL_13;
      }
    }
LABEL_21:
    uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", objc_msgSend(NSNumber, "numberWithInteger:", v4), @"AVCaptureSessionInterruptionReasonKey", v8, @"AVCaptureSessionInterruptionSystemPressureStateKey", 0);
LABEL_22:
    if (self->_internal->videoInputDeviceUsed)
    {
      CTGreenTeaOsLogHandle = getCTGreenTeaOsLogHandle();
      if (CTGreenTeaOsLogHandle)
      {
        long long v16 = CTGreenTeaOsLogHandle;
        if (os_log_type_enabled(CTGreenTeaOsLogHandle, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A152C000, v16, OS_LOG_TYPE_INFO, "Stopped camera session", buf, 2u);
        }
      }
    }
  }
  else
  {
    uint64_t v9 = 0;
  }
  if (dword_1EB4C9260)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", v18, v19), "postNotificationName:object:userInfo:", v7, self, v9);
  [(AVCaptureSession *)self didChangeValueForKey:@"interrupted"];
}

- (BOOL)isMultitaskingCameraAccessEnabled
{
  return self->_internal->authorizedToUseCameraInMultipleForegroundAppLayout;
}

- (void)setMultitaskingCameraAccessEnabled:(BOOL)multitaskingCameraAccessEnabled
{
  BOOL v3 = multitaskingCameraAccessEnabled;
  if (multitaskingCameraAccessEnabled
    && ![(AVCaptureSession *)self isMultitaskingCameraAccessSupported])
  {
    BOOL v5 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v5);
    }
    NSLog(&cfstr_SuppressingExc.isa, v5);
  }
  else
  {
    [(AVCaptureSession *)self _setMultitaskingCameraAccessEnabled:v3];
  }
}

- (BOOL)usesApplicationAudioSession
{
  return self->_internal->usesApplicationAudioSession;
}

- (void)setUsesApplicationAudioSession:(BOOL)usesApplicationAudioSession
{
  if (self->_internal->usesApplicationAudioSession != usesApplicationAudioSession)
  {
    [(AVCaptureSession *)self _beginConfiguration];
    self->_internal->usesApplicationAudioSessiouint64_t n = usesApplicationAudioSession;
    [(AVCaptureSession *)self _commitConfiguration];
  }
}

- (BOOL)automaticallyConfiguresApplicationAudioSession
{
  return self->_internal->automaticallyConfiguresApplicationAudioSession;
}

- (void)setAutomaticallyConfiguresApplicationAudioSession:(BOOL)automaticallyConfiguresApplicationAudioSession
{
  internal = self->_internal;
  if (internal->automaticallyConfiguresApplicationAudioSession != automaticallyConfiguresApplicationAudioSession)
  {
    internal->automaticallyConfiguresApplicationAudioSessiouint64_t n = automaticallyConfiguresApplicationAudioSession;
    if (self->_internal->usesApplicationAudioSession)
    {
      [(AVCaptureSession *)self _beginConfiguration];
      [(AVCaptureSession *)self _commitConfiguration];
    }
  }
}

- (BOOL)configuresApplicationAudioSessionToMixWithOthers
{
  return self->_internal->configuresApplicationAudioSessionToMixWithOthers;
}

- (BOOL)automaticallyConfiguresCaptureDeviceForWideColor
{
  return self->_internal->automaticallyConfiguresCaptureDeviceForWideColor;
}

- (void)stopRunning
{
  if (dword_1EB4C9260)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  internal = self->_internal;
  objc_sync_enter(internal);
  if ([(AVCaptureSession *)self isBeingConfigured])
  {
    BOOL v5 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v5);
    }
    NSLog(&cfstr_SuppressingExc.isa, v5);
    goto LABEL_6;
  }
  if (![(AVCaptureSession *)self isRunning] && !self->_internal->figCaptureSessionStarted)
  {
LABEL_6:
    objc_sync_exit(internal);
    return;
  }
  objc_sync_exit(internal);
  [(AVCaptureSession *)self _setRunning:0];
}

- (int)_stopFigCaptureSession
{
  v18[1] = *MEMORY[0x1E4F143B8];
  [(AVCaptureSession *)self isRunning];
  id v3 = [(AVCaptureSession *)self _stopError];
  [(AVRunLoopCondition *)self->_internal->runLoopCondition lock];
  self->_internal->BOOL waitingForFigCaptureSessionToStop = 1;
  internal = self->_internal;
  objc_sync_enter(internal);
  figCaptureSessiouint64_t n = self->_internal->figCaptureSession;
  if (figCaptureSession)
  {
    uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v6) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
    uint64_t v8 = *(void (**)(OpaqueFigCaptureSession *))(v7 + 40);
    if (v8)
    {
      v8(figCaptureSession);
    }
    else
    {
      uint64_t v17 = *MEMORY[0x1E4F516D8];
      v18[0] = &unk_1EF4FA760;
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
      CMNotificationCenterGetDefaultLocalCenter();
      CMNotificationCenterPostNotification();
    }
  }
  objc_sync_exit(internal);
  [(AVRunLoopCondition *)self->_internal->runLoopCondition signal];
  runLoopConditiouint64_t n = self->_internal->runLoopCondition;
  uint64_t v10 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:9.0];
  char v11 = [(AVRunLoopCondition *)runLoopCondition waitUntilDate:v10 inMode:*MEMORY[0x1E4F20260]];
  BOOL waitingForFigCaptureSessionToStop = self->_internal->waitingForFigCaptureSessionToStop;
  self->_internal->BOOL waitingForFigCaptureSessionToStop = 0;
  if (v11)
  {
    if (waitingForFigCaptureSessionToStop)
    {
      int v13 = -1;
    }
    else
    {
      int v13 = 0;
      self->_internal->figCaptureSessionStarted = 0;
    }
  }
  else
  {
    id v3 = (id)AVLocalizedError();
    int v13 = -11819;
  }
  [(AVRunLoopCondition *)self->_internal->runLoopCondition unlock];
  if (v3 && [v3 code] != -11806) {
    [(AVCaptureSession *)self _postRuntimeError:v3];
  }
  uint64_t v15 = self->_internal;
  p_internal = &self->_internal;
  os_unfair_lock_lock(&v15->recordingMovieFileOutputsLock);
  [(NSMutableArray *)(*p_internal)->recordingMovieFileOutputs removeAllObjects];
  os_unfair_lock_unlock(&(*p_internal)->recordingMovieFileOutputsLock);
  return v13;
}

- (CMClockRef)synchronizationClock
{
  internal = self->_internal;
  objc_sync_enter(internal);
  synchronizationClocuint64_t k = self->_internal->synchronizationClock;
  if (synchronizationClock)
  {
    CFTypeRef v5 = CFRetain(synchronizationClock);
    uint64_t v6 = (OpaqueCMClock *)CFAutorelease(v5);
  }
  else
  {
    uint64_t v6 = 0;
  }
  objc_sync_exit(internal);
  return v6;
}

- (float)_totalHardwareCost
{
  [(AVCaptureSession *)self _nandCost];
  if (v3 >= 0.0) {
    float v4 = v3;
  }
  else {
    float v4 = 0.0;
  }
  if ((int)FigCapturePlatformIdentifier() >= 6)
  {
    [(AVCaptureSession *)self _memoryCost];
    if (v4 <= v5) {
      float v4 = v5;
    }
    [(AVCaptureSession *)self _encoderCost];
    if (v4 <= v6) {
      float v4 = v6;
    }
  }
  [(AVCaptureSession *)self _videoAndMovieOutputCost];
  if (v4 > result) {
    return v4;
  }
  return result;
}

- (float)_nandCost
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v2 = [(AVCaptureSession *)self connections];
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v20;
    uint64_t v6 = *MEMORY[0x1E4F47C68];
    uint64_t v7 = *MEMORY[0x1E4F24D70];
    uint64_t v18 = *MEMORY[0x1E4F47C08];
    uint64_t v8 = *MEMORY[0x1E4F47D08];
    float v9 = 0.0;
    while (1)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v20 != v5) {
          objc_enumerationMutation(v2);
        }
        char v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if ([v11 isActive]
          && objc_msgSend((id)objc_msgSend(v11, "mediaType"), "isEqualToString:", v6))
        {
          uint64_t v12 = (void *)[v11 output];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            objc_msgSend((id)objc_msgSend((id)objc_msgSend(v12, "videoSettings"), "objectForKeyedSubscript:", v7), "intValue");
            if (!FigCapturePixelFormatIs422()) {
              continue;
            }
            int v13 = (void *)[v12 availableVideoCodecTypesForAssetWriterWithOutputFileType:v18];
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              continue;
            }
            int v13 = (void *)[v12 availableVideoCodecTypes];
          }
          float v14 = 0.0;
          if ([v13 containsObject:v8]
            && !+[AVExternalStorageDeviceDiscoverySession isSupported])
          {
            [(AVCaptureSession *)self _nandCostWithDataRate:[(AVCaptureSession *)self _getMovieFileOutputNANDDataRate:v11]];
            float v14 = v15;
          }
          float v9 = v9 + v14;
        }
      }
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (!v4) {
        return v9;
      }
    }
  }
  return 0.0;
}

- (float)_nandCostWithDataRate:(int)a3
{
  return (float)a3 / flt_1A1636A90[AVCaptureGetDiskCapacityInGB() < 0x100];
}

- (id)mediaEnvironment
{
  v2 = self->_internal->mediaEnvironment;

  return v2;
}

- (BOOL)requestNANDBandwidthToStartMovieFileRecording:(id)a3 outputFileURL:(id)a4 videoCodecType:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  -[NSMutableArray removeObject:](self->_internal->recordingMovieFileOutputs, "removeObject:");
  if (![a5 isEqualToString:*MEMORY[0x1E4F47D10]]
    || FigFileIsFileOnExternalStorageDevice())
  {
    return 1;
  }
  os_unfair_lock_lock(&self->_internal->recordingMovieFileOutputsLock);
  uint64_t v8 = *MEMORY[0x1E4F47C68];
  int v9 = -[AVCaptureSession _getMovieFileOutputNANDDataRate:](self, "_getMovieFileOutputNANDDataRate:", [a3 connectionWithMediaType:*MEMORY[0x1E4F47C68]]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  recordingMovieFileOutputs = self->_internal->recordingMovieFileOutputs;
  uint64_t v11 = [(NSMutableArray *)recordingMovieFileOutputs countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(recordingMovieFileOutputs);
        }
        v9 += -[AVCaptureSession _getMovieFileOutputNANDDataRate:](self, "_getMovieFileOutputNANDDataRate:", [*(id *)(*((void *)&v17 + 1) + 8 * i) connectionWithMediaType:v8]);
      }
      uint64_t v12 = [(NSMutableArray *)recordingMovieFileOutputs countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }
  BOOL v15 = v9 < 283392001;
  if (v9 <= 283392000) {
    [(NSMutableArray *)self->_internal->recordingMovieFileOutputs addObject:a3];
  }
  os_unfair_lock_unlock(&self->_internal->recordingMovieFileOutputsLock);
  return v15;
}

- (void)movieFileOutputStoppedRecording:(id)a3
{
  os_unfair_lock_lock(&self->_internal->recordingMovieFileOutputsLock);
  if ([(NSMutableArray *)self->_internal->recordingMovieFileOutputs containsObject:a3])[(NSMutableArray *)self->_internal->recordingMovieFileOutputs removeObject:a3]; {
  p_recordingMovieFileOutputsLocuint64_t k = &self->_internal->recordingMovieFileOutputsLock;
  }

  os_unfair_lock_unlock(p_recordingMovieFileOutputsLock);
}

- (int)_getMovieFileOutputNANDDataRate:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v27 = *MEMORY[0x1E4F1F9F8];
  int v4 = *(_DWORD *)(MEMORY[0x1E4F1F9F8] + 12);
  int v28 = *(_DWORD *)(MEMORY[0x1E4F1F9F8] + 8);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v5 = (void *)[a3 inputPorts];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v23;
    uint64_t v9 = *MEMORY[0x1E4F47C68];
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend(v11, "mediaType"), "isEqual:", v9))
        {
          uint64_t v12 = (void *)[v11 input];
          if (v12)
          {
            [v12 videoMinFrameDurationOverride];
            LOBYTE(v4) = v21;
          }
          else
          {
            LOBYTE(v4) = 0;
            uint64_t v17 = 0;
            int v19 = 0;
          }
          uint64_t v27 = v17;
          int v28 = v19;
          goto LABEL_14;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_14:
  uint64_t v13 = objc_msgSend((id)objc_msgSend(a3, "sourceDevice"), "activeFormat");
  float v14 = v13;
  uint64_t v18 = 0;
  int v20 = 0;
  if (v4)
  {
    uint64_t v18 = v27;
    int v20 = v28;
  }
  else if (v13)
  {
    [v13 lowestSupportedVideoFrameDuration];
  }
  CMVideoDimensions Dimensions = CMVideoFormatDescriptionGetDimensions((CMVideoFormatDescriptionRef)[v14 formatDescription]);
  return (int)(float)((float)((float)v20 / (float)v18) * (float)(Dimensions.height * Dimensions.width));
}

- (float)_memoryCost
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  int v3 = FigCapturePlatformIdentifier();
  id v4 = [(AVCaptureSession *)self _livePortSetsByDeviceInput];
  long long v37 = self;
  id v38 = [(AVCaptureSession *)self _devicesProvidingDepthData];
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  obuint64_t j = v4;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v52 objects:v58 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v53;
    uint64_t v8 = *MEMORY[0x1E4F47C68];
    if (v3 >= 6) {
      float v9 = 1.0;
    }
    else {
      float v9 = 1.25;
    }
    if (v3 <= 6) {
      float v10 = 1.0;
    }
    else {
      float v10 = 1.2;
    }
    int v11 = 300;
    uint64_t v39 = *MEMORY[0x1E4F47C68];
    uint64_t v40 = *(void *)v53;
    do
    {
      uint64_t v12 = 0;
      uint64_t v41 = v6;
      do
      {
        if (*(void *)v53 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v52 + 1) + 8 * v12);
        float v14 = (void *)[v13 device];
        if ([v14 hasMediaType:v8])
        {
          int v15 = [v14 isVirtualDevice];
          int v42 = v11;
          if (v15)
          {
            long long v16 = (void *)[v14 constituentDevices];
            uint64_t v17 = (void *)[MEMORY[0x1E4F1CA80] set];
            if ([v38 containsObject:v14])
            {
              if ((__CFString *)[v14 deviceType] != @"AVCaptureDeviceTypeBuiltInLiDARDepthCamera")
              {
                long long v50 = 0u;
                long long v51 = 0u;
                long long v48 = 0u;
                long long v49 = 0u;
                uint64_t v18 = (void *)[v14 constituentDevices];
                uint64_t v19 = [v18 countByEnumeratingWithState:&v48 objects:v57 count:16];
                if (v19)
                {
                  uint64_t v20 = v19;
                  uint64_t v21 = *(void *)v49;
                  do
                  {
                    for (uint64_t i = 0; i != v20; ++i)
                    {
                      if (*(void *)v49 != v21) {
                        objc_enumerationMutation(v18);
                      }
                      objc_msgSend(v17, "addObject:", objc_msgSend(*(id *)(*((void *)&v48 + 1) + 8 * i), "deviceType"));
                    }
                    uint64_t v20 = [v18 countByEnumeratingWithState:&v48 objects:v57 count:16];
                  }
                  while (v20);
                }
              }
            }
          }
          else
          {
            uint64_t v17 = (void *)[MEMORY[0x1E4F1CA80] set];
            long long v16 = 0;
          }
          long long v46 = 0u;
          long long v47 = 0u;
          long long v44 = 0u;
          long long v45 = 0u;
          long long v23 = (void *)[obj objectForKeyedSubscript:v13];
          uint64_t v24 = [v23 countByEnumeratingWithState:&v44 objects:v56 count:16];
          if (v24)
          {
            uint64_t v25 = v24;
            uint64_t v26 = *(void *)v45;
            do
            {
              for (uint64_t j = 0; j != v25; ++j)
              {
                if (*(void *)v45 != v26) {
                  objc_enumerationMutation(v23);
                }
                int v28 = *(void **)(*((void *)&v44 + 1) + 8 * j);
                if ((objc_msgSend(v17, "containsObject:", objc_msgSend(v28, "sourceDeviceType")) & 1) == 0) {
                  objc_msgSend(v17, "addObject:", objc_msgSend(v28, "sourceDeviceType"));
                }
              }
              uint64_t v25 = [v23 countByEnumeratingWithState:&v44 objects:v56 count:16];
            }
            while (v25);
          }
          uint64_t v29 = [v17 count];
          if (v15)
          {
            uint64_t v8 = v39;
            uint64_t v7 = v40;
            if (objc_msgSend(v17, "containsObject:", objc_msgSend(v14, "deviceType"))) {
              uint64_t v29 = (__PAIR128__(v29, [v16 count]) - (unint64_t)v29) >> 64;
            }
          }
          else
          {
            uint64_t v8 = v39;
            uint64_t v7 = v40;
          }
          char v30 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v14, "activeFormat"), "figCaptureSourceVideoFormat"), "isVideoHDRFusionSupported");
          char v31 = [v14 isVideoHDREnabled] | v30;
          int v32 = 5 * v29 + 2 * ([v16 count] - v29);
          int v33 = objc_msgSend((id)objc_msgSend(v14, "activeFormat"), "sensorDimensions");
          int v11 = v42
              + (float)((float)(v10
                                            * (float)(v9
                                                    * (float)(int)((((unint64_t)objc_msgSend((id)objc_msgSend(v14, "activeFormat"), "sensorDimensions") >> 32)* v33) << v31)))* 0.00000095367)* v32;
          uint64_t v6 = v41;
        }
        ++v12;
      }
      while (v12 != v6);
      uint64_t v6 = [obj countByEnumeratingWithState:&v52 objects:v58 count:16];
    }
    while (v6);
  }
  else
  {
    int v11 = 300;
  }
  unsigned int v34 = [(AVCaptureSession *)v37 _computeMemoryUsageForOutputs];
  if ((int)((unint64_t)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28F80], "processInfo"), "physicalMemory") >> 30) >= 5) {
    int v35 = 2100;
  }
  else {
    int v35 = 1800;
  }
  return (float)(int)(v34 + v11) / (float)v35;
}

- (unsigned)_computeMemoryUsageForOutputs
{
  uint64_t v108 = *MEMORY[0x1E4F143B8];
  long long v100 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  obuint64_t j = [(AVCaptureSession *)self connections];
  uint64_t v69 = [(NSArray *)obj countByEnumeratingWithState:&v100 objects:v107 count:16];
  unsigned int v2 = 0;
  if (v69)
  {
    uint64_t v68 = *(void *)v101;
    uint64_t v3 = *MEMORY[0x1E4F47C68];
    uint64_t v72 = *MEMORY[0x1E4F24D08];
    uint64_t v73 = *MEMORY[0x1E4F24E10];
    uint64_t v71 = *MEMORY[0x1E4F24D70];
    uint64_t v74 = *MEMORY[0x1E4F47C68];
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v101 != v68) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void **)(*((void *)&v100 + 1) + 8 * v4);
        uint64_t v70 = v4;
        if (![v5 isActive]) {
          goto LABEL_87;
        }
        uint64_t v6 = [v5 output];
        objc_opt_class();
        CMTimeEpoch v77 = v5;
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              goto LABEL_73;
            }
            long long v88 = 0u;
            long long v89 = 0u;
            long long v86 = 0u;
            long long v87 = 0u;
            long long v47 = (void *)[v5 inputPorts];
            uint64_t v48 = [v47 countByEnumeratingWithState:&v86 objects:v105 count:16];
            if (!v48) {
              goto LABEL_73;
            }
            uint64_t v49 = v48;
            uint64_t v50 = *(void *)v87;
            while (2)
            {
              uint64_t v51 = 0;
LABEL_63:
              if (*(void *)v87 != v50) {
                objc_enumerationMutation(v47);
              }
              long long v52 = *(void **)(*((void *)&v86 + 1) + 8 * v51);
              if (objc_msgSend((id)objc_msgSend(v52, "mediaType"), "isEqual:", v3))
              {
                long long v53 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v52, "input"), "videoDevice"), "activeFormat");
                if (FigCapturePlatformSupportsUniversalCompression())
                {
                  [MEMORY[0x1E4F50F08] stillImageMaxLossyCompressionLevel];
                  goto LABEL_69;
                }
                if (FigCapturePlatformSupportsHTPC16x8Compression()) {
LABEL_69:
                }
                  FigCaptureCompressedPixelFormatForPixelFormat();
                uint64_t v93 = 0;
                objc_msgSend((id)objc_msgSend((id)objc_msgSend(v53, "supportedMaxPhotoDimensions"), "lastObject"), "getValue:", &v93);
                int v54 = HIDWORD(v93);
                int v55 = v93;
                FigCapturePixelFormatBytesPerPixel();
                v2 += 3 * (int)(float)((float)(v56 * (float)(v54 * v55)) * 0.00000095367) + 120;
              }
              if (v49 == ++v51)
              {
                uint64_t v49 = [v47 countByEnumeratingWithState:&v86 objects:v105 count:16];
                if (!v49) {
                  goto LABEL_73;
                }
                continue;
              }
              goto LABEL_63;
            }
          }
        }
        long long v98 = 0u;
        long long v99 = 0u;
        long long v96 = 0u;
        long long v97 = 0u;
        id v79 = (id)[v5 inputPorts];
        uint64_t v7 = [v79 countByEnumeratingWithState:&v96 objects:v106 count:16];
        if (v7)
        {
          uint64_t v8 = v7;
          uint64_t v9 = *(void *)v97;
          uint64_t v75 = *(void *)v97;
          int32_t v76 = (void *)v6;
          do
          {
            uint64_t v10 = 0;
            uint64_t v78 = v8;
            do
            {
              if (*(void *)v97 != v9) {
                objc_enumerationMutation(v79);
              }
              int v11 = *(void **)(*((void *)&v96 + 1) + 8 * v10);
              if (!objc_msgSend((id)objc_msgSend(v11, "mediaType"), "isEqual:", v3)) {
                goto LABEL_56;
              }
              uint64_t v12 = (void *)[v11 input];
              uint64_t v13 = objc_msgSend((id)objc_msgSend(v12, "videoDevice"), "activeFormat");
              float v14 = (void *)[v13 figCaptureSourceVideoFormat];
              CMVideoDimensions Dimensions = CMVideoFormatDescriptionGetDimensions((CMVideoFormatDescriptionRef)[v13 formatDescription]);
              uint64_t v93 = 0;
              uint64_t v94 = 0;
              uint64_t v95 = 0;
              if (v12)
              {
                [v12 videoMinFrameDurationOverride];
                if ((v91 & 0x100000000) != 0)
                {
                  [v12 videoMinFrameDurationOverride];
                  goto LABEL_22;
                }
              }
              else
              {
                uint64_t v90 = 0;
                uint64_t v91 = 0;
                uint64_t v92 = 0;
              }
              if (v13)
              {
                [v13 lowestSupportedVideoFrameDuration];
              }
              else
              {
                uint64_t v93 = 0;
                uint64_t v94 = 0;
                uint64_t v95 = 0;
              }
LABEL_22:
              int v15 = v94;
              uint64_t v16 = v93;
              int v17 = [v77 clientRetainedBufferCount];
              float v18 = 0.0;
              float v19 = 0.0;
              switch([v77 activeVideoStabilizationMode])
              {
                case 1:
                  if ([v14 stabilizationTypeOverrideForStandard] != 1)
                  {
                    [v14 stabilizationOverscanPercentageOverrideForStandard];
                    if (v28 == 0.0) {
                      float v19 = 10.0;
                    }
                    else {
                      float v19 = v28;
                    }
                    goto LABEL_38;
                  }
                  unsigned int v20 = v2;
                  uint64_t v21 = v3;
                  unsigned int v22 = 8;
                  goto LABEL_39;
                case 2:
                  [v14 stabilizationOverscanPercentageOverrideForCinematic];
                  if (v25 == 0.0) {
                    float v19 = 20.0;
                  }
                  else {
                    float v19 = v25;
                  }
                  float v18 = 0.5;
                  goto LABEL_38;
                case 3:
                  [v14 cinematicStabilizationExtendedLookAheadDuration];
                  float v18 = v23;
                  [v14 stabilizationOverscanPercentageOverrideForCinematic];
                  if (v24 == 0.0) {
                    float v19 = 20.0;
                  }
                  else {
                    float v19 = v24;
                  }
                  goto LABEL_38;
                case 5:
                  [v14 cinematicStabilizationExtendedLookAheadDuration];
                  float v18 = v26;
                  [v14 stabilizationOverscanPercentageOverrideForCinematicExtendedEnhanced];
                  if (v27 == 0.0) {
                    float v19 = 28.0;
                  }
                  else {
                    float v19 = v27;
                  }
                  goto LABEL_38;
                default:
LABEL_38:
                  unsigned int v20 = v2;
                  uint64_t v21 = v3;
                  unsigned int v22 = (float)((float)((float)((float)v15 / (float)v16) * v18) + 10.0);
LABEL_39:
                  unsigned int v80 = v22;
                  uint64_t v29 = [v14 format];
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    unsigned int v30 = v20;
                    char v31 = (void *)[v76 videoSettings];
                    int v32 = objc_msgSend((id)objc_msgSend(v31, "objectForKeyedSubscript:", v73), "intValue");
                    int v33 = objc_msgSend((id)objc_msgSend(v31, "objectForKeyedSubscript:", v72), "intValue");
                    objc_msgSend((id)objc_msgSend(v31, "objectForKeyedSubscript:", v71), "intValue");
                    if (FigCapturePlatformSupportsUniversalCompression())
                    {
                      [MEMORY[0x1E4F50F08] videoDataMaxLossyCompressionLevel];
                      goto LABEL_48;
                    }
                    if (FigCapturePlatformSupportsHTPC16x8Compression()) {
LABEL_48:
                    }
                      FigCaptureCompressedPixelFormatForPixelFormat();
                    FigCapturePixelFormatBytesPerPixel();
                    int v38 = (v17 + 2) * (int)(float)((float)(v39 * (float)(v33 * v32)) * 0.00000095367);
                    float width = (float)Dimensions.width;
                    float height = (float)Dimensions.height;
                    unsigned int v36 = v30;
                    uint64_t v3 = v74;
                    goto LABEL_50;
                  }
                  if (FigCapturePlatformSupportsUniversalCompression())
                  {
                    [MEMORY[0x1E4F50F08] movieFileMaxLossyCompressionLevelForPixelFormat:v29];
                    FigCaptureCompressedPixelFormatForPixelFormat();
                    uint64_t v3 = v21;
                  }
                  else
                  {
                    uint64_t v3 = v21;
                    if (FigCapturePlatformSupportsHTPC16x8Compression()) {
                      FigCaptureCompressedPixelFormatForPixelFormat();
                    }
                  }
                  float width = (float)Dimensions.width;
                  float height = (float)Dimensions.height;
                  unsigned int v36 = v20
                      + (int)(float)((float)((float)((float)((float)Dimensions.width * 16.5) * (float)Dimensions.height)
                                           + 17.0)
                                   * 0.00000095367);
                  FigCapturePixelFormatBytesPerPixel();
                  int v38 = (v17 + 11)
                      * (int)(float)((float)(v37 * (float)(Dimensions.height * Dimensions.width)) * 0.00000095367);
LABEL_50:
                  float v40 = (float)(v19 / 100.0) + 1.0;
                  int v41 = (int)(float)(v40 * width);
                  int v42 = (int)(float)(v40 * height);
                  uint64_t v43 = [v14 sensorDimensions];
                  BOOL v44 = v41 <= (int)v43;
                  if (v41 >= (int)v43) {
                    int v41 = v43;
                  }
                  if (v44) {
                    int v45 = v42;
                  }
                  else {
                    int v45 = HIDWORD(v43);
                  }
                  FigCapturePixelFormatBytesPerPixel();
                  unsigned int v2 = v36 + v38 + v80 * (int)(float)((float)(v46 * (float)(v45 * v41)) * 0.00000095367);
                  uint64_t v9 = v75;
                  uint64_t v8 = v78;
                  break;
              }
LABEL_56:
              ++v10;
            }
            while (v8 != v10);
            uint64_t v8 = [v79 countByEnumeratingWithState:&v96 objects:v106 count:16];
          }
          while (v8);
        }
LABEL_73:
        if ([v77 videoPreviewLayer])
        {
          long long v84 = 0u;
          long long v85 = 0u;
          long long v82 = 0u;
          long long v83 = 0u;
          uint64_t v57 = (void *)[v77 inputPorts];
          uint64_t v58 = [v57 countByEnumeratingWithState:&v82 objects:v104 count:16];
          if (v58)
          {
            uint64_t v59 = v58;
            uint64_t v60 = *(void *)v83;
            do
            {
              for (uint64_t i = 0; i != v59; ++i)
              {
                if (*(void *)v83 != v60) {
                  objc_enumerationMutation(v57);
                }
                v62 = *(void **)(*((void *)&v82 + 1) + 8 * i);
                if (objc_msgSend((id)objc_msgSend(v62, "mediaType"), "isEqual:", v3))
                {
                  uint64_t v63 = (void *)[v62 input];
                  uint64_t v64 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v63, "videoDevice"), "activeFormat"), "figCaptureSourceVideoFormat"), "previewDimensions");
                  objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v63, "videoDevice"), "activeFormat"), "figCaptureSourceVideoFormat"), "format");
                  if (FigCapturePlatformSupportsUniversalCompression())
                  {
                    [MEMORY[0x1E4F50F08] previewMaxLossyCompressionLevel];
                    goto LABEL_83;
                  }
                  if (FigCapturePlatformSupportsHTPC16x8Compression()) {
LABEL_83:
                  }
                    FigCaptureCompressedPixelFormatForPixelFormat();
                  FigCapturePixelFormatBytesPerPixel();
                  v2 += 6 * (int)(float)((float)(v65 * (float)(HIDWORD(v64) * v64)) * 0.00000095367);
                  continue;
                }
              }
              uint64_t v59 = [v57 countByEnumeratingWithState:&v82 objects:v104 count:16];
            }
            while (v59);
          }
        }
LABEL_87:
        uint64_t v4 = v70 + 1;
      }
      while (v70 + 1 != v69);
      uint64_t v69 = [(NSArray *)obj countByEnumeratingWithState:&v100 objects:v107 count:16];
    }
    while (v69);
  }
  return v2;
}

- (float)_encoderCost
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  obuint64_t j = [(AVCaptureSession *)self connections];
  uint64_t v23 = [(NSArray *)obj countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v23)
  {
    unsigned int v29 = 0;
    uint64_t v22 = *(void *)v36;
    uint64_t v2 = *MEMORY[0x1E4F47C68];
    uint64_t v27 = *MEMORY[0x1E4F24D70];
    uint64_t v26 = *MEMORY[0x1E4F24E10];
    uint64_t v25 = *MEMORY[0x1E4F24D08];
    while (1)
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v36 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v4 = *(void **)(*((void *)&v35 + 1) + 8 * v3);
        uint64_t v24 = v3;
        if ([v4 isActive])
        {
          uint64_t v5 = [v4 output];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();
          objc_opt_class();
          float v28 = (void *)v5;
          char v7 = objc_opt_isKindOfClass();
          char v8 = v7;
          if (isKindOfClass & 1) != 0 || (v7)
          {
            long long v33 = 0u;
            long long v34 = 0u;
            long long v31 = 0u;
            long long v32 = 0u;
            uint64_t v9 = (void *)[v4 inputPorts];
            uint64_t v10 = [v9 countByEnumeratingWithState:&v31 objects:v39 count:16];
            if (v10)
            {
              uint64_t v11 = v10;
              uint64_t v12 = *(void *)v32;
              do
              {
                for (uint64_t i = 0; i != v11; ++i)
                {
                  if (*(void *)v32 != v12) {
                    objc_enumerationMutation(v9);
                  }
                  float v14 = *(void **)(*((void *)&v31 + 1) + 8 * i);
                  if (objc_msgSend((id)objc_msgSend(v14, "mediaType"), "isEqual:", v2))
                  {
                    int v15 = (void *)[v14 input];
                    uint64_t v16 = objc_msgSend((id)objc_msgSend(v15, "videoDevice"), "activeFormat");
                    unint64_t Dimensions = (unint64_t)CMVideoFormatDescriptionGetDimensions((CMVideoFormatDescriptionRef)[v16 formatDescription]);
                    if ((v8 & 1) == 0)
                    {
                      int32_t v19 = Dimensions;
                      float v18 = (void *)HIDWORD(Dimensions);
LABEL_20:
                      if (v15)
                      {
                        [v15 videoMinFrameDurationOverride];
                        if (v30)
                        {
                          [v15 videoMinFrameDurationOverride];
LABEL_26:
                          v29 += (float)((float)((float)0 / (float)0) * (float)((int)v18 * v19));
                          continue;
                        }
                      }
                      else
                      {
                        char v30 = 0;
                      }
                      if (v16) {
                        [v16 lowestSupportedVideoFrameDuration];
                      }
                      goto LABEL_26;
                    }
                    float v18 = (void *)[v28 videoSettings];
                    objc_msgSend((id)objc_msgSend(v18, "objectForKeyedSubscript:", v27), "intValue");
                    if (FigCapturePixelFormatIsTenBit() && FigCapturePixelFormatIs422())
                    {
                      int32_t v19 = objc_msgSend((id)objc_msgSend(v18, "objectForKeyedSubscript:", v26), "intValue");
                      LODWORD(v18) = objc_msgSend((id)objc_msgSend(v18, "objectForKeyedSubscript:", v25), "intValue");
                      goto LABEL_20;
                    }
                  }
                }
                uint64_t v11 = [v9 countByEnumeratingWithState:&v31 objects:v39 count:16];
              }
              while (v11);
            }
          }
        }
        uint64_t v3 = v24 + 1;
      }
      while (v24 + 1 != v23);
      uint64_t v23 = [(NSArray *)obj countByEnumeratingWithState:&v35 objects:v40 count:16];
      if (!v23) {
        return (float)v29
      }
             / (float)(8294400
                     * AVGestaltGetIntegerAnswerWithDefault(@"AVGQRearFacingCameraVideoCapture4kMaxFPS", 60));
    }
  }
  unsigned int v29 = 0;
  return (float)v29
       / (float)(8294400
               * AVGestaltGetIntegerAnswerWithDefault(@"AVGQRearFacingCameraVideoCapture4kMaxFPS", 60));
}

- (float)_videoAndMovieOutputCost
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  obuint64_t j = [(AVCaptureSession *)self connections];
  uint64_t v29 = [(NSArray *)obj countByEnumeratingWithState:&v42 objects:v47 count:16];
  if (!v29)
  {
    unsigned int v36 = 0;
    unsigned int v2 = 0;
    unsigned int v3 = 0;
    goto LABEL_38;
  }
  unsigned int v36 = 0;
  unsigned int v2 = 0;
  unsigned int v3 = 0;
  uint64_t v28 = *(void *)v43;
  uint64_t v4 = *MEMORY[0x1E4F47C68];
  uint64_t v32 = *MEMORY[0x1E4F24E10];
  uint64_t v31 = *MEMORY[0x1E4F24D08];
  do
  {
    uint64_t v5 = 0;
    do
    {
      if (*(void *)v43 != v28) {
        objc_enumerationMutation(obj);
      }
      uint64_t v6 = *(void **)(*((void *)&v42 + 1) + 8 * v5);
      uint64_t v30 = v5;
      if ([v6 isActive])
      {
        uint64_t v7 = [v6 output];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        objc_opt_class();
        long long v33 = (void *)v7;
        char v9 = objc_opt_isKindOfClass();
        char v10 = v9;
        if (isKindOfClass & 1) != 0 || (v9)
        {
          long long v40 = 0u;
          long long v41 = 0u;
          long long v38 = 0u;
          long long v39 = 0u;
          id v35 = (id)[v6 inputPorts];
          uint64_t v11 = [v35 countByEnumeratingWithState:&v38 objects:v46 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            char v34 = v10;
            uint64_t v13 = *(void *)v39;
            do
            {
              for (uint64_t i = 0; i != v12; ++i)
              {
                if (*(void *)v39 != v13) {
                  objc_enumerationMutation(v35);
                }
                int v15 = *(void **)(*((void *)&v38 + 1) + 8 * i);
                if (objc_msgSend((id)objc_msgSend(v15, "mediaType"), "isEqual:", v4))
                {
                  uint64_t v16 = (void *)[v15 input];
                  int v17 = objc_msgSend((id)objc_msgSend(v16, "videoDevice"), "activeFormat");
                  CMVideoDimensions Dimensions = CMVideoFormatDescriptionGetDimensions((CMVideoFormatDescriptionRef)[v17 formatDescription]);
                  if (v16)
                  {
                    [v16 videoMinFrameDurationOverride];
                    if (v37)
                    {
                      [v16 videoMinFrameDurationOverride];
LABEL_21:
                      int v19 = Dimensions.height * Dimensions.width;
                      if ((v34 & 1) != 0
                        && [v33 deliversPreviewSizedOutputBuffers]
                        && (![v6 activeVideoStabilizationMode]
                         || [v6 activeVideoStabilizationMode] == 4))
                      {
                        unsigned int v20 = (void *)[v33 videoSettings];
                        int v21 = objc_msgSend((id)objc_msgSend(v20, "objectForKeyedSubscript:", v32), "intValue");
                        int v19 = objc_msgSend((id)objc_msgSend(v20, "objectForKeyedSubscript:", v31), "intValue") * v21;
                      }
                      unsigned int v22 = (float)((float)((float)0 / (float)0) * (float)v19);
                      if ([v6 activeVideoStabilizationMode])
                      {
                        if ([v6 activeVideoStabilizationMode] == 4) {
                          unsigned int v23 = 0;
                        }
                        else {
                          unsigned int v23 = v22;
                        }
                        v36 += v23;
                      }
                      v3 += v22;
                      ++v2;
                      continue;
                    }
                  }
                  else
                  {
                    char v37 = 0;
                  }
                  if (v17) {
                    [v17 lowestSupportedVideoFrameDuration];
                  }
                  goto LABEL_21;
                }
              }
              uint64_t v12 = [v35 countByEnumeratingWithState:&v38 objects:v46 count:16];
            }
            while (v12);
          }
        }
      }
      uint64_t v5 = v30 + 1;
    }
    while (v30 + 1 != v29);
    uint64_t v29 = [(NSArray *)obj countByEnumeratingWithState:&v42 objects:v47 count:16];
  }
  while (v29);
LABEL_38:
  float v24 = (float)v3
      / flt_1A1636A98[AVGestaltGetIntegerAnswerWithDefault(@"AVGQRearFacingCameraVideoCapture4kMaxFPS", 0) > 119];
  unsigned int v25 = AVGestaltGetIntegerAnswerWithDefault(@"AVGQCaptureSessionMaxMultiCamRGBStreamsSupported", 1)
      + 1;
  if (v24 <= (float)((float)v2 / (float)v25)) {
    float v24 = (float)v2 / (float)v25;
  }
  float result = (float)v36
         / (float)(8294400
                 * AVGestaltGetIntegerAnswerWithDefault(@"AVGQRearFacingCameraVideoCapture4kMaxFPS", 60));
  if (v24 > result) {
    return v24;
  }
  return result;
}

- (id)_livePortSetsByDeviceInput
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  CFDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  obuint64_t j = [(AVCaptureSession *)self connections];
  uint64_t v17 = [(NSArray *)obj countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v17)
  {
    uint64_t v16 = *(void *)v24;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v24 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = v4;
        uint64_t v5 = *(void **)(*((void *)&v23 + 1) + 8 * v4);
        if ([v5 isLive])
        {
          long long v21 = 0u;
          long long v22 = 0u;
          long long v19 = 0u;
          long long v20 = 0u;
          uint64_t v6 = (void *)[v5 inputPorts];
          uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v27 count:16];
          if (v7)
          {
            uint64_t v8 = v7;
            uint64_t v9 = *(void *)v20;
            do
            {
              for (uint64_t i = 0; i != v8; ++i)
              {
                if (*(void *)v20 != v9) {
                  objc_enumerationMutation(v6);
                }
                uint64_t v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
                [v11 input];
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  uint64_t v12 = (const void *)[v11 input];
                  Value = (void *)CFDictionaryGetValue(Mutable, v12);
                  if (!Value)
                  {
                    Value = (void *)[MEMORY[0x1E4F1CA80] set];
                    CFDictionaryAddValue(Mutable, v12, Value);
                  }
                  [Value addObject:v11];
                }
              }
              uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v27 count:16];
            }
            while (v8);
          }
        }
        uint64_t v4 = v18 + 1;
      }
      while (v18 + 1 != v17);
      uint64_t v17 = [(NSArray *)obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v17);
  }
  return Mutable;
}

- (id)_devicesProvidingDepthData
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  unsigned int v3 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  obuint64_t j = [(AVCaptureSession *)self connections];
  uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v24;
    uint64_t v7 = *MEMORY[0x1E4F47C48];
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v24 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        [v9 output];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v21 = 0u;
          long long v22 = 0u;
          long long v19 = 0u;
          long long v20 = 0u;
          char v10 = (void *)[v9 inputPorts];
          uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v20;
            do
            {
              for (uint64_t j = 0; j != v12; ++j)
              {
                if (*(void *)v20 != v13) {
                  objc_enumerationMutation(v10);
                }
                int v15 = *(void **)(*((void *)&v19 + 1) + 8 * j);
                if (objc_msgSend((id)objc_msgSend(v15, "mediaType"), "isEqual:", v7))
                {
                  uint64_t v16 = (void *)[v15 input];
                  if ((objc_msgSend(v3, "containsObject:", objc_msgSend(v16, "device")) & 1) == 0) {
                    objc_msgSend(v3, "addObject:", objc_msgSend(v16, "device"));
                  }
                }
              }
              uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
            }
            while (v12);
          }
        }
      }
      uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v5);
  }
  return v3;
}

- (id)valueForUndefinedKey:(id)a3
{
  if ([a3 isEqualToString:@"masterClock"])
  {
    return [(AVCaptureSession *)self masterClock];
  }
  else if ([a3 isEqualToString:@"synchronizationClock"])
  {
    return [(AVCaptureSession *)self synchronizationClock];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)AVCaptureSession;
    return [(AVCaptureSession *)&v6 valueForUndefinedKey:a3];
  }
}

+ (BOOL)automaticallyNotifiesObserversOfSynchronizationClock
{
  return 0;
}

+ (BOOL)automaticallyNotifiesObserversOfMasterClock
{
  return 0;
}

- (BOOL)_sessionHasRecordingFileOutput
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  unsigned int v2 = [(AVCaptureSession *)self outputs];
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v9 + 1) + 8 * v6);
        objc_opt_class();
        if (objc_opt_isKindOfClass() & 1) != 0 && ([v7 isRecording])
        {
          LOBYTE(v3) = 1;
          return v3;
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      uint64_t v4 = v3;
      if (v3) {
        continue;
      }
      break;
    }
  }
  return v3;
}

- (void)_teardownFigCaptureSession
{
  internal = self->_internal;
  if (internal->figCaptureSession)
  {
    uint64_t v4 = (void *)[MEMORY[0x1E4F47DB8] notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
    uint64_t v5 = self->_internal;
    weakReference = v5->weakReference;
    [v4 removeListenerWithWeakReference:weakReference callback:avcaptureFigCaptureSessionNotification name:*MEMORY[0x1E4F517B8] object:v5->figCaptureSession];
    [v4 removeListenerWithWeakReference:weakReference callback:avcaptureFigCaptureSessionNotification name:*MEMORY[0x1E4F517C0] object:self->_internal->figCaptureSession];
    [v4 removeListenerWithWeakReference:weakReference callback:avcaptureFigCaptureSessionNotification name:*MEMORY[0x1E4F517D8] object:self->_internal->figCaptureSession];
    [v4 removeListenerWithWeakReference:weakReference callback:avcaptureFigCaptureSessionNotification name:*MEMORY[0x1E4F517C8] object:self->_internal->figCaptureSession];
    [v4 removeListenerWithWeakReference:weakReference callback:avcaptureFigCaptureSessionNotification name:*MEMORY[0x1E4F517D0] object:self->_internal->figCaptureSession];
    if (AVCaptureIsRunningInMediaserverd())
    {
      figCaptureSessiouint64_t n = self->_internal->figCaptureSession;
      if (figCaptureSession)
      {
        uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 8);
        uint64_t v9 = v8 ? v8 : 0;
        long long v10 = *(void (**)(OpaqueFigCaptureSession *))(v9 + 24);
        if (v10) {
          v10(figCaptureSession);
        }
      }
    }
    internal = self->_internal;
    long long v11 = internal->figCaptureSession;
    if (v11)
    {
      CFRelease(v11);
      self->_internal->figCaptureSessiouint64_t n = 0;
      internal = self->_internal;
    }
    sessionConfig = internal->sessionConfig;
    if (sessionConfig)
    {

      self->_internal->sessionConfig = 0;
      internal = self->_internal;
    }
  }
  internal->figCaptureSessionRunning = 0;
  self->_internal->figCaptureSessionStarted = 0;

  [(AVCaptureSession *)self _setSynchronizationClock:0];
}

- (void)_removeConnectionsForInputPort:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)[(NSMutableArray *)self->_internal->connections copy];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  obuint64_t j = v5;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(obj);
        }
        long long v10 = *(void **)(*((void *)&v21 + 1) + 8 * v9);
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v11 = (void *)[v10 inputPorts];
        uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v18;
          do
          {
            uint64_t v15 = 0;
            do
            {
              if (*(void *)v18 != v14) {
                objc_enumerationMutation(v11);
              }
              if ([*(id *)(*((void *)&v17 + 1) + 8 * v15) isEqual:a3]
                && objc_msgSend((id)objc_msgSend(v10, "inputPorts"), "count") == 1)
              {
                [(AVCaptureSession *)self _removeConnection:v10];
              }
              ++v15;
            }
            while (v13 != v15);
            uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
          }
          while (v13);
        }
        ++v9;
      }
      while (v9 != v7);
      uint64_t v7 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v7);
  }
}

- (id)_stopError
{
  return self->_internal->stopError;
}

- (void)_postRuntimeError:(id)a3
{
  v10[22] = *MEMORY[0x1E4F143B8];
  if (dword_1EB4C9260)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", v7, v8);
  uint64_t v9 = @"AVCaptureSessionErrorKey";
  v10[0] = a3;
  objc_msgSend(v6, "postNotificationName:object:userInfo:", @"AVCaptureSessionRuntimeErrorNotification", self, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1));
}

- (void)_handleCenterStageActiveChangedForDevice:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  outputs = self->_internal->outputs;
  uint64_t v5 = [(NSMutableArray *)outputs countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(outputs);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * i) handleCenterStageActiveChangedForDevice:a3];
      }
      uint64_t v6 = [(NSMutableArray *)outputs countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)_handleBackgroundBlurActiveChangedForDevice:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  -[AVCaptureSession _handleVideoEffectFrameRateThrottling:](self, "_handleVideoEffectFrameRateThrottling:");
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  outputs = self->_internal->outputs;
  uint64_t v6 = [(NSMutableArray *)outputs countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(outputs);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) handleBackgroundBlurActiveChangedForDevice:a3];
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)outputs countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)_handleStudioLightingActiveChangedForDevice:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  -[AVCaptureSession _handleVideoEffectFrameRateThrottling:](self, "_handleVideoEffectFrameRateThrottling:");
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  outputs = self->_internal->outputs;
  uint64_t v6 = [(NSMutableArray *)outputs countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(outputs);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) handleStudioLightingActiveChangedForDevice:a3];
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)outputs countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)_handleReactionEffectsActiveChangedForDevice:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  outputs = self->_internal->outputs;
  uint64_t v5 = [(NSMutableArray *)outputs countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(outputs);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * i) handleReactionEffectsActiveChangedForDevice:a3];
      }
      uint64_t v6 = [(NSMutableArray *)outputs countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)_handleBackgroundReplacementActiveChangedForDevice:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  -[AVCaptureSession _handleVideoEffectFrameRateThrottling:](self, "_handleVideoEffectFrameRateThrottling:");
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  outputs = self->_internal->outputs;
  uint64_t v6 = [(NSMutableArray *)outputs countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(outputs);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) handleBackgroundReplacementActiveChangedForDevice:a3];
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)outputs countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)_handleVideoEffectFrameRateThrottling:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = MEMORY[0x1E4F1F9F8];
  uint64_t v19 = *MEMORY[0x1E4F1F9F8];
  unsigned int v20 = *(_DWORD *)(MEMORY[0x1E4F1F9F8] + 8);
  if ([a3 isBackgroundBlurActive] & 1) != 0 || (objc_msgSend(a3, "isStudioLightActive")) {
    int v6 = 1;
  }
  else {
    int v6 = [a3 isBackgroundReplacementActive];
  }
  int v7 = [a3 isActiveVideoMinFrameDurationSet];
  int v8 = [a3 isActiveVideoMaxFrameDurationSet];
  if (v6)
  {
    unsigned int v9 = *(_DWORD *)(v5 + 12);
    uint64_t v10 = *(void *)(v5 + 16);
    if (a3)
    {
      [a3 activeVideoMinFrameDuration];
      unsigned int v11 = HIDWORD(v17);
      uint64_t v12 = v18;
    }
    else
    {
      uint64_t v12 = 0;
      unsigned int v11 = 0;
      uint64_t v16 = 0;
      unint64_t v17 = 0;
      uint64_t v18 = 0;
    }
    uint64_t v21 = v16;
    unsigned int v22 = v17;
    if (v11) {
      goto LABEL_31;
    }
LABEL_20:
    if ((v9 & 1) == 0) {
      return;
    }
    goto LABEL_21;
  }
  int v13 = v8;
  uint64_t v14 = (void *)[a3 activeFormat];
  if (v14)
  {
    [v14 defaultActiveMinFrameDurationForSessionPreset:self->_internal->sessionPreset];
    unsigned int v11 = HIDWORD(v17);
    uint64_t v12 = v18;
  }
  else
  {
    uint64_t v12 = 0;
    unsigned int v11 = 0;
    uint64_t v16 = 0;
    unint64_t v17 = 0;
    uint64_t v18 = 0;
  }
  uint64_t v21 = v16;
  unsigned int v22 = v17;
  uint64_t v15 = objc_msgSend(a3, "activeFormat", v16, v17);
  if (v15)
  {
    [v15 defaultActiveMaxFrameDurationForSessionPreset:self->_internal->sessionPreset];
    unsigned int v9 = HIDWORD(v17);
    uint64_t v10 = v18;
  }
  else
  {
    uint64_t v10 = 0;
    unsigned int v9 = 0;
    uint64_t v16 = 0;
    unint64_t v17 = 0;
    uint64_t v18 = 0;
  }
  uint64_t v19 = v16;
  unsigned int v20 = v17;
  if (v7)
  {
    if (a3)
    {
      [a3 activeVideoMinFrameDurationSetByClient];
      unsigned int v11 = HIDWORD(v17);
      uint64_t v12 = v18;
    }
    else
    {
      uint64_t v12 = 0;
      unsigned int v11 = 0;
      uint64_t v16 = 0;
      unint64_t v17 = 0;
      uint64_t v18 = 0;
    }
    uint64_t v21 = v16;
    unsigned int v22 = v17;
    if (!v13)
    {
LABEL_19:
      if (v11) {
        goto LABEL_31;
      }
      goto LABEL_20;
    }
  }
  else if (!v13)
  {
    goto LABEL_19;
  }
  if (a3)
  {
    [a3 activeVideoMaxFrameDurationSetByClient];
    unsigned int v9 = HIDWORD(v17);
    uint64_t v10 = v18;
  }
  else
  {
    uint64_t v10 = 0;
    unsigned int v9 = 0;
    uint64_t v16 = 0;
    unint64_t v17 = 0;
    uint64_t v18 = 0;
  }
  uint64_t v19 = v16;
  unsigned int v20 = v17;
  if ((v11 & 1) == 0) {
    goto LABEL_20;
  }
LABEL_31:
  uint64_t v16 = v21;
  unint64_t v17 = __PAIR64__(v11, v22);
  uint64_t v18 = v12;
  [a3 _setActiveVideoMinFrameDuration:&v16];
  if ((v9 & 1) == 0) {
    return;
  }
LABEL_21:
  uint64_t v16 = v19;
  unint64_t v17 = __PAIR64__(v9, v20);
  uint64_t v18 = v10;
  [a3 _setActiveVideoMaxFrameDuration:&v16];
}

- (void)_stopAndTearDownGraph
{
  internal = self->_internal;
  if (internal->figCaptureSessionStarted)
  {
    [(AVCaptureSession *)self _stopFigCaptureSession];
  }
  else if (internal->running)
  {
    [(AVCaptureSession *)self _notifySessionStopped];
  }
  uint64_t v4 = self->_internal;
  objc_sync_enter(v4);
  [(AVCaptureSession *)self _makeConfigurationLive:0];
  [(AVCaptureSession *)self _setSynchronizationClock:0];

  self->_internal->sessionConfig = 0;

  objc_sync_exit(v4);
}

- (void)_notifySessionStopped
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (self->_internal->running)
  {
    [(AVCaptureSession *)self willChangeValueForKey:@"running"];
    self->_internal->running = 0;
    [(AVCaptureSession *)self _invalidateControlsOverlay];
    [(AVCaptureSession *)self didChangeValueForKey:@"running"];
    if (dword_1EB4C9260)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", v4, v5), "postNotificationName:object:", @"AVCaptureSessionDidStopRunningNotification", self);
  }
}

- (void)_handleDidStopRunningNotificationWithPayload:(id)a3
{
  int v5 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F516D8]), "intValue");
  uint64_t v6 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F516D0]), "intValue");
  int v7 = 0;
  int v8 = 1;
  if (v5 > -16403)
  {
    if (v5 == -16402)
    {
      [(AVCaptureSession *)self _setInterrupted:1 withReason:v6];
      int v8 = 0;
      int v7 = -16402;
      goto LABEL_10;
    }
    int v9 = -15545;
  }
  else
  {
    if (v5 == -16409)
    {
      int v8 = 0;
      int v7 = 0;
      goto LABEL_10;
    }
    int v9 = -16406;
  }
  if (v5 != v9)
  {
    int v8 = 0;
    int v7 = v5;
  }
LABEL_10:
  [(AVRunLoopCondition *)self->_internal->runLoopCondition lock];
  internal = self->_internal;
  BOOL waitingForFigCaptureSessionToStop = internal->waitingForFigCaptureSessionToStop;
  p_BOOL waitingForFigCaptureSessionToStop = &internal->waitingForFigCaptureSessionToStop;
  BOOL v12 = waitingForFigCaptureSessionToStop;
  if (waitingForFigCaptureSessionToStop)
  {
    uint64_t v14 = 0;
LABEL_24:
    *p_BOOL waitingForFigCaptureSessionToStop = 0;
    [(AVRunLoopCondition *)self->_internal->runLoopCondition signal];
    goto LABEL_25;
  }
  if (v7)
  {
    if ((v7 + 16400) < 0xFFFFFFFE)
    {
LABEL_20:
      uint64_t v14 = AVLocalizedErrorWithUnderlyingOSStatus();
      goto LABEL_21;
    }
  }
  else
  {
    if (self->_internal->waitingForFigCaptureSessionToStart) {
      char v15 = v8;
    }
    else {
      char v15 = 1;
    }
    if ((v15 & 1) == 0) {
      goto LABEL_20;
    }
  }
  uint64_t v14 = 0;
LABEL_21:
  uint64_t v16 = self->_internal;
  if (v16->waitingForFigCaptureSessionToStart || v16->waitingForFigCaptureSessionConfigurationToBecomeLive)
  {
    v16->waitingForFigCaptureSessionToStart = 0;
    p_BOOL waitingForFigCaptureSessionToStop = &self->_internal->waitingForFigCaptureSessionConfigurationToBecomeLive;
    goto LABEL_24;
  }
LABEL_25:
  self->_internal->figCaptureSessionRunning = 0;
  [(AVRunLoopCondition *)self->_internal->runLoopCondition unlock];
  if (v14) {
    [(AVCaptureSession *)self _postRuntimeError:v14];
  }
  unint64_t v17 = self->_internal;
  objc_sync_enter(v17);
  if (![(AVCaptureSession *)self isBeingConfigured])
  {

    self->_internal->sessionConfig = (FigCaptureSessionConfiguration *)[(AVCaptureSession *)self _figCaptureSessionConfiguration];
  }
  objc_sync_exit(v17);
  if (!v12)
  {
    [(AVCaptureSession *)self _notifySessionStopped];
    if (v8)
    {
      [(AVCaptureSession *)self _setInterrupted:0 withReason:0];
      [(AVCaptureSession *)self _notifyMediaServicesError];
    }
  }
}

uint64_t __73__AVCaptureSession__handleConfigurationCommittedNotificationWithPayload___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = AVLocalizedErrorWithUnderlyingOSStatus();

  return [v1 _postRuntimeError:v2];
}

- (void)_notifyMediaServicesError
{
  uint64_t v3 = AVLocalizedError();

  [(AVCaptureSession *)self _postRuntimeError:v3];
}

- (void)_handleCaptureServerConnectionDiedNotification
{
  v10[2] = *MEMORY[0x1E4F143B8];
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_internal->captureServerConnectionDiedSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  int v7 = __66__AVCaptureSession__handleCaptureServerConnectionDiedNotification__block_invoke;
  int v8 = &unk_1E5A72ED0;
  int v9 = self;
  if ([(AVCaptureSession *)self notifiesOnMainThread])
  {
    Maiuint64_t n = CFRunLoopGetMain();
    uint64_t v4 = *MEMORY[0x1E4F1D410];
    v10[0] = *MEMORY[0x1E4F20260];
    v10[1] = v4;
    CFRunLoopPerformBlock(Main, (CFTypeRef)[MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2], &v6);
    int v5 = CFRunLoopGetMain();
    CFRunLoopWakeUp(v5);
  }
  else
  {
    v7((uint64_t)&v6);
  }
}

uint64_t __66__AVCaptureSession__handleCaptureServerConnectionDiedNotification__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reconnectAfterServerConnectionDied];
}

- (void)_reconnectAfterServerConnectionDied
{
  [(AVRunLoopCondition *)self->_internal->runLoopCondition lock];
  internal = self->_internal;
  if (*(_WORD *)&internal->waitingForFigCaptureSessionToStart
    || internal->waitingForFigCaptureSessionConfigurationToBecomeLive)
  {
    internal->waitingForFigCaptureSessionToStart = 0;
    self->_internal->BOOL waitingForFigCaptureSessionToStop = 0;
    self->_internal->waitingForFigCaptureSessionConfigurationToBecomeLive = 0;
    [(AVRunLoopCondition *)self->_internal->runLoopCondition signal];
    internal = self->_internal;
  }
  [(AVRunLoopCondition *)internal->runLoopCondition unlock];
  uint64_t v4 = self->_internal;
  objc_sync_enter(v4);
  int v5 = self->_internal->liveAVCaptureSessionConfiguration;
  [(NSArray *)[(AVCaptureSessionConfiguration *)v5 outputs] makeObjectsPerformSelector:sel_handleServerConnectionDeathForFigCaptureSession_ withObject:self->_internal->figCaptureSession];
  [(AVCaptureSession *)self _makeConfigurationLive:0];
  [(AVCaptureSession *)self _teardownFigCaptureSession];
  [(AVCaptureSession *)self _createFigCaptureSession];
  [(AVCaptureSession *)self _makeConfigurationLive:v5];

  [(AVCaptureSession *)self _determineSynchronizationClock];
  objc_sync_exit(v4);
  uint64_t v6 = self->_internal;
  if (v6->running || v6->interrupted)
  {
    [(AVCaptureSession *)self _notifySessionStopped];
    [(AVCaptureSession *)self _setInterrupted:0 withReason:0];
    [(AVCaptureSession *)self _notifyMediaServicesError];
  }
}

- (void)_invalidateControlsOverlay
{
  internal = self->_internal;
  objc_sync_enter(internal);
  [(AVCaptureControlsOverlay *)self->_internal->controlsOverlay invalidate];

  objc_sync_exit(internal);
}

uint64_t __42__AVCaptureSession__updateControlsOverlay__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)[a2 uniqueID];
  uint64_t v4 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "device"), "uniqueID");

  return [v3 isEqualToString:v4];
}

uint64_t __42__AVCaptureSession__updateControlsOverlay__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)[a2 uniqueID];
  uint64_t v4 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "device"), "uniqueID");

  return [v3 isEqualToString:v4];
}

uint64_t __42__AVCaptureSession__updateControlsOverlay__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)[a2 uniqueID];
  uint64_t v4 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "device"), "uniqueID");

  return [v3 isEqualToString:v4];
}

- (void)handleControlsOverlay:(id)a3 didChangeVisibility:(BOOL)a4 activeControl:(id)a5
{
  internal = self->_internal;
  objc_sync_enter(internal);
  uint64_t v10 = self->_internal;
  controlsOverlay = v10->controlsOverlay;
  if (controlsOverlay == a3)
  {
    id v12 = (id)[(AVWeakReference *)v10->weakReferenceControlsDelegate referencedObject];
    int v13 = self->_internal->clientControlsQueue;
    uint64_t v14 = self->_internal->weakReference;
  }
  else
  {
    uint64_t v14 = 0;
    int v13 = 0;
    id v12 = 0;
  }
  objc_sync_exit(internal);
  if (controlsOverlay == a3 && v13 != 0 && v12 != 0)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __76__AVCaptureSession_handleControlsOverlay_didChangeVisibility_activeControl___block_invoke;
    void v17[3] = &unk_1E5A79D48;
    v17[4] = v14;
    void v17[5] = v12;
    BOOL v18 = a4;
    v17[6] = a5;
    dispatch_async((dispatch_queue_t)v13, v17);
  }
}

uint64_t __76__AVCaptureSession_handleControlsOverlay_didChangeVisibility_activeControl___block_invoke(uint64_t a1)
{
  uint64_t result = (uint64_t)(id)[*(id *)(a1 + 32) referencedObject];
  if (!result) {
    return result;
  }
  uint64_t v3 = result;
  uint64_t v4 = *(void **)(a1 + 40);
  if (AVCaptureClientIsCameraOrDerivative())
  {
    if (*(unsigned char *)(a1 + 56))
    {
      int v5 = 1;
LABEL_6:
      uint64_t result = [*(id *)(a1 + 40) sessionControlsDidBecomeActive:v3];
      if (*(void *)(a1 + 48))
      {
        if (v5)
        {
          uint64_t result = objc_opt_respondsToSelector();
          if (result)
          {
            uint64_t v7 = *(void *)(a1 + 48);
            return [v4 session:v3 didChangeActiveControl:v7];
          }
        }
      }
      return result;
    }
LABEL_14:
    if (objc_opt_respondsToSelector()) {
      [v4 session:v3 didChangeActiveControl:0];
    }
    goto LABEL_16;
  }
  int IsInternalTestTool = AVCaptureClientIsInternalTestTool();
  int v5 = IsInternalTestTool;
  if (*(unsigned char *)(a1 + 56)) {
    goto LABEL_6;
  }
  if (IsInternalTestTool) {
    goto LABEL_14;
  }
LABEL_16:
  int v8 = *(void **)(a1 + 40);

  return [v8 sessionControlsDidBecomeInactive:v3];
}

- (void)handleControlsOverlay:(id)a3 didChangeInterfaceReduced:(BOOL)a4
{
  internal = self->_internal;
  objc_sync_enter(internal);
  int v8 = self->_internal;
  controlsOverlay = v8->controlsOverlay;
  if (controlsOverlay == a3)
  {
    id v10 = (id)[(AVWeakReference *)v8->weakReferenceControlsDelegate referencedObject];
    unsigned int v11 = self->_internal->clientControlsQueue;
    id v12 = self->_internal->weakReference;
  }
  else
  {
    id v12 = 0;
    unsigned int v11 = 0;
    id v10 = 0;
  }
  objc_sync_exit(internal);
  if (controlsOverlay == a3 && v11 != 0 && v10 != 0)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __68__AVCaptureSession_handleControlsOverlay_didChangeInterfaceReduced___block_invoke;
    block[3] = &unk_1E5A79A60;
    BOOL v16 = a4;
    block[4] = v12;
    void block[5] = v10;
    dispatch_async((dispatch_queue_t)v11, block);
  }
}

uint64_t __68__AVCaptureSession_handleControlsOverlay_didChangeInterfaceReduced___block_invoke(uint64_t a1)
{
  uint64_t result = (uint64_t)(id)[*(id *)(a1 + 32) referencedObject];
  if (result)
  {
    uint64_t v3 = result;
    if (*(unsigned char *)(a1 + 48))
    {
      uint64_t result = objc_opt_respondsToSelector();
      if (result)
      {
        uint64_t v4 = *(void **)(a1 + 40);
        return [v4 sessionControlsWillEnterFullscreenAppearance:v3];
      }
    }
    else
    {
      uint64_t result = objc_opt_respondsToSelector();
      if (result)
      {
        int v5 = *(void **)(a1 + 40);
        return [v5 sessionControlsWillExitFullscreenAppearance:v3];
      }
    }
  }
  return result;
}

- (void)handleControlsOverlay:(id)a3 didChangeActiveControl:(id)a4
{
  internal = self->_internal;
  objc_sync_enter(internal);
  int v8 = self->_internal;
  if (v8->controlsOverlay == a3 && ([(NSMutableArray *)v8->controls containsObject:a4] & 1) != 0)
  {
    id v9 = (id)[(AVWeakReference *)self->_internal->weakReferenceControlsDelegate referencedObject];
    id v10 = self->_internal->clientControlsQueue;
    unsigned int v11 = self->_internal->weakReference;
    char v12 = 0;
  }
  else
  {
    unsigned int v11 = 0;
    id v10 = 0;
    id v9 = 0;
    char v12 = 1;
  }
  objc_sync_exit(internal);
  if ((v12 & 1) == 0
    && v10
    && v9
    && ((AVCaptureClientIsCameraOrDerivative() & 1) != 0 || AVCaptureClientIsInternalTestTool()))
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __65__AVCaptureSession_handleControlsOverlay_didChangeActiveControl___block_invoke;
    block[3] = &unk_1E5A731E0;
    block[4] = v11;
    void block[5] = v9;
    void block[6] = a4;
    dispatch_async((dispatch_queue_t)v10, block);
  }
}

uint64_t __65__AVCaptureSession_handleControlsOverlay_didChangeActiveControl___block_invoke(uint64_t a1)
{
  uint64_t result = (uint64_t)(id)[*(id *)(a1 + 32) referencedObject];
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = *(void **)(a1 + 40);
    uint64_t result = objc_opt_respondsToSelector();
    if (result)
    {
      uint64_t v5 = *(void *)(a1 + 48);
      return [v4 session:v3 didChangeActiveControl:v5];
    }
  }
  return result;
}

- (void)handleControlsOverlay:(id)a3 didChangeFocusLocked:(BOOL)a4
{
  internal = self->_internal;
  objc_sync_enter(internal);
  int v8 = self->_internal;
  controlsOverlay = v8->controlsOverlay;
  if (controlsOverlay == a3)
  {
    id v10 = (id)[(AVWeakReference *)v8->weakReferenceControlsDelegate referencedObject];
    unsigned int v11 = self->_internal->clientControlsQueue;
    char v12 = self->_internal->weakReference;
  }
  else
  {
    char v12 = 0;
    unsigned int v11 = 0;
    id v10 = 0;
  }
  objc_sync_exit(internal);
  BOOL v14 = controlsOverlay != a3 || v11 == 0 || v10 == 0;
  if (!v14 && ((AVCaptureClientIsCameraOrDerivative() & 1) != 0 || AVCaptureClientIsInternalTestTool()))
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __63__AVCaptureSession_handleControlsOverlay_didChangeFocusLocked___block_invoke;
    block[3] = &unk_1E5A79A60;
    block[4] = v12;
    void block[5] = v10;
    BOOL v16 = a4;
    dispatch_async((dispatch_queue_t)v11, block);
  }
}

uint64_t __63__AVCaptureSession_handleControlsOverlay_didChangeFocusLocked___block_invoke(uint64_t a1)
{
  uint64_t result = (uint64_t)(id)[*(id *)(a1 + 32) referencedObject];
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = *(void **)(a1 + 40);
    uint64_t result = objc_opt_respondsToSelector();
    if (result)
    {
      uint64_t v5 = *(unsigned __int8 *)(a1 + 48);
      return [v4 session:v3 controlsDidChangeAutoFocusLocked:v5];
    }
  }
  return result;
}

- (void)cancelForegroundAutoResumeAfterDate:(id)a3
{
  [a3 timeIntervalSinceReferenceDate];
  double v5 = v4;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  if (dword_1EB4C9260)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  internal = self->_internal;
  objc_sync_enter(internal);
  figCaptureSessiouint64_t n = self->_internal->figCaptureSession;
  if (figCaptureSession)
  {
    uint64_t v9 = [NSNumber numberWithDouble:v5];
    uint64_t v10 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v10) {
      uint64_t v11 = v10;
    }
    else {
      uint64_t v11 = 0;
    }
    char v12 = *(void (**)(OpaqueFigCaptureSession *, void, uint64_t))(v11 + 56);
    if (v12) {
      v12(figCaptureSession, *MEMORY[0x1E4F51878], v9);
    }
  }
  objc_sync_exit(internal);
}

- (void)setSmartStyleControlMode:(int64_t)a3
{
  if (dword_1EB4C9260)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  internal = self->_internal;
  objc_sync_enter(internal);
  self->_internal->smartStyleControlMode = a3;
  objc_sync_exit(internal);
}

- (int64_t)smartStyleControlMode
{
  internal = self->_internal;
  objc_sync_enter(internal);
  int64_t smartStyleControlMode = self->_internal->smartStyleControlMode;
  objc_sync_exit(internal);
  return smartStyleControlMode;
}

- (BOOL)smartStyleRenderingEnabled
{
  uint64_t v2 = self;
  internal = self->_internal;
  objc_sync_enter(internal);
  LOBYTE(v2) = v2->_internal->smartStyleRenderingEnabled;
  objc_sync_exit(internal);
  return (char)v2;
}

- (void)setSmartStyle:(id)a3
{
  internal = self->_internal;
  objc_sync_enter(internal);
  uint64_t v6 = self->_internal;
  if (!v6->smartStyleRenderingOptedOut && ([a3 isEqual:v6->smartStyleSetByClient] & 1) == 0)
  {

    self->_internal->smartStyleSetByClient = (AVCaptureSmartStyle *)a3;
    if (![(AVCaptureSession *)self isBeingConfigured])
    {
      if (a3)
      {
        uint64_t v7 = (void *)MEMORY[0x1E4F50F78];
        uint64_t v8 = [a3 cast];
        [a3 intensity];
        int v10 = v9;
        [a3 toneBias];
        int v12 = v11;
        [a3 colorBias];
        LODWORD(v14) = v13;
        LODWORD(v15) = v10;
        LODWORD(v16) = v12;
        a3 = (id)[v7 styleWithCast:v8 intensity:v15 toneBias:v16 colorBias:v14];
      }
      figCaptureSessiouint64_t n = self->_internal->figCaptureSession;
      if (figCaptureSession)
      {
        uint64_t v18 = *(void *)(CMBaseObjectGetVTable() + 8);
        uint64_t v19 = v18 ? v18 : 0;
        unsigned int v20 = *(void (**)(OpaqueFigCaptureSession *, void, id))(v19 + 56);
        if (v20) {
          v20(figCaptureSession, *MEMORY[0x1E4F51880], a3);
        }
      }
    }
  }

  objc_sync_exit(internal);
}

- (id)smartStyle
{
  internal = self->_internal;
  objc_sync_enter(internal);
  double v4 = self->_internal->smartStyleSetByClient;
  objc_sync_exit(internal);
  return v4;
}

- (void)saveSystemStyleOverrideToDefaults:(id)a3
{
  internal = self->_internal;
  objc_sync_enter(internal);
  if (!self->_internal->smartStyleRenderingOptedOut
    && ![(AVCaptureSession *)self isBeingConfigured])
  {
    if (a3)
    {
      uint64_t v6 = (void *)MEMORY[0x1E4F50F78];
      uint64_t v7 = [a3 cast];
      [a3 intensity];
      int v9 = v8;
      [a3 toneBias];
      int v11 = v10;
      [a3 colorBias];
      LODWORD(v13) = v12;
      LODWORD(v14) = v9;
      LODWORD(v15) = v11;
      a3 = (id)[v6 styleWithCast:v7 intensity:v14 toneBias:v15 colorBias:v13];
    }
    figCaptureSessiouint64_t n = self->_internal->figCaptureSession;
    if (figCaptureSession)
    {
      uint64_t v17 = *(void *)(CMBaseObjectGetVTable() + 8);
      uint64_t v18 = v17 ? v17 : 0;
      uint64_t v19 = *(void (**)(OpaqueFigCaptureSession *, void, id))(v18 + 56);
      if (v19) {
        v19(figCaptureSession, *MEMORY[0x1E4F51888], a3);
      }
    }
  }

  objc_sync_exit(internal);
}

- (id)systemSmartStyle
{
  uint64_t v3 = AVCaptureClientPreferencesDomain();
  SystemStyle = (void *)AVSmartStyleSettingsGetSystemStyle((uint64_t)v3);
  if (![(AVCaptureSession *)self isValidSystemStyle:SystemStyle]) {
    SystemStyle = (void *)AVSmartStyleSettingsGetSystemStyle((uint64_t)AVSmartStyleSettingsSystemStyle);
  }
  if (SystemStyle) {
    return SystemStyle;
  }

  return +[AVCaptureSmartStyle identityStyle];
}

- (id)activeSmartStyle
{
  internal = self->_internal;
  objc_sync_enter(internal);
  double v4 = self->_internal;
  if (v4->smartStyleRenderingOptedOut)
  {
    double v5 = +[AVCaptureSmartStyle identityStyle];
  }
  else
  {
    smartStyleSetByClient = v4->smartStyleSetByClient;
    if (smartStyleSetByClient) {
      double v5 = smartStyleSetByClient;
    }
    else {
      double v5 = [(AVCaptureSession *)self systemSmartStyle];
    }
  }
  uint64_t v7 = v5;
  objc_sync_exit(internal);
  return v7;
}

- (void)displaySmartStylesOptOutAlert
{
  void v19[5] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = AVCaptureClientPreferencesDomain();
  uint64_t HasShownOptOutMessagePreferenceKey = AVSmartStyleSettingsSystemStyleHasShownOptOutMessagePreferenceKey(v3);
  if (!+[AVCaptureProprietaryDefaultsSingleton objectForKey:HasShownOptOutMessagePreferenceKey])
  {
    internal = self->_internal;
    objc_sync_enter(internal);
    if (self->_internal->smartStyleAlertBundleName)
    {
      uint64_t v6 = [NSString stringWithFormat:@"“%@” Would Like To Turn Off Camera Styles", self->_internal->smartStyleAlertBundleName];
      smartStyleAlertOptOutDescriptiouint64_t n = self->_internal->smartStyleAlertOptOutDescription;
      uint64_t v8 = *MEMORY[0x1E4F1D9A8];
      v18[0] = *MEMORY[0x1E4F1D990];
      v18[1] = v8;
      v19[0] = v6;
      v19[1] = smartStyleAlertOptOutDescription;
      uint64_t v9 = *MEMORY[0x1E4F1D9D0];
      void v18[2] = *MEMORY[0x1E4F1D9E0];
      v18[3] = v9;
      v19[2] = @"Turn Off";
      v19[3] = @"Cancel";
      v18[4] = *MEMORY[0x1E4F1D9B8];
      v19[4] = MEMORY[0x1E4F1CC38];
      CFDictionaryRef v10 = (const __CFDictionary *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:5];
      SInt32 error = 0;
      int v11 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0.0, 2uLL, &error, v10);
      int v12 = v11;
      if (v11)
      {
        if (error)
        {
          BOOL v13 = 1;
        }
        else
        {
          CFOptionFlags responseFlags = 0;
          SInt32 v14 = CFUserNotificationReceiveResponse(v11, 0.0, &responseFlags);
          SInt32 error = v14;
          BOOL v13 = (responseFlags & 3) != 0 || v14 != 0;
        }
        CFRelease(v12);
      }
      else
      {
        BOOL v13 = 1;
      }
      self->_internal->smartStyleRenderingOptedOut = !v13;
      objc_sync_exit(internal);
      +[AVCaptureProprietaryDefaultsSingleton setObject:MEMORY[0x1E4F1CC38] forKey:HasShownOptOutMessagePreferenceKey];
      [(AVCaptureSession *)self setSystemStyleEnabled:v13];
    }
    else
    {
      objc_sync_exit(internal);
    }
  }
}

- (void)setSystemStyleEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  double v4 = AVCaptureClientPreferencesDomain();

  AVSmartStyleSettingsSetSystemStyleEnabledForBundleID(v3, (uint64_t)v4);
}

- (BOOL)isValidSystemStyle:(id)a3
{
  if (a3) {
    return objc_msgSend(a3, "isEqual:", objc_msgSend(MEMORY[0x1E4F1CA98], "null")) ^ 1;
  }
  else {
    return 0;
  }
}

- (void)setContinuityCameraIsWired:(BOOL)a3
{
  if (self->_internal->continuityCameraIsWired != a3)
  {
    [(AVCaptureSession *)self _beginConfiguration];
    self->_internal->continuityCameraIsWired = a3;
    [(AVCaptureSession *)self _commitConfiguration];
  }
}

- (BOOL)continuityCameraIsWired
{
  return self->_internal->continuityCameraIsWired;
}

- (void)setContinuityCameraClientDeviceClass:(int)a3
{
  if (self->_internal->continuityCameraClientDeviceClass != a3)
  {
    [(AVCaptureSession *)self _beginConfiguration];
    self->_internal->continuityCameraClientDeviceClass = a3;
    [(AVCaptureSession *)self _commitConfiguration];
  }
}

- (int)continuityCameraClientDeviceClass
{
  return self->_internal->continuityCameraClientDeviceClass;
}

- (void)setSuppressVideoEffects:(BOOL)a3
{
  if (self->_internal->suppressVideoEffects != a3)
  {
    [(AVCaptureSession *)self _beginConfiguration];
    [(AVCaptureSession *)self willChangeValueForKey:@"suppressVideoEffects"];
    self->_internal->suppressVideoEffects = a3;
    [(AVCaptureSession *)self didChangeValueForKey:@"suppressVideoEffects"];
    [(AVCaptureSession *)self _commitConfiguration];
  }
}

- (BOOL)suppressVideoEffects
{
  return self->_internal->suppressVideoEffects;
}

@end