@interface CMVO2MaxRetrocomputeManager
- (CMVO2MaxRetrocomputeDelegate)delegate;
- (CMVO2MaxRetrocomputeManager)init;
- (void)connect;
- (void)dealloc;
- (void)disconnect;
- (void)retrocomputeStateWithHandler:(id)a3;
- (void)retrocomputeStatusWithHandler:(id)a3;
- (void)setDelegate:(id)a3;
- (void)startRetrocomputeStatusUpdates;
- (void)stopRetrocomputeStatusUpdates;
- (void)triggerRetrocomputeWithHandler:(id)a3;
@end

@implementation CMVO2MaxRetrocomputeManager

- (void)startRetrocomputeStatusUpdates
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (_os_feature_enabled_impl())
  {
    if (qword_1E929D6E8 != -1) {
      dispatch_once(&qword_1E929D6E8, &unk_1EDFD3E40);
    }
    v3 = qword_1E929D6E0;
    if (os_log_type_enabled((os_log_t)qword_1E929D6E0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1902AF000, v3, OS_LOG_TYPE_DEFAULT, "Starting retrocompute status updates", buf, 2u);
    }
    if (sub_1902D8400(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D6E8 != -1) {
        dispatch_once(&qword_1E929D6E8, &unk_1EDFD3E40);
      }
      __int16 v13 = 0;
      v10 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "-[CMVO2MaxRetrocomputeManager startRetrocomputeStatusUpdates]", "CoreLocation: %s\n", v10);
      if (v10 != (char *)buf) {
        free(v10);
      }
    }
    fInternalQueue = self->fInternalQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1902B60FC;
    block[3] = &unk_1E568D118;
    block[4] = self;
    dispatch_async(fInternalQueue, block);
  }
  else
  {
    if (qword_1E929D6E8 != -1) {
      dispatch_once(&qword_1E929D6E8, &unk_1EDFD3E40);
    }
    v5 = qword_1E929D6E0;
    if (os_log_type_enabled((os_log_t)qword_1E929D6E0, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1902AF000, v5, OS_LOG_TYPE_DEBUG, "Not starting retrocompute status updates; VO2MaxRetrocompute is not enabled",
        buf,
        2u);
    }
    if (sub_1902D8400(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D6E8 != -1) {
        dispatch_once(&qword_1E929D6E8, &unk_1EDFD3E40);
      }
      __int16 v13 = 0;
      v11 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "-[CMVO2MaxRetrocomputeManager startRetrocomputeStatusUpdates]", "CoreLocation: %s\n", v11);
      if (v11 != (char *)buf) {
        free(v11);
      }
    }
    objc_loadWeak((id *)&self->_delegate);
    if (objc_opt_respondsToSelector())
    {
      id Weak = objc_loadWeak((id *)&self->_delegate);
      uint64_t v8 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v7, @"CMErrorDomain", 108, 0);
      objc_msgSend_vo2MaxRetrocomputeManager_updateFailedWithError_(Weak, v9, (uint64_t)self, v8);
    }
  }
}

- (void)retrocomputeStateWithHandler:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    __int16 v13 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, 0);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v13, v14, (uint64_t)a2, self, @"CMVO2MaxRetrocomputeManager.mm", 160, @"Invalid parameter not satisfying: %@", @"handler");
  }
  if (_os_feature_enabled_impl())
  {
    if (self->fLocationdConnection)
    {
      objc_msgSend_copy(a3, v5, v6);
      sub_1902DD698("kCLConnectionMessageVO2MaxRetrocomputeStatusQuery", buf);
      v16 = v18;
      if (v18) {
        atomic_fetch_add_explicit(&v18->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      CLConnectionClient::sendMessage();
      if (v16) {
        sub_1902D8B58(v16);
      }
      if (v18) {
        sub_1902D8B58(v18);
      }
    }
    else
    {
      if (qword_1E929D6E8 != -1) {
        dispatch_once(&qword_1E929D6E8, &unk_1EDFD3E40);
      }
      v9 = qword_1E929D6E0;
      if (os_log_type_enabled((os_log_t)qword_1E929D6E0, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1902AF000, v9, OS_LOG_TYPE_ERROR, "Error in retrocomputeStateWithHandler: invalid locationd connection", buf, 2u);
      }
      if (sub_1902D8400(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1E929D6E8 != -1) {
          dispatch_once(&qword_1E929D6E8, &unk_1EDFD3E40);
        }
        uint64_t v15 = (char *)_os_log_send_and_compose_impl();
        sub_1902D398C("Generic", 1, 0, 0, "-[CMVO2MaxRetrocomputeManager retrocomputeStateWithHandler:]", "CoreLocation: %s\n", v15);
        if (v15 != (char *)buf) {
          free(v15);
        }
      }
      uint64_t v11 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v10, @"CMErrorDomain", 103, 0);
      (*((void (**)(id, void, uint64_t))a3 + 2))(a3, 0, v11);
    }
  }
  else
  {
    uint64_t v7 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v5, @"CMErrorDomain", 108, 0);
    uint64_t v8 = (void (*)(id, void, uint64_t))*((void *)a3 + 2);
    v8(a3, 0, v7);
  }
}

