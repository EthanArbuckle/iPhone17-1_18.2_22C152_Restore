@interface CMCameraWorkoutSession
- (CMCameraWorkoutSession)init;
- (CMCameraWorkoutSession)initWithOptions:(id)a3;
- (id).cxx_construct;
- (id)stats;
- (void)_feed2DSkeleton:(id)a3 localMachtime:(double)a4 globalMachtime:(double)a5;
- (void)_feed3DLiftedSkeleton:(id)a3 localMachtime:(double)a4 globalMachtime:(double)a5;
- (void)_feed3DRetargetedSkeleton:(id)a3 localMachtime:(double)a4 globalMachtime:(double)a5;
- (void)_feedAccel:(const Sample *)a3;
- (void)_feedAccessoryConfig:(const void *)a3;
- (void)_feedAccessoryInEarStatus:(int)a3;
- (void)_feedDeviceMotion:(const Sample *)a3;
- (void)_feedGyro:(const Sample *)a3;
- (void)_feedGyroTemperature:(const Temperature *)a3;
- (void)_feedHeadAccessoryDeviceMotion:(id)a3;
- (void)dealloc;
- (void)feedBodyMetrics:(id)a3;
- (void)feedFacePose:(id)a3;
- (void)feedFitnessMachineSample:(id)a3;
- (void)feedHeartRateReference:(unsigned __int16)a3 localMachtime:(double)a4 globalMachtime:(double)a5;
- (void)feedSkeleton:(id)a3;
- (void)feedWatchActiveCalories:(float)a3 localMachtime:(double)a4 globalMachtime:(double)a5;
- (void)feedWatchBasalCalories:(float)a3 localMachtime:(double)a4 globalMachtime:(double)a5;
- (void)feedWatchHeartRate:(float)a3 confidence:(float)a4 localMachtime:(double)a5 globalMachtime:(double)a6;
- (void)feedWorkoutEvent:(id)a3;
- (void)flushMsl;
- (void)logCounters;
- (void)start;
- (void)stop;
@end

@implementation CMCameraWorkoutSession

- (CMCameraWorkoutSession)init
{
  return (CMCameraWorkoutSession *)objc_msgSend_initWithOptions_(self, a2, MEMORY[0x1E4F1CC08]);
}

- (CMCameraWorkoutSession)initWithOptions:(id)a3
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  v51.receiver = self;
  v51.super_class = (Class)CMCameraWorkoutSession;
  v4 = [(CMCameraWorkoutSession *)&v51 init];
  v6 = v4;
  if (a3 && v4)
  {
    v7 = objc_msgSend_objectForKeyedSubscript_(a3, v5, @"kCMCameraWorkoutSessionMSLPrefix");
    uint64_t v9 = objc_msgSend_cStringUsingEncoding_(v7, v8, 1);
    v11 = objc_msgSend_objectForKeyedSubscript_(a3, v10, @"kCMCameraWorkoutSessionMSLPath");
    uint64_t v13 = objc_msgSend_cStringUsingEncoding_(v11, v12, 1);
    v15 = objc_msgSend_objectForKeyedSubscript_(a3, v14, @"kCMCameraWorkoutSessionLogAirPodsDM");
    v6->_BOOL logAirpodsDM = objc_msgSend_BOOLValue(v15, v16, v17);
    v19 = objc_msgSend_objectForKeyedSubscript_(a3, v18, @"kCMCameraWorkoutSessionLogDM");
    v6->_BOOL logDM = objc_msgSend_BOOLValue(v19, v20, v21);
    v23 = objc_msgSend_objectForKeyedSubscript_(a3, v22, @"kCMCameraWorkoutSessionLogAccel");
    v6->_BOOL logAccel = objc_msgSend_BOOLValue(v23, v24, v25);
    v27 = objc_msgSend_objectForKeyedSubscript_(a3, v26, @"kCMCameraWorkoutSessionLogGyro");
    v6->_BOOL logGyro = objc_msgSend_BOOLValue(v27, v28, v29);
    if (qword_1E929D938 != -1) {
      dispatch_once(&qword_1E929D938, &unk_1EDFD2A00);
    }
    v30 = qword_1E929D940;
    if (os_log_type_enabled((os_log_t)qword_1E929D940, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v33 = objc_msgSend_description(a3, v31, v32);
      *(_DWORD *)buf = 138412290;
      *(void *)v57 = v33;
      _os_log_impl(&dword_1902AF000, v30, OS_LOG_TYPE_DEFAULT, "[camera] options:%@", buf, 0xCu);
    }
    if (sub_1902D8400(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D938 != -1) {
        dispatch_once(&qword_1E929D938, &unk_1EDFD2A00);
      }
      uint64_t v43 = objc_msgSend_description(a3, v41, v42);
      int v52 = 138412290;
      *(void *)v53 = v43;
      v44 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "-[CMCameraWorkoutSession initWithOptions:]", "CoreLocation: %s\n", v44);
      if (v44 != (char *)buf) {
        free(v44);
      }
    }
    if (qword_1E929D938 != -1) {
      dispatch_once(&qword_1E929D938, &unk_1EDFD2A00);
    }
    v34 = qword_1E929D940;
    if (os_log_type_enabled((os_log_t)qword_1E929D940, OS_LOG_TYPE_DEFAULT))
    {
      BOOL logAirpodsDM = v6->_logAirpodsDM;
      BOOL logDM = v6->_logDM;
      BOOL logAccel = v6->_logAccel;
      BOOL logGyro = v6->_logGyro;
      *(_DWORD *)buf = 67109888;
      *(_DWORD *)v57 = logAirpodsDM;
      *(_WORD *)&v57[4] = 1024;
      *(_DWORD *)&v57[6] = logDM;
      LOWORD(v58) = 1024;
      *(_DWORD *)((char *)&v58 + 2) = logAccel;
      HIWORD(v58) = 1024;
      BOOL v59 = logGyro;
      _os_log_impl(&dword_1902AF000, v34, OS_LOG_TYPE_DEFAULT, "[camera] Logging,airpodsDM,%d,DM,%d,accel,%d,gyro,%d", buf, 0x1Au);
    }
    if (sub_1902D8400(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D938 != -1) {
        dispatch_once(&qword_1E929D938, &unk_1EDFD2A00);
      }
      BOOL v45 = v6->_logAirpodsDM;
      BOOL v46 = v6->_logDM;
      BOOL v47 = v6->_logAccel;
      BOOL v48 = v6->_logGyro;
      int v52 = 67109888;
      *(_DWORD *)v53 = v45;
      *(_WORD *)&v53[4] = 1024;
      *(_DWORD *)&v53[6] = v46;
      LOWORD(v54) = 1024;
      *(_DWORD *)((char *)&v54 + 2) = v47;
      HIWORD(v54) = 1024;
      BOOL v55 = v48;
      v49 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "-[CMCameraWorkoutSession initWithOptions:]", "CoreLocation: %s\n", v49);
      if (v49 != (char *)buf) {
        free(v49);
      }
    }
    v6->_audioAccessoryManager = (CMAudioAccessoryManager *)objc_opt_new();
    if (v9 && v13)
    {
      if (qword_1E929D938 != -1) {
        dispatch_once(&qword_1E929D938, &unk_1EDFD2A00);
      }
      v39 = qword_1E929D940;
      if (os_log_type_enabled((os_log_t)qword_1E929D940, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136380931;
        *(void *)v57 = v9;
        *(_WORD *)&v57[8] = 2081;
        uint64_t v58 = v13;
        _os_log_impl(&dword_1902AF000, v39, OS_LOG_TYPE_DEFAULT, "[camera] Logging MSL prefix:%{private}s path:%{private}s", buf, 0x16u);
      }
      if (sub_1902D8400(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1E929D938 != -1) {
          dispatch_once(&qword_1E929D938, &unk_1EDFD2A00);
        }
        int v52 = 136380931;
        *(void *)v53 = v9;
        *(_WORD *)&v53[8] = 2081;
        uint64_t v54 = v13;
        v50 = (char *)_os_log_send_and_compose_impl();
        sub_1902D398C("Generic", 1, 0, 2, "-[CMCameraWorkoutSession initWithOptions:]", "CoreLocation: %s\n", v50);
        if (v50 != (char *)buf) {
          free(v50);
        }
      }
      operator new();
    }
  }
  return v6;
}

