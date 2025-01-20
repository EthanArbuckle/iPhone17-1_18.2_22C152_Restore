@interface CMContinuityCaptureRemoteVideoDevice
- (AVCaptureConnection)videoDataConnection;
- (AVCaptureDevice)videoDevice;
- (AVCaptureDeviceFormat)format;
- (AVCaptureDeviceInput)videoDataInput;
- (AVCaptureVideoDataOutput)videoDataOutput;
- (BOOL)_companionConnectionsRequired;
- (BOOL)_deviceFormat:(id)a3 isCompatibleWithConfiguration:(id)a4 requiringMultiCamSupport:(BOOL)a5 minFrameRate:(unsigned int)a6 maxFrameRate:(unsigned int)a7;
- (BOOL)_dockKitNotificationAgentIsTracking;
- (BOOL)_isUltraWideCameraSupported;
- (BOOL)_shouldOnlyDisableVideoConnection;
- (BOOL)_shouldPrintDroppedSampleBufferLog:(int64_t)a3;
- (BOOL)backgroundReplacement;
- (BOOL)centerStageEnabled;
- (BOOL)configureConnections;
- (BOOL)faceDrivenAFActive;
- (BOOL)isDockedTrackingEnabled;
- (BOOL)isGazeSelectionEnabled;
- (BOOL)isStreamingOnSuperWide;
- (BOOL)portraitEffect;
- (BOOL)reactionEffects;
- (BOOL)shouldRestoreCenterStageOnWideCamera;
- (BOOL)startAVConferenceStack:(unint64_t)a3;
- (BOOL)startCameraCaptureStack:(unint64_t)a3;
- (BOOL)stopAVConferenceStack;
- (BOOL)stopCameraCaptureStack:(unint64_t)a3;
- (BOOL)studioLighting;
- (BOOL)suppressVideoEffects;
- (CMContinuityCaptureAVCaptureVideoSession)captureSession;
- (CMContinuityCaptureRemoteVideoDevice)companionDevice;
- (CMContinuityCaptureRemoteVideoDevice)initWithCapabilities:(id)a3 compositeDelegate:(id)a4 captureSession:(id)a5;
- (NSArray)connections;
- (NSDictionary)centerStageRectOfInterest;
- (__CVBuffer)backgroundReplacementPixelBuffer;
- (double)videoZoomFactor;
- (float)portraitEffectAperture;
- (float)reactionEffectGesturesEnabled;
- (float)studioLightingIntensity;
- (id)_avfDeviceTypeForManualFramingDeviceType:(int64_t)a3;
- (id)_selectVideoDeviceForConfiguration:(id)a3;
- (id)compatibleDeviceFormatForMaxFrameRate:(unsigned int)a3 minFrameRate:(unsigned int)a4;
- (id)connectionsForConfiguration:(id)a3;
- (id)controls;
- (id)createAVCVideoStream;
- (id)newVideoStreamCurrentConfiguration:(int64_t)a3;
- (int64_t)centerStageFramingMode;
- (int64_t)deskViewCameraMode;
- (unsigned)maxFrameRate;
- (unsigned)minFrameRate;
- (unsigned)throttledMaxFrameRate;
- (void)_configureVideoEffects;
- (void)_disableCenterStage;
- (void)_disableManualFraming;
- (void)_enableCenterStage;
- (void)_enableManualFraming;
- (void)_forcefullyEnableCenterStageOnSuperWide;
- (void)_observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)_registerDockKitNotification;
- (void)_restoreStatesAfterForcefulCenterStageEnablementAndShouldReconfigureCaptureStack:(BOOL)a3;
- (void)_stopCameraCaptureStackRemoveCaptureSessionConnectionsWithOption:(unint64_t)a3;
- (void)_toggleBetweenCenterStageAndManualFraming;
- (void)_updateControlStatus;
- (void)_updateManualFramingDeviceType:(int64_t)a3;
- (void)_updatePhotoOutputConfigs;
- (void)addVideoDeviceKVOs;
- (void)captureOutput:(id)a3 didDropSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5;
- (void)captureOutput:(id)a3 didFinishCaptureForResolvedSettings:(id)a4 error:(id)a5;
- (void)captureOutput:(id)a3 didFinishProcessingPhoto:(id)a4 error:(id)a5;
- (void)captureOutput:(id)a3 didOutputSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5;
- (void)captureStillImage:(id)a3 entity:(int64_t)a4 completion:(id)a5;
- (void)configureConnections;
- (void)didStartStreamInput:(id)a3;
- (void)didStopStreamInput:(id)a3;
- (void)dispatchFrame:(opaqueCMSampleBuffer *)a3 entity:(int64_t)a4 completion:(id)a5;
- (void)enqueueReactionEffect:(id)a3 entity:(int64_t)a4;
- (void)invalidate;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)postAVCStreamInterruption;
- (void)postActionCompletionForEventName:(id)a3 eventData:(id)a4 error:(id)a5;
- (void)postActionOfType:(unint64_t)a3 forEvent:(id)a4 option:(unint64_t)a5;
- (void)removeVideoDeviceKVOs;
- (void)serverDidDie;
- (void)setBackgroundReplacement:(BOOL)a3;
- (void)setBackgroundReplacementPixelBuffer:(__CVBuffer *)a3;
- (void)setCenterStageEnabled:(BOOL)a3;
- (void)setCenterStageFramingMode:(int64_t)a3;
- (void)setCenterStageRectOfInterest:(id)a3;
- (void)setCompanionDevice:(id)a3;
- (void)setConnections:(id)a3;
- (void)setDeskViewCameraMode:(int64_t)a3;
- (void)setDockedTrackingEnabled:(BOOL)a3;
- (void)setFaceDrivenAFActive:(BOOL)a3;
- (void)setFormat:(id)a3;
- (void)setMaxFrameRate:(unsigned int)a3;
- (void)setMinFrameDurationOverrideIfApplicable;
- (void)setMinFrameRate:(unsigned int)a3;
- (void)setPortraitEffect:(BOOL)a3;
- (void)setPortraitEffectAperture:(float)a3;
- (void)setReactionEffectGesturesEnabled:(float)a3;
- (void)setReactionEffects:(BOOL)a3;
- (void)setShouldRestoreCenterStageOnWideCamera:(BOOL)a3;
- (void)setStudioLighting:(BOOL)a3;
- (void)setStudioLightingIntensity:(float)a3;
- (void)setSuppressVideoEffects:(BOOL)a3;
- (void)setValueForControl:(id)a3 completion:(id)a4;
- (void)setVideoDataConnection:(id)a3;
- (void)setVideoDataInput:(id)a3;
- (void)setVideoDataOutput:(id)a3;
- (void)setVideoDevice:(id)a3;
- (void)setVideoZoomFactor:(double)a3;
- (void)setupControls;
- (void)stopCaptureStack:(unint64_t)a3 completion:(id)a4;
- (void)stream:(id)a3 didStart:(BOOL)a4 error:(id)a5;
- (void)streamDidRTCPTimeOut:(id)a3;
- (void)streamDidRTPTimeOut:(id)a3;
- (void)streamDidServerDie:(id)a3;
- (void)streamDidStop:(id)a3;
- (void)tearDownConnectionsWithVideoDataConnectionDisabled:(BOOL)a3;
- (void)terminateComplete:(id)a3;
- (void)updateControlStatus;
@end

@implementation CMContinuityCaptureRemoteVideoDevice

- (CMContinuityCaptureRemoteVideoDevice)initWithCapabilities:(id)a3 compositeDelegate:(id)a4 captureSession:(id)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v9 server];
  v12 = v11;
  if (!v11) {
    goto LABEL_8;
  }
  v13 = [v11 localDevice];
  v14 = [v10 queue];
  v24.receiver = self;
  v24.super_class = (Class)CMContinuityCaptureRemoteVideoDevice;
  self = [(CMContinuityCaptureDeviceBase *)&v24 initWithCapabilities:v8 compositeDelegate:v9 transportDevice:v13 queue:v14];

  if (self)
  {
    objc_storeStrong((id *)&self->_captureSession, a5);
    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    cmControlByName = self->_cmControlByName;
    self->_cmControlByName = v15;

    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    cmControlByNameWithPendingUpdates = self->_cmControlByNameWithPendingUpdates;
    self->_cmControlByNameWithPendingUpdates = v17;

    self->_isUltraWideCameraSupported = [(CMContinuityCaptureRemoteVideoDevice *)self _isUltraWideCameraSupported];
    self->_BOOL gazeSelectionEnabled = [v12 clientDeviceModel] != 2;
    v19 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      BOOL gazeSelectionEnabled = self->_gazeSelectionEnabled;
      uint64_t v21 = [v12 clientDeviceModel];
      *(_DWORD *)buf = 138412802;
      v26 = self;
      __int16 v27 = 1024;
      BOOL v28 = gazeSelectionEnabled;
      __int16 v29 = 2048;
      uint64_t v30 = v21;
      _os_log_impl(&dword_235FC2000, v19, OS_LOG_TYPE_DEFAULT, "%@ gazeSelectionEnabled %d, clientDeviceModel %ld", buf, 0x1Cu);
    }

    if ([(CMContinuityCaptureDeviceBase *)self entity] == 1) {
      [(CMContinuityCaptureRemoteVideoDevice *)self _registerDockKitNotification];
    }
    self->_manualFramingFeatureFlagEnabled = _os_feature_enabled_impl();
    [(CMContinuityCaptureRemoteVideoDevice *)self setupControls];
    self = self;
    v22 = self;
  }
  else
  {
LABEL_8:
    v22 = 0;
  }

  return v22;
}

- (void)terminateComplete:(id)a3
{
  id v4 = a3;
  dockKitNotificationAgent = self->_dockKitNotificationAgent;
  if (dockKitNotificationAgent) {
    [(DKNotificationAgent *)dockKitNotificationAgent deregisterNotifications];
  }
  v6.receiver = self;
  v6.super_class = (Class)CMContinuityCaptureRemoteVideoDevice;
  [(CMContinuityCaptureDeviceBase *)&v6 terminateComplete:v4];
}

- (void)setupControls
{
  v35[9] = *MEMORY[0x263EF8340];
  v35[0] = @"4cc_cfac_glob_0000";
  v35[1] = @"PortraitEffectActive";
  v35[2] = @"StudioLightingActive";
  v35[3] = @"ReactionEffectsActive";
  v35[4] = @"ReactionsInProgress";
  v35[5] = @"BackgroundReplacementActive";
  v35[6] = @"CMIOExtensionPropertyStreamFrameDuration";
  v35[7] = @"CMIOExtensionPropertyStreamMaxFrameDuration";
  v35[8] = @"OverheadCameraMode";
  [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:9];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    v5 = 0;
    uint64_t v6 = *(void *)v30;
    do
    {
      uint64_t v7 = 0;
      id v8 = v5;
      do
      {
        if (*(void *)v30 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v29 + 1) + 8 * v7);
        id v10 = [CMContinuityCaptureControl alloc];
        int64_t v11 = [(CMContinuityCaptureDeviceBase *)self entity];
        long long v27 = xmmword_2360594C8;
        uint64_t v28 = 0;
        v5 = [(CMContinuityCaptureControl *)v10 initWithName:v9 attributes:0 entity:v11 minimumSupportedVersion:&v27 value:&unk_26E96A360];

        [(NSMutableDictionary *)self->_cmControlByName setObject:v5 forKeyedSubscript:v9];
        ++v7;
        id v8 = v5;
      }
      while (v4 != v7);
      uint64_t v4 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v4);
  }
  v12 = [(CMContinuityCaptureDeviceBase *)self capabilities];
  v13 = [v12 controls];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v14 = v13;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v33 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v24 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        cmControlByName = self->_cmControlByName;
        uint64_t v21 = [v19 name];
        [(NSMutableDictionary *)cmControlByName setObject:v19 forKeyedSubscript:v21];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v23 objects:v33 count:16];
    }
    while (v16);
  }
}

- (id)controls
{
  return (id)[(NSMutableDictionary *)self->_cmControlByName allValues];
}

- (BOOL)isStreamingOnSuperWide
{
  if (![(CMContinuityCaptureDeviceBase *)self streaming])
  {
    LOBYTE(v7) = 0;
    return v7;
  }
  uint64_t v3 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
  if ([v3 centerStageEnabled])
  {
  }
  else
  {
    uint64_t v4 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
    int v5 = [v4 isCenterStageForcefullyEnabled];

    if (!v5)
    {
      uint64_t v6 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
      LOBYTE(v7) = [v6 manualFramingDeviceType] == 2;
      goto LABEL_7;
    }
  }
  uint64_t v6 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
  int v7 = [v6 centerStageFieldOfViewRestrictedToWide] ^ 1;
LABEL_7:

  return v7;
}

- (NSArray)connections
{
  return self->_connections;
}

- (void)setConnections:(id)a3
{
}

- (AVCaptureDeviceInput)videoDataInput
{
  return self->_videoDataInput;
}

- (void)setVideoDataInput:(id)a3
{
}

- (AVCaptureDevice)videoDevice
{
  return self->_videoDevice;
}

- (void)setVideoDevice:(id)a3
{
  uint64_t v4 = (AVCaptureDevice *)a3;
  if (self->_videoDevice) {
    [(CMContinuityCaptureRemoteVideoDevice *)self removeVideoDeviceKVOs];
  }
  videoDevice = self->_videoDevice;
  self->_videoDevice = v4;

  if (self->_videoDevice)
  {
    [(CMContinuityCaptureRemoteVideoDevice *)self addVideoDeviceKVOs];
  }
}

- (AVCaptureVideoDataOutput)videoDataOutput
{
  return self->_videoDataOutput;
}

- (void)setVideoDataOutput:(id)a3
{
}

- (AVCaptureConnection)videoDataConnection
{
  return self->_videoDataConnection;
}

- (void)setVideoDataConnection:(id)a3
{
}

- (BOOL)faceDrivenAFActive
{
  return [(AVCaptureDevice *)self->_videoDevice isFaceDrivenAutoFocusEnabled];
}

- (void)setFaceDrivenAFActive:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x263EF8340];
  int v5 = [(CMContinuityCaptureDeviceBase *)self queue];
  dispatch_assert_queue_V2(v5);

  videoDevice = self->_videoDevice;
  if (!videoDevice)
  {
    uint64_t v9 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[CMContinuityCaptureRemoteVideoDevice setFaceDrivenAFActive:]();
    }
    goto LABEL_10;
  }
  if (![(AVCaptureDevice *)videoDevice isFocusModeSupported:2])
  {
    uint64_t v9 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = self->_videoDevice;
      int v11 = 138412802;
      v12 = self;
      __int16 v13 = 2080;
      id v14 = "-[CMContinuityCaptureRemoteVideoDevice setFaceDrivenAFActive:]";
      __int16 v15 = 2112;
      uint64_t v16 = v10;
      _os_log_impl(&dword_235FC2000, v9, OS_LOG_TYPE_DEFAULT, "%@ %s Capture device (%@) does not support auto-focus.", (uint8_t *)&v11, 0x20u);
    }
LABEL_10:

    return;
  }
  [(AVCaptureDevice *)self->_videoDevice lockForConfiguration:0];
  int v7 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = @"off";
    if (v3) {
      id v8 = @"on";
    }
    int v11 = 138412802;
    v12 = self;
    __int16 v13 = 2080;
    id v14 = "-[CMContinuityCaptureRemoteVideoDevice setFaceDrivenAFActive:]";
    __int16 v15 = 2112;
    uint64_t v16 = v8;
    _os_log_impl(&dword_235FC2000, v7, OS_LOG_TYPE_DEFAULT, "%@ %s Turn %@ face-driven auto-focus.", (uint8_t *)&v11, 0x20u);
  }

  [(AVCaptureDevice *)self->_videoDevice setAutomaticallyAdjustsFaceDrivenAutoFocusEnabled:0];
  [(AVCaptureDevice *)self->_videoDevice setFaceDrivenAutoFocusEnabled:v3];
  [(AVCaptureDevice *)self->_videoDevice setAutomaticallyAdjustsFaceDrivenAutoFocusEnabled:v3];
  [(AVCaptureDevice *)self->_videoDevice setFocusMode:2];
  [(AVCaptureDevice *)self->_videoDevice unlockForConfiguration];
}

- (int64_t)deskViewCameraMode
{
  return [(AVCaptureDevice *)self->_videoDevice deskViewCameraMode];
}

- (void)setDeskViewCameraMode:(int64_t)a3
{
  int v5 = [(CMContinuityCaptureDeviceBase *)self queue];
  dispatch_assert_queue_V2(v5);

  videoDevice = self->_videoDevice;
  if (videoDevice
    && ([(AVCaptureDevice *)videoDevice isOverheadCameraModeSupported:a3] & 1) != 0)
  {
    [(AVCaptureDevice *)self->_videoDevice lockForConfiguration:0];
    [(AVCaptureDevice *)self->_videoDevice setDeskViewCameraMode:a3];
    [(AVCaptureDevice *)self->_videoDevice unlockForConfiguration];
    int v7 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
    [v7 setDeskViewCameraMode:a3];

    [(CMContinuityCaptureRemoteVideoDevice *)self updateControlStatus];
  }
  else
  {
    id v8 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CMContinuityCaptureRemoteVideoDevice setDeskViewCameraMode:]();
    }
  }
}

- (void)setFormat:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543618;
    uint64_t v9 = self;
    __int16 v10 = 2114;
    id v11 = v4;
    _os_log_impl(&dword_235FC2000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ setFormat %{public}@", (uint8_t *)&v8, 0x16u);
  }

  videoDevice = self->_videoDevice;
  if (videoDevice)
  {
    [(AVCaptureDevice *)videoDevice lockForConfiguration:0];
    [(AVCaptureDevice *)self->_videoDevice setActiveFormat:v4];
    [(AVCaptureDevice *)self->_videoDevice unlockForConfiguration];
  }
  else
  {
    int v7 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[CMContinuityCaptureRemoteVideoDevice setFaceDrivenAFActive:]();
    }
  }
}

- (AVCaptureDeviceFormat)format
{
  return [(AVCaptureDevice *)self->_videoDevice activeFormat];
}

- (void)setVideoZoomFactor:(double)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  int v5 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    long long v25 = self;
    __int16 v26 = 2048;
    double v27 = a3;
    _os_log_impl(&dword_235FC2000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ zoomFactor: %.2f", buf, 0x16u);
  }

  if (self->_videoDevice && ![(CMContinuityCaptureRemoteVideoDevice *)self centerStageEnabled])
  {
    [(AVCaptureDevice *)self->_videoDevice minAvailableVideoZoomFactor];
    if (v6 <= a3)
    {
      int v7 = [(AVCaptureDevice *)self->_videoDevice activeFormat];
      [v7 videoMaxZoomFactor];
      double v9 = v8;

      if (v9 >= a3)
      {
        videoDevice = self->_videoDevice;
        id v23 = 0;
        BOOL v11 = [(AVCaptureDevice *)videoDevice lockForConfiguration:&v23];
        uint64_t v12 = v23;
        if (v11)
        {
          [(AVCaptureDevice *)self->_videoDevice setVideoZoomFactor:a3];
          [(AVCaptureDevice *)self->_videoDevice unlockForConfiguration];
          uint64_t v13 = [(CMContinuityCaptureRemoteVideoDevice *)self companionDevice];
          if (v13)
          {
            id v14 = (void *)v13;
            __int16 v15 = [(CMContinuityCaptureRemoteVideoDevice *)self companionDevice];
            if ([v15 streaming])
            {
              BOOL v16 = [(CMContinuityCaptureDeviceBase *)self streaming];

              if (!v16)
              {
                uint64_t v17 = CMContinuityCaptureLog(2);
                if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
                  -[CMContinuityCaptureRemoteVideoDevice setVideoZoomFactor:]();
                }
LABEL_13:

                goto LABEL_19;
              }
            }
            else
            {
            }
          }
          v18 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
          [v18 setVideoZoomFactor:a3];
        }
        else
        {
          v18 = CMContinuityCaptureLog(2);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            v19 = self->_videoDevice;
            *(_DWORD *)buf = 138543874;
            long long v25 = self;
            __int16 v26 = 2112;
            double v27 = *(double *)&v19;
            __int16 v28 = 2112;
            long long v29 = v12;
            _os_log_error_impl(&dword_235FC2000, v18, OS_LOG_TYPE_ERROR, "%{public}@ Error locking %@ for configuration: %@", buf, 0x20u);
          }
        }

        [(CMContinuityCaptureRemoteVideoDevice *)self updateControlStatus];
        goto LABEL_19;
      }
    }
    uint64_t v12 = CMContinuityCaptureLog(2);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_19;
    }
    [(AVCaptureDevice *)self->_videoDevice minAvailableVideoZoomFactor];
    uint64_t v21 = v20;
    uint64_t v17 = [(AVCaptureDevice *)self->_videoDevice activeFormat];
    [v17 videoMaxZoomFactor];
    *(_DWORD *)buf = 138544130;
    long long v25 = self;
    __int16 v26 = 2048;
    double v27 = a3;
    __int16 v28 = 2048;
    long long v29 = v21;
    __int16 v30 = 2048;
    uint64_t v31 = v22;
    _os_log_error_impl(&dword_235FC2000, v12, OS_LOG_TYPE_ERROR, "%{public}@ Unsupported zoom factor (%.2f). Supported range: [%.2f-%.2f]", buf, 0x2Au);
    goto LABEL_13;
  }
  uint64_t v12 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    -[CMContinuityCaptureRemoteVideoDevice setVideoZoomFactor:]();
  }
LABEL_19:
}

- (double)videoZoomFactor
{
  [(AVCaptureDevice *)self->_videoDevice videoZoomFactor];
  return result;
}

- (unsigned)maxFrameRate
{
  v2 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
  unsigned int v3 = [v2 maxFrameRate];

  return v3;
}

- (void)setMaxFrameRate:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v56 = *MEMORY[0x263EF8340];
  int v5 = [(CMContinuityCaptureDeviceBase *)self queue];
  dispatch_assert_queue_V2(v5);

  p_videoDevice = &self->_videoDevice;
  videoDevice = self->_videoDevice;
  if (videoDevice)
  {
    double v8 = [(AVCaptureDevice *)videoDevice activeFormat];

    if (v8)
    {
      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      double v9 = [(AVCaptureDevice *)*p_videoDevice activeFormat];
      __int16 v10 = [v9 videoSupportedFrameRateRanges];

      uint64_t v11 = [v10 countByEnumeratingWithState:&v45 objects:v55 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        char v13 = 0;
        uint64_t v14 = *(void *)v46;
        double v15 = (double)v3;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v46 != v14) {
              objc_enumerationMutation(v10);
            }
            uint64_t v17 = *(void **)(*((void *)&v45 + 1) + 8 * i);
            [v17 minFrameRate];
            if (v18 <= v15)
            {
              [v17 maxFrameRate];
              if (v19 >= v15) {
                char v13 = 1;
              }
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v45 objects:v55 count:16];
        }
        while (v12);

        if (v13) {
          goto LABEL_25;
        }
      }
      else
      {
      }
      v20 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v40 = [(AVCaptureDevice *)*p_videoDevice activeFormat];
        v41 = [v40 videoSupportedFrameRateRanges];
        *(_DWORD *)buf = 138543874;
        v50 = self;
        __int16 v51 = 1024;
        *(_DWORD *)v52 = v3;
        *(_WORD *)&v52[4] = 2112;
        *(void *)&v52[6] = v41;
        _os_log_error_impl(&dword_235FC2000, v20, OS_LOG_TYPE_ERROR, "%{public}@ Unsupported max frame rate %u. Supported ranges: %@", buf, 0x1Cu);
      }
      uint64_t v21 = [(AVCaptureDevice *)*p_videoDevice activeFormat];
      uint64_t v22 = [v21 videoSupportedFrameRateRanges];
      if (v22)
      {
        id v23 = [(AVCaptureDevice *)*p_videoDevice activeFormat];
        long long v24 = [v23 videoSupportedFrameRateRanges];
        if ([v24 count])
        {
          long long v25 = [(AVCaptureDevice *)*p_videoDevice activeFormat];
          __int16 v26 = [v25 videoSupportedFrameRateRanges];
          double v27 = [v26 lastObject];
          [v27 maxFrameRate];
          uint64_t v3 = v28;
        }
        else
        {
          uint64_t v3 = 0;
        }
      }
      else
      {
        uint64_t v3 = 0;
      }

LABEL_25:
      if (v3)
      {
        long long v29 = *p_videoDevice;
        id v44 = 0;
        BOOL v30 = [(AVCaptureDevice *)v29 lockForConfiguration:&v44];
        uint64_t v31 = v44;
        if (v30)
        {
          uint64_t v32 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
          [v32 setMaxFrameRate:v3];

          v33 = *p_videoDevice;
          CMTimeMake(&v43, 1, v3);
          [(AVCaptureDevice *)v33 setActiveVideoMinFrameDuration:&v43];
          v34 = CMContinuityCaptureLog(2);
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            v35 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
            int v36 = [v35 maxFrameRate];
            v37 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
            int v38 = [v37 minFrameRate];
            *(_DWORD *)buf = 138544386;
            v50 = self;
            __int16 v51 = 2080;
            *(void *)v52 = "-[CMContinuityCaptureRemoteVideoDevice setMaxFrameRate:]";
            *(_WORD *)&v52[8] = 1024;
            *(_DWORD *)&v52[10] = v3;
            *(_WORD *)&v52[14] = 1024;
            *(_DWORD *)&v52[16] = v36;
            __int16 v53 = 1024;
            int v54 = v38;
            _os_log_impl(&dword_235FC2000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@ %s Setting Device MaxFrameRate to %u. _activeConfiguration.maxFrameRate: %u _activeConfiguration.minFrameRate: %u", buf, 0x28u);
          }
          [(AVCaptureDevice *)*p_videoDevice unlockForConfiguration];
        }
        else
        {
          v39 = CMContinuityCaptureLog(2);
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          {
            v42 = *p_videoDevice;
            *(_DWORD *)buf = 138543874;
            v50 = self;
            __int16 v51 = 2112;
            *(void *)v52 = v42;
            *(_WORD *)&v52[8] = 2112;
            *(void *)&v52[10] = v31;
            _os_log_error_impl(&dword_235FC2000, v39, OS_LOG_TYPE_ERROR, "%{public}@ Error locking %@ for configuration: %@", buf, 0x20u);
          }
        }
        [(CMContinuityCaptureRemoteVideoDevice *)self _updateControlStatus];
      }
      else
      {
        uint64_t v31 = CMContinuityCaptureLog(2);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
          -[CMContinuityCaptureRemoteVideoDevice setMaxFrameRate:]();
        }
      }
      goto LABEL_34;
    }
    uint64_t v31 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      [(CMContinuityCaptureRemoteVideoDevice *)(uint64_t)self setMaxFrameRate:v31];
    }
  }
  else
  {
    uint64_t v31 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      -[CMContinuityCaptureRemoteVideoDevice setFaceDrivenAFActive:]();
    }
  }
LABEL_34:
}

- (unsigned)minFrameRate
{
  v2 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
  unsigned int v3 = [v2 minFrameRate];

  return v3;
}

- (void)setMinFrameRate:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v56 = *MEMORY[0x263EF8340];
  int v5 = [(CMContinuityCaptureDeviceBase *)self queue];
  dispatch_assert_queue_V2(v5);

  p_videoDevice = &self->_videoDevice;
  videoDevice = self->_videoDevice;
  if (videoDevice)
  {
    double v8 = [(AVCaptureDevice *)videoDevice activeFormat];

    if (v8)
    {
      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      double v9 = [(AVCaptureDevice *)*p_videoDevice activeFormat];
      __int16 v10 = [v9 videoSupportedFrameRateRanges];

      uint64_t v11 = [v10 countByEnumeratingWithState:&v45 objects:v55 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        char v13 = 0;
        uint64_t v14 = *(void *)v46;
        double v15 = (double)v3;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v46 != v14) {
              objc_enumerationMutation(v10);
            }
            uint64_t v17 = *(void **)(*((void *)&v45 + 1) + 8 * i);
            [v17 minFrameRate];
            if (v18 <= v15)
            {
              [v17 maxFrameRate];
              if (v19 >= v15) {
                char v13 = 1;
              }
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v45 objects:v55 count:16];
        }
        while (v12);

        if (v13) {
          goto LABEL_25;
        }
      }
      else
      {
      }
      v20 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v40 = [(AVCaptureDevice *)*p_videoDevice activeFormat];
        v41 = [v40 videoSupportedFrameRateRanges];
        *(_DWORD *)buf = 138543874;
        v50 = self;
        __int16 v51 = 1024;
        *(_DWORD *)v52 = v3;
        *(_WORD *)&v52[4] = 2112;
        *(void *)&v52[6] = v41;
        _os_log_error_impl(&dword_235FC2000, v20, OS_LOG_TYPE_ERROR, "%{public}@ Unsupported min frame rate %u. Supported ranges: %@", buf, 0x1Cu);
      }
      uint64_t v21 = [(AVCaptureDevice *)*p_videoDevice activeFormat];
      uint64_t v22 = [v21 videoSupportedFrameRateRanges];
      if (v22)
      {
        id v23 = [(AVCaptureDevice *)*p_videoDevice activeFormat];
        long long v24 = [v23 videoSupportedFrameRateRanges];
        if ([v24 count])
        {
          long long v25 = [(AVCaptureDevice *)*p_videoDevice activeFormat];
          __int16 v26 = [v25 videoSupportedFrameRateRanges];
          double v27 = [v26 lastObject];
          [v27 minFrameRate];
          uint64_t v3 = v28;
        }
        else
        {
          uint64_t v3 = 0;
        }
      }
      else
      {
        uint64_t v3 = 0;
      }

