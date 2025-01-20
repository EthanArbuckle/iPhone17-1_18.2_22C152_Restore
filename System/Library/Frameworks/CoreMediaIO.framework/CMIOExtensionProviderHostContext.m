@interface CMIOExtensionProviderHostContext
- (BOOL)isInvalidated;
- (CMIOExtensionProviderHostContext)initWithConnection:(id)a3 delegate:(id)a4;
- (CMIOExtensionProviderHostDelegate)delegate;
- (NSString)description;
- (OS_xpc_object)connection;
- (id)redactedDescription;
- (void)availableDevicePropertiesWithDeviceID:(id)a3 reply:(id)a4;
- (void)availableDevicesChanged:(id)a3 message:(id)a4;
- (void)availablePluginProperties:(id)a3;
- (void)availableStreamPropertiesWithStreamID:(id)a3 reply:(id)a4;
- (void)availableStreamsChanged:(id)a3 message:(id)a4;
- (void)captureAsyncStillImageWithStreamID:(id)a3 uniqueID:(int64_t)a4 options:(id)a5 reply:(id)a6;
- (void)completeTransaction;
- (void)dealloc;
- (void)devicePropertiesChanged:(id)a3 message:(id)a4;
- (void)devicePropertyStatesWithDeviceID:(id)a3 properties:(id)a4 reply:(id)a5;
- (void)deviceStatesWithDeviceID:(id)a3 reply:(id)a4;
- (void)enqueueReactionEffect:(id)a3 reactionType:(id)a4 reply:(id)a5;
- (void)handleClientMessageWithConnection:(id)a3 message:(id)a4;
- (void)pluginPropertiesChanged:(id)a3 message:(id)a4;
- (void)pluginPropertyStatesForProperties:(id)a3 reply:(id)a4;
- (void)pluginStates:(id)a3;
- (void)pullSample:(id)a3 message:(id)a4;
- (void)receivedSample:(id)a3 message:(id)a4;
- (void)refreshExtensionConnection;
- (void)scheduledOutputChanged:(id)a3 message:(id)a4;
- (void)sendEmptyClientInfo;
- (void)setDevicePropertyValuesWithDeviceID:(id)a3 propertyValues:(id)a4 reply:(id)a5;
- (void)setPluginPropertyValues:(id)a3 reply:(id)a4;
- (void)setStreamPropertyValuesWithStreamID:(id)a3 propertyValues:(id)a4 reply:(id)a5;
- (void)startStreamWithStreamID:(id)a3 reply:(id)a4;
- (void)stopStreamWithStreamID:(id)a3 reply:(id)a4;
- (void)streamPropertiesChanged:(id)a3 message:(id)a4;
- (void)streamPropertyStatesWithStreamID:(id)a3 properties:(id)a4 reply:(id)a5;
@end

@implementation CMIOExtensionProviderHostContext

- (CMIOExtensionProviderHostContext)initWithConnection:(id)a3 delegate:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (a3)
  {
    v21.receiver = self;
    v21.super_class = (Class)CMIOExtensionProviderHostContext;
    v6 = [(CMIOExtensionProviderHostContext *)&v21 init];
    v7 = v6;
    if (v6)
    {
      v6->_internalLock._os_unfair_lock_opaque = 0;
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v7->_queue = (OS_dispatch_queue *)FigDispatchQueueCreateTargetingWorkloopWithPriority();
      v7->_transactionGroup = (OS_dispatch_group *)dispatch_group_create();
      objc_storeWeak((id *)&v7->_delegate, a4);
      v7->_connection = (OS_xpc_object *)a3;
      xpc_connection_set_target_queue((xpc_connection_t)a3, (dispatch_queue_t)v7->_queue);
      objc_initWeak(&location, v7);
      uint64_t handler = MEMORY[0x263EF8330];
      uint64_t v15 = 3221225472;
      v16 = __64__CMIOExtensionProviderHostContext_initWithConnection_delegate___block_invoke;
      v17 = &unk_26517C7C0;
      objc_copyWeak(&v19, &location);
      id v18 = a3;
      xpc_connection_set_event_handler((xpc_connection_t)a3, &handler);
      xpc_connection_activate((xpc_connection_t)a3);
      [(CMIOExtensionProviderHostContext *)v7 sendEmptyClientInfo];
      uint64_t pid = xpc_connection_get_pid((xpc_connection_t)a3);
      id v9 = [NSString alloc];
      v7->_description = (NSString *)objc_msgSend(v9, "initWithFormat:", @"<CMIOExtensionProviderHostContext: pid %u>", pid, handler, v15, v16, v17);
      v7->_redactedDescription = (NSString *)[[NSString alloc] initWithFormat:@"<CMIOExtensionProviderHostContext: pid ->"];
      v10 = CMIOLog();
      v11 = v10;
      if (v10 && os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v12 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        *(_DWORD *)buf = 136315907;
        v23 = v12;
        __int16 v24 = 1024;
        int v25 = 104;
        __int16 v26 = 2080;
        v27 = "-[CMIOExtensionProviderHostContext initWithConnection:delegate:]";
        __int16 v28 = 2113;
        v29 = v7;
        _os_log_impl(&dword_2432B6000, v11, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{private}@", buf, 0x26u);
      }
      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);
    }
  }
  else
  {

    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"Invalid argument"];
    return 0;
  }
  return v7;
}

void __64__CMIOExtensionProviderHostContext_initWithConnection_delegate___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = MEMORY[0x245679950](a2);
  if (v5 == MEMORY[0x263EF8720])
  {
    v6 = CMIOLog();
    if (v6)
    {
      v7 = v6;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __64__CMIOExtensionProviderHostContext_initWithConnection_delegate___block_invoke_cold_1(a1, a2, v7);
      }
    }
    if (a2 == MEMORY[0x263EF86A8]) {
      xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
    }
    if (a2 == MEMORY[0x263EF86A0] && WeakRetained && !WeakRetained[48])
    {
      v8 = CMIOLog();
      if (v8)
      {
        id v9 = v8;
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          int v10 = 136315907;
          v11 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
          __int16 v12 = 1024;
          int v13 = 83;
          __int16 v14 = 2080;
          uint64_t v15 = "-[CMIOExtensionProviderHostContext initWithConnection:delegate:]_block_invoke";
          __int16 v16 = 2113;
          v17 = WeakRetained;
          _os_log_impl(&dword_2432B6000, v9, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{private}@, connection is invalidated", (uint8_t *)&v10, 0x26u);
        }
      }
      xpc_connection_cancel((xpc_connection_t)[WeakRetained connection]);
      WeakRetained[48] = 1;
      objc_msgSend((id)objc_msgSend(WeakRetained, "delegate"), "extensionHasBeenInvalidated:", WeakRetained);
    }
  }
  else if (v5 == MEMORY[0x263EF8708])
  {
    [WeakRetained handleClientMessageWithConnection:*(void *)(a1 + 32) message:a2];
  }
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (CMIOModuleLogLevel_once_1 != -1) {
    dispatch_once(&CMIOModuleLogLevel_once_1, &__block_literal_global_150);
  }
  if (CMIOModuleLogLevel_cmioLevel_1 >= 1)
  {
    v3 = CMIOLog();
    if (v3)
    {
      v4 = v3;
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315907;
        v7 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        __int16 v8 = 1024;
        int v9 = 111;
        __int16 v10 = 2080;
        v11 = "-[CMIOExtensionProviderHostContext dealloc]";
        __int16 v12 = 2113;
        int v13 = self;
        _os_log_impl(&dword_2432B6000, v4, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{private}@", buf, 0x26u);
      }
    }
  }

  dispatch_release((dispatch_object_t)self->_queue);
  dispatch_release((dispatch_object_t)self->_transactionGroup);

  v5.receiver = self;
  v5.super_class = (Class)CMIOExtensionProviderHostContext;
  [(CMIOExtensionProviderHostContext *)&v5 dealloc];
}

- (NSString)description
{
  v2 = self->_description;

  return v2;
}

- (id)redactedDescription
{
  v2 = self->_redactedDescription;

  return v2;
}

- (void)handleClientMessageWithConnection:(id)a3 message:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t uint64 = xpc_dictionary_get_uint64(a4, "MessageType");
  if (CMIOModuleLogLevel_once_1 != -1) {
    dispatch_once(&CMIOModuleLogLevel_once_1, &__block_literal_global_150);
  }
  if (CMIOModuleLogLevel_cmioLevel_1 >= 1)
  {
    __int16 v8 = CMIOLog();
    if (v8)
    {
      int v9 = v8;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 136316163;
        __int16 v12 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        __int16 v13 = 1024;
        int v14 = 137;
        __int16 v15 = 2080;
        __int16 v16 = "-[CMIOExtensionProviderHostContext handleClientMessageWithConnection:message:]";
        __int16 v17 = 2113;
        uint64_t v18 = self;
        __int16 v19 = 2048;
        uint64_t v20 = uint64;
        _os_log_impl(&dword_2432B6000, v9, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{private}@ %lld", (uint8_t *)&v11, 0x30u);
      }
    }
  }
  switch(uint64)
  {
    case 1uLL:
      [(CMIOExtensionProviderHostContext *)self availableDevicesChanged:a3 message:a4];
      break;
    case 2uLL:
      [(CMIOExtensionProviderHostContext *)self availableStreamsChanged:a3 message:a4];
      break;
    case 3uLL:
      [(CMIOExtensionProviderHostContext *)self pluginPropertiesChanged:a3 message:a4];
      break;
    case 4uLL:
      [(CMIOExtensionProviderHostContext *)self devicePropertiesChanged:a3 message:a4];
      break;
    case 5uLL:
      [(CMIOExtensionProviderHostContext *)self streamPropertiesChanged:a3 message:a4];
      break;
    case 7uLL:
      [(CMIOExtensionProviderHostContext *)self receivedSample:a3 message:a4];
      break;
    case 8uLL:
      [(CMIOExtensionProviderHostContext *)self pullSample:a3 message:a4];
      break;
    case 9uLL:
      [(CMIOExtensionProviderHostContext *)self scheduledOutputChanged:a3 message:a4];
      break;
    default:
      __int16 v10 = CMIOLog();
      if (v10)
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          -[CMIOExtensionProviderHostContext handleClientMessageWithConnection:message:]();
        }
      }
      break;
  }
}

- (void)availableDevicesChanged:(id)a3 message:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  CFTypeRef cf = 0;
  if (cmio_XPCMessageCopyCFArray(a4, "param1", (NSObject **)&cf))
  {
    objc_super v5 = CMIOLog();
    if (v5)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        -[CMIOExtensionProviderHostContext availableDevicesChanged:message:]();
      }
    }
  }
  if (cf)
  {
    if (CMIOModuleLogLevel_once_1 != -1) {
      dispatch_once(&CMIOModuleLogLevel_once_1, &__block_literal_global_150);
    }
    if (CMIOModuleLogLevel_cmioLevel_1 >= 1)
    {
      v6 = CMIOLog();
      if (v6)
      {
        v7 = v6;
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v8 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
          *(_DWORD *)buf = 136316163;
          __int16 v12 = v8;
          __int16 v13 = 1024;
          int v14 = 177;
          __int16 v15 = 2080;
          __int16 v16 = "-[CMIOExtensionProviderHostContext availableDevicesChanged:message:]";
          __int16 v17 = 2113;
          uint64_t v18 = self;
          __int16 v19 = 2112;
          CFTypeRef v20 = cf;
          _os_log_impl(&dword_2432B6000, v7, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{private}@ - devices %@", buf, 0x30u);
        }
      }
    }
    int v9 = [(CMIOExtensionProviderHostContext *)self delegate];
    [(CMIOExtensionProviderHostDelegate *)v9 extension:self availableDevicesChanged:cf];
    CFRelease(cf);
  }
}

- (void)availableStreamsChanged:(id)a3 message:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  CFTypeRef v13 = 0;
  cmio_XPCMessageCopyCFString(a4, "param1", (NSObject **)&v13);
  if (v13)
  {
    CFTypeRef cf = 0;
    if (cmio_XPCMessageCopyCFArray(a4, "param2", (NSObject **)&cf))
    {
      v6 = CMIOLog();
      if (v6)
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
          -[CMIOExtensionProviderHostContext availableStreamsChanged:message:]();
        }
      }
    }
    if (cf)
    {
      if (CMIOModuleLogLevel_once_1 != -1) {
        dispatch_once(&CMIOModuleLogLevel_once_1, &__block_literal_global_150);
      }
      if (CMIOModuleLogLevel_cmioLevel_1 >= 1)
      {
        v7 = CMIOLog();
        if (v7)
        {
          __int16 v8 = v7;
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
          {
            int v9 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
            *(_DWORD *)buf = 136316163;
            __int16 v15 = v9;
            __int16 v16 = 1024;
            int v17 = 195;
            __int16 v18 = 2080;
            __int16 v19 = "-[CMIOExtensionProviderHostContext availableStreamsChanged:message:]";
            __int16 v20 = 2113;
            uint64_t v21 = self;
            __int16 v22 = 2112;
            CFTypeRef v23 = cf;
            _os_log_impl(&dword_2432B6000, v8, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{private}@ - streams %@", buf, 0x30u);
          }
        }
      }
      __int16 v10 = [(CMIOExtensionProviderHostContext *)self delegate];
      [(CMIOExtensionProviderHostDelegate *)v10 extension:self availableStreamsChangedWithDeviceID:v13 streamIDs:cf];
      CFRelease(cf);
    }
    CFRelease(v13);
  }
  else
  {
    int v11 = CMIOLog();
    if (v11 && os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[CMIOExtensionProviderHostContext availableStreamsChanged:message:]();
    }
  }
}

- (void)pluginPropertiesChanged:(id)a3 message:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  xpc_object_t value = xpc_dictionary_get_value(a4, "param1");
  if (value)
  {
    id v6 = +[CMIOExtensionPropertyState copyPropertyStatesFromXPCDictionary:value];
    if (v6)
    {
      id v7 = v6;
      if (CMIOModuleLogLevel_once_1 != -1) {
        dispatch_once(&CMIOModuleLogLevel_once_1, &__block_literal_global_150);
      }
      if (CMIOModuleLogLevel_cmioLevel_1 >= 2)
      {
        __int16 v8 = CMIOLog();
        if (v8)
        {
          int v9 = v8;
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            int v12 = 136316163;
            CFTypeRef v13 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
            __int16 v14 = 1024;
            int v15 = 215;
            __int16 v16 = 2080;
            int v17 = "-[CMIOExtensionProviderHostContext pluginPropertiesChanged:message:]";
            __int16 v18 = 2113;
            __int16 v19 = self;
            __int16 v20 = 2112;
            id v21 = v7;
            _os_log_impl(&dword_2432B6000, v9, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{private}@ - %@", (uint8_t *)&v12, 0x30u);
          }
        }
      }
      [(CMIOExtensionProviderHostDelegate *)[(CMIOExtensionProviderHostContext *)self delegate] extension:self pluginPropertiesChanged:v7];
    }
    else
    {
      int v11 = CMIOLog();
      if (v11 && os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[CMIOExtensionProviderHostContext pluginPropertiesChanged:message:]();
      }
    }
  }
  else
  {
    __int16 v10 = CMIOLog();
    if (v10 && os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[CMIOExtensionProviderHostContext pluginPropertiesChanged:message:]();
    }
  }
}

