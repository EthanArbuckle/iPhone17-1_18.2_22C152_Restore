@interface PMSmartPowerNapService
+ (id)sharedInstance;
- (BOOL)ambient_state;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSMutableDictionary)clients;
- (OS_dispatch_queue)mainQueue;
- (PMSmartPowerNapPredictor)predictor;
- (PMSmartPowerNapService)init;
- (unsigned)current_state;
- (void)backlight:(id)a3 didChangeAlwaysOnEnabled:(BOOL)a4;
- (void)backlight:(id)a3 didCompleteUpdateToState:(int64_t)a4 forEvent:(id)a5;
- (void)enterSmartPowerNap;
- (void)exitSmartPowerNap;
- (void)registerForBacklightUpdates;
- (void)registerForLockStateUpdates;
- (void)registerForPluginStateUpdates;
- (void)registerWithIdentifier:(id)a3;
- (void)setAmbient_state:(BOOL)a3;
- (void)setClients:(id)a3;
- (void)setCurrent_state:(unsigned __int8)a3;
- (void)setMainQueue:(id)a3;
- (void)setPredictor:(id)a3;
- (void)setSPNMotionAlarmStartThreshold:(unsigned int)a3;
- (void)setSPNMotionAlarmThreshold:(unsigned int)a3;
- (void)setSPNReentryCoolOffPeriod:(unsigned int)a3;
- (void)setSPNReentryDelaySeconds:(unsigned int)a3;
- (void)setSPNRequeryDelta:(unsigned int)a3;
- (void)setState:(unsigned __int8)a3;
- (void)syncStateWithHandler:(id)a3;
- (void)unregisterWithIdentifier:(id)a3;
- (void)updateAmbientState:(BOOL)a3;
- (void)updateClientsWithState:(unsigned __int8)a3;
- (void)updateLockState:(unint64_t)a3;
- (void)updatePluginState:(BOOL)a3;
- (void)updateState:(unsigned __int8)a3;
@end

@implementation PMSmartPowerNapService

+ (id)sharedInstance
{
  if (qword_1000A4630 != -1) {
    dispatch_once(&qword_1000A4630, &stru_100091170);
  }
  v2 = (void *)qword_1000A4628;

  return v2;
}

