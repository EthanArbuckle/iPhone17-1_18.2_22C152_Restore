@interface ARGeoTrackingConfiguration
+ (BOOL)_verifyLocationPermissionsWithLocationManager:(id)a3 handler:(id)a4;
+ (BOOL)isSupported;
+ (BOOL)isSupportedWithOptions:(unint64_t)a3;
+ (BOOL)supportsAppClipCodeTracking;
+ (BOOL)supportsFrameSemantics:(unint64_t)a3;
+ (BOOL)verifyLocationPermissions;
+ (id)checkAvailabilityQueue;
+ (id)locationManagerQueue;
+ (id)recommendedVideoFormatFor4KResolution;
+ (id)recommendedVideoFormatForHighResolutionFrameCapturing;
+ (id)supportedVideoFormats;
+ (id)supportedVideoFormatsForUltraWide;
+ (int64_t)backdropCameraOverride;
+ (void)checkAvailabilityAtCoordinate:(CLLocationCoordinate2D)a3 withOptions:(unint64_t)a4 completionHandler:(id)a5;
+ (void)checkAvailabilityAtCoordinate:(CLLocationCoordinate2D)coordinate completionHandler:(void *)completionHandler;
+ (void)checkAvailabilityWithCompletionHandler:(void *)completionHandler;
+ (void)checkAvailabilityWithOptions:(unint64_t)a3 completionHandler:(id)a4;
+ (void)setBackdropCameraOverride:(int64_t)a3;
- (AREnvironmentTexturing)environmentTexturing;
- (ARGeoTrackingConfiguration)init;
- (ARImageSensorSettings)imageSensorSettingsForUltraWide;
- (ARPlaneDetection)planeDetection;
- (ARWorldAlignment)worldAlignment;
- (BOOL)alwaysUsePrimaryCameraForTracking;
- (BOOL)appClipCodeTrackingEnabled;
- (BOOL)automaticImageScaleEstimationEnabled;
- (BOOL)depthOptimizedForStaticScene;
- (BOOL)ignoreAppClipCodeURLLimitation;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLowQosSchedulingEnabled;
- (BOOL)isMLModelEnabled;
- (BOOL)shouldEnableVisionDataForImageSensorSettings:(id)a3;
- (BOOL)shouldUseJasper;
- (BOOL)shouldUseUltraWide;
- (BOOL)shouldUseUltraWideIfAvailable;
- (BOOL)useLidarIfAvailable;
- (BOOL)visualLocalizationUpdatesRequested;
- (BOOL)wantsHDREnvironmentTextures;
- (NSInteger)maximumNumberOfTrackedImages;
- (NSSet)detectionImages;
- (NSSet)detectionObjects;
- (double)minVergenceAngle;
- (double)visualLocalizationCallInterval;
- (id)_trackingOptions;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)imageSensorSettings;
- (id)parentImageSensorSettings;
- (int64_t)_depthPrioritization;
- (unint64_t)supportEnablementOptions;
- (void)createTechniques:(id)a3;
- (void)setAlwaysUsePrimaryCameraForTracking:(BOOL)a3;
- (void)setAppClipCodeTrackingEnabled:(BOOL)appClipCodeTrackingEnabled;
- (void)setAutomaticImageScaleEstimationEnabled:(BOOL)automaticImageScaleEstimationEnabled;
- (void)setDepthOptimizedForStaticScene:(BOOL)a3;
- (void)setDetectionImages:(NSSet *)detectionImages;
- (void)setDetectionObjects:(NSSet *)detectionObjects;
- (void)setEnvironmentTexturing:(AREnvironmentTexturing)environmentTexturing;
- (void)setIgnoreAppClipCodeURLLimitation:(BOOL)a3;
- (void)setLowQosSchedulingEnabled:(BOOL)a3;
- (void)setMaximumNumberOfTrackedImages:(NSInteger)maximumNumberOfTrackedImages;
- (void)setMinVergenceAngle:(double)a3;
- (void)setMlModelEnabled:(BOOL)a3;
- (void)setPlaneDetection:(ARPlaneDetection)planeDetection;
- (void)setShouldUseUltraWideIfAvailable:(BOOL)a3;
- (void)setSupportEnablementOptions:(unint64_t)a3;
- (void)setUseLidarIfAvailable:(BOOL)a3;
- (void)setVideoFormat:(id)a3;
- (void)setVisualLocalizationCallInterval:(double)a3;
- (void)setVisualLocalizationUpdatesRequested:(BOOL)a3;
- (void)setWantsHDREnvironmentTextures:(BOOL)wantsHDREnvironmentTextures;
- (void)setWorldAlignment:(ARWorldAlignment)worldAlignment;
@end

@implementation ARGeoTrackingConfiguration

+ (BOOL)isSupported
{
  return [a1 isSupportedWithOptions:0];
}

+ (BOOL)isSupportedWithOptions:(unint64_t)a3
{
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___ARGeoTrackingConfiguration;
  unsigned int v4 = objc_msgSendSuper2(&v6, sel_isSupported);
  if (v4) {
    LOBYTE(v4) = +[ARGeoTrackingTechnique isSupportedWithOptions:a3];
  }
  return v4;
}

+ (id)checkAvailabilityQueue
{
  id v2 = a1;
  objc_sync_enter(v2);
  v3 = (void *)checkAvailabilityQueue;
  if (!checkAvailabilityQueue)
  {
    uint64_t v4 = ARCreateFixedPriorityDispatchQueueWithQOS("com.apple.arkit.geoTrackingConfiguration.checkAvailabilityQueue");
    v5 = (void *)checkAvailabilityQueue;
    checkAvailabilityQueue = v4;

    v3 = (void *)checkAvailabilityQueue;
  }
  id v6 = v3;
  objc_sync_exit(v2);

  return v6;
}

+ (id)locationManagerQueue
{
  id v2 = a1;
  objc_sync_enter(v2);
  v3 = (void *)locationManagerQueue;
  if (!locationManagerQueue)
  {
    uint64_t v4 = ARCreateFixedPriorityDispatchQueueWithQOS("com.apple.arkit.geoTrackingConfiguration.locationManagerQueue");
    v5 = (void *)locationManagerQueue;
    locationManagerQueue = v4;

    v3 = (void *)locationManagerQueue;
  }
  id v6 = v3;
  objc_sync_exit(v2);

  return v6;
}

+ (BOOL)verifyLocationPermissions
{
  id v2 = a1;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__0;
  v20 = __Block_byref_object_dispose__0;
  id v21 = 0;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__0;
  v14 = __Block_byref_object_dispose__0;
  id v15 = 0;
  v3 = [a1 locationManagerQueue];
  dispatch_assert_queue_not_V2(v3);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__ARGeoTrackingConfiguration_verifyLocationPermissions__block_invoke;
  block[3] = &unk_1E61864E8;
  v8 = &v10;
  v9 = &v16;
  uint64_t v4 = v3;
  v7 = v4;
  dispatch_sync(v4, block);
  LOBYTE(v2) = [v2 _verifyLocationPermissionsWithLocationManager:v17[5] handler:v11[5]];

  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v16, 8);

  return (char)v2;
}