- (void)devicePropertiesChanged:(id)a3 message:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  CFTypeRef cf = 0;
  cmio_XPCMessageCopyCFString(a4, "param1", (NSObject **)&cf);
  if (cf)
  {
    xpc_object_t value = xpc_dictionary_get_value(a4, "param2");
    if (value)
    {
      id v7 = +[CMIOExtensionPropertyState copyPropertyStatesFromXPCDictionary:value];
      if (v7)
      {
        id v8 = v7;
        if (CMIOModuleLogLevel_once_1 != -1) {
          dispatch_once(&CMIOModuleLogLevel_once_1, &__block_literal_global_150);
        }
        if (CMIOModuleLogLevel_cmioLevel_1 >= 2)
        {
          int v9 = CMIOLog();
          if (v9)
          {
            __int16 v10 = v9;
            if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
            {
              int v11 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
              *(_DWORD *)buf = 136316419;
              __int16 v18 = v11;
              __int16 v19 = 1024;
              int v20 = 236;
              __int16 v21 = 2080;
              uint64_t v22 = "-[CMIOExtensionProviderHostContext devicePropertiesChanged:message:]";
              __int16 v23 = 2113;
              uint64_t v24 = self;
              __int16 v25 = 2112;
              CFTypeRef v26 = cf;
              __int16 v27 = 2112;
              id v28 = v8;
              _os_log_impl(&dword_2432B6000, v10, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{private}@ - %@ - %@", buf, 0x3Au);
            }
          }
        }
        int v12 = [(CMIOExtensionProviderHostContext *)self delegate];
        [(CMIOExtensionProviderHostDelegate *)v12 extension:self devicePropertiesChangedWithDeviceID:cf propertyStates:v8];
      }
      else
      {
        int v15 = CMIOLog();
        if (v15 && os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          -[CMIOExtensionProviderHostContext devicePropertiesChanged:message:]();
        }
      }
    }
    else
    {
      __int16 v14 = CMIOLog();
      if (v14 && os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[CMIOExtensionProviderHostContext devicePropertiesChanged:message:]();
      }
    }
    CFRelease(cf);
  }
  else
  {
    CFTypeRef v13 = CMIOLog();
    if (v13 && os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[CMIOExtensionProviderHostContext devicePropertiesChanged:message:]();
    }
  }
}

- (void)streamPropertiesChanged:(id)a3 message:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  CFTypeRef cf = 0;
  cmio_XPCMessageCopyCFString(a4, "param1", (NSObject **)&cf);
  if (cf)
  {
    xpc_object_t value = xpc_dictionary_get_value(a4, "param2");
    if (value)
    {
      id v7 = +[CMIOExtensionPropertyState copyPropertyStatesFromXPCDictionary:value];
      if (v7)
      {
        id v8 = v7;
        if (CMIOModuleLogLevel_once_1 != -1) {
          dispatch_once(&CMIOModuleLogLevel_once_1, &__block_literal_global_150);
        }
        if (CMIOModuleLogLevel_cmioLevel_1 >= 2)
        {
          int v9 = CMIOLog();
          if (v9)
          {
            __int16 v10 = v9;
            if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
            {
              int v11 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
              *(_DWORD *)buf = 136316419;
              __int16 v18 = v11;
              __int16 v19 = 1024;
              int v20 = 260;
              __int16 v21 = 2080;
              uint64_t v22 = "-[CMIOExtensionProviderHostContext streamPropertiesChanged:message:]";
              __int16 v23 = 2113;
              uint64_t v24 = self;
              __int16 v25 = 2112;
              CFTypeRef v26 = cf;
              __int16 v27 = 2112;
              id v28 = v8;
              _os_log_impl(&dword_2432B6000, v10, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{private}@ - %@ - %@", buf, 0x3Au);
            }
          }
        }
        int v12 = [(CMIOExtensionProviderHostContext *)self delegate];
        [(CMIOExtensionProviderHostDelegate *)v12 extension:self streamPropertiesChangedWithStreamID:cf propertyStates:v8];
      }
      else
      {
        int v15 = CMIOLog();
        if (v15 && os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          -[CMIOExtensionProviderHostContext streamPropertiesChanged:message:]();
        }
      }
    }
    else
    {
      __int16 v14 = CMIOLog();
      if (v14 && os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[CMIOExtensionProviderHostContext streamPropertiesChanged:message:]();
      }
    }
    CFRelease(cf);
  }
  else
  {
    CFTypeRef v13 = CMIOLog();
    if (v13 && os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[CMIOExtensionProviderHostContext streamPropertiesChanged:message:]();
    }
  }
}

- (void)receivedSample:(id)a3 message:(id)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  CFTypeRef cf = 0;
  cmio_XPCMessageCopyCFString(a4, "param1", (NSObject **)&cf);
  if (cf)
  {
    unsigned int int64 = xpc_dictionary_get_int64(a4, "param2");
    xpc_object_t value = xpc_dictionary_get_value(a4, "param3");
    if (value)
    {
      id v8 = [[CMIOExtensionSample alloc] initWithXPCDictionary:value];
      if (v8)
      {
        int v9 = v8;
        if (CMIOModuleLogLevel_once_1 != -1) {
          dispatch_once(&CMIOModuleLogLevel_once_1, &__block_literal_global_150);
        }
        if (CMIOModuleLogLevel_cmioLevel_1 >= 3)
        {
          __int16 v10 = CMIOLog();
          if (v10)
          {
            int v11 = v10;
            if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
            {
              int v12 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
              *(_DWORD *)buf = 136317443;
              __int16 v19 = v12;
              int v21 = 286;
              __int16 v22 = 2080;
              __int16 v20 = 1024;
              __int16 v23 = "-[CMIOExtensionProviderHostContext receivedSample:message:]";
              __int16 v24 = 2113;
              __int16 v25 = self;
              __int16 v26 = 2112;
              CFTypeRef v27 = cf;
              __int16 v28 = 1024;
              unsigned int v29 = HIBYTE(int64);
              __int16 v30 = 1024;
              int v31 = BYTE2(int64);
              __int16 v32 = 1024;
              int v33 = BYTE1(int64);
              __int16 v34 = 1024;
              int v35 = int64;
              __int16 v36 = 2112;
              v37 = v9;
              _os_log_impl(&dword_2432B6000, v11, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{private}@ - %@ - %c%c%c%c - %@", buf, 0x52u);
            }
          }
        }
        CFTypeRef v13 = [(CMIOExtensionProviderHostContext *)self delegate];
        [(CMIOExtensionProviderHostDelegate *)v13 extension:self receivedSampleWithStreamID:cf sample:v9];
      }
      else
      {
        __int16 v16 = CMIOLog();
        if (v16 && os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          -[CMIOExtensionProviderHostContext receivedSample:message:]();
        }
      }
    }
    else
    {
      int v15 = CMIOLog();
      if (v15 && os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[CMIOExtensionProviderHostContext receivedSample:message:]();
      }
    }
    CFRelease(cf);
  }
  else
  {
    __int16 v14 = CMIOLog();
    if (v14 && os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[CMIOExtensionProviderHostContext receivedSample:message:]();
    }
  }
}

- (void)pullSample:(id)a3 message:(id)a4
{
  CFTypeRef v13 = 0;
  cmio_XPCMessageCopyCFString(a4, "param1", &v13);
  if (!v13)
  {
    __int16 v10 = CMIOLog();
    id v8 = v10;
    if (!v10) {
      goto LABEL_11;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[CMIOExtensionProviderHostContext pullSample:message:]();
    }
    goto LABEL_10;
  }
  reply = xpc_dictionary_create_reply(a4);
  if (reply)
  {
    id v8 = reply;
    xpc_retain(reply);
    int v9 = [(CMIOExtensionProviderHostContext *)self delegate];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __55__CMIOExtensionProviderHostContext_pullSample_message___block_invoke;
    v12[3] = &unk_26517C918;
    v12[4] = v8;
    v12[5] = a3;
    [(CMIOExtensionProviderHostDelegate *)v9 extension:self pullSampleWithStreamID:v13 reply:v12];
    goto LABEL_11;
  }
  int v11 = CMIOLog();
  id v8 = v11;
  if (v11)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[CMIOExtensionProviderHostContext pullSample:message:]();
    }
LABEL_10:
    id v8 = 0;
  }
LABEL_11:
  if (v13) {
    CFRelease(v13);
  }
  if (v8) {
    xpc_release(v8);
  }
}

void __55__CMIOExtensionProviderHostContext_pullSample_message___block_invoke(uint64_t a1, void *a2, BOOL a3, void *a4)
{
  if (a2)
  {
    id v7 = (void *)[a2 copyXPCDictionary];
    if (v7)
    {
      id v8 = v7;
      xpc_dictionary_set_value(*(xpc_object_t *)(a1 + 32), "param1", v7);
      xpc_release(v8);
    }
    else
    {
      int v9 = CMIOLog();
      if (v9 && os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        __55__CMIOExtensionProviderHostContext_pullSample_message___block_invoke_cold_2();
      }
      a4 = (void *)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-5 userInfo:0];
    }
    xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 32), "param2", a3);
  }
  if (a4)
  {
    __int16 v10 = CMIOLog();
    if (v10 && os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __55__CMIOExtensionProviderHostContext_pullSample_message___block_invoke_cold_1();
    }
    int v11 = *(void **)(a1 + 32);
    int64_t v12 = [a4 code];
    CFTypeRef v13 = v11;
  }
  else
  {
    CFTypeRef v13 = *(void **)(a1 + 32);
    int64_t v12 = 0;
  }
  xpc_dictionary_set_int64(v13, "errorReturn", v12);
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 32));
  xpc_release(*(xpc_object_t *)(a1 + 32));
}

- (void)scheduledOutputChanged:(id)a3 message:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  CFTypeRef cf = 0;
  cmio_XPCMessageCopyCFString(a4, "param1", (NSObject **)&cf);
  if (cf)
  {
    xpc_object_t value = xpc_dictionary_get_value(a4, "param2");
    if (value)
    {
      id v7 = [[CMIOExtensionScheduledOutput alloc] initWithXPCDictionary:value];
      if (v7)
      {
        id v8 = v7;
        if (CMIOModuleLogLevel_once_1 != -1) {
          dispatch_once(&CMIOModuleLogLevel_once_1, &__block_literal_global_150);
        }
        if (CMIOModuleLogLevel_cmioLevel_1 >= 3)
        {
          int v9 = CMIOLog();
          if (v9)
          {
            __int16 v10 = v9;
            if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
            {
              int v11 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
              *(_DWORD *)buf = 136316419;
              __int16 v18 = v11;
              __int16 v19 = 1024;
              int v20 = 356;
              __int16 v21 = 2080;
              __int16 v22 = "-[CMIOExtensionProviderHostContext scheduledOutputChanged:message:]";
              __int16 v23 = 2113;
              __int16 v24 = self;
              __int16 v25 = 2112;
              CFTypeRef v26 = cf;
              __int16 v27 = 2112;
              __int16 v28 = v8;
              _os_log_impl(&dword_2432B6000, v10, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{private}@ - %@ - %@", buf, 0x3Au);
            }
          }
        }
        int64_t v12 = [(CMIOExtensionProviderHostContext *)self delegate];
        [(CMIOExtensionProviderHostDelegate *)v12 extension:self streamScheduledOutputChangedWithStreamID:cf scheduledOutput:v8];
      }
      else
      {
        int v15 = CMIOLog();
        if (v15 && os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          -[CMIOExtensionProviderHostContext scheduledOutputChanged:message:]();
        }
      }
    }
    else
    {
      __int16 v14 = CMIOLog();
      if (v14 && os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[CMIOExtensionProviderHostContext scheduledOutputChanged:message:]();
      }
    }
    CFRelease(cf);
  }
  else
  {
    CFTypeRef v13 = CMIOLog();
    if (v13 && os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[CMIOExtensionProviderHostContext scheduledOutputChanged:message:]();
    }
  }
}

- (void)availablePluginProperties:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (CMIOModuleLogLevel_once_1 != -1) {
    dispatch_once(&CMIOModuleLogLevel_once_1, &__block_literal_global_150);
  }
  if (CMIOModuleLogLevel_cmioLevel_1 >= 1)
  {
    objc_super v5 = CMIOLog();
    if (v5)
    {
      id v6 = v5;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315907;
        int64_t v12 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        __int16 v13 = 1024;
        int v14 = 371;
        __int16 v15 = 2080;
        __int16 v16 = "-[CMIOExtensionProviderHostContext availablePluginProperties:]";
        __int16 v17 = 2113;
        __int16 v18 = self;
        _os_log_impl(&dword_2432B6000, v6, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{private}@", buf, 0x26u);
      }
    }
  }
  xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v7, "MessageType", 2uLL);
  dispatch_group_enter((dispatch_group_t)self->_transactionGroup);
  connection = self->_connection;
  queue = self->_queue;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __62__CMIOExtensionProviderHostContext_availablePluginProperties___block_invoke;
  v10[3] = &unk_26517C940;
  v10[4] = self;
  v10[5] = a3;
  xpc_connection_send_message_with_reply(connection, v7, queue, v10);
  xpc_release(v7);
}

void __62__CMIOExtensionProviderHostContext_availablePluginProperties___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v4 = MEMORY[0x245679950](a2);
  if (v4 == MEMORY[0x263EF8720])
  {
    id v6 = CMIOLog();
    if (v6 && os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
      __62__CMIOExtensionProviderHostContext_availablePluginProperties___block_invoke_cold_2();
    }
    [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-7 userInfo:0];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else if (v4 == MEMORY[0x263EF8708])
  {
    int int64 = xpc_dictionary_get_int64(a2, "errorReturn");
    if (int64)
    {
      [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:int64 userInfo:0];
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      CFTypeRef cf = 0;
      cmio_XPCMessageCopyCFArray(a2, "param1", (NSObject **)&cf);
      if (cf)
      {
        objc_msgSend(MEMORY[0x263EFFA08], "setWithArray:");
        CFRelease(cf);
        CFTypeRef cf = 0;
      }
      else
      {
        id v8 = CMIOLog();
        if (v8 && os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          int v9 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
          __62__CMIOExtensionProviderHostContext_availablePluginProperties___block_invoke_cold_3((uint64_t)v9, (uint64_t)v11);
        }
        [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6 userInfo:0];
      }
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
  else
  {
    objc_super v5 = CMIOLog();
    if (v5 && os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
      __62__CMIOExtensionProviderHostContext_availablePluginProperties___block_invoke_cold_4();
    }
    [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6 userInfo:0];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 24));
}

- (void)pluginStates:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  if (CMIOModuleLogLevel_once_1 != -1) {
    dispatch_once(&CMIOModuleLogLevel_once_1, &__block_literal_global_150);
  }
  if (CMIOModuleLogLevel_cmioLevel_1 >= 1)
  {
    objc_super v5 = CMIOLog();
    if (v5)
    {
      id v6 = v5;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315907;
        uint64_t v29 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        __int16 v30 = 1024;
        int v31 = 423;
        __int16 v32 = 2080;
        int v33 = "-[CMIOExtensionProviderHostContext pluginStates:]";
        __int16 v34 = 2113;
        int v35 = self;
        _os_log_impl(&dword_2432B6000, v6, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{private}@", buf, 0x26u);
      }
    }
  }
  xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v7, "MessageType", 1uLL);
  xpc_object_t v8 = xpc_connection_send_message_with_reply_sync(self->_connection, v7);
  int v9 = v8;
  if (v8)
  {
    uint64_t v10 = MEMORY[0x245679950](v8);
    if (v10 == MEMORY[0x263EF8720])
    {
      uint64_t v12 = CMIOLog();
      if (v12 && os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        -[CMIOExtensionProviderHostContext pluginStates:]();
      }
      (*((void (**)(id, void, void, void, uint64_t))a3 + 2))(a3, 0, 0, 0, [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-7 userInfo:0]);
      goto LABEL_37;
    }
    if (v10 != MEMORY[0x263EF8708])
    {
      int v11 = CMIOLog();
      if (v11 && os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        -[CMIOExtensionProviderHostContext pluginStates:].cold.5();
      }
      (*((void (**)(id, void, void, void, uint64_t))a3 + 2))(a3, 0, 0, 0, [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6 userInfo:0]);
      goto LABEL_37;
    }
    int int64 = xpc_dictionary_get_int64(v9, "errorReturn");
    if (int64)
    {
      (*((void (**)(id, void, void, void, uint64_t))a3 + 2))(a3, 0, 0, 0, [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:int64 userInfo:0]);
LABEL_37:
      xpc_release(v9);
      xpc_object_t v25 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_uint64(v25, "MessageType", 0x19uLL);
      xpc_connection_send_message_with_reply(self->_connection, v25, (dispatch_queue_t)self->_queue, &__block_literal_global_4);
      xpc_release(v25);
      goto LABEL_38;
    }
    xpc_object_t value = xpc_dictionary_get_value(v9, "param1");
    if (value)
    {
      id v15 = +[CMIOExtensionPropertyState copyPropertyStatesFromXPCDictionary:value];
      if (v15)
      {
        uint64_t v16 = 0;
LABEL_30:
        xpc_object_t v21 = xpc_dictionary_get_value(v9, "param2");
        if (v21)
        {
          id v22 = objc_alloc_init(MEMORY[0x263EFF9A0]);
          applier[0] = MEMORY[0x263EF8330];
          applier[1] = 3221225472;
          applier[2] = __49__CMIOExtensionProviderHostContext_pluginStates___block_invoke;
          applier[3] = &unk_26517C5C0;
          applier[4] = v22;
          xpc_array_apply(v21, applier);
        }
        else
        {
          id v22 = 0;
        }
        xpc_object_t v23 = xpc_dictionary_get_value(v9, "param3");
        if (v23)
        {
          id v24 = objc_alloc_init(MEMORY[0x263EFF9A0]);
          v26[0] = MEMORY[0x263EF8330];
          v26[1] = 3221225472;
          v26[2] = __49__CMIOExtensionProviderHostContext_pluginStates___block_invoke_26;
          v26[3] = &unk_26517C5C0;
          v26[4] = v24;
          xpc_array_apply(v23, v26);
        }
        else
        {
          id v24 = 0;
        }
        (*((void (**)(id, id, id, id, uint64_t))a3 + 2))(a3, v15, v22, v24, v16);
        goto LABEL_37;
      }
      uint64_t v19 = CMIOLog();
      if (v19 && os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        int v20 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        -[CMIOExtensionProviderHostContext pluginStates:].cold.4((uint64_t)v20, (uint64_t)buf);
      }
    }
    else
    {
      __int16 v17 = CMIOLog();
      if (v17 && os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        __int16 v18 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        -[CMIOExtensionProviderHostContext pluginStates:]((uint64_t)v18, (uint64_t)buf);
      }
    }
    uint64_t v16 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6 userInfo:0];
    id v15 = 0;
    goto LABEL_30;
  }
