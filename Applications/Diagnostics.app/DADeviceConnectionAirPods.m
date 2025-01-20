@interface DADeviceConnectionAirPods
- (BOOL)connect;
- (BOOL)connecting;
- (BOOL)disconnect;
- (BOOL)disconnecting;
- (BOOL)hasIgnoredDisconnect;
- (BOOL)isIgnoringDisconnect;
- (BOOL)lastConnectionState;
- (BOOL)unpairOnTestCompletion;
- (BluetoothDevice)airpodsDevice;
- (BluetoothManager)btManager;
- (DADeviceConnectionAirPods)initWithState:(id)a3;
- (DADeviceConnectionAirPods)initWithState:(id)a3 bluetoothDevice:(id)a4;
- (NSTimer)ignoreDisconnectTimer;
- (OS_dispatch_queue)connectionCommandQueue;
- (OS_dispatch_semaphore)connectSemaphore;
- (OS_dispatch_semaphore)disconnectSemaphore;
- (void)DADeviceAirPodsSessionWillStartNotification:(id)a3;
- (void)_btDeviceConnectFailedNotification:(id)a3;
- (void)_btDeviceConnectSuccessNotification:(id)a3;
- (void)_btDeviceDisconnectFailedNotification:(id)a3;
- (void)_btDeviceDisconnectSuccessNotification:(id)a3;
- (void)allowSessionAccessoryDisconnectForDuration:(id)a3;
- (void)clearAllowSessionAccessoryDisconnect;
- (void)didFinishSendingResultForTest:(id)a3;
- (void)end;
- (void)endIgnoringDisconnects;
- (void)setAirpodsDevice:(id)a3;
- (void)setBtManager:(id)a3;
- (void)setConnectSemaphore:(id)a3;
- (void)setConnecting:(BOOL)a3;
- (void)setConnectionCommandQueue:(id)a3;
- (void)setDisconnectSemaphore:(id)a3;
- (void)setDisconnecting:(BOOL)a3;
- (void)setHasIgnoredDisconnect:(BOOL)a3;
- (void)setIgnoreDisconnectTimer:(id)a3;
- (void)setIsIgnoringDisconnect:(BOOL)a3;
- (void)setLastConnectionState:(BOOL)a3;
- (void)setUnpairOnTestCompletion:(BOOL)a3;
- (void)start;
- (void)unpair;
@end

@implementation DADeviceConnectionAirPods

- (DADeviceConnectionAirPods)initWithState:(id)a3
{
  return 0;
}

- (DADeviceConnectionAirPods)initWithState:(id)a3 bluetoothDevice:(id)a4
{
  id v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)DADeviceConnectionAirPods;
  v8 = [(DADeviceConnectionLocal *)&v24 initWithState:a3];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_airpodsDevice, a4);
    dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
    connectSemaphore = v9->_connectSemaphore;
    v9->_connectSemaphore = (OS_dispatch_semaphore *)v10;

    dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
    disconnectSemaphore = v9->_disconnectSemaphore;
    v9->_disconnectSemaphore = (OS_dispatch_semaphore *)v12;

    dispatch_queue_t v14 = dispatch_queue_create("com.apple.Diagnostics.airpodsConnectivity", 0);
    connectionCommandQueue = v9->_connectionCommandQueue;
    v9->_connectionCommandQueue = (OS_dispatch_queue *)v14;

    v9->_lastConnectionState = [v7 connected];
    uint64_t v16 = +[BluetoothManager sharedInstance];
    btManager = v9->_btManager;
    v9->_btManager = (BluetoothManager *)v16;

    v9->_unpairOnTestCompletion = 0;
    v9->_isIgnoringDisconnect = 0;
    v9->_hasIgnoredDisconnect = 0;
    if (v9->_btManager)
    {
      v18 = +[NSNotificationCenter defaultCenter];
      [v18 addObserver:v9 selector:"_btDeviceConnectSuccessNotification:" name:BluetoothDeviceConnectSuccessNotification object:0];

      v19 = +[NSNotificationCenter defaultCenter];
      [v19 addObserver:v9 selector:"_btDeviceConnectFailedNotification:" name:BluetoothDeviceConnectFailedNotification object:0];

      v20 = +[NSNotificationCenter defaultCenter];
      [v20 addObserver:v9 selector:"_btDeviceDisconnectSuccessNotification:" name:BluetoothDeviceDisconnectSuccessNotification object:0];

      v21 = +[NSNotificationCenter defaultCenter];
      [v21 addObserver:v9 selector:"_btDeviceDisconnectFailedNotification:" name:BluetoothDeviceDisconnectFailedNotification object:0];

      v22 = +[NSNotificationCenter defaultCenter];
      [v22 addObserver:v9 selector:"DADeviceAirPodsSessionWillStartNotification:" name:@"com.apple.Diagnostics.airPodsSessionWillStart" object:0];
    }
    else
    {
      v22 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_100102A44(v22);
      }
    }
  }
  return v9;
}