uint64_t __55__ARGeoTrackingConfiguration_verifyLocationPermissions__block_invoke(void *a1)
{
  uint64_t v2 = objc_opt_new();
  uint64_t v3 = *(void *)(a1[5] + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = [objc_alloc(MEMORY[0x1E4F1E600]) _initWithDelegate:*(void *)(*(void *)(a1[5] + 8) + 40) onQueue:a1[4]];
  uint64_t v6 = *(void *)(a1[6] + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  v8 = *(void **)(*(void *)(a1[5] + 8) + 40);
  uint64_t v9 = *(void *)(*(void *)(a1[6] + 8) + 40);
  return [v8 setLocationManager:v9];
}

- (void)setVisualLocalizationCallInterval:(double)a3
{
  self->_visualLocalizationCallInterval = a3;
  self->_posteriorVisualLocalizationCallInterval = a3;
}

+ (BOOL)_verifyLocationPermissionsWithLocationManager:(id)a3 handler:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([MEMORY[0x1E4F1E600] locationServicesEnabled])
  {
    int v8 = [v6 authorizationStatus];
    if (!v8)
    {
      [v6 requestWhenInUseAuthorization];
      int v8 = [v7 waitForAuthorizationStatus];
    }
    if ((v8 - 5) > 0xFFFFFFFD)
    {
      if (![v6 accuracyAuthorization])
      {
        BOOL v15 = 1;
        goto LABEL_14;
      }
      uint64_t v9 = _ARLogGeneral_11();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v14 = (objc_class *)objc_opt_class();
        v11 = NSStringFromClass(v14);
        int v17 = 138543618;
        uint64_t v18 = v11;
        __int16 v19 = 2048;
        id v20 = a1;
        uint64_t v12 = "%{public}@ <%p>: Precise location must be authorized for app to use geo tracking.";
        goto LABEL_12;
      }
    }
    else
    {
      uint64_t v9 = _ARLogGeneral_11();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        uint64_t v10 = (objc_class *)objc_opt_class();
        v11 = NSStringFromClass(v10);
        int v17 = 138543618;
        uint64_t v18 = v11;
        __int16 v19 = 2048;
        id v20 = a1;
        uint64_t v12 = "%{public}@ <%p>: Location services must be authorized for app to use geo tracking.";
LABEL_12:
        _os_log_impl(&dword_1B88A2000, v9, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&v17, 0x16u);
      }
    }
  }
  else
  {
    uint64_t v9 = _ARLogGeneral_11();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v13 = (objc_class *)objc_opt_class();
      v11 = NSStringFromClass(v13);
      int v17 = 138543618;
      uint64_t v18 = v11;
      __int16 v19 = 2048;
      id v20 = a1;
      uint64_t v12 = "%{public}@ <%p>: Location services must be enabled on device to use geo tracking.";
      goto LABEL_12;
    }
  }

  BOOL v15 = 0;
LABEL_14:

  return v15;
}

+ (void)checkAvailabilityWithCompletionHandler:(void *)completionHandler
{
}

+ (void)checkAvailabilityWithOptions:(unint64_t)a3 completionHandler:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = _ARLogGeneral_11();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v8);
    *(_DWORD *)buf = 138543618;
    v23 = v9;
    __int16 v24 = 2048;
    id v25 = a1;
    _os_log_impl(&dword_1B88A2000, v7, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Checking geo tracking availability at current device location", buf, 0x16u);
  }
  if ([a1 isSupportedWithOptions:a3])
  {
    uint64_t v10 = +[ARGeoTrackingConfiguration checkAvailabilityQueue];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __77__ARGeoTrackingConfiguration_checkAvailabilityWithOptions_completionHandler___block_invoke_2;
    v18[3] = &unk_1E6186588;
    v11 = (id *)v19;
    v19[0] = v6;
    v19[1] = a1;
    v19[2] = a3;
    id v12 = v6;
    v13 = v18;
  }
  else
  {
    v14 = _ARLogGeneral_11();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      BOOL v15 = (objc_class *)objc_opt_class();
      uint64_t v16 = NSStringFromClass(v15);
      *(_DWORD *)buf = 138543618;
      v23 = v16;
      __int16 v24 = 2048;
      id v25 = a1;
      _os_log_impl(&dword_1B88A2000, v14, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Geo tracking is not supported on this device", buf, 0x16u);
    }
    uint64_t v10 = +[ARGeoTrackingConfiguration checkAvailabilityQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __77__ARGeoTrackingConfiguration_checkAvailabilityWithOptions_completionHandler___block_invoke;
    block[3] = &unk_1E6186510;
    v11 = &v21;
    id v21 = v6;
    id v17 = v6;
    v13 = block;
  }
  dispatch_async(v10, v13);
}

void __77__ARGeoTrackingConfiguration_checkAvailabilityWithOptions_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  ARErrorWithCodeAndUserInfo(100, 0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void __77__ARGeoTrackingConfiguration_checkAvailabilityWithOptions_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__0;
  v41 = __Block_byref_object_dispose__0;
  id v42 = 0;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__0;
  v35 = __Block_byref_object_dispose__0;
  id v36 = 0;
  id v2 = [*(id *)(a1 + 40) locationManagerQueue];
  dispatch_assert_queue_not_V2(v2);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__ARGeoTrackingConfiguration_checkAvailabilityWithOptions_completionHandler___block_invoke_3;
  block[3] = &unk_1E61864E8;
  v29 = &v31;
  v30 = &v37;
  uint64_t v3 = v2;
  v28 = v3;
  dispatch_sync(v3, block);
  if ([*(id *)(a1 + 40) _verifyLocationPermissionsWithLocationManager:v38[5] handler:v32[5]])
  {
    dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
    v25[0] = 0;
    v25[1] = v25;
    v25[2] = 0x2810000000;
    v25[3] = &unk_1B8AA2BE2;
    int v26 = 0;
    v23[0] = 0;
    v23[1] = v23;
    v23[2] = 0x2020000000;
    char v24 = 0;
    uint64_t v5 = (void *)v32[5];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __77__ARGeoTrackingConfiguration_checkAvailabilityWithOptions_completionHandler___block_invoke_4;
    v16[3] = &unk_1E6186538;
    id v6 = v4;
    id v17 = v6;
    __int16 v19 = v25;
    id v20 = v23;
    id v7 = *(void **)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 48);
    uint64_t v21 = *(void *)(a1 + 40);
    uint64_t v22 = v8;
    id v18 = v7;
    [v5 requestLocationWithCompletionHandler:v16];
    dispatch_time_t v9 = dispatch_time(0, 10000000000);
    if (dispatch_semaphore_wait(v6, v9))
    {
      uint64_t v10 = +[ARGeoTrackingConfiguration checkAvailabilityQueue];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __77__ARGeoTrackingConfiguration_checkAvailabilityWithOptions_completionHandler___block_invoke_2_12;
      v12[3] = &unk_1E6186560;
      v14 = v25;
      BOOL v15 = v23;
      id v13 = *(id *)(a1 + 32);
      dispatch_async(v10, v12);
    }
    _Block_object_dispose(v23, 8);
    _Block_object_dispose(v25, 8);
  }
  else
  {
    uint64_t v11 = *(void *)(a1 + 32);
    id v6 = ARErrorWithCodeAndUserInfo(105, 0);
    (*(void (**)(uint64_t, void, NSObject *))(v11 + 16))(v11, 0, v6);
  }

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v37, 8);
}

