@interface IAPServer
+ (id)sharedIAPServer;
+ (void)sendAudioStateChangedNotification;
- (BOOL)isServerStopping;
- (BOOL)isShuttingDown;
- (IAPServer)init;
- (IAPXPCConnection)iaptransportd_connection;
- (NSMutableDictionary)iapPortManagers;
- (NSString)dpFirmwareVersion;
- (__CFString)deviceClass;
- (__CFString)deviceProductType;
- (id)iapPortManagerForDevPort:(void *)a3;
- (void)_pollForDeathAfterPromptCompletes;
- (void)addNewTransport:(void *)a3;
- (void)bringdownPlatform;
- (void)dealloc;
- (void)deleteAllPorts;
- (void)preventIdleSleep:(int)a3;
- (void)removeTransport:(void *)a3;
- (void)run;
- (void)setDpFirmwareVersion:(id)a3;
- (void)setIaptransportd_connection:(id)a3;
- (void)setIsShuttingDown:(BOOL)a3;
- (void)stopServer:(int)a3;
- (void)stopServer:(int)a3 forceExitingImmediately:(BOOL)a4;
- (void)updateTransportListStates;
@end

@implementation IAPServer

+ (id)sharedIAPServer
{
  id result = (id)qword_10013BAF0;
  if (!qword_10013BAF0)
  {
    pthread_mutex_lock(&stru_1001396F0);
    if (!qword_10013BAF0) {
      qword_10013BAF0 = objc_alloc_init(IAPServer);
    }
    pthread_mutex_unlock(&stru_1001396F0);
    return (id)qword_10013BAF0;
  }
  return result;
}

+ (void)sendAudioStateChangedNotification
{
  NSLog(@"%s - sending IAPAudioDeviceStateChangedNotification", a2, "+[IAPServer sendAudioStateChangedNotification]");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFStringRef v3 = (const __CFString *)IAPAudioDeviceStateChangedNotification;
  CFNotificationCenterPostNotification(DarwinNotifyCenter, v3, 0, 0, 0);
}

