@interface DADeviceObserverAccessories
- (DADeviceObserverAccessories)init;
- (NSMutableDictionary)handlers;
- (NSMutableSet)devices;
- (OS_dispatch_queue)accessoryObservationQueue;
- (OS_dispatch_queue)accessoryRegistrationQueue;
- (id)_accessoryIdentifiersToPromote;
- (id)_fetchDevices;
- (id)beginDiscoveringDevicesWithHandler:(id)a3;
- (void)_accessoryConnected:(id)a3;
- (void)_accessoryDisconnected:(id)a3;
- (void)_beginObserving;
- (void)_endObserving;
- (void)_updateDevices;
- (void)_updateHandlers;
- (void)discoverAllDevicesWithCompletionHandler:(id)a3;
- (void)endDiscoveringDevicesWithIdentifier:(id)a3;
- (void)setAccessoryObservationQueue:(id)a3;
- (void)setAccessoryRegistrationQueue:(id)a3;
- (void)setDevices:(id)a3;
- (void)setHandlers:(id)a3;
@end

@implementation DADeviceObserverAccessories

- (DADeviceObserverAccessories)init
{
  v12.receiver = self;
  v12.super_class = (Class)DADeviceObserverAccessories;
  v2 = [(DADeviceObserverAccessories *)&v12 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.Diagnostics.accessoryObservationQueue", 0);
    accessoryObservationQueue = v2->_accessoryObservationQueue;
    v2->_accessoryObservationQueue = (OS_dispatch_queue *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.Diagnostics.accessoryRegistrationQueue", 0);
    accessoryRegistrationQueue = v2->_accessoryRegistrationQueue;
    v2->_accessoryRegistrationQueue = (OS_dispatch_queue *)v5;

    v2->_isObserving = 0;
    uint64_t v7 = +[NSMutableSet set];
    devices = v2->_devices;
    v2->_devices = (NSMutableSet *)v7;

    uint64_t v9 = +[NSMutableDictionary dictionary];
    handlers = v2->_handlers;
    v2->_handlers = (NSMutableDictionary *)v9;
  }
  return v2;
}

- (void)discoverAllDevicesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = [(DADeviceObserverAccessories *)self accessoryObservationQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000092CC;
  v7[3] = &unk_100014648;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (id)beginDiscoveringDevicesWithHandler:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = +[NSUUID UUID];
  id v6 = [(DADeviceObserverAccessories *)self accessoryRegistrationQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000941C;
  block[3] = &unk_1000147A0;
  block[4] = self;
  id v7 = v5;
  id v13 = v7;
  id v14 = v4;
  id v8 = v4;
  dispatch_async(v6, block);

  uint64_t v9 = v14;
  id v10 = v7;

  return v10;
}

- (void)endDiscoveringDevicesWithIdentifier:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = [(DADeviceObserverAccessories *)self accessoryRegistrationQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100009548;
  v7[3] = &unk_100014708;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)_beginObserving
{
  if (!self->_isObserving)
  {
    self->_isObserving = 1;
    dispatch_queue_t v3 = +[EAAccessoryManager sharedAccessoryManager];
    [v3 registerForLocalNotifications];

    id v4 = +[NSNotificationCenter defaultCenter];
    dispatch_queue_t v5 = +[EAAccessoryManager sharedAccessoryManager];
    [v4 addObserver:self selector:"_accessoryConnected:" name:EAAccessoryDidConnectNotification object:v5];

    id v6 = +[NSNotificationCenter defaultCenter];
    id v7 = +[EAAccessoryManager sharedAccessoryManager];
    [v6 addObserver:self selector:"_accessoryDisconnected:" name:EAAccessoryDidDisconnectNotification object:v7];
  }
  [(DADeviceObserverAccessories *)self _updateDevices];
}

- (void)_accessoryConnected:(id)a3
{
  id v4 = [a3 userInfo];
  dispatch_queue_t v5 = [v4 objectForKeyedSubscript:EAAccessoryKey];

  if (v5)
  {
    id v6 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [v5 serialNumber];
      int v8 = 138412290;
      uint64_t v9 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[%@] Accessory connected", (uint8_t *)&v8, 0xCu);
    }
    [(DADeviceObserverAccessories *)self _updateDevices];
  }
}

- (void)_accessoryDisconnected:(id)a3
{
  id v4 = [a3 userInfo];
  dispatch_queue_t v5 = [v4 objectForKeyedSubscript:EAAccessoryKey];

  if (v5)
  {
    id v6 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [v5 serialNumber];
      int v8 = 138412290;
      uint64_t v9 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[%@] Accessory disconnected", (uint8_t *)&v8, 0xCu);
    }
    [(DADeviceObserverAccessories *)self _updateDevices];
  }
}

