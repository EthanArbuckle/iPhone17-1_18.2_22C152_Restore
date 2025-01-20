@interface CMIOExtensionProviderContext
- (BOOL)isClientSourcedByNonStreamingProxyFrontedExtension;
- (BOOL)isInvalidated;
- (CMIOExtensionClient)clientInfo;
- (CMIOExtensionProviderContext)initWithConnection:(id)a3;
- (NSString)description;
- (OS_xpc_object)connection;
- (id)redactedDescription;
- (void)availableDeviceProperties:(id)a3 message:(id)a4;
- (void)availableDevicesChanged:(id)a3;
- (void)availablePluginProperties:(id)a3 message:(id)a4;
- (void)availableStreamProperties:(id)a3 message:(id)a4;
- (void)availableStreamsChangedWithDeviceID:(id)a3 streamIDs:(id)a4;
- (void)captureAsyncStillImage:(id)a3 message:(id)a4;
- (void)dealloc;
- (void)devicePropertiesChangedWithDeviceID:(id)a3 propertyStates:(id)a4;
- (void)devicePropertyStates:(id)a3 message:(id)a4;
- (void)deviceStates:(id)a3 message:(id)a4;
- (void)enqueueReactionEffect:(id)a3 message:(id)a4;
- (void)handleClientMessageWithConnection:(id)a3 message:(id)a4;
- (void)invalidate;
- (void)pluginPropertiesChanged:(id)a3;
- (void)pluginPropertyStatesForProperties:(id)a3 message:(id)a4;
- (void)pluginStates:(id)a3 message:(id)a4;
- (void)pullSampleBufferForStreamID:(id)a3 replyq:(id)a4 reply:(id)a5;
- (void)receivedSampleWithStreamID:(id)a3 sample:(id)a4;
- (void)setClientInfo:(id)a3 message:(id)a4;
- (void)setClientSourcedByNonStreamingProxyFrontedExtension:(BOOL)a3;
- (void)setDevicePropertyValues:(id)a3 message:(id)a4;
- (void)setPluginPropertyValues:(id)a3 message:(id)a4;
- (void)setStreamPropertyValues:(id)a3 message:(id)a4;
- (void)startStream:(id)a3 message:(id)a4;
- (void)stopStream:(id)a3 message:(id)a4;
- (void)streamPropertiesChangedWithStreamID:(id)a3 propertyStates:(id)a4;
- (void)streamPropertyStates:(id)a3 message:(id)a4;
- (void)streamScheduledOutputChangedWithStreamID:(id)a3 scheduledOutput:(id)a4;
- (void)updateNonStreamingProxyFrontedExtensionPIDs:(id)a3 message:(id)a4;
@end

@implementation CMIOExtensionProviderContext

- (CMIOExtensionProviderContext)initWithConnection:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (a3)
  {
    v18.receiver = self;
    v18.super_class = (Class)CMIOExtensionProviderContext;
    v4 = [(CMIOExtensionProviderContext *)&v18 init];
    if (v4)
    {
      v4->_connection = (OS_xpc_object *)a3;
      v4->_transaction = (OS_os_transaction *)os_transaction_create();
      v4->_clientSourcedByNonStreamingProxyFrontedExtension = 0;
      objc_initWeak(&location, v4);
      handler[0] = MEMORY[0x263EF8330];
      handler[1] = 3221225472;
      handler[2] = __51__CMIOExtensionProviderContext_initWithConnection___block_invoke;
      handler[3] = &unk_26517C7C0;
      objc_copyWeak(&v16, &location);
      handler[4] = a3;
      xpc_connection_set_event_handler((xpc_connection_t)a3, handler);
      xpc_connection_activate((xpc_connection_t)a3);
      xpc_connection_get_audit_token();
      uint64_t pid = xpc_connection_get_pid((xpc_connection_t)a3);
      uint64_t v6 = [MEMORY[0x263F08C38] UUID];
      if ([+[CMIOExtensionProviderServer sharedServer] internalDaemon])
      {
        memset(buf, 0, 32);
        id v7 = +[CMIOExtensionProvider newActivityAttributionWithToken:buf];
        uint64_t v8 = 0;
      }
      else
      {
        id v7 = 0;
        uint64_t v8 = 3;
      }
      v9 = [CMIOExtensionClient alloc];
      memset(buf, 0, 32);
      v10 = [(CMIOExtensionClient *)v9 initWithPID:pid clientID:v6 auditToken:buf stAttribution:v7 isToProxy:0 isFromProxyExtensionManager:0];
      v4->_clientInfo = v10;
      [(CMIOExtensionClient *)v10 setMicrophoneAuthorizationStatus:v8];
      [(CMIOExtensionClient *)v4->_clientInfo setCameraAuthorizationStatus:v8];
      v4->_description = (NSString *)[[NSString alloc] initWithFormat:@"<CMIOExtensionProviderContext: %@>", v4->_clientInfo];
      v4->_redactedDescription = (NSString *)[[NSString alloc] initWithFormat:@"<CMIOExtensionProviderContext: ->"];
      v11 = CMIOLog();
      v12 = v11;
      if (v11 && os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v13 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
        *(_DWORD *)buf = 136315907;
        *(void *)&buf[4] = v13;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 125;
        *(_WORD *)&buf[18] = 2080;
        *(void *)&buf[20] = "-[CMIOExtensionProviderContext initWithConnection:]";
        *(_WORD *)&buf[28] = 2113;
        *(void *)&buf[30] = v4;
        _os_log_impl(&dword_2432B6000, v12, OS_LOG_TYPE_INFO, "%s:%d:%s %{private}@", buf, 0x26u);
      }
      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
    }
  }
  else
  {

    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"Invalid argument"];
    return 0;
  }
  return v4;
}

void __51__CMIOExtensionProviderContext_initWithConnection___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = MEMORY[0x245679950](a2);
  if (v5 == MEMORY[0x263EF8720])
  {
    uint64_t v6 = CMIOLog();
    if (v6)
    {
      id v7 = v6;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __51__CMIOExtensionProviderContext_initWithConnection___block_invoke_cold_1(a1, a2, v7);
      }
    }
    if (a2 == MEMORY[0x263EF86A0])
    {
      xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
    }
    else if (a2 == MEMORY[0x263EF86A8] && WeakRetained && !WeakRetained[40])
    {
      uint64_t v8 = CMIOLog();
      if (v8)
      {
        v9 = v8;
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          int v10 = 136315907;
          v11 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
          __int16 v12 = 1024;
          int v13 = 72;
          __int16 v14 = 2080;
          v15 = "-[CMIOExtensionProviderContext initWithConnection:]_block_invoke";
          __int16 v16 = 2113;
          v17 = WeakRetained;
          _os_log_impl(&dword_2432B6000, v9, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{private}@, connection is invalidated", (uint8_t *)&v10, 0x26u);
        }
      }
      objc_msgSend(+[CMIOExtensionProvider sharedProvider](CMIOExtensionProvider, "sharedProvider"), "removeProviderContext:", WeakRetained);
      [WeakRetained invalidate];
    }
  }
  else if (v5 == MEMORY[0x263EF8708])
  {
    [WeakRetained handleClientMessageWithConnection:*(void *)(a1 + 32) message:a2];
  }
}

- (void)dealloc
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v3 = CMIOLog();
  if (v3)
  {
    v4 = v3;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315907;
      uint64_t v8 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
      __int16 v9 = 1024;
      int v10 = 132;
      __int16 v11 = 2080;
      __int16 v12 = "-[CMIOExtensionProviderContext dealloc]";
      __int16 v13 = 2113;
      __int16 v14 = self;
      _os_log_impl(&dword_2432B6000, v4, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{private}@", buf, 0x26u);
    }
  }
  objc_msgSend(+[CMIOExtensionProvider sharedProvider](CMIOExtensionProvider, "sharedProvider"), "removeSystemStatusAttributionsForClient:stream:", self->_clientInfo, 0);

  voucher = self->_voucher;
  if (voucher) {

  }
  v6.receiver = self;
  v6.super_class = (Class)CMIOExtensionProviderContext;
  [(CMIOExtensionProviderContext *)&v6 dealloc];
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

- (void)invalidate
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v3 = CMIOLog();
  if (v3)
  {
    v4 = v3;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v6 = 136315907;
      id v7 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
      __int16 v8 = 1024;
      int v9 = 159;
      __int16 v10 = 2080;
      __int16 v11 = "-[CMIOExtensionProviderContext invalidate]";
      __int16 v12 = 2113;
      __int16 v13 = self;
      _os_log_impl(&dword_2432B6000, v4, OS_LOG_TYPE_INFO, "%s:%d:%s %{private}@", (uint8_t *)&v6, 0x26u);
    }
  }
  connection = self->_connection;
  if (connection) {
    xpc_connection_cancel(connection);
  }

  self->_transaction = 0;
  self->_invalidated = 1;
}

- (void)handleClientMessageWithConnection:(id)a3 message:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t uint64 = xpc_dictionary_get_uint64(a4, "MessageType");
  __int16 v8 = CMIOLog();
  if (v8)
  {
    int v9 = v8;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      __int16 v10 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
      pid_t pid = xpc_connection_get_pid((xpc_connection_t)a3);
      __int16 v12 = [(CMIOExtensionClient *)self->_clientInfo clientID];
      int v15 = 136316419;
      __int16 v16 = v10;
      __int16 v17 = 1024;
      int v18 = 174;
      __int16 v19 = 2080;
      uint64_t v20 = "-[CMIOExtensionProviderContext handleClientMessageWithConnection:message:]";
      __int16 v21 = 1025;
      pid_t v22 = pid;
      __int16 v23 = 2113;
      v24 = v12;
      __int16 v25 = 2048;
      uint64_t v26 = uint64;
      _os_log_impl(&dword_2432B6000, v9, OS_LOG_TYPE_INFO, "%s:%d:%s [%{private}d] CID %{private}@ %lld", (uint8_t *)&v15, 0x36u);
    }
  }
  switch(uint64)
  {
    case 1uLL:
      [(CMIOExtensionProviderContext *)self pluginStates:a3 message:a4];
      break;
    case 2uLL:
      [(CMIOExtensionProviderContext *)self availablePluginProperties:a3 message:a4];
      break;
    case 3uLL:
      [(CMIOExtensionProviderContext *)self pluginPropertyStatesForProperties:a3 message:a4];
      break;
    case 4uLL:
      [(CMIOExtensionProviderContext *)self setPluginPropertyValues:a3 message:a4];
      break;
    case 5uLL:
      [(CMIOExtensionProviderContext *)self setClientInfo:a3 message:a4];
      break;
    case 0xAuLL:
      [(CMIOExtensionProviderContext *)self deviceStates:a3 message:a4];
      break;
    case 0xBuLL:
      [(CMIOExtensionProviderContext *)self availableDeviceProperties:a3 message:a4];
      break;
    case 0xCuLL:
      [(CMIOExtensionProviderContext *)self devicePropertyStates:a3 message:a4];
      break;
    case 0xDuLL:
      [(CMIOExtensionProviderContext *)self setDevicePropertyValues:a3 message:a4];
      break;
    case 0x14uLL:
      [(CMIOExtensionProviderContext *)self availableStreamProperties:a3 message:a4];
      break;
    case 0x15uLL:
      [(CMIOExtensionProviderContext *)self streamPropertyStates:a3 message:a4];
      break;
    case 0x16uLL:
      [(CMIOExtensionProviderContext *)self setStreamPropertyValues:a3 message:a4];
      break;
    case 0x17uLL:
      if (!self->_transaction) {
        self->_transaction = (OS_os_transaction *)os_transaction_create();
      }
      [(CMIOExtensionProviderContext *)self startStream:a3 message:a4];
      break;
    case 0x18uLL:
      [(CMIOExtensionProviderContext *)self stopStream:a3 message:a4];

      self->_transaction = 0;
      break;
    case 0x19uLL:

      self->_transaction = 0;
      xpc_object_t reply = xpc_dictionary_create_reply(a4);
      xpc_dictionary_set_int64(reply, "errorReturn", 0);
      xpc_connection_send_message((xpc_connection_t)a3, reply);
      xpc_release(reply);
      break;
    case 0x1AuLL:
      [(CMIOExtensionProviderContext *)self captureAsyncStillImage:a3 message:a4];
      break;
    case 0x1BuLL:
      [(CMIOExtensionProviderContext *)self updateNonStreamingProxyFrontedExtensionPIDs:a3 message:a4];
      break;
    case 0x1CuLL:
      [(CMIOExtensionProviderContext *)self enqueueReactionEffect:a3 message:a4];
      break;
    default:
      __int16 v13 = CMIOLog();
      if (v13 && os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[CMIOExtensionProviderContext handleClientMessageWithConnection:message:]();
      }
      break;
  }
}

