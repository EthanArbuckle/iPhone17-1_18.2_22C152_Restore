@interface _HKXPCConnection
- (NSString)debugIdentifier;
- (_HKXPCConnection)initWithListenerEndpoint:(id)a3;
- (_HKXPCConnection)initWithMachServiceName:(id)a3 options:(unint64_t)a4;
- (_HKXPCConnection)initWithServiceName:(id)a3;
- (_HKXPCConnection)initWithUnderlyingConnection:(id)a3;
- (_HKXPCExportable)exportedObject;
- (id)_loggingPrefix;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (id)remoteObjectProxyWithErrorHandler:(id)a3;
- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)resume;
- (void)resumeWithExportedInterface:(id)a3 remoteInterface:(id)a4;
- (void)setDebugIdentifier:(id)a3;
- (void)setExportedObject:(id)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)unitTest_interrupt;
@end

@implementation _HKXPCConnection

- (_HKXPCConnection)initWithServiceName:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithServiceName:v4];
  if (v5)
  {
    self = [(_HKXPCConnection *)self initWithUnderlyingConnection:v5];
    v6 = self;
  }
  else
  {
    _HKInitializeLogging();
    v7 = HKLogDefault;
    if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_ERROR)) {
      -[_HKXPCConnection initWithServiceName:]((uint64_t)v4, v7);
    }
    v6 = 0;
  }

  return v6;
}

- (_HKXPCConnection)initWithMachServiceName:(id)a3 options:(unint64_t)a4
{
  id v6 = a3;
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:v6 options:a4];
  if (v7)
  {
    self = [(_HKXPCConnection *)self initWithUnderlyingConnection:v7];
    v8 = self;
  }
  else
  {
    _HKInitializeLogging();
    v9 = HKLogDefault;
    if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_ERROR)) {
      -[_HKXPCConnection initWithServiceName:]((uint64_t)v6, v9);
    }
    v8 = 0;
  }

  return v8;
}

- (_HKXPCConnection)initWithListenerEndpoint:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"_HKXPCConnection.m", 54, @"Invalid parameter not satisfying: %@", @"endpoint != nil" object file lineNumber description];
  }
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithListenerEndpoint:v5];
  v7 = [(_HKXPCConnection *)self initWithUnderlyingConnection:v6];

  return v7;
}

- (_HKXPCConnection)initWithUnderlyingConnection:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"_HKXPCConnection.m", 61, @"Invalid parameter not satisfying: %@", @"connection != nil" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)_HKXPCConnection;
  v7 = [(_HKXPCConnection *)&v11 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_underlyingConnection, a3);
    [(_HKXPCConnection *)v8 setInterruptionHandler:0];
    [(_HKXPCConnection *)v8 setInvalidationHandler:0];
  }

  return v8;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_underlyingConnection setInvalidationHandler:0];
  [(NSXPCConnection *)self->_underlyingConnection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)_HKXPCConnection;
  [(_HKXPCConnection *)&v3 dealloc];
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  return [(NSXPCConnection *)self->_underlyingConnection remoteObjectProxyWithErrorHandler:a3];
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  return [(NSXPCConnection *)self->_underlyingConnection synchronousRemoteObjectProxyWithErrorHandler:a3];
}

- (void)resume
{
  p_exportedObject = &self->_exportedObject;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_exportedObject);
  id v4 = [WeakRetained exportedInterface];
  id v5 = objc_loadWeakRetained((id *)p_exportedObject);
  id v6 = [v5 remoteInterface];
  [(_HKXPCConnection *)self resumeWithExportedInterface:v4 remoteInterface:v6];
}

