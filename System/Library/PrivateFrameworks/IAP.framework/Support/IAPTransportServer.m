@interface IAPTransportServer
+ (BOOL)supportsIAPD;
+ (id)sharedIAPTransportServer;
- (BOOL)bHasConnectionCON;
- (BOOL)bHasConnectionE75;
- (BOOL)bOSInternalBuild;
- (BOOL)createNewClientPort:(id)a3 connection:(id)a4;
- (BOOL)iap2dPortListContainsItems;
- (BOOL)iapdPortListContainsItems;
- (BOOL)isDeviceInLowPowerMode;
- (BOOL)isLowPowerModeSupported;
- (BOOL)isShuttingDown;
- (IAPTransportServer)init;
- (IAPXPCConnection)iap2d_connection;
- (IAPXPCConnection)iapd_connection;
- (IONotificationPort)ioaccessoryNotifyPort;
- (NSMutableDictionary)iapPortManagers;
- (NSString)deviceUUIDStr;
- (OS_dispatch_queue)iaptransportdhighPriorityRootQueue;
- (OS_dispatch_queue)shutdownQ;
- (id)iapPortManagerForDevPort:(IapTransport *)a3;
- (int)iDeviceClass;
- (unsigned)iap9PinUSBConnState;
- (unsigned)ioAccNotification;
- (unsigned)ioAccPortID;
- (void)_detachClientPort:(IapTransport *)a3;
- (void)_listenForAccessoryPortChanges;
- (void)_pollForDeathAfterPromptCompletes;
- (void)_setupiAPInterfaceNotifications;
- (void)_updatePlistWithApplicationUninstall:(id)a3;
- (void)applicationsDidUninstall:(id)a3;
- (void)applicationsWillUninstall:(id)a3;
- (void)attachPowerModeNotifications;
- (void)bringdownPlatform;
- (void)bringupPlatform;
- (void)checkXPCConnections;
- (void)cleanupPhysicalConnectorConnections;
- (void)cleanupStaleClientPorts:(int)a3;
- (void)clientPortReceivedData:(id)a3 dataPtr:(char *)a4 length:(unsigned __int16)a5;
- (void)dealloc;
- (void)deleteAllPorts;
- (void)deleteClientPortsUsingConnection:(id)a3;
- (void)deleteWiredPorts;
- (void)detachIOKitPort:(IapTransport *)a3;
- (void)detachPowerModeNotifications;
- (void)enterLowPowerMode;
- (void)exitLowPowerMode;
- (void)handleLowPowerModeStateChange:(BOOL)a3;
- (void)iap2Disconnect;
- (void)iapDisconnect;
- (void)pIapPortAppleIDBusRootCON;
- (void)pIapPortAppleIDBusRootE75;
- (void)preventIdleSleep:(BOOL)a3;
- (void)radioPreferencesChanged:(unsigned int)a3;
- (void)registerClientPortAccessory:(id)a3 connection:(id)a4;
- (void)run;
- (void)sendValidAccResistorIDToIAPD;
- (void)setHasAdaptor:(BOOL)a3;
- (void)setIap2dPortListContainsItems:(BOOL)a3;
- (void)setIap2d_connection:(id)a3;
- (void)setIap9PinUSBConnState:(unsigned __int8)a3;
- (void)setIapdPortListContainsItems:(BOOL)a3;
- (void)setIapd_connection:(id)a3;
- (void)setIoAccNotification:(unsigned int)a3;
- (void)setIoAccPortID:(unsigned __int8)a3;
- (void)setIsShuttingDown:(BOOL)a3;
- (void)setUSBMode:(IapTransport *)a3 forMode:(int)a4;
- (void)setWiredPortPacketParsingState:(BOOL)a3;
- (void)setiaptransportdhighPriorityRootQueue:(id)a3;
- (void)startAccPowerTimer:(unsigned int)a3;
- (void)startAccPowerTimer:(unsigned int)a3 ForPortService:(unsigned int)a4;
- (void)startIOAccMgrPortDetectTimer:(unsigned int)a3;
- (void)stopServer:(int)a3;
- (void)stopServer:(int)a3 forceExitingImmediately:(BOOL)a4;
- (void)toggleAccessoryPowerForPortService:(unsigned int)a3;
- (void)unregisterClientPortAccessory:(id)a3;
- (void)updateDeviceUUIDState;
- (void)updatePortManagers;
- (void)updateSleepAssertionState;
@end

@implementation IAPTransportServer

+ (id)sharedIAPTransportServer
{
  if (qword_100031F88 != -1) {
    dispatch_once(&qword_100031F88, &stru_10002D650);
  }
  return (id)qword_100031F90;
}

+ (BOOL)supportsIAPD
{
  return 1;
}

- (void)setiaptransportdhighPriorityRootQueue:(id)a3
{
  iaptransportdhighPriorityRootQueue = self->_iaptransportdhighPriorityRootQueue;
  if (iaptransportdhighPriorityRootQueue) {
    dispatch_release(iaptransportdhighPriorityRootQueue);
  }
  self->_iaptransportdhighPriorityRootQueue = (OS_dispatch_queue *)a3;
  if (a3)
  {
    dispatch_retain((dispatch_object_t)a3);
  }
}

- (void)_listenForAccessoryPortChanges
{
  ioaccessoryNotifyPort = self->_ioaccessoryNotifyPort;
  CFDictionaryRef v4 = IOServiceMatching("IOAccessoryPort");
  uint64_t v5 = IOServiceAddMatchingNotification(ioaccessoryNotifyPort, "IOServicePublish", v4, (IOServiceMatchingCallback)sub_10001691C, self, &self->_ioaccessoryPortAddedIterator);
  if (v5)
  {
    NSLog(@"ERROR - %s:%s - %d IOServiceAddMatchingNotification failed 0x%x", "/Library/Caches/com.apple.xbs/Sources/iapd/iaptransportd/IAPTransportServer.mm", "-[IAPTransportServer _listenForAccessoryPortChanges]", 1688, v5);
  }
  else
  {
    sub_10001691C(self, self->_ioaccessoryPortAddedIterator);
    Main = CFRunLoopGetMain();
    RunLoopSource = IONotificationPortGetRunLoopSource(self->_ioaccessoryNotifyPort);
    CFRunLoopAddSource(Main, RunLoopSource, kCFRunLoopDefaultMode);
  }
}