- (void)dealloc
{
  objc_msgSend_stop(self, a2, v2);
  v4.receiver = self;
  v4.super_class = (Class)CMCameraWorkoutSession;
  [(CMCameraWorkoutSession *)&v4 dealloc];
}

- (void)start
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (qword_1E929D938 != -1) {
    dispatch_once(&qword_1E929D938, &unk_1EDFD2A00);
  }
  v3 = qword_1E929D940;
  if (os_log_type_enabled((os_log_t)qword_1E929D940, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1902AF000, v3, OS_LOG_TYPE_DEFAULT, "[camera] Starting session]", buf, 2u);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929D938 != -1) {
      dispatch_once(&qword_1E929D938, &unk_1EDFD2A00);
    }
    LOWORD(v31) = 0;
    uint64_t v25 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CMCameraWorkoutSession start]", "CoreLocation: %s\n", v25);
    if (v25 != (char *)buf) {
      free(v25);
    }
  }
  if (self->_logDM && !self->_deviceMotionDispatcher)
  {
    if (qword_1E929D938 != -1) {
      dispatch_once(&qword_1E929D938, &unk_1EDFD2A00);
    }
    v6 = qword_1E929D940;
    if (os_log_type_enabled((os_log_t)qword_1E929D940, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1902AF000, v6, OS_LOG_TYPE_DEFAULT, "[camera] Starting source DM", buf, 2u);
    }
    if (sub_1902D8400(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D938 != -1) {
        dispatch_once(&qword_1E929D938, &unk_1EDFD2A00);
      }
      LOWORD(v31) = 0;
      v28 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "-[CMCameraWorkoutSession start]", "CoreLocation: %s\n", v28);
      if (v28 != (char *)buf) {
        free(v28);
      }
    }
    v7 = [CLDeviceMotionProperties alloc];
    objc_msgSend_initWithMode_(v7, v8, 7);
    operator new();
  }
  if (self->_logAccel) {
    operator new();
  }
  if (self->_logGyro) {
    operator new();
  }
  if (self->_logAirpodsDM)
  {
    if (objc_msgSend__isAudioAccessoryDeviceMotionAvailable(self->_audioAccessoryManager, v4, v5))
    {
      if (qword_1E929D938 != -1) {
        dispatch_once(&qword_1E929D938, &unk_1EDFD2A00);
      }
      uint64_t v9 = qword_1E929D940;
      if (os_log_type_enabled((os_log_t)qword_1E929D940, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1902AF000, v9, OS_LOG_TYPE_DEFAULT, "[camera] Starting accessory DM", buf, 2u);
      }
      if (sub_1902D8400(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1E929D938 != -1) {
          dispatch_once(&qword_1E929D938, &unk_1EDFD2A00);
        }
        LOWORD(v31) = 0;
        v26 = (char *)_os_log_send_and_compose_impl();
        sub_1902D398C("Generic", 1, 0, 2, "-[CMCameraWorkoutSession start]", "CoreLocation: %s\n", v26);
        if (v26 != (char *)buf) {
          free(v26);
        }
      }
      audioAccessoryManager = self->_audioAccessoryManager;
      uint64_t v13 = objc_msgSend_mainQueue(MEMORY[0x1E4F28F08], v10, v11);
      objc_msgSend__startAudioAccessoryDeviceMotionStatusUpdatesToQueue_withHandler_(audioAccessoryManager, v14, v13, &unk_1EDFD39A0);
      objc_msgSend__setAudioAccessoryDeviceMotionUpdateInterval_(self->_audioAccessoryManager, v15, v16, 0.0199999996);
      *(void *)buf = 0;
      uint64_t v33 = buf;
      uint64_t v34 = 0x3052000000;
      v35 = sub_1902DD1B4;
      v36 = sub_1902DD0EC;
      v37 = self;
      uint64_t v17 = self->_audioAccessoryManager;
      uint64_t v20 = objc_msgSend_mainQueue(MEMORY[0x1E4F28F08], v18, v19);
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = sub_1905B4A24;
      v30[3] = &unk_1E5690190;
      v30[4] = buf;
      objc_msgSend__startAudioAccessoryDeviceMotionUpdatesToQueue_lowLatencyMode_withHandler_(v17, v21, v20, 1, v30);
      _Block_object_dispose(buf, 8);
    }
    else
    {
      if (qword_1E929D938 != -1) {
        dispatch_once(&qword_1E929D938, &unk_1EDFD2A00);
      }
      v22 = qword_1E929D940;
      if (os_log_type_enabled((os_log_t)qword_1E929D940, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1902AF000, v22, OS_LOG_TYPE_ERROR, "[camera] audio accessory not available", buf, 2u);
      }
      if (sub_1902D8400(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1E929D938 != -1) {
          dispatch_once(&qword_1E929D938, &unk_1EDFD2A00);
        }
        LOWORD(v31) = 0;
        v27 = (char *)_os_log_send_and_compose_impl();
        sub_1902D398C("Generic", 1, 0, 0, "-[CMCameraWorkoutSession start]", "CoreLocation: %s\n", v27);
        if (v27 != (char *)buf) {
          free(v27);
        }
      }
    }
  }
  v23 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, MEMORY[0x1E4F14428]);
  self->_logCountersTimer = v23;
  dispatch_source_set_timer((dispatch_source_t)v23, 0, 0x3B9ACA00uLL, 0x5F5E100uLL);
  *(void *)buf = 0;
  uint64_t v33 = buf;
  uint64_t v34 = 0x3052000000;
  v35 = sub_1902DD1B4;
  v36 = sub_1902DD0EC;
  v37 = self;
  logCountersTimer = self->_logCountersTimer;
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = sub_1905B4A40;
  handler[3] = &unk_1E568DDD8;
  handler[4] = buf;
  dispatch_source_set_event_handler(logCountersTimer, handler);
  dispatch_activate((dispatch_object_t)self->_logCountersTimer);
  _Block_object_dispose(buf, 8);
}