LABEL_38:
  xpc_release(v7);
}

uint64_t __49__CMIOExtensionProviderHostContext_pluginStates___block_invoke(uint64_t a1)
{
  id v2 = +[CMIOExtensionPropertyState copyPropertyStatesFromXPCDictionary:](CMIOExtensionPropertyState, "copyPropertyStatesFromXPCDictionary:");
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = (void *)[v2 objectForKeyedSubscript:0x26F89C470];
    if ([v4 value]) {
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v3, objc_msgSend(v4, "value"));
    }
  }
  else
  {
    objc_super v5 = CMIOLog();
    if (v5 && os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __49__CMIOExtensionProviderHostContext_pluginStates___block_invoke_cold_1();
    }
  }
  return 1;
}

uint64_t __49__CMIOExtensionProviderHostContext_pluginStates___block_invoke_26(uint64_t a1)
{
  id v2 = +[CMIOExtensionPropertyState copyPropertyStatesFromXPCDictionary:](CMIOExtensionPropertyState, "copyPropertyStatesFromXPCDictionary:");
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = (void *)[v2 objectForKeyedSubscript:0x26F89C550];
    if ([v4 value]) {
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v3, objc_msgSend(v4, "value"));
    }
  }
  else
  {
    objc_super v5 = CMIOLog();
    if (v5 && os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __49__CMIOExtensionProviderHostContext_pluginStates___block_invoke_26_cold_1();
    }
  }
  return 1;
}

void __49__CMIOExtensionProviderHostContext_pluginStates___block_invoke_27(uint64_t a1, void *a2)
{
  uint64_t v3 = MEMORY[0x245679950](a2);
  if (v3 == MEMORY[0x263EF8720])
  {
    objc_super v5 = CMIOLog();
    if (v5 && os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __49__CMIOExtensionProviderHostContext_pluginStates___block_invoke_27_cold_1();
    }
  }
  else if (v3 == MEMORY[0x263EF8708])
  {
    xpc_dictionary_get_int64(a2, "errorReturn");
    uint64_t v4 = CMIOLog();
    if (v4)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        __49__CMIOExtensionProviderHostContext_pluginStates___block_invoke_27_cold_2();
      }
    }
  }
}

- (void)pluginPropertyStatesForProperties:(id)a3 reply:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (CMIOModuleLogLevel_once_1 != -1) {
    dispatch_once(&CMIOModuleLogLevel_once_1, &__block_literal_global_150);
  }
  if (CMIOModuleLogLevel_cmioLevel_1 >= 1)
  {
    xpc_object_t v7 = CMIOLog();
    if (v7)
    {
      xpc_object_t v8 = v7;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315907;
        id v15 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        __int16 v16 = 1024;
        int v17 = 535;
        __int16 v18 = 2080;
        uint64_t v19 = "-[CMIOExtensionProviderHostContext pluginPropertyStatesForProperties:reply:]";
        __int16 v20 = 2113;
        xpc_object_t v21 = self;
        _os_log_impl(&dword_2432B6000, v8, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{private}@", buf, 0x26u);
      }
    }
  }
  xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v9, "MessageType", 3uLL);
  if (a3)
  {
    if (cmio_XPCMessageSetCFArray(v9, "param1", (CFTypeRef)[a3 allObjects]))
    {
      uint64_t v10 = CMIOLog();
      if (v10)
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          -[CMIOExtensionProviderHostContext pluginPropertyStatesForProperties:reply:]();
        }
      }
    }
  }
  dispatch_group_enter((dispatch_group_t)self->_transactionGroup);
  connection = self->_connection;
  queue = self->_queue;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __76__CMIOExtensionProviderHostContext_pluginPropertyStatesForProperties_reply___block_invoke;
  v13[3] = &unk_26517C940;
  v13[4] = self;
  v13[5] = a4;
  xpc_connection_send_message_with_reply(connection, v9, queue, v13);
  xpc_release(v9);
}

void __76__CMIOExtensionProviderHostContext_pluginPropertyStatesForProperties_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v4 = MEMORY[0x245679950](a2);
  if (v4 != MEMORY[0x263EF8720])
  {
    if (v4 != MEMORY[0x263EF8708])
    {
      objc_super v5 = CMIOLog();
      if (v5 && os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        __76__CMIOExtensionProviderHostContext_pluginPropertyStatesForProperties_reply___block_invoke_cold_5();
      }
      [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6 userInfo:0];
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      goto LABEL_24;
    }
    int int64 = xpc_dictionary_get_int64(a2, "errorReturn");
    if (int64)
    {
      [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:int64 userInfo:0];
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      goto LABEL_24;
    }
    xpc_object_t value = xpc_dictionary_get_value(a2, "param1");
    if (value)
    {
      if (+[CMIOExtensionPropertyState copyPropertyStatesFromXPCDictionary:value])
      {
        goto LABEL_23;
      }
      int v11 = CMIOLog();
      if (v11 && os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        uint64_t v12 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        __76__CMIOExtensionProviderHostContext_pluginPropertyStatesForProperties_reply___block_invoke_cold_4((uint64_t)v12, (uint64_t)v13);
      }
    }
    else
    {
      xpc_object_t v9 = CMIOLog();
      if (v9 && os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        uint64_t v10 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        __76__CMIOExtensionProviderHostContext_pluginPropertyStatesForProperties_reply___block_invoke_cold_3((uint64_t)v10, (uint64_t)v13);
      }
    }
    [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6 userInfo:0];
LABEL_23:
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_24;
  }
  id v6 = CMIOLog();
  if (v6 && os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
    __76__CMIOExtensionProviderHostContext_pluginPropertyStatesForProperties_reply___block_invoke_cold_2();
  }
  [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-7 userInfo:0];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_24:
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 24));
}

- (void)setPluginPropertyValues:(id)a3 reply:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  if (CMIOModuleLogLevel_once_1 != -1) {
    dispatch_once(&CMIOModuleLogLevel_once_1, &__block_literal_global_150);
  }
  if (CMIOModuleLogLevel_cmioLevel_1 >= 1)
  {
    xpc_object_t v7 = CMIOLog();
    if (v7)
    {
      xpc_object_t v8 = v7;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315907;
        __int16 v18 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        __int16 v19 = 1024;
        int v20 = 596;
        __int16 v21 = 2080;
        uint64_t v22 = "-[CMIOExtensionProviderHostContext setPluginPropertyValues:reply:]";
        __int16 v23 = 2113;
        id v24 = self;
        _os_log_impl(&dword_2432B6000, v8, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{private}@", buf, 0x26u);
      }
    }
  }
  if ([a3 count])
  {
    xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v9, "MessageType", 4uLL);
    id v10 = +[CMIOExtensionPropertyState copyXPCDictionaryFromPropertyValues:a3];
    if (v10)
    {
      int v11 = v10;
      xpc_dictionary_set_value(v9, "param1", v10);
      xpc_release(v11);
      dispatch_group_enter((dispatch_group_t)self->_transactionGroup);
      connection = self->_connection;
      queue = self->_queue;
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __66__CMIOExtensionProviderHostContext_setPluginPropertyValues_reply___block_invoke;
      v16[3] = &unk_26517C940;
      v16[4] = self;
      v16[5] = a4;
      xpc_connection_send_message_with_reply(connection, v9, queue, v16);
    }
    else
    {
      id v15 = CMIOLog();
      if (v15)
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          -[CMIOExtensionProviderHostContext setPluginPropertyValues:reply:]();
        }
      }
      (*((void (**)(id, uint64_t))a4 + 2))(a4, [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-5 userInfo:0]);
    }
    xpc_release(v9);
  }
  else
  {
    uint64_t v14 = CMIOLog();
    if (v14 && os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[CMIOExtensionProviderHostContext setPluginPropertyValues:reply:]();
    }
    (*((void (**)(id, uint64_t))a4 + 2))(a4, [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-1 userInfo:0]);
  }
}

void __66__CMIOExtensionProviderHostContext_setPluginPropertyValues_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = MEMORY[0x245679950](a2);
  if (v4 == MEMORY[0x263EF8720])
  {
    id v6 = CMIOLog();
    if (v6 && os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
      __66__CMIOExtensionProviderHostContext_setPluginPropertyValues_reply___block_invoke_cold_2();
    }
    [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-7 userInfo:0];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else if (v4 == MEMORY[0x263EF8708])
  {
    int int64 = xpc_dictionary_get_int64(a2, "errorReturn");
    if (int64) {
      [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:int64 userInfo:0];
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    objc_super v5 = CMIOLog();
    if (v5 && os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
      __66__CMIOExtensionProviderHostContext_setPluginPropertyValues_reply___block_invoke_cold_3();
    }
    [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6 userInfo:0];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 24));
}

- (void)availableDevicePropertiesWithDeviceID:(id)a3 reply:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (CMIOModuleLogLevel_once_1 != -1) {
    dispatch_once(&CMIOModuleLogLevel_once_1, &__block_literal_global_150);
  }
  if (CMIOModuleLogLevel_cmioLevel_1 >= 1)
  {
    xpc_object_t v7 = CMIOLog();
    if (v7)
    {
      xpc_object_t v8 = v7;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315907;
        id v15 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        __int16 v16 = 1024;
        int v17 = 655;
        __int16 v18 = 2080;
        __int16 v19 = "-[CMIOExtensionProviderHostContext availableDevicePropertiesWithDeviceID:reply:]";
        __int16 v20 = 2113;
        __int16 v21 = self;
        _os_log_impl(&dword_2432B6000, v8, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{private}@", buf, 0x26u);
      }
    }
  }
  xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v9, "MessageType", 0xBuLL);
  if (cmio_XPCMessageSetCFString(v9, "param1", a3))
  {
    id v10 = CMIOLog();
    if (v10 && os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[CMIOExtensionProviderHostContext availableDevicePropertiesWithDeviceID:reply:]();
    }
    (*((void (**)(id, void, uint64_t))a4 + 2))(a4, 0, [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-5 userInfo:0]);
  }
  else
  {
    dispatch_group_enter((dispatch_group_t)self->_transactionGroup);
    connection = self->_connection;
    queue = self->_queue;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __80__CMIOExtensionProviderHostContext_availableDevicePropertiesWithDeviceID_reply___block_invoke;
    v13[3] = &unk_26517C940;
    v13[4] = self;
    v13[5] = a4;
    xpc_connection_send_message_with_reply(connection, v9, queue, v13);
  }
  xpc_release(v9);
}

void __80__CMIOExtensionProviderHostContext_availableDevicePropertiesWithDeviceID_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v4 = MEMORY[0x245679950](a2);
  if (v4 == MEMORY[0x263EF8720])
  {
    id v6 = CMIOLog();
    if (v6 && os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
      __80__CMIOExtensionProviderHostContext_availableDevicePropertiesWithDeviceID_reply___block_invoke_cold_2();
    }
    [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-7 userInfo:0];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else if (v4 == MEMORY[0x263EF8708])
  {
    int int64 = xpc_dictionary_get_int64(a2, "errorReturn");
    if (int64)
    {
      [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:int64 userInfo:0];
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      CFTypeRef cf = 0;
      cmio_XPCMessageCopyCFArray(a2, "param1", (NSObject **)&cf);
      if (cf)
      {
        objc_msgSend(MEMORY[0x263EFFA08], "setWithArray:");
        CFRelease(cf);
        CFTypeRef cf = 0;
      }
      else
      {
        xpc_object_t v8 = CMIOLog();
        if (v8 && os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          xpc_object_t v9 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
          __80__CMIOExtensionProviderHostContext_availableDevicePropertiesWithDeviceID_reply___block_invoke_cold_3((uint64_t)v9, (uint64_t)v11);
        }
        [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6 userInfo:0];
      }
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
  else
  {
    objc_super v5 = CMIOLog();
    if (v5 && os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
      __80__CMIOExtensionProviderHostContext_availableDevicePropertiesWithDeviceID_reply___block_invoke_cold_4();
    }
    [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6 userInfo:0];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 24));
}

- (void)deviceStatesWithDeviceID:(id)a3 reply:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (CMIOModuleLogLevel_once_1 != -1) {
    dispatch_once(&CMIOModuleLogLevel_once_1, &__block_literal_global_150);
  }
  if (CMIOModuleLogLevel_cmioLevel_1 >= 1)
  {
    xpc_object_t v7 = CMIOLog();
    if (v7)
    {
      xpc_object_t v8 = v7;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315907;
        id v15 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        __int16 v16 = 1024;
        int v17 = 718;
        __int16 v18 = 2080;
        __int16 v19 = "-[CMIOExtensionProviderHostContext deviceStatesWithDeviceID:reply:]";
        __int16 v20 = 2113;
        __int16 v21 = self;
        _os_log_impl(&dword_2432B6000, v8, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{private}@", buf, 0x26u);
      }
    }
  }
  xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v9, "MessageType", 0xAuLL);
  if (cmio_XPCMessageSetCFString(v9, "param1", a3))
  {
    id v10 = CMIOLog();
    if (v10 && os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[CMIOExtensionProviderHostContext deviceStatesWithDeviceID:reply:]();
    }
    (*((void (**)(id, void, void, uint64_t))a4 + 2))(a4, 0, 0, [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-5 userInfo:0]);
  }
  else
  {
    dispatch_group_enter((dispatch_group_t)self->_transactionGroup);
    connection = self->_connection;
    queue = self->_queue;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __67__CMIOExtensionProviderHostContext_deviceStatesWithDeviceID_reply___block_invoke;
    v13[3] = &unk_26517C940;
    v13[4] = self;
    v13[5] = a4;
    xpc_connection_send_message_with_reply(connection, v9, queue, v13);
  }
  xpc_release(v9);
}