- (BOOL)connect
{
  v3 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(DADeviceConnectionAirPods *)self airpodsDevice];
    int v11 = 138412290;
    dispatch_semaphore_t v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Connecting to AirPods %@...", (uint8_t *)&v11, 0xCu);
  }
  [(DADeviceConnectionAirPods *)self setConnecting:1];
  v5 = [(DADeviceConnectionAirPods *)self airpodsDevice];
  [v5 connect];

  v6 = [(DADeviceConnectionAirPods *)self connectSemaphore];
  dispatch_time_t v7 = dispatch_time(0, 15000000000);
  intptr_t v8 = dispatch_semaphore_wait(v6, v7);

  if (v8)
  {
    v9 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100102A88(self);
    }
  }
  [(DADeviceConnectionAirPods *)self setConnecting:0];
  return v8 == 0;
}

- (BOOL)disconnect
{
  v3 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(DADeviceConnectionAirPods *)self airpodsDevice];
    int v11 = 138412290;
    dispatch_semaphore_t v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Disconnecting from AirPods %@...", (uint8_t *)&v11, 0xCu);
  }
  [(DADeviceConnectionAirPods *)self setDisconnecting:1];
  v5 = [(DADeviceConnectionAirPods *)self airpodsDevice];
  [v5 disconnect];

  v6 = [(DADeviceConnectionAirPods *)self disconnectSemaphore];
  dispatch_time_t v7 = dispatch_time(0, 15000000000);
  intptr_t v8 = dispatch_semaphore_wait(v6, v7);

  if (v8)
  {
    v9 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100102A88(self);
    }
  }
  [(DADeviceConnectionAirPods *)self setDisconnecting:0];
  return v8 == 0;
}

- (void)start
{
  v3 = [(DADeviceConnectionAirPods *)self connectionCommandQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002F4AC;
  block[3] = &unk_10014B0D8;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)end
{
  v3 = [(DADeviceConnectionAirPods *)self connectionCommandQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002F6D4;
  block[3] = &unk_10014B0D8;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)didFinishSendingResultForTest:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)DADeviceConnectionAirPods;
  [(DADeviceConnectionLocal *)&v7 didFinishSendingResultForTest:a3];
  if ([(DADeviceConnectionAirPods *)self unpairOnTestCompletion])
  {
    dispatch_time_t v4 = dispatch_time(0, 2000000000);
    v5 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10002F828;
    block[3] = &unk_10014B0D8;
    block[4] = self;
    dispatch_after(v4, v5, block);
  }
}

- (void)DADeviceAirPodsSessionWillStartNotification:(id)a3
{
  dispatch_time_t v4 = [a3 userInfo];
  uint64_t v9 = [v4 objectForKeyedSubscript:@"DADeviceAirPodsDeviceKey"];

  if ([(DADeviceConnectionAirPods *)self lastConnectionState])
  {
    v5 = [(DADeviceConnectionAirPods *)self airpodsDevice];

    if (v5 != (void *)v9)
    {
      v6 = [(DADeviceConnectionLocal *)self state];
      if ([v6 phase])
      {
        objc_super v7 = [(DADeviceConnectionLocal *)self state];
        id v8 = [v7 phase];

        if (v8 != (id)1)
        {
          [(DADeviceConnectionAirPods *)self end];
          goto LABEL_8;
        }
      }
      else
      {
      }
      [(DADeviceConnectionAirPods *)self disconnect];
    }
  }
LABEL_8:

  _objc_release_x1();
}

