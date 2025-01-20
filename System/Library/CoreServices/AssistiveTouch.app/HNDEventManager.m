@interface HNDEventManager
+ (id)sharedManager;
- (AXAssertion)disableDashBoardGesturesAssertion;
- (AXAssertion)disableSystemGesturesAssertion;
- (AXNotificationObserver)notificationObserver;
- (BOOL)_shouldSwitchControlIgnoreHIDEvent:(__IOHIDEvent *)a3;
- (BOOL)isCapturingEvents;
- (BOOL)isVoiceControlRunning;
- (BOOL)nubbitMoving;
- (BOOL)orientationLocked;
- (BOOL)shouldCaptureEvent:(__IOHIDEvent *)a3;
- (BOOL)sideSwitchUsedForOrientation;
- (BSInvalidatable)disableIdleTimerAssertion;
- (CPDistributedMessagingCenter)messagingCenter;
- (HNDEventManager)init;
- (HNDEventManagerDelegate)delegate;
- (__IOHIDEventSystemClient)ioSystemClient;
- (double)volumeLevel;
- (void)_disableIOFilter;
- (void)_handleIOHIDEvent:(id)a3;
- (void)_initializeASTNotificationCenter;
- (void)_initializeClarityBoardActionHandler;
- (void)_initializeSpringBoardItems;
- (void)_registerIOHIDUsage;
- (void)_startDistributedThread;
- (void)_startIOThread;
- (void)_unregisterIOFilter;
- (void)dealloc;
- (void)keyboardStatusChanged:(id)a3 userInfo:(id)a4;
- (void)manipulateDimTimer:(BOOL)a3;
- (void)notifyUserEventOccurred;
- (void)observer:(id)a3 didObserveNotification:(int)a4 notificationData:(void *)a5;
- (void)openCreateCustomGestureForAST;
- (void)openCreateCustomGestureForSCAT;
- (void)resetEventManager;
- (void)ringerSwitchChanged;
- (void)rotationLockChanged;
- (void)setCaptureEvents:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDisableDashBoardGesturesAssertion:(id)a3;
- (void)setDisableIdleTimerAssertion:(id)a3;
- (void)setDisableSystemGesturesAssertion:(id)a3;
- (void)setMenuVisible:(BOOL)a3;
- (void)setMessagingCenter:(id)a3;
- (void)setNotificationObserver:(id)a3;
- (void)setNubbitMoving:(BOOL)a3;
- (void)setOrientationLocked:(BOOL)a3;
- (void)substantialTransitionOccurred;
- (void)systemServerRestarted;
- (void)wakeDeviceFromSleepIfNecessary;
@end

@implementation HNDEventManager

+ (id)sharedManager
{
  v2 = +[HNDHandManager sharedManager];
  v3 = [v2 eventManager];

  return v3;
}

- (HNDEventManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)HNDEventManager;
  v2 = [(HNDEventManager *)&v12 init];
  v3 = (AXDispatchTimer *)[objc_alloc((Class)AXDispatchTimer) initWithTargetSerialQueue:&_dispatch_main_q];
  keyboardStatusCoalesce = v2->_keyboardStatusCoalesce;
  v2->_keyboardStatusCoalesce = v3;

  v5 = (NSThread *)[objc_alloc((Class)NSThread) initWithTarget:v2 selector:"_startDistributedThread" object:0];
  distributedMessagingThread = v2->_distributedMessagingThread;
  v2->_distributedMessagingThread = v5;

  [(NSThread *)v2->_distributedMessagingThread setName:@"Distributed messaging thread"];
  [(NSThread *)v2->_distributedMessagingThread start];
  [(HNDEventManager *)v2 performSelector:"_initializeASTNotificationCenter" onThread:v2->_distributedMessagingThread withObject:0 waitUntilDone:0];
  dispatch_queue_t v7 = dispatch_queue_create("HNDEventManager-DisableIdleTimer", 0);
  disableIdleTimerAssertionQueue = v2->_disableIdleTimerAssertionQueue;
  v2->_disableIdleTimerAssertionQueue = (OS_dispatch_queue *)v7;

  if (_AXSMossdeepEnabled())
  {
    id v9 = [objc_alloc((Class)AXNotificationObserver) initWithNotifications:&off_1001BB8C8];
    [(HNDEventManager *)v2 setNotificationObserver:v9];

    v10 = [(HNDEventManager *)v2 notificationObserver];
    [v10 setDelegate:v2];
  }
  return v2;
}

