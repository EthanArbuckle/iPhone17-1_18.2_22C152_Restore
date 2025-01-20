@interface ARWorldTrackingOptions
- (ARImageSensorSettings)imageSensorSettings;
- (ARImageSensorSettings)imageSensorSettingsForUltraWide;
- (ARSceneReconstructionOptions)sceneReconstructionOptions;
- (ARWorldMap)initialWorldMap;
- (ARWorldTrackingOptions)init;
- (ARWorldTrackingOptions)initWithImageSensorSettings:(id)a3;
- (BOOL)alwaysUsePrimaryCameraForTracking;
- (BOOL)depthBuffersWillBeProvided;
- (BOOL)deterministicMode;
- (BOOL)disableMLRelocalization;
- (BOOL)isCollaborationEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)lowQosSchedulingEnabled;
- (BOOL)mlModelEnabled;
- (BOOL)planeBundleAdjustmentEnabled;
- (BOOL)planeEstimationShouldUseJasperData;
- (BOOL)recordForGeoTracking;
- (BOOL)relocalizationEnabled;
- (BOOL)shouldUseUltraWide;
- (BOOL)visionDataWillBeReplayed;
- (NSDictionary)activeVideoFormatsMap;
- (NSNumber)vioSessionID;
- (NSString)deviceModel;
- (NSString)slamConfiguration;
- (double)minVergenceAngle;
- (id)copyWithZone:(_NSZone *)a3;
- (id)planeDetectionPoseUpdateCallback;
- (id)planeDetectionVIOPoseCallback;
- (id)singleShotPlaneCallback;
- (id)trackedPlaneCallback;
- (int)createSLAMCalibration:(CV3DSLAMCalibration *)a3;
- (int)setupCameraCalibration:(CV3DSLAMCalibration *)a3 forImageSensorSettings:(id)a4 deviceModel:(int)a5;
- (unint64_t)planeDetection;
- (unint64_t)sceneReconstruction;
- (unsigned)cameraIdForCaptureDeviceType:(id)a3;
- (void)createSLAMConfig:(CV3DSLAMConfig *)a3 calibration:(CV3DSLAMCalibration *)a4;
- (void)setAlwaysUsePrimaryCameraForTracking:(BOOL)a3;
- (void)setCollaborationEnabled:(BOOL)a3;
- (void)setDepthBuffersWillBeProvided:(BOOL)a3;
- (void)setDeterministicMode:(BOOL)a3;
- (void)setDeviceModel:(id)a3;
- (void)setDisableMLRelocalization:(BOOL)a3;
- (void)setImageSensorSettings:(id)a3;
- (void)setImageSensorSettingsForUltraWide:(id)a3;
- (void)setInitialWorldMap:(id)a3;
- (void)setLowQosSchedulingEnabled:(BOOL)a3;
- (void)setMinVergenceAngle:(double)a3;
- (void)setMlModelEnabled:(BOOL)a3;
- (void)setPlaneBundleAdjustmentEnabled:(BOOL)a3;
- (void)setPlaneDetection:(unint64_t)a3;
- (void)setPlaneDetectionPoseUpdateCallback:(id)a3;
- (void)setPlaneDetectionVIOPoseCallback:(id)a3;
- (void)setPlaneEstimationShouldUseJasperData:(BOOL)a3;
- (void)setRecordForGeoTracking:(BOOL)a3;
- (void)setRelocalizationEnabled:(BOOL)a3;
- (void)setSceneReconstruction:(unint64_t)a3;
- (void)setSceneReconstructionOptions:(id)a3;
- (void)setSingleShotPlaneCallback:(id)a3;
- (void)setSlamConfiguration:(id)a3;
- (void)setTrackedPlaneCallback:(id)a3;
- (void)setVioSessionID:(id)a3;
- (void)setVisionDataWillBeReplayed:(BOOL)a3;
- (void)updateCameraMap;
@end

@implementation ARWorldTrackingOptions

- (ARWorldTrackingOptions)init
{
  v3 = +[ARWorldTrackingConfiguration supportedVideoFormats];
  v4 = [ARImageSensorSettings alloc];
  v5 = [v3 firstObject];
  v6 = [(ARImageSensorSettings *)v4 initWithVideoFormat:v5];

  [(ARImageSensorSettings *)v6 setSupportsCapturingHighResolutionFrames:1];
  v7 = [(ARWorldTrackingOptions *)self initWithImageSensorSettings:v6];

  return v7;
}

