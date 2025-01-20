@interface ARServerConnection
- (ARServerConnection)initWithListenerEndpoint:(id)a3;
- (ARServerConnection)initWithServiceName:(id)a3;
- (ARServerConnection)initWithServiceName:(id)a3 options:(unint64_t)a4;
- (ARServerConnection)initWithServiceName:(id)a3 options:(unint64_t)a4 queue:(id)a5;
- (ARServerConnectionDelegate)delegate;
- (NSXPCConnection)connection;
- (NSXPCInterface)exportedInterface;
- (NSXPCInterface)remoteObjectInterface;
- (NSXPCListenerEndpoint)listenerEndpoint;
- (id)exportedObject;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (id)remoteObjectProxy;
- (id)remoteObjectProxyWithErrorHandler:(id)a3;
- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)serverConnectionInterrupted;
- (void)serverConnectionInvalidated;
- (void)setDelegate:(id)a3;
- (void)setExportedInterface:(id)a3;
- (void)setExportedObject:(id)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setListenerEndpoint:(id)a3;
- (void)setRemoteObjectInterface:(id)a3;
@end

@implementation ARServerConnection

- (ARServerConnection)initWithListenerEndpoint:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ARServerConnection;
  v6 = [(ARServerConnection *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_listenerEndpoint, a3);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __47__ARServerConnection_initWithListenerEndpoint___block_invoke;
    v11[3] = &unk_1E6187768;
    id v12 = v5;
    uint64_t v8 = [v11 copy];
    id connectionCreationBlock = v7->_connectionCreationBlock;
    v7->_id connectionCreationBlock = (id)v8;
  }
  return v7;
}

id __47__ARServerConnection_initWithListenerEndpoint___block_invoke(uint64_t a1)
{
  v1 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithListenerEndpoint:*(void *)(a1 + 32)];
  return v1;
}

- (ARServerConnection)initWithServiceName:(id)a3 options:(unint64_t)a4 queue:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v18.receiver = self;
  v18.super_class = (Class)ARServerConnection;
  v10 = [(ARServerConnection *)&v18 init];
  if (v10)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __56__ARServerConnection_initWithServiceName_options_queue___block_invoke;
    v14[3] = &unk_1E6187790;
    id v15 = v8;
    unint64_t v17 = a4;
    id v16 = v9;
    uint64_t v11 = [v14 copy];
    id connectionCreationBlock = v10->_connectionCreationBlock;
    v10->_id connectionCreationBlock = (id)v11;
  }
  return v10;
}

id __56__ARServerConnection_initWithServiceName_options_queue___block_invoke(void *a1)
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:a1[4] options:a1[6]];
  v3 = v2;
  if (a1[5]) {
    objc_msgSend(v2, "_setQueue:");
  }
  return v3;
}

- (ARServerConnection)initWithServiceName:(id)a3 options:(unint64_t)a4
{
  return [(ARServerConnection *)self initWithServiceName:a3 options:a4 queue:0];
}

- (ARServerConnection)initWithServiceName:(id)a3
{
  return [(ARServerConnection *)self initWithServiceName:a3 options:4096];
}

- (void)dealloc
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (_ARLogGeneral_onceToken_37 != -1) {
    dispatch_once(&_ARLogGeneral_onceToken_37, &__block_literal_global_83);
  }
  v3 = (void *)_ARLogGeneral_logObj_37;
  if (os_log_type_enabled((os_log_t)_ARLogGeneral_logObj_37, OS_LOG_TYPE_DEBUG))
  {
    v4 = v3;
    id v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    *(_DWORD *)buf = 138543618;
    id v9 = v6;
    __int16 v10 = 2048;
    uint64_t v11 = self;
    _os_log_impl(&dword_1B88A2000, v4, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: dealloc", buf, 0x16u);
  }
  [(ARServerConnection *)self invalidate];
  v7.receiver = self;
  v7.super_class = (Class)ARServerConnection;
  [(ARServerConnection *)&v7 dealloc];
}

