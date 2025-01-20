@interface CMWakeGestureManager
+ (BOOL)hasSlowBootArgs;
+ (BOOL)isWakeGestureAvailable;
+ (BOOL)isWakeGestureOverrideEnabled;
+ (id)sharedManager;
+ (id)stringForGestureState:(int64_t)a3;
+ (id)stringForMode:(unsigned __int8)a3;
+ (id)stringForNotification:(unsigned __int8)a3;
+ (id)stringForStartPose:(unsigned __int8)a3;
+ (id)stringForViewPose:(unsigned __int8)a3;
+ (int64_t)toState:(unsigned __int8)a3;
+ (unsigned)toRaw:(int64_t)a3;
- (BOOL)setNightStandWakeEnabled:(BOOL)a3 withConfiguration:(int64_t)a4;
- (BOOL)simulateGestureWithDelay:(double)a3 Duration:(double)a4;
- (CMWakeGestureDelegate)delegate;
- (CMWakeGestureManager)initWithQueue:(id)a3;
- (id).cxx_construct;
- (void)dealloc;
- (void)invokeDelegateWithState:(int64_t)a3;
- (void)loadPreferences;
- (void)logWakeLatency;
- (void)onBacklightServiceUpdated:(unsigned int)a3;
- (void)onNotificationControl:(id)a3;
- (void)onPowerStateUpdated:(const Sample *)a3;
- (void)onWakeUpdated:(const Sample *)a3;
- (void)playAlert;
- (void)reenableDetectedStateRecognition;
- (void)sendWakeTriggerAnalytics:(id)a3 withDisplay:(int)a4;
- (void)setBacklightState:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)simulateGesture:(int64_t)a3 after:(double)a4;
- (void)startWakeGestureUpdates;
- (void)stopWakeGestureUpdates;
@end

@implementation CMWakeGestureManager

+ (id)sharedManager
{
  if (qword_1EB3BEAC0 != -1) {
    dispatch_once(&qword_1EB3BEAC0, &unk_1EDFD1820);
  }
  return (id)qword_1EB3BEAC8;
}

+ (BOOL)isWakeGestureAvailable
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (sub_1905E37CC())
  {
    sub_1902BAD40();
    if (!sub_19046BCE8())
    {
      LOBYTE(v4) = 1;
      return v4;
    }
    if (qword_1EB3BE818 != -1) {
      dispatch_once(&qword_1EB3BE818, &unk_1EDFC3768);
    }
    v2 = qword_1EB3BE810;
    if (os_log_type_enabled((os_log_t)qword_1EB3BE810, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1902AF000, v2, OS_LOG_TYPE_FAULT, "wake gesture should not be default-enabled on iPad", buf, 2u);
    }
    int v3 = sub_1902D8400(115, 0);
    LOBYTE(v4) = 0;
    if (v3)
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EB3BE818 != -1) {
        dispatch_once(&qword_1EB3BE818, &unk_1EDFC3768);
      }
      v5 = (uint8_t *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 0, "+[CMWakeGestureManager isWakeGestureAvailable]", "CoreLocation: %s\n");
LABEL_19:
      if (v5 != buf) {
        free(v5);
      }
      LOBYTE(v4) = 0;
    }
  }
  else
  {
    if (qword_1EB3BE818 != -1) {
      dispatch_once(&qword_1EB3BE818, &unk_1EDFC3768);
    }
    v6 = qword_1EB3BE810;
    if (os_log_type_enabled((os_log_t)qword_1EB3BE810, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1902AF000, v6, OS_LOG_TYPE_DEFAULT, "WakeGesture does not run on this platform", buf, 2u);
    }
    int v4 = sub_1902D8400(115, 2);
    if (v4)
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EB3BE818 != -1) {
        dispatch_once(&qword_1EB3BE818, &unk_1EDFC3768);
      }
      v5 = (uint8_t *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "+[CMWakeGestureManager isWakeGestureAvailable]", "CoreLocation: %s\n");
      goto LABEL_19;
    }
  }
  return v4;
}

+ (BOOL)isWakeGestureOverrideEnabled
{
  return 0;
}