- (ARWorldTrackingOptions)initWithImageSensorSettings:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ARWorldTrackingOptions;
  v6 = [(ARWorldTrackingOptions *)&v17 init];
  v7 = v6;
  if (v6)
  {
    v6->_relocalizationEnabled = 1;
    objc_storeStrong((id *)&v6->_imageSensorSettings, a3);
    [(ARImageSensorSettings *)v7->_imageSensorSettings setAutoFocusEnabled:1];
    v7->_planeDetection = 0;
    slamConfigurationPreset = v7->_slamConfigurationPreset;
    v7->_slamConfigurationPreset = (NSString *)@"ARKitiOS";

    v7->_minVergenceAngle = 1.0;
    imageSensorSettingsForUltraWide = v7->_imageSensorSettingsForUltraWide;
    v7->_imageSensorSettingsForUltraWide = 0;

    dispatch_semaphore_t v10 = dispatch_semaphore_create(1);
    activeVideoFormatsSemaphore = v7->_activeVideoFormatsSemaphore;
    v7->_activeVideoFormatsSemaphore = (OS_dispatch_semaphore *)v10;

    uint64_t v12 = objc_opt_new();
    activeVideoFormatsMap = v7->_activeVideoFormatsMap;
    v7->_activeVideoFormatsMap = (NSMutableDictionary *)v12;

    v7->_sceneReconstruction = 0;
    uint64_t v14 = objc_opt_new();
    sceneReconstructionOptions = v7->_sceneReconstructionOptions;
    v7->_sceneReconstructionOptions = (ARSceneReconstructionOptions *)v14;

    v7->_planeEstimationShouldUseJasperData = ARDeviceSupportsJasper();
    v7->_alwaysUsePrimaryCameraForTracking = 0;
    v7->_recordForGeoTracking = 0;
    [(ARWorldTrackingOptions *)v7 updateCameraMap];
  }

  return v7;
}

- (NSString)slamConfiguration
{
  return self->_slamConfigurationPreset;
}

- (void)setSlamConfiguration:(id)a3
{
  id v6 = a3;
  v4 = +[ARKitUserDefaults stringForKey:@"com.apple.arkit.worldtracking.slamConfiguration"];
  if ([v4 isEqualToString:&stru_1F120C8F0])
  {

    v4 = 0;
  }
  if (v4) {
    id v5 = v4;
  }
  else {
    id v5 = v6;
  }
  objc_storeStrong((id *)&self->_slamConfigurationPreset, v5);
}

- (BOOL)shouldUseUltraWide
{
  v2 = [(ARWorldTrackingOptions *)self imageSensorSettingsForUltraWide];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)setImageSensorSettings:(id)a3
{
  objc_storeStrong((id *)&self->_imageSensorSettings, a3);
  [(ARWorldTrackingOptions *)self updateCameraMap];
}

- (void)setImageSensorSettingsForUltraWide:(id)a3
{
  objc_storeStrong((id *)&self->_imageSensorSettingsForUltraWide, a3);
  [(ARWorldTrackingOptions *)self updateCameraMap];
}

- (void)updateCameraMap
{
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_activeVideoFormatsSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  [(NSMutableDictionary *)self->_activeVideoFormatsMap removeAllObjects];
  BOOL v3 = [(ARImageSensorSettings *)self->_imageSensorSettings videoFormat];

  if (v3)
  {
    v4 = [(ARImageSensorSettings *)self->_imageSensorSettings videoFormat];
    activeVideoFormatsMap = self->_activeVideoFormatsMap;
    id v6 = NSNumber;
    v7 = [(ARImageSensorSettings *)self->_imageSensorSettings videoFormat];
    v8 = [v7 captureDeviceType];
    v9 = objc_msgSend(v6, "numberWithUnsignedInt:", -[ARWorldTrackingOptions cameraIdForCaptureDeviceType:](self, "cameraIdForCaptureDeviceType:", v8));
    [(NSMutableDictionary *)activeVideoFormatsMap setObject:v4 forKeyedSubscript:v9];
  }
  dispatch_semaphore_t v10 = [(ARImageSensorSettings *)self->_imageSensorSettingsForUltraWide videoFormat];

  if (v10)
  {
    v11 = [(ARImageSensorSettings *)self->_imageSensorSettingsForUltraWide videoFormat];
    uint64_t v12 = self->_activeVideoFormatsMap;
    v13 = NSNumber;
    uint64_t v14 = [(ARImageSensorSettings *)self->_imageSensorSettingsForUltraWide videoFormat];
    v15 = [v14 captureDeviceType];
    v16 = objc_msgSend(v13, "numberWithUnsignedInt:", -[ARWorldTrackingOptions cameraIdForCaptureDeviceType:](self, "cameraIdForCaptureDeviceType:", v15));
    [(NSMutableDictionary *)v12 setObject:v11 forKeyedSubscript:v16];
  }
  activeVideoFormatsSemaphore = self->_activeVideoFormatsSemaphore;
  dispatch_semaphore_signal(activeVideoFormatsSemaphore);
}

- (NSDictionary)activeVideoFormatsMap
{
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_activeVideoFormatsSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  BOOL v3 = (void *)[(NSMutableDictionary *)self->_activeVideoFormatsMap copy];
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_activeVideoFormatsSemaphore);
  return (NSDictionary *)v3;
}

- (unsigned)cameraIdForCaptureDeviceType:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(ARWorldTrackingOptions *)self shouldUseUltraWide]
    && ([v4 isEqualToString:*MEMORY[0x1E4F15828]] & 1) == 0
    && ([v4 isEqualToString:*MEMORY[0x1E4F15830]] & 1) != 0;

  return v5;
}

