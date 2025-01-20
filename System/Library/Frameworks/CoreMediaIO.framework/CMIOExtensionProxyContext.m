@interface CMIOExtensionProxyContext
- (BOOL)hasCameraAttribution;
- (BOOL)isInvalidated;
- (CMIOExtensionClient)clientInfo;
- (CMIOExtensionProxyContext)initWithConnection:(id)a3 serverConnection:(id)a4 queue:(id)a5 delegate:(id)a6;
- (CMIOExtensionProxyContextDelegate)delegate;
- (OS_dispatch_queue)queue;
- (OS_xpc_object)connection;
- (OS_xpc_object)serverConnection;
- (id)description;
- (id)redactedDescription;
- (int)activeStreams;
- (void)dealloc;
- (void)handleClientMessageWithConnection:(id)a3 message:(id)a4;
- (void)handleServerMessageWithConnection:(id)a3 message:(id)a4;
- (void)invalidate;
- (void)receivedSample:(id)a3 message:(id)a4;
- (void)sendClientInfo;
@end

@implementation CMIOExtensionProxyContext

- (CMIOExtensionProxyContext)initWithConnection:(id)a3 serverConnection:(id)a4 queue:(id)a5 delegate:(id)a6
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (a3 && a4)
  {
    v28.receiver = self;
    v28.super_class = (Class)CMIOExtensionProxyContext;
    v10 = [(CMIOExtensionProxyContext *)&v28 init];
    v11 = v10;
    if (v10)
    {
      v10->_lock._os_unfair_lock_opaque = 0;
      v10->_transaction = (OS_os_transaction *)os_transaction_create();
      objc_storeWeak((id *)&v11->_delegate, a6);
      v11->_connection = (OS_xpc_object *)a3;
      v11->_serverConnection = (OS_xpc_object *)a4;
      v11->_deviceIDsByStreamID = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      v11->_hasCameraAttribution = 0;
      if (a5)
      {
        dispatch_queue_t v12 = (dispatch_queue_t)a5;
      }
      else
      {
        v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        global_queue = dispatch_get_global_queue(21, 0);
        dispatch_queue_t v12 = dispatch_queue_create_with_target_V2("com.apple.cmio.CMIOExtensionProxyContext", v13, global_queue);
      }
      v11->_queue = (OS_dispatch_queue *)v12;
      objc_initWeak(&location, v11);
      handler[0] = MEMORY[0x263EF8330];
      handler[1] = 3221225472;
      handler[2] = __80__CMIOExtensionProxyContext_initWithConnection_serverConnection_queue_delegate___block_invoke;
      handler[3] = &unk_26517C7C0;
      objc_copyWeak(&v26, &location);
      handler[4] = a4;
      xpc_connection_set_event_handler((xpc_connection_t)a4, handler);
      xpc_connection_set_target_queue((xpc_connection_t)a4, (dispatch_queue_t)v11->_queue);
      xpc_connection_activate((xpc_connection_t)a4);
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __80__CMIOExtensionProxyContext_initWithConnection_serverConnection_queue_delegate___block_invoke_22;
      v23[3] = &unk_26517C7C0;
      objc_copyWeak(&v24, &location);
      v23[4] = a3;
      xpc_connection_set_event_handler((xpc_connection_t)a3, v23);
      xpc_connection_set_target_queue((xpc_connection_t)a3, (dispatch_queue_t)v11->_queue);
      xpc_connection_activate((xpc_connection_t)a3);
      xpc_connection_get_audit_token();
      uint64_t pid = xpc_connection_get_pid((xpc_connection_t)a3);
      uint64_t v16 = [MEMORY[0x263F08C38] UUID];
      memset(buf, 0, 32);
      id v17 = +[CMIOExtensionProvider newActivityAttributionWithToken:buf];
      v18 = [CMIOExtensionClient alloc];
      memset(buf, 0, 32);
      v11->_clientInfo = [(CMIOExtensionClient *)v18 initWithPID:pid clientID:v16 auditToken:buf stAttribution:v17 isToProxy:1 isFromProxyExtensionManager:0];
      v11->_activeStreams = 0;
      v11->_description = (NSString *)[[NSString alloc] initWithFormat:@"<CMIOExtensionProxyContext: pid %u, ID %@, delegate %@>", pid, v16, a6];
      v11->_redactedDescription = (NSString *)[[NSString alloc] initWithFormat:@"<CMIOExtensionProxyContext: pid -, ID ->"];
      [(CMIOExtensionProxyContext *)v11 sendClientInfo];
      v19 = CMIOLog();
      v20 = v19;
      if (v19 && os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v21 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProxy.m");
        *(_DWORD *)buf = 136315907;
        *(void *)&buf[4] = v21;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 265;
        *(_WORD *)&buf[18] = 2080;
        *(void *)&buf[20] = "-[CMIOExtensionProxyContext initWithConnection:serverConnection:queue:delegate:]";
        *(_WORD *)&buf[28] = 2113;
        *(void *)&buf[30] = v11;
        _os_log_impl(&dword_2432B6000, v20, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{private}@", buf, 0x26u);
      }
      objc_destroyWeak(&v24);
      objc_destroyWeak(&v26);
      objc_destroyWeak(&location);
    }
  }
  else
  {

    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"Invalid argument"];
    return 0;
  }
  return v11;
}