LABEL_25:
      if (v3)
      {
        long long v29 = *p_videoDevice;
        id v44 = 0;
        BOOL v30 = [(AVCaptureDevice *)v29 lockForConfiguration:&v44];
        uint64_t v31 = v44;
        if (v30)
        {
          uint64_t v32 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
          [v32 setMinFrameRate:v3];

          v33 = *p_videoDevice;
          CMTimeMake(&v43, 1, v3);
          [(AVCaptureDevice *)v33 setActiveVideoMaxFrameDuration:&v43];
          v34 = CMContinuityCaptureLog(2);
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            v35 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
            int v36 = [v35 maxFrameRate];
            v37 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
            int v38 = [v37 minFrameRate];
            *(_DWORD *)buf = 138544386;
            v50 = self;
            __int16 v51 = 2080;
            *(void *)v52 = "-[CMContinuityCaptureRemoteVideoDevice setMinFrameRate:]";
            *(_WORD *)&v52[8] = 1024;
            *(_DWORD *)&v52[10] = v3;
            *(_WORD *)&v52[14] = 1024;
            *(_DWORD *)&v52[16] = v36;
            __int16 v53 = 1024;
            int v54 = v38;
            _os_log_impl(&dword_235FC2000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@ %s Setting Device MinFrameRate to %u. _activeConfiguration.maxFrameRate: %u _activeConfiguration.minFrameRate: %u", buf, 0x28u);
          }
          [(AVCaptureDevice *)*p_videoDevice unlockForConfiguration];
        }
        else
        {
          v39 = CMContinuityCaptureLog(2);
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          {
            v42 = *p_videoDevice;
            *(_DWORD *)buf = 138543874;
            v50 = self;
            __int16 v51 = 2112;
            *(void *)v52 = v42;
            *(_WORD *)&v52[8] = 2112;
            *(void *)&v52[10] = v31;
            _os_log_error_impl(&dword_235FC2000, v39, OS_LOG_TYPE_ERROR, "%{public}@ Error locking %@ for configuration: %@", buf, 0x20u);
          }
        }
        [(CMContinuityCaptureRemoteVideoDevice *)self updateControlStatus];
      }
      else
      {
        uint64_t v31 = CMContinuityCaptureLog(2);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
          -[CMContinuityCaptureRemoteVideoDevice setMaxFrameRate:]();
        }
      }
      goto LABEL_34;
    }
    uint64_t v31 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      [(CMContinuityCaptureRemoteVideoDevice *)(uint64_t)self setMaxFrameRate:v31];
    }
  }
  else
  {
    uint64_t v31 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      -[CMContinuityCaptureRemoteVideoDevice setFaceDrivenAFActive:]();
    }
  }
LABEL_34:
}

- (BOOL)centerStageEnabled
{
  return [MEMORY[0x263EFA598] isCenterStageEnabled];
}

- (void)setCenterStageEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x263EF8340];
  int v5 = [(CMContinuityCaptureDeviceBase *)self queue];
  dispatch_assert_queue_V2(v5);

  double v6 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = "No";
    if (v3) {
      int v7 = "Yes";
    }
    int v11 = 138543618;
    uint64_t v12 = self;
    __int16 v13 = 2080;
    uint64_t v14 = v7;
    _os_log_impl(&dword_235FC2000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ CenterStageEnabled: %s", (uint8_t *)&v11, 0x16u);
  }

  videoDevice = self->_videoDevice;
  if (!videoDevice)
  {
    __int16 v10 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[CMContinuityCaptureRemoteVideoDevice setFaceDrivenAFActive:]();
    }
    goto LABEL_18;
  }
  double v9 = [(AVCaptureDevice *)videoDevice activeFormat];

  if (!v9)
  {
    __int16 v10 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[CMContinuityCaptureRemoteVideoDevice setCenterStageEnabled:]();
    }
LABEL_18:

    return;
  }
  if (v3)
  {
    if (self->_manualFramingFeatureFlagEnabled) {
      [(CMContinuityCaptureRemoteVideoDevice *)self _disableManualFraming];
    }
    [(CMContinuityCaptureRemoteVideoDevice *)self _enableCenterStage];
  }
  else
  {
    [(CMContinuityCaptureRemoteVideoDevice *)self _disableCenterStage];
    if (self->_manualFramingFeatureFlagEnabled) {
      [(CMContinuityCaptureRemoteVideoDevice *)self _enableManualFraming];
    }
  }
}

- (void)_enableManualFraming
{
  OUTLINED_FUNCTION_14();
  v1 = [v0 videoDevice];
  v2 = [v1 localizedName];
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_6_0(&dword_235FC2000, v3, v4, "%{public}@ %s Failed to lock %@ for configuration", v5, v6, v7, v8, v9);
}

- (void)_disableManualFraming
{
  OUTLINED_FUNCTION_14();
  v1 = [v0 videoDevice];
  v2 = [v1 localizedName];
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_6_0(&dword_235FC2000, v3, v4, "%{public}@ %s Failed to lock %@ for configuration", v5, v6, v7, v8, v9);
}

- (void)_enableCenterStage
{
  OUTLINED_FUNCTION_14();
  v1 = [v0 videoDevice];
  v2 = [v1 localizedName];
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_6_0(&dword_235FC2000, v3, v4, "%{public}@ %s Failed to lock %@ for configuration", v5, v6, v7, v8, v9);
}

- (void)_disableCenterStage
{
  uint64_t v3 = [(CMContinuityCaptureDeviceBase *)self queue];
  dispatch_assert_queue_V2(v3);

  [MEMORY[0x263EFA598] setCenterStageControlMode:1];
  [MEMORY[0x263EFA598] setCenterStageEnabled:0];
  [(CMContinuityCaptureRemoteVideoDevice *)self _updateControlStatus];
}

- (NSDictionary)centerStageRectOfInterest
{
  CFDictionaryRef v3 = &unk_26E96A868;
  videoDevice = self->_videoDevice;
  if (videoDevice)
  {
    [(AVCaptureDevice *)videoDevice centerStageRectOfInterest];
    CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v8);

    CFDictionaryRef v3 = DictionaryRepresentation;
  }
  return (NSDictionary *)v3;
}

- (void)setCenterStageRectOfInterest:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  CFDictionaryRef v4 = (const __CFDictionary *)a3;
  CGSize v5 = *(CGSize *)(MEMORY[0x263F001A0] + 16);
  rect.origin = (CGPoint)*MEMORY[0x263F001A0];
  rect.size = v5;
  uint64_t v6 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v15 = self;
    __int16 v16 = 2112;
    uint64_t v17 = v4;
    _os_log_impl(&dword_235FC2000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ centerStageRectOfInterest: %@", buf, 0x16u);
  }

  if (self->_videoDevice
    && [(CMContinuityCaptureRemoteVideoDevice *)self centerStageEnabled]
    && CGRectMakeWithDictionaryRepresentation(v4, &rect))
  {
    videoDevice = self->_videoDevice;
    id v12 = 0;
    BOOL v8 = [(AVCaptureDevice *)videoDevice lockForConfiguration:&v12];
    uint8_t v9 = v12;
    if (v8)
    {
      -[AVCaptureDevice setCenterStageRectOfInterest:](self->_videoDevice, "setCenterStageRectOfInterest:", rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
      [(AVCaptureDevice *)self->_videoDevice unlockForConfiguration];
    }
    else
    {
      __int16 v10 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v11 = self->_videoDevice;
        *(_DWORD *)buf = 138543874;
        uint64_t v15 = self;
        __int16 v16 = 2112;
        uint64_t v17 = v11;
        __int16 v18 = 2112;
        double v19 = v9;
        _os_log_error_impl(&dword_235FC2000, v10, OS_LOG_TYPE_ERROR, "%{public}@ Error locking %@ for configuration: %@", buf, 0x20u);
      }
    }
  }
  else
  {
    uint8_t v9 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[CMContinuityCaptureRemoteVideoDevice setCenterStageRectOfInterest:]();
    }
  }
}

- (int64_t)centerStageFramingMode
{
  v2 = [(CMContinuityCaptureDeviceBase *)self queue];
  dispatch_assert_queue_V2(v2);

  CFDictionaryRef v3 = (void *)MEMORY[0x263EFA598];
  return [v3 centerStageFramingMode];
}

- (void)setCenterStageFramingMode:(int64_t)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  CGSize v5 = [(CMContinuityCaptureDeviceBase *)self queue];
  dispatch_assert_queue_V2(v5);

  [MEMORY[0x263EFA598] setCenterStageFramingMode:a3];
  uint64_t v6 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543618;
    BOOL v8 = self;
    __int16 v9 = 1024;
    int v10 = a3;
    _os_log_impl(&dword_235FC2000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ centerStageFramingMode: %d", (uint8_t *)&v7, 0x12u);
  }
}

- (BOOL)suppressVideoEffects
{
  v2 = [(CMContinuityCaptureRemoteVideoDevice *)self captureSession];
  CFDictionaryRef v3 = [v2 captureSession];
  char v4 = [v3 suppressVideoEffects];

  return v4;
}

- (void)setSuppressVideoEffects:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v26 = *MEMORY[0x263EF8340];
  CGSize v5 = [(CMContinuityCaptureDeviceBase *)self queue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = "No";
    if (v3) {
      int v7 = "Yes";
    }
    *(_DWORD *)buf = 138543618;
    uint64_t v21 = self;
    __int16 v22 = 2080;
    id v23 = v7;
    _os_log_impl(&dword_235FC2000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ SuppressVideoEffects: %s", buf, 0x16u);
  }

  p_videoDevice = (id *)&self->_videoDevice;
  videoDevice = self->_videoDevice;
  if (videoDevice)
  {
    int v10 = [(AVCaptureDevice *)videoDevice activeFormat];

    if (v10)
    {
      id v11 = *p_videoDevice;
      id v19 = 0;
      int v12 = [v11 lockForConfiguration:&v19];
      __int16 v13 = v19;
      if (v12)
      {
        uint64_t v14 = [(CMContinuityCaptureRemoteVideoDevice *)self captureSession];
        uint64_t v15 = [v14 captureSession];
        [v15 setSuppressVideoEffects:v3];

        __int16 v16 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
        [v16 setSuppressVideoEffects:v3];

        [*p_videoDevice unlockForConfiguration];
      }
      else
      {
        uint64_t v17 = CMContinuityCaptureLog(2);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          __int16 v18 = (const char *)*p_videoDevice;
          *(_DWORD *)buf = 138543874;
          uint64_t v21 = self;
          __int16 v22 = 2112;
          id v23 = v18;
          __int16 v24 = 2112;
          long long v25 = v13;
          _os_log_error_impl(&dword_235FC2000, v17, OS_LOG_TYPE_ERROR, "%{public}@ Error locking %@ for configuration: %@", buf, 0x20u);
        }
      }
      [(CMContinuityCaptureRemoteVideoDevice *)self updateControlStatus];
    }
    else
    {
      __int16 v13 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[CMContinuityCaptureRemoteVideoDevice setCenterStageEnabled:]();
      }
    }
  }
  else
  {
    __int16 v13 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[CMContinuityCaptureRemoteVideoDevice setFaceDrivenAFActive:]();
    }
  }
}

- (BOOL)portraitEffect
{
  return [MEMORY[0x263EFA598] isBackgroundBlurEnabled];
}

- (void)setPortraitEffect:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v25 = *MEMORY[0x263EF8340];
  CGSize v5 = [(CMContinuityCaptureDeviceBase *)self queue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = "No";
    if (v3) {
      int v7 = "Yes";
    }
    *(_DWORD *)buf = 138543618;
    uint64_t v20 = self;
    __int16 v21 = 2080;
    __int16 v22 = v7;
    _os_log_impl(&dword_235FC2000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ PortraitEffect: %s", buf, 0x16u);
  }

  p_videoDevice = (id *)&self->_videoDevice;
  videoDevice = self->_videoDevice;
  if (videoDevice)
  {
    int v10 = [(AVCaptureDevice *)videoDevice activeFormat];

    if (v10)
    {
      id v11 = *p_videoDevice;
      id v18 = 0;
      int v12 = [v11 lockForConfiguration:&v18];
      __int16 v13 = v18;
      if (v12)
      {
        [MEMORY[0x263EFA598] setBackgroundBlurControlMode:1];
        [MEMORY[0x263EFA598] setBackgroundBlurEnabled:v3];
        uint64_t v14 = [MEMORY[0x263EFA598] isBackgroundBlurEnabled];
        uint64_t v15 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
        [v15 setPortraitEffectEnabled:v14];

        [*p_videoDevice unlockForConfiguration];
      }
      else
      {
        __int16 v16 = CMContinuityCaptureLog(2);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          uint64_t v17 = (const char *)*p_videoDevice;
          *(_DWORD *)buf = 138543874;
          uint64_t v20 = self;
          __int16 v21 = 2112;
          __int16 v22 = v17;
          __int16 v23 = 2112;
          __int16 v24 = v13;
          _os_log_error_impl(&dword_235FC2000, v16, OS_LOG_TYPE_ERROR, "%{public}@ Error locking %@ for configuration: %@", buf, 0x20u);
        }
      }
      [(CMContinuityCaptureRemoteVideoDevice *)self updateControlStatus];
    }
    else
    {
      __int16 v13 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[CMContinuityCaptureRemoteVideoDevice setCenterStageEnabled:]();
      }
    }
  }
  else
  {
    __int16 v13 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[CMContinuityCaptureRemoteVideoDevice setFaceDrivenAFActive:]();
    }
  }
}

- (float)portraitEffectAperture
{
  [MEMORY[0x263EFA598] backgroundBlurAperture];
  return result;
}

- (void)setPortraitEffectAperture:(float)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  CGSize v5 = [(CMContinuityCaptureDeviceBase *)self queue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v20 = self;
    __int16 v21 = 2048;
    double v22 = a3;
    _os_log_impl(&dword_235FC2000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ portraitEffectAperture: %f", buf, 0x16u);
  }

  p_videoDevice = (id *)&self->_videoDevice;
  videoDevice = self->_videoDevice;
  if (videoDevice)
  {
    __int16 v9 = [(AVCaptureDevice *)videoDevice activeFormat];

    if (v9)
    {
      id v10 = *p_videoDevice;
      id v18 = 0;
      int v11 = [v10 lockForConfiguration:&v18];
      int v12 = v18;
      if (v11)
      {
        *(float *)&double v13 = a3;
        [MEMORY[0x263EFA598] setBackgroundBlurAperture:v13];
        uint64_t v14 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
        *(float *)&double v15 = a3;
        [v14 setPortraitEffectAperture:v15];

        [*p_videoDevice unlockForConfiguration];
      }
      else
      {
        __int16 v16 = CMContinuityCaptureLog(2);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          id v17 = *p_videoDevice;
          *(_DWORD *)buf = 138543874;
          uint64_t v20 = self;
          __int16 v21 = 2112;
          double v22 = *(double *)&v17;
          __int16 v23 = 2112;
          __int16 v24 = v12;
          _os_log_error_impl(&dword_235FC2000, v16, OS_LOG_TYPE_ERROR, "%{public}@ Error locking %@ for configuration: %@", buf, 0x20u);
        }
      }
    }
    else
    {
      int v12 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[CMContinuityCaptureRemoteVideoDevice setCenterStageEnabled:]();
      }
    }
  }
  else
  {
    int v12 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[CMContinuityCaptureRemoteVideoDevice setFaceDrivenAFActive:]();
    }
  }
}

- (BOOL)studioLighting
{
  return [MEMORY[0x263EFA598] isStudioLightEnabled];
}

- (void)setStudioLighting:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v25 = *MEMORY[0x263EF8340];
  CGSize v5 = [(CMContinuityCaptureDeviceBase *)self queue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = "No";
    if (v3) {
      int v7 = "Yes";
    }
    *(_DWORD *)buf = 138543618;
    uint64_t v20 = self;
    __int16 v21 = 2080;
    double v22 = v7;
    _os_log_impl(&dword_235FC2000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ StudioLighting: %s", buf, 0x16u);
  }

  p_videoDevice = (id *)&self->_videoDevice;
  videoDevice = self->_videoDevice;
  if (videoDevice)
  {
    id v10 = [(AVCaptureDevice *)videoDevice activeFormat];

    if (v10)
    {
      id v11 = *p_videoDevice;
      id v18 = 0;
      int v12 = [v11 lockForConfiguration:&v18];
      double v13 = v18;
      if (v12)
      {
        [MEMORY[0x263EFA598] setStudioLightingEnabled:v3];
        uint64_t v14 = [MEMORY[0x263EFA598] isStudioLightEnabled];
        double v15 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
        [v15 setStudioLightingEnabled:v14];

        [*p_videoDevice unlockForConfiguration];
      }
      else
      {
        __int16 v16 = CMContinuityCaptureLog(2);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          id v17 = (const char *)*p_videoDevice;
          *(_DWORD *)buf = 138543874;
          uint64_t v20 = self;
          __int16 v21 = 2112;
          double v22 = v17;
          __int16 v23 = 2112;
          __int16 v24 = v13;
          _os_log_error_impl(&dword_235FC2000, v16, OS_LOG_TYPE_ERROR, "%{public}@ Error locking %@ for configuration: %@", buf, 0x20u);
        }
      }
      [(CMContinuityCaptureRemoteVideoDevice *)self updateControlStatus];
    }
    else
    {
      double v13 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[CMContinuityCaptureRemoteVideoDevice setCenterStageEnabled:]();
      }
    }
  }
  else
  {
    double v13 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[CMContinuityCaptureRemoteVideoDevice setFaceDrivenAFActive:]();
    }
  }
}

- (float)studioLightingIntensity
{
  [MEMORY[0x263EFA598] studioLightingIntensity];
  return result;
}

- (void)setStudioLightingIntensity:(float)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  CGSize v5 = [(CMContinuityCaptureDeviceBase *)self queue];
  dispatch_assert_queue_V2(v5);

  p_videoDevice = (id *)&self->_videoDevice;
  videoDevice = self->_videoDevice;
  if (videoDevice)
  {
    BOOL v8 = [(AVCaptureDevice *)videoDevice activeFormat];

    if (v8)
    {
      id v9 = *p_videoDevice;
      id v17 = 0;
      int v10 = [v9 lockForConfiguration:&v17];
      id v11 = v17;
      if (v10)
      {
        *(float *)&double v12 = a3;
        [MEMORY[0x263EFA598] setStudioLightingIntensity:v12];
        double v13 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
        *(float *)&double v14 = a3;
        [v13 setStudioLightingIntensity:v14];

        [*p_videoDevice unlockForConfiguration];
      }
      else
      {
        double v15 = CMContinuityCaptureLog(2);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          id v16 = *p_videoDevice;
          *(_DWORD *)buf = 138543874;
          id v19 = self;
          __int16 v20 = 2112;
          id v21 = v16;
          __int16 v22 = 2112;
          __int16 v23 = v11;
          _os_log_error_impl(&dword_235FC2000, v15, OS_LOG_TYPE_ERROR, "%{public}@ Error locking %@ for configuration: %@", buf, 0x20u);
        }
      }
    }
    else
    {
      id v11 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[CMContinuityCaptureRemoteVideoDevice setCenterStageEnabled:]();
      }
    }
  }
  else
  {
    id v11 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[CMContinuityCaptureRemoteVideoDevice setFaceDrivenAFActive:]();
    }
  }
}

- (BOOL)reactionEffects
{
  return [MEMORY[0x263EFA598] reactionEffectsEnabled];
}

- (void)setReactionEffects:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v25 = *MEMORY[0x263EF8340];
  CGSize v5 = [(CMContinuityCaptureDeviceBase *)self queue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = "No";
    if (v3) {
      int v7 = "Yes";
    }
    *(_DWORD *)buf = 138543618;
    __int16 v20 = self;
    __int16 v21 = 2080;
    __int16 v22 = v7;
    _os_log_impl(&dword_235FC2000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ ReactionEffects: %s", buf, 0x16u);
  }

  p_videoDevice = (id *)&self->_videoDevice;
  videoDevice = self->_videoDevice;
  if (videoDevice)
  {
    int v10 = [(AVCaptureDevice *)videoDevice activeFormat];

    if (v10)
    {
      id v11 = *p_videoDevice;
      id v18 = 0;
      int v12 = [v11 lockForConfiguration:&v18];
      double v13 = v18;
      if (v12)
      {
        [MEMORY[0x263EFA598] setReactionEffectsEnabled:v3];
        uint64_t v14 = [MEMORY[0x263EFA598] reactionEffectsEnabled];
        double v15 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
        [v15 setReactionEffectsEnabled:v14];

        [*p_videoDevice unlockForConfiguration];
      }
      else
      {
        id v16 = CMContinuityCaptureLog(2);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          id v17 = (const char *)*p_videoDevice;
          *(_DWORD *)buf = 138543874;
          __int16 v20 = self;
          __int16 v21 = 2112;
          __int16 v22 = v17;
          __int16 v23 = 2112;
          uint64_t v24 = v13;
          _os_log_error_impl(&dword_235FC2000, v16, OS_LOG_TYPE_ERROR, "%{public}@ Error locking %@ for configuration: %@", buf, 0x20u);
        }
      }
      [(CMContinuityCaptureRemoteVideoDevice *)self updateControlStatus];
    }
    else
    {
      double v13 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[CMContinuityCaptureRemoteVideoDevice setCenterStageEnabled:]();
      }
    }
  }
  else
  {
    double v13 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[CMContinuityCaptureRemoteVideoDevice setFaceDrivenAFActive:]();
    }
  }
}

- (float)reactionEffectGesturesEnabled
{
  return (float)[MEMORY[0x263EFA598] reactionEffectGesturesEnabled];
}

- (void)setReactionEffectGesturesEnabled:(float)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  CGSize v5 = [(CMContinuityCaptureDeviceBase *)self queue];
  dispatch_assert_queue_V2(v5);

  p_videoDevice = (id *)&self->_videoDevice;
  videoDevice = self->_videoDevice;
  if (videoDevice)
  {
    BOOL v8 = [(AVCaptureDevice *)videoDevice activeFormat];

    if (v8)
    {
      id v9 = *p_videoDevice;
      id v15 = 0;
      int v10 = [v9 lockForConfiguration:&v15];
      id v11 = v15;
      if (v10)
      {
        [MEMORY[0x263EFA598] setReactionEffectGesturesEnabled:a3 != 0.0];
        int v12 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
        [v12 setReactionEffectGesturesEnabled:a3 != 0.0];

        [*p_videoDevice unlockForConfiguration];
      }
      else
      {
        double v13 = CMContinuityCaptureLog(2);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          id v14 = *p_videoDevice;
          *(_DWORD *)buf = 138543874;
          id v17 = self;
          __int16 v18 = 2112;
          id v19 = v14;
          __int16 v20 = 2112;
          __int16 v21 = v11;
          _os_log_error_impl(&dword_235FC2000, v13, OS_LOG_TYPE_ERROR, "%{public}@ Error locking %@ for configuration: %@", buf, 0x20u);
        }
      }
    }
    else
    {
      id v11 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[CMContinuityCaptureRemoteVideoDevice setCenterStageEnabled:]();
      }
    }
  }
  else
  {
    id v11 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[CMContinuityCaptureRemoteVideoDevice setFaceDrivenAFActive:]();
    }
  }
}

- (BOOL)backgroundReplacement
{
  return [MEMORY[0x263EFA598] isBackgroundReplacementEnabled];
}

- (void)setBackgroundReplacement:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v25 = *MEMORY[0x263EF8340];
  CGSize v5 = [(CMContinuityCaptureDeviceBase *)self queue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = "No";
    if (v3) {
      int v7 = "Yes";
    }
    *(_DWORD *)buf = 138543618;
    __int16 v20 = self;
    __int16 v21 = 2080;
    uint64_t v22 = v7;
    _os_log_impl(&dword_235FC2000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ BackgroundReplacement: %s", buf, 0x16u);
  }

  p_videoDevice = (id *)&self->_videoDevice;
  videoDevice = self->_videoDevice;
  if (videoDevice)
  {
    int v10 = [(AVCaptureDevice *)videoDevice activeFormat];

    if (v10)
    {
      id v11 = *p_videoDevice;
      id v18 = 0;
      int v12 = [v11 lockForConfiguration:&v18];
      double v13 = v18;
      if (v12)
      {
        [MEMORY[0x263EFA598] setBackgroundReplacementEnabled:v3];
        uint64_t v14 = [MEMORY[0x263EFA598] isBackgroundReplacementEnabled];
        id v15 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
        [v15 setBackgroundReplacementEnabled:v14];

        [*p_videoDevice unlockForConfiguration];
      }
      else
      {
        id v16 = CMContinuityCaptureLog(2);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          id v17 = (const char *)*p_videoDevice;
          *(_DWORD *)buf = 138543874;
          __int16 v20 = self;
          __int16 v21 = 2112;
          uint64_t v22 = v17;
          __int16 v23 = 2112;
          uint64_t v24 = v13;
          _os_log_error_impl(&dword_235FC2000, v16, OS_LOG_TYPE_ERROR, "%{public}@ Error locking %@ for configuration: %@", buf, 0x20u);
        }
      }
      [(CMContinuityCaptureRemoteVideoDevice *)self updateControlStatus];
    }
    else
    {
      double v13 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[CMContinuityCaptureRemoteVideoDevice setCenterStageEnabled:]();
      }
    }
  }
  else
  {
    double v13 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[CMContinuityCaptureRemoteVideoDevice setFaceDrivenAFActive:]();
    }
  }
}

- (__CVBuffer)backgroundReplacementPixelBuffer
{
  return (__CVBuffer *)[MEMORY[0x263EFA598] backgroundReplacementPixelBuffer];
}

- (void)setBackgroundReplacementPixelBuffer:(__CVBuffer *)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  CGSize v5 = [(CMContinuityCaptureDeviceBase *)self queue];
  dispatch_assert_queue_V2(v5);

  p_videoDevice = (id *)&self->_videoDevice;
  videoDevice = self->_videoDevice;
  if (videoDevice)
  {
    BOOL v8 = [(AVCaptureDevice *)videoDevice activeFormat];

    if (v8)
    {
      id v9 = *p_videoDevice;
      id v15 = 0;
      int v10 = [v9 lockForConfiguration:&v15];
      id v11 = v15;
      if (v10)
      {
        [MEMORY[0x263EFA598] setBackgroundReplacementPixelBuffer:a3];
        int v12 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
        [v12 setBackgroundReplacementPixelBuffer:a3];

        [*p_videoDevice unlockForConfiguration];
      }
      else
      {
        double v13 = CMContinuityCaptureLog(2);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          id v14 = *p_videoDevice;
          *(_DWORD *)buf = 138543874;
          id v17 = self;
          __int16 v18 = 2112;
          id v19 = v14;
          __int16 v20 = 2112;
          __int16 v21 = v11;
          _os_log_error_impl(&dword_235FC2000, v13, OS_LOG_TYPE_ERROR, "%{public}@ Error locking %@ for configuration: %@", buf, 0x20u);
        }
      }
    }
    else
    {
      id v11 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[CMContinuityCaptureRemoteVideoDevice setCenterStageEnabled:]();
      }
    }
  }
  else
  {
    id v11 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[CMContinuityCaptureRemoteVideoDevice setFaceDrivenAFActive:]();
    }
  }
}

- (BOOL)isGazeSelectionEnabled
{
  return self->_gazeSelectionEnabled;
}

- (void)_configureVideoEffects
{
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_8_0(&dword_235FC2000, v0, v1, "Configuration value for portraitEffectAperture is 0.", v2, v3, v4, v5, v6);
}

- (id)_avfDeviceTypeForManualFramingDeviceType:(int64_t)a3
{
  if (a3 == 2)
  {
    uint64_t v3 = (id *)MEMORY[0x263EF9660];
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    uint64_t v3 = (id *)MEMORY[0x263EF9670];
LABEL_5:
    id v4 = *v3;
    goto LABEL_9;
  }
  uint64_t v5 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[CMContinuityCaptureRemoteVideoDevice _avfDeviceTypeForManualFramingDeviceType:]();
  }

  id v4 = 0;
LABEL_9:
  return v4;
}

- (BOOL)_isUltraWideCameraSupported
{
  v8[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = CMContinuityCaptureDevicePosition();
  uint64_t v3 = (void *)MEMORY[0x263EFA5A8];
  v8[0] = *MEMORY[0x263EF9660];
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
  uint64_t v5 = [v3 discoverySessionWithDeviceTypes:v4 mediaType:*MEMORY[0x263EF9D48] position:v2];

  uint8_t v6 = [v5 devices];
  LOBYTE(v2) = [v6 count] != 0;

  return v2;
}

- (id)_selectVideoDeviceForConfiguration:(id)a3
{
  v29[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(CMContinuityCaptureRemoteVideoDevice *)self _dockKitNotificationAgentIsTracking])
  {
    v29[0] = *MEMORY[0x263EF9670];
    uint64_t v5 = (void *)MEMORY[0x263EFF8C0];
    uint8_t v6 = v29;
  }
  else if (([v4 centerStageEnabled] & 1) != 0 {
         || [v4 isCenterStageForcefullyEnabled])
  }
  {
    if (self->_manualFramingFeatureFlagEnabled)
    {
      if (self->_isUltraWideCameraSupported)
      {
        if ([v4 centerStageFieldOfViewRestrictedToWide])
        {
          uint64_t v28 = *MEMORY[0x263EF9670];
          uint64_t v5 = (void *)MEMORY[0x263EFF8C0];
          uint8_t v6 = &v28;
        }
        else
        {
          uint64_t v27 = *MEMORY[0x263EF9660];
          uint64_t v5 = (void *)MEMORY[0x263EFF8C0];
          uint8_t v6 = &v27;
        }
      }
      else
      {
        uint64_t v26 = *MEMORY[0x263EF9670];
        uint64_t v5 = (void *)MEMORY[0x263EFF8C0];
        uint8_t v6 = &v26;
      }
    }
    else if (self->_isUltraWideCameraSupported)
    {
      uint64_t v25 = *MEMORY[0x263EF9660];
      uint64_t v5 = (void *)MEMORY[0x263EFF8C0];
      uint8_t v6 = &v25;
    }
    else
    {
      uint64_t v24 = *MEMORY[0x263EF9670];
      uint64_t v5 = (void *)MEMORY[0x263EFF8C0];
      uint8_t v6 = &v24;
    }
  }
  else if (self->_manualFramingFeatureFlagEnabled)
  {
    if ([v4 manualFramingDeviceType])
    {
      uint64_t v12 = -[CMContinuityCaptureRemoteVideoDevice _avfDeviceTypeForManualFramingDeviceType:](self, "_avfDeviceTypeForManualFramingDeviceType:", [v4 manualFramingDeviceType]);
      double v13 = (void *)v12;
      if (v12)
      {
        uint64_t v23 = v12;
        id v14 = &v23;
      }
      else
      {
        uint64_t v22 = *MEMORY[0x263EF9670];
        id v14 = &v22;
      }
      int v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];

      goto LABEL_4;
    }
    id v15 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v19 = self;
      __int16 v20 = 2080;
      __int16 v21 = "-[CMContinuityCaptureRemoteVideoDevice _selectVideoDeviceForConfiguration:]";
      _os_log_impl(&dword_235FC2000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ %s Host side doesn't support Manual Framing", buf, 0x16u);
    }

    uint64_t v17 = *MEMORY[0x263EF9670];
    uint64_t v5 = (void *)MEMORY[0x263EFF8C0];
    uint8_t v6 = &v17;
  }
  else
  {
    uint64_t v16 = *MEMORY[0x263EF9670];
    uint64_t v5 = (void *)MEMORY[0x263EFF8C0];
    uint8_t v6 = &v16;
  }
  int v7 = objc_msgSend(v5, "arrayWithObjects:count:", v6, 1, v16, v17);
