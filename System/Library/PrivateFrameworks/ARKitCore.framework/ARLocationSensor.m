@interface ARLocationSensor
- (ARLocationData)currentLocation;
- (ARLocationSensor)init;
- (ARLocationSensor)initWithBundleIdentifier:(id)a3;
- (ARSensorDelegate)delegate;
- (CLLocationManagerDelegate)locationManagerDelegate;
- (id)_createLocationManager;
- (id)_validateLocationAuthorization;
- (id)updateFromDeviceOrientationData:(id)a3;
- (id)updateFromLocationData:(id)a3;
- (unint64_t)providedDataTypes;
- (void)_attemptAltitudeLookupAtCoordinate:(CLLocationCoordinate2D)a3 attemptCount:(unsigned int)a4 lookupStartDate:(id)a5 completionHandler:(id)a6;
- (void)configureForReplay;
- (void)dealloc;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)locationManagerDidChangeAuthorization:(id)a3;
- (void)lookupAltitudeAtCoordinate:(CLLocationCoordinate2D)a3 completionHandler:(id)a4;
- (void)setCurrentLocation:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLocationManagerDelegate:(id)a3;
- (void)start;
- (void)stop;
- (void)updateARSessionState:(unint64_t)a3;
- (void)updateEstimationFromVIOPose:(id)a3 imageData:(id)a4;
- (void)updateFromVisualLocalizationResult:(id)a3;
- (void)waitForOutstandingCallbacks;
@end

@implementation ARLocationSensor

- (ARLocationSensor)init
{
  v3 = [MEMORY[0x1E4F28B50] mainBundle];
  v4 = [v3 bundleIdentifier];
  v5 = [(ARLocationSensor *)self initWithBundleIdentifier:v4];

  return v5;
}

- (ARLocationSensor)initWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)ARLocationSensor;
  v5 = [(ARLocationSensor *)&v20 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    v7 = (void *)*((void *)v5 + 1);
    *((void *)v5 + 1) = v6;

    __asm { FMOV            V0.2D, #-1.0 }
    *(_OWORD *)(v5 + 56) = _Q0;
    *((void *)v5 + 9) = 0xBFF0000000000000;
    *((_WORD *)v5 + 20) = 1;
    uint64_t v13 = ARCreateFixedPriorityDispatchQueue("com.apple.arkit.locationSensor.locationManager");
    v14 = (void *)*((void *)v5 + 6);
    *((void *)v5 + 6) = v13;

    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v16 = (void *)*((void *)v5 + 10);
    *((void *)v5 + 10) = v15;

    uint64_t v17 = objc_opt_new();
    v18 = (void *)*((void *)v5 + 4);
    *((void *)v5 + 4) = v17;
  }
  return (ARLocationSensor *)v5;
}

- (unint64_t)providedDataTypes
{
  return 64;
}

- (void)configureForReplay
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  self->_isLiveSensor = 0;
  v3 = (_CLLocationPlayer *)objc_opt_new();
  locationPlayer = self->_locationPlayer;
  self->_locationPlayer = v3;

  v5 = _ARLogSensor_3();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    v8 = self->_locationPlayer;
    int v9 = 138543874;
    v10 = v7;
    __int16 v11 = 2048;
    v12 = self;
    __int16 v13 = 2048;
    v14 = v8;
    _os_log_impl(&dword_1B88A2000, v5, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Created _CLLocationPlayer: %p", (uint8_t *)&v9, 0x20u);
  }
  [(_CLLocationPlayer *)self->_locationPlayer setSimulationEnabled:0];
  [(_CLLocationPlayer *)self->_locationPlayer start];
}

- (void)start
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v3 = _ARLogSensor_3();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    *(_DWORD *)buf = 138543618;
    int v9 = v5;
    __int16 v10 = 2048;
    __int16 v11 = self;
    _os_log_impl(&dword_1B88A2000, v3, OS_LOG_TYPE_INFO, "%{public}@ <%p>: start", buf, 0x16u);
  }
  locationManagerQueue = self->_locationManagerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __25__ARLocationSensor_start__block_invoke;
  block[3] = &unk_1E61851B0;
  block[4] = self;
  dispatch_async(locationManagerQueue, block);
}

void __25__ARLocationSensor_start__block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  v3 = (void *)v2[2];
  if (!v3)
  {
    uint64_t v4 = [v2 _createLocationManager];
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void **)(v5 + 16);
    *(void *)(v5 + 16) = v4;

    v3 = *(void **)(*(void *)(a1 + 32) + 16);
  }
  int v7 = [v3 authorizationStatus];
  v8 = *(void **)(a1 + 32);
  if (v7)
  {
    int v9 = [v8 _validateLocationAuthorization];
    __int16 v10 = *(unsigned char **)(a1 + 32);
    if (v9)
    {
      __int16 v11 = [v10 delegate];
      [v11 sensor:*(void *)(a1 + 32) didFailWithError:v9];
    }
    else
    {
      v10[41] = 0;
      [*(id *)(*(void *)(a1 + 32) + 16) startUpdatingLocation];
      __int16 v13 = _ARLogSensor_3();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v14 = (objc_class *)objc_opt_class();
        uint64_t v15 = NSStringFromClass(v14);
        uint64_t v16 = *(void *)(a1 + 32);
        int v19 = 138543618;
        objc_super v20 = v15;
        __int16 v21 = 2048;
        uint64_t v22 = v16;
        _os_log_impl(&dword_1B88A2000, v13, OS_LOG_TYPE_INFO, "%{public}@ <%p>: started location updates.", (uint8_t *)&v19, 0x16u);
      }
      uint64_t v17 = [*(id *)(a1 + 32) delegate];
      char v18 = objc_opt_respondsToSelector();

      if ((v18 & 1) == 0) {
        goto LABEL_14;
      }
      __int16 v11 = [*(id *)(a1 + 32) delegate];
      [v11 sensorDidStart:*(void *)(a1 + 32)];
    }

LABEL_14:
    return;
  }
  uint64_t v12 = (void *)v8[2];
  [v12 requestWhenInUseAuthorization];
}

- (id)_createLocationManager
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_locationManagerQueue);
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F1E600]) initWithEffectiveBundleIdentifier:self->_bundleIdentifier delegate:self onQueue:self->_locationManagerQueue];
  [v3 setActivityType:4];
  [v3 setDesiredAccuracy:*MEMORY[0x1E4F1E6D8]];
  [v3 setDistanceFilter:*MEMORY[0x1E4F1E6C0]];
  [v3 _setGroundAltitudeEnabled:1];
  [v3 _setFusionInfoEnabled:1];
  return v3;
}

