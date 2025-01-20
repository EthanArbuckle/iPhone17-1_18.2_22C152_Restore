@interface AXMTDaemon
+ (BOOL)_connectionIsAuthorized:(id)a3;
- (AXMTLookAtPointTracker)_lookAtPointTracker;
- (AXMTLookAtPointTrackerObserver)_lookAtPointTrackerObserver;
- (AXSSMotionTrackingExpressionConfiguration)_expressionConfiguration;
- (AXSSMotionTrackingInputConfiguration)_inputConfiguration;
- (AXSSMotionTrackingInputManager)_inputManager;
- (AXSSMotionTrackingState)_state;
- (BOOL)_showDebugOverlay;
- (BOOL)isTracking;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSMutableArray)_trackingXPCConnections;
- (NSMutableArray)_xpcConnections;
- (NSXPCListener)_xpcListener;
- (OS_dispatch_queue)_xpcConnectionsQueue;
- (OS_os_transaction)_trackerTransaction;
- (double)_joystickModeMovementThreshold;
- (double)_sensitivity;
- (unint64_t)_motionTrackingMode;
- (void)_enumerateRemoteProxyDelegatesTrackingOnly:(BOOL)a3 work:(id)a4;
- (void)_handleConnectionClosedOnBackgroundThread:(id)a3;
- (void)_initializeSystemSettings;
- (void)_setXPCProperty:(id)a3;
- (void)_startOrUpdateTrackerIfNeeded;
- (void)_stopTrackerIfNoLongerNeeded;
- (void)_stopTrackerIfRunning;
- (void)_updateState:(id)a3;
- (void)dealloc;
- (void)hideDebugOverlay;
- (void)lookAtPointTrackerObserver:(id)a3 updatedState:(id)a4;
- (void)motionTrackingInputManager:(id)a3 updatedInputToUse:(id)a4;
- (void)playVideoAtURL:(id)a3 onMotionTrackingVideoFileInput:(id)a4 completionHandler:(id)a5;
- (void)recalibrateFace;
- (void)setExpressionConfiguration:(id)a3;
- (void)setInputConfiguration:(id)a3;
- (void)setJoystickModeMovementThreshold:(double)a3;
- (void)setLookAtPoint:(CGPoint)a3;
- (void)setMotionTrackingMode:(unint64_t)a3;
- (void)setSensitivity:(double)a3;
- (void)set_expressionConfiguration:(id)a3;
- (void)set_inputConfiguration:(id)a3;
- (void)set_inputManager:(id)a3;
- (void)set_joystickModeMovementThreshold:(double)a3;
- (void)set_lookAtPointTracker:(id)a3;
- (void)set_lookAtPointTrackerObserver:(id)a3;
- (void)set_motionTrackingMode:(unint64_t)a3;
- (void)set_sensitivity:(double)a3;
- (void)set_showDebugOverlay:(BOOL)a3;
- (void)set_state:(id)a3;
- (void)set_trackerTransaction:(id)a3;
- (void)set_trackingXPCConnections:(id)a3;
- (void)set_xpcConnections:(id)a3;
- (void)set_xpcConnectionsQueue:(id)a3;
- (void)set_xpcListener:(id)a3;
- (void)showDebugOverlay;
- (void)startDaemon;
- (void)startTracking;
- (void)stopTracking;
@end

@implementation AXMTDaemon

