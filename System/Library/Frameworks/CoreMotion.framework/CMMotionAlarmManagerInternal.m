@interface CMMotionAlarmManagerInternal
+ (id)instance;
- (BOOL)_acknowledgeAlarm:(id)a3 error:(id *)a4;
- (BOOL)_launchRemoteAppWithError:(id *)a3 delegate:(id)a4;
- (BOOL)_registerAlarm:(id)a3 error:(id *)a4;
- (BOOL)_unregisterAlarm:(id)a3 error:(id *)a4;
- (CMMotionAlarmManagerInternal)init;
- (void)_handleAlarmFire:(id)a3;
- (void)_startListeners;
- (void)_stopListeners;
- (void)_teardown;
- (void)dealloc;
@end

@implementation CMMotionAlarmManagerInternal

- (CMMotionAlarmManagerInternal)init
{
  v4.receiver = self;
  v4.super_class = (Class)CMMotionAlarmManagerInternal;
  v2 = [(CMMotionAlarmManagerInternal *)&v4 init];
  if (v2)
  {
    v2->fInternalQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.CoreMotion.CMMotionAlarmManager", 0);
    operator new();
  }
  return 0;
}

+ (id)instance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1904E2C34;
  block[3] = &unk_1E568D118;
  block[4] = a1;
  if (qword_1EB3BF2E8 != -1) {
    dispatch_once(&qword_1EB3BF2E8, block);
  }
  return (id)qword_1EB3BF2F0;
}

- (void)dealloc
{
  objc_msgSend__teardown(self, a2, v2);
  v4.receiver = self;
  v4.super_class = (Class)CMMotionAlarmManagerInternal;
  [(CMMotionAlarmManagerInternal *)&v4 dealloc];
}

- (void)_teardown
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (qword_1E929D6C8 != -1) {
    dispatch_once(&qword_1E929D6C8, &unk_1EDFD2F00);
  }
  v3 = qword_1E929D6C0;
  if (os_log_type_enabled((os_log_t)qword_1E929D6C0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1902AF000, v3, OS_LOG_TYPE_INFO, "Tearing down CMMotionAlarmManagerInternal", buf, 2u);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929D6C8 != -1) {
      dispatch_once(&qword_1E929D6C8, &unk_1EDFD2F00);
    }
    v7 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CMMotionAlarmManagerInternal _teardown]", "CoreLocation: %s\n", v7);
    if (v7 != (char *)buf) {
      free(v7);
    }
  }
  objc_msgSend__stopListeners(self, v4, v5);
  dispatch_release((dispatch_object_t)self->fInternalQueue);
  if (self->fLocationdConnection)
  {
    uint64_t v6 = MEMORY[0x192FCC3F0]();
    MEMORY[0x192FCC980](v6, 0xB0C40BC2CC919);
  }
  self->fLocationdConnection = 0;

  self->fAlarms = 0;
}

- (void)_startListeners
{
  fInternalQueue = self->fInternalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1904E2EE8;
  block[3] = &unk_1E568D118;
  block[4] = self;
  dispatch_async(fInternalQueue, block);
}

- (void)_stopListeners
{
  fInternalQueue = self->fInternalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1904E31C8;
  block[3] = &unk_1E568D118;
  block[4] = self;
  dispatch_sync(fInternalQueue, block);
}

- (BOOL)_registerAlarm:(id)a3 error:(id *)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  objc_sync_enter(self);
  if (!objc_msgSend_manager(a3, v7, v8)
    || (v11 = objc_msgSend_manager(a3, v9, v10), !objc_msgSend_delegate(v11, v12, v13)))
  {
    if (qword_1E929D6C8 != -1) {
      dispatch_once(&qword_1E929D6C8, &unk_1EDFD2F00);
    }
    v23 = qword_1E929D6C0;
    if (os_log_type_enabled((os_log_t)qword_1E929D6C0, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1902AF000, v23, OS_LOG_TYPE_ERROR, "Unable to register motion alarm. No delegate assigned.", buf, 2u);
    }
    if (sub_1902D8400(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D6C8 != -1) {
        dispatch_once(&qword_1E929D6C8, &unk_1EDFD2F00);
      }
      LOWORD(v38) = 0;
      v35 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 0, "-[CMMotionAlarmManagerInternal _registerAlarm:error:]", "CoreLocation: %s\n", v35);
      if (v35 != (char *)buf) {
        free(v35);
      }
    }
    if (a4)
    {
      v25 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v43 = *MEMORY[0x1E4F28568];
      v44 = @"Missing alarm manager and/or delegate";
      uint64_t v26 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v24, (uint64_t)&v44, &v43, 1);
      v28 = objc_msgSend_errorWithDomain_code_userInfo_(v25, v27, @"CMErrorDomain", 103, v26);