uint64_t __77__ARGeoTrackingConfiguration_checkAvailabilityWithOptions_completionHandler___block_invoke_3(void *a1)
{
  uint64_t v2 = objc_opt_new();
  uint64_t v3 = *(void *)(a1[5] + 8);
  dispatch_semaphore_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = [objc_alloc(MEMORY[0x1E4F1E600]) _initWithDelegate:*(void *)(*(void *)(a1[5] + 8) + 40) onQueue:a1[4]];
  uint64_t v6 = *(void *)(a1[6] + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  [*(id *)(*(void *)(a1[6] + 8) + 40) setDesiredAccuracy:*MEMORY[0x1E4F1E6D8]];
  [*(id *)(*(void *)(a1[6] + 8) + 40) setActivityType:4];
  uint64_t v8 = *(void **)(*(void *)(a1[5] + 8) + 40);
  uint64_t v9 = *(void *)(*(void *)(a1[6] + 8) + 40);
  return [v8 setLocationManager:v9];
}

void __77__ARGeoTrackingConfiguration_checkAvailabilityWithOptions_completionHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 48) + 8) + 32));
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
  int v8 = *(unsigned __int8 *)(v7 + 24);
  *(unsigned char *)(v7 + 24) = 1;
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 48) + 8) + 32));
  if (v8)
  {
    uint64_t v9 = _ARLogGeneral_11();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = (objc_class *)objc_opt_class();
      uint64_t v11 = NSStringFromClass(v10);
      uint64_t v12 = *(void *)(a1 + 64);
      *(_DWORD *)buf = 138543618;
      uint64_t v22 = v11;
      __int16 v23 = 2048;
      uint64_t v24 = v12;
      _os_log_impl(&dword_1B88A2000, v9, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Availability check has already timed out.", buf, 0x16u);
    }
  }
  else if (v5)
  {
    id v13 = *(void **)(a1 + 64);
    [v5 coordinate];
    objc_msgSend(v13, "checkAvailabilityAtCoordinate:withOptions:completionHandler:", *(void *)(a1 + 72), *(void *)(a1 + 40));
  }
  else
  {
    v14 = _ARLogGeneral_11();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      BOOL v15 = (objc_class *)objc_opt_class();
      uint64_t v16 = NSStringFromClass(v15);
      uint64_t v17 = *(void *)(a1 + 64);
      *(_DWORD *)buf = 138543874;
      uint64_t v22 = v16;
      __int16 v23 = 2048;
      uint64_t v24 = v17;
      __int16 v25 = 2112;
      id v26 = v6;
      _os_log_impl(&dword_1B88A2000, v14, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Could not get location fix for geo tracking availability check: %@", buf, 0x20u);
    }
    id v18 = +[ARGeoTrackingConfiguration checkAvailabilityQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __77__ARGeoTrackingConfiguration_checkAvailabilityWithOptions_completionHandler___block_invoke_10;
    block[3] = &unk_1E6186510;
    id v20 = *(id *)(a1 + 40);
    dispatch_async(v18, block);
  }
}

void __77__ARGeoTrackingConfiguration_checkAvailabilityWithOptions_completionHandler___block_invoke_10(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  ARErrorWithCodeAndUserInfo(102, 0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void __77__ARGeoTrackingConfiguration_checkAvailabilityWithOptions_completionHandler___block_invoke_2_12(void *a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1[5] + 8) + 32));
  uint64_t v2 = *(void *)(a1[6] + 8);
  int v3 = *(unsigned __int8 *)(v2 + 24);
  *(unsigned char *)(v2 + 24) = 1;
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1[5] + 8) + 32));
  if (!v3)
  {
    uint64_t v4 = a1[4];
    ARErrorWithCodeAndUserInfo(501, 0);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, id))(v4 + 16))(v4, 0, v5);
  }
}

+ (void)checkAvailabilityAtCoordinate:(CLLocationCoordinate2D)coordinate completionHandler:(void *)completionHandler
{
}

+ (void)checkAvailabilityAtCoordinate:(CLLocationCoordinate2D)a3 withOptions:(unint64_t)a4 completionHandler:(id)a5
{
  CLLocationDegrees latitude = a3.latitude;
  CLLocationDegrees longitude = a3.longitude;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  if ([a1 isSupportedWithOptions:a4])
  {
    id v8 = (id)objc_opt_new();
    *(CLLocationDegrees *)&long long v9 = latitude;
    *((CLLocationDegrees *)&v9 + 1) = longitude;
    long long v25 = v9;
    long long v26 = 0u;
    ARLLAToECEF(v27);
    long long v16 = v27[1];
    long long v17 = v27[0];
    uint64_t v10 = +[ARGeoTrackingConfiguration checkAvailabilityQueue];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __90__ARGeoTrackingConfiguration_checkAvailabilityAtCoordinate_withOptions_completionHandler___block_invoke_2;
    v20[3] = &unk_1E61865B0;
    CLLocationDegrees v23 = latitude;
    CLLocationDegrees v24 = longitude;
    id v21 = v7;
    id v22 = a1;
    *(_OWORD *)buf = v17;
    *(_OWORD *)&buf[16] = v16;
    uint64_t v31 = 0;
    uint64_t v32 = 0;
    id v11 = v7;
    [v8 determineAvailabilityAtLocation:buf callbackQueue:v10 callback:v20];
  }
  else
  {
    uint64_t v12 = _ARLogGeneral_11();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = (objc_class *)objc_opt_class();
      v14 = NSStringFromClass(v13);
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v14;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = a1;
      _os_log_impl(&dword_1B88A2000, v12, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Geo tracking is not supported on this device", buf, 0x16u);
    }
    BOOL v15 = +[ARGeoTrackingConfiguration checkAvailabilityQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __90__ARGeoTrackingConfiguration_checkAvailabilityAtCoordinate_withOptions_completionHandler___block_invoke;
    block[3] = &unk_1E6186510;
    id v29 = v7;
    id v8 = v7;
    dispatch_async(v15, block);

    id v11 = v29;
  }
}

void __90__ARGeoTrackingConfiguration_checkAvailabilityAtCoordinate_withOptions_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  ARErrorWithCodeAndUserInfo(100, 0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void __90__ARGeoTrackingConfiguration_checkAvailabilityAtCoordinate_withOptions_completionHandler___block_invoke_2(void *a1, char a2, void *a3)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    id v6 = _ARLogGeneral_11();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = (objc_class *)objc_opt_class();
      id v8 = NSStringFromClass(v7);
      uint64_t v9 = a1[5];
      *(_DWORD *)buf = 138543618;
      v30 = v8;
      __int16 v31 = 2048;
      uint64_t v32 = v9;
      _os_log_impl(&dword_1B88A2000, v6, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Geo tracking availability check succeeded", buf, 0x16u);
    }
    uint64_t v10 = 0;
  }
  else
  {
    id v11 = _ARLogGeneral_11();
    uint64_t v12 = v11;
    if (v5)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        id v13 = (objc_class *)objc_opt_class();
        v14 = NSStringFromClass(v13);
        uint64_t v15 = a1[5];
        uint64_t v16 = a1[6];
        uint64_t v17 = a1[7];
        id v18 = [v5 localizedDescription];
        *(_DWORD *)buf = 138544387;
        v30 = v14;
        __int16 v31 = 2048;
        uint64_t v32 = v15;
        __int16 v33 = 2049;
        uint64_t v34 = v16;
        __int16 v35 = 2049;
        uint64_t v36 = v17;
        __int16 v37 = 2112;
        v38 = v18;
        _os_log_impl(&dword_1B88A2000, v12, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Geo tracking availability error at %{private}f, %{private}f: %@", buf, 0x34u);
      }
      __int16 v19 = [MEMORY[0x1E4F28B50] mainBundle];
      id v20 = [v19 localizedStringForKey:@"Failed to complete geo tracking availability check." value:&stru_1F120C8F0 table:0];

      uint64_t v27 = *MEMORY[0x1E4F28588];
      v28 = v20;
      id v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
      uint64_t v10 = ARErrorWithCodeAndUserInfo(501, v21);
    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        id v22 = (objc_class *)objc_opt_class();
        CLLocationDegrees v23 = NSStringFromClass(v22);
        uint64_t v24 = a1[5];
        uint64_t v25 = a1[6];
        uint64_t v26 = a1[7];
        *(_DWORD *)buf = 138544131;
        v30 = v23;
        __int16 v31 = 2048;
        uint64_t v32 = v24;
        __int16 v33 = 2049;
        uint64_t v34 = v25;
        __int16 v35 = 2049;
        uint64_t v36 = v26;
        _os_log_impl(&dword_1B88A2000, v12, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Geo tracking is not available at coordinate: %{private}f, %{private}f", buf, 0x2Au);
      }
      uint64_t v10 = ARErrorWithCodeAndUserInfo(201, 0);
    }
  }
  (*(void (**)(void))(a1[4] + 16))();
}