- (void)dealloc
{
  [(BSInvalidatable *)self->_disableIdleTimerAssertion invalidate];
  v3.receiver = self;
  v3.super_class = (Class)HNDEventManager;
  [(HNDEventManager *)&v3 dealloc];
}

- (void)_startDistributedThread
{
  v2 = +[NSDate distantFuture];
  [v2 timeIntervalSinceReferenceDate];

  while (1)
  {
    CFRunLoopGetCurrent();
    CFRunLoopRunSpecific();
  }
}

- (void)systemServerRestarted
{
  [(HNDEventManager *)self _initializeSpringBoardItems];

  [(HNDEventManager *)self _initializeClarityBoardActionHandler];
}

- (void)substantialTransitionOccurred
{
  objc_super v3 = [(HNDEventManager *)self delegate];
  [v3 substantialTransitionOccurred];

  id v4 = [(HNDEventManager *)self delegate];
  [v4 mediaControlsChanged:0];
}

- (void)ringerSwitchChanged
{
  id v2 = [(HNDEventManager *)self delegate];
  [v2 ringerSwitchChanged];
}

- (void)rotationLockChanged
{
  id v2 = [(HNDEventManager *)self delegate];
  [v2 rotationLockChanged];
}

- (void)_initializeSpringBoardItems
{
  if (+[AXSpringBoardServer isAvailable])
  {
    objc_initWeak(&location, self);
    objc_super v3 = +[AXSpringBoardServer server];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10003CBBC;
    v5[3] = &unk_1001ABD50;
    v5[4] = self;
    objc_copyWeak(&v6, &location);
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_10003CE74;
    v4[3] = &unk_1001AAFB0;
    v4[4] = self;
    [v3 registerSpringBoardActionHandler:v5 withIdentifierCallback:v4];

    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

- (void)_initializeClarityBoardActionHandler
{
  if (+[AXClarityBoardServer isAvailable])
  {
    objc_super v3 = +[AXClarityBoardServer server];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10003D068;
    v5[3] = &unk_1001ABDA0;
    v5[4] = self;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_10003D1A8;
    v4[3] = &unk_1001AAFB0;
    v4[4] = self;
    [v3 registerActionHandler:v5 withIdentifierCallback:v4];
  }
}

- (void)resetEventManager
{
}

- (void)keyboardStatusChanged:(id)a3 userInfo:(id)a4
{
  id v5 = a4;
  id v6 = [v5 objectForKey:@"visible"];
  unsigned __int8 v7 = [v6 BOOLValue];

  v8 = [v5 objectForKey:@"frame"];
  id v9 = v8;
  if (v8)
  {
    CGRect v20 = CGRectFromString(v8);
    CGFloat x = v20.origin.x;
    CGFloat y = v20.origin.y;
    CGFloat width = v20.size.width;
    CGFloat height = v20.size.height;
  }
  else
  {
    CGFloat x = CGRectZero.origin.x;
    CGFloat y = CGRectZero.origin.y;
    CGFloat width = CGRectZero.size.width;
    CGFloat height = CGRectZero.size.height;
  }
  v14 = ASTLogCommon();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v19 = v5;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "AST keyboard update: %{public}@", buf, 0xCu);
  }

  [(AXDispatchTimer *)self->_keyboardStatusCoalesce cancel];
  keyboardStatusCoalesce = self->_keyboardStatusCoalesce;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10003D618;
  v16[3] = &unk_1001ABDC8;
  v16[4] = self;
  unsigned __int8 v17 = v7;
  *(CGFloat *)&v16[5] = x;
  *(CGFloat *)&v16[6] = y;
  *(CGFloat *)&v16[7] = width;
  *(CGFloat *)&v16[8] = height;
  [(AXDispatchTimer *)keyboardStatusCoalesce afterDelay:v16 processBlock:0.0];
}

