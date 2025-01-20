@interface CMAudioAccessoryManager
+ (BOOL)_isAvailable;
+ (BOOL)_selectActiveAudioRouteForAccelerometerWithBTAddress:(id)a3 modelID:(id)a4;
+ (BOOL)_selectActiveAudioRouteForDeviceMotionWithBTAddress:(id)a3 modelID:(id)a4;
+ (BOOL)_selectActiveAudioRouteForGyroWithBTAddress:(id)a3 modelID:(id)a4;
+ (BOOL)_selectActiveAudioRouteForHeartRateWithBTAddress:(id)a3 modelID:(id)a4;
+ (BOOL)_selectActiveAudioRouteForMagnetometerWithBTAddress:(id)a3 modelID:(id)a4;
+ (BOOL)_selectActiveAudioRouteForPPGWithBTAddress:(id)a3 modelID:(id)a4;
+ (BOOL)_selectActiveAudioRouteWithBTAddress:(id)a3 modelID:(id)a4;
- (BOOL)_isAudioAccessoryAccelerometerAvailable;
- (BOOL)_isAudioAccessoryActivityAvailable;
- (BOOL)_isAudioAccessoryDeviceMotionAvailable;
- (BOOL)_isAudioAccessoryGyroAvailable;
- (BOOL)_isAudioAccessoryHeartRateAvailable;
- (BOOL)_isAudioAccessoryMagnetometerAvailable;
- (BOOL)_isAudioAccessoryPPGAvailable;
- (CMAudioAccessoryManager)init;
- (double)_audioAccessoryAccelerometerUpdateInterval;
- (double)_audioAccessoryActivityUpdateInterval;
- (double)_audioAccessoryDeviceMotionUpdateInterval;
- (double)_audioAccessoryGyroUpdateInterval;
- (double)_audioAccessoryHeartRateUpdateInterval;
- (double)_audioAccessoryMagnetometerUpdateInterval;
- (id).cxx_construct;
- (id)_audioAccessoryAccelerometerData;
- (id)_audioAccessoryGyroData;
- (id)_audioAccessoryMagnetometerData;
- (id)initPrivate;
- (void)_isAudioAccessoryAccelerometerAvailablePrivate;
- (void)_isAudioAccessoryActivityAvailablePrivate;
- (void)_isAudioAccessoryDeviceMotionAvailablePrivate;
- (void)_isAudioAccessoryGyroAvailablePrivate;
- (void)_isAudioAccessoryHeartRateAvailablePrivate;
- (void)_isAudioAccessoryMagnetometerAvailablePrivate;
- (void)_isAudioAccessoryPPGAvailablePrivate;
- (void)_setAudioAccessoryAccelerometerUpdateInterval:(double)a3;
- (void)_setAudioAccessoryAccelerometerUpdateIntervalPrivate:(double)a3;
- (void)_setAudioAccessoryActivityUpdateInterval:(double)a3;
- (void)_setAudioAccessoryActivityUpdateIntervalPrivate:(double)a3;
- (void)_setAudioAccessoryDeviceMotionUpdateInterval:(double)a3;
- (void)_setAudioAccessoryDeviceMotionUpdateIntervalPrivate:(double)a3;
- (void)_setAudioAccessoryGyroUpdateInterval:(double)a3;
- (void)_setAudioAccessoryGyroUpdateIntervalPrivate:(double)a3;
- (void)_setAudioAccessoryHeartRateUpdateInterval:(double)a3;
- (void)_setAudioAccessoryHeartRateUpdateIntervalPrivate:(double)a3;
- (void)_setAudioAccessoryMagnetometerUpdateInterval:(double)a3;
- (void)_setAudioAccessoryMagnetometerUpdateIntervalPrivate:(double)a3;
- (void)_startAudioAccessoryAccelerometerUpdatesPrivateToQueue:(id)a3 withHandler:(id)a4;
- (void)_startAudioAccessoryAccelerometerUpdatesToQueue:(id)a3 withHandler:(id)a4;
- (void)_startAudioAccessoryActivityUpdatesPrivate:(id)a3 withHandler:(id)a4;
- (void)_startAudioAccessoryActivityUpdatesToQueue:(id)a3 withHandler:(id)a4;
- (void)_startAudioAccessoryDeviceMotionStatusUpdatesPrivate:(id)a3 withHandler:(id)a4;
- (void)_startAudioAccessoryDeviceMotionStatusUpdatesToQueue:(id)a3 withHandler:(id)a4;
- (void)_startAudioAccessoryDeviceMotionUpdatesPrivate:(id)a3 lowLatencyMode:(BOOL)a4 withHandler:(id)a5;
- (void)_startAudioAccessoryDeviceMotionUpdatesToQueue:(id)a3 lowLatencyMode:(BOOL)a4 withHandler:(id)a5;
- (void)_startAudioAccessoryGyroUpdatesPrivateToQueue:(id)a3 withHandler:(id)a4;
- (void)_startAudioAccessoryGyroUpdatesToQueue:(id)a3 withHandler:(id)a4;
- (void)_startAudioAccessoryHeartRateUpdatesPrivateToQueue:(id)a3 withHandler:(id)a4;
- (void)_startAudioAccessoryHeartRateUpdatesToQueue:(id)a3 withHandler:(id)a4;
- (void)_startAudioAccessoryMagnetometerUpdatesPrivateToQueue:(id)a3 withHandler:(id)a4;
- (void)_startAudioAccessoryMagnetometerUpdatesToQueue:(id)a3 withHandler:(id)a4;
- (void)_startAudioAccessoryPPGUpdatesPrivateToQueue:(id)a3 withHandler:(id)a4;
- (void)_startAudioAccessoryPPGUpdatesToQueue:(id)a3 withHandler:(id)a4;
- (void)_stopAudioAccessoryAccelerometerUpdates;
- (void)_stopAudioAccessoryAccelerometerUpdatesPrivate;
- (void)_stopAudioAccessoryActivityUpdates;
- (void)_stopAudioAccessoryActivityUpdatesPrivate;
- (void)_stopAudioAccessoryDeviceMotionStatusUpdates;
- (void)_stopAudioAccessoryDeviceMotionStatusUpdatesPrivate;
- (void)_stopAudioAccessoryDeviceMotionUpdates;
- (void)_stopAudioAccessoryDeviceMotionUpdatesPrivate;
- (void)_stopAudioAccessoryGyroUpdates;
- (void)_stopAudioAccessoryGyroUpdatesPrivate;
- (void)_stopAudioAccessoryHeartRateUpdates;
- (void)_stopAudioAccessoryHeartRateUpdatesPrivate;
- (void)_stopAudioAccessoryMagnetometerUpdates;
- (void)_stopAudioAccessoryMagnetometerUpdatesPrivate;
- (void)_stopAudioAccessoryPPGUpdates;
- (void)_stopAudioAccessoryPPGUpdatesPrivate;
- (void)dealloc;
- (void)deallocPrivate;
- (void)onAudioAccessoryAccelerometer:(const Sample *)a3;
- (void)onAudioAccessoryActivity:(const void *)a3;
- (void)onAudioAccessoryDeviceMotion:(const void *)a3;
- (void)onAudioAccessoryDeviceMotionConfig:(const void *)a3;
- (void)onAudioAccessoryDeviceMotionStatus:(const int *)a3;
- (void)onAudioAccessoryGyro:(const Sample *)a3;
- (void)onAudioAccessoryHeartRate:(const Sample *)a3;
- (void)onAudioAccessoryMagnetometer:(const Sample *)a3;
- (void)onAudioAccessoryPPG:(const Sample *)a3;
@end

@implementation CMAudioAccessoryManager