- (PMSmartPowerNapService)init
{
  v16.receiver = self;
  v16.super_class = (Class)PMSmartPowerNapService;
  v2 = [(PMSmartPowerNapService *)&v16 initWithMachServiceName:@"com.apple.powerd.smartpowernap"];
  if (v2
    && (dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM),
        v3 = objc_claimAutoreleasedReturnValue(),
        dispatch_queue_t v4 = dispatch_queue_create("com.apple.powerd.smartpowernap.queue", v3),
        mainQueue = v2->_mainQueue,
        v2->_mainQueue = (OS_dispatch_queue *)v4,
        mainQueue,
        v3,
        v2->_mainQueue))
  {
    [(PMSmartPowerNapService *)v2 setDelegate:v2];
    os_log_t v6 = os_log_create("com.apple.powerd", "smartPowerNap");
    v7 = (void *)qword_1000A34F0;
    qword_1000A34F0 = (uint64_t)v6;

    v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    clients = v2->_clients;
    v2->_clients = v8;

    v2->_current_state = 0;
    v10 = [[PMSmartPowerNapPredictor alloc] initWithQueue:v2->_mainQueue];
    predictor = v2->_predictor;
    v2->_predictor = v10;

    v12 = qword_1000A34F0;
    if (os_log_type_enabled((os_log_t)qword_1000A34F0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "SPN: Listening to xpc connections", v15, 2u);
    }
    [(PMSmartPowerNapService *)v2 resume];
    [(PMSmartPowerNapService *)v2 registerForLockStateUpdates];
    [(PMSmartPowerNapService *)v2 registerForBacklightUpdates];
    [(PMSmartPowerNapService *)v2 registerForPluginStateUpdates];
    v13 = v2;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)updateAmbientState:(BOOL)a3
{
  v5 = [(PMSmartPowerNapService *)self mainQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000058E0;
  v6[3] = &unk_100091198;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_async(v5, v6);
}

- (void)registerForLockStateUpdates
{
  v2 = self;
  int out_token = 0;
  v3 = [(PMSmartPowerNapService *)self mainQueue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100005A08;
  v5[3] = &unk_1000911C0;
  v5[4] = v2;
  LODWORD(v2) = notify_register_dispatch("com.apple.springboard.lockstate", &out_token, v3, v5);

  if (v2)
  {
    dispatch_queue_t v4 = qword_1000A34F0;
    if (os_log_type_enabled((os_log_t)qword_1000A34F0, OS_LOG_TYPE_ERROR)) {
      sub_1000632C4(v4);
    }
  }
}

- (void)updateLockState:(unint64_t)a3
{
  id v4 = [(PMSmartPowerNapService *)self predictor];
  [v4 updateLockState:a3];
}

- (void)registerForPluginStateUpdates
{
  v2 = self;
  int out_token = 0;
  v3 = [(PMSmartPowerNapService *)self mainQueue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100005BE4;
  v5[3] = &unk_1000911C0;
  v5[4] = v2;
  LODWORD(v2) = notify_register_dispatch("com.apple.system.powersources.source", &out_token, v3, v5);

  if (v2)
  {
    id v4 = qword_1000A34F0;
    if (os_log_type_enabled((os_log_t)qword_1000A34F0, OS_LOG_TYPE_ERROR)) {
      sub_100063308(v4);
    }
  }
}

- (void)updatePluginState:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(PMSmartPowerNapService *)self predictor];
  [v4 updatePluginState:v3];
}

- (void)registerForBacklightUpdates
{
  dispatch_time_t v3 = dispatch_time(0, 1000000000);
  id v4 = [(PMSmartPowerNapService *)self mainQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005D20;
  block[3] = &unk_1000911E8;
  block[4] = self;
  dispatch_after(v3, v4, block);
}

- (void)backlight:(id)a3 didCompleteUpdateToState:(int64_t)a4 forEvent:(id)a5
{
  BOOL v7 = objc_msgSend(a5, "changeRequest", a3);
  v8 = (char *)[v7 sourceEvent];
  if (a4 != 2)
  {
    if ((unint64_t)a4 > 1) {
      goto LABEL_10;
    }
    v12 = qword_1000A34F0;
    if (os_log_type_enabled((os_log_t)qword_1000A34F0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Backlight turned off", buf, 2u);
    }
LABEL_9:
    BOOL v13 = a4 == 2;
    v14 = [(PMSmartPowerNapService *)self mainQueue];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100005F58;
    v15[3] = &unk_100091198;
    v15[4] = self;
    BOOL v16 = v13;
    dispatch_async(v14, v15);

    goto LABEL_10;
  }
  v9 = v8;
  v10 = NSStringFromBLSBacklightChangeSourceEvent();
  v11 = qword_1000A34F0;
  if (os_log_type_enabled((os_log_t)qword_1000A34F0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Backlight turned on due to %@", buf, 0xCu);
  }

  if ((unint64_t)(v9 - 2) < 3) {
    goto LABEL_9;
  }
LABEL_10:
}

- (void)backlight:(id)a3 didChangeAlwaysOnEnabled:(BOOL)a4
{
  os_log_t v6 = [(PMSmartPowerNapService *)self mainQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100006044;
  v7[3] = &unk_100091198;
  v7[4] = self;
  BOOL v8 = a4;
  dispatch_async(v6, v7);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  os_log_t v6 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL____PMSmartPowerNapProtocol];
  [v5 setExportedInterface:v6];

  BOOL v7 = (void *)qword_1000A34F0;
  if (os_log_type_enabled((os_log_t)qword_1000A34F0, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v8 = v7;
    v11[0] = 67109120;
    v11[1] = [v5 processIdentifier];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "SPN: listener: accepted new connection from pid %d", (uint8_t *)v11, 8u);
  }
  [v5 setExportedObject:self];
  v9 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL____PMSmartPowerNapCallbackProtocol];
  [v5 setRemoteObjectInterface:v9];

  [v5 resume];
  return 1;
}

- (void)registerWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = +[NSXPCConnection currentConnection];
  os_log_t v6 = [(PMSmartPowerNapService *)self mainQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000062AC;
  block[3] = &unk_100091250;
  id v10 = v4;
  id v11 = v5;
  v12 = self;
  id v7 = v5;
  id v8 = v4;
  dispatch_async(v6, block);
}

- (void)unregisterWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(PMSmartPowerNapService *)self mainQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000065F8;
  v7[3] = &unk_100091278;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)updateClientsWithState:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v5 = [(PMSmartPowerNapService *)self clients];
  id v6 = [v5 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v21;
    *(void *)&long long v7 = 138412290;
    long long v19 = v7;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v20 + 1) + 8 * (void)v10);
        v12 = [(PMSmartPowerNapService *)self clients];
        BOOL v13 = [v12 objectForKeyedSubscript:v11];

        if (v13
          && ([v13 connection], v14 = objc_claimAutoreleasedReturnValue(), v14, v14))
        {
          v15 = qword_1000A34F0;
          if (os_log_type_enabled((os_log_t)qword_1000A34F0, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v25 = v11;
            __int16 v26 = 1024;
            int v27 = v3;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "SPN: Update state for client %@ to %d", buf, 0x12u);
          }
          BOOL v16 = [v13 connection];
          v17 = [v16 remoteObjectProxyWithErrorHandler:&stru_100091298];
          [v17 updateState:v3];
        }
        else
        {
          v18 = qword_1000A34F0;
          if (os_log_type_enabled((os_log_t)qword_1000A34F0, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v19;
            uint64_t v25 = v11;
            _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Connection not present for client %@", buf, 0xCu);
          }
        }

        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v5 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v8);
  }
}