- (void)logCounters
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (qword_1E929D938 != -1) {
    dispatch_once(&qword_1E929D938, &unk_1EDFD2A00);
  }
  v3 = qword_1E929D940;
  if (os_log_type_enabled((os_log_t)qword_1E929D940, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v4 = atomic_load(&self->_accelCount.__a_.__a_value);
    unsigned int v5 = atomic_load(&self->_gyroCount.__a_.__a_value);
    unsigned int v6 = atomic_load(&self->_dmCount.__a_.__a_value);
    unsigned int v7 = atomic_load(&self->_airpodsDmCount.__a_.__a_value);
    unsigned int v8 = atomic_load(&self->_skeletonCount.__a_.__a_value);
    unsigned int v9 = atomic_load(&self->_facePoseCount.__a_.__a_value);
    unsigned int v10 = atomic_load(&self->_watchActiveCalorieCount.__a_.__a_value);
    unsigned int v11 = atomic_load(&self->_watchHeartRateCount.__a_.__a_value);
    unsigned int v12 = atomic_load(&self->_heartRateReferenceCount.__a_.__a_value);
    unsigned int v13 = atomic_load(&self->_fitnessMachineSampleCount.__a_.__a_value);
    v14[0] = 68291586;
    v14[1] = 0;
    __int16 v15 = 2082;
    uint64_t v16 = "";
    __int16 v17 = 1026;
    unsigned int v18 = v4;
    __int16 v19 = 1026;
    unsigned int v20 = v5;
    __int16 v21 = 1026;
    unsigned int v22 = v6;
    __int16 v23 = 1026;
    unsigned int v24 = v7;
    __int16 v25 = 1026;
    unsigned int v26 = v8;
    __int16 v27 = 1026;
    unsigned int v28 = v9;
    __int16 v29 = 1026;
    unsigned int v30 = v10;
    __int16 v31 = 1026;
    unsigned int v32 = v11;
    __int16 v33 = 1026;
    unsigned int v34 = v12;
    __int16 v35 = 1026;
    unsigned int v36 = v13;
    _os_log_impl(&dword_1902AF000, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"[camera] total count\", \"accel\":%{public}u, \"gyro\":%{public}u, \"dm\":%{public}u, \"airpodsDm\":%{public}u, \"skeleton\":%{public}u, \"facePose\":%{public}u, \"watchActiveCalorie\":%{public}u, \"watchHeartRate\":%{public}u, \"heartRateReference\":%{public}u, \"fitnessMachineSample\":%{public}u}", (uint8_t *)v14, 0x4Eu);
  }
}

