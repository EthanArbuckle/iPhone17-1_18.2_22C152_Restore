@interface CMDeviceOrientationManager
+ (BOOL)isAlwaysOn;
+ (BOOL)isAvailable;
+ (void)initialize;
- (BOOL)isDeviceOrientationActive;
- (BOOL)isDeviceOrientationAvailable;
- (BOOL)orientationNotificationsDisabled;
- (CMDeviceOrientationManager)init;
- (id)deviceOrientationBlocking;
- (id)initPrivate;
- (id)stringForOrientation:(int)a3;
- (void)dealloc;
- (void)deallocPrivate;
- (void)onDeviceOrientation:(const Sample *)a3;
- (void)onMotionPreferencesUpdated;
- (void)onNotification:(id)a3;
- (void)setDeviceOrientationCallbackModePrivate:(int)a3;
- (void)signalAndReleaseSemaphoreIfNecessaryPrivate;
- (void)start;
- (void)startDeviceOrientationUpdatesPrivateToQueue:(id)a3 withHandler:(id)a4;
- (void)startDeviceOrientationUpdatesToQueue:(id)a3 withHandler:(id)a4;
- (void)stop;
- (void)stopDeviceOrientationUpdates;
- (void)stopDeviceOrientationUpdatesPrivate;
- (void)updateAggregateDictionaryPrivate;
@end

@implementation CMDeviceOrientationManager

+ (BOOL)isAvailable
{
  return 1;
}

+ (void)initialize
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
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
    if (qword_1EB3BE828 != -1) {
      dispatch_once(&qword_1EB3BE828, &unk_1EDFD2540);
    }
    v12 = off_1EB3BE820;
    if (os_log_type_enabled((os_log_t)off_1EB3BE820, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1902AF000, v12, OS_LOG_TYPE_DEFAULT, "Orientation Manager initialized", buf, 2u);
    }
    if (sub_1902D8400(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EB3BE828 != -1) {
        dispatch_once(&qword_1EB3BE828, &unk_1EDFD2540);
      }
      v13 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "+[CMDeviceOrientationManager initialize]", "CoreLocation: %s\n", v13);
      if (v13 != (char *)buf) {
        free(v13);
      }
    }
  }
}

- (CMDeviceOrientationManager)init
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3052000000;
  v10 = sub_1902DD180;
  v11 = sub_1902DD0D0;
  uint64_t v12 = 0;
  uint64_t v3 = sub_1902D6BD0();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_19056CC1C;
  v6[3] = &unk_1E568DDB0;
  v6[4] = self;
  v6[5] = &v7;
  sub_1902CDE98(v3, (uint64_t)v6);
  uint64_t v4 = (CMDeviceOrientationManager *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (id)initPrivate
{
  v7.receiver = self;
  v7.super_class = (Class)CMDeviceOrientationManager;
  v2 = [(CMDeviceOrientationManager *)&v7 init];
  if (v2)
  {
    v2->_internal = objc_alloc_init(CMDeviceOrientationManagerInternal);
    objc_msgSend_onMotionPreferencesUpdated(v2, v3, v4);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)sub_19056CCE0, @"com.apple.backboardd.loggingchanged", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v2;
}

- (void)dealloc
{
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x3052000000;
  v6[3] = sub_1902DD180;
  v6[4] = sub_1902DD0D0;
  v6[5] = self;
  uint64_t v3 = sub_1902D6BD0();
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_19056CE54;
  v5[3] = &unk_1E568DDD8;
  v5[4] = v6;
  sub_1902CDE98(v3, (uint64_t)v5);
  v4.receiver = self;
  v4.super_class = (Class)CMDeviceOrientationManager;
  [(CMDeviceOrientationManager *)&v4 dealloc];
  _Block_object_dispose(v6, 8);
}

- (void)deallocPrivate
{
  internal = self->_internal;
  objc_super v4 = (void *)MEMORY[0x192FCD2F0]();
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.backboardd.loggingchanged", 0);
  if (internal[56])
  {
    v8 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28C40], v6, v7);
    objc_msgSend_removeObserver_(v8, v9, (uint64_t)self);
  }
  objc_msgSend_stopDeviceOrientationUpdatesPrivate(self, v6, v7);
}

