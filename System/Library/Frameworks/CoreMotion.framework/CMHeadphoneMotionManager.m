@interface CMHeadphoneMotionManager
+ (CMAuthorizationStatus)authorizationStatus;
- (BOOL)hasConnectionClients;
- (BOOL)isConnectionStatusActive;
- (BOOL)isDeviceMotionActive;
- (BOOL)isDeviceMotionAvailable;
- (CMDeviceMotion)deviceMotion;
- (CMHeadphoneMotionManager)init;
- (id)delegate;
- (id)delegateQueuePrivate;
- (void)applyInitialReferencePrivate:(id)a3;
- (void)dealloc;
- (void)notifyDeviceConnectedEventToClientPrivate;
- (void)notifyDeviceDisconnectedEventToClientPrivate;
- (void)onDeviceMotionPrivate:(id)a3;
- (void)onStatusEventPrivate:(id)a3;
- (void)pauseDeviceMotionStreamingPrivate;
- (void)pauseStatusStreamingPrivate;
- (void)resumeDeviceMotionStreamingPrivate;
- (void)resumeStatusStreamingPrivate;
- (void)setDelegate:(id)delegate;
- (void)startConnectionStatusUpdates;
- (void)startDeviceMotionUpdates;
- (void)startDeviceMotionUpdatesPrivateToQueue:(id)a3 withHandler:(id)a4;
- (void)startDeviceMotionUpdatesToQueue:(NSOperationQueue *)queue withHandler:(CMHeadphoneDeviceMotionHandler)handler;
- (void)startStatusUpdatesPrivate;
- (void)stopConnectionStatusUpdates;
- (void)stopDeviceMotionUpdates;
- (void)stopDeviceMotionUpdatesPrivate;
- (void)stopStatusUpdatesPrivate;
@end

@implementation CMHeadphoneMotionManager

- (CMHeadphoneMotionManager)init
{
  v4.receiver = self;
  v4.super_class = (Class)CMHeadphoneMotionManager;
  v2 = [(CMHeadphoneMotionManager *)&v4 init];
  if (v2) {
    v2->_internal = (CMHeadphoneMotionManagerInternal *)objc_opt_new();
  }
  return v2;
}

- (void)dealloc
{
  dispatch_queue_set_specific((dispatch_queue_t)self->_internal->_dispatchQueue, &unk_1E929E938, &unk_1E929E938, 0);
  if (dispatch_get_specific(&unk_1E929E938) == &unk_1E929E938)
  {
    objc_msgSend_pauseDeviceMotionStreamingPrivate(self, v3, v4);
    objc_msgSend_pauseStatusStreamingPrivate(self, v6, v7);
  }
  else
  {
    dispatchQueue = self->_internal->_dispatchQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1905906B8;
    block[3] = &unk_1E568D118;
    block[4] = self;
    dispatch_sync(dispatchQueue, block);
  }

  v8.receiver = self;
  v8.super_class = (Class)CMHeadphoneMotionManager;
  [(CMHeadphoneMotionManager *)&v8 dealloc];
}

+ (CMAuthorizationStatus)authorizationStatus
{
  return objc_msgSend_authorizationStatus(CMMotionUtils, a2, v2);
}

- (BOOL)isDeviceMotionAvailable
{
  if (qword_1EB3BF638 != -1) {
    dispatch_once(&qword_1EB3BF638, &unk_1EDFC20A0);
  }
  return byte_1EB3BF630;
}

- (BOOL)isDeviceMotionActive
{
  return self->_internal->_deviceMotionActive;
}

- (BOOL)isConnectionStatusActive
{
  return self->_internal->_statusStreaming;
}

- (CMDeviceMotion)deviceMotion
{
  return (CMDeviceMotion *)((uint64_t (*)(CMHeadphoneMotionManagerInternal *, char *))MEMORY[0x1F4181798])(self->_internal, sel_deviceMotion);
}

- (void)startDeviceMotionUpdates
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = sub_190590824;
  v2[3] = &unk_1E568D118;
  v2[4] = self;
  objc_msgSend_tccServiceMotionAccessAllowingMacWithBlock_(CMMotionUtils, a2, (uint64_t)v2);
}

- (void)startDeviceMotionUpdatesToQueue:(NSOperationQueue *)queue withHandler:(CMHeadphoneDeviceMotionHandler)handler
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_190590928;
  v4[3] = &unk_1E568D398;
  v4[4] = self;
  v4[5] = queue;
  v4[6] = handler;
  objc_msgSend_tccServiceMotionAccessAllowingMacWithBlock_(CMMotionUtils, a2, (uint64_t)v4);
}