- (CMAudioAccessoryManager)init
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3052000000;
  v10 = sub_1902DD140;
  v11 = sub_1902DD0A0;
  uint64_t v12 = 0;
  uint64_t v3 = sub_1902D6BD0();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_190506BD8;
  v6[3] = &unk_1E568DDB0;
  v6[4] = self;
  v6[5] = &v7;
  sub_1902CDE98(v3, (uint64_t)v6);
  v4 = (CMAudioAccessoryManager *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (id)initPrivate
{
  v4.receiver = self;
  v4.super_class = (Class)CMAudioAccessoryManager;
  v2 = [(CMAudioAccessoryManager *)&v4 init];
  if (v2) {
    v2->_internal = objc_alloc_init(CMAudioAccessoryManagerInternal);
  }
  return v2;
}

- (void)dealloc
{
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x3052000000;
  v6[3] = sub_1902DD140;
  v6[4] = sub_1902DD0A0;
  v6[5] = self;
  uint64_t v3 = sub_1902D6BD0();
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_190506D60;
  v5[3] = &unk_1E568DDD8;
  v5[4] = v6;
  sub_1902CDE98(v3, (uint64_t)v5);
  v4.receiver = self;
  v4.super_class = (Class)CMAudioAccessoryManager;
  [(CMAudioAccessoryManager *)&v4 dealloc];
  _Block_object_dispose(v6, 8);
}

- (void)deallocPrivate
{
}

+ (BOOL)_isAvailable
{
  return 1;
}

+ (BOOL)_selectActiveAudioRouteForAccelerometerWithBTAddress:(id)a3 modelID:(id)a4
{
  if (qword_1E929EAA8 != -1) {
    dispatch_once(&qword_1E929EAA8, &unk_1EDFD24A0);
  }
  uint64_t v6 = qword_1E929EAA0;

  return sub_1905A1418(v6, a3, a4);
}

+ (BOOL)_selectActiveAudioRouteForGyroWithBTAddress:(id)a3 modelID:(id)a4
{
  if (qword_1E929EAE0 != -1) {
    dispatch_once(&qword_1E929EAE0, &unk_1EDFD2C60);
  }
  uint64_t v6 = qword_1E929EAD8;

  return sub_1905A1418(v6, a3, a4);
}

+ (BOOL)_selectActiveAudioRouteForMagnetometerWithBTAddress:(id)a3 modelID:(id)a4
{
  if (qword_1E929EA38 != -1) {
    dispatch_once(&qword_1E929EA38, &unk_1EDFD1A00);
  }
  uint64_t v6 = qword_1E929EA30;

  return sub_1905A1418(v6, a3, a4);
}

+ (BOOL)_selectActiveAudioRouteForDeviceMotionWithBTAddress:(id)a3 modelID:(id)a4
{
  uint64_t v6 = sub_1905298B4();

  return sub_1905A1418(v6, a3, a4);
}

+ (BOOL)_selectActiveAudioRouteWithBTAddress:(id)a3 modelID:(id)a4
{
  uint64_t v6 = sub_1905298B4();

  return sub_1905A1418(v6, a3, a4);
}

+ (BOOL)_selectActiveAudioRouteForHeartRateWithBTAddress:(id)a3 modelID:(id)a4
{
  if (qword_1E929EA90 != -1) {
    dispatch_once(&qword_1E929EA90, &unk_1EDFD1F20);
  }
  uint64_t v6 = qword_1E929EA88;

  return sub_1905A1418(v6, a3, a4);
}

+ (BOOL)_selectActiveAudioRouteForPPGWithBTAddress:(id)a3 modelID:(id)a4
{
  if (qword_1E929EA48 != -1) {
    dispatch_once(&qword_1E929EA48, &unk_1EDFD1C60);
  }
  uint64_t v6 = qword_1E929EA40;

  return sub_1905A1418(v6, a3, a4);
}

- (void)_setAudioAccessoryAccelerometerUpdateInterval:(double)a3
{
  uint64_t v5 = sub_1902D6BD0();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1905070A8;
  v6[3] = &unk_1E568DB10;
  v6[4] = self;
  *(double *)&v6[5] = a3;
  sub_1902CDE98(v5, (uint64_t)v6);
}

- (double)_audioAccessoryAccelerometerUpdateInterval
{
  return *((double *)self->_internal + 3);
}

- (BOOL)_isAudioAccessoryAccelerometerAvailable
{
  uint64_t v3 = sub_1902D6BD0();
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_190507148;
  v5[3] = &unk_1E568D118;
  v5[4] = self;
  sub_1902CDE98(v3, (uint64_t)v5);
  return *((unsigned char *)self->_internal + 472);
}

- (id)_audioAccessoryAccelerometerData
{
  id internal = self->_internal;
  os_unfair_lock_lock((os_unfair_lock_t)internal + 2);
  double v3 = *((double *)internal + 6);
  int v4 = *((_DWORD *)internal + 14);
  int v5 = *((_DWORD *)internal + 15);
  int v6 = *((_DWORD *)internal + 16);
  os_unfair_lock_unlock((os_unfair_lock_t)internal + 2);
  if (v3 <= 0.0) {
    return 0;
  }
  uint64_t v7 = [CMAccelerometerData alloc];
  LODWORD(v8) = v4;
  LODWORD(v9) = v5;
  LODWORD(v10) = v6;
  v13 = objc_msgSend_initWithAcceleration_andTimestamp_(v7, v11, v12, v8, v9, v10, v3);

  return v13;
}

- (void)_startAudioAccessoryAccelerometerUpdatesToQueue:(id)a3 withHandler:(id)a4
{
  uint64_t v7 = sub_1902D6BD0();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_190507280;
  v8[3] = &unk_1E568D398;
  v8[4] = self;
  v8[5] = a3;
  v8[6] = a4;
  sub_1902CE9BC(v7, (uint64_t)v8);
}

- (void)_stopAudioAccessoryAccelerometerUpdates
{
  uint64_t v3 = sub_1902D6BD0();
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_19050730C;
  v4[3] = &unk_1E568D118;
  v4[4] = self;
  sub_1902CDE98(v3, (uint64_t)v4);
}

- (void)_setAudioAccessoryAccelerometerUpdateIntervalPrivate:(double)a3
{
  id internal = self->_internal;
  if (a3 < 0.005) {
    a3 = 0.005;
  }
  *((double *)internal + 3) = a3;
  if (*((void *)internal + 2))
  {
    if (qword_1E929EAA8 != -1) {
      dispatch_once(&qword_1E929EAA8, &unk_1EDFD24A0);
    }
    uint64_t v4 = qword_1E929EAA0;
    uint64_t v5 = *((void *)internal + 2);
    sub_1904DC320(v4, 0, v5, (uint64_t)internal + 24);
  }
}

- (void)_isAudioAccessoryAccelerometerAvailablePrivate
{
  *((unsigned char *)self->_internal + 472) = 1;
}

- (void)_startAudioAccessoryAccelerometerUpdatesPrivateToQueue:(id)a3 withHandler:(id)a4
{
  id internal = (double *)self->_internal;
  if (objc_msgSend__isAudioAccessoryAccelerometerAvailable(self, a2, (uint64_t)a3) && internal[3] > 0.0)
  {
    id v7 = (id)*((void *)internal + 5);
    if (v7 != a3)
    {

      *((void *)internal + 5) = a3;
    }
    id v8 = (id)*((void *)internal + 4);
    if (v8 != a4)
    {

      *((void *)internal + 4) = objc_msgSend_copy(a4, v9, v10);
    }
    if (!*((void *)internal + 2)) {
      operator new();
    }
  }
}

- (void)_stopAudioAccessoryAccelerometerUpdatesPrivate
{
  id internal = (uint64_t *)self->_internal;
  if (objc_msgSend__isAudioAccessoryAccelerometerAvailable(self, a2, v2))
  {
    if (internal[2])
    {
      if (qword_1E929EAA8 != -1) {
        dispatch_once(&qword_1E929EAA8, &unk_1EDFD24A0);
      }
      sub_1902CDE08(qword_1E929EAA0, 0, internal[2]);
      uint64_t v4 = internal[2];
      if (v4) {
        (*(void (**)(uint64_t))(*(void *)v4 + 8))(v4);
      }
      internal[2] = 0;
    }
    uint64_t v5 = (void *)internal[5];
    if (v5)
    {

      internal[5] = 0;
    }
    int v6 = (void *)internal[4];
    if (v6)
    {

      internal[4] = 0;
    }
  }
}

- (void)_setAudioAccessoryGyroUpdateInterval:(double)a3
{
  uint64_t v5 = sub_1902D6BD0();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_190507674;
  v6[3] = &unk_1E568DB10;
  v6[4] = self;
  *(double *)&v6[5] = a3;
  sub_1902CDE98(v5, (uint64_t)v6);
}

- (double)_audioAccessoryGyroUpdateInterval
{
  return *((double *)self->_internal + 12);
}

- (BOOL)_isAudioAccessoryGyroAvailable
{
  uint64_t v3 = sub_1902D6BD0();
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_190507714;
  v5[3] = &unk_1E568D118;
  v5[4] = self;
  sub_1902CDE98(v3, (uint64_t)v5);
  return *((unsigned char *)self->_internal + 473);
}

- (id)_audioAccessoryGyroData
{
  id internal = self->_internal;
  os_unfair_lock_lock((os_unfair_lock_t)internal + 2);
  double v3 = *((double *)internal + 15);
  int v4 = *((_DWORD *)internal + 32);
  int v5 = *((_DWORD *)internal + 33);
  int v6 = *((_DWORD *)internal + 34);
  os_unfair_lock_unlock((os_unfair_lock_t)internal + 2);
  if (v3 <= 0.0) {
    return 0;
  }
  id v7 = [CMGyroData alloc];
  LODWORD(v8) = v4;
  LODWORD(v9) = v5;
  LODWORD(v10) = v6;
  v13 = objc_msgSend_initWithRotationRate_andTimestamp_(v7, v11, v12, v8, v9, v10, v3);

  return v13;
}

- (void)_startAudioAccessoryGyroUpdatesToQueue:(id)a3 withHandler:(id)a4
{
  uint64_t v7 = sub_1902D6BD0();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_19050784C;
  v8[3] = &unk_1E568D398;
  v8[4] = self;
  v8[5] = a3;
  v8[6] = a4;
  sub_1902CE9BC(v7, (uint64_t)v8);
}

- (void)_stopAudioAccessoryGyroUpdates
{
  uint64_t v3 = sub_1902D6BD0();
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_1905078D8;
  v4[3] = &unk_1E568D118;
  v4[4] = self;
  sub_1902CDE98(v3, (uint64_t)v4);
}

- (void)_setAudioAccessoryGyroUpdateIntervalPrivate:(double)a3
{
  id internal = self->_internal;
  if (a3 < 0.005) {
    a3 = 0.005;
  }
  *((double *)internal + 12) = a3;
  if (*((void *)internal + 11))
  {
    if (qword_1E929EAE0 != -1) {
      dispatch_once(&qword_1E929EAE0, &unk_1EDFD2C60);
    }
    uint64_t v4 = qword_1E929EAD8;
    uint64_t v5 = *((void *)internal + 11);
    sub_1904DC320(v4, 0, v5, (uint64_t)internal + 96);
  }
}

- (void)_isAudioAccessoryGyroAvailablePrivate
{
  *((unsigned char *)self->_internal + 473) = 1;
}

- (void)_startAudioAccessoryGyroUpdatesPrivateToQueue:(id)a3 withHandler:(id)a4
{
  id internal = (double *)self->_internal;
  if (objc_msgSend__isAudioAccessoryGyroAvailable(self, a2, (uint64_t)a3) && internal[12] > 0.0)
  {
    id v7 = (id)*((void *)internal + 14);
    if (v7 != a3)
    {

      *((void *)internal + 14) = a3;
    }
    id v8 = (id)*((void *)internal + 13);
    if (v8 != a4)
    {

      *((void *)internal + 13) = objc_msgSend_copy(a4, v9, v10);
    }
    if (!*((void *)internal + 11)) {
      operator new();
    }
  }
}

- (void)_stopAudioAccessoryGyroUpdatesPrivate
{
  id internal = (uint64_t *)self->_internal;
  if (objc_msgSend__isAudioAccessoryGyroAvailable(self, a2, v2))
  {
    if (internal[11])
    {
      if (qword_1E929EAE0 != -1) {
        dispatch_once(&qword_1E929EAE0, &unk_1EDFD2C60);
      }
      sub_1902CDE08(qword_1E929EAD8, 0, internal[11]);
      uint64_t v4 = internal[11];
      if (v4) {
        (*(void (**)(uint64_t))(*(void *)v4 + 8))(v4);
      }
      internal[11] = 0;
    }
    uint64_t v5 = (void *)internal[14];
    if (v5)
    {

      internal[14] = 0;
    }
    int v6 = (void *)internal[13];
    if (v6)
    {

      internal[13] = 0;
    }
  }
}

- (void)_setAudioAccessoryMagnetometerUpdateInterval:(double)a3
{
  uint64_t v5 = sub_1902D6BD0();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_190507C40;
  v6[3] = &unk_1E568DB10;
  v6[4] = self;
  *(double *)&v6[5] = a3;
  sub_1902CDE98(v5, (uint64_t)v6);
}

- (double)_audioAccessoryMagnetometerUpdateInterval
{
  return *((double *)self->_internal + 21);
}

- (BOOL)_isAudioAccessoryMagnetometerAvailable
{
  uint64_t v3 = sub_1902D6BD0();
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_190507CE0;
  v5[3] = &unk_1E568D118;
  v5[4] = self;
  sub_1902CDE98(v3, (uint64_t)v5);
  return *((unsigned char *)self->_internal + 474);
}

- (id)_audioAccessoryMagnetometerData
{
  id internal = self->_internal;
  os_unfair_lock_lock((os_unfair_lock_t)internal + 2);
  double v3 = *((double *)internal + 24);
  int v4 = *((_DWORD *)internal + 50);
  int v5 = *((_DWORD *)internal + 51);
  int v6 = *((_DWORD *)internal + 52);
  os_unfair_lock_unlock((os_unfair_lock_t)internal + 2);
  if (v3 <= 0.0) {
    return 0;
  }
  id v7 = [CMMagnetometerData alloc];
  LODWORD(v8) = v4;
  LODWORD(v9) = v5;
  LODWORD(v10) = v6;
  v13 = objc_msgSend_initWithMagneticField_andTimestamp_(v7, v11, v12, v8, v9, v10, v3);

  return v13;
}

- (void)_startAudioAccessoryMagnetometerUpdatesToQueue:(id)a3 withHandler:(id)a4
{
  uint64_t v7 = sub_1902D6BD0();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_190507E18;
  v8[3] = &unk_1E568D398;
  v8[4] = self;
  v8[5] = a3;
  v8[6] = a4;
  sub_1902CE9BC(v7, (uint64_t)v8);
}

- (void)_stopAudioAccessoryMagnetometerUpdates
{
  uint64_t v3 = sub_1902D6BD0();
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_190507EA4;
  v4[3] = &unk_1E568D118;
  v4[4] = self;
  sub_1902CDE98(v3, (uint64_t)v4);
}

- (void)_setAudioAccessoryMagnetometerUpdateIntervalPrivate:(double)a3
{
  id internal = self->_internal;
  if (a3 < 0.005) {
    a3 = 0.005;
  }
  *((double *)internal + 21) = a3;
  if (*((void *)internal + 20))
  {
    if (qword_1E929EA38 != -1) {
      dispatch_once(&qword_1E929EA38, &unk_1EDFD1A00);
    }
    uint64_t v4 = qword_1E929EA30;
    uint64_t v5 = *((void *)internal + 20);
    sub_1904DC320(v4, 0, v5, (uint64_t)internal + 168);
  }
}

- (void)_isAudioAccessoryMagnetometerAvailablePrivate
{
  *((unsigned char *)self->_internal + 474) = 1;
}

- (void)_startAudioAccessoryMagnetometerUpdatesPrivateToQueue:(id)a3 withHandler:(id)a4
{
  id internal = (double *)self->_internal;
  if (objc_msgSend__isAudioAccessoryMagnetometerAvailable(self, a2, (uint64_t)a3) && internal[21] > 0.0)
  {
    id v7 = (id)*((void *)internal + 23);
    if (v7 != a3)
    {

      *((void *)internal + 23) = a3;
    }
    id v8 = (id)*((void *)internal + 22);
    if (v8 != a4)
    {

      *((void *)internal + 22) = objc_msgSend_copy(a4, v9, v10);
    }
    if (!*((void *)internal + 20)) {
      operator new();
    }
  }
}

- (void)_stopAudioAccessoryMagnetometerUpdatesPrivate
{
  id internal = (uint64_t *)self->_internal;
  if (objc_msgSend__isAudioAccessoryMagnetometerAvailable(self, a2, v2))
  {
    if (internal[20])
    {
      if (qword_1E929EA38 != -1) {
        dispatch_once(&qword_1E929EA38, &unk_1EDFD1A00);
      }
      sub_1902CDE08(qword_1E929EA30, 0, internal[20]);
      uint64_t v4 = internal[20];
      if (v4) {
        (*(void (**)(uint64_t))(*(void *)v4 + 8))(v4);
      }
      internal[20] = 0;
    }
    uint64_t v5 = (void *)internal[23];
    if (v5)
    {

      internal[23] = 0;
    }
    int v6 = (void *)internal[22];
    if (v6)
    {

      internal[22] = 0;
    }
  }
}

- (BOOL)_isAudioAccessoryDeviceMotionAvailable
{
  uint64_t v3 = sub_1902D6BD0();
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_190508204;
  v5[3] = &unk_1E568D118;
  v5[4] = self;
  sub_1902CDE98(v3, (uint64_t)v5);
  return *((unsigned char *)self->_internal + 475);
}

- (void)_setAudioAccessoryDeviceMotionUpdateInterval:(double)a3
{
  uint64_t v5 = sub_1902D6BD0();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_190508298;
  v6[3] = &unk_1E568DB10;
  v6[4] = self;
  *(double *)&v6[5] = a3;
  sub_1902CDE98(v5, (uint64_t)v6);
}

- (double)_audioAccessoryDeviceMotionUpdateInterval
{
  return *((double *)self->_internal + 31);
}

- (void)_startAudioAccessoryDeviceMotionUpdatesToQueue:(id)a3 lowLatencyMode:(BOOL)a4 withHandler:(id)a5
{
  uint64_t v9 = sub_1902D6BD0();
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_19050834C;
  v10[3] = &unk_1E568E668;
  v10[4] = self;
  v10[5] = a3;
  BOOL v11 = a4;
  v10[6] = a5;
  sub_1902CE9BC(v9, (uint64_t)v10);
}

- (void)_stopAudioAccessoryDeviceMotionUpdates
{
  uint64_t v3 = sub_1902D6BD0();
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_1905087AC;
  v4[3] = &unk_1E568D118;
  v4[4] = self;
  sub_1902CDE98(v3, (uint64_t)v4);
}

- (void)_startAudioAccessoryDeviceMotionStatusUpdatesToQueue:(id)a3 withHandler:(id)a4
{
  uint64_t v7 = sub_1902D6BD0();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_190508844;
  v8[3] = &unk_1E568D398;
  v8[4] = self;
  v8[5] = a3;
  v8[6] = a4;
  sub_1902CE9BC(v7, (uint64_t)v8);
}

- (void)_stopAudioAccessoryDeviceMotionStatusUpdates
{
  uint64_t v3 = sub_1902D6BD0();
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_1905088D0;
  v4[3] = &unk_1E568D118;
  v4[4] = self;
  sub_1902CDE98(v3, (uint64_t)v4);
}

- (void)_setAudioAccessoryDeviceMotionUpdateIntervalPrivate:(double)a3
{
  id internal = self->_internal;
  if (a3 < 0.005) {
    a3 = 0.005;
  }
  *((double *)internal + 31) = a3;
  if (*((void *)internal + 29))
  {
    uint64_t v4 = sub_1905298B4();
    uint64_t v5 = *((void *)internal + 29);
    sub_1904DC320(v4, 0, v5, (uint64_t)internal + 248);
  }
}

- (void)_isAudioAccessoryDeviceMotionAvailablePrivate
{
  *((unsigned char *)self->_internal + 475) = 1;
}

- (void)_startAudioAccessoryDeviceMotionUpdatesPrivate:(id)a3 lowLatencyMode:(BOOL)a4 withHandler:(id)a5
{
  id internal = (double *)self->_internal;
  if (objc_msgSend__isAudioAccessoryDeviceMotionAvailable(self, a2, (uint64_t)a3) && internal[31] > 0.0)
  {
    id v9 = (id)*((void *)internal + 33);
    if (v9 != a3)
    {

      *((void *)internal + 33) = a3;
    }
    id v10 = (id)*((void *)internal + 32);
    if (v10 != a5)
    {

      *((void *)internal + 32) = objc_msgSend_copy(a5, v11, v12);
    }
    if (!*((void *)internal + 30)) {
      operator new();
    }
    if (!*((void *)internal + 29))
    {
      *(unsigned char *)(sub_1905298B4() + 28) = a4;
      operator new();
    }
  }
}

- (void)_stopAudioAccessoryDeviceMotionUpdatesPrivate
{
  id internal = (uint64_t *)self->_internal;
  if (objc_msgSend__isAudioAccessoryDeviceMotionAvailable(self, a2, v2))
  {
    if (internal[29])
    {
      uint64_t v4 = sub_1905298B4();
      sub_1902CDE08(v4, 0, internal[29]);
      uint64_t v5 = internal[29];
      if (v5) {
        (*(void (**)(uint64_t))(*(void *)v5 + 8))(v5);
      }
      internal[29] = 0;
    }
    if (internal[30])
    {
      uint64_t v6 = sub_1905298B4();
      sub_1902CDE08(v6, 1, internal[30]);
      uint64_t v7 = internal[30];
      if (v7) {
        (*(void (**)(uint64_t))(*(void *)v7 + 8))(v7);
      }
      internal[30] = 0;
    }
    id v8 = (void *)internal[33];
    if (v8)
    {

      internal[33] = 0;
    }
    id v9 = (void *)internal[32];
    if (v9)
    {

      internal[32] = 0;
    }
  }
}

- (void)_startAudioAccessoryDeviceMotionStatusUpdatesPrivate:(id)a3 withHandler:(id)a4
{
  id internal = self->_internal;
  if (objc_msgSend__isAudioAccessoryDeviceMotionAvailable(self, a2, (uint64_t)a3))
  {
    id v8 = (id)internal[38];
    if (v8 != a3)
    {

      internal[38] = a3;
    }
    id v9 = (id)internal[37];
    if (v9 != a4)
    {

      internal[37] = objc_msgSend_copy(a4, v10, v11);
    }
    if (!internal[36])
    {
      uint64_t v12 = sub_1905298B4();
      BOOL v14 = sub_1905A11A4(v12);
      objc_msgSend_onAudioAccessoryDeviceMotionStatus_(self, v13, (uint64_t)&v14);
      operator new();
    }
  }
}

- (void)_stopAudioAccessoryDeviceMotionStatusUpdatesPrivate
{
  id internal = (uint64_t *)self->_internal;
  if (objc_msgSend__isAudioAccessoryDeviceMotionAvailable(self, a2, v2))
  {
    if (internal[36])
    {
      uint64_t v4 = sub_1905298B4();
      sub_1902CDE08(v4, 2, internal[36]);
      uint64_t v5 = internal[36];
      if (v5) {
        (*(void (**)(uint64_t))(*(void *)v5 + 8))(v5);
      }
      internal[36] = 0;
    }
    uint64_t v6 = (void *)internal[38];
    if (v6)
    {

      internal[38] = 0;
    }
    uint64_t v7 = (void *)internal[37];
    if (v7)
    {

      internal[37] = 0;
    }
  }
}

- (BOOL)_isAudioAccessoryActivityAvailable
{
  uint64_t v3 = sub_1902D6BD0();
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_190508E64;
  v5[3] = &unk_1E568D118;
  v5[4] = self;
  sub_1902CDE98(v3, (uint64_t)v5);
  return *((unsigned char *)self->_internal + 476);
}

- (void)_setAudioAccessoryActivityUpdateInterval:(double)a3
{
  uint64_t v5 = sub_1902D6BD0();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_190508EF8;
  v6[3] = &unk_1E568DB10;
  v6[4] = self;
  *(double *)&v6[5] = a3;
  sub_1902CDE98(v5, (uint64_t)v6);
}

- (double)_audioAccessoryActivityUpdateInterval
{
  return *((double *)self->_internal + 31);
}

- (void)_startAudioAccessoryActivityUpdatesToQueue:(id)a3 withHandler:(id)a4
{
  uint64_t v7 = sub_1902D6BD0();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_190508FA4;
  v8[3] = &unk_1E568D398;
  v8[4] = self;
  v8[5] = a3;
  v8[6] = a4;
  sub_1902CDE98(v7, (uint64_t)v8);
}

- (void)_stopAudioAccessoryActivityUpdates
{
  uint64_t v3 = sub_1902D6BD0();
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_190509030;
  v4[3] = &unk_1E568D118;
  v4[4] = self;
  sub_1902CDE98(v3, (uint64_t)v4);
}

- (void)_setAudioAccessoryActivityUpdateIntervalPrivate:(double)a3
{
  id internal = self->_internal;
  if (a3 < 0.005) {
    a3 = 0.005;
  }
  *((double *)internal + 40) = a3;
  if (*((void *)internal + 39))
  {
    uint64_t v4 = sub_1905298B4();
    uint64_t v5 = *((void *)internal + 39);
    sub_1904DC320(v4, 0, v5, (uint64_t)internal + 320);
  }
}

- (void)_isAudioAccessoryActivityAvailablePrivate
{
  *((unsigned char *)self->_internal + 476) = 1;
}

- (void)_startAudioAccessoryActivityUpdatesPrivate:(id)a3 withHandler:(id)a4
{
  id internal = (double *)self->_internal;
  if (objc_msgSend__isAudioAccessoryActivityAvailable(self, a2, (uint64_t)a3) && internal[40] > 0.0)
  {
    id v7 = (id)*((void *)internal + 42);
    if (v7 != a3)
    {

      *((void *)internal + 42) = a3;
    }
    id v8 = (id)*((void *)internal + 41);
    if (v8 != a4)
    {

      *((void *)internal + 41) = objc_msgSend_copy(a4, v9, v10);
    }
    if (!*((void *)internal + 39)) {
      operator new();
    }
  }
}

- (void)_stopAudioAccessoryActivityUpdatesPrivate
{
  id internal = (uint64_t *)self->_internal;
  if (objc_msgSend__isAudioAccessoryActivityAvailable(self, a2, v2))
  {
    if (internal[39])
    {
      uint64_t v4 = sub_1905298B4();
      sub_1902CDE08(v4, 0, internal[39]);
      uint64_t v5 = internal[39];
      internal[39] = 0;
      if (v5) {
        (*(void (**)(uint64_t))(*(void *)v5 + 8))(v5);
      }
    }
    uint64_t v6 = (void *)internal[42];
    if (v6)
    {

      internal[42] = 0;
    }
    id v7 = (void *)internal[41];
    if (v7)
    {

      internal[41] = 0;
    }
  }
}

- (void)_setAudioAccessoryHeartRateUpdateInterval:(double)a3
{
  uint64_t v5 = sub_1902D6BD0();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_190509340;
  v6[3] = &unk_1E568DB10;
  v6[4] = self;
  *(double *)&v6[5] = a3;
  sub_1902CDE98(v5, (uint64_t)v6);
}

- (double)_audioAccessoryHeartRateUpdateInterval
{
  return *((double *)self->_internal + 44);
}

- (BOOL)_isAudioAccessoryHeartRateAvailable
{
  uint64_t v3 = sub_1902D6BD0();
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1905093E0;
  v5[3] = &unk_1E568D118;
  v5[4] = self;
  sub_1902CDE98(v3, (uint64_t)v5);
  return *((unsigned char *)self->_internal + 477);
}

- (void)_startAudioAccessoryHeartRateUpdatesToQueue:(id)a3 withHandler:(id)a4
{
  uint64_t v7 = sub_1902D6BD0();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_190509478;
  v8[3] = &unk_1E568D398;
  v8[4] = self;
  v8[5] = a3;
  v8[6] = a4;
  sub_1902CE9BC(v7, (uint64_t)v8);
}

- (void)_stopAudioAccessoryHeartRateUpdates
{
  uint64_t v3 = sub_1902D6BD0();
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_190509504;
  v4[3] = &unk_1E568D118;
  v4[4] = self;
  sub_1902CDE98(v3, (uint64_t)v4);
}

- (void)_setAudioAccessoryHeartRateUpdateIntervalPrivate:(double)a3
{
  id internal = self->_internal;
  if (a3 < 0.005) {
    a3 = 0.005;
  }
  *((double *)internal + 44) = a3;
  if (*((void *)internal + 43))
  {
    if (qword_1E929EA90 != -1) {
      dispatch_once(&qword_1E929EA90, &unk_1EDFD1F20);
    }
    uint64_t v4 = qword_1E929EA88;
    uint64_t v5 = *((void *)internal + 43);
    sub_1904DC320(v4, 0, v5, (uint64_t)internal + 352);
  }
}

- (void)_isAudioAccessoryHeartRateAvailablePrivate
{
  *((unsigned char *)self->_internal + 477) = 1;
}

- (void)_startAudioAccessoryHeartRateUpdatesPrivateToQueue:(id)a3 withHandler:(id)a4
{
  id internal = (double *)self->_internal;
  if (objc_msgSend__isAudioAccessoryHeartRateAvailable(self, a2, (uint64_t)a3) && internal[44] > 0.0)
  {
    id v7 = (id)*((void *)internal + 46);
    if (v7 != a3)
    {

      *((void *)internal + 46) = a3;
    }
    id v8 = (id)*((void *)internal + 45);
    if (v8 != a4)
    {

      *((void *)internal + 45) = objc_msgSend_copy(a4, v9, v10);
    }
    if (!*((void *)internal + 43)) {
      operator new();
    }
  }
}

- (void)_stopAudioAccessoryHeartRateUpdatesPrivate
{
  id internal = (uint64_t *)self->_internal;
  if (objc_msgSend__isAudioAccessoryHeartRateAvailable(self, a2, v2))
  {
    if (internal[43])
    {
      if (qword_1E929EA90 != -1) {
        dispatch_once(&qword_1E929EA90, &unk_1EDFD1F20);
      }
      sub_1902CDE08(qword_1E929EA88, 0, internal[43]);
      uint64_t v4 = internal[43];
      if (v4) {
        (*(void (**)(uint64_t))(*(void *)v4 + 8))(v4);
      }
      internal[43] = 0;
    }
    uint64_t v5 = (void *)internal[46];
    if (v5)
    {

      internal[46] = 0;
    }
    uint64_t v6 = (void *)internal[45];
    if (v6)
    {

      internal[45] = 0;
    }
  }
}

- (BOOL)_isAudioAccessoryPPGAvailable
{
  uint64_t v3 = sub_1902D6BD0();
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_190509864;
  v5[3] = &unk_1E568D118;
  v5[4] = self;
  sub_1902CDE98(v3, (uint64_t)v5);
  return *((unsigned char *)self->_internal + 478);
}

- (void)_startAudioAccessoryPPGUpdatesToQueue:(id)a3 withHandler:(id)a4
{
  uint64_t v7 = sub_1902D6BD0();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1905098FC;
  v8[3] = &unk_1E568D398;
  v8[4] = self;
  v8[5] = a3;
  v8[6] = a4;
  sub_1902CE9BC(v7, (uint64_t)v8);
}

- (void)_stopAudioAccessoryPPGUpdates
{
  uint64_t v3 = sub_1902D6BD0();
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_190509988;
  v4[3] = &unk_1E568D118;
  v4[4] = self;
  sub_1902CDE98(v3, (uint64_t)v4);
}

- (void)_isAudioAccessoryPPGAvailablePrivate
{
  *((unsigned char *)self->_internal + 478) = 1;
}

- (void)_startAudioAccessoryPPGUpdatesPrivateToQueue:(id)a3 withHandler:(id)a4
{
  id internal = self->_internal;
  if (objc_msgSend__isAudioAccessoryPPGAvailable(self, a2, (uint64_t)a3))
  {
    id v7 = (id)internal[53];
    if (v7 != a3)
    {

      internal[53] = a3;
    }
    id v8 = (id)internal[52];
    if (v8 != a4)
    {

      internal[52] = objc_msgSend_copy(a4, v9, v10);
    }
    if (!internal[51]) {
      operator new();
    }
  }
}

- (void)_stopAudioAccessoryPPGUpdatesPrivate
{
  id internal = (uint64_t *)self->_internal;
  if (objc_msgSend__isAudioAccessoryPPGAvailable(self, a2, v2))
  {
    if (internal[51])
    {
      if (qword_1E929EA48 != -1) {
        dispatch_once(&qword_1E929EA48, &unk_1EDFD1C60);
      }
      sub_1902CDE08(qword_1E929EA40, 0, internal[51]);
      uint64_t v4 = internal[51];
      if (v4) {
        (*(void (**)(uint64_t))(*(void *)v4 + 8))(v4);
      }
      internal[51] = 0;
    }
    uint64_t v5 = (void *)internal[53];
    if (v5)
    {

      internal[53] = 0;
    }
    uint64_t v6 = (void *)internal[52];
    if (v6)
    {

      internal[52] = 0;
    }
  }
}

- (void)onAudioAccessoryAccelerometer:(const Sample *)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id internal = (os_unfair_lock_s *)self->_internal;
  os_unfair_lock_lock(internal + 2);
  long long v5 = *(_OWORD *)&a3->timestamp;
  long long v6 = *(_OWORD *)&a3->acceleration.z;
  *(void *)&internal[20]._os_unfair_lock_opaque = *(void *)&a3[1].acceleration.x;
  *(_OWORD *)&internal[12]._os_unfair_lock_opaque = v5;
  *(_OWORD *)&internal[16]._os_unfair_lock_opaque = v6;
  os_unfair_lock_unlock(internal + 2);
  if (*(void *)&internal[10]._os_unfair_lock_opaque && *(void *)&internal[8]._os_unfair_lock_opaque)
  {
    id v7 = (void *)MEMORY[0x192FCD2F0]();
    id v8 = [CMAccelerometerData alloc];
    *(float *)&double v9 = a3->acceleration.x;
    *(float *)&double v10 = a3->acceleration.y;
    *(float *)&double v11 = a3->acceleration.z;
    BOOL v14 = objc_msgSend_initWithAcceleration_andTimestamp_(v8, v12, v13, v9, v10, v11, a3->timestamp);
    uint64_t v15 = *(void *)&internal[8]._os_unfair_lock_opaque;
    if (qword_1EB3BE878 != -1) {
      dispatch_once(&qword_1EB3BE878, &unk_1EDFD1DE0);
    }
    v16 = off_1EB3BE870;
    if (os_log_type_enabled((os_log_t)off_1EB3BE870, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v17 = mach_absolute_time();
      *(_DWORD *)buf = 138412546;
      v28 = v14;
      __int16 v29 = 2048;
      double v30 = sub_1902D8D34(v17);
      _os_log_impl(&dword_1902AF000, v16, OS_LOG_TYPE_DEBUG, "Audio Accessory CMAccelerometerData: %@,now,%f", buf, 0x16u);
    }
    if (sub_1902D8400(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EB3BE878 != -1) {
        dispatch_once(&qword_1EB3BE878, &unk_1EDFD1DE0);
      }
      uint64_t v20 = mach_absolute_time();
      int v23 = 138412546;
      v24 = v14;
      __int16 v25 = 2048;
      double v26 = sub_1902D8D34(v20);
      v21 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "-[CMAudioAccessoryManager onAudioAccessoryAccelerometer:]", "CoreLocation: %s\n", v21);
      if (v21 != (char *)buf) {
        free(v21);
      }
    }
    v19 = *(void **)&internal[10]._os_unfair_lock_opaque;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = sub_190509E64;
    v22[3] = &unk_1E568D320;
    v22[4] = v14;
    v22[5] = v15;
    objc_msgSend_addOperationWithBlock_(v19, v18, (uint64_t)v22);
  }
}

