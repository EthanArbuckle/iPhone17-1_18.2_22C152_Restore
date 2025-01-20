@interface CMMediaSession
+ (BOOL)_isAvailable;
+ (double)defaultFaceToDevicePitchAngle;
- (AudioAccessorySample)_getLastAudioAccessorySample;
- (BOOL)_disallowOpportunisticAnchorTrackingForFTClients:(int)a3 clientMode:(int)a4;
- (BOOL)_start;
- (BOOL)_startPoseUpdatesToQueue:(id)a3 andHandler:(id)a4;
- (BOOL)alwaysNotify50HzPose;
- (BOOL)isRequestingCameraOn;
- (BOOL)returnDefaultPose;
- (BOOL)returnRandomPose;
- (CMMediaSession)init;
- (NSString)mcLogPath;
- (float)prevAmbienceBedRoll;
- (id).cxx_construct;
- (id)_initWithOptions:(id)a3;
- (int)_createPoseFromListenerOrientation:(const ListenerOrientation *)a3 Pose:(id *)a4;
- (int)_mapCMMediaSessionClientModeToRelDMClientMode:(int64_t)a3;
- (unint64_t)_getAuxSampleTimestamp:(const void *)a3 currentTime:(double)a4;
- (unsigned)accessoryIMUSampleRate;
- (void)_disableLoggingForReplay;
- (void)_enableLoggingForReplayWithFilenamePrefix:(id)a3 filePath:(id)a4;
- (void)_feedAccessoryConfig:(const void *)a3;
- (void)_feedAccessoryDeviceMotion:(const void *)a3;
- (void)_feedAccessoryInEarStatus:(const int *)a3;
- (void)_feedAdaptiveLatencyJitterBufferLevel;
- (void)_feedDisplayCount:(unsigned int)a3;
- (void)_feedFaceKitData:(id)a3 timestamp:(double)a4;
- (void)_feedLidAngle:(double)a3;
- (void)_feedPoseAnchor:(const Sample *)a3 facePoseError:(id *)a4 lidAngleDeg:(float)a5;
- (void)_feedPredictorEstimates;
- (void)_feedScreenUnlockedEvent:(BOOL)a3;
- (void)_feedSourceDeviceIMU:(const Sample *)a3;
- (void)_logEvent:(id)a3;
- (void)_notifyClientHandler;
- (void)_readFrontCameraToDisplayCenterOffset;
- (void)_reset;
- (void)_setFixedTransforms:(const CMOQuaternion *)a3;
- (void)_setTrackingSchemeInternal:(int)a3;
- (void)_startDefaultsPreferenceUpdater;
- (void)_startHeadTracking;
- (void)_startJitterBufferLevelMonitor;
- (void)_startJitterBufferLevelRetryTimer;
- (void)_stop;
- (void)_stopDefaultsPreferenceUpdater;
- (void)_stopHeadTracking;
- (void)_stopJitterBufferLevelMonitor;
- (void)_stopJitterBufferLevelRetryTimer;
- (void)_triggerUserInteractedWithDeviceEvent;
- (void)_updateAnchorIntervalSettings;
- (void)_updateCameraControllerParameters;
- (void)_updateClientMode:(int64_t)a3;
- (void)_updateMinQuiescentPeriodForBTZ;
- (void)_updateTrackingScheme:(int64_t)a3;
- (void)_updateTrackingSchemeSettings;
- (void)_updateUseFwdPredictionUserSettings;
- (void)_updateUseHeadToHeadsetTransformationEstimator;
- (void)_updateUserSettings;
- (void)dealloc;
- (void)feedPoseAnchorWithAttitude:(id)a3 position:()CMVector<float lidAngleDeg:(3UL>)a4 timestampUs:(float)a5;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setAccessoryIMUSampleRate:(unsigned int)a3;
- (void)setAlwaysNotify50HzPose:(BOOL)a3;
- (void)setMcLogPath:(id)a3;
- (void)setPrevAmbienceBedRoll:(float)a3;
- (void)setRequestingCameraOn:(BOOL)a3;
- (void)setReturnDefaultPose:(BOOL)a3;
- (void)setReturnRandomPose:(BOOL)a3;
@end

@implementation CMMediaSession

+ (BOOL)_isAvailable
{
  return 1;
}

+ (double)defaultFaceToDevicePitchAngle
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1EB3BEB88, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1EB3BEB88))
  {
    sub_1902BAD40();
    int v3 = sub_19046BCE8();
    double v4 = 0.0;
    if (v3) {
      double v4 = -20.0;
    }
    qword_1EB3BEB80 = *(void *)&v4;
    __cxa_guard_release(&qword_1EB3BEB88);
  }
  return *(double *)&qword_1EB3BEB80;
}

- (void)_enableLoggingForReplayWithFilenamePrefix:(id)a3 filePath:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  self->_logForReplay = 1;
  if (qword_1E929D8D8 != -1) {
    dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
  }
  v7 = qword_1E929D8E0;
  if (os_log_type_enabled((os_log_t)qword_1E929D8E0, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138477827;
    id v13 = a4;
    _os_log_impl(&dword_1902AF000, v7, OS_LOG_TYPE_INFO, "[CMMediaSession] Logging to: %{private}@", buf, 0xCu);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929D8D8 != -1) {
      dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
    }
    v11 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CMMediaSession _enableLoggingForReplayWithFilenamePrefix:filePath:]", "CoreLocation: %s\n", v11);
    if (v11 != (char *)buf) {
      free(v11);
    }
  }
  objc_msgSend_setMcLogPath_(self, v8, (uint64_t)a4);
  objc_msgSend_cStringUsingEncoding_(a3, v9, 1);
  objc_msgSend_cStringUsingEncoding_(a4, v10, 1);
  operator new();
}

- (void)_disableLoggingForReplay
{
  self->_logForReplay = 0;
  v2 = (void *)((char *)self->_headTrackingService.__ptr_.__value_ + 37512);
  if (*v2) {
    *(void *)(*v2 + 7592) = 0;
  }
  uint64_t v3 = v2[1];
  if (v3) {
    *(void *)(v3 + 5952) = 0;
  }
  sub_1904378CC((uint64_t **)&self->_logger, 0);
}

- (int)_createPoseFromListenerOrientation:(const ListenerOrientation *)a3 Pose:(id *)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  float v7 = a3->var0.elements[0];
  float v8 = a3->var0.elements[1];
  float v9 = a3->var0.elements[2];
  float v10 = a3->var0.elements[3];
  unint64_t v11 = *((void *)self->_headTrackingService.__ptr_.__value_ + 676);
  double timestamp = self->_lastAudioAccessorySample.timestamp;
  uint64_t v13 = mach_absolute_time();
  double v16 = sub_1902D8D34(v13);
  if (self->_inEarStatus == 4) {
    unint64_t var1 = a3->var1;
  }
  else {
    unint64_t var1 = 0;
  }
  if (var1) {
    int v18 = objc_msgSend_returnDefaultPose(self, v14, v15);
  }
  else {
    int v18 = 1;
  }
  if (objc_msgSend_returnRandomPose(self, v14, v15)) {
    int v21 = objc_msgSend_returnDefaultPose(self, v19, v20) ^ 1;
  }
  else {
    int v21 = 0;
  }
  value = self->_headTrackingService.__ptr_.__value_;
  int v23 = *(_DWORD *)(*((void *)value + 4686) + 112);
  int v24 = *((unsigned __int8 *)value + 16058);
  if (!v18)
  {
    double v25 = v10;
    double v28 = v7;
    double v27 = v8;
    double v26 = v9;
    if (!v21) {
      goto LABEL_17;
    }
LABEL_14:
    double v29 = (double)arc4random_uniform(0x1E8481u) + -1000000.0;
    double v30 = (double)arc4random_uniform(0x1E8481u) + -1000000.0;
    uint32_t v31 = arc4random_uniform(0x1E8481u);
    uint64_t v32 = 0;
    float v33 = v29;
    float v34 = v30;
    float v35 = (double)v31 + -1000000.0;
    float v48 = v33;
    float v49 = v34;
    float v50 = v35;
    float v36 = 0.0;
    do
    {
      float v36 = v36 + (float)(*(float *)((char *)&v48 + v32) * *(float *)((char *)&v48 + v32));
      v32 += 4;
    }
    while (v32 != 12);
    float v37 = sqrtf(v36);
    float v38 = v33 / v37;
    float v39 = v34 / v37;
    float v40 = v35 / v37;
    float v41 = (float)((float)arc4random_uniform(0x8CA0u) / 100.0) * 0.017453;
    float v48 = v38 * v41;
    float v49 = v39 * v41;
    float v50 = v40 * v41;
    sub_1904CF7FC(buf, &v48);
    double v28 = buf[0].f32[0];
    double v27 = buf[0].f32[1];
    double v26 = buf[0].f32[2];
    double v25 = buf[0].f32[3];
    goto LABEL_17;
  }
  double v25 = 1.0;
  double v26 = 0.0;
  double v27 = 0.0;
  double v28 = 0.0;
  if (v21) {
    goto LABEL_14;
  }
LABEL_17:
  if (v23 == 2 || v24 == 0) {
    int v43 = 113;
  }
  else {
    int v43 = 114;
  }
  v44 = [CMPose alloc];
  *(double *)v47 = v25;
  *(double *)&v47[1] = v28;
  *(double *)&v47[2] = v27;
  *(double *)&v47[3] = v26;
  memset(&v47[4], 0, 24);
  *(double *)&v47[7] = (double)v11 * 0.000001;
  *(double *)&v47[8] = timestamp;
  *(double *)&v47[9] = v16;
  *a4 = (id)objc_msgSend_initWithPose_timestamp_(v44, v45, (uint64_t)v47, (double)var1);
  return v43;
}

- (BOOL)_disallowOpportunisticAnchorTrackingForFTClients:(int)a3 clientMode:(int)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  BOOL v4 = a3 == 1 && (a4 & 0xFFFFFFFE) == 2;
  BOOL v5 = v4;
  if (v4)
  {
    self->_scheme = 0;
    value = self->_headTrackingService.__ptr_.__value_;
    if (value) {
      sub_1904F8B2C(value, 0);
    }
    if (qword_1E929D8D8 != -1) {
      dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
    }
    float v7 = qword_1E929D8E0;
    if (os_log_type_enabled((os_log_t)qword_1E929D8E0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1902AF000, v7, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] Disallow opportunisticAnchor tracking for FT clients.", buf, 2u);
    }
    if (sub_1902D8400(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D8D8 != -1) {
        dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
      }
      float v9 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "-[CMMediaSession _disallowOpportunisticAnchorTrackingForFTClients:clientMode:]", "CoreLocation: %s\n", v9);
      if (v9 != (char *)buf) {
        free(v9);
      }
    }
  }
  return v5;
}

- (void)_setTrackingSchemeInternal:(int)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (self->_scheme != a3
    && (objc_msgSend__disallowOpportunisticAnchorTrackingForFTClients_clientMode_(self, a2, *(uint64_t *)&a3, self->_analyticsClientMode) & 1) == 0)
  {
    if (qword_1E929D8D8 != -1) {
      dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
    }
    BOOL v5 = qword_1E929D8E0;
    if (os_log_type_enabled((os_log_t)qword_1E929D8E0, OS_LOG_TYPE_DEFAULT))
    {
      int scheme = self->_scheme;
      *(_DWORD *)buf = 67240448;
      int v13 = scheme;
      __int16 v14 = 1026;
      int v15 = a3;
      _os_log_impl(&dword_1902AF000, v5, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] Tracking scheme changed - old: %{public}d new: %{public}d", buf, 0xEu);
    }
    if (sub_1902D8400(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D8D8 != -1) {
        dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
      }
      uint64_t v11 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "-[CMMediaSession _setTrackingSchemeInternal:]", "CoreLocation: %s\n", v11);
      if (v11 != (char *)buf) {
        free(v11);
      }
    }
    switch(a3)
    {
      case 0:
        self->_int scheme = 0;
        break;
      case 1:
        int v9 = 1;
        goto LABEL_22;
      case 2:
        int v9 = 2;
        goto LABEL_22;
      case 3:
        int v9 = 3;
LABEL_22:
        self->_int scheme = v9;
        break;
      default:
        if (qword_1E929D8D8 != -1) {
          dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
        }
        float v7 = qword_1E929D8E0;
        if (os_log_type_enabled((os_log_t)qword_1E929D8E0, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67240192;
          int v13 = a3;
          _os_log_impl(&dword_1902AF000, v7, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] Invalid input scheme %{public}d", buf, 8u);
        }
        if (sub_1902D8400(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1E929D8D8 != -1) {
            dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
          }
          float v8 = (char *)_os_log_send_and_compose_impl();
          sub_1902D398C("Generic", 1, 0, 2, "-[CMMediaSession _setTrackingSchemeInternal:]", "CoreLocation: %s\n", v8);
          if (v8 != (char *)buf) {
            free(v8);
          }
        }
        break;
    }
    value = self->_headTrackingService.__ptr_.__value_;
    if (value) {
      sub_1904F8B2C(value, self->_scheme);
    }
  }
}

- (CMMediaSession)init
{
  return (CMMediaSession *)MEMORY[0x1F4181798](self, sel__initWithOptions_, 0);
}

- (int)_mapCMMediaSessionClientModeToRelDMClientMode:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) < 4) {
    return a3;
  }
  else {
    return 0;
  }
}

- (void)_readFrontCameraToDisplayCenterOffset
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  *(void *)self->_offsetFromDisplayCenterToFrontCameraInSourceFrameMeters.elements = 0;
  self->_offsetFromDisplayCenterToFrontCameraInSourceFrameMeters.elements[2] = 0.0;
  uint64_t v3 = (void *)MGCopyAnswer();
  if (!v3)
  {
    if (qword_1E929D8D8 != -1) {
      dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
    }
    float v8 = qword_1E929D8E0;
    if (os_log_type_enabled((os_log_t)qword_1E929D8E0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1902AF000, v8, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] Anchor offset from display center is not available. Defaulting to zero.", buf, 2u);
    }
    if (!sub_1902D8400(115, 2)) {
      return;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1E929D8D8 == -1)
    {
LABEL_26:
      float v7 = (uint8_t *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "-[CMMediaSession _readFrontCameraToDisplayCenterOffset]", "CoreLocation: %s\n");
LABEL_27:
      if (v7 != buf) {
        free(v7);
      }
      return;
    }
LABEL_29:
    dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
    goto LABEL_26;
  }
  BOOL v4 = v3;
  CFTypeID v5 = CFGetTypeID(v3);
  if (v5 == CFArrayGetTypeID() && CFArrayGetCount((CFArrayRef)v4) > 1)
  {
    id v9 = v4;
    uint64_t v11 = objc_msgSend_objectAtIndexedSubscript_(v9, v10, 0);
    objc_msgSend_floatValue(v11, v12, v13);
    float v15 = v14 * 0.001;
    v17 = objc_msgSend_objectAtIndexedSubscript_(v9, v16, 1);
    objc_msgSend_floatValue(v17, v18, v19);
    self->_offsetFromDisplayCenterToFrontCameraInSourceFrameMeters.elements[0] = v20 * 0.001;
    self->_offsetFromDisplayCenterToFrontCameraInSourceFrameMeters.elements[1] = v15;
    if (qword_1E929D8D8 != -1) {
      dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
    }
    int v21 = qword_1E929D8E0;
    if (os_log_type_enabled((os_log_t)qword_1E929D8E0, OS_LOG_TYPE_DEFAULT))
    {
      double v22 = (float)(self->_offsetFromDisplayCenterToFrontCameraInSourceFrameMeters.elements[0] * 1000.0);
      double v23 = (float)(self->_offsetFromDisplayCenterToFrontCameraInSourceFrameMeters.elements[1] * 1000.0);
      double v24 = (float)(self->_offsetFromDisplayCenterToFrontCameraInSourceFrameMeters.elements[2] * 1000.0);
      *(_DWORD *)buf = 134349568;
      double v26 = v22;
      __int16 v27 = 2050;
      double v28 = v23;
      __int16 v29 = 2050;
      double v30 = v24;
      _os_log_impl(&dword_1902AF000, v21, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] Anchor offset from display center x: %{public}.1f mm, y: %{public}.1f mm, z: %{public}.1f mm", buf, 0x20u);
    }
    if (!sub_1902D8400(115, 2)) {
      return;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1E929D8D8 == -1) {
      goto LABEL_26;
    }
    goto LABEL_29;
  }
  CFRelease(v4);
  if (qword_1E929D8D8 != -1) {
    dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
  }
  v6 = qword_1E929D8E0;
  if (os_log_type_enabled((os_log_t)qword_1E929D8E0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1902AF000, v6, OS_LOG_TYPE_ERROR, "[CMMediaSession] Anchor offset from display center data has wrong type. Defaulting to zero.", buf, 2u);
  }
  if (sub_1902D8400(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929D8D8 != -1) {
      dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
    }
    float v7 = (uint8_t *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 0, "-[CMMediaSession _readFrontCameraToDisplayCenterOffset]", "CoreLocation: %s\n");
    goto LABEL_27;
  }
}

- (id)_initWithOptions:(id)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  v53.receiver = self;
  v53.super_class = (Class)CMMediaSession;
  CFTypeID v5 = [(CMMediaSession *)&v53 init];
  v6 = v5;
  if (v5)
  {
    v5->_started = 0;
    v5->_int scheme = 0;
    v5->_prevAmbienceBedRoll = 0.0;
    v5->_lastSourceTimestampMicroSeconds = 0;
    v5->_lastStateTimestamp = 0;
    v5->_lastAccessoryTimestamp = 0;
    v5->_predictionIntervalMicroseconds = 100000;
    v5->_trackingEstimatesStagnated = 0;
    v5->_lastTimesyncLostTime = 0.0;
    v5->_lidAngle = -1.0;
    *(void *)&v5->_displayCount = 0x1FFFFFFFFLL;
    v5->_clientMode = 0;
    v5->_analyticsClientMode = 0;
    *(void *)&v5->_schemePrev = 0;
    v5->_bypassWalkingAwayDistractedViewing = 0;
    if (qword_1E929D8D8 != -1) {
      dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
    }
    float v7 = qword_1E929D8E0;
    if (os_log_type_enabled((os_log_t)qword_1E929D8E0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      *(void *)&uint8_t buf[4] = a3;
      _os_log_impl(&dword_1902AF000, v7, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] Creating CMMediaSession with options: %{private}@", buf, 0xCu);
    }
    if (sub_1902D8400(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D8D8 != -1) {
        dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
      }
      int v54 = 138477827;
      id v55 = a3;
      float v48 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "-[CMMediaSession _initWithOptions:]", "CoreLocation: %s\n", v48);
      if (v48 != (char *)buf) {
        free(v48);
      }
    }
    if (a3)
    {
      if (objc_msgSend_valueForKey_(a3, v8, @"CMMediaSessionClientMode"))
      {
        uint64_t v11 = objc_msgSend_objectForKeyedSubscript_(a3, v10, @"CMMediaSessionClientMode");
        int v14 = objc_msgSend_intValue(v11, v12, v13);
        int v16 = objc_msgSend__mapCMMediaSessionClientModeToRelDMClientMode_(v6, v15, v14);
        v6->_analyticsClientMode = v16;
        v6->_clientMode = v16;
      }
      if (objc_msgSend_valueForKey_(a3, v10, @"AlwaysOnAnchor"))
      {
        int v18 = objc_msgSend_objectForKeyedSubscript_(a3, v17, @"AlwaysOnAnchor");
        if (objc_msgSend_BOOLValue(v18, v19, v20)) {
          v6->_int scheme = 2;
        }
      }
      if (objc_msgSend_valueForKey_(a3, v17, @"OpportunisticAnchor"))
      {
        double v22 = objc_msgSend_objectForKeyedSubscript_(a3, v21, @"OpportunisticAnchor");
        if (objc_msgSend_BOOLValue(v22, v23, v24)) {
          v6->_int scheme = 1;
        }
      }
      if (objc_msgSend_valueForKey_(a3, v21, @"TrackingScheme"))
      {
        double v26 = objc_msgSend_objectForKeyedSubscript_(a3, v25, @"TrackingScheme");
        if (objc_msgSend_intValue(v26, v27, v28))
        {
          __int16 v29 = objc_msgSend_objectForKeyedSubscript_(a3, v25, @"TrackingScheme");
          unsigned int v32 = objc_msgSend_intValue(v29, v30, v31);
          if (v32 <= 3) {
            v6->_int scheme = v32;
          }
        }
      }
      if (objc_msgSend_valueForKey_(a3, v25, @"AnchorRateHz"))
      {
        float v34 = objc_msgSend_objectForKeyedSubscript_(a3, v33, @"AnchorRateHz");
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          float v49 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v35, v36);
          objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v49, v50, (uint64_t)a2, v6, @"CMMediaSession.mm", 613, @"Invalid parameter not satisfying: %@", @"[AnchorRateHzValue isKindOfClass:[NSNumber class]]");
        }
        objc_msgSend_floatValue(v34, v35, v36);
        v6->_anchorUpdateIntervalUs = (unint64_t)(1000000.0 / v37);
      }
      if (objc_msgSend_valueForKey_(a3, v33, @"PredictionIntervalMicroseconds"))
      {
        float v39 = objc_msgSend_objectForKeyedSubscript_(a3, v38, @"PredictionIntervalMicroseconds");
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v51 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v40, v41);
          objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v51, v52, (uint64_t)a2, v6, @"CMMediaSession.mm", 619, @"Invalid parameter not satisfying: %@", @"[predictionIntervalMicrosecondsValue isKindOfClass:[NSNumber class]]");
        }
        v6->_predictionIntervalMicroseconds = objc_msgSend_unsignedLongLongValue(v39, v40, v41);
      }
      if (objc_msgSend_valueForKey_(a3, v38, @"OnlineHeadToHeadsetTransformationEstimator"))
      {
        v42 = objc_msgSend_objectForKeyedSubscript_(a3, v8, @"OnlineHeadToHeadsetTransformationEstimator");
        if (objc_msgSend_BOOLValue(v42, v43, v44)) {
          v6->_useHeadToHeadsetTransformationEstimator = 1;
        }
      }
    }
    v6->_previousBTZState = -1;
    v6->_previousMotionActivityType = 0;
    v6->_previousTracking1IMU = -1;
    if ((objc_msgSend_isActivityAvailable(CMMotionActivityManager, v8, v9) & 1) != 0
      || objc_msgSend_isActivityLiteAvailable(CMMotionActivityManager, v45, v46))
    {
      v6->_activityManager = (CMMotionActivityManager *)objc_opt_new();
      v6->_activityQueue = (NSOperationQueue *)objc_opt_new();
    }
    else
    {
      *(_OWORD *)&v6->_activityManager = 0u;
    }
    operator new();
  }
  return 0;
}

- (void)_reset
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  sub_1904F86F0((uint64_t)self->_headTrackingService.__ptr_.__value_, 1);
}

- (void)dealloc
{
  if (self->_started) {
    objc_msgSend__stop(self, a2, v2);
  }
  objc_msgSend__disableLoggingForReplay(self, a2, v2);

  v4.receiver = self;
  v4.super_class = (Class)CMMediaSession;
  [(CMMediaSession *)&v4 dealloc];
}

- (BOOL)_start
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  objc_sync_enter(self);
  BOOL started = self->_started;
  if (!self->_started)
  {
    self->_BOOL started = 1;
    objc_sync_exit(self);
    operator new();
  }
  if (qword_1E929D8D8 != -1) {
    dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
  }
  objc_super v4 = qword_1E929D8E0;
  if (os_log_type_enabled((os_log_t)qword_1E929D8E0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1902AF000, v4, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] _start is called multiple times", buf, 2u);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929D8D8 != -1) {
      dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
    }
    v6 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CMMediaSession _start]", "CoreLocation: %s\n", v6);
    if (v6 != (char *)buf) {
      free(v6);
    }
  }
  objc_sync_exit(self);
  return !started;
}

- (void)_startHeadTracking
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if (!self->_analyticsTracker.__ptr_.__value_) {
    operator new();
  }
  uint64_t v3 = mach_continuous_time();
  self->_double sessionStartTime = sub_1902D8D34(v3);
  sub_19050B3B0((double *)self->_analyticsTracker.__ptr_.__value_, @"sessionDuration");
  sub_19050B3B0((double *)self->_analyticsTracker.__ptr_.__value_ + 30, @"auxAndSrcQuiescent");
  double sessionStartTime = self->_sessionStartTime;
  self->_lastInBTZTime = sessionStartTime;
  self->_lastAccessoryDMTime = sessionStartTime;
  self->_previousTrackingEnabled = 1;
  self->_lastDistractedViewingStartTime = 0.0;
  value = self->_analyticsTracker.__ptr_.__value_;
  if (value) {
    *((_DWORD *)value + 375) = self->_analyticsClientMode;
  }
  if (sub_1902B35C0() && !self->_disable2IMU && !self->_deviceMotionDispatcher)
  {
    if (qword_1E929D8D8 != -1) {
      dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
    }
    v6 = qword_1E929D8E0;
    if (os_log_type_enabled((os_log_t)qword_1E929D8E0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1902AF000, v6, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] Starting source DM", buf, 2u);
    }
    if (sub_1902D8400(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D8D8 != -1) {
        dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
      }
      __int16 v39 = 0;
      float v37 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "-[CMMediaSession _startHeadTracking]", "CoreLocation: %s\n", v37);
      if (v37 != (char *)buf) {
        free(v37);
      }
    }
    float v7 = [CLDeviceMotionProperties alloc];
    objc_msgSend_initWithMode_(v7, v8, 3);
    operator new();
  }
  if (!self->_accessoryDeviceMotionDispatcher)
  {
    *(unsigned char *)(sub_1905298B4() + 28) = 1;
    *(_DWORD *)(sub_1905298B4() + 384) = self->_analyticsClientMode;
    operator new();
  }
  sub_19050B3B0((double *)self->_analyticsTracker.__ptr_.__value_ + 42, @"durationOfSessionHeadtracked");
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = sub_1904AB294;
  v38[3] = &unk_1E568E078;
  v38[4] = self;
  if (objc_msgSend_isActivityAvailable(CMMotionActivityManager, v9, v10)
    && !self->_disable2IMU)
  {
    if (qword_1E929D8D8 != -1) {
      dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
    }
    v17 = qword_1E929D8E0;
    if (os_log_type_enabled((os_log_t)qword_1E929D8E0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1902AF000, v17, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] Starting Motion Activity updates", buf, 2u);
    }
    if (sub_1902D8400(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D8D8 != -1) {
        dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
      }
      __int16 v39 = 0;
      float v35 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "-[CMMediaSession _startHeadTracking]", "CoreLocation: %s\n", v35);
      if (v35 != (char *)buf) {
        free(v35);
      }
    }
    objc_msgSend_startActivityUpdatesToQueue_withHandler_(self->_activityManager, v18, (uint64_t)self->_activityQueue, v38);
  }
  else if (objc_msgSend_isActivityLiteAvailable(CMMotionActivityManager, v11, v12) {
         && !self->_disable2IMU)
  }
  {
    if (qword_1E929D8D8 != -1) {
      dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
    }
    uint64_t v19 = qword_1E929D8E0;
    if (os_log_type_enabled((os_log_t)qword_1E929D8E0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1902AF000, v19, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] Starting Motion Activity Lite updates", buf, 2u);
    }
    if (sub_1902D8400(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D8D8 != -1) {
        dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
      }
      __int16 v39 = 0;
      uint64_t v36 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "-[CMMediaSession _startHeadTracking]", "CoreLocation: %s\n", v36);
      if (v36 != (char *)buf) {
        free(v36);
      }
    }
    objc_msgSend_startActivityLiteUpdatesToQueue_withHandler_(self->_activityManager, v20, (uint64_t)self->_activityQueue, v38);
  }
  else
  {
    if (qword_1E929D8D8 != -1) {
      dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
    }
    uint64_t v13 = qword_1E929D8E0;
    if (os_log_type_enabled((os_log_t)qword_1E929D8E0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1902AF000, v13, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] Motion Activity or Activity Lite updates are not available", buf, 2u);
    }
    if (sub_1902D8400(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D8D8 != -1) {
        dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
      }
      __int16 v39 = 0;
      int v16 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "-[CMMediaSession _startHeadTracking]", "CoreLocation: %s\n", v16);
      if (v16 != (char *)buf) {
        free(v16);
      }
    }
  }
  mcSession = self->_mcSession;
  if (mcSession) {
    goto LABEL_42;
  }
  if (self->_motionContextSessonEnabled)
  {
    id v23 = (id)objc_opt_new();
    uint64_t v25 = objc_msgSend_numberWithBool_(NSNumber, v24, self->_logForReplay);
    objc_msgSend_setObject_forKeyedSubscript_(v23, v26, v25, @"kCMMotionContextSessionLogMSL");
    if (self->_logForReplay)
    {
      uint64_t v29 = objc_msgSend_mcLogPath(self, v27, v28);
      objc_msgSend_setObject_forKeyedSubscript_(v23, v30, v29, @"kCMMotionContextSessionMSLFilePath");
    }
    uint64_t v31 = objc_msgSend_numberWithBool_(NSNumber, v27, self->_humanMotionLearningModelEnabled);
    objc_msgSend_setObject_forKeyedSubscript_(v23, v32, v31, @"kCMMotionContextSessionUseMLModel");
    float v33 = [CMMotionContextSession alloc];
    mcSession = (CMMotionContextSession *)objc_msgSend_initWithOptions_(v33, v34, (uint64_t)v23);
    self->_mcSession = mcSession;
    if (mcSession)
    {
LABEL_42:
      objc_msgSend_start(mcSession, v14, v15);
      objc_msgSend_setTrackingClientMode_(self->_mcSession, v22, *(_DWORD *)self->_headTrackingService.__ptr_.__value_);
    }
  }
}