LABEL_4:
  BOOL v8 = [MEMORY[0x263EFA5A8] discoverySessionWithDeviceTypes:v7 mediaType:*MEMORY[0x263EF9D48] position:CMContinuityCaptureDevicePosition()];
  id v9 = [v8 devices];
  int v10 = [v9 firstObject];

  return v10;
}

- (id)connectionsForConfiguration:(id)a3
{
  uint64_t v82 = *MEMORY[0x263EF8340];
  uint64_t v5 = (char *)a3;
  id v68 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint8_t v6 = [(CMContinuityCaptureDeviceBase *)self queue];
  dispatch_assert_queue_V2(v6);

  int v7 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v8 = [(CMContinuityCaptureRemoteVideoDevice *)self companionDevice];
    id v9 = [(CMContinuityCaptureRemoteVideoDevice *)self companionDevice];
    *(_DWORD *)buf = 138544130;
    v74 = self;
    __int16 v75 = 2114;
    v76 = v5;
    __int16 v77 = 2112;
    *(void *)v78 = v8;
    *(_WORD *)&v78[8] = 1024;
    LODWORD(v79) = [v9 streaming];
    _os_log_impl(&dword_235FC2000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ connections for configuration %{public}@ companionDevice %@ streaming %d", buf, 0x26u);
  }
  int v10 = [(CMContinuityCaptureRemoteVideoDevice *)self _selectVideoDeviceForConfiguration:v5];
  [(CMContinuityCaptureRemoteVideoDevice *)self setVideoDevice:v10];

  id v11 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = [(CMContinuityCaptureRemoteVideoDevice *)self videoDevice];
    double v13 = [v12 localizedName];
    BOOL v14 = [(CMContinuityCaptureRemoteVideoDevice *)self isGazeSelectionEnabled];
    *(_DWORD *)buf = 138544386;
    v74 = self;
    __int16 v75 = 2080;
    v76 = "-[CMContinuityCaptureRemoteVideoDevice connectionsForConfiguration:]";
    __int16 v77 = 2112;
    *(void *)v78 = v13;
    *(_WORD *)&v78[8] = 2112;
    v79 = v5;
    __int16 v80 = 1024;
    BOOL v81 = v14;
    _os_log_impl(&dword_235FC2000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ %s Selected device %@ for configuration %@ with gazeSelectionEnabled %d", buf, 0x30u);
  }
  if (!self->_videoDevice)
  {
    LODWORD(v64) = 0;
    FigDebugAssert3();
    p_super = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
    {
      v59 = [(AVCaptureDevice *)self->_videoDevice deviceType];
      int v60 = [v5 centerStageEnabled];
      int v61 = [v5 isCenterStageForcefullyEnabled];
      *(_DWORD *)buf = 138544130;
      v74 = self;
      __int16 v75 = 2112;
      v76 = v59;
      __int16 v77 = 1024;
      *(_DWORD *)v78 = v60;
      *(_WORD *)&v78[4] = 1024;
      *(_DWORD *)&v78[6] = v61;
      _os_log_error_impl(&dword_235FC2000, p_super, OS_LOG_TYPE_ERROR, "%{public}@ Could not find back camera with device type: %@, enableCenterStage: %d isCenterStageForcefullyEnabled: %d ", buf, 0x22u);
    }
    v55 = 0;
    id v22 = 0;
    goto LABEL_29;
  }
  BOOL v15 = [(CMContinuityCaptureRemoteVideoDevice *)self isGazeSelectionEnabled];
  uint64_t v16 = [(CMContinuityCaptureRemoteVideoDevice *)self videoDevice];
  [v16 setGazeSelectionEnabled:v15];

  uint64_t v17 = [(AVCaptureDevice *)self->_videoDevice deviceType];
  if ([v17 isEqualToString:*MEMORY[0x263EF9660]])
  {
    __int16 v18 = [(CMContinuityCaptureRemoteVideoDevice *)self companionDevice];
    if ([v18 streaming])
    {
    }
    else
    {
      int v19 = [v5 isCenterStageForcefullyEnabled];

      if (!v19) {
        goto LABEL_12;
      }
    }
    [(CMContinuityCaptureRemoteVideoDevice *)self setFaceDrivenAFActive:0];
    uint64_t v17 = [(CMContinuityCaptureRemoteVideoDevice *)self companionDevice];
    -[CMContinuityCaptureRemoteVideoDevice setDeskViewCameraMode:](self, "setDeskViewCameraMode:", [v17 deskViewCameraMode]);
  }

LABEL_12:
  videoDevice = self->_videoDevice;
  id v69 = 0;
  __int16 v21 = [MEMORY[0x263EFA5B8] deviceInputWithDevice:videoDevice error:&v69];
  id v22 = v69;
  videoDataInput = self->_videoDataInput;
  self->_videoDataInput = v21;

  if (!self->_videoDataInput)
  {
    p_super = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
      -[CMContinuityCaptureRemoteVideoDevice connectionsForConfiguration:]();
    }
    v55 = 0;
LABEL_29:
    v67 = 0;
    v50 = 0;
    int v36 = 0;
    v37 = v68;
    goto LABEL_21;
  }
  id v66 = v22;
  uint64_t v24 = (AVCaptureVideoDataOutput *)objc_alloc_init(MEMORY[0x263EFA6A0]);
  videoDataOutput = self->_videoDataOutput;
  self->_videoDataOutput = v24;

  uint64_t v26 = self->_videoDataOutput;
  uint64_t v27 = [(CMContinuityCaptureDeviceBase *)self queue];
  [(AVCaptureVideoDataOutput *)v26 setSampleBufferDelegate:self queue:v27];

  uint64_t v28 = CMContinuityCaptureDevicePosition();
  long long v29 = self->_videoDataInput;
  uint64_t v30 = *MEMORY[0x263EF9D48];
  uint64_t v31 = [(AVCaptureDevice *)self->_videoDevice deviceType];
  uint64_t v32 = [(AVCaptureDeviceInput *)v29 portsWithMediaType:v30 sourceDeviceType:v31 sourceDevicePosition:v28];

  v67 = v32;
  if ([v32 count])
  {
    uint64_t v65 = v28;
    v33 = (void *)MEMORY[0x263EFA560];
    v34 = [v32 firstObject];
    v72 = v34;
    v35 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v72 count:1];
    int v36 = [v33 connectionWithInputPorts:v35 output:self->_videoDataOutput];

    objc_msgSend(v36, "setVideoDeviceOrientationCorrectionEnabled:", objc_msgSend(v36, "isVideoDeviceOrientationCorrectionSupported"));
    objc_storeStrong((id *)&self->_videoDataConnection, v36);
    v37 = v68;
    [v68 addObject:v36];
    if ([v5 asyncStillCaptureEnabled])
    {
      int v38 = (AVCapturePhotoOutput *)objc_alloc_init(MEMORY[0x263EFA620]);
      photoOutput = self->_photoOutput;
      self->_photoOutput = v38;

      v40 = (void *)MEMORY[0x263EFA560];
      [v32 firstObject];
      v42 = v41 = v5;
      v71 = v42;
      CMTime v43 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v71 count:1];
      v37 = v68;
      id v44 = [v40 connectionWithInputPorts:v43 output:self->_photoOutput];

      uint64_t v5 = v41;
      objc_msgSend(v44, "setVideoDeviceOrientationCorrectionEnabled:", -[AVCaptureConnection isVideoDeviceOrientationCorrectionEnabled](self->_videoDataConnection, "isVideoDeviceOrientationCorrectionEnabled"));
      [v68 addObject:v44];
      int v36 = v44;
    }
    if (([v5 faceDetectionEnabled] & 1) != 0
      || ([v5 humanBodyDetectionEnabled] & 1) != 0
      || [v5 humanFullBodyDetectionEnabled])
    {
      long long v45 = (AVCaptureMetadataOutput *)objc_alloc_init(MEMORY[0x263EFA5F0]);
      metadataOutput = self->_metadataOutput;
      self->_metadataOutput = v45;

      long long v47 = self->_videoDataInput;
      uint64_t v48 = *MEMORY[0x263EF9D10];
      v49 = [(AVCaptureDevice *)self->_videoDevice deviceType];
      v50 = [(AVCaptureDeviceInput *)v47 portsWithMediaType:v48 sourceDeviceType:v49 sourceDevicePosition:v65];

      __int16 v51 = (void *)MEMORY[0x263EFA560];
      v52 = [v50 firstObject];
      v70 = v52;
      __int16 v53 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v70 count:1];
      v37 = v68;
      uint64_t v54 = [v51 connectionWithInputPorts:v53 output:self->_metadataOutput];

      [v68 addObject:v54];
      int v36 = (void *)v54;
    }
    else
    {
      v50 = 0;
    }
    id v22 = v66;
    [(CMContinuityCaptureRemoteVideoDevice *)self _configureVideoEffects];
    v55 = v37;
    p_super = &self->_connections->super;
    self->_connections = v55;
  }
  else
  {
    p_super = CMContinuityCaptureLog(2);
    v37 = v68;
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
    {
      v62 = self->_videoDataInput;
      v63 = [(AVCaptureDevice *)self->_videoDevice deviceType];
      *(_DWORD *)buf = 138543874;
      v74 = self;
      __int16 v75 = 2112;
      v76 = (const char *)v62;
      __int16 v77 = 2112;
      *(void *)v78 = v63;
      _os_log_error_impl(&dword_235FC2000, p_super, OS_LOG_TYPE_ERROR, "%{public}@ Failed to get video input ports for input %@ and device type %@", buf, 0x20u);
    }
    v55 = 0;
    v50 = 0;
    int v36 = 0;
  }
LABEL_21:

  v57 = v55;
  return v57;
}

- (unsigned)throttledMaxFrameRate
{
  uint64_t v2 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
  unsigned int v3 = [v2 maxFrameRate];

  return v3;
}

- (void)setMinFrameDurationOverrideIfApplicable
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  unsigned int v3 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v4 = [(CMContinuityCaptureDeviceBase *)self streaming];
    uint64_t v5 = [(CMContinuityCaptureRemoteVideoDevice *)self videoDataInput];
    uint8_t v6 = [(CMContinuityCaptureRemoteVideoDevice *)self videoDevice];
    int v7 = [(CMContinuityCaptureRemoteVideoDevice *)self companionDevice];
    BOOL v8 = [(CMContinuityCaptureRemoteVideoDevice *)self companionDevice];
    *(_DWORD *)buf = 138544898;
    uint64_t v30 = self;
    __int16 v31 = 2080;
    uint64_t v32 = "-[CMContinuityCaptureRemoteVideoDevice setMinFrameDurationOverrideIfApplicable]";
    __int16 v33 = 1024;
    BOOL v34 = v4;
    __int16 v35 = 2112;
    int v36 = v5;
    __int16 v37 = 2112;
    int v38 = v6;
    __int16 v39 = 2114;
    v40 = v7;
    __int16 v41 = 1024;
    int v42 = [v8 streaming];
    _os_log_impl(&dword_235FC2000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ streaming %s streaming %d %@ %@ companionDevice %{public}@ streaming %d", buf, 0x40u);
  }
  id v9 = [(CMContinuityCaptureDeviceBase *)self queue];
  dispatch_assert_queue_V2(v9);

  uint64_t v10 = [(CMContinuityCaptureRemoteVideoDevice *)self videoDataInput];
  if (v10)
  {
    id v11 = (void *)v10;
    uint64_t v12 = [(CMContinuityCaptureRemoteVideoDevice *)self videoDevice];
    if (v12)
    {
      double v13 = (void *)v12;
      BOOL v14 = [(CMContinuityCaptureDeviceBase *)self streaming];

      if (!v14) {
        return;
      }
      BOOL v15 = [(CMContinuityCaptureRemoteVideoDevice *)self videoDevice];
      uint64_t v16 = [v15 deviceType];
      uint64_t v17 = v16;
      if (v16 == (void *)*MEMORY[0x263EF9670])
      {
        __int16 v18 = [(CMContinuityCaptureRemoteVideoDevice *)self companionDevice];
        int v19 = [v18 streaming];

        if (v19)
        {
          __int16 v20 = CMContinuityCaptureLog(2);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v30 = self;
            _os_log_impl(&dword_235FC2000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ Setting videoMinFrameDurationOverride", buf, 0xCu);
          }

          __int16 v21 = [(CMContinuityCaptureDeviceBase *)self compositeDelegate];
          id v22 = [v21 frameRateManager];
          id v11 = [v22 allowedFrameRateRangeForDevice:self];

          uint64_t v23 = [v11 maxFrameRate];
          CMTimeMake(&v28, 1, [v23 unsignedIntValue]);
          uint64_t v24 = [(CMContinuityCaptureRemoteVideoDevice *)self videoDataInput];
          CMTime v27 = v28;
          [v24 setVideoMinFrameDurationOverride:&v27];

          goto LABEL_13;
        }
      }
      else
      {
      }
      id v11 = [(CMContinuityCaptureRemoteVideoDevice *)self videoDataInput];
      long long v25 = *MEMORY[0x263F01090];
      uint64_t v26 = *(void *)(MEMORY[0x263F01090] + 16);
      [v11 setVideoMinFrameDurationOverride:&v25];
    }
LABEL_13:
  }
}

- (BOOL)configureConnections
{
  uint64_t v113 = *MEMORY[0x263EF8340];
  unsigned int v3 = [(CMContinuityCaptureDeviceBase *)self queue];
  dispatch_assert_queue_V2(v3);

  BOOL v4 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
  uint64_t v5 = [v4 format];
  uint64_t v6 = [v5 maxFrameRate];
  int v7 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
  BOOL v8 = [v7 format];
  id v9 = -[CMContinuityCaptureRemoteVideoDevice compatibleDeviceFormatForMaxFrameRate:minFrameRate:](self, "compatibleDeviceFormatForMaxFrameRate:minFrameRate:", v6, [v8 minFrameRate]);

  uint64_t v10 = CMContinuityCaptureLog(2);
  id v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = [(AVCaptureDevice *)self->_videoDevice localizedName];
      v84 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
      int v77 = [v84 maxFrameRate];
      v83 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
      int v76 = [v83 minFrameRate];
      uint64_t v82 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
      int v75 = [v82 suppressVideoEffects];
      BOOL v81 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
      int v74 = [v81 portraitEffectEnabled];
      __int16 v80 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
      int v73 = [v80 centerStageEnabled];
      v79 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
      int v72 = [v79 studioLightingEnabled];
      v78 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
      int v71 = [v78 reactionEffectsEnabled];
      double v13 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
      int v70 = [v13 backgroundReplacementEnabled];
      BOOL v14 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
      int v15 = [v14 isCenterStageForcefullyEnabled];
      uint64_t v16 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
      [v16 portraitEffectAperture];
      double v18 = v17;
      int v19 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
      [v19 studioLightingIntensity];
      double v21 = v20;
      id v22 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
      *(_DWORD *)buf = 138546946;
      *(void *)&uint8_t buf[4] = self;
      __int16 v86 = 2112;
      *(void *)v87 = v12;
      *(_WORD *)&v87[8] = 2112;
      v88 = v9;
      __int16 v89 = 1024;
      int v90 = v77;
      __int16 v91 = 1024;
      int v92 = v76;
      __int16 v93 = 1024;
      int v94 = v75;
      __int16 v95 = 1024;
      int v96 = v74;
      __int16 v97 = 1024;
      int v98 = v73;
      __int16 v99 = 1024;
      int v100 = v72;
      __int16 v101 = 1024;
      int v102 = v71;
      __int16 v103 = 1024;
      int v104 = v70;
      __int16 v105 = 1024;
      int v106 = v15;
      __int16 v107 = 2048;
      double v108 = v18;
      __int16 v109 = 2048;
      double v110 = v21;
      __int16 v111 = 1024;
      int v112 = [v22 reactionEffectGesturesEnabled];
      _os_log_impl(&dword_235FC2000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ Setting format for %@: %@ FR: %d MnFR: %d SVE %d PE %d CS %d SL %d RE %d BR %d FCS %d BBA: %f SLI: %f REG: %d", buf, 0x70u);
    }
    [(CMContinuityCaptureRemoteVideoDevice *)self setFormat:v9];
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[CMContinuityCaptureRemoteVideoDevice configureConnections].cold.6();
    }

    uint64_t v23 = (void *)MEMORY[0x263EFF940];
    uint64_t v24 = *MEMORY[0x263EFF498];
    long long v25 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
    [v23 raise:v24, @"%@ ContinuityCapture error : Invalid format for configuration %@", self, v25 format];
  }
  uint64_t v26 = [(CMContinuityCaptureDeviceBase *)self compositeDelegate];
  CMTime v27 = [v26 frameRateManager];
  CMTime v28 = [v27 allowedFrameRateRangeForDevice:self];

  long long v29 = [v28 maxFrameRate];
  -[CMContinuityCaptureRemoteVideoDevice setMaxFrameRate:](self, "setMaxFrameRate:", [v29 unsignedIntValue]);

  uint64_t v30 = [v28 maxFrameRate];
  -[CMContinuityCaptureRemoteVideoDevice setMinFrameRate:](self, "setMinFrameRate:", [v30 unsignedIntValue]);

  __int16 v31 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v32 = [(CMContinuityCaptureRemoteVideoDevice *)self maxFrameRate];
    unsigned int v33 = [(CMContinuityCaptureRemoteVideoDevice *)self minFrameRate];
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = self;
    __int16 v86 = 1024;
    *(_DWORD *)v87 = v32;
    *(_WORD *)&v87[4] = 1024;
    *(_DWORD *)&v87[6] = v33;
    _os_log_impl(&dword_235FC2000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@ Setting MFR %d MXFR %d", buf, 0x18u);
  }

  [(CMContinuityCaptureRemoteVideoDevice *)self setMinFrameDurationOverrideIfApplicable];
  if ([(CMContinuityCaptureRemoteVideoDevice *)self _dockKitNotificationAgentIsTracking])
  {
    [(AVCaptureDevice *)self->_videoDevice lockForConfiguration:0];
    [(AVCaptureDevice *)self->_videoDevice setVideoZoomFactor:1.0];
    [(AVCaptureDevice *)self->_videoDevice unlockForConfiguration];
  }
  else
  {
    BOOL v34 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
    [v34 videoZoomFactor];
    -[CMContinuityCaptureRemoteVideoDevice setVideoZoomFactor:](self, "setVideoZoomFactor:");
  }
  videoDataOutput = self->_videoDataOutput;
  if (videoDataOutput)
  {
    uint64_t v36 = *MEMORY[0x263EF9D48];
    __int16 v37 = [(AVCaptureVideoDataOutput *)videoDataOutput connectionWithMediaType:*MEMORY[0x263EF9D48]];
    int v38 = v37;
    if (v37 && [v37 isVideoDeviceOrientationCorrectionSupported])
    {
      [v38 setVideoMirrored:0];
    }
    else
    {
      __int16 v39 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
        -[CMContinuityCaptureRemoteVideoDevice configureConnections].cold.5();
      }
    }
    v40 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
    int v41 = [v40 asyncStillCaptureEnabled];

    if (v41)
    {
      [(CMContinuityCaptureRemoteVideoDevice *)self _updatePhotoOutputConfigs];
      int v42 = [(AVCaptureDevice *)self->_videoDevice activeFormat];
      uint64_t v43 = [v42 supportedMaxPhotoDimensions];
      uint64_t v44 = [v43 count];

      if (v44)
      {
        *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
        long long v45 = [(AVCaptureDevice *)self->_videoDevice activeFormat];
        long long v46 = [v45 supportedMaxPhotoDimensions];
        long long v47 = [v46 lastObject];
        [v47 getValue:buf];

        [(AVCapturePhotoOutput *)self->_photoOutput setMaxPhotoDimensions:*(void *)buf];
      }
      else
      {
        v49 = CMContinuityCaptureLog(2);
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
          [(CMContinuityCaptureRemoteVideoDevice *)(uint64_t)self configureConnections];
        }
      }
      [(AVCapturePhotoOutput *)self->_photoOutput setHighResolutionCaptureEnabled:1];
      uint64_t v48 = [(AVCapturePhotoOutput *)self->_photoOutput connectionWithMediaType:v36];
      objc_msgSend(v48, "setVideoOrientation:", objc_msgSend(v38, "videoOrientation"));
      objc_msgSend(v48, "setVideoMirrored:", objc_msgSend(v38, "isVideoMirrored"));
    }
    else
    {
      uint64_t v48 = 0;
    }
    if (self->_metadataOutput) {
      id v50 = objc_alloc_init(MEMORY[0x263EFF980]);
    }
    else {
      id v50 = 0;
    }
    __int16 v51 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
    int v52 = [v51 faceDetectionEnabled];

    if (v52)
    {
      __int16 v53 = [(AVCaptureMetadataOutput *)self->_metadataOutput availableMetadataObjectTypes];
      uint64_t v54 = *MEMORY[0x263EF9F08];
      char v55 = [v53 containsObject:*MEMORY[0x263EF9F08]];

      if ((v55 & 1) == 0)
      {
        id v69 = CMContinuityCaptureLog(2);
        if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR)) {
          -[CMContinuityCaptureRemoteVideoDevice configureConnections]();
        }
        goto LABEL_51;
      }
      [v50 addObject:v54];
    }
    uint64_t v56 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
    int v57 = [v56 humanBodyDetectionEnabled];

    if (v57)
    {
      v58 = [(AVCaptureMetadataOutput *)self->_metadataOutput availableMetadataObjectTypes];
      uint64_t v59 = *MEMORY[0x263EF9F10];
      char v60 = [v58 containsObject:*MEMORY[0x263EF9F10]];

      if ((v60 & 1) == 0)
      {
        id v69 = CMContinuityCaptureLog(2);
        if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR)) {
          -[CMContinuityCaptureRemoteVideoDevice configureConnections]();
        }
        goto LABEL_51;
      }
      [v50 addObject:v59];
    }
    int v61 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
    int v62 = [v61 humanFullBodyDetectionEnabled];

    if (!v62)
    {
LABEL_40:
      metadataOutput = self->_metadataOutput;
      if (metadataOutput)
      {
        [(AVCaptureMetadataOutput *)metadataOutput setMetadataObjectTypes:v50];
        metadataOutput = self->_metadataOutput;
      }
      v67 = [(AVCaptureMetadataOutput *)metadataOutput connectionWithMediaType:*MEMORY[0x263EF9D10]];
      [v67 setEnabled:0];

      [(CMContinuityCaptureRemoteVideoDevice *)self updateControlStatus];
      goto LABEL_43;
    }
    v63 = [(AVCaptureMetadataOutput *)self->_metadataOutput availableMetadataObjectTypes];
    uint64_t v64 = *MEMORY[0x263EF9F18];
    char v65 = [v63 containsObject:*MEMORY[0x263EF9F18]];

    if (v65)
    {
      [v50 addObject:v64];
      goto LABEL_40;
    }
    id v69 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR)) {
      -[CMContinuityCaptureRemoteVideoDevice configureConnections]();
    }
LABEL_51:

LABEL_43:
  }

  return 1;
}

- (id)compatibleDeviceFormatForMaxFrameRate:(unsigned int)a3 minFrameRate:(unsigned int)a4
{
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __91__CMContinuityCaptureRemoteVideoDevice_compatibleDeviceFormatForMaxFrameRate_minFrameRate___block_invoke;
  v12[3] = &unk_264C99D18;
  v12[4] = self;
  unsigned int v13 = a4;
  unsigned int v14 = a3;
  uint64_t v5 = [MEMORY[0x263F08A98] predicateWithBlock:v12];
  id v6 = objc_alloc(MEMORY[0x263EFF980]);
  int v7 = [(AVCaptureDevice *)self->_videoDevice formats];
  BOOL v8 = [v7 filteredArrayUsingPredicate:v5];
  id v9 = (void *)[v6 initWithArray:v8];

  [v9 sortUsingComparator:&__block_literal_global_5];
  uint64_t v10 = [v9 firstObject];

  return v10;
}

uint64_t __91__CMContinuityCaptureRemoteVideoDevice_compatibleDeviceFormatForMaxFrameRate_minFrameRate___block_invoke(uint64_t a1, void *a2)
{
  unsigned int v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 activeConfiguration];
  id v6 = [*(id *)(a1 + 32) captureSession];
  uint64_t v7 = objc_msgSend(v3, "_deviceFormat:isCompatibleWithConfiguration:requiringMultiCamSupport:minFrameRate:maxFrameRate:", v4, v5, objc_msgSend(v6, "isMulticamSession"), *(unsigned int *)(a1 + 40), *(unsigned int *)(a1 + 44));

  return v7;
}

uint64_t __91__CMContinuityCaptureRemoteVideoDevice_compatibleDeviceFormatForMaxFrameRate_minFrameRate___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  if ([v4 isVideoHDRSupported] && !objc_msgSend(v5, "isVideoHDRSupported")) {
    goto LABEL_7;
  }
  if ([v4 isVideoHDRSupported] & 1) == 0 && (objc_msgSend(v5, "isVideoHDRSupported"))
  {
LABEL_11:
    uint64_t v6 = 1;
    goto LABEL_12;
  }
  if (([v4 isVideoBinned] & 1) != 0 || (objc_msgSend(v5, "isVideoBinned") & 1) == 0)
  {
    if (![v4 isVideoBinned] || objc_msgSend(v5, "isVideoBinned"))
    {
      uint64_t v6 = 0;
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_7:
  uint64_t v6 = -1;
LABEL_12:

  return v6;
}

- (BOOL)_deviceFormat:(id)a3 isCompatibleWithConfiguration:(id)a4 requiringMultiCamSupport:(BOOL)a5 minFrameRate:(unsigned int)a6 maxFrameRate:(unsigned int)a7
{
  BOOL v8 = a5;
  id v11 = a3;
  id v12 = a4;
  if (CMContinityCaptureDebugLogEnabled())
  {
    unsigned int v13 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[CMContinuityCaptureRemoteVideoDevice _deviceFormat:isCompatibleWithConfiguration:requiringMultiCamSupport:minFrameRate:maxFrameRate:]((uint64_t)self, v11, v13);
    }
  }
  uint64_t Dimensions = (uint64_t)CMVideoFormatDescriptionGetDimensions((CMVideoFormatDescriptionRef)[v11 formatDescription]);
  int v15 = [v12 format];
  if ([v15 width] == (int)Dimensions)
  {
    uint64_t v16 = [v12 format];
    uint64_t v17 = [v16 height];

    if (v17 == Dimensions >> 32)
    {
      FourCharCode MediaSubType = CMFormatDescriptionGetMediaSubType((CMFormatDescriptionRef)[v11 formatDescription]);
      int v19 = [v12 format];
      int v20 = [v19 pixelFormat];

      if (MediaSubType == v20)
      {
        double v21 = [v11 videoSupportedFrameRateRanges];
        id v22 = [v21 firstObject];
        [v22 maxFrameRate];
        double v24 = v23;

        if (v24 >= (double)a7
          && (([v12 centerStageEnabled] & 1) == 0
           && (![v12 isCenterStageForcefullyEnabled]
            || [(CMContinuityCaptureDeviceBase *)self entity] == 2)
           || [v11 isCenterStageSupported])
          && (![v12 manualFramingDeviceType]
           || [v11 isManualFramingSupported])
          && (![v12 studioLightingEnabled]
           || [v11 isStudioLightSupported])
          && (![v12 reactionEffectsEnabled]
           || [v11 reactionEffectsSupported])
          && (![v12 backgroundReplacementEnabled]
           || [v11 isBackgroundReplacementSupported])
          && (!v8 || [v11 isMultiCamSupported]))
        {
          BOOL v25 = 1;
          goto LABEL_14;
        }
      }
    }
  }
  else
  {
  }
  BOOL v25 = 0;
LABEL_14:

  return v25;
}

