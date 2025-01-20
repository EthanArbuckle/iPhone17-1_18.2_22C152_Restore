@interface ARDepthSensor
+ (void)registerSignPostForPointCloudData:(id)a3;
- (AVCapturePointCloudDataOutput)pointCloudOutput;
- (BOOL)canReconfigure:(id)a3;
- (NSString)description;
- (NSString)projectorMode;
- (id)configureCaptureSession;
- (id)prepareToStart;
- (unint64_t)providedDataTypes;
- (void)_configureProjectorModeForDevice:(id)a3;
- (void)pointCloudDataOutput:(id)a3 didDropPointCloudData:(id)a4 timestamp:(id *)a5 connection:(id)a6 reason:(int64_t)a7;
- (void)pointCloudDataOutput:(id)a3 didOutputPointCloudData:(id)a4 timestamp:(id *)a5 connection:(id)a6;
- (void)setPointCloudOutput:(id)a3;
- (void)setProjectorMode:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation ARDepthSensor

- (unint64_t)providedDataTypes
{
  return 0;
}

- (void)stop
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [(AVCapturePointCloudDataOutput *)self->_pointCloudOutput setDelegate:0 callbackQueue:0];
  v3 = _ARLogSensor();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    v6 = [(ARImageSensor *)self logPrefix];
    int v7 = 138543874;
    v8 = v5;
    __int16 v9 = 2048;
    v10 = self;
    __int16 v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_1B88A2000, v3, OS_LOG_TYPE_INFO, "%{public}@ <%p>: %@ ARDepthSensor stop complete", (uint8_t *)&v7, 0x20u);
  }
}

- (void)start
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v3 = _ARLogSensor();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    v6 = [(ARImageSensor *)self logPrefix];
    int v7 = 138543874;
    v8 = v5;
    __int16 v9 = 2048;
    v10 = self;
    __int16 v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_1B88A2000, v3, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: %@ start called on a child depth image sensor instead of parent image sensor", (uint8_t *)&v7, 0x20u);
  }
}