- (void)_triggerUserInteractedWithDeviceEvent
{
  uint64_t v3 = sub_1902D6BD0();
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_1904AB744;
  v4[3] = &unk_1E568D118;
  v4[4] = self;
  sub_1902CDE98(v3, (uint64_t)v4);
}

- (BOOL)_startPoseUpdatesToQueue:(id)a3 andHandler:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (qword_1E929D8D8 != -1) {
    dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
  }
  float v7 = qword_1E929D8E0;
  if (os_log_type_enabled((os_log_t)qword_1E929D8E0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1902AF000, v7, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] Starting push updates", buf, 2u);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929D8D8 != -1) {
      dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
    }
    uint64_t v11 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CMMediaSession _startPoseUpdatesToQueue:andHandler:]", "CoreLocation: %s\n", v11);
    if (v11 != (char *)buf) {
      free(v11);
    }
  }
  if (!a3)
  {
    if (qword_1E929D8D8 != -1) {
      dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
    }
    uint64_t v12 = qword_1E929D8E0;
    if (os_log_type_enabled((os_log_t)qword_1E929D8E0, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      int v19 = 0;
      __int16 v20 = 2082;
      int v21 = "";
      __int16 v22 = 2082;
      id v23 = "assert";
      __int16 v24 = 2081;
      uint64_t v25 = "queue";
      _os_log_impl(&dword_1902AF000, v12, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"[CMMediaSession] client queue is nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1E929D8D8 != -1) {
        dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
      }
    }
    uint64_t v13 = qword_1E929D8E0;
    if (os_signpost_enabled((os_log_t)qword_1E929D8E0))
    {
      *(_DWORD *)buf = 68289539;
      int v19 = 0;
      __int16 v20 = 2082;
      int v21 = "";
      __int16 v22 = 2082;
      id v23 = "assert";
      __int16 v24 = 2081;
      uint64_t v25 = "queue";
      _os_signpost_emit_with_name_impl(&dword_1902AF000, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "[CMMediaSession] client queue is nil", "{\"msg%{public}.0s\":\"[CMMediaSession] client queue is nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1E929D8D8 != -1) {
        dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
      }
    }
    int v14 = qword_1E929D8E0;
    if (os_log_type_enabled((os_log_t)qword_1E929D8E0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      int v19 = 0;
      __int16 v20 = 2082;
      int v21 = "";
      __int16 v22 = 2082;
      id v23 = "assert";
      __int16 v24 = 2081;
      uint64_t v25 = "queue";
      _os_log_impl(&dword_1902AF000, v14, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"[CMMediaSession] client queue is nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
LABEL_34:
    abort_report_np();
  }
  if (!a4)
  {
    if (qword_1E929D8D8 != -1) {
      dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
    }
    uint64_t v15 = qword_1E929D8E0;
    if (os_log_type_enabled((os_log_t)qword_1E929D8E0, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      int v19 = 0;
      __int16 v20 = 2082;
      int v21 = "";
      __int16 v22 = 2082;
      id v23 = "assert";
      __int16 v24 = 2081;
      uint64_t v25 = "handler";
      _os_log_impl(&dword_1902AF000, v15, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"[CMMediaSession] client handler is nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1E929D8D8 != -1) {
        dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
      }
    }
    int v16 = qword_1E929D8E0;
    if (os_signpost_enabled((os_log_t)qword_1E929D8E0))
    {
      *(_DWORD *)buf = 68289539;
      int v19 = 0;
      __int16 v20 = 2082;
      int v21 = "";
      __int16 v22 = 2082;
      id v23 = "assert";
      __int16 v24 = 2081;
      uint64_t v25 = "handler";
      _os_signpost_emit_with_name_impl(&dword_1902AF000, v16, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "[CMMediaSession] client handler is nil", "{\"msg%{public}.0s\":\"[CMMediaSession] client handler is nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1E929D8D8 != -1) {
        dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
      }
    }
    v17 = qword_1E929D8E0;
    if (os_log_type_enabled((os_log_t)qword_1E929D8E0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      int v19 = 0;
      __int16 v20 = 2082;
      int v21 = "";
      __int16 v22 = 2082;
      id v23 = "assert";
      __int16 v24 = 2081;
      uint64_t v25 = "handler";
      _os_log_impl(&dword_1902AF000, v17, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"[CMMediaSession] client handler is nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    goto LABEL_34;
  }
  self->_clientQueue = (OS_dispatch_queue *)a3;
  dispatch_retain((dispatch_object_t)a3);
  self->_clientHandler = _Block_copy(a4);
  return objc_msgSend__start(self, v8, v9);
}

- (void)_stopHeadTracking
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = mach_continuous_time();
  double v4 = sub_1902D8D34(v3);
  value = self->_analyticsTracker.__ptr_.__value_;
  if (value)
  {
    v6 = (char *)self->_headTrackingService.__ptr_.__value_ + 16040;
    if (!*v6 && *((double *)value + 3) > 0.0)
    {
      double v7 = v4 - self->_lastInBTZTime;
      double v9 = *((double *)value + 58);
      double v8 = *((double *)value + 59);
      if (v8 <= v7) {
        double v8 = v4 - self->_lastInBTZTime;
      }
      if (v9 >= v7) {
        double v9 = v4 - self->_lastInBTZTime;
      }
      *((double *)value + 58) = v9;
      *((double *)value + 59) = v8;
      *((double *)value + 60) = v7 + *((double *)value + 60);
      ++*((_DWORD *)value + 122);
    }
    double v10 = v4 - self->_lastAccessoryDMTime;
    double v12 = *((double *)value + 54);
    double v11 = *((double *)value + 55);
    if (v11 <= v10) {
      double v11 = v4 - self->_lastAccessoryDMTime;
    }
    if (v12 >= v10) {
      double v12 = v4 - self->_lastAccessoryDMTime;
    }
    *((double *)value + 54) = v12;
    *((double *)value + 55) = v11;
    *((double *)value + 56) = v10 + *((double *)value + 56);
    ++*((_DWORD *)value + 114);
    if (!self->_previousTrackingEnabled && v6[18])
    {
      double v45 = v4 - self->_lastDistractedViewingStartTime;
      double v46 = *((double *)value + 79);
      if (v46 <= v45) {
        double v46 = v45;
      }
      *((double *)value + 79) = v46;
      double v47 = *((double *)value + 78);
      if (v47 >= v45) {
        double v47 = v45;
      }
      *((double *)value + 78) = v47;
      *((double *)value + 80) = v45 + *((double *)value + 80);
      ++*((_DWORD *)value + 162);
      int v48 = *((_DWORD *)value + 313);
      if (v48 != -1) {
        *((_DWORD *)value + 313) = v48 + 1;
      }
    }
    sub_19050B590((double *)value, @"sessionDuration");
    uint64_t v13 = self->_analyticsTracker.__ptr_.__value_;
    if (*((double *)v13 + 24) > 0.0)
    {
      sub_19050B590((double *)v13 + 24, &stru_1EDFD5D50);
      uint64_t v13 = self->_analyticsTracker.__ptr_.__value_;
    }
    if (*((double *)v13 + 26) > 0.0)
    {
      sub_19050B590((double *)v13 + 26, &stru_1EDFD5D50);
      uint64_t v13 = self->_analyticsTracker.__ptr_.__value_;
    }
    if (*((double *)v13 + 28) > 0.0)
    {
      sub_19050B590((double *)v13 + 28, &stru_1EDFD5D50);
      uint64_t v13 = self->_analyticsTracker.__ptr_.__value_;
    }
    if (*((double *)v13 + 30) > 0.0)
    {
      sub_19050B590((double *)v13 + 30, &stru_1EDFD5D50);
      uint64_t v13 = self->_analyticsTracker.__ptr_.__value_;
    }
    if (*((double *)v13 + 34) > 0.0)
    {
      sub_19050B590((double *)v13 + 34, &stru_1EDFD5D50);
      uint64_t v13 = self->_analyticsTracker.__ptr_.__value_;
    }
    if (*((double *)v13 + 36) > 0.0)
    {
      sub_19050B590((double *)v13 + 36, &stru_1EDFD5D50);
      uint64_t v13 = self->_analyticsTracker.__ptr_.__value_;
    }
    int v14 = (_OWORD *)((char *)self->_headTrackingService.__ptr_.__value_ + 37416);
    *(_OWORD *)((char *)v13 + 1432) = *v14;
    *(_OWORD *)((char *)v13 + 1448) = v14[1];
    if (self->_firstAccessoryDMTime == 0.0)
    {
      if (qword_1E929D8D8 != -1) {
        dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
      }
      uint64_t v15 = qword_1E929D8E0;
      if (os_log_type_enabled((os_log_t)qword_1E929D8E0, OS_LOG_TYPE_ERROR))
      {
        uint64_t v16 = *((void *)self->_analyticsTracker.__ptr_.__value_ + 1);
        *(_DWORD *)buf = 134217984;
        uint64_t v53 = v16;
        _os_log_impl(&dword_1902AF000, v15, OS_LOG_TYPE_ERROR, "[CMMediaSession] No accessory DM received during entire session of %.3f seconds", buf, 0xCu);
      }
      if (sub_1902D8400(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1E929D8D8 != -1) {
          dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
        }
        float v49 = (char *)_os_log_send_and_compose_impl();
        sub_1902D398C("Generic", 1, 0, 0, "-[CMMediaSession _stopHeadTracking]", "CoreLocation: %s\n", v49);
        if (v49 != (char *)buf) {
          free(v49);
        }
      }
      uint64_t v13 = self->_analyticsTracker.__ptr_.__value_;
      *((void *)v13 + 176) = *((void *)v13 + 1);
    }
    if (self->_firstValidPoseTime == 0.0)
    {
      if (qword_1E929D8D8 != -1) {
        dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
      }
      v17 = qword_1E929D8E0;
      if (os_log_type_enabled((os_log_t)qword_1E929D8E0, OS_LOG_TYPE_ERROR))
      {
        uint64_t v18 = *((void *)self->_analyticsTracker.__ptr_.__value_ + 1);
        *(_DWORD *)buf = 134217984;
        uint64_t v53 = v18;
        _os_log_impl(&dword_1902AF000, v17, OS_LOG_TYPE_ERROR, "[CMMediaSession] No valid pose available during entire session of %.3f seconds", buf, 0xCu);
      }
      if (sub_1902D8400(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1E929D8D8 != -1) {
          dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
        }
        float v50 = (char *)_os_log_send_and_compose_impl();
        sub_1902D398C("Generic", 1, 0, 0, "-[CMMediaSession _stopHeadTracking]", "CoreLocation: %s\n", v50);
        if (v50 != (char *)buf) {
          free(v50);
        }
      }
      uint64_t v13 = self->_analyticsTracker.__ptr_.__value_;
      *((void *)v13 + 177) = *((void *)v13 + 1);
    }
    uint64_t v19 = *((void *)self->_headTrackingService.__ptr_.__value_ + 4686);
    *((void *)v13 + 164) = *(void *)(v19 + 128);
    long long v20 = *(_OWORD *)(v19 + 136);
    *(_OWORD *)((char *)v13 + 828) = *(_OWORD *)(v19 + 148);
    *((_OWORD *)v13 + 51) = v20;
    uint64_t v21 = *((void *)self->_headTrackingService.__ptr_.__value_ + 4686);
    __int16 v22 = (_OWORD *)((char *)self->_analyticsTracker.__ptr_.__value_ + 848);
    long long v23 = *(_OWORD *)(v21 + 168);
    *(_OWORD *)((char *)v22 + 12) = *(_OWORD *)(v21 + 180);
    *__int16 v22 = v23;
    uint64_t v24 = *((void *)self->_headTrackingService.__ptr_.__value_ + 4686);
    uint64_t v25 = (_OWORD *)((char *)self->_analyticsTracker.__ptr_.__value_ + 880);
    long long v26 = *(_OWORD *)(v24 + 200);
    *(_OWORD *)((char *)v25 + 12) = *(_OWORD *)(v24 + 212);
    *uint64_t v25 = v26;
    uint64_t v27 = *((void *)self->_headTrackingService.__ptr_.__value_ + 4686);
    uint64_t v28 = (_OWORD *)((char *)self->_analyticsTracker.__ptr_.__value_ + 912);
    long long v29 = *(_OWORD *)(v27 + 232);
    *(_OWORD *)((char *)v28 + 12) = *(_OWORD *)(v27 + 244);
    *uint64_t v28 = v29;
    double v30 = (_OWORD *)((char *)self->_analyticsTracker.__ptr_.__value_ + 944);
    long long v31 = *(_OWORD *)(*((void *)self->_headTrackingService.__ptr_.__value_ + 4686) + 264);
    *(_OWORD *)((char *)v30 + 12) = *(_OWORD *)(*((void *)self->_headTrackingService.__ptr_.__value_ + 4686) + 276);
    *double v30 = v31;
    unsigned int v32 = self->_analyticsTracker.__ptr_.__value_;
    long long v33 = *(_OWORD *)(*((void *)self->_headTrackingService.__ptr_.__value_ + 4686) + 360);
    *((_OWORD *)v32 + 86) = *(_OWORD *)(*((void *)self->_headTrackingService.__ptr_.__value_ + 4686) + 376);
    *((_OWORD *)v32 + 85) = v33;
    sub_19043C400((uint64_t)self->_analyticsTracker.__ptr_.__value_);
  }
  else
  {
    if (qword_1E929D8D8 != -1) {
      dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
    }
    float v34 = qword_1E929D8E0;
    if (os_log_type_enabled((os_log_t)qword_1E929D8E0, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1902AF000, v34, OS_LOG_TYPE_ERROR, "Calling _stop and analytics tracker hasn't been created. Called without _start?", buf, 2u);
    }
    if (sub_1902D8400(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D8D8 != -1) {
        dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
      }
      v51 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 0, "-[CMMediaSession _stopHeadTracking]", "CoreLocation: %s\n", v51);
      if (v51 != (char *)buf) {
        free(v51);
      }
    }
  }
  objc_sync_enter(self);
  float v35 = self->_analyticsTracker.__ptr_.__value_;
  self->_analyticsTracker.__ptr_.__value_ = 0;
  if (v35) {
    sub_1904B715C(v35);
  }
  objc_sync_exit(self);
  activityManager = self->_activityManager;
  if (activityManager) {
    objc_msgSend_stopActivityUpdates(activityManager, v36, v37);
  }
  if (self->_deviceMotionDispatcher)
  {
    uint64_t v39 = sub_1902B35C0();
    sub_1902E02F4(v39, (uint64_t)self->_deviceMotionDispatcher);
    deviceMotionDispatcher = self->_deviceMotionDispatcher;
    if (deviceMotionDispatcher) {
      (*((void (**)(Dispatcher *))deviceMotionDispatcher->var0 + 1))(deviceMotionDispatcher);
    }
    self->_deviceMotionDispatcher = 0;
  }
  if (self->_accessoryDeviceMotionDispatcher)
  {
    uint64_t v41 = sub_1905298B4();
    sub_1902CDE08(v41, 0, (uint64_t)self->_accessoryDeviceMotionDispatcher);
    accessoryDeviceMotionDispatcher = self->_accessoryDeviceMotionDispatcher;
    if (accessoryDeviceMotionDispatcher) {
      (*((void (**)(Dispatcher *))accessoryDeviceMotionDispatcher->var0 + 1))(accessoryDeviceMotionDispatcher);
    }
    self->_accessoryDeviceMotionDispatcher = 0;
    int v43 = self->_headTrackingService.__ptr_.__value_;
    if (v43) {
      sub_1904F86F0((uint64_t)v43, 1);
    }
    sub_1904AC5B0((uint64_t)&self->_unsyncedAuxHelper, 1);
  }
  mcSession = self->_mcSession;
  if (mcSession) {
    objc_msgSend_stop(mcSession, v36, v37);
  }
}

- (void)_stop
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  objc_sync_enter(self);
  if (self->_started)
  {
    self->_BOOL started = 0;
    objc_sync_exit(self);
    if (self->_startedJitterBufferLevelPolling)
    {
      objc_msgSend__stopJitterBufferLevelMonitor(self, v3, v4);
      self->_startedJitterBufferLevelPolling = 0;
    }
    if (self->_accessoryDeviceMotionInEarStatusDispatcher)
    {
      uint64_t v5 = sub_1905298B4();
      sub_1902CDE08(v5, 3, (uint64_t)self->_accessoryDeviceMotionInEarStatusDispatcher);
      accessoryDeviceMotionInEarStatusDispatcher = self->_accessoryDeviceMotionInEarStatusDispatcher;
      if (accessoryDeviceMotionInEarStatusDispatcher) {
        (*((void (**)(Dispatcher *))accessoryDeviceMotionInEarStatusDispatcher->var0 + 1))(accessoryDeviceMotionInEarStatusDispatcher);
      }
      self->_accessoryDeviceMotionInEarStatusDispatcher = 0;
    }
    uint64_t v7 = sub_1902D6BD0();
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = sub_1904ACBDC;
    v16[3] = &unk_1E568D118;
    v16[4] = self;
    sub_1902CDE98(v7, (uint64_t)v16);
    objc_sync_enter(self);
    objc_msgSend__stopDefaultsPreferenceUpdater(self, v8, v9);
    if (self->_clientQueue)
    {
      if (qword_1E929D8D8 != -1) {
        dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
      }
      double v10 = qword_1E929D8E0;
      if (os_log_type_enabled((os_log_t)qword_1E929D8E0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1902AF000, v10, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] Stopping push updates", buf, 2u);
      }
      if (sub_1902D8400(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1E929D8D8 != -1) {
          dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
        }
        __int16 v17 = 0;
        int v14 = (char *)_os_log_send_and_compose_impl();
        sub_1902D398C("Generic", 1, 0, 2, "-[CMMediaSession _stop]", "CoreLocation: %s\n", v14);
        if (v14 != (char *)buf) {
          free(v14);
        }
      }
      dispatch_release((dispatch_object_t)self->_clientQueue);
      self->_clientQueue = 0;
      _Block_release(self->_clientHandler);
      self->_clientHandler = 0;
    }
    objc_sync_exit(self);
    if (self->_accessoryDeviceMotionConfigDispatcher)
    {
      uint64_t v11 = sub_1905298B4();
      sub_1902CDE08(v11, 1, (uint64_t)self->_accessoryDeviceMotionConfigDispatcher);
      accessoryDeviceMotionConfigDispatcher = self->_accessoryDeviceMotionConfigDispatcher;
      if (accessoryDeviceMotionConfigDispatcher) {
        (*((void (**)(Dispatcher *))accessoryDeviceMotionConfigDispatcher->var0 + 1))(accessoryDeviceMotionConfigDispatcher);
      }
      self->_accessoryDeviceMotionConfigDispatcher = 0;
    }
  }
  else
  {
    if (qword_1E929D8D8 != -1) {
      dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
    }
    uint64_t v13 = qword_1E929D8E0;
    if (os_log_type_enabled((os_log_t)qword_1E929D8E0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1902AF000, v13, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] _stop is called multiple times", buf, 2u);
    }
    if (sub_1902D8400(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D8D8 != -1) {
        dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
      }
      __int16 v17 = 0;
      uint64_t v15 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "-[CMMediaSession _stop]", "CoreLocation: %s\n", v15);
      if (v15 != (char *)buf) {
        free(v15);
      }
    }
    objc_sync_exit(self);
  }
}

- (void)_updateMinQuiescentPeriodForBTZ
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  value = self->_motionSettings.__ptr_.__value_;
  *(void *)buf = 0;
  if (sub_1902C5108((uint64_t)value, @"TempestMinQuiescentPeriodForBTZ", buf)) {
    double v4 = *(double *)buf;
  }
  else {
    double v4 = 5.0;
  }
  if (vabdd_f64(v4, self->_minQuiescentPeriodForBTZ) > 0.0001)
  {
    if (qword_1E929D8D8 != -1) {
      dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
    }
    uint64_t v5 = qword_1E929D8E0;
    if (os_log_type_enabled((os_log_t)qword_1E929D8E0, OS_LOG_TYPE_DEFAULT))
    {
      double minQuiescentPeriodForBTZ = self->_minQuiescentPeriodForBTZ;
      *(_DWORD *)buf = 134218240;
      *(double *)&uint8_t buf[4] = v4;
      __int16 v11 = 2048;
      double v12 = minQuiescentPeriodForBTZ;
      _os_log_impl(&dword_1902AF000, v5, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] minQuiescentPeriodForBTZ new: %f old: %f", buf, 0x16u);
    }
    if (sub_1902D8400(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D8D8 != -1) {
        dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
      }
      uint64_t v9 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "-[CMMediaSession _updateMinQuiescentPeriodForBTZ]", "CoreLocation: %s\n", v9);
      if (v9 != buf) {
        free(v9);
      }
    }
    uint64_t v7 = self->_headTrackingService.__ptr_.__value_;
    float v8 = v4;
    *((float *)v7 + 3977) = v8;
    *((float *)v7 + 3976) = v8;
    self->_double minQuiescentPeriodForBTZ = v4;
    if (self->_logForReplay) {
      sub_190458D1C((uint64_t *)self->_logger.__ptr_.__value_, "kRelDmMinQuiescentPeriodForBTZ", v4);
    }
  }
}

- (void)_updateUseFwdPredictionUserSettings
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  value = self->_motionSettings.__ptr_.__value_;
  buf[0] = 0;
  int v4 = sub_1902C486C((uint64_t)value, @"TempestPreferenceFwdPredictorEnabled", (BOOL *)buf) ^ 1;
  if (buf[0]) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = v4;
  }
  if (self->_userSettingFwdPredictorEnabled != v5)
  {
    if (qword_1E929D8D8 != -1) {
      dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
    }
    v6 = qword_1E929D8E0;
    if (os_log_type_enabled((os_log_t)qword_1E929D8E0, OS_LOG_TYPE_DEFAULT))
    {
      BOOL userSettingFwdPredictorEnabled = self->_userSettingFwdPredictorEnabled;
      *(_DWORD *)buf = 67109376;
      BOOL v10 = userSettingFwdPredictorEnabled;
      __int16 v11 = 1024;
      BOOL v12 = v5;
      _os_log_impl(&dword_1902AF000, v6, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] Changed _userSettingFwdPredictorEnabled from %d to %d.", buf, 0xEu);
    }
    if (sub_1902D8400(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D8D8 != -1) {
        dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
      }
      float v8 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "-[CMMediaSession _updateUseFwdPredictionUserSettings]", "CoreLocation: %s\n", v8);
      if (v8 != (char *)buf) {
        free(v8);
      }
    }
    *((unsigned char *)self->_headTrackingService.__ptr_.__value_ + 16060) = v5;
    self->_BOOL userSettingFwdPredictorEnabled = v5;
  }
}

- (void)_updateTrackingSchemeSettings
{
  value = self->_motionSettings.__ptr_.__value_;
  unsigned int v8 = 0;
  int v4 = sub_1902DD914((uint64_t)value, @"TrackingScheme", &v8);
  uint64_t v6 = v8;
  if (v4) {
    BOOL v7 = v8 == 4;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    self->_hasUserDefaultTrackingScheme = 1;
    objc_msgSend__setTrackingSchemeInternal_(self, v5, v6);
  }
}

- (void)_updateAnchorIntervalSettings
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  value = self->_motionSettings.__ptr_.__value_;
  *(void *)buf = 0;
  int v4 = sub_1902C5108((uint64_t)value, @"AnchorRateHz", buf);
  float v5 = *(double *)buf;
  double v6 = 1.0 / v5 * 1000000.0;
  if (v4) {
    unint64_t v7 = (unint64_t)v6;
  }
  else {
    unint64_t v7 = 33333;
  }
  if (self->_anchorUpdateIntervalUs != v7)
  {
    if (qword_1E929D8D8 != -1) {
      dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
    }
    unsigned int v8 = qword_1E929D8E0;
    if (os_log_type_enabled((os_log_t)qword_1E929D8E0, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t anchorUpdateIntervalUs = self->_anchorUpdateIntervalUs;
      *(_DWORD *)buf = 134349312;
      *(void *)&uint8_t buf[4] = v7;
      __int16 v12 = 2050;
      unint64_t v13 = anchorUpdateIntervalUs;
      _os_log_impl(&dword_1902AF000, v8, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] anchorUpdateIntervalUs new: %{public}llu old: %{public}llu", buf, 0x16u);
    }
    if (sub_1902D8400(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D8D8 != -1) {
        dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
      }
      BOOL v10 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "-[CMMediaSession _updateAnchorIntervalSettings]", "CoreLocation: %s\n", v10);
      if (v10 != buf) {
        free(v10);
      }
    }
    self->_unint64_t anchorUpdateIntervalUs = v7;
  }
}