- (void)availablePluginProperties:(id)a3 message:(id)a4
{
  xpc_object_t reply = xpc_dictionary_create_reply(a4);
  if (reply)
  {
    id v7 = reply;
    xpc_retain(reply);
    id v8 = +[CMIOExtensionProvider sharedProvider];
    int v9 = [(CMIOExtensionClient *)self->_clientInfo clientID];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __66__CMIOExtensionProviderContext_availablePluginProperties_message___block_invoke;
    v11[3] = &unk_26517C9C8;
    v11[4] = v7;
    v11[5] = a3;
    [v8 availablePluginPropertiesForClientID:v9 reply:v11];
    xpc_release(v7);
  }
  else
  {
    __int16 v10 = CMIOLog();
    if (v10)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[CMIOExtensionProviderContext availablePluginProperties:message:]();
      }
    }
  }
}

void __66__CMIOExtensionProviderContext_availablePluginProperties_message___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = (const void *)[a2 allObjects];
  if (!a3 && v5)
  {
    if (!cmio_XPCMessageSetCFArray(*(void **)(a1 + 32), "param1", v5))
    {
LABEL_13:
      __int16 v10 = *(void **)(a1 + 32);
      int64_t v9 = 0;
      goto LABEL_14;
    }
    int v6 = CMIOLog();
    if (v6 && os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __66__CMIOExtensionProviderContext_availablePluginProperties_message___block_invoke_cold_2();
    }
    a3 = (void *)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-5 userInfo:0];
  }
  if (!a3) {
    goto LABEL_13;
  }
  id v7 = CMIOLog();
  if (v7 && os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    __66__CMIOExtensionProviderContext_availablePluginProperties_message___block_invoke_cold_1();
  }
  id v8 = *(void **)(a1 + 32);
  int64_t v9 = [a3 code];
  __int16 v10 = v8;
LABEL_14:
  xpc_dictionary_set_int64(v10, "errorReturn", v9);
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 32));
  xpc_release(*(xpc_object_t *)(a1 + 32));
}

- (void)pluginStates:(id)a3 message:(id)a4
{
  xpc_object_t reply = xpc_dictionary_create_reply(a4);
  if (reply)
  {
    id v7 = reply;
    xpc_retain(reply);
    id v8 = +[CMIOExtensionProvider sharedProvider];
    int64_t v9 = [(CMIOExtensionClient *)self->_clientInfo clientID];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __53__CMIOExtensionProviderContext_pluginStates_message___block_invoke;
    v11[3] = &unk_26517C9F0;
    v11[4] = v7;
    v11[5] = a3;
    [v8 pluginStatesForClientID:v9 reply:v11];
    xpc_release(v7);
  }
  else
  {
    __int16 v10 = CMIOLog();
    if (v10)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[CMIOExtensionProviderContext pluginStates:message:]();
      }
    }
  }
}

void __53__CMIOExtensionProviderContext_pluginStates_message___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  uint64_t v5 = a5;
  uint64_t v40 = *MEMORY[0x263EF8340];
  if (!a2 || a5) {
    goto LABEL_9;
  }
  id v9 = +[CMIOExtensionPropertyState copyXPCDictionaryFromPropertyStates:a2];
  if (!v9)
  {
    __int16 v11 = CMIOLog();
    if (v11 && os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __53__CMIOExtensionProviderContext_pluginStates_message___block_invoke_cold_4();
    }
    uint64_t v5 = (void *)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-5 userInfo:0];
LABEL_9:
    if (v5) {
      goto LABEL_40;
    }
    goto LABEL_10;
  }
  __int16 v10 = v9;
  xpc_dictionary_set_value(*(xpc_object_t *)(a1 + 32), "param1", v9);
  xpc_release(v10);
LABEL_10:
  if (![a3 count]) {
    goto LABEL_48;
  }
  xpc_object_t v12 = xpc_array_create(0, 0);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v5 = (void *)[a3 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v5)
  {
    uint64_t v13 = *(void *)v35;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v35 != v13) {
          objc_enumerationMutation(a3);
        }
        id v15 = +[CMIOExtensionPropertyState copyXPCDictionaryFromPropertyStates:*(void *)(*((void *)&v34 + 1) + 8 * i)];
        if (!v15)
        {
          __int16 v17 = CMIOLog();
          if (v17 && os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
            __53__CMIOExtensionProviderContext_pluginStates_message___block_invoke_cold_3();
          }
          uint64_t v5 = (void *)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-5 userInfo:0];
          goto LABEL_24;
        }
        __int16 v16 = v15;
        xpc_array_append_value(v12, v15);
        xpc_release(v16);
      }
      uint64_t v5 = (void *)[a3 countByEnumeratingWithState:&v34 objects:v39 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_24:
  xpc_dictionary_set_value(*(xpc_object_t *)(a1 + 32), "param2", v12);
  xpc_release(v12);
  if (!v5)
  {
LABEL_48:
    if (![a4 count]) {
      goto LABEL_44;
    }
    xpc_object_t v18 = xpc_array_create(0, 0);
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    uint64_t v19 = [a4 countByEnumeratingWithState:&v30 objects:v38 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v31;
      while (2)
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v31 != v21) {
            objc_enumerationMutation(a4);
          }
          id v23 = +[CMIOExtensionPropertyState copyXPCDictionaryFromPropertyStates:*(void *)(*((void *)&v30 + 1) + 8 * j)];
          if (!v23)
          {
            __int16 v25 = CMIOLog();
            if (v25 && os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
              __53__CMIOExtensionProviderContext_pluginStates_message___block_invoke_cold_2();
            }
            uint64_t v5 = (void *)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-5 userInfo:0];
            goto LABEL_39;
          }
          v24 = v23;
          xpc_array_append_value(v18, v23);
          xpc_release(v24);
        }
        uint64_t v20 = [a4 countByEnumeratingWithState:&v30 objects:v38 count:16];
        if (v20) {
          continue;
        }
        break;
      }
    }
    uint64_t v5 = 0;
LABEL_39:
    xpc_dictionary_set_value(*(xpc_object_t *)(a1 + 32), "param3", v18);
    xpc_release(v18);
    if (!v5)
    {
LABEL_44:
      v29 = *(void **)(a1 + 32);
      int64_t v28 = 0;
      goto LABEL_45;
    }
  }
LABEL_40:
  uint64_t v26 = CMIOLog();
  if (v26 && os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
    __53__CMIOExtensionProviderContext_pluginStates_message___block_invoke_cold_1();
  }
  uint64_t v27 = *(void **)(a1 + 32);
  int64_t v28 = [v5 code];
  v29 = v27;
LABEL_45:
  xpc_dictionary_set_int64(v29, "errorReturn", v28);
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 32));
  xpc_release(*(xpc_object_t *)(a1 + 32));
}

- (void)pluginPropertyStatesForProperties:(id)a3 message:(id)a4
{
  xpc_object_t reply = xpc_dictionary_create_reply(a4);
  if (reply)
  {
    id v8 = reply;
    CFTypeRef cf = 0;
    cmio_XPCMessageCopyCFArray(a4, "param1", (NSObject **)&cf);
    if (cf)
    {
      uint64_t v9 = objc_msgSend(MEMORY[0x263EFFA08], "setWithArray:");
      CFRelease(cf);
    }
    else
    {
      uint64_t v9 = 0;
    }
    xpc_retain(v8);
    id v11 = +[CMIOExtensionProvider sharedProvider];
    xpc_object_t v12 = [(CMIOExtensionClient *)self->_clientInfo clientID];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __74__CMIOExtensionProviderContext_pluginPropertyStatesForProperties_message___block_invoke;
    v13[3] = &unk_26517CA18;
    v13[4] = v8;
    v13[5] = a3;
    [v11 pluginPropertyStatesForClientID:v12 properties:v9 reply:v13];
    xpc_release(v8);
  }
  else
  {
    __int16 v10 = CMIOLog();
    if (v10 && os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[CMIOExtensionProviderContext pluginPropertyStatesForProperties:message:]();
    }
  }
}

void __74__CMIOExtensionProviderContext_pluginPropertyStatesForProperties_message___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v3 = a3;
  if (a2 && !a3)
  {
    id v5 = +[CMIOExtensionPropertyState copyXPCDictionaryFromPropertyStates:a2];
    if (v5)
    {
      int v6 = v5;
      xpc_dictionary_set_value(*(xpc_object_t *)(a1 + 32), "param1", v5);
      xpc_release(v6);
LABEL_14:
      id v11 = *(void **)(a1 + 32);
      int64_t v10 = 0;
      goto LABEL_15;
    }
    id v7 = CMIOLog();
    if (v7 && os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __74__CMIOExtensionProviderContext_pluginPropertyStatesForProperties_message___block_invoke_cold_2();
    }
    v3 = (void *)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-5 userInfo:0];
  }
  if (!v3) {
    goto LABEL_14;
  }
  id v8 = CMIOLog();
  if (v8 && os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    __74__CMIOExtensionProviderContext_pluginPropertyStatesForProperties_message___block_invoke_cold_1();
  }
  uint64_t v9 = *(void **)(a1 + 32);
  int64_t v10 = [v3 code];
  id v11 = v9;
LABEL_15:
  xpc_dictionary_set_int64(v11, "errorReturn", v10);
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 32));
  xpc_release(*(xpc_object_t *)(a1 + 32));
}

- (void)setPluginPropertyValues:(id)a3 message:(id)a4
{
  xpc_object_t reply = xpc_dictionary_create_reply(a4);
  if (reply)
  {
    id v8 = reply;
    xpc_object_t value = xpc_dictionary_get_value(a4, "param1");
    if (value)
    {
      id v10 = +[CMIOExtensionPropertyState copyPropertyStatesFromXPCDictionary:value];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v10, "count"));
        v19[0] = MEMORY[0x263EF8330];
        v19[1] = 3221225472;
        v19[2] = __64__CMIOExtensionProviderContext_setPluginPropertyValues_message___block_invoke;
        v19[3] = &unk_26517C570;
        v19[4] = v12;
        [v11 enumerateKeysAndObjectsUsingBlock:v19];
        xpc_retain(v8);
        id v13 = +[CMIOExtensionProvider sharedProvider];
        uint64_t v14 = [(CMIOExtensionClient *)self->_clientInfo clientID];
        v18[0] = MEMORY[0x263EF8330];
        v18[1] = 3221225472;
        v18[2] = __64__CMIOExtensionProviderContext_setPluginPropertyValues_message___block_invoke_31;
        v18[3] = &unk_26517CA40;
        v18[4] = v8;
        v18[5] = a3;
        [v13 setPluginPropertyValuesForClientID:v14 propertyValues:v12 reply:v18];
      }
      else
      {
        xpc_dictionary_set_int64(v8, "errorReturn", -5);
        xpc_connection_send_message((xpc_connection_t)a3, v8);
        __int16 v17 = CMIOLog();
        if (v17)
        {
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
            -[CMIOExtensionProviderContext setPluginPropertyValues:message:]();
          }
        }
      }
    }
    else
    {
      xpc_dictionary_set_int64(v8, "errorReturn", -1);
      xpc_connection_send_message((xpc_connection_t)a3, v8);
      __int16 v16 = CMIOLog();
      if (v16 && os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[CMIOExtensionProviderContext setPluginPropertyValues:message:]();
      }
    }
    xpc_release(v8);
  }
  else
  {
    id v15 = CMIOLog();
    if (v15 && os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[CMIOExtensionProviderContext setPluginPropertyValues:message:]();
    }
  }
}

uint64_t __64__CMIOExtensionProviderContext_setPluginPropertyValues_message___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = [a3 value];
  int v6 = *(void **)(a1 + 32);

  return [v6 setObject:v5 forKeyedSubscript:a2];
}

