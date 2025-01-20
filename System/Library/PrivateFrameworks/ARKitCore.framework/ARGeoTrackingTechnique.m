@interface ARGeoTrackingTechnique
+ (BOOL)isCameraUp:(float)a3;
+ (BOOL)isSupported;
+ (BOOL)isSupportedWithOptions:(unint64_t)a3;
+ (BOOL)producesResultDataForAnchorOfClass:(Class)a3;
+ (int64_t)getFailureReasonFromVLError:(int64_t)a3;
+ (long)getHeadingForEnuFromCam:(uint64_t)a3;
- (ARGeoTrackingTechnique)init;
- (ARGeoTrackingTechnique)initWithAuditToken:(id)a3;
- (BOOL)VLPoseEstimationExecuting;
- (BOOL)reconfigurableFrom:(id)a3;
- (BOOL)visualLocalizationUpdatesRequested;
- (CLSimulationManager)locationSimulationManager;
- (VLTraceRecorder)VLTraceRecorder;
- (double)posteriorVisualLocalizationCallInterval;
- (double)visualLocalizationCallInterval;
- (double)visualLocalizationCallIntervalTimeThreshold;
- (id)processData:(id)a3;
- (id)resultDataClasses;
- (int64_t)_getHighestPriorityFailureWithTechniqueStateObject:(id)a3;
- (int64_t)captureBehavior;
- (unint64_t)requiredSensorDataTypes;
- (unint64_t)supportEnablementOptions;
- (void)_callVLWithHandle:(double)a3 pixelBuffer:(__n128)a4 deviceLocation:(__n128)a5 heading:(__n128)a6 inputGravity:(__n128)a7 vioTransform:(uint64_t)a8 cameraIntrinsics:(void *)a9 radialDistortion:(uint64_t)a10 exposureTargetOffset:(void *)a11 timestamp:(long long *)a12 vlDeterminismSemaphore:(void *)a13 completionHandler:(void *)a14;
- (void)_estimateEnuFromVioFromCLCM:(id)a3;
- (void)_estimatePose:(id)a3 pose:(id)a4;
- (void)_logVioTransform:(float32x4_t)a3 withTimestamp:(float32x4_t)a4 withSuffix:(float32x4_t)a5;
- (void)_setTrackingState:(int64_t)a3 techniqueStateObject:(id)a4;
- (void)_simulateReplayLocationUpdates:(id)a3;
- (void)_updateVLStateData:(double)a3;
- (void)dealloc;
- (void)getLocationFromWorldPosition:(_OWORD *)a3@<X8> error:(__n128)a4@<Q0>;
- (void)prepare:(BOOL)a3;
- (void)reconfigureFrom:(id)a3;
- (void)requestResultDataAtTimestamp:(double)a3 context:(id)a4;
- (void)setLocationSimulationManager:(id)a3;
- (void)setPosteriorVisualLocalizationCallInterval:(double)a3;
- (void)setSupportEnablementOptions:(unint64_t)a3;
- (void)setVLPoseEstimationExecuting:(BOOL)a3;
- (void)setVLTraceRecorder:(id)a3;
- (void)setVisualLocalizationCallInterval:(double)a3;
- (void)setVisualLocalizationCallIntervalTimeThreshold:(double)a3;
- (void)setVisualLocalizationUpdatesRequested:(BOOL)a3;
@end

@implementation ARGeoTrackingTechnique

+ (BOOL)isSupportedWithOptions:(unint64_t)a3
{
  char v3 = a3;
  int HasGPSCapability = +[ARWorldTrackingTechnique isSupported];
  if (HasGPSCapability)
  {
    int HasGPSCapability = [MEMORY[0x1E4FB4110] isVisualLocalizationSupported];
    if (HasGPSCapability)
    {
      if ((v3 & 2) != 0 || (int HasGPSCapability = ARDeviceHasGPSCapability()) != 0)
      {
        if ((v3 & 4) != 0)
        {
          LOBYTE(HasGPSCapability) = 1;
        }
        else
        {
          LOBYTE(HasGPSCapability) = ARAppleNeuralEngine();
        }
      }
    }
  }
  return HasGPSCapability;
}

- (ARGeoTrackingTechnique)init
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v25.receiver = self;
  v25.super_class = (Class)ARGeoTrackingTechnique;
  v2 = [(ARTechnique *)&v25 init];
  char v3 = v2;
  if (v2)
  {
    v2->_resultLock._os_unfair_lock_opaque = 0;
    uint64_t v4 = ARCreateFixedPriorityDispatchQueue("com.apple.arkit.visualLocalizationQueue");
    visualLocalizationQueue = v3->_visualLocalizationQueue;
    v3->_visualLocalizationQueue = (OS_dispatch_queue *)v4;

    v3->_resetLock._os_unfair_lock_opaque = 0;
    [(ARGeoTrackingTechnique *)v3 setVLPoseEstimationExecuting:0];
    +[ARKitUserDefaults floatForKey:@"com.apple.arkit.geotracking.visualLocalizationCallInterval"];
    [(ARGeoTrackingTechnique *)v3 setVisualLocalizationCallInterval:v6];
    +[ARKitUserDefaults floatForKey:@"com.apple.arkit.geotracking.posteriorVisualLocalizationCallInterval"];
    [(ARGeoTrackingTechnique *)v3 setPosteriorVisualLocalizationCallInterval:v7];
    +[ARKitUserDefaults floatForKey:@"com.apple.arkit.geotracking.visualLocalizationCallIntervalTimeThreshold"];
    [(ARGeoTrackingTechnique *)v3 setVisualLocalizationCallIntervalTimeThreshold:v8];
    [(ARGeoTrackingTechnique *)v3 setVisualLocalizationUpdatesRequested:1];
    [(ARGeoTrackingTechnique *)v3 setSupportEnablementOptions:0];
    v3->_statusLock._os_unfair_lock_opaque = 0;
    [(ARGeoTrackingTechnique *)v3 setVLTraceRecorder:0];
    BOOL v9 = +[ARKitUserDefaults BOOLForKey:@"com.apple.arkit.geotracking.useclfusion"];
    v3->_useCoreLocationFusion = v9;
    if (v9)
    {
      v10 = _ARLogTechnique_9();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = (objc_class *)objc_opt_class();
        v12 = NSStringFromClass(v11);
        *(_DWORD *)buf = 138543618;
        v27 = v12;
        __int16 v28 = 2048;
        v29 = v3;
        _os_log_impl(&dword_1B88A2000, v10, OS_LOG_TYPE_INFO, "%{public}@ <%p>: CL fusion is enabled.", buf, 0x16u);
      }
    }
    BOOL v13 = +[ARKitUserDefaults BOOLForKey:@"com.apple.arkit.geotracking.usecmfusion"];
    v3->_useCoreMotionFusion = v13;
    if (v13)
    {
      v14 = _ARLogTechnique_9();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v15 = (objc_class *)objc_opt_class();
        v16 = NSStringFromClass(v15);
        *(_DWORD *)buf = 138543618;
        v27 = v16;
        __int16 v28 = 2048;
        v29 = v3;
        _os_log_impl(&dword_1B88A2000, v14, OS_LOG_TYPE_INFO, "%{public}@ <%p>: CM fusion is enabled.", buf, 0x16u);
      }
    }
    v3->_useGradualCorrection = +[ARKitUserDefaults BOOLForKey:@"com.apple.arkit.geotracking.usegradualcorrection"];
    v3->_useVLTraceRecorder = +[ARKitUserDefaults BOOLForKey:@"com.apple.arkit.geotracking.useVLTraceRecorder"];
    v17 = [[ARGeoTrackingTechniqueState alloc] initWithResetCount:0];
    state = v3->_state;
    v3->_state = v17;

    [MEMORY[0x1E4FB4110] maximumHorizontalAccuracyThreshold];
    v3->_double maxHorizontalAccuracy = v19;
    v20 = _ARLogTechnique_9();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      v21 = (objc_class *)objc_opt_class();
      v22 = NSStringFromClass(v21);
      double maxHorizontalAccuracy = v3->_maxHorizontalAccuracy;
      *(_DWORD *)buf = 138543874;
      v27 = v22;
      __int16 v28 = 2048;
      v29 = v3;
      __int16 v30 = 2048;
      double v31 = maxHorizontalAccuracy;
      _os_log_impl(&dword_1B88A2000, v20, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: self.maxHorizontalAccuracy %fm", buf, 0x20u);
    }
    v3->_requestResultDataAtTimestampCallCount = 0;
  }
  return v3;
}

- (ARGeoTrackingTechnique)initWithAuditToken:(id)a3
{
  id v5 = a3;
  float v6 = [(ARGeoTrackingTechnique *)self init];
  float v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_auditToken, a3);
  }

  return v7;
}

- (void)dealloc
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  char v3 = _ARLogTechnique_9();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = (objc_class *)objc_opt_class();
    id v5 = NSStringFromClass(v4);
    *(_DWORD *)buf = 138543618;
    v14 = v5;
    __int16 v15 = 2048;
    v16 = self;
    _os_log_impl(&dword_1B88A2000, v3, OS_LOG_TYPE_INFO, "%{public}@ <%p>: dealloc", buf, 0x16u);
  }
  if (self->_VLTraceRecorder)
  {
    float v6 = [(ARGeoTrackingTechnique *)self VLTraceRecorder];
    [v6 finish];
  }
  float v7 = _ARLogTechnique_9();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    float v8 = (objc_class *)objc_opt_class();
    BOOL v9 = NSStringFromClass(v8);
    *(_DWORD *)buf = 138543618;
    v14 = v9;
    __int16 v15 = 2048;
    v16 = self;
    _os_log_impl(&dword_1B88A2000, v7, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Stopping location simulation", buf, 0x16u);
  }
  v10 = [(ARGeoTrackingTechnique *)self locationSimulationManager];
  [v10 clearSimulatedLocations];

  v11 = [(ARGeoTrackingTechnique *)self locationSimulationManager];
  [v11 stopLocationSimulation];

  v12.receiver = self;
  v12.super_class = (Class)ARGeoTrackingTechnique;
  [(ARGeoTrackingTechnique *)&v12 dealloc];
}

- (void)prepare:(BOOL)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  self->_deterministic = a3;
  uint64_t v4 = [(ARGeoTrackingTechniqueState *)self->_state VLHandle];

  if (!v4)
  {
    if (self->_auditToken) {
      uint64_t v5 = [objc_alloc(MEMORY[0x1E4FB4110]) initWithAuditToken:self->_auditToken];
    }
    else {
      uint64_t v5 = objc_opt_new();
    }
    float v6 = (void *)v5;
    [(ARGeoTrackingTechniqueState *)self->_state setVLHandle:v5];

    float v7 = _ARLogTechnique_9();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      float v8 = (objc_class *)objc_opt_class();
      BOOL v9 = NSStringFromClass(v8);
      v10 = [(ARGeoTrackingTechniqueState *)self->_state VLHandle];
      int v20 = 138543874;
      v21 = v9;
      __int16 v22 = 2048;
      v23 = self;
      __int16 v24 = 2048;
      uint64_t v25 = (uint64_t)v10;
      _os_log_impl(&dword_1B88A2000, v7, OS_LOG_TYPE_INFO, "%{public}@ <%p>: VLHandle created,%p", (uint8_t *)&v20, 0x20u);
    }
  }
  if (!self->_VLTraceRecorder && self->_useVLTraceRecorder)
  {
    v11 = [(ARGeoTrackingTechniqueState *)self->_state VLHandle];
    [v11 _setDebugInfoShouldPreserveImageData:1];

    objc_super v12 = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"/var/mobile/Library/Caches/VisualLocalization/Traces"];
    BOOL v13 = _ARLogTechnique_9();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = (objc_class *)objc_opt_class();
      __int16 v15 = NSStringFromClass(v14);
      id v16 = [v12 absoluteString];
      uint64_t v17 = [v16 UTF8String];
      int v20 = 138543874;
      v21 = v15;
      __int16 v22 = 2048;
      v23 = self;
      __int16 v24 = 2080;
      uint64_t v25 = v17;
      _os_log_impl(&dword_1B88A2000, v13, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Capturing traces at %s", (uint8_t *)&v20, 0x20u);
    }
    v18 = (void *)[objc_alloc(MEMORY[0x1E4FB4118]) initWithDirectory:v12];
    [(ARGeoTrackingTechnique *)self setVLTraceRecorder:v18];

    double v19 = [(ARGeoTrackingTechnique *)self VLTraceRecorder];
    [v19 start];
  }
}

- (unint64_t)requiredSensorDataTypes
{
  return 79;
}

- (id)resultDataClasses
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();
  return (id)[v2 setWithObject:v3];
}

- (int64_t)captureBehavior
{
  return 1;
}

- (BOOL)reconfigurableFrom:(id)a3
{
  id v3 = a3;
  char v4 = [v3 isMemberOfClass:objc_opt_class()];

  return v4;
}

- (void)reconfigureFrom:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = _ARLogTechnique_9();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    float v6 = (objc_class *)objc_opt_class();
    float v7 = NSStringFromClass(v6);
    int v10 = 138543618;
    v11 = v7;
    __int16 v12 = 2048;
    BOOL v13 = self;
    _os_log_impl(&dword_1B88A2000, v5, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Reconfiguring existing geo tracking technique.", (uint8_t *)&v10, 0x16u);
  }
  id v8 = v4;
  [v8 visualLocalizationCallInterval];
  -[ARGeoTrackingTechnique setVisualLocalizationCallInterval:](self, "setVisualLocalizationCallInterval:");
  [v8 posteriorVisualLocalizationCallInterval];
  -[ARGeoTrackingTechnique setPosteriorVisualLocalizationCallInterval:](self, "setPosteriorVisualLocalizationCallInterval:");
  [v8 visualLocalizationCallIntervalTimeThreshold];
  -[ARGeoTrackingTechnique setVisualLocalizationCallIntervalTimeThreshold:](self, "setVisualLocalizationCallIntervalTimeThreshold:");
  uint64_t v9 = [v8 visualLocalizationUpdatesRequested];

  [(ARGeoTrackingTechnique *)self setVisualLocalizationUpdatesRequested:v9];
}

- (void)_simulateReplayLocationUpdates:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (([v4 isSecure] & 1) == 0)
  {
    uint64_t v5 = [v4 location];
    float v6 = (void *)[v5 copy];

    float v7 = _ARLogTechnique_9();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      id v8 = (objc_class *)objc_opt_class();
      uint64_t v9 = NSStringFromClass(v8);
      int v21 = 138543874;
      __int16 v22 = v9;
      __int16 v23 = 2048;
      __int16 v24 = self;
      __int16 v25 = 2112;
      uint64_t v26 = v6;
      _os_log_impl(&dword_1B88A2000, v7, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Simulating Location to CL: %@", (uint8_t *)&v21, 0x20u);
    }
    int v10 = [(ARGeoTrackingTechnique *)self locationSimulationManager];

    if (!v10)
    {
      v11 = _ARLogTechnique_9();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        __int16 v12 = (objc_class *)objc_opt_class();
        BOOL v13 = NSStringFromClass(v12);
        int v21 = 138543618;
        __int16 v22 = v13;
        __int16 v23 = 2048;
        __int16 v24 = self;
        _os_log_impl(&dword_1B88A2000, v11, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Creating location simulation manager.", (uint8_t *)&v21, 0x16u);
      }
      id v14 = objc_alloc_init(MEMORY[0x1E4F1E658]);
      [(ARGeoTrackingTechnique *)self setLocationSimulationManager:v14];

      __int16 v15 = [(ARGeoTrackingTechnique *)self locationSimulationManager];
      [v15 stopLocationSimulation];

      id v16 = [(ARGeoTrackingTechnique *)self locationSimulationManager];
      [v16 clearSimulatedLocations];
    }
    uint64_t v17 = [(ARGeoTrackingTechnique *)self locationSimulationManager];
    [v17 setLocationDistance:1.0];

    v18 = [(ARGeoTrackingTechnique *)self locationSimulationManager];
    [v18 setLocationRepeatBehavior:1];

    double v19 = [(ARGeoTrackingTechnique *)self locationSimulationManager];
    [v19 appendSimulatedLocation:v6];

    int v20 = [(ARGeoTrackingTechnique *)self locationSimulationManager];
    [v20 startLocationSimulation];
  }
}

- (id)processData:(id)a3
{
  uint64_t v126 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock(&self->_resetLock);
  uint64_t v5 = self->_state;
  os_unfair_lock_unlock(&self->_resetLock);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_42;
    }
    id v35 = v4;
    v36 = [v35 deviceMotion];
    if ([v36 magneticFieldCalibrationLevel] != -1)
    {
      v37 = [v35 deviceMotion];
      int v38 = [v37 magneticFieldCalibrationLevel];

      if (!v38)
      {
LABEL_12:

        goto LABEL_42;
      }
      v36 = (void *)[v35 copy];
      [(ARGeoTrackingTechniqueState *)v5 setLastCMDeviceMotion:v36];
      if (self->_useCoreMotionFusion) {
        [(ARGeoTrackingTechniqueState *)v5 addDeviceMotionData:v36];
      }
    }

    goto LABEL_12;
  }
  id v6 = v4;
  float v7 = _ARLogTechnique_9();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v8);
    v89 = [v6 location];
    [v89 coordinate];
    uint64_t v11 = v10;
    v88 = [v6 location];
    [v88 coordinate];
    uint64_t v13 = v12;
    v87 = [v6 location];
    [v87 altitude];
    uint64_t v15 = v14;
    v86 = [v6 location];
    [v86 altitudeWgs84];
    uint64_t v17 = v16;
    v85 = [v6 location];
    int v82 = [v85 isAltitudeWgs84Available];
    v84 = [v6 location];
    int v81 = [v84 isCoordinateFused];
    v83 = [v6 location];
    [v83 rawCoordinate];
    uint64_t v19 = v18;
    [v6 location];
    int v20 = v91 = v4;
    [v20 rawCoordinate];
    uint64_t v22 = v21;
    [v6 location];
    __int16 v23 = v90 = v5;
    [v23 horizontalAccuracy];
    uint64_t v25 = v24;
    uint64_t v26 = [v6 location];
    [v26 rawHorizontalAccuracy];
    uint64_t v28 = v27;
    v29 = [v6 location];
    int v30 = [v29 isCoordinateFusedWithVL];
    double v31 = [v6 location];
    [v31 ellipsoidalAltitude];
    *(_DWORD *)buf = 138546691;
    v99 = v9;
    __int16 v100 = 2048;
    v101 = self;
    __int16 v102 = 2049;
    uint64_t v103 = v11;
    __int16 v104 = 2049;
    uint64_t v105 = v13;
    __int16 v106 = 2049;
    uint64_t v107 = v15;
    __int16 v108 = 2049;
    uint64_t v109 = v17;
    __int16 v110 = 1024;
    int v111 = v82;
    __int16 v112 = 1024;
    int v113 = v81;
    __int16 v114 = 2049;
    uint64_t v115 = v19;
    __int16 v116 = 2049;
    uint64_t v117 = v22;
    __int16 v118 = 2049;
    uint64_t v119 = v25;
    __int16 v120 = 2049;
    uint64_t v121 = v28;
    __int16 v122 = 1024;
    int v123 = v30;
    __int16 v124 = 2049;
    uint64_t v125 = v32;
    _os_log_impl(&dword_1B88A2000, v7, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Received new location point: lat=%{private}.8f, lon=%{private}.8f, alt=%{private}.3f, alt_wgs84=%{private}.3f, wgs84_available=%d, fused=%d, rawLat=%{private}.8f, rawLon=%{private}.8f, acc=%{private}.3f, rawAcc=%{private}.3f, fusedWithVL=%d, ellipsoidalAltitude=%{private}.3f.", buf, 0x82u);

    uint64_t v5 = v90;
    id v4 = v91;
  }
  [(ARGeoTrackingTechnique *)self _simulateReplayLocationUpdates:v6];
  v33 = [v6 location];
  if ([v33 type] == 6)
  {
    BOOL v34 = 0;
LABEL_20:

    goto LABEL_21;
  }
  v39 = [v6 location];
  int v40 = [v39 type];

  if (v40 != 10)
  {
    v33 = [v6 location];
    [v33 horizontalAccuracy];
    BOOL v34 = 0;
    if (fabs(v41) != INFINITY)
    {
      v42 = [v6 location];
      [v42 horizontalAccuracy];
      if (v43 >= 0.0)
      {
        v44 = [v6 location];
        [v44 horizontalAccuracy];
        BOOL v34 = v45 < self->_maxHorizontalAccuracy;
      }
      else
      {
        BOOL v34 = 0;
      }
    }
    goto LABEL_20;
  }
  BOOL v34 = 0;