+ (BOOL)hasSlowBootArgs
{
  if (qword_1E929E800 != -1) {
    dispatch_once(&qword_1E929E800, &unk_1EDFD2DA0);
  }
  return byte_1E929DED8;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->fUpdatedDelegate, a3);
  fDispatchQ = self->fDispatchQ;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_19048D12C;
  block[3] = &unk_1E568D118;
  block[4] = self;
  dispatch_async(fDispatchQ, block);
}

- (CMWakeGestureDelegate)delegate
{
  return (CMWakeGestureDelegate *)objc_loadWeak((id *)&self->fUpdatedDelegate);
}

- (CMWakeGestureManager)initWithQueue:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)CMWakeGestureManager;
  int v3 = [(CMWakeGestureManager *)&v7 init];
  if (sub_1905E37CC())
  {
    if (v3) {
      operator new();
    }
  }
  else
  {
    if (qword_1EB3BE818 != -1) {
      dispatch_once(&qword_1EB3BE818, &unk_1EDFC3768);
    }
    int v4 = qword_1EB3BE810;
    if (os_log_type_enabled((os_log_t)qword_1EB3BE810, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1902AF000, v4, OS_LOG_TYPE_FAULT, "Could not create instance of CLGestureService. Is wake gesture supported on this platform?", buf, 2u);
    }
    if (sub_1902D8400(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EB3BE818 != -1) {
        dispatch_once(&qword_1EB3BE818, &unk_1EDFC3768);
      }
      LOWORD(v8) = 0;
      v6 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 0, "-[CMWakeGestureManager initWithQueue:]", "CoreLocation: %s\n", v6);
      if (v6 != (char *)buf) {
        free(v6);
      }
    }

    return 0;
  }
  return v3;
}

- (void)dealloc
{
  objc_msgSend_stopWakeGestureUpdates(self, a2, v2);
  fDispatchQ = self->fDispatchQ;
  if (fDispatchQ)
  {
    dispatch_release(fDispatchQ);
    self->fDispatchQ = 0;
  }
  int fLockScreenToken = self->fLockScreenToken;
  if (fLockScreenToken != -1) {
    notify_cancel(fLockScreenToken);
  }
  v6.receiver = self;
  v6.super_class = (Class)CMWakeGestureManager;
  [(CMWakeGestureManager *)&v6 dealloc];
}

- (void)startWakeGestureUpdates
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (sub_1905E37CC())
  {
    if (qword_1EB3BE818 != -1) {
      dispatch_once(&qword_1EB3BE818, &unk_1EDFC3768);
    }
    int v3 = qword_1EB3BE810;
    if (os_log_type_enabled((os_log_t)qword_1EB3BE810, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1902AF000, v3, OS_LOG_TYPE_DEFAULT, "Start Wake Gesture Updates", buf, 2u);
    }
    if (sub_1902D8400(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EB3BE818 != -1) {
        dispatch_once(&qword_1EB3BE818, &unk_1EDFC3768);
      }
      __int16 v9 = 0;
      objc_super v6 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "-[CMWakeGestureManager startWakeGestureUpdates]", "CoreLocation: %s\n", v6);
      if (v6 != (char *)buf) {
        free(v6);
      }
    }
    fDispatchQ = self->fDispatchQ;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_19048E240;
    block[3] = &unk_1E568D118;
    block[4] = self;
    dispatch_async(fDispatchQ, block);
  }
  else
  {
    if (qword_1EB3BE818 != -1) {
      dispatch_once(&qword_1EB3BE818, &unk_1EDFC3768);
    }
    v5 = qword_1EB3BE810;
    if (os_log_type_enabled((os_log_t)qword_1EB3BE810, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1902AF000, v5, OS_LOG_TYPE_FAULT, "Unable to start wake gesture updates, service does not exist", buf, 2u);
    }
    if (sub_1902D8400(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EB3BE818 != -1) {
        dispatch_once(&qword_1EB3BE818, &unk_1EDFC3768);
      }
      __int16 v9 = 0;
      objc_super v7 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 0, "-[CMWakeGestureManager startWakeGestureUpdates]", "CoreLocation: %s\n", v7);
      if (v7 != (char *)buf) {
        free(v7);
      }
    }
  }
}