void __67__CMIOExtensionProviderHostContext_deviceStatesWithDeviceID_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v4 = MEMORY[0x245679950](a2);
  if (v4 != MEMORY[0x263EF8720])
  {
    if (v4 != MEMORY[0x263EF8708])
    {
      objc_super v5 = CMIOLog();
      if (v5 && os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        __67__CMIOExtensionProviderHostContext_deviceStatesWithDeviceID_reply___block_invoke_cold_5();
      }
      [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6 userInfo:0];
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      goto LABEL_26;
    }
    int int64 = xpc_dictionary_get_int64(a2, "errorReturn");
    if (int64)
    {
      [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:int64 userInfo:0];
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      goto LABEL_26;
    }
    xpc_object_t value = xpc_dictionary_get_value(a2, "param1");
    if (value)
    {
      if (+[CMIOExtensionPropertyState copyPropertyStatesFromXPCDictionary:value])
      {
        goto LABEL_23;
      }
      int v11 = CMIOLog();
      if (v11 && os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        uint64_t v12 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        __67__CMIOExtensionProviderHostContext_deviceStatesWithDeviceID_reply___block_invoke_cold_4((uint64_t)v12, (uint64_t)v16);
      }
    }
    else
    {
      xpc_object_t v9 = CMIOLog();
      if (v9 && os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        id v10 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        __67__CMIOExtensionProviderHostContext_deviceStatesWithDeviceID_reply___block_invoke_cold_3((uint64_t)v10, (uint64_t)v16);
      }
    }
    [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6 userInfo:0];
LABEL_23:
    xpc_object_t v13 = xpc_dictionary_get_value(a2, "param2");
    if (v13)
    {
      id v14 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      applier[0] = MEMORY[0x263EF8330];
      applier[1] = 3221225472;
      applier[2] = __67__CMIOExtensionProviderHostContext_deviceStatesWithDeviceID_reply___block_invoke_28;
      applier[3] = &unk_26517C5C0;
      applier[4] = v14;
      xpc_array_apply(v13, applier);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_26;
  }
  id v6 = CMIOLog();
  if (v6 && os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
    __67__CMIOExtensionProviderHostContext_deviceStatesWithDeviceID_reply___block_invoke_cold_2();
  }
  [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-7 userInfo:0];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_26:
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 24));
}

uint64_t __67__CMIOExtensionProviderHostContext_deviceStatesWithDeviceID_reply___block_invoke_28(uint64_t a1)
{
  id v2 = +[CMIOExtensionPropertyState copyPropertyStatesFromXPCDictionary:](CMIOExtensionPropertyState, "copyPropertyStatesFromXPCDictionary:");
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = (void *)[v2 objectForKeyedSubscript:0x26F89C550];
    if ([v4 value]) {
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v3, objc_msgSend(v4, "value"));
    }
  }
  else
  {
    objc_super v5 = CMIOLog();
    if (v5 && os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __67__CMIOExtensionProviderHostContext_deviceStatesWithDeviceID_reply___block_invoke_28_cold_1();
    }
  }
  return 1;
}

- (void)devicePropertyStatesWithDeviceID:(id)a3 properties:(id)a4 reply:(id)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  if (CMIOModuleLogLevel_once_1 != -1) {
    dispatch_once(&CMIOModuleLogLevel_once_1, &__block_literal_global_150);
  }
  if (CMIOModuleLogLevel_cmioLevel_1 >= 1)
  {
    xpc_object_t v9 = CMIOLog();
    if (v9)
    {
      id v10 = v9;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315907;
        __int16 v18 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        __int16 v19 = 1024;
        int v20 = 804;
        __int16 v21 = 2080;
        uint64_t v22 = "-[CMIOExtensionProviderHostContext devicePropertyStatesWithDeviceID:properties:reply:]";
        __int16 v23 = 2113;
        id v24 = self;
        _os_log_impl(&dword_2432B6000, v10, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{private}@", buf, 0x26u);
      }
    }
  }
  xpc_object_t v11 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v11, "MessageType", 0xCuLL);
  if (cmio_XPCMessageSetCFString(v11, "param1", a3))
  {
    uint64_t v12 = CMIOLog();
    if (v12 && os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[CMIOExtensionProviderHostContext devicePropertyStatesWithDeviceID:properties:reply:]();
    }
    (*((void (**)(id, void, uint64_t))a5 + 2))(a5, 0, [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-5 userInfo:0]);
  }
  else
  {
    if (a4)
    {
      if (cmio_XPCMessageSetCFArray(v11, "param2", (CFTypeRef)[a4 allObjects]))
      {
        xpc_object_t v13 = CMIOLog();
        if (v13)
        {
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
            -[CMIOExtensionProviderHostContext devicePropertyStatesWithDeviceID:properties:reply:]();
          }
        }
      }
    }
    dispatch_group_enter((dispatch_group_t)self->_transactionGroup);
    connection = self->_connection;
    queue = self->_queue;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __86__CMIOExtensionProviderHostContext_devicePropertyStatesWithDeviceID_properties_reply___block_invoke;
    v16[3] = &unk_26517C940;
    v16[4] = self;
    v16[5] = a5;
    xpc_connection_send_message_with_reply(connection, v11, queue, v16);
  }
  xpc_release(v11);
}

void __86__CMIOExtensionProviderHostContext_devicePropertyStatesWithDeviceID_properties_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v4 = MEMORY[0x245679950](a2);
  if (v4 != MEMORY[0x263EF8720])
  {
    if (v4 != MEMORY[0x263EF8708])
    {
      objc_super v5 = CMIOLog();
      if (v5 && os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        __86__CMIOExtensionProviderHostContext_devicePropertyStatesWithDeviceID_properties_reply___block_invoke_cold_5();
      }
      [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6 userInfo:0];
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      goto LABEL_24;
    }
    int int64 = xpc_dictionary_get_int64(a2, "errorReturn");
    if (int64)
    {
      [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:int64 userInfo:0];
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      goto LABEL_24;
    }
    xpc_object_t value = xpc_dictionary_get_value(a2, "param1");
    if (value)
    {
      if (+[CMIOExtensionPropertyState copyPropertyStatesFromXPCDictionary:value])
      {
        goto LABEL_23;
      }
      xpc_object_t v11 = CMIOLog();
      if (v11 && os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        uint64_t v12 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        __86__CMIOExtensionProviderHostContext_devicePropertyStatesWithDeviceID_properties_reply___block_invoke_cold_4((uint64_t)v12, (uint64_t)v13);
      }
    }
    else
    {
      xpc_object_t v9 = CMIOLog();
      if (v9 && os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        id v10 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        __86__CMIOExtensionProviderHostContext_devicePropertyStatesWithDeviceID_properties_reply___block_invoke_cold_3((uint64_t)v10, (uint64_t)v13);
      }
    }
    [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6 userInfo:0];
LABEL_23:
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_24;
  }
  id v6 = CMIOLog();
  if (v6 && os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
    __86__CMIOExtensionProviderHostContext_devicePropertyStatesWithDeviceID_properties_reply___block_invoke_cold_2();
  }
  [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-7 userInfo:0];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_24:
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 24));
}

- (void)setDevicePropertyValuesWithDeviceID:(id)a3 propertyValues:(id)a4 reply:(id)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  if (CMIOModuleLogLevel_once_1 != -1) {
    dispatch_once(&CMIOModuleLogLevel_once_1, &__block_literal_global_150);
  }
  if (CMIOModuleLogLevel_cmioLevel_1 >= 1)
  {
    xpc_object_t v9 = CMIOLog();
    if (v9)
    {
      id v10 = v9;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315907;
        __int16 v21 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        __int16 v22 = 1024;
        int v23 = 876;
        __int16 v24 = 2080;
        uint64_t v25 = "-[CMIOExtensionProviderHostContext setDevicePropertyValuesWithDeviceID:propertyValues:reply:]";
        __int16 v26 = 2113;
        __int16 v27 = self;
        _os_log_impl(&dword_2432B6000, v10, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{private}@", buf, 0x26u);
      }
    }
  }
  if ([a4 count])
  {
    xpc_object_t v11 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v11, "MessageType", 0xDuLL);
    if (cmio_XPCMessageSetCFString(v11, "param1", a3))
    {
      uint64_t v12 = CMIOLog();
      if (v12)
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          -[CMIOExtensionProviderHostContext setDevicePropertyValuesWithDeviceID:propertyValues:reply:]();
        }
      }
    }
    else
    {
      id v14 = +[CMIOExtensionPropertyState copyXPCDictionaryFromPropertyValues:a4];
      if (v14)
      {
        id v15 = v14;
        xpc_dictionary_set_value(v11, "param2", v14);
        xpc_release(v15);
        dispatch_group_enter((dispatch_group_t)self->_transactionGroup);
        connection = self->_connection;
        queue = self->_queue;
        v19[0] = MEMORY[0x263EF8330];
        v19[1] = 3221225472;
        v19[2] = __93__CMIOExtensionProviderHostContext_setDevicePropertyValuesWithDeviceID_propertyValues_reply___block_invoke;
        v19[3] = &unk_26517C940;
        v19[4] = self;
        v19[5] = a5;
        xpc_connection_send_message_with_reply(connection, v11, queue, v19);
        goto LABEL_19;
      }
      __int16 v18 = CMIOLog();
      if (v18 && os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[CMIOExtensionProviderHostContext setDevicePropertyValuesWithDeviceID:propertyValues:reply:]();
      }
    }
    (*((void (**)(id, uint64_t))a5 + 2))(a5, [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-5 userInfo:0]);
LABEL_19:
    xpc_release(v11);
    return;
  }
  xpc_object_t v13 = CMIOLog();
  if (v13 && os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    -[CMIOExtensionProviderHostContext setDevicePropertyValuesWithDeviceID:propertyValues:reply:]();
  }
  (*((void (**)(id, uint64_t))a5 + 2))(a5, [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-1 userInfo:0]);
}

void __93__CMIOExtensionProviderHostContext_setDevicePropertyValuesWithDeviceID_propertyValues_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = MEMORY[0x245679950](a2);
  if (v4 == MEMORY[0x263EF8720])
  {
    id v6 = CMIOLog();
    if (v6 && os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
      __93__CMIOExtensionProviderHostContext_setDevicePropertyValuesWithDeviceID_propertyValues_reply___block_invoke_cold_2();
    }
    [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-7 userInfo:0];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else if (v4 == MEMORY[0x263EF8708])
  {
    int int64 = xpc_dictionary_get_int64(a2, "errorReturn");
    if (int64) {
      [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:int64 userInfo:0];
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    objc_super v5 = CMIOLog();
    if (v5 && os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
      __93__CMIOExtensionProviderHostContext_setDevicePropertyValuesWithDeviceID_propertyValues_reply___block_invoke_cold_3();
    }
    [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6 userInfo:0];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 24));
}

- (void)availableStreamPropertiesWithStreamID:(id)a3 reply:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (CMIOModuleLogLevel_once_1 != -1) {
    dispatch_once(&CMIOModuleLogLevel_once_1, &__block_literal_global_150);
  }
  if (CMIOModuleLogLevel_cmioLevel_1 >= 1)
  {
    xpc_object_t v7 = CMIOLog();
    if (v7)
    {
      xpc_object_t v8 = v7;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315907;
        id v15 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        __int16 v16 = 1024;
        int v17 = 946;
        __int16 v18 = 2080;
        __int16 v19 = "-[CMIOExtensionProviderHostContext availableStreamPropertiesWithStreamID:reply:]";
        __int16 v20 = 2113;
        __int16 v21 = self;
        _os_log_impl(&dword_2432B6000, v8, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{private}@", buf, 0x26u);
      }
    }
  }
  xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v9, "MessageType", 0x14uLL);
  if (cmio_XPCMessageSetCFString(v9, "param1", a3))
  {
    id v10 = CMIOLog();
    if (v10 && os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[CMIOExtensionProviderHostContext availableStreamPropertiesWithStreamID:reply:]();
    }
    (*((void (**)(id, void, uint64_t))a4 + 2))(a4, 0, [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-5 userInfo:0]);
  }
  else
  {
    dispatch_group_enter((dispatch_group_t)self->_transactionGroup);
    connection = self->_connection;
    queue = self->_queue;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __80__CMIOExtensionProviderHostContext_availableStreamPropertiesWithStreamID_reply___block_invoke;
    v13[3] = &unk_26517C940;
    v13[4] = self;
    v13[5] = a4;
    xpc_connection_send_message_with_reply(connection, v9, queue, v13);
  }
  xpc_release(v9);
}

void __80__CMIOExtensionProviderHostContext_availableStreamPropertiesWithStreamID_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v4 = MEMORY[0x245679950](a2);
  if (v4 == MEMORY[0x263EF8720])
  {
    id v6 = CMIOLog();
    if (v6 && os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
      __80__CMIOExtensionProviderHostContext_availableStreamPropertiesWithStreamID_reply___block_invoke_cold_2();
    }
    [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-7 userInfo:0];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else if (v4 == MEMORY[0x263EF8708])
  {
    int int64 = xpc_dictionary_get_int64(a2, "errorReturn");
    if (int64)
    {
      [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:int64 userInfo:0];
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      CFTypeRef cf = 0;
      cmio_XPCMessageCopyCFArray(a2, "param1", (NSObject **)&cf);
      if (cf)
      {
        objc_msgSend(MEMORY[0x263EFFA08], "setWithArray:");
        CFRelease(cf);
        CFTypeRef cf = 0;
      }
      else
      {
        xpc_object_t v8 = CMIOLog();
        if (v8 && os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          xpc_object_t v9 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
          __80__CMIOExtensionProviderHostContext_availableStreamPropertiesWithStreamID_reply___block_invoke_cold_3((uint64_t)v9, (uint64_t)v11);
        }
        [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6 userInfo:0];
      }
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
  else
  {
    objc_super v5 = CMIOLog();
    if (v5 && os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
      __80__CMIOExtensionProviderHostContext_availableStreamPropertiesWithStreamID_reply___block_invoke_cold_4();
    }
    [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6 userInfo:0];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 24));
}

- (void)streamPropertyStatesWithStreamID:(id)a3 properties:(id)a4 reply:(id)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  if (CMIOModuleLogLevel_once_1 != -1) {
    dispatch_once(&CMIOModuleLogLevel_once_1, &__block_literal_global_150);
  }
  if (CMIOModuleLogLevel_cmioLevel_1 >= 1)
  {
    xpc_object_t v9 = CMIOLog();
    if (v9)
    {
      id v10 = v9;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315907;
        __int16 v18 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        __int16 v19 = 1024;
        int v20 = 1009;
        __int16 v21 = 2080;
        uint64_t v22 = "-[CMIOExtensionProviderHostContext streamPropertyStatesWithStreamID:properties:reply:]";
        __int16 v23 = 2113;
        __int16 v24 = self;
        _os_log_impl(&dword_2432B6000, v10, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{private}@", buf, 0x26u);
      }
    }
  }
  xpc_object_t v11 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v11, "MessageType", 0x15uLL);
  if (cmio_XPCMessageSetCFString(v11, "param1", a3))
  {
    uint64_t v12 = CMIOLog();
    if (v12 && os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[CMIOExtensionProviderHostContext streamPropertyStatesWithStreamID:properties:reply:]();
    }
    (*((void (**)(id, void, uint64_t))a5 + 2))(a5, 0, [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-5 userInfo:0]);
  }
  else
  {
    if (a4)
    {
      if (cmio_XPCMessageSetCFArray(v11, "param2", (CFTypeRef)[a4 allObjects]))
      {
        xpc_object_t v13 = CMIOLog();
        if (v13)
        {
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
            -[CMIOExtensionProviderHostContext streamPropertyStatesWithStreamID:properties:reply:]();
          }
        }
      }
    }
    dispatch_group_enter((dispatch_group_t)self->_transactionGroup);
    connection = self->_connection;
    queue = self->_queue;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __86__CMIOExtensionProviderHostContext_streamPropertyStatesWithStreamID_properties_reply___block_invoke;
    v16[3] = &unk_26517C940;
    v16[4] = self;
    v16[5] = a5;
    xpc_connection_send_message_with_reply(connection, v11, queue, v16);
  }
  xpc_release(v11);
}

