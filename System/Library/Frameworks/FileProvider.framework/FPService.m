@interface FPService
- (FPService)initWithEndpoint:(id)a3 interface:(id)a4 lifetimeExtender:(id)a5 providerDomainID:(id)a6;
- (FPService)initWithProxy:(id)a3 interface:(id)a4 lifetimeExtender:(id)a5 providerDomainID:(id)a6;
- (id)remoteObjectProxy;
- (id)remoteObjectProxyCreating;
- (id)synchronousRemoteObjectProxy;
- (void)dealloc;
- (void)invalidate;
@end

@implementation FPService

- (id)remoteObjectProxy
{
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __30__FPService_remoteObjectProxy__block_invoke;
  v11[3] = &unk_1E5AF28F8;
  v11[4] = self;
  v3 = (void *)MEMORY[0x1A6248B00](v11, a2);
  v4 = [FPXPCAutomaticErrorProxy alloc];
  connection = self->_connection;
  if (!connection) {
    connection = self->_proxy;
  }
  v6 = [(NSXPCInterface *)self->_interface protocol];
  v7 = [(NSXPCInterface *)self->_interface protocol];
  v8 = NSStringFromProtocol(v7);
  v9 = [(FPXPCAutomaticErrorProxy *)v4 initWithConnection:connection protocol:v6 orError:0 name:v8 requestPid:getpid() requestWillBegin:v3];

  return v9;
}

- (FPService)initWithEndpoint:(id)a3 interface:(id)a4 lifetimeExtender:(id)a5 providerDomainID:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v27.receiver = self;
  v27.super_class = (Class)FPService;
  v14 = [(FPService *)&v27 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_extender, a5);
    uint64_t v16 = [objc_alloc(MEMORY[0x1E4F29268]) initWithListenerEndpoint:v10];
    connection = v15->_connection;
    v15->_connection = (NSXPCConnection *)v16;

    [(NSXPCConnection *)v15->_connection setRemoteObjectInterface:v11];
    v18 = v15->_connection;
    v19 = [[FPXPCSanitizer alloc] initWithProviderDomainIdentifier:v13];
    [(NSXPCConnection *)v18 fp_annotateWithXPCSanitizer:v19];

    objc_storeStrong((id *)&v15->_interface, a4);
    id location = 0;
    objc_initWeak(&location, v15);
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    v23 = __74__FPService_initWithEndpoint_interface_lifetimeExtender_providerDomainID___block_invoke;
    v24 = &unk_1E5AF06C8;
    objc_copyWeak(&v25, &location);
    [(NSXPCConnection *)v15->_connection setInterruptionHandler:&v21];
    [(NSXPCConnection *)v15->_connection resume];
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }

  return v15;
}

- (FPService)initWithProxy:(id)a3 interface:(id)a4 lifetimeExtender:(id)a5 providerDomainID:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)FPService;
  id v13 = [(FPService *)&v16 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_extender, a5);
    objc_storeStrong((id *)&v14->_proxy, a3);
    objc_storeStrong((id *)&v14->_interface, a4);
  }

  return v14;
}

id __30__FPService_remoteObjectProxy__block_invoke_2()
{
  return self;
}

id __30__FPService_remoteObjectProxy__block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __30__FPService_remoteObjectProxy__block_invoke_2;
  v3[3] = &unk_1E5AF28D0;
  v3[4] = *(void *)(a1 + 32);
  v1 = (void *)MEMORY[0x1A6248B00](v3);

  return v1;
}

- (void)dealloc
{
  [(FPService *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)FPService;
  [(FPService *)&v3 dealloc];
}

- (void)invalidate
{
  obj = self;
  objc_sync_enter(obj);
  [(FPDLifetimeServicing *)obj->_extender stopExtendingLifetime];
  extender = obj->_extender;
  obj->_extender = 0;

  [(NSXPCConnection *)obj->_connection invalidate];
  objc_sync_exit(obj);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interface, 0);
  objc_storeStrong((id *)&self->_proxy, 0);
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong((id *)&self->_extender, 0);
}

void __74__FPService_initWithEndpoint_interface_lifetimeExtender_providerDomainID___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained invalidate];
}

- (id)remoteObjectProxyCreating
{
  return [(NSXPCConnection *)self->_connection remoteObjectProxy];
}

- (id)synchronousRemoteObjectProxy
{
  v2 = [(FPService *)self remoteObjectProxy];
  objc_super v3 = [v2 synchronousRemoteObjectProxy];

  return v3;
}

@end