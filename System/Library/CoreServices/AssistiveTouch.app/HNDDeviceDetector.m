@interface HNDDeviceDetector
- (BOOL)detectDevices;
- (HNDDeviceDetector)init;
- (HNDDeviceDetectorDelegate)delegate;
- (id)_matchingDictionaries;
- (id)attachedKeyboards;
- (void)_updateKeyboardMonitorStateIfNeeded;
- (void)deviceMonitorDidDetectDeviceEvent:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDetectDevices:(BOOL)a3;
- (void)setListenForMouseKeyToggle:(BOOL)a3;
- (void)setMouseKeysEnabled:(BOOL)a3;
@end

@implementation HNDDeviceDetector

- (HNDDeviceDetector)init
{
  v15.receiver = self;
  v15.super_class = (Class)HNDDeviceDetector;
  v2 = [(HNDDeviceDetector *)&v15 init];
  if (v2)
  {
    v3 = +[AXSettings sharedInstance];
    -[HNDDeviceDetector setListenForMouseKeyToggle:](v2, "setListenForMouseKeyToggle:", [v3 assistiveTouchMouseKeysOptionToggleEnabled]);

    v4 = +[AXSettings sharedInstance];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100010B9C;
    v13[3] = &unk_1001AAA90;
    v5 = v2;
    v14 = v5;
    [v4 registerUpdateBlock:v13 forRetrieveSelector:"assistiveTouchMouseKeysOptionToggleEnabled" withListener:v5];

    id v6 = [objc_alloc((Class)AXDispatchTimer) initWithTargetSerialQueue:&_dispatch_main_q];
    id v7 = v5[4];
    v5[4] = v6;

    [v5[4] setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:1];
    objc_initWeak(&location, v5);
    v8 = +[AXSettings sharedInstance];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100010BFC;
    v10[3] = &unk_1001AAA68;
    objc_copyWeak(&v11, &location);
    [v8 registerUpdateBlock:v10 forRetrieveSelector:"assistiveTouchMouseAlwaysShowSoftwareKeyboardEnabled" withListener:v5];

    objc_destroyWeak(&v11);
    [v5 _updateKeyboardMonitorStateIfNeeded];
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)setListenForMouseKeyToggle:(BOOL)a3
{
  if (a3)
  {
    v4 = objc_opt_new();
    [v4 setWantsKeyboardEvents:1];
    v5 = +[AXEventTapManager sharedManager];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100010D68;
    v9[3] = &unk_1001AAD28;
    v9[4] = self;
    id v6 = [v5 installEventTap:v9 identifier:@"HNDMouseKeyToggle" type:1 skipDeviceMatching:0 filterEvents:v4 matchingServiceHandler:0];

    id v7 = +[AXEventTapManager sharedManager];
    [v7 setEventTapPriority:@"HNDMouseKeyToggle" priority:25];
  }
  else
  {
    v8 = +[AXEventTapManager sharedManager];
    [v8 removeEventTap:@"HNDMouseKeyToggle"];

    dword_1001F0960 = 0;
  }
}

- (void)setMouseKeysEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = +[NSMutableSet set];
  hidManager = self->_hidManager;
  if (hidManager)
  {
    CFSetRef v7 = IOHIDManagerCopyDevices(hidManager);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100010FC8;
    v10[3] = &unk_1001AAD50;
    id v11 = v5;
    [(__CFSet *)v7 enumerateObjectsUsingBlock:v10];
  }
  if (v3)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10001103C;
    v9[3] = &unk_1001AAD50;
    v9[4] = self;
    [v5 enumerateObjectsUsingBlock:v9];
  }
  else
  {
    v8 = [(HNDDeviceDetector *)self delegate];
    [v8 deviceDetector:self unloadDevicesPassingTest:&stru_1001AAD90];
  }
}

- (void)_updateKeyboardMonitorStateIfNeeded
{
  if ([(HNDDeviceDetector *)self detectDevices]
    && AXDeviceIsPad()
    && (+[AXSettings sharedInstance],
        BOOL v3 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v4 = [v3 assistiveTouchMouseAlwaysShowSoftwareKeyboardEnabled],
        v3,
        (v4 & 1) != 0))
  {
    if (!self->_keyboardMonitor)
    {
      id v6 = objc_alloc((Class)AXDeviceMonitor);
      CFSetRef v7 = +[NSRunLoop mainRunLoop];
      v8 = (AXDeviceMonitor *)[v6 initWithMatchingDictionary:&off_1001BC120 callbackRunLoop:v7];
      keyboardMonitor = self->_keyboardMonitor;
      self->_keyboardMonitor = v8;

      [(AXDeviceMonitor *)self->_keyboardMonitor setDelegate:self];
      v10 = self->_keyboardMonitor;
      [(AXDeviceMonitor *)v10 begin];
    }
  }
  else
  {
    [(AXDeviceMonitor *)self->_keyboardMonitor invalidate];
    v5 = self->_keyboardMonitor;
    self->_keyboardMonitor = 0;
  }
}