- (void)_initializeASTNotificationCenter
{
  if (+[NSThread isMainThread])
  {
    id v4 = +[NSAssertionHandler currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"HNDEventManager.m" lineNumber:345 description:@"Make sure we don't start this on main thread"];
  }
  id v5 = +[CPDistributedMessagingCenter centerNamed:@"UIASTNotificationCenter"];
  [v5 runServerOnCurrentThread];
  [v5 registerForMessageName:@"UIAXASTKeyboardStatus" target:self selector:"keyboardStatusChanged:userInfo:"];
  [(HNDEventManager *)self setMessagingCenter:v5];
}

- (void)manipulateDimTimer:(BOOL)a3
{
  if (a3)
  {
    disableIdleTimerAssertionQueue = self->_disableIdleTimerAssertionQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10003D878;
    block[3] = &unk_1001AAA90;
    block[4] = self;
    dispatch_async(disableIdleTimerAssertionQueue, block);
    id v5 = +[UIApplication sharedApplication];
    [v5 _setIdleTimerDisabled:1 forReason:@"AssistiveTouch"];
  }
  else
  {
    id v6 = +[UIApplication sharedApplication];
    [v6 _setIdleTimerDisabled:0 forReason:@"AssistiveTouch"];

    unsigned __int8 v7 = self->_disableIdleTimerAssertionQueue;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10003D914;
    v8[3] = &unk_1001AAA90;
    v8[4] = self;
    dispatch_async(v7, v8);
  }
}

- (BOOL)nubbitMoving
{
  return self->_nubbitMoving;
}

- (void)setNubbitMoving:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = ASTLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v10[0] = 67109120;
    v10[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Setting nubbit moving: %d", (uint8_t *)v10, 8u);
  }

  if (v3)
  {
    [(HNDEventManager *)self manipulateDimTimer:1];
    if (+[AXAssertion isSupported])
    {
      id v6 = [(HNDEventManager *)self disableSystemGesturesAssertion];

      if (!v6)
      {
        unsigned __int8 v7 = +[AXAssertion assertionWithType:AXAssertionTypeDisableSystemGestures identifier:@"AST Nubbit Moving"];
        [(HNDEventManager *)self setDisableSystemGesturesAssertion:v7];
      }
      v8 = [(HNDEventManager *)self disableDashBoardGesturesAssertion];

      if (!v8)
      {
        id v9 = +[AXAssertion assertionWithType:AXAssertionTypeDisableDashboardSystemGestures identifier:@"AST Nubbit Moving"];
        [(HNDEventManager *)self setDisableDashBoardGesturesAssertion:v9];
      }
    }
  }
  else
  {
    [(HNDEventManager *)self manipulateDimTimer:0];
    [(HNDEventManager *)self setDisableDashBoardGesturesAssertion:0];
    [(HNDEventManager *)self setDisableSystemGesturesAssertion:0];
  }
  self->_nubbitMoving = v3;
}

- (double)volumeLevel
{
  id v2 = +[AXSpringBoardServer server];
  [v2 volumeLevel];
  double v4 = v3;

  return v4;
}

- (BOOL)isVoiceControlRunning
{
  id v2 = +[AXSpringBoardServer server];
  unsigned __int8 v3 = [v2 isVoiceControlRunning];

  return v3;
}

- (void)setMenuVisible:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[AXSpringBoardServer server];
  [v4 setCancelGestureActivation:4 cancelEnabled:v3];
}

- (void)wakeDeviceFromSleepIfNecessary
{
  id v2 = +[AXSystemAppServer server];
  [v2 wakeUpDeviceIfNecessary];
}

- (void)_handleIOHIDEvent:(id)a3
{
  id v4 = a3;
  id v6 = +[HNDHandManager sharedManager];
  unsigned __int8 v7 = [v6 currentDisplayManager];
  [v7 portraitUpScreenBounds];
  uint64_t v9 = v8;
  uint64_t v11 = v10;

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10003DE48;
  v13[3] = &unk_1001ABDE8;
  v13[4] = v9;
  v13[5] = v11;
  [v4 modifyPoints:v13];
  objc_super v12 = [(HNDEventManager *)self delegate];
  [v12 handleRealEvent:v4];
}