- (void)onAudioAccessoryGyro:(const Sample *)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id internal = (char *)self->_internal;
  os_unfair_lock_lock((os_unfair_lock_t)internal + 2);
  long long v5 = *(_OWORD *)&a3->timestamp;
  long long v6 = *(_OWORD *)&a3->acceleration.z;
  *((void *)internal + 19) = *(void *)&a3[1].acceleration.x;
  *(_OWORD *)(internal + 136) = v6;
  *(_OWORD *)(internal + 120) = v5;
  os_unfair_lock_unlock((os_unfair_lock_t)internal + 2);
  if (*((void *)internal + 14) && *((void *)internal + 13))
  {
    id v7 = (void *)MEMORY[0x192FCD2F0]();
    id v8 = [CMGyroData alloc];
    *(float *)&double v9 = a3->acceleration.x;
    *(float *)&double v10 = a3->acceleration.y;
    *(float *)&double v11 = a3->acceleration.z;
    BOOL v14 = objc_msgSend_initWithRotationRate_andTimestamp_(v8, v12, v13, v9, v10, v11, a3->timestamp);
    uint64_t v15 = *((void *)internal + 13);
    if (qword_1EB3BE878 != -1) {
      dispatch_once(&qword_1EB3BE878, &unk_1EDFD1DE0);
    }
    v16 = off_1EB3BE870;
    if (os_log_type_enabled((os_log_t)off_1EB3BE870, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v17 = mach_absolute_time();
      *(_DWORD *)buf = 138412546;
      v28 = v14;
      __int16 v29 = 2048;
      double v30 = sub_1902D8D34(v17);
      _os_log_impl(&dword_1902AF000, v16, OS_LOG_TYPE_DEBUG, "Audio Accessory CMGyroData: %@,now,%f", buf, 0x16u);
    }
    if (sub_1902D8400(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EB3BE878 != -1) {
        dispatch_once(&qword_1EB3BE878, &unk_1EDFD1DE0);
      }
      uint64_t v20 = mach_absolute_time();
      int v23 = 138412546;
      v24 = v14;
      __int16 v25 = 2048;
      double v26 = sub_1902D8D34(v20);
      v21 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "-[CMAudioAccessoryManager onAudioAccessoryGyro:]", "CoreLocation: %s\n", v21);
      if (v21 != (char *)buf) {
        free(v21);
      }
    }
    v19 = (void *)*((void *)internal + 14);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = sub_19050A124;
    v22[3] = &unk_1E568D320;
    v22[4] = v14;
    v22[5] = v15;
    objc_msgSend_addOperationWithBlock_(v19, v18, (uint64_t)v22);
  }
}