- (int)createSLAMCalibration:(CV3DSLAMCalibration *)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  *a3 = (CV3DSLAMCalibration *)CV3DSLAMCalibrationCreate();
  unsigned int v5 = [(ARWorldTrackingOptions *)self deviceModel];
  if (v5)
  {
    id v6 = [(ARWorldTrackingOptions *)self deviceModel];
    [v6 UTF8String];
    uint64_t v7 = CV3DSLAMCameraModelTypeFromString();
  }
  else
  {
    uint64_t v7 = CV3DSLAMCalibrationDetectRuntimeHardware();
  }

  v8 = +[ARKitUserDefaults objectForKey:@"com.apple.arkit.worldtracking.calibrationParameters.imu"];
  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = v8;
      dispatch_semaphore_t v10 = _ARLogGeneral_7();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        v11 = (objc_class *)objc_opt_class();
        uint64_t v12 = NSStringFromClass(v11);
        int v45 = 138543618;
        v46 = v12;
        __int16 v47 = 2048;
        v48 = self;
        _os_log_impl(&dword_1B88A2000, v10, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Parsing custom imu calibration parameters.", (uint8_t *)&v45, 0x16u);
      }
      int v13 = ARParseAndAddImuCalibrationParameters(v9);
      uint64_t v14 = _ARLogGeneral_7();
      v15 = v14;
      if (!v13)
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          v25 = (objc_class *)objc_opt_class();
          v26 = NSStringFromClass(v25);
          int v45 = 138543618;
          v46 = v26;
          __int16 v47 = 2048;
          v48 = self;
          _os_log_impl(&dword_1B88A2000, v15, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Using custom imu calibration parameters.", (uint8_t *)&v45, 0x16u);
        }
        goto LABEL_18;
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v16 = (objc_class *)objc_opt_class();
        objc_super v17 = NSStringFromClass(v16);
        int v45 = 138543618;
        v46 = v17;
        __int16 v47 = 2048;
        v48 = self;
        _os_log_impl(&dword_1B88A2000, v15, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error parsing custom imu calibration parameters, using default parameters", (uint8_t *)&v45, 0x16u);
      }
    }
  }
  unsigned int v18 = SetDefaultImuCalibrationData();
  if (v18)
  {
    unsigned int v19 = v18;
    v20 = _ARLogGeneral_7();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = (objc_class *)objc_opt_class();
      v22 = NSStringFromClass(v21);
      v23 = NSStringFromCV3DSLAMCalibrationReturn(v19);
      int v45 = 138543874;
      v46 = v22;
      __int16 v47 = 2048;
      v48 = self;
      __int16 v49 = 2114;
      v50 = v23;
      v24 = "%{public}@ <%p>: Error setting default Imu calibration data: %{public}@";
LABEL_31:
      _os_log_impl(&dword_1B88A2000, v20, OS_LOG_TYPE_ERROR, v24, (uint8_t *)&v45, 0x20u);

      goto LABEL_32;
    }
    goto LABEL_32;
  }
LABEL_18:
  if (![(ARWorldTrackingOptions *)self shouldUseUltraWide]
    || (int v27 = [(ARWorldTrackingOptions *)self setupCameraCalibration:a3 forImageSensorSettings:self->_imageSensorSettingsForUltraWide deviceModel:v7]) == 0)
  {
    if (![(ARWorldTrackingOptions *)self shouldUseUltraWide]
      || ![(ARWorldTrackingOptions *)self alwaysUsePrimaryCameraForTracking])
    {
      int v29 = [(ARWorldTrackingOptions *)self setupCameraCalibration:a3 forImageSensorSettings:self->_imageSensorSettings deviceModel:v7];
      if (v29)
      {
        unsigned int v19 = v29;
        v20 = _ARLogGeneral_7();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          v30 = (objc_class *)objc_opt_class();
          v22 = NSStringFromClass(v30);
          v23 = NSStringFromCV3DSLAMCalibrationReturn(v19);
          int v45 = 138543874;
          v46 = v22;
          __int16 v47 = 2048;
          v48 = self;
          __int16 v49 = 2114;
          v50 = v23;
          v24 = "%{public}@ <%p>: Error setting camera calibration for wide camera: %{public}@";
          goto LABEL_31;
        }
        goto LABEL_32;
      }
    }
    if (ARDeviceSupportsJasper())
    {
      unsigned int v31 = SetDefaultJasperCalibrationData();
      if (v31)
      {
        unsigned int v19 = v31;
        v20 = _ARLogGeneral_7();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          v32 = (objc_class *)objc_opt_class();
          v22 = NSStringFromClass(v32);
          v23 = NSStringFromCV3DSLAMCalibrationReturn(v19);
          int v45 = 138543874;
          v46 = v22;
          __int16 v47 = 2048;
          v48 = self;
          __int16 v49 = 2114;
          v50 = v23;
          v24 = "%{public}@ <%p>: Error setting jasper calibration data: %{public}@";
          goto LABEL_31;
        }
        goto LABEL_32;
      }
    }
    v34 = [(ARWorldTrackingOptions *)self imageSensorSettings];
    int v35 = [v34 isBravoCameraEnabled];

    if (!v35)
    {
LABEL_46:
      unsigned int v19 = 0;
      goto LABEL_33;
    }
    if (+[ARKitUserDefaults BOOLForKey:@"com.apple.arkit.worldtracking.usePerFrameCameraIntrinsicsForBravo"])
    {
      int v36 = CV3DSLAMCalibrationForceToUsePerFrameCameraIntrinsics();
      v37 = _ARLogGeneral_7();
      v38 = v37;
      if (v36)
      {
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          v39 = (objc_class *)objc_opt_class();
          v40 = NSStringFromClass(v39);
          v41 = NSStringFromCV3DSLAMCalibrationReturn(0);
          int v45 = 138543874;
          v46 = v40;
          __int16 v47 = 2048;
          v48 = self;
          __int16 v49 = 2112;
          v50 = v41;
          _os_log_impl(&dword_1B88A2000, v38, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error configuring SLAM calibration to use per-frame camera intrinsics: %@", (uint8_t *)&v45, 0x20u);

LABEL_44:
        }
LABEL_45:

        goto LABEL_46;
      }
      if (!os_log_type_enabled(v37, OS_LOG_TYPE_INFO)) {
        goto LABEL_45;
      }
      v44 = (objc_class *)objc_opt_class();
      v40 = NSStringFromClass(v44);
      int v45 = 138543618;
      v46 = v40;
      __int16 v47 = 2048;
      v48 = self;
      v43 = "%{public}@ <%p>: Configured SLAM calibration to use per-frame camera intrinsics.";
    }
    else
    {
      v38 = _ARLogGeneral_7();
      if (!os_log_type_enabled(v38, OS_LOG_TYPE_INFO)) {
        goto LABEL_45;
      }
      v42 = (objc_class *)objc_opt_class();
      v40 = NSStringFromClass(v42);
      int v45 = 138543618;
      v46 = v40;
      __int16 v47 = 2048;
      v48 = self;
      v43 = "%{public}@ <%p>: Disabled per-frame camera intrinsics through user defaults.";
    }
    _os_log_impl(&dword_1B88A2000, v38, OS_LOG_TYPE_INFO, v43, (uint8_t *)&v45, 0x16u);
    goto LABEL_44;
  }
  unsigned int v19 = v27;
  v20 = _ARLogGeneral_7();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    v28 = (objc_class *)objc_opt_class();
    v22 = NSStringFromClass(v28);
    v23 = NSStringFromCV3DSLAMCalibrationReturn(v19);
    int v45 = 138543874;
    v46 = v22;
    __int16 v47 = 2048;
    v48 = self;
    __int16 v49 = 2114;
    v50 = v23;
    v24 = "%{public}@ <%p>: Error setting camera calibration for ultra wide camera: %{public}@";
    goto LABEL_31;
  }
