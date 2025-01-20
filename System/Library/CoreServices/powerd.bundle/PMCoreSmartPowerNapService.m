@interface PMCoreSmartPowerNapService
+ (id)sharedInstance;
- (BOOL)async_assertions;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSMutableDictionary)clients;
- (NSNumber)cached_idle_timer;
- (OS_dispatch_queue)mainQueue;
- (PMCoreSmartPowerNapPredictor)predictor;
- (PMCoreSmartPowerNapService)init;
- (unsigned)current_state;
- (void)enterCoreSmartPowerNap;
- (void)exitCoreSmartPowerNap;
- (void)registerForLockStateUpdates;
- (void)registerWithIdentifier:(id)a3;
- (void)setAsync_assertions:(BOOL)a3;
- (void)setCSPNMotionAlarmStartThreshold:(unsigned int)a3;
- (void)setCSPNMotionAlarmThreshold:(unsigned int)a3;
- (void)setCSPNQueryDelta:(unsigned int)a3;
- (void)setCSPNRequeryDelta:(unsigned int)a3;
- (void)setCached_idle_timer:(id)a3;
- (void)setClients:(id)a3;
- (void)setCurrent_state:(unsigned __int8)a3;
- (void)setMainQueue:(id)a3;
- (void)setPredictor:(id)a3;
- (void)setState:(unsigned __int8)a3;
- (void)syncStateWithHandler:(id)a3;
- (void)unregisterWithIdentifier:(id)a3;
- (void)updateClientsWithState:(unsigned __int8)a3;
- (void)updateLockState:(unint64_t)a3;
- (void)updateState:(unsigned __int8)a3;
@end

@implementation PMCoreSmartPowerNapService

+ (id)sharedInstance
{
  if (qword_1000A4C90 != -1) {
    dispatch_once(&qword_1000A4C90, &stru_1000924B0);
  }
  v2 = (void *)qword_1000A4C88;

  return v2;
}

- (PMCoreSmartPowerNapService)init
{
  v16.receiver = self;
  v16.super_class = (Class)PMCoreSmartPowerNapService;
  v2 = [(PMCoreSmartPowerNapService *)&v16 initWithMachServiceName:@"com.apple.powerd.coresmartpowernap"];
  if (v2
    && (dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM),
        v3 = objc_claimAutoreleasedReturnValue(),
        dispatch_queue_t v4 = dispatch_queue_create("com.apple.powerd.coresmartpowernap.queue", v3),
        mainQueue = v2->_mainQueue,
        v2->_mainQueue = (OS_dispatch_queue *)v4,
        mainQueue,
        v3,
        v2->_mainQueue))
  {
    [(PMCoreSmartPowerNapService *)v2 setDelegate:v2];
    os_log_t v6 = os_log_create("com.apple.powerd", "coreSmartPowerNap");
    v7 = (void *)qword_1000A36C8;
    qword_1000A36C8 = (uint64_t)v6;

    v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    clients = v2->_clients;
    v2->_clients = v8;

    v2->_current_state = 0;
    v10 = [[PMCoreSmartPowerNapPredictor alloc] initWithQueue:v2->_mainQueue];
    predictor = v2->_predictor;
    v2->_predictor = v10;

    v2->_async_assertions = 1;
    v12 = qword_1000A36C8;
    if (os_log_type_enabled((os_log_t)qword_1000A36C8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "CSPN: Listening to xpc connections", v15, 2u);
    }
    [(PMCoreSmartPowerNapService *)v2 resume];
    [(PMCoreSmartPowerNapService *)v2 registerForLockStateUpdates];
    v13 = v2;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)registerForLockStateUpdates
{
  v2 = self;
  int out_token = 0;
  v3 = [(PMCoreSmartPowerNapService *)self mainQueue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10003BD24;
  v5[3] = &unk_1000911C0;
  v5[4] = v2;
  LODWORD(v2) = notify_register_dispatch("com.apple.springboard.lockstate", &out_token, v3, v5);

  if (v2)
  {
    dispatch_queue_t v4 = qword_1000A36C8;
    if (os_log_type_enabled((os_log_t)qword_1000A36C8, OS_LOG_TYPE_ERROR)) {
      sub_10006A05C(v4);
    }
  }
}

- (void)updateLockState:(unint64_t)a3
{
  id v4 = [(PMCoreSmartPowerNapService *)self predictor];
  [v4 updateInactiveState:a3];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  os_log_t v6 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL____PMCoreSmartPowerNapProtocol];
  [v5 setExportedInterface:v6];

  v7 = (void *)qword_1000A36C8;
  if (os_log_type_enabled((os_log_t)qword_1000A36C8, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    v11[0] = 67109120;
    v11[1] = [v5 processIdentifier];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "CSPN: listener: accepted new connection from pid %d", (uint8_t *)v11, 8u);
  }
  [v5 setExportedObject:self];
  v9 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL____PMCoreSmartPowerNapCallbackProtocol];
  [v5 setRemoteObjectInterface:v9];

  [v5 resume];
  return 1;
}