- (BOOL)_companionConnectionsRequired
{
  unsigned int v3 = [(CMContinuityCaptureDeviceBase *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(CMContinuityCaptureRemoteVideoDevice *)self companionDevice];
  id v5 = v4;
  if (!v4 || ([v4 streaming] & 1) != 0)
  {
    char v9 = 0;
    goto LABEL_16;
  }
  BOOL manualFramingFeatureFlagEnabled = self->_manualFramingFeatureFlagEnabled;
  uint64_t v7 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
  int v8 = [v7 centerStageEnabled];
  if (!manualFramingFeatureFlagEnabled)
  {
    if (v8)
    {
      char v9 = 1;
    }
    else
    {
      unsigned int v13 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
      char v9 = [v13 isCenterStageForcefullyEnabled];
    }
    goto LABEL_15;
  }
  if (v8)
  {

LABEL_9:
    uint64_t v7 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
    char v12 = [v7 centerStageFieldOfViewRestrictedToWide];
    goto LABEL_10;
  }
  uint64_t v10 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
  int v11 = [v10 isCenterStageForcefullyEnabled];

  if (v11) {
    goto LABEL_9;
  }
  uint64_t v7 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
  if ([v7 manualFramingDeviceType] != 2)
  {
    char v9 = 0;
    goto LABEL_15;
  }
  char v12 = [(CMContinuityCaptureRemoteVideoDevice *)self _dockKitNotificationAgentIsTracking];
LABEL_10:
  char v9 = v12 ^ 1;
LABEL_15:

LABEL_16:
  return v9;
}

- (void)_toggleBetweenCenterStageAndManualFraming
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  unsigned int v3 = [(CMContinuityCaptureDeviceBase *)self queue];
  dispatch_assert_queue_V2(v3);

  if (self->_manualFramingFeatureFlagEnabled)
  {
    id v4 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
    if ([v4 manualFramingDeviceType] == 1)
    {
      id v5 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
      int v6 = [v5 centerStageFieldOfViewRestrictedToWide];
    }
    else
    {
      int v6 = 0;
    }

    uint64_t v7 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
    if ([v7 manualFramingDeviceType] == 2)
    {
      int v8 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
      int v9 = [v8 centerStageFieldOfViewRestrictedToWide] ^ 1;
    }
    else
    {
      int v9 = 0;
    }

    uint64_t v10 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
    if ([v10 centerStageEnabled])
    {

      if ((v6 | v9))
      {
        int v11 = [(CMContinuityCaptureRemoteVideoDevice *)self captureSession];
        [v11 willConfigure];

        goto LABEL_16;
      }
    }
    else
    {
      char v12 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
      int v13 = [v12 isCenterStageForcefullyEnabled];

      if ((v6 | v9))
      {
        unsigned int v14 = [(CMContinuityCaptureRemoteVideoDevice *)self captureSession];
        [v14 willConfigure];

        if ((v13 & 1) == 0)
        {
          [(CMContinuityCaptureRemoteVideoDevice *)self _disableCenterStage];
          if (self->_manualFramingFeatureFlagEnabled) {
            [(CMContinuityCaptureRemoteVideoDevice *)self _enableManualFraming];
          }
          int v15 = CMContinuityCaptureLog(2);
          if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_28;
          }
          uint64_t v16 = [(CMContinuityCaptureRemoteVideoDevice *)self videoDevice];
          uint64_t v17 = [v16 deviceType];
          [(AVCaptureDevice *)self->_videoDevice manualFramingPanningAngleX];
          double v23 = v22;
          [(AVCaptureDevice *)self->_videoDevice manualFramingPanningAngleY];
          double v25 = v24;
          [(CMContinuityCaptureRemoteVideoDevice *)self videoZoomFactor];
          *(_DWORD *)buf = 138544386;
          unsigned int v32 = self;
          __int16 v33 = 2112;
          BOOL v34 = v17;
          __int16 v35 = 2048;
          double v36 = v23;
          __int16 v37 = 2048;
          double v38 = v25;
          __int16 v39 = 2048;
          uint64_t v40 = v26;
          _os_log_impl(&dword_235FC2000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ Transition from Center Stage to Manual Framing (both on %@). Setting panning angle x: %f, y: %f, zoom factor %f", buf, 0x34u);
          goto LABEL_27;
        }
LABEL_16:
        if (self->_manualFramingFeatureFlagEnabled) {
          [(CMContinuityCaptureRemoteVideoDevice *)self _disableManualFraming];
        }
        [(CMContinuityCaptureRemoteVideoDevice *)self _enableCenterStage];
        int v15 = CMContinuityCaptureLog(2);
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_28;
        }
        uint64_t v16 = [(CMContinuityCaptureRemoteVideoDevice *)self videoDevice];
        uint64_t v17 = [v16 deviceType];
        double v18 = [(CMContinuityCaptureRemoteVideoDevice *)self centerStageRectOfInterest];
        [(CMContinuityCaptureRemoteVideoDevice *)self videoZoomFactor];
        *(_DWORD *)buf = 138544130;
        unsigned int v32 = self;
        __int16 v33 = 2112;
        BOOL v34 = v17;
        __int16 v35 = 2112;
        double v36 = v18;
        __int16 v37 = 2048;
        double v38 = v19;
        _os_log_impl(&dword_235FC2000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ Transition from Manual Framing to Center Stage (both on %@). Setting CS RoI %@, zoom factor to %f", buf, 0x2Au);

LABEL_27:
LABEL_28:

        CMTime v27 = [(CMContinuityCaptureRemoteVideoDevice *)self captureSession];
        [v27 didConfigure];

        CMTime v28 = [(CMContinuityCaptureRemoteVideoDevice *)self captureSession];
        [v28 start];

        return;
      }
      if (!v13)
      {
        int v20 = CMContinuityCaptureLog(2);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          double v21 = "Transition from Center Stage to Manual Framing on a different camera. Rebuilding the camera stack.";
          goto LABEL_31;
        }
LABEL_32:

        long long v29 = [(CMContinuityCaptureDeviceBase *)self compositeDelegate];
        objc_msgSend(v29, "postEvent:entity:data:", @"kCMContinuityCaptureEventForceRestartStream", -[CMContinuityCaptureDeviceBase entity](self, "entity"), 0);

        return;
      }
    }
    int v20 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      double v21 = "Transition from Manual Framing to Center Stage on a different camera. Rebuilding the camera stack.";
LABEL_31:
      _os_log_impl(&dword_235FC2000, v20, OS_LOG_TYPE_DEFAULT, v21, buf, 2u);
      goto LABEL_32;
    }
    goto LABEL_32;
  }
  id v30 = [(CMContinuityCaptureDeviceBase *)self compositeDelegate];
  objc_msgSend(v30, "postEvent:entity:data:", @"kCMContinuityCaptureEventForceRestartStream", -[CMContinuityCaptureDeviceBase entity](self, "entity"), 0);
}

- (void)_updateManualFramingDeviceType:(int64_t)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = [(CMContinuityCaptureDeviceBase *)self queue];
  dispatch_assert_queue_V2(v5);

  int v6 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
  [v6 setManualFramingDeviceType:a3];

  uint64_t v7 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543618;
    int v13 = self;
    __int16 v14 = 2080;
    int v15 = "-[CMContinuityCaptureRemoteVideoDevice _updateManualFramingDeviceType:]";
    _os_log_impl(&dword_235FC2000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ %s Resetting Manual Framing states due to device type change", (uint8_t *)&v12, 0x16u);
  }

  int v8 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
  [v8 setPanningAngleX:0.0];

  int v9 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
  [v9 setPanningAngleY:0.0];

  uint64_t v10 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
  [v10 setVideoZoomFactor:1.0];

  int v11 = [(CMContinuityCaptureDeviceBase *)self compositeDelegate];
  objc_msgSend(v11, "postEvent:entity:data:", @"kCMContinuityCaptureEventForceRestartStream", -[CMContinuityCaptureDeviceBase entity](self, "entity"), 0);
}

- (BOOL)startCameraCaptureStack:(unint64_t)a3
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  if (self->_dockedTrackingSupported)
  {
    id v5 = [(CMContinuityCaptureDeviceBase *)self compositeDelegate];
    int v6 = [v5 controlWithName:@"kCMContinuityCaptureControlDockedTrackingActive"];

    if (v6)
    {
      uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[CMContinuityCaptureRemoteVideoDevice _dockKitNotificationAgentIsTracking](self, "_dockKitNotificationAgentIsTracking"));
      [v6 setValue:v7];

      int v8 = [(CMContinuityCaptureDeviceBase *)self compositeDelegate];
      [v8 setValueForControl:v6 completion:0];
    }
  }
  id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (self->_captureStackActive || [(CMContinuityCaptureDeviceBase *)self invalidated]) {
    goto LABEL_41;
  }
  self->_videoBufferDropCounter = 0;
  uint64_t v10 = (NSUUID *)objc_opt_new();
  cameraCaptureStreamSessionID = self->_cameraCaptureStreamSessionID;
  self->_cameraCaptureStreamSessionID = v10;

  int v12 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v13 = [(CMContinuityCaptureDeviceBase *)self currentSessionID];
    __int16 v14 = self->_cameraCaptureStreamSessionID;
    int v15 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
    *(_DWORD *)buf = 138544642;
    __int16 v53 = self;
    __int16 v54 = 2048;
    char v55 = (CMContinuityCaptureRemoteVideoDevice *)v13;
    __int16 v56 = 2080;
    int v57 = "-[CMContinuityCaptureRemoteVideoDevice startCameraCaptureStack:]";
    __int16 v58 = 1024;
    int v59 = a3;
    __int16 v60 = 2114;
    int v61 = v14;
    __int16 v62 = 2114;
    v63 = v15;
    _os_log_impl(&dword_235FC2000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ [sessionID:%llx] %s option:%d streamSessionID:%{public}@ configuration:%{public}@", buf, 0x3Au);
  }
  uint64_t v16 = +[CMContinuityCaptureMSNExceptionMonitor sharedMonitor];
  uint64_t v17 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
  objc_msgSend(v16, "incrementExceptionCountForEntity:", objc_msgSend(v17, "entity"));

  double v18 = [(CMContinuityCaptureRemoteVideoDevice *)self captureSession];
  [v18 willConfigure];

  double v19 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
  LODWORD(v17) = [v19 isCenterStageForcefullyEnabled];

  if (v17) {
    [(CMContinuityCaptureRemoteVideoDevice *)self _forcefullyEnableCenterStageOnSuperWide];
  }
  int v20 = [(CMContinuityCaptureRemoteVideoDevice *)self captureSession];
  char v21 = objc_msgSend(v20, "hasConnectionsForEntity:", -[CMContinuityCaptureDeviceBase entity](self, "entity"));

  if ((v21 & 1) == 0)
  {
    float v22 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
    double v23 = [(CMContinuityCaptureRemoteVideoDevice *)self connectionsForConfiguration:v22];
    [v9 addObjectsFromArray:v23];

    float v24 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v53 = (CMContinuityCaptureRemoteVideoDevice *)"-[CMContinuityCaptureRemoteVideoDevice startCameraCaptureStack:]";
      __int16 v54 = 2114;
      char v55 = self;
      _os_log_impl(&dword_235FC2000, v24, OS_LOG_TYPE_DEFAULT, "%s Self %{public}@ connections added to capture session", buf, 0x16u);
    }

    if (![v9 count])
    {
      long long v45 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
        goto LABEL_39;
      }
      goto LABEL_40;
    }
  }
  if ([(CMContinuityCaptureRemoteVideoDevice *)self _companionConnectionsRequired])
  {
    double v25 = [(CMContinuityCaptureRemoteVideoDevice *)self companionDevice];
    uint64_t v26 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
    CMTime v27 = [v25 connectionsForConfiguration:v26];
    [v9 addObjectsFromArray:v27];

    CMTime v28 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v53 = (CMContinuityCaptureRemoteVideoDevice *)"-[CMContinuityCaptureRemoteVideoDevice startCameraCaptureStack:]";
      __int16 v54 = 2114;
      char v55 = self;
      _os_log_impl(&dword_235FC2000, v28, OS_LOG_TYPE_DEFAULT, "%s Companion connections added to capture session by %{public}@", buf, 0x16u);
    }

    if (![v9 count])
    {
      long long v45 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
LABEL_39:
      }
        -[CMContinuityCaptureRemoteVideoDevice startCameraCaptureStack:]();
LABEL_40:

LABEL_41:
      BOOL v43 = 0;
      goto LABEL_35;
    }
  }
  if ([v9 count])
  {
    long long v29 = [(CMContinuityCaptureRemoteVideoDevice *)self captureSession];
    [v29 addConnections:v9];
  }
  else
  {
    long long v29 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v53 = (CMContinuityCaptureRemoteVideoDevice *)"-[CMContinuityCaptureRemoteVideoDevice startCameraCaptureStack:]";
      __int16 v54 = 2114;
      char v55 = self;
      _os_log_impl(&dword_235FC2000, v29, OS_LOG_TYPE_DEFAULT, "%s No new connections added to capture session by %{public}@", buf, 0x16u);
    }
  }

  id v30 = [(CMContinuityCaptureRemoteVideoDevice *)self videoDataConnection];
  char v31 = [v30 isEnabled];

  if ((v31 & 1) == 0)
  {
    unsigned int v32 = [(CMContinuityCaptureRemoteVideoDevice *)self videoDataConnection];
    [v32 setEnabled:1];

    __int16 v33 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v53 = (CMContinuityCaptureRemoteVideoDevice *)"-[CMContinuityCaptureRemoteVideoDevice startCameraCaptureStack:]";
      __int16 v54 = 2114;
      char v55 = self;
      _os_log_impl(&dword_235FC2000, v33, OS_LOG_TYPE_DEFAULT, "%s Enabled video data connection for %{public}@", buf, 0x16u);
    }
  }
  BOOL v34 = [(CMContinuityCaptureDeviceBase *)self compositeDelegate];
  __int16 v35 = [v34 frameRateManager];
  [v35 reportStreamStatus:1 forDevice:self];

  [(CMContinuityCaptureRemoteVideoDevice *)self configureConnections];
  double v36 = [(CMContinuityCaptureRemoteVideoDevice *)self captureSession];
  [v36 didConfigure];

  __int16 v37 = [(CMContinuityCaptureRemoteVideoDevice *)self captureSession];
  [v37 start];

  [(CMContinuityCaptureRemoteVideoDevice *)self updateControlStatus];
  self->_captureStackActive = 1;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  double v38 = [(NSMutableDictionary *)self->_cmControlByNameWithPendingUpdates allValues];
  uint64_t v39 = [v38 countByEnumeratingWithState:&v47 objects:v51 count:16];
  if (v39)
  {
    uint64_t v40 = v39;
    uint64_t v41 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v40; ++i)
      {
        if (*(void *)v48 != v41) {
          objc_enumerationMutation(v38);
        }
        [(CMContinuityCaptureRemoteVideoDevice *)self setValueForControl:*(void *)(*((void *)&v47 + 1) + 8 * i) completion:&__block_literal_global_42];
      }
      uint64_t v40 = [v38 countByEnumeratingWithState:&v47 objects:v51 count:16];
    }
    while (v40);
  }

  v46.receiver = self;
  v46.super_class = (Class)CMContinuityCaptureRemoteVideoDevice;
  BOOL v43 = [(CMContinuityCaptureDeviceBase *)&v46 startCameraCaptureStack:a3];
LABEL_35:

  return v43;
}

- (void)tearDownConnectionsWithVideoDataConnectionDisabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543618;
    unint64_t v13 = self;
    __int16 v14 = 1024;
    BOOL v15 = v3;
    _os_log_impl(&dword_235FC2000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ tearDownConnectionsWithVideoDataConnectionDisabled %d", (uint8_t *)&v12, 0x12u);
  }

  if (!v3)
  {
    photoOutput = self->_photoOutput;
    self->_photoOutput = 0;

    metadataOutput = self->_metadataOutput;
    self->_metadataOutput = 0;

    videoDataInput = self->_videoDataInput;
    self->_videoDataInput = 0;

    videoDataOutput = self->_videoDataOutput;
    self->_videoDataOutput = 0;

    videoDataConnection = self->_videoDataConnection;
    self->_videoDataConnection = 0;

    connections = self->_connections;
    self->_connections = 0;

    [(CMContinuityCaptureRemoteVideoDevice *)self setVideoDevice:0];
  }
}

- (BOOL)_shouldOnlyDisableVideoConnection
{
  BOOL v3 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
  if ([v3 centerStageEnabled])
  {
    int v4 = 1;
  }
  else
  {
    id v5 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
    int v4 = [v5 isCenterStageForcefullyEnabled];
  }
  int v6 = [(CMContinuityCaptureRemoteVideoDevice *)self companionDevice];
  int v7 = [v6 streaming];

  if (v7)
  {
    if (self->_manualFramingFeatureFlagEnabled)
    {
      int v8 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
      id v9 = v8;
      if (v4) {
        int v4 = [v8 centerStageFieldOfViewRestrictedToWide] ^ 1;
      }
      else {
        int v4 = [v8 manualFramingDeviceType] == 2;
      }
    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (void)_stopCameraCaptureStackRemoveCaptureSessionConnectionsWithOption:(unint64_t)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  BOOL v4 = (a3 & 0x600) == 0
    && [(CMContinuityCaptureRemoteVideoDevice *)self _shouldOnlyDisableVideoConnection];
  id v5 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
  int v6 = [v5 isCenterStageForcefullyEnabled];

  if (v6)
  {
    [(CMContinuityCaptureRemoteVideoDevice *)self _restoreStatesAfterForcefulCenterStageEnablementAndShouldReconfigureCaptureStack:1];
    int v7 = [(CMContinuityCaptureRemoteVideoDevice *)self companionDevice];
    [v7 _restoreStatesAfterForcefulCenterStageEnablementAndShouldReconfigureCaptureStack:1];
  }
  if (v4)
  {
    int v8 = [(CMContinuityCaptureRemoteVideoDevice *)self videoDataConnection];
    [v8 setEnabled:0];

    id v9 = CMContinuityCaptureLog(2);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    int v24 = 138543618;
    double v25 = self;
    __int16 v26 = 1024;
    LODWORD(v27) = 1;
    uint64_t v10 = "Self %{public}@ video connection disabled %d";
  }
  else
  {
    int v11 = [(CMContinuityCaptureRemoteVideoDevice *)self captureSession];
    int v12 = [(CMContinuityCaptureRemoteVideoDevice *)self connections];
    [v11 removeConnections:v12];

    id v9 = CMContinuityCaptureLog(2);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    int v24 = 138543618;
    double v25 = self;
    __int16 v26 = 1024;
    LODWORD(v27) = 0;
    uint64_t v10 = "Self %{public}@ connections removed, disableVideoDataConnection %d";
  }
  _os_log_impl(&dword_235FC2000, v9, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v24, 0x12u);
LABEL_12:

  [(CMContinuityCaptureRemoteVideoDevice *)self tearDownConnectionsWithVideoDataConnectionDisabled:v4];
  unint64_t v13 = [(CMContinuityCaptureRemoteVideoDevice *)self companionDevice];

  if (!v13) {
    return;
  }
  __int16 v14 = [(CMContinuityCaptureRemoteVideoDevice *)self companionDevice];
  uint64_t v15 = [v14 connections];
  if (v15)
  {
    uint64_t v16 = (void *)v15;
    uint64_t v17 = [(CMContinuityCaptureRemoteVideoDevice *)self companionDevice];
    char v18 = [v17 streaming];

    if (v18) {
      return;
    }
    double v19 = [(CMContinuityCaptureRemoteVideoDevice *)self captureSession];
    int v20 = [(CMContinuityCaptureRemoteVideoDevice *)self companionDevice];
    char v21 = [v20 connections];
    [v19 removeConnections:v21];

    float v22 = [(CMContinuityCaptureRemoteVideoDevice *)self companionDevice];
    [v22 tearDownConnectionsWithVideoDataConnectionDisabled:0];

    __int16 v14 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      double v23 = [(CMContinuityCaptureRemoteVideoDevice *)self companionDevice];
      int v24 = 138543618;
      double v25 = v23;
      __int16 v26 = 2114;
      CMTime v27 = self;
      _os_log_impl(&dword_235FC2000, v14, OS_LOG_TYPE_DEFAULT, "Companion %{public}@ connections removed by %{public}@", (uint8_t *)&v24, 0x16u);
    }
  }
}

- (void)_forcefullyEnableCenterStageOnSuperWide
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  BOOL v3 = [(CMContinuityCaptureRemoteVideoDevice *)self isDockedTrackingEnabled];
  BOOL v4 = CMContinuityCaptureLog(2);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_235FC2000, v4, OS_LOG_TYPE_DEFAULT, "Docked tracking is enabled, do not forcefully enable Center Stage as requested", (uint8_t *)&v17, 2u);
    }
    goto LABEL_15;
  }
  if (v5)
  {
    int v17 = 138543618;
    char v18 = self;
    __int16 v19 = 2080;
    int v20 = "-[CMContinuityCaptureRemoteVideoDevice _forcefullyEnableCenterStageOnSuperWide]";
    _os_log_impl(&dword_235FC2000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ %s [forceful CS enablement] Forcefully enable Center Stage on the default video camera as requested", (uint8_t *)&v17, 0x16u);
  }

  int v6 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
  uint64_t v7 = [v6 forcefulCenterStageEnablementType];
  int v8 = [(CMContinuityCaptureRemoteVideoDevice *)self companionDevice];
  id v9 = [v8 activeConfiguration];
  [v9 setForcefulCenterStageEnablementType:v7];

  uint64_t v10 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
  uint64_t v11 = [v10 forcefulCenterStageEnablementType];

  if (v11 == 2)
  {
    uint64_t v15 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138543618;
      char v18 = self;
      __int16 v19 = 2080;
      int v20 = "-[CMContinuityCaptureRemoteVideoDevice _forcefullyEnableCenterStageOnSuperWide]";
      uint64_t v16 = "%{public}@ %s [forceful CS enablement] Already running Center Stage on the wide, switching to the super wide";
      goto LABEL_13;
    }
LABEL_14:

    [(CMContinuityCaptureRemoteVideoDevice *)self setShouldRestoreCenterStageOnWideCamera:1];
    BOOL v4 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
    [v4 setCenterStageFieldOfViewRestrictedToWide:0];
LABEL_15:

    return;
  }
  if (v11 == 1)
  {
    int v12 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138543618;
      char v18 = self;
      __int16 v19 = 2080;
      int v20 = "-[CMContinuityCaptureRemoteVideoDevice _forcefullyEnableCenterStageOnSuperWide]";
      _os_log_impl(&dword_235FC2000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ %s [forceful CS enablement] Switching from Manual Framing to Center Stage", (uint8_t *)&v17, 0x16u);
    }

    unint64_t v13 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
    int v14 = [v13 centerStageFieldOfViewRestrictedToWide];

    if (v14)
    {
      uint64_t v15 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 138543618;
        char v18 = self;
        __int16 v19 = 2080;
        int v20 = "-[CMContinuityCaptureRemoteVideoDevice _forcefullyEnableCenterStageOnSuperWide]";
        uint64_t v16 = "%{public}@ %s [forceful CS enablement] Switching to the super wide";
LABEL_13:
        _os_log_impl(&dword_235FC2000, v15, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v17, 0x16u);
        goto LABEL_14;
      }
      goto LABEL_14;
    }
  }
}

- (void)_restoreStatesAfterForcefulCenterStageEnablementAndShouldReconfigureCaptureStack:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v33 = *MEMORY[0x263EF8340];
  BOOL v5 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
  int v6 = [v5 isCenterStageForcefullyEnabled];

  if (!v6) {
    return;
  }
  uint64_t v7 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v29 = 138543618;
    id v30 = self;
    __int16 v31 = 2080;
    unsigned int v32 = "-[CMContinuityCaptureRemoteVideoDevice _restoreStatesAfterForcefulCenterStageEnablementAndShouldReconfigureCaptureStack:]";
    _os_log_impl(&dword_235FC2000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ %s [forceful CS enablement] Restoring states while exiting forcefully enabled Center Stage on super wide", (uint8_t *)&v29, 0x16u);
  }

  int v8 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
  uint64_t v9 = [v8 forcefulCenterStageEnablementType];

  uint64_t v10 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
  [v10 setForcefulCenterStageEnablementType:0];

  if (v9 == 1)
  {
    char v18 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v29 = 138543618;
      id v30 = self;
      __int16 v31 = 2080;
      unsigned int v32 = "-[CMContinuityCaptureRemoteVideoDevice _restoreStatesAfterForcefulCenterStageEnablementAndShouldReconfigureCaptureStack:]";
      _os_log_impl(&dword_235FC2000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ %s [forceful CS enablement] Switching back to Manual Framing", (uint8_t *)&v29, 0x16u);
    }

    if (v3) {
      [(CMContinuityCaptureRemoteVideoDevice *)self setCenterStageEnabled:0];
    }
    __int16 v19 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
    [v19 setCenterStageEnabled:0];

    if ([(CMContinuityCaptureRemoteVideoDevice *)self shouldRestoreCenterStageOnWideCamera])
    {
      int v20 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
      [v20 setCenterStageFieldOfViewRestrictedToWide:1];

      [(CMContinuityCaptureRemoteVideoDevice *)self setShouldRestoreCenterStageOnWideCamera:0];
    }
    uint64_t v21 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
    uint64_t v22 = [v21 manualFramingDeviceType];

    if (v22 == 1 && v3)
    {
      double v23 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        int v29 = 138543618;
        id v30 = self;
        __int16 v31 = 2080;
        unsigned int v32 = "-[CMContinuityCaptureRemoteVideoDevice _restoreStatesAfterForcefulCenterStageEnablementAndShouldReconfigureCaptureStack:]";
        _os_log_impl(&dword_235FC2000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@ %s [forceful CS enablement] Manual Framing is set on the back wide, rebuild connections in order to switch from the super wide to the wide", (uint8_t *)&v29, 0x16u);
      }

      int v24 = [(CMContinuityCaptureRemoteVideoDevice *)self captureSession];
      double v25 = [(CMContinuityCaptureRemoteVideoDevice *)self connections];
      [v24 removeConnections:v25];

      __int16 v26 = [(CMContinuityCaptureRemoteVideoDevice *)self captureSession];
      CMTime v27 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
      uint64_t v28 = [(CMContinuityCaptureRemoteVideoDevice *)self connectionsForConfiguration:v27];
      [v26 addConnections:v28];
    }
LABEL_21:
    if (!v3) {
      return;
    }
    goto LABEL_22;
  }
  if (v9 != 2) {
    goto LABEL_21;
  }
  uint64_t v11 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v29 = 138543618;
    id v30 = self;
    __int16 v31 = 2080;
    unsigned int v32 = "-[CMContinuityCaptureRemoteVideoDevice _restoreStatesAfterForcefulCenterStageEnablementAndShouldReconfigureCaptureStack:]";
    _os_log_impl(&dword_235FC2000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ %s [forceful CS enablement] Switching back to running Center Stage on the back wide", (uint8_t *)&v29, 0x16u);
  }

  int v12 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
  [v12 setCenterStageFieldOfViewRestrictedToWide:1];

  [(CMContinuityCaptureRemoteVideoDevice *)self setShouldRestoreCenterStageOnWideCamera:0];
  if (v3)
  {
    unint64_t v13 = [(CMContinuityCaptureRemoteVideoDevice *)self captureSession];
    int v14 = [(CMContinuityCaptureRemoteVideoDevice *)self connections];
    [v13 removeConnections:v14];

    uint64_t v15 = [(CMContinuityCaptureRemoteVideoDevice *)self captureSession];
    uint64_t v16 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
    int v17 = [(CMContinuityCaptureRemoteVideoDevice *)self connectionsForConfiguration:v16];
    [v15 addConnections:v17];

LABEL_22:
    [(CMContinuityCaptureRemoteVideoDevice *)self updateControlStatus];
  }
}

- (BOOL)stopCameraCaptureStack:(unint64_t)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  BOOL v5 = [(CMContinuityCaptureDeviceBase *)self queue];
  dispatch_assert_queue_V2(v5);

  int v6 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v29 = 138544130;
    id v30 = self;
    __int16 v31 = 2048;
    unsigned int v32 = [(CMContinuityCaptureDeviceBase *)self currentSessionID];
    __int16 v33 = 2080;
    BOOL v34 = "-[CMContinuityCaptureRemoteVideoDevice stopCameraCaptureStack:]";
    __int16 v35 = 2048;
    unint64_t v36 = a3;
    _os_log_impl(&dword_235FC2000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ [sessionID:%llx] %s option: %lu", (uint8_t *)&v29, 0x2Au);
  }

  if (self->_captureStackActive)
  {
    if ((a3 & 0x10) != 0)
    {
      CMTime v27 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        int v29 = 138543618;
        id v30 = self;
        __int16 v31 = 2080;
        unsigned int v32 = "-[CMContinuityCaptureRemoteVideoDevice stopCameraCaptureStack:]";
        _os_log_impl(&dword_235FC2000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@ %s skip anticipating reconnect", (uint8_t *)&v29, 0x16u);
      }
      goto LABEL_22;
    }
    uint64_t v7 = [(CMContinuityCaptureDeviceBase *)self compositeDelegate];
    int v8 = [v7 frameRateManager];
    [v8 reportStreamStatus:0 forDevice:self];

    uint64_t v9 = [(CMContinuityCaptureRemoteVideoDevice *)self captureSession];
    [v9 willConfigure];

    if ([(CMContinuityCaptureRemoteVideoDevice *)self isDockedTrackingEnabled]) {
      [(CMContinuityCaptureRemoteVideoDevice *)self setDockedTrackingEnabled:0];
    }
    [(CMContinuityCaptureRemoteVideoDevice *)self _stopCameraCaptureStackRemoveCaptureSessionConnectionsWithOption:a3];
    uint64_t v10 = [(CMContinuityCaptureRemoteVideoDevice *)self captureSession];
    [v10 didConfigure];

    uint64_t v11 = [(CMContinuityCaptureRemoteVideoDevice *)self captureSession];
    [v11 stop];

    self->_captureStackActive = 0;
    int v12 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v13 = [(CMContinuityCaptureDeviceBase *)self currentSessionID];
      cameraCaptureStreamSessionID = self->_cameraCaptureStreamSessionID;
      unint64_t videoBufferDropCounter = self->_videoBufferDropCounter;
      int v29 = 138544130;
      id v30 = self;
      __int16 v31 = 2048;
      unsigned int v32 = (const char *)v13;
      __int16 v33 = 2114;
      BOOL v34 = (const char *)cameraCaptureStreamSessionID;
      __int16 v35 = 2048;
      unint64_t v36 = videoBufferDropCounter;
      _os_log_impl(&dword_235FC2000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ [sessionID:%llx] #of frame drops for streamSessionID:%{public}@: %lld", (uint8_t *)&v29, 0x2Au);
    }

    if ((a3 & 0x400) != 0) {
      self->_propagateCaptureSessionRestartedAttachment = 1;
    }
  }
  if ((a3 & 0x200) != 0)
  {
    uint64_t v16 = [(CMContinuityCaptureRemoteVideoDevice *)self captureSession];
    int v17 = objc_msgSend(v16, "hasConnectionsForEntity:", -[CMContinuityCaptureDeviceBase entity](self, "entity"));

    if (v17)
    {
      char v18 = [(CMContinuityCaptureRemoteVideoDevice *)self companionDevice];

      if (v18)
      {
        __int16 v19 = [(CMContinuityCaptureRemoteVideoDevice *)self companionDevice];
        [v19 stopCameraCaptureStack:0];
      }
      int v20 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        int v29 = 138543618;
        id v30 = self;
        __int16 v31 = 2080;
        unsigned int v32 = "-[CMContinuityCaptureRemoteVideoDevice stopCameraCaptureStack:]";
        _os_log_impl(&dword_235FC2000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ received terminate connections %s", (uint8_t *)&v29, 0x16u);
      }

      uint64_t v21 = [(CMContinuityCaptureRemoteVideoDevice *)self captureSession];
      uint64_t v22 = [(CMContinuityCaptureRemoteVideoDevice *)self connections];
      [v21 removeConnections:v22];

      [(CMContinuityCaptureRemoteVideoDevice *)self tearDownConnectionsWithVideoDataConnectionDisabled:0];
    }
  }
  double v23 = +[CMContinuityCaptureMSNExceptionMonitor sharedMonitor];
  int v24 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
  objc_msgSend(v23, "decrementExceptionCountForEntity:", objc_msgSend(v24, "entity"));

  double v25 = [(CMContinuityCaptureRemoteVideoDevice *)self companionDevice];
  uint64_t v26 = [v25 entity];

  if (v26 == 1)
  {
    CMTime v27 = [(CMContinuityCaptureRemoteVideoDevice *)self companionDevice];
    [v27 setMinFrameDurationOverrideIfApplicable];
LABEL_22:
  }
  return 1;
}