- (void)stop
{
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
  if (self->_accelerometerDispatcher)
  {
    uint64_t v6 = sub_1902DFEC4();
    sub_1902CDE08(v6, 0, (uint64_t)self->_accelerometerDispatcher);
    accelerometerDispatcher = self->_accelerometerDispatcher;
    if (accelerometerDispatcher) {
      (*((void (**)(Dispatcher *))accelerometerDispatcher->var0 + 1))(accelerometerDispatcher);
    }
    self->_accelerometerDispatcher = 0;
  }
  if (self->_gyroDispatcher)
  {
    uint64_t v8 = sub_1902B4534();
    sub_1902CDE08(v8, 0, (uint64_t)self->_gyroDispatcher);
    gyroDispatcher = self->_gyroDispatcher;
    if (gyroDispatcher) {
      (*((void (**)(Dispatcher *))gyroDispatcher->var0 + 1))(gyroDispatcher);
    }
    self->_gyroDispatcher = 0;
  }
  if (self->_gyroTemperatureDispatcher)
  {
    uint64_t v10 = sub_1902B4534();
    sub_1902CDE08(v10, 1, (uint64_t)self->_gyroTemperatureDispatcher);
    gyroTemperatureDispatcher = self->_gyroTemperatureDispatcher;
    if (gyroTemperatureDispatcher) {
      (*((void (**)(Dispatcher *))gyroTemperatureDispatcher->var0 + 1))(gyroTemperatureDispatcher);
    }
    self->_gyroTemperatureDispatcher = 0;
  }
  logCountersTimer = self->_logCountersTimer;
  if (logCountersTimer)
  {
    dispatch_source_cancel(logCountersTimer);
    self->_logCountersTimer = 0;
  }
  audioAccessoryManager = self->_audioAccessoryManager;

  MEMORY[0x1F4181798](audioAccessoryManager, sel__stopAudioAccessoryDeviceMotionUpdates, v2);
}

- (id)stats
{
  v35[10] = *MEMORY[0x1E4F143B8];
  v34[0] = @"accelCount";
  v3 = NSNumber;
  uint64_t v4 = atomic_load(&self->_accelCount.__a_.__a_value);
  v35[0] = objc_msgSend_numberWithUnsignedInt_(v3, a2, v4);
  v34[1] = @"gyroCount";
  unsigned int v5 = NSNumber;
  uint64_t v6 = atomic_load(&self->_gyroCount.__a_.__a_value);
  v35[1] = objc_msgSend_numberWithUnsignedInt_(v5, v7, v6);
  v34[2] = @"dmCount";
  uint64_t v8 = NSNumber;
  uint64_t v9 = atomic_load(&self->_dmCount.__a_.__a_value);
  v35[2] = objc_msgSend_numberWithUnsignedInt_(v8, v10, v9);
  v34[3] = @"airpodsDmCount";
  unsigned int v11 = NSNumber;
  uint64_t v12 = atomic_load(&self->_airpodsDmCount.__a_.__a_value);
  v35[3] = objc_msgSend_numberWithUnsignedInt_(v11, v13, v12);
  v34[4] = @"skeletonCount";
  v14 = NSNumber;
  uint64_t v15 = atomic_load(&self->_skeletonCount.__a_.__a_value);
  v35[4] = objc_msgSend_numberWithUnsignedInt_(v14, v16, v15);
  v34[5] = @"facePoseCount";
  __int16 v17 = NSNumber;
  uint64_t v18 = atomic_load(&self->_facePoseCount.__a_.__a_value);
  v35[5] = objc_msgSend_numberWithUnsignedInt_(v17, v19, v18);
  v34[6] = @"watchCalorieCount";
  unsigned int v20 = NSNumber;
  uint64_t v21 = atomic_load(&self->_watchActiveCalorieCount.__a_.__a_value);
  v35[6] = objc_msgSend_numberWithUnsignedInt_(v20, v22, v21);
  v34[7] = @"watchHeartRateCount";
  __int16 v23 = NSNumber;
  uint64_t v24 = atomic_load(&self->_watchHeartRateCount.__a_.__a_value);
  v35[7] = objc_msgSend_numberWithUnsignedInt_(v23, v25, v24);
  v34[8] = @"heartRateReferenceCount";
  unsigned int v26 = NSNumber;
  uint64_t v27 = atomic_load(&self->_heartRateReferenceCount.__a_.__a_value);
  v35[8] = objc_msgSend_numberWithUnsignedInt_(v26, v28, v27);
  v34[9] = @"fitnessMachineSampleCount";
  __int16 v29 = NSNumber;
  uint64_t v30 = atomic_load(&self->_fitnessMachineSampleCount.__a_.__a_value);
  v35[9] = objc_msgSend_numberWithUnsignedInt_(v29, v31, v30);
  return (id)objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v32, (uint64_t)v35, v34, 10);
}

- (void)feedSkeleton:(id)a3
{
  uint64_t v5 = objc_msgSend_skeleton2D(a3, a2, (uint64_t)a3);
  objc_msgSend_localMachtime(a3, v6, v7);
  double v9 = v8;
  objc_msgSend_globalMachtime(a3, v10, v11);
  objc_msgSend__feed2DSkeleton_localMachtime_globalMachtime_(self, v12, v5, v9, v13);
  uint64_t v16 = objc_msgSend_skeleton3DLifted(a3, v14, v15);
  objc_msgSend_localMachtime(a3, v17, v18);
  double v20 = v19;
  objc_msgSend_globalMachtime(a3, v21, v22);
  objc_msgSend__feed3DLiftedSkeleton_localMachtime_globalMachtime_(self, v23, v16, v20, v24);
  uint64_t v27 = objc_msgSend_skeleton3DRetargeted(a3, v25, v26);
  objc_msgSend_localMachtime(a3, v28, v29);
  double v31 = v30;
  objc_msgSend_globalMachtime(a3, v32, v33);
  objc_msgSend__feed3DRetargetedSkeleton_localMachtime_globalMachtime_(self, v34, v27, v31, v35);
  atomic_fetch_add((atomic_uint *volatile)&self->_skeletonCount, 1u);
}