LABEL_21:
  if (![(ARGeoTrackingTechniqueState *)v5 hasStartedAvailabilityCheck]
    && ([v6 isUndulationValid] & 1) == 0)
  {
    v54 = _ARLogTechnique_9();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
    {
      v55 = (objc_class *)objc_opt_class();
      v56 = NSStringFromClass(v55);
      *(_DWORD *)buf = 138543618;
      v99 = v56;
      __int16 v100 = 2048;
      v101 = self;
      _os_log_impl(&dword_1B88A2000, v54, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Location to set ENU origin must have undulation.", buf, 0x16u);
    }
    if ([v6 isAltitudeValid]) {
      goto LABEL_38;
    }
LABEL_35:
    v57 = _ARLogTechnique_9();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
    {
      v58 = (objc_class *)objc_opt_class();
      v59 = NSStringFromClass(v58);
      *(_DWORD *)buf = 138543618;
      v99 = v59;
      __int16 v100 = 2048;
      v101 = self;
      _os_log_impl(&dword_1B88A2000, v57, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Received location must have valid altitude.", buf, 0x16u);
    }
    goto LABEL_38;
  }
  if (([v6 isAltitudeValid] & 1) == 0) {
    goto LABEL_35;
  }
  if (v34)
  {
    v46 = _ARLogTechnique_9();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
    {
      v47 = (objc_class *)objc_opt_class();
      v48 = NSStringFromClass(v47);
      *(_DWORD *)buf = 138543618;
      v99 = v48;
      __int16 v100 = 2048;
      v101 = self;
      _os_log_impl(&dword_1B88A2000, v46, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Received location valid for geo tracking.", buf, 0x16u);
    }
    [(ARGeoTrackingTechniqueState *)v5 removeFailureReason:1024];
    v49 = [v6 copy];
    [(ARGeoTrackingTechniqueState *)v5 setLastCLLocation:v49];
    if (![(ARGeoTrackingTechniqueState *)v5 hasStartedAvailabilityCheck])
    {
      v50 = _ARLogTechnique_9();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
      {
        v51 = (objc_class *)objc_opt_class();
        v52 = NSStringFromClass(v51);
        *(_DWORD *)buf = 138543618;
        v99 = v52;
        __int16 v100 = 2048;
        v101 = self;
        _os_log_impl(&dword_1B88A2000, v50, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Received candidate location for ENU origin. Checking geo tracking availability.", buf, 0x16u);
      }
      [(ARGeoTrackingTechniqueState *)v5 setHasStartedAvailabilityCheck:1];
      [(ARGeoTrackingTechniqueState *)v5 addFailureReason:4096];
      if (self->_deterministic) {
        dispatch_semaphore_t v53 = dispatch_semaphore_create(0);
      }
      else {
        dispatch_semaphore_t v53 = 0;
      }
      v64 = [v49 location];
      [v64 coordinate];
      double v66 = v65;
      double v68 = v67;
      unint64_t v69 = [(ARGeoTrackingTechnique *)self supportEnablementOptions];
      v93[0] = MEMORY[0x1E4F143A8];
      v93[1] = 3221225472;
      v93[2] = __38__ARGeoTrackingTechnique_processData___block_invoke;
      v93[3] = &unk_1E61875A8;
      v70 = v53;
      v94 = v70;
      v95 = self;
      v96 = v5;
      v97 = v49;
      +[ARGeoTrackingConfiguration checkAvailabilityAtCoordinate:withOptions:completionHandler:](ARGeoTrackingConfiguration, "checkAvailabilityAtCoordinate:withOptions:completionHandler:", v69, v93, v66, v68);

      if (v70)
      {
        v71 = _ARLogTechnique_9();
        if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
        {
          v72 = (objc_class *)objc_opt_class();
          v73 = NSStringFromClass(v72);
          *(_DWORD *)buf = 138543618;
          v99 = v73;
          __int16 v100 = 2048;
          v101 = self;
          _os_log_impl(&dword_1B88A2000, v71, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Waiting for availability check to finish", buf, 0x16u);
        }
        dispatch_semaphore_wait(v70, 0xFFFFFFFFFFFFFFFFLL);
      }
    }
    uint64_t v74 = [(ARGeoTrackingTechniqueState *)v5 VLHandle];
    if (!v74) {
      goto LABEL_41;
    }
    v75 = (void *)v74;
    BOOL v76 = [(ARGeoTrackingTechnique *)self visualLocalizationUpdatesRequested];

    if (!v76) {
      goto LABEL_41;
    }
    v77 = _ARLogTechnique_9();
    if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
    {
      v78 = (objc_class *)objc_opt_class();
      v79 = NSStringFromClass(v78);
      *(_DWORD *)buf = 138543618;
      v99 = v79;
      __int16 v100 = 2048;
      v101 = self;
      _os_log_impl(&dword_1B88A2000, v77, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Pre-warming VL with this location.", buf, 0x16u);
    }
    v61 = [(ARGeoTrackingTechniqueState *)v5 VLHandle];
    v80 = [v6 location];
    [v61 prepareWithDeviceLocation:v80];

    goto LABEL_40;
  }
LABEL_38:
  v49 = _ARLogTechnique_9();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
  {
    v60 = (objc_class *)objc_opt_class();
    v61 = NSStringFromClass(v60);
    *(_DWORD *)buf = 138543618;
    v99 = v61;
    __int16 v100 = 2048;
    v101 = self;
    _os_log_impl(&dword_1B88A2000, v49, OS_LOG_TYPE_INFO, "%{public}@ <%p>: New location is not valid for geo tracking.", buf, 0x16u);
LABEL_40:
  }
LABEL_41:

LABEL_42:
  v92.receiver = self;
  v92.super_class = (Class)ARGeoTrackingTechnique;
  v62 = [(ARTechnique *)&v92 processData:v4];

  return v62;
}

void __38__ARGeoTrackingTechnique_processData___block_invoke(id *a1, char a2, void *a3)
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v55 = __38__ARGeoTrackingTechnique_processData___block_invoke_2;
  v56 = &unk_1E61851B0;
  id v57 = a1[4];
  os_unfair_lock_lock((os_unfair_lock_t)a1[5] + 26);
  id v6 = a1[5];
  id v7 = a1[6];
  id v8 = (id)*((void *)v6 + 14);
  os_unfair_lock_unlock((os_unfair_lock_t)v6 + 26);
  if (v7 == v8)
  {
    [a1[6] setHasReturnedAvailabilityCheck:1];
    [a1[6] removeFailureReason:4096];
    if (a2)
    {
      [a1[6] setEnuOrigin:a1[7]];
      uint64_t v13 = _ARLogTechnique_9();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        uint64_t v14 = (objc_class *)objc_opt_class();
        NSStringFromClass(v14);
        id v49 = (id)objc_claimAutoreleasedReturnValue();
        id v46 = a1[5];
        v48 = [a1[7] location];
        [v48 coordinate];
        uint64_t v16 = v15;
        v47 = [a1[7] location];
        [v47 coordinate];
        uint64_t v18 = v17;
        uint64_t v19 = [a1[7] location];
        [v19 horizontalAccuracy];
        uint64_t v21 = v20;
        uint64_t v22 = [a1[7] location];
        [v22 altitude];
        uint64_t v24 = v23;
        uint64_t v25 = [a1[7] location];
        int v26 = [v25 isAltitudeWgs84Available];
        uint64_t v27 = [a1[7] location];
        [v27 altitudeWgs84];
        uint64_t v29 = v28;
        [a1[7] timestamp];
        *(_DWORD *)buf = 138545411;
        id v59 = v49;
        __int16 v60 = 2048;
        id v61 = v46;
        __int16 v62 = 2049;
        uint64_t v63 = v16;
        __int16 v64 = 2049;
        uint64_t v65 = v18;
        __int16 v66 = 2049;
        uint64_t v67 = v21;
        __int16 v68 = 2049;
        uint64_t v69 = v24;
        __int16 v70 = 1024;
        *(_DWORD *)v71 = v26;
        *(_WORD *)&v71[4] = 2049;
        *(void *)&v71[6] = v29;
        *(_WORD *)&v71[14] = 2048;
        *(void *)&v71[16] = v30;
        _os_log_impl(&dword_1B88A2000, v13, OS_LOG_TYPE_INFO, "%{public}@ <%p>: VL ENU origin set: latitude,%{private}.08f,longitude,%{private}.08f,horizAccuracy,%{private}f,altitude,%{private}.06f,isAltitudeWgs84Available:%d,altitudeWGS84:%{private}.06f,timestamp:%.06f", buf, 0x58u);
      }
      double v31 = _ARLogTechnique_9();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        uint64_t v32 = (objc_class *)objc_opt_class();
        NSStringFromClass(v32);
        id v33 = (id)objc_claimAutoreleasedReturnValue();
        id v34 = a1[5];
        id v35 = a1[7];
        if (v35)
        {
          [v35 locationECEF];
          id v35 = a1[7];
          uint64_t v36 = v53;
          if (v35)
          {
            [v35 locationECEF];
            id v35 = a1[7];
            uint64_t v37 = v52;
            if (v35)
            {
              [v35 locationECEF];
              uint64_t v50 = v51;
              id v35 = a1[7];
            }
            else
            {
              uint64_t v50 = 0;
            }
          }
          else
          {
            uint64_t v50 = 0;
            uint64_t v37 = 0;
          }
        }
        else
        {
          uint64_t v50 = 0;
          uint64_t v37 = 0;
          uint64_t v36 = 0;
        }
        [v35 timestamp];
        *(_DWORD *)buf = 138544643;
        id v59 = v33;
        __int16 v60 = 2048;
        id v61 = v34;
        __int16 v62 = 2049;
        uint64_t v63 = v36;
        __int16 v64 = 2049;
        uint64_t v65 = v37;
        __int16 v66 = 2049;
        uint64_t v67 = v50;
        __int16 v68 = 2048;
        uint64_t v69 = v41;
        _os_log_impl(&dword_1B88A2000, v31, OS_LOG_TYPE_INFO, "%{public}@ <%p>: VL ECEFxENUorigin,%{private}f,ECEFyENUorigin,%{private}f,ECEFzENUorigin,%{private}f,ts,%f", buf, 0x3Eu);
      }
      id v42 = a1[7];
      if (v42) {
        [v42 ecefFromlocation];
      }
      uint64_t v9 = _ARLogTechnique_9();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        double v43 = (objc_class *)objc_opt_class();
        v44 = NSStringFromClass(v43);
        id v45 = a1[5];
        *(_DWORD *)buf = 138547714;
        id v59 = v44;
        __int16 v60 = 2048;
        id v61 = v45;
        __int16 v62 = 2048;
        uint64_t v63 = 0;
        __int16 v64 = 2048;
        uint64_t v65 = 0;
        __int16 v66 = 2048;
        uint64_t v67 = 0;
        __int16 v68 = 2048;
        uint64_t v69 = 0;
        __int16 v70 = 2048;
        *(void *)v71 = 0;
        *(_WORD *)&v71[8] = 2048;
        *(void *)&v71[10] = 0;
        *(_WORD *)&v71[18] = 2048;
        *(void *)&v71[20] = 0;
        __int16 v72 = 2048;
        uint64_t v73 = 0;
        __int16 v74 = 2048;
        uint64_t v75 = 0;
        __int16 v76 = 2048;
        uint64_t v77 = 0;
        __int16 v78 = 2048;
        uint64_t v79 = 0;
        __int16 v80 = 2048;
        uint64_t v81 = 0;
        __int16 v82 = 2048;
        uint64_t v83 = 0;
        __int16 v84 = 2048;
        uint64_t v85 = 0;
        __int16 v86 = 2048;
        uint64_t v87 = 0;
        __int16 v88 = 2048;
        uint64_t v89 = 0;
        _os_log_impl(&dword_1B88A2000, v9, OS_LOG_TYPE_INFO, "%{public}@ <%p>: ECEFxENUorigin:-ecefFromEnu %f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f", buf, 0xB6u);
      }
    }
    else
    {
      [a1[6] addFailureReason:512];
      [a1[5] _setTrackingState:0 techniqueStateObject:a1[6]];
      uint64_t v9 = _ARLogTechnique_9();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v38 = (objc_class *)objc_opt_class();
        v39 = NSStringFromClass(v38);
        id v40 = a1[5];
        *(_DWORD *)buf = 138543618;
        id v59 = v39;
        __int16 v60 = 2048;
        id v61 = v40;
        _os_log_impl(&dword_1B88A2000, v9, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Geo tracking is not available at received location. Cannot run geo tracking.", buf, 0x16u);
      }
    }
  }
  else
  {
    uint64_t v9 = _ARLogTechnique_9();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = (objc_class *)objc_opt_class();
      uint64_t v11 = NSStringFromClass(v10);
      id v12 = a1[5];
      *(_DWORD *)buf = 138543618;
      id v59 = v11;
      __int16 v60 = 2048;
      id v61 = v12;
      _os_log_impl(&dword_1B88A2000, v9, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Geo tracking was reset while availability check was running.", buf, 0x16u);
    }
  }

  v55((uint64_t)v54);
}

NSObject *__38__ARGeoTrackingTechnique_processData___block_invoke_2(uint64_t a1)
{
  result = *(NSObject **)(a1 + 32);
  if (result) {
    return dispatch_semaphore_signal(result);
  }
  return result;
}

- (void)requestResultDataAtTimestamp:(double)a3 context:(id)a4
{
  STACK[0xC48] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  ++self->_requestResultDataAtTimestampCallCount;
  [(ARGeoTrackingTechniqueState *)self->_state firstRequestResultTimestamp];
  if (v7 <= 0.0) {
    [(ARGeoTrackingTechniqueState *)self->_state setFirstRequestResultTimestamp:a3];
  }
  id v8 = [v6 imageData];
  uint64_t v9 = [v8 cameraType];
  int v10 = ARIsSupportedAVCaptureDeviceTypeForRearCameraBackdrop(v9);

  if (v10)
  {
    uint64_t v11 = [v6 resultDataOfClass:objc_opt_class()];
    id v12 = &OBJC_IVAR___ARFrame__exifData;
    if (![v11 count])
    {
      [(ARGeoTrackingTechniqueState *)self->_state firstRequestResultTimestamp];
      if (a3 - v25 > 1.5) {
        [(ARGeoTrackingTechniqueState *)self->_state addFailureReason:64];
      }
      goto LABEL_85;
    }
    uint64_t v13 = [v11 objectAtIndexedSubscript:0];
    [(ARGeoTrackingTechniqueState *)self->_state lastPoseOriginTimestamp];
    if (v14 == 0.0)
    {
      uint64_t v15 = [v13 worldTrackingState];
      [v15 originTimestamp];
      -[ARGeoTrackingTechniqueState setLastPoseOriginTimestamp:](self->_state, "setLastPoseOriginTimestamp:");
    }
    uint64_t v16 = [v13 worldTrackingState];
    [v16 originTimestamp];
    double v18 = v17;
    [(ARGeoTrackingTechniqueState *)self->_state lastPoseOriginTimestamp];
    double v20 = v19;

    if (v18 > v20)
    {
      os_unfair_lock_lock(&self->_resetLock);
      uint64_t v21 = [[ARGeoTrackingTechniqueState alloc] initWithResetCount:[(ARGeoTrackingTechniqueState *)self->_state resetCount] + 1];
      state = self->_state;
      self->_state = v21;

      uint64_t v23 = [v13 worldTrackingState];
      [v23 originTimestamp];
      -[ARGeoTrackingTechniqueState setLastPoseOriginTimestamp:](self->_state, "setLastPoseOriginTimestamp:");

      if (self->_auditToken) {
        uint64_t v24 = [objc_alloc(MEMORY[0x1E4FB4110]) initWithAuditToken:self->_auditToken];
      }
      else {
        uint64_t v24 = objc_opt_new();
      }
      int v26 = (void *)v24;
      [(ARGeoTrackingTechniqueState *)self->_state setVLHandle:v24];

      BOOL useVLTraceRecorder = self->_useVLTraceRecorder;
      uint64_t v28 = [(ARGeoTrackingTechniqueState *)self->_state VLHandle];
      [v28 _setDebugInfoShouldPreserveImageData:useVLTraceRecorder];

      os_unfair_lock_unlock(&self->_resetLock);
      uint64_t v29 = _ARLogTechnique_9();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        uint64_t v30 = (objc_class *)objc_opt_class();
        double v31 = NSStringFromClass(v30);
        uint64_t v32 = [(ARGeoTrackingTechniqueState *)self->_state VLHandle];
        LODWORD(STACK[0xB90]) = 138543874;
        STACK[0xB94] = (unint64_t)v31;
        LOWORD(STACK[0xB9C]) = 2048;
        STACK[0xB9E] = (unint64_t)self;
        LOWORD(STACK[0xBA6]) = 2048;
        STACK[0xBA8] = (unint64_t)v32;
        _os_log_impl(&dword_1B88A2000, v29, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Reset detected. VLHandle created,%p", (uint8_t *)&STACK[0xB90], 0x20u);
      }
    }
    *(_OWORD *)&STACK[0xB80] = 0u;
    *(_OWORD *)&STACK[0xB70] = 0u;
    *(_OWORD *)&STACK[0xB60] = 0u;
    *(_OWORD *)&STACK[0xB50] = 0u;
    *(_OWORD *)&STACK[0xB40] = 0u;
    *(_OWORD *)&STACK[0xB30] = 0u;
    *(_OWORD *)&STACK[0xB20] = 0u;
    *(_OWORD *)&STACK[0xB10] = 0u;
    [v13 visionCameraTransform];
    ARMatrix4x4FloatToDouble((float64x2_t *)&STACK[0xA90], v33, v34, v35, v36);
    long long v37 = *(_OWORD *)&STACK[0xAE0];
    *(_OWORD *)&STACK[0xBD0] = *(_OWORD *)&STACK[0xAD0];
    *(_OWORD *)&STACK[0xBE0] = v37;
    long long v38 = *(_OWORD *)&STACK[0xB00];
    *(_OWORD *)&STACK[0xBF0] = *(_OWORD *)&STACK[0xAF0];
    *(_OWORD *)&STACK[0xC00] = v38;
    long long v39 = *(_OWORD *)&STACK[0xAA0];
    *(_OWORD *)&STACK[0xB90] = *(_OWORD *)&STACK[0xA90];
    *(_OWORD *)&STACK[0xBA0] = v39;
    long long v40 = *(_OWORD *)&STACK[0xAC0];
    *(_OWORD *)&STACK[0xBB0] = *(_OWORD *)&STACK[0xAB0];
    *(_OWORD *)&STACK[0xBC0] = v40;
    __invert_d4();
    long double v41 = acos(*(long double *)&STACK[0xB60]) * 0.318309886;
    double v42 = v41 * 180.0;
    *(float *)&long double v41 = v41 * 180.0;
    BOOL v43 = +[ARGeoTrackingTechnique isCameraUp:(double)v41];
    v44 = self->_state;
    if (v43) {
      [(ARGeoTrackingTechniqueState *)v44 removeFailureReason:128];
    }
    else {
      [(ARGeoTrackingTechniqueState *)v44 addFailureReason:128];
    }
    id v45 = [v13 worldTrackingState];
    uint64_t v46 = [v45 vioTrackingState];

    v47 = self->_state;
    if (v46) {
      [(ARGeoTrackingTechniqueState *)v47 addFailureReason:64];
    }
    else {
      [(ARGeoTrackingTechniqueState *)v47 removeFailureReason:64];
    }
    if (([(ARGeoTrackingTechniqueState *)self->_state failureReasons] & 0x40) != 0
      || ([(ARGeoTrackingTechniqueState *)self->_state failureReasons] & 0x80) != 0)
    {
LABEL_84:

      id v12 = &OBJC_IVAR___ARFrame__exifData;
LABEL_85:
      [v8 timestamp];
      -[ARGeoTrackingTechnique _updateVLStateData:](self, "_updateVLStateData:");
      v187 = (os_unfair_lock_s *)((char *)self + v12[314]);
      os_unfair_lock_lock(v187);
      id v188 = objc_alloc(MEMORY[0x1E4F1C978]);
      v189 = [(ARGeoTrackingTechniqueState *)self->_state resultDatas];
      v190 = (void *)[v188 initWithArray:v189];

      uint64_t v191 = [(ARGeoTrackingTechniqueState *)self->_state resultDatas];
      [(id)v191 removeAllObjects];

      os_unfair_lock_unlock(v187);
      v192 = [(ARTechnique *)self delegate];
      LOBYTE(v191) = objc_opt_respondsToSelector();

      if (v191)
      {
        v193 = [(ARTechnique *)self delegate];
        [v193 technique:self didOutputResultData:v190 timestamp:v6 context:a3];
      }
      goto LABEL_88;
    }
    [(ARGeoTrackingTechniqueState *)self->_state removeFailureReason:64];
    [(ARGeoTrackingTechniqueState *)self->_state addVioPoseData:v13];
    if ([(ARGeoTrackingTechniqueState *)self->_state VLHasExecuted])
    {
      v48 = [(ARGeoTrackingTechniqueState *)self->_state lastCLLocation];
      if (self->_useCoreLocationFusion || self->_useCoreMotionFusion) {
        [(ARGeoTrackingTechnique *)self _estimateEnuFromVioFromCLCM:v48];
      }
      v201 = v8;
      if (self->_useGradualCorrection)
      {
        *(_OWORD *)&STACK[0xA80] = 0u;
        *(_OWORD *)&STACK[0xA70] = 0u;
        *(_OWORD *)&STACK[0xA60] = 0u;
        *(_OWORD *)&STACK[0xA50] = 0u;
        *(_OWORD *)&STACK[0xA40] = 0u;
        *(_OWORD *)&STACK[0xA20] = 0u;
        *(_OWORD *)&STACK[0xA30] = 0u;
        *(_OWORD *)&STACK[0xA10] = 0u;
        [v13 visionCameraTransform];
        uint64_t v53 = [(ARGeoTrackingTechniqueState *)self->_state gradualCorrectionFilter];
        [v13 timestamp];
        long long v54 = *(_OWORD *)&STACK[0xA60];
        *(_OWORD *)&STACK[0xBD0] = *(_OWORD *)&STACK[0xA50];
        *(_OWORD *)&STACK[0xBE0] = v54;
        long long v55 = *(_OWORD *)&STACK[0xA80];
        *(_OWORD *)&STACK[0xBF0] = *(_OWORD *)&STACK[0xA70];
        *(_OWORD *)&STACK[0xC00] = v55;
        long long v56 = *(_OWORD *)&STACK[0xA20];
        *(_OWORD *)&STACK[0xB90] = *(_OWORD *)&STACK[0xA10];
        *(_OWORD *)&STACK[0xBA0] = v56;
        long long v57 = *(_OWORD *)&STACK[0xA40];
        *(_OWORD *)&STACK[0xBB0] = *(_OWORD *)&STACK[0xA30];
        *(_OWORD *)&STACK[0xBC0] = v57;
        objc_msgSend(v53, "updateWithVIOPose:timestamp:", &STACK[0xB90]);

        *(_OWORD *)&STACK[0x9F0] = 0u;
        *(_OWORD *)&STACK[0xA00] = 0u;
        *(_OWORD *)&STACK[0x9D0] = 0u;
        *(_OWORD *)&STACK[0x9E0] = 0u;
        *(_OWORD *)&STACK[0x9B0] = 0u;
        *(_OWORD *)&STACK[0x9C0] = 0u;
        *(_OWORD *)&STACK[0x990] = 0u;
        *(_OWORD *)&STACK[0x9A0] = 0u;
        v58 = [(ARGeoTrackingTechniqueState *)self->_state gradualCorrectionFilter];
        int v59 = [v58 getCurrentENUFromVIO:&STACK[0x990]];

        if (v59)
        {
          long long v60 = *(_OWORD *)&STACK[0x9E0];
          *(_OWORD *)&STACK[0x950] = *(_OWORD *)&STACK[0x9D0];
          *(_OWORD *)&STACK[0x960] = v60;
          long long v61 = *(_OWORD *)&STACK[0xA00];
          *(_OWORD *)&STACK[0x970] = *(_OWORD *)&STACK[0x9F0];
          *(_OWORD *)&STACK[0x980] = v61;
          long long v62 = *(_OWORD *)&STACK[0x9A0];
          *(_OWORD *)&STACK[0x910] = *(_OWORD *)&STACK[0x990];
          *(_OWORD *)&STACK[0x920] = v62;
          long long v63 = *(_OWORD *)&STACK[0x9C0];
          *(_OWORD *)&STACK[0x930] = *(_OWORD *)&STACK[0x9B0];
          *(_OWORD *)&STACK[0x940] = v63;
          [(ARGeoTrackingTechniqueState *)self->_state setEnuFromVIO:&STACK[0x910]];
          long long v64 = *(_OWORD *)&STACK[0x9E0];
          *(_OWORD *)&STACK[0xBD0] = *(_OWORD *)&STACK[0x9D0];
          *(_OWORD *)&STACK[0xBE0] = v64;
          long long v65 = *(_OWORD *)&STACK[0xA00];
          *(_OWORD *)&STACK[0xBF0] = *(_OWORD *)&STACK[0x9F0];
          *(_OWORD *)&STACK[0xC00] = v65;
          long long v66 = *(_OWORD *)&STACK[0x9A0];
          *(_OWORD *)&STACK[0xB90] = *(_OWORD *)&STACK[0x990];
          *(_OWORD *)&STACK[0xBA0] = v66;
          long long v67 = *(_OWORD *)&STACK[0x9C0];
          *(_OWORD *)&STACK[0xBB0] = *(_OWORD *)&STACK[0x9B0];
          *(_OWORD *)&STACK[0xBC0] = v67;
          __invert_d4();
          double v68 = ARMatrix4x4DoubleToFloat(v231);
          double v196 = v69;
          double latitudea = v68;
          double v194 = v71;
          double v195 = v70;
          __int16 v72 = [ARGeoTrackingData alloc];
          uint64_t v73 = [(ARGeoTrackingTechniqueState *)self->_state enuOrigin];
          __int16 v74 = -[ARGeoTrackingData initWithENUOrigin:vioFromENU:](v72, "initWithENUOrigin:vioFromENU:", v73, latitudea, v196, v195, v194);

          os_unfair_lock_lock(&self->_resultLock);
          uint64_t v75 = [(ARGeoTrackingTechniqueState *)self->_state resultDatas];
          [v75 addObject:v74];

          os_unfair_lock_unlock(&self->_resultLock);
        }
      }
      *(_OWORD *)&STACK[0xC00] = 0u;
      *(_OWORD *)&STACK[0xBF0] = 0u;
      *(_OWORD *)&STACK[0xBE0] = 0u;
      *(_OWORD *)&STACK[0xBD0] = 0u;
      *(_OWORD *)&STACK[0xBC0] = 0u;
      *(_OWORD *)&STACK[0xBB0] = 0u;
      *(_OWORD *)&STACK[0xBA0] = 0u;
      *(_OWORD *)&STACK[0xB90] = 0u;
      __int16 v76 = [(ARGeoTrackingTechniqueState *)self->_state enuOrigin];
      uint64_t v77 = v76;
      if (v76)
      {
        [v76 ecefFromlocation];
      }
      else
      {
        *(_OWORD *)&STACK[0xC00] = 0u;
        *(_OWORD *)&STACK[0xBF0] = 0u;
        *(_OWORD *)&STACK[0xBE0] = 0u;
        *(_OWORD *)&STACK[0xBD0] = 0u;
        *(_OWORD *)&STACK[0xBC0] = 0u;
        *(_OWORD *)&STACK[0xBB0] = 0u;
        *(_OWORD *)&STACK[0xBA0] = 0u;
        *(_OWORD *)&STACK[0xB90] = 0u;
      }

      __int16 v78 = self->_state;
      if (v78)
      {
        [(ARGeoTrackingTechniqueState *)v78 enuFromVIO];
        float64x2_t v79 = v223;
        float64x2_t v80 = v224;
        float64x2_t v81 = v225;
        float64x2_t v82 = v226;
        float64x2_t v84 = v227;
        float64x2_t v83 = v228;
        float64x2_t v85 = v229;
        float64x2_t v86 = v230;
      }
      else
      {
        float64x2_t v85 = 0uLL;
        float64x2_t v229 = 0u;
        float64x2_t v230 = 0u;
        float64x2_t v86 = 0uLL;
        float64x2_t v227 = 0u;
        float64x2_t v228 = 0u;
        float64x2_t v225 = 0u;
        float64x2_t v226 = 0u;
        float64x2_t v84 = 0uLL;
        float64x2_t v83 = 0uLL;
        float64x2_t v81 = 0uLL;
        float64x2_t v82 = 0uLL;
        float64x2_t v79 = 0uLL;
        float64x2_t v80 = 0uLL;
        float64x2_t v223 = 0u;
        float64x2_t v224 = 0u;
      }
      uint64_t v87 = 0;
      long long v88 = *(_OWORD *)&STACK[0xB60];
      *(_OWORD *)&STACK[0x9D0] = *(_OWORD *)&STACK[0xB50];
      *(_OWORD *)&STACK[0x9E0] = v88;
      long long v89 = *(_OWORD *)&STACK[0xB80];
      *(_OWORD *)&STACK[0x9F0] = *(_OWORD *)&STACK[0xB70];
      *(_OWORD *)&STACK[0xA00] = v89;
      long long v90 = *(_OWORD *)&STACK[0xB20];
      *(_OWORD *)&STACK[0x990] = *(_OWORD *)&STACK[0xB10];
      *(_OWORD *)&STACK[0x9A0] = v90;
      long long v91 = *(_OWORD *)&STACK[0xB40];
      *(_OWORD *)&STACK[0x9B0] = *(_OWORD *)&STACK[0xB30];
      *(_OWORD *)&STACK[0x9C0] = v91;
      *(_OWORD *)&STACK[0xA10] = 0u;
      *(_OWORD *)&STACK[0xA20] = 0u;
      *(_OWORD *)&STACK[0xA30] = 0u;
      *(_OWORD *)&STACK[0xA40] = 0u;
      *(_OWORD *)&STACK[0xA50] = 0u;
      *(_OWORD *)&STACK[0xA60] = 0u;
      *(_OWORD *)&STACK[0xA70] = 0u;
      *(_OWORD *)&STACK[0xA80] = 0u;
      do
      {
        float64x2_t v93 = *(float64x2_t *)((char *)&STACK[0x990] + v87);
        float64x2_t v92 = *(float64x2_t *)((char *)&STACK[0x990] + v87 + 16);
        v94 = (float64x2_t *)((char *)&STACK[0xA10] + v87);
        float64x2_t *v94 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v79, v93.f64[0]), v81, v93, 1), v84, v92.f64[0]), v85, v92, 1);
        v94[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v80, v93.f64[0]), v82, v93, 1), v83, v92.f64[0]), v86, v92, 1);
        v87 += 32;
      }
      while (v87 != 128);
      uint64_t v95 = 0;
      float64x2_t v96 = *(float64x2_t *)&STACK[0xBA0];
      float64x2_t v97 = *(float64x2_t *)&STACK[0xB90];
      float64x2_t v98 = *(float64x2_t *)&STACK[0xBC0];
      float64x2_t v99 = *(float64x2_t *)&STACK[0xBB0];
      float64x2_t v100 = *(float64x2_t *)&STACK[0xBE0];
      float64x2_t v101 = *(float64x2_t *)&STACK[0xBD0];
      float64x2_t v102 = *(float64x2_t *)&STACK[0xC00];
      float64x2_t v103 = *(float64x2_t *)&STACK[0xBF0];
      long long v104 = *(_OWORD *)&STACK[0xA60];
      long long v219 = *(_OWORD *)&STACK[0xA50];
      long long v220 = v104;
      long long v105 = *(_OWORD *)&STACK[0xA80];
      long long v221 = *(_OWORD *)&STACK[0xA70];
      long long v222 = v105;
      long long v106 = *(_OWORD *)&STACK[0xA20];
      long long v215 = *(_OWORD *)&STACK[0xA10];
      long long v216 = v106;
      long long v107 = *(_OWORD *)&STACK[0xA40];
      long long v217 = *(_OWORD *)&STACK[0xA30];
      long long v218 = v107;
      *(_OWORD *)&STACK[0x9F0] = 0u;
      *(_OWORD *)&STACK[0xA00] = 0u;
      *(_OWORD *)&STACK[0x9D0] = 0u;
      *(_OWORD *)&STACK[0x9E0] = 0u;
      *(_OWORD *)&STACK[0x9B0] = 0u;
      *(_OWORD *)&STACK[0x9C0] = 0u;
      *(_OWORD *)&STACK[0x990] = 0u;
      *(_OWORD *)&STACK[0x9A0] = 0u;
      do
      {
        float64x2_t v109 = *(float64x2_t *)((char *)&v215 + v95);
        float64x2_t v108 = *(float64x2_t *)((char *)&v215 + v95 + 16);
        __int16 v110 = (float64x2_t *)((char *)&STACK[0x990] + v95);
        *__int16 v110 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v97, v109.f64[0]), v99, v109, 1), v101, v108.f64[0]), v103, v108, 1);
        v110[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v96, v109.f64[0]), v98, v109, 1), v100, v108.f64[0]), v102, v108, 1);
        v95 += 32;
      }
      while (v95 != 128);
      ARECEFToLLA(&v213);
      *(int8x16_t *)latitudeb = v213;
      double v111 = v214;
      __int16 v112 = objc_opt_class();
      long long v113 = *(_OWORD *)&STACK[0xA60];
      long long v219 = *(_OWORD *)&STACK[0xA50];
      long long v220 = v113;
      long long v114 = *(_OWORD *)&STACK[0xA80];
      long long v221 = *(_OWORD *)&STACK[0xA70];
      long long v222 = v114;
      long long v115 = *(_OWORD *)&STACK[0xA20];
      long long v215 = *(_OWORD *)&STACK[0xA10];
      long long v216 = v115;
      long long v116 = *(_OWORD *)&STACK[0xA40];
      long long v217 = *(_OWORD *)&STACK[0xA30];
      long long v218 = v116;
      [v112 getHeadingForEnuFromCam:&v215];
      double v118 = v117 * 0.318309886 * 180.0;
      uint64_t v119 = [(ARGeoTrackingTechniqueState *)self->_state enuOrigin];
      [v119 undulation];
      double v121 = ARWGS84ToMSLAltitude(v111, v120);

      __int16 v122 = [ARLocationEstimationData alloc];
      CLLocationCoordinate2D v123 = CLLocationCoordinate2DMake(latitudeb[0], latitudeb[1]);
      __int16 v124 = -[ARLocationEstimationData initWithCoordinates:altitude:heading:](v122, "initWithCoordinates:altitude:heading:", v123.latitude, v123.longitude, v121, v118);
      os_unfair_lock_lock(&self->_resultLock);
      uint64_t v125 = [(ARGeoTrackingTechniqueState *)self->_state resultDatas];
      [v125 addObject:v124];

      os_unfair_lock_unlock(&self->_resultLock);
      id v8 = v201;
    }
    if (0xEEEEEEEEEEEEEEEFLL * self->_requestResultDataAtTimestampCallCount + 0x888888888888888 > 0x1111111111111110)
    {
LABEL_69:
      uint64_t v167 = [(ARGeoTrackingTechniqueState *)self->_state lastCMDeviceMotion];
      if (v167)
      {
        v168 = (void *)v167;
        uint64_t v169 = [(ARGeoTrackingTechniqueState *)self->_state lastCLLocation];
        if (v169)
        {
          v170 = (void *)v169;
          v171 = [(ARGeoTrackingTechniqueState *)self->_state enuOrigin];

          if (v171)
          {
            [(ARGeoTrackingTechniqueState *)self->_state firstVLExecutionAttemptTimestamp];
            if (v172 < 0.0)
            {
              [v8 timestamp];
              -[ARGeoTrackingTechniqueState setFirstVLExecutionAttemptTimestamp:](self->_state, "setFirstVLExecutionAttemptTimestamp:");
            }
            [v8 timestamp];
            double v174 = v173;
            [(ARGeoTrackingTechniqueState *)self->_state firstVLExecutionAttemptTimestamp];
            double v176 = v174 - v175;
            [(ARGeoTrackingTechnique *)self visualLocalizationCallIntervalTimeThreshold];
            if (v176 >= v177) {
              [(ARGeoTrackingTechnique *)self posteriorVisualLocalizationCallInterval];
            }
            else {
              [(ARGeoTrackingTechnique *)self visualLocalizationCallInterval];
            }
            double v179 = v178;
            if (![(ARGeoTrackingTechnique *)self VLPoseEstimationExecuting])
            {
              if ([(ARGeoTrackingTechnique *)self visualLocalizationUpdatesRequested])
              {
                [v8 timestamp];
                double v181 = v180;
                [(ARGeoTrackingTechniqueState *)self->_state lastVLExecutionAttemptTimestamp];
                if (v181 - v182 > v179)
                {
                  [v8 timestamp];
                  -[ARGeoTrackingTechniqueState setLastVLExecutionAttemptTimestamp:](self->_state, "setLastVLExecutionAttemptTimestamp:");
                  [(ARGeoTrackingTechniqueState *)self->_state setFailureReasons:0];
                  v183 = _ARLogTechnique_9();
                  if (os_log_type_enabled(v183, OS_LOG_TYPE_INFO))
                  {
                    v184 = (objc_class *)objc_opt_class();
                    v185 = NSStringFromClass(v184);
                    [MEMORY[0x1E4FB4110] minimumTiltAngle];
                    LODWORD(STACK[0xB90]) = 138544130;
                    STACK[0xB94] = (unint64_t)v185;
                    LOWORD(STACK[0xB9C]) = 2048;
                    STACK[0xB9E] = (unint64_t)self;
                    LOWORD(STACK[0xBA6]) = 2048;
                    *(double *)&STACK[0xBA8] = v42;
                    LOWORD(STACK[0xBB0]) = 2048;
                    *(double *)&STACK[0xBB2] = 180.0 - v186;
                    _os_log_impl(&dword_1B88A2000, v183, OS_LOG_TYPE_INFO, "%{public}@ <%p>: pitchDegs<- %f minimumTiltAngle<- %f", (uint8_t *)&STACK[0xB90], 0x2Au);
                  }
                  [(ARGeoTrackingTechnique *)self _estimatePose:v8 pose:v13];
                }
              }
            }
          }
        }
        else
        {
        }
      }
      goto LABEL_84;
    }
    if ([(ARGeoTrackingTechniqueState *)self->_state trackingState] == 3)
    {
      *(_OWORD *)&STACK[0xA80] = 0u;
      *(_OWORD *)&STACK[0xA70] = 0u;
      *(_OWORD *)&STACK[0xA60] = 0u;
      *(_OWORD *)&STACK[0xA50] = 0u;
      *(_OWORD *)&STACK[0xA40] = 0u;
      *(_OWORD *)&STACK[0xA20] = 0u;
      *(_OWORD *)&STACK[0xA30] = 0u;
      *(_OWORD *)&STACK[0xA10] = 0u;
      uint64_t v126 = self->_state;
      if (v126)
      {
        [(ARGeoTrackingTechniqueState *)v126 enuFromVIO];
      }
      else
      {
        long long v211 = 0uLL;
        long long v212 = 0uLL;
        long long v209 = 0uLL;
        long long v210 = 0uLL;
        long long v207 = 0uLL;
        long long v208 = 0uLL;
        long long v205 = 0uLL;
        long long v206 = 0uLL;
      }
      *(_OWORD *)&STACK[0xBD0] = v209;
      *(_OWORD *)&STACK[0xBE0] = v210;
      *(_OWORD *)&STACK[0xBF0] = v211;
      *(_OWORD *)&STACK[0xC00] = v212;
      *(_OWORD *)&STACK[0xB90] = v205;
      *(_OWORD *)&STACK[0xBA0] = v206;
      *(_OWORD *)&STACK[0xBB0] = v207;
      *(_OWORD *)&STACK[0xBC0] = v208;
      __invert_d4();
      v127 = _ARLogTechnique_9();
      if (os_log_type_enabled(v127, OS_LOG_TYPE_INFO))
      {
        v128 = (objc_class *)objc_opt_class();
        v129 = NSStringFromClass(v128);
        long long v131 = *(_OWORD *)&STACK[0xA10];
        long long v130 = *(_OWORD *)&STACK[0xA20];
        long long v132 = *(_OWORD *)&STACK[0xA40];
        long long v133 = *(_OWORD *)&STACK[0xA30];
        long long v134 = *(_OWORD *)&STACK[0xA60];
        long long v135 = *(_OWORD *)&STACK[0xA50];
        long long v136 = *(_OWORD *)&STACK[0xA80];
        long long v137 = *(_OWORD *)&STACK[0xA70];
        LODWORD(STACK[0xB90]) = 138547714;
        STACK[0xB94] = (unint64_t)v129;
        LOWORD(STACK[0xB9C]) = 2048;
        STACK[0xB9E] = (unint64_t)self;
        LOWORD(STACK[0xBA6]) = 2048;
        STACK[0xBA8] = v131;
        LOWORD(STACK[0xBB0]) = 2048;
        STACK[0xBB2] = v133;
        LOWORD(STACK[0xBBA]) = 2048;
        STACK[0xBBC] = v135;
        LOWORD(STACK[0xBC4]) = 2048;
        STACK[0xBC6] = v137;
        LOWORD(STACK[0xBCE]) = 2048;
        STACK[0xBD0] = *((void *)&v131 + 1);
        LOWORD(STACK[0xBD8]) = 2048;
        STACK[0xBDA] = *((void *)&v133 + 1);
        LOWORD(STACK[0xBE2]) = 2048;
        STACK[0xBE4] = *((void *)&v135 + 1);
        LOWORD(STACK[0xBEC]) = 2048;
        STACK[0xBEE] = *((void *)&v137 + 1);
        LOWORD(STACK[0xBF6]) = 2048;
        STACK[0xBF8] = v130;
        LOWORD(STACK[0xC00]) = 2048;
        STACK[0xC02] = v132;
        LOWORD(STACK[0xC0A]) = 2048;
        STACK[0xC0C] = v134;
        LOWORD(STACK[0xC14]) = 2048;
        STACK[0xC16] = v136;
        LOWORD(STACK[0xC1E]) = 2048;
        STACK[0xC20] = *((void *)&v130 + 1);
        LOWORD(STACK[0xC28]) = 2048;
        STACK[0xC2A] = *((void *)&v132 + 1);
        LOWORD(STACK[0xC32]) = 2048;
        STACK[0xC34] = *((void *)&v134 + 1);
        LOWORD(STACK[0xC3C]) = 2048;
        STACK[0xC3E] = *((void *)&v136 + 1);
        _os_log_impl(&dword_1B88A2000, v127, OS_LOG_TYPE_INFO, "%{public}@ <%p>: anchorsForCameraWithTransform:vioFromENU<- %f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f", (uint8_t *)&STACK[0xB90], 0xB6u);
      }
    }
    [v13 visionCameraTransform];
    simd_float4x4 v233 = __invert_f4(v232);
    *(double *)v233.columns[0].i64 = v233.columns[3].f32[2];
    float64x2_t latitude = (float64x2_t)v233.columns[0];
    int8x16_t v202 = (int8x16_t)vcvtq_f64_f32(*(float32x2_t *)v233.columns[3].f32);
    [(ARGeoTrackingTechniqueState *)self->_state lastLoggedVioTimestamp];
    double v138 = 0.0;
    if (v139 >= 0.0)
    {
      [(ARGeoTrackingTechniqueState *)self->_state lastLoggedVioTimestamp];
      double v142 = a3 - v141;
      if (a3 - v141 > 0.0)
      {
        unint64_t v143 = vextq_s8(v202, v202, 8uLL).u64[0];
        v144 = self->_state;
        if (v144)
        {
          unint64_t v197 = v143;
          [(ARGeoTrackingTechniqueState *)v144 lastLoggedVioPosition];
          unint64_t v143 = v197;
          float64x2_t v145 = (float64x2_t)var20[2];
          unint64_t v146 = vextq_s8((int8x16_t)v145, (int8x16_t)v145, 8uLL).u64[0];
          v140.f64[0] = v204;
        }
        else
        {
          v145.f64[0] = 0.0;
          unint64_t v146 = 0;
          v140.f64[0] = 0.0;
        }
        *(void *)&v145.f64[1] = v146;
        *(void *)&v147.f64[0] = v202.i64[0];
        *(void *)&v147.f64[1] = v143;
        float64x2_t v148 = vsubq_f64(v147, v145);
        float64x2_t v149 = vsubq_f64(latitude, v140);
        double v138 = sqrt(vmulq_f64(v149, v149).f64[0] + vaddvq_f64(vmulq_f64(v148, v148))) / v142;
      }
    }
    v150 = [v13 worldTrackingState];
    uint64_t v151 = [v150 vioTrackingState];

    v152 = _ARLogTechnique_9();
    BOOL v153 = os_log_type_enabled(v152, OS_LOG_TYPE_INFO);
    if (v151)
    {
      if (v153)
      {
        v154 = (objc_class *)objc_opt_class();
        v155 = NSStringFromClass(v154);
        int64_t v156 = [(ARGeoTrackingTechniqueState *)self->_state resetCount];
        LODWORD(STACK[0xB90]) = 138543874;
        STACK[0xB94] = (unint64_t)v155;
        LOWORD(STACK[0xB9C]) = 2048;
        STACK[0xB9E] = (unint64_t)self;
        LOWORD(STACK[0xBA6]) = 2048;
        STACK[0xBA8] = v156;
        v157 = "%{public}@ <%p>: _VIO<state: limited resets= %ld";
LABEL_61:
        _os_log_impl(&dword_1B88A2000, v152, OS_LOG_TYPE_INFO, v157, (uint8_t *)&STACK[0xB90], 0x20u);
      }
    }
    else if (v153)
    {
      v158 = (objc_class *)objc_opt_class();
      v155 = NSStringFromClass(v158);
      int64_t v159 = [(ARGeoTrackingTechniqueState *)self->_state resetCount];
      LODWORD(STACK[0xB90]) = 138543874;
      STACK[0xB94] = (unint64_t)v155;
      LOWORD(STACK[0xB9C]) = 2048;
      STACK[0xB9E] = (unint64_t)self;
      LOWORD(STACK[0xBA6]) = 2048;
      STACK[0xBA8] = v159;
      v157 = "%{public}@ <%p>: _VIO<state: nominal resets= %ld";
      goto LABEL_61;
    }

    [(ARGeoTrackingTechniqueState *)self->_state setLastLoggedVioTimestamp:a3];
    v160 = self->_state;
    var20[0] = v202;
    var20[1] = latitude;
    [(ARGeoTrackingTechniqueState *)v160 setLastLoggedVioPosition:var20];
    v161 = _ARLogTechnique_9();
    if (os_log_type_enabled(v161, OS_LOG_TYPE_INFO))
    {
      v162 = (objc_class *)objc_opt_class();
      v163 = NSStringFromClass(v162);
      LODWORD(STACK[0xB90]) = 138543874;
      STACK[0xB94] = (unint64_t)v163;
      LOWORD(STACK[0xB9C]) = 2048;
      STACK[0xB9E] = (unint64_t)self;
      LOWORD(STACK[0xBA6]) = 2048;
      *(double *)&STACK[0xBA8] = v138;
      _os_log_impl(&dword_1B88A2000, v161, OS_LOG_TYPE_INFO, "%{public}@ <%p>: _VIO< speed: %f m/s", (uint8_t *)&STACK[0xB90], 0x20u);
    }
    if (v138 > 5.0)
    {
      v164 = _ARLogTechnique_9();
      if (os_log_type_enabled(v164, OS_LOG_TYPE_ERROR))
      {
        v165 = (objc_class *)objc_opt_class();
        v166 = NSStringFromClass(v165);
        LODWORD(STACK[0xB90]) = 138544642;
        STACK[0xB94] = (unint64_t)v166;
        LOWORD(STACK[0xB9C]) = 2048;
        STACK[0xB9E] = (unint64_t)self;
        LOWORD(STACK[0xBA6]) = 2048;
        *(double *)&STACK[0xBA8] = v138;
        LOWORD(STACK[0xBB0]) = 2048;
        STACK[0xBB2] = v202.i64[0];
        LOWORD(STACK[0xBBA]) = 2048;
        STACK[0xBBC] = v202.u64[1];
        LOWORD(STACK[0xBC4]) = 2048;
        STACK[0xBC6] = *(void *)&latitude.f64[0];
        _os_log_impl(&dword_1B88A2000, v164, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: _VIO< speed EXCESSIVE: %f m/s at position:(%f,%f,%f)", (uint8_t *)&STACK[0xB90], 0x3Eu);
      }
    }
    [v13 visionCameraTransform];
    -[ARGeoTrackingTechnique _logVioTransform:withTimestamp:withSuffix:](self, "_logVioTransform:withTimestamp:withSuffix:", "heartbeat");
    goto LABEL_69;
  }
