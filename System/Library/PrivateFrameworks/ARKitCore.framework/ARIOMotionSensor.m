@interface ARIOMotionSensor
- (ARIOMotionSensor)init;
- (ARSensorDelegate)delegate;
- (int64_t)preferredSampleRate;
- (unint64_t)providedDataTypes;
- (void)accelerometerDidOutputEvent:(__IOHIDEvent *)a3 timestamp:(double)a4;
- (void)dealloc;
- (void)gyroscopeDidOutputEvent:(__IOHIDEvent *)a3 timestamp:(double)a4;
- (void)setDelegate:(id)a3;
- (void)start;
- (void)stop;
- (void)waitForOutstandingCallbacks;
@end

@implementation ARIOMotionSensor

- (ARIOMotionSensor)init
{
  v18.receiver = self;
  v18.super_class = (Class)ARIOMotionSensor;
  v2 = [(ARIOMotionSensor *)&v18 init];
  v3 = v2;
  if (!v2) {
    goto LABEL_11;
  }
  location = v2->_location;
  v2->_location = (NSString *)&stru_1F120C8F0;

  uint64_t v5 = objc_opt_new();
  currentGyroData = v3->_currentGyroData;
  v3->_currentGyroData = (ARGyroscopeData *)v5;

  uint64_t v7 = objc_opt_new();
  currentAccelerometerData = v3->_currentAccelerometerData;
  v3->_currentAccelerometerData = (ARAccelerometerData *)v7;

  uint64_t v9 = ARCreateFixedPriorityDispatchQueue("com.apple.arkit.motion");
  imuDataQueue = v3->_imuDataQueue;
  v3->_imuDataQueue = (OS_dispatch_queue *)v9;

  v11 = (__IOHIDEventSystemClient *)IOHIDEventSystemClientCreateWithType();
  v3->_accelerometerSystemClient = v11;
  if (v11) {
    v3->_accelerometerService = copyHIDServicePlugin(v11, 65280, 3, [(NSString *)v3->_location UTF8String]);
  }
  v12 = (__IOHIDEventSystemClient *)IOHIDEventSystemClientCreateWithType();
  v3->_gyroSystemClient = v12;
  if (v12) {
    v3->_gyroService = copyHIDServicePlugin(v12, 65280, 9, [(NSString *)v3->_location UTF8String]);
  }
  if (!v3->_accelerometerSystemClient || !v3->_gyroSystemClient)
  {
LABEL_12:
    accelerometerService = 0;
    goto LABEL_13;
  }
  IOHIDEventSystemClientScheduleWithDispatchQueue();
  IOHIDEventSystemClientRegisterEventCallback();
  IOHIDEventSystemClientScheduleWithDispatchQueue();
  IOHIDEventSystemClientRegisterEventCallback();
  accelerometerService = v3->_accelerometerService;
  if (accelerometerService)
  {
    if (v3->_gyroService)
    {
      v14 = [NSNumber numberWithInt:0];
      IOHIDServiceClientSetProperty(accelerometerService, @"ReportInterval", v14);

      gyroService = v3->_gyroService;
      v16 = [NSNumber numberWithInt:0];
      IOHIDServiceClientSetProperty(gyroService, @"ReportInterval", v16);

LABEL_11:
      accelerometerService = v3;
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_13:

  return (ARIOMotionSensor *)accelerometerService;
}

- (void)dealloc
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (_ARLogSensor_onceToken_1 != -1) {
    dispatch_once(&_ARLogSensor_onceToken_1, &__block_literal_global_117_0);
  }
  v3 = (void *)_ARLogSensor_logObj_1;
  if (os_log_type_enabled((os_log_t)_ARLogSensor_logObj_1, OS_LOG_TYPE_DEBUG))
  {
    v4 = v3;
    uint64_t v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    *(_DWORD *)buf = 138543618;
    v13 = v6;
    __int16 v14 = 2048;
    v15 = self;
    _os_log_impl(&dword_1B88A2000, v4, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: ARIOMotionSensor dealloc", buf, 0x16u);
  }
  [(ARIOMotionSensor *)self stop];
  if (self->_accelerometerSystemClient)
  {
    IOHIDEventSystemClientUnregisterEventCallback();
    MEMORY[0x1BA9C4F80](self->_accelerometerSystemClient, self->_imuDataQueue);
  }
  accelerometerService = self->_accelerometerService;
  if (accelerometerService) {
    CFRelease(accelerometerService);
  }
  accelerometerSystemClient = self->_accelerometerSystemClient;
  if (accelerometerSystemClient) {
    CFRelease(accelerometerSystemClient);
  }
  if (self->_gyroSystemClient)
  {
    IOHIDEventSystemClientUnregisterEventCallback();
    MEMORY[0x1BA9C4F80](self->_gyroSystemClient, self->_imuDataQueue);
  }
  gyroService = self->_gyroService;
  if (gyroService) {
    CFRelease(gyroService);
  }
  gyroSystemClient = self->_gyroSystemClient;
  if (gyroSystemClient) {
    CFRelease(gyroSystemClient);
  }
  v11.receiver = self;
  v11.super_class = (Class)ARIOMotionSensor;
  [(ARIOMotionSensor *)&v11 dealloc];
}

- (unint64_t)providedDataTypes
{
  return 6;
}

- (int64_t)preferredSampleRate
{
  return +[ARKitUserDefaults integerForKey:@"com.apple.arkit.motionSensor.sampleRate"];
}

- (void)start
{
  uint64_t v3 = [(ARIOMotionSensor *)self preferredSampleRate];
  accelerometerService = self->_accelerometerService;
  if (accelerometerService && self->_gyroService)
  {
    uint64_t v5 = (1000000.0 / (double)v3);
    v6 = [NSNumber numberWithInt:v5];
    IOHIDServiceClientSetProperty(accelerometerService, @"ReportInterval", v6);

    gyroService = self->_gyroService;
    v8 = [NSNumber numberWithInt:v5];
    IOHIDServiceClientSetProperty(gyroService, @"ReportInterval", v8);

    uint64_t v9 = self->_accelerometerService;
    v10 = [NSNumber numberWithInt:1];
    IOHIDServiceClientSetProperty(v9, @"BatchInterval", v10);

    objc_super v11 = self->_gyroService;
    id v12 = [NSNumber numberWithInt:1];
    IOHIDServiceClientSetProperty(v11, @"BatchInterval", v12);
  }
}

- (void)stop
{
  accelerometerService = self->_accelerometerService;
  if (accelerometerService && self->_gyroService)
  {
    v4 = [NSNumber numberWithInt:0];
    IOHIDServiceClientSetProperty(accelerometerService, @"ReportInterval", v4);

    gyroService = self->_gyroService;
    v6 = [NSNumber numberWithInt:0];
    IOHIDServiceClientSetProperty(gyroService, @"ReportInterval", v6);

    uint64_t v7 = self->_accelerometerService;
    v8 = [NSNumber numberWithInt:0];
    IOHIDServiceClientSetProperty(v7, @"BatchInterval", v8);

    uint64_t v9 = self->_gyroService;
    id v10 = [NSNumber numberWithInt:0];
    IOHIDServiceClientSetProperty(v9, @"BatchInterval", v10);
  }
}

- (void)waitForOutstandingCallbacks
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_imuDataQueue);
  imuDataQueue = self->_imuDataQueue;
  dispatch_sync(imuDataQueue, &__block_literal_global_21);
}