- (void)onMotionPreferencesUpdated
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  internal = (char *)self->_internal;
  uint64_t v4 = sub_1902D6BD0();
  uint64_t v5 = *(void *)(v4 + 24);
  v6 = *(std::__shared_weak_count **)(v4 + 32);
  if (v6) {
    atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v7 = (int *)(internal + 52);
  char v8 = sub_1902B44C0(v5, "OrientationCallbackMode", (_DWORD *)internal + 13);
  if (v6) {
    sub_1902D8B58(v6);
  }
  if ((v8 & 1) == 0) {
    *uint64_t v7 = -1;
  }
  uint64_t v9 = sub_1902D6BD0();
  uint64_t v10 = *(void *)(v9 + 24);
  v11 = *(std::__shared_weak_count **)(v9 + 32);
  if (v11) {
    atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v12 = internal + 56;
  char v15 = sub_1902C47F8(v10, "EnableOrientationNotification", (BOOL *)internal + 56);
  if (v11) {
    sub_1902D8B58(v11);
  }
  if (v15)
  {
    if (*v12)
    {
      v16 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28C40], v13, v14);
      objc_msgSend_addObserver_selector_name_object_suspensionBehavior_(v16, v17, (uint64_t)self, sel_onNotification_, @"CMSetDeviceOrientationNotification", 0, 4);
      goto LABEL_16;
    }
  }
  else
  {
    unsigned char *v12 = 0;
  }
  v18 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28C40], v13, v14);
  objc_msgSend_removeObserver_(v18, v19, (uint64_t)self);
LABEL_16:
  if (qword_1EB3BE828 != -1) {
    dispatch_once(&qword_1EB3BE828, &unk_1EDFD2540);
  }
  v20 = off_1EB3BE820;
  if (os_log_type_enabled((os_log_t)off_1EB3BE820, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = *v7;
    int v22 = *v12;
    *(_DWORD *)buf = 67240448;
    int v25 = v21;
    __int16 v26 = 1026;
    int v27 = v22;
    _os_log_impl(&dword_1902AF000, v20, OS_LOG_TYPE_DEFAULT, "OrientationCallbackMode,%{public}d,EnableOrientationNotification,%{public}d", buf, 0xEu);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EB3BE828 != -1) {
      dispatch_once(&qword_1EB3BE828, &unk_1EDFD2540);
    }
    v23 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CMDeviceOrientationManager onMotionPreferencesUpdated]", "CoreLocation: %s\n", v23);
    if (v23 != (char *)buf) {
      free(v23);
    }
  }
}

- (void)onNotification:(id)a3
{
  uint64_t v5 = sub_1902D6BD0();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_19056D25C;
  v6[3] = &unk_1E568D190;
  v6[4] = a3;
  v6[5] = self;
  sub_1902CDE98(v5, (uint64_t)v6);
}

+ (BOOL)isAlwaysOn
{
  return ((unint64_t)sub_1902CD6B0() >> 6) & 1;
}

- (BOOL)isDeviceOrientationAvailable
{
  return sub_190576BA8() != 0;
}

- (BOOL)isDeviceOrientationActive
{
  return *((void *)self->_internal + 2) != 0;
}