- (void)stopDeviceMotionUpdates
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = sub_190590A38;
  v2[3] = &unk_1E568D118;
  v2[4] = self;
  objc_msgSend_tccServiceMotionAccessAllowingMacWithBlock_(CMMotionUtils, a2, (uint64_t)v2);
}

- (void)startConnectionStatusUpdates
{
  dispatchQueue = self->_internal->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_190590B30;
  block[3] = &unk_1E568D118;
  block[4] = self;
  dispatch_sync(dispatchQueue, block);
}

- (void)stopConnectionStatusUpdates
{
  dispatchQueue = self->_internal->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_190590BB0;
  block[3] = &unk_1E568D118;
  block[4] = self;
  dispatch_sync(dispatchQueue, block);
}

- (BOOL)hasConnectionClients
{
  id Weak = objc_loadWeak((id *)&self->_delegate);
  internal = self->_internal;
  return Weak && internal->_statusActive || internal->_deviceMotionActive;
}

- (id)delegateQueuePrivate
{
  id result = self->_internal->_callbackQueue;
  if (!result) {
    return (id)objc_msgSend_mainQueue(MEMORY[0x1E4F28F08], a2, v2);
  }
  return result;
}

- (void)startDeviceMotionUpdatesPrivateToQueue:(id)a3 withHandler:(id)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internal->_dispatchQueue);
  if (objc_msgSend_isDeviceMotionAvailable(self, v7, v8))
  {
    if (!self->_internal->_deviceMotionActive)
    {
      self->_internal->_callbackQueue = (NSOperationQueue *)a3;
      self->_internal->_callbackHandler = (id)objc_msgSend_copy(a4, v9, v10);
      objc_msgSend_resumeDeviceMotionStreamingPrivate(self, v11, v12);
      self->_internal->_deviceMotionActive = 1;
    }
  }
}

- (void)stopDeviceMotionUpdatesPrivate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internal->_dispatchQueue);
  if (objc_msgSend_isDeviceMotionAvailable(self, v3, v4))
  {
    internal = self->_internal;
    if (internal->_deviceMotionActive)
    {
      internal->_deviceMotionActive = 0;
      objc_msgSend_pauseDeviceMotionStreamingPrivate(self, v5, v6);

      self->_internal->_callbackQueue = 0;
      self->_internal->_callbackHandler = 0;
      objc_msgSend_setDeviceMotion_(self->_internal, v8, 0);
      v11 = self->_internal;
      objc_msgSend_disconnect(v11, v9, v10);
    }
  }
}

- (void)resumeDeviceMotionStreamingPrivate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internal->_dispatchQueue);
  if (objc_msgSend_isDeviceMotionAvailable(self, v3, v4))
  {
    internal = self->_internal;
    if (!internal->_deviceMotionStreaming)
    {
      objc_msgSend_connect(internal, v5, v6);
      objc_msgSend_resumeStatusStreamingPrivate(self, v8, v9);
      v11 = objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x1E4F28DB0], v10, (uint64_t)&unk_1EE001BD8, 1, 0);
      objc_initWeak(&location, self);
      connectionClient = self->_internal->_connectionClient;
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = sub_190590E88;
      v13[3] = &unk_1E568FDF0;
      objc_copyWeak(&v14, &location);
      sub_19047D160((uint64_t)connectionClient, @"kRMStartStreamingHeadphoneMotion", v11, v13);
      self->_internal->_deviceMotionStreaming = 1;
      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }
  }
}

- (void)pauseDeviceMotionStreamingPrivate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internal->_dispatchQueue);
  if (objc_msgSend_isDeviceMotionAvailable(self, v3, v4))
  {
    internal = self->_internal;
    if (internal->_deviceMotionStreaming)
    {
      sub_19047D810((uint64_t)internal->_connectionClient);
      self->_internal->_deviceMotionStreaming = 0;
      if ((objc_msgSend_hasConnectionClients(self, v6, v7) & 1) == 0)
      {
        objc_msgSend_pauseStatusStreamingPrivate(self, v8, v9);
        objc_msgSend_notifyDeviceDisconnectedEventToClientPrivate(self, v10, v11);
      }
      CFAbsoluteTimeGetCurrent();
      AnalyticsSendEventLazy();
    }
  }
}