void __86__CMIOExtensionProviderHostContext_streamPropertyStatesWithStreamID_properties_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v4 = MEMORY[0x245679950](a2);
  if (v4 != MEMORY[0x263EF8720])
  {
    if (v4 != MEMORY[0x263EF8708])
    {
      objc_super v5 = CMIOLog();
      if (v5 && os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        __86__CMIOExtensionProviderHostContext_streamPropertyStatesWithStreamID_properties_reply___block_invoke_cold_5();
      }
      [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6 userInfo:0];
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      goto LABEL_24;
    }
    int int64 = xpc_dictionary_get_int64(a2, "errorReturn");
    if (int64)
    {
      [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:int64 userInfo:0];
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      goto LABEL_24;
    }
    xpc_object_t value = xpc_dictionary_get_value(a2, "param1");
    if (value)
    {
      if (+[CMIOExtensionPropertyState copyPropertyStatesFromXPCDictionary:value])
      {
        goto LABEL_23;
      }
      xpc_object_t v11 = CMIOLog();
      if (v11 && os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        uint64_t v12 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        __86__CMIOExtensionProviderHostContext_streamPropertyStatesWithStreamID_properties_reply___block_invoke_cold_4((uint64_t)v12, (uint64_t)v13);
      }
    }
    else
    {
      xpc_object_t v9 = CMIOLog();
      if (v9 && os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        id v10 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        __86__CMIOExtensionProviderHostContext_streamPropertyStatesWithStreamID_properties_reply___block_invoke_cold_3((uint64_t)v10, (uint64_t)v13);
      }
    }
    [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6 userInfo:0];
LABEL_23:
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_24;
  }
  id v6 = CMIOLog();
  if (v6 && os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
    __86__CMIOExtensionProviderHostContext_streamPropertyStatesWithStreamID_properties_reply___block_invoke_cold_2();
  }
  [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-7 userInfo:0];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_24:
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 24));
}

- (void)setStreamPropertyValuesWithStreamID:(id)a3 propertyValues:(id)a4 reply:(id)a5
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  if (CMIOModuleLogLevel_once_1 != -1) {
    dispatch_once(&CMIOModuleLogLevel_once_1, &__block_literal_global_150);
  }
  if (CMIOModuleLogLevel_cmioLevel_1 >= 1)
  {
    xpc_object_t v9 = CMIOLog();
    if (v9)
    {
      id v10 = v9;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315907;
        uint64_t v36 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        __int16 v37 = 1024;
        int v38 = 1081;
        __int16 v39 = 2080;
        v40 = "-[CMIOExtensionProviderHostContext setStreamPropertyValuesWithStreamID:propertyValues:reply:]";
        __int16 v41 = 2113;
        v42 = self;
        _os_log_impl(&dword_2432B6000, v10, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{private}@", buf, 0x26u);
      }
    }
  }
  if ([a4 objectForKeyedSubscript:@"CMIOExtensionPropertyStreamFrameDuration"]
    || [a4 objectForKeyedSubscript:@"CMIOExtensionPropertyStreamMaxFrameDuration"])
  {
    xpc_object_t v11 = CMIOLog();
    if (v11)
    {
      uint64_t v12 = v11;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        xpc_object_t v13 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        *(_DWORD *)buf = 136315906;
        uint64_t v36 = v13;
        __int16 v37 = 1024;
        int v38 = 1085;
        __int16 v39 = 2080;
        v40 = "-[CMIOExtensionProviderHostContext setStreamPropertyValuesWithStreamID:propertyValues:reply:]";
        __int16 v41 = 2112;
        v42 = a4;
        _os_log_impl(&dword_2432B6000, v12, OS_LOG_TYPE_DEFAULT, "%s:%d:%s SetProperty - %@", buf, 0x26u);
      }
    }
    CFArrayRef theArray = 0;
    uint64_t v14 = FigCopyBacktrace();
    if (v14 >= 1 && theArray != 0)
    {
      id v29 = a3;
      id v30 = a4;
      int v31 = self;
      id v32 = a5;
      CFIndex v16 = 0;
      do
      {
        int v17 = CMIOLog();
        if (v17)
        {
          __int16 v18 = v17;
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v19 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
            ValueAtIndex = (void *)CFArrayGetValueAtIndex(theArray, v16);
            *(_DWORD *)buf = 136315907;
            uint64_t v36 = v19;
            __int16 v37 = 1024;
            int v38 = 1090;
            __int16 v39 = 2080;
            v40 = "-[CMIOExtensionProviderHostContext setStreamPropertyValuesWithStreamID:propertyValues:reply:]";
            __int16 v41 = 2113;
            v42 = ValueAtIndex;
            _os_log_impl(&dword_2432B6000, v18, OS_LOG_TYPE_DEFAULT, "%s:%d:%s backtrace %{private}@", buf, 0x26u);
          }
        }
        ++v16;
      }
      while (v14 != v16);
      self = v31;
    }
  }
  if (objc_msgSend(a4, "count", v29, v30, v31, v32))
  {
    xpc_object_t v21 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v21, "MessageType", 0x16uLL);
    if (cmio_XPCMessageSetCFString(v21, "param1", a3))
    {
      uint64_t v22 = CMIOLog();
      if (v22)
      {
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          -[CMIOExtensionProviderHostContext setStreamPropertyValuesWithStreamID:propertyValues:reply:]();
        }
      }
    }
    else
    {
      id v24 = +[CMIOExtensionPropertyState copyXPCDictionaryFromPropertyValues:a4];
      if (v24)
      {
        uint64_t v25 = v24;
        xpc_dictionary_set_value(v21, "param2", v24);
        xpc_release(v25);
        dispatch_group_enter((dispatch_group_t)self->_transactionGroup);
        connection = self->_connection;
        queue = self->_queue;
        handler[0] = MEMORY[0x263EF8330];
        handler[1] = 3221225472;
        handler[2] = __93__CMIOExtensionProviderHostContext_setStreamPropertyValuesWithStreamID_propertyValues_reply___block_invoke;
        handler[3] = &unk_26517C940;
        handler[4] = self;
        handler[5] = a5;
        xpc_connection_send_message_with_reply(connection, v21, queue, handler);
        goto LABEL_34;
      }
      uint64_t v28 = CMIOLog();
      if (v28 && os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        -[CMIOExtensionProviderHostContext setStreamPropertyValuesWithStreamID:propertyValues:reply:]();
      }
    }
    (*((void (**)(id, uint64_t))a5 + 2))(a5, [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-5 userInfo:0]);
LABEL_34:
    xpc_release(v21);
    return;
  }
  __int16 v23 = CMIOLog();
  if (v23 && os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
    -[CMIOExtensionProviderHostContext setStreamPropertyValuesWithStreamID:propertyValues:reply:]();
  }
  (*((void (**)(id, uint64_t))a5 + 2))(a5, [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-1 userInfo:0]);
}

void __93__CMIOExtensionProviderHostContext_setStreamPropertyValuesWithStreamID_propertyValues_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = MEMORY[0x245679950](a2);
  if (v4 == MEMORY[0x263EF8720])
  {
    id v6 = CMIOLog();
    if (v6 && os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
      __93__CMIOExtensionProviderHostContext_setStreamPropertyValuesWithStreamID_propertyValues_reply___block_invoke_cold_2();
    }
    [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-7 userInfo:0];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else if (v4 == MEMORY[0x263EF8708])
  {
    int int64 = xpc_dictionary_get_int64(a2, "errorReturn");
    if (int64) {
      [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:int64 userInfo:0];
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    objc_super v5 = CMIOLog();
    if (v5 && os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
      __93__CMIOExtensionProviderHostContext_setStreamPropertyValuesWithStreamID_propertyValues_reply___block_invoke_cold_3();
    }
    [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6 userInfo:0];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 24));
}

- (void)startStreamWithStreamID:(id)a3 reply:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (CMIOModuleLogLevel_once_1 != -1) {
    dispatch_once(&CMIOModuleLogLevel_once_1, &__block_literal_global_150);
  }
  if (CMIOModuleLogLevel_cmioLevel_1 >= 1)
  {
    xpc_object_t v7 = CMIOLog();
    if (v7)
    {
      xpc_object_t v8 = v7;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315907;
        id v15 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        __int16 v16 = 1024;
        int v17 = 1167;
        __int16 v18 = 2080;
        __int16 v19 = "-[CMIOExtensionProviderHostContext startStreamWithStreamID:reply:]";
        __int16 v20 = 2113;
        xpc_object_t v21 = self;
        _os_log_impl(&dword_2432B6000, v8, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{private}@", buf, 0x26u);
      }
    }
  }
  xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v9, "MessageType", 0x17uLL);
  if (cmio_XPCMessageSetCFString(v9, "param1", a3))
  {
    id v10 = CMIOLog();
    if (v10 && os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[CMIOExtensionProviderHostContext startStreamWithStreamID:reply:]();
    }
    (*((void (**)(id, uint64_t))a4 + 2))(a4, [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-5 userInfo:0]);
  }
  else
  {
    dispatch_group_enter((dispatch_group_t)self->_transactionGroup);
    connection = self->_connection;
    queue = self->_queue;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __66__CMIOExtensionProviderHostContext_startStreamWithStreamID_reply___block_invoke;
    v13[3] = &unk_26517C940;
    v13[4] = self;
    v13[5] = a4;
    xpc_connection_send_message_with_reply(connection, v9, queue, v13);
  }
  xpc_release(v9);
}

void __66__CMIOExtensionProviderHostContext_startStreamWithStreamID_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = MEMORY[0x245679950](a2);
  if (v4 == MEMORY[0x263EF8720])
  {
    id v6 = CMIOLog();
    if (v6 && os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
      __66__CMIOExtensionProviderHostContext_startStreamWithStreamID_reply___block_invoke_cold_2();
    }
    [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-7 userInfo:0];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else if (v4 == MEMORY[0x263EF8708])
  {
    int int64 = xpc_dictionary_get_int64(a2, "errorReturn");
    if (int64) {
      [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:int64 userInfo:0];
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    objc_super v5 = CMIOLog();
    if (v5 && os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
      __66__CMIOExtensionProviderHostContext_startStreamWithStreamID_reply___block_invoke_cold_3();
    }
    [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6 userInfo:0];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 24));
}

- (void)stopStreamWithStreamID:(id)a3 reply:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (CMIOModuleLogLevel_once_1 != -1) {
    dispatch_once(&CMIOModuleLogLevel_once_1, &__block_literal_global_150);
  }
  if (CMIOModuleLogLevel_cmioLevel_1 >= 1)
  {
    xpc_object_t v7 = CMIOLog();
    if (v7)
    {
      xpc_object_t v8 = v7;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315907;
        id v15 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        __int16 v16 = 1024;
        int v17 = 1217;
        __int16 v18 = 2080;
        __int16 v19 = "-[CMIOExtensionProviderHostContext stopStreamWithStreamID:reply:]";
        __int16 v20 = 2113;
        xpc_object_t v21 = self;
        _os_log_impl(&dword_2432B6000, v8, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{private}@", buf, 0x26u);
      }
    }
  }
  xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v9, "MessageType", 0x18uLL);
  if (cmio_XPCMessageSetCFString(v9, "param1", a3))
  {
    id v10 = CMIOLog();
    if (v10 && os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[CMIOExtensionProviderHostContext stopStreamWithStreamID:reply:]();
    }
    (*((void (**)(id, uint64_t))a4 + 2))(a4, [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-5 userInfo:0]);
  }
  else
  {
    dispatch_group_enter((dispatch_group_t)self->_transactionGroup);
    connection = self->_connection;
    queue = self->_queue;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __65__CMIOExtensionProviderHostContext_stopStreamWithStreamID_reply___block_invoke;
    v13[3] = &unk_26517C940;
    v13[4] = self;
    v13[5] = a4;
    xpc_connection_send_message_with_reply(connection, v9, queue, v13);
  }
  xpc_release(v9);
}

void __65__CMIOExtensionProviderHostContext_stopStreamWithStreamID_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = MEMORY[0x245679950](a2);
  if (v4 == MEMORY[0x263EF8720])
  {
    id v6 = CMIOLog();
    if (v6 && os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
      __65__CMIOExtensionProviderHostContext_stopStreamWithStreamID_reply___block_invoke_cold_2();
    }
    [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-7 userInfo:0];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else if (v4 == MEMORY[0x263EF8708])
  {
    int int64 = xpc_dictionary_get_int64(a2, "errorReturn");
    if (int64) {
      [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:int64 userInfo:0];
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    objc_super v5 = CMIOLog();
    if (v5 && os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
      __65__CMIOExtensionProviderHostContext_stopStreamWithStreamID_reply___block_invoke_cold_3();
    }
    [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6 userInfo:0];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 24));
}

- (void)refreshExtensionConnection
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v3 = CMIOLog();
  if (v3)
  {
    uint64_t v4 = v3;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v5 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
      pid_t pid = xpc_connection_get_pid(self->_connection);
      int v7 = 136316163;
      xpc_object_t v8 = v5;
      __int16 v9 = 1024;
      int v10 = 1267;
      __int16 v11 = 2080;
      uint64_t v12 = "-[CMIOExtensionProviderHostContext refreshExtensionConnection]";
      __int16 v13 = 2082;
      uint64_t v14 = "-[CMIOExtensionProviderHostContext refreshExtensionConnection]";
      __int16 v15 = 1025;
      pid_t v16 = pid;
      _os_log_impl(&dword_2432B6000, v4, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{public}s for connection(%{private}d)", (uint8_t *)&v7, 0x2Cu);
    }
  }
  [(CMIOExtensionProviderHostContext *)self sendEmptyClientInfo];
}

- (void)sendEmptyClientInfo
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (CMIOModuleLogLevel_once_1 != -1) {
    dispatch_once(&CMIOModuleLogLevel_once_1, &__block_literal_global_150);
  }
  if (CMIOModuleLogLevel_cmioLevel_1 >= 1)
  {
    uint64_t v3 = CMIOLog();
    if (v3)
    {
      uint64_t v4 = v3;
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        int v6 = 136315907;
        int v7 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        __int16 v8 = 1024;
        int v9 = 1273;
        __int16 v10 = 2080;
        __int16 v11 = "-[CMIOExtensionProviderHostContext sendEmptyClientInfo]";
        __int16 v12 = 2113;
        __int16 v13 = self;
        _os_log_impl(&dword_2432B6000, v4, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{private}@", (uint8_t *)&v6, 0x26u);
      }
    }
  }
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v5, "MessageType", 5uLL);
  xpc_connection_send_message_with_reply(self->_connection, v5, (dispatch_queue_t)self->_queue, &__block_literal_global_30);
  xpc_release(v5);
}