- (ARGeoTrackingConfiguration)init
{
  v17.receiver = self;
  v17.super_class = (Class)ARGeoTrackingConfiguration;
  id v2 = [(ARConfiguration *)&v17 initPrivate];
  int v3 = v2;
  if (v2)
  {
    [v2 setAutoFocusEnabled:1];
    [v3 setMaximumNumberOfTrackedImages:0];
    objc_msgSend(v3, "setWantsHDREnvironmentTextures:", +[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", @"com.apple.arkit.environmentTexturing.wantsHDR"));
    uint64_t v4 = objc_opt_new();
    id v5 = (void *)*((void *)v3 + 19);
    *((void *)v3 + 19) = v4;

    uint64_t v6 = objc_opt_new();
    id v7 = (void *)*((void *)v3 + 21);
    *((void *)v3 + 21) = v6;

    id v8 = objc_opt_new();
    [v8 minVergenceAngle];
    *((void *)v3 + 22) = v9;
    int v10 = +[ARKitUserDefaults BOOLForKey:@"com.apple.arkit.planeEstimation.mlOnANEDevices"];
    if (v10) {
      LOBYTE(v10) = ARAppleNeuralEngine();
    }
    v3[123] = v10;
    v3[124] = +[ARKitUserDefaults BOOLForKey:@"com.apple.arkit.planeEstimation.enableLowQosScheduling"];
    *(_WORD *)(v3 + 125) = 1;
    v3[127] = 0;
    v3[128] = 0;
    v3[122] = 0;
    +[ARKitUserDefaults floatForKey:@"com.apple.arkit.geotracking.visualLocalizationCallInterval"];
    *((double *)v3 + 23) = v11;
    +[ARKitUserDefaults floatForKey:@"com.apple.arkit.geotracking.posteriorVisualLocalizationCallInterval"];
    *((double *)v3 + 14) = v12;
    if (+[ARKitUserDefaults BOOLForKey:@"com.apple.arkit.geotracking.bypassChecksForANE"])
    {
      uint64_t v13 = 4;
    }
    else
    {
      uint64_t v13 = 0;
    }
    BOOL v14 = +[ARKitUserDefaults BOOLForKey:@"com.apple.arkit.geotracking.bypassChecksForGPS"];
    uint64_t v15 = v13 | 2;
    if (!v14) {
      uint64_t v15 = v13;
    }
    *((void *)v3 + 24) = v15;
    v3[129] = 1;
    v3[130] = 1;
  }
  return (ARGeoTrackingConfiguration *)v3;
}

+ (id)supportedVideoFormats
{
  if ([a1 isSupportedWithOptions:6])
  {
    id v2 = +[ARWorldTrackingConfiguration supportedVideoFormats];
  }
  else
  {
    id v2 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return v2;
}

+ (id)recommendedVideoFormatFor4KResolution
{
  return +[ARWorldTrackingConfiguration recommendedVideoFormatFor4KResolution];
}

+ (id)recommendedVideoFormatForHighResolutionFrameCapturing
{
  return +[ARWorldTrackingConfiguration recommendedVideoFormatForHighResolutionFrameCapturing];
}

+ (id)supportedVideoFormatsForUltraWide
{
  return +[ARWorldTrackingConfiguration supportedVideoFormatsForUltraWide];
}

+ (BOOL)supportsAppClipCodeTracking
{
  if (ARAppleNeuralEngine()) {
    return 1;
  }
  return +[ARAppClipCodeTechnique shouldRunCameraOrScannerPerformanceTestingMode];
}

- (BOOL)appClipCodeTrackingEnabled
{
  if (!self->_appClipCodeTrackingEnabled) {
    return 0;
  }
  id v2 = objc_opt_class();
  return [v2 supportsAppClipCodeTracking];
}

- (id)parentImageSensorSettings
{
  v9.receiver = self;
  v9.super_class = (Class)ARGeoTrackingConfiguration;
  int v3 = [(ARConfiguration *)&v9 parentImageSensorSettings];
  uint64_t v4 = [v3 settings];
  id v5 = (void *)[v4 mutableCopy];

  uint64_t v6 = [(ARGeoTrackingConfiguration *)self imageSensorSettingsForUltraWide];
  if (v6) {
    [v5 addObject:v6];
  }
  id v7 = [(ARConfiguration *)self depthSensorSettingsForJasper];
  if (v7) {
    [v5 addObject:v7];
  }
  [v3 setSettings:v5];

  return v3;
}

- (id)imageSensorSettings
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)ARGeoTrackingConfiguration;
  int v3 = [(ARConfiguration *)&v15 imageSensorSettings];
  objc_msgSend(v3, "setVisionDataOutputEnabled:", -[ARGeoTrackingConfiguration shouldEnableVisionDataForImageSensorSettings:](self, "shouldEnableVisionDataForImageSensorSettings:", v3));
  if ([v3 visionDataOutputEnabled])
  {
    uint64_t v4 = [(ARGeoTrackingConfiguration *)self _trackingOptions];
    [v4 setImageSensorSettings:v3];
    id v5 = [(ARGeoTrackingConfiguration *)self imageSensorSettingsForUltraWide];
    [v4 setImageSensorSettingsForUltraWide:v5];

    uint64_t v6 = ARVisionDataParametersForWorldTrackingOptions(v4);
    if (v6)
    {
      [v3 setVisionDataOutputParameters:v6];
      id v7 = _ARLogGeneral_11();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        id v8 = (objc_class *)objc_opt_class();
        objc_super v9 = NSStringFromClass(v8);
        *(_DWORD *)buf = 138543874;
        objc_super v17 = v9;
        __int16 v18 = 2048;
        __int16 v19 = self;
        __int16 v20 = 2112;
        id v21 = v6;
        int v10 = "%{public}@ <%p>: Setting vision data output parameters for wide: %@";
        float v11 = v7;
        uint32_t v12 = 32;
LABEL_7:
        _os_log_impl(&dword_1B88A2000, v11, OS_LOG_TYPE_DEBUG, v10, buf, v12);
      }
    }
    else
    {
      id v7 = _ARLogGeneral_11();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v13 = (objc_class *)objc_opt_class();
        objc_super v9 = NSStringFromClass(v13);
        *(_DWORD *)buf = 138543618;
        objc_super v17 = v9;
        __int16 v18 = 2048;
        __int16 v19 = self;
        int v10 = "%{public}@ <%p>: Did not receive vision data output parameters for wide.";
        float v11 = v7;
        uint32_t v12 = 22;
        goto LABEL_7;
      }
    }
  }
  return v3;
}

