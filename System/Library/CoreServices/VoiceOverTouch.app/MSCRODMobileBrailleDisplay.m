@interface MSCRODMobileBrailleDisplay
+ (id)_displayWithIOElement:(id)a3 driverIdentifier:(id)a4 modelIdentifier:(id)a5 mainSize:(id)a6 statusSize:(id)a7 inputMode:(id)a8 delegate:(id)a9 reconnectionEnabled:(BOOL)a10;
+ (id)displayWithIOElement:(id)a3 cachedInfo:(id)a4 delegate:(id)a5 reconnectionEnabled:(BOOL)a6;
+ (id)displayWithIOElement:(id)a3 driverIdentifier:(id)a4 delegate:(id)a5;
+ (id)displayWithIOElement:(id)a3 driverIdentifier:(id)a4 delegate:(id)a5 reconnectionEnabled:(BOOL)a6;
- (BOOL)isBluetoothHID;
- (BOOL)isEqual:(id)a3;
- (BOOL)requiresPersistentConnection;
- (id)_initWithDriver:(id)a3 driverIdentifier:(id)a4 ioElement:(id)a5 delegate:(id)a6;
- (id)_initWithDriver:(id)a3 driverIdentifier:(id)a4 modelIdentifier:(id)a5 ioElement:(id)a6 mainSize:(int64_t)a7 statusSize:(int64_t)a8 inputMode:(int)a9 delegate:(id)a10 reconnectionEnabled:(BOOL)a11;
- (id)bluetoothAddress;
- (id)configuration;
- (id)description;
- (void)_delayedAddDeviceNotification:(id)a3;
- (void)_delayedDeviceUpdatedNotification:(id)a3;
- (void)_delayedDisplayLoad;
- (void)_delayedRemoveDeviceNotification:(id)a3;
- (void)_enableReconnectionTimer:(BOOL)a3;
- (void)_processDeviceConnectionCallback:(int)a3 brailleDriver:(id)a4 ioElement:(id)a5;
- (void)_processInitialDeviceConnectionCallback:(int)a3 device:(id)a4 brailleDriver:(id)a5 ioElement:(id)a6;
- (void)_reconnectionEventHandler;
- (void)_reconnectionTriggeredHandler;
- (void)_reloadDriver;
- (void)_resetReconnectionTimer;
- (void)_runThread;
- (void)_setupDriverSupport;
- (void)_startWatchingForDevices;
- (void)_stopWatchingForDevices;
- (void)_unloadHandler;
- (void)addDeviceFailedNotification:(id)a3;
- (void)addDeviceNotification:(id)a3;
- (void)connectionStatusChanged:(id)a3;
- (void)dealloc;
- (void)deviceUpdatedNotification:(id)a3;
- (void)invalidate;
- (void)removeDeviceNotification:(id)a3;
- (void)sleep;
- (void)unsleep;
@end

@implementation MSCRODMobileBrailleDisplay

+ (id)displayWithIOElement:(id)a3 driverIdentifier:(id)a4 delegate:(id)a5
{
  LOBYTE(v6) = 1;
  return +[MSCRODMobileBrailleDisplay _displayWithIOElement:a3 driverIdentifier:a4 modelIdentifier:0 mainSize:0 statusSize:0 inputMode:0 delegate:a5 reconnectionEnabled:v6];
}

+ (id)displayWithIOElement:(id)a3 driverIdentifier:(id)a4 delegate:(id)a5 reconnectionEnabled:(BOOL)a6
{
  LOBYTE(v7) = a6;
  return +[MSCRODMobileBrailleDisplay _displayWithIOElement:a3 driverIdentifier:a4 modelIdentifier:0 mainSize:0 statusSize:0 inputMode:0 delegate:a5 reconnectionEnabled:v7];
}

+ (id)displayWithIOElement:(id)a3 cachedInfo:(id)a4 delegate:(id)a5 reconnectionEnabled:(BOOL)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  objc_opt_class();
  v12 = [v10 objectForKey:kSCROBrailleDisplayDriverIdentifier];
  if (objc_opt_isKindOfClass())
  {
    v13 = [v10 objectForKey:kSCROBrailleDisplayModelIdentifier];
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      v13 = 0;
    }
    objc_opt_class();
    v14 = [v10 objectForKey:kSCROBrailleDisplayMainSize];
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      v14 = 0;
    }
    v15 = [v10 objectForKey:kSCROBrailleDisplayStatusSize];
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      v15 = 0;
    }
    v16 = [v10 objectForKey:kSCROBrailleDisplayBrailleInputMode];
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      v16 = 0;
    }
    LOBYTE(v19) = a6;
    v17 = +[MSCRODMobileBrailleDisplay _displayWithIOElement:v9 driverIdentifier:v12 modelIdentifier:v13 mainSize:v14 statusSize:v15 inputMode:v16 delegate:v11 reconnectionEnabled:v19];
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

+ (id)_displayWithIOElement:(id)a3 driverIdentifier:(id)a4 modelIdentifier:(id)a5 mainSize:(id)a6 statusSize:(id)a7 inputMode:(id)a8 delegate:(id)a9 reconnectionEnabled:(BOOL)a10
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = 0;
  if (v15 && v16)
  {
    if (![v15 conformsToProtocol:&OBJC_PROTOCOL___SCROIOBluetoothElementProtocol])
    {
      id v22 = 0;
      goto LABEL_40;
    }
    v23 = +[NSBundle brailleDriverBundleWithIdentifier:v16];
    v55 = v23;
    if (v23)
    {
      v24 = (objc_class *)[v23 principalClass];
      if (+[SCROBrailleDisplay brailleDriverClassIsValid:v24])
      {
        id v53 = v17;
        v25 = [objc_allocWithZone(v24) init];
        v26 = v25;
        if (v25)
        {
          if ([v25 interfaceVersion] == (id)4)
          {
            id v51 = objc_allocWithZone((Class)objc_opt_class());
            id v27 = [v18 integerValue];
            id v28 = [v19 integerValue];
            LOBYTE(v49) = a10;
            LODWORD(v48) = [v20 integerValue];
            id v22 = [v51 _initWithDriver:v26 driverIdentifier:v16 modelIdentifier:v53 ioElement:v15 mainSize:v27 statusSize:v28 inputMode:v48 delegate:v21 reconnectionEnabled:v49];
            v29 = AXLogBrailleHW();
            v30 = v26;
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v57 = v22;
              _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Making display: %@", buf, 0xCu);
            }

            if (v22) {
              [v22 performSelector:"_delayedDisplayLoad" withObject:0 afterDelay:0.0];
            }
            goto LABEL_30;
          }
          v44 = +[AXSubsystemBrailleHardware sharedInstance];
          unsigned __int8 v45 = [v44 ignoreLogging];

          if (v45)
          {
LABEL_29:
            id v22 = 0;
            v30 = v26;
LABEL_30:
            id v17 = v53;
LABEL_38:

            goto LABEL_39;
          }
          v46 = +[AXSubsystemBrailleHardware identifier];
          v42 = AXLoggerForFacility();

          os_log_type_t v43 = AXOSLogLevelFromAXLogLevel();
          v30 = v26;
          id v17 = v53;
          if (!os_log_type_enabled(v42, v43)) {
            goto LABEL_36;
          }
          v50 = AXColorizeFormatLog();
          v52 = _AXStringForArgs();
          if (!os_log_type_enabled(v42, v43)) {
            goto LABEL_35;
          }
          *(_DWORD *)buf = 138543362;
          id v57 = v52;
        }
        else
        {
          v39 = +[AXSubsystemBrailleHardware sharedInstance];
          unsigned __int8 v40 = [v39 ignoreLogging];

          if (v40) {
            goto LABEL_29;
          }
          v41 = +[AXSubsystemBrailleHardware identifier];
          v42 = AXLoggerForFacility();

          os_log_type_t v43 = AXOSLogLevelFromAXLogLevel();
          v30 = 0;
          id v17 = v53;
          if (!os_log_type_enabled(v42, v43)) {
            goto LABEL_36;
          }
          v50 = AXColorizeFormatLog();
          v52 = _AXStringForArgs();
          if (!os_log_type_enabled(v42, v43))
          {
LABEL_35:

LABEL_36:
            goto LABEL_37;
          }
          *(_DWORD *)buf = 138543362;
          id v57 = v52;
        }
        _os_log_impl((void *)&_mh_execute_header, v42, v43, "%{public}@", buf, 0xCu);
        goto LABEL_35;
      }
      v36 = +[AXSubsystemBrailleHardware sharedInstance];
      unsigned __int8 v37 = [v36 ignoreLogging];

      if (v37)
      {
LABEL_18:
        id v22 = 0;
LABEL_39:

        goto LABEL_40;
      }
      v38 = +[AXSubsystemBrailleHardware identifier];
      v30 = AXLoggerForFacility();

      os_log_type_t v34 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v30, v34))
      {
        v54 = AXColorizeFormatLog();
        v35 = _AXStringForArgs();
        if (os_log_type_enabled(v30, v34))
        {
          *(_DWORD *)buf = 138543362;
          id v57 = v35;
          goto LABEL_22;
        }
        goto LABEL_23;
      }
    }
    else
    {
      v31 = +[AXSubsystemBrailleHardware sharedInstance];
      unsigned __int8 v32 = [v31 ignoreLogging];

      if (v32) {
        goto LABEL_18;
      }
      v33 = +[AXSubsystemBrailleHardware identifier];
      v30 = AXLoggerForFacility();

      os_log_type_t v34 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v30, v34))
      {
        v54 = AXColorizeFormatLog();
        v35 = _AXStringForArgs();
        if (os_log_type_enabled(v30, v34))
        {
          *(_DWORD *)buf = 138543362;
          id v57 = v35;
LABEL_22:
          _os_log_impl((void *)&_mh_execute_header, v30, v34, "%{public}@", buf, 0xCu);
        }
LABEL_23:
      }
    }
