@interface CMMotionManager
+ ($B9CA342F461DD9C11232D7AF76457BE1)gyroCalibrationDatabaseGetBiasFit;
+ ($B9CA342F461DD9C11232D7AF76457BE1)gyroCalibrationDatabaseGetBiasFitAndEstimate:(SEL)a3 atTemperature:(id *)a4;
+ (BOOL)configureM7Activity:(BOOL)a3 stepCounting:(BOOL)a4 activityForceCodeTransition:(BOOL)a5 stepCountingForceCodeTransition:(BOOL)a6 threshold:(BOOL)a7 onBodyDetection:(BOOL)a8 ispMode:(unsigned __int8)a9 predictionInterval:(float)a10 logLevel:(char)a11 proactiveRevisitTime:(unsigned __int16)a12;
+ (BOOL)deviceMotionInitialized:(Sample *)a3;
+ (BOOL)hasRunMiniCal;
+ (BOOL)northAlignedReferenceFrame:(unint64_t)a3;
+ (BOOL)startGyroMiniCalibration;
+ (BOOL)supportsGyroMiniCalibration;
+ (CMAttitudeReferenceFrame)availableAttitudeReferenceFrames;
+ (id)virtualAlmondDevice;
+ (void)dumpDb:(int64_t)a3 toURL:(id)a4 onCompletion:(id)a5;
+ (void)initialize;
+ (void)setVirtualAlmondDevice:(id)a3;
- (BOOL)isAccelerometerActive;
- (BOOL)isAccelerometerAvailable;
- (BOOL)isAmbientPressureActive;
- (BOOL)isAmbientPressureAvailable;
- (BOOL)isCompensatedAmbientPressureActive;
- (BOOL)isDeviceMotionActive;
- (BOOL)isDeviceMotionAvailable;
- (BOOL)isDeviceMotionLiteAvailable;
- (BOOL)isDisplayGravityAvailable;
- (BOOL)isGyroActive;
- (BOOL)isGyroAvailable;
- (BOOL)isMagnetometerActive;
- (BOOL)isMagnetometerAvailable;
- (BOOL)isSidebandSensorFusionAvailable;
- (BOOL)readRawAmbientPressureSamplesFromDB:(id)a3 toQueue:(id)a4 where:(id)a5 withHandler:(id)a6;
- (BOOL)sendDeviceMotionError:(int)a3;
- (BOOL)sendDeviceMotionHostGravityToKeyboard:(id *)a3;
- (BOOL)setMotionThreadPriority:(int)a3;
- (BOOL)setSidebandSensorFusionEnable:(BOOL)a3;
- (BOOL)setSidebandSensorFusionEnable:(BOOL)a3 measureLatency:(BOOL)a4 withSnoopHandler:(id)a5;
- (BOOL)setSidebandSensorFusionEnable:(BOOL)a3 withSnoopHandler:(id)a4;
- (BOOL)showsDeviceMovementDisplay;
- (BOOL)useAccelerometer;
- (CMAccelerometerData)accelerometerData;
- (CMAmbientPressureData)ambientPressureData;
- (CMAmbientPressureData)compensatedAmbientPressureData;
- (CMAttitudeReferenceFrame)attitudeReferenceFrame;
- (CMDeviceMotion)deviceMotion;
- (CMGyroData)gyroData;
- (CMMagnetometerData)magnetometerData;
- (CMMotionManager)init;
- (NSTimeInterval)accelerometerUpdateInterval;
- (NSTimeInterval)deviceMotionUpdateInterval;
- (NSTimeInterval)gyroUpdateInterval;
- (NSTimeInterval)magnetometerUpdateInterval;
- (double)ambientPressureUpdateInterval;
- (double)compensatedAmbientPressureUpdateInterval;
- (id)computeNonlinearPRTTFromDB:(id)a3 where:(id)a4;
- (id)initPrivate;
- (id)initUsing6AxisSensorFusion;
- (id)initUsingGyroOnlySensorFusion;
- (id)predictedDeviceMotionAtTimestamp:(double)a3 error:(id *)a4;
- (int)gyttNumTemperatures;
- (void)_startDeviceMotionErrorUpdatesToQueue:(id)a3 withHandler:(id)a4;
- (void)_stopDeviceMotionErrorUpdates;
- (void)applyInitialReference:(Sample *)a3;
- (void)applyNorthReference:(Sample *)a3;
- (void)connect;
- (void)dealloc;
- (void)deallocPrivate;
- (void)didBecomeActive:(id)a3;
- (void)didBecomeActivePrivate:(id)a3;
- (void)dismissDeviceMovementDisplay;
- (void)onAccelerometer:(const Sample *)a3;
- (void)onAmbientPressure:(const Sample *)a3;
- (void)onCompensatedAmbientPressure:(const Sample *)a3;
- (void)onDeviceMotion:(const Sample *)a3;
- (void)onDeviceMotionForKeyboardMotion:(const Sample *)a3;
- (void)onFactoryGyro:(const Sample *)a3;
- (void)onFactoryGyroTemperature:(const Temperature *)a3;
- (void)onGyro:(const Sample *)a3;
- (void)onMagnetometer:(const Sample *)a3;
- (void)rebuildGytt;
- (void)setAccelerometerDataCallback:(void *)a3 info:(void *)a4 interval:(double)a5;
- (void)setAccelerometerUpdateInterval:(NSTimeInterval)accelerometerUpdateInterval;
- (void)setAccelerometerUpdateIntervalPrivate:(double)a3;
- (void)setAmbientPressureUpdateInterval:(double)a3;
- (void)setAmbientPressureUpdateIntervalPrivate:(double)a3;
- (void)setCompensatedAmbientPressureUpdateInterval:(double)a3;
- (void)setCompensatedAmbientPressureUpdateIntervalPrivate:(double)a3;
- (void)setDeviceMotionCallback:(void *)a3 info:(void *)a4 interval:(double)a5 fsync:(BOOL)a6;
- (void)setDeviceMotionUpdateInterval:(NSTimeInterval)deviceMotionUpdateInterval;
- (void)setDeviceMotionUpdateIntervalPrivate:(double)a3;
- (void)setDisplayGravityHandler:(id)a3 interval:(double)a4;
- (void)setGyroDataCallback:(void *)a3 info:(void *)a4 interval:(double)a5;
- (void)setGyroUpdateInterval:(NSTimeInterval)gyroUpdateInterval;
- (void)setGyroUpdateIntervalPrivate:(double)a3;
- (void)setMagnetometerDataCallback:(void *)a3 info:(void *)a4 interval:(double)a5;
- (void)setMagnetometerUpdateInterval:(NSTimeInterval)magnetometerUpdateInterval;
- (void)setMagnetometerUpdateIntervalPrivate:(double)a3;
- (void)setNotificationCallback:(void *)a3 info:(void *)a4;
- (void)setPowerConservationMode:(int)a3;
- (void)setShowsDeviceMovementDisplay:(BOOL)showsDeviceMovementDisplay;
- (void)setShowsDeviceMovementDisplayPrivate:(BOOL)a3;
- (void)setSidebandTimeSyncHandler:(id)a3;
- (void)setUseAccelerometer:(BOOL)a3;
- (void)showDeviceMovementDisplay;
- (void)startAccelerometerUpdates;
- (void)startAccelerometerUpdatesPrivateToQueue:(id)a3 withHandler:(id)a4;
- (void)startAccelerometerUpdatesToQueue:(NSOperationQueue *)queue withHandler:(CMAccelerometerHandler)handler;
- (void)startAmbientPressureUpdates;
- (void)startAmbientPressureUpdatesPrivateToQueue:(id)a3 withHandler:(id)a4;
- (void)startAmbientPressureUpdatesToQueue:(id)a3 withHandler:(id)a4;
- (void)startCompensatedAmbientPressureUpdates;
- (void)startCompensatedAmbientPressureUpdatesPrivateToQueue:(id)a3 withHandler:(id)a4;
- (void)startCompensatedAmbientPressureUpdatesToQueue:(id)a3 withHandler:(id)a4;
- (void)startDeviceMotionLiteFusedUpdatesForDeviceID:(id)a3 toQueue:(id)a4 withHandler:(id)a5;
- (void)startDeviceMotionLiteUpdatesForDeviceID:(id)a3 usingConfiguration:(id)a4 toQueue:(id)a5 withFusedHandler:(id)a6;
- (void)startDeviceMotionUpdates;
- (void)startDeviceMotionUpdatesForKeyboardMotionPrivateToQueue:(id)a3 withGravityDeltaThreshold:(double)a4 notificationFrequency:(double)a5 andHandler:(id)a6;
- (void)startDeviceMotionUpdatesForKeyboardMotionToQueue:(id)a3 withGravityDeltaThreshold:(double)a4 sendFrequency:(double)a5 andHandler:(id)a6;
- (void)startDeviceMotionUpdatesPrivateUsingReferenceFrame:(unint64_t)a3 toQueue:(id)a4 withHandler:(id)a5;
- (void)startDeviceMotionUpdatesToQueue:(NSOperationQueue *)queue withHandler:(CMDeviceMotionHandler)handler;
- (void)startDeviceMotionUpdatesUsingReferenceFrame:(CMAttitudeReferenceFrame)referenceFrame;
- (void)startDeviceMotionUpdatesUsingReferenceFrame:(CMAttitudeReferenceFrame)referenceFrame toQueue:(NSOperationQueue *)queue withHandler:(CMDeviceMotionHandler)handler;
- (void)startFactoryGyroUpdatesPrivateToQueue:(id)a3 atUpdateInterval:(double)a4 withHandler:(id)a5 residualHandler:(id)a6;
- (void)startFactoryGyroUpdatesToQueue:(id)a3 atUpdateInterval:(double)a4 withHandler:(id)a5;
- (void)startFactoryGyroUpdatesToQueue:(id)a3 atUpdateInterval:(double)a4 withHandler:(id)a5 residualHandler:(id)a6;
- (void)startFactoryGyroUpdatesToQueue:(id)a3 withHandler:(id)a4;
- (void)startGyroUpdates;
- (void)startGyroUpdatesPrivateToQueue:(id)a3 withHandler:(id)a4;
- (void)startGyroUpdatesToQueue:(NSOperationQueue *)queue withHandler:(CMGyroHandler)handler;
- (void)startMagnetometerUpdates;
- (void)startMagnetometerUpdatesPrivateToQueue:(id)a3 withHandler:(id)a4;
- (void)startMagnetometerUpdatesToQueue:(NSOperationQueue *)queue withHandler:(CMMagnetometerHandler)handler;
- (void)stopAccelerometerUpdates;
- (void)stopAccelerometerUpdatesPrivate;
- (void)stopAmbientPressureUpdates;
- (void)stopAmbientPressureUpdatesPrivate;
- (void)stopCompensatedAmbientPressureUpdates;
- (void)stopCompensatedAmbientPressureUpdatesPrivate;
- (void)stopDeviceMotionLiteUpdatesForDeviceID:(id)a3;
- (void)stopDeviceMotionUpdates;
- (void)stopDeviceMotionUpdatesForKeyboardMotion;
- (void)stopDeviceMotionUpdatesForKeyboardMotionPrivate;
- (void)stopDeviceMotionUpdatesPrivate;
- (void)stopFactoryGyroUpdates;
- (void)stopFactoryGyroUpdatesPrivate;
- (void)stopGyroUpdates;
- (void)stopGyroUpdatesPrivate;
- (void)stopMagnetometerUpdates;
- (void)stopMagnetometerUpdatesPrivate;
- (void)updateDeviceMotionMode;
- (void)willResignActive:(id)a3;
- (void)willResignActivePrivate:(id)a3;
@end

@implementation CMMotionManager

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v5 = objc_msgSend_currentThread(MEMORY[0x1E4F29060], v3, v4);
    if (objc_msgSend_isMainThread(v5, v6, v7)
      && (objc_msgSend_isMultiThreaded(MEMORY[0x1E4F29060], v8, v9) & 1) == 0)
    {
      objc_msgSend_detachNewThreadSelector_toTarget_withObject_(MEMORY[0x1E4F29060], v10, (uint64_t)sel_dummySelector_, a1, 0);
    }
    if (!qword_1EB3BF820)
    {
      CFRunLoopRef Main = CFRunLoopGetMain();
      sub_1902B3DDC(Main);
    }
  }
}

- (id)initPrivate
{
  v9.receiver = self;
  v9.super_class = (Class)CMMotionManager;
  v2 = [(CMMotionManager *)&v9 init];
  if (v2)
  {
    v2->_internal = objc_alloc_init(CMMotionManagerInternal);
    v5 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v3, v4);
    objc_msgSend_addObserver_selector_name_object_(v5, v6, (uint64_t)v2, sel_willResignActive_, @"UIApplicationWillResignActiveNotification", 0);
    objc_msgSend_addObserver_selector_name_object_(v5, v7, (uint64_t)v2, sel_didBecomeActive_, @"UIApplicationDidBecomeActiveNotification", 0);
  }
  return v2;
}

- (void)startDeviceMotionUpdatesPrivateUsingReferenceFrame:(unint64_t)a3 toQueue:(id)a4 withHandler:(id)a5
{
  internal = (char *)self->_internal;
  if (objc_msgSend_isDeviceMotionAvailable(self, a2, a3)
    && *((double *)internal + 33) > 0.0
    && (objc_msgSend_availableAttitudeReferenceFrames(CMMotionManager, v10, v11) & a3) != 0)
  {
    if (objc_msgSend_isDeviceMotionActive(self, v12, v13) && *((void *)internal + 38) != a3) {
      objc_msgSend_stopDeviceMotionUpdates(self, v14, v15);
    }
    *((void *)internal + 38) = a3;
    internal[360] = 0;
    uint64_t v16 = mach_absolute_time();
    *((double *)internal + 40) = sub_1902D8D34(v16);
    if ((unint64_t)(*((void *)internal + 38) - 1) > 1)
    {
      if (!internal[314]) {
        *(_WORD *)(internal + 313) = 257;
      }
    }
    else
    {
      objc_msgSend_dismissDeviceMovementDisplay(self, v17, v18);
    }
    id v19 = (id)*((void *)internal + 35);
    if (v19 != a4)
    {

      *((void *)internal + 35) = a4;
    }
    id v20 = (id)*((void *)internal + 34);
    if (v20 != a5)
    {

      *((void *)internal + 34) = objc_msgSend_copy(a5, v21, v22);
    }
    if (!*((void *)internal + 32))
    {
      switch(*((void *)internal + 38))
      {
        case 1:
          int v23 = *((_DWORD *)internal + 146);
          if (internal[537])
          {
            if (v23 == 2) {
              int v24 = 67;
            }
            else {
              int v24 = 3;
            }
          }
          else if (v23 == 1)
          {
            int v24 = 34;
          }
          else
          {
            int v24 = 2;
          }
          goto LABEL_27;
        case 2:
          int v24 = 7;
          goto LABEL_27;
        case 4:
          int v24 = 15;
          goto LABEL_27;
        case 8:
          int v24 = 143;
LABEL_27:
          *((_DWORD *)internal + 74) = v24;
          break;
        default:
          break;
      }
      v25 = [CLDeviceMotionProperties alloc];
      objc_msgSend_initWithMode_(v25, v26, *((unsigned int *)internal + 74));
      operator new();
    }
  }
}

- (BOOL)isDeviceMotionAvailable
{
  return (sub_1902BACB4() & 1) == 0
      && objc_msgSend_availableAttitudeReferenceFrames(CMMotionManager, v2, v3) != 0;
}

+ (CMAttitudeReferenceFrame)availableAttitudeReferenceFrames
{
  if ((sub_1902BB1DC() & 4) == 0) {
    return 0;
  }
  if ((sub_1902BAD84() & 1) == 0 && (sub_1902BB1DC() & 1) == 0) {
    return 1;
  }
  sub_1902BAD40();
  return 15;
}

- (void)setDeviceMotionCallback:(void *)a3 info:(void *)a4 interval:(double)a5 fsync:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  CFRunLoopRef Current = CFRunLoopGetCurrent();
  sub_1902D6BD0();
  if (Current == *(CFRunLoopRef *)qword_1EB3BF828)
  {
    if (objc_msgSend_isDeviceMotionAvailable(self, v12, v13))
    {
      internal = self->_internal;
      internal[65] = a3;
      internal[66] = a4;
      uint64_t v20 = internal[64];
      if (a5 <= 0.0)
      {
        if (v20)
        {
          uint64_t v22 = sub_1902B35C0();
          sub_1902E02F4(v22, internal[64]);
          uint64_t v23 = internal[64];
          if (v23) {
            (*(void (**)(uint64_t))(*(void *)v23 + 8))(v23);
          }
          internal[64] = 0;
        }
      }
      else
      {
        if (!v20)
        {
          objc_msgSend_updateDeviceMotionMode(self, v17, v18);
          int v24 = [CLDeviceMotionProperties alloc];
          objc_msgSend_initWithMode_(v24, v25, *((unsigned int *)internal + 74));
          operator new();
        }
        uint64_t v21 = sub_1902B35C0();
        sub_19056EF2C(v21, internal[64], a5);
      }
      uint64_t v26 = sub_1902B4534();
      sub_1902BFA30(v26, v6);
    }
  }
  else
  {
    if (qword_1EB3BE878 != -1) {
      dispatch_once(&qword_1EB3BE878, &unk_1EDFC2080);
    }
    v14 = off_1EB3BE870;
    if (os_log_type_enabled((os_log_t)off_1EB3BE870, OS_LOG_TYPE_INFO))
    {
      sub_1902D6BD0();
      uint64_t v15 = *(void *)_CFGetProgname();
      *(_DWORD *)buf = 136447234;
      uint64_t v44 = v15;
      __int16 v45 = 2050;
      v46 = a3;
      __int16 v47 = 2050;
      v48 = a4;
      __int16 v49 = 2050;
      double v50 = a5;
      __int16 v51 = 1026;
      BOOL v52 = v6;
      _os_log_impl(&dword_1902AF000, v14, OS_LOG_TYPE_INFO, "%{public}s calling setDeviceMotionCallback:%{public}p info:%{public}p interval:%{public}f fsync:%{public}d", buf, 0x30u);
    }
    if (sub_1902D8400(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EB3BE878 != -1) {
        dispatch_once(&qword_1EB3BE878, &unk_1EDFC2080);
      }
      sub_1902D6BD0();
      uint64_t v27 = *(void *)_CFGetProgname();
      int v33 = 136447234;
      uint64_t v34 = v27;
      __int16 v35 = 2050;
      v36 = a3;
      __int16 v37 = 2050;
      v38 = a4;
      __int16 v39 = 2050;
      double v40 = a5;
      __int16 v41 = 1026;
      BOOL v42 = v6;
      v28 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "-[CMMotionManager setDeviceMotionCallback:info:interval:fsync:]", "CoreLocation: %s\n", v28);
      if (v28 != (char *)buf) {
        free(v28);
      }
    }
    uint64_t v16 = sub_1902D6BD0();
    if (a5 <= 0.0)
    {
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = sub_1902DD22C;
      v31[3] = &unk_1E568DEC8;
      v31[4] = self;
      v31[5] = a3;
      v31[6] = a4;
      *(double *)&v31[7] = a5;
      BOOL v32 = v6;
      sub_1902CDE98(v16, (uint64_t)v31);
    }
    else
    {
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = sub_19049CCC0;
      v29[3] = &unk_1E568DEC8;
      v29[4] = self;
      v29[5] = a3;
      v29[6] = a4;
      *(double *)&v29[7] = a5;
      BOOL v30 = v6;
      sub_1902CE9BC(v16, (uint64_t)v29);
    }
  }
}

- (void)onDeviceMotion:(const Sample *)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id internal = self->_internal;
  long long v6 = *(_OWORD *)&a3[3].acceleration.x;
  *(_OWORD *)&v33[64] = *(_OWORD *)&a3[2].acceleration.z;
  *(_OWORD *)&v33[80] = v6;
  Sample v34 = a3[4];
  long long v7 = *(_OWORD *)&a3->acceleration.z;
  *(_OWORD *)int v33 = *(_OWORD *)&a3->timestamp;
  *(_OWORD *)&v33[16] = v7;
  long long v8 = *(_OWORD *)&a3[2].timestamp;
  *(_OWORD *)&v33[32] = *(_OWORD *)&a3[1].acceleration.x;
  *(_OWORD *)&v33[48] = v8;
  if (objc_msgSend_northAlignedReferenceFrame_(CMMotionManager, a2, *((void *)internal + 38)))
  {
    if (*(int *)&v33[76] < 1)
    {
      if (*(_DWORD *)&v33[76] != -1)
      {
        *((unsigned char *)internal + 313) = 0;
        objc_msgSend_showDeviceMovementDisplay(self, v9, v10);
        if (!*((unsigned char *)internal + 315)) {
          *((unsigned char *)internal + 315) = objc_msgSend_sendDeviceMotionError_(self, v9, 101);
        }
      }
    }
    else
    {
      *((unsigned char *)internal + 315) = 0;
      *((unsigned char *)internal + 313) = 1;
      objc_msgSend_dismissDeviceMovementDisplay(self, v9, v10);
    }
  }
  objc_msgSend_applyNorthReference_(self, v9, (uint64_t)v33);
  uint64_t v12 = objc_msgSend_applyInitialReference_(self, v11, (uint64_t)v33);
  if (*((void *)internal + 35))
  {
    if (*((void *)internal + 34))
    {
      if ((HIWORD(v34.acceleration.y) & 0x100) != 0)
      {
        v13.n128_u64[0] = *(void *)v33;
        if (*(double *)v33 > 0.0)
        {
          double v14 = *((double *)internal + 36);
          if (v14 <= 0.0
            || (double v15 = *(double *)v33 - v14,
                double v16 = *((double *)internal + 33),
                v13.n128_f64[0] = v15 - v16,
                v13.n128_f64[0] >= v16 * -0.1))
          {
            v17 = (void *)MEMORY[0x192FCD2F0](v12, v13);
            uint64_t v18 = [CMDeviceMotion alloc];
            v31[2] = *(_OWORD *)&v33[40];
            v31[3] = *(_OWORD *)&v33[56];
            v31[4] = *(_OWORD *)&v33[72];
            uint64_t v32 = *(void *)&v33[88];
            v31[0] = *(_OWORD *)&v33[8];
            v31[1] = *(_OWORD *)&v33[24];
            uint64_t v20 = objc_msgSend_initWithDeviceMotion_internal_timestamp_(v18, v19, (uint64_t)v31, COERCE_DOUBLE(__PAIR64__(*(unsigned int *)&v33[12], LODWORD(v34.timestamp))), *(double *)v33);
            uint64_t v21 = *((void *)internal + 34);
            if (qword_1EB3BE878 != -1) {
              dispatch_once(&qword_1EB3BE878, &unk_1EDFC2080);
            }
            uint64_t v22 = off_1EB3BE870;
            if (os_log_type_enabled((os_log_t)off_1EB3BE870, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v23 = mach_absolute_time();
              double v24 = sub_1902D8D34(v23);
              *(_DWORD *)buf = 138412546;
              double v40 = v20;
              __int16 v41 = 2048;
              double v42 = v24;
              _os_log_impl(&dword_1902AF000, v22, OS_LOG_TYPE_DEBUG, "CMDeviceMotion: %@,now,%f", buf, 0x16u);
            }
            if (sub_1902D8400(115, 2))
            {
              bzero(buf, 0x65CuLL);
              if (qword_1EB3BE878 != -1) {
                dispatch_once(&qword_1EB3BE878, &unk_1EDFC2080);
              }
              uint64_t v27 = mach_absolute_time();
              double v28 = sub_1902D8D34(v27);
              int v35 = 138412546;
              v36 = v20;
              __int16 v37 = 2048;
              double v38 = v28;
              v29 = (char *)_os_log_send_and_compose_impl();
              sub_1902D398C("Generic", 1, 0, 2, "-[CMMotionManager onDeviceMotion:]", "CoreLocation: %s\n", v29);
              if (v29 != (char *)buf) {
                free(v29);
              }
            }
            uint64_t v26 = (void *)*((void *)internal + 35);
            v30[0] = MEMORY[0x1E4F143A8];
            v30[1] = 3221225472;
            v30[2] = sub_1902DB2D4;
            v30[3] = &unk_1E568D320;
            v30[4] = v20;
            v30[5] = v21;
            objc_msgSend_addOperationWithBlock_(v26, v25, (uint64_t)v30);

            *((void *)internal + 36) = *(void *)&a3->timestamp;
          }
        }
      }
    }
  }
}

