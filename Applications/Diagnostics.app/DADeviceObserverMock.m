@interface DADeviceObserverMock
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (DADeviceObserverMock)init;
- (NSMutableDictionary)devices;
- (NSMutableDictionary)handlers;
- (NSXPCListener)listener;
- (id)_devices;
- (id)beginDiscoveringDevicesWithHandler:(id)a3;
- (void)_updateHandlers;
- (void)createDeviceWithSerialNumber:(id)a3 attributes:(id)a4 completion:(id)a5;
- (void)destroyDeviceWithSerialNumber:(id)a3 completion:(id)a4;
- (void)discoverAllDevicesWithCompletionHandler:(id)a3;
- (void)endDiscoveringDevicesWithIdentifier:(id)a3;
- (void)getDeviceStateWithSerialNumber:(id)a3 completion:(id)a4;
- (void)setDevices:(id)a3;
- (void)setHandlers:(id)a3;
- (void)setListener:(id)a3;
- (void)updateDeviceState:(id)a3 completion:(id)a4;
@end

@implementation DADeviceObserverMock

- (DADeviceObserverMock)init
{
  v10.receiver = self;
  v10.super_class = (Class)DADeviceObserverMock;
  v2 = [(DADeviceObserverMock *)&v10 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableDictionary dictionary];
    devices = v2->_devices;
    v2->_devices = (NSMutableDictionary *)v3;

    uint64_t v5 = +[NSMutableDictionary dictionary];
    handlers = v2->_handlers;
    v2->_handlers = (NSMutableDictionary *)v5;

    v7 = (NSXPCListener *)[objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.diagnostics.mock-device-service"];
    listener = v2->_listener;
    v2->_listener = v7;

    [(NSXPCListener *)v2->_listener setDelegate:v2];
    [(NSXPCListener *)v2->_listener resume];
  }
  return v2;
}

- (void)createDeviceWithSerialNumber:(id)a3 attributes:(id)a4 completion:(id)a5
{
  id v17 = a3;
  id v8 = a4;
  v9 = (void (**)(id, void *))a5;
  objc_super v10 = [(DADeviceObserverMock *)self devices];
  objc_sync_enter(v10);
  v11 = [(DADeviceObserverMock *)self devices];
  uint64_t v12 = [v11 objectForKeyedSubscript:v17];

  objc_sync_exit(v10);
  v13 = (DADeviceMock *)v12;
  if (!v12)
  {
    v13 = [(DADeviceRepresentation *)[DADeviceMock alloc] initWithSerialNumber:v17 isLocal:1 attributes:v8];
    v14 = [(DADeviceObserverMock *)self devices];
    objc_sync_enter(v14);
    v15 = [(DADeviceObserverMock *)self devices];
    [v15 setObject:v13 forKeyedSubscript:v17];

    objc_sync_exit(v14);
    [(DADeviceObserverMock *)self _updateHandlers];
  }
  v16 = +[NSNumber numberWithBool:v12 == 0];
  v9[2](v9, v16);
}

- (void)getDeviceStateWithSerialNumber:(id)a3 completion:(id)a4
{
  id v11 = a3;
  v6 = (void (**)(id, void *))a4;
  v7 = [(DADeviceObserverMock *)self devices];
  objc_sync_enter(v7);
  id v8 = [(DADeviceObserverMock *)self devices];
  v9 = [v8 objectForKeyedSubscript:v11];

  objc_sync_exit(v7);
  objc_super v10 = [v9 state];
  v6[2](v6, v10);
}

- (void)updateDeviceState:(id)a3 completion:(id)a4
{
  id v13 = a3;
  v6 = (void (**)(id, void *))a4;
  v7 = [(DADeviceObserverMock *)self devices];
  objc_sync_enter(v7);
  id v8 = [(DADeviceObserverMock *)self devices];
  v9 = [v13 serialNumber];
  objc_super v10 = [v8 objectForKeyedSubscript:v9];

  objc_sync_exit(v7);
  if (v10)
  {
    id v11 = [v10 state];
    [v11 updateWithDeviceState:v13];
  }
  uint64_t v12 = +[NSNumber numberWithBool:v10 != 0];
  v6[2](v6, v12);
}

- (void)destroyDeviceWithSerialNumber:(id)a3 completion:(id)a4
{
  id v12 = a3;
  v6 = (void (**)(id, void *))a4;
  v7 = [(DADeviceObserverMock *)self devices];
  objc_sync_enter(v7);
  id v8 = [(DADeviceObserverMock *)self devices];
  v9 = [v8 objectForKeyedSubscript:v12];

  if (v9)
  {
    objc_super v10 = [(DADeviceObserverMock *)self devices];
    [v10 removeObjectForKey:v12];

    objc_sync_exit(v7);
    [(DADeviceObserverMock *)self _updateHandlers];
  }
  else
  {
    objc_sync_exit(v7);
  }
  id v11 = +[NSNumber numberWithBool:v9 != 0];
  v6[2](v6, v11);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = [v5 valueForEntitlement:@"com.apple.diagnostics.mock-device-service"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v6 BOOLValue])
  {
    v7 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___DADeviceObserverMockProtocol];
    id v8 = +[NSSet setWithObject:objc_opt_class()];
    [v7 setClasses:v8 forSelector:"updateDeviceState:completion:" argumentIndex:0 ofReply:0];

    v9 = +[NSSet setWithObject:objc_opt_class()];
    [v7 setClasses:v9 forSelector:"getDeviceStateWithSerialNumber:completion:" argumentIndex:0 ofReply:1];

    [v5 setExportedObject:self];
    [v5 setExportedInterface:v7];
    [v5 setRemoteObjectInterface:0];
    [v5 resume];
  }
  else
  {
    [v5 invalidate];
  }

  return 1;
}

- (void)discoverAllDevicesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = +[NSSet set];
  (*((void (**)(id, id))a3 + 2))(v4, v5);
}

- (id)beginDiscoveringDevicesWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = +[NSUUID UUID];
  v6 = [(DADeviceObserverMock *)self handlers];
  objc_sync_enter(v6);
  id v7 = objc_retainBlock(v4);
  id v8 = [(DADeviceObserverMock *)self handlers];
  [v8 setObject:v7 forKeyedSubscript:v5];

  objc_sync_exit(v6);
  [(DADeviceObserverMock *)self _updateHandlers];

  return v5;
}

- (void)endDiscoveringDevicesWithIdentifier:(id)a3
{
  id v6 = a3;
  id v4 = [(DADeviceObserverMock *)self handlers];
  objc_sync_enter(v4);
  id v5 = [(DADeviceObserverMock *)self handlers];
  [v5 removeObjectForKey:v6];

  objc_sync_exit(v4);
}

- (id)_devices
{
  v2 = [(DADeviceObserverMock *)self devices];
  uint64_t v3 = [v2 allValues];
  id v4 = +[NSSet setWithArray:v3];

  return v4;
}

- (void)_updateHandlers
{
  uint64_t v3 = [(DADeviceObserverMock *)self _devices];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [(DADeviceObserverMock *)self handlers];
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
        id v11 = [(DADeviceObserverMock *)self handlers];
        id v12 = [v11 objectForKeyedSubscript:v10];

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

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
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

  objc_storeStrong((id *)&self->_listener, 0);
}

@end