- (BOOL)_shouldSwitchControlIgnoreHIDEvent:(__IOHIDEvent *)a3
{
  return 0;
}

- (void)_unregisterIOFilter
{
}

- (void)_startIOThread
{
  id v2 = +[NSDate distantFuture];
  [v2 timeIntervalSinceReferenceDate];

  while (1)
  {
    CFRunLoopGetCurrent();
    CFRunLoopRunSpecific();
  }
}

- (void)_registerIOHIDUsage
{
  if (self->_ioSystemFilterClient)
  {
    AXSetThreadPriority();
    CFRunLoopGetCurrent();
    IOHIDEventSystemClientScheduleWithRunLoop();
    v20[0] = @"DeviceUsagePage";
    v20[1] = @"DeviceUsage";
    v21[0] = &off_1001BBBF8;
    v21[1] = &off_1001BBC10;
    id v2 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];
    v18[0] = @"DeviceUsagePage";
    v18[1] = @"DeviceUsage";
    v19[0] = &off_1001BBBF8;
    v19[1] = &off_1001BBC28;
    uint64_t v8 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];
    v16[0] = @"DeviceUsagePage";
    v16[1] = @"DeviceUsage";
    v17[0] = &off_1001BBBF8;
    v17[1] = &off_1001BBC40;
    BOOL v3 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
    v14[0] = @"PrimaryUsagePage";
    v14[1] = @"PrimaryUsage";
    v15[0] = &off_1001BBC58;
    v15[1] = &off_1001BBC70;
    id v4 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];
    CFStringRef v12 = @"PrimaryUsagePage";
    v13 = &off_1001BBC88;
    id v5 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    v10[0] = @"PrimaryUsagePage";
    v10[1] = @"PrimaryUsage";
    v11[0] = &off_1001BBC58;
    v11[1] = &off_1001BBC28;
    id v6 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];
    if (_AXSAssistiveTouchScannerEnabled())
    {
      v9[0] = v2;
      v9[1] = v3;
      v9[2] = v4;
      v9[3] = v5;
      v9[4] = v6;
      unsigned __int8 v7 = +[NSArray arrayWithObjects:v9 count:5];
    }
    else
    {
      unsigned __int8 v7 = +[NSMutableArray array];
      [v7 addObject:v2];
      [v7 addObject:v3];
    }
    IOHIDEventSystemClientSetMatchingMultiple();

    IOHIDEventSystemClientRegisterEventFilterCallbackWithPriority();
  }
}

- (void)_disableIOFilter
{
  if (self->_ioSystemFilterClient)
  {
    IOHIDEventSystemClientUnregisterEventFilterCallback();
    CFRunLoopGetCurrent();
    IOHIDEventSystemClientUnscheduleWithRunLoop();
    ioSystemFilterClient = self->_ioSystemFilterClient;
    if (ioSystemFilterClient)
    {
      CFRelease(ioSystemFilterClient);
      self->_ioSystemFilterClient = 0;
    }
  }
}

- (void)setCaptureEvents:(BOOL)a3
{
  self->_isCapturingEvents = a3;
  if (a3)
  {
    if (!self->_ioSystemFilterClient)
    {
      id v4 = (__IOHIDEventSystemClient *)IOHIDEventSystemClientCreate();
      self->_ioSystemFilterClient = v4;
      if (!v4)
      {
        _AXLogWithFacility();
        return;
      }
    }
    ioFilterThread = self->_ioFilterThread;
    if (!ioFilterThread)
    {
      id v6 = (NSThread *)[objc_alloc((Class)NSThread) initWithTarget:self selector:"_startIOThread" object:0];
      unsigned __int8 v7 = self->_ioFilterThread;
      self->_ioFilterThread = v6;

      [(NSThread *)self->_ioFilterThread start];
      ioFilterThread = self->_ioFilterThread;
    }
    uint64_t v8 = "_registerIOHIDUsage";
  }
  else
  {
    ioFilterThread = self->_ioFilterThread;
    if (!ioFilterThread) {
      return;
    }
    uint64_t v8 = "_disableIOFilter";
  }

  [(HNDEventManager *)self performSelector:v8 onThread:ioFilterThread withObject:0 waitUntilDone:0];
}

