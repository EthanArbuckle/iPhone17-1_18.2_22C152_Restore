@interface MacTrackpadBridge
- (MacTrackpadBridge)initWithDevice:(__MTDevice *)a3 parserOptions:(int)a4;
- (id)debug;
- (void)cancelNotificationCenterSource;
- (void)handleCancelEvent:(id)a3;
- (void)handlePowerState:(unsigned int)a3 messageArgument:(void *)a4;
- (void)handleSetPropertyEvent:(id)a3;
- (void)setQueue:(id)a3;
- (void)startNotificationCenterMonitoring:(int)a3 queue:(id)a4;
@end

@implementation MacTrackpadBridge

- (MacTrackpadBridge)initWithDevice:(__MTDevice *)a3 parserOptions:(int)a4
{
  v5.receiver = self;
  v5.super_class = (Class)MacTrackpadBridge;
  return [(TrackpadBridge *)&v5 initWithDevice:a3 parserOptions:*(void *)&a4];
}

- (void)handleSetPropertyEvent:(id)a3
{
  v4 = (char *)a3;
  id v5 = *((id *)v4 + 5);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  v7 = v4 + 16;
  int v8 = v4[39];
  if (v8 < 0)
  {
    if (*((void *)v4 + 3) != 29) {
      goto LABEL_37;
    }
    v7 = (void *)*v7;
  }
  else if (v8 != 29)
  {
    goto LABEL_37;
  }
  v9 = (void *)*v7;
  uint64_t v10 = v7[1];
  uint64_t v11 = v7[2];
  uint64_t v12 = *(void *)((char *)v7 + 21);
  if (v9 == (void *)0x6163696669746F4ELL
    && v10 == 0x746E65436E6F6974
    && v11 == 0x7275747365477265
    && v12 == 0x65646F4D65727574
    && v6 != 0)
  {
    v18 = [v6 objectForKeyedSubscript:@"AlwaysGenerateNotificationCenterGesture"];
    if (objc_opt_respondsToSelector()) {
      unsigned int v19 = [v18 BOOLValue];
    }
    else {
      unsigned int v19 = 0;
    }
    v20 = [v6 objectForKeyedSubscript:@"ClientPID"];
    if (objc_opt_respondsToSelector())
    {
      id v21 = [v20 intValue];
      if (!v19)
      {
LABEL_30:
        [(MacTrackpadBridge *)self cancelNotificationCenterSource];
        v22 = [(TrackpadBridge *)self tpSettingsManager];
        [v22 setNotificationCenterActive:0];
LABEL_36:

        goto LABEL_37;
      }
    }
    else
    {
      id v21 = 0;
      if (!v19) {
        goto LABEL_30;
      }
    }
    v23 = [(TrackpadBridge *)self queue];

    if (v23 && v21)
    {
      v24 = [(TrackpadBridge *)self queue];
      [(MacTrackpadBridge *)self startNotificationCenterMonitoring:v21 queue:v24];
    }
    v22 = [(TrackpadBridge *)self tpSettingsManager];
    [v22 setNotificationCenterActive:1];
    goto LABEL_36;
  }
LABEL_37:
  v25.receiver = self;
  v25.super_class = (Class)MacTrackpadBridge;
  [(TrackpadBridge *)&v25 handleSetPropertyEvent:v4];
}

- (void)handleCancelEvent:(id)a3
{
  id v4 = a3;
  if (self->_powerNotifierObject)
  {
    IODeregisterForSystemPower(&self->_powerNotifierObject);
    self->_powerNotifierObject = 0;
  }
  powerNotifierPortRef = self->_powerNotifierPortRef;
  if (powerNotifierPortRef)
  {
    IONotificationPortDestroy(powerNotifierPortRef);
    self->_powerNotifierPortRef = 0;
  }
  io_connect_t powerNofifierRootIOKitPort = self->_powerNofifierRootIOKitPort;
  if (powerNofifierRootIOKitPort)
  {
    IOServiceClose(powerNofifierRootIOKitPort);
    self->_io_connect_t powerNofifierRootIOKitPort = 0;
  }
  [(MacTrackpadBridge *)self cancelNotificationCenterSource];
  v7.receiver = self;
  v7.super_class = (Class)MacTrackpadBridge;
  [(TrackpadBridge *)&v7 handleCancelEvent:v4];
}