void __64__CMIOExtensionProviderContext_setPluginPropertyValues_message___block_invoke_31(uint64_t a1, void *a2)
{
  if (a2)
  {
    v4 = CMIOLog();
    if (v4 && os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __64__CMIOExtensionProviderContext_setPluginPropertyValues_message___block_invoke_31_cold_1();
    }
    uint64_t v5 = *(void **)(a1 + 32);
    int64_t v6 = [a2 code];
    id v7 = v5;
  }
  else
  {
    id v7 = *(void **)(a1 + 32);
    int64_t v6 = 0;
  }
  xpc_dictionary_set_int64(v7, "errorReturn", v6);
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 32));
  xpc_release(*(xpc_object_t *)(a1 + 32));
}

- (void)availableDeviceProperties:(id)a3 message:(id)a4
{
  xpc_object_t reply = xpc_dictionary_create_reply(a4);
  if (reply)
  {
    id v8 = reply;
    CFTypeRef cf = 0;
    cmio_XPCMessageCopyCFString(a4, "param1", (NSObject **)&cf);
    if (cf)
    {
      id v9 = objc_alloc(MEMORY[0x263F08C38]);
      id v10 = (void *)[v9 initWithUUIDString:cf];
      CFRelease(cf);
      xpc_retain(v8);
      id v11 = +[CMIOExtensionProvider sharedProvider];
      uint64_t v12 = [(CMIOExtensionClient *)self->_clientInfo clientID];
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __66__CMIOExtensionProviderContext_availableDeviceProperties_message___block_invoke;
      v15[3] = &unk_26517C9C8;
      v15[4] = v8;
      v15[5] = a3;
      [v11 availableDevicePropertiesForClientID:v12 deviceID:v10 reply:v15];
    }
    else
    {
      uint64_t v14 = CMIOLog();
      if (v14)
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          -[CMIOExtensionProviderContext availableDeviceProperties:message:]();
        }
      }
      id v10 = 0;
    }

    xpc_release(v8);
  }
  else
  {
    id v13 = CMIOLog();
    if (v13 && os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[CMIOExtensionProviderContext availableDeviceProperties:message:]();
    }
  }
}

void __66__CMIOExtensionProviderContext_availableDeviceProperties_message___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = (const void *)[a2 allObjects];
  if (!a3 && v5)
  {
    if (!cmio_XPCMessageSetCFArray(*(void **)(a1 + 32), "param1", v5))
    {
LABEL_13:
      id v10 = *(void **)(a1 + 32);
      int64_t v9 = 0;
      goto LABEL_14;
    }
    int64_t v6 = CMIOLog();
    if (v6 && os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __66__CMIOExtensionProviderContext_availableDeviceProperties_message___block_invoke_cold_2();
    }
    a3 = (void *)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-5 userInfo:0];
  }
  if (!a3) {
    goto LABEL_13;
  }
  id v7 = CMIOLog();
  if (v7 && os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    __66__CMIOExtensionProviderContext_availableDeviceProperties_message___block_invoke_cold_1();
  }
  id v8 = *(void **)(a1 + 32);
  int64_t v9 = [a3 code];
  id v10 = v8;
LABEL_14:
  xpc_dictionary_set_int64(v10, "errorReturn", v9);
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 32));
  xpc_release(*(xpc_object_t *)(a1 + 32));
}

- (void)deviceStates:(id)a3 message:(id)a4
{
  xpc_object_t reply = xpc_dictionary_create_reply(a4);
  if (reply)
  {
    id v8 = reply;
    CFTypeRef cf = 0;
    cmio_XPCMessageCopyCFString(a4, "param1", (NSObject **)&cf);
    if (cf)
    {
      id v9 = objc_alloc(MEMORY[0x263F08C38]);
      id v10 = (void *)[v9 initWithUUIDString:cf];
      CFRelease(cf);
      xpc_retain(v8);
      id v11 = +[CMIOExtensionProvider sharedProvider];
      uint64_t v12 = [(CMIOExtensionClient *)self->_clientInfo clientID];
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __53__CMIOExtensionProviderContext_deviceStates_message___block_invoke;
      v15[3] = &unk_26517CA68;
      v15[4] = v8;
      v15[5] = a3;
      [v11 deviceStatesForClientID:v12 deviceID:v10 reply:v15];
    }
    else
    {
      uint64_t v14 = CMIOLog();
      if (v14)
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          -[CMIOExtensionProviderContext deviceStates:message:]();
        }
      }
      id v10 = 0;
    }

    xpc_release(v8);
  }
  else
  {
    id v13 = CMIOLog();
    if (v13 && os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[CMIOExtensionProviderContext deviceStates:message:]();
    }
  }
}

void __53__CMIOExtensionProviderContext_deviceStates_message___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  v4 = a4;
  uint64_t v37 = *MEMORY[0x263EF8340];
  if (!a2 || a4) {
    goto LABEL_9;
  }
  id v7 = +[CMIOExtensionPropertyState copyXPCDictionaryFromPropertyStates:a2];
  if (!v7)
  {
    id v9 = CMIOLog();
    if (v9 && os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __53__CMIOExtensionProviderContext_deviceStates_message___block_invoke_cold_2();
    }
    v4 = (void *)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-5 userInfo:0];
LABEL_9:
    if (v4) {
      goto LABEL_27;
    }
    goto LABEL_10;
  }
  id v8 = v7;
  xpc_dictionary_set_value(*(xpc_object_t *)(a1 + 32), "param1", v7);
  xpc_release(v8);
LABEL_10:
  if (![a3 count]) {
    goto LABEL_31;
  }
  uint64_t v25 = a1;
  xpc_object_t v10 = xpc_array_create(0, 0);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v11 = [a3 countByEnumeratingWithState:&v26 objects:v36 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    v4 = 0;
    uint64_t v13 = *(void *)v27;
    uint64_t v14 = *MEMORY[0x263F08410];
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(a3);
        }
        id v16 = +[CMIOExtensionPropertyState copyXPCDictionaryFromPropertyStates:*(void *)(*((void *)&v26 + 1) + 8 * i)];
        if (v16)
        {
          __int16 v17 = v16;
          xpc_array_append_value(v10, v16);
          xpc_release(v17);
        }
        else
        {
          xpc_object_t v18 = CMIOLog();
          if (v18)
          {
            uint64_t v19 = v18;
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              uint64_t v20 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
              *(_DWORD *)buf = 136315650;
              long long v31 = v20;
              __int16 v32 = 1024;
              int v33 = 533;
              __int16 v34 = 2080;
              long long v35 = "-[CMIOExtensionProviderContext deviceStates:message:]_block_invoke";
              _os_log_error_impl(&dword_2432B6000, v19, OS_LOG_TYPE_ERROR, "%s:%d:%s copyXPCDictionaryFromPropertyStates failed", buf, 0x1Cu);
            }
          }
          v4 = (void *)[MEMORY[0x263F087E8] errorWithDomain:v14 code:-5 userInfo:0];
        }
      }
      uint64_t v12 = [a3 countByEnumeratingWithState:&v26 objects:v36 count:16];
    }
    while (v12);
  }
  else
  {
    v4 = 0;
  }
  a1 = v25;
  xpc_dictionary_set_value(*(xpc_object_t *)(v25 + 32), "param2", v10);
  xpc_release(v10);
  if (!v4)
  {
LABEL_31:
    v24 = *(void **)(a1 + 32);
    int64_t v23 = 0;
    goto LABEL_32;
  }
LABEL_27:
  uint64_t v21 = CMIOLog();
  if (v21 && os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
    __53__CMIOExtensionProviderContext_deviceStates_message___block_invoke_cold_1();
  }
  pid_t v22 = *(void **)(a1 + 32);
  int64_t v23 = [v4 code];
  v24 = v22;
LABEL_32:
  xpc_dictionary_set_int64(v24, "errorReturn", v23);
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 32));
  xpc_release(*(xpc_object_t *)(a1 + 32));
}

- (void)devicePropertyStates:(id)a3 message:(id)a4
{
  xpc_object_t reply = xpc_dictionary_create_reply(a4);
  if (reply)
  {
    id v8 = reply;
    CFTypeRef cf = 0;
    cmio_XPCMessageCopyCFString(a4, "param1", (NSObject **)&cf);
    if (cf)
    {
      id v9 = objc_alloc(MEMORY[0x263F08C38]);
      xpc_object_t v10 = (void *)[v9 initWithUUIDString:cf];
      CFRelease(cf);
      CFTypeRef v17 = 0;
      cmio_XPCMessageCopyCFArray(a4, "param2", (NSObject **)&v17);
      if (v17)
      {
        uint64_t v11 = objc_msgSend(MEMORY[0x263EFFA08], "setWithArray:");
        CFRelease(v17);
      }
      else
      {
        uint64_t v11 = 0;
      }
      xpc_retain(v8);
      id v14 = +[CMIOExtensionProvider sharedProvider];
      id v15 = [(CMIOExtensionClient *)self->_clientInfo clientID];
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __61__CMIOExtensionProviderContext_devicePropertyStates_message___block_invoke;
      v16[3] = &unk_26517CA18;
      v16[4] = v8;
      v16[5] = a3;
      [v14 devicePropertyStatesForClientID:v15 deviceID:v10 properties:v11 reply:v16];
    }
    else
    {
      uint64_t v13 = CMIOLog();
      if (v13 && os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[CMIOExtensionProviderContext devicePropertyStates:message:]();
      }
      xpc_object_t v10 = 0;
    }

    xpc_release(v8);
  }
  else
  {
    uint64_t v12 = CMIOLog();
    if (v12 && os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[CMIOExtensionProviderContext devicePropertyStates:message:]();
    }
  }
}

void __61__CMIOExtensionProviderContext_devicePropertyStates_message___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v3 = a3;
  if (a2 && !a3)
  {
    id v5 = +[CMIOExtensionPropertyState copyXPCDictionaryFromPropertyStates:a2];
    if (v5)
    {
      int64_t v6 = v5;
      xpc_dictionary_set_value(*(xpc_object_t *)(a1 + 32), "param1", v5);
      xpc_release(v6);
LABEL_14:
      uint64_t v11 = *(void **)(a1 + 32);
      int64_t v10 = 0;
      goto LABEL_15;
    }
    id v7 = CMIOLog();
    if (v7 && os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __61__CMIOExtensionProviderContext_devicePropertyStates_message___block_invoke_cold_2();
    }
    v3 = (void *)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-5 userInfo:0];
  }
  if (!v3) {
    goto LABEL_14;
  }
  id v8 = CMIOLog();
  if (v8 && os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    __61__CMIOExtensionProviderContext_devicePropertyStates_message___block_invoke_cold_1();
  }
  id v9 = *(void **)(a1 + 32);
  int64_t v10 = [v3 code];
  uint64_t v11 = v9;
LABEL_15:
  xpc_dictionary_set_int64(v11, "errorReturn", v10);
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 32));
  xpc_release(*(xpc_object_t *)(a1 + 32));
}

