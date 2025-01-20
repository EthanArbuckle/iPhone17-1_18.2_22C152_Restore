@interface GCGamepadHIDServicePlugin
+ (BOOL)matchService:(unsigned int)a3 options:(id)a4 score:(int64_t *)a5;
- ($536A88BB5CAE6CA76785073378A79450)batteryReport;
- (BOOL)isAnyHapticMotorEnabled;
- (BOOL)isBluetoothClassic;
- (BOOL)isBluetoothLE;
- (BOOL)isHapticsActive;
- (BOOL)isIdle;
- (BOOL)isTwoAxisInputIdle:(GCGamepadHIDServicePlugin *)self prevInput:(SEL)a2 noiseBuffer:;
- (BOOL)isUSB;
- (BOOL)isVirtualDevice;
- (BOOL)setProperty:(id)a3 forKey:(id)a4 client:(id)a5;
- (BOOL)shouldCreateBatteryDevice;
- (BOOL)shouldDisconnectWhenIdle;
- (BOOL)updateHapticMotor:(id)a3;
- (GCGamepadHIDServicePlugin)initWithService:(unsigned int)a3;
- (HIDConnection)client;
- (HIDDevice)device;
- (HIDEventDispatcher)dispatcher;
- (HIDUserDevice)batteryUserDevice;
- (NSArray)hapticMotors;
- (NSString)description;
- (NSString)uniqueIdentifier;
- (OS_dispatch_queue)dispatchQueue;
- (float)defaultHapticDispatchFrequency;
- (float)defaultIdleTimeoutDuration;
- (float)defaultLeftAxisSnapRadius;
- (float)defaultLeftThumbstickDeadzoneRadius;
- (float)defaultLeftThumbstickNoiseBuffer;
- (float)defaultRightAxisSnapRadius;
- (float)defaultRightThumbstickDeadzoneRadius;
- (float)defaultRightThumbstickNoiseBuffer;
- (float)hapticDispatchFrequency;
- (float)idleTimeoutDuration;
- (float)leftThumbstickAxisSnapRadius;
- (float)leftThumbstickDeadzoneRadius;
- (float)leftThumbstickNoiseBuffer;
- (float)rightThumbstickAxisSnapRadius;
- (float)rightThumbstickDeadzoneRadius;
- (float)rightThumbstickNoiseBuffer;
- (id)createEvent:(unsigned int)a3 timestamp:(unint64_t)a4;
- (id)createHIDDeviceForService:(unsigned int)a3;
- (id)defaultHapticMotors;
- (id)eventMatching:(id)a3 forClient:(id)a4;
- (id)propertyForKey:(id)a3 client:(id)a4;
- (unint64_t)lastEventTime;
- (unsigned)numberOfTimesToSendZeroHapticReport;
- (unsigned)service;
- (void)activate;
- (void)applyDeadzone:(float)a3 axisSnapRadius:(float)a4 input:;
- (void)cancel;
- (void)clientNotification:(id)a3 added:(BOOL)a4;
- (void)connectToAdaptiveTriggersServiceWithClient:(id)a3 reply:(id)a4;
- (void)connectToBatteryServiceWithClient:(id)a3 reply:(id)a4;
- (void)connectToGameIntentServiceWithClient:(id)a3 reply:(id)a4;
- (void)connectToGenericDeviceDriverConfigurationServiceWithClient:(id)a3 reply:(id)a4;
- (void)connectToLightServiceWithClient:(id)a3 reply:(id)a4;
- (void)connectToMotionServiceWithClient:(id)a3 reply:(id)a4;
- (void)connectToNintendoJoyConFusionGestureServiceWithClient:(id)a3 reply:(id)a4;
- (void)createVirtualHIDDeviceForBattery;
- (void)dealloc;
- (void)disconnect;
- (void)dispatchEvent:(id)a3;
- (void)dispatchEvent:(id)a3 withInputDelay:(BOOL)a4;
- (void)dispatchGameControllerExtendedEventWithState:(id *)a3 timestamp:(unint64_t)a4;
- (void)dispatchGameControllerExtendedEventWithState:(id *)a3 timestamp:(unint64_t)a4 children:(id)a5;
- (void)dispatchHomeButtonEventWithValue:(BOOL)a3 timestamp:(unint64_t)a4;
- (void)dispatchIdleEvent:(id)a3;
- (void)dispatchIdleEvent:(id)a3 withInputDelay:(BOOL)a4;
- (void)dispatchMenuButtonEventWithValue:(BOOL)a3 timestamp:(unint64_t)a4;
- (void)dispatchMotionEventWithState:(id *)a3 timestamp:(unint64_t)a4;
- (void)dispatchOptionsButtonEventWithValue:(BOOL)a3 timestamp:(unint64_t)a4;
- (void)dispatchSearchButtonEventWithValue:(BOOL)a3 timestamp:(unint64_t)a4;
- (void)dispatchShareButtonEventWithValue:(BOOL)a3 timestamp:(unint64_t)a4;
- (void)enableHaptics;
- (void)enqueueTransient:(id)a3 hapticMotor:(unint64_t)a4;
- (void)fetchDeviceRegistryIDWithReply:(id)a3;
- (void)initGameControllerDaemonXPC;
- (void)readBatteryWithReply:(id)a3;
- (void)scheduleIdleTimer;
- (void)sendBatteryReport;
- (void)setCancelHandler:(id)a3;
- (void)setClient:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setDispatcher:(id)a3;
- (void)setEventDispatcher:(id)a3;
- (void)setHapticDispatchFrequency:(float)a3;
- (void)setHapticMotor:(unint64_t)a3 frequency:(float)a4 amplitude:(float)a5;
- (void)setHapticMotors:(id)a3;
- (void)setIdleTimeoutDuration:(float)a3;
- (void)setLeftThumbstickAxisSnapRadius:(float)a3;
- (void)setLeftThumbstickDeadzoneRadius:(float)a3;
- (void)setLeftThumbstickNoiseBuffer:(float)a3;
- (void)setRightThumbstickAxisSnapRadius:(float)a3;
- (void)setRightThumbstickDeadzoneRadius:(float)a3;
- (void)setRightThumbstickNoiseBuffer:(float)a3;
- (void)stopHaptics;
- (void)updateClientBattery;
- (void)updateIdleState;
@end

@implementation GCGamepadHIDServicePlugin

+ (BOOL)matchService:(unsigned int)a3 options:(id)a4 score:(int64_t *)a5
{
  return 1;
}