void __80__CMIOExtensionProxyContext_initWithConnection_serverConnection_queue_delegate___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = MEMORY[0x245679950](a2);
  if (v5 == MEMORY[0x263EF8720])
  {
    v6 = CMIOLog();
    if (v6 && os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __80__CMIOExtensionProxyContext_initWithConnection_serverConnection_queue_delegate___block_invoke_cold_1(a1);
    }
    if (a2 == MEMORY[0x263EF86A0])
    {
      xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
    }
    else if (a2 == MEMORY[0x263EF86A8] && WeakRetained && !*((unsigned char *)WeakRetained + 49))
    {
      v7 = CMIOLog();
      if (v7)
      {
        v8 = v7;
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          int v9 = 136315907;
          v10 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProxy.m");
          __int16 v11 = 1024;
          int v12 = 210;
          __int16 v13 = 2080;
          v14 = "-[CMIOExtensionProxyContext initWithConnection:serverConnection:queue:delegate:]_block_invoke";
          __int16 v15 = 2113;
          uint64_t v16 = WeakRetained;
          _os_log_impl(&dword_2432B6000, v8, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{private}@, serverConnection is invalidated", (uint8_t *)&v9, 0x26u);
        }
      }
      [WeakRetained invalidate];
      [objc_loadWeak(WeakRetained + 7) proxyContextHasBeenInvalidated:WeakRetained];
    }
  }
  else if (v5 == MEMORY[0x263EF8708])
  {
    [WeakRetained handleServerMessageWithConnection:*(void *)(a1 + 32) message:a2];
  }
}

void __80__CMIOExtensionProxyContext_initWithConnection_serverConnection_queue_delegate___block_invoke_22(uint64_t a1, uint64_t a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = MEMORY[0x245679950](a2);
  if (v5 == MEMORY[0x263EF8720])
  {
    v6 = CMIOLog();
    if (v6 && os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __80__CMIOExtensionProxyContext_initWithConnection_serverConnection_queue_delegate___block_invoke_22_cold_1(a1);
    }
    if (a2 == MEMORY[0x263EF86A0])
    {
      xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
    }
    else if (a2 == MEMORY[0x263EF86A8] && WeakRetained && !*((unsigned char *)WeakRetained + 49))
    {
      v7 = CMIOLog();
      if (v7)
      {
        v8 = v7;
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          int v9 = 136315907;
          v10 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProxy.m");
          __int16 v11 = 1024;
          int v12 = 237;
          __int16 v13 = 2080;
          v14 = "-[CMIOExtensionProxyContext initWithConnection:serverConnection:queue:delegate:]_block_invoke";
          __int16 v15 = 2113;
          uint64_t v16 = WeakRetained;
          _os_log_impl(&dword_2432B6000, v8, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{private}@, connection is invalidated", (uint8_t *)&v9, 0x26u);
        }
      }
      [WeakRetained invalidate];
      [objc_loadWeak(WeakRetained + 7) proxyContextHasBeenInvalidated:WeakRetained];
    }
  }
  else if (v5 == MEMORY[0x263EF8708])
  {
    [WeakRetained handleClientMessageWithConnection:*(void *)(a1 + 32) message:a2];
  }
}

- (void)dealloc
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v3 = CMIOLog();
  if (v3)
  {
    v4 = v3;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315907;
      uint64_t v17 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProxy.m");
      __int16 v18 = 1024;
      int v19 = 272;
      __int16 v20 = 2080;
      v21 = "-[CMIOExtensionProxyContext dealloc]";
      __int16 v22 = 2113;
      v23 = self;
      _os_log_impl(&dword_2432B6000, v4, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{private}@", buf, 0x26u);
    }
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = objc_msgSend((id)-[CMIOExtensionClient stCameraCaptureAttributionsMap](self->_clientInfo, "stCameraCaptureAttributionsMap"), "allValues");
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(+[CMIOExtensionProxyAttribution sharedAttribution](CMIOExtensionProxyAttribution, "sharedAttribution"), "removeCameraAttribution:", *(void *)(*((void *)&v11 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
  objc_msgSend((id)-[CMIOExtensionClient stCameraCaptureAttributionsMap](self->_clientInfo, "stCameraCaptureAttributionsMap"), "removeAllObjects");
  if (self->_activeStreams >= 1)
  {
    [objc_loadWeak((id *)&self->_delegate) proxyStreamsHaveStopped:self->_activeStreams];
    self->_activeStreams = 0;
  }

  v10.receiver = self;
  v10.super_class = (Class)CMIOExtensionProxyContext;
  [(CMIOExtensionProxyContext *)&v10 dealloc];
}

- (id)description
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
  uint64_t v25 = *MEMORY[0x263EF8340];
  v3 = CMIOLog();
  if (v3)
  {
    v4 = v3;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315907;
      __int16 v18 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProxy.m");
      __int16 v19 = 1024;
      int v20 = 310;
      __int16 v21 = 2080;
      __int16 v22 = "-[CMIOExtensionProxyContext invalidate]";
      __int16 v23 = 2113;
      uint64_t v24 = self;
      _os_log_impl(&dword_2432B6000, v4, OS_LOG_TYPE_INFO, "%s:%d:%s %{private}@", buf, 0x26u);
    }
  }
  os_unfair_lock_lock(&self->_lock);
  if (self->_invalidated)
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    self->_invalidated = 1;
    os_unfair_lock_unlock(&self->_lock);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v5 = objc_msgSend((id)-[CMIOExtensionClient stCameraCaptureAttributionsMap](self->_clientInfo, "stCameraCaptureAttributionsMap", 0), "allValues");
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          objc_msgSend(+[CMIOExtensionProxyAttribution sharedAttribution](CMIOExtensionProxyAttribution, "sharedAttribution"), "removeCameraAttribution:", *(void *)(*((void *)&v12 + 1) + 8 * v9++));
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
    objc_msgSend((id)-[CMIOExtensionClient stCameraCaptureAttributionsMap](self->_clientInfo, "stCameraCaptureAttributionsMap"), "removeAllObjects");
    self->_hasCameraAttribution = 0;
    if (self->_activeStreams >= 1)
    {
      [objc_loadWeak((id *)&self->_delegate) proxyStreamsHaveStopped:self->_activeStreams];
      self->_activeStreams = 0;
    }
    connection = self->_connection;
    if (connection) {
      xpc_connection_cancel(connection);
    }
    serverConnection = self->_serverConnection;
    if (serverConnection) {
      xpc_connection_cancel(serverConnection);
    }

    self->_transaction = 0;
  }
}