- (void)stopWakeGestureUpdates
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (sub_1905E37CC())
  {
    if (qword_1EB3BE818 != -1) {
      dispatch_once(&qword_1EB3BE818, &unk_1EDFC3768);
    }
    int v3 = qword_1EB3BE810;
    if (os_log_type_enabled((os_log_t)qword_1EB3BE810, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1902AF000, v3, OS_LOG_TYPE_DEFAULT, "Stop Wake Gesture Updates", buf, 2u);
    }
    if (sub_1902D8400(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EB3BE818 != -1) {
        dispatch_once(&qword_1EB3BE818, &unk_1EDFC3768);
      }
      __int16 v9 = 0;
      objc_super v6 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "-[CMWakeGestureManager stopWakeGestureUpdates]", "CoreLocation: %s\n", v6);
      if (v6 != (char *)buf) {
        free(v6);
      }
    }
    fDispatchQ = self->fDispatchQ;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_19048E720;
    block[3] = &unk_1E568D118;
    block[4] = self;
    dispatch_sync(fDispatchQ, block);
  }
  else
  {
    if (qword_1EB3BE818 != -1) {
      dispatch_once(&qword_1EB3BE818, &unk_1EDFC3768);
    }
    v5 = qword_1EB3BE810;
    if (os_log_type_enabled((os_log_t)qword_1EB3BE810, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1902AF000, v5, OS_LOG_TYPE_FAULT, "Unable to start wake gesture updates, service does not exist", buf, 2u);
    }
    if (sub_1902D8400(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EB3BE818 != -1) {
        dispatch_once(&qword_1EB3BE818, &unk_1EDFC3768);
      }
      __int16 v9 = 0;
      objc_super v7 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 0, "-[CMWakeGestureManager stopWakeGestureUpdates]", "CoreLocation: %s\n", v7);
      if (v7 != (char *)buf) {
        free(v7);
      }
    }
  }
}

- (void)setBacklightState:(int64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (self->fIsRunningInPrimaryProcess)
  {
    BOOL v5 = (unint64_t)(a3 - 1) < 2;
    CFAbsoluteTime Current = -1.0;
    if ((unint64_t)(a3 - 1) <= 1) {
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    }
    self->fLastDisplayOnTime = Current;
    BOOL fIsDisplayActive = v5;
    if (self->fIsDisplayActive != v5)
    {
      uint64_t v8 = sub_1902D6BD0();
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = sub_19048EA68;
      v15[3] = &unk_1E568DA50;
      BOOL v16 = v5;
      sub_1902CE9BC(v8, (uint64_t)v15);
      BOOL fIsDisplayActive = self->fIsDisplayActive;
    }
    self->BOOL fIsDisplayActive = v5;
    fDispatchQ = self->fDispatchQ;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_19048EC18;
    block[3] = &unk_1E568DA78;
    BOOL v13 = v5;
    BOOL v14 = fIsDisplayActive;
    block[4] = self;
    void block[5] = a3;
    dispatch_async(fDispatchQ, block);
  }
  else
  {
    if (qword_1EB3BE818 != -1) {
      dispatch_once(&qword_1EB3BE818, &unk_1EDFC3768);
    }
    uint64_t v10 = qword_1EB3BE810;
    if (os_log_type_enabled((os_log_t)qword_1EB3BE810, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1902AF000, v10, OS_LOG_TYPE_FAULT, "Only set backlight from primary process.", buf, 2u);
    }
    if (sub_1902D8400(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EB3BE818 != -1) {
        dispatch_once(&qword_1EB3BE818, &unk_1EDFC3768);
      }
      __int16 v17 = 0;
      uint64_t v11 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 0, "-[CMWakeGestureManager setBacklightState:]", "CoreLocation: %s\n", v11);
      if (v11 != (char *)buf) {
        free(v11);
      }
    }
  }
}

+ (int64_t)toState:(unsigned __int8)a3
{
  if ((a3 - 1) > 2) {
    return 0;
  }
  else {
    return qword_190609350[(char)(a3 - 1)];
  }
}

+ (unsigned)toRaw:(int64_t)a3
{
  unsigned int v3 = 0x2030100u >> (8 * a3);
  if ((unint64_t)a3 >= 4) {
    LOBYTE(v3) = 0;
  }
  return v3 & 3;
}