- (void)startDeviceOrientationUpdatesToQueue:(id)a3 withHandler:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  internal = self->_internal;
  if (qword_1EB3BE828 != -1) {
    dispatch_once(&qword_1EB3BE828, &unk_1EDFD2540);
  }
  char v8 = off_1EB3BE820;
  if (os_log_type_enabled((os_log_t)off_1EB3BE820, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = internal[13];
    int v10 = *((unsigned __int8 *)internal + 56);
    *(_DWORD *)buf = 67240448;
    int v21 = v9;
    __int16 v22 = 1026;
    int v23 = v10;
    _os_log_impl(&dword_1902AF000, v8, OS_LOG_TYPE_DEFAULT, "Starting orientation updates, callback mode %{public}d, enable %{public}d", buf, 0xEu);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EB3BE828 != -1) {
      dispatch_once(&qword_1EB3BE828, &unk_1EDFD2540);
    }
    int v12 = internal[13];
    int v13 = *((unsigned __int8 *)internal + 56);
    int v16 = 67240448;
    int v17 = v12;
    __int16 v18 = 1026;
    int v19 = v13;
    uint64_t v14 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CMDeviceOrientationManager startDeviceOrientationUpdatesToQueue:withHandler:]", "CoreLocation: %s\n", v14);
    if (v14 != (char *)buf) {
      free(v14);
    }
  }
  kdebug_trace();
  uint64_t v11 = sub_1902D6BD0();
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_19056D728;
  v15[3] = &unk_1E568D398;
  v15[4] = self;
  v15[5] = a3;
  v15[6] = a4;
  sub_1902CDE98(v11, (uint64_t)v15);
}

- (void)stopDeviceOrientationUpdates
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  internal = self->_internal;
  if (qword_1EB3BE828 != -1) {
    dispatch_once(&qword_1EB3BE828, &unk_1EDFD2540);
  }
  uint64_t v4 = off_1EB3BE820;
  if (os_log_type_enabled((os_log_t)off_1EB3BE820, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = internal[18];
    int v6 = internal[22];
    *(_DWORD *)buf = 67240448;
    int v17 = v5;
    __int16 v18 = 1026;
    int v19 = v6;
    _os_log_impl(&dword_1902AF000, v4, OS_LOG_TYPE_DEFAULT, "Stopping orientation updates, latest %{public}d, last significant %{public}d", buf, 0xEu);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EB3BE828 != -1) {
      dispatch_once(&qword_1EB3BE828, &unk_1EDFD2540);
    }
    int v8 = internal[18];
    int v9 = internal[22];
    int v12 = 67240448;
    int v13 = v8;
    __int16 v14 = 1026;
    int v15 = v9;
    int v10 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CMDeviceOrientationManager stopDeviceOrientationUpdates]", "CoreLocation: %s\n", v10);
    if (v10 != (char *)buf) {
      free(v10);
    }
  }
  uint64_t v7 = sub_1902D6BD0();
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_19056D964;
  v11[3] = &unk_1E568D118;
  v11[4] = self;
  sub_1902CDE98(v7, (uint64_t)v11);
}

- (void)start
{
}

- (void)stop
{
}