- (void)applyNorthReference:(Sample *)a3
{
  id internal = (double *)self->_internal;
  if (*((void *)internal + 38) == 8 && *(double *)(sub_1902B35C0() + 88) < 0.0)
  {
    if (!*((unsigned char *)internal + 316) && a3->timestamp - internal[40] > 1.0) {
      *((unsigned char *)internal + 316) = objc_msgSend_sendDeviceMotionError_(self, v6, 102);
    }
    a3->timestamp = -1.0;
  }
  float v7 = -1.0;
  float v8 = -1.0;
  if ((unint64_t)(*((void *)internal + 38) - 1) >= 2)
  {
    if (a3[3].acceleration.y >= 0.0) {
      return;
    }
    float v7 = 0.0;
    float v8 = 180.0;
  }
  a3[3].acceleration.y = v7;
  *(float *)&a3[4].timestamp = v8;
}

- (void)applyInitialReference:(Sample *)a3
{
  id internal = (float64x2_t *)self->_internal;
  if ((unint64_t)(*(void *)&internal[19].f64[0] - 1) <= 1
    && objc_msgSend_deviceMotionInitialized_(CMMotionManager, a2, (uint64_t)a3))
  {
    if (!LOBYTE(internal[22].f64[1]))
    {
      sub_1902B2690((uint64_t)v6, (double *)&a3->acceleration.x);
      internal[21] = vnegq_f64(*(float64x2_t *)&v6[8]);
      internal[22].f64[0] = -*(double *)&v6[24];
      internal[20].f64[1] = *(float64_t *)v6;
      LOBYTE(internal[22].f64[1]) = 1;
    }
    sub_1902DAB58((double *)v6, (double *)&a3->acceleration.x, &internal[20].f64[1]);
    long long v5 = *(_OWORD *)&v6[16];
    *(_OWORD *)&a3->acceleration.x = *(_OWORD *)v6;
    *(_OWORD *)&a3[1].timestamp = v5;
  }
}

+ (BOOL)northAlignedReferenceFrame:(unint64_t)a3
{
  LOBYTE(v3) = 1;
  if (a3 != 8 && a3 != 4)
  {
    if (a3 == 2) {
      return ((unint64_t)sub_1902CD6B0() >> 4) & 1;
    }
    else {
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

+ (BOOL)deviceMotionInitialized:(Sample *)a3
{
  return HIBYTE(a3[4].acceleration.y) & (a3->timestamp > 0.0);
}

- (void)startDeviceMotionUpdatesToQueue:(NSOperationQueue *)queue withHandler:(CMDeviceMotionHandler)handler
{
  uint64_t v7 = sub_1902D6BD0();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1902DD1E4;
  v8[3] = &unk_1E568D398;
  v8[4] = self;
  v8[5] = queue;
  v8[6] = handler;
  sub_1902CE9BC(v7, (uint64_t)v8);
}

- (void)setDeviceMotionUpdateIntervalPrivate:(double)a3
{
  id internal = self->_internal;
  if (a3 < 0.01) {
    a3 = 0.01;
  }
  *((double *)internal + 33) = a3;
  if (*((void *)internal + 32))
  {
    uint64_t v4 = sub_1902B35C0();
    uint64_t v5 = *((void *)internal + 32);
    double v6 = *((double *)internal + 33);
    sub_19056EF2C(v4, v5, v6);
  }
}

- (void)setDeviceMotionUpdateInterval:(NSTimeInterval)deviceMotionUpdateInterval
{
  uint64_t v5 = sub_1902D6BD0();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1902DD298;
  v6[3] = &unk_1E568DB10;
  v6[4] = self;
  *(NSTimeInterval *)&v6[5] = deviceMotionUpdateInterval;
  sub_1902CDE98(v5, (uint64_t)v6);
}

- (BOOL)isDeviceMotionActive
{
  return *((void *)self->_internal + 32) != 0;
}

- (CMMotionManager)init
{
  uint64_t v7 = 0;
  float v8 = &v7;
  uint64_t v9 = 0x3052000000;
  uint64_t v10 = sub_1902DD110;
  uint64_t v11 = sub_1902DD084;
  uint64_t v12 = 0;
  uint64_t v3 = sub_1902D6BD0();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1902DD2B4;
  v6[3] = &unk_1E568DDB0;
  v6[4] = self;
  v6[5] = &v7;
  sub_1902CDE98(v3, (uint64_t)v6);
  uint64_t v4 = (CMMotionManager *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)dismissDeviceMovementDisplay
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id internal = self->_internal;
  if (internal[312])
  {
    if (qword_1EB3BE878 != -1) {
      dispatch_once(&qword_1EB3BE878, &unk_1EDFC2080);
    }
    uint64_t v3 = off_1EB3BE870;
    if (os_log_type_enabled((os_log_t)off_1EB3BE870, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1902AF000, v3, OS_LOG_TYPE_DEFAULT, "CM: Dismissing Compass Calibration HUD", buf, 2u);
    }
    if (sub_1902D8400(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EB3BE878 != -1) {
        dispatch_once(&qword_1EB3BE878, &unk_1EDFC2080);
      }
      uint64_t v4 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "-[CMMotionManager dismissDeviceMovementDisplay]", "CoreLocation: %s\n", v4);
      if (v4 != (char *)buf) {
        free(v4);
      }
    }
    sub_190542308();
    internal[312] = 0;
  }
}

- (void)didBecomeActivePrivate:(id)a3
{
  id internal = self->_internal;
  uint64_t v5 = (void *)sub_1902B35C0();
  if (v5) {
    sub_1902E0404(v5, 1);
  }
  uint64_t v8 = internal[81];
  if (v8) {
    *(CFAbsoluteTime *)(v8 + 8) = CFAbsoluteTimeGetCurrent();
  }
  *((unsigned char *)internal + 632) = 1;
  if (*((unsigned char *)internal + 314) && !*((unsigned char *)internal + 313))
  {
    objc_msgSend_showDeviceMovementDisplay(self, v6, v7);
  }
}

- (void)didBecomeActive:(id)a3
{
  uint64_t v5 = sub_1902D6BD0();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1902DD2A8;
  v6[3] = &unk_1E568D190;
  v6[4] = self;
  v6[5] = a3;
  sub_1902CE9BC(v5, (uint64_t)v6);
}

- (CMAttitudeReferenceFrame)attitudeReferenceFrame
{
  return *((void *)self->_internal + 38);
}

+ (void)setVirtualAlmondDevice:(id)a3
{
  if (sub_19046BD9C())
  {
    id v4 = a3;

    qword_1E929E808 = (uint64_t)v4;
  }
}

+ (id)virtualAlmondDevice
{
  return (id)qword_1E929E808;
}

- (void)setUseAccelerometer:(BOOL)a3
{
  *((unsigned char *)self->_internal + 537) = a3;
}

- (BOOL)useAccelerometer
{
  return *((unsigned char *)self->_internal + 537);
}

- (void)dealloc
{
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x3052000000;
  v6[3] = sub_1902DD110;
  v6[4] = sub_1902DD084;
  v6[5] = self;
  uint64_t v3 = sub_1902D6BD0();
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_190499348;
  v5[3] = &unk_1E568DDD8;
  v5[4] = v6;
  sub_1902CDE98(v3, (uint64_t)v5);
  v4.receiver = self;
  v4.super_class = (Class)CMMotionManager;
  [(CMMotionManager *)&v4 dealloc];
  _Block_object_dispose(v6, 8);
}

- (void)deallocPrivate
{
  id internal = (void **)self->_internal;
  objc_super v4 = (void *)MEMORY[0x192FCD2F0]();

  uint64_t v7 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v5, v6);
  objc_msgSend_removeObserver_(v7, v8, (uint64_t)self);
  objc_msgSend_cancelAllOperations(internal[5], v9, v10);
  objc_msgSend_cancelAllOperations(internal[27], v11, v12);
  objc_msgSend_cancelAllOperations(internal[35], v13, v14);
  objc_msgSend_cancelAllOperations(internal[78], v15, v16);
  objc_msgSend_cancelAllOperations(internal[49], v17, v18);
  objc_msgSend_cancelAllOperations(internal[13], v19, v20);
  objc_msgSend_stopAccelerometerUpdatesPrivate(self, v21, v22);
  objc_msgSend_stopGyroUpdatesPrivate(self, v23, v24);
  objc_msgSend_stopDeviceMotionUpdatesPrivate(self, v25, v26);
  objc_msgSend__stopDeviceMotionErrorUpdates(self, v27, v28);
  objc_msgSend_stopMagnetometerUpdatesPrivate(self, v29, v30);
  objc_msgSend_stopAmbientPressureUpdatesPrivate(self, v31, v32);
  objc_msgSend_teardownPrivate(self->_internal, v33, v34);
}

- (BOOL)isAccelerometerAvailable
{
  if (sub_1902BACB4()) {
    LOBYTE(v2) = 0;
  }
  else {
    return (sub_1902BB1DC() >> 2) & 1;
  }
  return v2;
}

- (BOOL)isAccelerometerActive
{
  return *((void *)self->_internal + 2) != 0;
}

- (void)setAccelerometerUpdateInterval:(NSTimeInterval)accelerometerUpdateInterval
{
  uint64_t v5 = sub_1902D6BD0();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1904994FC;
  v6[3] = &unk_1E568DB10;
  v6[4] = self;
  *(NSTimeInterval *)&v6[5] = accelerometerUpdateInterval;
  sub_1902CDE98(v5, (uint64_t)v6);
}

- (NSTimeInterval)accelerometerUpdateInterval
{
  return *((double *)self->_internal + 3);
}

- (CMAccelerometerData)accelerometerData
{
  id internal = self->_internal;
  os_unfair_lock_lock((os_unfair_lock_t)internal + 2);
  double v3 = *((double *)internal + 7);
  int v4 = *((_DWORD *)internal + 16);
  int v5 = *((_DWORD *)internal + 17);
  int v6 = *((_DWORD *)internal + 18);
  os_unfair_lock_unlock((os_unfair_lock_t)internal + 2);
  if (v3 <= 0.0) {
    return 0;
  }
  uint64_t v7 = [CMAccelerometerData alloc];
  LODWORD(v8) = v4;
  LODWORD(v9) = v5;
  LODWORD(v10) = v6;
  __n128 v13 = objc_msgSend_initWithAcceleration_andTimestamp_(v7, v11, v12, v8, v9, v10, v3);

  return (CMAccelerometerData *)v13;
}

- (void)startAccelerometerUpdates
{
  uint64_t v3 = sub_1902D6BD0();
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_190499634;
  v4[3] = &unk_1E568D118;
  v4[4] = self;
  sub_1902CE9BC(v3, (uint64_t)v4);
}

- (void)startAccelerometerUpdatesToQueue:(NSOperationQueue *)queue withHandler:(CMAccelerometerHandler)handler
{
  uint64_t v7 = sub_1902D6BD0();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1904996D4;
  v8[3] = &unk_1E568D398;
  v8[4] = self;
  v8[5] = queue;
  v8[6] = handler;
  sub_1902CE9BC(v7, (uint64_t)v8);
}

- (void)stopAccelerometerUpdates
{
  uint64_t v3 = sub_1902D6BD0();
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_190499760;
  v4[3] = &unk_1E568D118;
  v4[4] = self;
  sub_1902CDE98(v3, (uint64_t)v4);
}

- (void)setAccelerometerUpdateIntervalPrivate:(double)a3
{
  id internal = self->_internal;
  if (a3 < 0.01) {
    a3 = 0.01;
  }
  *((double *)internal + 3) = a3;
  if (*((void *)internal + 2))
  {
    uint64_t v4 = sub_1902DFEC4();
    uint64_t v5 = *((void *)internal + 2);
    sub_1904DC320(v4, 0, v5, (uint64_t)internal + 24);
  }
}

- (void)startAccelerometerUpdatesPrivateToQueue:(id)a3 withHandler:(id)a4
{
  id internal = (double *)self->_internal;
  if (objc_msgSend_isAccelerometerAvailable(self, a2, (uint64_t)a3) && internal[3] > 0.0)
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

- (void)stopAccelerometerUpdatesPrivate
{
  id internal = (uint64_t *)self->_internal;
  if (objc_msgSend_isAccelerometerAvailable(self, a2, v2))
  {
    if (internal[2])
    {
      uint64_t v4 = sub_1902DFEC4();
      sub_1902CDE08(v4, 0, internal[2]);
      uint64_t v5 = internal[2];
      if (v5) {
        (*(void (**)(uint64_t))(*(void *)v5 + 8))(v5);
      }
      internal[2] = 0;
      int v6 = (unsigned __int8 *)internal[81];
      if (v6) {
        sub_19057C928(v6, 1);
      }
    }
    id v7 = (void *)internal[5];
    if (v7)
    {

      internal[5] = 0;
    }
    id v8 = (void *)internal[4];
    if (v8)
    {

      internal[4] = 0;
    }
  }
}

- (BOOL)isAmbientPressureAvailable
{
  if (sub_1902BACB4()) {
    LOBYTE(v2) = 0;
  }
  else {
    return (sub_1902BB1DC() >> 4) & 1;
  }
  return v2;
}

- (void)setAmbientPressureUpdateInterval:(double)a3
{
  uint64_t v5 = sub_1902D6BD0();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_190499A78;
  v6[3] = &unk_1E568DB10;
  v6[4] = self;
  *(double *)&v6[5] = a3;
  sub_1902CDE98(v5, (uint64_t)v6);
}

- (double)ambientPressureUpdateInterval
{
  return *((double *)self->_internal + 11);
}

- (BOOL)isAmbientPressureActive
{
  return *((void *)self->_internal + 10) != 0;
}

- (void)startAmbientPressureUpdates
{
  uint64_t v3 = sub_1902D6BD0();
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_190499B24;
  v4[3] = &unk_1E568D118;
  v4[4] = self;
  sub_1902CE9BC(v3, (uint64_t)v4);
}

- (void)startAmbientPressureUpdatesToQueue:(id)a3 withHandler:(id)a4
{
  uint64_t v7 = sub_1902D6BD0();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_190499BC4;
  v8[3] = &unk_1E568D398;
  v8[4] = self;
  v8[5] = a3;
  v8[6] = a4;
  sub_1902CE9BC(v7, (uint64_t)v8);
}

- (void)stopAmbientPressureUpdates
{
  uint64_t v3 = sub_1902D6BD0();
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_190499C50;
  v4[3] = &unk_1E568D118;
  v4[4] = self;
  sub_1902CDE98(v3, (uint64_t)v4);
}

- (CMAmbientPressureData)ambientPressureData
{
  id internal = self->_internal;
  os_unfair_lock_lock((os_unfair_lock_t)internal + 2);
  double v3 = *((double *)internal + 15);
  int v4 = *((_DWORD *)internal + 32);
  int v5 = *((_DWORD *)internal + 33);
  os_unfair_lock_unlock((os_unfair_lock_t)internal + 2);
  if (v3 <= 0.0) {
    return 0;
  }
  int v6 = [CMAmbientPressureData alloc];
  LODWORD(v7) = v4;
  LODWORD(v8) = v5;
  uint64_t v11 = objc_msgSend_initWithPressure_andTimestamp_(v6, v9, v10, v7, v8, v3);

  return (CMAmbientPressureData *)v11;
}

- (BOOL)readRawAmbientPressureSamplesFromDB:(id)a3 toQueue:(id)a4 where:(id)a5 withHandler:(id)a6
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = (char *)objc_msgSend_UTF8String(a3, a2, (uint64_t)a3);
  sub_1902C3F54(__p, v10);
  long long v31 = 0uLL;
  uint64_t v32 = 0;
  long long v26 = 0uLL;
  uint64_t v27 = 0;
  sub_1904CBDBC((uint64_t)v28, __p, &v31, &v26);
  if (v30 < 0) {
    operator delete(*(void **)__p);
  }
  if (!v28[0])
  {
    if (qword_1E929D788 != -1) {
      dispatch_once(&qword_1E929D788, &unk_1EDFD4340);
    }
    uint64_t v16 = qword_1E929D780;
    if (os_log_type_enabled((os_log_t)qword_1E929D780, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)__p = 138412290;
      *(void *)&__p[4] = a3;
      _os_log_impl(&dword_1902AF000, v16, OS_LOG_TYPE_FAULT, "%@ is invalid", __p, 0xCu);
    }
    if (sub_1902D8400(115, 0))
    {
      bzero(__p, 0x65CuLL);
      if (qword_1E929D788 != -1) {
        dispatch_once(&qword_1E929D788, &unk_1EDFD4340);
      }
      LODWORD(v31) = 138412290;
      *(void *)((char *)&v31 + 4) = a3;
      v17 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 0, "-[CMMotionManager readRawAmbientPressureSamplesFromDB:toQueue:where:withHandler:]", "CoreLocation: %s\n", v17);
      if (v17 != __p) {
        free(v17);
      }
    }
    goto LABEL_18;
  }
  __n128 v13 = (char *)objc_msgSend_UTF8String(a5, v11, v12);
  sub_1902C3F54(__p, v13);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = sub_19049A074;
  v25[3] = &unk_1E568DE00;
  v25[4] = a4;
  v25[5] = a6;
  char v14 = sub_1904CCB6C((uint64_t)v28, (const void **)__p, (uint64_t)v25);
  char v15 = v14;
  if (v30 < 0)
  {
    operator delete(*(void **)__p);
    if ((v15 & 1) == 0)
    {
LABEL_18:
      BOOL v22 = 0;
      goto LABEL_19;
    }
  }
  else if ((v14 & 1) == 0)
  {
    goto LABEL_18;
  }
  id v18 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v20 = objc_msgSend_initWithDomain_code_userInfo_(v18, v19, @"CMErrorDomain", 109, 0);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = sub_19049A12C;
  v24[3] = &unk_1E568D320;
  v24[4] = v20;
  v24[5] = a6;
  objc_msgSend_addOperationWithBlock_(a4, v21, (uint64_t)v24);

  BOOL v22 = 1;
LABEL_19:
  sub_1904CBBE8((uint64_t)v28);
  return v22;
}

- (id)computeNonlinearPRTTFromDB:(id)a3 where:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  int v6 = (char *)objc_msgSend_UTF8String(a3, a2, (uint64_t)a3);
  sub_1902C3F54(buf, v6);
  double v9 = (char *)objc_msgSend_UTF8String(a4, v7, v8);
  sub_1902C3F54(v20, v9);
  char v11 = sub_1904CD02C(buf, v20);
  if (v23 < 0) {
    operator delete(*(void **)v20);
  }
  if (v19 < 0)
  {
    operator delete(*(void **)buf);
    if (v11) {
      return (id)objc_msgSend_dataWithBytes_length_(MEMORY[0x1E4F1C9B8], v10, (uint64_t)v15, 222);
    }
  }
  else if (v11)
  {
    return (id)objc_msgSend_dataWithBytes_length_(MEMORY[0x1E4F1C9B8], v10, (uint64_t)v15, 222);
  }
  if (qword_1E929D788 != -1) {
    dispatch_once(&qword_1E929D788, &unk_1EDFD4340);
  }
  __n128 v13 = qword_1E929D780;
  if (os_log_type_enabled((os_log_t)qword_1E929D780, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = a3;
    __int16 v17 = 2112;
    id v18 = a4;
    _os_log_impl(&dword_1902AF000, v13, OS_LOG_TYPE_FAULT, "Failed to calculate PRTT for %@ WHERE %@", buf, 0x16u);
  }
  if (sub_1902D8400(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929D788 != -1) {
      dispatch_once(&qword_1E929D788, &unk_1EDFD4340);
    }
    *(_DWORD *)uint64_t v20 = 138412546;
    *(void *)&v20[4] = a3;
    __int16 v21 = 2112;
    id v22 = a4;
    char v14 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 0, "-[CMMotionManager computeNonlinearPRTTFromDB:where:]", "CoreLocation: %s\n", v14);
    if (v14 != buf) {
      free(v14);
    }
  }
  return 0;
}

- (void)setCompensatedAmbientPressureUpdateInterval:(double)a3
{
  uint64_t v5 = sub_1902D6BD0();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_19049A464;
  v6[3] = &unk_1E568DB10;
  v6[4] = self;
  *(double *)&v6[5] = a3;
  sub_1902CDE98(v5, (uint64_t)v6);
}

- (double)compensatedAmbientPressureUpdateInterval
{
  return *((double *)self->_internal + 18);
}

- (BOOL)isCompensatedAmbientPressureActive
{
  return *((void *)self->_internal + 17) != 0;
}

- (void)startCompensatedAmbientPressureUpdates
{
  uint64_t v3 = sub_1902D6BD0();
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_19049A510;
  v4[3] = &unk_1E568D118;
  v4[4] = self;
  sub_1902CE9BC(v3, (uint64_t)v4);
}

- (void)startCompensatedAmbientPressureUpdatesToQueue:(id)a3 withHandler:(id)a4
{
  uint64_t v7 = sub_1902D6BD0();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_19049A5B0;
  v8[3] = &unk_1E568D398;
  v8[4] = self;
  v8[5] = a3;
  v8[6] = a4;
  sub_1902CE9BC(v7, (uint64_t)v8);
}