- (void)sendClientInfo
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProxy.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s copyXPCDictionary failed", v2, v3, v4, v5, v6);
}

void __43__CMIOExtensionProxyContext_sendClientInfo__block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v3 = MEMORY[0x245679950](a2);
    if (v3 == MEMORY[0x263EF8720])
    {
      uint64_t v5 = CMIOLog();
      if (v5 && os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        __43__CMIOExtensionProxyContext_sendClientInfo__block_invoke_cold_1();
      }
    }
    else if (v3 == MEMORY[0x263EF8708])
    {
      int int64 = xpc_dictionary_get_int64(a2, "errorReturn");
      if (int64)
      {
        uint64_t v7 = CMIOLog();
        if (v7)
        {
          uint64_t v8 = v7;
          if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
            __43__CMIOExtensionProxyContext_sendClientInfo__block_invoke_cold_2(int64, v8);
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
          __43__CMIOExtensionProxyContext_sendClientInfo__block_invoke_cold_3();
        }
      }
    }
  }
}

- (void)receivedSample:(id)a3 message:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  CFTypeRef cf = 0;
  cmio_XPCMessageCopyCFString(a4, "param1", (NSObject **)&cf);
  if (cf)
  {
    int int64 = xpc_dictionary_get_int64(a4, "param2");
    if (!xpc_dictionary_get_value(a4, "param3"))
    {
      long long v11 = CMIOLog();
      if (v11 && os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[CMIOExtensionProxyContext receivedSample:message:]();
      }
      goto LABEL_39;
    }
    switch(int64)
    {
      case 1836415096:
        BOOL v12 = [(CMIOExtensionClient *)self->_clientInfo microphoneAuthorizationStatus] == 3
           && [(CMIOExtensionClient *)self->_clientInfo cameraAuthorizationStatus] == 3;
        BOOL v8 = [(CMIOExtensionClient *)self->_clientInfo microphoneAuthorizationStatus] == 0;
        BOOL v9 = [(CMIOExtensionClient *)self->_clientInfo cameraAuthorizationStatus] == 0;
        if (!v12)
        {
LABEL_25:
          long long v15 = CMIOLog();
          if (v15)
          {
            uint64_t v16 = v15;
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v17 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProxy.m");
              *(_DWORD *)buf = 136315650;
              uint64_t v25 = v17;
              __int16 v26 = 1024;
              int v27 = 423;
              __int16 v28 = 2080;
              v29 = "-[CMIOExtensionProxyContext receivedSample:message:]";
              _os_log_impl(&dword_2432B6000, v16, OS_LOG_TYPE_DEFAULT, "%s:%d:%s Not authorized", buf, 0x1Cu);
            }
          }
          __int16 v18 = (void *)MEMORY[0x245679360]();
          uint64_t v19 = [NSString stringWithString:cf];
          if (int64 != 1836415096)
          {
            if (int64 == 1986618469)
            {
LABEL_35:
              if (![(CMIOExtensionClient *)self->_clientInfo hasPendingCameraAuthorizationRequest]&& v9)
              {
                clientInfo = self->_clientInfo;
                v21[0] = MEMORY[0x263EF8330];
                v21[1] = 3221225472;
                v21[2] = __52__CMIOExtensionProxyContext_receivedSample_message___block_invoke_45;
                v21[3] = &unk_26517C828;
                v21[4] = self;
                v21[5] = v19;
                [(CMIOExtensionClient *)clientInfo requestAccessForMediaType:1986618469 reply:v21];
              }
              goto LABEL_38;
            }
            if (int64 != 1936684398)
            {
LABEL_38:
              goto LABEL_39;
            }
          }
          if (![(CMIOExtensionClient *)self->_clientInfo hasPendingMicrophoneAuthorizationRequest]&& v8)
          {
            [(CMIOExtensionClient *)self->_clientInfo requestAccessForMediaType:1936684398 reply:&__block_literal_global_44];
          }
          if (int64 != 1836415096) {
            goto LABEL_38;
          }
          goto LABEL_35;
        }
        break;
      case 1986618469:
        int64_t v13 = [(CMIOExtensionClient *)self->_clientInfo cameraAuthorizationStatus];
        BOOL v9 = [(CMIOExtensionClient *)self->_clientInfo cameraAuthorizationStatus] == 0;
        if (v13 != 3) {
          goto LABEL_19;
        }
        break;
      case 1936684398:
        int64_t v7 = [(CMIOExtensionClient *)self->_clientInfo microphoneAuthorizationStatus];
        BOOL v8 = [(CMIOExtensionClient *)self->_clientInfo microphoneAuthorizationStatus] == 0;
        if (v7 != 3)
        {
          BOOL v9 = 0;
          goto LABEL_25;
        }
LABEL_24:
        xpc_object_t v14 = xpc_dictionary_create(0, 0, 0);
        applier[0] = MEMORY[0x263EF8330];
        applier[1] = 3221225472;
        applier[2] = __52__CMIOExtensionProxyContext_receivedSample_message___block_invoke;
        applier[3] = &unk_26517C598;
        applier[4] = v14;
        xpc_dictionary_apply(a4, applier);
        xpc_connection_send_message(self->_connection, v14);
        xpc_release(v14);
LABEL_39:
        CFRelease(cf);
        return;
      default:
        BOOL v9 = 0;
LABEL_19:
        BOOL v8 = 0;
        goto LABEL_25;
    }
    if (!self->_hasCameraAttribution) {
      [(CMIOExtensionProxyContext *)self _addCameraAttribution:cf];
    }
    goto LABEL_24;
  }
  objc_super v10 = CMIOLog();
  if (v10 && os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    -[CMIOExtensionProxyContext receivedSample:message:]();
  }
}