- (void)initGameControllerDaemonXPC
{
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v3 = _os_activity_create(&dword_0, "Connect To Daemon", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v3, &state);
  v4 = (NSXPCConnection *)[objc_alloc((Class)NSXPCConnection) initWithMachServiceName:@"com.apple.GameController.gamecontrollerd.driver" options:4096];
  daemonConnection = self->_daemonConnection;
  self->_daemonConnection = v4;

  objc_initWeak(&location, self->_daemonConnection);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_65FC;
  v11[3] = &unk_10570;
  objc_copyWeak(&v12, &location);
  [(NSXPCConnection *)self->_daemonConnection setInvalidationHandler:v11];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_6694;
  v9[3] = &unk_10570;
  objc_copyWeak(&v10, &location);
  [(NSXPCConnection *)self->_daemonConnection setInterruptionHandler:v9];
  v6 = sub_6330();
  [(NSXPCConnection *)self->_daemonConnection setRemoteObjectInterface:v6];

  v7 = sub_6074();
  [(NSXPCConnection *)self->_daemonConnection setExportedInterface:v7];

  [(NSXPCConnection *)self->_daemonConnection setExportedObject:self];
  [(NSXPCConnection *)self->_daemonConnection resume];
  v8 = [(NSXPCConnection *)self->_daemonConnection remoteObjectProxy];
  [v8 driverCheckIn];

  os_activity_scope_leave(&state);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (GCGamepadHIDServicePlugin)initWithService:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v32.receiver = self;
  v32.super_class = (Class)GCGamepadHIDServicePlugin;
  v4 = [(GCGamepadHIDServicePlugin *)&v32 init];
  if (v4)
  {
    v5 = sub_4980();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v3;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "initWithService: %d", buf, 8u);
    }

    v6 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.gamecontroller.serviceplugin", v6);
    internalQueue = v4->_internalQueue;
    v4->_internalQueue = (OS_dispatch_queue *)v7;

    v4->_service = v3;
    IOObjectRetain(v3);
    IORegistryEntryGetRegistryEntryID(v4->_service, &v4->_regID);
    CFProperty = (void *)IORegistryEntryCreateCFProperty(v4->_service, @"Transport", kCFAllocatorDefault, 0);
    id v10 = (void *)IORegistryEntryCreateCFProperty(v4->_service, @"isVirtual", kCFAllocatorDefault, 0);
    v4->_virtualDevice = [v10 BOOLValue];

    v4->_bluetoothClassic = [CFProperty isEqualToString:@"Bluetooth"];
    v4->_usb = [CFProperty isEqualToString:@"USB"];
    v4->_bluetoothLE = [CFProperty isEqualToString:@"BluetoothLowEnergy"];
    [(GCGamepadHIDServicePlugin *)v4 defaultIdleTimeoutDuration];
    v4->_idleTimeoutDuration = v11;
    v4->_lastEventTime = mach_absolute_time();
    id v12 = ($536A88BB5CAE6CA76785073378A79450 *)malloc_type_calloc(3uLL, 1uLL, 0xE13863D3uLL);
    v4->_batteryReport = v12;
    *(_WORD *)&v12->var0 = 25700;
    v13 = (NSString *)IORegistryEntryCreateCFProperty(v4->_service, @"SerialNumber", kCFAllocatorDefault, 0);
    uniqueIdentifier = v4->_uniqueIdentifier;
    v4->_uniqueIdentifier = v13;

    [(GCGamepadHIDServicePlugin *)v4 defaultLeftThumbstickNoiseBuffer];
    v4->_leftThumbstickNoiseBuffer = v15;
    [(GCGamepadHIDServicePlugin *)v4 defaultRightThumbstickNoiseBuffer];
    v4->_rightThumbstickNoiseBuffer = v16;
    [(GCGamepadHIDServicePlugin *)v4 defaultHapticDispatchFrequency];
    v4->_hapticDispatchFrequency = v17;
    uint64_t v18 = [(GCGamepadHIDServicePlugin *)v4 defaultHapticMotors];
    hapticMotors = v4->_hapticMotors;
    v4->_hapticMotors = (NSArray *)v18;

    [(GCGamepadHIDServicePlugin *)v4 defaultLeftThumbstickDeadzoneRadius];
    v4->_leftThumbstickDeadzoneRadius = v20;
    [(GCGamepadHIDServicePlugin *)v4 defaultLeftAxisSnapRadius];
    v4->_leftThumbstickAxisSnapRadius = v21;
    [(GCGamepadHIDServicePlugin *)v4 defaultRightThumbstickDeadzoneRadius];
    v4->_rightThumbstickDeadzoneRadius = v22;
    [(GCGamepadHIDServicePlugin *)v4 defaultRightAxisSnapRadius];
    v4->_rightThumbstickAxisSnapRadius = v23;
    v24 = sub_4980();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t regID = v4->_regID;
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = regID;
      _os_log_impl(&dword_0, v24, OS_LOG_TYPE_DEFAULT, "creating HIDDevice for service %#llx", buf, 0xCu);
    }

    uint64_t v26 = [(GCGamepadHIDServicePlugin *)v4 createHIDDeviceForService:v3];
    device = v4->_device;
    v4->_device = (HIDDevice *)v26;

    if (v4->_device)
    {
      v28 = sub_4980();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v28, OS_LOG_TYPE_DEFAULT, "opening HIDDevice", buf, 2u);
      }

      [(HIDDevice *)v4->_device open];
      if ([(GCGamepadHIDServicePlugin *)v4 isBluetoothClassic])
      {
        v29 = sub_4980();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v29, OS_LOG_TYPE_DEFAULT, "registering for BTSessionCallbacks sessionEvent", buf, 2u);
        }

        *(void *)buf = sub_6B20;
        BTSessionAttachWithQueue();
      }
      [(GCGamepadHIDServicePlugin *)v4 createVirtualHIDDeviceForBattery];
      [(GCGamepadHIDServicePlugin *)v4 setupRawReportHandling];
      [(GCGamepadHIDServicePlugin *)v4 initGameControllerDaemonXPC];
      v30 = v4;
    }
    else
    {
      v30 = 0;
    }
  }
  else
  {
    v30 = 0;
  }

  return v30;
}

- (void)dealloc
{
  uint64_t v3 = sub_4980();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "dealloc", buf, 2u);
  }

  free(self->_batteryReport);
  if (self->_session) {
    BTSessionDetachWithQueue();
  }
  dispatchQueue = self->_dispatchQueue;
  if (dispatchQueue)
  {
    v5 = dispatchQueue;
  }
  else
  {
    v5 = (OS_dispatch_queue *)&_dispatch_main_q;
    id v6 = &_dispatch_main_q;
  }
  *(void *)buf = 0;
  v14 = buf;
  uint64_t v15 = 0x3032000000;
  float v16 = sub_6E7C;
  float v17 = sub_6E8C;
  uint64_t v18 = self->_device;
  device = self->_device;
  self->_device = 0;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_6E94;
  block[3] = &unk_10598;
  v8 = v5;
  float v11 = v8;
  id v12 = buf;
  dispatch_async(v8, block);
  IOObjectRelease(self->_service);

  _Block_object_dispose(buf, 8);
  v9.receiver = self;
  v9.super_class = (Class)GCGamepadHIDServicePlugin;
  [(GCGamepadHIDServicePlugin *)&v9 dealloc];
}

- (NSString)description
{
  return (NSString *)@"GCGamepadHIDServicePlugin";
}

