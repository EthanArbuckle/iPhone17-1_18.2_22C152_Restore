@interface ARBKSAccelerometer
+ (id)sharedAccelerometerHandle;
+ (id)sharedWeakAccelerometerHandle;
- (id)initPrivate;
- (int64_t)currentOrientation;
- (int64_t)rawOrientation;
- (void)dealloc;
@end

@implementation ARBKSAccelerometer

+ (id)sharedAccelerometerHandle
{
  if (sharedAccelerometerHandle_onceToken != -1) {
    dispatch_once(&sharedAccelerometerHandle_onceToken, &__block_literal_global_112);
  }
  dispatch_semaphore_wait((dispatch_semaphore_t)sharedAccelerometerHandle_semaphore, 0xFFFFFFFFFFFFFFFFLL);
  id WeakRetained = objc_loadWeakRetained(&sharedAccelerometer);
  if (!WeakRetained)
  {
    id WeakRetained = [[ARBKSAccelerometer alloc] initPrivate];
    objc_storeWeak(&sharedAccelerometer, WeakRetained);
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)sharedAccelerometerHandle_semaphore);
  return WeakRetained;
}

void __47__ARBKSAccelerometer_sharedAccelerometerHandle__block_invoke()
{
  dispatch_semaphore_t v0 = dispatch_semaphore_create(1);
  v1 = (void *)sharedAccelerometerHandle_semaphore;
  sharedAccelerometerHandle_semaphore = (uint64_t)v0;
}

- (id)initPrivate
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)ARBKSAccelerometer;
  v2 = [(ARBKSAccelerometer *)&v9 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    accelerometer = v2->_accelerometer;
    v2->_accelerometer = (BKSAccelerometer *)v3;

    [(BKSAccelerometer *)v2->_accelerometer setPassiveOrientationEvents:0];
    [(BKSAccelerometer *)v2->_accelerometer setOrientationEventsEnabled:1];
    v2->_lastValidDeviceOrientation = 3;
    v5 = _ARLogGeneral_40();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v6 = (objc_class *)objc_opt_class();
      v7 = NSStringFromClass(v6);
      *(_DWORD *)buf = 138543618;
      v11 = v7;
      __int16 v12 = 2048;
      v13 = v2;
      _os_log_impl(&dword_1B88A2000, v5, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: init", buf, 0x16u);
    }
  }
  return v2;
}

+ (id)sharedWeakAccelerometerHandle
{
  id WeakRetained = objc_loadWeakRetained(&sharedAccelerometer);
  return WeakRetained;
}

- (void)dealloc
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  [(BKSAccelerometer *)self->_accelerometer setOrientationEventsEnabled:0];
  uint64_t v3 = _ARLogGeneral_40();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    *(_DWORD *)buf = 138543618;
    v8 = v5;
    __int16 v9 = 2048;
    v10 = self;
    _os_log_impl(&dword_1B88A2000, v3, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: dealloc", buf, 0x16u);
  }
  v6.receiver = self;
  v6.super_class = (Class)ARBKSAccelerometer;
  [(ARBKSAccelerometer *)&v6 dealloc];
}

- (int64_t)currentOrientation
{
  int64_t v3 = [(ARBKSAccelerometer *)self rawOrientation];
  if ((unint64_t)(v3 - 1) > 3)
  {
    kdebug_trace();
    return self->_lastValidDeviceOrientation;
  }
  else
  {
    int64_t v4 = v3;
    self->_lastValidDeviceOrientation = v3;
    kdebug_trace();
  }
  return v4;
}

- (int64_t)rawOrientation
{
  return [(BKSAccelerometer *)self->_accelerometer currentDeviceOrientation];
}

- (void).cxx_destruct
{
}

@end