- (void)unpair
{
  objc_initWeak(&location, self);
  v3 = [(DADeviceConnectionAirPods *)self connectionCommandQueue];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10002FAB0;
  v4[3] = &unk_10014B1F0;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)allowSessionAccessoryDisconnectForDuration:(id)a3
{
  id v4 = a3;
  int v5 = [v4 intValue];
  v6 = DiagnosticLogHandleForCategory();
  objc_super v7 = v6;
  if (v5 <= 0)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100102B10((uint64_t)v4, v7);
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Ignoring accessory disconnects for %@ seconds", (uint8_t *)&v8, 0xCu);
    }

    [(DADeviceConnectionAirPods *)self setIsIgnoringDisconnect:1];
    [v4 doubleValue];
    objc_super v7 = +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "endIgnoringDisconnects", 0, 0);
    [(DADeviceConnectionAirPods *)self setIgnoreDisconnectTimer:v7];
  }
}

- (void)clearAllowSessionAccessoryDisconnect
{
}

- (void)endIgnoringDisconnects
{
  v3 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Resuming handling for accessory disconnects", buf, 2u);
  }

  id v4 = [(DADeviceConnectionAirPods *)self ignoreDisconnectTimer];

  if (v4)
  {
    int v5 = [(DADeviceConnectionAirPods *)self ignoreDisconnectTimer];
    [v5 invalidate];

    [(DADeviceConnectionAirPods *)self setIgnoreDisconnectTimer:0];
  }
  if ([(DADeviceConnectionAirPods *)self hasIgnoredDisconnect]
    && ![(DADeviceConnectionAirPods *)self lastConnectionState])
  {
    v6 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Accessory is in a disconnected state upon resuming handling. Ending the session immediately.", v9, 2u);
    }

    objc_super v7 = [(DADeviceConnectionLocal *)self state];
    [v7 setPhase:1];

    int v8 = [(DADeviceConnectionLocal *)self state];
    [v8 addErrorCode:12 userInfo:0];
  }
  [(DADeviceConnectionAirPods *)self setIsIgnoringDisconnect:0];
  [(DADeviceConnectionAirPods *)self setHasIgnoredDisconnect:0];
}

- (void)_btDeviceConnectSuccessNotification:(id)a3
{
  id v4 = [a3 object];
  int v5 = [(DADeviceConnectionAirPods *)self airpodsDevice];
  unsigned int v6 = [v4 isEqual:v5];

  if (v6)
  {
    objc_super v7 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = [(DADeviceConnectionAirPods *)self airpodsDevice];
      int v10 = 138412290;
      int v11 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "AirPods device %@ has connected successfully!", (uint8_t *)&v10, 0xCu);
    }
    if ([(DADeviceConnectionAirPods *)self connecting])
    {
      id v9 = [(DADeviceConnectionAirPods *)self connectSemaphore];
      dispatch_semaphore_signal(v9);
    }
    [(DADeviceConnectionAirPods *)self setLastConnectionState:1];
  }
}

- (void)_btDeviceConnectFailedNotification:(id)a3
{
  id v4 = [a3 object];
  int v5 = [(DADeviceConnectionAirPods *)self airpodsDevice];
  unsigned int v6 = [v4 isEqual:v5];

  if (v6)
  {
    objc_super v7 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = [(DADeviceConnectionAirPods *)self airpodsDevice];
      int v10 = 138412290;
      int v11 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "AirPods device %@ failed to connect!", (uint8_t *)&v10, 0xCu);
    }
    if ([(DADeviceConnectionAirPods *)self connecting])
    {
      id v9 = [(DADeviceConnectionAirPods *)self connectSemaphore];
      dispatch_semaphore_signal(v9);
    }
    [(DADeviceConnectionAirPods *)self setLastConnectionState:0];
  }
}

- (void)_btDeviceDisconnectSuccessNotification:(id)a3
{
  id v4 = [a3 object];
  int v5 = [(DADeviceConnectionAirPods *)self airpodsDevice];
  unsigned int v6 = [v4 isEqual:v5];

  if (v6)
  {
    objc_super v7 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = [(DADeviceConnectionAirPods *)self airpodsDevice];
      int v14 = 138412290;
      v15 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "AirPods device %@ has disconected!", (uint8_t *)&v14, 0xCu);
    }
    if ([(DADeviceConnectionAirPods *)self disconnecting])
    {
      id v9 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v14) = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Disconnect was expected", (uint8_t *)&v14, 2u);
      }

      int v10 = [(DADeviceConnectionAirPods *)self disconnectSemaphore];
      dispatch_semaphore_signal(v10);
    }
    else
    {
      if ([(DADeviceConnectionAirPods *)self isIgnoringDisconnect])
      {
        int v11 = DiagnosticLogHandleForCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v14) = 0;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Disconnect is temporairly ignored", (uint8_t *)&v14, 2u);
        }

        [(DADeviceConnectionAirPods *)self setHasIgnoredDisconnect:1];
        goto LABEL_17;
      }
      if (![(DADeviceConnectionAirPods *)self lastConnectionState])
      {
LABEL_17:
        [(DADeviceConnectionAirPods *)self setLastConnectionState:0];
        return;
      }
      dispatch_semaphore_t v12 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_100102B88(v12);
      }

      v13 = [(DADeviceConnectionLocal *)self state];
      [v13 setPhase:1];

      int v10 = [(DADeviceConnectionLocal *)self state];
      [v10 addErrorCode:12 userInfo:0];
    }

    goto LABEL_17;
  }
}