- (id)propertyForKey:(id)a3 client:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEqualToString:@"BatteryCapacity"])
  {
    id v8 = [objc_alloc((Class)NSNumber) initWithInt:self->_batteryReport->var0];
LABEL_17:
    objc_super v9 = v8;
    goto LABEL_18;
  }
  if ([v6 isEqualToString:@"IsPowerSupplyConnected"])
  {
    id v8 = [objc_alloc((Class)NSNumber) initWithBool:self->_batteryReport->var2 != 0];
    goto LABEL_17;
  }
  if ([v6 isEqualToString:@"ServicePluginDebug"])
  {
    objc_super v9 = objc_opt_new();
    id v10 = (objc_class *)objc_opt_class();
    float v11 = NSStringFromClass(v10);
    [v9 setObject:v11 forKeyedSubscript:@"PluginName"];

    if (self->_cancelHandler) {
      id v12 = &__kCFBooleanTrue;
    }
    else {
      id v12 = &__kCFBooleanFalse;
    }
    [v9 setObject:v12 forKeyedSubscript:@"cancelHandler"];
    if (self->_dispatchQueue) {
      v13 = &__kCFBooleanTrue;
    }
    else {
      v13 = &__kCFBooleanFalse;
    }
    [v9 setObject:v13 forKeyedSubscript:@"dispatchQueue"];
    v14 = +[NSNumber numberWithBool:self->_activated];
    [v9 setObject:v14 forKeyedSubscript:@"activated"];

    uint64_t v15 = +[NSNumber numberWithBool:self->_clientAdded];
    [v9 setObject:v15 forKeyedSubscript:@"clientAdded"];

    float v16 = [(GCGamepadHIDServicePlugin *)self propertyForKey:@"BatteryCapacity" client:v7];
    [v9 setObject:v16 forKeyedSubscript:@"BatteryCapacity"];

    float v17 = [(GCGamepadHIDServicePlugin *)self propertyForKey:@"IsPowerSupplyConnected" client:v7];
    [v9 setObject:v17 forKeyedSubscript:@"IsPowerSupplyConnected"];

    goto LABEL_18;
  }
  if ([v6 isEqualToString:@"GameControllerPointer"])
  {
    id v8 = objc_alloc_init((Class)NSMutableDictionary);
    goto LABEL_17;
  }
  if ([v6 isEqualToString:@"InputDelay"])
  {
    id v8 = +[NSNumber numberWithDouble:self->_inputEventDelay];
    goto LABEL_17;
  }
  unsigned int v19 = [v6 isEqualToString:@"DeviceUsagePairs"];
  objc_super v9 = [(HIDDevice *)self->_device propertyForKey:v6];
  if (v19)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      float v20 = +[NSPredicate predicateWithBlock:&stru_105D8];
      uint64_t v21 = [v9 filteredArrayUsingPredicate:v20];

      objc_super v9 = (void *)v21;
    }
  }
LABEL_18:

  return v9;
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4 client:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  if (sub_45DC())
  {
    v13 = sub_4980();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      sub_A460((uint64_t)v7, (uint64_t)v8, v13);
    }
  }
  if ([v8 isEqualToString:@"InputDelay"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v7 doubleValue];
      self->_inputEventDelay = v9;
      unsigned __int8 v10 = 1;
    }
    else
    {
      unsigned __int8 v10 = 0;
    }
  }
  else
  {
    float v11 = [(GCGamepadHIDServicePlugin *)self device];
    unsigned __int8 v10 = [v11 setProperty:v7 forKey:v8];
  }
  return v10;
}

- (id)eventMatching:(id)a3 forClient:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    id v7 = sub_4980();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412546;
      id v13 = v5;
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "eventMatching: %@ client: %@", (uint8_t *)&v12, 0x16u);
    }

    id v8 = [v5 objectForKeyedSubscript:@"EventType"];
    double v9 = v8;
    if (v8)
    {
      if ([v8 unsignedIntValue] == 3) {
        id v8 = [objc_alloc((Class)HIDEvent) initWithType:3 timestamp:1234 senderID:5678];
      }
      else {
        id v8 = 0;
      }
    }
    id v10 = v8;
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (void)setEventDispatcher:(id)a3
{
  id v4 = a3;
  id v5 = sub_4980();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "setEventDispatcher %@", (uint8_t *)&v6, 0xCu);
  }

  objc_storeWeak((id *)&self->_dispatcher, v4);
}

- (void)setCancelHandler:(id)a3
{
  id v4 = a3;
  id v5 = sub_4980();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = objc_retainBlock(v4);
    *(_DWORD *)buf = 134217984;
    id v13 = v6;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "setCancelHandler %p", buf, 0xCu);
  }
  id v7 = objc_retainBlock(v4);
  id cancelHandler = self->_cancelHandler;
  self->_id cancelHandler = v7;

  objc_initWeak((id *)buf, self);
  device = self->_device;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_7828;
  v10[3] = &unk_10570;
  objc_copyWeak(&v11, (id *)buf);
  [(HIDDevice *)device setCancelHandler:v10];
  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

- (void)activate
{
  uint64_t v3 = sub_4980();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "activate", v4, 2u);
  }

  [(HIDDevice *)self->_device activate];
  [(GCGamepadHIDServicePlugin *)self scheduleIdleTimer];
  self->_activated = 1;
}

- (void)cancel
{
  uint64_t v3 = sub_4980();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "cancel", buf, 2u);
  }

  [(NSXPCConnection *)self->_daemonConnection invalidate];
  [(HIDDevice *)self->_device cancel];
  [(HIDDevice *)self->_device close];
  internalQueue = self->_internalQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_7A1C;
  block[3] = &unk_10600;
  void block[4] = self;
  dispatch_async(internalQueue, block);
}

- (void)setDispatchQueue:(id)a3
{
  id v4 = (OS_dispatch_queue *)a3;
  id v5 = sub_4980();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v8 = 134217984;
    double v9 = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "setDispatchQueue %p", (uint8_t *)&v8, 0xCu);
  }

  dispatchQueue = self->_dispatchQueue;
  self->_dispatchQueue = v4;
  id v7 = v4;

  [(HIDDevice *)self->_device setDispatchQueue:self->_dispatchQueue];
}

- (void)clientNotification:(id)a3 added:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = sub_4980();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412546;
    id v10 = v6;
    __int16 v11 = 1024;
    BOOL v12 = v4;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "clientNotification %@ added: %d", (uint8_t *)&v9, 0x12u);
  }

  if (v4) {
    int v8 = v6;
  }
  else {
    int v8 = 0;
  }
  self->_clientAdded = v4;
  objc_storeWeak((id *)&self->_client, v8);
}

- (id)createHIDDeviceForService:(unsigned int)a3
{
  id v3 = [objc_alloc((Class)HIDDevice) initWithService:*(void *)&a3];

  return v3;
}

- (void)disconnect
{
  if ([(GCGamepadHIDServicePlugin *)self isBluetoothClassic])
  {
    id v3 = (void *)IORegistryEntrySearchCFProperty(self->_service, "IOService", @"SerialNumber", kCFAllocatorDefault, 3u);
    BOOL v4 = v3;
    if (self->_session)
    {
      id v5 = [v3 cStringUsingEncoding:1];
      int v6 = BTDeviceAddressFromString();
      if (v6)
      {
        int v7 = v6;
        int v8 = sub_4980();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)float v17 = 136315394;
          *(void *)&v17[4] = v5;
          __int16 v18 = 1024;
          int v19 = v7;
          int v9 = "GCHIDLog::disconnect: unable to get device address from %s; errCode = %d";
          id v10 = v17;
          __int16 v11 = v8;
          uint32_t v12 = 18;
LABEL_16:
          _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, v9, v10, v12);
        }
LABEL_17:

        return;
      }
      *(void *)float v17 = 0;
      int v13 = BTDeviceFromAddress();
      if (v13)
      {
        int v14 = v13;
        int v8 = sub_4980();
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_17;
        }
        *(_DWORD *)buf = 67109120;
        int v21 = v14;
        int v9 = "GCHIDLog::disconnect: unable to get BTDevice; error code = %d";