- (void)_updateUseHeadToHeadsetTransformationEstimator
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  value = self->_motionSettings.__ptr_.__value_;
  buf[0] = 0;
  int v4 = sub_1902C486C((uint64_t)value, @"OnlineHeadToHeadsetTransformationEstimator", (BOOL *)buf);
  if (buf[0]) {
    int v5 = v4;
  }
  else {
    int v5 = 0;
  }
  if (self->_useHeadToHeadsetTransformationEstimator != v5)
  {
    if (qword_1E929D8D8 != -1) {
      dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
    }
    double v6 = qword_1E929D8E0;
    if (os_log_type_enabled((os_log_t)qword_1E929D8E0, OS_LOG_TYPE_DEFAULT))
    {
      BOOL useHeadToHeadsetTransformationEstimator = self->_useHeadToHeadsetTransformationEstimator;
      *(_DWORD *)buf = 67240448;
      BOOL v10 = useHeadToHeadsetTransformationEstimator;
      __int16 v11 = 1026;
      int v12 = v5;
      _os_log_impl(&dword_1902AF000, v6, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] Changed _useHeadToHeadsetTransformationEstimator from %{public}d to %{public}d.", buf, 0xEu);
    }
    if (sub_1902D8400(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D8D8 != -1) {
        dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
      }
      unsigned int v8 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "-[CMMediaSession _updateUseHeadToHeadsetTransformationEstimator]", "CoreLocation: %s\n", v8);
      if (v8 != (char *)buf) {
        free(v8);
      }
    }
    sub_1904F8D04((uint64_t)self->_headTrackingService.__ptr_.__value_, v5);
    self->_BOOL useHeadToHeadsetTransformationEstimator = v5;
  }
}

- (void)_updateCameraControllerParameters
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  value = self->_motionSettings.__ptr_.__value_;
  *(void *)buf = 0;
  if (sub_1902C5108((uint64_t)value, @"PeriodicCameraBurstPulseWidthSeconds", buf)) {
    float v4 = *(double *)buf;
  }
  else {
    float v4 = 2.0;
  }
  if (qword_1E929D8D8 != -1) {
    dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
  }
  int v5 = qword_1E929D8E0;
  if (os_log_type_enabled((os_log_t)qword_1E929D8E0, OS_LOG_TYPE_DEFAULT))
  {
    double cameraControllerPeriodicBurstPulseWidthSeconds = self->_cameraControllerPeriodicBurstPulseWidthSeconds;
    *(_DWORD *)buf = 134349312;
    *(double *)&uint8_t buf[4] = v4;
    __int16 v16 = 2050;
    double v17 = cameraControllerPeriodicBurstPulseWidthSeconds;
    _os_log_impl(&dword_1902AF000, v5, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] cameraControllerPeriodicBurstPulseWidthSeconds new: %{public}f old: %{public}f", buf, 0x16u);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929D8D8 != -1) {
      dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
    }
    uint64_t v13 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CMMediaSession _updateCameraControllerParameters]", "CoreLocation: %s\n", v13);
    if (v13 != buf) {
      free(v13);
    }
  }
  self->_double cameraControllerPeriodicBurstPulseWidthSeconds = v4;
  unint64_t v7 = self->_motionSettings.__ptr_.__value_;
  *(void *)buf = 0;
  if (sub_1902C5108((uint64_t)v7, @"PeriodicCameraBurstTotalWidthSeconds", buf)) {
    float v8 = *(double *)buf;
  }
  else {
    float v8 = 5.0;
  }
  if (qword_1E929D8D8 != -1) {
    dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
  }
  uint64_t v9 = qword_1E929D8E0;
  if (os_log_type_enabled((os_log_t)qword_1E929D8E0, OS_LOG_TYPE_DEFAULT))
  {
    double cameraControllerPeriodicBurstTotalWidthSeconds = self->_cameraControllerPeriodicBurstTotalWidthSeconds;
    *(_DWORD *)buf = 134349312;
    *(double *)&uint8_t buf[4] = v8;
    __int16 v16 = 2050;
    double v17 = cameraControllerPeriodicBurstTotalWidthSeconds;
    _os_log_impl(&dword_1902AF000, v9, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] cameraControllerPeriodicBurstTotalWidthSeconds new: %{public}f old: %{public}f", buf, 0x16u);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929D8D8 != -1) {
      dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
    }
    uint64_t v14 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CMMediaSession _updateCameraControllerParameters]", "CoreLocation: %s\n", v14);
    if (v14 != buf) {
      free(v14);
    }
  }
  if (v8 >= v4)
  {
    self->_double cameraControllerPeriodicBurstTotalWidthSeconds = v8;
  }
  else
  {
    *(void *)&self->_double cameraControllerPeriodicBurstPulseWidthSeconds = 0x40A0000040000000;
    if (qword_1E929D8D8 != -1) {
      dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
    }
    __int16 v11 = qword_1E929D8E0;
    if (os_log_type_enabled((os_log_t)qword_1E929D8E0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349312;
      *(void *)&uint8_t buf[4] = 0x4000000000000000;
      __int16 v16 = 2050;
      double v17 = 5.0;
      _os_log_impl(&dword_1902AF000, v11, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] Overriding cameraControllerPeriodicBurstParameters with defaults : %{public}f : %{public}f", buf, 0x16u);
    }
    if (sub_1902D8400(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D8D8 != -1) {
        dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
      }
      int v12 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "-[CMMediaSession _updateCameraControllerParameters]", "CoreLocation: %s\n", v12);
      if (v12 != buf) {
        free(v12);
      }
    }
  }
}

- (void)_updateUserSettings
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  sub_1902B41B0((uint64_t)self->_motionSettings.__ptr_.__value_);
  if (qword_1E929D8D8 != -1) {
    dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
  }
  uint64_t v3 = qword_1E929D8E0;
  if (os_log_type_enabled((os_log_t)qword_1E929D8E0, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109376;
    int v71 = objc_msgSend_returnDefaultPose(self, v4, v5);
    __int16 v72 = 1024;
    int v73 = objc_msgSend_returnRandomPose(self, v6, v7);
    _os_log_impl(&dword_1902AF000, v3, OS_LOG_TYPE_DEBUG, "[CMMediaSession] checking default and random pose preferences. Current defaultPose: %d, randomPose: %d", buf, 0xEu);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929D8D8 != -1) {
      dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
    }
    objc_msgSend_returnDefaultPose(self, v59, v60);
    objc_msgSend_returnRandomPose(self, v61, v62);
    v63 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CMMediaSession _updateUserSettings]", "CoreLocation: %s\n", v63);
    if (v63 != (char *)buf) {
      free(v63);
    }
  }
  value = self->_motionSettings.__ptr_.__value_;
  buf[0] = 0;
  unsigned int v9 = sub_1902C486C((uint64_t)value, @"TempestReturnDefaultPose", (BOOL *)buf);
  if (buf[0]) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = 0;
  }
  __int16 v11 = self->_motionSettings.__ptr_.__value_;
  buf[0] = 0;
  unsigned int v12 = sub_1902C486C((uint64_t)v11, @"TempestReturnRandomPose", (BOOL *)buf);
  if (buf[0]) {
    uint64_t v15 = v12;
  }
  else {
    uint64_t v15 = 0;
  }
  if (v10 != objc_msgSend_returnDefaultPose(self, v13, v14)
    || v15 != objc_msgSend_returnRandomPose(self, v16, v17))
  {
    if (qword_1E929D8D8 != -1) {
      dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
    }
    uint64_t v18 = qword_1E929D8E0;
    if (os_log_type_enabled((os_log_t)qword_1E929D8E0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      int v71 = v10;
      __int16 v72 = 1024;
      int v73 = v15;
      _os_log_impl(&dword_1902AF000, v18, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] Return default/random pose preferences changed: defaultPose: %d, randomPose: %d", buf, 0xEu);
    }
    if (sub_1902D8400(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D8D8 != -1) {
        dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
      }
      v68 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "-[CMMediaSession _updateUserSettings]", "CoreLocation: %s\n", v68);
      if (v68 != (char *)buf) {
        free(v68);
      }
    }
    objc_msgSend_setReturnDefaultPose_(self, v19, v10);
    objc_msgSend_setReturnRandomPose_(self, v20, v15);
    if (objc_msgSend_returnDefaultPose(self, v21, v22))
    {
      objc_msgSend__logEvent_(self, v23, @"Returning default pose");
      if (objc_msgSend_returnRandomPose(self, v25, v26))
      {
        if (qword_1E929D8D8 != -1) {
          dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
        }
        uint64_t v27 = qword_1E929D8E0;
        if (os_log_type_enabled((os_log_t)qword_1E929D8E0, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1902AF000, v27, OS_LOG_TYPE_ERROR, "[CMMediaSession] returning default pose overrides returning random pose preferences", buf, 2u);
        }
        if (sub_1902D8400(115, 0))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1E929D8D8 != -1) {
            dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
          }
          uint64_t v28 = (char *)_os_log_send_and_compose_impl();
          sub_1902D398C("Generic", 1, 0, 0, "-[CMMediaSession _updateUserSettings]", "CoreLocation: %s\n", v28);
          if (v28 != (char *)buf) {
            free(v28);
          }
        }
      }
    }
    else if (objc_msgSend_returnRandomPose(self, v23, v24))
    {
      objc_msgSend__logEvent_(self, v29, @"Returning random pose");
    }
    else
    {
      objc_msgSend__logEvent_(self, v29, @"Returning pose");
    }
  }
  if (qword_1E929D8D8 != -1) {
    dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
  }
  double v30 = qword_1E929D8E0;
  if (os_log_type_enabled((os_log_t)qword_1E929D8E0, OS_LOG_TYPE_DEBUG))
  {
    int v33 = objc_msgSend_alwaysNotify50HzPose(self, v31, v32);
    *(_DWORD *)buf = 67109120;
    int v71 = v33;
    _os_log_impl(&dword_1902AF000, v30, OS_LOG_TYPE_DEBUG, "[CMMediaSession] checking always notify pose preference. Current alwaysNotify50HzPose: %d", buf, 8u);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929D8D8 != -1) {
      dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
    }
    objc_msgSend_alwaysNotify50HzPose(self, v64, v65);
    v66 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CMMediaSession _updateUserSettings]", "CoreLocation: %s\n", v66);
    if (v66 != (char *)buf) {
      free(v66);
    }
  }
  float v34 = self->_motionSettings.__ptr_.__value_;
  buf[0] = 0;
  unsigned int v35 = sub_1902C486C((uint64_t)v34, @"TempestAlwaysNotify50HzPose", (BOOL *)buf);
  if (buf[0]) {
    uint64_t v38 = v35;
  }
  else {
    uint64_t v38 = 0;
  }
  if (objc_msgSend_alwaysNotify50HzPose(self, v36, v37) != v38)
  {
    if (qword_1E929D8D8 != -1) {
      dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
    }
    uint64_t v39 = qword_1E929D8E0;
    if (os_log_type_enabled((os_log_t)qword_1E929D8E0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v71 = v38;
      _os_log_impl(&dword_1902AF000, v39, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] always notify 50Hz pose preferences changed: alwaysNotify50HzPose: %d", buf, 8u);
    }
    if (sub_1902D8400(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D8D8 != -1) {
        dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
      }
      v69 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "-[CMMediaSession _updateUserSettings]", "CoreLocation: %s\n", v69);
      if (v69 != (char *)buf) {
        free(v69);
      }
    }
    objc_msgSend_setAlwaysNotify50HzPose_(self, v40, v38);
    if (objc_msgSend_alwaysNotify50HzPose(self, v41, v42)) {
      objc_msgSend__logEvent_(self, v43, @"Always notify 50Hz pose");
    }
    else {
      objc_msgSend__logEvent_(self, v43, @"Only notify pose if valid and hasChanged");
    }
  }
  uint64_t v44 = self->_motionSettings.__ptr_.__value_;
  buf[0] = 0;
  char v45 = sub_1902C486C((uint64_t)v44, @"TempestVerboseLogging", (BOOL *)buf);
  if (buf[0]) {
    BOOL v46 = v45;
  }
  else {
    BOOL v46 = 0;
  }
  self->_BOOL verboseLogging = v46;
  if (qword_1E929D8D8 != -1) {
    dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
  }
  double v47 = qword_1E929D8E0;
  if (os_log_type_enabled((os_log_t)qword_1E929D8E0, OS_LOG_TYPE_DEFAULT))
  {
    BOOL verboseLogging = self->_verboseLogging;
    *(_DWORD *)buf = 67240192;
    int v71 = verboseLogging;
    _os_log_impl(&dword_1902AF000, v47, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] verbose logging enabled: %{public}d", buf, 8u);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929D8D8 != -1) {
      dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
    }
    v67 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CMMediaSession _updateUserSettings]", "CoreLocation: %s\n", v67);
    if (v67 != (char *)buf) {
      free(v67);
    }
  }
  objc_msgSend__updateMinQuiescentPeriodForBTZ(self, v49, v50);
  objc_msgSend__updateUseFwdPredictionUserSettings(self, v51, v52);
  objc_msgSend__updateTrackingSchemeSettings(self, v53, v54);
  objc_msgSend__updateAnchorIntervalSettings(self, v55, v56);
  objc_msgSend__updateUseHeadToHeadsetTransformationEstimator(self, v57, v58);
}

- (void)_startDefaultsPreferenceUpdater
{
  if (!self->_motionDefaults)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F1CB18]);
    uint64_t v5 = 0;
    self->_motionDefaults = (NSUserDefaults *)objc_msgSend_initWithSuiteName_(v3, v4, @"com.apple.CoreMotion");
    do
      objc_msgSend_addObserver_forKeyPath_options_context_(self->_motionDefaults, v6, (uint64_t)self, off_1E568E098[v5++], 1, self->_motionDefaults);
    while (v5 != 9);
  }
}

- (void)_stopDefaultsPreferenceUpdater
{
  if (self->_motionDefaults)
  {
    for (uint64_t i = 0; i != 9; ++i)
      objc_msgSend_removeObserver_forKeyPath_(self->_motionDefaults, a2, (uint64_t)self, off_1E568E098[i]);

    self->_motionDefaults = 0;
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (self->_motionDefaults == a6)
  {
    objc_msgSend__updateUserSettings(self, a2, (uint64_t)a3, a4, a5);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)CMMediaSession;
    -[CMMediaSession observeValueForKeyPath:ofObject:change:context:](&v6, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void)_startJitterBufferLevelMonitor
{
  self->_jitterBufferLevel = -1;
  objc_msgSend__startJitterBufferLevelRetryTimer(self, a2, v2);
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = sub_1904AE5E0;
  handler[3] = &unk_1E568E0E8;
  handler[4] = self;
  notify_register_dispatch("com.apple.bluetooth.AdaptiveJitterBufferChanged", &self->_jitterBufferLevelNotificationToken, MEMORY[0x1E4F14428], handler);
}

- (void)_stopJitterBufferLevelMonitor
{
}

- (void)_startJitterBufferLevelRetryTimer
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1904AE664;
  block[3] = &unk_1E568D118;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (void)_stopJitterBufferLevelRetryTimer
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  jitterBufferLevelInitialUpdateTimer = self->_jitterBufferLevelInitialUpdateTimer;
  if (jitterBufferLevelInitialUpdateTimer)
  {
    dispatch_source_cancel(jitterBufferLevelInitialUpdateTimer);
    dispatch_release((dispatch_object_t)self->_jitterBufferLevelInitialUpdateTimer);
    self->_jitterBufferLevelInitialUpdateTimer = 0;
  }
}

- (void)_notifyClientHandler
{
  uint64_t v102 = *MEMORY[0x1E4F143B8];
  objc_sync_enter(self);
  if (self->_clientQueue && self->_clientHandler)
  {
    objc_msgSend__feedPredictorEstimates(self, v3, v4);
    value = self->_headTrackingService.__ptr_.__value_;
    long long v90 = *((_OWORD *)value + 1709);
    uint64x2_t v91 = *((uint64x2_t *)value + 1710);
    __int16 v92 = *((_WORD *)value + 13688);
    v89 = 0;
    int v9 = objc_msgSend__createPoseFromListenerOrientation_Pose_(self, v6, (uint64_t)&v90, &v89);
    if (self->_analyticsTracker.__ptr_.__value_ && !*((unsigned char *)self->_headTrackingService.__ptr_.__value_ + 16058))
    {
      objc_msgSend_machAbsTimestamp(v89, v7, v8);
      double v11 = v10;
      objc_msgSend_consumedAuxTimestamp(v89, v12, v13);
      uint64_t v15 = self->_analyticsTracker.__ptr_.__value_;
      double v16 = *((double *)v15 + 91);
      double v17 = *((double *)v15 + 90);
      BOOL v18 = v11 <= v14 + 0.5;
      double v19 = 1.0;
      if (!v18) {
        double v19 = 0.0;
      }
      if (v16 <= v19) {
        double v16 = v19;
      }
      if (v17 >= v19) {
        double v17 = v19;
      }
      *((double *)v15 + 91) = v16;
      *((double *)v15 + 90) = v17;
      *((double *)v15 + 92) = v19 + *((double *)v15 + 92);
      ++*((_DWORD *)v15 + 186);
    }
    if ((_BYTE)v92) {
      BOOL v20 = HIBYTE(v92) == 0;
    }
    else {
      BOOL v20 = 1;
    }
    int v21 = !v20;
    int v22 = self->_notify50HzPoseDecimator + 1;
    self->_notify50HzPoseDecimator = v22;
    if (v22 == 4)
    {
      self->_notify50HzPoseDecimator = 0;
      if (v21)
      {
LABEL_22:
        if (self->_logForReplay)
        {
          uint64_t v99 = 0;
          uint64_t v100 = 0;
          uint64_t v101 = 0;
          float64x2_t buf = vmulq_f64(vcvtq_f64_u64(v91), (float64x2_t)vdupq_n_s64(0x3EB0C6F7A0B5ED8DuLL));
          float64x2_t v97 = vcvtq_f64_f32(*(float32x2_t *)&v90);
          double v96 = *((float *)&v90 + 3);
          double v98 = *((float *)&v90 + 2);
          objc_msgSend_consumedAuxTimestamp(v89, v7, v8);
          uint64_t v99 = v23;
          objc_msgSend_receivedAuxTimestamp(v89, v24, v25);
          uint64_t v100 = v26;
          objc_msgSend_machAbsTimestamp(v89, v27, v28);
          uint64_t v101 = v29;
          sub_190457DD8((uint64_t *)self->_logger.__ptr_.__value_, &buf);
        }
        if (self->_firstValidPoseTime == 0.0)
        {
          uint64_t v30 = mach_continuous_time();
          double v31 = sub_1902D8D34(v30);
          self->_firstValidPoseTime = v31;
          uint64_t v32 = self->_analyticsTracker.__ptr_.__value_;
          if (v32) {
            *((double *)v32 + 177) = v31 - self->_sessionStartTime;
          }
          if (qword_1E929D8D8 != -1) {
            dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
          }
          int v33 = qword_1E929D8E0;
          if (os_log_type_enabled((os_log_t)qword_1E929D8E0, OS_LOG_TYPE_DEFAULT))
          {
            double v34 = self->_firstValidPoseTime - self->_sessionStartTime;
            LODWORD(buf.f64[0]) = 134217984;
            *(double *)((char *)buf.f64 + 4) = v34;
            _os_log_impl(&dword_1902AF000, v33, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] First non unit quaternion pose after %.3f seconds", (uint8_t *)&buf, 0xCu);
          }
          if (sub_1902D8400(115, 2))
          {
            bzero(&buf, 0x65CuLL);
            if (qword_1E929D8D8 != -1) {
              dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
            }
            double v67 = self->_firstValidPoseTime - self->_sessionStartTime;
            int v93 = 134217984;
            double v94 = v67;
            v68 = (char *)_os_log_send_and_compose_impl();
            sub_1902D398C("Generic", 1, 0, 2, "-[CMMediaSession _notifyClientHandler]", "CoreLocation: %s\n", v68);
            if (v68 != (char *)&buf) {
              free(v68);
            }
          }
        }
        unsigned int v35 = self->_analyticsTracker.__ptr_.__value_;
        if (v35 && !*((unsigned char *)self->_headTrackingService.__ptr_.__value_ + 16058))
        {
          objc_msgSend_machAbsTimestamp(v89, v7, v8);
          double v37 = v36;
          objc_msgSend_consumedAuxTimestamp(v89, v38, v39);
          double v41 = v37 - v40;
          double v42 = *((double *)v35 + 95);
          if (v42 <= v41) {
            double v42 = v41;
          }
          *((double *)v35 + 95) = v42;
          double v43 = *((double *)v35 + 94);
          if (v43 >= v41) {
            double v43 = v41;
          }
          *((double *)v35 + 94) = v43;
          *((double *)v35 + 96) = v41 + *((double *)v35 + 96);
          ++*((_DWORD *)v35 + 194);
        }
        double printPoseTimer = self->_printPoseTimer;
        uint64_t v45 = mach_continuous_time();
        if (printPoseTimer < sub_1902D8D34(v45))
        {
          uint64_t v46 = mach_continuous_time();
          self->_double printPoseTimer = sub_1902D8D34(v46) + 5.0;
          if (qword_1E929D8D8 != -1) {
            dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
          }
          double v47 = qword_1E929D8E0;
          if (os_log_type_enabled((os_log_t)qword_1E929D8E0, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v50 = objc_msgSend_description(v89, v48, v49);
            uint64_t v53 = objc_msgSend_UTF8String(v50, v51, v52);
            LODWORD(buf.f64[0]) = 136380675;
            *(void *)((char *)buf.f64 + 4) = v53;
            _os_log_impl(&dword_1902AF000, v47, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] %{private}s", (uint8_t *)&buf, 0xCu);
          }
          if (sub_1902D8400(115, 2))
          {
            bzero(&buf, 0x65CuLL);
            if (qword_1E929D8D8 != -1) {
              dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
            }
            int v71 = objc_msgSend_description(v89, v69, v70);
            uint64_t v74 = objc_msgSend_UTF8String(v71, v72, v73);
            int v93 = 136380675;
            double v94 = *(double *)&v74;
            v75 = (char *)_os_log_send_and_compose_impl();
            sub_1902D398C("Generic", 1, 0, 2, "-[CMMediaSession _notifyClientHandler]", "CoreLocation: %s\n", v75);
            if (v75 != (char *)&buf) {
              free(v75);
            }
          }
          if (qword_1E929D8D8 != -1) {
            dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
          }
          uint64_t v54 = qword_1E929D8E0;
          if (os_log_type_enabled((os_log_t)qword_1E929D8E0, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int accessoryIMUSampleRate = self->_accessoryIMUSampleRate;
            LODWORD(buf.f64[0]) = 67174657;
            HIDWORD(buf.f64[0]) = accessoryIMUSampleRate;
            _os_log_impl(&dword_1902AF000, v54, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] current accessory samples per second: %{private}d", (uint8_t *)&buf, 8u);
          }
          if (sub_1902D8400(115, 2))
          {
            bzero(&buf, 0x65CuLL);
            if (qword_1E929D8D8 != -1) {
              dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
            }
            unsigned int v76 = self->_accessoryIMUSampleRate;
            int v93 = 67174657;
            LODWORD(v94) = v76;
            v77 = (char *)_os_log_send_and_compose_impl();
            sub_1902D398C("Generic", 1, 0, 2, "-[CMMediaSession _notifyClientHandler]", "CoreLocation: %s\n", v77);
            if (v77 != (char *)&buf) {
              free(v77);
            }
          }
        }
        clientQueue = self->_clientQueue;
        id clientHandler = self->_clientHandler;
        v87[0] = MEMORY[0x1E4F143A8];
        v87[1] = 3221225472;
        v87[2] = sub_1904AF55C;
        v87[3] = &unk_1E568E138;
        v87[4] = v89;
        v87[5] = clientHandler;
        int v88 = v9;
        uint64_t v58 = v87;
LABEL_58:
        dispatch_async(clientQueue, v58);
        goto LABEL_59;
      }
      int v21 = objc_msgSend_alwaysNotify50HzPose(self, v7, v8);
    }
    if (v21) {
      goto LABEL_22;
    }
    if (self->_inEarStatus != 4)
    {
      if (qword_1E929D8D8 != -1) {
        dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
      }
      v59 = qword_1E929D8E0;
      if (os_log_type_enabled((os_log_t)qword_1E929D8E0, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v62 = objc_msgSend_description(v89, v60, v61);
        uint64_t v65 = objc_msgSend_UTF8String(v62, v63, v64);
        LODWORD(buf.f64[0]) = 136380675;
        *(void *)((char *)buf.f64 + 4) = v65;
        _os_log_impl(&dword_1902AF000, v59, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] %{private}s", (uint8_t *)&buf, 0xCu);
      }
      if (sub_1902D8400(115, 2))
      {
        bzero(&buf, 0x65CuLL);
        if (qword_1E929D8D8 != -1) {
          dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
        }
        v80 = objc_msgSend_description(v89, v78, v79);
        uint64_t v83 = objc_msgSend_UTF8String(v80, v81, v82);
        int v93 = 136380675;
        double v94 = *(double *)&v83;
        v84 = (char *)_os_log_send_and_compose_impl();
        sub_1902D398C("Generic", 1, 0, 2, "-[CMMediaSession _notifyClientHandler]", "CoreLocation: %s\n", v84);
        if (v84 != (char *)&buf) {
          free(v84);
        }
      }
      clientQueue = self->_clientQueue;
      id v66 = self->_clientHandler;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = sub_1904AF574;
      block[3] = &unk_1E568E138;
      block[4] = v89;
      void block[5] = v66;
      int v86 = v9;
      uint64_t v58 = block;
      goto LABEL_58;
    }
  }
LABEL_59:
  objc_sync_exit(self);
}

- (void)_feedSourceDeviceIMU:(const Sample *)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  double v5 = self->_accessorySampleTimer + 1.0;
  uint64_t v6 = mach_continuous_time();
  if (v5 < sub_1902D8D34(v6))
  {
    self->_unsigned int accessoryIMUSampleRate = self->_accessorySamplesPerSecond;
    self->_accessorySamplesPerSecond = 0;
    uint64_t v7 = mach_continuous_time();
    self->_accessorySampleTimer = sub_1902D8D34(v7);
  }
  int32x2_t v25 = vdup_n_s32(0x37E5D90Du);
  int v26 = 937810189;
  float v8 = sub_1902DAF50((double *)&a3->acceleration.x);
  float v9 = *((float *)&a3[1].acceleration + 3);
  float v11 = v10 + *(float *)&a3[2].timestamp;
  v23.f32[0] = a3[1].acceleration.z + v8;
  v23.f32[1] = v12 + v9;
  float v24 = v11;
  float y = a3[2].acceleration.y;
  uint64_t v21 = *(void *)((char *)&a3[2].timestamp + 4);
  float v22 = y;
  int8x16_t v14 = (int8x16_t)vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&a3->acceleration.x), *(float64x2_t *)&a3[1].timestamp);
  float32x4_t v20 = (float32x4_t)vextq_s8(v14, v14, 4uLL);
  sub_1902D9ACC(&v20, v20);
  objc_sync_enter(self);
  if ((HIWORD(a3[4].acceleration.y) & 0x100) != 0)
  {
    unint64_t v19 = (unint64_t)(a3->timestamp * 1000000.0);
    self->_lastSourceTimestampMicroSeconds = v19;
    sub_1904FA9F0((float32x2_t *)self->_headTrackingService.__ptr_.__value_, &v20, &v23, (uint64_t)&v21, (uint64_t)&v25, v19);
  }
  else
  {
    if (qword_1E929D8D8 != -1) {
      dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
    }
    uint64_t v15 = qword_1E929D8E0;
    if (os_log_type_enabled((os_log_t)qword_1E929D8E0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)float64x2_t buf = 0;
      _os_log_impl(&dword_1902AF000, v15, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] Not feeding SrcDM due to uninitialized DM status.", buf, 2u);
    }
    if (sub_1902D8400(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D8D8 != -1) {
        dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
      }
      BOOL v18 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "-[CMMediaSession _feedSourceDeviceIMU:]", "CoreLocation: %s\n", v18);
      if (v18 != (char *)buf) {
        free(v18);
      }
    }
  }
  if (self->_logForReplay) {
    sub_1904571D4((uint64_t *)self->_logger.__ptr_.__value_, &a3->timestamp);
  }
  objc_msgSend__notifyClientHandler(self, v16, v17);
  objc_sync_exit(self);
}

