@interface AXUIClient
- (AXUIClient)initWithIdentifier:(id)a3 serviceBundleName:(id)a4;
- (AXUIClientConnection)clientConnection;
- (AXUIClientDelegate)delegate;
- (AXUIMessageSender)messageSender;
- (BOOL)isRegisteredWithServer;
- (NSDictionary)initializationMessage;
- (NSString)clientIdentifier;
- (NSString)description;
- (NSString)serviceBundleName;
- (id)sendSynchronousMessage:(id)a3 withIdentifier:(unint64_t)a4 error:(id *)a5;
- (void)_cleanUp;
- (void)_requestInitializationMessageFromDelegateIfNeeded;
- (void)clientConnection:(id)a3 didChangeConnectedState:(BOOL)a4;
- (void)dealloc;
- (void)invalidate:(id)a3;
- (void)messageSender:(id)a3 accessLaunchAngelConnectionForMessageWithContext:(void *)a4 usingBlock:(id)a5;
- (void)messageSender:(id)a3 extractCustomDataFromXPCReply:(id)a4 numberOfKeyValuePairsForCustomData:(unint64_t *)a5;
- (void)messageSender:(id)a3 processCustomDataFromXPCReply:(void *)a4;
- (void)messageSender:(id)a3 willSendXPCMessage:(id)a4 context:(void *)a5;
- (void)sendAsynchronousMessage:(id)a3 withIdentifier:(unint64_t)a4 targetAccessQueue:(id)a5 completion:(id)a6;
- (void)sendAsynchronousMessage:(id)a3 withIdentifier:(unint64_t)a4 targetAccessQueue:(id)a5 completionRequiresWritingBlock:(BOOL)a6 completion:(id)a7;
- (void)setClientConnection:(id)a3;
- (void)setClientIdentifier:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setInitializationMessage:(id)a3;
- (void)setMessageSender:(id)a3;
- (void)setRegisteredWithServer:(BOOL)a3;
- (void)setServiceBundleName:(id)a3;
@end

@implementation AXUIClient

- (AXUIClient)initWithIdentifier:(id)a3 serviceBundleName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AXUIClient;
  v8 = [(AXUIClient *)&v14 init];
  if (v8)
  {
    v9 = objc_opt_new();
    v10 = +[AXUIClientConnection sharedClientConnection];
    uint64_t v11 = [v6 length];
    if (v7 && v11 && v9 && v10)
    {
      [(AXUIClient *)v8 setClientIdentifier:v6];
      [(AXUIClient *)v8 setServiceBundleName:v7];
      [(AXUIClient *)v8 setMessageSender:v9];
      [(AXUIClient *)v8 setClientConnection:v10];
      v12 = [(AXUIClient *)v8 clientConnection];
      [v12 registerConnectionStateObserver:v8];

      [v9 setDelegate:v8];
    }
    else
    {

      v8 = 0;
    }
  }
  return v8;
}

- (void)dealloc
{
  [(AXUIClient *)self _cleanUp];
  v3 = AXLogAssertions();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21F6DC000, v3, OS_LOG_TYPE_DEFAULT, "AXUIClient dealloc", buf, 2u);
  }

  v4.receiver = self;
  v4.super_class = (Class)AXUIClient;
  [(AXUIClient *)&v4 dealloc];
}

- (void)sendAsynchronousMessage:(id)a3 withIdentifier:(unint64_t)a4 targetAccessQueue:(id)a5 completion:(id)a6
{
}

- (void)sendAsynchronousMessage:(id)a3 withIdentifier:(unint64_t)a4 targetAccessQueue:(id)a5 completionRequiresWritingBlock:(BOOL)a6 completion:(id)a7
{
  BOOL v8 = a6;
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v12 = a5;
  id v13 = a7;
  id v14 = a3;
  [(AXUIClient *)self _requestInitializationMessageFromDelegateIfNeeded];
  id v15 = v12;
  v16 = v15;
  if (!v15)
  {
    v16 = 0;
    if (v13)
    {
      v17 = AXLogUI();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        int v19 = 138543618;
        v20 = self;
        __int16 v21 = 2048;
        unint64_t v22 = a4;
        _os_log_impl(&dword_21F6DC000, v17, OS_LOG_TYPE_INFO, "%{public}@ sending asynchronous message with identifier %lu and a completion handler but no target access queue; defaulting to the background access queue.",
          (uint8_t *)&v19,
          0x16u);
      }

      v16 = [MEMORY[0x263F21380] backgroundAccessQueue];
    }
  }
  v18 = [(AXUIClient *)self messageSender];
  [v18 sendAsynchronousMessage:v14 withIdentifier:a4 context:0 targetAccessQueue:v16 completionRequiresWritingBlock:v8 completion:v13];
}