void __55__CMIOExtensionProviderHostContext_sendEmptyClientInfo__block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v3 = MEMORY[0x245679950](a2);
    if (v3 == MEMORY[0x263EF8720])
    {
      xpc_object_t v5 = CMIOLog();
      if (v5 && os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        __55__CMIOExtensionProviderHostContext_sendEmptyClientInfo__block_invoke_cold_1();
      }
    }
    else if (v3 == MEMORY[0x263EF8708])
    {
      if (xpc_dictionary_get_int64(a2, "errorReturn"))
      {
        int v6 = CMIOLog();
        if (v6)
        {
          if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
            __55__CMIOExtensionProviderHostContext_sendEmptyClientInfo__block_invoke_cold_2();
          }
        }
      }
    }
    else
    {
      uint64_t v4 = CMIOLog();
      if (v4)
      {
        if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
          __55__CMIOExtensionProviderHostContext_sendEmptyClientInfo__block_invoke_cold_3();
        }
      }
    }
  }
}

- (void)captureAsyncStillImageWithStreamID:(id)a3 uniqueID:(int64_t)a4 options:(id)a5 reply:(id)a6
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  if (CMIOModuleLogLevel_once_1 != -1) {
    dispatch_once(&CMIOModuleLogLevel_once_1, &__block_literal_global_150);
  }
  if (CMIOModuleLogLevel_cmioLevel_1 >= 1)
  {
    __int16 v11 = CMIOLog();
    if (v11)
    {
      __int16 v12 = v11;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315907;
        xpc_object_t v21 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        __int16 v22 = 1024;
        int v23 = 1300;
        __int16 v24 = 2080;
        uint64_t v25 = "-[CMIOExtensionProviderHostContext captureAsyncStillImageWithStreamID:uniqueID:options:reply:]";
        __int16 v26 = 2113;
        __int16 v27 = self;
        _os_log_impl(&dword_2432B6000, v12, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{private}@", buf, 0x26u);
      }
    }
  }
  xpc_object_t v13 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v13, "MessageType", 0x1AuLL);
  if (cmio_XPCMessageSetCFString(v13, "param1", a3))
  {
    uint64_t v14 = CMIOLog();
    if (v14 && os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[CMIOExtensionProviderHostContext captureAsyncStillImageWithStreamID:uniqueID:options:reply:]();
    }
  }
  else if (cmio_XPCMessageSetCFNumber(v13, "param2", (CFTypeRef)[NSNumber numberWithLongLong:a4]))
  {
    __int16 v15 = CMIOLog();
    if (v15 && os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[CMIOExtensionProviderHostContext captureAsyncStillImageWithStreamID:uniqueID:options:reply:]();
    }
  }
  else
  {
    if (!a5 || !cmio_XPCMessageSetCFDictionary(v13, "param3", a5))
    {
      dispatch_group_enter((dispatch_group_t)self->_transactionGroup);
      connection = self->_connection;
      queue = self->_queue;
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __94__CMIOExtensionProviderHostContext_captureAsyncStillImageWithStreamID_uniqueID_options_reply___block_invoke;
      v19[3] = &unk_26517C940;
      v19[4] = self;
      v19[5] = a6;
      xpc_connection_send_message_with_reply(connection, v13, queue, v19);
      goto LABEL_16;
    }
    pid_t v16 = CMIOLog();
    if (v16 && os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[CMIOExtensionProviderHostContext captureAsyncStillImageWithStreamID:uniqueID:options:reply:]();
    }
  }
  (*((void (**)(id, void, uint64_t))a6 + 2))(a6, 0, [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-5 userInfo:0]);
LABEL_16:
  xpc_release(v13);
}

void __94__CMIOExtensionProviderHostContext_captureAsyncStillImageWithStreamID_uniqueID_options_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v4 = MEMORY[0x245679950](a2);
  if (v4 == MEMORY[0x263EF8720])
  {
    int v6 = CMIOLog();
    if (v6 && os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
      __94__CMIOExtensionProviderHostContext_captureAsyncStillImageWithStreamID_uniqueID_options_reply___block_invoke_cold_2();
    }
    [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-7 userInfo:0];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else if (v4 == MEMORY[0x263EF8708])
  {
    int int64 = xpc_dictionary_get_int64(a2, "errorReturn");
    if (int64)
    {
      [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:int64 userInfo:0];
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      FigXPCMessageCreateBlockBufferData();
      __int16 v8 = CMIOLog();
      if (v8 && os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        int v9 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        __94__CMIOExtensionProviderHostContext_captureAsyncStillImageWithStreamID_uniqueID_options_reply___block_invoke_cold_3((uint64_t)v9, (uint64_t)v10);
      }
      [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6 userInfo:0];
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
  else
  {
    xpc_object_t v5 = CMIOLog();
    if (v5 && os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
      __94__CMIOExtensionProviderHostContext_captureAsyncStillImageWithStreamID_uniqueID_options_reply___block_invoke_cold_4();
    }
    [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6 userInfo:0];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 24));
}

- (void)enqueueReactionEffect:(id)a3 reactionType:(id)a4 reply:(id)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  if (CMIOModuleLogLevel_once_1 != -1) {
    dispatch_once(&CMIOModuleLogLevel_once_1, &__block_literal_global_150);
  }
  if (CMIOModuleLogLevel_cmioLevel_1 >= 1)
  {
    int v9 = CMIOLog();
    if (v9)
    {
      __int16 v10 = v9;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315907;
        __int16 v18 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        __int16 v19 = 1024;
        int v20 = 1390;
        __int16 v21 = 2080;
        __int16 v22 = "-[CMIOExtensionProviderHostContext enqueueReactionEffect:reactionType:reply:]";
        __int16 v23 = 2113;
        __int16 v24 = self;
        _os_log_impl(&dword_2432B6000, v10, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{private}@", buf, 0x26u);
      }
    }
  }
  xpc_object_t v11 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v11, "MessageType", 0x1CuLL);
  if (cmio_XPCMessageSetCFString(v11, "param1", a3))
  {
    __int16 v12 = CMIOLog();
    if (v12 && os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[CMIOExtensionProviderHostContext enqueueReactionEffect:reactionType:reply:]();
    }
  }
  else
  {
    if (!cmio_XPCMessageSetCFString(v11, "param2", a4))
    {
      dispatch_group_enter((dispatch_group_t)self->_transactionGroup);
      connection = self->_connection;
      queue = self->_queue;
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __77__CMIOExtensionProviderHostContext_enqueueReactionEffect_reactionType_reply___block_invoke;
      v16[3] = &unk_26517C940;
      v16[4] = self;
      v16[5] = a5;
      xpc_connection_send_message_with_reply(connection, v11, queue, v16);
      goto LABEL_16;
    }
    xpc_object_t v13 = CMIOLog();
    if (v13 && os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[CMIOExtensionProviderHostContext enqueueReactionEffect:reactionType:reply:]();
    }
  }
  (*((void (**)(id, uint64_t))a5 + 2))(a5, [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-5 userInfo:0]);
LABEL_16:
  xpc_release(v11);
}

void __77__CMIOExtensionProviderHostContext_enqueueReactionEffect_reactionType_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = MEMORY[0x245679950](a2);
  if (v4 == MEMORY[0x263EF8720])
  {
    int v6 = CMIOLog();
    if (v6 && os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
      __77__CMIOExtensionProviderHostContext_enqueueReactionEffect_reactionType_reply___block_invoke_cold_2();
    }
    [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-7 userInfo:0];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else if (v4 == MEMORY[0x263EF8708])
  {
    int int64 = xpc_dictionary_get_int64(a2, "errorReturn");
    if (int64) {
      [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:int64 userInfo:0];
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    xpc_object_t v5 = CMIOLog();
    if (v5 && os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
      __77__CMIOExtensionProviderHostContext_enqueueReactionEffect_reactionType_reply___block_invoke_cold_3();
    }
    [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6 userInfo:0];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 24));
}

- (void)completeTransaction
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (CMIOModuleLogLevel_once_1 != -1) {
    dispatch_once(&CMIOModuleLogLevel_once_1, &__block_literal_global_150);
  }
  if (CMIOModuleLogLevel_cmioLevel_1 >= 1)
  {
    uint64_t v3 = CMIOLog();
    if (v3)
    {
      uint64_t v4 = v3;
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 136315907;
        int v9 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        __int16 v10 = 1024;
        int v11 = 1451;
        __int16 v12 = 2080;
        xpc_object_t v13 = "-[CMIOExtensionProviderHostContext completeTransaction]";
        __int16 v14 = 2113;
        __int16 v15 = self;
        _os_log_impl(&dword_2432B6000, v4, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{private}@ will", (uint8_t *)&v8, 0x26u);
      }
    }
  }
  dispatch_group_wait((dispatch_group_t)self->_transactionGroup, 0xFFFFFFFFFFFFFFFFLL);
  if (CMIOModuleLogLevel_once_1 != -1) {
    dispatch_once(&CMIOModuleLogLevel_once_1, &__block_literal_global_150);
  }
  if (CMIOModuleLogLevel_cmioLevel_1 >= 1)
  {
    xpc_object_t v5 = CMIOLog();
    if (v5)
    {
      int v6 = v5;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        int v8 = 136315907;
        int v9 = v7;
        __int16 v10 = 1024;
        int v11 = 1455;
        __int16 v12 = 2080;
        xpc_object_t v13 = "-[CMIOExtensionProviderHostContext completeTransaction]";
        __int16 v14 = 2113;
        __int16 v15 = self;
        _os_log_impl(&dword_2432B6000, v6, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{private}@ did", (uint8_t *)&v8, 0x26u);
      }
    }
  }
}

- (OS_xpc_object)connection
{
  return self->_connection;
}

- (CMIOExtensionProviderHostDelegate)delegate
{
  return (CMIOExtensionProviderHostDelegate *)objc_loadWeak((id *)&self->_delegate);
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (void).cxx_destruct
{
}

void __64__CMIOExtensionProviderHostContext_initWithConnection_delegate___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  int v6 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  xpc_connection_get_pid(*(xpc_connection_t *)(a1 + 32));
  int v9 = 136316162;
  __int16 v10 = v6;
  __int16 v11 = 1024;
  OUTLINED_FUNCTION_7();
  __int16 v12 = "-[CMIOExtensionProviderHostContext initWithConnection:delegate:]_block_invoke";
  __int16 v13 = v7;
  int v14 = v8;
  __int16 v15 = 2114;
  uint64_t v16 = a2;
  _os_log_error_impl(&dword_2432B6000, a3, OS_LOG_TYPE_ERROR, "%s:%d:%s [%d] received %{public}@", (uint8_t *)&v9, 0x2Cu);
}

- (void)handleClientMessageWithConnection:message:.cold.1()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s Unknown message type %lld", v2, v3, v4, v5, v6);
}

- (void)availableDevicesChanged:message:.cold.1()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s Error: %ld, cmio_XPCMessageCopyCFArray failed", v2, v3, v4, v5, v6);
}

- (void)availableStreamsChanged:message:.cold.1()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s cmio_XPCMessageCopyCFString faileddeviceID == NULL == true ", v2, v3, v4, v5, v6);
}

- (void)availableStreamsChanged:message:.cold.2()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s Error: %ld, cmio_XPCMessageCopyCFArray failed", v2, v3, v4, v5, v6);
}

- (void)pluginPropertiesChanged:message:.cold.1()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s xpc_dictionary_get_value failed", v2, v3, v4, v5, v6);
}

- (void)pluginPropertiesChanged:message:.cold.2()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s copyPropertyStatesFromXPCDictionary failed", v2, v3, v4, v5, v6);
}

- (void)devicePropertiesChanged:message:.cold.1()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s cmio_XPCMessageCopyCFString faileddeviceID == NULL == true ", v2, v3, v4, v5, v6);
}

- (void)devicePropertiesChanged:message:.cold.2()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s xpc_dictionary_get_value failed", v2, v3, v4, v5, v6);
}

- (void)devicePropertiesChanged:message:.cold.3()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s copyPropertyStatesFromXPCDictionary failed", v2, v3, v4, v5, v6);
}

- (void)streamPropertiesChanged:message:.cold.1()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s cmio_XPCMessageCopyCFString failedstreamID == NULL == true ", v2, v3, v4, v5, v6);
}

- (void)streamPropertiesChanged:message:.cold.2()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s xpc_dictionary_get_value failed", v2, v3, v4, v5, v6);
}

- (void)streamPropertiesChanged:message:.cold.3()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s copyPropertyStatesFromXPCDictionary failed", v2, v3, v4, v5, v6);
}

- (void)receivedSample:message:.cold.1()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s cmio_XPCMessageCopyCFString failedstreamID == NULL == true ", v2, v3, v4, v5, v6);
}

- (void)receivedSample:message:.cold.2()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s xpc_dictionary_get_value failed", v2, v3, v4, v5, v6);
}

- (void)receivedSample:message:.cold.3()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s CMIOExtensionSample creation failed", v2, v3, v4, v5, v6);
}

- (void)pullSample:message:.cold.1()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s cmio_XPCMessageCopyCFString failedstreamID == NULL == true ", v2, v3, v4, v5, v6);
}

- (void)pullSample:message:.cold.2()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s xpc_dictionary_create_reply failedreply == NULL == true ", v2, v3, v4, v5, v6);
}

void __55__CMIOExtensionProviderHostContext_pullSample_message___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s pullSample failed %{public}@", v2, v3, v4, v5, v6);
}

void __55__CMIOExtensionProviderHostContext_pullSample_message___block_invoke_cold_2()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s copyXPCDictionary failed", v2, v3, v4, v5, v6);
}

- (void)scheduledOutputChanged:message:.cold.1()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s cmio_XPCMessageCopyCFString failedstreamID == NULL == true ", v2, v3, v4, v5, v6);
}

- (void)scheduledOutputChanged:message:.cold.2()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s xpc_dictionary_get_value failed", v2, v3, v4, v5, v6);
}

- (void)scheduledOutputChanged:message:.cold.3()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s CMIOExtensionScheduledOutput creation failed", v2, v3, v4, v5, v6);
}

void __62__CMIOExtensionProviderHostContext_availablePluginProperties___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_14();
  uint64_t v3 = OUTLINED_FUNCTION_3(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  *(void *)(v6 + 20) = "-[CMIOExtensionProviderHostContext availablePluginProperties:]_block_invoke";
  OUTLINED_FUNCTION_9_1(v7, v8, v6);
  OUTLINED_FUNCTION_8(&dword_2432B6000, "%s:%d:%s exception %@", v9, v10);
}

void __62__CMIOExtensionProviderHostContext_availablePluginProperties___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_14();
  uint64_t v3 = OUTLINED_FUNCTION_3(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_5_0(v6, v7, v8);
  OUTLINED_FUNCTION_8(&dword_2432B6000, "%s:%d:%s received %{public}@", v9, v10);
}

void __62__CMIOExtensionProviderHostContext_availablePluginProperties___block_invoke_cold_3(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_11_0(a1, a2, 4.8152e-34);
  OUTLINED_FUNCTION_13_0(v2, 402);
  *(void *)(v3 + 20) = "-[CMIOExtensionProviderHostContext availablePluginProperties:]_block_invoke";
  OUTLINED_FUNCTION_12_0(&dword_2432B6000, v4, (uint64_t)v4, "%s:%d:%s cmio_XPCMessageCopyCFArray failed", v5);
}

