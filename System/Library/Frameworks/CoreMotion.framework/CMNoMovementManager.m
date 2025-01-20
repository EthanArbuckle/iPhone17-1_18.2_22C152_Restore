@interface CMNoMovementManager
+ (BOOL)isAvailable;
- (CMNoMovementManager)init;
- (CMNoMovementManagerDelegate)delegate;
- (id).cxx_construct;
- (void)_connect;
- (void)_disconnect;
- (void)_handleMessage:(shared_ptr<CLConnectionMessage>)a3;
- (void)dealloc;
- (void)requestLatestStateUpdate;
- (void)setDelegate:(id)a3;
@end

@implementation CMNoMovementManager

- (CMNoMovementManager)init
{
  v4.receiver = self;
  v4.super_class = (Class)CMNoMovementManager;
  id v2 = [(CMNoMovementManager *)&v4 init];
  if (v2)
  {
    *((void *)v2 + 2) = dispatch_queue_create("com.apple.CoreMotion.CMNoMovementManager", 0);
    sub_190421DA8((uint64_t *)v2 + 1, 0);
  }
  return (CMNoMovementManager *)v2;
}

- (void)dealloc
{
  dispatch_queue_set_specific((dispatch_queue_t)self->fInternalQueue, &unk_1E929E7F8, &unk_1E929E7F8, 0);
  if (dispatch_get_specific(&unk_1E929E7F8) == &unk_1E929E7F8)
  {
    objc_msgSend__disconnect(self, v3, v4);
  }
  else
  {
    fInternalQueue = self->fInternalQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_190427FCC;
    block[3] = &unk_1E568D118;
    block[4] = self;
    dispatch_sync(fInternalQueue, block);
  }
  dispatch_release((dispatch_object_t)self->fInternalQueue);
  self->fInternalQueue = 0;
  v6.receiver = self;
  v6.super_class = (Class)CMNoMovementManager;
  [(CMNoMovementManager *)&v6 dealloc];
}

+ (BOOL)isAvailable
{
  return 0;
}

- (void)setDelegate:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  fInternalQueue = self->fInternalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1904281D0;
  block[3] = &unk_1E568D190;
  block[4] = self;
  void block[5] = a3;
  dispatch_async(fInternalQueue, block);
  if (qword_1E929DA38 != -1) {
    dispatch_once(&qword_1E929DA38, &unk_1EDFD3980);
  }
  uint64_t v4 = qword_1E929DA40;
  if (os_log_type_enabled((os_log_t)qword_1E929DA40, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1902AF000, v4, OS_LOG_TYPE_DEBUG, "[CMNoMovementManager] set delegate", buf, 2u);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929DA38 != -1) {
      dispatch_once(&qword_1E929DA38, &unk_1EDFD3980);
    }
    v5 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CMNoMovementManager setDelegate:]", "CoreLocation: %s\n", v5);
    if (v5 != (char *)buf) {
      free(v5);
    }
  }
}

- (void)requestLatestStateUpdate
{
  fInternalQueue = self->fInternalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1904282B4;
  block[3] = &unk_1E568D118;
  block[4] = self;
  dispatch_async(fInternalQueue, block);
}

- (void)_connect
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->fInternalQueue);
  if (!self->fLocationdConnection.__ptr_.__value_) {
    operator new();
  }
}

- (void)_disconnect
{
  v14[1] = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->fInternalQueue);
  v13 = @"kCLConnectionMessageSubscribeKey";
  v14[0] = MEMORY[0x1E4F1CC28];
  uint64_t v11 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v3, (uint64_t)v14, &v13, 1);
  sub_190429158(&v9, &v11);
  value = self->fLocationdConnection.__ptr_.__value_;
  p_fLocationdConnection = (uint64_t *)&self->fLocationdConnection;
  if (value)
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
  sub_190421DA8(p_fLocationdConnection, 0);
  if (qword_1E929DA38 != -1) {
    dispatch_once(&qword_1E929DA38, &unk_1EDFD3980);
  }
  objc_super v6 = qword_1E929DA40;
  if (os_log_type_enabled((os_log_t)qword_1E929DA40, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1902AF000, v6, OS_LOG_TYPE_DEFAULT, "[CMNoMovementManager] ended connection", buf, 2u);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929DA38 != -1) {
      dispatch_once(&qword_1E929DA38, &unk_1EDFD3980);
    }
    v7 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CMNoMovementManager _disconnect]", "CoreLocation: %s\n", v7);
    if (v7 != (char *)buf) {
      free(v7);
    }
  }
  if (v10) {
    sub_1902D8B58(v10);
  }
}