- (void)_feedDisplayCount:(unsigned int)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (self->_displayCount != a3)
  {
    if (qword_1E929D8D8 != -1) {
      dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
    }
    double v5 = qword_1E929D8E0;
    if (os_log_type_enabled((os_log_t)qword_1E929D8E0, OS_LOG_TYPE_DEFAULT))
    {
      int displayCount = self->_displayCount;
      *(_DWORD *)float64x2_t buf = 67240448;
      int v23 = displayCount;
      __int16 v24 = 1026;
      unsigned int v25 = a3;
      _os_log_impl(&dword_1902AF000, v5, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] Display count changed: from %{public}u, to %{public}u", buf, 0xEu);
    }
    if (sub_1902D8400(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D8D8 != -1) {
        dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
      }
      unint64_t v19 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "-[CMMediaSession _feedDisplayCount:]", "CoreLocation: %s\n", v19);
      if (v19 != (char *)buf) {
        free(v19);
      }
    }
    value = self->_headTrackingService.__ptr_.__value_;
    if (!value) {
      goto LABEL_36;
    }
    if (a3 <= 1)
    {
      if (a3 != 1)
      {
LABEL_36:
        self->_int displayCount = a3;
        return;
      }
      double lidAngle = self->_lidAngle;
      if (lidAngle < 0.0 || lidAngle >= 25.0)
      {
        int schemePrev = self->_schemePrev;
        if (schemePrev)
        {
          sub_1904F8B2C(value, schemePrev);
          if (qword_1E929D8D8 != -1) {
            dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
          }
          double v16 = qword_1E929D8E0;
          if (os_log_type_enabled((os_log_t)qword_1E929D8E0, OS_LOG_TYPE_DEFAULT))
          {
            int v17 = self->_schemePrev;
            *(_DWORD *)float64x2_t buf = 67240192;
            int v23 = v17;
            _os_log_impl(&dword_1902AF000, v16, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] External display detached, change tracking scheme back to %{public}d", buf, 8u);
          }
          if (sub_1902D8400(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1E929D8D8 != -1) {
              dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
            }
            uint64_t v21 = (char *)_os_log_send_and_compose_impl();
            sub_1902D398C("Generic", 1, 0, 2, "-[CMMediaSession _feedDisplayCount:]", "CoreLocation: %s\n", v21);
            if (v21 != (char *)buf) {
              free(v21);
            }
          }
          BOOL v18 = self->_analyticsTracker.__ptr_.__value_;
          if (v18 && *((double *)v18 + 52) > 0.0) {
            sub_19050B590((double *)v18 + 52, &stru_1EDFD5D50);
          }
        }
        goto LABEL_36;
      }
    }
    int v8 = *((_DWORD *)value + 10);
    self->_int schemePrev = v8;
    if (v8)
    {
      if (qword_1E929D8D8 != -1) {
        dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
      }
      float v9 = qword_1E929D8E0;
      if (os_log_type_enabled((os_log_t)qword_1E929D8E0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)float64x2_t buf = 0;
        _os_log_impl(&dword_1902AF000, v9, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] External display attached, change tracking scheme to IMUOnly", buf, 2u);
      }
      if (sub_1902D8400(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1E929D8D8 != -1) {
          dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
        }
        float32x4_t v20 = (char *)_os_log_send_and_compose_impl();
        sub_1902D398C("Generic", 1, 0, 2, "-[CMMediaSession _feedDisplayCount:]", "CoreLocation: %s\n", v20);
        if (v20 != (char *)buf) {
          free(v20);
        }
      }
      sub_1904F8B2C(self->_headTrackingService.__ptr_.__value_, 0);
    }
    float v10 = self->_analyticsTracker.__ptr_.__value_;
    if (v10)
    {
      unsigned int maxDisplayCount = self->_maxDisplayCount;
      if (maxDisplayCount < a3)
      {
        unsigned int v12 = 0;
        int v13 = *((_DWORD *)v10 + 331);
        do
        {
          if (v13 != -1)
          {
            *((_DWORD *)v10 + 331) = ++v13;
            unsigned int maxDisplayCount = self->_maxDisplayCount;
          }
          ++v12;
        }
        while (v12 < a3 - maxDisplayCount);
        self->_unsigned int maxDisplayCount = a3;
      }
      sub_19050B3B0((double *)v10 + 52, @"externalScreenDuration");
    }
    goto LABEL_36;
  }
}

- (void)_feedLidAngle:(double)a3
{
  self->_double lidAngle = a3;
}

- (void)_feedFaceKitData:(id)a3 timestamp:(double)a4
{
  uint64_t v185 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_msgSend_objectForKeyedSubscript_(a3, a2, @"rm_camera_id");
  int v8 = objc_msgSend_objectForKeyedSubscript_(a3, v7, @"rm_tracked_faces");
  if (qword_1E929D8D8 != -1) {
    dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
  }
  float v9 = qword_1E929D8E0;
  if (os_log_type_enabled((os_log_t)qword_1E929D8E0, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)float64x2_t buf = 134349312;
    *(void *)&uint8_t buf[4] = objc_msgSend_unsignedLongValue(v6, v10, v11);
    *(_WORD *)&unsigned char buf[12] = 2050;
    *(void *)&buf[14] = objc_msgSend_count(v8, v12, v13);
    _os_log_impl(&dword_1902AF000, v9, OS_LOG_TYPE_DEBUG, "[CMMediaSession][Cam %{public}lu] Received %{public}lu faces", buf, 0x16u);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929D8D8 != -1) {
      dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
    }
    int v166 = 134349312;
    uint64_t v167 = objc_msgSend_unsignedLongValue(v6, v152, v153);
    *(_WORD *)v168 = 2050;
    *(void *)&v168[2] = objc_msgSend_count(v8, v154, v155);
    v156 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CMMediaSession _feedFaceKitData:timestamp:]", "CoreLocation: %s\n", v156);
    if (v156 != buf) {
      free(v156);
    }
  }
  Object = objc_msgSend_firstObject(v8, v14, v15);
  BOOL v18 = Object;
  if (Object)
  {
    unint64_t v19 = objc_msgSend_objectForKeyedSubscript_(Object, v17, @"raw_data");
    uint64_t v21 = objc_msgSend_objectForKeyedSubscript_(v19, v20, @"pose");
    int v23 = objc_msgSend_objectForKeyedSubscript_(v21, v22, @"rotation");
    unsigned int v25 = objc_msgSend_objectForKeyedSubscript_(v21, v24, @"translation");
    uint64_t v27 = objc_msgSend_objectForKeyedSubscript_(v19, v26, @"data_failure");
    uint64_t v29 = objc_msgSend_objectForKeyedSubscript_(v27, v28, @"image_too_dark");
    double v31 = objc_msgSend_objectForKeyedSubscript_(v27, v30, @"sensor_covered");
    v158 = objc_msgSend_objectForKeyedSubscript_(v18, v32, @"failure_type");
    double v34 = objc_msgSend_objectForKeyedSubscript_(v18, v33, @"confidence");
    uint64_t v36 = objc_msgSend_objectForKeyedSubscript_(v18, v35, @"AngleInfoRoll");
    if (v23 && v25)
    {
      uint64_t v38 = (void *)v36;
      uint64_t v39 = objc_msgSend_objectAtIndexedSubscript_(v23, v37, 0);
      double v41 = objc_msgSend_objectAtIndexedSubscript_(v39, v40, 0);
      objc_msgSend_floatValue(v41, v42, v43);
      int v45 = v44;
      double v47 = objc_msgSend_objectAtIndexedSubscript_(v23, v46, 1);
      uint64_t v49 = objc_msgSend_objectAtIndexedSubscript_(v47, v48, 0);
      objc_msgSend_floatValue(v49, v50, v51);
      unsigned int v53 = v52;
      id v55 = objc_msgSend_objectAtIndexedSubscript_(v23, v54, 2);
      uint64_t v57 = objc_msgSend_objectAtIndexedSubscript_(v55, v56, 0);
      objc_msgSend_floatValue(v57, v58, v59);
      unsigned int v61 = v60;
      v63 = objc_msgSend_objectAtIndexedSubscript_(v23, v62, 0);
      uint64_t v65 = objc_msgSend_objectAtIndexedSubscript_(v63, v64, 1);
      objc_msgSend_floatValue(v65, v66, v67);
      int v69 = v68;
      int v71 = objc_msgSend_objectAtIndexedSubscript_(v23, v70, 1);
      uint64_t v73 = objc_msgSend_objectAtIndexedSubscript_(v71, v72, 1);
      objc_msgSend_floatValue(v73, v74, v75);
      int v77 = v76;
      uint64_t v79 = objc_msgSend_objectAtIndexedSubscript_(v23, v78, 2);
      v81 = objc_msgSend_objectAtIndexedSubscript_(v79, v80, 1);
      objc_msgSend_floatValue(v81, v82, v83);
      int v85 = v84;
      v87 = objc_msgSend_objectAtIndexedSubscript_(v23, v86, 0);
      v89 = objc_msgSend_objectAtIndexedSubscript_(v87, v88, 2);
      objc_msgSend_floatValue(v89, v90, v91);
      int v93 = v92;
      v95 = objc_msgSend_objectAtIndexedSubscript_(v23, v94, 1);
      float64x2_t v97 = objc_msgSend_objectAtIndexedSubscript_(v95, v96, 2);
      objc_msgSend_floatValue(v97, v98, v99);
      int v101 = v100;
      v103 = objc_msgSend_objectAtIndexedSubscript_(v23, v102, 2);
      v105 = objc_msgSend_objectAtIndexedSubscript_(v103, v104, 2);
      objc_msgSend_floatValue(v105, v106, v107);
      int v166 = v45;
      uint64_t v167 = __PAIR64__(v61, v53);
      *(_DWORD *)v168 = v69;
      *(_DWORD *)&v168[4] = v77;
      *(_DWORD *)&v168[8] = v85;
      int v169 = v93;
      int v170 = v101;
      __int32 v171 = v108.i32[0];
      v165.i64[0] = 0;
      v165.i64[1] = 0x3F80000000000000;
      double v109 = sub_1904D072C(&v165, (float *)&v166, v108);
      v111 = objc_msgSend_objectAtIndexedSubscript_(v25, v110, 0, v109);
      objc_msgSend_floatValue(v111, v112, v113);
      float v115 = v114;
      v117 = objc_msgSend_objectAtIndexedSubscript_(v25, v116, 1);
      objc_msgSend_floatValue(v117, v118, v119);
      float v121 = v120;
      v123 = objc_msgSend_objectAtIndexedSubscript_(v25, v122, 2);
      objc_msgSend_floatValue(v123, v124, v125);
      float v127 = v115 * 0.001;
      float v128 = v121 * 0.001;
      float v129 = v126.f32[0] * 0.001;
      if ((atomic_load_explicit((atomic_uchar *volatile)qword_1EB3BEB90, memory_order_acquire) & 1) == 0)
      {
        if (__cxa_guard_acquire(qword_1EB3BEB90))
        {
          xmmword_1EB3BEBA0 = xmmword_1906098B0;
          sub_1902D9ACC((float32x4_t *)&xmmword_1EB3BEBA0, (float32x4_t)xmmword_1906098B0);
          __cxa_guard_release(qword_1EB3BEB90);
        }
      }
      sub_1904CF3F4((uint64_t)&xmmword_1EB3BEBA0, v165.f32, (float32x4_t *)buf, v126);
      float32x4_t v165 = *(float32x4_t *)buf;
      float v130 = sub_1904CF73C((float *)&xmmword_1EB3BEBA0, v127, v128, v129);
      int v132 = v131;
      int v134 = v133;
      objc_msgSend_floatValue(v34, v135, v136);
      int v160 = v137;
      char v161 = objc_msgSend_BOOLValue(v29, v138, v139);
      char v162 = objc_msgSend_BOOLValue(v31, v140, v141);
      int v163 = objc_msgSend_intValue(v158, v142, v143);
      objc_msgSend_doubleValue(v38, v144, v145);
      uint64_t v164 = v146;
      *(void *)float64x2_t buf = CFAbsoluteTimeGetCurrent();
      *(double *)&buf[8] = a4;
      *(void *)&buf[16] = 0x100000002;
      double v173 = v165.f32[3];
      float64x2_t v174 = vcvtq_f64_f32(*(float32x2_t *)v165.f32);
      double v175 = v165.f32[2];
      float v176 = v130;
      int v177 = v132;
      int v178 = v134;
      long long v179 = 0u;
      long long v180 = 0u;
      long long v181 = 0u;
      long long v182 = 0u;
      int v183 = objc_msgSend_unsignedIntValue(v6, v147, v148);
      uint64_t v184 = 0;
      double lidAngle = self->_lidAngle;
      *(float *)&double lidAngle = lidAngle;
      objc_msgSend__feedPoseAnchor_facePoseError_lidAngleDeg_(self, v150, (uint64_t)buf, &v160, lidAngle);
    }
    else if (self->_inEarStatus == 4)
    {
      if (qword_1E929D8D8 != -1) {
        dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
      }
      v151 = qword_1E929D8E0;
      if (os_log_type_enabled((os_log_t)qword_1E929D8E0, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)float64x2_t buf = 0;
        _os_log_impl(&dword_1902AF000, v151, OS_LOG_TYPE_ERROR, "[CMMediaSession] Rotation matrix or translation is missing", buf, 2u);
      }
      if (sub_1902D8400(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1E929D8D8 != -1) {
          dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
        }
        LOWORD(v166) = 0;
        v157 = (char *)_os_log_send_and_compose_impl();
        sub_1902D398C("Generic", 1, 0, 0, "-[CMMediaSession _feedFaceKitData:timestamp:]", "CoreLocation: %s\n", v157);
        if (v157 != buf) {
          free(v157);
        }
      }
    }
  }
}

- (void)_feedPoseAnchor:(const Sample *)a3 facePoseError:(id *)a4 lidAngleDeg:(float)a5
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  if (a3 && a4)
  {
    long long v9 = *(_OWORD *)&a3[4].acceleration.z;
    long long v58 = *(_OWORD *)&a3[4].timestamp;
    long long v59 = v9;
    long long v60 = *(_OWORD *)&a3[5].acceleration.x;
    long long v10 = *(_OWORD *)&a3[2].timestamp;
    long long v54 = *(_OWORD *)&a3[1].acceleration.x;
    long long v55 = v10;
    long long v11 = *(_OWORD *)&a3[3].acceleration.x;
    long long v56 = *(_OWORD *)&a3[2].acceleration.z;
    long long v57 = v11;
    long long v12 = *(_OWORD *)&a3->acceleration.z;
    long long v52 = *(_OWORD *)&a3->timestamp;
    long long v53 = v12;
    sub_1902BAD40();
    if (sub_19046BCE8())
    {
      int8x16_t v13 = (int8x16_t)vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&a3[1].timestamp), *(float64x2_t *)&a3[1].acceleration.z);
      *(int8x16_t *)unsigned int v61 = vextq_s8(v13, v13, 4uLL);
      float32x4_t v14 = sub_1902D9ACC((float32x4_t *)v61, *(float32x4_t *)v61);
      sub_1904CF3F4((uint64_t)&self->_cameraToSourceAlignment, (float *)v61, (float32x4_t *)buf, v14);
      float v15 = sub_1904CF73C(self->_cameraToSourceAlignment.elements, a3[2].acceleration.x, a3[2].acceleration.y, a3[2].acceleration.z);
      double v18 = *(float *)buf;
      double v19 = v65;
      double v20 = *(float *)v66;
      *((double *)&v54 + 1) = v65;
      *(double *)&long long v55 = *(float *)v66;
      double v21 = *(float *)&v66[4];
      *((double *)&v53 + 1) = *(float *)&v66[4];
      *(double *)&long long v54 = *(float *)buf;
    }
    else
    {
      double v19 = *((double *)&v54 + 1);
      double v20 = *(double *)&v55;
      double v21 = *((double *)&v53 + 1);
      double v18 = *(double *)&v54;
      float v16 = *((float *)&v55 + 3);
      float v15 = *((float *)&v55 + 2);
      float v17 = *(float *)&v56;
    }
    float v24 = v15 + self->_offsetFromDisplayCenterToFrontCameraInSourceFrameMeters.elements[0];
    float v25 = v16 + self->_offsetFromDisplayCenterToFrontCameraInSourceFrameMeters.elements[1];
    float v26 = v17 + self->_offsetFromDisplayCenterToFrontCameraInSourceFrameMeters.elements[2];
    *((float *)&v55 + 2) = v24;
    *((float *)&v55 + 3) = v25;
    *(float *)&long long v56 = v26;
    objc_sync_enter(self);
    if (self->_logForReplay) {
      sub_190457530((uint64_t *)self->_logger.__ptr_.__value_, (uint64_t)&v52, (int *)a4, self->_lidAngle);
    }
    if (!self->_simulateCameraOnOffRequest
      || self->_scheme != 1
      || self->_bypassCameraController
      || *((unsigned char *)self->_headTrackingService.__ptr_.__value_ + 27520))
    {
      uint64_t v32 = (unint64_t)(*(double *)&a3->acceleration.x * 1000000.0);
      if (a4->var3 || a4->var0 <= 0.8)
      {
        if (qword_1E929D8D8 != -1) {
          dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
        }
        double v40 = qword_1E929D8E0;
        if (os_log_type_enabled((os_log_t)qword_1E929D8E0, OS_LOG_TYPE_DEFAULT))
        {
          int var3 = a4->var3;
          double var0 = a4->var0;
          *(float *)float64x2_t buf = 1.5048e-36;
          float v65 = *(float *)&var3;
          *(_WORD *)id v66 = 2048;
          *(double *)&v66[2] = var0;
          __int16 v67 = 2048;
          uint64_t v68 = v32;
          _os_log_impl(&dword_1902AF000, v40, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] anchor is IGNORED due to failure or low confidence. failureCode: %u, confidence: %f, timestamp: %llu", buf, 0x1Cu);
        }
        if (sub_1902D8400(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1E929D8D8 != -1) {
            dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
          }
          int v49 = a4->var3;
          double v50 = a4->var0;
          *(_DWORD *)unsigned int v61 = 67109632;
          *(_DWORD *)&v61[4] = v49;
          *(_WORD *)&v61[8] = 2048;
          *(double *)&v61[10] = v50;
          __int16 v62 = 2048;
          uint64_t v63 = v32;
          uint64_t v51 = (char *)_os_log_send_and_compose_impl();
          sub_1902D398C("Generic", 1, 0, 2, "-[CMMediaSession _feedPoseAnchor:facePoseError:lidAngleDeg:]", "CoreLocation: %s\n", v51);
          if (v51 != (char *)buf) {
            free(v51);
          }
        }
        if (a4->var3)
        {
          value = self->_analyticsTracker.__ptr_.__value_;
          if (value)
          {
            int v44 = *((_DWORD *)value + 333);
            if (v44 != -1) {
              *((_DWORD *)value + 333) = v44 + 1;
            }
          }
        }
        else if (a4->var0 <= 0.8)
        {
          int v45 = self->_analyticsTracker.__ptr_.__value_;
          if (v45)
          {
            int v46 = *((_DWORD *)v45 + 334);
            if (v46 != -1) {
              *((_DWORD *)v45 + 334) = v46 + 1;
            }
          }
        }
      }
      else
      {
        *(float *)&double v28 = v24;
        *(float *)&double v29 = v25;
        *(float *)&double v30 = v26;
        *(float *)&double v31 = a5;
        objc_msgSend_feedPoseAnchorWithAttitude_position_lidAngleDeg_timestampUs_(self, v27, v32, v18, v19, v20, v21, v28, v29, v30, v31);
        uint64_t v33 = mach_absolute_time();
        double v34 = sub_1902D8D34(v33);
        double v35 = (double)(unint64_t)v32 * 0.000001;
        if (v34 >= v35)
        {
          uint64_t v36 = self->_analyticsTracker.__ptr_.__value_;
          if (v36)
          {
            double v37 = v34 - v35;
            double v38 = *((double *)v36 + 151);
            if (v38 <= v37) {
              double v38 = v37;
            }
            *((double *)v36 + 151) = v38;
            double v39 = *((double *)v36 + 150);
            if (v39 >= v37) {
              double v39 = v37;
            }
            *((double *)v36 + 150) = v39;
            *((double *)v36 + 152) = v37 + *((double *)v36 + 152);
            ++*((_DWORD *)v36 + 306);
          }
        }
      }
      double v47 = self->_analyticsTracker.__ptr_.__value_;
      int v48 = *((_DWORD *)v47 + 332);
      if (v48 != -1) {
        *((_DWORD *)v47 + 332) = v48 + 1;
      }
    }
    objc_sync_exit(self);
  }
  else
  {
    if (qword_1E929D8D8 != -1) {
      dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
    }
    float v22 = qword_1E929D8E0;
    if (os_log_type_enabled((os_log_t)qword_1E929D8E0, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)float64x2_t buf = 0;
      _os_log_impl(&dword_1902AF000, v22, OS_LOG_TYPE_ERROR, "[CMMediaSession] Missing face sample or error.", buf, 2u);
    }
    if (sub_1902D8400(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D8D8 != -1) {
        dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
      }
      LOWORD(v52) = 0;
      int v23 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 0, "-[CMMediaSession _feedPoseAnchor:facePoseError:lidAngleDeg:]", "CoreLocation: %s\n", v23);
      if (v23 != (char *)buf) {
        free(v23);
      }
    }
  }
}

- (void)feedPoseAnchorWithAttitude:(id)a3 position:()CMVector<float lidAngleDeg:(3UL>)a4 timestampUs:(float)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  int scheme = self->_scheme;
  if (scheme)
  {
    float v9 = a4.elements[2];
    float v10 = a4.elements[1];
    float v11 = a4.elements[0];
    if (scheme == 1
      || ((unint64_t anchorUpdateIntervalUs = self->_anchorUpdateIntervalUs, anchorUpdateIntervalUs <= 0x3A98)
        ? (unint64_t v14 = 1)
        : (unint64_t v14 = anchorUpdateIntervalUs - 15000),
          a6 - self->_lastFacePoseTimestampUs > v14))
    {
      *(float *)&a3.double var0 = a3.var0;
      *(float *)&unsigned int v15 = a3.var1;
      float32_t var2 = a3.var2;
      v28.i64[0] = __PAIR64__(v15, LODWORD(a3.var0));
      *(float *)&a3.double var0 = a3.var3;
      v28.f32[2] = var2;
      v28.i32[3] = LODWORD(a3.var0);
      sub_1902D9ACC(&v28, *(float32x4_t *)&a3.var0);
      v27[0] = v11;
      v27[1] = v10;
      v27[2] = v9;
      objc_sync_enter(self);
      sub_1904FAC88((uint64_t)self->_headTrackingService.__ptr_.__value_, (float32x2_t *)&v28, v27, a6, a5);
      if (!self->_lastFacePoseTimestampUs)
      {
        double sessionStartTime = self->_sessionStartTime;
        if (qword_1E929D8D8 != -1) {
          dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
        }
        double v18 = qword_1E929D8E0;
        if (os_log_type_enabled((os_log_t)qword_1E929D8E0, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)float64x2_t buf = 134349056;
          double v32 = -(sessionStartTime - (double)a6 * 0.000001);
          _os_log_impl(&dword_1902AF000, v18, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] Received first face pose anchor.timeToFirstFacePoseInSessionSeconds: %{public}.1f s", buf, 0xCu);
        }
        if (sub_1902D8400(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1E929D8D8 != -1) {
            dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
          }
          int v29 = 134349056;
          double v30 = -(sessionStartTime - (double)a6 * 0.000001);
          float v26 = (char *)_os_log_send_and_compose_impl();
          sub_1902D398C("Generic", 1, 0, 2, "-[CMMediaSession feedPoseAnchorWithAttitude:position:lidAngleDeg:timestampUs:]", "CoreLocation: %s\n", v26);
          if (v26 != (char *)buf) {
            free(v26);
          }
        }
        value = self->_analyticsTracker.__ptr_.__value_;
        if (value) {
          *((double *)value + 178) = -(sessionStartTime - (double)a6 * 0.000001);
        }
      }
      if (!self->_firstFacePoseInCameraRequestTimestampUs)
      {
        self->_firstFacePoseInCameraRequestTimestampUs = a6;
        unint64_t lastRequestingCameraTimestampUs = self->_lastRequestingCameraTimestampUs;
        unint64_t v21 = a6 - lastRequestingCameraTimestampUs;
        if (a6 > lastRequestingCameraTimestampUs)
        {
          float v22 = self->_analyticsTracker.__ptr_.__value_;
          if (v22)
          {
            double v23 = (double)v21 * 0.000001;
            double v24 = *((double *)v22 + 147);
            if (v24 <= v23) {
              double v24 = (double)v21 * 0.000001;
            }
            *((double *)v22 + 147) = v24;
            double v25 = *((double *)v22 + 146);
            if (v25 >= v23) {
              double v25 = (double)v21 * 0.000001;
            }
            *((double *)v22 + 146) = v25;
            *((double *)v22 + 148) = v23 + *((double *)v22 + 148);
            ++*((_DWORD *)v22 + 298);
          }
        }
      }
      self->_lastFacePoseTimestampUs = a6;
      objc_sync_exit(self);
    }
  }
}

