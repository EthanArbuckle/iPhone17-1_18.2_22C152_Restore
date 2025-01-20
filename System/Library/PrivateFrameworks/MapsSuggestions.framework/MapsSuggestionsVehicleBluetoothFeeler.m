@interface MapsSuggestionsVehicleBluetoothFeeler
+ (BOOL)isEnabled;
- (BOOL)canProduceSignalType:(int64_t)a3;
- (BOOL)stopUpdatingSignals;
- (BOOL)updateSignals;
- (MapsSuggestionsVehicleBluetoothFeeler)initWithDelegate:(id)a3 name:(id)a4;
- (void)_updateForConnectionState:(int)a3;
- (void)dealloc;
@end

@implementation MapsSuggestionsVehicleBluetoothFeeler

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

- (BOOL)canProduceSignalType:(int64_t)a3
{
  return a3 == 39;
}

- (MapsSuggestionsVehicleBluetoothFeeler)initWithDelegate:(id)a3 name:(id)a4
{
  objc_initWeak(&location, a3);
  id v6 = a4;
  id v7 = objc_loadWeakRetained(&location);
  v24.receiver = self;
  v24.super_class = (Class)MapsSuggestionsVehicleBluetoothFeeler;
  v8 = [(MapsSuggestionsBaseFeeler *)&v24 initWithDelegate:v7 name:v6];

  if (v8)
  {
    dispatch_queue_t v9 = dispatch_queue_create("MapsSuggestionsVehicleBluetoothFeeler", 0);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v9;

    v11 = (MapsSuggestionsMutableSignalPack *)[objc_alloc((Class)MapsSuggestionsMutableSignalPack) initWithCapacity:1];
    signalPack = v8->_signalPack;
    v8->_signalPack = v11;

    objc_initWeak(&from, v8);
    v13 = v8->_queue;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10002A008;
    handler[3] = &unk_100071BB8;
    objc_copyWeak(&v22, &from);
    notify_register_dispatch("com.apple.locationd.vehicle.connected", &v8->_notificationTokenConnect, v13, handler);
    v14 = v8->_queue;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10002A114;
    v19[3] = &unk_100071BB8;
    objc_copyWeak(&v20, &from);
    notify_register_dispatch("com.apple.locationd.vehicle.disconnected", &v8->_notificationTokenDisconnect, v14, v19);
    v15 = v8->_queue;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10002A220;
    v17[3] = &unk_100071BB8;
    objc_copyWeak(&v18, &from);
    notify_register_dispatch("com.apple.locationd.vehicle.exit", &v8->_notificationTokenExit, v15, v17);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&from);
  }

  objc_destroyWeak(&location);
  return v8;
}

- (BOOL)stopUpdatingSignals
{
  return 1;
}

- (BOOL)updateSignals
{
  unsigned int v3 = sub_10002A4A8(self);
  if (self)
  {
    unsigned int v4 = v3;
    v5 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int v11 = 136315394;
      v12 = "-[MapsSuggestionsVehicleBluetoothFeeler _updateAndSendSignalPack:]";
      __int16 v13 = 1024;
      unsigned int v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "bluetoothFeeler: %s: %d", (uint8_t *)&v11, 0x12u);
    }

    id v6 = self;
    objc_sync_enter(v6);
    id v7 = [(MapsSuggestionsMutableSignalPack *)v6->_signalPack mutableCopy];
    objc_sync_exit(v6);

    if (v4 < 3)
    {
      LODWORD(v8) = dword_100056530[v4];
      [v7 writeSignalValue:39 forType:v8];
    }
    dispatch_queue_t v9 = [(MapsSuggestionsBaseFeeler *)v6 delegate];
    [v9 feeler:v6 sendsSignalPack:v7];
  }
  return 1;
}

- (void)_updateForConnectionState:(int)a3
{
  if (sub_10002A4A8(self) != a3)
  {
    if (self)
    {
      v5 = self;
      objc_sync_enter(v5);
      v5->_connectionState = a3;
      objc_sync_exit(v5);
    }
    id v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v7[0] = 67109120;
      v7[1] = sub_10002A4A8(self);
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "bluetoothFeeler: setting connection state to %d", (uint8_t *)v7, 8u);
    }

    [(MapsSuggestionsVehicleBluetoothFeeler *)self updateSignals];
  }
}

- (void)dealloc
{
  int notificationTokenConnect = self->_notificationTokenConnect;
  if (notificationTokenConnect)
  {
    notify_cancel(notificationTokenConnect);
    self->_int notificationTokenConnect = 0;
  }
  int notificationTokenDisconnect = self->_notificationTokenDisconnect;
  if (notificationTokenDisconnect)
  {
    notify_cancel(notificationTokenDisconnect);
    self->_int notificationTokenDisconnect = 0;
  }
  int notificationTokenExit = self->_notificationTokenExit;
  if (notificationTokenExit)
  {
    notify_cancel(notificationTokenExit);
    self->_int notificationTokenExit = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)MapsSuggestionsVehicleBluetoothFeeler;
  [(MapsSuggestionsVehicleBluetoothFeeler *)&v6 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_signalPack, 0);
}

@end