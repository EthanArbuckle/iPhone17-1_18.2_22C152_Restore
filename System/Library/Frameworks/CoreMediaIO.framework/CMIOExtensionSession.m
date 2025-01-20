@interface CMIOExtensionSession
+ (id)sessionWithDelegate:(id)a3;
- (CMIOExtensionSession)initWithDelegate:(id)a3;
- (CMIOExtensionSessionDelegate)delegate;
- (NSDictionary)extensions;
- (void)dealloc;
@end

@implementation CMIOExtensionSession

+ (id)sessionWithDelegate:(id)a3
{
  v3 = (void *)[objc_alloc((Class)objc_opt_class()) initWithDelegate:a3];

  return v3;
}

- (CMIOExtensionSession)initWithDelegate:(id)a3
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  v42.receiver = self;
  v42.super_class = (Class)CMIOExtensionSession;
  v4 = [(CMIOExtensionSession *)&v42 init];
  v5 = v4;
  if (v4)
  {
    v4->_lock._os_unfair_lock_opaque = 0;
    v4->_extensions = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    objc_storeWeak((id *)&v5->_delegate, a3);
    xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.cmio.registerassistantservice.system-extensions", 0, 2uLL);
    v5->_registerExtensionServiceConnection = mach_service;
    if (mach_service)
    {
      objc_initWeak(&location, v5);
      registerExtensionServiceConnection = v5->_registerExtensionServiceConnection;
      handler[0] = MEMORY[0x263EF8330];
      handler[1] = 3221225472;
      handler[2] = __41__CMIOExtensionSession_initWithDelegate___block_invoke;
      handler[3] = &unk_26517C798;
      objc_copyWeak(&v40, &location);
      xpc_connection_set_event_handler(registerExtensionServiceConnection, handler);
      xpc_connection_resume(v5->_registerExtensionServiceConnection);
      xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_string(v8, "call", "list");
      xpc_object_t v9 = xpc_connection_send_message_with_reply_sync(v5->_registerExtensionServiceConnection, v8);
      xpc_release(v8);
      if (!v9 || MEMORY[0x245679950](v9) != MEMORY[0x263EF8708])
      {
        v10 = CMIOLog();
        if (v10 && os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          v11 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
          [(CMIOExtensionSession *)(uint64_t)v11 initWithDelegate:(uint64_t)buf];
        }
LABEL_8:
        if (!v9) {
          goto LABEL_10;
        }
        goto LABEL_9;
      }
      xpc_object_t array = xpc_dictionary_get_array(v9, "endpoints");
      v14 = array;
      if (!array || MEMORY[0x245679950](array) != MEMORY[0x263EF86D8])
      {
        v15 = CMIOLog();
        if (v15 && os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          v16 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
          [(CMIOExtensionSession *)(uint64_t)v16 initWithDelegate:(uint64_t)buf];
        }
        goto LABEL_9;
      }
      size_t count = xpc_array_get_count(v14);
      if (!count)
      {
LABEL_9:
        xpc_release(v9);
LABEL_10:
        objc_destroyWeak(&v40);
        objc_destroyWeak(&location);
        return v5;
      }
      size_t v18 = 0;
      while (1)
      {
        xpc_object_t dictionary = xpc_array_get_dictionary(v14, v18);
        v20 = dictionary;
        if (!dictionary || MEMORY[0x245679950](dictionary) != MEMORY[0x263EF8708]) {
          break;
        }
        uuid = xpc_dictionary_get_uuid(v20, "mach-o-uuid");
        value = (const char *)xpc_dictionary_get_value(v20, "endpoint");
        id v38 = 0;
        cmio_XPCMessageCopyCFString(v20, "bundle-id", (NSObject **)&v38);
        id v25 = v38;
        id v37 = 0;
        cmio_XPCMessageCopyCFDictionary(v20, "bundle-info", (NSObject **)&v37);
        id v26 = v37;
        if (!uuid || !value || MEMORY[0x245679950](value) != MEMORY[0x263EF8718])
        {
          v27 = CMIOLog();
          v28 = v27;
          if (!v27 || !os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
            goto LABEL_23;
          }
          v29 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
          *(_DWORD *)buf = 136315906;
          v44 = v29;
          __int16 v45 = 1024;
          int v46 = 1897;
          __int16 v47 = 2080;
          v48 = "-[CMIOExtensionSession initWithDelegate:]";
          __int16 v49 = 2112;
          v50 = value;
          v30 = v28;
          v31 = "%s:%d:%s unexpected reply %@";
          uint32_t v32 = 38;
LABEL_33:
          _os_log_error_impl(&dword_2432B6000, v30, OS_LOG_TYPE_ERROR, v31, buf, v32);
          goto LABEL_23;
        }
        v33 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:uuid];
        v34 = [CMIOExtensionInfo alloc];
        v35 = [(CMIOExtensionInfo *)v34 initWithEndpoint:value bundleID:v38 bundleInfo:v37];
        os_unfair_lock_lock(&v5->_lock);
        [(NSMutableDictionary *)v5->_extensions setObject:v35 forKey:v33];
        os_unfair_lock_unlock(&v5->_lock);

LABEL_23:
        if (count == ++v18) {
          goto LABEL_8;
        }
      }
      v21 = CMIOLog();
      v22 = v21;
      if (!v21 || !os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        goto LABEL_23;
      }
      v36 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
      *(_DWORD *)buf = 136316162;
      v44 = v36;
      __int16 v45 = 1024;
      int v46 = 1901;
      __int16 v47 = 2080;
      v48 = "-[CMIOExtensionSession initWithDelegate:]";
      __int16 v49 = 2082;
      v50 = "com.apple.cmio.registerassistantservice.system-extensions";
      __int16 v51 = 2114;
      v52 = v20;
      v30 = v22;
      v31 = "%s:%d:%s unexpected reply from service %{public}s %{public}@";
      uint32_t v32 = 48;
      goto LABEL_33;
    }
  }
  return v5;
}