- (id)prepareToStart
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v3 = _ARLogSensor();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    v6 = [(ARImageSensor *)self logPrefix];
    *(_DWORD *)buf = 138543874;
    v24 = v5;
    __int16 v25 = 2048;
    v26 = self;
    __int16 v27 = 2112;
    v28 = v6;
    _os_log_impl(&dword_1B88A2000, v3, OS_LOG_TYPE_INFO, "%{public}@ <%p>: %@ preparing to start", buf, 0x20u);
  }
  int v7 = [(ARImageSensor *)self setActiveFormat];
  if (v7
    || ([(ARDepthSensor *)self configureCaptureSession],
        (int v7 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v8 = v7;
    goto LABEL_6;
  }
  v10 = [(ARImageSensor *)self captureDevice];
  id v20 = 0;
  int v11 = [v10 lockForConfiguration:&v20];
  id v8 = v20;
  if (v11)
  {
    [(ARImageSensor *)self configureFrameRateForDevice:v10];
    [(ARDepthSensor *)self _configureProjectorModeForDevice:v10];
    [v10 unlockForConfiguration];
    if (!v8) {
      goto LABEL_21;
    }
  }
  else
  {
    v12 = _ARLogSensor();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = (objc_class *)objc_opt_class();
      v14 = NSStringFromClass(v13);
      v15 = [(ARImageSensor *)self logPrefix];
      v16 = [v8 description];
      *(_DWORD *)buf = 138544130;
      v24 = v14;
      __int16 v25 = 2048;
      v26 = self;
      __int16 v27 = 2112;
      v28 = v15;
      __int16 v29 = 2112;
      v30 = v16;
      _os_log_impl(&dword_1B88A2000, v12, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: %@ Unable to lock capture device for configuration: %@", buf, 0x2Au);
    }
    if (v8)
    {
      uint64_t v21 = *MEMORY[0x1E4F28A50];
      id v22 = v8;
      v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    }
    else
    {
      v17 = (void *)MEMORY[0x1E4F1CC08];
    }
    uint64_t v18 = ARErrorWithCodeAndUserInfo(101, v17);

    if (v8) {
    id v8 = (id)v18;
    }
    if (!v18) {
      goto LABEL_21;
    }
  }
  id v19 = v8;
LABEL_21:

LABEL_6:
  return v8;
}

- (id)configureCaptureSession
{
  uint64_t v127 = *MEMORY[0x1E4F143B8];
  v3 = [(ARImageSensor *)self videoInput];

  if (v3)
  {
    v4 = [(ARImageSensor *)self videoInput];
    v5 = [v4 device];
    v6 = [(ARImageSensor *)self captureDevice];

    if (v5 != v6)
    {
      int v7 = _ARLogSensor();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        id v8 = (objc_class *)objc_opt_class();
        __int16 v9 = NSStringFromClass(v8);
        v10 = [(ARImageSensor *)self logPrefix];
        int v11 = [(ARImageSensor *)self videoInput];
        v12 = [v11 device];
        *(_DWORD *)buf = 138544130;
        v118 = v9;
        __int16 v119 = 2048;
        v120 = self;
        __int16 v121 = 2112;
        v122 = v10;
        __int16 v123 = 2112;
        Float64 v124 = *(double *)&v12;
        _os_log_impl(&dword_1B88A2000, v7, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: %@ Unsupported capture device: %@", buf, 0x2Au);
      }
LABEL_24:

      uint64_t v61 = 150;
      v62 = 0;
LABEL_25:
      uint64_t v31 = ARErrorWithCodeAndUserInfo(v61, v62);
      goto LABEL_48;
    }
    uint64_t v13 = [(ARImageSensor *)self videoInput];
    v14 = [v13 device];
    v15 = [v14 activeFormat];
    FourCharCode MediaSubType = CMFormatDescriptionGetMediaSubType((CMFormatDescriptionRef)[v15 formatDescription]);

    if (MediaSubType != 1785950320)
    {
      int v7 = _ARLogSensor();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v58 = (objc_class *)objc_opt_class();
        v59 = NSStringFromClass(v58);
        v60 = [(ARImageSensor *)self logPrefix];
        *(_DWORD *)buf = 138544130;
        v118 = v59;
        __int16 v119 = 2048;
        v120 = self;
        __int16 v121 = 2112;
        v122 = v60;
        __int16 v123 = 1024;
        LODWORD(v124) = MediaSubType;
        _os_log_impl(&dword_1B88A2000, v7, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: %@ Unsupported data format: %d", buf, 0x26u);
      }
      goto LABEL_24;
    }
  }
  v17 = [(ARImageSensor *)self videoInput];

  if (v17)
  {
    id v18 = 0;
  }
  else
  {
    id v32 = objc_alloc(MEMORY[0x1E4F16450]);
    v33 = [(ARImageSensor *)self captureDevice];
    id v113 = 0;
    v34 = (void *)[v32 initWithDevice:v33 error:&v113];
    id v18 = v113;
    [(ARImageSensor *)self setVideoInput:v34];

    v35 = [(ARImageSensor *)self videoInput];

    if (!v35)
    {
      v86 = _ARLogSensor();
      if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
      {
        v87 = (objc_class *)objc_opt_class();
        v88 = NSStringFromClass(v87);
        v89 = [(ARImageSensor *)self logPrefix];
        v90 = [v18 description];
        v91 = [(ARImageSensor *)self captureDevice];
        *(_DWORD *)buf = 138544386;
        v118 = v88;
        __int16 v119 = 2048;
        v120 = self;
        __int16 v121 = 2112;
        v122 = v89;
        __int16 v123 = 2112;
        Float64 v124 = *(double *)&v90;
        __int16 v125 = 2112;
        v126 = v91;
        _os_log_impl(&dword_1B88A2000, v86, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: %@ Error creating capture input for depth sensor: %@ (%@)", buf, 0x34u);
      }
      if (!v18)
      {
        v62 = (void *)MEMORY[0x1E4F1CC08];
        uint64_t v61 = 101;
        goto LABEL_25;
      }
      uint64_t v115 = *MEMORY[0x1E4F28A50];
      id v116 = v18;
      v92 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v116 forKeys:&v115 count:1];
      uint64_t v31 = ARErrorWithCodeAndUserInfo(101, v92);

      goto LABEL_41;
    }
    v36 = [(ARImageSensor *)self captureSession];
    v37 = [(ARImageSensor *)self videoInput];
    int v38 = [v36 canAddInput:v37];

    if (!v38)
    {
      v93 = _ARLogSensor();
      if (!os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
      {
LABEL_40:

        uint64_t v31 = ARErrorWithCodeAndUserInfo(102, 0);
LABEL_41:

        goto LABEL_48;
      }
      v98 = (objc_class *)objc_opt_class();
      v95 = NSStringFromClass(v98);
      v96 = [(ARImageSensor *)self logPrefix];
      *(_DWORD *)buf = 138543874;
      v118 = v95;
      __int16 v119 = 2048;
      v120 = self;
      __int16 v121 = 2112;
      v122 = v96;
      v97 = "%{public}@ <%p>: %@ Cannot add video data input to the capture session";
LABEL_39:
      _os_log_impl(&dword_1B88A2000, v93, OS_LOG_TYPE_ERROR, v97, buf, 0x20u);

      goto LABEL_40;
    }
    v39 = [(ARImageSensor *)self captureSession];
    v40 = [(ARImageSensor *)self videoInput];
    [v39 addInputWithNoConnections:v40];

    v41 = _ARLogSensor();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
    {
      v42 = (objc_class *)objc_opt_class();
      v43 = NSStringFromClass(v42);
      v44 = [(ARImageSensor *)self logPrefix];
      *(_DWORD *)buf = 138543874;
      v118 = v43;
      __int16 v119 = 2048;
      v120 = self;
      __int16 v121 = 2112;
      v122 = v44;
      _os_log_impl(&dword_1B88A2000, v41, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: %@ Added video data input to the capture session", buf, 0x20u);
    }
    v45 = [(ARImageSensor *)self settings];
    v46 = [v45 videoFormat];
    v47 = [v46 frameRatesByPowerUsage];
    v48 = [v47 objectAtIndexedSubscript:0];
    [v48 doubleValue];
    double v50 = v49;

    CMTimeMake(&v112, 1, (int)v50);
    v51 = [(ARImageSensor *)self videoInput];
    CMTime v111 = v112;
    [v51 setVideoMinFrameDurationOverride:&v111];

    v52 = _ARLogSensor();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
    {
      v53 = (objc_class *)objc_opt_class();
      v54 = NSStringFromClass(v53);
      v55 = [(ARImageSensor *)self logPrefix];
      v56 = [(ARImageSensor *)self videoInput];
      v57 = v56;
      if (v56) {
        [v56 videoMinFrameDurationOverride];
      }
      else {
        memset(&time, 0, sizeof(time));
      }
      Float64 Seconds = CMTimeGetSeconds(&time);
      *(_DWORD *)buf = 138544130;
      v118 = v54;
      __int16 v119 = 2048;
      v120 = self;
      __int16 v121 = 2112;
      v122 = v55;
      __int16 v123 = 2048;
      Float64 v124 = Seconds;
      _os_log_impl(&dword_1B88A2000, v52, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: %@ Video min frame duration override set to %f", buf, 0x2Au);
    }
  }
  if (!self->_pointCloudOutput)
  {
    id v19 = (AVCapturePointCloudDataOutput *)objc_opt_new();
    pointCloudOutput = self->_pointCloudOutput;
    self->_pointCloudOutput = v19;

    uint64_t v21 = [(ARImageSensor *)self captureSession];
    int v22 = [v21 canAddOutput:self->_pointCloudOutput];

    if (v22)
    {
      v23 = [(ARImageSensor *)self captureSession];
      [v23 addOutputWithNoConnections:self->_pointCloudOutput];

      v24 = _ARLogSensor();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        __int16 v25 = (objc_class *)objc_opt_class();
        v26 = NSStringFromClass(v25);
        __int16 v27 = [(ARImageSensor *)self logPrefix];
        *(_DWORD *)buf = 138543874;
        v118 = v26;
        __int16 v119 = 2048;
        v120 = self;
        __int16 v121 = 2112;
        v122 = v27;
        _os_log_impl(&dword_1B88A2000, v24, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: %@ Added video data output to the capture session", buf, 0x20u);
      }
      goto LABEL_13;
    }
    v93 = _ARLogSensor();
    if (!os_log_type_enabled(v93, OS_LOG_TYPE_ERROR)) {
      goto LABEL_40;
    }
    v94 = (objc_class *)objc_opt_class();
    v95 = NSStringFromClass(v94);
    v96 = [(ARImageSensor *)self logPrefix];
    *(_DWORD *)buf = 138543874;
    v118 = v95;
    __int16 v119 = 2048;
    v120 = self;
    __int16 v121 = 2112;
    v122 = v96;
    v97 = "%{public}@ <%p>: %@ Cannot add video data output to the capture session";
    goto LABEL_39;
  }
LABEL_13:
  v28 = [(ARImageSensor *)self videoConnection];

  if (v28)
  {
LABEL_14:
    [(AVCapturePointCloudDataOutput *)self->_pointCloudOutput setAlwaysDiscardsLatePointCloudData:1];
    __int16 v29 = self->_pointCloudOutput;
    v30 = [(ARImageSensor *)self captureQueue];
    [(AVCapturePointCloudDataOutput *)v29 setDelegate:self callbackQueue:v30];

    uint64_t v31 = 0;
    goto LABEL_48;
  }
  id v109 = v18;
  v63 = [(ARImageSensor *)self videoInput];
  uint64_t v64 = *MEMORY[0x1E4F15BF8];
  v65 = [(ARImageSensor *)self videoInput];
  v66 = [v65 device];
  v67 = [v66 deviceType];
  v68 = [(ARImageSensor *)self videoInput];
  v69 = [v68 device];
  v70 = objc_msgSend(v63, "portsWithMediaType:sourceDeviceType:sourceDevicePosition:", v64, v67, objc_msgSend(v69, "position"));
  v71 = [v70 firstObject];

  if (v71)
  {
    v72 = (void *)MEMORY[0x1E4F16410];
    v114 = v71;
    v73 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v114 count:1];
    v74 = [v72 connectionWithInputPorts:v73 output:self->_pointCloudOutput];
    [(ARImageSensor *)self setVideoConnection:v74];

    v75 = [(ARImageSensor *)self captureSession];
    v76 = [(ARImageSensor *)self videoConnection];
    char v77 = [v75 canAddConnection:v76];

    if (v77)
    {
      v78 = [(ARImageSensor *)self connections];
      v79 = [(ARImageSensor *)self videoConnection];
      [v78 addObject:v79];

      v80 = [(ARImageSensor *)self captureSession];
      v81 = [(ARImageSensor *)self videoConnection];
      [v80 addConnection:v81];

      v82 = _ARLogSensor();
      id v18 = v109;
      if (os_log_type_enabled(v82, OS_LOG_TYPE_DEBUG))
      {
        v83 = (objc_class *)objc_opt_class();
        v84 = NSStringFromClass(v83);
        v85 = [(ARImageSensor *)self logPrefix];
        *(_DWORD *)buf = 138543874;
        v118 = v84;
        __int16 v119 = 2048;
        v120 = self;
        __int16 v121 = 2112;
        v122 = v85;
        _os_log_impl(&dword_1B88A2000, v82, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: %@ Added video data connection to the capture session", buf, 0x20u);
      }
      goto LABEL_14;
    }
    v99 = _ARLogSensor();
    v103 = v109;
    if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR))
    {
      v104 = (objc_class *)objc_opt_class();
      v105 = NSStringFromClass(v104);
      v106 = [(ARImageSensor *)self logPrefix];
      *(_DWORD *)buf = 138543874;
      v118 = v105;
      __int16 v119 = 2048;
      v120 = self;
      __int16 v121 = 2112;
      v122 = v106;
      _os_log_impl(&dword_1B88A2000, v99, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: %@ Cannot add video connection to capture session", buf, 0x20u);
    }
  }
  else
  {
    v99 = _ARLogSensor();
    if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR))
    {
      v100 = (objc_class *)objc_opt_class();
      v101 = NSStringFromClass(v100);
      v102 = [(ARImageSensor *)self logPrefix];
      *(_DWORD *)buf = 138543874;
      v118 = v101;
      __int16 v119 = 2048;
      v120 = self;
      __int16 v121 = 2112;
      v122 = v102;
      _os_log_impl(&dword_1B88A2000, v99, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: %@ Cannot find a video port in the input added to the capture session", buf, 0x20u);
    }
    v103 = v109;
  }

  uint64_t v31 = ARErrorWithCodeAndUserInfo(102, 0);

LABEL_48:
  return v31;
}

- (BOOL)canReconfigure:(id)a3
{
  id v4 = a3;
  v5 = [(ARImageSensor *)self settings];
  char v6 = [v5 isEqual:v4];

  return v6;
}

- (void)_configureProjectorModeForDevice:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(ARImageSensor *)self settings];
  char v6 = [v5 timeOfFlightProjectorMode];

  int v7 = [(ARImageSensor *)self captureDevice];
  char v8 = [v7 isTimeOfFlightProjectorModeSupported:ARAVTimeOfFlightProjectorModeFromARTimeOfFlightProjectMode(v6)];

  if (v8)
  {
    __int16 v9 = v6;
  }
  else
  {
    v10 = _ARLogSensor();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v11 = (objc_class *)objc_opt_class();
      v12 = NSStringFromClass(v11);
      uint64_t v13 = [(ARImageSensor *)self logPrefix];
      int v23 = 138544386;
      id v24 = v12;
      __int16 v25 = 2048;
      v26 = self;
      __int16 v27 = 2112;
      id v28 = v13;
      __int16 v29 = 2112;
      v30 = v6;
      __int16 v31 = 2048;
      uint64_t v32 = [v4 timeOfFlightProjectorMode];
      _os_log_impl(&dword_1B88A2000, v10, OS_LOG_TYPE_INFO, "%{public}@ <%p>: %@ Requested projector mode %@ is not supported on this device. Current projector mode of the device: %ld.", (uint8_t *)&v23, 0x34u);
    }
    __int16 v9 = @"ARTimeOfFlightProjectorModeNormal";

    v14 = _ARLogSensor();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = (objc_class *)objc_opt_class();
      v16 = NSStringFromClass(v15);
      v17 = [(ARImageSensor *)self logPrefix];
      int v23 = 138544130;
      id v24 = v16;
      __int16 v25 = 2048;
      v26 = self;
      __int16 v27 = 2112;
      id v28 = v17;
      __int16 v29 = 2112;
      v30 = v9;
      _os_log_impl(&dword_1B88A2000, v14, OS_LOG_TYPE_INFO, "%{public}@ <%p>: %@ Falling back to projector mode %@.", (uint8_t *)&v23, 0x2Au);
    }
  }
  [v4 setTimeOfFlightProjectorMode:ARAVTimeOfFlightProjectorModeFromARTimeOfFlightProjectMode(v9)];
  id v18 = _ARLogSensor();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    id v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    id v21 = [(ARImageSensor *)self logPrefix];
    uint64_t v22 = [v4 timeOfFlightProjectorMode];
    int v23 = 138544386;
    id v24 = v20;
    __int16 v25 = 2048;
    v26 = self;
    __int16 v27 = 2112;
    id v28 = v21;
    __int16 v29 = 2112;
    v30 = v9;
    __int16 v31 = 2048;
    uint64_t v32 = v22;
    _os_log_impl(&dword_1B88A2000, v18, OS_LOG_TYPE_INFO, "%{public}@ <%p>: %@ ARDepthSensor projector mode set to %@(%ld)", (uint8_t *)&v23, 0x34u);
  }
}