- (void)_endObserving
{
  if (self->_isObserving)
  {
    self->_isObserving = 0;
    dispatch_queue_t v3 = +[NSNotificationCenter defaultCenter];
    [v3 removeObserver:self];

    id v4 = +[EAAccessoryManager sharedAccessoryManager];
    [v4 unregisterForLocalNotifications];
  }
}

- (void)_updateDevices
{
  dispatch_queue_t v3 = [(DADeviceObserverAccessories *)self accessoryObservationQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009A0C;
  block[3] = &unk_1000147C8;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)_updateHandlers
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  dispatch_queue_t v3 = [(DADeviceObserverAccessories *)self handlers];
  id v4 = [v3 copy];

  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      int v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * (void)v8);
        id v10 = [(DADeviceObserverAccessories *)self handlers];
        v11 = [v10 objectForKeyedSubscript:v9];

        if (v11)
        {
          objc_super v12 = [(DADeviceObserverAccessories *)self devices];
          ((void (**)(void, void *))v11)[2](v11, v12);
        }
        int v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
}

- (id)_fetchDevices
{
  dispatch_queue_t v3 = [(DADeviceObserverAccessories *)self devices];
  id v4 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v3 count]);

  id v5 = +[DSIOHIDDevice deviceMatchingAccessories:&off_100015468];
  id v6 = v5;
  if (!v5) {
    goto LABEL_13;
  }
  uint64_t v7 = [v5 serialNumber];
  if (v7)
  {
    int v8 = (void *)v7;
    uint64_t v9 = +[NSMutableDictionary dictionary];
    [v9 setObject:v8 forKeyedSubscript:@"serialNumber"];
    id v10 = +[DSEADevice deviceWithSerialNumber:v8];
    v11 = v10;
    if (v10)
    {
      objc_super v12 = [v10 information];
      [v9 addEntriesFromDictionary:v12];
    }
    id v13 = [v9 copy];
    long long v14 = +[DAAdapterAccessory accessoryWithIdentifier:@"Accessory.SmartBatteryCase" attributes:v13];

    if (!v14) {
      goto LABEL_12;
    }
    uint64_t v15 = [v14 serialNumber];
    if (!v15) {
      goto LABEL_12;
    }
    long long v16 = (void *)v15;
    v17 = [(DADeviceObserverAccessories *)self _accessoryIdentifiersToPromote];
    v18 = [v14 identifier];
    unsigned int v19 = [v17 containsObject:v18];

    if (!v19) {
      goto LABEL_12;
    }
    v20 = NSClassFromString(@"DADeviceAccessory");
    if (v20)
    {
      v21 = (DADeviceRepresentation *)[[v20 alloc] initWithAccessory:v14];
      if (!v21)
      {
LABEL_11:

LABEL_12:
LABEL_13:

        id v22 = v4;
        goto LABEL_15;
      }
    }
    else
    {
      v24 = [DADeviceRepresentation alloc];
      v25 = [v14 serialNumber];
      v21 = [(DADeviceRepresentation *)v24 initWithSerialNumber:v25 isLocal:1 attributes:&__NSDictionary0__struct];

      if (!v21) {
        goto LABEL_11;
      }
    }
    [v4 addObject:v21];
    goto LABEL_11;
  }
  id v22 = +[NSSet set];

LABEL_15:
  return v22;
}

- (id)_accessoryIdentifiersToPromote
{
  if (qword_10001C3C8 != -1) {
    dispatch_once(&qword_10001C3C8, &stru_1000147E8);
  }
  v2 = (void *)qword_10001C3C0;
  return v2;
}

- (OS_dispatch_queue)accessoryObservationQueue
{
  return self->_accessoryObservationQueue;
}

- (void)setAccessoryObservationQueue:(id)a3
{
}

- (OS_dispatch_queue)accessoryRegistrationQueue
{
  return self->_accessoryRegistrationQueue;
}

- (void)setAccessoryRegistrationQueue:(id)a3
{
}

- (NSMutableDictionary)handlers
{
  return self->_handlers;
}

- (void)setHandlers:(id)a3
{
}

- (NSMutableSet)devices
{
  return self->_devices;
}

- (void)setDevices:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_handlers, 0);
  objc_storeStrong((id *)&self->_accessoryRegistrationQueue, 0);
  objc_storeStrong((id *)&self->_accessoryObservationQueue, 0);
}

@end