LABEL_32:

  CV3DSLAMCalibrationRelease();
  *a3 = 0;
LABEL_33:

  return v19;
}

- (int)setupCameraCalibration:(CV3DSLAMCalibration *)a3 forImageSensorSettings:(id)a4 deviceModel:(int)a5
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  v8 = [v7 videoFormat];

  if (v8)
  {
    id v9 = [v7 videoFormat];
    dispatch_semaphore_t v10 = [v9 captureDeviceType];

    if (v10 == (void *)*MEMORY[0x1E4F15830])
    {
      int v13 = ARWorldTrackingBackWideCalibrationParametersUserDefaultsKey;
    }
    else
    {
      if (v10 != (void *)*MEMORY[0x1E4F15828])
      {
        v11 = 0;
LABEL_9:
        unsigned int v14 = [(ARWorldTrackingOptions *)self cameraIdForCaptureDeviceType:v10];
        v15 = [v7 videoFormat];
        [v15 imageResolution];
        double v17 = v16;
        double v19 = v18;

        int v20 = CV3DSLAMCameraVideoModeForResolutionAndDeviceType(v10, v17, v19);
        if (v11)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v21 = v11;
            int v43 = a5;
            if (_ARLogTechnique_onceToken_3 != -1) {
              dispatch_once(&_ARLogTechnique_onceToken_3, &__block_literal_global_190);
            }
            v22 = (void *)_ARLogTechnique_logObj_3;
            if (os_log_type_enabled((os_log_t)_ARLogTechnique_logObj_3, OS_LOG_TYPE_DEBUG))
            {
              v23 = v22;
              v24 = (objc_class *)objc_opt_class();
              v25 = NSStringFromClass(v24);
              *(_DWORD *)buf = 138543874;
              v46 = v25;
              __int16 v47 = 2048;
              v48 = self;
              __int16 v49 = 2112;
              *(void *)v50 = v10;
              _os_log_impl(&dword_1B88A2000, v23, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Parsing custom camera calibration parameters for device type %@.", buf, 0x20u);
            }
            int v26 = ARParseAndAddCameraCalibrationParameters(v21);
            int v27 = _ARLogGeneral_7();
            v28 = v27;
            if (!v26)
            {
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
              {
                v40 = (objc_class *)objc_opt_class();
                v41 = NSStringFromClass(v40);
                *(_DWORD *)buf = 138543618;
                v46 = v41;
                __int16 v47 = 2048;
                v48 = self;
                _os_log_impl(&dword_1B88A2000, v28, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Using custom camera calibration parameters.", buf, 0x16u);
              }
              unsigned int v12 = 0;
              goto LABEL_27;
            }
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              int v29 = (objc_class *)objc_opt_class();
              v30 = NSStringFromClass(v29);
              *(_DWORD *)buf = 138543618;
              v46 = v30;
              __int16 v47 = 2048;
              v48 = self;
              _os_log_impl(&dword_1B88A2000, v28, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error parsing custom camera calibration parameters, using default parameters", buf, 0x16u);
            }
            a5 = v43;
          }
        }
        unsigned int v12 = SetDefaultCameraCalibrationData();
        if (!v12)
        {
LABEL_28:

          goto LABEL_29;
        }
        unsigned int v31 = _ARLogGeneral_7();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          v32 = (objc_class *)objc_opt_class();
          v33 = NSStringFromClass(v32);
          NSStringFromCV3DSLAMCalibrationReturn(v12);
          v44 = v11;
          unsigned int v34 = v14;
          int v35 = v20;
          v37 = int v36 = a5;
          *(_DWORD *)buf = 138543874;
          v46 = v33;
          __int16 v47 = 2048;
          v48 = self;
          __int16 v49 = 2114;
          *(void *)v50 = v37;
          _os_log_impl(&dword_1B88A2000, v31, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error setting default camera calibration data: %{public}@", buf, 0x20u);

          a5 = v36;
          int v20 = v35;
          unsigned int v14 = v34;
          v11 = v44;
        }
        v21 = _ARLogGeneral_7();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          v38 = (objc_class *)objc_opt_class();
          v39 = NSStringFromClass(v38);
          *(_DWORD *)buf = 138544899;
          v46 = v39;
          __int16 v47 = 2048;
          v48 = self;
          __int16 v49 = 1025;
          *(_DWORD *)v50 = a5;
          *(_WORD *)&v50[4] = 1025;
          *(_DWORD *)&v50[6] = v20;
          __int16 v51 = 1025;
          int v52 = 0;
          __int16 v53 = 1025;
          unsigned int v54 = v14;
          __int16 v55 = 1025;
          int v56 = 0;
          _os_log_impl(&dword_1B88A2000, v21, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Input values of failing call to SetDefaultCameraCalibrationData: deviceModel: %{private}d, videoMode: %{private}d, cameraMode: %{private}d, cameraID: %{private}d, cameraStreamId: %{private}d", buf, 0x34u);
        }
LABEL_27:

        goto LABEL_28;
      }
      int v13 = ARWorldTrackingBackUltraWideCalibrationParametersUserDefaultsKey;
    }
    v11 = +[ARKitUserDefaults objectForKey:*v13];
    goto LABEL_9;
  }
  unsigned int v12 = 1;
