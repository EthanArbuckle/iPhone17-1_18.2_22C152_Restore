@interface ARMotionSensor
- (ARMotionSensor)initWithMotionManager:(id)a3;
- (ARSensorDelegate)delegate;
- (NSString)description;
- (double)interval;
- (double)preferredInterval;
- (unint64_t)providedDataTypes;
- (void)accelerometerOutput:(id *)a3;
- (void)dealloc;
- (void)gyroscopeOutput:(id *)a3;
- (void)magnetometerOutput:(id *)a3;
- (void)setDelegate:(id)a3;
- (void)setInterval:(double)a3;
- (void)start;
- (void)stop;
@end

@implementation ARMotionSensor

- (ARMotionSensor)initWithMotionManager:(id)a3
{
  id v5 = a3;
  if ([v5 isGyroAvailable] && objc_msgSend(v5, "isAccelerometerAvailable"))
  {
    v16.receiver = self;
    v16.super_class = (Class)ARMotionSensor;
    v6 = [(ARMotionSensor *)&v16 init];
    v7 = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_motionManager, a3);
      v7->_requestMagnetometerData = +[ARKitUserDefaults BOOLForKey:@"com.apple.arkit.motionSensor.magnetometerEnabled"];
      uint64_t v8 = objc_opt_new();
      currentGyroData = v7->_currentGyroData;
      v7->_currentGyroData = (ARGyroscopeData *)v8;

      uint64_t v10 = objc_opt_new();
      currentAccelerometerData = v7->_currentAccelerometerData;
      v7->_currentAccelerometerData = (ARAccelerometerData *)v10;

      if (v7->_requestMagnetometerData)
      {
        uint64_t v12 = objc_opt_new();
        currentMagnetometerData = v7->_currentMagnetometerData;
        v7->_currentMagnetometerData = (ARMagnetometerData *)v12;
      }
    }
    self = v7;
    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [(ARMotionSensor *)self stop];
  v3 = _ARLogSensor_0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = (objc_class *)objc_opt_class();
    id v5 = NSStringFromClass(v4);
    motionManager = self->_motionManager;
    *(_DWORD *)buf = 138543874;
    v9 = v5;
    __int16 v10 = 2048;
    v11 = self;
    __int16 v12 = 2048;
    v13 = motionManager;
    _os_log_impl(&dword_1B88A2000, v3, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: ARMotionSensor dealloc (%p).", buf, 0x20u);
  }
  v7.receiver = self;
  v7.super_class = (Class)ARMotionSensor;
  [(ARMotionSensor *)&v7 dealloc];
}

- (unint64_t)providedDataTypes
{
  if (self->_requestMagnetometerData) {
    return 1030;
  }
  else {
    return 6;
  }
}

- (double)preferredInterval
{
  +[ARKitUserDefaults floatForKey:@"com.apple.arkit.motionSensor.sampleRate"];
  return 1.0 / v2;
}

- (void)start
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = _ARLogSensor_0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = (objc_class *)objc_opt_class();
    id v5 = NSStringFromClass(v4);
    motionManager = self->_motionManager;
    int v17 = 138543874;
    v18 = v5;
    __int16 v19 = 2048;
    v20 = self;
    __int16 v21 = 2048;
    v22 = motionManager;
    _os_log_impl(&dword_1B88A2000, v3, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: ARMotionSensor start (%p).", (uint8_t *)&v17, 0x20u);
  }
  [(ARMotionSensor *)self preferredInterval];
  -[ARMotionSensor setInterval:](self, "setInterval:");
  [(ARMotionSensor *)self interval];
  if (v7 > 0.0)
  {
    uint64_t v8 = [(ARMotionSensor *)self delegate];
    char v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) == 0) {
      return;
    }
    __int16 v10 = [(ARMotionSensor *)self delegate];
    [v10 sensorDidStart:self];
    goto LABEL_10;
  }
  v11 = _ARLogSensor_0();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    __int16 v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    int v17 = 138543618;
    v18 = v13;
    __int16 v19 = 2048;
    v20 = self;
    _os_log_impl(&dword_1B88A2000, v11, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Accelerometer and/or Gyroscope sensor(s) not available", (uint8_t *)&v17, 0x16u);
  }
  uint64_t v14 = [(ARMotionSensor *)self delegate];
  char v15 = objc_opt_respondsToSelector();

  if (v15)
  {
    __int16 v10 = [(ARMotionSensor *)self delegate];
    objc_super v16 = ARErrorWithCodeAndUserInfo(101, 0);
    [v10 sensor:self didFailWithError:v16];

LABEL_10:
  }
}