- (void)setDevicePropertyValues:(id)a3 message:(id)a4
{
  xpc_object_t reply = xpc_dictionary_create_reply(a4);
  if (reply)
  {
    id v8 = reply;
    int64_t v23 = 0;
    cmio_XPCMessageCopyCFString(a4, "param1", &v23);
    if (v23)
    {
      id v9 = objc_alloc(MEMORY[0x263F08C38]);
      int64_t v10 = [v9 initWithUUIDString:v23];
      CFRelease(v23);
      xpc_object_t value = xpc_dictionary_get_value(a4, "param2");
      if (value)
      {
        id v12 = +[CMIOExtensionPropertyState copyPropertyStatesFromXPCDictionary:value];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v12, "count"));
          v22[0] = MEMORY[0x263EF8330];
          v22[1] = 3221225472;
          v22[2] = __64__CMIOExtensionProviderContext_setDevicePropertyValues_message___block_invoke;
          v22[3] = &unk_26517C570;
          v22[4] = v14;
          [v13 enumerateKeysAndObjectsUsingBlock:v22];
          xpc_retain(v8);
          id v15 = +[CMIOExtensionProvider sharedProvider];
          id v16 = [(CMIOExtensionClient *)self->_clientInfo clientID];
          v21[0] = MEMORY[0x263EF8330];
          v21[1] = 3221225472;
          v21[2] = __64__CMIOExtensionProviderContext_setDevicePropertyValues_message___block_invoke_34;
          v21[3] = &unk_26517CA40;
          v21[4] = v8;
          v21[5] = a3;
          [v15 setDevicePropertyValuesForClientID:v16 deviceID:v10 propertyValues:v14 reply:v21];
        }
        else
        {
          xpc_dictionary_set_int64(v8, "errorReturn", -1);
          xpc_connection_send_message((xpc_connection_t)a3, v8);
          uint64_t v20 = CMIOLog();
          if (v20)
          {
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
              -[CMIOExtensionProviderContext setDevicePropertyValues:message:].cold.4();
            }
          }
        }
      }
      else
      {
        xpc_dictionary_set_int64(v8, "errorReturn", -1);
        xpc_connection_send_message((xpc_connection_t)a3, v8);
        uint64_t v19 = CMIOLog();
        if (v19 && os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          -[CMIOExtensionProviderContext setDevicePropertyValues:message:]();
        }
      }
    }
    else
    {
      xpc_object_t v18 = CMIOLog();
      int64_t v10 = v18;
      if (v18)
      {
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          -[CMIOExtensionProviderContext setDevicePropertyValues:message:]();
        }
        int64_t v10 = 0;
      }
    }

    xpc_release(v8);
  }
  else
  {
    CFTypeRef v17 = CMIOLog();
    if (v17 && os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[CMIOExtensionProviderContext setDevicePropertyValues:message:]();
    }
  }
}

uint64_t __64__CMIOExtensionProviderContext_setDevicePropertyValues_message___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = [a3 value];
  int64_t v6 = *(void **)(a1 + 32);

  return [v6 setObject:v5 forKeyedSubscript:a2];
}

void __64__CMIOExtensionProviderContext_setDevicePropertyValues_message___block_invoke_34(uint64_t a1, void *a2)
{
  if (a2)
  {
    v4 = CMIOLog();
    if (v4 && os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __64__CMIOExtensionProviderContext_setDevicePropertyValues_message___block_invoke_34_cold_1();
    }
    uint64_t v5 = *(void **)(a1 + 32);
    int64_t v6 = [a2 code];
    id v7 = v5;
  }
  else
  {
    id v7 = *(void **)(a1 + 32);
    int64_t v6 = 0;
  }
  xpc_dictionary_set_int64(v7, "errorReturn", v6);
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 32));
  xpc_release(*(xpc_object_t *)(a1 + 32));
}

- (void)availableStreamProperties:(id)a3 message:(id)a4
{
  xpc_object_t reply = xpc_dictionary_create_reply(a4);
  if (reply)
  {
    id v8 = reply;
    CFTypeRef cf = 0;
    cmio_XPCMessageCopyCFString(a4, "param1", (NSObject **)&cf);
    if (cf)
    {
      id v9 = objc_alloc(MEMORY[0x263F08C38]);
      int64_t v10 = (void *)[v9 initWithUUIDString:cf];
      CFRelease(cf);
      xpc_retain(v8);
      id v11 = +[CMIOExtensionProvider sharedProvider];
      id v12 = [(CMIOExtensionClient *)self->_clientInfo clientID];
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __66__CMIOExtensionProviderContext_availableStreamProperties_message___block_invoke;
      v15[3] = &unk_26517C9C8;
      v15[4] = v8;
      v15[5] = a3;
      [v11 availableStreamPropertiesForClientID:v12 streamID:v10 reply:v15];
    }
    else
    {
      uint64_t v14 = CMIOLog();
      if (v14)
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          -[CMIOExtensionProviderContext availableStreamProperties:message:]();
        }
      }
      int64_t v10 = 0;
    }

    xpc_release(v8);
  }
  else
  {
    uint64_t v13 = CMIOLog();
    if (v13 && os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[CMIOExtensionProviderContext availableStreamProperties:message:]();
    }
  }
}

void __66__CMIOExtensionProviderContext_availableStreamProperties_message___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = (const void *)[a2 allObjects];
  if (!a3 && v5)
  {
    if (!cmio_XPCMessageSetCFArray(*(void **)(a1 + 32), "param1", v5))
    {
LABEL_13:
      int64_t v10 = *(void **)(a1 + 32);
      int64_t v9 = 0;
      goto LABEL_14;
    }
    int64_t v6 = CMIOLog();
    if (v6 && os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __66__CMIOExtensionProviderContext_availableStreamProperties_message___block_invoke_cold_2();
    }
    a3 = (void *)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-5 userInfo:0];
  }
  if (!a3) {
    goto LABEL_13;
  }
  id v7 = CMIOLog();
  if (v7 && os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    __66__CMIOExtensionProviderContext_availableStreamProperties_message___block_invoke_cold_1();
  }
  id v8 = *(void **)(a1 + 32);
  int64_t v9 = [a3 code];
  int64_t v10 = v8;
LABEL_14:
  xpc_dictionary_set_int64(v10, "errorReturn", v9);
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 32));
  xpc_release(*(xpc_object_t *)(a1 + 32));
}

- (void)streamPropertyStates:(id)a3 message:(id)a4
{
  xpc_object_t reply = xpc_dictionary_create_reply(a4);
  if (reply)
  {
    id v8 = reply;
    CFTypeRef cf = 0;
    cmio_XPCMessageCopyCFString(a4, "param1", (NSObject **)&cf);
    if (cf)
    {
      id v9 = objc_alloc(MEMORY[0x263F08C38]);
      int64_t v10 = (void *)[v9 initWithUUIDString:cf];
      CFRelease(cf);
      CFTypeRef v17 = 0;
      cmio_XPCMessageCopyCFArray(a4, "param2", (NSObject **)&v17);
      if (v17)
      {
        uint64_t v11 = objc_msgSend(MEMORY[0x263EFFA08], "setWithArray:");
        CFRelease(v17);
      }
      else
      {
        uint64_t v11 = 0;
      }
      xpc_retain(v8);
      id v14 = +[CMIOExtensionProvider sharedProvider];
      id v15 = [(CMIOExtensionClient *)self->_clientInfo clientID];
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __61__CMIOExtensionProviderContext_streamPropertyStates_message___block_invoke;
      v16[3] = &unk_26517CA18;
      v16[4] = v8;
      v16[5] = a3;
      [v14 streamPropertyStatesForClientID:v15 streamID:v10 properties:v11 reply:v16];
    }
    else
    {
      uint64_t v13 = CMIOLog();
      if (v13 && os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[CMIOExtensionProviderContext streamPropertyStates:message:]();
      }
      int64_t v10 = 0;
    }

    xpc_release(v8);
  }
  else
  {
    id v12 = CMIOLog();
    if (v12 && os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[CMIOExtensionProviderContext streamPropertyStates:message:]();
    }
  }
}

void __61__CMIOExtensionProviderContext_streamPropertyStates_message___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v3 = a3;
  if (a2 && !a3)
  {
    id v5 = +[CMIOExtensionPropertyState copyXPCDictionaryFromPropertyStates:a2];
    if (v5)
    {
      int64_t v6 = v5;
      xpc_dictionary_set_value(*(xpc_object_t *)(a1 + 32), "param1", v5);
      xpc_release(v6);
LABEL_14:
      uint64_t v11 = *(void **)(a1 + 32);
      int64_t v10 = 0;
      goto LABEL_15;
    }
    id v7 = CMIOLog();
    if (v7 && os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __61__CMIOExtensionProviderContext_streamPropertyStates_message___block_invoke_cold_2();
    }
    v3 = (void *)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-5 userInfo:0];
  }
  if (!v3) {
    goto LABEL_14;
  }
  id v8 = CMIOLog();
  if (v8 && os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    __61__CMIOExtensionProviderContext_streamPropertyStates_message___block_invoke_cold_1();
  }
  id v9 = *(void **)(a1 + 32);
  int64_t v10 = [v3 code];
  uint64_t v11 = v9;
LABEL_15:
  xpc_dictionary_set_int64(v11, "errorReturn", v10);
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 32));
  xpc_release(*(xpc_object_t *)(a1 + 32));
}

- (void)setStreamPropertyValues:(id)a3 message:(id)a4
{
  xpc_object_t reply = xpc_dictionary_create_reply(a4);
  if (reply)
  {
    id v8 = reply;
    int64_t v23 = 0;
    cmio_XPCMessageCopyCFString(a4, "param1", &v23);
    if (v23)
    {
      id v9 = objc_alloc(MEMORY[0x263F08C38]);
      int64_t v10 = [v9 initWithUUIDString:v23];
      CFRelease(v23);
      xpc_object_t value = xpc_dictionary_get_value(a4, "param2");
      if (value)
      {
        id v12 = +[CMIOExtensionPropertyState copyPropertyStatesFromXPCDictionary:value];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v12, "count"));
          v22[0] = MEMORY[0x263EF8330];
          v22[1] = 3221225472;
          v22[2] = __64__CMIOExtensionProviderContext_setStreamPropertyValues_message___block_invoke;
          v22[3] = &unk_26517C570;
          v22[4] = v14;
          [v13 enumerateKeysAndObjectsUsingBlock:v22];
          xpc_retain(v8);
          id v15 = +[CMIOExtensionProvider sharedProvider];
          id v16 = [(CMIOExtensionClient *)self->_clientInfo clientID];
          v21[0] = MEMORY[0x263EF8330];
          v21[1] = 3221225472;
          v21[2] = __64__CMIOExtensionProviderContext_setStreamPropertyValues_message___block_invoke_35;
          v21[3] = &unk_26517CA40;
          v21[4] = v8;
          v21[5] = a3;
          [v15 setStreamPropertyValuesForClientID:v16 streamID:v10 propertyValues:v14 reply:v21];
        }
        else
        {
          xpc_dictionary_set_int64(v8, "errorReturn", -1);
          xpc_connection_send_message((xpc_connection_t)a3, v8);
          uint64_t v20 = CMIOLog();
          if (v20)
          {
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
              -[CMIOExtensionProviderContext setStreamPropertyValues:message:].cold.4();
            }
          }
        }
      }
      else
      {
        xpc_dictionary_set_int64(v8, "errorReturn", -1);
        xpc_connection_send_message((xpc_connection_t)a3, v8);
        uint64_t v19 = CMIOLog();
        if (v19 && os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          -[CMIOExtensionProviderContext setStreamPropertyValues:message:]();
        }
      }
    }
    else
    {
      xpc_object_t v18 = CMIOLog();
      int64_t v10 = v18;
      if (v18)
      {
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          -[CMIOExtensionProviderContext setStreamPropertyValues:message:]();
        }
        int64_t v10 = 0;
      }
    }

    xpc_release(v8);
  }
  else
  {
    CFTypeRef v17 = CMIOLog();
    if (v17 && os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[CMIOExtensionProviderContext setStreamPropertyValues:message:]();
    }
  }
}

uint64_t __64__CMIOExtensionProviderContext_setStreamPropertyValues_message___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = [a3 value];
  int64_t v6 = *(void **)(a1 + 32);

  return [v6 setObject:v5 forKeyedSubscript:a2];
}

void __64__CMIOExtensionProviderContext_setStreamPropertyValues_message___block_invoke_35(uint64_t a1, void *a2)
{
  if (a2)
  {
    v4 = CMIOLog();
    if (v4 && os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __64__CMIOExtensionProviderContext_setStreamPropertyValues_message___block_invoke_35_cold_1();
    }
    uint64_t v5 = *(void **)(a1 + 32);
    int64_t v6 = [a2 code];
    id v7 = v5;
  }
  else
  {
    id v7 = *(void **)(a1 + 32);
    int64_t v6 = 0;
  }
  xpc_dictionary_set_int64(v7, "errorReturn", v6);
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 32));
  xpc_release(*(xpc_object_t *)(a1 + 32));
}