- (void)startDeviceOrientationUpdatesPrivateToQueue:(id)a3 withHandler:(id)a4
{
  internal = self->_internal;
  if (objc_msgSend_isDeviceOrientationAvailable(self, a2, (uint64_t)a3))
  {
    id v8 = (id)internal[4];
    if (v8 != a3)
    {

      internal[4] = a3;
    }
    id v9 = (id)internal[3];
    if (v9 != a4)
    {

      internal[3] = objc_msgSend_copy(a4, v10, v11);
    }
    if (!internal[2]) {
      operator new();
    }
    objc_initWeak(&location, self);
    uint64_t v12 = sub_1902D6BD0();
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = sub_19056DB78;
    v13[3] = &unk_1E568DBA8;
    objc_copyWeak(&v14, &location);
    v13[4] = internal;
    sub_1902CE9BC(v12, (uint64_t)v13);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
}

- (void)stopDeviceOrientationUpdatesPrivate
{
  internal = self->_internal;
  if (objc_msgSend_isDeviceOrientationAvailable(self, a2, v2))
  {
    if (internal[2])
    {
      uint64_t v7 = sub_190576BA8();
      sub_1902CDE08(v7, 0, internal[2]);
      uint64_t v8 = internal[2];
      if (v8) {
        (*(void (**)(uint64_t))(*(void *)v8 + 8))(v8);
      }
      internal[2] = 0;
    }
    id v9 = (void *)internal[4];
    if (v9)
    {

      internal[4] = 0;
    }
    int v10 = (void *)internal[3];
    if (v10)
    {

      internal[3] = 0;
    }
    objc_msgSend_signalAndReleaseSemaphoreIfNecessaryPrivate(self, v5, v6);
    *((_OWORD *)internal + 5) = *((_OWORD *)internal + 4);
    uint64_t v11 = mach_absolute_time();
    *((double *)internal + 8) = sub_1902D8D34(v11);
    *((_DWORD *)internal + 18) = 0;
    objc_msgSend_updateAggregateDictionaryPrivate(self, v12, v13);
  }
}

- (void)signalAndReleaseSemaphoreIfNecessaryPrivate
{
  id internal = self->_internal;
  uint64_t v3 = *((void *)internal + 5);
  if (v3)
  {
    if (!*((unsigned char *)internal + 48))
    {
      dispatch_semaphore_signal(v3);
      *((unsigned char *)internal + 48) = 1;
      uint64_t v3 = *((void *)internal + 5);
    }
    dispatch_release(v3);
    *((void *)internal + 5) = 0;
  }
}

- (void)setDeviceOrientationCallbackModePrivate:(int)a3
{
  *((_DWORD *)self->_internal + 13) = a3;
  uint64_t v4 = sub_1902D6BD0();
  uint64_t v5 = *(void *)(v4 + 24);
  uint64_t v6 = *(std::__shared_weak_count **)(v4 + 32);
  if (v6) {
    atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  int v7 = a3;
  sub_190462484(v5, "OrientationCallbackMode", &v7);
  if (v6) {
    sub_1902D8B58(v6);
  }
}

- (void)onDeviceOrientation:(const Sample *)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend_orientationNotificationsDisabled(self, a2, (uint64_t)a3))
  {
    if (qword_1EB3BE828 != -1) {
      dispatch_once(&qword_1EB3BE828, &unk_1EDFD2540);
    }
    uint64_t v5 = off_1EB3BE820;
    if (os_log_type_enabled((os_log_t)off_1EB3BE820, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1902AF000, v5, OS_LOG_TYPE_DEFAULT, "Notifications disabled", buf, 2u);
    }
    if (sub_1902D8400(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EB3BE828 != -1) {
        dispatch_once(&qword_1EB3BE828, &unk_1EDFD2540);
      }
      LOWORD(v43) = 0;
      uint64_t v6 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "-[CMDeviceOrientationManager onDeviceOrientation:]", "CoreLocation: %s\n", v6);
      if (v6 != (char *)buf) {
        free(v6);
      }
    }
  }
  else
  {
    id internal = (unsigned int *)self->_internal;
    if (qword_1EB3BE828 != -1) {
      dispatch_once(&qword_1EB3BE828, &unk_1EDFD2540);
    }
    uint64_t v8 = off_1EB3BE820;
    if (os_log_type_enabled((os_log_t)off_1EB3BE820, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = objc_msgSend_stringForOrientation_(self, v9, internal[18]);
      uint64_t v12 = objc_msgSend_stringForOrientation_(self, v11, LODWORD(a3->acceleration.x));
      double timestamp = a3->timestamp;
      *(_DWORD *)buf = 138543874;
      uint64_t v50 = v10;
      __int16 v51 = 2114;
      uint64_t v52 = v12;
      __int16 v53 = 2050;
      double v54 = timestamp;
      _os_log_impl(&dword_1902AF000, v8, OS_LOG_TYPE_DEFAULT, "Received orientation. (%{public}@ to %{public}@) Timestamp %{public}f", buf, 0x20u);
    }
    if (sub_1902D8400(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EB3BE828 != -1) {
        dispatch_once(&qword_1EB3BE828, &unk_1EDFD2540);
      }
      uint64_t v33 = objc_msgSend_stringForOrientation_(self, v32, internal[18]);
      uint64_t v35 = objc_msgSend_stringForOrientation_(self, v34, LODWORD(a3->acceleration.x));
      double v36 = a3->timestamp;
      int v43 = 138543874;
      uint64_t v44 = v33;
      __int16 v45 = 2114;
      uint64_t v46 = v35;
      __int16 v47 = 2050;
      double v48 = v36;
      v37 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "-[CMDeviceOrientationManager onDeviceOrientation:]", "CoreLocation: %s\n", v37);
      if (v37 != (char *)buf) {
        free(v37);
      }
    }
    *((_OWORD *)internal + 5) = *((_OWORD *)internal + 4);
    os_unfair_lock_lock((os_unfair_lock_t)internal + 2);
    *((_OWORD *)internal + 4) = *(_OWORD *)&a3->timestamp;
    os_unfair_lock_unlock((os_unfair_lock_t)internal + 2);
    p_acceleration = &a3->acceleration;
    kdebug_trace();
    if (!*((unsigned char *)internal + 48))
    {
      dispatch_semaphore_signal(*((dispatch_semaphore_t *)internal + 5));
      *((unsigned char *)internal + 48) = 1;
    }
    if (*((void *)internal + 4) && *((void *)internal + 3))
    {
      uint64_t updated = objc_msgSend_updateAggregateDictionaryPrivate(self, v15, v16);
      __int16 v18 = (void *)MEMORY[0x192FCD2F0](updated);
      uint64_t v20 = (int *)(internal + 13);
      unsigned int v19 = internal[13];
      int v21 = [CMDeviceOrientation alloc];
      if (v19 == -1) {
        int v23 = &a3->acceleration;
      }
      else {
        int v23 = ($393C16A032292777F0C3725FFB2C0008 *)(internal + 13);
      }
      uint64_t v24 = objc_msgSend_initWithOrientation_andTimestamp_(v21, v22, LODWORD(v23->x), a3->timestamp);
      if (qword_1EB3BE828 != -1) {
        dispatch_once(&qword_1EB3BE828, &unk_1EDFD2540);
      }
      int v25 = off_1EB3BE820;
      if (os_log_type_enabled((os_log_t)off_1EB3BE820, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v27 = objc_msgSend_stringForOrientation_(self, v26, LODWORD(p_acceleration->x));
        int v28 = *v20;
        *(_DWORD *)buf = 138543618;
        uint64_t v50 = v27;
        __int16 v51 = 1026;
        LODWORD(v52) = v28;
        _os_log_impl(&dword_1902AF000, v25, OS_LOG_TYPE_DEFAULT, "Updating client handler: Orientation %{public}@, Callback mode: %{public}d", buf, 0x12u);
      }
      if (sub_1902D8400(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1EB3BE828 != -1) {
          dispatch_once(&qword_1EB3BE828, &unk_1EDFD2540);
        }
        uint64_t v39 = objc_msgSend_stringForOrientation_(self, v38, LODWORD(p_acceleration->x));
        int v40 = *v20;
        int v43 = 138543618;
        uint64_t v44 = v39;
        __int16 v45 = 1026;
        LODWORD(v46) = v40;
        v41 = (char *)_os_log_send_and_compose_impl();
        sub_1902D398C("Generic", 1, 0, 2, "-[CMDeviceOrientationManager onDeviceOrientation:]", "CoreLocation: %s\n", v41);
        if (v41 != (char *)buf) {
          free(v41);
        }
      }
      uint64_t v31 = *((void *)internal + 3);
      v30 = (void *)*((void *)internal + 4);
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = sub_19056E360;
      v42[3] = &unk_1E568D320;
      v42[4] = v24;
      v42[5] = v31;
      objc_msgSend_addOperationWithBlock_(v30, v29, (uint64_t)v42);
    }
  }
}