- (void)resumeWithExportedInterface:(id)a3 remoteInterface:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_exportedObject);

  if (!WeakRetained)
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"_HKXPCConnection.m", 95, @"Invalid parameter not satisfying: %@", @"_exportedObject != nil" object file lineNumber description];
  }
  id v10 = objc_loadWeakRetained((id *)&self->_exportedObject);
  if (v10)
  {
    objc_super v11 = [(_HKXPCConnection *)self _loggingPrefix];
    uint64_t v12 = [(NSXPCConnection *)self->_underlyingConnection serviceName];
    v13 = (void *)v12;
    v14 = @"<anonymous>";
    if (v12) {
      v14 = (__CFString *)v12;
    }
    v15 = v14;

    objc_initWeak(&location, self);
    underlyingConnection = self->_underlyingConnection;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __64___HKXPCConnection_resumeWithExportedInterface_remoteInterface___block_invoke;
    v28[3] = &unk_1E58C8578;
    id v17 = v11;
    id v29 = v17;
    v18 = v15;
    v30 = v18;
    objc_copyWeak(&v31, &location);
    [(NSXPCConnection *)underlyingConnection setInterruptionHandler:v28];
    v19 = self->_underlyingConnection;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __64___HKXPCConnection_resumeWithExportedInterface_remoteInterface___block_invoke_26;
    v24[3] = &unk_1E58C8578;
    id v20 = v17;
    id v25 = v20;
    v21 = v18;
    v26 = v21;
    objc_copyWeak(&v27, &location);
    [(NSXPCConnection *)v19 setInvalidationHandler:v24];
    [(NSXPCConnection *)self->_underlyingConnection setExportedInterface:v7];
    [(NSXPCConnection *)self->_underlyingConnection setRemoteObjectInterface:v8];
    v22 = objc_alloc_init(_HKXPCExportedObjectProxy);
    [(_HKXPCExportedObjectProxy *)v22 setWeakExportedObject:v10];
    [(NSXPCConnection *)self->_underlyingConnection setExportedObject:v22];
    if (objc_opt_respondsToSelector()) {
      [v10 connectionConfigured];
    }

    objc_destroyWeak(&v27);
    objc_destroyWeak(&v31);

    objc_destroyWeak(&location);
  }
  [(NSXPCConnection *)self->_underlyingConnection resume];
}

- (void)invalidate
{
}

- (void)unitTest_interrupt
{
  v2 = (void (**)(void))_Block_copy(self->_interruptionHandler);
  if (v2)
  {
    objc_super v3 = v2;
    v2[2]();
    v2 = v3;
  }
}

- (void)setInterruptionHandler:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    objc_initWeak(&location, self);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __43___HKXPCConnection_setInterruptionHandler___block_invoke;
    v7[3] = &unk_1E58BD6C0;
    objc_copyWeak(&v8, &location);
    id v4 = _Block_copy(v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  id v5 = _Block_copy(v4);
  id interruptionHandler = self->_interruptionHandler;
  self->_id interruptionHandler = v5;
}

- (void)setInvalidationHandler:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    objc_initWeak(&location, self);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __43___HKXPCConnection_setInvalidationHandler___block_invoke;
    v7[3] = &unk_1E58BD6C0;
    objc_copyWeak(&v8, &location);
    id v4 = _Block_copy(v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  id v5 = _Block_copy(v4);
  id invalidationHandler = self->_invalidationHandler;
  self->_id invalidationHandler = v5;
}

- (id)_loggingPrefix
{
  debugIdentifier = self->_debugIdentifier;
  if (debugIdentifier) {
    [NSString stringWithFormat:@"%@:%p: ", debugIdentifier, self];
  }
  else {
  objc_super v3 = objc_msgSend(NSString, "stringWithFormat:", @"%p: ", self, v5);
  }

  return v3;
}

- (_HKXPCExportable)exportedObject
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_exportedObject);

  return (_HKXPCExportable *)WeakRetained;
}

- (void)setExportedObject:(id)a3
{
}

- (NSString)debugIdentifier
{
  return self->_debugIdentifier;
}

- (void)setDebugIdentifier:(id)a3
{
}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong((id *)&self->_debugIdentifier, 0);
  objc_destroyWeak((id *)&self->_exportedObject);

  objc_storeStrong((id *)&self->_underlyingConnection, 0);
}

- (void)initWithServiceName:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_19C023000, a2, OS_LOG_TYPE_ERROR, "Could not establish connection with %@", (uint8_t *)&v2, 0xCu);
}

@end