void __41__CMIOExtensionSession_initWithDelegate___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = MEMORY[0x245679950](a2);
  if (v4 == MEMORY[0x263EF8720])
  {
    if (a2 == (void *)MEMORY[0x263EF86A0])
    {
      v13 = CMIOLogLevel(1);
      if (v13)
      {
        v14 = v13;
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v20 = 136315906;
          *(void *)&v20[4] = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
          __int16 v21 = 1024;
          int v22 = 1811;
          __int16 v23 = 2080;
          v24 = "-[CMIOExtensionSession initWithDelegate:]_block_invoke";
          __int16 v25 = 2080;
          id v26 = "com.apple.cmio.registerassistantservice.system-extensions";
          _os_log_impl(&dword_2432B6000, v14, OS_LOG_TYPE_DEFAULT, "%s:%d:%s interrupted connection to service %s", v20, 0x26u);
        }
      }
    }
    else
    {
      v5 = (void *)MEMORY[0x263EF86A8];
      v6 = CMIOLog();
      if (a2 == v5)
      {
        if (v6 && os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
          __41__CMIOExtensionSession_initWithDelegate___block_invoke_cold_1();
        }
      }
      else if (v6 && os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        __41__CMIOExtensionSession_initWithDelegate___block_invoke_cold_2();
      }
    }
  }
  else if (v4 == MEMORY[0x263EF8708])
  {
    string = xpc_dictionary_get_string(a2, "call");
    if (string)
    {
      if (!strncmp("extension", string, 9uLL))
      {
        uuid = xpc_dictionary_get_uuid(a2, "mach-o-uuid");
        xpc_object_t value = xpc_dictionary_get_value(a2, "endpoint");
        *(void *)v20 = 0;
        cmio_XPCMessageCopyCFString(a2, "bundle-id", (NSObject **)v20);
        id v10 = *(id *)v20;
        id v19 = 0;
        cmio_XPCMessageCopyCFDictionary(a2, "bundle-info", (NSObject **)&v19);
        id v11 = v19;
        if (uuid && value && MEMORY[0x245679950](value) == MEMORY[0x263EF8718])
        {
          if (WeakRetained && objc_loadWeak((id *)WeakRetained + 2))
          {
            v15 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:uuid];
            v16 = [CMIOExtensionInfo alloc];
            v17 = [(CMIOExtensionInfo *)v16 initWithEndpoint:value bundleID:*(void *)v20 bundleInfo:v19];
            os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 2);
            [*((id *)WeakRetained + 3) setObject:v17 forKey:v15];
            size_t v18 = (void *)[*((id *)WeakRetained + 3) copy];
            os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 2);

            [objc_loadWeak((id *)WeakRetained + 2) session:WeakRetained availableExtensionsChanged:v18];
          }
        }
        else
        {
          v12 = CMIOLog();
          if (v12 && os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
            __41__CMIOExtensionSession_initWithDelegate___block_invoke_cold_3();
          }
        }
      }
    }
  }
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (CMIOModuleLogLevel_once != -1) {
    dispatch_once(&CMIOModuleLogLevel_once, &__block_literal_global_379);
  }
  if (CMIOModuleLogLevel_cmioLevel >= 1)
  {
    v3 = CMIOLog();
    if (v3)
    {
      uint64_t v4 = v3;
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v7 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
        __int16 v8 = 1024;
        int v9 = 1922;
        __int16 v10 = 2080;
        id v11 = "-[CMIOExtensionSession dealloc]";
        __int16 v12 = 2112;
        v13 = self;
        _os_log_impl(&dword_2432B6000, v4, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@", buf, 0x26u);
      }
    }
  }

  xpc_release(self->_registerExtensionServiceConnection);
  v5.receiver = self;
  v5.super_class = (Class)CMIOExtensionSession;
  [(CMIOExtensionSession *)&v5 dealloc];
}