- (void)_setupiAPInterfaceNotifications
{
  v3 = IONotificationPortCreate(kIOMasterPortDefault);
  self->_iapInterfaceNotifyPort = v3;
  if (v3)
  {
    CFMutableDictionaryRef v4 = IOServiceMatching("IOUSBInterface");
    if (v4)
    {
      uint64_t v5 = v4;
      keys = @"SupportsIAP";
      CFDictionaryRef v6 = CFDictionaryCreate(kCFAllocatorDefault, (const void **)&keys, (const void **)&kCFBooleanTrue, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      CFDictionarySetValue(v5, @"IOPropertyMatch", v6);
      CFRelease(v6);
      CFDictionaryRef v7 = (const __CFDictionary *)CFRetain(v5);
      uint64_t v8 = IOServiceAddMatchingNotification(self->_iapInterfaceNotifyPort, "IOServiceFirstMatch", v7, (IOServiceMatchingCallback)sub_100016DF0, 0, &self->_iAPInterfaceDeviceArrivedIterator);
      if (v8) {
        NSLog(@"_attachiAPInterfaceUSBDevices: could not install kIOFirstMatchNotification notification, error: %08x", v8);
      }
      sub_100016DF0(v8, self->_iAPInterfaceDeviceArrivedIterator);
      uint64_t v9 = IOServiceAddMatchingNotification(self->_iapInterfaceNotifyPort, "IOServiceTerminate", v7, (IOServiceMatchingCallback)sub_100017364, 0, &self->_iAPInterfaceDeviceRemovedIterator);
      if (v9) {
        NSLog(@"_attachiAPInterfaceUSBDevices: could not install kIOTerminatedNotification notification, error: %08x", v9);
      }
      sub_100017364(v9, self->_iAPInterfaceDeviceRemovedIterator);
      Main = CFRunLoopGetMain();
      RunLoopSource = IONotificationPortGetRunLoopSource(self->_iapInterfaceNotifyPort);
      CFRunLoopAddSource(Main, RunLoopSource, kCFRunLoopDefaultMode);
    }
    else
    {
      NSLog(@"_attachiAPInterfaceUSBDevices: IOServiceMatching() failed");
    }
  }
  else
  {
    NSLog(@"_attachiAPInterfaceUSBDevices: IONotificationPortCreate() failed");
  }
}

- (void)startAccPowerTimer:(unsigned int)a3
{
  if (!self->_isShuttingDown)
  {
    int64_t initAccPowerTimerOnce = self->_initAccPowerTimerOnce;
    p_int64_t initAccPowerTimerOnce = &self->_initAccPowerTimerOnce;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100017498;
    block[3] = &unk_10002D6B8;
    block[4] = self;
    if (initAccPowerTimerOnce != -1) {
      dispatch_once(p_initAccPowerTimerOnce, block);
    }
    accPowerTimer = self->_accPowerTimer;
    dispatch_time_t v8 = dispatch_time(0, 1000000 * a3);
    dispatch_source_set_timer(accPowerTimer, v8, 0xFFFFFFFFFFFFFFFFLL, 0);
  }
}

- (void)startAccPowerTimer:(unsigned int)a3 ForPortService:(unsigned int)a4
{
  if (!self->_isShuttingDown)
  {
    int64_t initAccPowerForPortServiceTimerOnce = self->_initAccPowerForPortServiceTimerOnce;
    p_int64_t initAccPowerForPortServiceTimerOnce = &self->_initAccPowerForPortServiceTimerOnce;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100017740;
    v10[3] = &unk_10002D6E0;
    v10[4] = self;
    unsigned int v11 = a4;
    if (initAccPowerForPortServiceTimerOnce != -1) {
      dispatch_once(p_initAccPowerForPortServiceTimerOnce, v10);
    }
    accPowerForPortServiceTimer = self->_accPowerForPortServiceTimer;
    dispatch_time_t v9 = dispatch_time(0, 1000000 * a3);
    dispatch_source_set_timer(accPowerForPortServiceTimer, v9, 0xFFFFFFFFFFFFFFFFLL, 0);
  }
}

- (void)startIOAccMgrPortDetectTimer:(unsigned int)a3
{
  if (!self->_isShuttingDown)
  {
    int64_t initIOAccMgrPortDetectTimerOnce = self->_initIOAccMgrPortDetectTimerOnce;
    p_int64_t initIOAccMgrPortDetectTimerOnce = &self->_initIOAccMgrPortDetectTimerOnce;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000179D8;
    v6[3] = &unk_10002D6E0;
    v6[4] = self;
    unsigned int v7 = a3;
    if (initIOAccMgrPortDetectTimerOnce != -1) {
      dispatch_once(p_initIOAccMgrPortDetectTimerOnce, v6);
    }
  }
}

- (void)iapDisconnect
{
  shutdownQ = self->_shutdownQ;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100017F60;
  block[3] = &unk_10002D6B8;
  block[4] = self;
  dispatch_async(shutdownQ, block);
}

- (void)iap2Disconnect
{
  shutdownQ = self->_shutdownQ;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000180DC;
  block[3] = &unk_10002D6B8;
  block[4] = self;
  dispatch_async(shutdownQ, block);
}

- (void)setUSBMode:(IapTransport *)a3 forMode:(int)a4
{
  id v4 = [(IAPTransportServer *)self iapPortManagerForDevPort:a3];
  if (v4)
  {
    io_service_t v5 = [v4 service];
    io_connect_t connect = 0;
    uint64_t v6 = IOServiceOpen(v5, mach_task_self_, 0, &connect);
    if (v6) {
      BOOL v7 = 1;
    }
    else {
      BOOL v7 = connect == 0;
    }
    if (v7)
    {
      NSLog(@"ERROR - %s:%s - %d IOServiceOpen failed %#x\n", "/Library/Caches/com.apple.xbs/Sources/iapd/iaptransportd/IAPTransportServer.mm", "-[IAPTransportServer setUSBMode:forMode:]", 1998, v6);
    }
    else
    {
      uint64_t v8 = IOAccessoryManagerConfigureUSBMode();
      if (v8)
      {
        if (v8 == -536870183) {
          NSLog(@"INFO - %s:%s - %d IOAccessoryManagerConfigureUSBMode not attached %#x\n", "/Library/Caches/com.apple.xbs/Sources/iapd/iaptransportd/IAPTransportServer.mm", "-[IAPTransportServer setUSBMode:forMode:]", 2006, 3758097113);
        }
        else {
          NSLog(@"ERROR - %s:%s - %d IOAccessoryManagerConfigureUSBMode failed %#x\n", "/Library/Caches/com.apple.xbs/Sources/iapd/iaptransportd/IAPTransportServer.mm", "-[IAPTransportServer setUSBMode:forMode:]", 2010, v8);
        }
      }
      IOServiceClose(connect);
    }
  }
}

- (BOOL)isLowPowerModeSupported
{
  return MGGetBoolAnswer();
}

- (void)setWiredPortPacketParsingState:(BOOL)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100018378;
  v3[3] = &unk_10002D750;
  BOOL v4 = a3;
  pthread_mutex_lock(&stru_100031C80);
  sub_100018378((uint64_t)v3);
  pthread_mutex_unlock(&stru_100031C80);
}

- (void)deleteWiredPorts
{
  shutdownQ = self->_shutdownQ;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000184A4;
  block[3] = &unk_10002D6B8;
  block[4] = self;
  dispatch_async(shutdownQ, block);
}

- (void)enterLowPowerMode
{
  sub_100006450(3);
  if (byte_100031FB0 == 1) {
    [(IAPTransportServer *)self cleanupStaleClientPorts:3];
  }
  [(IAPTransportServer *)self setWiredPortPacketParsingState:0];
  [(IAPTransportServer *)self cleanupPhysicalConnectorConnections];
  sub_1000175D8(1, 0);
}

- (void)exitLowPowerMode
{
  [(IAPTransportServer *)self checkXPCConnections];
  [(IAPTransportServer *)self setWiredPortPacketParsingState:1];
  sub_1000175D8(3, 0);
  [(IAPTransportServer *)self sendValidAccResistorIDToIAPD];
}

- (BOOL)isDeviceInLowPowerMode
{
  radiosPreferences = self->_radiosPreferences;
  if (radiosPreferences)
  {
    SCPreferencesSynchronize(radiosPreferences);
    radiosPreferences = (const __SCPreferences *)SCPreferencesGetValue(self->_radiosPreferences, @"LowPowerMode");
    if (radiosPreferences)
    {
      CFBooleanRef v4 = radiosPreferences;
      CFTypeID v5 = CFGetTypeID(radiosPreferences);
      LOBYTE(radiosPreferences) = v5 == CFBooleanGetTypeID() && CFBooleanGetValue(v4) == 1;
    }
  }
  return (char)radiosPreferences;
}