- (void)stopCompensatedAmbientPressureUpdates
{
  uint64_t v3 = sub_1902D6BD0();
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_19049A63C;
  v4[3] = &unk_1E568D118;
  v4[4] = self;
  sub_1902CDE98(v3, (uint64_t)v4);
}

- (CMAmbientPressureData)compensatedAmbientPressureData
{
  id internal = self->_internal;
  os_unfair_lock_lock((os_unfair_lock_t)internal + 2);
  double v3 = *((double *)internal + 22);
  int v4 = *((_DWORD *)internal + 46);
  int v5 = *((_DWORD *)internal + 47);
  os_unfair_lock_unlock((os_unfair_lock_t)internal + 2);
  if (v3 <= 0.0) {
    return 0;
  }
  int v6 = [CMAmbientPressureData alloc];
  LODWORD(v7) = v4;
  LODWORD(v8) = v5;
  char v11 = objc_msgSend_initWithPressure_andTimestamp_(v6, v9, v10, v7, v8, v3);

  return (CMAmbientPressureData *)v11;
}

- (void)setAmbientPressureUpdateIntervalPrivate:(double)a3
{
  id internal = self->_internal;
  if (a3 < 0.01) {
    a3 = 0.01;
  }
  *((double *)internal + 11) = a3;
  if (*((void *)internal + 10))
  {
    uint64_t v4 = sub_19048B344();
    uint64_t v5 = *((void *)internal + 10);
    sub_1904DC320(v4, 0, v5, (uint64_t)internal + 88);
  }
}

- (void)startAmbientPressureUpdatesPrivateToQueue:(id)a3 withHandler:(id)a4
{
  id internal = (double *)self->_internal;
  if (objc_msgSend_isAmbientPressureAvailable(self, a2, (uint64_t)a3) && internal[11] > 0.0)
  {
    id v7 = (id)*((void *)internal + 13);
    if (v7 != a3)
    {

      *((void *)internal + 13) = a3;
    }
    id v8 = (id)*((void *)internal + 12);
    if (v8 != a4)
    {

      *((void *)internal + 12) = objc_msgSend_copy(a4, v9, v10);
    }
    if (!*((void *)internal + 10)) {
      operator new();
    }
  }
}

- (void)stopAmbientPressureUpdatesPrivate
{
  id internal = (uint64_t *)self->_internal;
  if (objc_msgSend_isAmbientPressureAvailable(self, a2, v2))
  {
    if (internal[10])
    {
      uint64_t v4 = sub_19048B344();
      sub_1902CDE08(v4, 0, internal[10]);
      uint64_t v5 = internal[10];
      if (v5) {
        (*(void (**)(uint64_t))(*(void *)v5 + 8))(v5);
      }
      internal[10] = 0;
    }
    int v6 = (void *)internal[13];
    if (v6)
    {

      internal[13] = 0;
    }
    id v7 = (void *)internal[12];
    if (v7)
    {

      internal[12] = 0;
    }
  }
}

- (void)setCompensatedAmbientPressureUpdateIntervalPrivate:(double)a3
{
  id internal = self->_internal;
  if (a3 < 0.01) {
    a3 = 0.01;
  }
  *((double *)internal + 18) = a3;
  if (*((void *)internal + 17))
  {
    uint64_t v4 = sub_19048B344();
    uint64_t v5 = *((void *)internal + 17);
    sub_1904DC320(v4, 0, v5, (uint64_t)internal + 144);
  }
}

- (void)startCompensatedAmbientPressureUpdatesPrivateToQueue:(id)a3 withHandler:(id)a4
{
  id internal = (double *)self->_internal;
  if (objc_msgSend_isAmbientPressureAvailable(self, a2, (uint64_t)a3) && internal[18] > 0.0)
  {
    id v7 = (id)*((void *)internal + 20);
    if (v7 != a3)
    {

      *((void *)internal + 20) = a3;
    }
    id v8 = (id)*((void *)internal + 19);
    if (v8 != a4)
    {

      *((void *)internal + 19) = objc_msgSend_copy(a4, v9, v10);
    }
    if (!*((void *)internal + 17)) {
      operator new();
    }
  }
}

- (void)stopCompensatedAmbientPressureUpdatesPrivate
{
  id internal = (uint64_t *)self->_internal;
  if (objc_msgSend_isAmbientPressureAvailable(self, a2, v2))
  {
    if (internal[17])
    {
      uint64_t v4 = sub_19048B344();
      sub_1902CDE08(v4, 1, internal[17]);
      uint64_t v5 = internal[17];
      if (v5) {
        (*(void (**)(uint64_t))(*(void *)v5 + 8))(v5);
      }
      internal[17] = 0;
    }
    int v6 = (void *)internal[20];
    if (v6)
    {

      internal[20] = 0;
    }
    id v7 = (void *)internal[19];
    if (v7)
    {

      internal[19] = 0;
    }
  }
}

- (BOOL)isGyroAvailable
{
  return (sub_1902BACB4() & 1) == 0 && (sub_1902CD6B0() & 0x100000) == 0;
}

- (BOOL)isGyroActive
{
  return *((void *)self->_internal + 24) != 0;
}

- (void)setGyroUpdateInterval:(NSTimeInterval)gyroUpdateInterval
{
  uint64_t v5 = sub_1902D6BD0();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_19049AC2C;
  v6[3] = &unk_1E568DB10;
  v6[4] = self;
  *(NSTimeInterval *)&v6[5] = gyroUpdateInterval;
  sub_1902CDE98(v5, (uint64_t)v6);
}

- (NSTimeInterval)gyroUpdateInterval
{
  return *((double *)self->_internal + 25);
}

- (CMGyroData)gyroData
{
  id internal = self->_internal;
  os_unfair_lock_lock((os_unfair_lock_t)internal + 2);
  double v3 = *((double *)internal + 29);
  int v4 = *((_DWORD *)internal + 60);
  int v5 = *((_DWORD *)internal + 61);
  int v6 = *((_DWORD *)internal + 62);
  os_unfair_lock_unlock((os_unfair_lock_t)internal + 2);
  if (v3 <= 0.0) {
    return 0;
  }
  id v7 = [CMGyroData alloc];
  LODWORD(v8) = v4;
  LODWORD(v9) = v5;
  LODWORD(v10) = v6;
  __n128 v13 = objc_msgSend_initWithRotationRate_andTimestamp_(v7, v11, v12, v8, v9, v10, v3);

  return (CMGyroData *)v13;
}

- (void)startGyroUpdates
{
  uint64_t v3 = sub_1902D6BD0();
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_19049AD64;
  v4[3] = &unk_1E568D118;
  v4[4] = self;
  sub_1902CE9BC(v3, (uint64_t)v4);
}

- (void)startGyroUpdatesToQueue:(NSOperationQueue *)queue withHandler:(CMGyroHandler)handler
{
  uint64_t v7 = sub_1902D6BD0();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_19049AE04;
  v8[3] = &unk_1E568D398;
  v8[4] = self;
  v8[5] = queue;
  v8[6] = handler;
  sub_1902CE9BC(v7, (uint64_t)v8);
}

- (void)stopGyroUpdates
{
  uint64_t v3 = sub_1902D6BD0();
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_19049AE90;
  v4[3] = &unk_1E568D118;
  v4[4] = self;
  sub_1902CDE98(v3, (uint64_t)v4);
}

- (void)setGyroUpdateIntervalPrivate:(double)a3
{
  id internal = self->_internal;
  if (a3 < 0.01) {
    a3 = 0.01;
  }
  *((double *)internal + 25) = a3;
  if (*((void *)internal + 24))
  {
    uint64_t v4 = sub_1902B4534();
    uint64_t v5 = *((void *)internal + 24);
    sub_1904DC320(v4, 0, v5, (uint64_t)internal + 200);
  }
}

- (void)startGyroUpdatesPrivateToQueue:(id)a3 withHandler:(id)a4
{
  id internal = (double *)self->_internal;
  if ((sub_1902BACB4() & 1) == 0 && (sub_1902CD6B0() & 0x100000) == 0 && internal[25] > 0.0)
  {
    id v7 = (id)*((void *)internal + 27);
    if (v7 != a3)
    {

      *((void *)internal + 27) = a3;
    }
    id v8 = (id)*((void *)internal + 26);
    if (v8 != a4)
    {

      *((void *)internal + 26) = objc_msgSend_copy(a4, v9, v10);
    }
    if (!*((void *)internal + 24)) {
      operator new();
    }
  }
}

- (void)stopGyroUpdatesPrivate
{
  id internal = (uint64_t *)self->_internal;
  if ((sub_1902BACB4() & 1) == 0 && (sub_1902CD6B0() & 0x100000) == 0)
  {
    if (internal[24])
    {
      uint64_t v3 = sub_1902B4534();
      sub_1902CDE08(v3, 0, internal[24]);
      uint64_t v4 = internal[24];
      if (v4) {
        (*(void (**)(uint64_t))(*(void *)v4 + 8))(v4);
      }
      internal[24] = 0;
      uint64_t v5 = (unsigned __int8 *)internal[81];
      if (v5) {
        sub_19057C928(v5, 2);
      }
    }
    int v6 = (void *)internal[27];
    if (v6)
    {

      internal[27] = 0;
    }
    id v7 = (void *)internal[26];
    if (v7)
    {

      internal[26] = 0;
    }
  }
}

- (NSTimeInterval)deviceMotionUpdateInterval
{
  return *((double *)self->_internal + 33);
}

- (CMDeviceMotion)deviceMotion
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id internal = self->_internal;
  if (!objc_msgSend_isDeviceMotionActive(self, a2, v2)) {
    return 0;
  }
  if (!internal[74]) {
    return 0;
  }
  uint64_t v5 = sub_1902B35C0();
  *(float *)&double v7 = sub_19056F524(v5, internal[74], (uint64_t)&v23, v6);
  objc_msgSend_applyNorthReference_(self, v8, (uint64_t)&v23, v7);
  objc_msgSend_applyInitialReference_(self, v9, (uint64_t)&v23);
  if (!objc_msgSend_deviceMotionInitialized_(CMMotionManager, v10, (uint64_t)&v23)) {
    return 0;
  }
  char v11 = [CMDeviceMotion alloc];
  v21[2] = v26;
  v21[3] = v27;
  v21[4] = v28;
  uint64_t v22 = v29;
  v21[0] = v24;
  v21[1] = v25;
  __n128 v13 = (CMDeviceMotion *)(id)objc_msgSend_initWithDeviceMotion_internal_timestamp_(v11, v12, (uint64_t)v21, COERCE_DOUBLE(__PAIR64__(DWORD1(v24), v30)), v23);
  if (qword_1EB3BE878 != -1) {
    dispatch_once(&qword_1EB3BE878, &unk_1EDFC2080);
  }
  char v14 = off_1EB3BE870;
  if (os_log_type_enabled((os_log_t)off_1EB3BE870, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v15 = mach_absolute_time();
    double v16 = sub_1902D8D34(v15);
    *(_DWORD *)buf = 138412546;
    v36 = v13;
    __int16 v37 = 2048;
    double v38 = v16;
    _os_log_impl(&dword_1902AF000, v14, OS_LOG_TYPE_DEBUG, "CMDeviceMotion: %@,now,%f", buf, 0x16u);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EB3BE878 != -1) {
      dispatch_once(&qword_1EB3BE878, &unk_1EDFC2080);
    }
    uint64_t v17 = mach_absolute_time();
    double v18 = sub_1902D8D34(v17);
    int v31 = 138412546;
    uint64_t v32 = v13;
    __int16 v33 = 2048;
    double v34 = v18;
    char v19 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CMMotionManager deviceMotion]", "CoreLocation: %s\n", v19);
    if (v19 != (char *)buf) {
      free(v19);
    }
  }
  return v13;
}

- (void)startDeviceMotionUpdates
{
  uint64_t v3 = sub_1902D6BD0();
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_19049B404;
  v4[3] = &unk_1E568D118;
  v4[4] = self;
  sub_1902CE9BC(v3, (uint64_t)v4);
}

- (void)startDeviceMotionUpdatesUsingReferenceFrame:(CMAttitudeReferenceFrame)referenceFrame
{
  uint64_t v5 = sub_1902D6BD0();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_19049B4CC;
  v6[3] = &unk_1E568DB10;
  v6[4] = self;
  v6[5] = referenceFrame;
  sub_1902CE9BC(v5, (uint64_t)v6);
}

- (void)startDeviceMotionUpdatesUsingReferenceFrame:(CMAttitudeReferenceFrame)referenceFrame toQueue:(NSOperationQueue *)queue withHandler:(CMDeviceMotionHandler)handler
{
  uint64_t v9 = sub_1902D6BD0();
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_19049B574;
  v10[3] = &unk_1E568DE28;
  v10[4] = self;
  v10[5] = queue;
  v10[6] = handler;
  v10[7] = referenceFrame;
  sub_1902CE9BC(v9, (uint64_t)v10);
}

- (void)stopDeviceMotionUpdates
{
  uint64_t v3 = sub_1902D6BD0();
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_19049B600;
  v4[3] = &unk_1E568D118;
  v4[4] = self;
  sub_1902CDE98(v3, (uint64_t)v4);
}

- (void)stopDeviceMotionUpdatesPrivate
{
  id internal = (char *)self->_internal;
  if (objc_msgSend_isDeviceMotionAvailable(self, a2, v2))
  {
    *(_WORD *)(internal + 315) = 0;
    if (*((void *)internal + 32))
    {
      uint64_t v8 = sub_1902B35C0();
      sub_1902E02F4(v8, *((void *)internal + 32));
      uint64_t v9 = *((void *)internal + 32);
      if (v9) {
        (*(void (**)(uint64_t))(*(void *)v9 + 8))(v9);
      }
      *((void *)internal + 32) = 0;
      uint64_t v10 = (unsigned __int8 *)*((void *)internal + 81);
      if (v10) {
        double v7 = sub_19057C928(v10, 4);
      }
    }
    char v11 = (void *)*((void *)internal + 35);
    if (v11)
    {

      *((void *)internal + 35) = 0;
    }
    uint64_t v12 = (void *)*((void *)internal + 34);
    if (v12)
    {

      *((void *)internal + 34) = 0;
    }
    objc_msgSend_dismissDeviceMovementDisplay(self, v5, v6, v7);
    internal[314] = 0;
  }
}

+ (void)dumpDb:(int64_t)a3 toURL:(id)a4 onCompletion:(id)a5
{
  v30[1] = *MEMORY[0x1E4F143B8];
  uint64_t v9 = objc_msgSend_fileHandleForWritingToURL_(CMMotionUtils, a2, (uint64_t)a4);
  if (!v9)
  {
    uint64_t v29 = @"CMReturnCode";
    v30[0] = MEMORY[0x1E4F1CC28];
    uint64_t v10 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v8, (uint64_t)v30, &v29, 1);
    (*((void (**)(id, uint64_t))a5 + 2))(a5, v10);
  }
  long long v27 = @"CMDatabaseType";
  uint64_t v28 = objc_msgSend_numberWithInteger_(NSNumber, v8, a3);
  uint64_t v24 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v11, (uint64_t)&v28, &v27, 1);
  sub_190453D3C("kCLConnectionMessageWriteDbToFile", &v24, &v25);
  uint64_t v12 = v25;
  objc_msgSend_fileDescriptor(v9, v13, v14);
  CLConnectionMessage::setFileDescriptor(v12);
  uint64_t v15 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  uint64_t v20 = objc_msgSend_setWithObjects_(v15, v18, v16, v17, 0);
  uint64_t v22 = v25;
  double v23 = v26;
  if (v26) {
    atomic_fetch_add_explicit(&v26->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = sub_19049B910;
  v21[3] = &unk_1E568DE50;
  v21[4] = a4;
  _OWORD v21[5] = a5;
  objc_msgSend_sendMessage_withReplyClasses_callback_(CMMotionUtils, v19, (uint64_t)&v22, v20, v21);
  if (v23) {
    sub_1902D8B58(v23);
  }
  if (v26) {
    sub_1902D8B58(v26);
  }
}

- (void)rebuildGytt
{
  id internal = self->_internal;
  if (objc_msgSend_isDeviceMotionAvailable(self, a2, v2))
  {
    objc_msgSend_stopDeviceMotionUpdates(self, v5, v6);
    uint64_t v7 = sub_1902D6BD0();
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = sub_19049BA48;
    v8[3] = &unk_1E568D190;
    v8[4] = internal;
    v8[5] = self;
    sub_1902CE9BC(v7, (uint64_t)v8);
  }
}

- (int)gyttNumTemperatures
{
  uint64_t v2 = (void *)sub_1904DF754();
  uint64_t v5 = objc_msgSend_vendor(v2, v3, v4);
  uint64_t v7 = objc_msgSend_proxyForService_(v5, v6, @"CLGyroCalibrationDatabase");
  if (!v7) {
    return -2;
  }

  return MEMORY[0x1F4181798](v7, sel_syncgetNumTemperatures, v8);
}

- (BOOL)isMagnetometerAvailable
{
  if (sub_1902BACB4()) {
    return 0;
  }
  else {
    return sub_1902BB1DC() & 1;
  }
}

- (BOOL)isMagnetometerActive
{
  return *((void *)self->_internal + 46) != 0;
}

- (void)setMagnetometerUpdateInterval:(NSTimeInterval)magnetometerUpdateInterval
{
  uint64_t v5 = sub_1902D6BD0();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_19049BCB8;
  v6[3] = &unk_1E568DB10;
  v6[4] = self;
  *(NSTimeInterval *)&v6[5] = magnetometerUpdateInterval;
  sub_1902CDE98(v5, (uint64_t)v6);
}

- (NSTimeInterval)magnetometerUpdateInterval
{
  return *((double *)self->_internal + 47);
}

- (CMMagnetometerData)magnetometerData
{
  id internal = self->_internal;
  os_unfair_lock_lock((os_unfair_lock_t)internal + 2);
  double v3 = *((double *)internal + 51);
  int v4 = *((_DWORD *)internal + 104);
  int v5 = *((_DWORD *)internal + 105);
  int v6 = *((_DWORD *)internal + 106);
  os_unfair_lock_unlock((os_unfair_lock_t)internal + 2);
  if (v3 <= 0.0) {
    return 0;
  }
  uint64_t v7 = [CMMagnetometerData alloc];
  LODWORD(v8) = v4;
  LODWORD(v9) = v5;
  LODWORD(v10) = v6;
  __n128 v13 = objc_msgSend_initWithMagneticField_andTimestamp_(v7, v11, v12, v8, v9, v10, v3);

  return (CMMagnetometerData *)v13;
}

- (void)startMagnetometerUpdates
{
  uint64_t v3 = sub_1902D6BD0();
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_19049BDF4;
  v4[3] = &unk_1E568D118;
  v4[4] = self;
  sub_1902CE9BC(v3, (uint64_t)v4);
}

- (void)startMagnetometerUpdatesToQueue:(NSOperationQueue *)queue withHandler:(CMMagnetometerHandler)handler
{
  uint64_t v7 = sub_1902D6BD0();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_19049BE94;
  v8[3] = &unk_1E568D398;
  v8[4] = self;
  v8[5] = queue;
  void v8[6] = handler;
  sub_1902CE9BC(v7, (uint64_t)v8);
}

- (void)stopMagnetometerUpdates
{
  uint64_t v3 = sub_1902D6BD0();
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_19049BF20;
  v4[3] = &unk_1E568D118;
  v4[4] = self;
  sub_1902CDE98(v3, (uint64_t)v4);
}

- (void)setMagnetometerUpdateIntervalPrivate:(double)a3
{
  id internal = self->_internal;
  if (a3 < 0.01) {
    a3 = 0.01;
  }
  *((double *)internal + 47) = a3;
  if (*((void *)internal + 46))
  {
    uint64_t v4 = sub_1904DB124();
    uint64_t v5 = *((void *)internal + 46);
    sub_1904DC320(v4, 0, v5, (uint64_t)internal + 376);
  }
}

- (void)startMagnetometerUpdatesPrivateToQueue:(id)a3 withHandler:(id)a4
{
  id internal = (double *)self->_internal;
  if ((sub_1902BACB4() & 1) == 0 && (sub_1902BB1DC() & 1) != 0 && internal[47] > 0.0)
  {
    id v7 = (id)*((void *)internal + 49);
    if (v7 != a3)
    {

      *((void *)internal + 49) = a3;
    }
    id v8 = (id)*((void *)internal + 48);
    if (v8 != a4)
    {

      *((void *)internal + 48) = objc_msgSend_copy(a4, v9, v10);
    }
    if (!*((void *)internal + 46)) {
      operator new();
    }
  }
}

- (void)stopMagnetometerUpdatesPrivate
{
  id internal = (uint64_t *)self->_internal;
  if (sub_1902BACB4() & 1) == 0 && (sub_1902BB1DC())
  {
    if (internal[46])
    {
      uint64_t v3 = sub_1904DB124();
      sub_1902CDE08(v3, 0, internal[46]);
      uint64_t v4 = internal[46];
      if (v4) {
        (*(void (**)(uint64_t))(*(void *)v4 + 8))(v4);
      }
      internal[46] = 0;
      uint64_t v5 = (unsigned __int8 *)internal[81];
      if (v5) {
        sub_19057C928(v5, 8);
      }
    }
    int v6 = (void *)internal[49];
    if (v6)
    {

      internal[49] = 0;
    }
    id v7 = (void *)internal[48];
    if (v7)
    {

      internal[48] = 0;
    }
  }
}

- (void)setShowsDeviceMovementDisplay:(BOOL)showsDeviceMovementDisplay
{
  uint64_t v5 = sub_1902D6BD0();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_19049C214;
  v6[3] = &unk_1E568DE78;
  v6[4] = self;
  BOOL v7 = showsDeviceMovementDisplay;
  sub_1902CDE98(v5, (uint64_t)v6);
}

- (BOOL)showsDeviceMovementDisplay
{
  return *((unsigned char *)self->_internal + 432);
}

- (void)setShowsDeviceMovementDisplayPrivate:(BOOL)a3
{
  *((unsigned char *)self->_internal + 432) = a3;
  if (!a3) {
    objc_msgSend_dismissDeviceMovementDisplay(self, a2, a3);
  }
}

- (void)showDeviceMovementDisplay
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if ((sub_1902CD6B0() & 0x10) == 0)
  {
    id internal = self->_internal;
    if (internal[432])
    {
      if (internal[632] && !internal[312] && !internal[313] && internal[314])
      {
        if (qword_1EB3BE878 != -1) {
          dispatch_once(&qword_1EB3BE878, &unk_1EDFC2080);
        }
        uint64_t v4 = off_1EB3BE870;
        if (os_log_type_enabled((os_log_t)off_1EB3BE870, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1902AF000, v4, OS_LOG_TYPE_DEFAULT, "CM: Invoking Compass Calibration HUD", buf, 2u);
        }
        if (sub_1902D8400(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1EB3BE878 != -1) {
            dispatch_once(&qword_1EB3BE878, &unk_1EDFC2080);
          }
          uint64_t v5 = (char *)_os_log_send_and_compose_impl();
          sub_1902D398C("Generic", 1, 0, 2, "-[CMMotionManager showDeviceMovementDisplay]", "CoreLocation: %s\n", v5);
          if (v5 != (char *)buf) {
            free(v5);
          }
        }
        if (sub_190542028()) {
          internal[312] = 1;
        }
      }
    }
  }
}