- (void)startDaemon
{
  v3 = AXSSLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "AXMTDaemon: startDaemon:", buf, 2u);
  }

  [(AXMTDaemon *)self _initializeSystemSettings];
  dispatch_queue_t v4 = dispatch_queue_create((const char *)[@"com.apple.accessibility.MotionTrackingAgent.queues.xpcConnections" UTF8String], 0);
  [(AXMTDaemon *)self set_xpcConnectionsQueue:v4];

  v5 = [(AXMTDaemon *)self _xpcConnectionsQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005414;
  block[3] = &unk_1000488D8;
  block[4] = self;
  dispatch_sync(v5, block);

  id v6 = objc_alloc((Class)NSXPCListener);
  id v7 = [v6 initWithMachServiceName:AXSSMotionTrackingDaemonIdentifier];
  [(AXMTDaemon *)self set_xpcListener:v7];

  v8 = [(AXMTDaemon *)self _xpcListener];
  [v8 setDelegate:self];

  v9 = [(AXMTDaemon *)self _xpcListener];
  [v9 resume];

  v10 = AXSSLogForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "AXMTDaemon: runloop started", buf, 2u);
  }

  while (1)
  {
    v11 = +[NSRunLoop mainRunLoop];
    v12 = +[NSDate distantFuture];
    [v11 runMode:NSDefaultRunLoopMode beforeDate:v12];
  }
}

- (void)dealloc
{
  [(NSXPCListener *)self->__xpcListener invalidate];
  [(AXSSMotionTrackingInputManager *)self->__inputManager stopMonitoring];
  v3.receiver = self;
  v3.super_class = (Class)AXMTDaemon;
  [(AXMTDaemon *)&v3 dealloc];
}

+ (BOOL)_connectionIsAuthorized:(id)a3
{
  if (!a3) {
    return 0;
  }
  memset(&cf[1], 0, sizeof(audit_token_t));
  [a3 auditToken];
  cf[0] = cf[1];
  objc_super v3 = SecTaskCreateWithAuditToken(0, cf);
  if (v3)
  {
    dispatch_queue_t v4 = v3;
    *(void *)cf[0].val = 0;
    CFTypeRef v5 = SecTaskCopyValueForEntitlement(v3, @"com.apple.private.acccessibility.motionTrackingClient", (CFErrorRef *)cf);
    if (*(void *)cf[0].val)
    {
      id v6 = AXSSLogForCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_10002C674((uint64_t *)cf, v6);
      }

      CFRelease(*(CFTypeRef *)cf[0].val);
    }
    if (v5)
    {
      CFTypeID v7 = CFGetTypeID(v5);
      if (v7 == CFBooleanGetTypeID())
      {
        int Value = CFBooleanGetValue((CFBooleanRef)v5);
        CFRelease(v5);
        CFRelease(v4);
        if (Value) {
          return 1;
        }
        goto LABEL_14;
      }
      CFRelease(v5);
    }
    CFRelease(v4);
  }
LABEL_14:
  v10 = AXSSLogForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    sub_10002C630(v10);
  }

  return 0;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = AXSSLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "AXMTDaemon: listener:shouldAcceptNewConnection:", (uint8_t *)buf, 2u);
  }

  unsigned int v9 = [(id)objc_opt_class() _connectionIsAuthorized:v7];
  if (v9)
  {
    v10 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___AXSSMotionTrackingDaemonProtocol];
    [v7 setExportedInterface:v10];
    [v7 setExportedObject:self];
    objc_initWeak(buf, v7);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10000594C;
    v22[3] = &unk_100048900;
    objc_copyWeak(&v23, buf);
    v22[4] = self;
    [v7 setInvalidationHandler:v22];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000059DC;
    v20[3] = &unk_100048900;
    objc_copyWeak(&v21, buf);
    v20[4] = self;
    [v7 setInterruptionHandler:v20];
    v11 = [(AXMTDaemon *)self _xpcConnectionsQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100005A6C;
    block[3] = &unk_100048928;
    block[4] = self;
    id v12 = v7;
    id v19 = v12;
    dispatch_sync(v11, block);

    v13 = &OBJC_PROTOCOL___AXSSMotionTrackingDaemonDelegateProtocol;
    v14 = +[NSXPCInterface interfaceWithProtocol:v13];
    [v12 setRemoteObjectInterface:v14];
    v15 = AXSSLogForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "AXMTDaemon: listener:shouldAcceptNewConnection: resuming connection", v17, 2u);
    }

    [v12 resume];
    objc_destroyWeak(&v21);
    objc_destroyWeak(&v23);
    objc_destroyWeak(buf);
  }
  return v9;
}