- (void)_feed2DSkeleton:(id)a3 localMachtime:(double)a4 globalMachtime:(double)a5
{
  v29[33] = *MEMORY[0x1E4F143B8];
  if (self->_logger.__ptr_.__value_)
  {
    if (objc_msgSend_count(a3, a2, (uint64_t)a3, *(void *)&a4, *(void *)&a5))
    {
      unint64_t v8 = 0;
      do
      {
        double v9 = objc_msgSend_objectAtIndexedSubscript_(a3, v7, v8);
        int v12 = objc_msgSend_type(v9, v10, v11);
        v14 = objc_msgSend_objectAtIndexedSubscript_(a3, v13, v8);
        objc_msgSend_position(v14, v15, v16);
        v29[v12 + 2] = v17;
        double v19 = objc_msgSend_objectAtIndexedSubscript_(a3, v18, v8);
        objc_msgSend_confidence(v19, v20, v21);
        *((_DWORD *)&v29[21] + v12) = v22;
        double v24 = objc_msgSend_objectAtIndexedSubscript_(a3, v23, v8);
        *((unsigned char *)&v29[30] + v12 + 4) = objc_msgSend_visible(v24, v25, v26);
        ++v8;
      }
      while (objc_msgSend_count(a3, v27, v28) > v8);
    }
    sub_1904381F4(self->_logger.__ptr_.__value_, v29);
  }
}

- (void)_feed3DLiftedSkeleton:(id)a3 localMachtime:(double)a4 globalMachtime:(double)a5
{
  if (self->_logger.__ptr_.__value_)
  {
    if (objc_msgSend_count(a3, a2, (uint64_t)a3, *(void *)&a4, *(void *)&a5))
    {
      unint64_t v8 = 0;
      do
      {
        double v9 = objc_msgSend_objectAtIndexedSubscript_(a3, v7, v8);
        int v12 = objc_msgSend_type(v9, v10, v11);
        v14 = objc_msgSend_objectAtIndexedSubscript_(a3, v13, v8);
        objc_msgSend_position(v14, v15, v16);
        *((_OWORD *)&v20 + v12 + 1) = v17;
        ++v8;
      }
      while (objc_msgSend_count(a3, v18, v19) > v8);
    }
    sub_19043864C(self->_logger.__ptr_.__value_, &v20);
  }
}

- (void)_feed3DRetargetedSkeleton:(id)a3 localMachtime:(double)a4 globalMachtime:(double)a5
{
  if (self->_logger.__ptr_.__value_)
  {
    if (objc_msgSend_count(a3, a2, (uint64_t)a3, *(void *)&a4, *(void *)&a5))
    {
      unint64_t v8 = 0;
      do
      {
        double v9 = objc_msgSend_objectAtIndexedSubscript_(a3, v7, v8);
        int v12 = objc_msgSend_type(v9, v10, v11);
        v14 = objc_msgSend_objectAtIndexedSubscript_(a3, v13, v8);
        objc_msgSend_position(v14, v15, v16);
        long long v17 = &v26 + 2 * v12;
        *((_OWORD *)v17 + 1) = v18;
        uint64_t v20 = objc_msgSend_objectAtIndexedSubscript_(a3, v19, v8);
        objc_msgSend_quaternion(v20, v21, v22);
        *((_OWORD *)v17 + 26) = v23;
        ++v8;
      }
      while (objc_msgSend_count(a3, v24, v25) > v8);
    }
    sub_190438B2C(self->_logger.__ptr_.__value_, &v26);
  }
}