- (ARImageSensorSettings)imageSensorSettingsForUltraWide
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (![(ARGeoTrackingConfiguration *)self shouldUseUltraWide])
  {
    id v5 = 0;
    goto LABEL_14;
  }
  int v3 = [(id)objc_opt_class() supportedVideoFormatsForUltraWide];
  uint64_t v4 = [v3 firstObject];

  if (v4)
  {
    id v5 = [[ARImageSensorSettings alloc] initWithVideoFormat:v4];
    LODWORD(v6) = 1126170624;
    [(ARImageSensorSettings *)v5 setMaxGainOverride:v6];
    [(ARImageSensorSettings *)v5 setVisionDataOutputEnabled:[(ARGeoTrackingConfiguration *)self shouldEnableVisionDataForImageSensorSettings:v5]];
    if ([(ARImageSensorSettings *)v5 visionDataOutputEnabled])
    {
      id v7 = [(ARGeoTrackingConfiguration *)self _trackingOptions];
      id v8 = [(ARGeoTrackingConfiguration *)self imageSensorSettings];
      [v7 setImageSensorSettings:v8];

      [v7 setImageSensorSettingsForUltraWide:v5];
      objc_super v9 = ARVisionDataParametersForWorldTrackingOptions(v7);
      if (v9)
      {
        [(ARImageSensorSettings *)v5 setVisionDataOutputParameters:v9];
        int v10 = _ARLogGeneral_11();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          float v11 = (objc_class *)objc_opt_class();
          uint32_t v12 = NSStringFromClass(v11);
          int v18 = 138543874;
          __int16 v19 = v12;
          __int16 v20 = 2048;
          id v21 = self;
          __int16 v22 = 2112;
          CLLocationDegrees v23 = v9;
          uint64_t v13 = "%{public}@ <%p>: Setting vision data output parameters for ultra wide: %@";
          BOOL v14 = v10;
          uint32_t v15 = 32;
LABEL_11:
          _os_log_impl(&dword_1B88A2000, v14, OS_LOG_TYPE_DEBUG, v13, (uint8_t *)&v18, v15);
        }
      }
      else
      {
        int v10 = _ARLogGeneral_11();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v16 = (objc_class *)objc_opt_class();
          uint32_t v12 = NSStringFromClass(v16);
          int v18 = 138543618;
          __int16 v19 = v12;
          __int16 v20 = 2048;
          id v21 = self;
          uint64_t v13 = "%{public}@ <%p>: Did not receive vision data output parameters for ultra wide.";
          BOOL v14 = v10;
          uint32_t v15 = 22;
          goto LABEL_11;
        }
      }
    }
  }
  else
  {
    id v5 = 0;
  }

LABEL_14:
  return v5;
}

- (BOOL)shouldUseUltraWide
{
  if (ARDeviceSupportsUltraWideCamera() && ARUserDefaultsMulticamModeEnabled())
  {
    int v3 = [(id)objc_opt_class() supportedVideoFormatsForUltraWide];
    if ([v3 count] && self->_shouldUseUltraWideIfAvailable)
    {
      uint64_t v4 = [(id)objc_opt_class() backdropCameraOverride];

      if (!v4)
      {
        int v5 = 1;
        if (ARDeviceSupportsMulticamMode()) {
          return v5;
        }
        goto LABEL_10;
      }
    }
    else
    {
    }
  }
  int v5 = 0;
LABEL_10:
  if (ARLinkedOnOrAfterYukon()) {
    LOBYTE(v5) = 0;
  }
  else {
    return v5 & ARDeviceSupportsJasper();
  }
  return v5;
}

- (BOOL)shouldUseJasper
{
  int v3 = ARDeviceSupportsJasper();
  if (v3)
  {
    LOBYTE(v3) = [(ARGeoTrackingConfiguration *)self useLidarIfAvailable];
  }
  return v3;
}

+ (void)setBackdropCameraOverride:(int64_t)a3
{
}

+ (int64_t)backdropCameraOverride
{
  return +[ARWorldTrackingConfiguration backdropCameraOverride];
}

- (BOOL)shouldEnableVisionDataForImageSensorSettings:(id)a3
{
  uint64_t v4 = [a3 videoFormat];
  if (!v4) {
    goto LABEL_8;
  }
  BOOL v5 = [(ARGeoTrackingConfiguration *)self shouldUseUltraWide];
  double v6 = [v4 captureDeviceType];
  id v7 = v6;
  if (!v5)
  {
    int v9 = ARIsSupportedAVCaptureDeviceTypeForRearCameraBackdrop(v6);

    if (v9) {
      goto LABEL_6;
    }
LABEL_8:
    LOBYTE(v10) = 0;
    goto LABEL_9;
  }
  id v8 = (void *)*MEMORY[0x1E4F15828];

  if (v7 != v8) {
    goto LABEL_8;
  }
LABEL_6:
  if (!+[ARKitUserDefaults BOOLForKey:@"com.apple.arkit.worldTracking.visionData"])goto LABEL_8; {
  BOOL v10 = !+[ARKitUserDefaults BOOLForKey:@"com.apple.arkit.worldTracking.simulateHWFeatureDetection"];
  }
LABEL_9:

  return v10;
}

- (void)setWorldAlignment:(ARWorldAlignment)worldAlignment
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = _ARLogGeneral_11();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    BOOL v5 = (objc_class *)objc_opt_class();
    double v6 = NSStringFromClass(v5);
    id v7 = NSStringFromARWorldAlignment([(ARGeoTrackingConfiguration *)self worldAlignment]);
    int v8 = 138543874;
    int v9 = v6;
    __int16 v10 = 2048;
    float v11 = self;
    __int16 v12 = 2114;
    uint64_t v13 = v7;
    _os_log_impl(&dword_1B88A2000, v4, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unable to set world alignment of ARGeoTrackingConfiguration. Alignment is always set to %{public}@", (uint8_t *)&v8, 0x20u);
  }
}

- (ARWorldAlignment)worldAlignment
{
  return 1;
}

- (void)setDetectionImages:(NSSet *)detectionImages
{
  uint64_t v4 = detectionImages;
  double v6 = v4;
  if (!v4) {
    uint64_t v4 = (NSSet *)objc_opt_new();
  }
  objc_storeStrong((id *)&self->_detectionImages, v4);
  BOOL v5 = v6;
  if (!v6)
  {

    BOOL v5 = 0;
  }
}

- (void)setVideoFormat:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)ARGeoTrackingConfiguration;
  [(ARConfiguration *)&v6 setVideoFormat:v4];
  if ([v4 has4KVideoResolution]) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = [v4 isX420PixelFormat];
  }
  [(ARGeoTrackingConfiguration *)self setAlwaysUsePrimaryCameraForTracking:v5];
}

- (void)setMaximumNumberOfTrackedImages:(NSInteger)maximumNumberOfTrackedImages
{
  self->_maximumNumberOfTrackedImages = +[ARODTHandleManager actualNumberOfImagesTracked:maximumNumberOfTrackedImages];
}

