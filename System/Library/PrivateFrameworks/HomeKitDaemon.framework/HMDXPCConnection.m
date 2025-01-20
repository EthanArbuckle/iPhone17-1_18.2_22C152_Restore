@interface HMDXPCConnection
- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken;
- (HMDXPCConnection)initWithXPCConnection:(id)a3;
- (HMFProcessInfo)processInfo;
- (NSXPCConnection)xpcConnection;
- (NSXPCInterface)exportedInterface;
- (NSXPCInterface)remoteObjectInterface;
- (OS_dispatch_queue)queue;
- (id)attributeDescriptions;
- (id)exportedObject;
- (id)interruptionHandler;
- (id)remoteObjectProxy;
- (id)remoteObjectProxyWithErrorHandler:(id)a3;
- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3;
- (id)valueForEntitlement:(id)a3;
- (int)processIdentifier;
- (void)activate;
- (void)invalidate;
- (void)resume;
- (void)setExportedInterface:(id)a3;
- (void)setExportedObject:(id)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRemoteObjectInterface:(id)a3;
@end

@implementation HMDXPCConnection

- (void).cxx_destruct
{
}

- (NSXPCConnection)xpcConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 16, 1);
}

- (id)attributeDescriptions
{
  v12[2] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  v4 = objc_msgSend(NSNumber, "numberWithInt:", -[HMDXPCConnection processIdentifier](self, "processIdentifier"));
  v5 = (void *)[v3 initWithName:@"Process ID" value:v4];
  v12[0] = v5;
  id v6 = objc_alloc(MEMORY[0x263F424F8]);
  v7 = [(HMDXPCConnection *)self processInfo];
  v8 = [v7 name];
  v9 = (void *)[v6 initWithName:@"Process Name" value:v8];
  v12[1] = v9;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:2];

  return v10;
}

- (void)invalidate
{
  id v2 = [(HMDXPCConnection *)self xpcConnection];
  [v2 invalidate];
}

- (void)resume
{
  id v2 = [(HMDXPCConnection *)self xpcConnection];
  [v2 resume];
}

- (void)activate
{
  id v2 = [(HMDXPCConnection *)self xpcConnection];
  [v2 activate];
}

- (id)valueForEntitlement:(id)a3
{
  id v4 = a3;
  v5 = [(HMDXPCConnection *)self xpcConnection];
  id v6 = [v5 valueForEntitlement:v4];

  return v6;
}

- (void)setInvalidationHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDXPCConnection *)self xpcConnection];
  [v5 setInvalidationHandler:v4];
}

- (void)setInterruptionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDXPCConnection *)self xpcConnection];
  [v5 setInterruptionHandler:v4];
}

- (id)interruptionHandler
{
  id v2 = [(HMDXPCConnection *)self xpcConnection];
  id v3 = [v2 interruptionHandler];

  return v3;
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDXPCConnection *)self xpcConnection];
  id v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v4];

  return v6;
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDXPCConnection *)self xpcConnection];
  id v6 = [v5 remoteObjectProxyWithErrorHandler:v4];

  return v6;
}

- (id)remoteObjectProxy
{
  id v2 = [(HMDXPCConnection *)self xpcConnection];
  id v3 = [v2 remoteObjectProxy];

  return v3;
}

- (void)setRemoteObjectInterface:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDXPCConnection *)self xpcConnection];
  [v5 setRemoteObjectInterface:v4];
}

- (NSXPCInterface)remoteObjectInterface
{
  id v2 = [(HMDXPCConnection *)self xpcConnection];
  id v3 = [v2 remoteObjectInterface];

  return (NSXPCInterface *)v3;
}

- (void)setExportedInterface:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDXPCConnection *)self xpcConnection];
  [v5 setExportedInterface:v4];
}

- (NSXPCInterface)exportedInterface
{
  id v2 = [(HMDXPCConnection *)self xpcConnection];
  id v3 = [v2 exportedInterface];

  return (NSXPCInterface *)v3;
}

- (void)setExportedObject:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDXPCConnection *)self xpcConnection];
  [v5 setExportedObject:v4];
}

- (id)exportedObject
{
  id v2 = [(HMDXPCConnection *)self xpcConnection];
  id v3 = [v2 exportedObject];

  return v3;
}

- (void)setQueue:(id)a3
{
  id v6 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v5 = [(HMDXPCConnection *)self xpcConnection];
  [v5 _setQueue:v6];

  os_unfair_lock_unlock(p_lock);
}

- (OS_dispatch_queue)queue
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = [(HMDXPCConnection *)self xpcConnection];
  id v5 = [v4 _queue];

  os_unfair_lock_unlock(p_lock);
  return (OS_dispatch_queue *)v5;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  id v4 = [(HMDXPCConnection *)self xpcConnection];
  if (v4)
  {
    id v6 = v4;
    [v4 auditToken];
    id v4 = v6;
  }
  else
  {
    *(_OWORD *)retstr->var0 = 0u;
    *(_OWORD *)&retstr->var0[4] = 0u;
  }

  return result;
}

- (int)processIdentifier
{
  id v2 = [(HMDXPCConnection *)self xpcConnection];
  int v3 = [v2 processIdentifier];

  return v3;
}

- (HMFProcessInfo)processInfo
{
  id v2 = (void *)MEMORY[0x263F42618];
  int v3 = [(HMDXPCConnection *)self xpcConnection];
  id v4 = [v2 processInfoForXPCConnection:v3];

  return (HMFProcessInfo *)v4;
}

- (HMDXPCConnection)initWithXPCConnection:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v6 = v5;
    v12.receiver = self;
    v12.super_class = (Class)HMDXPCConnection;
    v7 = [(HMDXPCConnection *)&v12 init];
    v8 = v7;
    if (v7) {
      objc_storeStrong((id *)&v7->_xpcConnection, a3);
    }

    return v8;
  }
  else
  {
    v10 = (HMDCameraSnapshotRemoteStreamReceiver *)_HMFPreconditionFailure();
    [(HMDCameraSnapshotRemoteStreamReceiver *)v10 .cxx_destruct];
  }
  return result;
}

@end