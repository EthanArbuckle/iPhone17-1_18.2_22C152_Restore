@interface CMHeadphoneActivityManager
+ (int64_t)authorizationStatus;
- (BOOL)hasConnectionClients;
- (BOOL)isActivityActive;
- (BOOL)isActivityAvailable;
- (BOOL)isStatusActive;
- (BOOL)mslLoggingEnabled;
- (CMHeadphoneActivityManager)init;
- (id)delegateQueuePrivate;
- (void)dealloc;
- (void)notifyDeviceConnectedEventToClientPrivate;
- (void)notifyDeviceDisconnectedEventToClientPrivate;
- (void)onActivityPrivate:(id)a3 error:(id)a4;
- (void)onStatusEventPrivate:(id)a3;
- (void)pauseActivityStreamingPrivate;
- (void)pauseStatusStreamingPrivate;
- (void)resumeActivityStreamingPrivate;
- (void)resumeStatusStreamingPrivate;
- (void)startActivityUpdatesPrivateToQueue:(id)a3 withHandler:(id)a4;
- (void)startActivityUpdatesToQueue:(id)a3 withHandler:(id)a4;
- (void)startMslLoggingWithFilenamePrefix:(id)a3 filePath:(id)a4;
- (void)startStatusUpdatesPrivateToQueue:(id)a3 withHandler:(id)a4;
- (void)startStatusUpdatesToQueue:(id)a3 withHandler:(id)a4;
- (void)stopActivityUpdates;
- (void)stopActivityUpdatesPrivate;
- (void)stopMslLogging;
- (void)stopStatusUpdates;
- (void)stopStatusUpdatesPrivate;
@end

@implementation CMHeadphoneActivityManager

- (CMHeadphoneActivityManager)init
{
  v4.receiver = self;
  v4.super_class = (Class)CMHeadphoneActivityManager;
  v2 = [(CMHeadphoneActivityManager *)&v4 init];
  if (v2) {
    v2->_internal = (CMHeadphoneActivityManagerInternal *)objc_opt_new();
  }
  return v2;
}

- (void)dealloc
{
  dispatch_queue_set_specific((dispatch_queue_t)self->_internal->_dispatchQueue, &unk_1E929E930, &unk_1E929E930, 0);
  if (dispatch_get_specific(&unk_1E929E930) == &unk_1E929E930)
  {
    objc_msgSend_pauseActivityStreamingPrivate(self, v3, v4);
    objc_msgSend_pauseStatusStreamingPrivate(self, v6, v7);
    objc_msgSend_stopMslLoggingPrivate(self->_internal, v8, v9);
  }
  else
  {
    dispatchQueue = self->_internal->_dispatchQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_190588CE8;
    block[3] = &unk_1E568D118;
    block[4] = self;
    dispatch_sync(dispatchQueue, block);
  }

  v10.receiver = self;
  v10.super_class = (Class)CMHeadphoneActivityManager;
  [(CMHeadphoneActivityManager *)&v10 dealloc];
}

+ (int64_t)authorizationStatus
{
  return objc_msgSend_authorizationStatus(CMMotionUtils, a2, v2);
}

- (BOOL)isActivityAvailable
{
  if (qword_1EB3BF618 != -1) {
    dispatch_once(&qword_1EB3BF618, &unk_1EDFD3F00);
  }
  return byte_1EB3BF610;
}

- (BOOL)isActivityActive
{
  return self->_internal->_activityActive;
}

- (BOOL)isStatusActive
{
  return self->_internal->_statusActive;
}

- (void)startActivityUpdatesToQueue:(id)a3 withHandler:(id)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_190588E60;
  v4[3] = &unk_1E568D398;
  v4[4] = self;
  v4[5] = a3;
  v4[6] = a4;
  objc_msgSend_tccServiceMotionAccessAllowingMacWithBlock_(CMMotionUtils, a2, (uint64_t)v4);
}

- (void)stopActivityUpdates
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = sub_190588F70;
  v2[3] = &unk_1E568D118;
  v2[4] = self;
  objc_msgSend_tccServiceMotionAccessAllowingMacWithBlock_(CMMotionUtils, a2, (uint64_t)v2);
}

- (void)startStatusUpdatesToQueue:(id)a3 withHandler:(id)a4
{
  dispatchQueue = self->_internal->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_19058906C;
  block[3] = &unk_1E568D398;
  block[4] = self;
  void block[5] = a3;
  block[6] = a4;
  dispatch_async(dispatchQueue, block);
}