uint64_t __52__CMIOExtensionProxyContext_receivedSample_message___block_invoke(uint64_t a1, const char *a2, void *a3)
{
  return 1;
}

void __52__CMIOExtensionProxyContext_receivedSample_message___block_invoke_41(uint64_t a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v3 = CMIOLog();
  if (v3)
  {
    uint64_t v4 = v3;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315906;
      int64_t v7 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProxy.m");
      if (a2 == 3) {
        int v5 = 89;
      }
      else {
        int v5 = 78;
      }
      __int16 v8 = 1024;
      int v9 = 429;
      __int16 v10 = 2080;
      long long v11 = "-[CMIOExtensionProxyContext receivedSample:message:]_block_invoke";
      __int16 v12 = 1024;
      int v13 = v5;
      _os_log_impl(&dword_2432B6000, v4, OS_LOG_TYPE_DEFAULT, "%s:%d:%s Authorized microphone %c", (uint8_t *)&v6, 0x22u);
    }
  }
}

void __52__CMIOExtensionProxyContext_receivedSample_message___block_invoke_45(uint64_t a1, uint64_t a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v4 = CMIOLog();
  if (v4)
  {
    int v5 = v4;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315906;
      int v9 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProxy.m");
      if (a2 == 3) {
        int v6 = 89;
      }
      else {
        int v6 = 78;
      }
      __int16 v10 = 1024;
      int v11 = 437;
      __int16 v12 = 2080;
      int v13 = "-[CMIOExtensionProxyContext receivedSample:message:]_block_invoke";
      __int16 v14 = 1024;
      int v15 = v6;
      _os_log_impl(&dword_2432B6000, v5, OS_LOG_TYPE_DEFAULT, "%s:%d:%s Authorized camera %c", (uint8_t *)&v8, 0x22u);
    }
  }
  if (a2 == 3)
  {
    int64_t v7 = *(unsigned char **)(a1 + 32);
    if (!v7[48]) {
      [v7 _addCameraAttribution:*(void *)(a1 + 40)];
    }
  }
}