- (id)initUsing6AxisSensorFusion
{
  id result = (id)objc_msgSend_init(self, a2, v2);
  if (result) {
    *(_WORD *)(*((void *)result + 1) + 536) = 256;
  }
  return result;
}

- (id)initUsingGyroOnlySensorFusion
{
  id result = (id)objc_msgSend_init(self, a2, v2);
  if (result) {
    *(_WORD *)(*((void *)result + 1) + 536) = 0;
  }
  return result;
}

- (void)setAccelerometerDataCallback:(void *)a3 info:(void *)a4 interval:(double)a5
{
  double v20 = a5;
  CFRunLoopRef Current = CFRunLoopGetCurrent();
  sub_1902D6BD0();
  if (Current == *(CFRunLoopRef *)qword_1EB3BF828)
  {
    if (objc_msgSend_isAccelerometerAvailable(self, v10, v11))
    {
      id internal = (uint64_t *)self->_internal;
      internal[56] = (uint64_t)a3;
      internal[57] = (uint64_t)a4;
      uint64_t v14 = internal[55];
      if (a5 <= 0.0)
      {
        if (v14)
        {
          uint64_t v16 = sub_1902DFEC4();
          sub_1902CDE08(v16, 0, internal[55]);
          uint64_t v17 = internal[55];
          if (v17) {
            (*(void (**)(uint64_t))(*(void *)v17 + 8))(v17);
          }
          internal[55] = 0;
        }
      }
      else
      {
        if (!v14) {
          operator new();
        }
        uint64_t v15 = sub_1902DFEC4();
        sub_1904DC320(v15, 0, internal[55], (uint64_t)&v20);
      }
    }
  }
  else
  {
    uint64_t v12 = sub_1902D6BD0();
    if (a5 <= 0.0)
    {
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = sub_19049C6E0;
      v19[3] = &unk_1E568DEA0;
      v19[4] = self;
      v19[5] = a3;
      v19[6] = a4;
      *(double *)&v19[7] = a5;
      sub_1902CDE98(v12, (uint64_t)v19);
    }
    else
    {
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = sub_19049C6F4;
      v18[3] = &unk_1E568DEA0;
      v18[4] = self;
      v18[5] = a3;
      v18[6] = a4;
      *(double *)&v18[7] = a5;
      sub_1902CE9BC(v12, (uint64_t)v18);
    }
  }
}

- (void)setGyroDataCallback:(void *)a3 info:(void *)a4 interval:(double)a5
{
  double v18 = a5;
  CFRunLoopRef Current = CFRunLoopGetCurrent();
  sub_1902D6BD0();
  if (Current == *(CFRunLoopRef *)qword_1EB3BF828)
  {
    if ((sub_1902BACB4() & 1) == 0 && (sub_1902CD6B0() & 0x100000) == 0)
    {
      id internal = (uint64_t *)self->_internal;
      internal[59] = (uint64_t)a3;
      internal[60] = (uint64_t)a4;
      uint64_t v12 = internal[58];
      if (a5 <= 0.0)
      {
        if (v12)
        {
          uint64_t v14 = sub_1902B4534();
          sub_1902CDE08(v14, 0, internal[58]);
          uint64_t v15 = internal[58];
          if (v15) {
            (*(void (**)(uint64_t))(*(void *)v15 + 8))(v15);
          }
          internal[58] = 0;
        }
      }
      else
      {
        if (!v12) {
          operator new();
        }
        uint64_t v13 = sub_1902B4534();
        sub_1904DC320(v13, 0, internal[58], (uint64_t)&v18);
      }
    }
  }
  else
  {
    uint64_t v10 = sub_1902D6BD0();
    if (a5 <= 0.0)
    {
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = sub_19049C980;
      v17[3] = &unk_1E568DEA0;
      v17[4] = self;
      v17[5] = a3;
      v17[6] = a4;
      *(double *)&v17[7] = a5;
      sub_1902CDE98(v10, (uint64_t)v17);
    }
    else
    {
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = sub_19049C994;
      v16[3] = &unk_1E568DEA0;
      v16[4] = self;
      v16[5] = a3;
      v16[6] = a4;
      *(double *)&v16[7] = a5;
      sub_1902CE9BC(v10, (uint64_t)v16);
    }
  }
}

- (void)setMagnetometerDataCallback:(void *)a3 info:(void *)a4 interval:(double)a5
{
  double v18 = a5;
  CFRunLoopRef Current = CFRunLoopGetCurrent();
  sub_1902D6BD0();
  if (Current == *(CFRunLoopRef *)qword_1EB3BF828)
  {
    if (sub_1902BACB4() & 1) == 0 && (sub_1902BB1DC())
    {
      id internal = (uint64_t *)self->_internal;
      internal[62] = (uint64_t)a3;
      internal[63] = (uint64_t)a4;
      uint64_t v12 = internal[61];
      if (a5 <= 0.0)
      {
        if (v12)
        {
          uint64_t v14 = sub_1904DB124();
          sub_1902CDE08(v14, 0, internal[61]);
          uint64_t v15 = internal[61];
          if (v15) {
            (*(void (**)(uint64_t))(*(void *)v15 + 8))(v15);
          }
          internal[61] = 0;
        }
      }
      else
      {
        if (!v12) {
          operator new();
        }
        uint64_t v13 = sub_1904DB124();
        sub_1904DC320(v13, 0, internal[61], (uint64_t)&v18);
      }
    }
  }
  else
  {
    uint64_t v10 = sub_1902D6BD0();
    if (a5 <= 0.0)
    {
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = sub_19049CC20;
      v17[3] = &unk_1E568DEA0;
      v17[4] = self;
      v17[5] = a3;
      v17[6] = a4;
      *(double *)&v17[7] = a5;
      sub_1902CDE98(v10, (uint64_t)v17);
    }
    else
    {
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = sub_19049CC34;
      v16[3] = &unk_1E568DEA0;
      v16[4] = self;
      v16[5] = a3;
      v16[6] = a4;
      *(double *)&v16[7] = a5;
      sub_1902CE9BC(v10, (uint64_t)v16);
    }
  }
}

- (void)updateDeviceMotionMode
{
  id internal = self->_internal;
  if (*((unsigned char *)internal + 536))
  {
    uint64_t v3 = internal[38];
    if (v3 == 8)
    {
      int v4 = 143;
    }
    else if (v3 == 4)
    {
      int v4 = 15;
    }
    else
    {
      int v4 = 7;
    }
  }
  else
  {
    int v5 = *((_DWORD *)internal + 146);
    if (*((unsigned char *)internal + 537))
    {
      if (v5 == 2) {
        int v4 = 67;
      }
      else {
        int v4 = 3;
      }
    }
    else if (v5 == 1)
    {
      int v4 = 34;
    }
    else
    {
      int v4 = 2;
    }
  }
  *((_DWORD *)internal + 74) = v4;
}

- (void)setDisplayGravityHandler:(id)a3 interval:(double)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend_isDisplayGravityAvailable(self, a2, (uint64_t)a3))
  {
    if (qword_1EB3BE878 != -1) {
      dispatch_once(&qword_1EB3BE878, &unk_1EDFC2080);
    }
    uint64_t v7 = off_1EB3BE870;
    if (os_log_type_enabled((os_log_t)off_1EB3BE870, OS_LOG_TYPE_INFO))
    {
      sub_1902D6BD0();
      uint64_t v8 = *(void *)_CFGetProgname();
      *(_DWORD *)buf = 136446722;
      *(void *)long long v25 = v8;
      *(_WORD *)&v25[8] = 2050;
      *(void *)&v25[10] = a3;
      __int16 v26 = 2050;
      double v27 = a4;
      _os_log_impl(&dword_1902AF000, v7, OS_LOG_TYPE_INFO, "%{public}s calling _setDisplayGravityHandler:%{public}p interval:%{public}f", buf, 0x20u);
    }
    if (sub_1902D8400(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EB3BE878 != -1) {
        dispatch_once(&qword_1EB3BE878, &unk_1EDFC2080);
      }
      sub_1902D6BD0();
      uint64_t v13 = *(void *)_CFGetProgname();
      *(_DWORD *)location = 136446722;
      *(void *)&location[4] = v13;
      __int16 v20 = 2050;
      id v21 = a3;
      __int16 v22 = 2050;
      double v23 = a4;
      uint64_t v14 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "-[CMMotionManager setDisplayGravityHandler:interval:]", "CoreLocation: %s\n", v14);
      if (v14 != (char *)buf) {
        free(v14);
      }
    }
    objc_initWeak((id *)location, self);
    if (a3 && a4 > 0.0)
    {
      objc_msgSend_setFDisplayGravityHandler_(self->_internal, v9, (uint64_t)a3);
      uint64_t v10 = sub_1902D6BD0();
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3321888768;
      v15[2] = sub_19049D134;
      v15[3] = &unk_1EDFC3518;
      objc_copyWeak((id *)buf, (id *)location);
      uint64_t v11 = v16;
      *(double *)&v25[4] = a4;
      objc_copyWeak(v16, (id *)buf);
      v16[1] = *(id *)&v25[4];
      sub_1902CE9BC(v10, (uint64_t)v15);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      uint64_t v12 = sub_1902D6BD0();
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3321888768;
      v17[2] = sub_19049D078;
      v17[3] = &unk_1EDFC34B8;
      objc_copyWeak((id *)buf, (id *)location);
      uint64_t v11 = &v18;
      objc_copyWeak(&v18, (id *)buf);
      sub_1902CE9BC(v12, (uint64_t)v17);
      objc_destroyWeak((id *)buf);
    }
    objc_destroyWeak(v11);
    objc_destroyWeak((id *)location);
  }
}

- (void)connect
{
  id internal = self->_internal;
  if (!internal[68])
  {
    internal[69] = dispatch_queue_create("com.apple.CoreMotion.CMMotionManager", 0);
    operator new();
  }
}

- (BOOL)isSidebandSensorFusionAvailable
{
  if (sub_1902BACB4()) {
    LOBYTE(v2) = 0;
  }
  else {
    return ((unint64_t)sub_1902CD6B0() >> 29) & 1;
  }
  return v2;
}

- (BOOL)setSidebandSensorFusionEnable:(BOOL)a3
{
  return objc_msgSend_setSidebandSensorFusionEnable_measureLatency_withSnoopHandler_(self, a2, a3, 0, 0);
}

- (BOOL)setSidebandSensorFusionEnable:(BOOL)a3 withSnoopHandler:(id)a4
{
  return objc_msgSend_setSidebandSensorFusionEnable_measureLatency_withSnoopHandler_(self, a2, a3, 0, a4);
}

- (BOOL)setSidebandSensorFusionEnable:(BOOL)a3 measureLatency:(BOOL)a4 withSnoopHandler:(id)a5
{
  BOOL v6 = a4;
  BOOL v7 = a3;
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  CFRunLoopRef Current = CFRunLoopGetCurrent();
  sub_1902D6BD0();
  if (Current == *(CFRunLoopRef *)qword_1EB3BF828)
  {
    if (qword_1EB3BE878 != -1) {
      dispatch_once(&qword_1EB3BE878, &unk_1EDFC2080);
    }
    uint64_t v11 = off_1EB3BE870;
    if (os_log_type_enabled((os_log_t)off_1EB3BE870, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 67240704;
      DWORD1(buf) = v7;
      WORD4(buf) = 1026;
      *(_DWORD *)((char *)&buf + 10) = v6;
      HIWORD(buf) = 1026;
      LODWORD(v57) = a5 != 0;
      _os_log_impl(&dword_1902AF000, v11, OS_LOG_TYPE_DEFAULT, "[SidebandSensorFusion] requesting from framework,enabled,%{public}d,measureLatency,%{public}d,snoop,%{public}d", (uint8_t *)&buf, 0x14u);
    }
    if (sub_1902D8400(115, 2))
    {
      bzero(&buf, 0x65CuLL);
      if (qword_1EB3BE878 != -1) {
        dispatch_once(&qword_1EB3BE878, &unk_1EDFC2080);
      }
      LODWORD(v53) = 67240704;
      HIDWORD(v53) = v7;
      LOWORD(v54) = 1026;
      *(_DWORD *)((char *)&v54 + 2) = v6;
      HIWORD(v54) = 1026;
      BOOL v55 = a5 != 0;
      __int16 v41 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "-[CMMotionManager setSidebandSensorFusionEnable:measureLatency:withSnoopHandler:]", "CoreLocation: %s\n", v41);
      if (v41 != (char *)&buf) {
        free(v41);
      }
    }
    objc_msgSend_connect(self, v12, v13);
    id internal = self->_internal;
    double v15 = CFAbsoluteTimeGetCurrent();
    v51[0] = @"CMSidebandSensorFusionEnable";
    v52[0] = objc_msgSend_numberWithBool_(NSNumber, v16, v7);
    v51[1] = @"CMSidebandSensorFusionLatency";
    v52[1] = objc_msgSend_numberWithBool_(NSNumber, v17, v6);
    v51[2] = @"CMSidebandSensorFusionSnoop";
    v52[2] = objc_msgSend_numberWithBool_(NSNumber, v18, a5 != 0);
    uint64_t v47 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v19, (uint64_t)v52, v51, 3);
    sub_1904A6C38("kCLConnectionMessageSidebandSensorFusionEnable", &v47, &v53);
    uint64_t v44 = v54;
    if (v54) {
      atomic_fetch_add_explicit(&v54->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    CLConnectionClient::sendMessageSync();
    if (v44) {
      sub_1902D8B58(v44);
    }
    __int16 v20 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v21 = objc_opt_class();
    uint64_t v22 = objc_opt_class();
    uint64_t v24 = (NSSet *)objc_msgSend_setWithObjects_(v20, v23, v21, v22, 0);
    if (v45)
    {
      DictionaryOfClasses = (void *)CLConnectionMessage::getDictionaryOfClasses(v45, v24);
      double v27 = objc_msgSend_objectForKeyedSubscript_(DictionaryOfClasses, v26, @"CMSidebandSensorFusionSuccess");
      LODWORD(self) = objc_msgSend_BOOLValue(v27, v28, v29);
    }
    else
    {
      LODWORD(self) = 0;
    }
    double v30 = vabdd_f64(CFAbsoluteTimeGetCurrent(), v15);
    if (v30 > 5.0)
    {
      if (qword_1EB3BE878 != -1) {
        dispatch_once(&qword_1EB3BE878, &unk_1EDFC2080);
      }
      int v31 = off_1EB3BE870;
      if (os_log_type_enabled((os_log_t)off_1EB3BE870, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 134349056;
        *(double *)((char *)&buf + 4) = v30;
        _os_log_impl(&dword_1902AF000, v31, OS_LOG_TYPE_ERROR, "[SidebandSensorFusion] setSidebandSensorFusionEnable took longer than expected,%{public}f", (uint8_t *)&buf, 0xCu);
      }
      if (sub_1902D8400(115, 0))
      {
        bzero(&buf, 0x65CuLL);
        if (qword_1EB3BE878 != -1) {
          dispatch_once(&qword_1EB3BE878, &unk_1EDFC2080);
        }
        int v59 = 134349056;
        double v60 = v30;
        uint64_t v43 = (char *)_os_log_send_and_compose_impl();
        sub_1902D398C("Generic", 1, 0, 0, "-[CMMotionManager setSidebandSensorFusionEnable:measureLatency:withSnoopHandler:]", "CoreLocation: %s\n", v43);
        if (v43 != (char *)&buf) {
          free(v43);
        }
      }
    }
    if (qword_1EB3BE878 != -1) {
      dispatch_once(&qword_1EB3BE878, &unk_1EDFC2080);
    }
    uint64_t v32 = off_1EB3BE870;
    if (os_log_type_enabled((os_log_t)off_1EB3BE870, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 67240192;
      DWORD1(buf) = self;
      _os_log_impl(&dword_1902AF000, v32, OS_LOG_TYPE_DEFAULT, "[SidebandSensorFusion] requesting from framework,success,%{public}d", (uint8_t *)&buf, 8u);
    }
    if (sub_1902D8400(115, 2))
    {
      bzero(&buf, 0x65CuLL);
      if (qword_1EB3BE878 != -1) {
        dispatch_once(&qword_1EB3BE878, &unk_1EDFC2080);
      }
      int v59 = 67240192;
      LODWORD(v60) = self;
      double v42 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "-[CMMotionManager setSidebandSensorFusionEnable:measureLatency:withSnoopHandler:]", "CoreLocation: %s\n", v42);
      if (v42 != (char *)&buf) {
        free(v42);
      }
    }
    if (self)
    {
      internal[560] = v7;
      internal[561] = v6;
      internal[562] = a5 != 0;
      if (a5 && !*((void *)internal + 71)) {
        operator new();
      }
      uint64_t v35 = *((void *)internal + 71);
      if (v35)
      {
        v36 = *(void **)(v35 + 56);
        *(void *)(v35 + 56) = objc_msgSend_copy(a5, v33, v34);

        if (!*(void *)(v35 + 24))
        {
          if ((sub_1902CD6B0() & 0x80) != 0) {
            operator new();
          }
          if (qword_1EB3BE878 != -1) {
            dispatch_once(&qword_1EB3BE878, &unk_1EDFC2080);
          }
          __int16 v37 = off_1EB3BE870;
          if (os_log_type_enabled((os_log_t)off_1EB3BE870, OS_LOG_TYPE_FAULT))
          {
            LOWORD(buf) = 0;
            _os_log_impl(&dword_1902AF000, v37, OS_LOG_TYPE_FAULT, "platform does not support devmotion3 data", (uint8_t *)&buf, 2u);
          }
          if (sub_1902D8400(115, 0))
          {
            bzero(&buf, 0x65CuLL);
            if (qword_1EB3BE878 != -1) {
              dispatch_once(&qword_1EB3BE878, &unk_1EDFC2080);
            }
            LOWORD(v59) = 0;
            double v38 = (char *)_os_log_send_and_compose_impl();
            sub_1902D398C("Generic", 1, 0, 0, "void CLIspDataVisitor::setIspDataHandler(CMSidebandSensorFusionSnoopHandler)", "CoreLocation: %s\n", v38);
            if (v38 != (char *)&buf) {
              free(v38);
            }
          }
        }
        uint64_t v39 = (void *)*((void *)internal + 71);
        if (!v39[7] && !v39[8])
        {
          *((void *)internal + 71) = 0;
          (*(void (**)(void *))(*v39 + 8))(v39);
        }
      }
    }
    if (v46) {
      sub_1902D8B58(v46);
    }
    if (v54) {
      sub_1902D8B58(v54);
    }
  }
  else
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v57 = 0x2020000000;
    char v58 = 0;
    uint64_t v10 = sub_1902D6BD0();
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = sub_19049F07C;
    v48[3] = &unk_1E568DEF0;
    v48[5] = a5;
    v48[6] = &buf;
    BOOL v49 = v7;
    BOOL v50 = v6;
    v48[4] = self;
    sub_1902CDE98(v10, (uint64_t)v48);
    LOBYTE(self) = *(unsigned char *)(*((void *)&buf + 1) + 24) != 0;
    _Block_object_dispose(&buf, 8);
  }
  return (char)self;
}

- (void)setSidebandTimeSyncHandler:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend_isSidebandSensorFusionAvailable(self, a2, (uint64_t)a3))
  {
    id internal = self->_internal;
    if (a3)
    {
      uint64_t v42 = 0;
      uint64_t v43 = &v42;
      uint64_t v44 = 0x2020000000;
      uint64_t v45 = 0;
      uint64_t v38 = 0;
      uint64_t v39 = &v38;
      uint64_t v40 = 0x2020000000;
      uint64_t v41 = 0;
      if (!*((void *)internal + 136)) {
        *((void *)internal + 136) = dispatch_semaphore_create(0);
      }
      uint64_t v6 = sub_1902D6BD0();
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = sub_19049F800;
      v37[3] = &unk_1E568DF40;
      v37[4] = internal;
      v37[5] = &v42;
      v37[6] = &v38;
      sub_1902CDE98(v6, (uint64_t)v37);
      BOOL v7 = dispatch_queue_create("OscarTimeWait", 0);
      uint64_t v33 = 0;
      uint64_t v34 = &v33;
      uint64_t v35 = 0x2020000000;
      uint64_t v36 = 0;
      uint64_t v29 = 0;
      double v30 = &v29;
      uint64_t v31 = 0x2020000000;
      uint64_t v32 = 0;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = sub_19049FAB4;
      block[3] = &unk_1E568DF68;
      block[4] = &v33;
      block[5] = &v29;
      dispatch_block_t v8 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, block);
      dispatch_async(v7, v8);
      if (qword_1EB3BE878 != -1) {
        dispatch_once(&qword_1EB3BE878, &unk_1EDFC2080);
      }
      double v9 = off_1EB3BE870;
      if (os_log_type_enabled((os_log_t)off_1EB3BE870, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1902AF000, v9, OS_LOG_TYPE_DEFAULT, "[MotionManager] setSidebandTimeSyncHandler: Waiting for time sync", buf, 2u);
      }
      if (sub_1902D8400(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1EB3BE878 != -1) {
          dispatch_once(&qword_1EB3BE878, &unk_1EDFC2080);
        }
        LOWORD(v46) = 0;
        __int16 v20 = (char *)_os_log_send_and_compose_impl();
        sub_1902D398C("Generic", 1, 0, 2, "-[CMMotionManager setSidebandTimeSyncHandler:]", "CoreLocation: %s\n", v20);
        if (v20 != (char *)buf) {
          free(v20);
        }
      }
      while (dispatch_semaphore_wait(*((dispatch_semaphore_t *)internal + 136), 0))
      {
        dispatch_time_t v10 = dispatch_time(0, 250000000);
        if (!dispatch_block_wait(v8, v10))
        {
          if (qword_1EB3BE878 != -1) {
            dispatch_once(&qword_1EB3BE878, &unk_1EDFC2080);
          }
          uint64_t v16 = off_1EB3BE870;
          if (os_log_type_enabled((os_log_t)off_1EB3BE870, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v17 = v34[3];
            uint64_t v18 = v30[3];
            *(_DWORD *)long long buf = 134218240;
            uint64_t v51 = v17;
            __int16 v52 = 2048;
            uint64_t v53 = v18;
            _os_log_impl(&dword_1902AF000, v16, OS_LOG_TYPE_DEFAULT, "[MotionManager] setSidebandTimeSyncHandler: locationd TimeSync machTimestamp,%llu,oscarTimestamp,%llu", buf, 0x16u);
          }
          if (sub_1902D8400(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1EB3BE878 != -1) {
              dispatch_once(&qword_1EB3BE878, &unk_1EDFC2080);
            }
            uint64_t v24 = v34[3];
            uint64_t v25 = v30[3];
            int v46 = 134218240;
            uint64_t v47 = v24;
            __int16 v48 = 2048;
            uint64_t v49 = v25;
            __int16 v26 = (char *)_os_log_send_and_compose_impl();
            sub_1902D398C("Generic", 1, 0, 2, "-[CMMotionManager setSidebandTimeSyncHandler:]", "CoreLocation: %s\n", v26);
            if (v26 != (char *)buf) {
              free(v26);
            }
          }
          uint64_t v14 = v34 + 3;
          double v15 = v30;
          goto LABEL_25;
        }
        usleep(0x2710u);
      }
      if (qword_1EB3BE878 != -1) {
        dispatch_once(&qword_1EB3BE878, &unk_1EDFC2080);
      }
      uint64_t v11 = off_1EB3BE870;
      if (os_log_type_enabled((os_log_t)off_1EB3BE870, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = v43[3];
        uint64_t v13 = v39[3];
        *(_DWORD *)long long buf = 134218240;
        uint64_t v51 = v12;
        __int16 v52 = 2048;
        uint64_t v53 = v13;
        _os_log_impl(&dword_1902AF000, v11, OS_LOG_TYPE_DEFAULT, "[MotionManager] setSidebandTimeSyncHandler: Framework TimeSync machTimestamp,%llu,oscarTimestamp,%llu", buf, 0x16u);
      }
      if (sub_1902D8400(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1EB3BE878 != -1) {
          dispatch_once(&qword_1EB3BE878, &unk_1EDFC2080);
        }
        uint64_t v21 = v43[3];
        uint64_t v22 = v39[3];
        int v46 = 134218240;
        uint64_t v47 = v21;
        __int16 v48 = 2048;
        uint64_t v49 = v22;
        double v23 = (char *)_os_log_send_and_compose_impl();
        sub_1902D398C("Generic", 1, 0, 2, "-[CMMotionManager setSidebandTimeSyncHandler:]", "CoreLocation: %s\n", v23);
        if (v23 != (char *)buf) {
          free(v23);
        }
      }
      uint64_t v14 = v43 + 3;
      double v15 = v39;
LABEL_25:
      (*((void (**)(id, void, uint64_t))a3 + 2))(a3, *v14, v15[3]);
      dispatch_release(v7);
      _Block_release(v8);
      _Block_object_dispose(&v29, 8);
      _Block_object_dispose(&v33, 8);
      _Block_object_dispose(&v38, 8);
      _Block_object_dispose(&v42, 8);
    }
    if (*((void *)internal + 71))
    {
      uint64_t v19 = sub_1902D6BD0();
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = sub_19049FACC;
      v27[3] = &unk_1E568D2F8;
      v27[4] = internal;
      v27[5] = a3;
      sub_1902CDE98(v19, (uint64_t)v27);
    }
  }
}