LABEL_15:
        id v10 = buf;
        __int16 v11 = v8;
        uint32_t v12 = 8;
        goto LABEL_16;
      }
      int v15 = BTDeviceDisconnect();
      int v8 = sub_4980();
      BOOL v16 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
      if (v15)
      {
        if (!v16) {
          goto LABEL_17;
        }
        *(_DWORD *)buf = 67109120;
        int v21 = v15;
        int v9 = "GCHIDLog::disconnect: error code = %d";
        goto LABEL_15;
      }
      if (!v16) {
        goto LABEL_17;
      }
      *(_WORD *)buf = 0;
      int v9 = "GCHIDLog::disconnect: SUCCESS";
      id v10 = buf;
    }
    else
    {
      int v8 = sub_4980();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_17;
      }
      *(_WORD *)float v17 = 0;
      int v9 = "GCHIDLog::disconnect: unable to get BTDevice; no valid BTSession";
      id v10 = v17;
    }
    __int16 v11 = v8;
    uint32_t v12 = 2;
    goto LABEL_16;
  }
}

- (void)createVirtualHIDDeviceForBattery
{
  if ([(GCGamepadHIDServicePlugin *)self shouldCreateBatteryDevice])
  {
    id v3 = sub_4980();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "creating battery device", (uint8_t *)&v16, 2u);
    }

    BOOL v4 = +[NSMutableDictionary dictionary];
    id v5 = sub_4C80();
    [v4 setObject:v5 forKeyedSubscript:@"ReportDescriptor"];
    int v6 = +[NSNumber numberWithUnsignedLongLong:self->_regID];
    [v4 setObject:v6 forKeyedSubscript:@"PhysicalDeviceUniqueID"];

    int v7 = +[NSNumber numberWithUnsignedLongLong:self->_regID];
    [v4 setObject:v7 forKeyedSubscript:@"SerialNumber"];

    CFProperty = (void *)IORegistryEntryCreateCFProperty(self->_service, @"Transport", kCFAllocatorDefault, 0);
    [v4 setObject:CFProperty forKeyedSubscript:@"Transport"];

    int v9 = (void *)IORegistryEntryCreateCFProperty(self->_service, @"ProductID", kCFAllocatorDefault, 0);
    [v4 setObject:v9 forKeyedSubscript:@"ProductID"];

    id v10 = (void *)IORegistryEntryCreateCFProperty(self->_service, @"VendorID", kCFAllocatorDefault, 0);
    [v4 setObject:v10 forKeyedSubscript:@"VendorID"];

    __int16 v11 = (void *)IORegistryEntryCreateCFProperty(self->_service, @"Product", kCFAllocatorDefault, 0);
    [v4 setObject:v11 forKeyedSubscript:@"Product"];

    [v4 setObject:&off_10E00 forKeyedSubscript:@"GameControllerType"];
    uint32_t v12 = (HIDUserDevice *)[objc_alloc((Class)HIDUserDevice) initWithProperties:v4];
    batteryUserDevice = self->_batteryUserDevice;
    self->_batteryUserDevice = v12;

    int v14 = sub_4980();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = self->_batteryUserDevice;
      int v16 = 138412546;
      float v17 = v15;
      __int16 v18 = 2112;
      int v19 = v4;
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "created battery device %@ with properties %@", (uint8_t *)&v16, 0x16u);
    }
  }
}

- (void)updateClientBattery
{
  if (self->_batteryReport)
  {
    id v3 = sub_4980();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int var0 = self->_batteryReport->var0;
      v5[0] = 67109120;
      v5[1] = var0;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "updateClientBattery reporting battery level %d%%", (uint8_t *)v5, 8u);
    }

    [(GCBatteryServiceClientInterface *)self->_batteryClient updateBattery:self->_batteryReport->var0 isCharging:self->_batteryReport->var2 != 0];
  }
}

- (void)sendBatteryReport
{
  [(GCGamepadHIDServicePlugin *)self updateClientBattery];
  if (self->_batteryUserDevice)
  {
    id v3 = sub_4980();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int var0 = self->_batteryReport->var0;
      v6[0] = 67109120;
      v6[1] = var0;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "updateBatteryStats reporting battery level %d%%", (uint8_t *)v6, 8u);
    }

    id v5 = +[NSData dataWithBytesNoCopy:self->_batteryReport length:3 freeWhenDone:0];
    [(HIDUserDevice *)self->_batteryUserDevice handleReport:v5 error:0];
  }
}

- (BOOL)shouldCreateBatteryDevice
{
  return 1;
}

- (void)scheduleIdleTimer
{
  id v3 = sub_4980();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "scheduleIdleTimer", buf, 2u);
  }

  internalQueue = self->_internalQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_8408;
  block[3] = &unk_10600;
  void block[4] = self;
  dispatch_async(internalQueue, block);
}

- (void)updateIdleState
{
  if ([(GCGamepadHIDServicePlugin *)self isIdle]
    && [(GCGamepadHIDServicePlugin *)self shouldDisconnectWhenIdle])
  {
    dispatch_source_cancel((dispatch_source_t)self->_idleDispatchSource);
    idleDispatchSource = self->_idleDispatchSource;
    self->_idleDispatchSource = 0;

    BOOL v4 = sub_4980();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "disconnectIfIdle disconnecting...", v5, 2u);
    }

    [(GCGamepadHIDServicePlugin *)self disconnect];
  }
}

- (BOOL)isIdle
{
  unint64_t v3 = [(GCGamepadHIDServicePlugin *)self lastEventTime];
  uint64_t v4 = mach_absolute_time() - v3;
  if (qword_16EC8 != -1) {
    dispatch_once(&qword_16EC8, &stru_10620);
  }
  float v5 = (float)(v4 * dword_16ED0 / *(unsigned int *)algn_16ED4) / 1000000000.0;
  float idleTimeoutDuration = self->_idleTimeoutDuration;
  int v7 = sub_4980();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v8 = &stru_10868;
    if (v5 > idleTimeoutDuration) {
      CFStringRef v8 = @" - will disconnect if permitted";
    }
    int v10 = 134218242;
    double v11 = v5;
    __int16 v12 = 2112;
    CFStringRef v13 = v8;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "isIdle for %.2f seconds%@", (uint8_t *)&v10, 0x16u);
  }

  return v5 > idleTimeoutDuration;
}

- (BOOL)shouldDisconnectWhenIdle
{
  return 0;
}

- (id)createEvent:(unsigned int)a3 timestamp:(unint64_t)a4
{
  id v4 = [objc_alloc((Class)HIDEvent) initWithType:*(void *)&a3 timestamp:a4 senderID:self->_regID];

  return v4;
}

- (void)dispatchEvent:(id)a3
{
}

- (void)dispatchIdleEvent:(id)a3
{
}

- (void)dispatchEvent:(id)a3 withInputDelay:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  int v7 = v6;
  if (v4 && self->_inputEventDelay > 0.0)
  {
    [v6 timestamp];
    [v7 type];
    kdebug_trace();
    dispatch_time_t v8 = dispatch_time(0, (uint64_t)(self->_inputEventDelay * 1000000000.0));
    int v9 = [(GCGamepadHIDServicePlugin *)self dispatchQueue];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_8908;
    v10[3] = &unk_10648;
    void v10[4] = self;
    id v11 = v7;
    dispatch_after(v8, v9, v10);
  }
  else
  {
    [(GCGamepadHIDServicePlugin *)self dispatchEvent:v6];
  }
}

- (void)dispatchIdleEvent:(id)a3 withInputDelay:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  int v7 = v6;
  if (v4 && self->_inputEventDelay > 0.0)
  {
    [v6 timestamp];
    [v7 type];
    kdebug_trace();
    dispatch_time_t v8 = dispatch_time(0, (uint64_t)(self->_inputEventDelay * 1000000000.0));
    int v9 = [(GCGamepadHIDServicePlugin *)self dispatchQueue];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_8A44;
    v10[3] = &unk_10648;
    void v10[4] = self;
    id v11 = v7;
    dispatch_after(v8, v9, v10);
  }
  else
  {
    [(GCGamepadHIDServicePlugin *)self dispatchIdleEvent:v6];
  }
}

