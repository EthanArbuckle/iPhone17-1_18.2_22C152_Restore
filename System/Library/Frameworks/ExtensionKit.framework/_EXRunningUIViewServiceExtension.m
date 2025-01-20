@interface _EXRunningUIViewServiceExtension
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSXPCConnection)xpcConnection;
- (NSXPCListener)internalListener;
- (NSXPCListener)serviceListener;
- (int)startWithArguments:(const char *)a3 count:(int)a4;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
- (void)setInternalListener:(id)a3;
- (void)setServiceListener:(id)a3;
- (void)setXpcConnection:(id)a3;
@end

@implementation _EXRunningUIViewServiceExtension

- (int)startWithArguments:(const char *)a3 count:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  v7 = _EXDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[_EXRunningUIViewServiceExtension startWithArguments:count:].cold.5();
  }

  v8 = _EXSignpostLog();
  if ([(_EXRunningExtension *)self signpost] && os_signpost_enabled(v8))
  {
    v9 = v8;
    unint64_t v10 = [(_EXRunningExtension *)self signpost];
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v11 = v10;
      if (os_signpost_enabled(v9))
      {
        LOWORD(buf[0]) = 0;
        _os_signpost_emit_with_name_impl(&dword_2156DD000, v9, OS_SIGNPOST_EVENT, v11, "extensionkit-lifecycle", "PRE: +[_UIViewServiceSessionManager startViewServiceSessionWithDelegate:]", (uint8_t *)buf, 2u);
      }
    }
  }
  [MEMORY[0x263F83160] startViewServiceSessionWithDelegate:self];
  v12 = _EXSignpostLog();
  if ([(_EXRunningExtension *)self signpost] && os_signpost_enabled(v12))
  {
    v13 = v12;
    unint64_t v14 = [(_EXRunningExtension *)self signpost];
    if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v15 = v14;
      if (os_signpost_enabled(v13))
      {
        LOWORD(buf[0]) = 0;
        _os_signpost_emit_with_name_impl(&dword_2156DD000, v13, OS_SIGNPOST_EVENT, v15, "extensionkit-lifecycle", "POST: +[_UIViewServiceSessionManager startViewServiceSessionWithDelegate:]", (uint8_t *)buf, 2u);
      }
    }
  }
  v29.receiver = self;
  v29.super_class = (Class)_EXRunningUIViewServiceExtension;
  int result = [(_EXRunningExtension *)&v29 _startWithArguments:a3 count:v4];
  if (!result)
  {
    [(_EXRunningExtension *)self willFinishLaunching];
    v17 = _EXDefaultLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      -[_EXRunningUIViewServiceExtension startWithArguments:count:].cold.4();
    }

    objc_initWeak(buf, self);
    v18 = (void *)MEMORY[0x263F2B9D8];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __61___EXRunningUIViewServiceExtension_startWithArguments_count___block_invoke;
    v26[3] = &unk_264258760;
    objc_copyWeak(&v27, buf);
    [v18 listenerWithConfigurator:v26];
    [(id)objc_claimAutoreleasedReturnValue() activate];
    v19 = _EXDefaultLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      -[_EXRunningUIViewServiceExtension startWithArguments:count:]();
    }

    [(_EXRunningUIExtension *)self checkIn];
    v20 = _EXDefaultLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      -[_EXRunningUIViewServiceExtension startWithArguments:count:]();
    }

    v21 = (void *)MEMORY[0x263F2B9D8];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __61___EXRunningUIViewServiceExtension_startWithArguments_count___block_invoke_42;
    v24[3] = &unk_264258760;
    objc_copyWeak(&v25, buf);
    [v21 listenerWithConfigurator:v24];
    [(id)objc_claimAutoreleasedReturnValue() activate];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __61___EXRunningUIViewServiceExtension_startWithArguments_count___block_invoke_2;
    block[3] = &unk_264258440;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
    v22 = _EXDefaultLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      -[_EXRunningUIViewServiceExtension startWithArguments:count:]();
    }

    int result = [MEMORY[0x263F2B9F8] activateXPCService];
    __break(1u);
  }
  return result;
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  os_signpost_id_t v11 = [v9 extractNSXPCConnectionWithConfigurator:&__block_literal_global_1];
  v12 = [v9 service];
  int v13 = [v12 isEqualToString:@"MainService"];

  if (v13)
  {
    unint64_t v14 = _EXDefaultLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[_EXRunningUIViewServiceExtension listener:didReceiveConnection:withContext:]();
    }

    if ([(_EXRunningExtension *)self shouldAcceptXPCConnection:v11]) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  os_signpost_id_t v15 = [v9 service];
  int v16 = [v15 isEqualToString:@"InternalService"];

  v17 = _EXDefaultLog();
  v18 = v17;
  if (v16)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      -[_EXRunningUIViewServiceExtension listener:didReceiveConnection:withContext:]();
    }

    v19 = [_EXUISceneSession alloc];
    uint64_t v20 = [(_EXRunningExtension *)self extension];
    v21 = [(_EXUISceneSession *)v19 initWithExtension:v20];

    LOBYTE(v20) = [(_EXSceneSession *)v21 shouldAcceptXPCConnection:v11];
    if (v20) {
      goto LABEL_6;
    }