- (void)stop
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v3 = _ARLogSensor_0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = (objc_class *)objc_opt_class();
    id v5 = NSStringFromClass(v4);
    motionManager = self->_motionManager;
    int v7 = 138543874;
    uint64_t v8 = v5;
    __int16 v9 = 2048;
    __int16 v10 = self;
    __int16 v11 = 2048;
    __int16 v12 = motionManager;
    _os_log_impl(&dword_1B88A2000, v3, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: ARMotionSensor stop (%p).", (uint8_t *)&v7, 0x20u);
  }
  [(ARMotionSensor *)self setInterval:0.0];
}

- (void)setInterval:(double)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (self->_interval == a3) {
    return;
  }
  motionManager = self->_motionManager;
  if (a3 <= 0.0)
  {
    [(CMMotionManager *)motionManager setGyroDataCallback:0 info:0 interval:0.0];
    [(CMMotionManager *)self->_motionManager setAccelerometerDataCallback:0 info:0 interval:0.0];
    if ([(CMMotionManager *)self->_motionManager isMagnetometerAvailable]
      && self->_requestMagnetometerData)
    {
      v6 = self->_motionManager;
      double v9 = 0.0;
      int v7 = 0;
      uint64_t v8 = 0;
      goto LABEL_9;
    }
  }
  else
  {
    [(CMMotionManager *)motionManager setGyroDataCallback:rawGyroscopeCallback info:self interval:a3];
    [(CMMotionManager *)self->_motionManager setAccelerometerDataCallback:rawAccelerometerCallback info:self interval:a3];
    if ([(CMMotionManager *)self->_motionManager isMagnetometerAvailable]
      && self->_requestMagnetometerData)
    {
      v6 = self->_motionManager;
      int v7 = rawMagnetometerCallback;
      uint64_t v8 = self;
      double v9 = a3;
LABEL_9:
      [(CMMotionManager *)v6 setMagnetometerDataCallback:v7 info:v8 interval:v9];
    }
  }
  __int16 v10 = _ARLogSensor_0();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    __int16 v11 = (objc_class *)objc_opt_class();
    __int16 v12 = NSStringFromClass(v11);
    int v13 = 138543874;
    uint64_t v14 = v12;
    __int16 v15 = 2048;
    objc_super v16 = self;
    __int16 v17 = 2048;
    double v18 = a3;
    _os_log_impl(&dword_1B88A2000, v10, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Accelerometer and Gyroscope update interval set at %f", (uint8_t *)&v13, 0x20u);
  }
  self->_interval = a3;
}

- (void)gyroscopeOutput:(id *)a3
{
  kdebug_trace();
  [(ARGyroscopeData *)self->_currentGyroData setTimestamp:a3->var1];
  -[ARGyroscopeData setRotationRate:](self->_currentGyroData, "setRotationRate:", a3->var0.var0, a3->var0.var1, a3->var0.var2);
  id v5 = [(ARMotionSensor *)self delegate];
  [v5 sensor:self didOutputSensorData:self->_currentGyroData];

  kdebug_trace();
}

- (void)accelerometerOutput:(id *)a3
{
  kdebug_trace();
  [(ARAccelerometerData *)self->_currentAccelerometerData setTimestamp:a3->var1];
  -[ARAccelerometerData setAcceleration:](self->_currentAccelerometerData, "setAcceleration:", a3->var0.var0, a3->var0.var1, a3->var0.var2);
  id v5 = [(ARMotionSensor *)self delegate];
  [v5 sensor:self didOutputSensorData:self->_currentAccelerometerData];

  kdebug_trace();
}

- (void)magnetometerOutput:(id *)a3
{
  kdebug_trace();
  [(ARMagnetometerData *)self->_currentMagnetometerData setTimestamp:a3->var1];
  -[ARMagnetometerData setMagneticField:](self->_currentMagnetometerData, "setMagneticField:", a3->var0.var0, a3->var0.var1, a3->var0.var2);
  id v5 = [(ARMotionSensor *)self delegate];
  [v5 sensor:self didOutputSensorData:self->_currentMagnetometerData];

  kdebug_trace();
}

- (NSString)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@: %p", v5, self];

  [v6 appendFormat:@" MotionManager=%@", self->_motionManager];
  [v6 appendFormat:@" Gyroscope=%@", self->_currentGyroData];
  [v6 appendFormat:@" Accelerometer=%@", self->_currentAccelerometerData];
  if (self->_requestMagnetometerData) {
    [v6 appendFormat:@" Magnetometer=%@", self->_currentMagnetometerData];
  }
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

- (double)interval
{
  return self->_interval;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentMagnetometerData, 0);
  objc_storeStrong((id *)&self->_currentAccelerometerData, 0);
  objc_storeStrong((id *)&self->_currentGyroData, 0);
  objc_storeStrong((id *)&self->_motionManager, 0);
}

@end