- (void)onDeviceMotionPrivate:(id)a3
{
  if (objc_msgSend_isInitialized(a3, a2, (uint64_t)a3))
  {
    objc_msgSend_applyInitialReferencePrivate_(self, v5, (uint64_t)a3);
    objc_msgSend_setDeviceMotion_(self->_internal, v6, (uint64_t)a3);
    if (a3)
    {
      internal = self->_internal;
      id callbackHandler = internal->_callbackHandler;
      if (callbackHandler)
      {
        callbackQueue = internal->_callbackQueue;
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = sub_190591384;
        v11[3] = &unk_1E568D2F8;
        v11[4] = a3;
        v11[5] = callbackHandler;
        objc_msgSend_addOperationWithBlock_(callbackQueue, v7, (uint64_t)v11);
      }
    }
  }
}

- (void)applyInitialReferencePrivate:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  if (!objc_msgSend_initialReferenceAttitude(self->_internal, a2, (uint64_t)a3))
  {
    uint64_t v7 = objc_msgSend_attitude(a3, v5, v6);
    objc_msgSend_quaternion(v7, v8, v9);
    v44[0] = v10;
    v13 = objc_msgSend_attitude(a3, v11, v12);
    objc_msgSend_quaternion(v13, v14, v15);
    v44[1] = v16;
    v19 = objc_msgSend_attitude(a3, v17, v18);
    objc_msgSend_quaternion(v19, v20, v21);
    v44[2] = v22;
    v25 = objc_msgSend_attitude(a3, v23, v24);
    objc_msgSend_quaternion(v25, v26, v27);
    v44[3] = v28;
    sub_1902B2690((uint64_t)v43, v44);
    v29 = [CMAttitude alloc];
    id v32 = (id)objc_msgSend_initWithQuaternion_(v29, v30, v31, v43[0], v43[1], v43[2], v43[3]);
    objc_msgSend_setInitialReferenceAttitude_(self->_internal, v33, (uint64_t)v32);
    self->_internal->_firstValidDeviceMotionTimestamp = CFAbsoluteTimeGetCurrent();
    if (qword_1EB3BE878 != -1) {
      dispatch_once(&qword_1EB3BE878, &unk_1EDFC1F00);
    }
    v34 = off_1EB3BE870;
    if (os_log_type_enabled((os_log_t)off_1EB3BE870, OS_LOG_TYPE_DEFAULT))
    {
      double v35 = self->_internal->_firstValidDeviceMotionTimestamp - self->_internal->_deviceConnectionTimestamp;
      *(_DWORD *)buf = 134349056;
      double v48 = v35;
      _os_log_impl(&dword_1902AF000, v34, OS_LOG_TYPE_DEFAULT, "[CMHeadphoneMotionManager] Initial reference attitude is set after %{public}.3f sec from connection", buf, 0xCu);
    }
    if (sub_1902D8400(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EB3BE878 != -1) {
        dispatch_once(&qword_1EB3BE878, &unk_1EDFC1F00);
      }
      double v41 = self->_internal->_firstValidDeviceMotionTimestamp - self->_internal->_deviceConnectionTimestamp;
      int v45 = 134349056;
      double v46 = v41;
      v42 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "-[CMHeadphoneMotionManager applyInitialReferencePrivate:]", "CoreLocation: %s\n", v42);
      if (v42 != (char *)buf) {
        free(v42);
      }
    }
  }
  v36 = objc_msgSend_attitude(a3, v5, v6);
  uint64_t v39 = objc_msgSend_initialReferenceAttitude(self->_internal, v37, v38);
  objc_msgSend_multiplyByInverseOfAttitude_(v36, v40, v39);
}

- (void)startStatusUpdatesPrivate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internal->_dispatchQueue);
  if (objc_msgSend_isDeviceMotionAvailable(self, v3, v4))
  {
    if (!self->_internal->_statusActive)
    {
      objc_msgSend_resumeStatusStreamingPrivate(self, v5, v6);
      self->_internal->_statusActive = 1;
    }
  }
}

