@interface OSDCaptureStream
- (BOOL)_registerForStreamNotifications:(id *)a3;
- (BOOL)_unregisterForStreamNotifications:(id *)a3;
- (BOOL)start:(id *)a3;
- (BOOL)stop:(id *)a3;
- (OSDCaptureStream)initWithStream:(OpaqueFigCaptureStream *)a3;
- (OS_dispatch_queue)workQueue;
- (OS_dispatch_semaphore)streamStartSemaphore;
- (OS_dispatch_semaphore)streamStopSemaphore;
- (OpaqueFigCaptureStream)streamRef;
- (id)name:(id *)a3;
- (int)backingCopyProperty:(__CFString *)a3 dest:(const void *)a4;
- (int)backingSetProperty:(__CFString *)a3 value:(void *)a4;
- (void)_receivedNotification:(__CFString *)a3 notificationObject:(id)a4 notificationPayload:(id)a5;
- (void)backingRef;
- (void)dealloc;
- (void)setStreamStartSemaphore:(id)a3;
- (void)setStreamStopSemaphore:(id)a3;
- (void)setWorkQueue:(id)a3;
- (void)teardown;
@end

@implementation OSDCaptureStream

- (OSDCaptureStream)initWithStream:(OpaqueFigCaptureStream *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)OSDCaptureStream;
  v4 = [(OSDCaptureStream *)&v9 init];
  v5 = v4;
  if (v4)
  {
    if (!a3) {
      sub_10000A74C();
    }
    v4->_streamRef = a3;
    CFRetain(a3);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.DiagnosticsService.Diagnostic-4009.OSDCaptureDevice.workQueue", 0);
    workQueue = v5->_workQueue;
    v5->_workQueue = (OS_dispatch_queue *)v6;
  }
  return v5;
}

- (void)dealloc
{
  [(OSDCaptureStream *)self teardown];
  v3.receiver = self;
  v3.super_class = (Class)OSDCaptureStream;
  [(OSDCaptureStream *)&v3 dealloc];
}

- (void)teardown
{
  streamRef = self->_streamRef;
  if (streamRef)
  {
    CFRelease(streamRef);
    self->_streamRef = 0;
  }
}

- (id)name:(id *)a3
{
  id v3 = [(OSDPropertyBasedDevice *)self copyProperty:kFigCaptureStreamProperty_PortType error:a3];

  return v3;
}

- (void)backingRef
{
  return self->_streamRef;
}

- (int)backingSetProperty:(__CFString *)a3 value:(void *)a4
{
  uint64_t FigBaseObject = FigCaptureStreamGetFigBaseObject();
  uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  objc_super v9 = *(uint64_t (**)(uint64_t, __CFString *, void *))(v8 + 56);
  if (!v9) {
    return -12782;
  }

  return v9(FigBaseObject, a3, a4);
}

- (int)backingCopyProperty:(__CFString *)a3 dest:(const void *)a4
{
  uint64_t FigBaseObject = FigCaptureStreamGetFigBaseObject();
  uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  objc_super v9 = *(uint64_t (**)(uint64_t, __CFString *, const CFAllocatorRef, const void **))(v8 + 48);
  if (!v9) {
    return -12782;
  }

  return v9(FigBaseObject, a3, kCFAllocatorDefault, a4);
}

- (BOOL)_registerForStreamNotifications:(id *)a3
{
  CMNotificationCenterGetDefaultLocalCenter();
  uint64_t v5 = kFigCaptureStreamNotification_Discontinuity;
  [(OSDCaptureStream *)self streamRef];
  int v6 = CMNotificationCenterAddListener();
  BOOL v7 = v6 == 0;
  if (v6) {
    +[OSDError setError:a3, @"com.apple.osdiags.OSDCaptureDevice", 1, @"%@: Failure to register for stream notification. Cannot add listener for %@", self, v5 withDomain withCode format];
  }
  uint64_t v8 = kFigCaptureStreamNotification_StreamStarted;
  [(OSDCaptureStream *)self streamRef];
  if (CMNotificationCenterAddListener())
  {
    +[OSDError setError:a3, @"com.apple.osdiags.OSDCaptureDevice", 1, @"%@: Failure to register for stream notification. Cannot add listener for %@", self, v8 withDomain withCode format];
    BOOL v7 = 0;
  }
  uint64_t v9 = kFigCaptureStreamNotification_StreamStopped;
  [(OSDCaptureStream *)self streamRef];
  if (CMNotificationCenterAddListener())
  {
    +[OSDError setError:a3, @"com.apple.osdiags.OSDCaptureDevice", 1, @"%@: Failure to register for stream notification. Cannot add listener for %@", self, v9 withDomain withCode format];
    return 0;
  }
  if (!v7) {
    return 0;
  }
  v10 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v13 = self;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Successfully added stream notifications to %@", buf, 0xCu);
  }

  return 1;
}