- (void)feedFacePose:(id)a3
{
  objc_msgSend_rotation(a3, a2, (uint64_t)a3);
  float v10 = *(float *)&v9.i32[2] + (float)(*(float *)v7.i32 + *(float *)&v8.i32[1]);
  if (v10 >= 0.0)
  {
    float v20 = sqrtf(v10 + 1.0);
    *(float *)&unsigned int v21 = v20 + v20;
    float32x2_t v22 = vrecpe_f32((float32x2_t)v21);
    float32x2_t v23 = vmul_f32(v22, vrecps_f32((float32x2_t)v21, v22));
    v24.i32[0] = vmul_f32(v23, vrecps_f32((float32x2_t)v21, v23)).u32[0];
    float32x2_t v35 = vmul_n_f32(vsub_f32((float32x2_t)*(_OWORD *)&vzip2q_s32(v8, vuzp1q_s32(v8, v9)), (float32x2_t)*(_OWORD *)&vtrn2q_s32(v9, vzip2q_s32(v9, v7))), v24.f32[0]);
    v25.i32[0] = vsub_f32((float32x2_t)*(_OWORD *)&vdupq_lane_s32(*(int32x2_t *)v7.i8, 1), *(float32x2_t *)v8.i8).u32[0];
    v25.i32[1] = v21;
    v24.i32[1] = 0.25;
    float32x2_t v38 = vmul_f32(v25, v24);
  }
  else if (*(float *)v7.i32 < *(float *)&v8.i32[1] || *(float *)v7.i32 < *(float *)&v9.i32[2])
  {
    float v12 = 1.0 - *(float *)v7.i32;
    if (*(float *)&v8.i32[1] >= *(float *)&v9.i32[2])
    {
      float v39 = sqrtf(*(float *)&v8.i32[1] + (float)(v12 - *(float *)&v9.i32[2]));
      *(float *)&unsigned int v40 = v39 + v39;
      float32x2_t v41 = vrecpe_f32((float32x2_t)v40);
      float32x2_t v42 = vmul_f32(v41, vrecps_f32((float32x2_t)v40, v41));
      v43.i32[0] = vmul_f32(v42, vrecps_f32((float32x2_t)v40, v42)).u32[0];
      v42.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_lane_s32(*(int32x2_t *)v7.i8, 1), *(float32x2_t *)v8.i8).u32[0];
      v42.i32[1] = v40;
      float32x2_t v44 = (float32x2_t)vrev64_s32(*(int32x2_t *)v9.i8);
      float32x2_t v45 = (float32x2_t)vzip2q_s32(v8, v7).u64[0];
      v46.i32[0] = vadd_f32(v44, v45).u32[0];
      v46.i32[1] = vsub_f32(v44, v45).i32[1];
      float32x2_t v38 = vmul_n_f32(v46, v43.f32[0]);
      v43.i32[1] = 0.25;
      float32x2_t v35 = vmul_f32(v42, v43);
    }
    else
    {
      float32x2_t v13 = (float32x2_t)__PAIR64__(v7.u32[1], COERCE_UNSIGNED_INT(sqrtf(*(float *)&v9.i32[2] + (float)(v12 - *(float *)&v8.i32[1]))));
      float32x2_t v14 = vadd_f32((float32x2_t)*(_OWORD *)&vzip2q_s32(v7, v8), *(float32x2_t *)v9.i8);
      float32x2_t v15 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)v8.i8, 0);
      float32x2_t v16 = vsub_f32(*(float32x2_t *)v7.i8, v15);
      v15.i32[0] = 2.0;
      v15.i32[0] = vmul_f32(v13, v15).u32[0];
      v15.i32[1] = v16.i32[1];
      float32x2_t v17 = vrecpe_f32((float32x2_t)v15.u32[0]);
      float32x2_t v18 = vmul_f32(v17, vrecps_f32((float32x2_t)v15.u32[0], v17));
      v16.i32[0] = vmul_f32(v18, vrecps_f32((float32x2_t)v15.u32[0], v18)).u32[0];
      float32x2_t v35 = vmul_n_f32(v14, v16.f32[0]);
      __asm { FMOV            V2.2S, #0.25 }
      _D2.i32[1] = v16.i32[0];
      float32x2_t v38 = vmul_f32(v15, _D2);
    }
  }
  else
  {
    float32x2_t v26 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)v8.i8, 0);
    float32x2_t v27 = vadd_f32(*(float32x2_t *)v7.i8, v26);
    v26.i32[0] = 2.0;
    v26.i32[0] = vmul_f32((float32x2_t)__PAIR64__(v7.u32[1], COERCE_UNSIGNED_INT(sqrtf(*(float *)v7.i32+ (float)((float)(1.0 - *(float *)&v8.i32[1]) - *(float *)&v9.i32[2])))), v26).u32[0];
    v26.i32[1] = v27.i32[1];
    float32x2_t v28 = vrecpe_f32((float32x2_t)v26.u32[0]);
    float32x2_t v29 = vmul_f32(v28, vrecps_f32((float32x2_t)v26.u32[0], v28));
    LODWORD(v30) = vmul_f32(v29, vrecps_f32((float32x2_t)v26.u32[0], v29)).u32[0];
    __asm { FMOV            V5.2S, #0.25 }
    _D5.f32[1] = v30;
    float32x2_t v35 = vmul_f32(v26, _D5);
    float32x2_t v36 = (float32x2_t)vzip2q_s32(v7, v8).u64[0];
    v37.i32[0] = vadd_f32(v36, *(float32x2_t *)v9.i8).u32[0];
    v37.i32[1] = vsub_f32(v36, *(float32x2_t *)&v9).i32[1];
    float32x2_t v38 = vmul_n_f32(v37, v30);
  }
  objc_msgSend_localMachtime(a3, v5, v6);
  v153[0] = v47;
  objc_msgSend_localMachtime(a3, v48, v49);
  v153[1] = v50;
  v153[2] = 0x100000002;
  float64x2_t v154 = vcvtq_f64_f32(v35);
  float64x2_t v155 = vcvtq_f64_f32(v38);
  objc_msgSend_translation(a3, v51, v52);
  unsigned int v140 = v53;
  objc_msgSend_translation(a3, v54, v55);
  unint64_t v156 = __PAIR64__(v56, v140);
  objc_msgSend_translation(a3, v57, v58);
  int v157 = v59;
  uint64_t v158 = 0;
  uint64_t v160 = 0;
  uint64_t v159 = 0;
  objc_msgSend_gaze(a3, v60, v61);
  unsigned int v141 = v62;
  objc_msgSend_gaze(a3, v63, v64);
  unint64_t v161 = __PAIR64__(v65, v141);
  objc_msgSend_gaze(a3, v66, v67);
  int v162 = v68;
  objc_msgSend_leftEyePosition(a3, v69, v70);
  unsigned int v142 = v71;
  objc_msgSend_leftEyePosition(a3, v72, v73);
  unint64_t v163 = __PAIR64__(v74, v142);
  objc_msgSend_leftEyePosition(a3, v75, v76);
  int v164 = v77;
  objc_msgSend_rightEyePosition(a3, v78, v79);
  unsigned int v143 = v80;
  objc_msgSend_rightEyePosition(a3, v81, v82);
  unint64_t v165 = __PAIR64__(v83, v143);
  objc_msgSend_rightEyePosition(a3, v84, v85);
  int v166 = v86;
  uint64_t v167 = 0;
  uint64_t v168 = 0;
  char v150 = 0;
  objc_msgSend_confidence(a3, v87, v88);
  int v147 = v89;
  char v148 = objc_msgSend_tooDark(a3, v90, v91);
  __int16 v149 = objc_msgSend_sensorCovered(a3, v92, v93);
  uint64_t v151 = objc_msgSend_failureCode(a3, v94, v95);
  objc_msgSend_roll(a3, v96, v97);
  uint64_t v152 = v98;
  __p = 0;
  v145 = 0;
  v146 = 0;
  v101 = objc_msgSend_blendShapeWeights(a3, v99, v100);
  if (objc_msgSend_count(v101, v102, v103))
  {
    for (unint64_t i = 0; ; ++i)
    {
      v107 = objc_msgSend_blendShapeWeights(a3, (const char *)v104, v105);
      if (objc_msgSend_count(v107, v108, v109) <= i) {
        break;
      }
      v112 = objc_msgSend_blendShapeWeights(a3, v110, v111);
      v114 = objc_msgSend_objectAtIndexedSubscript_(v112, v113, i);
      objc_msgSend_floatValue(v114, v115, v116);
      int v118 = v117;
      v119 = v145;
      if (v145 >= v146)
      {
        v121 = (char *)__p;
        uint64_t v122 = (v145 - (unsigned char *)__p) >> 2;
        unint64_t v123 = v122 + 1;
        if ((unint64_t)(v122 + 1) >> 62) {
          sub_1903479E8();
        }
        uint64_t v124 = v146 - (unsigned char *)__p;
        if ((v146 - (unsigned char *)__p) >> 1 > v123) {
          unint64_t v123 = v124 >> 1;
        }
        if ((unint64_t)v124 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v104 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v104 = v123;
        }
        if (v104)
        {
          v125 = (char *)sub_190347D04((uint64_t)&v146, v104);
          v121 = (char *)__p;
          v119 = v145;
        }
        else
        {
          v125 = 0;
        }
        v126 = &v125[4 * v122];
        *(_DWORD *)v126 = v118;
        v120 = v126 + 4;
        while (v119 != v121)
        {
          int v127 = *((_DWORD *)v119 - 1);
          v119 -= 4;
          *((_DWORD *)v126 - 1) = v127;
          v126 -= 4;
        }
        __p = v126;
        v145 = v120;
        v146 = &v125[4 * v104];
        if (v121) {
          operator delete(v121);
        }
      }
      else
      {
        *(_DWORD *)v145 = v117;
        v120 = v119 + 4;
      }
      v145 = v120;
    }
    value = (uint64_t *)self->_logger.__ptr_.__value_;
    objc_msgSend_localMachtime(a3, v110, v111);
    double v130 = v129;
    objc_msgSend_globalMachtime(a3, v131, v132);
    sub_190439C14(value, (int **)&__p, v130, v133);
  }
  v134 = (uint64_t *)self->_logger.__ptr_.__value_;
  objc_msgSend_localMachtime(a3, (const char *)v104, v105);
  double v136 = v135;
  objc_msgSend_globalMachtime(a3, v137, v138);
  sub_1904392F0(v134, (uint64_t)v153, (uint64_t)&v147, v136, v139);
  atomic_fetch_add((atomic_uint *volatile)&self->_facePoseCount, 1u);
  if (__p)
  {
    v145 = (char *)__p;
    operator delete(__p);
  }
}