- (void)accelerometerDidOutputEvent:(__IOHIDEvent *)a3 timestamp:(double)a4
{
  kdebug_trace();
  [(ARAccelerometerData *)self->_currentAccelerometerData setTimestamp:a4];
  IOHIDEventGetFloatValue();
  double v7 = v6;
  IOHIDEventGetFloatValue();
  double v9 = v8;
  IOHIDEventGetFloatValue();
  -[ARAccelerometerData setAcceleration:](self->_currentAccelerometerData, "setAcceleration:", v7, v9, v10);
  CFDictionaryRef v11 = (const __CFDictionary *)IOHIDServiceClientCopyProperty(self->_accelerometerService, @"AppleVoltageDictionary");
  if (v11)
  {
    CFDictionaryRef v12 = v11;
    CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(v11, @"ACCEL_TEMP");
    if (Value)
    {
      uint64_t valuePtr = 0;
      CFNumberGetValue(Value, kCFNumberLongType, &valuePtr);
      if (valuePtr != 21474836) {
        [(ARAccelerometerData *)self->_currentAccelerometerData setTemperature:(float)((float)valuePtr / 100.0)];
      }
    }
    CFRelease(v12);
  }
  __int16 v14 = [(ARIOMotionSensor *)self delegate];
  [v14 sensor:self didOutputSensorData:self->_currentAccelerometerData];

  kdebug_trace();
}

- (void)gyroscopeDidOutputEvent:(__IOHIDEvent *)a3 timestamp:(double)a4
{
  kdebug_trace();
  [(ARGyroscopeData *)self->_currentGyroData setTimestamp:a4];
  IOHIDEventGetFloatValue();
  double v7 = v6;
  IOHIDEventGetFloatValue();
  double v9 = v8;
  IOHIDEventGetFloatValue();
  -[ARGyroscopeData setRotationRate:](self->_currentGyroData, "setRotationRate:", v7, v9, v10);
  CFDictionaryRef v11 = [(ARIOMotionSensor *)self delegate];
  [v11 sensor:self didOutputSensorData:self->_currentGyroData];

  kdebug_trace();
}

- (ARSensorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ARSensorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentAccelerometerData, 0);
  objc_storeStrong((id *)&self->_currentGyroData, 0);
  objc_storeStrong((id *)&self->_imuDataQueue, 0);
  objc_storeStrong((id *)&self->_location, 0);
}

@end