- (unint64_t)_getAuxSampleTimestamp:(const void *)a3 currentTime:(double)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (*((_DWORD *)a3 + 27) == 2)
  {
    unint64_t v7 = (unint64_t)(*((double *)a3 + 8) * 1000000.0);
    if (self->_lastAudioAccessorySample.timeSyncStatus != 2)
    {
      unint64_t v8 = sub_19058C3D4((uint64_t)&self->_unsyncedAuxHelper, *((void *)a3 + 7), self->_lastSourceTimestampMicroSeconds);
      sub_1904AC5B0((uint64_t)&self->_unsyncedAuxHelper, 1);
      if (qword_1E929D8D8 != -1) {
        dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
      }
      float v9 = (float)((float)v7 - (float)v8) * 0.001;
      float v10 = qword_1E929D8E0;
      if (os_log_type_enabled((os_log_t)qword_1E929D8E0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)float64x2_t buf = 134217984;
        double v33 = v9;
        _os_log_impl(&dword_1902AF000, v10, OS_LOG_TYPE_DEFAULT, "[CMMediaSession]  Timesync: Switching to use time-synced timestamp. diffMilliSeconds = %f", buf, 0xCu);
      }
      if (sub_1902D8400(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1E929D8D8 != -1) {
          dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
        }
        float v26 = (char *)_os_log_send_and_compose_impl();
        sub_1902D398C("Generic", 1, 0, 2, "-[CMMediaSession _getAuxSampleTimestamp:currentTime:]", "CoreLocation: %s\n", v26);
        if (v26 != (char *)buf) {
          free(v26);
        }
      }
      float v11 = -v9;
      if (v9 >= 0.0) {
        float v11 = v9;
      }
      if (v11 > 60.0)
      {
        if (qword_1E929D8D8 != -1) {
          dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
        }
        long long v12 = qword_1E929D8E0;
        if (os_log_type_enabled((os_log_t)qword_1E929D8E0, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)float64x2_t buf = 134217984;
          double v33 = v9;
          _os_log_impl(&dword_1902AF000, v12, OS_LOG_TYPE_ERROR, "[CMMediaSession]  Timesync: large discrepency (imeSynced - unTimesynced). MS = %f", buf, 0xCu);
        }
        if (sub_1902D8400(115, 0))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1E929D8D8 != -1) {
            dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
          }
          int v29 = (char *)_os_log_send_and_compose_impl();
          sub_1902D398C("Generic", 1, 0, 0, "-[CMMediaSession _getAuxSampleTimestamp:currentTime:]", "CoreLocation: %s\n", v29);
          if (v29 != (char *)buf) {
            free(v29);
          }
        }
      }
      double v13 = a4 - self->_firstAccessoryDMTime;
      if (qword_1E929D8D8 != -1) {
        dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
      }
      float v14 = v13;
      unsigned int v15 = qword_1E929D8E0;
      if (os_log_type_enabled((os_log_t)qword_1E929D8E0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)float64x2_t buf = 134217984;
        double v33 = v14;
        _os_log_impl(&dword_1902AF000, v15, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] Timesync: First timesynced sample received after %.3f seconds", buf, 0xCu);
      }
      if (sub_1902D8400(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1E929D8D8 != -1) {
          dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
        }
        uint64_t v27 = (char *)_os_log_send_and_compose_impl();
        sub_1902D398C("Generic", 1, 0, 2, "-[CMMediaSession _getAuxSampleTimestamp:currentTime:]", "CoreLocation: %s\n", v27);
        if (v27 != (char *)buf) {
          free(v27);
        }
      }
      if (v14 > 10.0)
      {
        if (qword_1E929D8D8 != -1) {
          dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
        }
        float v16 = qword_1E929D8E0;
        if (os_log_type_enabled((os_log_t)qword_1E929D8E0, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)float64x2_t buf = 134217984;
          double v33 = v14;
          _os_log_impl(&dword_1902AF000, v16, OS_LOG_TYPE_ERROR, "[CMMediaSession]  Timesync: timesync arrived very late, gap %.3f seconds", buf, 0xCu);
        }
        if (sub_1902D8400(115, 0))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1E929D8D8 != -1) {
            dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
          }
          double v30 = (char *)_os_log_send_and_compose_impl();
          sub_1902D398C("Generic", 1, 0, 0, "-[CMMediaSession _getAuxSampleTimestamp:currentTime:]", "CoreLocation: %s\n", v30);
          if (v30 != (char *)buf) {
            free(v30);
          }
        }
      }
      if (self->_lastTimesyncLostTime > 0.0)
      {
        uint64_t v17 = mach_continuous_time();
        double v18 = sub_1902D8D34(v17);
        double lastTimesyncLostTime = self->_lastTimesyncLostTime;
        if (qword_1E929D8D8 != -1) {
          dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
        }
        double v20 = v18 - lastTimesyncLostTime;
        unint64_t v21 = qword_1E929D8E0;
        if (os_log_type_enabled((os_log_t)qword_1E929D8E0, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)float64x2_t buf = 134217984;
          double v33 = v20;
          _os_log_impl(&dword_1902AF000, v21, OS_LOG_TYPE_DEFAULT, "[CMMediaSession]  Timesync: Experienced loss of timesync during session. gap = %f", buf, 0xCu);
        }
        if (sub_1902D8400(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1E929D8D8 != -1) {
            dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
          }
          double v31 = (char *)_os_log_send_and_compose_impl();
          sub_1902D398C("Generic", 1, 0, 2, "-[CMMediaSession _getAuxSampleTimestamp:currentTime:]", "CoreLocation: %s\n", v31);
          if (v31 != (char *)buf) {
            free(v31);
          }
        }
        self->_double lastTimesyncLostTime = 0.0;
      }
    }
  }
  else
  {
    if (qword_1E929D8D8 != -1) {
      dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
    }
    float v22 = qword_1E929D8E0;
    if (os_log_type_enabled((os_log_t)qword_1E929D8E0, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)float64x2_t buf = 0;
      _os_log_impl(&dword_1902AF000, v22, OS_LOG_TYPE_INFO, "[CMMediaSession] Timesync: Using unsynced timestamp.", buf, 2u);
    }
    if (sub_1902D8400(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D8D8 != -1) {
        dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
      }
      double v25 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "-[CMMediaSession _getAuxSampleTimestamp:currentTime:]", "CoreLocation: %s\n", v25);
      if (v25 != (char *)buf) {
        free(v25);
      }
    }
    unint64_t v7 = sub_19058C3D4((uint64_t)&self->_unsyncedAuxHelper, *((void *)a3 + 7), self->_lastSourceTimestampMicroSeconds);
    if (self->_lastAudioAccessorySample.timeSyncStatus == 2)
    {
      self->_double lastTimesyncLostTime = a4;
      if (qword_1E929D8D8 != -1) {
        dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
      }
      double v23 = qword_1E929D8E0;
      if (os_log_type_enabled((os_log_t)qword_1E929D8E0, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)float64x2_t buf = 0;
        _os_log_impl(&dword_1902AF000, v23, OS_LOG_TYPE_ERROR, "[CMMediaSession]  Timesync: Lost timesync in the middle of session. ", buf, 2u);
      }
      if (sub_1902D8400(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1E929D8D8 != -1) {
          dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
        }
        float32x4_t v28 = (char *)_os_log_send_and_compose_impl();
        sub_1902D398C("Generic", 1, 0, 0, "-[CMMediaSession _getAuxSampleTimestamp:currentTime:]", "CoreLocation: %s\n", v28);
        if (v28 != (char *)buf) {
          free(v28);
        }
      }
    }
  }
  return v7;
}

- (void)_feedAccessoryDeviceMotion:(const void *)a3
{
  uint64_t v294 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = mach_continuous_time();
  double v6 = sub_1902D8D34(v5);
  if (self->_firstAccessoryDMTime == 0.0)
  {
    self->_firstAccessoryDMTime = v6;
    if (qword_1E929D8D8 != -1) {
      dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
    }
    unint64_t v7 = qword_1E929D8E0;
    if (os_log_type_enabled((os_log_t)qword_1E929D8E0, OS_LOG_TYPE_DEFAULT))
    {
      double v8 = self->_firstAccessoryDMTime - self->_sessionStartTime;
      *(_DWORD *)float64x2_t buf = 134217984;
      *(double *)&uint8_t buf[4] = v8;
      _os_log_impl(&dword_1902AF000, v7, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] First accessory DM received after %.3f seconds", buf, 0xCu);
    }
    if (sub_1902D8400(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D8D8 != -1) {
        dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
      }
      double v241 = self->_firstAccessoryDMTime - self->_sessionStartTime;
      *(_DWORD *)v269 = 134217984;
      *(double *)&v269[4] = v241;
      v242 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "-[CMMediaSession _feedAccessoryDeviceMotion:]", "CoreLocation: %s\n", v242);
      if (v242 != buf) {
        free(v242);
      }
    }
    value = self->_analyticsTracker.__ptr_.__value_;
    if (value)
    {
      *((double *)value + 176) = self->_firstAccessoryDMTime - self->_sessionStartTime;
      sub_19050B3B0((double *)value + 32, @"auxGyroBiasConvergenceDuration");
    }
  }
  float v10 = self->_analyticsTracker.__ptr_.__value_;
  if (v10)
  {
    uint64_t v11 = 0;
    float v12 = *((float *)a3 + 7);
    if (v12 < 0.0) {
      float v12 = -v12;
    }
    do
    {
      float v13 = *(float *)((char *)a3 + v11 + 32);
      if (v13 < 0.0) {
        float v13 = -v13;
      }
      if (v13 > v12) {
        float v12 = v13;
      }
      v11 += 4;
    }
    while (v11 != 8);
    if (v12 < 0.000007 && *((double *)v10 + 32) > 0.0)
    {
      sub_19050B590((double *)v10 + 32, &stru_1EDFD5D50);
      float v10 = self->_analyticsTracker.__ptr_.__value_;
    }
    double v14 = v6 - self->_lastAccessoryDMTime;
    double v16 = *((double *)v10 + 54);
    double v15 = *((double *)v10 + 55);
    if (v15 <= v14) {
      double v15 = v6 - self->_lastAccessoryDMTime;
    }
    if (v16 >= v14) {
      double v16 = v6 - self->_lastAccessoryDMTime;
    }
    *((double *)v10 + 54) = v16;
    *((double *)v10 + 55) = v15;
    *((double *)v10 + 56) = v14 + *((double *)v10 + 56);
    ++*((_DWORD *)v10 + 114);
  }
  self->_lastAccessoryDMTime = v6;
  ++self->_accessorySamplesPerSecond;
  uint64_t fSize = self->_unsyncedAuxHelper.auxAndSrcSensorTimeOffsetBuffer.fHeadAndSize.fSize;
  fCapacitfloat y = self->_unsyncedAuxHelper.auxAndSrcSensorTimeOffsetBuffer.fCapacity;
  uint64_t fHead = self->_unsyncedAuxHelper.auxAndSrcSensorTimeOffsetBuffer.fHeadAndSize.fHead;
  if (fHead + fSize >= fCapacity) {
    uint64_t v20 = self->_unsyncedAuxHelper.auxAndSrcSensorTimeOffsetBuffer.fCapacity;
  }
  else {
    uint64_t v20 = 0;
  }
  *(double *)&self->_unsyncedAuxHelper.auxAndSrcSensorTimeOffsetBuffer.fBuffer[8 * (fHead + fSize - v20)] = *((double *)a3 + 9) + -0.0350000001 + (double)*((unint64_t *)a3 + 7) * -0.000001;
  if (fCapacity <= fSize)
  {
    if (fHead + 1 < fCapacity) {
      LOWORD(fCapacity) = 0;
    }
    self->_unsyncedAuxHelper.auxAndSrcSensorTimeOffsetBuffer.fHeadAndSize.uint64_t fHead = fHead + 1 - fCapacity;
  }
  else
  {
    self->_unsyncedAuxHelper.auxAndSrcSensorTimeOffsetBuffer.fHeadAndSize.uint64_t fSize = fSize + 1;
  }
  *(void *)v269 = *((void *)a3 + 2);
  *(_DWORD *)&v269[8] = *((_DWORD *)a3 + 6);
  float v21 = sub_1904CF514((float *)a3);
  float v23 = *((float *)a3 + 11) + v22;
  float v25 = v24 + *((float *)a3 + 12);
  float v270 = *((float *)a3 + 10) + v21;
  float v271 = v23;
  float v272 = v25;
  uint64_t v273 = *((void *)a3 + 10);
  int v274 = *((_DWORD *)a3 + 22);
  uint64_t v275 = *(void *)((char *)a3 + 28);
  int v26 = *((_DWORD *)a3 + 24);
  int v276 = *((_DWORD *)a3 + 9);
  int v277 = v26;
  int v278 = *((_DWORD *)a3 + 23);
  CMOQuaternion v279 = *(CMOQuaternion *)a3;
  unint64_t AuxSampleTimestamp_currentTime = objc_msgSend__getAuxSampleTimestamp_currentTime_(self, v27, (uint64_t)a3, v6);
  objc_sync_enter(self);
  int v29 = self->_headTrackingService.__ptr_.__value_;
  if (*((_DWORD *)v29 + 10) == 1)
  {
    if (self->_simulateCameraOnOffRequest)
    {
      if (self->_requestingCameraOn)
      {
LABEL_66:
        LOBYTE(v30) = 1;
LABEL_67:
        self->_requestingCameraOuint64_t n = (char)v30;
        int v29 = self->_headTrackingService.__ptr_.__value_;
        int v45 = *((unsigned __int8 *)v29 + 27520);
        if (*((unsigned char *)v29 + 27520) && !*((_DWORD *)v29 + 6884)) {
          *((void *)v29 + 3443) = AuxSampleTimestamp_currentTime;
        }
        *((_DWORD *)v29 + 6884) = v45;
        goto LABEL_71;
      }
    }
    else
    {
      LODWORD(v30) = *((unsigned __int8 *)v29 + 27520);
      if (self->_requestingCameraOn == v30) {
        goto LABEL_67;
      }
      if (!*((unsigned char *)v29 + 27520))
      {
        double v30 = self->_analyticsTracker.__ptr_.__value_;
        if (v30)
        {
          if (*((double *)v30 + 48) > 0.0) {
            sub_19050B590((double *)v30 + 48, &stru_1EDFD5D50);
          }
          LOBYTE(v30) = 0;
        }
        goto LABEL_67;
      }
    }
    unint64_t lastRequestingCameraTimestampUs = self->_lastRequestingCameraTimestampUs;
    if (lastRequestingCameraTimestampUs)
    {
      double v32 = self->_analyticsTracker.__ptr_.__value_;
      if (!v32) {
        goto LABEL_65;
      }
      float v33 = (double)(AuxSampleTimestamp_currentTime - lastRequestingCameraTimestampUs) * 0.000001;
      double v34 = v33;
      double v35 = *((double *)v32 + 127);
      if (v35 <= v34) {
        double v35 = v34;
      }
      *((double *)v32 + 127) = v35;
      double v36 = *((double *)v32 + 126);
      if (v36 >= v34) {
        double v36 = v34;
      }
      *((double *)v32 + 126) = v36;
      *((double *)v32 + 128) = *((double *)v32 + 128) + v34;
      ++*((_DWORD *)v32 + 258);
      sub_19050B3B0((double *)v32 + 48, @"cameraOnDuration");
    }
    else
    {
      double sessionStartTime = self->_sessionStartTime;
      if (qword_1E929D8D8 != -1) {
        dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
      }
      double v38 = v6 - sessionStartTime;
      double v39 = qword_1E929D8E0;
      if (os_log_type_enabled((os_log_t)qword_1E929D8E0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)float64x2_t buf = 134349056;
        *(double *)&uint8_t buf[4] = v38;
        _os_log_impl(&dword_1902AF000, v39, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] Requested first face pose anchor.timeToFirstFacePoseRequestInSessionSeconds: %{public}.1f s", buf, 0xCu);
      }
      if (sub_1902D8400(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1E929D8D8 != -1) {
          dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
        }
        *(_DWORD *)v293 = 134349056;
        *(double *)&v293[4] = v38;
        v259 = (char *)_os_log_send_and_compose_impl();
        sub_1902D398C("Generic", 1, 0, 2, "-[CMMediaSession _feedAccessoryDeviceMotion:]", "CoreLocation: %s\n", v259);
        if (v259 != buf) {
          free(v259);
        }
      }
    }
    double v40 = self->_analyticsTracker.__ptr_.__value_;
    if (v40)
    {
      int v41 = *((_DWORD *)v40 + 330);
      if (v41 != -1) {
        *((_DWORD *)v40 + 330) = v41 + 1;
      }
      double v42 = self->_headTrackingService.__ptr_.__value_;
      if (*((unsigned char *)v42 + 27533))
      {
        int v43 = *((_DWORD *)v40 + 335);
        if (v43 != -1)
        {
          int v44 = (_DWORD *)((char *)v40 + 1340);
LABEL_64:
          _DWORD *v44 = v43 + 1;
        }
      }
      else
      {
        if (!*((unsigned char *)v42 + 27532))
        {
          int v240 = *((unsigned __int8 *)v42 + 16036);
          if (v240 == 2)
          {
            int v43 = *((_DWORD *)v40 + 339);
            if (v43 == -1) {
              goto LABEL_65;
            }
            int v44 = (_DWORD *)((char *)v40 + 1356);
          }
          else if (v240 == 3)
          {
            int v43 = *((_DWORD *)v40 + 337);
            if (v43 == -1) {
              goto LABEL_65;
            }
            int v44 = (_DWORD *)((char *)v40 + 1348);
          }
          else
          {
            int v43 = *((_DWORD *)v40 + 338);
            if (v43 == -1) {
              goto LABEL_65;
            }
            int v44 = (_DWORD *)((char *)v40 + 1352);
          }
          goto LABEL_64;
        }
        int v43 = *((_DWORD *)v40 + 336);
        if (v43 != -1)
        {
          int v44 = (_DWORD *)((char *)v40 + 1344);
          goto LABEL_64;
        }
      }
    }
LABEL_65:
    self->_unint64_t lastRequestingCameraTimestampUs = AuxSampleTimestamp_currentTime;
    self->_firstFacePoseInCameraRequestTimestampUs = 0;
    goto LABEL_66;
  }