- (void)startStream:(id)a3 message:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  xpc_object_t reply = xpc_dictionary_create_reply(a4);
  if (reply)
  {
    id v8 = reply;
    CFTypeRef cf = 0;
    cmio_XPCMessageCopyCFString(a4, "param1", (NSObject **)&cf);
    if (cf)
    {
      id v9 = objc_alloc(MEMORY[0x263F08C38]);
      int64_t v10 = (void *)[v9 initWithUUIDString:cf];
      CFRelease(cf);
      p_voucher = &self->_voucher;
      if (self->_voucher)
      {
        id v12 = CMIOLog();
        if (v12 && os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          -[CMIOExtensionProviderContext startStream:message:]();
        }

        *p_voucher = 0;
      }
      *p_voucher = (OS_voucher *)voucher_copy();
      uint64_t v13 = CMIOLog();
      if (v13)
      {
        uint64_t v14 = v13;
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          id v15 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
          id v16 = *p_voucher;
          *(_DWORD *)buf = 136315906;
          v24 = v15;
          __int16 v25 = 1024;
          int v26 = 859;
          __int16 v27 = 2080;
          long long v28 = "-[CMIOExtensionProviderContext startStream:message:]";
          __int16 v29 = 2050;
          long long v30 = v16;
          _os_log_impl(&dword_2432B6000, v14, OS_LOG_TYPE_DEFAULT, "%s:%d:%s startStream retain priority voucher %{public}p", buf, 0x26u);
        }
      }
      xpc_retain(v8);
      id v17 = +[CMIOExtensionProvider sharedProvider];
      xpc_object_t v18 = [(CMIOExtensionClient *)self->_clientInfo clientID];
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __52__CMIOExtensionProviderContext_startStream_message___block_invoke;
      v21[3] = &unk_26517CA40;
      v21[4] = v8;
      v21[5] = a3;
      [v17 startStreamForClientID:v18 streamID:v10 reply:v21];
    }
    else
    {
      uint64_t v20 = CMIOLog();
      if (v20 && os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[CMIOExtensionProviderContext startStream:message:]();
      }
      int64_t v10 = 0;
    }

    xpc_release(v8);
  }
  else
  {
    uint64_t v19 = CMIOLog();
    if (v19 && os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[CMIOExtensionProviderContext startStream:message:]();
    }
  }
}

void __52__CMIOExtensionProviderContext_startStream_message___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v4 = CMIOLog();
    if (v4 && os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __52__CMIOExtensionProviderContext_startStream_message___block_invoke_cold_1();
    }
    uint64_t v5 = *(void **)(a1 + 32);
    int64_t v6 = [a2 code];
    id v7 = v5;
  }
  else
  {
    id v7 = *(void **)(a1 + 32);
    int64_t v6 = 0;
  }
  xpc_dictionary_set_int64(v7, "errorReturn", v6);
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 32));
  xpc_release(*(xpc_object_t *)(a1 + 32));
}

- (void)stopStream:(id)a3 message:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  xpc_object_t reply = xpc_dictionary_create_reply(a4);
  if (reply)
  {
    id v8 = reply;
    CFTypeRef cf = 0;
    cmio_XPCMessageCopyCFString(a4, "param1", (NSObject **)&cf);
    if (cf)
    {
      id v9 = objc_alloc(MEMORY[0x263F08C38]);
      int64_t v10 = (void *)[v9 initWithUUIDString:cf];
      CFRelease(cf);
      xpc_retain(v8);
      id v11 = +[CMIOExtensionProvider sharedProvider];
      id v12 = [(CMIOExtensionClient *)self->_clientInfo clientID];
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __51__CMIOExtensionProviderContext_stopStream_message___block_invoke;
      v19[3] = &unk_26517CA40;
      v19[4] = v8;
      void v19[5] = a3;
      [v11 stopStreamForClientID:v12 streamID:v10 reply:v19];
      if (self->_voucher)
      {
        uint64_t v13 = CMIOLog();
        if (v13)
        {
          uint64_t v14 = v13;
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            id v15 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
            voucher = self->_voucher;
            *(_DWORD *)buf = 136315906;
            pid_t v22 = v15;
            __int16 v23 = 1024;
            int v24 = 910;
            __int16 v25 = 2080;
            int v26 = "-[CMIOExtensionProviderContext stopStream:message:]";
            __int16 v27 = 2050;
            long long v28 = voucher;
            _os_log_impl(&dword_2432B6000, v14, OS_LOG_TYPE_DEFAULT, "%s:%d:%s stopStream release priority voucher %{public}p", buf, 0x26u);
          }
        }

        self->_voucher = 0;
      }
    }
    else
    {
      xpc_object_t v18 = CMIOLog();
      if (v18 && os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[CMIOExtensionProviderContext stopStream:message:]();
      }
      int64_t v10 = 0;
    }

    xpc_release(v8);
  }
  else
  {
    id v17 = CMIOLog();
    if (v17 && os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[CMIOExtensionProviderContext stopStream:message:]();
    }
  }
}

void __51__CMIOExtensionProviderContext_stopStream_message___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v4 = CMIOLog();
    if (v4 && os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __51__CMIOExtensionProviderContext_stopStream_message___block_invoke_cold_1();
    }
    uint64_t v5 = *(void **)(a1 + 32);
    int64_t v6 = [a2 code];
    id v7 = v5;
  }
  else
  {
    id v7 = *(void **)(a1 + 32);
    int64_t v6 = 0;
  }
  xpc_dictionary_set_int64(v7, "errorReturn", v6);
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 32));
  xpc_release(*(xpc_object_t *)(a1 + 32));
}

- (void)setClientInfo:(id)a3 message:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  xpc_object_t reply = xpc_dictionary_create_reply(a4);
  if (reply)
  {
    id v8 = reply;
    xpc_object_t value = xpc_dictionary_get_value(a4, "param1");
    if (value)
    {
      xpc_object_t v10 = value;
      if ([(CMIOExtensionClient *)self->_clientInfo isFromProxyExtensionManager])
      {
        id v11 = [[CMIOExtensionClient alloc] initWithXPCDictionary:v10];
        if (v11)
        {
          clientInfo = self->_clientInfo;
          self->_clientInfo = v11;

          goto LABEL_6;
        }
        uint64_t v19 = CMIOLog();
        if (v19)
        {
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
            -[CMIOExtensionProviderContext setClientInfo:message:]();
          }
        }
      }
      else
      {
        uint64_t v14 = CMIOLog();
        if (v14)
        {
          id v15 = v14;
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            id v16 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
            pid_t pid = xpc_connection_get_pid((xpc_connection_t)a3);
            xpc_object_t v18 = self->_clientInfo;
            int v20 = 136316419;
            uint64_t v21 = v16;
            __int16 v22 = 1024;
            int v23 = 946;
            __int16 v24 = 2080;
            __int16 v25 = "-[CMIOExtensionProviderContext setClientInfo:message:]";
            __int16 v26 = 1025;
            pid_t v27 = pid;
            __int16 v28 = 2112;
            uint64_t v29 = self;
            __int16 v30 = 2112;
            uint64_t v31 = v18;
            _os_log_error_impl(&dword_2432B6000, v15, OS_LOG_TYPE_ERROR, "%s:%d:%s [%{private}d] invalid connection for this message to %@ / %@", (uint8_t *)&v20, 0x36u);
          }
        }
      }
      xpc_dictionary_set_int64(v8, "errorReturn", -1);
      xpc_connection_send_message((xpc_connection_t)a3, v8);
      objc_msgSend(+[CMIOExtensionProvider sharedProvider](CMIOExtensionProvider, "sharedProvider"), "removeProviderContext:", self);
      [(CMIOExtensionProviderContext *)self invalidate];
      goto LABEL_17;
    }
LABEL_6:
    xpc_dictionary_set_int64(v8, "errorReturn", 0);
    xpc_connection_send_message((xpc_connection_t)a3, v8);
    objc_msgSend(+[CMIOExtensionProvider sharedProvider](CMIOExtensionProvider, "sharedProvider"), "finishProviderContextRegistration:", self);
LABEL_17:
    xpc_release(v8);
    return;
  }
  uint64_t v13 = CMIOLog();
  if (v13 && os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    -[CMIOExtensionProviderContext setClientInfo:message:]();
  }
}

- (void)captureAsyncStillImage:(id)a3 message:(id)a4
{
  int v20 = 0;
  xpc_object_t reply = xpc_dictionary_create_reply(a4);
  if (!reply)
  {
    id v12 = CMIOLog();
    id v9 = v12;
    if (!v12) {
      goto LABEL_15;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[CMIOExtensionProviderContext captureAsyncStillImage:message:]();
    }
LABEL_14:
    id v9 = 0;
    goto LABEL_15;
  }
  CFTypeRef cf = 0;
  cmio_XPCMessageCopyCFString(a4, "param1", (NSObject **)&cf);
  if (!cf)
  {
    xpc_dictionary_set_int64(reply, "errorReturn", -1);
    xpc_connection_send_message((xpc_connection_t)a3, reply);
    uint64_t v13 = CMIOLog();
    id v9 = v13;
    if (!v13) {
      goto LABEL_15;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[CMIOExtensionProviderContext captureAsyncStillImage:message:]();
    }
    goto LABEL_14;
  }
  id v8 = objc_alloc(MEMORY[0x263F08C38]);
  id v9 = [v8 initWithUUIDString:cf];
  CFRelease(cf);
  CFTypeRef v18 = 0;
  cmio_XPCMessageCopyCFNumber(a4, "param2", (NSObject **)&v18);
  if (v18)
  {
    uint64_t v10 = [(id)v18 longLongValue];
    CFRelease(v18);
    if (cmio_XPCMessageCopyCFDictionary(a4, "param3", &v20))
    {
      xpc_dictionary_set_int64(reply, "errorReturn", -1);
      xpc_connection_send_message((xpc_connection_t)a3, reply);
      id v11 = CMIOLog();
      if (v11 && os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[CMIOExtensionProviderContext captureAsyncStillImage:message:].cold.4();
      }
    }
    else
    {
      xpc_retain(reply);
      id v15 = +[CMIOExtensionProvider sharedProvider];
      id v16 = [(CMIOExtensionClient *)self->_clientInfo clientID];
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __63__CMIOExtensionProviderContext_captureAsyncStillImage_message___block_invoke;
      v17[3] = &unk_26517CA90;
      v17[4] = reply;
      v17[5] = a3;
      [v15 captureAsyncStillImageForClientID:v16 streamID:v9 uniqueID:v10 options:v20 reply:v17];
    }
  }
  else
  {
    xpc_dictionary_set_int64(reply, "errorReturn", -1);
    xpc_connection_send_message((xpc_connection_t)a3, reply);
    uint64_t v14 = CMIOLog();
    if (v14 && os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[CMIOExtensionProviderContext captureAsyncStillImage:message:]();
    }
  }
LABEL_15:

  if (v20) {
    CFRelease(v20);
  }
  if (reply) {
    xpc_release(reply);
  }
}

void __63__CMIOExtensionProviderContext_captureAsyncStillImage_message___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  if (a3)
  {
    uint64_t v5 = CMIOLog();
    if (v5 && os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __63__CMIOExtensionProviderContext_captureAsyncStillImage_message___block_invoke_cold_1();
    }
    int64_t v6 = *(void **)(a1 + 32);
    int64_t v7 = [a3 code];
    id v8 = v6;
  }
  else
  {
    xpc_dictionary_set_int64(*(xpc_object_t *)(a1 + 32), "errorReturn", 0);
    int SerializedAtomDataBlockBufferForSampleBuffer = FigRemote_CreateSerializedAtomDataBlockBufferForSampleBuffer();
    id v8 = *(void **)(a1 + 32);
    int64_t v7 = SerializedAtomDataBlockBufferForSampleBuffer;
  }
  xpc_dictionary_set_int64(v8, "errorReturn", v7);
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 32));
  xpc_release(*(xpc_object_t *)(a1 + 32));
}