- (BOOL)simulateGestureWithDelay:(double)a3 Duration:(double)a4
{
  uint64_t v8 = 0;
  __int16 v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  fDispatchQ = self->fDispatchQ;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_19048EF0C;
  block[3] = &unk_1E568DAA0;
  block[4] = &v8;
  *(double *)&void block[5] = a3;
  *(double *)&void block[6] = a4;
  dispatch_async(fDispatchQ, block);
  char v5 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (void)simulateGesture:(int64_t)a3 after:(double)a4
{
  fDispatchQ = self->fDispatchQ;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_19048F040;
  block[3] = &unk_1E568DAC8;
  block[4] = self;
  void block[5] = a3;
  *(double *)&void block[6] = a4;
  dispatch_async(fDispatchQ, block);
}

- (BOOL)setNightStandWakeEnabled:(BOOL)a3 withConfiguration:(int64_t)a4
{
  BOOL v5 = a3;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  self->fNightStandModeEnabled = 0;
  if (a3)
  {
    self->fNightStandModeEnabled = 1;
    if (a4 == 1)
    {
      LOBYTE(fNightStandThreshold) = 24;
    }
    else if (a4 == 2)
    {
      LOBYTE(fNightStandThreshold) = 10;
    }
    else
    {
      int fNightStandThreshold = self->fNightStandThreshold;
    }
    int v8 = 3;
  }
  else
  {
    int v8 = 0;
    LOBYTE(fNightStandThreshold) = 0;
  }
  if (qword_1EB3BE818 != -1) {
    dispatch_once(&qword_1EB3BE818, &unk_1EDFC3768);
  }
  __int16 v9 = qword_1EB3BE810;
  if (os_log_type_enabled((os_log_t)qword_1EB3BE810, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67240960;
    int v25 = v8;
    __int16 v26 = 1026;
    BOOL v27 = v5;
    __int16 v28 = 2050;
    int64_t v29 = a4;
    __int16 v30 = 1026;
    int v31 = fNightStandThreshold;
    _os_log_impl(&dword_1902AF000, v9, OS_LOG_TYPE_DEFAULT, "Setting night stand mode on phone,%{public}d,enable,%{public}d,config,%{public}ld,option,%{public}d", buf, 0x1Eu);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EB3BE818 != -1) {
      dispatch_once(&qword_1EB3BE818, &unk_1EDFC3768);
    }
    int v16 = 67240960;
    int v17 = v8;
    __int16 v18 = 1026;
    BOOL v19 = v5;
    __int16 v20 = 2050;
    int64_t v21 = a4;
    __int16 v22 = 1026;
    int v23 = fNightStandThreshold;
    v12 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CMWakeGestureManager setNightStandWakeEnabled:withConfiguration:]", "CoreLocation: %s\n", v12);
    if (v12 != (char *)buf) {
      free(v12);
    }
  }
  fDispatchQ = self->fDispatchQ;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_19048F508;
  block[3] = &unk_1E568DAE8;
  int v14 = v8;
  char v15 = fNightStandThreshold;
  dispatch_async(fDispatchQ, block);
  return 1;
}

- (void)invokeDelegateWithState:(int64_t)a3
{
  fDispatchQ = self->fDispatchQ;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_19048F71C;
  v4[3] = &unk_1E568DB10;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(fDispatchQ, v4);
}