- (void)applyDeadzone:(float)a3 axisSnapRadius:(float)a4 input:
{
  v5.f32[0] = fabsf(COERCE_FLOAT(*v4));
  float32x2_t v6 = (float32x2_t)vdup_lane_s32(vcgt_f32(*(float32x2_t *)&a4, v5), 0);
  v7.i32[1] = HIDWORD(*(unint64_t *)v4);
  v7.i32[0] = 0;
  int8x8_t v8 = vbsl_s8((int8x8_t)v6, v7, *v4);
  v6.f32[0] = fabsf(*(float *)&v8.i32[1]);
  float32x2_t v9 = (float32x2_t)vbsl_s8((int8x8_t)vdup_lane_s32(vcgt_f32(*(float32x2_t *)&a4, v6), 0), (int8x8_t)v8.u32[0], v8);
  float32x2_t v10 = vmul_f32(v9, v9);
  float v11 = sqrtf(vaddv_f32(v10));
  float32x2_t v12 = 0;
  if (v11 > a3)
  {
    unsigned __int32 v13 = vadd_f32(v10, (float32x2_t)vdup_lane_s32((int32x2_t)v10, 1)).u32[0];
    float v14 = v11 - a3;
    float32x2_t v15 = vrsqrte_f32((float32x2_t)v13);
    float32x2_t v16 = vmul_f32(v15, vrsqrts_f32((float32x2_t)v13, vmul_f32(v15, v15)));
    *(float *)v17.i32 = 1.0 - a3;
    float32x2_t v18 = vdiv_f32(vmul_n_f32(vmul_n_f32(v9, vmul_f32(v16, vrsqrts_f32((float32x2_t)v13, vmul_f32(v16, v16))).f32[0]), v14), (float32x2_t)vdup_lane_s32(v17, 0));
    __asm { FMOV            V1.2S, #1.0 }
    float32x2_t v24 = vminnm_f32(v18, _D1);
    __asm { FMOV            V1.2S, #-1.0 }
    float32x2_t v12 = vmaxnm_f32(v24, _D1);
  }
  int8x8_t *v4 = (int8x8_t)v12;
}

- (BOOL)isTwoAxisInputIdle:(GCGamepadHIDServicePlugin *)self prevInput:(SEL)a2 noiseBuffer:
{
  float32x2_t v5 = *v2;
  BOOL v6 = COERCE_FLOAT(HIDWORD(*(unint64_t *)v3)) == 0.0;
  if (COERCE_FLOAT(*v3) != 0.0) {
    BOOL v6 = 0;
  }
  if (COERCE_FLOAT(HIDWORD(*(unint64_t *)v2)) != 0.0) {
    BOOL v6 = 1;
  }
  BOOL v7 = v5.f32[0] != 0.0 || v6;
  float32x2_t v8 = vsub_f32(v5, *v3);
  return sqrtf(vaddv_f32(vmul_f32(v8, v8))) < v4 && v7;
}

- (void)dispatchMotionEventWithState:(id *)a3 timestamp:(unint64_t)a4
{
  if (a3->var0 || a3->var4 || a3->var8)
  {
    id v10 = [(GCGamepadHIDServicePlugin *)self createEvent:1 timestamp:a4];
    [v10 setIntegerValue:65280 forField:0x10000];
    [v10 setIntegerValue:59 forField:65537];
    [v10 setIntegerValue:1 forField:65538];
    if (a3->var0)
    {
      BOOL v7 = [(GCGamepadHIDServicePlugin *)self createEvent:20 timestamp:a4];
      IOHIDEventSetEventFlags();
      [v7 setDoubleValue:1310720 forField:a3->var1];
      [v7 setDoubleValue:1310721 forField:a3->var2];
      [v7 setDoubleValue:1310722 forField:a3->var3];
      [v7 setIntegerValue:self->_motionSequenceNumber forField:1310725];
      IOHIDEventAppendEvent();
    }
    if (a3->var4)
    {
      float32x2_t v8 = [(GCGamepadHIDServicePlugin *)self createEvent:13 timestamp:a4];
      IOHIDEventSetEventFlags();
      [v8 setDoubleValue:851968 forField:a3->var5];
      [v8 setDoubleValue:851969 forField:a3->var6];
      [v8 setDoubleValue:851970 forField:a3->var7];
      [v8 setIntegerValue:self->_motionSequenceNumber forField:851973];
      IOHIDEventAppendEvent();
    }
    if (a3->var8)
    {
      mach_absolute_time();
      QuaternionOrientationEvent = (void *)IOHIDEventCreateQuaternionOrientationEvent();
      IOHIDEventAppendEvent();
    }
    ++self->_motionSequenceNumber;
    [(GCGamepadHIDServicePlugin *)self dispatchIdleEvent:v10 withInputDelay:1];
  }
}

- (void)dispatchGameControllerExtendedEventWithState:(id *)a3 timestamp:(unint64_t)a4 children:(id)a5
{
  id v8 = a5;
  float64x2_t v9 = vcvtq_f64_f32(*(float32x2_t *)&a3->var1[2]);
  float64x2_t v51 = vcvtq_f64_f32(*(float32x2_t *)a3->var1);
  float64x2_t v52 = v9;
  float64x2_t v10 = vcvtq_f64_f32(*(float32x2_t *)&a3->var1[6]);
  float64x2_t v53 = vcvtq_f64_f32(*(float32x2_t *)&a3->var1[4]);
  float64x2_t v54 = v10;
  float64x2_t v11 = vcvtq_f64_f32(*(float32x2_t *)&a3->var1[18]);
  float64x2_t v55 = vcvtq_f64_f32(*(float32x2_t *)&a3->var1[8]);
  float64x2_t v56 = v11;
  v12.i32[0] = LODWORD(a3->var1[10]);
  v12.i32[1] = LODWORD(a3->var1[13]);
  int32x2_t v13 = (int32x2_t)vsub_f32(v12, *(float32x2_t *)&a3->var1[11]);
  *(float *)v11.f64 = a3->var1[14];
  float32x2_t v14 = *(float32x2_t *)&a3->var1[15];
  HIDWORD(v11.f64[0]) = LODWORD(a3->var1[17]);
  uint64_t v58 = 0;
  double v15 = COERCE_DOUBLE(vrev64_s32(v13));
  *(int32x2_t *)&v11.f64[0] = vrev64_s32((int32x2_t)vsub_f32(*(float32x2_t *)&v11.f64[0], v14));
  *(double *)&long long v57 = v15;
  *((void *)&v57 + 1) = *(void *)&v11.f64[0];
  *(float *)v11.f64 = a3->var1[21];
  LOBYTE(v58) = a3->var1[20] != 0.0;
  BYTE1(v58) = *(float *)v11.f64 != 0.0;
  *(float *)&double v15 = self->_leftThumbstickDeadzoneRadius;
  *(float *)v11.f64 = self->_leftThumbstickAxisSnapRadius;
  [(GCGamepadHIDServicePlugin *)self applyDeadzone:&v57 axisSnapRadius:v15 input:v11.f64[0]];
  *(float *)&double v16 = self->_rightThumbstickDeadzoneRadius;
  *(float *)&double v17 = self->_rightThumbstickAxisSnapRadius;
  [(GCGamepadHIDServicePlugin *)self applyDeadzone:(char *)&v57 + 8 axisSnapRadius:v16 input:v17];
  *(float *)&double v18 = self->_leftThumbstickNoiseBuffer;
  unsigned __int8 v19 = [(GCGamepadHIDServicePlugin *)self isTwoAxisInputIdle:&v57 prevInput:self->_anon_98 noiseBuffer:v18];
  *(float *)&double v20 = self->_rightThumbstickNoiseBuffer;
  unsigned __int8 v21 = [(GCGamepadHIDServicePlugin *)self isTwoAxisInputIdle:(char *)&v57 + 8 prevInput:&self->_anon_98[8] noiseBuffer:v20];
  if ((v19 & 1) == 0) {
    a3->var0 |= 0x3C00uLL;
  }
  if ((v21 & 1) == 0) {
    a3->var0 |= 0x3C000uLL;
  }
  for (uint64_t i = 0; i != 47; ++i)
  {
    if ((i - 10) >= 8 && a3->var1[i] != self->_gameControllerExtendedState.buttons[i]) {
      a3->var0 |= 1 << i;
    }
  }
  if (a3->var0)
  {
    float v23 = [(GCGamepadHIDServicePlugin *)self createEvent:35 timestamp:a4];
    [v23 setDoubleValue:2293761 forField:v51.f64[0]];
    [v23 setDoubleValue:2293762 forField:v51.f64[1]];
    [v23 setDoubleValue:2293763 forField:v52.f64[0]];
    [v23 setDoubleValue:2293764 forField:v52.f64[1]];
    [v23 setDoubleValue:2293767 forField:v54.f64[0]];
    [v23 setDoubleValue:2293768 forField:v54.f64[1]];
    [v23 setDoubleValue:2293765 forField:v53.f64[0]];
    [v23 setDoubleValue:2293766 forField:v53.f64[1]];
    [v23 setDoubleValue:2293769 forField:v55.f64[0]];
    [v23 setDoubleValue:2293771 forField:v56.f64[0]];
    [v23 setIntegerValue:v58 forField:2293777];
    [v23 setDoubleValue:2293770 forField:v55.f64[1]];
    [v23 setDoubleValue:2293772 forField:v56.f64[1]];
    [v23 setIntegerValue:BYTE1(v58) forField:2293778];
    [v23 setDoubleValue:2293773 forField:*(float *)&v57];
    [v23 setDoubleValue:2293774 forField:*((float *)&v57 + 1)];
    [v23 setDoubleValue:2293775 forField:*((float *)&v57 + 2)];
    [v23 setDoubleValue:2293776 forField:*((float *)&v57 + 3)];
    [v23 setIntegerValue:HIDWORD(v58) forField:2293760];
    v24.i32[0] = v57;
    int32x2_t v25 = *(int32x2_t *)((char *)&v57 + 8);
    float32x2_t v26 = (float32x2_t)vrev64_s32(*(int32x2_t *)&v57);
    a3->var1[10] = fmaxf(*((float *)&v57 + 1), 0.0);
    *(int8x8_t *)&a3->var1[11] = vand_s8((int8x8_t)vneg_f32(v26), (int8x8_t)vcltz_f32(v26));
    v24.i32[1] = v25.i32[1];
    float32x2_t v27 = (float32x2_t)vrev64_s32(v25);
    *(float32x2_t *)&a3->var1[13] = vmaxnm_f32(v24, 0);
    *(int8x8_t *)&a3->var1[15] = vand_s8((int8x8_t)vneg_f32(v27), (int8x8_t)vcltz_f32(v27));
    a3->var1[17] = fmaxf(*(float *)v25.i32, 0.0);
    mach_absolute_time();
    VendorDefinedEvent = (const void *)IOHIDEventCreateVendorDefinedEvent();
    IOHIDEventSetIntegerValue();
    IOHIDEventSetIntegerValue();
    IOHIDEventAppendEvent();
    if (VendorDefinedEvent) {
      CFRelease(VendorDefinedEvent);
    }
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v29 = v8;
    id v30 = [v29 countByEnumeratingWithState:&v47 objects:v59 count:16];
    if (v30)
    {
      id v31 = v30;
      uint64_t v32 = *(void *)v48;
      do
      {
        for (j = 0; j != v31; j = (char *)j + 1)
        {
          if (*(void *)v48 != v32) {
            objc_enumerationMutation(v29);
          }
          objc_msgSend(v23, "appendEvent:", *(void *)(*((void *)&v47 + 1) + 8 * (void)j), (void)v47);
        }
        id v31 = [v29 countByEnumeratingWithState:&v47 objects:v59 count:16];
      }
      while (v31);
    }

    [(GCGamepadHIDServicePlugin *)self dispatchEvent:v23 withInputDelay:1];
    float64x2_t v34 = v52;
    *(float64x2_t *)&self->_gameControllerState.directionPadUp = v51;
    *(float64x2_t *)&self->_gameControllerState.directionPadLeft = v34;
    float64x2_t v35 = v54;
    *(float64x2_t *)&self->_gameControllerState.buttonA = v53;
    *(float64x2_t *)&self->_gameControllerState.buttonX = v35;
    *(void *)&self->_anon_98[16] = v58;
    long long v36 = v57;
    float64x2_t v37 = v55;
    *(float64x2_t *)&self->_gameControllerState.buttonL2 = v56;
    *(_OWORD *)self->_anon_98 = v36;
    *(float64x2_t *)&self->_gameControllerState.buttonL1 = v37;
    *(_OWORD *)&self->_gameControllerExtendedState.mask = *(_OWORD *)&a3->var0;
    long long v38 = *(_OWORD *)&a3->var1[2];
    long long v39 = *(_OWORD *)&a3->var1[6];
    long long v40 = *(_OWORD *)&a3->var1[14];
    *(_OWORD *)&self->_gameControllerExtendedState.buttons[10] = *(_OWORD *)&a3->var1[10];
    *(_OWORD *)&self->_gameControllerExtendedState.buttons[14] = v40;
    *(_OWORD *)&self->_gameControllerExtendedState.buttons[2] = v38;
    *(_OWORD *)&self->_gameControllerExtendedState.buttons[6] = v39;
    long long v41 = *(_OWORD *)&a3->var1[18];
    long long v42 = *(_OWORD *)&a3->var1[22];
    long long v43 = *(_OWORD *)&a3->var1[30];
    *(_OWORD *)&self->_gameControllerExtendedState.buttons[26] = *(_OWORD *)&a3->var1[26];
    *(_OWORD *)&self->_gameControllerExtendedState.buttons[30] = v43;
    *(_OWORD *)&self->_gameControllerExtendedState.buttons[18] = v41;
    *(_OWORD *)&self->_gameControllerExtendedState.buttons[22] = v42;
    long long v44 = *(_OWORD *)&a3->var1[34];
    long long v45 = *(_OWORD *)&a3->var1[38];
    long long v46 = *(_OWORD *)&a3->var1[42];
    *(void *)&self->_gameControllerExtendedState.buttons[46] = *(void *)&a3->var1[46];
    *(_OWORD *)&self->_gameControllerExtendedState.buttons[38] = v45;
    *(_OWORD *)&self->_gameControllerExtendedState.buttons[42] = v46;
    *(_OWORD *)&self->_gameControllerExtendedState.buttons[34] = v44;
  }
}

- (void)dispatchGameControllerExtendedEventWithState:(id *)a3 timestamp:(unint64_t)a4
{
  long long v4 = *(_OWORD *)&a3->var1[42];
  v10[10] = *(_OWORD *)&a3->var1[38];
  v10[11] = v4;
  uint64_t v11 = *(void *)&a3->var1[46];
  long long v5 = *(_OWORD *)&a3->var1[26];
  v10[6] = *(_OWORD *)&a3->var1[22];
  v10[7] = v5;
  long long v6 = *(_OWORD *)&a3->var1[34];
  v10[8] = *(_OWORD *)&a3->var1[30];
  v10[9] = v6;
  long long v7 = *(_OWORD *)&a3->var1[10];
  v10[2] = *(_OWORD *)&a3->var1[6];
  v10[3] = v7;
  long long v8 = *(_OWORD *)&a3->var1[18];
  void v10[4] = *(_OWORD *)&a3->var1[14];
  void v10[5] = v8;
  long long v9 = *(_OWORD *)&a3->var1[2];
  v10[0] = *(_OWORD *)&a3->var0;
  v10[1] = v9;
  [(GCGamepadHIDServicePlugin *)self dispatchGameControllerExtendedEventWithState:v10 timestamp:a4 children:0];
}

- (void)dispatchHomeButtonEventWithValue:(BOOL)a3 timestamp:(unint64_t)a4
{
  if (self->_buttonHome != a3)
  {
    BOOL v4 = a3;
    id v6 = [(GCGamepadHIDServicePlugin *)self createEvent:3 timestamp:a4];
    IOHIDEventSetEventFlags();
    [v6 setIntegerValue:12 forField:196608];
    [v6 setIntegerValue:547 forField:196609];
    [v6 setIntegerValue:v4 forField:196610];
    [v6 setIntegerValue:1 forField:196612];
    [(GCGamepadHIDServicePlugin *)self dispatchEvent:v6 withInputDelay:1];
    self->_buttonHome = v4;
  }
}

- (void)dispatchMenuButtonEventWithValue:(BOOL)a3 timestamp:(unint64_t)a4
{
  if (self->_buttonMenu != a3)
  {
    BOOL v4 = a3;
    id v6 = [(GCGamepadHIDServicePlugin *)self createEvent:3 timestamp:a4];
    IOHIDEventSetEventFlags();
    [v6 setIntegerValue:12 forField:196608];
    [v6 setIntegerValue:516 forField:196609];
    [v6 setIntegerValue:v4 forField:196610];
    [v6 setIntegerValue:1 forField:196612];
    [(GCGamepadHIDServicePlugin *)self dispatchEvent:v6 withInputDelay:1];
    self->_buttonMenu = v4;
  }
}

- (void)dispatchOptionsButtonEventWithValue:(BOOL)a3 timestamp:(unint64_t)a4
{
  if (self->_buttonOptions != a3)
  {
    BOOL v4 = a3;
    id v6 = [(GCGamepadHIDServicePlugin *)self createEvent:3 timestamp:a4];
    IOHIDEventSetEventFlags();
    [v6 setIntegerValue:12 forField:196608];
    [v6 setIntegerValue:521 forField:196609];
    [v6 setIntegerValue:v4 forField:196610];
    [v6 setIntegerValue:1 forField:196612];
    [(GCGamepadHIDServicePlugin *)self dispatchEvent:v6 withInputDelay:1];
    self->_buttonOptions = v4;
  }
}

- (void)dispatchSearchButtonEventWithValue:(BOOL)a3 timestamp:(unint64_t)a4
{
  if (self->_buttonSearch != a3)
  {
    BOOL v4 = a3;
    id v6 = [(GCGamepadHIDServicePlugin *)self createEvent:3 timestamp:a4];
    IOHIDEventSetEventFlags();
    [v6 setIntegerValue:12 forField:196608];
    [v6 setIntegerValue:545 forField:196609];
    [v6 setIntegerValue:v4 forField:196610];
    [v6 setIntegerValue:1 forField:196612];
    [(GCGamepadHIDServicePlugin *)self dispatchEvent:v6 withInputDelay:1];
    self->_buttonSearch = v4;
  }
}

- (void)dispatchShareButtonEventWithValue:(BOOL)a3 timestamp:(unint64_t)a4
{
  if (self->_buttonShare != a3)
  {
    BOOL v4 = a3;
    id v6 = [(GCGamepadHIDServicePlugin *)self createEvent:3 timestamp:a4];
    IOHIDEventSetEventFlags();
    [v6 setIntegerValue:12 forField:196608];
    [v6 setIntegerValue:178 forField:196609];
    [v6 setIntegerValue:v4 forField:196610];
    [v6 setIntegerValue:1 forField:196612];
    [(GCGamepadHIDServicePlugin *)self dispatchEvent:v6 withInputDelay:1];
    self->_buttonShare = v4;
  }
}

- (BOOL)isAnyHapticMotorEnabled
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v2 = [(GCGamepadHIDServicePlugin *)self hapticMotors];
  id v3 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v16;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v16 != v5) {
        objc_enumerationMutation(v2);
      }
      long long v7 = *(void **)(*((void *)&v15 + 1) + 8 * v6);
      [v7 frequency];
      if (v8 <= 0.0)
      {
        BOOL v9 = 0;
      }
      else if ([v7 features])
      {
        [v7 amplitude];
        BOOL v9 = v10 > 0.0;
      }
      else
      {
        BOOL v9 = 1;
      }
      uint64_t v11 = [v7 queuedTransients];
      id v12 = [v11 count];

      BOOL v13 = 1;
      if (v9 || v12) {
        break;
      }
      if (v4 == (id)++v6)
      {
        id v4 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v4) {
          goto LABEL_3;
        }
        goto LABEL_15;
      }
    }
  }
  else
  {
LABEL_15:
    BOOL v13 = 0;
  }

  return v13;
}

