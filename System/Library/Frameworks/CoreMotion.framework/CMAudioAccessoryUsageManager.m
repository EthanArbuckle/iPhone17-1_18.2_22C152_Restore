@interface CMAudioAccessoryUsageManager
+ (BOOL)isAvailable;
+ (int64_t)isAuthorized;
- (CMAudioAccessoryUsageDelegate)delegate;
- (CMAudioAccessoryUsageManager)init;
- (id).cxx_construct;
- (int64_t)isAuthorized;
- (void)_connect;
- (void)_disconnect;
- (void)_handleMessage:(shared_ptr<CLConnectionMessage>)a3;
- (void)dealloc;
- (void)requestAudioAccessoryUsageUpdatesWithHandler:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation CMAudioAccessoryUsageManager

+ (BOOL)isAvailable
{
  sub_1902BAD40();

  return sub_19046BC40();
}

+ (int64_t)isAuthorized
{
  return objc_msgSend_isAuthorizedForEntitlement_(CMMotionUtils, a2, @"com.apple.bluetooth.system");
}

- (CMAudioAccessoryUsageManager)init
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (qword_1EB3BE838 != -1) {
    dispatch_once(&qword_1EB3BE838, &unk_1EDFD3DC0);
  }
  v3 = qword_1EB3BE830;
  if (os_log_type_enabled((os_log_t)qword_1EB3BE830, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1902AF000, v3, OS_LOG_TYPE_DEBUG, "[HeadphoneUsage] CMAudioAccessoryUsageManager init", buf, 2u);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EB3BE838 != -1) {
      dispatch_once(&qword_1EB3BE838, &unk_1EDFD3DC0);
    }
    __int16 v8 = 0;
    v6 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CMAudioAccessoryUsageManager init]", "CoreLocation: %s\n", v6);
    if (v6 != (char *)buf) {
      free(v6);
    }
  }
  v7.receiver = self;
  v7.super_class = (Class)CMAudioAccessoryUsageManager;
  id v4 = [(CMAudioAccessoryUsageManager *)&v7 init];
  if (v4)
  {
    *((void *)v4 + 2) = dispatch_queue_create("com.apple.CoreMotion.CMAudioAccessoryUsage", 0);
    sub_190421DA8((uint64_t *)v4 + 1, 0);
  }
  return (CMAudioAccessoryUsageManager *)v4;
}

- (void)dealloc
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (qword_1EB3BE838 != -1) {
    dispatch_once(&qword_1EB3BE838, &unk_1EDFD3DC0);
  }
  v3 = qword_1EB3BE830;
  if (os_log_type_enabled((os_log_t)qword_1EB3BE830, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1902AF000, v3, OS_LOG_TYPE_DEBUG, "[HeadphoneUsage] CMAudioAccessoryUsageManager dealloc", buf, 2u);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EB3BE838 != -1) {
      dispatch_once(&qword_1EB3BE838, &unk_1EDFD3DC0);
    }
    __int16 v10 = 0;
    objc_super v7 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CMAudioAccessoryUsageManager dealloc]", "CoreLocation: %s\n", v7);
    if (v7 != (char *)buf) {
      free(v7);
    }
  }
  dispatch_queue_set_specific((dispatch_queue_t)self->_dispatchQueue, &unk_1E929E7FC, &unk_1E929E7FC, 0);
  if (dispatch_get_specific(&unk_1E929E7FC) == &unk_1E929E7FC)
  {
    objc_msgSend__disconnect(self, v4, v5);
  }
  else
  {
    dispatchQueue = self->_dispatchQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_190429680;
    block[3] = &unk_1E568D118;
    block[4] = self;
    dispatch_sync(dispatchQueue, block);
  }
  dispatch_release((dispatch_object_t)self->_dispatchQueue);
  self->_dispatchQueue = 0;
  v8.receiver = self;
  v8.super_class = (Class)CMAudioAccessoryUsageManager;
  [(CMAudioAccessoryUsageManager *)&v8 dealloc];
}

- (void)setDelegate:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (qword_1EB3BE838 != -1) {
    dispatch_once(&qword_1EB3BE838, &unk_1EDFD3DC0);
  }
  uint64_t v5 = qword_1EB3BE830;
  if (os_log_type_enabled((os_log_t)qword_1EB3BE830, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1902AF000, v5, OS_LOG_TYPE_DEBUG, "[HeadphoneUsage] CMAudioAccessoryUsageManager setDelegate", buf, 2u);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EB3BE838 != -1) {
      dispatch_once(&qword_1EB3BE838, &unk_1EDFD3DC0);
    }
    __int16 v9 = 0;
    objc_super v7 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CMAudioAccessoryUsageManager setDelegate:]", "CoreLocation: %s\n", v7);
    if (v7 != (char *)buf) {
      free(v7);
    }
  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_190429874;
  block[3] = &unk_1E568D190;
  block[4] = self;
  void block[5] = a3;
  dispatch_async(dispatchQueue, block);
}