- (void)updateNonStreamingProxyFrontedExtensionPIDs:(id)a3 message:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  p_clientInfo = &self->_clientInfo;
  if ([(CMIOExtensionClient *)self->_clientInfo isFromProxyExtensionManager])
  {
    uint64_t v13 = 0;
    cmio_XPCMessageCopyCFArray(a4, "param1", &v13);
    int64_t v6 = v13;
    int64_t v7 = CMIOLog();
    id v8 = v7;
    if (v6)
    {
      if (v7)
      {
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          id v9 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
          pid_t v10 = [(CMIOExtensionClient *)*p_clientInfo pid];
          *(_DWORD *)buf = 136316163;
          id v15 = v9;
          __int16 v16 = 1024;
          int v17 = 1040;
          __int16 v18 = 2080;
          uint64_t v19 = "-[CMIOExtensionProviderContext updateNonStreamingProxyFrontedExtensionPIDs:message:]";
          __int16 v20 = 1025;
          pid_t v21 = v10;
          __int16 v22 = 2113;
          int v23 = v13;
          _os_log_impl(&dword_2432B6000, v8, OS_LOG_TYPE_DEFAULT, "%s:%d:%s [%{private}d] updating with %{private}@", buf, 0x2Cu);
        }
      }
      id v11 = +[CMIOExtensionProvider sharedProvider];
      [v11 updateNonStreamingProxyFrontedExtensionPIDs:v13];
    }
    else if (v7 && os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      -[CMIOExtensionProviderContext updateNonStreamingProxyFrontedExtensionPIDs:message:]();
    }
  }
  else
  {
    id v12 = CMIOLog();
    if (v12 && os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[CMIOExtensionProviderContext updateNonStreamingProxyFrontedExtensionPIDs:message:]();
    }
  }
}

- (void)enqueueReactionEffect:(id)a3 message:(id)a4
{
  __int16 v18 = 0;
  xpc_object_t reply = xpc_dictionary_create_reply(a4);
  if (reply)
  {
    id v8 = reply;
    CFTypeRef cf = 0;
    cmio_XPCMessageCopyCFString(a4, "param1", (NSObject **)&cf);
    if (cf)
    {
      id v9 = objc_alloc(MEMORY[0x263F08C38]);
      pid_t v10 = [v9 initWithUUIDString:cf];
      CFRelease(cf);
      if (cmio_XPCMessageCopyCFString(a4, "param2", &v18))
      {
        xpc_dictionary_set_int64(v8, "errorReturn", -1);
        xpc_connection_send_message((xpc_connection_t)a3, v8);
        id v11 = CMIOLog();
        if (v11)
        {
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
            -[CMIOExtensionProviderContext enqueueReactionEffect:message:]();
          }
        }
      }
      else
      {
        xpc_retain(v8);
        id v14 = +[CMIOExtensionProvider sharedProvider];
        id v15 = [(CMIOExtensionClient *)self->_clientInfo clientID];
        v16[0] = MEMORY[0x263EF8330];
        v16[1] = 3221225472;
        v16[2] = __62__CMIOExtensionProviderContext_enqueueReactionEffect_message___block_invoke;
        v16[3] = &unk_26517CA40;
        v16[4] = v8;
        v16[5] = a3;
        [v14 enqueueReactionEffectForClientID:v15 streamID:v10 reactionType:v18 reply:v16];
      }
    }
    else
    {
      xpc_dictionary_set_int64(v8, "errorReturn", -1);
      xpc_connection_send_message((xpc_connection_t)a3, v8);
      uint64_t v13 = CMIOLog();
      pid_t v10 = v13;
      if (v13)
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          -[CMIOExtensionProviderContext enqueueReactionEffect:message:]();
        }
        pid_t v10 = 0;
      }
    }

    xpc_release(v8);
  }
  else
  {
    id v12 = CMIOLog();
    if (v12 && os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[CMIOExtensionProviderContext enqueueReactionEffect:message:]();
    }
  }
}

void __62__CMIOExtensionProviderContext_enqueueReactionEffect_message___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v4 = CMIOLog();
    if (v4 && os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __62__CMIOExtensionProviderContext_enqueueReactionEffect_message___block_invoke_cold_1();
    }
    uint64_t v5 = *(void **)(a1 + 32);
    int64_t v6 = [a2 code];
    int64_t v7 = v5;
  }
  else
  {
    int64_t v7 = *(void **)(a1 + 32);
    int64_t v6 = 0;
  }
  xpc_dictionary_set_int64(v7, "errorReturn", v6);
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 32));
  xpc_release(*(xpc_object_t *)(a1 + 32));
}

- (void)pluginPropertiesChanged:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v5 = CMIOLogLevel(1);
  if (v5)
  {
    int64_t v6 = v5;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v7 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
      id v8 = [(CMIOExtensionClient *)self->_clientInfo clientID];
      int v13 = 136315907;
      id v14 = v7;
      __int16 v15 = 1024;
      int v16 = 1101;
      __int16 v17 = 2080;
      __int16 v18 = "-[CMIOExtensionProviderContext pluginPropertiesChanged:]";
      __int16 v19 = 2113;
      __int16 v20 = v8;
      _os_log_impl(&dword_2432B6000, v6, OS_LOG_TYPE_DEFAULT, "%s:%d:%s CID %{private}@", (uint8_t *)&v13, 0x26u);
    }
  }
  xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v9, "MessageType", 3uLL);
  if (!a3) {
    goto LABEL_7;
  }
  id v10 = +[CMIOExtensionPropertyState copyXPCDictionaryFromPropertyStates:a3];
  if (v10)
  {
    id v11 = v10;
    xpc_dictionary_set_value(v9, "param1", v10);
    xpc_release(v11);
LABEL_7:
    xpc_connection_send_message(self->_connection, v9);
    goto LABEL_8;
  }
  id v12 = CMIOLog();
  if (v12 && os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    -[CMIOExtensionProviderContext pluginPropertiesChanged:]();
  }
LABEL_8:
  xpc_release(v9);
}

- (void)availableDevicesChanged:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v5 = CMIOLogLevel(1);
  if (v5)
  {
    int64_t v6 = v5;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v7 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
      id v8 = [(CMIOExtensionClient *)self->_clientInfo clientID];
      int v11 = 136315907;
      id v12 = v7;
      __int16 v13 = 1024;
      int v14 = 1124;
      __int16 v15 = 2080;
      int v16 = "-[CMIOExtensionProviderContext availableDevicesChanged:]";
      __int16 v17 = 2113;
      __int16 v18 = v8;
      _os_log_impl(&dword_2432B6000, v6, OS_LOG_TYPE_DEFAULT, "%s:%d:%s CID %{private}@", (uint8_t *)&v11, 0x26u);
    }
  }
  xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v9, "MessageType", 1uLL);
  if (a3 && cmio_XPCMessageSetCFArray(v9, "param1", a3))
  {
    id v10 = CMIOLog();
    if (v10 && os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[CMIOExtensionProviderContext availableDevicesChanged:]();
    }
  }
  else
  {
    xpc_connection_send_message(self->_connection, v9);
  }
  xpc_release(v9);
}

- (void)devicePropertiesChangedWithDeviceID:(id)a3 propertyStates:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  int64_t v7 = CMIOLogLevel(1);
  if (v7)
  {
    id v8 = v7;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      xpc_object_t v9 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
      id v10 = [(CMIOExtensionClient *)self->_clientInfo clientID];
      int v16 = 136316163;
      __int16 v17 = v9;
      __int16 v18 = 1024;
      int v19 = 1140;
      __int16 v20 = 2080;
      uint64_t v21 = "-[CMIOExtensionProviderContext devicePropertiesChangedWithDeviceID:propertyStates:]";
      __int16 v22 = 2113;
      int v23 = v10;
      __int16 v24 = 2113;
      id v25 = a3;
      _os_log_impl(&dword_2432B6000, v8, OS_LOG_TYPE_DEFAULT, "%s:%d:%s CID %{private}@ DID %{private}@", (uint8_t *)&v16, 0x30u);
    }
  }
  xpc_object_t v11 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v11, "MessageType", 4uLL);
  if (cmio_XPCMessageSetCFString(v11, "param1", a3))
  {
    id v12 = CMIOLog();
    if (v12 && os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[CMIOExtensionProviderContext devicePropertiesChangedWithDeviceID:propertyStates:]();
    }
    goto LABEL_12;
  }
  if (!a4)
  {
LABEL_11:
    xpc_connection_send_message(self->_connection, v11);
    goto LABEL_12;
  }
  id v13 = +[CMIOExtensionPropertyState copyXPCDictionaryFromPropertyStates:a4];
  if (v13)
  {
    int v14 = v13;
    xpc_dictionary_set_value(v11, "param2", v13);
    xpc_release(v14);
    goto LABEL_11;
  }
  __int16 v15 = CMIOLog();
  if (v15 && os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    -[CMIOExtensionProviderContext devicePropertiesChangedWithDeviceID:propertyStates:]();
  }
LABEL_12:
  xpc_release(v11);
}

- (void)availableStreamsChangedWithDeviceID:(id)a3 streamIDs:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  int64_t v7 = CMIOLogLevel(1);
  if (v7)
  {
    id v8 = v7;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      xpc_object_t v9 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
      id v10 = [(CMIOExtensionClient *)self->_clientInfo clientID];
      int v14 = 136316163;
      __int16 v15 = v9;
      __int16 v16 = 1024;
      int v17 = 1166;
      __int16 v18 = 2080;
      int v19 = "-[CMIOExtensionProviderContext availableStreamsChangedWithDeviceID:streamIDs:]";
      __int16 v20 = 2113;
      uint64_t v21 = v10;
      __int16 v22 = 2113;
      id v23 = a3;
      _os_log_impl(&dword_2432B6000, v8, OS_LOG_TYPE_DEFAULT, "%s:%d:%s CID %{private}@ DID %{private}@", (uint8_t *)&v14, 0x30u);
    }
  }
  xpc_object_t v11 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v11, "MessageType", 2uLL);
  if (cmio_XPCMessageSetCFString(v11, "param1", a3))
  {
    id v12 = CMIOLog();
    if (v12 && os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[CMIOExtensionProviderContext availableStreamsChangedWithDeviceID:streamIDs:]();
    }
  }
  else if (a4 && cmio_XPCMessageSetCFArray(v11, "param2", a4))
  {
    id v13 = CMIOLog();
    if (v13 && os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[CMIOExtensionProviderContext availableStreamsChangedWithDeviceID:streamIDs:]();
    }
  }
  else
  {
    xpc_connection_send_message(self->_connection, v11);
  }
  xpc_release(v11);
}

- (void)streamPropertiesChangedWithStreamID:(id)a3 propertyStates:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  int64_t v7 = CMIOLogLevel(1);
  if (v7)
  {
    id v8 = v7;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      xpc_object_t v9 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
      id v10 = [(CMIOExtensionClient *)self->_clientInfo clientID];
      int v16 = 136316163;
      int v17 = v9;
      __int16 v18 = 1024;
      int v19 = 1185;
      __int16 v20 = 2080;
      uint64_t v21 = "-[CMIOExtensionProviderContext streamPropertiesChangedWithStreamID:propertyStates:]";
      __int16 v22 = 2113;
      id v23 = v10;
      __int16 v24 = 2112;
      id v25 = a3;
      _os_log_impl(&dword_2432B6000, v8, OS_LOG_TYPE_DEFAULT, "%s:%d:%s CID %{private}@ SID %@", (uint8_t *)&v16, 0x30u);
    }
  }
  xpc_object_t v11 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v11, "MessageType", 5uLL);
  if (cmio_XPCMessageSetCFString(v11, "param1", a3))
  {
    id v12 = CMIOLog();
    if (v12 && os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[CMIOExtensionProviderContext streamPropertiesChangedWithStreamID:propertyStates:]();
    }
    goto LABEL_12;
  }
  if (!a4)
  {
LABEL_11:
    xpc_connection_send_message(self->_connection, v11);
    goto LABEL_12;
  }
  id v13 = +[CMIOExtensionPropertyState copyXPCDictionaryFromPropertyStates:a4];
  if (v13)
  {
    int v14 = v13;
    xpc_dictionary_set_value(v11, "param2", v13);
    xpc_release(v14);
    goto LABEL_11;
  }
  __int16 v15 = CMIOLog();
  if (v15 && os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    -[CMIOExtensionProviderContext streamPropertiesChangedWithStreamID:propertyStates:]();
  }
LABEL_12:
  xpc_release(v11);
}