LABEL_29:

  return v12;
}

- (void)createSLAMConfig:(CV3DSLAMConfig *)a3 calibration:(CV3DSLAMCalibration *)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v6 = [(ARWorldTrackingOptions *)self imageSensorSettings];
  if ([(ARWorldTrackingOptions *)self shouldUseUltraWide])
  {
    uint64_t v7 = [(ARWorldTrackingOptions *)self imageSensorSettingsForUltraWide];

    id v6 = (void *)v7;
  }
  v8 = [v6 videoFormat];

  if (!v8)
  {
    *a3 = 0;
    goto LABEL_51;
  }
  id v9 = [v6 videoFormat];
  [v9 imageResolution];
  double v11 = v10;
  double v13 = v12;

  unsigned int v14 = [v6 videoFormat];
  v15 = [v14 captureDeviceType];
  CV3DSLAMCameraVideoModeForResolutionAndDeviceType(v15, v11, v13);

  id v16 = [(ARWorldTrackingOptions *)self slamConfiguration];
  [v16 UTF8String];
  CV3DSLAMConfigPresetFromString();

  +[ARKitUserDefaults BOOLForKey:@"com.apple.arkit.worldTracking.simulateHWFeatureDetection"];
  [v6 visionDataOutputEnabled];
  CV3DSLAMConfigCalcFeaturePointDetectionResolution();
  CV3DSLAMConfigCalcLineDetectionResolution();
  *a3 = (CV3DSLAMConfig *)CV3DSLAMConfigCreate2();
  [(ARWorldTrackingOptions *)self relocalizationEnabled];
  CV3DSLAMConfigSetRelocalizationEnabled();
  CV3DSLAMConfigUseSWProxyFeaturePoints();
  uint64_t v17 = CV3DSLAMConfigUseHWFeaturePoints();
  if (MEMORY[0x1BA9C4660](v17)
    && +[ARKitUserDefaults BOOLForKey:@"com.apple.arkit.worldTracking.useLACCIfAvailable"])
  {
    CV3DSLAMConfigEnableLacc();
  }
  if ([(ARWorldTrackingOptions *)self isCollaborationEnabled])
  {
    CV3DSLAMConfigEnableCollaborativeMapping();
    +[ARKitUserDefaults BOOLForKey:@"com.apple.arkit.worldTracking.collaborativeMappingStatistics"];
    CV3DSLAMConfigOutputCollaborativeMappingStatistics();
  }
  [(ARWorldTrackingOptions *)self deterministicMode];
  CV3DSLAMConfigUseDeterministicMode();
  if (self->_disableMLRelocalization)
  {
    double v18 = _ARLogGeneral_7();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      double v19 = (objc_class *)objc_opt_class();
      int v20 = NSStringFromClass(v19);
      int v41 = 138543618;
      v42 = v20;
      __int16 v43 = 2048;
      v44 = self;
      _os_log_impl(&dword_1B88A2000, v18, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Force disabling relocalization mode. The user default has no effect.", (uint8_t *)&v41, 0x16u);
    }
    goto LABEL_13;
  }
  int64_t v31 = +[ARKitUserDefaults integerForKey:@"com.apple.arkit.worldTracking.mlRelocalizationMode"];
  if (v31 != 2)
  {
    if (v31 == 1)
    {
LABEL_13:
      CV3DSLAMConfigDisableMLRelocalization();
      goto LABEL_14;
    }
    if (v31 || !CV3DSLAMConfigIsMLRelocalizationSupported()) {
      goto LABEL_14;
    }
  }
  CV3DSLAMConfigEnableMLRelocalization();