- (void)stopStatusUpdates
{
  dispatchQueue = self->_internal->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1905890F4;
  block[3] = &unk_1E568D118;
  block[4] = self;
  dispatch_sync(dispatchQueue, block);
}

- (BOOL)mslLoggingEnabled
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dispatchQueue = self->_internal->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1905891AC;
  v5[3] = &unk_1E568DDB0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)startMslLoggingWithFilenamePrefix:(id)a3 filePath:(id)a4
{
  dispatchQueue = self->_internal->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_190589260;
  block[3] = &unk_1E568F490;
  block[4] = self;
  void block[5] = a3;
  block[6] = a4;
  dispatch_async(dispatchQueue, block);
}

- (void)stopMslLogging
{
  dispatchQueue = self->_internal->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1905892EC;
  block[3] = &unk_1E568D118;
  block[4] = self;
  dispatch_sync(dispatchQueue, block);
}

- (id)delegateQueuePrivate
{
  id result = self->_internal->_activityCallbackQueue;
  if (!result) {
    return (id)objc_msgSend_mainQueue(MEMORY[0x1E4F28F08], a2, v2);
  }
  return result;
}

- (BOOL)hasConnectionClients
{
  internal = self->_internal;
  return internal->_statusHandler || internal->_activityHandler != 0;
}

- (void)startActivityUpdatesPrivateToQueue:(id)a3 withHandler:(id)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internal->_dispatchQueue);
  if (objc_msgSend_isActivityAvailable(self, v7, v8))
  {
    if (!self->_internal->_activityActive)
    {
      self->_internal->_activityCallbackQueue = (NSOperationQueue *)a3;
      self->_internal->_activityHandler = (id)objc_msgSend_copy(a4, v9, v10);
      objc_msgSend_resumeActivityStreamingPrivate(self, v11, v12);
      self->_internal->_activityActive = 1;
    }
  }
}

- (void)stopActivityUpdatesPrivate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internal->_dispatchQueue);
  if (objc_msgSend_isActivityAvailable(self, v3, v4) && self->_internal->_activityActive)
  {
    objc_msgSend_pauseActivityStreamingPrivate(self, v5, v6);
    self->_internal->_activityActive = 0;

    self->_internal->_activityCallbackQueue = 0;
    self->_internal->_activityHandler = 0;
    internal = self->_internal;
    MEMORY[0x1F4181798](internal, sel_disconnectActivity, v7);
  }
}

- (void)resumeActivityStreamingPrivate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internal->_dispatchQueue);
  if (objc_msgSend_isActivityAvailable(self, v3, v4))
  {
    internal = self->_internal;
    if (!internal->_activityStreaming)
    {
      objc_msgSend_connectActivity(internal, v5, v6);
      char v9 = objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x1E4F28DB0], v8, MEMORY[0x1E4F1CC08], 1, 0);
      objc_initWeak(&location, self);
      activityConnectionClient = self->_internal->_activityConnectionClient;
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = sub_190589590;
      v11[3] = &unk_1E568FDF0;
      objc_copyWeak(&v12, &location);
      sub_19047D160((uint64_t)activityConnectionClient, @"kRMStartStreamingHeadphoneActivity", v9, v11);
      self->_internal->_activityStreaming = 1;
      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
    }
  }
}

- (void)pauseActivityStreamingPrivate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internal->_dispatchQueue);
  if (objc_msgSend_isActivityAvailable(self, v3, v4))
  {
    internal = self->_internal;
    if (internal->_activityStreaming)
    {
      internal->_activityStreaming = 0;
      sub_19047D810((uint64_t)self->_internal->_activityConnectionClient);
      if ((objc_msgSend_hasConnectionClients(self, v6, v7) & 1) == 0)
      {
        objc_msgSend_notifyDeviceDisconnectedEventToClientPrivate(self, v8, v9);
      }
    }
  }
}

- (void)onActivityPrivate:(id)a3 error:(id)a4
{
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  internal = self->_internal;
  if (Current >= internal->_startTime)
  {
    id activityHandler = internal->_activityHandler;
    if (activityHandler) {
      BOOL v11 = ((unint64_t)a3 | (unint64_t)a4) == 0;
    }
    else {
      BOOL v11 = 1;
    }
    if (!v11)
    {
      activityCallbackQueue = internal->_activityCallbackQueue;
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = sub_1905898AC;
      v13[3] = &unk_1E568D398;
      v13[4] = a3;
      v13[5] = a4;
      v13[6] = activityHandler;
      objc_msgSend_addOperationWithBlock_(activityCallbackQueue, v7, (uint64_t)v13);
    }
  }
}