- (void)handleClientMessageWithConnection:(id)a3 message:(id)a4
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  uint int64 = xpc_dictionary_get_uint64(a4, "MessageType");
  if (CMIOModuleLogLevel_once_0 != -1) {
    dispatch_once(&CMIOModuleLogLevel_once_0, &__block_literal_global_195);
  }
  if (CMIOModuleLogLevel_cmioLevel_0 >= 1)
  {
    int v8 = CMIOLog();
    if (v8)
    {
      int v9 = v8;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316163;
        *(void *)&uint8_t buf[4] = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProxy.m");
        __int16 v33 = 1024;
        int v34 = 457;
        __int16 v35 = 2080;
        v36 = "-[CMIOExtensionProxyContext handleClientMessageWithConnection:message:]";
        __int16 v37 = 2113;
        v38 = self;
        __int16 v39 = 2048;
        uint64_t v40 = uint64;
        _os_log_impl(&dword_2432B6000, v9, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{private}@ %lld", buf, 0x30u);
      }
    }
  }
  switch(uint64)
  {
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 0xAuLL:
    case 0xBuLL:
    case 0xCuLL:
    case 0xDuLL:
    case 0x14uLL:
    case 0x15uLL:
    case 0x16uLL:
      xpc_object_t reply = xpc_dictionary_create_reply(a4);
      if (reply)
      {
        serverConnection = self->_serverConnection;
        queue = self->_queue;
        handler[0] = MEMORY[0x263EF8330];
        handler[1] = 3221225472;
        handler[2] = __71__CMIOExtensionProxyContext_handleClientMessageWithConnection_message___block_invoke;
        handler[3] = &unk_26517C850;
        handler[4] = reply;
        void handler[5] = a3;
        int v13 = handler;
        goto LABEL_10;
      }
      __int16 v14 = CMIOLog();
      if (v14)
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          -[CMIOExtensionProxyContext handleClientMessageWithConnection:message:]();
        }
      }
      break;
    case 5uLL:
      xpc_object_t v15 = xpc_dictionary_create_reply(a4);
      if (v15)
      {
        uint64_t v16 = v15;
        xpc_dictionary_set_int64(v15, "errorReturn", 0);
        xpc_connection_send_message((xpc_connection_t)a3, v16);
        xpc_release(v16);
      }
      else
      {
        __int16 v23 = CMIOLog();
        if (v23 && os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          -[CMIOExtensionProxyContext handleClientMessageWithConnection:message:].cold.7();
        }
      }
      break;
    case 0x17uLL:
      xpc_object_t v17 = xpc_dictionary_create_reply(a4);
      if (v17)
      {
        serverConnection = self->_serverConnection;
        queue = self->_queue;
        v30[0] = MEMORY[0x263EF8330];
        v30[1] = 3221225472;
        v30[2] = __71__CMIOExtensionProxyContext_handleClientMessageWithConnection_message___block_invoke_48;
        v30[3] = &unk_26517C878;
        v30[4] = v17;
        v30[5] = self;
        v30[6] = a3;
        int v13 = v30;
        goto LABEL_10;
      }
      uint64_t v24 = CMIOLog();
      if (v24 && os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        -[CMIOExtensionProxyContext handleClientMessageWithConnection:message:]();
      }
      break;
    case 0x18uLL:
      *(void *)buf = 0;
      cmio_XPCMessageCopyCFString(a4, "param1", (NSObject **)buf);
      if (*(void *)buf)
      {
        uint64_t v19 = (__CFString *)-[NSMutableDictionary objectForKeyedSubscript:](self->_deviceIDsByStreamID, "objectForKeyedSubscript:");
        if (v19)
        {
          uint64_t STCameraCaptureAttributionMapKey = cmio_getSTCameraCaptureAttributionMapKey(v19, *(__CFString **)buf);
          objc_msgSend(+[CMIOExtensionProxyAttribution sharedAttribution](CMIOExtensionProxyAttribution, "sharedAttribution"), "removeCameraAttribution:", objc_msgSend((id)-[CMIOExtensionClient stCameraCaptureAttributionsMap](self->_clientInfo, "stCameraCaptureAttributionsMap"), "objectForKeyedSubscript:", STCameraCaptureAttributionMapKey));
          objc_msgSend((id)-[CMIOExtensionClient stCameraCaptureAttributionsMap](self->_clientInfo, "stCameraCaptureAttributionsMap"), "removeObjectForKey:", STCameraCaptureAttributionMapKey);
          [(NSMutableDictionary *)self->_deviceIDsByStreamID removeObjectForKey:*(void *)buf];
          self->_hasCameraAttribution = 0;
        }
        CFRelease(*(CFTypeRef *)buf);
        xpc_object_t v21 = xpc_dictionary_create_reply(a4);
        if (v21)
        {
          serverConnection = self->_serverConnection;
          queue = self->_queue;
          v29[0] = MEMORY[0x263EF8330];
          v29[1] = 3221225472;
          v29[2] = __71__CMIOExtensionProxyContext_handleClientMessageWithConnection_message___block_invoke_50;
          v29[3] = &unk_26517C878;
          v29[4] = v21;
          v29[5] = self;
          v29[6] = a3;
          int v13 = v29;
          goto LABEL_10;
        }
        int v27 = CMIOLog();
        if (v27 && os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
          -[CMIOExtensionProxyContext handleClientMessageWithConnection:message:].cold.5();
        }
      }
      else
      {
        uint64_t v25 = CMIOLog();
        if (v25 && os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          -[CMIOExtensionProxyContext handleClientMessageWithConnection:message:].cold.4();
        }
      }
      break;
    case 0x19uLL:

      self->_transaction = 0;
      xpc_object_t v22 = xpc_dictionary_create_reply(a4);
      if (v22)
      {
        serverConnection = self->_serverConnection;
        queue = self->_queue;
        v28[0] = MEMORY[0x263EF8330];
        v28[1] = 3221225472;
        v28[2] = __71__CMIOExtensionProxyContext_handleClientMessageWithConnection_message___block_invoke_52;
        v28[3] = &unk_26517C850;
        v28[4] = v22;
        v28[5] = a3;
        int v13 = v28;
LABEL_10:
        xpc_connection_send_message_with_reply(serverConnection, a4, queue, v13);
      }
      else
      {
        __int16 v26 = CMIOLog();
        if (v26 && os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
          -[CMIOExtensionProxyContext handleClientMessageWithConnection:message:].cold.6();
        }
      }
      break;
    default:
      __int16 v18 = CMIOLog();
      if (v18 && os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[CMIOExtensionProxyContext handleClientMessageWithConnection:message:]();
      }
      break;
  }
}

void __71__CMIOExtensionProxyContext_handleClientMessageWithConnection_message___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = MEMORY[0x245679950](a2);
  if (v4 == MEMORY[0x263EF8720])
  {
    int v6 = CMIOLog();
    if (v6 && os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __71__CMIOExtensionProxyContext_handleClientMessageWithConnection_message___block_invoke_cold_1();
    }
  }
  else
  {
    if (v4 == MEMORY[0x263EF8708])
    {
      applier[0] = MEMORY[0x263EF8330];
      applier[1] = 3221225472;
      applier[2] = __71__CMIOExtensionProxyContext_handleClientMessageWithConnection_message___block_invoke_46;
      applier[3] = &unk_26517C598;
      applier[4] = *(void *)(a1 + 32);
      xpc_dictionary_apply(a2, applier);
      goto LABEL_11;
    }
    int v5 = CMIOLog();
    if (v5 && os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __71__CMIOExtensionProxyContext_handleClientMessageWithConnection_message___block_invoke_cold_2();
    }
  }
  xpc_dictionary_set_int64(*(xpc_object_t *)(a1 + 32), "errorReturn", -7);
LABEL_11:
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 32));
  xpc_release(*(xpc_object_t *)(a1 + 32));
}

uint64_t __71__CMIOExtensionProxyContext_handleClientMessageWithConnection_message___block_invoke_46(uint64_t a1, const char *a2, void *a3)
{
  return 1;
}