- (id)sendSynchronousMessage:(id)a3 withIdentifier:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  [(AXUIClient *)self _requestInitializationMessageFromDelegateIfNeeded];
  v9 = [(AXUIClient *)self messageSender];
  v10 = [v9 sendSynchronousMessage:v8 withIdentifier:a4 context:0 error:a5];

  return v10;
}

- (void)messageSender:(id)a3 accessLaunchAngelConnectionForMessageWithContext:(void *)a4 usingBlock:(id)a5
{
  id v6 = a5;
  id v7 = [(AXUIClient *)self clientConnection];
  [v7 performLaunchAngelTask:v6];
}

- (void)messageSender:(id)a3 extractCustomDataFromXPCReply:(id)a4 numberOfKeyValuePairsForCustomData:(unint64_t *)a5
{
  id v6 = xpc_dictionary_get_value(a4, (const char *)*MEMORY[0x263F22200]);
  id v7 = v6;
  if (a5) {
    *a5 = v6 != 0;
  }

  return v7;
}

- (void)messageSender:(id)a3 processCustomDataFromXPCReply:(void *)a4
{
  id v6 = [(AXUIClient *)self messageSender];
  id v7 = [v6 messageSchedulingSerializationQueue];
  char v8 = [v7 canWriteInCurrentExecutionThread];

  if ((v8 & 1) == 0)
  {
    v9 = AXLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[AXUIClient messageSender:processCustomDataFromXPCReply:](self);
    }
  }
  v10 = a4;
  uint64_t v11 = v10;
  if (v10 && MEMORY[0x223C51BC0](v10) == MEMORY[0x263EF86E0] && xpc_BOOL_get_value(v11))
  {
    id v12 = [(AXUIClient *)self clientConnection];
    [(AXUIClient *)self setRegisteredWithServer:1];
    id v13 = [(AXUIClient *)self clientIdentifier];
    [v12 registerClient:self withIdentifier:v13];
  }
}

- (void)messageSender:(id)a3 willSendXPCMessage:(id)a4 context:(void *)a5
{
  id v6 = a4;
  id v7 = [(AXUIClient *)self messageSender];
  char v8 = [v7 messageSchedulingSerializationQueue];
  char v9 = [v8 canReadInCurrentExecutionThread];

  if ((v9 & 1) == 0)
  {
    v10 = AXLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[AXUIClient messageSender:willSendXPCMessage:context:](self);
    }
  }
  if (![(AXUIClient *)self isRegisteredWithServer])
  {
    uint64_t v11 = (const char *)*MEMORY[0x263F22230];
    id v12 = [(AXUIClient *)self serviceBundleName];
    xpc_dictionary_set_string(v6, v11, (const char *)[v12 UTF8String]);
  }
  id v13 = (const char *)*MEMORY[0x263F22210];
  id v14 = [(AXUIClient *)self clientIdentifier];
  xpc_dictionary_set_string(v6, v13, (const char *)[v14 UTF8String]);

  id v15 = [(AXUIClient *)self initializationMessage];
  if (v15)
  {
    id v19 = 0;
    v16 = (void *)[MEMORY[0x263F21408] copyXPCMessageFromDictionary:v15 inReplyToXPCMessage:0 error:&v19];
    id v17 = v19;
    if (v16)
    {
      xpc_dictionary_set_value(v6, (const char *)*MEMORY[0x263F22218], v16);
      [(AXUIClient *)self setInitializationMessage:0];
    }
    else
    {
      v18 = AXLogUI();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[AXUIClient messageSender:willSendXPCMessage:context:]((uint64_t)v17, v18);
      }
    }
  }
}