- (void)invalidate
{
  v2.receiver = self;
  v2.super_class = (Class)CMContinuityCaptureRemoteVideoDevice;
  [(CMContinuityCaptureDeviceBase *)&v2 invalidate];
  +[CMContinuityCaptureRemoteCompositeDevice setWombatMode:0];
}

- (void)addVideoDeviceKVOs
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  videoDevice = self->_videoDevice;
  BOOL v4 = [(CMContinuityCaptureDeviceBase *)self compositeDelegate];
  [(AVCaptureDevice *)videoDevice addObserver:v4 forKeyPath:@"systemPressureState" options:3 context:0];

  [(AVCaptureDevice *)self->_videoDevice addObserver:self forKeyPath:@"activeVideoMinFrameDuration" options:3 context:0];
  [(AVCaptureDevice *)self->_videoDevice addObserver:self forKeyPath:@"activeVideoMaxFrameDuration" options:3 context:0];
  [(AVCaptureDevice *)self->_videoDevice addObserver:self forKeyPath:@"reactionEffectsInProgress" options:3 context:0];
  BOOL v5 = [(CMContinuityCaptureDeviceBase *)self compositeDelegate];
  int v6 = [v5 frameRateManager];
  [v6 addObserver:self forKeyPath:@"throttled" options:3 context:0];

  [(CMContinuityCaptureRemoteVideoDevice *)self addObserver:self forKeyPath:@"activeConfiguration" options:3 context:0];
  self->_videoDeviceKVOsActive = 1;
  uint64_t v7 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = self->_videoDevice;
    int v9 = 138543618;
    uint64_t v10 = self;
    __int16 v11 = 2114;
    int v12 = v8;
    _os_log_impl(&dword_235FC2000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ KVOs are active on %{public}@", (uint8_t *)&v9, 0x16u);
  }
}

- (void)removeVideoDeviceKVOs
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (self->_videoDeviceKVOsActive)
  {
    videoDevice = self->_videoDevice;
    BOOL v4 = [(CMContinuityCaptureDeviceBase *)self compositeDelegate];
    [(AVCaptureDevice *)videoDevice removeObserver:v4 forKeyPath:@"systemPressureState" context:0];

    [(AVCaptureDevice *)self->_videoDevice removeObserver:self forKeyPath:@"activeVideoMinFrameDuration" context:0];
    [(AVCaptureDevice *)self->_videoDevice removeObserver:self forKeyPath:@"activeVideoMaxFrameDuration" context:0];
    [(AVCaptureDevice *)self->_videoDevice removeObserver:self forKeyPath:@"reactionEffectsInProgress" context:0];
    BOOL v5 = [(CMContinuityCaptureDeviceBase *)self compositeDelegate];
    int v6 = [v5 frameRateManager];
    [v6 removeObserver:self forKeyPath:@"throttled" context:0];

    [(CMContinuityCaptureRemoteVideoDevice *)self removeObserver:self forKeyPath:@"activeConfiguration" context:0];
    self->_videoDeviceKVOsActive = 0;
    uint64_t v7 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = self->_videoDevice;
      int v11 = 138543618;
      int v12 = self;
      __int16 v13 = 2112;
      int v14 = v8;
      int v9 = "%{public}@ KVOs removed on %@{public}@";
LABEL_6:
      _os_log_impl(&dword_235FC2000, v7, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v11, 0x16u);
    }
  }
  else
  {
    uint64_t v7 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = self->_videoDevice;
      int v11 = 138543618;
      int v12 = self;
      __int16 v13 = 2114;
      int v14 = v10;
      int v9 = "%{public}@ KVOs for _videoDevice %{public}@ are inactive";
      goto LABEL_6;
    }
  }
}

- (void)didStartStreamInput:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138544130;
    int v8 = self;
    __int16 v9 = 2048;
    unint64_t v10 = [(CMContinuityCaptureDeviceBase *)self currentSessionID];
    __int16 v11 = 2080;
    int v12 = "-[CMContinuityCaptureRemoteVideoDevice didStartStreamInput:]";
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_235FC2000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ [sessionID:%llx] AVCInput setup complete %s %@", (uint8_t *)&v7, 0x2Au);
  }

  int v6 = [(CMContinuityCaptureDeviceBase *)self queue];
  dispatch_assert_queue_V2(v6);

  self->_avcStreamInputActive = 1;
}

- (void)didStopStreamInput:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543618;
    int v7 = self;
    __int16 v8 = 2080;
    __int16 v9 = "-[CMContinuityCaptureRemoteVideoDevice didStopStreamInput:]";
    _os_log_impl(&dword_235FC2000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ %s", (uint8_t *)&v6, 0x16u);
  }

  BOOL v5 = [(CMContinuityCaptureDeviceBase *)self queue];
  dispatch_assert_queue_V2(v5);

  self->_avcStreamInputActive = 0;
}

- (void)serverDidDie
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  BOOL v3 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543618;
    BOOL v5 = self;
    __int16 v6 = 2080;
    int v7 = "-[CMContinuityCaptureRemoteVideoDevice serverDidDie]";
    _os_log_impl(&dword_235FC2000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ %s", (uint8_t *)&v4, 0x16u);
  }
}

- (void)stream:(id)a3 didStart:(BOOL)a4 error:(id)a5
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a3;
  int v7 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543874;
    __int16 v9 = self;
    __int16 v10 = 2080;
    __int16 v11 = "-[CMContinuityCaptureRemoteVideoDevice stream:didStart:error:]";
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_impl(&dword_235FC2000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ %s %@", (uint8_t *)&v8, 0x20u);
  }
}

- (void)streamDidStop:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = self;
    __int16 v10 = 2080;
    __int16 v11 = "-[CMContinuityCaptureRemoteVideoDevice streamDidStop:]";
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_235FC2000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ %s %@", buf, 0x20u);
  }

  *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  id v6 = [(CMContinuityCaptureDeviceBase *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__CMContinuityCaptureRemoteVideoDevice_streamDidStop___block_invoke;
  block[3] = &unk_264C990F8;
  objc_copyWeak(&v8, (id *)buf);
  dispatch_async(v6, block);

  objc_destroyWeak(&v8);
  objc_destroyWeak((id *)buf);
}

uint64_t __54__CMContinuityCaptureRemoteVideoDevice_streamDidStop___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_super v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = WeakRetained[41];
    int v7 = v2;
    if (v3)
    {
      (*(void (**)(uint64_t, void))(v3 + 16))(v3, 0);
      id v4 = (void *)v7[41];
      v7[41] = 0;

      objc_super v2 = v7;
    }
    BOOL v5 = (void *)v2[31];
    v2[31] = 0;

    *((unsigned char *)v7 + 320) = 0;
  }
  return MEMORY[0x270F9A758]();
}

- (void)streamDidServerDie:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = self;
    __int16 v10 = 2080;
    __int16 v11 = "-[CMContinuityCaptureRemoteVideoDevice streamDidServerDie:]";
    _os_log_impl(&dword_235FC2000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ %s", buf, 0x16u);
  }

  *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  id v6 = [(CMContinuityCaptureDeviceBase *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__CMContinuityCaptureRemoteVideoDevice_streamDidServerDie___block_invoke;
  block[3] = &unk_264C990F8;
  objc_copyWeak(&v8, (id *)buf);
  dispatch_async(v6, block);

  objc_destroyWeak(&v8);
  objc_destroyWeak((id *)buf);
}

void __59__CMContinuityCaptureRemoteVideoDevice_streamDidServerDie___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v1 = (void *)WeakRetained[31];
    WeakRetained[31] = 0;

    objc_super v2 = (void *)WeakRetained[30];
    WeakRetained[30] = 0;

    *((unsigned char *)WeakRetained + 320) = 0;
    uint64_t v3 = WeakRetained[41];
    if (v3)
    {
      (*(void (**)(uint64_t, void))(v3 + 16))(v3, 0);
      id v4 = (void *)WeakRetained[41];
      WeakRetained[41] = 0;
    }
    [WeakRetained postAVCStreamInterruption];
  }
}

- (void)postAVCStreamInterruption
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v3 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = self;
    __int16 v8 = 2080;
    __int16 v9 = "-[CMContinuityCaptureRemoteVideoDevice postAVCStreamInterruption]";
    _os_log_impl(&dword_235FC2000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ %s", buf, 0x16u);
  }

  *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  id v4 = [(CMContinuityCaptureDeviceBase *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__CMContinuityCaptureRemoteVideoDevice_postAVCStreamInterruption__block_invoke;
  block[3] = &unk_264C990F8;
  objc_copyWeak(&v6, (id *)buf);
  dispatch_async(v4, block);

  objc_destroyWeak(&v6);
  objc_destroyWeak((id *)buf);
}

void __65__CMContinuityCaptureRemoteVideoDevice_postAVCStreamInterruption__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    objc_super v2 = [WeakRetained compositeDelegate];
    if (v2)
    {
      uint64_t v3 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"ContinuityCapture" code:-1007 userInfo:0];
      [v2 connectionInterrupted:v3 forDevice:0];
    }
    id WeakRetained = v4;
  }
}

- (void)streamDidRTPTimeOut:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 138543874;
    int v7 = self;
    __int16 v8 = 2080;
    __int16 v9 = "-[CMContinuityCaptureRemoteVideoDevice streamDidRTPTimeOut:]";
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl(&dword_235FC2000, v5, OS_LOG_TYPE_INFO, "%{public}@ %s %@", (uint8_t *)&v6, 0x20u);
  }
}

- (void)streamDidRTCPTimeOut:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  BOOL v5 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    id v11 = self;
    __int16 v12 = 2080;
    id v13 = "-[CMContinuityCaptureRemoteVideoDevice streamDidRTCPTimeOut:]";
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl(&dword_235FC2000, v5, OS_LOG_TYPE_INFO, "%@ %s %@", buf, 0x20u);
  }

  int v6 = [(CMContinuityCaptureDeviceBase *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __61__CMContinuityCaptureRemoteVideoDevice_streamDidRTCPTimeOut___block_invoke;
  v7[3] = &unk_264C990F8;
  objc_copyWeak(&v8, &location);
  dispatch_async(v6, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __61__CMContinuityCaptureRemoteVideoDevice_streamDidRTCPTimeOut___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained postAVCStreamInterruption];
    id WeakRetained = v2;
  }
}

- (void)dispatchFrame:(opaqueCMSampleBuffer *)a3 entity:(int64_t)a4 completion:(id)a5
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  int v7 = (void (**)(id, id))a5;
  id v8 = [(CMContinuityCaptureDeviceBase *)self queue];
  dispatch_assert_queue_V2(v8);

  CFStringRef v9 = (const __CFString *)*MEMORY[0x263F2C5D8];
  __int16 v10 = CMGetAttachment(a3, (CFStringRef)*MEMORY[0x263F2C5D8], 0);
  id v11 = v10;
  if (v10)
  {
    CFDictionaryRef v12 = [v10 objectForKeyedSubscript:*MEMORY[0x263F2EC30]];
    CFDictionaryRef v13 = v12;
    if (v12)
    {
      point.CGFloat x = NAN;
      point.CGFloat y = NAN;
      CGPointMakeWithDictionaryRepresentation(v12, &point);
      __int16 v14 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        double v43 = *(double *)&self;
        __int16 v44 = 2048;
        CGFloat x = point.x;
        __int16 v46 = 2048;
        CGFloat y = point.y;
        _os_log_impl(&dword_235FC2000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ Updating local activeConfiguration panning angle x:%f,y:%f based on transport layer attachments", buf, 0x20u);
      }

      double v15 = point.x;
      uint64_t v16 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
      [v16 setPanningAngleX:v15];

      double v17 = point.y;
      char v18 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
      [v18 setPanningAngleY:v17];
    }
    __int16 v19 = [v11 objectForKeyedSubscript:*MEMORY[0x263F2EC28]];
    if (v19)
    {
      int v20 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        [v19 floatValue];
        *(_DWORD *)buf = 134217984;
        double v43 = v21;
        _os_log_impl(&dword_235FC2000, v20, OS_LOG_TYPE_DEFAULT, "Updating local activeConfiguration video zoom factor to %f based on transport layer attachments", buf, 0xCu);
      }

      [v19 floatValue];
      double v23 = v22;
      int v24 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
      [v24 setVideoZoomFactor:v23];
    }
  }
  CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(a3);
  if (ImageBuffer)
  {
    uint64_t v26 = CMGetAttachment(ImageBuffer, @"ReactionEffectComplexity", 0);
    if (v26)
    {
      uint64_t v27 = *MEMORY[0x263F2EBA8];
      uint64_t v28 = [v11 objectForKeyedSubscript:*MEMORY[0x263F2EBA8]];
      int v29 = (void *)[v28 mutableCopy];

      if (v29) {
        [v29 setObject:v26 forKeyedSubscript:@"ReactionEffectComplexity"];
      }
      else {
        int v29 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithObjectsAndKeys:", v26, @"ReactionEffectComplexity", 0);
      }
      id v30 = (void *)[v11 mutableCopy];
      if (v30)
      {
        __int16 v31 = v30;
        [v30 setObject:v29 forKeyedSubscript:v27];
      }
      else
      {
        __int16 v31 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithObjectsAndKeys:", v29, v27, 0);
      }
      CMSetAttachment(a3, v9, v31, 1u);
    }
  }
  if (self->_avcStreamInputActive)
  {
    unint64_t HostTimeInNanoSec = CMContinuityCaptureGetHostTimeInNanoSec();
    avcStreamInput = self->_avcStreamInput;
    id v40 = 0;
    char v34 = [(AVCStreamInput *)avcStreamInput pushSampleBuffer:a3 error:&v40];
    id v35 = v40;
    if (v34)
    {
      unint64_t v36 = CMContinuityCaptureGetHostTimeInNanoSec() - HostTimeInNanoSec;
      if (CMContinityCaptureDebugLogEnabled())
      {
        uint64_t v37 = CMContinuityCaptureLog(2);
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
          -[CMContinuityCaptureRemoteVideoDevice dispatchFrame:entity:completion:]();
        }
      }
      if (v36 >= 0xF4241) {
        CMSetAttachment(a3, @"HighLatencyFrame", (CFTypeRef)*MEMORY[0x263EFFB40], 0);
      }
      v39.receiver = self;
      v39.super_class = (Class)CMContinuityCaptureRemoteVideoDevice;
      [(CMContinuityCaptureDeviceBase *)&v39 dispatchFrame:a3 entity:[(CMContinuityCaptureDeviceBase *)self entity] completion:&__block_literal_global_69];
    }
    else
    {
      double v38 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
        -[CMContinuityCaptureRemoteVideoDevice dispatchFrame:entity:completion:]();
      }
    }
  }
  else
  {
    id v35 = (id)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"ContinuityCapture" code:-1003 userInfo:0];
  }
  v7[2](v7, v35);
}

- (id)createAVCVideoStream
{
  v26[2] = *MEMORY[0x263EF8340];
  v26[0] = 0xAAAAAAAAAAAAAAAALL;
  v26[1] = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v3 = [(CMContinuityCaptureDeviceBase *)self transportStream];
  id v4 = v3;
  if (!v3)
  {
    id v13 = 0;
    CFDictionaryRef v12 = 0;
    BOOL v5 = 0;
LABEL_21:
    CFStringRef v9 = 0;
    goto LABEL_16;
  }
  BOOL v5 = [v3 streamUUID];
  if (!v5)
  {
    id v13 = 0;
    CFDictionaryRef v12 = 0;
    goto LABEL_21;
  }
  int v6 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    float v21 = self;
    __int16 v22 = 2048;
    unint64_t v23 = [(CMContinuityCaptureDeviceBase *)self currentSessionID];
    __int16 v24 = 2112;
    double v25 = v5;
    _os_log_impl(&dword_235FC2000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ [sessionID:%llx] createAVCVideoStream for StreamUUID %@", buf, 0x20u);
  }

  [v5 getUUIDBytes:v26];
  int v7 = [(CMContinuityCaptureDeviceBase *)self avcStreamNegotiator];

  if (!v7)
  {
    id v10 = 0;
LABEL_9:
    id v11 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      float v21 = self;
      __int16 v22 = 2112;
      unint64_t v23 = (unint64_t)v10;
      _os_log_impl(&dword_235FC2000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ Invalid avcStreamInitOptions, error %@", buf, 0x16u);
    }

    id v10 = 0;
    CFStringRef v9 = (void *)MEMORY[0x263EFFA78];
    goto LABEL_12;
  }
  id v8 = [(CMContinuityCaptureDeviceBase *)self avcStreamNegotiator];
  id v19 = 0;
  CFStringRef v9 = [v8 generateMediaStreamInitOptionsWithError:&v19];
  id v10 = v19;

  if (!v9) {
    goto LABEL_9;
  }
LABEL_12:
  id v18 = v10;
  CFDictionaryRef v12 = (void *)[objc_alloc(MEMORY[0x263F20FE8]) initWithNWConnectionClientID:v26 options:v9 error:&v18];
  id v13 = v18;

  if (v12)
  {
    [v12 setDelegate:self];
    __int16 v14 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v15 = [(CMContinuityCaptureDeviceBase *)self currentSessionID];
      *(_DWORD *)buf = 138543874;
      float v21 = self;
      __int16 v22 = 2048;
      unint64_t v23 = v15;
      __int16 v24 = 2048;
      double v25 = v12;
      _os_log_impl(&dword_235FC2000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ [sessionID:%llx] createAVCVideoStream %p Success", buf, 0x20u);
    }
  }
  else
  {
    __int16 v14 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[CMContinuityCaptureVideoDevice createAVCVideoStream]();
    }
    CFDictionaryRef v12 = 0;
  }

LABEL_16:
  id v16 = v12;

  return v16;
}

- (id)newVideoStreamCurrentConfiguration:(int64_t)a3
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  BOOL v5 = [(CMContinuityCaptureDeviceBase *)self transportStream];
  int v6 = [(CMContinuityCaptureDeviceBase *)self compositeDelegate];
  int v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 server];
    CFStringRef v9 = (void *)v8;
    id v10 = 0;
    id v11 = 0;
    CFDictionaryRef v12 = 0;
    if (v5 && v8)
    {
      id v13 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
      __int16 v14 = [v13 sessionID];
      CFDictionaryRef v12 = [v5 cipherKeyforSessionID:v14];

      if (v12)
      {
        unint64_t v15 = [(CMContinuityCaptureDeviceBase *)self avcStreamNegotiator];
        id v51 = 0;
        id v10 = [v15 generateMediaStreamConfigurationWithError:&v51];
        id v11 = v51;

        if (v10)
        {
          id v50 = v11;
          [v10 setRtcpSendInterval:1.0];
          [v10 setRtcpTimeOutEnabled:1];
          uint64_t v16 = [v9 currentTransport];
          double v17 = 12.0;
          if (v16 == 2) {
            double v17 = 8.0;
          }
          [v10 setRtcpTimeOutInterval:v17];
          [v10 setSRTPCipherSuite:5];
          [v10 setSRTCPCipherSuite:5];
          [v10 setSendMediaKey:v12];
          [v10 setReceiveMediaKey:v12];
          [v10 setStreamInputID:a3];
          id v18 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
          id v19 = [v18 format];
          uint64_t AVCVideoResolutionForFormat = CMContinuityCaptureGetAVCVideoResolutionForFormat(v19);
          float v21 = [v10 video];
          [v21 setVideoResolution:AVCVideoResolutionForFormat];

          __int16 v22 = [v10 video];
          uint64_t v23 = [v22 videoResolution];

          if (v23 == 12)
          {
            __int16 v24 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
            double v25 = [v24 format];
            uint64_t v26 = [v25 width];
            uint64_t v27 = [v10 video];
            [v27 setCustomWidth:v26];

            uint64_t v28 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
            int v29 = [v28 format];
            uint64_t v30 = [v29 height];
            __int16 v31 = [v10 video];
            [v31 setCustomHeight:v30];
          }
          unsigned int v32 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
          uint64_t v33 = [v32 maxFrameRate];
          char v34 = [v10 video];
          [v34 setFramerate:v33];

          id v35 = [v10 video];
          [v35 setLatencySensitiveModeEnabled:1];

          unint64_t v36 = CMContinuityCaptureLog(2);
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            unint64_t v47 = [(CMContinuityCaptureDeviceBase *)self currentSessionID];
            uint64_t v48 = [v10 video];
            int v37 = [v48 videoResolution];
            [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
            double v38 = v49 = v9;
            objc_super v39 = v12;
            id v40 = v5;
            int v41 = [v38 maxFrameRate];
            int v42 = v7;
            int v43 = [v10 localSSRC];
            int v44 = [v10 remoteSSRC];
            *(_DWORD *)buf = 138413570;
            __int16 v53 = self;
            __int16 v54 = 2048;
            unint64_t v55 = v47;
            __int16 v56 = 1024;
            int v57 = v37;
            __int16 v58 = 1024;
            int v59 = v41;
            BOOL v5 = v40;
            CFDictionaryRef v12 = v39;
            __int16 v60 = 1024;
            int v61 = v43;
            int v7 = v42;
            __int16 v62 = 1024;
            int v63 = v44;
            _os_log_impl(&dword_235FC2000, v36, OS_LOG_TYPE_DEFAULT, "%@ [sessionID:%llx] Stream Resolution %u at frameRate %u localSSRC %x remoteSSRC %x", buf, 0x2Eu);

            CFStringRef v9 = v49;
          }
          id v11 = v50;
        }
        else
        {
          unint64_t v36 = CMContinuityCaptureLog(2);
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
            -[CMContinuityCaptureVideoDevice newVideoStreamCurrentConfiguration]();
          }
          id v10 = 0;
        }
      }
      else
      {
        id v10 = 0;
        id v11 = 0;
      }
    }
    id v45 = v10;
  }
  else
  {
    id v45 = 0;
  }

  return v45;
}

- (BOOL)startAVConferenceStack:(unint64_t)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id stopCompletionBlock = self->_stopCompletionBlock;
  self->_id stopCompletionBlock = 0;

  self->_avcStreamInputActive = 0;
  p_avcVideoStream = (id *)&self->_avcVideoStream;
  if (!self->_avcVideoStream)
  {
    uint64_t v7 = [(CMContinuityCaptureRemoteVideoDevice *)self createAVCVideoStream];
    id v8 = *p_avcVideoStream;
    id *p_avcVideoStream = (id)v7;

    if (!*p_avcVideoStream)
    {
      BOOL v22 = 0;
      id v21 = 0;
      goto LABEL_8;
    }
  }
  id v9 = objc_alloc(MEMORY[0x263F20FD8]);
  id v10 = [(CMContinuityCaptureDeviceBase *)self queue];
  id v11 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
  CFDictionaryRef v12 = [v11 format];
  id v28 = 0;
  id v13 = (AVCStreamInput *)objc_msgSend(v9, "initWithDelegate:delegateQueue:format:options:error:", self, v10, objc_msgSend(v12, "formatDescription"), 0, &v28);
  id v14 = v28;
  avcStreamInput = self->_avcStreamInput;
  self->_avcStreamInput = v13;

  uint64_t v16 = self->_avcStreamInput;
  if (v16)
  {
    double v17 = [(CMContinuityCaptureRemoteVideoDevice *)self newVideoStreamCurrentConfiguration:[(AVCStreamInput *)v16 streamInputID]];
    if (v17)
    {
      id v18 = v17;
      id v19 = *p_avcVideoStream;
      id v27 = v14;
      char v20 = [v19 configure:v18 error:&v27];
      id v21 = v27;

      if (v20)
      {
        [*p_avcVideoStream start];
        BOOL v22 = 1;
      }
      else
      {
        __int16 v24 = CMContinuityCaptureLog(2);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          id v25 = *p_avcVideoStream;
          *(_DWORD *)buf = 138543874;
          uint64_t v30 = self;
          __int16 v31 = 2048;
          id v32 = v25;
          __int16 v33 = 2112;
          id v34 = v21;
          _os_log_error_impl(&dword_235FC2000, v24, OS_LOG_TYPE_ERROR, "%{public}@ AVCVideoStream %p configure error %@", buf, 0x20u);
        }

        BOOL v22 = 0;
      }
      goto LABEL_7;
    }
    id v18 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[CMContinuityCaptureRemoteVideoDevice startAVConferenceStack:]();
    }
  }
  else
  {
    id v18 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[CMContinuityCaptureRemoteVideoDevice startAVConferenceStack:]();
    }
  }
  BOOL v22 = 0;
  id v21 = v14;
LABEL_7:

LABEL_8:
  v26.receiver = self;
  v26.super_class = (Class)CMContinuityCaptureRemoteVideoDevice;
  [(CMContinuityCaptureDeviceBase *)&v26 startAVConferenceStack:a3];

  return v22;
}

- (BOOL)stopAVConferenceStack
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v3 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543618;
    id v9 = self;
    __int16 v10 = 2080;
    id v11 = "-[CMContinuityCaptureRemoteVideoDevice stopAVConferenceStack]";
    _os_log_impl(&dword_235FC2000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ %s", (uint8_t *)&v8, 0x16u);
  }

  if (self->_avcStreamInput && (avcVideoStream = self->_avcVideoStream) != 0)
  {
    [(AVCVideoStream *)avcVideoStream stop];
    BOOL v5 = 1;
  }
  else
  {
    BOOL v5 = 0;
  }
  if (!self->_avcStreamInputActive)
  {
    avcStreamInput = self->_avcStreamInput;
    self->_avcStreamInput = 0;
  }
  return v5;
}

- (void)stopCaptureStack:(unint64_t)a3 completion:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  int v6 = (void (**)(id, void *))a4;
  uint64_t v7 = [(CMContinuityCaptureDeviceBase *)self queue];
  dispatch_assert_queue_V2(v7);

  if (self->_stopCompletionBlock)
  {
    int v8 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = self;
      __int16 v26 = 2080;
      id v27 = "-[CMContinuityCaptureRemoteVideoDevice stopCaptureStack:completion:]";
      _os_log_impl(&dword_235FC2000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ %s already in progress", buf, 0x16u);
    }

    if ((a3 & 4) != 0)
    {
      avcVideoStream = self->_avcVideoStream;
      self->_avcVideoStream = 0;

      __int16 v10 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = self;
        _os_log_impl(&dword_235FC2000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ clear AVCVideo reference", buf, 0xCu);
      }
    }
    if (v6)
    {
      id v11 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"ContinuityCapture" code:3 userInfo:0];
      v6[2](v6, v11);
    }
  }
  else
  {
    if (self->_avcStreamInputActive)
    {
      uint64_t v12 = (void *)MEMORY[0x237DFB780](v6);
      id stopCompletionBlock = self->_stopCompletionBlock;
      self->_id stopCompletionBlock = v12;

      *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
      objc_initWeak((id *)buf, self);
      dispatch_time_t v14 = dispatch_time(0, 5000000000);
      unint64_t v15 = [(CMContinuityCaptureDeviceBase *)self queue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __68__CMContinuityCaptureRemoteVideoDevice_stopCaptureStack_completion___block_invoke;
      block[3] = &unk_264C990F8;
      objc_copyWeak(&v24, (id *)buf);
      dispatch_after(v14, v15, block);

      objc_destroyWeak(&v24);
      objc_destroyWeak((id *)buf);
    }
    BOOL v16 = [(CMContinuityCaptureRemoteVideoDevice *)self stopAVConferenceStack];
    [(CMContinuityCaptureRemoteVideoDevice *)self stopCameraCaptureStack:a3];
    if ((a3 & 4) != 0)
    {
      double v17 = self->_avcVideoStream;
      if (v17) {
        [(AVCVideoStream *)v17 stop];
      }
      avcStreamInput = self->_avcStreamInput;
      self->_avcStreamInput = 0;

      id v19 = self->_avcVideoStream;
      self->_avcVideoStream = 0;

      self->_avcStreamInputActive = 0;
      char v20 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = self;
        _os_log_impl(&dword_235FC2000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ clear AVCVideo reference", buf, 0xCu);
      }
    }
    v22.receiver = self;
    v22.super_class = (Class)CMContinuityCaptureRemoteVideoDevice;
    [(CMContinuityCaptureDeviceBase *)&v22 stopCaptureStack:a3 completion:&__block_literal_global_78];
    if (!v16 || !self->_avcStreamInputActive)
    {
      id v21 = self->_stopCompletionBlock;
      self->_id stopCompletionBlock = 0;

      v6[2](v6, 0);
    }
  }
}

uint64_t __68__CMContinuityCaptureRemoteVideoDevice_stopCaptureStack_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = WeakRetained[41];
    if (v3)
    {
      int v6 = v2;
      (*(void (**)(uint64_t, void))(v3 + 16))(v3, 0);
      id v4 = (void *)v6[41];
      v6[41] = 0;
    }
  }
  return MEMORY[0x270F9A758]();
}

- (void)postActionOfType:(unint64_t)a3 forEvent:(id)a4 option:(unint64_t)a5
{
  id v8 = a4;
  id v9 = v8;
  if (a3 == 3)
  {
    __int16 v10 = [v8 name];
    int v11 = [v10 isEqualToString:@"kCMContinuityCaptureEventStreamInterrupted"];

    if (v11)
    {
      unint64_t v15 = self;
      BOOL v16 = CMContinuityCaptureRemoteVideoDevice;
      uint64_t v12 = (objc_super *)&v15;
    }
    else
    {
      [(CMContinuityCaptureRemoteVideoDevice *)self stopCameraCaptureStack:1024];
      [(CMContinuityCaptureRemoteVideoDevice *)self startCameraCaptureStack:0];
      v14.receiver = self;
      v14.super_class = (Class)CMContinuityCaptureRemoteVideoDevice;
      uint64_t v12 = &v14;
    }
    -[objc_super postActionOfType:forEvent:option:](v12, sel_postActionOfType_forEvent_option_, 13, v9, a5, v13.receiver, v13.super_class, v14.receiver, v14.super_class, v15, v16);
  }
  else
  {
    -[CMContinuityCaptureDeviceBase postActionOfType:forEvent:option:](&v13, sel_postActionOfType_forEvent_option_, a3, v8, a5, self, CMContinuityCaptureRemoteVideoDevice, v14.receiver, v14.super_class, v15, v16);
  }
}

