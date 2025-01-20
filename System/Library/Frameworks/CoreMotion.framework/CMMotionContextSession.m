@interface CMMotionContextSession
+ (BOOL)isAvailable;
- (CMMotionContextSession)init;
- (CMMotionContextSession)initWithOptions:(id)a3;
- (id).cxx_construct;
- (uint64_t)feedARKitWorldPoseWithTimestamp:(int32x4_t)a3 pose:(int32x4_t)a4 status:(float32x4_t)a5;
- (void)enableMLModel:(BOOL)a3;
- (void)enterDistractedViewingSession:(int)a3;
- (void)exitDistractedViewingSession:(int)a3;
- (void)feedAccessoryConfig:(const void *)a3;
- (void)feedAudioAccessoryIMU:(const void *)a3;
- (void)feedGPSLocationWithTimestamp:(double)a3 course:(double)a4 speed:(double)a5 latitude:(double)a6 longitude:(double)a7 horizontalAccuracy:(double)a8;
- (void)feedSourceDeviceIMU:(const Sample *)a3;
- (void)initLoggerWithPrefix:(id)a3 filePath:(id)a4;
- (void)notifyMotionContextClient:(int)a3;
- (void)notifyPdrClient:(const void *)a3;
- (void)notifyStepCountClient:(const void *)a3;
- (void)setAlgType:(int)a3;
- (void)setSpeedEstType:(int)a3;
- (void)setTrackingClientMode:(int)a3;
- (void)start;
- (void)startMotionContextUpdatesToQueue:(id)a3 andHandler:(id)a4;
- (void)startPdrUpdatesToQueue:(id)a3 andHandler:(id)a4;
- (void)startStepCountUpdatesToQueue:(id)a3 andHandler:(id)a4;
- (void)stop;
@end

@implementation CMMotionContextSession

+ (BOOL)isAvailable
{
  return 1;
}

- (CMMotionContextSession)init
{
  return (CMMotionContextSession *)objc_msgSend_initWithOptions_(self, a2, 0);
}

- (CMMotionContextSession)initWithOptions:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v31.receiver = self;
  v31.super_class = (Class)CMMotionContextSession;
  v4 = [(CMMotionContextSession *)&v31 init];
  v5 = (CMMotionContextSession *)v4;
  if (v4)
  {
    *((_DWORD *)v4 + 3194) = 0;
    *(_OWORD *)(v4 + 12904) = 0u;
    v4[12780] = 1;
    v4[12944] = 0;
    *((void *)v4 + 1620) = 0;
    *((void *)v4 + 1607) = 0;
    *((_OWORD *)v4 + 811) = 0u;
    *((_DWORD *)v4 + 3248) = 0;
    uint64_t v6 = mach_continuous_time();
    v5->_currentTime = sub_1902D8D34(v6);
    v5->_inDVEvent = 0;
    v5->_lastTrackingDisableRoute = 0;
    if (a3)
    {
      if (qword_1E929D998 != -1) {
        dispatch_once(&qword_1E929D998, &unk_1EDFD1420);
      }
      v7 = qword_1E929D9A0;
      if (os_log_type_enabled((os_log_t)qword_1E929D9A0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v35 = a3;
        _os_log_impl(&dword_1902AF000, v7, OS_LOG_TYPE_DEFAULT, "[CMMotionContextSession] Options dictionary: %@", buf, 0xCu);
      }
      if (sub_1902D8400(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1E929D998 != -1) {
          dispatch_once(&qword_1E929D998, &unk_1EDFD1420);
        }
        int v32 = 138412290;
        id v33 = a3;
        v29 = (char *)_os_log_send_and_compose_impl();
        sub_1902D398C("Generic", 1, 0, 2, "-[CMMotionContextSession initWithOptions:]", "CoreLocation: %s\n", v29);
        if (v29 != (char *)buf) {
          free(v29);
        }
      }
      if (objc_msgSend_valueForKey_(a3, v8, @"kCMMotionContextSessionLogMSL"))
      {
        v10 = objc_msgSend_objectForKeyedSubscript_(a3, v9, @"kCMMotionContextSessionLogMSL");
        int v13 = objc_msgSend_BOOLValue(v10, v11, v12);
        v5->_logMSL = v13;
        if (v13)
        {
          uint64_t v14 = objc_msgSend_objectForKeyedSubscript_(a3, v9, @"kCMMotionContextSessionMSLFilePath");
          if (objc_msgSend_valueForKey_(a3, v15, @"kCMMotionContextSessionMSLFilePrefix"))
          {
            uint64_t v17 = objc_msgSend_objectForKeyedSubscript_(a3, v16, @"kCMMotionContextSessionMSLFilePrefix");
            v19 = (__CFString *)objc_msgSend_stringWithFormat_(NSString, v18, @"Spatial_%@", v17);
          }
          else
          {
            v19 = @"MotionContext";
          }
          if (qword_1E929D998 != -1) {
            dispatch_once(&qword_1E929D998, &unk_1EDFD1420);
          }
          v20 = qword_1E929D9A0;
          if (os_log_type_enabled((os_log_t)qword_1E929D9A0, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v35 = v19;
            _os_log_impl(&dword_1902AF000, v20, OS_LOG_TYPE_DEFAULT, "[CMMotionContextSession] MSL file prefix: %@", buf, 0xCu);
          }
          if (sub_1902D8400(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1E929D998 != -1) {
              dispatch_once(&qword_1E929D998, &unk_1EDFD1420);
            }
            int v32 = 138412290;
            id v33 = v19;
            v30 = (char *)_os_log_send_and_compose_impl();
            sub_1902D398C("Generic", 1, 0, 2, "-[CMMotionContextSession initWithOptions:]", "CoreLocation: %s\n", v30);
            if (v30 != (char *)buf) {
              free(v30);
            }
          }
          objc_msgSend_initLoggerWithPrefix_filePath_(v5, v21, (uint64_t)v19, v14);
        }
      }
      if (objc_msgSend_valueForKey_(a3, v9, @"kCMMotionContextSessionUseMLModel"))
      {
        v23 = objc_msgSend_objectForKeyedSubscript_(a3, v22, @"kCMMotionContextSessionUseMLModel");
        if (objc_msgSend_BOOLValue(v23, v24, v25))
        {
          objc_msgSend_UTF8String(@"/System/Library/PrivateFrameworks/CoreMotionModels.framework/HumanMotionModels/hml.espresso/hml.mlmodelc", v26, v27);
          operator new();
        }
      }
    }
  }
  return v5;
}

- (void)start
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  objc_sync_enter(self);
  if (qword_1E929D998 != -1) {
    dispatch_once(&qword_1E929D998, &unk_1EDFD1420);
  }
  v3 = qword_1E929D9A0;
  if (os_log_type_enabled((os_log_t)qword_1E929D9A0, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1902AF000, v3, OS_LOG_TYPE_DEBUG, "Starting CMMotionContextSession", buf, 2u);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929D998 != -1) {
      dispatch_once(&qword_1E929D998, &unk_1EDFD1420);
    }
    v8 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CMMotionContextSession start]", "CoreLocation: %s\n", v8);
    if (v8 != (char *)buf) {
      free(v8);
    }
  }
  if (!self->_analyticsTracker.__ptr_.__value_) {
    operator new();
  }
  if (!self->_deviceMotionDispatcher)
  {
    v4 = [CLDeviceMotionProperties alloc];
    objc_msgSend_initWithMode_(v4, v5, 7);
    operator new();
  }
  if (!self->_accessoryDeviceMotionConfigDispatcher) {
    operator new();
  }
  if (!self->_accessoryDeviceMotionDispatcher)
  {
    *(unsigned char *)(sub_1905298B4() + 28) = 1;
    operator new();
  }
  value = self->hmlModel.__ptr_.__value_;
  if (value)
  {
    *((unsigned char *)value + 1560) = 0;
    *((void *)value + 194) = 0;
  }
  *(void *)&self->_totalSessionTime = 0;
  uint64_t v7 = mach_continuous_time();
  self->_currentTime = sub_1902D8D34(v7);
  objc_sync_exit(self);
}

- (void)stop
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  objc_sync_enter(self);
  if (qword_1E929D998 != -1) {
    dispatch_once(&qword_1E929D998, &unk_1EDFD1420);
  }
  v3 = qword_1E929D9A0;
  if (os_log_type_enabled((os_log_t)qword_1E929D9A0, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1902AF000, v3, OS_LOG_TYPE_DEBUG, "Stopping CMMotionContextSession", buf, 2u);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929D998 != -1) {
      dispatch_once(&qword_1E929D998, &unk_1EDFD1420);
    }
    v15 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CMMotionContextSession stop]", "CoreLocation: %s\n", v15);
    if (v15 != (char *)buf) {
      free(v15);
    }
  }
  if (self->_deviceMotionDispatcher)
  {
    uint64_t v4 = sub_1902B35C0();
    sub_1902E02F4(v4, (uint64_t)self->_deviceMotionDispatcher);
    deviceMotionDispatcher = self->_deviceMotionDispatcher;
    if (deviceMotionDispatcher) {
      (*((void (**)(Dispatcher *))deviceMotionDispatcher->var0 + 1))(deviceMotionDispatcher);
    }
    self->_deviceMotionDispatcher = 0;
  }
  if (self->_accessoryDeviceMotionConfigDispatcher)
  {
    uint64_t v6 = sub_1905298B4();
    sub_1902CDE08(v6, 1, (uint64_t)self->_accessoryDeviceMotionConfigDispatcher);
    accessoryDeviceMotionConfigDispatcher = self->_accessoryDeviceMotionConfigDispatcher;
    if (accessoryDeviceMotionConfigDispatcher) {
      (*((void (**)(Dispatcher *))accessoryDeviceMotionConfigDispatcher->var0 + 1))(accessoryDeviceMotionConfigDispatcher);
    }
    self->_accessoryDeviceMotionConfigDispatcher = 0;
  }
  if (self->_accessoryDeviceMotionDispatcher)
  {
    uint64_t v8 = sub_1905298B4();
    sub_1902CDE08(v8, 0, (uint64_t)self->_accessoryDeviceMotionDispatcher);
    accessoryDeviceMotionDispatcher = self->_accessoryDeviceMotionDispatcher;
    if (accessoryDeviceMotionDispatcher) {
      (*((void (**)(Dispatcher *))accessoryDeviceMotionDispatcher->var0 + 1))(accessoryDeviceMotionDispatcher);
    }
    self->_accessoryDeviceMotionDispatcher = 0;
  }
  value = self->_analyticsTracker.__ptr_.__value_;
  if (value)
  {
    int auxSampleCounter = self->_auxSampleCounter;
    if (auxSampleCounter)
    {
      float v12 = self->_totalSessionTime / (float)auxSampleCounter;
      if (v12 < 0.04)
      {
        sub_1905361D4(value);
LABEL_28:
        uint64_t v14 = self->_analyticsTracker.__ptr_.__value_;
        self->_analyticsTracker.__ptr_.__value_ = 0;
        if (v14) {
          MEMORY[0x192FCC980](v14, 0x1000C406BA0FAAELL);
        }
        goto LABEL_30;
      }
    }
    else
    {
      float v12 = 3.4028e38;
    }
    if (qword_1E929D998 != -1) {
      dispatch_once(&qword_1E929D998, &unk_1EDFD1420);
    }
    int v13 = qword_1E929D9A0;
    if (os_log_type_enabled((os_log_t)qword_1E929D9A0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349056;
      double v18 = v12;
      _os_log_impl(&dword_1902AF000, v13, OS_LOG_TYPE_DEFAULT, "Not sending invalid CA metrics due to aux sample drops. avgAuxInterval %{public}f\n", buf, 0xCu);
    }
    if (sub_1902D8400(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D998 != -1) {
        dispatch_once(&qword_1E929D998, &unk_1EDFD1420);
      }
      v16 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "-[CMMotionContextSession stop]", "CoreLocation: %s\n", v16);
      if (v16 != (char *)buf) {
        free(v16);
      }
    }
    goto LABEL_28;
  }