- (void)handleLowPowerModeStateChange:(BOOL)a3
{
  if (a3) {
    [(IAPTransportServer *)self enterLowPowerMode];
  }
  else {
    [(IAPTransportServer *)self exitLowPowerMode];
  }
}

- (void)radioPreferencesChanged:(unsigned int)a3
{
  if ((a3 & 2) != 0)
  {
    BOOL v4 = [(IAPTransportServer *)self isDeviceInLowPowerMode];
    if (self->_lowPowerModeEnabled != v4)
    {
      self->_lowPowerModeEnabled = v4;
      [(IAPTransportServer *)self handleLowPowerModeStateChange:v4];
    }
  }
}

- (void)attachPowerModeNotifications
{
  v3 = SCPreferencesCreate(kCFAllocatorDefault, @"com.apple.iaptransportd", @"com.apple.radios.plist");
  self->_radiosPreferences = v3;
  if (v3)
  {
    int v4 = SCPreferencesSetCallback(v3, (SCPreferencesCallBack)sub_100018920, 0);
    radiosPreferences = self->_radiosPreferences;
    if (v4)
    {
      global_queue = dispatch_get_global_queue(0, 0);
      SCPreferencesSetDispatchQueue(radiosPreferences, global_queue);
    }
    else
    {
      CFRelease(self->_radiosPreferences);
      self->_radiosPreferences = 0;
    }
  }
}

- (void)detachPowerModeNotifications
{
  radiosPreferences = self->_radiosPreferences;
  if (radiosPreferences)
  {
    SCPreferencesSetDispatchQueue(radiosPreferences, 0);
    CFRelease(self->_radiosPreferences);
    self->_radiosPreferences = 0;
  }
}

- (IAPTransportServer)init
{
  v30.receiver = self;
  v30.super_class = (Class)IAPTransportServer;
  v2 = [(IAPTransportServer *)&v30 init];
  if (!v2) {
    return (IAPTransportServer *)v2;
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)sub_100019044, @"com.apple.iapd.LoggingPreferencesChangedNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  sub_10001D598();
  v2[209] = 0;
  *((void *)v2 + 25) = 0;
  if ([v2 isLowPowerModeSupported])
  {
    [v2 attachPowerModeNotifications];
    v2[208] = [v2 isDeviceInLowPowerMode];
  }
  byte_100031FB0 = MGGetBoolAnswer();
  *((_WORD *)v2 + 14) = 0;
  *((void *)v2 + 30) = 0;
  *(_OWORD *)(v2 + 136) = 0u;
  *(_OWORD *)(v2 + 152) = 0u;
  *(_OWORD *)(v2 + 168) = 0u;
  int v4 = objc_alloc_init(IAPWorkspaceObserver);
  *((void *)v2 + 4) = v4;
  [(IAPWorkspaceObserver *)v4 setDelegate:v2];
  [*((id *)v2 + 4) startObserving];
  *((void *)v2 + 31) = 0;
  v2[256] = 0;
  *((void *)v2 + 15) = dispatch_queue_create("IAPTransportServerListenerQueue", 0);
  *((void *)v2 + 16) = dispatch_queue_create("IAPTransportServerAccPowerTimerQueue", 0);
  *((void *)v2 + 29) = dispatch_queue_create("IAPTransportServerShutdownQueue", 0);
  *((void *)v2 + 33) = 0;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3052000000;
  v29[3] = sub_100017CF4;
  v29[4] = sub_100017D04;
  v29[5] = v2;
  *((void *)v2 + 27) = 0;
  if (+[IAPTransportServer supportsIAPD])
  {
    CFTypeID v5 = [[IAPXPCConnection alloc] initWithServiceName:@"com.apple.iapd.xpc" queueName:@"com.apple.iapd.IAPXPCConnection"];
    *((void *)v2 + 27) = v5;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_100019074;
    v28[3] = &unk_10002D478;
    v28[4] = v29;
    [(IAPXPCConnection *)v5 setDisconnectBlock:v28];
  }
  uint64_t v6 = [[IAPXPCConnection alloc] initWithServiceName:@"com.apple.iap2d.xpc" queueName:@"com.apple.iap2d.IAPXPCConnection"];
  *((void *)v2 + 28) = v6;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100019084;
  v27[3] = &unk_10002D478;
  v27[4] = v29;
  [(IAPXPCConnection *)v6 setDisconnectBlock:v27];
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_10002D8B0);
  IONotificationPortRef v7 = IONotificationPortCreate(kIOMasterPortDefault);
  *((_DWORD *)v2 + 46) = 0;
  *((void *)v2 + 6) = v7;
  v2[192] = 0;
  *(_DWORD *)(v2 + 187) = 0;
  v2[272] = -1;
  int AppIntegerValue = CFPreferencesGetAppIntegerValue(@"E75ServiceMaxAttempts", @"com.apple.iaptransportd", 0);
  int v9 = AppIntegerValue;
  if (AppIntegerValue) {
    syslog(6, "IAPTransportServer: init: E75ServiceMaxAttempts=%d\n", AppIntegerValue);
  }
  else {
    int v9 = 10;
  }
  int v24 = v9;
  int v25 = 0;
  while (1)
  {
    existing[0] = 0;
    CFDictionaryRef v10 = IOServiceMatching("IOAccessoryManager");
    if (IOServiceGetMatchingServices(kIOMasterPortDefault, v10, existing))
    {
      syslog(4, "IAPTransportServer: init: Error: IOServiceGetMatchingServices failed\n");
    }
    else
    {
      syslog(4, "IAPTransportServer: init: ioPortIter:0x%x\n", existing[0]);
      while (1)
      {
        int v11 = IOIteratorNext(existing[0]);
        if (!v11) {
          break;
        }
        int PrimaryPort = IOAccessoryManagerGetPrimaryPort();
        int TransportType = IOAccessoryPortGetTransportType();
        int v14 = MGGetBoolAnswer();
        syslog(4, "IAPTransportServer: init: ioService:0x%x, portID:%d, priPortType:%d, supports9Pin:%d\n", v11, PrimaryPort, TransportType, v14);
        if (PrimaryPort == 1) {
          int v15 = v14;
        }
        else {
          int v15 = 0;
        }
        if (v15 == 1)
        {
          v2[189] = 1;
          xmmword_100032050 = 0u;
          *(_OWORD *)&dword_100032060 = 0u;
          xmmword_100032070 = 0u;
          unk_100032080 = 0u;
          xmmword_100032090 = 0u;
          *(_OWORD *)&qword_1000320A0 = 0u;
          qword_1000320B0 = 0;
          DWORD2(xmmword_100032050) = 1;
          HIDWORD(xmmword_100032050) = TransportType;
          dword_100032060 = v11;
          IOObjectRetain(v11);
          qword_100031F98 = sub_10000AC30((uint64_t)v2, (uint64_t)&xmmword_100032050);
          syslog(4, "IAPTransportServer: init: __pIapAppleIDBusRootE75:0x%x\n", qword_100031F98);
          if (!qword_100031F98)
          {
            _os_assert_log();
            uint64_t v21 = _os_crash();
            sub_10001F6DC(v21);
          }
        }
        else if (PrimaryPort == 256)
        {
          v2[190] = 1;
          xmmword_1000320B8 = 0u;
          *(_OWORD *)&dword_1000320C8 = 0u;
          xmmword_1000320D8 = 0u;
          unk_1000320E8 = 0u;
          xmmword_1000320F8 = 0u;
          unk_100032108 = 0u;
          qword_100032118 = 0;
          DWORD2(xmmword_1000320B8) = 256;
          HIDWORD(xmmword_1000320B8) = TransportType;
          dword_1000320C8 = v11;
          IOObjectRetain(v11);
          qword_100031FA8 = sub_10000AC30((uint64_t)v2, (uint64_t)&xmmword_1000320B8);
          if (!qword_100031FA8)
          {
            _os_assert_log();
            uint64_t v22 = _os_crash();
            sub_10001F6DC(v22);
          }
        }
        IOObjectRelease(v11);
      }
      IOObjectRelease(existing[0]);
    }
    if (qword_100031F98) {
      break;
    }
    syslog(4, "IAPTransportServer: init:%d: __pIapAppleIDBusRootE75 == NULL\n", 2373);
    usleep(0x186A0u);
    if (!qword_100031F98 && v25++ < v24) {
      continue;
    }
    if (!qword_100031F98) {
      syslog(4, "IAPTransportServer: init:%d: __pIapAppleIDBusRootE75 == NULL\n", 2380);
    }
    break;
  }
  v2[191] = 1;
  xmmword_100032120 = 0u;
  *(_OWORD *)algn_100032130 = 0u;
  xmmword_100032140 = 0u;
  unk_100032150 = 0u;
  xmmword_100032160 = 0u;
  unk_100032170 = 0u;
  qword_100032180 = 0;
  qword_100031FA0 = sub_10000AC30((uint64_t)v2, (uint64_t)&xmmword_100032120);
  if (!qword_100031FA0)
  {
    _os_assert_log();
    uint64_t v23 = _os_crash();
    sub_10001F6DC(v23);
  }
  v2[188] = MGGetBoolAnswer();
  v17 = (const void *)MGCopyAnswer();
  v18 = v17;
  if (v17)
  {
    if (CFEqual(v17, @"iPhone"))
    {
      int v19 = 1;
    }
    else if (CFEqual(v18, @"iPod"))
    {
      int v19 = 2;
    }
    else
    {
      if (!CFEqual(v18, @"iPad"))
      {
LABEL_38:
        CFRelease(v18);
        goto LABEL_39;
      }
      int v19 = 3;
    }
    *((_DWORD *)v2 + 46) = v19;
    goto LABEL_38;
  }