LABEL_14:
  if (+[ARKitUserDefaults BOOLForKey:@"com.apple.arkit.worldtracking.enableTempMappingDirectory"]&& !self->_disableMLRelocalization)
  {
    NSTemporaryDirectory();
    id v21 = objc_claimAutoreleasedReturnValue();
    [v21 fileSystemRepresentation];
    unsigned int v22 = CV3DSLAMConfigSetMappingDirectory();
    if (v22)
    {
      unsigned int v23 = v22;
      v24 = _ARLogGeneral_7();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = (objc_class *)objc_opt_class();
        int v26 = NSStringFromClass(v25);
        int v27 = NSStringFromCV3DSLAMConfigReturn(v23);
        int v41 = 138543874;
        v42 = v26;
        __int16 v43 = 2048;
        v44 = self;
        __int16 v45 = 2114;
        v46 = v27;
        _os_log_impl(&dword_1B88A2000, v24, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error setting SLAM mapping directory: %{public}@", (uint8_t *)&v41, 0x20u);
      }
    }
  }
  v28 = +[ARKitUserDefaults valueForKey:@"com.apple.arkit.worldtracking.lineFeatures"];
  int v29 = v28;
  if (v28) {
    int v30 = [v28 BOOLValue];
  }
  else {
    int v30 = 0;
  }
  v32 = +[ARKitUserDefaults valueForKey:@"com.apple.arkit.worldtracking.lineFeaturesAlwaysOn"];
  v33 = v32;
  if (v32 && [v32 BOOLValue])
  {
    CV3DSLAMConfigEnableLineTrackingAlways();
  }
  else if (v30)
  {
    CV3DSLAMConfigEnableLineTracking();
  }
  else
  {
    CV3DSLAMConfigDisableLineTracking();
  }
  if (self->_sceneReconstruction) {
    CV3DSLAMConfigAnchorStrategy();
  }
  if (ARDeviceSupportsJasper()
    && [(ARWorldTrackingOptions *)self planeEstimationShouldUseJasperData])
  {
    CV3DSLAMConfigEnablePlaneTracking();
  }
  else
  {
    CV3DSLAMConfigDisablePlaneTracking();
  }
  unsigned int v34 = [(ARWorldTrackingOptions *)self initialWorldMap];

  if (v34)
  {
    int v35 = [(ARWorldTrackingOptions *)self initialWorldMap];
    int v36 = [v35 trackingData];
    CV3DSLAMConfigSetMapFromCFData();
  }
  if ([(ARWorldTrackingOptions *)self alwaysUsePrimaryCameraForTracking]) {
    CV3DSLAMConfigDisableCameraSwitchingAndUsePrimaryCamera();
  }
  v37 = [(ARWorldTrackingOptions *)self vioSessionID];

  if (v37)
  {
    v38 = [(ARWorldTrackingOptions *)self vioSessionID];
    [v38 unsignedIntegerValue];
    CV3DSLAMConfigOverrideSessionID();
  }
  v39 = +[ARKitUserDefaults valueForKey:@"com.apple.arkit.worldtracking.transformToExternalSubmap"];
  v40 = v39;
  if (v39)
  {
    [v39 BOOLValue];
    CV3DSLAMConfigEnableTransformToExternalSubmap();
  }