LABEL_30:
  objc_sync_exit(self);
}

- (void)setAlgType:(int)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  self->_pdr.fAlgType = a3;
  if (qword_1E929D998 != -1) {
    dispatch_once(&qword_1E929D998, &unk_1EDFD1420);
  }
  uint64_t v4 = qword_1E929D9A0;
  if (os_log_type_enabled((os_log_t)qword_1E929D9A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v7 = a3;
    _os_log_impl(&dword_1902AF000, v4, OS_LOG_TYPE_DEFAULT, "[CMPdr] Setting Pdr algoType to %d\n", buf, 8u);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929D998 != -1) {
      dispatch_once(&qword_1E929D998, &unk_1EDFD1420);
    }
    v5 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "void CMPdr::setAlgType(Pdr::AlgType)", "CoreLocation: %s\n", v5);
    if (v5 != (char *)buf) {
      free(v5);
    }
  }
}

- (void)setSpeedEstType:(int)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (qword_1E929D998 != -1) {
    dispatch_once(&qword_1E929D998, &unk_1EDFD1420);
  }
  v5 = qword_1E929D9A0;
  if (os_log_type_enabled((os_log_t)qword_1E929D9A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v11 = a3;
    _os_log_impl(&dword_1902AF000, v5, OS_LOG_TYPE_DEFAULT, "Setting Pdr speed estimator to %d\n", buf, 8u);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929D998 != -1) {
      dispatch_once(&qword_1E929D998, &unk_1EDFD1420);
    }
    uint64_t v8 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CMMotionContextSession setSpeedEstType:]", "CoreLocation: %s\n", v8);
    if (v8 != (char *)buf) {
      free(v8);
    }
  }
  if (!self->_pdr.fAlgType)
  {
    value = self->_pdr.fPdrEstimatorOnHead.__ptr_.__value_;
    if (value)
    {
      if (qword_1E929D998 != -1) {
        dispatch_once(&qword_1E929D998, &unk_1EDFD1420);
      }
      int v7 = qword_1E929D9A0;
      if (os_log_type_enabled((os_log_t)qword_1E929D9A0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        int v11 = a3;
        _os_log_impl(&dword_1902AF000, v7, OS_LOG_TYPE_DEFAULT, "[DoTEstimator] Setting speedType, %d\n", buf, 8u);
      }
      if (sub_1902D8400(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1E929D998 != -1) {
          dispatch_once(&qword_1E929D998, &unk_1EDFD1420);
        }
        v9 = (char *)_os_log_send_and_compose_impl();
        sub_1902D398C("Generic", 1, 0, 2, "void CMPdrEstimatorOnHead::setSpeedEstimationType(Pdr::SpeedEstimationType)", "CoreLocation: %s\n", v9);
        if (v9 != (char *)buf) {
          free(v9);
        }
      }
      *((_DWORD *)value + 14) = a3;
    }
  }
}

- (void)enableMLModel:(BOOL)a3
{
  p_enableMLModel = &self->_enableMLModel;
  if (self->_enableMLModel != a3)
  {
    BOOL v4 = a3;
    objc_sync_enter(self);
    BOOL *p_enableMLModel = v4;
    if (self->hmlModel.__ptr_.__value_)
    {
      if (!v4) {
        sub_190433394(&self->hmlModel, 0);
      }
    }
    else if (v4)
    {
      objc_msgSend_UTF8String(@"/System/Library/PrivateFrameworks/CoreMotionModels.framework/HumanMotionModels/hml.espresso/hml.mlmodelc", v6, v7);
      operator new();
    }
    objc_sync_exit(self);
  }
}

- (void)enterDistractedViewingSession:(int)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  self->_lastTrackingDisableRoute = a3;
  if ((a3 | 2) == 3)
  {
    p_position = &self->_result.position;
    self->_inDVEvent = 1;
    *(void *)&self->_distanceTravelledPerDVEvent = 0;
    uint64_t v6 = mach_continuous_time();
    self->_distractedViewingEnterTime = sub_1902D8D34(v6);
    self->_initialPosition = *p_position;
    self->_initialHeadingDegrees = self->_result.directionOfTravelDegrees;
    if (qword_1E929D998 != -1) {
      dispatch_once(&qword_1E929D998, &unk_1EDFD1420);
    }
    uint64_t v7 = qword_1E929D9A0;
    if (os_log_type_enabled((os_log_t)qword_1E929D9A0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v10 = a3;
      _os_log_impl(&dword_1902AF000, v7, OS_LOG_TYPE_DEFAULT, "[CMMotionContextSession] entered DV event via route %d", buf, 8u);
    }
    if (sub_1902D8400(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D998 != -1) {
        dispatch_once(&qword_1E929D998, &unk_1EDFD1420);
      }
      uint64_t v8 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "-[CMMotionContextSession enterDistractedViewingSession:]", "CoreLocation: %s\n", v8);
      if (v8 != (char *)buf) {
        free(v8);
      }
    }
  }
}

- (void)exitDistractedViewingSession:(int)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  if ((self->_lastTrackingDisableRoute | 2) == 3 && (a3 - 1) <= 1)
  {
    value = self->_analyticsTracker.__ptr_.__value_;
    if (*(_DWORD *)value != -1) {
      ++*(_DWORD *)value;
    }
    uint64_t v6 = mach_continuous_time();
    double v7 = sub_1902D8D34(v6);
    double v8 = self->_result.position.elements[0] - self->_initialPosition.elements[0];
    float v9 = sqrt(v8 * v8+ (self->_result.position.elements[1] - self->_initialPosition.elements[1])* (self->_result.position.elements[1] - self->_initialPosition.elements[1]));
    float distanceTravelledPerDVEvent = self->_distanceTravelledPerDVEvent;
    double v11 = 0.0;
    double v12 = 0.0;
    if (distanceTravelledPerDVEvent != 0.0) {
      double v12 = (float)(v9 / distanceTravelledPerDVEvent);
    }
    float v13 = self->_result.directionOfTravelDegrees - self->_initialHeadingDegrees;
    float v14 = v7 - self->_distractedViewingEnterTime;
    if (v14 > 0.0) {
      double v11 = (float)((float)self->_stepCountPerDVEvent / v14);
    }
    v15 = self->_analyticsTracker.__ptr_.__value_;
    double v16 = v9;
    double v18 = *((double *)v15 + 3);
    double v17 = *((double *)v15 + 4);
    if (v17 <= v16) {
      double v17 = v16;
    }
    if (v18 >= v16) {
      double v18 = v16;
    }
    *((double *)v15 + 3) = v18;
    *((double *)v15 + 4) = v17;
    *((double *)v15 + 5) = *((double *)v15 + 5) + v16;
    ++*((_DWORD *)v15 + 12);
    double v19 = distanceTravelledPerDVEvent;
    double v21 = *((double *)v15 + 7);
    double v20 = *((double *)v15 + 8);
    if (v20 <= v19) {
      double v20 = v19;
    }
    if (v21 >= v19) {
      double v21 = v19;
    }
    *((double *)v15 + 7) = v21;
    *((double *)v15 + 8) = v20;
    *((double *)v15 + 9) = *((double *)v15 + 9) + v19;
    ++*((_DWORD *)v15 + 20);
    double v23 = *((double *)v15 + 11);
    double v22 = *((double *)v15 + 12);
    if (v22 <= v12) {
      double v22 = v12;
    }
    if (v23 >= v12) {
      double v23 = v12;
    }
    *((double *)v15 + 11) = v23;
    *((double *)v15 + 12) = v22;
    *((double *)v15 + 13) = v12 + *((double *)v15 + 13);
    ++*((_DWORD *)v15 + 28);
    double v24 = v13;
    double v26 = *((double *)v15 + 15);
    double v25 = *((double *)v15 + 16);
    if (v25 <= v24) {
      double v25 = v24;
    }
    if (v26 >= v24) {
      double v26 = v24;
    }
    *((double *)v15 + 15) = v26;
    *((double *)v15 + 16) = v25;
    *((double *)v15 + 17) = *((double *)v15 + 17) + v24;
    ++*((_DWORD *)v15 + 36);
    double stepCountPerDVEvent = (double)self->_stepCountPerDVEvent;
    double v29 = *((double *)v15 + 19);
    double v28 = *((double *)v15 + 20);
    if (v28 <= stepCountPerDVEvent) {
      double v28 = (double)self->_stepCountPerDVEvent;
    }
    if (v29 >= stepCountPerDVEvent) {
      double v29 = (double)self->_stepCountPerDVEvent;
    }
    *((double *)v15 + 19) = v29;
    *((double *)v15 + 20) = v28;
    *((double *)v15 + 21) = *((double *)v15 + 21) + stepCountPerDVEvent;
    ++*((_DWORD *)v15 + 44);
    double v31 = *((double *)v15 + 23);
    double v30 = *((double *)v15 + 24);
    if (v30 <= v11) {
      double v30 = v11;
    }
    if (v31 >= v11) {
      double v31 = v11;
    }
    *((double *)v15 + 23) = v31;
    *((double *)v15 + 24) = v30;
    *((double *)v15 + 25) = v11 + *((double *)v15 + 25);
    ++*((_DWORD *)v15 + 52);
    double v32 = v14;
    double v34 = *((double *)v15 + 31);
    double v33 = *((double *)v15 + 32);
    if (v33 <= v32) {
      double v33 = v32;
    }
    if (v34 >= v32) {
      double v34 = v32;
    }
    *((double *)v15 + 31) = v34;
    *((double *)v15 + 32) = v33;
    *((double *)v15 + 33) = *((double *)v15 + 33) + v32;
    ++*((_DWORD *)v15 + 68);
    self->_inDVEvent = 0;
    if (self->_lastTrackingDisableRoute == 1)
    {
      id v35 = (_DWORD *)((char *)v15 + 4);
      int v36 = *((_DWORD *)v15 + 1);
    }
    else
    {
      id v35 = (_DWORD *)((char *)v15 + 8);
      int v36 = *((_DWORD *)v15 + 2);
    }
    if (v36 != -1) {
      *id v35 = v36 + 1;
    }
    if (a3 == 1)
    {
      int v39 = *((_DWORD *)v15 + 3);
      v37 = (_DWORD *)((char *)v15 + 12);
      int v38 = v39;
    }
    else
    {
      int v40 = *((_DWORD *)v15 + 4);
      v37 = (_DWORD *)((char *)v15 + 16);
      int v38 = v40;
    }
    if (v38 != -1) {
      _DWORD *v37 = v38 + 1;
    }
    if (qword_1E929D998 != -1) {
      dispatch_once(&qword_1E929D998, &unk_1EDFD1420);
    }
    v41 = qword_1E929D9A0;
    if (os_log_type_enabled((os_log_t)qword_1E929D9A0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1902AF000, v41, OS_LOG_TYPE_DEFAULT, "[CMMotionContextSession] stop logging CA metrics for a DV event.", buf, 2u);
    }
    if (sub_1902D8400(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D998 != -1) {
        dispatch_once(&qword_1E929D998, &unk_1EDFD1420);
      }
      v42 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "-[CMMotionContextSession exitDistractedViewingSession:]", "CoreLocation: %s\n", v42);
      if (v42 != (char *)buf) {
        free(v42);
      }
    }
  }
}