- (id)deviceOrientationBlocking
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  if (qword_1EB3BE828 != -1) {
    dispatch_once(&qword_1EB3BE828, &unk_1EDFD2540);
  }
  uint64_t v3 = off_1EB3BE820;
  if (os_log_type_enabled((os_log_t)off_1EB3BE820, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1902AF000, v3, OS_LOG_TYPE_INFO, "Received deviceOrientationBlocking", buf, 2u);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EB3BE828 != -1) {
      dispatch_once(&qword_1EB3BE828, &unk_1EDFD2540);
    }
    LOWORD(v43) = 0;
    v37 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CMDeviceOrientationManager deviceOrientationBlocking]", "CoreLocation: %s\n", v37);
    if (v37 != (char *)buf) {
      free(v37);
    }
  }
  kdebug_trace();
  id internal = (unsigned int *)self->_internal;
  if ((internal[13] & 0x80000000) == 0)
  {
    int v7 = [CMDeviceOrientation alloc];
    uint64_t v8 = internal[13];
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    return (id)objc_msgSend_initWithOrientation_andTimestamp_(v7, v10, v8, Current);
  }
  if (objc_msgSend_orientationNotificationsDisabled(self, v4, v5))
  {
    if (qword_1EB3BE828 != -1) {
      dispatch_once(&qword_1EB3BE828, &unk_1EDFD2540);
    }
    uint64_t v12 = off_1EB3BE820;
    if (os_log_type_enabled((os_log_t)off_1EB3BE820, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1902AF000, v12, OS_LOG_TYPE_FAULT, "Notifications disabled", buf, 2u);
    }
    if (sub_1902D8400(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EB3BE828 != -1) {
        dispatch_once(&qword_1EB3BE828, &unk_1EDFD2540);
      }
      LOWORD(v43) = 0;
      v38 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 0, "-[CMDeviceOrientationManager deviceOrientationBlocking]", "CoreLocation: %s\n", v38);
      if (v38 != (char *)buf) {
        free(v38);
      }
    }
    uint64_t v13 = [CMDeviceOrientation alloc];
    return (id)objc_msgSend_initWithOrientation_andTimestamp_(v13, v14, 0, 0.0);
  }
  if ((sub_1902CD6B0() & 0x40) != 0)
  {
    uint64_t v19 = sub_190576BA8();
    uint64_t v20 = sub_19057BB34(v19, 0);
    uint64_t v22 = v21;
    os_unfair_lock_lock((os_unfair_lock_t)internal + 2);
    *((void *)internal + 8) = v20;
    *((void *)internal + 9) = v22;
    os_unfair_lock_unlock((os_unfair_lock_t)internal + 2);
    int v23 = [CMDeviceOrientation alloc];
    return (id)objc_msgSend_initWithOrientation_andTimestamp_(v23, v24, v22, *(double *)&v20);
  }
  os_unfair_lock_lock((os_unfair_lock_t)internal + 2);
  double v15 = *((double *)internal + 8);
  uint64_t v16 = internal[18];
  os_unfair_lock_unlock((os_unfair_lock_t)internal + 2);
  if (v16)
  {
    int v17 = [CMDeviceOrientation alloc];
    return (id)objc_msgSend_initWithOrientation_andTimestamp_(v17, v18, v16, v15);
  }
  uint64_t v43 = 0;
  uint64_t v44 = &v43;
  uint64_t v45 = 0x3052000000;
  uint64_t v46 = sub_1902DD180;
  __int16 v47 = sub_1902DD0D0;
  uint64_t v48 = 0;
  uint64_t v27 = sub_1902D6BD0();
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = sub_19056EC7C;
  v42[3] = &unk_1E568E110;
  v42[4] = internal;
  v42[5] = &v43;
  sub_1902CDE98(v27, (uint64_t)v42);
  if (v44[5])
  {
    if (qword_1EB3BE828 != -1) {
      dispatch_once(&qword_1EB3BE828, &unk_1EDFD2540);
    }
    int v28 = off_1EB3BE820;
    if (os_log_type_enabled((os_log_t)off_1EB3BE820, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1902AF000, v28, OS_LOG_TYPE_DEFAULT, "Waiting for the first orientation to come in", buf, 2u);
    }
    if (sub_1902D8400(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EB3BE828 != -1) {
        dispatch_once(&qword_1EB3BE828, &unk_1EDFD2540);
      }
      LOWORD(v49) = 0;
      int v40 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "-[CMDeviceOrientationManager deviceOrientationBlocking]", "CoreLocation: %s\n", v40);
      if (v40 != (char *)buf) {
        free(v40);
      }
    }
    v29 = v44[5];
    dispatch_time_t v30 = dispatch_time(0, 1000000000);
    if (dispatch_semaphore_wait(v29, v30))
    {
      if (qword_1EB3BE828 != -1) {
        dispatch_once(&qword_1EB3BE828, &unk_1EDFD2540);
      }
      uint64_t v31 = off_1EB3BE820;
      if (os_log_type_enabled((os_log_t)off_1EB3BE820, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1902AF000, v31, OS_LOG_TYPE_ERROR, "Orientation blocking: timeout exceeded!", buf, 2u);
      }
      if (sub_1902D8400(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1EB3BE828 != -1) {
          dispatch_once(&qword_1EB3BE828, &unk_1EDFD2540);
        }
        LOWORD(v49) = 0;
        v41 = (char *)_os_log_send_and_compose_impl();
        sub_1902D398C("Generic", 1, 0, 0, "-[CMDeviceOrientationManager deviceOrientationBlocking]", "CoreLocation: %s\n", v41);
        if (v41 != (char *)buf) {
          free(v41);
        }
      }
    }
    dispatch_release((dispatch_object_t)v44[5]);
    v44[5] = 0;
  }
  os_unfair_lock_lock((os_unfair_lock_t)internal + 2);
  double v32 = *((double *)internal + 8);
  uint64_t v33 = internal[18];
  os_unfair_lock_unlock((os_unfair_lock_t)internal + 2);
  kdebug_trace();
  if (qword_1EB3BE828 != -1) {
    dispatch_once(&qword_1EB3BE828, &unk_1EDFD2540);
  }
  v34 = off_1EB3BE820;
  if (os_log_type_enabled((os_log_t)off_1EB3BE820, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67240448;
    int v54 = v33;
    __int16 v55 = 2050;
    double v56 = v32;
    _os_log_impl(&dword_1902AF000, v34, OS_LOG_TYPE_DEFAULT, "Got latest sample: %{public}d @ %{public}f", buf, 0x12u);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EB3BE828 != -1) {
      dispatch_once(&qword_1EB3BE828, &unk_1EDFD2540);
    }
    int v49 = 67240448;
    int v50 = v33;
    __int16 v51 = 2050;
    double v52 = v32;
    uint64_t v39 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CMDeviceOrientationManager deviceOrientationBlocking]", "CoreLocation: %s\n", v39);
    if (v39 != (char *)buf) {
      free(v39);
    }
  }
  if (v32 <= 0.0)
  {
    id v25 = 0;
  }
  else
  {
    uint64_t v35 = [CMDeviceOrientation alloc];
    id v25 = (id)objc_msgSend_initWithOrientation_andTimestamp_(v35, v36, v33, v32);
  }
  _Block_object_dispose(&v43, 8);
  return v25;
}