- (void)registerWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = +[NSXPCConnection currentConnection];
  os_log_t v6 = [(PMCoreSmartPowerNapService *)self mainQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003C04C;
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
  id v5 = [(PMCoreSmartPowerNapService *)self mainQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003C398;
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
  id v5 = [(PMCoreSmartPowerNapService *)self clients];
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
        v12 = [(PMCoreSmartPowerNapService *)self clients];
        v13 = [v12 objectForKeyedSubscript:v11];

        if (v13
          && ([v13 connection], v14 = objc_claimAutoreleasedReturnValue(), v14, v14))
        {
          v15 = qword_1000A36C8;
          if (os_log_type_enabled((os_log_t)qword_1000A36C8, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v25 = v11;
            __int16 v26 = 1024;
            int v27 = v3;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "CSPN: Update state for client %@ to %d", buf, 0x12u);
          }
          objc_super v16 = [v13 connection];
          v17 = [v16 remoteObjectProxyWithErrorHandler:&stru_1000924F0];
          [v17 updateState:v3];
        }
        else
        {
          v18 = qword_1000A36C8;
          if (os_log_type_enabled((os_log_t)qword_1000A36C8, OS_LOG_TYPE_ERROR))
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
  -[PMCoreSmartPowerNapService updateClientsWithState:](self, "updateClientsWithState:");
}

- (void)setState:(unsigned __int8)a3
{
  id v5 = [(PMCoreSmartPowerNapService *)self mainQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10003C7DC;
  v6[3] = &unk_100091198;
  unsigned __int8 v7 = a3;
  v6[4] = self;
  dispatch_async(v5, v6);
}

- (void)syncStateWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(PMCoreSmartPowerNapService *)self mainQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003C99C;
  v7[3] = &unk_1000912C0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)enterCoreSmartPowerNap
{
  uint64_t v3 = qword_1000A36C8;
  if (os_log_type_enabled((os_log_t)qword_1000A36C8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CoreSmartPowerNap: enterCoreSmartPowerNap", buf, 2u);
  }
  [(PMCoreSmartPowerNapService *)self updateState:1];
  if (!sub_100036004())
  {
    id v4 = qword_1000A36C8;
    if (os_log_type_enabled((os_log_t)qword_1000A36C8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "CoreSmartPowerNap: changing idle timer and disabling async assertions", v10, 2u);
    }
    if (!notify_register_check("com.apple.powerd.assertionoffloadtimer", &dword_1000A4C98))
    {
      notify_set_state(dword_1000A4C98, 1uLL);
      notify_post("com.apple.powerd.assertionoffloadtimer");
    }
    [(PMCoreSmartPowerNapService *)self setAsync_assertions:0];
    io_registry_entry_t v5 = sub_1000212AC();
    if (v5)
    {
      io_registry_entry_t v6 = v5;
      unsigned __int8 v7 = +[NSNumber numberWithInt:1];
      CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v6, @"System Idle Seconds", kCFAllocatorDefault, 0);
      CFTypeID TypeID = CFNumberGetTypeID();
      if (CFProperty)
      {
        if (CFGetTypeID(CFProperty) == TypeID)
        {
          [(PMCoreSmartPowerNapService *)self setCached_idle_timer:CFProperty];
          IORegistryEntrySetCFProperty(v6, @"System Idle Seconds", v7);
        }
      }
    }
  }
}

- (void)exitCoreSmartPowerNap
{
  uint64_t v3 = qword_1000A36C8;
  if (os_log_type_enabled((os_log_t)qword_1000A36C8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CoreSmartPowerNap: exitCoreSmartPowerNap", buf, 2u);
  }
  [(PMCoreSmartPowerNapService *)self updateState:0];
  io_registry_entry_t v4 = sub_1000212AC();
  if (v4)
  {
    io_registry_entry_t v5 = v4;
    io_registry_entry_t v6 = [(PMCoreSmartPowerNapService *)self cached_idle_timer];

    if (v6)
    {
      unsigned __int8 v7 = qword_1000A36C8;
      if (os_log_type_enabled((os_log_t)qword_1000A36C8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "CoreSmartPowerNap: changing back idle timer", v11, 2u);
      }
      id v8 = [(PMCoreSmartPowerNapService *)self cached_idle_timer];
      IORegistryEntrySetCFProperty(v5, @"System Idle Seconds", v8);
    }
  }
  if (![(PMCoreSmartPowerNapService *)self async_assertions])
  {
    uint64_t v9 = qword_1000A36C8;
    if (os_log_type_enabled((os_log_t)qword_1000A36C8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "CoreSmartPowerNap: enabling async assertions", v10, 2u);
    }
    notify_set_state(dword_1000A4C98, 0);
    notify_post("com.apple.powerd.assertionoffloadtimer");
  }
}

- (void)setCSPNQueryDelta:(unsigned int)a3
{
  io_registry_entry_t v5 = qword_1000A36C8;
  if (os_log_type_enabled((os_log_t)qword_1000A36C8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    unsigned int v10 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Updating CSPN Query delta to %u", buf, 8u);
  }
  io_registry_entry_t v6 = [(PMCoreSmartPowerNapService *)self mainQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003CE84;
  v7[3] = &unk_1000912E8;
  void v7[4] = self;
  unsigned int v8 = a3;
  dispatch_async(v6, v7);
}

- (void)setCSPNRequeryDelta:(unsigned int)a3
{
  io_registry_entry_t v5 = qword_1000A36C8;
  if (os_log_type_enabled((os_log_t)qword_1000A36C8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    unsigned int v10 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Updating CSPN requery delta to %u", buf, 8u);
  }
  io_registry_entry_t v6 = [(PMCoreSmartPowerNapService *)self mainQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003CFEC;
  v7[3] = &unk_1000912E8;
  void v7[4] = self;
  unsigned int v8 = a3;
  dispatch_async(v6, v7);
}

- (void)setCSPNMotionAlarmThreshold:(unsigned int)a3
{
  io_registry_entry_t v5 = qword_1000A36C8;
  if (os_log_type_enabled((os_log_t)qword_1000A36C8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    unsigned int v10 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Updating CSPN motion alarm threshold to %u", buf, 8u);
  }
  io_registry_entry_t v6 = [(PMCoreSmartPowerNapService *)self mainQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003D158;
  v7[3] = &unk_1000912E8;
  void v7[4] = self;
  unsigned int v8 = a3;
  dispatch_async(v6, v7);
}

- (void)setCSPNMotionAlarmStartThreshold:(unsigned int)a3
{
  io_registry_entry_t v5 = qword_1000A36C8;
  if (os_log_type_enabled((os_log_t)qword_1000A36C8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    unsigned int v10 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Updating CSPN motion alarm start threshold to %u", buf, 8u);
  }
  io_registry_entry_t v6 = [(PMCoreSmartPowerNapService *)self mainQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003D2C0;
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

- (PMCoreSmartPowerNapPredictor)predictor
{
  return self->_predictor;
}

- (void)setPredictor:(id)a3
{
}

- (NSNumber)cached_idle_timer
{
  return self->_cached_idle_timer;
}

- (void)setCached_idle_timer:(id)a3
{
}

- (BOOL)async_assertions
{
  return self->_async_assertions;
}

- (void)setAsync_assertions:(BOOL)a3
{
  self->_async_assertions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cached_idle_timer, 0);
  objc_storeStrong((id *)&self->_predictor, 0);
  objc_storeStrong((id *)&self->_clients, 0);

  objc_storeStrong((id *)&self->_mainQueue, 0);
}

@end