- (void)postActionCompletionForEventName:(id)a3 eventData:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = CMContinuityCaptureRemoteEventToBeRelayedList();
  uint64_t v12 = CMContinuityCaptureRemoteEventToBeRelayedListEvenWhenDropped();
  if ([v11 containsObject:v8]
    && (!v10
     || [v10 code] != 1
     && ([v10 code] != 2 || objc_msgSend(v12, "containsObject:", v8))))
  {
    objc_super v13 = [(CMContinuityCaptureDeviceBase *)self transportDevice];
    objc_msgSend(v13, "postEvent:entity:data:", v8, -[CMContinuityCaptureDeviceBase entity](self, "entity"), v9);
  }
  v14.receiver = self;
  v14.super_class = (Class)CMContinuityCaptureRemoteVideoDevice;
  [(CMContinuityCaptureDeviceBase *)&v14 postActionCompletionForEventName:v8 eventData:v9 error:v10];
}

- (void)captureStillImage:(id)a3 entity:(int64_t)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v9 = [(CMContinuityCaptureDeviceBase *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __76__CMContinuityCaptureRemoteVideoDevice_captureStillImage_entity_completion___block_invoke;
  block[3] = &unk_264C99D60;
  objc_copyWeak(&v16, &location);
  id v13 = v7;
  objc_super v14 = self;
  id v15 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(v9, block);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __76__CMContinuityCaptureRemoteVideoDevice_captureStillImage_entity_completion___block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    uint64_t v3 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v27 = 138543618;
      uint64_t v28 = WeakRetained;
      __int16 v29 = 2112;
      *(void *)uint64_t v30 = v4;
      _os_log_impl(&dword_235FC2000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Got captureStillImage with request %@", (uint8_t *)&v27, 0x16u);
    }

    BOOL v5 = [*(id *)(a1 + 32) compressedFormat];

    if (v5)
    {
      BOOL v5 = [MEMORY[0x263EFF9A0] dictionary];
      int v6 = [*(id *)(a1 + 32) compressedFormat];
      [v5 setObject:v6 forKeyedSubscript:*MEMORY[0x263EFA338]];
    }
    id v7 = [MEMORY[0x263EFA628] photoSettingsWithFormat:v5];
    if ((int)[*(id *)(a1 + 32) maxPhotoDimensions] < 1
      || (int)((unint64_t)[*(id *)(a1 + 32) maxPhotoDimensions] >> 32) < 1)
    {
      objc_msgSend(v7, "setHighResolutionPhotoEnabled:", objc_msgSend(*(id *)(a1 + 32), "highResolutionPhotoEnabled"));
    }
    else
    {
      objc_msgSend(v7, "setMaxPhotoDimensions:", objc_msgSend(*(id *)(a1 + 32), "maxPhotoDimensions"));
    }
    id v8 = [WeakRetained[33] supportedFlashModes];
    id v9 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(*(id *)(a1 + 32), "flashMode"));
    int v10 = [v8 containsObject:v9];

    if (v10)
    {
      objc_msgSend(v7, "setFlashMode:", (int)objc_msgSend(*(id *)(a1 + 32), "flashMode"));
    }
    else
    {
      id v11 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        int v25 = [*(id *)(a1 + 32) flashMode];
        __int16 v26 = [WeakRetained[33] supportedFlashModes];
        int v27 = 138543874;
        uint64_t v28 = WeakRetained;
        __int16 v29 = 1024;
        *(_DWORD *)uint64_t v30 = v25;
        *(_WORD *)&v30[4] = 2112;
        *(void *)&v30[6] = v26;
        _os_log_error_impl(&dword_235FC2000, v11, OS_LOG_TYPE_ERROR, "%{public}@ Still capture request specified unsupported flash mode %d, supported modes %@", (uint8_t *)&v27, 0x1Cu);
      }
    }
    objc_msgSend(v7, "setPhotoQualityPrioritization:", (int)objc_msgSend(*(id *)(a1 + 32), "photoQualityPrioritization"));
    if (v7 && [WeakRetained streaming] && WeakRetained[33])
    {
      id v12 = *(id *)(a1 + 40);
      objc_sync_enter(v12);
      id v13 = WeakRetained[29];
      if (!v13)
      {
        uint64_t v14 = [MEMORY[0x263EFF9A0] dictionary];
        id v15 = WeakRetained[29];
        WeakRetained[29] = (id)v14;

        id v13 = WeakRetained[29];
      }
      uint64_t v16 = *(void *)(a1 + 32);
      double v17 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v7, "uniqueID"));
      [v13 setObject:v16 forKeyedSubscript:v17];

      objc_sync_exit(v12);
      id v18 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v19 = *(void *)(a1 + 32);
        int v27 = 138543874;
        uint64_t v28 = WeakRetained;
        __int16 v29 = 2112;
        *(void *)uint64_t v30 = v7;
        *(_WORD *)&v30[8] = 2112;
        *(void *)&v30[10] = v19;
        _os_log_impl(&dword_235FC2000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ Capturing %@ for %@", (uint8_t *)&v27, 0x20u);
      }

      [WeakRetained[33] capturePhotoWithSettings:v7 delegate:*(void *)(a1 + 40)];
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    else
    {
      char v20 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        uint64_t v22 = *(void *)(a1 + 32);
        int v23 = [WeakRetained streaming];
        id v24 = WeakRetained[33];
        int v27 = 138544386;
        uint64_t v28 = WeakRetained;
        __int16 v29 = 2112;
        *(void *)uint64_t v30 = v22;
        *(_WORD *)&v30[8] = 2112;
        *(void *)&v30[10] = v7;
        __int16 v31 = 1024;
        int v32 = v23;
        __int16 v33 = 2112;
        id v34 = v24;
        _os_log_error_impl(&dword_235FC2000, v20, OS_LOG_TYPE_ERROR, "%{public}@ Failed to capture photo for request %@. photoSettings:%@ streaming:%d photoOutput:%@", (uint8_t *)&v27, 0x30u);
      }

      id v21 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"ContinuityCapture" code:-1002 userInfo:0];
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
}

- (void)enqueueReactionEffect:(id)a3 entity:(int64_t)a4
{
  id v5 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  int v6 = [(CMContinuityCaptureDeviceBase *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__CMContinuityCaptureRemoteVideoDevice_enqueueReactionEffect_entity___block_invoke;
  block[3] = &unk_264C99120;
  objc_copyWeak(&v10, &location);
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, block);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __69__CMContinuityCaptureRemoteVideoDevice_enqueueReactionEffect_entity___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v3 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      id v7 = WeakRetained;
      __int16 v8 = 2112;
      uint64_t v9 = v4;
      _os_log_impl(&dword_235FC2000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Got enqueueReactionEffect with reactionType %@", buf, 0x16u);
    }

    if ([WeakRetained streaming])
    {
      id v5 = (void *)WeakRetained[36];
      if (v5) {
        [v5 performEffectForReaction:*(void *)(a1 + 32)];
      }
    }
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v13 = [(CMContinuityCaptureDeviceBase *)self queue];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __87__CMContinuityCaptureRemoteVideoDevice_observeValueForKeyPath_ofObject_change_context___block_invoke;
  v17[3] = &unk_264C99238;
  objc_copyWeak(v21, &location);
  id v18 = v10;
  id v19 = v11;
  id v20 = v12;
  v21[1] = a6;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(v13, v17);

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
}

void __87__CMContinuityCaptureRemoteVideoDevice_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _observeValueForKeyPath:*(void *)(a1 + 32) ofObject:*(void *)(a1 + 40) change:*(void *)(a1 + 48) context:*(void *)(a1 + 64)];
    id WeakRetained = v3;
  }
}

- (void)_observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  id v10 = [(CMContinuityCaptureDeviceBase *)self queue];
  dispatch_assert_queue_V2(v10);

  if ([v8 isEqualToString:@"activeVideoMinFrameDuration"])
  {
    id v11 = [v9 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
    id v12 = v11;
    if (v11 && ([v11 CMTimeValue], *(void *)buf))
    {
      *(float *)&double v13 = (float)*(int *)&buf[8] / (float)*(uint64_t *)buf;
      id v14 = [NSNumber numberWithFloat:v13];
    }
    else
    {
      id v14 = &unk_26E96A7D8;
    }
    uint64_t v17 = [v14 unsignedIntValue];
    id v18 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
    [v18 setMaxFrameRate:v17];

LABEL_33:
    [(CMContinuityCaptureRemoteVideoDevice *)self updateControlStatus];

LABEL_34:
    goto LABEL_35;
  }
  if ([v8 isEqualToString:@"activeVideoMaxFrameDuration"])
  {
    id v15 = [v9 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
    id v12 = v15;
    if (v15 && ([v15 CMTimeValue], *(void *)buf))
    {
      *(float *)&double v16 = (float)*(int *)&buf[8] / (float)*(uint64_t *)buf;
      id v14 = [NSNumber numberWithFloat:v16];
    }
    else
    {
      id v14 = &unk_26E96A7D8;
    }
    uint64_t v39 = [v14 unsignedIntValue];
    id v40 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
    [v40 setMinFrameRate:v39];

    int v41 = [(NSMutableDictionary *)self->_cmControlByName objectForKeyedSubscript:@"CMIOExtensionPropertyStreamMaxFrameDuration"];
    [v41 setValue:v14];

    goto LABEL_33;
  }
  if ([v8 isEqualToString:@"reactionEffectsInProgress"])
  {
    id v19 = [v9 objectForKeyedSubscript:*MEMORY[0x263F081C8]];
    id v56 = v9;
    id v20 = [v9 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
    id v21 = [MEMORY[0x263EFFA08] setWithArray:v19];
    uint64_t v22 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v20, "count") + objc_msgSend(v19, "count"));
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    id v23 = v19;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v61 objects:v71 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v62;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v62 != v26) {
            objc_enumerationMutation(v23);
          }
          uint64_t v28 = [*(id *)(*((void *)&v61 + 1) + 8 * i) dictionaryRepresentation];
          [v22 addObject:v28];
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v61 objects:v71 count:16];
      }
      while (v25);
    }

    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id v29 = v20;
    uint64_t v30 = [v29 countByEnumeratingWithState:&v57 objects:v70 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v58;
      do
      {
        for (uint64_t j = 0; j != v31; ++j)
        {
          if (*(void *)v58 != v32) {
            objc_enumerationMutation(v29);
          }
          id v34 = *(void **)(*((void *)&v57 + 1) + 8 * j);
          if (([v21 containsObject:v34] & 1) == 0)
          {
            uint64_t v35 = [v34 dictionaryRepresentation];
            [v22 addObject:v35];
          }
        }
        uint64_t v31 = [v29 countByEnumeratingWithState:&v57 objects:v70 count:16];
      }
      while (v31);
    }

    unint64_t v36 = [(NSMutableDictionary *)self->_cmControlByName objectForKeyedSubscript:@"ReactionsInProgress"];
    [v36 setValue:v22];
    int v37 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = self;
      __int16 v66 = 2114;
      *(void *)v67 = v36;
      _os_log_impl(&dword_235FC2000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@ updated %{public}@", buf, 0x16u);
    }

    double v38 = [(CMContinuityCaptureDeviceBase *)self transportDevice];
    [v38 setValueForControl:v36 completion:0];

    id v9 = v56;
    goto LABEL_35;
  }
  if ([v8 isEqualToString:@"active"])
  {
    uint64_t v42 = *MEMORY[0x263F081B8];
    int v43 = [v9 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
    if ([v43 BOOLValue])
    {

      goto LABEL_47;
    }
    id v51 = [v9 objectForKeyedSubscript:*MEMORY[0x263F081C8]];
    int v52 = [v51 BOOLValue];

    if (!v52)
    {
LABEL_47:
      id v12 = [v9 objectForKeyedSubscript:v42];
      if ([v12 BOOLValue])
      {
        __int16 v54 = [v9 objectForKeyedSubscript:*MEMORY[0x263F081C8]];
        char v55 = [v54 BOOLValue];

        if (v55) {
          goto LABEL_35;
        }
        id v12 = CMContinuityCaptureLog(2);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          *(void *)&uint8_t buf[4] = self;
          _os_log_impl(&dword_235FC2000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ active 0 -> 1", buf, 0xCu);
        }
      }
      goto LABEL_34;
    }
    __int16 v53 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = self;
      _os_log_impl(&dword_235FC2000, v53, OS_LOG_TYPE_DEFAULT, "%{public}@ active 1 -> 0", buf, 0xCu);
    }

    [(CMContinuityCaptureRemoteVideoDevice *)self stopCaptureStack:4 completion:&__block_literal_global_88];
  }
  else
  {
    if ([v8 isEqualToString:@"throttled"])
    {
      int v44 = [v9 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
      int v45 = [v44 BOOLValue];

      __int16 v46 = [(CMContinuityCaptureDeviceBase *)self compositeDelegate];
      unint64_t v47 = [v46 frameRateManager];
      id v12 = [v47 allowedFrameRateRangeForDevice:self];

      uint64_t v48 = [v12 maxFrameRate];
      -[CMContinuityCaptureRemoteVideoDevice setMaxFrameRate:](self, "setMaxFrameRate:", [v48 unsignedIntValue]);

      long long v49 = [v12 minFrameRate];
      -[CMContinuityCaptureRemoteVideoDevice setMinFrameRate:](self, "setMinFrameRate:", [v49 unsignedIntValue]);

      id v50 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138544130;
        *(void *)&uint8_t buf[4] = self;
        __int16 v66 = 1024;
        *(_DWORD *)v67 = [(CMContinuityCaptureRemoteVideoDevice *)self maxFrameRate];
        *(_WORD *)&v67[4] = 1024;
        *(_DWORD *)&v67[6] = [(CMContinuityCaptureRemoteVideoDevice *)self minFrameRate];
        __int16 v68 = 1024;
        int v69 = v45;
        _os_log_impl(&dword_235FC2000, v50, OS_LOG_TYPE_DEFAULT, "%{public}@ Updated maxFrameRate: %u minFrameRate: %u, throttled state: %d", buf, 0x1Eu);
      }

      goto LABEL_34;
    }
    if ([v8 isEqualToString:@"activeConfiguration"])
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        [(CMContinuityCaptureRemoteVideoDevice *)self _configureVideoEffects];
        [(CMContinuityCaptureRemoteVideoDevice *)self _updateControlStatus];
      }
    }
  }
LABEL_35:
}

- (void)updateControlStatus
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v3 = [(CMContinuityCaptureDeviceBase *)self queue];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __59__CMContinuityCaptureRemoteVideoDevice_updateControlStatus__block_invoke;
  v4[3] = &unk_264C990F8;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __59__CMContinuityCaptureRemoteVideoDevice_updateControlStatus__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _updateControlStatus];
    id WeakRetained = v2;
  }
}

- (void)_updateControlStatus
{
  uint64_t v125 = *MEMORY[0x263EF8340];
  id v3 = [(CMContinuityCaptureDeviceBase *)self queue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v122 = self;
    __int16 v123 = 2080;
    v124 = "-[CMContinuityCaptureRemoteVideoDevice _updateControlStatus]";
    _os_log_impl(&dword_235FC2000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ %s", buf, 0x16u);
  }

  id v5 = [(NSMutableDictionary *)self->_cmControlByName objectForKeyedSubscript:@"4cc_cfac_glob_0000"];
  if (v5)
  {
    int v6 = [(AVCaptureDeviceInput *)self->_videoDataInput device];
    if ([v6 isCenterStageActive])
    {
      id v7 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
      if ([v7 isCenterStageForcefullyEnabled])
      {
        uint64_t v8 = 1;
      }
      else
      {
        id v9 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
        uint64_t v8 = [v9 centerStageEnabled];
      }
    }
    else
    {
      uint64_t v8 = 0;
    }

    id v10 = [v5 value];
    int v11 = [v10 BOOLValue];

    if (v8 != v11)
    {
      id v12 = [NSNumber numberWithBool:v8];
      [v5 setValue:v12];

      double v13 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v122 = self;
        __int16 v123 = 2114;
        v124 = (const char *)v5;
        _os_log_impl(&dword_235FC2000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ updated %{public}@", buf, 0x16u);
      }

      id v14 = [(CMContinuityCaptureDeviceBase *)self transportDevice];
      [v14 setValueForControl:v5 completion:0];
    }
  }
  id v15 = [(NSMutableDictionary *)self->_cmControlByName objectForKeyedSubscript:@"OverheadCameraMode"];

  if (v15)
  {
    double v16 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
    uint64_t v17 = [v16 deskViewCameraMode];

    id v18 = [v15 value];
    int v19 = [v18 intValue];

    if (v17 != v19)
    {
      id v20 = [NSNumber numberWithInteger:v17];
      [v15 setValue:v20];

      id v21 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v122 = self;
        __int16 v123 = 2114;
        v124 = (const char *)v15;
        _os_log_impl(&dword_235FC2000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ updated %{public}@", buf, 0x16u);
      }

      uint64_t v22 = [(CMContinuityCaptureDeviceBase *)self transportDevice];
      [v22 setValueForControl:v15 completion:0];
    }
  }
  id v23 = [(NSMutableDictionary *)self->_cmControlByName objectForKeyedSubscript:@"4cc_cfen_glob_0000"];

  if (v23)
  {
    uint64_t v24 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
    if ([v24 centerStageEnabled])
    {
      uint64_t v25 = 1;
    }
    else
    {
      uint64_t v26 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
      uint64_t v25 = [v26 isCenterStageForcefullyEnabled];
    }
    int v27 = [v23 value];
    int v28 = [v27 BOOLValue];

    if (v25 != v28)
    {
      id v29 = [NSNumber numberWithBool:v25];
      [v23 setValue:v29];

      uint64_t v30 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v122 = self;
        __int16 v123 = 2114;
        v124 = (const char *)v23;
        _os_log_impl(&dword_235FC2000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@ updated %{public}@", buf, 0x16u);
      }

      uint64_t v31 = [(CMContinuityCaptureDeviceBase *)self transportDevice];
      [v31 setValueForControl:v23 completion:0];
    }
  }
  uint64_t v32 = [(NSMutableDictionary *)self->_cmControlByName objectForKeyedSubscript:@"4cc_cfri_glob_0000"];

  if (v32)
  {
    uint64_t v33 = [v32 value];
    if (v33)
    {
      id v34 = (void *)v33;
      uint64_t v35 = [(CMContinuityCaptureRemoteVideoDevice *)self centerStageRectOfInterest];
      unint64_t v36 = [v32 value];
      char v37 = [v35 isEqualToDictionary:v36];

      if ((v37 & 1) == 0)
      {
        double v38 = [(CMContinuityCaptureRemoteVideoDevice *)self centerStageRectOfInterest];
        [v32 setValue:v38];

        uint64_t v39 = CMContinuityCaptureLog(2);
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v122 = self;
          __int16 v123 = 2114;
          v124 = (const char *)v32;
          _os_log_impl(&dword_235FC2000, v39, OS_LOG_TYPE_DEFAULT, "%{public}@ updated %{public}@", buf, 0x16u);
        }

        id v40 = [(CMContinuityCaptureDeviceBase *)self transportDevice];
        [v40 setValueForControl:v32 completion:0];
      }
    }
  }
  int v41 = [(NSMutableDictionary *)self->_cmControlByName objectForKeyedSubscript:@"4cc_cffm_glob_0000"];

  if (v41)
  {
    uint64_t v42 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
    uint64_t v43 = [v42 centerStageFramingMode];

    int v44 = [v41 value];
    int v45 = [v44 intValue];

    if (v43 != v45)
    {
      __int16 v46 = [NSNumber numberWithInteger:v43];
      [v41 setValue:v46];

      unint64_t v47 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v122 = self;
        __int16 v123 = 2114;
        v124 = (const char *)v41;
        _os_log_impl(&dword_235FC2000, v47, OS_LOG_TYPE_DEFAULT, "%{public}@ updated %{public}@", buf, 0x16u);
      }

      uint64_t v48 = [(CMContinuityCaptureDeviceBase *)self transportDevice];
      [v48 setValueForControl:v41 completion:0];
    }
  }
  long long v49 = [(NSMutableDictionary *)self->_cmControlByName objectForKeyedSubscript:@"PortraitEffectActive"];

  if (v49)
  {
    id v50 = [(AVCaptureDeviceInput *)self->_videoDataInput device];
    if ([v50 isPortraitEffectActive])
    {
      uint64_t v51 = 1;
    }
    else
    {
      int v52 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
      uint64_t v51 = [v52 portraitEffectEnabled];
    }
    __int16 v53 = [v49 value];
    int v54 = [v53 BOOLValue];

    if (v51 != v54)
    {
      char v55 = [NSNumber numberWithBool:v51];
      [v49 setValue:v55];

      id v56 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v122 = self;
        __int16 v123 = 2114;
        v124 = (const char *)v49;
        _os_log_impl(&dword_235FC2000, v56, OS_LOG_TYPE_DEFAULT, "%{public}@ updated %{public}@", buf, 0x16u);
      }

      long long v57 = [(CMContinuityCaptureDeviceBase *)self transportDevice];
      [v57 setValueForControl:v49 completion:0];
    }
  }
  long long v58 = [(NSMutableDictionary *)self->_cmControlByName objectForKeyedSubscript:@"StudioLightingActive"];

  if (v58)
  {
    long long v59 = [(AVCaptureDeviceInput *)self->_videoDataInput device];
    if ([v59 isStudioLightActive])
    {
      uint64_t v60 = 1;
    }
    else
    {
      long long v61 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
      uint64_t v60 = [v61 studioLightingEnabled];
    }
    long long v62 = [v58 value];
    int v63 = [v62 BOOLValue];

    if (v60 != v63)
    {
      long long v64 = [NSNumber numberWithBool:v60];
      [v58 setValue:v64];

      char v65 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v122 = self;
        __int16 v123 = 2114;
        v124 = (const char *)v58;
        _os_log_impl(&dword_235FC2000, v65, OS_LOG_TYPE_DEFAULT, "%{public}@ updated %{public}@", buf, 0x16u);
      }

      __int16 v66 = [(CMContinuityCaptureDeviceBase *)self transportDevice];
      [v66 setValueForControl:v58 completion:0];
    }
  }
  v67 = [(NSMutableDictionary *)self->_cmControlByName objectForKeyedSubscript:@"ReactionEffectsActive"];

  if (v67)
  {
    __int16 v68 = [(AVCaptureDeviceInput *)self->_videoDataInput device];
    if ([v68 canPerformReactionEffects])
    {
      uint64_t v69 = 1;
    }
    else
    {
      int v70 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
      uint64_t v69 = [v70 reactionEffectsEnabled];
    }
    int v71 = [v67 value];
    int v72 = [v71 BOOLValue];

    if (v69 != v72)
    {
      int v73 = [NSNumber numberWithBool:v69];
      [v67 setValue:v73];

      int v74 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v122 = self;
        __int16 v123 = 2114;
        v124 = (const char *)v67;
        _os_log_impl(&dword_235FC2000, v74, OS_LOG_TYPE_DEFAULT, "%{public}@ updated %{public}@", buf, 0x16u);
      }

      int v75 = [(CMContinuityCaptureDeviceBase *)self transportDevice];
      [v75 setValueForControl:v67 completion:0];
    }
  }
  int v76 = [(NSMutableDictionary *)self->_cmControlByName objectForKeyedSubscript:@"BackgroundReplacementActive"];

  if (v76)
  {
    int v77 = [(AVCaptureDeviceInput *)self->_videoDataInput device];
    if ([v77 isBackgroundReplacementActive])
    {
      uint64_t v78 = 1;
    }
    else
    {
      v79 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
      uint64_t v78 = [v79 backgroundReplacementEnabled];
    }
    __int16 v80 = [v76 value];
    int v81 = [v80 BOOLValue];

    if (v78 != v81)
    {
      uint64_t v82 = [NSNumber numberWithBool:v78];
      [v76 setValue:v82];

      v83 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v122 = self;
        __int16 v123 = 2114;
        v124 = (const char *)v76;
        _os_log_impl(&dword_235FC2000, v83, OS_LOG_TYPE_DEFAULT, "%{public}@ updated %{public}@", buf, 0x16u);
      }

      v84 = [(CMContinuityCaptureDeviceBase *)self transportDevice];
      [v84 setValueForControl:v76 completion:0];
    }
  }
  v85 = [(NSMutableDictionary *)self->_cmControlByName objectForKeyedSubscript:@"CMIOExtensionPropertyStreamFrameDuration"];

  if (v85)
  {
    videoDevice = self->_videoDevice;
    if (videoDevice)
    {
      [(AVCaptureDevice *)videoDevice activeVideoMinFrameDuration];
      if (v120)
      {
        v87 = self->_videoDevice;
        if (v87)
        {
          [(AVCaptureDevice *)v87 activeVideoMinFrameDuration];
          v88 = self->_videoDevice;
          double v89 = (double)v119;
          if (v88)
          {
            [(AVCaptureDevice *)v88 activeVideoMinFrameDuration];
            double v90 = (double)v118;
            goto LABEL_79;
          }
        }
        else
        {
          double v89 = 0.0;
        }
        double v90 = 0.0;
LABEL_79:
        double v91 = v89 / v90;
        int v92 = [v85 value];
        [v92 doubleValue];
        double v94 = v93;

        if (v94 != v91)
        {
          __int16 v95 = [NSNumber numberWithDouble:v91];
          [v85 setValue:v95];

          int v96 = CMContinuityCaptureLog(2);
          if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v122 = self;
            __int16 v123 = 2114;
            v124 = (const char *)v85;
            _os_log_impl(&dword_235FC2000, v96, OS_LOG_TYPE_DEFAULT, "%{public}@ updated %{public}@", buf, 0x16u);
          }

          __int16 v97 = [(CMContinuityCaptureDeviceBase *)self transportDevice];
          [v97 setValueForControl:v85 completion:0];
        }
      }
    }
  }
  int v98 = [(NSMutableDictionary *)self->_cmControlByName objectForKeyedSubscript:@"CMIOExtensionPropertyStreamMaxFrameDuration"];

  if (!v98) {
    goto LABEL_96;
  }
  __int16 v99 = self->_videoDevice;
  if (!v99) {
    goto LABEL_96;
  }
  [(AVCaptureDevice *)v99 activeVideoMaxFrameDuration];
  if (!v117) {
    goto LABEL_96;
  }
  int v100 = self->_videoDevice;
  if (v100)
  {
    [(AVCaptureDevice *)v100 activeVideoMaxFrameDuration];
    __int16 v101 = self->_videoDevice;
    double v102 = (double)(int)v115;
    if (v101)
    {
      [(AVCaptureDevice *)v101 activeVideoMaxFrameDuration];
      double v103 = (double)v111;
      goto LABEL_92;
    }
  }
  else
  {
    uint64_t v114 = 0;
    uint64_t v115 = 0;
    double v102 = 0.0;
    uint64_t v116 = 0;
  }
  uint64_t v111 = 0;
  uint64_t v112 = 0;
  double v103 = 0.0;
  uint64_t v113 = 0;
LABEL_92:
  double v104 = v102 / v103;
  __int16 v105 = objc_msgSend(v98, "value", v111, v112, v113, v114, v115, v116);
  [v105 doubleValue];
  double v107 = v106;

  if (v107 != v104)
  {
    double v108 = [NSNumber numberWithDouble:v104];
    [v98 setValue:v108];

    __int16 v109 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v122 = self;
      __int16 v123 = 2114;
      v124 = (const char *)v98;
      _os_log_impl(&dword_235FC2000, v109, OS_LOG_TYPE_DEFAULT, "%{public}@ updated %{public}@", buf, 0x16u);
    }

    double v110 = [(CMContinuityCaptureDeviceBase *)self transportDevice];
    [v110 setValueForControl:v98 completion:0];
  }
LABEL_96:
}

