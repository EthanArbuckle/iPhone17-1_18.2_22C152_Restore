@interface CMSedentaryTimer_Internal
- (BOOL)_isActive;
- (BOOL)isTimerArmed;
- (CMSedentaryTimer_Internal)init;
- (void)_handleAlarmDataResponse:(shared_ptr<CLConnectionMessage>)a3 withHandler:(id)a4;
- (void)_handleStartStopTimerResponse:(shared_ptr<CLConnectionMessage>)a3 withHandler:(id)a4;
- (void)_registerForAlarmsWithHandler:(id)a3;
- (void)_teardown;
- (void)dealloc;
- (void)setTimerArmed:(BOOL)a3;
@end

@implementation CMSedentaryTimer_Internal

- (CMSedentaryTimer_Internal)init
{
  v4.receiver = self;
  v4.super_class = (Class)CMSedentaryTimer_Internal;
  v2 = [(CMSedentaryTimer_Internal *)&v4 init];
  if (v2)
  {
    v2->fClientQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.CoreMotion.CMSedentaryTimer.client", 0);
    v2->fDaemonQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.CoreMotion.CMSedentaryTimer.daemon", 0);
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  dispatch_release((dispatch_object_t)self->fClientQueue);
  dispatch_release((dispatch_object_t)self->fDaemonQueue);
  v3.receiver = self;
  v3.super_class = (Class)CMSedentaryTimer_Internal;
  [(CMSedentaryTimer_Internal *)&v3 dealloc];
}

- (void)_teardown
{
  fLocationdConnection = self->fLocationdConnection;
  if (fLocationdConnection)
  {
    MEMORY[0x192FCC3F0](fLocationdConnection, a2);
    JUMPOUT(0x192FCC980);
  }
}

- (BOOL)_isActive
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (qword_1EB3BE898 != -1) {
    dispatch_once(&qword_1EB3BE898, &unk_1EDFD2E40);
  }
  objc_super v3 = off_1EB3BE890;
  if (os_log_type_enabled((os_log_t)off_1EB3BE890, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1902AF000, v3, OS_LOG_TYPE_DEFAULT, "[SedentaryTimerTriage] SedentaryAlarm _isActive.", buf, 2u);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EB3BE898 != -1) {
      dispatch_once(&qword_1EB3BE898, &unk_1EDFD2E40);
    }
    __int16 v10 = 0;
    v8 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CMSedentaryTimer_Internal _isActive]", "CoreLocation: %s\n", v8);
    if (v8 != (char *)buf) {
      free(v8);
    }
  }
  fDaemonQueue = self->fDaemonQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_19043F49C;
  block[3] = &unk_1E568D118;
  block[4] = self;
  dispatch_sync(fDaemonQueue, block);
  return objc_msgSend_isTimerArmed(self, v5, v6);
}