LABEL_37:
    id v22 = 0;
    goto LABEL_38;
  }
LABEL_40:

  return v22;
}

- (id)_initWithDriver:(id)a3 driverIdentifier:(id)a4 ioElement:(id)a5 delegate:(id)a6
{
  LOBYTE(v8) = 1;
  LODWORD(v7) = 0;
  return [(MSCRODMobileBrailleDisplay *)self _initWithDriver:a3 driverIdentifier:a4 modelIdentifier:0 ioElement:a5 mainSize:0 statusSize:0 inputMode:v7 delegate:a6 reconnectionEnabled:v8];
}

- (id)_initWithDriver:(id)a3 driverIdentifier:(id)a4 modelIdentifier:(id)a5 ioElement:(id)a6 mainSize:(int64_t)a7 statusSize:(int64_t)a8 inputMode:(int)a9 delegate:(id)a10 reconnectionEnabled:(BOOL)a11
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  v24.receiver = self;
  v24.super_class = (Class)MSCRODMobileBrailleDisplay;
  id v20 = [(MSCRODMobileBrailleDisplay *)&v24 _initWithDriver:v17 driverIdentifier:v18 ioElement:a6 delegate:a10];
  id v21 = AXLogBrailleHW();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v26 = v17;
    __int16 v27 = 2112;
    id v28 = v18;
    __int16 v29 = 2048;
    v30 = v20;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "_initWithDriver call with driver: %@, driverIdentifier: %@, display: %p", buf, 0x20u);
  }

  if (v20)
  {
    v20[232] = a11;
    objc_storeStrong((id *)&v20[OBJC_IVAR___SCROBrailleDisplay__driverModelIdentifier], a5);
    *(void *)&v20[OBJC_IVAR___SCROBrailleDisplay__mainSize] = a7;
    *(void *)&v20[OBJC_IVAR___SCROBrailleDisplay__statusSize] = a8;
    *(_DWORD *)&v20[OBJC_IVAR___SCROBrailleDisplay__brailleInputMode] = a9;
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v20, (CFNotificationCallback)sub_100008DC8, kAXSVoiceOverTouchBrailleReconnectionTriggeredNotification, 0, (CFNotificationSuspensionBehavior)1028);
  }

  return v20;
}

- (void)dealloc
{
  [(MSCRODMobileBrailleDisplay *)self _enableReconnectionTimer:0];
  v3.receiver = self;
  v3.super_class = (Class)MSCRODMobileBrailleDisplay;
  [(MSCRODMobileBrailleDisplay *)&v3 dealloc];
}

- (void)_delayedDisplayLoad
{
  if (!self->_startedThread)
  {
    [(MSCRODMobileBrailleDisplay *)self performSelectorOnMainThread:"_runThread" withObject:0 waitUntilDone:0];
    self->_startedThread = 1;
  }
}

- (void)sleep
{
  uint64_t v3 = OBJC_IVAR___SCROBrailleDisplay__runLoop;
  v4 = *(__CFRunLoop **)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__runLoop];
  if (v4)
  {
    CFRunLoopRemoveTimer(v4, *(CFRunLoopTimerRef *)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__inputEventTimer], kCFRunLoopDefaultMode);
    CFRunLoopRemoveTimer(*(CFRunLoopRef *)&self->SCROBrailleDisplay_opaque[v3], *(CFRunLoopTimerRef *)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__blinkerEventTimer], kCFRunLoopDefaultMode);
  }
  if (self->_isReconnectionEnabled)
  {
    [(MSCRODMobileBrailleDisplay *)self _enableReconnectionTimer:0];
  }
}

- (void)unsleep
{
  uint64_t v3 = OBJC_IVAR___SCROBrailleDisplay__runLoop;
  v4 = *(__CFRunLoop **)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__runLoop];
  if (v4)
  {
    v5 = *(__CFRunLoopTimer **)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__inputEventTimer];
    if (v5) {
      CFRunLoopAddTimer(v4, v5, kCFRunLoopDefaultMode);
    }
    uint64_t v6 = *(__CFRunLoopTimer **)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__blinkerEventTimer];
    if (v6) {
      CFRunLoopAddTimer(*(CFRunLoopRef *)&self->SCROBrailleDisplay_opaque[v3], v6, kCFRunLoopDefaultMode);
    }
  }
  if (self->_isReconnectionEnabled)
  {
    [(MSCRODMobileBrailleDisplay *)self _enableReconnectionTimer:1];
  }
}

- (void)invalidate
{
  uint64_t v3 = AXLogBrailleHW();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138543362;
    id v16 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Invalidating braille display [%{public}@]", (uint8_t *)&v15, 0xCu);
  }

  v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  [*(id *)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__eventDispatcher] invalidate];
  uint64_t v6 = OBJC_IVAR___SCROBrailleDisplay__contentLock;
  [*(id *)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__contentLock] lock];
  self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__isValid] = 0;
  [(MSCRODMobileBrailleDisplay *)self _stopWatchingForDevices];
  uint64_t v7 = OBJC_IVAR___SCROBrailleDisplay__inputEventTimer;
  uint64_t v8 = *(__CFRunLoopTimer **)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__inputEventTimer];
  if (v8)
  {
    CFRunLoopTimerInvalidate(v8);
    CFRelease(*(CFTypeRef *)&self->SCROBrailleDisplay_opaque[v7]);
    *(void *)&self->SCROBrailleDisplay_opaque[v7] = 0;
  }
  uint64_t v9 = OBJC_IVAR___SCROBrailleDisplay__blinkerEventTimer;
  id v10 = *(__CFRunLoopTimer **)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__blinkerEventTimer];
  if (v10)
  {
    CFRunLoopTimerInvalidate(v10);
    CFRelease(*(CFTypeRef *)&self->SCROBrailleDisplay_opaque[v9]);
    *(void *)&self->SCROBrailleDisplay_opaque[v9] = 0;
  }
  id v11 = *(void **)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__brailleLine];
  *(void *)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__brailleLine] = 0;

  uint64_t v12 = OBJC_IVAR___SCROBrailleDisplay__brailleDriver;
  [*(id *)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__brailleDriver] unloadDriver];
  v13 = *(void **)&self->SCROBrailleDisplay_opaque[v12];
  *(void *)&self->SCROBrailleDisplay_opaque[v12] = 0;

  v14 = AXLogBrailleHW();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 134217984;
    id v16 = self;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "_brailleDriver set to nil in invalidate for Display %p", (uint8_t *)&v15, 0xCu);
  }

  [*(id *)&self->SCROBrailleDisplay_opaque[v6] unlock];
}