LABEL_39:
  [v2 updatePortManagers];
  [v2 _setupiAPInterfaceNotifications];
  if (!notify_register_check("com.apple.iaptransportd.notify.availability", &dword_100031D88))
  {
    *(void *)existing = 0;
    notify_get_state(dword_100031D88, (uint64_t *)existing);
    if (*(void *)existing != 1)
    {
      notify_set_state(dword_100031D88, 1uLL);
      notify_post("com.apple.iaptransportd.notify.availability");
    }
  }
  _Block_object_dispose(v29, 8);
  return (IAPTransportServer *)v2;
}

- (void)dealloc
{
  accPowerTimer = self->_accPowerTimer;
  if (accPowerTimer)
  {
    dispatch_source_cancel(accPowerTimer);
    dispatch_release((dispatch_object_t)self->_accPowerTimer);
    self->_accPowerTimer = 0;
  }
  accPowerForPortServiceTimer = self->_accPowerForPortServiceTimer;
  if (accPowerForPortServiceTimer)
  {
    dispatch_source_cancel(accPowerForPortServiceTimer);
    dispatch_release((dispatch_object_t)self->_accPowerForPortServiceTimer);
    self->_accPowerForPortServiceTimer = 0;
  }

  internalListenerQueue = self->_internalListenerQueue;
  if (internalListenerQueue)
  {
    dispatch_sync(internalListenerQueue, &stru_10002D770);
    dispatch_release((dispatch_object_t)self->_internalListenerQueue);
    self->_internalListenerQueue = 0;
  }
  accPowerQueue = self->_accPowerQueue;
  if (accPowerQueue) {
    dispatch_release(accPowerQueue);
  }
  self->_accPowerQueue = 0;
  shutdownQ = self->_shutdownQ;
  if (shutdownQ)
  {
    dispatch_sync(shutdownQ, &stru_10002D790);
    dispatch_release((dispatch_object_t)self->_shutdownQ);
    self->_shutdownQ = 0;
  }

  self->_iapPortManagers = 0;
  ioAccMgrPortDetectTimer = self->_ioAccMgrPortDetectTimer;
  if (ioAccMgrPortDetectTimer)
  {
    dispatch_source_cancel(ioAccMgrPortDetectTimer);
    dispatch_release((dispatch_object_t)self->_ioAccMgrPortDetectTimer);
    self->_ioAccMgrPortDetectTimer = 0;
  }
  io_object_t ioaccessoryPortAddedIterator = self->_ioaccessoryPortAddedIterator;
  if (ioaccessoryPortAddedIterator) {
    IOObjectRelease(ioaccessoryPortAddedIterator);
  }
  io_object_t iAPInterfaceDeviceArrivedIterator = self->_iAPInterfaceDeviceArrivedIterator;
  if (iAPInterfaceDeviceArrivedIterator) {
    IOObjectRelease(iAPInterfaceDeviceArrivedIterator);
  }
  io_object_t iAPInterfaceDeviceRemovedIterator = self->_iAPInterfaceDeviceRemovedIterator;
  if (iAPInterfaceDeviceRemovedIterator) {
    IOObjectRelease(iAPInterfaceDeviceRemovedIterator);
  }
  io_object_t ioAccNotification = self->_ioAccNotification;
  if (ioAccNotification)
  {
    IOObjectRelease(ioAccNotification);
    self->_io_object_t ioAccNotification = 0;
  }
  v13.receiver = self;
  v13.super_class = (Class)IAPTransportServer;
  [(IAPTransportServer *)&v13 dealloc];
}