- (void)stopStatusUpdatesPrivate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internal->_dispatchQueue);
  if (objc_msgSend_isDeviceMotionAvailable(self, v3, v4))
  {
    internal = self->_internal;
    if (internal->_statusActive && !internal->_deviceMotionActive)
    {
      objc_msgSend_pauseStatusStreamingPrivate(self, v5, v6);
      self->_internal->_statusActive = 0;
      if ((objc_msgSend_hasConnectionClients(self, v8, v9) & 1) == 0)
      {
        uint64_t v11 = self->_internal;
        MEMORY[0x1F4181798](v11, sel_disconnectStatus, v10);
      }
    }
  }
}

- (void)resumeStatusStreamingPrivate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internal->_dispatchQueue);
  if (objc_msgSend_isDeviceMotionAvailable(self, v3, v4))
  {
    internal = self->_internal;
    if (!internal->_statusStreaming)
    {
      objc_msgSend_connectStatus(internal, v5, v6);
      uint64_t v9 = objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x1E4F28DB0], v8, MEMORY[0x1E4F1CC08], 1, 0);
      objc_initWeak(&location, self);
      statusConnectionClient = self->_internal->_statusConnectionClient;
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = sub_1905919D8;
      v11[3] = &unk_1E568FDF0;
      objc_copyWeak(&v12, &location);
      sub_19047D160((uint64_t)statusConnectionClient, @"kRMStartStreamingHeadphoneStatus", v9, v11);
      self->_internal->_statusStreaming = 1;
      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
    }
  }
}

- (void)pauseStatusStreamingPrivate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internal->_dispatchQueue);
  if (objc_msgSend_isDeviceMotionAvailable(self, v3, v4))
  {
    internal = self->_internal;
    if (internal->_statusStreaming)
    {
      internal->_statusStreaming = 0;
      sub_19047D810((uint64_t)self->_internal->_statusConnectionClient);
      if ((objc_msgSend_hasConnectionClients(self, v6, v7) & 1) == 0)
      {
        objc_msgSend_notifyDeviceDisconnectedEventToClientPrivate(self, v8, v9);
      }
    }
  }
}

- (void)onStatusEventPrivate:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend_objectForKeyedSubscript_(a3, a2, @"EventType");
  if (objc_msgSend_isEqualToString_(v4, v5, @"Connect"))
  {
    objc_msgSend_setInitialReferenceAttitude_(self->_internal, v6, 0);
    self->_internal->_deviceConnectionTimestamp = CFAbsoluteTimeGetCurrent();
    MEMORY[0x1F4181798](self, sel_notifyDeviceConnectedEventToClientPrivate, v7);
  }
  else if (objc_msgSend_isEqualToString_(v4, v6, @"Disconnect"))
  {
    self->_internal->_deviceConnectionTimestamp = 0.0;
    objc_msgSend_notifyDeviceDisconnectedEventToClientPrivate(self, v8, v9);
  }
  else
  {
    if (qword_1EB3BE878 != -1) {
      dispatch_once(&qword_1EB3BE878, &unk_1EDFC1F00);
    }
    uint64_t v10 = off_1EB3BE870;
    if (os_log_type_enabled((os_log_t)off_1EB3BE870, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v13 = v4;
      _os_log_impl(&dword_1902AF000, v10, OS_LOG_TYPE_ERROR, "[CMHeadphoneMotionManager] Unknown eventType: %{public}@", buf, 0xCu);
    }
    if (sub_1902D8400(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EB3BE878 != -1) {
        dispatch_once(&qword_1EB3BE878, &unk_1EDFC1F00);
      }
      uint64_t v11 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 0, "-[CMHeadphoneMotionManager onStatusEventPrivate:]", "CoreLocation: %s\n", v11);
      if (v11 != (char *)buf) {
        free(v11);
      }
    }
  }
}

- (void)notifyDeviceConnectedEventToClientPrivate
{
  uint64_t v4 = objc_msgSend_delegateQueuePrivate(self, a2, v2);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_190591E50;
  v6[3] = &unk_1E568D118;
  v6[4] = self;
  objc_msgSend_addOperationWithBlock_(v4, v5, (uint64_t)v6);
}

- (void)notifyDeviceDisconnectedEventToClientPrivate
{
  uint64_t v4 = objc_msgSend_delegateQueuePrivate(self, a2, v2);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1905920B0;
  v6[3] = &unk_1E568D118;
  v6[4] = self;
  objc_msgSend_addOperationWithBlock_(v4, v5, (uint64_t)v6);
}

- (id)delegate
{
  return objc_loadWeak((id *)&self->_delegate);
}

- (void)setDelegate:(id)delegate
{
}

- (void).cxx_destruct
{
}

@end