- (void)feedWatchActiveCalories:(float)a3 localMachtime:(double)a4 globalMachtime:(double)a5
{
  value = (uint64_t *)self->_logger.__ptr_.__value_;
  if (value) {
    sub_190439778(value, a3, a4, a5);
  }
  atomic_fetch_add((atomic_uint *volatile)&self->_watchActiveCalorieCount, 1u);
}

- (void)feedWatchBasalCalories:(float)a3 localMachtime:(double)a4 globalMachtime:(double)a5
{
  value = (uint64_t *)self->_logger.__ptr_.__value_;
  if (value) {
    sub_1904398C0(value, a3, a4, a5);
  }
  atomic_fetch_add((atomic_uint *volatile)&self->_watchBasalCalorieCount, 1u);
}

- (void)feedWatchHeartRate:(float)a3 confidence:(float)a4 localMachtime:(double)a5 globalMachtime:(double)a6
{
  value = (uint64_t *)self->_logger.__ptr_.__value_;
  if (value) {
    sub_190439A08(value, a3, a4, a5, a6);
  }
  atomic_fetch_add((atomic_uint *volatile)&self->_watchHeartRateCount, 1u);
}

- (void)feedHeartRateReference:(unsigned __int16)a3 localMachtime:(double)a4 globalMachtime:(double)a5
{
  value = (uint64_t *)self->_logger.__ptr_.__value_;
  if (value) {
    sub_19043B834(value, a3, a4, a5);
  }
  atomic_fetch_add((atomic_uint *volatile)&self->_heartRateReferenceCount, 1u);
}

- (void)feedWorkoutEvent:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (self->_logger.__ptr_.__value_)
  {
    unsigned int v5 = objc_msgSend_eventType(a3, a2, (uint64_t)a3);
    if (v5 >= 6)
    {
      if (qword_1E929D938 != -1) {
        dispatch_once(&qword_1E929D938, &unk_1EDFD2A00);
      }
      int32x4_t v9 = qword_1E929D940;
      if (os_log_type_enabled((os_log_t)qword_1E929D940, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = objc_msgSend_eventType(a3, v10, v11);
        _os_log_impl(&dword_1902AF000, v9, OS_LOG_TYPE_DEFAULT, "[camera] Received unsupported event: %d", buf, 8u);
      }
      if (sub_1902D8400(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1E929D938 != -1) {
          dispatch_once(&qword_1E929D938, &unk_1EDFD2A00);
        }
        objc_msgSend_eventType(a3, v18, v19);
        float v20 = (char *)_os_log_send_and_compose_impl();
        sub_1902D398C("Generic", 1, 0, 2, "-[CMCameraWorkoutSession feedWorkoutEvent:]", "CoreLocation: %s\n", v20);
        if (v20 != (char *)buf) {
          free(v20);
        }
      }
      uint64_t v8 = 23;
    }
    else
    {
      uint64_t v8 = *(void *)&asc_19060CC08[8 * v5];
    }
    objc_msgSend_localMachtime(a3, v6, v7);
    *(void *)buf = v12;
    objc_msgSend_localMachtime(a3, v13, v14);
    uint64_t v23 = v15;
    uint64_t v24 = objc_msgSend_workoutType(a3, v16, v17);
    uint64_t v22 = v8;
    sub_19043B978((uint64_t *)self->_logger.__ptr_.__value_, (uint64_t *)buf);
  }
}

