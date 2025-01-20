@interface CMAudioAccessoryManagerInternal
- (CMAudioAccessoryManagerInternal)init;
- (id).cxx_construct;
@end

@implementation CMAudioAccessoryManagerInternal

- (CMAudioAccessoryManagerInternal)init
{
  v6.receiver = self;
  v6.super_class = (Class)CMAudioAccessoryManagerInternal;
  v2 = [(CMAudioAccessoryManagerInternal *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->fSampleLock._os_unfair_lock_opaque = 0;
    v2->fAudioAccessoryAccelerometerDispatcher = 0;
    v2->fAudioAccessoryAccelerometerUpdateInterval = 0.02;
    v2->fAudioAccessoryAccelerometerHandler = 0;
    v2->fAudioAccessoryAccelerometerQueue = 0;
    v2->fLatestAudioAccessoryAccelerometerSample.timestamp = -1.0;
    v2->fAudioAccessoryGyroDispatcher = 0;
    v2->fAudioAccessoryGyroUpdateInterval = 0.02;
    v2->fAudioAccessoryGyroHandler = 0;
    v2->fAudioAccessoryGyroQueue = 0;
    v2->fLatestAudioAccessoryGyroSample.timestamp = -1.0;
    v2->fAudioAccessoryMagnetometerDispatcher = 0;
    v2->fAudioAccessoryMagnetometerUpdateInterval = 0.02;
    v2->fAudioAccessoryMagnetometerHandler = 0;
    v2->fAudioAccessoryMagnetometerQueue = 0;
    v2->fLatestAudioAccessoryMagnetometerSample.timestamp = -1.0;
    v2->fAudioAccessoryDeviceMotionDispatcher = 0;
    v2->fAudioAccessoryDeviceMotionConfigDispatcher = 0;
    v2->fAudioAccessoryDeviceMotionHandler = 0;
    v2->fAudioAccessoryDeviceMotionQueue = 0;
    v2->fAudioAccessoryDeviceMotionUpdateInterval = 0.02;
    v2->fAudioAccessoryDeviceMotionStatusDispatcher = 0;
    v2->fAudioAccessoryDeviceMotionStatusHandler = 0;
    value = v2->fAudioAccessoryActivityDispatcher.__ptr_.__value_;
    v3->fAudioAccessoryDeviceMotionStatusQueue = 0;
    v3->fAudioAccessoryActivityDispatcher.__ptr_.__value_ = 0;
    if (value) {
      (*((void (**)(Dispatcher *))value->var0 + 1))(value);
    }
    v3->fAudioAccessoryActivityUpdateInterval = 0.2;
    *(_OWORD *)&v3->fAudioAccessoryActivityHandler = 0u;
    *(_OWORD *)&v3->fAudioAccessoryHeartRateDispatcher = 0u;
    *(_OWORD *)&v3->fAudioAccessoryHeartRateHandler = 0u;
    v3->fLatestAudioAccessoryHeartRateSample.timestamp = -1.0;
    v3->fAudioAccessoryPPGDispatcher = 0;
    v3->fAudioAccessoryPPGHandler = 0;
    v3->fAudioAccessoryPPGQueue = 0;
    v3->fLatestAudioAccessoryPPGSample.timestamp = -1.0;
  }
  return v3;
}

- (void).cxx_destruct
{
  value = self->fAudioAccessoryActivityDispatcher.__ptr_.__value_;
  self->fAudioAccessoryActivityDispatcher.__ptr_.__value_ = 0;
  if (value) {
    (*((void (**)(void))value->var0 + 1))();
  }
}

- (id).cxx_construct
{
  *((void *)self + 34) = 0;
  *((void *)self + 35) = 0x3F80000000000000;
  *((void *)self + 39) = 0;
  return self;
}

@end