LABEL_71:
  if ((*((_WORD *)a3 + 26) & 0x100) != 0)
  {
    if (sub_190511C10((uint64_t)v29 + 37528, v269, AuxSampleTimestamp_currentTime))
    {
      sub_1905124D0((uint64_t)v29 + 37528, (uint64_t)buf);
      unint64_t v48 = sub_1905126DC((uint64_t)v29 + 37528);
      if (*((void *)v29 + 4689))
      {
        *(_OWORD *)v293 = *(_OWORD *)sub_190479348((uint64_t)v29 + 64);
        sub_19047B020();
      }
      else
      {
        uint64_t v49 = *((void *)v29 + 4690);
        if (v49) {
          sub_19044913C(v49, (float32x2_t *)buf, (double)v48 * 0.000001);
        }
      }
      if (*((unsigned char *)v29 + 37504))
      {
        uint64_t v50 = *((void *)v29 + 4687);
        if (v50)
        {
          memset(v293, 0, 44);
          *(_DWORD *)&v293[44] = 1065353216;
          sub_1902D9ACC((float32x4_t *)&v293[32], (float32x4_t)0);
          *(double *)v293 = (double)v48 / 1000000.0;
          *(void *)&v293[8] = *(void *)buf;
          *(_DWORD *)&v293[16] = *(_DWORD *)&buf[8];
          float v51 = sub_1904CF514((float *)&v285[4]);
          *(float *)&v293[20] = *(float *)&buf[12] - v51;
          *(float *)&v293[24] = *(float *)&buf[16] - v52;
          *(float *)&v293[28] = *(float *)&buf[20] - v53;
          *(_OWORD *)&v293[32] = *(_OWORD *)&v285[4];
          sub_1904CA660(v50, (uint64_t)v293, *(float32x4_t *)&v285[4]);
        }
      }
      sub_190544C40((uint64_t)v29, (uint64_t)buf, v48);
    }
    sub_1904FC6BC((uint64_t)v29, (float32x2_t *)v269, AuxSampleTimestamp_currentTime);
  }
  else
  {
    if (*((unsigned char *)v29 + 16064)) {
      sub_1904F86F0((uint64_t)v29, 1);
    }
    if (qword_1E929D8D8 != -1) {
      dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
    }
    int v46 = qword_1E929D8E0;
    if (os_log_type_enabled((os_log_t)qword_1E929D8E0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)float64x2_t buf = 0;
      _os_log_impl(&dword_1902AF000, v46, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] Not feeding AuxDM due to uninitialized DM status.", buf, 2u);
    }
    if (sub_1902D8400(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D8D8 != -1) {
        dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
      }
      *(_WORD *)v293 = 0;
      double v47 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "-[CMMediaSession _feedAccessoryDeviceMotion:]", "CoreLocation: %s\n", v47);
      if (v47 != buf) {
        free(v47);
      }
    }
  }
  if (self->_logForReplay)
  {
    sub_190456160((uint64_t *)self->_logger.__ptr_.__value_, (int *)a3);
    long long v54 = self->_headTrackingService.__ptr_.__value_;
    if (*((unsigned char *)v54 + 16064))
    {
      *(_DWORD *)&v293[8] = *((_DWORD *)v54 + 4019);
      *(void *)v293 = *(void *)((char *)v54 + 16068);
      if (*((unsigned char *)v54 + 16056)) {
        long long v55 = (_OWORD *)((char *)v54 + 16108);
      }
      else {
        long long v55 = (_OWORD *)((char *)v54 + 16092);
      }
      *(_OWORD *)&v293[12] = *v55;
      v268.i64[0] = 0;
      v268.i64[1] = 0x3F80000000000000;
      uint64_t v264 = 0;
      uint64_t v265 = 0;
      sub_19050179C((uint64_t)v54, &v268, (float *)&v266, &v265, &v264);
      long long v56 = self->_headTrackingService.__ptr_.__value_;
      *(void *)float64x2_t buf = v265;
      *(void *)&buf[8] = v264;
      *(void *)&buf[16] = v266;
      uint64_t v281 = *(void *)v293;
      *(_DWORD *)&unsigned char buf[24] = v267;
      int v282 = *(_DWORD *)&v293[8];
      uint64_t v283 = *((void *)v54 + 2010);
      int v284 = *((_DWORD *)v54 + 4022);
      *(_OWORD *)v285 = *(_OWORD *)&v293[12];
      v285[16] = *((unsigned char *)v56 + 16040);
      v285[17] = *((unsigned char *)v56 + 16056);
      v57.f64[0] = *((float64_t *)v56 + 1996);
      v57.f64[1] = *((float64_t *)v56 + 1998);
      float32x4_t v286 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*((float64x2_t *)v56 + 997)), v57);
      char v287 = *((unsigned char *)v56 + 46);
      char v288 = *((unsigned char *)v56 + 27520);
      char v289 = *((unsigned char *)v56 + 16059);
      char v290 = *((unsigned char *)v56 + 16058);
      int v291 = *(_DWORD *)v56;
      int v292 = *((unsigned __int8 *)v56 + 4);
      sub_190457868((uint64_t *)self->_logger.__ptr_.__value_, (uint64_t)buf);
    }
  }
  objc_sync_exit(self);
  if (&self->_lastAudioAccessorySample != a3) {
    self->_lastAudioAccessorySample.auxDM.quaterniouint64_t n = *(CMOQuaternion *)a3;
  }
  self->_lastAudioAccessorySample.auxDM.rotationRate.elements[0] = *((float *)a3 + 4);
  self->_lastAudioAccessorySample.auxDM.rotationRate.elements[1] = *((float *)a3 + 5);
  self->_lastAudioAccessorySample.auxDM.rotationRate.elements[2] = *((float *)a3 + 6);
  self->_lastAudioAccessorySample.auxDM.biasCovariance.elements[0] = *((float *)a3 + 7);
  self->_lastAudioAccessorySample.auxDM.biasCovariance.elements[1] = *((float *)a3 + 8);
  self->_lastAudioAccessorySample.auxDM.biasCovariance.elements[2] = *((float *)a3 + 9);
  self->_lastAudioAccessorySample.auxDM.userAcceleration.elements[0] = *((float *)a3 + 10);
  self->_lastAudioAccessorySample.auxDM.userAcceleration.elements[1] = *((float *)a3 + 11);
  self->_lastAudioAccessorySample.auxDM.userAcceleration.elements[2] = *((float *)a3 + 12);
  self->_lastAudioAccessorySample.auxDM.status.bits = *((_WORD *)a3 + 26);
  long long v58 = *(_OWORD *)((char *)a3 + 56);
  self->_lastAudioAccessorySample.arrivalTimestamp = *((double *)a3 + 9);
  *(_OWORD *)&self->_lastAudioAccessorySample.sensorTime = v58;
  self->_lastAudioAccessorySample.filteredAcceleration.elements[0] = *((float *)a3 + 20);
  self->_lastAudioAccessorySample.filteredAcceleration.elements[1] = *((float *)a3 + 21);
  self->_lastAudioAccessorySample.filteredAcceleration.elements[2] = *((float *)a3 + 22);
  float32x4_t v59 = *(float32x4_t *)((char *)a3 + 92);
  long long v60 = *(_OWORD *)((char *)a3 + 108);
  long long v61 = *(_OWORD *)((char *)a3 + 124);
  *(_DWORD *)&self->_lastAudioAccessorySample.isGyroBiasValid = *((_DWORD *)a3 + 35);
  *(_OWORD *)&self->_lastAudioAccessorySample.timeSyncStatus = v60;
  *(_OWORD *)((char *)&self->_lastAudioAccessorySample.sampleLatency + 4) = v61;
  *(float32x4_t *)&self->_lastAudioAccessorySample.quiescentNoise = v59;
  __int16 v62 = self->_analyticsTracker.__ptr_.__value_;
  if (v62)
  {
    uint64_t v63 = self->_headTrackingService.__ptr_.__value_;
    double v64 = *((double *)v62 + 87);
    double v65 = *((double *)v62 + 86);
    double v66 = 0.0;
    if (*((void *)v63 + 676) == AuxSampleTimestamp_currentTime) {
      double v66 = 1.0;
    }
    if (v64 <= v66) {
      double v64 = v66;
    }
    if (v65 >= v66) {
      double v65 = v66;
    }
    *((double *)v62 + 87) = v64;
    *((double *)v62 + 86) = v65;
    *((double *)v62 + 88) = v66 + *((double *)v62 + 88);
    ++*((_DWORD *)v62 + 178);
    int v67 = *((unsigned __int8 *)v63 + 16040);
    if (self->_previousBTZState != v67)
    {
      uint64_t v68 = (double *)((char *)v62 + 16);
      if (v67)
      {
        sub_19050B3B0(v68, @"BTZDuration");
        uint64_t v69 = self->_analyticsTracker.__ptr_.__value_;
        *(double *)v59.i64 = v6 - self->_lastInBTZTime;
        double v71 = *((double *)v69 + 58);
        double v70 = *((double *)v69 + 59);
        if (v70 <= *(double *)v59.i64) {
          double v70 = v6 - self->_lastInBTZTime;
        }
        if (v71 >= *(double *)v59.i64) {
          double v71 = v6 - self->_lastInBTZTime;
        }
        *((double *)v69 + 58) = v71;
        *((double *)v69 + 59) = v70;
        *((double *)v69 + 60) = *(double *)v59.i64 + *((double *)v69 + 60);
        ++*((_DWORD *)v69 + 122);
        float lastAngleBetweenCurrentBoresightToDefault = self->_lastAngleBetweenCurrentBoresightToDefault;
        if (lastAngleBetweenCurrentBoresightToDefault < 0.0) {
          float lastAngleBetweenCurrentBoresightToDefault = -lastAngleBetweenCurrentBoresightToDefault;
        }
        double v73 = lastAngleBetweenCurrentBoresightToDefault;
        double v74 = *((double *)v69 + 83);
        if (v74 <= v73) {
          double v74 = v73;
        }
        *((double *)v69 + 83) = v74;
        double v75 = *((double *)v69 + 82);
        if (v75 >= v73) {
          double v75 = v73;
        }
        *((double *)v69 + 82) = v75;
        *((double *)v69 + 84) = *((double *)v69 + 84) + v73;
        ++*((_DWORD *)v69 + 170);
      }
      else
      {
        if (*v68 > 0.0) {
          sub_19050B590(v68, &stru_1EDFD5D50);
        }
        self->_lastInBTZTime = v6;
      }
      uint64_t v63 = self->_headTrackingService.__ptr_.__value_;
      self->_previousBTZState = *((unsigned __int8 *)v63 + 16040);
    }
    int v76 = *((unsigned __int8 *)v63 + 16059);
    if (self->_previousCTState != v76)
    {
      if (*((unsigned char *)v63 + 16059))
      {
        int v77 = self->_analyticsTracker.__ptr_.__value_;
        int v78 = *((_DWORD *)v77 + 308);
        if (v78 != -1) {
          *((_DWORD *)v77 + 308) = v78 + 1;
        }
        float v79 = self->_lastAngleBetweenCurrentBoresightToDefault;
        if (v79 < 0.0) {
          float v79 = -v79;
        }
        *(double *)v59.i64 = v79;
        double v80 = *((double *)v77 + 67);
        if (v80 <= *(double *)v59.i64) {
          double v80 = *(double *)v59.i64;
        }
        *((double *)v77 + 67) = v80;
        double v81 = *((double *)v77 + 66);
        if (v81 >= *(double *)v59.i64) {
          double v81 = *(double *)v59.i64;
        }
        *((double *)v77 + 66) = v81;
        *(double *)v59.i64 = *((double *)v77 + 68) + *(double *)v59.i64;
        *((void *)v77 + 68) = v59.i64[0];
        ++*((_DWORD *)v77 + 138);
        v82.f32[0] = sub_1905016D4((float32x2_t *)v63, v59);
        BOOL v83 = v82.f32[0] < 0.0;
        p_headTrackingService = (float32x2_t **)&self->_headTrackingService;
        v85.f32[0] = sub_1905016D4((float32x2_t *)self->_headTrackingService.__ptr_.__value_, v82);
        if (v83) {
          v85.f32[0] = -v85.f32[0];
        }
        *(double *)v85.i64 = v85.f32[0];
        double v86 = *((double *)v77 + 71);
        if (v86 <= *(double *)v85.i64) {
          double v86 = *(double *)v85.i64;
        }
        *((double *)v77 + 71) = v86;
        double v87 = *((double *)v77 + 70);
        if (v87 >= *(double *)v85.i64) {
          double v87 = *(double *)v85.i64;
        }
        *((double *)v77 + 70) = v87;
        *(double *)v85.i64 = *((double *)v77 + 72) + *(double *)v85.i64;
        *((void *)v77 + 72) = v85.i64[0];
        ++*((_DWORD *)v77 + 146);
        int v88 = self->_analyticsTracker.__ptr_.__value_;
        v89.f32[0] = sub_190501738(*p_headTrackingService, v85);
        BOOL v90 = v89.f32[0] < 0.0;
        float v91 = sub_190501738(*p_headTrackingService, v89);
        if (v90) {
          float v91 = -v91;
        }
        double v92 = v91;
        double v93 = *((double *)v88 + 75);
        if (v93 <= v92) {
          double v93 = v92;
        }
        *((double *)v88 + 75) = v93;
        double v94 = *((double *)v88 + 74);
        if (v94 >= v92) {
          double v94 = v92;
        }
        *((double *)v88 + 74) = v94;
        *((double *)v88 + 76) = *((double *)v88 + 76) + v92;
        ++*((_DWORD *)v88 + 154);
        sub_19050B3B0((double *)self->_analyticsTracker.__ptr_.__value_ + 16, @"CTDuration");
        if ((*p_headTrackingService)[2007].i8[0])
        {
          v95 = self->_analyticsTracker.__ptr_.__value_;
          int v96 = *((_DWORD *)v95 + 309);
          if (v96 != -1) {
            *((_DWORD *)v95 + 309) = v96 + 1;
          }
          sub_19050B3B0((double *)v95 + 18, @"CTDurationIn1IMU");
        }
        int previousMotionActivityType = self->_previousMotionActivityType;
        if (previousMotionActivityType > 51)
        {
          if (previousMotionActivityType == 52 || previousMotionActivityType == 56) {
            goto LABEL_166;
          }
        }
        else
        {
          if (!previousMotionActivityType)
          {
LABEL_174:
            if (self->_lastExitCTTime > 0.0)
            {
              v106 = self->_analyticsTracker.__ptr_.__value_;
              uint64_t v107 = mach_continuous_time();
              double v108 = sub_1902D8D34(v107) - self->_lastExitCTTime;
              double v110 = *((double *)v106 + 62);
              double v109 = *((double *)v106 + 63);
              if (v109 <= v108) {
                double v109 = v108;
              }
              if (v110 >= v108) {
                double v110 = v108;
              }
              *((double *)v106 + 62) = v110;
              *((double *)v106 + 63) = v109;
              *((double *)v106 + 64) = v108 + *((double *)v106 + 64);
              ++*((_DWORD *)v106 + 130);
              self->_lastExitCTTime = 0.0;
            }
            goto LABEL_180;
          }
          if (previousMotionActivityType == 5) {
            goto LABEL_166;
          }
        }
        if ((previousMotionActivityType & 0xFFFFFFFE) != 0xA)
        {
LABEL_169:
          if (previousMotionActivityType <= 0x29
            && ((1 << previousMotionActivityType) & 0x20000000110) != 0)
          {
            v104 = self->_analyticsTracker.__ptr_.__value_;
            int v105 = *((_DWORD *)v104 + 311);
            if (v105 != -1) {
              *((_DWORD *)v104 + 311) = v105 + 1;
            }
            sub_19050B3B0((double *)v104 + 22, @"CTDurationInPedestrian");
          }
          goto LABEL_174;
        }
LABEL_166:
        uint64_t v102 = self->_analyticsTracker.__ptr_.__value_;
        int v103 = *((_DWORD *)v102 + 310);
        if (v103 != -1) {
          *((_DWORD *)v102 + 310) = v103 + 1;
        }
        sub_19050B3B0((double *)v102 + 20, @"CTDurationInVehicle");
        int previousMotionActivityType = self->_previousMotionActivityType;
        goto LABEL_169;
      }
      uint64_t v98 = mach_continuous_time();
      self->_lastExitCTTime = sub_1902D8D34(v98);
      uint64_t v99 = self->_analyticsTracker.__ptr_.__value_;
      if (*((double *)v99 + 16) > 0.0)
      {
        sub_19050B590((double *)v99 + 16, &stru_1EDFD5D50);
        uint64_t v99 = self->_analyticsTracker.__ptr_.__value_;
      }
      if (*((double *)v99 + 18) > 0.0)
      {
        sub_19050B590((double *)v99 + 18, &stru_1EDFD5D50);
        uint64_t v99 = self->_analyticsTracker.__ptr_.__value_;
      }
      if (*((double *)v99 + 20) > 0.0)
      {
        sub_19050B590((double *)v99 + 20, &stru_1EDFD5D50);
        uint64_t v99 = self->_analyticsTracker.__ptr_.__value_;
      }
      double v101 = *((double *)v99 + 22);
      int v100 = (double *)((char *)v99 + 176);
      if (v101 > 0.0) {
        sub_19050B590(v100, &stru_1EDFD5D50);
      }
    }
LABEL_180:
    self->_previousCTState = v76;
    v111 = self->_headTrackingService.__ptr_.__value_;
    if (*((unsigned char *)v111 + 27552))
    {
      if (self->_previousCTBodyTurnState == *((unsigned __int8 *)v111 + 33405)) {
        goto LABEL_200;
      }
      v112 = (double *)((char *)self->_analyticsTracker.__ptr_.__value_ + 352);
      if (*((unsigned char *)v111 + 33405))
      {
        sub_19050B3B0(v112, @"CTBodyTurnDuration");
        if (qword_1E929D8D8 != -1) {
          dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
        }
        uint64_t v113 = qword_1E929D8E0;
        if (os_log_type_enabled((os_log_t)qword_1E929D8E0, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)float64x2_t buf = 0;
          _os_log_impl(&dword_1902AF000, v113, OS_LOG_TYPE_INFO, "[CMMediaSession] Entering CT body turn state.", buf, 2u);
        }
        if (sub_1902D8400(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1E929D8D8 != -1) {
            dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
          }
          *(_WORD *)v293 = 0;
          v253 = (char *)_os_log_send_and_compose_impl();
          sub_1902D398C("Generic", 1, 0, 2, "-[CMMediaSession _feedAccessoryDeviceMotion:]", "CoreLocation: %s\n", v253);
          if (v253 != buf) {
            free(v253);
          }
        }
        BOOL v114 = 1;
LABEL_199:
        self->_previousCTBodyTurnState = v114;
        v111 = self->_headTrackingService.__ptr_.__value_;
LABEL_200:
        if (*((unsigned char *)v111 + 12176))
        {
          if (self->_previousHeadTurnState == *((unsigned __int8 *)v111 + 12208)) {
            goto LABEL_220;
          }
          v116 = (double *)((char *)self->_analyticsTracker.__ptr_.__value_ + 368);
          if (*((unsigned char *)v111 + 12208))
          {
            sub_19050B3B0(v116, @"HeadTurnDuration");
            if (qword_1E929D8D8 != -1) {
              dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
            }
            v117 = qword_1E929D8E0;
            if (os_log_type_enabled((os_log_t)qword_1E929D8E0, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)float64x2_t buf = 0;
              _os_log_impl(&dword_1902AF000, v117, OS_LOG_TYPE_INFO, "[CMMediaSession] Entering head turn state.", buf, 2u);
            }
            if (sub_1902D8400(115, 2))
            {
              bzero(buf, 0x65CuLL);
              if (qword_1E929D8D8 != -1) {
                dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
              }
              *(_WORD *)v293 = 0;
              v254 = (char *)_os_log_send_and_compose_impl();
              sub_1902D398C("Generic", 1, 0, 2, "-[CMMediaSession _feedAccessoryDeviceMotion:]", "CoreLocation: %s\n", v254);
              if (v254 != buf) {
                free(v254);
              }
            }
            BOOL v118 = 1;
LABEL_219:
            self->_previousHeadTurnState = v118;
            v111 = self->_headTrackingService.__ptr_.__value_;
LABEL_220:
            if (self->_previousTracking1IMU == *((unsigned __int8 *)v111 + 16056)) {
              goto LABEL_240;
            }
            float v120 = (double *)((char *)self->_analyticsTracker.__ptr_.__value_ + 112);
            if (*((unsigned char *)v111 + 16056))
            {
              sub_19050B3B0(v120, @"in1IMUDuration");
              float v121 = self->_analyticsTracker.__ptr_.__value_;
              if (*((double *)v121 + 10) > 0.0)
              {
                sub_19050B590((double *)v121 + 10, &stru_1EDFD5D50);
                float v121 = self->_analyticsTracker.__ptr_.__value_;
              }
              double v123 = *((double *)v121 + 12);
              v122 = (double *)((char *)v121 + 96);
              if (v123 > 0.0) {
                sub_19050B590(v122, &stru_1EDFD5D50);
              }
              goto LABEL_236;
            }
            sub_19050B590(v120, @"in1IMUDuration");
            v124 = self->_analyticsTracker.__ptr_.__value_;
            double v126 = *((double *)v124 + 18);
            uint64_t v125 = (double *)((char *)v124 + 144);
            if (v126 > 0.0) {
              sub_19050B590(v125, &stru_1EDFD5D50);
            }
            int v127 = self->_previousMotionActivityType;
            if (v127 > 51)
            {
              if (v127 != 52 && v127 != 56)
              {
LABEL_234:
                if ((v127 & 0xFFFFFFFE) != 0xA)
                {
                  if (v127 <= 0x29 && ((1 << v127) & 0x20000000110) != 0) {
                    sub_19050B3B0((double *)self->_analyticsTracker.__ptr_.__value_ + 12, @"srcPedestrian2IMUDuration");
                  }
                  goto LABEL_236;
                }
              }
            }
            else
            {
              if (!v127) {
                goto LABEL_236;
              }
              if (v127 != 5) {
                goto LABEL_234;
              }
            }
            sub_19050B3B0((double *)self->_analyticsTracker.__ptr_.__value_ + 10, @"inVehicle2IMUDuration");
LABEL_236:
            if (self->_previousTracking1IMU != -1)
            {
              float v128 = self->_analyticsTracker.__ptr_.__value_;
              int v129 = *((_DWORD *)v128 + 312);
              if (v129 != -1) {
                *((_DWORD *)v128 + 312) = v129 + 1;
              }
            }
            v111 = self->_headTrackingService.__ptr_.__value_;
            self->_previousTracking1IMU = *((unsigned __int8 *)v111 + 16056);
LABEL_240:
            char v130 = *((unsigned char *)v111 + 16058);
            if (self->_previousTrackingEnabled)
            {
              if (*((unsigned char *)v111 + 16058))
              {
                sub_19050B590((double *)self->_analyticsTracker.__ptr_.__value_ + 42, @"durationOfSessionHeadtracked");
                double lastDistractedViewingEndTime = self->_lastDistractedViewingEndTime;
                if (lastDistractedViewingEndTime > 0.0)
                {
                  int v133 = self->_analyticsTracker.__ptr_.__value_;
                  double v134 = v6 - lastDistractedViewingEndTime;
                  double v135 = *((double *)v133 + 123);
                  if (v135 <= v134) {
                    double v135 = v134;
                  }
                  *((double *)v133 + 123) = v135;
                  double v136 = *((double *)v133 + 122);
                  if (v136 >= v134) {
                    double v136 = v134;
                  }
                  *((double *)v133 + 122) = v136;
                  *((double *)v133 + 124) = v134 + *((double *)v133 + 124);
                  ++*((_DWORD *)v133 + 250);
                }
                unsigned int v137 = *(_DWORD *)(*((void *)self->_headTrackingService.__ptr_.__value_ + 4686) + 112);
                objc_msgSend_enterDistractedViewingSession_(self->_mcSession, v131, v137);
                switch(v137)
                {
                  case 3u:
                    v138 = self->_analyticsTracker.__ptr_.__value_;
                    int v149 = *((_DWORD *)v138 + 325);
                    if (v149 != -1) {
                      *((_DWORD *)v138 + 325) = v149 + 1;
                    }
                    break;
                  case 2u:
                    v147 = self->_analyticsTracker.__ptr_.__value_;
                    int v148 = *((_DWORD *)v147 + 326);
                    if (v148 != -1) {
                      *((_DWORD *)v147 + 326) = v148 + 1;
                    }
                    sub_19050B3B0((double *)v147 + 40, @"durationOfSessionDisabledDueToJBL");
                    goto LABEL_277;
                  case 1u:
                    v138 = self->_analyticsTracker.__ptr_.__value_;
                    int v139 = *((_DWORD *)v138 + 324);
                    if (v139 != -1) {
                      *((_DWORD *)v138 + 324) = v139 + 1;
                    }
                    break;
                  default:
                    if (qword_1E929D8D8 != -1) {
                      dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
                    }
                    v150 = qword_1E929D8E0;
                    if (os_log_type_enabled((os_log_t)qword_1E929D8E0, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)float64x2_t buf = 67240192;
                      *(_DWORD *)&uint8_t buf[4] = v137;
                      _os_log_impl(&dword_1902AF000, v150, OS_LOG_TYPE_ERROR, "[CMMediaSession] CALogger received invalid disable route: %{public}d", buf, 8u);
                    }
                    if (sub_1902D8400(115, 0))
                    {
                      bzero(buf, 0x65CuLL);
                      if (qword_1E929D8D8 != -1) {
                        dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
                      }
                      *(_DWORD *)v293 = 67240192;
                      *(_DWORD *)&v293[4] = v137;
                      v260 = (char *)_os_log_send_and_compose_impl();
                      sub_1902D398C("Generic", 1, 0, 0, "-[CMMediaSession _feedAccessoryDeviceMotion:]", "CoreLocation: %s\n", v260);
                      if (v260 != buf) {
                        free(v260);
                      }
                    }
                    goto LABEL_277;
                }
                sub_19050B3B0((double *)v138 + 38, @"durationOfSessionDisabledDueToWalking");
LABEL_277:
                self->_lastTrackingDisableRoute = v137;
                uint64_t v151 = 304;
LABEL_307:
                *(double *)((char *)&self->super.isa + v151) = v6;
                v111 = self->_headTrackingService.__ptr_.__value_;
                char v130 = *((unsigned char *)v111 + 16058);
              }
            }
            else
            {
              if (!*((unsigned char *)v111 + 16058))
              {
                sub_19050B3B0((double *)self->_analyticsTracker.__ptr_.__value_ + 42, @"durationOfSessionHeadtracked");
                double lastDistractedViewingStartTime = self->_lastDistractedViewingStartTime;
                v142 = self->_analyticsTracker.__ptr_.__value_;
                if (lastDistractedViewingStartTime > 0.0)
                {
                  double v143 = v6 - lastDistractedViewingStartTime;
                  double v144 = *((double *)v142 + 79);
                  if (v144 <= v143) {
                    double v144 = v143;
                  }
                  *((double *)v142 + 79) = v144;
                  double v145 = *((double *)v142 + 78);
                  if (v145 >= v143) {
                    double v145 = v143;
                  }
                  *((double *)v142 + 78) = v145;
                  *((double *)v142 + 80) = v143 + *((double *)v142 + 80);
                  ++*((_DWORD *)v142 + 162);
                }
                int v146 = *((_DWORD *)v142 + 313);
                if (v146 != -1) {
                  *((_DWORD *)v142 + 313) = v146 + 1;
                }
                switch(self->_lastTrackingDisableRoute)
                {
                  case 0:
                    if (qword_1E929D8D8 != -1) {
                      dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
                    }
                    v152 = qword_1E929D8E0;
                    if (os_log_type_enabled((os_log_t)qword_1E929D8E0, OS_LOG_TYPE_ERROR))
                    {
                      *(_WORD *)float64x2_t buf = 0;
                      _os_log_impl(&dword_1902AF000, v152, OS_LOG_TYPE_ERROR, "[CMMediaSession] We're ending an unknown disable route, something is wrong", buf, 2u);
                    }
                    if (sub_1902D8400(115, 0))
                    {
                      bzero(buf, 0x65CuLL);
                      if (qword_1E929D8D8 != -1) {
                        dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
                      }
                      *(_WORD *)v293 = 0;
                      uint64_t v153 = (char *)_os_log_send_and_compose_impl();
                      sub_1902D398C("Generic", 1, 0, 0, "-[CMMediaSession _feedAccessoryDeviceMotion:]", "CoreLocation: %s\n", v153);
                      if (v153 != buf) {
                        free(v153);
                      }
                    }
                    break;
                  case 1:
                  case 3:
                    sub_19050B590((double *)v142 + 38, @"durationOfSessionDisabledDueToWalking");
                    break;
                  case 2:
                    sub_19050B590((double *)v142 + 40, @"durationOfSessionDisabledDueToJBL");
                    break;
                  default:
                    break;
                }
                unsigned int v154 = *(_DWORD *)(*((void *)self->_headTrackingService.__ptr_.__value_ + 4686) + 108);
                objc_msgSend_exitDistractedViewingSession_(self->_mcSession, v140, v154);
                switch(v154)
                {
                  case 1u:
                    uint64_t v155 = self->_analyticsTracker.__ptr_.__value_;
                    int v156 = *((_DWORD *)v155 + 314);
                    if (v156 != -1) {
                      *((_DWORD *)v155 + 314) = v156 + 1;
                    }
                    break;
                  case 2u:
                    int v163 = self->_analyticsTracker.__ptr_.__value_;
                    int v164 = *((_DWORD *)v163 + 315);
                    if (v164 != -1) {
                      *((_DWORD *)v163 + 315) = v164 + 1;
                    }
                    break;
                  case 3u:
                    v159 = self->_analyticsTracker.__ptr_.__value_;
                    int v160 = *((_DWORD *)v159 + 316);
                    if (v160 != -1) {
                      *((_DWORD *)v159 + 316) = v160 + 1;
                    }
                    break;
                  case 4u:
                    char v161 = self->_analyticsTracker.__ptr_.__value_;
                    int v162 = *((_DWORD *)v161 + 317);
                    if (v162 != -1) {
                      *((_DWORD *)v161 + 317) = v162 + 1;
                    }
                    break;
                  case 5u:
                    v157 = self->_analyticsTracker.__ptr_.__value_;
                    int v158 = *((_DWORD *)v157 + 318);
                    if (v158 != -1) {
                      *((_DWORD *)v157 + 318) = v158 + 1;
                    }
                    break;
                  case 6u:
                    float32x4_t v165 = self->_analyticsTracker.__ptr_.__value_;
                    int v166 = *((_DWORD *)v165 + 319);
                    if (v166 != -1) {
                      *((_DWORD *)v165 + 319) = v166 + 1;
                    }
                    break;
                  default:
                    if (qword_1E929D8D8 != -1) {
                      dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
                    }
                    uint64_t v167 = qword_1E929D8E0;
                    if (os_log_type_enabled((os_log_t)qword_1E929D8E0, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)float64x2_t buf = 67240192;
                      *(_DWORD *)&uint8_t buf[4] = v154;
                      _os_log_impl(&dword_1902AF000, v167, OS_LOG_TYPE_ERROR, "[CMMediaSession] CALogger received invalid re-enable route: %{public}d", buf, 8u);
                    }
                    if (sub_1902D8400(115, 0))
                    {
                      bzero(buf, 0x65CuLL);
                      if (qword_1E929D8D8 != -1) {
                        dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
                      }
                      *(_DWORD *)v293 = 67240192;
                      *(_DWORD *)&v293[4] = v154;
                      v263 = (char *)_os_log_send_and_compose_impl();
                      sub_1902D398C("Generic", 1, 0, 0, "-[CMMediaSession _feedAccessoryDeviceMotion:]", "CoreLocation: %s\n", v263);
                      if (v263 != buf) {
                        free(v263);
                      }
                    }
                    break;
                }
                uint64_t v151 = 312;
                goto LABEL_307;
              }
              char v130 = 1;
            }
            self->_previousTrackingEnabled = v130 ^ 1;
            if (!self->_previousSrcMoving)
            {
              if (!*((_DWORD *)v111 + 1328)) {
                goto LABEL_313;
              }
              float v168 = 0.0;
              for (uint64_t i = 1316; i != 1319; ++i)
                float v168 = v168 + (float)(*((float *)v111 + i) * *((float *)v111 + i));
              if (sqrtf(v168) > 0.34907)
              {
LABEL_313:
                if (qword_1E929D8D8 != -1) {
                  dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
                }
                int v170 = qword_1E929D8E0;
                if (os_log_type_enabled((os_log_t)qword_1E929D8E0, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)float64x2_t buf = 0;
                  _os_log_impl(&dword_1902AF000, v170, OS_LOG_TYPE_INFO, "[CMMediaSession] Src started moving", buf, 2u);
                }
                if (sub_1902D8400(115, 2))
                {
                  bzero(buf, 0x65CuLL);
                  if (qword_1E929D8D8 != -1) {
                    dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
                  }
                  *(_WORD *)v293 = 0;
                  v251 = (char *)_os_log_send_and_compose_impl();
                  sub_1902D398C("Generic", 1, 0, 2, "-[CMMediaSession _feedAccessoryDeviceMotion:]", "CoreLocation: %s\n", v251);
                  if (v251 != buf) {
                    free(v251);
                  }
                }
                sub_19050B3B0((double *)self->_analyticsTracker.__ptr_.__value_ + 26, @"srcMoving");
                if (*((double *)self->_analyticsTracker.__ptr_.__value_ + 30) > 0.0) {
                  sub_19050B590((double *)self->_analyticsTracker.__ptr_.__value_ + 30, &stru_1EDFD5D50);
                }
                v111 = self->_headTrackingService.__ptr_.__value_;
                if (!*((_DWORD *)v111 + 1346)) {
                  goto LABEL_324;
                }
                float v171 = 0.0;
                for (uint64_t j = 1334; j != 1337; ++j)
                  float v171 = v171 + (float)(*((float *)v111 + j) * *((float *)v111 + j));
                if (sqrtf(v171) > 0.34907)
                {
LABEL_324:
                  if (qword_1E929D8D8 != -1) {
                    dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
                  }
                  double v173 = qword_1E929D8E0;
                  if (os_log_type_enabled((os_log_t)qword_1E929D8E0, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)float64x2_t buf = 0;
                    _os_log_impl(&dword_1902AF000, v173, OS_LOG_TYPE_INFO, "[CMMediaSession] Aux and src started moving", buf, 2u);
                  }
                  if (sub_1902D8400(115, 2))
                  {
                    bzero(buf, 0x65CuLL);
                    if (qword_1E929D8D8 != -1) {
                      dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
                    }
                    *(_WORD *)v293 = 0;
                    v257 = (char *)_os_log_send_and_compose_impl();
                    sub_1902D398C("Generic", 1, 0, 2, "-[CMMediaSession _feedAccessoryDeviceMotion:]", "CoreLocation: %s\n", v257);
                    if (v257 != buf) {
                      free(v257);
                    }
                  }
                  sub_19050B3B0((double *)self->_analyticsTracker.__ptr_.__value_ + 28, @"auxAndSrcMoving");
                  v111 = self->_headTrackingService.__ptr_.__value_;
                }
              }
            }
            if (!self->_previousAuxMoving)
            {
              if (!*((_DWORD *)v111 + 1346)) {
                goto LABEL_335;
              }
              float v174 = 0.0;
              for (uint64_t k = 1334; k != 1337; ++k)
                float v174 = v174 + (float)(*((float *)v111 + k) * *((float *)v111 + k));
              if (sqrtf(v174) > 0.34907)
              {
LABEL_335:
                if (qword_1E929D8D8 != -1) {
                  dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
                }
                float v176 = qword_1E929D8E0;
                if (os_log_type_enabled((os_log_t)qword_1E929D8E0, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)float64x2_t buf = 0;
                  _os_log_impl(&dword_1902AF000, v176, OS_LOG_TYPE_INFO, "[CMMediaSession] Aux started moving", buf, 2u);
                }
                if (sub_1902D8400(115, 2))
                {
                  bzero(buf, 0x65CuLL);
                  if (qword_1E929D8D8 != -1) {
                    dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
                  }
                  *(_WORD *)v293 = 0;
                  v252 = (char *)_os_log_send_and_compose_impl();
                  sub_1902D398C("Generic", 1, 0, 2, "-[CMMediaSession _feedAccessoryDeviceMotion:]", "CoreLocation: %s\n", v252);
                  if (v252 != buf) {
                    free(v252);
                  }
                }
                sub_19050B3B0((double *)self->_analyticsTracker.__ptr_.__value_ + 24, @"auxMoving");
                if (*((double *)self->_analyticsTracker.__ptr_.__value_ + 30) > 0.0) {
                  sub_19050B590((double *)self->_analyticsTracker.__ptr_.__value_ + 30, &stru_1EDFD5D50);
                }
                v111 = self->_headTrackingService.__ptr_.__value_;
                if (!*((_DWORD *)v111 + 1328)) {
                  goto LABEL_346;
                }
                float v177 = 0.0;
                for (uint64_t m = 1316; m != 1319; ++m)
                  float v177 = v177 + (float)(*((float *)v111 + m) * *((float *)v111 + m));
                if (sqrtf(v177) > 0.34907)
                {
LABEL_346:
                  if (qword_1E929D8D8 != -1) {
                    dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
                  }
                  long long v179 = qword_1E929D8E0;
                  if (os_log_type_enabled((os_log_t)qword_1E929D8E0, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)float64x2_t buf = 0;
                    _os_log_impl(&dword_1902AF000, v179, OS_LOG_TYPE_INFO, "[CMMediaSession] Aux and src started moving", buf, 2u);
                  }
                  if (sub_1902D8400(115, 2))
                  {
                    bzero(buf, 0x65CuLL);
                    if (qword_1E929D8D8 != -1) {
                      dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
                    }
                    *(_WORD *)v293 = 0;
                    v258 = (char *)_os_log_send_and_compose_impl();
                    sub_1902D398C("Generic", 1, 0, 2, "-[CMMediaSession _feedAccessoryDeviceMotion:]", "CoreLocation: %s\n", v258);
                    if (v258 != buf) {
                      free(v258);
                    }
                  }
                  sub_19050B3B0((double *)self->_analyticsTracker.__ptr_.__value_ + 28, @"auxAndSrcMoving");
                  v111 = self->_headTrackingService.__ptr_.__value_;
                }
              }
            }
            if (self->_previousSrcMoving)
            {
              if (*((_DWORD *)v111 + 1328))
              {
                float v180 = 0.0;
                for (uint64_t n = 1316; n != 1319; ++n)
                  float v180 = v180 + (float)(*((float *)v111 + n) * *((float *)v111 + n));
                if (sqrtf(v180) <= 0.34907)
                {
                  if (qword_1E929D8D8 != -1) {
                    dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
                  }
                  long long v182 = qword_1E929D8E0;
                  if (os_log_type_enabled((os_log_t)qword_1E929D8E0, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)float64x2_t buf = 0;
                    _os_log_impl(&dword_1902AF000, v182, OS_LOG_TYPE_INFO, "[CMMediaSession] Src stopped moving", buf, 2u);
                  }
                  if (sub_1902D8400(115, 2))
                  {
                    bzero(buf, 0x65CuLL);
                    if (qword_1E929D8D8 != -1) {
                      dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
                    }
                    *(_WORD *)v293 = 0;
                    v255 = (char *)_os_log_send_and_compose_impl();
                    sub_1902D398C("Generic", 1, 0, 2, "-[CMMediaSession _feedAccessoryDeviceMotion:]", "CoreLocation: %s\n", v255);
                    if (v255 != buf) {
                      free(v255);
                    }
                  }
                  sub_19050B590((double *)self->_analyticsTracker.__ptr_.__value_ + 26, @"srcMoving");
                  if (*((double *)self->_analyticsTracker.__ptr_.__value_ + 28) > 0.0) {
                    sub_19050B590((double *)self->_analyticsTracker.__ptr_.__value_ + 28, &stru_1EDFD5D50);
                  }
                  v111 = self->_headTrackingService.__ptr_.__value_;
                  if (*((_DWORD *)v111 + 1346))
                  {
                    float v183 = 0.0;
                    for (iuint64_t i = 1334; ii != 1337; ++ii)
                      float v183 = v183 + (float)(*((float *)v111 + ii) * *((float *)v111 + ii));
                    if (sqrtf(v183) <= 0.34907)
                    {
                      if (qword_1E929D8D8 != -1) {
                        dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
                      }
                      uint64_t v185 = qword_1E929D8E0;
                      if (os_log_type_enabled((os_log_t)qword_1E929D8E0, OS_LOG_TYPE_INFO))
                      {
                        *(_WORD *)float64x2_t buf = 0;
                        _os_log_impl(&dword_1902AF000, v185, OS_LOG_TYPE_INFO, "[CMMediaSession] Aux and src entered quiescence", buf, 2u);
                      }
                      if (sub_1902D8400(115, 2))
                      {
                        bzero(buf, 0x65CuLL);
                        if (qword_1E929D8D8 != -1) {
                          dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
                        }
                        *(_WORD *)v293 = 0;
                        v261 = (char *)_os_log_send_and_compose_impl();
                        sub_1902D398C("Generic", 1, 0, 2, "-[CMMediaSession _feedAccessoryDeviceMotion:]", "CoreLocation: %s\n", v261);
                        if (v261 != buf) {
                          free(v261);
                        }
                      }
                      sub_19050B3B0((double *)self->_analyticsTracker.__ptr_.__value_ + 30, @"auxAndSrcQuiescent");
                      v111 = self->_headTrackingService.__ptr_.__value_;
                    }
                  }
                }
              }
            }
            if (self->_previousAuxMoving)
            {
              if (*((_DWORD *)v111 + 1346))
              {
                float v186 = 0.0;
                for (juint64_t j = 1334; jj != 1337; ++jj)
                  float v186 = v186 + (float)(*((float *)v111 + jj) * *((float *)v111 + jj));
                if (sqrtf(v186) <= 0.34907)
                {
                  if (qword_1E929D8D8 != -1) {
                    dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
                  }
                  v188 = qword_1E929D8E0;
                  if (os_log_type_enabled((os_log_t)qword_1E929D8E0, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)float64x2_t buf = 0;
                    _os_log_impl(&dword_1902AF000, v188, OS_LOG_TYPE_INFO, "[CMMediaSession] Aux stopped moving", buf, 2u);
                  }
                  if (sub_1902D8400(115, 2))
                  {
                    bzero(buf, 0x65CuLL);
                    if (qword_1E929D8D8 != -1) {
                      dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
                    }
                    *(_WORD *)v293 = 0;
                    v256 = (char *)_os_log_send_and_compose_impl();
                    sub_1902D398C("Generic", 1, 0, 2, "-[CMMediaSession _feedAccessoryDeviceMotion:]", "CoreLocation: %s\n", v256);
                    if (v256 != buf) {
                      free(v256);
                    }
                  }
                  sub_19050B590((double *)self->_analyticsTracker.__ptr_.__value_ + 24, @"auxMoving");
                  if (*((double *)self->_analyticsTracker.__ptr_.__value_ + 28) > 0.0) {
                    sub_19050B590((double *)self->_analyticsTracker.__ptr_.__value_ + 28, &stru_1EDFD5D50);
                  }
                  v111 = self->_headTrackingService.__ptr_.__value_;
                  if (*((_DWORD *)v111 + 1328))
                  {
                    float v189 = 0.0;
                    for (kuint64_t k = 1316; kk != 1319; ++kk)
                      float v189 = v189 + (float)(*((float *)v111 + kk) * *((float *)v111 + kk));
                    if (sqrtf(v189) <= 0.34907)
                    {
                      if (qword_1E929D8D8 != -1) {
                        dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
                      }
                      v191 = qword_1E929D8E0;
                      if (os_log_type_enabled((os_log_t)qword_1E929D8E0, OS_LOG_TYPE_INFO))
                      {
                        *(_WORD *)float64x2_t buf = 0;
                        _os_log_impl(&dword_1902AF000, v191, OS_LOG_TYPE_INFO, "[CMMediaSession] Aux and src entered quiescence", buf, 2u);
                      }
                      if (sub_1902D8400(115, 2))
                      {
                        bzero(buf, 0x65CuLL);
                        if (qword_1E929D8D8 != -1) {
                          dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
                        }
                        *(_WORD *)v293 = 0;
                        v262 = (char *)_os_log_send_and_compose_impl();
                        sub_1902D398C("Generic", 1, 0, 2, "-[CMMediaSession _feedAccessoryDeviceMotion:]", "CoreLocation: %s\n", v262);
                        if (v262 != buf) {
                          free(v262);
                        }
                      }
                      sub_19050B3B0((double *)self->_analyticsTracker.__ptr_.__value_ + 30, @"auxAndSrcQuiescent");
                      v111 = self->_headTrackingService.__ptr_.__value_;
                    }
                  }
                }
              }
            }
            if (*((unsigned char *)v111 + 4))
            {
              int v192 = *((unsigned __int8 *)v111 + 37449);
              BOOL v193 = *((unsigned char *)v111 + 37449) != 0;
              previousSteadyStatePedestriauint64_t n = self->_previousSteadyStatePedestrian;
              if (v192 && !self->_previousSteadyStatePedestrian)
              {
                if (qword_1E929D8D8 != -1) {
                  dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
                }
                v195 = qword_1E929D8E0;
                if (os_log_type_enabled((os_log_t)qword_1E929D8E0, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)float64x2_t buf = 0;
                  _os_log_impl(&dword_1902AF000, v195, OS_LOG_TYPE_INFO, "[CMMediaSession] entering steadyStatePedestrian", buf, 2u);
                }
                if (sub_1902D8400(115, 2))
                {
                  bzero(buf, 0x65CuLL);
                  if (qword_1E929D8D8 != -1) {
                    dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
                  }
                  *(_WORD *)v293 = 0;
                  v249 = (char *)_os_log_send_and_compose_impl();
                  sub_1902D398C("Generic", 1, 0, 2, "-[CMMediaSession _feedAccessoryDeviceMotion:]", "CoreLocation: %s\n", v249);
                  if (v249 != buf) {
                    free(v249);
                  }
                }
                sub_19050B3B0((double *)self->_analyticsTracker.__ptr_.__value_ + 34, @"steadyStatePedestrianDuration");
                LOBYTE(v192) = 1;
                goto LABEL_427;
              }
            }
            else
            {
              LOBYTE(v192) = 0;
              BOOL v193 = 0;
              previousSteadyStatePedestriauint64_t n = self->_previousSteadyStatePedestrian;
            }
            if (!v193 && previousSteadyStatePedestrian)
            {
              if (qword_1E929D8D8 != -1) {
                dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
              }
              v196 = qword_1E929D8E0;
              if (os_log_type_enabled((os_log_t)qword_1E929D8E0, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)float64x2_t buf = 0;
                _os_log_impl(&dword_1902AF000, v196, OS_LOG_TYPE_INFO, "[CMMediaSession] leaving steadyStatePedestrian", buf, 2u);
              }
              if (sub_1902D8400(115, 2))
              {
                bzero(buf, 0x65CuLL);
                if (qword_1E929D8D8 != -1) {
                  dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
                }
                *(_WORD *)v293 = 0;
                v245 = (char *)_os_log_send_and_compose_impl();
                sub_1902D398C("Generic", 1, 0, 2, "-[CMMediaSession _feedAccessoryDeviceMotion:]", "CoreLocation: %s\n", v245);
                if (v245 != buf) {
                  free(v245);
                }
              }
              sub_19050B590((double *)self->_analyticsTracker.__ptr_.__value_ + 34, @"steadyStatePedestrianDuration");
              if (*((double *)self->_analyticsTracker.__ptr_.__value_ + 44) > 0.0) {
                sub_19050B590((double *)self->_analyticsTracker.__ptr_.__value_ + 44, &stru_1EDFD5D50);
              }
              if (qword_1E929D8D8 != -1) {
                dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
              }
              v197 = qword_1E929D8E0;
              if (os_log_type_enabled((os_log_t)qword_1E929D8E0, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)float64x2_t buf = 0;
                _os_log_impl(&dword_1902AF000, v197, OS_LOG_TYPE_INFO, "[CMMediaSession] Exiting CT body turn state due to leaving steadyStatePedestrian.", buf, 2u);
              }
              if (sub_1902D8400(115, 2))
              {
                bzero(buf, 0x65CuLL);
                if (qword_1E929D8D8 != -1) {
                  dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
                }
                *(_WORD *)v293 = 0;
                v247 = (char *)_os_log_send_and_compose_impl();
                sub_1902D398C("Generic", 1, 0, 2, "-[CMMediaSession _feedAccessoryDeviceMotion:]", "CoreLocation: %s\n", v247);
                if (v247 != buf) {
                  free(v247);
                }
              }
              v198 = self->_analyticsTracker.__ptr_.__value_;
              if (*((double *)v198 + 46) > 0.0) {
                sub_19050B590((double *)v198 + 46, &stru_1EDFD5D50);
              }
              if (qword_1E929D8D8 != -1) {
                dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
              }
              v199 = qword_1E929D8E0;
              if (os_log_type_enabled((os_log_t)qword_1E929D8E0, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)float64x2_t buf = 0;
                _os_log_impl(&dword_1902AF000, v199, OS_LOG_TYPE_INFO, "[CMMediaSession] Exiting head turn state due to leaving steadyStatePedestrian.", buf, 2u);
              }
              if (sub_1902D8400(115, 2))
              {
                bzero(buf, 0x65CuLL);
                if (qword_1E929D8D8 != -1) {
                  dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
                }
                *(_WORD *)v293 = 0;
                v248 = (char *)_os_log_send_and_compose_impl();
                sub_1902D398C("Generic", 1, 0, 2, "-[CMMediaSession _feedAccessoryDeviceMotion:]", "CoreLocation: %s\n", v248);
                if (v248 != buf) {
                  free(v248);
                }
              }
            }
LABEL_427:
            v200 = self->_headTrackingService.__ptr_.__value_;
            char v201 = *((unsigned char *)v200 + 4);
            if (v201)
            {
              int v202 = *((unsigned __int8 *)v200 + 37464);
              char v201 = *((unsigned char *)v200 + 37464) != 0;
              BOOL previousKeepBoresightCentered = self->_previousKeepBoresightCentered;
              if (v202) {
                BOOL v204 = !previousKeepBoresightCentered;
              }
              else {
                BOOL v204 = 0;
              }
              if (v204)
              {
                if (qword_1E929D8D8 != -1) {
                  dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
                }
                v205 = qword_1E929D8E0;
                if (os_log_type_enabled((os_log_t)qword_1E929D8E0, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)float64x2_t buf = 0;
                  _os_log_impl(&dword_1902AF000, v205, OS_LOG_TYPE_INFO, "[CMMediaSession] entering keepBoresightCentered state.", buf, 2u);
                }
                if (sub_1902D8400(115, 2))
                {
                  bzero(buf, 0x65CuLL);
                  if (qword_1E929D8D8 != -1) {
                    dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
                  }
                  *(_WORD *)v293 = 0;
                  v250 = (char *)_os_log_send_and_compose_impl();
                  sub_1902D398C("Generic", 1, 0, 2, "-[CMMediaSession _feedAccessoryDeviceMotion:]", "CoreLocation: %s\n", v250);
                  if (v250 != buf) {
                    free(v250);
                  }
                }
                v206 = self->_analyticsTracker.__ptr_.__value_;
                int v207 = *((_DWORD *)v206 + 327);
                if (v207 != -1) {
                  *((_DWORD *)v206 + 327) = v207 + 1;
                }
                sub_19050B3B0((double *)v206 + 36, @"keepBoresightCenteredDueToDynamicsDuration");
                sub_19050B590((double *)self->_analyticsTracker.__ptr_.__value_ + 42, @"durationOfSessionHeadtracked");
                LOBYTE(v202) = 1;
                goto LABEL_450;
              }
            }
            else
            {
              LOBYTE(v202) = 0;
              BOOL previousKeepBoresightCentered = self->_previousKeepBoresightCentered;
            }
            if ((v201 & 1) == 0 && previousKeepBoresightCentered)
            {
              if (qword_1E929D8D8 != -1) {
                dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
              }
              v208 = qword_1E929D8E0;
              if (os_log_type_enabled((os_log_t)qword_1E929D8E0, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)float64x2_t buf = 0;
                _os_log_impl(&dword_1902AF000, v208, OS_LOG_TYPE_INFO, "[CMMediaSession] leaving keepBoresightCentered state.", buf, 2u);
              }
              if (sub_1902D8400(115, 2))
              {
                bzero(buf, 0x65CuLL);
                if (qword_1E929D8D8 != -1) {
                  dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
                }
                *(_WORD *)v293 = 0;
                v246 = (char *)_os_log_send_and_compose_impl();
                sub_1902D398C("Generic", 1, 0, 2, "-[CMMediaSession _feedAccessoryDeviceMotion:]", "CoreLocation: %s\n", v246);
                if (v246 != buf) {
                  free(v246);
                }
              }
              sub_19050B590((double *)self->_analyticsTracker.__ptr_.__value_ + 36, @"keepBoresightCenteredDueToDynamicsDuration");
              sub_19050B3B0((double *)self->_analyticsTracker.__ptr_.__value_ + 42, @"durationOfSessionHeadtracked");
            }
LABEL_450:
            v209 = self->_headTrackingService.__ptr_.__value_;
            if (*((_DWORD *)v209 + 1346))
            {
              uint64_t v210 = 0;
              float v211 = 0.0;
              do
              {
                float v211 = v211 + (float)(*(float *)((char *)v209 + v210 + 5336) * *(float *)((char *)v209 + v210 + 5336));
                v210 += 4;
              }
              while (v210 != 12);
              BOOL v212 = sqrtf(v211) > 0.34907;
            }
            else
            {
              BOOL v212 = 1;
            }
            self->_previousAuxMoving = v212;
            if (*((_DWORD *)v209 + 1328))
            {
              uint64_t v213 = 0;
              float v214 = 0.0;
              do
              {
                float v214 = v214 + (float)(*(float *)((char *)v209 + v213 + 5264) * *(float *)((char *)v209 + v213 + 5264));
                v213 += 4;
              }
              while (v213 != 12);
              BOOL v215 = sqrtf(v214) > 0.34907;
            }
            else
            {
              BOOL v215 = 1;
            }
            self->_previousSrcMoving = v215;
            self->_previousSteadyStatePedestriauint64_t n = v192;
            self->_BOOL previousKeepBoresightCentered = v202;
            uint64_t v216 = (uint64_t)v209 + 64;
            *(void *)float64x2_t buf = *(void *)((char *)v209 + 16068);
            *(_DWORD *)&buf[8] = *((_DWORD *)v209 + 4019);
            int v217 = *((unsigned __int8 *)v209 + 16056);
            v218 = (_OWORD *)((char *)v209 + 16108);
            v219 = (_OWORD *)((char *)v209 + 16092);
            if (v217) {
              v219 = v218;
            }
            *(_OWORD *)&unsigned char buf[12] = *v219;
            *(_DWORD *)float64x2_t buf = sub_1904778D0(v216, (float *)buf, (float32x2_t *)&buf[12]);
            *(_DWORD *)&uint8_t buf[4] = v220;
            *(_DWORD *)&buf[8] = v221;
            self->_float lastAngleBetweenCurrentBoresightToDefault = sub_19058AD48((float *)buf);
            v222 = self->_headTrackingService.__ptr_.__value_;
            unint64_t v223 = *((void *)v222 + 2003);
            if (v223)
            {
              float v224 = *((float *)v222 + 4008);
              if (v224 > 0.0)
              {
                unint64_t lastResetCamControllerTimersTimestampUs = self->_lastResetCamControllerTimersTimestampUs;
                if (lastResetCamControllerTimersTimestampUs)
                {
                  BOOL v226 = v223 >= lastResetCamControllerTimersTimestampUs;
                  unint64_t v227 = v223 - lastResetCamControllerTimersTimestampUs;
                  if (v227 != 0 && v226)
                  {
                    float v228 = (float)v227 * 0.000001;
                    float v229 = v228 - v224;
                    v230 = self->_analyticsTracker.__ptr_.__value_;
                    double v231 = v228;
                    double v232 = *((double *)v230 + 135);
                    if (v232 <= v231) {
                      double v232 = v231;
                    }
                    *((double *)v230 + 135) = v232;
                    double v233 = *((double *)v230 + 134);
                    if (v233 >= v231) {
                      double v233 = v231;
                    }
                    *((double *)v230 + 134) = v233;
                    *((double *)v230 + 136) = *((double *)v230 + 136) + v231;
                    ++*((_DWORD *)v230 + 274);
                    double v234 = v229;
                    double v235 = *((double *)v230 + 139);
                    if (v235 <= v234) {
                      double v235 = v234;
                    }
                    *((double *)v230 + 139) = v235;
                    double v236 = *((double *)v230 + 138);
                    if (v236 >= v234) {
                      double v236 = v234;
                    }
                    *((double *)v230 + 138) = v236;
                    *((double *)v230 + 140) = *((double *)v230 + 140) + v234;
                    ++*((_DWORD *)v230 + 282);
                    double v237 = v224;
                    double v238 = *((double *)v230 + 143);
                    if (v238 <= v237) {
                      double v238 = v237;
                    }
                    *((double *)v230 + 143) = v238;
                    double v239 = *((double *)v230 + 142);
                    if (v239 >= v237) {
                      double v239 = v237;
                    }
                    *((double *)v230 + 142) = v239;
                    *((double *)v230 + 144) = *((double *)v230 + 144) + v237;
                    ++*((_DWORD *)v230 + 290);
                  }
                }
                self->_unint64_t lastResetCamControllerTimersTimestampUs = v223;
              }
            }
            return;
          }
        }
        else
        {
          if (!self->_previousHeadTurnState) {
            goto LABEL_220;
          }
          v116 = (double *)((char *)self->_analyticsTracker.__ptr_.__value_ + 368);
        }
        if (*v116 > 0.0) {
          sub_19050B590(v116, &stru_1EDFD5D50);
        }
        if (qword_1E929D8D8 != -1) {
          dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
        }
        uint64_t v119 = qword_1E929D8E0;
        if (os_log_type_enabled((os_log_t)qword_1E929D8E0, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)float64x2_t buf = 0;
          _os_log_impl(&dword_1902AF000, v119, OS_LOG_TYPE_INFO, "[CMMediaSession] Exiting head turn state.", buf, 2u);
        }
        if (sub_1902D8400(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1E929D8D8 != -1) {
            dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
          }
          *(_WORD *)v293 = 0;
          v244 = (char *)_os_log_send_and_compose_impl();
          sub_1902D398C("Generic", 1, 0, 2, "-[CMMediaSession _feedAccessoryDeviceMotion:]", "CoreLocation: %s\n", v244);
          if (v244 != buf) {
            free(v244);
          }
        }
        BOOL v118 = 0;
        goto LABEL_219;
      }
    }
    else
    {
      if (!self->_previousCTBodyTurnState) {
        goto LABEL_200;
      }
      v112 = (double *)((char *)self->_analyticsTracker.__ptr_.__value_ + 352);
    }
    if (*v112 > 0.0) {
      sub_19050B590(v112, &stru_1EDFD5D50);
    }
    if (qword_1E929D8D8 != -1) {
      dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
    }
    float v115 = qword_1E929D8E0;
    if (os_log_type_enabled((os_log_t)qword_1E929D8E0, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)float64x2_t buf = 0;
      _os_log_impl(&dword_1902AF000, v115, OS_LOG_TYPE_INFO, "[CMMediaSession] Exiting CT body turn state.", buf, 2u);
    }
    if (sub_1902D8400(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D8D8 != -1) {
        dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
      }
      *(_WORD *)v293 = 0;
      v243 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "-[CMMediaSession _feedAccessoryDeviceMotion:]", "CoreLocation: %s\n", v243);
      if (v243 != buf) {
        free(v243);
      }
    }
    BOOL v114 = 0;
    goto LABEL_199;
  }
}