- (void)pointCloudDataOutput:(id)a3 didOutputPointCloudData:(id)a4 timestamp:(id *)a5 connection:(id)a6
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  __int16 v9 = [ARPointCloudSensorData alloc];
  int64_t v10 = [(ARImageSensor *)self captureFramesPerSecond];
  int v11 = [(ARImageSensor *)self captureDevice];
  v12 = [(ARImageSensor *)self captureSession];
  uint64_t v13 = [(ARPointCloudSensorData *)v9 initWithPointCloudData:v8 captureFramePerSecond:v10 captureDevice:v11 captureSession:v12];

  if (v13)
  {
    v14 = [(ARImageSensor *)self dataSource];
    char v15 = objc_opt_respondsToSelector();

    if (v15)
    {
      extrinsicsMap = self->_extrinsicsMap;
      if (!extrinsicsMap)
      {
        v17 = [(ARImageSensor *)self dataSource];
        id v18 = [v17 captureDeviceTypeToExtrinsicsMapForImageSensor:self];
        id v19 = self->_extrinsicsMap;
        self->_extrinsicsMap = v18;

        extrinsicsMap = self->_extrinsicsMap;
      }
      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      id v20 = [(NSMutableDictionary *)extrinsicsMap allKeys];
      uint64_t v21 = [v20 countByEnumeratingWithState:&v46 objects:v50 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v47;
        while (2)
        {
          for (uint64_t i = 0; i != v22; ++i)
          {
            if (*(void *)v47 != v23) {
              objc_enumerationMutation(v20);
            }
            __int16 v25 = *(void **)(*((void *)&v46 + 1) + 8 * i);
            if (ARIsSupportedAVCaptureDeviceTypeForRearCameraBackdrop(v25))
            {
              __int16 v31 = [(NSMutableDictionary *)self->_extrinsicsMap objectForKeyedSubscript:v25];
              *(double *)v54.columns[0].i64 = ARMatrix4x3FromNSData(v31);
              [(ARPointCloudSensorData *)v13 setExtrinsicsToWideSensor:ARMatrix4x3Inverse(v54)];

              goto LABEL_17;
            }
          }
          uint64_t v22 = [v20 countByEnumeratingWithState:&v46 objects:v50 count:16];
          if (v22) {
            continue;
          }
          break;
        }
      }
LABEL_17:
    }
    [(ARPointCloudSensorData *)v13 extrinsicsToWideSensor];
    if (ARMatrix4x3IsZero(v32, v33, v34, v35))
    {
      v36 = _ARLogGeneral_0();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
      {
        v37 = (objc_class *)objc_opt_class();
        int v38 = NSStringFromClass(v37);
        LODWORD(buf.var0) = 138543618;
        *(int64_t *)((char *)&buf.var0 + 4) = (int64_t)v38;
        LOWORD(buf.var2) = 2048;
        *(void *)((char *)&buf.var2 + 2) = self;
        _os_log_impl(&dword_1B88A2000, v36, OS_LOG_TYPE_FAULT, "%{public}@ <%p>: Did not receive extrinsics from [AVCaptureDevice extrinsicMatrixFromDevice:sensor.captureDevice toDevice:depthSensor.captureDevice];",
          (uint8_t *)&buf,
          0x16u);
      }
    }
    v39 = [(ARImageSensor *)self bufferPopulationMonitor];
    uint64_t v40 = [v8 pointCloudDataBuffer];
    v41 = [(ARImageSensor *)self captureDevice];
    v42 = [v41 localizedName];
    $3CC8671D27C23BF42ADDB32F2B5E48AE buf = *a5;
    double Seconds = CMTimeGetSeconds((CMTime *)&buf);
    v44 = [(ARImageSensor *)self captureDevice];
    v45 = [v44 deviceType];
    [v39 trackDataBuffer:v40 withLabel:v42 timestamp:ARBufferPopulationMonitorSignpostTypeForCaptureDevice(v45) signpostType:Seconds];

    [(id)objc_opt_class() registerSignPostForPointCloudData:v13];
    v26 = [(ARImageSensor *)self delegate];
    [v26 sensor:self didOutputSensorData:v13];
  }
  else
  {
    v26 = _ARLogSensor();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      __int16 v27 = (objc_class *)objc_opt_class();
      id v28 = NSStringFromClass(v27);
      __int16 v29 = [(ARImageSensor *)self captureDevice];
      v30 = [v29 deviceType];
      LODWORD(buf.var0) = 138543874;
      *(int64_t *)((char *)&buf.var0 + 4) = (int64_t)v28;
      LOWORD(buf.var2) = 2048;
      *(void *)((char *)&buf.var2 + 2) = self;
      HIWORD(buf.var3) = 2112;
      v52 = v30;
      _os_log_impl(&dword_1B88A2000, v26, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Dropped a pointCloudDataOutput: %@", (uint8_t *)&buf, 0x20u);
    }
  }
}