LABEL_26:
      BOOL v22 = 0;
      *a4 = v28;
      goto LABEL_28;
    }
LABEL_27:
    BOOL v22 = 0;
    goto LABEL_28;
  }
  if (!a3 || !objc_msgSend_name(a3, v14, v15))
  {
    if (qword_1E929D6C8 != -1) {
      dispatch_once(&qword_1E929D6C8, &unk_1EDFD2F00);
    }
    v29 = qword_1E929D6C0;
    if (os_log_type_enabled((os_log_t)qword_1E929D6C0, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1902AF000, v29, OS_LOG_TYPE_ERROR, "Unable to register motion alarm. Invalid alarm object.", buf, 2u);
    }
    if (sub_1902D8400(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D6C8 != -1) {
        dispatch_once(&qword_1E929D6C8, &unk_1EDFD2F00);
      }
      LOWORD(v38) = 0;
      v36 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 0, "-[CMMotionAlarmManagerInternal _registerAlarm:error:]", "CoreLocation: %s\n", v36);
      if (v36 != (char *)buf) {
        free(v36);
      }
    }
    if (a4)
    {
      v31 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v41 = *MEMORY[0x1E4F28568];
      v42 = @"Invalid alarm object";
      uint64_t v32 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v30, (uint64_t)&v42, &v41, 1);
      v28 = objc_msgSend_errorWithDomain_code_userInfo_(v31, v33, @"CMErrorDomain", 107, v32);
      goto LABEL_26;
    }
    goto LABEL_27;
  }
  fAlarms = self->fAlarms;
  uint64_t v19 = objc_msgSend_name(a3, v16, v17);
  objc_msgSend_setObject_forKey_(fAlarms, v20, (uint64_t)a3, v19);
  v39 = @"CMMotionAlarmKey";
  id v40 = a3;
  uint64_t v38 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v21, (uint64_t)&v40, &v39, 1);
  sub_190445538("kCLConnectionMessageMotionAlarmRegister", &v38, buf);
  v37 = v46;
  if (v46) {
    atomic_fetch_add_explicit(&v46->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  CLConnectionClient::sendMessage();
  if (v37) {
    sub_1902D8B58(v37);
  }
  if (v46) {
    sub_1902D8B58(v46);
  }
  BOOL v22 = 1;
LABEL_28:
  objc_sync_exit(self);
  return v22;
}

- (BOOL)_unregisterAlarm:(id)a3 error:(id *)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  objc_sync_enter(self);
  if (!objc_msgSend_manager(a3, v7, v8)
    || (v11 = objc_msgSend_manager(a3, v9, v10), !objc_msgSend_delegate(v11, v12, v13)))
  {
    if (qword_1E929D6C8 != -1) {
      dispatch_once(&qword_1E929D6C8, &unk_1EDFD2F00);
    }
    v20 = qword_1E929D6C0;
    if (os_log_type_enabled((os_log_t)qword_1E929D6C0, OS_LOG_TYPE_ERROR))
    {
      LOWORD(__p[0]) = 0;
      _os_log_impl(&dword_1902AF000, v20, OS_LOG_TYPE_ERROR, "Unable to unregister motion alarm. No delegate assigned.", (uint8_t *)__p, 2u);
    }
    if (sub_1902D8400(115, 0))
    {
      bzero(__p, 0x65CuLL);
      if (qword_1E929D6C8 != -1) {
        dispatch_once(&qword_1E929D6C8, &unk_1EDFD2F00);
      }
      __int16 v30 = 0;
      uint64_t v26 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 0, "-[CMMotionAlarmManagerInternal _unregisterAlarm:error:]", "CoreLocation: %s\n", v26);
      if (v26 != (char *)__p) {
        free(v26);
      }
    }
    if (a4)
    {
      BOOL v22 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v21, @"CMErrorDomain", 103, 0);
LABEL_24:
      BOOL v19 = 0;
      *a4 = v22;
      goto LABEL_26;
    }