- (BOOL)isHapticsActive
{
  return self->_hapticsActive;
}

- (unsigned)numberOfTimesToSendZeroHapticReport
{
  return 1;
}

- (void)stopHaptics
{
  if (self->_hapticsActive)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v3 = [(GCGamepadHIDServicePlugin *)self hapticMotors];
    id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v5; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v3);
          }
          float v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          [v8 setFrequency:0.0];
          [v8 setAmplitude:0.0];
        }
        id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v5);
    }

    if (!self->_pendingHapticZeroReports) {
      self->_pendingHapticZeroReports = [(GCGamepadHIDServicePlugin *)self numberOfTimesToSendZeroHapticReport];
    }
    [(GCGamepadHIDServicePlugin *)self dispatchHapticEvent];
    int v9 = self->_pendingHapticZeroReports - 1;
    self->_pendingHapticZeroReports = v9;
    if (!v9)
    {
      self->_hapticsActive = 0;
      dispatch_source_cancel((dispatch_source_t)self->_hapticDispatchSource);
      hapticDispatchSource = self->_hapticDispatchSource;
      self->_hapticDispatchSource = 0;
    }
  }
}

- (BOOL)updateHapticMotor:(id)a3
{
  id v4 = a3;
  if (([v4 index] & 0x80000000) == 0)
  {
    signed int v5 = [v4 index];
    uint64_t v6 = [(GCGamepadHIDServicePlugin *)self hapticMotors];
    id v7 = [v6 count];

    if ((unint64_t)v7 > v5)
    {
      float v8 = [(GCGamepadHIDServicePlugin *)self hapticMotors];
      int v9 = objc_msgSend(v8, "objectAtIndex:", (int)objc_msgSend(v4, "index"));

      [v9 applyValuesFrom:v4];
    }
  }

  return 1;
}