- (void)updateState:(unsigned __int8)a3
{
  self->_current_state = a3;
  -[PMSmartPowerNapService updateClientsWithState:](self, "updateClientsWithState:");
}

- (void)setState:(unsigned __int8)a3
{
  id v5 = [(PMSmartPowerNapService *)self mainQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100006A3C;
  v6[3] = &unk_100091198;
  unsigned __int8 v7 = a3;
  v6[4] = self;
  dispatch_async(v5, v6);
}

- (void)syncStateWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(PMSmartPowerNapService *)self mainQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100006BFC;
  v7[3] = &unk_1000912C0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)enterSmartPowerNap
{
  uint64_t v3 = qword_1000A34F0;
  if (os_log_type_enabled((os_log_t)qword_1000A34F0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "SmartPowerNap: enterSmartPowerNap", v4, 2u);
  }
  [(PMSmartPowerNapService *)self updateState:1];
}

- (void)exitSmartPowerNap
{
  uint64_t v3 = qword_1000A34F0;
  if (os_log_type_enabled((os_log_t)qword_1000A34F0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "SmartPowerNap: exitSmartPowerNap", v4, 2u);
  }
  [(PMSmartPowerNapService *)self updateState:0];
}

- (void)setSPNReentryCoolOffPeriod:(unsigned int)a3
{
  id v5 = qword_1000A34F0;
  if (os_log_type_enabled((os_log_t)qword_1000A34F0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Updating SPN Re-entry cool off period", buf, 2u);
  }
  id v6 = [(PMSmartPowerNapService *)self mainQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100006E9C;
  v7[3] = &unk_1000912E8;
  void v7[4] = self;
  unsigned int v8 = a3;
  dispatch_async(v6, v7);
}

- (void)setSPNReentryDelaySeconds:(unsigned int)a3
{
  id v5 = qword_1000A34F0;
  if (os_log_type_enabled((os_log_t)qword_1000A34F0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    unsigned int v10 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Updating SPN Re-entry delay to %u", buf, 8u);
  }
  id v6 = [(PMSmartPowerNapService *)self mainQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100007004;
  v7[3] = &unk_1000912E8;
  void v7[4] = self;
  unsigned int v8 = a3;
  dispatch_async(v6, v7);
}

- (void)setSPNRequeryDelta:(unsigned int)a3
{
  id v5 = qword_1000A34F0;
  if (os_log_type_enabled((os_log_t)qword_1000A34F0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    unsigned int v10 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Updating SPN requery delta to %u", buf, 8u);
  }
  id v6 = [(PMSmartPowerNapService *)self mainQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000716C;
  v7[3] = &unk_1000912E8;
  void v7[4] = self;
  unsigned int v8 = a3;
  dispatch_async(v6, v7);
}

- (void)setSPNMotionAlarmThreshold:(unsigned int)a3
{
  id v5 = qword_1000A34F0;
  if (os_log_type_enabled((os_log_t)qword_1000A34F0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    unsigned int v10 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Updating SPN motion alarm threshold to %u", buf, 8u);
  }
  id v6 = [(PMSmartPowerNapService *)self mainQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000072D4;
  v7[3] = &unk_1000912E8;
  void v7[4] = self;
  unsigned int v8 = a3;
  dispatch_async(v6, v7);
}

- (void)setSPNMotionAlarmStartThreshold:(unsigned int)a3
{
  id v5 = qword_1000A34F0;
  if (os_log_type_enabled((os_log_t)qword_1000A34F0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    unsigned int v10 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Updating SPN motion alarm start threshold to %u", buf, 8u);
  }
  id v6 = [(PMSmartPowerNapService *)self mainQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000743C;
  v7[3] = &unk_1000912E8;
  void v7[4] = self;
  unsigned int v8 = a3;
  dispatch_async(v6, v7);
}

- (OS_dispatch_queue)mainQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (void)setMainQueue:(id)a3
{
}

- (NSMutableDictionary)clients
{
  return self->_clients;
}

- (void)setClients:(id)a3
{
}

- (unsigned)current_state
{
  return self->_current_state;
}

- (void)setCurrent_state:(unsigned __int8)a3
{
  self->_current_state = a3;
}

- (PMSmartPowerNapPredictor)predictor
{
  return self->_predictor;
}

- (void)setPredictor:(id)a3
{
}

- (BOOL)ambient_state
{
  return self->_ambient_state;
}

- (void)setAmbient_state:(BOOL)a3
{
  self->_ambient_state = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predictor, 0);
  objc_storeStrong((id *)&self->_clients, 0);

  objc_storeStrong((id *)&self->_mainQueue, 0);
}

@end