LABEL_25:
    BOOL v19 = 0;
    goto LABEL_26;
  }
  if (!a3 || !objc_msgSend_name(a3, v14, v15))
  {
    if (qword_1E929D6C8 != -1) {
      dispatch_once(&qword_1E929D6C8, &unk_1EDFD2F00);
    }
    v23 = qword_1E929D6C0;
    if (os_log_type_enabled((os_log_t)qword_1E929D6C0, OS_LOG_TYPE_ERROR))
    {
      LOWORD(__p[0]) = 0;
      _os_log_impl(&dword_1902AF000, v23, OS_LOG_TYPE_ERROR, "Unable to unregister motion alarm. Invalid alarm object.", (uint8_t *)__p, 2u);
    }
    if (sub_1902D8400(115, 0))
    {
      bzero(__p, 0x65CuLL);
      if (qword_1E929D6C8 != -1) {
        dispatch_once(&qword_1E929D6C8, &unk_1EDFD2F00);
      }
      __int16 v30 = 0;
      v27 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 0, "-[CMMotionAlarmManagerInternal _unregisterAlarm:error:]", "CoreLocation: %s\n", v27);
      if (v27 != (char *)__p) {
        free(v27);
      }
    }
    if (a4)
    {
      BOOL v22 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v24, @"CMErrorDomain", 107, 0);
      goto LABEL_24;
    }
    goto LABEL_25;
  }
  v31 = @"CMMotionAlarmKey";
  id v32 = a3;
  uint64_t v17 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v16, (uint64_t)&v32, &v31, 1);
  v18 = (std::__shared_weak_count *)operator new(0x70uLL);
  v18->__shared_owners_ = 0;
  v18->__shared_weak_owners_ = 0;
  v18->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EDFD0DA0;
  sub_1902C3F54(__p, "kCLConnectionMessageMotionAlarmUnregister");
  MEMORY[0x192FCC420](&v18[1], __p, v17);
  if (v34 < 0) {
    operator delete(__p[0]);
  }
  objc_initWeak(__p, self);
  v28[1] = &v18[1];
  v29 = v18;
  atomic_fetch_add_explicit(&v18->__shared_owners_, 1uLL, memory_order_relaxed);
  objc_copyWeak(v28, __p);
  CLConnectionClient::sendMessage();
  if (v29) {
    sub_1902D8B58(v29);
  }
  objc_destroyWeak(v28);
  objc_destroyWeak(__p);
  sub_1902D8B58(v18);
  BOOL v19 = 1;
LABEL_26:
  objc_sync_exit(self);
  return v19;
}

- (BOOL)_acknowledgeAlarm:(id)a3 error:(id *)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  objc_sync_enter(self);
  uint64_t v8 = objc_msgSend_objectForKey_(self->fAlarms, v7, (uint64_t)a3);
  if (v8)
  {
    objc_initWeak(&location, self);
    v18 = @"CMMotionAlarmKey";
    uint64_t v19 = v8;
    uint64_t v16 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v9, (uint64_t)&v19, &v18, 1);
    sub_1904E6458("kCLConnectionMessageMotionAlarmAcknowledge", &v16, buf);
    v14[1] = *(id *)buf;
    uint64_t v15 = v21;
    if (v21) {
      atomic_fetch_add_explicit(&v21->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    objc_copyWeak(v14, &location);
    CLConnectionClient::sendMessage();
    if (v15) {
      sub_1902D8B58(v15);
    }
    objc_destroyWeak(v14);
    if (v21) {
      sub_1902D8B58(v21);
    }
    objc_destroyWeak(&location);
  }
  else
  {
    if (qword_1E929D6C8 != -1) {
      dispatch_once(&qword_1E929D6C8, &unk_1EDFD2F00);
    }
    uint64_t v10 = qword_1E929D6C0;
    if (os_log_type_enabled((os_log_t)qword_1E929D6C0, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1902AF000, v10, OS_LOG_TYPE_ERROR, "Unable to acknowledge alarm, alarm does not exist.", buf, 2u);
    }
    if (sub_1902D8400(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D6C8 != -1) {
        dispatch_once(&qword_1E929D6C8, &unk_1EDFD2F00);
      }
      LOWORD(location) = 0;
      uint64_t v13 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 0, "-[CMMotionAlarmManagerInternal _acknowledgeAlarm:error:]", "CoreLocation: %s\n", v13);
      if (v13 != (char *)buf) {
        free(v13);
      }
    }
    if (a4) {
      *a4 = (id)objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v11, @"CMErrorDomain", 107, 0);
    }
  }
  objc_sync_exit(self);
  return v8 != 0;
}