- (void)setPowerConservationMode:(int)a3
{
  id internal = self->_internal;
  uint64_t v6 = sub_1902D6BD0();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_19049FC00;
  v7[3] = &unk_1E568DF90;
  v7[4] = self;
  v7[5] = internal;
  int v8 = a3;
  sub_1902CE9BC(v6, (uint64_t)v7);
}

- (void)setNotificationCallback:(void *)a3 info:(void *)a4
{
  if ((a3 != 0) != (a4 != 0))
  {
    uint64_t v14 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, (uint64_t)a3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v14, v15, (uint64_t)a2, self, @"CMMotionManager.mm", 2700, @"-[CMMotionManager setNotificationCallback:info:] won't take these parameters.");
  }
  if (objc_msgSend_isDeviceMotionAvailable(self, a2, (uint64_t)a3))
  {
    CFRunLoopRef Current = CFRunLoopGetCurrent();
    sub_1902D6BD0();
    if (Current == *(CFRunLoopRef *)qword_1EB3BF828)
    {
      id internal = self->_internal;
      dispatch_time_t v10 = (void *)internal[74];
      if (v10 != a3 || (void *)internal[75] != a4)
      {
        if (v10 || internal[75])
        {
          uint64_t v11 = sub_1902B35C0();
          sub_1902CDE08(v11, 6, internal[76]);
          uint64_t v12 = internal[76];
          if (v12) {
            (*(void (**)(uint64_t))(*(void *)v12 + 8))(v12);
          }
          internal[76] = 0;
        }
        internal[74] = a3;
        internal[75] = a4;
        if (a3) {
          operator new();
        }
      }
    }
    else
    {
      uint64_t v8 = sub_1902D6BD0();
      if (a3)
      {
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = sub_1904A0048;
        v17[3] = &unk_1E568DAC8;
        void v17[4] = self;
        v17[5] = a3;
        v17[6] = a4;
        sub_1902CE9BC(v8, (uint64_t)v17);
      }
      else
      {
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        id v16[2] = sub_1904A0058;
        v16[3] = &unk_1E568D118;
        v16[4] = self;
        sub_1902CDE98(v8, (uint64_t)v16);
      }
    }
  }
}

- (BOOL)setMotionThreadPriority:(int)a3
{
  uint64_t v4 = sub_1902D6BD0();

  return sub_1904DF7DC(v4, a3);
}

- (void)_startDeviceMotionErrorUpdatesToQueue:(id)a3 withHandler:(id)a4
{
  uint64_t v8 = sub_1902D6BD0();
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1904A0134;
  v9[3] = &unk_1E568DE28;
  v9[4] = a3;
  v9[5] = self;
  v9[6] = a4;
  v9[7] = a2;
  sub_1902CDE98(v8, (uint64_t)v9);
}

- (void)_stopDeviceMotionErrorUpdates
{
  uint64_t v3 = sub_1902D6BD0();
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_1904A02E0;
  v4[3] = &unk_1E568D118;
  v4[4] = self;
  sub_1902CDE98(v3, (uint64_t)v4);
}

- (id)predictedDeviceMotionAtTimestamp:(double)a3 error:(id *)a4
{
  int v5 = a4;
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  if ((objc_msgSend_isPredictedDeviceMotionAvailable(self, a2, (uint64_t)a4) & 1) == 0)
  {
    if (qword_1EB3BE878 != -1) {
      dispatch_once(&qword_1EB3BE878, &unk_1EDFC2080);
    }
    p_cache = CMDeviceOrientationManager.cache;
    uint64_t v40 = off_1EB3BE870;
    if (os_log_type_enabled((os_log_t)off_1EB3BE870, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)long long buf = 68289539;
      *(_DWORD *)v67 = 0;
      *(_WORD *)&v67[4] = 2082;
      *(void *)&v67[6] = "";
      *(_WORD *)&v67[14] = 2082;
      *(void *)&v67[16] = "assert";
      *(_WORD *)&v67[24] = 2081;
      *(void *)&v67[26] = "[self isPredictedDeviceMotionAvailable]";
      _os_log_impl(&dword_1902AF000, v40, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Predicted device motion is not available! Check -[CMMotionManager isPredictedDeviceMotionAvailable] before making this call\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EB3BE878 != -1) {
        dispatch_once(&qword_1EB3BE878, &unk_1EDFC2080);
      }
    }
    uint64_t v41 = off_1EB3BE870;
    if (os_signpost_enabled((os_log_t)off_1EB3BE870))
    {
      *(_DWORD *)long long buf = 68289539;
      *(_DWORD *)v67 = 0;
      *(_WORD *)&v67[4] = 2082;
      *(void *)&v67[6] = "";
      *(_WORD *)&v67[14] = 2082;
      *(void *)&v67[16] = "assert";
      *(_WORD *)&v67[24] = 2081;
      *(void *)&v67[26] = "[self isPredictedDeviceMotionAvailable]";
      _os_signpost_emit_with_name_impl(&dword_1902AF000, v41, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Predicted device motion is not available! Check -[CMMotionManager isPredictedDeviceMotionAvailable] before making this call", "{\"msg%{public}.0s\":\"Predicted device motion is not available! Check -[CMMotionManager isPredictedDeviceMotionAvailable] before making this call\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EB3BE878 != -1) {
        dispatch_once(&qword_1EB3BE878, &unk_1EDFC2080);
      }
    }
    int v5 = off_1EB3BE870;
    if (os_log_type_enabled((os_log_t)off_1EB3BE870, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 68289539;
      *(_DWORD *)v67 = 0;
      *(_WORD *)&v67[4] = 2082;
      *(void *)&v67[6] = "";
      *(_WORD *)&v67[14] = 2082;
      *(void *)&v67[16] = "assert";
      *(_WORD *)&v67[24] = 2081;
      *(void *)&v67[26] = "[self isPredictedDeviceMotionAvailable]";
      _os_log_impl(&dword_1902AF000, v5, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Predicted device motion is not available! Check -[CMMotionManager isPredictedDeviceMotionAvailable] before making this call\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
    goto LABEL_56;
  }
  p_cache = self->_internal;
  if (!*((_DWORD *)p_cache + 74))
  {
    v5->Class isa = (Class)objc_msgSend_CMErrorWithCode_(CMErrorUtils, v8, 109);
    uint64_t v4 = CMDeviceOrientationManager.cache;
    if (qword_1EB3BE878 == -1)
    {
LABEL_32:
      uint64_t v32 = off_1EB3BE870;
      if (os_log_type_enabled((os_log_t)off_1EB3BE870, OS_LOG_TYPE_DEBUG))
      {
        v33.Class isa = v5->isa;
        int v34 = *((_DWORD *)p_cache + 74);
        *(_DWORD *)long long buf = 138412546;
        *v67 = v33;
        *(_WORD *)&v67[8] = 1024;
        *(_DWORD *)&v67[10] = v34;
        _os_log_impl(&dword_1902AF000, v32, OS_LOG_TYPE_DEBUG, "Predicted CMDeviceMotion: %@,mode,%d", buf, 0x12u);
      }
      if (!sub_1902D8400(115, 2)) {
        return 0;
      }
      bzero(buf, 0x65CuLL);
      if (v4[271] != (void *)-1) {
        dispatch_once(&qword_1EB3BE878, &unk_1EDFC2080);
      }
      v35.Class isa = v5->isa;
      int v36 = *((_DWORD *)p_cache + 74);
      *(_DWORD *)char v58 = 138412546;
      *&v58[4] = v35;
      *(_WORD *)&v58[12] = 1024;
      *(_DWORD *)&v58[14] = v36;
      goto LABEL_60;
    }
LABEL_56:
    dispatch_once(&qword_1EB3BE878, &unk_1EDFC2080);
    goto LABEL_32;
  }
  unsigned __int16 v65 = 0;
  int v49 = 100;
  float32x2_t v48 = (float32x2_t)0xBFF0000000000000;
  dispatch_time_t v10 = (void *)sub_1902B35C0();
  *(double *)v11.i64 = a3;
  sub_19056F864(v10, *((_DWORD *)p_cache + 74), (uint64_t)v58, &v49, &v48, v11);
  objc_msgSend_applyNorthReference_(self, v12, (uint64_t)v58);
  if (*((void *)p_cache + 38) == 8 && *(double *)(sub_1902B35C0() + 88) < 0.0)
  {
    v5->Class isa = (Class)objc_msgSend_CMErrorWithCode_(CMErrorUtils, v13, 102);
    if (qword_1EB3BE878 != -1) {
      dispatch_once(&qword_1EB3BE878, &unk_1EDFC2080);
    }
    uint64_t v14 = off_1EB3BE870;
    if (os_log_type_enabled((os_log_t)off_1EB3BE870, OS_LOG_TYPE_DEBUG))
    {
      v15.Class isa = v5->isa;
      *(_DWORD *)long long buf = 138412290;
      *v67 = v15;
      _os_log_impl(&dword_1902AF000, v14, OS_LOG_TYPE_DEBUG, "Predicted CMDeviceMotion: %@", buf, 0xCu);
    }
    if (!sub_1902D8400(115, 2)) {
      return 0;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1EB3BE878 != -1) {
      dispatch_once(&qword_1EB3BE878, &unk_1EDFC2080);
    }
    v16.Class isa = v5->isa;
    int v50 = 138412290;
    Class isa = v16.isa;
LABEL_60:
    uint64_t v43 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CMMotionManager predictedDeviceMotionAtTimestamp:error:]", "CoreLocation: %s\n", v43);
    if (v43 != (char *)buf) {
      free(v43);
    }
    return 0;
  }
  if ((objc_msgSend_deviceMotionInitialized_(CMMotionManager, v13, (uint64_t)v58) & 1) == 0)
  {
    v5->Class isa = (Class)objc_msgSend_CMErrorWithCode_(CMErrorUtils, v17, 109);
    if (qword_1EB3BE878 != -1) {
      dispatch_once(&qword_1EB3BE878, &unk_1EDFC2080);
    }
    __int16 v37 = off_1EB3BE870;
    if (os_log_type_enabled((os_log_t)off_1EB3BE870, OS_LOG_TYPE_DEBUG))
    {
      v38.Class isa = v5->isa;
      *(_DWORD *)long long buf = 138413058;
      *v67 = v38;
      *(_WORD *)&v67[8] = 2048;
      *(float32x2_t *)&v67[10] = v48;
      *(_WORD *)&v67[18] = 2048;
      *(double *)&v67[20] = a3;
      *(_WORD *)&v67[28] = 1024;
      *(_DWORD *)&v67[30] = v65;
      _os_log_impl(&dword_1902AF000, v37, OS_LOG_TYPE_DEBUG, "Predicted CMDeviceMotion: %@,lastSampleTimestamp,%f,timestamp,%f,status,%#02x", buf, 0x26u);
    }
    if (!sub_1902D8400(115, 2)) {
      return 0;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1EB3BE878 != -1) {
      dispatch_once(&qword_1EB3BE878, &unk_1EDFC2080);
    }
    v42.Class isa = v5->isa;
    int v50 = 138413058;
    Class isa = v42.isa;
    __int16 v52 = 2048;
    float32x2_t v53 = v48;
    __int16 v54 = 2048;
    double v55 = a3;
    __int16 v56 = 1024;
    int v57 = v65;
    goto LABEL_60;
  }
  if (objc_msgSend_northAlignedReferenceFrame_(CMMotionManager, v17, *((void *)p_cache + 38))&& DWORD1(v62) != -1&& SDWORD1(v62) <= 0)
  {
    v5->Class isa = (Class)objc_msgSend_CMErrorWithCode_(CMErrorUtils, v18, 101);
    if (qword_1EB3BE878 != -1) {
      dispatch_once(&qword_1EB3BE878, &unk_1EDFC2080);
    }
    uint64_t v19 = off_1EB3BE870;
    if (os_log_type_enabled((os_log_t)off_1EB3BE870, OS_LOG_TYPE_DEBUG))
    {
      v20.Class isa = v5->isa;
      *(_DWORD *)long long buf = 138412546;
      *v67 = v20;
      *(_WORD *)&v67[8] = 2048;
      *(float32x2_t *)&v67[10] = v48;
      _os_log_impl(&dword_1902AF000, v19, OS_LOG_TYPE_DEBUG, "Predicted CMDeviceMotion: %@,lastSampleTimestamp,%f", buf, 0x16u);
    }
    if (sub_1902D8400(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EB3BE878 != -1) {
        dispatch_once(&qword_1EB3BE878, &unk_1EDFC2080);
      }
      v44.Class isa = v5->isa;
      int v50 = 138412546;
      Class isa = v44.isa;
      __int16 v52 = 2048;
      float32x2_t v53 = v48;
      uint64_t v45 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "-[CMMotionManager predictedDeviceMotionAtTimestamp:error:]", "CoreLocation: %s\n", v45);
      if (v45 != (char *)buf) {
        free(v45);
      }
    }
  }
  uint64_t v21 = [CMDeviceMotion alloc];
  v46[2] = v60;
  v46[3] = v61;
  v46[4] = v62;
  uint64_t v47 = v63;
  v46[0] = *(_OWORD *)&v58[8];
  v46[1] = v59;
  double v23 = (objc_class *)(id)objc_msgSend_initWithDeviceMotion_internal_timestamp_(v21, v22, (uint64_t)v46, COERCE_DOUBLE(__PAIR64__(*(unsigned int *)&v58[12], v64)), *(double *)v58);
  if (qword_1EB3BE878 != -1) {
    dispatch_once(&qword_1EB3BE878, &unk_1EDFC2080);
  }
  uint64_t v24 = off_1EB3BE870;
  if (os_log_type_enabled((os_log_t)off_1EB3BE870, OS_LOG_TYPE_DEBUG))
  {
    float32x2_t v25 = v48;
    uint64_t v26 = mach_absolute_time();
    double v27 = sub_1902D8D34(v26);
    *(_DWORD *)long long buf = 138412802;
    *(void *)v67 = v23;
    *(_WORD *)&v67[8] = 2048;
    *(float32x2_t *)&v67[10] = v25;
    *(_WORD *)&v67[18] = 2048;
    *(double *)&v67[20] = v27;
    _os_log_impl(&dword_1902AF000, v24, OS_LOG_TYPE_DEBUG, "Predicted CMDeviceMotion: %@,lastSampleTimestamp,%f,now,%f", buf, 0x20u);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EB3BE878 != -1) {
      dispatch_once(&qword_1EB3BE878, &unk_1EDFC2080);
    }
    float32x2_t v28 = v48;
    uint64_t v29 = mach_absolute_time();
    double v30 = sub_1902D8D34(v29);
    int v50 = 138412802;
    Class isa = v23;
    __int16 v52 = 2048;
    float32x2_t v53 = v28;
    __int16 v54 = 2048;
    double v55 = v30;
    uint64_t v31 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CMMotionManager predictedDeviceMotionAtTimestamp:error:]", "CoreLocation: %s\n", v31);
    if (v31 != (char *)buf) {
      free(v31);
    }
  }
  return v23;
}

- (void)onAccelerometer:(const Sample *)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id internal = (char *)self->_internal;
  os_unfair_lock_lock((os_unfair_lock_t)internal + 2);
  long long v5 = *(_OWORD *)&a3->timestamp;
  *((void *)internal + 9) = *(void *)&a3->acceleration.z;
  *(_OWORD *)(internal + 56) = v5;
  os_unfair_lock_unlock((os_unfair_lock_t)internal + 2);
  if (*((void *)internal + 5))
  {
    if (*((void *)internal + 4))
    {
      v6.n128_u64[0] = *(void *)&a3->timestamp;
      if (a3->timestamp > 0.0)
      {
        double v7 = *((double *)internal + 6);
        if (v7 <= 0.0
          || (double v8 = v6.n128_f64[0] - v7,
              double v9 = *((double *)internal + 3),
              v6.n128_f64[0] = v8 - v9,
              v6.n128_f64[0] >= v9 * -0.1))
        {
          dispatch_time_t v10 = (void *)MEMORY[0x192FCD2F0](v6);
          float32x4_t v11 = [CMAccelerometerData alloc];
          *(float *)&double v12 = a3->acceleration.x;
          *(float *)&double v13 = a3->acceleration.y;
          *(float *)&double v14 = a3->acceleration.z;
          uint64_t v17 = objc_msgSend_initWithAcceleration_andTimestamp_(v11, v15, v16, v12, v13, v14, a3->timestamp);
          uint64_t v18 = *((void *)internal + 4);
          if (qword_1EB3BE878 != -1) {
            dispatch_once(&qword_1EB3BE878, &unk_1EDFC2080);
          }
          uint64_t v19 = off_1EB3BE870;
          if (os_log_type_enabled((os_log_t)off_1EB3BE870, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v20 = mach_absolute_time();
            *(_DWORD *)long long buf = 138412546;
            uint64_t v31 = v17;
            __int16 v32 = 2048;
            double v33 = sub_1902D8D34(v20);
            _os_log_impl(&dword_1902AF000, v19, OS_LOG_TYPE_DEBUG, "CMAccelerometerData: %@,now,%f", buf, 0x16u);
          }
          if (sub_1902D8400(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1EB3BE878 != -1) {
              dispatch_once(&qword_1EB3BE878, &unk_1EDFC2080);
            }
            uint64_t v23 = mach_absolute_time();
            int v26 = 138412546;
            double v27 = v17;
            __int16 v28 = 2048;
            double v29 = sub_1902D8D34(v23);
            uint64_t v24 = (char *)_os_log_send_and_compose_impl();
            sub_1902D398C("Generic", 1, 0, 2, "-[CMMotionManager onAccelerometer:]", "CoreLocation: %s\n", v24);
            if (v24 != (char *)buf) {
              free(v24);
            }
          }
          uint64_t v22 = (void *)*((void *)internal + 5);
          v25[0] = MEMORY[0x1E4F143A8];
          v25[1] = 3221225472;
          v25[2] = sub_1904A10AC;
          v25[3] = &unk_1E568D320;
          v25[4] = v17;
          v25[5] = v18;
          objc_msgSend_addOperationWithBlock_(v22, v21, (uint64_t)v25);

          *((void *)internal + 6) = *(void *)&a3->timestamp;
        }
      }
    }
  }
}