void __71__CMIOExtensionProxyContext_handleClientMessageWithConnection_message___block_invoke_48(uint64_t a1, void *a2)
{
  uint64_t v4 = MEMORY[0x245679950](a2);
  if (v4 == MEMORY[0x263EF8720])
  {
    int v6 = CMIOLog();
    if (v6 && os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __71__CMIOExtensionProxyContext_handleClientMessageWithConnection_message___block_invoke_48_cold_1();
    }
  }
  else
  {
    if (v4 == MEMORY[0x263EF8708])
    {
      ++*(_DWORD *)(*(void *)(a1 + 40) + 52);
      [objc_loadWeak((id *)(*(void *)(a1 + 40) + 56)) proxyStreamHasStarted];
      applier[0] = MEMORY[0x263EF8330];
      applier[1] = 3221225472;
      applier[2] = __71__CMIOExtensionProxyContext_handleClientMessageWithConnection_message___block_invoke_49;
      applier[3] = &unk_26517C598;
      applier[4] = *(void *)(a1 + 32);
      xpc_dictionary_apply(a2, applier);
      goto LABEL_11;
    }
    int v5 = CMIOLog();
    if (v5 && os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __71__CMIOExtensionProxyContext_handleClientMessageWithConnection_message___block_invoke_48_cold_2();
    }
  }
  xpc_dictionary_set_int64(*(xpc_object_t *)(a1 + 32), "errorReturn", -7);
LABEL_11:
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 48), *(xpc_object_t *)(a1 + 32));
  xpc_release(*(xpc_object_t *)(a1 + 32));
}

uint64_t __71__CMIOExtensionProxyContext_handleClientMessageWithConnection_message___block_invoke_49(uint64_t a1, const char *a2, void *a3)
{
  return 1;
}

void __71__CMIOExtensionProxyContext_handleClientMessageWithConnection_message___block_invoke_50(uint64_t a1, void *a2)
{
  uint64_t v4 = MEMORY[0x245679950](a2);
  if (v4 == MEMORY[0x263EF8720])
  {
    int v6 = CMIOLog();
    if (v6 && os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __71__CMIOExtensionProxyContext_handleClientMessageWithConnection_message___block_invoke_50_cold_1();
    }
    goto LABEL_9;
  }
  if (v4 != MEMORY[0x263EF8708])
  {
    int v5 = CMIOLog();
    if (v5 && os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __71__CMIOExtensionProxyContext_handleClientMessageWithConnection_message___block_invoke_50_cold_2();
    }
LABEL_9:
    xpc_dictionary_set_int64(*(xpc_object_t *)(a1 + 32), "errorReturn", -7);
    goto LABEL_13;
  }
  uint64_t v7 = *(void *)(a1 + 40);
  if (*(int *)(v7 + 52) >= 1)
  {
    [objc_loadWeak((id *)(v7 + 56)) proxyStreamsHaveStopped:1];
    --*(_DWORD *)(*(void *)(a1 + 40) + 52);
  }
  applier[0] = MEMORY[0x263EF8330];
  applier[1] = 3221225472;
  applier[2] = __71__CMIOExtensionProxyContext_handleClientMessageWithConnection_message___block_invoke_51;
  applier[3] = &unk_26517C598;
  applier[4] = *(void *)(a1 + 32);
  xpc_dictionary_apply(a2, applier);
LABEL_13:
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 48), *(xpc_object_t *)(a1 + 32));
  xpc_release(*(xpc_object_t *)(a1 + 32));
}

uint64_t __71__CMIOExtensionProxyContext_handleClientMessageWithConnection_message___block_invoke_51(uint64_t a1, const char *a2, void *a3)
{
  return 1;
}

void __71__CMIOExtensionProxyContext_handleClientMessageWithConnection_message___block_invoke_52(uint64_t a1, void *a2)
{
  uint64_t v4 = MEMORY[0x245679950](a2);
  if (v4 == MEMORY[0x263EF8720])
  {
    int v6 = CMIOLog();
    if (v6 && os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __71__CMIOExtensionProxyContext_handleClientMessageWithConnection_message___block_invoke_52_cold_1();
    }
  }
  else
  {
    if (v4 == MEMORY[0x263EF8708])
    {
      applier[0] = MEMORY[0x263EF8330];
      applier[1] = 3221225472;
      applier[2] = __71__CMIOExtensionProxyContext_handleClientMessageWithConnection_message___block_invoke_53;
      applier[3] = &unk_26517C598;
      applier[4] = *(void *)(a1 + 32);
      xpc_dictionary_apply(a2, applier);
      goto LABEL_11;
    }
    int v5 = CMIOLog();
    if (v5 && os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __71__CMIOExtensionProxyContext_handleClientMessageWithConnection_message___block_invoke_52_cold_2();
    }
  }
  xpc_dictionary_set_int64(*(xpc_object_t *)(a1 + 32), "errorReturn", -7);
LABEL_11:
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 32));
  xpc_release(*(xpc_object_t *)(a1 + 32));
}

uint64_t __71__CMIOExtensionProxyContext_handleClientMessageWithConnection_message___block_invoke_53(uint64_t a1, const char *a2, void *a3)
{
  return 1;
}