- (BOOL)orientationNotificationsDisabled
{
  return *(unsigned char *)(sub_190576BA8() + 33) == 0;
}

- (id)stringForOrientation:(int)a3
{
  if (a3 > 6) {
    return (id)objc_msgSend_stringWithUTF8String_(NSString, a2, (uint64_t)"Unexpected");
  }
  else {
    return (id)objc_msgSend_stringWithUTF8String_(NSString, a2, (uint64_t)off_1E568FBD0[a3]);
  }
}

- (void)updateAggregateDictionaryPrivate
{
  id internal = (double *)self->_internal;
  int v3 = *((_DWORD *)internal + 22);
  if (*((_DWORD *)internal + 18) != v3)
  {
    uint64_t v4 = objc_msgSend_stringForOrientation_(self, a2, *((unsigned int *)internal + 22));
    uint64_t v6 = (uint64_t)(internal[8] - internal[10]);
    if (v3) {
      BOOL v7 = v4 == 0;
    }
    else {
      BOOL v7 = 1;
    }
    if (!v7 && v6 >= 1 && MEMORY[0x1E4F49EC0] != 0)
    {
      objc_msgSend_stringWithFormat_(NSString, v5, @"%@.%@Time", @"com.apple.CoreMotion.DeviceOrientation", v4);
      ADClientAddValueForScalarKey();
    }
  }
}

@end