- (void)onGyro:(const Sample *)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id internal = (char *)self->_internal;
  os_unfair_lock_lock((os_unfair_lock_t)internal + 2);
  long long v5 = *(_OWORD *)&a3->timestamp;
  *((void *)internal + 31) = *(void *)&a3->acceleration.z;
  *(_OWORD *)(internal + 232) = v5;
  os_unfair_lock_unlock((os_unfair_lock_t)internal + 2);
  if (*((void *)internal + 27))
  {
    if (*((void *)internal + 26))
    {
      v6.n128_u64[0] = *(void *)&a3->timestamp;
      if (a3->timestamp > 0.0)
      {
        double v7 = *((double *)internal + 28);
        if (v7 <= 0.0
          || (double v8 = v6.n128_f64[0] - v7,
              double v9 = *((double *)internal + 25),
              v6.n128_f64[0] = v8 - v9,
              v6.n128_f64[0] >= v9 * -0.1))
        {
          dispatch_time_t v10 = (void *)MEMORY[0x192FCD2F0](v6);
          float32x4_t v11 = [CMGyroData alloc];
          *(float *)&double v12 = a3->acceleration.x;
          *(float *)&double v13 = a3->acceleration.y;
          *(float *)&double v14 = a3->acceleration.z;
          uint64_t v17 = objc_msgSend_initWithRotationRate_andTimestamp_(v11, v15, v16, v12, v13, v14, a3->timestamp);
          uint64_t v18 = *((void *)internal + 26);
          if (qword_1EB3BE878 != -1) {
            dispatch_once(&qword_1EB3BE878, &unk_1EDFC2080);
          }
          uint64_t v19 = off_1EB3BE870;
          if (os_log_type_enabled((os_log_t)off_1EB3BE870, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v20 = mach_absolute_time();
            *(_DWORD *)long long buf = 138412546;
            uint64_t v31 = v17;
            __int16 v32 = 2048;
            double v33 = sub_1902D8D34(v20);
            _os_log_impl(&dword_1902AF000, v19, OS_LOG_TYPE_DEBUG, "CMGyroData: %@,now,%f", buf, 0x16u);
          }
          if (sub_1902D8400(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1EB3BE878 != -1) {
              dispatch_once(&qword_1EB3BE878, &unk_1EDFC2080);
            }
            uint64_t v23 = mach_absolute_time();
            int v26 = 138412546;
            double v27 = v17;
            __int16 v28 = 2048;
            double v29 = sub_1902D8D34(v23);
            uint64_t v24 = (char *)_os_log_send_and_compose_impl();
            sub_1902D398C("Generic", 1, 0, 2, "-[CMMotionManager onGyro:]", "CoreLocation: %s\n", v24);
            if (v24 != (char *)buf) {
              free(v24);
            }
          }
          uint64_t v22 = (void *)*((void *)internal + 27);
          v25[0] = MEMORY[0x1E4F143A8];
          v25[1] = 3221225472;
          v25[2] = sub_1904A13B0;
          v25[3] = &unk_1E568D320;
          v25[4] = v17;
          v25[5] = v18;
          objc_msgSend_addOperationWithBlock_(v22, v21, (uint64_t)v25);

          *((void *)internal + 28) = *(void *)&a3->timestamp;
        }
      }
    }
  }
}

- (void)onFactoryGyro:(const Sample *)a3
{
  v84[1] = *MEMORY[0x1E4F143B8];
  id internal = (char *)self->_internal;
  if (!*((void *)internal + 87)) {
    return;
  }
  if (!*((void *)internal + 86)) {
    return;
  }
  v3.n128_u64[0] = *(void *)&a3->timestamp;
  if (a3->timestamp <= 0.0) {
    return;
  }
  double v6 = *((double *)internal + 88);
  if (v6 > 0.0)
  {
    double v7 = v3.n128_f64[0] - v6;
    double v8 = *((double *)internal + 83);
    v3.n128_f64[0] = v7 - v8;
    if (v3.n128_f64[0] < v8 * -0.1) {
      return;
    }
  }
  dispatch_time_t v10 = (void *)MEMORY[0x192FCD2F0](v3);
  uint64_t v11 = *((void *)internal + 86);
  float v12 = *((float *)internal + 178);
  BOOL v13 = v12 >= 21475000.0 || v12 <= 0.0;
  if (v13)
  {
    double v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v83 = *MEMORY[0x1E4F28568];
    v84[0] = @"Invalid gyro temperature value.";
    uint64_t v15 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v9, (uint64_t)v84, &v83, 1);
    uint64_t v17 = objc_msgSend_errorWithDomain_code_userInfo_(v14, v16, @"CMErrorDomainFactory", 8, v15);
    if (qword_1EB3BE868 != -1) {
      dispatch_once(&qword_1EB3BE868, &unk_1EDFD4380);
    }
    uint64_t v18 = qword_1EB3BE860;
    if (os_log_type_enabled((os_log_t)qword_1EB3BE860, OS_LOG_TYPE_ERROR))
    {
      double v19 = *((float *)internal + 178);
      uint64_t v20 = mach_absolute_time();
      *(_DWORD *)long long buf = 134218240;
      double v78 = v19;
      __int16 v79 = 2048;
      double v80 = sub_1902D8D34(v20);
      _os_log_impl(&dword_1902AF000, v18, OS_LOG_TYPE_ERROR, "Invalid gyro temperature value: %f,now,%f", buf, 0x16u);
    }
    if (sub_1902D8400(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EB3BE868 != -1) {
        dispatch_once(&qword_1EB3BE868, &unk_1EDFD4380);
      }
      double v21 = *((float *)internal + 178);
      uint64_t v22 = mach_absolute_time();
      int v71 = 134218240;
      double v72 = v21;
      __int16 v73 = 2048;
      double v74 = sub_1902D8D34(v22);
      uint64_t v23 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 0, "-[CMMotionManager onFactoryGyro:]", "CoreLocation: %s\n", v23);
      if (v23 != (char *)buf) {
        free(v23);
      }
    }
  }
  else
  {
    uint64_t v17 = 0;
  }
  if (!internal[716])
  {
    if (qword_1EB3BE868 != -1) {
      dispatch_once(&qword_1EB3BE868, &unk_1EDFD4380);
    }
    uint64_t v24 = qword_1EB3BE860;
    if (os_log_type_enabled((os_log_t)qword_1EB3BE860, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v25 = mach_absolute_time();
      double v26 = sub_1902D8D34(v25);
      *(_DWORD *)long long buf = 134217984;
      double v78 = v26;
      _os_log_impl(&dword_1902AF000, v24, OS_LOG_TYPE_DEBUG, "Fit not computed,now,%f", buf, 0xCu);
    }
    if (sub_1902D8400(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EB3BE868 != -1) {
        dispatch_once(&qword_1EB3BE868, &unk_1EDFD4380);
      }
      uint64_t v63 = mach_absolute_time();
      int v71 = 134217984;
      double v72 = sub_1902D8D34(v63);
      unsigned int v64 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "-[CMMotionManager onFactoryGyro:]", "CoreLocation: %s\n", v64);
      if (v64 != (char *)buf) {
        free(v64);
      }
    }
  }
  if (internal[716]) {
    char v27 = v13;
  }
  else {
    char v27 = 1;
  }
  if (v27) {
    goto LABEL_33;
  }
  float x = a3->acceleration.x;
  float y = a3->acceleration.y;
  float z = a3->acceleration.z;
  if ((sub_1902CD6B0() & 0x20000) != 0)
  {
    sub_19056A518((float *)(internal + 717), *((float *)internal + 178));
    if (qword_1EB3BE868 != -1)
    {
      float v68 = v34;
      float v65 = v32;
      float v66 = v33;
      dispatch_once(&qword_1EB3BE868, &unk_1EDFD4380);
      float v33 = v66;
      float v32 = v65;
      float v34 = v68;
    }
    float v35 = v32 * 57.296;
    float v36 = v33 * 57.296;
    __int16 v37 = qword_1EB3BE860;
    float v38 = v34 * 57.296;
    if (os_log_type_enabled((os_log_t)qword_1EB3BE860, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 134218496;
      double v78 = v35;
      __int16 v79 = 2048;
      double v80 = v36;
      __int16 v81 = 2048;
      double v82 = v38;
      _os_log_impl(&dword_1902AF000, v37, OS_LOG_TYPE_DEBUG, "Fit bias: %f,%f,%f deg/s", buf, 0x20u);
    }
    if (!sub_1902D8400(115, 2)) {
      goto LABEL_48;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1EB3BE868 != -1) {
      dispatch_once(&qword_1EB3BE868, &unk_1EDFD4380);
    }
    goto LABEL_67;
  }
  if ((sub_1902CD6B0() & 0x10000) != 0)
  {
    uint64_t v39 = 0;
    float v40 = *((float *)internal + 178);
    do
    {
      *(float *)&v70[v39] = *(float *)&internal[v39 * 4 + 1012] + (float)(v40 * *(float *)&internal[v39 * 4 + 1000]);
      ++v39;
    }
    while (v39 != 3);
    float v35 = *(float *)v70;
    float v36 = *(float *)&v70[1];
    float v38 = *(float *)&v70[2];
    if (qword_1EB3BE868 != -1) {
      dispatch_once(&qword_1EB3BE868, &unk_1EDFD4380);
    }
    uint64_t v41 = qword_1EB3BE860;
    if (os_log_type_enabled((os_log_t)qword_1EB3BE860, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 134218496;
      double v78 = v35;
      __int16 v79 = 2048;
      double v80 = v36;
      __int16 v81 = 2048;
      double v82 = v38;
      _os_log_impl(&dword_1902AF000, v41, OS_LOG_TYPE_DEBUG, "Fit bias: %f,%f,%f deg/s", buf, 0x20u);
    }
    if (!sub_1902D8400(115, 2)) {
      goto LABEL_48;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1EB3BE868 != -1) {
      dispatch_once(&qword_1EB3BE868, &unk_1EDFD4380);
    }
LABEL_67:
    int v71 = 134218496;
    double v72 = v35;
    __int16 v73 = 2048;
    double v74 = v36;
    __int16 v75 = 2048;
    double v76 = v38;
    v67 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CMMotionManager onFactoryGyro:]", "CoreLocation: %s\n", v67);
    if (v67 != (char *)buf) {
      free(v67);
    }
LABEL_48:
    NSObject v42 = [CMRotationRateData alloc];
    *(float *)&double v43 = x - v35;
    *(float *)&double v44 = y - v36;
    *(float *)&double v45 = z - v38;
    double v31 = COERCE_DOUBLE(objc_msgSend_initWithRotationRate_andTimestamp_(v42, v46, v47, v43, v44, v45, a3->timestamp));
    goto LABEL_49;
  }
LABEL_33:
  double v31 = 0.0;
LABEL_49:
  float32x2_t v48 = [CMGyroData alloc];
  *(float *)&double v49 = a3->acceleration.x;
  *(float *)&double v50 = a3->acceleration.y;
  *(float *)&double v51 = a3->acceleration.z;
  double v54 = COERCE_DOUBLE(objc_msgSend_initWithRotationRate_andTimestamp_(v48, v52, v53, v49, v50, v51, a3->timestamp));
  if (qword_1EB3BE868 != -1) {
    dispatch_once(&qword_1EB3BE868, &unk_1EDFD4380);
  }
  double v55 = qword_1EB3BE860;
  if (os_log_type_enabled((os_log_t)qword_1EB3BE860, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v56 = mach_absolute_time();
    double v57 = sub_1902D8D34(v56);
    *(_DWORD *)long long buf = 138412802;
    double v78 = v31;
    __int16 v79 = 2112;
    double v80 = v54;
    __int16 v81 = 2048;
    double v82 = v57;
    _os_log_impl(&dword_1902AF000, v55, OS_LOG_TYPE_DEBUG, "CMFactoryGyroData: %@,%@,now,%f", buf, 0x20u);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EB3BE868 != -1) {
      dispatch_once(&qword_1EB3BE868, &unk_1EDFD4380);
    }
    uint64_t v60 = mach_absolute_time();
    double v61 = sub_1902D8D34(v60);
    int v71 = 138412802;
    double v72 = v31;
    __int16 v73 = 2112;
    double v74 = v54;
    __int16 v75 = 2048;
    double v76 = v61;
    long long v62 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CMMotionManager onFactoryGyro:]", "CoreLocation: %s\n", v62);
    if (v62 != (char *)buf) {
      free(v62);
    }
  }
  long long v59 = (void *)*((void *)internal + 87);
  v69[0] = MEMORY[0x1E4F143A8];
  v69[1] = 3221225472;
  v69[2] = sub_1904A1DC0;
  v69[3] = &unk_1E568DFB8;
  v69[7] = v17;
  v69[8] = v11;
  *(double *)&v69[4] = v31;
  *(double *)&v69[5] = v54;
  v69[6] = internal;
  objc_msgSend_addOperationWithBlock_(v59, v58, (uint64_t)v69);

  *((void *)internal + 28) = *(void *)&a3->timestamp;
}

- (void)onFactoryGyroTemperature:(const Temperature *)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id internal = (os_unfair_lock_s *)self->_internal;
  os_unfair_lock_lock(internal + 2);
  internal[178]._os_unfair_lock_opaque = (uint32_t)LODWORD(a3->var1);
  os_unfair_lock_unlock(internal + 2);
  if (qword_1EB3BE868 != -1) {
    dispatch_once(&qword_1EB3BE868, &unk_1EDFD4380);
  }
  long long v5 = qword_1EB3BE860;
  if (os_log_type_enabled((os_log_t)qword_1EB3BE860, OS_LOG_TYPE_DEBUG))
  {
    double var1 = a3->var1;
    double var0 = a3->var0;
    uint64_t v8 = mach_absolute_time();
    *(_DWORD *)long long buf = 134218496;
    double v12 = var1;
    __int16 v13 = 2048;
    double v14 = var0;
    __int16 v15 = 2048;
    double v16 = sub_1902D8D34(v8);
    _os_log_impl(&dword_1902AF000, v5, OS_LOG_TYPE_DEBUG, "Factory gyro temp sample: %f,timestamp,%f,now,%f", buf, 0x20u);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EB3BE868 != -1) {
      dispatch_once(&qword_1EB3BE868, &unk_1EDFD4380);
    }
    uint64_t v9 = mach_absolute_time();
    sub_1902D8D34(v9);
    dispatch_time_t v10 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CMMotionManager onFactoryGyroTemperature:]", "CoreLocation: %s\n", v10);
    if (v10 != (char *)buf) {
      free(v10);
    }
  }
}

- (void)onMagnetometer:(const Sample *)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id internal = (char *)self->_internal;
  os_unfair_lock_lock((os_unfair_lock_t)internal + 2);
  long long v5 = *(_OWORD *)&a3->timestamp;
  *((void *)internal + 53) = *(void *)&a3->acceleration.z;
  *(_OWORD *)(internal + 408) = v5;
  os_unfair_lock_unlock((os_unfair_lock_t)internal + 2);
  if (*((void *)internal + 49))
  {
    if (*((void *)internal + 48))
    {
      v6.n128_u64[0] = *(void *)&a3->timestamp;
      if (a3->timestamp > 0.0)
      {
        double v7 = *((double *)internal + 50);
        if (v7 <= 0.0
          || (double v8 = v6.n128_f64[0] - v7,
              double v9 = *((double *)internal + 47),
              v6.n128_f64[0] = v8 - v9,
              v6.n128_f64[0] >= v9 * -0.1))
        {
          dispatch_time_t v10 = (void *)MEMORY[0x192FCD2F0](v6);
          uint64_t v11 = [CMMagnetometerData alloc];
          *(float *)&double v12 = a3->acceleration.x;
          *(float *)&double v13 = a3->acceleration.y;
          *(float *)&double v14 = a3->acceleration.z;
          uint64_t v17 = objc_msgSend_initWithMagneticField_andTimestamp_(v11, v15, v16, v12, v13, v14, a3->timestamp);
          uint64_t v18 = *((void *)internal + 48);
          if (qword_1EB3BE878 != -1) {
            dispatch_once(&qword_1EB3BE878, &unk_1EDFC2080);
          }
          double v19 = off_1EB3BE870;
          if (os_log_type_enabled((os_log_t)off_1EB3BE870, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v20 = mach_absolute_time();
            *(_DWORD *)long long buf = 138412546;
            double v31 = v17;
            __int16 v32 = 2048;
            double v33 = sub_1902D8D34(v20);
            _os_log_impl(&dword_1902AF000, v19, OS_LOG_TYPE_DEBUG, "CMMagnetometerData: %@,now,%f", buf, 0x16u);
          }
          if (sub_1902D8400(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1EB3BE878 != -1) {
              dispatch_once(&qword_1EB3BE878, &unk_1EDFC2080);
            }
            uint64_t v23 = mach_absolute_time();
            int v26 = 138412546;
            char v27 = v17;
            __int16 v28 = 2048;
            double v29 = sub_1902D8D34(v23);
            uint64_t v24 = (char *)_os_log_send_and_compose_impl();
            sub_1902D398C("Generic", 1, 0, 2, "-[CMMotionManager onMagnetometer:]", "CoreLocation: %s\n", v24);
            if (v24 != (char *)buf) {
              free(v24);
            }
          }
          uint64_t v22 = (void *)*((void *)internal + 49);
          v25[0] = MEMORY[0x1E4F143A8];
          v25[1] = 3221225472;
          v25[2] = sub_1904A22F8;
          v25[3] = &unk_1E568D320;
          v25[4] = v17;
          v25[5] = v18;
          objc_msgSend_addOperationWithBlock_(v22, v21, (uint64_t)v25);

          *((void *)internal + 50) = *(void *)&a3->timestamp;
        }
      }
    }
  }
}

- (BOOL)sendDeviceMotionError:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id internal = self->_internal;
  uint64_t v5 = internal[35];
  if (v5) {
    LODWORD(v5) = internal[34] != 0;
  }
  uint64_t v6 = internal[78];
  if (v6) {
    LODWORD(v6) = internal[77] != 0;
  }
  char v7 = v5 | v6;
  if ((v5 | v6) == 1)
  {
    double v8 = (void *)MEMORY[0x192FCD2F0]();
    uint64_t v10 = objc_msgSend_CMErrorWithCode_(CMErrorUtils, v9, v3);
    if (qword_1EB3BE878 != -1) {
      dispatch_once(&qword_1EB3BE878, &unk_1EDFC2080);
    }
    uint64_t v11 = off_1EB3BE870;
    if (os_log_type_enabled((os_log_t)off_1EB3BE870, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543362;
      uint64_t v24 = v10;
      _os_log_impl(&dword_1902AF000, v11, OS_LOG_TYPE_DEFAULT, "CMError: %{public}@", buf, 0xCu);
    }
    if (sub_1902D8400(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EB3BE878 != -1) {
        dispatch_once(&qword_1EB3BE878, &unk_1EDFC2080);
      }
      int v21 = 138543362;
      uint64_t v22 = v10;
      uint64_t v18 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "-[CMMotionManager sendDeviceMotionError:]", "CoreLocation: %s\n", v18);
      if (v18 != (char *)buf) {
        free(v18);
      }
    }
    uint64_t v13 = internal[34];
    if (v13)
    {
      double v14 = (void *)internal[35];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = sub_1904A25D0;
      v20[3] = &unk_1E568D320;
      v20[4] = v10;
      v20[5] = v13;
      objc_msgSend_addOperationWithBlock_(v14, v12, (uint64_t)v20);
    }
    uint64_t v15 = internal[77];
    if (v15)
    {
      uint64_t v16 = (void *)internal[78];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = sub_1904A25E8;
      v19[3] = &unk_1E568D320;
      v19[4] = v10;
      v19[5] = v15;
      objc_msgSend_addOperationWithBlock_(v16, v12, (uint64_t)v19);
    }
  }
  return v7;
}

- (void)onAmbientPressure:(const Sample *)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id internal = (char *)self->_internal;
  os_unfair_lock_lock((os_unfair_lock_t)internal + 2);
  *(_OWORD *)(internal + 120) = *(_OWORD *)&a3->timestamp;
  os_unfair_lock_unlock((os_unfair_lock_t)internal + 2);
  if (*((void *)internal + 13))
  {
    if (*((void *)internal + 12))
    {
      v5.n128_u64[0] = *(void *)&a3->timestamp;
      if (a3->timestamp > 0.0)
      {
        double v6 = *((double *)internal + 14);
        if (v6 <= 0.0
          || (double v7 = v5.n128_f64[0] - v6,
              double v8 = *((double *)internal + 11),
              v5.n128_f64[0] = v7 - v8,
              v5.n128_f64[0] >= v8 * -0.1))
        {
          double v9 = (void *)MEMORY[0x192FCD2F0](v5);
          uint64_t v10 = [CMAmbientPressureData alloc];
          *(float *)&double v11 = a3->acceleration.x;
          *(float *)&double v12 = a3->acceleration.y;
          uint64_t v15 = objc_msgSend_initWithPressure_andTimestamp_(v10, v13, v14, v11, v12, a3->timestamp);
          uint64_t v16 = *((void *)internal + 12);
          if (qword_1EB3BE878 != -1) {
            dispatch_once(&qword_1EB3BE878, &unk_1EDFC2080);
          }
          uint64_t v17 = off_1EB3BE870;
          if (os_log_type_enabled((os_log_t)off_1EB3BE870, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v18 = mach_absolute_time();
            *(_DWORD *)long long buf = 138412546;
            double v29 = v15;
            __int16 v30 = 2048;
            double v31 = sub_1902D8D34(v18);
            _os_log_impl(&dword_1902AF000, v17, OS_LOG_TYPE_DEBUG, "CMAmbientPressureData: %@,now,%f", buf, 0x16u);
          }
          if (sub_1902D8400(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1EB3BE878 != -1) {
              dispatch_once(&qword_1EB3BE878, &unk_1EDFC2080);
            }
            uint64_t v21 = mach_absolute_time();
            int v24 = 138412546;
            uint64_t v25 = v15;
            __int16 v26 = 2048;
            double v27 = sub_1902D8D34(v21);
            uint64_t v22 = (char *)_os_log_send_and_compose_impl();
            sub_1902D398C("Generic", 1, 0, 2, "-[CMMotionManager onAmbientPressure:]", "CoreLocation: %s\n", v22);
            if (v22 != (char *)buf) {
              free(v22);
            }
          }
          uint64_t v20 = (void *)*((void *)internal + 13);
          v23[0] = MEMORY[0x1E4F143A8];
          v23[1] = 3221225472;
          v23[2] = sub_1904A28DC;
          v23[3] = &unk_1E568D320;
          v23[4] = v15;
          v23[5] = v16;
          objc_msgSend_addOperationWithBlock_(v20, v19, (uint64_t)v23);

          *((void *)internal + 14) = *(void *)&a3->timestamp;
        }
      }
    }
  }
}

- (void)onCompensatedAmbientPressure:(const Sample *)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id internal = self->_internal;
  os_unfair_lock_lock((os_unfair_lock_t)internal + 2);
  *((_OWORD *)internal + 11) = *(_OWORD *)&a3->timestamp;
  os_unfair_lock_unlock((os_unfair_lock_t)internal + 2);
  if (*((void *)internal + 20))
  {
    if (*((void *)internal + 19))
    {
      v5.n128_u64[0] = *(void *)&a3->timestamp;
      if (a3->timestamp > 0.0)
      {
        double v6 = *((double *)internal + 21);
        if (v6 <= 0.0
          || (double v7 = v5.n128_f64[0] - v6,
              double v8 = *((double *)internal + 18),
              v5.n128_f64[0] = v7 - v8,
              v5.n128_f64[0] >= v8 * -0.1))
        {
          double v9 = (void *)MEMORY[0x192FCD2F0](v5);
          uint64_t v10 = [CMAmbientPressureData alloc];
          *(float *)&double v11 = a3->acceleration.x;
          *(float *)&double v12 = a3->acceleration.y;
          uint64_t v15 = objc_msgSend_initWithPressure_andTimestamp_(v10, v13, v14, v11, v12, a3->timestamp);
          uint64_t v16 = *((void *)internal + 19);
          if (qword_1EB3BE878 != -1) {
            dispatch_once(&qword_1EB3BE878, &unk_1EDFC2080);
          }
          uint64_t v17 = off_1EB3BE870;
          if (os_log_type_enabled((os_log_t)off_1EB3BE870, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v18 = mach_absolute_time();
            *(_DWORD *)long long buf = 138412546;
            double v29 = v15;
            __int16 v30 = 2048;
            double v31 = sub_1902D8D34(v18);
            _os_log_impl(&dword_1902AF000, v17, OS_LOG_TYPE_DEBUG, "CMCompensatedAmbientPressureData: %@,now,%f", buf, 0x16u);
          }
          if (sub_1902D8400(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1EB3BE878 != -1) {
              dispatch_once(&qword_1EB3BE878, &unk_1EDFC2080);
            }
            uint64_t v21 = mach_absolute_time();
            int v24 = 138412546;
            uint64_t v25 = v15;
            __int16 v26 = 2048;
            double v27 = sub_1902D8D34(v21);
            uint64_t v22 = (char *)_os_log_send_and_compose_impl();
            sub_1902D398C("Generic", 1, 0, 2, "-[CMMotionManager onCompensatedAmbientPressure:]", "CoreLocation: %s\n", v22);
            if (v22 != (char *)buf) {
              free(v22);
            }
          }
          uint64_t v20 = (void *)*((void *)internal + 20);
          v23[0] = MEMORY[0x1E4F143A8];
          v23[1] = 3221225472;
          v23[2] = sub_1904A2BD4;
          v23[3] = &unk_1E568D320;
          v23[4] = v15;
          v23[5] = v16;
          objc_msgSend_addOperationWithBlock_(v20, v19, (uint64_t)v23);

          *((void *)internal + 21) = *(void *)&a3->timestamp;
        }
      }
    }
  }
}