void __62__CMIOExtensionProviderHostContext_availablePluginProperties___block_invoke_cold_4()
{
  OUTLINED_FUNCTION_14();
  uint64_t v3 = OUTLINED_FUNCTION_3(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_5_0(v6, v7, v8);
  OUTLINED_FUNCTION_8(&dword_2432B6000, "%s:%d:%s unknown type %{public}@", v9, v10);
}

- (void)pluginStates:.cold.1()
{
  OUTLINED_FUNCTION_14();
  uint64_t v3 = OUTLINED_FUNCTION_3(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  *(void *)(v6 + 20) = "-[CMIOExtensionProviderHostContext pluginStates:]";
  OUTLINED_FUNCTION_9_1(v7, v8, v6);
  OUTLINED_FUNCTION_8(&dword_2432B6000, "%s:%d:%s exception %@", v9, v10);
}

- (void)pluginStates:.cold.2()
{
  OUTLINED_FUNCTION_14();
  uint64_t v3 = OUTLINED_FUNCTION_3(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_5_0(v6, v7, v8);
  OUTLINED_FUNCTION_8(&dword_2432B6000, "%s:%d:%s received %{public}@", v9, v10);
}

- (void)pluginStates:(uint64_t)a1 .cold.3(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_11_0(a1, a2, 4.8152e-34);
  OUTLINED_FUNCTION_13_0(v2, 451);
  *(void *)(v3 + 20) = "-[CMIOExtensionProviderHostContext pluginStates:]";
  OUTLINED_FUNCTION_12_0(&dword_2432B6000, v4, (uint64_t)v4, "%s:%d:%s xpc_dictionary_get_value for param1 failed", v5);
}

- (void)pluginStates:(uint64_t)a1 .cold.4(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_11_0(a1, a2, 4.8152e-34);
  OUTLINED_FUNCTION_13_0(v2, 455);
  *(void *)(v3 + 20) = "-[CMIOExtensionProviderHostContext pluginStates:]";
  OUTLINED_FUNCTION_12_0(&dword_2432B6000, v4, (uint64_t)v4, "%s:%d:%s copyPropertyStatesFromXPCDictionary failed", v5);
}

- (void)pluginStates:.cold.5()
{
  OUTLINED_FUNCTION_14();
  uint64_t v3 = OUTLINED_FUNCTION_3(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_5_0(v6, v7, v8);
  OUTLINED_FUNCTION_8(&dword_2432B6000, "%s:%d:%s unknown type %{public}@", v9, v10);
}

void __49__CMIOExtensionProviderHostContext_pluginStates___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_18_0();
  OUTLINED_FUNCTION_8_0(&dword_2432B6000, v0, v1, "%s:%d:%s copyPropertyStatesFromXPCDictionary failed at index %d", v2, v3, v4, v5, v6);
}

void __49__CMIOExtensionProviderHostContext_pluginStates___block_invoke_26_cold_1()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_18_0();
  OUTLINED_FUNCTION_8_0(&dword_2432B6000, v0, v1, "%s:%d:%s copyPropertyStatesFromXPCDictionary failed at index %d", v2, v3, v4, v5, v6);
}

void __49__CMIOExtensionProviderHostContext_pluginStates___block_invoke_27_cold_1()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s Error received %@", v2, v3, v4, v5, v6);
}

void __49__CMIOExtensionProviderHostContext_pluginStates___block_invoke_27_cold_2()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8_0(&dword_2432B6000, v0, v1, "%s:%d:%s Error received %d", v2, v3, v4, v5, v6);
}

- (void)pluginPropertyStatesForProperties:reply:.cold.1()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s Error: %ld, cmio_XPCMessageSetCFArray failed", v2, v3, v4, v5, v6);
}

void __76__CMIOExtensionProviderHostContext_pluginPropertyStatesForProperties_reply___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_14();
  uint64_t v3 = OUTLINED_FUNCTION_3(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  *(void *)(v6 + 20) = "-[CMIOExtensionProviderHostContext pluginPropertyStatesForProperties:reply:]_block_invoke";
  OUTLINED_FUNCTION_9_1(v7, v8, v6);
  OUTLINED_FUNCTION_8(&dword_2432B6000, "%s:%d:%s exception %@", v9, v10);
}

void __76__CMIOExtensionProviderHostContext_pluginPropertyStatesForProperties_reply___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_14();
  uint64_t v3 = OUTLINED_FUNCTION_3(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_5_0(v6, v7, v8);
  OUTLINED_FUNCTION_8(&dword_2432B6000, "%s:%d:%s received %{public}@", v9, v10);
}

void __76__CMIOExtensionProviderHostContext_pluginPropertyStatesForProperties_reply___block_invoke_cold_3(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_11_0(a1, a2, 4.8152e-34);
  OUTLINED_FUNCTION_13_0(v2, 567);
  *(void *)(v3 + 20) = "-[CMIOExtensionProviderHostContext pluginPropertyStatesForProperties:reply:]_block_invoke";
  OUTLINED_FUNCTION_12_0(&dword_2432B6000, v4, (uint64_t)v4, "%s:%d:%s xpc_dictionary_get_value for param1 failed", v5);
}

void __76__CMIOExtensionProviderHostContext_pluginPropertyStatesForProperties_reply___block_invoke_cold_4(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_11_0(a1, a2, 4.8152e-34);
  OUTLINED_FUNCTION_13_0(v2, 571);
  *(void *)(v3 + 20) = "-[CMIOExtensionProviderHostContext pluginPropertyStatesForProperties:reply:]_block_invoke";
  OUTLINED_FUNCTION_12_0(&dword_2432B6000, v4, (uint64_t)v4, "%s:%d:%s copyPropertyStatesFromXPCDictionary failed", v5);
}

void __76__CMIOExtensionProviderHostContext_pluginPropertyStatesForProperties_reply___block_invoke_cold_5()
{
  OUTLINED_FUNCTION_14();
  uint64_t v3 = OUTLINED_FUNCTION_3(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_5_0(v6, v7, v8);
  OUTLINED_FUNCTION_8(&dword_2432B6000, "%s:%d:%s unknown type %{public}@", v9, v10);
}

- (void)setPluginPropertyValues:reply:.cold.1()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s Setting an empty dictionary is invalid.", v2, v3, v4, v5, v6);
}

- (void)setPluginPropertyValues:reply:.cold.2()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s copyXPCDictionaryFromPropertyValues failed", v2, v3, v4, v5, v6);
}

void __66__CMIOExtensionProviderHostContext_setPluginPropertyValues_reply___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_14();
  uint64_t v3 = OUTLINED_FUNCTION_3(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  *(void *)(v6 + 20) = "-[CMIOExtensionProviderHostContext setPluginPropertyValues:reply:]_block_invoke";
  OUTLINED_FUNCTION_9_1(v7, v8, v6);
  OUTLINED_FUNCTION_8(&dword_2432B6000, "%s:%d:%s exception %@", v9, v10);
}

void __66__CMIOExtensionProviderHostContext_setPluginPropertyValues_reply___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_14();
  uint64_t v3 = OUTLINED_FUNCTION_3(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_5_0(v6, v7, v8);
  OUTLINED_FUNCTION_8(&dword_2432B6000, "%s:%d:%s received %{public}@", v9, v10);
}

void __66__CMIOExtensionProviderHostContext_setPluginPropertyValues_reply___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_14();
  uint64_t v3 = OUTLINED_FUNCTION_3(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_5_0(v6, v7, v8);
  OUTLINED_FUNCTION_8(&dword_2432B6000, "%s:%d:%s unknown type %{public}@", v9, v10);
}

- (void)availableDevicePropertiesWithDeviceID:reply:.cold.1()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s Error: %ld, cmio_XPCMessageSetCFString failed", v2, v3, v4, v5, v6);
}

void __80__CMIOExtensionProviderHostContext_availableDevicePropertiesWithDeviceID_reply___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_14();
  uint64_t v3 = OUTLINED_FUNCTION_3(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  *(void *)(v6 + 20) = "-[CMIOExtensionProviderHostContext availableDevicePropertiesWithDeviceID:reply:]_block_invoke";
  OUTLINED_FUNCTION_9_1(v7, v8, v6);
  OUTLINED_FUNCTION_8(&dword_2432B6000, "%s:%d:%s exception %@", v9, v10);
}

void __80__CMIOExtensionProviderHostContext_availableDevicePropertiesWithDeviceID_reply___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_14();
  uint64_t v3 = OUTLINED_FUNCTION_3(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_5_0(v6, v7, v8);
  OUTLINED_FUNCTION_8(&dword_2432B6000, "%s:%d:%s received %{public}@", v9, v10);
}

void __80__CMIOExtensionProviderHostContext_availableDevicePropertiesWithDeviceID_reply___block_invoke_cold_3(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_11_0(a1, a2, 4.8152e-34);
  OUTLINED_FUNCTION_13_0(v2, 697);
  *(void *)(v3 + 20) = "-[CMIOExtensionProviderHostContext availableDevicePropertiesWithDeviceID:reply:]_block_invoke";
  OUTLINED_FUNCTION_12_0(&dword_2432B6000, v4, (uint64_t)v4, "%s:%d:%s cmio_XPCMessageCopyCFArray failed", v5);
}

void __80__CMIOExtensionProviderHostContext_availableDevicePropertiesWithDeviceID_reply___block_invoke_cold_4()
{
  OUTLINED_FUNCTION_14();
  uint64_t v3 = OUTLINED_FUNCTION_3(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_5_0(v6, v7, v8);
  OUTLINED_FUNCTION_8(&dword_2432B6000, "%s:%d:%s unknown type %{public}@", v9, v10);
}

- (void)deviceStatesWithDeviceID:reply:.cold.1()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s Error: %ld, cmio_XPCMessageSetCFString failed", v2, v3, v4, v5, v6);
}

void __67__CMIOExtensionProviderHostContext_deviceStatesWithDeviceID_reply___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_14();
  uint64_t v3 = OUTLINED_FUNCTION_3(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  *(void *)(v6 + 20) = "-[CMIOExtensionProviderHostContext deviceStatesWithDeviceID:reply:]_block_invoke";
  OUTLINED_FUNCTION_9_1(v7, v8, v6);
  OUTLINED_FUNCTION_8(&dword_2432B6000, "%s:%d:%s exception %@", v9, v10);
}

void __67__CMIOExtensionProviderHostContext_deviceStatesWithDeviceID_reply___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_14();
  uint64_t v3 = OUTLINED_FUNCTION_3(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_5_0(v6, v7, v8);
  OUTLINED_FUNCTION_8(&dword_2432B6000, "%s:%d:%s received %{public}@", v9, v10);
}

void __67__CMIOExtensionProviderHostContext_deviceStatesWithDeviceID_reply___block_invoke_cold_3(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_11_0(a1, a2, 4.8152e-34);
  OUTLINED_FUNCTION_13_0(v2, 755);
  *(void *)(v3 + 20) = "-[CMIOExtensionProviderHostContext deviceStatesWithDeviceID:reply:]_block_invoke";
  OUTLINED_FUNCTION_12_0(&dword_2432B6000, v4, (uint64_t)v4, "%s:%d:%s xpc_dictionary_get_value for param1 failed", v5);
}

void __67__CMIOExtensionProviderHostContext_deviceStatesWithDeviceID_reply___block_invoke_cold_4(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_11_0(a1, a2, 4.8152e-34);
  OUTLINED_FUNCTION_13_0(v2, 759);
  *(void *)(v3 + 20) = "-[CMIOExtensionProviderHostContext deviceStatesWithDeviceID:reply:]_block_invoke";
  OUTLINED_FUNCTION_12_0(&dword_2432B6000, v4, (uint64_t)v4, "%s:%d:%s copyPropertyStatesFromXPCDictionary failed", v5);
}

void __67__CMIOExtensionProviderHostContext_deviceStatesWithDeviceID_reply___block_invoke_cold_5()
{
  OUTLINED_FUNCTION_14();
  uint64_t v3 = OUTLINED_FUNCTION_3(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_5_0(v6, v7, v8);
  OUTLINED_FUNCTION_8(&dword_2432B6000, "%s:%d:%s unknown type %{public}@", v9, v10);
}

void __67__CMIOExtensionProviderHostContext_deviceStatesWithDeviceID_reply___block_invoke_28_cold_1()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_18_0();
  OUTLINED_FUNCTION_8_0(&dword_2432B6000, v0, v1, "%s:%d:%s copyPropertyStatesFromXPCDictionary failed at index %d", v2, v3, v4, v5, v6);
}

- (void)devicePropertyStatesWithDeviceID:properties:reply:.cold.1()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s Error: %ld, cmio_XPCMessageSetCFArray failed", v2, v3, v4, v5, v6);
}

- (void)devicePropertyStatesWithDeviceID:properties:reply:.cold.2()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s Error: %ld, cmio_XPCMessageSetCFString failed", v2, v3, v4, v5, v6);
}

void __86__CMIOExtensionProviderHostContext_devicePropertyStatesWithDeviceID_properties_reply___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_14();
  uint64_t v3 = OUTLINED_FUNCTION_3(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  *(void *)(v6 + 20) = "-[CMIOExtensionProviderHostContext devicePropertyStatesWithDeviceID:properties:reply:]_block_invoke";
  OUTLINED_FUNCTION_9_1(v7, v8, v6);
  OUTLINED_FUNCTION_8(&dword_2432B6000, "%s:%d:%s exception %@", v9, v10);
}

void __86__CMIOExtensionProviderHostContext_devicePropertyStatesWithDeviceID_properties_reply___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_14();
  uint64_t v3 = OUTLINED_FUNCTION_3(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_5_0(v6, v7, v8);
  OUTLINED_FUNCTION_8(&dword_2432B6000, "%s:%d:%s received %{public}@", v9, v10);
}

void __86__CMIOExtensionProviderHostContext_devicePropertyStatesWithDeviceID_properties_reply___block_invoke_cold_3(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_11_0(a1, a2, 4.8152e-34);
  OUTLINED_FUNCTION_13_0(v2, 847);
  *(void *)(v3 + 20) = "-[CMIOExtensionProviderHostContext devicePropertyStatesWithDeviceID:properties:reply:]_block_invoke";
  OUTLINED_FUNCTION_12_0(&dword_2432B6000, v4, (uint64_t)v4, "%s:%d:%s xpc_dictionary_get_value for param1 failed", v5);
}

void __86__CMIOExtensionProviderHostContext_devicePropertyStatesWithDeviceID_properties_reply___block_invoke_cold_4(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_11_0(a1, a2, 4.8152e-34);
  OUTLINED_FUNCTION_13_0(v2, 851);
  *(void *)(v3 + 20) = "-[CMIOExtensionProviderHostContext devicePropertyStatesWithDeviceID:properties:reply:]_block_invoke";
  OUTLINED_FUNCTION_12_0(&dword_2432B6000, v4, (uint64_t)v4, "%s:%d:%s copyPropertyStatesFromXPCDictionary failed", v5);
}

void __86__CMIOExtensionProviderHostContext_devicePropertyStatesWithDeviceID_properties_reply___block_invoke_cold_5()
{
  OUTLINED_FUNCTION_14();
  uint64_t v3 = OUTLINED_FUNCTION_3(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_5_0(v6, v7, v8);
  OUTLINED_FUNCTION_8(&dword_2432B6000, "%s:%d:%s unknown type %{public}@", v9, v10);
}

- (void)setDevicePropertyValuesWithDeviceID:propertyValues:reply:.cold.1()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s Setting an empty dictionary is invalid.", v2, v3, v4, v5, v6);
}

- (void)setDevicePropertyValuesWithDeviceID:propertyValues:reply:.cold.2()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s copyXPCDictionaryFromPropertyValues failed", v2, v3, v4, v5, v6);
}

