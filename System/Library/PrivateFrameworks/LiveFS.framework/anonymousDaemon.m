@interface anonymousDaemon
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (Class)clientClass;
- (NSObject)proxy;
- (NSXPCInterface)interface;
- (NSXPCListener)listener;
- (NSXPCListenerEndpoint)endpoint;
- (OS_dispatch_queue)queue;
- (anonymousDaemon)initWithListener:(id)a3;
- (id)initUsingInterface:(id)a3 clientClass:(Class)a4 queue:(id)a5 andProxy:(id)a6;
- (void)dealloc;
@end

@implementation anonymousDaemon

- (id)initUsingInterface:(id)a3 clientClass:(Class)a4 queue:(id)a5 andProxy:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)anonymousDaemon;
  v14 = [(anonymousDaemon *)&v24 init];
  if (v14)
  {
    if (a4
      && v11
      && v13
      && ([v11 protocol],
          v15 = objc_claimAutoreleasedReturnValue(),
          char v16 = [(objc_class *)a4 conformsToProtocol:v15],
          v15,
          (v16 & 1) != 0))
    {
      if ([(objc_class *)a4 conformsToProtocol:&unk_26EE24BB8])
      {
        uint64_t v17 = [MEMORY[0x263F08D88] anonymousListener];
        listener = v14->_listener;
        v14->_listener = (NSXPCListener *)v17;

        [(NSXPCListener *)v14->_listener setDelegate:v14];
        [(NSXPCListener *)v14->_listener resume];
        objc_storeStrong((id *)&v14->_interface, a3);
        objc_storeStrong((id *)&v14->_clientClass, a4);
        objc_storeStrong((id *)&v14->_proxy, a6);
        objc_storeStrong((id *)&v14->_queue, a5);
        goto LABEL_8;
      }
      v20 = (void *)MEMORY[0x263EFF940];
      uint64_t v21 = *MEMORY[0x263EFF498];
      v22 = @"Attempt to create listener using proxy object which does not conform to LiveFSConnectorMaker";
    }
    else
    {
      v20 = (void *)MEMORY[0x263EFF940];
      uint64_t v21 = *MEMORY[0x263EFF498];
      v22 = @"Attempt to create listener using proxy object which does not conform to exported protocol";
    }
    id v23 = [v20 exceptionWithName:v21 reason:v22 userInfo:0];
    objc_exception_throw(v23);
  }
LABEL_8:

  return v14;
}

- (anonymousDaemon)initWithListener:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)anonymousDaemon;
  v6 = [(anonymousDaemon *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_endpoint, a3);
  }

  return v7;
}

- (void)dealloc
{
  [(NSXPCListener *)self->_listener invalidate];
  proxy = self->_proxy;
  self->_proxy = 0;

  interface = self->_interface;
  self->_interface = 0;

  listener = self->_listener;
  self->_listener = 0;

  v6.receiver = self;
  v6.super_class = (Class)anonymousDaemon;
  [(anonymousDaemon *)&v6 dealloc];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  objc_super v6 = livefs_std_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[anonymousDaemon listener:shouldAcceptNewConnection:](v6, v7, v8, v9, v10, v11, v12, v13);
  }

  [v5 setExportedInterface:self->_interface];
  Class clientClass = self->_clientClass;
  proxy = self->_proxy;
  id v34 = 0;
  char v16 = (void *)[(objc_class *)clientClass newExportObjectForObject:proxy connection:v5 error:&v34];
  id v17 = v34;
  [v5 setExportedObject:v16];
  v18 = +[LiveFSVolumeClient exportedClientInterface];
  [v5 setRemoteObjectInterface:v18];

  if (v17)
  {
    v19 = livefs_std_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[anonymousDaemon listener:shouldAcceptNewConnection:]((uint64_t)v17, v19);
    }
  }
  else
  {
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __54__anonymousDaemon_listener_shouldAcceptNewConnection___block_invoke;
    v32[3] = &unk_264DC7810;
    v20 = v16;
    v33 = v20;
    [v5 setInvalidationHandler:v32];
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __54__anonymousDaemon_listener_shouldAcceptNewConnection___block_invoke_2;
    v30[3] = &unk_264DC7810;
    v31 = v20;
    [v5 setInterruptionHandler:v30];
    if (self->_queue) {
      objc_msgSend(v5, "_setQueue:");
    }
    [v5 resume];
    uint64_t v21 = livefs_std_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      -[anonymousDaemon listener:shouldAcceptNewConnection:](v21, v22, v23, v24, v25, v26, v27, v28);
    }

    v19 = v33;
  }

  return v17 == 0;
}

- (NSXPCListener)listener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 8, 1);
}

- (NSXPCInterface)interface
{
  return (NSXPCInterface *)objc_getProperty(self, a2, 16, 1);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (Class)clientClass
{
  return (Class)objc_getProperty(self, a2, 32, 1);
}

- (NSObject)proxy
{
  return objc_getProperty(self, a2, 40, 1);
}

- (NSXPCListenerEndpoint)endpoint
{
  return (NSXPCListenerEndpoint *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_proxy, 0);
  objc_storeStrong((id *)&self->_clientClass, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_interface, 0);

  objc_storeStrong((id *)&self->_listener, 0);
}

- (void)listener:(uint64_t)a3 shouldAcceptNewConnection:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)listener:(uint64_t)a1 shouldAcceptNewConnection:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  v3 = "-[anonymousDaemon listener:shouldAcceptNewConnection:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_23AB0B000, a2, OS_LOG_TYPE_ERROR, "%s: error allocating client: %@", (uint8_t *)&v2, 0x16u);
}

- (void)listener:(uint64_t)a3 shouldAcceptNewConnection:(uint64_t)a4 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end