- (void)receivedSampleWithStreamID:(id)a3 sample:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  int64_t v7 = CMIOLogLevel(3);
  if (v7)
  {
    id v8 = v7;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      xpc_object_t v9 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
      id v10 = [(CMIOExtensionClient *)self->_clientInfo clientID];
      int v16 = 136316163;
      int v17 = v9;
      __int16 v18 = 1024;
      int v19 = 1211;
      __int16 v20 = 2080;
      uint64_t v21 = "-[CMIOExtensionProviderContext receivedSampleWithStreamID:sample:]";
      __int16 v22 = 2113;
      id v23 = v10;
      __int16 v24 = 2112;
      id v25 = a3;
      _os_log_impl(&dword_2432B6000, v8, OS_LOG_TYPE_DEFAULT, "%s:%d:%s CID %{private}@ SID %@", (uint8_t *)&v16, 0x30u);
    }
  }
  xpc_object_t v11 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v11, "MessageType", 7uLL);
  if (cmio_XPCMessageSetCFString(v11, "param1", a3))
  {
    id v12 = CMIOLog();
    if (v12 && os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[CMIOExtensionProviderContext receivedSampleWithStreamID:sample:]();
    }
    goto LABEL_12;
  }
  if (!a4)
  {
LABEL_11:
    xpc_connection_send_message(self->_connection, v11);
    goto LABEL_12;
  }
  xpc_dictionary_set_int64(v11, "param2", [a4 mediaType]);
  id v13 = (void *)[a4 copyXPCDictionary];
  if (v13)
  {
    int v14 = v13;
    xpc_dictionary_set_value(v11, "param3", v13);
    xpc_release(v14);
    goto LABEL_11;
  }
  __int16 v15 = CMIOLog();
  if (v15 && os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    -[CMIOExtensionProviderContext receivedSampleWithStreamID:sample:]();
  }
LABEL_12:
  xpc_release(v11);
}

- (void)pullSampleBufferForStreamID:(id)a3 replyq:(id)a4 reply:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  xpc_object_t v9 = CMIOLogLevel(3);
  if (v9)
  {
    id v10 = v9;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      xpc_object_t v11 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
      id v12 = [(CMIOExtensionClient *)self->_clientInfo clientID];
      *(_DWORD *)buf = 136316163;
      __int16 v18 = v11;
      __int16 v19 = 1024;
      int v20 = 1240;
      __int16 v21 = 2080;
      __int16 v22 = "-[CMIOExtensionProviderContext pullSampleBufferForStreamID:replyq:reply:]";
      __int16 v23 = 2113;
      __int16 v24 = v12;
      __int16 v25 = 2112;
      id v26 = a3;
      _os_log_impl(&dword_2432B6000, v10, OS_LOG_TYPE_DEFAULT, "%s:%d:%s CID %{private}@ SID %@", buf, 0x30u);
    }
  }
  xpc_object_t v13 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v13, "MessageType", 8uLL);
  if (cmio_XPCMessageSetCFString(v13, "param1", a3))
  {
    int v14 = CMIOLog();
    if (v14 && os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[CMIOExtensionProviderContext pullSampleBufferForStreamID:replyq:reply:]();
    }
    (*((void (**)(id, void, void, uint64_t))a5 + 2))(a5, 0, 0, [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-5 userInfo:0]);
  }
  else
  {
    connection = self->_connection;
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __73__CMIOExtensionProviderContext_pullSampleBufferForStreamID_replyq_reply___block_invoke;
    handler[3] = &unk_26517CAB8;
    handler[4] = a5;
    xpc_connection_send_message_with_reply(connection, v13, (dispatch_queue_t)a4, handler);
  }
  xpc_release(v13);
}

void __73__CMIOExtensionProviderContext_pullSampleBufferForStreamID_replyq_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v4 = MEMORY[0x245679950](a2);
  if (v4 == MEMORY[0x263EF8720])
  {
    int64_t v7 = CMIOLog();
    if (v7 && os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
      __73__CMIOExtensionProviderContext_pullSampleBufferForStreamID_replyq_reply___block_invoke_cold_2((uint64_t)v8, (uint64_t)a2, (uint64_t)buf);
    }
    [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-7 userInfo:0];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else if (v4 == MEMORY[0x263EF8708])
  {
    int int64 = xpc_dictionary_get_int64(a2, "errorReturn");
    if (int64)
    {
      [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:int64 userInfo:0];
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
    else
    {
      xpc_object_t value = (CMIOExtensionSample *)xpc_dictionary_get_value(a2, "param1");
      if (value)
      {
        xpc_object_t value = [[CMIOExtensionSample alloc] initWithXPCDictionary:value];
        if (!value)
        {
          xpc_object_t v11 = CMIOLog();
          id v12 = v11;
          if (v11 && os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            xpc_object_t v13 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
            __73__CMIOExtensionProviderContext_pullSampleBufferForStreamID_replyq_reply___block_invoke_cold_3((uint64_t)v13, buf, v12);
          }
          [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6 userInfo:0];
        }
        xpc_dictionary_get_BOOL(a2, "param2");
      }
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
  }
  else
  {
    uint64_t v5 = CMIOLog();
    if (v5)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        int64_t v6 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
        __73__CMIOExtensionProviderContext_pullSampleBufferForStreamID_replyq_reply___block_invoke_cold_4((uint64_t)v6, (uint64_t)a2, (uint64_t)buf);
      }
    }
    [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6 userInfo:0];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)streamScheduledOutputChangedWithStreamID:(id)a3 scheduledOutput:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  int64_t v7 = CMIOLogLevel(2);
  if (v7)
  {
    id v8 = v7;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      xpc_object_t v9 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
      id v10 = [(CMIOExtensionClient *)self->_clientInfo clientID];
      int v16 = 136316163;
      int v17 = v9;
      __int16 v18 = 1024;
      int v19 = 1304;
      __int16 v20 = 2080;
      __int16 v21 = "-[CMIOExtensionProviderContext streamScheduledOutputChangedWithStreamID:scheduledOutput:]";
      __int16 v22 = 2113;
      __int16 v23 = v10;
      __int16 v24 = 2112;
      id v25 = a3;
      _os_log_impl(&dword_2432B6000, v8, OS_LOG_TYPE_DEFAULT, "%s:%d:%s CID %{private}@ SID %@", (uint8_t *)&v16, 0x30u);
    }
  }
  xpc_object_t v11 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v11, "MessageType", 9uLL);
  if (cmio_XPCMessageSetCFString(v11, "param1", a3))
  {
    id v12 = CMIOLog();
    if (v12 && os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[CMIOExtensionProviderContext streamScheduledOutputChangedWithStreamID:scheduledOutput:]();
    }
    goto LABEL_12;
  }
  if (!a4)
  {
LABEL_11:
    xpc_connection_send_message(self->_connection, v11);
    goto LABEL_12;
  }
  xpc_object_t v13 = (void *)[a4 copyXPCDictionary];
  if (v13)
  {
    int v14 = v13;
    xpc_dictionary_set_value(v11, "param2", v13);
    xpc_release(v14);
    goto LABEL_11;
  }
  uint64_t v15 = CMIOLog();
  if (v15 && os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    -[CMIOExtensionProviderContext streamScheduledOutputChangedWithStreamID:scheduledOutput:]();
  }
LABEL_12:
  xpc_release(v11);
}

- (OS_xpc_object)connection
{
  return self->_connection;
}

- (CMIOExtensionClient)clientInfo
{
  return self->_clientInfo;
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (BOOL)isClientSourcedByNonStreamingProxyFrontedExtension
{
  return self->_clientSourcedByNonStreamingProxyFrontedExtension;
}

- (void)setClientSourcedByNonStreamingProxyFrontedExtension:(BOOL)a3
{
  self->_clientSourcedByNonStreamingProxyFrontedExtension = a3;
}

void __51__CMIOExtensionProviderContext_initWithConnection___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  int64_t v6 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  xpc_connection_get_pid(*(xpc_connection_t *)(a1 + 32));
  int v9 = 136316162;
  id v10 = v6;
  OUTLINED_FUNCTION_4_1();
  int v11 = 64;
  __int16 v12 = 2080;
  xpc_object_t v13 = "-[CMIOExtensionProviderContext initWithConnection:]_block_invoke";
  __int16 v14 = v7;
  int v15 = v8;
  __int16 v16 = 2114;
  uint64_t v17 = a2;
  _os_log_error_impl(&dword_2432B6000, a3, OS_LOG_TYPE_ERROR, "%s:%d:%s [%d] received %{public}@", (uint8_t *)&v9, 0x2Cu);
}

- (void)handleClientMessageWithConnection:message:.cold.1()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s Unknown message type %lld", v2, v3, v4, v5, v6);
}

- (void)availablePluginProperties:message:.cold.1()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s xpc_dictionary_create_reply failedreply == NULL == true ", v2, v3, v4, v5, v6);
}

void __66__CMIOExtensionProviderContext_availablePluginProperties_message___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s availablePluginProperties failed %{public}@", v2, v3, v4, v5, v6);
}

void __66__CMIOExtensionProviderContext_availablePluginProperties_message___block_invoke_cold_2()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s cmio_XPCMessageSetCFArray failed", v2, v3, v4, v5, v6);
}

- (void)pluginStates:message:.cold.1()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s xpc_dictionary_create_reply failedreply == NULL == true ", v2, v3, v4, v5, v6);
}

void __53__CMIOExtensionProviderContext_pluginStates_message___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s pluginStatesForClientID failed %{public}@", v2, v3, v4, v5, v6);
}

void __53__CMIOExtensionProviderContext_pluginStates_message___block_invoke_cold_2()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s copyXPCDictionaryFromPropertyStates failed", v2, v3, v4, v5, v6);
}

void __53__CMIOExtensionProviderContext_pluginStates_message___block_invoke_cold_3()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s copyXPCDictionaryFromPropertyStates failed", v2, v3, v4, v5, v6);
}

void __53__CMIOExtensionProviderContext_pluginStates_message___block_invoke_cold_4()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s copyXPCDictionaryFromPropertyStates failed", v2, v3, v4, v5, v6);
}

- (void)pluginPropertyStatesForProperties:message:.cold.1()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s xpc_dictionary_create_reply failedreply == NULL == true ", v2, v3, v4, v5, v6);
}

void __74__CMIOExtensionProviderContext_pluginPropertyStatesForProperties_message___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s pluginPropertyStatesForProperties failed %{public}@", v2, v3, v4, v5, v6);
}

void __74__CMIOExtensionProviderContext_pluginPropertyStatesForProperties_message___block_invoke_cold_2()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s copyXPCDictionaryFromPropertyStates failed", v2, v3, v4, v5, v6);
}

- (void)setPluginPropertyValues:message:.cold.1()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s xpc_dictionary_create_reply failedreply == NULL == true ", v2, v3, v4, v5, v6);
}

- (void)setPluginPropertyValues:message:.cold.2()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s setPluginPropertyValues missing parametertrue == true ", v2, v3, v4, v5, v6);
}

- (void)setPluginPropertyValues:message:.cold.3()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s copyPropertyStatesFromXPCDictionary failedpropertyStatesDictionary == nil == true ", v2, v3, v4, v5, v6);
}

void __64__CMIOExtensionProviderContext_setPluginPropertyValues_message___block_invoke_31_cold_1()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s setPluginPropertyValues failed %{public}@", v2, v3, v4, v5, v6);
}

- (void)availableDeviceProperties:message:.cold.1()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s xpc_dictionary_create_reply failedreply == NULL == true ", v2, v3, v4, v5, v6);
}

- (void)availableDeviceProperties:message:.cold.2()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s cmio_XPCMessageCopyCFString faileddeviceID == NULL == true ", v2, v3, v4, v5, v6);
}

void __66__CMIOExtensionProviderContext_availableDeviceProperties_message___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s availableDeviceProperties failed %{public}@", v2, v3, v4, v5, v6);
}

void __66__CMIOExtensionProviderContext_availableDeviceProperties_message___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s Error: %ld, cmio_XPCMessageSetCFArray failed", v2, v3, v4, v5, v6);
}

- (void)deviceStates:message:.cold.1()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s xpc_dictionary_create_reply failedreply == NULL == true ", v2, v3, v4, v5, v6);
}

- (void)deviceStates:message:.cold.2()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s cmio_XPCMessageCopyCFString faileddeviceID == NULL == true ", v2, v3, v4, v5, v6);
}

