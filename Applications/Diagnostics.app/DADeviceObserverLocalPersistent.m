@interface DADeviceObserverLocalPersistent
- (DADeviceObserverLocalPersistent)init;
- (NSMutableDictionary)handlers;
- (NSMutableSet)devices;
- (OS_dispatch_queue)persistentTaskObservationQueue;
- (OS_dispatch_queue)persistentTaskRegistrationQueue;
- (id)_spawnPersistentDevice;
- (id)beginDiscoveringDevicesWithHandler:(id)a3;
- (void)_beginObserving;
- (void)_endObserving;
- (void)_updateDevicesWithSnapshot:(id)a3;
- (void)_updateHandlers;
- (void)discoverAllDevicesWithCompletionHandler:(id)a3;
- (void)endDiscoveringDevicesWithIdentifier:(id)a3;
- (void)enhancedLoggingDidUpdateStatus:(id)a3;
- (void)setDevices:(id)a3;
- (void)setHandlers:(id)a3;
- (void)setPersistentTaskObservationQueue:(id)a3;
- (void)setPersistentTaskRegistrationQueue:(id)a3;
@end

@implementation DADeviceObserverLocalPersistent

- (DADeviceObserverLocalPersistent)init
{
  v12.receiver = self;
  v12.super_class = (Class)DADeviceObserverLocalPersistent;
  v2 = [(DADeviceObserverLocalPersistent *)&v12 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.Diagnostics.persistentTaskObservationQueue", 0);
    persistentTaskObservationQueue = v2->_persistentTaskObservationQueue;
    v2->_persistentTaskObservationQueue = (OS_dispatch_queue *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.Diagnostics.persistentTaskRegistrationQueue", 0);
    persistentTaskRegistrationQueue = v2->_persistentTaskRegistrationQueue;
    v2->_persistentTaskRegistrationQueue = (OS_dispatch_queue *)v5;

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
  id v5 = a3;
  id v6 = [(DADeviceObserverLocalPersistent *)self devices];
  (*((void (**)(id, id))a3 + 2))(v5, v6);
}

- (id)beginDiscoveringDevicesWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = +[NSUUID UUID];
  id v6 = [(DADeviceObserverLocalPersistent *)self persistentTaskRegistrationQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100021B1C;
  block[3] = &unk_10014B128;
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
  id v5 = [(DADeviceObserverLocalPersistent *)self persistentTaskRegistrationQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100021C48;
  v7[3] = &unk_10014B150;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (void)_beginObserving
{
  if (!self->_isObserving)
  {
    self->_isObserving = 1;
    dispatch_queue_t v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:self selector:"enhancedLoggingDidUpdateStatus:" name:ELSDidUpdateStatus object:0];
  }
  id v4 = +[ELSManager sharedManager];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100021DA8;
  v5[3] = &unk_10014C048;
  v5[4] = self;
  [v4 refreshWithCompletion:v5];
}

- (void)_endObserving
{
  if (self->_isObserving)
  {
    self->_isObserving = 0;
    id v3 = +[NSNotificationCenter defaultCenter];
    [v3 removeObserver:self name:ELSDidUpdateStatus object:0];
  }
}

- (void)enhancedLoggingDidUpdateStatus:(id)a3
{
  id v4 = +[ELSManager sharedManager];
  id v6 = [v4 snapshot];

  id v5 = v6;
  if (v6)
  {
    [(DADeviceObserverLocalPersistent *)self _updateDevicesWithSnapshot:v6];
    id v5 = v6;
  }
}

- (void)_updateDevicesWithSnapshot:(id)a3
{
  id v4 = a3;
  id v5 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Updating devices with snasphot: %{private}@", buf, 0xCu);
  }

  id v6 = [(DADeviceObserverLocalPersistent *)self persistentTaskObservationQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100021FE0;
  v8[3] = &unk_10014B150;
  id v9 = v4;
  id v10 = self;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (void)_updateHandlers
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = [(DADeviceObserverLocalPersistent *)self handlers];
  id v4 = [v3 copy];

  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * (void)v8);
        id v10 = [(DADeviceObserverLocalPersistent *)self handlers];
        v11 = [v10 objectForKeyedSubscript:v9];

        if (v11)
        {
          id v12 = [(DADeviceObserverLocalPersistent *)self devices];
          ((void (**)(void, void *))v11)[2](v11, v12);
        }
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
}

- (id)_spawnPersistentDevice
{
  v2 = NSClassFromString(@"DADeviceLocalPersistent");
  if (v2) {
    v2 = objc_opt_new();
  }

  return v2;
}

- (OS_dispatch_queue)persistentTaskObservationQueue
{
  return self->_persistentTaskObservationQueue;
}

- (void)setPersistentTaskObservationQueue:(id)a3
{
}

- (OS_dispatch_queue)persistentTaskRegistrationQueue
{
  return self->_persistentTaskRegistrationQueue;
}

- (void)setPersistentTaskRegistrationQueue:(id)a3
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
  objc_storeStrong((id *)&self->_persistentTaskRegistrationQueue, 0);

  objc_storeStrong((id *)&self->_persistentTaskObservationQueue, 0);
}

@end