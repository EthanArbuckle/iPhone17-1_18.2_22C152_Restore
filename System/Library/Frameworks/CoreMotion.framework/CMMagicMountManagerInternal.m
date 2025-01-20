@interface CMMagicMountManagerInternal
- (CMMagicMountManagerInternal)init;
- (id).cxx_construct;
- (void)connect;
- (void)dealloc;
- (void)sendAPWakesRequestPrivate;
- (void)sendServiceRequestPrivate;
- (void)teardownPrivate;
@end

@implementation CMMagicMountManagerInternal

- (CMMagicMountManagerInternal)init
{
  v3.receiver = self;
  v3.super_class = (Class)CMMagicMountManagerInternal;
  result = [(CMMagicMountManagerInternal *)&v3 init];
  if (result)
  {
    *(_WORD *)&result->_serviceEnabled = 256;
    result->_magicMountStateQueue = 0;
    result->_magicMountStateDispatcher = 0;
    result->_magicMountStateHandler = 0;
  }
  return result;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)CMMagicMountManagerInternal;
  [(CMMagicMountManagerInternal *)&v2 dealloc];
}

- (void)teardownPrivate
{
  connection = self->_connection;
  if (connection)
  {
    uint64_t v4 = MEMORY[0x192FCC3F0](connection, a2);
    MEMORY[0x192FCC980](v4, 0xB0C40BC2CC919);
    self->_connection = 0;
  }

  self->_connectionQueue = 0;
}

- (void)connect
{
  if (!self->_connection)
  {
    self->_connectionQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.CoreMotion.CMMagicMountManager", 0);
    operator new();
  }
}

- (void)sendServiceRequestPrivate
{
  v13[1] = *MEMORY[0x1E4F143B8];
  sub_1902D6BD0();
  sub_1904DFAD8();
  objc_msgSend_connect(self, v3, v4);
  BOOL serviceEnabled = self->_serviceEnabled;
  v12 = @"CMMagicMountServiceEnable";
  v13[0] = objc_msgSend_numberWithBool_(NSNumber, v6, serviceEnabled);
  uint64_t v11 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v7, (uint64_t)v13, &v12, 1);
  sub_19050F15C("kCLConnectionMessageMagicMountServiceRequest", &v11, &v9);
  v8 = v10;
  if (v10) {
    atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  CLConnectionClient::sendMessage();
  if (v8) {
    sub_1902D8B58(v8);
  }
  if (v10) {
    sub_1902D8B58(v10);
  }
}

- (void)sendAPWakesRequestPrivate
{
  v19[1] = *MEMORY[0x1E4F143B8];
  sub_1902D6BD0();
  sub_1904DFAD8();
  objc_msgSend_connect(self, v3, v4);
  BOOL apWakesAllowed = self->_apWakesAllowed;
  v18 = @"CMMagicMountAPWakesAllowed";
  v19[0] = objc_msgSend_numberWithBool_(NSNumber, v6, apWakesAllowed);
  uint64_t v13 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v7, (uint64_t)v19, &v18, 1);
  sub_19050F15C("kCLConnectionMessageMagicMountAPWakesAllowed", &v13, &v11);
  if (qword_1E929D8C8 != -1) {
    dispatch_once(&qword_1E929D8C8, &unk_1EDFD3F60);
  }
  v8 = qword_1E929D8D0;
  if (os_log_type_enabled((os_log_t)qword_1E929D8D0, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67240192;
    BOOL v17 = apWakesAllowed;
    _os_log_impl(&dword_1902AF000, v8, OS_LOG_TYPE_DEBUG, "Sending AP wakes request, allowed =  %{public}d", buf, 8u);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929D8C8 != -1) {
      dispatch_once(&qword_1E929D8C8, &unk_1EDFD3F60);
    }
    int v14 = 67240192;
    BOOL v15 = apWakesAllowed;
    uint64_t v9 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CMMagicMountManagerInternal sendAPWakesRequestPrivate]", "CoreLocation: %s\n", v9);
    if (v9 != (char *)buf) {
      free(v9);
    }
  }
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

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

@end