void __53__CMIOExtensionProviderContext_deviceStates_message___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s deviceStates failed %{public}@", v2, v3, v4, v5, v6);
}

void __53__CMIOExtensionProviderContext_deviceStates_message___block_invoke_cold_2()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s copyXPCDictionaryFromPropertyStates failed", v2, v3, v4, v5, v6);
}

- (void)devicePropertyStates:message:.cold.1()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s xpc_dictionary_create_reply failedreply == NULL == true ", v2, v3, v4, v5, v6);
}

- (void)devicePropertyStates:message:.cold.2()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s cmio_XPCMessageCopyCFString faileddeviceID == NULL == true ", v2, v3, v4, v5, v6);
}

void __61__CMIOExtensionProviderContext_devicePropertyStates_message___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s devicePropertyStates failed %{public}@", v2, v3, v4, v5, v6);
}

void __61__CMIOExtensionProviderContext_devicePropertyStates_message___block_invoke_cold_2()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s copyXPCDictionaryFromPropertyStates failed", v2, v3, v4, v5, v6);
}

- (void)setDevicePropertyValues:message:.cold.1()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s xpc_dictionary_create_reply failedreply == NULL == true ", v2, v3, v4, v5, v6);
}

- (void)setDevicePropertyValues:message:.cold.2()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s cmio_XPCMessageCopyCFString faileddeviceID == NULL == true ", v2, v3, v4, v5, v6);
}

- (void)setDevicePropertyValues:message:.cold.3()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s setDevicePropertyValuesWithDeviceID missing parametertrue == true ", v2, v3, v4, v5, v6);
}

- (void)setDevicePropertyValues:message:.cold.4()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s copyPropertyStatesFromXPCDictionary failedtrue == true ", v2, v3, v4, v5, v6);
}

void __64__CMIOExtensionProviderContext_setDevicePropertyValues_message___block_invoke_34_cold_1()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s setDevicePropertyValuesWithDeviceID failed %{public}@", v2, v3, v4, v5, v6);
}

- (void)availableStreamProperties:message:.cold.1()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s xpc_dictionary_create_reply failedreply == NULL == true ", v2, v3, v4, v5, v6);
}

- (void)availableStreamProperties:message:.cold.2()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s cmio_XPCMessageCopyCFString failedstreamID == NULL == true ", v2, v3, v4, v5, v6);
}

void __66__CMIOExtensionProviderContext_availableStreamProperties_message___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s availableStreamProperties failed %{public}@", v2, v3, v4, v5, v6);
}

void __66__CMIOExtensionProviderContext_availableStreamProperties_message___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s Error: %ld, cmio_XPCMessageSetCFArray failed", v2, v3, v4, v5, v6);
}

- (void)streamPropertyStates:message:.cold.1()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s xpc_dictionary_create_reply failedreply == NULL == true ", v2, v3, v4, v5, v6);
}

- (void)streamPropertyStates:message:.cold.2()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s cmio_XPCMessageCopyCFString failedstreamID == NULL == true ", v2, v3, v4, v5, v6);
}

void __61__CMIOExtensionProviderContext_streamPropertyStates_message___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s streamPropertyStates failed %{public}@", v2, v3, v4, v5, v6);
}

void __61__CMIOExtensionProviderContext_streamPropertyStates_message___block_invoke_cold_2()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s copyXPCDictionaryFromPropertyStates failed", v2, v3, v4, v5, v6);
}

- (void)setStreamPropertyValues:message:.cold.1()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s xpc_dictionary_create_reply failedreply == NULL == true ", v2, v3, v4, v5, v6);
}

- (void)setStreamPropertyValues:message:.cold.2()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s cmio_XPCMessageCopyCFString failedstreamID == NULL == true ", v2, v3, v4, v5, v6);
}

- (void)setStreamPropertyValues:message:.cold.3()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s setStreamPropertyValues missing parametertrue == true ", v2, v3, v4, v5, v6);
}

- (void)setStreamPropertyValues:message:.cold.4()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s copyPropertyStatesFromXPCDictionary failedtrue == true ", v2, v3, v4, v5, v6);
}

void __64__CMIOExtensionProviderContext_setStreamPropertyValues_message___block_invoke_35_cold_1()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s setStreamPropertyValues failed %{public}@", v2, v3, v4, v5, v6);
}

- (void)startStream:message:.cold.1()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s xpc_dictionary_create_reply failedreply == NULL == true ", v2, v3, v4, v5, v6);
}

- (void)startStream:message:.cold.2()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s cmio_XPCMessageCopyCFString failedstreamID == NULL == true ", v2, v3, v4, v5, v6);
}

- (void)startStream:message:.cold.3()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s startStream, pending unreleased voucher %{public}p", v2, v3, v4, v5, 2u);
}

void __52__CMIOExtensionProviderContext_startStream_message___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s startStream failed %{public}@", v2, v3, v4, v5, v6);
}

- (void)stopStream:message:.cold.1()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s xpc_dictionary_create_reply failedreply == NULL == true ", v2, v3, v4, v5, v6);
}

- (void)stopStream:message:.cold.2()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s cmio_XPCMessageCopyCFString failedstreamID == NULL == true ", v2, v3, v4, v5, v6);
}

void __51__CMIOExtensionProviderContext_stopStream_message___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s stopStream failed %{public}@", v2, v3, v4, v5, v6);
}

- (void)setClientInfo:message:.cold.1()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s xpc_dictionary_create_reply failedreply == NULL == true ", v2, v3, v4, v5, v6);
}

- (void)setClientInfo:message:.cold.2()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  xpc_connection_get_pid(v0);
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_8_0(&dword_2432B6000, v1, v2, "%s:%d:%s [%{private}d] CMIOExtensionClient creation failed", v3, v4, v5, v6, 3u);
}

- (void)captureAsyncStillImage:message:.cold.1()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s xpc_dictionary_create_reply failedreply == NULL == true ", v2, v3, v4, v5, v6);
}

- (void)captureAsyncStillImage:message:.cold.2()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s cmio_XPCMessageCopyCFString failedtrue == true ", v2, v3, v4, v5, v6);
}

- (void)captureAsyncStillImage:message:.cold.3()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s cmio_XPCMessageCopyCFNumber failedtrue == true ", v2, v3, v4, v5, v6);
}

- (void)captureAsyncStillImage:message:.cold.4()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s cmio_XPCMessageCopyCFDictionary failedtrue == true ", v2, v3, v4, v5, v6);
}

void __63__CMIOExtensionProviderContext_captureAsyncStillImage_message___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s captureAsyncStillImage failed %{public}@", v2, v3, v4, v5, v6);
}

- (void)updateNonStreamingProxyFrontedExtensionPIDs:message:.cold.1()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  [*v0 pid];
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_8_0(&dword_2432B6000, v1, v2, "%s:%d:%s [%{private}d] empty array of pids", v3, v4, v5, v6, 3u);
}

- (void)updateNonStreamingProxyFrontedExtensionPIDs:message:.cold.2()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  [*v0 pid];
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_8_0(&dword_2432B6000, v1, v2, "%s:%d:%s [%{private}d] invalid connection for this message", v3, v4, v5, v6, 3u);
}

- (void)enqueueReactionEffect:message:.cold.1()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s xpc_dictionary_create_reply failedreply == NULL == true ", v2, v3, v4, v5, v6);
}

- (void)enqueueReactionEffect:message:.cold.2()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s cmio_XPCMessageCopyCFString failedtrue == true ", v2, v3, v4, v5, v6);
}

- (void)enqueueReactionEffect:message:.cold.3()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s cmio_XPCMessageCopyCFString failedtrue == true ", v2, v3, v4, v5, v6);
}

void __62__CMIOExtensionProviderContext_enqueueReactionEffect_message___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s enqueueReactionEffect failed %{public}@", v2, v3, v4, v5, v6);
}

- (void)pluginPropertiesChanged:.cold.1()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s copyXPCDictionaryFromPropertyStates failedparam1 == NULL == true ", v2, v3, v4, v5, v6);
}

- (void)availableDevicesChanged:.cold.1()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s Error: %ld, cmio_XPCMessageSetCFArray failed", v2, v3, v4, v5, v6);
}

- (void)devicePropertiesChangedWithDeviceID:propertyStates:.cold.1()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s copyXPCDictionaryFromPropertyStates failedparam2 == NULL == true ", v2, v3, v4, v5, v6);
}

- (void)devicePropertiesChangedWithDeviceID:propertyStates:.cold.2()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s Error: %ld, cmio_XPCMessageSetCFString failed", v2, v3, v4, v5, v6);
}

- (void)availableStreamsChangedWithDeviceID:streamIDs:.cold.1()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s Error: %ld, cmio_XPCMessageSetCFArray failed", v2, v3, v4, v5, v6);
}

- (void)availableStreamsChangedWithDeviceID:streamIDs:.cold.2()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s Error: %ld, cmio_XPCMessageSetCFString failed", v2, v3, v4, v5, v6);
}

- (void)streamPropertiesChangedWithStreamID:propertyStates:.cold.1()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s copyXPCDictionaryFromPropertyStates failedparam2 == NULL == true ", v2, v3, v4, v5, v6);
}

- (void)streamPropertiesChangedWithStreamID:propertyStates:.cold.2()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s Error: %ld, cmio_XPCMessageSetCFString failed", v2, v3, v4, v5, v6);
}

- (void)receivedSampleWithStreamID:sample:.cold.1()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s copyXPCDictionary failedparam3 == NULL == true ", v2, v3, v4, v5, v6);
}

- (void)receivedSampleWithStreamID:sample:.cold.2()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s Error: %ld, cmio_XPCMessageSetCFString failed", v2, v3, v4, v5, v6);
}

- (void)pullSampleBufferForStreamID:replyq:reply:.cold.1()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s Error: %ld, cmio_XPCMessageSetCFString failed", v2, v3, v4, v5, v6);
}

void __73__CMIOExtensionProviderContext_pullSampleBufferForStreamID_replyq_reply___block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = OUTLINED_FUNCTION_3(a1, 4.8153e-34, a2, a3);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  *(void *)(v6 + 20) = "-[CMIOExtensionProviderContext pullSampleBufferForStreamID:replyq:reply:]_block_invoke";
  *(_WORD *)(v6 + 28) = 2112;
  *(void *)(v6 + 30) = v7;
  OUTLINED_FUNCTION_8(&dword_2432B6000, "%s:%d:%s exception %@", v8, v9);
}

void __73__CMIOExtensionProviderContext_pullSampleBufferForStreamID_replyq_reply___block_invoke_cold_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = OUTLINED_FUNCTION_3(a1, 4.8153e-34, a2, a3);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_5_0(v6, v7, v8);
  OUTLINED_FUNCTION_8(&dword_2432B6000, "%s:%d:%s received %{public}@", v9, v10);
}

void __73__CMIOExtensionProviderContext_pullSampleBufferForStreamID_replyq_reply___block_invoke_cold_3(uint64_t a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 136315650;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 1024;
  *(_DWORD *)(buf + 14) = 1280;
  *((_WORD *)buf + 9) = 2080;
  *(void *)(buf + 20) = "-[CMIOExtensionProviderContext pullSampleBufferForStreamID:replyq:reply:]_block_invoke";
  _os_log_error_impl(&dword_2432B6000, log, OS_LOG_TYPE_ERROR, "%s:%d:%s CMIOExtensionSample alloc failed", buf, 0x1Cu);
}

void __73__CMIOExtensionProviderContext_pullSampleBufferForStreamID_replyq_reply___block_invoke_cold_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = OUTLINED_FUNCTION_3(a1, 4.8153e-34, a2, a3);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_5_0(v6, v7, v8);
  OUTLINED_FUNCTION_8(&dword_2432B6000, "%s:%d:%s unknown type %{public}@", v9, v10);
}

- (void)streamScheduledOutputChangedWithStreamID:scheduledOutput:.cold.1()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s copyXPCDictionary failedparam2 == NULL == true ", v2, v3, v4, v5, v6);
}

- (void)streamScheduledOutputChangedWithStreamID:scheduledOutput:.cold.2()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s Error: %ld, cmio_XPCMessageSetCFString failed", v2, v3, v4, v5, v6);
}

@end