- (CMVO2MaxRetrocomputeManager)init
{
  v4.receiver = self;
  v4.super_class = (Class)CMVO2MaxRetrocomputeManager;
  v2 = [(CMVO2MaxRetrocomputeManager *)&v4 init];
  if (v2)
  {
    v2->fStartedUpdates = 0;
    v2->fInternalQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.CoreMotion.CMVO2MaxRetrocomputeManager", 0);
    operator new();
  }
  return 0;
}

- (void)connect
{
  CLConnectionClient::setDefaultMessageHandler();
  objc_initWeak(&location, self);
  objc_copyWeak(&v3, &location);
  CLConnectionClient::setInterruptionHandler();
  CLConnectionClient::start((CLConnectionClient *)self->fLocationdConnection);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

- (void)setDelegate:(id)a3
{
}

- (void)dealloc
{
  objc_msgSend_disconnect(self, a2, v2);
  v4.receiver = self;
  v4.super_class = (Class)CMVO2MaxRetrocomputeManager;
  [(CMVO2MaxRetrocomputeManager *)&v4 dealloc];
}

- (void)disconnect
{
  fLocationdConnection = self->fLocationdConnection;
  if (fLocationdConnection)
  {
    uint64_t v4 = MEMORY[0x192FCC3F0](fLocationdConnection, a2);
    MEMORY[0x192FCC980](v4, 0xB0C40BC2CC919);
    self->fLocationdConnection = 0;
    dispatch_release((dispatch_object_t)self->fInternalQueue);
    self->fInternalQueue = 0;
  }
}

- (void)retrocomputeStatusWithHandler:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    uint64_t v11 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, 0);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v11, v12, (uint64_t)a2, self, @"CMVO2MaxRetrocomputeManager.mm", 95, @"Invalid parameter not satisfying: %@", @"handler");
  }
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0;
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    uint64_t v7 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v5, @"CMErrorDomain", 108, 0);
LABEL_18:
    (*((void (**)(id, uint64_t, void, void, uint64_t))a3 + 2))(a3, v16[3], 0, 0, v7);
    goto LABEL_19;
  }
  if (!self->fLocationdConnection)
  {
    if (qword_1E929D6E8 != -1) {
      dispatch_once(&qword_1E929D6E8, &unk_1EDFD3E40);
    }
    uint64_t v8 = qword_1E929D6E0;
    if (os_log_type_enabled((os_log_t)qword_1E929D6E0, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1902AF000, v8, OS_LOG_TYPE_ERROR, "Error in retrocomputeStatusWithHandler: invalid locationd connection", buf, 2u);
    }
    if (sub_1902D8400(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D6E8 != -1) {
        dispatch_once(&qword_1E929D6E8, &unk_1EDFD3E40);
      }
      __int16 v13 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 0, "-[CMVO2MaxRetrocomputeManager retrocomputeStatusWithHandler:]", "CoreLocation: %s\n", v13);
      if (v13 != (char *)buf) {
        free(v13);
      }
    }
    uint64_t v7 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v9, @"CMErrorDomain", 103, 0);
    goto LABEL_18;
  }
  objc_msgSend_copy(a3, v5, v6);
  sub_1902DD698("kCLConnectionMessageVO2MaxRetrocomputeStatusQuery", buf);
  v14 = v20;
  if (v20) {
    atomic_fetch_add_explicit(&v20->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  CLConnectionClient::sendMessage();
  if (v14) {
    sub_1902D8B58(v14);
  }
  if (v20) {
    sub_1902D8B58(v20);
  }
LABEL_19:
  _Block_object_dispose(&v15, 8);
}

- (void)triggerRetrocomputeWithHandler:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (_os_feature_enabled_impl())
  {
    objc_msgSend_copy(a3, v4, v5);
    sub_1904EF348("kCLConnectionMessageTriggerVO2MaxRetrocompute", buf);
    v10 = v12;
    if (v12) {
      atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    CLConnectionClient::sendMessage();
    if (v10) {
      sub_1902D8B58(v10);
    }
    if (v12) {
      sub_1902D8B58(v12);
    }
  }
  else
  {
    if (qword_1E929D6E8 != -1) {
      dispatch_once(&qword_1E929D6E8, &unk_1EDFD3E40);
    }
    uint64_t v6 = qword_1E929D6E0;
    if (os_log_type_enabled((os_log_t)qword_1E929D6E0, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1902AF000, v6, OS_LOG_TYPE_DEBUG, "VO2MaxRetrocompute is not enabled", buf, 2u);
    }
    if (sub_1902D8400(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D6E8 != -1) {
        dispatch_once(&qword_1E929D6E8, &unk_1EDFD3E40);
      }
      v9 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "-[CMVO2MaxRetrocomputeManager triggerRetrocomputeWithHandler:]", "CoreLocation: %s\n", v9);
      if (v9 != (char *)buf) {
        free(v9);
      }
    }
    uint64_t v8 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v7, @"CMErrorDomain", 108, 0);
    (*((void (**)(id, uint64_t))a3 + 2))(a3, v8);
  }
}