- (void)_handleMessage:(shared_ptr<CLConnectionMessage>)a3
{
  var0 = (CLConnectionMessage **)a3.var0;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (qword_1E929DA38 != -1) {
    dispatch_once(&qword_1E929DA38, &unk_1EDFD3980);
  }
  v5 = qword_1E929DA40;
  if (os_log_type_enabled((os_log_t)qword_1E929DA40, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = CLConnectionMessage::name(*var0);
    if (*(char *)(v6 + 23) >= 0) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = *(void *)v6;
    }
    *(_DWORD *)buf = 136315138;
    uint64_t v23 = v7;
    _os_log_impl(&dword_1902AF000, v5, OS_LOG_TYPE_DEFAULT, "[CMNoMovementManager] received message, now handling %s", buf, 0xCu);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929DA38 != -1) {
      dispatch_once(&qword_1E929DA38, &unk_1EDFD3980);
    }
    uint64_t v15 = CLConnectionMessage::name(*var0);
    if (*(char *)(v15 + 23) >= 0) {
      uint64_t v16 = v15;
    }
    else {
      uint64_t v16 = *(void *)v15;
    }
    int v20 = 136315138;
    uint64_t v21 = v16;
    v17 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CMNoMovementManager _handleMessage:]", "CoreLocation: %s\n", v17);
    if (v17 != (char *)buf) {
      free(v17);
    }
  }
  uint64_t v8 = (void *)CLConnectionMessage::name(*var0);
  int v9 = *((char *)v8 + 23);
  if (v9 < 0)
  {
    if (v8[1] != 43) {
      return;
    }
    uint64_t v8 = (void *)*v8;
  }
  else if (v9 != 43)
  {
    return;
  }
  if (!memcmp(v8, "kCLConnectionMessageCheckInNoMovementUpdate", 0x2BuLL))
  {
    objc_loadWeak((id *)&self->_delegate);
    if (objc_opt_respondsToSelector())
    {
      v10 = *var0;
      uint64_t v11 = (objc_class *)objc_opt_class();
      uint64_t ObjectOfClass = CLConnectionMessage::getObjectOfClass(v10, v11);
      fInternalQueue = self->fInternalQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = sub_190428F60;
      block[3] = &unk_1E568D190;
      block[4] = self;
      void block[5] = ObjectOfClass;
      dispatch_async(fInternalQueue, block);
    }
    else
    {
      if (qword_1E929DA38 != -1) {
        dispatch_once(&qword_1E929DA38, &unk_1EDFD3980);
      }
      v14 = qword_1E929DA40;
      if (os_log_type_enabled((os_log_t)qword_1E929DA40, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1902AF000, v14, OS_LOG_TYPE_ERROR, "[CMNoMovementManager] delegate does not respond to didStateUpdate", buf, 2u);
      }
      if (sub_1902D8400(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1E929DA38 != -1) {
          dispatch_once(&qword_1E929DA38, &unk_1EDFD3980);
        }
        LOWORD(v20) = 0;
        v18 = (char *)_os_log_send_and_compose_impl();
        sub_1902D398C("Generic", 1, 0, 0, "-[CMNoMovementManager _handleMessage:]", "CoreLocation: %s\n", v18);
        if (v18 != (char *)buf) {
          free(v18);
        }
      }
    }
  }
}

- (CMNoMovementManagerDelegate)delegate
{
  return (CMNoMovementManagerDelegate *)objc_loadWeak((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  sub_190421DA8((uint64_t *)&self->fLocationdConnection, 0);
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

@end