- (void)run
{
  mkdir((const char *)&kEAPipePath, 0x1E8u);
  sub_1000175D8(1, 0);
  [(IAPTransportServer *)self bringupPlatform];
  if ((byte_100031FB1 & 1) == 0)
  {
    self->_batteryNotifyPortRef = IONotificationPortCreate(kIOMasterPortDefault);
    Main = CFRunLoopGetMain();
    RunLoopSource = IONotificationPortGetRunLoopSource(self->_batteryNotifyPortRef);
    CFRunLoopAddSource(Main, RunLoopSource, kCFRunLoopDefaultMode);
    batteryNotifyPortRef = self->_batteryNotifyPortRef;
    CFDictionaryRef v6 = IOServiceMatching("IOPMPowerSource");
    IOServiceAddMatchingNotification(batteryNotifyPortRef, "IOServiceFirstMatch", v6, (IOServiceMatchingCallback)sub_10001965C, &self->_batteryNotifyPortRef, &self->_battery_iter);
    sub_10001965C(&self->_batteryNotifyPortRef, self->_battery_iter);
    byte_100031FB1 = 1;
  }
  mach_service = xpc_connection_create_mach_service("com.apple.iaptransportd.xpc", (dispatch_queue_t)self->_internalListenerQueue, 1uLL);
  self->_listener = mach_service;
  if (mach_service)
  {
    unint64_t v21 = 0;
    uint64_t v22 = &v21;
    uint64_t v23 = 0x3052000000;
    int v24 = sub_100017CF4;
    internalListenerQueue = self->_internalListenerQueue;
    int v25 = sub_100017D04;
    v26 = internalListenerQueue;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000196F8;
    handler[3] = &unk_10002D7B8;
    handler[4] = &v21;
    xpc_connection_set_event_handler(mach_service, handler);
    xpc_connection_resume(self->_listener);
    _Block_object_dispose(&v21, 8);
  }
  else
  {
    NSLog(@"IAPTransportServer::init _listener is not valid!\n");
  }
  uint64_t v9 = dword_100031D8C;
  if (dword_100031D8C == -1)
  {
    CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"AccPowerOnDelayOnStart", @"com.apple.iaptransportd", 0);
    dword_100031D8C = AppIntegerValue;
    NSLog(@"Loaded AccPowerOnDelayOnStart=%d\n", AppIntegerValue);
    uint64_t v9 = dword_100031D8C;
  }
  if ((int)v9 < 1)
  {
    uint64_t v11 = 0;
  }
  else
  {
    NSLog(@"Override delay acc power on boot: %d -> %d\n", 0, v9);
    uint64_t v11 = dword_100031D8C;
  }
  *(void *)v27 = 0x1500000001;
  unint64_t v21 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v22 = (unint64_t *)0xAAAAAAAAAAAAAAAALL;
  size_t v19 = 16;
  if (sysctl(v27, 2u, &v21, &v19, 0, 0) != -1)
  {
    v18.tv_sec = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&v18.tv_usec = 0xAAAAAAAAAAAAAAAALL;
    gettimeofday(&v18, 0);
    if ((uint64_t)(v18.tv_sec - v21) >= 61)
    {
      NSLog(@"Not during boot, override delay acc power on boot: %d -> %d\n", v11, 1250);
      uint64_t v11 = 1250;
    }
  }
  if (qword_100031F98)
  {
    sub_100010860((void *)qword_100031F98);
    sub_100010F80(qword_100031F98);
  }
  if (qword_100031FA8)
  {
    sub_100010860((void *)qword_100031FA8);
    sub_100010F80(qword_100031FA8);
  }
  [(IAPTransportServer *)self startIOAccMgrPortDetectTimer:v11];
  self->_serverRunLoop = CFRunLoopGetCurrent();
  dword_100031FB4 = IORegisterForSystemPower(0, &self->_systemPowerNotifyPortRef, (IOServiceInterestCallback)sub_100019824, &self->_systemPowerIterator);
  if (dword_100031FB4)
  {
    serverRunLoop = self->_serverRunLoop;
    objc_super v13 = IONotificationPortGetRunLoopSource(self->_systemPowerNotifyPortRef);
    CFRunLoopAddSource(serverRunLoop, v13, kCFRunLoopCommonModes);
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"kIAPTransportServerLaunchedNotification", 0, 0, 1u);
  CFRunLoopGetMain();
  if (!IOAccessoryStartVoltageEventMonitor()) {
    sub_10001D548(1, @"Failed to start lightning receptacle voltage monitoring");
  }
  while ((*(unsigned char *)&self->serverFlags & 1) == 0)
  {
    if (CFRunLoopRunInMode(kCFRunLoopDefaultMode, 1.0e10, 1u) == kCFRunLoopRunFinished) {
      *(_DWORD *)&self->serverFlags |= 1u;
    }
  }
  self->_isShuttingDown = 1;
  [(IAPTransportServer *)self deleteAllPorts];
  shutdownQ = self->_shutdownQ;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000198FC;
  block[3] = &unk_10002D6B8;
  block[4] = self;
  dispatch_sync(shutdownQ, block);

  qword_100031F90 = 0;
}

- (void)_pollForDeathAfterPromptCompletes
{
  *(_DWORD *)&self->serverFlags |= 1u;
  CFRunLoopStop(self->_serverRunLoop);
}

- (void)stopServer:(int)a3
{
}

- (void)stopServer:(int)a3 forceExitingImmediately:(BOOL)a4
{
  __serverFlags serverFlags = self->serverFlags;
  self->__serverFlags serverFlags = (__serverFlags)(*(_DWORD *)&serverFlags | 2);
  if (a4)
  {
    self->__serverFlags serverFlags = (__serverFlags)(*(_DWORD *)&serverFlags | 3);
    CFRunLoopStop(self->_serverRunLoop);
  }
  else
  {
    [(IAPTransportServer *)self performSelectorOnMainThread:"_pollForDeathAfterPromptCompletes" withObject:0 waitUntilDone:0];
  }
}

- (id)iapPortManagerForDevPort:(IapTransport *)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = [objc_alloc((Class)NSNumber) initWithInt:sub_100007C98((uint64_t)a3)];
  if (!v4) {
    return 0;
  }
  CFTypeID v5 = v4;
  id v6 = [(NSMutableDictionary *)self->_iapPortManagers objectForKey:v4];

  return v6;
}

- (void)updatePortManagers
{
  io_iterator_t existing = -1431655766;
  CFDictionaryRef v3 = IOServiceMatching("IOAccessoryManager");
  uint64_t MatchingServices = IOServiceGetMatchingServices(kIOMasterPortDefault, v3, &existing);
  if (MatchingServices)
  {
    NSLog(@"ERROR - %s:%s - %d IOServiceGetMatchingServices failed 0x%x", "/Library/Caches/com.apple.xbs/Sources/iapd/iaptransportd/IAPTransportServer.mm", "-[IAPTransportServer updatePortManagers]", 2685, MatchingServices);
    return;
  }
  uint64_t v5 = IOIteratorNext(existing);
  if (v5)
  {
    uint64_t v6 = v5;
    do
    {
      CFTypeRef cf2 = (CFTypeRef)0xAAAAAAAAAAAAAAAALL;
      id v7 = objc_alloc_init((Class)NSMutableString);
      if (IOAccessoryManagerCopyDeviceInfo()) {
        goto LABEL_12;
      }
      if (qword_100031FD8)
      {
        if (CFEqual((CFTypeRef)qword_100031FD8, cf2))
        {
          CFRelease(cf2);
          goto LABEL_12;
        }
        CFRelease((CFTypeRef)qword_100031FD8);
        qword_100031FD8 = (uint64_t)cf2;
        NSLog(@"Interface device serial number: %@", cf2);
        CFTypeRef v8 = (CFTypeRef)qword_100031FD8;
      }
      else
      {
        NSLog(@"Interface device serial number: %@", cf2);
        CFTypeRef v8 = cf2;
        qword_100031FD8 = (uint64_t)cf2;
      }
      +[IAPEventLogger AddToStr:WithKey:AndValue:](IAPEventLogger, "AddToStr:WithKey:AndValue:", v7, @"InterfaceDeviceSerialNumber", +[NSString stringWithFormat:@"%@", v8]);
LABEL_12:
      if (IOAccessoryManagerCopyDeviceInfo()) {
        goto LABEL_19;
      }
      if (qword_100031FE0)
      {
        if (CFEqual((CFTypeRef)qword_100031FE0, cf2))
        {
          CFRelease(cf2);
          goto LABEL_19;
        }
        CFRelease((CFTypeRef)qword_100031FE0);
        qword_100031FE0 = (uint64_t)cf2;
        NSLog(@"Interface module serial number: %@", cf2);
        CFTypeRef v9 = (CFTypeRef)qword_100031FE0;
      }
      else
      {
        NSLog(@"Interface module serial number: %@", cf2);
        CFTypeRef v9 = cf2;
        qword_100031FE0 = (uint64_t)cf2;
      }
      +[IAPEventLogger AddToStr:WithKey:AndValue:](IAPEventLogger, "AddToStr:WithKey:AndValue:", v7, @"InterfaceModuleSerialNumber", +[NSString stringWithFormat:@"%@", v9]);
LABEL_19:
      if (!IOAccessoryManagerCopyDeviceInfo())
      {
        if (!qword_100031FE8)
        {
          NSLog(@"Accessory serial number: %@", cf2);
          CFTypeRef v10 = cf2;
          qword_100031FE8 = (uint64_t)cf2;
LABEL_25:
          +[IAPEventLogger AddToStr:WithKey:AndValue:](IAPEventLogger, "AddToStr:WithKey:AndValue:", v7, @"AccessorySerialNumber", +[NSString stringWithFormat:@"%@", v10]);
          goto LABEL_26;
        }
        if (!CFEqual((CFTypeRef)qword_100031FE8, cf2))
        {
          CFRelease((CFTypeRef)qword_100031FE8);
          qword_100031FE8 = (uint64_t)cf2;
          NSLog(@"Accessory serial number: %@", cf2);
          CFTypeRef v10 = (CFTypeRef)qword_100031FE8;
          goto LABEL_25;
        }
        CFRelease(cf2);
      }
LABEL_26:
      if ([v7 length]) {
        +[IAPEventLogger LogMsg:0 WithStr:v7];
      }

      if (!self->_iapPortManagers) {
        self->_iapPortManagers = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      }
      if (![(NSMutableDictionary *)self->_iapPortManagers objectForKey:+[NSNumber numberWithInt:IOAccessoryManagerGetPrimaryPort()]])
      {
        uint64_t v11 = [[IAPTransportManager alloc] initWithService:v6 andNotificationPort:self->_ioaccessoryNotifyPort];
        [(NSMutableDictionary *)self->_iapPortManagers setObject:v11 forKey:[(IAPTransportManager *)v11 portNumber]];
        NSLog(@"%s:%s - %d added PortManager=%hhx service=%d portNumber=%@", "/Library/Caches/com.apple.xbs/Sources/iapd/iaptransportd/IAPTransportServer.mm", "-[IAPTransportServer updatePortManagers]", 2704, v11, v6, [(IAPTransportManager *)v11 portNumber]);
      }
      IOObjectRelease(v6);
      uint64_t v6 = IOIteratorNext(existing);
    }
    while (v6);
  }
  IOObjectRelease(existing);
}