- (void)_feedAccessoryConfig:(const void *)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  value = self->_analyticsTracker.__ptr_.__value_;
  if (value) {
    *((_DWORD *)value + 348) = *((_DWORD *)a3 + 14);
  }
  if (qword_1E929D8D8 != -1) {
    dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
  }
  double v6 = qword_1E929D8E0;
  if (os_log_type_enabled((os_log_t)qword_1E929D8E0, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v7 = (char *)a3 + 8;
    if (*((char *)a3 + 31) < 0) {
      unint64_t v7 = (void *)*v7;
    }
    int v8 = *(_DWORD *)a3;
    float v9 = (char *)a3 + 32;
    if (*((char *)a3 + 55) < 0) {
      float v9 = (void *)*v9;
    }
    int v10 = *((_DWORD *)a3 + 14);
    *(_DWORD *)float64x2_t buf = 67240963;
    *(_DWORD *)&uint8_t buf[4] = v8;
    *(_WORD *)&buf[8] = 2081;
    *(void *)&buf[10] = v7;
    __int16 v43 = 2081;
    int v44 = v9;
    __int16 v45 = 1026;
    int v46 = v10;
    _os_log_impl(&dword_1902AF000, v6, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] Received accessoryDeviceMotion config. side,%{public}d,configuration,%{private}s,serialNumber,%{private}s,hardwareModel,%{public}d", buf, 0x22u);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929D8D8 != -1) {
      dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
    }
    double v32 = (char *)a3 + 8;
    if (*((char *)a3 + 31) < 0) {
      double v32 = (void *)*v32;
    }
    int v33 = *(_DWORD *)a3;
    double v34 = (char *)a3 + 32;
    if (*((char *)a3 + 55) < 0) {
      double v34 = (void *)*v34;
    }
    int v35 = *((_DWORD *)a3 + 14);
    *(_DWORD *)double v37 = 67240963;
    *(_DWORD *)&v37[4] = v33;
    *(_WORD *)&v37[8] = 2081;
    *(void *)&v37[10] = v32;
    __int16 v38 = 2081;
    double v39 = v34;
    __int16 v40 = 1026;
    int v41 = v35;
    double v36 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CMMediaSession _feedAccessoryConfig:]", "CoreLocation: %s\n", v36);
    if (v36 != buf) {
      free(v36);
    }
  }
  objc_sync_enter(self);
  *(void *)double v37 = 0;
  *(void *)&v37[8] = 0x3F80000000000000;
  switch(*((_DWORD *)a3 + 14))
  {
    case 1:
      uint64_t v11 = self->_analyticsTracker.__ptr_.__value_;
      int v12 = *(_DWORD *)a3;
      if (v11) {
        *((_DWORD *)v11 + 349) = v12;
      }
      if (v12 == 2) {
        goto LABEL_55;
      }
      if (v12 == 1) {
        goto LABEL_28;
      }
      if (qword_1E929D8D8 != -1) {
        dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
      }
      float v13 = qword_1E929D8E0;
      if (os_log_type_enabled((os_log_t)qword_1E929D8E0, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)float64x2_t buf = 0;
        _os_log_impl(&dword_1902AF000, v13, OS_LOG_TYPE_ERROR, "[CMMediaSession] Error -- config side for kAccessoryHardwareModelB298 must be 1 or 2.", buf, 2u);
      }
      if (sub_1902D8400(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1E929D8D8 != -1) {
          goto LABEL_100;
        }
        goto LABEL_90;
      }
      goto LABEL_67;
    case 2:
      double v16 = &xmmword_1906098C0;
      goto LABEL_65;
    case 3:
      uint64_t v17 = self->_analyticsTracker.__ptr_.__value_;
      int v18 = *(_DWORD *)a3;
      if (v17) {
        *((_DWORD *)v17 + 349) = v18;
      }
      if (v18 == 2)
      {
        double v16 = &xmmword_1906098F0;
        goto LABEL_65;
      }
      if (v18 == 1)
      {
        double v16 = &xmmword_1906098E0;
        goto LABEL_65;
      }
      if (qword_1E929D8D8 != -1) {
        dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
      }
      int v29 = qword_1E929D8E0;
      if (os_log_type_enabled((os_log_t)qword_1E929D8E0, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)float64x2_t buf = 0;
        _os_log_impl(&dword_1902AF000, v29, OS_LOG_TYPE_ERROR, "[CMMediaSession] Error -- config side for kAccessoryHardwareModelB688 must be 1 or 2.", buf, 2u);
      }
      if (!sub_1902D8400(115, 0)) {
        goto LABEL_67;
      }
      bzero(buf, 0x65CuLL);
      if (qword_1E929D8D8 == -1) {
        goto LABEL_90;
      }
      goto LABEL_100;
    case 4:
      double v19 = self->_analyticsTracker.__ptr_.__value_;
      int v20 = *(_DWORD *)a3;
      if (v19) {
        *((_DWORD *)v19 + 349) = v20;
      }
      if (v20 == 2)
      {
        double v16 = &xmmword_190609910;
        goto LABEL_65;
      }
      if (v20 == 1)
      {
        double v16 = &xmmword_190609900;
        goto LABEL_65;
      }
      if (qword_1E929D8D8 != -1) {
        dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
      }
      double v30 = qword_1E929D8E0;
      if (os_log_type_enabled((os_log_t)qword_1E929D8E0, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)float64x2_t buf = 0;
        _os_log_impl(&dword_1902AF000, v30, OS_LOG_TYPE_ERROR, "[CMMediaSession] Error -- config side for kAccessoryHardwareModelB494 must be 1 or 2.", buf, 2u);
      }
      if (!sub_1902D8400(115, 0)) {
        goto LABEL_67;
      }
      bzero(buf, 0x65CuLL);
      if (qword_1E929D8D8 == -1) {
        goto LABEL_90;
      }
      goto LABEL_100;
    case 5:
      double v14 = self->_analyticsTracker.__ptr_.__value_;
      int v15 = *(_DWORD *)a3;
      if (v14) {
        *((_DWORD *)v14 + 349) = v15;
      }
      if (v15 == 2)
      {
LABEL_55:
        double v16 = &xmmword_190609930;
        goto LABEL_65;
      }
      if (v15 == 1)
      {
LABEL_28:
        double v16 = &xmmword_190609920;
LABEL_65:
        *(_OWORD *)float64x2_t buf = *v16;
        sub_1902D9ACC((float32x4_t *)buf, *(float32x4_t *)buf);
        *(_OWORD *)double v37 = *(_OWORD *)buf;
        goto LABEL_66;
      }
      if (qword_1E929D8D8 != -1) {
        dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
      }
      float32x4_t v28 = qword_1E929D8E0;
      if (os_log_type_enabled((os_log_t)qword_1E929D8E0, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)float64x2_t buf = 0;
        _os_log_impl(&dword_1902AF000, v28, OS_LOG_TYPE_ERROR, "[CMMediaSession] Error -- config side for kAccessoryHardwareModelB698 must be 1 or 2.", buf, 2u);
      }
      if (sub_1902D8400(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1E929D8D8 != -1) {
LABEL_100:
        }
          dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
LABEL_90:
        double v31 = (char *)_os_log_send_and_compose_impl();
        sub_1902D398C("Generic", 1, 0, 0, "-[CMMediaSession _feedAccessoryConfig:]", "CoreLocation: %s\n", v31);
        if (v31 != buf) {
          free(v31);
        }
      }
LABEL_67:
      if (self->_logForReplay) {
        sub_190458868((uint64_t *)self->_logger.__ptr_.__value_, (int *)a3);
      }
      objc_sync_exit(self);
      return;
    case 6:
      double v16 = &xmmword_1906098D0;
      goto LABEL_65;
    default:
      if (*((unsigned char *)a3 + 76))
      {
        float v21 = self->_analyticsTracker.__ptr_.__value_;
        if (v21) {
          *((_DWORD *)v21 + 349) = *(_DWORD *)a3;
        }
        if (v37 != (char *)a3 + 80) {
          *(_OWORD *)double v37 = *((_OWORD *)a3 + 5);
        }
        if (qword_1E929D8D8 != -1) {
          dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
        }
        float v22 = qword_1E929D8E0;
        if (os_log_type_enabled((os_log_t)qword_1E929D8E0, OS_LOG_TYPE_DEFAULT))
        {
          int v23 = *((_DWORD *)a3 + 14);
          *(_DWORD *)float64x2_t buf = 67240192;
          *(_DWORD *)&uint8_t buf[4] = v23;
          _os_log_impl(&dword_1902AF000, v22, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] Use the H2H transformation from IORegistry for model %{public}d", buf, 8u);
        }
        if (sub_1902D8400(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1E929D8D8 != -1) {
            dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
          }
          float v25 = (char *)_os_log_send_and_compose_impl();
          sub_1902D398C("Generic", 1, 0, 2, "-[CMMediaSession _feedAccessoryConfig:]", "CoreLocation: %s\n", v25);
          if (v25 != buf) {
            free(v25);
          }
        }
LABEL_66:
        objc_msgSend__setFixedTransforms_(self, v24, (uint64_t)v37);
        goto LABEL_67;
      }
      if (qword_1E929D8D8 != -1) {
        dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
      }
      int v26 = qword_1E929D8E0;
      if (os_log_type_enabled((os_log_t)qword_1E929D8E0, OS_LOG_TYPE_ERROR))
      {
        int v27 = *((_DWORD *)a3 + 14);
        *(_DWORD *)float64x2_t buf = 67240192;
        *(_DWORD *)&uint8_t buf[4] = v27;
        _os_log_impl(&dword_1902AF000, v26, OS_LOG_TYPE_ERROR, "[CMMediaSession] Error -- No H2H transformation for model %{public}d", buf, 8u);
      }
      if (!sub_1902D8400(115, 0)) {
        goto LABEL_67;
      }
      bzero(buf, 0x65CuLL);
      if (qword_1E929D8D8 != -1) {
        goto LABEL_100;
      }
      goto LABEL_90;
  }
}