- (NSDictionary)extensions
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = (void *)[(NSMutableDictionary *)self->_extensions copy];
  os_unfair_lock_unlock(p_lock);

  return (NSDictionary *)v4;
}

- (CMIOExtensionSessionDelegate)delegate
{
  return (CMIOExtensionSessionDelegate *)objc_loadWeak((id *)&self->_delegate);
}

- (void).cxx_destruct
{
}

- (void)initWithDelegate:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = OUTLINED_FUNCTION_3(a1, 4.8154e-34, a2, a3);
  *(_DWORD *)(v4 + 14) = 1910;
  *(_WORD *)(v4 + 18) = 2080;
  *(void *)(v4 + 20) = "-[CMIOExtensionSession initWithDelegate:]";
  *(_WORD *)(v4 + 28) = 2082;
  OUTLINED_FUNCTION_6_1(v3, v5, v4);
  _os_log_error_impl(&dword_2432B6000, v7, OS_LOG_TYPE_ERROR, "%s:%d:%s unexpected reply from service %{public}s %{public}@", v6, 0x30u);
}

- (void)initWithDelegate:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = OUTLINED_FUNCTION_3(a1, 4.8154e-34, a2, a3);
  *(_DWORD *)(v4 + 14) = 1906;
  *(_WORD *)(v4 + 18) = 2080;
  *(void *)(v4 + 20) = "-[CMIOExtensionSession initWithDelegate:]";
  *(_WORD *)(v4 + 28) = 2082;
  OUTLINED_FUNCTION_6_1(v3, v5, v4);
  _os_log_error_impl(&dword_2432B6000, v7, OS_LOG_TYPE_ERROR, "%s:%d:%s unexpected reply from service %{public}s %{public}@", v6, 0x30u);
}

void __41__CMIOExtensionSession_initWithDelegate___block_invoke_cold_1()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s connection invalid error for service %{public}s.", v2, v3, v4, v5, v6);
}

void __41__CMIOExtensionSession_initWithDelegate___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_15();
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v2 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
  xpc_dictionary_get_string(v1, (const char *)*MEMORY[0x263EF86B0]);
  int v4 = 136316162;
  uint64_t v5 = v2;
  __int16 v6 = 1024;
  OUTLINED_FUNCTION_2();
  os_log_t v7 = "-[CMIOExtensionSession initWithDelegate:]_block_invoke";
  __int16 v8 = 2082;
  int v9 = "com.apple.cmio.registerassistantservice.system-extensions";
  __int16 v10 = 2082;
  uint64_t v11 = v3;
  _os_log_error_impl(&dword_2432B6000, v0, OS_LOG_TYPE_ERROR, "%s:%d:%s unexpected error for service %{public}s: %{public}s", (uint8_t *)&v4, 0x30u);
}

void __41__CMIOExtensionSession_initWithDelegate___block_invoke_cold_3()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s unexpected message", v2, v3, v4, v5, v6);
}

@end