LABEL_51:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(ARImageSensorSettings *)self->_imageSensorSettings copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v6;

  id v8 = [(ARImageSensorSettings *)self->_imageSensorSettingsForUltraWide copyWithZone:a3];
  id v9 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v8;

  uint64_t v10 = [(NSString *)self->_deviceModel copyWithZone:a3];
  double v11 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v10;

  *(unsigned char *)(v5 + 32) = self->_relocalizationEnabled;
  id v12 = [(ARWorldMap *)self->_initialWorldMap copyWithZone:a3];
  double v13 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v12;

  uint64_t v14 = [(NSString *)self->_slamConfigurationPreset copyWithZone:a3];
  v15 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v14;

  *(unsigned char *)(v5 + 33) = self->_deterministicMode;
  *(unsigned char *)(v5 + 34) = self->_lowQosSchedulingEnabled;
  *(void *)(v5 + 80) = self->_planeDetection;
  *(double *)(v5 + 88) = self->_minVergenceAngle;
  *(unsigned char *)(v5 + 35) = self->_mlModelEnabled;
  *(unsigned char *)(v5 + 36) = self->_collaborationEnabled;
  objc_storeStrong((id *)(v5 + 112), self->_vioSessionID);
  *(unsigned char *)(v5 + 37) = self->_depthBuffersWillBeProvided;
  *(unsigned char *)(v5 + 38) = self->_visionDataWillBeReplayed;
  *(void *)(v5 + 96) = self->_sceneReconstruction;
  id v16 = [(ARSceneReconstructionOptions *)self->_sceneReconstructionOptions copyWithZone:a3];
  uint64_t v17 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v16;

  *(unsigned char *)(v5 + 39) = self->_planeEstimationShouldUseJasperData;
  *(unsigned char *)(v5 + 40) = self->_alwaysUsePrimaryCameraForTracking;
  *(unsigned char *)(v5 + 41) = self->_disableMLRelocalization;
  *(unsigned char *)(v5 + 42) = self->_recordForGeoTracking;
  *(unsigned char *)(v5 + 43) = self->_planeBundleAdjustmentEnabled;
  uint64_t v18 = MEMORY[0x1BA9C63E0](self->_singleShotPlaneCallback);
  double v19 = *(void **)(v5 + 120);
  *(void *)(v5 + 120) = v18;

  uint64_t v20 = MEMORY[0x1BA9C63E0](self->_trackedPlaneCallback);
  id v21 = *(void **)(v5 + 128);
  *(void *)(v5 + 128) = v20;

  uint64_t v22 = MEMORY[0x1BA9C63E0](self->_planeDetectionVIOPoseCallback);
  unsigned int v23 = *(void **)(v5 + 136);
  *(void *)(v5 + 136) = v22;

  uint64_t v24 = MEMORY[0x1BA9C63E0](self->_planeDetectionPoseUpdateCallback);
  v25 = *(void **)(v5 + 144);
  *(void *)(v5 + 144) = v24;

  [(id)v5 updateCameraMap];
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = (ARImageSensorSettings **)v4;
    imageSensorSettings = self->_imageSensorSettings;
    BOOL v12 = (imageSensorSettings == v5[6] || -[ARImageSensorSettings isEqual:](imageSensorSettings, "isEqual:"))
       && ((imageSensorSettingsForUltraWide = self->_imageSensorSettingsForUltraWide,
            imageSensorSettingsForUltraWide == v5[7])
        || -[ARImageSensorSettings isEqual:](imageSensorSettingsForUltraWide, "isEqual:"))
       && ((deviceModel = self->_deviceModel, deviceModel == (NSString *)v5[8])
        || -[NSString isEqualToString:](deviceModel, "isEqualToString:"))
       && self->_relocalizationEnabled == *((unsigned __int8 *)v5 + 32)
       && ((initialWorldMap = self->_initialWorldMap, initialWorldMap == (ARWorldMap *)v5[9])
        || -[ARWorldMap isEqual:](initialWorldMap, "isEqual:"))
       && ((slamConfigurationPreset = self->_slamConfigurationPreset, slamConfigurationPreset == (NSString *)v5[3])
        || -[NSString isEqual:](slamConfigurationPreset, "isEqual:"))
       && self->_deterministicMode == *((unsigned __int8 *)v5 + 33)
       && (ARImageSensorSettings *)self->_planeDetection == v5[10]
       && self->_lowQosSchedulingEnabled == *((unsigned __int8 *)v5 + 34)
       && self->_minVergenceAngle == *((double *)v5 + 11)
       && self->_mlModelEnabled == *((unsigned __int8 *)v5 + 35)
       && self->_collaborationEnabled == *((unsigned __int8 *)v5 + 36)
       && (ARImageSensorSettings *)self->_vioSessionID == v5[14]
       && self->_depthBuffersWillBeProvided == *((unsigned __int8 *)v5 + 37)
       && self->_visionDataWillBeReplayed == *((unsigned __int8 *)v5 + 38)
       && (ARImageSensorSettings *)self->_sceneReconstruction == v5[12]
       && ((sceneReconstructionOptions = self->_sceneReconstructionOptions,
            sceneReconstructionOptions == (ARSceneReconstructionOptions *)v5[13])
        || -[ARSceneReconstructionOptions isEqual:](sceneReconstructionOptions, "isEqual:"))
       && self->_planeEstimationShouldUseJasperData == *((unsigned __int8 *)v5 + 39)
       && self->_alwaysUsePrimaryCameraForTracking == *((unsigned __int8 *)v5 + 40)
       && self->_disableMLRelocalization == *((unsigned __int8 *)v5 + 41)
       && self->_recordForGeoTracking == *((unsigned __int8 *)v5 + 42)
       && self->_planeBundleAdjustmentEnabled == *((unsigned __int8 *)v5 + 43)
       && self->_singleShotPlaneCallback == v5[15]
       && self->_trackedPlaneCallback == v5[16]
       && self->_planeDetectionVIOPoseCallback == v5[17]
       && self->_planeDetectionPoseUpdateCallback == v5[18];
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (ARImageSensorSettings)imageSensorSettings
{
  return self->_imageSensorSettings;
}

- (ARImageSensorSettings)imageSensorSettingsForUltraWide
{
  return self->_imageSensorSettingsForUltraWide;
}

- (NSString)deviceModel
{
  return self->_deviceModel;
}

- (void)setDeviceModel:(id)a3
{
}

- (BOOL)relocalizationEnabled
{
  return self->_relocalizationEnabled;
}

- (void)setRelocalizationEnabled:(BOOL)a3
{
  self->_relocalizationEnabled = a3;
}

- (ARWorldMap)initialWorldMap
{
  return self->_initialWorldMap;
}

