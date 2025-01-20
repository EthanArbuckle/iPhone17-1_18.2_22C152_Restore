@interface CMIOExtensionProviderServer
+ (CMIOExtensionProviderServer)sharedServer;
- (BOOL)internalDaemon;
- (CMIOExtensionProviderServer)init;
- (void)addConnection:(id)a3;
- (void)dealloc;
- (void)init;
- (void)start;
- (void)stop;
@end

@implementation CMIOExtensionProviderServer

+ (CMIOExtensionProviderServer)sharedServer
{
  if (sharedServer_onceToken != -1) {
    dispatch_once(&sharedServer_onceToken, &__block_literal_global_3);
  }
  return (CMIOExtensionProviderServer *)sharedServer_gServer;
}

CMIOExtensionProviderServer *__43__CMIOExtensionProviderServer_sharedServer__block_invoke()
{
  result = objc_alloc_init(CMIOExtensionProviderServer);
  sharedServer_gServer = (uint64_t)result;
  return result;
}

- (CMIOExtensionProviderServer)init
{
  v13.receiver = self;
  v13.super_class = (Class)CMIOExtensionProviderServer;
  v2 = [(CMIOExtensionProviderServer *)&v13 init];
  if (v2)
  {
    uint64_t v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "mainBundle"), "objectForInfoDictionaryKey:", @"CMIOExtension");
    if (v3 && (v4 = (void *)v3, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && [v4 count])
    {
      v2->_serviceName = (NSString *)(id)[v4 objectForKeyedSubscript:@"CMIOExtensionMachServiceName"];
      v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      global_queue = dispatch_get_global_queue(21, 0);
      v7 = dispatch_queue_create_with_target_V2("com.apple.cmio.CMIOExtensionProviderServer", v5, global_queue);
      v2->_queue = (OS_dispatch_queue *)v7;
      v8 = xpc_connection_create(0, v7);
      v2->_listener = v8;
      v2->_endpoint = xpc_endpoint_create(v8);
      listener = v2->_listener;
      handler[0] = MEMORY[0x263EF8330];
      handler[1] = 3221225472;
      handler[2] = __35__CMIOExtensionProviderServer_init__block_invoke;
      handler[3] = &unk_26517C8F0;
      handler[4] = v2;
      xpc_connection_set_event_handler(listener, handler);
      v2->_internalDaemon = 1;
    }
    else
    {
      v10 = CMIOLog();
      if (v10 && os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[CMIOExtensionProviderServer init]();
      }

      return 0;
    }
  }
  return v2;
}

uint64_t __35__CMIOExtensionProviderServer_init__block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = result;
    result = MEMORY[0x245679950](a2);
    if (result == MEMORY[0x263EF86F0])
    {
      v4 = *(void **)(v3 + 32);
      return [v4 addConnection:a2];
    }
  }
  return result;
}

- (void)dealloc
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v3 = CMIOLog();
  if (v3)
  {
    v4 = v3;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      objc_super v13 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderServer.m");
      __int16 v14 = 1024;
      int v15 = 116;
      __int16 v16 = 2080;
      v17 = "-[CMIOExtensionProviderServer dealloc]";
      _os_log_impl(&dword_2432B6000, v4, OS_LOG_TYPE_DEFAULT, "%s:%d:%s dealloc starting", buf, 0x1Cu);
    }
  }

  v5 = CMIOLog();
  if (v5)
  {
    v6 = v5;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderServer.m");
      *(_DWORD *)buf = 136315650;
      objc_super v13 = v7;
      __int16 v14 = 1024;
      int v15 = 123;
      __int16 v16 = 2080;
      v17 = "-[CMIOExtensionProviderServer dealloc]";
      _os_log_impl(&dword_2432B6000, v6, OS_LOG_TYPE_DEFAULT, "%s:%d:%s calling [super dealloc]", buf, 0x1Cu);
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)CMIOExtensionProviderServer;
  [(CMIOExtensionProviderServer *)&v11 dealloc];
  v8 = CMIOLog();
  if (v8)
  {
    v9 = v8;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderServer.m");
      *(_DWORD *)buf = 136315650;
      objc_super v13 = v10;
      __int16 v14 = 1024;
      int v15 = 126;
      __int16 v16 = 2080;
      v17 = "-[CMIOExtensionProviderServer dealloc]";
      _os_log_impl(&dword_2432B6000, v9, OS_LOG_TYPE_DEFAULT, "%s:%d:%s dealloc done", buf, 0x1Cu);
    }
  }
}