- (void)startTracking
{
  objc_super v3 = AXSSLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "AXMTDaemon: startTracking:", buf, 2u);
  }

  dispatch_queue_t v4 = +[NSXPCConnection currentConnection];
  if (v4)
  {
    CFTypeRef v5 = [(AXMTDaemon *)self _xpcConnectionsQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100005C20;
    block[3] = &unk_100048928;
    block[4] = self;
    id v8 = v4;
    dispatch_sync(v5, block);
  }
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100005CB4;
  v6[3] = &unk_1000488D8;
  v6[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

- (void)stopTracking
{
  objc_super v3 = AXSSLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v10 = "-[AXMTDaemon stopTracking]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  dispatch_queue_t v4 = +[NSXPCConnection currentConnection];
  if (v4)
  {
    CFTypeRef v5 = [(AXMTDaemon *)self _xpcConnectionsQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100005E5C;
    block[3] = &unk_100048928;
    block[4] = self;
    id v8 = v4;
    dispatch_sync(v5, block);
  }
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100005EF0;
  v6[3] = &unk_1000488D8;
  v6[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

- (void)recalibrateFace
{
  objc_super v3 = AXSSLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v6 = "-[AXMTDaemon recalibrateFace]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "AXMTDaemon: %s", buf, 0xCu);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006000;
  block[3] = &unk_1000488D8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (BOOL)isTracking
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100006188;
  v12[3] = &unk_100048950;
  v12[4] = self;
  v2 = objc_retainBlock(v12);
  if (+[NSThread isMainThread])
  {
    char v3 = ((uint64_t (*)(void *))v2[2])(v2);
  }
  else
  {
    uint64_t v8 = 0;
    unsigned int v9 = &v8;
    uint64_t v10 = 0x2020000000;
    char v11 = 0;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000061C0;
    block[3] = &unk_100048978;
    id v7 = &v8;
    id v6 = v2;
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
    char v3 = *((unsigned char *)v9 + 24) != 0;

    _Block_object_dispose(&v8, 8);
  }

  return v3;
}

- (void)showDebugOverlay
{
  char v3 = AXSSLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "AXMTDaemon: showDebugOverlay:", buf, 2u);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000062C4;
  block[3] = &unk_1000488D8;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)hideDebugOverlay
{
  char v3 = AXSSLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "AXMTDaemon: hideDebugOverlay:", buf, 2u);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006408;
  block[3] = &unk_1000488D8;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)setMotionTrackingMode:(unint64_t)a3
{
  CFTypeRef v5 = AXSSLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v8 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "AXMTDaemon:setMotionTrackingMode: motionTrackingMode %lu", buf, 0xCu);
  }

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000658C;
  v6[3] = &unk_1000489A0;
  v6[4] = self;
  void v6[5] = a3;
  [(AXMTDaemon *)self _setXPCProperty:v6];
}

- (void)setSensitivity:(double)a3
{
  CFTypeRef v5 = AXSSLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    double v8 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "AXMTDaemon:setSensitivity: sensitivity %f", buf, 0xCu);
  }

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100006718;
  v6[3] = &unk_1000489A0;
  v6[4] = self;
  *(double *)&void v6[5] = a3;
  [(AXMTDaemon *)self _setXPCProperty:v6];
}

- (void)setInputConfiguration:(id)a3
{
  id v4 = a3;
  CFTypeRef v5 = AXSSLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "AXMTDaemon: setInputConfiguration: %@", buf, 0xCu);
  }

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000068A4;
  v7[3] = &unk_100048928;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(AXMTDaemon *)self _setXPCProperty:v7];
}

- (void)setExpressionConfiguration:(id)a3
{
  id v4 = a3;
  CFTypeRef v5 = AXSSLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v10 = "-[AXMTDaemon setExpressionConfiguration:]";
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "AXMTDaemon: %s: %@", buf, 0x16u);
  }

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100006A38;
  v7[3] = &unk_100048928;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(AXMTDaemon *)self _setXPCProperty:v7];
}