LABEL_88:
}

+ (BOOL)producesResultDataForAnchorOfClass:(Class)a3
{
  return objc_opt_class() == (void)a3;
}

+ (BOOL)isSupported
{
  return [a1 isSupportedWithOptions:0];
}

+ (int64_t)getFailureReasonFromVLError:(int64_t)a3
{
  int64_t result = a3;
  if (a3 <= 200)
  {
    if (a3 <= 99)
    {
      if (a3 == 1) {
        return result;
      }
      if (a3 == 2) {
        return 256;
      }
    }
    else
    {
      switch(a3)
      {
        case 100:
          return 2;
        case 101:
          return 4;
        case 200:
          return 8;
      }
    }
  }
  else if (a3 > 299)
  {
    switch(a3)
    {
      case 300:
        return 32;
      case 400:
        return 128;
      case 404:
        return 1024;
    }
  }
  else if ((unint64_t)(a3 - 201) < 7)
  {
    return 16;
  }
  return 2048;
}

+ (long)getHeadingForEnuFromCam:(uint64_t)a3
{
  long double v3 = atan2(*(long double *)(a3 + 64), *(long double *)(a3 + 72));
  return v3 + ceil(v3 / -6.28318531) * 6.28318531;
}

+ (BOOL)isCameraUp:(float)a3
{
  double v3 = a3;
  [MEMORY[0x1E4FB4110] minimumTiltAngle];
  return 180.0 - v4 >= v3;
}

- (void)_setTrackingState:(int64_t)a3 techniqueStateObject:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  double v7 = _ARLogTechnique_9();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v8);
    int v10 = NSStringFromARGeoTrackingState(a3);
    int v11 = 138543874;
    id v12 = v9;
    __int16 v13 = 2048;
    double v14 = self;
    __int16 v15 = 2112;
    uint64_t v16 = v10;
    _os_log_impl(&dword_1B88A2000, v7, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Setting new tracking state: %@", (uint8_t *)&v11, 0x20u);
  }
  [v6 setTrackingState:a3];
}