- (void)invalidate:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = AXLogAssertions();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    clientIdentifier = self->_clientIdentifier;
    *(_DWORD *)buf = 138412290;
    id v12 = clientIdentifier;
    _os_log_impl(&dword_21F6DC000, v5, OS_LOG_TYPE_DEFAULT, "AXUIClient sending Clean up message %@", buf, 0xCu);
  }

  uint64_t v7 = *MEMORY[0x263F221F8];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __25__AXUIClient_invalidate___block_invoke;
  v9[3] = &unk_26451F970;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [(AXUIClient *)self sendAsynchronousMessage:MEMORY[0x263EFFA78] withIdentifier:v7 targetAccessQueue:0 completion:v9];
}

uint64_t __25__AXUIClient_invalidate___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _cleanUp];
  v2 = AXLogAssertions();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_21F6DC000, v2, OS_LOG_TYPE_DEFAULT, "AXUIClient Clean up completed", v4, 2u);
  }

  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_cleanUp
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (self->_clientIdentifier)
  {
    v3 = AXLogAssertions();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      clientIdentifier = self->_clientIdentifier;
      *(_DWORD *)buf = 138412290;
      id v19 = clientIdentifier;
      _os_log_impl(&dword_21F6DC000, v3, OS_LOG_TYPE_DEFAULT, "AXUIClient Clean up %@", buf, 0xCu);
    }
  }
  v5 = [(AXUIClient *)self clientConnection];
  id v6 = [(AXUIClient *)self clientConnection];
  [v6 unregisterConnectionStateObserver:self];

  uint64_t v7 = [(AXUIClient *)self messageSender];
  id v8 = [v7 messageSchedulingSerializationQueue];
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  id v14 = __22__AXUIClient__cleanUp__block_invoke;
  id v15 = &unk_26451F998;
  v16 = self;
  id v17 = v5;
  id v9 = v5;
  [v8 performSynchronousWritingBlock:&v12];

  id v10 = [(AXUIClient *)self clientConnection];
  [v10 cleanUp];

  [(AXUIClient *)self setClientConnection:0];
  uint64_t v11 = [(AXUIClient *)self messageSender];
  [v11 setDelegate:0];

  [(AXUIClient *)self setMessageSender:0];
  [(AXUIClient *)self setServiceBundleName:0];
  [(AXUIClient *)self setClientIdentifier:0];
  [(AXUIClient *)self setInitializationMessage:0];
}

uint64_t __22__AXUIClient__cleanUp__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isRegisteredWithServer];
  if (result)
  {
    id v4 = *(void **)(a1 + 32);
    v3 = *(void **)(a1 + 40);
    v5 = [v4 clientIdentifier];
    [v3 unregisterClient:v4 withIdentifier:v5];

    id v6 = *(void **)(a1 + 32);
    return [v6 setRegisteredWithServer:0];
  }
  return result;
}

- (void)_requestInitializationMessageFromDelegateIfNeeded
{
  v3 = [(AXUIClient *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v10 = 0;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x2020000000;
    char v13 = 0;
    id v4 = [(AXUIClient *)self messageSender];
    v5 = [v4 messageSchedulingSerializationQueue];

    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __63__AXUIClient__requestInitializationMessageFromDelegateIfNeeded__block_invoke;
    v9[3] = &unk_26451F9C0;
    v9[4] = self;
    void v9[5] = &v10;
    [v5 performSynchronousReadingBlock:v9];
    if (!*((unsigned char *)v11 + 24))
    {
      id v6 = objc_opt_new();
      [v3 userInterfaceClient:self willActivateUserInterfaceServiceWithInitializationMessage:v6];
      if ([v6 count])
      {
        v7[0] = MEMORY[0x263EF8330];
        v7[1] = 3221225472;
        v7[2] = __63__AXUIClient__requestInitializationMessageFromDelegateIfNeeded__block_invoke_2;
        v7[3] = &unk_26451F998;
        v7[4] = self;
        id v8 = v6;
        [v5 performSynchronousWritingBlock:v7];
      }
    }

    _Block_object_dispose(&v10, 8);
  }
}

uint64_t __63__AXUIClient__requestInitializationMessageFromDelegateIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isRegisteredWithServer];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __63__AXUIClient__requestInitializationMessageFromDelegateIfNeeded__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setInitializationMessage:*(void *)(a1 + 40)];
}

