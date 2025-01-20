@interface CMContinuityCaptureRemoteDeskcamVideoDevice
- (BOOL)_companionConnectionsRequired;
- (BOOL)_shouldOnlyDisableVideoConnection;
- (BOOL)configureConnections;
- (id)connectionsForConfiguration:(id)a3;
- (void)_forcefullyEnableCenterStageOnSuperWide;
- (void)_restoreStatesAfterForcefulCenterStageEnablementAndShouldReconfigureCaptureStack:(BOOL)a3;
- (void)configureConnections;
@end

@implementation CMContinuityCaptureRemoteDeskcamVideoDevice

- (id)connectionsForConfiguration:(id)a3
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  v6 = [(CMContinuityCaptureDeviceBase *)self queue];
  dispatch_assert_queue_V2(v6);

  v7 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v50 = self;
    __int16 v51 = 2080;
    v52 = "-[CMContinuityCaptureRemoteDeskcamVideoDevice connectionsForConfiguration:]";
    __int16 v53 = 2112;
    id v54 = v4;
    _os_log_impl(&dword_235FC2000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ %s %@", buf, 0x20u);
  }

  v8 = [(CMContinuityCaptureRemoteVideoDevice *)self connections];

  if (!v8)
  {
    uint64_t v12 = CMContinuityCaptureDevicePosition();
    uint64_t v13 = *MEMORY[0x263EF9680];
    uint64_t v14 = *MEMORY[0x263EF9D48];
    v15 = [MEMORY[0x263EFA598] defaultDeviceWithDeviceType:*MEMORY[0x263EF9680] mediaType:*MEMORY[0x263EF9D48] position:v12];
    [(CMContinuityCaptureRemoteVideoDevice *)self setVideoDevice:v15];

    v16 = [(CMContinuityCaptureRemoteVideoDevice *)self videoDevice];

    if (v16)
    {
      v17 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
      -[CMContinuityCaptureRemoteVideoDevice setDeskViewCameraMode:](self, "setDeskViewCameraMode:", [v17 deskViewCameraMode]);

      v18 = [(CMContinuityCaptureRemoteVideoDevice *)self companionDevice];
      char v19 = [v18 streaming];

      if ((v19 & 1) == 0)
      {
        [MEMORY[0x263EFA598] setCenterStageControlMode:1];
        [MEMORY[0x263EFA598] setCenterStageEnabled:0];
      }
      [(CMContinuityCaptureRemoteVideoDevice *)self setFaceDrivenAFActive:0];
      v20 = (void *)MEMORY[0x263EFA5B8];
      v21 = [(CMContinuityCaptureRemoteVideoDevice *)self videoDevice];
      id v47 = 0;
      v22 = [v20 deviceInputWithDevice:v21 error:&v47];
      id v23 = v47;
      [(CMContinuityCaptureRemoteVideoDevice *)self setVideoDataInput:v22];

      v24 = [(CMContinuityCaptureRemoteVideoDevice *)self videoDataInput];

      if (v24 && !v23)
      {
        id v25 = objc_alloc_init(MEMORY[0x263EFA6A0]);
        [(CMContinuityCaptureRemoteVideoDevice *)self setVideoDataOutput:v25];

        v26 = [(CMContinuityCaptureRemoteVideoDevice *)self videoDataOutput];
        v27 = [(CMContinuityCaptureDeviceBase *)self queue];
        [v26 setSampleBufferDelegate:self queue:v27];

        v28 = [(CMContinuityCaptureRemoteVideoDevice *)self videoDataInput];
        v29 = [v28 portsWithMediaType:v14 sourceDeviceType:v13 sourceDevicePosition:v12];

        if ([v29 count])
        {
          v30 = (void *)MEMORY[0x263EFA560];
          v31 = [v29 firstObject];
          v48 = v31;
          v32 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v48 count:1];
          v33 = [(CMContinuityCaptureRemoteVideoDevice *)self videoDataOutput];
          v34 = [v30 connectionWithInputPorts:v32 output:v33];
          [(CMContinuityCaptureRemoteVideoDevice *)self setVideoDataConnection:v34];

          v35 = [(CMContinuityCaptureRemoteVideoDevice *)self videoDataConnection];
          [v5 addObject:v35];

          uint64_t v36 = [v4 entity];
          BOOL v37 = v36 == [(CMContinuityCaptureDeviceBase *)self entity];
          v38 = [(CMContinuityCaptureRemoteVideoDevice *)self videoDataConnection];
          [v38 setEnabled:v37];

          v39 = CMContinuityCaptureLog(2);
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            v40 = [(CMContinuityCaptureRemoteVideoDevice *)self videoDataConnection];
            int v41 = [v40 isEnabled];
            *(_DWORD *)buf = 138543618;
            v50 = self;
            __int16 v51 = 1024;
            LODWORD(v52) = v41;
            _os_log_impl(&dword_235FC2000, v39, OS_LOG_TYPE_DEFAULT, "%{public}@ VDO connection enabled %d", buf, 0x12u);
          }
          [(CMContinuityCaptureRemoteVideoDevice *)self setConnections:v5];
          id v23 = 0;
          v42 = v5;
        }
        else
        {
          v46 = CMContinuityCaptureLog(2);
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
            -[CMContinuityCaptureRemoteDeskcamVideoDevice connectionsForConfiguration:]();
          }

          v42 = 0;
          id v23 = 0;
        }
        goto LABEL_16;
      }
      v45 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
        -[CMContinuityCaptureRemoteDeskcamVideoDevice connectionsForConfiguration:]();
      }

      v42 = 0;
    }
    else
    {
      v44 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
        -[CMContinuityCaptureRemoteDeskcamVideoDevice connectionsForConfiguration:]();
      }

      v42 = 0;
      id v23 = 0;
    }
    v29 = 0;
