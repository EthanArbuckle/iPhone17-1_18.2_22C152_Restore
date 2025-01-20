@interface DADeviceObserverLocalRemoteRunner
- (DADeviceObserverLocalRemoteRunner)init;
- (NSMutableDictionary)devices;
- (NSMutableDictionary)handlers;
- (id)_devices;
- (id)beginDiscoveringDevicesWithHandler:(id)a3;
- (void)_updateHandlers;
- (void)createDeviceNotification:(id)a3;
- (void)destroyDeviceNotification:(id)a3;
- (void)discoverAllDevicesWithCompletionHandler:(id)a3;
- (void)endDiscoveringDevicesWithIdentifier:(id)a3;
- (void)setDevices:(id)a3;
- (void)setHandlers:(id)a3;
@end

@implementation DADeviceObserverLocalRemoteRunner

- (DADeviceObserverLocalRemoteRunner)init
{
  v10.receiver = self;
  v10.super_class = (Class)DADeviceObserverLocalRemoteRunner;
  v2 = [(DADeviceObserverLocalRemoteRunner *)&v10 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableDictionary dictionary];
    devices = v2->_devices;
    v2->_devices = (NSMutableDictionary *)v3;

    uint64_t v5 = +[NSMutableDictionary dictionary];
    handlers = v2->_handlers;
    v2->_handlers = (NSMutableDictionary *)v5;

    v7 = +[NSNotificationCenter defaultCenter];
    [v7 addObserver:v2 selector:"createDeviceNotification:" name:@"DARemoteRunnerDeviceCreatedNotification" object:0];

    v8 = +[NSNotificationCenter defaultCenter];
    [v8 addObserver:v2 selector:"destroyDeviceNotification:" name:@"DARemoteRunnerDeviceDestroyedNotification" object:0];
  }
  return v2;
}

- (id)beginDiscoveringDevicesWithHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[NSUUID UUID];
  v6 = [(DADeviceObserverLocalRemoteRunner *)self handlers];
  objc_sync_enter(v6);
  id v7 = objc_retainBlock(v4);
  v8 = [(DADeviceObserverLocalRemoteRunner *)self handlers];
  [v8 setObject:v7 forKeyedSubscript:v5];

  objc_sync_exit(v6);
  [(DADeviceObserverLocalRemoteRunner *)self _updateHandlers];

  return v5;
}

- (void)discoverAllDevicesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = +[NSSet set];
  (*((void (**)(id, id))a3 + 2))(v4, v5);
}

- (void)endDiscoveringDevicesWithIdentifier:(id)a3
{
  id v6 = a3;
  id v4 = [(DADeviceObserverLocalRemoteRunner *)self handlers];
  objc_sync_enter(v4);
  id v5 = [(DADeviceObserverLocalRemoteRunner *)self handlers];
  [v5 removeObjectForKey:v6];

  objc_sync_exit(v4);
}

- (void)createDeviceNotification:(id)a3
{
  id v14 = a3;
  uint64_t v4 = [v14 object];
  if (v4)
  {
    id v5 = (void *)v4;
    id v6 = [v14 object];
    unsigned int v7 = [v6 conformsToProtocol:&OBJC_PROTOCOL___DADevice];

    if (v7)
    {
      v8 = [v14 object];
      v9 = +[DADeviceDecoratorWithUI decorateWithDevice:v8];
      objc_super v10 = [(DADeviceObserverLocalRemoteRunner *)self devices];
      objc_sync_enter(v10);
      v11 = [(DADeviceObserverLocalRemoteRunner *)self devices];
      v12 = [v8 state];
      v13 = [v12 serialNumber];
      [v11 setObject:v9 forKeyedSubscript:v13];

      objc_sync_exit(v10);
      [(DADeviceObserverLocalRemoteRunner *)self _updateHandlers];
    }
  }
}

- (void)destroyDeviceNotification:(id)a3
{
  id v17 = a3;
  uint64_t v4 = [v17 object];
  if (v4)
  {
    id v5 = (void *)v4;
    id v6 = [v17 object];
    unsigned int v7 = [v6 conformsToProtocol:&OBJC_PROTOCOL___DADevice];

    if (v7)
    {
      v8 = [v17 object];
      v9 = [(DADeviceObserverLocalRemoteRunner *)self devices];
      objc_sync_enter(v9);
      objc_super v10 = [(DADeviceObserverLocalRemoteRunner *)self devices];
      v11 = [v8 state];
      v12 = [v11 serialNumber];
      v13 = [v10 objectForKeyedSubscript:v12];

      if (v13)
      {
        id v14 = [(DADeviceObserverLocalRemoteRunner *)self devices];
        v15 = [v8 state];
        v16 = [v15 serialNumber];
        [v14 removeObjectForKey:v16];

        objc_sync_exit(v9);
        [(DADeviceObserverLocalRemoteRunner *)self _updateHandlers];
      }
      else
      {
        objc_sync_exit(v9);
      }
    }
  }
}

- (id)_devices
{
  v2 = [(DADeviceObserverLocalRemoteRunner *)self devices];
  uint64_t v3 = [v2 allValues];
  uint64_t v4 = +[NSSet setWithArray:v3];

  return v4;
}

- (void)_updateHandlers
{
  uint64_t v3 = [(DADeviceObserverLocalRemoteRunner *)self _devices];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v4 = [(DADeviceObserverLocalRemoteRunner *)self handlers];
  id v5 = [v4 copy];

  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * (void)v9);
        v11 = [(DADeviceObserverLocalRemoteRunner *)self handlers];
        v12 = [v11 objectForKeyedSubscript:v10];

        if (v12) {
          ((void (**)(void, void *))v12)[2](v12, v3);
        }

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
}

- (NSMutableDictionary)devices
{
  return self->_devices;
}

- (void)setDevices:(id)a3
{
}

- (NSMutableDictionary)handlers
{
  return self->_handlers;
}

- (void)setHandlers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handlers, 0);

  objc_storeStrong((id *)&self->_devices, 0);
}

@end