- (void)willResignActive:(id)a3
{
  uint64_t v5 = sub_1902D6BD0();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1904A2C6C;
  v6[3] = &unk_1E568D190;
  v6[4] = self;
  void v6[5] = a3;
  sub_1902CE9BC(v5, (uint64_t)v6);
}

- (void)willResignActivePrivate:(id)a3
{
  id internal = self->_internal;
  uint64_t v4 = (void *)sub_1902B35C0();
  if (v4) {
    sub_1902E0404(v4, 0);
  }
  uint64_t v5 = internal[81];
  if (v5)
  {
    *(CFAbsoluteTime *)(v5 + 16) = CFAbsoluteTimeGetCurrent();
    sub_19057C980(v5);
    *(CFAbsoluteTime *)(v5 + 8) = CFAbsoluteTimeGetCurrent();
  }
  *((unsigned char *)internal + 632) = 0;
}

+ (BOOL)supportsGyroMiniCalibration
{
  uint64_t v2 = sub_1902B4534();
  if (v2)
  {
    uint64_t v3 = (void *)sub_1904DF754();
    double v6 = objc_msgSend_vendor(v3, v4, v5);
    uint64_t v8 = objc_msgSend_proxyForService_(v6, v7, @"CLGyroCalibrationDatabase");
    LOBYTE(v2) = MEMORY[0x1F4181798](v8, sel_syncgetSupportsMiniCalibration, v9);
  }
  return v2;
}

+ (BOOL)startGyroMiniCalibration
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (std::__shared_weak_count *)operator new(0x70uLL);
  v2->__shared_owners_ = 0;
  v2->__shared_weak_owners_ = 0;
  v2->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EDFD0DA0;
  sub_1902C3F54(__p, "kCLConnectionMessageStartMiniCal");
  MEMORY[0x192FCC410](&v2[1], __p);
  if (v26 < 0) {
    operator delete(__p[0]);
  }
  uint64_t v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v7 = objc_msgSend_setWithObjects_(v3, v6, v4, v5, 0);
  uint64_t v21 = v2 + 1;
  uint64_t v22 = v2;
  atomic_fetch_add_explicit(&v2->__shared_owners_, 1uLL, memory_order_relaxed);
  uint64_t v10 = objc_msgSend_sendMessage_withReplyClassesSync_(CMMotionUtils, v8, (uint64_t)&v21, v7);
  if (v22) {
    sub_1902D8B58(v22);
  }
  double v11 = objc_msgSend_objectForKeyedSubscript_(v10, v9, @"CMErrorMessage");
  if (v11)
  {
    if (qword_1EB3BE878 != -1) {
      dispatch_once(&qword_1EB3BE878, &unk_1EDFC2080);
    }
    double v12 = off_1EB3BE870;
    if (os_log_type_enabled((os_log_t)off_1EB3BE870, OS_LOG_TYPE_FAULT))
    {
      int v15 = objc_msgSend_intValue(v11, v13, v14);
      LODWORD(__p[0]) = 67240192;
      HIDWORD(__p[0]) = v15;
      _os_log_impl(&dword_1902AF000, v12, OS_LOG_TYPE_FAULT, "Unable to start minical. Error code %{public}d", (uint8_t *)__p, 8u);
    }
    if (sub_1902D8400(115, 0))
    {
      bzero(__p, 0x65CuLL);
      if (qword_1EB3BE878 != -1) {
        dispatch_once(&qword_1EB3BE878, &unk_1EDFC2080);
      }
      int v19 = objc_msgSend_intValue(v11, v17, v18);
      int v23 = 67240192;
      int v24 = v19;
      uint64_t v20 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 0, "+[CMMotionManager startGyroMiniCalibration]", "CoreLocation: %s\n", v20);
      if (v20 != (char *)__p) {
        free(v20);
      }
    }
  }
  sub_1902D8B58(v2);
  return v11 == 0;
}

+ (BOOL)configureM7Activity:(BOOL)a3 stepCounting:(BOOL)a4 activityForceCodeTransition:(BOOL)a5 stepCountingForceCodeTransition:(BOOL)a6 threshold:(BOOL)a7 onBodyDetection:(BOOL)a8 ispMode:(unsigned __int8)a9 predictionInterval:(float)a10 logLevel:(char)a11 proactiveRevisitTime:(unsigned __int16)a12
{
  uint64_t v12 = 0x10000000000;
  if (!a8) {
    uint64_t v12 = 0;
  }
  unint64_t v13 = v12 | ((unint64_t)a9 << 48);
  uint64_t v14 = 0x100000000;
  if (!a7) {
    uint64_t v14 = 0;
  }
  uint64_t v15 = 0x1000000;
  if (!a6) {
    uint64_t v15 = 0;
  }
  uint64_t v16 = v14 | v15;
  uint64_t v17 = 0x10000;
  if (!a5) {
    uint64_t v17 = 0;
  }
  uint64_t v18 = v16 | v17;
  uint64_t v19 = 256;
  if (!a4) {
    uint64_t v19 = 0;
  }
  return sub_190554FE8(v13 | v18 | v19 | a3, (const char *)(((unint64_t)a11 << 32) | ((unint64_t)a12 << 48) | LODWORD(a10)), a3) != 0;
}

+ ($B9CA342F461DD9C11232D7AF76457BE1)gyroCalibrationDatabaseGetBiasFit
{
  uint64_t v4 = (void *)sub_1904DF754();
  uint64_t v7 = objc_msgSend_vendor(v4, v5, v6);
  uint64_t v9 = objc_msgSend_proxyForService_(v7, v8, @"CLGyroCalibrationDatabase");
  id result = ($B9CA342F461DD9C11232D7AF76457BE1 *)objc_msgSend_syncgetBiasFit_(v9, v10, (uint64_t)retstr);
  if ((result & 1) == 0)
  {
    bzero(retstr, 0x140uLL);
    retstr->double var0 = 1;
    retstr->double var1 = -1.79769313e308;
  }
  return result;
}

+ ($B9CA342F461DD9C11232D7AF76457BE1)gyroCalibrationDatabaseGetBiasFitAndEstimate:(SEL)a3 atTemperature:(id *)a4
{
  *(_OWORD *)&retstr->var5.var1.var1[255] = 0u;
  *(_OWORD *)&retstr->var5.var1.var1[271] = 0u;
  *(_OWORD *)&retstr->var5.var1.var1[223] = 0u;
  *(_OWORD *)&retstr->var5.var1.var1[239] = 0u;
  *(_OWORD *)&retstr->var5.var1.var1[191] = 0u;
  *(_OWORD *)&retstr->var5.var1.var1[207] = 0u;
  *(_OWORD *)&retstr->var5.var1.var1[159] = 0u;
  *(_OWORD *)&retstr->var5.var1.var1[175] = 0u;
  *(_OWORD *)&retstr->var5.var1.var1[127] = 0u;
  *(_OWORD *)&retstr->var5.var1.var1[143] = 0u;
  *(_OWORD *)&retstr->var5.var1.var1[95] = 0u;
  *(_OWORD *)&retstr->var5.var1.var1[111] = 0u;
  *(_OWORD *)&retstr->var5.var1.var1[63] = 0u;
  *(_OWORD *)&retstr->var5.var1.var1[79] = 0u;
  *(_OWORD *)&retstr->var5.var1.var1[31] = 0u;
  *(_OWORD *)&retstr->var5.var1.var1[47] = 0u;
  *(_OWORD *)&retstr->var5.var0.var0.double var0 = 0u;
  *(_OWORD *)&retstr->var5.var1.var1[15] = 0u;
  *(_OWORD *)&retstr->double var0 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  id result = ($B9CA342F461DD9C11232D7AF76457BE1 *)objc_msgSend_gyroCalibrationDatabaseGetBiasFit(CMMotionManager, a3, (uint64_t)a4);
  if (a4)
  {
    if (retstr->var0 == 2)
    {
      memcpy(__dst, (char *)&retstr->var5.var0.var0.var0 + 1, sizeof(__dst));
      id result = ($B9CA342F461DD9C11232D7AF76457BE1 *)sub_19056A518((float *)__dst, a5);
      v10.i32[1] = v9;
      *(float64x2_t *)&a4->double var0 = vcvtq_f64_f32(vmul_f32(v10, (float32x2_t)vdup_n_s32(0x42652EE1u)));
      float v8 = v11 * 57.296;
      goto LABEL_6;
    }
    if (retstr->var0 == 1)
    {
      *(float64x2_t *)&a4->double var0 = vcvtq_f64_f32(vmla_n_f32(*(float32x2_t *)&retstr->var5.var1.var1[11], *(float32x2_t *)&retstr->var5.var0.var0.var0, a5));
      float v8 = retstr->var5.var0.var1.var2 + (float)(retstr->var5.var0.var0.var2 * a5);
LABEL_6:
      a4->var2 = v8;
      return result;
    }
    a4->double var0 = 0.0;
    a4->double var1 = 0.0;
    a4->var2 = 0.0;
  }
  return result;
}

+ (BOOL)hasRunMiniCal
{
  return objc_msgSend_featureAvailability_(CMMotionUtils, a2, (uint64_t)"kCLConnectionMessageHasRunMiniCal");
}

- (BOOL)isDeviceMotionLiteAvailable
{
  return 0;
}

- (void)startDeviceMotionLiteUpdatesForDeviceID:(id)a3 usingConfiguration:(id)a4 toQueue:(id)a5 withFusedHandler:(id)a6
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (qword_1EB3BE878 != -1) {
    goto LABEL_11;
  }
  while (1)
  {
    uint64_t v6 = off_1EB3BE870;
    if (os_log_type_enabled((os_log_t)off_1EB3BE870, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)long long buf = 68289539;
      int v10 = 0;
      __int16 v11 = 2082;
      uint64_t v12 = "";
      __int16 v13 = 2082;
      uint64_t v14 = "assert";
      __int16 v15 = 2081;
      uint64_t v16 = "0";
      _os_log_impl(&dword_1902AF000, v6, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Motion manager can not start device motion lite updates, use isDeviceMotionLiteAvailable before using this API\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EB3BE878 != -1) {
        dispatch_once(&qword_1EB3BE878, &unk_1EDFC2080);
      }
    }
    uint64_t v7 = off_1EB3BE870;
    if (os_signpost_enabled((os_log_t)off_1EB3BE870))
    {
      *(_DWORD *)long long buf = 68289539;
      int v10 = 0;
      __int16 v11 = 2082;
      uint64_t v12 = "";
      __int16 v13 = 2082;
      uint64_t v14 = "assert";
      __int16 v15 = 2081;
      uint64_t v16 = "0";
      _os_signpost_emit_with_name_impl(&dword_1902AF000, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Motion manager can not start device motion lite updates, use isDeviceMotionLiteAvailable before using this API", "{\"msg%{public}.0s\":\"Motion manager can not start device motion lite updates, use isDeviceMotionLiteAvailable before using this API\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EB3BE878 != -1) {
        dispatch_once(&qword_1EB3BE878, &unk_1EDFC2080);
      }
    }
    float v8 = off_1EB3BE870;
    if (os_log_type_enabled((os_log_t)off_1EB3BE870, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 68289539;
      int v10 = 0;
      __int16 v11 = 2082;
      uint64_t v12 = "";
      __int16 v13 = 2082;
      uint64_t v14 = "assert";
      __int16 v15 = 2081;
      uint64_t v16 = "0";
      _os_log_impl(&dword_1902AF000, v8, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Motion manager can not start device motion lite updates, use isDeviceMotionLiteAvailable before using this API\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
LABEL_11:
    dispatch_once(&qword_1EB3BE878, &unk_1EDFC2080);
  }
}

- (void)startDeviceMotionLiteFusedUpdatesForDeviceID:(id)a3 toQueue:(id)a4 withHandler:(id)a5
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (qword_1EB3BE878 != -1) {
    dispatch_once(&qword_1EB3BE878, &unk_1EDFC2080);
  }
  uint64_t v6 = off_1EB3BE870;
  if (os_log_type_enabled((os_log_t)off_1EB3BE870, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v9 = a3;
    _os_log_impl(&dword_1902AF000, v6, OS_LOG_TYPE_DEFAULT, "Motion manager asked to start device motion lite updates for device id %@", buf, 0xCu);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EB3BE878 != -1) {
      dispatch_once(&qword_1EB3BE878, &unk_1EDFC2080);
    }
    uint64_t v7 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CMMotionManager startDeviceMotionLiteFusedUpdatesForDeviceID:toQueue:withHandler:]", "CoreLocation: %s\n", v7);
    if (v7 != (char *)buf) {
      free(v7);
    }
  }
}

- (void)stopDeviceMotionLiteUpdatesForDeviceID:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (qword_1EB3BE878 != -1) {
    dispatch_once(&qword_1EB3BE878, &unk_1EDFC2080);
  }
  uint64_t v4 = off_1EB3BE870;
  if (os_log_type_enabled((os_log_t)off_1EB3BE870, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v7 = a3;
    _os_log_impl(&dword_1902AF000, v4, OS_LOG_TYPE_DEFAULT, "Motion manager asked to stop device motion lite updates for device id %@", buf, 0xCu);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EB3BE878 != -1) {
      dispatch_once(&qword_1EB3BE878, &unk_1EDFC2080);
    }
    uint64_t v5 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CMMotionManager stopDeviceMotionLiteUpdatesForDeviceID:]", "CoreLocation: %s\n", v5);
    if (v5 != (char *)buf) {
      free(v5);
    }
  }
}

- (void)startFactoryGyroUpdatesToQueue:(id)a3 withHandler:(id)a4
{
  uint64_t v7 = sub_1902D6BD0();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1904A3868;
  v8[3] = &unk_1E568D398;
  v8[4] = self;
  v8[5] = a3;
  void v8[6] = a4;
  sub_1902CE9BC(v7, (uint64_t)v8);
}

- (void)startFactoryGyroUpdatesToQueue:(id)a3 atUpdateInterval:(double)a4 withHandler:(id)a5
{
  uint64_t v9 = sub_1902D6BD0();
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1904A3924;
  v10[3] = &unk_1E568DE28;
  v10[4] = self;
  v10[5] = a3;
  *(double *)&v10[7] = a4;
  v10[6] = a5;
  sub_1902CE9BC(v9, (uint64_t)v10);
}

- (void)startFactoryGyroUpdatesToQueue:(id)a3 atUpdateInterval:(double)a4 withHandler:(id)a5 residualHandler:(id)a6
{
  uint64_t v11 = sub_1902D6BD0();
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1904A39E0;
  v12[3] = &unk_1E568DFE0;
  v12[4] = self;
  v12[5] = a3;
  *(double *)&v12[8] = a4;
  v12[6] = a5;
  v12[7] = a6;
  sub_1902CE9BC(v11, (uint64_t)v12);
}

- (void)stopFactoryGyroUpdates
{
  uint64_t v3 = sub_1902D6BD0();
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_1904A3A70;
  v4[3] = &unk_1E568D118;
  v4[4] = self;
  sub_1902CDE98(v3, (uint64_t)v4);
}

- (void)startDeviceMotionUpdatesForKeyboardMotionToQueue:(id)a3 withGravityDeltaThreshold:(double)a4 sendFrequency:(double)a5 andHandler:(id)a6
{
  uint64_t v11 = sub_1902D6BD0();
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1904A3B1C;
  v12[3] = &unk_1E568E008;
  v12[4] = self;
  v12[5] = a3;
  *(double *)&v12[7] = a4;
  *(double *)&v12[8] = a5;
  v12[6] = a6;
  sub_1902CE9BC(v11, (uint64_t)v12);
}

- (void)stopDeviceMotionUpdatesForKeyboardMotion
{
  uint64_t v3 = sub_1902D6BD0();
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_1904A3BAC;
  v4[3] = &unk_1E568D118;
  v4[4] = self;
  sub_1902CE9BC(v3, (uint64_t)v4);
}