- (void)_btDeviceDisconnectFailedNotification:(id)a3
{
  id v4 = [a3 object];
  int v5 = [(DADeviceConnectionAirPods *)self airpodsDevice];
  unsigned int v6 = [v4 isEqual:v5];

  if (v6)
  {
    objc_super v7 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = [(DADeviceConnectionAirPods *)self airpodsDevice];
      int v11 = 138412290;
      dispatch_semaphore_t v12 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "AirPods device %@ has failed to disconnect!", (uint8_t *)&v11, 0xCu);
    }
    if ([(DADeviceConnectionAirPods *)self disconnecting])
    {
      id v9 = [(DADeviceConnectionAirPods *)self disconnectSemaphore];
      dispatch_semaphore_signal(v9);
    }
    else
    {
      if (![(DADeviceConnectionAirPods *)self lastConnectionState])
      {
LABEL_9:
        [(DADeviceConnectionAirPods *)self setLastConnectionState:0];
        return;
      }
      int v10 = [(DADeviceConnectionLocal *)self state];
      [v10 setPhase:1];

      id v9 = [(DADeviceConnectionLocal *)self state];
      [v9 addErrorCode:12 userInfo:0];
    }

    goto LABEL_9;
  }
}

- (BOOL)unpairOnTestCompletion
{
  return self->_unpairOnTestCompletion;
}

- (void)setUnpairOnTestCompletion:(BOOL)a3
{
  self->_unpairOnTestCompletion = a3;
}

- (BluetoothManager)btManager
{
  return self->_btManager;
}

- (void)setBtManager:(id)a3
{
}

- (BluetoothDevice)airpodsDevice
{
  return self->_airpodsDevice;
}

- (void)setAirpodsDevice:(id)a3
{
}

- (BOOL)connecting
{
  return self->_connecting;
}

- (void)setConnecting:(BOOL)a3
{
  self->_connecting = a3;
}

- (BOOL)disconnecting
{
  return self->_disconnecting;
}

- (void)setDisconnecting:(BOOL)a3
{
  self->_disconnecting = a3;
}

- (BOOL)lastConnectionState
{
  return self->_lastConnectionState;
}

- (void)setLastConnectionState:(BOOL)a3
{
  self->_lastConnectionState = a3;
}

- (OS_dispatch_semaphore)connectSemaphore
{
  return self->_connectSemaphore;
}

- (void)setConnectSemaphore:(id)a3
{
}

- (OS_dispatch_semaphore)disconnectSemaphore
{
  return self->_disconnectSemaphore;
}

- (void)setDisconnectSemaphore:(id)a3
{
}

- (OS_dispatch_queue)connectionCommandQueue
{
  return self->_connectionCommandQueue;
}

- (void)setConnectionCommandQueue:(id)a3
{
}

- (BOOL)isIgnoringDisconnect
{
  return self->_isIgnoringDisconnect;
}

- (void)setIsIgnoringDisconnect:(BOOL)a3
{
  self->_isIgnoringDisconnect = a3;
}

- (BOOL)hasIgnoredDisconnect
{
  return self->_hasIgnoredDisconnect;
}

- (void)setHasIgnoredDisconnect:(BOOL)a3
{
  self->_hasIgnoredDisconnect = a3;
}

- (NSTimer)ignoreDisconnectTimer
{
  return self->_ignoreDisconnectTimer;
}

- (void)setIgnoreDisconnectTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ignoreDisconnectTimer, 0);
  objc_storeStrong((id *)&self->_connectionCommandQueue, 0);
  objc_storeStrong((id *)&self->_disconnectSemaphore, 0);
  objc_storeStrong((id *)&self->_connectSemaphore, 0);
  objc_storeStrong((id *)&self->_airpodsDevice, 0);

  objc_storeStrong((id *)&self->_btManager, 0);
}

@end