- (void)detachIOKitPort:(IapTransport *)a3
{
  if (a3)
  {
    id v5 = [(NSMutableDictionary *)self->_iapPortManagers objectForKey:+[NSNumber numberWithInt:sub_100007C98((uint64_t)a3)]];
    sub_10001392C((uint64_t)a3, 8, 0);
    sub_100016590(a3);
    if (v5)
    {
      if (sub_100007CA4((int)objc_msgSend(objc_msgSend(v5, "portNumber"), "intValue")))
      {
        iapPortManagers = self->_iapPortManagers;
        id v7 = [v5 portNumber];
        [(NSMutableDictionary *)iapPortManagers removeObjectForKey:v7];
      }
    }
  }
}

- (void)checkXPCConnections
{
  if (!self->_iapd_connection && +[IAPTransportServer supportsIAPD])
  {
    CFDictionaryRef v3 = [[IAPXPCConnection alloc] initWithServiceName:@"com.apple.iapd.xpc" queueName:@"com.apple.iapd.IAPXPCConnection"];
    self->_iapd_connection = v3;
    [(IAPXPCConnection *)v3 setDisconnectBlock:&stru_10002D7D8];
  }
  if (!self->_iap2d_connection)
  {
    id v4 = [[IAPXPCConnection alloc] initWithServiceName:@"com.apple.iap2d.xpc" queueName:@"com.apple.iap2d.IAPXPCConnection"];
    self->_iap2d_connection = v4;
    [(IAPXPCConnection *)v4 setDisconnectBlock:&stru_10002D7F8];
  }
}

- (void)sendValidAccResistorIDToIAPD
{
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  uint64_t v18 = 0;
  size_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  uint64_t v14 = 0;
  int v15 = &v14;
  uint64_t v16 = 0x2020000000;
  int v17 = -1;
  uint64_t v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472;
  CFTypeRef v8 = sub_10001A1C0;
  CFTypeRef v9 = &unk_10002D820;
  CFTypeRef v10 = self;
  uint64_t v11 = &v14;
  v12 = &v22;
  objc_super v13 = &v18;
  pthread_mutex_lock(&stru_100031C80);
  sub_10001A1C0((id *)&v6);
  pthread_mutex_unlock(&stru_100031C80);
  if (*((unsigned char *)v23 + 24) && v19[3])
  {
    xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
    int v3 = sub_100007C8C(v19[3]);
    xpc_dictionary_set_uint64(v2, "portNumber", v3);
    int v4 = sub_100007C98(v19[3]);
    xpc_dictionary_set_uint64(v2, "portManagerNumber", v4);
    unsigned int v5 = (*(uint64_t (**)(uint64_t))(*(void *)v19[3] + 80))(v19[3]);
    xpc_dictionary_set_uint64(v2, "portType", v5);
    xpc_dictionary_set_uint64(v2, "portID", v19[3]);
    xpc_dictionary_set_uint64(v2, "resistorID", *((int *)v15 + 6));
    xpc_dictionary_set_string(v2, "requestType", "resistorArrived");
    if (+[IAPTransportServer supportsIAPD]) {
      objc_msgSend(objc_msgSend(+[IAPTransportServer sharedIAPTransportServer](IAPTransportServer, "sharedIAPTransportServer"), "iapd_connection"), "sendMessage:", v2);
    }
    xpc_release(v2);
  }
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);
}

- (void)cleanupPhysicalConnectorConnections
{
  pthread_mutex_lock(&stru_100031C80);
  sub_10001A2D0();
  pthread_mutex_unlock(&stru_100031C80);
}

- (void)cleanupStaleClientPorts:(int)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10001A4D8;
  v3[3] = &unk_10002D6E0;
  int v4 = a3;
  void v3[4] = self;
  pthread_mutex_lock(&stru_100031C80);
  sub_10001A4D8(v3);
  pthread_mutex_unlock(&stru_100031C80);
}

- (void)preventIdleSleep:(BOOL)a3
{
  BOOL v3 = a3;
  pthread_mutex_lock(&stru_100031D90);
  if (v3)
  {
    if (!self->_hasSleepAssertion)
    {
      v5[0] = @"AssertType";
      v5[1] = @"AssertLevel";
      v6[0] = @"NoIdleSleepAssertion";
      v6[1] = &off_10002F8A8;
      v5[2] = @"AssertName";
      v5[3] = @"AllowsDeviceRestart";
      v6[2] = @"com.apple.iaptransportd.acc-connected";
      v6[3] = kCFBooleanTrue;
      if (!IOPMAssertionCreateWithProperties((CFDictionaryRef)+[NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:4], &self->_sleepAssertionId))
      {
        self->_hasSleepAssertion = 1;
        sub_10001D548(1, @"IAPTRANSPORTD HAS TAKEN A POWER ASSERTION!!!!!!!");
      }
    }
  }
  else if (self->_hasSleepAssertion)
  {
    IOPMAssertionRelease(self->_sleepAssertionId);
    self->_hasSleepAssertion = 0;
    sub_10001D548(1, @"IAPTRANSPORTD HAS RELEASED A POWER ASSERTION!!!!!!!");
  }
  pthread_mutex_unlock(&stru_100031D90);
}