- (void)setInitialWorldMap:(id)a3
{
}

- (BOOL)deterministicMode
{
  return self->_deterministicMode;
}

- (void)setDeterministicMode:(BOOL)a3
{
  self->_deterministicMode = a3;
}

- (BOOL)lowQosSchedulingEnabled
{
  return self->_lowQosSchedulingEnabled;
}

- (void)setLowQosSchedulingEnabled:(BOOL)a3
{
  self->_lowQosSchedulingEnabled = a3;
}

- (unint64_t)planeDetection
{
  return self->_planeDetection;
}

- (void)setPlaneDetection:(unint64_t)a3
{
  self->_planeDetection = a3;
}

- (double)minVergenceAngle
{
  return self->_minVergenceAngle;
}

- (void)setMinVergenceAngle:(double)a3
{
  self->_minVergenceAngle = a3;
}

- (BOOL)mlModelEnabled
{
  return self->_mlModelEnabled;
}

- (void)setMlModelEnabled:(BOOL)a3
{
  self->_mlModelEnabled = a3;
}

- (BOOL)isCollaborationEnabled
{
  return self->_collaborationEnabled;
}

- (void)setCollaborationEnabled:(BOOL)a3
{
  self->_collaborationEnabled = a3;
}

- (BOOL)depthBuffersWillBeProvided
{
  return self->_depthBuffersWillBeProvided;
}

- (void)setDepthBuffersWillBeProvided:(BOOL)a3
{
  self->_depthBuffersWillBeProvided = a3;
}

- (BOOL)visionDataWillBeReplayed
{
  return self->_visionDataWillBeReplayed;
}

- (void)setVisionDataWillBeReplayed:(BOOL)a3
{
  self->_visionDataWillBeReplayed = a3;
}

- (unint64_t)sceneReconstruction
{
  return self->_sceneReconstruction;
}

- (void)setSceneReconstruction:(unint64_t)a3
{
  self->_sceneReconstruction = a3;
}

- (BOOL)planeEstimationShouldUseJasperData
{
  return self->_planeEstimationShouldUseJasperData;
}

- (void)setPlaneEstimationShouldUseJasperData:(BOOL)a3
{
  self->_planeEstimationShouldUseJasperData = a3;
}

- (ARSceneReconstructionOptions)sceneReconstructionOptions
{
  return self->_sceneReconstructionOptions;
}

- (void)setSceneReconstructionOptions:(id)a3
{
}

- (BOOL)alwaysUsePrimaryCameraForTracking
{
  return self->_alwaysUsePrimaryCameraForTracking;
}

- (void)setAlwaysUsePrimaryCameraForTracking:(BOOL)a3
{
  self->_alwaysUsePrimaryCameraForTracking = a3;
}

- (BOOL)disableMLRelocalization
{
  return self->_disableMLRelocalization;
}

- (void)setDisableMLRelocalization:(BOOL)a3
{
  self->_disableMLRelocalization = a3;
}

- (BOOL)recordForGeoTracking
{
  return self->_recordForGeoTracking;
}

- (void)setRecordForGeoTracking:(BOOL)a3
{
  self->_recordForGeoTracking = a3;
}

- (NSNumber)vioSessionID
{
  return self->_vioSessionID;
}

- (void)setVioSessionID:(id)a3
{
}

- (BOOL)planeBundleAdjustmentEnabled
{
  return self->_planeBundleAdjustmentEnabled;
}

- (void)setPlaneBundleAdjustmentEnabled:(BOOL)a3
{
  self->_planeBundleAdjustmentEnabled = a3;
}

- (id)singleShotPlaneCallback
{
  return self->_singleShotPlaneCallback;
}

- (void)setSingleShotPlaneCallback:(id)a3
{
}

- (id)trackedPlaneCallback
{
  return self->_trackedPlaneCallback;
}

- (void)setTrackedPlaneCallback:(id)a3
{
}

- (id)planeDetectionVIOPoseCallback
{
  return self->_planeDetectionVIOPoseCallback;
}

- (void)setPlaneDetectionVIOPoseCallback:(id)a3
{
}

- (id)planeDetectionPoseUpdateCallback
{
  return self->_planeDetectionPoseUpdateCallback;
}

- (void)setPlaneDetectionPoseUpdateCallback:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_planeDetectionPoseUpdateCallback, 0);
  objc_storeStrong(&self->_planeDetectionVIOPoseCallback, 0);
  objc_storeStrong(&self->_trackedPlaneCallback, 0);
  objc_storeStrong(&self->_singleShotPlaneCallback, 0);
  objc_storeStrong((id *)&self->_vioSessionID, 0);
  objc_storeStrong((id *)&self->_sceneReconstructionOptions, 0);
  objc_storeStrong((id *)&self->_initialWorldMap, 0);
  objc_storeStrong((id *)&self->_deviceModel, 0);
  objc_storeStrong((id *)&self->_imageSensorSettingsForUltraWide, 0);
  objc_storeStrong((id *)&self->_imageSensorSettings, 0);
  objc_storeStrong((id *)&self->_slamConfigurationPreset, 0);
  objc_storeStrong((id *)&self->_activeVideoFormatsSemaphore, 0);
  objc_storeStrong((id *)&self->_activeVideoFormatsMap, 0);
}

@end