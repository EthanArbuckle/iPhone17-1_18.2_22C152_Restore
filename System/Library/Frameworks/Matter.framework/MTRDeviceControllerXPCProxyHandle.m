@interface MTRDeviceControllerXPCProxyHandle
- (MTRDeviceControllerServerProtocol)proxy;
- (MTRDeviceControllerXPCProxyHandle)initWithXPCConnection:(id)a3;
- (NSXPCConnection)xpcConnection;
- (void)dealloc;
@end

@implementation MTRDeviceControllerXPCProxyHandle

- (MTRDeviceControllerXPCProxyHandle)initWithXPCConnection:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MTRDeviceControllerXPCProxyHandle;
  v5 = [(MTRDeviceControllerXPCProxyHandle *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_xpcConnection, v4);
  }

  return v6;
}

- (MTRDeviceControllerServerProtocol)proxy
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_xpcConnection);
  v5 = objc_msgSend_remoteObjectProxy(WeakRetained, v3, v4);

  return (MTRDeviceControllerServerProtocol *)v5;
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_xpcConnection);
  objc_msgSend_invalidate(WeakRetained, v4, v5);

  v6.receiver = self;
  v6.super_class = (Class)MTRDeviceControllerXPCProxyHandle;
  [(MTRDeviceControllerXPCProxyHandle *)&v6 dealloc];
}

- (NSXPCConnection)xpcConnection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_xpcConnection);

  return (NSXPCConnection *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end