- (int64_t)_getHighestPriorityFailureWithTechniqueStateObject:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [v4 failureReasons];
  if ([v4 lastLoggedFailureReasons] != v5)
  {
    uint64_t v7 = 1;
    *(void *)&long long v6 = 138543874;
    long long v22 = v6;
    while (1)
    {
      uint64_t v8 = objc_msgSend(v4, "lastLoggedFailureReasons", v22) & v7;
      if ((v7 & v5) == 0 || v8)
      {
        if ((v7 & v5) != 0 || !v8) {
          goto LABEL_12;
        }
        uint64_t v9 = _ARLogTechnique_9();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          double v14 = (objc_class *)objc_opt_class();
          __int16 v15 = NSStringFromClass(v14);
          uint64_t v16 = NSStringFromARGeoTrackingInternalFailureReason(v7);
          *(_DWORD *)buf = v22;
          uint64_t v24 = v15;
          __int16 v25 = 2048;
          int v26 = self;
          __int16 v27 = 2112;
          uint64_t v28 = (uint64_t)v16;
          _os_log_impl(&dword_1B88A2000, v9, OS_LOG_TYPE_INFO, "%{public}@ <%p>: ARGeoTrackingTechnique failure reason: ended %@", buf, 0x20u);
        }
      }
      else
      {
        objc_msgSend(v4, "setFailureLogCount:", objc_msgSend(v4, "failureLogCount") + 1);
        uint64_t v9 = _ARLogTechnique_9();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          int v10 = (objc_class *)objc_opt_class();
          int v11 = NSStringFromClass(v10);
          uint64_t v12 = [v4 failureLogCount];
          __int16 v13 = NSStringFromARGeoTrackingInternalFailureReason(v7);
          *(_DWORD *)buf = 138544130;
          uint64_t v24 = v11;
          __int16 v25 = 2048;
          int v26 = self;
          __int16 v27 = 2048;
          uint64_t v28 = v12;
          __int16 v29 = 2112;
          uint64_t v30 = v13;
          _os_log_impl(&dword_1B88A2000, v9, OS_LOG_TYPE_INFO, "%{public}@ <%p>: ARGeoTrackingTechnique failure reason: %ld started %@", buf, 0x2Au);
        }
      }

LABEL_12:
      v7 *= 2;
      if (v7 == 0x2000)
      {
        [v4 setLastLoggedFailureReasons:v5];
        break;
      }
    }
  }
  if ([v4 trackingState] == 3)
  {
    int64_t v17 = 0;
    goto LABEL_35;
  }
  if (v5)
  {
LABEL_28:
    uint64_t v18 = 8;
    goto LABEL_29;
  }
  if ((v5 & 0x400) != 0)
  {
    uint64_t v18 = 4;
    goto LABEL_29;
  }
  if ((v5 & 0x1000) != 0)
  {
    uint64_t v18 = 5;
    goto LABEL_29;
  }
  if ((v5 & 0x200) != 0)
  {
    uint64_t v18 = 1;
    goto LABEL_29;
  }
  if ((v5 & 6) == 0)
  {
    if ((v5 & 0x80) != 0)
    {
      uint64_t v18 = 7;
      goto LABEL_29;
    }
    if ((v5 & 0x40) != 0)
    {
      uint64_t v18 = 3;
      goto LABEL_29;
    }
    if ((v5 & 0x138) == 0)
    {
      uint64_t v18 = (v5 >> 8) & 8;
      goto LABEL_29;
    }
    goto LABEL_28;
  }
  uint64_t v18 = 6;
LABEL_29:
  uint64_t v19 = [v4 trackingState];
  if (v5) {
    BOOL v20 = 0;
  }
  else {
    BOOL v20 = v19 == 2;
  }
  if (v20) {
    int64_t v17 = 8;
  }
  else {
    int64_t v17 = v18;
  }
LABEL_35:

  return v17;
}

- (void)_logVioTransform:(float32x4_t)a3 withTimestamp:(float32x4_t)a4 withSuffix:(float32x4_t)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  memset(&v20[8], 0, 64);
  ARMatrix4x4FloatToDouble(v20, a2, a3, a4, a5);
  *(float64x2_t *)__int16 v27 = v20[4];
  *(float64x2_t *)&v27[16] = v20[5];
  float64x2_t v28 = v20[6];
  float64x2_t v29 = v20[7];
  *(float64x2_t *)buf = v20[0];
  *(float64x2_t *)&buf[16] = v20[1];
  *(float64x2_t *)int v26 = v20[2];
  *(float64x2_t *)&v26[16] = v20[3];
  __invert_d4();
  double v11 = atan2(*(long double *)&v21, *((long double *)&v21 + 1)) * 0.318309886 * 180.0;
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
  id v12 = *(id *)(a1 + 112);
  int v13 = [v12 poseOkCount];
  int v14 = [v12 poseOkCount];
  int v15 = [v12 failureLogCount];
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  uint64_t v16 = _ARLogTechnique_9();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    int v17 = v14 + v15;
    uint64_t v18 = (objc_class *)objc_opt_class();
    uint64_t v19 = NSStringFromClass(v18);
    *(_DWORD *)buf = 138545666;
    *(void *)&uint8_t buf[4] = v19;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = a1;
    *(_WORD *)&buf[22] = 2048;
    *(void *)&buf[24] = v23;
    *(_WORD *)int v26 = 2048;
    *(void *)&v26[2] = *((void *)&v23 + 1);
    *(_WORD *)&v26[10] = 2048;
    *(void *)&v26[12] = v24;
    *(_WORD *)&v26[20] = 2048;
    *(double *)&v26[22] = v11 + ceil(v11 / -360.0) * 360.0;
    *(_WORD *)&v26[30] = 1024;
    *(_DWORD *)__int16 v27 = v17;
    *(_WORD *)&v27[4] = 1024;
    *(_DWORD *)&v27[6] = v13;
    *(_WORD *)&v27[10] = 2048;
    *(double *)&v27[12] = a6;
    *(_WORD *)&v27[20] = 2080;
    *(void *)&v27[22] = a8;
    _os_log_impl(&dword_1B88A2000, v16, OS_LOG_TYPE_INFO, "%{public}@ <%p>: _VIO<--x,y,z,yaw-( %f,%f,%f,%f°)- %i,%i ts %f %s", buf, 0x5Eu);
  }
}

- (void)_estimatePose:(id)a3 pose:(id)a4
{
  uint64_t v103 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [v6 timestamp];
  kdebug_trace();
  uint64_t v8 = (__CVBuffer *)[v6 pixelBuffer];
  if (v8)
  {
    uint64_t v9 = v8;
    CVPixelBufferRetain(v8);
    os_unfair_lock_lock(&self->_resetLock);
    int v10 = self->_state;
    os_unfair_lock_unlock(&self->_resetLock);
    double v11 = [ARWorldTrackingPoseData alloc];
    [v7 timestamp];
    id v12 = -[ARWorldTrackingPoseData initWithTimestamp:](v11, "initWithTimestamp:");
    [v7 visionCameraTransform];
    double v82 = v13;
    [v7 visionCameraTransform];
    double v79 = v14;
    [v7 visionCameraTransform];
    double v76 = v15;
    [v7 visionCameraTransform];
    -[ARWorldTrackingPoseData setVisionCameraTransform:](v12, "setVisionCameraTransform:", v82, v79, v76);
    [v7 cameraTransform];
    -[ARWorldTrackingPoseData setCameraTransform:](v12, "setCameraTransform:");
    uint64_t v16 = [v7 worldTrackingState];
    [(ARWorldTrackingPoseData *)v12 setWorldTrackingState:v16];

    int v17 = [(ARGeoTrackingTechniqueState *)v10 lastCMDeviceMotion];
    uint64_t v18 = [v17 deviceMotion];
    [v18 gravity];
    uint64_t v83 = v19;
    uint64_t v64 = v20;
    long long v66 = v21;

    long long v22 = [v17 deviceMotion];
    long long v23 = [v22 attitude];
    float v24 = ARCameraDirectionFromCMAttitude(v23);
    long long v67 = v17;
    __int16 v25 = [v17 deviceMotion];
    [v25 headingAccuracy];
    double v27 = v26;

    float64x2_t v28 = [(ARGeoTrackingTechniqueState *)v10 lastCLLocation];
    [(ARWorldTrackingPoseData *)v12 visionCameraTransform];
    double v70 = v30;
    double v71 = v29;
    double v68 = v32;
    double v69 = v31;
    [v6 cameraIntrinsics];
    long long v77 = v34;
    long long v80 = v33;
    long long v74 = v35;
    if (v6)
    {
      [v6 radialDistortion];
      float v36 = v96;
      float v72 = v36;
      [v6 radialDistortion];
      *(float *)&uint64_t v37 = v72;
      double v38 = *((double *)&v95 + 1);
    }
    else
    {
      double v38 = 0.0;
      LODWORD(v37) = 0;
    }
    float v42 = v38;
    *((float *)&v37 + 1) = v42;
    uint64_t v73 = v37;
    int64_t requestResultDataAtTimestampCallCount = self->_requestResultDataAtTimestampCallCount;
    [(ARGeoTrackingTechnique *)self setVLPoseEstimationExecuting:1];
    if (self->_deterministic) {
      dispatch_semaphore_t v43 = dispatch_semaphore_create(0);
    }
    else {
      dispatch_semaphore_t v43 = 0;
    }
    *(void *)&long long v44 = v83;
    *((void *)&v44 + 1) = v64;
    long long v84 = v44;
    double v45 = v24;
    long long v46 = v80;
    HIDWORD(v46) = 0;
    long long v81 = v46;
    long long v47 = v77;
    HIDWORD(v47) = 0;
    long long v78 = v47;
    long long v48 = v74;
    HIDWORD(v48) = 0;
    long long v75 = v48;
    [v6 timestamp];
    -[ARGeoTrackingTechnique _logVioTransform:withTimestamp:withSuffix:](self, "_logVioTransform:withTimestamp:withSuffix:", "estimatePose", v71, v70, v69, v68, v49);
    [(ARGeoTrackingTechniqueState *)self->_state setHasStartedLocalization:1];
    [v6 timestamp];
    kdebug_trace();
    float32x4_t v50 = _ARLogTechnique_9();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
    {
      float32x4_t v51 = (objc_class *)objc_opt_class();
      float32x4_t v52 = NSStringFromClass(v51);
      [v6 timestamp];
      *(_DWORD *)buf = 138543874;
      float64x2_t v98 = v52;
      __int16 v99 = 2048;
      float64x2_t v100 = self;
      __int16 v101 = 2048;
      uint64_t v102 = v53;
      _os_log_impl(&dword_1B88A2000, v50, OS_LOG_TYPE_INFO, "%{public}@ <%p>: VL pose is estimating (%f)", buf, 0x20u);
    }
    [v6 timestamp];
    kdebug_trace();
    long long v54 = [(ARGeoTrackingTechniqueState *)v10 VLHandle];
    long long v55 = [v28 location];
    [v6 exposureTargetOffset];
    double v57 = v56;
    [v6 timestamp];
    uint64_t v59 = v58;
    v86[0] = MEMORY[0x1E4F143A8];
    v86[1] = 3221225472;
    v86[2] = __45__ARGeoTrackingTechnique__estimatePose_pose___block_invoke;
    v86[3] = &unk_1E61875D0;
    uint64_t v87 = v10;
    long long v88 = self;
    dispatch_semaphore_t v89 = v43;
    id v90 = v28;
    float64x2_t v93 = v9;
    int64_t v94 = requestResultDataAtTimestampCallCount;
    id v91 = v6;
    float64x2_t v92 = v12;
    v85[0] = v84;
    v85[1] = v66;
    long long v60 = v12;
    id v61 = v28;
    long long v62 = v43;
    long long v63 = v10;
    -[ARGeoTrackingTechnique _callVLWithHandle:pixelBuffer:deviceLocation:heading:inputGravity:vioTransform:cameraIntrinsics:radialDistortion:exposureTargetOffset:timestamp:vlDeterminismSemaphore:completionHandler:](self, "_callVLWithHandle:pixelBuffer:deviceLocation:heading:inputGravity:vioTransform:cameraIntrinsics:radialDistortion:exposureTargetOffset:timestamp:vlDeterminismSemaphore:completionHandler:", v54, v9, v55, v85, v62, v86, v45, v27, v71, v70, v69, v68, v81, v78, v75, v73,
      *(void *)&v57,
      v59);

    kdebug_trace();
    kdebug_trace();
  }
  else
  {
    long long v39 = _ARLogTechnique_9();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      long long v40 = (objc_class *)objc_opt_class();
      long double v41 = NSStringFromClass(v40);
      *(_DWORD *)buf = 138543618;
      float64x2_t v98 = v41;
      __int16 v99 = 2048;
      float64x2_t v100 = self;
      _os_log_impl(&dword_1B88A2000, v39, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Pixel buffer is nil", buf, 0x16u);
    }
    kdebug_trace();
  }
}