- (void)_handleStartStopTimerResponse:(shared_ptr<CLConnectionMessage>)a3 withHandler:(id)a4
{
  var1 = a3.var1;
  var0 = (CLConnectionMessage **)a3.var0;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  v11 = (NSSet *)objc_msgSend_setWithObjects_(v7, v10, v8, v9, 0);
  if (!*var0 || (DictionaryOfClasses = (void *)CLConnectionMessage::getDictionaryOfClasses(*var0, v11)) == 0)
  {
    if (qword_1EB3BE898 != -1) {
      dispatch_once(&qword_1EB3BE898, &unk_1EDFD2E40);
    }
    v17 = off_1EB3BE890;
    if (os_log_type_enabled((os_log_t)off_1EB3BE890, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1902AF000, v17, OS_LOG_TYPE_DEFAULT, "[SedentaryTimerTriage] SedentaryAlarm _handleStartStopTimerResponse dispatching handler.", buf, 2u);
    }
    if (sub_1902D8400(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EB3BE898 != -1) {
        dispatch_once(&qword_1EB3BE898, &unk_1EDFD2E40);
      }
      __int16 v38 = 0;
      v31 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "-[CMSedentaryTimer_Internal _handleStartStopTimerResponse:withHandler:]", "CoreLocation: %s\n", v31);
      if (v31 != (char *)buf) {
        free(v31);
      }
    }
    fClientQueue = self->fClientQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1904400F0;
    block[3] = &unk_1E568D2D0;
    block[4] = var1;
    dispatch_async(fClientQueue, block);
    return;
  }
  v14 = objc_msgSend_objectForKeyedSubscript_(DictionaryOfClasses, v13, @"CMErrorMessage");
  if (v14)
  {
    v15 = self->fClientQueue;
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = sub_1904402BC;
    v36[3] = &unk_1E568D2F8;
    v36[4] = v14;
    v36[5] = var1;
    v16 = v36;
  }
  else
  {
    if (qword_1EB3BE898 != -1) {
      dispatch_once(&qword_1EB3BE898, &unk_1EDFD2E40);
    }
    v19 = off_1EB3BE890;
    if (os_log_type_enabled((os_log_t)off_1EB3BE890, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1902AF000, v19, OS_LOG_TYPE_FAULT, "SedentaryAlarm,Error start / stop response.", buf, 2u);
    }
    if (sub_1902D8400(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EB3BE898 != -1) {
        dispatch_once(&qword_1EB3BE898, &unk_1EDFD2E40);
      }
      __int16 v38 = 0;
      v33 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 0, "-[CMSedentaryTimer_Internal _handleStartStopTimerResponse:withHandler:]", "CoreLocation: %s\n", v33);
      if (v33 != (char *)buf) {
        free(v33);
      }
    }
    v15 = self->fClientQueue;
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = sub_1904404D0;
    v35[3] = &unk_1E568D2D0;
    v35[4] = var1;
    v16 = v35;
  }
  dispatch_async(v15, v16);
  if (objc_msgSend_intValue(v14, v20, v21) != 100) {
    return;
  }
  if (qword_1EB3BE898 != -1) {
    dispatch_once(&qword_1EB3BE898, &unk_1EDFD2E40);
  }
  v22 = off_1EB3BE890;
  if (os_log_type_enabled((os_log_t)off_1EB3BE890, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1902AF000, v22, OS_LOG_TYPE_DEFAULT, "[SedentaryTimerTriage] SedentaryAlarm _handleStartStopTimerResponse CMErrorNULL.", buf, 2u);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EB3BE898 != -1) {
      dispatch_once(&qword_1EB3BE898, &unk_1EDFD2E40);
    }
    __int16 v38 = 0;
    v32 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CMSedentaryTimer_Internal _handleStartStopTimerResponse:withHandler:]", "CoreLocation: %s\n", v32);
    if (v32 != (char *)buf) {
      free(v32);
    }
  }
  v23 = (void *)CLConnectionMessage::name(*var0);
  int v24 = *((char *)v23 + 23);
  if (v24 < 0)
  {
    if (v23[1] != 39) {
      goto LABEL_29;
    }
    v23 = (void *)*v23;
  }
  else if (v24 != 39)
  {
LABEL_29:
    v26 = (void *)CLConnectionMessage::name(*var0);
    int v27 = *((char *)v26 + 23);
    if (v27 < 0)
    {
      if (v26[1] != 38) {
        return;
      }
      v26 = (void *)*v26;
    }
    else if (v27 != 38)
    {
      return;
    }
    if (!memcmp(v26, "kCLConnectionMessageSedentaryTimerStop", 0x26uLL))
    {
      objc_msgSend_setTimerArmed_(self, v28, 0);
      if (qword_1EB3BE898 != -1) {
        dispatch_once(&qword_1EB3BE898, &unk_1EDFD2E40);
      }
      v29 = off_1EB3BE890;
      if (os_log_type_enabled((os_log_t)off_1EB3BE890, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1902AF000, v29, OS_LOG_TYPE_DEFAULT, "[SedentaryTimerTriage] SedentaryAlarm _handleStartStopTimerResponse timer is not armed.", buf, 2u);
      }
      if (sub_1902D8400(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1EB3BE898 == -1)
        {
LABEL_61:
          __int16 v38 = 0;
          v34 = (char *)_os_log_send_and_compose_impl();
          sub_1902D398C("Generic", 1, 0, 2, "-[CMSedentaryTimer_Internal _handleStartStopTimerResponse:withHandler:]", "CoreLocation: %s\n", v34);
          if (v34 != (char *)buf) {
            free(v34);
          }
          return;
        }
LABEL_63:
        dispatch_once(&qword_1EB3BE898, &unk_1EDFD2E40);
        goto LABEL_61;
      }
    }
    return;
  }
  if (memcmp(v23, "kCLConnectionMessageSedentaryTimerStart", 0x27uLL)) {
    goto LABEL_29;
  }
  objc_msgSend_setTimerArmed_(self, v25, 1);
  if (qword_1EB3BE898 != -1) {
    dispatch_once(&qword_1EB3BE898, &unk_1EDFD2E40);
  }
  v30 = off_1EB3BE890;
  if (os_log_type_enabled((os_log_t)off_1EB3BE890, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1902AF000, v30, OS_LOG_TYPE_DEFAULT, "[SedentaryTimerTriage] SedentaryAlarm _handleStartStopTimerResponse timer is armed.", buf, 2u);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EB3BE898 == -1) {
      goto LABEL_61;
    }
    goto LABEL_63;
  }
}