- (void)setValueForControl:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  uint64_t v8 = [(CMContinuityCaptureDeviceBase *)self queue];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __70__CMContinuityCaptureRemoteVideoDevice_setValueForControl_completion___block_invoke;
  v10[3] = &unk_264C99198;
  objc_copyWeak(&v13, &location);
  id v11 = v6;
  id v12 = self;
  id v9 = v6;
  dispatch_async(v8, v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __70__CMContinuityCaptureRemoteVideoDevice_setValueForControl_completion___block_invoke(uint64_t a1)
{
  uint64_t v362 = *MEMORY[0x263EF8340];
  id v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = WeakRetained;
  if (!WeakRetained) {
    goto LABEL_61;
  }
  if (!WeakRetained[344])
  {
    id v10 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = objc_loadWeakRetained(v2);
      double v12 = *(double *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      id v355 = v11;
      __int16 v356 = 2112;
      double v357 = v12;
      _os_log_impl(&dword_235FC2000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ dropping control %@ update since capture stack not active", buf, 0x16u);
    }
    id v13 = *(void **)(a1 + 32);
    id v14 = (void *)*((void *)v4 + 44);
    id v15 = [v13 name];
    [v14 setObject:v13 forKeyedSubscript:v15];
    goto LABEL_60;
  }
  id v5 = [*(id *)(a1 + 32) name];
  int v6 = [v5 isEqualToString:@"4cc_cfen_glob_0000"];

  if (v6)
  {
    if ([v4 isDockedTrackingEnabled])
    {
      id v15 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_235FC2000, v15, OS_LOG_TYPE_DEFAULT, "Center Stage should not be set when docked tracking is enabled. Ignore the request.", buf, 2u);
      }
      goto LABEL_60;
    }
    id v7 = [v4 activeConfiguration];
    int v8 = [v7 centerStageEnabled];
    id v9 = [*(id *)(a1 + 32) value];
    if (v8 != [v9 BOOLValue])
    {

LABEL_23:
      uint64_t v39 = [*(id *)(a1 + 32) value];
      uint64_t v40 = [v39 BOOLValue];
      int v41 = [v4 activeConfiguration];
      [v41 setCenterStageEnabled:v40];

      id v7 = [*((id *)v4 + 32) objectForKeyedSubscript:@"4cc_cfen_glob_0000"];
      uint64_t v42 = [*(id *)(a1 + 32) value];
      [v7 setValue:v42];

      uint64_t v43 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        int v44 = *(void **)(a1 + 40);
        int v45 = [v4 activeConfiguration];
        int v46 = [v45 centerStageEnabled];
        *(double *)&unint64_t v47 = COERCE_DOUBLE("Off");
        if (v46) {
          *(double *)&unint64_t v47 = COERCE_DOUBLE("On");
        }
        *(_DWORD *)buf = 138543618;
        id v355 = v44;
        __int16 v356 = 2080;
        double v357 = *(double *)&v47;
        _os_log_impl(&dword_235FC2000, v43, OS_LOG_TYPE_DEFAULT, "%{public}@ CenterStageEnabled %s", buf, 0x16u);
      }
      uint64_t v48 = [v4 activeConfiguration];
      int v49 = [v48 isCenterStageForcefullyEnabled];

      if (v49)
      {
        [v4 _restoreStatesAfterForcefulCenterStageEnablementAndShouldReconfigureCaptureStack:0];
        id v50 = [v4 companionDevice];
        [v50 _restoreStatesAfterForcefulCenterStageEnablementAndShouldReconfigureCaptureStack:0];
      }
      [v4 _toggleBetweenCenterStageAndManualFraming];
      goto LABEL_57;
    }
    unint64_t v36 = [v4 activeConfiguration];
    if ([v36 isCenterStageForcefullyEnabled])
    {
      char v37 = [*(id *)(a1 + 32) value];
      char v38 = [v37 BOOLValue];

      if (v38) {
        goto LABEL_58;
      }
      goto LABEL_23;
    }

LABEL_57:
    goto LABEL_58;
  }
  double v16 = [*(id *)(a1 + 32) name];
  if ([v16 isEqualToString:@"4cc_cfri_glob_0000"]
    && ([*(id *)(a1 + 32) value], (uint64_t v17 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v18 = (void *)v17;
    int v19 = [*(id *)(a1 + 32) value];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v21 = [*(id *)(a1 + 32) value];
      uint64_t v22 = [v4 activeConfiguration];
      [v22 setCenterStageRectOfInterest:v21];

      id v23 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v24 = *(void **)(a1 + 40);
        uint64_t v25 = [v4 activeConfiguration];
        double v26 = [v25 centerStageRectOfInterest];
        *(_DWORD *)buf = 138412546;
        id v355 = v24;
        __int16 v356 = 2112;
        double v357 = v26;
        _os_log_impl(&dword_235FC2000, v23, OS_LOG_TYPE_DEFAULT, "%@ CenterStageRectOfInterest %@", buf, 0x16u);
      }
      id v7 = [*(id *)(a1 + 32) value];
      [v4 setCenterStageRectOfInterest:v7];
      goto LABEL_57;
    }
  }
  else
  {
  }
  int v27 = [*(id *)(a1 + 32) name];
  int v28 = [v27 isEqualToString:@"4cc_cffm_glob_0000"];

  id v29 = *(void **)(a1 + 32);
  if (v28)
  {
    uint64_t v30 = [v29 value];
    uint64_t v31 = (int)[v30 intValue];

    uint64_t v32 = [v4 activeConfiguration];
    [v32 setCenterStageFramingMode:v31];

    uint64_t v33 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      id v34 = *(void **)(a1 + 40);
      uint64_t v35 = [v4 activeConfiguration];
      *(_DWORD *)buf = 138412546;
      id v355 = v34;
      __int16 v356 = 2048;
      double v357 = COERCE_DOUBLE([v35 centerStageFramingMode]);
      _os_log_impl(&dword_235FC2000, v33, OS_LOG_TYPE_DEFAULT, "%@ CenterStageFramingMode %ld", buf, 0x16u);
    }
    [v4 setCenterStageFramingMode:v31];
    goto LABEL_58;
  }
  uint64_t v51 = [v29 name];
  int v52 = [v51 isEqualToString:@"FaceDetectionEnabled"];

  if (v52)
  {
    __int16 v53 = [v4 activeConfiguration];
    int v54 = [v53 faceDetectionEnabled];
    char v55 = [*(id *)(a1 + 32) value];
    int v56 = [v55 BOOLValue];

    if (v54 == v56) {
      goto LABEL_58;
    }
    long long v57 = [*(id *)(a1 + 32) value];
    uint64_t v58 = [v57 BOOLValue];
    long long v59 = [v4 activeConfiguration];
    [v59 setFaceDetectionEnabled:v58];

    uint64_t v60 = CMContinuityCaptureLog(2);
    if (!os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_56;
    }
    long long v61 = *(void **)(a1 + 40);
    long long v62 = [v4 activeConfiguration];
    int v63 = [v62 faceDetectionEnabled];
    *(double *)&long long v64 = COERCE_DOUBLE("Off");
    if (v63) {
      *(double *)&long long v64 = COERCE_DOUBLE("On");
    }
    *(_DWORD *)buf = 138543618;
    id v355 = v61;
    __int16 v356 = 2080;
    double v357 = *(double *)&v64;
    char v65 = "%{public}@ FaceDetectionEnabled %s";
    goto LABEL_55;
  }
  __int16 v66 = [*(id *)(a1 + 32) name];
  int v67 = [v66 isEqualToString:@"HumanBodyDetectionEnabled"];

  if (v67)
  {
    __int16 v68 = [v4 activeConfiguration];
    int v69 = [v68 humanBodyDetectionEnabled];
    int v70 = [*(id *)(a1 + 32) value];
    int v71 = [v70 BOOLValue];

    if (v69 == v71) {
      goto LABEL_58;
    }
    int v72 = [*(id *)(a1 + 32) value];
    uint64_t v73 = [v72 BOOLValue];
    int v74 = [v4 activeConfiguration];
    [v74 setHumanBodyDetectionEnabled:v73];

    uint64_t v60 = CMContinuityCaptureLog(2);
    if (!os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_56;
    }
    int v75 = *(void **)(a1 + 40);
    long long v62 = [v4 activeConfiguration];
    int v76 = [v62 humanBodyDetectionEnabled];
    *(double *)&int v77 = COERCE_DOUBLE("Off");
    if (v76) {
      *(double *)&int v77 = COERCE_DOUBLE("On");
    }
    *(_DWORD *)buf = 138543618;
    id v355 = v75;
    __int16 v356 = 2080;
    double v357 = *(double *)&v77;
    char v65 = "%{public}@ HumanBodyDetectionEnabled %s";
    goto LABEL_55;
  }
  uint64_t v78 = [*(id *)(a1 + 32) name];
  int v79 = [v78 isEqualToString:@"HumanFullBodyDetectionEnabled"];

  if (v79)
  {
    __int16 v80 = [v4 activeConfiguration];
    int v81 = [v80 humanFullBodyDetectionEnabled];
    uint64_t v82 = [*(id *)(a1 + 32) value];
    int v83 = [v82 BOOLValue];

    if (v81 == v83) {
      goto LABEL_58;
    }
    v84 = [*(id *)(a1 + 32) value];
    uint64_t v85 = [v84 BOOLValue];
    __int16 v86 = [v4 activeConfiguration];
    [v86 setHumanFullBodyDetectionEnabled:v85];

    uint64_t v60 = CMContinuityCaptureLog(2);
    if (!os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_56;
    }
    v87 = *(void **)(a1 + 40);
    long long v62 = [v4 activeConfiguration];
    int v88 = [v62 humanFullBodyDetectionEnabled];
    *(double *)&double v89 = COERCE_DOUBLE("Off");
    if (v88) {
      *(double *)&double v89 = COERCE_DOUBLE("On");
    }
    *(_DWORD *)buf = 138543618;
    id v355 = v87;
    __int16 v356 = 2080;
    double v357 = *(double *)&v89;
    char v65 = "%{public}@ HumanFullBodyDetectionEnabled %s";
    goto LABEL_55;
  }
  double v90 = [*(id *)(a1 + 32) name];
  int v91 = [v90 isEqualToString:@"AsyncStillCaptureEnabled"];

  if (v91)
  {
    int v92 = [v4 activeConfiguration];
    int v93 = [v92 asyncStillCaptureEnabled];
    double v94 = [*(id *)(a1 + 32) value];
    int v95 = [v94 BOOLValue];

    if (v93 == v95) {
      goto LABEL_58;
    }
    int v96 = [*(id *)(a1 + 32) value];
    uint64_t v97 = [v96 BOOLValue];
    int v98 = [v4 activeConfiguration];
    [v98 setAsyncStillCaptureEnabled:v97];

    uint64_t v60 = CMContinuityCaptureLog(2);
    if (!os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_56;
    }
    __int16 v99 = *(void **)(a1 + 40);
    long long v62 = [v4 activeConfiguration];
    int v100 = [v62 asyncStillCaptureEnabled];
    *(double *)&__int16 v101 = COERCE_DOUBLE("Off");
    if (v100) {
      *(double *)&__int16 v101 = COERCE_DOUBLE("On");
    }
    *(_DWORD *)buf = 138543618;
    id v355 = v99;
    __int16 v356 = 2080;
    double v357 = *(double *)&v101;
    char v65 = "%{public}@ AsyncStillCaptureEnabled %s";
LABEL_55:
    _os_log_impl(&dword_235FC2000, v60, OS_LOG_TYPE_DEFAULT, v65, buf, 0x16u);

LABEL_56:
    id v7 = [v4 compositeDelegate];
    -[NSObject postEvent:entity:data:](v7, "postEvent:entity:data:", @"kCMContinuityCaptureEventForceRestartStream", [v4 entity], 0);
    goto LABEL_57;
  }
  double v106 = [*(id *)(a1 + 32) name];
  int v107 = [v106 isEqualToString:@"SuppressVideoEffects"];

  if (!v107)
  {
    uint64_t v120 = [*(id *)(a1 + 32) name];
    int v121 = [v120 isEqualToString:@"PortraitEffectEnabled"];

    if (v121)
    {
      v122 = [v4 activeConfiguration];
      int v123 = [v122 portraitEffectEnabled];
      v124 = [*(id *)(a1 + 32) value];
      int v125 = [v124 BOOLValue];

      if (v123 != v125)
      {
        v126 = [*(id *)(a1 + 32) value];
        uint64_t v127 = [v126 BOOLValue];
        v128 = [v4 activeConfiguration];
        [v128 setPortraitEffectEnabled:v127];

        v129 = CMContinuityCaptureLog(2);
        if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
        {
          v130 = *(void **)(a1 + 40);
          v131 = [v4 activeConfiguration];
          int v132 = [v131 portraitEffectEnabled];
          *(double *)&v133 = COERCE_DOUBLE("Off");
          if (v132) {
            *(double *)&v133 = COERCE_DOUBLE("On");
          }
          *(_DWORD *)buf = 138543618;
          id v355 = v130;
          __int16 v356 = 2080;
          double v357 = *(double *)&v133;
          _os_log_impl(&dword_235FC2000, v129, OS_LOG_TYPE_DEFAULT, "%{public}@ PortraitEffectEnabled %s", buf, 0x16u);
        }
        id v7 = [v4 activeConfiguration];
        objc_msgSend(v4, "setPortraitEffect:", -[NSObject portraitEffectEnabled](v7, "portraitEffectEnabled"));
        goto LABEL_57;
      }
      goto LABEL_58;
    }
    v134 = [*(id *)(a1 + 32) name];
    int v135 = [v134 isEqualToString:@"VideoZoomFactor"];

    if (v135)
    {
      v136 = [v4 activeConfiguration];
      [v136 videoZoomFactor];
      double v138 = v137;
      v139 = [*(id *)(a1 + 32) value];
      [v139 doubleValue];
      double v141 = v140;

      if (v138 != v141)
      {
        v142 = [*(id *)(a1 + 32) value];
        [v142 doubleValue];
        double v144 = v143;
        v145 = [v4 activeConfiguration];
        [v145 setVideoZoomFactor:v144];

        v146 = CMContinuityCaptureLog(2);
        if (os_log_type_enabled(v146, OS_LOG_TYPE_DEFAULT))
        {
          v147 = *(void **)(a1 + 40);
          v148 = [v4 activeConfiguration];
          [v148 videoZoomFactor];
          *(_DWORD *)buf = 138543618;
          id v355 = v147;
          __int16 v356 = 2048;
          double v357 = v149;
          _os_log_impl(&dword_235FC2000, v146, OS_LOG_TYPE_DEFAULT, "%{public}@ VideoZoomFactor %.2f", buf, 0x16u);
        }
        id v7 = [v4 activeConfiguration];
        [v7 videoZoomFactor];
        objc_msgSend(v4, "setVideoZoomFactor:");
        goto LABEL_57;
      }
      goto LABEL_58;
    }
    v150 = [*(id *)(a1 + 32) name];
    int v151 = [v150 isEqualToString:@"StudioLightingEnabled"];

    if (v151)
    {
      v152 = [v4 activeConfiguration];
      int v153 = [v152 studioLightingEnabled];
      v154 = [*(id *)(a1 + 32) value];
      int v155 = [v154 BOOLValue];

      if (v153 != v155)
      {
        v156 = [*(id *)(a1 + 32) value];
        uint64_t v157 = [v156 BOOLValue];
        v158 = [v4 activeConfiguration];
        [v158 setStudioLightingEnabled:v157];

        v159 = CMContinuityCaptureLog(2);
        if (os_log_type_enabled(v159, OS_LOG_TYPE_DEFAULT))
        {
          v160 = *(void **)(a1 + 40);
          v161 = [v4 activeConfiguration];
          int v162 = [v161 studioLightingEnabled];
          *(double *)&v163 = COERCE_DOUBLE("Off");
          if (v162) {
            *(double *)&v163 = COERCE_DOUBLE("On");
          }
          *(_DWORD *)buf = 138543618;
          id v355 = v160;
          __int16 v356 = 2080;
          double v357 = *(double *)&v163;
          _os_log_impl(&dword_235FC2000, v159, OS_LOG_TYPE_DEFAULT, "%{public}@ StudioLightingEnabled %s", buf, 0x16u);
        }
        id v7 = [v4 activeConfiguration];
        objc_msgSend(v4, "setStudioLighting:", -[NSObject studioLightingEnabled](v7, "studioLightingEnabled"));
        goto LABEL_57;
      }
      goto LABEL_58;
    }
    v164 = [*(id *)(a1 + 32) name];
    int v165 = [v164 isEqualToString:@"ReactionEffectsEnabled"];

    if (v165)
    {
      v166 = [v4 activeConfiguration];
      int v167 = [v166 reactionEffectsEnabled];
      v168 = [*(id *)(a1 + 32) value];
      int v169 = [v168 BOOLValue];

      if (v167 != v169)
      {
        v170 = [*(id *)(a1 + 32) value];
        uint64_t v171 = [v170 BOOLValue];
        v172 = [v4 activeConfiguration];
        [v172 setReactionEffectsEnabled:v171];

        v173 = CMContinuityCaptureLog(2);
        if (os_log_type_enabled(v173, OS_LOG_TYPE_DEFAULT))
        {
          v174 = *(void **)(a1 + 40);
          v175 = [v4 activeConfiguration];
          int v176 = [v175 reactionEffectsEnabled];
          *(double *)&v177 = COERCE_DOUBLE("Off");
          if (v176) {
            *(double *)&v177 = COERCE_DOUBLE("On");
          }
          *(_DWORD *)buf = 138543618;
          id v355 = v174;
          __int16 v356 = 2080;
          double v357 = *(double *)&v177;
          _os_log_impl(&dword_235FC2000, v173, OS_LOG_TYPE_DEFAULT, "%{public}@ ReactionEffectsEnabled %s", buf, 0x16u);
        }
        id v7 = [v4 activeConfiguration];
        objc_msgSend(v4, "setReactionEffects:", -[NSObject reactionEffectsEnabled](v7, "reactionEffectsEnabled"));
        goto LABEL_57;
      }
      goto LABEL_58;
    }
    v178 = [*(id *)(a1 + 32) name];
    int v179 = [v178 isEqualToString:@"BackgroundReplacementEnabled"];

    if (v179)
    {
      v180 = [v4 activeConfiguration];
      int v181 = [v180 backgroundReplacementEnabled];
      v182 = [*(id *)(a1 + 32) value];
      int v183 = [v182 BOOLValue];

      if (v181 != v183)
      {
        v184 = [*(id *)(a1 + 32) value];
        uint64_t v185 = [v184 BOOLValue];
        v186 = [v4 activeConfiguration];
        [v186 setBackgroundReplacementEnabled:v185];

        v187 = CMContinuityCaptureLog(2);
        if (os_log_type_enabled(v187, OS_LOG_TYPE_DEFAULT))
        {
          v188 = *(void **)(a1 + 40);
          v189 = [v4 activeConfiguration];
          int v190 = [v189 backgroundReplacementEnabled];
          *(double *)&v191 = COERCE_DOUBLE("Off");
          if (v190) {
            *(double *)&v191 = COERCE_DOUBLE("On");
          }
          *(_DWORD *)buf = 138543618;
          id v355 = v188;
          __int16 v356 = 2080;
          double v357 = *(double *)&v191;
          _os_log_impl(&dword_235FC2000, v187, OS_LOG_TYPE_DEFAULT, "%{public}@ BackgroundReplacementEnabled %s", buf, 0x16u);
        }
        id v7 = [v4 activeConfiguration];
        objc_msgSend(v4, "setBackgroundReplacement:", -[NSObject backgroundReplacementEnabled](v7, "backgroundReplacementEnabled"));
        goto LABEL_57;
      }
      goto LABEL_58;
    }
    v192 = [*(id *)(a1 + 32) name];
    int v193 = [v192 isEqualToString:@"AsyncStillCaptureConfigurations"];

    v194 = *(void **)(a1 + 32);
    if (v193)
    {
      v195 = [v194 value];
      v196 = [v4 activeConfiguration];
      [v196 setAsyncStillCaptureConfigs:v195];

      v197 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v197, OS_LOG_TYPE_DEFAULT))
      {
        v198 = *(void **)(a1 + 40);
        v199 = [v4 activeConfiguration];
        double v200 = [v199 asyncStillCaptureConfigs];
        *(_DWORD *)buf = 138543618;
        id v355 = v198;
        __int16 v356 = 2112;
        double v357 = v200;
        _os_log_impl(&dword_235FC2000, v197, OS_LOG_TYPE_DEFAULT, "%{public}@ AsyncStillCaptureConfigs %@", buf, 0x16u);
      }
      [v4 _updatePhotoOutputConfigs];
      goto LABEL_58;
    }
    v201 = [v194 name];
    int v202 = [v201 isEqualToString:@"OverheadCameraMode"];

    if (v202)
    {
      v203 = [v4 activeConfiguration];
      uint64_t v204 = [v203 deskViewCameraMode];
      v205 = [*(id *)(a1 + 32) value];
      int v206 = [v205 unsignedIntValue];

      if (v204 != v206)
      {
        v207 = [*(id *)(a1 + 32) value];
        uint64_t v208 = [v207 unsignedIntValue];
        v209 = [v4 activeConfiguration];
        [v209 setDeskViewCameraMode:v208];

        v210 = CMContinuityCaptureLog(2);
        if (os_log_type_enabled(v210, OS_LOG_TYPE_DEFAULT))
        {
          v211 = *(void **)(a1 + 40);
          v212 = [v4 activeConfiguration];
          *(_DWORD *)buf = 138543618;
          id v355 = v211;
          __int16 v356 = 1024;
          LODWORD(v357) = [v212 deskViewCameraMode];
          _os_log_impl(&dword_235FC2000, v210, OS_LOG_TYPE_DEFAULT, "%{public}@ DeskViewCameraMode %u", buf, 0x12u);
        }
        if ([v4 entity] == 2)
        {
          v213 = [v4 companionDevice];
          int v214 = [v213 isStreamingOnSuperWide];

          if (v214)
          {
            v215 = [*(id *)(a1 + 32) value];
            uint64_t v216 = [v215 unsignedIntValue];
            v217 = [v4 companionDevice];
            [v217 setDeskViewCameraMode:v216];
          }
        }
        id v7 = [v4 activeConfiguration];
        objc_msgSend(v4, "setDeskViewCameraMode:", -[NSObject deskViewCameraMode](v7, "deskViewCameraMode"));
        goto LABEL_57;
      }
      goto LABEL_58;
    }
    v218 = [*(id *)(a1 + 32) name];
    int v219 = [v218 isEqualToString:@"StartPanningAtPoint"];

    if (v219)
    {
      point.CGFloat x = NAN;
      point.CGFloat y = NAN;
      CFDictionaryRef v220 = [*(id *)(a1 + 32) value];
      CGPointMakeWithDictionaryRepresentation(v220, &point);

      v221 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v221, OS_LOG_TYPE_DEFAULT))
      {
        v222 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138544130;
        id v355 = v222;
        __int16 v356 = 2080;
        double v357 = COERCE_DOUBLE("-[CMContinuityCaptureRemoteVideoDevice setValueForControl:completion:]_block_invoke");
        __int16 v358 = 2048;
        CGFloat x = point.x;
        __int16 v360 = 2048;
        CGFloat y = point.y;
        _os_log_impl(&dword_235FC2000, v221, OS_LOG_TYPE_DEFAULT, "%{public}@ (%s) StartPanningAtPoint {%.3f, %.3f}", buf, 0x2Au);
      }

      v223 = [v4 videoDevice];
      id v352 = 0;
      [v223 lockForConfiguration:&v352];
      id v7 = v352;

      if (v7)
      {
        v224 = CMContinuityCaptureLog(2);
        if (os_log_type_enabled(v224, OS_LOG_TYPE_ERROR)) {
          __70__CMContinuityCaptureRemoteVideoDevice_setValueForControl_completion___block_invoke_cold_1(a1, v4);
        }
        goto LABEL_143;
      }
      v247 = [v4 videoDevice];
      objc_msgSend(v247, "startPanningAtPoint:", point.x, point.y);
LABEL_142:

      v224 = [v4 videoDevice];
      [v224 unlockForConfiguration];
LABEL_143:

      goto LABEL_57;
    }
    v225 = [*(id *)(a1 + 32) name];
    int v226 = [v225 isEqualToString:@"PanWithTranslation"];

    if (v226)
    {
      point.CGFloat x = NAN;
      point.CGFloat y = NAN;
      CFDictionaryRef v227 = [*(id *)(a1 + 32) value];
      CGPointMakeWithDictionaryRepresentation(v227, &point);

      v228 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v228, OS_LOG_TYPE_DEFAULT))
      {
        v229 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138544130;
        id v355 = v229;
        __int16 v356 = 2080;
        double v357 = COERCE_DOUBLE("-[CMContinuityCaptureRemoteVideoDevice setValueForControl:completion:]_block_invoke");
        __int16 v358 = 2048;
        CGFloat x = point.x;
        __int16 v360 = 2048;
        CGFloat y = point.y;
        _os_log_impl(&dword_235FC2000, v228, OS_LOG_TYPE_DEFAULT, "%{public}@ (%s) PanWithTransaltion {%.3f, %.3f}", buf, 0x2Au);
      }

      v230 = [v4 videoDevice];
      id v351 = 0;
      [v230 lockForConfiguration:&v351];
      id v7 = v351;

      if (v7)
      {
        v224 = CMContinuityCaptureLog(2);
        if (os_log_type_enabled(v224, OS_LOG_TYPE_ERROR)) {
          __70__CMContinuityCaptureRemoteVideoDevice_setValueForControl_completion___block_invoke_cold_1(a1, v4);
        }
        goto LABEL_143;
      }
      v247 = [v4 videoDevice];
      objc_msgSend(v247, "panWithTranslation:", point.x, point.y);
      goto LABEL_142;
    }
    v231 = [*(id *)(a1 + 32) name];
    int v232 = [v231 isEqualToString:@"CMIOExtensionPropertyStreamFrameDuration"];

    if (v232)
    {
      v233 = [v4 activeConfiguration];
      int v234 = [v233 maxFrameRate];
      v235 = [*(id *)(a1 + 32) value];
      int v236 = [v235 unsignedIntValue];

      if (v234 == v236) {
        goto LABEL_58;
      }
      v237 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v237, OS_LOG_TYPE_DEFAULT))
      {
        v238 = *(void **)(a1 + 40);
        v239 = [*(id *)(a1 + 32) value];
        *(_DWORD *)buf = 138543618;
        id v355 = v238;
        __int16 v356 = 1024;
        LODWORD(v357) = [v239 unsignedIntValue];
        _os_log_impl(&dword_235FC2000, v237, OS_LOG_TYPE_DEFAULT, "%{public}@ MaxFrameRate %u", buf, 0x12u);
      }
      v240 = [*(id *)(a1 + 32) value];
      uint64_t v241 = [v240 unsignedIntValue];
      v242 = [v4 activeConfiguration];
      [v242 setMaxFrameRate:v241];

      v243 = [v4 compositeDelegate];
      double v244 = [v243 frameRateManager];

      objc_msgSend(*(id *)&v244, "reportStreamStatus:forDevice:", objc_msgSend(v4, "streaming"), v4);
      v245 = [*(id *)&v244 allowedFrameRateRangeForDevice:v4];
      v246 = [v245 maxFrameRate];
      objc_msgSend(v4, "setMaxFrameRate:", objc_msgSend(v246, "unsignedIntValue"));