- (void)startStatusUpdatesPrivateToQueue:(id)a3 withHandler:(id)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internal->_dispatchQueue);
  if (objc_msgSend_isStatusAvailable(self, v7, v8))
  {
    if (!self->_internal->_statusActive)
    {
      self->_internal->_statusCallbackQueue = (NSOperationQueue *)a3;
      self->_internal->_statusHandler = (id)objc_msgSend_copy(a4, v9, v10);
      objc_msgSend_resumeStatusStreamingPrivate(self, v11, v12);
      self->_internal->_statusActive = 1;
    }
  }
}

- (void)stopStatusUpdatesPrivate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internal->_dispatchQueue);
  if (objc_msgSend_isStatusAvailable(self, v3, v4))
  {
    if (self->_internal->_statusActive)
    {
      objc_msgSend_pauseStatusStreamingPrivate(self, v5, v6);
      self->_internal->_statusActive = 0;

      self->_internal->_statusCallbackQueue = 0;
      self->_internal->_statusHandler = 0;
      if ((objc_msgSend_hasConnectionClients(self, v7, v8) & 1) == 0)
      {
        internal = self->_internal;
        MEMORY[0x1F4181798](internal, sel_disconnectStatus, v9);
      }
    }
  }
}

- (void)resumeStatusStreamingPrivate
{
  v17[1] = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internal->_dispatchQueue);
  if (objc_msgSend_isStatusAvailable(self, v3, v4))
  {
    internal = self->_internal;
    if (!internal->_statusStreaming)
    {
      objc_msgSend_connectStatus(internal, v5, v6);
      v16 = @"RequireActivitySupport";
      v17[0] = MEMORY[0x1E4F1CC38];
      uint64_t v9 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v8, (uint64_t)v17, &v16, 1);
      BOOL v11 = objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x1E4F28DB0], v10, v9, 1, 0);
      objc_initWeak(&location, self);
      statusConnectionClient = self->_internal->_statusConnectionClient;
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = sub_190589D4C;
      v13[3] = &unk_1E568FDF0;
      objc_copyWeak(&v14, &location);
      sub_19047D160((uint64_t)statusConnectionClient, @"kRMStartStreamingHeadphoneStatus", v11, v13);
      self->_internal->_statusStreaming = 1;
      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }
  }
}

- (void)pauseStatusStreamingPrivate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internal->_dispatchQueue);
  if (objc_msgSend_isStatusAvailable(self, v3, v4))
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
    self->_internal->_startTime = CFAbsoluteTimeGetCurrent() + 1.0;
    MEMORY[0x1F4181798](self, sel_notifyDeviceConnectedEventToClientPrivate, v7);
  }
  else if (objc_msgSend_isEqualToString_(v4, v6, @"Disconnect"))
  {
    self->_internal->_startTime = 1.79769313e308;
    objc_msgSend_notifyDeviceDisconnectedEventToClientPrivate(self, v8, v9);
  }
  else
  {
    if (qword_1EB3BE878 != -1) {
      dispatch_once(&qword_1EB3BE878, &unk_1EDFC1F40);
    }
    uint64_t v10 = off_1EB3BE870;
    if (os_log_type_enabled((os_log_t)off_1EB3BE870, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v13 = v4;
      _os_log_impl(&dword_1902AF000, v10, OS_LOG_TYPE_ERROR, "[CMHeadphoneActivityManager] Unknown eventType: %{public}@", buf, 0xCu);
    }
    if (sub_1902D8400(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EB3BE878 != -1) {
        dispatch_once(&qword_1EB3BE878, &unk_1EDFC1F40);
      }
      BOOL v11 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 0, "-[CMHeadphoneActivityManager onStatusEventPrivate:]", "CoreLocation: %s\n", v11);
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
  v6[2] = sub_19058A1C4;
  v6[3] = &unk_1E568D118;
  v6[4] = self;
  objc_msgSend_addOperationWithBlock_(v4, v5, (uint64_t)v6);
}

- (void)notifyDeviceDisconnectedEventToClientPrivate
{
  uint64_t v4 = objc_msgSend_delegateQueuePrivate(self, a2, v2);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_19058A604;
  v6[3] = &unk_1E568D118;
  v6[4] = self;
  objc_msgSend_addOperationWithBlock_(v4, v5, (uint64_t)v6);
}

@end