- (void)createTechniques:(id)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [(ARConfiguration *)self frameSemantics];
  if (![(ARGeoTrackingConfiguration *)self useLidarIfAvailable] && (v5 & 0x18) != 0)
  {
    if (_ARLogRuntimeIssues_onceToken != -1) {
      dispatch_once(&_ARLogRuntimeIssues_onceToken, &__block_literal_global_285);
    }
    objc_super v6 = (void *)_ARLogRuntimeIssues_logObj;
    if (os_log_type_enabled((os_log_t)_ARLogRuntimeIssues_logObj, OS_LOG_TYPE_FAULT))
    {
      id v7 = v6;
      int v8 = (objc_class *)objc_opt_class();
      int v9 = NSStringFromClass(v8);
      *(_DWORD *)buf = 138543618;
      v50 = v9;
      __int16 v51 = 2048;
      v52 = self;
      _os_log_impl(&dword_1B88A2000, v7, OS_LOG_TYPE_FAULT, "%{public}@ <%p>: Disabling Lidar (useLidarIfAvailable=false) and SceneDepth is not compatible (ARFrameSemanticSceneDepth | ARFrameSemanticSmoothedSceneDepth)", buf, 0x16u);
    }
  }
  __int16 v10 = [(ARGeoTrackingConfiguration *)self _trackingOptions];
  float v11 = [(ARGeoTrackingConfiguration *)self imageSensorSettings];
  [v10 setImageSensorSettings:v11];

  __int16 v12 = [(ARGeoTrackingConfiguration *)self imageSensorSettingsForUltraWide];
  [v10 setImageSensorSettingsForUltraWide:v12];

  if ([(ARGeoTrackingConfiguration *)self environmentTexturing]) {
    objc_msgSend(v10, "setPlaneDetection:", objc_msgSend(v10, "planeDetection") | 0x80);
  }
  uint64_t v13 = [(ARConfiguration *)self replaySensor];
  uint64_t v14 = v13;
  if (v13 && [v13 replayMode]) {
    [v10 setDeterministicMode:1];
  }
  if ([v10 planeDetection])
  {
    BOOL v15 = +[ARKitUserDefaults BOOLForKey:@"com.apple.arkit.worldTracking.accuratePlaneExtentCheck"];
    uint64_t v16 = _ARLogGeneral_11();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      objc_super v17 = (objc_class *)objc_opt_class();
      int v18 = NSStringFromClass(v17);
      __int16 v19 = @"disabled";
      *(_DWORD *)buf = 138543874;
      v50 = v18;
      if (v15) {
        __int16 v19 = @"enabled";
      }
      __int16 v51 = 2048;
      v52 = self;
      __int16 v53 = 2114;
      v54 = v19;
      _os_log_impl(&dword_1B88A2000, v16, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Ray-cast accurate extent check: %{public}@", buf, 0x20u);
    }
    if (v15) {
      objc_msgSend(v10, "setPlaneDetection:", objc_msgSend(v10, "planeDetection") | 0x200);
    }
  }
  __int16 v20 = [[ARWorldTrackingTechnique alloc] initWithOptions:v10];
  if (v20)
  {
    id v21 = [MEMORY[0x1E4F1CA48] array];
    [v21 addObject:v20];
    __int16 v22 = [(ARGeoTrackingConfiguration *)self detectionImages];
    uint64_t v23 = [v22 count];

    if (v23)
    {
      uint64_t v24 = [ARImageDetectionTechnique alloc];
      uint64_t v25 = [(ARGeoTrackingConfiguration *)self detectionImages];
      uint64_t v26 = [v25 allObjects];
      uint64_t v27 = [(ARImageDetectionTechnique *)v24 initWithReferenceImages:v26 maximumNumberOfTrackedImages:[(ARGeoTrackingConfiguration *)self maximumNumberOfTrackedImages]];

      [(ARImageDetectionTechnique *)v27 setEnableAutomaticImageScaleEstimation:[(ARGeoTrackingConfiguration *)self automaticImageScaleEstimationEnabled]];
      [v21 addObject:v27];
    }
    if ([(ARGeoTrackingConfiguration *)self appClipCodeTrackingEnabled])
    {
      v28 = [[ARAppClipCodeTechnique alloc] initWithIgnoreURLLimitation:[(ARGeoTrackingConfiguration *)self ignoreAppClipCodeURLLimitation]];
      [v21 addObject:v28];
    }
    id v29 = [(ARWorldTrackingTechnique *)v20 options];
    uint64_t v30 = [v29 planeDetection];

    if (v30)
    {
      __int16 v31 = [[ARPlaneEstimationTechnique alloc] initWithTrackingTechnique:v20];
      [v4 addObject:v31];
    }
    if ([(ARGeoTrackingConfiguration *)self environmentTexturing])
    {
      uint64_t v32 = [[AREnvironmentTexturingTechnique alloc] initWithOptions:[(ARGeoTrackingConfiguration *)self environmentTexturing] wantsHDREnvironmentTextures:self->_wantsHDREnvironmentTextures];
      [v4 addObject:v32];
    }
    __int16 v33 = [(ARGeoTrackingConfiguration *)self detectionObjects];
    uint64_t v34 = [v33 count];

    if (v34)
    {
      __int16 v35 = [ARObjectDetectionTechnique alloc];
      uint64_t v36 = [(ARGeoTrackingConfiguration *)self detectionObjects];
      __int16 v37 = [v36 allObjects];
      v38 = [(ARObjectDetectionTechnique *)v35 initWithDetectionObjects:v37];

      [v21 addObject:v38];
    }
    v47 = v14;
    uint64_t v39 = [[ARParentTechnique alloc] initWithParallelTechniques:v21];
    [v4 insertObject:v39 atIndex:0];
    v48.receiver = self;
    v48.super_class = (Class)ARGeoTrackingConfiguration;
    [(ARConfiguration *)&v48 createTechniques:v4];
    if ([v10 planeDetection] && -[ARGeoTrackingConfiguration isMLModelEnabled](self, "isMLModelEnabled"))
    {
      BOOL v40 = [(ARGeoTrackingConfiguration *)self shouldUseJasper];
      uint64_t v41 = [(ARConfiguration *)self maxUltrawideImageForwardingFrameRate];
      if (v40) {
        ARAddJasperTechniquesToParent(v39, v4, 1, 0, v41);
      }
      else {
        ARAddNonJasperSemanticsToParent(v39, v4, v41, 1);
      }
    }
    uint64_t v42 = [v4 indexOfObjectPassingTest:&__block_literal_global_35];
    v43 = [ARWorldAlignmentTechnique alloc];
    v44 = [(ARConfiguration *)self videoFormat];
    v45 = -[ARWorldAlignmentTechnique initWithAlignment:cameraPosition:](v43, "initWithAlignment:cameraPosition:", 16, [v44 captureDevicePosition]);

    [v4 replaceObjectAtIndex:v42 withObject:v45];
    v46 = objc_opt_new();
    [(ARGeoTrackingConfiguration *)self visualLocalizationCallInterval];
    objc_msgSend(v46, "setVisualLocalizationCallInterval:");
    [v46 setPosteriorVisualLocalizationCallInterval:self->_posteriorVisualLocalizationCallInterval];
    objc_msgSend(v46, "setVisualLocalizationUpdatesRequested:", -[ARGeoTrackingConfiguration visualLocalizationUpdatesRequested](self, "visualLocalizationUpdatesRequested"));
    objc_msgSend(v46, "setSupportEnablementOptions:", -[ARGeoTrackingConfiguration supportEnablementOptions](self, "supportEnablementOptions"));
    [v4 insertObject:v46 atIndex:v42];

    uint64_t v14 = v47;
  }
}

uint64_t __47__ARGeoTrackingConfiguration_createTechniques___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)_trackingOptions
{
  int v3 = objc_alloc_init(ARWorldTrackingOptions);
  id v4 = [(ARConfiguration *)self deviceModel];
  [(ARWorldTrackingOptions *)v3 setDeviceModel:v4];

  [(ARWorldTrackingOptions *)v3 setRelocalizationEnabled:0];
  [(ARWorldTrackingOptions *)v3 setInitialWorldMap:0];
  [(ARWorldTrackingOptions *)v3 setSlamConfiguration:@"CoreLocationIntegration"];
  [(ARWorldTrackingOptions *)v3 setPlaneDetection:[(ARGeoTrackingConfiguration *)self planeDetection]];
  [(ARGeoTrackingConfiguration *)self minVergenceAngle];
  -[ARWorldTrackingOptions setMinVergenceAngle:](v3, "setMinVergenceAngle:");
  [(ARWorldTrackingOptions *)v3 setMlModelEnabled:[(ARGeoTrackingConfiguration *)self isMLModelEnabled]];
  [(ARWorldTrackingOptions *)v3 setLowQosSchedulingEnabled:[(ARGeoTrackingConfiguration *)self isLowQosSchedulingEnabled]];
  [(ARWorldTrackingOptions *)v3 setCollaborationEnabled:0];
  [(ARWorldTrackingOptions *)v3 setSceneReconstruction:0];
  [(ARWorldTrackingOptions *)v3 setPlaneEstimationShouldUseJasperData:[(ARGeoTrackingConfiguration *)self shouldUseJasper]];
  ARFrameSemantics v5 = [(ARConfiguration *)self frameSemantics] & 8;
  if (v5 | [(ARConfiguration *)self frameSemantics] & 0x10) {
    [(ARWorldTrackingOptions *)v3 setDepthBuffersWillBeProvided:1];
  }
  [(ARWorldTrackingOptions *)v3 setAlwaysUsePrimaryCameraForTracking:[(ARGeoTrackingConfiguration *)self alwaysUsePrimaryCameraForTracking]];
  [(ARWorldTrackingOptions *)v3 setDisableMLRelocalization:[(ARConfiguration *)self disableMLRelocalization]];
  return v3;
}

