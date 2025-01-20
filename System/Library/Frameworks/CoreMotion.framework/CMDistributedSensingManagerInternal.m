@interface CMDistributedSensingManagerInternal
- (CMDistributedSensingManagerInternal)init;
- (void)_handleDaemonMessage:(id)a3 data:(id)a4;
- (void)_registerForVehicleStateUpdates;
- (void)_teardown;
- (void)_unregisterForVehicleStateUpdates;
- (void)dealloc;
@end

@implementation CMDistributedSensingManagerInternal

- (CMDistributedSensingManagerInternal)init
{
  v5.receiver = self;
  v5.super_class = (Class)CMDistributedSensingManagerInternal;
  v2 = [(CMDistributedSensingManagerInternal *)&v5 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v2->_internalQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.CoreMotion.CMDistributedSensingManagerInternalQueue", v3);
    v2->_clientQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.CoreMotion.CMDistributedSensingManagerClientQueue", v3);
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  dispatch_release((dispatch_object_t)self->_internalQueue);
  self->_internalQueue = 0;
  dispatch_release((dispatch_object_t)self->_clientQueue);
  self->_clientQueue = 0;
  v3.receiver = self;
  v3.super_class = (Class)CMDistributedSensingManagerInternal;
  [(CMDistributedSensingManagerInternal *)&v3 dealloc];
}

- (void)_teardown
{
  objc_msgSend__unregisterForVehicleStateUpdates(self, a2, v2);
  sub_1902C3F54(&__p, "DistributedSensing/kCLConnectionMessageDistributedSensingVehicleStateUpdate");
  CLConnectionClient::setHandlerForMessage();
  if (v6 < 0) {
    operator delete(__p);
  }
  if (self->_locationdConnection)
  {
    uint64_t v4 = MEMORY[0x192FCC3F0]();
    MEMORY[0x192FCC980](v4, 0xB0C40BC2CC919);
  }
  self->_locationdConnection = 0;
}

- (void)_handleDaemonMessage:(id)a3 data:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (!objc_loadWeak((id *)&self->_delegate)) {
    return;
  }
  if (!a4)
  {
    if (qword_1E929D978 != -1) {
      dispatch_once(&qword_1E929D978, &unk_1EDFD16C0);
    }
    v18 = qword_1E929D980;
    if (os_log_type_enabled((os_log_t)qword_1E929D980, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1902AF000, v18, OS_LOG_TYPE_FAULT, "nil dictionary", buf, 2u);
    }
    if (!sub_1902D8400(115, 0)) {
      return;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1E929D978 != -1) {
      dispatch_once(&qword_1E929D978, &unk_1EDFD16C0);
    }
    LOWORD(v30) = 0;
LABEL_30:
    v26 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 0, "-[CMDistributedSensingManagerInternal _handleDaemonMessage:data:]", "CoreLocation: %s\n", v26);
    if (v26 != (char *)buf) {
      free(v26);
    }
    return;
  }
  if (objc_msgSend_isEqualToString_(a3, v7, @"DistributedSensing/kCLConnectionMessageDistributedSensingVehicleStateUpdate"))
  {
    if (objc_msgSend_objectForKeyedSubscript_(a4, v8, @"CMErrorMessage"))
    {
      v10 = objc_msgSend_objectForKeyedSubscript_(a4, v9, @"CMErrorMessage");
      uint64_t v13 = objc_msgSend_integerValue(v10, v11, v12);
      uint64_t v15 = objc_msgSend_CMErrorWithCode_(CMErrorUtils, v14, v13);
      if (qword_1E929D978 != -1) {
        dispatch_once(&qword_1E929D978, &unk_1EDFD16C0);
      }
      v16 = qword_1E929D980;
      if (os_log_type_enabled((os_log_t)qword_1E929D980, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v33 = v15;
        _os_log_impl(&dword_1902AF000, v16, OS_LOG_TYPE_ERROR, "Vehicle State, error, %@", buf, 0xCu);
      }
      if (sub_1902D8400(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1E929D978 != -1) {
          dispatch_once(&qword_1E929D978, &unk_1EDFD16C0);
        }
        int v30 = 138412290;
        uint64_t v31 = v15;
        v27 = (char *)_os_log_send_and_compose_impl();
        sub_1902D398C("Generic", 1, 0, 0, "-[CMDistributedSensingManagerInternal _handleDaemonMessage:data:]", "CoreLocation: %s\n", v27);
        if (v27 != (char *)buf) {
          free(v27);
        }
      }
      clientQueue = self->_clientQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = sub_190472130;
      block[3] = &unk_1E568D190;
      block[4] = self;
      block[5] = v15;
      dispatch_async(clientQueue, block);
    }
    else if (objc_msgSend_objectForKeyedSubscript_(a4, v9, @"CMDistributedSensingVehicleStateUpdateKey"))
    {
      v21 = objc_msgSend_objectForKeyedSubscript_(a4, v20, @"CMDistributedSensingVehicleStateUpdateKey");
      v24 = objc_msgSend_copy(v21, v22, v23);
      v25 = self->_clientQueue;
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = sub_1904721B0;
      v28[3] = &unk_1E568D190;
      v28[4] = self;
      v28[5] = v24;
      dispatch_async(v25, v28);
    }
    return;
  }
  if (qword_1E929D978 != -1) {
    dispatch_once(&qword_1E929D978, &unk_1EDFD16C0);
  }
  v19 = qword_1E929D980;
  if (os_log_type_enabled((os_log_t)qword_1E929D980, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1902AF000, v19, OS_LOG_TYPE_FAULT, "Unrecognizable dictionary", buf, 2u);
  }
  if (sub_1902D8400(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929D978 != -1) {
      dispatch_once(&qword_1E929D978, &unk_1EDFD16C0);
    }
    LOWORD(v30) = 0;
    goto LABEL_30;
  }
}

- (void)_registerForVehicleStateUpdates
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1904722A4;
  block[3] = &unk_1E568D118;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

- (void)_unregisterForVehicleStateUpdates
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_19047256C;
  block[3] = &unk_1E568D118;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_manager);

  objc_destroyWeak((id *)&self->_delegate);
}

@end