- (IAPServer)init
{
  GSInitialize();
  v9.receiver = self;
  v9.super_class = (Class)IAPServer;
  CFStringRef v3 = [(IAPServer *)&v9 init];
  if (!v3) {
    return 0;
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)sub_10000E6F8, @"com.apple.iapd.LoggingPreferencesChangedNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  sub_1000EE550();
  v3->_isShuttingDown = 0;
  if (!notify_register_check((const char *)&kIAPAvailableNotification, &dword_100139730))
  {
    uint64_t state64 = 0;
    notify_get_state(dword_100139730, &state64);
    if (state64 != 1)
    {
      notify_set_state(dword_100139730, 1uLL);
      notify_post((const char *)&kIAPAvailableNotification);
    }
  }
  int out_token = 0;
  id result = (IAPServer *)notify_register_check("com.apple.iapd.videoout.SettingsChanged", &out_token);
  if (!result)
  {
    uint64_t state64 = 0;
    notify_get_state(out_token, &state64);
    if (state64)
    {
      notify_set_state(out_token, 0);
      notify_post("com.apple.iapd.videoout.SettingsChanged");
    }
    id result = (IAPServer *)notify_cancel(out_token);
  }
  if ((((_BYTE)v3 + 112) & 3) == 0)
  {
    v3->_disableSleepAssertions = -1;
    id result = [[IAPXPCConnection alloc] initWithServiceName:@"com.apple.iaptransportd.xpc" queueName:@"com.apple.iaptransportd.IAPXPCConnection"];
    if ((((int)v3 + 144) & 7) == 0)
    {
      v3->_iaptransportd_connection = (IAPXPCConnection *)result;
      [(IAPServer *)result setDisconnectBlock:&stru_100121C58];
      id result = (IAPServer *)dispatch_queue_create("IAPServerListenerQueue", 0);
      if (((unint64_t)&v3->_internalListenerQueue & 7) == 0)
      {
        v3->_internalListenerQueue = (OS_dispatch_queue *)result;
        v6 = CFNotificationCenterGetDarwinNotifyCenter();
        pthread_mutex_lock(&stru_100139738);
        id result = (IAPServer *)sub_10002B190();
        if (result)
        {
          if ((result & 7) == 0)
          {
            (*((void (**)(IAPServer *, void))result->super.isa + 11))(result, 0);
            CFNotificationCenterAddObserver(v6, 0, (CFNotificationCallback)sub_10000E75C, @"AppleLanguagePreferencesChangedNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
            CFNotificationCenterAddObserver(v6, 0, (CFNotificationCallback)sub_10000E790, @"IAPDTransportListChangedNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
            CFNotificationCenterAddObserver(v6, 0, (CFNotificationCallback)sub_10000E7C0, @"IAPDTransportListItemAddedNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
            CFNotificationCenterAddObserver(v6, 0, (CFNotificationCallback)sub_10000E800, @"IAPDEmptyTransportListNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
            id result = (IAPServer *)sub_1000194D0();
            if ((result & 7) == 0 && ((unint64_t)&v3->_accessoryEventHander & 7) == 0)
            {
              v3->_accessoryEventHander = (IPodEventSender *)result;
              operator new();
            }
          }
        }
      }
    }
  }
  __break(0x5516u);
  return result;
}

- (void)bringdownPlatform
{
  objc_msgSend(+[EAManager sharedManager](EAManager, "sharedManager"), "removeAllClients");
  if (((unint64_t)&self->_listener & 7) != 0) {
    goto LABEL_56;
  }
  if (self->_listener)
  {
    p_internalListenerQueue = &self->_internalListenerQueue;
    if (((unint64_t)&self->_internalListenerQueue & 7) != 0) {
      goto LABEL_56;
    }
    v4 = *p_internalListenerQueue;
    if (!*p_internalListenerQueue)
    {
LABEL_57:
      __break(0x5510u);
      return;
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000ED5C;
    block[3] = &unk_100121CA0;
    block[4] = self;
    dispatch_sync(v4, block);
  }
  v5 = (dispatch_object_t *)&self->_internalListenerQueue;
  if (((unint64_t)&self->_internalListenerQueue & 7) != 0) {
    goto LABEL_56;
  }
  if (!*v5) {
    goto LABEL_57;
  }
  dispatch_release(*v5);
  p_iaptransportd_connection = &self->_iaptransportd_connection;
  if (((unint64_t)&self->_iaptransportd_connection & 7) != 0) {
    goto LABEL_56;
  }
  if (*p_iaptransportd_connection)
  {
    [(IAPXPCConnection *)*p_iaptransportd_connection setDisconnectBlock:0];

    *p_iaptransportd_connection = 0;
  }
  CFRunLoopRef Main = CFRunLoopGetMain();
  if ((((_BYTE)self + 56) & 7) != 0) {
    goto LABEL_56;
  }
  v8 = Main;
  RunLoopSource = IONotificationPortGetRunLoopSource(self->_ioaccessoryNotifyPort);
  CFRunLoopRemoveSource(v8, RunLoopSource, kCFRunLoopDefaultMode);
  IONotificationPortDestroy(self->_ioaccessoryNotifyPort);
  p_systemPowerIterator = &self->_systemPowerIterator;
  if (((unint64_t)&self->_systemPowerIterator & 3) != 0) {
    goto LABEL_56;
  }
  if (*p_systemPowerIterator) {
    IODeregisterForSystemPower(p_systemPowerIterator);
  }
  if (dword_10013BAF8)
  {
    if (((unint64_t)&self->_serverRunLoop & 7) != 0) {
      goto LABEL_56;
    }
    p_systemPowerNotifyPortRef = &self->_systemPowerNotifyPortRef;
    if (((unint64_t)&self->_systemPowerNotifyPortRef & 7) != 0) {
      goto LABEL_56;
    }
    serverRunLoop = self->_serverRunLoop;
    v13 = IONotificationPortGetRunLoopSource(*p_systemPowerNotifyPortRef);
    CFRunLoopRemoveSource(serverRunLoop, v13, kCFRunLoopCommonModes);
    IONotificationPortDestroy(*p_systemPowerNotifyPortRef);
    IOServiceClose(dword_10013BAF8);
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, kIAPServerDiedNotification, 0, 0, 1u);
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, 0, @"AppleLanguagePreferencesChangedNotification", 0);
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, 0, @"IAPDTransportListChangedNotification", 0);
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, 0, @"IAPDTransportListItemAddedNotification", 0);
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, 0, @"IAPDEmptyTransportListNotification", 0);
  [+[NSNotificationCenter defaultCenter] removeObserver:self];
  uint64_t v15 = sub_1000DB62C();
  if (!v15) {
    goto LABEL_56;
  }
  if ((v15 & 7) != 0) {
    goto LABEL_56;
  }
  if (((unint64_t)&self->_accessoryEventHander & 7) != 0) {
    goto LABEL_56;
  }
  (*(void (**)(uint64_t, IPodEventSender *))(*(void *)v15 + 24))(v15, self->_accessoryEventHander);
  uint64_t v16 = sub_1000E66A8();
  if (!v16) {
    goto LABEL_56;
  }
  uint64_t v17 = v16;
  if ((v16 & 7) != 0) {
    goto LABEL_56;
  }
  uint64_t v18 = sub_10005B538();
  if ((v18 & 7) != 0) {
    goto LABEL_56;
  }
  (*(void (**)(uint64_t, uint64_t))(*(void *)v17 + 24))(v17, v18);
  uint64_t v19 = sub_1000DA680();
  if (!v19) {
    goto LABEL_56;
  }
  if ((v19 & 7) != 0) {
    goto LABEL_56;
  }
  p_accessoryEQEventHandler = &self->_accessoryEQEventHandler;
  if (((unint64_t)&self->_accessoryEQEventHandler & 7) != 0) {
    goto LABEL_56;
  }
  (*(void (**)(uint64_t, IPodEventSender *))(*(void *)v19 + 24))(v19, *p_accessoryEQEventHandler);
  uint64_t v21 = sub_10001CE48();
  if ((v21 & 7) != 0) {
    goto LABEL_56;
  }
  p_headsetEventHandler = &self->_headsetEventHandler;
  if (((unint64_t)&self->_headsetEventHandler & 7) != 0) {
    goto LABEL_56;
  }
  *p_headsetEventHandler = (IPodEventSender *)v21;
  uint64_t v23 = sub_1000DFA34();
  if (!v23) {
    goto LABEL_56;
  }
  if ((v23 & 7) != 0) {
    goto LABEL_56;
  }
  if (((unint64_t)*p_headsetEventHandler & 7) != 0) {
    goto LABEL_56;
  }
  (*(void (**)(uint64_t))(*(void *)v23 + 24))(v23);
  uint64_t v24 = sub_1000DDBC0();
  if (!v24) {
    goto LABEL_56;
  }
  uint64_t v25 = v24;
  if ((v24 & 7) != 0) {
    goto LABEL_56;
  }
  uint64_t v26 = sub_10001C8FC();
  if ((v26 & 7) != 0) {
    goto LABEL_56;
  }
  (*(void (**)(uint64_t, uint64_t))(*(void *)v25 + 24))(v25, v26);
  uint64_t v27 = sub_1000E5F70();
  if (!v27) {
    goto LABEL_56;
  }
  uint64_t v28 = v27;
  if ((v27 & 7) != 0) {
    goto LABEL_56;
  }
  uint64_t v29 = sub_10000D920();
  if ((v29 & 7) != 0) {
    goto LABEL_56;
  }
  (*(void (**)(uint64_t, uint64_t))(*(void *)v28 + 24))(v28, v29);
  nullsub_9([(IAPServer *)self deleteAllPorts]);
  accessoryEventHander = self->_accessoryEventHander;
  if (accessoryEventHander)
  {
    if ((accessoryEventHander & 7) != 0) {
      goto LABEL_56;
    }
    (*((void (**)(IPodEventSender *))accessoryEventHander->var0 + 1))(accessoryEventHander);
  }
  v31 = *p_accessoryEQEventHandler;
  if (*p_accessoryEQEventHandler)
  {
    if ((v31 & 7) != 0) {
      goto LABEL_56;
    }
    (*((void (**)(IPodEventSender *))v31->var0 + 1))(v31);
  }
  v32 = *p_headsetEventHandler;
  if (!*p_headsetEventHandler) {
    goto LABEL_48;
  }
  if ((v32 & 7) != 0)
  {
LABEL_56:
    __break(0x5516u);
    goto LABEL_57;
  }
  (*((void (**)(IPodEventSender *))v32->var0 + 1))(v32);
LABEL_48:
  if (!notify_register_check((const char *)&kIAPAvailableNotification, &dword_100139730))
  {
    uint64_t v34 = 0;
    notify_get_state(dword_100139730, &v34);
    if (v34 == 1)
    {
      notify_set_state(dword_100139730, 0);
      notify_post((const char *)&kIAPAvailableNotification);
    }
    notify_cancel(dword_100139730);
  }
  p_sleepAssertionTimer = &self->_sleepAssertionTimer;
  if ((p_sleepAssertionTimer & 7) != 0) {
    goto LABEL_56;
  }
  if (*p_sleepAssertionTimer)
  {
    CFRunLoopTimerInvalidate(*p_sleepAssertionTimer);
    CFRelease(*p_sleepAssertionTimer);
  }
}

- (void)dealloc
{
  if ((((_BYTE)self + 120) & 7) != 0) {
    goto LABEL_9;
  }

  self->_iapPortManagers = 0;
  p_deviceClass = &self->_deviceClass;
  if (((unint64_t)&self->_deviceClass & 7) != 0) {
    goto LABEL_9;
  }
  if (*p_deviceClass) {
    CFRelease(*p_deviceClass);
  }
  p_deviceProductType = &self->_deviceProductType;
  if (((unint64_t)&self->_deviceProductType & 7) != 0)
  {
LABEL_9:
    __break(0x5516u);
  }
  else
  {
    if (*p_deviceProductType) {
      CFRelease(*p_deviceProductType);
    }
    v5.receiver = self;
    v5.super_class = (Class)IAPServer;
    [(IAPServer *)&v5 dealloc];
  }
}

- (void)run
{
  Current = CFRunLoopGetCurrent();
  if (((unint64_t)&self->_serverRunLoop & 7) != 0) {
    goto LABEL_15;
  }
  self->_serverRunLoop = Current;
  [+[IAPStackshot sharedInstance] start];
  p_systemPowerNotifyPortRef = &self->_systemPowerNotifyPortRef;
  dword_10013BAF8 = IORegisterForSystemPower(0, &self->_systemPowerNotifyPortRef, (IOServiceInterestCallback)sub_10000F0AC, &self->_systemPowerIterator);
  if (dword_10013BAF8)
  {
    if ((p_systemPowerNotifyPortRef & 7) != 0) {
      goto LABEL_15;
    }
    serverRunLoop = self->_serverRunLoop;
    RunLoopSource = IONotificationPortGetRunLoopSource(*p_systemPowerNotifyPortRef);
    CFRunLoopAddSource(serverRunLoop, RunLoopSource, kCFRunLoopCommonModes);
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, kIAPServerLaunchedNotification, 0, 0, 1u);
  sub_10005104C();
  p_internalListenerQueue = &self->_internalListenerQueue;
  if (((unint64_t)&self->_internalListenerQueue & 7) != 0) {
    goto LABEL_15;
  }
  objc_super v9 = *p_internalListenerQueue;
  if (!*p_internalListenerQueue) {
    goto LABEL_16;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000F210;
  block[3] = &unk_100121CA0;
  block[4] = self;
  dispatch_async(v9, block);
  xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
  if (!v10) {
    goto LABEL_16;
  }
  v11 = v10;
  xpc_dictionary_set_string(v10, "requestType", "ping");
  if ((((int)self + 144) & 7) != 0
    || ([(IAPXPCConnection *)self->_iaptransportd_connection sendMessage:v11],
        xpc_release(v11),
        p_serverFlags = &self->serverFlags,
        ((unint64_t)&self->serverFlags & 3) != 0))
  {
LABEL_15:
    __break(0x5516u);
LABEL_16:
    __break(0x5510u);
    return;
  }
  while ((*(unsigned char *)p_serverFlags & 1) == 0)
  {
    id v13 = objc_alloc_init((Class)NSAutoreleasePool);
    if (CFRunLoopRunInMode(kCFRunLoopDefaultMode, 1.0e10, 1u) == kCFRunLoopRunFinished) {
      *(_DWORD *)p_serverFlags |= 1u;
    }
  }
  self->_isShuttingDown = 1;
  [(IAPServer *)self bringdownPlatform];

  qword_10013BAF0 = 0;
}

- (void)_pollForDeathAfterPromptCompletes
{
  if ((((_BYTE)self + 16) & 3) != 0
    || (*(_DWORD *)&self->serverFlags |= 1u, ((unint64_t)&self->_serverRunLoop & 7) != 0))
  {
    __break(0x5516u);
  }
  else
  {
    CFRunLoopStop(self->_serverRunLoop);
  }
}

- (void)stopServer:(int)a3
{
  if (a3 >= 4) {
    __break(0x550Au);
  }
  -[IAPServer stopServer:forceExitingImmediately:](self, "stopServer:forceExitingImmediately:");
}

- (void)stopServer:(int)a3 forceExitingImmediately:(BOOL)a4
{
  if (((unint64_t)&self->serverFlags & 3) != 0) {
    goto LABEL_12;
  }
  BOOL v4 = a4;
  *(_DWORD *)&self->serverFlags |= 2u;
  if (qword_10013BB00)
  {

    qword_10013BB00 = 0;
  }
  if (v4)
  {
    *(_DWORD *)&self->serverFlags |= 1u;
    if (((unint64_t)&self->_serverRunLoop & 7) == 0)
    {
      serverRunLoop = self->_serverRunLoop;
      CFRunLoopStop(serverRunLoop);
      return;
    }
LABEL_12:
    __break(0x5516u);
    return;
  }
  [(IAPServer *)self performSelectorOnMainThread:"_pollForDeathAfterPromptCompletes" withObject:0 waitUntilDone:0];
}

- (BOOL)isServerStopping
{
  if (((unint64_t)&self->serverFlags & 3) != 0) {
    __break(0x5516u);
  }
  else {
    LODWORD(self) = (*(unsigned char *)&self->serverFlags >> 1) & 1;
  }
  return (char)self;
}

- (__CFString)deviceClass
{
  p_length = (__CFString **)&self[2].length;
  if (((unint64_t)&self[2].length & 7) != 0)
  {
    __break(0x5516u);
  }
  else
  {
    self = *p_length;
    if (!*p_length)
    {
      self = (__CFString *)MGCopyAnswer();
      *p_length = self;
    }
    if (!self) {
      return &stru_10012A858;
    }
  }
  return self;
}

- (__CFString)deviceProductType
{
  v2 = (__CFString **)&self[3];
  if (((unint64_t)&self[3] & 7) != 0)
  {
    __break(0x5516u);
  }
  else
  {
    self = *v2;
    if (!*v2)
    {
      self = (__CFString *)MGCopyAnswer();
      *v2 = self;
    }
    if (!self) {
      return &stru_10012A858;
    }
  }
  return self;
}

- (void)preventIdleSleep:(int)a3
{
  p_disableSleepAssertions = &self->_disableSleepAssertions;
  if (((unint64_t)&self->_disableSleepAssertions & 3) != 0) {
    goto LABEL_24;
  }
  int v6 = *p_disableSleepAssertions;
  if (*p_disableSleepAssertions == -1)
  {
    int v6 = CFPreferencesGetAppBooleanValue(@"SuppressSleepAssertions", @"com.apple.iapd", 0) != 0;
    int *p_disableSleepAssertions = v6;
  }
  if (v6 != 1)
  {
    pthread_mutex_lock(&stru_100139738);
    p_sleepAssertionTimer = &self->_sleepAssertionTimer;
    if (((unint64_t)&self->_sleepAssertionTimer & 7) != 0) {
      goto LABEL_24;
    }
    if (*p_sleepAssertionTimer)
    {
      CFRunLoopTimerInvalidate(*p_sleepAssertionTimer);
      CFRelease(*p_sleepAssertionTimer);
      *p_sleepAssertionTimer = 0;
    }
    unsigned int hasSleepAssertion = self->_hasSleepAssertion;
    if (a3 < 1)
    {
      if (hasSleepAssertion > 1) {
        goto LABEL_25;
      }
      if (!self->_hasSleepAssertion) {
        goto LABEL_18;
      }
      if (((unint64_t)&self->_sleepAssertionId & 3) != 0) {
        goto LABEL_24;
      }
      IOPMAssertionRelease(self->_sleepAssertionId);
      BOOL v9 = 0;
    }
    else
    {
      if (hasSleepAssertion >= 2) {
        goto LABEL_25;
      }
      if (self->_hasSleepAssertion) {
        goto LABEL_18;
      }
      v12[0] = @"AssertType";
      v12[1] = @"AssertLevel";
      v13[0] = @"NoIdleSleepAssertion";
      v13[1] = &off_100131DD8;
      v12[2] = @"AssertName";
      v12[3] = @"AllowsDeviceRestart";
      v13[2] = @"com.apple.iapd.acc-connected";
      v13[3] = kCFBooleanTrue;
      if (IOPMAssertionCreateWithProperties((CFDictionaryRef)+[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:4], &self->_sleepAssertionId))
      {
        goto LABEL_18;
      }
      BOOL v9 = 1;
    }
    self->_unsigned int hasSleepAssertion = v9;
LABEL_18:
    if (self->_hasSleepAssertion > 1u) {
      goto LABEL_25;
    }
    if (!self->_hasSleepAssertion)
    {
LABEL_22:
      pthread_mutex_unlock(&stru_100139738);
      return;
    }
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    v11 = CFRunLoopTimerCreate(kCFAllocatorDefault, Current + (double)a3, 0.0, 0, 0, (CFRunLoopTimerCallBack)sub_10000F8C4, 0);
    self->_sleepAssertionTimer = v11;
    if (((unint64_t)&self->_serverRunLoop & 7) == 0)
    {
      CFRunLoopAddTimer(self->_serverRunLoop, v11, kCFRunLoopCommonModes);
      goto LABEL_22;
    }
LABEL_24:
    __break(0x5516u);
LABEL_25:
    __break(0x550Au);
  }
}

- (id)iapPortManagerForDevPort:(void *)a3
{
  if (!a3) {
    return 0;
  }
  id result = [objc_alloc((Class)NSNumber) initWithInt:sub_10002C480((uint64_t)a3)];
  if (!result) {
    return 0;
  }
  if (((unint64_t)&self->_iapPortManagers & 7) != 0)
  {
    __break(0x5516u);
  }
  else
  {
    id v5 = result;
    id v6 = [(NSMutableDictionary *)self->_iapPortManagers objectForKey:result];

    return v6;
  }
  return result;
}

- (void)addNewTransport:(void *)a3
{
  if (!a3) {
    goto LABEL_14;
  }
  if ((a3 & 7) != 0) {
    goto LABEL_14;
  }
  (*(void (**)(void *, SEL))(*(void *)a3 + 64))(a3, a2);
  uint64_t ServiceWithPrimaryPort = IOAccessoryManagerGetServiceWithPrimaryPort();
  p_iapPortManagers = (id *)&self->_iapPortManagers;
  if (((unint64_t)&self->_iapPortManagers & 7) != 0) {
    goto LABEL_14;
  }
  uint64_t v7 = ServiceWithPrimaryPort;
  if (!*p_iapPortManagers) {
    id *p_iapPortManagers = objc_alloc_init((Class)NSMutableDictionary);
  }
  id v10 = [objc_alloc((Class)NSNumber) initWithLong:(*(int (**)(void *))(*(void *)a3 + 64))(a3)];
  if (objc_msgSend(*p_iapPortManagers, "objectForKey:")) {
    goto LABEL_9;
  }
  v8 = [IAPPortManager alloc];
  if (((unint64_t)&self->_ioaccessoryNotifyPort & 7) != 0)
  {
LABEL_14:
    __break(0x5516u);
    return;
  }
  BOOL v9 = [(IAPPortManager *)v8 initWithService:v7 andNotificationPort:self->_ioaccessoryNotifyPort];
  objc_msgSend(*p_iapPortManagers, "setObject:forKey:", v9, -[IAPPortManager portNumber](v9, "portNumber"));

LABEL_9:
  if (v7) {
    IOObjectRelease(v7);
  }
}

- (void)removeTransport:(void *)a3
{
  p_iapPortManagers = (id *)&self->_iapPortManagers;
  if (((unint64_t)&self->_iapPortManagers & 7) != 0) {
    goto LABEL_12;
  }
  if (!*p_iapPortManagers) {
    return;
  }
  if ((a3 & 7) != 0) {
    goto LABEL_12;
  }
  if ((int)sub_10002C480((uint64_t)a3) < 6) {
    return;
  }
  id v5 = objc_alloc((Class)NSNumber);
  if (!a3 || (a3 & 7) != 0)
  {
LABEL_12:
    __break(0x5516u);
    return;
  }
  id v6 = [v5 initWithLong:(*(int (**)(void *))(*(void *)a3 + 64))(a3)];
  if (v6)
  {
    id v7 = v6;
    [*p_iapPortManagers removeObjectForKey:v6];
  }
}

- (void)updateTransportListStates
{
  uint64_t v2 = sub_10000FC8C();
  pthread_mutex_lock(&stru_10013B980);
  uint64_t v3 = *(void *)(v2 + 16);
  pthread_mutex_unlock(&stru_10013B980);
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  if (v4)
  {
    id v5 = v4;
    xpc_dictionary_set_BOOL(v4, "transportListContainsItems", v3 != 0);
    xpc_dictionary_set_string(v5, "requestType", "iapdTransportListStates");
    objc_msgSend(objc_msgSend(+[IAPServer sharedIAPServer](IAPServer, "sharedIAPServer"), "iaptransportd_connection"), "sendMessage:", v5);
    xpc_release(v5);
  }
  else
  {
    __break(0x5510u);
  }
}

- (void)deleteAllPorts
{
  uint64_t v2 = sub_10000FC8C();
  pthread_mutex_lock(&stru_10013B980);
  uint64_t v8 = *(void *)(v2 + 8);
  if (v8 == v2)
  {
LABEL_10:
    pthread_mutex_unlock(&stru_10013B980);
  }
  else
  {
    while (1)
    {
      uint64_t v3 = *sub_10000FDD0(&v8);
      if (!v3 || (v3 & 7) != 0) {
        break;
      }
      *(unsigned char *)(v3 + 72) = 1;
      uint64_t v5 = sub_1000D289C();
      if (!v5) {
        break;
      }
      uint64_t v6 = v5;
      if ((v5 & 7) != 0) {
        break;
      }
      id v7 = sub_10000FDD0(&v8);
      (*(void (**)(uint64_t, uint64_t, void, uint64_t, void))(*(void *)v6 + 48))(v6, 8, 0, *v7, 0);
      sub_10000FE04(&v8);
      if (v8 == v2) {
        goto LABEL_10;
      }
    }
    __break(0x5516u);
  }
}

- (NSMutableDictionary)iapPortManagers
{
  return self->_iapPortManagers;
}

- (NSString)dpFirmwareVersion
{
  return self->_dpFirmwareVersion;
}

- (void)setDpFirmwareVersion:(id)a3
{
}

- (IAPXPCConnection)iaptransportd_connection
{
  return self->_iaptransportd_connection;
}

- (void)setIaptransportd_connection:(id)a3
{
}

- (BOOL)isShuttingDown
{
  unsigned int isShuttingDown = self->_isShuttingDown;
  if (isShuttingDown >= 2) {
    __break(0x550Au);
  }
  else {
    LOBYTE(self) = isShuttingDown != 0;
  }
  return (char)self;
}

- (void)setIsShuttingDown:(BOOL)a3
{
  self->_unsigned int isShuttingDown = a3;
}

@end