- (int64_t)_depthPrioritization
{
  if ([(ARGeoTrackingConfiguration *)self depthOptimizedForStaticScene]) {
    return 4;
  }
  else {
    return 1;
  }
}

+ (BOOL)supportsFrameSemantics:(unint64_t)a3
{
  if ((a3 & 7) == 0 && (ARDeviceSupportsJasper() & 1) != 0
    || (a3 & 0x1C) == 0 && (ARAppleNeuralEngine() & 1) != 0
    || (a3 & 4) == 0 && ARAppleNeuralEngine() && (ARDeviceSupportsJasper() & 1) != 0)
  {
    return 1;
  }
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___ARGeoTrackingConfiguration;
  return objc_msgSendSuper2(&v6, sel_supportsFrameSemantics_, a3);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)ARGeoTrackingConfiguration;
  if ([(ARConfiguration *)&v23 isEqual:v4])
  {
    ARFrameSemantics v5 = (unsigned __int8 *)v4;
    objc_super v6 = v5;
    if (self->_planeDetection == *((void *)v5 + 18)
      && self->_minVergenceAngle == *((double *)v5 + 22)
      && self->_mlModelEnabled == v5[123]
      && self->_environmentTexturing == *((void *)v5 + 17)
      && self->_lowQosSchedulingEnabled == v5[124]
      && self->_wantsHDREnvironmentTextures == v5[120])
    {
      detectionImages = self->_detectionImages;
      int v8 = [v5 detectionImages];
      if (detectionImages != v8
        && ![(NSSet *)self->_detectionImages isEqual:*((void *)v6 + 19)])
      {
        goto LABEL_28;
      }
      if (self->_maximumNumberOfTrackedImages != *((void *)v6 + 20)) {
        goto LABEL_28;
      }
      detectionObjects = self->_detectionObjects;
      if (detectionObjects != *((NSSet **)v6 + 21) && !-[NSSet isEqual:](detectionObjects, "isEqual:")) {
        goto LABEL_28;
      }
      int automaticImageScaleEstimationEnabled = self->_automaticImageScaleEstimationEnabled;
      if (automaticImageScaleEstimationEnabled != [v6 automaticImageScaleEstimationEnabled])goto LABEL_28; {
      int shouldUseUltraWideIfAvailable = self->_shouldUseUltraWideIfAvailable;
      }
      if (shouldUseUltraWideIfAvailable != [v6 shouldUseUltraWideIfAvailable]) {
        goto LABEL_28;
      }
      int depthOptimizedForStaticScene = self->_depthOptimizedForStaticScene;
      if (depthOptimizedForStaticScene != [v6 depthOptimizedForStaticScene]) {
        goto LABEL_28;
      }
      int alwaysUsePrimaryCameraForTracking = self->_alwaysUsePrimaryCameraForTracking;
      if (alwaysUsePrimaryCameraForTracking == [v6 alwaysUsePrimaryCameraForTracking]
        && (int ignoreAppClipCodeURLLimitation = self->_ignoreAppClipCodeURLLimitation,
            ignoreAppClipCodeURLLimitation == [v6 ignoreAppClipCodeURLLimitation])
        && (int appClipCodeTrackingEnabled = self->_appClipCodeTrackingEnabled,
            appClipCodeTrackingEnabled == [v6 appClipCodeTrackingEnabled])
        && (unint64_t supportEnablementOptions = self->_supportEnablementOptions,
            supportEnablementOptions == [v6 supportEnablementOptions])
        && (double visualLocalizationCallInterval = self->_visualLocalizationCallInterval,
            [v6 visualLocalizationCallInterval],
            visualLocalizationCallInterval == v18)
        && self->_posteriorVisualLocalizationCallInterval == *((double *)v6 + 14)
        && (int visualLocalizationUpdatesRequested = self->_visualLocalizationUpdatesRequested,
            visualLocalizationUpdatesRequested == [v6 visualLocalizationUpdatesRequested]))
      {
        int useLidarIfAvailable = self->_useLidarIfAvailable;
        BOOL v21 = useLidarIfAvailable == [v6 useLidarIfAvailable];
      }
      else
      {
LABEL_28:
        BOOL v21 = 0;
      }
    }
    else
    {
      BOOL v21 = 0;
    }
  }
  else
  {
    BOOL v21 = 0;
  }

  return v21;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)ARGeoTrackingConfiguration;
  ARFrameSemantics v5 = -[ARConfiguration copyWithZone:](&v11, sel_copyWithZone_);
  v5[18] = self->_planeDetection;
  v5[22] = *(void *)&self->_minVergenceAngle;
  *((unsigned char *)v5 + 123) = self->_mlModelEnabled;
  *((unsigned char *)v5 + 124) = self->_lowQosSchedulingEnabled;
  v5[17] = self->_environmentTexturing;
  *((unsigned char *)v5 + 120) = self->_wantsHDREnvironmentTextures;
  uint64_t v6 = [(NSSet *)self->_detectionImages copyWithZone:a3];
  id v7 = (void *)v5[19];
  v5[19] = v6;

  v5[20] = self->_maximumNumberOfTrackedImages;
  uint64_t v8 = [(NSSet *)self->_detectionObjects copyWithZone:a3];
  int v9 = (void *)v5[21];
  v5[21] = v8;

  *((unsigned char *)v5 + 121) = self->_automaticImageScaleEstimationEnabled;
  *((unsigned char *)v5 + 125) = self->_shouldUseUltraWideIfAvailable;
  *((unsigned char *)v5 + 126) = self->_depthOptimizedForStaticScene;
  *((unsigned char *)v5 + 127) = self->_alwaysUsePrimaryCameraForTracking;
  *((unsigned char *)v5 + 128) = self->_ignoreAppClipCodeURLLimitation;
  *((unsigned char *)v5 + 122) = self->_appClipCodeTrackingEnabled;
  v5[23] = *(void *)&self->_visualLocalizationCallInterval;
  v5[14] = *(void *)&self->_posteriorVisualLocalizationCallInterval;
  v5[24] = self->_supportEnablementOptions;
  *((unsigned char *)v5 + 129) = self->_visualLocalizationUpdatesRequested;
  *((unsigned char *)v5 + 130) = self->_useLidarIfAvailable;
  return v5;
}