- (void)setDevicePropertyValuesWithDeviceID:propertyValues:reply:.cold.3()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s Error: %ld, cmio_XPCMessageSetCFString failed", v2, v3, v4, v5, v6);
}

void __93__CMIOExtensionProviderHostContext_setDevicePropertyValuesWithDeviceID_propertyValues_reply___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_14();
  uint64_t v3 = OUTLINED_FUNCTION_3(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  *(void *)(v6 + 20) = "-[CMIOExtensionProviderHostContext setDevicePropertyValuesWithDeviceID:propertyValues:reply:]_block_invoke";
  OUTLINED_FUNCTION_9_1(v7, v8, v6);
  OUTLINED_FUNCTION_8(&dword_2432B6000, "%s:%d:%s exception %@", v9, v10);
}

void __93__CMIOExtensionProviderHostContext_setDevicePropertyValuesWithDeviceID_propertyValues_reply___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_14();
  uint64_t v3 = OUTLINED_FUNCTION_3(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_5_0(v6, v7, v8);
  OUTLINED_FUNCTION_8(&dword_2432B6000, "%s:%d:%s received %{public}@", v9, v10);
}

void __93__CMIOExtensionProviderHostContext_setDevicePropertyValuesWithDeviceID_propertyValues_reply___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_14();
  uint64_t v3 = OUTLINED_FUNCTION_3(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_5_0(v6, v7, v8);
  OUTLINED_FUNCTION_8(&dword_2432B6000, "%s:%d:%s unknown type %{public}@", v9, v10);
}

- (void)availableStreamPropertiesWithStreamID:reply:.cold.1()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s Error: %ld, cmio_XPCMessageSetCFString failed", v2, v3, v4, v5, v6);
}

void __80__CMIOExtensionProviderHostContext_availableStreamPropertiesWithStreamID_reply___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_14();
  uint64_t v3 = OUTLINED_FUNCTION_3(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  *(void *)(v6 + 20) = "-[CMIOExtensionProviderHostContext availableStreamPropertiesWithStreamID:reply:]_block_invoke";
  OUTLINED_FUNCTION_9_1(v7, v8, v6);
  OUTLINED_FUNCTION_8(&dword_2432B6000, "%s:%d:%s exception %@", v9, v10);
}

void __80__CMIOExtensionProviderHostContext_availableStreamPropertiesWithStreamID_reply___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_14();
  uint64_t v3 = OUTLINED_FUNCTION_3(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_5_0(v6, v7, v8);
  OUTLINED_FUNCTION_8(&dword_2432B6000, "%s:%d:%s received %{public}@", v9, v10);
}

void __80__CMIOExtensionProviderHostContext_availableStreamPropertiesWithStreamID_reply___block_invoke_cold_3(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_11_0(a1, a2, 4.8152e-34);
  OUTLINED_FUNCTION_13_0(v2, 988);
  *(void *)(v3 + 20) = "-[CMIOExtensionProviderHostContext availableStreamPropertiesWithStreamID:reply:]_block_invoke";
  OUTLINED_FUNCTION_12_0(&dword_2432B6000, v4, (uint64_t)v4, "%s:%d:%s cmio_XPCMessageCopyCFArray failed", v5);
}

void __80__CMIOExtensionProviderHostContext_availableStreamPropertiesWithStreamID_reply___block_invoke_cold_4()
{
  OUTLINED_FUNCTION_14();
  uint64_t v3 = OUTLINED_FUNCTION_3(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_5_0(v6, v7, v8);
  OUTLINED_FUNCTION_8(&dword_2432B6000, "%s:%d:%s unknown type %{public}@", v9, v10);
}

- (void)streamPropertyStatesWithStreamID:properties:reply:.cold.1()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s Error: %ld, cmio_XPCMessageSetCFArray failed", v2, v3, v4, v5, v6);
}

- (void)streamPropertyStatesWithStreamID:properties:reply:.cold.2()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s Error: %ld, cmio_XPCMessageSetCFString failed", v2, v3, v4, v5, v6);
}

void __86__CMIOExtensionProviderHostContext_streamPropertyStatesWithStreamID_properties_reply___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_14();
  uint64_t v3 = OUTLINED_FUNCTION_3(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  *(void *)(v6 + 20) = "-[CMIOExtensionProviderHostContext streamPropertyStatesWithStreamID:properties:reply:]_block_invoke";
  OUTLINED_FUNCTION_9_1(v7, v8, v6);
  OUTLINED_FUNCTION_8(&dword_2432B6000, "%s:%d:%s exception %@", v9, v10);
}

void __86__CMIOExtensionProviderHostContext_streamPropertyStatesWithStreamID_properties_reply___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_14();
  uint64_t v3 = OUTLINED_FUNCTION_3(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_5_0(v6, v7, v8);
  OUTLINED_FUNCTION_8(&dword_2432B6000, "%s:%d:%s received %{public}@", v9, v10);
}

void __86__CMIOExtensionProviderHostContext_streamPropertyStatesWithStreamID_properties_reply___block_invoke_cold_3(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_11_0(a1, a2, 4.8152e-34);
  OUTLINED_FUNCTION_13_0(v2, 1052);
  *(void *)(v3 + 20) = "-[CMIOExtensionProviderHostContext streamPropertyStatesWithStreamID:properties:reply:]_block_invoke";
  OUTLINED_FUNCTION_12_0(&dword_2432B6000, v4, (uint64_t)v4, "%s:%d:%s xpc_dictionary_get_value for param1 failed", v5);
}

void __86__CMIOExtensionProviderHostContext_streamPropertyStatesWithStreamID_properties_reply___block_invoke_cold_4(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_11_0(a1, a2, 4.8152e-34);
  OUTLINED_FUNCTION_13_0(v2, 1056);
  *(void *)(v3 + 20) = "-[CMIOExtensionProviderHostContext streamPropertyStatesWithStreamID:properties:reply:]_block_invoke";
  OUTLINED_FUNCTION_12_0(&dword_2432B6000, v4, (uint64_t)v4, "%s:%d:%s copyPropertyStatesFromXPCDictionary failed", v5);
}

void __86__CMIOExtensionProviderHostContext_streamPropertyStatesWithStreamID_properties_reply___block_invoke_cold_5()
{
  OUTLINED_FUNCTION_14();
  uint64_t v3 = OUTLINED_FUNCTION_3(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_5_0(v6, v7, v8);
  OUTLINED_FUNCTION_8(&dword_2432B6000, "%s:%d:%s unknown type %{public}@", v9, v10);
}

- (void)setStreamPropertyValuesWithStreamID:propertyValues:reply:.cold.1()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s Setting an empty dictionary is invalid.", v2, v3, v4, v5, v6);
}

- (void)setStreamPropertyValuesWithStreamID:propertyValues:reply:.cold.2()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s copyXPCDictionaryFromPropertyValues failed", v2, v3, v4, v5, v6);
}

- (void)setStreamPropertyValuesWithStreamID:propertyValues:reply:.cold.3()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s Error: %ld, cmio_XPCMessageSetCFString failed", v2, v3, v4, v5, v6);
}

void __93__CMIOExtensionProviderHostContext_setStreamPropertyValuesWithStreamID_propertyValues_reply___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_14();
  uint64_t v3 = OUTLINED_FUNCTION_3(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  *(void *)(v6 + 20) = "-[CMIOExtensionProviderHostContext setStreamPropertyValuesWithStreamID:propertyValues:reply:]_block_invoke";
  OUTLINED_FUNCTION_9_1(v7, v8, v6);
  OUTLINED_FUNCTION_8(&dword_2432B6000, "%s:%d:%s exception %@", v9, v10);
}

void __93__CMIOExtensionProviderHostContext_setStreamPropertyValuesWithStreamID_propertyValues_reply___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_14();
  uint64_t v3 = OUTLINED_FUNCTION_3(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_5_0(v6, v7, v8);
  OUTLINED_FUNCTION_8(&dword_2432B6000, "%s:%d:%s received %{public}@", v9, v10);
}

void __93__CMIOExtensionProviderHostContext_setStreamPropertyValuesWithStreamID_propertyValues_reply___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_14();
  uint64_t v3 = OUTLINED_FUNCTION_3(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_5_0(v6, v7, v8);
  OUTLINED_FUNCTION_8(&dword_2432B6000, "%s:%d:%s unknown type %{public}@", v9, v10);
}

- (void)startStreamWithStreamID:reply:.cold.1()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s Error: %ld, cmio_XPCMessageSetCFString failed", v2, v3, v4, v5, v6);
}

void __66__CMIOExtensionProviderHostContext_startStreamWithStreamID_reply___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_14();
  uint64_t v3 = OUTLINED_FUNCTION_3(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  *(void *)(v6 + 20) = "-[CMIOExtensionProviderHostContext startStreamWithStreamID:reply:]_block_invoke";
  OUTLINED_FUNCTION_9_1(v7, v8, v6);
  OUTLINED_FUNCTION_8(&dword_2432B6000, "%s:%d:%s exception %@", v9, v10);
}

void __66__CMIOExtensionProviderHostContext_startStreamWithStreamID_reply___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_14();
  uint64_t v3 = OUTLINED_FUNCTION_3(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_5_0(v6, v7, v8);
  OUTLINED_FUNCTION_8(&dword_2432B6000, "%s:%d:%s received %{public}@", v9, v10);
}

void __66__CMIOExtensionProviderHostContext_startStreamWithStreamID_reply___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_14();
  uint64_t v3 = OUTLINED_FUNCTION_3(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_5_0(v6, v7, v8);
  OUTLINED_FUNCTION_8(&dword_2432B6000, "%s:%d:%s unknown type %{public}@", v9, v10);
}

- (void)stopStreamWithStreamID:reply:.cold.1()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s Error: %ld, cmio_XPCMessageSetCFString failed", v2, v3, v4, v5, v6);
}

void __65__CMIOExtensionProviderHostContext_stopStreamWithStreamID_reply___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_14();
  uint64_t v3 = OUTLINED_FUNCTION_3(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  *(void *)(v6 + 20) = "-[CMIOExtensionProviderHostContext stopStreamWithStreamID:reply:]_block_invoke";
  OUTLINED_FUNCTION_9_1(v7, v8, v6);
  OUTLINED_FUNCTION_8(&dword_2432B6000, "%s:%d:%s exception %@", v9, v10);
}

void __65__CMIOExtensionProviderHostContext_stopStreamWithStreamID_reply___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_14();
  uint64_t v3 = OUTLINED_FUNCTION_3(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_5_0(v6, v7, v8);
  OUTLINED_FUNCTION_8(&dword_2432B6000, "%s:%d:%s received %{public}@", v9, v10);
}

void __65__CMIOExtensionProviderHostContext_stopStreamWithStreamID_reply___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_14();
  uint64_t v3 = OUTLINED_FUNCTION_3(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_5_0(v6, v7, v8);
  OUTLINED_FUNCTION_8(&dword_2432B6000, "%s:%d:%s unknown type %{public}@", v9, v10);
}

void __55__CMIOExtensionProviderHostContext_sendEmptyClientInfo__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s received %{public}@", v2, v3, v4, v5, v6);
}

void __55__CMIOExtensionProviderHostContext_sendEmptyClientInfo__block_invoke_cold_2()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8_0(&dword_2432B6000, v0, v1, "%s:%d:%s error %d", v2, v3, v4, v5, v6);
}

void __55__CMIOExtensionProviderHostContext_sendEmptyClientInfo__block_invoke_cold_3()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s unknown type %{public}@", v2, v3, v4, v5, v6);
}

- (void)captureAsyncStillImageWithStreamID:uniqueID:options:reply:.cold.1()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s Error: %ld, cmio_XPCMessageSetCFDictionary failed", v2, v3, v4, v5, v6);
}

- (void)captureAsyncStillImageWithStreamID:uniqueID:options:reply:.cold.2()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s Error: %ld, cmio_XPCMessageSetCFString failed", v2, v3, v4, v5, v6);
}

- (void)captureAsyncStillImageWithStreamID:uniqueID:options:reply:.cold.3()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s Error: %ld, cmio_XPCMessageSetCFString failed", v2, v3, v4, v5, v6);
}

void __94__CMIOExtensionProviderHostContext_captureAsyncStillImageWithStreamID_uniqueID_options_reply___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_14();
  uint64_t v3 = OUTLINED_FUNCTION_3(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  *(void *)(v6 + 20) = "-[CMIOExtensionProviderHostContext captureAsyncStillImageWithStreamID:uniqueID:options:reply:]_block_invoke";
  OUTLINED_FUNCTION_9_1(v7, v8, v6);
  OUTLINED_FUNCTION_8(&dword_2432B6000, "%s:%d:%s exception %@", v9, v10);
}

void __94__CMIOExtensionProviderHostContext_captureAsyncStillImageWithStreamID_uniqueID_options_reply___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_14();
  uint64_t v3 = OUTLINED_FUNCTION_3(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_5_0(v6, v7, v8);
  OUTLINED_FUNCTION_8(&dword_2432B6000, "%s:%d:%s received %{public}@", v9, v10);
}

void __94__CMIOExtensionProviderHostContext_captureAsyncStillImageWithStreamID_uniqueID_options_reply___block_invoke_cold_3(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_11_0(a1, a2, 4.8152e-34);
  OUTLINED_FUNCTION_13_0(v2, 1365);
  *(void *)(v3 + 20) = "-[CMIOExtensionProviderHostContext captureAsyncStillImageWithStreamID:uniqueID:options:reply:]_block_invoke";
  OUTLINED_FUNCTION_12_0(&dword_2432B6000, v4, (uint64_t)v4, "%s:%d:%s Create still sample buffer from serialized block buffer failed", v5);
}

void __94__CMIOExtensionProviderHostContext_captureAsyncStillImageWithStreamID_uniqueID_options_reply___block_invoke_cold_4()
{
  OUTLINED_FUNCTION_14();
  uint64_t v3 = OUTLINED_FUNCTION_3(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_5_0(v6, v7, v8);
  OUTLINED_FUNCTION_8(&dword_2432B6000, "%s:%d:%s unknown type %{public}@", v9, v10);
}

- (void)enqueueReactionEffect:reactionType:reply:.cold.1()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s Error: %ld, cmio_XPCMessageSetCFString failed", v2, v3, v4, v5, v6);
}

- (void)enqueueReactionEffect:reactionType:reply:.cold.2()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s Error: %ld, cmio_XPCMessageSetCFString failed", v2, v3, v4, v5, v6);
}

void __77__CMIOExtensionProviderHostContext_enqueueReactionEffect_reactionType_reply___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_14();
  uint64_t v3 = OUTLINED_FUNCTION_3(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  *(void *)(v6 + 20) = "-[CMIOExtensionProviderHostContext enqueueReactionEffect:reactionType:reply:]_block_invoke";
  OUTLINED_FUNCTION_9_1(v7, v8, v6);
  OUTLINED_FUNCTION_8(&dword_2432B6000, "%s:%d:%s exception %@", v9, v10);
}

void __77__CMIOExtensionProviderHostContext_enqueueReactionEffect_reactionType_reply___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_14();
  uint64_t v3 = OUTLINED_FUNCTION_3(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_5_0(v6, v7, v8);
  OUTLINED_FUNCTION_8(&dword_2432B6000, "%s:%d:%s received %{public}@", v9, v10);
}

void __77__CMIOExtensionProviderHostContext_enqueueReactionEffect_reactionType_reply___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_14();
  uint64_t v3 = OUTLINED_FUNCTION_3(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_5_0(v6, v7, v8);
  OUTLINED_FUNCTION_8(&dword_2432B6000, "%s:%d:%s unknown type %{public}@", v9, v10);
}

@end