- (void)setJoystickModeMovementThreshold:(double)a3
{
  CFTypeRef v5 = AXSSLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    double v8 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "AXMTDaemon: setJoystickModeMovementThreshold: %f", buf, 0xCu);
  }

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100006BA0;
  v6[3] = &unk_1000489A0;
  v6[4] = self;
  *(double *)&void v6[5] = a3;
  [(AXMTDaemon *)self _setXPCProperty:v6];
}

- (void)setLookAtPoint:(CGPoint)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100006C7C;
  v3[3] = &unk_1000489C8;
  v3[4] = self;
  CGPoint v4 = a3;
  [(AXMTDaemon *)self _setXPCProperty:v3];
}

- (void)playVideoAtURL:(id)a3 onMotionTrackingVideoFileInput:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  unsigned int v9 = (Block_layout *)a5;
  if (v9) {
    id v10 = v9;
  }
  else {
    id v10 = &stru_100048A08;
  }
  if (v7 && v8)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100006FB0;
    v14[3] = &unk_100048A58;
    id v15 = v7;
    id v16 = v8;
    v17 = v10;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v14);

    __int16 v11 = v15;
  }
  else
  {
    uint64_t v12 = AXSSMotionTrackingErrorDomain;
    NSErrorUserInfoKey v18 = NSLocalizedDescriptionKey;
    CFStringRef v19 = @"Invalid fileURL!";
    __int16 v11 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    v13 = +[NSError errorWithDomain:v12 code:0 userInfo:v11];
    v10->invoke(v10, 0, v13);
  }
}

- (void)lookAtPointTrackerObserver:(id)a3 updatedState:(id)a4
{
}

- (void)_updateState:(id)a3
{
  id v4 = a3;
  [(AXMTDaemon *)self set_state:v4];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100007128;
  v6[3] = &unk_100048A80;
  id v7 = v4;
  id v5 = v4;
  [(AXMTDaemon *)self _enumerateRemoteProxyDelegatesTrackingOnly:1 work:v6];
}

- (void)_enumerateRemoteProxyDelegatesTrackingOnly:(BOOL)a3 work:(id)a4
{
  id v6 = a4;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = sub_1000072B8;
  NSErrorUserInfoKey v18 = sub_1000072C8;
  id v19 = 0;
  id v7 = [(AXMTDaemon *)self _xpcConnectionsQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000072D0;
  block[3] = &unk_100048AA8;
  BOOL v13 = a3;
  void block[4] = self;
  void block[5] = &v14;
  dispatch_sync(v7, block);

  id v8 = (void *)v15[5];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100007350;
  v10[3] = &unk_100048B10;
  id v9 = v6;
  id v11 = v9;
  [v8 enumerateObjectsUsingBlock:v10];

  _Block_object_dispose(&v14, 8);
}

- (void)_handleConnectionClosedOnBackgroundThread:(id)a3
{
  id v4 = a3;
  id v5 = AXSSLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "AXMTDaemon: connection closed %@", buf, 0xCu);
  }

  if (v4)
  {
    [v4 invalidate];
    id v6 = [(AXMTDaemon *)self _xpcConnectionsQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000075AC;
    block[3] = &unk_100048928;
    void block[4] = self;
    id v9 = v4;
    dispatch_sync(v6, block);

    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100007680;
    v7[3] = &unk_1000488D8;
    v7[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);
  }
}

- (void)_stopTrackerIfNoLongerNeeded
{
  char v3 = AXSSLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10002C768(v3);
  }

  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  id v4 = [(AXMTDaemon *)self _xpcConnectionsQueue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100007798;
  v5[3] = &unk_100048B38;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(v4, v5);

  if (*((unsigned char *)v7 + 24)) {
    [(AXMTDaemon *)self _stopTrackerIfRunning];
  }
  _Block_object_dispose(&v6, 8);
}