- (void)startFactoryGyroUpdatesPrivateToQueue:(id)a3 atUpdateInterval:(double)a4 withHandler:(id)a5 residualHandler:(id)a6
{
  uint64_t v158 = *MEMORY[0x1E4F143B8];
  id internal = (char *)self->_internal;
  if (qword_1EB3BE868 != -1) {
    dispatch_once(&qword_1EB3BE868, &unk_1EDFD4380);
  }
  uint64_t v11 = qword_1EB3BE860;
  if (os_log_type_enabled((os_log_t)qword_1EB3BE860, OS_LOG_TYPE_DEFAULT))
  {
    float buf = 3.9122e-34;
    double buf_4 = a4;
    _os_log_impl(&dword_1902AF000, v11, OS_LOG_TYPE_DEFAULT, "Starting factory gyro updates at rate: %{public}f", (uint8_t *)&buf, 0xCu);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(&buf, 0x65CuLL);
    if (qword_1EB3BE868 != -1) {
      dispatch_once(&qword_1EB3BE868, &unk_1EDFD4380);
    }
    int __src = 134349056;
    double __src_4 = a4;
    v116 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CMMotionManager startFactoryGyroUpdatesPrivateToQueue:atUpdateInterval:withHandler:residualHandler:]", "CoreLocation: %s\n", v116);
    if (v116 != (char *)&buf) {
      free(v116);
    }
  }
  if (a4 <= 0.0)
  {
    if (qword_1EB3BE868 != -1) {
      dispatch_once(&qword_1EB3BE868, &unk_1EDFD4380);
    }
    uint64_t v19 = qword_1EB3BE860;
    if (os_log_type_enabled((os_log_t)qword_1EB3BE860, OS_LOG_TYPE_ERROR))
    {
      float buf = 3.9122e-34;
      double buf_4 = a4;
      _os_log_impl(&dword_1902AF000, v19, OS_LOG_TYPE_ERROR, "Invalid update interval: %{public}f", (uint8_t *)&buf, 0xCu);
    }
    if (sub_1902D8400(115, 0))
    {
      bzero(&buf, 0x65CuLL);
      if (qword_1EB3BE868 != -1) {
        dispatch_once(&qword_1EB3BE868, &unk_1EDFD4380);
      }
      int __src = 134349056;
      double __src_4 = a4;
      uint64_t v20 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 0, "-[CMMotionManager startFactoryGyroUpdatesPrivateToQueue:atUpdateInterval:withHandler:residualHandler:]", "CoreLocation: %s\n", v20);
      if (v20 != (char *)&buf) {
        free(v20);
      }
    }
  }
  else
  {
    *((double *)internal + 83) = a4;
    id v12 = (id)*((void *)internal + 87);
    if (v12 != a3)
    {

      *((void *)internal + 87) = a3;
    }
    id v13 = (id)*((void *)internal + 86);
    if (v13 != a5)
    {

      *((void *)internal + 86) = objc_msgSend_copy(a5, v14, v15);
    }
    v125 = 0;
    v126 = 0;
    uint64_t v127 = 0;
    double v124 = 0.0;
    sub_1905991EC((float **)&v125, &v124);
    if (v124 == 0.0)
    {
      id v120 = a6;
      uint64_t v22 = (float *)v125;
      uint64_t v21 = v126;
      if (v125 == v126)
      {
        double v31 = 0;
        uint64_t v25 = 0;
      }
      else
      {
        unint64_t v23 = 0;
        int v24 = 0;
        uint64_t v25 = 0;
        do
        {
          float v27 = *v22;
          float v26 = v22[1];
          float v29 = v22[2];
          float v28 = v22[3];
          if (qword_1EB3BE868 != -1) {
            dispatch_once(&qword_1EB3BE868, &unk_1EDFD4380);
          }
          __int16 v30 = qword_1EB3BE860;
          if (os_log_type_enabled((os_log_t)qword_1EB3BE860, OS_LOG_TYPE_DEFAULT))
          {
            float buf = 3.8523e-34;
            double buf_4 = v27;
            __int16 buf_12 = 2048;
            double buf_14 = v26;
            __int16 v150 = 2048;
            double v151 = v29;
            __int16 v152 = 2048;
            double v153 = v28;
            _os_log_impl(&dword_1902AF000, v30, OS_LOG_TYPE_DEFAULT, "GYTT temperature,%f,bias.x,%f,bias.y,%f,bias.z,%f", (uint8_t *)&buf, 0x2Au);
          }
          if (sub_1902D8400(115, 2))
          {
            bzero(&buf, 0x65CuLL);
            if (qword_1EB3BE868 != -1) {
              dispatch_once(&qword_1EB3BE868, &unk_1EDFD4380);
            }
            int __src = 134218752;
            double __src_4 = v27;
            __int16 __src_12 = 2048;
            double __src_14 = v26;
            __int16 v138 = 2048;
            double v139 = v29;
            __int16 v140 = 2048;
            double v141 = v28;
            float v38 = (char *)_os_log_send_and_compose_impl();
            sub_1902D398C("Generic", 1, 0, 2, "-[CMMotionManager startFactoryGyroUpdatesPrivateToQueue:atUpdateInterval:withHandler:residualHandler:]", "CoreLocation: %s\n", v38);
            if (v38 != (char *)&buf) {
              free(v38);
            }
          }
          if ((unint64_t)v24 >= v23)
          {
            unint64_t v32 = 0xAAAAAAAAAAAAAAABLL * (((char *)v24 - (char *)v25) >> 3) + 1;
            if (v32 > 0xAAAAAAAAAAAAAAALL) {
              sub_1903479E8();
            }
            if (0x5555555555555556 * ((uint64_t)(v23 - (void)v25) >> 3) > v32) {
              unint64_t v32 = 0x5555555555555556 * ((uint64_t)(v23 - (void)v25) >> 3);
            }
            if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v23 - (void)v25) >> 3) >= 0x555555555555555) {
              unint64_t v33 = 0xAAAAAAAAAAAAAAALL;
            }
            else {
              unint64_t v33 = v32;
            }
            if (v33) {
              unint64_t v33 = (unint64_t)sub_1904A6DCC(v33);
            }
            else {
              uint64_t v34 = 0;
            }
            unint64_t v35 = v33 + 8 * (((char *)v24 - (char *)v25) >> 3);
            *(float *)unint64_t v35 = v27;
            *(float *)(v35 + 4) = v26;
            *(float *)(v35 + 8) = v29;
            *(float *)(v35 + 12) = v28;
            *(void *)(v35 + 16) = 0;
            if (v24 == v25)
            {
              uint64_t v25 = (float *)(v33 + 8 * (((char *)v24 - (char *)v25) >> 3));
            }
            else
            {
              float v36 = (float *)(v33 + 8 * (((char *)v24 - (char *)v25) >> 3));
              do
              {
                long long v37 = *(_OWORD *)(v24 - 6);
                *((void *)v36 - 1) = *((void *)v24 - 1);
                *(_OWORD *)(v36 - 6) = v37;
                v36 -= 6;
                v24 -= 6;
              }
              while (v24 != v25);
              int v24 = v25;
              uint64_t v25 = v36;
            }
            unint64_t v23 = v33 + 24 * v34;
            double v31 = (float *)(v35 + 24);
            if (v24) {
              operator delete(v24);
            }
          }
          else
          {
            *int v24 = v27;
            v24[1] = v26;
            v24[2] = v29;
            v24[3] = v28;
            double v31 = v24 + 6;
            *((void *)v24 + 2) = 0;
          }
          v22 += 4;
          int v24 = v31;
        }
        while (v22 != v21);
      }
      if ((sub_1902CD6B0() & 0x20000) != 0) {
        operator new();
      }
      if ((sub_1902CD6B0() & 0x10000) != 0)
      {
        __p[0] = 0;
        __p[1] = 0;
        uint64_t v133 = 0;
        sub_19058CBEC(v25, v31, 0, 0, (float *)__p);
        if (qword_1EB3BE868 != -1) {
          dispatch_once(&qword_1EB3BE868, &unk_1EDFD4380);
        }
        float32x2_t v48 = qword_1EB3BE860;
        if (os_log_type_enabled((os_log_t)qword_1EB3BE860, OS_LOG_TYPE_DEFAULT))
        {
          float buf = 3.9128e-34;
          double buf_4 = *(float *)__p;
          __int16 buf_12 = 2050;
          double buf_14 = *((float *)__p + 1);
          __int16 v150 = 2050;
          double v151 = *(float *)&__p[1];
          __int16 v152 = 2050;
          double v153 = *((float *)&__p[1] + 1);
          __int16 v154 = 2050;
          double v155 = *(float *)&v133;
          __int16 v156 = 2050;
          double v157 = *((float *)&v133 + 1);
          _os_log_impl(&dword_1902AF000, v48, OS_LOG_TYPE_DEFAULT, "Linear fit slope:%{public}f,%{public}f,%{public}f intercept:%{public}f,%{public}f,%{public}f", (uint8_t *)&buf, 0x3Eu);
        }
        if (sub_1902D8400(115, 2))
        {
          bzero(&buf, 0x65CuLL);
          if (qword_1EB3BE868 != -1) {
            dispatch_once(&qword_1EB3BE868, &unk_1EDFD4380);
          }
          int __src = 134350336;
          double __src_4 = *(float *)__p;
          __int16 __src_12 = 2050;
          double __src_14 = *((float *)__p + 1);
          __int16 v138 = 2050;
          double v139 = *(float *)&__p[1];
          __int16 v140 = 2050;
          double v141 = *((float *)&__p[1] + 1);
          __int16 v142 = 2050;
          double v143 = *(float *)&v133;
          __int16 v144 = 2050;
          double v145 = *((float *)&v133 + 1);
          v118 = (char *)_os_log_send_and_compose_impl();
          sub_1902D398C("Generic", 1, 0, 2, "-[CMMotionManager startFactoryGyroUpdatesPrivateToQueue:atUpdateInterval:withHandler:residualHandler:]", "CoreLocation: %s\n", v118);
          if (v118 != (char *)&buf) {
            free(v118);
          }
        }
        internal[716] = 1;
        *((void *)internal + 127) = v133;
        *(_OWORD *)(internal + 1000) = *(_OWORD *)__p;
        if (!*((void *)internal + 84)) {
          operator new();
        }
        if (!*((void *)internal + 82)) {
          operator new();
        }
        if (v120 && *((void *)internal + 87))
        {
          double v51 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v49, v50);
          double v54 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v52, v53);
          double v57 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v55, v56);
          double v61 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v58, v59);
          if (v25 != v31)
          {
            long long v62 = v25;
            do
            {
              if ((sub_1902CD6B0() & 0x20000) != 0)
              {
                sub_19056A518((float *)(internal + 717), *v62);
                float v84 = v83;
                float v86 = v85;
                *(float *)&double v88 = (float)(v87 * 57.296) - v62[1];
                uint64_t v91 = objc_msgSend_numberWithFloat_(NSNumber, v89, v90, v88);
                objc_msgSend_addObject_(v51, v92, v91);
                *(float *)&double v93 = (float)(v84 * 57.296) - v62[2];
                uint64_t v96 = objc_msgSend_numberWithFloat_(NSNumber, v94, v95, v93);
                objc_msgSend_addObject_(v54, v97, v96);
                *(float *)&double v98 = (float)(v86 * 57.296) - v62[3];
                uint64_t v101 = objc_msgSend_numberWithFloat_(NSNumber, v99, v100, v98);
                objc_msgSend_addObject_(v57, v102, v101);
              }
              else
              {
                uint64_t v66 = 0;
                float v67 = *v62;
                do
                {
                  *(float *)((char *)&buf + v66) = *(float *)&internal[v66 + 1012]
                                                 + (float)(v67 * *(float *)&internal[v66 + 1000]);
                  v66 += 4;
                }
                while (v66 != 12);
                *(float *)&double v65 = buf - v62[1];
                uint64_t v68 = objc_msgSend_numberWithFloat_(NSNumber, v63, v64, v65);
                objc_msgSend_addObject_(v51, v69, v68);
                *(float *)&double v70 = *(float *)&buf_4 - v62[2];
                uint64_t v73 = objc_msgSend_numberWithFloat_(NSNumber, v71, v72, v70);
                objc_msgSend_addObject_(v54, v74, v73);
                *(float *)&double v75 = *((float *)&buf_4 + 1) - v62[3];
                uint64_t v78 = objc_msgSend_numberWithFloat_(NSNumber, v76, v77, v75);
                objc_msgSend_addObject_(v57, v79, v78);
              }
              *(float *)&double v82 = *v62;
              uint64_t v103 = objc_msgSend_numberWithFloat_(NSNumber, v80, v81, v82);
              objc_msgSend_addObject_(v61, v104, v103);
              v62 += 6;
            }
            while (v62 != v31);
          }
          uint64_t v105 = objc_msgSend_arrayWithArray_(MEMORY[0x1E4F1C978], v60, (uint64_t)v51);
          uint64_t v107 = objc_msgSend_arrayWithArray_(MEMORY[0x1E4F1C978], v106, (uint64_t)v54);
          uint64_t v109 = objc_msgSend_arrayWithArray_(MEMORY[0x1E4F1C978], v108, (uint64_t)v57);
          uint64_t v111 = objc_msgSend_arrayWithArray_(MEMORY[0x1E4F1C978], v110, (uint64_t)v61);
          v128[0] = @"x";
          v128[1] = @"y";
          v129[0] = v105;
          v129[1] = v107;
          v128[2] = @"z";
          v128[3] = @"temperature";
          v129[2] = v109;
          v129[3] = v111;
          uint64_t v113 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v112, (uint64_t)v129, v128, 4);
          v114 = (void *)*((void *)internal + 87);
          v121[0] = MEMORY[0x1E4F143A8];
          v121[1] = 3221225472;
          v121[2] = sub_1904A5754;
          v121[3] = &unk_1E568D320;
          v121[4] = v113;
          v121[5] = v120;
          objc_msgSend_addOperationWithBlock_(v114, v115, (uint64_t)v121);
        }
      }
      else
      {
        double v40 = COERCE_DOUBLE(objc_msgSend_stringWithFormat_(NSString, v39, @"Missing gyro linearity information. Please file a radar against CoreMotion Factory | All to add support for this device."));
        id v41 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v130 = *MEMORY[0x1E4F28568];
        double v131 = v40;
        uint64_t v43 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v42, (uint64_t)&v131, &v130, 1);
        double v124 = COERCE_DOUBLE((id)objc_msgSend_initWithDomain_code_userInfo_(v41, v44, @"CMErrorDomainFactory", 2, v43));
        if (qword_1EB3BE868 != -1) {
          dispatch_once(&qword_1EB3BE868, &unk_1EDFD4380);
        }
        double v45 = qword_1EB3BE860;
        if (os_log_type_enabled((os_log_t)qword_1EB3BE860, OS_LOG_TYPE_ERROR))
        {
          float buf = 5.8381e-34;
          double buf_4 = v40;
          _os_log_impl(&dword_1902AF000, v45, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&buf, 0xCu);
        }
        if (sub_1902D8400(115, 0))
        {
          bzero(&buf, 0x65CuLL);
          if (qword_1EB3BE868 != -1) {
            dispatch_once(&qword_1EB3BE868, &unk_1EDFD4380);
          }
          int __src = 138543362;
          double __src_4 = v40;
          v119 = (char *)_os_log_send_and_compose_impl();
          sub_1902D398C("Generic", 1, 0, 0, "-[CMMotionManager startFactoryGyroUpdatesPrivateToQueue:atUpdateInterval:withHandler:residualHandler:]", "CoreLocation: %s\n", v119);
          if (v119 != (char *)&buf) {
            free(v119);
          }
        }
        uint64_t v47 = (void *)*((void *)internal + 87);
        if (v47 && *((void *)internal + 86))
        {
          v122[0] = MEMORY[0x1E4F143A8];
          v122[1] = 3221225472;
          v122[2] = sub_1904A5734;
          v122[3] = &unk_1E568D190;
          v122[4] = internal;
          *(double *)&v122[5] = v124;
          objc_msgSend_addOperationWithBlock_(v47, v46, (uint64_t)v122);
        }
      }
      if (v25) {
        operator delete(v25);
      }
    }
    else
    {
      if (qword_1EB3BE868 != -1) {
        dispatch_once(&qword_1EB3BE868, &unk_1EDFD4380);
      }
      uint64_t v16 = qword_1EB3BE860;
      if (os_log_type_enabled((os_log_t)qword_1EB3BE860, OS_LOG_TYPE_ERROR))
      {
        float buf = 5.7779e-34;
        double buf_4 = v124;
        _os_log_impl(&dword_1902AF000, v16, OS_LOG_TYPE_ERROR, "Error found while reading GYTT: %@", (uint8_t *)&buf, 0xCu);
      }
      if (sub_1902D8400(115, 0))
      {
        bzero(&buf, 0x65CuLL);
        if (qword_1EB3BE868 != -1) {
          dispatch_once(&qword_1EB3BE868, &unk_1EDFD4380);
        }
        int __src = 138412290;
        double __src_4 = v124;
        v117 = (char *)_os_log_send_and_compose_impl();
        sub_1902D398C("Generic", 1, 0, 0, "-[CMMotionManager startFactoryGyroUpdatesPrivateToQueue:atUpdateInterval:withHandler:residualHandler:]", "CoreLocation: %s\n", v117);
        if (v117 != (char *)&buf) {
          free(v117);
        }
      }
      uint64_t v18 = (void *)*((void *)internal + 87);
      if (v18 && *((void *)internal + 86))
      {
        v123[0] = MEMORY[0x1E4F143A8];
        v123[1] = 3221225472;
        v123[2] = sub_1904A5714;
        v123[3] = &unk_1E568D190;
        v123[4] = internal;
        *(double *)&v123[5] = v124;
        objc_msgSend_addOperationWithBlock_(v18, v17, (uint64_t)v123);
      }
    }
    if (v125)
    {
      v126 = (float *)v125;
      operator delete(v125);
    }
  }
}

- (void)stopFactoryGyroUpdatesPrivate
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id internal = (char *)self->_internal;
  if (qword_1EB3BE868 != -1) {
    dispatch_once(&qword_1EB3BE868, &unk_1EDFD4380);
  }
  uint64_t v3 = qword_1EB3BE860;
  if (os_log_type_enabled((os_log_t)qword_1EB3BE860, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)float buf = 0;
    _os_log_impl(&dword_1902AF000, v3, OS_LOG_TYPE_DEFAULT, "Stopping factory gyro updates.", buf, 2u);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EB3BE868 != -1) {
      dispatch_once(&qword_1EB3BE868, &unk_1EDFD4380);
    }
    uint64_t v11 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CMMotionManager stopFactoryGyroUpdatesPrivate]", "CoreLocation: %s\n", v11);
    if (v11 != (char *)buf) {
      free(v11);
    }
  }
  *(_OWORD *)(internal + 983) = 0u;
  *(_OWORD *)(internal + 956) = 0u;
  *(_OWORD *)(internal + 972) = 0u;
  *(_OWORD *)(internal + 924) = 0u;
  *(_OWORD *)(internal + 940) = 0u;
  *(_OWORD *)(internal + 892) = 0u;
  *(_OWORD *)(internal + 908) = 0u;
  *(_OWORD *)(internal + 860) = 0u;
  *(_OWORD *)(internal + 876) = 0u;
  *(_OWORD *)(internal + 828) = 0u;
  *(_OWORD *)(internal + 844) = 0u;
  *(_OWORD *)(internal + 796) = 0u;
  *(_OWORD *)(internal + 812) = 0u;
  *(_OWORD *)(internal + 764) = 0u;
  *(_OWORD *)(internal + 780) = 0u;
  *(_OWORD *)(internal + 732) = 0u;
  *(_OWORD *)(internal + 748) = 0u;
  *(_OWORD *)(internal + 716) = 0u;
  if (*((void *)internal + 82))
  {
    uint64_t v4 = sub_1902B4534();
    sub_1902CDE08(v4, 0, *((void *)internal + 82));
    uint64_t v5 = *((void *)internal + 82);
    if (v5) {
      (*(void (**)(uint64_t))(*(void *)v5 + 8))(v5);
    }
    *((void *)internal + 82) = 0;
    uint64_t v6 = (unsigned __int8 *)*((void *)internal + 81);
    if (v6) {
      sub_19057C928(v6, 2);
    }
  }
  if (*((void *)internal + 84))
  {
    uint64_t v7 = sub_1902B4534();
    sub_1902CDE08(v7, 1, *((void *)internal + 84));
    uint64_t v8 = *((void *)internal + 84);
    if (v8) {
      (*(void (**)(uint64_t))(*(void *)v8 + 8))(v8);
    }
    *((void *)internal + 84) = 0;
  }
  uint64_t v9 = (void *)*((void *)internal + 87);
  if (v9)
  {

    *((void *)internal + 87) = 0;
  }
  uint64_t v10 = (void *)*((void *)internal + 86);
  if (v10)
  {

    *((void *)internal + 86) = 0;
  }
}

- (void)startDeviceMotionUpdatesForKeyboardMotionPrivateToQueue:(id)a3 withGravityDeltaThreshold:(double)a4 notificationFrequency:(double)a5 andHandler:(id)a6
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id internal = (float *)self->_internal;
  if (qword_1EB3BE868 != -1) {
    dispatch_once(&qword_1EB3BE868, &unk_1EDFD4380);
  }
  uint64_t v11 = qword_1EB3BE860;
  if (os_log_type_enabled((os_log_t)qword_1EB3BE860, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)float buf = 0;
    _os_log_impl(&dword_1902AF000, v11, OS_LOG_TYPE_DEFAULT, "Starting keyboard motion updates.", buf, 2u);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EB3BE868 != -1) {
      dispatch_once(&qword_1EB3BE868, &unk_1EDFD4380);
    }
    LOWORD(v24[0]) = 0;
    unint64_t v23 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CMMotionManager startDeviceMotionUpdatesForKeyboardMotionPrivateToQueue:withGravityDeltaThreshold:notificationFrequency:andHandler:]", "CoreLocation: %s\n", v23);
    if (v23 != (char *)buf) {
      free(v23);
    }
  }
  if (sub_19046BCE8())
  {
    id v12 = (id)*((void *)internal + 129);
    if (v12 != a3)
    {

      *((void *)internal + 129) = a3;
    }
    id v13 = (id)*((void *)internal + 128);
    if (v13 != a6)
    {

      *((void *)internal + 128) = a6;
    }
    sub_1902E0560((char *)buf, @"com.apple.CoreMotion", 1);
    v24[0] = 0;
    int v14 = sub_1902C5108((uint64_t)buf, @"KeyboardMotionGravityThreshold", v24);
    double v15 = *(double *)v24;
    v24[0] = 0;
    int v16 = sub_1902C5108((uint64_t)buf, @"KeyboardMotionGravitySendFrequency", v24);
    if (v14) {
      double v17 = v15;
    }
    else {
      double v17 = a4;
    }
    double v18 = *(double *)v24;
    if (!v16) {
      double v18 = a5;
    }
    float v19 = v17;
    float v20 = v18;
    internal[267] = v19;
    internal[268] = v20;
    if (!*((void *)internal + 130))
    {
      uint64_t v21 = [CLDeviceMotionProperties alloc];
      objc_msgSend_initWithMode_(v21, v22, 3);
      operator new();
    }
    sub_1902BAD40();
    if (sub_19046BCE8())
    {
      if (!*((void *)internal + 135)) {
        operator new();
      }
    }
    sub_19047E7E8((uint64_t)buf);
  }
}

- (void)stopDeviceMotionUpdatesForKeyboardMotionPrivate
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id internal = self->_internal;
  if (qword_1EB3BE868 != -1) {
    dispatch_once(&qword_1EB3BE868, &unk_1EDFD4380);
  }
  uint64_t v3 = qword_1EB3BE860;
  if (os_log_type_enabled((os_log_t)qword_1EB3BE860, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)float buf = 0;
    _os_log_impl(&dword_1902AF000, v3, OS_LOG_TYPE_DEFAULT, "Stopping keyboard motion updates.", buf, 2u);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EB3BE868 != -1) {
      dispatch_once(&qword_1EB3BE868, &unk_1EDFD4380);
    }
    uint64_t v10 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CMMotionManager stopDeviceMotionUpdatesForKeyboardMotionPrivate]", "CoreLocation: %s\n", v10);
    if (v10 != (char *)buf) {
      free(v10);
    }
  }
  if (sub_19046BCE8())
  {
    if (internal[130])
    {
      uint64_t v4 = sub_1902B35C0();
      sub_1902E02F4(v4, internal[130]);
      uint64_t v5 = internal[130];
      if (v5) {
        (*(void (**)(uint64_t))(*(void *)v5 + 8))(v5);
      }
      internal[130] = 0;
    }
    if (internal[135])
    {
      uint64_t v6 = sub_1904DE71C();
      sub_1902CDE08(v6, 0, internal[135]);
      uint64_t v7 = internal[135];
      if (v7) {
        (*(void (**)(uint64_t))(*(void *)v7 + 8))(v7);
      }
      internal[135] = 0;
    }
    uint64_t v8 = (void *)internal[129];
    if (v8)
    {

      internal[129] = 0;
    }
    uint64_t v9 = (void *)internal[128];
    if (v9)
    {

      internal[128] = 0;
    }
  }
}

- (BOOL)sendDeviceMotionHostGravityToKeyboard:(id *)a3
{
  uint64_t v4 = *(void **)(sub_1904DE71C() + 48);
  if (v4)
  {
    unsigned __int8 var2 = a3->var2;
    char v8 = 114;
    int v9 = *(_DWORD *)a3->var0;
    unsigned __int8 v10 = var2;
    LOBYTE(v4) = objc_msgSend_setReport_payload_length_(v4, v5, 114, &v8, 6);
  }
  return (char)v4;
}

- (void)onDeviceMotionForKeyboardMotion:(const Sample *)a3
{
  id internal = self->_internal;
  float v5 = sub_1902DAF50((double *)&a3->acceleration.x);
  float v7 = v6;
  float v9 = v8;
  double v10 = sub_1904A6238(v5, v6, v8, *((float *)internal + 264), *((float *)internal + 265), *((float *)internal + 266));
  float v11 = *((float *)internal + 267);
  double timestamp = a3->timestamp;
  double v13 = *((double *)internal + 131);
  if (v13 < 0.0
    || ((float)(v11 * 0.017453) > 0.0 ? (BOOL v14 = *(float *)&v10 <= (float)(v11 * 0.017453)) : (BOOL v14 = 1),
        !v14 || timestamp - v13 > (float)(1.0 / *((float *)internal + 268))))
  {
    int v15 = v11 > 0.0;
    BOOL v16 = v11 >= 255.0;
    if (v11 < 255.0) {
      int v15 = 0;
    }
    float v17 = *((float *)internal + 268);
    if (v11 <= 0.0) {
      BOOL v16 = 1;
    }
    int v18 = v17 > 0.0;
    BOOL v19 = v17 >= 255.0;
    if (v17 < 255.0) {
      int v18 = 0;
    }
    char v20 = vcvts_n_s32_f32(v5 + 1.0, 7uLL);
    char v21 = vcvts_n_s32_f32(v7 + 1.0, 7uLL);
    char v22 = vcvts_n_s32_f32(v9 + 1.0, 7uLL);
    unint64_t v23 = (void *)*((void *)internal + 129);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    if (v17 <= 0.0) {
      BOOL v19 = 1;
    }
    v26[2] = sub_1904A64C4;
    v26[3] = &unk_1E568E030;
    int v24 = v18 << 31 >> 31;
    if (!v19) {
      LOBYTE(v24) = (int)v17;
    }
    int v25 = v15 << 31 >> 31;
    v26[4] = internal;
    char v27 = v20;
    char v28 = v21;
    char v29 = v22;
    if (!v16) {
      LOBYTE(v25) = (int)v11;
    }
    char v30 = v24;
    char v31 = v25;
    objc_msgSend_addOperationWithBlock_(v23, (const char *)v26, (uint64_t)v26);
    *((float *)internal + 264) = v5;
    *((float *)internal + 265) = v7;
    *((float *)internal + 266) = v9;
    *((double *)internal + 131) = timestamp;
  }
}

- (BOOL)isDisplayGravityAvailable
{
  return (sub_1902BB1DC() & 4) != 0 && sub_1904EF618() != 0;
}

@end