- (void)start
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderServer.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s Failed to get the current process Mach-O UUID", v2, v3, v4, v5, v6);
}

void __36__CMIOExtensionProviderServer_start__block_invoke(uint64_t a1, xpc_object_t original)
{
  xpc_object_t reply = xpc_dictionary_create_reply(original);
  xpc_dictionary_set_uuid(reply, "mach-o-uuid", start_unique_info);
  xpc_dictionary_set_value(reply, "endpoint", *(xpc_object_t *)(*(void *)(a1 + 32) + 24));
  cmio_XPCMessageSetCFString(reply, "bundle-id", *(CFTypeRef *)(a1 + 40));
  cmio_XPCMessageSetCFDictionary(reply, "bundle-info", *(CFTypeRef *)(a1 + 48));
  xpc_dictionary_send_reply();

  xpc_release(reply);
}

- (void)stop
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v3 = CMIOLog();
  if (v3)
  {
    uint64_t v4 = v3;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315906;
      v9 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderServer.m");
      __int16 v10 = 1024;
      int v11 = 157;
      __int16 v12 = 2080;
      objc_super v13 = "-[CMIOExtensionProviderServer stop]";
      __int16 v14 = 2112;
      int v15 = self;
      _os_log_impl(&dword_2432B6000, v4, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@: cancelling listener", (uint8_t *)&v8, 0x26u);
    }
  }
  xpc_connection_cancel(self->_listener);
  uint64_t v5 = CMIOLog();
  if (v5)
  {
    uint8_t v6 = v5;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderServer.m");
      int v8 = 136315906;
      v9 = v7;
      __int16 v10 = 1024;
      int v11 = 159;
      __int16 v12 = 2080;
      objc_super v13 = "-[CMIOExtensionProviderServer stop]";
      __int16 v14 = 2112;
      int v15 = self;
      _os_log_impl(&dword_2432B6000, v6, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@: finished stopping things", (uint8_t *)&v8, 0x26u);
    }
  }
}

- (void)addConnection:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v3 = [[CMIOExtensionProviderContext alloc] initWithConnection:a3];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = (void *)MEMORY[0x245679360]();
    id v6 = +[CMIOExtensionProvider sharedProvider];
    v7 = CMIOLog();
    if (v7)
    {
      int v8 = v7;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 136315906;
        int v11 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderServer.m");
        __int16 v12 = 1024;
        int v13 = 171;
        __int16 v14 = 2080;
        int v15 = "-[CMIOExtensionProviderServer addConnection:]";
        __int16 v16 = 2112;
        id v17 = v6;
        _os_log_impl(&dword_2432B6000, v8, OS_LOG_TYPE_DEFAULT, "%s:%d:%s CMIOExtensionProvider.sharedProvider = %@", (uint8_t *)&v10, 0x26u);
      }
    }
    [v6 beginProviderContextRegistration:v4];
  }
  else
  {
    v9 = CMIOLog();
    if (v9 && os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[CMIOExtensionProviderServer addConnection:]();
    }
  }
}

- (BOOL)internalDaemon
{
  return self->_internalDaemon;
}

- (void)init
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderServer.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s ServiceName is missing from Info.plist", v2, v3, v4, v5, v6);
}

- (void)addConnection:.cold.1()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderServer.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s Failed to instantiate CMIOExtensionProviderContext", v2, v3, v4, v5, v6);
}

@end