- (id)_validateLocationAuthorization
{
  v16[1] = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_locationManagerQueue);
  if ([MEMORY[0x1E4F1E600] locationServicesEnabled])
  {
    if ([(CLLocationManager *)self->_locationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedAlways
      || [(CLLocationManager *)self->_locationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedWhenInUse)
    {
      if ([(CLLocationManager *)self->_locationManager accuracyAuthorization] == CLAccuracyAuthorizationFullAccuracy)
      {
        v8 = 0;
        goto LABEL_10;
      }
      uint64_t v11 = *MEMORY[0x1E4F28588];
      v3 = ARKitCoreBundle();
      uint64_t v4 = [v3 localizedStringForKey:@"Usage of precise location denied by user." value:&stru_1F120C8F0 table:@"Localizable_iOS"];
      uint64_t v12 = v4;
      uint64_t v5 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v6 = &v12;
      int v7 = &v11;
    }
    else
    {
      uint64_t v13 = *MEMORY[0x1E4F28588];
      v3 = ARKitCoreBundle();
      uint64_t v4 = [v3 localizedStringForKey:@"Location authorization denied by the user." value:&stru_1F120C8F0 table:@"Localizable_iOS"];
      v14 = v4;
      uint64_t v5 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v6 = &v14;
      int v7 = &v13;
    }
  }
  else
  {
    uint64_t v15 = *MEMORY[0x1E4F28588];
    v3 = ARKitCoreBundle();
    uint64_t v4 = [v3 localizedStringForKey:@"Location use is restricted on this device." value:&stru_1F120C8F0 table:@"Localizable_iOS"];
    v16[0] = v4;
    uint64_t v5 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v6 = (void **)v16;
    int v7 = &v15;
  }
  int v9 = [v5 dictionaryWithObjects:v6 forKeys:v7 count:1];

  v8 = ARErrorWithCodeAndUserInfo(101, v9);

LABEL_10:
  return v8;
}

- (void)stop
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = _ARLogSensor_3();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = (objc_class *)objc_opt_class();
    uint64_t v5 = NSStringFromClass(v4);
    *(_DWORD *)buf = 138543618;
    uint64_t v16 = v5;
    __int16 v17 = 2048;
    char v18 = self;
    _os_log_impl(&dword_1B88A2000, v3, OS_LOG_TYPE_INFO, "%{public}@ <%p>: stop", buf, 0x16u);
  }
  uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"ARLocationSensor(%p):", self);
  if (!self->_isLiveSensor)
  {
    [(_CLLocationPlayer *)self->_locationPlayer stop];
    int v7 = _ARLogSensor_3();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v16 = v6;
      _os_log_impl(&dword_1B88A2000, v7, OS_LOG_TYPE_INFO, "%@ stopped location player.", buf, 0xCu);
    }
  }
  locationManager = self->_locationManager;
  if (locationManager)
  {
    self->_isStopped = 1;
    int v9 = locationManager;
    locationManagerQueue = self->_locationManagerQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __24__ARLocationSensor_stop__block_invoke;
    block[3] = &unk_1E6185160;
    uint64_t v13 = v9;
    id v14 = v6;
    uint64_t v11 = v9;
    dispatch_async(locationManagerQueue, block);
  }
}

void __24__ARLocationSensor_stop__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) stopUpdatingLocation];
  v2 = _ARLogSensor_3();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_1B88A2000, v2, OS_LOG_TYPE_INFO, "%@ stopped location manager.", (uint8_t *)&v4, 0xCu);
  }
}

- (void)waitForOutstandingCallbacks
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_locationManagerQueue);
  locationManagerQueue = self->_locationManagerQueue;
  dispatch_sync(locationManagerQueue, &__block_literal_global_39);
}

- (void)dealloc
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = _ARLogSensor_3();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = (objc_class *)objc_opt_class();
    uint64_t v5 = NSStringFromClass(v4);
    *(_DWORD *)buf = 138543618;
    v8 = v5;
    __int16 v9 = 2048;
    __int16 v10 = self;
    _os_log_impl(&dword_1B88A2000, v3, OS_LOG_TYPE_INFO, "%{public}@ <%p>: dealloc", buf, 0x16u);
  }
  [(ARLocationSensor *)self stop];
  v6.receiver = self;
  v6.super_class = (Class)ARLocationSensor;
  [(ARLocationSensor *)&v6 dealloc];
}

- (void)updateARSessionState:(unint64_t)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  switch(a3)
  {
    case 2uLL:
      uint64_t v5 = _ARLogSensor_3();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        __int16 v9 = (objc_class *)objc_opt_class();
        int v7 = NSStringFromClass(v9);
        *(_DWORD *)buf = 138543618;
        __int16 v17 = v7;
        __int16 v18 = 2048;
        uint64_t v19 = self;
        v8 = "%{public}@ <%p>: ARSessionStateInterrupted";
        goto LABEL_10;
      }
LABEL_11:

      locationManagerQueue = self->_locationManagerQueue;
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __41__ARLocationSensor_updateARSessionState___block_invoke;
      v15[3] = &unk_1E61860A0;
      v15[4] = self;
      v15[5] = a3;
      dispatch_async(locationManagerQueue, v15);
      return;
    case 1uLL:
      uint64_t v5 = _ARLogSensor_3();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        __int16 v10 = (objc_class *)objc_opt_class();
        int v7 = NSStringFromClass(v10);
        *(_DWORD *)buf = 138543618;
        __int16 v17 = v7;
        __int16 v18 = 2048;
        uint64_t v19 = self;
        v8 = "%{public}@ <%p>: ARSessionStateRunning";
        goto LABEL_10;
      }
      goto LABEL_11;
    case 0uLL:
      uint64_t v5 = _ARLogSensor_3();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        objc_super v6 = (objc_class *)objc_opt_class();
        int v7 = NSStringFromClass(v6);
        *(_DWORD *)buf = 138543618;
        __int16 v17 = v7;
        __int16 v18 = 2048;
        uint64_t v19 = self;
        v8 = "%{public}@ <%p>: ARSessionStatePaused";
LABEL_10:
        _os_log_impl(&dword_1B88A2000, v5, OS_LOG_TYPE_DEBUG, v8, buf, 0x16u);

        goto LABEL_11;
      }
      goto LABEL_11;
  }
  uint64_t v12 = _ARLogSensor_3();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    uint64_t v13 = (objc_class *)objc_opt_class();
    id v14 = NSStringFromClass(v13);
    *(_DWORD *)buf = 138543618;
    __int16 v17 = v14;
    __int16 v18 = 2048;
    uint64_t v19 = self;
    _os_log_impl(&dword_1B88A2000, v12, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unknown ARSessionState received", buf, 0x16u);
  }
}