- (void)_runThread
{
  uint64_t v3 = OBJC_IVAR___SCROBrailleDisplay__brailleDriver;
  if (!*(void *)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__brailleDriver])
  {
    v4 = AXLogBrailleHW();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v42 = self;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "_brailleDriver == nil in _runThread for %p", buf, 0xCu);
    }
  }
  v5 = AXLogBrailleHW();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v42 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Starting thread for: %@", buf, 0xCu);
  }

  [(MSCRODMobileBrailleDisplay *)self _startWatchingForDevices];
  uint64_t v7 = OBJC_IVAR___SCROBrailleDisplay__contentLock;
  [*(id *)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__contentLock] lock];
  if (self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__isValid])
  {
    id v8 = *(id *)&self->SCROBrailleDisplay_opaque[v3];
    id v9 = *(id *)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__ioElement];
    [*(id *)&self->SCROBrailleDisplay_opaque[v7] unlock];
    BOOL v10 = ![(MSCRODMobileBrailleDisplay *)self isBluetoothHID]
       && [v9 conformsToProtocol:&OBJC_PROTOCOL___SCROIOHIDElementProtocol]
       && [v9 hidDevice] != 0;
    id v11 = AXLogBrailleHW();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = +[NSNumber numberWithBool:v10];
      v13 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v9 transport]);
      *(_DWORD *)buf = 138412802;
      v42 = self;
      __int16 v43 = 2112;
      v44 = v12;
      __int16 v45 = 2112;
      v46 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Starting connection for %@ -> isHID: %@, transport: %@", buf, 0x20u);
    }
    self->_isDriverLoading = 1;
    v14 = [v9 bluetoothAddress];
    sub_1000097E4(v14);
    int v15 = (MSCRODMobileBrailleDisplay *)objc_claimAutoreleasedReturnValue();

    id v16 = AXLogBrailleHW();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v42 = v15;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "_isDriverLoading set to YES in _runThread - device: %@", buf, 0xCu);
    }

    if (!v15 || ([(MSCRODMobileBrailleDisplay *)v15 connected] & 1) != 0) {
      goto LABEL_30;
    }
    BOOL v31 = v10;
    unsigned __int8 v32 = v8;
    id v17 = [(MSCRODMobileBrailleDisplay *)v15 address];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v18 = +[BluetoothManager sharedInstance];
    id v19 = [v18 connectingDevices];

    id v20 = [v19 countByEnumeratingWithState:&v37 objects:buf count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v38;
      while (2)
      {
        for (i = 0; i != v21; i = (char *)i + 1)
        {
          if (*(void *)v38 != v22) {
            objc_enumerationMutation(v19);
          }
          objc_super v24 = [*(id *)(*((void *)&v37 + 1) + 8 * i) address];
          unsigned int v25 = [v17 isEqualToString:v24];

          if (v25)
          {

            id v8 = v32;
            goto LABEL_30;
          }
        }
        id v21 = [v19 countByEnumeratingWithState:&v37 objects:buf count:16];
        if (v21) {
          continue;
        }
        break;
      }
    }

    id v8 = v32;
    if (v31)
    {
LABEL_30:
      [(MSCRODMobileBrailleDisplay *)self _processInitialDeviceConnectionCallback:0 device:v15 brailleDriver:v8 ioElement:v9];
    }
    else
    {
      id v26 = +[MSCRODBrailleConnectionHelper sharedHelper];
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_100009948;
      v33[3] = &unk_100014900;
      v33[4] = self;
      os_log_type_t v34 = v15;
      id v35 = v32;
      id v36 = v9;
      id v27 = v9;
      id v28 = v32;
      __int16 v29 = v15;
      [v26 queueDeviceConnection:v29 withCallback:v33];
    }
  }
  else
  {
    [*(id *)&self->SCROBrailleDisplay_opaque[v7] unlock];
    [(MSCRODMobileBrailleDisplay *)self _stopWatchingForDevices];
  }
}

- (void)_processInitialDeviceConnectionCallback:(int)a3 device:(id)a4 brailleDriver:(id)a5 ioElement:(id)a6
{
  v50 = (MSCRODMobileBrailleDisplay *)a4;
  id v9 = (MSCRODMobileBrailleDisplay *)a5;
  id v10 = a6;
  if (!v9)
  {
    id v11 = AXLogBrailleHW();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v52 = self;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "brailleDriver == nil in _processInitialDeviceConnectionCallback for %p", buf, 0xCu);
    }
  }
  BOOL v48 = ![(MSCRODMobileBrailleDisplay *)self isBluetoothHID]
     && [v10 conformsToProtocol:&OBJC_PROTOCOL___SCROIOHIDElementProtocol]
     && [v10 hidDevice] != 0;
  uint64_t v12 = AXLogBrailleHW();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = +[NSNumber numberWithInt:a3];
    v14 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v10 transport]);
    int v15 = +[NSNumber numberWithBool:v48];
    *(_DWORD *)buf = 138544130;
    v52 = v50;
    __int16 v53 = 2112;
    v54 = v13;
    __int16 v55 = 2112;
    v56 = v14;
    __int16 v57 = 2112;
    v58 = v15;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Initial device connection callback [%{public}@] (BTResult:%@) Transport: %@, isHID: %@", buf, 0x2Au);
  }
  unsigned int v49 = [(MSCRODMobileBrailleDisplay *)v9 loadDriverWithIOElement:v10];
  if (v9) {
    BOOL v16 = v49 == 0;
  }
  else {
    BOOL v16 = 0;
  }
  uint64_t v17 = v16;
  id v18 = AXLogBrailleHW();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    id v19 = +[NSNumber numberWithBool:v17];
    *(_DWORD *)buf = 138412290;
    v52 = v19;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Braille driver load succeeded: %@ in processInitiaDeviceConnectionCallback", buf, 0xCu);
  }
  self->_isDriverLoading = 0;
  self->_isDriverLoaded = 0;
  id v20 = AXLogBrailleHW();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "_isDriverLoading set to NO in _processInitialDeviceConnectionCallback", buf, 2u);
  }

  uint64_t v21 = OBJC_IVAR___SCROBrailleDisplay__contentLock;
  [*(id *)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__contentLock] lock];
  uint64_t v22 = (id *)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__brailleDriver];
  objc_storeStrong(v22, a5);
  v23 = AXLogBrailleHW();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v52 = v9;
    __int16 v53 = 2048;
    v54 = self;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "_brailleDriver set to %@ in _processInitialDeviceConnectionCallback for Display %p", buf, 0x16u);
  }

  if (self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__isValid])
  {
    *(void *)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__runLoop] = CFRunLoopGetCurrent();
    if (v17)
    {
      objc_super v24 = AXLogBrailleHW();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Load succeeded and Valid: setting up driver and starting the event processor.", buf, 2u);
      }

      [(MSCRODMobileBrailleDisplay *)self _setupDriverSupport];
      char v25 = objc_opt_respondsToSelector();
      goto LABEL_47;
    }
    if (!self->_isReconnectionEnabled)
    {
LABEL_49:
      int v27 = 1;
      goto LABEL_50;
    }
    id v28 = AXLogBrailleHW();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      +[NSNumber numberWithBool:a3 != 0];
      __int16 v29 = (MSCRODMobileBrailleDisplay *)objc_claimAutoreleasedReturnValue();
      v30 = +[NSNumber numberWithBool:v48];
      BOOL v31 = +[NSNumber numberWithBool:v49 == 3];
      *(_DWORD *)buf = 138413058;
      v52 = v29;
      __int16 v53 = 2112;
      v54 = v50;
      __int16 v55 = 2112;
      v56 = v30;
      __int16 v57 = 2112;
      v58 = v31;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Reconnection enabled: trying again (fail %@) %@ is HID %@, Is invalid: %@", buf, 0x2Au);
    }
    if (a3)
    {
      char v32 = v48;
      if (v49 == 3) {
        char v32 = 1;
      }
      if (v32) {
        goto LABEL_46;
      }
    }
    else if ((([(MSCRODMobileBrailleDisplay *)v50 connected] ^ 1 | v48) & 1) != 0 || v49 == 3)
    {
LABEL_46:
      [*(id *)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__eventDispatcher] start];
      char v25 = objc_opt_respondsToSelector();
LABEL_47:
      if (v25) {
        [*v22 setBrailleDriverDelegate:self];
      }
      goto LABEL_49;
    }
    v33 = AXLogBrailleHW();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v52 = v50;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Disconnecting from [%{public}@]", buf, 0xCu);
    }

    [(MSCRODMobileBrailleDisplay *)v50 disconnect];
    os_log_type_t v34 = AXLogBrailleHW();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v52 = v50;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Reconnecting braille services to device [%{public}@]", buf, 0xCu);
    }

    id v35 = +[MSCRODBrailleConnectionHelper sharedHelper];
    [v35 queueDeviceConnection:v50 withCallback:0];

    goto LABEL_46;
  }
  id v26 = AXLogBrailleHW();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Display invalid: returning from _processInitialDeviceConnectionCallback", buf, 2u);
  }

  int v27 = 0;
  self->_startedThread = 0;
