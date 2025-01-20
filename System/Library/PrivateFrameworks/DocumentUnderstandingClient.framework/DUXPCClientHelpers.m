@interface DUXPCClientHelpers
- (DUXPCClientHelpers)initWithServiceName:(id)a3 whitelistedServerInterface:(id)a4 clientExportedObject:(id)a5 interruptionHandler:(id)a6 invalidationHandler:(id)a7;
- (id)remoteObjectProxy;
- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3;
- (void)_locked_establishConnection;
- (void)dealloc;
@end

@implementation DUXPCClientHelpers

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_destroyWeak(&self->_clientExportedObject);
  objc_storeStrong((id *)&self->_allowListedServerInterface, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  p_connectionLock = &self->_connectionLock;
  id v5 = a3;
  pthread_mutex_lock(p_connectionLock);
  [(DUXPCClientHelpers *)self _locked_establishConnection];
  v6 = [(NSXPCConnection *)self->_connection synchronousRemoteObjectProxyWithErrorHandler:v5];

  pthread_mutex_unlock(p_connectionLock);
  return v6;
}

- (id)remoteObjectProxy
{
  p_connectionLock = &self->_connectionLock;
  pthread_mutex_lock(&self->_connectionLock);
  [(DUXPCClientHelpers *)self _locked_establishConnection];
  v4 = [(NSXPCConnection *)self->_connection remoteObjectProxy];
  pthread_mutex_unlock(p_connectionLock);
  return v4;
}

- (void)_locked_establishConnection
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (!self->_connection)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      serviceName = self->_serviceName;
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = serviceName;
      _os_log_impl(&dword_24CF75000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Establishing new connection to %@ .", buf, 0xCu);
    }
    v4 = (NSXPCConnection *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:self->_serviceName options:0];
    connection = self->_connection;
    self->_connection = v4;

    [(NSXPCConnection *)self->_connection setRemoteObjectInterface:self->_allowListedServerInterface];
    id WeakRetained = objc_loadWeakRetained(&self->_clientExportedObject);
    [(NSXPCConnection *)self->_connection setExportedObject:WeakRetained];

    *(void *)buf = 0;
    objc_initWeak((id *)buf, self);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = sub_24CF7A898;
    v12[3] = &unk_2652FA640;
    objc_copyWeak(&v13, (id *)buf);
    [(NSXPCConnection *)self->_connection setInterruptionHandler:v12];
    uint64_t v7 = MEMORY[0x263EF8330];
    uint64_t v8 = 3221225472;
    v9 = sub_24CF7A960;
    v10 = &unk_2652FA640;
    objc_copyWeak(&v11, (id *)buf);
    [(NSXPCConnection *)self->_connection setInvalidationHandler:&v7];
    [(NSXPCConnection *)self->_connection resume];
    objc_destroyWeak(&v11);
    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)buf);
  }
}

- (void)dealloc
{
  pthread_mutex_destroy(&self->_connectionLock);
  v3.receiver = self;
  v3.super_class = (Class)DUXPCClientHelpers;
  [(DUXPCClientHelpers *)&v3 dealloc];
}

- (DUXPCClientHelpers)initWithServiceName:(id)a3 whitelistedServerInterface:(id)a4 clientExportedObject:(id)a5 interruptionHandler:(id)a6 invalidationHandler:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v25.receiver = self;
  v25.super_class = (Class)DUXPCClientHelpers;
  v18 = [(DUXPCClientHelpers *)&v25 init];
  v19 = v18;
  if (v18)
  {
    pthread_mutex_init(&v18->_connectionLock, 0);
    objc_storeStrong((id *)&v19->_serviceName, a3);
    objc_storeStrong((id *)&v19->_allowListedServerInterface, a4);
    objc_storeWeak(&v19->_clientExportedObject, v15);
    uint64_t v20 = MEMORY[0x253318FD0](v16);
    id interruptionHandler = v19->_interruptionHandler;
    v19->_id interruptionHandler = (id)v20;

    uint64_t v22 = MEMORY[0x253318FD0](v17);
    id invalidationHandler = v19->_invalidationHandler;
    v19->_id invalidationHandler = (id)v22;
  }
  return v19;
}

@end