- (void)_feedPredictorEstimates
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v20.i64[0] = 0;
  v20.i64[1] = 0x3F80000000000000;
  uint64_t v14 = 0;
  objc_sync_enter(self);
  unint64_t predictionIntervalMicroseconds = self->_predictionIntervalMicroseconds;
  uint64_t v16 = 0;
  unint64_t v17 = 0;
  char v15 = 0;
  uint64_t v14 = mach_absolute_time() + predictionIntervalMicroseconds;
  sub_190501A54((uint64_t)self->_headTrackingService.__ptr_.__value_, &v14, &v20, (uint64_t)&v18, (uint64_t *)&v17, &v16, &v15);
  unint64_t v4 = v17;
  if (self->_logForReplay)
  {
    *(void *)&long long buf = v17;
    *((void *)&buf + 1) = v14;
    uint64_t v24 = v16;
    uint64_t v25 = v18;
    int v26 = v19;
    char v27 = v15;
    sub_190457C1C((uint64_t *)self->_logger.__ptr_.__value_, (uint64_t)&buf);
  }
  objc_sync_exit(self);
  if (v4)
  {
    uint64_t v5 = mach_absolute_time();
    BOOL v6 = v5 > v4 + 500000;
    p_trackingEstimatesStagnated = &self->_trackingEstimatesStagnated;
    BOOL v8 = !self->_trackingEstimatesStagnated;
    if (!self->_trackingEstimatesStagnated && v5 > v4 + 500000)
    {
      BOOL *p_trackingEstimatesStagnated = 1;
      if (qword_1E929D8D8 != -1) {
        dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
      }
      float v9 = qword_1E929D8E0;
      if (os_log_type_enabled((os_log_t)qword_1E929D8E0, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1902AF000, v9, OS_LOG_TYPE_ERROR, "[CMMediaSession] Tracking stalled, likely due to data gap > 0.5s", (uint8_t *)&buf, 2u);
      }
      if (sub_1902D8400(115, 0))
      {
        bzero(&buf, 0x65CuLL);
        if (qword_1E929D8D8 != -1) {
          dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
        }
        LOWORD(v21) = 0;
        int v10 = (char *)_os_log_send_and_compose_impl();
        sub_1902D398C("Generic", 1, 0, 0, "-[CMMediaSession _feedPredictorEstimates]", "CoreLocation: %s\n", v10);
LABEL_26:
        if (v10 != (char *)&buf) {
          free(v10);
        }
        goto LABEL_22;
      }
      goto LABEL_22;
    }
  }
  else
  {
    BOOL v6 = 0;
    p_trackingEstimatesStagnated = &self->_trackingEstimatesStagnated;
    BOOL v8 = !self->_trackingEstimatesStagnated;
  }
  if (!v8 && !v6)
  {
    BOOL *p_trackingEstimatesStagnated = 0;
    if (qword_1E929D8D8 != -1) {
      dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
    }
    uint64_t v11 = qword_1E929D8E0;
    if (os_log_type_enabled((os_log_t)qword_1E929D8E0, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v12 = v4 - self->_lastStateTimestamp;
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = v12;
      _os_log_impl(&dword_1902AF000, v11, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] Tracking stagnation ended. Gap from last estimate: %llu", (uint8_t *)&buf, 0xCu);
    }
    if (sub_1902D8400(115, 2))
    {
      bzero(&buf, 0x65CuLL);
      if (qword_1E929D8D8 != -1) {
        dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
      }
      unint64_t v13 = v4 - self->_lastStateTimestamp;
      int v21 = 134217984;
      unint64_t v22 = v13;
      int v10 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "-[CMMediaSession _feedPredictorEstimates]", "CoreLocation: %s\n", v10);
      goto LABEL_26;
    }
  }
LABEL_22:
  self->_lastStateTimestamp = v4;
}

- (void)_feedAccessoryInEarStatus:(const int *)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (self->_inEarStatusGatingEnabled && *a3 != self->_inEarStatus)
  {
    objc_sync_enter(self);
    if (self->_logForReplay)
    {
      value = (uint64_t *)self->_logger.__ptr_.__value_;
      int v6 = *a3;
      uint64_t v7 = mach_continuous_time();
      double v8 = sub_1902D8D34(v7);
      sub_19045931C(value, v6, v8);
    }
    self->_inEarStatus = *a3;
    objc_sync_exit(self);
    uint64_t v9 = sub_1905298B4();
    int v10 = (void *)sub_1905D878C();
    if (sub_1905D9D8C(v10, *(void *)(v9 + 80)))
    {
      if (self->_inEarStatus == 4)
      {
        if (qword_1E929D8D8 != -1) {
          dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
        }
        uint64_t v11 = qword_1E929D8E0;
        if (os_log_type_enabled((os_log_t)qword_1E929D8E0, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_1902AF000, v11, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] Both buds are in ear. Resuming head tracking", buf, 2u);
        }
        if (sub_1902D8400(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1E929D8D8 != -1) {
            dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
          }
          __int16 v23 = 0;
          int v19 = (char *)_os_log_send_and_compose_impl();
          sub_1902D398C("Generic", 1, 0, 2, "-[CMMediaSession _feedAccessoryInEarStatus:]", "CoreLocation: %s\n", v19);
          if (v19 != (char *)buf) {
            free(v19);
          }
        }
        uint64_t v12 = sub_1902D6BD0();
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = sub_1904B6230;
        v22[3] = &unk_1E568D118;
        v22[4] = self;
        sub_1902CDE98(v12, (uint64_t)v22);
      }
      else
      {
        if (qword_1E929D8D8 != -1) {
          dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
        }
        char v15 = qword_1E929D8E0;
        if (os_log_type_enabled((os_log_t)qword_1E929D8E0, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_1902AF000, v15, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] One bud is out of ear. Pausing head tracking", buf, 2u);
        }
        if (sub_1902D8400(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1E929D8D8 != -1) {
            dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
          }
          __int16 v23 = 0;
          float32x4_t v20 = (char *)_os_log_send_and_compose_impl();
          sub_1902D398C("Generic", 1, 0, 2, "-[CMMediaSession _feedAccessoryInEarStatus:]", "CoreLocation: %s\n", v20);
          if (v20 != (char *)buf) {
            free(v20);
          }
        }
        uint64_t v16 = sub_1902D6BD0();
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = sub_1904B6238;
        v21[3] = &unk_1E568D118;
        v21[4] = self;
        sub_1902CDE98(v16, (uint64_t)v21);
        objc_msgSend__notifyClientHandler(self, v17, v18);
      }
    }
    else
    {
      if (qword_1E929D8D8 != -1) {
        dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
      }
      unint64_t v13 = qword_1E929D8E0;
      if (os_log_type_enabled((os_log_t)qword_1E929D8E0, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1902AF000, v13, OS_LOG_TYPE_ERROR, "[CMMediaSession] Ignore InEar status update because the connected device is not supported", buf, 2u);
      }
      if (sub_1902D8400(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1E929D8D8 != -1) {
          dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
        }
        __int16 v23 = 0;
        uint64_t v14 = (char *)_os_log_send_and_compose_impl();
        sub_1902D398C("Generic", 1, 0, 0, "-[CMMediaSession _feedAccessoryInEarStatus:]", "CoreLocation: %s\n", v14);
        if (v14 != (char *)buf) {
          free(v14);
        }
      }
    }
  }
}

- (void)_feedAdaptiveLatencyJitterBufferLevel
{
  uint64_t v3 = sub_1902D6BD0();
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_1904B62BC;
  v4[3] = &unk_1E568D118;
  v4[4] = self;
  sub_1902CDE98(v3, (uint64_t)v4);
}

- (void)_updateClientMode:(int64_t)a3
{
  int v3 = a3;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend__mapCMMediaSessionClientModeToRelDMClientMode_(self, a2, a3);
  if (self->_clientMode == v5) {
    return;
  }
  if (self->_headTrackingService.__ptr_.__value_)
  {
    uint64_t v6 = v5;
    if (qword_1E929D8D8 != -1) {
      dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
    }
    uint64_t v7 = qword_1E929D8E0;
    if (os_log_type_enabled((os_log_t)qword_1E929D8E0, OS_LOG_TYPE_INFO))
    {
      int clientMode = self->_clientMode;
      *(_DWORD *)long long buf = 67240448;
      int v22 = clientMode;
      __int16 v23 = 1026;
      int v24 = v3;
      _os_log_impl(&dword_1902AF000, v7, OS_LOG_TYPE_INFO, "[CMMediaSession] Changing clientMode from: %{public}d to %{public}d", buf, 0xEu);
    }
    if (sub_1902D8400(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D8D8 != -1) {
        dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
      }
      int v19 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "-[CMMediaSession _updateClientMode:]", "CoreLocation: %s\n", v19);
      if (v19 != (char *)buf) {
        free(v19);
      }
    }
    self->_int clientMode = v6;
    objc_msgSend__disallowOpportunisticAnchorTrackingForFTClients_clientMode_(self, v9, self->_scheme, v6);
    objc_sync_enter(self);
    sub_190544344((uint64_t)self->_headTrackingService.__ptr_.__value_, self->_clientMode);
    unsigned int v12 = self->_clientMode & 0xFFFFFFFE;
    if (self->_startedJitterBufferLevelPolling)
    {
      if (v12 != 2) {
        goto LABEL_32;
      }
      objc_msgSend__stopJitterBufferLevelMonitor(self, v10, v11);
      self->_startedJitterBufferLevelPolling = 0;
      self->_jitterBufferLevel = -1;
      if (qword_1E929D8D8 != -1) {
        dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
      }
      unint64_t v13 = qword_1E929D8E0;
      if (os_log_type_enabled((os_log_t)qword_1E929D8E0, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = self->_clientMode;
        *(_DWORD *)long long buf = 67109120;
        int v22 = v14;
        _os_log_impl(&dword_1902AF000, v13, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] Stop jitterBufferLevelMonitor because clientMode changed to %d", buf, 8u);
      }
      if (!sub_1902D8400(115, 2)) {
        goto LABEL_32;
      }
      bzero(buf, 0x65CuLL);
      if (qword_1E929D8D8 == -1)
      {
LABEL_41:
        float32x4_t v20 = (char *)_os_log_send_and_compose_impl();
        sub_1902D398C("Generic", 1, 0, 2, "-[CMMediaSession _updateClientMode:]", "CoreLocation: %s\n", v20);
        if (v20 != (char *)buf) {
          free(v20);
        }
LABEL_32:
        if (self->_logForReplay) {
          sub_190459594((uint64_t *)self->_logger.__ptr_.__value_, self->_clientMode);
        }
        objc_sync_exit(self);
        return;
      }
    }
    else
    {
      if (v12 == 2) {
        goto LABEL_32;
      }
      objc_msgSend__startJitterBufferLevelMonitor(self, v10, v11);
      self->_startedJitterBufferLevelPolling = 1;
      if (qword_1E929D8D8 != -1) {
        dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
      }
      unint64_t v17 = qword_1E929D8E0;
      if (os_log_type_enabled((os_log_t)qword_1E929D8E0, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = self->_clientMode;
        *(_DWORD *)long long buf = 67109120;
        int v22 = v18;
        _os_log_impl(&dword_1902AF000, v17, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] Start jitterBufferLevelMonitor because clientMode changed to %d", buf, 8u);
      }
      if (!sub_1902D8400(115, 2)) {
        goto LABEL_32;
      }
      bzero(buf, 0x65CuLL);
      if (qword_1E929D8D8 == -1) {
        goto LABEL_41;
      }
    }
    dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
    goto LABEL_41;
  }
  if (qword_1E929D8D8 != -1) {
    dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
  }
  char v15 = qword_1E929D8E0;
  if (os_log_type_enabled((os_log_t)qword_1E929D8E0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1902AF000, v15, OS_LOG_TYPE_ERROR, "[CMMediaSession] Called _feedTrackingBehavior before _headTrackingService was initialized. Not able to set client mode.", buf, 2u);
  }
  if (sub_1902D8400(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929D8D8 != -1) {
      dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
    }
    uint64_t v16 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 0, "-[CMMediaSession _updateClientMode:]", "CoreLocation: %s\n", v16);
    if (v16 != (char *)buf) {
      free(v16);
    }
  }
}

- (void)_updateTrackingScheme:(int64_t)a3
{
  if (!self->_hasUserDefaultTrackingScheme) {
    objc_msgSend__setTrackingSchemeInternal_(self, a2, a3);
  }
}

- (void)_feedScreenUnlockedEvent:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  value = self->_analyticsTracker.__ptr_.__value_;
  if (value && (*((unsigned char *)self->_headTrackingService.__ptr_.__value_ + 44) != 0) != a3)
  {
    uint64_t v6 = (double *)((char *)value + 400);
    if (a3)
    {
      if (*v6 > 0.0) {
        sub_19050B590(v6, &stru_1EDFD5D50);
      }
    }
    else
    {
      sub_19050B3B0(v6, @"lockScreenDuration");
    }
  }
  *((unsigned char *)self->_headTrackingService.__ptr_.__value_ + 44) = v3;
  if (qword_1E929D8D8 != -1) {
    dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
  }
  uint64_t v7 = qword_1E929D8E0;
  if (os_log_type_enabled((os_log_t)qword_1E929D8E0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 67240192;
    BOOL v10 = v3;
    _os_log_impl(&dword_1902AF000, v7, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] Screen state changed. isScreenUnlocked, %{public}d", buf, 8u);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929D8D8 != -1) {
      dispatch_once(&qword_1E929D8D8, &unk_1EDFD18C0);
    }
    double v8 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CMMediaSession _feedScreenUnlockedEvent:]", "CoreLocation: %s\n", v8);
    if (v8 != (char *)buf) {
      free(v8);
    }
  }
}

- (AudioAccessorySample)_getLastAudioAccessorySample
{
  long long v3 = *(_OWORD *)&self[2].timestamp;
  retstr->auxDM.quaterniouint64_t n = *(CMOQuaternion *)&self[2].auxDM.userAcceleration.elements[2];
  *(_OWORD *)retstr->auxDM.rotationRate.elements = v3;
  *(_OWORD *)&retstr->auxDM.biasCovariance.elements[1] = *(_OWORD *)self[2].filteredAcceleration.elements;
  long long v4 = *(long long *)((char *)&self[3].auxDM.quaternion + 8);
  *(_OWORD *)&retstr->filteredAcceleration.elements[2] = *(_OWORD *)&self[2].gyroBias[2];
  *(_OWORD *)&retstr->sensorLocatiouint64_t n = v4;
  *(_OWORD *)&retstr->sampleLatencfloat y = *(_OWORD *)&self[3].auxDM.rotationRate.elements[2];
  long long v5 = *(_OWORD *)&self[2].sampleLatency;
  *(_OWORD *)&retstr->sensorTime = *(_OWORD *)&self[2].sensorLocation;
  *(void *)((char *)&retstr->auxDM.userAcceleration.elements[1] + 2) = *(void *)((char *)&self[2].quiescentNoise + 2);
  *(void *)&retstr->gyroBias[2] = *(void *)self[3].auxDM.userAcceleration.elements;
  *(_OWORD *)&retstr->arrivalTimestamp = v5;
  return self;
}

- (void)_logEvent:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (self->_logForReplay)
  {
    objc_sync_enter(self);
    if (objc_msgSend_getCString_maxLength_encoding_(a3, v5, (uint64_t)v6, 1024, 1)) {
      sub_19045818C();
    }
    objc_sync_exit(self);
  }
}

- (void)_setFixedTransforms:(const CMOQuaternion *)a3
{
  value = self->_headTrackingService.__ptr_.__value_;
  long long v5 = (void *)((char *)value + 37496);
  sub_19050125C((uint64_t)value, (float32x2_t *)a3);
  uint64_t v6 = (CMOQuaternion *)(*v5 + 76);
  if (*v5) {
    BOOL v7 = v6 == a3;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7) {
    CMOQuaternion *v6 = *a3;
  }
  uint64_t v8 = v5[3];
  BOOL v7 = v8 == 0;
  uint64_t v9 = (CMOQuaternion *)(v8 + 4968);
  if (!v7 && v9 != a3) {
    CMOQuaternion *v9 = *a3;
  }
}

- (BOOL)isRequestingCameraOn
{
  return self->_requestingCameraOn;
}

- (void)setRequestingCameraOn:(BOOL)a3
{
  self->_requestingCameraOuint64_t n = a3;
}

- (unsigned)accessoryIMUSampleRate
{
  return self->_accessoryIMUSampleRate;
}

- (void)setAccessoryIMUSampleRate:(unsigned int)a3
{
  self->_unsigned int accessoryIMUSampleRate = a3;
}

- (float)prevAmbienceBedRoll
{
  return self->_prevAmbienceBedRoll;
}

- (void)setPrevAmbienceBedRoll:(float)a3
{
  self->_prevAmbienceBedRoll = a3;
}

- (BOOL)returnDefaultPose
{
  return self->_returnDefaultPose;
}

- (void)setReturnDefaultPose:(BOOL)a3
{
  self->_returnDefaultPose = a3;
}

- (BOOL)returnRandomPose
{
  return self->_returnRandomPose;
}

- (void)setReturnRandomPose:(BOOL)a3
{
  self->_returnRandomPose = a3;
}

- (BOOL)alwaysNotify50HzPose
{
  return self->_alwaysNotify50HzPose;
}

- (void)setAlwaysNotify50HzPose:(BOOL)a3
{
  self->_alwaysNotify50HzPose = a3;
}

- (NSString)mcLogPath
{
  return (NSString *)objc_getProperty(self, a2, 776, 1);
}

- (void)setMcLogPath:(id)a3
{
}

- (void).cxx_destruct
{
  sub_1904378CC((uint64_t **)&self->_logger, 0);
  value = self->_motionSettings.__ptr_.__value_;
  self->_motionSettings.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(CLSettings *))(*(void *)value + 8))(value);
  }
  long long v4 = self->_analyticsTracker.__ptr_.__value_;
  self->_analyticsTracker.__ptr_.__value_ = 0;
  if (v4) {
    sub_1904B715C(v4);
  }

  sub_1904B70C4((uint64_t *)&self->_headTrackingService, 0);
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *(void *)((char *)self + 84) = 0;
  *(void *)((char *)self + 92) = 0x3F80000000000000;
  *((void *)self + 17) = 0;
  *((void *)self + 18) = 0;
  *((void *)self + 19) = 0xA00000000;
  *((void *)self + 30) = 0;
  *((void *)self + 42) = 0;
  *((void *)self + 43) = 0x3F80000000000000;
  *((_WORD *)self + 194) = 0;
  *((void *)self + 70) = 0;
  *((void *)self + 81) = 0;
  *(void *)((char *)self + 708) = 0;
  *(void *)((char *)self + 716) = 0x3F80000000000000;
  return self;
}

@end