void __45__ARGeoTrackingTechnique__estimatePose_pose___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,long long a23,long long a24,long long a25,long long a26,long long a27,long long a28,long long a29,long long a30,long long a31,long long a32,long long a33,long long a34,long long a35,long long a36,long long a37,long long a38,long long a39,long long a40,long long a41,long long a42,float64x2_t a43)
{
  STACK[0x19C8] = *MEMORY[0x1E4F143B8];
  id v45 = a2;
  id v46 = a3;
  [v45 confidence];
  kdebug_trace();
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 80));
  long long v47 = [*(id *)(a1 + 32) VLHandle];
  int v48 = [v47 _algorithmVersion];

  if (v45)
  {
    double v49 = [v45 debugInfo];
  }
  else
  {
    float32x4_t v50 = [v46 userInfo];
    double v49 = [v50 objectForKeyedSubscript:*MEMORY[0x1E4FB4120]];
  }
  uint64_t v51 = *(void *)(a1 + 40);
  v358 = v45;
  v353 = v49;
  if (*(void *)(v51 + 168))
  {
    float32x4_t v52 = _ARLogTechnique_9();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
    {
      uint64_t v53 = (objc_class *)objc_opt_class();
      NSStringFromClass(v53);
      v55 = id v54 = v46;
      unint64_t v56 = *(void *)(a1 + 40);
      double v57 = [v49 pngData];
      LODWORD(STACK[0x1930]) = 138543874;
      STACK[0x1934] = (unint64_t)v55;
      LOWORD(STACK[0x193C]) = 2048;
      STACK[0x193E] = v56;
      LOWORD(STACK[0x1946]) = 2048;
      STACK[0x1948] = (unint64_t)v57;
      _os_log_impl(&dword_1B88A2000, v52, OS_LOG_TYPE_INFO, "%{public}@ <%p>: writing VL trace with image data %p", (uint8_t *)&STACK[0x1930], 0x20u);

      id v46 = v54;
    }

    uint64_t v58 = [*(id *)(a1 + 40) VLTraceRecorder];
    [v58 recordAttempt:v49];

    uint64_t v51 = *(void *)(a1 + 40);
  }
  os_unfair_lock_lock((os_unfair_lock_t)(v51 + 104));
  uint64_t v60 = *(void *)(a1 + 32);
  uint64_t v59 = *(void *)(a1 + 40);
  uint64_t v61 = *(void *)(v59 + 112);
  os_unfair_lock_unlock((os_unfair_lock_t)(v59 + 104));
  if (v60 == v61)
  {
    [*(id *)(*(void *)(a1 + 40) + 112) setHasReturnedLocalization:1];
    long long v63 = v358;
    if (v46)
    {
      double v68 = _ARLogTechnique_9();
      if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
      {
        double v69 = (objc_class *)objc_opt_class();
        NSStringFromClass(v69);
        v71 = double v70 = v46;
        unint64_t v72 = *(void *)(a1 + 40);
        uint64_t v73 = [v70 localizedDescription];
        LODWORD(STACK[0x1930]) = 138543874;
        STACK[0x1934] = (unint64_t)v71;
        LOWORD(STACK[0x193C]) = 2048;
        STACK[0x193E] = v72;
        LOWORD(STACK[0x1946]) = 2112;
        STACK[0x1948] = (unint64_t)v73;
        _os_log_impl(&dword_1B88A2000, v68, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Visual localization error: %@", (uint8_t *)&STACK[0x1930], 0x20u);

        id v46 = v70;
      }

      id v74 = v46;
      uint64_t v75 = [v46 code];
      uint64_t v76 = [(id)objc_opt_class() getFailureReasonFromVLError:v75];
      long long v77 = [[ARVisualLocalizationResultData alloc] initWithVLLocalizationResult:0 errorCode:v75 debugInfo:v353 heading:*(void *)(a1 + 56) inputLocation:v48 algorithmVersion:NAN undulation:NAN];
      os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 40) + 56));
      long long v78 = [*(id *)(a1 + 32) resultDatas];
      [v78 addObject:v77];

      os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 40) + 56));
      os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 40) + 88));
      [*(id *)(a1 + 32) addFailureReason:v76];
      if ([*(id *)(a1 + 32) trackingState] == 1 && (v76 & 6) == 0) {
        [*(id *)(a1 + 40) _setTrackingState:2 techniqueStateObject:*(void *)(a1 + 32)];
      }
      os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 40) + 88));

      id v46 = v74;
    }
    [v358 confidence];
    kdebug_trace();
    long long v67 = v353;
    if (!v358)
    {
LABEL_103:
      [*(id *)(a1 + 40) setVLPoseEstimationExecuting:0];
      if (!*(unsigned char *)(*(void *)(a1 + 40) + 72)) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
    id v351 = v46;
    [v358 location];
    long long v79 = *(_OWORD *)&STACK[0x1900];
    *(_OWORD *)&STACK[0x18A0] = *(_OWORD *)&STACK[0x1910];
    *(_OWORD *)&STACK[0x1890] = v79;
    ARECEFToLLA((int8x16_t *)&STACK[0x18B0]);
    long long v354 = *(_OWORD *)&STACK[0x18C0];
    long long v348 = *(_OWORD *)&STACK[0x18B0];
    long long v80 = _ARLogTechnique_9();
    if (os_log_type_enabled(v80, OS_LOG_TYPE_INFO))
    {
      long long v81 = (objc_class *)objc_opt_class();
      double v82 = NSStringFromClass(v81);
      unint64_t v83 = *(void *)(a1 + 40);
      unint64_t v84 = *(void *)(a1 + 88);
      LODWORD(STACK[0x1930]) = 138543874;
      STACK[0x1934] = (unint64_t)v82;
      LOWORD(STACK[0x193C]) = 2048;
      STACK[0x193E] = v83;
      LOWORD(STACK[0x1946]) = 2048;
      STACK[0x1948] = v84;
      _os_log_impl(&dword_1B88A2000, v80, OS_LOG_TYPE_INFO, "%{public}@ <%p>: VL Result: at frame = %ld", (uint8_t *)&STACK[0x1930], 0x20u);
    }
    float64x2_t v85 = _ARLogTechnique_9();
    if (os_log_type_enabled(v85, OS_LOG_TYPE_DEBUG))
    {
      float64x2_t v86 = (objc_class *)objc_opt_class();
      uint64_t v87 = NSStringFromClass(v86);
      unint64_t v88 = *(void *)(a1 + 40);
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      LODWORD(STACK[0x1930]) = 138543874;
      STACK[0x1934] = (unint64_t)v87;
      LOWORD(STACK[0x193C]) = 2048;
      STACK[0x193E] = v88;
      LOWORD(STACK[0x1946]) = 2048;
      *(CFAbsoluteTime *)&STACK[0x1948] = Current;
      _os_log_impl(&dword_1B88A2000, v85, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: VL Result: iOSTime = %f", (uint8_t *)&STACK[0x1930], 0x20u);
    }
    id v90 = _ARLogTechnique_9();
    if (os_log_type_enabled(v90, OS_LOG_TYPE_INFO))
    {
      id v91 = (objc_class *)objc_opt_class();
      float64x2_t v92 = NSStringFromClass(v91);
      unint64_t v93 = *(void *)(a1 + 40);
      [v358 inputTimestamp];
      LODWORD(STACK[0x1930]) = 138543874;
      STACK[0x1934] = (unint64_t)v92;
      LOWORD(STACK[0x193C]) = 2048;
      STACK[0x193E] = v93;
      LOWORD(STACK[0x1946]) = 2048;
      STACK[0x1948] = v94;
      _os_log_impl(&dword_1B88A2000, v90, OS_LOG_TYPE_INFO, "%{public}@ <%p>: VL Result: sensorTimestamp = %f", (uint8_t *)&STACK[0x1930], 0x20u);
    }
    long long v95 = _ARLogTechnique_9();
    if (os_log_type_enabled(v95, OS_LOG_TYPE_INFO))
    {
      double v96 = (objc_class *)objc_opt_class();
      float64x2_t v97 = NSStringFromClass(v96);
      unint64_t v98 = *(void *)(a1 + 40);
      [v358 location];
      unint64_t v99 = STACK[0x18F0];
      LODWORD(STACK[0x1930]) = 138544643;
      STACK[0x1934] = (unint64_t)v97;
      LOWORD(STACK[0x193C]) = 2048;
      STACK[0x193E] = v98;
      LOWORD(STACK[0x1946]) = 2049;
      STACK[0x1948] = v348;
      LOWORD(STACK[0x1950]) = 2049;
      STACK[0x1952] = *((void *)&v348 + 1);
      LOWORD(STACK[0x195A]) = 2049;
      STACK[0x195C] = v354;
      LOWORD(STACK[0x1964]) = 2049;
      STACK[0x1966] = v99;
      _os_log_impl(&dword_1B88A2000, v95, OS_LOG_TYPE_INFO, "%{public}@ <%p>: VL Result: lat,lon,alt,accuracy = %{private}f, %{private}f, %{private}f, %{private}f", (uint8_t *)&STACK[0x1930], 0x3Eu);
    }
    float64x2_t v100 = _ARLogTechnique_9();
    if (os_log_type_enabled(v100, OS_LOG_TYPE_INFO))
    {
      __int16 v101 = (objc_class *)objc_opt_class();
      uint64_t v102 = NSStringFromClass(v101);
      unint64_t v103 = *(void *)(a1 + 40);
      [v358 transform];
      v104.n128_f64[0] = ARMatrix4x4DoubleToFloat((float64x2_t *)&STACK[0x1810]);
      float64x2_t v108 = ARMatrix4x4Description(1, v104, v105, v106, v107);
      LODWORD(STACK[0x1930]) = 138543875;
      STACK[0x1934] = (unint64_t)v102;
      LOWORD(STACK[0x193C]) = 2048;
      STACK[0x193E] = v103;
      LOWORD(STACK[0x1946]) = 2113;
      STACK[0x1948] = (unint64_t)v108;
      _os_log_impl(&dword_1B88A2000, v100, OS_LOG_TYPE_INFO, "%{public}@ <%p>: VL Result: ecefFromCam = %{private}@", (uint8_t *)&STACK[0x1930], 0x20u);
    }
    for (uint64_t i = 0; i != 6; ++i)
    {
      __int16 v110 = _ARLogTechnique_9();
      if (os_log_type_enabled(v110, OS_LOG_TYPE_DEBUG))
      {
        double v111 = (objc_class *)objc_opt_class();
        __int16 v112 = NSStringFromClass(v111);
        unint64_t v113 = *(void *)(a1 + 40);
        [v358 covariance];
        *(double *)&unint64_t v114 = *((float *)&STACK[0x1780] + i);
        [v358 covariance];
        *(double *)&unint64_t v115 = *((float *)&STACK[0x16F0] + i + 6);
        [v358 covariance];
        *(double *)&unint64_t v116 = *((float *)&STACK[0x1660] + i + 12);
        [v358 covariance];
        *(double *)&unint64_t v117 = *((float *)&STACK[0x15D0] + i + 18);
        [v358 covariance];
        *(double *)&unint64_t v118 = *((float *)&STACK[0x1540] + i + 24);
        [v358 covariance];
        float v119 = *((float *)&STACK[0x14B0] + i + 30);
        LODWORD(STACK[0x1930]) = 138545410;
        STACK[0x1934] = (unint64_t)v112;
        LOWORD(STACK[0x193C]) = 2048;
        STACK[0x193E] = v113;
        LOWORD(STACK[0x1946]) = 2048;
        STACK[0x1948] = i + 1;
        LOWORD(STACK[0x1950]) = 2048;
        STACK[0x1952] = v114;
        LOWORD(STACK[0x195A]) = 2048;
        STACK[0x195C] = v115;
        LOWORD(STACK[0x1964]) = 2048;
        STACK[0x1966] = v116;
        LOWORD(STACK[0x196E]) = 2048;
        STACK[0x1970] = v117;
        LOWORD(STACK[0x1978]) = 2048;
        STACK[0x197A] = v118;
        LOWORD(STACK[0x1982]) = 2048;
        *(double *)&STACK[0x1984] = v119;
        _os_log_impl(&dword_1B88A2000, v110, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: VL Result: covariance col %zu = %f, %f, %f, %f, %f, %f", (uint8_t *)&STACK[0x1930], 0x5Cu);
      }
    }
    double v120 = _ARLogTechnique_9();
    long long v63 = v358;
    if (os_log_type_enabled(v120, OS_LOG_TYPE_DEBUG))
    {
      double v121 = (objc_class *)objc_opt_class();
      __int16 v122 = NSStringFromClass(v121);
      unint64_t v123 = *(void *)(a1 + 40);
      [v358 confidence];
      LODWORD(STACK[0x1930]) = 138543874;
      STACK[0x1934] = (unint64_t)v122;
      LOWORD(STACK[0x193C]) = 2048;
      STACK[0x193E] = v123;
      LOWORD(STACK[0x1946]) = 2048;
      *(double *)&STACK[0x1948] = v124;
      _os_log_impl(&dword_1B88A2000, v120, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: VL Result: confidence = %f", (uint8_t *)&STACK[0x1930], 0x20u);
    }
    *(_OWORD *)&STACK[0x14A0] = 0u;
    *(_OWORD *)&STACK[0x1490] = 0u;
    *(_OWORD *)&STACK[0x1480] = 0u;
    *(_OWORD *)&STACK[0x1470] = 0u;
    *(_OWORD *)&STACK[0x1460] = 0u;
    *(_OWORD *)&STACK[0x1450] = 0u;
    *(_OWORD *)&STACK[0x1440] = 0u;
    *(_OWORD *)&STACK[0x1430] = 0u;
    [v358 transform];
    *(_OWORD *)&STACK[0x1420] = 0u;
    *(_OWORD *)&STACK[0x1410] = 0u;
    *(_OWORD *)&STACK[0x1400] = 0u;
    *(_OWORD *)&STACK[0x13F0] = 0u;
    *(_OWORD *)&STACK[0x13E0] = 0u;
    *(_OWORD *)&STACK[0x13D0] = 0u;
    *(_OWORD *)&STACK[0x13C0] = 0u;
    *(_OWORD *)&STACK[0x13B0] = 0u;
    uint64_t v125 = [*(id *)(a1 + 32) enuOrigin];
    uint64_t v126 = v125;
    long long v67 = v353;
    if (v125)
    {
      [v125 ecefFromlocation];
    }
    else
    {
      *(_OWORD *)&STACK[0x13A0] = 0u;
      *(_OWORD *)&STACK[0x1390] = 0u;
      *(_OWORD *)&STACK[0x1380] = 0u;
      *(_OWORD *)&STACK[0x1370] = 0u;
      *(_OWORD *)&STACK[0x1360] = 0u;
      *(_OWORD *)&STACK[0x1350] = 0u;
      *(_OWORD *)&STACK[0x1340] = 0u;
      *(_OWORD *)&STACK[0x1330] = 0u;
    }
    long long v127 = *(_OWORD *)&STACK[0x1380];
    *(_OWORD *)&STACK[0x1970] = *(_OWORD *)&STACK[0x1370];
    *(_OWORD *)&STACK[0x1980] = v127;
    long long v128 = *(_OWORD *)&STACK[0x13A0];
    *(_OWORD *)&STACK[0x1990] = *(_OWORD *)&STACK[0x1390];
    *(_OWORD *)&STACK[0x19A0] = v128;
    long long v129 = *(_OWORD *)&STACK[0x1340];
    *(_OWORD *)&STACK[0x1930] = *(_OWORD *)&STACK[0x1330];
    *(_OWORD *)&STACK[0x1940] = v129;
    long long v130 = *(_OWORD *)&STACK[0x1360];
    *(_OWORD *)&STACK[0x1950] = *(_OWORD *)&STACK[0x1350];
    *(_OWORD *)&STACK[0x1960] = v130;
    __invert_d4();

    float64x2_t v343 = *(float64x2_t *)&STACK[0x13E0];
    float64x2_t v344 = *(float64x2_t *)&STACK[0x13C0];
    float64x2_t v347 = *(float64x2_t *)&STACK[0x1420];
    float64x2_t v349 = *(float64x2_t *)&STACK[0x1400];
    float64x2_t v342 = *(float64x2_t *)&STACK[0x13B0];
    float64x2_t v345 = *(float64x2_t *)&STACK[0x13F0];
    float64x2_t vars0 = *(float64x2_t *)&STACK[0x13D0];
    float64x2_t v355 = *(float64x2_t *)&STACK[0x1410];
    float64x2_t v131 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*(float64x2_t *)&STACK[0x13B0], *(double *)&STACK[0x1430]), *(float64x2_t *)&STACK[0x13D0], *(float64x2_t *)&STACK[0x1430], 1), *(float64x2_t *)&STACK[0x13F0], *(double *)&STACK[0x1440]), *(float64x2_t *)&STACK[0x1410], *(float64x2_t *)&STACK[0x1440], 1);
    double v132 = (1.57079633 - atan2(v131.f64[1], v131.f64[0])) * 0.318309886 * 180.0;
    float64x2_t v340 = *(float64x2_t *)&STACK[0x1490];
    float64x2_t v341 = *(float64x2_t *)&STACK[0x14A0];
    long long v133 = _ARLogTechnique_9();
    if (os_log_type_enabled(v133, OS_LOG_TYPE_INFO))
    {
      float64x2_t v356 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v342, v340.f64[0]), vars0, v340, 1), v345, v341.f64[0]), v355, v341, 1);
      long long v134 = (objc_class *)objc_opt_class();
      long long v135 = NSStringFromClass(v134);
      unint64_t v136 = *(void *)(a1 + 40);
      int v137 = [*(id *)(a1 + 32) poseOkCount];
      [*(id *)(a1 + 64) timestamp];
      LODWORD(STACK[0x1930]) = 138545155;
      STACK[0x1934] = (unint64_t)v135;
      LOWORD(STACK[0x193C]) = 2048;
      STACK[0x193E] = v136;
      long long v63 = v358;
      LOWORD(STACK[0x1946]) = 2048;
      STACK[0x1948] = *(void *)&v356.f64[0];
      LOWORD(STACK[0x1950]) = 2048;
      STACK[0x1952] = *(void *)&v356.f64[1];
      LOWORD(STACK[0x195A]) = 2048;
      STACK[0x195C] = *(_OWORD *)&vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v344, v340.f64[0]), v343, v340, 1), v349, v341.f64[0]), v347, v341, 1);
      LOWORD(STACK[0x1964]) = 2049;
      *(double *)&STACK[0x1966] = v132 + ceil(v132 / -360.0) * 360.0;
      LOWORD(STACK[0x196E]) = 1024;
      LODWORD(STACK[0x1970]) = v137;
      LOWORD(STACK[0x1974]) = 2048;
      STACK[0x1976] = v138;
      _os_log_impl(&dword_1B88A2000, v133, OS_LOG_TYPE_INFO, "%{public}@ <%p>: _VL_VIO<-x,y,z,yaw-( %f,%f,%f,%{private}f°)- %i ts %f vlPose", (uint8_t *)&STACK[0x1930], 0x4Eu);
    }
    double v139 = [ARVisualLocalizationResultData alloc];
    uint64_t v140 = *(void *)(a1 + 56);
    double v141 = [*(id *)(a1 + 32) enuOrigin];
    [v141 undulation];
    unint64_t v143 = [(ARVisualLocalizationResultData *)v139 initWithVLLocalizationResult:v63 errorCode:0 debugInfo:v353 heading:v140 inputLocation:v48 algorithmVersion:v132 undulation:v142];

    objc_msgSend(*(id *)(a1 + 32), "setPoseOkCount:", objc_msgSend(*(id *)(a1 + 32), "poseOkCount") + 1);
    v144 = _ARLogTechnique_9();
    if (os_log_type_enabled(v144, OS_LOG_TYPE_INFO))
    {
      float64x2_t v145 = (objc_class *)objc_opt_class();
      unint64_t v146 = NSStringFromClass(v145);
      unint64_t v147 = *(void *)(a1 + 40);
      int v148 = [*(id *)(a1 + 32) poseOkCount];
      LODWORD(STACK[0x1930]) = 138543874;
      STACK[0x1934] = (unint64_t)v146;
      LOWORD(STACK[0x193C]) = 2048;
      STACK[0x193E] = v147;
      LOWORD(STACK[0x1946]) = 1024;
      LODWORD(STACK[0x1948]) = v148;
      _os_log_impl(&dword_1B88A2000, v144, OS_LOG_TYPE_INFO, "%{public}@ <%p>: VL Pose is OK %d ! ", (uint8_t *)&STACK[0x1930], 0x1Cu);
    }
    *(_OWORD *)&STACK[0x1320] = 0u;
    *(_OWORD *)&STACK[0x1310] = 0u;
    *(_OWORD *)&STACK[0x1300] = 0u;
    *(_OWORD *)&STACK[0x12F0] = 0u;
    *(_OWORD *)&STACK[0x12E0] = 0u;
    *(_OWORD *)&STACK[0x12D0] = 0u;
    *(_OWORD *)&STACK[0x12C0] = 0u;
    *(_OWORD *)&STACK[0x12B0] = 0u;
    [*(id *)(a1 + 72) visionCameraTransform];
    BOOL v153 = objc_msgSend(*(id *)(a1 + 32), "consensusAverageFilter", ARMatrix4x4FloatToDouble((float64x2_t *)&STACK[0x12B0], v149, v150, v151, v152).f64[0]);
    if (v153)
    {
    }
    else
    {
      uint64_t v154 = *(void *)(a1 + 40);
      if (!*(unsigned char *)(v154 + 73) || !*(unsigned char *)(v154 + 74))
      {
        v155 = [ARGeoTrackingConsensusAndAverageFilter alloc];
        long long v156 = *(_OWORD *)&STACK[0x1400];
        *(_OWORD *)&STACK[0x1970] = *(_OWORD *)&STACK[0x13F0];
        *(_OWORD *)&STACK[0x1980] = v156;
        long long v157 = *(_OWORD *)&STACK[0x1420];
        *(_OWORD *)&STACK[0x1990] = *(_OWORD *)&STACK[0x1410];
        *(_OWORD *)&STACK[0x19A0] = v157;
        long long v158 = *(_OWORD *)&STACK[0x13C0];
        *(_OWORD *)&STACK[0x1930] = *(_OWORD *)&STACK[0x13B0];
        *(_OWORD *)&STACK[0x1940] = v158;
        long long v159 = *(_OWORD *)&STACK[0x13E0];
        *(_OWORD *)&STACK[0x1950] = *(_OWORD *)&STACK[0x13D0];
        *(_OWORD *)&STACK[0x1960] = v159;
        v160 = [(ARGeoTrackingConsensusAndAverageFilter *)v155 initWithENUFromECEF:&STACK[0x1930] maxHistory:20 minInlierScore:1.0];
        [*(id *)(a1 + 32) setConsensusAverageFilter:v160];
      }
    }
    *(_OWORD *)&STACK[0x12A0] = 0u;
    *(_OWORD *)&STACK[0x1290] = 0u;
    *(_OWORD *)&STACK[0x1280] = 0u;
    *(_OWORD *)&STACK[0x1270] = 0u;
    *(_OWORD *)&STACK[0x1260] = 0u;
    *(_OWORD *)&STACK[0x1250] = 0u;
    *(_OWORD *)&STACK[0x1240] = 0u;
    *(_OWORD *)&STACK[0x1230] = 0u;
    uint64_t v161 = *(void *)(a1 + 40);
    if (*(unsigned char *)(v161 + 73) && *(unsigned char *)(v161 + 74))
    {
      uint64_t v162 = 0;
      long long v163 = *(_OWORD *)&STACK[0x1300];
      *(_OWORD *)&STACK[0x1970] = *(_OWORD *)&STACK[0x12F0];
      *(_OWORD *)&STACK[0x1980] = v163;
      long long v164 = *(_OWORD *)&STACK[0x1320];
      *(_OWORD *)&STACK[0x1990] = *(_OWORD *)&STACK[0x1310];
      *(_OWORD *)&STACK[0x19A0] = v164;
      long long v165 = *(_OWORD *)&STACK[0x12C0];
      *(_OWORD *)&STACK[0x1930] = *(_OWORD *)&STACK[0x12B0];
      *(_OWORD *)&STACK[0x1940] = v165;
      long long v166 = *(_OWORD *)&STACK[0x12E0];
      *(_OWORD *)&STACK[0x1950] = *(_OWORD *)&STACK[0x12D0];
      *(_OWORD *)&STACK[0x1960] = v166;
      *(_OWORD *)&STACK[0x11A0] = 0u;
      *(_OWORD *)&STACK[0x1190] = 0u;
      *(_OWORD *)&STACK[0x1180] = 0u;
      *(_OWORD *)&STACK[0x1170] = 0u;
      *(_OWORD *)&STACK[0x1160] = 0u;
      *(_OWORD *)&STACK[0x1150] = 0u;
      *(_OWORD *)&STACK[0x1140] = 0u;
      *(_OWORD *)&STACK[0x1130] = 0u;
      do
      {
        float64x2_t v168 = *(float64x2_t *)((char *)&STACK[0x1930] + v162);
        float64x2_t v167 = *(float64x2_t *)((char *)&STACK[0x1930] + v162 + 16);
        uint64_t v169 = (float64x2_t *)((char *)&STACK[0x1130] + v162);
        *uint64_t v169 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64((float64x2_t)xmmword_1B8A2F460, v168.f64[0]), (float64x2_t)0, v168, 1), (float64x2_t)xmmword_1B8A2F430, v167.f64[0]), (float64x2_t)0, v167, 1);
        v169[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64((float64x2_t)0, v168.f64[0]), (float64x2_t)xmmword_1B8A2F430, v168, 1), (float64x2_t)0, v167.f64[0]), (float64x2_t)xmmword_1B8A2F460, v167, 1);
        v162 += 32;
      }
      while (v162 != 128);
      uint64_t v170 = 0;
      float64x2_t v171 = *(float64x2_t *)&STACK[0x1440];
      float64x2_t v172 = *(float64x2_t *)&STACK[0x1430];
      float64x2_t v173 = *(float64x2_t *)&STACK[0x1460];
      float64x2_t v174 = *(float64x2_t *)&STACK[0x1450];
      float64x2_t v175 = *(float64x2_t *)&STACK[0x1480];
      float64x2_t v176 = *(float64x2_t *)&STACK[0x1470];
      float64x2_t v177 = *(float64x2_t *)&STACK[0x14A0];
      float64x2_t v178 = *(float64x2_t *)&STACK[0x1490];
      *(_OWORD *)&STACK[0x11B0] = 0u;
      *(_OWORD *)&STACK[0x11C0] = 0u;
      *(_OWORD *)&STACK[0x11D0] = 0u;
      *(_OWORD *)&STACK[0x11E0] = 0u;
      *(_OWORD *)&STACK[0x11F0] = 0u;
      *(_OWORD *)&STACK[0x1200] = 0u;
      *(_OWORD *)&STACK[0x1210] = 0u;
      *(_OWORD *)&STACK[0x1220] = 0u;
      do
      {
        float64x2_t v180 = *(float64x2_t *)((char *)&STACK[0x1130] + v170);
        float64x2_t v179 = *(float64x2_t *)((char *)&STACK[0x1130] + v170 + 16);
        double v181 = (float64x2_t *)((char *)&STACK[0x11B0] + v170);
        *double v181 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v172, v180.f64[0]), v174, v180, 1), v176, v179.f64[0]), v178, v179, 1);
        v181[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v171, v180.f64[0]), v173, v180, 1), v175, v179.f64[0]), v177, v179, 1);
        v170 += 32;
      }
      while (v170 != 128);
      uint64_t v182 = 0;
      float64x2_t v183 = *(float64x2_t *)&STACK[0x13C0];
      float64x2_t v184 = *(float64x2_t *)&STACK[0x13B0];
      float64x2_t v185 = *(float64x2_t *)&STACK[0x13E0];
      float64x2_t v186 = *(float64x2_t *)&STACK[0x13D0];
      float64x2_t v187 = *(float64x2_t *)&STACK[0x1400];
      float64x2_t v188 = *(float64x2_t *)&STACK[0x13F0];
      float64x2_t v189 = *(float64x2_t *)&STACK[0x1420];
      float64x2_t v190 = *(float64x2_t *)&STACK[0x1410];
      *(_OWORD *)&STACK[0x1930] = 0u;
      *(_OWORD *)&STACK[0x1940] = 0u;
      *(_OWORD *)&STACK[0x1950] = 0u;
      *(_OWORD *)&STACK[0x1960] = 0u;
      *(_OWORD *)&STACK[0x1970] = 0u;
      *(_OWORD *)&STACK[0x1980] = 0u;
      *(_OWORD *)&STACK[0x1990] = 0u;
      *(_OWORD *)&STACK[0x19A0] = 0u;
      do
      {
        float64x2_t v192 = *(float64x2_t *)((char *)&STACK[0x11B0] + v182);
        float64x2_t v191 = *(float64x2_t *)((char *)&STACK[0x11B0] + v182 + 16);
        v193 = (float64x2_t *)((char *)&STACK[0x1930] + v182);
        float64x2_t *v193 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v184, v192.f64[0]), v186, v192, 1), v188, v191.f64[0]), v190, v191, 1);
        v193[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v183, v192.f64[0]), v185, v192, 1), v187, v191.f64[0]), v189, v191, 1);
        v182 += 32;
      }
      while (v182 != 128);
    }
    else
    {
      double v194 = [*(id *)(a1 + 32) consensusAverageFilter];
      long long v195 = *(_OWORD *)&STACK[0x1300];
      *(_OWORD *)&STACK[0x1970] = *(_OWORD *)&STACK[0x12F0];
      *(_OWORD *)&STACK[0x1980] = v195;
      long long v196 = *(_OWORD *)&STACK[0x1320];
      *(_OWORD *)&STACK[0x1990] = *(_OWORD *)&STACK[0x1310];
      *(_OWORD *)&STACK[0x19A0] = v196;
      long long v197 = *(_OWORD *)&STACK[0x12C0];
      *(_OWORD *)&STACK[0x1930] = *(_OWORD *)&STACK[0x12B0];
      *(_OWORD *)&STACK[0x1940] = v197;
      long long v198 = *(_OWORD *)&STACK[0x12E0];
      *(_OWORD *)&STACK[0x1950] = *(_OWORD *)&STACK[0x12D0];
      *(_OWORD *)&STACK[0x1960] = v198;
      long long v199 = *(_OWORD *)&STACK[0x1470];
      *(_OWORD *)&STACK[0x1100] = *(_OWORD *)&STACK[0x1480];
      long long v200 = *(_OWORD *)&STACK[0x14A0];
      *(_OWORD *)&STACK[0x1110] = *(_OWORD *)&STACK[0x1490];
      *(_OWORD *)&STACK[0x1120] = v200;
      long long v201 = *(_OWORD *)&STACK[0x1440];
      *(_OWORD *)&STACK[0x10B0] = *(_OWORD *)&STACK[0x1430];
      *(_OWORD *)&STACK[0x10C0] = v201;
      long long v202 = *(_OWORD *)&STACK[0x1460];
      *(_OWORD *)&STACK[0x10D0] = *(_OWORD *)&STACK[0x1450];
      *(_OWORD *)&STACK[0x10E0] = v202;
      *(_OWORD *)&STACK[0x10F0] = v199;
      [v194 updateWithVIOPose:&STACK[0x1930] VLPose:&STACK[0x10B0]];

      v203 = [*(id *)(a1 + 32) consensusAverageFilter];
      [*(id *)(a1 + 64) timestamp];
      char v204 = objc_msgSend(v203, "getCurrentENUFromVIO:ENUFromVIO:", &STACK[0x1230]);

      if (v204) {
        goto LABEL_67;
      }
      uint64_t v205 = 0;
      long long v206 = *(_OWORD *)&STACK[0x1300];
      *(_OWORD *)&STACK[0x1970] = *(_OWORD *)&STACK[0x12F0];
      *(_OWORD *)&STACK[0x1980] = v206;
      long long v207 = *(_OWORD *)&STACK[0x1320];
      *(_OWORD *)&STACK[0x1990] = *(_OWORD *)&STACK[0x1310];
      *(_OWORD *)&STACK[0x19A0] = v207;
      long long v208 = *(_OWORD *)&STACK[0x12C0];
      *(_OWORD *)&STACK[0x1930] = *(_OWORD *)&STACK[0x12B0];
      *(_OWORD *)&STACK[0x1940] = v208;
      long long v209 = *(_OWORD *)&STACK[0x12E0];
      *(_OWORD *)&STACK[0x1950] = *(_OWORD *)&STACK[0x12D0];
      *(_OWORD *)&STACK[0x1960] = v209;
      *(_OWORD *)&STACK[0x1010] = 0u;
      *(_OWORD *)&STACK[0x1020] = 0u;
      *(_OWORD *)&STACK[0xFF0] = 0u;
      *(_OWORD *)&STACK[0x1000] = 0u;
      *(_OWORD *)&STACK[0xFD0] = 0u;
      *(_OWORD *)&STACK[0xFE0] = 0u;
      *(_OWORD *)&STACK[0xFB0] = 0u;
      *(_OWORD *)&STACK[0xFC0] = 0u;
      do
      {
        float64x2_t v211 = *(float64x2_t *)((char *)&STACK[0x1930] + v205);
        float64x2_t v210 = *(float64x2_t *)((char *)&STACK[0x1930] + v205 + 16);
        long long v212 = (float64x2_t *)((char *)&STACK[0xFB0] + v205);
        *long long v212 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64((float64x2_t)xmmword_1B8A2F460, v211.f64[0]), (float64x2_t)0, v211, 1), (float64x2_t)xmmword_1B8A2F430, v210.f64[0]), (float64x2_t)0, v210, 1);
        v212[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64((float64x2_t)0, v211.f64[0]), (float64x2_t)xmmword_1B8A2F430, v211, 1), (float64x2_t)0, v210.f64[0]), (float64x2_t)xmmword_1B8A2F460, v210, 1);
        v205 += 32;
      }
      while (v205 != 128);
      uint64_t v213 = 0;
      float64x2_t v214 = *(float64x2_t *)&STACK[0x1440];
      float64x2_t v215 = *(float64x2_t *)&STACK[0x1430];
      float64x2_t v216 = *(float64x2_t *)&STACK[0x1460];
      float64x2_t v217 = *(float64x2_t *)&STACK[0x1450];
      float64x2_t v218 = *(float64x2_t *)&STACK[0x1480];
      float64x2_t v219 = *(float64x2_t *)&STACK[0x1470];
      float64x2_t v220 = *(float64x2_t *)&STACK[0x14A0];
      float64x2_t v221 = *(float64x2_t *)&STACK[0x1490];
      *(_OWORD *)&STACK[0x1030] = 0u;
      *(_OWORD *)&STACK[0x1040] = 0u;
      *(_OWORD *)&STACK[0x1050] = 0u;
      *(_OWORD *)&STACK[0x1060] = 0u;
      *(_OWORD *)&STACK[0x1070] = 0u;
      *(_OWORD *)&STACK[0x1080] = 0u;
      *(_OWORD *)&STACK[0x1090] = 0u;
      *(_OWORD *)&STACK[0x10A0] = 0u;
      do
      {
        float64x2_t v223 = *(float64x2_t *)((char *)&STACK[0xFB0] + v213);
        float64x2_t v222 = *(float64x2_t *)((char *)&STACK[0xFB0] + v213 + 16);
        float64x2_t v224 = (float64x2_t *)((char *)&STACK[0x1030] + v213);
        *float64x2_t v224 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v215, v223.f64[0]), v217, v223, 1), v219, v222.f64[0]), v221, v222, 1);
        v224[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v214, v223.f64[0]), v216, v223, 1), v218, v222.f64[0]), v220, v222, 1);
        v213 += 32;
      }
      while (v213 != 128);
      uint64_t v225 = 0;
      float64x2_t v226 = *(float64x2_t *)&STACK[0x13C0];
      float64x2_t v227 = *(float64x2_t *)&STACK[0x13B0];
      float64x2_t v228 = *(float64x2_t *)&STACK[0x13E0];
      float64x2_t v229 = *(float64x2_t *)&STACK[0x13D0];
      float64x2_t v230 = *(float64x2_t *)&STACK[0x1400];
      float64x2_t v231 = *(float64x2_t *)&STACK[0x13F0];
      float64x2_t v232 = *(float64x2_t *)&STACK[0x1420];
      float64x2_t v233 = *(float64x2_t *)&STACK[0x1410];
      *(_OWORD *)&STACK[0x1930] = 0u;
      *(_OWORD *)&STACK[0x1940] = 0u;
      *(_OWORD *)&STACK[0x1950] = 0u;
      *(_OWORD *)&STACK[0x1960] = 0u;
      *(_OWORD *)&STACK[0x1970] = 0u;
      *(_OWORD *)&STACK[0x1980] = 0u;
      *(_OWORD *)&STACK[0x1990] = 0u;
      *(_OWORD *)&STACK[0x19A0] = 0u;
      do
      {
        float64x2_t v235 = *(float64x2_t *)((char *)&STACK[0x1030] + v225);
        float64x2_t v234 = *(float64x2_t *)((char *)&STACK[0x1030] + v225 + 16);
        v236 = (float64x2_t *)((char *)&STACK[0x1930] + v225);
        float64x2_t *v236 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v227, v235.f64[0]), v229, v235, 1), v231, v234.f64[0]), v233, v234, 1);
        v236[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v226, v235.f64[0]), v228, v235, 1), v230, v234.f64[0]), v232, v234, 1);
        v225 += 32;
      }
      while (v225 != 128);
    }
    long long v237 = *(_OWORD *)&STACK[0x1980];
    *(_OWORD *)&STACK[0x1270] = *(_OWORD *)&STACK[0x1970];
    *(_OWORD *)&STACK[0x1280] = v237;
    long long v238 = *(_OWORD *)&STACK[0x19A0];
    *(_OWORD *)&STACK[0x1290] = *(_OWORD *)&STACK[0x1990];
    *(_OWORD *)&STACK[0x12A0] = v238;
    long long v239 = *(_OWORD *)&STACK[0x1940];
    *(_OWORD *)&STACK[0x1230] = *(_OWORD *)&STACK[0x1930];
    *(_OWORD *)&STACK[0x1240] = v239;
    long long v240 = *(_OWORD *)&STACK[0x1960];
    *(_OWORD *)&STACK[0x1250] = *(_OWORD *)&STACK[0x1950];
    *(_OWORD *)&STACK[0x1260] = v240;