LABEL_50:
  [*(id *)&self->SCROBrailleDisplay_opaque[v21] unlock];
  if (v27)
  {
    if (v17)
    {
      long long v37 = AXLogBrailleHW();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Load succeeded: informing the manager of our progress.", buf, 2u);
      }

      long long v38 = +[MSCRODBrailleDisplayManager sharedManager];
      [v38 addToDisplays:self];

      id WeakRetained = objc_loadWeakRetained((id *)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__delegate]);
      [WeakRetained brailleDisplay:self driverDidLoad:1];

LABEL_59:
      AXSetThreadPriority();
      goto LABEL_65;
    }
    int v40 = v48;
    if (self->_isReconnectionEnabled) {
      int v40 = 1;
    }
    if (v40 == 1 && v49 != 3) {
      goto LABEL_59;
    }
    v41 = AXLogBrailleHW();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      v42 = +[NSNumber numberWithBool:self->_isReconnectionEnabled];
      __int16 v43 = +[NSNumber numberWithBool:v48];
      v44 = +[NSNumber numberWithBool:v49 == 3];
      *(_DWORD *)buf = 138413058;
      v52 = v50;
      __int16 v53 = 2112;
      v54 = v42;
      __int16 v55 = 2112;
      v56 = v43;
      __int16 v57 = 2112;
      v58 = v44;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Disconnecting device %@ because reconnection is not enabled[%@], (HID: %@), (Invalid: %@)", buf, 0x2Au);
    }
    if (!v48 && v49 != 3) {
      [(MSCRODMobileBrailleDisplay *)v50 disconnect];
    }
    id v46 = objc_loadWeakRetained((id *)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__delegate]);
    [v46 brailleDisplay:self driverDidLoad:0];

    self->_startedThread = 0;
  }
LABEL_65:
}

- (void)_setupDriverSupport
{
  uint64_t v3 = OBJC_IVAR___SCROBrailleDisplay__brailleDriver;
  v4 = *(void **)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__brailleDriver];
  if (!v4)
  {
    v5 = AXLogBrailleHW();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 134217984;
      v23 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "_brailleDriver == nil in _setupDriverSupport for Display %p", (uint8_t *)&v22, 0xCu);
    }

    v4 = *(void **)&self->SCROBrailleDisplay_opaque[v3];
  }
  uint64_t v6 = [v4 modelIdentifier];
  uint64_t v7 = *(void **)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__driverModelIdentifier];
  *(void *)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__driverModelIdentifier] = v6;

  uint64_t v8 = (uint64_t)[*(id *)&self->SCROBrailleDisplay_opaque[v3] mainSize];
  uint64_t v9 = OBJC_IVAR___SCROBrailleDisplay__mainSize;
  *(void *)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__mainSize] = v8 & ~(v8 >> 63);
  uint64_t v10 = (uint64_t)[*(id *)&self->SCROBrailleDisplay_opaque[v3] statusSize];
  uint64_t v11 = OBJC_IVAR___SCROBrailleDisplay__statusSize;
  *(void *)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__statusSize] = v10 & ~(v10 >> 63);
  unsigned __int8 v12 = [*(id *)&self->SCROBrailleDisplay_opaque[v3] postsKeyboardEvents];
  self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__postsKeyboardEvents] = v12;
  unsigned int v13 = [*(id *)&self->SCROBrailleDisplay_opaque[v3] brailleInputMode];
  *(_DWORD *)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__brailleInputMode] = v13;
  id v14 = [objc_allocWithZone((Class)SCROBrailleLine) initWithDriver:*(void *)&self->SCROBrailleDisplay_opaque[v3] mainSize:*(void *)&self->SCROBrailleDisplay_opaque[v9] statusSize:*(void *)&self->SCROBrailleDisplay_opaque[v11]];
  uint64_t v15 = OBJC_IVAR___SCROBrailleDisplay__brailleLine;
  BOOL v16 = *(void **)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__brailleLine];
  *(void *)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__brailleLine] = v14;

  [*(id *)&self->SCROBrailleDisplay_opaque[v15] setTranslationDelegate:self];
  unsigned __int8 v17 = [*(id *)&self->SCROBrailleDisplay_opaque[v3] isInputEnabled];
  uint64_t v18 = OBJC_IVAR___SCROBrailleDisplay__inputEnabled;
  self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__inputEnabled] = v17;
  uint64_t v19 = OBJC_IVAR___SCROBrailleDisplay__runLoop;
  if (*(void *)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__runLoop])
  {
    uint64_t v20 = OBJC_IVAR___SCROBrailleDisplay__blinkerEventTimer;
    if (*(void *)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__blinkerEventTimer]
      && [*(id *)&self->SCROBrailleDisplay_opaque[v3] supportsBlinkingCursor])
    {
      CFRunLoopAddTimer(*(CFRunLoopRef *)&self->SCROBrailleDisplay_opaque[v19], *(CFRunLoopTimerRef *)&self->SCROBrailleDisplay_opaque[v20], kCFRunLoopDefaultMode);
    }
    if (self->SCROBrailleDisplay_opaque[v18])
    {
      uint64_t v21 = *(__CFRunLoopTimer **)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__inputEventTimer];
      if (v21) {
        CFRunLoopAddTimer(*(CFRunLoopRef *)&self->SCROBrailleDisplay_opaque[v19], v21, kCFRunLoopDefaultMode);
      }
    }
  }
  [*(id *)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__eventDispatcher] start];
}

- (void)_unloadHandler
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__delegate]);
  [WeakRetained brailleDriverDisconnected:self];

  uint64_t v4 = OBJC_IVAR___SCROBrailleDisplay__contentLock;
  [*(id *)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__contentLock] lock];
  if (self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__isValid])
  {
    [*(id *)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__brailleDriver] unloadDriver];
    self->_isDriverLoaded = 0;
    uint64_t v5 = OBJC_IVAR___SCROBrailleDisplay__runLoop;
    uint64_t v6 = *(__CFRunLoop **)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__runLoop];
    if (v6)
    {
      uint64_t v7 = *(__CFRunLoopTimer **)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__inputEventTimer];
      if (v7) {
        CFRunLoopRemoveTimer(v6, v7, kCFRunLoopDefaultMode);
      }
      uint64_t v8 = *(__CFRunLoopTimer **)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__blinkerEventTimer];
      if (v8) {
        CFRunLoopRemoveTimer(*(CFRunLoopRef *)&self->SCROBrailleDisplay_opaque[v5], v8, kCFRunLoopDefaultMode);
      }
    }
    if (self->_isReconnectionEnabled) {
      [(MSCRODMobileBrailleDisplay *)self _enableReconnectionTimer:1];
    }
    uint64_t v9 = *(void **)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__brailleLine];
    *(void *)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__brailleLine] = 0;
  }
  [*(id *)&self->SCROBrailleDisplay_opaque[v4] unlock];
}

- (void)_reconnectionTriggeredHandler
{
  if (self->_isDriverLoading)
  {
    uint64_t v3 = AXLogBrailleHW();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Turning off _isDriverLoading and _isDriverLoaded for a triggered reconnection", v4, 2u);
    }
  }
  self->_isDriverLoading = 0;
  self->_isDriverLoaded = 0;
  [(MSCRODMobileBrailleDisplay *)self _reconnectionEventHandler];
}