- (void)handleServerMessageWithConnection:(id)a3 message:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  uint int64 = xpc_dictionary_get_uint64(a4, "MessageType");
  if (CMIOModuleLogLevel_once_0 != -1) {
    dispatch_once(&CMIOModuleLogLevel_once_0, &__block_literal_global_195);
  }
  if (CMIOModuleLogLevel_cmioLevel_0 >= 1)
  {
    int v8 = CMIOLog();
    if (v8)
    {
      int v9 = v8;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316163;
        uint64_t v24 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProxy.m");
        __int16 v25 = 1024;
        int v26 = 620;
        __int16 v27 = 2080;
        __int16 v28 = "-[CMIOExtensionProxyContext handleServerMessageWithConnection:message:]";
        __int16 v29 = 2113;
        uint64_t v30 = self;
        __int16 v31 = 2048;
        uint64_t v32 = uint64;
        _os_log_impl(&dword_2432B6000, v9, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{private}@ %lld", buf, 0x30u);
      }
    }
  }
  uint64_t v10 = MEMORY[0x263EF8708];
  switch(uint64)
  {
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 4uLL:
      if (MEMORY[0x245679950](a4) == v10)
      {
        xpc_object_t dictionary = xpc_dictionary_get_dictionary(a4, "param2");
        if (dictionary)
        {
          id v12 = +[CMIOExtensionPropertyState copyPropertyStatesFromXPCDictionary:dictionary];
          if (objc_msgSend((id)objc_msgSend(v12, "allKeys"), "containsObject:", 0x26F89C4D0)
            && objc_msgSend((id)objc_msgSend(v12, "allKeys"), "containsObject:", 0x26F89C4F0)
            && objc_msgSend((id)objc_msgSend(v12, "allKeys"), "containsObject:", 0x26F89C470)
            && objc_msgSend((id)objc_msgSend((id)objc_msgSend(v12, "objectForKeyedSubscript:", 0x26F89C4D0), "value"), "intValue"))
          {
            int v13 = (void *)[v12 objectForKeyedSubscript:0x26F89C4F0];
            __int16 v14 = (void *)[v12 objectForKeyedSubscript:0x26F89C490];
            if (!v14) {
              __int16 v14 = (void *)[v12 objectForKeyedSubscript:0x26F89C470];
            }
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_deviceIDsByStreamID, "setObject:forKeyedSubscript:", [v14 value], objc_msgSend(v13, "value"));
          }
        }
      }
      goto LABEL_18;
    case 5uLL:
    case 9uLL:
LABEL_18:
      if (MEMORY[0x245679950](a4) == v10)
      {
        xpc_object_t v15 = xpc_dictionary_create(0, 0, 0);
        applier[0] = MEMORY[0x263EF8330];
        applier[1] = 3221225472;
        applier[2] = __71__CMIOExtensionProxyContext_handleServerMessageWithConnection_message___block_invoke;
        applier[3] = &unk_26517C598;
        applier[4] = v15;
        xpc_dictionary_apply(a4, applier);
        xpc_connection_send_message(self->_connection, v15);
        xpc_release(v15);
      }
      break;
    case 7uLL:
      [(CMIOExtensionProxyContext *)self receivedSample:a3 message:a4];
      break;
    case 8uLL:
      xpc_object_t reply = xpc_dictionary_create_reply(a4);
      if (reply)
      {
        connection = self->_connection;
        queue = self->_queue;
        handler[0] = MEMORY[0x263EF8330];
        handler[1] = 3221225472;
        handler[2] = __71__CMIOExtensionProxyContext_handleServerMessageWithConnection_message___block_invoke_55;
        handler[3] = &unk_26517C850;
        handler[4] = reply;
        void handler[5] = a3;
        xpc_connection_send_message_with_reply(connection, a4, queue, handler);
      }
      else
      {
        int v20 = CMIOLog();
        if (v20 && os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          -[CMIOExtensionProxyContext handleServerMessageWithConnection:message:]();
        }
      }
      break;
    default:
      uint64_t v16 = CMIOLog();
      if (v16 && os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[CMIOExtensionProxyContext handleServerMessageWithConnection:message:]();
      }
      break;
  }
}

uint64_t __71__CMIOExtensionProxyContext_handleServerMessageWithConnection_message___block_invoke(uint64_t a1, const char *a2, void *a3)
{
  return 1;
}

void __71__CMIOExtensionProxyContext_handleServerMessageWithConnection_message___block_invoke_55(uint64_t a1, void *a2)
{
  uint64_t v4 = MEMORY[0x245679950](a2);
  if (v4 == MEMORY[0x263EF8720])
  {
    int v6 = CMIOLog();
    if (v6 && os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __71__CMIOExtensionProxyContext_handleServerMessageWithConnection_message___block_invoke_55_cold_1();
    }
  }
  else
  {
    if (v4 == MEMORY[0x263EF8708])
    {
      applier[0] = MEMORY[0x263EF8330];
      applier[1] = 3221225472;
      applier[2] = __71__CMIOExtensionProxyContext_handleServerMessageWithConnection_message___block_invoke_56;
      applier[3] = &unk_26517C598;
      applier[4] = *(void *)(a1 + 32);
      xpc_dictionary_apply(a2, applier);
      goto LABEL_11;
    }
    int v5 = CMIOLog();
    if (v5 && os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __71__CMIOExtensionProxyContext_handleServerMessageWithConnection_message___block_invoke_55_cold_2();
    }
  }
  xpc_dictionary_set_int64(*(xpc_object_t *)(a1 + 32), "errorReturn", -7);
LABEL_11:
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 32));
  xpc_release(*(xpc_object_t *)(a1 + 32));
}

uint64_t __71__CMIOExtensionProxyContext_handleServerMessageWithConnection_message___block_invoke_56(uint64_t a1, const char *a2, void *a3)
{
  return 1;
}

- (BOOL)hasCameraAttribution
{
  return self->_hasCameraAttribution;
}

- (CMIOExtensionProxyContextDelegate)delegate
{
  return (CMIOExtensionProxyContextDelegate *)objc_loadWeak((id *)&self->_delegate);
}

- (OS_xpc_object)connection
{
  return self->_connection;
}