LABEL_67:
    v241 = _ARLogTechnique_9();
    if (os_log_type_enabled(v241, OS_LOG_TYPE_INFO))
    {
      v242 = (objc_class *)objc_opt_class();
      v243 = NSStringFromClass(v242);
      unint64_t v244 = *(void *)(a1 + 40);
      long long v245 = *(_OWORD *)&STACK[0x1280];
      *(_OWORD *)&STACK[0x1970] = *(_OWORD *)&STACK[0x1270];
      *(_OWORD *)&STACK[0x1980] = v245;
      long long v246 = *(_OWORD *)&STACK[0x12A0];
      *(_OWORD *)&STACK[0x1990] = *(_OWORD *)&STACK[0x1290];
      *(_OWORD *)&STACK[0x19A0] = v246;
      long long v247 = *(_OWORD *)&STACK[0x1240];
      *(_OWORD *)&STACK[0x1930] = *(_OWORD *)&STACK[0x1230];
      *(_OWORD *)&STACK[0x1940] = v247;
      long long v248 = *(_OWORD *)&STACK[0x1260];
      *(_OWORD *)&STACK[0x1950] = *(_OWORD *)&STACK[0x1250];
      *(_OWORD *)&STACK[0x1960] = v248;
      v249.n128_f64[0] = ARMatrix4x4DoubleToFloat((float64x2_t *)&STACK[0x1930]);
      v253 = ARMatrix4x4Description(0, v249, v250, v251, v252);
      LODWORD(STACK[0x1930]) = 138543875;
      STACK[0x1934] = (unint64_t)v243;
      LOWORD(STACK[0x193C]) = 2048;
      STACK[0x193E] = v244;
      LOWORD(STACK[0x1946]) = 2113;
      STACK[0x1948] = (unint64_t)v253;
      _os_log_impl(&dword_1B88A2000, v241, OS_LOG_TYPE_INFO, "%{public}@ <%p>: New ENUFromVIO = %{private}@", (uint8_t *)&STACK[0x1930], 0x20u);
    }
    v254 = _ARLogTechnique_9();
    if (os_log_type_enabled(v254, OS_LOG_TYPE_DEBUG))
    {
      v255 = (objc_class *)objc_opt_class();
      v256 = NSStringFromClass(v255);
      unint64_t v257 = *(void *)(a1 + 40);
      long long v258 = *(_OWORD *)&STACK[0x1400];
      *(_OWORD *)&STACK[0x1970] = *(_OWORD *)&STACK[0x13F0];
      *(_OWORD *)&STACK[0x1980] = v258;
      long long v259 = *(_OWORD *)&STACK[0x1420];
      *(_OWORD *)&STACK[0x1990] = *(_OWORD *)&STACK[0x1410];
      *(_OWORD *)&STACK[0x19A0] = v259;
      long long v260 = *(_OWORD *)&STACK[0x13C0];
      *(_OWORD *)&STACK[0x1930] = *(_OWORD *)&STACK[0x13B0];
      *(_OWORD *)&STACK[0x1940] = v260;
      long long v261 = *(_OWORD *)&STACK[0x13E0];
      *(_OWORD *)&STACK[0x1950] = *(_OWORD *)&STACK[0x13D0];
      *(_OWORD *)&STACK[0x1960] = v261;
      v262.n128_f64[0] = ARMatrix4x4DoubleToFloat((float64x2_t *)&STACK[0x1930]);
      v266 = ARMatrix4x4Description(1, v262, v263, v264, v265);
      LODWORD(STACK[0x1930]) = 138543875;
      STACK[0x1934] = (unint64_t)v256;
      LOWORD(STACK[0x193C]) = 2048;
      STACK[0x193E] = v257;
      LOWORD(STACK[0x1946]) = 2113;
      STACK[0x1948] = (unint64_t)v266;
      _os_log_impl(&dword_1B88A2000, v254, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: enuFromEcef = %{private}@", (uint8_t *)&STACK[0x1930], 0x20u);
    }
    v267 = _ARLogTechnique_9();
    if (os_log_type_enabled(v267, OS_LOG_TYPE_DEBUG))
    {
      v268 = (objc_class *)objc_opt_class();
      v269 = NSStringFromClass(v268);
      unint64_t v270 = *(void *)(a1 + 40);
      long long v271 = *(_OWORD *)&STACK[0x1300];
      *(_OWORD *)&STACK[0x1970] = *(_OWORD *)&STACK[0x12F0];
      *(_OWORD *)&STACK[0x1980] = v271;
      long long v272 = *(_OWORD *)&STACK[0x1320];
      *(_OWORD *)&STACK[0x1990] = *(_OWORD *)&STACK[0x1310];
      *(_OWORD *)&STACK[0x19A0] = v272;
      long long v273 = *(_OWORD *)&STACK[0x12C0];
      *(_OWORD *)&STACK[0x1930] = *(_OWORD *)&STACK[0x12B0];
      *(_OWORD *)&STACK[0x1940] = v273;
      long long v274 = *(_OWORD *)&STACK[0x12E0];
      *(_OWORD *)&STACK[0x1950] = *(_OWORD *)&STACK[0x12D0];
      *(_OWORD *)&STACK[0x1960] = v274;
      v275.n128_f64[0] = ARMatrix4x4DoubleToFloat((float64x2_t *)&STACK[0x1930]);
      v279 = ARMatrix4x4Description(0, v275, v276, v277, v278);
      LODWORD(STACK[0x1930]) = 138543874;
      STACK[0x1934] = (unint64_t)v269;
      LOWORD(STACK[0x193C]) = 2048;
      STACK[0x193E] = v270;
      LOWORD(STACK[0x1946]) = 2112;
      STACK[0x1948] = (unint64_t)v279;
      _os_log_impl(&dword_1B88A2000, v267, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: camCVFromVIO = %@", (uint8_t *)&STACK[0x1930], 0x20u);
    }
    long long v280 = *(_OWORD *)&STACK[0x1280];
    *(_OWORD *)&STACK[0x1970] = *(_OWORD *)&STACK[0x1270];
    *(_OWORD *)&STACK[0x1980] = v280;
    long long v281 = *(_OWORD *)&STACK[0x12A0];
    *(_OWORD *)&STACK[0x1990] = *(_OWORD *)&STACK[0x1290];
    *(_OWORD *)&STACK[0x19A0] = v281;
    long long v282 = *(_OWORD *)&STACK[0x1240];
    *(_OWORD *)&STACK[0x1930] = *(_OWORD *)&STACK[0x1230];
    *(_OWORD *)&STACK[0x1940] = v282;
    long long v283 = *(_OWORD *)&STACK[0x1260];
    *(_OWORD *)&STACK[0x1950] = *(_OWORD *)&STACK[0x1250];
    *(_OWORD *)&STACK[0x1960] = v283;
    __invert_d4();
    double v350 = ARMatrix4x4DoubleToFloat(&a43);
    double v352 = v284;
    double v357 = v285;
    double v359 = v286;
    int v287 = *(unsigned __int8 *)(*(void *)(a1 + 40) + 75);
    v288 = _ARLogTechnique_9();
    BOOL v289 = os_log_type_enabled(v288, OS_LOG_TYPE_INFO);
    if (v287)
    {
      if (v289)
      {
        v290 = (objc_class *)objc_opt_class();
        v291 = NSStringFromClass(v290);
        unint64_t v292 = *(void *)(a1 + 40);
        int v293 = *(unsigned __int8 *)(v292 + 73);
        int v294 = *(unsigned __int8 *)(v292 + 74);
        LODWORD(STACK[0x1930]) = 138544130;
        STACK[0x1934] = (unint64_t)v291;
        LOWORD(STACK[0x193C]) = 2048;
        STACK[0x193E] = v292;
        LOWORD(STACK[0x1946]) = 1024;
        LODWORD(STACK[0x1948]) = v293;
        LOWORD(STACK[0x194C]) = 1024;
        LODWORD(STACK[0x194E]) = v294;
        _os_log_impl(&dword_1B88A2000, v288, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Setting target ENUFromVIO for GCF, _useCoreLocationFusion=%d, _useCoreMotionFusion=%d", (uint8_t *)&STACK[0x1930], 0x22u);
      }
      if ([*(id *)(a1 + 32) VLHasExecuted])
      {
        uint64_t v295 = *(void *)(a1 + 40);
        if (!*(unsigned char *)(v295 + 73) && !*(unsigned char *)(v295 + 74))
        {
          v296 = [*(id *)(a1 + 32) gradualCorrectionFilter];
          long long v297 = *(_OWORD *)&STACK[0x12A0];
          a33 = *(_OWORD *)&STACK[0x1290];
          a34 = v297;
          [v296 setTargetTranslation:&a33];

          uint64_t v295 = *(void *)(a1 + 40);
        }
        if (!*(unsigned char *)(v295 + 74))
        {
          v298 = [*(id *)(a1 + 32) gradualCorrectionFilter];
          long long v299 = *(_OWORD *)&STACK[0x1280];
          *(_OWORD *)&STACK[0x1970] = *(_OWORD *)&STACK[0x1270];
          *(_OWORD *)&STACK[0x1980] = v299;
          long long v300 = *(_OWORD *)&STACK[0x12A0];
          *(_OWORD *)&STACK[0x1990] = *(_OWORD *)&STACK[0x1290];
          *(_OWORD *)&STACK[0x19A0] = v300;
          long long v301 = *(_OWORD *)&STACK[0x1240];
          *(_OWORD *)&STACK[0x1930] = *(_OWORD *)&STACK[0x1230];
          *(_OWORD *)&STACK[0x1940] = v301;
          long long v302 = *(_OWORD *)&STACK[0x1260];
          *(_OWORD *)&STACK[0x1950] = *(_OWORD *)&STACK[0x1250];
          *(_OWORD *)&STACK[0x1960] = v302;
          [v298 setTargetRotation:&STACK[0x1930]];
          v303 = 0;
LABEL_99:

          goto LABEL_100;
        }
LABEL_92:
        v303 = 0;
LABEL_100:
        os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 40) + 56));
        v338 = [*(id *)(a1 + 32) resultDatas];
        [v338 addObject:v143];

        if (v303)
        {
          v339 = [*(id *)(a1 + 32) resultDatas];
          [v339 addObject:v303];
        }
        os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 40) + 56));
        os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 40) + 88));
        [*(id *)(a1 + 40) _setTrackingState:3 techniqueStateObject:*(void *)(a1 + 32)];
        os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 40) + 88));
        [*(id *)(a1 + 64) timestamp];
        objc_msgSend(*(id *)(a1 + 32), "setLastVLExecutionTimestamp:");

        id v46 = v351;
        goto LABEL_103;
      }
      v317 = _ARLogTechnique_9();
      if (os_log_type_enabled(v317, OS_LOG_TYPE_INFO))
      {
        v318 = (objc_class *)objc_opt_class();
        v319 = NSStringFromClass(v318);
        unint64_t v320 = *(void *)(a1 + 40);
        LODWORD(STACK[0x1930]) = 138543618;
        STACK[0x1934] = (unint64_t)v319;
        LOWORD(STACK[0x193C]) = 2048;
        STACK[0x193E] = v320;
        _os_log_impl(&dword_1B88A2000, v317, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Creating GCF", (uint8_t *)&STACK[0x1930], 0x16u);
      }
      v321 = [ARGeoTrackingGradualCorrectionFilter alloc];
      long long v322 = *(_OWORD *)&STACK[0x1280];
      *(_OWORD *)&STACK[0x1970] = *(_OWORD *)&STACK[0x1270];
      *(_OWORD *)&STACK[0x1980] = v322;
      long long v323 = *(_OWORD *)&STACK[0x12A0];
      *(_OWORD *)&STACK[0x1990] = *(_OWORD *)&STACK[0x1290];
      *(_OWORD *)&STACK[0x19A0] = v323;
      long long v324 = *(_OWORD *)&STACK[0x1240];
      *(_OWORD *)&STACK[0x1930] = *(_OWORD *)&STACK[0x1230];
      *(_OWORD *)&STACK[0x1940] = v324;
      long long v325 = *(_OWORD *)&STACK[0x1260];
      *(_OWORD *)&STACK[0x1950] = *(_OWORD *)&STACK[0x1250];
      *(_OWORD *)&STACK[0x1960] = v325;
      v326 = [(ARGeoTrackingGradualCorrectionFilter *)v321 initWithTargetTransform:&STACK[0x1930]];
      [*(id *)(a1 + 32) setGradualCorrectionFilter:v326];

      long long v327 = *(_OWORD *)&STACK[0x1280];
      a39 = *(_OWORD *)&STACK[0x1270];
      a40 = v327;
      long long v328 = *(_OWORD *)&STACK[0x12A0];
      a41 = *(_OWORD *)&STACK[0x1290];
      a42 = v328;
      long long v329 = *(_OWORD *)&STACK[0x1240];
      a35 = *(_OWORD *)&STACK[0x1230];
      a36 = v329;
      long long v330 = *(_OWORD *)&STACK[0x1260];
      a37 = *(_OWORD *)&STACK[0x1250];
      a38 = v330;
      v331 = *(void **)(a1 + 32);
      v332 = &a35;
    }
    else
    {
      if (v289)
      {
        v304 = (objc_class *)objc_opt_class();
        v305 = NSStringFromClass(v304);
        unint64_t v306 = *(void *)(a1 + 40);
        int v307 = *(unsigned __int8 *)(v306 + 73);
        int v308 = *(unsigned __int8 *)(v306 + 74);
        LODWORD(STACK[0x1930]) = 138544130;
        STACK[0x1934] = (unint64_t)v305;
        LOWORD(STACK[0x193C]) = 2048;
        STACK[0x193E] = v306;
        LOWORD(STACK[0x1946]) = 1024;
        LODWORD(STACK[0x1948]) = v307;
        LOWORD(STACK[0x194C]) = 1024;
        LODWORD(STACK[0x194E]) = v308;
        _os_log_impl(&dword_1B88A2000, v288, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Setting ENUFromVIO, _useCoreLocationFusion=%d, _useCoreMotionFusion=%d", (uint8_t *)&STACK[0x1930], 0x22u);
      }
      if ([*(id *)(a1 + 32) VLHasExecuted])
      {
        uint64_t v309 = *(void *)(a1 + 40);
        if (!*(unsigned char *)(v309 + 73) && !*(unsigned char *)(v309 + 74))
        {
          v310 = *(void **)(a1 + 32);
          long long v311 = *(_OWORD *)&STACK[0x12A0];
          a23 = *(_OWORD *)&STACK[0x1290];
          a24 = v311;
          [v310 setEnuFromVIOTranslation:&a23];
          uint64_t v309 = *(void *)(a1 + 40);
        }
        if (!*(unsigned char *)(v309 + 74))
        {
          v312 = *(void **)(a1 + 32);
          long long v313 = *(_OWORD *)&STACK[0x1280];
          *(_OWORD *)&STACK[0x1970] = *(_OWORD *)&STACK[0x1270];
          *(_OWORD *)&STACK[0x1980] = v313;
          long long v314 = *(_OWORD *)&STACK[0x12A0];
          *(_OWORD *)&STACK[0x1990] = *(_OWORD *)&STACK[0x1290];
          *(_OWORD *)&STACK[0x19A0] = v314;
          long long v315 = *(_OWORD *)&STACK[0x1240];
          *(_OWORD *)&STACK[0x1930] = *(_OWORD *)&STACK[0x1230];
          *(_OWORD *)&STACK[0x1940] = v315;
          long long v316 = *(_OWORD *)&STACK[0x1260];
          *(_OWORD *)&STACK[0x1950] = *(_OWORD *)&STACK[0x1250];
          *(_OWORD *)&STACK[0x1960] = v316;
          [v312 setEnuFromVIORotation:&STACK[0x1930]];
          uint64_t v309 = *(void *)(a1 + 40);
        }
        if (*(unsigned char *)(v309 + 73) || *(unsigned char *)(v309 + 74)) {
          goto LABEL_92;
        }
LABEL_98:
        v337 = [ARGeoTrackingData alloc];
        v298 = [*(id *)(a1 + 32) enuOrigin];
        v303 = -[ARGeoTrackingData initWithENUOrigin:vioFromENU:](v337, "initWithENUOrigin:vioFromENU:", v298, v350, v352, v357, v359);
        goto LABEL_99;
      }
      long long v333 = *(_OWORD *)&STACK[0x1280];
      a29 = *(_OWORD *)&STACK[0x1270];
      a30 = v333;
      long long v334 = *(_OWORD *)&STACK[0x12A0];
      a31 = *(_OWORD *)&STACK[0x1290];
      a32 = v334;
      long long v335 = *(_OWORD *)&STACK[0x1240];
      a25 = *(_OWORD *)&STACK[0x1230];
      a26 = v335;
      long long v336 = *(_OWORD *)&STACK[0x1260];
      a27 = *(_OWORD *)&STACK[0x1250];
      a28 = v336;
      v331 = *(void **)(a1 + 32);
      v332 = &a25;
    }
    [v331 setEnuFromVIO:v332];
    goto LABEL_98;
  }
  long long v62 = _ARLogTechnique_9();
  long long v63 = v358;
  if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
  {
    uint64_t v64 = (objc_class *)objc_opt_class();
    long long v65 = NSStringFromClass(v64);
    unint64_t v66 = *(void *)(a1 + 40);
    LODWORD(STACK[0x1930]) = 138543618;
    STACK[0x1934] = (unint64_t)v65;
    LOWORD(STACK[0x193C]) = 2048;
    STACK[0x193E] = v66;
    _os_log_impl(&dword_1B88A2000, v62, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Geo tracking has been reset. Dropping VL result.", (uint8_t *)&STACK[0x1930], 0x16u);
  }
  [*(id *)(a1 + 40) setVLPoseEstimationExecuting:0];
  long long v67 = v353;
  if (*(unsigned char *)(*(void *)(a1 + 40) + 72)) {
LABEL_12:
  }
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
LABEL_13:
}

- (void)_callVLWithHandle:(double)a3 pixelBuffer:(__n128)a4 deviceLocation:(__n128)a5 heading:(__n128)a6 inputGravity:(__n128)a7 vioTransform:(uint64_t)a8 cameraIntrinsics:(void *)a9 radialDistortion:(uint64_t)a10 exposureTargetOffset:(void *)a11 timestamp:(long long *)a12 vlDeterminismSemaphore:(void *)a13 completionHandler:(void *)a14
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  long long v35 = *a12;
  long long v36 = a12[1];
  id v27 = a9;
  id v28 = a11;
  double v29 = a13;
  id v30 = a14;
  if (*(unsigned char *)(a1 + 72))
  {
    v60[0] = v35;
    v60[1] = v36;
    objc_msgSend(v27, "_deterministicLocateWithPixelBuffer:deviceLocation:heading:gravity:transform:cameraIntrinsics:radialDistortion:exposureTargetOffset:timestamp:completionHandler:", a10, v28, v60, v30, a2, a3, a4.n128_f64[0], a5.n128_f64[0], a6.n128_f64[0], a7.n128_f64[0], a15, a16, a17, a18, a19, a20);
    dispatch_semaphore_wait(v29, 0xFFFFFFFFFFFFFFFFLL);
    double v31 = _ARLogTechnique_9();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      double v32 = (objc_class *)objc_opt_class();
      long long v33 = NSStringFromClass(v32);
      *(_DWORD *)buf = 138543874;
      long long v62 = v33;
      __int16 v63 = 2048;
      uint64_t v64 = a1;
      __int16 v65 = 2048;
      uint64_t v66 = a20;
      _os_log_impl(&dword_1B88A2000, v31, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Deterministic VL call completed at timestamp=%f", buf, 0x20u);
    }
  }
  else
  {
    long long v34 = *(NSObject **)(a1 + 64);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __211__ARGeoTrackingTechnique__callVLWithHandle_pixelBuffer_deviceLocation_heading_inputGravity_vioTransform_cameraIntrinsics_radialDistortion_exposureTargetOffset_timestamp_vlDeterminismSemaphore_completionHandler___block_invoke;
    block[3] = &unk_1E61875F8;
    uint64_t v51 = v27;
    uint64_t v54 = a10;
    id v52 = v28;
    double v55 = a2;
    double v56 = a3;
    long long v42 = v35;
    long long v43 = v36;
    __n128 v44 = a4;
    __n128 v45 = a5;
    __n128 v46 = a6;
    __n128 v47 = a7;
    long long v48 = a15;
    long long v49 = a16;
    long long v50 = a17;
    uint64_t v57 = a18;
    uint64_t v58 = a19;
    uint64_t v59 = a20;
    id v53 = v30;
    dispatch_async(v34, block);

    double v31 = v51;
  }
}

void __211__ARGeoTrackingTechnique__callVLWithHandle_pixelBuffer_deviceLocation_heading_inputGravity_vioTransform_cameraIntrinsics_radialDistortion_exposureTargetOffset_timestamp_vlDeterminismSemaphore_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 200);
  double v3 = *(void **)(a1 + 176);
  uint64_t v4 = *(void *)(a1 + 184);
  long long v5 = *(_OWORD *)(a1 + 32);
  long long v6 = *(_OWORD *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 224);
  uint64_t v8 = *(void *)(a1 + 232);
  uint64_t v9 = *(void *)(a1 + 240);
  id v15 = 0;
  double v10 = *(double *)(a1 + 208);
  double v11 = *(double *)(a1 + 216);
  v14[0] = v5;
  v14[1] = v6;
  objc_msgSend(v3, "locateWithPixelBuffer:deviceLocation:heading:gravity:transform:cameraIntrinsics:radialDistortion:ambientLightIntensity:timestamp:error:", v2, v4, v14, &v15, v10, v11, *(double *)(a1 + 64), *(double *)(a1 + 80), *(double *)(a1 + 96), *(double *)(a1 + 112), *(void *)(a1 + 128), *(void *)(a1 + 136), *(void *)(a1 + 144), *(void *)(a1 + 152), *(void *)(a1 + 160), *(void *)(a1 + 168),
    v7,
    v8,
  id v12 = v9);
  id v13 = v15;
  (*(void (**)(void))(*(void *)(a1 + 192) + 16))();
}