- (NSXPCConnection)connection
{
  connection = self->_connection;
  if (!connection)
  {
    (*((void (**)(void))self->_connectionCreationBlock + 2))();
    v4 = (NSXPCConnection *)objc_claimAutoreleasedReturnValue();
    id v5 = self->_connection;
    self->_connection = v4;

    [(NSXPCConnection *)self->_connection setExportedInterface:self->_exportedInterface];
    [(NSXPCConnection *)self->_connection setExportedObject:self->_exportedObjectWeakReference];
    [(NSXPCConnection *)self->_connection setRemoteObjectInterface:self->_remoteObjectInterface];
    objc_initWeak(&location, self);
    v6 = self->_connection;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __32__ARServerConnection_connection__block_invoke;
    v11[3] = &unk_1E61852E8;
    objc_copyWeak(&v12, &location);
    [(NSXPCConnection *)v6 setInterruptionHandler:v11];
    objc_super v7 = self->_connection;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __32__ARServerConnection_connection__block_invoke_2;
    v9[3] = &unk_1E61852E8;
    objc_copyWeak(&v10, &location);
    [(NSXPCConnection *)v7 setInvalidationHandler:v9];
    [(NSXPCConnection *)self->_connection resume];
    objc_destroyWeak(&v10);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
    connection = self->_connection;
  }
  return connection;
}

void __32__ARServerConnection_connection__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained serverConnectionInterrupted];
}

void __32__ARServerConnection_connection__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained serverConnectionInvalidated];
}

- (void)setExportedInterface:(id)a3
{
  objc_storeStrong((id *)&self->_exportedInterface, a3);
  [(ARServerConnection *)self invalidate];
}

- (id)exportedObject
{
  return [(ARWeakReference *)self->_exportedObjectWeakReference object];
}

- (void)setExportedObject:(id)a3
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = (ARWeakReference *)v6;
  }
  else
  {
    v4 = +[ARWeakReference weakReferenceWithObject:v6];
  }
  exportedObjectWeakReference = self->_exportedObjectWeakReference;
  self->_exportedObjectWeakReference = v4;

  [(ARServerConnection *)self invalidate];
}

- (void)setRemoteObjectInterface:(id)a3
{
  objc_storeStrong((id *)&self->_remoteObjectInterface, a3);
  [(ARServerConnection *)self invalidate];
}

- (void)invalidate
{
}

- (void)serverConnectionInterrupted
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    [v6 serverConnectionInterrupted:self];
  }
}

- (void)serverConnectionInvalidated
{
  connection = self->_connection;
  self->_connection = 0;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    [v6 serverConnectionInvalidated:self];
  }
}

- (id)remoteObjectProxy
{
  v2 = [(ARServerConnection *)self connection];
  v3 = [v2 remoteObjectProxy];

  return v3;
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  char v5 = [(ARServerConnection *)self connection];
  id v6 = [v5 remoteObjectProxyWithErrorHandler:v4];

  return v6;
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  char v5 = [(ARServerConnection *)self connection];
  id v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v4];

  return v6;
}

- (id)interruptionHandler
{
  v2 = [(ARServerConnection *)self connection];
  v3 = [v2 interruptionHandler];

  return v3;
}

- (void)setInterruptionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(ARServerConnection *)self connection];
  [v5 setInterruptionHandler:v4];
}

- (id)invalidationHandler
{
  v2 = [(ARServerConnection *)self connection];
  v3 = [v2 invalidationHandler];

  return v3;
}

- (void)setInvalidationHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(ARServerConnection *)self connection];
  [v5 setInvalidationHandler:v4];
}

- (ARServerConnectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ARServerConnectionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSXPCInterface)exportedInterface
{
  return self->_exportedInterface;
}

- (NSXPCInterface)remoteObjectInterface
{
  return self->_remoteObjectInterface;
}

- (NSXPCListenerEndpoint)listenerEndpoint
{
  return self->_listenerEndpoint;
}

- (void)setListenerEndpoint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listenerEndpoint, 0);
  objc_storeStrong((id *)&self->_remoteObjectInterface, 0);
  objc_storeStrong((id *)&self->_exportedInterface, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_exportedObjectWeakReference, 0);
  objc_storeStrong(&self->_connectionCreationBlock, 0);
}

@end