LABEL_16:
    id v11 = v42;

    goto LABEL_17;
  }
  v9 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = [(CMContinuityCaptureRemoteVideoDevice *)self connections];
    *(_DWORD *)buf = 138543618;
    v50 = self;
    __int16 v51 = 2112;
    v52 = v10;
    _os_log_impl(&dword_235FC2000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ returning already created connections %@", buf, 0x16u);
  }
  id v11 = [(CMContinuityCaptureRemoteVideoDevice *)self connections];
LABEL_17:

  return v11;
}

- (BOOL)configureConnections
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  v3 = [(CMContinuityCaptureDeviceBase *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(CMContinuityCaptureRemoteVideoDevice *)self companionDevice];
  [v4 setMinFrameDurationOverrideIfApplicable];

  id v5 = [(CMContinuityCaptureRemoteVideoDevice *)self companionDevice];
  int v6 = [v5 isStreamingOnSuperWide];

  if (v6)
  {
    v7 = [(CMContinuityCaptureRemoteVideoDevice *)self companionDevice];
    [v7 setFaceDrivenAFActive:0];
  }
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v36 = self;
  v8 = [(CMContinuityCaptureRemoteVideoDevice *)self videoDevice];
  v9 = [v8 formats];

  id obj = v9;
  uint64_t v35 = [v9 countByEnumeratingWithState:&v38 objects:v48 count:16];
  if (v35)
  {
    uint64_t v34 = *(void *)v39;
LABEL_5:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v39 != v34) {
        objc_enumerationMutation(obj);
      }
      id v11 = *(void **)(*((void *)&v38 + 1) + 8 * v10);
      BOOL v37 = [(CMContinuityCaptureDeviceBase *)v36 activeConfiguration];
      uint64_t v12 = [(CMContinuityCaptureRemoteVideoDevice *)v36 captureSession];
      uint64_t v13 = [v12 isMulticamSession];
      uint64_t v14 = [(CMContinuityCaptureDeviceBase *)v36 activeConfiguration];
      v15 = [v14 format];
      uint64_t v16 = [v15 minFrameRate];
      v17 = [(CMContinuityCaptureDeviceBase *)v36 activeConfiguration];
      v18 = [v17 format];
      LOBYTE(v13) = -[CMContinuityCaptureRemoteVideoDevice _deviceFormat:isCompatibleWithConfiguration:requiringMultiCamSupport:minFrameRate:maxFrameRate:](v36, "_deviceFormat:isCompatibleWithConfiguration:requiringMultiCamSupport:minFrameRate:maxFrameRate:", v11, v37, v13, v16, [v18 maxFrameRate]);

      if (v13) {
        break;
      }
      if (v35 == ++v10)
      {
        uint64_t v35 = [obj countByEnumeratingWithState:&v38 objects:v48 count:16];
        if (v35) {
          goto LABEL_5;
        }
        goto LABEL_11;
      }
    }
    id v19 = v11;

    if (!v19) {
      goto LABEL_16;
    }
    v20 = CMContinuityCaptureLog(2);
    v21 = v36;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v22 = [(CMContinuityCaptureRemoteVideoDevice *)v36 videoDevice];
      id v23 = [v22 localizedName];
      *(_DWORD *)buf = 138543874;
      v43 = v36;
      __int16 v44 = 2112;
      v45 = v23;
      __int16 v46 = 2112;
      id v47 = v19;
      _os_log_impl(&dword_235FC2000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ Setting format for %@: %@", buf, 0x20u);
    }
    [(CMContinuityCaptureRemoteVideoDevice *)v36 setFormat:v19];
  }
  else
  {
LABEL_11:

LABEL_16:
    v24 = CMContinuityCaptureLog(2);
    v21 = v36;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[CMContinuityCaptureRemoteDeskcamVideoDevice configureConnections]();
    }

    id v19 = 0;
  }
  if ([(CMContinuityCaptureRemoteVideoDevice *)v21 deskViewCameraMode])
  {
    id v25 = [(CMContinuityCaptureDeviceBase *)v21 activeConfiguration];
    -[CMContinuityCaptureRemoteVideoDevice setDeskViewCameraMode:](v21, "setDeskViewCameraMode:", [v25 deskViewCameraMode]);

    v26 = [(CMContinuityCaptureRemoteVideoDevice *)v21 companionDevice];
    int v27 = [v26 isStreamingOnSuperWide];

    if (v27)
    {
      v28 = [(CMContinuityCaptureDeviceBase *)v21 activeConfiguration];
      uint64_t v29 = [v28 deskViewCameraMode];
      v30 = [(CMContinuityCaptureRemoteVideoDevice *)v21 companionDevice];
      [v30 setDeskViewCameraMode:v29];
    }
  }
  v31 = [(CMContinuityCaptureRemoteVideoDevice *)v21 videoDataConnection];
  [v31 setEnabled:1];

  return 1;
}