- (void)_reconnectionEventHandler
{
  uint64_t v3 = OBJC_IVAR___SCROBrailleDisplay__brailleDriver;
  if (!*(void *)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__brailleDriver])
  {
    uint64_t v4 = AXLogBrailleHW();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      int v22 = self;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "_brailleDriver == nil in _reconnectionEventHandler for Display %p", buf, 0xCu);
    }
  }
  uint64_t v5 = AXLogBrailleHW();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = +[NSNumber numberWithBool:self->_isDriverLoading];
    uint64_t v7 = +[NSNumber numberWithBool:self->_isDriverLoaded];
    *(_DWORD *)buf = 138412802;
    int v22 = v6;
    __int16 v23 = 2112;
    objc_super v24 = v7;
    __int16 v25 = 2112;
    id v26 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Handling reconnection[%@:%@]: %@", buf, 0x20u);
  }
  if (!self->_isDriverLoading && !self->_isDriverLoaded)
  {
    uint64_t v8 = OBJC_IVAR___SCROBrailleDisplay__contentLock;
    [*(id *)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__contentLock] lock];
    int v9 = self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__isValid];
    if (self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__isValid])
    {
      id v10 = *(id *)&self->SCROBrailleDisplay_opaque[v3];
      id v11 = *(id *)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__ioElement];
    }
    else
    {
      id v10 = 0;
      id v11 = 0;
    }
    [*(id *)&self->SCROBrailleDisplay_opaque[v8] unlock];
    unsigned __int8 v12 = AXLogBrailleHW();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      +[NSNumber numberWithBool:v9 != 0];
      unsigned int v13 = (MSCRODMobileBrailleDisplay *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      int v22 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Is device valid for reconnection: %@", buf, 0xCu);
    }
    if (v9)
    {
      self->_isDriverLoading = 1;
      id v14 = AXLogBrailleHW();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "_isDriverLoading set to YES in _reconnectionEventHandler", buf, 2u);
      }

      uint64_t v15 = [v11 bluetoothAddress];
      BOOL v16 = sub_1000097E4(v15);

      unsigned __int8 v17 = +[MSCRODBrailleConnectionHelper sharedHelper];
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_10000AA8C;
      v18[3] = &unk_100014928;
      v18[4] = self;
      id v19 = v10;
      id v20 = v11;
      [v17 queueDeviceConnection:v16 withCallback:v18];
    }
  }
}

- (void)_processDeviceConnectionCallback:(int)a3 brailleDriver:(id)a4 ioElement:(id)a5
{
  uint64_t v7 = *(void *)&a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (!v9)
  {
    id v12 = v10;
    unsigned int v13 = AXLogBrailleHW();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "brailleDriver == nil in _processDeviceConnectionCallback", buf, 2u);
    }

    id v11 = v12;
  }
  v30 = v11;
  id v14 = objc_msgSend(v9, "loadDriverWithIOElement:");
  id v15 = v14;
  if (v9) {
    BOOL v16 = v14 == 0;
  }
  else {
    BOOL v16 = 0;
  }
  BOOL v17 = v16;
  uint64_t v18 = AXLogBrailleHW();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    id v19 = +[NSNumber numberWithUnsignedInt:v15];
    id v20 = +[NSNumber numberWithBool:v17];
    uint64_t v21 = +[NSNumber numberWithInt:v7];
    *(_DWORD *)buf = 138413058;
    id v32 = v19;
    __int16 v33 = 2112;
    os_log_type_t v34 = v20;
    __int16 v35 = 2112;
    id v36 = v21;
    __int16 v37 = 2112;
    long long v38 = self;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Connected and loaded: driverLoadReturn %@, loadSucceeded %@ (BT result: %@) for Display %@", buf, 0x2Au);
  }
  self->_isDriverLoading = 0;
  self->_isDriverLoaded = v17;
  int v22 = AXLogBrailleHW();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "_isDriverLoading set to NO in _processDeviceConnectionCallback", buf, 2u);
  }

  uint64_t v23 = OBJC_IVAR___SCROBrailleDisplay__contentLock;
  [*(id *)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__contentLock] lock];
  objc_storeStrong((id *)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__brailleDriver], a4);
  objc_super v24 = AXLogBrailleHW();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v32 = v9;
    __int16 v33 = 2048;
    os_log_type_t v34 = self;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "_brailleDriver set to %@ in _processDeviceConnectionCallback for Display %p", buf, 0x16u);
  }

  if (self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__isValid])
  {
    if (v15)
    {
      __int16 v25 = AXLogBrailleHW();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        id v26 = [(MSCRODMobileBrailleDisplay *)self bluetoothAddress];
        *(_DWORD *)buf = 138412290;
        id v32 = v26;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Unsuccessful connect %@", buf, 0xCu);
      }
    }
    else
    {
      [(MSCRODMobileBrailleDisplay *)self _enableReconnectionTimer:0];
      [(MSCRODMobileBrailleDisplay *)self _setupDriverSupport];
      __int16 v25 = AXLogBrailleHW();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        id v28 = [(MSCRODMobileBrailleDisplay *)self bluetoothAddress];
        *(_DWORD *)buf = 138412290;
        id v32 = v28;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Succeeded on reconnect %@", buf, 0xCu);
      }
    }

    int v27 = 0;
  }
  else
  {
    int v27 = 1;
  }
  [*(id *)&self->SCROBrailleDisplay_opaque[v23] unlock];
  if (!(v27 | !v17))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__delegate]);
    [WeakRetained brailleDisplay:self driverDidLoad:1];
  }
}

- (void)_resetReconnectionTimer
{
  if (self->_reconnectionEventTimer)
  {
    if (self->_reconnectionInterval < 30.0)
    {
      if ((unint64_t)[(NSMutableDictionary *)self->_bluetoothConnectedDevices count] < 4)
      {
        if (CFAbsoluteTimeGetCurrent() - self->_beganReconnectionInterval >= 180.0)
        {
          self->_reconnectionInterval = fmin(self->_reconnectionInterval, 30.0);
          self->_beganReconnectionInterval = CFAbsoluteTimeGetCurrent();
        }
      }
      else
      {
        self->_reconnectionInterval = 30.0;
      }
    }
    uint64_t v3 = AXLogBrailleHW();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = +[NSNumber numberWithDouble:self->_reconnectionInterval];
      uint64_t v5 = [(MSCRODMobileBrailleDisplay *)self bluetoothAddress];
      int v6 = 138412546;
      uint64_t v7 = v4;
      __int16 v8 = 2112;
      id v9 = v5;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Change reconnection timer to %@ %@", (uint8_t *)&v6, 0x16u);
    }
  }
}

- (void)_enableReconnectionTimer:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = AXLogBrailleHW();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = +[NSNumber numberWithBool:v3];
    uint64_t v7 = +[NSNumber numberWithBool:self->_isDriverLoaded];
    __int16 v8 = [(MSCRODMobileBrailleDisplay *)self bluetoothAddress];
    *(_DWORD *)buf = 138412802;
    uint64_t v21 = v6;
    __int16 v22 = 2112;
    uint64_t v23 = v7;
    __int16 v24 = 2112;
    __int16 v25 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Enabled reconnection: %@, driver loaded: %@, %@", buf, 0x20u);
  }
  if (v3 && !self->_isDriverLoaded)
  {
    if (self->_reconnectionEventTimer)
    {
      [(MSCRODMobileBrailleDisplay *)self _resetReconnectionTimer];
    }
    else
    {
      self->_beganReconnectionInterval = CFAbsoluteTimeGetCurrent();
      self->_double reconnectionInterval = 15.0;
      id v12 = (AXDispatchTimer *)[objc_alloc((Class)AXDispatchTimer) initWithTargetSerialQueue:&_dispatch_main_q];
      reconnectionEventTimer = self->_reconnectionEventTimer;
      self->_reconnectionEventTimer = v12;
    }
    if (![(AXDispatchTimer *)self->_reconnectionEventTimer isPending]
      || [(AXDispatchTimer *)self->_reconnectionEventTimer isCancelled])
    {
      id v14 = AXLogBrailleHW();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = [(MSCRODMobileBrailleDisplay *)self bluetoothAddress];
        BOOL v16 = +[NSNumber numberWithDouble:self->_reconnectionInterval];
        *(_DWORD *)buf = 138412546;
        uint64_t v21 = v15;
        __int16 v22 = 2112;
        uint64_t v23 = v16;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Restart reconnection: %@ %@", buf, 0x16u);
      }
      BOOL v17 = self->_reconnectionEventTimer;
      double reconnectionInterval = self->_reconnectionInterval;
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_10000B37C;
      v19[3] = &unk_100014770;
      v19[4] = self;
      [(AXDispatchTimer *)v17 afterDelay:v19 processBlock:reconnectionInterval];
    }
  }
  else
  {
    [(AXDispatchTimer *)self->_reconnectionEventTimer cancel];
    id v9 = self->_reconnectionEventTimer;
    self->_reconnectionEventTimer = 0;

    id v10 = AXLogBrailleHW();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [(MSCRODMobileBrailleDisplay *)self bluetoothAddress];
      *(_DWORD *)buf = 138412290;
      uint64_t v21 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Turning reconnection timer off: %@", buf, 0xCu);
    }
  }
}