- (void)onAudioAccessoryMagnetometer:(const Sample *)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id internal = (os_unfair_lock_s *)self->_internal;
  os_unfair_lock_lock(internal + 2);
  long long v5 = *(_OWORD *)&a3->timestamp;
  long long v6 = *(_OWORD *)&a3->acceleration.z;
  *(void *)&internal[56]._os_unfair_lock_opaque = *(void *)&a3[1].acceleration.x;
  *(_OWORD *)&internal[48]._os_unfair_lock_opaque = v5;
  *(_OWORD *)&internal[52]._os_unfair_lock_opaque = v6;
  os_unfair_lock_unlock(internal + 2);
  if (*(void *)&internal[46]._os_unfair_lock_opaque && *(void *)&internal[44]._os_unfair_lock_opaque)
  {
    id v7 = (void *)MEMORY[0x192FCD2F0]();
    id v8 = [CMMagnetometerData alloc];
    *(float *)&double v9 = a3->acceleration.x;
    *(float *)&double v10 = a3->acceleration.y;
    *(float *)&double v11 = a3->acceleration.z;
    BOOL v14 = objc_msgSend_initWithMagneticField_andTimestamp_(v8, v12, v13, v9, v10, v11, a3->timestamp);
    uint64_t v15 = *(void *)&internal[44]._os_unfair_lock_opaque;
    if (qword_1EB3BE878 != -1) {
      dispatch_once(&qword_1EB3BE878, &unk_1EDFD1DE0);
    }
    v16 = off_1EB3BE870;
    if (os_log_type_enabled((os_log_t)off_1EB3BE870, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v17 = mach_absolute_time();
      *(_DWORD *)buf = 138412546;
      v28 = v14;
      __int16 v29 = 2048;
      double v30 = sub_1902D8D34(v17);
      _os_log_impl(&dword_1902AF000, v16, OS_LOG_TYPE_DEBUG, "Audio Accessory CMMagnetometerData: %@,now,%f", buf, 0x16u);
    }
    if (sub_1902D8400(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EB3BE878 != -1) {
        dispatch_once(&qword_1EB3BE878, &unk_1EDFD1DE0);
      }
      uint64_t v20 = mach_absolute_time();
      int v23 = 138412546;
      v24 = v14;
      __int16 v25 = 2048;
      double v26 = sub_1902D8D34(v20);
      v21 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "-[CMAudioAccessoryManager onAudioAccessoryMagnetometer:]", "CoreLocation: %s\n", v21);
      if (v21 != (char *)buf) {
        free(v21);
      }
    }
    v19 = *(void **)&internal[46]._os_unfair_lock_opaque;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = sub_19050A3E0;
    v22[3] = &unk_1E568D320;
    v22[4] = v14;
    v22[5] = v15;
    objc_msgSend_addOperationWithBlock_(v19, v18, (uint64_t)v22);
  }
}

