@interface CMIndoorOutdoorManager
+ (BOOL)isIndoorOutdoorStateAvailable;
- (CMIndoorOutdoorDelegate)delegate;
- (CMIndoorOutdoorManager)init;
- (void)dealloc;
- (void)lastKnownIndoorOutdoorStateWithHandler:(id)a3;
- (void)setDelegate:(id)a3;
- (void)startIndoorOutdoorUpdates;
- (void)stopIndoorOutdoorUpdates;
@end

@implementation CMIndoorOutdoorManager

+ (BOOL)isIndoorOutdoorStateAvailable
{
  sub_1902BAD40();
  sub_1902BAD40();

  return sub_19046BC40();
}

- (CMIndoorOutdoorManager)init
{
  v4.receiver = self;
  v4.super_class = (Class)CMIndoorOutdoorManager;
  v2 = [(CMIndoorOutdoorManager *)&v4 init];
  if (v2) {
    v2->_internal = (CMIndoorOutdoorManagerInternal *)objc_opt_new();
  }
  return v2;
}

- (void)dealloc
{
  internalQueue = self->_internal->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1904C08D4;
  block[3] = &unk_1E568D118;
  block[4] = self;
  dispatch_sync(internalQueue, block);

  v4.receiver = self;
  v4.super_class = (Class)CMIndoorOutdoorManager;
  [(CMIndoorOutdoorManager *)&v4 dealloc];
}

- (void)setDelegate:(id)a3
{
  self->_internal->_delegate = (CMIndoorOutdoorDelegate *)a3;
  self->_internal->_sender = self;
}

- (void)startIndoorOutdoorUpdates
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (qword_1E929D9B8 != -1) {
    dispatch_once(&qword_1E929D9B8, &unk_1EDFD3C20);
  }
  v3 = qword_1E929D9C0;
  if (os_log_type_enabled((os_log_t)qword_1E929D9C0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1902AF000, v3, OS_LOG_TYPE_DEFAULT, "IndoorOutdoor, starting indoor/outdoor updates", buf, 2u);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929D9B8 != -1) {
      dispatch_once(&qword_1E929D9B8, &unk_1EDFD3C20);
    }
    v13 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CMIndoorOutdoorManager startIndoorOutdoorUpdates]", "CoreLocation: %s\n", v13);
    if (v13 != (char *)buf) {
      free(v13);
    }
  }
  objc_super v4 = objc_opt_class();
  if (objc_msgSend_isIndoorOutdoorStateAvailable(v4, v5, v6))
  {
    objc_msgSend__startIndoorOutdoorUpdates(self->_internal, v7, v8);
  }
  else
  {
    objc_loadWeak((id *)&self->_delegate);
    if (objc_opt_respondsToSelector())
    {
      uint64_t v10 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v9, @"CMErrorDomain", 109, 0);
      id Weak = objc_loadWeak((id *)&self->_delegate);
      objc_msgSend_indoorOutdoorManager_failedToStartUpdatesWithError_(Weak, v12, (uint64_t)self, v10);
    }
  }
}

- (void)stopIndoorOutdoorUpdates
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (qword_1E929D9B8 != -1) {
    dispatch_once(&qword_1E929D9B8, &unk_1EDFD3C20);
  }
  v3 = qword_1E929D9C0;
  if (os_log_type_enabled((os_log_t)qword_1E929D9C0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1902AF000, v3, OS_LOG_TYPE_DEFAULT, "IndoorOutdoor, stopping indoor/outdoor updates", buf, 2u);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929D9B8 != -1) {
      dispatch_once(&qword_1E929D9B8, &unk_1EDFD3C20);
    }
    uint64_t v6 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CMIndoorOutdoorManager stopIndoorOutdoorUpdates]", "CoreLocation: %s\n", v6);
    if (v6 != (char *)buf) {
      free(v6);
    }
  }
  objc_msgSend__stopIndoorOutdoorUpdates(self->_internal, v4, v5);
}

- (void)lastKnownIndoorOutdoorStateWithHandler:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (qword_1E929D9B8 != -1) {
    dispatch_once(&qword_1E929D9B8, &unk_1EDFD3C20);
  }
  uint64_t v5 = qword_1E929D9C0;
  if (os_log_type_enabled((os_log_t)qword_1E929D9C0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1902AF000, v5, OS_LOG_TYPE_DEFAULT, "IndoorOutdoor, getting last known state", buf, 2u);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929D9B8 != -1) {
      dispatch_once(&qword_1E929D9B8, &unk_1EDFD3C20);
    }
    v11 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CMIndoorOutdoorManager lastKnownIndoorOutdoorStateWithHandler:]", "CoreLocation: %s\n", v11);
    if (v11 != (char *)buf) {
      free(v11);
    }
  }
  uint64_t v6 = objc_opt_class();
  if (objc_msgSend_isIndoorOutdoorStateAvailable(v6, v7, v8))
  {
    objc_msgSend__lastKnownIndoorOutdoorStateWithHandler_(self->_internal, v9, (uint64_t)a3);
  }
  else
  {
    uint64_t v10 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v9, @"CMErrorDomain", 109, 0);
    (*((void (**)(id, void, uint64_t))a3 + 2))(a3, 0, v10);
  }
}

- (CMIndoorOutdoorDelegate)delegate
{
  return (CMIndoorOutdoorDelegate *)objc_loadWeak((id *)&self->_delegate);
}

- (void).cxx_destruct
{
}

@end