- (void)enableHaptics
{
  objc_initWeak(&location, self);
  internalQueue = self->_internalQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_9B9C;
  v4[3] = &unk_10570;
  objc_copyWeak(&v5, &location);
  dispatch_async(internalQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (float)defaultLeftThumbstickNoiseBuffer
{
  return 0.0;
}

- (float)defaultRightThumbstickNoiseBuffer
{
  return 0.0;
}

- (float)defaultIdleTimeoutDuration
{
  return 900.0;
}

- (float)defaultLeftThumbstickDeadzoneRadius
{
  return 0.125;
}

- (float)defaultRightThumbstickDeadzoneRadius
{
  return 0.125;
}

- (float)defaultLeftAxisSnapRadius
{
  return 0.0;
}

- (float)defaultRightAxisSnapRadius
{
  return 0.0;
}

- (id)defaultHapticMotors
{
  return +[NSArray array];
}

- (float)defaultHapticDispatchFrequency
{
  return 0.015;
}

- (void)fetchDeviceRegistryIDWithReply:(id)a3
{
  if (self) {
    unint64_t regID = self->_regID;
  }
  else {
    unint64_t regID = 0;
  }
  id v5 = a3;
  id v6 = +[NSNumber numberWithUnsignedLongLong:regID];
  (*((void (**)(id, id, void))a3 + 2))(v5, v6, 0);
}

- (void)setHapticMotor:(unint64_t)a3 frequency:(float)a4 amplitude:(float)a5
{
  int v9 = [GCHapticMotor alloc];
  *(float *)&double v10 = a4;
  *(float *)&double v11 = a5;
  long long v12 = [(GCHapticMotor *)v9 initWithIndex:a3 name:0 features:1 frequency:v10 amplitude:v11];
  [(GCGamepadHIDServicePlugin *)self updateHapticMotor:v12];
}

- (void)enqueueTransient:(id)a3 hapticMotor:(unint64_t)a4
{
  id v10 = a3;
  id v6 = [(GCGamepadHIDServicePlugin *)self hapticMotors];
  id v7 = [v6 count];

  if ((unint64_t)v7 > a4)
  {
    float v8 = [(GCGamepadHIDServicePlugin *)self hapticMotors];
    int v9 = [v8 objectAtIndex:a4];

    [v9 enqueueHapticTransientEvent:v10];
  }
}

- (void)connectToNintendoJoyConFusionGestureServiceWithClient:(id)a3 reply:(id)a4
{
}

- (void)connectToLightServiceWithClient:(id)a3 reply:(id)a4
{
}

- (void)connectToAdaptiveTriggersServiceWithClient:(id)a3 reply:(id)a4
{
}

- (void)connectToMotionServiceWithClient:(id)a3 reply:(id)a4
{
}

- (void)connectToBatteryServiceWithClient:(id)a3 reply:(id)a4
{
  id v6 = (GCBatteryServiceClientInterface *)a3;
  id v7 = (void (**)(id, GCGamepadHIDServicePlugin *, void))a4;
  float v8 = sub_4980();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v10 = 138412290;
    double v11 = v6;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "connectToBatteryServiceWithClient %@", (uint8_t *)&v10, 0xCu);
  }

  batteryClient = self->_batteryClient;
  self->_batteryClient = v6;

  v7[2](v7, self, 0);
}