- (void)onAudioAccessoryDeviceMotion:(const void *)a3
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id internal = (float *)self->_internal;
  long long v4 = *((_OWORD *)a3 + 1);
  long long v69 = *(_OWORD *)a3;
  long long v70 = v4;
  *(_OWORD *)v71 = *((_OWORD *)a3 + 2);
  *(void *)&v71[14] = *(void *)((char *)a3 + 46);
  long long v74 = *(_OWORD *)((char *)a3 + 88);
  long long v75 = *(_OWORD *)((char *)a3 + 104);
  long long v76 = *(_OWORD *)((char *)a3 + 120);
  uint64_t v77 = *((void *)a3 + 17);
  long long v72 = *(_OWORD *)((char *)a3 + 56);
  float32x4_t v5 = *(float32x4_t *)((char *)a3 + 72);
  float32x4_t v73 = v5;
  if (*((void *)internal + 33))
  {
    if (*((void *)internal + 32))
    {
      sub_1904CF3F4((uint64_t)(internal + 68), (float *)&v69, &v68, v5);
      float v7 = sub_1904CF73C(internal + 68, *(float *)&v71[8], *(float *)&v71[12], *(float *)&v71[16]);
      int v9 = v8;
      int v11 = v10;
      float v12 = sub_1904CF73C(internal + 68, *(float *)&v70, *((float *)&v70 + 1), *((float *)&v70 + 2));
      float32x4_t v57 = v68;
      float v58 = v7;
      int v59 = v9;
      int v60 = v11;
      float v61 = v12;
      int v62 = v13;
      int v63 = v14;
      char v64 = v71[21] & 1;
      int v65 = v75;
      uint64_t v66 = *((void *)&v72 + 1);
      uint64_t v67 = 0;
      value = self->_resampleAccessoryDeviceMotion.__ptr_.__value_;
      if (value)
      {
        if (sub_190498414((uint64_t)value, (uint64_t)&v57))
        {
          v16 = self->_resampleAccessoryDeviceMotion.__ptr_.__value_;
          if (*((_WORD *)v16 + 5))
          {
            unint64_t v17 = 0;
            do
            {
              uint64_t v18 = sub_19050A894((unsigned __int16 *)v16 + 4, v17);
              double v19 = *(float *)(v18 + 12);
              double v20 = *(float *)v18;
              double v21 = *(float *)(v18 + 4);
              double v22 = *(float *)(v18 + 8);
              char v23 = *(unsigned char *)(v18 + 40);
              int v24 = *(_DWORD *)(v18 + 44);
              long long v45 = *(_OWORD *)(v18 + 16);
              uint64_t v25 = *(void *)(v18 + 32);
              double v26 = *(double *)(sub_19050A894((unsigned __int16 *)v16 + 4, v17) + 48);
              v27 = (void *)MEMORY[0x192FCD2F0]();
              v28 = [CMDeviceMotion alloc];
              *(double *)v47 = v19;
              *(double *)&v47[1] = v20;
              *(double *)&v47[2] = v21;
              *(double *)&v47[3] = v22;
              long long v48 = v45;
              uint64_t v49 = v25;
              uint64_t v50 = 0;
              unint64_t v51 = 0xFFFFFFFF00000000;
              __int16 v52 = 0;
              char v53 = v23;
              uint64_t v54 = 0;
              char v55 = 0;
              int v56 = v24;
              double v30 = objc_msgSend_initWithDeviceMotion_internal_timestamp_(v28, v29, (uint64_t)v47, COERCE_DOUBLE(__PAIR64__(DWORD1(v45), -1.0)), v26);
              uint64_t v31 = *((void *)internal + 32);
              if (qword_1EB3BE878 != -1) {
                dispatch_once(&qword_1EB3BE878, &unk_1EDFD1DE0);
              }
              v32 = off_1EB3BE870;
              if (os_log_type_enabled((os_log_t)off_1EB3BE870, OS_LOG_TYPE_DEBUG))
              {
                uint64_t v33 = mach_absolute_time();
                double v34 = sub_1902D8D34(v33);
                *(_DWORD *)buf = 138543618;
                v83 = v30;
                __int16 v84 = 2050;
                double v85 = v34;
                _os_log_impl(&dword_1902AF000, v32, OS_LOG_TYPE_DEBUG, "Audio Accessory CMDeviceMotion: %{public}@,now,%{public}f", buf, 0x16u);
              }
              if (sub_1902D8400(115, 2))
              {
                bzero(buf, 0x65CuLL);
                if (qword_1EB3BE878 != -1) {
                  dispatch_once(&qword_1EB3BE878, &unk_1EDFD1DE0);
                }
                uint64_t v37 = mach_absolute_time();
                double v38 = sub_1902D8D34(v37);
                int v78 = 138543618;
                v79 = v30;
                __int16 v80 = 2050;
                double v81 = v38;
                v39 = (char *)_os_log_send_and_compose_impl();
                sub_1902D398C("Generic", 1, 0, 2, "-[CMAudioAccessoryManager onAudioAccessoryDeviceMotion:]", "CoreLocation: %s\n", v39);
                if (v39 != (char *)buf) {
                  free(v39);
                }
              }
              v36 = (void *)*((void *)internal + 33);
              v46[0] = MEMORY[0x1E4F143A8];
              v46[1] = 3221225472;
              v46[2] = sub_19050AA90;
              v46[3] = &unk_1E568D320;
              v46[4] = v30;
              v46[5] = v31;
              objc_msgSend_addOperationWithBlock_(v36, v35, (uint64_t)v46);

              ++v17;
            }
            while (v17 < *((unsigned __int16 *)v16 + 5));
            v40 = self->_resampleAccessoryDeviceMotion.__ptr_.__value_;
            unsigned int v41 = *((unsigned __int16 *)v40 + 5);
            if (v41 >= 2)
            {
              uint64_t v42 = *((unsigned __int16 *)v40 + 4);
              do
              {
                unint64_t v43 = v42 + 1;
                if (v43 >= *((unsigned int *)v40 + 3)) {
                  __int16 v44 = *((_DWORD *)v40 + 3);
                }
                else {
                  __int16 v44 = 0;
                }
                uint64_t v42 = (unsigned __int16)(v43 - v44);
                --v41;
              }
              while ((unsigned __int16)v41 > 1u);
              *((_WORD *)v40 + 4) = v42;
              *((_WORD *)v40 + 5) = 1;
            }
          }
        }
      }
    }
  }
}