- (void)loadPreferences
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = sub_1902D6BD0();
  uint64_t v4 = *(void *)(v3 + 24);
  BOOL v5 = *(std::__shared_weak_count **)(v3 + 32);
  if (v5) {
    atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  p_fEnableLatencyAlert = &self->fEnableLatencyAlert;
  char v7 = sub_1902C47F8(v4, "EnableWakeGestureLatencyAlert", &self->fEnableLatencyAlert);
  if (v5) {
    sub_1902D8B58(v5);
  }
  if ((v7 & 1) == 0) {
    BOOL *p_fEnableLatencyAlert = 0;
  }
  uint64_t v8 = sub_1902D6BD0();
  uint64_t v9 = *(void *)(v8 + 24);
  uint64_t v10 = *(std::__shared_weak_count **)(v8 + 32);
  if (v10) {
    atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  p_fLatencyAlertThreshold = &self->fLatencyAlertThreshold;
  char v12 = sub_1902B44C0(v9, "WakeGestureLatencyAlertThreshold", &self->fLatencyAlertThreshold);
  if (v10) {
    sub_1902D8B58(v10);
  }
  if ((v12 & 1) == 0) {
    int *p_fLatencyAlertThreshold = 500;
  }
  uint64_t v13 = sub_1902D6BD0();
  uint64_t v14 = *(void *)(v13 + 24);
  char v15 = *(std::__shared_weak_count **)(v13 + 32);
  if (v15) {
    atomic_fetch_add_explicit(&v15->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  p_fEnableAudioAlert = &self->fEnableAudioAlert;
  char v17 = sub_1902C47F8(v14, "EnableWakeGestureHaptic", p_fEnableAudioAlert);
  if (v15) {
    sub_1902D8B58(v15);
  }
  if ((v17 & 1) == 0) {
    BOOL *p_fEnableAudioAlert = 0;
  }
  if (qword_1EB3BE818 != -1) {
    dispatch_once(&qword_1EB3BE818, &unk_1EDFC3768);
  }
  __int16 v18 = qword_1EB3BE810;
  if (os_log_type_enabled((os_log_t)qword_1EB3BE810, OS_LOG_TYPE_INFO))
  {
    BOOL v19 = *p_fEnableLatencyAlert;
    int v20 = *p_fLatencyAlertThreshold;
    BOOL v21 = *p_fEnableAudioAlert;
    *(_DWORD *)buf = 67109632;
    BOOL v24 = v19;
    __int16 v25 = 1024;
    int v26 = v20;
    __int16 v27 = 1024;
    BOOL v28 = v21;
    _os_log_impl(&dword_1902AF000, v18, OS_LOG_TYPE_INFO, "Loaded Preferences. Latency Alert: %d, Latency Threshold: %d, Audio Alert: %d", buf, 0x14u);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EB3BE818 != -1) {
      dispatch_once(&qword_1EB3BE818, &unk_1EDFC3768);
    }
    __int16 v22 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CMWakeGestureManager loadPreferences]", "CoreLocation: %s\n", v22);
    if (v22 != (char *)buf) {
      free(v22);
    }
  }
}

- (void)playAlert
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (MEMORY[0x1E4F189B0] && self->fIsRunningInPrimaryProcess)
  {
    dispatch_async((dispatch_queue_t)self->fDispatchQ, &unk_1EDFD3CA0);
    if (qword_1EB3BE818 != -1) {
      dispatch_once(&qword_1EB3BE818, &unk_1EDFC3768);
    }
    uint64_t v2 = qword_1EB3BE810;
    if (os_log_type_enabled((os_log_t)qword_1EB3BE810, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1902AF000, v2, OS_LOG_TYPE_DEBUG, "Vibrate", buf, 2u);
    }
    if (sub_1902D8400(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EB3BE818 != -1) {
        dispatch_once(&qword_1EB3BE818, &unk_1EDFC3768);
      }
      uint64_t v3 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "-[CMWakeGestureManager playAlert]", "CoreLocation: %s\n", v3);
      if (v3 != (char *)buf) {
        free(v3);
      }
    }
  }
}