- (void)connectToGameIntentServiceWithClient:(id)a3 reply:(id)a4
{
}

- (void)connectToGenericDeviceDriverConfigurationServiceWithClient:(id)a3 reply:(id)a4
{
}

- (void)readBatteryWithReply:(id)a3
{
  id v5 = a3;
  if ([(GCGamepadHIDServicePlugin *)self batteryReport]
    && *(unsigned char *)[(GCGamepadHIDServicePlugin *)self batteryReport])
  {
    [(GCGamepadHIDServicePlugin *)self batteryReport];
    [(GCGamepadHIDServicePlugin *)self batteryReport];
    id v4 = (void (*)(void))v5[2];
  }
  else
  {
    id v4 = (void (*)(void))v5[2];
  }
  v4();
}

- (HIDConnection)client
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_client);

  return (HIDConnection *)WeakRetained;
}

- (void)setClient:(id)a3
{
}

- (HIDEventDispatcher)dispatcher
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dispatcher);

  return (HIDEventDispatcher *)WeakRetained;
}

- (void)setDispatcher:(id)a3
{
}

- (unsigned)service
{
  return self->_service;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (HIDDevice)device
{
  return self->_device;
}

- (HIDUserDevice)batteryUserDevice
{
  return self->_batteryUserDevice;
}

- (unint64_t)lastEventTime
{
  return self->_lastEventTime;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- ($536A88BB5CAE6CA76785073378A79450)batteryReport
{
  return self->_batteryReport;
}

- (BOOL)isBluetoothClassic
{
  return self->_bluetoothClassic;
}

- (BOOL)isUSB
{
  return self->_usb;
}

- (BOOL)isBluetoothLE
{
  return self->_bluetoothLE;
}

- (BOOL)isVirtualDevice
{
  return self->_virtualDevice;
}

- (float)idleTimeoutDuration
{
  return self->_idleTimeoutDuration;
}

- (void)setIdleTimeoutDuration:(float)a3
{
  self->_float idleTimeoutDuration = a3;
}

- (float)leftThumbstickNoiseBuffer
{
  return self->_leftThumbstickNoiseBuffer;
}

- (void)setLeftThumbstickNoiseBuffer:(float)a3
{
  self->_leftThumbstickNoiseBuffer = a3;
}

- (float)rightThumbstickNoiseBuffer
{
  return self->_rightThumbstickNoiseBuffer;
}

- (void)setRightThumbstickNoiseBuffer:(float)a3
{
  self->_rightThumbstickNoiseBuffer = a3;
}

- (float)hapticDispatchFrequency
{
  return self->_hapticDispatchFrequency;
}

- (void)setHapticDispatchFrequency:(float)a3
{
  self->_hapticDispatchFrequency = a3;
}

- (NSArray)hapticMotors
{
  return self->_hapticMotors;
}

- (void)setHapticMotors:(id)a3
{
}

- (float)leftThumbstickDeadzoneRadius
{
  return self->_leftThumbstickDeadzoneRadius;
}

- (void)setLeftThumbstickDeadzoneRadius:(float)a3
{
  self->_leftThumbstickDeadzoneRadius = a3;
}

- (float)leftThumbstickAxisSnapRadius
{
  return self->_leftThumbstickAxisSnapRadius;
}

- (void)setLeftThumbstickAxisSnapRadius:(float)a3
{
  self->_leftThumbstickAxisSnapRadius = a3;
}

- (float)rightThumbstickDeadzoneRadius
{
  return self->_rightThumbstickDeadzoneRadius;
}

- (void)setRightThumbstickDeadzoneRadius:(float)a3
{
  self->_rightThumbstickDeadzoneRadius = a3;
}

- (float)rightThumbstickAxisSnapRadius
{
  return self->_rightThumbstickAxisSnapRadius;
}

- (void)setRightThumbstickAxisSnapRadius:(float)a3
{
  self->_rightThumbstickAxisSnapRadius = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hapticMotors, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_batteryUserDevice, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_destroyWeak((id *)&self->_dispatcher);
  objc_destroyWeak((id *)&self->_client);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_batteryClient, 0);
  objc_storeStrong((id *)&self->_daemonConnection, 0);
  objc_storeStrong((id *)&self->_hapticDispatchSource, 0);
  objc_storeStrong((id *)&self->_idleDispatchSource, 0);
  objc_storeStrong((id *)&self->_prop, 0);

  objc_storeStrong(&self->_cancelHandler, 0);
}

@end