- (void)_startOrUpdateTrackerIfNeeded
{
  char v3 = [(AXMTDaemon *)self _inputManager];

  if (!v3)
  {
    id v4 = objc_alloc((Class)AXSSMotionTrackingInputManager);
    id v5 = [(AXMTDaemon *)self _inputConfiguration];
    id v6 = [v4 initWithConfiguration:v5];
    [(AXMTDaemon *)self set_inputManager:v6];

    id v7 = [(AXMTDaemon *)self _inputManager];
    [v7 setDelegate:self];
  }
  uint64_t v8 = [(AXMTDaemon *)self _inputManager];
  [v8 startMonitoring];

  [@"com.apple.accessibility.MotionTrackingAgent.queues.xpcConnections" UTF8String];
  char v9 = (void *)os_transaction_create();
  [(AXMTDaemon *)self set_trackerTransaction:v9];

  id v10 = [(AXMTDaemon *)self _inputManager];
  id v11 = [v10 inputToUse];
  if (v11)
  {
  }
  else
  {
    int v12 = _AXSMossdeepEnabled();

    if (!v12) {
      goto LABEL_23;
    }
  }
  BOOL v13 = [(AXMTDaemon *)self _inputManager];
  uint64_t v14 = [v13 inputToUse];
  id v15 = AXMTLookAtPointTrackerClass(v14);

  if (v15)
  {
    uint64_t v16 = [(AXMTDaemon *)self _lookAtPointTracker];
    if (v16)
    {
      v17 = (void *)v16;
      NSErrorUserInfoKey v18 = [(AXMTDaemon *)self _lookAtPointTracker];
      uint64_t v19 = objc_opt_class();

      if (v15 != (id)v19)
      {
        v20 = AXSSLogForCategory();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          id v21 = [(AXMTDaemon *)self _lookAtPointTracker];
          *(_DWORD *)v67 = 138412290;
          *(void *)&v67[4] = objc_opt_class();
          id v22 = *(id *)&v67[4];
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "AXMTDaemon:startTracking: Tearing down tracker %@", v67, 0xCu);
        }
        id v23 = [(AXMTDaemon *)self _lookAtPointTracker];
        [v23 stopTracking];

        [(AXMTDaemon *)self set_lookAtPointTracker:0];
      }
    }
    v24 = [(AXMTDaemon *)self _lookAtPointTrackerObserver];

    if (!v24)
    {
      v25 = objc_alloc_init(AXMTLookAtPointTrackerObserver);
      [(AXMTDaemon *)self set_lookAtPointTrackerObserver:v25];

      v26 = [(AXMTDaemon *)self _lookAtPointTrackerObserver];
      [v26 setDelegate:self];
    }
    v27 = [(AXMTDaemon *)self _lookAtPointTracker];

    if (!v27)
    {
      v28 = [(AXMTDaemon *)self _inputConfiguration];
      v29 = [v28 allowedTrackingTypes];
      v30 = [v29 allObjects];
      v31 = [v30 firstObject];
      id v32 = [v31 unsignedIntegerValue];

      v33 = [(AXMTDaemon *)self _inputManager];
      v34 = [v33 inputToUse];
      v35 = AXMTCreateLookAtPointTracker(v34, (uint64_t)v32);
      [(AXMTDaemon *)self set_lookAtPointTracker:v35];

      v36 = AXSSLogForCategory();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        v37 = [(AXMTDaemon *)self _lookAtPointTracker];
        *(_DWORD *)v67 = 138412290;
        *(void *)&v67[4] = v37;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "AXMTDaemon:startTracking: creating lookAtPointTracker %@", v67, 0xCu);
      }
    }
    v38 = [(AXMTDaemon *)self _lookAtPointTracker];

    if (v38)
    {
      v39 = AXSSLogForCategory();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        v40 = [(AXMTDaemon *)self _lookAtPointTracker];
        *(_DWORD *)v67 = 138412290;
        *(void *)&v67[4] = v40;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "AXMTDaemon:startTracking: updating lookAtPointTracker %@", v67, 0xCu);
      }
      v41 = [(AXMTDaemon *)self _inputManager];
      v42 = [v41 inputToUse];
      v43 = [(AXMTDaemon *)self _lookAtPointTracker];
      [v43 setInput:v42];

      [(AXMTDaemon *)self _sensitivity];
      double v45 = v44;
      v46 = [(AXMTDaemon *)self _lookAtPointTracker];
      [v46 setSensitivity:v45];

      unint64_t v47 = [(AXMTDaemon *)self _motionTrackingMode];
      v48 = [(AXMTDaemon *)self _lookAtPointTracker];
      [v48 setMotionTrackingMode:v47];

      [(AXMTDaemon *)self _joystickModeMovementThreshold];
      double v50 = v49;
      v51 = [(AXMTDaemon *)self _lookAtPointTracker];
      [v51 setJoystickModeMovementThreshold:v50];

      v52 = [(AXMTDaemon *)self _expressionConfiguration];
      v53 = [(AXMTDaemon *)self _lookAtPointTracker];
      [v53 setExpressionConfiguration:v52];

      v54 = [(AXMTDaemon *)self _lookAtPointTrackerObserver];
      v55 = [(AXMTDaemon *)self _lookAtPointTracker];
      [v55 setDelegate:v54];

      v56 = [(AXMTDaemon *)self _lookAtPointTracker];
      [v56 startTracking];

      BOOL v57 = [(AXMTDaemon *)self _showDebugOverlay];
      v58 = [(AXMTDaemon *)self _lookAtPointTracker];
      [v58 setDebugOverlayEnabled:v57];
    }
    id v59 = [(AXMTDaemon *)self _lookAtPointTrackerObserver];
    v60 = [v59 state];
    [(AXMTDaemon *)self _updateState:v60];

    goto LABEL_30;
  }
