@interface ARDeviceOrientationSensor
- (ARDeviceOrientationSensor)initWithMotionManager:(id)a3 alignment:(int64_t)a4;
- (ARSensorDelegate)delegate;
- (NSString)description;
- (double)interval;
- (double)preferredInterval;
- (int64_t)worldAlignment;
- (unint64_t)providedDataTypes;
- (void)changeReferenceFrame:(unint64_t)a3;
- (void)dealloc;
- (void)handleDeviceMotionUpdateWithMotion:(id)a3 error:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setInterval:(double)a3;
- (void)start;
- (void)stop;
- (void)waitForOutstandingCallbacks;
@end

@implementation ARDeviceOrientationSensor

- (ARDeviceOrientationSensor)initWithMotionManager:(id)a3 alignment:(int64_t)a4
{
  id v7 = a3;
  if ([v7 isDeviceMotionAvailable])
  {
    v14.receiver = self;
    v14.super_class = (Class)ARDeviceOrientationSensor;
    v8 = [(ARDeviceOrientationSensor *)&v14 init];
    p_isa = (id *)&v8->super.isa;
    if (v8)
    {
      v8->_worldAlignment = a4;
      objc_storeStrong((id *)&v8->_motionManager, a3);
      id v10 = objc_alloc_init(MEMORY[0x1E4F28F08]);
      id v11 = p_isa[2];
      p_isa[2] = v10;

      [p_isa[2] setQualityOfService:33];
      [p_isa[2] setMaxConcurrentOperationCount:1];
    }
    self = p_isa;
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = _ARLogSensor_10();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    motionManager = self->_motionManager;
    *(_DWORD *)buf = 138543874;
    v9 = v5;
    __int16 v10 = 2048;
    id v11 = self;
    __int16 v12 = 2048;
    v13 = motionManager;
    _os_log_impl(&dword_1B88A2000, v3, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: dealloc (%p).", buf, 0x20u);
  }
  [(ARDeviceOrientationSensor *)self stop];
  v7.receiver = self;
  v7.super_class = (Class)ARDeviceOrientationSensor;
  [(ARDeviceOrientationSensor *)&v7 dealloc];
}

- (unint64_t)providedDataTypes
{
  return 8;
}

- (void)start
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v3 = _ARLogSensor_10();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    motionManager = self->_motionManager;
    *(_DWORD *)buf = 138543874;
    v29 = v5;
    __int16 v30 = 2048;
    v31 = self;
    __int16 v32 = 2048;
    v33 = motionManager;
    _os_log_impl(&dword_1B88A2000, v3, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: start (%p)", buf, 0x20u);
  }
  [(ARDeviceOrientationSensor *)self preferredInterval];
  -[ARDeviceOrientationSensor setInterval:](self, "setInterval:");
  if (self->_worldAlignment == 1) {
    uint64_t v7 = 8;
  }
  else {
    uint64_t v7 = 1;
  }
  v8 = _ARLogSensor_10();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = (objc_class *)objc_opt_class();
    __int16 v10 = NSStringFromClass(v9);
    NSStringFromAttitudeReferenceFrame(v7);
    id v11 = (CMMotionManager *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v29 = v10;
    __int16 v30 = 2048;
    v31 = self;
    __int16 v32 = 2112;
    v33 = v11;
    _os_log_impl(&dword_1B88A2000, v8, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: starting with reference frame: %@", buf, 0x20u);
  }
  if (([MEMORY[0x1E4F22230] availableAttitudeReferenceFrames] & v7) != 0)
  {
    objc_initWeak((id *)buf, self);
    __int16 v12 = self->_motionManager;
    taskDeviceMotion = self->_taskDeviceMotion;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __34__ARDeviceOrientationSensor_start__block_invoke;
    v26[3] = &unk_1E6187F68;
    objc_copyWeak(&v27, (id *)buf);
    [(CMMotionManager *)v12 startDeviceMotionUpdatesUsingReferenceFrame:v7 toQueue:taskDeviceMotion withHandler:v26];
    objc_destroyWeak(&v27);
    objc_destroyWeak((id *)buf);
    uint64_t v14 = [(ARDeviceOrientationSensor *)self delegate];
    LOBYTE(v12) = objc_opt_respondsToSelector();

    if ((v12 & 1) == 0) {
      return;
    }
    v15 = [(ARDeviceOrientationSensor *)self delegate];
    [v15 sensorDidStart:self];
    goto LABEL_17;
  }
  v16 = _ARLogSensor_10();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    v17 = (objc_class *)objc_opt_class();
    v18 = NSStringFromClass(v17);
    NSStringFromAttitudeReferenceFrame(v7);
    v19 = (CMMotionManager *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v29 = v18;
    __int16 v30 = 2048;
    v31 = self;
    __int16 v32 = 2112;
    v33 = v19;
    _os_log_impl(&dword_1B88A2000, v16, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Device motion is not available for reference frame: %@", buf, 0x20u);
  }
  v20 = _ARLogSensor_10();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    v21 = (objc_class *)objc_opt_class();
    v22 = NSStringFromClass(v21);
    *(_DWORD *)buf = 138543618;
    v29 = v22;
    __int16 v30 = 2048;
    v31 = self;
    _os_log_impl(&dword_1B88A2000, v20, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Failed to start.", buf, 0x16u);
  }
  v23 = [(ARDeviceOrientationSensor *)self delegate];
  char v24 = objc_opt_respondsToSelector();

  if (v24)
  {
    v15 = [(ARDeviceOrientationSensor *)self delegate];
    v25 = ARErrorWithCodeAndUserInfo(101, 0);
    [v15 sensor:self didFailWithError:v25];

LABEL_17:
  }
}

void __34__ARDeviceOrientationSensor_start__block_invoke(uint64_t a1, void *a2, void *a3)
{
  v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained handleDeviceMotionUpdateWithMotion:v6 error:v5];
}

- (void)changeReferenceFrame:(unint64_t)a3
{
  if ([(CMMotionManager *)self->_motionManager isDeviceMotionActive])
  {
    [(CMMotionManager *)self->_motionManager stopDeviceMotionUpdates];
    objc_initWeak(&location, self);
    motionManager = self->_motionManager;
    taskDeviceMotion = self->_taskDeviceMotion;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __50__ARDeviceOrientationSensor_changeReferenceFrame___block_invoke;
    v7[3] = &unk_1E6187F68;
    objc_copyWeak(&v8, &location);
    [(CMMotionManager *)motionManager startDeviceMotionUpdatesUsingReferenceFrame:a3 toQueue:taskDeviceMotion withHandler:v7];
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __50__ARDeviceOrientationSensor_changeReferenceFrame___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained handleDeviceMotionUpdateWithMotion:v6 error:v5];
}

- (void)handleDeviceMotionUpdateWithMotion:(id)a3 error:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  kdebug_trace();
  if (v7 && [v7 code] != 101)
  {
    v13 = _ARLogSensor_10();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = (objc_class *)objc_opt_class();
      v15 = NSStringFromClass(v14);
      v16 = [v7 description];
      *(_DWORD *)buf = 138543874;
      v33 = v15;
      __int16 v34 = 2048;
      v35 = self;
      __int16 v36 = 2112;
      v37 = v16;
      _os_log_impl(&dword_1B88A2000, v13, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: error received from motion manager: %@", buf, 0x20u);
    }
    v17 = [(ARDeviceOrientationSensor *)self delegate];
    uint64_t v30 = *MEMORY[0x1E4F28A50];
    id v31 = v7;
    v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    v19 = ARErrorWithCodeAndUserInfo(102, v18);
    [v17 sensor:self didFailWithError:v19];

    goto LABEL_18;
  }
  if (!v6)
  {
    v17 = _ARLogSensor_10();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      v20 = (objc_class *)objc_opt_class();
      v18 = NSStringFromClass(v20);
      motionManager = self->_motionManager;
      *(_DWORD *)buf = 138543874;
      v33 = v18;
      __int16 v34 = 2048;
      v35 = self;
      __int16 v36 = 2048;
      v37 = motionManager;
      v22 = "%{public}@ <%p>: Failed to get device motion from motion manager (%p)";
      v23 = v17;
      uint32_t v24 = 32;
LABEL_17:
      _os_log_impl(&dword_1B88A2000, v23, OS_LOG_TYPE_DEBUG, v22, buf, v24);
LABEL_18:
    }
LABEL_19:

    goto LABEL_24;
  }
  [v6 timestamp];
  if (v8 <= self->_previousCaptureEndingTimestamp)
  {
    v17 = _ARLogSensor_10();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      v25 = (objc_class *)objc_opt_class();
      v18 = NSStringFromClass(v25);
      *(_DWORD *)buf = 138543618;
      v33 = v18;
      __int16 v34 = 2048;
      v35 = self;
      v22 = "%{public}@ <%p>: Rejected stale device motion data";
      v23 = v17;
      uint32_t v24 = 22;
      goto LABEL_17;
    }
    goto LABEL_19;
  }
  if (self->_worldAlignment == 1)
  {
    [v6 magneticField];
    if (v29 != 2)
    {
      v9 = _ARLogSensor_10();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        __int16 v10 = (objc_class *)objc_opt_class();
        id v11 = NSStringFromClass(v10);
        [v6 magneticField];
        if ((v28 + 1) > 3) {
          __int16 v12 = &stru_1F120C8F0;
        }
        else {
          __int16 v12 = off_1E6187F88[v28 + 1];
        }
        *(_DWORD *)buf = 138543874;
        v33 = v11;
        __int16 v34 = 2048;
        v35 = self;
        __int16 v36 = 2112;
        v37 = v12;
        _os_log_impl(&dword_1B88A2000, v9, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Warning: Magnetic calibration accuracy is %@", buf, 0x20u);
      }
    }
  }
  v26 = [(ARDeviceOrientationSensor *)self delegate];
  id v27 = [[ARDeviceOrientationData alloc] initWithMotionData:v6];
  [v26 sensor:self didOutputSensorData:v27];

  [v6 timestamp];
  kdebug_trace();