- (BOOL)requiresPersistentConnection
{
  if (self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__isValid])
  {
    uint64_t v3 = [(MSCRODMobileBrailleDisplay *)self bluetoothAddress];
    if (v3)
    {
      uint64_t v4 = (void *)v3;
      uint64_t v5 = +[AXSettings sharedInstance];
      int v6 = [v5 voiceOverBrailleDisconnectOnSleep];
      uint64_t v7 = [v6 objectForKeyedSubscript:v4];

      if (v7)
      {
        unsigned int v8 = [v7 BOOLValue] ^ 1;
      }
      else
      {
        uint64_t v9 = OBJC_IVAR___SCROBrailleDisplay__ioElement;
        if (![*(id *)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__ioElement] conformsToProtocol:&OBJC_PROTOCOL___SCROIOHIDElementProtocol]|| !objc_msgSend(*(id *)&self->SCROBrailleDisplay_opaque[v9], "hidDevice"))
        {
          LOBYTE(v8) = 0;
          goto LABEL_12;
        }
        LOBYTE(v8) = 1;
      }

LABEL_12:
      return v8;
    }
    LOBYTE(v8) = 1;
  }
  else
  {
    LOBYTE(v8) = 0;
  }
  return v8;
}

- (void)_reloadDriver
{
  uint64_t v3 = (id *)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__brailleDriver];
  if (!*v3)
  {
    uint64_t v4 = AXLogBrailleHW();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      __int16 v37 = self;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "_brailleDriver == nil in _reloadDriver for Display %@", buf, 0xCu);
    }
  }
  if (self->_isDriverLoading || self->_isDriverLoaded)
  {
    uint64_t v5 = AXLogBrailleHW();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = +[NSNumber numberWithBool:self->_isDriverLoading];
      uint64_t v7 = +[NSNumber numberWithBool:self->_isDriverLoaded];
      *(_DWORD *)buf = 138412802;
      __int16 v37 = v6;
      __int16 v38 = 2112;
      long long v39 = v7;
      __int16 v40 = 2114;
      v41 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Not reloading driver: %@/%@ [%{public}@]", buf, 0x20u);
    }
  }
  else
  {
    unsigned int v8 = AXLogBrailleHW();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      __int16 v37 = self;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Reloading braille driver for display [%{public}@]", buf, 0xCu);
    }

    uint64_t v35 = OBJC_IVAR___SCROBrailleDisplay__contentLock;
    [*(id *)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__contentLock] lock];
    if (self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__isValid])
    {
      uint64_t v33 = OBJC_IVAR___SCROBrailleDisplay__isValid;
      id obj = *v3;
      uint64_t v5 = *v3;
      id v9 = *v3;
      *uint64_t v3 = 0;

      id v10 = AXLogBrailleHW();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        __int16 v37 = (MSCRODMobileBrailleDisplay *)v5;
        __int16 v38 = 2048;
        long long v39 = self;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "_brailleDriver set to nil (from %p) in _reloadDriver for Display %p", buf, 0x16u);
      }

      id v11 = *(id *)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__ioElement];
      [*(id *)&self->SCROBrailleDisplay_opaque[v35] unlock];
      self->_isDriverLoading = 1;
      id v12 = AXLogBrailleHW();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "_isDriverLoading set to YES in _reloadDriver", buf, 2u);
      }

      id v14 = [v11 bluetoothAddress];
      sub_1000097E4(v14);
      id v15 = (MSCRODMobileBrailleDisplay *)objc_claimAutoreleasedReturnValue();

      if ([(MSCRODMobileBrailleDisplay *)v15 connected])
      {
        if (([(MSCRODMobileBrailleDisplay *)v15 connectedServices] & 0x2000) != 0)
        {
          unsigned int v19 = [v5 loadDriverWithIOElement:v11];
          uint64_t v18 = AXLogBrailleHW();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            if (v5) {
              BOOL v21 = v19 == 0;
            }
            else {
              BOOL v21 = 0;
            }
            uint64_t v22 = v21;
            +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v22, v11);
            uint64_t v23 = (MSCRODMobileBrailleDisplay *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            __int16 v37 = v23;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Braille driver load succeeded: %@ in _reloadDriver", buf, 0xCu);

            id v11 = v32;
          }
        }
        else
        {
          if (![v11 conformsToProtocol:&OBJC_PROTOCOL___SCROIOHIDElementProtocol]
            || ![v11 hidDevice])
          {
            BOOL v16 = AXLogBrailleHW();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              __int16 v37 = v15;
              _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Disconnecting in reload from [%{public}@]", buf, 0xCu);
            }

            [(MSCRODMobileBrailleDisplay *)v15 disconnect];
          }
          BOOL v17 = AXLogBrailleHW();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            __int16 v37 = v15;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Reconnecting braille services to device [%{public}@]", buf, 0xCu);
          }

          uint64_t v18 = +[MSCRODBrailleConnectionHelper sharedHelper];
          [v18 queueDeviceConnection:v15 withCallback:0];
          unsigned int v19 = 1;
        }
      }
      else
      {
        unsigned int v19 = 1;
      }
      if (v5) {
        BOOL v24 = v19 == 0;
      }
      else {
        BOOL v24 = 0;
      }
      BOOL v25 = v24;

      self->_isDriverLoading = 0;
      self->_isDriverLoaded = v25;
      id v26 = AXLogBrailleHW();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "_isDriverLoading set to NO in _reloadDriver", buf, 2u);
      }

      [*(id *)&self->SCROBrailleDisplay_opaque[v35] lock];
      objc_storeStrong(v3, obj);
      int v27 = AXLogBrailleHW();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        __int16 v37 = (MSCRODMobileBrailleDisplay *)v5;
        __int16 v38 = 2048;
        long long v39 = self;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "_brailleDriver set to %@ in _reloadDriver for Display %p", buf, 0x16u);
      }

      if (self->SCROBrailleDisplay_opaque[v33])
      {
        int v28 = 0;
        if (v5 && !v19)
        {
          [(MSCRODMobileBrailleDisplay *)self _setupDriverSupport];
          int v28 = 0;
        }
      }
      else
      {
        Current = CFRunLoopGetCurrent();
        CFRunLoopStop(Current);
        int v28 = 1;
      }
      [*(id *)&self->SCROBrailleDisplay_opaque[v35] unlock];
      if (((v28 | !v25) & 1) == 0)
      {
        v30 = +[MSCRODBrailleDisplayManager sharedManager];
        [v30 addToDisplays:self];

        id WeakRetained = objc_loadWeakRetained((id *)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__delegate]);
        [WeakRetained brailleDisplay:self driverDidLoad:1];

        [(MSCRODMobileBrailleDisplay *)self _enableReconnectionTimer:0];
      }
    }
    else
    {
      [*(id *)&self->SCROBrailleDisplay_opaque[v35] unlock];
      id v20 = CFRunLoopGetCurrent();
      CFRunLoopStop(v20);
      uint64_t v5 = 0;
      id v11 = 0;
    }
  }
}

- (id)bluetoothAddress
{
  uint64_t v3 = [(MSCRODMobileBrailleDisplay *)self ioElement];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v5 = [(MSCRODMobileBrailleDisplay *)self ioElement];
    int v6 = [v5 bluetoothAddress];
  }
  else
  {
    int v6 = 0;
  }

  return v6;
}

- (void)_startWatchingForDevices
{
  [(MSCRODMobileBrailleDisplay *)self _stopWatchingForDevices];
  if (!self->_bluetoothConnectedDevices)
  {
    uint64_t v3 = (NSMutableDictionary *)[objc_allocWithZone((Class)NSMutableDictionary) init];
    bluetoothConnectedDevices = self->_bluetoothConnectedDevices;
    self->_bluetoothConnectedDevices = v3;
  }
  uint64_t v5 = +[BluetoothManager sharedInstance];
  int v6 = [v5 pairedDevices];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v8)
  {
    id v10 = v8;
    uint64_t v11 = *(void *)v23;
    *(void *)&long long v9 = 138412290;
    long long v21 = v9;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v7);
        }
        unsigned int v13 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if (objc_msgSend(v13, "connected", v21, (void)v22))
        {
          id v14 = [(MSCRODMobileBrailleDisplay *)self bluetoothAddress];
          id v15 = [v13 address];
          unsigned int v16 = [v14 isEqualToString:v15];

          if (v16)
          {
            BOOL v17 = AXLogBrailleHW();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v21;
              int v27 = v13;
              _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Monitoring paired device: %@", buf, 0xCu);
            }

            uint64_t v18 = self->_bluetoothConnectedDevices;
            unsigned int v19 = [v13 address];
            [(NSMutableDictionary *)v18 setObject:v13 forKey:v19];
          }
        }
      }
      id v10 = [v7 countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v10);
  }

  id v20 = +[NSNotificationCenter defaultCenter];
  [v20 addObserver:self selector:"addDeviceNotification:" name:BluetoothDeviceConnectSuccessNotification object:0];
  [v20 addObserver:self selector:"addDeviceFailedNotification:" name:BluetoothDeviceConnectFailedNotification object:0];
  [v20 addObserver:self selector:"removeDeviceNotification:" name:BluetoothDeviceDisconnectSuccessNotification object:0];
  [v20 addObserver:self selector:"removeDeviceNotification:" name:BluetoothDeviceDisconnectFailedNotification object:0];
  [v20 addObserver:self selector:"deviceUpdatedNotification:" name:BluetoothDeviceUpdatedNotification object:0];
  [v20 addObserver:self selector:"connectionStatusChanged:" name:BluetoothConnectionStatusChangedNotification object:0];
}