uint64_t __41__ARLocationSensor_updateARSessionState___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = 16;
  if (!*(unsigned char *)(v1 + 40)) {
    uint64_t v2 = 24;
  }
  return [*(id *)(v1 + v2) _updateARSessionState:*(void *)(a1 + 40)];
}

- (void)updateEstimationFromVIOPose:(id)a3 imageData:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 worldTrackingState];
  [v8 poseTimestamp];
  double v10 = v9;

  if (v10 > self->_lastVIOUpdateTimestamp)
  {
    uint64_t v11 = [v6 worldTrackingState];
    uint64_t v12 = [v11 inertialState];

    if (v12)
    {
      self->_lastVIOUpdateTimestamp = v10;
      [v7 cameraIntrinsics];
      long long v22 = v13;
      long long v23 = v14;
      long long v24 = v15;
      [v7 imageResolution];
      locationManagerQueue = self->_locationManagerQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __58__ARLocationSensor_updateEstimationFromVIOPose_imageData___block_invoke;
      block[3] = &unk_1E6186B28;
      double v36 = v10;
      int v26 = DWORD2(v22);
      int v29 = DWORD2(v23);
      void block[4] = v22;
      int v27 = 0;
      uint64_t v28 = v23;
      int v30 = 0;
      int v32 = DWORD2(v24);
      uint64_t v31 = v24;
      int v33 = 0;
      uint64_t v37 = v17;
      uint64_t v38 = v18;
      v34 = v6;
      v35 = self;
      dispatch_async(locationManagerQueue, block);
      uint64_t v19 = v34;
    }
    else
    {
      uint64_t v19 = _ARLogSensor_3();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        uint64_t v20 = (objc_class *)objc_opt_class();
        __int16 v21 = NSStringFromClass(v20);
        *(_DWORD *)buf = 138543874;
        v40 = v21;
        __int16 v41 = 2048;
        v42 = self;
        __int16 v43 = 2048;
        double v44 = v10;
        _os_log_impl(&dword_1B88A2000, v19, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: World tracking state is missing inertial state: %f", buf, 0x20u);
      }
    }
  }
}

void __58__ARLocationSensor_updateEstimationFromVIOPose_imageData___block_invoke(uint64_t a1)
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  kdebug_trace();
  uint64_t v2 = objc_opt_new();
  uint64_t v3 = [*(id *)(a1 + 80) worldTrackingState];
  objc_msgSend(v2, "setTrackingState:", objc_msgSend(v3, "vioTrackingState"));

  int v4 = [*(id *)(a1 + 80) worldTrackingState];
  [v4 originTimestamp];
  objc_msgSend(v2, "setOriginTimestamp:");

  [v2 setTimestamp:*(double *)(a1 + 96)];
  uint64_t v5 = [*(id *)(a1 + 80) worldTrackingState];
  id v6 = [v5 inertialState];
  uint64_t v51 = 201219;
  long long v50 = ARGetInertialStateInfo_kCV3DVIOInertialStateInfo;
  [v2 setInertialStateInfo:&v50];

  v47 = [*(id *)(a1 + 80) worldTrackingState];
  id v7 = [v47 inertialState];
  v8 = v7;
  int64x2_t v9 = 0uLL;
  int64x2_t v64 = 0u;
  long long v65 = 0u;
  int64x2_t v62 = 0u;
  int64x2_t v63 = 0u;
  int64x2_t v60 = 0u;
  int64x2_t v61 = 0u;
  if (v7)
  {
    [v7 orientation];
    int64x2_t v11 = v60;
    int64x2_t v10 = v61;
    int64x2_t v13 = v62;
    int64x2_t v12 = v63;
    int64x2_t v9 = v64;
    uint64_t v14 = v65;
  }
  else
  {
    uint64_t v14 = 0;
    int64x2_t v13 = 0uLL;
    int64x2_t v12 = 0uLL;
    int64x2_t v11 = 0uLL;
    int64x2_t v10 = 0uLL;
  }
  int64x2_t v15 = vzip1q_s64(v11, v13);
  int64x2_t v16 = vzip2q_s64(v13, v9);
  v9.i64[1] = v11.i64[1];
  v74[0] = v15;
  v74[1] = v9;
  v74[2] = v16;
  v74[3] = vzip1q_s64(v10, v12);
  uint64_t v75 = v14;
  uint64_t v17 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v74 length:72];
  uint64_t v18 = 0;
  if (v8)
  {
    [v8 gyroscopeBias];
    int8x16_t v19 = v58;
    unint64_t v20 = vextq_s8(v19, v19, 8uLL).u64[0];
    uint64_t v21 = v59;
  }
  else
  {
    v19.i64[0] = 0;
    unint64_t v20 = 0;
    uint64_t v21 = 0;
  }
  v19.i64[1] = v20;
  int8x16_t v72 = v19;
  uint64_t v73 = v21;
  long long v22 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v72 length:24];
  if (v8)
  {
    [v8 velocity];
    int8x16_t v23 = v56;
    unint64_t v24 = vextq_s8(v23, v23, 8uLL).u64[0];
    uint64_t v18 = v57;
  }
  else
  {
    v23.i64[0] = 0;
    unint64_t v24 = 0;
  }
  v23.i64[1] = v24;
  int8x16_t v70 = v23;
  uint64_t v71 = v18;
  v25 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v70 length:24];
  uint64_t v26 = 0;
  if (v8)
  {
    [v8 accelerometerBias];
    int8x16_t v27 = v54;
    unint64_t v28 = vextq_s8(v27, v27, 8uLL).u64[0];
    uint64_t v29 = v55;
  }
  else
  {
    v27.i64[0] = 0;
    unint64_t v28 = 0;
    uint64_t v29 = 0;
  }
  v27.i64[1] = v28;
  int8x16_t v68 = v27;
  uint64_t v69 = v29;
  int v30 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v68 length:24];
  if (v8)
  {
    [v8 position];
    int8x16_t v31 = v52;
    unint64_t v32 = vextq_s8(v31, v31, 8uLL).u64[0];
    uint64_t v26 = v53;
  }
  else
  {
    v31.i64[0] = 0;
    unint64_t v32 = 0;
  }
  v31.i64[1] = v32;
  int8x16_t v66 = v31;
  uint64_t v67 = v26;
  int v33 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v66 length:24];
  uint64_t v34 = [v17 length];
  uint64_t v35 = [v22 length] + v34;
  uint64_t v36 = [v25 length];
  uint64_t v37 = v35 + v36 + [v30 length];
  uint64_t v38 = [v33 length];
  v39 = [MEMORY[0x1E4F1CA58] dataWithCapacity:v37 + v38];
  [v39 appendData:v17];
  [v39 appendData:v22];
  [v39 appendData:v25];
  [v39 appendData:v30];
  [v39 appendData:v33];

  [v2 setInertialState:v39];
  v40 = [*(id *)(a1 + 80) worldTrackingState];
  __int16 v41 = [v40 inertialState];
  uint64_t v49 = 199683;
  long long v48 = ARGetInertialCovarianceInfo_kCV3DVIOInertialCovarianceInfo;
  [v2 setInertialCovarianceInfo:&v48];

  v42 = [*(id *)(a1 + 80) worldTrackingState];
  __int16 v43 = [v42 inertialState];
  double v44 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", objc_msgSend(v43, "covarianceMatrix"), 1800);
  [v2 setInertialCovariance:v44];

  [*(id *)(a1 + 80) visionCameraTransform];
  objc_msgSend(v2, "setCameraPose:");
  objc_msgSend(v2, "setCameraIntrinsics:", *(double *)(a1 + 32), *(double *)(a1 + 48), *(double *)(a1 + 64));
  objc_msgSend(v2, "setCameraImageResolution:", *(double *)(a1 + 104), *(double *)(a1 + 112));
  uint64_t v45 = *(void *)(a1 + 88);
  uint64_t v46 = 16;
  if (!*(unsigned char *)(v45 + 40)) {
    uint64_t v46 = 24;
  }
  [*(id *)(v45 + v46) _updateVIOEstimation:v2];
  kdebug_trace();
}