- (BOOL)_shouldOnlyDisableVideoConnection
{
  v3 = [(CMContinuityCaptureDeviceBase *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(CMContinuityCaptureRemoteVideoDevice *)self companionDevice];
  int v5 = [v4 streaming];

  if (v5)
  {
    BOOL manualFramingFeatureFlagEnabled = self->super._manualFramingFeatureFlagEnabled;
    v7 = [(CMContinuityCaptureRemoteVideoDevice *)self companionDevice];
    int v8 = [v7 centerStageEnabled];

    if (manualFramingFeatureFlagEnabled)
    {
      v9 = [(CMContinuityCaptureRemoteVideoDevice *)self companionDevice];
      uint64_t v10 = [v9 activeConfiguration];
      id v11 = v10;
      if (v8) {
        int v8 = [v10 centerStageFieldOfViewRestrictedToWide] ^ 1;
      }
      else {
        int v8 = [v10 manualFramingDeviceType] == 2;
      }
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }
  return v8;
}

- (BOOL)_companionConnectionsRequired
{
  id v4 = [(CMContinuityCaptureDeviceBase *)self queue];
  dispatch_assert_queue_V2(v4);

  int v5 = [(CMContinuityCaptureRemoteVideoDevice *)self companionDevice];
  if ([v5 streaming])
  {
    LOBYTE(v9) = 0;
    goto LABEL_9;
  }
  int v6 = [v5 activeConfiguration];
  char v7 = [v6 centerStageEnabled];
  if ((v7 & 1) != 0
    || ([v5 activeConfiguration],
        v2 = objc_claimAutoreleasedReturnValue(),
        [v2 isCenterStageForcefullyEnabled]))
  {
    int v8 = [v5 activeConfiguration];
    int v9 = [v8 centerStageFieldOfViewRestrictedToWide] ^ 1;

    if (v7) {
      goto LABEL_8;
    }
  }
  else
  {
    LOBYTE(v9) = 0;
  }

LABEL_8:
LABEL_9:

  return v9;
}

- (void)_forcefullyEnableCenterStageOnSuperWide
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  v3 = [(CMContinuityCaptureRemoteVideoDevice *)self companionDevice];
  int v4 = [v3 isDockedTrackingEnabled];

  int v5 = CMContinuityCaptureLog(2);
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      LOWORD(v26) = 0;
      _os_log_impl(&dword_235FC2000, v5, OS_LOG_TYPE_DEFAULT, "Docked tracking is enabled, do not forcefully enable Center Stage as requested", (uint8_t *)&v26, 2u);
    }
  }
  else
  {
    if (v6)
    {
      int v26 = 138543618;
      int v27 = self;
      __int16 v28 = 2080;
      uint64_t v29 = "-[CMContinuityCaptureRemoteDeskcamVideoDevice _forcefullyEnableCenterStageOnSuperWide]";
      _os_log_impl(&dword_235FC2000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ %s [forceful CS enablement] Forcefully enable Center Stage on the default video camera as requested", (uint8_t *)&v26, 0x16u);
    }

    int v5 = [(CMContinuityCaptureRemoteVideoDevice *)self companionDevice];
    char v7 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
    uint64_t v8 = [v7 forcefulCenterStageEnablementType];
    int v9 = [v5 activeConfiguration];
    [v9 setForcefulCenterStageEnablementType:v8];

    LODWORD(v8) = [v5 centerStageEnabled];
    uint64_t v10 = CMContinuityCaptureLog(2);
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v11)
      {
        int v26 = 138543618;
        int v27 = self;
        __int16 v28 = 2080;
        uint64_t v29 = "-[CMContinuityCaptureRemoteDeskcamVideoDevice _forcefullyEnableCenterStageOnSuperWide]";
        _os_log_impl(&dword_235FC2000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ %s [forceful CS enablement] Already running Center Stage on the wide, switching to the super wide", (uint8_t *)&v26, 0x16u);
      }

      [v5 setShouldRestoreCenterStageOnWideCamera:1];
      uint64_t v12 = [v5 activeConfiguration];
      [v12 setCenterStageFieldOfViewRestrictedToWide:0];

LABEL_18:
      v21 = [v5 captureSession];
      v22 = [v5 connections];
      [v21 removeConnections:v22];

      id v23 = [v5 captureSession];
      v24 = [v5 activeConfiguration];
      id v25 = [v5 connectionsForConfiguration:v24];
      [v23 addConnections:v25];

      goto LABEL_22;
    }
    if (v11)
    {
      int v26 = 138543618;
      int v27 = self;
      __int16 v28 = 2080;
      uint64_t v29 = "-[CMContinuityCaptureRemoteDeskcamVideoDevice _forcefullyEnableCenterStageOnSuperWide]";
      _os_log_impl(&dword_235FC2000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ %s [forceful CS enablement] Switching from Manual Framing to Center Stage", (uint8_t *)&v26, 0x16u);
    }

    uint64_t v13 = [v5 activeConfiguration];
    int v14 = [v13 centerStageFieldOfViewRestrictedToWide];

    if (v14)
    {
      v15 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v26 = 138543618;
        int v27 = self;
        __int16 v28 = 2080;
        uint64_t v29 = "-[CMContinuityCaptureRemoteDeskcamVideoDevice _forcefullyEnableCenterStageOnSuperWide]";
        _os_log_impl(&dword_235FC2000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ %s [forceful CS enablement] Center Stage is set to run on the back wide. Switching to the super wide", (uint8_t *)&v26, 0x16u);
      }

      [v5 setShouldRestoreCenterStageOnWideCamera:1];
      uint64_t v16 = [v5 activeConfiguration];
      [v16 setCenterStageFieldOfViewRestrictedToWide:0];
    }
    v17 = [v5 activeConfiguration];
    uint64_t v18 = [v17 manualFramingDeviceType];

    id v19 = CMContinuityCaptureLog(2);
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
    if (v18 == 1)
    {
      if (v20)
      {
        int v26 = 138543618;
        int v27 = self;
        __int16 v28 = 2080;
        uint64_t v29 = "-[CMContinuityCaptureRemoteDeskcamVideoDevice _forcefullyEnableCenterStageOnSuperWide]";
        _os_log_impl(&dword_235FC2000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ %s [forceful CS enablement] Manual Framing on the back wide. Switching to the super wide", (uint8_t *)&v26, 0x16u);
      }

      goto LABEL_18;
    }
    if (v20)
    {
      int v26 = 138543618;
      int v27 = self;
      __int16 v28 = 2080;
      uint64_t v29 = "-[CMContinuityCaptureRemoteDeskcamVideoDevice _forcefullyEnableCenterStageOnSuperWide]";
      _os_log_impl(&dword_235FC2000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ %s [forceful CS enablement] Manual Framing on the super wide. Turning on Center Stage", (uint8_t *)&v26, 0x16u);
    }

    [v5 setCenterStageEnabled:1];
  }
LABEL_22:
}

- (void)_restoreStatesAfterForcefulCenterStageEnablementAndShouldReconfigureCaptureStack:(BOOL)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  int v4 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
  int v5 = [v4 isCenterStageForcefullyEnabled];

  if (v5)
  {
    BOOL v6 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138543618;
      int v9 = self;
      __int16 v10 = 2080;
      BOOL v11 = "-[CMContinuityCaptureRemoteDeskcamVideoDevice _restoreStatesAfterForcefulCenterStageEnablementAndShouldRecon"
            "figureCaptureStack:]";
      _os_log_impl(&dword_235FC2000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ %s [forceful CS enablement] Restoring states while exiting forcefully enabled Center Stage on super wide", (uint8_t *)&v8, 0x16u);
    }

    char v7 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
    [v7 setForcefulCenterStageEnablementType:0];
  }
}

- (void)connectionsForConfiguration:.cold.1()
{
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_8_0(&dword_235FC2000, v0, v1, "Desk View camera is required but not found", v2, v3, v4, v5, v6);
}

- (void)connectionsForConfiguration:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_235FC2000, v0, v1, "%@ Failed to create input for the Desk View camera %{public}@");
}

- (void)connectionsForConfiguration:.cold.3()
{
  OUTLINED_FUNCTION_14();
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = [v1 videoDataInput];
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_3_0(&dword_235FC2000, v0, v3, "%{public}@ Failed to find the Desk View camera input ports for input %@", v4);
}

- (void)configureConnections
{
  OUTLINED_FUNCTION_14();
  uint64_t v2 = [v1 videoDevice];
  uint64_t v3 = [v2 localizedName];
  uint64_t v4 = [v0 activeConfiguration];
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_6_0(&dword_235FC2000, v5, v6, "%{public}@ Unable to find compatible device format for %@ configuration %@", v7, v8, v9, v10, v11);
}

@end