- (void)_stopWatchingForDevices
{
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:BluetoothDeviceConnectSuccessNotification object:0];
  [v4 removeObserver:self name:BluetoothDeviceConnectFailedNotification object:0];
  [v4 removeObserver:self name:BluetoothDeviceDisconnectSuccessNotification object:0];
  [v4 removeObserver:self name:BluetoothDeviceDisconnectFailedNotification object:0];
  [v4 removeObserver:self name:BluetoothDeviceUpdatedNotification object:0];
  [v4 removeObserver:self name:BluetoothConnectionStatusChangedNotification object:0];
  bluetoothConnectedDevices = self->_bluetoothConnectedDevices;
  self->_bluetoothConnectedDevices = 0;
}

- (void)addDeviceFailedNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 object];
  uint64_t v6 = [v5 address];
  id v7 = (MSCRODMobileBrailleDisplay *)v6;
  if (v5 && v6 && ![v5 connected])
  {
    id v10 = +[MSCRODBrailleConnectionHelper sharedHelper];
    [v10 handleBluetoothConnectionEventForQueue:v5 forceProcess:0];

    uint64_t v11 = [(MSCRODMobileBrailleDisplay *)self bluetoothAddress];
    unsigned int v12 = [v11 isEqualToString:v7];

    if (v12)
    {
      unsigned int v13 = AXLogBrailleHW();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        id v14 = +[NSNumber numberWithBool:self->_isReconnectionEnabled];
        int v15 = 138412802;
        id v16 = v4;
        __int16 v17 = 2114;
        uint64_t v18 = self;
        __int16 v19 = 2114;
        id v20 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "FAILED: Add device failed: Reset reconnect %@ [%{public}@] - %{public}@", (uint8_t *)&v15, 0x20u);
      }
      [(MSCRODMobileBrailleDisplay *)self _enableReconnectionTimer:self->_isReconnectionEnabled];
    }
  }
  else
  {
    id v8 = AXLogBrailleHW();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      long long v9 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v5 connected]);
      int v15 = 138412802;
      id v16 = v5;
      __int16 v17 = 2112;
      uint64_t v18 = v7;
      __int16 v19 = 2112;
      id v20 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Delayed device remove not processing: %@/%@/%@", (uint8_t *)&v15, 0x20u);
    }
  }
}

- (void)addDeviceNotification:(id)a3
{
}

- (BOOL)isBluetoothHID
{
  return [*(id *)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__ioElement] transport] == 8;
}

- (void)_delayedAddDeviceNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 object];
  uint64_t v6 = [v5 address];
  id v7 = (void *)v6;
  if (v5)
  {
    if (v6)
    {
      id v8 = [(MSCRODMobileBrailleDisplay *)self bluetoothAddress];
      unsigned int v9 = [v8 isEqualToString:v7];

      if (v9)
      {
        id v10 = AXLogBrailleHW();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v11 = +[NSNumber numberWithBool:self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__isValid]];
          *(_DWORD *)buf = 138543874;
          uint64_t v33 = self;
          __int16 v34 = 2114;
          id v35 = v4;
          __int16 v36 = 2112;
          __int16 v37 = v11;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "SUCCESS: Connection success for display [%{public}@] - %{public}@ valid: %@", buf, 0x20u);
        }
        unsigned int v12 = +[MSCRODBrailleConnectionHelper sharedHelper];
        [v12 handleBluetoothConnectionEventForQueue:v5];

        if (self->_isDriverLoading)
        {
          unsigned int v13 = AXLogBrailleHW();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Turning off _isDriverLoading", buf, 2u);
          }
        }
        self->_isDriverLoading = 0;
        uint64_t v14 = OBJC_IVAR___SCROBrailleDisplay__contentLock;
        [*(id *)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__contentLock] lock];
        if (self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__isValid])
        {
          int v15 = [(NSMutableDictionary *)self->_bluetoothConnectedDevices objectForKey:v7];
          BOOL v16 = v15 == 0;

          if (!v16) {
            [(NSMutableDictionary *)self->_bluetoothConnectedDevices setObject:v5 forKey:v7];
          }
          uint64_t v17 = OBJC_IVAR___SCROBrailleDisplay__ioElement;
          if ([*(id *)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__ioElement] conformsToProtocol:&OBJC_PROTOCOL___SCROIOHIDElementProtocol])uint64_t v18 = 1048736; {
          else
          }
            uint64_t v18 = 1056896;
          unint64_t v19 = (unint64_t)[v5 connectedServices];
          id v20 = [*(id *)&self->SCROBrailleDisplay_opaque[v17] bluetoothAddress];
          unsigned int v21 = [v7 isEqualToString:v20];
          unint64_t v22 = v19 & v18;
          if ((v19 & v18) != 0) {
            uint64_t v23 = v21;
          }
          else {
            uint64_t v23 = 0;
          }

          long long v24 = AXLogBrailleHW();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v31 = v14;
            long long v25 = +[NSNumber numberWithBool:v23];
            id v26 = +[NSNumber numberWithUnsignedInteger:v18];
            int v27 = +[NSNumber numberWithBool:v22 != 0];
            int v28 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v5 connectedServices]);
            *(_DWORD *)buf = 138413314;
            uint64_t v33 = v25;
            __int16 v34 = 2112;
            id v35 = v26;
            __int16 v36 = 2112;
            __int16 v37 = v27;
            __int16 v38 = 2112;
            long long v39 = v28;
            __int16 v40 = 2048;
            v41 = self;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Should reload: %@ required service: %@ service connected: %@, connected services: %@, device: %p", buf, 0x34u);

            uint64_t v14 = v31;
          }

          int v29 = 0;
        }
        else
        {
          Current = CFRunLoopGetCurrent();
          CFRunLoopStop(Current);
          LODWORD(v23) = 0;
          int v29 = 1;
        }
        [*(id *)&self->SCROBrailleDisplay_opaque[v14] unlock];
        if (((v29 | v23 ^ 1) & 1) == 0) {
          [(MSCRODMobileBrailleDisplay *)self _reloadDriver];
        }
      }
    }
  }
}

- (void)removeDeviceNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = AXLogBrailleHW();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Device remove: %@", (uint8_t *)&v6, 0xCu);
  }

  [(MSCRODMobileBrailleDisplay *)self performSelectorOnMainThread:"_delayedRemoveDeviceNotification:" withObject:v4 waitUntilDone:0];
}

