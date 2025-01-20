@interface ARDaemonControl
+ (NSString)serviceName;
- (ARDaemonControl)initWithConnection:(id)a3;
- (ARServer)server;
- (void)getStatusDictionaryWithReply:(id)a3;
- (void)getStatusDictionaryWithWaitEndOfTransition:(BOOL)a3 reply:(id)a4;
- (void)getStatusWithVerboseOutput:(BOOL)a3 reply:(id)a4;
- (void)getStatusWithVerboseOutput:(BOOL)a3 waitForEndOfTransaction:(BOOL)a4 reply:(id)a5;
- (void)interruptionHandler;
- (void)invalidationHandler;
- (void)setServer:(id)a3;
@end

@implementation ARDaemonControl

+ (NSString)serviceName
{
  return (NSString *)(id)*MEMORY[0x263F20E18];
}

- (ARDaemonControl)initWithConnection:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v16.receiver = self;
    v16.super_class = (Class)ARDaemonControl;
    v6 = [(ARDaemonControl *)&v16 init];
    if (v6)
    {
      [v5 setExportedObject:v6];
      v7 = [MEMORY[0x263F20F30] controlInterface];
      [v5 setExportedInterface:v7];

      v8 = [MEMORY[0x263F20F30] controlProxyInterface];
      [v5 setRemoteObjectInterface:v8];

      objc_initWeak(&location, v6);
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __38__ARDaemonControl_initWithConnection___block_invoke;
      v13[3] = &unk_265206DE0;
      objc_copyWeak(&v14, &location);
      [v5 setInterruptionHandler:v13];
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __38__ARDaemonControl_initWithConnection___block_invoke_2;
      v11[3] = &unk_265206DE0;
      objc_copyWeak(&v12, &location);
      [v5 setInvalidationHandler:v11];
      objc_storeStrong((id *)&v6->_connection, a3);
      objc_destroyWeak(&v12);
      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }
    self = v6;
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void __38__ARDaemonControl_initWithConnection___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained interruptionHandler];
}

void __38__ARDaemonControl_initWithConnection___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained invalidationHandler];
}

- (void)getStatusDictionaryWithReply:(id)a3
{
}

- (void)getStatusWithVerboseOutput:(BOOL)a3 reply:(id)a4
{
}

- (void)getStatusDictionaryWithWaitEndOfTransition:(BOOL)a3 reply:(id)a4
{
  BOOL v4 = a3;
  v10 = (void (**)(id, void *))a4;
  p_server = &self->_server;
  id WeakRetained = objc_loadWeakRetained((id *)p_server);

  if (WeakRetained)
  {
    id v8 = objc_loadWeakRetained((id *)p_server);
    v9 = [v8 statusDictionaryWithWaitEndOfTransition:v4];
  }
  else
  {
    v9 = &unk_26FB61F90;
  }
  v10[2](v10, v9);
}

- (void)getStatusWithVerboseOutput:(BOOL)a3 waitForEndOfTransaction:(BOOL)a4 reply:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  v13 = (void (**)(id, __CFString *))a5;
  p_server = &self->_server;
  id WeakRetained = objc_loadWeakRetained((id *)p_server);

  if (WeakRetained)
  {
    id v10 = objc_loadWeakRetained((id *)p_server);
    v11 = v10;
    if (v6) {
      [v10 fullDescriptionWithWaitEndOfTransition:v5];
    }
    else {
    id v12 = [v10 statusStringWithWaitEndOfTransition:v5];
    }
  }
  else
  {
    id v12 = @"server initializing";
  }
  v13[2](v13, v12);
}

- (void)interruptionHandler
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v3 = _ARLogGeneral_2();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    BOOL v4 = (objc_class *)objc_opt_class();
    BOOL v5 = NSStringFromClass(v4);
    int v6 = 138543618;
    v7 = v5;
    __int16 v8 = 2048;
    v9 = self;
    _os_log_impl(&dword_24719A000, v3, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Control interrupted", (uint8_t *)&v6, 0x16u);
  }
}

- (void)invalidationHandler
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v3 = _ARLogGeneral_2();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    BOOL v4 = (objc_class *)objc_opt_class();
    BOOL v5 = NSStringFromClass(v4);
    int v7 = 138543618;
    __int16 v8 = v5;
    __int16 v9 = 2048;
    uint64_t v10 = self;
    _os_log_impl(&dword_24719A000, v3, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Control invalidated", (uint8_t *)&v7, 0x16u);
  }
  connection = self->_connection;
  self->_connection = 0;
}

- (ARServer)server
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_server);
  return (ARServer *)WeakRetained;
}

- (void)setServer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_server);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end