- (void)setTrackingClientMode:(int)a3
{
  value = self->_analyticsTracker.__ptr_.__value_;
  if (value) {
    *((_DWORD *)value + 79) = a3;
  }
}

- (void)initLoggerWithPrefix:(id)a3 filePath:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    objc_msgSend_cStringUsingEncoding_(a3, a2, 1);
    objc_msgSend_cStringUsingEncoding_(a4, v5, 1);
    operator new();
  }
  if (qword_1E929D998 != -1) {
    dispatch_once(&qword_1E929D998, &unk_1EDFD1420);
  }
  uint64_t v6 = qword_1E929D9A0;
  if (os_log_type_enabled((os_log_t)qword_1E929D9A0, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 68289539;
    int v10 = 0;
    __int16 v11 = 2082;
    double v12 = "";
    __int16 v13 = 2082;
    float v14 = "assert";
    __int16 v15 = 2081;
    double v16 = "prefix";
    _os_log_impl(&dword_1902AF000, v6, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"No prefix provided\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    if (qword_1E929D998 != -1) {
      dispatch_once(&qword_1E929D998, &unk_1EDFD1420);
    }
  }
  double v7 = qword_1E929D9A0;
  if (os_signpost_enabled((os_log_t)qword_1E929D9A0))
  {
    *(_DWORD *)buf = 68289539;
    int v10 = 0;
    __int16 v11 = 2082;
    double v12 = "";
    __int16 v13 = 2082;
    float v14 = "assert";
    __int16 v15 = 2081;
    double v16 = "prefix";
    _os_signpost_emit_with_name_impl(&dword_1902AF000, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "No prefix provided", "{\"msg%{public}.0s\":\"No prefix provided\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    if (qword_1E929D998 != -1) {
      dispatch_once(&qword_1E929D998, &unk_1EDFD1420);
    }
  }
  double v8 = qword_1E929D9A0;
  if (os_log_type_enabled((os_log_t)qword_1E929D9A0, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 68289539;
    int v10 = 0;
    __int16 v11 = 2082;
    double v12 = "";
    __int16 v13 = 2082;
    float v14 = "assert";
    __int16 v15 = 2081;
    double v16 = "prefix";
    _os_log_impl(&dword_1902AF000, v8, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"No prefix provided\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
  }
  abort_report_np();
  __break(1u);
}

- (void)notifyStepCountClient:(const void *)a3
{
  if (self->_stepCountClientHandler)
  {
    if (self->_stepCountClientQueue)
    {
      objc_sync_enter(self);
      id stepCountClientHandler = self->_stepCountClientHandler;
      stepCountClientQueue = self->_stepCountClientQueue;
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = sub_190433D8C;
      v7[3] = &unk_1E568D268;
      v7[4] = stepCountClientHandler;
      v7[5] = a3;
      dispatch_sync(stepCountClientQueue, v7);
      objc_sync_exit(self);
    }
  }
}

- (void)notifyPdrClient:(const void *)a3
{
  if (self->_pdrClientQueue)
  {
    if (self->_pdrClientHandler)
    {
      objc_sync_enter(self);
      id pdrClientHandler = self->_pdrClientHandler;
      pdrClientQueue = self->_pdrClientQueue;
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = sub_190433E48;
      v7[3] = &unk_1E568D268;
      v7[4] = pdrClientHandler;
      v7[5] = a3;
      dispatch_sync(pdrClientQueue, v7);
      objc_sync_exit(self);
    }
  }
}

- (void)notifyMotionContextClient:(int)a3
{
  if (self->_motionContextClientHandler)
  {
    if (self->_motionContextClientQueue)
    {
      objc_sync_enter(self);
      id motionContextClientHandler = self->_motionContextClientHandler;
      motionContextClientQueue = self->_motionContextClientQueue;
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = sub_190433F14;
      v7[3] = &unk_1E568D240;
      v7[4] = motionContextClientHandler;
      int v8 = a3;
      dispatch_sync(motionContextClientQueue, v7);
      objc_sync_exit(self);
    }
  }
}

- (void)startStepCountUpdatesToQueue:(id)a3 andHandler:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (qword_1E929D998 != -1) {
    dispatch_once(&qword_1E929D998, &unk_1EDFD1420);
  }
  double v7 = qword_1E929D9A0;
  if (os_log_type_enabled((os_log_t)qword_1E929D9A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1902AF000, v7, OS_LOG_TYPE_DEFAULT, "[CMMotionContextSession] Starting push updates", buf, 2u);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929D998 != -1) {
      dispatch_once(&qword_1E929D998, &unk_1EDFD1420);
    }
    int v10 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CMMotionContextSession startStepCountUpdatesToQueue:andHandler:]", "CoreLocation: %s\n", v10);
    if (v10 != (char *)buf) {
      free(v10);
    }
  }
  if (!a3)
  {
    if (qword_1E929D998 != -1) {
      dispatch_once(&qword_1E929D998, &unk_1EDFD1420);
    }
    __int16 v11 = qword_1E929D9A0;
    if (os_log_type_enabled((os_log_t)qword_1E929D9A0, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      int v18 = 0;
      __int16 v19 = 2082;
      double v20 = "";
      __int16 v21 = 2082;
      double v22 = "assert";
      __int16 v23 = 2081;
      double v24 = "queue";
      _os_log_impl(&dword_1902AF000, v11, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"[CMMotionContextSession] client queue is nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1E929D998 != -1) {
        dispatch_once(&qword_1E929D998, &unk_1EDFD1420);
      }
    }
    double v12 = qword_1E929D9A0;
    if (os_signpost_enabled((os_log_t)qword_1E929D9A0))
    {
      *(_DWORD *)buf = 68289539;
      int v18 = 0;
      __int16 v19 = 2082;
      double v20 = "";
      __int16 v21 = 2082;
      double v22 = "assert";
      __int16 v23 = 2081;
      double v24 = "queue";
      _os_signpost_emit_with_name_impl(&dword_1902AF000, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "[CMMotionContextSession] client queue is nil", "{\"msg%{public}.0s\":\"[CMMotionContextSession] client queue is nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1E929D998 != -1) {
        dispatch_once(&qword_1E929D998, &unk_1EDFD1420);
      }
    }
    __int16 v13 = qword_1E929D9A0;
    if (os_log_type_enabled((os_log_t)qword_1E929D9A0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      int v18 = 0;
      __int16 v19 = 2082;
      double v20 = "";
      __int16 v21 = 2082;
      double v22 = "assert";
      __int16 v23 = 2081;
      double v24 = "queue";
      _os_log_impl(&dword_1902AF000, v13, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"[CMMotionContextSession] client queue is nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
LABEL_38:
    abort_report_np();
    __break(1u);
  }
  if (!a4)
  {
    if (qword_1E929D998 != -1) {
      dispatch_once(&qword_1E929D998, &unk_1EDFD1420);
    }
    float v14 = qword_1E929D9A0;
    if (os_log_type_enabled((os_log_t)qword_1E929D9A0, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      int v18 = 0;
      __int16 v19 = 2082;
      double v20 = "";
      __int16 v21 = 2082;
      double v22 = "assert";
      __int16 v23 = 2081;
      double v24 = "handler";
      _os_log_impl(&dword_1902AF000, v14, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"[CMMotionContextSession] client handler is nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1E929D998 != -1) {
        dispatch_once(&qword_1E929D998, &unk_1EDFD1420);
      }
    }
    __int16 v15 = qword_1E929D9A0;
    if (os_signpost_enabled((os_log_t)qword_1E929D9A0))
    {
      *(_DWORD *)buf = 68289539;
      int v18 = 0;
      __int16 v19 = 2082;
      double v20 = "";
      __int16 v21 = 2082;
      double v22 = "assert";
      __int16 v23 = 2081;
      double v24 = "handler";
      _os_signpost_emit_with_name_impl(&dword_1902AF000, v15, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "[CMMotionContextSession] client handler is nil", "{\"msg%{public}.0s\":\"[CMMotionContextSession] client handler is nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1E929D998 != -1) {
        dispatch_once(&qword_1E929D998, &unk_1EDFD1420);
      }
    }
    double v16 = qword_1E929D9A0;
    if (os_log_type_enabled((os_log_t)qword_1E929D9A0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      int v18 = 0;
      __int16 v19 = 2082;
      double v20 = "";
      __int16 v21 = 2082;
      double v22 = "assert";
      __int16 v23 = 2081;
      double v24 = "handler";
      _os_log_impl(&dword_1902AF000, v16, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"[CMMotionContextSession] client handler is nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    goto LABEL_38;
  }
  objc_sync_enter(self);
  stepCountClientQueue = self->_stepCountClientQueue;
  if (stepCountClientQueue) {
    dispatch_release(stepCountClientQueue);
  }
  id stepCountClientHandler = self->_stepCountClientHandler;
  if (stepCountClientHandler) {
    _Block_release(stepCountClientHandler);
  }
  self->_stepCountClientQueue = (OS_dispatch_queue *)a3;
  dispatch_retain((dispatch_object_t)a3);
  self->_id stepCountClientHandler = _Block_copy(a4);
  objc_sync_exit(self);
}

- (void)startPdrUpdatesToQueue:(id)a3 andHandler:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (qword_1E929D998 != -1) {
    dispatch_once(&qword_1E929D998, &unk_1EDFD1420);
  }
  double v7 = qword_1E929D9A0;
  if (os_log_type_enabled((os_log_t)qword_1E929D9A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1902AF000, v7, OS_LOG_TYPE_DEFAULT, "[CMMotionContextSession] Starting push updates", buf, 2u);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929D998 != -1) {
      dispatch_once(&qword_1E929D998, &unk_1EDFD1420);
    }
    int v10 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CMMotionContextSession startPdrUpdatesToQueue:andHandler:]", "CoreLocation: %s\n", v10);
    if (v10 != (char *)buf) {
      free(v10);
    }
  }
  if (!a3)
  {
    if (qword_1E929D998 != -1) {
      dispatch_once(&qword_1E929D998, &unk_1EDFD1420);
    }
    __int16 v11 = qword_1E929D9A0;
    if (os_log_type_enabled((os_log_t)qword_1E929D9A0, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      int v18 = 0;
      __int16 v19 = 2082;
      double v20 = "";
      __int16 v21 = 2082;
      double v22 = "assert";
      __int16 v23 = 2081;
      double v24 = "queue";
      _os_log_impl(&dword_1902AF000, v11, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"[CMMotionContextSession] client queue is nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1E929D998 != -1) {
        dispatch_once(&qword_1E929D998, &unk_1EDFD1420);
      }
    }
    double v12 = qword_1E929D9A0;
    if (os_signpost_enabled((os_log_t)qword_1E929D9A0))
    {
      *(_DWORD *)buf = 68289539;
      int v18 = 0;
      __int16 v19 = 2082;
      double v20 = "";
      __int16 v21 = 2082;
      double v22 = "assert";
      __int16 v23 = 2081;
      double v24 = "queue";
      _os_signpost_emit_with_name_impl(&dword_1902AF000, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "[CMMotionContextSession] client queue is nil", "{\"msg%{public}.0s\":\"[CMMotionContextSession] client queue is nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1E929D998 != -1) {
        dispatch_once(&qword_1E929D998, &unk_1EDFD1420);
      }
    }
    __int16 v13 = qword_1E929D9A0;
    if (os_log_type_enabled((os_log_t)qword_1E929D9A0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      int v18 = 0;
      __int16 v19 = 2082;
      double v20 = "";
      __int16 v21 = 2082;
      double v22 = "assert";
      __int16 v23 = 2081;
      double v24 = "queue";
      _os_log_impl(&dword_1902AF000, v13, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"[CMMotionContextSession] client queue is nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
LABEL_38:
    abort_report_np();
    __break(1u);
  }
  if (!a4)
  {
    if (qword_1E929D998 != -1) {
      dispatch_once(&qword_1E929D998, &unk_1EDFD1420);
    }
    float v14 = qword_1E929D9A0;
    if (os_log_type_enabled((os_log_t)qword_1E929D9A0, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      int v18 = 0;
      __int16 v19 = 2082;
      double v20 = "";
      __int16 v21 = 2082;
      double v22 = "assert";
      __int16 v23 = 2081;
      double v24 = "handler";
      _os_log_impl(&dword_1902AF000, v14, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"[CMMotionContextSession] client handler is nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1E929D998 != -1) {
        dispatch_once(&qword_1E929D998, &unk_1EDFD1420);
      }
    }
    __int16 v15 = qword_1E929D9A0;
    if (os_signpost_enabled((os_log_t)qword_1E929D9A0))
    {
      *(_DWORD *)buf = 68289539;
      int v18 = 0;
      __int16 v19 = 2082;
      double v20 = "";
      __int16 v21 = 2082;
      double v22 = "assert";
      __int16 v23 = 2081;
      double v24 = "handler";
      _os_signpost_emit_with_name_impl(&dword_1902AF000, v15, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "[CMMotionContextSession] client handler is nil", "{\"msg%{public}.0s\":\"[CMMotionContextSession] client handler is nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1E929D998 != -1) {
        dispatch_once(&qword_1E929D998, &unk_1EDFD1420);
      }
    }
    double v16 = qword_1E929D9A0;
    if (os_log_type_enabled((os_log_t)qword_1E929D9A0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      int v18 = 0;
      __int16 v19 = 2082;
      double v20 = "";
      __int16 v21 = 2082;
      double v22 = "assert";
      __int16 v23 = 2081;
      double v24 = "handler";
      _os_log_impl(&dword_1902AF000, v16, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"[CMMotionContextSession] client handler is nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    goto LABEL_38;
  }
  objc_sync_enter(self);
  pdrClientQueue = self->_pdrClientQueue;
  if (pdrClientQueue) {
    dispatch_release(pdrClientQueue);
  }
  id pdrClientHandler = self->_pdrClientHandler;
  if (pdrClientHandler) {
    _Block_release(pdrClientHandler);
  }
  self->_pdrClientQueue = (OS_dispatch_queue *)a3;
  dispatch_retain((dispatch_object_t)a3);
  self->_id pdrClientHandler = _Block_copy(a4);
  objc_sync_exit(self);
}

- (void)startMotionContextUpdatesToQueue:(id)a3 andHandler:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (qword_1E929D998 != -1) {
    dispatch_once(&qword_1E929D998, &unk_1EDFD1420);
  }
  double v7 = qword_1E929D9A0;
  if (os_log_type_enabled((os_log_t)qword_1E929D9A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1902AF000, v7, OS_LOG_TYPE_DEFAULT, "[CMMotionContextSession] Starting push updates", buf, 2u);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929D998 != -1) {
      dispatch_once(&qword_1E929D998, &unk_1EDFD1420);
    }
    int v10 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CMMotionContextSession startMotionContextUpdatesToQueue:andHandler:]", "CoreLocation: %s\n", v10);
    if (v10 != (char *)buf) {
      free(v10);
    }
  }
  if (!a3)
  {
    if (qword_1E929D998 != -1) {
      dispatch_once(&qword_1E929D998, &unk_1EDFD1420);
    }
    __int16 v11 = qword_1E929D9A0;
    if (os_log_type_enabled((os_log_t)qword_1E929D9A0, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      int v18 = 0;
      __int16 v19 = 2082;
      double v20 = "";
      __int16 v21 = 2082;
      double v22 = "assert";
      __int16 v23 = 2081;
      double v24 = "queue";
      _os_log_impl(&dword_1902AF000, v11, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"[CMMotionContextSession] client queue is nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1E929D998 != -1) {
        dispatch_once(&qword_1E929D998, &unk_1EDFD1420);
      }
    }
    double v12 = qword_1E929D9A0;
    if (os_signpost_enabled((os_log_t)qword_1E929D9A0))
    {
      *(_DWORD *)buf = 68289539;
      int v18 = 0;
      __int16 v19 = 2082;
      double v20 = "";
      __int16 v21 = 2082;
      double v22 = "assert";
      __int16 v23 = 2081;
      double v24 = "queue";
      _os_signpost_emit_with_name_impl(&dword_1902AF000, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "[CMMotionContextSession] client queue is nil", "{\"msg%{public}.0s\":\"[CMMotionContextSession] client queue is nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1E929D998 != -1) {
        dispatch_once(&qword_1E929D998, &unk_1EDFD1420);
      }
    }
    __int16 v13 = qword_1E929D9A0;
    if (os_log_type_enabled((os_log_t)qword_1E929D9A0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      int v18 = 0;
      __int16 v19 = 2082;
      double v20 = "";
      __int16 v21 = 2082;
      double v22 = "assert";
      __int16 v23 = 2081;
      double v24 = "queue";
      _os_log_impl(&dword_1902AF000, v13, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"[CMMotionContextSession] client queue is nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
LABEL_38:
    abort_report_np();
    __break(1u);
  }
  if (!a4)
  {
    if (qword_1E929D998 != -1) {
      dispatch_once(&qword_1E929D998, &unk_1EDFD1420);
    }
    float v14 = qword_1E929D9A0;
    if (os_log_type_enabled((os_log_t)qword_1E929D9A0, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      int v18 = 0;
      __int16 v19 = 2082;
      double v20 = "";
      __int16 v21 = 2082;
      double v22 = "assert";
      __int16 v23 = 2081;
      double v24 = "handler";
      _os_log_impl(&dword_1902AF000, v14, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"[CMMotionContextSession] client handler is nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1E929D998 != -1) {
        dispatch_once(&qword_1E929D998, &unk_1EDFD1420);
      }
    }
    __int16 v15 = qword_1E929D9A0;
    if (os_signpost_enabled((os_log_t)qword_1E929D9A0))
    {
      *(_DWORD *)buf = 68289539;
      int v18 = 0;
      __int16 v19 = 2082;
      double v20 = "";
      __int16 v21 = 2082;
      double v22 = "assert";
      __int16 v23 = 2081;
      double v24 = "handler";
      _os_signpost_emit_with_name_impl(&dword_1902AF000, v15, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "[CMMotionContextSession] client handler is nil", "{\"msg%{public}.0s\":\"[CMMotionContextSession] client handler is nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1E929D998 != -1) {
        dispatch_once(&qword_1E929D998, &unk_1EDFD1420);
      }
    }
    double v16 = qword_1E929D9A0;
    if (os_log_type_enabled((os_log_t)qword_1E929D9A0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      int v18 = 0;
      __int16 v19 = 2082;
      double v20 = "";
      __int16 v21 = 2082;
      double v22 = "assert";
      __int16 v23 = 2081;
      double v24 = "handler";
      _os_log_impl(&dword_1902AF000, v16, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"[CMMotionContextSession] client handler is nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    goto LABEL_38;
  }
  objc_sync_enter(self);
  motionContextClientQueue = self->_motionContextClientQueue;
  if (motionContextClientQueue) {
    dispatch_release(motionContextClientQueue);
  }
  id motionContextClientHandler = self->_motionContextClientHandler;
  if (motionContextClientHandler) {
    _Block_release(motionContextClientHandler);
  }
  self->_motionContextClientQueue = (OS_dispatch_queue *)a3;
  dispatch_retain((dispatch_object_t)a3);
  self->_id motionContextClientHandler = _Block_copy(a4);
  objc_sync_exit(self);
}

- (void)feedSourceDeviceIMU:(const Sample *)a3
{
  if (self->_logMSL) {
    sub_1904571D4((uint64_t *)self->_logger.__ptr_.__value_, &a3->timestamp);
  }
}

- (void)feedAudioAccessoryIMU:(const void *)a3
{
  uint64_t v103 = *MEMORY[0x1E4F143B8];
  if (self->_logMSL) {
    sub_190456160((uint64_t *)self->_logger.__ptr_.__value_, (int *)a3);
  }
  double v5 = *((double *)a3 + 8);
  float v6 = v5 - self->_currentTime;
  self->_totalSessionTime = self->_totalSessionTime + v6;
  *(double *)v83 = v5;
  v83[1] = *((void *)a3 + 2);
  int v7 = *((_DWORD *)a3 + 6);
  uint64_t v85 = *((void *)a3 + 5);
  int v8 = *((_DWORD *)a3 + 12);
  int v84 = v7;
  int v86 = v8;
  long long v87 = *(_OWORD *)a3;
  sub_1905598AC((uint64_t)&self->_accessoryActivity, (uint64_t)v83, (uint64_t)&v80);
  sub_1904E65A4((uint64_t)&self->_pdr, v83, &v82, (uint64_t)&v75, v9);
  p_drawPositionOnStart = &self->_drawPositionOnStart;
  *(_OWORD *)&self->_result.step = v75;
  self->_result.endImpulse = v76;
  self->_result.position = v77;
  float32x4_t v12 = v78;
  *(float32x4_t *)&self->_result.stepsCount = v78;
  if (&self->_result != (PdrResults *)&v75)
  {
    float32x4_t v12 = (float32x4_t)v79;
    self->_result.attitude = v79;
  }
  if (self->_inDVEvent)
  {
    value = self->_analyticsTracker.__ptr_.__value_;
    double v14 = v6;
    double v16 = *((double *)value + 35);
    double v15 = *((double *)value + 36);
    if (v15 <= v6) {
      double v15 = v6;
    }
    if (v16 >= v14) {
      double v16 = v6;
    }
    *((double *)value + 35) = v16;
    *((double *)value + 36) = v15;
    *((double *)value + 37) = *((double *)value + 37) + v14;
    ++*((_DWORD *)value + 76);
    double v17 = *(double *)&v78.i64[1];
    double v19 = *((double *)value + 27);
    double v18 = *((double *)value + 28);
    if (v18 <= *(double *)&v78.i64[1]) {
      double v18 = *(double *)&v78.i64[1];
    }
    if (v19 >= *(double *)&v78.i64[1]) {
      double v19 = *(double *)&v78.i64[1];
    }
    *((double *)value + 27) = v19;
    *((double *)value + 28) = v18;
    *(double *)v12.i64 = v17 + *((double *)value + 29);
    *((void *)value + 29) = v12.i64[0];
    ++*((_DWORD *)value + 60);
  }
  if (self->hmlModel.__ptr_.__value_)
  {
    unsigned int v20 = *((_DWORD *)a3 + 3);
    v12.f32[0] = -*((float *)a3 + 2);
    *(float32x2_t *)v74.f32 = vneg_f32(*(float32x2_t *)a3);
    v74.i64[1] = __PAIR64__(v20, v12.u32[0]);
    sub_1902D9ACC(&v74, v12);
    float v21 = sub_1904CF73C(v74.f32, *((float *)a3 + 10), *((float *)a3 + 11), *((float *)a3 + 12));
    int v23 = v22;
    int v25 = v24;
    LODWORD(v71) = sub_1904CF73C(v74.f32, *((float *)a3 + 4), *((float *)a3 + 5), *((float *)a3 + 6));
    *(void *)((char *)&v71 + 4) = __PAIR64__(v27, v26);
    *((float *)&v71 + 3) = v21;
    int v72 = v23;
    int v73 = v25;
    if (sub_1904BF058((uint64_t)self->hmlModel.__ptr_.__value_, &v71, (uint64_t)&v69))
    {
      if (qword_1E929D998 != -1) {
        dispatch_once(&qword_1E929D998, &unk_1EDFD1420);
      }
      double v28 = qword_1E929D9A0;
      if (os_log_type_enabled((os_log_t)qword_1E929D9A0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218496;
        double v90 = v69.f32[0];
        __int16 v91 = 2048;
        double v92 = v69.f32[1];
        __int16 v93 = 2048;
        double v94 = v70;
        _os_log_impl(&dword_1902AF000, v28, OS_LOG_TYPE_DEFAULT, "[CMMotionContextSession] HML model predict velocity,.x,%.3f,.y,%.3f,.z,%.3f", buf, 0x20u);
      }
      if (sub_1902D8400(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1E929D998 != -1) {
          dispatch_once(&qword_1E929D998, &unk_1EDFD1420);
        }
        *(_DWORD *)v88 = 134218496;
        *(double *)&v88[4] = v69.f32[0];
        *(_WORD *)&v88[12] = 2048;
        *(double *)&v88[14] = v69.f32[1];
        *(_WORD *)&v88[22] = 2048;
        *(double *)&v88[24] = v70;
        v67 = (char *)_os_log_send_and_compose_impl();
        sub_1902D398C("Generic", 1, 0, 2, "-[CMMotionContextSession feedAudioAccessoryIMU:]", "CoreLocation: %s\n", v67);
        if (v67 != (char *)buf) {
          free(v67);
        }
      }
      if (self->_logMSL)
      {
        double v29 = self->_logger.__ptr_.__value_;
        float32x2_t v30 = v69;
        float v31 = v70;
        uint64_t v32 = *((void *)a3 + 8);
        uint64_t v33 = *((void *)v29 + 1);
        *(void *)v88 = (char *)v29 + 8;
        (*(void (**)(uint64_t))(v33 + 16))((uint64_t)v29 + 8);
        *(_WORD *)&v88[16] = 256;
        if (*(void *)v29)
        {
          sub_190395088(buf);
          sub_1903ADD40((uint64_t)buf);
          CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
          v100 |= 1u;
          CFAbsoluteTime v95 = Current;
          uint64_t v35 = v98;
          *(unsigned char *)(v98 + 40) |= 1u;
          *(void *)(v35 + 32) = v32;
          float64x2_t __src = vcvtq_f64_f32(v30);
          double v102 = v31;
          sub_190437438((char *)(v98 + 8), (char *)&__src, (uint64_t)&v103, 3uLL);
          sub_190387314(*(void *)v29, (uint64_t)buf);
          sub_19039A590((PB::Base *)buf);
        }
        (*(void (**)(uint64_t))(*((void *)v29 + 1) + 24))((uint64_t)v29 + 8);
      }
    }
  }
  uint64_t v36 = v80;
  if (self->_motionContextState != v80)
  {
    self->_motionContextState = v80;
    objc_msgSend_notifyMotionContextClient_(self, v10, v36);
    if (qword_1E929D998 != -1) {
      dispatch_once(&qword_1E929D998, &unk_1EDFD1420);
    }
    v37 = qword_1E929D9A0;
    if (os_log_type_enabled((os_log_t)qword_1E929D9A0, OS_LOG_TYPE_DEFAULT))
    {
      int motionContextState_low = LOBYTE(self->_motionContextState);
      *(_DWORD *)buf = 67109120;
      LODWORD(v90) = motionContextState_low;
      _os_log_impl(&dword_1902AF000, v37, OS_LOG_TYPE_DEFAULT, "[CMMotionContextSession] MotionContext state changes to %u ", buf, 8u);
    }
    if (sub_1902D8400(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D998 != -1) {
        dispatch_once(&qword_1E929D998, &unk_1EDFD1420);
      }
      int v65 = LOBYTE(self->_motionContextState);
      *(_DWORD *)v88 = 67109120;
      *(_DWORD *)&v88[4] = v65;
      v66 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "-[CMMotionContextSession feedAudioAccessoryIMU:]", "CoreLocation: %s\n", v66);
      if (v66 != (char *)buf) {
        free(v66);
      }
    }
  }
  if ((_BYTE)v75)
  {
    if (qword_1E929D998 != -1) {
      dispatch_once(&qword_1E929D998, &unk_1EDFD1420);
    }
    int v39 = qword_1E929D9A0;
    if (os_log_type_enabled((os_log_t)qword_1E929D9A0, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218240;
      double v90 = v77.elements[0];
      __int16 v91 = 2048;
      double v92 = v77.elements[1];
      _os_log_impl(&dword_1902AF000, v39, OS_LOG_TYPE_DEBUG, "[cmMotionContext] notifying step count: %2.2f,%2.2f\n", buf, 0x16u);
    }
    if (sub_1902D8400(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D998 != -1) {
        dispatch_once(&qword_1E929D998, &unk_1EDFD1420);
      }
      *(_DWORD *)v88 = 134218240;
      *(double *)&v88[4] = v77.elements[0];
      *(_WORD *)&v88[12] = 2048;
      *(double *)&v88[14] = v77.elements[1];
      v64 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "-[CMMotionContextSession feedAudioAccessoryIMU:]", "CoreLocation: %s\n", v64);
      if (v64 != (char *)buf) {
        free(v64);
      }
    }
    objc_msgSend_notifyStepCountClient_(self, v40, (uint64_t)&v75);
    ++self->_stepCountPerDVEvent;
  }
  double v41 = v77.elements[0] - self->_prevPDRPosition.elements[0];
  double v42 = v77.elements[1] - self->_prevPDRPosition.elements[1];
  if (*p_drawPositionOnStart || sqrt(v41 * v41 + v42 * v42) > 0.3)
  {
    objc_msgSend_notifyPdrClient_(self, v10, (uint64_t)&v75);
    self->_prevPDRPosition = v77;
    BOOL *p_drawPositionOnStart = 0;
    if (self->_inDVEvent)
    {
      float v43 = sqrt(v41 * v41 + v42 * v42) + self->_distanceTravelledPerDVEvent;
      self->_float distanceTravelledPerDVEvent = v43;
    }
  }
  if (self->_logMSL)
  {
    uint64_t v44 = self->_logger.__ptr_.__value_;
    int fAlgType = self->_pdr.fAlgType;
    uint64_t v46 = *((void *)v44 + 1);
    *(void *)v88 = (char *)v44 + 8;
    (*(void (**)(uint64_t))(v46 + 16))((uint64_t)v44 + 8);
    *(_WORD *)&v88[16] = 256;
    if (*(void *)v44)
    {
      sub_190395088(buf);
      sub_1903ADCB0((uint64_t)buf);
      CFAbsoluteTime v47 = CFAbsoluteTimeGetCurrent();
      v100 |= 1u;
      CFAbsoluteTime v95 = v47;
      uint64_t v48 = v97;
      *(unsigned char *)(v97 + 12) |= 1u;
      *(_DWORD *)(v48 + 8) = fAlgType;
      sub_190387314(*(void *)v44, (uint64_t)buf);
      sub_19039A590((PB::Base *)buf);
    }
    (*(void (**)(uint64_t))(*((void *)v44 + 1) + 24))((uint64_t)v44 + 8);
    v49 = self->_logger.__ptr_.__value_;
    uint64_t v50 = *((void *)v49 + 1);
    *(void *)v88 = (char *)v49 + 8;
    (*(void (**)(uint64_t))(v50 + 16))((uint64_t)v49 + 8);
    *(_WORD *)&v88[16] = 256;
    if (*(void *)v49)
    {
      sub_190395088(buf);
      sub_1903ADC20((uint64_t)buf);
      CFAbsoluteTime v51 = CFAbsoluteTimeGetCurrent();
      v100 |= 1u;
      CFAbsoluteTime v95 = v51;
      uint64_t v52 = v96;
      unsigned int v53 = v80;
      *(unsigned char *)(v96 + 28) |= 2u;
      *(_DWORD *)(v52 + 24) = v53;
      uint64_t v54 = v96;
      uint64_t v55 = v81;
      *(unsigned char *)(v96 + 28) |= 1u;
      *(void *)(v54 + 16) = v55;
      sub_1903EDA6C(v96);
      uint64_t v56 = *(void *)(v96 + 8);
      *(unsigned char *)(v56 + 20) |= 2u;
      *(_DWORD *)(v56 + 16) = 0;
      uint64_t v57 = v82;
      uint64_t v58 = *(void *)(v96 + 8);
      *(unsigned char *)(v58 + 20) |= 1u;
      *(void *)(v58 + 8) = v57;
      sub_190387314(*(void *)v49, (uint64_t)buf);
      sub_19039A590((PB::Base *)buf);
    }
    (*(void (**)(uint64_t))(*((void *)v49 + 1) + 24))((uint64_t)v49 + 8);
    v59 = self->_logger.__ptr_.__value_;
    float64x2_t v68 = (float64x2_t)v77;
    uint64_t v60 = v83[0];
    uint64_t v61 = *((void *)v59 + 1);
    *(void *)&__src.f64[0] = (char *)v59 + 8;
    (*(void (**)(uint64_t))(v61 + 16))((uint64_t)v59 + 8);
    LOWORD(v102) = 256;
    if (*(void *)v59)
    {
      sub_190395088(buf);
      sub_1903AD9E0((uint64_t)buf);
      CFAbsoluteTime v62 = CFAbsoluteTimeGetCurrent();
      v100 |= 1u;
      CFAbsoluteTime v95 = v62;
      v63 = v99;
      v99[64] |= 1u;
      *((void *)v63 + 7) = v60;
      *(float64x2_t *)v88 = vcvtq_f64_f32(*(float32x2_t *)v79.elements);
      *(float64x2_t *)&v88[16] = vcvtq_f64_f32(*(float32x2_t *)&v79.elements[2]);
      sub_190437438(v99 + 8, v88, (uint64_t)buf, 4uLL);
      *(float64x2_t *)v88 = vcvtq_f64_f32(vcvt_f32_f64(v68));
      *(void *)&v88[16] = 0;
      sub_190437438(v99 + 32, v88, (uint64_t)&v88[24], 3uLL);
      sub_190387314(*(void *)v59, (uint64_t)buf);
      sub_19039A590((PB::Base *)buf);
    }
    (*(void (**)(uint64_t))(*((void *)v59 + 1) + 24))((uint64_t)v59 + 8);
  }
  self->_currentTime = *((double *)a3 + 8);
  ++self->_auxSampleCounter;
}

- (void)feedAccessoryConfig:(const void *)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  if (qword_1E929D998 != -1) {
    dispatch_once(&qword_1E929D998, &unk_1EDFD1420);
  }
  double v5 = qword_1E929D9A0;
  if (os_log_type_enabled((os_log_t)qword_1E929D9A0, OS_LOG_TYPE_DEFAULT))
  {
    float v6 = (char *)a3 + 8;
    if (*((char *)a3 + 31) < 0) {
      float v6 = (void *)*v6;
    }
    int v7 = *(_DWORD *)a3;
    int v8 = (char *)a3 + 32;
    if (*((char *)a3 + 55) < 0) {
      int v8 = (void *)*v8;
    }
    int v9 = *((_DWORD *)a3 + 14);
    *(_DWORD *)buf = 67240963;
    *(_DWORD *)&uint8_t buf[4] = v7;
    *(_WORD *)&buf[8] = 2081;
    *(void *)&buf[10] = v6;
    __int16 v39 = 2081;
    int v40 = v8;
    __int16 v41 = 1026;
    int v42 = v9;
    _os_log_impl(&dword_1902AF000, v5, OS_LOG_TYPE_DEFAULT, "[CMMotionContextSession] Received accessoryDeviceMotion config. side,%{public}d,configuration,%{private}s,serialNumber,%{private}s,hardwareModel,%{public}d", buf, 0x22u);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929D998 != -1) {
      dispatch_once(&qword_1E929D998, &unk_1EDFD1420);
    }
    double v34 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CMMotionContextSession feedAccessoryConfig:]", "CoreLocation: %s\n", v34);
    if (v34 != buf) {
      free(v34);
    }
  }
  objc_sync_enter(self);
  switch(*((_DWORD *)a3 + 14))
  {
    case 1:
      if (*(_DWORD *)a3 == 2) {
        goto LABEL_41;
      }
      if (*(_DWORD *)a3 == 1) {
        goto LABEL_22;
      }
      if (qword_1E929D998 != -1) {
        dispatch_once(&qword_1E929D998, &unk_1EDFD1420);
      }
      int v10 = qword_1E929D9A0;
      if (os_log_type_enabled((os_log_t)qword_1E929D9A0, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1902AF000, v10, OS_LOG_TYPE_ERROR, "[CMMotionContextSession] Error -- config side for kAccessoryHardwareModelB298 must be 1 or 2.", buf, 2u);
      }
      if (sub_1902D8400(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1E929D998 != -1) {
          goto LABEL_104;
        }
        goto LABEL_48;
      }
      goto LABEL_66;
    case 2:
      __int16 v11 = &xmmword_190607224;
      goto LABEL_51;
    case 3:
      if (*(_DWORD *)a3 == 2)
      {
        __int16 v11 = &xmmword_190607254;
        goto LABEL_51;
      }
      if (*(_DWORD *)a3 == 1)
      {
        __int16 v11 = &xmmword_190607244;
        goto LABEL_51;
      }
      if (qword_1E929D998 != -1) {
        dispatch_once(&qword_1E929D998, &unk_1EDFD1420);
      }
      uint64_t v32 = qword_1E929D9A0;
      if (os_log_type_enabled((os_log_t)qword_1E929D9A0, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1902AF000, v32, OS_LOG_TYPE_ERROR, "[CMMotionContextSession] Error -- config side for kAccessoryHardwareModelB688 must be 1 or 2.", buf, 2u);
      }
      if (!sub_1902D8400(115, 0)) {
        goto LABEL_66;
      }
      bzero(buf, 0x65CuLL);
      if (qword_1E929D998 == -1) {
        goto LABEL_48;
      }
      goto LABEL_104;
    case 4:
      if (*(_DWORD *)a3 == 2)
      {
        __int16 v11 = &xmmword_190607274;
        goto LABEL_51;
      }
      if (*(_DWORD *)a3 == 1)
      {
        __int16 v11 = &xmmword_190607264;
        goto LABEL_51;
      }
      if (qword_1E929D998 != -1) {
        dispatch_once(&qword_1E929D998, &unk_1EDFD1420);
      }
      uint64_t v33 = qword_1E929D9A0;
      if (os_log_type_enabled((os_log_t)qword_1E929D9A0, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1902AF000, v33, OS_LOG_TYPE_ERROR, "[CMMotionContextSession] Error -- config side for kAccessoryHardwareModelB494 must be 1 or 2.", buf, 2u);
      }
      if (!sub_1902D8400(115, 0)) {
        goto LABEL_66;
      }
      bzero(buf, 0x65CuLL);
      if (qword_1E929D998 == -1) {
        goto LABEL_48;
      }
      goto LABEL_104;
    case 5:
      if (*(_DWORD *)a3 == 2)
      {
LABEL_41:
        __int16 v11 = &xmmword_190607294;
        goto LABEL_51;
      }
      if (*(_DWORD *)a3 == 1)
      {
LABEL_22:
        __int16 v11 = &xmmword_190607284;
LABEL_51:
        *(_OWORD *)buf = *v11;
        sub_1902D9ACC((float32x4_t *)buf, *(float32x4_t *)buf);
        uint64_t v36 = *(void *)buf;
        int v37 = *(_DWORD *)&buf[8];
        int v12 = *(_DWORD *)&buf[12];
        goto LABEL_52;
      }
      if (qword_1E929D998 != -1) {
        dispatch_once(&qword_1E929D998, &unk_1EDFD1420);
      }
      float v31 = qword_1E929D9A0;
      if (os_log_type_enabled((os_log_t)qword_1E929D9A0, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1902AF000, v31, OS_LOG_TYPE_ERROR, "[CMMotionContextSession] Error -- config side for kAccessoryHardwareModelB698 must be 1 or 2.", buf, 2u);
      }
      if (sub_1902D8400(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1E929D998 != -1) {
LABEL_104:
        }
          dispatch_once(&qword_1E929D998, &unk_1EDFD1420);
LABEL_48:
        double v18 = (char *)_os_log_send_and_compose_impl();
        sub_1902D398C("Generic", 1, 0, 0, "-[CMMotionContextSession feedAccessoryConfig:]", "CoreLocation: %s\n", v18);
LABEL_102:
        if (v18 != buf) {
          free(v18);
        }
      }
LABEL_66:
      objc_sync_exit(self);
      if (self->_logMSL)
      {
        value = self->_logger.__ptr_.__value_;
        if (*(void *)value)
        {
          (*(void (**)(uint64_t))(*((void *)value + 1) + 16))((uint64_t)value + 8);
          sub_190395088(buf);
          sub_1903AED00((uint64_t)buf);
          CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
          v45 |= 1u;
          CFAbsoluteTime v44 = Current;
          sub_19034FB00(v43);
          uint64_t v25 = *(void *)(v43 + 32);
          int v26 = *(_DWORD *)a3;
          *(unsigned char *)(v25 + 32) |= 2u;
          *(_DWORD *)(v25 + 28) = v26;
          uint64_t v27 = *(void *)(v43 + 32);
          sub_190437600(v27);
          std::string::operator=(*(std::string **)(v27 + 8), (const std::string *)((char *)a3 + 8));
          uint64_t v28 = *(void *)(v43 + 32);
          sub_190437674(v28);
          std::string::operator=(*(std::string **)(v28 + 16), (const std::string *)((char *)a3 + 32));
          uint64_t v29 = *(void *)(v43 + 32);
          int v30 = *((_DWORD *)a3 + 14);
          *(unsigned char *)(v29 + 32) |= 1u;
          *(_DWORD *)(v29 + 24) = v30;
          sub_190387314(*(void *)value, (uint64_t)buf);
          sub_19039A590((PB::Base *)buf);
          (*(void (**)(uint64_t))(*((void *)value + 1) + 24))((uint64_t)value + 8);
        }
      }
      return;
    case 6:
      __int16 v11 = &xmmword_190607234;
      goto LABEL_51;
    default:
      if (*((unsigned char *)a3 + 76))
      {
        uint64_t v36 = *((void *)a3 + 10);
        int v37 = *((_DWORD *)a3 + 22);
        int v12 = *((_DWORD *)a3 + 23);
        if (qword_1E929D998 != -1) {
          dispatch_once(&qword_1E929D998, &unk_1EDFD1420);
        }
        __int16 v13 = qword_1E929D9A0;
        if (os_log_type_enabled((os_log_t)qword_1E929D9A0, OS_LOG_TYPE_DEFAULT))
        {
          int v14 = *((_DWORD *)a3 + 14);
          *(_DWORD *)buf = 67240192;
          *(_DWORD *)&uint8_t buf[4] = v14;
          _os_log_impl(&dword_1902AF000, v13, OS_LOG_TYPE_DEFAULT, "[CMMotionContextSession] Use the H2H transformation from IORegistry for model %{public}d", buf, 8u);
        }
        if (sub_1902D8400(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1E929D998 != -1) {
            dispatch_once(&qword_1E929D998, &unk_1EDFD1420);
          }
          double v15 = (char *)_os_log_send_and_compose_impl();
          sub_1902D398C("Generic", 1, 0, 2, "-[CMMotionContextSession feedAccessoryConfig:]", "CoreLocation: %s\n", v15);
          if (v15 != buf) {
            free(v15);
          }
        }
LABEL_52:
        *(void *)&self->_accessoryActivity.fAccessoryStepDetector.fHeadsetOrientation.elements[2] = v36;
        LODWORD(self->_accessoryActivity.fAccessoryStepDetector.fStepModel.timeSinceLastStepSecRatio[0]) = v37;
        HIDWORD(self->_accessoryActivity.fAccessoryStepDetector.fStepModel.timeSinceLastStepSecRatio[0]) = v12;
        double v19 = self->_accessoryActivity.fSitStandDetector.__ptr_.__value_;
        if (v19)
        {
          *(void *)((char *)v19 + 76) = v36;
          *((_DWORD *)v19 + 21) = v37;
          *((_DWORD *)v19 + 22) = v12;
        }
        self->_anon_31e0[0] = 1;
        if (qword_1E929D998 != -1) {
          dispatch_once(&qword_1E929D998, &unk_1EDFD1420);
        }
        unsigned int v20 = qword_1E929D9A0;
        if (os_log_type_enabled((os_log_t)qword_1E929D9A0, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1902AF000, v20, OS_LOG_TYPE_DEFAULT, "[CMPdr] This should only be called if using accessoryDM.", buf, 2u);
        }
        if (sub_1902D8400(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1E929D998 != -1) {
            dispatch_once(&qword_1E929D998, &unk_1EDFD1420);
          }
          uint64_t v35 = (char *)_os_log_send_and_compose_impl();
          sub_1902D398C("Generic", 1, 0, 2, "void CMPdr::setHeadsetOrientation(const CMOQuaternion &)", "CoreLocation: %s\n", v35);
          if (v35 != buf) {
            free(v35);
          }
        }
        float v21 = self->_pdr.fPdrEstimatorOnHead.__ptr_.__value_;
        if (!v21) {
          operator new();
        }
        *((void *)v21 + 1) = v36;
        *((_DWORD *)v21 + 4) = v37;
        *((_DWORD *)v21 + 5) = v12;
        *((unsigned char *)v21 + 24) = 1;
        if (qword_1E929D998 != -1) {
          dispatch_once(&qword_1E929D998, &unk_1EDFD1420);
        }
        int v22 = qword_1E929D9A0;
        if (os_log_type_enabled((os_log_t)qword_1E929D9A0, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1902AF000, v22, OS_LOG_TYPE_DEFAULT, "[CMMotionContextSession] Setting H2H transform", buf, 2u);
        }
        if (sub_1902D8400(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1E929D998 != -1) {
            dispatch_once(&qword_1E929D998, &unk_1EDFD1420);
          }
          double v18 = (char *)_os_log_send_and_compose_impl();
          sub_1902D398C("Generic", 1, 0, 2, "-[CMMotionContextSession feedAccessoryConfig:]", "CoreLocation: %s\n", v18);
          goto LABEL_102;
        }
        goto LABEL_66;
      }
      if (qword_1E929D998 != -1) {
        dispatch_once(&qword_1E929D998, &unk_1EDFD1420);
      }
      double v16 = qword_1E929D9A0;
      if (os_log_type_enabled((os_log_t)qword_1E929D9A0, OS_LOG_TYPE_ERROR))
      {
        int v17 = *((_DWORD *)a3 + 14);
        *(_DWORD *)buf = 67240192;
        *(_DWORD *)&uint8_t buf[4] = v17;
        _os_log_impl(&dword_1902AF000, v16, OS_LOG_TYPE_ERROR, "[CMMotionContextSession] Error -- No H2H transformation for model %{public}d", buf, 8u);
      }
      if (!sub_1902D8400(115, 0)) {
        goto LABEL_66;
      }
      bzero(buf, 0x65CuLL);
      if (qword_1E929D998 != -1) {
        goto LABEL_104;
      }
      goto LABEL_48;
  }
}

- (uint64_t)feedARKitWorldPoseWithTimestamp:(int32x4_t)a3 pose:(int32x4_t)a4 status:(float32x4_t)a5
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(result + 16))
  {
    float v10 = a5.f32[2] + (float)(*(float *)a3.i32 + *(float *)&a4.i32[1]);
    if (v10 >= 0.0)
    {
      float v19 = sqrtf(v10 + 1.0);
      *(float *)&unsigned int v20 = v19 + v19;
      float32x2_t v21 = vrecpe_f32((float32x2_t)v20);
      float32x2_t v22 = vmul_f32(v21, vrecps_f32((float32x2_t)v20, v21));
      LODWORD(v23) = vmul_f32(v22, vrecps_f32((float32x2_t)v20, v22)).u32[0];
      float v29 = vmuls_lane_f32(v23, (float32x2_t)*(_OWORD *)&vsubq_f32((float32x4_t)vdupq_laneq_s32(a4, 2), a5), 1);
      float v30 = vmuls_n_f32(vsubq_f32(a5, (float32x4_t)vdupq_laneq_s32(a3, 2)).f32[0], v23);
      float v31 = vmuls_n_f32(vsubq_f32((float32x4_t)vdupq_lane_s32(*(int32x2_t *)a3.i8, 1), (float32x4_t)a4).f32[0], v23);
      float v32 = *(float *)&v20 * 0.25;
    }
    else if (*(float *)a3.i32 < *(float *)&a4.i32[1] || *(float *)a3.i32 < a5.f32[2])
    {
      float v12 = 1.0 - *(float *)a3.i32;
      if (*(float *)&a4.i32[1] >= a5.f32[2])
      {
        float v33 = sqrtf(*(float *)&a4.i32[1] + (float)(v12 - a5.f32[2]));
        *(float *)&unsigned int v34 = v33 + v33;
        float32x2_t v35 = vrecpe_f32((float32x2_t)v34);
        float32x2_t v36 = vmul_f32(v35, vrecps_f32((float32x2_t)v34, v35));
        unsigned __int32 v17 = vmul_f32(v36, vrecps_f32((float32x2_t)v34, v36)).u32[0];
        float v29 = vmuls_n_f32(vaddq_f32((float32x4_t)vdupq_lane_s32(*(int32x2_t *)a3.i8, 1), (float32x4_t)a4).f32[0], *(float *)&v17);
        float v30 = *(float *)&v34 * 0.25;
        float v31 = vmuls_lane_f32(*(float *)&v17, (float32x2_t)*(_OWORD *)&vaddq_f32((float32x4_t)vdupq_laneq_s32(a4, 2), a5), 1);
        unsigned __int32 v18 = vsubq_f32(a5, (float32x4_t)vdupq_laneq_s32(a3, 2)).u32[0];
      }
      else
      {
        float v13 = sqrtf(a5.f32[2] + (float)(v12 - *(float *)&a4.i32[1]));
        *(float *)&unsigned int v14 = v13 + v13;
        float32x2_t v15 = vrecpe_f32((float32x2_t)v14);
        float32x2_t v16 = vmul_f32(v15, vrecps_f32((float32x2_t)v14, v15));
        unsigned __int32 v17 = vmul_f32(v16, vrecps_f32((float32x2_t)v14, v16)).u32[0];
        float v29 = vmuls_n_f32(vaddq_f32((float32x4_t)vdupq_laneq_s32(a3, 2), a5).f32[0], *(float *)&v17);
        float v30 = vmuls_lane_f32(*(float *)&v17, (float32x2_t)*(_OWORD *)&vaddq_f32((float32x4_t)vdupq_laneq_s32(a4, 2), a5), 1);
        float v31 = *(float *)&v14 * 0.25;
        unsigned __int32 v18 = vsubq_f32((float32x4_t)vdupq_lane_s32(*(int32x2_t *)a3.i8, 1), (float32x4_t)a4).u32[0];
      }
      float v32 = vmuls_n_f32(*(float *)&v18, *(float *)&v17);
    }
    else
    {
      float v24 = sqrtf(*(float *)a3.i32 + (float)((float)(1.0 - *(float *)&a4.i32[1]) - a5.f32[2]));
      *(float *)&unsigned int v25 = v24 + v24;
      float32x2_t v26 = vrecpe_f32((float32x2_t)v25);
      float32x2_t v27 = vmul_f32(v26, vrecps_f32((float32x2_t)v25, v26));
      LODWORD(v28) = vmul_f32(v27, vrecps_f32((float32x2_t)v25, v27)).u32[0];
      float v29 = *(float *)&v25 * 0.25;
      float v30 = vmuls_n_f32(vaddq_f32((float32x4_t)vdupq_lane_s32(*(int32x2_t *)a3.i8, 1), (float32x4_t)a4).f32[0], v28);
      float v31 = vmuls_n_f32(vaddq_f32((float32x4_t)vdupq_laneq_s32(a3, 2), a5).f32[0], v28);
      float v32 = vmuls_lane_f32(v28, (float32x2_t)*(_OWORD *)&vsubq_f32((float32x4_t)vdupq_laneq_s32(a4, 2), a5), 1);
    }
    int v37 = *(uint64_t **)(result + 8);
    uint64_t v38 = v37[1];
    uint64_t v50 = v37 + 1;
    (*(void (**)(uint64_t *))(v38 + 16))(v37 + 1);
    __int16 v51 = 256;
    if (*v37)
    {
      sub_190395088(v46);
      sub_1903ADB90((uint64_t)v46);
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      v49 |= 1u;
      CFAbsoluteTime v48 = Current;
      uint64_t v40 = v47;
      *(unsigned char *)(v47 + 56) |= 1u;
      *(double *)(v40 + 32) = a2;
      uint64_t v41 = v47;
      *(unsigned char *)(v47 + 56) |= 4u;
      *(_DWORD *)(v41 + 44) = a6.n128_u32[0];
      uint64_t v42 = v47;
      *(unsigned char *)(v47 + 56) |= 8u;
      *(_DWORD *)(v42 + 48) = a6.n128_u32[1];
      uint64_t v43 = v47;
      *(unsigned char *)(v47 + 56) |= 0x10u;
      *(_DWORD *)(v43 + 52) = a6.n128_u32[2];
      __src[0] = v29;
      __src[1] = v30;
      __src[2] = v31;
      __src[3] = v32;
      sub_190437438((char *)(v47 + 8), (char *)__src, (uint64_t)&v53, 4uLL);
      uint64_t v44 = v47;
      *(unsigned char *)(v47 + 56) |= 2u;
      *(_DWORD *)(v44 + 40) = a8;
      sub_190387314(*v37, (uint64_t)v46);
      sub_19039A590((PB::Base *)v46);
    }
    return (*(uint64_t (**)(uint64_t *))(v37[1] + 24))(v37 + 1);
  }
  return result;
}

- (void)feedGPSLocationWithTimestamp:(double)a3 course:(double)a4 speed:(double)a5 latitude:(double)a6 longitude:(double)a7 horizontalAccuracy:(double)a8
{
  if (self->_logMSL)
  {
    value = self->_logger.__ptr_.__value_;
    (*(void (**)(uint64_t, SEL))(*((void *)value + 1) + 16))((uint64_t)value + 8, a2);
    if (*(void *)value)
    {
      sub_190395088(v22);
      sub_1903AEA30((uint64_t)v22);
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      v24 |= 1u;
      *(CFAbsoluteTime *)&v22[77] = Current;
      uint64_t v16 = v23;
      *(_DWORD *)(v23 + 180) |= 0x800u;
      *(double *)(v16 + 96) = a3;
      uint64_t v17 = v23;
      *(_DWORD *)(v23 + 180) |= 2u;
      *(double *)(v17 + 16) = a4;
      uint64_t v18 = v23;
      *(_DWORD *)(v23 + 180) |= 0x200u;
      *(double *)(v18 + 80) = a5;
      uint64_t v19 = v23;
      *(_DWORD *)(v23 + 180) |= 0x40u;
      *(double *)(v19 + 56) = a6;
      uint64_t v20 = v23;
      *(_DWORD *)(v23 + 180) |= 0x80u;
      *(double *)(v20 + 64) = a7;
      uint64_t v21 = v23;
      *(_DWORD *)(v23 + 180) |= 0x20u;
      *(double *)(v21 + 48) = a8;
      sub_190387314(*(void *)value, (uint64_t)v22);
      sub_19039A590((PB::Base *)v22);
    }
    (*(void (**)(uint64_t))(*((void *)value + 1) + 24))((uint64_t)value + 8);
  }
}

- (void).cxx_destruct
{
  value = self->_analyticsTracker.__ptr_.__value_;
  self->_analyticsTracker.__ptr_.__value_ = 0;
  if (value) {
    MEMORY[0x192FCC980](value, 0x1000C406BA0FAAELL);
  }
  sub_190433394(&self->hmlModel, 0);
  BOOL v4 = self->_accessoryActivity.fSitStandDetector.__ptr_.__value_;
  if (v4) {
    *((_OWORD *)v4 + 682) = 0u;
  }
  *(_OWORD *)&self->_accessoryActivity.fAccessoryStepDetector.fCallbackInfo = 0u;
  sub_190544F98((uint64_t *)&self->_accessoryActivity.fSitStandDetector, 0);
  double v5 = self->_pdr.fPdrEstimatorTexting.__ptr_.__value_;
  self->_pdr.fPdrEstimatorTexting.__ptr_.__value_ = 0;
  if (v5) {
    sub_1904376E8((uint64_t)&self->_pdr.fPdrEstimatorTexting, (uint64_t)v5);
  }
  float v6 = self->_pdr.fPdrEstimatorHandSwing.__ptr_.__value_;
  self->_pdr.fPdrEstimatorHandSwing.__ptr_.__value_ = 0;
  if (v6) {
    MEMORY[0x192FCC980](v6, 0x1060C40CBE98382);
  }
  int v7 = self->_pdr.fPdrEstimatorOnBody.__ptr_.__value_;
  self->_pdr.fPdrEstimatorOnBody.__ptr_.__value_ = 0;
  if (v7) {
    sub_190437764((uint64_t)&self->_pdr.fPdrEstimatorOnBody, (uint64_t)v7);
  }
  int v8 = self->_pdr.fPdrEstimatorOnHead.__ptr_.__value_;
  self->_pdr.fPdrEstimatorOnHead.__ptr_.__value_ = 0;
  if (v8) {
    sub_190437534((uint64_t)&self->_pdr.fPdrEstimatorOnHead, (uint64_t)v8);
  }

  sub_1904378CC((uint64_t **)&self->_logger, 0);
}

- (id).cxx_construct
{
  self->_logger.__ptr_.__value_ = 0;
  sub_1904D119C((uint64_t)&self->_pdr);
  self->_pdr.int fAlgType = 0;
  *(_OWORD *)&self->_pdr.fDirectionalityDetector._lastStartImpulseTimestamp = 0u;
  self->_pdr.fDirectionalityDetector._lastStepDirectionRadians = NAN;
  self->_pdr.fDirectionalityDetector._lastPosition = 0u;
  *(void *)&self->_pdr.fDirectionalityDetector._inertialBuffer.fHeadAndSize.fHead = 0xF500000000;
  *(_OWORD *)&self->_pdr.fPdrEstimatorOnHead.__ptr_.__value_ = 0u;
  *(_OWORD *)&self->_pdr.fPdrEstimatorHandSwing.__ptr_.__value_ = 0u;
  sub_190559464((uint64_t)&self->_accessoryActivity, 1);
  self->_result.step = 0;
  self->_result.startImpulse = NAN;
  self->_result.endImpulse = NAN;
  *(void *)&self->_result.stepsCount = 0;
  *(void *)self->_result.attitude.elements = 0;
  self->_result.speedMps = 0.0;
  *(void *)&self->_result.attitude.elements[2] = 0x3F80000000000000;
  self->hmlModel.__ptr_.__value_ = 0;
  self->_analyticsTracker.__ptr_.__value_ = 0;
  return self;
}

@end