@interface MLROnDemandConnectionHandler
- (BOOL)shouldAcceptXPCConnection:(id)a3;
- (MLROnDemandConnectionHandler)initWithPrincipalObject:(id)a3;
- (MLROnDemandTaskPerforming)pluginPrincipal;
- (NSString)description;
- (NSXPCConnection)xpcConnection;
- (id)principalObject;
- (void)performTask:(id)a3 completionHandler:(id)a4;
- (void)performTaskInternal:(id)a3 completionHandler:(id)a4;
- (void)setPluginPrincipal:(id)a3;
- (void)setXpcConnection:(id)a3;
@end

@implementation MLROnDemandConnectionHandler

- (MLROnDemandConnectionHandler)initWithPrincipalObject:(id)a3
{
  id v5 = a3;
  if ([v5 conformsToProtocol:&unk_26CC80780])
  {
    v11.receiver = self;
    v11.super_class = (Class)MLROnDemandConnectionHandler;
    v6 = [(MLROnDemandConnectionHandler *)&v11 init];
    v7 = v6;
    if (v6) {
      objc_storeStrong((id *)&v6->_pluginPrincipal, a3);
    }
    self = v7;
    v8 = self;
  }
  else
  {
    v9 = [MEMORY[0x263F3A438] coreChannel];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[MLROnDemandConnectionHandler initWithPrincipalObject:]((uint64_t)v5, v9);
    }

    v8 = 0;
  }

  return v8;
}

- (id)principalObject
{
  return self->_pluginPrincipal;
}

- (BOOL)shouldAcceptXPCConnection:(id)a3
{
  id v4 = a3;
  [v4 setExportedObject:self];
  id v5 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CC7CA58];
  [v4 setExportedInterface:v5];

  [(MLROnDemandConnectionHandler *)self setXpcConnection:v4];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __58__MLROnDemandConnectionHandler_shouldAcceptXPCConnection___block_invoke;
  v8[3] = &unk_2643F1F20;
  v8[4] = self;
  v6 = (void *)MEMORY[0x21D4A5C70](v8);
  [v4 setInterruptionHandler:v6];
  [v4 setInvalidationHandler:v6];
  [v4 resume];

  return 1;
}

void __58__MLROnDemandConnectionHandler_shouldAcceptXPCConnection___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F3A438] coreChannel];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_21C376000, v2, OS_LOG_TYPE_INFO, "%@ cancelling", (uint8_t *)&v5, 0xCu);
  }

  id v4 = [*(id *)(a1 + 32) xpcConnection];
  [v4 invalidate];
}

- (NSString)description
{
  uint64_t v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  int v5 = NSStringFromClass(v4);
  uint64_t v6 = [(MLROnDemandConnectionHandler *)self pluginPrincipal];
  uint64_t v7 = [v3 stringWithFormat:@"%@\n{\nprincipal class: %@\n}", v5, objc_opt_class()];

  return (NSString *)v7;
}

- (void)performTask:(id)a3 completionHandler:(id)a4
{
  v20[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void, void *))a4;
  v8 = (void *)MEMORY[0x263F3A490];
  v9 = [(MLROnDemandConnectionHandler *)self xpcConnection];
  LOBYTE(v8) = [v8 hasOnDemandLaunchEntitlement:v9];

  if (v8)
  {
    [(MLROnDemandConnectionHandler *)self performTaskInternal:v6 completionHandler:v7];
  }
  else
  {
    v10 = NSString;
    objc_super v11 = [MEMORY[0x263F086E0] mainBundle];
    v12 = [v11 bundleIdentifier];
    v13 = [v10 stringWithFormat:@"Missing launch entitlement with expected plugID=%@", v12];

    v14 = (void *)MEMORY[0x263F087E8];
    uint64_t v15 = *MEMORY[0x263F3A4A0];
    uint64_t v19 = *MEMORY[0x263F08320];
    v20[0] = v13;
    v16 = [NSDictionary dictionaryWithObjects:v20 forKeys:&v19 count:1];
    v17 = [v14 errorWithDomain:v15 code:8014 userInfo:v16];

    v18 = [MEMORY[0x263F3A438] coreChannel];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[MLROnDemandConnectionHandler performTask:completionHandler:]();
    }

    v7[2](v7, 0, v17);
  }
}

- (void)performTaskInternal:(id)a3 completionHandler:(id)a4
{
  v19[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void, NSObject *))a4;
  if (v7)
  {
    v8 = [(MLROnDemandConnectionHandler *)self principalObject];

    if (v8)
    {
      pluginPrincipal = self->_pluginPrincipal;
      id v17 = 0;
      v10 = [(MLROnDemandTaskPerforming *)pluginPrincipal performTask:v6 error:&v17];
      objc_super v11 = v17;
    }
    else
    {
      v12 = (void *)MEMORY[0x263F087E8];
      uint64_t v13 = *MEMORY[0x263F3A4A0];
      uint64_t v18 = *MEMORY[0x263F08320];
      v19[0] = @"Invalid principal class.";
      v14 = [NSDictionary dictionaryWithObjects:v19 forKeys:&v18 count:1];
      objc_super v11 = [v12 errorWithDomain:v13 code:1 userInfo:v14];

      v10 = 0;
    }
    uint64_t v15 = [MEMORY[0x263F3A438] coreChannel];
    v16 = v15;
    if (v11)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[MLROnDemandConnectionHandler performTaskInternal:completionHandler:]();
      }

      v7[2](v7, 0, v11);
    }
    else
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        -[MLROnDemandConnectionHandler performTaskInternal:completionHandler:]();
      }

      ((void (**)(id, void *, NSObject *))v7)[2](v7, v10, 0);
    }
  }
  else
  {
    objc_super v11 = [MEMORY[0x263F3A438] coreChannel];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[MLROnDemandConnectionHandler performTaskInternal:completionHandler:](v11);
    }
  }
}

- (NSXPCConnection)xpcConnection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_xpcConnection);

  return (NSXPCConnection *)WeakRetained;
}

- (void)setXpcConnection:(id)a3
{
}

- (MLROnDemandTaskPerforming)pluginPrincipal
{
  return self->_pluginPrincipal;
}

- (void)setPluginPrincipal:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pluginPrincipal, 0);

  objc_destroyWeak((id *)&self->_xpcConnection);
}

- (void)initWithPrincipalObject:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  objc_opt_class();
  OUTLINED_FUNCTION_2();
  id v4 = v3;
  _os_log_fault_impl(&dword_21C376000, a2, OS_LOG_TYPE_FAULT, "Unsupported principal object type = %@.", v5, 0xCu);
}

- (void)performTask:completionHandler:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_21C376000, v0, OS_LOG_TYPE_ERROR, "Fail to performTask: error=%@", v1, 0xCu);
}

- (void)performTaskInternal:(os_log_t)log completionHandler:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21C376000, log, OS_LOG_TYPE_ERROR, "Fail to performTask: nil handler", v1, 2u);
}

- (void)performTaskInternal:completionHandler:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_21C376000, v0, OS_LOG_TYPE_DEBUG, "Return result=%@", v1, 0xCu);
}

- (void)performTaskInternal:completionHandler:.cold.3()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_21C376000, v0, OS_LOG_TYPE_ERROR, "Fail to execute task with error=%@", v1, 0xCu);
}

@end