- (void)_handleAlarmDataResponse:(shared_ptr<CLConnectionMessage>)a3 withHandler:(id)a4
{
  var1 = a3.var1;
  var0 = (CLConnectionMessage **)a3.var0;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  v13 = (NSSet *)objc_msgSend_setWithObjects_(v7, v12, v8, v9, v10, v11, 0);
  if (*var0 && (DictionaryOfClasses = (void *)CLConnectionMessage::getDictionaryOfClasses(*var0, v13)) != 0)
  {
    v16 = DictionaryOfClasses;
    uint64_t v17 = objc_msgSend_objectForKeyedSubscript_(DictionaryOfClasses, v15, @"CMErrorMessage");
    uint64_t v19 = objc_msgSend_objectForKeyedSubscript_(v16, v18, @"CMSedentaryTimerAlarmData");
    if (v17)
    {
      if (qword_1EB3BE898 != -1) {
        dispatch_once(&qword_1EB3BE898, &unk_1EDFD2E40);
      }
      v20 = off_1EB3BE890;
      if (os_log_type_enabled((os_log_t)off_1EB3BE890, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1902AF000, v20, OS_LOG_TYPE_DEFAULT, "[SedentaryTimerTriage] SedentaryAlarm _handleAlarmDataResponse error.", buf, 2u);
      }
      if (sub_1902D8400(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1EB3BE898 != -1) {
          dispatch_once(&qword_1EB3BE898, &unk_1EDFD2E40);
        }
        __int16 v35 = 0;
        v28 = (char *)_os_log_send_and_compose_impl();
        sub_1902D398C("Generic", 1, 0, 2, "-[CMSedentaryTimer_Internal _handleAlarmDataResponse:withHandler:]", "CoreLocation: %s\n", v28);
        if (v28 != (char *)buf) {
          free(v28);
        }
      }
      fClientQueue = self->fClientQueue;
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = sub_190440E1C;
      v33[3] = &unk_1E568D2F8;
      v33[4] = v17;
      v33[5] = var1;
      v22 = v33;
    }
    else
    {
      uint64_t v24 = v19;
      if (v19)
      {
        if (qword_1EB3BE898 != -1) {
          dispatch_once(&qword_1EB3BE898, &unk_1EDFD2E40);
        }
        v25 = off_1EB3BE890;
        if (os_log_type_enabled((os_log_t)off_1EB3BE890, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1902AF000, v25, OS_LOG_TYPE_DEFAULT, "[SedentaryTimerTriage] SedentaryAlarm _handleAlarmDataResponse alarmDataArray.", buf, 2u);
        }
        if (sub_1902D8400(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1EB3BE898 != -1) {
            dispatch_once(&qword_1EB3BE898, &unk_1EDFD2E40);
          }
          __int16 v35 = 0;
          v29 = (char *)_os_log_send_and_compose_impl();
          sub_1902D398C("Generic", 1, 0, 2, "-[CMSedentaryTimer_Internal _handleAlarmDataResponse:withHandler:]", "CoreLocation: %s\n", v29);
          if (v29 != (char *)buf) {
            free(v29);
          }
        }
        fClientQueue = self->fClientQueue;
        v32[0] = MEMORY[0x1E4F143A8];
        v32[1] = 3221225472;
        v32[2] = sub_19044115C;
        v32[3] = &unk_1E568D320;
        v32[4] = v24;
        v32[5] = var1;
        v22 = v32;
      }
      else
      {
        if (qword_1EB3BE898 != -1) {
          dispatch_once(&qword_1EB3BE898, &unk_1EDFD2E40);
        }
        v26 = off_1EB3BE890;
        if (os_log_type_enabled((os_log_t)off_1EB3BE890, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1902AF000, v26, OS_LOG_TYPE_FAULT, "SedentaryAlarm,Error parsing alarm data.", buf, 2u);
        }
        if (sub_1902D8400(115, 0))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1EB3BE898 != -1) {
            dispatch_once(&qword_1EB3BE898, &unk_1EDFD2E40);
          }
          __int16 v35 = 0;
          v30 = (char *)_os_log_send_and_compose_impl();
          sub_1902D398C("Generic", 1, 0, 0, "-[CMSedentaryTimer_Internal _handleAlarmDataResponse:withHandler:]", "CoreLocation: %s\n", v30);
          if (v30 != (char *)buf) {
            free(v30);
          }
        }
        fClientQueue = self->fClientQueue;
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = sub_190441304;
        v31[3] = &unk_1E568D2D0;
        v31[4] = var1;
        v22 = v31;
      }
    }
  }
  else
  {
    if (qword_1EB3BE898 != -1) {
      dispatch_once(&qword_1EB3BE898, &unk_1EDFD2E40);
    }
    v23 = off_1EB3BE890;
    if (os_log_type_enabled((os_log_t)off_1EB3BE890, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1902AF000, v23, OS_LOG_TYPE_DEFAULT, "[SedentaryTimerTriage] SedentaryAlarm _handleAlarmDataResponse nil response dispatching handler.", buf, 2u);
    }
    if (sub_1902D8400(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EB3BE898 != -1) {
        dispatch_once(&qword_1EB3BE898, &unk_1EDFD2E40);
      }
      __int16 v35 = 0;
      int v27 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "-[CMSedentaryTimer_Internal _handleAlarmDataResponse:withHandler:]", "CoreLocation: %s\n", v27);
      if (v27 != (char *)buf) {
        free(v27);
      }
    }
    fClientQueue = self->fClientQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_190440C4C;
    block[3] = &unk_1E568D2D0;
    block[4] = var1;
    v22 = block;
  }
  dispatch_async(fClientQueue, v22);
}

- (void)_registerForAlarmsWithHandler:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (qword_1EB3BE898 != -1) {
    dispatch_once(&qword_1EB3BE898, &unk_1EDFD2E40);
  }
  objc_super v3 = off_1EB3BE890;
  if (os_log_type_enabled((os_log_t)off_1EB3BE890, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1902AF000, v3, OS_LOG_TYPE_DEFAULT, "[SedentaryTimerTriage] SedentaryAlarm _registerForAlarmsWithHandler.", buf, 2u);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EB3BE898 != -1) {
      dispatch_once(&qword_1EB3BE898, &unk_1EDFD2E40);
    }
    objc_super v4 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CMSedentaryTimer_Internal _registerForAlarmsWithHandler:]", "CoreLocation: %s\n", v4);
    if (v4 != (char *)buf) {
      free(v4);
    }
  }
  sub_1902C3F54(buf, "kCLConnectionMessageSedentaryTimerAlarm");
  CLConnectionClient::setHandlerForMessage();
  if (v6 < 0) {
    operator delete(*(void **)buf);
  }
}

- (BOOL)isTimerArmed
{
  return self->_timerArmed;
}

- (void)setTimerArmed:(BOOL)a3
{
  self->_timerArmed = a3;
}

@end