@interface NFCCCameraMonitor
- (NFCCCameraMonitor)init;
- (NFCCCameraMonitorDelegate)delegate;
- (unsigned)_service;
- (void)_capturingCameraTypesDidChange:(int64_t)a3;
- (void)_notifyDelegateIfNeeded;
- (void)_registerForCameraNotifications;
- (void)_unregisterForCameraNotifications;
- (void)dealloc;
- (void)setDelegate:(id)a3;
@end

@implementation NFCCCameraMonitor

- (NFCCCameraMonitor)init
{
  v9.receiver = self;
  v9.super_class = (Class)NFCCCameraMonitor;
  v2 = [(NFCCCameraMonitor *)&v9 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INITIATED, 0);

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.BarcodeSupport.NFCControlCenterModule.NFCCCameraMonitor", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v7 = v2;
  }

  return v2;
}

- (void)dealloc
{
  ioNotificationPort = self->_ioNotificationPort;
  if (ioNotificationPort) {
    IONotificationPortDestroy(ioNotificationPort);
  }
  io_object_t notificationObject = self->_notificationObject;
  if (notificationObject) {
    IOObjectRelease(notificationObject);
  }
  v5.receiver = self;
  v5.super_class = (Class)NFCCCameraMonitor;
  [(NFCCCameraMonitor *)&v5 dealloc];
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_3A1C;
  v7[3] = &unk_C320;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_unregisterForCameraNotifications
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  ioNotificationPort = self->_ioNotificationPort;
  if (ioNotificationPort)
  {
    IONotificationPortDestroy(ioNotificationPort);
    self->_ioNotificationPort = 0;
  }
  io_object_t notificationObject = self->_notificationObject;
  if (notificationObject)
  {
    IOObjectRelease(notificationObject);
    self->_io_object_t notificationObject = 0;
  }
}

- (void)_registerForCameraNotifications
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(NFCCCameraMonitor *)self _unregisterForCameraNotifications];
  v3 = IONotificationPortCreate(kIOMasterPortDefault);
  self->_ioNotificationPort = v3;
  if (v3)
  {
    IONotificationPortSetDispatchQueue(v3, (dispatch_queue_t)self->_queue);
    io_registry_entry_t v4 = [(NFCCCameraMonitor *)self _service];
    if (v4)
    {
      io_object_t v5 = v4;
      sub_3C6C(self, v4, -536870608);
      if (IOServiceAddInterestNotification(self->_ioNotificationPort, v5, "IOGeneralInterest", (IOServiceInterestCallback)sub_3C6C, self, &self->_notificationObject))
      {
        if (qword_11D98 != -1) {
          dispatch_once(&qword_11D98, &stru_C3C0);
        }
        id v6 = qword_11D90;
        if (os_log_type_enabled((os_log_t)qword_11D90, OS_LOG_TYPE_ERROR)) {
          sub_8368(v6, v7, v8, v9, v10, v11, v12, v13);
        }
      }
      else
      {
        IOObjectRelease(v5);
      }
    }
    else
    {
      if (qword_11D98 != -1) {
        dispatch_once(&qword_11D98, &stru_C3C0);
      }
      v22 = qword_11D90;
      if (os_log_type_enabled((os_log_t)qword_11D90, OS_LOG_TYPE_ERROR)) {
        sub_8330(v22, v23, v24, v25, v26, v27, v28, v29);
      }
    }
  }
  else
  {
    if (qword_11D98 != -1) {
      dispatch_once(&qword_11D98, &stru_C3C0);
    }
    v14 = qword_11D90;
    if (os_log_type_enabled((os_log_t)qword_11D90, OS_LOG_TYPE_ERROR)) {
      sub_82F8(v14, v15, v16, v17, v18, v19, v20, v21);
    }
  }
}

- (unsigned)_service
{
  uint64_t v2 = 0;
  char v3 = 1;
  do
  {
    CFDictionaryRef v4 = IOServiceMatching(off_C340[v2]);
    unsigned int result = IOServiceGetMatchingService(kIOMasterPortDefault, v4);
    if ((v3 & 1) == 0) {
      break;
    }
    char v3 = 0;
    uint64_t v2 = 1;
  }
  while (!result);
  return result;
}

- (void)_capturingCameraTypesDidChange:(int64_t)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (qword_11D98 != -1) {
    dispatch_once(&qword_11D98, &stru_C3C0);
  }
  io_object_t v5 = qword_11D90;
  if (os_log_type_enabled((os_log_t)qword_11D90, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 67109120;
    HIDWORD(buf) = a3;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "Capturing camera types did change: %d", (uint8_t *)&buf, 8u);
  }
  self->_cameraCapturing = a3 != 0;
  objc_initWeak(&buf, self);
  dispatch_time_t v6 = dispatch_time(0, 100000000);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_3EF4;
  block[3] = &unk_C358;
  objc_copyWeak(&v9, &buf);
  dispatch_after(v6, queue, block);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&buf);
}

- (void)_notifyDelegateIfNeeded
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  lastNotifiedCameraCapturing = self->_lastNotifiedCameraCapturing;
  if (!lastNotifiedCameraCapturing
    || (BOOL cameraCapturing = self->_cameraCapturing,
        cameraCapturing != [(NSNumber *)lastNotifiedCameraCapturing BOOLValue]))
  {
    io_object_t v5 = +[NSNumber numberWithBool:self->_cameraCapturing];
    dispatch_time_t v6 = self->_lastNotifiedCameraCapturing;
    self->_lastNotifiedCameraCapturing = v5;

    if (qword_11D98 != -1) {
      dispatch_once(&qword_11D98, &stru_C3C0);
    }
    uint64_t v7 = qword_11D90;
    if (os_log_type_enabled((os_log_t)qword_11D90, OS_LOG_TYPE_INFO))
    {
      if (self->_cameraCapturing) {
        CFStringRef v8 = @"YES";
      }
      else {
        CFStringRef v8 = @"NO";
      }
      *(_DWORD *)id buf = 138412290;
      CFStringRef v11 = v8;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "Notifying delegate, camera capturing: %@", buf, 0xCu);
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_40B0;
    block[3] = &unk_C380;
    void block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (NFCCCameraMonitorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NFCCCameraMonitorDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_lastNotifiedCameraCapturing, 0);
}

@end