- (void)_estimateEnuFromVioFromCLCM:(id)a3
{
  STACK[0xF78] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(ARGeoTrackingTechniqueState *)self->_state enuOrigin];
  long long v6 = (void *)v5;
  if (v4 && v5)
  {
    [v4 timestamp];
    double v8 = v7;
    uint64_t v9 = -[ARGeoTrackingTechniqueState findClosestVioPoseToTimestamp:](self->_state, "findClosestVioPoseToTimestamp:");
    if (!v9)
    {
      id v15 = _ARLogTechnique_9();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        uint64_t v20 = (objc_class *)objc_opt_class();
        long long v21 = NSStringFromClass(v20);
        LODWORD(STACK[0xEE0]) = 138543874;
        STACK[0xEE4] = (unint64_t)v21;
        LOWORD(STACK[0xEEC]) = 2048;
        STACK[0xEEE] = (unint64_t)self;
        LOWORD(STACK[0xEF6]) = 2048;
        *(double *)&STACK[0xEF8] = v8;
        _os_log_impl(&dword_1B88A2000, v15, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: CLCM No VIO pose found near timestamp: %f; bailing out",
          (uint8_t *)&STACK[0xEE0],
          0x20u);
      }
      goto LABEL_101;
    }
    [v4 timestamp];
    double v11 = v10;
    [v9 timestamp];
    double v13 = v12;
    if (self->_useCoreMotionFusion)
    {
      double v14 = [(ARGeoTrackingTechniqueState *)self->_state findClosestDeviceMotionDataToTimestamp:v8];
      if (v14)
      {
        id v15 = v14;
        [v14 timestamp];
        double v17 = vabdd_f64(v16, v8);
        goto LABEL_15;
      }
      long long v22 = _ARLogTechnique_9();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        long long v23 = (objc_class *)objc_opt_class();
        float v24 = NSStringFromClass(v23);
        LODWORD(STACK[0xEE0]) = 138543874;
        STACK[0xEE4] = (unint64_t)v24;
        LOWORD(STACK[0xEEC]) = 2048;
        STACK[0xEEE] = (unint64_t)self;
        LOWORD(STACK[0xEF6]) = 2048;
        *(double *)&STACK[0xEF8] = v8;
        _os_log_impl(&dword_1B88A2000, v22, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: CLCM No device orientation found near timestamp: %f", (uint8_t *)&STACK[0xEE0], 0x20u);
      }
    }
    id v15 = 0;
    double v17 = 1.79769313e308;
LABEL_15:
    id v25 = [(ARGeoTrackingTechniqueState *)self->_state lastLocationProcessedForFusion];

    [(ARGeoTrackingTechniqueState *)self->_state setLastLocationProcessedForFusion:v4];
    *(_OWORD *)&STACK[0xDD0] = 0u;
    *(_OWORD *)&STACK[0xDC0] = 0u;
    *(_OWORD *)&STACK[0xDB0] = 0u;
    *(_OWORD *)&STACK[0xDA0] = 0u;
    *(_OWORD *)&STACK[0xD90] = 0u;
    *(_OWORD *)&STACK[0xD80] = 0u;
    *(_OWORD *)&STACK[0xD70] = 0u;
    float64x2_t v214 = 0u;
    *(_OWORD *)&STACK[0xD60] = 0u;
    [v9 transform];
    if (self->_useGradualCorrection)
    {
      double v26 = [(ARGeoTrackingTechniqueState *)self->_state gradualCorrectionFilter];
      id v27 = v26;
      if (v26)
      {
        [v26 ENUFromVIOTarget];
        float64x2_t v206 = *(float64x2_t *)&STACK[0xEF0];
        float64x2_t v207 = *(float64x2_t *)&STACK[0xEE0];
        float64x2_t v208 = *(float64x2_t *)&STACK[0xF10];
        float64x2_t v209 = *(float64x2_t *)&STACK[0xF00];
        float64x2_t v210 = *(float64x2_t *)&STACK[0xF30];
        float64x2_t v211 = *(float64x2_t *)&STACK[0xF20];
        float64x2_t v213 = *(float64x2_t *)&STACK[0xF50];
        float64x2_t v214 = *(float64x2_t *)&STACK[0xF40];
      }
      else
      {
        float64x2_t v213 = 0u;
        float64x2_t v210 = 0u;
        float64x2_t v211 = 0u;
        float64x2_t v208 = 0u;
        float64x2_t v209 = 0u;
        float64x2_t v206 = 0u;
        float64x2_t v207 = 0u;
      }
    }
    else
    {
      state = self->_state;
      if (state)
      {
        [(ARGeoTrackingTechniqueState *)state enuFromVIO];
        float64x2_t v206 = *(float64x2_t *)&STACK[0xEF0];
        float64x2_t v207 = *(float64x2_t *)&STACK[0xEE0];
        float64x2_t v208 = *(float64x2_t *)&STACK[0xF10];
        float64x2_t v209 = *(float64x2_t *)&STACK[0xF00];
        float64x2_t v210 = *(float64x2_t *)&STACK[0xF30];
        float64x2_t v211 = *(float64x2_t *)&STACK[0xF20];
        float64x2_t v213 = *(float64x2_t *)&STACK[0xF50];
        float64x2_t v214 = *(float64x2_t *)&STACK[0xF40];
      }
      else
      {
        float64x2_t v214 = 0u;
        float64x2_t v213 = 0u;
        float64x2_t v210 = 0u;
        float64x2_t v211 = 0u;
        float64x2_t v208 = 0u;
        float64x2_t v209 = 0u;
        float64x2_t v206 = 0u;
        float64x2_t v207 = 0u;
      }
    }
    int v29 = 0;
    if (v25 == v4)
    {
      int v31 = 0;
    }
    else
    {
      double v30 = vabdd_f64(v11, v13);
      int v31 = 0;
      if (v30 < 1.0)
      {
        long long v212 = v15;
        char v204 = v6;
        double v32 = _ARLogTechnique_9();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          long long v33 = (objc_class *)objc_opt_class();
          long long v34 = NSStringFromClass(v33);
          long long v35 = [v4 location];
          int v36 = [v35 isCoordinateFused];
          uint64_t v37 = [v4 location];
          int v38 = [v37 isCoordinateFusedWithVL];
          int v39 = [v212 fused];
          LODWORD(STACK[0xEE0]) = 138544386;
          STACK[0xEE4] = (unint64_t)v34;
          LOWORD(STACK[0xEEC]) = 2048;
          STACK[0xEEE] = (unint64_t)self;
          LOWORD(STACK[0xEF6]) = 1024;
          LODWORD(STACK[0xEF8]) = v36;
          LOWORD(STACK[0xEFC]) = 1024;
          LODWORD(STACK[0xEFE]) = v38;
          LOWORD(STACK[0xF02]) = 1024;
          LODWORD(STACK[0xF04]) = v39;
          _os_log_impl(&dword_1B88A2000, v32, OS_LOG_TYPE_INFO, "%{public}@ <%p>: CLCM Performing fusion update, fusedLocation=%d, VLFusedLocation=%d, fusedMotion=%d.", (uint8_t *)&STACK[0xEE0], 0x28u);
        }
        long long v40 = *(_OWORD *)&STACK[0xDB0];
        *(_OWORD *)&STACK[0xF20] = *(_OWORD *)&STACK[0xDA0];
        *(_OWORD *)&STACK[0xF30] = v40;
        long long v41 = *(_OWORD *)&STACK[0xDD0];
        *(_OWORD *)&STACK[0xF40] = *(_OWORD *)&STACK[0xDC0];
        *(_OWORD *)&STACK[0xF50] = v41;
        long long v42 = *(_OWORD *)&STACK[0xD70];
        *(_OWORD *)&STACK[0xEE0] = *(_OWORD *)&STACK[0xD60];
        *(_OWORD *)&STACK[0xEF0] = v42;
        long long v43 = *(_OWORD *)&STACK[0xD90];
        *(_OWORD *)&STACK[0xF00] = *(_OWORD *)&STACK[0xD80];
        *(_OWORD *)&STACK[0xF10] = v43;
        __invert_d4();
        uint64_t v44 = 0;
        *(_OWORD *)&STACK[0xE60] = 0u;
        *(_OWORD *)&STACK[0xE70] = 0u;
        *(_OWORD *)&STACK[0xE80] = 0u;
        *(_OWORD *)&STACK[0xE90] = 0u;
        *(_OWORD *)&STACK[0xEA0] = 0u;
        *(_OWORD *)&STACK[0xEB0] = 0u;
        *(_OWORD *)&STACK[0xEC0] = 0u;
        *(_OWORD *)&STACK[0xED0] = 0u;
        do
        {
          float64x2_t v46 = *(float64x2_t *)((char *)&STACK[0xCE0] + v44);
          float64x2_t v45 = *(float64x2_t *)((char *)&STACK[0xCE0] + v44 + 16);
          __n128 v47 = (float64x2_t *)((char *)&STACK[0xE60] + v44);
          float64x2_t *v47 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v207, v46.f64[0]), v209, v46, 1), v211, v45.f64[0]), v214, v45, 1);
          v47[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v206, v46.f64[0]), v208, v46, 1), v210, v45.f64[0]), v213, v45, 1);
          v44 += 32;
        }
        while (v44 != 128);
        if (self->_useCoreLocationFusion
          && ([v4 location],
              long long v48 = objc_claimAutoreleasedReturnValue(),
              int v49 = [v48 isCoordinateFusedWithVL],
              v48,
              v49))
        {
          long long v50 = _ARLogTechnique_9();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
          {
            uint64_t v51 = (objc_class *)objc_opt_class();
            id v52 = NSStringFromClass(v51);
            LODWORD(STACK[0xEE0]) = 138543874;
            STACK[0xEE4] = (unint64_t)v52;
            LOWORD(STACK[0xEEC]) = 2048;
            STACK[0xEEE] = (unint64_t)self;
            LOWORD(STACK[0xEF6]) = 2048;
            *(double *)&STACK[0xEF8] = v30;
            _os_log_impl(&dword_1B88A2000, v50, OS_LOG_TYPE_INFO, "%{public}@ <%p>: CLCM Computing translation from CL fusion, time diff VIO-CL=%fs", (uint8_t *)&STACK[0xEE0], 0x20u);
          }
          [v204 locationECEF];
          long long v200 = *(_OWORD *)&STACK[0xCD0];
          long long vars0a = *(_OWORD *)&STACK[0xCC0];
          [v4 locationECEF];
          long long v53 = *(_OWORD *)&STACK[0xCA0];
          long long v54 = *(_OWORD *)&STACK[0xCB0];
          *(_OWORD *)&STACK[0xC70] = v200;
          *(_OWORD *)&STACK[0xC60] = vars0a;
          *(_OWORD *)&STACK[0xC50] = v54;
          *(_OWORD *)&STACK[0xC40] = v53;
          ARECEFToENU(&STACK[0xC80]);
          long long v55 = *(_OWORD *)&STACK[0xC90];
          *(_OWORD *)&STACK[0xEC0] = *(_OWORD *)&STACK[0xC80];
          *(_OWORD *)&STACK[0xED0] = (unint64_t)v55;
          int v31 = 1;
        }
        else
        {
          int v31 = 0;
        }
        if (!self->_useCoreMotionFusion || v212 == 0)
        {
          int v57 = 0;
        }
        else
        {
          int v58 = [v212 fused];
          int v57 = 0;
          if (v58 && v17 < 0.02)
          {
            uint64_t v59 = _ARLogTechnique_9();
            if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
            {
              uint64_t v60 = (objc_class *)objc_opt_class();
              uint64_t v61 = NSStringFromClass(v60);
              LODWORD(STACK[0xEE0]) = 138543874;
              STACK[0xEE4] = (unint64_t)v61;
              LOWORD(STACK[0xEEC]) = 2048;
              STACK[0xEEE] = (unint64_t)self;
              LOWORD(STACK[0xEF6]) = 2048;
              *(double *)&STACK[0xEF8] = v17;
              _os_log_impl(&dword_1B88A2000, v59, OS_LOG_TYPE_INFO, "%{public}@ <%p>: CLCM Computing rotation from CM fusion, time diff VIO-CM=%fs", (uint8_t *)&STACK[0xEE0], 0x20u);
            }
            long long v62 = objc_opt_class();
            long long v63 = *(_OWORD *)&STACK[0xEB0];
            *(_OWORD *)&STACK[0xF20] = *(_OWORD *)&STACK[0xEA0];
            *(_OWORD *)&STACK[0xF30] = v63;
            long long v64 = *(_OWORD *)&STACK[0xED0];
            *(_OWORD *)&STACK[0xF40] = *(_OWORD *)&STACK[0xEC0];
            *(_OWORD *)&STACK[0xF50] = v64;
            long long v65 = *(_OWORD *)&STACK[0xE70];
            *(_OWORD *)&STACK[0xEE0] = *(_OWORD *)&STACK[0xE60];
            *(_OWORD *)&STACK[0xEF0] = v65;
            long long v66 = *(_OWORD *)&STACK[0xE90];
            *(_OWORD *)&STACK[0xF00] = *(_OWORD *)&STACK[0xE80];
            *(_OWORD *)&STACK[0xF10] = v66;
            [v62 getHeadingForEnuFromCam:&STACK[0xEE0]];
            double v68 = v67;
            *(_OWORD *)&STACK[0xC30] = 0u;
            *(_OWORD *)&STACK[0xC20] = 0u;
            *(_OWORD *)&STACK[0xC10] = 0u;
            *(_OWORD *)&STACK[0xC00] = 0u;
            *(_OWORD *)&STACK[0xBF0] = 0u;
            *(_OWORD *)&STACK[0xBE0] = 0u;
            *(_OWORD *)&STACK[0xBD0] = 0u;
            *(_OWORD *)&STACK[0xBC0] = 0u;
            [v212 transform];
            long long v69 = *(_OWORD *)&STACK[0xB90];
            *(_OWORD *)&STACK[0xF20] = *(_OWORD *)&STACK[0xB80];
            *(_OWORD *)&STACK[0xF30] = v69;
            long long v70 = *(_OWORD *)&STACK[0xBB0];
            *(_OWORD *)&STACK[0xF40] = *(_OWORD *)&STACK[0xBA0];
            *(_OWORD *)&STACK[0xF50] = v70;
            long long v71 = *(_OWORD *)&STACK[0xB50];
            *(_OWORD *)&STACK[0xEE0] = *(_OWORD *)&STACK[0xB40];
            *(_OWORD *)&STACK[0xEF0] = v71;
            long long v72 = *(_OWORD *)&STACK[0xB70];
            *(_OWORD *)&STACK[0xF00] = *(_OWORD *)&STACK[0xB60];
            *(_OWORD *)&STACK[0xF10] = v72;
            __invert_d4();
            uint64_t v73 = objc_opt_class();
            long long v74 = *(_OWORD *)&STACK[0xC10];
            *(_OWORD *)&STACK[0xF20] = *(_OWORD *)&STACK[0xC00];
            *(_OWORD *)&STACK[0xF30] = v74;
            long long v75 = *(_OWORD *)&STACK[0xC30];
            *(_OWORD *)&STACK[0xF40] = *(_OWORD *)&STACK[0xC20];
            *(_OWORD *)&STACK[0xF50] = v75;
            long long v76 = *(_OWORD *)&STACK[0xBD0];
            *(_OWORD *)&STACK[0xEE0] = *(_OWORD *)&STACK[0xBC0];
            *(_OWORD *)&STACK[0xEF0] = v76;
            long long v77 = *(_OWORD *)&STACK[0xBF0];
            *(_OWORD *)&STACK[0xF00] = *(_OWORD *)&STACK[0xBE0];
            *(_OWORD *)&STACK[0xF10] = v77;
            [v73 getHeadingForEnuFromCam:&STACK[0xEE0]];
            double v79 = v78;
            *(_OWORD *)&STACK[0xF50] = 0u;
            *(_OWORD *)&STACK[0xF40] = 0u;
            *(_OWORD *)&STACK[0xF30] = 0u;
            *(_OWORD *)&STACK[0xF20] = 0u;
            *(_OWORD *)&STACK[0xF10] = 0u;
            *(_OWORD *)&STACK[0xF00] = 0u;
            *(_OWORD *)&STACK[0xEF0] = 0u;
            *(_OWORD *)&STACK[0xEE0] = 0u;
            *(float *)&double v78 = v78 - v68;
            __float2 v80 = __sincosf_stret(*(float *)&v78 * 0.5);
            _Q2 = vmulq_n_f32((float32x4_t)xmmword_1B8A2B0C0, v80.__sinval);
            _S3 = _Q2.i32[1];
            _S5 = _Q2.i32[2];
            __asm { FMLS            S0, S5, V2.S[2] }
            *(float *)&unsigned int v88 = _S0 + (float)(v80.__cosval * v80.__cosval);
            float v89 = vmlas_n_f32(vmuls_lane_f32(v80.__cosval, _Q2, 2), _Q2.f32[1], _Q2.f32[0]);
            *(float *)&unsigned int v90 = v89 + v89;
            float v91 = vmlas_n_f32(-(float)(v80.__cosval * _Q2.f32[1]), _Q2.f32[2], _Q2.f32[0]);
            *(float *)&unsigned int v92 = v91 + v91;
            v93.i64[0] = __PAIR64__(v90, v88);
            v93.i64[1] = v92;
            float v94 = vmlas_n_f32(-(float)(v80.__cosval * _Q2.f32[2]), _Q2.f32[1], _Q2.f32[0]);
            __asm
            {
              FMLA            S4, S3, V2.S[1]
              FMLS            S16, S2, V2.S[0]
              FMLA            S4, S5, V2.S[1]
            }
            *(float *)&unsigned int v98 = _S4 + _S4;
            v99.f32[0] = v94 + v94;
            v99.i32[1] = _S16;
            v99.i64[1] = v98;
            __asm
            {
              FMLA            S6, S2, V2.S[2]
              FMLA            S7, S5, V2.S[1]
              FMLA            S1, S5, V2.S[2]
              FMLS            S1, S2, V2.S[0]
              FMLS            S1, S3, V2.S[1]
            }
            _Q2.f32[0] = _S6 + _S6;
            _Q2.f32[1] = _S7 + _S7;
            _Q2.i64[1] = _S1;
            ARMatrix4x4FloatToDouble((float64x2_t *)&STACK[0xEE0], v93, v99, _Q2, (float32x4_t)xmmword_1B8A2B050);
            uint64_t v105 = 0;
            float64x2_t v106 = *(float64x2_t *)&STACK[0xE70];
            float64x2_t v107 = *(float64x2_t *)&STACK[0xE60];
            float64x2_t v108 = *(float64x2_t *)&STACK[0xE90];
            float64x2_t v109 = *(float64x2_t *)&STACK[0xE80];
            float64x2_t v110 = *(float64x2_t *)&STACK[0xEB0];
            float64x2_t v111 = *(float64x2_t *)&STACK[0xEA0];
            float64x2_t v112 = *(float64x2_t *)&STACK[0xED0];
            float64x2_t v113 = *(float64x2_t *)&STACK[0xEC0];
            long long v114 = *(_OWORD *)&STACK[0xF30];
            *(_OWORD *)&STACK[0xB00] = *(_OWORD *)&STACK[0xF20];
            *(_OWORD *)&STACK[0xB10] = v114;
            long long v115 = *(_OWORD *)&STACK[0xF50];
            *(_OWORD *)&STACK[0xB20] = *(_OWORD *)&STACK[0xF40];
            *(_OWORD *)&STACK[0xB30] = v115;
            long long v116 = *(_OWORD *)&STACK[0xEF0];
            *(_OWORD *)&STACK[0xAC0] = *(_OWORD *)&STACK[0xEE0];
            *(_OWORD *)&STACK[0xAD0] = v116;
            long long v117 = *(_OWORD *)&STACK[0xF10];
            *(_OWORD *)&STACK[0xAE0] = *(_OWORD *)&STACK[0xF00];
            *(_OWORD *)&STACK[0xAF0] = v117;
            *(_OWORD *)&STACK[0xE50] = 0u;
            *(_OWORD *)&STACK[0xE40] = 0u;
            *(_OWORD *)&STACK[0xE30] = 0u;
            *(_OWORD *)&STACK[0xE20] = 0u;
            *(_OWORD *)&STACK[0xE10] = 0u;
            *(_OWORD *)&STACK[0xE00] = 0u;
            *(_OWORD *)&STACK[0xDF0] = 0u;
            *(_OWORD *)&STACK[0xDE0] = 0u;
            do
            {
              float64x2_t v119 = *(float64x2_t *)((char *)&STACK[0xAC0] + v105);
              float64x2_t v118 = *(float64x2_t *)((char *)&STACK[0xAC0] + v105 + 16);
              double v120 = (float64x2_t *)((char *)&STACK[0xDE0] + v105);
              *double v120 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v107, v119.f64[0]), v109, v119, 1), v111, v118.f64[0]), v113, v118, 1);
              v120[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v106, v119.f64[0]), v108, v119, 1), v110, v118.f64[0]), v112, v118, 1);
              v105 += 32;
            }
            while (v105 != 128);
            long long v121 = *(_OWORD *)&STACK[0xE30];
            *(_OWORD *)&STACK[0xEA0] = *(_OWORD *)&STACK[0xE20];
            *(_OWORD *)&STACK[0xEB0] = v121;
            long long v122 = *(_OWORD *)&STACK[0xE50];
            *(_OWORD *)&STACK[0xEC0] = *(_OWORD *)&STACK[0xE40];
            *(_OWORD *)&STACK[0xED0] = v122;
            long long v123 = *(_OWORD *)&STACK[0xDF0];
            *(_OWORD *)&STACK[0xE60] = *(_OWORD *)&STACK[0xDE0];
            *(_OWORD *)&STACK[0xE70] = v123;
            long long v124 = *(_OWORD *)&STACK[0xE10];
            *(_OWORD *)&STACK[0xE80] = *(_OWORD *)&STACK[0xE00];
            *(_OWORD *)&STACK[0xE90] = v124;
            uint64_t v125 = objc_opt_class();
            long long v126 = *(_OWORD *)&STACK[0xEB0];
            *(_OWORD *)&STACK[0xE20] = *(_OWORD *)&STACK[0xEA0];
            *(_OWORD *)&STACK[0xE30] = v126;
            long long v127 = *(_OWORD *)&STACK[0xED0];
            *(_OWORD *)&STACK[0xE40] = *(_OWORD *)&STACK[0xEC0];
            *(_OWORD *)&STACK[0xE50] = v127;
            long long v128 = *(_OWORD *)&STACK[0xE70];
            *(_OWORD *)&STACK[0xDE0] = *(_OWORD *)&STACK[0xE60];
            *(_OWORD *)&STACK[0xDF0] = v128;
            long long v129 = *(_OWORD *)&STACK[0xE90];
            *(_OWORD *)&STACK[0xE00] = *(_OWORD *)&STACK[0xE80];
            *(_OWORD *)&STACK[0xE10] = v129;
            [v125 getHeadingForEnuFromCam:&STACK[0xDE0]];
            double v131 = v130;
            double v132 = _ARLogTechnique_9();
            if (os_log_type_enabled(v132, OS_LOG_TYPE_DEBUG))
            {
              long long v133 = (objc_class *)objc_opt_class();
              long long v134 = NSStringFromClass(v133);
              LODWORD(STACK[0xDE0]) = 138544387;
              STACK[0xDE4] = (unint64_t)v134;
              LOWORD(STACK[0xDEC]) = 2048;
              STACK[0xDEE] = (unint64_t)self;
              LOWORD(STACK[0xDF6]) = 2049;
              *(double *)&STACK[0xDF8] = v68 * 0.318309886 * 180.0;
              LOWORD(STACK[0xE00]) = 2049;
              *(double *)&STACK[0xE02] = v79 * 0.318309886 * 180.0;
              LOWORD(STACK[0xE0A]) = 2049;
              *(double *)&STACK[0xE0C] = v131 * 0.318309886 * 180.0;
              _os_log_impl(&dword_1B88A2000, v132, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: CLCM origHeading=%{private}f,cmHeading=%{private}f,newHeading=%{private}f", (uint8_t *)&STACK[0xDE0], 0x34u);
            }
            int v57 = 1;
            int v31 = 1;
          }
        }
        uint64_t v135 = 0;
        float64x2_t v136 = *(float64x2_t *)&STACK[0xE70];
        float64x2_t v137 = *(float64x2_t *)&STACK[0xE60];
        float64x2_t v138 = *(float64x2_t *)&STACK[0xE90];
        float64x2_t v139 = *(float64x2_t *)&STACK[0xE80];
        float64x2_t v140 = *(float64x2_t *)&STACK[0xEB0];
        float64x2_t v141 = *(float64x2_t *)&STACK[0xEA0];
        float64x2_t v142 = *(float64x2_t *)&STACK[0xED0];
        float64x2_t v143 = *(float64x2_t *)&STACK[0xEC0];
        long long v144 = *(_OWORD *)&STACK[0xDB0];
        *(_OWORD *)&STACK[0xC00] = *(_OWORD *)&STACK[0xDA0];
        *(_OWORD *)&STACK[0xC10] = v144;
        long long v145 = *(_OWORD *)&STACK[0xDD0];
        *(_OWORD *)&STACK[0xC20] = *(_OWORD *)&STACK[0xDC0];
        *(_OWORD *)&STACK[0xC30] = v145;
        long long v146 = *(_OWORD *)&STACK[0xD70];
        *(_OWORD *)&STACK[0xBC0] = *(_OWORD *)&STACK[0xD60];
        *(_OWORD *)&STACK[0xBD0] = v146;
        long long v147 = *(_OWORD *)&STACK[0xD90];
        *(_OWORD *)&STACK[0xBE0] = *(_OWORD *)&STACK[0xD80];
        *(_OWORD *)&STACK[0xBF0] = v147;
        *(_OWORD *)&STACK[0xF50] = 0u;
        *(_OWORD *)&STACK[0xF40] = 0u;
        *(_OWORD *)&STACK[0xF30] = 0u;
        *(_OWORD *)&STACK[0xF20] = 0u;
        *(_OWORD *)&STACK[0xF10] = 0u;
        *(_OWORD *)&STACK[0xF00] = 0u;
        *(_OWORD *)&STACK[0xEF0] = 0u;
        *(_OWORD *)&STACK[0xEE0] = 0u;
        do
        {
          float64x2_t v149 = *(float64x2_t *)((char *)&STACK[0xBC0] + v135);
          float64x2_t v148 = *(float64x2_t *)((char *)&STACK[0xBC0] + v135 + 16);
          float32x4_t v150 = (float64x2_t *)((char *)&STACK[0xEE0] + v135);
          float64x2_t *v150 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v137, v149.f64[0]), v139, v149, 1), v141, v148.f64[0]), v143, v148, 1);
          v150[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v136, v149.f64[0]), v138, v149, 1), v140, v148.f64[0]), v142, v148, 1);
          v135 += 32;
        }
        while (v135 != 128);
        float64x2_t v205 = *(float64x2_t *)&STACK[0xF50];
        float64x2_t v201 = *(float64x2_t *)&STACK[0xF30];
        float64x2_t vars0 = *(float64x2_t *)&STACK[0xF40];
        float64x2_t v198 = *(float64x2_t *)&STACK[0xF10];
        float64x2_t v199 = *(float64x2_t *)&STACK[0xF20];
        float64x2_t v196 = *(float64x2_t *)&STACK[0xEF0];
        float64x2_t v197 = *(float64x2_t *)&STACK[0xF00];
        float64x2_t v195 = *(float64x2_t *)&STACK[0xEE0];
        if (v31)
        {
          float64x2_t v151 = vsubq_f64(*(float64x2_t *)&STACK[0xF50], v213);
          float64x2_t v152 = vsubq_f64(*(float64x2_t *)&STACK[0xF40], v214);
          double v153 = vaddvq_f64(vaddq_f64(vmulq_f64(v152, v152), vmulq_f64(v151, v151)));
          uint64_t v154 = _ARLogTechnique_9();
          BOOL v155 = os_log_type_enabled(v154, OS_LOG_TYPE_DEBUG);
          if (v153 >= 0.0625)
          {
            double v156 = fabs(v153);
            if (v156 < INFINITY || v156 > INFINITY)
            {
              if (v155)
              {
                long long v159 = (objc_class *)objc_opt_class();
                v160 = NSStringFromClass(v159);
                uint64_t v161 = ARVector3Description((__n128)vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vars0), v205));
                LODWORD(STACK[0xEE0]) = 138543875;
                STACK[0xEE4] = (unint64_t)v160;
                LOWORD(STACK[0xEEC]) = 2048;
                STACK[0xEEE] = (unint64_t)self;
                LOWORD(STACK[0xEF6]) = 2113;
                STACK[0xEF8] = (unint64_t)v161;
                _os_log_impl(&dword_1B88A2000, v154, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: CLCM ENUFromVIO new translation vector: %{private}@", (uint8_t *)&STACK[0xEE0], 0x20u);
              }
              uint64_t v162 = self->_state;
              if (self->_useGradualCorrection)
              {
                long long v163 = [(ARGeoTrackingTechniqueState *)v162 gradualCorrectionFilter];
                *(float64x2_t *)&STACK[0xAA0] = vars0;
                *(float64x2_t *)&STACK[0xAB0] = v205;
                [v163 setTargetTranslation:&STACK[0xAA0]];

                if (v57) {
                  goto LABEL_67;
                }
              }
              else
              {
                *(float64x2_t *)&STACK[0xA80] = vars0;
                *(float64x2_t *)&STACK[0xA90] = v205;
                [(ARGeoTrackingTechniqueState *)v162 setEnuFromVIOTranslation:&STACK[0xA80]];
                if (v57) {
                  goto LABEL_67;
                }
              }
LABEL_91:
              int v29 = 0;
              int v31 = 1;
              goto LABEL_92;
            }
          }
          if (v155)
          {
            long long v157 = (objc_class *)objc_opt_class();
            long long v158 = NSStringFromClass(v157);
            LODWORD(STACK[0xEE0]) = 138543618;
            STACK[0xEE4] = (unint64_t)v158;
            LOWORD(STACK[0xEEC]) = 2048;
            STACK[0xEEE] = (unint64_t)self;
            _os_log_impl(&dword_1B88A2000, v154, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: CLCM ENUFromVIO update: translation difference too small, ignoring", (uint8_t *)&STACK[0xEE0], 0x16u);
          }
          if ((v57 & 1) == 0) {
            goto LABEL_91;
          }
        }
        else if (!v57)
        {
          int v29 = 0;
          int v31 = 0;
LABEL_92:
          long long v6 = v204;
          id v15 = v212;
          goto LABEL_95;
        }