- (BOOL)shouldCaptureEvent:(__IOHIDEvent *)a3
{
  return 1;
}

- (BOOL)sideSwitchUsedForOrientation
{
  id v2 = +[AXSpringBoardServer server];
  unsigned __int8 v3 = [v2 isSideSwitchUsedForOrientation];

  return v3;
}

- (BOOL)orientationLocked
{
  id v2 = +[AXSpringBoardServer server];
  unsigned __int8 v3 = [v2 isOrientationLocked];

  return v3;
}

- (void)setOrientationLocked:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[AXSpringBoardServer server];
  [v4 setOrientationLocked:v3];
}

- (void)openCreateCustomGestureForAST
{
  id v2 = +[AXSpringBoardServer server];
  [v2 openAssistiveTouchCustomGestureCreation];
}

- (void)openCreateCustomGestureForSCAT
{
  id v2 = +[AXSpringBoardServer server];
  [v2 openSCATCustomGestureCreation];
}

- (void)notifyUserEventOccurred
{
  if (CFAbsoluteTimeGetCurrent() - *(double *)&qword_1001F0A08 > 3.0)
  {
    id v2 = +[AXUserEventTimer sharedInstance];
    [v2 userEventOccurred];

    qword_1001F0A08 = CFAbsoluteTimeGetCurrent();
  }
}

- (void)observer:(id)a3 didObserveNotification:(int)a4 notificationData:(void *)a5
{
  if (a4 == 1028)
  {
    uint64_t v7 = +[AXEventRepresentation representationWithData:a5];
    uint64_t v8 = v7;
    if (v7)
    {
      uint64_t v10 = v7;
      uint64_t v7 = (uint64_t)[(id)v7 additionalFlags];
      uint64_t v8 = v10;
      if ((v7 & 0x4000000) != 0)
      {
        uint64_t v9 = [(HNDEventManager *)self delegate];
        [v9 handleRealEvent:v10];

        uint64_t v8 = v10;
      }
    }
    _objc_release_x1(v7, v8);
  }
}

- (BOOL)isCapturingEvents
{
  return self->_isCapturingEvents;
}

- (HNDEventManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HNDEventManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (AXAssertion)disableSystemGesturesAssertion
{
  return self->_disableSystemGesturesAssertion;
}

- (void)setDisableSystemGesturesAssertion:(id)a3
{
}

- (AXAssertion)disableDashBoardGesturesAssertion
{
  return self->_disableDashBoardGesturesAssertion;
}

- (void)setDisableDashBoardGesturesAssertion:(id)a3
{
}

- (__IOHIDEventSystemClient)ioSystemClient
{
  return self->_ioSystemClient;
}

- (BSInvalidatable)disableIdleTimerAssertion
{
  return self->_disableIdleTimerAssertion;
}

- (void)setDisableIdleTimerAssertion:(id)a3
{
}

- (CPDistributedMessagingCenter)messagingCenter
{
  return self->_messagingCenter;
}

- (void)setMessagingCenter:(id)a3
{
}

- (AXNotificationObserver)notificationObserver
{
  return self->_notificationObserver;
}

- (void)setNotificationObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationObserver, 0);
  objc_storeStrong((id *)&self->_messagingCenter, 0);
  objc_storeStrong((id *)&self->_disableIdleTimerAssertion, 0);
  objc_storeStrong((id *)&self->_disableDashBoardGesturesAssertion, 0);
  objc_storeStrong((id *)&self->_disableSystemGesturesAssertion, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_disableIdleTimerAssertionQueue, 0);
  objc_storeStrong((id *)&self->_distributedMessagingThread, 0);
  objc_storeStrong((id *)&self->_keyboardStatusCoalesce, 0);
  objc_storeStrong((id *)&self->_ioFilterThread, 0);
  objc_storeStrong((id *)&self->_axClarityBoardCallbackIdentifier, 0);
  objc_storeStrong((id *)&self->_axSpringBoardCallbackIdentifier, 0);

  objc_storeStrong((id *)&self->_eventsToMatch, 0);
}

@end