LABEL_23:
  v61 = AXSSLogForCategory();
  if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
    sub_10002C7AC(self, v61);
  }

  v62 = [(AXMTDaemon *)self _lookAtPointTracker];

  if (v62)
  {
    v63 = [(AXMTDaemon *)self _lookAtPointTracker];
    [v63 stopTracking];

    [(AXMTDaemon *)self set_lookAtPointTracker:0];
  }
  v64 = [(AXMTDaemon *)self _lookAtPointTrackerObserver];

  if (v64)
  {
    v65 = [(AXMTDaemon *)self _lookAtPointTrackerObserver];
    [v65 setDelegate:0];

    [(AXMTDaemon *)self set_lookAtPointTrackerObserver:0];
  }
  id v59 = objc_alloc_init((Class)AXSSMotionTrackingState);
  v66 = +[NSError errorWithDomain:AXSSMotionTrackingErrorDomain code:13 userInfo:0];
  [v59 setError:v66];

  [(AXMTDaemon *)self _updateState:v59];
LABEL_30:
}

- (void)_stopTrackerIfRunning
{
  char v3 = AXSSLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10002C880(v3);
  }

  [(AXMTDaemon *)self set_trackerTransaction:0];
  id v4 = [(AXMTDaemon *)self _lookAtPointTracker];

  if (v4)
  {
    id v5 = [(AXMTDaemon *)self _lookAtPointTracker];
    [v5 setDelegate:0];

    id v6 = [(AXMTDaemon *)self _lookAtPointTracker];
    [v6 stopTracking];

    [(AXMTDaemon *)self set_lookAtPointTracker:0];
  }
  id v7 = [(AXMTDaemon *)self _lookAtPointTrackerObserver];

  if (v7)
  {
    uint64_t v8 = [(AXMTDaemon *)self _lookAtPointTrackerObserver];
    [v8 setDelegate:0];

    [(AXMTDaemon *)self set_lookAtPointTrackerObserver:0];
  }
  char v9 = [(AXMTDaemon *)self _inputManager];

  if (v9)
  {
    id v10 = [(AXMTDaemon *)self _inputManager];
    [v10 stopMonitoring];

    [(AXMTDaemon *)self set_inputManager:0];
  }
}

