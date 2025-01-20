@interface NTKSnowglobeMotionManager
+ (id)sharedInstance;
- ($1AB5FA073B851C12C2339EC22442E995)rotationRate;
- ($1AB5FA073B851C12C2339EC22442E995)userAcceleration;
- (NTKSnowglobeMotionManager)init;
- (id)acquireToken;
- (void)_invalidateToken;
- (void)pause;
- (void)resume;
@end

@implementation NTKSnowglobeMotionManager

+ (id)sharedInstance
{
  if (qword_1EA8FCEB8 != -1) {
    dispatch_once(&qword_1EA8FCEB8, &unk_1F3527EB8);
  }
  v2 = (void *)qword_1EA8FCEB0;

  return v2;
}

- (NTKSnowglobeMotionManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)NTKSnowglobeMotionManager;
  v2 = [(NTKSnowglobeMotionManager *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    motionManager = v2->_motionManager;
    v2->_motionManager = (CMMotionManager *)v3;

    [(CMMotionManager *)v2->_motionManager setDeviceMotionUpdateInterval:0.0333333351];
  }
  return v2;
}

- (void)resume
{
  obj = self;
  objc_sync_enter(obj);
  if (obj->_running)
  {
    objc_sync_exit(obj);
  }
  else
  {
    obj->_running = 1;
    v2 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1DAFDF000, v2, OS_LOG_TYPE_DEFAULT, "Resuming motion input", (uint8_t *)buf, 2u);
    }

    objc_sync_exit(obj);
    objc_initWeak(buf, obj);
    motionManager = obj->_motionManager;
    v4 = [MEMORY[0x1E4F28F08] mainQueue];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = sub_1DAFE15A0;
    v6[3] = &unk_1E6BE4CF8;
    objc_copyWeak(&v7, buf);
    [(CMMotionManager *)motionManager startDeviceMotionUpdatesToQueue:v4 withHandler:v6];

    objc_destroyWeak(&v7);
    objc_destroyWeak(buf);
  }
}

- (void)pause
{
  obj = self;
  objc_sync_enter(obj);
  if (obj->_running)
  {
    obj->_running = 0;
    v2 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DAFDF000, v2, OS_LOG_TYPE_DEFAULT, "Pausing motion input", buf, 2u);
    }

    objc_sync_exit(obj);
    [(CMMotionManager *)obj->_motionManager stopDeviceMotionUpdates];
    obj->_userAcceleration.z = 0.0;
    obj->_rotationRate.x = 0.0;
    obj->_userAcceleration.x = 0.0;
    obj->_userAcceleration.y = 0.0;
    obj->_rotationRate.y = 0.0;
    obj->_rotationRate.z = 0.0;
  }
  else
  {
    objc_sync_exit(obj);
  }
}

- (id)acquireToken
{
  v2 = self;
  objc_sync_enter(v2);
  ++v2->_activeTokens;
  [(NTKSnowglobeMotionManager *)v2 resume];
  objc_sync_exit(v2);

  uint64_t v3 = [[NTKSnowglobeMotionToken alloc] initWithMotionManager:v2];

  return v3;
}

- (void)_invalidateToken
{
  obj = self;
  objc_sync_enter(obj);
  uint64_t v2 = obj->_activeTokens - 1;
  obj->_activeTokens = v2;
  if (!v2) {
    [(NTKSnowglobeMotionManager *)obj pause];
  }
  objc_sync_exit(obj);
}

- ($1AB5FA073B851C12C2339EC22442E995)userAcceleration
{
  objc_copyStruct(dest, &self->_userAcceleration, 24, 1, 0);
  double v2 = *(double *)dest;
  double v3 = *(double *)&dest[1];
  double v4 = *(double *)&dest[2];
  result.var2 = v4;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- ($1AB5FA073B851C12C2339EC22442E995)rotationRate
{
  objc_copyStruct(dest, &self->_rotationRate, 24, 1, 0);
  double v2 = *(double *)dest;
  double v3 = *(double *)&dest[1];
  double v4 = *(double *)&dest[2];
  result.var2 = v4;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (void).cxx_destruct
{
}

@end