- (void)stopRetrocomputeStatusUpdates
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (_os_feature_enabled_impl())
  {
    if (qword_1E929D6E8 != -1) {
      dispatch_once(&qword_1E929D6E8, &unk_1EDFD3E40);
    }
    id v3 = qword_1E929D6E0;
    if (os_log_type_enabled((os_log_t)qword_1E929D6E0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1902AF000, v3, OS_LOG_TYPE_DEFAULT, "Stopping retrocompute status updates", buf, 2u);
    }
    if (sub_1902D8400(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D6E8 != -1) {
        dispatch_once(&qword_1E929D6E8, &unk_1EDFD3E40);
      }
      __int16 v9 = 0;
      uint64_t v6 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "-[CMVO2MaxRetrocomputeManager stopRetrocomputeStatusUpdates]", "CoreLocation: %s\n", v6);
      if (v6 != (char *)buf) {
        free(v6);
      }
    }
    fInternalQueue = self->fInternalQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_19050D5A8;
    block[3] = &unk_1E568D118;
    block[4] = self;
    dispatch_async(fInternalQueue, block);
  }
  else
  {
    if (qword_1E929D6E8 != -1) {
      dispatch_once(&qword_1E929D6E8, &unk_1EDFD3E40);
    }
    uint64_t v5 = qword_1E929D6E0;
    if (os_log_type_enabled((os_log_t)qword_1E929D6E0, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1902AF000, v5, OS_LOG_TYPE_DEBUG, "Not attempting to stop retrocompute status updates; VO2MaxRetrocompute is not enabled",
        buf,
        2u);
    }
    if (sub_1902D8400(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D6E8 != -1) {
        dispatch_once(&qword_1E929D6E8, &unk_1EDFD3E40);
      }
      __int16 v9 = 0;
      uint64_t v7 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "-[CMVO2MaxRetrocomputeManager stopRetrocomputeStatusUpdates]", "CoreLocation: %s\n", v7);
      if (v7 != (char *)buf) {
        free(v7);
      }
    }
  }
}

- (CMVO2MaxRetrocomputeDelegate)delegate
{
  return (CMVO2MaxRetrocomputeDelegate *)objc_loadWeak((id *)&self->_delegate);
}

- (void).cxx_destruct
{
}

@end