- (void)_delayedRemoveDeviceNotification:(id)a3
{
  id v4 = [a3 object];
  uint64_t v5 = [v4 address];
  int v6 = (void *)v5;
  if (v4 && v5 && ![v4 connected])
  {
    uint64_t v12 = OBJC_IVAR___SCROBrailleDisplay__contentLock;
    [*(id *)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__contentLock] lock];
    self->_isDriverLoaded = 0;
    self->_isDriverLoading = 0;
    unsigned int v13 = AXLogBrailleHW();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "_isDriverLoading set to YES in _delayedRemoveDeviceNotification", (uint8_t *)&v23, 2u);
    }

    uint64_t v14 = [(NSMutableDictionary *)self->_bluetoothConnectedDevices objectForKey:v6];

    if (v14) {
      [(NSMutableDictionary *)self->_bluetoothConnectedDevices removeObjectForKey:v6];
    }
    id v7 = [*(id *)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__ioElement] bluetoothAddress];
    int v15 = AXLogBrailleHW();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 138412290;
      long long v24 = v7;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Handling device removal: %@", (uint8_t *)&v23, 0xCu);
    }

    [*(id *)&self->SCROBrailleDisplay_opaque[v12] unlock];
    if (!v7
      || ![v6 isEqualToString:v7]
      || (+[BluetoothManager sharedInstance],
          BOOL v16 = objc_claimAutoreleasedReturnValue(),
          unsigned int v17 = [v16 available],
          v16,
          !v17))
    {
      id v8 = AXLogBrailleHW();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v19 = +[NSNumber numberWithInt:v7 == 0];
        id v20 = +[BluetoothManager sharedInstance];
        unsigned int v21 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v20 available]);
        int v23 = 138413058;
        long long v24 = v19;
        __int16 v25 = 2112;
        id v26 = v6;
        __int16 v27 = 2112;
        int v28 = v7;
        __int16 v29 = 2112;
        v30 = v21;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "_delayedRemoveDeviceNotification: bluetoothAddress == nil (%@) or address (%@) != bluetoothAddress (%@) or BluetoothManager.sharedInstance not available (%@)", (uint8_t *)&v23, 0x2Au);
      }
      goto LABEL_22;
    }
    if ([v4 paired])
    {
      uint64_t v18 = AXLogBrailleHW();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        int v23 = 138412290;
        long long v24 = v4;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Device still paired after disconnect, commencing reconnect strategy: %@", (uint8_t *)&v23, 0xCu);
      }

      [(MSCRODMobileBrailleDisplay *)self _enableReconnectionTimer:self->_isReconnectionEnabled];
      id v8 = +[MSCRODBrailleConnectionHelper sharedHelper];
      [v8 handleBluetoothConnectionEventForQueue:v4];
      goto LABEL_22;
    }
    unint64_t v22 = +[MSCRODBrailleDisplayManager sharedManager];
    [v22 removeBluetoothDriverWithAddress:v6];

    id v8 = AXLogBrailleHW();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
LABEL_22:

      goto LABEL_23;
    }
    int v23 = 138412290;
    long long v24 = v7;
    unsigned int v9 = "Removing address from preferences: %@";
    id v10 = v8;
    uint32_t v11 = 12;
LABEL_6:
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v23, v11);
    goto LABEL_22;
  }
  id v7 = AXLogBrailleHW();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = +[NSNumber numberWithBool:[v4 connected]];
    int v23 = 138412802;
    long long v24 = v4;
    __int16 v25 = 2112;
    id v26 = v6;
    __int16 v27 = 2112;
    int v28 = v8;
    unsigned int v9 = "Delayed device remove not processing: %@/%@/%@";
    id v10 = v7;
    uint32_t v11 = 32;
    goto LABEL_6;
  }
LABEL_23:
}

- (void)deviceUpdatedNotification:(id)a3
{
}

- (void)connectionStatusChanged:(id)a3
{
}

- (void)_delayedDeviceUpdatedNotification:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__delegate]);
  [WeakRetained configurationChangedForBrailleDisplay:self];
}

- (id)configuration
{
  uint64_t v3 = OBJC_IVAR___SCROBrailleDisplay__contentLock;
  [*(id *)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__contentLock] lock];
  CFStringRef v4 = *(const __CFString **)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__driverIdentifier];
  if (v4) {
    Copy = (__CFString *)CFStringCreateCopy(0, v4);
  }
  else {
    Copy = 0;
  }
  CFStringRef v6 = *(const __CFString **)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__driverModelIdentifier];
  if (v6) {
    id v7 = (__CFString *)CFStringCreateCopy(0, v6);
  }
  else {
    id v7 = 0;
  }
  uint64_t v8 = *(void *)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__mainSize];
  uint64_t v9 = *(void *)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__statusSize];
  uint64_t v10 = *(unsigned int *)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__brailleInputMode];
  id v11 = *(id *)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__ioElement];
  [*(id *)&self->SCROBrailleDisplay_opaque[v3] unlock];
  uint64_t v12 = +[NSMutableDictionary dictionaryWithCapacity:10];
  unsigned int v13 = v12;
  if (Copy) {
    [v12 setObject:Copy forKey:kSCROBrailleDisplayDriverIdentifier];
  }
  if (v7)
  {
    [v13 setObject:v7 forKey:kSCROBrailleDisplayModelIdentifier];
    uint64_t v14 = +[NSNumber numberWithInteger:v8];
    [v13 setObject:v14 forKey:kSCROBrailleDisplayMainSize];

    int v15 = +[NSNumber numberWithInteger:v9];
    [v13 setObject:v15 forKey:kSCROBrailleDisplayStatusSize];
  }
  if (!v11)
  {
    v30 = +[NSNumber numberWithUnsignedInteger:0];
    [v13 setObject:v30 forKey:kSCROBrailleDisplayTransport];
    goto LABEL_28;
  }
  BOOL v16 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (int)[v11 identifier]);
  [v13 setObject:v16 forKey:kSCROBrailleDisplayToken];

  unsigned int v17 = [v11 transport];
  uint64_t v18 = +[NSNumber numberWithUnsignedInteger:v17];
  [v13 setObject:v18 forKey:kSCROBrailleDisplayTransport];

  BOOL v19 = v17 > 0x20 || ((1 << v17) & 0x100000104) == 0;
  if (!v19
    && (([v11 conformsToProtocol:&OBJC_PROTOCOL___SCROIOBluetoothElementProtocol] & 1) != 0
     || [v11 conformsToProtocol:&OBJC_PROTOCOL___SCROIOBTLESerialElementProtocol]))
  {
    id v20 = [v11 bluetoothAddress];
    if (v20) {
      [v13 setObject:v20 forKey:kSCROBrailleDisplayBluetoothAddress];
    }
    unsigned int v21 = sub_1000097E4(v20);
    unint64_t v22 = v21;
    if (v21)
    {
      int v23 = v7;
      long long v24 = Copy;
      __int16 v25 = [v21 name];
    }
    else
    {
      if (![v11 conformsToProtocol:&OBJC_PROTOCOL___SCROIOHIDElementProtocol]) {
        goto LABEL_24;
      }
      int v23 = v7;
      long long v24 = Copy;
      __int16 v25 = [v11 productName];
      if (!v25)
      {
LABEL_23:

        Copy = v24;
        id v7 = v23;
LABEL_24:

        goto LABEL_25;
      }
    }
    [v13 setObject:v25 forKey:kSCROBrailleDisplayBluetoothName];
    goto LABEL_23;
  }
LABEL_25:
  if (![v11 conformsToProtocol:&OBJC_PROTOCOL___SCROIOHIDElementProtocol]) {
    goto LABEL_29;
  }
  id v26 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v11 vendorId]);
  __int16 v27 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v11 productId]);
  int v28 = +[NSString stringWithFormat:@"%@,%@", v26, v27];
  [v13 setObject:v28 forKeyedSubscript:kSCROBrailleDisplayBrailleVendorProductId];

  __int16 v29 = [v11 productName];
  [v13 setObject:v29 forKeyedSubscript:kSCROBrailleDisplayBrailleProductName];

  v30 = [v11 manufacturerName];
  [v13 setObject:v30 forKeyedSubscript:kSCROBrailleDisplayBrailleManufacturerName];
LABEL_28:

LABEL_29:
  uint64_t v31 = +[NSNumber numberWithBool:self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__postsKeyboardEvents]];
  [v13 setObject:v31 forKey:kSCROBrailleDisplayPostsKeyboardEvents];

  id v32 = +[NSNumber numberWithInteger:v10];
  [v13 setObject:v32 forKey:kSCROBrailleDisplayBrailleInputMode];

  return v13;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  CFStringRef v4 = [(MSCRODMobileBrailleDisplay *)self configuration];
  uint64_t v5 = [v4 objectForKeyedSubscript:kSCROBrailleDisplayBluetoothAddress];
  CFStringRef v6 = [(MSCRODMobileBrailleDisplay *)self configuration];
  id v7 = [v6 objectForKeyedSubscript:kSCROBrailleDisplayModelIdentifier];
  uint64_t v8 = [(MSCRODMobileBrailleDisplay *)self configuration];
  uint64_t v9 = [v8 objectForKeyedSubscript:kSCROBrailleDisplayTransport];
  uint64_t v10 = +[NSString stringWithFormat:@"%@[%p]\n\tBT Address: %@\n\tDriver Model: %@\n\tTransport: %@", v3, self, v5, v7, v9];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_4;
  }
  id v5 = v4;
  CFStringRef v6 = [(MSCRODMobileBrailleDisplay *)self configuration];
  id v7 = [v5 configuration];

  LOBYTE(v5) = [v6 isEqual:v7];
  if (v5) {
    BOOL v8 = 1;
  }
  else {
LABEL_4:
  }
    BOOL v8 = 0;

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bluetoothConnectedDevices, 0);

  objc_storeStrong((id *)&self->_reconnectionEventTimer, 0);
}

@end