- (id)description
{
  int v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = (objc_class *)objc_opt_class();
  ARFrameSemantics v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p", v5, self];

  id v7 = [(ARConfiguration *)self descriptionWithoutBrackets];
  [v6 appendString:v7];

  if ([(ARConfiguration *)self isAutoFocusEnabled]) {
    uint64_t v8 = @"Enabled";
  }
  else {
    uint64_t v8 = @"Disabled";
  }
  [v6 appendFormat:@" autoFocus=%@", v8];
  int v9 = NSStringFromAREnvironmentTexturing(self->_environmentTexturing);
  [v6 appendFormat:@" environmentTexturing=%@", v9];

  if ([(ARGeoTrackingConfiguration *)self wantsHDREnvironmentTextures]) {
    __int16 v10 = @"Enabled";
  }
  else {
    __int16 v10 = @"Disabled";
  }
  [v6 appendFormat:@" wantsHDREnvironmentTextures=%@", v10];
  objc_super v11 = NSStringFromARPlaneDetection(self->_planeDetection);
  [v6 appendFormat:@" planeDetection=%@", v11];

  __int16 v12 = [(ARGeoTrackingConfiguration *)self detectionImages];
  uint64_t v13 = [v12 count];

  if (v13)
  {
    objc_msgSend(v6, "appendFormat:", @" maximumNumberOfTrackedImages=%ld", -[ARGeoTrackingConfiguration maximumNumberOfTrackedImages](self, "maximumNumberOfTrackedImages"));
    if ([(ARGeoTrackingConfiguration *)self automaticImageScaleEstimationEnabled])
    {
      uint64_t v14 = @"Enabled";
    }
    else
    {
      uint64_t v14 = @"Disabled";
    }
    [v6 appendFormat:@" automaticImageScaleEstimation=%@", v14];
    BOOL v15 = [(ARGeoTrackingConfiguration *)self detectionImages];
    uint64_t v16 = [v15 count];
    objc_super v17 = [(ARGeoTrackingConfiguration *)self detectionImages];
    double v18 = [v17 allObjects];
    __int16 v19 = objc_msgSend(v18, "ar_map:", &__block_literal_global_96);
    __int16 v20 = [v19 componentsJoinedByString:@", "];
    [v6 appendFormat:@" detectionImages=[count: %ld, %@]", v16, v20];
  }
  BOOL v21 = [(ARGeoTrackingConfiguration *)self detectionObjects];
  uint64_t v22 = [v21 count];

  if (v22)
  {
    objc_super v23 = [(ARGeoTrackingConfiguration *)self detectionObjects];
    uint64_t v24 = [v23 allObjects];
    uint64_t v25 = [v24 componentsJoinedByString:@", "];
    [v6 appendFormat:@" detectionObjects=[%@]", v25];
  }
  objc_msgSend(v6, "appendFormat:", @" visualLocalizationCallInterval=%f", *(void *)&self->_visualLocalizationCallInterval);
  objc_msgSend(v6, "appendFormat:", @" posteriorVisualLocalizationCallInterval=%f", *(void *)&self->_posteriorVisualLocalizationCallInterval);
  objc_msgSend(v6, "appendFormat:", @" supportEnablementOptions=%ld", self->_supportEnablementOptions);
  objc_msgSend(v6, "appendFormat:", @" visualLocalizationUpdatesRequested=%d", self->_visualLocalizationUpdatesRequested);
  objc_msgSend(v6, "appendFormat:", @" useLidarIfAvailable=%d", self->_useLidarIfAvailable);
  if ([(ARGeoTrackingConfiguration *)self appClipCodeTrackingEnabled]) {
    uint64_t v26 = @"Enabled";
  }
  else {
    uint64_t v26 = @"Disabled";
  }
  [v6 appendFormat:@" appClipCodeTracking=%@", v26];
  [v6 appendString:@">"];
  return v6;
}

uint64_t __41__ARGeoTrackingConfiguration_description__block_invoke(uint64_t a1, void *a2)
{
  return [a2 shortDebugDescription];
}

- (AREnvironmentTexturing)environmentTexturing
{
  return self->_environmentTexturing;
}

- (void)setEnvironmentTexturing:(AREnvironmentTexturing)environmentTexturing
{
  self->_environmentTexturing = environmentTexturing;
}

- (BOOL)wantsHDREnvironmentTextures
{
  return self->_wantsHDREnvironmentTextures;
}

- (void)setWantsHDREnvironmentTextures:(BOOL)wantsHDREnvironmentTextures
{
  self->_wantsHDREnvironmentTextures = wantsHDREnvironmentTextures;
}

- (ARPlaneDetection)planeDetection
{
  return self->_planeDetection;
}

- (void)setPlaneDetection:(ARPlaneDetection)planeDetection
{
  self->_planeDetection = planeDetection;
}

- (NSSet)detectionImages
{
  return self->_detectionImages;
}

- (BOOL)automaticImageScaleEstimationEnabled
{
  return self->_automaticImageScaleEstimationEnabled;
}

- (void)setAutomaticImageScaleEstimationEnabled:(BOOL)automaticImageScaleEstimationEnabled
{
  self->_int automaticImageScaleEstimationEnabled = automaticImageScaleEstimationEnabled;
}

- (NSInteger)maximumNumberOfTrackedImages
{
  return self->_maximumNumberOfTrackedImages;
}

- (NSSet)detectionObjects
{
  return self->_detectionObjects;
}

- (void)setDetectionObjects:(NSSet *)detectionObjects
{
}

- (void)setAppClipCodeTrackingEnabled:(BOOL)appClipCodeTrackingEnabled
{
  self->_int appClipCodeTrackingEnabled = appClipCodeTrackingEnabled;
}

- (double)minVergenceAngle
{
  return self->_minVergenceAngle;
}

- (void)setMinVergenceAngle:(double)a3
{
  self->_minVergenceAngle = a3;
}

- (BOOL)isMLModelEnabled
{
  return self->_mlModelEnabled;
}

- (void)setMlModelEnabled:(BOOL)a3
{
  self->_mlModelEnabled = a3;
}

- (BOOL)isLowQosSchedulingEnabled
{
  return self->_lowQosSchedulingEnabled;
}

- (void)setLowQosSchedulingEnabled:(BOOL)a3
{
  self->_lowQosSchedulingEnabled = a3;
}

- (BOOL)shouldUseUltraWideIfAvailable
{
  return self->_shouldUseUltraWideIfAvailable;
}

- (void)setShouldUseUltraWideIfAvailable:(BOOL)a3
{
  self->_int shouldUseUltraWideIfAvailable = a3;
}

- (BOOL)depthOptimizedForStaticScene
{
  return self->_depthOptimizedForStaticScene;
}

- (void)setDepthOptimizedForStaticScene:(BOOL)a3
{
  self->_int depthOptimizedForStaticScene = a3;
}

- (BOOL)alwaysUsePrimaryCameraForTracking
{
  return self->_alwaysUsePrimaryCameraForTracking;
}

- (void)setAlwaysUsePrimaryCameraForTracking:(BOOL)a3
{
  self->_int alwaysUsePrimaryCameraForTracking = a3;
}

- (BOOL)ignoreAppClipCodeURLLimitation
{
  return self->_ignoreAppClipCodeURLLimitation;
}

- (void)setIgnoreAppClipCodeURLLimitation:(BOOL)a3
{
  self->_int ignoreAppClipCodeURLLimitation = a3;
}

- (double)visualLocalizationCallInterval
{
  return self->_visualLocalizationCallInterval;
}

- (BOOL)visualLocalizationUpdatesRequested
{
  return self->_visualLocalizationUpdatesRequested;
}

- (void)setVisualLocalizationUpdatesRequested:(BOOL)a3
{
  self->_int visualLocalizationUpdatesRequested = a3;
}

- (unint64_t)supportEnablementOptions
{
  return self->_supportEnablementOptions;
}

- (void)setSupportEnablementOptions:(unint64_t)a3
{
  self->_unint64_t supportEnablementOptions = a3;
}

- (BOOL)useLidarIfAvailable
{
  return self->_useLidarIfAvailable;
}

- (void)setUseLidarIfAvailable:(BOOL)a3
{
  self->_int useLidarIfAvailable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detectionObjects, 0);
  objc_storeStrong((id *)&self->_detectionImages, 0);
}

@end