- (void)onAudioAccessoryDeviceMotionConfig:(const void *)a3
{
  id internal = (float32x4_t *)self->_internal;
  unsigned int v5 = *((_DWORD *)a3 + 18);
  v3.f32[0] = -*((float *)a3 + 17);
  *(float32x2_t *)v6.f32 = vneg_f32(*(float32x2_t *)((char *)a3 + 60));
  v6.i64[1] = __PAIR64__(v5, v3.u32[0]);
  sub_1902D9ACC(&v6, v3);
  internal[17] = v6;
}

- (void)onAudioAccessoryDeviceMotionStatus:(const int *)a3
{
  id internal = self->_internal;
  long long v4 = (void *)internal[38];
  if (v4)
  {
    uint64_t v5 = internal[37];
    if (v5)
    {
      uint64_t v6 = *a3;
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = sub_19050AB7C;
      v7[3] = &unk_1E568D268;
      v7[4] = v5;
      v7[5] = v6;
      objc_msgSend_addOperationWithBlock_(v4, a2, (uint64_t)v7);
    }
  }
}

- (void)onAudioAccessoryActivity:(const void *)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id internal = self->_internal;
  if (internal[42])
  {
    uint64_t v4 = internal[41];
    if (v4)
    {
      float v7 = (void *)MEMORY[0x192FCD2F0]();
      if (*((unsigned char *)a3 + 142))
      {
        uint64_t v8 = *((unsigned __int8 *)a3 + 141);
        if (qword_1EB3BE838 != -1) {
          dispatch_once(&qword_1EB3BE838, &unk_1EDFC1FC0);
        }
        int v9 = qword_1EB3BE830;
        if (os_log_type_enabled((os_log_t)qword_1EB3BE830, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134349056;
          uint64_t v44 = v8;
          _os_log_impl(&dword_1902AF000, v9, OS_LOG_TYPE_INFO, "[CMAudioAccessoryManager] notifying client of activity: %{public}lu", buf, 0xCu);
        }
        if (sub_1902D8400(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1EB3BE838 != -1) {
            dispatch_once(&qword_1EB3BE838, &unk_1EDFC1FC0);
          }
          int v41 = 134349056;
          uint64_t v42 = v8;
          char v23 = (char *)_os_log_send_and_compose_impl();
          sub_1902D398C("Generic", 1, 0, 2, "-[CMAudioAccessoryManager onAudioAccessoryActivity:]", "CoreLocation: %s\n", v23);
          if (v23 != (char *)buf) {
            free(v23);
          }
        }
        int v11 = objc_msgSend_motionActivityForHeadphoneActivity_(CMHeadphoneActivityUtils, v10, v8);
        uint64_t v12 = *((void *)a3 + 8);
        int v13 = [CMMotionActivity alloc];
        int v26 = v11;
        uint64_t v27 = 0x100000001;
        uint64_t v28 = 0;
        uint64_t v30 = 0;
        uint64_t v29 = 0;
        int v31 = 0;
        uint64_t v32 = v12;
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        uint64_t v38 = 0;
        uint64_t v15 = objc_msgSend_initWithMotionActivity_(v13, v14, (uint64_t)&v26);
        v16 = (void *)internal[42];
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = sub_19050AEF4;
        v25[3] = &unk_1E568D320;
        v25[4] = v15;
        v25[5] = v4;
        objc_msgSend_addOperationWithBlock_(v16, v17, (uint64_t)v25);
      }
      else
      {
        uint64_t v39 = *MEMORY[0x1E4F28568];
        v40 = @"Connected headphone does not support activity.";
        uint64_t v18 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v6, (uint64_t)&v40, &v39, 1);
        uint64_t v20 = objc_msgSend_CMErrorWithCode_userInfo_(CMErrorUtils, v19, 109, v18);
        double v21 = (void *)internal[42];
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = sub_19050AF0C;
        v24[3] = &unk_1E568D320;
        v24[4] = v20;
        v24[5] = v4;
        objc_msgSend_addOperationWithBlock_(v21, v22, (uint64_t)v24);
      }
    }
  }
}