- (BOOL)_unregisterForStreamNotifications:(id *)a3
{
  CMNotificationCenterGetDefaultLocalCenter();
  uint64_t v5 = kFigCaptureStreamNotification_Discontinuity;
  [(OSDCaptureStream *)self streamRef];
  int v6 = CMNotificationCenterRemoveListener();
  BOOL v7 = v6 == 0;
  if (v6) {
    +[OSDError setError:a3, @"com.apple.osdiags.OSDCaptureDevice", 1, @"%@: Failure to unregister for stream notification. Cannot remove listener for %@", self, v5 withDomain withCode format];
  }
  uint64_t v8 = kFigCaptureStreamNotification_StreamStarted;
  [(OSDCaptureStream *)self streamRef];
  if (CMNotificationCenterRemoveListener())
  {
    +[OSDError setError:a3, @"com.apple.osdiags.OSDCaptureDevice", 1, @"%@: Failure to unregister for stream notification. Cannot remove listener for %@", self, v8 withDomain withCode format];
    BOOL v7 = 0;
  }
  uint64_t v9 = kFigCaptureStreamNotification_StreamStopped;
  [(OSDCaptureStream *)self streamRef];
  if (CMNotificationCenterRemoveListener())
  {
    +[OSDError setError:a3, @"com.apple.osdiags.OSDCaptureDevice", 1, @"%@: Failure to unregister for stream notification. Cannot remove listener for %@", self, v9 withDomain withCode format];
    return 0;
  }
  if (!v7) {
    return 0;
  }
  v10 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v13 = self;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Successfully removed stream notifications from %@", buf, 0xCu);
  }

  return 1;
}

- (void)_receivedNotification:(__CFString *)a3 notificationObject:(id)a4 notificationPayload:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  objc_initWeak(&location, self);
  v10 = [(OSDCaptureStream *)self workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004B44;
  block[3] = &unk_1000104D8;
  objc_copyWeak(v12, &location);
  v12[1] = a3;
  dispatch_async(v10, block);

  objc_destroyWeak(v12);
  objc_destroyWeak(&location);
}

- (BOOL)start:(id *)a3
{
  v4 = self;
  objc_sync_enter(v4);
  if ([(OSDCaptureStream *)v4 _registerForStreamNotifications:a3])
  {
    dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
    [(OSDCaptureStream *)v4 setStreamStartSemaphore:v5];

    int v6 = [(OSDCaptureStream *)v4 streamRef];
    uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v7) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = 0;
    }
    id v9 = *(uint64_t (**)(OpaqueFigCaptureStream *))(v8 + 8);
    if (v9) {
      uint64_t v10 = v9(v6);
    }
    else {
      uint64_t v10 = 4294954514;
    }
    v11 = [(OSDCaptureStream *)v4 streamStartSemaphore];
    dispatch_time_t v12 = dispatch_time(0, 2000000000);
    intptr_t v13 = dispatch_semaphore_wait(v11, v12);

    if (v13)
    {
      +[OSDError setError:a3, @"com.apple.osdiags.OSDCaptureDevice", 1, @"%@ >> timed out trying to start the stream!", v4 withDomain withCode format];
    }
    else
    {
      if (!v10)
      {
        [(OSDCaptureStream *)v4 setStreamStartSemaphore:0];
        BOOL v14 = 1;
        goto LABEL_13;
      }
      +[OSDError setError:a3, @"com.apple.osdiags.OSDCaptureDevice", 1, @"%@ >> Error %d (0x%08x) cannot start the capture stream!", v4, v10, v10 withDomain withCode format];
    }
  }
  BOOL v14 = 0;
LABEL_13:
  objc_sync_exit(v4);

  return v14;
}

- (BOOL)stop:(id *)a3
{
  v4 = self;
  objc_sync_enter(v4);
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  [(OSDCaptureStream *)v4 setStreamStopSemaphore:v5];

  int v6 = [(OSDCaptureStream *)v4 streamRef];
  uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  id v9 = *(uint64_t (**)(OpaqueFigCaptureStream *))(v8 + 16);
  if (v9) {
    uint64_t v10 = v9(v6);
  }
  else {
    uint64_t v10 = 4294954514;
  }
  v11 = [(OSDCaptureStream *)v4 streamStopSemaphore];
  dispatch_time_t v12 = dispatch_time(0, 2000000000);
  intptr_t v13 = dispatch_semaphore_wait(v11, v12);

  if (v13) {
    +[OSDError setError:a3, @"com.apple.osdiags.OSDCaptureDevice", 1, @"%@ >> timed out trying to stop the stream!", v4 withDomain withCode format];
  }
  if (v10)
  {
    +[OSDError setError:a3, @"com.apple.osdiags.OSDCaptureDevice", 1, @"%@ >> Error %d (0x%08x) cannot stop the capture stream!", v4, v10, v10 withDomain withCode format];
LABEL_13:
    BOOL v14 = 0;
    goto LABEL_14;
  }
  if (![(OSDCaptureStream *)v4 _unregisterForStreamNotifications:a3]) {
    goto LABEL_13;
  }
  [(OSDCaptureStream *)v4 setStreamStopSemaphore:0];
  BOOL v14 = 1;
LABEL_14:
  objc_sync_exit(v4);

  return v14;
}

- (OpaqueFigCaptureStream)streamRef
{
  return self->_streamRef;
}

- (OS_dispatch_semaphore)streamStartSemaphore
{
  return self->_streamStartSemaphore;
}

- (void)setStreamStartSemaphore:(id)a3
{
}

- (OS_dispatch_semaphore)streamStopSemaphore
{
  return self->_streamStopSemaphore;
}

- (void)setStreamStopSemaphore:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_streamStopSemaphore, 0);

  objc_storeStrong((id *)&self->_streamStartSemaphore, 0);
}

@end