LABEL_67:
        *(float64x2_t *)&STACK[0xEF0] = v206;
        *(float64x2_t *)&STACK[0xEE0] = v207;
        *(float64x2_t *)&STACK[0xF10] = v208;
        *(float64x2_t *)&STACK[0xF00] = v209;
        *(float64x2_t *)&STACK[0xF30] = v210;
        *(float64x2_t *)&STACK[0xF20] = v211;
        *(float64x2_t *)&STACK[0xF50] = v213;
        *(float64x2_t *)&STACK[0xF40] = v214;
        __invert_d4();
        uint64_t v164 = 0;
        *(_OWORD *)&STACK[0xEE0] = 0u;
        *(_OWORD *)&STACK[0xEF0] = 0u;
        *(_OWORD *)&STACK[0xF00] = 0u;
        *(_OWORD *)&STACK[0xF10] = 0u;
        *(_OWORD *)&STACK[0xF20] = 0u;
        *(_OWORD *)&STACK[0xF30] = 0u;
        *(_OWORD *)&STACK[0xF40] = 0u;
        *(_OWORD *)&STACK[0xF50] = 0u;
        do
        {
          float64x2_t v166 = *(float64x2_t *)&v224[v164];
          float64x2_t v165 = *(float64x2_t *)&v224[v164 + 16];
          float64x2_t v167 = (float64x2_t *)((char *)&STACK[0xEE0] + v164);
          *float64x2_t v167 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v195, v166.f64[0]), v197, v166, 1), v199, v165.f64[0]), vars0, v165, 1);
          v167[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v196, v166.f64[0]), v198, v166, 1), v201, v165.f64[0]), v205, v165, 1);
          v164 += 32;
        }
        while (v164 != 128);
        double v168 = (*(double *)&STACK[0xEE0] + *(double *)&STACK[0xF08] + *(double *)&STACK[0xF30] + -1.0) * 0.5;
        double v169 = 1.0;
        if (v168 >= 1.001 || v168 <= 1.0) {
          double v169 = (*(double *)&STACK[0xEE0] + *(double *)&STACK[0xF08] + *(double *)&STACK[0xF30] + -1.0) * 0.5;
        }
        if (v168 >= -1.0 || v168 <= -1.001) {
          double v172 = v169;
        }
        else {
          double v172 = -1.0;
        }
        double v173 = acos(v172);
        float64x2_t v174 = _ARLogTechnique_9();
        BOOL v175 = os_log_type_enabled(v174, OS_LOG_TYPE_DEBUG);
        if (fabs(v173) == INFINITY || v173 * 180.0 < 3.14159265)
        {
          id v15 = v212;
          if (v175)
          {
            float64x2_t v185 = (objc_class *)objc_opt_class();
            float64x2_t v186 = NSStringFromClass(v185);
            LODWORD(STACK[0xE60]) = 138543618;
            STACK[0xE64] = (unint64_t)v186;
            LOWORD(STACK[0xE6C]) = 2048;
            STACK[0xE6E] = (unint64_t)self;
            _os_log_impl(&dword_1B88A2000, v174, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: CLCM ENUFromVIO update: rotation difference too small, ignoring", (uint8_t *)&STACK[0xE60], 0x16u);
          }
        }
        else
        {
          if (v175)
          {
            float64x2_t v176 = (objc_class *)objc_opt_class();
            float64x2_t v177 = NSStringFromClass(v176);
            *(float64x2_t *)&STACK[0xE70] = v196;
            *(float64x2_t *)&STACK[0xE60] = v195;
            *(float64x2_t *)&STACK[0xE90] = v198;
            *(float64x2_t *)&STACK[0xE80] = v197;
            *(float64x2_t *)&STACK[0xEB0] = v201;
            *(float64x2_t *)&STACK[0xEA0] = v199;
            *(float64x2_t *)&STACK[0xED0] = v205;
            *(float64x2_t *)&STACK[0xEC0] = vars0;
            v178.n128_f64[0] = ARMatrix4x4DoubleToFloat((float64x2_t *)&STACK[0xE60]);
            uint64_t v182 = ARMatrix4x4Description(0, v178, v179, v180, v181);
            LODWORD(STACK[0xE60]) = 138543875;
            STACK[0xE64] = (unint64_t)v177;
            LOWORD(STACK[0xE6C]) = 2048;
            STACK[0xE6E] = (unint64_t)self;
            LOWORD(STACK[0xE76]) = 2113;
            STACK[0xE78] = (unint64_t)v182;
            _os_log_impl(&dword_1B88A2000, v174, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: CLCM ENUFromVIO new rotation: %{private}@", (uint8_t *)&STACK[0xE60], 0x20u);
          }
          float64x2_t v183 = self->_state;
          id v15 = v212;
          if (self->_useGradualCorrection)
          {
            float64x2_t v184 = [(ARGeoTrackingTechniqueState *)v183 gradualCorrectionFilter];
            *(float64x2_t *)&STACK[0xE70] = v196;
            *(float64x2_t *)&STACK[0xE60] = v195;
            *(float64x2_t *)&STACK[0xE90] = v198;
            *(float64x2_t *)&STACK[0xE80] = v197;
            *(float64x2_t *)&STACK[0xEB0] = v201;
            *(float64x2_t *)&STACK[0xEA0] = v199;
            *(float64x2_t *)&STACK[0xED0] = v205;
            *(float64x2_t *)&STACK[0xEC0] = vars0;
            [v184 setTargetRotation:&STACK[0xE60]];
          }
          else
          {
            *(float64x2_t *)&STACK[0xE60] = v195;
            *(float64x2_t *)&STACK[0xE70] = v196;
            *(float64x2_t *)&STACK[0xE80] = v197;
            *(float64x2_t *)&STACK[0xE90] = v198;
            *(float64x2_t *)&STACK[0xEA0] = v199;
            *(float64x2_t *)&STACK[0xEB0] = v201;
            *(float64x2_t *)&STACK[0xEC0] = vars0;
            *(float64x2_t *)&STACK[0xED0] = v205;
            [(ARGeoTrackingTechniqueState *)v183 setEnuFromVIORotation:&STACK[0xE60]];
          }
        }
        long long v6 = v204;
        int v29 = 1;
      }
    }
LABEL_95:
    if ((v29 | v31) == 1 && !self->_useGradualCorrection)
    {
      float64x2_t v187 = self->_state;
      if (v187)
      {
        [(ARGeoTrackingTechniqueState *)v187 enuFromVIO];
      }
      else
      {
        long long v221 = 0u;
        long long v222 = 0u;
        long long v219 = 0u;
        long long v220 = 0u;
        long long v217 = 0u;
        long long v218 = 0u;
        long long v215 = 0u;
        long long v216 = 0u;
      }
      *(_OWORD *)&STACK[0xF20] = v219;
      *(_OWORD *)&STACK[0xF30] = v220;
      *(_OWORD *)&STACK[0xF40] = v221;
      *(_OWORD *)&STACK[0xF50] = v222;
      *(_OWORD *)&STACK[0xEE0] = v215;
      *(_OWORD *)&STACK[0xEF0] = v216;
      *(_OWORD *)&STACK[0xF00] = v217;
      *(_OWORD *)&STACK[0xF10] = v218;
      __invert_d4();
      double v188 = ARMatrix4x4DoubleToFloat(v223);
      float64x2_t v192 = -[ARGeoTrackingData initWithENUOrigin:vioFromENU:]([ARGeoTrackingData alloc], "initWithENUOrigin:vioFromENU:", v6, v188, v189, v190, v191);
      p_resultLock = &self->_resultLock;
      os_unfair_lock_lock(&self->_resultLock);
      double v194 = [(ARGeoTrackingTechniqueState *)self->_state resultDatas];
      [v194 addObject:v192];

      os_unfair_lock_unlock(p_resultLock);
    }
LABEL_101:

    goto LABEL_102;
  }
  uint64_t v9 = _ARLogTechnique_9();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    uint64_t v18 = (objc_class *)objc_opt_class();
    uint64_t v19 = NSStringFromClass(v18);
    LODWORD(STACK[0xEE0]) = 138543618;
    STACK[0xEE4] = (unint64_t)v19;
    LOWORD(STACK[0xEEC]) = 2048;
    STACK[0xEEE] = (unint64_t)self;
    _os_log_impl(&dword_1B88A2000, v9, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: At least one location must have been received so far.", (uint8_t *)&STACK[0xEE0], 0x16u);
  }
LABEL_102:
}

- (void)_updateVLStateData:(double)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  [(ARGeoTrackingTechniqueState *)self->_state lastVLExecutionTimestamp];
  double v6 = v5;
  [(ARGeoTrackingTechniqueState *)self->_state firstVLExecutionAttemptTimestamp];
  double v8 = v7;
  uint64_t v9 = [(ARGeoTrackingTechniqueState *)self->_state lastCLLocation];
  double v10 = [v9 location];
  [v10 horizontalAccuracy];
  double v12 = v11;
  double v13 = [v9 location];
  [v13 horizontalAccuracy];
  double v15 = v14;
  double v16 = [v9 location];
  [v16 verticalAccuracy];
  double v18 = v17;
  uint64_t v19 = [v9 location];
  [v19 verticalAccuracy];
  double v21 = v20;

  os_unfair_lock_lock(&self->_statusLock);
  int64_t v22 = [(ARGeoTrackingTechniqueState *)self->_state trackingState];
  int64_t v23 = [(ARGeoTrackingTechniqueState *)self->_state trackingAccuracy];
  int64_t v24 = [(ARGeoTrackingTechnique *)self _getHighestPriorityFailureWithTechniqueStateObject:self->_state];
  int64_t v25 = [(ARGeoTrackingTechniqueState *)self->_state failureReasons];
  BOOL v51 = [(ARGeoTrackingTechniqueState *)self->_state hasStartedAvailabilityCheck];
  BOOL v50 = [(ARGeoTrackingTechniqueState *)self->_state hasReturnedAvailabilityCheck];
  BOOL v49 = [(ARGeoTrackingTechniqueState *)self->_state hasStartedLocalization];
  BOOL v48 = [(ARGeoTrackingTechniqueState *)self->_state hasReturnedLocalization];
  os_unfair_lock_unlock(&self->_statusLock);
  if (v22 == 3)
  {
    double v26 = sqrt(v18 * v21 + v12 * v15);
    if (v26 >= 1.88)
    {
      if (v26 >= 3.64) {
        unint64_t v27 = 1;
      }
      else {
        unint64_t v27 = 2;
      }
    }
    else
    {
      unint64_t v27 = 3;
    }
  }
  else
  {
    unint64_t v27 = 0;
  }
  if (v27 != v23)
  {
    id v28 = _ARLogTechnique_9();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      int v29 = (objc_class *)objc_opt_class();
      NSStringFromClass(v29);
      double v30 = v47 = v24;
      int v31 = NSStringFromARGeoTrackingAccuracy(v27);
      *(_DWORD *)buf = 138543874;
      long long v53 = v30;
      __int16 v54 = 2048;
      long long v55 = self;
      __int16 v56 = 2112;
      int v57 = v31;
      _os_log_impl(&dword_1B88A2000, v28, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Geo tracking (base level) accuracy changed to: %@", buf, 0x20u);

      int64_t v24 = v47;
    }

    os_unfair_lock_lock(&self->_statusLock);
    [(ARGeoTrackingTechniqueState *)self->_state setTrackingAccuracy:v27];
    os_unfair_lock_unlock(&self->_statusLock);
  }
  if (v8 > 0.0) {
    double v8 = a3 - v8;
  }
  if (v6 <= 0.0) {
    double v32 = v6;
  }
  else {
    double v32 = a3 - v6;
  }
  long long v33 = [[ARGeoTrackingStatus alloc] initWithGeoTrackingState:v22 accuracy:v27 stateReason:v24 failureReasons:v25];
  long long v34 = [(ARGeoTrackingTechniqueState *)self->_state lastCMDeviceMotion];
  long long v35 = [ARVLStateData alloc];
  int v36 = [v9 location];
  uint64_t v37 = (void *)[v36 copy];
  [v9 timestamp];
  double v39 = v38;
  long long v40 = [v34 deviceMotion];
  [v40 heading];
  double v42 = v41;
  [v34 timestamp];
  id v44 = [(ARVLStateData *)v35 init:v33 timeSinceInitialization:v37 trackingStatus:v51 fusedReplayLocation:v50 fusedReplayLocationTimestamp:v49 fusedReplayHeading:v48 fusedReplayHeadingTimestamp:v32 hasStartedAvailabilityCheck:v8 hasReturnedAvailabilityCheck:v39 hasStartedLocalization:v42 hasReturnedLocalization:v43];

  p_resultLock = &self->_resultLock;
  os_unfair_lock_lock(&self->_resultLock);
  float64x2_t v46 = [(ARGeoTrackingTechniqueState *)self->_state resultDatas];
  [v46 addObject:v44];

  os_unfair_lock_unlock(p_resultLock);
}

- (void)getLocationFromWorldPosition:(_OWORD *)a3@<X8> error:(__n128)a4@<Q0>
{
  v47[1] = *MEMORY[0x1E4F143B8];
  double v7 = (os_unfair_lock_s *)(a1 + 104);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
  id v8 = *(id *)(a1 + 112);
  os_unfair_lock_unlock(v7);
  if ([v8 trackingState] == 3)
  {
    long long v9 = 0uLL;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    memset(buf, 0, sizeof(buf));
    if (v8)
    {
      [v8 enuFromVIO];
      long long v9 = 0uLL;
    }
    long long v37 = v9;
    long long v38 = v9;
    long long v35 = v9;
    long long v36 = v9;
    long long v33 = v9;
    long long v34 = v9;
    long long v31 = v9;
    long long v32 = v9;
    double v10 = [v8 enuOrigin];
    double v11 = v10;
    if (v10)
    {
      [v10 ecefFromlocation];
    }
    else
    {
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
    }

    __n128 v19 = a4;
    v19.n128_u32[3] = 1.0;
    ARVisionTransformFromARTransform(*MEMORY[0x1E4F149A0], *(__n128 *)(MEMORY[0x1E4F149A0] + 16), *(__n128 *)(MEMORY[0x1E4F149A0] + 32), v19);
    ARECEFToLLA(&v29);
    uint64_t v26 = v29.i64[1];
    uint64_t v28 = v29.i64[0];
    double v20 = v30;
    double v21 = [v8 enuOrigin];
    [v21 undulation];
    *(double *)&long long v23 = ARWGS84ToMSLAltitude(v20, v22);
    long long v25 = v23;
  }
  else
  {
    double v12 = _ARLogTechnique_9();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      double v13 = (objc_class *)objc_opt_class();
      double v14 = NSStringFromClass(v13);
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v14;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = a1;
      _os_log_impl(&dword_1B88A2000, v12, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: getGeoLocationForPoint requires geo tracking to be localized.", buf, 0x16u);
    }
    if (a2)
    {
      uint64_t v46 = *MEMORY[0x1E4F28568];
      double v16 = ARKitCoreBundle();
      double v17 = [v16 localizedStringForKey:@"Geo tracking is not localized." value:&stru_1F120C8F0 table:@"Localizable_iOS"];
      v47[0] = v17;
      double v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:&v46 count:1];
      ARErrorWithCodeAndUserInfo(151, v18);
      *a2 = (id)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v28 = 0;
    uint64_t v26 = 0;
    *(void *)&long long v15 = 0;
    long long v25 = v15;
  }

  *(void *)&long long v24 = v28;
  *((void *)&v24 + 1) = v26;
  *a3 = v24;
  a3[1] = v25;
}

- (double)visualLocalizationCallInterval
{
  return self->_visualLocalizationCallInterval;
}

- (void)setVisualLocalizationCallInterval:(double)a3
{
  self->_visualLocalizationCallInterval = a3;
}

- (double)posteriorVisualLocalizationCallInterval
{
  return self->_posteriorVisualLocalizationCallInterval;
}

- (void)setPosteriorVisualLocalizationCallInterval:(double)a3
{
  self->_posteriorVisualLocalizationCallInterval = a3;
}

- (double)visualLocalizationCallIntervalTimeThreshold
{
  return self->_visualLocalizationCallIntervalTimeThreshold;
}

- (void)setVisualLocalizationCallIntervalTimeThreshold:(double)a3
{
  self->_visualLocalizationCallIntervalTimeThreshold = a3;
}

- (BOOL)visualLocalizationUpdatesRequested
{
  return self->_visualLocalizationUpdatesRequested;
}

- (void)setVisualLocalizationUpdatesRequested:(BOOL)a3
{
  self->_visualLocalizationUpdatesRequested = a3;
}

- (unint64_t)supportEnablementOptions
{
  return self->_supportEnablementOptions;
}

- (void)setSupportEnablementOptions:(unint64_t)a3
{
  self->_supportEnablementOptions = a3;
}

- (BOOL)VLPoseEstimationExecuting
{
  return self->_VLPoseEstimationExecuting;
}

- (void)setVLPoseEstimationExecuting:(BOOL)a3
{
  self->_VLPoseEstimationExecuting = a3;
}

- (VLTraceRecorder)VLTraceRecorder
{
  return (VLTraceRecorder *)objc_getProperty(self, a2, 168, 1);
}

- (void)setVLTraceRecorder:(id)a3
{
}

- (CLSimulationManager)locationSimulationManager
{
  return self->_locationSimulationManager;
}

- (void)setLocationSimulationManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationSimulationManager, 0);
  objc_storeStrong((id *)&self->_VLTraceRecorder, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_visualLocalizationQueue, 0);
}

@end