- (OS_xpc_object)serverConnection
{
  return self->_serverConnection;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (CMIOExtensionClient)clientInfo
{
  return self->_clientInfo;
}

- (int)activeStreams
{
  return self->_activeStreams;
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (void).cxx_destruct
{
}

void __80__CMIOExtensionProxyContext_initWithConnection_serverConnection_queue_delegate___block_invoke_cold_1(uint64_t a1)
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProxy.m");
  xpc_connection_get_pid(*(xpc_connection_t *)(a1 + 32));
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_23(&dword_2432B6000, v2, v3, "%s:%d:%s [%d] received %{public}@", v4, v5, v6, v7, v8);
}

void __80__CMIOExtensionProxyContext_initWithConnection_serverConnection_queue_delegate___block_invoke_22_cold_1(uint64_t a1)
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProxy.m");
  xpc_connection_get_pid(*(xpc_connection_t *)(a1 + 32));
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_23(&dword_2432B6000, v2, v3, "%s:%d:%s [%d] received %{public}@", v4, v5, v6, v7, v8);
}

void __43__CMIOExtensionProxyContext_sendClientInfo__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProxy.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s received %{public}@", v2, v3, v4, v5, v6);
}

void __43__CMIOExtensionProxyContext_sendClientInfo__block_invoke_cold_2(int a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProxy.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  uint8_t v6 = "-[CMIOExtensionProxyContext sendClientInfo]_block_invoke";
  __int16 v7 = v4;
  int v8 = a1;
  _os_log_error_impl(&dword_2432B6000, a2, OS_LOG_TYPE_ERROR, "%s:%d:%s error %d", v5, 0x22u);
}

void __43__CMIOExtensionProxyContext_sendClientInfo__block_invoke_cold_3()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProxy.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s unknown type %{public}@", v2, v3, v4, v5, v6);
}

- (void)receivedSample:message:.cold.1()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProxy.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s cmio_XPCMessageCopyCFString failedstreamID == NULL == true ", v2, v3, v4, v5, v6);
}

- (void)receivedSample:message:.cold.2()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProxy.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s xpc_dictionary_get_value failed", v2, v3, v4, v5, v6);
}

- (void)handleClientMessageWithConnection:message:.cold.1()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProxy.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s Unknown message type %lld", v2, v3, v4, v5, v6);
}

- (void)handleClientMessageWithConnection:message:.cold.2()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProxy.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s xpc_dictionary_create_reply failedreply == NULL == true ", v2, v3, v4, v5, v6);
}

- (void)handleClientMessageWithConnection:message:.cold.3()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProxy.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s xpc_dictionary_create_reply failedreply == NULL == true ", v2, v3, v4, v5, v6);
}

- (void)handleClientMessageWithConnection:message:.cold.4()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProxy.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s cmio_XPCMessageCopyCFString failedstreamID == NULL == true ", v2, v3, v4, v5, v6);
}

- (void)handleClientMessageWithConnection:message:.cold.5()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProxy.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s xpc_dictionary_create_reply failedreply == NULL == true ", v2, v3, v4, v5, v6);
}

- (void)handleClientMessageWithConnection:message:.cold.6()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProxy.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s xpc_dictionary_create_reply failedreply == NULL == true ", v2, v3, v4, v5, v6);
}

- (void)handleClientMessageWithConnection:message:.cold.7()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProxy.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s xpc_dictionary_create_reply failed", v2, v3, v4, v5, v6);
}

void __71__CMIOExtensionProxyContext_handleClientMessageWithConnection_message___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProxy.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s received %{public}@", v2, v3, v4, v5, v6);
}

void __71__CMIOExtensionProxyContext_handleClientMessageWithConnection_message___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProxy.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s unknown type %{public}@", v2, v3, v4, v5, v6);
}

void __71__CMIOExtensionProxyContext_handleClientMessageWithConnection_message___block_invoke_48_cold_1()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProxy.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s received %{public}@", v2, v3, v4, v5, v6);
}

void __71__CMIOExtensionProxyContext_handleClientMessageWithConnection_message___block_invoke_48_cold_2()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProxy.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s unknown type %{public}@", v2, v3, v4, v5, v6);
}

void __71__CMIOExtensionProxyContext_handleClientMessageWithConnection_message___block_invoke_50_cold_1()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProxy.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s received %{public}@", v2, v3, v4, v5, v6);
}

void __71__CMIOExtensionProxyContext_handleClientMessageWithConnection_message___block_invoke_50_cold_2()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProxy.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s unknown type %{public}@", v2, v3, v4, v5, v6);
}

void __71__CMIOExtensionProxyContext_handleClientMessageWithConnection_message___block_invoke_52_cold_1()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProxy.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s received %{public}@", v2, v3, v4, v5, v6);
}

void __71__CMIOExtensionProxyContext_handleClientMessageWithConnection_message___block_invoke_52_cold_2()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProxy.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s unknown type %{public}@", v2, v3, v4, v5, v6);
}

- (void)handleServerMessageWithConnection:message:.cold.1()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProxy.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s Unknown message type %lld", v2, v3, v4, v5, v6);
}

- (void)handleServerMessageWithConnection:message:.cold.2()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProxy.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s xpc_dictionary_create_reply failedreplyServer == NULL == true ", v2, v3, v4, v5, v6);
}

void __71__CMIOExtensionProxyContext_handleServerMessageWithConnection_message___block_invoke_55_cold_1()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProxy.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s received %{public}@", v2, v3, v4, v5, v6);
}

void __71__CMIOExtensionProxyContext_handleServerMessageWithConnection_message___block_invoke_55_cold_2()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProxy.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s unknown type %{public}@", v2, v3, v4, v5, v6);
}

@end