- (void)updateDeviceUUIDState
{
  if (!self->_iapdPortListContainsItems && !self->_iap2dPortListContainsItems)
  {
    v6.tv_sec = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&v6.tv_usec = 0xAAAAAAAAAAAAAAAALL;
    gettimeofday(&v6, 0);
    uint64_t v4 = 0;
    __darwin_time_t deviceUUIDTimestampMs = 1000 * v6.tv_sec + v6.tv_usec / 1000;
    self->___darwin_time_t deviceUUIDTimestampMs = deviceUUIDTimestampMs;
    self->_previousPortListDidContainItems = 0;
    deviceUUIDStr = self->_deviceUUIDStr;
    goto LABEL_10;
  }
  if (!self->_deviceUUIDStr) {
    goto LABEL_8;
  }
  v6.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&v6.tv_usec = 0xAAAAAAAAAAAAAAAALL;
  gettimeofday(&v6, 0);
  if (!self->_previousPortListDidContainItems
    && 1000 * v6.tv_sec - self->_deviceUUIDTimestampMs + v6.tv_usec / 1000 >= 0x493E1)
  {

    self->_deviceUUIDStr = 0;
LABEL_8:
    deviceUUIDStr = [+[NSUUID UUID] UUIDString];
    self->_deviceUUIDStr = deviceUUIDStr;
    goto LABEL_9;
  }
  deviceUUIDStr = self->_deviceUUIDStr;
  if (!deviceUUIDStr) {
    goto LABEL_8;
  }
LABEL_9:
  uint64_t v4 = 1;
  self->_previousPortListDidContainItems = 1;
  __darwin_time_t deviceUUIDTimestampMs = self->_deviceUUIDTimestampMs;
LABEL_10:
  sub_10001D548(1, @"updateDeviceUUIDState: _iapdPortListContainsItems: %d, _iap2dPortListContainsItems: %d, _deviceUUIDStr: %@, _deviceUUIDTimestampMs: %llu, _previousPortListDidContainItems: %d", self->_iapdPortListContainsItems, self->_iap2dPortListContainsItems, deviceUUIDStr, deviceUUIDTimestampMs, v4);
}

- (void)updateSleepAssertionState
{
  sub_10001D548(1, @"_iapdPortListContainsItems: %d, _iap2dPortListContainsItems: %d, __isOnAC: %d", self->_iapdPortListContainsItems, self->_iap2dPortListContainsItems, byte_100031FB8);
  BOOL v3 = *(_WORD *)&self->_iapdPortListContainsItems && byte_100031FB8;
  [(IAPTransportServer *)self preventIdleSleep:v3];
}

- (void)pIapPortAppleIDBusRootE75
{
  return (void *)qword_100031F98;
}

- (void)pIapPortAppleIDBusRootCON
{
  return (void *)qword_100031FA8;
}

- (void)registerClientPortAccessory:(id)a3 connection:(id)a4
{
  if (byte_100031FB0 == 1)
  {
    if (a3)
    {
      uint64_t v7 = _NSConcreteStackBlock;
      uint64_t v8 = 3221225472;
      CFTypeRef v9 = sub_10001A98C;
      CFTypeRef v10 = &unk_10002D848;
      id v11 = a3;
      v12 = self;
      pthread_mutex_lock(&stru_100031C80);
      sub_10001A98C(&v7);
      pthread_mutex_unlock(&stru_100031C80);
      -[IAPTransportServer createNewClientPort:connection:](self, "createNewClientPort:connection:", a3, a4, v7, v8);
    }
    else
    {
      NSLog(@"registerClientPortAccessory bad params", a2, 0, a4);
    }
  }
}

- (void)unregisterClientPortAccessory:(id)a3
{
  if (byte_100031FB0 == 1)
  {
    if (a3)
    {
      v3[0] = _NSConcreteStackBlock;
      v3[1] = 3221225472;
      v3[2] = sub_10001AAF4;
      v3[3] = &unk_10002D848;
      void v3[4] = a3;
      void v3[5] = self;
      pthread_mutex_lock(&stru_100031C80);
      sub_10001AAF4(v3);
      pthread_mutex_unlock(&stru_100031C80);
    }
    else
    {
      NSLog(@"unregisterClientPortAccessory bad params", a2);
    }
  }
}

- (void)deleteClientPortsUsingConnection:(id)a3
{
  if (byte_100031FB0 == 1)
  {
    if (a3)
    {
      v3[0] = _NSConcreteStackBlock;
      v3[1] = 3221225472;
      v3[2] = sub_10001AC5C;
      v3[3] = &unk_10002D848;
      void v3[4] = a3;
      void v3[5] = self;
      pthread_mutex_lock(&stru_100031C80);
      sub_10001AC5C((id *)v3);
      pthread_mutex_unlock(&stru_100031C80);
    }
    else
    {
      NSLog(@"deleteClientPortsUsingConnection bad params", a2);
    }
  }
}

- (void)clientPortReceivedData:(id)a3 dataPtr:(char *)a4 length:(unsigned __int16)a5
{
  if (byte_100031FB0 == 1)
  {
    if (a3 && a4 && a5)
    {
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_10001ADB4;
      v5[3] = &unk_10002D870;
      void v5[4] = a3;
      v5[5] = a4;
      unsigned __int16 v6 = a5;
      pthread_mutex_lock(&stru_100031C80);
      sub_10001ADB4((uint64_t)v5);
      pthread_mutex_unlock(&stru_100031C80);
    }
    else
    {
      NSLog(@"clientPortReceivedData bad params", a2);
    }
  }
}

- (BOOL)createNewClientPort:(id)a3 connection:(id)a4
{
  uint64_t v4 = sub_100009598((uint64_t)a3, (uint64_t)a4);
  uint64_t v5 = v4;
  if (v4) {
    sub_100016500(v4);
  }
  return v5 != 0;
}

- (void)setHasAdaptor:(BOOL)a3
{
  byte_100031F80 = 1;
  sub_1000089B0(1);
  notify_set_state(dword_100031F84, byte_100031F80);
  notify_post("com.apple.iapd.adaptor.AvailableChanged");
}

- (void)deleteAllPorts
{
  if (byte_100031FB0 == 1) {
    [(IAPTransportServer *)self cleanupStaleClientPorts:3];
  }
  sub_10001AF80();
  [(IAPTransportServer *)self deleteWiredPorts];
  if (qword_100031F98)
  {
    sub_10000AD6C(qword_100031F98);
    qword_100031F98 = 0;
  }
  if (qword_100031FA8)
  {
    sub_10000AD6C(qword_100031FA8);
    qword_100031FA8 = 0;
  }
}

- (void)_detachClientPort:(IapTransport *)a3
{
  if (a3)
  {
    nullsub_15(a3, 8, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001B0AC;
    block[3] = &unk_10002CA98;
    block[4] = a3;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)bringupPlatform
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)sub_10001B190, @"SBSpringBoardDidLaunchNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)sub_10001B1A4, @"AppleLanguagePreferencesChangedNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  dword_100031F84 = 0;
  if (!notify_register_check("com.apple.iapd.adaptor.AvailableChanged", &dword_100031F84))
  {
    uint64_t state64 = 0;
    notify_get_state(dword_100031F84, &state64);
    if (state64)
    {
      notify_set_state(dword_100031F84, 0);
      notify_post("com.apple.iapd.adaptor.AvailableChanged");
    }
  }
  notify_post("com.apple.iapd.adaptor.AvailableChanged");
}