- (void)clientConnection:(id)a3 didChangeConnectedState:(BOOL)a4
{
  id v5 = a3;
  id v6 = [(AXUIClient *)self clientConnection];

  if (v6 == v5 && ([v5 isConnected] & 1) == 0)
  {
    uint64_t v7 = [(AXUIClient *)self messageSender];
    id v8 = [v7 messageSchedulingSerializationQueue];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __55__AXUIClient_clientConnection_didChangeConnectedState___block_invoke;
    v11[3] = &unk_26451F9E8;
    v11[4] = self;
    [v8 performSynchronousWritingBlock:v11];

    id v9 = [MEMORY[0x263F21380] backgroundAccessQueue];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __55__AXUIClient_clientConnection_didChangeConnectedState___block_invoke_2;
    v10[3] = &unk_26451F9E8;
    v10[4] = self;
    [v9 performAsynchronousWritingBlock:v10];
  }
}

uint64_t __55__AXUIClient_clientConnection_didChangeConnectedState___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isRegisteredWithServer];
  if (result)
  {
    v3 = [*(id *)(a1 + 32) clientConnection];
    id v4 = *(void **)(a1 + 32);
    id v5 = [v4 clientIdentifier];
    [v3 unregisterClient:v4 withIdentifier:v5];

    id v6 = *(void **)(a1 + 32);
    return [v6 setRegisteredWithServer:0];
  }
  return result;
}

void __55__AXUIClient_clientConnection_didChangeConnectedState___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector()) {
    [v2 connectionWithServiceWasInterruptedForUserInterfaceClient:*(void *)(a1 + 32)];
  }
}

- (NSString)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [(AXUIClient *)self clientIdentifier];
  uint64_t v7 = [v3 stringWithFormat:@"<%@: %p clientIdentifier = \"%@\">", v5, self, v6];;

  return (NSString *)v7;
}

- (AXUIClientDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AXUIClientDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)serviceBundleName
{
  return self->_serviceBundleName;
}

- (void)setServiceBundleName:(id)a3
{
}

- (AXUIMessageSender)messageSender
{
  return self->_messageSender;
}

- (void)setMessageSender:(id)a3
{
}

- (AXUIClientConnection)clientConnection
{
  return self->_clientConnection;
}

- (void)setClientConnection:(id)a3
{
}

- (BOOL)isRegisteredWithServer
{
  return self->_registeredWithServer;
}

- (void)setRegisteredWithServer:(BOOL)a3
{
  self->_registeredWithServer = a3;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setClientIdentifier:(id)a3
{
}

- (NSDictionary)initializationMessage
{
  return self->_initializationMessage;
}

- (void)setInitializationMessage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initializationMessage, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_clientConnection, 0);
  objc_storeStrong((id *)&self->_messageSender, 0);
  objc_storeStrong((id *)&self->_serviceBundleName, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)messageSender:(void *)a1 processCustomDataFromXPCReply:.cold.1(void *a1)
{
  v1 = [a1 messageSender];
  id v2 = [v1 messageSchedulingSerializationQueue];
  v3 = [v2 label];
  OUTLINED_FUNCTION_0(&dword_21F6DC000, v4, v5, "This code must execute in a writing block on AXAccessQueue: %@", v6, v7, v8, v9, 2u);
}

- (void)messageSender:(uint64_t)a1 willSendXPCMessage:(NSObject *)a2 context:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21F6DC000, a2, OS_LOG_TYPE_ERROR, "Failed to convert initialization message to XPC object: %{public}@.", (uint8_t *)&v2, 0xCu);
}

- (void)messageSender:(void *)a1 willSendXPCMessage:context:.cold.2(void *a1)
{
  v1 = [a1 messageSender];
  int v2 = [v1 messageSchedulingSerializationQueue];
  uint64_t v3 = [v2 label];
  OUTLINED_FUNCTION_0(&dword_21F6DC000, v4, v5, "This code must execute in a reading (or writing) block on AXAccessQueue: %@", v6, v7, v8, v9, 2u);
}

@end