- (void)pointCloudDataOutput:(id)a3 didDropPointCloudData:(id)a4 timestamp:(id *)a5 connection:(id)a6 reason:(int64_t)a7
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  int64_t v10 = _ARLogSensor();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    int v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    uint64_t v13 = [(ARImageSensor *)self logPrefix];
    $3CC8671D27C23BF42ADDB32F2B5E48AE v16 = *a5;
    double Seconds = CMTimeGetSeconds((CMTime *)&v16);
    if ((unint64_t)a7 > 3) {
      char v15 = @"Undefined";
    }
    else {
      char v15 = off_1E6185250[a7];
    }
    LODWORD(v16.var0) = 138544386;
    *(int64_t *)((char *)&v16.var0 + 4) = (int64_t)v12;
    LOWORD(v16.var2) = 2048;
    *(void *)((char *)&v16.var2 + 2) = self;
    HIWORD(v16.var3) = 2112;
    v17 = v13;
    __int16 v18 = 2048;
    double v19 = Seconds;
    __int16 v20 = 2112;
    uint64_t v21 = v15;
    _os_log_impl(&dword_1B88A2000, v10, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: %@ capture session dropped jasper frame: %f, %@", (uint8_t *)&v16, 0x34u);
  }
  kdebug_trace();
}

+ (void)registerSignPostForPointCloudData:(id)a3
{
  id v8 = a3;
  uint64_t v3 = [v8 pointCloud];
  if (v3)
  {
    id v4 = (void *)v3;
    v5 = [v8 pointCloud];
    int v6 = [v5 length];

    if (v6)
    {
      int v7 = [v8 pointCloud];
      [v7 bankIds];

      [v8 timestamp];
      kdebug_trace();
    }
  }
}