- (void)bringdownPlatform
{
  if (self->_listener)
  {
    dispatch_sync((dispatch_queue_t)self->_internalListenerQueue, &stru_10002D890);
    xpc_connection_cancel(self->_listener);
    xpc_release(self->_listener);
    self->_listener = 0;
  }
  if (+[IAPTransportServer supportsIAPD])
  {
    [(IAPXPCConnection *)self->_iapd_connection setDisconnectBlock:0];

    self->_iapd_connection = 0;
  }
  [(IAPXPCConnection *)self->_iap2d_connection setDisconnectBlock:0];

  self->_iap2d_connection = 0;
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, kIAPTransportServerDiedNotification, 0, 0, 1u);
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, 0, @"SBSpringBoardDidLaunchNotification", 0);
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, 0, @"AppleLanguagePreferencesChangedNotification", 0);
  [(IAPWorkspaceObserver *)self->_workspaceObserver stopObserving];
  Main = CFRunLoopGetMain();
  RunLoopSource = IONotificationPortGetRunLoopSource(self->_ioaccessoryNotifyPort);
  CFRunLoopRemoveSource(Main, RunLoopSource, kCFRunLoopDefaultMode);
  IONotificationPortDestroy(self->_ioaccessoryNotifyPort);
  unsigned __int16 v6 = CFRunLoopGetMain();
  uint64_t v7 = IONotificationPortGetRunLoopSource(self->_iapInterfaceNotifyPort);
  CFRunLoopRemoveSource(v6, v7, kCFRunLoopDefaultMode);
  IONotificationPortDestroy(self->_iapInterfaceNotifyPort);
  if (byte_100031FB1 == 1)
  {
    uint64_t v8 = CFRunLoopGetMain();
    CFTypeRef v9 = IONotificationPortGetRunLoopSource(self->_batteryNotifyPortRef);
    CFRunLoopRemoveSource(v8, v9, kCFRunLoopDefaultMode);
    IONotificationPortDestroy(self->_batteryNotifyPortRef);
  }
  if (self->_systemPowerIterator) {
    IODeregisterForSystemPower(&self->_systemPowerIterator);
  }
  if (dword_100031FB4)
  {
    serverRunLoop = self->_serverRunLoop;
    id v11 = IONotificationPortGetRunLoopSource(self->_systemPowerNotifyPortRef);
    CFRunLoopRemoveSource(serverRunLoop, v11, kCFRunLoopCommonModes);
    IONotificationPortDestroy(self->_systemPowerNotifyPortRef);
    IOServiceClose(dword_100031FB4);
  }
  [(IAPTransportServer *)self detachPowerModeNotifications];
  sub_1000175D8(1, 0);
  if (!notify_register_check("com.apple.iaptransportd.notify.availability", &dword_100031D88))
  {
    uint64_t state64 = 0;
    notify_get_state(dword_100031D88, &state64);
    if (state64 == 1)
    {
      notify_set_state(dword_100031D88, 0);
      notify_post("com.apple.iaptransportd.notify.availability");
    }
  }
}

- (void)_updatePlistWithApplicationUninstall:(id)a3
{
  CFPropertyListRef v4 = CFPreferencesCopyAppValue(@"OptionalSDKProtocolsShownKey", @"com.apple.iapd");
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    id v6 = [objc_alloc((Class)NSMutableArray) initWithArray:v4];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v20 = [a3 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v20)
    {
      id obj = a3;
      char v7 = 0;
      uint64_t v19 = *(void *)v27;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v27 != v19) {
            objc_enumerationMutation(obj);
          }
          uint64_t v21 = v8;
          id v9 = [*(id *)(*((void *)&v26 + 1) + 8 * v8) externalAccessoryProtocols];
          long long v22 = 0u;
          long long v23 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          id v10 = [v9 countByEnumeratingWithState:&v22 objects:v30 count:16];
          if (v10)
          {
            id v11 = v10;
            uint64_t v12 = *(void *)v23;
            do
            {
              for (i = 0; i != v11; i = (char *)i + 1)
              {
                if (*(void *)v23 != v12) {
                  objc_enumerationMutation(v9);
                }
                uint64_t v14 = *(void **)(*((void *)&v22 + 1) + 8 * i);
                int v15 = (uint64_t (*)(void *))sub_10000519C("SBSCopyDisplayIdentifiersForExternalAccessoryProtocol", (const void *)2);
                uint64_t v16 = (void *)v15(v14);
                int v17 = v16;
                if (v16
                  && ![v16 count]
                  && objc_msgSend(v5, "containsObject:", objc_msgSend(v14, "lowercaseString"))
                  && objc_msgSend(v6, "containsObject:", objc_msgSend(v14, "lowercaseString")))
                {
                  objc_msgSend(v6, "removeObject:", objc_msgSend(v14, "lowercaseString"));
                  NSLog(@"Removing protocol %@ from protocols list", [v14 lowercaseString]);
                  char v7 = 1;
                }
              }
              id v11 = [v9 countByEnumeratingWithState:&v22 objects:v30 count:16];
            }
            while (v11);
          }
          uint64_t v8 = v21 + 1;
        }
        while ((id)(v21 + 1) != v20);
        id v20 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v20);
      if ((v7 & (v6 != 0)) == 1)
      {
        CFPreferencesSetAppValue(@"OptionalSDKProtocolsShownKey", v6, @"com.apple.iapd");
        CFPreferencesSynchronize(@"com.apple.iapd", kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
      }
    }
    CFRelease(v5);
  }
}

- (void)applicationsWillUninstall:(id)a3
{
}

- (void)applicationsDidUninstall:(id)a3
{
}

- (void)toggleAccessoryPowerForPortService:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  NSLog(@"%s:%d Turning Acc Power off for portService: %u", a2, "-[IAPTransportServer toggleAccessoryPowerForPortService:]", 3354, a3);
  sub_100016268(v3, 1);
  [(IAPTransportServer *)self startAccPowerTimer:1250 ForPortService:v3];
}

- (IONotificationPort)ioaccessoryNotifyPort
{
  return self->_ioaccessoryNotifyPort;
}

- (NSMutableDictionary)iapPortManagers
{
  return self->_iapPortManagers;
}

- (IAPXPCConnection)iapd_connection
{
  return self->_iapd_connection;
}

- (void)setIapd_connection:(id)a3
{
  self->_iapd_connection = (IAPXPCConnection *)a3;
}

- (IAPXPCConnection)iap2d_connection
{
  return self->_iap2d_connection;
}

- (void)setIap2d_connection:(id)a3
{
  self->_iap2d_connection = (IAPXPCConnection *)a3;
}

- (BOOL)iapdPortListContainsItems
{
  return self->_iapdPortListContainsItems;
}

- (void)setIapdPortListContainsItems:(BOOL)a3
{
  self->_iapdPortListContainsItems = a3;
}

- (BOOL)iap2dPortListContainsItems
{
  return self->_iap2dPortListContainsItems;
}

- (void)setIap2dPortListContainsItems:(BOOL)a3
{
  self->_iap2dPortListContainsItems = a3;
}

- (int)iDeviceClass
{
  return self->_iDeviceClass;
}

- (BOOL)bOSInternalBuild
{
  return self->_bOSInternalBuild;
}

- (BOOL)bHasConnectionE75
{
  return self->_bHasConnectionE75;
}

- (BOOL)bHasConnectionCON
{
  return self->_bHasConnectionCON;
}

- (unsigned)ioAccPortID
{
  return self->_ioAccPortID;
}

- (void)setIoAccPortID:(unsigned __int8)a3
{
  self->_ioAccPortID = a3;
}

- (BOOL)isShuttingDown
{
  return self->_isShuttingDown;
}

- (void)setIsShuttingDown:(BOOL)a3
{
  self->_isShuttingDown = a3;
}

- (NSString)deviceUUIDStr
{
  return self->_deviceUUIDStr;
}

- (OS_dispatch_queue)shutdownQ
{
  return self->_shutdownQ;
}

- (OS_dispatch_queue)iaptransportdhighPriorityRootQueue
{
  return self->_iaptransportdhighPriorityRootQueue;
}

- (unsigned)iap9PinUSBConnState
{
  return self->_iap9PinUSBConnState;
}

- (void)setIap9PinUSBConnState:(unsigned __int8)a3
{
  self->_iap9PinUSBConnState = a3;
}

- (unsigned)ioAccNotification
{
  return self->_ioAccNotification;
}

- (void)setIoAccNotification:(unsigned int)a3
{
  self->_io_object_t ioAccNotification = a3;
}

@end