- (void)feedBodyMetrics:(id)a3
{
  if (self->_logger.__ptr_.__value_)
  {
    *(_OWORD *)uint64_t v23 = 0u;
    unsigned int v5 = objc_msgSend_biologicalSex(a3, a2, (uint64_t)a3, 0, 0, 0, 0, 0, 0, 0, *(void *)&v23[12]);
    if (v5 <= 3) {
      v22[1] = v5;
    }
    objc_msgSend_heightMeters(a3, v6, v7);
    *(float *)&double v8 = v8;
    v22[2] = LODWORD(v8);
    objc_msgSend_weightKG(a3, v9, v10);
    *(float *)&double v11 = v11;
    v22[3] = LODWORD(v11);
    objc_msgSend_vo2max(a3, v12, v13);
    *(float *)&double v14 = v14;
    v22[4] = LODWORD(v14);
    *(float *)&v22[5] = (float)(int)objc_msgSend_age(a3, v15, v16);
    v23[4] = objc_msgSend_betaBlockerUse(a3, v17, v18);
    value = (uint64_t *)self->_logger.__ptr_.__value_;
    objc_msgSend_localMachtime(a3, v20, v21);
    sub_190439FA4(value, (uint64_t)v22);
  }
}

- (void)feedFitnessMachineSample:(id)a3
{
  if (self->_logger.__ptr_.__value_)
  {
    objc_msgSend_localMachtime(a3, a2, (uint64_t)a3);
    v70[0] = v5;
    objc_msgSend_globalMachtime(a3, v6, v7);
    v70[1] = v8;
    objc_msgSend_elapsedTime(a3, v9, v10);
    v70[2] = v11;
    objc_msgSend_energy(a3, v12, v13);
    int v71 = v14;
    objc_msgSend_treadmillDistance(a3, v15, v16);
    int v72 = v17;
    objc_msgSend_indoorBikeDistance(a3, v18, v19);
    int v73 = v20;
    objc_msgSend_crossTrainerDistance(a3, v21, v22);
    int v74 = v23;
    int v75 = objc_msgSend_floors(a3, v24, v25);
    int v76 = objc_msgSend_stepCount(a3, v26, v27);
    objc_msgSend_strideCount(a3, v28, v29);
    int v77 = v30;
    objc_msgSend_instantaneousSpeed(a3, v31, v32);
    int v78 = v33;
    objc_msgSend_averageSpeed(a3, v34, v35);
    int v79 = v36;
    objc_msgSend_instantaneousPace(a3, v37, v38);
    int v80 = v39;
    objc_msgSend_averagePace(a3, v40, v41);
    int v81 = v42;
    objc_msgSend_elevationGain(a3, v43, v44);
    int v82 = v45;
    objc_msgSend_inclination(a3, v46, v47);
    int v83 = v48;
    objc_msgSend_resistanceLevel(a3, v49, v50);
    int v84 = v51;
    objc_msgSend_instantaneousPower(a3, v52, v53);
    int v85 = v54;
    objc_msgSend_averagePower(a3, v55, v56);
    int v86 = v57;
    objc_msgSend_instantaneousCadence(a3, v58, v59);
    int v87 = v60;
    objc_msgSend_averageCadence(a3, v61, v62);
    int v88 = v63;
    objc_msgSend_instantaneousHeartRate(a3, v64, v65);
    int v89 = v66;
    objc_msgSend_averageHeartRate(a3, v67, v68);
    int v90 = v69;
    sub_19043BB08((uint64_t *)self->_logger.__ptr_.__value_, v70);
  }
  atomic_fetch_add((atomic_uint *volatile)&self->_fitnessMachineSampleCount, 1u);
}

- (void)_feedAccessoryConfig:(const void *)a3
{
  value = (uint64_t *)self->_logger.__ptr_.__value_;
  if (value) {
    sub_19043ABE8(value, (int *)a3);
  }
}

- (void)_feedAccessoryInEarStatus:(int)a3
{
  value = (uint64_t *)self->_logger.__ptr_.__value_;
  if (value)
  {
    uint64_t v5 = mach_continuous_time();
    double v6 = sub_1902D8D34(v5);
    sub_19043AABC(value, a3, v6);
  }
}

- (void)_feedDeviceMotion:(const Sample *)a3
{
  value = (uint64_t *)self->_logger.__ptr_.__value_;
  if (value) {
    sub_19043B09C(value, &a3->timestamp, 7);
  }
  atomic_fetch_add((atomic_uint *volatile)&self->_dmCount, 1u);
}

- (void)_feedAccel:(const Sample *)a3
{
  value = (uint64_t *)self->_logger.__ptr_.__value_;
  if (value) {
    sub_19043B404(value, (uint64_t *)a3);
  }
  atomic_fetch_add((atomic_uint *volatile)&self->_accelCount, 1u);
}

- (void)_feedGyro:(const Sample *)a3
{
  value = (uint64_t *)self->_logger.__ptr_.__value_;
  if (value) {
    sub_19043B54C(value, (uint64_t *)a3);
  }
  atomic_fetch_add((atomic_uint *volatile)&self->_gyroCount, 1u);
}

- (void)_feedGyroTemperature:(const Temperature *)a3
{
  value = (uint64_t *)self->_logger.__ptr_.__value_;
  if (value) {
    sub_19043B728(value, (uint64_t)a3);
  }
}

- (void)_feedHeadAccessoryDeviceMotion:(id)a3
{
  value = (uint64_t *)self->_logger.__ptr_.__value_;
  if (value) {
    sub_19043A110(value, a3);
  }
  atomic_fetch_add((atomic_uint *volatile)&self->_airpodsDmCount, 1u);
}

- (void)flushMsl
{
  value = (uint64_t *)self->_logger.__ptr_.__value_;
  if (value) {
    sub_190439EF4(value);
  }
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

@end