- (void)_setXPCProperty:(id)a3
{
  char v3 = (void (**)(void))a3;
  if (+[NSThread isMainThread])
  {
    v3[2](v3);
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000080A0;
    block[3] = &unk_100048B60;
    id v5 = v3;
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)_initializeSystemSettings
{
  objc_opt_class();
  UIApplicationInstantiateSingleton();
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  v2 = (void (*)(void))off_100054D70;
  uint64_t v8 = off_100054D70;
  if (!off_100054D70)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_100008358;
    v4[3] = &unk_100048B88;
    v4[4] = &v5;
    sub_100008358((uint64_t)v4);
    v2 = (void (*)(void))v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v2)
  {
    char v3 = (_Unwind_Exception *)sub_10002C8C4();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v3);
  }
  v2();
}

- (void)motionTrackingInputManager:(id)a3 updatedInputToUse:(id)a4
{
}

- (NSMutableArray)_xpcConnections
{
  return self->__xpcConnections;
}

- (void)set_xpcConnections:(id)a3
{
}

- (NSMutableArray)_trackingXPCConnections
{
  return self->__trackingXPCConnections;
}

- (void)set_trackingXPCConnections:(id)a3
{
}

- (NSXPCListener)_xpcListener
{
  return self->__xpcListener;
}

- (void)set_xpcListener:(id)a3
{
}

- (OS_dispatch_queue)_xpcConnectionsQueue
{
  return self->__xpcConnectionsQueue;
}

- (void)set_xpcConnectionsQueue:(id)a3
{
}

- (AXMTLookAtPointTracker)_lookAtPointTracker
{
  return self->__lookAtPointTracker;
}

- (void)set_lookAtPointTracker:(id)a3
{
}

- (AXMTLookAtPointTrackerObserver)_lookAtPointTrackerObserver
{
  return self->__lookAtPointTrackerObserver;
}

- (void)set_lookAtPointTrackerObserver:(id)a3
{
}

- (BOOL)_showDebugOverlay
{
  return self->__showDebugOverlay;
}

- (void)set_showDebugOverlay:(BOOL)a3
{
  self->__showDebugOverlay = a3;
}

- (OS_os_transaction)_trackerTransaction
{
  return self->__trackerTransaction;
}

- (void)set_trackerTransaction:(id)a3
{
}

- (AXSSMotionTrackingState)_state
{
  return self->__state;
}

- (void)set_state:(id)a3
{
}

- (unint64_t)_motionTrackingMode
{
  return self->__motionTrackingMode;
}

- (void)set_motionTrackingMode:(unint64_t)a3
{
  self->__motionTrackingMode = a3;
}

- (double)_sensitivity
{
  return self->__sensitivity;
}

- (void)set_sensitivity:(double)a3
{
  self->__sensitivity = a3;
}

- (AXSSMotionTrackingInputManager)_inputManager
{
  return self->__inputManager;
}

- (void)set_inputManager:(id)a3
{
}

- (AXSSMotionTrackingInputConfiguration)_inputConfiguration
{
  return self->__inputConfiguration;
}

- (void)set_inputConfiguration:(id)a3
{
}

- (AXSSMotionTrackingExpressionConfiguration)_expressionConfiguration
{
  return self->__expressionConfiguration;
}

- (void)set_expressionConfiguration:(id)a3
{
}

- (double)_joystickModeMovementThreshold
{
  return self->__joystickModeMovementThreshold;
}

- (void)set_joystickModeMovementThreshold:(double)a3
{
  self->__joystickModeMovementThreshold = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__expressionConfiguration, 0);
  objc_storeStrong((id *)&self->__inputConfiguration, 0);
  objc_storeStrong((id *)&self->__inputManager, 0);
  objc_storeStrong((id *)&self->__state, 0);
  objc_storeStrong((id *)&self->__trackerTransaction, 0);
  objc_storeStrong((id *)&self->__lookAtPointTrackerObserver, 0);
  objc_storeStrong((id *)&self->__lookAtPointTracker, 0);
  objc_storeStrong((id *)&self->__xpcConnectionsQueue, 0);
  objc_storeStrong((id *)&self->__xpcListener, 0);
  objc_storeStrong((id *)&self->__trackingXPCConnections, 0);

  objc_storeStrong((id *)&self->__xpcConnections, 0);
}

@end