- (void)_attemptAltitudeLookupAtCoordinate:(CLLocationCoordinate2D)a3 attemptCount:(unsigned int)a4 lookupStartDate:(id)a5 completionHandler:(id)a6
{
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  uint64_t v119 = *MEMORY[0x1E4F143B8];
  id v11 = a5;
  int64x2_t v12 = (void (**)(id, void))a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_locationManagerQueue);
  if (self->_locationManager)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v18 = [(ARLocationSensor *)self _createLocationManager];
    locationManager = self->_locationManager;
    self->_locationManager = v18;

    if (v11) {
      goto LABEL_3;
    }
  }
  id v11 = [MEMORY[0x1E4F1C9C8] date];
LABEL_3:
  if (![MEMORY[0x1E4F1E600] locationServicesEnabled]
    || [(CLLocationManager *)self->_locationManager authorizationStatus] != kCLAuthorizationStatusAuthorizedAlways
    && [(CLLocationManager *)self->_locationManager authorizationStatus] != kCLAuthorizationStatusAuthorizedWhenInUse
    || [(CLLocationManager *)self->_locationManager accuracyAuthorization])
  {
    int64x2_t v13 = _ARLogSensor_3();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = (objc_class *)objc_opt_class();
      int64x2_t v15 = NSStringFromClass(v14);
      *(_DWORD *)buf = 138543618;
      v114 = v15;
      __int16 v115 = 2048;
      v116 = self;
      _os_log_impl(&dword_1B88A2000, v13, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Precise location permissions must be enabled to use geo tracking features.", buf, 0x16u);
    }
    int64x2_t v16 = @"FailedDueToMissingPermissions";
    double v17 = 0.0;
LABEL_10:
    +[ARSessionMetrics recordAltitudeLookupAttemptWithDuration:v16 andResult:v17];
LABEL_11:
    v12[2](v12, 0);
    goto LABEL_12;
  }
  currentLocation = self->_currentLocation;
  if (currentLocation)
  {
    uint64_t v21 = [(ARLocationData *)currentLocation location];
    [v21 coordinate];
    double v24 = ARLInfinityAngularDistance(latitude, longitude, v22, v23);

    v25 = _ARLogSensor_3();
    BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG);
    if (v24 > 0.05)
    {
      if (v26)
      {
        int8x16_t v27 = (objc_class *)objc_opt_class();
        unint64_t v28 = NSStringFromClass(v27);
        *(_DWORD *)buf = 138543875;
        v114 = v28;
        __int16 v115 = 2048;
        v116 = self;
        __int16 v117 = 2049;
        *(void *)v118 = 0x3FA999999999999ALL;
        _os_log_impl(&dword_1B88A2000, v25, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Lookup coordinate too far away (>%{private}f degrees) from current location to perform CL altitude lookup", buf, 0x20u);
      }
      goto LABEL_11;
    }
    if (v26)
    {
      uint64_t v36 = (objc_class *)objc_opt_class();
      uint64_t v37 = NSStringFromClass(v36);
      *(_DWORD *)buf = 138544387;
      v114 = v37;
      __int16 v115 = 2048;
      v116 = self;
      __int16 v117 = 1024;
      *(_DWORD *)v118 = a4 + 1;
      *(_WORD *)&v118[4] = 2049;
      *(double *)&v118[6] = latitude;
      *(_WORD *)&v118[14] = 2049;
      *(double *)&v118[16] = longitude;
      _os_log_impl(&dword_1B88A2000, v25, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Performing CL altitude look up attempt #%d at coordinate: %{private}f, %{private}f", buf, 0x30u);
    }
    long long v104 = 0u;
    long long v105 = 0u;
    long long v102 = 0u;
    long long v103 = 0u;
    uint64_t v38 = self->_altitudeSkipTiles;
    uint64_t v39 = [(NSMutableArray *)v38 countByEnumeratingWithState:&v102 objects:v112 count:16];
    if (v39)
    {
      uint64_t v40 = v39;
      uint64_t v41 = *(void *)v103;
      while (2)
      {
        for (uint64_t i = 0; i != v40; ++i)
        {
          if (*(void *)v103 != v41) {
            objc_enumerationMutation(v38);
          }
          if (objc_msgSend(*(id *)(*((void *)&v102 + 1) + 8 * i), "isInside:", latitude, longitude))
          {
            int64x2_t v61 = _ARLogSensor_3();
            if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
            {
              int64x2_t v62 = (objc_class *)objc_opt_class();
              int64x2_t v63 = NSStringFromClass(v62);
              *(_DWORD *)buf = 138543618;
              v114 = v63;
              __int16 v115 = 2048;
              v116 = self;
              _os_log_impl(&dword_1B88A2000, v61, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Tile hasn't been loaded. Skipping look up.", buf, 0x16u);
            }
            uint64_t v46 = 0;
            goto LABEL_51;
          }
        }
        uint64_t v40 = [(NSMutableArray *)v38 countByEnumeratingWithState:&v102 objects:v112 count:16];
        if (v40) {
          continue;
        }
        break;
      }
    }

    unsigned int v43 = 0;
    do
    {
      double v44 = self->_locationManager;
      uint64_t v45 = (void *)[objc_alloc(MEMORY[0x1E4F1E5F0]) initWithLatitude:latitude longitude:longitude];
      uint64_t v46 = [(CLLocationManager *)v44 _groundAltitudeAtLocation:v45];

      if (v46) {
        BOOL v47 = 1;
      }
      else {
        BOOL v47 = v43 >= 7;
      }
      ++v43;
    }
    while (!v47);
    if (v46)
    {
      char v48 = [(ARSkipTileBounds *)v46 isAltitudeWgs84Available];
      uint64_t v49 = _ARLogSensor_3();
      long long v50 = v49;
      if (v48)
      {
        if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
        {
          uint64_t v51 = (objc_class *)objc_opt_class();
          int8x16_t v52 = NSStringFromClass(v51);
          *(_DWORD *)buf = 138544131;
          v114 = v52;
          __int16 v115 = 2048;
          v116 = self;
          __int16 v117 = 2049;
          *(double *)v118 = latitude;
          *(_WORD *)&v118[8] = 2049;
          *(double *)&v118[10] = longitude;
          _os_log_impl(&dword_1B88A2000, v50, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Look up succeeded at coordinate: %{private}f, %{private}f", buf, 0x2Au);
        }
        [v11 timeIntervalSinceNow];
        +[ARSessionMetrics recordAltitudeLookupAttemptWithDuration:@"Success" andResult:fabs(v53)];
        int8x16_t v54 = [(ARLocationData *)self->_currentLocation location];
        [v54 coordinate];
        double v57 = ARLInfinityDistance(latitude, longitude, v55, v56);

        if (v57 > 60.0)
        {
          int8x16_t v58 = _ARLogSensor_3();
          if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v59 = (objc_class *)objc_opt_class();
            int64x2_t v60 = NSStringFromClass(v59);
            *(_DWORD *)buf = 138543875;
            v114 = v60;
            __int16 v115 = 2048;
            v116 = self;
            __int16 v117 = 2049;
            *(void *)v118 = 0x404E000000000000;
            _os_log_impl(&dword_1B88A2000, v58, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Look up coordinate too far away (>%{private}f meters) from current location to perform VL altitude look up", buf, 0x20u);
          }
          ((void (**)(id, ARSkipTileBounds *))v12)[2](v12, v46);
          goto LABEL_71;
        }
        localizer = self->_localizer;
        v89 = (void *)[objc_alloc(MEMORY[0x1E4F1E5F0]) initWithLatitude:latitude longitude:longitude];
        locationManagerQueue = self->_locationManagerQueue;
        v91[0] = MEMORY[0x1E4F143A8];
        v91[1] = 3221225472;
        v91[2] = __102__ARLocationSensor__attemptAltitudeLookupAtCoordinate_attemptCount_lookupStartDate_completionHandler___block_invoke_65;
        v91[3] = &unk_1E6186BA0;
        v91[4] = self;
        v92 = v46;
        v93 = v12;
        uint64_t v46 = v46;
        [(VLLocalizer *)localizer determineAltitudesAtLocation:v89 callbackQueue:locationManagerQueue callback:v91];

        v74 = v93;
        goto LABEL_59;
      }
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        v85 = (objc_class *)objc_opt_class();
        v86 = NSStringFromClass(v85);
        *(_DWORD *)buf = 138543618;
        v114 = v86;
        __int16 v115 = 2048;
        v116 = self;
        _os_log_impl(&dword_1B88A2000, v50, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Altitude value is not available. Giving up.", buf, 0x16u);
      }
      [v11 timeIntervalSinceNow];
      double v83 = fabs(v87);
      v84 = @"FailedDueToUnavailableAltitude";
    }
    else
    {
      uint64_t v46 = -[ARSkipTileBounds initWithCoordinate:]([ARSkipTileBounds alloc], "initWithCoordinate:", latitude, longitude);
LABEL_51:
      unsigned int v64 = a4 + 1;
      if (a4 + 1 <= 5)
      {
        float v65 = _attemptAltitudeLookupAtCoordinate_attemptCount_lookupStartDate_completionHandler__kDelayTimes[v64];
        int8x16_t v66 = _ARLogSensor_3();
        if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v67 = (objc_class *)objc_opt_class();
          int8x16_t v68 = NSStringFromClass(v67);
          *(_DWORD *)buf = 138543874;
          v114 = v68;
          __int16 v115 = 2048;
          v116 = self;
          __int16 v117 = 2048;
          *(double *)v118 = v65;
          _os_log_impl(&dword_1B88A2000, v66, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: CL Look up failed. Scheduling another attempt in %f seconds.", buf, 0x20u);
        }
        if (v46)
        {
          uint64_t v69 = _ARLogSensor_3();
          if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
          {
            int8x16_t v70 = (objc_class *)objc_opt_class();
            uint64_t v71 = NSStringFromClass(v70);
            *(_DWORD *)buf = 138543618;
            v114 = v71;
            __int16 v115 = 2048;
            v116 = self;
            _os_log_impl(&dword_1B88A2000, v69, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Storing DEM bounds.", buf, 0x16u);
          }
          [(NSMutableArray *)self->_altitudeSkipTiles addObject:v46];
        }
        dispatch_time_t v72 = dispatch_time(0, (uint64_t)(float)(v65 * 1000000000.0));
        uint64_t v73 = self->_locationManagerQueue;
        v94[0] = MEMORY[0x1E4F143A8];
        v94[1] = 3221225472;
        v94[2] = __102__ARLocationSensor__attemptAltitudeLookupAtCoordinate_attemptCount_lookupStartDate_completionHandler___block_invoke_55;
        v94[3] = &unk_1E6186B78;
        v95 = v46;
        v96 = self;
        double v99 = latitude;
        double v100 = longitude;
        unsigned int v101 = v64;
        id v97 = v11;
        v98 = v12;
        uint64_t v46 = v46;
        dispatch_after(v72, v73, v94);

        v74 = v95;
LABEL_59:

LABEL_71:
        goto LABEL_12;
      }
      v79 = _ARLogSensor_3();
      if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
      {
        v80 = (objc_class *)objc_opt_class();
        v81 = NSStringFromClass(v80);
        *(_DWORD *)buf = 138543618;
        v114 = v81;
        __int16 v115 = 2048;
        v116 = self;
        _os_log_impl(&dword_1B88A2000, v79, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: All CL altitude look up attempts have failed. Giving up.", buf, 0x16u);
      }
      [v11 timeIntervalSinceNow];
      double v83 = fabs(v82);
      v84 = @"FailedDueToTimeout";
    }
    +[ARSessionMetrics recordAltitudeLookupAttemptWithDuration:v84 andResult:v83];
    v12[2](v12, 0);
    goto LABEL_71;
  }
  unsigned int v29 = a4 + 1;
  if (a4 + 1 > 5)
  {
    uint64_t v75 = _ARLogSensor_3();
    if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
    {
      uint64_t v76 = (objc_class *)objc_opt_class();
      v77 = NSStringFromClass(v76);
      *(_DWORD *)buf = 138543618;
      v114 = v77;
      __int16 v115 = 2048;
      v116 = self;
      _os_log_impl(&dword_1B88A2000, v75, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: All CL altitude look up attempts have failed (no current location). Giving up.", buf, 0x16u);
    }
    [v11 timeIntervalSinceNow];
    double v17 = fabs(v78);
    int64x2_t v16 = @"FailedDueToNoLocation";
    goto LABEL_10;
  }
  float v30 = _attemptAltitudeLookupAtCoordinate_attemptCount_lookupStartDate_completionHandler__kDelayTimes[v29];
  int8x16_t v31 = _ARLogSensor_3();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
  {
    unint64_t v32 = (objc_class *)objc_opt_class();
    int v33 = NSStringFromClass(v32);
    *(_DWORD *)buf = 138543874;
    v114 = v33;
    __int16 v115 = 2048;
    v116 = self;
    __int16 v117 = 2048;
    *(double *)v118 = v30;
    _os_log_impl(&dword_1B88A2000, v31, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Anchor altitude lookup is too soon; current location hasn't been set yet. Trying again in %f seconds.",
      buf,
      0x20u);
  }
  dispatch_time_t v34 = dispatch_time(0, (uint64_t)(float)(v30 * 1000000000.0));
  uint64_t v35 = self->_locationManagerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __102__ARLocationSensor__attemptAltitudeLookupAtCoordinate_attemptCount_lookupStartDate_completionHandler___block_invoke;
  block[3] = &unk_1E6186B50;
  void block[4] = self;
  double v109 = latitude;
  double v110 = longitude;
  unsigned int v111 = v29;
  id v107 = v11;
  v108 = v12;
  dispatch_after(v34, v35, block);

LABEL_12:
}

uint64_t __102__ARLocationSensor__attemptAltitudeLookupAtCoordinate_attemptCount_lookupStartDate_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_attemptAltitudeLookupAtCoordinate:attemptCount:lookupStartDate:completionHandler:", *(unsigned int *)(a1 + 72), *(void *)(a1 + 40), *(void *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __102__ARLocationSensor__attemptAltitudeLookupAtCoordinate_attemptCount_lookupStartDate_completionHandler___block_invoke_55(uint64_t a1)
{
  if (*(void *)(a1 + 32)) {
    objc_msgSend(*(id *)(*(void *)(a1 + 40) + 80), "removeObject:");
  }
  uint64_t v2 = *(unsigned int *)(a1 + 80);
  uint64_t v3 = *(void **)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  double v6 = *(double *)(a1 + 64);
  double v7 = *(double *)(a1 + 72);
  return objc_msgSend(v3, "_attemptAltitudeLookupAtCoordinate:attemptCount:lookupStartDate:completionHandler:", v2, v4, v5, v6, v7);
}

void __102__ARLocationSensor__attemptAltitudeLookupAtCoordinate_attemptCount_lookupStartDate_completionHandler___block_invoke_65(uint64_t a1, void *a2, void *a3)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  double v7 = v6;
  if (v5 && !v6 && [v5 count])
  {
    v8 = [v5 objectAtIndexedSubscript:0];
    [v8 doubleValue];
    double v10 = v9;
    [*(id *)(a1 + 40) altitudeWgs84];
    double v12 = v11;

    unint64_t v13 = 0;
    if ((unint64_t)[v5 count] >= 2)
    {
      unint64_t v13 = 0;
      double v14 = vabdd_f64(v10, v12);
      unint64_t v15 = 1;
      do
      {
        int64x2_t v16 = [v5 objectAtIndexedSubscript:v15];
        [v16 doubleValue];
        double v18 = v17;
        [*(id *)(a1 + 40) altitudeWgs84];
        double v20 = vabdd_f64(v18, v19);

        if (v20 < v14)
        {
          double v14 = v20;
          unint64_t v13 = v15;
        }
        ++v15;
      }
      while (v15 < [v5 count]);
    }
    uint64_t v21 = _ARLogSensor_3();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      double v22 = (objc_class *)objc_opt_class();
      double v23 = NSStringFromClass(v22);
      uint64_t v24 = *(void *)(a1 + 32);
      [*(id *)(a1 + 40) altitude];
      BOOL v26 = v25;
      int8x16_t v27 = [v5 objectAtIndexedSubscript:v13];
      [v27 doubleValue];
      int v41 = 138544131;
      v42 = v23;
      __int16 v43 = 2048;
      uint64_t v44 = v24;
      __int16 v45 = 2049;
      uint64_t v46 = v26;
      __int16 v47 = 2049;
      uint64_t v48 = v28;
      _os_log_impl(&dword_1B88A2000, v21, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: High Resolution Altitude Lookup: SUCCESS (%{private}f :> %{private}f)", (uint8_t *)&v41, 0x2Au);
    }
    id v29 = objc_alloc(MEMORY[0x1E4F1E690]);
    float v30 = [v5 objectAtIndexedSubscript:v13];
    [v30 doubleValue];
    double v32 = v31;
    [*(id *)(a1 + 40) undulation];
    double v34 = ARWGS84ToMSLAltitude(v32, v33);
    [*(id *)(a1 + 40) undulation];
    uint64_t v36 = objc_msgSend(v29, "initWithEstimate:uncertainty:undulation:undulationModel:", objc_msgSend(*(id *)(a1 + 40), "undulationModel"), v34, -1.0, v35);

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    uint64_t v37 = _ARLogSensor_3();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      uint64_t v38 = (objc_class *)objc_opt_class();
      uint64_t v39 = NSStringFromClass(v38);
      uint64_t v40 = *(void *)(a1 + 32);
      int v41 = 138543874;
      v42 = v39;
      __int16 v43 = 2048;
      uint64_t v44 = v40;
      __int16 v45 = 2112;
      uint64_t v46 = v7;
      _os_log_impl(&dword_1B88A2000, v37, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: High resolution (VL) altitude lookup failed, error=%@", (uint8_t *)&v41, 0x20u);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)lookupAltitudeAtCoordinate:(CLLocationCoordinate2D)a3 completionHandler:(id)a4
{
  CLLocationDegrees longitude = a3.longitude;
  CLLocationDegrees latitude = a3.latitude;
  id v7 = a4;
  locationManagerQueue = self->_locationManagerQueue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __65__ARLocationSensor_lookupAltitudeAtCoordinate_completionHandler___block_invoke;
  v10[3] = &unk_1E6186BC8;
  CLLocationDegrees v12 = latitude;
  CLLocationDegrees v13 = longitude;
  v10[4] = self;
  id v11 = v7;
  id v9 = v7;
  dispatch_async(locationManagerQueue, v10);
}

uint64_t __65__ARLocationSensor_lookupAltitudeAtCoordinate_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_attemptAltitudeLookupAtCoordinate:attemptCount:lookupStartDate:completionHandler:", 0, 0, *(void *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));
}

- (void)updateFromVisualLocalizationResult:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (self->_isLiveSensor && ([v4 isSecure] & 1) == 0)
  {
    id v9 = _ARLogSensor_3();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      double v10 = (objc_class *)objc_opt_class();
      id v11 = NSStringFromClass(v10);
      *(_DWORD *)buf = 138543618;
      unint64_t v15 = v11;
      __int16 v16 = 2048;
      double v17 = self;
      _os_log_impl(&dword_1B88A2000, v9, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Skipping update due to insecure location data.", buf, 0x16u);
    }
  }
  else
  {
    [v5 timestamp];
    if (v6 > self->_lastVLUpdateTimestamp)
    {
      [v5 timestamp];
      self->_lastVLUpdateTimestamp = v7;
      locationManagerQueue = self->_locationManagerQueue;
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __55__ARLocationSensor_updateFromVisualLocalizationResult___block_invoke;
      v12[3] = &unk_1E6185160;
      v12[4] = self;
      id v13 = v5;
      dispatch_async(locationManagerQueue, v12);
    }
  }
}

void __55__ARLocationSensor_updateFromVisualLocalizationResult___block_invoke(uint64_t a1)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _ARLogSensor_3();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v3 = (objc_class *)objc_opt_class();
    id v4 = NSStringFromClass(v3);
    uint64_t v5 = *(void *)(a1 + 32);
    double v6 = [*(id *)(a1 + 40) localizationResult];
    double v7 = v6;
    if (v6)
    {
      [v6 location];
      float64x2_t v8 = v34;
      float64x2_t v9 = v35;
    }
    else
    {
      float64x2_t v8 = 0uLL;
      float64x2_t v35 = 0u;
      long long v36 = 0u;
      float64x2_t v34 = 0u;
      float64x2_t v9 = 0uLL;
    }
    double v10 = ARVector3Description((__n128)vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v8), v9));
    id v11 = [*(id *)(a1 + 40) localizationResult];
    CLLocationDegrees v12 = v11;
    if (v11)
    {
      [v11 transform];
    }
    else
    {
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      float64x2_t v26 = 0u;
      long long v27 = 0u;
    }
    v13.n128_f64[0] = ARMatrix4x4DoubleToFloat(&v26);
    double v17 = ARMatrix4x4Description(1, v13, v14, v15, v16);
    [*(id *)(a1 + 40) timestamp];
    *(_DWORD *)buf = 138544387;
    uint64_t v38 = v4;
    __int16 v39 = 2048;
    uint64_t v40 = v5;
    __int16 v41 = 2113;
    v42 = v10;
    __int16 v43 = 2113;
    uint64_t v44 = v17;
    __int16 v45 = 2048;
    uint64_t v46 = v18;
    _os_log_impl(&dword_1B88A2000, v2, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: updateFromVisualLocalizationResult: location = %{private}@, transform = %{private}@, time = %f", buf, 0x34u);
  }
  id v19 = objc_alloc(MEMORY[0x1E4F1E6B0]);
  [*(id *)(a1 + 40) timestamp];
  double v21 = v20;
  double v22 = [*(id *)(a1 + 40) localizationResult];
  double v23 = (void *)[v19 initWithTimestamp:v22 localizationResult:v21];

  uint64_t v24 = *(void *)(a1 + 32);
  uint64_t v25 = 16;
  if (!*(unsigned char *)(v24 + 40)) {
    uint64_t v25 = 24;
  }
  objc_msgSend(*(id *)(v24 + v25), "_updateVLLocalizationResult:", v23, *(_OWORD *)&v26, v27, v28, v29, v30, v31, v32, v33, *(_OWORD *)&v34, *(_OWORD *)&v35, v36);
}

- (id)updateFromLocationData:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  if (self->_isLiveSensor)
  {
    double v6 = _ARLogSensor_3();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      double v7 = (objc_class *)objc_opt_class();
      float64x2_t v8 = NSStringFromClass(v7);
      int v33 = 138543618;
      float64x2_t v34 = v8;
      __int16 v35 = 2048;
      long long v36 = self;
      float64x2_t v9 = "%{public}@ <%p>: updateFromLocationData is only intended for use during replay; skipping.";
      double v10 = v6;
      os_log_type_t v11 = OS_LOG_TYPE_DEBUG;
LABEL_7:
      _os_log_impl(&dword_1B88A2000, v10, v11, v9, (uint8_t *)&v33, 0x16u);

      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if ([v4 isSecure])
  {
    double v6 = _ARLogSensor_3();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      CLLocationDegrees v12 = (objc_class *)objc_opt_class();
      float64x2_t v8 = NSStringFromClass(v12);
      int v33 = 138543618;
      float64x2_t v34 = v8;
      __int16 v35 = 2048;
      long long v36 = self;
      float64x2_t v9 = "%{public}@ <%p>: updateFromLocationData expects insecure data.";
      double v10 = v6;
      os_log_type_t v11 = OS_LOG_TYPE_ERROR;
      goto LABEL_7;
    }
LABEL_8:

LABEL_9:
    id v13 = v5;
    goto LABEL_10;
  }
  [v5 timestamp];
  if (v15 <= self->_lastLocationUpdateTimestamp) {
    goto LABEL_9;
  }
  [v5 timestamp];
  self->_lastLocationUpdateTimestamp = v16;
  locationPlayer = self->_locationPlayer;
  uint64_t v18 = [v5 location];
  [v5 timestamp];
  id v19 = -[_CLLocationPlayer _getFusedLocationFrom:machAbsTime:](locationPlayer, "_getFusedLocationFrom:machAbsTime:", v18);

  id v20 = v5;
  double v21 = v20;
  if (!v19)
  {
    double v23 = _ARLogSensor_3();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      long long v30 = (objc_class *)objc_opt_class();
      long long v31 = NSStringFromClass(v30);
      int v33 = 138543618;
      float64x2_t v34 = v31;
      __int16 v35 = 2048;
      long long v36 = self;
      _os_log_impl(&dword_1B88A2000, v23, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Location fusion failed.", (uint8_t *)&v33, 0x16u);
    }
    id v13 = v21;
    goto LABEL_24;
  }
  id v13 = (id)[v20 copy];

  [v13 setLocation:v19];
  int v22 = [v19 isCoordinateFused];
  double v23 = _ARLogSensor_3();
  BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_INFO);
  if (v22)
  {
    if (v24)
    {
      uint64_t v25 = (objc_class *)objc_opt_class();
      float64x2_t v26 = NSStringFromClass(v25);
      int v33 = 138543875;
      float64x2_t v34 = v26;
      __int16 v35 = 2048;
      long long v36 = self;
      __int16 v37 = 2113;
      id v38 = v13;
      long long v27 = "%{public}@ <%p>: Updated to fused location: %{private}@.";
      long long v28 = v23;
      uint32_t v29 = 32;
LABEL_23:
      _os_log_impl(&dword_1B88A2000, v28, OS_LOG_TYPE_INFO, v27, (uint8_t *)&v33, v29);
    }
  }
  else if (v24)
  {
    long long v32 = (objc_class *)objc_opt_class();
    float64x2_t v26 = NSStringFromClass(v32);
    int v33 = 138543618;
    float64x2_t v34 = v26;
    __int16 v35 = 2048;
    long long v36 = self;
    long long v27 = "%{public}@ <%p>: Fusion did not produce fused location.";
    long long v28 = v23;
    uint32_t v29 = 22;
    goto LABEL_23;
  }
LABEL_24:

  [(ARLocationSensor *)self setCurrentLocation:v13];
LABEL_10:

  return v13;
}