- (id)attachedKeyboards
{
  id v2 = [(AXDeviceMonitor *)self->_keyboardMonitor copyDevices];

  return v2;
}

- (void)deviceMonitorDidDetectDeviceEvent:(id)a3
{
  id v3 = +[HNDHandManager sharedManager];
  [v3 updateSoftwareKeyboardState];
}

- (id)_matchingDictionaries
{
  id v2 = +[NSMutableArray array];
  id v3 = +[NSMutableDictionary dictionary];
  unsigned __int8 v4 = +[NSNumber numberWithInt:1];
  [v3 setObject:v4 forKey:@"PrimaryUsagePage"];

  v5 = +[NSNumber numberWithInt:2];
  [v3 setObject:v5 forKey:@"PrimaryUsage"];

  [v2 addObject:v3];
  id v6 = +[NSMutableDictionary dictionary];

  CFSetRef v7 = +[NSNumber numberWithInt:1];
  [v6 setObject:v7 forKey:@"PrimaryUsagePage"];

  v8 = +[NSNumber numberWithInt:4];
  [v6 setObject:v8 forKey:@"PrimaryUsage"];

  [v2 addObject:v6];
  v9 = +[NSMutableDictionary dictionary];

  v10 = +[NSNumber numberWithInt:1];
  [v9 setObject:v10 forKey:@"PrimaryUsagePage"];

  id v11 = +[NSNumber numberWithInt:6];
  [v9 setObject:v11 forKey:@"PrimaryUsage"];

  [v2 addObject:v9];
  v12 = +[NSMutableDictionary dictionary];

  v13 = +[NSNumber numberWithInt:1];
  [v12 setObject:v13 forKey:@"PrimaryUsagePage"];

  v14 = +[NSNumber numberWithInt:7];
  [v12 setObject:v14 forKey:@"PrimaryUsage"];

  [v2 addObject:v12];
  objc_super v15 = +[NSMutableDictionary dictionary];

  v16 = +[NSNumber numberWithInt:1];
  [v15 setObject:v16 forKey:@"PrimaryUsagePage"];

  v17 = +[NSNumber numberWithInt:5];
  [v15 setObject:v17 forKey:@"PrimaryUsage"];

  [v2 addObject:v15];

  return v2;
}

- (void)setDetectDevices:(BOOL)a3
{
  self->_detectDevices = a3;
  hidManager = self->_hidManager;
  if (a3)
  {
    if (!hidManager)
    {
      v5 = IOHIDManagerCreate(kCFAllocatorDefault, 0);
      self->_hidManager = v5;
      IOHIDManagerRegisterDeviceMatchingCallback(v5, (IOHIDDeviceCallback)sub_1000116BC, self);
      IOHIDManagerRegisterDeviceRemovalCallback(self->_hidManager, (IOHIDDeviceCallback)sub_1000117A8, self);
      id v6 = self->_hidManager;
      CFArrayRef v7 = [(HNDDeviceDetector *)self _matchingDictionaries];
      IOHIDManagerSetDeviceMatchingMultiple(v6, v7);

      v8 = self->_hidManager;
      Current = CFRunLoopGetCurrent();
      IOHIDManagerScheduleWithRunLoop(v8, Current, kCFRunLoopDefaultMode);
      v10 = +[AXSettings sharedInstance];
      -[HNDDeviceDetector setMouseKeysEnabled:](self, "setMouseKeysEnabled:", [v10 assistiveTouchMouseKeysEnabled]);

      id v11 = +[AXSettings sharedInstance];
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_1000118DC;
      v13[3] = &unk_1001AAA90;
      void v13[4] = self;
      [v11 registerUpdateBlock:v13 forRetrieveSelector:"assistiveTouchMouseKeysEnabled" withListener:self];
    }
  }
  else if (hidManager)
  {
    v12 = CFRunLoopGetCurrent();
    IOHIDManagerUnscheduleFromRunLoop(hidManager, v12, kCFRunLoopDefaultMode);
    CFRelease(self->_hidManager);
    self->_hidManager = 0;
  }
  [(HNDDeviceDetector *)self _updateKeyboardMonitorStateIfNeeded];
}

- (BOOL)detectDevices
{
  return self->_detectDevices;
}

- (HNDDeviceDetectorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HNDDeviceDetectorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyboardMonitor, 0);
  objc_storeStrong((id *)&self->_mouseKeysShortcutDetectionTimeout, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end