LABEL_24:
}

- (double)preferredInterval
{
  +[ARKitUserDefaults floatForKey:@"com.apple.arkit.motionSensor.sampleRate"];
  return 1.0 / v2;
}

- (void)setInterval:(double)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (![(CMMotionManager *)self->_motionManager isDeviceMotionAvailable]) {
    a3 = 0.0;
  }
  if (self->_interval != a3)
  {
    [(CMMotionManager *)self->_motionManager setDeviceMotionUpdateInterval:fmax(a3, 0.0)];
    id v5 = _ARLogSensor_10();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      id v6 = (objc_class *)objc_opt_class();
      id v7 = NSStringFromClass(v6);
      int v8 = 138543874;
      v9 = v7;
      __int16 v10 = 2048;
      id v11 = self;
      __int16 v12 = 2048;
      double v13 = a3;
      _os_log_impl(&dword_1B88A2000, v5, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: CMDeviceMotion update interval set at %f", (uint8_t *)&v8, 0x20u);
    }
    self->_interval = a3;
  }
}

- (void)stop
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = [(CMMotionManager *)self->_motionManager deviceMotion];
  v4 = v3;
  if (v3)
  {
    [v3 timestamp];
    self->_previousCaptureEndingTimestamp = v5;
  }
  [(ARDeviceOrientationSensor *)self setInterval:0.0];
  id v6 = _ARLogSensor_10();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    id v7 = (objc_class *)objc_opt_class();
    int v8 = NSStringFromClass(v7);
    motionManager = self->_motionManager;
    int v10 = 138543874;
    id v11 = v8;
    __int16 v12 = 2048;
    double v13 = self;
    __int16 v14 = 2048;
    v15 = motionManager;
    _os_log_impl(&dword_1B88A2000, v6, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: stop (%p).", (uint8_t *)&v10, 0x20u);
  }
  [(CMMotionManager *)self->_motionManager stopDeviceMotionUpdates];
}

- (void)waitForOutstandingCallbacks
{
}

- (NSString)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  v4 = (objc_class *)objc_opt_class();
  double v5 = NSStringFromClass(v4);
  id v6 = [v3 stringWithFormat:@"<%@: %p", v5, self];

  [v6 appendFormat:@" MotionManager=%@", self->_motionManager];
  [v6 appendString:@">"];
  return (NSString *)v6;
}

- (ARSensorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ARSensorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)worldAlignment
{
  return self->_worldAlignment;
}

- (double)interval
{
  return self->_interval;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_taskDeviceMotion, 0);
  objc_storeStrong((id *)&self->_motionManager, 0);
}

@end