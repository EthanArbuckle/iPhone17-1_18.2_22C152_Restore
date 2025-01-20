@interface IPLocalNullXPCServer
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (IPLocalNullXPCServer)init;
- (id)newClientConnection;
- (void)actionBarrier:(id)a3;
- (void)getActiveInstallations:(id)a3;
- (void)getAllInstallableStates:(id)a3;
- (void)getProgressForIdentity:(id)a3 completion:(id)a4;
- (void)registerAsProgressObserver:(id)a3;
@end

@implementation IPLocalNullXPCServer

- (IPLocalNullXPCServer)init
{
  v8.receiver = self;
  v8.super_class = (Class)IPLocalNullXPCServer;
  v2 = [(IPLocalNullXPCServer *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F08D88] anonymousListener];
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v3;

    [(NSXPCListener *)v2->_listener setDelegate:v2];
    uint64_t v5 = [(NSXPCListener *)v2->_listener endpoint];
    listenerEndpoint = v2->_listenerEndpoint;
    v2->_listenerEndpoint = (NSXPCListenerEndpoint *)v5;

    [(NSXPCListener *)v2->_listener resume];
  }
  return v2;
}

- (id)newClientConnection
{
  id v3 = objc_alloc(MEMORY[0x263F08D68]);
  listenerEndpoint = self->_listenerEndpoint;

  return (id)[v3 initWithListenerEndpoint:listenerEndpoint];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = IPServerExportedInterface();
  [v5 setExportedInterface:v6];

  [v5 setExportedObject:self];
  v7 = IPClientExportedInterface();
  [v5 setRemoteObjectInterface:v7];

  [v5 resume];
  return 1;
}

- (void)actionBarrier:(id)a3
{
  v4 = (void *)*MEMORY[0x263F08438];
  id v5 = a3;
  _IPMakeNSErrorImpl(v4, 78, (uint64_t)"-[IPLocalNullXPCServer actionBarrier:]", 51, 0);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a3 + 2))(v5, v6);
}

- (void)getActiveInstallations:(id)a3
{
  v4 = (void *)*MEMORY[0x263F08438];
  id v5 = a3;
  _IPMakeNSErrorImpl(v4, 78, (uint64_t)"-[IPLocalNullXPCServer getActiveInstallations:]", 56, 0);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void, id))a3 + 2))(v5, 0, v6);
}

- (void)getAllInstallableStates:(id)a3
{
  v4 = (void *)*MEMORY[0x263F08438];
  id v5 = a3;
  _IPMakeNSErrorImpl(v4, 78, (uint64_t)"-[IPLocalNullXPCServer getAllInstallableStates:]", 61, 0);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void, id))a3 + 2))(v5, 0, v6);
}

- (void)getProgressForIdentity:(id)a3 completion:(id)a4
{
  id v5 = (void *)*MEMORY[0x263F08438];
  id v6 = a4;
  _IPMakeNSErrorImpl(v5, 78, (uint64_t)"-[IPLocalNullXPCServer getProgressForIdentity:completion:]", 66, 0);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void, id))a4 + 2))(v6, 0, v7);
}

- (void)registerAsProgressObserver:(id)a3
{
  v4 = (void *)*MEMORY[0x263F08438];
  id v5 = a3;
  _IPMakeNSErrorImpl(v4, 78, (uint64_t)"-[IPLocalNullXPCServer registerAsProgressObserver:]", 71, 0);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a3 + 2))(v5, v6);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listenerEndpoint, 0);

  objc_storeStrong((id *)&self->_listener, 0);
}

@end