LABEL_5:
    [v9 invalidate];
LABEL_6:

    return;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    -[_EXRunningUIViewServiceExtension listener:didReceiveConnection:withContext:]();
  }

  uint64_t v22 = abort_with_reason();
  __78___EXRunningUIViewServiceExtension_listener_didReceiveConnection_withContext___block_invoke(v22);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  v6 = (NSXPCListener *)a3;
  id v7 = a4;
  if (self->_serviceListener == v6)
  {
    os_signpost_id_t v15 = _EXDefaultLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      -[_EXRunningUIViewServiceExtension listener:didReceiveConnection:withContext:]();
    }

    BOOL v14 = [(_EXRunningExtension *)self shouldAcceptXPCConnection:v7];
    goto LABEL_9;
  }
  internalListener = self->_internalListener;
  id v9 = _EXDefaultLog();
  id v10 = v9;
  if (internalListener == v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[_EXRunningUIViewServiceExtension listener:didReceiveConnection:withContext:]();
    }

    os_signpost_id_t v11 = [_EXUISceneSession alloc];
    v12 = [(_EXRunningExtension *)self extension];
    int v13 = [(_EXUISceneSession *)v11 initWithExtension:v12];

    BOOL v14 = [(_EXSceneSession *)v13 shouldAcceptXPCConnection:v7];
LABEL_9:

    return v14;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    -[_EXRunningUIViewServiceExtension listener:shouldAcceptNewConnection:]();
  }

  v17 = (_EXRunningUIViewServiceExtension *)abort_with_reason();
  return [(_EXRunningUIViewServiceExtension *)v17 xpcConnection];
}

- (NSXPCConnection)xpcConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 72, 1);
}

- (void)setXpcConnection:(id)a3
{
}

- (NSXPCListener)serviceListener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 80, 1);
}

- (void)setServiceListener:(id)a3
{
}

- (NSXPCListener)internalListener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 88, 1);
}

- (void)setInternalListener:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalListener, 0);
  objc_storeStrong((id *)&self->_serviceListener, 0);

  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

- (void)startWithArguments:count:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1(&dword_2156DD000, v0, v1, "Resuming service listener", v2, v3, v4, v5, v6);
}

- (void)startWithArguments:count:.cold.2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1(&dword_2156DD000, v0, v1, "Configuring service listener", v2, v3, v4, v5, v6);
}

- (void)startWithArguments:count:.cold.3()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1(&dword_2156DD000, v0, v1, "Checking in with launchd", v2, v3, v4, v5, v6);
}

- (void)startWithArguments:count:.cold.4()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1(&dword_2156DD000, v0, v1, "Configuring internal mach service listener", v2, v3, v4, v5, v6);
}

- (void)startWithArguments:count:.cold.5()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1(&dword_2156DD000, v0, v1, "Bootstrapping _UIViewServiceSessionManager", v2, v3, v4, v5, v6);
}

- (void)listener:didReceiveConnection:withContext:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1(&dword_2156DD000, v0, v1, "Received connection request on service listener", v2, v3, v4, v5, v6);
}

- (void)listener:didReceiveConnection:withContext:.cold.2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1(&dword_2156DD000, v0, v1, "Received scene session connection request on internal mach service listener", v2, v3, v4, v5, v6);
}

- (void)listener:didReceiveConnection:withContext:.cold.3()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 136315906;
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5_0(&dword_2156DD000, v0, v1, "%s - %s:%d: Received connection request on unknown listener %@", (uint8_t *)v2);
}

- (void)listener:shouldAcceptNewConnection:.cold.3()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 136315906;
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5_0(&dword_2156DD000, v0, v1, "%s - %s:%d: Received connection request on unknown listener %@", (uint8_t *)v2);
}

@end