- (void)_connect
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_locationConnection.__ptr_.__value_)
  {
    if (qword_1EB3BE838 != -1) {
      dispatch_once(&qword_1EB3BE838, &unk_1EDFD3DC0);
    }
    uint64_t v5 = qword_1EB3BE830;
    if (os_log_type_enabled((os_log_t)qword_1EB3BE830, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1902AF000, v5, OS_LOG_TYPE_DEFAULT, "[HeadphoneUsage] CMAudioAccessoryUsageManager - connecting", buf, 2u);
    }
    if (sub_1902D8400(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EB3BE838 != -1) {
        dispatch_once(&qword_1EB3BE838, &unk_1EDFD3DC0);
      }
      v6 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "-[CMAudioAccessoryUsageManager _connect]", "CoreLocation: %s\n", v6);
      if (v6 != (char *)buf) {
        free(v6);
      }
    }
    operator new();
  }
  if (qword_1EB3BE838 != -1) {
    dispatch_once(&qword_1EB3BE838, &unk_1EDFD3DC0);
  }
  v3 = qword_1EB3BE830;
  if (os_log_type_enabled((os_log_t)qword_1EB3BE830, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1902AF000, v3, OS_LOG_TYPE_DEFAULT, "[HeadphoneUsage] CMAudioAccessoryUsageManager - requested connection, but already registered", buf, 2u);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EB3BE838 != -1) {
      dispatch_once(&qword_1EB3BE838, &unk_1EDFD3DC0);
    }
    id v4 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CMAudioAccessoryUsageManager _connect]", "CoreLocation: %s\n", v4);
    if (v4 != (char *)buf) {
      free(v4);
    }
  }
}