- (id)updateFromDeviceOrientationData:(id)a3
{
  id v3 = a3;
  return v3;
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_locationManagerQueue);
  uint64_t v5 = _ARLogSensor_3();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    double v6 = (objc_class *)objc_opt_class();
    double v7 = NSStringFromClass(v6);
    int v8 = [v4 authorizationStatus];
    uint64_t v9 = [v4 accuracyAuthorization];
    double v10 = @"No";
    *(_DWORD *)double v16 = 138544130;
    *(_WORD *)&v16[12] = 2048;
    *(void *)&v16[4] = v7;
    if (!v9) {
      double v10 = @"Yes";
    }
    *(void *)&v16[14] = self;
    __int16 v17 = 1024;
    int v18 = v8;
    __int16 v19 = 2112;
    id v20 = v10;
    _os_log_impl(&dword_1B88A2000, v5, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: authorization status changed: %i with precise location: %@", v16, 0x26u);
  }
  os_log_type_t v11 = [(ARLocationSensor *)self locationManagerDelegate];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    id v13 = [(ARLocationSensor *)self locationManagerDelegate];
    [v13 locationManagerDidChangeAuthorization:v4];
  }
  __n128 v14 = [(ARLocationSensor *)self _validateLocationAuthorization];
  if (v14)
  {
    double v15 = [(ARLocationSensor *)self delegate];
    [v15 sensor:self didFailWithError:v14];
  }
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_locationManagerQueue);
  if (self->_isStopped)
  {
    double v6 = _ARLogSensor_3();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      double v7 = (objc_class *)objc_opt_class();
      int v8 = NSStringFromClass(v7);
      int v20 = 138543618;
      uint64_t v21 = v8;
      __int16 v22 = 2048;
      double v23 = self;
      _os_log_impl(&dword_1B88A2000, v6, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Disregarding location update for stopped sensor", (uint8_t *)&v20, 0x16u);
    }
  }
  else
  {
    [v5 count];
    kdebug_trace();
    uint64_t v9 = [ARLocationData alloc];
    double v10 = [v5 lastObject];
    double v6 = [(ARLocationData *)v9 initWithLocation:v10];

    os_log_type_t v11 = _ARLogSensor_3();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      char v12 = (objc_class *)objc_opt_class();
      id v13 = NSStringFromClass(v12);
      __n128 v14 = [v6 description];
      int v20 = 138543874;
      uint64_t v21 = v13;
      __int16 v22 = 2048;
      double v23 = self;
      __int16 v24 = 2112;
      uint64_t v25 = v14;
      _os_log_impl(&dword_1B88A2000, v11, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: location update received: %@", (uint8_t *)&v20, 0x20u);
    }
    [(ARLocationSensor *)self setCurrentLocation:v6];
    [v6 timestamp];
    uint64_t v15 = [v6 location];
    [(id)v15 coordinate];
    double v16 = [v6 location];
    [v16 coordinate];
    __int16 v17 = [v6 location];
    [v17 horizontalAccuracy];
    kdebug_trace();

    int v18 = [(ARLocationSensor *)self delegate];
    LOBYTE(v15) = objc_opt_respondsToSelector();

    if (v15)
    {
      __int16 v19 = [(ARLocationSensor *)self delegate];
      [v19 sensor:self didOutputSensorData:v6];
    }
    kdebug_trace();
    kdebug_trace();
  }
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_locationManagerQueue);
  if ([v6 code])
  {
    double v7 = [(ARLocationSensor *)self delegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      uint64_t v9 = [(ARLocationSensor *)self delegate];
      [v9 sensor:self didFailWithError:v6];
    }
  }
  double v10 = [(ARLocationSensor *)self locationManagerDelegate];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    char v12 = [(ARLocationSensor *)self locationManagerDelegate];
    [v12 locationManager:v13 didFailWithError:v6];
  }
}

- (ARSensorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ARSensorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CLLocationManagerDelegate)locationManagerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_locationManagerDelegate);
  return (CLLocationManagerDelegate *)WeakRetained;
}

- (void)setLocationManagerDelegate:(id)a3
{
}

- (ARLocationData)currentLocation
{
  return (ARLocationData *)objc_getProperty(self, a2, 104, 1);
}

- (void)setCurrentLocation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentLocation, 0);
  objc_destroyWeak((id *)&self->_locationManagerDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_altitudeSkipTiles, 0);
  objc_storeStrong((id *)&self->_locationManagerQueue, 0);
  objc_storeStrong((id *)&self->_localizer, 0);
  objc_storeStrong((id *)&self->_locationPlayer, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end