- (void)setQueue:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MacTrackpadBridge;
  [(TrackpadBridge *)&v8 setQueue:v4];
  io_connect_t v5 = IORegisterForSystemPower(self, &self->_powerNotifierPortRef, (IOServiceInterestCallback)handlePowerStateCallback, &self->_powerNotifierObject);
  self->_io_connect_t powerNofifierRootIOKitPort = v5;
  if (v5)
  {
    powerNotifierPortRef = self->_powerNotifierPortRef;
    objc_super v7 = [(TrackpadBridge *)self queue];
    IONotificationPortSetDispatchQueue(powerNotifierPortRef, v7);
  }
  else
  {
    objc_super v7 = MTLoggingPlugin();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v10 = "[Error] ";
      __int16 v11 = 2080;
      uint64_t v12 = "";
      __int16 v13 = 2080;
      v14 = "-[MacTrackpadBridge setQueue:]";
      _os_log_impl(&def_411C8, v7, OS_LOG_TYPE_ERROR, "[HID] [MT] %s%s%s IORegisterForSystemPower failed", buf, 0x20u);
    }
  }
}

- (id)debug
{
  v10.receiver = self;
  v10.super_class = (Class)MacTrackpadBridge;
  v3 = [(TrackpadBridge *)&v10 debug];
  id v4 = [v3 mutableCopy];

  io_connect_t v5 = [(TrackpadBridge *)self tpSettingsManager];

  if (v5)
  {
    id v6 = [(TrackpadBridge *)self tpSettingsManager];
    objc_super v7 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v6 notificationCenterActive]);
    [v4 setObject:v7 forKeyedSubscript:@"NotificationCenterActive"];
  }
  id v8 = [v4 copy];

  return v8;
}

- (void)startNotificationCenterMonitoring:(int)a3 queue:(id)a4
{
  id v6 = a4;
  [(MacTrackpadBridge *)self cancelNotificationCenterSource];
  objc_super v7 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_proc, a3, 0x80000000uLL, v6);
  notificationCenterMonitoringSource = self->_notificationCenterMonitoringSource;
  self->_notificationCenterMonitoringSource = v7;

  if (self->_notificationCenterMonitoringSource)
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v9 = self->_notificationCenterMonitoringSource;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = __61__MacTrackpadBridge_startNotificationCenterMonitoring_queue___block_invoke;
    v10[3] = &unk_141240;
    objc_copyWeak(&v11, &location);
    dispatch_source_set_event_handler(v9, v10);
    dispatch_resume((dispatch_object_t)self->_notificationCenterMonitoringSource);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

void __61__MacTrackpadBridge_startNotificationCenterMonitoring_queue___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = MTLoggingPlugin();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 136315650;
      io_connect_t v5 = "";
      __int16 v6 = 2080;
      objc_super v7 = "";
      __int16 v8 = 2080;
      v9 = "-[MacTrackpadBridge startNotificationCenterMonitoring:queue:]_block_invoke";
      _os_log_impl(&def_411C8, v2, OS_LOG_TYPE_DEFAULT, "[HID] [MT] %s%s%s NotificationCenter process died.", (uint8_t *)&v4, 0x20u);
    }

    [WeakRetained cancelNotificationCenterSource];
    v3 = [WeakRetained tpSettingsManager];
    [v3 setNotificationCenterActive:0];
  }
}

- (void)cancelNotificationCenterSource
{
  notificationCenterMonitoringSource = self->_notificationCenterMonitoringSource;
  if (notificationCenterMonitoringSource)
  {
    dispatch_source_cancel(notificationCenterMonitoringSource);
    int v4 = self->_notificationCenterMonitoringSource;
    self->_notificationCenterMonitoringSource = 0;
  }
}

- (void)handlePowerState:(unsigned int)a3 messageArgument:(void *)a4
{
  [(TrackpadBridge *)self setSignpost_begin_time:mach_continuous_time()];
  objc_super v7 = objc_opt_new();
  v7[2] = a3;
  [(TrackpadBridge *)self dispatch:v7];
  uint64_t v8 = v7[2];
  if (v8 == 3758097024 || v8 == 3758097008)
  {
    mach_error_t v10 = IOAllowPowerChange(self->_powerNofifierRootIOKitPort, (intptr_t)a4);
    if (v10)
    {
      id v11 = MTLoggingPlugin();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        int v12 = 136315906;
        __int16 v13 = "[Error] ";
        __int16 v14 = 2080;
        v15 = "";
        __int16 v16 = 2080;
        v17 = "-[MacTrackpadBridge handlePowerState:messageArgument:]";
        __int16 v18 = 2080;
        unsigned int v19 = mach_error_string(v10);
        _os_log_impl(&def_411C8, v11, OS_LOG_TYPE_ERROR, "[HID] [MT] %s%s%s IOAllowPowerChange failed with return %s", (uint8_t *)&v12, 0x2Au);
      }
    }
  }
}

- (void).cxx_destruct
{
}

@end