- (void)_handleMessage:(shared_ptr<CLConnectionMessage>)a3
{
  var0 = (CLConnectionMessage **)a3.var0;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  if (qword_1EB3BE838 != -1) {
    dispatch_once(&qword_1EB3BE838, &unk_1EDFD3DC0);
  }
  uint64_t v5 = qword_1EB3BE830;
  if (os_log_type_enabled((os_log_t)qword_1EB3BE830, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1902AF000, v5, OS_LOG_TYPE_DEFAULT, "[HeadphoneUsage] CMAudioAccessoryUsageManager handleMessage", buf, 2u);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EB3BE838 != -1) {
      dispatch_once(&qword_1EB3BE838, &unk_1EDFD3DC0);
    }
    __int16 v40 = 0;
    v35 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CMAudioAccessoryUsageManager _handleMessage:]", "CoreLocation: %s\n", v35);
    if (v35 != (char *)buf) {
      free(v35);
    }
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v6 = (void *)CLConnectionMessage::name(*var0);
  int v7 = *((char *)v6 + 23);
  if (v7 < 0)
  {
    if (v6[1] != 52) {
      goto LABEL_12;
    }
    v6 = (void *)*v6;
LABEL_11:
    if (memcmp(v6, "kCLConnectionMessageAudioAccessoryUsageMetricsUpdate", 0x34uLL)) {
      goto LABEL_12;
    }
    objc_loadWeak((id *)&self->_delegate);
    if (objc_opt_respondsToSelector())
    {
      uint64_t Dictionary = CLConnectionMessage::getDictionary(*var0);
      if (Dictionary)
      {
        v20 = objc_msgSend_mainQueue(MEMORY[0x1E4F28F08], v17, v18);
        v38[0] = MEMORY[0x1E4F143A8];
        v38[1] = 3221225472;
        v38[2] = sub_19042AC60;
        v38[3] = &unk_1E568D190;
        v38[4] = self;
        v38[5] = Dictionary;
        objc_msgSend_addOperationWithBlock_(v20, v21, (uint64_t)v38);
        goto LABEL_12;
      }
      if (qword_1EB3BE838 != -1) {
        dispatch_once(&qword_1EB3BE838, &unk_1EDFD3DC0);
      }
      v25 = qword_1EB3BE830;
      if (os_log_type_enabled((os_log_t)qword_1EB3BE830, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1902AF000, v25, OS_LOG_TYPE_ERROR, "[HeadphoneUsage] CMAudioAccessoryUsageManager: Error, nil dictionary received.", buf, 2u);
      }
      if (sub_1902D8400(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1EB3BE838 != -1) {
          dispatch_once(&qword_1EB3BE838, &unk_1EDFD3DC0);
        }
        __int16 v40 = 0;
        v36 = (char *)_os_log_send_and_compose_impl();
        sub_1902D398C("Generic", 1, 0, 0, "-[CMAudioAccessoryUsageManager _handleMessage:]", "CoreLocation: %s\n", v36);
        if (v36 != (char *)buf) {
          free(v36);
        }
      }
      objc_loadWeak((id *)&self->_delegate);
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
        uint64_t v41 = *MEMORY[0x1E4F28568];
        v42 = @"No data received from callback.";
        uint64_t v28 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v26, (uint64_t)&v42, &v41, 1);
        uint64_t v30 = objc_msgSend_CMErrorWithCode_userInfo_(CMErrorUtils, v29, 112, v28);
        v33 = objc_msgSend_mainQueue(MEMORY[0x1E4F28F08], v31, v32);
        v39[0] = MEMORY[0x1E4F143A8];
        v39[1] = 3221225472;
        v39[2] = sub_19042AC20;
        v39[3] = &unk_1E568D190;
        v39[4] = self;
        v39[5] = v30;
        objc_msgSend_addOperationWithBlock_(v33, v34, (uint64_t)v39);
        return;
      }
      if (qword_1EB3BE838 != -1) {
        dispatch_once(&qword_1EB3BE838, &unk_1EDFD3DC0);
      }
      v27 = qword_1EB3BE830;
      if (os_log_type_enabled((os_log_t)qword_1EB3BE830, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1902AF000, v27, OS_LOG_TYPE_ERROR, "[HeadphoneUsage] CMAudioAccessoryUsageManager: Delegate does not respond to errorOccurred.", buf, 2u);
      }
      if (!sub_1902D8400(115, 0)) {
        return;
      }
      bzero(buf, 0x65CuLL);
      if (qword_1EB3BE838 == -1)
      {
LABEL_29:
        __int16 v40 = 0;
        v23 = (char *)_os_log_send_and_compose_impl();
        sub_1902D398C("Generic", 1, 0, 0, "-[CMAudioAccessoryUsageManager _handleMessage:]", "CoreLocation: %s\n", v23);
LABEL_57:
        if (v23 != (char *)buf) {
          free(v23);
        }
        return;
      }
    }
    else
    {
      if (qword_1EB3BE838 != -1) {
        dispatch_once(&qword_1EB3BE838, &unk_1EDFD3DC0);
      }
      v22 = qword_1EB3BE830;
      if (os_log_type_enabled((os_log_t)qword_1EB3BE830, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1902AF000, v22, OS_LOG_TYPE_ERROR, "[HeadphoneUsage] CMAudioAccessoryUsageManager: Delegate does not respond to didReceiveUsageMetrics, refuse message.", buf, 2u);
      }
      if (!sub_1902D8400(115, 0)) {
        return;
      }
      bzero(buf, 0x65CuLL);
      if (qword_1EB3BE838 == -1) {
        goto LABEL_29;
      }
    }
    dispatch_once(&qword_1EB3BE838, &unk_1EDFD3DC0);
    goto LABEL_29;
  }
  if (v7 == 52) {
    goto LABEL_11;
  }
LABEL_12:
  uint64_t v8 = (void *)CLConnectionMessage::name(*var0);
  int v9 = *((char *)v8 + 23);
  if (v9 < 0)
  {
    if (v8[1] != 51) {
      return;
    }
    uint64_t v8 = (void *)*v8;
  }
  else if (v9 != 51)
  {
    return;
  }
  if (!memcmp(v8, "kCLConnectionMessageAudioAccessoryUsageMetricsError", 0x33uLL))
  {
    objc_loadWeak((id *)&self->_delegate);
    if (objc_opt_respondsToSelector())
    {
      __int16 v10 = *var0;
      uint64_t v11 = (objc_class *)objc_opt_class();
      uint64_t ObjectOfClass = CLConnectionMessage::getObjectOfClass(v10, v11);
      v15 = objc_msgSend_mainQueue(MEMORY[0x1E4F28F08], v13, v14);
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = sub_19042ACA0;
      v37[3] = &unk_1E568D190;
      v37[4] = self;
      v37[5] = ObjectOfClass;
      objc_msgSend_addOperationWithBlock_(v15, v16, (uint64_t)v37);
      return;
    }
    if (qword_1EB3BE838 != -1) {
      dispatch_once(&qword_1EB3BE838, &unk_1EDFD3DC0);
    }
    v24 = qword_1EB3BE830;
    if (os_log_type_enabled((os_log_t)qword_1EB3BE830, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1902AF000, v24, OS_LOG_TYPE_ERROR, "[HeadphoneUsage] CMAudioAccessoryUsageManager: Delegate does not respond to errorOccurred, refuse message.", buf, 2u);
    }
    if (sub_1902D8400(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EB3BE838 != -1) {
        dispatch_once(&qword_1EB3BE838, &unk_1EDFD3DC0);
      }
      __int16 v40 = 0;
      v23 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 0, "-[CMAudioAccessoryUsageManager _handleMessage:]", "CoreLocation: %s\n", v23);
      goto LABEL_57;
    }
  }
}