- (void)onAudioAccessoryHeartRate:(const Sample *)a3
{
  id internal = (char *)self->_internal;
  os_unfair_lock_lock((os_unfair_lock_t)internal + 2);
  long long v5 = *(_OWORD *)&a3->acceleration.z;
  *(_OWORD *)(internal + 376) = *(_OWORD *)&a3->timestamp;
  *(_OWORD *)(internal + 392) = v5;
  os_unfair_lock_unlock((os_unfair_lock_t)internal + 2);
  if (*((void *)internal + 46))
  {
    if (*((void *)internal + 45))
    {
      uint64_t v6 = (void *)MEMORY[0x192FCD2F0]();
      uint64_t v8 = *((void *)internal + 45);
      float v7 = (void *)*((void *)internal + 46);
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = sub_19050AFEC;
      v10[3] = &unk_1E568D268;
      v10[4] = v8;
      v10[5] = a3;
      objc_msgSend_addOperationWithBlock_(v7, v9, (uint64_t)v10);
    }
  }
}

- (void)onAudioAccessoryPPG:(const Sample *)a3
{
  id internal = (os_unfair_lock_s *)self->_internal;
  os_unfair_lock_lock(internal + 2);
  long long v5 = *(_OWORD *)&a3->timestamp;
  long long v6 = *(_OWORD *)&a3->acceleration.z;
  *(void *)&internal[116]._os_unfair_lock_opaque = *(void *)&a3[1].acceleration.x;
  *(_OWORD *)&internal[108]._os_unfair_lock_opaque = v5;
  *(_OWORD *)&internal[112]._os_unfair_lock_opaque = v6;
  os_unfair_lock_unlock(internal + 2);
  if (*(void *)&internal[106]._os_unfair_lock_opaque)
  {
    if (*(void *)&internal[104]._os_unfair_lock_opaque)
    {
      float v7 = (void *)MEMORY[0x192FCD2F0]();
      uint64_t v9 = *(void *)&internal[104]._os_unfair_lock_opaque;
      uint64_t v8 = *(void **)&internal[106]._os_unfair_lock_opaque;
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = sub_19050B12C;
      v11[3] = &unk_1E568D268;
      v11[4] = v9;
      v11[5] = a3;
      objc_msgSend_addOperationWithBlock_(v8, v10, (uint64_t)v11);
    }
  }
}

- (void).cxx_destruct
{
  value = self->_resampleAccessoryDeviceMotion.__ptr_.__value_;
  self->_resampleAccessoryDeviceMotion.__ptr_.__value_ = 0;
  if (value) {
    JUMPOUT(0x192FCC980);
  }
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  return self;
}

@end