- (NSString)description
{
  uint64_t v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  int v6 = [v3 stringWithFormat:@"<%@: %p", v5, self];

  int v7 = [(ARImageSensor *)self captureDevice];
  [v6 appendFormat:@" %@\n", v7];

  id v8 = [(ARImageSensor *)self captureDevice];
  unint64_t v9 = [v8 timeOfFlightProjectorMode];
  if (v9 > 6) {
    int64_t v10 = @"Undefined";
  }
  else {
    int64_t v10 = off_1E6185270[v9];
  }
  [v6 appendFormat:@"ProjectorMode: %@\n", v10];

  int v11 = [(ARImageSensor *)self captureDevice];
  objc_msgSend(v6, "appendFormat:", @"BankCount: %li\n", objc_msgSend(v11, "timeOfFlightBankCount"));

  v12 = [(ARImageSensor *)self settings];
  uint64_t v13 = [v12 description];
  v14 = [v13 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n\t\t"];
  [v6 appendFormat:@"%@\n", v14];

  return (NSString *)v6;
}

- (NSString)projectorMode
{
  return self->_projectorMode;
}

- (void)setProjectorMode:(id)a3
{
}

- (AVCapturePointCloudDataOutput)pointCloudOutput
{
  return self->_pointCloudOutput;
}

- (void)setPointCloudOutput:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pointCloudOutput, 0);
  objc_storeStrong((id *)&self->_projectorMode, 0);
  objc_storeStrong((id *)&self->_extrinsicsMap, 0);
}

@end