- (void)_disconnect
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (qword_1EB3BE838 != -1) {
    dispatch_once(&qword_1EB3BE838, &unk_1EDFD3DC0);
  }
  v3 = qword_1EB3BE830;
  if (os_log_type_enabled((os_log_t)qword_1EB3BE830, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1902AF000, v3, OS_LOG_TYPE_DEFAULT, "[HeadphoneUsage] CMAudioAccessoryUsageManager _disconnect", buf, 2u);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EB3BE838 != -1) {
      dispatch_once(&qword_1EB3BE838, &unk_1EDFD3DC0);
    }
    LOWORD(v9) = 0;
    v6 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CMAudioAccessoryUsageManager _disconnect]", "CoreLocation: %s\n", v6);
    if (v6 != (char *)buf) {
      free(v6);
    }
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  uint64_t v12 = @"kCLConnectionMessageSubscribeKey";
  uint64_t v13 = MEMORY[0x1E4F1CC28];
  uint64_t v11 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v4, (uint64_t)&v13, &v12, 1);
  sub_19042B270("kCLConnectionMessageAudioAccessoryUsageMetricsSubscription", &v11, &v9);
  if (objc_loadWeak((id *)&self->_delegate) && self->_locationConnection.__ptr_.__value_)
  {
    uint64_t v8 = v10;
    if (v10) {
      atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    CLConnectionClient::sendMessage();
    if (v8) {
      sub_1902D8B58(v8);
    }
  }
  else
  {
    if (qword_1EB3BE838 != -1) {
      dispatch_once(&qword_1EB3BE838, &unk_1EDFD3DC0);
    }
    uint64_t v5 = qword_1EB3BE830;
    if (os_log_type_enabled((os_log_t)qword_1EB3BE830, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1902AF000, v5, OS_LOG_TYPE_INFO, "[HeadphoneUsage] Cannot send a disconnect message, delegate or connection is already invalid.", buf, 2u);
    }
    if (sub_1902D8400(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EB3BE838 != -1) {
        dispatch_once(&qword_1EB3BE838, &unk_1EDFD3DC0);
      }
      int v7 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "-[CMAudioAccessoryUsageManager _disconnect]", "CoreLocation: %s\n", v7);
      if (v7 != (char *)buf) {
        free(v7);
      }
    }
  }
  sub_190421DA8((uint64_t *)&self->_locationConnection, 0);
  if (v10) {
    sub_1902D8B58(v10);
  }
}

- (void)requestAudioAccessoryUsageUpdatesWithHandler:(id)a3
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v4 = objc_opt_class();
  if ((objc_msgSend_isAvailable(v4, v5, v6) & 1) == 0)
  {
    uint64_t v20 = *MEMORY[0x1E4F28568];
    v21[0] = @"CMAudioAccessoryUsageManager not available on this platform";
    uint64_t v13 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v7, (uint64_t)v21, &v20, 1);
    uint64_t v15 = objc_msgSend_CMErrorWithCode_userInfo_(CMErrorUtils, v14, 109, v13);
LABEL_8:
    (*((void (**)(id, uint64_t))a3 + 2))(a3, v15);
    return;
  }
  uint64_t v8 = objc_opt_class();
  if (!objc_msgSend_isAuthorized(v8, v9, v10))
  {
    uint64_t v18 = *MEMORY[0x1E4F28568];
    v19 = @"Necessary entitlement missing: 'com.apple.bluetooth.system'.";
    uint64_t v16 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v11, (uint64_t)&v19, &v18, 1);
    uint64_t v15 = objc_msgSend_CMErrorWithCode_userInfo_(CMErrorUtils, v17, 110, v16);
    goto LABEL_8;
  }
  uint64_t v12 = (void (*)(id, void))*((void *)a3 + 2);

  v12(a3, 0);
}

- (CMAudioAccessoryUsageDelegate)delegate
{
  return (CMAudioAccessoryUsageDelegate *)objc_loadWeak((id *)&self->_delegate);
}

- (int64_t)isAuthorized
{
  return self->_authorizationStatus;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  sub_190421DA8((uint64_t *)&self->_locationConnection, 0);
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

@end