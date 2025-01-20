@interface CMContextConfigurationManager
- (CMContextConfigurationManager)init;
- (void)connect;
- (void)dealloc;
- (void)disconnect;
- (void)writeContextConfiguration:(id)a3 withHandler:(id)a4;
@end

@implementation CMContextConfigurationManager

- (CMContextConfigurationManager)init
{
  v4.receiver = self;
  v4.super_class = (Class)CMContextConfigurationManager;
  v2 = [(CMContextConfigurationManager *)&v4 init];
  if (v2)
  {
    v2->fInternalQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.CoreMotion.CMContextConfigurationManager", 0);
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  objc_msgSend_disconnect(self, a2, v2);
  v4.receiver = self;
  v4.super_class = (Class)CMContextConfigurationManager;
  [(CMContextConfigurationManager *)&v4 dealloc];
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

- (void)writeContextConfiguration:(id)a3 withHandler:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (!a4)
  {
    v11 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, (uint64_t)a3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v11, v12, (uint64_t)a2, self, @"CMContextConfigurationManager.mm", 83, @"Invalid parameter not satisfying: %@", @"handler");
  }
  if (self->fLocationdConnection)
  {
    v16 = @"CMContextConfigurationKey";
    id v17 = a3;
    uint64_t v15 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], a2, (uint64_t)&v17, &v16, 1);
    sub_1904EF480("kCLConnectionMessageWriteContextConfiguration", &v15, buf);
    v14 = v19;
    if (v19) {
      atomic_fetch_add_explicit(&v19->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    CLConnectionClient::sendMessage();
    if (v14) {
      sub_1902D8B58(v14);
    }
    if (v19) {
      sub_1902D8B58(v19);
    }
  }
  else
  {
    if (qword_1E929D9A8 != -1) {
      dispatch_once(&qword_1E929D9A8, &unk_1EDFD3800);
    }
    v7 = qword_1E929D9B0;
    if (os_log_type_enabled((os_log_t)qword_1E929D9B0, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1902AF000, v7, OS_LOG_TYPE_ERROR, "Error in writeContextConfiguration. Invalid locationd connection", buf, 2u);
    }
    if (sub_1902D8400(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D9A8 != -1) {
        dispatch_once(&qword_1E929D9A8, &unk_1EDFD3800);
      }
      LOWORD(v15) = 0;
      v13 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 0, "-[CMContextConfigurationManager writeContextConfiguration:withHandler:]", "CoreLocation: %s\n", v13);
      if (v13 != (char *)buf) {
        free(v13);
      }
    }
    uint64_t v9 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v8, @"CMErrorDomain", 103, 0);
    (*((void (**)(id, uint64_t))a4 + 2))(a4, v9);
  }
}

@end