LABEL_139:

      goto LABEL_140;
    }
    v248 = [*(id *)(a1 + 32) name];
    int v249 = [v248 isEqualToString:@"CMIOExtensionPropertyStreamMaxFrameDuration"];

    if (v249)
    {
      v250 = [v4 activeConfiguration];
      int v251 = [v250 minFrameRate];
      v252 = [*(id *)(a1 + 32) value];
      int v253 = [v252 unsignedIntValue];

      if (v251 == v253) {
        goto LABEL_58;
      }
      v254 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v254, OS_LOG_TYPE_DEFAULT))
      {
        v255 = *(void **)(a1 + 40);
        v256 = [*(id *)(a1 + 32) value];
        *(_DWORD *)buf = 138543618;
        id v355 = v255;
        __int16 v356 = 1024;
        LODWORD(v357) = [v256 unsignedIntValue];
        _os_log_impl(&dword_235FC2000, v254, OS_LOG_TYPE_DEFAULT, "%{public}@ MinFrameRate %u", buf, 0x12u);
      }
      v257 = [*(id *)(a1 + 32) value];
      uint64_t v258 = [v257 unsignedIntValue];
      v259 = [v4 activeConfiguration];
      [v259 setMinFrameRate:v258];

      v260 = [v4 compositeDelegate];
      double v244 = [v260 frameRateManager];

      objc_msgSend(*(id *)&v244, "reportStreamStatus:forDevice:", objc_msgSend(v4, "streaming"), v4);
      v245 = [*(id *)&v244 allowedFrameRateRangeForDevice:v4];
      v246 = [v245 minFrameRate];
      objc_msgSend(v4, "setMinFrameRate:", objc_msgSend(v246, "unsignedIntValue"));
      goto LABEL_139;
    }
    v261 = [*(id *)(a1 + 32) name];
    int v262 = [v261 isEqualToString:@"PerformOneShotFraming"];

    if (v262)
    {
      v263 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v263, OS_LOG_TYPE_DEFAULT))
      {
        v264 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        id v355 = v264;
        __int16 v356 = 2080;
        double v357 = COERCE_DOUBLE("-[CMContinuityCaptureRemoteVideoDevice setValueForControl:completion:]_block_invoke");
      }

      v265 = [v4 videoDevice];
      id v350 = 0;
      [v265 lockForConfiguration:&v350];
      id v15 = v350;

      if (v15)
      {
        v266 = CMContinuityCaptureLog(2);
        if (os_log_type_enabled(v266, OS_LOG_TYPE_ERROR)) {
          __70__CMContinuityCaptureRemoteVideoDevice_setValueForControl_completion___block_invoke_cold_3();
        }
LABEL_156:

        goto LABEL_60;
      }
      v289 = [v4 videoDevice];
      [v289 performOneShotFraming];
    }
    else
    {
      v267 = [*(id *)(a1 + 32) name];
      int v268 = [v267 isEqualToString:@"ResetFraming"];

      if (!v268)
      {
        v272 = [*(id *)(a1 + 32) name];
        int v273 = [v272 isEqualToString:@"PortraitEffectAperture"];

        if (v273)
        {
          v274 = [v4 activeConfiguration];
          [v274 portraitEffectAperture];
          float v276 = v275;
          v277 = [*(id *)(a1 + 32) value];
          [v277 floatValue];
          float v279 = v278;

          if (v276 != v279)
          {
            v280 = [*(id *)(a1 + 32) value];
            [v280 floatValue];
            int v282 = v281;
            v283 = [v4 activeConfiguration];
            LODWORD(v284) = v282;
            [v283 setPortraitEffectAperture:v284];

            v285 = CMContinuityCaptureLog(2);
            if (os_log_type_enabled(v285, OS_LOG_TYPE_DEFAULT))
            {
              v286 = *(void **)(a1 + 40);
              v287 = [v4 activeConfiguration];
              [v287 portraitEffectAperture];
              *(_DWORD *)buf = 138543618;
              id v355 = v286;
              __int16 v356 = 2048;
              double v357 = v288;
              _os_log_impl(&dword_235FC2000, v285, OS_LOG_TYPE_DEFAULT, "%{public}@ PortraitEffectAperture %f", buf, 0x16u);
            }
            id v7 = [*(id *)(a1 + 32) value];
            [v7 floatValue];
            objc_msgSend(v4, "setPortraitEffectAperture:");
            goto LABEL_57;
          }
          goto LABEL_58;
        }
        v290 = [*(id *)(a1 + 32) name];
        int v291 = [v290 isEqualToString:@"StudioLightingIntensity"];

        if (v291)
        {
          v292 = [v4 activeConfiguration];
          [v292 studioLightingIntensity];
          float v294 = v293;
          v295 = [*(id *)(a1 + 32) value];
          [v295 floatValue];
          float v297 = v296;

          if (v294 != v297)
          {
            v298 = [*(id *)(a1 + 32) value];
            [v298 floatValue];
            int v300 = v299;
            v301 = [v4 activeConfiguration];
            LODWORD(v302) = v300;
            [v301 setStudioLightingIntensity:v302];

            v303 = CMContinuityCaptureLog(2);
            if (os_log_type_enabled(v303, OS_LOG_TYPE_DEFAULT))
            {
              v304 = *(void **)(a1 + 40);
              v305 = [v4 activeConfiguration];
              [v305 studioLightingIntensity];
              *(_DWORD *)buf = 138543618;
              id v355 = v304;
              __int16 v356 = 2048;
              double v357 = v306;
              _os_log_impl(&dword_235FC2000, v303, OS_LOG_TYPE_DEFAULT, "%{public}@ StudioLightingIntensity %f", buf, 0x16u);
            }
            id v7 = [*(id *)(a1 + 32) value];
            [v7 floatValue];
            objc_msgSend(v4, "setStudioLightingIntensity:");
            goto LABEL_57;
          }
          goto LABEL_58;
        }
        v307 = [*(id *)(a1 + 32) name];
        int v308 = [v307 isEqualToString:@"GesturesEnabled"];

        if (v308)
        {
          v309 = [v4 activeConfiguration];
          float v310 = (float)[v309 reactionEffectGesturesEnabled];
          v311 = [*(id *)(a1 + 32) value];
          [v311 floatValue];
          float v313 = v312;

          if (v313 != v310)
          {
            v314 = [*(id *)(a1 + 32) value];
            [v314 floatValue];
            BOOL v316 = v315 != 0.0;
            v317 = [v4 activeConfiguration];
            [v317 setReactionEffectGesturesEnabled:v316];

            v318 = CMContinuityCaptureLog(2);
            if (os_log_type_enabled(v318, OS_LOG_TYPE_DEFAULT))
            {
              v319 = *(void **)(a1 + 40);
              v320 = [v4 activeConfiguration];
              *(_DWORD *)buf = 138543618;
              id v355 = v319;
              __int16 v356 = 1024;
              LODWORD(v357) = [v320 reactionEffectGesturesEnabled];
              _os_log_impl(&dword_235FC2000, v318, OS_LOG_TYPE_DEFAULT, "%{public}@ ReactionEffectGesturesEnabled %d", buf, 0x12u);
            }
            id v7 = [*(id *)(a1 + 32) value];
            [v7 floatValue];
            objc_msgSend(v4, "setReactionEffectGesturesEnabled:");
            goto LABEL_57;
          }
          goto LABEL_58;
        }
        v321 = [*(id *)(a1 + 32) name];
        int v322 = [v321 isEqualToString:@"BackgroundReplacementPixelBuffer"];

        v323 = *(void **)(a1 + 32);
        if (v322)
        {
          double v324 = [v323 value];

          v325 = [v4 activeConfiguration];
          uint64_t v326 = [v325 backgroundReplacementPixelBuffer];

          if (v326 != *(void *)&v324)
          {
            v327 = [v4 activeConfiguration];
            [v327 setBackgroundReplacementPixelBuffer:*(void *)&v324];

            v328 = CMContinuityCaptureLog(2);
            if (os_log_type_enabled(v328, OS_LOG_TYPE_DEFAULT))
            {
              v329 = *(void **)(a1 + 40);
              *(_DWORD *)buf = 138543618;
              id v355 = v329;
              __int16 v356 = 2112;
              double v357 = v324;
              _os_log_impl(&dword_235FC2000, v328, OS_LOG_TYPE_DEFAULT, "%{public}@ BackgroundReplacementPixelBuffer %@", buf, 0x16u);
            }

            [v4 setBackgroundReplacementPixelBuffer:*(void *)&v324];
          }
          goto LABEL_58;
        }
        v330 = [v323 name];
        int v331 = [v330 isEqualToString:@"CenterStageFieldOfViewRestrictedToWide"];

        if (v331)
        {
          v332 = CMContinuityCaptureLog(2);
          if (os_log_type_enabled(v332, OS_LOG_TYPE_DEFAULT))
          {
            v333 = *(void **)(a1 + 40);
            v334 = [*(id *)(a1 + 32) value];
            int v335 = [v334 BOOLValue];
            *(double *)&v336 = COERCE_DOUBLE(@"NO");
            if (v335) {
              *(double *)&v336 = COERCE_DOUBLE(@"YES");
            }
            *(_DWORD *)buf = 138543874;
            id v355 = v333;
            __int16 v356 = 2080;
            double v357 = COERCE_DOUBLE("-[CMContinuityCaptureRemoteVideoDevice setValueForControl:completion:]_block_invoke");
            __int16 v358 = 2112;
            CGFloat x = *(double *)&v336;
          }
          v337 = [*(id *)(a1 + 32) value];
          uint64_t v338 = [v337 BOOLValue];
          v339 = [v4 activeConfiguration];
          [v339 setCenterStageFieldOfViewRestrictedToWide:v338];

          v340 = [v4 activeConfiguration];
          LODWORD(v338) = [v340 isCenterStageForcefullyEnabled];

          if (v338)
          {
            [v4 _restoreStatesAfterForcefulCenterStageEnablementAndShouldReconfigureCaptureStack:0];
            v341 = [v4 companionDevice];
            [v341 _restoreStatesAfterForcefulCenterStageEnablementAndShouldReconfigureCaptureStack:0];
          }
          uint64_t v60 = [v4 activeConfiguration];
          [v60 setCenterStageEnabled:1];
          goto LABEL_56;
        }
        v342 = [*(id *)(a1 + 32) name];
        int v343 = [v342 isEqualToString:@"ManualFramingDeviceType"];

        if (!v343)
        {
          id v7 = CMContinuityCaptureLog(2);
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
          {
            double v348 = *(double *)(a1 + 32);
            v347 = *(void **)(a1 + 40);
            *(_DWORD *)buf = 138543618;
            id v355 = v347;
            __int16 v356 = 2114;
            double v357 = v348;
            _os_log_impl(&dword_235FC2000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ unhandled control %{public}@", buf, 0x16u);
          }
          goto LABEL_57;
        }
        v344 = [*(id *)(a1 + 32) value];
        +[CMContinuityCaptureConfiguration stringForManualFramingDeviceType:](CMContinuityCaptureConfiguration, "stringForManualFramingDeviceType:", [v344 integerValue]);
        double v244 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());

        v345 = CMContinuityCaptureLog(2);
        if (os_log_type_enabled(v345, OS_LOG_TYPE_DEFAULT))
        {
          id v346 = objc_loadWeakRetained(v2);
          *(_DWORD *)buf = 138543874;
          id v355 = v346;
          __int16 v356 = 2080;
          double v357 = COERCE_DOUBLE("-[CMContinuityCaptureRemoteVideoDevice setValueForControl:completion:]_block_invoke");
          __int16 v358 = 2112;
          CGFloat x = v244;
        }
        v245 = [*(id *)(a1 + 32) value];
        objc_msgSend(v4, "_updateManualFramingDeviceType:", objc_msgSend(v245, "integerValue"));
LABEL_140:

        goto LABEL_58;
      }
      v269 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v269, OS_LOG_TYPE_DEFAULT))
      {
        v270 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        id v355 = v270;
        __int16 v356 = 2080;
        double v357 = COERCE_DOUBLE("-[CMContinuityCaptureRemoteVideoDevice setValueForControl:completion:]_block_invoke");
      }

      v271 = [v4 videoDevice];
      id v349 = 0;
      [v271 lockForConfiguration:&v349];
      id v15 = v349;

      if (v15)
      {
        v266 = CMContinuityCaptureLog(2);
        if (os_log_type_enabled(v266, OS_LOG_TYPE_ERROR)) {
          __70__CMContinuityCaptureRemoteVideoDevice_setValueForControl_completion___block_invoke_cold_4();
        }
        goto LABEL_156;
      }
      v289 = [v4 videoDevice];
      [v289 resetFraming];
    }

    id v7 = [v4 videoDevice];
    [v7 unlockForConfiguration];
    goto LABEL_57;
  }
  double v108 = [v4 activeConfiguration];
  int v109 = [v108 suppressVideoEffects];
  double v110 = [*(id *)(a1 + 32) value];
  int v111 = [v110 BOOLValue];

  if (v109 != v111)
  {
    uint64_t v112 = [*(id *)(a1 + 32) value];
    uint64_t v113 = [v112 BOOLValue];
    uint64_t v114 = [v4 activeConfiguration];
    [v114 setSuppressVideoEffects:v113];

    uint64_t v115 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v115, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v116 = *(void **)(a1 + 40);
      uint64_t v117 = [v4 activeConfiguration];
      int v118 = [v117 suppressVideoEffects];
      *(double *)&int v119 = COERCE_DOUBLE("Off");
      if (v118) {
        *(double *)&int v119 = COERCE_DOUBLE("On");
      }
      *(_DWORD *)buf = 138543618;
      id v355 = v116;
      __int16 v356 = 2080;
      double v357 = *(double *)&v119;
      _os_log_impl(&dword_235FC2000, v115, OS_LOG_TYPE_DEFAULT, "%{public}@ SuppressVideoEffects %s", buf, 0x16u);
    }
    id v7 = [v4 activeConfiguration];
    objc_msgSend(v4, "setSuppressVideoEffects:", -[NSObject suppressVideoEffects](v7, "suppressVideoEffects"));
    goto LABEL_57;
  }
LABEL_58:
  double v102 = (void *)*((void *)v4 + 44);
  double v103 = [*(id *)(a1 + 32) name];
  double v104 = [v102 objectForKey:v103];

  if (v104)
  {
    __int16 v105 = (void *)*((void *)v4 + 44);
    id v15 = [*(id *)(a1 + 32) name];
    [v105 removeObjectForKey:v15];
LABEL_60:
  }
LABEL_61:
}

- (void)_updatePhotoOutputConfigs
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
  char v4 = [v3 asyncStillCaptureEnabled];

  if (v4)
  {
    id v9 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
    if ((int)[v9 maxPhotoQualityPrioritization] <= 0)
    {
      id v7 = v9;
    }
    else
    {
      id v5 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
      int v6 = [v5 maxPhotoQualityPrioritization];

      if (v6 > 3) {
        return;
      }
      id v10 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
      -[AVCapturePhotoOutput setMaxPhotoQualityPrioritization:](self->_photoOutput, "setMaxPhotoQualityPrioritization:", (int)[v10 maxPhotoQualityPrioritization]);
      id v7 = v10;
    }
  }
  else
  {
    int v8 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      double v12 = self;
      _os_log_impl(&dword_235FC2000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Skip updating photo output configs when asyncStillCaptureEnabled is Off", buf, 0xCu);
    }
  }
}

- (BOOL)_shouldPrintDroppedSampleBufferLog:(int64_t)a3
{
  return a3 < 5 || 0xEEEEEEEEEEEEEEEFLL * a3 < 0x1111111111111112;
}

- (void)captureOutput:(id)a3 didFinishProcessingPhoto:(id)a4 error:(id)a5
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(CMContinuityCaptureDeviceBase *)self compositeDelegate];
  double v12 = v11;
  if (v11)
  {
    uint64_t v13 = [v11 server];
    id v14 = self;
    objc_sync_enter(v14);
    photoRequests = v14->_photoRequests;
    double v16 = NSNumber;
    uint64_t v17 = [v9 resolvedSettings];
    id v18 = objc_msgSend(v16, "numberWithLongLong:", objc_msgSend(v17, "uniqueID"));
    int v19 = [(NSMutableDictionary *)photoRequests objectForKeyedSubscript:v18];
    id v20 = (void *)[v19 copy];

    objc_sync_exit(v14);
    if (v20)
    {
      [v20 setCaptureComplete:v10 == 0];
      [v20 setError:v10];
      id v21 = [v9 fileDataRepresentation];
      [v20 setImageFileData:v21];

      uint64_t v22 = [v9 resolvedSettings];
      unint64_t v23 = [v22 photoDimensions];

      uint64_t v24 = [v20 compressedFormat];
      uint64_t v25 = v20;
      double v26 = v14;
      id v27 = v9;
      int v28 = v12;
      id v29 = v10;
      uint64_t v30 = v13;
      id v31 = v8;
      int v32 = [v24 isEqualToString:*MEMORY[0x263EFA370]];

      BOOL v33 = v32 == 0;
      id v8 = v31;
      uint64_t v13 = v30;
      id v10 = v29;
      double v12 = v28;
      id v9 = v27;
      id v34 = v26;
      id v20 = v25;
      if (v33) {
        uint64_t v35 = 1785750887;
      }
      else {
        uint64_t v35 = 1752589105;
      }
      [v25 setImageCodecType:v35];
      [v25 setImageWidth:v23];
      [v25 setImageHeight:HIDWORD(v23)];
      unint64_t v36 = [v13 timeSyncClock];

      if (v36)
      {
        CMClockRef HostTimeClock = CMClockGetHostTimeClock();
        char v38 = [(CMContinuityCaptureRemoteVideoDevice *)v34 captureSession];
        uint64_t v39 = (const void *)[v38 synchronizationClock];

        memset(&buf, 170, sizeof(buf));
        if (v9) {
          [v9 timestamp];
        }
        else {
          memset(&buf, 0, sizeof(buf));
        }
        CMTime time = buf;
        memset(&v47, 170, sizeof(v47));
        CMSyncConvertTime(&v47, &time, v39, HostTimeClock);
        uint64_t v40 = [v13 timeSyncClock];
        CMTime time = v47;
        uint64_t v41 = [v40 domainTimeForMachAbsoluteTime:CMClockConvertHostTimeToSystemUnits(&time)];

        if (v41 != *MEMORY[0x263F7F270])
        {
          uint64_t v42 = [NSNumber numberWithUnsignedLongLong:v41];
          [v20 setNetworkTimestamp:v42];
        }
      }
      uint64_t v43 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v44 = [(CMContinuityCaptureDeviceBase *)v34 entity];
        LODWORD(buf.value) = 138543874;
        *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v34;
        LOWORD(buf.flags) = 2112;
        *(void *)((char *)&buf.flags + 2) = v20;
        HIWORD(buf.epoch) = 2048;
        uint64_t v49 = v44;
        _os_log_impl(&dword_235FC2000, v43, OS_LOG_TYPE_DEFAULT, "%{public}@ Captured photo for %@, entity:%ld", (uint8_t *)&buf, 0x20u);
      }

      int v45 = [(CMContinuityCaptureDeviceBase *)v34 transportDevice];
      [v45 didCaptureStillImage:v20 entity:[(CMContinuityCaptureDeviceBase *)v34 entity]];
    }
    else
    {
      int v45 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
        -[CMContinuityCaptureRemoteVideoDevice captureOutput:didFinishProcessingPhoto:error:]();
      }
    }
  }
}

- (void)captureOutput:(id)a3 didFinishCaptureForResolvedSettings:(id)a4 error:(id)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v9 uniqueID];
  double v12 = self;
  objc_sync_enter(v12);
  photoRequests = v12->_photoRequests;
  id v14 = [NSNumber numberWithLongLong:v11];
  id v15 = [(NSMutableDictionary *)photoRequests objectForKeyedSubscript:v14];
  double v16 = (void *)[v15 copy];

  uint64_t v17 = v12->_photoRequests;
  id v18 = [NSNumber numberWithLongLong:v11];
  [(NSMutableDictionary *)v17 setObject:0 forKeyedSubscript:v18];

  objc_sync_exit(v12);
  int v19 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 138543874;
    id v21 = v12;
    __int16 v22 = 2048;
    uint64_t v23 = v11;
    __int16 v24 = 2112;
    uint64_t v25 = v16;
    _os_log_impl(&dword_235FC2000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ DidFinishCapture for captureID:%lld. Removed %@ from photoRequests", (uint8_t *)&v20, 0x20u);
  }
}

- (void)captureOutput:(id)a3 didOutputSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v7 = [(CMContinuityCaptureDeviceBase *)self queue];
  dispatch_assert_queue_V2(v7);

  id v8 = [(CMContinuityCaptureDeviceBase *)self compositeDelegate];
  id v9 = v8;
  if (v8)
  {
    id v10 = [v8 server];
    CFStringRef v11 = (const __CFString *)*MEMORY[0x263F2C5D8];
    double v12 = CMGetAttachment(a4, (CFStringRef)*MEMORY[0x263F2C5D8], 0);
    if (!v12)
    {
      double v12 = [MEMORY[0x263EFF9A0] dictionary];
      CMSetAttachment(a4, v11, v12, 1u);
    }
    uint64_t v13 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v10, "currentSessionID"));
    [v12 setObject:v13 forKeyedSubscript:@"ContinuityCaptureRemoteSessionID"];

    id v14 = [v10 timeSyncClock];

    if (v14)
    {
      CMClockRef HostTimeClock = CMClockGetHostTimeClock();
      double v16 = [(CMContinuityCaptureRemoteVideoDevice *)self captureSession];
      uint64_t v17 = (const void *)[v16 synchronizationClock];

      memset(&v40, 170, sizeof(v40));
      CMSampleBufferGetPresentationTimeStamp(&v40, a4);
      memset(&v39, 170, sizeof(v39));
      CMTime time = v40;
      CMSyncConvertTime(&v39, &time, v17, HostTimeClock);
      id v18 = [v10 timeSyncClock];
      CMTime time = v39;
      uint64_t v19 = [v18 domainTimeForMachAbsoluteTime:CMClockConvertHostTimeToSystemUnits(&time)];

      int v20 = [v10 timeSyncClock];
      uint64_t v21 = [v20 grandMasterIdentifier];

      if (v19 != *MEMORY[0x263F7F270])
      {
        if (CMContinityCaptureDebugLogEnabled())
        {
          __int16 v22 = CMContinuityCaptureLog(2);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          {
            LODWORD(time.value) = 138543874;
            *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)self;
            LOWORD(time.flags) = 2048;
            *(void *)((char *)&time.flags + 2) = v19;
            HIWORD(time.epoch) = 2048;
            uint64_t v42 = v21;
            _os_log_debug_impl(&dword_235FC2000, v22, OS_LOG_TYPE_DEBUG, "%{public}@ networkTime %llx identity %llx", (uint8_t *)&time, 0x20u);
          }
        }
        uint64_t v23 = [NSNumber numberWithUnsignedLongLong:v19];
        [v12 setObject:v23 forKeyedSubscript:@"NetworkTime"];

        __int16 v24 = [NSNumber numberWithUnsignedLongLong:v21];
        [v12 setObject:v24 forKeyedSubscript:@"NetworkTimeClockIdentity"];
      }
    }
    if (self->_metadataOutput)
    {
      uint64_t v25 = CMGetAttachment(a4, (CFStringRef)*MEMORY[0x263F2C528], 0);
      if (v25)
      {
        uint64_t v26 = [MEMORY[0x263EFF9A0] dictionary];
        id v27 = [(AVCaptureMetadataOutput *)self->_metadataOutput availableMetadataObjectTypes];
        int v28 = [v27 containsObject:*MEMORY[0x263EF9F08]];

        if (v28)
        {
          uint64_t v29 = *MEMORY[0x263F2C958];
          uint64_t v30 = [v25 objectForKeyedSubscript:*MEMORY[0x263F2C958]];
          [v26 setObject:v30 forKeyedSubscript:v29];
        }
        id v31 = [(AVCaptureMetadataOutput *)self->_metadataOutput availableMetadataObjectTypes];
        int v32 = [v31 containsObject:*MEMORY[0x263EF9F10]];

        if (v32)
        {
          uint64_t v33 = *MEMORY[0x263F2C950];
          id v34 = [v25 objectForKeyedSubscript:*MEMORY[0x263F2C950]];
          [v26 setObject:v34 forKeyedSubscript:v33];
        }
        uint64_t v35 = [(AVCaptureMetadataOutput *)self->_metadataOutput availableMetadataObjectTypes];
        int v36 = [v35 containsObject:*MEMORY[0x263EF9F18]];

        if (v36)
        {
          uint64_t v37 = *MEMORY[0x263F2C960];
          char v38 = [v25 objectForKeyedSubscript:*MEMORY[0x263F2C960]];
          [v26 setObject:v38 forKeyedSubscript:v37];
        }
        [v12 setObject:v26 forKeyedSubscript:*MEMORY[0x263F2D008]];
        [v12 setObject:&unk_26E96A378 forKeyedSubscript:*MEMORY[0x263F2D010]];
      }
      CMGetAttachment(a4, (CFStringRef)*MEMORY[0x263F2C540], 0);
    }
    if (self->_captureStackActive && self->_propagateCaptureSessionRestartedAttachment)
    {
      self->_propagateCaptureSessionRestartedAttachment = 0;
      [v12 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"CaptureSessionRestarted"];
    }
    [(CMContinuityCaptureRemoteVideoDevice *)self dispatchFrame:a4 entity:[(CMContinuityCaptureDeviceBase *)self entity] completion:&__block_literal_global_103];
  }
}

- (void)captureOutput:(id)a3 didDropSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5
{
  p_unint64_t videoBufferDropCounter = &self->_videoBufferDropCounter;
  ++self->_videoBufferDropCounter;
  id v7 = [(CMContinuityCaptureDeviceBase *)self queue];
  dispatch_assert_queue_V2(v7);

  if ([(CMContinuityCaptureRemoteVideoDevice *)self _shouldPrintDroppedSampleBufferLog:*p_videoBufferDropCounter])
  {
    id v8 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CMContinuityCaptureRemoteVideoDevice captureOutput:didDropSampleBuffer:fromConnection:]();
    }
  }
}

- (void)_registerDockKitNotification
{
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_8_0(&dword_235FC2000, v0, v1, "Failed to soft link DockKit", v2, v3, v4, v5, v6);
}

void __68__CMContinuityCaptureRemoteVideoDevice__registerDockKitNotification__block_invoke(uint64_t a1, int a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v4 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = @"disabled";
      if (a2) {
        uint64_t v5 = @"enabled";
      }
      int v7 = 138412290;
      id v8 = v5;
      _os_log_impl(&dword_235FC2000, v4, OS_LOG_TYPE_DEFAULT, "[dock] DockKit device is %@. Restarting the stream.", (uint8_t *)&v7, 0xCu);
    }

    uint8_t v6 = [WeakRetained compositeDelegate];
    objc_msgSend(v6, "postEvent:entity:data:", @"kCMContinuityCaptureEventForceRestartStream", objc_msgSend(WeakRetained, "entity"), 0);
  }
}

- (BOOL)_dockKitNotificationAgentIsTracking
{
  return [(DKNotificationAgent *)self->_dockKitNotificationAgent isTracking];
}

- (BOOL)isDockedTrackingEnabled
{
  return [(AVCaptureDevice *)self->_videoDevice isDockedTrackingEnabled];
}

- (void)setDockedTrackingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x263EF8340];
  BOOL v5 = [(AVCaptureDevice *)self->_videoDevice lockForConfiguration:0];
  uint8_t v6 = CMContinuityCaptureLog(2);
  int v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = @"NO";
      if (v3) {
        id v8 = @"YES";
      }
      int v9 = 138543874;
      id v10 = self;
      __int16 v11 = 2080;
      double v12 = "-[CMContinuityCaptureRemoteVideoDevice setDockedTrackingEnabled:]";
      __int16 v13 = 2112;
      id v14 = v8;
      _os_log_impl(&dword_235FC2000, v7, OS_LOG_TYPE_DEFAULT, "[dock] %{public}@ %s docked tracking enabled: %@", (uint8_t *)&v9, 0x20u);
    }

    [(AVCaptureDevice *)self->_videoDevice setDockedTrackingEnabled:v3];
    [(AVCaptureDevice *)self->_videoDevice unlockForConfiguration];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[CMContinuityCaptureRemoteVideoDevice setDockedTrackingEnabled:]();
    }
  }
}

- (CMContinuityCaptureRemoteVideoDevice)companionDevice
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_companionDevice);
  return (CMContinuityCaptureRemoteVideoDevice *)WeakRetained;
}

- (void)setCompanionDevice:(id)a3
{
}

- (CMContinuityCaptureAVCaptureVideoSession)captureSession
{
  return (CMContinuityCaptureAVCaptureVideoSession *)objc_getProperty(self, a2, 400, 1);
}

- (BOOL)shouldRestoreCenterStageOnWideCamera
{
  return self->_shouldRestoreCenterStageOnWideCamera;
}

- (void)setShouldRestoreCenterStageOnWideCamera:(BOOL)a3
{
  self->_shouldRestoreCenterStageOnWideCamera = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_captureSession, 0);
  objc_destroyWeak((id *)&self->_companionDevice);
  objc_storeStrong((id *)&self->_dockKitNotificationAgent, 0);
  objc_storeStrong((id *)&self->_cameraCaptureStreamSessionID, 0);
  objc_storeStrong((id *)&self->_cmControlByNameWithPendingUpdates, 0);
  objc_storeStrong(&self->_stopCompletionBlock, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_videoDataConnection, 0);
  objc_storeStrong((id *)&self->_videoDataOutput, 0);
  objc_storeStrong((id *)&self->_videoDevice, 0);
  objc_storeStrong((id *)&self->_metadataOutput, 0);
  objc_storeStrong((id *)&self->_videoDataInput, 0);
  objc_storeStrong((id *)&self->_photoOutput, 0);
  objc_storeStrong((id *)&self->_cmControlByName, 0);
  objc_storeStrong((id *)&self->_avcStreamInput, 0);
  objc_storeStrong((id *)&self->_avcVideoStream, 0);
  objc_storeStrong((id *)&self->_photoRequests, 0);
}

- (void)setFaceDrivenAFActive:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_235FC2000, v0, v1, "%{public}@ No video device", v2, v3, v4, v5, v6);
}

- (void)setDeskViewCameraMode:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_235FC2000, v0, v1, "%{public}@ No video device or support for overhead mode", v2, v3, v4, v5, v6);
}

- (void)setVideoZoomFactor:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_3_0(&dword_235FC2000, v0, v1, "%{public}@ No video device or Center Stage enabled. Cannot set the zoomFactor to %f", v2);
}

- (void)setVideoZoomFactor:.cold.2()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_3_0(&dword_235FC2000, v0, v1, "%{public}@ Only deskcam device is streaming. Skip setting the zoomFactor to %f", v2);
}

- (void)setMaxFrameRate:(NSObject *)a3 .cold.2(uint64_t a1, id *a2, NSObject *a3)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v4 = [*a2 activeFormat];
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_3_0(&dword_235FC2000, a3, v5, "%{public}@ No video format for %@", v6);
}

- (void)setMaxFrameRate:.cold.3()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_16();
  _os_log_error_impl(&dword_235FC2000, v0, OS_LOG_TYPE_ERROR, "%{public}@ Invalid framerate %u", v1, 0x12u);
}

- (void)setCenterStageEnabled:.cold.2()
{
  OUTLINED_FUNCTION_10_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_235FC2000, v0, v1, "%{public}@ No active format for %{public}@");
}

- (void)setCenterStageRectOfInterest:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_235FC2000, v0, v1, "%{public}@ No video device or center stage is NOT enabled or failed to convert centerStageRectOfInterest dictionary to a CGRect.", v2, v3, v4, v5, v6);
}

- (void)_avfDeviceTypeForManualFramingDeviceType:.cold.1()
{
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_2(&dword_235FC2000, v0, v1, "%{public}@ unsupported device type: %ld");
}

- (void)connectionsForConfiguration:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_235FC2000, v0, v1, "%{public}@ Error creating device input: %@");
}

- (void)configureConnections
{
  OUTLINED_FUNCTION_14();
  uint64_t v2 = [*(id *)(v1 + 288) localizedName];
  uint64_t v3 = [v0 activeConfiguration];
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_6_0(&dword_235FC2000, v4, v5, " %@ Unable to find compatible device format for %@ configuration %@", v6, v7, v8, v9, v10);
}

- (void)_deviceFormat:(NSObject *)a3 isCompatibleWithConfiguration:requiringMultiCamSupport:minFrameRate:maxFrameRate:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  [a2 isPortraitEffectSupported];
  int v7 = 138544130;
  uint64_t v8 = a1;
  OUTLINED_FUNCTION_12();
  uint64_t v9 = "-[CMContinuityCaptureRemoteVideoDevice _deviceFormat:isCompatibleWithConfiguration:requiringMultiCamSupport:minFr"
       "ameRate:maxFrameRate:]";
  __int16 v10 = 2112;
  __int16 v11 = a2;
  __int16 v12 = 1024;
  int v13 = v6;
  _os_log_debug_impl(&dword_235FC2000, a3, OS_LOG_TYPE_DEBUG, "%{public}@ %s Available Format %@ pb supported %d", (uint8_t *)&v7, 0x26u);
}

- (void)startCameraCaptureStack:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_235FC2000, v0, v1, "%{public}@ Invalid connections", v2, v3, v4, v5, v6);
}

- (void)dispatchFrame:entity:completion:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_17();
  _os_log_debug_impl(&dword_235FC2000, v0, OS_LOG_TYPE_DEBUG, "%@ frame dispatch delta %lld", v1, 0x16u);
}

- (void)dispatchFrame:entity:completion:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_235FC2000, v0, v1, "%{public}@ pushSampleBuffer %@");
}

- (void)startAVConferenceStack:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_235FC2000, v0, v1, "%{public}@ AVCVideoInput Error %@");
}

- (void)startAVConferenceStack:.cold.2()
{
  OUTLINED_FUNCTION_10_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_2(&dword_235FC2000, v0, v1, "%{public}@ AVCVideoStream %p Invalid configuration");
}

void __70__CMContinuityCaptureRemoteVideoDevice_setValueForControl_completion___block_invoke_cold_1(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 videoDevice];
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_6_0(&dword_235FC2000, v3, v4, "%{public}@ (%s) Failed to lock device %@", v5, v6, v7, v8, 2u);
}

void __70__CMContinuityCaptureRemoteVideoDevice_setValueForControl_completion___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_8_0(&dword_235FC2000, v0, v1, "Failed to lock device when performing one-shot framing", v2, v3, v4, v5, v6);
}

void __70__CMContinuityCaptureRemoteVideoDevice_setValueForControl_completion___block_invoke_cold_4()
{
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_8_0(&dword_235FC2000, v0, v1, "Failed to lock device when resetting framing", v2, v3, v4, v5, v6);
}

- (void)captureOutput:didFinishProcessingPhoto:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_235FC2000, v0, v1, "%{public}@ captured photo %@ but couldn't find paired stillImageRequest from remote side.");
}

- (void)captureOutput:didDropSampleBuffer:fromConnection:.cold.1()
{
  OUTLINED_FUNCTION_10_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_2(&dword_235FC2000, v0, v1, "%{public}@ Dropped %llu buffers");
}

- (void)setDockedTrackingEnabled:.cold.1()
{
  OUTLINED_FUNCTION_14();
  os_log_t v1 = [v0 videoDevice];
  uint64_t v2 = [v1 localizedName];
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_6_0(&dword_235FC2000, v3, v4, "[dock] %{public}@ %s Failed to lock %@ for configuration", v5, v6, v7, v8, v9);
}

@end