- (void)logWakeLatency
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (self->fIsRunningInPrimaryProcess)
  {
    size_t v17 = 8;
    unint64_t v18 = 0;
    sysctlbyname("machdep.wake_abstime", &v18, &v17, 0, 0);
    uint64_t v3 = (void *)IORegistryEntrySearchCFProperty(self->backlightService, "IOService", @"displayOnTimestamp", (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 1u);
    if (v3)
    {
      double v4 = sub_1902D8D34(v18);
      unint64_t v7 = objc_msgSend_unsignedLongLongValue(v3, v5, v6);
      double v8 = sub_1902D8D34(v7);
      unint64_t v9 = (unint64_t)((v4 - self->fWakePacketTimestamp) * 1000.0);
      unint64_t v10 = (unint64_t)((v8 - v4) * 1000.0);
      unsigned int hasSlowBootArgs = objc_msgSend_hasSlowBootArgs(CMWakeGestureManager, v11, v12);
      if (qword_1EB3BE818 != -1) {
        dispatch_once(&qword_1EB3BE818, &unk_1EDFC3768);
      }
      uint64_t v14 = qword_1EB3BE810;
      if (os_log_type_enabled((os_log_t)qword_1EB3BE810, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109632;
        unsigned int v26 = hasSlowBootArgs;
        __int16 v27 = 2048;
        unint64_t v28 = v9;
        __int16 v29 = 2048;
        unint64_t v30 = v10;
        _os_log_impl(&dword_1902AF000, v14, OS_LOG_TYPE_DEFAULT, "hasSlowBootArgs,%d,gesture2xnu,%llu,xnu2Backlight,%llu", buf, 0x1Cu);
      }
      if (sub_1902D8400(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1EB3BE818 != -1) {
          dispatch_once(&qword_1EB3BE818, &unk_1EDFC3768);
        }
        int v19 = 67109632;
        unsigned int v20 = hasSlowBootArgs;
        __int16 v21 = 2048;
        unint64_t v22 = v9;
        __int16 v23 = 2048;
        unint64_t v24 = v10;
        int v16 = (char *)_os_log_send_and_compose_impl();
        sub_1902D398C("Generic", 1, 0, 2, "-[CMWakeGestureManager logWakeLatency]", "CoreLocation: %s\n", v16);
        if (v16 != (char *)buf) {
          free(v16);
        }
      }
      if ((hasSlowBootArgs & 1) == 0) {
        AnalyticsSendEventLazy();
      }
      if (self->fEnableLatencyAlert && v9 + v10 > self->fLatencyAlertThreshold)
      {
        CFStringRef v15 = CFStringCreateWithFormat(0, 0, @"Slow boot-args? %d\ngesture2xnu: %llums\nxnu2Backlight: %llums", hasSlowBootArgs, v9, v10);
        CFUserNotificationDisplayNotice(0.0, 0, 0, 0, 0, @"Wake Delay", v15, 0);
        CFRelease(v15);
      }
    }
  }
}

- (void)sendWakeTriggerAnalytics:(id)a3 withDisplay:(int)a4
{
}

+ (id)stringForNotification:(unsigned __int8)a3
{
  if (a3 > 8u) {
    return &stru_1EDFD5D50;
  }
  else {
    return off_1E568DBF0[(char)a3];
  }
}

+ (id)stringForMode:(unsigned __int8)a3
{
  if (a3 > 3u) {
    return &stru_1EDFD5D50;
  }
  else {
    return off_1E568DC38[(char)a3];
  }
}

+ (id)stringForStartPose:(unsigned __int8)a3
{
  if (a3 > 8u) {
    return &stru_1EDFD5D50;
  }
  else {
    return off_1E568DC58[(char)a3];
  }
}

+ (id)stringForViewPose:(unsigned __int8)a3
{
  if (a3 > 9u) {
    return &stru_1EDFD5D50;
  }
  else {
    return off_1E568DCA0[(char)a3];
  }
}

- (void)onNotificationControl:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  double v4 = objc_msgSend_userInfo(a3, a2, (uint64_t)a3);
  uint64_t v6 = objc_msgSend_objectForKeyedSubscript_(v4, v5, @"CMSendWakeGestureState");
  if (v6)
  {
    signed int v9 = objc_msgSend_intValue(v6, v7, v8);
    uint64_t v10 = v9;
    if (v9 < 5)
    {
      if (qword_1EB3BE818 != -1) {
        dispatch_once(&qword_1EB3BE818, &unk_1EDFC3768);
      }
      uint64_t v14 = qword_1EB3BE810;
      if (os_log_type_enabled((os_log_t)qword_1EB3BE810, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67240192;
        LODWORD(v18) = v9;
        _os_log_impl(&dword_1902AF000, v14, OS_LOG_TYPE_INFO, "Gesture state updated to %{public}d", buf, 8u);
      }
      if (sub_1902D8400(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1EB3BE818 != -1) {
          dispatch_once(&qword_1EB3BE818, &unk_1EDFC3768);
        }
        int v16 = (char *)_os_log_send_and_compose_impl();
        sub_1902D398C("Generic", 1, 0, 2, "-[CMWakeGestureManager onNotificationControl:]", "CoreLocation: %s\n", v16);
        if (v16 != (char *)buf) {
          free(v16);
        }
      }
      objc_msgSend_invokeDelegateWithState_(self, v15, v10);
    }
    else
    {
      if (qword_1EB3BE818 != -1) {
        dispatch_once(&qword_1EB3BE818, &unk_1EDFC3768);
      }
      char v11 = qword_1EB3BE810;
      if (os_log_type_enabled((os_log_t)qword_1EB3BE810, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 134349056;
        uint64_t v18 = v9;
        _os_log_impl(&dword_1902AF000, v11, OS_LOG_TYPE_FAULT, "Gesture state %{public}zd is invalid!", buf, 0xCu);
      }
      if (sub_1902D8400(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1EB3BE818 == -1)
        {
LABEL_16:
          uint64_t v13 = (char *)_os_log_send_and_compose_impl();
          sub_1902D398C("Generic", 1, 0, 0, "-[CMWakeGestureManager onNotificationControl:]", "CoreLocation: %s\n", v13);
          if (v13 != (char *)buf) {
            free(v13);
          }
          return;
        }
LABEL_29:
        dispatch_once(&qword_1EB3BE818, &unk_1EDFC3768);
        goto LABEL_16;
      }
    }
  }
  else
  {
    if (qword_1EB3BE818 != -1) {
      dispatch_once(&qword_1EB3BE818, &unk_1EDFC3768);
    }
    uint64_t v12 = qword_1EB3BE810;
    if (os_log_type_enabled((os_log_t)qword_1EB3BE810, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1902AF000, v12, OS_LOG_TYPE_FAULT, "Invalid CMSendWakeGestureNotification payload!", buf, 2u);
    }
    if (sub_1902D8400(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EB3BE818 == -1) {
        goto LABEL_16;
      }
      goto LABEL_29;
    }
  }
}

- (void)onWakeUpdated:(const Sample *)a3
{
  double v5 = (double)*(unint64_t *)&a3->timestamp;
  uint64_t v6 = *(_OWORD **)&a3->acceleration.x;
  v12[0] = *v6;
  *(_OWORD *)((char *)v12 + 12) = *(_OWORD *)((char *)v6 + 12);
  objc_initWeak(&location, self);
  fDispatchQ = self->fDispatchQ;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_190490A18;
  block[3] = &unk_1E568DB80;
  objc_copyWeak(v9, &location);
  void block[4] = self;
  v10[0] = v12[0];
  *(_OWORD *)((char *)v10 + 12) = *(_OWORD *)((char *)v12 + 12);
  v9[1] = *(id *)&v5;
  v9[2] = (id)a3;
  dispatch_async(fDispatchQ, block);
  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
}

- (void)onPowerStateUpdated:(const Sample *)a3
{
  if (LODWORD(a3->timestamp) == -536870272 || LODWORD(a3->timestamp) == -536870288)
  {
    objc_initWeak(&location, self);
    fDispatchQ = self->fDispatchQ;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1904915FC;
    block[3] = &unk_1E568DBA8;
    objc_copyWeak(&v7, &location);
    void block[4] = self;
    dispatch_async(fDispatchQ, block);
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

- (void)onBacklightServiceUpdated:(unsigned int)a3
{
  objc_initWeak(&location, self);
  fDispatchQ = self->fDispatchQ;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1904916F0;
  v6[3] = &unk_1E568DBD0;
  objc_copyWeak(&v7, &location);
  unsigned int v8 = a3;
  v6[4] = self;
  dispatch_async(fDispatchQ, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->fDelegate);
  objc_destroyWeak((id *)&self->fUpdatedDelegate);
  value = self->fWakeGestureVisitor.__ptr_.__value_;
  self->fWakeGestureVisitor.__ptr_.__value_ = 0;
  if (value)
  {
    double v4 = *(void (**)(void))(*(void *)value + 8);
    v4();
  }
}

- (id).cxx_construct
{
  *((void *)self + 5) = 0;
  return self;
}

- (void)reenableDetectedStateRecognition
{
  fDispatchQ = self->fDispatchQ;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_190491844;
  block[3] = &unk_1E568D118;
  void block[4] = self;
  dispatch_async(fDispatchQ, block);
}

+ (id)stringForGestureState:(int64_t)a3
{
  if ((unint64_t)a3 > 4) {
    return @"Invalid";
  }
  else {
    return off_1E56904D0[a3];
  }
}

@end