- (BOOL)_launchRemoteAppWithError:(id *)a3 delegate:(id)a4
{
  objc_sync_enter(self);
  uint64_t v5 = (std::__shared_weak_count *)operator new(0x70uLL);
  v5->__shared_owners_ = 0;
  v5->__shared_weak_owners_ = 0;
  v5->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EDFD0DA0;
  sub_1902C3F54(__p, "kCLConnectionMessageMotionAlarmLaunchRemoteApplication");
  MEMORY[0x192FCC420](&v5[1], __p, MEMORY[0x1E4F1CC08]);
  if (v8 < 0) {
    operator delete(__p[0]);
  }
  atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
  CLConnectionClient::sendMessage();
  if (v5) {
    sub_1902D8B58(v5);
  }
  sub_1902D8B58(v5);
  objc_sync_exit(self);
  return 1;
}

- (void)_handleAlarmFire:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend_objectForKeyedSubscript_(a3, a2, @"CMMotionAlarmKey");
  if (v5 && (char v8 = v5, objc_msgSend_name(v5, v6, v7)))
  {
    objc_sync_enter(self);
    fAlarms = self->fAlarms;
    uint64_t v12 = objc_msgSend_name(v8, v10, v11);
    v14 = objc_msgSend_objectForKey_(fAlarms, v13, v12);
    uint64_t v17 = v14;
    if (v14 && (objc_msgSend_isValid(v14, v15, v16) & 1) != 0)
    {
      objc_msgSend_copyPropertiesFromAlarm_(v17, v18, (uint64_t)v8);
      v20 = objc_msgSend_objectForKeyedSubscript_(a3, v19, @"CMErrorMessage");
      if (objc_msgSend_intValue(v20, v21, v22) == 100)
      {
        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        v33[2] = sub_1904E5FD4;
        v33[3] = &unk_1E568D118;
        v33[4] = v17;
        v23 = MEMORY[0x1E4F14428];
        v24 = v33;
      }
      else
      {
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = sub_1904E5F18;
        block[3] = &unk_1E568D190;
        block[4] = v17;
        void block[5] = v20;
        v23 = MEMORY[0x1E4F14428];
        v24 = block;
      }
      dispatch_async(v23, v24);
    }
    else
    {
      if (qword_1E929D6C8 != -1) {
        dispatch_once(&qword_1E929D6C8, &unk_1EDFD2F00);
      }
      v27 = qword_1E929D6C0;
      if (os_log_type_enabled((os_log_t)qword_1E929D6C0, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v38 = objc_msgSend_name(v8, v28, v29);
        _os_log_impl(&dword_1902AF000, v27, OS_LOG_TYPE_ERROR, "Unable to fire motion alarm %@. Could not locate valid alarm to fire.", buf, 0xCu);
      }
      if (sub_1902D8400(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1E929D6C8 != -1) {
          dispatch_once(&qword_1E929D6C8, &unk_1EDFD2F00);
        }
        int v35 = 138412290;
        uint64_t v36 = objc_msgSend_name(v8, v30, v31);
        id v32 = (char *)_os_log_send_and_compose_impl();
        sub_1902D398C("Generic", 1, 0, 0, "-[CMMotionAlarmManagerInternal _handleAlarmFire:]", "CoreLocation: %s\n", v32);
        if (v32 != (char *)buf) {
          free(v32);
        }
      }
    }
    objc_sync_exit(self);
  }
  else
  {
    if (qword_1E929D6C8 != -1) {
      dispatch_once(&qword_1E929D6C8, &unk_1EDFD2F00);
    }
    v25 = qword_1E929D6C0;
    if (os_log_type_enabled((os_log_t)qword_1E929D6C0, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1902AF000, v25, OS_LOG_TYPE_ERROR, "Unable to fire motion alarm. Received invalid message response.", buf, 2u);
    }
    if (sub_1902D8400(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D6C8 != -1) {
        dispatch_once(&qword_1E929D6C8, &unk_1EDFD2F00);
      }
      LOWORD(v35) = 0;
      uint64_t v26 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 0, "-[CMMotionAlarmManagerInternal _handleAlarmFire:]", "CoreLocation: %s\n", v26);
      if (v26 != (char *)buf) {
        free(v26);
      }
    }
  }
}

@end